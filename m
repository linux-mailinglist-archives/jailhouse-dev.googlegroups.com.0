Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB4UV6HYAKGQEIOC5RQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa38.google.com (mail-vk1-xa38.google.com [IPv6:2607:f8b0:4864:20::a38])
	by mail.lfdr.de (Postfix) with ESMTPS id E565E138F89
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 11:48:19 +0100 (CET)
Received: by mail-vk1-xa38.google.com with SMTP id x74sf4502848vke.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 02:48:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578912498; cv=pass;
        d=google.com; s=arc-20160816;
        b=yrMNNzkP81wMFED4DyqOH8a4Oo1nPVBbgpy0Ac/kMevNVtlzcWb4wLbgYrmxhzXuKM
         RJfi+2wFFT78rdZrnfxaObyHe6+NmyhoOPNotD38AQOx7bnTRGCiMErCA4nPzboAC5QC
         jIRRdfiWwhWeIIIt3j+sTENVbV3wanb0OIfOi06h/c8S5qe5erkMrdg+PE5lAAx3KYEF
         dgD7JqYOShLesOOnmxQhCUEFUdQCYgpcliCXcYCiOhbRaT2L3kACO6f9mxRHbJRs4CEM
         cVAyGJW79rahfj6ifEbnl6UuC8i/aERYLeWVOKeH2e4hAbAry6xUMaGovldKMxAioUjZ
         iEjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=E8+B3zOac1UHU91DNhsO9DZHLEOmB8h2YS6fBFb5pGI=;
        b=bzRNkTDKiDCIXVavJYjK+8lsjcx1C69LAEFcv4WcIS38IYUG0VTAvRdwkBDuLs9WCl
         MIyKpslaBLCt6IGATDyJhQ7Gej0gozdEjUbFcee3tWYFC/4C7Hv3GgAFt1Wk2rchH9k2
         7Zq6YkHyMwFL7os26Uqe5C+YSmBxPiRbk0F/C8h6TGzgVbTqkt5IetvfOP0rnP6aMT4Q
         UylVgp69n1cZGlNXlhOFYCEEaoLsTV/FyrJGHbElDH17n9P2VbXr7Foyv17Sgc/Ehdjg
         8A3BWFF5ibrkN7vHYVs/FUkCXgjmXYuKWTwJ90P/7gzfdNwmmDQzmGaOfbNB8HtyQdOv
         kmhQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KWpcXjTD;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=E8+B3zOac1UHU91DNhsO9DZHLEOmB8h2YS6fBFb5pGI=;
        b=pMngGjDL7KwZdaaQgQcVDYTRDWwJsdMkNT/S3MWmf/ltLKOluhpulUmPvVaxtymU+X
         i1RL61rzSbc7LM3xfz2P08ohDKepk5/80zKPkwVW6I1FWPWZNWnLPtrwbfNYL101ivYB
         2nE4ZcegLwt0PChGInPgH7RNgHcAGn5oiCeuUu0Z60VaXLUBT+SH/Yi69X9r4SMzQXms
         PbipCrUjb0GMwTZnv67fxR5JIqkeXGzFkdJ4g9zw7/UFlpYDBf3fgYBOzGgs7zEDqGyt
         3urEe5O+0h7NBsM9Knuv1fg+zgcYnAxX7gWVf57R2CnJOHqF5Lv0YLx9w11OclgEEFKg
         IwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=E8+B3zOac1UHU91DNhsO9DZHLEOmB8h2YS6fBFb5pGI=;
        b=LsFttBac0a0VpqayEJUpn//1iTFmJVRMNxFhFJUjHg9/1ehAVPxZXNIxKpE+UNkQH+
         MugNYJE5U/HFnXjPIfEApGDQ9OEtWbcyrJP8kI6SDsIWRXvzO9SSqh2cUVvudZJoiA++
         pTXedhTOpb7Y507GBuGEbw3ZcImeb38AwhrL2sWMgoyZe/dHYpDfhJe/DJn8mmkeNgrk
         nHBW70W3sBxsK0+QdTmc+1s1BzMBbbnmG9TyXTT5J19rC28FgjrwAiUNEv+biEGP3Fp2
         5SZDLsBXWq3E4uQ5L4FSocP8609+rKksFNb1hZwhXzCyA7xTNT1fy8MOYw2SNMp/BtWi
         ag1A==
