Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPNX5D5QKGQE3GZJ3PA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F48282CBD
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:13 +0200 (CEST)
Received: by mail-ej1-x638.google.com with SMTP id k23sf2398154ejx.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838013; cv=pass;
        d=google.com; s=arc-20160816;
        b=zu72GKho9RzPKr6oP/H9aX7VBz574o0UXSdG7O5Dtxd3qY6SE/4CP/kW1M+JKmOBjr
         KzzADcq7PPnIp4InnIGtLpCSx1/FlneiwCk1Gs86wgPQEQ8ALMhDFxtwt4KjQkbmRQYn
         NWnmAjpvuJ3oUTWJQSbA7ws2LapUrDEiEP2YVpeaEWyQ1sLF24VSO/t/cFc8fGXtl/IF
         koBtMLhRJJmz8ABllrnjokqXHWQIPOqkX7pxbm1YhUpjfTaTPROMk33lwRl7QuIQTZKN
         SYHkaD1BsVNDSvK2B7ynZBAgcmbwQVWZQbVX84v0APJ3arQ1tYkUs+Jk4exo+XwWzhY7
         bmlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=zSMTuA6cxiCOel+KaWF4APnajMkXrKi/aJ2Wut4rR/4=;
        b=jTRN7+APYfW5cBxiM38tU3g2Ybjghbrq0tDZ39qZ3dQNc73HEoAyDh012A8g7BT2RC
         ndhwnj9mQu5xGtFS8yY1lJ6yX4XSZuIoA3yiDCgY8tG5H4m5djTjk1KDJO2Er9LUtYxt
         OBSNgnfJfXkENll0W/POSt+cSCHvxhEESjNCCIxP87NhT85GoyVuzT3ZoHjyZpelDXrx
         bT1WH5dlLxNpPN2dwFUOpEgnUv1hbAFP4LvzHjQ/Zqu2qBo2S6W1AtE12NmIzQniqTqI
         hbX9jbBoFjl6mbJ9HJdkA4zg8BUKDxuDrQ/FyRrKaEY0jEra26QL6Kd6eoKIJmMuNQBK
         MjMg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zSMTuA6cxiCOel+KaWF4APnajMkXrKi/aJ2Wut4rR/4=;
        b=TWqZR89mWH4q88RpsTLNlH8ScfDa0glQ/ZLWrQNeCsNPKuYkVtKcMXwna8dbstY1//
         u9iz799TDgqUiz0JNuLA3SDqsXrqjTnoyWspNv5u4Z/UEJKHDapYSb+AhAku/Qx10I3/
         rbdNxlQfH4pcLD0mLxB+yfWR2kWcTZ1oh0RH3BTQPKm1u5qV5Z4doZxbIieGJw4t7UpM
         tqfeZJEnuqkIeZ6/0g42VyyX1pLJXYQrTAgjTW/M7WdKLINLrsGwMOQ3sk1xVRzG6J/l
         gTZuz41yatJxobd6QlRvJwQJX0MOKV2zPu2JIIQY8d4yKQlejLpaS3eLj9Gq/bU7lHFm
         lpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zSMTuA6cxiCOel+KaWF4APnajMkXrKi/aJ2Wut4rR/4=;
        b=QVkASBwTi8ziNmX5GjwtXughxbc7FusxcgSCnYC7VOzSOjdWVnOB0oJnprp25dfEak
         Kw5SiKNvEhY2uxMEB4F+cS3Ij/dGJcbOwVxqwjtT7aK/rcxh/Vv6K3LgBB/NoGcLD2rB
         oarIXA86T+d8f2favxA6Q2LO+22qzTbTfT6MO7kZu3p8Lm1UzFMM/YXwidB74K0/NeN4
         SKz1Es7Omtsj9isujKjoboKPVyS812JTQJwe/CREFOZ18Tf6/8ACFkJXXjc0NNsSa0WA
         NK7C8oVNZAyHjkjPibKOpi3mL78KdyuijyQkBS8RJ5xiKGqN3E9+YfZYfAy89Gtu/S28
         UXeQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531PWc5RZOBLZl5iOQBc08411tIzfizLAoncsCFggKOLykw6JjqG
	R95OrMT41P7ghhsFZGQutIQ=
X-Google-Smtp-Source: ABdhPJxIiqJlVyI5yDiYnnvdgmJakz5gmAt0xIZANHHWHUml1/Jd75puMucg/rMIH4bexbaIuqdRew==
X-Received: by 2002:a17:906:6b89:: with SMTP id l9mr7011165ejr.297.1601838013535;
        Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4904:: with SMTP id b4ls3131864ejq.9.gmail; Sun, 04
 Oct 2020 12:00:12 -0700 (PDT)
X-Received: by 2002:a17:906:a985:: with SMTP id jr5mr12477089ejb.549.1601838012367;
        Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838012; cv=none;
        d=google.com; s=arc-20160816;
        b=t9sMF8HS0C/wjegnazAyf7YLMON4mIpEYf2Qp9l0bRmxU0yKQeMqxxenBpRS8bqDy7
         NsBQ70a4LkEYorYJERVLhZYpoZmH3p098pN3/m5JtjwtpKwXqkjMaxPjhFx7LPMUAsFP
         OUolkGdU4lP5QZ6r8e0aiAEbVr5ItDHBj2mt1O0h4muzxTWzr3ZfgzIwUagyaBQmex7m
         Yrp8TTjKza20FCDqLWzLzys7Uaamo3q0xm3+SGDM5PhpKuH7F/iP33GF0FjQ6N81x287
         9R/wxFlpsKtnx9Uu6SLTHOcpfD4bPuVjdnqTKi1LJ4fu89anuE8Wpi1Dt72ia8Xvu8H8
         0ecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=XGo70fAcrkB9FAu/KiJEc+iBXfoqNRdVr3mbZiiIUYU=;
        b=knBzGNL74sNXt8DGmRjaCqn3MgfrqMRMJMFKmpt3YQhq0K+oElxAE/I0I7n2AofyEm
         D2bReQU9yljA6LsRbebAvs246LHZIXYIsVQSWSEuSzhxtrHAPRob1x/6qIrZF0MAu4+M
         +k+sOwnKV5SmRlYRxTKGXqUI+COgvbiHSpAJ0gG1rnXfhYs5XN+nylbS9tJK3PNsvCYV
         ENGRIylo0qUB3bxCMeaat8BlERCHKjVIMdb27giYNxiGQmOYlAcch9rlOyu2qRrQ9qEO
         NG536cUQs6le8+uS6hhoN+8NUxH7535Gk3V3lVDhfKgNn7qzovw2hNsMjxjKgT02TYhe
         fDEQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id g25si96053eds.3.2020.10.04.12.00.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0CVG029767
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:12 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060V017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:11 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 19/45] arm64: smmu: Refactor S2CR handling
Date: Sun,  4 Oct 2020 20:59:40 +0200
Message-Id: <10fdfe550793a3bb829199e761fdf2e654b1e486.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/10fdfe550793a3bb829199e761fdf2e654b1e486.1601838005.git.jan.kiszka%40siemens.com.
