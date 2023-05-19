Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBXN5T6RQMGQEJSKAQOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 9581470A0EB
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:02 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id 5b1f17b1804b1-3f4245ffbb4sf20985875e9.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528862; cv=pass;
        d=google.com; s=arc-20160816;
        b=phdhkHvdRzOKgRhroI388Y4KV1C3s+2iourmtdPQJrrptnYq8wlJFYNpoTTEl+i9da
         vrsx6IQ6UrpIsGI18Z4RkosF7aN+nixts2txTC9UV7rmXJ1PMTKMUr1vYb86UJ5ULOgP
         F/E2/MPXflfZxWmCwmk061AK44MAh66F2aw9+mmLgaP1a38A73uHSvjWAPj07jm9JdCu
         mR23gzaq8ARjKE2KokWqBNn0D4bAQ8V5Ay0PcV58DVEemKdiwRXpBDf0JoMIT/h6wiRR
         0CZ+fd1OG1gUeoolJ5gjzZg16p4C+d9HCuHnaqX5xtlNHQ3HYHbB2BftdWYTUqAOxSK7
         m6Hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=P3qCb6ZwxuOarF7oO7HM/tNqyuWwy6aecMSNQFEJ08o=;
        b=yX2zM6Nv0XToaX8aJn/SwE4O//SR1VbHHcvdjuexQhhAulnkRHd22rfREmheLv7B20
         qFLXZQnIJSuwDgwaz8jYxC5zNTajpGzsBNS55P+jjfQYB0k2aLlmUhKHN8PTZHZqr8gH
         10tiqQiuBs1ARU9dySfIbKsdYOK7+lyLNgVI7+mv7x2LP/u1lmRQshZyj/4J2ppvcEi2
         hLkm0rgFYl0dIIlRkBvzr5axTrA5bmxn8+qTJ9I07tt4j/EZzddf/jAmpuVcZo5kTj1D
         UyRRv9gWsDa0QGJbWehRoRhIIJit06TP3vWKR0FOb9+W33Ax3EWdSFfAd1IuVlBYTvxD
         FGgA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528862; x=1687120862;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P3qCb6ZwxuOarF7oO7HM/tNqyuWwy6aecMSNQFEJ08o=;
        b=T4w8RpxJlqEk5wzzo8vdCzCkNVpWymEjN11ZiaHnc6rEIivCkx6t0EA+cDAdsrq+6i
         mJ0fIyhzQA62dJTX4Gk62IAkq8exL8/CMLEmtPYTKK36R8YurEvUQmfNEyzNXivwqRbE
         FQwmxYOEawAfM9DP3+reS6j5qHFK6MHWlMhMidh1PR3fCNs3tk5rsIe4CIutL23TltSH
         LfbdzR8UYPTuYAseKegW8Vikt76kfBNvLY05yNa/9mNQ8fBbwd3tVHpzntE/PDx05saF
         7HauFmUp21QZaE6qBnKdBi5TM8Z+ZZpUA3yQi3v8TdC/HsyANipcNhfSIUI3XPMNOprW
         ChHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528862; x=1687120862;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3qCb6ZwxuOarF7oO7HM/tNqyuWwy6aecMSNQFEJ08o=;
        b=doya1k/zR7WgJgXQwyuQ8CAm9VsjjWxUX21KSbAV3bjvO2lWlm3ocmgHpe+sqQM2/j
         wcmNovsTdFgNVpN2UKgTiD0eH1CP9gQWtLprwSulD19VhYlARv2EQItFBfee54klWzkb
         Q9NHS1RxkfGJucJV/hYhr3zmHeZ3OPlm4YxkaxorI2yvG33gkLJn+ejZ1zZSK04ei+sW
         fwSmcd8Wx3Se/9zRh/HJ99YdRb8WVTMixJry2oFx3TpMLQjrQFcLpgT1AURMqafThq+K
         Yp33hM4HlIxgNTZM0rtu8ZTbwSqAWJ3wdA+2B90h0ME8wsiM4ql67yQB7ylfw+YJwEx5
         xJKQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwukJeS6eJX67zsnAITrPEWRnN534Z0dd6v90Ah0ZUD3nQWDPg9
	1SOSCAAsn/U23nm6Ll3hXgA=
X-Google-Smtp-Source: ACHHUZ5jpV3VySYFS27Vvlkp3JUJGi8Lrbi4Ws641ETwgy9HFZ2GvrxBaV4lRDn0gke3VShOG/naAQ==
X-Received: by 2002:a1c:f712:0:b0:3f5:d6e:b122 with SMTP id v18-20020a1cf712000000b003f50d6eb122mr506661wmh.3.1684528862463;
        Fri, 19 May 2023 13:41:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1da1:b0:3f4:3566:4c44 with SMTP id
 p33-20020a05600c1da100b003f435664c44ls1428796wms.0.-pod-prod-04-eu; Fri, 19
 May 2023 13:41:00 -0700 (PDT)
