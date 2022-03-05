Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRB6NGROIQMGQEO7XEFPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf37.google.com (mail-qv1-xf37.google.com [IPv6:2607:f8b0:4864:20::f37])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D1E4CE25E
	for <lists+jailhouse-dev@lfdr.de>; Sat,  5 Mar 2022 04:05:31 +0100 (CET)
Received: by mail-qv1-xf37.google.com with SMTP id w7-20020a0ce107000000b0043512c55ecasf8494792qvk.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Mar 2022 19:05:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646449530; cv=pass;
        d=google.com; s=arc-20160816;
        b=sMgIRkOh+EX/JJyMrD5YOKMUIv7JuUxxfzn+uR1LeE5BVKQVDJcIwCJfdvdSwthNcC
         C1RpE4jBc+1unyIakdPLxL4jWLB9lQ6eivghKIqoX9LXIZ4mMhsccjJi6KNfvxyX/Szh
         ginftiuleBNlDjZyZ99cuNY4viiQIGGrMzjny+91D8G/bF2J/gT/gbUtPjH//AlVWtta
         j2D2yast8ivXkxxUsyS1tI4lZZNoSUEATuueUkVYMoXmGmsu4zuialHtqS5HaUyrcjlz
         uJPDoomzzHOukPbiOGkT9arhMkbArumNDHu/4mLQy3Msn/3YylVRhdrRUAYMfaraVJCi
         GIxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=zOVm7vOu2TtY8+8fMh9/RHVS247Glqery3q0Nbnr+7c=;
        b=0Q7t/vA0+GAvTES2n6wGs7hqMEfcEn1HdKcIjIhplkm5sSL2yze7VdABosZTrz6sdq
         NxSaIzQ5CUh5Ef00FA6JrxSsfxa4396K9tcMJls74yNbjhwRYvhpuQRaearXkIe8YmkO
         HT0SN07IJ7mnELfDwu50Fu9f3Lhi8r3F1nPkStNbIVEncf05reQ/UcuQlfSJPV4FzwOP
         Tqqjuo4lCsqk0pz+l9GeyMvkb1+htjrHheFJIi9KcQn22/rZ0+VkoEAqwOwurCYqjEm/
         rmNB861IqaflZt73G1ky4+ON/AVAUl4c0kzhjcIh5rpHI2NIqmX8ALev84TRp8DapSoh
         8Fpg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=W7aPeZxL;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zOVm7vOu2TtY8+8fMh9/RHVS247Glqery3q0Nbnr+7c=;
        b=eBDblUkFr9t+pREoVOMNjEmqJC0XTvBOh3EmLbeJT1jJ0n1QSqcIqeK34VDgMtYY8x
         nfmjxlrMu+K2oUNPa7Ehqwp6ZWsr0mvCyZn6lXicPCssxsA0Jp95G2P2RlmCtevvLw+w
         tTVkxilyfiVgV//b+hzANVlbKCVqiztjwnZpQzc7u6U1Z3ArYJo7L1kruly6uKUBJtLs
         /jE4WNt12YO+fVQh1eK1+2vnzijxU8lY6prYB3NbxztKDR3SoI3hGcKkPIZHYsFvCb7V
         mKIxoNzQeDuN3YMQzXdfe5bJFmAe7DRUsSDPJ6RvTc7HqLIPO8H2fakifuwMwQCDuDY+
         k/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zOVm7vOu2TtY8+8fMh9/RHVS247Glqery3q0Nbnr+7c=;
        b=0amTZrfbNFfRAukWXU9ROt1OSkDuJhLIHA92r4NrJV0rq3MkZ1Ay5sa1srSG/qssw1
         zaUoBG2x8t9tlBeCC5JK5he9t/G7NnX0ZyB6FmbTJGE/eWtWLlAZCdu0VgA+GW+Gzm37
         aU7uq8z6NFNV6b9tUb2of40fDAzrROy/7eY1Mnb4SOQjZ2HKZswMJV9TFKjOo7OAlYD4
         ZiHfXanMGGQtLOau36LqJfRxyCjm43P6Z5WNND85lzi9lohyz98fa7RK1zQ6ATbZ24Eu
         bkI4NQWCfOyRJb2/zBQzm9i7SoA4SJQGK6v4tYwXP/Pr/eOoXPN1eXILvlm8hoSaoy6X
         CWlQ==
X-Gm-Message-State: AOAM532N6blGJglTuPJwkrPMbktTNwaelVKZJ7u8mg7lLsgv8BOD/2Qf
	YT5Z4mnMNiyScjZIxcg5VEc=
