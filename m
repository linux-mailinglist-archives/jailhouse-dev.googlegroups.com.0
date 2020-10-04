Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPNX5D5QKGQE3GZJ3PA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E723282CC0
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:14 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id d23sf795194ljg.21
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838014; cv=pass;
        d=google.com; s=arc-20160816;
        b=EIzi08DahZGkAjb5l8ZnmiqAFoYOziuOVEFYdY3vjjpI74lZ4LF5nO6xBZvqO2+mJN
         i++y6DFygrxfybXHG3R5pGNq/spaO40Lj37Im6610kokJHYN7gmT/ItAxweOrbirW4N8
         jZt84YPqAf9O0uiddQP2eShe+yTaMwFUXYpElFJPnSm2jZF+0RPPd0A0ROhV4QzbNyzi
         jJMO3TQptFMVTPbicA5EZc1X5VK3c5Qe7+2F3kXf10+IXXrBQlStiX+j8X92UncTTZP/
         D0x9j4J8qRS0HFH8EY6/QobCEy8GtWXr66k86NmgWpZlkW2wZLpAcaBlKuZMa1iyNDrv
         /l+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=wRVvAPGJlu9IE1zMJ2m8Z1o6S+XSkOJNkrthbNbfEgU=;
        b=fSrmQGt2d/H461tc1u+sN1i6jmo/ECpwnRtsul7L9Ct1Bxp+bYS6TdvaerE33OYte1
         KCSjeC6iyhviskc4Qv/NatjOmZ128U94FOB71WbaUYnowWF654LvkIjZf+BswCIiKXTa
         FodomqBudRj+X31y4tFe3iycRgo5PKZABD1SYELwXgaHkpjRS75DYs+JbgNTU70+OzW1
         xBjs3r8kBP9/XzB09MeBFZgRlbgE43uqPQcgguDp6nRAtclFdTHKUtsGuMuwiU1D5N2Q
         cKJ90F05oKhEUQ2jrB5MevGgJPxPL3qVamiaD1Rc0UrmTWU2EDeIAQ5Lb6spW81WYCtP
         zujQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wRVvAPGJlu9IE1zMJ2m8Z1o6S+XSkOJNkrthbNbfEgU=;
        b=NcIBVJkx/d0T1h6cch1lSWWQL/OpCHWQo8e/+NX0zkxq8cdJfPx9JXwIh4N3Iwilqm
         oMx0aidk4Cc2qzQkMk5XRwYMABoXALWFEw8TPQ2egLDUwYjGA62wr715URmRtriyy1bH
         Uju/tLa9zF31s9TBO27o9XQExcSczk5xvcSVodv5w5rHDP6185T+rJT9Hv/BVjPPF/I2
         /YmFYBSbiT6e0ui6rz4oUAO4VaRDzZufNvN8QdoHqTeZwP0lJfVATEq0LBl3OcEp/9RA
         vZY6RePqoqrYoX7M8TvYq2slx/moHd87FZSsTIDkRSxPAzkACdj2DkBrM+3o2YVeh+fA
         4bBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wRVvAPGJlu9IE1zMJ2m8Z1o6S+XSkOJNkrthbNbfEgU=;
        b=Zq82pcS5UVgAmCzsbv7P+QHkPR8ZV4R2nQCsgArDSFTUL9p4+WqbRbICIq85kjuBj6
         qKIORk084aNrENMBAhg1RZeBy1KYdz1tNXDpDsHeljlpSlHOlzYESpWTfaGIkbrZ3rY5
         lBQ3AYwtoHllRvUTvrlV/dDDK4er4yY+afYo/l8+8M0kbjCAnzE5E8FUx2pwKaR1Z+RP
         BmescYx+WRYPGfHk9LdGRjA8nWjajqnl1hMgQ6L4fKa20WfFUJzkdO1J1FzyVl6sqEE9
         dwu79QvsA22a+lWy9Cf35svfvWl4GEFpyMh2U/7pQhTzf5NQpOqU1LXyxLmCxUvSEPgH
         M09Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530oaPKZ0U4/33UB0FUSwtp9H+6hnN/9JCBab+LKQUeRYNNrGYjE
	A/TzJs/lB3At3Gnk/UzpZbQ=
