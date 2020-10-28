Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB4XZ4X6AKGQEPJY5JTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F6629D037
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 15:15:15 +0100 (CET)
Received: by mail-ot1-x33c.google.com with SMTP id g51sf1678961otg.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 07:15:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603894514; cv=pass;
        d=google.com; s=arc-20160816;
        b=YjvwR3kJTPBdxv+Nlm0Fm3fwFEcpFI+4RaK25MX7W20B1eGKRf5XJHMkRwlMcgn4Od
         aAbnFkdl0RrjtnVemVev7HsZx88CbNLRXqRJ3IjWg2BXtH8yvOPfXyL3+CFsPP5hrdND
         +lU9Hbqc6kaY3iYwFlf+tOiww5YT+5CIxI88f9ycNNIigrDXtaGHj+OtjJRPINJdlT8g
         7Iqm9MLLy9BUgyrkvgdpqgA336LAzcNfU1AySzFxZ7dNd/DuKbTfrAURgkUirFeqiZoc
         zhbLB8ORtlQdwL513CPFO69MGAUXQdNEV+KN6b2IIdCg8ZlZch/c9tJpaQPDrXgssB98
         i3RA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=kO/zi26Ppuc06BQSkJlvljWtVb1LB/1CItAWoy1au7U=;
        b=udfLP44S5hhjtRZO72INYKOiTP3oqy4SR0giztgOSXsKH+Lmtzd4oH1SlUFjW+jpu7
         7ITTCQM/qFWCUw8OSgM/eT55lntc+b/3zQD6NAdm+8fg9YaOKNhu89gdhMv+1b2eGAuD
         +B9oBF2e9j6hCGDN/VXAkNFv0bfePcgYWzessWGaZyVxGH4+PV9+JXcLth1HAAFeO2IB
         nUAGDk5zuiZHJh2EQ4vNJU2U9fG/sTbYo1F0THvIGIwFzNcARa2kc1QxYmYwUb/EYZgH
         yj0koGSIBkaJ7OpV1AGKfGIrxk2VTtquIw/qiktF+TT0e7Ud/VWqd91D1AIJKD5EOrhA
         /7uA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZPXNtCf6;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=kO/zi26Ppuc06BQSkJlvljWtVb1LB/1CItAWoy1au7U=;
        b=GdvLESO4tD/B9JqMqoJ06W25WjnHeiUTNQm8+o3oDU9vrXb20Vt19VSD+lRgzfxpWW
         55vbBLe8DanwK938Dzn7EAVJ84SpOa220SgvfFqqbOPKstemG5rILovEqwGa2E+f7LH/
         RigYWSdWtIaLthWuBFxWpeCYjRay7XUeGN4HgcSSzIJObdhEDQVYqTT0QJE0Ku09REQ9
         hr2gBxRfdKQ3Dfh2LxJTJdw7l/aYvGEJbABEOAInorY5re4Zpoe/IDAAxTPfYM/uP3+y
         6QH/eXd4W/nI8LQFRhBSWCtsiRT5eUqtxd2IR7OAZn1tZDX9HBLWAViANxLtMZ7diTui
         riMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kO/zi26Ppuc06BQSkJlvljWtVb1LB/1CItAWoy1au7U=;
        b=KIFd+nmE8Fe0tuKFh04/skvPNiMbQChl7LIWonY7sbsEtttNwjJhQ6UpuYU0sjyATU
         B6knNkWkG/jqV/ttSEPIKuZwad/pyMCMFPV2TPBefe2DC3LS8RJ55Nw2/dE1r5W5olpJ
         lBxKW38aKhADqNAym/b6hN1xkerebAOgilTzdhRfoSO5OfXGGqBUUGWYbQrEwCM8WC8T
         gLcXi9NQuB1flLHWXklUbUtiRvXpvzJUPT7eA8Us7k4js+C6SPsxYvtYCwAE3pSa+KVD
         JJC61NHWSp32H8FRWC2rahLvYBAIyTSa8HPNHEsK+pMRMADeyuNFX3busxbBpfYfrEK4
         QZIA==
