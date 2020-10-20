Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBJVLXL6AKGQEJQPOANA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x538.google.com (mail-pg1-x538.google.com [IPv6:2607:f8b0:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id F39DF293606
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Oct 2020 09:45:44 +0200 (CEST)
Received: by mail-pg1-x538.google.com with SMTP id 1sf905836pgd.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Oct 2020 00:45:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603179943; cv=pass;
        d=google.com; s=arc-20160816;
        b=HtUkzDe9aOUdmH4Ii4fLO5Tzch/ii6zr6ytfKylDG0WsVD5mygmAeywoC5iOjSGH7r
         F2U6zGA48TDoAF7C70Mc6zja5igkrsRxLMd5P5mHlbQZ6EBTgeiSUheX4H1F8yfDGNPt
         GCLcZy0ym146eR9/SbOFNndPLdCEzSd7Z5FgJQPJTRpolClh7r6erMPxv291Yi6drrJf
         UWR6i29l+Vi7Z8CQL6LpIS82utbCrSxEOv3OZGLPPprP0lAvqqKdYdWpQ8VVYbe3R6Ud
         IeLYUkwUI0bQIzPsXMGMcILp8wdpWKoursfnbmj0d3InKkkqjpZyzDD/cBKM2TDnp1j2
         dCcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=e+VhLXYzGQ3M2TGJU/x2GhIx9/Z2S7Dff6HhB/2awKM=;
        b=hehw6Vx/niDJHfiszZwMJwctUwSaRBHacxk7ensMGMmhh44Hohg4WiEGQkJphHPL23
         0e/K/6XYja8R0gTwAmRQhKi0L3lMtjDb5G1X20PQL7eIq9lUeeb2iF6xV7dnkk7vGmAX
         Qtit8YoeZF5YUbqV8v8dRoph160FQU1GfnRU2CjWlPebKTjyVlOmKvhTh2cBWiN680eP
         +2m3b9rDjbSvhZmrwU6WVxR2+S9L6BIv4qBlKxsoNDIJEKzgxXGcNez7Eo+DB/1Typ0b
         fR+MEAV2DuKrBFePibKrIoCzhzADr+eRJwMXDKaO6DubLA2EXFX8vLMUpemLEbTOavJ2
         ofGw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=g8a5lHO+;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=e+VhLXYzGQ3M2TGJU/x2GhIx9/Z2S7Dff6HhB/2awKM=;
        b=OKQsiWSFSBr4k83GLUC0vp+1T1Yppsmdzq8g8OU9fIxWmosHx7zdsHIPJCZNuwFybq
         1yTH5IxeUFJVn0oHR64WzzvzV/dza7B6SmlUwX2VhuwA8UImv19ze1K8u8qVLO5aArPE
         Lq3ih/SNLpXRWEFDVW0YcBhst2JJr3/e2vmngbViMIce1BSVi0jZWrBvl7CuEp1G0ybH
         YoZ/QhNKbCDhpaI8ZFpzQtMEUKfJH2MIMFNk1w725UuHa5Erw318dR4PrNmTvsjP8NkL
         EdqttaP3tqFTrM1e7bbKA45nJUj/sp+nbhutva+SyLVyqSUGKPX1SyM9cWXWJKe/kORH
         B8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=e+VhLXYzGQ3M2TGJU/x2GhIx9/Z2S7Dff6HhB/2awKM=;
        b=QafSRdLja3mK5QrtisSmJanpjUF97kf8+0fSiKCyp6u/1BtZqXmCTx1hLCQMBKdhjc
         QE/TmWKyce2JAH5PdTDpsAlvKg/y5RELzfU7MLaEyqceYDy0Sd62n0DIQpq7Gwy1HvGQ
         wAcKRTLb0OzD5SDV8a4JM9U9KD744p5M7ReNoq0luT7rszVXE7jKPXiQ0BT1N912B9Vq
         tGZdho9abIdaH+2P60WSsdPTjqv2OmHn2tjLIFbxUAP+Dp0BWg1Rc4AIHEtYOnPvMUON
         BiYTh4EGPDmAJSlNpmj0WpZtlKJ3Bm0avvRW11Eru0NwwYFgxEcA1LwH5A/NCRKkPCZj
         Nufw==
X-Gm-Message-State: AOAM532JejQZ26sObupZpOoGzfoDNtAMuvJ3vz/OaFd1Eqs5kaDLJG70
	7vg7nIogrzz8tmDJzf6TE/w=
X-Google-Smtp-Source: ABdhPJwELiJcwJGJ7ZE8t+WsNSyB5uhk+9hVw5cvWGmPa6B7FG8N2Kq8GNSEHTvKY2e3L1wud0/Ufg==
X-Received: by 2002:a17:90b:3849:: with SMTP id nl9mr1781304pjb.54.1603179943107;
        Tue, 20 Oct 2020 00:45:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:b114:: with SMTP id q20ls725146plr.5.gmail; Tue, 20
 Oct 2020 00:45:42 -0700 (PDT)
X-Received: by 2002:a17:90b:350a:: with SMTP id ls10mr1801973pjb.117.1603179942375;
        Tue, 20 Oct 2020 00:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603179942; cv=none;
        d=google.com; s=arc-20160816;
        b=PIBktYWzV8N86NtI800sBN2tYhgD8X0of+1xeydrH1/sn+ByfsN6bKY37GUW8jgfTW
         Rt006+tkgm5QZtRx4rz6wlG42X/gEIo38q0A1+5W769fx3MSutR+G7idnEG0gtPPmYHd
         7yZpSs3RBHZna9gQNk+sJ4af6Q006e8bBsGGUthK1YYcVXUDc8NO1cQ6MUQBHD0UJp57
         oAWszTDCy1dx5YvDHlt9V4tzZJ7jZENH4Q7SuiarxmKcGJmscBC/aC/Mr8+0AE8lTF/0
         x1viBHrFbLj6lnQJ3A/k+S/oFRCWARzdRDnqbZKnSg9O8/3deYEu6/7xjWrWF1A/OEAa
         GHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TH5ldikaLUzZHeU1qRebaGZDcqgbGYsJN5ELlF2F5bQ=;
        b=gWdtPwdJreDpgGai3KsMcdWjHgdUnjEtHZj2L07qXBqUBOuWyy4VD2IA/zTAuwNcmv
         0YQ7rm+ab7Y8uPMv5qdzhdFZENvjJqsaxCFA+866bwYP9OfGyPZfwjxH1Eyd+Z2MadrR
         cespgrJ3zrYjpMPMFGHBrWxmPFIQd+ReHYil80yDcvzGlMaZPJGqw+XnseBfyWtdlpTl
         uTQoAnJRZ4Axj9P1xM+8bwxK6P11s37zIr9zXkedAhqiuMIodwwQHfIcpCblNWHUHx/j
         XW95NH1/DTF/fk55F3r//gXxBKcQAzIvCCgyrOh/LYcJQoZUYNGA2NffD1K6HXzUm6Sw
         CrUA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=g8a5lHO+;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id v24si61868plo.1.2020.10.20.00.45.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 00:45:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09K7jfOw049422;
	Tue, 20 Oct 2020 02:45:41 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09K7jfD4047633
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Oct 2020 02:45:41 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 20
 Oct 2020 02:45:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 20 Oct 2020 02:45:41 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09K7jaR5011198;
	Tue, 20 Oct 2020 02:45:40 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 1/3] configs: arm64: Add support for k3-j7200-evm board
Date: Tue, 20 Oct 2020 13:15:23 +0530
Message-ID: <20201020074525.7941-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201020074525.7941-1-nikhil.nd@ti.com>
References: <20201020074525.7941-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=g8a5lHO+;       spf=pass
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

k3-j7200-evm is the new evaluation module from Texas Instruments
which has the j7200 SoC. It has a dual coreARM Cortex-A72
CPU cores, 4GiB of RAM, 2x Display ports, 6x UART ports,
5x ethernet ports, SD and eMMC interfaces for storage and
many other connectivity and accelerator devices.

J7200 TRM: https://www.ti.com/lit/pdf/spruiu1

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j7200-evm.c | 359 +++++++++++++++++++++++++++++++++++
 1 file changed, 359 insertions(+)
 create mode 100644 configs/arm64/k3-j7200-evm.c

diff --git a/configs/arm64/k3-j7200-evm.c b/configs/arm64/k3-j7200-evm.c
new file mode 100644
index 00000000..c3ac331d
--- /dev/null
+++ b/configs/arm64/k3-j7200-evm.c
@@ -0,0 +1,359 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) 2020 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Configuration for K3 based J7200-EVM
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
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[32];
+	struct jailhouse_irqchip irqchips[6];
+	struct jailhouse_pci_device pci_devices[2];
+	__u32 stream_ids[1];
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
+			.pci_domain = 4,
+			.iommu_units = {
+				{
+					.type = JAILHOUSE_IOMMU_PVU,
+					.base = 0x30f80000,
+					.size = 0x1000,
+					.tipvu.tlb_base = 0x36000000,
+					.tipvu.tlb_size = 0x40000,
+				},
+				{
+					.type = JAILHOUSE_IOMMU_PVU,
+					.base = 0x30f81000,
+					.size = 0x1000,
+					.tipvu.tlb_base = 0x36040000,
+					.tipvu.tlb_size = 0x40000,
+				},
+			},
+			.arm = {
+				.gic_version = 3,
+				.gicd_base = 0x01800000,
+				.gicr_base = 0x01900000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "k3-j7200-evm",
+
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.num_stream_ids = ARRAY_SIZE(config.stream_ids),
+			.vpci_irq_base = 191 - 32,
+		},
+	},
+
+	.cpus = {
+		0x3,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0x89fe00000,
+			.virt_start = 0x89fe00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x89fe10000,
+			.virt_start = 0x89fe10000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x89fe20000,
+			.virt_start = 0x89fe20000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x89fe30000,
+			.virt_start = 0x89fe30000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe40000, 0),
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
+			.size = 0x0d000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MAIN NAVSS */ {
+			.phys_start = 0x30000000,
+			.virt_start = 0x30000000,
+			.size = 0x0c400000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MSMC SRAM */ {
+			.phys_start = 0x70000000,
+			.virt_start = 0x70000000,
+			.size = 0x00800000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCIe Core */ {
+			.phys_start = 0x18000000,
+			.virt_start = 0x18000000,
+			.size = 0x08000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCIe DAT */ {
+			.phys_start = 0x4100000000,
+			.virt_start = 0x4100000000,
+			.size = 0x100000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_DMA,
+		},
+		/* C71 */ {
+			.phys_start = 0x64800000,
+			.virt_start = 0x64800000,
+			.size = 0x00800000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
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
+				JAILHOUSE_MEM_DMA,
+		},
+		/* MCU WKUP peripheral window */ {
+			.phys_start = 0x42040000,
+			.virt_start = 0x42040000,
+			.size = 0x03ce4000,
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
+			.size = 0x00069000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCU FSS OSPI0/1 data region 0 */ {
+			.phys_start = 0x50000000,
+			.virt_start = 0x50000000,
+			.size = 0x10000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_DMA,
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
+		/* RAM - reserved for baremetal apps */ {
+			.phys_start = 0x89ff40000,
+			.virt_start = 0x89ff40000,
+			.size = 0x10000,
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
+		/* 00:00.0 (demo) */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 4,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		/* 00:01.0 (networking) */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 4,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 4,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+
+	.stream_ids = {
+		/* Non PCIe peripherals */
+		0x0002,
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201020074525.7941-2-nikhil.nd%40ti.com.
