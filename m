Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBNXD5LVAKGQEQUABUKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53b.google.com (mail-pg1-x53b.google.com [IPv6:2607:f8b0:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D38926A9
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 16:27:03 +0200 (CEST)
Received: by mail-pg1-x53b.google.com with SMTP id h3sf2679205pgc.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 07:27:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566224822; cv=pass;
        d=google.com; s=arc-20160816;
        b=VFPMF+hz7JrNevaJ+rBkShg6Nj+yZT7Swxhi7ocPl5uc6Oiv+cG8YCFBfrSqMRF9PY
         Fq+vEYHjeLtWnL+79GEQRZs41bKH/gqrtqOrJaPfEYx5TylL3uLrqDWc4tohZYiXIzVI
         WhHAOVdlaYaUuwHZAHuJJepe3D3iDTogZwXWDOqID8xNLONVh1vrDI1pxns3ZO2c/5io
         K9lTCQBcZi1j4w8CRwh1TqlKXUslURqbOmlgJa57g5mRfv/r1SbIz8igGbqbKed0LgDw
         wUsnrFA/ybh8JATLYEkRrzYHo3RmCVcJzz8mQXCeVXyN+ZYtZYjMohaJWvFhgSveQkH9
         JcKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=cV3ZzSIZlOy4feRrLBeQ0/eb3BAs8pfwKWahYokgB9U=;
        b=ybCnKcuxmeh/hSY3GC5s9fbUlVxUjmU0xU7SeK6SK6XAoQ0gOa2u9bGezkNxX6tuKQ
         pK2+FwoZhpXJSFGQz0wGdp1aZE65sjYnty53sbo8MI2ep2wCgKA8l2k3NPrr9Ll0eYhT
         E0y9gZuR4jcjmyHjFRnA0C2KkI8aDC0t5BqE4lRXFCbiudTwAdrh7K622lwFf3D4Iik0
         B8Tqmnbrv1jtobli665JO9mrG5F94mLPrT/4WvbcRBoNhnt0DYQTAo9707Tw8QW1SowN
         S5QQcpR+t065752jNvi2AiXph+ayovbt1fGKntA1kym2Ip1R830P2A37D/3HHIGeRnlJ
         fTOg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Cx0c3uSq;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cV3ZzSIZlOy4feRrLBeQ0/eb3BAs8pfwKWahYokgB9U=;
        b=K1QxQD3dm8s+EgEn/VCfYEWzLTbZxZEWeJBbsOofmqVqAC4qEumUP9FzzmZwIAkBZA
         +AoTyKq6OhPo8oxttcVL9QZE6ytkILOJuvqBv8gj5durwKMOHvUTkbh7E9xVWlJX/X6H
         UxHaLxnOkFOKImUMZd05HMM3ei4sxvllLHph7UVWOqA0Vfgtks6oDva2del1ma+JcmzX
         hAEgEVsKtSvfGDRZJCAVNaFBtLN7bTyEQweNt9FC4QvUz1dj3oWSqi1OWiJBL6YWHOtn
         OEP1D+DLA6AeFdNm+cqC8E3x+v6pfw2W1F3s+OLd0QIA6CV47HK9jIU5EtwPU5UU2o1S
         Sosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cV3ZzSIZlOy4feRrLBeQ0/eb3BAs8pfwKWahYokgB9U=;
        b=ouoWf89AMlxkkiFfDtFaSgoei7XAMIdxUXJlyH3+O2UmQ10I+FuekuTgWKs0lMwxHN
         pCtDvYvusXmD9MfaDbcPjimQIOZkOra7yuj67irusRVLDqAw0LYT7SaDYu9LJpmZFkhk
         PBpumzLKKjjENeXVYrllwEnDImAvbnOsz8OsHitLlagQJ2KD35nu2tAaedcNFn86m1zn
         DyCcPLS/fkuRROavqtgbPVsBGqz68sRUTotsL1VYSaCLlS/Dxo9hRFRTTgd0UcLITuQ6
         +613CftySUONdliSIOsgcukF5vJzAfkBkU+5rSqPF+CwbWS350BE0RSWkf8dOykO/g6I
         iW6g==
X-Gm-Message-State: APjAAAUmokAKgF1/dBWEQ6vpeFkimK53zCdzdo1QZq4J4Q7MFmG066d/
	z6ytE8Md9QIwjjNQN59SMfE=
X-Google-Smtp-Source: APXvYqwy8iQ/YS2k1gN5TmUpbg4P/x4kGY1LpNgCiR/fZZUgKEhV+NYTVPhMZqEWc41xq0qb8GeF0Q==
X-Received: by 2002:aa7:9882:: with SMTP id r2mr24641292pfl.146.1566224822218;
        Mon, 19 Aug 2019 07:27:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:9a89:: with SMTP id e9ls3436453pjp.0.gmail; Mon, 19
 Aug 2019 07:27:01 -0700 (PDT)
X-Received: by 2002:a17:902:b413:: with SMTP id x19mr23254139plr.121.1566224821856;
        Mon, 19 Aug 2019 07:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566224821; cv=none;
        d=google.com; s=arc-20160816;
        b=zYUkieD5qVK549z7RvcCzz3CoCUlo+RiL5lKyrLZESGgTAPQup0zQk3Ydik1b3p/Au
         tGLu5nqIu9pkarf4jN305DzvP124UDlr6bjwUw2Y384d2JO7OM19YG7uNLzy7d29r8td
         luRtwNPuZ6h3CRXnsvnX/clXIIx9z6ranpsoTiUwSeyrRc8D+ipWHzRE/drjONLR0Or9
         Jh+t19ZgxZ91E74mwYYSqq/DDpJZfpWW3ZeBm1uc4VTY58eJjik5DllxNgpix5Yd1svT
         5XK11GgLiODeTHFZS5ubKtWEiyXhA+3SA0vmBD7rajhl/cvKyFjmv8BzVA1HHSdDi8Yc
         ttxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KL7yhgma4SIzcE3pPWi80eE0xa1oZ43E/9BNFyqB3rk=;
        b=MFUxf0rA7DI2sQOAJ2Z+X6JhO39dOb/ngMbR9WOmudSPgBbWB5wuGX3y0D9kxrfcUx
         OM1w1WQARAo5eI/N4TJcuKyGkCVD2wTqWLETAq/TnHZ3ZFHX/fzRTmlmCaGy24Hq3UYE
         ar4FZqZBFa/dpW6yuQU4/kvYsuOo+NzQpBeF9MXoZlap6g2UKtSns1wnyU+XESSoZ+4Z
         z/XyEbSDP+bL3sKZk0QifnfD03WurbMmfuccZTxdhEcRi1dy5B/BTXNBbFLfO+cJAcxP
         ur/2KucRn2vkKxpBjeCQ4m84bljeDv6dt3pw6NyER7oRQlG6HTwEiMWM+HArvlS02hLh
         K4AQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Cx0c3uSq;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id a79si622191pfa.5.2019.08.19.07.27.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 07:27:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JER1sR120371;
	Mon, 19 Aug 2019 09:27:01 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JER16W039173
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Aug 2019 09:27:01 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 09:27:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 09:27:00 -0500
Received: from NicksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JEQth0128856;
	Mon, 19 Aug 2019 09:26:59 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v2 2/4] configs: arm64: Add support for k3-j721-evm board
Date: Mon, 19 Aug 2019 19:56:51 +0530
Message-ID: <1566224813-20129-3-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566224813-20129-1-git-send-email-nikhil.nd@ti.com>
References: <1566224813-20129-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Cx0c3uSq;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
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

k3-j721e-evm is the new evaluation module from Texas Instruments
which has the j721e SoC. (aka DRA829) It has a dual core
ARM Cortex-A72 CPU cores, 4GiB of RAM, 2x Display ports,
6x UART ports, 5x ethernet ports, SD and eMMC interfaces for
storage and many other connectivity, graphics, multimedia and
other accelerator devices.

J721E TRM: http://www.ti.com/lit/ug/spruil1/spruil1.pdf

Add support for the jailhouse root cell config for this board.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
Changes from v1:
* Split up the peripheral mem_region to match with kernel dts

 configs/arm64/k3-j721e-evm.c | 343 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 343 insertions(+)
 create mode 100644 configs/arm64/k3-j721e-evm.c

diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
new file mode 100644
index 0000000..292093b
--- /dev/null
+++ b/configs/arm64/k3-j721e-evm.c
@@ -0,0 +1,343 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Configuration for K3 based J721E-EVM
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
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[30];
+	struct jailhouse_irqchip irqchips[6];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0x89fa00000,
+			.size = 0x400000,
+		},
+		.debug_console = {
+			.address = 0x02800000,
+			.size = 0x1000,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_MDR_QUIRK |
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
+				.gicr_base = 0x01900000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "k3-j721e-evm",
+
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.vpci_irq_base = 191 - 32,
+		},
+	},
+
+	.cpus = {
+		0x3,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0x89fe00000,
+			.virt_start = 0x89fe00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* ctrl mmr */ {
+			.phys_start = 0x00100000,
+			.virt_start = 0x00100000,
+			.size = 0x00020000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio */ {
+			.phys_start = 0x00600000,
+			.virt_start = 0x00600000,
+			.size = 0x00032000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* serdes */ {
+			.phys_start = 0x00900000,
+			.virt_start = 0x00900000,
+			.size = 0x00012000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* timesync router */ {
+			.phys_start = 0x00A40000,
+			.virt_start = 0x00A40000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* Most peripherals */ {
+			.phys_start = 0x01000000,
+			.virt_start = 0x01000000,
+			.size = 0x0af03000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MAIN NAVSS */ {
+			.phys_start = 0x30800000,
+			.virt_start = 0x30800000,
+			.size = 0x0bc00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCIe Core */ {
+			.phys_start = 0x0d000000,
+			.virt_start = 0x0d000000,
+			.size = 0x01000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCIe DAT */ {
+			.phys_start = 0x10000000,
+			.virt_start = 0x10000000,
+			.size = 0x10000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* C71 */ {
+			.phys_start = 0x64800000,
+			.virt_start = 0x64800000,
+			.size = 0x00800000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* C66_0 */ {
+			.phys_start = 0x4D80800000,
+			.virt_start = 0x4D80800000,
+			.size = 0x00800000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* C66_1 */ {
+			.phys_start = 0x4D81800000,
+			.virt_start = 0x4D81800000,
+			.size = 0x00800000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* GPU */ {
+			.phys_start = 0x4E20000000,
+			.virt_start = 0x4E20000000,
+			.size = 0x00080000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+
+
+		/* MCU NAVSS */ {
+			.phys_start = 0x28380000,
+			.virt_start = 0x28380000,
+			.size = 0x03880000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCU First peripheral window */ {
+			.phys_start = 0x40200000,
+			.virt_start = 0x40200000,
+			.size = 0x00999000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCU CTRL_MMR0 */ {
+			.phys_start = 0x40f00000,
+			.virt_start = 0x40f00000,
+			.size = 0x00020000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCU R5F Core0 */ {
+			.phys_start = 0x41000000,
+			.virt_start = 0x41000000,
+			.size = 0x00020000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCU R5F Core1 */ {
+			.phys_start = 0x41400000,
+			.virt_start = 0x41400000,
+			.size = 0x00020000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCU SRAM */ {
+			.phys_start = 0x41c00000,
+			.virt_start = 0x41c00000,
+			.size = 0x00100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCU WKUP peripheral window */ {
+			.phys_start = 0x42040000,
+			.virt_start = 0x42040000,
+			.size = 0x03ac3000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCU MMRs, remaining NAVSS */ {
+			.phys_start = 0x45100000,
+			.virt_start = 0x45100000,
+			.size = 0x00c24000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCU CPSW */ {
+			.phys_start = 0x46000000,
+			.virt_start = 0x46000000,
+			.size = 0x00200000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCU OSPI register space */ {
+			.phys_start = 0x47000000,
+			.virt_start = 0x47000000,
+			.size = 0x00068400,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCU FSS OSPI0/1 data region 0 */ {
+			.phys_start = 0x50000000,
+			.virt_start = 0x50000000,
+			.size = 0x10000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCU FSS OSPI0 data region 3 */ {
+			.phys_start = 0x500000000,
+			.virt_start = 0x500000000,
+			.size = 0x100000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCU FSS OSPI1 data region 3 */ {
+			.phys_start = 0x700000000,
+			.virt_start = 0x700000000,
+			.size = 0x100000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+
+		/* RAM - first bank*/ {
+			.phys_start = 0x80000000,
+			.virt_start = 0x80000000,
+			.size = 0x80000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM - second bank */ {
+			.phys_start = 0x880000000,
+			.virt_start = 0x880000000,
+			.size = 0x1fa00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM - reserved for hypervisor */ {
+			.phys_start = 0x89fa00000,
+			.virt_start = 0x89fa00000,
+			.size = 0x600000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM - reserved for inmate */ {
+			.phys_start = 0x8a0000000,
+			.virt_start = 0x8a0000000,
+			.size = 0x60000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+	},
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
+		{
+			.address = 0x01800000,
+			.pin_base = 800,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1566224813-20129-3-git-send-email-nikhil.nd%40ti.com.
