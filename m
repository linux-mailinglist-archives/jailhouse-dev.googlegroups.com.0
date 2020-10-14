Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWXNTL6AKGQEJMV5RQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id E542A28DB50
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:14 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id c204sf364534wmd.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664154; cv=pass;
        d=google.com; s=arc-20160816;
        b=XHXDQUNeobX5owZj8zI8ndC3Cp3ehvXjueIW2KtzTtCouutZ0/5luF2rwec4fRd6M/
         /F+3nJgoEz8VfQzAJwLlgs8VJQt7AX15m+u0hfiRs4FcZfBEAst+1ndh0t7l7KWsA69H
         6WKGOtRTHaqEVv6hI3sag8PAg7RIH5H1CwemL0np06WR6rbiXuh7Se3DP8z9WJ5JVmM+
         YIrqyBR5f1PCWU5iN0spcFichF/E3Ltdoyu/sDgo4iEb+Il3g+gg0gd54dR7wndObacg
         yoLBp/2UWlTD8SxClN0WNga14VMgrGJrb8/nwH0rmeyheWgKOvj1OS7wNPIF9Km6XV76
         yV2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=8AzyfH6ZUzcL3Y2gamCKu/ue6xtmxKvL+qfcLRbP8DY=;
        b=uW2LOKaImO0QFtWiyuwrvuwBbmZHIJ2fec1AD8Dy16sH6t3OKVRbFiw3wiTYfJAkMy
         2w22GoNij7vi/1oWKO/4Cf4Q7XTbERz1o8ufywATn69c5nHd4jCC4tBT/3Bd/wNMPcro
         oizZUZbkSvw/UVUrRxGu1mIphBbWY3KAm2XkyAkgP73yNHO7DIiwjDBWfiM2KqcAvMd1
         SyXzKE6F+NFP/OdKV6TjOTZJ+kqahch2MhSB4pjW5fqLLLURWxghp8yeRk9n1ncksfLo
         DmhB4+Nuixv2XswaeCAxTxJeWto0sLyPECcXB2lerQkDtxOZyrRWMqTJBgvljaz+X64h
         XlkQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8AzyfH6ZUzcL3Y2gamCKu/ue6xtmxKvL+qfcLRbP8DY=;
        b=l755fUzld0lRLtEK21vVaC6HfXOWrf7a0Q/r9pTEq34CtPYnTZMOm5Wo1e1Ne5sUpw
         KCM3uBs6UDJwTLv2lmLK+wZTZIgO7IqXiEmTLV+plmCqtsYYcm/f4+VMrn9KyE7kxpsv
         ZcxQcCeMbzwqlgb40UvdDs1duEyv9FRRtQn3v+XPSVLAlLIuqRs2gBqsSLU/V6d9QDfR
         3RhkeIP/Wt/eZUViG+dr0qmh+tOiuaxZkL4QkOixQumiBbW/SyKzkSzX53mCz0lulAA8
         uXTsji3P5plt5YE3uRa3GMs7SBD05WX64Z1eOtfxpIGEQwSzX+RJE8ztE1nTyL+pDzjY
         vNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8AzyfH6ZUzcL3Y2gamCKu/ue6xtmxKvL+qfcLRbP8DY=;
        b=CTCQhI4W/CnKku8fI7YcO8At83ZVmtd+vwFPZJmqNG3N31BEx6POxth6EaD272ngGd
         HDgp35Q2rmZs/6F7yJ5ax3ccUxxnsJoMnWC5aAdmeRu49o5poXNVjKECZOgqQ3y4XNbk
         7n9SLQGDpQzcTTSha4SLKo+9vxQ89KGDRFwfX16gA313a8QF8+2QeJL7FqKnz40HOl1q
         ZTcoyHgHruNU/nrPpSr0cBXmognIMZGgGdO2Z5kkZdIcRCJhz3zyNjgzQjMCfWSYJY67
         UP+joJYy08eXkpuJuv8m6bICiCOqK574XxpwtpUYLYOiJMmEvsx92yM3hPeRo3LukLoW
         V06g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533vknmd3P+ivVNzOChKQTVCIjKPdPy5pETYdlg8S2buEV6Nypa2
	tp/vEWO/59OK/RI9rbdFBeI=
