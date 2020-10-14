Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXPNTL6AKGQEIXYUOOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F3728DB5E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:18 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id g125sf372132wme.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664158; cv=pass;
        d=google.com; s=arc-20160816;
        b=AD+j91sZawFLD+LsKEijh6g9asKBRdwYq4hHSPiiPRca3kA7hkQT6hx/4Og1PQr8E1
         prTOo/CDGJOO9Pemhv1AcZNR9vHCgwO3zH7yuCFvdyWoJjzrMiM2JmsqGuSMbG8mo0aX
         yGdGWQOPbU/3Ve6qcgqAsxeinOBRwcSXNqIoEdiwmvLYdG0XYoy9RgIBq4kaCJuUFmGU
         iYRGkijG/krnkXjCZMnBVrrxmuZnK/B52sYqy1u+fccfF3EzhSO6wUa1HP7VMUQPltLo
         Osd4AKWgtUJVKQ7paddVkZt1VR8CLiLy6h7ZfQgxrGTObwpVXnZHqSFsreBWbU8+6V1j
         uU6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=4CymSXEdXKGBNP+tN3QKq0m7lY8i9LjF9mFH3fbA8Do=;
        b=Sq2VISqHox/UY0Jh55IgOb6doOpTlzIfqRgzXco4b32bQFTvFPmTGkqHgmTDW7KNEo
         TaO7WZV/GNT+oLcOE7qVOV0qMYjtaBXCEw7xMnlGnl67QqmY2n+YldqUWpXbeRsnyeLB
         OJOcCX+jYF4xBnyolkvea1UwD73sVxAPJHf6Oq0EbDyrzFUoR1xIwa4pt3VjYnreRnNX
         HXcAXvPmXo+eCH3kU5w6Ihoz5wAIcOy5A0pO4KD7QvhFMWx5sR5H1JgMlnuU4f/6cnrp
         T+uq2HIl5AWcXcM2mvdrpnccCakKzhNZPYBi+TwoTcDnGYQs+yckglBSj45NV3pUcV8T
         rlqA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4CymSXEdXKGBNP+tN3QKq0m7lY8i9LjF9mFH3fbA8Do=;
        b=Ye9sQnFO2s4PKyTYq9lhymYKEHotXvu3/ReyOuE8PkB9u3kICds6deN6NezbwD/ZQM
         o4geymnG+x0plGbFyt2zbrI7SBwFjQNMeuuEohRRSwWQJwQ4yRgeI2KEaOMezSwWwHtK
         O5CT5JAX3gy895z7yOf96lrJgToswoLUNIrArl1xXlzFekkrh7zVghdr6vM7OaeOD8VW
         XkPsDSgz3yhUa8x/9fVuZI2a8p7GCDIHsPIY22Y3PGaTMrqGsKuJ0SZKlbQQw7UIl2Ys
         OY6yDDcL06rBoMiJOJxFirRKlrTepA4/dR+QQocgHndOs5erueMreXLQUhDnQ48B6UY5
         urXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4CymSXEdXKGBNP+tN3QKq0m7lY8i9LjF9mFH3fbA8Do=;
        b=cI1jqYdg/fjS7rlEVUSpOperjTgYVhaEQGfXeUPqh2kDXPiaTgI+vmMuDTqpV3bpGO
         AmyjrTIZItZ+EV067cRGEJplqza0qCsRYU3qVp4LTQnrVz/w7P36bbzZ7so2oPQvhUCj
         DjOLEescUWgm/xg8XXsmguTEe/re5nuvpnnY8KLLocJeI/Lg+DavspsG7OmjzInJ0Zp+
         fXYLfWRqHdcGvKZu8C2FB3DMTdqATY70HJuibaKc7LWk8TXg9ZNW8zY1MEOsPzWNIIZY
         oLHdD6Nlyc1Vx9vx03q/zeNEiKVGqZ1x6+Ajyp5Q6Qgw3QlejE23kl7nJ7tnDE2ZDs42
         9lsA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530xvbx7RvtWWyQVmDbFmyj7/OSdq0sIvfMFoe0IiqGW97r2vVj1
	X3jN5DjamniDj5j+7JVwEmA=
X-Google-Smtp-Source: ABdhPJy3duBSVUREObCylZFVx47XfBy5bjjwnOc3RERMX6H4HB7DpsJSHR36/A2/PAGOCUBkGY+UEg==
X-Received: by 2002:a1c:4887:: with SMTP id v129mr2389438wma.13.1602664158193;
        Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:960c:: with SMTP id y12ls749489wmd.1.canary-gmail; Wed,
 14 Oct 2020 01:29:17 -0700 (PDT)
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr2278176wmb.143.1602664157282;
        Wed, 14 Oct 2020 01:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664157; cv=none;
        d=google.com; s=arc-20160816;
        b=bqEn9AAse1aCQi9HpOy/K+ll6om6GbUDn2aKuVpkynw4CNip05WrD8vAPvb+S989h1
         nVxoOkxe458lh0m4SbELEVsPsZ8dAmC1olNGT9899sHzI+8jOE5mk+nvlNedYywapWfY
         vYKlsswgkDRMNTc/KHfcScU2ervgGPKlU6j/74WxWcPOxZyvps0+SGKuHQAnbJdEgl5r
         W2cdjHrknd1WWSK8yrYavKybn7A4DwM7IUmKhzdtAiMOlNlchp5PONijImT7xk3EY4GX
         aj4go8fb6hZ1yI94dPHj2HJ/q7RB9at7lb4ktURxLZSj8C/SmpPQBgZmjWweYwsDDbyj
         5Zvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=0qFl/WFE/AZClamAnvDczSEwy7euhq+b0c8nmIby7So=;
        b=TLemRepElvicbpz3N3q/EklVbRYJ+eKNbr7VlYHjbS40MaJVBOjUAZ+edBhQUy8o+T
         X0HuhR6/WT0a34u6fvJyQjXpeCT058Sn2UmLYxnhZSBkWgZ5W72G1tBeJicrRQOYIUCo
         KcdQ0s534H4Kh1VozOpVR6zBrEPrTepv9khD0d/p1QXarrdCju4hySo9A9h97jPuV/wS
         F/NqYMdhzuG2eR7Tj4I+3CrjSiL86ZwBzEmcq7IqbsLuo/FBRCoKcB1a8Wlo36nJEM2T
         H3lmB8OwXOheWl62+QNhMyCChGSEp8XeoZOot/6uCusqhy/MQrcnfwnyfeMJXQnz04gd
         GVKg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id f3si40209wme.3.2020.10.14.01.29.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09E8TGTT021749
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:16 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJB002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:16 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 25/46] arm64: smmu: Fix CBn_TCR initialization
Date: Wed, 14 Oct 2020 10:28:49 +0200
Message-Id: <1a0228897399020f79c0243c60eacf2059774192.1602664150.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1a0228897399020f79c0243c60eacf2059774192.1602664150.git.jan.kiszka%40siemens.com.
