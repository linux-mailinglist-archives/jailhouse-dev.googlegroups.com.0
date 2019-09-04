Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB56YX3VQKGQEGAP7NFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83f.google.com (mail-qt1-x83f.google.com [IPv6:2607:f8b0:4864:20::83f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF72A820D
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 14:22:16 +0200 (CEST)
Received: by mail-qt1-x83f.google.com with SMTP id f19sf22603203qtq.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2019 05:22:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567599735; cv=pass;
        d=google.com; s=arc-20160816;
        b=DEvE+Zb7P9hjZRXpFP7wFm1YM0gmf0yrPU7fcITHOmLvG9cYWDkijmqUIAjyjFkcNN
         dbJLXMTJMIt23N5K1uLDcakRhvXPDMY8ULOTm6SDEhYGRY9/pbqfw21h9YmMaKhyKLfM
         DFTaTD/ISYzwpIg9tMNPJ/qskGms8JMY0Epp69v+qysJRTKQ9sQ3L8Q4pcUowPPl21HT
         9lt8Fg1yDMSixcUHbX1HlC1MTvE8oLMPHBo+JRycc0WdJ2MEUJK8bNnnglsfchrQT54r
         jcR901P0M39dNf3wG6ovj9gz8j38xkjN627UbijKrxxt3y0Q9zHsYtQykoa0qYaht6mt
         Qevg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=TCtCEN91x74g1pa70Q5zGhqItJzNyZ5/6PSn/+61rXI=;
        b=HQvEZvOBb2gXIF14zKA9cWgWgCL+7p2FDyoV0yIwVL2GuNrxglyMEwgk8DKetgRpBu
         v1n3tml20hPegS5UgU5vLb4/EjUV3B5oa3BwG18rosA7Qed0yPQ+MD0zecrLqDxk9aTl
         ovs18GCMl7UqjMU11rgV1vOmlqUkksxqKZc98zLFW0g8BnT6v81k9wqShuKag+TMTINc
         Zeu2bdQlg3gmNmhRb/5qyfz0Iv/lHMlL5KYYpr+mt3FrWZCJLh/n7Kdr0847SrPMI1Cs
         gLiLyF6GCmRjTadkAqjV363uJP2U5FpBiGoDJB2nBk04PfW+ibwmxEfCsTnJnGpcQhjl
         3fXg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mwrUYKep;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TCtCEN91x74g1pa70Q5zGhqItJzNyZ5/6PSn/+61rXI=;
        b=S3wWF6dv/2UsU8r8hb339NBEeilmVYRtGJ6zRLGpHT/ThqULtJzRSk8TAUogIsnRF3
         ySnD9mK0LhkbNSr+rwjmzDGPWZp2HcqtZZd+J1ktlPteXSO2Y43FlYl7nEt16JME87SJ
         BPyQqqmrfYqaCrQ3c8A7sb0l4hElcan85pvgnevLiGUGed7l/D5AzFHwMlI9e+czU+NJ
         s+nq9zxmdAziPqGgbGWlL99c+xg7hod+NoPZqKgDr/80DKXxWB6SmcmBzk83IHYXZRy0
         2MYksz2GzcbFcu8RHMklCh0qI5KrYwar3v3RWq23JMSwkIr2x8xTCXHk3582l7Rj9dFD
         9bSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TCtCEN91x74g1pa70Q5zGhqItJzNyZ5/6PSn/+61rXI=;
        b=QSgnF6Qt8Jv3wnICDY1cOcxIpOcN/jOpLpdGQ1nm+vqHkmKv0sRA5YKjE4/66qYzoJ
         fitoV8ESooUbnWWnE+w3Z3E5F4kEzyFcl0wW2oqxQgogOsqkJLNV7984I6fv0swftygr
         8Xd4S8oSkx5paFk3fhHPbqugAuVarHwseg4JVoz5zF0S1m8M6m441fPgBOrYZwkv83TL
         DHEJrGqdOFQIpV7zuXWtmw+eIfZtRsevYnZaSnh/Zv/A/HUMQaZ0WLjbAkwVokaD8696
         HARLQ1HZ4NIOLNP+mFiS+p+fBvBList7PQeFPtqlPf3Gl797XdDQfYQifuBKoLbpwnS2
         rqvA==
X-Gm-Message-State: APjAAAXaDgdKFVpZAdjDBhLBidZTc0zAo0V3//44ELEKg1hawSPsF4+4
	vUaEtPJrZwsa+IafgVxMcMQ=
X-Google-Smtp-Source: APXvYqyE8nWRpm3+bNxcLkZGOT0L4CGQZeKrZ3x/C2MUkkuQ8liZ/xVukSwQwbFybTx8zXCYord7UA==
X-Received: by 2002:a37:9802:: with SMTP id a2mr39500615qke.346.1567599735355;
        Wed, 04 Sep 2019 05:22:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:83c4:: with SMTP id f187ls1075176qkd.11.gmail; Wed, 04
 Sep 2019 05:22:14 -0700 (PDT)
X-Received: by 2002:a37:a410:: with SMTP id n16mr23042001qke.429.1567599734871;
        Wed, 04 Sep 2019 05:22:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567599734; cv=none;
        d=google.com; s=arc-20160816;
        b=V+Ywh3xNob7SOWs2X3TgrlX9yhCUuXMlIAmPwOL38VTEH69SQ2hT12XXEWG4lN7j9q
         WCTuDvTP85MRKIHqj0KAFpMCJau1xIA+7R9ffwNvLQGwUAeMu5aO+VMEBP1AiaOXPzV3
         jPdja4ICUfn9cP6ezMj3FuetZXRsEQBraTkW7EBjy7oGZYDzSeaQo5g4P+tmUilgnnag
         /NECwiTlTfnsTkLrQrMDGokqqt/3bKwzfyK1Hzc5D/5yKEA+zBh4nAgooCPiofTnrC2l
         HC0iZHplbemIgRUwlLvjRuaRtHUp8eai8/rSaI3Kz43PFDDPdrw7ijO/OcodEYHHKLe4
         7XFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+Sg9nsFGcmbEiO1vwoFhN7K5KawQ3gu2BrFW7UJfKI0=;
        b=MI8hTVEqsJuk6eX4zUiUU0UFlJyj/DcsqFcs+ZqZ5xBKXU+3g3JxFaN5w3qkEJt+w4
         MDb32d+hoOBmP4z1ZyTQZSB29oHbh3YYSCkq+w0kmtYP8UZsjov68+UkUq5kFM3Y1b0d
         mja0/WcRZLx55DOByLso7ym/Mc9Z9wt+Jwm2CJwJ2dBrvdFtlwdRqFtyEYaYE/SP4nSK
         0R0FoGPZmHrJa3SjrqpFs4ftrLEQ2EspMQz6aNaMQ9/knf/q2vca7y5rgwKIRdqner4K
         zOH44KTnvPj4wiu9XxaZtZDtEejoCt6wYMFCDXea56n1QqYszbMc6D3iZfpeVVlK1sG7
         k+iA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mwrUYKep;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id x44si930914qtc.3.2019.09.04.05.22.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 05:22:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x84CMEZH080013;
	Wed, 4 Sep 2019 07:22:14 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x84CMEQm015278;
	Wed, 4 Sep 2019 07:22:14 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 4 Sep
 2019 07:22:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 4 Sep 2019 07:22:13 -0500
Received: from NicksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x84CM4PJ116363;
	Wed, 4 Sep 2019 07:22:12 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v3 4/4] configs: arm64: Add Linux demo for j721-evm board
Date: Wed, 4 Sep 2019 17:52:03 +0530
Message-ID: <1567599723-19589-5-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567599723-19589-1-git-send-email-nikhil.nd@ti.com>
References: <1567599723-19589-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=mwrUYKep;       spf=pass
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
Changes from v2:
* Only add the DT entries for devices with stable bindings
* Organize the DTS to match the bus topology with upstream kernel

Changes from v1:
* Split up the peripheral mem_region to match with kernel dts
* Add GPU, multimedia decoder and display devices

 configs/arm64/dts/inmate-k3-j721e-evm.dts | 285 ++++++++++++++++++++++++++++++
 configs/arm64/k3-j721e-evm-linux-demo.c   | 242 +++++++++++++++++++++++++
 2 files changed, 527 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-k3-j721e-evm.dts
 create mode 100644 configs/arm64/k3-j721e-evm-linux-demo.c

diff --git a/configs/arm64/dts/inmate-k3-j721e-evm.dts b/configs/arm64/dts/inmate-k3-j721e-evm.dts
new file mode 100644
index 0000000..dfad5b3
--- /dev/null
+++ b/configs/arm64/dts/inmate-k3-j721e-evm.dts
@@ -0,0 +1,285 @@
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
+				core0 {
+					cpu = <&cpu0>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a72";
+			reg = <0x000>;
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
+	cbass_main_navss: interconnect0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		main_navss_intr: interrupt-controller1 {
+			compatible = "ti,sci-intr";
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
+		interrupt-names = "rx_011";
+		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
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
+		power-domains = <&k3_pds 278>;
+		clocks = <&k3_clks 278 0>;
+		clock-names = "fclk";
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
\ No newline at end of file
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
new file mode 100644
index 0000000..347ae0e
--- /dev/null
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -0,0 +1,242 @@
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
+	struct jailhouse_irqchip irqchips[3];
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
+			/* gpu, sdhci0, sproxy_rx_016 */
+			.pin_bitmap = {
+				0x1000008, 0x80, 0x0, 0,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 160,
+			/* d5520, vpci, main_uart1 */
+			.pin_bitmap = {
+				0x0, 0x100008, 0x2, 0,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 544,
+			/* dss common_s1, mhdp */
+			.pin_bitmap = {
+				0x0, 0x0, 0x10000000, 0x40,
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
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1567599723-19589-5-git-send-email-nikhil.nd%40ti.com.
