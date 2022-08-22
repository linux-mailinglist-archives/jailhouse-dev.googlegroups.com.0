Return-Path: <jailhouse-dev+bncBCFKT2ENXMKRB5XZR6MAMGQEAJOLLXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63d.google.com (mail-pl1-x63d.google.com [IPv6:2607:f8b0:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F2B59CB4A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Aug 2022 00:02:32 +0200 (CEST)
Received: by mail-pl1-x63d.google.com with SMTP id l3-20020a170902f68300b00172e52e5297sf2981880plg.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Aug 2022 15:02:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1661205751; cv=pass;
        d=google.com; s=arc-20160816;
        b=uLZG+g47jxCEpe7fbhnnBnEVexMxCbAhr527CUQ8143K0IOHVySgQ98JKA0J0NqRWk
         y6phfw8/5IEWdWszhPt637B6t6zkuG+HUe4CFg0iZ14U5Sf0UTb2ArV4wIeQeViBp+TR
         31/sunp+XE6/6Fx6IQzX9ZCgICl/zj0fLe7EW9rWadt1HzTm0nTVw3/NpC5yUAfeZ0qK
         0aCdtPD1fntY74nuVg4ZY77MvGONLXNi9+20n+tSEfrF/641hDI4PDToP5NmzFHkLOBR
         3liCzuG88+44tVNvn9QB8gX0qidrs7b/S8FVEUU51Xvt023w3O75P2toOyweLS+NiDJ4
         aMwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature;
        bh=RLP9o0oJC15yDnZzpl5b5uDe3y/CbTL+uwlfdVO08Y0=;
        b=pZ9kVWhLMv4QKj2Sy0sYknzfaAvv/4iVcSJdsGwDZsv9acHB8uLLJ7+SnTseTquPpm
         dWgoU7EDN6oeg2Ow0xLMsWNU4U0SLfGs6toa9hAb0qfMHXqfnLnpJiDN0fcF5JkhVmN4
         wPzHsP+NVek6MEFlndJ9LPy1fjaKJ6gdhLYbkZjSiosAdq3eRUjsw0jym2FC4jUSOvw1
         lOlPMJmar7SSw1bveMMSDpQKq8Pp5PYGKmlNlyzLCKanWBuhyXAFIGWCKONYVWP17b7a
         UTMQQtOyPYSOClyjKP0N0P1xAJZ+UG/WGkX42bKtwxBzGn8EjSZO5b1g0Sol4i5/3x5M
         Tskw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:references:in-reply-to:message-id:date:subject:cc
         :to:from:mime-version:sender:from:to:cc;
        bh=RLP9o0oJC15yDnZzpl5b5uDe3y/CbTL+uwlfdVO08Y0=;
        b=UK5Vyo+39UPKHqL7d+Ilwtuwum+Z8kFXFYUusB/VPFGxm591lKYZxWqmctIaR0EKFo
         xfQ8J+RDKUfWLmDwtLjmJxXVQqrltVaEZgvvoX5oXrMlkRMFs02QfQHez8NVa68RUPdL
         qPiqSb6uh0Th1xskgEbTYNucyC6JYcFknewLdSZlKRokTtAoJEeWQ8fbhC614cRqFXvG
         +mvHsGnQfLtx2KjERdlDw5j2qCMpeKyFKFgFww7QgTf1BjBtTKlP5zXPTxOlngvNBh4w
         RYmduzJLVn73x5MlQ8ESzpuqtxFLxlQKO/LZLWo4jW49diQWSGCIqbbNBZt4MNl2FgQx
         VpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version
         :x-gm-message-state:sender:from:to:cc;
        bh=RLP9o0oJC15yDnZzpl5b5uDe3y/CbTL+uwlfdVO08Y0=;
        b=ds19S4nV2C8fFJmO1fXu0g10bvtqluDPDj1vSUoJXZBQSwUcpD/1Exp7lJM36OLsQp
         pqlrBpqnxdp2uupXfjkh5B0WOBzVugd8JrvTlliSVRUohPKHMluyVo+lNNqpjGDliaLr
         rfxbcE9WP0HMND9mrI5S1fcG5R804i9r387Upx7Hks7tRBNM885+eTtiPMG3icIgIMr6
         /lYmSU/vt6ACZnvkEBUyCL/xhjIXQufNuK5hhZ5jUwrgZov7bAzSPxrfkUD91H8NZCRT
         SO1N4J0Fv1vSfxRVwoxJH7fhmo2Qw0htw952qxL5nvABEPkLYc4/mstxnqkqDkUA1BJ5
         Xr3g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo13piUCMVK3QgaEs3AcgoC3iGAYLZH+teRzLcn2mnWmwfakDWv9
	OIRc1gmVEgjlFoJe/oIkPdU=
X-Google-Smtp-Source: AA6agR5IZIp4rOd4BnapAhBUc9EHB5cjCfox26nVj6tGssmYgmoXQ7zTiLxCuNU3+BbdXZRGu5bukQ==
X-Received: by 2002:a63:ad02:0:b0:41a:910f:5195 with SMTP id g2-20020a63ad02000000b0041a910f5195mr18753989pgf.472.1661205751366;
        Mon, 22 Aug 2022 15:02:31 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:86c8:0:b0:40d:4b5d:70b8 with SMTP id x191-20020a6386c8000000b0040d4b5d70b8ls5825829pgd.0.-pod-prod-gmail;
 Mon, 22 Aug 2022 15:02:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac4:b0:535:c08:2da7 with SMTP id c4-20020a056a000ac400b005350c082da7mr22621758pfl.69.1661205750310;
        Mon, 22 Aug 2022 15:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661205750; cv=none;
        d=google.com; s=arc-20160816;
        b=DR5W1hlIM7E+azJVtt3jEw8FM1nf+vszjJ/lTYGjItbAVqb4M5C2AA8Kk3f9qvtv04
         mQItw1def69UWeBRwP+AFzXP+UWggaOUNhMjUc0i8gRySE5/vFlq3CWUzJ5iF82E4xm7
         zl+4zsO0pr/lGTe4nUQEDZXGimIbfv2qdmKVbF3wytytcfFeJsGwYY14b+uX63IGrldP
         gwnvxb5ffUkPtttY+n9U+M63PPOrzCP8X7WcOIqGLMLBWoPmjw4uucXkWIyys7mV4Yw5
         mQLiJDqbY/cD8Lt5yWoV9WyJN0F9xs1LTsNiFA3hbzGZaaXDS79u3Ch3oiDixeT04DVc
         KDaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=BZ+I+uESTorDCcI83CPJ9gqumj5Tw5SXrRPiMA46kzc=;
        b=CXBRnW2RoUynQ6i45p0Pl0Ze7rdGLM55H5zjTbLAdAgTLQC9afnjIfMJsoPgd5es+1
         W0ZWFLdscvuSNmHfFZZw3KpAUuudj2C9ETwQN7nrhBxbnR71Rz3OeKGZE1Y7hais7WRl
         81wXtPef97ftemNo+1zZwE2gA+2NL9czTCUqW6q5dGqGoIttKx8KfwXIE6K925K359vs
         8mx8/0uXsu/IXxGNy/zTbmFe15MsP3agj9Lti7ik3TFzPlHD0yO9+poHenkwIC3P20jP
         Oc19B6IbtEPV8het7BPkV2gST9Uccyt29CQ4vhNpQigP/1V2/m9w2cmfAClidDhHrFMn
         vQkw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com. [210.160.252.171])
        by gmr-mx.google.com with ESMTP id q19-20020a638c53000000b00423291dc756si497650pgn.5.2022.08.22.15.02.29
        for <jailhouse-dev@googlegroups.com>;
        Mon, 22 Aug 2022 15:02:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) client-ip=210.160.252.171;
