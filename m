Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBMPVU7YAKGQEP7XZFZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0E112D03F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 14:25:07 +0100 (CET)
Received: by mail-yb1-xb39.google.com with SMTP id 7sf24541863ybp.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 05:25:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577712306; cv=pass;
        d=google.com; s=arc-20160816;
        b=va0ftk+Uuv6jCyUI4JgJQTx2Un/KOyusuDx2m1rXZQC2Cir5gbemv4VvoV7OR2Amaa
         ntzIxu+a74UNCBZ7sBZ6w+rf7AcVIO2bsUzJfTKopprf/dcCTUR7kcbOA1+mSdC05Hgi
         C2mSaecX6gtjvDC4RdDg2AoNLug35sP6Y6Moi2y6MHPenGG2H8OBqMDfNr+71i+w6X7X
         T1h//WXH6xnDapXH7Lz5XJkn+Te4nZttlKTJIrkbqk+uFzeTzqRK87O9ExVt75//agIO
         HXIISpHyRUhWi/uiiOmNOx7pZnIN+ilAPBy/YynhN6WoGES1JMuePviA+jQlLH/szIVD
         t5sQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=a7IXPKFRJIR85TW1psVZQLwjtaeeFau/Lo5+VB1k2kg=;
        b=OXsp41/dS4OAnS1UTHFCtNT+NUXcWwZbV4xlRjILt9UckZfOL8kkIOeMDuCK+kudKx
         9J3abwyeDj1Y8MnfDwGsaJR/nDEBFSXua/kezguYKF9gpix5VFrxVa7L9u39YqaAl+tP
         awOaeZUUCx21NRd3FSovkCqA4EY9oqCITokCz+KBbfqrcT+wLRN9PW6AL38y9ajj8U+M
         WP8tqL0DSiQJ3JC8zjn8DeWdU7K2s8TH/mEyjTWNIjfoGUOY0P8yi9MpTzoHh8kh5E7M
         tBXX4Y34/DKdQDnKmpLaMPymmOG7ilOeKocBviXdzCXz0Of3wDfi5MOa3kMVejovC0r5
         1GTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CUu68msQ;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=a7IXPKFRJIR85TW1psVZQLwjtaeeFau/Lo5+VB1k2kg=;
        b=jMM9cHDCXPBZ7zKkKSJ2VOWShT91pgU7IW8wjgNEuYrBdTjBpdFUcQgChBsgl70Y61
         /YSvVwW81PJGIa8si/E47NN9SWuZaY1WLkU/8rTDvLiAbwbgPOIeruM7LcDgWpWegmRH
         G2ILnTu/Ng3YKcis8r2XcJt0fpFyx2qOcxoCxeIE3xDvmjqlpQK3BHiKwE8Rn5Cw8pW9
         uB/w0aa+go2ipJZUyb8oKWAwXgVJ56GVJ16qTISj9/gW7W4nNPYBMNY1wOfU1eMrkKS+
         jUG4/jcvXTn4767MZkhXSoogARs/4FfjWuQp+EU6q4EC4B2YmQbrawiUzZDHika53ALU
         OQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a7IXPKFRJIR85TW1psVZQLwjtaeeFau/Lo5+VB1k2kg=;
        b=AaHKA7YPECZm0E8CMM5xuIxxkFKDKkFxm3JGSr+8KZRB4nid4tL+prNRwyqXmFDf+T
         C8EYzqOGMjdqi5kxUXEyB18cj42ed61nVxmq2PwTdmKs0WnpKRS5CFwpnkITPF8T3BxW
         0CSnVIdQPwvvTwD9s1e2+qZICuiwn7lPeuoAFy8hD/Uso0A8M7iwFTK3MBqn+Cb4M5IU
         JqQydN3kkNbuSUJ84ueObqPk+23PeiZAhDnJSg2qpB0imJjdUDCH3+yIYl8tyFuoe1v+
         S8JVfvTA42xl/5rd/+Jkq90Rl3ZwT2yNDFaET1Vz+cBewx8ZGGBjS/SQU8G45DhUlqzf
         bXHQ==
X-Gm-Message-State: APjAAAW1cjkdVz4LYM9uJwRrrkLrPA57PHRYI1p6fz0tdxZFWfEP1f5c
	hWk2/Sxi3H3ecgeKSOXhgeE=
X-Google-Smtp-Source: APXvYqzW96l9TnsYfGXd8N1kBmnPGV6O5nbJSDkMOi+6pLshstCSnJ73dUAlg4T/ZgyL4GYUPZGHoA==
X-Received: by 2002:a81:1d09:: with SMTP id d9mr48238843ywd.146.1577712306008;
        Mon, 30 Dec 2019 05:25:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:aad0:: with SMTP id t74ls3028455ybi.12.gmail; Mon, 30
 Dec 2019 05:25:05 -0800 (PST)
