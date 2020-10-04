Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPNX5D5QKGQE3GZJ3PA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BE3282CBE
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:14 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id 21sf604354wma.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838014; cv=pass;
        d=google.com; s=arc-20160816;
        b=SYHbEZ8Ban77ZCcBsKs2Oe1zI4mk/WCXPqXaVI+P0sMQUzZ6EvINSmKFJ/zzcAv/K2
         IZV1gH6kiIRgUgz6w30beAWQJzHLYi/wNART7wB5T7gA5Iwp11W7lWH0R5XEIQmmPVv+
         djIH/HZl+6GUY+9Wqkz2ijXM4+1HMJolTZKv9leD+buwKEOwIftK2tYphCkvZx/nh/8m
         mLir8qSnuQhPZRsuVXb21PmSHBVe9xMf3viyqYyLg0px1CsqEaPX/9JcGqCBC62pzHkr
         kyozFSRUJwHEjkpLbSej7pqvNZj/Qe4wJKLynaq1Ut22z1/9WOlc1VGB08ZcFzEdJHM9
         R2zQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=Zjx0T1UuQxZ9IAbptw1uvtXhf+iZP2ieUInbmaH+xOU=;
        b=XrxgYBppi6zeev828iyrBX4QpXaOUs7PiixV4VU/3lYF+i3Ii9LLMOiB2EBrLk8JsX
         cKzZU+Wkvml83tlz3tqy2C/XDDB5qTwDQupSZwD8ko0sanN6z60qGuwnf1qRL0Y7iEtu
         ITTQTTKlA+jxSdS2VdoiDy3uOznnbdjRGQ3d36fLv7T8qjDp3eaoS4A2CVY7Q3n2gO0M
         AGMdchTTzOtc6EocXne34A0PULw643NK1w7Sebr814GkuNfQrg881Tk9UqXOs/yeGU7I
         mf+yIOaNJazFb0QLLPEdNpuNkQ7FJi7PuiaEmWFHvBO/T+JhrlrDytPgGGwxka6H/3IU
         d8xw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Zjx0T1UuQxZ9IAbptw1uvtXhf+iZP2ieUInbmaH+xOU=;
        b=BbLlpckG1X9mtyk/yVeqMU4DsupggciaUAHSELVvVlqPo06g1G3wP9KqAlF7EHQ1lt
         xpC7JStIaORgB61Q2FFHugZC0YYJYaQu4EYSM8mqO55pQxW109mRgSDmriV8q91sumnp
         doJBvfO3Uvm+JU1J/IoXSCTZKk3nwaCUzAeX7mbxKQHEIXaSfTIl6FTqD8MdEvVz4Gsc
         fcuXAwWtDo4Ww+hBjvNoOt8ssMGt+gJT74sMQTzYFYi14liv8zdcMozL7jCan/NRyZa8
         wRG2kwZorkxZTgRkgwWC6KtYjbLd6IQEPzGHYK+UCT1pDDcmHB7AtYoClnC2Jx7kT9ct
         L+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Zjx0T1UuQxZ9IAbptw1uvtXhf+iZP2ieUInbmaH+xOU=;
        b=j9H+QRgaXn7JJ+IK+7rlMkPkkm3P1wotJaxw9lQJYhgYy33SZPWCvjmCDaXrXsJHm1
         +Xflqfw4olKY4O4h9kNr64AkUMgESz+o8hbMeYxvfsT+KBIDkYI2Epf2vO3XcstDXiPH
         S5d+ziXKoB49hFY7614y83OmCWZt3NR2FwTAVV1oaKV2O3+Y+DYInA+IrhpL/+P6EnVv
         mlqopFBe2ZMi3LJdpebNsZiQYm2z9oM16iCnAxO1q5P5iO90sXfu9X7xV/tTyiwbxJKX
         f/Mnix1nvpJSapquAFOBfdcWD2bd/A25nNKbPUir6vbc32lQ0/cM/CbAQ+BVKtoH0w9x
         fj/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531xUpLnnb2jJbqjvPi+tugBo48vS4wH0q35Joy76HZlCh2pvnDX
	xLCwmsi3i+GjTlmIQsr4lxo=
