Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQNX5D5QKGQEYRUKFJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 94300282CD2
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:18 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id f16sf795663ljm.17
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838018; cv=pass;
        d=google.com; s=arc-20160816;
        b=VCkWtpq8iMSbYPSh3cgXZVgPRbuZk2wdlNgBzXeGkIZNDVH5SjMrv47sWsKEdI/v5x
         iyAGa2nM5EJTK1eDPQvY0Wkx1cA9wMDQYI7NBm3vn1UG5NJyqdlTTQlII6/AByi0j8+U
         PTe1NqKQzPkbtTs4UFFARYsuUZjvxMUs6l1/TaP2ZxFt6noJz7vkSpqdWNRYrzuY7tIm
         pgxf5i3xxq1Vq46CNzU/NL9hl4Bg2Z71GQ6+89loIsz6bjG2Nz/o6TwU9SBtTJJpXHaz
         EugSq+BRVZgRogWotaDpwgsrtUcn9VTQJxw5mEnAUlgAiEA5vx7LmGsUxLe2JDmKyO2R
         gLzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=CSGKmbWf4foCrC4DxVBpKuxBjySWNE2w24cIEmN3DWg=;
        b=BRK6XHrZwP1Ka2ZxQSHF5LplOa6X59NTYetXZMN9+hzE/f7DSS1qgJhJXStNUH4NZi
         /NYZio6P27yy7qmaXX3FgrVRTefcfo6YrYbv0obDVuFzzmK2w/1l3YiBqKjU5H6bFAyX
         a8QBiVuZKn8FYvQsFJ/bI1THYC1SF2Ffy6K3KHBAGGugEm/YfkLWiKlGw7CMTifng8SN
         gkEqUmFNnNpmCnvNMyyZJ2UjsC0asChsMJDqJXzJlhr8LTYhCnAhs4oggfdb3uEkYHhu
         NuRfWYV8jyv2Nl/sBAdaL0i7UDFcyrh50F+Q7QE4ynHuWIlUw2wan70+L9Njdsef+3aS
         T/Jw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CSGKmbWf4foCrC4DxVBpKuxBjySWNE2w24cIEmN3DWg=;
        b=eAjFFh134D4Hdgtq/t16iyhQdRa+AI89fy512hSh0KlLQdZ+RAe4XF3ZDy0MnvclnP
         8axE6VrWDK/EgcSpAzTsZXqxlV7E7N7LBjwtumbE3LRJQNCDIW3qKM0OrlSoCzjpzlOF
         GeCnsNfbWVaaMvUSsb8/sxay0j2+8rSE4A2ARbwORzCzyCPCtHtLq7h/RK+oapPIgb9E
         z+5Ge5HdXod60PHXpHq2aj/jIHbnN8F9RDFvB1I4gKUVTYd28H+Vi6v87Z/gEgBrFXUG
         Uh532bOuFqzegOhFEAmTqQVNhBLRYthLkOmJlFhfQwjRsmvU7taSfcd2cw822r99PjZd
         MxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CSGKmbWf4foCrC4DxVBpKuxBjySWNE2w24cIEmN3DWg=;
        b=CBLRd+o5un5b3g2Zjs4DwJEMoQ6ABfbVB0qY+sKcYfG1vf81J9u2Z9pljR5r6vagM3
         ZXPTj96KOH49xyzIcMpn6xJqUO89QyRbn1xmPNzesO6RM46RGprOif7XsTqvBWN22SEc
         OjIyDZOY1t/UTE0C1N3pcG9UP88INFojdHipsEtkXz26eYNMmAYbQaND1XfTDT/I9WrI
         QSIBwC6z94A4NjWC0atoHrV+DlRmZwrFnuL/ZL1Bb7bzyFqX+hWJ4GaqcAikC+pSRA7v
         P3zQnPepCqU08oHCa3VbUXaljkz5IelLkRedXoGMl6DsjQf5l4MHNzWLjOpc0+GsPkkN
         1NOQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532WQVvb7jn86MGelLgLZGLU8Ex85LBXv07wsesVqT8WhuhTVBQ9
	5cAoOHoZSihTIzLrgLZKnEA=
X-Google-Smtp-Source: ABdhPJwVEB/02CKqHlDDq7QA1sYBvfdpS+9zLa2+o9Ej7vz4cOjKWpyCnE3pwRDJxUw2IIB1gy78DA==
X-Received: by 2002:a19:8ad4:: with SMTP id m203mr4764472lfd.183.1601838018165;
        Sun, 04 Oct 2020 12:00:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls1119085lff.1.gmail; Sun, 04 Oct
 2020 12:00:17 -0700 (PDT)