X-Gm-Message-State: APjAAAUXSSEVu7M/UNCaLy5+OedSKM1ZkL3QfqD/nsFcDASXOfnr4hT+
	Y7YQwlPSmzoqPgbxrcI/zKM=
X-Google-Smtp-Source: APXvYqzPGOj9fbcZ66vD9DrbZ3W+SflZyH9kT5lCikMjyeVi9KOVCkJTWwfO4+elIz+UmHN4WXcR/w==
X-Received: by 2002:a05:6102:7a4:: with SMTP id x4mr5238049vsg.85.1578912498566;
        Mon, 13 Jan 2020 02:48:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac5:cb08:: with SMTP id r8ls463846vkl.16.gmail; Mon, 13 Jan
 2020 02:48:18 -0800 (PST)
X-Received: by 2002:a05:6122:1065:: with SMTP id k5mr9704690vko.14.1578912497948;
        Mon, 13 Jan 2020 02:48:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578912497; cv=none;
        d=google.com; s=arc-20160816;
        b=HawUimHl+/8biI31nkNavet06c+lK1PHYE8l2xUz7iFHb0D5b31dJuYrXfWaR7GeLb
         wL7DKzofnlV9FWjvgTtV5/Gj6QnPOyCxTFyF4bau/DOTVdN8MFOS5r888FxEahlne7DT
         zSDZE3PgBRp0p7ePsTmQc5SPAbCZ2wfBugzh91IP7OHGCLTJEIl/X3fR2neHZU8iyMym
         v/fWNIHFh6eXwK4UNRZ/j7unGDHFt5Y02eCfDsquAKcFaVXEpIyePBNiewyRxbsEbvAp
         z+I5REsUsqk8d3hjTNWdggrwgxjzOrz4HyV+0SxrYbWVhgMe49bOoSqdD+jafRG7T9X9
         NHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jo8uDEZGvmUjTu9mOCO5wGBsAB0BsgBtmWwTpIlSzoI=;
        b=vpu0JDD3vAA96FJrX8B6RZl9tCpPwStdwCBP9KkvhnIRU4cjvT0ugzhipVqV9v/Lzz
         k50BQsvMCLg7SzOn+l0/m2YEo11J0Y2frw91UKmjLP9EeBv+/4sNdBGiRM5O3iML1kep
         nWS3K5inNUkNMRnvG1vVXexAL1SSBHd7gDAmqRK9Dz8qxA6BL+CPRfyfL4ikRSvkWBej
         CQCnjvxDZQkgEil9hljGLT1oW7a33lMi+A12lMDYNn3VmCR9WYpk+WxYelO/FW314Nx2
         uKMGnI8N9J5ZNVc5wgRAHWSadfG4KuYREAsF+QI2GTtVVQrP0UQAgQQoyuONIepuAjhZ
         FPug==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KWpcXjTD;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id i27si395194uat.1.2020.01.13.02.48.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 02:48:17 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DAmH3c043899;
	Mon, 13 Jan 2020 04:48:17 -0600
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DAmHw5106859
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2020 04:48:17 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 04:48:16 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 04:48:16 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00DAm9MJ011219;
	Mon, 13 Jan 2020 04:48:15 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v3 3/5] arm64: ti-pvu: Add support for ti-pvu iommu unit
Date: Mon, 13 Jan 2020 16:16:45 +0530
Message-ID: <20200113104647.25884-4-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113104647.25884-1-nikhil.nd@ti.com>
References: <20200113104647.25884-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=KWpcXjTD;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
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
    Changes from v2:
    * Use named struct tipvu for all custom fields in jailhouse_iommu
    * Update references to these in tipvu unit
    
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
 hypervisor/arch/arm64/ti-pvu.c                | 580 ++++++++++++++++++
 include/jailhouse/cell-config.h               |   6 +
 7 files changed, 728 insertions(+), 3 deletions(-)
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
index 00000000..3f05f445
--- /dev/null
+++ b/hypervisor/arch/arm64/ti-pvu.c
@@ -0,0 +1,580 @@
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
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200113104647.25884-4-nikhil.nd%40ti.com.
