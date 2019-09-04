Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB46YX3VQKGQE6DPAKHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id A9684A820A
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 14:22:12 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id o123sf16568053ybo.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2019 05:22:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567599731; cv=pass;
        d=google.com; s=arc-20160816;
        b=vi1tA6CVqe1Q9Lp5XFtKyO+Qeg/p9L2WsbuMKUr4i1oux1RVmZz/I4uv3gltLQYVT7
         GPOD9ltEVL8b0rB2bRGZchVYeIXvoLzrjiXJfvph5EbcIRgZTNfUhJOplL9E6JItORGQ
         viJ2hEeuyDVpZsxG0ZqUYEQup20CIxZiySTow/DypjaJi2aQn6QdyvXE2Ln9cLVNKgHI
         kUV5br1VtbIpMYQ5s45CuFBz/OdspXIHukadH78B5f2X7VIpapMIPYF6HPdbIFCOfMdl
         ow6zlJS+nTu50OK34COr67ovisbWbrBj6X9Vv7n014QEOS1an6JYzCXWmEcJm0W0QMR7
         qzPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=QPdUkw2+yOWpinMo9Iy2s8LQqa7fpHms1F4XM3SyP00=;
        b=z9bTBE270FLDbYk922whrL5q2V5kVQDl32sxKroJjKn4VL+s8QKUQunfzX5XYOJA3R
         SLJvc8ys7igXTMDjoBjm/6WREk8iVSKiaed7vr+EEjQRhFsBVR2bjTwvAy7TKfXAUmcM
         yCpAAcy7sekEw4+W/ntdwR30JVwlMLRQ0njB3SgtUigURCyisEEglvrtRheGkLXfh76H
         jG6IE2SDbmcO4OkuhIU7pbUdtlZM74Anzyv0x8j87uM2kmv8ERROobToyvmQ7I8Zue0J
         igMhPL/73PY7z2c+bOloW6cL+Ky338+2secFV+gG47bu5vECP6Mq+6N8iNq4I2TT834o
         BHHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DMUC19qd;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QPdUkw2+yOWpinMo9Iy2s8LQqa7fpHms1F4XM3SyP00=;
        b=X77EPMGsd+JcbY3AeCRo7tL4fM4mL/t5HaUnZnB+dOt9W7G0/10AucHjGGA1emrOSi
         crNbymQ4iM9cruUTQH+DBnaxN2FTcVjv5iJML9IECp4AuVnOzhTlCnWj0kHoCuJ4To6D
         AMHXIGcH8EujD4043kA9yO6P4qOT/ywjBBHO2l7mz4ovr32FaS34wBBI+cY/yRrAStvt
         +gdUPNCNssbzoaorEZIdqds2KStzONQPomRaD3/SSQW3RHRQBjx2q9hzZ8milKrYxwxb
         3bwADFZMWnj7fyPYgcEKc2kFh+treI6QXOIJTlpp+bd0eTgNtPBEEYJ3K8qS1Ui/pmfC
         prRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QPdUkw2+yOWpinMo9Iy2s8LQqa7fpHms1F4XM3SyP00=;
        b=Wqe5p5TjUw4qgGgN16P3ja6DXSe6lXh11/1fckaLVkAeAgeQd4fOWWOrwzKFjIAD6W
         ee3G9F0xD1HFLvAf06iOIsK59PMVLxgbBXTi0MZ/upAuWvGEHZ28IojZ/hoUp4pi1Y1V
         quUxW0URfYr179xa/the/FZRYZkvV2VL3sthLR17Bar8yLapRbWvk+f4cP1qVxxmt8yn
         5bfB7tVUx0183CKZQd1XMNXZvmcNTqycg2G38n5r8e4IrMY/skFCP9cMOU1KigDcgM1u
         VRBddqqXXfbHq2jEV8D5r7Ti9AyOrsKnLlhGAJDlOtQKdMgnT6ONcMH+/xnHE59Hm1ht
         kOcA==
X-Gm-Message-State: APjAAAX7nZ5rjObZ2ysg4nWMckaLpLN7iMA/0QiaAWvlPFIhFsL/CHMC
	px9y03500VWoPO3BbzINpQo=
