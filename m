Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYPNTL6AKGQE5UDP33Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDE528DB71
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:22 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id t8sf285400lfp.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664162; cv=pass;
        d=google.com; s=arc-20160816;
        b=P0DNDHR5vXjD97iiCFW32fiAEyJAjC6tseDB5syzKg7/j60OBfx2ck407ZWu1JCCVe
         axQZCp9LpnVcsuxOVlPYhb9hO+Bw1/+uOk102aQLCIF/a2SFHxO7d66d174e5wDZsN+z
         quwO9Dyv7PES/EjiIMsrrVAHnkz6nIn45mNMrBWpjEU6Vz0cLHNn76zf1bP+yFL5o+Ku
         EFePmj8QlJD6x+r32PEVsiW4AZGhXsV/tHY0YZZKIyN0Ow4WE/+hzRIwYdyk2+Y2+UKa
         wTkSer/DZnqel+VHPoX0oti4iHAqiZAVBWD8TDZ37BqyNHKzcUzXdwAiALMhZlJuyJuq
         GCIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=H4iuvHJZYXCeEpp9fIyf5bI01l9Ba29YmnIuNdZTYfI=;
        b=i4ILu1zKnuPZSvfRb6Kgt8f+F6GZWR2wT2FmNJOKPAdwlov4iedNJwT/+GG3shAhNY
         uitgn3F9BtnTh2N9FIt3w42EOqCUD82nD3wQbyVJIjKKN82PqAB+uLuP4uUVnDmVVhle
         yJ7s7/gq3+3XBIbeq/6t9SigUmTR+nORUMXWo+0X+R8E8EYUbjlW+fUgfhDzj09LqhD1
         BlChwjm91Xj8cAY2Eed24nye+ECZQnMDSVxMh2qGM5gvVa3YeCjJrahjvkJbbpZJBE6p
         yJLxdiL4jBUfP9/VKkbr0zFl/2z8otFnWDCswWd4E3u16BwrTSbMPT5gsW2jt743XK7/
         KnkA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H4iuvHJZYXCeEpp9fIyf5bI01l9Ba29YmnIuNdZTYfI=;
        b=Mn9U6d6Oo8h5jwZiD9IXoAOpui4HAuN6xDxKNxMxd+RgVRpsuRE3wukhyFoU9MlJaH
         kLGAkkoGNcxuuKdNvWs6wI2CvcUb2auZHkhowUlsngnIRJxM01dSiTirlaVcz6ZTEwzi
         Qhd6FYJmp9pha4+nzmy6unHNF28xBT9CGUdyeWdjT77khT9PSJ+UkVQX9oi0miozetz7
         sGhEbpnLW4hoxaIrIqYGn3rf7M9A7cK1ehpTkAJvMWf4HUkMXQJC90AeKs5MlTi2aUxA
         cRP9O1EpwVrN+NDoRtRr05Tlulpn5OQrwGIz2unvd4Cq8n4PEW2aqcTz4qudWa6CcEP3
         dZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H4iuvHJZYXCeEpp9fIyf5bI01l9Ba29YmnIuNdZTYfI=;
        b=ipbwXy1zljEh6CAqH9PQyoOj591YBSy0AzWSTmd9qjUJpXNgLOrndBEF7Il9VCGxjr
         d75A3fMGXKmiZ5KU26SLtQov5H87KThdMhqJUSuGPcHWUvCLDcJ7dMqOzagkZATHX4vH
         Hv4NkGrXEqWARkl0WYnA9y+BWbUpDU8Imf5R9jkK57hW6lWk3LBkKab84ogSBN41cGmw
         MzufCQ8DyqQzzUyjfsFV96yZog0tEat5zqO3NuajjSP+7w99bLCsbCWQL6vSMUS6iTkm
         VDSgzy20CCef7sAHcvG+hM/V0b2UzU2zcpoqByPuydtO1XSOiKoTB+h4Vu09+fcP9QH0
         X4Qw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Lp0MSO9Xdc7Vmx1IvLSwVw8L6XJHEwNI1GSC6/SWz+VuLumDG
	6KBowqhXQo6mBoSMSTO3ayo=
X-Google-Smtp-Source: ABdhPJxktXR0Ws9HZdSeSc7noXEiC2zX+zlza8K/JuYSeEN2wM8i5I4MIs931H6gfJC65pQCk4VHGQ==
X-Received: by 2002:a19:4006:: with SMTP id n6mr976230lfa.28.1602664162099;
        Wed, 14 Oct 2020 01:29:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:14d:: with SMTP id c13ls488313ljd.8.gmail; Wed, 14
 Oct 2020 01:29:20 -0700 (PDT)
X-Received: by 2002:a2e:a374:: with SMTP id i20mr1453968ljn.143.1602664160848;
        Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664160; cv=none;
        d=google.com; s=arc-20160816;
        b=RbAUPS2mDYNTdvzBP7lnNXltArMtL1DNcqm+3lukl1UqX1Q65152b/W4ZjbBYHyYH1
         Kn0JpsoeC6/8IYsZZnYdwMO1kjri1VV/uD5fFr3O2ixu3apDYBpnSNqNtjLdm2Xl9Wxq
         EkruYGZrOxTr2cIYbsnOjUqEmnsz6VVsG9PcHKqUj1aACkxjWMsHg8X4cUOFGS+AiN9B
         IGc5B5u1tCmJDJXvlmMHH6II9J3GRK9aACTNFa3bTtu/lUZFNHp46rQr5lQfONGbMc5t
         hATYQ+eKHkT5K4NeXx0Qmbazk8yE1THU7/94IXZr1uZAxTQXOy3CfJKgETGJEdHslOId
         ffqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Zb+F0SQq/gt2490JqlwYMVe7mZZyjHApKyOPCksBGBc=;
        b=xUyx9S1tVmUB6IE5l9iq0ATUBP67KLcu8V2mV5y3YjsipK+ozrZpUB7SY0jIOh9jkm
         asji5O+tLrwttdJjkGIKBP6qxEwy1yFLWWvplrQDpBgwA94wlGM/a008C2gQPx4wkBOa
         /O1GO/Cadi1Dz32KtwBGCRne2bkJyO+4awHLvBkGtC9gd1E3B2Rzr6UbfGnfcvWhRq3w
         aZBvziUGcnl9aIFr7LMqQ3trIWB7Tt7CO6fDyXgFZ0P6jiX3ye57IpK+zKUpMZ7zdZhM
         eodjf6lVQhMH+gAe3t1W8pEBzpImzUTr/pKR5pJI8VZRS18QCJN7SCbg8J3wL/s5Crtf
         wQWQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a1si80130lff.2.2020.10.14.01.29.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TKAu001707
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:20 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJQ002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:20 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 40/46] arm64: smmu: Drop more unused fields from arm_smmu_device
Date: Wed, 14 Oct 2020 10:29:04 +0200
Message-Id: <e76bb89f558dab4216a0c0274ca761740d265cb5.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e76bb89f558dab4216a0c0274ca761740d265cb5.1602664150.git.jan.kiszka%40siemens.com.
