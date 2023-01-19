Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBC7UU2PAMGQE7CMZFJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EE6674534
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Jan 2023 22:45:49 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id f17-20020ac25091000000b004b565e69540sf1524586lfm.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Jan 2023 13:45:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674164748; cv=pass;
        d=google.com; s=arc-20160816;
        b=mGJd45lH3OA0eKZMy9IFjpJ8DOMFcKdDkxEoi94/ug96vec2NhvytCFg8O8nC3Cw0g
         aBluxAYJqrlRYTu2F1bpLx9X9Jclr2xb4FpBkuYSIZvlXCMFPuD8RogxGTwEzOEtAqrY
         xo4W3bLuRAemQFfY0PewI2jBy667OgFrcH6K3V5g13n1bxOMOqUTeRJshRP9gMeqywRR
         9aObKFG0yFJ5zRiJOrudC+idkByReAG/4XE2TVKj8HPzcJB4+fatPGxFjsk9KrYuVsan
         r/nEbgWc+bcbXNS1IIcF4B1jx59mRxvN6KBLr3O8r411oRph2UuOyGpwWaAV5wZb7t/d
         qn5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :dkim-signature;
        bh=AgBX+tBDkCHOIHY6uQWbavqi2n428sstw4A5ouFeJs0=;
        b=c9vTfxwgovs1u8vwBrMtSP9uzXKBbvp7wffFaryaH1KHmTmgCQLBvReDl3JFB2JRht
         vwXaCyGp8h+z+dWoCONI16hCh2xG7VcudVx9bVqQ3uEHB9KTozZ7woRheNU1g7L4Sj8x
         FBF62NI1KHTbcF7o1UlTK3XCHe2Ao+jcGS8Knq1jkj7TdWL/JL0j8fAP8Hd1hcdBhgdE
         PPd+patZdEyb5h0HDlrm/vkpiRfLFimv3J6nUcF0ZLLzCnhKgdOOFAom37+j1lbmwG0P
         uimUQAoz2N1cG//hTcqMgG+LGtffB7XsT5IAcwwR5Qai0f7lA5Xydr1zRjXvZb+9srE/
         Hxvg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=fpVP0yQK;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2a00:1450:4864:20::336 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgBX+tBDkCHOIHY6uQWbavqi2n428sstw4A5ouFeJs0=;
        b=rVNJ29S+KfPrc14ZFT5dThYcDqWdpjulIhF8hAQREx4Xm9rs7RQ+JK6uls6W+MVDJV
         4ERYK++aiWRd63pg1GnkCBe0qyHkWoC9GSuIQkOfqx2J2gjZCDJkAAkmfpqd9edCs0dm
         XB0rQDWD/nK1GGejcrxVQceShh943MAS6w/P7J9mhWDqt3VDu+Rp5DZt29o7RcC0Lrkm
         GiMlDUgSLFUjr5VAYTxHF7K8Ud0dh3a1kACs/MHzaukfTy+hMoBDDna9WtuhTh/b4dnt
         8Q9nGiqB9+qSlsx5q8S2Qj58M33mUzBzYpCchTxKSuKRX3GJBx1wLwNbeGzkxbqy3RGA
         24CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AgBX+tBDkCHOIHY6uQWbavqi2n428sstw4A5ouFeJs0=;
        b=pVBN7ZS/NPNESnoSzM8javnydhE55P/VrlhMWYqDU+B4bR6yV0ZYjORSGuHGJb/oPJ
         PAfv+txthxJ++wzgma4Zpo7S5WSdv5vx3rkIfHfTfX93GH9gl/80Om+by3JKDDOT/XPi
         /Wv/QKO92N179ir3CS57bBoy1DFnl6yE1HYvKeMVp1boKspJEheRiVUEwKqx747Q1db9
         RiQNLzaRCQfl11RaWlN1cddOBOTyRNfeRq1QtMAhduDOBYND5/zsXFYuSdf79rr0ol7n
         qWGyifMGKLS6R8LL7NAjTujwCXlEo6r38Fh2zWozWt7Locw3c7OcQNmpQdxu6AXLoJAF
         bTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgBX+tBDkCHOIHY6uQWbavqi2n428sstw4A5ouFeJs0=;
        b=BpPQ972K17ZubQyxz6Mfo0Azu/RVcxOws8xwWoAKKyfJnueVl1NtFokukUtQWwCX8g
         b+SsNCZSy8Zw+PNiiqMzm/7xGHCypMKY1cvMl3XMsENmDLx+XMmA5brXiXBLc94+XK9O
         e+OXktXKAeh/7l0EjzRUS2QVNZA24UcSmHvr329taH3//r/ScImSTSr+w0qzcxhkm5Vq
         KUeZ0Dv7dNZI9GulSiVOhG035ypadk2SdSxAa1w8c888KRUHBSHJJLAxPFomtHhy3Bqa
         2coi9/pnIMrPItVQPV7jQ4WbRF37D8Y6r2sR/CEHYqTZF9SPHTXVb0EnnzeJc5gdgRBy
         vUWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2koTwqk9UT1BYjI6F9EfvamN+6RwAVerH7g6GwziY4XEi4qioaYT
	3Cu7Ckbwu67Ea/QSMHKH0XI=
