Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXHNTL6AKGQE3XPJOOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 6958628DB59
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:17 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id g125sf372116wme.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664157; cv=pass;
        d=google.com; s=arc-20160816;
        b=YJeJjKdD/iGDsha//G5i3ystPXeO06R+xbW5Q2aGM+lWglbod3fUYLOaoc1P5fbWrQ
         y3FB7gl1tXCLXFJtIsYb6mfwjj7JjEbAHH1HECF+9V7VXnAspgd+RsKq9HcyNkppndWW
         1S+yvQpW67lOUS1QIh+Q/C5DJLcjyFilKqhENjYFtru+vpwWELUK9sqaEf0E3dFDQjy7
         Kv5CiBJ01t1aWAn00ZKJ9z1MPcx2XOIZkcY7U3qhqfC/k+Hpo2cfvt1F2qVjDDD0qeBn
         XBGlz9hKeEGl9EW6Y6DSKLHIEYLMm2HgOr5HG5+YiupUgRzZAaf6vJIbJpUpzngrbS2U
         v7Lw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=dqMjcmZYRn/kBLXoOntSA85pWhlx7urbVrWRarw5dF8=;
        b=V5OrNgRgrpICFFxzMcngwNlO0G0TAtHDHnxcGon3T0fXI7tpJZ5pmpHzNogYlQJvR8
         c5VU2t2kZoI7NF19Lfa2k3aF1FERp0t/UO9M5bU667YamHgKB7hggzNrOPoqBW+sN+EI
         4pgpKBysKRP4cUF7cS5V8TCxQYAzWc84Ps1WZY8UWLv8+qYLY8dMeB3QjqfPFiIIopVK
         nxeh3mO7bknjTije462vzkddJkQHcJ7LdBbEraILEX4Xtz/yEDPscwG4Vx9k1UWpxY6o
         d1ETweHJ4QBH6/3sZxskHBOXDk6yLj1ibws9i6PiOnCrVwyvzFVovY8f8JoeETggZ0Dw
         44jQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dqMjcmZYRn/kBLXoOntSA85pWhlx7urbVrWRarw5dF8=;
        b=RTGVQ6GMjGeJK8Aq4xi9TG7HYqIWh6BtmxNnr342uZO7uEeNmlmQJApdm2Cl6a4Ayi
         vOa59fE+VUy78ZybyrbdoS4lPZWcS9L7G0/mIJ/J+WSAjDiX8p2FOviVgcs7bWrc2E2z
         iWqMOmLxCN9A4YpD9QtHnEs8US6jRNSNXiuCGKBlx8ZHF4mL7FQobrEkolrJK31FNOMp
         Q2jVnLXqsnFBtYwlN3p99SHUxQTabDFoeWdcVoPNxNN/2Q4eevDKS//ZFHMQOHnAYues
         TIxv7I7qHy9cM3c9WuU6VbnxWoMEoedcmjvH74tIfY4WdhKgRo6a6L2LedCWPHAwQafg
         e4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dqMjcmZYRn/kBLXoOntSA85pWhlx7urbVrWRarw5dF8=;
        b=JdGFNMhZAnthGvGQu/LSaI1Mk2WOvYfxaBOUTLoTycT6WFn5iTefgmKFqoUNxgqjPS
         uI3mcTRp9m4tjVNWjSLKWclpQY6dCN4hHVrtqzm9W57Wv0nvoc3dihpb6QPJGWgfDe80
         pG5nOx80Q/ZAOCKMr4OFJo63Cvi0pg5qccU7HMhfPVxz4PaRGsuzs/6KQpEvUa1WHE4D
         v4754BmxJLHKxW58q1oP1zwzFqTq6Yymbs1tyRWYJZPHeKrNAjSkOjhoV49HZWawgZ2M
         Z3vudy6PlvXg25uJUoVYC6GsJnoRmGin+xAVO/3EdbOLtZmDzLVuPWuS3z4DjOj3fshr
         OBnA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533aoZZeyj26vI+g0HawqtvnwvHvrYEwzbRK+mKD2wBfz/+qCTPJ
	Uf9PaoWzOlBUESL26OSUYPc=