X-Google-Smtp-Source: ABdhPJy3T/eyKPdlFXRLsCqYR1xJUyBC3X6Cxjidg41t2NmgyR8twydivQ+cxq0p8WHv/3v6aBE+6A==
X-Received: by 2002:a05:622a:1750:b0:2de:b30d:68e2 with SMTP id l16-20020a05622a175000b002deb30d68e2mr1584995qtk.162.1646449530186;
        Fri, 04 Mar 2022 19:05:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:1c4:b0:2de:7263:4a87 with SMTP id
 t4-20020a05622a01c400b002de72634a87ls4532048qtw.8.gmail; Fri, 04 Mar 2022
 19:05:29 -0800 (PST)
X-Received: by 2002:ac8:5d8b:0:b0:2dd:d1a3:8f61 with SMTP id d11-20020ac85d8b000000b002ddd1a38f61mr1545931qtx.290.1646449529424;
        Fri, 04 Mar 2022 19:05:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646449529; cv=none;
        d=google.com; s=arc-20160816;
        b=TowBAg3V1jg5BCUAj3pzJ5X5/senQvu4SUaYjD0IHj4rxjK25k5ZkSEkmHSpX3UY/z
         xCtgkGewC6N36jIMeUFOeEFjrYa7vATga/jZM1SPqbWWdneYQQ7vPLetH8r2WpDgN8yt
         TQrn+GLpaP09hZyAVMgnmhH2+dUBsIl9rKD9wBe5UEqUtmhrHHI2GOSWlQUwQuSaDYw3
         Lr0XbX3Tgxi+UnFNbC8bQ9Q9tIbJ9vQ+AXJS+BRsz8Z8ezBSUuLJtLceLL3XJa72U2pg
         /CirWefnSHBniLCUBkeJpblEeLa0+qxJ/htPjLAa/mEyOVkbZpdNt/p6HQr4uiftJPHa
         CsOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=L0UCUY9DmXIivnE59RDgEKXd5Bw+R4R26ZN0cpiCCNw=;
        b=ljmzy6d5kMoJrz8WCInul8kXDRYdvkvEtWcd/TvGVV52CjsUpy5c6eEEVVfIIjhTxl
         qmTmy12o1s4Wwk8iTrU3vJjA9g2X3yqbmeWDq25YdX/N9xWaIGc2CKyspB499wy4NVM6
         HG5/NBPgOVRWMxiekSnmbR7HWJqHgE3EfMcxC/HYunWfS7Xy1biYpRbVNyLf9qv5TtNC
         vS1tnq7GxyoZkioPlQBL5+9IQKaT2e/83BCdcnrfIQzDwaXIOLZN3SiMF8bEspGpeC+8
         nk5Crk4mBS3km9qetOJa+nTNnCcpMoTN8fv8lYFcrGYmbb2OttgDrAIOFq9qjn+qSBhZ
         mKcA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=W7aPeZxL;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id m17-20020a05622a119100b002dcec4472c3si486482qtk.5.2022.03.04.19.05.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Mar 2022 19:05:29 -0800 (PST)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22535Sb5110918
	for <jailhouse-dev@googlegroups.com>; Fri, 4 Mar 2022 21:05:28 -0600
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22535S1m031812
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Fri, 4 Mar 2022 21:05:28 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Mar 2022 21:05:28 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Mar 2022 21:05:28 -0600
Received: from ubuntu.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22535Bvq123249;
	Fri, 4 Mar 2022 21:05:26 -0600
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v2 4/4] configs: arm64: add emmc inmate configuration for k3-am654-idk
Date: Fri, 4 Mar 2022 19:04:58 -0800
Message-ID: <20220305030458.2938-5-mranostay@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220305030458.2938-1-mranostay@ti.com>
References: <20220305030458.2938-1-mranostay@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=W7aPeZxL;       spf=pass
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

Add eMMC support for k3-am654-idk in a linux inmate cell with both
k3-am654-idk-linux-demo-emmc.c configuration, and respective device
tree changes.

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 .../arm64/dts/inmate-k3-am654-idk-emmc.dts    |  45 ++++
 configs/arm64/k3-am654-idk-linux-demo-emmc.c  | 208 ++++++++++++++++++
 2 files changed, 253 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
 create mode 100644 configs/arm64/k3-am654-idk-linux-demo-emmc.c