X-Google-Smtp-Source: ABdhPJyZOEIBdNQuvpBiSJEDlz6QKMQBtn3euCLQwH61jxR5Te6l9f2iV7KrFr4jIPGfdalka600HA==
X-Received: by 2002:a1c:9dc4:: with SMTP id g187mr2315780wme.79.1602664154651;
        Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:cd8c:: with SMTP id q12ls3185038wrj.0.gmail; Wed, 14 Oct
 2020 01:29:13 -0700 (PDT)
X-Received: by 2002:a05:6000:c5:: with SMTP id q5mr4391940wrx.175.1602664153552;
        Wed, 14 Oct 2020 01:29:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664153; cv=none;
        d=google.com; s=arc-20160816;
        b=B8FXcTs0XXxTto+ke+w6ezgz/G6uQZpmPlHFOGvGLedZxdo+JFNgnW5xw2suqlJdk+
         vswwlHLJm5xt5bjF/UPCpqKAjUF0vxc0bx0JOd4jMkdnFVd2CqHgWWBnyf45JI2qvkFN
         B419LN8zH8AcmfnEElYtOCT0q7xUsfzEiidcNIKSYtLwzVfDaxZoanGtn2j2cLzg8/h8
         K663J7xo3cQpZ0OECQeH3ltWV5vxJZ882MlwPpboxBguQmnvZoPXs1zU44deU+9CmppZ
         Vi8OqTjuiWg+cxyhQNofld/dOTYFDESAN9QC2Jok+whSLamJP5KFZ2v7utbPaYtZwNj7
         E37A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=gjEuO68itfRDxBrk9JME6oc8+AZg7KbElxgVyQg4QAQ=;
        b=xhth2YdLli0J7t3LN0uMxako3XtVeE9RBDiipXN6DIBJ+me608zkXbiEYZXv+EtjYW
         65o9UJrxRLTznJZUvco69dh+Kv1juEadaUaR6VoTEcK8vzi7eWi2aNE+Tic0KEMCJRq5
         O7/FsdFonJ/ijy1Uz2d+AM7sKiEGryX9GQFLeK7th3SZx3b5HOaDmI7zTc+PHN2OLKzU
         BoeA6lsyO2mRxdYuz709gAmfPtGYvSmXIJzGeg2YZXdlrh5D+l7hudVgyJr8+uTjoZJz
         3ZvNSNhFmVYWj3UyjHyJ4QCqD6qyJRelJxNFwRH+KmrHiDj1njbQP6CnSRxcBfcepjX1
         GIkA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id o16si58078wrv.1.2020.10.14.01.29.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09E8TDvw021635
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:13 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAIt002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:12 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 09/46] arm64: smmu: Refactor smmu device setup and usage
Date: Wed, 14 Oct 2020 10:28:33 +0200
Message-Id: <bd27473d4f21b7a56e190b9c66e66e012d567231.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

We only need iommu_units from the system configuration during setup.
Afterwards, we work solely against entries of smmu_device.

Rework the usage of the latter by filling the smmu_device array
independently of the iommu_units and iterating over the former later on.
Introduce an iterator macro for this. Helps to simplify the code.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 117 +++++++++++++++++------------------
 1 file changed, 56 insertions(+), 61 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 938139d0..9b3d59fb 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -285,10 +285,17 @@ struct arm_smmu_device {
 	unsigned long			pgsize_bitmap;
 	u32				num_global_irqs;
 	unsigned int			*irqs;
-} smmu_device[JAILHOUSE_MAX_IOMMU_UNITS];
+};
 
+static struct arm_smmu_device smmu_device[JAILHOUSE_MAX_IOMMU_UNITS];
+static unsigned int num_smmu_devices;
 static unsigned long pgsize_bitmap = -1;
 
