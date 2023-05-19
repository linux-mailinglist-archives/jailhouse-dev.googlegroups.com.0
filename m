Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZN5T6RQMGQESJOWSDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F7070A0F5
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:10 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id 38308e7fff4ca-2af08de8c2fsf20009061fa.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528870; cv=pass;
        d=google.com; s=arc-20160816;
        b=JHRt/iNoQpbau6S1yJ/AZbCTPdytgzJMh5FbhsxKViytXcVZgRDv9tCIiLjmkMhfXm
         6LqB9aAhI6cgjkdIvc+UfCatfUsJb7G7x+L2qPHGUnLdvf8O1SiMv0QmgmpYo/PScCJH
         VZjZgsU2nDbdFhzh1/cstaVZNVgg3hP8XxC2NuUw/Tb52dfVGG4rle2Ns3JtM90HvKR+
         qtFsU5t8WYsh2BFWP6cDEOm8s6EUnQph0ckzryPENVNk7QOpcrPkoWsFoOSoQnTsZ7s3
         GFAk5KN16AIH3tnl3TxhzR6SafnHHMyz4w1wdmdlzAsWmPW2JdvObCaJQ3rVCgQt3yBj
         T2eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=8dZapkf97DOVTvroyFe69ZdmlRpUvRN+jREuJ9fwD2g=;
        b=Z4MydTWkwSYQEKXjodnox37jn8UJascVqQGrI893enCliraons6y9/ccSDcPbCYD/R
         KYKyrMavyPMuSSXfT+BPVMSvNyMV0LBdJ+J51SElAPfczVq0Gmu3o1ikSQjiwZlDucEi
         koWP2Aou1/xbxseRasRbCXgD0up8/JgEuo2PBI4IN/NhgtNDhpFscHBpw5q4b1tFg/l+
         x6K/7CjrV5vaSXM37a3ZAhf+kOLOmlx+JyO3tU4GFOhf07QJBItka/ibef2gdvCQdWd1
         RXnZjuL4L7xqK35ZsV2yCdA9aQRl2nVbdjkOSiaI0o6LJtR8V6pneRiOCsFLgPx6SY78
         Zy2A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528870; x=1687120870;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dZapkf97DOVTvroyFe69ZdmlRpUvRN+jREuJ9fwD2g=;
        b=ou5HQgrNzodpp8ksbunemrSEPdTgYutoT6Yrf4Hrz7apegkX0WgMU7PQe0urfhN4eT
         +k3qDbVie8hzoHGAAFgBbHtxYTtA9kMffxmTjTYW6Mo7IJlSZfOW1gVHbYx4Le7nI9ij
         hKc9ogGNtVFmq9L22hebxlLeUKqQ9ZKEFmAONRGSzz4TNozSLgCfheT9rpLUFnAcLRKt
         Ly/z8MXn4DGptUgLCu04mCYupPzz0+Bh3jIASqlQ5wGY0jQfbOIgSNIMdW2EOAEXh7iH
         THe/H52VLkfyMRaRg2Q35IBsWNaCHJ9cDNND7b1emQ8QPO7r+XKLMLYhtJPqsf0hy3VO
         aaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528870; x=1687120870;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dZapkf97DOVTvroyFe69ZdmlRpUvRN+jREuJ9fwD2g=;
        b=FXuylGhcRA3DcIgxLeharQLHEziJ0UdxqJHd+k/yaPzOUIOyikwb3cHhiR6YZQ9nwH
         GKip26X8MqYw5CSaMkvqlmMHtASFRdwJovWx0DWUC5r0U2Ms3yDuJIRwSElWshGcTV75
         HMnyz6p1MKNchFESKg5gr0nCvpvRLjSQfJsAs26anKBV2AHdD18q78WdFcU1Rw7Ca6bV
         84Sz5j/8uBtJ7I30VHb1rszThmGmE0UPpNP71tOHlMBChrMKJw+FlY0Jn5lXRNpG4zb/
         mD4jGQwL7zhzbWylN0tiDotR464Vbm848+2C0S15ND0ALZxekWIiz8FT3P4sLMTV5Gqd
         7pTQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDzEfN46UowyNLp/35e4V1CU38eStORDhQjljPl3USmpPmRpUDUG
	A2aNfGzvvqYL5TAeuyhpmKgygA==