X-Received: by 2002:adf:dccc:0:b0:307:809b:614a with SMTP id x12-20020adfdccc000000b00307809b614amr2385002wrm.29.1684528860666;
        Fri, 19 May 2023 13:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528860; cv=none;
        d=google.com; s=arc-20160816;
        b=fRQtxlL+NDztgnMzoKM+XH56ByVgO7t2Ftg65sPi8NbUoHh3bhSdSS1Q7JA+ezWZyf
         Eoy7lTYMAbLoSvflA8iQvo2z5a7uAiZxmKbtQpZfA9myLCVq6I0Vy5W+9Og5GB9hmVk4
         kVOsCCYURyqZbtT/JU/wEsoT41vYD2IIuadUREPVJU36+wRIlHC98rBxmh5PoulI4em/
         /Y5ypTXL9AOkinXzzhd43UuwcrEnAMupHFQijZ8HpaKf1G6JfTsW9StbMRRa2ugKUu+4
         VWNQA4M2UQAjy6Wk8CmEk6gZhyb1rdy2/XTcrZBOK9GuYcHOejXrDKLXrzLxMhBEzMGZ
         6nAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=aNV61imfIpZABn718lxo9yLGb2/F1mn2JwHr3lx0p+I=;
        b=DvL29xauyYtMgK4ipqIqGUTUUNf6tj2qdQjFA39TdyUsVqq2+KL7hU6en6fUfqS//r
         2pzVNXJYUBaGbuYMhZDTicY4IUGl7OBkx7jdW/dQuXBVpnZ0SqhKNo4VCmwDqaj4c287
         L0su7EX6DDbIZ0IMnz3tdYMeMar2Dns/OzUbg9s5rz/k3sCE85C1Ev/A1f12OTnmxvzI
         hkdhpyiIMZqCtPhubUkqIzebEybThl1k+ohydE3dtQ3jawB9K4nI22aLmQIyf5OcSgcQ
         JOJA8sjGfoSMDMgC/8VoHRxW4z0DGdcJPUcQ3vHFP9cwInvSMQCjyNss/FmIqUCnbJYJ
         duRA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id p30-20020a05600c1d9e00b003f42314cbc2si296731wms.2.2023.05.19.13.41.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdl4w2nzxr0;
	Fri, 19 May 2023 22:40:59 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 58/73] configs: riscv: qemu: Add linux-demo
Date: Fri, 19 May 2023 22:40:18 +0200
Message-Id: <20230519204033.643200-59-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Content-Type: text/plain; charset="UTF-8"
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[RFC v2: fix typo]
---
 configs/riscv/dts/qemu-linux-inmate-plic.dts | 112 +++++++++++++++++++
 configs/riscv/qemu-layout.h                  |   6 +
 configs/riscv/qemu-linux-demo-plic.c         |   2 +
 configs/riscv/qemu-linux-demo.h              | 103 +++++++++++++++++
 4 files changed, 223 insertions(+)
 create mode 100644 configs/riscv/dts/qemu-linux-inmate-plic.dts
 create mode 100644 configs/riscv/qemu-linux-demo-plic.c
 create mode 100644 configs/riscv/qemu-linux-demo.h

