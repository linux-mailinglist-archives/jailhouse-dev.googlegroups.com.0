Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBJ54476AKGQE42LVW4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C28A29D244
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:10:00 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id p129sf73180lfa.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:10:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919399; cv=pass;
        d=google.com; s=arc-20160816;
        b=lfkofkoU84hpasp33rBnS3yCJRe39jfSXxpGNG04RFMaLCdKOqxmspG3/1MrQqyAL+
         5XYrFub1gvfokNiOscfs8bixT7hglH4SDsRRIJ/AlTklQnD/kWvEtfOcaaPtx6l8MA0z
         gNwUFbpmJgjmiBbiDnFmEfw25X71zo3shD7IAZRFQyeqqMA1bqazVmp2HJHS/v372wZV
         MMXA775Zo2b+zLuyBYD6fGxEq4x9hWradK4WdTc2PJCMx/2HqeU/JCw1hKlyDWR4JwXF
         wNVr3P2H6vQBaj8eHSgfwa45JpHiTX6jbJP0wh9UgJTchja5aV3dFfnrIi2xQfZjdUjQ
         EfHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=RVy4M8jG31Gyf12o6jAbbEWcFG+yCcHoxaex2TWvvbY=;
        b=MdQhCiXWI9uPyq42HcbfFwEGLaSj2hxiPhOd8c+4oK2yLT6mSPNppF+NvnUKAu82q9
         L0Tb9CQc9lgLv9oOqMifIyVlSmzwbc7IQudq0Kj3Wsys02OqOJ8kzF+VoTxOWd+ttCmZ
         EU12WgO9NKVQMhVTh3CDgb3t6JGW6HlFLMhH2mcqh21WvyxFc4AaTaQpQspNf8XQyVor
         OhIghrEfcFwrt+vv+ONHLP1mu07OK/1vzaDvd8hWua9bCbIZwDGmTXaA6x5VrlBKRKbC
         Ss/x4vqOoeKGvflxvfLTF2q9qMkdELxmhX8ipIi5HpBW+sOpqnpU68IVFr/0sx5SKXcV
         N0Gg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=zVxzx9qo;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RVy4M8jG31Gyf12o6jAbbEWcFG+yCcHoxaex2TWvvbY=;
        b=qGWOGSRk5SiNFL7Z3ozKCN8lcdTVCJRAtfVmapmJ+XYF5sHVR+BY2J4zZqjWBr0snv
         YP3/ALltmABmhdKyi4pEDL7M77MMLR+y3q95KS4e7NdGWhmqgDCClPHXr9vg8tLvkCR7
         b6XdOGL5Ll+QA+fiBcFZekcoZi1bPcKvWF+O34twqPMdpKVwuH3lQ86hcgQ8xX7ee7Dn
         lPyMidir6j7V/ztV49BwXk6Rst44AdHVN+M7zJfesWu7JgFk5BLnrW6ts8iq8zYUt/0D
         klB9wdsW6bQuAxLJXy9qjTjJRylqF/64pFGdVsyQ0Wbwaz8IQeREFc/U+/YqVrL6rDnM
         gBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RVy4M8jG31Gyf12o6jAbbEWcFG+yCcHoxaex2TWvvbY=;
        b=DAAcffBi3AwC6BFY0Tkm7b8YpE35v3PUBKTYJQS1rNTD8kznGCJoj69FQ6MWbNSZ4k
         tnBfiS+9W//Ggo2MyaZ9viFg/jlHjKhjVwgG4GEtisasZL9pa1h7QtO0e2Jhe4LzXYyA
         f9bJ0O09qISPHoj4FeVdLqSupxVMXMo3QGUTgCC6I2Y05Y5GKViozuM6AcEB54NmqHzm
         jNBWXBm770sni1TrnT2/0mO2caPXow0XZrR6oKv9qbRuxNm/BIw2rfevfZlisuunP3zh
         EMhQw7wkBBqu9T6bCEzRprw5XI4NVJ/pSaruQsg8r3QgQgYNsdfmtLtqB2wiBwvvx/h5
         Jg6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530cTq25ML9/fSbEYWXNbE1ke2GOaJ9+7ZdL/B4OEbgcmZLkQ2dT
	jOL/XwUiv9Gvca2UHF2N7S8=