+#define for_each_smmu(smmu, counter)				\
+	for ((smmu) = &smmu_device[0], (counter) = 0;		\
+	     (counter) < num_smmu_devices;			\
+	     (smmu)++, (counter)++)
+
 static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
 {
 	struct arm_smmu_smr *smr = smmu->smrs + idx;
@@ -811,33 +818,26 @@ static bool arm_smmu_free_sme(struct arm_smmu_device *smmu, int idx)
 
 static int arm_smmu_cell_init(struct cell *cell)
 {
-	struct jailhouse_iommu *iommu;
 	enum arm_smmu_s2cr_type type = S2CR_TYPE_TRANS;
+	struct arm_smmu_device *smmu;
 	struct arm_smmu_s2cr *s2cr;
 	struct arm_smmu_cfg *cfg;
 	struct arm_smmu_smr *smr;
+	unsigned int dev, n;
 	const __u32 *sid;
-	unsigned int n;
-	int ret, idx, i;
-
-	if (!iommu_count_units())
-		return 0;
+	int ret, idx;
 
 	/* If no sids, ignore */
 	if (!cell->config->num_stream_ids)
 		return 0;
 
-	iommu = &system_config->platform_info.iommu_units[0];
-	for (i = 0; i < iommu_count_units(); iommu++, i++) {
-		if (iommu->type != JAILHOUSE_IOMMU_ARM_MMU500)
-			continue;
-
-		s2cr = smmu_device[i].s2crs;
-		cfg = &smmu_device[i].cfgs[cell->config->id];
+	for_each_smmu(smmu, dev) {
+		s2cr = smmu->s2crs;
+		cfg = &smmu->cfgs[cell->config->id];
 
-		if (smmu_device[i].features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
-					       ARM_SMMU_FEAT_FMT_AARCH64_16K |
-					       ARM_SMMU_FEAT_FMT_AARCH64_4K))
+		if (smmu->features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
+				      ARM_SMMU_FEAT_FMT_AARCH64_16K |
+				      ARM_SMMU_FEAT_FMT_AARCH64_4K))
 			cfg->fmt = ARM_SMMU_CTX_FMT_AARCH64;
 
 		cfg->cbar = CBAR_TYPE_S2_TRANS;
@@ -847,16 +847,16 @@ static int arm_smmu_cell_init(struct cell *cell)
 		cfg->irptndx = cfg->cbndx;
 		cfg->vmid = cfg->cbndx + 1;
 
-		ret = arm_smmu_init_context_bank(&smmu_device[i], cfg, cell);
+		ret = arm_smmu_init_context_bank(smmu, cfg, cell);
 		if (ret)
 			return ret;
 
-		arm_smmu_write_context_bank(&smmu_device[i], cfg->cbndx);
+		arm_smmu_write_context_bank(smmu, cfg->cbndx);
 
-		smr = smmu_device[i].smrs;
+		smr = smmu->smrs;
 
 		for_each_smmu_sid(sid, cell->config, n) {
-			ret = arm_smmu_find_sme(*sid, &smmu_device[i]);
+			ret = arm_smmu_find_sme(*sid, smmu);
 			if (ret < 0)
 				return trace_error(-ret);
 			idx = ret;
@@ -865,20 +865,20 @@ static int arm_smmu_cell_init(struct cell *cell)
 			s2cr[idx].privcfg = S2CR_PRIVCFG_DEFAULT;
 			s2cr[idx].cbndx = cfg->cbndx;
 
-			arm_smmu_write_s2cr(&smmu_device[i], idx);
+			arm_smmu_write_s2cr(smmu, idx);
 
 			smr[idx].id = *sid;
-			smr[idx].mask = smmu_device[i].arm_sid_mask;
+			smr[idx].mask = smmu->arm_sid_mask;
 			smr[idx].valid = true;
 
-			arm_smmu_write_smr(&smmu_device[i], idx);
+			arm_smmu_write_smr(smmu, idx);
 		}
 
 		printk("Found %d masters\n", n);
 
-		mmio_write32(ARM_SMMU_GR0(&smmu_device[i])
-			     + ARM_SMMU_GR0_TLBIVMID, cfg->vmid);
-		ret = arm_smmu_tlb_sync_global(&smmu_device[i]);
+		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID,
+			     cfg->vmid);
+		ret = arm_smmu_tlb_sync_global(smmu);
 		if (ret < 0)
 			return ret;
 	}