X-Received: by 2002:ac2:44a4:: with SMTP id c4mr918114lfm.365.1601838017010;
        Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838017; cv=none;
        d=google.com; s=arc-20160816;
        b=00lyiPNgj1Wt3cJsnR9tLZzI0Uu2S2mIzTdZd1BvM8FR+3dfJBfr58+7AU8CFHmO2T
         lXwpjecUO9DmBooQuKMQxBEA+HYllrznd4XJfzLhIy5mzDsIKhgbA35u0Tcx1+yQXOgl
         lU7M3VzyJJEnaCDNvLOmjuvhl0cfFp7JHIHmlTRIOTBGt9AxxyAnGQZpY8WwhQOFo2bw
         0xCPppSO1BXmHFqyk+TJ9OfYSvc3uYX9RCtKtdy5/AcNuVjHSobCR5lfGvBYf7l6uqH2
         EEyl6HnwMYLWB0jp7n2Q93UpReHHRV2+VKKeMYsTvdyZuyMzRml8xxoqSBjHrGIeznrW
         pMnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Zb+F0SQq/gt2490JqlwYMVe7mZZyjHApKyOPCksBGBc=;
        b=aVZK8JsU5iDqKbMF2ei+CjxQap/bui0fwlaoeFndszcfAlfxUA/Tf2YTW7iinQevxp
         x/EMHSyeRoNtGgkm9PxdYXUU+P7KGJ4lylvHPf2Z+G7J09MphJ+fqc3OiDELUzAdBPeM
         yDOmz2PhmHpZ/iVpnPmdhaLi0Aa/RL0n8vRw4BrV3rda6hK6Zzq23DvhDZdYCnfkN1LK
         J++GJLm/OEc2h1HM1Y/mT9EV4l1JtrA39wWfX82XyMy9+x+1zGUqqFfZZioqNbDe3c+z
         Q0QOSnG9M1Y2uZTvMJDcHegv6xaxUQ/6B52p/8jDH6HCis3Bv5a9FduYApeQcX5iLylJ
         8AlA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 21si171221ljq.5.2020.10.04.12.00.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0Ggj029834
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:16 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060p017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:16 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 39/45] arm64: smmu: Drop more unused fields from arm_smmu_device
Date: Sun,  4 Oct 2020 21:00:00 +0200
Message-Id: <9f7b93860e5a4af3a690f4098563b1344fa9a676.1601838005.git.jan.kiszka@siemens.com>
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

num_s2_context_banks is only locally used during probe, and the rest is
just dead leftover from the Linux driver.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index ac6d7472..e316a553 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -158,19 +158,15 @@ struct arm_smmu_cb {
 };
 
 struct arm_smmu_device {
-	void	*base;
-	void	*cb_base;
-	u32	num_masters;
+	void				*base;
+	void				*cb_base;
 	unsigned long			pgshift;
 	u32				num_context_banks;
-	u32				num_s2_context_banks;
 	struct arm_smmu_cb		*cbs;
 	u32				num_mapping_groups;
 	u16				arm_sid_mask;
 	struct arm_smmu_smr		*smrs;
 	struct arm_smmu_cfg		*cfgs;
-	u32				num_global_irqs;
-	unsigned int			*irqs;
 };
 
 static struct arm_smmu_device smmu_device[JAILHOUSE_MAX_IOMMU_UNITS];
@@ -353,8 +349,8 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 {
 	void *gr0_base = ARM_SMMU_GR0(smmu);
+	u32 id, num_s2_context_banks;
 	unsigned long size;
-	u32 id;
 
 	/* We only support version 2 */
 	if (ID7_MAJOR(mmio_read32(gr0_base + ARM_SMMU_GR0_ID7)) != 2)
@@ -400,13 +396,13 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 		       "differs from mapped region size (0x%tx)!\n",
 		       size * 2, (smmu->cb_base - gr0_base) * 2);
 
-	smmu->num_s2_context_banks = ID1_NUMS2CB(id);
+	num_s2_context_banks = ID1_NUMS2CB(id);
 	smmu->num_context_banks = ID1_NUMCB(id);
-	if (smmu->num_s2_context_banks > smmu->num_context_banks)
+	if (num_s2_context_banks > smmu->num_context_banks)
 		return trace_error(-ENODEV);
 
 	printk(" %u context banks (%u stage-2 only)\n",
-	       smmu->num_context_banks, smmu->num_s2_context_banks);
+	       smmu->num_context_banks, num_s2_context_banks);
 
 	smmu->cbs = page_alloc(&mem_pool, PAGES(smmu->num_context_banks
 			       * sizeof(*smmu->cbs)));
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9f7b93860e5a4af3a690f4098563b1344fa9a676.1601838005.git.jan.kiszka%40siemens.com.
