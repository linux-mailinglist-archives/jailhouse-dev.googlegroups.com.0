Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPVX5D5QKGQEF5JMHJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D06282CC3
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:15 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id b17sf798463lji.10
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838015; cv=pass;
        d=google.com; s=arc-20160816;
        b=D0S31jXgacu00RD+DpJSXsvVUhzjrTooZMENJg5wmxUyGeVgqhG6O3807/UqILBxct
         tQQb3AUj7O5RBD7f5QNRv2H9eD7/wfSq/ZKh1fwKrkAD0yVOIxNN1pve8WS57zoGoJog
         TwwuureXE3aCnGZyX/skkAl1oVm782D4xnCmZ9AxDOxbjmnbtgtXGHBp8RfB2VSuwXJG
         Bt6f6zGis4Hyv3FmwU9v3UxMLZQqV/uZ7Cqg9AB3HbRkeRvSxyizkoPIMKNiozJbPjtP
         SZXzbCd6fsRZnCZsRYGSAfSJsy2TD9t1zDZ2Gqv2zTnekCD5gJN86x7zxIe7J9wb144g
         LQ4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=Blweb0zsIKak3f0yaGtZhMnFFHAFkRG0DxcO7MsQU1A=;
        b=B4cAb0L1S0ErwE5ZYreaQn+dyI/H8XZjdE4uBh1weJ3AenDfz2x6kXFJnlsKKgAT92
         yVz2nDQaEaf6H8lwzvUgD1kL3aAGEbahGNdp47DLJAlFewcyGDmvGE04fg3ju1M4P3vP
         SUTRPHkhkO6uVQVTKnNnG+w+L3qC0IjKKtr+4Zn5HbxDNikOOzyDFSW0M0r9McMSF9A+
         9cTmIurEcr4njk3YqCsTynazLz8FCpoW0KHTTa+PYtLxdOlTkG4P206zeVyyXyBsVrgZ
         blVtsRJNY3v3h2dmE8/wdcEivnG2hbGADmKv7CMjBQJqqX1iy0CgZP7WBxJ85ZPFUWnR
         IVkQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Blweb0zsIKak3f0yaGtZhMnFFHAFkRG0DxcO7MsQU1A=;
        b=bxiEw23sg0gQb4ecACTxjYL0RHoBX7aM5klJkJpurbitZygSuY/+SpeAZ5+tepYKfL
         rDWNLKF7EXtzBeqI3DfBlobcY0gJb1smnSY1eS2LTVOH2lT8KkGx0irssaO96taH2mU8
         bg1YzZ5bQgC1t/PBmVdIASu8PbdL/gvPA0pYw7W8Rh+wYwvHTnGNJ39MbTAvvh0swaCg
         bZ6bnlFi5wedhcqo+sRcFaV8RoAmlbtvTfMT1NGyZ0jLt6vTas8FCGE9JXO+emHS5yU8
         HyvdfD3E2AiVPt9u8hNCOEDraWwTPa7rGIQOGJ38sPaLyREOopX/tsekdzsH85aG1b4b
         yrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Blweb0zsIKak3f0yaGtZhMnFFHAFkRG0DxcO7MsQU1A=;
        b=TwSjvft/YnrUndyQO/tq0ZPAiCgXVgxxC1ILnxUO9/T63xAZ0n6Fcu5/r+Qk5FIfUH
         x9gaqEwTCHsII2lWSxHn6gCONwRLvuabn4j/kFyEuU133HkY4KQNXf4yqy0YPymgKMPz
         7Sr9FeHQyB+vkB7dwPzrEEQ6MV1ZMi5U6NxFO4DvqIgMINhBRlKOsrycJC2EJXrvYxM3
         Zcn7VKWwaUHd7QnXWVqAhRbnfed2IP3M8u4ILYJIdKrbSg+lPj5XoqDHfBZCs1erGW3E
         R0wkUjs6kkYcK3bZUqZO8LpYQ2tpWahxXzKCGB8tTLZl3KKHLFiMq5A992zQ9srHrpdQ
         nnhQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532x6ZFyRc6hd9ghhYIeOzp7h1UzT+ABeYm9Q8Nlr511/X8sVnJT
	USBYAZGVrG9yIiEF15pr7og=
