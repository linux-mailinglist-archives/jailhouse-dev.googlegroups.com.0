Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQVX5D5QKGQEAV2MSHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D00282CD4
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:18 +0200 (CEST)
Received: by mail-ej1-x637.google.com with SMTP id s20sf2373980ejx.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838018; cv=pass;
        d=google.com; s=arc-20160816;
        b=MCI3YuAhLVba9cZJOOcl9M1Vlcz8aBybWWMkTcyllrR3P5Da89T7lsQRyRpz79/9D8
         VDDUjdBhNNAAAi0pvGWZXZMkxEpseYNPgZ7nE0qG5LQxsPKmbd8FT0qGaNhcWbsg8vDJ
         gyYHK1FqZrhHSrj+nRVikSINs8H7ez1jwnnzO2zmKSZ95LP0KriF2xQhKbRnypvcJm8u
         stdnOgwrZ0rF73GXpEmtg4b4G5MJ6G44Xvcn15sPn3J7iXP7eloiGh/1q/+OCQYnEA7K
         ryMtZLONm3pyRh/ySYwDiqye87ZO/nhiITQfjeQRSBlVkzYzRtrz1CjRJQzeqpz4UOoA
         Eajg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=gYcSmiuHw9J+Y8qmmPdSoNRG86Mn6kdIwW5s3PXwbk8=;
        b=bs79SncA2rFffRQ1DW4dlr9R19dbd+UzRxoiBFRBMxme/hSMUpSkOK1x7HFrDhCQZS
         1xZB/B0Y7BjsLEdElMif6d/huIjd1HdyTuBeLAlTjuWCqGU6Bz+5MaKKj4UkHun08QpZ
         qErMPFRcg57NsMHasBLveYCwXZ3pqsd5RCI2KMGPsLRG3HSUSoao1R+jNwvGqnRldGsB
         n6k9ofQhJKj8u3uFRZPxBOtzOEYPf9RvuLZirzMTAqYF7ca5JTOuvwVDWbfcPr87Q/vk
         U4DdL9VzEBJSnXRsr407zagWLdm0d6eRInqMvX+gGdZe2wJun1WPxnOcQq9xVf72FvgP
         eA6A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gYcSmiuHw9J+Y8qmmPdSoNRG86Mn6kdIwW5s3PXwbk8=;
        b=j47S8d1WmIpW0STX2Lse5jeYHqYiUqTfecnhBt35CyTJOFhzBRK5ChcUBvZaLRXLt9
         SAIxVlLrwVzTv6aBE6ULH6oQFhrvr7tdIO5ktp0NZi7cbxWVWvQpV/883XH6zrvCP+qg
         ulXloKG4FY6McUfDaM7mhZfeLQlOM9juynJTKQ2ejMnGUnto2MJ/pwQwbn+QfkYDbYuC
         0XGYCCMLVDGg55az7hkhCsYpJp6aMxg9avLCLtK3Z9XQLkauM3iWwh9nzF8igCOzxtJC
         R2Cx6yPQb+xoD6n5o3tu+PcfchhceThrlerkP1CyKjUv9GFGY9VNHSX0FiNZU/GLXLav
         FH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gYcSmiuHw9J+Y8qmmPdSoNRG86Mn6kdIwW5s3PXwbk8=;
        b=V58A/1Txjyy4vD6cFvVIbCr8RHgWdVPSUVyzYrZLISpGhk5VywcVsmI5icIWeNSJ3U
         G36KKakynIBpiLYBneJzBNPOamobszab3cy/INRrjwGDlZR/CrV8fQGJwdxmTgwoqpjM
         LmWsC1W3uh+Mj6qAWqU//WRheU8lNHtAbcM891da/kK1yvkZmiMR/WiXU6V2pT+zmG9u
         8x0u2bNFC/HGV4VzFD9L6nEJ8AY+V+sRuf5hcdVvrletzCl7+YQmj1n4/RS2OHikZ8gd
         5hZy6Fr32wXCWGlpFMk/3tRyM+nXtq2yyrCqu1R57aG1cAsbs0YlcFPXqeqJjmrVYFUK
         ypSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532k/i2w9F2dxcr1c9aspjTVVJXyCI9ruKtIMECbMn+JQJ1m4GVC
	sKelDmHdOqAyXBRyjwbfhAw=
X-Google-Smtp-Source: ABdhPJy1NVOWEf91yPBvPGoAD4f4L9DPbQzFrdAbsAEkbSyw4l1x+RVPkEbgtPoObCNQWo71gBj4/Q==
X-Received: by 2002:a50:88c6:: with SMTP id d64mr13757387edd.141.1601838018664;
        Sun, 04 Oct 2020 12:00:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d19b:: with SMTP id c27ls3145484ejz.1.gmail; Sun, 04
 Oct 2020 12:00:17 -0700 (PDT)
X-Received: by 2002:a17:906:b216:: with SMTP id p22mr12138322ejz.228.1601838017520;
        Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838017; cv=none;
        d=google.com; s=arc-20160816;
        b=kSdNJ8fR09x4POMcR+U7sDl9OyugeWTxJqPtA/YzdKTk8hQKjXto7v9YdHVWUaAxnO
         n/9oC0FwWky9sMPclAIDva6xz9RUBgziOviwSLBbVbFllSZ8nPY4y4y/ONICU5/3nkR9
         gZKfGVTjWMIVU6hlgRB+Ddj84P9zVXdpmbVYP4OnHloC7P3+ukX0CKUPclALsfgFWI7z
         z45js7Uyl5CSslid88skxsEgP7TR4QervQrfpBlT28nrkbo6hV4mBr+mIiP6xBPULWHj
         RpC+ex6eLieit2xRrtZ98ElcmrEsieGaWKhQUCzagBia+ljSGniKYJ2TctMVWtGazno/
         ejTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=JRIye4zkRIW1CImg3VU0E3rarZtdiLIx+mj8EEt7I1M=;
        b=dhFBRjEfLaSKUW52w4OE08bfUfPbdhVU6oOMjsyqbTmZzv2Ik6/suDK9gztkY7DAYK
         7txsuV5GjoJhYhajh0MKsSI4FTUge6G9KQl5RMSO9HOkBjSnrh+MMsUy7INFtGnedjw0
         axk15A6r+3nPk1Tq1CIZfqJ/ctHGyD3+/AdFnE7Du5c0BaB8UI68BS5/oEOK5qFsN/Kf
         8VEDAhkPZaAZg3W6+XwXSrAZfCHiZ7iuHApupAmmc0mgMiJ4hKbRLEKvpILvHy1nQxI9
         g+PeffhgkcKt3DJN2D3s0q1GAnSLabY5xtNeDfELCNg5Cv/3BuhFQCjpBLRcCPXgF4OM
         eC9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id a16si322016ejk.1.2020.10.04.12.00.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0HBb020557
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:17 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060t017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:17 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 43/45] arm64: smmu: Stop caching context bank states
Date: Sun,  4 Oct 2020 21:00:04 +0200
Message-Id: <a2f56df7423b6277b6162aae62c80b98956af7d0.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a2f56df7423b6277b6162aae62c80b98956af7d0.1601838005.git.jan.kiszka%40siemens.com.
