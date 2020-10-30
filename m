Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBKUN6D6AKGQEM56CUBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe38.google.com (mail-vs1-xe38.google.com [IPv6:2607:f8b0:4864:20::e38])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F232A054B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 13:27:23 +0100 (CET)
Received: by mail-vs1-xe38.google.com with SMTP id j11sf336829vsj.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 05:27:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1604060842; cv=pass;
        d=google.com; s=arc-20160816;
        b=nGJRO4i03MSETYZ/KlNaRXUMSC6+hajQdOeY4B/pMxgENId7vIluXrmbBX7CbYGKTY
         IfADWYF2j+n/646u8hoYnbAHVmWHSv+wbYsj7YPjUqYJjYnJgblmQlz4t0vd6TDvGXBy
         E6DfCsN40B6fcYa2CE3WhhDZB+s8dIOiXYZ7c534/OaArf2xGlHUtMxI6KL96FXIkxHi
         SneaFa7GFMdXNp0gwe6n48qziDSJuVbqf+oVuNwJnBxzEasgPmwsb9AqbYu18XdWnh4A
         4nCeHsl7m4D72Mwa8Nd1mxSguitHJcLVl+NoE97TvF94XmYuM8KT+3+mMj5tkuCf+ItU
         O4eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=eJ/VQbFnaFLy7QdTNwDq4ufP4k3eQA1N9Cxo0WuR+gM=;
        b=yaGgphOkLAGYjuTndXWwaTNtejYjX49ScBszQdmdoz8jKvC+ScSq8G+y6Lat19cHxR
         jCSezUPJU2ke82G3ug6K+qLSpiPpKS9eipKApJU/Oqb9f/EKbyidx+KX2Q5LRbzKLWkD
         nuLz/lVdmAIl554cmyOFbX5EdmoAvoJEKyIwOXmtgytLG642gXTTQXlRHIcI4AIl6IaK
         Bx3GwCGPHomVvdB/g0eyIP3Oe2a4AOgAwG5tesWoCM8gVXoyXWWwBs680T/1doJ2MOzI
         2mAq8w6RC4Cbasf8gBBPo17ccHUxjsivu9d1RZs/zLxr6pvMJKZ9e91aECahWcXuMaaM
         4SPA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZftmXqOU;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=eJ/VQbFnaFLy7QdTNwDq4ufP4k3eQA1N9Cxo0WuR+gM=;
        b=Gug2r/YtHJQ7eioLx+hN/p1XxKjI/gusY3rQ5zrQfsUSimoFii89ZW7vEbf/N+ac6+
         Zapov61ppUy9hyKaAnF0xC3PpIC++9Sads2wHeWOBZuOEyRojc43wL5T6pDQi5faXlk5
         HW9StYaoOAGAj/N8o4qLNkxvC236LZlERD/UgJAaY7gVmRTVhMz+tcWtM5kt/nZOTMnP
         EseIK4PisJ36h3dt06S+OAKRh7PFcGaqyanxFuij5CoZMmes/9N48sLHWQoTf4W1z6PO
         zN9tgvlbTIZwT2MkkvGDQF2Erp4HQMyBtmz48JUzZYkEfyC8vj6gBlHRxGn1eZa/EyCX
         lmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eJ/VQbFnaFLy7QdTNwDq4ufP4k3eQA1N9Cxo0WuR+gM=;
        b=nHil73GehQu4bqXQLFZXJzI+vuQHOTnq64tO7gLC806yEjon1pSAAuY7hd5WkqVoi8
         jKq4HVA7xvO/VapJsAGCaDqnBJfqbwOfUxyMQy0Me1HDGQ4lApIBnQx5W8hmz7ARtqDS
         7jD1XXubeimbSDW6keamAAX9IVdNkzwbfPcIErhBsIcLd69DBA8WDB3zDLzsKEfQGaGO
         ooZuxjRpNyNuT6KqD7NNe/Gxa8a/X8qGJ7QGJWoBNlKS4dFQISpkwPjYo7qwh/IncOj4
         0reIe3ymlSl/w8bUpGfaVZfJCywQB+jUPS49AFdCJY0+0n+mmBwPJH5SN3RpHx725nCo
         AdCA==