X-Google-Smtp-Source: ACHHUZ4yDJOs144xhPvdXDt9yDL6Ej6sOtOFGD3mWLh9iXZuaJSHvrDUy/e0N/w0ox/0NJKuR80hiQ==
X-Received: by 2002:a05:651c:14b:b0:2af:3f7:5ecc with SMTP id c11-20020a05651c014b00b002af03f75eccmr767355ljd.2.1684528870079;
        Fri, 19 May 2023 13:41:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3285:b0:4f2:71a1:53f1 with SMTP id
 p5-20020a056512328500b004f271a153f1ls848717lfe.0.-pod-prod-01-eu; Fri, 19 May
 2023 13:41:08 -0700 (PDT)
X-Received: by 2002:ac2:46c5:0:b0:4ef:d573:c8a7 with SMTP id p5-20020ac246c5000000b004efd573c8a7mr1297009lfo.32.1684528868012;
        Fri, 19 May 2023 13:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528867; cv=none;
        d=google.com; s=arc-20160816;
        b=vP70xmI+gHTzu7CsxKIzZ/7QBC3tZyXca27rxn/HRpP8bdWzAm1ihDzKoRVfcm5NT/
         pCXffPQt5YjLL41mR63S85Ne3KzTt4SC5iR+yjyYKo7lSQYKRR3HGhdxdkvWRTVkLECL
         QCS5U1Q/x3612QVmhiZ9bWrtZGMAsDLOKXrimYSgNSfkRt4OPZopvzpT/ELhxVS6OsOh
         AQr0B9vWwaKLlq1cwmBm2kyMoJVxnjdpA78V1aZ0MxQImcyj5DYi/sT3UxluQeQfClcK
         Og5lVhr3xQ966OZerQbqyYGY80myPYhgkPgK22baS4HnnjzLWPSo0X+UrdxzdOCT1sxy
         F8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=i4YWUaRjbQVdCumO0ODKiRlTqPXF5ayIZQA6UI1pNag=;
        b=s0kesX2NGI0zzwrefdAgD6lgrcoLRGurjo91OBKZFm5FdrQAiAcyMQuHP/Pvtbi4vu
         aF3noXO3HqF16waiOr9jlk20m+99EhFQUKT6dlNg3jhy3GhbzmHN+ybl9tJoTxBaLDyh
         Dm71B4kEOIR9On5wCXFdXKKMik//kbrZqyIJErBdNvQJ3iSyMlXfGMFJFwJ/ESE/kmku
         L54pUM7jQTVZuxS9Ed3gyS18PL73PbV0bEHbURwelex734dqGLjQl7ONuYotZmnSc/YE
         iU4JtJxCRryQRt8vC7555kxihK4YO6qIG1L93e4ajpolqN6dCebP8WOosvuUWcO7oufj
         RYEQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id s18-20020a2ea712000000b002a79f4b8367si336533lje.2.2023.05.19.13.41.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdt3krpzyNk;
	Fri, 19 May 2023 22:41:06 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 67/73] configs: riscv: add configs for APLIC+IMSIC
Date: Fri, 19 May 2023 22:40:27 +0200
Message-Id: <20230519204033.643200-68-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

Idea is as follows: Specify the target VS-file in the configuration, and
use simple memory regions to overlay the S-Mode file.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 .../dts/qemu-linux-inmate-aplic-imsic.dts     | 124 ++++++++++++++++++
 configs/riscv/qemu-aplic-imsic-mc.c           |   5 +
 configs/riscv/qemu-aplic-imsic-uc.c           |   5 +
 configs/riscv/qemu-imsic.h                    |  46 +++++++
 configs/riscv/qemu-inmate-demo-aplic-imsic.c  |   3 +
 configs/riscv/qemu-inmate-demo.h              |   1 +
 configs/riscv/qemu-linux-demo-aplic-imsic.c   |   4 +
 configs/riscv/qemu-linux-demo.h               |  15 ++-
 configs/riscv/qemu.h                          |  39 +++++-
 hypervisor/arch/riscv/include/asm/irqchip.h   |  15 +++
 include/jailhouse/cell-config.h               |   5 +
 pyjailhouse/config_parser.py                  |   2 +-
 12 files changed, 259 insertions(+), 5 deletions(-)
 create mode 100644 configs/riscv/dts/qemu-linux-inmate-aplic-imsic.dts
 create mode 100644 configs/riscv/qemu-aplic-imsic-mc.c
 create mode 100644 configs/riscv/qemu-aplic-imsic-uc.c
 create mode 100644 configs/riscv/qemu-imsic.h
 create mode 100644 configs/riscv/qemu-inmate-demo-aplic-imsic.c
 create mode 100644 configs/riscv/qemu-linux-demo-aplic-imsic.c

