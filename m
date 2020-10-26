Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBH6S3T6AKGQEFVDBHZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DBC29976A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Oct 2020 20:53:05 +0100 (CET)
Received: by mail-oi1-x237.google.com with SMTP id l142sf6141233oig.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Oct 2020 12:53:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603741984; cv=pass;
        d=google.com; s=arc-20160816;
        b=WcUpIv/4lxIzuFiPsgzJmO98UTA2JLjqN9NryMGd8SECh0puiRAgXR3Xk5L/P0YScE
         urxP+C0pXgJyXKUJYC0gLVjB/9RO/mq9gjnLVhf8vMyg4tBGK2OU8qcxlA6spddiGW+y
         9ZeMr56DOkSLgzA74eqwTENAgAICzr+2OQuI4ulZD3ys0/9mdtYa90XIElwkSjYLXrMr
         sBY2AiarXJlZnzJZfeDSeI/LNAcoWLP6nK5671CX3q0Pfa1p6dZDP07vkbdVrGSm8/0G
         ogwPKomTjHmczTgGQwfy32lvzWuAv9O/OI2WQtHY8AqUzkPe4GxCs/FWp5BqYUSxWQwB
         E75g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:to:from:dkim-signature;
        bh=XoSahlz7U0k/JfN86FpHLVYcTWlcFD4UhVgCpMa9maY=;
        b=liwf3cMFjqeqgG1ZJIcvxB6QzIrvz8X+8jzKSorny11nqFeUV4TGAQXqVaxnfokIib
         2w6T7qq94xVJsTvxXnx0+kXaP+jDD5gC1XzNmNSdg5eOMm5w4wQcRoBEaIL61IVDmdEi
         W+QwOb7RWpBfj9kDcq9Z7NhX2HD4LxNS9VWCHH5Z6x2s3Hj8ScMHGdiSjT3M//aJdgli
         Rgs5pnRRGVwRFtnYZIPfnIwIXHhDSIPOup8Wgt46D1RCmqrnBBW5BhM2FHnpS7KGICZy
         4J74qIv3cihl0LkPxPNFn+iiHN7w/Z0o9FlbWJKt05DhRBOSXby4Qum5u7JD2gKXM2AP
         Tb5A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ScBmvMQc;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=XoSahlz7U0k/JfN86FpHLVYcTWlcFD4UhVgCpMa9maY=;
        b=jAkSL7haUojNPUwc4rWaWD6Js+9azim1E7JNH7TZOu4FNzErVhiNu1vtZB2QIlC+JW
         aLFERthWq0Zy5B8MyCjwfav6BVqy1TWJfh+8K5UgCqJ6g1xt5IwQrVP1kiuQEE2LAYD1
         lo7lR5riMv/TGdj9dIsKzazxUVwFxrxtp2cSVcEoApVvKv2jel7FJaEaQFdQmc8PL56k
         kT+HsZ6d/bJYxgHaa1S9PFlvKXG6NOi1M9LgT5Oaw43xQrStKMZhTt/49OmhIIhcYi4t
         bGpAKWU3BEh721fz1acandjTkiq93w5JqlK/t/1L+dhjhs31/uPMmdstB/wyHbpV+6kf
         TjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XoSahlz7U0k/JfN86FpHLVYcTWlcFD4UhVgCpMa9maY=;
        b=VDtYBVTq78oDRzf8X1QN2Tf/KVWDfaQK96Pgf25L8Wk4kZQJZcoe3f9lh/CY7Hw1fC
         sVYeEpuvEV3q8lu6kUwA/efMiqaU27jGJi7QVamqdsnR2RKKggWSy7ZdePXR4CgiQPaN
         MrLLXvKnnKDrbp8y316zrAz/7v66oGNaFJrZwkGCIYkiEGDWLXLdwQkQEvorQYc6xwCb
         eI73eHVePLpHdAKNMix1/hMX4s35U4BLzx6RLhbOIfHTHZbYcNXIfvqwUc1N0xk67nDu
         ogcksQ4xaoVP9jLTEA8Sw4j/Db6jFTxszW8Cb/r8hqoAvdjwhIJk/D6npoJE0YoUCfus
         Y9pQ==
X-Gm-Message-State: AOAM530TcUqP8wR/3pO+VCorFDKpcAmZw1ogQHM9n/uetubc91bzwM1G
	B6TAO/rqWNG9L3gtUWhs7YA=
X-Google-Smtp-Source: ABdhPJyAt/Xt0G+3XxJiugss9azxLOKKcT5zLvDSUGmlTaBpNMWXXWO39wkDXS337Ortk/ZyKZ0UIQ==
X-Received: by 2002:aca:4257:: with SMTP id p84mr11756826oia.68.1603741983987;
        Mon, 26 Oct 2020 12:53:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:13d8:: with SMTP id e24ls1415517otq.11.gmail; Mon,
 26 Oct 2020 12:53:03 -0700 (PDT)