X-Google-Smtp-Source: ABdhPJzJ50yLkbcBn3o4a0yTF7l2ZQougjhmel+rzSokvwEdmvjzeokTQbO8CudosC3x0NKDBmyQqA==
X-Received: by 2002:a2e:2f16:: with SMTP id v22mr3396483ljv.294.1601838015149;
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls1122090lff.0.gmail; Sun, 04
 Oct 2020 12:00:13 -0700 (PDT)
X-Received: by 2002:a19:504b:: with SMTP id z11mr1111529lfj.182.1601838013717;
        Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838013; cv=none;
        d=google.com; s=arc-20160816;
        b=xuDV6JlPR3PVcLgUSuaqJBIb6T1WLLJSCW7DY7/GZu8FSzGIwwSmG3uSRKa+9SaxyN
         BSfz03tREKH+IL3SXSdfxI8dNau8Cx1alrPxAlOVHyiU4rSfwSqbDsIDTamJ2hmXfpgo
         noxaEXJcywA5A05DuQuXk4myw9sEPlywqJ5hcuRhTjpULLG+C/aRKLmgJheXnLF/DKF6
         SvzDQnfzinSsj8/3FAHPgRHkuPLqHhFM9exNDSeqfHwsb53AP8qzzKmu3+SqmcgVz7a1
         PIg0UkJ5zJdkvb+3it1rCSYhGhvvDBAADRSkf/16QENw/71FQ9DyVOLyYKk4DDCjn1ZT
         lbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=0qFl/WFE/AZClamAnvDczSEwy7euhq+b0c8nmIby7So=;
        b=LxJF47PsGvYm6tdgFPhJ7wxSOB5ynsM2xjHwqAt2O41FP4HJQRZPrMerWx2/BjkGAt
         fufK6KMaRcQSy4PK35aapiI/5BvVft3KkiZHx4FOkXs8VpKvy6KqtJxWEbL1VkkEAuxW
         zezosVCQ0xXxgNic3+XtJAsTkwKb/u68pdVxaOGhipqFov3sUNUsP+PDeoDwMhXqo3lz
         rgpI00LrkmtwYP2teO+P3OH18Ci2cnWStxuQ0PoOyOcAvHLmYejb31Fclh+kBjMi15q6
         1kIluBcNVJSWWvkiz5e0BQiY8G2q9qqhavMwiTb/YbAe78HSrH5coBErTgO6P46/w9XX
         mGTw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id r7si20958ljc.7.2020.10.04.12.00.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0DXg002650
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:13 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060a017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:12 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 24/45] arm64: smmu: Fix CBn_TCR initialization
Date: Sun,  4 Oct 2020 20:59:45 +0200
Message-Id: <7ee8dd23048980b9e747693e5c72fc158c8abb01.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

This was simply wrong: We must use the same settings for the SMMU as for
the MMU because we share the page tables. We can pick up VTCR_CELL for
this, just like SMMUv3 does, we just need to mask out reserved bits.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 63 ++----------------------------------
 1 file changed, 3 insertions(+), 60 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 66453b67..ca86eed5 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -23,27 +23,6 @@
 #define ARM_SMMU_FEAT_VMID16		(1 << 6)
 #define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
 