diff --git a/configs/riscv/dts/qemu-linux-inmate-aplic-imsic.dts b/configs/riscv/dts/qemu-linux-inmate-aplic-imsic.dts
new file mode 100644
index 00000000..462c784f
--- /dev/null
+++ b/configs/riscv/dts/qemu-linux-inmate-aplic-imsic.dts
@@ -0,0 +1,124 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2023
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
+			riscv,isa = "rv64imafdc_zicsr_zifencei_zihintpause_zawrs_zba_zbb_zbc_zbs_smaia_ssaia_sstc";
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
+			riscv,isa = "rv64imafdc_zicsr_zifencei_zihintpause_zawrs_zba_zbb_zbc_zbs_smaia_ssaia_sstc";
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
+			interrupts = <10 4>;
+			interrupt-parent = <&aplic0>;
+			clock-frequency = "\08@";
+			reg = <0x00 0x10000000 0x00 0x100>;
+			compatible = "ns16550a";
+			status = "okay";
+		};
+
+		/* S-Mode APLIC */
+		aplic0: aplic@d000000 {
+			riscv,num-sources = <0x60>;
+			reg = <0x00 0xd000000 0x00 0x8000>;
+			msi-parent = <&imsic0>;
+			interrupt-controller;
+			#interrupt-cells = <0x02>;
+			compatible = "riscv,aplic";
+		};
+
+		imsic0: imsics@28000000 {
+			riscv,guest-index-bits = <0x0>;
+			riscv,ipi-id = <0x01>;
+			riscv,num-ids = <0xff>;
+			reg = <0x00 0x28000000 0x00 0x2000>;
+			interrupts-extended = <&cpu0_intc 0x09>,
+					      <&cpu1_intc 0x09>;
+			msi-controller;
+			interrupt-controller;
+			#interrupt-cells = <0x00>;
+			compatible = "riscv,imsics";
+		};
+
+		pci@30000000 {
+			compatible = "pci-host-ecam-generic";
+			device_type = "pci";
+			bus-range = <0 0>;
+			msi-parent = <&imsic0>;
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
+			interrupt-map = <0 0 0 1 &aplic0 32 4>;
+		};
+	};
+};
diff --git a/configs/riscv/qemu-aplic-imsic-mc.c b/configs/riscv/qemu-aplic-imsic-mc.c
new file mode 100644
index 00000000..921ab49a
--- /dev/null
+++ b/configs/riscv/qemu-aplic-imsic-mc.c
@@ -0,0 +1,5 @@
+#define QEMU_MC
+#define QEMU_APLIC
+#define QEMU_IMSIC
+#define QEMU_IVSHMEM
+#include "qemu.h"
diff --git a/configs/riscv/qemu-aplic-imsic-uc.c b/configs/riscv/qemu-aplic-imsic-uc.c
new file mode 100644
index 00000000..ac274805
--- /dev/null
+++ b/configs/riscv/qemu-aplic-imsic-uc.c
@@ -0,0 +1,5 @@
+#define QEMU_UC
+#define QEMU_APLIC
+#define QEMU_IMSIC
+#define QEMU_IVSHMEM
+#include "qemu.h"
diff --git a/configs/riscv/qemu-imsic.h b/configs/riscv/qemu-imsic.h
new file mode 100644
index 00000000..a97fce7d
--- /dev/null
+++ b/configs/riscv/qemu-imsic.h
@@ -0,0 +1,46 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2023
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+#define IMSIC_BASE		0x28000000
+#define IMSIC_FILE_SIZE		0x1000
+
+#define VS_FILE			1
+
+/*
+ * Qemu ist started with two guest files, the layout will be one page for:
+ *   - S-File
+ *   - VS-File 1
+ *   - VS-File 2
+ *   - Hole
+ * This means, four pages in sum.
+ */
+#define IMSIC_HART_STRIDE	(4 * IMSIC_FILE_SIZE)
+
+#define IMSIC_S_FILE(HART)	(IMSIC_BASE + (HART) * IMSIC_HART_STRIDE)
+#define IMSIC_VS_FILE(HART, NO)	(IMSIC_S_FILE(HART) + (NO) * IMSIC_FILE_SIZE)
+
+#define IMSIC_ROOT_REGION(HART, NO)					\
+	{								\
+		.phys_start = IMSIC_VS_FILE(HART, NO),			\
+		.virt_start = IMSIC_S_FILE(HART),			\
+		.size = 0x1000,						\
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,	\
+	}
+
+#define IMSIC_NON_ROOT_REGION(HART, NO)					\
+	{								\
+		.phys_start = IMSIC_VS_FILE(HART, NO),			\
+		.virt_start = IMSIC_BASE + (HART) * IMSIC_FILE_SIZE,	\
+		.size = IMSIC_FILE_SIZE,				\
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,	\
+	}
diff --git a/configs/riscv/qemu-inmate-demo-aplic-imsic.c b/configs/riscv/qemu-inmate-demo-aplic-imsic.c
new file mode 100644
index 00000000..64f0ce79
--- /dev/null
+++ b/configs/riscv/qemu-inmate-demo-aplic-imsic.c
@@ -0,0 +1,3 @@
+#define QEMU_APLIC
+#define QEMU_IMSIC
+#include "qemu-inmate-demo.h"
diff --git a/configs/riscv/qemu-inmate-demo.h b/configs/riscv/qemu-inmate-demo.h
index 9d3e7abe..9daf00e7 100644
--- a/configs/riscv/qemu-inmate-demo.h
+++ b/configs/riscv/qemu-inmate-demo.h
@@ -15,6 +15,7 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 #include "qemu-layout.h"
+#include "qemu-imsic.h"
 
 struct {
 	struct jailhouse_cell_desc cell;
diff --git a/configs/riscv/qemu-linux-demo-aplic-imsic.c b/configs/riscv/qemu-linux-demo-aplic-imsic.c
new file mode 100644
index 00000000..fc27f189
--- /dev/null
+++ b/configs/riscv/qemu-linux-demo-aplic-imsic.c
@@ -0,0 +1,4 @@
+#define QEMU_APLIC
+#define QEMU_IMSIC
+#define QEMU_IVSHMEM
+#include "qemu-linux-demo.h"
diff --git a/configs/riscv/qemu-linux-demo.h b/configs/riscv/qemu-linux-demo.h
index 12acc2fe..b34edd66 100644
--- a/configs/riscv/qemu-linux-demo.h
+++ b/configs/riscv/qemu-linux-demo.h
@@ -15,6 +15,7 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 #include "qemu-layout.h"
+#include "qemu-imsic.h"
 
 #define MEM_REGIONS_BASE	4
 
@@ -22,9 +23,15 @@
 #define IVSHMEM_REGIONS		4
 #else
 #define IVSHMEM_REGIONS		0
-#endif
+#endif /* !QEMU_IVSHMEM */
+
+#ifdef QEMU_IMSIC
+#define IMSIC_REGIONS		2
+#else
+#define IMSIC_REGIONS		0
+#endif /* !QEMU_IMSIC */
 
-#define MEM_REGIONS		(MEM_REGIONS_BASE + IVSHMEM_REGIONS)
+#define MEM_REGIONS		(MEM_REGIONS_BASE + IVSHMEM_REGIONS + IMSIC_REGIONS)
 
 struct {
 	struct jailhouse_cell_desc cell;
@@ -102,6 +109,10 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
 		},
+#ifdef QEMU_IMSIC
+		IMSIC_NON_ROOT_REGION(0, VS_FILE),
+		IMSIC_NON_ROOT_REGION(1, VS_FILE),
+#endif
 	},
 
 	.pci_devices = {
diff --git a/configs/riscv/qemu.h b/configs/riscv/qemu.h
index 6f481769..316e797a 100644
--- a/configs/riscv/qemu.h
+++ b/configs/riscv/qemu.h
@@ -20,6 +20,7 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 #include "qemu-layout.h"
+#include "qemu-imsic.h"
 
 #define MEM_REGIONS_BASE	9
 
@@ -27,9 +28,19 @@
 #define IVSHMEM_REGIONS		4
 #else
 #define IVSHMEM_REGIONS		0
-#endif
+#endif /* QEMU_IVSHMEM */
+
+#ifdef QEMU_IMSIC
+#ifdef QEMU_UC
+#define IMSIC_REGIONS		1
+#else
+#define IMSIC_REGIONS		6
+#endif /* QEMU_UC */
+#else
+#define IMSIC_REGIONS		0
+#endif /* QEMU_IMSIC */
 
-#define MEM_REGIONS		(MEM_REGIONS_BASE + IVSHMEM_REGIONS)
+#define MEM_REGIONS		(MEM_REGIONS_BASE + IVSHMEM_REGIONS + IMSIC_REGIONS)
 
 struct {
 	struct jailhouse_system header;
@@ -88,6 +99,11 @@ struct {
 					.size = 0x8000,
 					.max_irq = 96,
 					.max_priority = 7,
+#ifdef QEMU_IMSIC
+					.imsic_base = IMSIC_BASE,
+					.imsic_size = IMSIC_HART_STRIDE * ARRAY_SIZE(config.cpus),
+					.imsic_stride = IMSIC_HART_STRIDE,
+#endif
 #endif
 				},
 			},
@@ -195,6 +211,25 @@ struct {
 			.size = 0x20000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
+
+		/*
+		 * When having an IMSIC, we hide the S-Mode file from the
+		 * guest, and overlay it with a free VS-mode file.
+		 *
+		 * With IMSICs, every cell needs its own IMSIC VS-Mode file.
+		 * Hence, the number of Jailhouse cells must be less or equal
+		 * than the available VS-Mode files of the platform.
+		 */
+#ifdef QEMU_IMSIC
+		IMSIC_ROOT_REGION(0, VS_FILE),
+#ifdef QEMU_MC
+		IMSIC_ROOT_REGION(1, VS_FILE),
+		IMSIC_ROOT_REGION(2, VS_FILE),
+		IMSIC_ROOT_REGION(3, VS_FILE),
+		IMSIC_ROOT_REGION(4, VS_FILE),
+		IMSIC_ROOT_REGION(5, VS_FILE),
+#endif
+#endif
 	},
 	.irqchips = {
 #ifdef QEMU_PLIC
diff --git a/hypervisor/arch/riscv/include/asm/irqchip.h b/hypervisor/arch/riscv/include/asm/irqchip.h
index 6afdac5c..6b135712 100644
--- a/hypervisor/arch/riscv/include/asm/irqchip.h
+++ b/hypervisor/arch/riscv/include/asm/irqchip.h
@@ -40,6 +40,21 @@ struct irqchip {
 
 extern struct irqchip irqchip;
 
+static inline unsigned long imsic_base(void)
+{
+	return SYSCONFIG_IRQCHIP.imsic_base;
+}
+
+static inline unsigned long imsic_size(void)
+{
+	return SYSCONFIG_IRQCHIP.imsic_size;
+}
+
+static inline unsigned long imsic_stride_size(void)
+{
+	return SYSCONFIG_IRQCHIP.imsic_stride;
+}
+
 static inline unsigned long irqchip_type(void)
 {
 	return SYSCONFIG_IRQCHIP.type;
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index cb9d3b53..7176b58a 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -381,6 +381,11 @@ struct jailhouse_system {
 					u64 base_address;
 					u32 size;
 					u32 max_priority;
+					u16 imsic_stride;
+					u8 _res1[2];
+					u64 imsic_base;
+					u64 imsic_size;
+
 					s16 hart_to_context[32];
 				} __attribute__((packed)) irqchip;
 			} __attribute__((packed)) riscv;
diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 4b2989ed..79c41b9a 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -271,7 +271,7 @@ class SystemConfig:
     _NUM_IOMMUS = 8
     _ARCH_ARM_FORMAT = '=BB2xQQQQQ'
     _ARCH_X86_FORMAT = '=HBxIII28x'
-    _ARCH_RISCV_FORMAT = '=HBxQII'
+    _ARCH_RISCV_FORMAT = '=HBxQII2x2x8x8x'
     _ARCH_RISCV_FORMAT_HTC = '=32H'
 
     def __init__(self, data):
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-68-ralf.ramsauer%40oth-regensburg.de.
