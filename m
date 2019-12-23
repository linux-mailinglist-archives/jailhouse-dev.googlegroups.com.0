Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB3VTQPYAKGQEHBDCB7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8DF1297D2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 16:14:57 +0100 (CET)
Received: by mail-qt1-x83d.google.com with SMTP id e8sf11316496qtg.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 07:14:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577114095; cv=pass;
        d=google.com; s=arc-20160816;
        b=XnuJ8aw5XOoRFHUNHlaLmFlfk9XaEUFQzK4f+VxeHfxLtOQ+ZQvylI+dvi4f5nyqrL
         t2mfvOEq64rWK4OBdvTZkQbJAgCek+P3IY9vNh4E4sLwCONjT93ABDPgerukwgTxyMAC
         o3vaM/pK6mxPKbN6Kd2Sc7kHPd51DvOCYMW/gzZSLfKUWKue03toi2hO4F1ScE+W3UvN
         lQS7yEPyVfiDegzvXY5wVGFGiHwZn5RwF6Zh8uWIs+x1iyV5eytbxdQawMyPDg2Hq526
         pICbVo+fV4/757EJpuZ/rSxI/icBOxKmV65BQrYXI+haXcOBIcXrx9OBTWJXB7k8Mp7r
         OhXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=S4Q5FV0MoFCpreex0280T5nKGPJnsH3yeRLmCO8Rw/M=;
        b=T0cLkD6C6WwNRchKBMPO3I2p9n7YCkl+L9kjyeoETJnNF+27/xK2MnJRin4teBUyTL
         9i8psv6dk6no7MVHm4S72n3Y8F9kK38nJbIp6p7WoA4PqsWo+IISGELC+jzNhACUlscU
         ArLXo6lpSE3X3ZTRucQHfwwF6DIa7wtG179168LMiXRu5arjBtXtnA/OaBQi2L3N4p7a
         /oV785Xjjobx6h6A5i7rlPUpvJ7kF3YZuQWkFyY+FC8R9PBPDuYmCDtEpWhpxnbVNyvU
         z5ugp/uLi4lZjWUGzJDB/j8+HYZK7On8+9a6NV5u1eeg4xyYm9/2bcP+SOrynqY7giHS
         uXww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Zde7nNRC;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=S4Q5FV0MoFCpreex0280T5nKGPJnsH3yeRLmCO8Rw/M=;
        b=sx+C+aBqY17/q19XLkbTEcBvPzW5e6JObn60OchqgyyH5Pa8slF65y9dM1+g+iEoQi
         HEjA7ijuwsgriFWiYQZUyADBQc3xCRDOz2z9+egFiV/2uJM9FlPFNvo7grGTWvw3FviY
         3WuD8iTK/1WwgfGjslKu0I3UDjossWTo3v/YmJB1yLUKjMVMlMakDQ+vmXIFbRjbYk9b
         rKIsw9Q4VaUwZbLh7a2hzJounOh0G8SpzKQPQs8pOISPmg7maJOX1ZsCHFtkmimoafnt
         pssVDpMkaJcAG8/xMh/7nN04c9/tLHavhD+pvn5oh2abqQXtivLAi7++KCqspOCWA7cv
         fw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S4Q5FV0MoFCpreex0280T5nKGPJnsH3yeRLmCO8Rw/M=;
        b=pnusL/ZUGKIJedNLnt0gc4hhmxZbDFPSR5A/k0tnrL6+Xp+5grSQMC3kc+kd7Re0UM
         mcPyNjl/tiq7nFdUKliMNrFdI0YwMtxLbOmgXmLuL4jjazCIrNqjEkl8X5iNQrf6XNg1
         u4YQCCdA/gbpFqLzt/YZw2uYNnE/gQpPweVEo3AADXshdcvFbuZT/LeOygdcoayscX3F
         CVKgEzH6MygvvZkFjGrDCRAcAg+czvqFGT+aeTDmb3tJ/PKxWJX36mfdhoyoyUH3Dwgv
         c2vIUm2dpO5loGlsg/T/lhbYohfEyoZ8LDqR8VRepNVUfldwDbiYciJYaoA63z60ZEUc
         OSgw==
X-Gm-Message-State: APjAAAU44UGyxzFolUV9vcHQIKvBgPB0Hwqui7Xj7Ba1p4y5U0dxkrpP
	8zwRvhHRZZ9fVNODOv9bPJU=
X-Google-Smtp-Source: APXvYqxVCQyYdlKNvG3Bo0s3XL+5d3dh3uQxNujwp3RqJ+HCB2Qih64MnIG4RjHq/fO3lXh2dKtidw==
X-Received: by 2002:ae9:eb48:: with SMTP id b69mr25880934qkg.43.1577114094794;
        Mon, 23 Dec 2019 07:14:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:c17:: with SMTP id 23ls5753366qkm.14.gmail; Mon, 23 Dec
 2019 07:14:54 -0800 (PST)