X-Gm-Message-State: AOAM532nDNPDeka+kjauL5YnuwEQdasquXhr6kjB64BCjltpwJCDlgFe
	M6VOirOVt+Pp+pS99P29aUw=
X-Google-Smtp-Source: ABdhPJx0rCWGcdV+d09PjfVbUIQczua2vnMDLVjIU8ttDndlyE02nb+rAM4mw7bBfGrIcn/nt8MWmQ==
X-Received: by 2002:a05:6830:13c4:: with SMTP id e4mr5168643otq.142.1603894514657;
        Wed, 28 Oct 2020 07:15:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:cf15:: with SMTP id f21ls1401685oig.8.gmail; Wed, 28 Oct
 2020 07:15:14 -0700 (PDT)
X-Received: by 2002:aca:e185:: with SMTP id y127mr5597898oig.57.1603894514074;
        Wed, 28 Oct 2020 07:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603894514; cv=none;
        d=google.com; s=arc-20160816;
        b=A8wFY7+wgyYSVNs4+eTdR6ARPVRfy6QHd4TKgzo5h4qanm3JCW4XDZWi5N+P4FyNk0
         spaxduy1Id6M9g5veoZ4UZgax0S8V3arSGkm0XZZ9wdOvOG6mLbXxZjvzTg8azmq+hzb
         zcKq7pk1fWHzjHCIz+iHpPD7MrSW+wbbCJfMhWoYjiWssiiR0yVBsPPMFn4KYN13qYPc
         qMFMDq8P9o1/PA6Mp1BmgHVW/asPCo3R2Tsttg/5sfOBIFXullKGsFIP6mDbR17v9T07
         6dNKWQZEAEajmEOwS4Epdp2m0mbJ2AGdFUWcDqq/YWK78kFO8usQbqnaQ/+b4HvFYiEO
         EWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=KI/UNKN5N514TnKtZ5yggM3i0zAan83aXoZz6n/lBe4=;
        b=YkBKS1TmlniZ4n743TQhbG0s4v2k4wRD9WCPkzBJRPI2IGQEK0f/MDMxF3m2Nv/TZW
         2FL9xDsA+AuRBgFcQgDZJbLOERUgV6tDrZzhgX8lXbNJWVdbJCP84zkTfwRwlA+/0R6p
         UGqi613w0Y50UJOUkumP+24OTx2c7oSTQDkRVAYKXZAyjXSGKeASy3mBjuTXh0cUClF2
         IH7beLrd+raaS5adozORzKXXbn9dFoH95tlIbcMK0sZvzG/q6vY6HAXwcqjTkOpT83KW
         g+Cj+bwsFeibDnNQc+yTznhdDNW5gGcWFDvCK9kMuuOGWy4gnKRYhNsbDZDSUzoP7syA
         ulRw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZPXNtCf6;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id q10si447542oov.2.2020.10.28.07.15.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2020 07:15:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09SEFDig118773;
	Wed, 28 Oct 2020 09:15:13 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09SEFDBF081097
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Oct 2020 09:15:13 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 28
 Oct 2020 09:15:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 28 Oct 2020 09:15:13 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09SEFAKx096634;
	Wed, 28 Oct 2020 09:15:11 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
CC: Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH v2] arm64: pvu: Avoid failure in config_commit
Date: Wed, 28 Oct 2020 19:44:54 +0530
Message-ID: <20201028141454.22657-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=ZPXNtCf6;       spf=pass
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