@@ -888,38 +888,31 @@ static int arm_smmu_cell_init(struct cell *cell)
 
 static void arm_smmu_cell_exit(struct cell *cell)
 {
-	const __u32 *sid;
-	unsigned int n;
-	int idx, i;
 	int cbndx = cell->config->id;
-	struct jailhouse_iommu *iommu;
-
-	if (!iommu_count_units())
-		return;
+	struct arm_smmu_device *smmu;
+	unsigned int dev, n;
+	const __u32 *sid;
+	int idx;
 
 	/* If no sids, ignore */
 	if (!cell->config->num_stream_ids)
 		return;
 
-	iommu = &system_config->platform_info.iommu_units[0];
-	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; iommu++, i++) {
-		if (iommu->type != JAILHOUSE_IOMMU_ARM_MMU500)
-			continue;
-
-		mmio_write32(ARM_SMMU_GR0(&smmu_device[i]) + ARM_SMMU_GR0_TLBIVMID,
-					  smmu_device[i].cbs[cbndx].cfg->vmid);
-		arm_smmu_tlb_sync_global(&smmu_device[i]);
+	for_each_smmu(smmu, dev) {
+		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID,
+					  smmu->cbs[cbndx].cfg->vmid);
+		arm_smmu_tlb_sync_global(smmu);
 
 		for_each_smmu_sid(sid, cell->config, n) {
-			idx = arm_smmu_find_sme(*sid, &smmu_device[i]);
+			idx = arm_smmu_find_sme(*sid, smmu);
 			if (idx < 0)
 				continue;
 
-			if (arm_smmu_free_sme(&smmu_device[i], idx))
-				arm_smmu_write_sme(&smmu_device[i], idx);
+			if (arm_smmu_free_sme(smmu, idx))
+				arm_smmu_write_sme(smmu, idx);
 
-			smmu_device[i].cbs[cbndx].cfg = NULL;
-			arm_smmu_write_context_bank(&smmu_device[i], cbndx);
+			smmu->cbs[cbndx].cfg = NULL;
+			arm_smmu_write_context_bank(smmu, cbndx);
 		}
 	}
 }
@@ -927,38 +920,40 @@ static void arm_smmu_cell_exit(struct cell *cell)
 static int arm_smmu_init(void)
 {
 	struct jailhouse_iommu *iommu;
-	int err, i, num = 0;
+	struct arm_smmu_device *smmu;
+	unsigned int n;
+	int err;
 
-	iommu = &system_config->platform_info.iommu_units[0];
-	for (i = 0; i < iommu_count_units(); iommu++, i++) {
+	for (n = 0; n < iommu_count_units(); n++) {
+		iommu = &system_config->platform_info.iommu_units[n];
 		if (iommu->type != JAILHOUSE_IOMMU_ARM_MMU500)
 			continue;
 
-		num++;
+		smmu = &smmu_device[num_smmu_devices];
+		smmu->arm_sid_mask = iommu->arm_mmu500.sid_mask;
 
-		smmu_device[i].arm_sid_mask = iommu->arm_mmu500.sid_mask;
-
-		smmu_device[i].base = paging_map_device(iommu->base,
-							iommu->size);
-		if (!smmu_device[i].base)
+		smmu->base = paging_map_device(iommu->base, iommu->size);
+		if (!smmu->base)
 			return -ENOMEM;
 
 		printk("ARM MMU500 at 0x%llx with:\n", iommu->base);
 
-		smmu_device[i].cb_base = smmu_device[i].base + iommu->size / 2;
+		smmu->cb_base = smmu->base + iommu->size / 2;
 
-		err = arm_smmu_device_cfg_probe(&smmu_device[i]);
+		err = arm_smmu_device_cfg_probe(smmu);
 		if (err)
 			return err;
 
-		err = arm_smmu_device_reset(&smmu_device[i]);
+		err = arm_smmu_device_reset(smmu);
 		if (err)
 			return err;
 
-		arm_smmu_test_smr_masks(&smmu_device[i]);
+		arm_smmu_test_smr_masks(smmu);
+
+		num_smmu_devices++;
 	}
 
-	if (!num)
+	if (num_smmu_devices == 0)
 		return 0;
 
 	return arm_smmu_cell_init(&root_cell);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bd27473d4f21b7a56e190b9c66e66e012d567231.1602664150.git.jan.kiszka%40siemens.com.
