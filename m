Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYXNTL6AKGQEVOMGEYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D61C28DB73
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:23 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id s17sf137441lfs.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664163; cv=pass;
        d=google.com; s=arc-20160816;
        b=Nhi1JiHamKaQFRu7l6hTER+7tucClxjfenzl/sSLJOO8RwiljR1+66IFxWg56j3KSV
         r+iMmpvuf0lVzrkXwsF6zuTDIjDPJlm+rhFOpW6Yjt91rPA7EPXn8NMoButQMVvbY9br
         B/ppH8i/BGLA7yGHcE5D2Bsz/h3nPcMiI4xJr2at/BAoLPQHQe/3oAAYX9YzBzsLnLxW
         18jrAEbEi32DO5p/WmgOxSeQsVdG/AMfDolzDG0BsXTy5gyNUIr8v+AK5TCTFIPt/MPH
         uctnCwSAtkmoPuKJeIfmx9Sic8+SeXv7vCRNGQAcKHBUWGcrvIQowAMe3dSFKDK2mPdH
         h9XA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=2zKqZPWu1vNLPUc2ZMSDUkqM1+bGyoQYwZmdviPN1j8=;
        b=tHYGlBJWxTfCLovm25EmP26pIyXGsAe76/xGtCKBDMmCS28HwfGhUgUeTensj+vVUT
         rZ8tI6w5uF/IrJ1clchrUvJb6h6hQV4TVs6h4Tu7bSdkiORBlekQQWfGXmAegxTgLNla
         rTVhEy9DsX90I6579tbnthqZtPBed1LKZ6ZzCDURkBX9/sWRrgaKYCSZdq2Wj6DJASP4
         oczvlzpwhNgakyn/b4QyyZ4o5GKStnkDNvqBPTXuLRJQ+ycYD0fD6B4/5vLG1kJPh0qk
         KMZqv404Ln2WTypyTSK+vIer8KaME2v1hmubM0RXQtyrGLBRScb+Rs46C1eXoAqrCeCj
         9cDA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2zKqZPWu1vNLPUc2ZMSDUkqM1+bGyoQYwZmdviPN1j8=;
        b=O48Hb9i5JDKQ7ikHKhnH5RcRBo9of7W88iq9LVWCdHe2VNRcLTYugxKFWPDetHOyVC
         8EWIbnhSToSv1qMmYodERxGhNODsBaWRLPAFnyXQgttE755eMwiyQ2csiC1Gh7UrpclS
         mepTy6OVpnzM2PodjM9eQ7dEeBdJVRz4w6YN7JmsoGUMeP4J/txRBbul6g79xsdP5Nca
         HllL+/EN40sE6EHKH/Ho3NRxQtkAWWt6IgDGZhUEy7+9+H4Iwq9m5GNrsfmBM8mraseZ
         XUsgRtx04PtZU6l85WSvqyHfnKxB78wwuqUbdZtBsp0YLd1zgEzUty17rGoCmDGGNZ1x
         /ZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2zKqZPWu1vNLPUc2ZMSDUkqM1+bGyoQYwZmdviPN1j8=;
        b=MNbTNYArX4DPHajb6PC056UCPZ32551aDoqKf97weiPjPQZa6MiAKYYDhQMR0BbNEg
         rCfi2Hp+hVYrqtcGjVbLWUJK/07xSMHh5GyzaBIxCHEafsE7Qgabk/KP9XJLgFVZj869
         4F6ROZpSb6va7lkS2oUVARzRutWrL0D+9zgxtOSDXT3d81CNgi/+rNq3A3d5Dh7PG9l1
         0MWEqyHeYyWpjwN5A+BQXOTmKwQW3BcbG1uGpQgfos2hPYj0GVC3TOUUUZclRLi6qA3v
         fhx8N4sNAMro1/x902pBt75+gKv+ZQr8YY/7Izm7XeK9Z2NMpRg15vGkEifsEdhIJn9X
         oWWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531p82MPY5rXbWgLY9kIF94u/e7BvlMiCNPthhYINZ/IFQ8aEeeB
	AqR2g8YSHs/B0nnaWPmUonY=
X-Google-Smtp-Source: ABdhPJzv9EDCBZ7IWQF5HcfzkU825pV1X/PBEyCFoVlNnIY5VjMDNaCtTF5VEPUjnH0STl67xIJSlg==
X-Received: by 2002:a2e:a54c:: with SMTP id e12mr1478149ljn.164.1602664163140;
        Wed, 14 Oct 2020 01:29:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ad43:: with SMTP id s3ls1307574lfd.2.gmail; Wed, 14 Oct
 2020 01:29:22 -0700 (PDT)