X-Google-Smtp-Source: ABdhPJzGRA9Pq96DdGH5UXXxpVtHTXYrbLGbfCXLcpVywesfGTKXal9U3pQlTX39cUnO1oTregbxZQ==
X-Received: by 2002:a2e:6a07:: with SMTP id f7mr474279ljc.221.1603919399646;
        Wed, 28 Oct 2020 14:09:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e61:: with SMTP id a1ls269184lfr.2.gmail; Wed, 28 Oct
 2020 14:09:58 -0700 (PDT)
X-Received: by 2002:a19:8955:: with SMTP id l82mr391279lfd.552.1603919398570;
        Wed, 28 Oct 2020 14:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919398; cv=none;
        d=google.com; s=arc-20160816;
        b=pBeXIvMS9GcDdS0NlB76yLlBtZngBgwJ8Oytd1Gux6VXvhFtBlWzeDU6m1IcoCZiyG
         vicM7Ze5qitkprmShb9+w1khVVPyzn4B7PxVxCMtfahfVSn6oAiNQEv+W9OlLGut3sc/
         ZWhtKeaudciWHXr/midK6rVmvuEkWL1puDd4TL6mzqhACGC8Qc4Um+2onC/zMjDjJOFK
         qJdUt8xvJVROOr8HDgNiRxVMRtXLpWqDERSHeaQvsBKLajr5jruwVqU3Lc+k+wPMxwZy
         VMzKWunbDATZvEkbZJDJfgGbg6vItUHJzcml9xa5Sn/sAClFEyDn/Zxo6hFmP6391AZm
         dx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=rx5f1ZwVBoL2HZjVpFXq/waw6C87Zl+MXORihKCRDgI=;
        b=yTKLKvVG0FQH4xW6HKaxcJ9Y2n+yEhDVjgehcrd0u6tbKSnxkLl7SL+tsm7Y1GTlTU
         1r/QJ1z2cGYhaDnjSfRkHbtcNBHAtiP1NGZdmqOPGjjhRFacjzSknFwuTFLX75qTJn+Z
         O/eUupgBFeCd8GLfFTF8ralE6bCK2Av2QG6OM0sDwdVkmBuUSXjiuwqZSILB4+p5WBkq
         zCkCIuJwd4wunLGr0+OFvJ6/WJ0sjfAqG1js9f+gwHHjX0OkJrYWhWF01bXVPiLa8Ujj
         3oLZvbBYTcbES/9qlfLGvueN+l2PIwnTVyV1o6dfYXyirYjj5wAgTI+78FtibKCCEHet
         z+Gw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=zVxzx9qo;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id a1si15844lff.2.2020.10.28.14.09.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CM1Rp0LQZzyT2
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:58 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id TczXzzPODIQf for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:57 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rn48dgzyT0
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:57 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 13/22] arm64: smmu-v3: rename 'i' -> 'n', 'j' -> 's'
Date: Wed, 28 Oct 2020 22:09:24 +0100
Message-Id: <20201028210933.138379-14-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=zVxzx9qo;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Consistently use 'n' for unsigned int iterators, and use 's' for stream
iterator.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/smmu-v3.c | 36 ++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
index 4551c512..d4b7529d 100644
--- a/hypervisor/arch/arm64/smmu-v3.c
+++ b/hypervisor/arch/arm64/smmu-v3.c
@@ -405,9 +405,9 @@ static void queue_inc_prod(struct arm_smmu_queue *q)
 
 static void queue_write(u64 *dst, u64 *src, u32 n_dwords)
 {
-	u32 i;
+	u32 n;
 
-	for (i = 0; i < n_dwords; ++i)
+	for (n = 0; n < n_dwords; ++n)
 		*dst++ = *src++;
 	dsb(ishst);
 }