X-Google-Smtp-Source: ABdhPJxUVjt1j02yCF9j2onuVj9wVoWMss6hMjVu8H/3qj7vvak/TYg8lky7j/+/9MTw7+Otq22Yvg==
X-Received: by 2002:a2e:8115:: with SMTP id d21mr3430152ljg.16.1601838014188;
        Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:555:: with SMTP id q21ls749350ljp.3.gmail; Sun, 04
 Oct 2020 12:00:13 -0700 (PDT)
X-Received: by 2002:a2e:864c:: with SMTP id i12mr695454ljj.396.1601838012971;
        Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838012; cv=none;
        d=google.com; s=arc-20160816;
        b=pW5k9x9bLoBykXMczO1sOlLrnzSlwgqMjlzRTiqfjuhuZu631tEMAy2vGXDmwU4KgL
         u0w8m8/HKvDSzhkV9Rkh38yjhkt2nNK52fgq68T6P8qrDJhp933RbULwRPML389+7d/j
         2CdxgoskO68QWZKq2kfvD+9QHN/5t6Xvej4CjxsY6ajBfj2AltZI5N+3HK4DoDpcRDzw
         XcY3u7a2++6S8RaQG6vGhjNCqPkwigvpc9eGULYHfY7+sWNWdNdZ6Sj93LET/xu3H42Y
         3Rc+fvOPlmJRKWYwzHIfHvg/GoZdkjL596mw1P2dekPAc2q/d/DmjBsWQICTrofF+IUq
         eycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=BCRkS9ie3ugni5dpzSKYCVLBvo5JHxwvfzziVudKNkw=;
        b=v7WsrNNeIf/hPfI7srV9DcZXW4zB8PQ48n/b2HVJyLpSYZeiqtIQb5vIyRGdsZlAEK
         m7qOzq+7zPaujLItFaNaS9Gm+c8PuvFKH429toaeOKRelmlPtm45/jhxQ6jc74QPY4EM
         hzY3B/XiREUudbVhjmDyj+NnoIZdYhdgYaWgAD/IpH9ha3eQ/zm11cwQqiPkNCEI5twv
         4GyvGSgaQZc+ze/mObPffRhukwTB4SkyLEQaFo6fMtYy48kAeJxgxIyQd8fbOctnej7K
         ZFK0J4rxSFlqVP+dv/TmI0TVNzGzE/fVczaQv11zmBmYMJaffQJJBtYWz5stsh+M3s9x
         JwRA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id x74si196503lff.12.2020.10.04.12.00.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J0CTP025086
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:12 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060W017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:12 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 20/45] arm64: smmu: Simplify VMID and CBNDX allocation
Date: Sun,  4 Oct 2020 20:59:41 +0200
Message-Id: <c99b17c6bdb0b6941d626e81cfdc01efa4418523.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

Leaving VMID 0 free comes from Linux but is unneeded for Jailhouse.
Simply use one ID, the cell ID, for both VMID and the context bank
index.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 37 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 68162607..44cecd33 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -224,11 +224,7 @@ enum arm_smmu_context_fmt {
 };
 
 struct arm_smmu_cfg {
-	u8				cbndx;
-	union {
-		u16			asid;
-		u16			vmid;
-	};
+	unsigned int			id;
 	u32				cbar;
 	enum arm_smmu_context_fmt	fmt;
 };