X-Received: by 2002:a9d:6e17:: with SMTP id e23mr3487907otr.296.1603741983489;
        Mon, 26 Oct 2020 12:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603741983; cv=none;
        d=google.com; s=arc-20160816;
        b=FJOoaN9F0nJ2PbiNFjJ7lHwdvC8r3fq6hV+5lVj7WhJTb3ykWxy5mOlcVumyhAjgfQ
         nLf/n+ZVv/oipp6f5SIVYSjXIeLban2maYW3jWzfaPHsmKBJADO9LM4gsXKNrLFFdd0S
         L1czzEYTLuslsfv9QJZQBH6vbHf8zuWPVwK+S7pxuWHj4QOYpXQ7/jPdglrlNnik+ReR
         x4XUgRwRAybbgVmrEmuK1zaJGLQblUksnQmbDH7WNZrpZ7qIQ8VA1H7C85UlY3yTND16
         k50aJzszgB341WMPhpVTcVQiTmXv803g3vdNqTrqjJ//AZ1BNGt43m3HFt+V4Hh8eIrO
         SNDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ujAM5qi3+rB+8jBKOu9wPeGli2/k5bDCKfD+rZ8sBLI=;
        b=Qtc5ddMcL2NB3QICftLhMDaaRBep3ZqJzZ6BGTW3o2w5Lwz1e1a34LFGiFxdsb6eCa
         /gKdSWsNA9kT7LioIEW8iIHZm1t2fmj75+nX4vWK36Lbc7omgZ/jBrCsOLqxjyJmWp+z
         QLBzNNLo91a13MHEQRcPOPFS/PTrBZOMWnc1devfmjPwJ6F1e2RAWf8X+m5gP2NVGakb
         tTWu5kCGQIWhUm/nWfnpgRpf6wxK2Z28dGP3vmFZ1EMezxocbAnlyZPwPAa4t4cb7bQF
         ScUaUvqY/dyxqkYdCMZIznVkj9tbm58Vb3jOIwF65YJvmZEmI82rX16XcE7OBvaojkRv
         hJhw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ScBmvMQc;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id f16si834321otc.0.2020.10.26.12.53.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 12:53:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09QJr2Xj076828;
	Mon, 26 Oct 2020 14:53:02 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09QJr2RG129232
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Oct 2020 14:53:02 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 26
 Oct 2020 14:53:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 26 Oct 2020 14:53:02 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09QJr0Jp071220;
	Mon, 26 Oct 2020 14:53:01 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] arm64: pvu: Avoid failure in config_commit
Date: Tue, 27 Oct 2020 01:22:57 +0530
Message-ID: <20201026195257.14398-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=ScBmvMQc;       spf=pass
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

Current PVU iommu implementation ignores possible failures in the
config_commit part. This would allow inconsistent configuration
to run and may introduce unknown bugs.

Solve this by making sure that the pvu_iommu_config_commit never
fails. Catch the errors early in the mapping phase. Use
"free_tlb_count" to track available no of TLBs for chaining.
This can be used to check if any mapping causes it to potentially
use more no of TLBs than that are free. This will ensure that
the allocationg for chaining will not fail.

Change the return type to void and remove the error handling in
the config_commit path.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 hypervisor/arch/arm64/include/asm/ti-pvu.h |  3 +-
 hypervisor/arch/arm64/ti-pvu.c             | 54 +++++++++++++---------
 2 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/hypervisor/arch/arm64/include/asm/ti-pvu.h b/hypervisor/arch/arm64/include/asm/ti-pvu.h
index 2c340b3a..62aec7c0 100644
--- a/hypervisor/arch/arm64/include/asm/ti-pvu.h
+++ b/hypervisor/arch/arm64/include/asm/ti-pvu.h
@@ -117,6 +117,7 @@ struct pvu_dev {
 	u16		max_virtid;
 
 	u16		tlb_data[PVU_NUM_TLBS];
+	u16		free_tlb_count;
 };
 
 int pvu_iommu_map_memory(struct cell *cell,
@@ -125,6 +126,6 @@ int pvu_iommu_map_memory(struct cell *cell,
 int pvu_iommu_unmap_memory(struct cell *cell,
 		const struct jailhouse_memory *mem);
 
-int pvu_iommu_config_commit(struct cell *cell);
+void pvu_iommu_config_commit(struct cell *cell);
 
 #endif /* _IOMMMU_PVU_H_ */
diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
index 3b9a29ec..d96d01c9 100644
--- a/hypervisor/arch/arm64/ti-pvu.c
+++ b/hypervisor/arch/arm64/ti-pvu.c
@@ -15,7 +15,7 @@
  * There are limitations on the number of available contexts, page sizes,
  * number of pages that can be mapped, etc.
  *
- * PVU is desgined to be programmed with all the memory mapping at once.
+ * PVU is designed to be programmed with all the memory mapping at once.
  * Therefore, it defers the actual register programming till config_commit.
  * Also, it does not support unmapping of the pages at runtime.
  *
@@ -110,6 +110,7 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
 	for (i = dev->max_virtid + 1; i < dev->num_tlbs; i++) {
 		if (dev->tlb_data[i] == 0) {
 			dev->tlb_data[i] = virtid << dev->num_entries;
+			dev->free_tlb_count--;
 			return i;
 		}
 	}
@@ -138,10 +139,13 @@ static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
 
 	mmio_write32(&tlb->chain, 0x0);
 
-	if (i < dev->max_virtid)
+	if (i < dev->max_virtid) {
 		dev->tlb_data[tlbnum] = 0x0 | i << dev->num_entries;
-	else
+	} else {
+		/* This was a chained TLB */
 		dev->tlb_data[tlbnum] = 0x0;
+		dev->free_tlb_count++;
+	}
 
 }
 
@@ -198,7 +202,7 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
 	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_PGSIZE_MASK, pgsz);
 	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_FLAG_MASK, ent->flags);
 
