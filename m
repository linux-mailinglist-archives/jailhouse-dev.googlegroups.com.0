Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBOU3TTTQKGQEX7JAGQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33f.google.com (mail-ot1-x33f.google.com [IPv6:2607:f8b0:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8DD28C30
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 23:16:44 +0200 (CEST)
Received: by mail-ot1-x33f.google.com with SMTP id e3sf3465313otk.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 14:16:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558646203; cv=pass;
        d=google.com; s=arc-20160816;
        b=sUuqDBY/Vaf1o+YfZxTC3xByIcFSOecxsc9wikQ9RNdMWyShp/BmhEIv6VYQXiYJp5
         bq2H3vej4KmN1/GYTaAkfPLimN+4NIkUxiGxR1/5wro6L1m6KZo7AInk/Kp3z7i/V3F3
         Qv3KpdSpgDH3/ogvlTxw7AcVsXLShEIPZzTHM7Q+oAHAf+DTPISltlGUSbUqDieODNCp
         hCvEycbvFiy6+lFiUPTs2TEyeox7+/xn+7HsubT1Yng2XWKKc1YFZ6jAIWXgSBz13CQN
         L+WWoF6gkCIfanvHU2vkWYAO2QysevHCkc6AdL3Utbqoxj08Un0yVqnjZCHEyByNAV9e
         r5Zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=bjZVBkeo2doFDCrsai8tMy4lAmMtzOAcESTBdqMR5Nk=;
        b=CrLKzHJjNr8Kn39s5M1bVfjwwTmewfmCtl+s9YpCQikmP7XbUOpegY6IMdMCkSvDfz
         nuUNGibtCe42CkjfgW1i09S2vWyH167+Skq4Apbcn8MZDnwT6zHf6iftsBHvHl1nrOgg
         Ca5CsW6qa+816Ougcwh3VkbAUcGyWXqAxhvJo7tZSYxd9dxA6d4aAFf/4qKgpWHAqAKD
         CrutjZqG7Hwdz1cNp8gt2tUjwISRrsvwHyBZypP5VJPU61xWC1Vg8hCXLGjpRCZDUDv7
         hzYZVuzN68JsrlcJEF4hUxw1JuY6ncnGXeeIx9xSntaMHiZMXjchyXKOY6BFwg+newss
         52iA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=X+S6LN8D;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bjZVBkeo2doFDCrsai8tMy4lAmMtzOAcESTBdqMR5Nk=;
        b=j4zEfZX4R11MAkpk3x1qMSYtPHD7cg2NawGl+sQ65UX1bWNJwD2FcBAyXY9hxabECu
         ghS/+mCJHXjDTHBrVSstz7LjM1FbFrLJn5sNzbMgq+f98s5CeD9435v9lFrPXUOsajwv
         yOM0Vqmm++AjLAcl1tF8ZTQ2i7zPUj1DrPNZCtRj5CYSAv59bWugF/q6nqgDLDhiDtv9
         zrY7+a2E5whLnzbXcur+VXh84RoZBElPogdZ7mqDVrFqiT6ZI6+6yKWV5IWBpQck7yvD
         Af2VzCBy+Pp28oUjn/Jp3fVNvhr4n7Qd5fLuHfWoQJRjPusKj2nXBD888TzF77LpDY+N
         JsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bjZVBkeo2doFDCrsai8tMy4lAmMtzOAcESTBdqMR5Nk=;
        b=WsrpY5O5joY79rVP8XPBPZ1s9is5TW+TQJ3zyz26w59lrKXQZXcCwaRkS2tKGDUIkB
         DY3uQqWre2EBqLcoxMoG/N18wu9NMqGbfEC1i5+qf0+opdCCV38rsPCK0U6wGety4wu5
         /DBPP1iU7PF7doNWCU4pX+dwmKskRtV+1+0W60ofetVxNmCtXjHGw/G5N542AJrnnRag
         mh45qo8Rd+Hqtg1T90qZq59x1GRvBufe+nDqrFRw0G3KfYGxa3psHV6uXEL1o9DXF09p
         +aDiY3gxPVV5tEgbMz/UWdZ1UFIs4J7VSrdUGCPQPPXWh7+/d6NCLb6M7v5KI9McUedE
         DLsw==
X-Gm-Message-State: APjAAAVLQ2o5glPbw7YSSGVOPcCT3vo2nbO1/ImcBBFTtIc3pjWF7n6E
	GLxfvWkKC5vyIme2X31MVzY=
X-Google-Smtp-Source: APXvYqxx353ynqW4FFWyrtWWYZrxa0afEgplw7sxjuGDC9X4JqQBXDOLPGLfjGt1B6kahWvEG/ShmQ==
X-Received: by 2002:aca:3689:: with SMTP id d131mr3912302oia.10.1558646202796;
        Thu, 23 May 2019 14:16:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:6141:: with SMTP id v62ls1151928oib.9.gmail; Thu, 23 May
 2019 14:16:42 -0700 (PDT)
X-Received: by 2002:aca:c5d7:: with SMTP id v206mr97033oif.20.1558646202048;
        Thu, 23 May 2019 14:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558646202; cv=none;
        d=google.com; s=arc-20160816;
        b=gD7UBpPIFMsyFQkYwynh4GHBWt2zAr64Erh3fb6lvoG8RxRGL+ds1yUXYUS3PXIaML
         b/MbUWLPJ+LDRyeL1bobsKmszAevdcvh64dizpkzGdXk3ishggFU/Qyui9z+72Ohh4Kh
         Is3/lu1oMqmYVSfKt9rqODykWJrhNTdd4bG81eyZq6BiijUZIZuSQDxkdIfDsuqXVn0q
         h2O2b8C/77ps6pA2VneWr3nqrIFnGeqO1AJIGMfgWnVgJ1/xOo/E3Krrhz5jntdw/9EE
         6KVazsBwTCJtZvBgDrTnGYKhtelOIrSviXxOQ4Is5Tr6qG9ZeWPnEAE8Hiau7oxKayvj
         ggVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cyLu9+2Hs0LyXrpVSR0uL9sXMwjVb3Cn/Of6kCHBwlI=;
        b=ANfw7GRdltTb9ZVy7zMmVhIc7jst73m3tvDr3mroqN1qWhDAqE8DSaMiJ6sOlotsvL
         aOH7bt/Gaq4TLjDqilcEIsLCpRXRvKKRmeKTtT15cb8fiuaShVt0sYqxu5IwOycrD92p
         ySAygzOMrfRgNzcVSORlqztr/gGnwR62S7jdDdSqm9cab9HJrOlCetMbsOIBq1yBCIYt
         IF47lLdGLprpLoZqwQzzFKcvE8LKKzKx9CSs2xlBJ62S6dYk3qzFN+06qliVmEmqbeAn
         c1Izyiqe+4k4xg6/8dKpMbLW3r89AxSggn1VBt3zQT8ct3K+Vx6AmmHaQFsQAX7hhPhr
         /hLw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=X+S6LN8D;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id e23si60921otr.0.2019.05.23.14.16.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 14:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4NLGfWs066846;
	Thu, 23 May 2019 16:16:41 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4NLGfau055815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 May 2019 16:16:41 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 23
 May 2019 16:16:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 23 May 2019 16:16:41 -0500
Received: from NiksLab.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4NLGfOa116843;
	Thu, 23 May 2019 16:16:41 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH 3/5] configs: arm64: Add Linux demo for j721-evm board
Date: Thu, 23 May 2019 16:16:21 -0500
Message-ID: <20190523211623.9718-4-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190523211623.9718-1-nikhil.nd@ti.com>
References: <20190523211623.9718-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=X+S6LN8D;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

Add the linux demo cell config for j721e-evm board.
Also add the required device tree for booting Linux kernel
in the inmate cell.

This cell config acts as a reference for partitioning
devices across the 2 Linux cells.
This will be updated as support for more devices get added.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 configs/arm64/dts/inmate-k3-j721e-evm.dts | 180 ++++++++++++++++++++++
 configs/arm64/k3-j721e-evm-linux-demo.c   | 163 ++++++++++++++++++++
 2 files changed, 343 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-k3-j721e-evm.dts
 create mode 100644 configs/arm64/k3-j721e-evm-linux-demo.c

diff --git a/configs/arm64/dts/inmate-k3-j721e-evm.dts b/configs/arm64/dts/inmate-k3-j721e-evm.dts
new file mode 100644
index 00000000..4701889f
--- /dev/null
+++ b/configs/arm64/dts/inmate-k3-j721e-evm.dts
@@ -0,0 +1,180 @@
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	model = "Texas Instruments J721E Inmate Model";
+	compatible = "ti,j721e-evm", "ti,j721e";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial1 = &main_uart1;
+	};
+
+	chosen {
+		stdout-path = "serial1:115200n8";
+	};
+
+	memory@d0000000 {
+		device_type = "memory";
+		reg = <0x0 0xd0000000 0x0 0x1fff0000>;
+	};
+
+	hypervisor {
+		compatible = "jailhouse,cell";
+	};
+
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@1 {
+			compatible = "arm,cortex-a72","arm,armv8";
+			reg = <0x001>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+	};
+
+	timer-cl0-cpu0 {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* cntpsirq */
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* cntpnsirq */
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* cntvirq */
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* cnthpirq */
+	};
+
+	psci: psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	pmu: pmu {
+		compatible = "arm,armv8-pmuv3";
+		/* Recommendation from GIC500 TRM Table A.3 */
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+
+	pci@76000000 {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		bus-range = <0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map =
+		<0 0 0 1 &gic 0 0 GIC_SPI 163 IRQ_TYPE_EDGE_RISING>,
+		<0 0 0 2 &gic 0 0 GIC_SPI 164 IRQ_TYPE_EDGE_RISING>,
+		<0 0 0 3 &gic 0 0 GIC_SPI 165 IRQ_TYPE_EDGE_RISING>,
+		<0 0 0 4 &gic 0 0 GIC_SPI 166 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0x76000000 0x0 0x100000>;
+		ranges =
+		<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+	};
+
+	soc0: soc0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gic: interrupt-controller@1800000 {
+			compatible = "arm,gic-v3";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			/*
+			 * NOTE: we are NOT gicv2 backward compat, so no GICC,
+			 * GICH or GICV
+			 */
+			reg = <0x0 0x01800000 0x0 0x10000>,	/* GICD */
+			      <0x0 0x01900000 0x0 0x40000>;	/* GICR */
+		};
+		dmsc: dmsc@44083000 {
+			compatible = "ti,k2g-sci";
+			ti,host-id = <13>;
+
+			mbox-names = "rx", "tx";
+
+			mboxes= <&secure_proxy_main 16>,
+				<&secure_proxy_main 18>;
+
+			reg-names = "debug_messages";
+			reg = <0x00 0x44083000 0x0 0x1000>;
+
+			k3_pds: power-controller {
+				compatible = "ti,sci-pm-domain";
+				#power-domain-cells = <2>;
+			};
+
+			k3_clks: clocks {
+				compatible = "ti,k2g-sci-clk";
+				#clock-cells = <2>;
+				ti,scan-clocks-from-dt;
+			};
+
+			k3_reset: reset-controller {
+				compatible = "ti,sci-reset";
+				#reset-cells = <2>;
+			};
+		};
+
+		main_uart1: serial@2810000 {
+			compatible = "ti,am654-uart";
+			reg = <0x00 0x02810000 0x00 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <48000000>;
+			current-speed = <115200>;
+			power-domains = <&k3_pds 278 0>;
+			clocks = <&k3_clks 278 0>;
+			clock-names = "fclk";
+		};
+
+		main_sdhci0: sdhci@4f80000 {
+			compatible = "ti,j721e-sdhci-8bit";
+			reg = <0x0 0x4f80000 0x0 0x1000>, <0x0 0x4f88000 0x0 0x400>;
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&k3_pds 91 0>;
+			clock-names = "clk_xin", "clk_ahb";
+			clocks = <&k3_clks 91 1>, <&k3_clks 91 0>;
+			assigned-clocks = <&k3_clks 91 1>;
+			assigned-clock-parents = <&k3_clks 91 2>;
+			bus-width = <8>;
+			ti,otap-del-sel = <0x2>;
+			ti,trm-icp = <0x8>;
+			dma-coherent;
+			non-removable;
+			ti,driver-strength-ohm = <50>;
+		};
+
+
+		main_navss_intr: interrupt-controller1 {
+			compatible = "ti,sci-intr";
+			interrupt-controller;
+			interrupt-parent = <&gic>;
+			#interrupt-cells = <3>;
+			ti,sci = <&dmsc>;
+			ti,sci-dst-id = <14>;
+			ti,sci-rm-range-girq = <4>;
+		};
+
+		secure_proxy_main: mailbox@32c00000 {
+			compatible = "ti,am654-secure-proxy";
+			#mbox-cells = <1>;
+			reg-names = "target_data", "rt", "scfg";
+			reg = <0x00 0x32c00000 0x00 0x100000>,
+			<0x00 0x32400000 0x00 0x100000>,
+			<0x00 0x32800000 0x00 0x100000>;
+			interrupt-names = "rx_016";
+			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+};
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
new file mode 100644
index 00000000..d0eaacc3
--- /dev/null
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -0,0 +1,163 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for Linux inmate on J721E based platforms
+ * 1 CPUs, 512MB RAM, 1 serial port
+ *
+ * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *  Lokesh Vutla <lokeshvutla@ti.com>
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
+	struct jailhouse_memory mem_regions[10];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "j721e-evm-linux-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.pio_bitmap_size = 0,
+		.cpu_reset_address = 0x0,
+		.vpci_irq_base = 195 - 32,
+		.console = {
+			.address = 0x40a00000,
+			.divider = 0x1b,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xcfb00000,
+			.virt_start = 0xcfb00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Main.uart1 */ {
+			.phys_start = 0x02810000,
+			.virt_start = 0x02810000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sdhci0 */ {
+			.phys_start = 0x4f80000,
+			.virt_start = 0x4f80000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* sdhci0 */ {
+			.phys_start = 0x4f88000,
+			.virt_start = 0x4f88000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* main sproxy target_data host_id=A72_3 */ {
+			.phys_start = 0x3240f000,
+			.virt_start = 0x3240f000,
+			.size = 0x05000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* main sproxy rt host_id=A72_3 */ {
+			.phys_start = 0x3280f000,
+			.virt_start = 0x3280f000,
+			.size = 0x05000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* main sproxy scfg host_id=A72_3 */ {
+			.phys_start = 0x32c0f000,
+			.virt_start = 0x32c0f000,
+			.size = 0x05000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* linux-loader space */ {
+			.phys_start = 0xefff0000,
+			.virt_start = 0x0,
+			.size = 0x10000,	/* 64KB */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM load */ {
+			.phys_start = 0xd0000000,
+			.virt_start = 0xd0000000,
+			.size = 0x1fff0000,	/* (512MB - 64KB) */
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
+
+	.irqchips = {
+		/*
+		 * offset = (SPI_NR + 32 - base) / 32
+		 * bit = (SPI_NR + 32 - base) % 32
+		 */
+		{
+			.address = 0x01800000,
+			.pin_base = 32,
+			.pin_bitmap = {
+			0x8, 0x80, 0x0, 0,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 160,
+			.pin_bitmap = {
+			0x0, 0x8, 0x2, 0,
+			},
+		},
+	},
+
+	.pci_devices = {
+		/* 00:00.0 */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 0x00,
+			.bar_mask = {
+				0xffffff00, 0xffffffff, 0x00000000,
+				0x00000000, 0x00000000, 0x00000000,
+			},
+			.shmem_region = 0,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190523211623.9718-4-nikhil.nd%40ti.com.
For more options, visit https://groups.google.com/d/optout.
