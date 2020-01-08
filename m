Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBRXV23YAKGQEHGUEXQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53e.google.com (mail-pg1-x53e.google.com [IPv6:2607:f8b0:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC94134033
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Jan 2020 12:19:36 +0100 (CET)
Received: by mail-pg1-x53e.google.com with SMTP id l13sf1619097pgt.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Jan 2020 03:19:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578482374; cv=pass;
        d=google.com; s=arc-20160816;
        b=X9j9z4sZ/Gzilt5xl3XiD6f118j/e8Bktuz35NdTSxcl2fMLcWpn8ad9tmuny3VSQR
         V/oQkwfKWBYpUzJQq6fxrSKivvdawbUjl1oFNTZiZUSyTjd5GnkIZqOt+k7HyUTG58h3
         gIcVPRqJJz41zpgbhAieAl31BlUNR2EZMXbseTw1ge0iO6L3S7ZsOVD4bdx8IQweZ9z1
         YYaSEmeWSsYSEAU8FWBHWgjLYxQli+1jedE3EwvaNl1fvIFYW1ARM/qHaP6a8TYNVjDD
         27JzMNUTLJg17+2GsT8eEejXIyD9En79LGnZm2mZ8nu7GoJWFTtQmv1VJ4SPFiWFfeGt
         d55w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=XPpP1AVz+9NLG+IysVQoYNHQ+9k3FQT5n4v4J31fezA=;
        b=iz8ZCfwWkQgKyFMPJsM23TP3H2RS35rtUlK7OWeQd8VmyH9c5a0E/XeiKFzZZWlKhn
         cfw3l90cVkoBFNYy9evXlnl6lSILh+XwHqEKRXtq/6jtOgIPbYByLbIzwwgLhRN4i/93
         P68ttmyvykyFKvr5z1SKa0XfDgXTAYp5s8TVlOzG4OZpVwKonCWkCnE35ZepyumScFhr
         x6fF6q6UaW1T7fl2UekJerrnq/2DN3pSN1ZyjDqszhdAsdnlVJPcgfeo90VJ6H2Y0wu8
         rEeC6kS8Qh0lfGYry+YenfLPjnI3yiorNk++0wCsJvP87I9u3/qe0e5xZx8YUcBa6cyA
         ubiQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=v38VsMZL;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=XPpP1AVz+9NLG+IysVQoYNHQ+9k3FQT5n4v4J31fezA=;
        b=oYwwjSiFcMp9/Ey8xMb7W/Y2fEBXtjr4ZKFNzFmQC0WMHSa49icVXxjeocbBWrGIaj
         l4RvlqlAnRxljuKprobLrt+q0yAocRc7D/TFZ1HUTrr5YtP1NT7vxO33KTfAnpVvQuy9
         uTkdzhoEcE+sdkEspcY2NM7OQqi0SuRRDb01O/LbkT2FA1ksy8tVRLKF7rZD1b3BhUFU
         Fw0jy/SiBOZc9LZiOGgLnTd37pn0v5WLRDNVzhQHL/XqLFeAj8BeOXskVM4vz68r+U19
         nMa8rKQcPhSvHFKi4WekrCRiYy6BETTJI+XON7gFrUcfQj8w0ZMq1VM67hK2jafe0QzZ
         IPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XPpP1AVz+9NLG+IysVQoYNHQ+9k3FQT5n4v4J31fezA=;
        b=Y5PMgZszEZw0AF4/h40dY5OzyY2iC5svzP9g6gyae7/QB1pnVof83OkSS98g9lv/uH
         +V2LiRZ7YG35DX/xay391Tkz1qZUuiq3sHrDh7qnrXdz2fb+ibslnYl5/id6ZIy5rJ68
         Fl5B59Gj9Wlk2L62Bf2uzahUWBbXJSPIEqjd8pTqkT/XH9WkckCrhmsd3agM0KLi9Ryg
         BZy7572QE95s0GkzgtBCVGacruvHDe07ls8UHWt+k3mmbLbiTTogw3bPvnoSSdS2EunX
         moCS8O+oRdhZjfU4T3DmRO2aTuWXKtcqPtmtq1YhPeOLPoWz7QMlpMyOC1BI++O2nYzO
         4QgA==
X-Gm-Message-State: APjAAAUl3V+D2cXArjPLgMiIvbfeclVlc4ylRGhKCxnFnvIUbLvKeCer
	jfoEwXx2osCs19PHZpAYlj0=
X-Google-Smtp-Source: APXvYqz2HM0uB/g8AOb95WP/tpxPBXq+ThaceeyOh+vMAQ3FNrEWjekenttmJNBs+dLdEwJTeKSmyQ==
X-Received: by 2002:a65:4106:: with SMTP id w6mr4687898pgp.347.1578482374629;
        Wed, 08 Jan 2020 03:19:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:a602:: with SMTP id c2ls855276pjq.2.gmail; Wed, 08
 Jan 2020 03:19:34 -0800 (PST)
X-Received: by 2002:a17:902:aa41:: with SMTP id c1mr4710881plr.340.1578482373961;
        Wed, 08 Jan 2020 03:19:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578482373; cv=none;
        d=google.com; s=arc-20160816;
        b=cT8WvQZTAzWpNATaBNyhO/umo29k7O+aeInmaI6WKWgwRJWTh7SzM94Ku23VWuNGy3
         oHh+eotn8NVqCxt7q/6YCvBHZ4jdRkoznC/jtgYoLT85D9Mc4G0ZMtWG6I02G4aGj6ia
         Nj5GDcRWvjAr2uU/UBHaXFl3lFXrAhJ6abyGv5iv0f7A0M/2Hg8zZZlTbiEYaefjrMyK
         BNPQdU+IDPwXpGob45sNDMPPthsQU63KCBqg0LkkepPSZxzpByYEOtPejhQce2D6QuyO
         dlGkq++hBuuCK5empGVHKY/uQ7WKHpZf6lJicX/FsSNkfHAgeH8YwrChwejrZpNpnNkt
         ED2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rhbfVNT2vhWB0zzlomsbzZvYdUyMxAykJb/YU9P4lns=;
        b=LUjTRaAbsXa9Wedr3KBLpQo9uzsr+co6AVmRTy4SsqxwjvIp1EkHdxsmjsFRYPSNhd
         odyYdLn/p6B6vwJWcZEfhvtpCHObGnRg3BuneyZCbLStU7k7u1Gx/2vFLOLvuDEalAR6
         u3bSsa4+U1X+3GoGEf9fr0OkbbhGrR8SlohJOSlxevyKIhP53nM+wueEN+VKP+NAbCvR
         ropPPanzWZxBcjBR4KEzi6Q4WFtMEK9ZOMgGa6qepIFuQxxl+ouJ/0BRQbp2zWbKdycS
         r4Gw6obbVHipphLcVCVB7iPzlE2Zq3W3aP3sY5ffRBevMkfsaSMogiNEwUBv/LE02BNu
         zoFA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=v38VsMZL;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id g17si92948plq.0.2020.01.08.03.19.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jan 2020 03:19:33 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 008BJXXL071318;
	Wed, 8 Jan 2020 05:19:33 -0600
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 008BJXD8037708
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2020 05:19:33 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 05:19:32 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 05:19:32 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008BJPDt021746;
	Wed, 8 Jan 2020 05:19:31 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v2 3/5] arm64: ti-pvu: Add support for ti-pvu iommu unit
Date: Wed, 8 Jan 2020 16:48:23 +0530
Message-ID: <20200108111825.14280-4-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108111825.14280-1-nikhil.nd@ti.com>
References: <20200108111825.14280-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=v38VsMZL;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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
---

Notes:
    Changes from v1:
    * Fold header files into single header
    * Keep the re-inclusion protection for iommu.h and pvu.h
    * Remove compile time switch CONFIG_IOMMU_TI_PVU
    * Review signedness qualifiers for all variables
    * Implement the shutdown hook for cleaning the hardware state
    * Add warning when unsupported unmap_memory is called
    * Other cosmetic updates

 hypervisor/arch/arm-common/include/asm/cell.h |   7 +
 .../arch/arm-common/include/asm/iommu.h       |   1 +
 .../arch/arm-common/include/asm/ti-pvu.h      | 129 ++++
 hypervisor/arch/arm-common/iommu.c            |   5 +-
 hypervisor/arch/arm64/Kbuild                  |   3 +-
 hypervisor/arch/arm64/ti-pvu.c                | 581 ++++++++++++++++++
 include/jailhouse/cell-config.h               |   1 +
 7 files changed, 724 insertions(+), 3 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/ti-pvu.h
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
index 00000000..76cd4c7f
--- /dev/null
+++ b/hypervisor/arch/arm-common/include/asm/ti-pvu.h
@@ -0,0 +1,129 @@
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
diff --git a/hypervisor/arch/arm-common/iommu.c b/hypervisor/arch/arm-common/iommu.c
index b3100d03..4f4a4034 100644
--- a/hypervisor/arch/arm-common/iommu.c
+++ b/hypervisor/arch/arm-common/iommu.c
@@ -26,15 +26,16 @@ unsigned int iommu_count_units(void)
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
diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index 323b78b6..33e8b79b 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -20,4 +20,5 @@ always := lib.a
 # irqchip (common-objs-y), <generic units>
 
 lib-y := $(common-objs-y)
-lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o smmu-v3.o
+lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
+lib-y += smmu-v3.o ti-pvu.o
diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
new file mode 100644
index 00000000..87ef9522
--- /dev/null
+++ b/hypervisor/arch/arm64/ti-pvu.c
@@ -0,0 +1,581 @@
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
+
+#define MAX_PVU_ENTRIES		(PAGE_SIZE / sizeof (struct pvu_tlb_entry))
+#define MAX_VIRTID		  7
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
+	 * With correct static partitioning, following WARNING shouldn't appear
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
index b22275eb..3ac28af2 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -245,6 +245,7 @@ struct jailhouse_pci_capability {
 #define JAILHOUSE_IOMMU_AMD		1
 #define JAILHOUSE_IOMMU_INTEL		2
 #define JAILHOUSE_IOMMU_SMMUV3		3
+#define JAILHOUSE_IOMMU_PVU		4
 
 struct jailhouse_iommu {
 	__u32 type;
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200108111825.14280-4-nikhil.nd%40ti.com.