X-Google-Smtp-Source: ABdhPJyswWlCw8g6AvO4LcnEpFxuBFSuWYkNhZrCwvPC42gl2PNPxus4AlbmTFIQ6Wy5MentWyebpw==
X-Received: by 2002:adf:8362:: with SMTP id 89mr2858239wrd.280.1602664157154;
        Wed, 14 Oct 2020 01:29:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4986:: with SMTP id w128ls750506wma.1.gmail; Wed, 14 Oct
 2020 01:29:16 -0700 (PDT)
X-Received: by 2002:a7b:cf04:: with SMTP id l4mr2405847wmg.137.1602664156034;
        Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664156; cv=none;
        d=google.com; s=arc-20160816;
        b=DrAGw02wAKXNfW6Bya59j/fceIApmRkXdMliqm938Z1dFXbGUGPZptjWRTYDfHEZYv
         Kl+E7e+d9cgA8GgzpJEAILIl5yD+8thVPYdISojnT5iBODEJCjvBr/wvT88Y55TmNq0W
         dOpGrKoMdFT+RVGLGCVErHitp/kUtybEtgTDpUnA8iMEHF5Oic7wQcC9L/CVsZKXIvsx
         1gMhha76bgjRZgQ4nsMfs8nlSp8Ml/g9YwjdtHvQVwcQo3Qio6lyqiYzFeTOHVksL0a4
         Z3IpAzImFwOEHtk63uWLWQzQfhVBg8780bF0GLsUbtxhciFmhZwNqf47InSvJ0gbMypu
         sFVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=XGo70fAcrkB9FAu/KiJEc+iBXfoqNRdVr3mbZiiIUYU=;
        b=XdLgxv+YH1Q/v9CVA2b/JsFvUcpFcCVLsxwLsq6+bofxBjI9k03U7ZT/GMeyxLi5Wb
         RArv7cWmCvbZJHBGRZB9hqNS+PvVGygeLqD0dO8xk2fnZsKKsjCjd3scGcg6o6+Z1vZv
         NcPVa0FjZORLSgJwKumFlQZKPaMgIrNfrNUeWG2shWD6ETXKZadTkiyFazk1ZI7yw/x3
         8U5bSaQ5aqYoGy94K6muFD3Ki8I+ZCxqVNxt6y5yqnMsbXngywTDcq6P5m2xRvE9lzLO
         QYzscY4cWahjPcCcgCT5wqNeCLnDTZYN4tZOcwDjnKUfk9AoftiOGx08dezThRDPayAH
         vSJg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id v12si45262wmh.0.2020.10.14.01.29.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TFbJ031237
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:15 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJ6002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:15 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 20/46] arm64: smmu: Refactor S2CR handling
Date: Wed, 14 Oct 2020 10:28:44 +0200
Message-Id: <21957257039a3338913ae608184d817dd8109e01.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
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

There is no need to cache the value we write to S2CRn. Drop the related
data structure and pass the values to be written to arm_smmu_write_s2cr
directly. This implies dropping arm_smmu_write_sme, open-coding it.
Still a net gain as a lot of boilerplate code can be dropped.

Along this cleanup, convert arm_smmu_s2cr_type and arm_smmu_s2cr_privcfg
into defines, only encoding what we use. There is no value in enums.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 88 +++++++++++-------------------------
 1 file changed, 27 insertions(+), 61 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 0fa3b0ca..68162607 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -198,16 +198,6 @@
 #define FSR_FAULT			(FSR_MULTI | FSR_SS | FSR_UUT | \
 					 FSR_EF | FSR_PF | FSR_TF | FSR_IGN)
 