X-Received: by 2002:ac2:5a11:: with SMTP id q17mr950871lfn.254.1602664161957;
        Wed, 14 Oct 2020 01:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664161; cv=none;
        d=google.com; s=arc-20160816;
        b=mE8UNR55OU2vGfRE1pXdfg4J39604zheWqQovwhwHHiT1FMN1VjC55V6JSA2UdFCtE
         HWbPywgC9Rr7/aesOjNYepBcpD/W0VMXaMk0DOCsAthb39PfIoGssRyRlKG2mLT9jyKA
         Y7gO2ZBoN5czg0ucdd7z51KsIPL36G8nX9x6gl6pTn241esIx8gFBiiE7cI888sGlAAE
         xWORc8iUowS0DRgXg2uBs1GKFdCnaS7q6NBYOkUUw5KPZ1QzLD1B/obKxLmjdtIpWZ8v
         jTqjx9tUWWSra08v8oVHdvjC7CzF87DGbSpQNF2UvHHd7YZAlemEILYAXB272/Uu1ysM
         jcwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=JRIye4zkRIW1CImg3VU0E3rarZtdiLIx+mj8EEt7I1M=;
        b=lcDs2v4fA38kylsrwkSApEsQ0/AC2XWgK3eDicVPJQ1+Cr7UwCFgB2ostfxOYhfmTE
         W+g8N2E9ULe5SChS3ueagUckvtUIW2yuT+OEenij2DUsE4d/1KtrtRiyxnidiVZD0g82
         zPuKAKzWIXSfxYfQp0llI4Feiuep8Xhb9AB9QoQ0uIlx0DcV2cx1V10VG/J8xHvV+Bw1
         qRzpH2ofXal7ig3nqeQRI3pJ6WbUUU7HQYgdUy+rPc5iVXCwAcCfbSaR+ylqtFQ9vLBt
         67edOXsqVfNM6k05PTN+Ghzdzo+wyAWI1rSRvUoR+QhnzHu6V+XvjgHLcDc9sK9aGdGK
         9hLQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id b4si50658lfp.13.2020.10.14.01.29.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TL4j024025
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:21 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJU002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:21 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 44/46] arm64: smmu: Stop caching context bank states
Date: Wed, 14 Oct 2020 10:29:08 +0200
Message-Id: <4ab1bf619dc6bdb3b1c93b35531db329459a3f57.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Refactor arm_smmu_init_context_bank/write_context_bank to a unified
setup_context_bank that generates the required register values directly,
without the pointless indirection over arm_smmu_cb and arm_smmu_cfg.
This massively simplifies the code and improves readability.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 102 ++++++-----------------------------
 1 file changed, 16 insertions(+), 86 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index eb79711d..25084b16 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -145,27 +145,14 @@ struct arm_smmu_smr {
 	bool				valid;
 };
 
-struct arm_smmu_cfg {
-	unsigned int			id;
-	u32				cbar;
-};
-struct arm_smmu_cb {
-	u64				ttbr;
-	u32				tcr[2];
-	u32				mair[2];
-	struct arm_smmu_cfg		*cfg;
-};
-
 struct arm_smmu_device {
 	void				*base;
 	void				*cb_base;
 	unsigned long			pgshift;
 	u32				num_context_banks;
-	struct arm_smmu_cb		*cbs;
 	u32				num_mapping_groups;
 	u16				arm_sid_mask;
 	struct arm_smmu_smr		*smrs;
-	struct arm_smmu_cfg		*cfgs;
 };
 
 static struct arm_smmu_device smmu_device[JAILHOUSE_MAX_IOMMU_UNITS];
@@ -213,58 +200,28 @@ static int arm_smmu_tlb_sync_global(struct arm_smmu_device *smmu)
 	return trace_error(-EINVAL);
 }
 
