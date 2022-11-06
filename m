Return-Path: <jailhouse-dev+bncBCFKT2ENXMKRBQ73UCNQMGQEU4MH4YA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D6661E772
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Nov 2022 00:05:40 +0100 (CET)
Received: by mail-oi1-x23f.google.com with SMTP id y1-20020a056808130100b00359cb5ea927sf3996186oiv.12
        for <lists+jailhouse-dev@lfdr.de>; Sun, 06 Nov 2022 15:05:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1667775939; cv=pass;
        d=google.com; s=arc-20160816;
        b=suNYq1dcA9N7NS23BkvoLcR1jTMwVSI9ZBNMrO39gSQUySJ87pLyUpU6S4ojNYOc9m
         pgfvYXQBQRS7ROCXi/RzUwfRmrz72brIibjLi5Nzi8ZxU0GYZz1czwiyeaja7ls5czUG
         gQzmt81GW1Pc0KJbuFRBeH2/aHp8XK08EK5DIKooSHntUA1A8T/42VdnNoTO9IPeMuis
         /yQ5ZdhqaUrH3tZtpq8b38XuzQvuxl7tuPzjtGgw9su+FqWYdFDewp+1yTaKEI+eqRWF
         jaafe7xqoUYeHEij2EXe/zy4tUXH0IMoF/Bw+T9kNvyliJp9tHZFyNW1R9MsKzuhbIGW
         UhBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature;
        bh=B14cqqNF2ZksncDq7gCmdlc+V7Uuf1Sm3Py5i1Ib0g8=;
        b=D6CdVC6ap1g2CBwfe4v2UsoUXhUGYEG1hfW38HBMbosp0lKn2dyrDIJtvOuEzEzwRt
         gCpwpgvrMGI7MvqHGMaWEsb5K77HfZ9/ZqUsMyRqeMgdq2CnQ9coYzDYjDfiCoq8uSxN
         asr/Q/GkxegfNCbnC+lzs1JC+rYlCF4zhXJzpVn1p+eauAu3PUzRKygafR9kWH5TmhXr
         T881qfv6fOE2yiRDsd+yVmlGkS7nD0PmdIhu0S2YpHZIs3hcx4JHwKZZXPMx9eag5oxX
         weu4y1HRjVjNl1vSlU7rv+AP7j/UjUr722GpXPIufX9WT3jE2UC42SQ3nYxfwwHokckT
         VK7w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:references:in-reply-to:message-id:date:subject:cc
         :to:from:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B14cqqNF2ZksncDq7gCmdlc+V7Uuf1Sm3Py5i1Ib0g8=;
        b=lLwEJ+rHOOQwJvii9X06ykXckma3umGPMGn7gkRbJGWsslIC3XugmtQWiE60PztE1H
         FT9u2qp0K0NqItAWxowffDIWovTAWAiIkB4AlcFueF1TqAy33X1eXFolWJeHGVkPgoq9
         Hf4Nu/mzzz3VZ2/hEpI1wbfXjTdMBwLa55A+vLUPR6gXRmXedprxYTt3bG2OT6k53eF9
         yM+KbxHptmdExcmPFO5TuEl1iAdkbK/8qDLQhNeMP3drYZN24zciXEgdhwgMUvIdFxG4
         X1Fx4Qs6nRM6LQQuvJdiZKWiJyAwjq32B7CzPZPkANvVjlvuBXe4CamzdCknML7j7Lk9
         seGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B14cqqNF2ZksncDq7gCmdlc+V7Uuf1Sm3Py5i1Ib0g8=;
        b=Z0mU5tIImtKpZ8ThRsO2mHVmx3OXzHKS0u2cUkYg9UFXuq+ZPhkj1aG9djV40p5TIA
         W1UcSb3Bupl3t8rsI/TUKCk0dD1AfNKS496TLRasla3s80GiWzuq/N1r1uFUaq9H1Tlt
         dlLf7mmSTKgcxgxkscbOPbx86psK8GaxaeOr8xGhiYkyXenC7F9Ao80W6QI99bwu84om
         Kmy+QuQ2nFtEFZh2aMDn73E4sEq+ti91Z5w855qc1HXTcpdzhmrBGo0sEQMA5nNqUoBw
         fFFu6jkN8gkZAZ2iNWCzg1+TJwAUOK5oBpAcB1YuUdtVwfe4R1G+zzT6lNiep6CgUKX3
         JrIg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf35bnLfOQ5qfh9VVRJeG99n7g/H2bGQS8mY94cPO/jTMFq1CMqc
	oHjcdMZ0P++8JuuYXf+Bu7Q=