-enum arm_smmu_s2cr_type {
-	S2CR_TYPE_TRANS,
-	S2CR_TYPE_BYPASS,
-	S2CR_TYPE_FAULT,
-};
-
-#define s2cr_init_val (struct arm_smmu_s2cr){	\
-	.type = S2CR_TYPE_FAULT,		\
-}
-
 /* Context Bank Index */
 #define S2CR_CBNDX(s2cr)		SET_FIELD((s2cr), 7, 0)
 /*  Register type */
@@ -215,18 +205,10 @@ enum arm_smmu_s2cr_type {
 /* Privileged Attribute Configuration */
 #define S2CR_PRIVCFG(s2cr)		SET_FIELD((s2cr), 25, 24)
 
-enum arm_smmu_s2cr_privcfg {
-	S2CR_PRIVCFG_DEFAULT,
-	S2CR_PRIVCFG_DIPAN,
-	S2CR_PRIVCFG_UNPRIV,
-	S2CR_PRIVCFG_PRIV,
-};
+#define S2CR_TYPE_TRANS			0
+#define S2CR_TYPE_FAULT			2
 
-struct arm_smmu_s2cr {
-	enum arm_smmu_s2cr_type		type;
-	enum arm_smmu_s2cr_privcfg	privcfg;
-	u8				cbndx;
-};
+#define S2CR_PRIVCFG_DEFAULT		0
 
 struct arm_smmu_smr {
 	u16				mask;
@@ -272,7 +254,6 @@ struct arm_smmu_device {
 	u16				arm_sid_mask;
 	u16				smr_mask_mask;
 	struct arm_smmu_smr		*smrs;
-	struct arm_smmu_s2cr		*s2crs;
 	struct arm_smmu_cfg		*cfgs;
 	unsigned long			va_size;
 	unsigned long			ipa_size;
@@ -300,23 +281,15 @@ static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
 	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_SMR(idx), reg);
 }
 
-static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx)
+static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx,
+				unsigned int type, unsigned int cbndx)
 {
-	struct arm_smmu_s2cr *s2cr = smmu->s2crs + idx;
-	u32 reg = S2CR_TYPE(s2cr->type) | S2CR_CBNDX(s2cr->cbndx) |
-		  S2CR_PRIVCFG(s2cr->privcfg);
+	u32 reg = S2CR_TYPE(type) | S2CR_CBNDX(cbndx) |
+		  S2CR_PRIVCFG(S2CR_PRIVCFG_DEFAULT);
 
 	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_S2CR(idx), reg);
 }
 
-static void arm_smmu_write_sme(struct arm_smmu_device *smmu, int idx)
-{
-	if (smmu->smrs)
-		arm_smmu_write_smr(smmu, idx);
-
-	arm_smmu_write_s2cr(smmu, idx);
-}
-
 /* Wait for any pending TLB invalidations to complete */
 static int arm_smmu_tlb_sync_global(struct arm_smmu_device *smmu)
 {
@@ -470,8 +443,9 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	void *gr0_base = ARM_SMMU_GR0(smmu);
-	int i, ret;
+	unsigned int idx;
 	u32 reg, major;
+	int ret;
 
 	/* Clear global FSR */
 	reg = mmio_read32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR);
@@ -481,8 +455,12 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	 * Reset stream mapping groups: Initial values mark all SMRn as
 	 * invalid and all S2CRn as fault until overridden.
 	 */
-	for (i = 0; i < smmu->num_mapping_groups; ++i)
-		arm_smmu_write_sme(smmu, i);
+	for (idx = 0; idx < smmu->num_mapping_groups; ++idx) {
+		if (smmu->smrs)
+			arm_smmu_write_smr(smmu, idx);
+
+		arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_FAULT, 0);
+	}
 
 	/*
 	 * Before clearing ARM_MMU500_ACTLR_CPRE, need to
@@ -502,10 +480,10 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	mmio_write32(gr0_base + ARM_SMMU_GR0_sACR, reg);
 
 	/* Make sure all context banks are disabled and clear CB_FSR */
