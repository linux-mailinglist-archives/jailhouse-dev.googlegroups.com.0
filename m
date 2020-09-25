Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQW6W35QKGQELXUKZGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 6413327832C
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 10:50:11 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id d27sf874644edj.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 01:50:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601023811; cv=pass;
        d=google.com; s=arc-20160816;
        b=cwjA27FHdBNQEg2NuA3aSW8STAa9N1lXP51i7Wi4152GBfoodwTGKT8BTXHq/3KeJW
         GudfjFm6xS3HTy2i3LK/6xQv8MBa6SI8KiiXij3rDFibhVXztsuOC04+tFiSqMflcINh
         /oBO09YGa+FQDZmABSFg00MpGSTyLOHc0POYqYZlF4kGVgmhBCIGHE3CdfMt9MCiFPci
         m/bFF9vFnAuuZSa8KL858L545+UqUr1cu5qfKhkvh8LEgj5L3oRvboOwGISLb98JjW2A
         kGc92bSE5YDwFfBmMBHNRB3AIdoGsYLbmqMLcQmKk5++W1W+c52r+G4hQZmfJbBFGLzo
         QdZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Er939JGqTEgiNVzALO0ojMPvS6ZkwQSTYi8o2GypRq8=;
        b=De09dOJMtyfN6q41whJeUhxXApOKNcfRgURbmIY0moxVBEu2KeTCEw379lzpxJH1B6
         LMs4dozhsWWQQDjz0Dw0r6xNj/VnxLQS/wEDPgIgbZggef8BxIRAfJOt3Kb7F9NY2mWM
         0hwMatHDpZKm04wYWhfb9BMd3E1ilcCF3yKsR6sJGfkrcbuFZkH529U4pJl6ZOEQqH1m
         Klrq1BGAZp8QHyM8BF2EP8zWoifS2A47lsnXsOi2xljvaabCTqZDZ1tTNatcBpFxvoKG
         TpHk83ePGV+ksUqXFiYlXw0dnfUClo9xZk4Hg4naCkKmg3iBJ95dbZMLQemJAFSD278c
         j2Mw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Er939JGqTEgiNVzALO0ojMPvS6ZkwQSTYi8o2GypRq8=;
        b=FP0okFOLOo+zL4461nhuvtoGNTDdcvY/Entf/8+GD0Ltrf2LKjZ2KS1XeQ7/EZ5/AP
         tvzBBdw8QUXDW2wHakXScJXLHif64RcKV8uyrhiTSW0U2CeTarzekXPB+aOusbCFmkUP
         a0rxpEpFuYN2OkAieCkfZIAVZru5Zq15xvqCeumlop7aLEU/6xrGjYUpGBquAdx+/8NN
         DshtuHL4OmvNGs4ofjyIgIsH3YXNQdFgcMIGWj4gjk8pbE9w3AG9yspgEzaza1Zd04/W
         tmRgY8WVYYkEMJ2EW3oG4RYxhvMQSZAwLFZ9kyFdSlhKeg8FAdzHIxImdTdRy8DrxzU0
         IWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Er939JGqTEgiNVzALO0ojMPvS6ZkwQSTYi8o2GypRq8=;
        b=dz0FoHPGEIiqlR+NitzFdUCKfashuRDXk8dvWIiRFec2tqR/oa4mOK7Emgx6vRA8rI
         hcUYoPsvj7VwKpcEDnARWkG5wmPq22x2De0XxFlOZ9IbLHtkstMrIrWnIM33MsV094WQ
         S653FSde561n2G8CkDkpnfeIrlAuQtiEsCPxcryz6Cb2S63Y0jFfVrk2iF4jK0w6Din7
         byLLb0swqQBZizXJStbCDaVIUeuLC2PyDGmhMKyaKIQizdFKnsR1lr2SeKl8loCMqV2l
         Di8M/YFnd/l9EGYuzeAyapBMMgZwBcU00iTTg8CVqx6LuOoCIe3GuYR3XdmFwbsT5lCF
         GZiQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53357nqb7Tj4o/zh+MYiUn5PosJqyvBKzEbgiNd3PsUAWxyjXVFl
	IFp6egduvR0zL8Ek1yDN3I8=