-	/* Do we need "DSB NSH" here to make sure all writes are finised? */
+	/* Do we need "DSB NSH" here to make sure all writes are finished? */
 	pvu_entry_enable(dev, tlbnum, index);
 	return 0;
 }
@@ -221,6 +225,8 @@ static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
 	}
 
 	dev->max_virtid = max_virtid;
+	dev->free_tlb_count = dev->num_tlbs - (max_virtid + 1);
+
 	mmio_write32(&cfg->virtid_map1, 0);
 	mmio_write32_field(&cfg->virtid_map2, PVU_MAX_VIRTID_MASK, max_virtid);
 
@@ -328,17 +334,17 @@ static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
 	}
 }
 
-static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
+static void pvu_iommu_program_entries(struct cell *cell, u8 virtid)
 {
 	unsigned int inst, i, tlbnum, idx, ent_count;
 	struct pvu_tlb_entry *ent, *cell_entries;
 	struct pvu_dev *dev;
-	int ret, tlb_next;
+	int tlb_next;
 
 	cell_entries = cell->arch.iommu_pvu.entries;
 	ent_count = cell->arch.iommu_pvu.ent_count;
 	if (ent_count == 0 || cell_entries == NULL)
-		return 0;
+		return;
 
 	/* Program same memory mapping for all of the instances */
 	for (inst = 0; inst < pvu_count; inst++) {
@@ -356,20 +362,15 @@ static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
 			if (idx == 0 && i >= dev->num_entries) {
 				/* Find next available TLB and chain to it */
 				tlb_next = pvu_tlb_alloc(dev, virtid);
-				if (tlb_next < 0)
-					return -ENOMEM;
 				pvu_tlb_chain(dev, tlbnum, tlb_next);
 				pvu_tlb_enable(dev, tlbnum);
 				tlbnum = tlb_next;
 			}
 
-			ret = pvu_entry_write(dev, tlbnum, idx, ent);
-			if (ret)
-				return ret;
+			pvu_entry_write(dev, tlbnum, idx, ent);
 		}
 		pvu_tlb_enable(dev, tlbnum);
 	}
-	return 0;
 }
 
 /*
@@ -380,8 +381,9 @@ int pvu_iommu_map_memory(struct cell *cell,
 			 const struct jailhouse_memory *mem)
 {
 	struct pvu_tlb_entry *ent;
+	struct pvu_dev *dev;
 	unsigned int size;
-	u32 flags = 0;
+	u32 tlb_count, flags = 0;
 	int ret;
 
 	if (pvu_count == 0 || (mem->flags & JAILHOUSE_MEM_DMA) == 0)
@@ -408,7 +410,19 @@ int pvu_iommu_map_memory(struct cell *cell,
 	if (ret < 0)
 		return ret;
 
-	cell->arch.iommu_pvu.ent_count += ret;
+	/*
+	 * Check if there are enough TLBs left for *chaining* to ensure that
+	 * pvu_tlb_alloc called from config_commit never fails
+	 */
+	tlb_count = (cell->arch.iommu_pvu.ent_count + ret - 1) / 8;
+	dev = &pvu_units[0];
+
+	if (tlb_count > dev->free_tlb_count) {
+		printk("ERROR: PVU: Mapping this memory needs more TLBs than that are available\n");
+		return -EINVAL;
+	} else {
+		cell->arch.iommu_pvu.ent_count += ret;
+	}
 	return 0;
 }
 
@@ -434,13 +448,12 @@ int pvu_iommu_unmap_memory(struct cell *cell,
 	return 0;
 }
 
-int pvu_iommu_config_commit(struct cell *cell)
+void pvu_iommu_config_commit(struct cell *cell)
 {
 	unsigned int i, virtid;
-	int ret = 0;
 
 	if (pvu_count == 0 || !cell)
-		return 0;
+		return;
 
 	/*
 	 * Chaining the TLB entries adds extra latency to translate those
@@ -455,13 +468,10 @@ int pvu_iommu_config_commit(struct cell *cell)
 		if (virtid > MAX_VIRTID)
 			continue;
 
-		ret = pvu_iommu_program_entries(cell, virtid);
-		if (ret)
-			return ret;
+		pvu_iommu_program_entries(cell, virtid);
 	}
 
 	cell->arch.iommu_pvu.ent_count = 0;
-	return ret;
 }
 
 static int pvu_iommu_cell_init(struct cell *cell)
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201026195257.14398-1-nikhil.nd%40ti.com.