@@ -313,7 +309,7 @@ static int arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
 				      struct arm_smmu_cfg *cfg,
 				      struct cell *cell)
 {
-	struct arm_smmu_cb *cb = &smmu->cbs[cfg->cbndx];
+	struct arm_smmu_cb *cb = &smmu->cbs[cfg->id];
 	struct paging_structures *pg_structs;
 	unsigned long cell_table;
 	u32 reg;
@@ -402,7 +398,7 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 		reg = CBA2R_RW64_32BIT;
 	/* 16-bit VMIDs live in CBA2R */
 	if (smmu->features & ARM_SMMU_FEAT_VMID16)
-		reg |= cfg->vmid << CBA2R_VMID_SHIFT;
+		reg |= cfg->id << CBA2R_VMID_SHIFT;
 
 	mmio_write32(gr1_base + ARM_SMMU_GR1_CBA2R(idx), reg);
 
@@ -415,7 +411,7 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	 */
 	if (!(smmu->features & ARM_SMMU_FEAT_VMID16)) {
 		/* 8-bit VMIDs live in CBAR */
-		reg |= cfg->vmid << CBAR_VMID_SHIFT;
+		reg |= cfg->id << CBAR_VMID_SHIFT;
 	}
 	mmio_write32(gr1_base + ARM_SMMU_GR1_CBAR(idx), reg);
 
@@ -428,7 +424,7 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 
 	/* TTBRs */
 	if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_S) {
-		mmio_write32(cb_base + ARM_SMMU_CB_CONTEXTIDR, cfg->asid);
+		mmio_write32(cb_base + ARM_SMMU_CB_CONTEXTIDR, cfg->id);
 		mmio_write32(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
 		mmio_write32(cb_base + ARM_SMMU_CB_TTBR1, cb->ttbr[1]);
 	} else {
@@ -756,15 +752,17 @@ static int arm_smmu_cell_init(struct cell *cell)
 
 		cfg->cbar = CBAR_TYPE_S2_TRANS;
 
-		/* We use cell->config->id here, one cell use one context */
-		cfg->cbndx = cell->config->id;
-		cfg->vmid = cfg->cbndx + 1;
+		/*
+		 * We use the cell ID here, one cell use one context, and its
+		 * index is also the VMID.
+		 */
+		cfg->id = cell->config->id;
 
 		ret = arm_smmu_init_context_bank(smmu, cfg, cell);
 		if (ret)
 			return ret;
 
-		arm_smmu_write_context_bank(smmu, cfg->cbndx);
+		arm_smmu_write_context_bank(smmu, cfg->id);
 
 		smr = smmu->smrs;
 
@@ -778,7 +776,7 @@ static int arm_smmu_cell_init(struct cell *cell)
 			       sid, cell->config->name);
 
 			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS,
-					    cfg->cbndx);
+					    cfg->id);
 
 			smr[idx].id = sid;
 			smr[idx].mask = smmu->arm_sid_mask;
@@ -788,7 +786,7 @@ static int arm_smmu_cell_init(struct cell *cell)
 		}
 
 		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID,
-			     cfg->vmid);
+			     cfg->id);
 		ret = arm_smmu_tlb_sync_global(smmu);
 		if (ret < 0)
 			return ret;
@@ -799,7 +797,7 @@ static int arm_smmu_cell_init(struct cell *cell)
 
 static void arm_smmu_cell_exit(struct cell *cell)
 {
-	int cbndx = cell->config->id;
+	int id = cell->config->id;
 	struct arm_smmu_device *smmu;
 	unsigned int dev, n, sid;
 	int idx;
@@ -809,8 +807,7 @@ static void arm_smmu_cell_exit(struct cell *cell)
 		return;
 
 	for_each_smmu(smmu, dev) {
-		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID,
-					  smmu->cbs[cbndx].cfg->vmid);
+		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID, id);
 		arm_smmu_tlb_sync_global(smmu);
 
 		for_each_stream_id(sid, cell->config, n) {
@@ -827,8 +824,8 @@ static void arm_smmu_cell_exit(struct cell *cell)
 			}
 			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_FAULT, 0);
 
-			smmu->cbs[cbndx].cfg = NULL;
-			arm_smmu_write_context_bank(smmu, cbndx);
+			smmu->cbs[id].cfg = NULL;
+			arm_smmu_write_context_bank(smmu, id);
 		}
 	}
 }
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c99b17c6bdb0b6941d626e81cfdc01efa4418523.1601838005.git.jan.kiszka%40siemens.com.
