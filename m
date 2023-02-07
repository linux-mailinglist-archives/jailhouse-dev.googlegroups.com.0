Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB24GRGPQMGQEO2WT3ZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA8268D69A
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:19 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id o9-20020adfa109000000b002bfc062eaa8sf2036509wro.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772779; cv=pass;
        d=google.com; s=arc-20160816;
        b=eWlVNEz/gK0uduEOFOOn/zU8YkH9R8hsn2W5iVzK1dzcGE5uhbxbrU52Kw9GvVZJed
         4to1+02vt4R34lZCobpriYumuoqZ20dpzb8N1b5ILBh8S5sEkb1moHL50dMiQd5bxjiI
         6K7u34OC575c1AOW0Dx38QzQeHoGGvxX44U4FTwRRM1fSizNj3x8F2FCCwRtvj9imo+E
         xmkl4dLXoKtxq3EWBnKtlQfq0eGFXzhFc6XP08V5yW+VU4UrMsxVCGTzTdyBYhS/BrxZ
         p6o1Q1ot7vj/60UlxJRwVvX/DvfEQOhxu57/weS+Xqq7O3AJM0Wfy8gNjvkbruDQc/yA
         UtTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=+RVGiYJ5Sl68tH7tInkqfv+yFuVl/KOMNNkGO3Jz968=;
        b=aQJfpaazuwmsHEuYnUFbXap7Y7W5jvWD2isTUdSbnH8Me8aRbCbdMEbU68IowoIOL+
         /hGZNBGjJApLLu/Y8aYYz6CjOBdqOw/O/lEFPcUhSHhXKypJvFmODk3GKQkUCuLn60KR
         svG2b61QMabzbUSxln9mMRGM5bykpLP2RQxipdefEsjgPmT5M3ThkOSzoVFRNt9dZgqc
         fulySfzPM+qH1cOQh19CncGhdGTuwENihxPGkfnmZwATEtXMA+HQoV88EdlOqTrvH1pP
         pIr2L5iQFnnYu9WojKoUWrW2At+Qo/BDfxA0b9MJWikXH/nL/s5YMPaHsAkPUQkSwSp/
         shHw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RVGiYJ5Sl68tH7tInkqfv+yFuVl/KOMNNkGO3Jz968=;
        b=FPB5bhOzK4MoN3k5RQXf2d9AmiHxVi4l1iFXaSRBSR2X1/f5q3Rkg7jR7DvSq05dEV
         L97StteF91M6Kk7ivVq5bgAtgzq2fIdUEA5kzG9saxeoQ2rfxJv6Fjqv5O2+ISZK91An
         tuChRc8cmkvNRNYaQ7MYklznFRm7oiLMWsnEF7fCr0d49b0pTeMuDWCOuAWgdz2frSuI
         7esZUyXQAbJFY6MR9ihjn5EZoBRMF4iajntXNrWtKnXFef0yFlStm0TVkyPtQrcjRlpE
         JJMokG+iMf4zxYo0ktw+lpMMVekabfebUnaXZYf5srL8yPCctNtd3d2qY4NctL4/uW87
         /YHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RVGiYJ5Sl68tH7tInkqfv+yFuVl/KOMNNkGO3Jz968=;
        b=4xA3jgGQDRNpd0Gk1fBtW72eqYwxjlb/kDKKDttU3OMPe9GBrlyNTUFj1FV4nxT7HB
         T/eQYhTWh3FokC8XppN/CwRqd6hnUcxhKdv7el+PwcsYTvHaSFnflKBbmsZLlYdWtCsM
         lhQpj0DnR5zHyrm8ZXkXSvb0/6HvJAQv+SCv9opKeL3uGSpd5IacpL/5enVki6l8KMvX
         vIX81+CGaAslQInq2DVN0dLqVKKMWjUTbuWJ/xtF8OPFElY+Vwd4oGDru7G2XDjlZ3be
         rqCGZ3Y5HNmta1i2QNLaqtSeuPpioE3b/3PbJe97qvfIOk6D4idp/ROM0CUPQFtjSiP8
         55+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKV5ubTid+W3MJvKGb8xS1lFcmj6RYPEohho5duBTSGW9ekmi1xT
	bRymqnlaoTxWKOil2fRIYgM=
