Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYF5T6RQMGQEL7ONLQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BB670A0F0
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:05 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id 2adb3069b0e04-4f13ecb8f01sf2285971e87.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528865; cv=pass;
        d=google.com; s=arc-20160816;
        b=jD+wXaF80Wc2oI5/SOcQaYDaXo7jRqLDl09rMI2sKoKdXBXmzW/Yo26yK8s3b3FgdH
         TJ9P879V/iQjL/m6yn6XwtKGZInNp4HL7y4U6m0TE3P1J38ud551U3pWrZ+7mEifonH6
         GsxcMb2L27/G2+td3S/NwC1juPmBzvuKZJdf8FmcEQYQA6pPc5EF2fhGWDLPEzMubN1g
         G6RPra0duahjOiMj6nCeOjtUDuuxylHz6HNdRqJ/jKgQTek5F7Ch3kHkdr0oaUWquPxW
         4xSdhiSFYumnDwqqI55AjKBD3XGc4Hkocn6HVbPGwctLkxx+Fwrj5jUeY/sqjhv+YGrz
         yNrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=4EwuVVY1zYK9pQ5NPTTF7x1ploSOuLFH1chVla3ND/c=;
        b=kFK8J/KrAGBrRP/f6AdDor/uUolH9Zk+oX6CxpVYHdHbUNcEEDx6n0xYq7r3Ab0YLc
         BpRjeYL5cpn5s2yYaAWaLO8e67BCejlG3JHdbhDQEkb2k8u+n5PaLdzz6jO9T/d9dQTJ
         pz1jicKoWkmoisMsj9WmcfxOMILRdI5VQFHLE3Y2NZ1bXhmzHDoeBOw2P26yC9Xeqc3q
         xM/NkvGblwJaS1BOCgsY9qrDPP6a+J3VZ2jfNUkfOIji4P1UVChtshgU8wrF+8U4XmFK
         Si2mYKGwN81j/8EW9FcHKgkDD6YqRKJOMM0ltrx01qN4WmacyUir/88lf3GQFNCfdxY6
         HDIw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528865; x=1687120865;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4EwuVVY1zYK9pQ5NPTTF7x1ploSOuLFH1chVla3ND/c=;
        b=F9JYzD9PTbPy829k37u3R3Tx2IO+dBDVg7q5QcvT149zU16vXTZ8DL4Fp00mwfaFy5
         4xB+Mf1b0CEZxzPQSevTjgPdG1Zl+rj1i4fjwpFY050hF+Crb5X9DtkMNoZibxAerMYr
         jEBJjUoKIcjcmHHIfjO0gJlUMykN26QkofEQMr0eKU+Bi66cq560rBoCFBqiBXEKKsyJ
         CRt92Bosohv7H4eoQiNvvPs1/r0ftzE0k8kk+y9TzPkklPF0hz0ziCzhCgW+OjSdMg1D
         wNTjGz1ZKOPogWddE6PdIXSalW722tc9EhqseztU8T6acPDEZlQ5W24RJfme+cVlkJ/N
         3Sjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528865; x=1687120865;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EwuVVY1zYK9pQ5NPTTF7x1ploSOuLFH1chVla3ND/c=;
        b=cbCJrs3npfU+OPREX/vAQ3tjnkQAIW3DUyDB5ZUIRAD0p3B+P0HWh2eP+V5tPCGYZX
         LLTOfgOWiudsSSwzG3/WXro+fXwUX8mg/qG7oC36pEB6MGI4AS0lDOQpkm21X9SlLEfM
         po3ERxxAYlQOo+4mSTWa7jURhP03s84cjjKxSV9W7qm2otAuMgZJMFhZIsvP0pwX4z5g
         YxE/udiLXzU659XksVcFBwiqJdYnxcrBFDLE2fCa2bxl7Rjwk2sx9O614A/3/RPqNacL
         Vu8qR0gSpD2vg0Ugod0UlVTv3at4KHNFNBt2fMg3YOQDShLCZatOB8Yxqa6d1YGvIpcE
         j6jQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDziHEVtMwl3mzEkb8Bv+op1wJ/xdET9facVAtzfkCS+0jHB02yY
	HDolrVI49gLSa55kQZLR8g0=
X-Google-Smtp-Source: ACHHUZ6bCopchPV8W93goM93BW1fHNO5oOlHfPzZKizLH0feySsU92Q4YdzDKBI5Xhh+tO4J7FZ5VA==
X-Received: by 2002:ac2:5dce:0:b0:4f1:4edf:7383 with SMTP id x14-20020ac25dce000000b004f14edf7383mr812957lfq.6.1684528865392;
        Fri, 19 May 2023 13:41:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5b46:0:b0:4f1:4c37:e1cb with SMTP id i6-20020ac25b46000000b004f14c37e1cbls1546539lfp.0.-pod-prod-09-eu;
 Fri, 19 May 2023 13:41:03 -0700 (PDT)