X-Received: by 2002:a05:620a:14a6:: with SMTP id x6mr27751811qkj.206.1577114094338;
        Mon, 23 Dec 2019 07:14:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577114094; cv=none;
        d=google.com; s=arc-20160816;
        b=KHym6Vq9spzhuGbbgnK8CQ+aUuKQvkYGKi88deb9kuecUKXirdoTaGlQ4dwggSPSTI
         Ocjv9n99yAqqgfZ3bwIYtHTyWRJjQIyW7L79KS8bJIjc2o2OnRf9XyhblTSVSeAR3byH
         AS//7XTQWXy8lFzGK7cw3f6KERFAcOVpcJ+pmHPEcY2rEccAGUrPavE9JrIc58exD00x
         TlPC6cQfurX+YA8DtcAzThg2ES3OSq73jPuM64qJnVqcCKe1aKhPgG2Kopot+cxJb59K
         cPUqP5Zqpyztnw9geCZoVdlNBFMXY5kVka/8hmdvyxoHWfFLSsv0jjNuuqM4qdZs9yfH
         1gUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ByYK7ICmyLHEeqHF9ffvBaeGU60jdmVvbQe3DKdp2sA=;
        b=k0wjabcyAeN2SX0s2S5nKTnr9PYAUNMEft5wP13Zaa54al6yG4z2P0De5V/N+sIqfj
         Lc2eAppmJddpfZ/o4aZqUy30QqJkmhS8rWFHXCIyOX/n1CxhMJoh7wUlQhAPDEi5rz3I
         MOeB/ys095l2fb2k8nKngrn5i2u2ubGokxMT7SgxoUveA1KLTi5CEQuF5GFUU5q6owYY
         gKWhzcfu/hh4Il/9Wd1rlcLW0dWG32pTMTwWVs43blxuE7TtiIBzDYhBuTOzGM1b4+cU
         2MKOXqI0pK/yEpsxmJjvZzmh7x/rBIbExLtjNxVI+/0NTh9YjnJfPE2xuOyH1aK+7zFA
         /bHA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Zde7nNRC;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id l9si993556qkg.5.2019.12.23.07.14.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 07:14:54 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBNFErjc108547;
	Mon, 23 Dec 2019 09:14:53 -0600
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBNFErLR117902
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Dec 2019 09:14:53 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 23
 Dec 2019 09:14:53 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 23 Dec 2019 09:14:53 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBNFEZ1R020577;
	Mon, 23 Dec 2019 09:14:51 -0600
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>, <jan.kiszka@siemens.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>
Subject: [PATCH v4 2/4] configs: arm64: Add support for k3-j721-evm board
Date: Mon, 23 Dec 2019 20:43:51 +0530
Message-ID: <20191223151353.22495-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223151353.22495-1-nikhil.nd@ti.com>
References: <20191223151353.22495-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Zde7nNRC;       spf=pass
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

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Notes:
    Changes from v3:
    * Change PCI domain
    * Mark PCI and Flash device data regions with MEM_DMA flag
    * Add mem_region for USB and SRAM
    
    Changes from v2:
    * Do not map hypervisor memory into root cell
    
    Changes from v1:
    * Split up the peripheral mem_region to match with kernel dts

 configs/arm64/k3-j721e-evm.c | 363 +++++++++++++++++++++++++++++++++++
 1 file changed, 363 insertions(+)
 create mode 100644 configs/arm64/k3-j721e-evm.c

diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
new file mode 100644
index 00000000..ff6dcff4
--- /dev/null
+++ b/configs/arm64/k3-j721e-evm.c
@@ -0,0 +1,363 @@
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
+	struct jailhouse_memory mem_regions[33];
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
+			.pci_domain = 3,
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
+		/* usbss0 */ {
+			.phys_start = 0x06000000,
+			.virt_start = 0x06000000,
+			.size = 0x00400000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usbss1 */ {
+			.phys_start = 0x06400000,
+			.virt_start = 0x06400000,
+			.size = 0x00400000,
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
+				JAILHOUSE_MEM_DMA,
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
+		/* MSMC SRAM */ {
+			.phys_start = 0x4E20000000,
+			.virt_start = 0x4E20000000,
+			.size = 0x00080000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_DMA,
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
+		/* MCU FSS OSPI0 data region 3 */ {
+			.phys_start = 0x500000000,
+			.virt_start = 0x500000000,
+			.size = 0x100000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_DMA,
+		},
+		/* MCU FSS OSPI1 data region 3 */ {
+			.phys_start = 0x700000000,
+			.virt_start = 0x700000000,
+			.size = 0x100000000,
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
+			.domain = 3,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191223151353.22495-3-nikhil.nd%40ti.com.
