Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPFX5D5QKGQE3TUQHYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id A0862282CBC
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:13 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id d9sf368748lfe.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838013; cv=pass;
        d=google.com; s=arc-20160816;
        b=h02lRt839FEMsWDLnefpsQVtrk6/i9beqNx4Jwfpicvg/4y54Kix6HlTRRxg8gRK4n
         5sTBC6TgolefN/f2GS4kvGQNXLgLQy1j9snzv0zfknXE9hkVPkwSs1jpyseKSNt83CGk
         Uga44PyghCSNX2WeHaOtqP4PDtYGe3tDReJ4hZKTwEJe8wYL3EZV0GwSjpcY1qZ0b+Sm
         l+K+zWkndOnDAWQPfJNAD1C0UQ1j7MXmZydye0pc0t5zTSo7+L7AP952wOuUY+987n5K
         bO0GndwAd7DzdSmiswA7K9VLvWrYDeVn56oXSBcUpEQRB9/LNvsEDinBLXL7w07lSMXE
         4BBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=DXm83lUnYlI3bgEZU2OaZzx6GsFmXL/KwqSW4JcgDmw=;
        b=oniNO6h8ngrBWy61xVBx0I48/NAd/yJYsenH6mIGWJy0niHTCu1Q+yz4WNbPS49k3A
         NTwUQEl4mEFymLykydtrXq2wNvtlkW6wGU+PkgGxjzVRxCtNEGU9p9r5ZZZCXy1OY+r4
         J2LpbgpdgmxeZSvuh+smTgyjHzs+ac13DZ6RMQPuazMoMS9sQYIMQvLN0KCj6Igfa4Jc
         2MYHdNvliyve+kwh3SLnaTIPI1yacsV/ioODkRcAJZ2D6GZo4gUDWsuX3bWLDTzGzt3G
         gn+HrW2691BO6CsUcvVdZ/GJ8bJ3T7Oj2KX2D1+X01obzGKa9pEhrYszMWx9n22wUtjE
         lQMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DXm83lUnYlI3bgEZU2OaZzx6GsFmXL/KwqSW4JcgDmw=;
        b=ZEUtBAaD8McSoretKwv5/ceVuiTYuyCPvDHWLGquIKqjwRA5KSu2nr+iNGyXFvF791
         ltFlXlIuVvLOq61AY/kHvBQPq/yAxbpv1JaILCONeJqsbmoWRvvMQ9oLw5SkB7Zm9cIG
         OWcx51cMOEVDq97MsWQhCCUTVZdNsR6UnoLe4B8tZ2UN7cFM4m+YxgS91Y8LnLWgIhjF
         seVTOHwb0y8vVUu/o7V3xyWL0U2z2NC3GPH0djWfQg4Q0u//dNnDgLrutJhgKbi7YtNI
         FzxeUSxGdILVJKHox2YxJWa/3MYLk+YIRwSMP6/lYSfMR6c66yIqG1MniGs63gHphnPg
         Yfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DXm83lUnYlI3bgEZU2OaZzx6GsFmXL/KwqSW4JcgDmw=;
        b=CPBItvDbCrB9sqjiGqWi1aQ3hnn5xT9xQJaeN+rMoo8RFYLdvuVEbs581FePHMyY/D
         LIvHxzeDqV5dEsK4/eijFBr7lBVfcqzl7Oextr9OuQUKBBsWJQs92c/Nti/tDgmWnQSj
         fZOMOwwd/3d8mnqiyyI5VIjANsDxtt7aPStBUzDcFEXUe6fA6WORnQZPrPa277WR8/8X
         DUgsp7Rwlt/R+A/WaqPwmEUFGtjwFw3RHpF65UAhlaTcl3npTDURp7HY+ha3v4KoI8DH
         J6YUEmUOlsygyyYUQuwBEsa7GO6Zhnd1DE+TmVB1o9ePJreNtFk9h/G10pFzsL3X1psL
         eIvA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532/G+w4PSOHFzInrcHw9yKNEDelRFSYPp6Q3rXCrQJKlIOQl7Yc
	GmSmrTDV97OWGaOMIu4/0KE=
X-Google-Smtp-Source: ABdhPJx+Zp+fpfLM9UXFo/HT6ezqN8329l3MDjPk5k2pVHZM/k82GNH+NyCWJcs1RaILtCdGVsWaCA==
X-Received: by 2002:a19:650a:: with SMTP id z10mr4565535lfb.9.1601838013225;
        Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:555:: with SMTP id q21ls749338ljp.3.gmail; Sun, 04
 Oct 2020 12:00:11 -0700 (PDT)
