Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5U3576AKGQEYIBT5NY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD1029FFCF
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 09:25:28 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id x16sf2352960wrg.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 01:25:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1604046328; cv=pass;
        d=google.com; s=arc-20160816;
        b=krg/QOdU9kMT0EaP7Cfz4UuPFPy6TYT8NHBmQZSq7s4APUz6AB+SCQR1SDMdKhvGSr
         P3qchSS3bmXaAhyt3FrcaJYjniCt6qz23a+swiWcZ4ujy0Lj6soS5cpcR4T89cg5ga/r
         EwBmDVVgQOGlH9N1jdab8+9oLscUE/M59YPiTwobR//4yVfv4N4m3nuXoLnoGctM21R6
         1w0TdI8TE64ZA9mfL4rfg44fm57Z56uig3vZYKXNx88mjchZaoMAS+FezREPuqGMXpzK
         UpWB6pap2cM4OaRSOxnpkRMcoyBgrCjHYCDY9lUx1LKfBAp2Bj+rTdYqdyZWBiBkdF1T
         GZYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=vJnwEgCuI+5l58u2AdmK17uitrvrasXnUvcbgya2cjA=;
        b=jVQ9jwwnBEZ6b3C2mmN7Aum3N5Qz4uT8z0omPvYKUXPy4gAZDdmSz7S1v1k0nomj8a
         4K5vr51cIoQLAL9cIKBjJ+vN0sgWSByYsNr6u1GDWuVwdwTx0rBvWi3O+UQD39TJpouE
         we0uWk3kVOt1tJJB4GGwvPHR19PxiQ3zdp+IsLGgAouunZTb4aHAbczF7Wh8C0eThM4S
         YIe8dvELHeFt9aVzm4QnkC7qBfH6YRBt8BJWvqyFJ3mZfNoZWx6Mk4g3UaOlYS95FWRB
         GJ7CmU/tsbZaSyT2D8HCvXv6udxfdQS32fMls+DZidqmQkuo4eT2/064lTe4S3IuFu9+
         tcSQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vJnwEgCuI+5l58u2AdmK17uitrvrasXnUvcbgya2cjA=;
        b=MQCtcrnCxUJpwsRtDeOUuEtyNK++EhIIDoviMytwfzHRCpslW6WMItiK7OSNGJ9r1w
         r+HNmYX8PZXXS56Jiqql2tNvfDoNhv4DQke3CcjN7QZJr+ARTGTrgYFnjKD/wisEILy/
         go0NK7ygabgyoH85SphCqTe8C7B977cciTLqTvcqtmmFwH1dNaVybt1fzVHu7YBEKilW
         0GSzMadZEhdgMPNlH8dL3kM0uMqdwtJcomOyyuq+QYlwTwbib8Myy/AtbceBFgC6ohL5
         +yxr6gOswroOOZHUKLftMmTQHGbysJXDMr9j7XaljtbiRPToDRshzKLvNbiHuzCJEzkj
         i8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vJnwEgCuI+5l58u2AdmK17uitrvrasXnUvcbgya2cjA=;
        b=DQSTMpj8qpuLE+uvolx8YQELpXGR0JQxL1HzNKOs4vfR8r9pUp9z0nN4K+XyY01IH3
         QvateJlc3E1RBFnR2oUcsN8hY0uXUjaFUNbA11d4MoWAmB5VxwSQHDOOAwNpg3b4yChq
         KJg+mJxzzGRte9s/Ls6Kw1KH3mYWxrYmQCthP3/RnqpqNrrlfAoXkyy6IO0WZ3VQONPe
         hjUOPpCba4fuwoI1gSi69/7sqoMEWyDsVIM8yn2NOis1fJpsooTVrIHG6F9gztIvhRvP
         cXBcHM39VrWlY2lMjyCkiT5iVn275S6qHAzcChu0AYQFzbd97WnVZfWo0fCOjHfrEmZ/
         qTsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531dL2Z5sB8byEKcFeuG0K+HpIHsTi8+1Ll/NissGGdyhmObPoaM
	sD0PHcNb7sqeBumsAKiwUOI=