X-Google-Smtp-Source: AMrXdXtokSKO+OPi2VqjFvU+CO+xWs80duh9jtUngjHDNlOspdXY9kZdGbBnr0fvGer0ZEjrgpbvJg==
X-Received: by 2002:a2e:9691:0:b0:28b:8547:5950 with SMTP id q17-20020a2e9691000000b0028b85475950mr1091106lji.485.1674164748564;
        Thu, 19 Jan 2023 13:45:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:80c6:0:b0:27f:d549:611b with SMTP id r6-20020a2e80c6000000b0027fd549611bls450946ljg.9.-pod-prod-gmail;
 Thu, 19 Jan 2023 13:45:46 -0800 (PST)
X-Received: by 2002:a05:651c:2116:b0:286:d139:bf8a with SMTP id a22-20020a05651c211600b00286d139bf8amr4350010ljq.51.1674164746583;
        Thu, 19 Jan 2023 13:45:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674164746; cv=none;
        d=google.com; s=arc-20160816;
        b=jJzzsAQ1PtGWUlGShkVbCNKMIhspYUIs2RchrA3fruQrb9r5ET1cRn80/Vcyem3xiS
         eBIz//OWiToWuV6RwizrtvzNHNzEuZ8mlSbU6oAce25eVhgpDog63c+0QO2xdYQobwku
         3LWkkRdDBhj+V+k0LAWq9DcQm/ESqTg7vz+vPC2tkHT6cnvSVbeyuH3BdSki5FblDG7k
         iR9OSXKFVFQitLkNPQUV5qcgyI0FWhrpRtlelg1Fo2JpQkEoJ4+V7zOLVYqh5ByP6YL0
         IRTeQ+s46k70Kojh6lk5uqf2SasSLxF+Z3BwWHkT8qCssq/OLhdtEmP6sMjehEYifDyL
         2nKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=b39FEWfMDVQhrK9Ow8dp0wI5cPl5KtLmKuuuoW5RdrU=;
        b=oL+akkJR9d6fKJVt+/YFZ8IHlEluGU8KdrkQzELYtnDDaDGfQ/y3vMWJRtFWAtG6Fw
         K4rhTTeiVYI/bgrwwtbc29H5ePumhHthRVVdl3H/0SXM7q8unVStMMixd1si/F8RWeqp
         vNvQC6r1JvFFzFB7ZmujDnaPPHfaIDhZk9SS/2lfagHXfTFbCKA6a/C8g8AtahlKxVRo
         mlMGl34H/VLc/hvU6pwZdsklVfCmD7T8Phu+iRkgLaBN/FWU9GcF8v7XnJ3E9F6RQeD1
         mbTEZw1m1sLU51u6uShOnwD1d2cjm5ZMKL6zybVQgfS5OnBSLJPTQoHwqZMznCP9ckGP
         YGdw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=fpVP0yQK;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2a00:1450:4864:20::336 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com. [2a00:1450:4864:20::336])
        by gmr-mx.google.com with ESMTPS id bf26-20020a2eaa1a000000b0028586d0af2fsi1438030ljb.7.2023.01.19.13.45.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 13:45:46 -0800 (PST)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2a00:1450:4864:20::336 as permitted sender) client-ip=2a00:1450:4864:20::336;
Received: by mail-wm1-x336.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so2278603wmc.1
        for <jailhouse-dev@googlegroups.com>; Thu, 19 Jan 2023 13:45:46 -0800 (PST)