X-Google-Smtp-Source: ABdhPJzTAovyuqWlLth/4I/8EoETPZ2TD/o5Hqy21X6HhPYfer52j+eQlDvJQsYGg+aS5PV0nu1bCg==
X-Received: by 2002:a1c:c906:: with SMTP id f6mr13684727wmb.9.1601838014046;
        Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:8:: with SMTP id h8ls5161442wrx.3.gmail; Sun, 04
 Oct 2020 12:00:13 -0700 (PDT)
X-Received: by 2002:adf:e806:: with SMTP id o6mr6519031wrm.42.1601838013129;
        Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838013; cv=none;
        d=google.com; s=arc-20160816;
        b=riQvuFPRKkmpW32RH5W4yITGvWNUgYNQuKjeva+sXzOPR7GwRxsyyxKaWVeJPtqNcp
         3GSsupB0Rsq/W5WOg+WUSK3S7neIpTditKjFmOHcVRiwJPoJ3GQJixMgi8qDQ99NEBOB
         WfIcgI/7gsg9IgGUCZ9gBzHq3SjpUQYlKKrTj1+oJIFSLF6/0KIdl6u92xNHkEE7/YhP
         vWektsibBVTIK/2qcYISX07geKWVfs4JZbyK8NnEIaoosfNqYSGX88Ou1g/6D9IU0Ur4
         4WAa3uSyvO/zLE69r8Cnq3bWPqmdMmf621rwRBc9GsbW75LdPvcEnLxE6n5bXwJ0uYuP
         6asw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=lhaGAi81CCYoLywn3QEk7/VQoRLT6TA3IY6qe6QJ3xM=;
        b=OosflW8IVGDaWyn/xQrueB67qTcnsCnuztxNA8AHYq16wyKtOV688mkfbdMWsMAcZm
         H1l8MvS8GLbzBe6ofrJkAfP1SKw5KOgzDWgfLgBvKUfxVv7XeUZycuRCCOHrnp97ujw5
         cKQr040B8+7jAjnth0vzuBaLHJTjIj5Egh9um8AIALN3DOVNli5SCC7yspgEmmUNpWNT
         sxC19faqJV11zAYTnEjJJ/3p+TUTM8YhEKP8fdkG1rQYNMD8uTIkR/BA56JpLjo1tkU6
         PQh3NU2IIhZMeK4Pq6gJjf04FR7wxLHdI/KroS3HJNdj79F0cWZRfkD5GxVT/iSMhJxg
         w5zw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id k3si136440wrl.5.2020.10.04.12.00.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J0C5T025098
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:12 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060Y017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:12 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 22/45] arm64: smmu: Drop write-only va_size field
Date: Sun,  4 Oct 2020 20:59:43 +0200
Message-Id: <02a540534ff4ecfeaf4190ddf180d458332c2e7a.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index e5a47197..1634a53a 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -251,7 +251,6 @@ struct arm_smmu_device {
 	u16				smr_mask_mask;
 	struct arm_smmu_smr		*smrs;
 	struct arm_smmu_cfg		*cfgs;
-	unsigned long			va_size;
 	unsigned long			ipa_size;
 	unsigned long			pa_size;
 	unsigned long			pgsize_bitmap;
@@ -631,8 +630,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	 * TODO: DMA?
 	 */
 
-	size = (id >> ID2_UBS_SHIFT) & ID2_UBS_MASK;
-	smmu->va_size = arm_smmu_id_size_to_bits(size);
 	if (id & ID2_PTFS_4K)
 		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_4K;
 	if (id & ID2_PTFS_16K)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/02a540534ff4ecfeaf4190ddf180d458332c2e7a.1601838005.git.jan.kiszka%40siemens.com.