X-Gm-Message-State: AOAM532YCUhHLaj47e0wO+vl6deIKAgNdFMMKms17nYwLMu/Rbf26SzR
	JwAFKo7UEIcWytTetcsAXOg=
X-Google-Smtp-Source: ABdhPJwzP5ZlkDb7Aveu0F+kgMS/sDOfqO5vIpI5S6fXQrnb2oIT+AvZvbWwG68gT6gJz6J+ZXf+DQ==
X-Received: by 2002:a67:ed48:: with SMTP id m8mr6945810vsp.47.1604060842448;
        Fri, 30 Oct 2020 05:27:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1f:4515:: with SMTP id s21ls361264vka.11.gmail; Fri, 30 Oct
 2020 05:27:21 -0700 (PDT)
X-Received: by 2002:a05:6122:12a7:: with SMTP id j7mr489133vkp.15.1604060841666;
        Fri, 30 Oct 2020 05:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604060841; cv=none;
        d=google.com; s=arc-20160816;
        b=yHLplKz5JaCr7DuZa9IKQQgA1mSXHHhiaB9fPBLXZT2Ybynlh6rB2LXfhRX0SGywsi
         GusOqD1p95J0JduhLkw9aFu3L+en4j1If0zqvLg2xXYhBFFVovNs2H58LhtyL+7d+x7/
         NUJLGIbqppRefCpEltmtxMijTqskY2Lv1jyjtqbdRtq9tDfdHdKdROb2LZE3aFj35HQP
         U0DKP5ofDzBLImmMhicRcu58rXcmiHboVBNog0K7kzvFEW0ZOGIRRYqTfQDpnxc30RVg
         tMxWfEaGD8kkSM71fZlZTbSuipqY5eREZ0whVEXnQ2qHUvszTMJW9owrTeq31cUHFaC6
         IEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=C6FHODclmdO+7w+fZ7TZggFRXCx/9dn5t24Hp/l9kgY=;
        b=uABo3YK5Wb1maVrBbBayEiPwovU8p0W+Q31aYFC+tLJSyGAiS3+WAuMmbD/jylIFDH
         BqaPzcJlav9BB0W8kAdj0cNv7fYQWfFz0nRFE7EaXz/wzdgGe79TfNt5zTqVBaBJ8xmB
         K6bIdHpd+VF4NwBV6NTNh9OCBvBRoJdebx8jAvr3s35Dqt94HWm4HTRk92cBWhOeG0nY
         ndNPoM0AD5ZB7tBDxzmFQ9Sq04IwDwghqzslIy8xCMy6SxvXVepAUvkhNF+7v6cBvCXJ
         Qq6KBI55pPOwZIFK2VEcIFzEuaIxgT4qVFX7RRUV+Q3uYJCeSjn0Mx3ZPQFcbUU3Afvi
         uP+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZftmXqOU;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id n1si10665vsr.2.2020.10.30.05.27.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2020 05:27:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09UCRKw7067816;
	Fri, 30 Oct 2020 07:27:20 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09UCRKQ8097552
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Oct 2020 07:27:20 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 30
 Oct 2020 07:27:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 30 Oct 2020 07:27:20 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09UCRICX028617;
	Fri, 30 Oct 2020 07:27:18 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
CC: Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH v3] arm64: pvu: Avoid failure in config_commit
Date: Fri, 30 Oct 2020 17:57:12 +0530
Message-ID: <20201030122712.4199-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=ZftmXqOU;       spf=pass
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
explain behavior in case of failure. Remove un necessary checks
that would never trigger.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Notes:
    Changes from v2:
    * Remove additional checks which will always pass
    * Use a BUG in case control reaches where it should'nt have
    
    Changes from v1:
    * Add a comment to descibe why pvu_tlb_alloc will not fail
    * Make return type of pvu_entry_write as void and explain the
    behavior in case the constraints are not met
    * Remove un necessary else block

 hypervisor/arch/arm64/include/asm/ti-pvu.h |  3 +-
 hypervisor/arch/arm64/ti-pvu.c             | 76 ++++++++++++----------
 2 files changed, 42 insertions(+), 37 deletions(-)

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
index 3b9a29ec..98c0176b 100644
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
@@ -110,9 +110,17 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
 	for (i = dev->max_virtid + 1; i < dev->num_tlbs; i++) {
 		if (dev->tlb_data[i] == 0) {
 			dev->tlb_data[i] = virtid << dev->num_entries;
+			dev->free_tlb_count--;
 			return i;
 		}
 	}