diff --git a/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts b/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
new file mode 100644
index 00000000..150e31fe
--- /dev/null
+++ b/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
@@ -0,0 +1,45 @@
+/dts-v1/;
+
+#include "inmate-k3-am654-idk.dts"
+
+/ {
+	sdhci0: mmc@4f80000 {
+		compatible = "ti,am654-sdhci-5.1";
+		reg = <0x0 0x4f80000 0x0 0x260>, <0x0 0x4f90000 0x0 0x134>;
+		power-domains = <&k3_pds 47 1>;
+		clocks = <&k3_clks 47 0>, <&k3_clks 47 1>;
+		clock-names = "clk_ahb", "clk_xin";
+		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+		mmc-ddr-1_8v;
+		mmc-hs200-1_8v;
+		ti,otap-del-sel-legacy = <0x0>;
+		ti,otap-del-sel-mmc-hs = <0x0>;
+		ti,otap-del-sel-sd-hs = <0x0>;
+		ti,otap-del-sel-sdr12 = <0x0>;
+		ti,otap-del-sel-sdr25 = <0x0>;
+		ti,otap-del-sel-sdr50 = <0x8>;
+		ti,otap-del-sel-sdr104 = <0x7>;
+		ti,otap-del-sel-ddr50 = <0x5>;
+		ti,otap-del-sel-ddr52 = <0x5>;
+		ti,otap-del-sel-hs200 = <0x5>;
+		ti,otap-del-sel-hs400 = <0x0>;
+		ti,trm-icp = <0x8>;
+		dma-coherent;
+	};
+};
+
+&mcu_uart0 {
+	power-domains = <&k3_pds 149 1>;
+};
+
+&k3_pds {
+	#power-domain-cells = <2>;
+};
+
+&sdhci0 {
+	/* eMMC */
+	non-removable;
+	ti,driver-strength-ohm = <50>;
+	bus-width = <8>;
+	disable-wp;
+};
diff --git a/configs/arm64/k3-am654-idk-linux-demo-emmc.c b/configs/arm64/k3-am654-idk-linux-demo-emmc.c
new file mode 100644
index 00000000..9fbc7a5f
--- /dev/null
+++ b/configs/arm64/k3-am654-idk-linux-demo-emmc.c
@@ -0,0 +1,208 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for Linux inmate on AM654 based platforms
+ * 2 CPUs, 512MB RAM, 1 serial port(MCU UART), eMMC
+ *
+ * Copyright (c) 2019, 2022 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
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
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "k3-am654-idk-linux-demo-emmc",
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
+			.address = 0x40a00000,
+			.divider = 0x35,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0x8dfa00000,
+			.virt_start = 0x8dfa00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x8dfa10000,
+			.virt_start = 0x8dfa10000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Peer 0 */ {
+			.phys_start = 0x8dfa20000,
+			.virt_start = 0x8dfa20000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Peer 1 */ {
+			.phys_start = 0x8dfa30000,
+			.virt_start = 0x8dfa30000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Peer 2 */ {
+			.phys_start = 0x8dfa40000,
+			.virt_start = 0x8dfa40000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory region for 00:01.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 1),
+		/* RAM load */ {
+			.phys_start = 0x8FFFF0000,
+			.virt_start = 0x0,
+			.size = 0x10000,	/* 64KB */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM load */ {
+			.phys_start = 0x8e0000000,
+			.virt_start = 0x8e0000000,
+			.size = 0x1fff0000,	/* (512MB - 64KB) */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* MCU UART0 */ {
+			.phys_start = 0x40a00000,
+			.virt_start = 0x40a00000,
+			.size = 0x10000,
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
+			.phys_start = 0x4f90000,
+			.virt_start = 0x4f90000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* main sproxy target_data host_id=A53_3 */ {
+			.phys_start = 0x3240f000,
+			.virt_start = 0x3240f000,
+			.size = 0x05000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* main sproxy rt host_id=A53_3 */ {
+			.phys_start = 0x3280f000,
+			.virt_start = 0x3280f000,
+			.size = 0x05000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* main sproxy scfg host_id=A53_3 */ {
+			.phys_start = 0x32c0f000,
+			.virt_start = 0x32c0f000,
+			.size = 0x05000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
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
+		{
+			.address = 0x01800000,
+			.pin_base = 32,
+			.pin_bitmap = {
+			0x0, 0x80, 0x00, 0,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 160,
+			.pin_bitmap = {
+			/* sdhc */
+			1 << (168 - 160) |
+			/* vpci */
+			1 << (189 - 160) |
+			1 << (190 - 160),
+			0x00, 0x00, 0,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 544,
+			.pin_bitmap = {
+			0, 0x200000, 0, 0,
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
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220305030458.2938-5-mranostay%40ti.com.