X-Received: by 2002:a25:bf91:: with SMTP id l17mr50468111ybk.417.1577712305340;
        Mon, 30 Dec 2019 05:25:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577712305; cv=none;
        d=google.com; s=arc-20160816;
        b=KblvjHghIJTo76jtZ0PQ33PrmQ08ZN6yx/gAdMINMI/FMDTw2EYoYrFk6TK6WbozXj
         /dzqMn5xlk5wimJZ3N19hwZSqgnsx7wPZvJR4kZCJmV7wFpfRM5fo6Ivors2WCi1L41D
         y+l0EUj/LRMk93evuINPDms4IJD33B9IUXeSkCkKvnmoyHpsGlMDdosnRnNc7kG1Pnrm
         z1w0/U4FSm15707Y9shnhUWGWTxrvepBiNhZXj5oQ4TFWMcrrFUfupjnEQBZUXDJB1lA
         +psJSj8QcO4Vx2Lc6AKeCtxoXM2F7NM+Pq7aw5EytlFl44kUu06qBZyp1z9x//OTV37h
         hTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TUEK4GsQIz37ufS54BiNANcU/Gp8KKj9CR5MVzBO5YQ=;
        b=FWDTrh2QBtHezhVlEZr+sixtAXjtRDVEuho/KUEkk8YpDwAezOP/u6z+3CF9dLibvF
         0p/wSpWJimTRdiiTqyFCsXBZDOnwaGNd5HSZR3JNONFIjURPuvZFid16Hio9EAFWk3Pm
         HShsnm/tkLTesMUAVvvVAE7o6QBSqb9z8n8S1ze0qIw5HF4US6txlZZJ4oXnJb4gj09o
         44pstZk/4rVvOtrSRzjU+//9JVKCjGpTP3AR8sqBy4Y4Esv10jlXPoAhktaU03xw23PK
         qYXqP5SvU9NN2bESrXXc7bRrZw7f7tFBIescJMit2fxBol4s3b/Dmlt08V1F0JouTXL6
         HfgA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CUu68msQ;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id j7si1459753ywc.2.2019.12.30.05.25.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Dec 2019 05:25:05 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBUDP4W5085987;
	Mon, 30 Dec 2019 07:25:04 -0600
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBUDP4Yt002699
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 30 Dec 2019 07:25:04 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Dec 2019 07:25:04 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Dec 2019 07:25:04 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBUDP0oa120516;
	Mon, 30 Dec 2019 07:25:03 -0600
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>, <jan.kiszka@siemens.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>
Subject: [PATCH v1 1/4] arm64: ti-pvu: Add support for ti-pvu iommu unit
Date: Mon, 30 Dec 2019 18:54:03 +0530
Message-ID: <20191230132406.19985-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230132406.19985-1-nikhil.nd@ti.com>
References: <20191230132406.19985-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=CUu68msQ;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
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

Add support for Texas Instrument's Peripheral Virtualization Unit
* Define a new IOMMU type and extra fields in the platform_data
* Add new cofig option CONFIG_IOMMU_TI_PVU
* Integrate with the arm iommu support such that multiple types
  of IOMMU can be supported.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 hypervisor/arch/arm-common/include/asm/cell.h |   7 +
 .../arch/arm-common/include/asm/iommu.h       |   1 +
 .../arch/arm-common/include/asm/ti-pvu.h      |  32 +
 hypervisor/arch/arm-common/iommu.c            |   9 +
 hypervisor/arch/arm64/Kbuild                  |   1 +
 hypervisor/arch/arm64/ti-pvu.c                | 556 ++++++++++++++++++
 hypervisor/arch/arm64/ti-pvu_priv.h           | 141 +++++
 include/jailhouse/cell-config.h               |   4 +
 8 files changed, 751 insertions(+)
 create mode 100644 hypervisor/arch/arm-common/include/asm/ti-pvu.h
 create mode 100644 hypervisor/arch/arm64/ti-pvu.c
 create mode 100644 hypervisor/arch/arm64/ti-pvu_priv.h

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
diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h b/hypervisor/arch/arm-common/include/asm/iommu.h
index dde762c0..399248dc 100644
--- a/hypervisor/arch/arm-common/include/asm/iommu.h
+++ b/hypervisor/arch/arm-common/include/asm/iommu.h
@@ -16,6 +16,7 @@
 #include <jailhouse/cell.h>
 #include <jailhouse/utils.h>
 #include <jailhouse/cell-config.h>