+
+	/*
+	 * We should never reach here, tlb_allocation should not fail.
+	 * pvu_iommu_map_memory ensures that there are enough free TLBs
+	 */
+
+	BUG();
 	return 0;
 }
 
@@ -138,10 +146,13 @@ static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
 
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
 
@@ -159,7 +170,7 @@ static void pvu_entry_enable(struct pvu_dev *dev, u16 tlbnum, u8 index)
 	dev->tlb_data[tlbnum] |= (1 << index);
 }
 
-static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
+static void pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
 			   struct pvu_tlb_entry *ent)
 {
 	struct pvu_hw_tlb_entry *entry;
@@ -174,19 +185,6 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
 			break;
 	}
 
-	if (pgsz >= ARRAY_SIZE(pvu_page_size_bytes)) {
-		printk("ERROR: PVU: %s: Unsupported page size %llx\n",
-			__func__, ent->size);
-		return -EINVAL;
-	}
-
-	if (!is_aligned(ent->virt_addr, ent->size) ||
-	    !is_aligned(ent->phys_addr, ent->size)) {
-		printk("ERROR: PVU: %s: Address %llx => %llx is not aligned with size %llx\n",
-			__func__, ent->virt_addr, ent->phys_addr, ent->size);
-		return -EINVAL;
-	}
-
 	mmio_write32(&entry->reg0, ent->virt_addr & 0xffffffff);
 	mmio_write32_field(&entry->reg1, 0xffff, (ent->virt_addr >> 32));
 	mmio_write32(&entry->reg2, 0x0);
@@ -198,9 +196,8 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
 	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_PGSIZE_MASK, pgsz);
 	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_FLAG_MASK, ent->flags);
 
-	/* Do we need "DSB NSH" here to make sure all writes are finised? */
+	/* Do we need "DSB NSH" here to make sure all writes are finished? */
 	pvu_entry_enable(dev, tlbnum, index);
-	return 0;
 }
 
 static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
@@ -221,6 +218,8 @@ static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
 	}
 
 	dev->max_virtid = max_virtid;
+	dev->free_tlb_count = dev->num_tlbs - (max_virtid + 1);
+
 	mmio_write32(&cfg->virtid_map1, 0);
 	mmio_write32_field(&cfg->virtid_map2, PVU_MAX_VIRTID_MASK, max_virtid);
 
@@ -328,17 +327,17 @@ static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
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
@@ -356,20 +355,15 @@ static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
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
@@ -380,8 +374,9 @@ int pvu_iommu_map_memory(struct cell *cell,
 			 const struct jailhouse_memory *mem)
 {
 	struct pvu_tlb_entry *ent;
+	struct pvu_dev *dev;
 	unsigned int size;
-	u32 flags = 0;
+	u32 tlb_count, flags = 0;
 	int ret;
 
 	if (pvu_count == 0 || (mem->flags & JAILHOUSE_MEM_DMA) == 0)
@@ -408,6 +403,19 @@ int pvu_iommu_map_memory(struct cell *cell,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * Check if there are enough TLBs left for *chaining* to ensure that
+	 * pvu_tlb_alloc called from config_commit never fails
+	 */
+	dev = &pvu_units[0];
+	tlb_count = (cell->arch.iommu_pvu.ent_count + ret - 1) /
+				dev->num_entries;
+
+	if (tlb_count > dev->free_tlb_count) {
+		printk("ERROR: PVU: Mapping this memory needs more TLBs than that are available\n");
+		return -EINVAL;
+	}
+
 	cell->arch.iommu_pvu.ent_count += ret;
 	return 0;
 }
@@ -434,13 +442,12 @@ int pvu_iommu_unmap_memory(struct cell *cell,
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
@@ -455,13 +462,10 @@ int pvu_iommu_config_commit(struct cell *cell)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201030122712.4199-1-nikhil.nd%40ti.com.
