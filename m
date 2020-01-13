Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBM7F6HYAKGQEOFYZWBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B4D139248
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 14:37:56 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id o6sf4983433wrp.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 05:37:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578922675; cv=pass;
        d=google.com; s=arc-20160816;
        b=h2Dm+qSowtNl9jxI26YMf/iD7OH++OaCkgwv9oXzYsJBqUVSMkBona5zo0kaOVddZ9
         LzcdoGyxlCE/9yul62qtuaNpnggGUR1mmEfv9RvI0INTFTamhcJ7mnLCZq3Mi5g95jDh
         Z/9T5dI+XlYEVuUWvdjQDjvkVCRyOjbZr+6fR/iagoVnwa5JjhgDRz/LBHRdmz87Lo0m
         00KyNWjkchHmKVE1y/t6wBc+5xOanTvMdAljFRMt/otn28L7WwwXRi83bpzXLcU/Qwh9
         D2RN13XC9XZx14zvEoKD92qTgKRFOqotmplNiNow/FoV3OpzI5sHkI1p3UPjf53CXWhc
         5Ceg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=XKWgZFPffpe9ADf0WmGHaRhyfgiYE06OqzM9NQOPlm0=;
        b=EnSU28IKiS2tKCFV9icHB3RGKRuL6KlWSo1SIF8efpdAiZl4x0e62NO8upEoCsmNKt
         I68kUzSplzC68D/A7w7qWQ6jHoi7Mr1f439PFsRd+EvOcpgfQCY3vNk8EaSIJyvgPNl3
         sIP9RRVUsyJLaCFeMUqBzKmGhVAB4WLQa7/Mmsq7bZ/y8FmZdnE2HPOvialH6Ry50mdd
         OBNEs9u45pMf2zgYV0RXK6n/VH3nFKD2ePOzveMHY4HJS9lykd8OUgIXviG0/ZRBpLqt
         cZeWdSnUekTRMnIU7liJBBNdElASPSxD0Oc8NRtOjs8SCaQvskV9yvrLe0zQpB5pdZKn
         zZuw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XKWgZFPffpe9ADf0WmGHaRhyfgiYE06OqzM9NQOPlm0=;
        b=eyxNPQ944ySBoIVC1jG5F9x94++DpzA/0Gw5ZFD82LYDdjbp6O+yPTmaJRd3oKYIdq
         WvEIeM9s4/ubKcUb7n2Mr4Fv4kbjYvSxlb7MJeiTKWsEx192ucfqJEUt0AbrC/f2nANy
         sukwrZfOxbb/QmAWxTPvCHJGlJRNEITMczpshwx7LKRiaHeWXoHq+5HaKx3dqyN4OEy6
         fks4qnEWTdZq4OJ+CnOxbEjsb3tw2seTby41KLJatbVq8jaH26b5XoOY3nxWcy/DDKSE
         ZFRwWuRfE7u24ax+lfobX3yLrQEpltsgjzHRQUgMAiPoeK/ySELLR6GFUNKICbNTfUgn
         8gDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XKWgZFPffpe9ADf0WmGHaRhyfgiYE06OqzM9NQOPlm0=;
        b=UQN3jthJBcCHZZjStckhD2v1pMB5JvhyCGNNTUgSnP3rmUGqRkNcRCAzDZHV95Aq7C
         xwXvgJWhYu6+1briyl9MT+cnir8OldGCIRJPooG8+1uNshs2eYMIsXrCxw8alMRte0wh
         FqKDfG+LPN0zoMWt8ng7yIbVI3j7o3kpWbylpo1oD73ZyhZIbzEtcMHTwzEaADcZ1H2X
         tHKNwnBRLf9InOekdDkK6wVYzw6zWAsmygWOnfRrDUfa5s50IBT4+2bvBTfiwd4Znv8J
         +27BOTUuFxER1fTN6eAHGMBO0LWiLOTc0aLItaQElm0J4v+xRjwUjkpsIxWjuf+yYm4i
         hsJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVcipE6cg50zjSjHcIUsO2qq9C62qA1tVXeh9YqXRF//LRDSPGi
	BPqM4ux7kVtuYqupr4C5jdo=
X-Google-Smtp-Source: APXvYqyfmu7wphOeLSmXB5Ct0HdGqpXXmMG4OHDmASqUD5pTmAQ8d6PlylJvMRanCA6837U27226xg==
X-Received: by 2002:adf:fd87:: with SMTP id d7mr18709235wrr.226.1578922675548;
        Mon, 13 Jan 2020 05:37:55 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7409:: with SMTP id p9ls6105881wmc.4.gmail; Mon, 13 Jan
 2020 05:37:54 -0800 (PST)