X-Google-Smtp-Source: ABdhPJwhKlqbBIQogINY1DaC5ejcUKH0hHI1rrTml3/HFOoW99xAmHZ1w8e90bl1E5PTJA1e1gtLog==
X-Received: by 2002:a1c:a98c:: with SMTP id s134mr1296924wme.159.1604046328228;
        Fri, 30 Oct 2020 01:25:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cf33:: with SMTP id m19ls316332wmg.1.gmail; Fri, 30 Oct
 2020 01:25:26 -0700 (PDT)
X-Received: by 2002:a1c:5585:: with SMTP id j127mr1323626wmb.90.1604046326088;
        Fri, 30 Oct 2020 01:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604046326; cv=none;
        d=google.com; s=arc-20160816;
        b=f5I22LRJ7bo9q0cya5qFoT1GPqNjXqFOcqScd8ahjGc4yMANOZuepTltcfywzNzFjB
         PRvsdCAGMrxz56gRYunpXY+jBjFwGelt1ICvlWVlTA+m/ij6vei5XtM6JG/MZYcK6bOo
         L4ONyzCoE0GvWu8a0aPoH07BklLvhg5XpCCJqo3nnsKhL/e6sQsRUkP4WOsazF9Lxwxu
         b67f7ZXaogDTJvmepYqKotttCGkZYfar/F3U3InUvTdyNzKUnlYgqqX/twvkVRIeO7iu
         rwIyuzXGxUQoXlLyRqYXaT7Dxxv/BVrXR0hmflBJMNH167LjAH59ds2p66JGQYuqaL5G
         TH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=wcs5WUasJngrRn2NYwWq+XqpfYFqMdE9GIQ6HBLYh60=;
        b=BV/Wz/cbDvCUdjBkbSsGnM34ton2uSnifkRxvMW+smP4aZhl95P4yg51y9cp77vEQh
         ZrztReHRiAItUEldEGPWM0vEtwGdKWjfrCTopwQqZHmbdy55fY/7499UT+7eC62CMr+r
         OYM+EZfBouN3nV/930UXAkEgsaeWIecUp9aqkSyuyL4FWwB0JM5NYDtMqnDVMTEwLsKN
         13oUhKd5K9jdjPXX7nE29adN4GwdNSR/v2YoLz+rohOuHsgMKm5h29v7MjJiDMx8FuMf
         LECqbeL586gKhlogFLYN7S6CgmM+qpgDH/qdHIK7zWrUCmWR1KfbNs4ZAFstv/bU4va3
         TyYQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id o16si121052wrv.1.2020.10.30.01.25.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2020 01:25:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09U8PPrx028416
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Oct 2020 09:25:25 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09U8POnZ017181;
	Fri, 30 Oct 2020 09:25:24 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] arm64: smmu: Do not enable SMMU if TLB flush fails
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>
Message-ID: <abf70344-7a40-8835-88df-ab970d50c4d5@siemens.com>
Date: Fri, 30 Oct 2020 09:25:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

We won't disable it again because num_smmu_devices will not be
incremented on error.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 89631d16..2e616204 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -238,7 +238,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	void *gr0_base = ARM_SMMU_GR0(smmu);
 	unsigned int idx;
 	u32 reg;
-	int ret;
+	int err;
 
 	/* Clear global FSR */
 	reg = mmio_read32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_sGFSR);
@@ -295,10 +295,11 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	reg |= sCR0_VMIDPNE | sCR0_PTM | sCR0_USFCFG;
 
 	/* Push the button */
-	ret = arm_smmu_tlb_sync_global(smmu);
-	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_sCR0, reg);
+	err = arm_smmu_tlb_sync_global(smmu);
+	if (!err)
+		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_sCR0, reg);
 
-	return ret;
+	return err;
 }
 
 static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/abf70344-7a40-8835-88df-ab970d50c4d5%40siemens.com.