X-Received: by 2002:a05:600c:d2:b0:3da:f475:6480 with SMTP id u18-20020a05600c00d200b003daf4756480mr11766896wmm.7.1674164745909;
        Thu, 19 Jan 2023 13:45:45 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:3d57:310b:6bc8:3755])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b003c70191f267sm337808wmq.39.2023.01.19.13.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 13:45:45 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	jailhouse-dev@googlegroups.com
Cc: Chris Paterson <chris.paterson2@renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/3] configs: arm64: Add linux-inmate-demo cell config for Renesas RZ/G2M
Date: Thu, 19 Jan 2023 21:45:34 +0000
Message-Id: <20230119214536.5247-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119214536.5247-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230119214536.5247-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=fpVP0yQK;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2a00:1450:4864:20::336 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add linux-inmate-demo cell config along with the corresponding DTS for
HopeRun HiHope RZ/G2M platform.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 configs/arm64/dts/inmate-r8a774a1-hihope.dts | 244 +++++++++++++++++++
 configs/arm64/renesas-r8a774a1-linux-demo.c  | 184 ++++++++++++++
 2 files changed, 428 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-r8a774a1-hihope.dts
 create mode 100644 configs/arm64/renesas-r8a774a1-linux-demo.c

diff --git a/configs/arm64/dts/inmate-r8a774a1-hihope.dts b/configs/arm64/dts/inmate-r8a774a1-hihope.dts
new file mode 100644
index 00000000..d9f90076
--- /dev/null
+++ b/configs/arm64/dts/inmate-r8a774a1-hihope.dts
@@ -0,0 +1,244 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Device tree for Linux inmate test on HopeRun HiHope RZ/G2M
+ * platform based on R8A774A1/R8A774A3, corresponds to
+ * configs/arm64/renesas-r8a774a1-linux-demo.c
+ *
+ * Copyright (c) 2023, Renesas Electronics Corporation
+ *
+ * Authors:
+ *  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/dts-v1/;
+
+/ {
+	model = "Jailhouse cell on HopeRun HiHope RZ/G2M platform based on r8a774a1";
+	compatible = "hoperun,hihope-rzg2m", "renesas,r8a774a1";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &scif1;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+
+	hypervisor {
+		compatible = "jailhouse,cell";
+		interrupt-parent = <&gic>;
+	};
+
+	memory@8f400000 {
+		device_type = "memory";
+		reg = <0x0 0x8f400000 0x0 0x19c00000>;
+	};
+
+	extal_clk: extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <16666666>;
+	};
+
+	extalr_clk: extalr {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	scif_clk: scif {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <14745600>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		a53_0: cpu@100 {
+			compatible = "arm,cortex-a53";
+			reg = <0x100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+			dynamic-power-coefficient = <277>;
+			capacity-dmips-mhz = <560>;
+		};
+
+		a53_1: cpu@101 {
+			compatible = "arm,cortex-a53";
+			reg = <0x101>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <560>;
+		};
+
+		a53_2: cpu@102 {
+			compatible = "arm,cortex-a53";
+			reg = <0x102>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <560>;
+		};
+
+		a53_3: cpu@103 {
+			compatible = "arm,cortex-a53";
+			reg = <0x103>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <560>;
+		};
+
+		L2_CA53: cache-controller-1 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
+	clocks {
+		scif1_clk: scif1_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <1>;
+			clock-frequency  = <66666664>;
+			clock-output-names = "scif1_clk";
+		};
+
+		s3d1_clk: s3d1_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <1>;
+			clock-frequency  = <266666656>;
+			clock-output-names = "s3d1_clk";
+		};
+
+		sdif3_clk: sdif3_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <1>;
+			clock-frequency  = <199999992>;
+			clock-output-names = "sdif3_clk";
+		};
+
+		intacp_clk: intacp_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <1>;
+			clock-frequency  = <266666656>;
+			clock-output-names = "intacp_clk";
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpio6: gpio@e6055400 {
+			compatible = "renesas,gpio-r8a774a1",
+				     "renesas,rcar-gen3-gpio";
+			reg = <0 0xe6055400 0 0x50>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 192 32>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		pfc: pinctrl@e6060000 {
+			compatible = "renesas,pfc-r8a774a1";
+			reg = <0 0xe6060000 0 0x50c>;
+
+			scif1_pins: scif1 {
+				groups = "scif1_data_a";
+				function = "scif1";
+			};
+		};
+
+		scif1: serial@e6e68000 {
+			compatible = "renesas,scif-r8a774a1",
+				      "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6e68000 0 0x40>;
+			interrupts = <0 153 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scif1_clk 0>,
+				 <&s3d1_clk 0 >,
+				 <&scif_clk 0>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			pinctrl-0 = <&scif1_pins>;
+			pinctrl-names = "default";
+		};
+
+		gic: interrupt-controller@f1010000 {
+			compatible = "arm,gic-400";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x0 0xf1010000 0 0x1000>,
+			      <0x0 0xf102f000 0 0x20000>,
+			      <0x0 0xf1040000 0 0x20000>,
+			      <0x0 0xf106f000 0 0x20000>;
+			interrupts = <GIC_PPI 9
+					(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&intacp_clk 0>;
+			clock-names = "clk";
+		};
+
+		prr: chipid@fff00044 {
+			compatible = "renesas,prr";
+			reg = <0 0xfff00044 0 4>;
+		};
+
+		pci@ff900000 {
+			compatible = "pci-host-ecam-generic";
+			device_type = "pci";
+			bus-range = <0 0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &gic GIC_SPI 24 IRQ_TYPE_EDGE_RISING>,
+					<0 0 0 2 &gic GIC_SPI 25 IRQ_TYPE_EDGE_RISING>,
+					<0 0 0 3 &gic GIC_SPI 26 IRQ_TYPE_EDGE_RISING>,
+					<0 0 0 4 &gic GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
+			reg = <0x0 0xff900000 0x0 0x100000>;
+			ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x100000>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			gpios = <&gpio6 12 0>;
+			default-state = "on";
+		};
+	};
+};
diff --git a/configs/arm64/renesas-r8a774a1-linux-demo.c b/configs/arm64/renesas-r8a774a1-linux-demo.c
new file mode 100644
index 00000000..bbd3ae16
--- /dev/null
+++ b/configs/arm64/renesas-r8a774a1-linux-demo.c
@@ -0,0 +1,184 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for linux-demo inmate on HopeRun HiHope RZ/G2M
+ * platform based on r8a774a1/r8a774a3: 4xA53 CPUs, PFC, SCIF1,
+ * GPIO6, PRR and LED1.
+ *
+ * Copyright (c) 2023, Renesas Electronics Corporation
+ *
+ * Authors:
+ *  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[16];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
+		.name = "renesas-r8a774a1-linux-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
+			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+
+		.vpci_irq_base = 24,
+
+		.console = {
+			.address = 0xe6e68000,
+			.size = 0x40,
+			.type = JAILHOUSE_CON_TYPE_SCIF,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x3c,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0xa9000000,
+			.virt_start = 0xa9000000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xa9001000,
+			.virt_start = 0xa9001000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xa900a000,
+			.virt_start = 0xa900a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xa900c000,
+			.virt_start = 0xa900c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xa900e000,
+			.virt_start = 0xa900e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xa9010000, 1),
+		/* GPIO6 */ {
+			.phys_start = 0xe6055400,
+			.virt_start = 0xe6055400,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED |
+				 JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* PFC */ {
+			.phys_start = 0xe6060000,
+			.virt_start = 0xe6060000,
+			.size = 0x50c,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED |
+				 JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* SCIF1 */ {
+			.phys_start = 0xe6e68000,
+			.virt_start = 0xe6e68000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 |
+				 JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PRR */ {
+			.phys_start = 0xfff00044,
+			.virt_start = 0xfff00044,
+			.size = 0x4,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED |
+				 JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* linux-loader space */ {
+			.phys_start = 0x89000000,
+			.virt_start = 0x0,
+			.size = 0x6400000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM */ {
+			.phys_start = 0x8f400000,
+			.virt_start = 0x8f400000,
+			.size = 0x19c00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				 JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.irqchips = {
+		/* IVSHMEM */ {
+			.address = 0xf1010000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xf000000, 0x0,
+			},
+		},
+		/* SCIF1 */ {
+			.address = 0xf1010000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0x2000000, 0x0,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230119214536.5247-3-prabhakar.mahadev-lad.rj%40bp.renesas.com.