X-Received: by 2002:a2e:7c03:: with SMTP id x3mr3029739ljc.190.1601838011866;
        Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838011; cv=none;
        d=google.com; s=arc-20160816;
        b=W6akRGeGce6JLAW0JLo9T7pPKENUdOzOLfDwgdey9UN+nInEERB5NmJPJ1J3Tqwv47
         dEIPqPfrYARHLiUbj/0MKdDC0M+t6sp9U4rIk/4zLue3KiWHOOIp9ejxzXsTq2dTEVDX
         EXBvCFSnwrtZ29cKMGIt0SFAt1cqYDRgTaeCmsLeB6hMd4FmVgkdkxHTzHCA/0P+eazr
         sdYUozqEX+GiBRWEqxoyMs5lyICWuJ9c9Kg8vXQKAqOH6Xc2/9mMaOT6RLFNqqJlvPJg
         IyOCiAI2amHaOqRzG/PHNeDR1Y+QwGKxbeWOGdli5BxIlTqrjH2ScX2ggYYbQloP5odn
         iX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=86mMHkgdDijSbJQDMHZoI/MJkyYDK0z5P/lfkmuzyDU=;
        b=TYD5euR1AmyKpXfpPdbgsP94k3hCXwuOAkP/hpdZC5K/CuhpUd5uREuOgVT2WkHc+k
         0KwoKdv3xxiBcR8FJzSODyIWlcUlBwh7CsFwJyOI0q1VOTqWY1WeDa+m6sETCLC7ky6O
         6sS7B9tiuLrNbNOMNKfiF+n138LIQK13x8Zoe01owB1ZbRWOQ3J4qzQWm1zmJQiBBGDx
         uEvS6gJE/gAprVXofAtNUccf4Ng8WKEsM7pMIQ6rJBTYqx/WUdBCmAPIf0JjELzkz/4Q
         tk1nLeLFjA+6pSUldAmNTgOP6OcujIK7CLZRFRQMni/1mKvU8NnqwJTVMo/2U1CxQpCO
         bJaQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id d18si104914lfb.9.2020.10.04.12.00.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0B5v020380
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:11 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060R017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:10 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 15/45] arm64: smmu: Remove bogus Extended StreamID support fragments
Date: Sun,  4 Oct 2020 20:59:36 +0200
Message-Id: <3863f10de16f95734e29de1693a323a89715bee2.1601838005.git.jan.kiszka@siemens.com>
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

We do not use the extended S2CR / SMR registers, but we enabled extended
StreamID matching when it was found. That would have broken platforms
carrying this feature. Remove all traces for now. Can be added properly
when there is a need and full support for more.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index e39c2264..9c10d75c 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -42,7 +42,6 @@
 #define ARM_SMMU_FEAT_FMT_AARCH64_64K	(1 << 9)
 #define ARM_SMMU_FEAT_FMT_AARCH32_L	(1 << 10)
 #define ARM_SMMU_FEAT_FMT_AARCH32_S	(1 << 11)
-#define ARM_SMMU_FEAT_EXIDS		(1 << 12)
 #define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
 
 #define ARM_64_LPAE_S2_TCR_RES1		(1 << 31)
@@ -88,7 +87,6 @@
 #define sCR0_CLIENTPD			(1 << 0)
 #define sCR0_GFRE			(1 << 1)
 #define sCR0_GFIE			(1 << 2)
-#define sCR0_EXIDENABLE			(1 << 3)
 #define sCR0_GCFGFRE			(1 << 4)
 #define sCR0_GCFGFIE			(1 << 5)
 #define sCR0_USFCFG			(1 << 10)
@@ -296,10 +294,9 @@ static unsigned long pgsize_bitmap = -1;
 static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
 {
 	struct arm_smmu_smr *smr = smmu->smrs + idx;
-	u32 reg = smr->id << SMR_ID_SHIFT | smr->mask << SMR_MASK_SHIFT;
+	u32 reg = (smr->id << SMR_ID_SHIFT) | (smr->mask << SMR_MASK_SHIFT) |
+		(smr->valid ? SMR_VALID : 0);
 
-	if (!(smmu->features & ARM_SMMU_FEAT_EXIDS) && smr->valid)
-		reg |= SMR_VALID;
 	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_SMR(idx), reg);
 }
 
@@ -309,9 +306,6 @@ static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx)
 	u32 reg = S2CR_TYPE(s2cr->type) | S2CR_CBNDX(s2cr->cbndx) |
 		  S2CR_PRIVCFG(s2cr->privcfg);
 
-	if (smmu->features & ARM_SMMU_FEAT_EXIDS && smmu->smrs &&
-	    smmu->smrs[idx].valid)
-		reg |= S2CR_EXIDVALID;
 	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_S2CR(idx), reg);
 }
 
@@ -537,9 +531,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	if (smmu->features & ARM_SMMU_FEAT_VMID16)
 		reg |= sCR0_VMID16EN;
 
-	if (smmu->features & ARM_SMMU_FEAT_EXIDS)
-		reg |= sCR0_EXIDENABLE;
-
 	/* Push the button */
 	ret = arm_smmu_tlb_sync_global(smmu);
 	mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0, reg);
@@ -595,13 +586,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	if (cttw_fw != cttw_reg)
 		printk(" (IDR0.CTTW is overridden by FW configuration)\n");
 
-	/* Max number of entries we have for stream matching/indexing */
-	if (id & ID0_EXIDS) {
-		smmu->features |= ARM_SMMU_FEAT_EXIDS;
-		size = 1 << 16;
-	} else {
-		size = 1 << ((id >> ID0_NUMSIDB_SHIFT) & ID0_NUMSIDB_MASK);
-	}
+	size = 1 << ((id >> ID0_NUMSIDB_SHIFT) & ID0_NUMSIDB_MASK);
 	smmu->streamid_mask = size - 1;
 
 	if (id & ID0_SMS) {
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3863f10de16f95734e29de1693a323a89715bee2.1601838005.git.jan.kiszka%40siemens.com.