-static int arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
-				      struct arm_smmu_cfg *cfg,
-				      struct cell *cell)
+static void arm_smmu_setup_context_bank(struct arm_smmu_device *smmu,
+					struct cell *cell, unsigned int vmid)
 {
-	struct arm_smmu_cb *cb = &smmu->cbs[cfg->id];
-	struct paging_structures *pg_structs;
-	unsigned long cell_table;
-
-	cb->cfg = cfg;
-
-	cb->tcr[0] = VTCR_CELL & ~TCR_RES0;
-
-	pg_structs = &cell->arch.mm;
-	cell_table = paging_hvirt2phys(pg_structs->root_table);
-	u64 vttbr = 0;
-
-	vttbr |= (u64)(cell_table & TTBR_MASK);
-	cb->ttbr = vttbr;
-
-	return 0;
-}
-
-static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
-{
-	void *cb_base, *gr1_base;
-	struct arm_smmu_cb *cb = &smmu->cbs[idx];
-	struct arm_smmu_cfg *cfg = cb->cfg;
-	u32 reg;
-
-	cb_base = ARM_SMMU_CB(smmu, idx);
-
-	gr1_base = ARM_SMMU_GR1(smmu);
+	/*
+	 * We use the cell ID here, one cell use one context.
+	 */
+	void *cb_base = ARM_SMMU_CB(smmu, vmid);
+	void *gr1_base = ARM_SMMU_GR1(smmu);
 
 	/* CBA2R */
-	reg = CBA2R_RW64_64BIT;
-
-	mmio_write32(gr1_base + ARM_SMMU_GR1_CBA2R(idx), reg);
+	mmio_write32(gr1_base + ARM_SMMU_GR1_CBA2R(vmid), CBA2R_RW64_64BIT);
 
 	/* CBAR */
-	reg = cfg->cbar;
-	reg |= cfg->id << CBAR_VMID_SHIFT;
-	mmio_write32(gr1_base + ARM_SMMU_GR1_CBAR(idx), reg);
+	mmio_write32(gr1_base + ARM_SMMU_GR1_CBAR(vmid),
+		     CBAR_TYPE_S2_TRANS | (vmid << CBAR_VMID_SHIFT));
 
-	/*
-	 * TCR
-	 * We must write this before the TTBRs, since it determines the
-	 * access behaviour of some fields (in particular, ASID[15:8]).
-	 */
-	mmio_write32(cb_base + ARM_SMMU_CB_TCR, cb->tcr[0]);
+	/* TCR */
+	mmio_write32(cb_base + ARM_SMMU_CB_TCR, VTCR_CELL & ~TCR_RES0);
 
-	/* TTBRs */
-	mmio_write64(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr);
+	/* TTBR0 */
+	mmio_write64(cb_base + ARM_SMMU_CB_TTBR0,
+		     paging_hvirt2phys(cell->arch.mm.root_table) & TTBR_MASK);
 
 	/* SCTLR */
 	mmio_write32(cb_base + ARM_SMMU_CB_SCTLR,
@@ -376,10 +333,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 		printk(" stream matching with %lu SMR groups\n", size);
 	}
 
-	smmu->cfgs = page_alloc(&mem_pool, PAGES(size * sizeof(*smmu->cfgs)));
-	if (!smmu->cfgs)
-		return -ENOMEM;
-
 	smmu->num_mapping_groups = size;
 
 	/* ID1 */
@@ -402,11 +355,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	printk(" %u context banks (%u stage-2 only)\n",
 	       smmu->num_context_banks, num_s2_context_banks);
 
-	smmu->cbs = page_alloc(&mem_pool, PAGES(smmu->num_context_banks
-			       * sizeof(*smmu->cbs)));
-	if (!smmu->cbs)
-		return -ENOMEM;
-
 	/* ID2 */
 	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID2);
 	if (ID2_IAS(id) < cpu_parange_encoded)
@@ -466,7 +414,6 @@ static int arm_smmu_cell_init(struct cell *cell)
 {
 	unsigned int vmid = cell->config->id;
 	struct arm_smmu_device *smmu;
-	struct arm_smmu_cfg *cfg;
 	struct arm_smmu_smr *smr;
 	unsigned int dev, n, sid;
 	int ret, idx;
@@ -476,24 +423,7 @@ static int arm_smmu_cell_init(struct cell *cell)
 		return 0;
 
 	for_each_smmu(smmu, dev) {
-		if (vmid >= smmu->num_context_banks)
-			return trace_error(-ERANGE);
-
-		cfg = &smmu->cfgs[vmid];
-
-		cfg->cbar = CBAR_TYPE_S2_TRANS;
-
-		/*
-		 * We use the cell ID here, one cell use one context, and its
-		 * index is also the VMID.
-		 */
-		cfg->id = vmid;
-
-		ret = arm_smmu_init_context_bank(smmu, cfg, cell);
-		if (ret)
-			return ret;
-
-		arm_smmu_write_context_bank(smmu, cfg->id);
+		arm_smmu_setup_context_bank(smmu, cell, vmid);
 
 		smr = smmu->smrs;
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4ab1bf619dc6bdb3b1c93b35531db329459a3f57.1602664150.git.jan.kiszka%40siemens.com.
