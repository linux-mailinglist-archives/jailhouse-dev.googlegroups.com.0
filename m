Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB2UGRGPQMGQEW4XNNJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2237168D698
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:19 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id 21-20020a2e1655000000b002930f122050sf1050673ljw.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772778; cv=pass;
        d=google.com; s=arc-20160816;
        b=SNtE3G09482ECJ4u0ef5DV86kqpDtRVgy7NJ5rVcxzPgKt/LmZGL088VN/lsqIN7+A
         5Mamah1yHt56RgIZk4a7bWgav3MjuKsN27KUbCL0T4E7qC4Gb2fzGC4zX4W7nupxs41R
         Y7nLb8NlKpdlxgB56M2d70XV1Hx+3/43K0g/SxGQDpM+ZoXAWeRdB4Sl8xBScH635R2q
         9GCAyjBOnh8M6T06++LJZiKbxsWfhknTk6TWen539fAc6SBUEfx4QBaGB30WEF/iYa1t
         boqyPwd6gC8qiS1EJykMfzjp+BdYbKZJQQ+R+RBv8+afBbvVshU/Ny4gGFbo5EZRiURw
         xrVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=QWOyRErkHCxUXJVCezR+7Q/nIO98MK2YRJmqJ0baqvc=;
        b=Ze0VLkgav+vg0nq/kCT76WPPgXOKx9pJuGTKa38L+KMFV5Ktd11VRNSRdWUjZFLsj6
         vDlDpnlwY1KJ/wZY2yLXy5dEPRhiEIALRA+NXjxLQGKiIrLzD4SWPrURH+Jil7osoaWj
         dQxvfMuxGciwNKRmn2nDabDPxZ1hzX37vqSB6klk1AdSN0oYL3oLUjeCPxY8OUehztVR
         Q4yiuEdcRSxgMMn0s2ksRfc5D7PzTfHVO/IzVNfOPam5/DinoJTLdC7yVtA9IH065vzM
         RvbsWfNrgLfrzUvec2VnqM+xADbltCeWkg5Mu7KWedWldn5N8WruKNhY1uKNJrK9sOcR
         YrFg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWOyRErkHCxUXJVCezR+7Q/nIO98MK2YRJmqJ0baqvc=;
        b=RSpKU+VcqzqTzmJPe3YklRy97W/245E7oLpnV9Vz1r7+8roMN9BKmh9YiJieOLkbPS
         L+UOCchzfh0O/bpTMOAqIwLYkl0464MGP1RKE6wAWHCHJVgXYpC6nXvyyAdAIuKlJtIZ
         zQkLFax2FPl3eVyZY72kDf00AQNkG3sTRwGAutGEHBz4todFsZ10P6AUe2jWr+jzBLAV
         Rzd1iCQ5JDUaiiKf0R1Z1dYVQ2iQuj7hj3Gs/XQkY62qAWPsM6AkNFnOqry0/w3ANowR
         uLYhneHnX6S5lrVpYNiLMuix2HTpTF9y+HqsQrj2GVlYjQ7Nqpq/5uTGr3bBLSTBjOnQ
         EQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWOyRErkHCxUXJVCezR+7Q/nIO98MK2YRJmqJ0baqvc=;
        b=LiO45ORaDdaYMkMBCa7xgTRMSqRrLPFfpLMbKRbzvJgQRtE/a+ei5LYD0+fWDDqgV4
         uwhcml2fitgq2WBRv35zars4pTYVcFhpLLCRgQuEqp34zAmNX4NFAdzafA9G3kU4gqqx
         lmPGvQ99xh05g+NTdPhALVW/D5G//ur0pzZQ8t6bdc8+MjgQlpqTtYswuoW7JjWkvweE
         8+6ZPl3YJn92pnAo+s5TXsdD2pJbI5cCt4AggsxdDgDoD0nwPBHuc0pXBao/H/6BUalQ
         CQGYKLUWagB27hFAstfIHIzyUnI8Es8rcg0VPvt71KGkiNOYqrMh5iwB9Hscznc8xknH
         WhSg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKVx3kywUaMkuCYabkkt50BbfTPTCSFI6vPJ/2JBXP+sAdfmqD4Y
	+5htUNuP6bHQGXOFgto1TWk=