X-Google-Smtp-Source: APXvYqycZaDcPzUyb3pmcj9C1hqlU+dIyUrbJ/0+BHL2cquh729zFrWOebkoIDr8Vvtpu6Qv32T4gA==
X-Received: by 2002:a81:8687:: with SMTP id w129mr259414ywf.21.1567599731701;
        Wed, 04 Sep 2019 05:22:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:8c8:: with SMTP id 191ls2929443ybi.11.gmail; Wed, 04 Sep
 2019 05:22:11 -0700 (PDT)
X-Received: by 2002:a25:c685:: with SMTP id k127mr28784827ybf.399.1567599731245;
        Wed, 04 Sep 2019 05:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567599731; cv=none;
        d=google.com; s=arc-20160816;
        b=nKYW3TJn/ajam5XqdbP3/jXp69lBcU8mLWc8Bz8/DhpDoF0mD5FOkdtqkxmjqdO4ec
         yMGVeH4kEydbXExi4TggM6fLU+9WuZUyV/Uit5u+NMsl2+i+BTr322xxez17M7cEGHDR
         s5kKXCgZZZKpkdfvPbqX5BWN08bKudLRfW+aFhtG9YVah0lXVTRDNySZQqZIRiHD7Mch
         QsezgSjPvgb6OEQGF4HWloLJjiVIi0fguCRLY7mQbs839RzDG7Bb+pZvHct7hrS/cR21
         2ea9CEa5m7SHhSNkNiDIbg06SjsWY44J1WYVbF10PZf5yJNN716SH6Lfyy/2b6NNaeau
         C65Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jn2GTa1nB7pU2MoiOB3rM7EsrBVOYkXFQlhSGOoERDM=;
        b=C7M22jtwfa46ngtymq8SHKsil5dD2fYQma18LOTleUsV79E/AA2sAZxpG435ngROQf
         Rm6JQoVpM2bHaTH/iHU2CTqtRVuQAJEHa46JtXj5RrNmPsJ6FEGXfqkXxp4G3tOjgx4J
         Ofyy/BSCZtREUXqKzy/4jHRRW5Uck2CnVUnvPfvKzd1fwC2WvCyOuw8ZqlMEIlWh25ix
         E6l4XCd/+Ll1fCC6C1LUtg1sp/NRSu86qVUt3tvyh1EsTd9iyZiQK7vE3aGlUH0tvAIF
         csXCqO2c1ryOU1ok8ZDAYqCT2utHGucNAHYyNwxe42s4CvVSvLLVGuZWSVOly04V/zWa
         LjMQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DMUC19qd;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id j5si1292220yba.2.2019.09.04.05.22.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 05:22:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x84CMAE1113780;
	Wed, 4 Sep 2019 07:22:10 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x84CMAHc121136
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Sep 2019 07:22:10 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 4 Sep
 2019 07:22:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 4 Sep 2019 07:22:10 -0500
Received: from NicksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x84CM4PH116363;
	Wed, 4 Sep 2019 07:22:09 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v3 2/4] configs: arm64: Add support for k3-j721-evm board
Date: Wed, 4 Sep 2019 17:52:01 +0530
Message-ID: <1567599723-19589-3-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567599723-19589-1-git-send-email-nikhil.nd@ti.com>
References: <1567599723-19589-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=DMUC19qd;       spf=pass
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
Changes from v2:
* Do not map hypervisor memory into root cell

Changes from v1:
* Split up the peripheral mem_region to match with kernel dts

 configs/arm64/k3-j721e-evm.c | 340 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 340 insertions(+)
 create mode 100644 configs/arm64/k3-j721e-evm.c

diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
new file mode 100644
index 0000000..bc68c03
--- /dev/null
+++ b/configs/arm64/k3-j721e-evm.c
@@ -0,0 +1,340 @@
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
+		/* RAM - reserved for ivshmem and baremetal apps */ {
+			.phys_start = 0x89fe00000,
+			.virt_start = 0x89fe00000,
+			.size = 0x200000,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1567599723-19589-3-git-send-email-nikhil.nd%40ti.com.