X-Received: by 2002:a7b:c764:: with SMTP id x4mr20909840wmk.116.1578922674621;
        Mon, 13 Jan 2020 05:37:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578922674; cv=none;
        d=google.com; s=arc-20160816;
        b=gljaWT9d9x857iPMd9m2Bb2xTB0jV7gP6iOMdDx59Kox0NpQn0SwW1ZOmkwwNGVyqN
         gA+X/HIX/cjeOsCGlYW6Ik6YfeCVPkicBIvtnbRF2nZOHlyIaD08Z7a3VH5GRvtUeAG7
         63iUONqYk6/+2R5i4yG1V0fq6S7MvizGEK7IfX+nUTA5mYwSN3+SJRuHf05AD1MO6p0t
         T73y9pIx84wXE3o+ALWnz3Qt3SeEoKd7tIcVTJ+3ARtsQ4MG4exYWQJ1uXARxmnYbJkV
         +SSP2MP4EMbnSeXJfcfUjegxKEjVX2TRkx1Fhm0XCtza3AnMhJnbLUvK3Wigvc21Pavc
         Mo+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=FHjtpAEequpxVT/SqGYY17idY0JedCDJ4DOescTmM2g=;
        b=lx7T37TYBnsjzcm/Yyc8WwCYQ2WSHh1MToJBODunHmHXdaC8Tzu27plUrw3nz1fnry
         plqYDoSv32l1GIPiFHACAhKTjGS4LxQwyKjvbyJhw+lOxy6EIh/Hw0MegQoJzU2DUqP3
         2SJnk1NPn6Jsp9YyVHaWP0Q+p/rDFnqagMQPdk8REH82JOBcTYa/kB4hPDTf2Y3M4Ts/
         I6QXNdJXKtxSLLwSzXqvu00klri0TxstALUjxdvmnjYwUdZ7vY2lgHT3CMY+5do+8oYU
         OBgfJIe4L0XUYUFq/TAkF3TPDbeVKCBDzffi6CHlh2N0pZSLjYyjx2Ncb0g65QosZpKQ
         2G9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id s82si516807wme.0.2020.01.13.05.37.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 05:37:54 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 00DDbsUJ017366
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2020 14:37:54 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00DDbsoh004637;
	Mon, 13 Jan 2020 14:37:54 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH v4] arm64: ti-pvu: Add support for ti-pvu iommu unit
To: Nikhil Devshatwar <nikhil.nd@ti.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <6b791978-ca65-6aa2-2722-817c8cf8bde5@siemens.com>
Date: Mon, 13 Jan 2020 14:37:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Add support for Texas Instrument's Peripheral Virtualization Unit
* Define a new IOMMU type and extra fields in the platform_data
* Add new cofig option CONFIG_IOMMU_TI_PVU
* Integrate with the arm iommu support such that multiple types
  of IOMMU can be supported.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: moved into arm64 completely, fixed whitespace warnings, fixed includes]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Resending the fixed-up version as there were too many changes. Please 
validate. Is in next as well.

Depends on the iommu split-up patch I sent before.

 hypervisor/arch/arm-common/include/asm/cell.h |   7 +
 hypervisor/arch/arm64/Kbuild                  |   2 +-
 hypervisor/arch/arm64/include/asm/ti-pvu.h    | 130 ++++++
 hypervisor/arch/arm64/iommu.c                 |   6 +-
 hypervisor/arch/arm64/ti-pvu.c                | 577 ++++++++++++++++++++++++++
 include/jailhouse/cell-config.h               |   6 +
 6 files changed, 725 insertions(+), 3 deletions(-)
 create mode 100644 hypervisor/arch/arm64/include/asm/ti-pvu.h
 create mode 100644 hypervisor/arch/arm64/ti-pvu.c

diff --git a/hypervisor/arch/arm-common/include/asm/cell.h b/hypervisor/arch/arm-common/include/asm/cell.h
index 5b1e4207..9c6e8c6f 100644
--- a/hypervisor/arch/arm-common/include/asm/cell.h
+++ b/hypervisor/arch/arm-common/include/asm/cell.h
@@ -15,10 +15,17 @@
 
 #include <jailhouse/paging.h>
 