X-Received: by 2002:ac2:46c5:0:b0:4f3:aad8:d2f1 with SMTP id p5-20020ac246c5000000b004f3aad8d2f1mr1383847lfo.47.1684528863539;
        Fri, 19 May 2023 13:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528863; cv=none;
        d=google.com; s=arc-20160816;
        b=tzjCFio7SpcgokgAaSu5t8c//YDjwocX72VR0O5fy8zXP7mfIxR1VSXCkTlPJ4Ao/P
         OKyNqfyZeLC88MvPUKl4W1TNJby/33oefEwNxNnxQvwUiq/gUeE/BCJIwfTl1FejRLem
         bd/oTy9f76RGPojxLgrKeq+UrhwXU0w1cf3H1FFvsOQMjIluAFkn6Kb1In6uIFqSJZ1Y
         no0wgTbQKWWpxJiTSyHV9TOoUbdyFim6p5UMnsFiHKxSjUUNZE7z2KV3wWA8lLMEHfqw
         BbRwhatc2r2gXUSfpmUoRYIyqIc47gSX0hmBpBAzertN2RYKfgUkYUpMxull/T/TRSA0
         hQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=gn+BC6Kargxb5EU8g785GDfa5/5SYfIyD/2QMIsH01A=;
        b=MspMMb+qg963kSFst5Wxwmy1PVnV0e92G4PqPQZCBWJEb2Du2DIBKrGTYmUpP+Wop+
         V79R6GKqGthcZDXnp6u3BtF0sFg4JsU752uLslZbpzAAs1Bw+MeunWHGf2nmYXCL86TK
         QKESD4puz4gg2cS5fxCArHaPBJVCbBJ8Mc4sN2+xlt4q2X4NQtFA2q6J2mlFcP+YXpXl
         AoMOwU4m09XA0XAg7nPjh70dbeMKpCptYemNnlwZvzXKD2P2R1r/3Zviyx5bJVcUTOE1
         kkIv1Pw4BwXk/bUVuHrtjTpUF3scCR2GnalokkXzEtD8UtSdVsIiQjr9asXMiu9bJsA2
         Ztxg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id v20-20020ac258f4000000b004f3b045aa3asi14006lfo.3.2023.05.19.13.41.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdp285FzyMb;
	Fri, 19 May 2023 22:41:02 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Stefan Huber <stefan.huber@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 62/73] configs: riscv: Add configuration parameters for APLIC
Date: Fri, 19 May 2023 22:40:22 +0200
Message-Id: <20230519204033.643200-63-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

From: Stefan Huber <stefan.huber@oth-regensburg.de>

With this, introduce the APLIC irqchip type in cell-config.h.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 configs/riscv/dts/qemu-linux-inmate-aplic.dts | 111 ++++++++++++++++++
 configs/riscv/qemu-aplic-mc.c                 |   3 +
 configs/riscv/qemu-aplic-uc.c                 |   3 +
 configs/riscv/qemu-linux-demo-aplic.c         |   2 +
 configs/riscv/qemu-linux-demo.h               |   4 +-
 configs/riscv/qemu-plic-mc.c                  |   1 +
 configs/riscv/qemu-plic-uc.c                  |   1 +
 configs/riscv/qemu.h                          |  17 ++-
 include/jailhouse/cell-config.h               |   1 +
 9 files changed, 140 insertions(+), 3 deletions(-)
 create mode 100644 configs/riscv/dts/qemu-linux-inmate-aplic.dts
 create mode 100644 configs/riscv/qemu-aplic-mc.c
 create mode 100644 configs/riscv/qemu-aplic-uc.c
 create mode 100644 configs/riscv/qemu-linux-demo-aplic.c