X-Google-Smtp-Source: AK7set9Dj4qmpqKYV36xDlXvyG4JHTpPkGd/iyYl79MK/VSFXVxxp3gbcpTvI0KqQRvyX2hyDhR3uQ==
X-Received: by 2002:a05:600c:a50:b0:3dc:4aec:9759 with SMTP id c16-20020a05600c0a5000b003dc4aec9759mr1636767wmq.132.1675772779444;
        Tue, 07 Feb 2023 04:26:19 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c9b:b0:3dc:5674:6707 with SMTP id
 k27-20020a05600c1c9b00b003dc56746707ls10054809wms.2.-pod-canary-gmail; Tue,
 07 Feb 2023 04:26:17 -0800 (PST)
X-Received: by 2002:a05:600c:3198:b0:3e0:15c:3573 with SMTP id s24-20020a05600c319800b003e0015c3573mr2775559wmp.35.1675772777802;
        Tue, 07 Feb 2023 04:26:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772777; cv=none;
        d=google.com; s=arc-20160816;
        b=AwTZeG1/V41it+TE5He4fKnIZjO9tKUjzwzNEdvYkeVm4s29Gc3Ht7njLtPMD4DeeW
         OSlJbdq9PeC+tI7KRMRUxjrRQ2B4qY1DT5z9jMSvxppFbW1xdTNGsi8cwZxbiUKkNySJ
         IRVP08xM7nP3JkQVLCktZ47Z8diH25wh9tWS0cpY43P1wkwCzMr/lsmp+8KK6B0mXtJV
         K2GjP/V9bclCEuqB0dHKmzKM6+tpwSGE772vwBlFTAtn+abzI9CYD+6UlO0Wesl6Nu+H
         /gWwBpSGB8pcmByhGaX362f/MrbOyn/mp4BSV7PipUCR9UAdMnogEKy54SqqANEyReQD
         wj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=4bYcdhGpz3gVNhGPnYY5yovcSLCq6Wgqgv1cvdvxeuk=;
        b=RsnOqQhxIwDG1YuSVQ88ICzHJ/xg+J3wLuuBUQgReyqYcQ9sGfj63hShdMPtILRKVd
         pgxUl8N2gD1EZZLagHXA7pmNinT9mkVaqm86dVvzvz3bBM859+7W7V15FchcWlBe43bV
         6jHdSEz1tVgWfPf1skzC0uggufdl8aL6BPesLkzg4PUmUHXVPdDfDEW3FOe10F9Q+1cw
         BRseJRcedvZg6irfiDT15ee296jxDr4qhbzkUymXv+/WnVcXxGsnTrRpS/YZGohe3JMH
         mOIWsgdkK6aWr4VOzgmaxgEPV5D92mWvOepTx1wLeuZ5IOST1es4vYaxENgLVdCW3dOq
         P8mw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id l18-20020a05600c1d1200b003dd1c15e7ffsi588437wms.2.2023.02.07.04.26.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:17 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RY1tDjzyLG;
	Tue,  7 Feb 2023 13:26:17 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Stefan Huber <stefan.huber@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [RFC v2 43/47] configs: riscv: Add configuration parameters for APLIC
Date: Tue,  7 Feb 2023 13:25:39 +0100
Message-Id: <20230207122543.1128638-44-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
index 00000000..55e6e089
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
index 7da16c05..9385d8d4 100644
--- a/configs/riscv/qemu-linux-demo.h
+++ b/configs/riscv/qemu-linux-demo.h
@@ -89,9 +89,11 @@ struct {
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
index c44f5bbf..45d15564 100644
--- a/configs/riscv/qemu.h
+++ b/configs/riscv/qemu.h
@@ -52,6 +52,7 @@ struct {
 			.pci_mmconfig_end_bus = 0xff, // ??
 			.riscv = {
 				.irqchip = {
+#ifdef QEMU_PLIC
 					.type = JAILHOUSE_RISCV_PLIC,
 					.base_address = 0xc000000,
 					.size = 0x600000,
@@ -65,7 +66,14 @@ struct {
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
@@ -163,9 +171,14 @@ struct {
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
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-44-ralf.ramsauer%40oth-regensburg.de.