@@ -612,9 +612,9 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_device *smmu, u32 sid,
 
 static void arm_smmu_init_bypass_stes(u64 *strtab, unsigned int nent)
 {
-	unsigned int i;
+	unsigned int n;
 
-	for (i = 0; i < nent; ++i) {
+	for (n = 0; n < nent; ++n) {
 		arm_smmu_write_strtab_ent(NULL, -1, NULL, strtab, true,
 					  (u32)this_cell()->config->id);
 		strtab += STRTAB_STE_DWORDS;
@@ -651,15 +651,15 @@ static int arm_smmu_init_l1_strtab(struct arm_smmu_device *smmu)
 	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
 	u32 size = sizeof(*cfg->l1_desc) * cfg->num_l1_ents;
 	void *strtab = smmu->strtab_cfg.strtab;
-	unsigned int i;
+	unsigned int n;
 
 	cfg->l1_desc = page_alloc(&mem_pool, PAGES(size));
 	if (!cfg->l1_desc)
 		return -ENOMEM;
 
-	for (i = 0; i < cfg->num_l1_ents; ++i) {
-		memset(&cfg->l1_desc[i], 0, sizeof(*cfg->l1_desc));
-		arm_smmu_write_strtab_l1_desc(strtab, &cfg->l1_desc[i]);
+	for (n = 0; n < cfg->num_l1_ents; ++n) {
+		memset(&cfg->l1_desc[n], 0, sizeof(*cfg->l1_desc));
+		arm_smmu_write_strtab_l1_desc(strtab, &cfg->l1_desc[n]);
 		strtab += STRTAB_L1_DESC_SIZE;
 	}
 
@@ -795,10 +795,10 @@ static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
 static int arm_smmu_write_reg_sync(struct arm_smmu_device *smmu, u32 val,
 				   unsigned int reg_off, unsigned int ack_off)
 {
-	u32 i, timeout = ARM_SMMU_SYNC_TIMEOUT;
+	u32 n, timeout = ARM_SMMU_SYNC_TIMEOUT;
 
 	mmio_write32(smmu->base + reg_off, val);
-	for (i = 0; i < timeout; i++) {
+	for (n = 0; n < timeout; n++) {
 		if (mmio_read32(smmu->base + ack_off) == val)
 			return 0;
 	}
@@ -1046,17 +1046,17 @@ static int arm_smmuv3_cell_init(struct cell *cell)
 	struct jailhouse_iommu *iommu;
 	struct arm_smmu_cmdq_ent cmd;
 	int ret, sid;
-	unsigned int i, j;
+	unsigned int n, s;
 
 	if (!iommu_count_units())
 		return 0;
 
 	iommu = &system_config->platform_info.iommu_units[0];
-	for (i = 0; i < iommu_count_units(); iommu++, smmu++, i++) {
+	for (n = 0; n < iommu_count_units(); iommu++, smmu++, n++) {
 		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
 			continue;
 
-		for_each_stream_id(sid, cell->config, j) {
+		for_each_stream_id(sid, cell->config, s) {
 			ret = arm_smmu_init_ste(smmu, sid, cell->config->id);
 			if (ret)
 				return ret;
@@ -1077,17 +1077,17 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
 	struct jailhouse_iommu *iommu;
 	struct arm_smmu_cmdq_ent cmd;
 	int sid;
-	unsigned int i, j;
+	unsigned int n, s;
 
 	if (!iommu_count_units())
 		return;
 
 	iommu = &system_config->platform_info.iommu_units[0];
-	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; iommu++, smmu++, i++) {
+	for (n = 0; n < JAILHOUSE_MAX_IOMMU_UNITS; iommu++, smmu++, n++) {
 		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
 			continue;
 
-		for_each_stream_id(sid, cell->config, j) {
+		for_each_stream_id(sid, cell->config, s) {
 			arm_smmu_uninit_ste(smmu, sid, cell->config->id);
 		}
 
@@ -1103,10 +1103,10 @@ static int arm_smmuv3_init(void)
 	struct arm_smmu_device *smmu = &smmu_devices[0];
 	struct jailhouse_iommu *iommu;
 	int ret;
-	unsigned int i;
+	unsigned int n;
 
 	iommu = &system_config->platform_info.iommu_units[0];
-	for (i = 0; i < iommu_count_units(); iommu++, smmu++, i++) {
+	for (n = 0; n < iommu_count_units(); iommu++, smmu++, n++) {
 		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
 			continue;
 
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-14-andrea.bastoni%40tum.de.