-#define ARM_64_LPAE_S2_TCR_RES1		(1 << 31)
-#define ARM_LPAE_TCR_TG0_4K		(0 << 14)
-#define ARM_LPAE_TCR_TG0_64K		(1 << 14)
-#define ARM_LPAE_TCR_SH0_SHIFT		12
-#define ARM_LPAE_TCR_SH_IS		3
-#define ARM_LPAE_TCR_ORGN0_SHIFT	10
-#define ARM_LPAE_TCR_IRGN0_SHIFT	8
-#define ARM_LPAE_TCR_RGN_WBWA		1
-#define ARM_LPAE_TCR_RGN_WB		3
-#define ARM_LPAE_TCR_SL0_SHIFT		6
-#define ARM_LPAE_TCR_SL0_LVL_1		1
-#define ARM_LPAE_TCR_T0SZ_SHIFT		0
-#define ARM_LPAE_TCR_PS_SHIFT		16
-#define ARM_LPAE_TCR_PS_32_BIT		0x0ULL
-#define ARM_LPAE_TCR_PS_36_BIT		0x1ULL
-#define ARM_LPAE_TCR_PS_40_BIT		0x2ULL
-#define ARM_LPAE_TCR_PS_42_BIT		0x3ULL
-#define ARM_LPAE_TCR_PS_44_BIT		0x4ULL
-#define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
-#define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
-
 #define TLB_LOOP_TIMEOUT		1000000
 
 /* SMMU global address space */
@@ -162,6 +141,8 @@
 #define SCTLR_TRE			(1 << 1)
 #define SCTLR_M				(1 << 0)
 
+#define TCR_RES0			(BIT_MASK(31, 23) | BIT_MASK(20, 19))
+
 #define FSR_MULTI			(1 << 31)
 #define FSR_SS				(1 << 30)
 #define FSR_UUT				(1 << 8)
@@ -280,48 +261,10 @@ static int arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
 	struct arm_smmu_cb *cb = &smmu->cbs[cfg->id];
 	struct paging_structures *pg_structs;
 	unsigned long cell_table;
-	u32 reg;
 
 	cb->cfg = cfg;
 
-	/* VTCR */
-	reg = ARM_64_LPAE_S2_TCR_RES1 |
-	     (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
-	     (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN0_SHIFT) |
-	     (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN0_SHIFT);
-
-	reg |= (ARM_LPAE_TCR_SL0_LVL_1 << ARM_LPAE_TCR_SL0_SHIFT);
-	reg |= ARM_LPAE_TCR_TG0_4K;
-
-	switch (smmu->pa_size) {
-	case 32:
-		reg |= (ARM_LPAE_TCR_PS_32_BIT << ARM_LPAE_TCR_PS_SHIFT);
-		break;
-	case 36:
-		reg |= (ARM_LPAE_TCR_PS_36_BIT << ARM_LPAE_TCR_PS_SHIFT);
-		break;
-	case 40:
-		reg |= (ARM_LPAE_TCR_PS_40_BIT << ARM_LPAE_TCR_PS_SHIFT);
-		break;
-	case 42:
-		reg |= (ARM_LPAE_TCR_PS_42_BIT << ARM_LPAE_TCR_PS_SHIFT);
-		break;
-	case 44:
-		reg |= (ARM_LPAE_TCR_PS_44_BIT << ARM_LPAE_TCR_PS_SHIFT);
-		break;
-	case 48:
-		reg |= (ARM_LPAE_TCR_PS_48_BIT << ARM_LPAE_TCR_PS_SHIFT);
-		break;
-	case 52:
-		reg |= (ARM_LPAE_TCR_PS_52_BIT << ARM_LPAE_TCR_PS_SHIFT);
-		break;
-	default:
-		return trace_error(-EIO);
-	}
-
-	reg |= (64ULL - smmu->ipa_size) << ARM_LPAE_TCR_T0SZ_SHIFT;
-
-	cb->tcr[0] = reg;
+	cb->tcr[0] = VTCR_CELL & ~TCR_RES0;
 
 	pg_structs = &cell->arch.mm;
 	cell_table = paging_hvirt2phys(pg_structs->root_table);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7ee8dd23048980b9e747693e5c72fc158c8abb01.1601838005.git.jan.kiszka%40siemens.com.