-	for (i = 0; i < smmu->num_context_banks; ++i) {
-		void *cb_base = ARM_SMMU_CB(smmu, i);
+	for (idx = 0; idx < smmu->num_context_banks; ++idx) {
+		void *cb_base = ARM_SMMU_CB(smmu, idx);
 
-		arm_smmu_write_context_bank(smmu, i);
+		arm_smmu_write_context_bank(smmu, idx);
 		mmio_write32(cb_base + ARM_SMMU_CB_FSR, FSR_FAULT);
 		/*
 		 * Disable MMU-500's not-particularly-beneficial next-page
@@ -557,11 +535,10 @@ static int arm_smmu_id_size_to_bits(int size)
 
 static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 {
-	void *gr0_base = ARM_SMMU_GR0(smmu);
-	u32 id;
 	bool cttw_reg, cttw_fw = smmu->features & ARM_SMMU_FEAT_COHERENT_WALK;
+	void *gr0_base = ARM_SMMU_GR0(smmu);
 	unsigned long size;
-	int i;
+	u32 id;
 
 	/* ID0 */
 	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID0);
@@ -603,16 +580,10 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 		printk(" stream matching with %lu SMR groups\n", size);
 	}
 
-	smmu->s2crs = page_alloc(&mem_pool, PAGES(size * (sizeof(*smmu->s2crs)
-				 + sizeof(*smmu->cfgs))));
-	if (!smmu->s2crs)
+	smmu->cfgs = page_alloc(&mem_pool, PAGES(size * sizeof(*smmu->cfgs)));
+	if (!smmu->cfgs)
 		return -ENOMEM;
 
-	smmu->cfgs = (struct arm_smmu_cfg *)(smmu->s2crs + size);
-
-	for (i = 0; i < size; i++)
-		smmu->s2crs[i] = s2cr_init_val;
-
 	smmu->num_mapping_groups = size;
 
 	if (!(id & ID0_PTFS_NO_AARCH32)) {
@@ -765,9 +736,7 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 
 static int arm_smmu_cell_init(struct cell *cell)
 {
-	enum arm_smmu_s2cr_type type = S2CR_TYPE_TRANS;
 	struct arm_smmu_device *smmu;
-	struct arm_smmu_s2cr *s2cr;
 	struct arm_smmu_cfg *cfg;
 	struct arm_smmu_smr *smr;
 	unsigned int dev, n, sid;
@@ -778,7 +747,6 @@ static int arm_smmu_cell_init(struct cell *cell)
 		return 0;
 
 	for_each_smmu(smmu, dev) {
-		s2cr = smmu->s2crs;
 		cfg = &smmu->cfgs[cell->config->id];
 
 		if (smmu->features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
@@ -809,11 +777,8 @@ static int arm_smmu_cell_init(struct cell *cell)
 			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
 			       sid, cell->config->name);
 
-			s2cr[idx].type = type;
-			s2cr[idx].privcfg = S2CR_PRIVCFG_DEFAULT;
-			s2cr[idx].cbndx = cfg->cbndx;
-
-			arm_smmu_write_s2cr(smmu, idx);
+			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS,
+					    cfg->cbndx);
 
 			smr[idx].id = sid;
 			smr[idx].mask = smmu->arm_sid_mask;
@@ -853,13 +818,14 @@ static void arm_smmu_cell_exit(struct cell *cell)
 			if (idx < 0)
 				continue;
 
-			smmu->s2crs[idx] = s2cr_init_val;
 			if (smmu->smrs) {
 				smmu->smrs[idx].id = 0;
 				smmu->smrs[idx].mask = 0;
 				smmu->smrs[idx].valid = false;
+
+				arm_smmu_write_smr(smmu, idx);
 			}
-			arm_smmu_write_sme(smmu, idx);
+			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_FAULT, 0);
 
 			smmu->cbs[cbndx].cfg = NULL;
 			arm_smmu_write_context_bank(smmu, cbndx);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/21957257039a3338913ae608184d817dd8109e01.1602664150.git.jan.kiszka%40siemens.com.