diff --git a/configs/riscv/dts/qemu-linux-inmate-plic.dts b/configs/riscv/dts/qemu-linux-inmate-plic.dts
new file mode 100644
index 00000000..4a47766d
--- /dev/null
+++ b/configs/riscv/dts/qemu-linux-inmate-plic.dts
@@ -0,0 +1,112 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+/dts-v1/;
+/ {
+	model = "Jailhouse cell on RISC-V";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	chosen {
+		stdout-path = "/soc/uart@10000000:115200n8";
+		bootargs = "console=ttyS0 earlycon=sbi";
+		linux,initrd-start = <0x82000000>;
+		linux,initrd-end = <0x83000000>;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* 63MiB @ 0x80000000 */
+		reg = <0x00000000 0x80000000>, <0x00000000 0x8000000>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <0x989680>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			reg = <0>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,isa = "rv64imafdc_zicsr_zifencei_zihintpause_zawrs_zba_zbb_zbc_zbs_sstc";
+			mmu-type = "riscv,sv39";
+
+			cpu0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			reg = <1>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,isa = "rv64imafdc_zicsr_zifencei_zihintpause_zawrs_zba_zbb_zbc_zbs_sstc";
+			mmu-type = "riscv,sv39";
+
+			cpu1_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+	};
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		uart@10000000 {
+			interrupts = <10>;
+			interrupt-parent = <&plic0>;
+			clock-frequency = "\08@";
+			reg = <0x00 0x10000000 0x00 0x100>;
+			compatible = "ns16550a";
+			status = "okay";
+		};
+
+		plic0: plic@c000000 {
+			compatible = "sifive,plic-1.0.0\0riscv,plic0";
+			reg = <0x00 0xc000000 0x00 0x210000>;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+			interrupts-extended =
+				<&cpu0_intc 11>, <&cpu0_intc 9>,
+				<&cpu1_intc 11>, <&cpu1_intc 9>;
+			interrupt-controller;
+			riscv,ndev = <0x35>;
+		};
+
+		pci@30000000 {
+			compatible = "pci-host-ecam-generic";
+			device_type = "pci";
+			bus-range = <0 0>;
+			#interrupt-cells = <1>;
+			reg = <0x0 0x30000000 0x0 0x10000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <
+				0x1000000 0x00 0x00 0x00 0x3000000 0x00 0x10000
+				0x2000000 0x00 0x40000000 0x00 0x40000000 0x00 0x40000000
+				0x3000000 0x04 0x00 0x04 0x00 0x04 0x00>;
+
+			interrupt-map-mask = <0>;
+			interrupt-map = <0 0 0 1 &plic0 32 0>;
+		};
+	};
+};
diff --git a/configs/riscv/qemu-layout.h b/configs/riscv/qemu-layout.h
index 8f4d4554..02e9ba51 100644
--- a/configs/riscv/qemu-layout.h
+++ b/configs/riscv/qemu-layout.h
@@ -26,3 +26,9 @@
 
 #define INMATE_TINY_SIZE	MIB
 #define INMATE_TINY_PHYS	(IVSHMEM_NET_PHYS - INMATE_TINY_SIZE)
+
+#define INMATE_LINUX_LOW_SIZE	(MIB)
+#define INMATE_LINUX_LOW_PHYS	(INMATE_TINY_PHYS - INMATE_LINUX_LOW_SIZE)
+
+#define INMATE_LINUX_HIGH_SIZE	(128 * MIB)
+#define INMATE_LINUX_HIGH_PHYS	(INMATE_LINUX_LOW_PHYS - INMATE_LINUX_HIGH_SIZE)
diff --git a/configs/riscv/qemu-linux-demo-plic.c b/configs/riscv/qemu-linux-demo-plic.c
new file mode 100644
index 00000000..f4c0331a
--- /dev/null
+++ b/configs/riscv/qemu-linux-demo-plic.c
@@ -0,0 +1,2 @@
+#define QEMU_PLIC
+#include "qemu-linux-demo.h"
diff --git a/configs/riscv/qemu-linux-demo.h b/configs/riscv/qemu-linux-demo.h
new file mode 100644
index 00000000..d86fdae0
--- /dev/null
+++ b/configs/riscv/qemu-linux-demo.h
@@ -0,0 +1,103 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for RISC-V Linux inmate on QEMU
+ *
+ * Copyright (c) OTH Regensburg 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+#include "qemu-layout.h"
+
+struct {
+	struct jailhouse_cell_desc cell;
+	struct jailhouse_cpu cpus[2];
+	struct jailhouse_memory mem_regions[4];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[0];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_RISCV64,
+		.name = "linux-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
+			JAILHOUSE_CELL_TEST_DEVICE |
+			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
+
+		.num_cpus = ARRAY_SIZE(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+
+		.console = {
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.size = 0x1000,
+			.address = 0x10000000,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO | JAILHOUSE_CON_REGDIST_1,
+		},
+
+		.vpci_irq_base = 32,
+	},
+
+	.cpus = {
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+	},
+
+	.mem_regions = {
+		/* RAM low */ {
+			.phys_start = INMATE_LINUX_LOW_PHYS,
+			.virt_start = 0x0,
+			.size = INMATE_LINUX_LOW_SIZE,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x00100000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+		/* RAM high */ {
+			.phys_start = INMATE_LINUX_HIGH_PHYS,
+			.virt_start = 0x80000000,
+			.size = INMATE_LINUX_HIGH_SIZE,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* uart@10000000 */ {
+			.phys_start = 0x10000000,
+			.virt_start = 0x10000000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+	},
+
+	.pci_devices = {
+	},
+
+	.irqchips = {
+		/* PLIC */ {
+#ifdef QEMU_PLIC
+			.address = 0xc000000,
+#endif
+			.pin_base = 0,
+			.pin_bitmap = {
+				(1 << 0xa), 0, 0, 0,
+			},
+		},
+	},
+};
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-59-ralf.ramsauer%40oth-regensburg.de.