X-Google-Smtp-Source: AK7set+xSlRmNvmmSJd+rXdLdAkfQlIhpjIpzKokQb8F/WDFpwz6NQQrbr12y8e4K5ylodOt2tLwQA==
X-Received: by 2002:a2e:1652:0:b0:290:66c2:b2d9 with SMTP id 18-20020a2e1652000000b0029066c2b2d9mr573704ljw.157.1675772778707;
        Tue, 07 Feb 2023 04:26:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:4006:b0:4cf:ff9f:bbfd with SMTP id
 br6-20020a056512400600b004cfff9fbbfdls72458lfb.1.-pod-prod-gmail; Tue, 07 Feb
 2023 04:26:16 -0800 (PST)
X-Received: by 2002:ac2:4113:0:b0:4cc:9736:3551 with SMTP id b19-20020ac24113000000b004cc97363551mr745160lfi.31.1675772776893;
        Tue, 07 Feb 2023 04:26:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772776; cv=none;
        d=google.com; s=arc-20160816;
        b=wWS8k3mHZJ/0NQPCXmDtek7uSoQOr8GCDCqN3V6iaTdr9zUIIt4PVBkQg686X4C5KT
         SWN8o2osaN4qP2g6vd+Cue3YnJW/Pe3Q3zW38MrJAVop4K7ZFP5oWU0Gkbqe3Id8dwDr
         ZsC8u3BzEHJRixCITEyjPcK3bp6eNjWTxdRRwLOPtR7JF8MO5TdMAehausg8hd9bkzeA
         4zQaP7J8Z3giNX10zNnNGLMCm1Y1tbbwOsKYbambVvoQvsvTQEtXWlOU0d2/z2ynVs17
         vJ9xoUJmhYbEIxgZTf7qxd81OUcP7Moea6fL/6BpvxW9t9Ln9ivb3eU8lav/sKu3Euo9
         RsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Xp3AhFK922gTOQ2z8qa9SLjYD3s/tAYNDnc4LkDle/E=;
        b=dflCdW7HwjijbOn7ESwfjknyxy11TQCz0DjJ/8fAut5GgTbmPrXioBqRbd2u/B+MGS
         kY1c6XUlo7RiZtNeRIZ3oSorxjK0+7/m2dsM1H7nfg2D+5i4nW9e/Bvd1aVPHFNj0SX8
         53bx1NSJGdrFBVmUAiKUN6m2lohdborx+N0OH4oc5AD38I5buhgK1w7yFXm8hHzCOJ+h
         ARMiMH+2AtXgmTS7VGEEHnEVgaaOxHKNrr8Krq0QwnplKhVIeB9Ftqua3oRQVoQu2r0H
         03W9VIMwu01fE7e0cVEwBciAnjuG74ZazwnY0+wrIH8JK/PhMOnXlCbqbJ8Qu2gOxZ6L
         ARPw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id c19-20020a056512075300b004ce3ceb0e80si750365lfs.5.2023.02.07.04.26.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:16 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RX0kKwzy6b;
	Tue,  7 Feb 2023 13:26:16 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 39/47] configs: riscv: qemu: Add linux-demo
Date: Tue,  7 Feb 2023 13:25:35 +0100
Message-Id: <20230207122543.1128638-40-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, BODY_SIZE_6000_6999 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0,
 __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
 configs/riscv/qemu-linux-demo-plic.c         |   2 +
 configs/riscv/qemu-linux-demo.h              | 102 +++++++++++++++++
 3 files changed, 216 insertions(+)
 create mode 100644 configs/riscv/dts/qemu-linux-inmate-plic.dts
 create mode 100644 configs/riscv/qemu-linux-demo-plic.c
 create mode 100644 configs/riscv/qemu-linux-demo.h

diff --git a/configs/riscv/dts/qemu-linux-inmate-plic.dts b/configs/riscv/dts/qemu-linux-inmate-plic.dts
new file mode 100644
index 00000000..268d5a63
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
+		linux,initrd-end = <0x82200000>;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* 63MiB @ 0x80000000 */
+		reg = <0x00000000 0x80000000>, <0x00000000 0x3f00000>;
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
index 00000000..7da16c05
--- /dev/null
+++ b/configs/riscv/qemu-linux-demo.h
@@ -0,0 +1,102 @@
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
+			.phys_start = 0xbf800000,
+			.virt_start = 0x0,
+			.size = 1 * 1024 * 1024,
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
+			.phys_start = 0xbb800000,
+			.virt_start = 0x80000000,
+			.size = 64 * 1024 * 1024,
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
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-40-ralf.ramsauer%40oth-regensburg.de.
