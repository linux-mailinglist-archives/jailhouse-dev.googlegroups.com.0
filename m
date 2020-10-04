Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBP5X5D5QKGQE3FK25RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AED282CC6
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:15 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id z7sf446243wmi.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838015; cv=pass;
        d=google.com; s=arc-20160816;
        b=wexx2jC/YavxaX3Oi9laPdChP7cOhGauR8pTYLg3BJbuFfMqWBpBcMvRQqNzpq/Gbm
         29m5sOdpr7bTg2FRYbQ/vXOBWPOdUUhx1vwqrm4+oofIfyMvzozQbENq790t93Ncz8qe
         mZp2uSKRegOBLuGi4x99BgEnLvC98uqcXzTMsb60S0ZVUPcTcfsAVSdJv18la/MEUu2H
         xEbieeKY0nVmZpx88NVqI6Rfa7o2r4iztfWk0lKt36E4d0AVnh2MMc0FD5bbRScsXIUs
         kA/uMdD8Xvz50MkR2Gtm9N4CN+T39TDUUVWef3NzLVV2l6/MhlXSPLn/DA/98hr5vVlT
         slBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=JFDHBpWOVUK436coE3XjZu6qRgzBJCtcft3O95GLtsE=;
        b=GFGzcA1M/GWHB2hoqFDSU1ndDKn0Wz4EN/IIszOlox+2Vi1BPAWOghhI7I5igeCjlJ
         yw/9EyPTo1GzSA8gZwEeCRIasg/i5EOKMH6OWPDzPlsLh13d0NWQ91o06JmW+C5gxEok
         ce0tbt15IT+rzt3ugOlcvj4PaliYPbjJCpUQhEomXnmE3Ct+yrHhjzHPgN0VpEO1Ytdf
         oexDtD6Lko+e3WFPyQHlDJAMGbLxIF0AC1ZK2nwSaoz4izICGTCHkxkO29mX3CjY+7pY
         be3xrZXVZz3AUoOw39bcOJKAYmqOR4jX3gzcaAy55Eb2wldUk9W4AJdmSDmvPzTb6Rr4
         hMyw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JFDHBpWOVUK436coE3XjZu6qRgzBJCtcft3O95GLtsE=;
        b=QrxDopc6tnvi0ObgvnaybX2v2g44g6F1pETlQg2adLx0O0aWQI7H3lcmn73IDcjHHs
         V87sX2VZKal5VvX2Q/X5yKgR3j5rJl+WhPJ/65729jJa5XuG+SIuS85MCbIRjBpXfZPn
         neIe7hKoh9I2C6pvHbipRGn6cH6Jc+NgUp0dFHcXZipF4do9tJD6zDVv/5ouFyIk1AZZ
         FIxtQNOPWimLyxn78KvwwSVgzPGUp9W25Kh0kY3WulkdCmmN62Im6JyFGhmsRT6MI07Q
         ZAWzwG3BGmGNJroSqrFSr+yGyPRdfsIi/4MepdtCfkLmgUThgO/vwVBojlrkl0EHl8Aw
         rXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JFDHBpWOVUK436coE3XjZu6qRgzBJCtcft3O95GLtsE=;
        b=lz9CHwoWXeoxnxm6hfRsLZUwgT87OKYvUL1ULeg915xhgDAzg/2xayIJguivzowuDL
         lUMPboBPR/llOb0dZcnocOlAMgs8C3dVgrF9Zs0tR9hzW1Pg0HDliy+iQUedsqZe5zQT
         H/GbfFCE0WCO/QV4+A2+6tc6tBsFUzdHYg5ynl1160Rr1Qw0t2U8Sw1NLLPjeIHETtW/
         FqH9aJtFSW26sZpaXZlGLKJ/FIa1GblPj5TVjJlklWCk719vfdeM6jKGZPn4MOxGqnKc
         YEffJCG97R4ee0u35V8gDkf5gUvG3tL+y6ahBSIWplS+iQRuu5fecTBq7q8hUdfu/1eW
         IUPA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531hxq1sZoyjwadIlrrka5/b7CPk7cXjPiM8E8Csdw/Lu5TlLGcn
	N0DZNVXPyfxMTcDMzTfEr/4=
X-Google-Smtp-Source: ABdhPJyps50CffXREpaD+USfNedvhBdlOaJtnitTjkiDWpKd0elUYCOFdWwEX2YTqZ5Q+YEf3oUA+g==
X-Received: by 2002:a1c:1bd1:: with SMTP id b200mr13537550wmb.171.1601838015568;
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c958:: with SMTP id i24ls213418wml.0.experimental-gmail;
 Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