X-Google-Smtp-Source: ABdhPJyNg0/PRC5Y8VXo8Cj8LnWbvG6xSFPw195VDdMU/woleo06gz28chMOMrYqx88Ya7PMGaPeQQ==
X-Received: by 2002:a17:906:874f:: with SMTP id hj15mr1722036ejb.539.1601023811064;
        Fri, 25 Sep 2020 01:50:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d0c8:: with SMTP id bq8ls875197ejb.3.gmail; Fri, 25
 Sep 2020 01:50:09 -0700 (PDT)
X-Received: by 2002:a17:906:a293:: with SMTP id i19mr1713261ejz.428.1601023809739;
        Fri, 25 Sep 2020 01:50:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601023809; cv=none;
        d=google.com; s=arc-20160816;
        b=tlAqERObHUXsMILSotIWOMzpqiGMSeBl4/uBu2fvhI/GTJcMGDgl8V9lAoQcEW/Sie
         Ov91CSMjkHu+46YqG7w15b6y2DGaS46s8brDBD4dc3WHHz9/nbePbpSDYuyrekUN2d8L
         H/goGZJquZDLWvGHhJmnjMN2FVPg5zqzKhHbLS/2lZuZJtE6XZbL1w0praxO6CNOGnUR
         dCShW+MRr3zOMGqTXpKKnhkAUhXLT2qSn8n+ZV1fznw3GrP/fDLIhOz0bP0ipmRZ7leG
         c0FG5pt9yHYNLQ40hNjREHp0azITsRyxK7ck1eBgCKBKhTcvIAfmsPjrpSmSQkbjUFT7
         0etQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=fVVmOo8hPp79TVg9pSu/g9JRpwg/JqxtQc+Z+AVYTXA=;
        b=YSdMk98m7f0Kve1pnjeZ48/oQ74dUMmGXdfGZlbaMkVdwKgn9rJRDPcIG4Skm0P9sj
         bJns+XLhXmP0NslGUpm0LE7e26p6KZ87VDWWtE6dfZgTa7QA0s7D7GX+X7kC5toIbJKp
         FknAdG21tZl943MsfDL9a7szxYv4auocLqx/jQPRZd3UmcXP5miQ7g+d9oyqBBUSBB36
         O/inwPfV3dXlldpQ4T0hVCKDWthioRz3+XHw0dKx1Gf5nVcsD7h1GalBcYaGHSJbzzFW
         +WRLRQlBYG2QsTgfG30Es17KDRI6PdGAI36ylCwbMhVoZmQMfP2ynL2VVo8klGdDSLKL
         BEPA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a16si89973ejk.1.2020.09.25.01.50.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 01:50:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 08P8o9PS005984
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 10:50:09 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P8o7IK027224;
	Fri, 25 Sep 2020 10:50:08 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 3/8] arm64: smmu: Clarify that mapping mismatch is just a warning
Date: Fri, 25 Sep 2020 10:50:02 +0200
Message-Id: <05a7d5fdab8a4da1bcbba7a1deab233c3a217f01.1601023807.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601023807.git.jan.kiszka@siemens.com>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
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

The Linux kernel commit c55af7f719cb writes:

"Such a mismatch could be intentional (to fix wrong register values).
If its not intentional (e.g. due to wrong DT information) this will
very likely cause a malfunction of the driver as SMMU_CB_BASE is
derived from the size of the mapped region. The warning helps to
identify the root cause in this case."

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 3b2d6e15..e8dbf186 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -679,7 +679,8 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	size = 1 << (((id >> ID1_NUMPAGENDXB_SHIFT) & ID1_NUMPAGENDXB_MASK) + 1);
 	size <<= smmu->pgshift;
 	if (smmu->cb_base != gr0_base + size)
-		printk("SMMU address space size (0x%lx) differs from mapped region size (0x%tx)!\n",
+		printk("Warning: SMMU address space size (0x%lx) "
+		       "differs from mapped region size (0x%tx)!\n",
 		       size * 2, (smmu->cb_base - gr0_base) * 2);
 
 	smmu->num_s2_context_banks = (id >> ID1_NUMS2CB_SHIFT) & ID1_NUMS2CB_MASK;
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/05a7d5fdab8a4da1bcbba7a1deab233c3a217f01.1601023807.git.jan.kiszka%40siemens.com.