Change the return type to void for few functions. Add comments to
explain behavior in case of failure.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Notes:
    Changes from v1:
    * Add a comment to descibe why pvu_tlb_alloc will not fail
    * Make return type of pvu_entry_write as void and explain the
    behavior in case the constraints are not met
    * Remove un necessary else block

 hypervisor/arch/arm64/include/asm/ti-pvu.h |  3 +-
 hypervisor/arch/arm64/ti-pvu.c             | 68 ++++++++++++++--------
 2 files changed, 45 insertions(+), 26 deletions(-)

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
index 3b9a29ec..c488ce89 100644
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
@@ -110,9 +110,15 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
 	for (i = dev->max_virtid + 1; i < dev->num_tlbs; i++) {
 		if (dev->tlb_data[i] == 0) {
 			dev->tlb_data[i] = virtid << dev->num_entries;
+			dev->free_tlb_count--;
 			return i;
 		}
 	}
+
+	/*
+	 * We should never reach here, tlb_allocation should not fail
+	 * pvu_iommu_map_memory ensures that there are enough free TLBs
+	 */
 	return 0;
 }
 
@@ -138,10 +144,13 @@ static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
 
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
 
@@ -159,7 +168,7 @@ static void pvu_entry_enable(struct pvu_dev *dev, u16 tlbnum, u8 index)
 	dev->tlb_data[tlbnum] |= (1 << index);
 }
 
-static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
+static void pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
 			   struct pvu_tlb_entry *ent)
 {
 	struct pvu_hw_tlb_entry *entry;
@@ -174,17 +183,21 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
 			break;
 	}
 
+	/*
+	 * If the hardware constraints for page size and address alignment
+	 * are not met, print out an error, return without writing any entry
+	 */
 	if (pgsz >= ARRAY_SIZE(pvu_page_size_bytes)) {
 		printk("ERROR: PVU: %s: Unsupported page size %llx\n",
 			__func__, ent->size);
-		return -EINVAL;
+		return;
 	}
 
 	if (!is_aligned(ent->virt_addr, ent->size) ||
 	    !is_aligned(ent->phys_addr, ent->size)) {
 		printk("ERROR: PVU: %s: Address %llx => %llx is not aligned with size %llx\n",
 			__func__, ent->virt_addr, ent->phys_addr, ent->size);
-		return -EINVAL;
+		return;
 	}
 
 	mmio_write32(&entry->reg0, ent->virt_addr & 0xffffffff);
@@ -198,9 +211,8 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
 	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_PGSIZE_MASK, pgsz);
 	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_FLAG_MASK, ent->flags);
 
-	/* Do we need "DSB NSH" here to make sure all writes are finised? */
+	/* Do we need "DSB NSH" here to make sure all writes are finished? */
 	pvu_entry_enable(dev, tlbnum, index);
-	return 0;
 }
 
 static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
@@ -221,6 +233,8 @@ static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
 	}
 
 	dev->max_virtid = max_virtid;
+	dev->free_tlb_count = dev->num_tlbs - (max_virtid + 1);
+
 	mmio_write32(&cfg->virtid_map1, 0);
 	mmio_write32_field(&cfg->virtid_map2, PVU_MAX_VIRTID_MASK, max_virtid);
 
@@ -328,17 +342,17 @@ static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
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
@@ -356,20 +370,15 @@ static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
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
@@ -380,8 +389,9 @@ int pvu_iommu_map_memory(struct cell *cell,
 			 const struct jailhouse_memory *mem)
 {
 	struct pvu_tlb_entry *ent;
+	struct pvu_dev *dev;
 	unsigned int size;
-	u32 flags = 0;
+	u32 tlb_count, flags = 0;
 	int ret;
 
 	if (pvu_count == 0 || (mem->flags & JAILHOUSE_MEM_DMA) == 0)
@@ -408,6 +418,18 @@ int pvu_iommu_map_memory(struct cell *cell,
 	if (ret < 0)
 		return ret;
 
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
+	}
+
 	cell->arch.iommu_pvu.ent_count += ret;
 	return 0;
 }
@@ -434,13 +456,12 @@ int pvu_iommu_unmap_memory(struct cell *cell,
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
@@ -455,13 +476,10 @@ int pvu_iommu_config_commit(struct cell *cell)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028141454.22657-1-nikhil.nd%40ti.com.
