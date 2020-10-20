Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBLFLXL6AKGQEVFIBBMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x538.google.com (mail-pg1-x538.google.com [IPv6:2607:f8b0:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E09293608
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Oct 2020 09:45:50 +0200 (CEST)
Received: by mail-pg1-x538.google.com with SMTP id y7sf892303pgg.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Oct 2020 00:45:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603179949; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z5Ehr5UJtXFHL/+vdvEZ/Ois9dfk7upfpAaR4pG4sEWJ1M6nIkgWqSbNjuM3UprNfK
         WRyfcr2PRFVvQo+aSBAQZi9TjefVHPlWbiGPA5PesJpKCpTPIaJ6Sfc6jsymhhOfnnG1
         madrL0r2eDUENU1JMdDwjFvEQm0y0Ojap7ljOJjvQgw9DoxXrjj6G9oyaQ2KNPTsZhrO
         AHvRDPqYNlljlyDWqjrpijlKgthcWDuiM0Jsz673w8mCLMj+udSr4r4xdwapu2vo3nk6
         jpH7GmAItNiazxwLODlwSQrmGOsYqloWuwjCg22xYMiFGaDPq+qcE3DUazv1jRwQ/8Jq
         2vMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=s9hTHQd/9AiAVj1lZAD8TyIm/F6IRFK43V79Q9Q/+ug=;
        b=dhhafXb8bj6DYn9DMdAd2H0BSk16SH2TkJgQaaVEJxsL/QSY+cUlGElvLimNpCK8kE
         RYa3AomXzs5VOKj9rzLYcBpmV6qj84A8Bk6gqLTX5zSVXKCgPkyzT67SZSjXEuOlu13k
         3VJftOQ5LxLiTczPLsFuGg+lu6tv+HCPTonxQlmvM6Py780IaB4l7xFpSHhpQY3Buaa1
         khcTH0KjY4P+Jyk/eu3vGVnuqLQzV7N/ssnsihwGP4S68s1so9LlE46Te8xsfrCR8ApK
         aRczlr9rgOEhEK/JGGmoR4WOHw0c+WsJ9R73d0V4LZ1tgCxTp4yXbIF84or2vHXMJmlc
         Xo7g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wKfXwko3;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s9hTHQd/9AiAVj1lZAD8TyIm/F6IRFK43V79Q9Q/+ug=;
        b=dFeDkOuPxRJj+Nd96qPV+ffdIdQXmH/lLNlwC+4ZJezBkKCoO2EvJDr5JQQBErzQQ5
         M8puyu73v1yyzx77anFbpsqcMZmu03x3xsqeMsQYuNfyLwm3jtkHZhW8qTYnceL8KdQf
         8gH2A+CLz12MgN33pSmE4d8EDwmPX0Z6hyEOn6+KC2YPqk9ESUakcULeIVGM8SRF16ut
         VHdTXAgk3lZ0a6uDoIPf4AS26oJUfDj7K4kTGiLnMkUncVa9LMIMJZVDgZydYUp8gtEc
         TIkHw3DQBBCTLGLeetw21/OzxbwIt8EM/Xe6ky9xU7ILwiNZVEBAsqFNVBaTC/3l22mU
         cWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s9hTHQd/9AiAVj1lZAD8TyIm/F6IRFK43V79Q9Q/+ug=;
        b=JB24F2uSvI89rwSm9NRnaPLNT0usUgL1zErurTUGTtumuwa3lagoSYGSOFAVXNi+qk
         nDRoeC1yJc6Zc9k0Jq0yfk/akSsx/640axq7uxLFCm9yWuGBgI2ceGonC89Uxk/KHqSM
         TFk3W8RKD3pMlUJYRWVh1fuBHno6J7EuOQ9H0DnGxXs5sIr7o3y3EFHhjPUgjvb+2krq
         IUML123BF3b7wUJotSI/nEILKR3cCdNEd2frds7TlcnNEJR70NTE3WexyGoXYcsv5ylF
         t3YCw92FZYrXcIgTHjpnJBJBWexVWECj7u3eD5Mqd7VGivA70tvXDRccHQ1n0G/F2hsc
         s7Hw==
X-Gm-Message-State: AOAM531dOFgridQNFuO532tmOr7GIH7Dnf1tQOlV+1nLgbxq900jd9s0
	ckZOK9bowa1/T2oWdbpjmPg=
X-Google-Smtp-Source: ABdhPJwxt9BqfgEPiCp9kMLihkLIWhXqx1Wt21VLgmyyQIl20KTC4zhlC56Ou8uQpBhi9eNKd02XLA==
X-Received: by 2002:a17:90a:5d17:: with SMTP id s23mr1828012pji.170.1603179948786;
        Tue, 20 Oct 2020 00:45:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:709:: with SMTP id s9ls538242pjz.1.canary-gmail;
 Tue, 20 Oct 2020 00:45:48 -0700 (PDT)
X-Received: by 2002:a17:902:a58a:b029:d5:dde6:ec00 with SMTP id az10-20020a170902a58ab02900d5dde6ec00mr1864375plb.14.1603179948012;
        Tue, 20 Oct 2020 00:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603179948; cv=none;
        d=google.com; s=arc-20160816;
        b=RGYN9Q2dGn0ocOu8jKMDbIkUosWJmoe9t8v4LEVTtKyKM8dRcdwmvTbhBvZ+/9Queb
         9tgXdTxQ72KgPCHiqxNzUNxQHdYze5sZpeMO6NfIOzd9gW2AO57pgJm5LJc93yZCzM/1
         yU85uY4lP7HBJ5pCgUXN0u3ybp0aChX4AwIe6GPcAtWKkFE46OeYV4Sciue/fJlTNj5F
         kKyhoWkTefgYEPA9GJyGu7Pza0q36AtU9oJ4Ke16QhUcAKZUabBGGo9urF/ThqAMqlNC
         fqtnJFLQdDve7sBRHxul2nq4za6Y8PoKQhmkd7N4NKdBOuitCa+9txZcv5pfIzsvMQ+J
         f+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xefK84Pou1yZW163UPpCK4DDbmZvvvNavrtDlG8U+iM=;
        b=BIl7/fbcWiZHlTUGt/NroermYqWSPPEnzsjLZxmiq+Mzj+Vye9WZM0TnBC6lkvShYw
         MtlZEx1TZl3LrZ2okbP/5rRd9Pw6U5BKI2soUAqhDGa9tylW8WiqVD44c0AkPdZxlDL1
         lVGikZrBDMVFCtd35PGgjVklINF+Zb/VACZV/9JJG0WOJZLuPOx9jyKy8QXSbpiV4ga8
         EInWIpsw6wK0JbFqgP6EjjmrbMpaGJO/VlAWBxWy33nT63RVnbW9RAIS+q0tYtmlbisB
         mqBuitULTkvGLCEjIAU+sgYKmJUv+6uu24PvfNfarWqEb3hXyph6l/rfZVcu9DJ9oGhK
         znlg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wKfXwko3;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id 191si69687pfu.3.2020.10.20.00.45.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 00:45:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09K7jlmx049439;
	Tue, 20 Oct 2020 02:45:47 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09K7jlkD017035
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Oct 2020 02:45:47 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 20
 Oct 2020 02:45:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 20 Oct 2020 02:45:46 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09K7jaR7011198;
	Tue, 20 Oct 2020 02:45:45 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 3/3] configs: arm64: Add Linux demo for k3j7200-evm board
Date: Tue, 20 Oct 2020 13:15:25 +0530
Message-ID: <20201020074525.7941-4-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201020074525.7941-1-nikhil.nd@ti.com>
References: <20201020074525.7941-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=wKfXwko3;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
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

Add the linux demo cell config for k3-j7200-evm board.
Also add the required device tree for booting Linux kernel
in the inmate cell.

Add mem_regions and enable interrupts for for main_uart1,
main_sdhci0, gpio interrupt routers and virtual PCI

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/dts/inmate-k3-j7200-evm.dts | 351 ++++++++++++++++++++++
 configs/arm64/k3-j7200-evm-linux-demo.c   | 238 +++++++++++++++
 2 files changed, 589 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-k3-j7200-evm.dts
 create mode 100644 configs/arm64/k3-j7200-evm-linux-demo.c

diff --git a/configs/arm64/dts/inmate-k3-j7200-evm.dts b/configs/arm64/dts/inmate-k3-j7200-evm.dts
new file mode 100644
index 00000000..3baef5d4
--- /dev/null
+++ b/configs/arm64/dts/inmate-k3-j7200-evm.dts
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for J7200 Jailhouse inmate kernel
+ *
+ * Copyright (C) 2016-2019 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/k3.h>
+#include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+/ {
+	model = "Texas Instruments J7200 Inmate Model";
+	compatible = "ti,j7200-evm", "ti,j7200";
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
+	firmware {
+		psci: psci {
+			compatible = "arm,psci-1.0";
+			method = "smc";
+		};
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
+	cbass_main: bus@100000 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x00 0x00100000 0x00 0x00100000 0x00 0x00020000>, /* ctrl mmr */
+			 <0x00 0x00600000 0x00 0x00600000 0x00 0x00031100>, /* GPIO */
+			 <0x00 0x00900000 0x00 0x00900000 0x00 0x00012000>, /* serdes */
+			 <0x00 0x00A40000 0x00 0x00A40000 0x00 0x00000800>, /* timesync router */
+			 <0x00 0x06000000 0x00 0x06000000 0x00 0x00400000>, /* USBSS0 */
+			 <0x00 0x06400000 0x00 0x06400000 0x00 0x00400000>, /* USBSS1 */
+			 <0x00 0x01000000 0x00 0x01000000 0x00 0x0d000000>, /* Most peripherals */
+			 <0x00 0x30000000 0x00 0x30000000 0x00 0x0c400000>, /* MAIN NAVSS */
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
+		#interrupt-cells = <1>;
+		ti,sci = <&dmsc>;
+		ti,sci-dev-id = <131>;
+		ti,interrupt-ranges = <8 392 56>;
+	};
+
+	cbass_main_navss: interconnect0 {
+		compatible = "simple-mfd";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x00 0x30000000 0x00 0x30000000 0x00 0x0c400000>;
+		ti,sci-dev-id = <199>;
+
+		main_navss_intr: interrupt-controller1 {
+			compatible = "ti,sci-intr";
+			ti,intr-trigger-type = <4>;
+			interrupt-controller;
+			interrupt-parent = <&gic500>;
+			#interrupt-cells = <1>;
+			ti,sci = <&dmsc>;
+			ti,sci-dev-id = <213>;
+			ti,interrupt-ranges = <0 64 64>,
+					      <64 448 64>,
+					      <128 672 64>;
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
+			ti,interrupt-ranges = <0 0 256>;
+		};
+
+		secure_proxy_main: mailbox@32c00000 {
+			compatible = "ti,am654-secure-proxy";
+			#mbox-cells = <1>;
+			reg-names = "target_data", "rt", "scfg";
+			reg = <0x00 0x32c00000 0x00 0x100000>,
+			      <0x00 0x32400000 0x00 0x100000>,
+			      <0x00 0x32800000 0x00 0x100000>;
+			interrupt-names = "rx_016";
+			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+		};
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
+		clocks = <&k3_clks 278 2>;
+		clock-names = "fclk";
+	};
+
+	main_gpio2: gpio@610000 {
+		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
+		reg = <0x0 0x00610000 0x0 0x100>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&main_gpio_intr>;
+		interrupts = <154>, <155>, <156>, <157>, <158>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		ti,ngpio = <69>;
+		ti,davinci-gpio-unbanked = <0>;
+		power-domains = <&k3_pds 107 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 107 0>;
+		clock-names = "gpio";
+	};
+
+	main_sdhci0: sdhci@4f8000 {
+		compatible = "ti,j7200-sdhci-8bit", "ti,j721e-sdhci-8bit";
+		reg = <0x0 0x04f80000 0x0 0x260>, <0x0 0x4f88000 0x0 0x134>;
+		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 91 TI_SCI_PD_EXCLUSIVE>;
+		clock-names = "clk_xin", "clk_ahb";
+		clocks = <&k3_clks 91 3>, <&k3_clks 91 0>;
+		ti,otap-del-sel-legacy = <0x0>;
+		ti,otap-del-sel-mmc-hs = <0x0>;
+		ti,otap-del-sel-ddr52 = <0x6>;
+		ti,otap-del-sel-hs200 = <0x8>;
+		ti,otap-del-sel-hs400 = <0x0>;
+		ti,strobe-sel = <0x77>;
+		ti,trm-icp = <0x8>;
+		bus-width = <8>;
+		mmc-hs400-1_8v;
+		mmc-ddr-1_8v;
+		dma-coherent;
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
+&main_sdhci0 {
+	/* eMMC */
+	non-removable;
+	ti,driver-strength-ohm = <50>;
+	disable-wp;
+};
diff --git a/configs/arm64/k3-j7200-evm-linux-demo.c b/configs/arm64/k3-j7200-evm-linux-demo.c
new file mode 100644
index 00000000..90a0ce4c
--- /dev/null
+++ b/configs/arm64/k3-j7200-evm-linux-demo.c
@@ -0,0 +1,238 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for Linux inmate on J7200 based platforms
+ * 1 CPUs, 512MB RAM, 1 serial port
+ *
+ * Copyright (c) 2020 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *  Nikhil Devshatwar <nikhil.nd@ti.com>
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
+	struct jailhouse_memory mem_regions[19];
+	struct jailhouse_irqchip irqchips[3];
+	struct jailhouse_pci_device pci_devices[2];
+	__u32 stream_ids[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "k3-j7200-evm-linux-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.num_stream_ids = ARRAY_SIZE(config.stream_ids),
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
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0x89fe00000,
+			.virt_start = 0x89fe00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x89fe10000,
+			.virt_start = 0x89fe10000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
+				 JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x89fe20000,
+			.virt_start = 0x89fe20000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x89fe30000,
+			.virt_start = 0x89fe30000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
+				 JAILHOUSE_MEM_WRITE,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe40000, 1),
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
+				JAILHOUSE_MEM_IO,
+		},
+		/* sdhci0 */ {
+			.phys_start = 0x4f88000,
+			.virt_start = 0x4f88000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* main_gpio2 */ {
+			.phys_start = 0x00610000,
+			.virt_start = 0x00610000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* main sproxy rt host_id=A72_3 */ {
+			.phys_start = 0x3240f000,
+			.virt_start = 0x3240f000,
+			.size = 0x05000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* main sproxy scfg host_id=A72_3 */ {
+			.phys_start = 0x3280f000,
+			.virt_start = 0x3280f000,
+			.size = 0x05000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* main sproxy target_data host_id=A72_3 */ {
+			.phys_start = 0x32c0f000,
+			.virt_start = 0x32c0f000,
+			.size = 0x05000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* linux-loader space */ {
+			.phys_start = 0x89ff40000,
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
+			.pin_bitmap = {
+				/* sdhci0 */
+				(1 << (35 - 32)),
+				/* sproxy_rx_016 */
+				(1 << (71 - 64)),
+				0x00000000,
+				0x00000000,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0x00000000,
+				/* virtual PCI */
+				(1 << (195 - 192)),
+				/* main_uart1 */
+				(1 << (225 - 224)),
+				0x00000000,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 416,
+			.pin_bitmap = {
+				/*
+				 * main_gpio_intr slot SPI 392 to 416
+				 * this should match with SYSFW rm-cfg.c
+				 */
+				0xffffff00,
+				0x00000000,
+				0x00000000,
+				0x00000000,
+			},
+		},
+	},
+
+	.pci_devices = {
+		/* 00:00.0 (demo) */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 4,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		/* 00:01.0 (networking) */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 4,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 4,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+
+	.stream_ids = {
+		/* Non PCIe peripherals */
+		0x0003
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201020074525.7941-4-nikhil.nd%40ti.com.