X-IronPort-AV: E=Sophos;i="5.93,255,1654527600"; 
   d="scan'208";a="130222650"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Aug 2022 07:02:29 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8F019400755E;
	Tue, 23 Aug 2022 07:02:27 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Chris Paterson <chris.paterson2@renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] configs: arm64: Add demo cell config for Renesas RZ/G2M
Date: Mon, 22 Aug 2022 23:02:02 +0100
Message-Id: <20220822220202.26218-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220822220202.26218-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220822220202.26218-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Original-Sender: prabhakar.mahadev-lad.rj@bp.renesas.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates
 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
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

Add demo cell config along with the corresponding DTS for HopeRun HiHope
RZ/G2M platform.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 configs/arm64/dts/inmate-r8a774a1-hihope.dts | 228 +++++++++++++++++++
 configs/arm64/renesas-r8a774a1-linux-demo.c  | 114 ++++++++++
 2 files changed, 342 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-r8a774a1-hihope.dts
 create mode 100644 configs/arm64/renesas-r8a774a1-linux-demo.c

diff --git a/configs/arm64/dts/inmate-r8a774a1-hihope.dts b/configs/arm64/dts/inmate-r8a774a1-hihope.dts
new file mode 100644
index 00000000..d1fc03bb
--- /dev/null
+++ b/configs/arm64/dts/inmate-r8a774a1-hihope.dts
@@ -0,0 +1,228 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Device tree for Linux inmate test on HopeRun HiHope RZ/G2M
+ * platform based on R8A774A1/R8A774A3, corresponds to
+ * configs/arm64/renesas-r8a774a1-linux-demo.c
+ *
+ * Copyright (c) 2022, Renesas Electronics Corporation
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
index 00000000..18d24e5f
--- /dev/null
+++ b/configs/arm64/renesas-r8a774a1-linux-demo.c
@@ -0,0 +1,114 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for linux-demo inmate on HopeRun HiHope RZ/G2M
+ * platform based on r8a774a1/r8a774a3: 4xA53 CPUs, PFC, SCIF1,
+ * GPIO6, PRR and LED1.
+ *
+ * Copyright (c) 2022, Renesas Electronics Corporation
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
+#ifndef CONFIG_INMATE_BASE
+#define CONFIG_INMATE_BASE 0x0000000
+#endif
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[7];
+	struct jailhouse_irqchip irqchips[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "renesas-r8a774a1-linux-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
+			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
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
+		/* GPIO6 */ {
+			.phys_start = 0xe6055400,
+			.virt_start = 0xe6055400,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_ROOTSHARED |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PFC */ {
+			.phys_start = 0xe6060000,
+			.virt_start = 0xe6060000,
+			.size = 0x50c,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_ROOTSHARED |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SCIF1 */ {
+			.phys_start = 0xe6e68000,
+			.virt_start = 0xe6e68000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PRR */ {
+			.phys_start = 0xfff00044,
+			.virt_start = 0xfff00044,
+			.size = 0x4,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_ROOTSHARED |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* linux-loader space */ {
+			.phys_start = 0x89000000,
+			.virt_start = 0x0,
+			.size = 0x6400000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM */ {
+			.phys_start = 0x8f400000,
+			.virt_start = 0x8f400000,
+			.size = 0x19c00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+	.irqchips = {
+		/* GIC */ {
+			.address = 0xf1010000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0x2000000, 0x0,
+			},
+		},
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220822220202.26218-4-prabhakar.mahadev-lad.rj%40bp.renesas.com.