diff --git a/configs/riscv/dts/qemu-linux-inmate-aplic.dts b/configs/riscv/dts/qemu-linux-inmate-aplic.dts
new file mode 100644
index 00000000..49eb3993
--- /dev/null
+++ b/configs/riscv/dts/qemu-linux-inmate-aplic.dts
@@ -0,0 +1,111 @@
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
+			interrupts-extended = <&cpu0_intc 0x09>,
+					      <&cpu1_intc 0x09>;
+			interrupt-controller;
+			#interrupt-cells = <0x02>;
+			compatible = "riscv,aplic";
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
+			interrupt-map = <0 0 0 1 &aplic0 32 4>;
+		};
+	};
+};
diff --git a/configs/riscv/qemu-aplic-mc.c b/configs/riscv/qemu-aplic-mc.c
new file mode 100644
index 00000000..34c3bc9d
--- /dev/null
+++ b/configs/riscv/qemu-aplic-mc.c
@@ -0,0 +1,3 @@
+#define QEMU_MC
+#define QEMU_APLIC
+#include "qemu.h"
diff --git a/configs/riscv/qemu-aplic-uc.c b/configs/riscv/qemu-aplic-uc.c
new file mode 100644
index 00000000..a26dcaa0
--- /dev/null
+++ b/configs/riscv/qemu-aplic-uc.c
@@ -0,0 +1,3 @@
+#define QEMU_UC
+#define QEMU_APLIC
+#include "qemu.h"
diff --git a/configs/riscv/qemu-linux-demo-aplic.c b/configs/riscv/qemu-linux-demo-aplic.c
new file mode 100644
index 00000000..81442a13
--- /dev/null
+++ b/configs/riscv/qemu-linux-demo-aplic.c
@@ -0,0 +1,2 @@
+#define QEMU_APLIC
+#include "qemu-linux-demo.h"
diff --git a/configs/riscv/qemu-linux-demo.h b/configs/riscv/qemu-linux-demo.h
index d86fdae0..68575dc6 100644
--- a/configs/riscv/qemu-linux-demo.h
+++ b/configs/riscv/qemu-linux-demo.h
@@ -90,9 +90,11 @@ struct {
 	},
 
 	.irqchips = {
-		/* PLIC */ {
+		/* (A)PLIC */ {
 #ifdef QEMU_PLIC
 			.address = 0xc000000,
+#elif defined(QEMU_APLIC)
+			.address = 0xd000000,
 #endif
 			.pin_base = 0,
 			.pin_bitmap = {
diff --git a/configs/riscv/qemu-plic-mc.c b/configs/riscv/qemu-plic-mc.c
index c70371d2..c29be90a 100644
--- a/configs/riscv/qemu-plic-mc.c
+++ b/configs/riscv/qemu-plic-mc.c
@@ -1,2 +1,3 @@
 #define QEMU_MC
+#define QEMU_PLIC
 #include "qemu.h"
diff --git a/configs/riscv/qemu-plic-uc.c b/configs/riscv/qemu-plic-uc.c
index 1439aa95..f9842775 100644
--- a/configs/riscv/qemu-plic-uc.c
+++ b/configs/riscv/qemu-plic-uc.c
@@ -1,2 +1,3 @@
 #define QEMU_UC
+#define QEMU_PLIC
 #include "qemu.h"
diff --git a/configs/riscv/qemu.h b/configs/riscv/qemu.h
index 940efb3f..ceae015f 100644
--- a/configs/riscv/qemu.h
+++ b/configs/riscv/qemu.h
@@ -53,6 +53,7 @@ struct {
 			.pci_mmconfig_end_bus = 0xff, // ??
 			.riscv = {
 				.irqchip = {
+#ifdef QEMU_PLIC
 					.type = JAILHOUSE_RISCV_PLIC,
 					.base_address = 0xc000000,
 					.size = 0x600000,
@@ -66,7 +67,14 @@ struct {
 						[4] = 9,
 						[5] = 11,
 						[6 ... 31] = -1,
-					}
+					},
+#elif defined(QEMU_APLIC)
+					.type = JAILHOUSE_RISCV_APLIC,
+					.base_address = 0xd000000,
+					.size = 0x8000,
+					.max_irq = 96,
+					.max_priority = 7,
+#endif
 				},
 			},
 		},
@@ -171,9 +179,14 @@ struct {
 		},
 	},
 	.irqchips = {
+#ifdef QEMU_PLIC
 		/* plic@c000000 */ {
 			.address = 0xc000000,
-			.id = 0 /* PLIC */,
+#elif defined(QEMU_APLIC)
+		/* aplic_s@d000000 */ {
+			.address = 0xd000000,
+#endif
+			.id = 0,
 			.pin_base = 0,
 			.pin_bitmap = {
 				(1 << 0xa), /* uart@10000000 */
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 787d6a26..cb9d3b53 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -333,6 +333,7 @@ struct jailhouse_pio {
 	!!((flags) & JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE)
 
 #define JAILHOUSE_RISCV_PLIC		0
+#define JAILHOUSE_RISCV_APLIC		1
 
 /**
  * General descriptor of the system.
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-63-ralf.ramsauer%40oth-regensburg.de.
