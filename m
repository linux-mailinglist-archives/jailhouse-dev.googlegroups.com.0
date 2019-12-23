Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB5FTQPYAKGQERBRVBLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13f.google.com (mail-il1-x13f.google.com [IPv6:2607:f8b0:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9541297D7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 16:15:07 +0100 (CET)
Received: by mail-il1-x13f.google.com with SMTP id n6sf14564718ile.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 07:15:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577114101; cv=pass;
        d=google.com; s=arc-20160816;
        b=zvy0O+zSMI+yVZdh+pgTCh63hcc48ESksMP1wancRgTyQP1c8MCJN8GPa+d/RrZrNU
         XF9krCNUJmHrkJ6PEI9Cj8O8lZBRjM/WEuS/f/qIL2X3WWawx6WNkuMvuQIdM84+5YtL
         eLW4Z5eI2AImZM3U6EHJeEKuZH2mnxo0hkW1Xpx9pniqZv81bcodOFyfyKNw/6kLP3qV
         58+K4ynlxJXg+DKUpQQ+4MfereQF1mSiGtWflJxR7nb/faUOfIZRj1ZavPd0fVrwroH9
         ZEpJanL8PhQDO1IFtCEv0SQcD89WIXys6/tKBX55vpN4MdTT58aBD+I0q7ROl2V9gt41
         eOzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=/uh37BiADmuLEoh0+8S2wAWYeRgT6TJdJxuuE9AsVhE=;
        b=WXIUg/pTri2mga+OldZh23ZRhWVsuB/MSCylNYHwjampPipYn0RmpmpOiQH+iLDH0D
         ky6tQXLlRuUKsrwLcYhpvLcDxEA8abflMGuKnvxj/vAj/ESHO7Vht+2h13uOPMpZLSpX
         jPzLrUSYC8htV5EGFcMxbcwLierkpZlYWljU9EDR8oB6rd02gm8355rKAGEq4BxQUqXA
         YbZUipaDgwpT0DuTW9AFjqdxVV1SvlmeqerXr9OdXBLuFQb6LM86cWrwv2U0vh0t78cg
         9LfHGy23iQ888DAfJ4UtRxUVq5P+LawyudhywmEiBgUUzjY+EubKMyRVXD1FfNesj1iL
         ExJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oY4+HALv;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/uh37BiADmuLEoh0+8S2wAWYeRgT6TJdJxuuE9AsVhE=;
        b=Af+u/XR3xb1fvxPJ/zHV1pw08sowtcyPwh5SGJMTNxqk4clzQitdunfkPYi1GznBwI
         mku2t24GwBH+HQIsnl5r8Aty4mhqkwd9PUnTdaTgA5O6pb2TBnLiajgmhPnpNbjNnU/h
         lSh79jzqUZcHCelgfJbj7vXuTbrx3LYK3HCImaZvTb7gmio5sseKc+aKcdflIwgSxjui
         Oc59VOM2QeQv8Sr+Y9VuAueZGIX7XSXqRXmR0iyKWsDGrP6UDtMUgD4dLZiv3dq4y769
         59aAUzoF5dwMtcF9m1qy+/sTzXIVS2Dn1dLlMLtxjiLAUyHAt6soVZlyzNA6RNDbWEEk
         xFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/uh37BiADmuLEoh0+8S2wAWYeRgT6TJdJxuuE9AsVhE=;
        b=ASC9bBAMvJmFfyWMKxRaTSm8+rcAg7PU9hHKzMtCaZmjqVBQS/YZ1n5ZQTMJpWFlbS
         k5NIQkUccfL5rXqD/xo7eGdIcevvlqpbo8uCU79glr2hvH27EKgKSIZINL65QlnqDYwR
         8aXtD852omP7+zAdNArs172f/HdrFRbPLGYzSVMoodbrtuwGw1/kOBAB8rTxuS8iIMow
         XyFRIzfpUm9agEIaj4MhErYPJTj1uKqQTrJarWrjU89HvSmeVUmmCdF6iVuP8s/BfOfD
         MF4m4FdMCc8UguBRG1ZRq6R5d5T8u0lRkMo9HUss0dzTDfLxZjfcYfh6VVE2yKO/4dOM
         RGUA==
X-Gm-Message-State: APjAAAWAu0ErGToJY+aDFkz0vnS7OrktQhrsuvBN4w4r3lvDe7rrXvCU
	KhFVKYSQIhY3VTnIp0OXJ9E=
X-Google-Smtp-Source: APXvYqwUefe0Xma31AHbSfwM9alLo822Utkh0pcSy52Ncwx3ryJ1xN6mtJysFBLs48cNYqwX96jSig==
X-Received: by 2002:a02:6a10:: with SMTP id l16mr23617153jac.77.1577114101109;
        Mon, 23 Dec 2019 07:15:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:ce86:: with SMTP id r6ls2798115ilo.13.gmail; Mon, 23 Dec
 2019 07:15:00 -0800 (PST)
X-Received: by 2002:a92:d18a:: with SMTP id z10mr26694461ilz.48.1577114100581;
        Mon, 23 Dec 2019 07:15:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577114100; cv=none;
        d=google.com; s=arc-20160816;
        b=nvyIYRnmtY5ULzb/8X6nwg97Odpsa773rBaCafwzfovqzUMICQUWAe3uZIryNyYWmS
         EQW0mj1qOoyt2suQbPWQ2AbtMfknkvlZuC05hMGTIvNWOYQglNHMFGLEibg2sIthT3XU
         pqwvEVCqdPCMzifxEICGVw4sS2m1jFVwnXO4Ru/6Sftx6PpkfG6dEKC+3xbiZ1RBf9Uf
         p3uOOoZRIGYL6puiaR1dT1dRyi9FzwNtLVM2MrwTWCxfOPcZSVIYBweYzHjogRHit//q
         lYLrM4vWPUvr7xbh1jVntjRI/QwpEGC8fBoDb6uIT6Zt0gZzno7flAdynZIk3Q1zC8Rq
         GNPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kVv5/T8lhF3mFvRGq7Qi8jrXHFc87SQ15k/VLd3fmL0=;
        b=FemwV1J+YvlyaCyNJ+4uONCOdbqSc32av0mqqDwL1sqCyeqOA4C7GNgh3xH5PA68f8
         E71HVcLxoCj3ZHxlY4e5phb03vJCZ7pyNMPk2+r+W6GzDMHn4JjIS2UuPMN4+SXmEwIH
         +oFJoLnMrQi/mRf/Uk3P/KfL2iGvb5dCGkDiQK4LG2ND3SIb7r8NUveUkqWmjfXdTvHt
         jdwQHi6YFURNjMBF4es5O/ahxdHK8DpGeI49AKH1opecc1fiN8d2QbNIeT4j1uahgC/t
         QKqZD2mzQ0EIKtIsmZILX5iWol3KpEmHg38ip3iTuO7UTj+C5Ez1gmYeaPJFv/FOZwhq
         d29A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oY4+HALv;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id z20si962191ill.5.2019.12.23.07.15.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 07:15:00 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBNFF0RP057518;
	Mon, 23 Dec 2019 09:15:00 -0600
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBNFF0TI118041
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Dec 2019 09:15:00 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 23
 Dec 2019 09:14:59 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 23 Dec 2019 09:14:59 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBNFEZ1T020577;
	Mon, 23 Dec 2019 09:14:58 -0600
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>, <jan.kiszka@siemens.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>
Subject: [PATCH v4 4/4] configs: arm64: Add Linux demo for j721-evm board
Date: Mon, 23 Dec 2019 20:43:53 +0530
Message-ID: <20191223151353.22495-5-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223151353.22495-1-nikhil.nd@ti.com>
References: <20191223151353.22495-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=oY4+HALv;       spf=pass
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

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Notes:
    Changes from v3:
    * Add gpio, emmc and USB device in the DTS with upstream bindings
    * Describe the irqmap for easy understanding and verification
    * Update power-domains properties
    
    Changes from v2:
    * Only add the DT entries for devices with stable bindings
    * Organize the DTS to match the bus topology with upstream kernel
    
    Changes from v1:
    * Split up the peripheral mem_region to match with kernel dts
    * Add GPU, multimedia decoder and display devices

 configs/arm64/dts/inmate-k3-j721e-evm.dts | 433 ++++++++++++++++++++++
 configs/arm64/k3-j721e-evm-linux-demo.c   | 262 +++++++++++++
 2 files changed, 695 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-k3-j721e-evm.dts
 create mode 100644 configs/arm64/k3-j721e-evm-linux-demo.c

diff --git a/configs/arm64/dts/inmate-k3-j721e-evm.dts b/configs/arm64/dts/inmate-k3-j721e-evm.dts
new file mode 100644
index 00000000..51470a57
--- /dev/null
+++ b/configs/arm64/dts/inmate-k3-j721e-evm.dts
@@ -0,0 +1,433 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for J721E Jailhouse inmate kernel
+ *
+ * Copyright (C) 2016-2019 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/pinctrl/k3.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+/ {
+	model = "Texas Instruments J721E Inmate Model";
+	compatible = "ti,j721e-evm", "ti,j721e";
+	interrupt-parent = <&gic500>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial3 = &main_uart1;
+	};
+
+	chosen {
+		stdout-path = "serial3:115200n8";
+	};
+
+	hypervisor {
+		compatible = "jailhouse,cell";
+	};
+
+	memory@8a0000000 {
+		device_type = "memory";
+		reg = <0x8 0xa0000000 0x0 0x60000000>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cpu-map {
+			cluster0: cluster0 {
+				core1 {
+					cpu = <&cpu1>;
+				};
+			};
+		};
+
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a72";
+			reg = <0x001>;
+			device_type = "cpu";
+			enable-method = "psci";
+			i-cache-size = <0xC000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&L2_0>;
+		};
+	};
+
+	L2_0: l2-cache0 {
+		compatible = "cache";
+		cache-level = <2>;
+		cache-size = <0x100000>;
+		cache-line-size = <64>;
+		cache-sets = <2048>;
+		next-level-cache = <&msmc_l3>;
+	};
+
+	msmc_l3: l3-cache0 {
+		compatible = "cache";
+		cache-level = <3>;
+	};
+
+	a72_timer0: timer-cl0-cpu0 {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* cntpsirq */
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* cntpnsirq */
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* cntvirq */
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* cnthpirq */
+	};
+
+	pmu: pmu {
+		compatible = "arm,armv8-pmuv3";
+		/* Recommendation from GIC500 TRM Table A.3 */
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci: psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
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
+		<0 0 0 1 &gic500 0 0 GIC_SPI 163 IRQ_TYPE_EDGE_RISING>,
+		<0 0 0 2 &gic500 0 0 GIC_SPI 164 IRQ_TYPE_EDGE_RISING>,
+		<0 0 0 3 &gic500 0 0 GIC_SPI 165 IRQ_TYPE_EDGE_RISING>,
+		<0 0 0 4 &gic500 0 0 GIC_SPI 166 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0x76000000 0x0 0x100000>;
+		ranges =
+		<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+	};
+
+	cbass_main: interconnect@100000 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x00 0x00100000 0x00 0x00100000 0x00 0x00020000>, /* ctrl mmr */
+			 <0x00 0x00600000 0x00 0x00600000 0x00 0x00031100>, /* GPIO */
+			 <0x00 0x00900000 0x00 0x00900000 0x00 0x00012000>, /* serdes */
+			 <0x00 0x00A40000 0x00 0x00A40000 0x00 0x00000800>, /* timesync router */
+			 <0x00 0x06000000 0x00 0x06000000 0x00 0x00400000>, /* USBSS0 */
+			 <0x00 0x06400000 0x00 0x06400000 0x00 0x00400000>, /* USBSS1 */
+			 <0x00 0x01000000 0x00 0x01000000 0x00 0x0af02400>, /* Most peripherals */
+			 <0x00 0x30800000 0x00 0x30800000 0x00 0x0bc00000>, /* MAIN NAVSS */
+			 <0x00 0x0d000000 0x00 0x0d000000 0x00 0x01000000>, /* PCIe Core*/
+			 <0x00 0x10000000 0x00 0x10000000 0x00 0x10000000>, /* PCIe DAT */
+			 <0x00 0x64800000 0x00 0x64800000 0x00 0x00800000>, /* C71 */
+			 <0x4d 0x80800000 0x4d 0x80800000 0x00 0x00800000>, /* C66_0 */
+			 <0x4d 0x81800000 0x4d 0x81800000 0x00 0x00800000>, /* C66_1 */
+			 <0x4e 0x20000000 0x4e 0x20000000 0x00 0x00080000>, /* GPU */
+			 <0x00 0x70000000 0x00 0x70000000 0x00 0x00800000>, /* MSMC RAM */
+
+			 /* MCUSS_WKUP Range */
+			 <0x00 0x28380000 0x00 0x28380000 0x00 0x03880000>,
+			 <0x00 0x40200000 0x00 0x40200000 0x00 0x00998400>,
+			 <0x00 0x40f00000 0x00 0x40f00000 0x00 0x00020000>,
+			 <0x00 0x41000000 0x00 0x41000000 0x00 0x00020000>,
+			 <0x00 0x41400000 0x00 0x41400000 0x00 0x00020000>,
+			 <0x00 0x41c00000 0x00 0x41c00000 0x00 0x00100000>,
+			 <0x00 0x42040000 0x00 0x42040000 0x00 0x03ac2400>,
+			 <0x00 0x45100000 0x00 0x45100000 0x00 0x00c24000>,
+			 <0x00 0x46000000 0x00 0x46000000 0x00 0x00200000>,
+			 <0x00 0x47000000 0x00 0x47000000 0x00 0x00068400>,
+			 <0x00 0x50000000 0x00 0x50000000 0x00 0x10000000>,
+			 <0x05 0x00000000 0x05 0x00000000 0x01 0x00000000>,
+			 <0x07 0x00000000 0x07 0x00000000 0x01 0x00000000>;
+
+		cbass_mcu_wakeup: interconnect@28380000 {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x00 0x28380000 0x00 0x28380000 0x00 0x03880000>, /* MCU NAVSS*/
+				 <0x00 0x40200000 0x00 0x40200000 0x00 0x00998400>, /* First peripheral window */
+				 <0x00 0x40f00000 0x00 0x40f00000 0x00 0x00020000>, /* CTRL_MMR0 */
+				 <0x00 0x41000000 0x00 0x41000000 0x00 0x00020000>, /* MCU R5F Core0 */
+				 <0x00 0x41400000 0x00 0x41400000 0x00 0x00020000>, /* MCU R5F Core1 */
+				 <0x00 0x41c00000 0x00 0x41c00000 0x00 0x00100000>, /* MCU SRAM */
+				 <0x00 0x42040000 0x00 0x42040000 0x00 0x03ac2400>, /* WKUP peripheral window */
+				 <0x00 0x45100000 0x00 0x45100000 0x00 0x00c24000>, /* MMRs, remaining NAVSS */
+				 <0x00 0x46000000 0x00 0x46000000 0x00 0x00200000>, /* CPSW */
+				 <0x00 0x47000000 0x00 0x47000000 0x00 0x00068400>, /* OSPI register space */
+				 <0x00 0x50000000 0x00 0x50000000 0x00 0x10000000>, /* FSS OSPI0/1 data region 0 */
+				 <0x05 0x00000000 0x05 0x00000000 0x01 0x00000000>, /* FSS OSPI0 data region 3 */
+				 <0x07 0x00000000 0x07 0x00000000 0x01 0x00000000>; /* FSS OSPI1 data region 3*/
+		};
+	};
+};
+
+&cbass_main {
+
+	gic500: interrupt-controller@1800000 {
+		compatible = "arm,gic-v3";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x00 0x01800000 0x00 0x10000>,	/* GICD */
+		      <0x00 0x01900000 0x00 0x100000>;	/* GICR */
+
+		/* vcpumntirq: virtual CPU interface maintenance interrupt */
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	main_gpio_intr: interrupt-controller0 {
+		compatible = "ti,sci-intr";
+		ti,intr-trigger-type = <1>;
+		interrupt-controller;
+		interrupt-parent = <&gic500>;
+		#interrupt-cells = <2>;
+		ti,sci = <&dmsc>;
+		ti,sci-dst-id = <14>;
+		ti,sci-rm-range-girq = <0x1>;
+	};
+
+	cbass_main_navss: interconnect0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		main_navss_intr: interrupt-controller1 {
+			compatible = "ti,sci-intr";
+			ti,intr-trigger-type = <4>;
+			interrupt-controller;
+			interrupt-parent = <&gic500>;
+			#interrupt-cells = <2>;
+			ti,sci = <&dmsc>;
+			ti,sci-dst-id = <14>;
+			ti,sci-rm-range-girq = <4>;
+		};
+
+		main_udmass_inta: interrupt-controller@33d00000 {
+			compatible = "ti,sci-inta";
+			reg = <0x0 0x33d00000 0x0 0x100000>;
+			interrupt-controller;
+			interrupt-parent = <&main_navss_intr>;
+			msi-controller;
+			ti,sci = <&dmsc>;
+			ti,sci-dev-id = <209>;
+			ti,sci-rm-range-vint = <0xa>;
+			ti,sci-rm-range-global-event = <0xd>;
+		};
+	};
+
+	secure_proxy_main: mailbox@32c00000 {
+		compatible = "ti,am654-secure-proxy";
+		#mbox-cells = <1>;
+		reg-names = "target_data", "rt", "scfg";
+		reg = <0x00 0x32c00000 0x00 0x100000>,
+		      <0x00 0x32400000 0x00 0x100000>,
+		      <0x00 0x32800000 0x00 0x100000>;
+		interrupt-names = "rx_016";
+		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	main_pmx0: pinmux@11c000 {
+		compatible = "pinctrl-single";
+		/* Proxy 0 addressing */
+		reg = <0x0 0x11c000 0x0 0x2b4>;
+		#pinctrl-cells = <1>;
+		pinctrl-single,register-width = <32>;
+		pinctrl-single,function-mask = <0xffffffff>;
+	};
+
+	main_uart1: serial@2810000 {
+		compatible = "ti,j721e-uart", "ti,am654-uart";
+		reg = <0x00 0x02810000 0x00 0x100>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+		clock-frequency = <48000000>;
+		current-speed = <115200>;
+		power-domains = <&k3_pds 278 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 278 0>;
+		clock-names = "fclk";
+	};
+
+	main_gpio2: gpio@610000 {
+		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
+		reg = <0x0 0x00610000 0x0 0x100>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&main_gpio_intr>;
+		interrupts = <107 0>, <107 1>, <107 2>, <107 3>,
+			     <107 4>, <107 5>, <107 6>, <107 7>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		ti,ngpio = <128>;
+		ti,davinci-gpio-unbanked = <0>;
+		power-domains = <&k3_pds 107 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 107 0>;
+		clock-names = "gpio";
+	};
+
+	main_gpio3: gpio@611000 {
+		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
+		reg = <0x0 0x00611000 0x0 0x100>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&main_gpio_intr>;
+		interrupts = <108 0>, <108 1>, <108 2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		ti,ngpio = <36>;
+		ti,davinci-gpio-unbanked = <0>;
+		power-domains = <&k3_pds 108 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 108 0>;
+		clock-names = "gpio";
+	};
+
+	main_sdhci0: sdhci@4f80000 {
+		compatible = "ti,j721e-sdhci-8bit";
+		reg = <0x0 0x4f80000 0x0 0x1000>, <0x0 0x4f88000 0x0 0x400>;
+		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 91 TI_SCI_PD_EXCLUSIVE>;
+		clock-names = "clk_xin", "clk_ahb";
+		clocks = <&k3_clks 91 1>, <&k3_clks 91 0>;
+		assigned-clocks = <&k3_clks 91 1>;
+		assigned-clock-parents = <&k3_clks 91 2>;
+		bus-width = <8>;
+		mmc-hs400-1_8v;
+		mmc-ddr-1_8v;
+		ti,otap-del-sel = <0x2>;
+		ti,trm-icp = <0x8>;
+		ti,strobe-sel = <0x77>;
+		dma-coherent;
+	};
+
+	usbss1: cdns_usb@4114000 {
+		compatible = "ti,j721e-usb";
+		reg = <0x00 0x4114000 0x00 0x100>;
+		dma-coherent;
+		power-domains = <&k3_pds 289 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 289 15>, <&k3_clks 289 3>;
+		clock-names = "ref", "lpm";
+		assigned-clocks = <&k3_clks 289 15>;	/* USB2_REFCLK */
+		assigned-clock-parents = <&k3_clks 289 16>; /* HFOSC0 */
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		usb1: usb@6400000 {
+			compatible = "cdns,usb3";
+			reg = <0x00 0x6400000 0x00 0x10000>,
+			      <0x00 0x6410000 0x00 0x10000>,
+			      <0x00 0x6420000 0x00 0x10000>;
+			reg-names = "otg", "xhci", "dev";
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,	/* irq.0 */
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,	/* irq.6 */
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;	/* otgirq.0 */
+			interrupt-names = "host",
+					  "peripheral",
+					  "otg";
+			maximum-speed = "super-speed";
+			dr_mode = "otg";
+		};
+	};
+};
+
+&cbass_mcu_wakeup {
+	dmsc: dmsc@44083000 {
+		compatible = "ti,k2g-sci";
+		ti,host-id = <13>;
+
+		mbox-names = "rx", "tx";
+
+		mboxes= <&secure_proxy_main 16>,
+			<&secure_proxy_main 18>;
+
+		reg-names = "debug_messages";
+		reg = <0x00 0x44083000 0x0 0x1000>;
+
+		k3_pds: power-controller {
+			compatible = "ti,sci-pm-domain";
+			#power-domain-cells = <2>;
+		};
+
+		k3_clks: clocks {
+			compatible = "ti,k2g-sci-clk";
+			#clock-cells = <2>;
+		};
+
+		k3_reset: reset-controller {
+			compatible = "ti,sci-reset";
+			#reset-cells = <2>;
+		};
+	};
+
+	wkup_pmx0: pinmux@4301c000 {
+		compatible = "pinctrl-single";
+		/* Proxy 0 addressing */
+		reg = <0x00 0x4301c000 0x00 0x178>;
+		#pinctrl-cells = <1>;
+		pinctrl-single,register-width = <32>;
+		pinctrl-single,function-mask = <0xffffffff>;
+	};
+};
+
+/* Board specific device tree entries */
+
+/ {
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sw10_button_pins_default>;
+
+		sw10 {
+			label = "GPIO Key USER1";
+			linux,code = <BTN_0>;
+			gpios = <&main_gpio2 0 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&main_pmx0 {
+	sw10_button_pins_default: sw10_button_pins_default {
+		pinctrl-single,pins = <
+			J721E_IOPAD(0x0, PIN_INPUT, 7) /* (AC18) EXTINTn.GPIO0_0 */
+		>;
+	};
+
+	main_usbss1_pins_default: main_usbss1_pins_default {
+		pinctrl-single,pins = <
+			J721E_IOPAD(0x214, PIN_OUTPUT, 4) /* (V4) MCAN1_TX.USB1_DRVVBUS */
+		>;
+	};
+};
+
+&main_sdhci0 {
+	/* eMMC */
+	non-removable;
+	ti,driver-strength-ohm = <50>;
+	disable-wp;
+};
+
+&usbss1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_usbss1_pins_default>;
+	ti,usb2-only;
+};
+
+&usb1 {
+	dr_mode = "host";
+	maximum-speed = "high-speed";
+};
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
new file mode 100644
index 00000000..12351ab3
--- /dev/null
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -0,0 +1,262 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for Linux inmate on J721E based platforms
+ * 1 CPUs, 512MB RAM, 1 serial port
+ *
+ * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *  Nikhil Devshatwar <nikhil.nd@ti.com>
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
+	struct jailhouse_memory mem_regions[20];
+	struct jailhouse_irqchip irqchips[4];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "k3-j721e-evm-linux-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.cpu_reset_address = 0x0,
+		.vpci_irq_base = 195 - 32,
+		.console = {
+			.address = 0x2810000,
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
+			.phys_start = 0x89fe00000,
+			.virt_start = 0x89fe00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* ctrl mmr */ {
+			.phys_start = 0x00100000,
+			.virt_start = 0x00100000,
+			.size = 0x00020000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
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
+		/* D552 decoder */ {
+			.phys_start = 0x4300000,
+			.virt_start = 0x4300000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* GPU */ {
+			.phys_start = 0x4e20000000,
+			.virt_start = 0x4e20000000,
+			.size = 0x80000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dss.common_s1 */ {
+			.phys_start = 0x4B00000,
+			.virt_start = 0x4B00000,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dss.vidl1 */ {
+			.phys_start = 0x4A20000,
+			.virt_start = 0x4A20000,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dss.ovr1 */ {
+			.phys_start = 0x4A70000,
+			.virt_start = 0x4A70000,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dss.vp1 */ {
+			.phys_start = 0x4A80000,
+			.virt_start = 0x4A80000,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* serdes 10G */ {
+			.phys_start = 0x05050000,
+			.virt_start = 0x05050000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* DSS_EDP0_V2A_CORE_VP_REGS_AP */ {
+			.phys_start = 0x0A000000,
+			.virt_start = 0x0A000000,
+			.size = 0x31000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* DSS_EDP0_INTG_CFG_VP */ {
+			.phys_start = 0x04F40000,
+			.virt_start = 0x04F40000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* linux-loader space */ {
+			.phys_start = 0x89ff00000,
+			.virt_start = 0x0,
+			.size = 0x10000,	/* 64KB */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM. */ {
+			.phys_start = 0x8a0000000,
+			.virt_start = 0x8a0000000,
+			.size = 0x60000000,
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
+			/*
+			 * sdhci0 SPI_3				=> idx 0 bit 3
+			 * sproxy_rx_016 SPI_71			=> idx 1 bit 7
+			 * usb1.host SPI_104			=> idx 3 bit 8
+			 * usb1.peripheral SPI_110		=> idx 3 bit 14
+			 * usb1.otg SPI_121			=> idx 3 bit 25
+			 */
+			.pin_bitmap = {
+				0x00000008, 0x00000080, 0x00000000, 0x02004100,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 160,
+			/*
+			 * virtual PCI SPI_163 to 166		=> idx 1 bit [6:3]
+			 * main_uart1 SPI_193 to 166		=> idx 2 bit 1
+			 */
+			.pin_bitmap = {
+				0x00000000, 0x00000078, 0x00000002, 0x00000000,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 416,
+			/*
+			 * main_gpio_intr SPI_392 to 416	=> idx 0 bit [31:8]
+			 * ^^^^THIS^^^^ should match with SYSFW rm-cfg.c
+			 */
+			/* GPIO INTR */
+			.pin_bitmap = {
+				0xffffff00, 0x00000000, 0x00000000, 0x00000000,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 544,
+			.pin_bitmap = {
+				0x00000000, 0x00000000, 0x00000000, 0x00000000,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191223151353.22495-5-nikhil.nd%40ti.com.