X-Google-Smtp-Source: AMsMyM6hjT4w34ZlvEKFrGcSTgZ0bZANTW0tLvD3t+phwYF4fUW2vwsFbI4RA1crjJZSwBcu/kQf0g==
X-Received: by 2002:a05:6870:d210:b0:13b:9601:89fb with SMTP id g16-20020a056870d21000b0013b960189fbmr20102794oac.203.1667775939689;
        Sun, 06 Nov 2022 15:05:39 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:88a1:0:b0:49e:a5a0:99d0 with SMTP id j30-20020a4a88a1000000b0049ea5a099d0ls259478ooa.9.-pod-prod-gmail;
 Sun, 06 Nov 2022 15:05:39 -0800 (PST)
X-Received: by 2002:a4a:c014:0:b0:497:d84c:dd7f with SMTP id v20-20020a4ac014000000b00497d84cdd7fmr20072499oop.11.1667775939098;
        Sun, 06 Nov 2022 15:05:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667775939; cv=none;
        d=google.com; s=arc-20160816;
        b=SKazlqMXIAWZksXq7rHxlRdAt2reTRg/jwvNXVbz/HE7fj/eBP8HotPuRu79GVYSMb
         sI+psFIvnw2sf7ANM7u8zfsBDesqAal1H3cqX0lvi5+BIkPWALB5XuDrQsxGoppOefm3
         /YpzhhWyrs4NvQMs6expG9lTqUIq6dAIXMZHoRGXkbqBrlT7ZiJWNGFbCvzoTpcDmA92
         t4FXJekPZa9+/klc6bncOyVvHGikGgu1ppzBoM/vOuWJXMBrXO9KWLEESt01vXrE3ESX
         NFZ2izU+J196VzY3qa7H6JDmFyXQa9a/XB/9/gj394ALoIUtWrac5Vdooz4jp6Qy/LaR
         YlXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=BZ+I+uESTorDCcI83CPJ9gqumj5Tw5SXrRPiMA46kzc=;
        b=L42mVmO5dPRRhOERC5jNp5uZmichhvc+b9tJNmBngAvD70XmjDndf3x9C4Ikv1PN9e
         DVSyvN/Mn+SY2WxvzXkgcfD0bLB9WNLYmDdOp1+XBXLOu+NRwGzzYYJG4ZFqFgPQSdW1
         1hMS4C1TtDmBiE5CRsNDG4j/a3YH6GJf/qAjL0kudbRqg8K3VgQV++KdZcWwOfgU/HWo
         NuHpef3YfgbWH8+IwpQAUuEHt9EQZcG6nCeoUMYdJW01E7EBAmu6ITBnPPzZgFEyL/ok
         lSd8PkHM5ZvMtamv093r5cV5EBdqm2IosHaEVzMmideTLqxDCWIBWrkeCm4PQRtjo7uQ
         xwJQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com. [210.160.252.171])
        by gmr-mx.google.com with ESMTP id v3-20020aca6103000000b00359a21e3ffesi223291oib.2.2022.11.06.15.05.38
        for <jailhouse-dev@googlegroups.com>;
        Sun, 06 Nov 2022 15:05:39 -0800 (PST)
Received-SPF: pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) client-ip=210.160.252.171;
X-IronPort-AV: E=Sophos;i="5.96,142,1665414000"; 
   d="scan'208";a="139133155"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Nov 2022 08:05:37 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5E8F740071E7;
	Mon,  7 Nov 2022 08:05:36 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: jailhouse-dev@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Chris Paterson <chris.paterson2@renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RESEND 3/3] configs: arm64: Add demo cell config for Renesas RZ/G2M
Date: Sun,  6 Nov 2022 23:05:23 +0000
Message-Id: <20221106230523.22567-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20221106230523.22567-4-prabhakar.mahadev-lad.rj%40bp.renesas.com.