+struct pvu_tlb_entry;
+
 struct arch_cell {
 	struct paging_structures mm;
 
 	u32 irq_bitmap[1024/32];
+
+	struct {
+		u8 ent_count;
+		struct pvu_tlb_entry *entries;
+	} iommu_pvu; /**< ARM PVU specific fields. */
 };
 
 #endif /* !_JAILHOUSE_ASM_CELL_H */
diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index aa018ae7..c34b0f32 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -21,4 +21,4 @@ always := lib.a
 
 lib-y := $(common-objs-y)
 lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
-lib-y += iommu.o smmu-v3.o
+lib-y += iommu.o smmu-v3.o ti-pvu.o
diff --git a/hypervisor/arch/arm64/include/asm/ti-pvu.h b/hypervisor/arch/arm64/include/asm/ti-pvu.h
new file mode 100644
index 00000000..2c340b3a
--- /dev/null
+++ b/hypervisor/arch/arm64/include/asm/ti-pvu.h
@@ -0,0 +1,130 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * TI PVU IOMMU unit API headers
+ *
+ * Authors:
+ *  Nikhil Devshatwar <nikhil.nd@ti.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef _IOMMMU_PVU_H_
+#define _IOMMMU_PVU_H_
+
+#include <jailhouse/cell.h>
+#include <jailhouse/cell-config.h>
+
+#define PVU_NUM_TLBS			64
+#define PVU_NUM_ENTRIES			8
+
+#define PVU_CONFIG_NTLB_MASK		(0xff)
+#define PVU_CONFIG_NENT_MASK		(0xf << 16)
+
+#define PVU_MAX_VIRTID_MASK		(0xfff)
+
+#define PVU_ENABLE_DIS			(0x0)
+#define PVU_ENABLE_EN			(0x1)
+#define PVU_ENABLE_MASK			(0x1)
+
+struct pvu_hw_cfg {
+	u32		pid;
+	u32		config;
+	u8		resv_16[8];
+	u32		enable;
+	u32		virtid_map1;
+	u32		virtid_map2;
+	u8		resv_48[20];
+	u32		exception_logging_disable;
+	u8		resv_260[208];
+	u32		destination_id;
+	u8		resv_288[24];
+	u32		exception_logging_control;
+	u32		exception_logging_header0;
+	u32		exception_logging_header1;
+	u32		exception_logging_data0;
+	u32		exception_logging_data1;
+	u32		exception_logging_data2;
+	u32		exception_logging_data3;
+	u8		resv_320[4];
+	u32		exception_pend_set;
+	u32		exception_pend_clear;
+	u32		exception_ENABLE_set;
+	u32		exception_ENABLE_clear;
+	u32		eoi_reg;
+};
+
+#define PVU_TLB_ENTRY_VALID		(2)
+#define PVU_TLB_ENTRY_INVALID		(0)
+#define PVU_TLB_ENTRY_MODE_MASK		(0x3 << 30)
+#define PVU_TLB_ENTRY_FLAG_MASK		(0xff7f)
+#define PVU_TLB_ENTRY_PGSIZE_MASK	(0xf << 16)
+
+#define PVU_ENTRY_INVALID		(0 << 30)
+#define PVU_ENTRY_VALID			(2 << 30)
+
+#define LPAE_PAGE_PERM_UR		(1 << 15)
+#define LPAE_PAGE_PERM_UW		(1 << 14)
+#define LPAE_PAGE_PERM_UX		(1 << 13)
+#define LPAE_PAGE_PERM_SR		(1 << 12)
+#define LPAE_PAGE_PERM_SW		(1 << 11)
+#define LPAE_PAGE_PERM_SX		(1 << 10)
+
+#define LPAE_PAGE_MEM_WRITETHROUGH	(2 << 8)
+#define LPAE_PAGE_OUTER_SHARABLE	(1 << 4)
+#define LPAE_PAGE_IS_NOALLOC		(0 << 2)
+#define LPAE_PAGE_OS_NOALLOC		(0 << 0)
+
+struct pvu_hw_tlb_entry {
+	u32		reg0;
+	u32		reg1;
+	u32		reg2;
+	u32		reg3;
+	u32		reg4;
+	u32		reg5;
+	u32		reg6;
+	u32		reg7;
+};
+
+#define PVU_TLB_EN_MASK			(1 << 31)
+#define PVU_TLB_LOG_DIS_MASK		(1 << 30)
+#define PVU_TLB_FAULT_MASK		(1 << 29)
+#define PVU_TLB_CHAIN_MASK		(0xfff)
+
+struct pvu_hw_tlb {
+	u32			chain;
+	u8			resv_32[28];
+	struct pvu_hw_tlb_entry	entry[8];
+	u8			resv_4096[3808];
+};
+
+struct pvu_tlb_entry {
+	u64		virt_addr;
+	u64		phys_addr;
+	u64		size;
+	u64		flags;
+};
+
+struct pvu_dev {
+	u32		*cfg_base;
+	u32		*tlb_base;
+
+	u32		num_tlbs;
+	u32		num_entries;
+	u16		max_virtid;
+
+	u16		tlb_data[PVU_NUM_TLBS];
+};
+
+int pvu_iommu_map_memory(struct cell *cell,
+		const struct jailhouse_memory *mem);
+
+int pvu_iommu_unmap_memory(struct cell *cell,
+		const struct jailhouse_memory *mem);
+
+int pvu_iommu_config_commit(struct cell *cell);
+
+#endif /* _IOMMMU_PVU_H_ */
diff --git a/hypervisor/arch/arm64/iommu.c b/hypervisor/arch/arm64/iommu.c
index b3100d03..b3ab51b4 100644
--- a/hypervisor/arch/arm64/iommu.c
+++ b/hypervisor/arch/arm64/iommu.c
@@ -12,6 +12,7 @@
 
 #include <jailhouse/control.h>
 #include <asm/iommu.h>
