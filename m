Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQNX5D5QKGQEYRUKFJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 272CB282CD1
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:18 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id s22sf799657ljp.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838017; cv=pass;
        d=google.com; s=arc-20160816;
        b=h/vjMj4bhvd89jtLXFVDJkRQQKczI7tTLxg0tRtAVGlj5AlO/u4Wxpq8elus9rWxyu
         ghvnZGAu2aMDk6OkugEmsGC9JUivQhu5NnB9xndIO3OEXgZDNsHZdAwci2wGes6qD1zv
         4PL1btP2i+IQqQUu7ULdiQZCMexxuBZMvEgsQRu0SR4NRJXi0Gan/RzneIG5naA4Nym2
         JTPZzGCM1mH51haXzVR+OGueyYr/JVydbOuvE4kXkAnk0E026mcLid8TzRWDfvg2wP6f
         qIsjVxPJpvtJNQuqdztTdTmLlizHJxpe81pBUilhSndA8vz4pTL9296UyY6VzvYP9by2
         LdwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=2iNKFSyA+fCa0+WAGaNZhdAuMxN19Kjw8D4L08ywzwk=;
        b=MQ3iRR4ZlBo+30XrO1dSi0ZdzJXWxJg7Rrt5epQ4+WoQ/LMLhLdUC/Yw/6YWwygVmq
         vyFgYT3pWpiIRHNtN3VQUBbgnL8XMCGMDFNlMtuliNgFiwWzwmxG7fsUnEbqCrEchg4m
         8tRv/d6PR7Cyo1lL9qHYMWR6ETj+nYCNkvs+FLaILck8cxeF9LYC1WimuMEGqNB670F5
         d6daXdli2kOiPy0aVGd2cjDgjheU+cvXEjUxJEWNiyTBaJKzlduh6rb67zrXkcwuCDpB
         r99/CnE0Sl73JDfsw+PBvd8a5hVDKknus5mO5lMzCaDjudc7Ie2sR2gKpv+DAUbst7yM
         X6kw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2iNKFSyA+fCa0+WAGaNZhdAuMxN19Kjw8D4L08ywzwk=;
        b=EEk4MBTdkCvFUodyme3mTPzt4OtMDM76n/C4yNJFE3BQK4y2/4aOPq+dMpg8LWqsS3
         8mijC8BPD5bNbbyIxZ9Z1667ruXuJrYausoYueN5SfZuWE5bEjOCg9rR/veMbMPEYj7n
         x92OH7y60B3+uIpIGGiLePXdXhy1/OoMbNASrytJ3h3RduiUm6RoVSQ+Wr2ikjfpvNfn
         9FtTzJL/LAoRt3BL91MkDgVuqyArXX1d3JYwTMttk3Poy54JspQejzimrzI5Bq56idL5
         V8cB+DTwVglVCNCP/v3FGPhjp4KGZB8ayP6pc4SzKKlrL7Z4S7ma95kSjIDBF1HerkoT
         mDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2iNKFSyA+fCa0+WAGaNZhdAuMxN19Kjw8D4L08ywzwk=;
        b=sKxP9lh+NX1Ctl6+AIJHX19rjKBhDFl96GwxATy5d9HY8ZGCS486Qx6b5UQXAL78yh
         wW992nKcplAMPoRMSw68NIEnh47k2EpsUAhEq2yzyz85JoQVu49l0EPEr3tmUVcwPj1v
         N6+m+FOVy3WRtaxmu29vLAs3QvJWCMfWUFCI//pf+2K0yMMv7nMrktpNgnn6LuKkfoft
         6YpZ4HYRZXS3VE9EUZPcNdUx8CZRgVu+Cu+s+OLH1qc1aoHsg6LLMjBUqEXdlnA7SWVc
         vXkQACH9RlPXjapieswphdHRuXpbx5E/A1zsezF8M7qDQ7zaiMEZdLaxnAFBtX2i+o3l
         Ft4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532vU5+jeX18G454cynYX8oG45c/6wSempbv2BKRj0ESnlycfJs5
	UT5i4sTjFeEcTTUSqcVkRw4=