+#include <asm/ti-pvu.h>
 
 #define for_each_stream_id(sid, config, counter)			       \
 	for ((sid) = (jailhouse_cell_stream_ids(config)[0]), (counter) = 0;    \
diff --git a/hypervisor/arch/arm-common/include/asm/ti-pvu.h b/hypervisor/arch/arm-common/include/asm/ti-pvu.h
new file mode 100644
index 00000000..a3ef72f7
--- /dev/null
+++ b/hypervisor/arch/arm-common/include/asm/ti-pvu.h
@@ -0,0 +1,32 @@
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
+#include <jailhouse/config.h>
+
+#ifdef CONFIG_IOMMU_TI_PVU
+
+int pvu_iommu_map_memory(struct cell *cell,
+		const struct jailhouse_memory *mem);
+
+int pvu_iommu_unmap_memory(struct cell *cell,
+		const struct jailhouse_memory *mem);
+
+int pvu_iommu_config_commit(struct cell *cell);
+
+#endif /* CONFIG_IOMMU_TI_PVU */
+
+#endif /* _IOMMMU_PVU_H_ */
diff --git a/hypervisor/arch/arm-common/iommu.c b/hypervisor/arch/arm-common/iommu.c
index b3100d03..b6b61f52 100644
--- a/hypervisor/arch/arm-common/iommu.c
+++ b/hypervisor/arch/arm-common/iommu.c
@@ -26,15 +26,24 @@ unsigned int iommu_count_units(void)
 int iommu_map_memory_region(struct cell *cell,
 			    const struct jailhouse_memory *mem)
 {
+#ifdef CONFIG_IOMMU_TI_PVU
+	return pvu_iommu_map_memory(cell, mem);
+#endif
 	return 0;
 }
 
 int iommu_unmap_memory_region(struct cell *cell,
 			      const struct jailhouse_memory *mem)
 {
+#ifdef CONFIG_IOMMU_TI_PVU
+	return pvu_iommu_unmap_memory(cell, mem);
+#endif
 	return 0;
 }
 
 void iommu_config_commit(struct cell *cell)
 {
+#ifdef CONFIG_IOMMU_TI_PVU
+	pvu_iommu_config_commit(cell);
+#endif
 }
diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index 323b78b6..8012c46e 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -21,3 +21,4 @@ always := lib.a
 
 lib-y := $(common-objs-y)
 lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o smmu-v3.o
+lib-$(CONFIG_IOMMU_TI_PVU) += ti-pvu.o
diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
new file mode 100644
index 00000000..02380baa
--- /dev/null
+++ b/hypervisor/arch/arm64/ti-pvu.c
@@ -0,0 +1,556 @@
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
+#include <jailhouse/unit.h>
+#include <jailhouse/cell.h>
+#include <jailhouse/entry.h>
+#include <jailhouse/paging.h>
+#include <jailhouse/control.h>
+#include <jailhouse/printk.h>
+#include <asm/iommu.h>
+#include <asm/ti-pvu.h>
+#include "ti-pvu_priv.h"
+
+#define MAX_PVU_ENTRIES		(PAGE_SIZE / sizeof (struct pvu_tlb_entry))
+#define MAX_VIRTID		  7
+
+static struct pvu_dev pvu_units[JAILHOUSE_MAX_IOMMU_UNITS];
+static unsigned int pvu_count;
+
+static const u64 PVU_PAGE_SIZE_BYTES[] = {
+	[LPAE_PAGE_SZ_4K]		=   4 * 1024,
+	[LPAE_PAGE_SZ_16K]		=  16 * 1024,
+	[LPAE_PAGE_SZ_64K]		=  64 * 1024,
+	[LPAE_PAGE_SZ_2M]		=   2 * 1024 * 1024,
+	[LPAE_PAGE_SZ_32M]		=  32 * 1024 * 1024,
+	[LPAE_PAGE_SZ_512M]		= 512 * 1024 * 1024,
+	[LPAE_PAGE_SZ_1G]		=   1 * 1024 * 1024 * 1024,
+	[LPAE_PAGE_SZ_16G]		=  16ULL * 1024 * 1024 * 1024,
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
+	int i;
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
+	pvu_tlb_disable(dev, tlbnum);
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
+	struct pvu_tlb_entry *ent)
+{
+	struct pvu_hw_tlb_entry *entry;
+	struct pvu_hw_tlb *tlb;
+	u8 pgsz;
+
+	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
+	entry = &tlb->entry[index];
+
+	for (pgsz = 0; pgsz < ARRAY_SIZE(PVU_PAGE_SIZE_BYTES); pgsz++) {
+		if (ent->size == PVU_PAGE_SIZE_BYTES[pgsz])
+			break;
+	}
+
+	if (pgsz >= ARRAY_SIZE(PVU_PAGE_SIZE_BYTES)) {
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
+	int i;
+
+	cfg = (struct pvu_hw_cfg *)dev->cfg_base;
+
+	dev->num_tlbs = mmio_read32_field(&cfg->config,
+			PVU_CONFIG_NTLB_MASK);
+	dev->num_entries = mmio_read32_field(&cfg->config,
+			PVU_CONFIG_NENT_MASK);
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
+	mmio_write32_field(&cfg->enable, PVU_enable_MASK, PVU_enable_EN);
+	return 0;
+}
+
+
+
+/*
+ * Split a memory region into multiple pages, where page size is one of the PVU
+ * supported size and the start address is aligned to page size
+ */
+static int pvu_entrylist_create(u64 ipa, u64 pa, u64 map_size,
+	u64 flags, struct pvu_tlb_entry *entlist, u32 num_entries)
+{
+	u8 num_sizes = ARRAY_SIZE(PVU_PAGE_SIZE_BYTES);
+	u64 page_size, vaddr, paddr;
+	s64 size, i, aligned, count;
+
+	vaddr = ipa;
+	paddr = pa;
+	size = map_size;
+	count  = 0;
+
+	while (size) {
+
+		if (count == num_entries) {
+			printk("ERROR: PVU: Need more TLB entries for mapping %llx => %llx with size %llx\n",
+				ipa, pa, map_size);
+			return -EINVAL;
+		}
+
+		aligned = 0;
+
+		/* Try size from largest to smallest */
+		for (i = num_sizes - 1; i >= 0; i--) {
+
+			page_size = PVU_PAGE_SIZE_BYTES[i];
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
+				aligned = 1;
+				break;
+			}
+		}
+
+		if (!aligned) {
+			printk("ERROR: PVU: Addresses %llx %llx aren't aligned to any of the allowed page sizes\n",
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
+	int i, j;
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
+	int i, ret, tlb_next, tlbnum, idx, num_ent;
+	struct pvu_tlb_entry *ent, *cell_entries;
+	struct pvu_dev *dev;
+	u32 inst;
+
+	cell_entries = cell->arch.iommu_pvu.entries;
+	num_ent = cell->arch.iommu_pvu.ent_count;
+	if (num_ent == 0 || cell_entries == NULL)
+		return 0;
+
+	/* Program same memory mapping for all of the instances */
+	for (inst = 0; inst < pvu_count; inst++) {
+		dev = &pvu_units[inst];
+		if (pvu_tlb_is_enabled(dev, virtid))
+			continue;
+
+		tlbnum = virtid;
+		for (i = 0; i < num_ent; i++) {
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
+		const struct jailhouse_memory *mem)
+{
+	struct pvu_tlb_entry *ent;
+	int size, ret;
+	u32 flags = 0;
+
+	if (pvu_count == 0)
+		return 0;
+
+	if ((mem->flags & JAILHOUSE_MEM_DMA) == 0)
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
+		LPAE_PAGE_IS_NOALLOC | LPAE_PAGE_OS_NOALLOC);
+
+	ent = &cell->arch.iommu_pvu.entries[cell->arch.iommu_pvu.ent_count];
+	size = MAX_PVU_ENTRIES - cell->arch.iommu_pvu.ent_count;
+
+	ret = pvu_entrylist_create(mem->virt_start, mem->phys_start, mem->size,
+			flags, ent, size);
+	if (ret < 0)
+		return ret;
+
+	cell->arch.iommu_pvu.ent_count += ret;
+	return 0;
+}
+
+int pvu_iommu_unmap_memory(struct cell *cell,
+		const struct jailhouse_memory *mem)
+{
+	/*
+	 * dummy unmap for now
+	 * PVU does not support dynamic unmap
+	 * Works well for static partitioning
+	 */
+	return 0;
+}
+
+int pvu_iommu_config_commit(struct cell *cell)
+{
+	int ret, i, virtid;
+
+	if (pvu_count == 0)
+		return 0;
+
+	if (!cell) {
+		return 0;
+	}
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
+		if (virtid == JAILHOUSE_INVALID_STREAMID)
+			break;
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
+	struct pvu_dev *dev;
+	int i, virtid;
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
+		if (virtid == JAILHOUSE_INVALID_STREAMID)
+			break;
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
+	struct pvu_dev *dev;
+	int i, tlbnum, next;
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
+	int i, virtid;
+
+	if (pvu_count == 0)
+		return;
+
+	for_each_stream_id(virtid, cell->config, i) {
+
+		if (virtid == JAILHOUSE_INVALID_STREAMID)
+			break;
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
+	int i, ret;
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
+		dev->tlb_base = paging_map_device(iommu->tipvu_tlb_base,
+					iommu->tipvu_tlb_size);
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
+DEFINE_UNIT_SHUTDOWN_STUB(pvu_iommu);
+DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(pvu_iommu);
+DEFINE_UNIT(pvu_iommu, "PVU IOMMU");
diff --git a/hypervisor/arch/arm64/ti-pvu_priv.h b/hypervisor/arch/arm64/ti-pvu_priv.h
new file mode 100644
index 00000000..acba338b
--- /dev/null
+++ b/hypervisor/arch/arm64/ti-pvu_priv.h
@@ -0,0 +1,141 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * TI PVU IOMMU unit private headers
+ *
+ * Authors:
+ *  Nikhil Devshatwar <nikhil.nd@ti.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef __TI_PVU_PRIV_H__
+#define __TI_PVU_PRIV_H__
+
+#define PVU_NUM_TLBS			64
+#define PVU_NUM_ENTRIES			8
+
+#define PVU_CONFIG_NTLB_MASK		(0xff)
+#define PVU_CONFIG_NENT_MASK		(0xf << 16)
+
+#define PVU_MAX_VIRTID_MASK		(0xfff)
+
+#define PVU_enable_EN			(0x1)
+#define PVU_enable_DIS			(0x0)
+#define PVU_enable_MASK			(0x1)
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
+#define LPAE_PAGE_SZ_4K			0
+#define LPAE_PAGE_SZ_16K		1
+#define LPAE_PAGE_SZ_64K		2
+#define LPAE_PAGE_SZ_2M			3
+#define LPAE_PAGE_SZ_32M		4
+#define LPAE_PAGE_SZ_512M		5
+#define LPAE_PAGE_SZ_1G			6
+#define LPAE_PAGE_SZ_16G		7
+
+#define LPAE_PAGE_PERM_UR		(1 << 15)
+#define LPAE_PAGE_PERM_UW		(1 << 14)
+#define LPAE_PAGE_PERM_UX		(1 << 13)
+#define LPAE_PAGE_PERM_SR		(1 << 12)
+#define LPAE_PAGE_PERM_SW		(1 << 11)
+#define LPAE_PAGE_PERM_SX		(1 << 10)
+
+#define LPAE_PAGE_MEM_DEVICE		(0 << 8)
+#define LPAE_PAGE_MEM_WRITEBACK		(1 << 8)
+#define LPAE_PAGE_MEM_WRITETHROUGH	(2 << 8)
+
+#define LPAE_PAGE_PREFETCH		(1 << 6)
+#define LPAE_PAGE_INNER_SHARABLE	(1 << 5)
+#define LPAE_PAGE_OUTER_SHARABLE	(1 << 4)
+
+#define LPAE_PAGE_IS_NOALLOC		(0 << 2)
+#define LPAE_PAGE_IS_WR_ALLOC		(1 << 2)
+#define LPAE_PAGE_IS_RD_ALLOC		(2 << 2)
+#define LPAE_PAGE_IS_RDWR_ALLOC		(3 << 2)
+
+#define LPAE_PAGE_OS_NOALLOC		(0 << 0)
+#define LPAE_PAGE_OS_WR_ALLOC		(1 << 0)
+#define LPAE_PAGE_OS_RD_ALLOC		(2 << 0)
+#define LPAE_PAGE_OS_RDWR_ALLOC		(3 << 0)
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
+#endif /* __TI_PVU_PRIV_H__ */
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index d435b9f7..9bb84492 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -203,6 +203,7 @@ struct jailhouse_pci_capability {
 #define JAILHOUSE_IOMMU_AMD		1
 #define JAILHOUSE_IOMMU_INTEL		2
 #define JAILHOUSE_IOMMU_SMMUV3		3
+#define JAILHOUSE_IOMMU_PVU		4
 
 struct jailhouse_iommu {
 	__u32 type;
@@ -213,6 +214,9 @@ struct jailhouse_iommu {
 	__u8 amd_base_cap;
 	__u8 amd_msi_cap;
 	__u32 amd_features;
+
+	__u64 tipvu_tlb_base;
+	__u32 tipvu_tlb_size;
 } __attribute__((packed));
 
 struct jailhouse_pio {
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191230132406.19985-2-nikhil.nd%40ti.com.