+#include <asm/ti-pvu.h>
 
 unsigned int iommu_count_units(void)
 {
@@ -26,15 +27,16 @@ unsigned int iommu_count_units(void)
 int iommu_map_memory_region(struct cell *cell,
 			    const struct jailhouse_memory *mem)
 {
-	return 0;
+	return pvu_iommu_map_memory(cell, mem);
 }
 
 int iommu_unmap_memory_region(struct cell *cell,
 			      const struct jailhouse_memory *mem)
 {
-	return 0;
+	return pvu_iommu_unmap_memory(cell, mem);
 }
 
 void iommu_config_commit(struct cell *cell)
 {
+	pvu_iommu_config_commit(cell);
 }
diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
new file mode 100644
index 00000000..39dff875
--- /dev/null
+++ b/hypervisor/arch/arm64/ti-pvu.c
@@ -0,0 +1,577 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * TI PVU IOMMU unit
+ *
+ * Peripheral Virtualization Unit(PVU) is an IOMMU (memory management
+ * unit for DMA) which is designed for 2nd stage address translation in a
+ * real time manner.
+ *
+ * Unlike ARM-SMMU, all the memory mapping information is stored in the
+ * local registers instead of the in-memory page tables.
+ *
+ * There are limitations on the number of available contexts, page sizes,
+ * number of pages that can be mapped, etc.
+ *
+ * PVU is desgined to be programmed with all the memory mapping at once.
+ * Therefore, it defers the actual register programming till config_commit.
+ * Also, it does not support unmapping of the pages at runtime.
+ *
+ * Authors:
+ *  Nikhil Devshatwar <nikhil.nd@ti.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/control.h>
+#include <jailhouse/printk.h>
+#include <jailhouse/unit.h>
+#include <asm/iommu.h>
+#include <asm/ti-pvu.h>
+
+#define MAX_PVU_ENTRIES		(PAGE_SIZE / sizeof (struct pvu_tlb_entry))
+#define MAX_VIRTID		7
+
+static struct pvu_dev pvu_units[JAILHOUSE_MAX_IOMMU_UNITS];
+static unsigned int pvu_count;
+
+static const u64 pvu_page_size_bytes[] = {
+	4 * 1024,
+	16 * 1024,
+	64 * 1024,
+	2 * 1024 * 1024,
+	32 * 1024 * 1024,
+	512 * 1024 * 1024,
+	1 * 1024 * 1024 * 1024,
+	16ULL * 1024 * 1024 * 1024,
+};
+
+static inline u32 is_aligned(u64 addr, u64 size)
+{
+	return (addr % size) == 0;
+}
+
+static void pvu_tlb_enable(struct pvu_dev *dev, u16 tlbnum)
+{
+	struct pvu_hw_tlb *tlb;
+
+	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
+	mmio_write32_field(&tlb->chain, PVU_TLB_LOG_DIS_MASK, 0);
+	mmio_write32_field(&tlb->chain, PVU_TLB_EN_MASK, 1);
+}
+
+static void pvu_tlb_disable(struct pvu_dev *dev, u16 tlbnum)
+{
+	struct pvu_hw_tlb *tlb;
+
+	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
+	mmio_write32_field(&tlb->chain, PVU_TLB_EN_MASK, 0);
+	mmio_write32_field(&tlb->chain, PVU_TLB_LOG_DIS_MASK, 1);
+}
+
+static u32 pvu_tlb_is_enabled(struct pvu_dev *dev, u16 tlbnum)
+{
+	struct pvu_hw_tlb *tlb;
+
+	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
+	if (mmio_read32_field(&tlb->chain, PVU_TLB_EN_MASK))
+		return 1;
+	else
+		return 0;
+}
+
+static int pvu_tlb_chain(struct pvu_dev *dev, u16 tlbnum, u16 tlb_next)
+{
+	struct pvu_hw_tlb *tlb;
+
+	if (tlb_next <= tlbnum || tlb_next <= dev->max_virtid)
+		return -EINVAL;
+
+	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
+	mmio_write32_field(&tlb->chain, PVU_TLB_CHAIN_MASK, tlb_next);
+	return 0;
+}
+
+static u32 pvu_tlb_next(struct pvu_dev *dev, u16 tlbnum)
+{
+	struct pvu_hw_tlb *tlb;
+
+	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
+	return mmio_read32_field(&tlb->chain, PVU_TLB_CHAIN_MASK);
+}
+
+static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
+{
+	unsigned int i;
+
+	for (i = dev->max_virtid + 1; i < dev->num_tlbs; i++) {
+		if (dev->tlb_data[i] == 0) {
+			dev->tlb_data[i] = virtid << dev->num_entries;
+			return i;
+		}
+	}
+	return 0;
+}
+
+static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
+{
+	struct pvu_hw_tlb_entry *entry;
+	struct pvu_hw_tlb *tlb;
+	u32 i;
+
+	pvu_tlb_disable(dev, tlbnum);
+	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
+
+	for (i = 0; i < dev->num_entries; i++) {
+
+		entry = &tlb->entry[i];
+		mmio_write32(&entry->reg0, 0x0);
+		mmio_write32(&entry->reg1, 0x0);
+		mmio_write32(&entry->reg2, 0x0);
+		mmio_write32(&entry->reg4, 0x0);
+		mmio_write32(&entry->reg5, 0x0);
+		mmio_write32(&entry->reg6, 0x0);
+	}
+
+	mmio_write32(&tlb->chain, 0x0);
+
+	if (i < dev->max_virtid)
+		dev->tlb_data[tlbnum] = 0x0 | i << dev->num_entries;
+	else
+		dev->tlb_data[tlbnum] = 0x0;
+
+}
+
+static void pvu_entry_enable(struct pvu_dev *dev, u16 tlbnum, u8 index)
+{
+	struct pvu_hw_tlb_entry *entry;
+	struct pvu_hw_tlb *tlb;
+
+	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
+	entry = &tlb->entry[index];
+
+	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_MODE_MASK,
+		PVU_TLB_ENTRY_VALID);
+
+	dev->tlb_data[tlbnum] |= (1 << index);
+}
+
+static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
+			   struct pvu_tlb_entry *ent)
+{
+	struct pvu_hw_tlb_entry *entry;
+	struct pvu_hw_tlb *tlb;
+	u8 pgsz;
+
+	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
+	entry = &tlb->entry[index];
+
+	for (pgsz = 0; pgsz < ARRAY_SIZE(pvu_page_size_bytes); pgsz++) {
+		if (ent->size == pvu_page_size_bytes[pgsz])
+			break;
+	}
+
+	if (pgsz >= ARRAY_SIZE(pvu_page_size_bytes)) {
+		printk("ERROR: PVU: %s: Unsupported page size %llx\n",
+			__func__, ent->size);
+		return -EINVAL;
+	}
+
+	if (!is_aligned(ent->virt_addr, ent->size) ||
+	    !is_aligned(ent->phys_addr, ent->size)) {
+		printk("ERROR: PVU: %s: Address %llx => %llx is not aligned with size %llx\n",
+			__func__, ent->virt_addr, ent->phys_addr, ent->size);
+		return -EINVAL;
+	}
+
+	mmio_write32(&entry->reg0, ent->virt_addr & 0xffffffff);
+	mmio_write32_field(&entry->reg1, 0xffff, (ent->virt_addr >> 32));
+	mmio_write32(&entry->reg2, 0x0);
+
+	mmio_write32(&entry->reg4, ent->phys_addr & 0xffffffff);
+	mmio_write32_field(&entry->reg5, 0xffff, (ent->phys_addr >> 32));
+	mmio_write32(&entry->reg6, 0x0);
+
+	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_PGSIZE_MASK, pgsz);
+	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_FLAG_MASK, ent->flags);
+
+	/* Do we need "DSB NSH" here to make sure all writes are finised? */
+	pvu_entry_enable(dev, tlbnum, index);
+	return 0;
+}
+
+static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
+{
+	struct pvu_hw_cfg *cfg;
+	unsigned int i;
+
+	cfg = (struct pvu_hw_cfg *)dev->cfg_base;
+
+	dev->num_tlbs = mmio_read32_field(&cfg->config, PVU_CONFIG_NTLB_MASK);
+	dev->num_entries =
+		mmio_read32_field(&cfg->config, PVU_CONFIG_NENT_MASK);
+
+	if (max_virtid >= dev->num_tlbs) {
+		printk("ERROR: PVU: Max virtid(%d) should be less than num_tlbs(%d)\n",
+			max_virtid, dev->num_tlbs);
+		return -EINVAL;
+	}
+
+	dev->max_virtid = max_virtid;
+	mmio_write32(&cfg->virtid_map1, 0);
+	mmio_write32_field(&cfg->virtid_map2, PVU_MAX_VIRTID_MASK, max_virtid);
+
+	for (i = 0; i < dev->num_tlbs; i++) {
+
+		pvu_tlb_disable(dev, i);
+		if (i < dev->max_virtid)
+			dev->tlb_data[i] = 0x0 | i << dev->num_entries;
+		else
+			dev->tlb_data[i] = 0x0;
+	}
+
+	/* Enable all types of exceptions */
+	mmio_write32(&cfg->exception_logging_disable, 0x0);
+	mmio_write32(&cfg->exception_logging_control, 0x0);
+	mmio_write32_field(&cfg->enable, PVU_ENABLE_MASK, PVU_ENABLE_EN);
+	return 0;
+}
+
+static void pvu_shutdown_device(struct pvu_dev *dev)
+{
+	struct pvu_hw_cfg *cfg;
+	unsigned int i;
+
+	cfg = (struct pvu_hw_cfg *)dev->cfg_base;
+
+	for (i = 0; i < dev->num_tlbs; i++) {
+		pvu_tlb_flush(dev, i);
+	}
+
+	mmio_write32_field(&cfg->enable, PVU_ENABLE_MASK, PVU_ENABLE_DIS);
+}
+
+/*
+ * Split a memory region into multiple pages, where page size is one of the PVU
+ * supported size and the start address is aligned to page size
+ */
+static int pvu_entrylist_create(u64 ipa, u64 pa, u64 map_size, u64 flags,
+				struct pvu_tlb_entry *entlist, u32 num_entries)
+{
+	u64 page_size, vaddr, paddr;
+	unsigned int count;
+	s64 size;
+	int idx;
+
+	vaddr = ipa;
+	paddr = pa;
+	size = map_size;
+	count  = 0;
+
+	while (size > 0) {
+
+		if (count == num_entries) {
+			printk("ERROR: PVU: Need more TLB entries for mapping %llx => %llx with size %llx\n",
+				ipa, pa, map_size);
+			return -EINVAL;
+		}
+
+		/* Try size from largest to smallest */
+		for (idx = ARRAY_SIZE(pvu_page_size_bytes) - 1; idx >= 0; idx--) {
+
+			page_size = pvu_page_size_bytes[idx];
+
+			if (is_aligned(vaddr, page_size) &&
+			    is_aligned(paddr, page_size) &&
+			    size >= page_size) {
+
+				entlist[count].virt_addr = vaddr;
+				entlist[count].phys_addr = paddr;
+				entlist[count].size = page_size;
+				entlist[count].flags = flags;
+
+				count++;
+				vaddr += page_size;
+				paddr += page_size;
+				size -= page_size;
+				break;
+			}
+		}
+
+		if (idx < 0) {
+			printk("ERROR: PVU: Addresses %llx %llx" \
+				"aren't aligned to any of the allowed page sizes\n",
+				vaddr, paddr);
+			return -EINVAL;
+		}
+	}
+	return count;
+}
+
+static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
+{
+	struct pvu_tlb_entry temp;
+	unsigned int i, j;
+
+	for (i = 0; i < num_entries; i++) {
+		for (j = i; j < num_entries; j++) {
+
+			if (entlist[i].size < entlist[j].size) {
+				temp = entlist[i];
+				entlist[i] = entlist[j];
+				entlist[j] = temp;
+			}
+		}
+	}
+}
+
+static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
+{
+	unsigned int inst, i, tlbnum, idx, ent_count;
+	struct pvu_tlb_entry *ent, *cell_entries;
+	struct pvu_dev *dev;
+	int ret, tlb_next;
+
+	cell_entries = cell->arch.iommu_pvu.entries;
+	ent_count = cell->arch.iommu_pvu.ent_count;
+	if (ent_count == 0 || cell_entries == NULL)
+		return 0;
+
+	/* Program same memory mapping for all of the instances */
+	for (inst = 0; inst < pvu_count; inst++) {
+
+		dev = &pvu_units[inst];
+		if (pvu_tlb_is_enabled(dev, virtid))
+			continue;
+
+		tlbnum = virtid;
+		for (i = 0; i < ent_count; i++) {
+
+			ent = &cell_entries[i];
+			idx = i % dev->num_entries;
+
+			if (idx == 0 && i >= dev->num_entries) {
+				/* Find next available TLB and chain to it */
+				tlb_next = pvu_tlb_alloc(dev, virtid);
+				if (tlb_next < 0)
+					return -ENOMEM;
+				pvu_tlb_chain(dev, tlbnum, tlb_next);
+				pvu_tlb_enable(dev, tlbnum);
+				tlbnum = tlb_next;
+			}
+
+			ret = pvu_entry_write(dev, tlbnum, idx, ent);
+			if (ret)
+				return ret;
+		}
+		pvu_tlb_enable(dev, tlbnum);
+	}
+	return 0;
+}
+
+/*
+ * Actual TLB entry programming is deferred till config_commit
+ * Only populate the pvu_entries array for now
+ */
+int pvu_iommu_map_memory(struct cell *cell,
+			 const struct jailhouse_memory *mem)
+{
+	struct pvu_tlb_entry *ent;
+	unsigned int size;
+	u32 flags = 0;
+	int ret;
+
+	if (pvu_count == 0 || (mem->flags & JAILHOUSE_MEM_DMA) == 0)
+		return 0;
+
+	if (cell->arch.iommu_pvu.ent_count == MAX_PVU_ENTRIES)
+		return -ENOMEM;
+
+	if (mem->flags & JAILHOUSE_MEM_READ)
+		flags |= (LPAE_PAGE_PERM_UR | LPAE_PAGE_PERM_SR);
+	if (mem->flags & JAILHOUSE_MEM_WRITE)
+		flags |= (LPAE_PAGE_PERM_UW | LPAE_PAGE_PERM_SW);
+	if (mem->flags & JAILHOUSE_MEM_EXECUTE)
+		flags |= (LPAE_PAGE_PERM_UX | LPAE_PAGE_PERM_SX);
+
+	flags |= (LPAE_PAGE_MEM_WRITETHROUGH | LPAE_PAGE_OUTER_SHARABLE |
+		  LPAE_PAGE_IS_NOALLOC | LPAE_PAGE_OS_NOALLOC);
+
+	ent = &cell->arch.iommu_pvu.entries[cell->arch.iommu_pvu.ent_count];
+	size = MAX_PVU_ENTRIES - cell->arch.iommu_pvu.ent_count;
+
+	ret = pvu_entrylist_create(mem->virt_start, mem->phys_start, mem->size,
+				   flags, ent, size);
+	if (ret < 0)
+		return ret;
+
+	cell->arch.iommu_pvu.ent_count += ret;
+	return 0;
+}
+
+int pvu_iommu_unmap_memory(struct cell *cell,
+			   const struct jailhouse_memory *mem)
+{
+	u32 cell_state;
+
+	if (pvu_count == 0 || (mem->flags & JAILHOUSE_MEM_DMA) == 0)
+		return 0;
+
+	/*
+	 * PVU does not support dynamic unmapping of memory
+	 */
+
+	cell_state = cell->comm_page.comm_region.cell_state;
+
+	if (cell_state == JAILHOUSE_CELL_RUNNING ||
+	    cell_state == JAILHOUSE_CELL_RUNNING_LOCKED)
+		printk("WARNING: PVU cannot unmap memory at runtime for cell %s\n",
+			cell->config->name);
+
+	return 0;
+}
+
+int pvu_iommu_config_commit(struct cell *cell)
+{
+	unsigned int i, virtid;
+	int ret;
+
+	if (pvu_count == 0 || !cell)
+		return 0;
+
+	/*
+	 * Chaining the TLB entries adds extra latency to translate those
+	 * addresses.
+	 * Sort the entries in descending order of page sizes to reduce effects
+	 * of chaining and thus reducing average translation latency
+	 */
+	pvu_entrylist_sort(cell->arch.iommu_pvu.entries,
+			   cell->arch.iommu_pvu.ent_count);
+
+	for_each_stream_id(virtid, cell->config, i) {
+		if (virtid > MAX_VIRTID)
+			continue;
+
+		ret = pvu_iommu_program_entries(cell, virtid);
+		if (ret)
+			return ret;
+	}
+
+	cell->arch.iommu_pvu.ent_count = 0;
+	return ret;
+}
+
+static int pvu_iommu_cell_init(struct cell *cell)
+{
+	unsigned int i, virtid;
+	struct pvu_dev *dev;
+
+	if (pvu_count == 0)
+		return 0;
+
+	cell->arch.iommu_pvu.ent_count = 0;
+	cell->arch.iommu_pvu.entries = page_alloc(&mem_pool, 1);
+	if (!cell->arch.iommu_pvu.entries)
+		return -ENOMEM;
+
+	dev = &pvu_units[0];
+	for_each_stream_id(virtid, cell->config, i) {
+
+		if (virtid > MAX_VIRTID)
+			continue;
+
+		if (pvu_tlb_is_enabled(dev, virtid))
+			return -EINVAL;
+	}
+	return 0;
+}
+
+static int pvu_iommu_flush_context(u16 virtid)
+{
+	unsigned int i, tlbnum, next;
+	struct pvu_dev *dev;
+
+	for (i = 0; i < pvu_count; i++) {
+
+		dev = &pvu_units[i];
+		tlbnum = virtid;
+
+		while (tlbnum) {
+
+			next = pvu_tlb_next(dev, tlbnum);
+			pvu_tlb_flush(dev, tlbnum);
+			tlbnum = next;
+		}
+	}
+	return 0;
+}
+
+static void pvu_iommu_cell_exit(struct cell *cell)
+{
+	unsigned int i, virtid;
+
+	if (pvu_count == 0)
+		return;
+
+	for_each_stream_id(virtid, cell->config, i) {
+
+		if (virtid > MAX_VIRTID)
+			continue;
+
+		pvu_iommu_flush_context(virtid);
+	}
+
+	cell->arch.iommu_pvu.ent_count = 0;
+	page_free(&mem_pool, cell->arch.iommu_pvu.entries, 1);
+	cell->arch.iommu_pvu.entries = NULL;
+}
+
+static int pvu_iommu_init(void)
+{
+	struct jailhouse_iommu *iommu;
+	struct pvu_dev *dev;
+	unsigned int i;
+	int ret;
+
+	iommu = &system_config->platform_info.arm.iommu_units[0];
+	for (i = 0; i < iommu_count_units(); iommu++, i++) {
+
+		if (iommu->type != JAILHOUSE_IOMMU_PVU)
+			continue;
+
+		dev = &pvu_units[pvu_count];
+		dev->cfg_base = paging_map_device(iommu->base,
+					iommu->size);
+		dev->tlb_base = paging_map_device(iommu->tipvu.tlb_base,
+					iommu->tipvu.tlb_size);
+
+		ret = pvu_init_device(dev, MAX_VIRTID);
+		if (ret)
+			return ret;
+
+		pvu_count++;
+	}
+
+	return pvu_iommu_cell_init(&root_cell);
+}
+
+static void pvu_iommu_shutdown(void)
+{
+	struct pvu_dev *dev;
+	unsigned int i;
+
+	pvu_iommu_cell_exit(&root_cell);
+
+	for (i = 0; i < pvu_count; i++) {
+
+		dev = &pvu_units[i];
+		pvu_shutdown_device(dev);
+	}
+
+}
+
+DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(pvu_iommu);
+DEFINE_UNIT(pvu_iommu, "PVU IOMMU");
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 68446853..b8e1f038 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -245,6 +245,7 @@ struct jailhouse_pci_capability {
 #define JAILHOUSE_IOMMU_AMD		1
 #define JAILHOUSE_IOMMU_INTEL		2
 #define JAILHOUSE_IOMMU_SMMUV3		3
+#define JAILHOUSE_IOMMU_PVU		4
 
 struct jailhouse_iommu {
 	__u32 type;
@@ -258,6 +259,11 @@ struct jailhouse_iommu {
 			__u8 msi_cap;
 			__u32 features;
 		} __attribute__((packed)) amd;
+
+		struct {
+			__u64 tlb_base;
+			__u32 tlb_size;
+		} __attribute__((packed)) tipvu;
 	};
 } __attribute__((packed));
 
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6b791978-ca65-6aa2-2722-817c8cf8bde5%40siemens.com.