X-Google-Smtp-Source: ABdhPJwyL8TzA4eUtqWaA1MBvIq1CN9K6XYFXV6TWJ9lr9nl7YiuzTC6fRQzO6ndm9WT/yNLbC1khA==
X-Received: by 2002:ac2:5a04:: with SMTP id q4mr4747968lfn.450.1601838017724;
        Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:544e:: with SMTP id d14ls1116301lfn.2.gmail; Sun, 04 Oct
 2020 12:00:16 -0700 (PDT)
X-Received: by 2002:a19:ed13:: with SMTP id y19mr4599553lfy.187.1601838016613;
        Sun, 04 Oct 2020 12:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838016; cv=none;
        d=google.com; s=arc-20160816;
        b=RFgQu+nVJiiW5LeP9Ng/0RWbsI621RYHN1HmykXi/nLiSvxG46/OQPracvk6Px2BBE
         IAn3jmK292OTVr2Bqa4ZAEc+feFc6jmFLPuZClS3EmR9QT6WsMbaI1QJao4pRyE6Akhi
         idX2csj8yHOz0Ar6uCfWGe+FYFfnzqI83YPvhYtdT9ffSscq2qEWhrdnLoAh0b3g5GG5
         D7a2RgPjXwDj3rkU9+aJB4usf05vOtIUxH4lXWInAZbhS0cEuNs1oeZo6GYWNkiShcWo
         14IeYnEKBaEBJPEq+j01g5P6m2fmQ7zAWk6bxIfo4UmnR2iVNExJ+v85mpwNl6pgjfgb
         DqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=OkPMkjepGHE7fHh7CvsdyzdXC/rv64gQ9UJdu9KlIUg=;
        b=oZOp0UgJ4NxT2m3oHi9BYBHkh05NSFCewvLVo+iC35F/AsZHrOlhZfvEtY/01T3WhA
         SLXl9Sb/974lva+AS/rKkIPPyd65shrKAKL8VI4htLTVcZ8NI7j0SRr321+Jh/rZzCyc
         viJ6r5A8hmSit1S2N+JY96mAoHT9QjDMpvMZmiN+B39Cz/htibt9O5djs7N9X0c2pzFP
         4t3DfCAHz+JGU9D9HSn0eugLBiCZLpbEmgzCSfBl7HaDkUEKaQ5qfSoVvnnI5cQ/RHhy
         4QkRTtBbnL2NKRICnsnSmyYoNiFru+YTvnMGlxDBJ4KHZ34spemFlJuj3Fp+xBNbJUHH
         jeFg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id y75si166780lfa.3.2020.10.04.12.00.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J0FNF025183
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:16 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060n017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:15 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 37/45] arm64: smmu: Refactor ID7 evaluation
Date: Sun,  4 Oct 2020 20:59:58 +0200
Message-Id: <226a11e8c18afb4acd7d3aff9b08fc0dcd4ff2c0.1601838005.git.jan.kiszka@siemens.com>
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

Use GET_FIELD where possible.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index ba278784..3b45cc5e 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -65,8 +65,7 @@
 #define ID2_IAS(id)			GET_FIELD(id, 3, 0)
 
 #define ARM_SMMU_GR0_ID7		0x3c
-#define ID7_MAJOR_SHIFT			4
-#define ID7_MAJOR_MASK			0xf
+#define ID7_MAJOR(id)			GET_FIELD(id, 7, 4)
 
 /* Global Fault Status Register */
 #define ARM_SMMU_GR0_sGFSR		0x48
@@ -311,7 +310,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	 * bit is only present in MMU-500r2 onwards.
 	 */
 	reg = mmio_read32(gr0_base + ARM_SMMU_GR0_ID7);
-	major = (reg >> ID7_MAJOR_SHIFT) & ID7_MAJOR_MASK;
+	major = ID7_MAJOR(reg);
 	reg = mmio_read32(gr0_base + ARM_SMMU_GR0_sACR);
 	if (major >= 2)
 		reg &= ~ARM_MMU500_ACR_CACHE_LOCK;
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/226a11e8c18afb4acd7d3aff9b08fc0dcd4ff2c0.1601838005.git.jan.kiszka%40siemens.com.
