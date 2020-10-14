Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYPNTL6AKGQE5UDP33Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A0928DB6F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:22 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id v14sf363802wmj.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664162; cv=pass;
        d=google.com; s=arc-20160816;
        b=rkFrYegqapuCuOJkmTKvl5HwVD3yJVyenDVRbnkNBstaobYH/l9SGdmKuSjDU4bKwf
         o8PMBv+l0R1jHy04WwlMUlnnpvlUZ5VYZ2fUyxxD3+ELsXMHjg4dlIJPji208/HEQEZm
         UqbGaMfMB2CsiaDa3WX5CfCKHlyQUp3SUsoAE1cI4lyvoK2bCkD6acUHUI8BRGjLU1Ik
         rKP9TnGZHiQV5tk/oszFrTc+/budW/BlL/sBDwuQYSGE+Kpp2g1wta67Tt0FxlsB+Bcy
         twW9dNDUu5AJRw9wccp75jKH6JQD4D3ScdVQNqUCnGDFjrWQ/29RUIRPyLvOKgLd3hkG
         V6eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=IdtqlU44gNyTskUhhkAHl/ceR5AER03rTz+2E0M6EdI=;
        b=Nk2sLbSGB9jFxqbKQn5zJ0m/NPal0HPOXica0LQo7X6UfHzID3H74G//wlWfqkx7vJ
         x26ugIPC2fxkTrZ3WkjQynjudKLfRC/kQheN4vL8kRThYdC25WhbJ+B+9K3OL6rkw3z8
         cMkWBsre2wQVKqG0POVkCirg9KCJmDoYJDDW6acWaMZSOVuyvXw12kqurKMyk5PS9a1e
         4XFxfA1e8XouoI0P3r8+6+tcvJZ2ZWBixrEb8fflmslPY9UcQvaeiz9LeuCBuHkEs2Co
         TyjICs9McVOeNFDNJO8EkhySGkxx8f0gwA7WKyidwMg+3ADLP2ZavSyqATl+Bf9ghEr8
         T6oQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IdtqlU44gNyTskUhhkAHl/ceR5AER03rTz+2E0M6EdI=;
        b=FkC0kR7ES8pvy63gj6fs56Y015swy8XiPUthuzoNpEoUUxDLYdQjbZzm8bIn6v14Bg
         c6OkVLKHV4GEazksMSZSW+eH6EI1XT4P774yxL0OTOdALKIEvGJcV1RNCelr0wxXLP/t
         MQ76rySSgr44EcIeQtl08ZvHBNgwlvB238pgjgwb8tg+3MZIOxdlAMxUfeFIbD5nUjEy
         YYPxyH1ZrnonLlvXqQ8ccY6PZuX6PDwz5ueV0SUltlJMw/4Z/OgiFErWYm5RqETNmHSi
         yP+OhwXrYjQWVBo19Rqo8Ocke2PAxTcnzdRJQjc8u6LjzyXE226yGO9GVKKy8HtF/gFA
         tBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IdtqlU44gNyTskUhhkAHl/ceR5AER03rTz+2E0M6EdI=;
        b=rPcuHSmVw1fyT+X18leDl1cgnyu1kmrsM0UckuHLpk0s2tRWDw1+UhUvtqH8BEksJo
         KcG/C8kPdHUJp5CF13/CgF3WhUO3xIp1Y0/uoa0DgiAq3MCSVjntx8dX/PfqryeSbAeT
         rFb7BiV2Lcm+GpUH/yYdEqwinIFoCmS4rSrCsUxpM9JyT4SSJjylPT5Tfk2sxqBJV64y
         u7I7sqULx4GXaHe8rGEITIAXrp/YyH2RkFHFgfwKoTqMvjbodOf/YF1zt5t9usN7N63W
         A+QWNhSQvSOlZQEasC8cWd8QeDm3ndUMJyLGso/RFLPHDZgX0ftfqn3I5cu636EWN57v
         YAZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533JU1qHKftWUQNWEPDf/elBGumeAvhk3AiJurDU//+T2O8SP/7o
	y7FQCk0CCSfxEKjIL03V5e8=
