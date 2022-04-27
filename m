Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRB2XAUKJQMGQE6BLFCRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3b.google.com (mail-oo1-xc3b.google.com [IPv6:2607:f8b0:4864:20::c3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F94C510F06
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 04:54:36 +0200 (CEST)
Received: by mail-oo1-xc3b.google.com with SMTP id y12-20020a4a86cc000000b00324cb8287a4sf404647ooh.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 26 Apr 2022 19:54:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651028075; cv=pass;
        d=google.com; s=arc-20160816;
        b=aOTBrKx+nyvLHqj+9ZN5bWIbSzTwlEMriQqZHs2nRUQugr9D7uJVLOCb1YV4UrS4c7
         SMSPQufiepu6Tpv9OUBURDRpIpPLLPhXDoPspT1NqN4l/T9oWe6y9qB35aHZ7ikG8miA
         zItLUpg+16PbAvgzfvkl/W0XMiWeLxf66s+bNVzuWFwCk5WI0Kv5HeVZHGfFGl+Gvdrd
         aLaB1JYnCfllfCedwBI3ze9fF+gjcU6C5flbsXQHu66e1vRyDeOAWKTkjhYpx39qMZE3
         QxSDPx6PNuF63fbNSn9plwMBWOYMJIdO6VXMjEL4x72hXCB3QyECq0vcjdnMFY+KWiRk
         zXbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=pQsbpYV78SeeyV45lR3hwWS7uq0C9ctxBxBqyyhI1hk=;
        b=RPASkLfu16+k2Is+n/BmXYcVUqGZisCMxK3V0IWY6H6xPI+c1GxMg7JjXmAbZGb7QU
         xVvIYGpw60u7r/xUdXhhxfeC3odcM+szX33tKQFMyaI1gNmBYyRoa5EBwO50siPtvwdT
         bfeNZ5BQ9gj91mbMiO2haCbNF/dfEz71l+iAI8fJGMpWw4myd+3z5CRo+3cXAxr1UlaM
         mWDihYycN62krXlFnZPQrQRAz7fHJgW2hAkR8SvBk2qK4a0claAB2nnIsSt1o8Kq6917
         2MVGykmiGcO21n7rA07EEynL1L1+SoPzLeYfTuudL8fpiimhBMZF+gNOJRfMKq6Djzgd
         SpFA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=n4CSMJk5;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=pQsbpYV78SeeyV45lR3hwWS7uq0C9ctxBxBqyyhI1hk=;
        b=Uvzttbc8cENtlAqyVuMBfztZcTTTaO9VRltsx9TkLeMcRLW8c2VHfWrGH1LQexgeg0
         fFh55sycEGFhDQpksPFjk7u4nemKDIiAFPnCYAE1jm9LuTERsKttpnwNvvbWgiNFNXe4
         0ZZg9CRvzNbDAo151bh+VDpMokENYiyPZkn7GZr0q49SdI7X3M73KKQLOgXruArqzabH
         pz40gfDdgDnjF++4aYZYLgf2Zao0fJcztCQI0uePDmOd4qxWlKTIURwfqv0x2bIrbMaj
         0eknxRLQbJ02eJvpbu78Jn5G6uNJ33LYdrRP3JYgMd9V1Flarof/i0V7KKL7T5wZY5Qe
         oMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pQsbpYV78SeeyV45lR3hwWS7uq0C9ctxBxBqyyhI1hk=;
        b=MyQulcKEXwu1Fzg5Q1KlP9ylXRCKdKtK78JmWZJ9RjhNLS3c9sLNKHQiZpVXLiztDV
         VZ0O8sUz/GfmGFy8qtb+YUvEHQoUXyIQds1tRIdP4bioYMHD47UPxymP0b1KbL/uPzpm
         vUGxniH1f2CFDSboYQUBZTOtPMT75ealinvmK5r/wTURZgg9iG75lFyCp9EHNsYG9kiD
         Lh0fhRNQ8tm7E4TfsccXfxdN8hT5TCacvZ/aYCIQ/tRCuokEaFPiRcNsKP4mBfB9/Fcg
         Zzh92c269g+Jw32MhD0aIZbmnwD7eDRQXEBxYuXfPQA8A5HEJ4WDmsLhQ1+3kBxA6rUA
         v6vg==
X-Gm-Message-State: AOAM533dCZTNeb1U2Z7NYmRZ5xP1yzK3TmBir/yA/uooDJYpeiiaNWNh
	RBXOy3myScYMZCgl8qKODM4=
X-Google-Smtp-Source: ABdhPJxng4ocklaF9qyipxHiBaAfXNrAWh8uUWU2Mrdrz8j6EdURDLfrdF+ieLKohXjtH4DB4A9C0Q==
X-Received: by 2002:a05:6870:4617:b0:de:44ca:5e52 with SMTP id z23-20020a056870461700b000de44ca5e52mr10390039oao.170.1651028074878;
        Tue, 26 Apr 2022 19:54:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6871:154:b0:e9:6abf:f9bb with SMTP id
 z20-20020a056871015400b000e96abff9bbls1544867oab.7.gmail; Tue, 26 Apr 2022
 19:54:34 -0700 (PDT)
X-Received: by 2002:a05:6870:241c:b0:e1:a94d:6100 with SMTP id n28-20020a056870241c00b000e1a94d6100mr14402876oap.222.1651028073991;
        Tue, 26 Apr 2022 19:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651028073; cv=none;
        d=google.com; s=arc-20160816;
        b=sOhZ66iBL4wA0y3iHLbaaOYvbrB46ewdc4o74k1CgmRVWZKv7BkwRNkjq2Jt/5WNwq
         uMyi0yngcZJ3pTI8PSmlsA/NpFJrg9CpQEnFcFFxfaxV9Yljfm/JzrBga8GzNsSydHtb
         NScX0xeEyUhaIyYQ4YzMsDcMzsj+caxxzx6ajavwbTF0S0+LXqGRgVzgaCPx760lLHsR
         bPcW0zJReNXglLzeSvb8Q6odgQVhBi/xfv6YJzur4/LA//PtSZ24r3BstzLvFvaoYqYf
         G8nxqRauigdpSA8KiwcUCmi1zuUn+b25AAgB22XH+ZyZwIzQ6KgDz92FxcSlBmjTSWnN
         qXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=BAOWO1tllH1dAKiUN1GZtmKBddd5rY1HtkkfqAoZY6c=;
        b=BWD/7M5Dr7+B12V4Plk68FrzI50dYQZ6ZuXI7cwIY4ioogNbYIQoF9TDvHAMW0MQ+A
         432k9m3xsJ7vVvc5faF+cMKZ2e+mhzCci2AduCWaGxyq0pIFEu1UIghliqs2dJHdAZSw
         3tg/WzZPm53HPkPmJh6E0h1K24H4ASSWpjAlE8CLrsoeoI5EYL8xQutQ7t5giseBROtJ
         pRn10MRMM7xu5ACSaAGOEK0MVyWeEOc+aaO3yz0s+EA+YqpJRPRUHUKuY4fYm5XqOUMI
         gCj9qzs2eFpI+qu1DOwbS2jb5Kxs3v/nM18DVcSLz8yT97Tg5MYm1RNhrGz/xJE2gYyN
         gX3Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=n4CSMJk5;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id du27-20020a0568703a1b00b000ddbc266799si48671oab.2.2022.04.26.19.54.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Apr 2022 19:54:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23R2sXwo027172
	for <jailhouse-dev@googlegroups.com>; Tue, 26 Apr 2022 21:54:33 -0500
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23R2sXPR010273
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Tue, 26 Apr 2022 21:54:33 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 21:54:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 21:54:32 -0500
Received: from ubuntu.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23R2sTKd096744;
	Tue, 26 Apr 2022 21:54:30 -0500
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: Matt Ranostay <mranostay@ti.com>
Subject: [PATCH] configs: arm64: add support initial support for AM625 Starter Kit platform
Date: Tue, 26 Apr 2022 19:54:19 -0700
Message-ID: <20220427025419.3485-1-mranostay@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=n4CSMJk5;       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=mranostay@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Matt Ranostay <mranostay@ti.com>
Reply-To: Matt Ranostay <mranostay@ti.com>
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

Add support for TI AM625 Starter Kit platform along with eMMC and non-eMMC
Linux inmate cell configurations.

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 configs/arm64/dts/inmate-k3-am625-sk-emmc.dts |  28 ++
 configs/arm64/dts/inmate-k3-am625-sk.dts      | 163 +++++++++
 configs/arm64/k3-am625-inmate-demo.c          |  72 ++++
 configs/arm64/k3-am625-sk-linux-demo.c        | 220 ++++++++++++
 configs/arm64/k3-am625-sk.c                   | 317 ++++++++++++++++++
 5 files changed, 800 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-k3-am625-sk-emmc.dts
 create mode 100644 configs/arm64/dts/inmate-k3-am625-sk.dts
 create mode 100644 configs/arm64/k3-am625-inmate-demo.c
 create mode 100644 configs/arm64/k3-am625-sk-linux-demo.c
 create mode 100644 configs/arm64/k3-am625-sk.c

diff --git a/configs/arm64/dts/inmate-k3-am625-sk-emmc.dts b/configs/arm64/dts/inmate-k3-am625-sk-emmc.dts
new file mode 100644
index 00000000..2fb07d52
--- /dev/null
+++ b/configs/arm64/dts/inmate-k3-am625-sk-emmc.dts
@@ -0,0 +1,28 @@
+/dts-v1/;
+
+#include "inmate-k3-am625-sk.dts"
+
+/ {
+	sdhci0: mmc@fa10000 {
+		compatible = "ti,am62-sdhci";
+		reg = <0x0 0xfa10000 0x0 0x260>, <0x0 0xfa18000 0x0 0x134>;
+		power-domains = <&k3_pds 57 1>;
+		clocks = <&k3_clks 57 5>, <&k3_clks 57 6>;
+		clock-names = "clk_ahb", "clk_xin";
+		interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+		mmc-ddr-1_8v;
+		mmc-hs200-1_8v;
+		ti,otap-del-sel-legacy = <0x0>;
+		ti,otap-del-sel-mmc-hs = <0x0>;
+		ti,otap-del-sel-ddr52 = <0x9>;
+		ti,otap-del-sel-hs200 = <0x6>;
+	};
+};
+
+&sdhci0 {
+	/* eMMC */
+	non-removable;
+	ti,driver-strength-ohm = <50>;
+	bus-width = <8>;
+	disable-wp;
+};
diff --git a/configs/arm64/dts/inmate-k3-am625-sk.dts b/configs/arm64/dts/inmate-k3-am625-sk.dts
new file mode 100644
index 00000000..c1455073
--- /dev/null
+++ b/configs/arm64/dts/inmate-k3-am625-sk.dts
@@ -0,0 +1,163 @@
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	model = "Texas Instruments AM625 Inmate Model";
+	compatible = "ti,am625-evm", "ti,am625";
+	interrupt-parent = <&gic500>;
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
+	memory@e0000000 {
+		device_type = "memory";
+		reg = <0x0 0xe0000000 0x0 0x1fff0000>;
+	};
+
+	hypervisor {
+		compatible = "jailhouse,cell";
+	};
+
+	psci: psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a53";
+			reg = <0x001>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@2 {
+			compatible = "arm,cortex-a53";
+			reg = <0x002>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			compatible = "arm,cortex-a53";
+			reg = <0x003>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+	};
+
+	pmu: pmu {
+		compatible = "arm,armv8-pmuv3";
+		/* Recommendation from GIC500 TRM Table A.3 */
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	a53_timer0: timer-cl0-cpu0 {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* cntpsirq */
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* cntpnsirq */
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* cntvirq */
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* cnthpirq */
+	};
+
+	cbass_main: interconnect@f0000 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gic500: interrupt-controller@1800000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0x00 0x01800000 0x00 0x10000>,	/* GICD */
+			      <0x00 0x01880000 0x00 0xC0000>;	/* GICR */
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		main_uart1: serial@2810000 {
+			compatible = "ti,am64-uart", "ti,am654-uart";
+			reg = <0x00 0x02810000 0x00 0x100>;
+			interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&k3_pds 152 1>;
+			current-speed = <115200>;
+			clock-frequency = <48000000>;
+		};
+
+		pci@76000000 {
+			compatible = "pci-host-ecam-generic";
+			device_type = "pci";
+			bus-range = <0 0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map =
+			<0 0 0 1 &gic500 GIC_SPI 157 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 2 &gic500 GIC_SPI 158 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 3 &gic500 GIC_SPI 159 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 4 &gic500 GIC_SPI 160 IRQ_TYPE_EDGE_RISING>;
+			reg = <0x0 0x76000000 0x0 0x100000>;
+			ranges =
+			<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x20000>;
+		};
+
+		dmss: bus@48000000 {
+			compatible = "simple-mfd";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges;
+			ranges = <0x00 0x48000000 0x00 0x48000000 0x00 0x06400000>;
+
+			ti,sci-dev-id = <25>;
+
+			secure_proxy_main: mailbox@4d000000 {
+				compatible = "ti,am654-secure-proxy";
+				#mbox-cells = <1>;
+				reg-names = "target_data", "rt", "scfg";
+				reg = <0x00 0x4d000000 0x00 0x80000>,
+				      <0x00 0x4a600000 0x00 0x80000>,
+				      <0x00 0x4a400000 0x00 0x80000>;
+				interrupt-names = "rx_014";
+				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		dmsc: system-controller@44043000 {
+			compatible = "ti,k2g-sci";
+			ti,host-id = <13>;
+			mbox-names = "rx", "tx";
+			mboxes = <&secure_proxy_main 14>,
+				 <&secure_proxy_main 15>;
+			reg-names = "debug_messages";
+			reg = <0x00 0x44043000 0x00 0xfe0>;
+
+			k3_pds: power-controller {
+				compatible = "ti,sci-pm-domain";
+				#power-domain-cells = <2>;
+			};
+
+			k3_clks: clock-controller {
+				compatible = "ti,k2g-sci-clk";
+				#clock-cells = <2>;
+			};
+
+			k3_reset: reset-controller {
+				compatible = "ti,sci-reset";
+				#reset-cells = <2>;
+			};
+		};
+	};
+};
diff --git a/configs/arm64/k3-am625-inmate-demo.c b/configs/arm64/k3-am625-inmate-demo.c
new file mode 100644
index 00000000..65cf4a7f
--- /dev/null
+++ b/configs/arm64/k3-am625-inmate-demo.c
@@ -0,0 +1,72 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for demo inmate on K3 based platforms.
+ * 1CPU, 64K RAM, 1 serial port(MCU UART 0).
+ *
+ * Copyright (c) 2019, 2022 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *  Nikhil Devshatwar <nikhil.nd@ti.com>
+ *  Lokesh Vutla <lokeshvutla@ti.com>
+ *  Matt Ranostay <mranostay@ti.com>
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
+	struct jailhouse_memory mem_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+
+		.console = {
+			.address = 0x02810000,
+			.divider = 0x1b,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x4,
+	},
+
+	.mem_regions = {
+		/* MCU UART0 */ {
+			.phys_start = 0x02810000,
+			.virt_start = 0x02810000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0xe0000000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	}
+};
diff --git a/configs/arm64/k3-am625-sk-linux-demo.c b/configs/arm64/k3-am625-sk-linux-demo.c
new file mode 100644
index 00000000..81f4e880
--- /dev/null
+++ b/configs/arm64/k3-am625-sk-linux-demo.c
@@ -0,0 +1,220 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for Linux inmate on AM625 based platforms
+ * 3 CPUs, 512MB RAM, 1 serial port (MAIN UART1)
+ *
+ * Copyright (c) 2022 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *  Matt Ranostay <mranostay@ti.com>
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
+	struct jailhouse_memory mem_regions[18];
+	struct jailhouse_irqchip irqchips[3];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "k3-am625-sk-linux-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.cpu_reset_address = 0x0,
+		.vpci_irq_base = 189 - 32,
+
+		.console = {
+			.address = 0x02810000,
+			.divider = 0x1b,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0xe,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0xdfa00000,
+			.virt_start = 0xdfa00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xdfa10000,
+			.virt_start = 0xdfa10000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Peer 0 */ {
+			.phys_start = 0xdfa20000,
+			.virt_start = 0xdfa20000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Peer 1 */ {
+			.phys_start = 0xdfa30000,
+			.virt_start = 0xdfa30000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Peer 2 */ {
+			.phys_start = 0xdfa40000,
+			.virt_start = 0xdfa40000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory region for 00:01.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xdfb00000, 1),
+		/* RAM load */ {
+			.phys_start = 0xffff0000,
+			.virt_start = 0x0,
+			.size = 0x10000,	/* 64KB */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM load */ {
+			.phys_start = 0xe0000000,
+			.virt_start = 0xe0000000,
+			.size = 0x1fff0000,	/* (512MB - 64KB) */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* MCU UART0 */ {
+			.phys_start = 0x02810000,
+			.virt_start = 0x02810000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+#ifdef CONFIG_ENABLE_AM625_INMATE_CELL_EMMC
+		/* sdhci0 */ {
+			.phys_start = 0x0fa10000,
+			.virt_start = 0x0fa10000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sdhci0 */ {
+			.phys_start = 0x0fa18000,
+			.virt_start = 0x0fa18000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+#endif
+		/* main sproxy target_data host_id=A53_3 */ {
+			.phys_start = 0x4d00e000,
+			.virt_start = 0x4d00e000,
+			.size = 0x3000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* main sproxy rt host_id=A53_3 */ {
+			.phys_start = 0x4a60e000,
+			.virt_start = 0x4a60e000,
+			.size = 0x3000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* main sproxy scfg host_id=A53_3 */ {
+			.phys_start = 0x4a40e000,
+			.virt_start = 0x4a40e000,
+			.size = 0x3000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x1000,
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
+			0,
+			/* sproxy rx_014 */
+			1 << (67 - 64),
+			0, 0
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 160,
+			.pin_bitmap = {
+#ifdef CONFIG_ENABLE_AM625_INMATE_CELL_EMMC
+			/* sdhc */
+			1 << (165 - 160) |
+#endif
+			/* vpci */
+			1 << (189 - 160) |
+			1 << (190 - 160),
+			/* uart */
+			1 << (211 - 192),
+			0, 0,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 544,
+			.pin_bitmap = {
+			0, 0, 0, 0,
+			},
+		},
+	},
+
+	.pci_devices = {
+		/* 00:00.0 */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		/* 00:01.0 */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
diff --git a/configs/arm64/k3-am625-sk.c b/configs/arm64/k3-am625-sk.c
new file mode 100644
index 00000000..2e5c3aef
--- /dev/null
+++ b/configs/arm64/k3-am625-sk.c
@@ -0,0 +1,317 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) 2022 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Configuration for K3 based AM625 EVM
+ *
+ * Authors:
+ *  Matt Ranostay <mranostay@ti.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[31];
+	struct jailhouse_irqchip irqchips[5];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xdfc00000,
+			.size = 0x400000,
+		},
+		.debug_console = {
+			.address = 0x02800000,
+			.size = 0x1000,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0x76000000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.pci_domain = 1,
+			.arm = {
+				.gic_version = 3,
+				.gicd_base = 0x01800000,
+				.gicr_base = 0x01880000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "k3-am625-sk",
+
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.vpci_irq_base = 180 - 32,
+		},
+	},
+
+	.cpus = {
+		0xf,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0xdfa00000,
+			.virt_start = 0xdfa00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xdfa10000,
+			.virt_start = 0xdfa10000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* Peer 0 */ {
+			.phys_start = 0xdfa20000,
+			.virt_start = 0xdfa20000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* Peer 1 */ {
+			.phys_start = 0xdfa30000,
+			.virt_start = 0xdfa30000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* Peer 2 */ {
+			.phys_start = 0xdfa40000,
+			.virt_start = 0xdfa40000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory region for 00:01.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xdfb00000, 0),
+		{
+			.phys_start = 0x01810000,
+			.virt_start = 0x01810000,
+			.size = 0x00070000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		{
+			.phys_start = 0x018a0000,
+			.virt_start = 0x018a0000,
+			.size = 0x00060000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0x80000000,
+			.virt_start = 0x80000000,
+			.size = 0x5fa00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM. Reserved for inmates */ {
+			.phys_start = 0xe0000000,
+			.virt_start = 0xe0000000,
+			.size = 0x20000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* ctrl mmr */ {
+			.phys_start = 0x000f0000,
+			.virt_start = 0x000f0000,
+			.size = 0x00030000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* GPIO */ {
+			.phys_start = 0x00600000,
+			.virt_start = 0x00600000,
+			.size = 0x00002000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* GPU */ {
+			.phys_start = 0x0fd00000,
+			.virt_start = 0x0fd00000,
+			.size = 0x00020000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* TimeSync Router */ {
+			.phys_start = 0x00a40000,
+			.virt_start = 0x00a40000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* First peripheral window, 1 of 2 */ {
+			.phys_start = 0x01000000,
+			.virt_start = 0x01000000,
+			.size = 0x00800000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* First peripheral window, 2 of 2 */ {
+			.phys_start = 0x01900000,
+			.virt_start = 0x01900000,
+			.size = 0x01229000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* Second peripheral window */ {
+			.phys_start = 0x0e000000,
+			.virt_start = 0x0e000000,
+			.size = 0x01d00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* Third peripheral window */ {
+			.phys_start = 0x20000000,
+			.virt_start = 0x20000000,
+			.size = 0x0a008000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* OCSRAM */ {
+			.phys_start = 0x70000000,
+			.virt_start = 0x70000000,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* DSS */ {
+			.phys_start = 0x30200000,
+			.virt_start = 0x30200000,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* DMSS */ {
+			.phys_start = 0x48000000,
+			.virt_start = 0x48000000,
+			.size = 0x06400000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PRUSS-M */ {
+			.phys_start = 0x30040000,
+			.virt_start = 0x30040000,
+			.size = 0x00080000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* USB */ {
+			.phys_start = 0x31000000,
+			.virt_start = 0x31000000,
+			.size = 0x00050000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* USB */ {
+			.phys_start = 0x31100000,
+			.virt_start = 0x31100000,
+			.size = 0x00050000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* CPSW */ {
+			.phys_start = 0x08000000,
+			.virt_start = 0x08000000,
+			.size = 0x00200000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* First Wake Up Domain */ {
+			.phys_start = 0x2b000000,
+			.virt_start = 0x2b000000,
+			.size = 0x00301000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* Second Wake Up Domain */ {
+			.phys_start = 0x43000000,
+			.virt_start = 0x43000000,
+			.size = 0x00020000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCU Domain Range */ {
+			.phys_start = 0x04000000,
+			.virt_start = 0x04000000,
+			.size = 0x01ff2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+	},
+
+	.irqchips = {
+		{
+			.address = 0x01800000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 288,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 416,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 544,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+	},
+
+	.pci_devices = {
+		/* 0001:00:00.0 */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		/* 0001:00:01.0 */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220427025419.3485-1-mranostay%40ti.com.