X-Received: by 2002:a1c:f715:: with SMTP id v21mr14007286wmh.117.1601838014271;
        Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838014; cv=none;
        d=google.com; s=arc-20160816;
        b=DeEVdb1Fwg3W3AFaXWKIh4ZxbK2LVXVLob64pXChScoVk6TgNPTkTgIyXqkKkY1ylq
         6cZDqAf17YBZ+HTyQvo8+UR01DKxcw9ntBNBDYbLlT52H8OXmae6QN3wIqKcsFYpLsOA
         sAya1vsjZVOSm58J070ipkYOl7Qjb0xnEk7Ai5ezO/32KZ6nrGLmrQ5T5ltNLlmwdZvT
         Ks3CeQRWoi70Fcpa4t+HidoAG20+N0g60ad0G6sUHH+bF5goKYLM3K2cgxZpaXgNYyCU
         MySBPIcbYBkZ2M/Q4mAa9lywOH0EEAxMsw89bXbaSbhHzF1Wf+XDzOYWRzhilIQGxSQU
         vqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=OyYsJ/8JUlya3Y9Fih6s76JulUuOssK83VQZjh20Kms=;
        b=xc/4148k2j8YaYmyVssjS0cqA9CsqCIrto0+QXRYkhkLJ7LHN+WmYE5YkfwVK4Q4ct
         bdw7t+3B7JDTNKdkrBTcyn00DV02rMhosiJ23pc83cwZ27kZCirPDt1DvzLzwgvG1zPD
         BFUW/zFn4FlJteECrKJ7JznQhDgnY+62Z/qJfQxMtfYabaXDJpfSpU/XuV1p2kAYB1SO
         7466HqfTy9zXh6sWP5pa79yZEt5C9lXnhuhrvyTMVZK+pNdyvJUWY5IOPLNDSE0S9OBt
         kaRvVTFIghJtDYvxjyf7l/u5eBkXQZ5VutOj9IEE2DK62c5fG7Yj3fv0GOhXW7KNS5Y4
         jifA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id z62si207547wmb.0.2020.10.04.12.00.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0DbV020477
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:13 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060d017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:13 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 27/45] arm64: smmu: Drop 16-bit VMID feature
Date: Sun,  4 Oct 2020 20:59:48 +0200
Message-Id: <9772826e4bf5b4e0239939a413eeeba34cf4ff33.1601838005.git.jan.kiszka@siemens.com>
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

We are limited by the number of context banks, and those are 128 at
most. That fits into 8 bits.

This obsoletes the features field in arm_smmu_device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 31e7f4da..f71c5a81 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -17,7 +17,6 @@
 
 #include <jailhouse/cell-config.h>
 
-#define ARM_SMMU_FEAT_VMID16		(1 << 6)
 #define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
 
 #define TLB_LOOP_TIMEOUT		1000000
@@ -48,7 +47,6 @@
 #define sCR0_VMIDPNE			(1 << 11)
 #define sCR0_PTM			(1 << 12)
 #define sCR0_FB				(1 << 13)
-#define sCR0_VMID16EN			(1 << 31)
 
 /* Auxiliary Configuration Register */
 #define ARM_SMMU_GR0_sACR		0x10
@@ -88,7 +86,6 @@
 #define ID2_OAS_SHIFT			4
 #define ID2_OAS_MASK			0xf
 #define ID2_PTFS_4K			(1 << 12)
-#define ID2_VMID16			(1 << 15)
 
 #define ID7_MAJOR_SHIFT			4
 #define ID7_MAJOR_MASK			0xf
@@ -122,7 +119,6 @@
 
 #define ARM_SMMU_GR1_CBA2R(n)		(0x800 + ((n) << 2))
 #define CBA2R_RW64_64BIT		(1 << 0)
-#define CBA2R_VMID_SHIFT		16
 
 /* Stage 1 translation context bank address space */
 #define ARM_SMMU_CB_SCTLR		0x0
@@ -189,7 +185,6 @@ struct arm_smmu_device {
 	void	*cb_base;
 	u32	num_masters;
 	unsigned long			pgshift;
-	u32				features;
 	u32				options;
 	u32				num_context_banks;
 	u32				num_s2_context_banks;
@@ -294,23 +289,11 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	/* CBA2R */
 	reg = CBA2R_RW64_64BIT;
 
-	/* 16-bit VMIDs live in CBA2R */
-	if (smmu->features & ARM_SMMU_FEAT_VMID16)
-		reg |= cfg->id << CBA2R_VMID_SHIFT;
-
 	mmio_write32(gr1_base + ARM_SMMU_GR1_CBA2R(idx), reg);
 
 	/* CBAR */
 	reg = cfg->cbar;
-
-	/*
-	 * Use the weakest shareability/memory types, so they are
-	 * overridden by the ttbcr/pte.
-	 */
-	if (!(smmu->features & ARM_SMMU_FEAT_VMID16)) {
-		/* 8-bit VMIDs live in CBAR */
-		reg |= cfg->id << CBAR_VMID_SHIFT;
-	}
+	reg |= cfg->id << CBAR_VMID_SHIFT;
 	mmio_write32(gr1_base + ARM_SMMU_GR1_CBAR(idx), reg);
 
 	/*
@@ -392,9 +375,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	/* Private VMIDS, disable TLB broadcasting, fault unmatched streams */
 	reg |= sCR0_VMIDPNE | sCR0_PTM | sCR0_USFCFG;
 
-	if (smmu->features & ARM_SMMU_FEAT_VMID16)
-		reg |= sCR0_VMID16EN;
-
 	/* Push the button */
 	ret = arm_smmu_tlb_sync_global(smmu);
 	mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0, reg);
@@ -493,9 +473,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	size = arm_smmu_id_size_to_bits((id >> ID2_OAS_SHIFT) & ID2_OAS_MASK);
 	smmu->pa_size = size;
 
-	if (id & ID2_VMID16)
-		smmu->features |= ARM_SMMU_FEAT_VMID16;
-
 	if (!(id & ID2_PTFS_4K))
 		return trace_error(-EIO);
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9772826e4bf5b4e0239939a413eeeba34cf4ff33.1601838005.git.jan.kiszka%40siemens.com.