X-Google-Smtp-Source: ABdhPJzYNHM7vdRbuUaCGdo4lslHhShXGsS38FSwmFEDUdjMR6vZ0QeoJVMOiWApra6IQ21LygK1Bg==
X-Received: by 2002:adf:f4d1:: with SMTP id h17mr4353451wrp.41.1602664162129;
        Wed, 14 Oct 2020 01:29:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4e19:: with SMTP id g25ls750999wmh.2.gmail; Wed, 14 Oct
 2020 01:29:21 -0700 (PDT)
X-Received: by 2002:a1c:55c1:: with SMTP id j184mr2290311wmb.180.1602664161205;
        Wed, 14 Oct 2020 01:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664161; cv=none;
        d=google.com; s=arc-20160816;
        b=BDJaiENLiI4SvN+9xy0Ga75Gu3PHprXhaZ0G6HQfLCINTLIAFS3kCQlU2QXvqvLJ9y
         uyN9ghJixpKdkr+dgHlSD+LiNOX8hfQoNLZbW281VMeul8cZZQGo75LPhKLcfuo1vPkq
         m3OK7l1pqFvTCCfAPddgF5Yy2fzD6WdCpBwMLiyuY1bsCKVsEAHRwn2b94bwkuHYxrNc
         JzZc3cADpusJH43iRVmSZNO0pOb/xhUm1oAsu98flsHSV22NZ5ij5itu1d4usSf+gutg
         AaFS5aHpiB9Cd8FUorjQp9bXT+NzxcjT7RduoeOXC5u1N4w9SiBVhCK/bI+KCRh2Ovnu
         mPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Iy1KB+XScOR5aRw2yoi2aa3MjJmhe0e6IDxrweYL5/4=;
        b=mMQdPkOQXXFvsd/uISjWLHDl9EUE31CyNGdsy5z8Fgcyfjw28QB26hwbXz1eE4O6hD
         rsY3gTYMEiaEyJN2GlIxLWxET9pbRVyf6GMFNlULU8rZRIAJ+5T7wYi5G+zCzUP8o+3m
         6ptn62eekRBsoFQYOLXrY4AxnU7mxvVpO7mO8SIe9PyZMqr3W6s+nCbyFaYzCqpjw76o
         FL69Cot0g7zFmEwNEThQc0bondYuWWG0lFMowE0+DCOhrSEZ/i24ZKqnVLheOTRnPxtI
         saSTX0x6dql2yOMT72122+05NSCy5cCrIwrdT/m2CaVjjJHvCZhq+muUMa5J5mwkBLGw
         MnPQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id w6si49752wma.2.2020.10.14.01.29.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TKrX024015
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:20 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJS002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:20 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 42/46] arm64: smmu: Rename ARM_SMMU_CB_TTBCR, drop unused ARM_SMMU_CB_CONTEXTIDR
Date: Wed, 14 Oct 2020 10:29:06 +0200
Message-Id: <ea9386c2f2f4a47ae24056af01eabda483433297.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
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

TTBCR is SMMUv1 terminology. We are v2-only.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index da904d1d..e255e381 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -101,8 +101,7 @@
 #define ARM_SMMU_CB_SCTLR		0x0
 #define ARM_SMMU_CB_ACTLR		0x4
 #define ARM_SMMU_CB_TTBR0		0x20
-#define ARM_SMMU_CB_TTBCR		0x30
-#define ARM_SMMU_CB_CONTEXTIDR		0x34
+#define ARM_SMMU_CB_TCR			0x30
 #define ARM_SMMU_CB_FSR			0x58
 
 #define SCTLR_CFIE			(1 << 6)
@@ -259,11 +258,11 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	mmio_write32(gr1_base + ARM_SMMU_GR1_CBAR(idx), reg);
 
 	/*
-	 * TTBCR
+	 * TCR
 	 * We must write this before the TTBRs, since it determines the
 	 * access behaviour of some fields (in particular, ASID[15:8]).
 	 */
-	mmio_write32(cb_base + ARM_SMMU_CB_TTBCR, cb->tcr[0]);
+	mmio_write32(cb_base + ARM_SMMU_CB_TCR, cb->tcr[0]);
 
 	/* TTBRs */
 	mmio_write64(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ea9386c2f2f4a47ae24056af01eabda483433297.1602664150.git.jan.kiszka%40siemens.com.
