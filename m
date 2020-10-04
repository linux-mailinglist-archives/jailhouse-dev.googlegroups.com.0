Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQFX5D5QKGQETQUV4XY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 023D6282CC9
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:17 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id r16sf3111290wrm.18
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838016; cv=pass;
        d=google.com; s=arc-20160816;
        b=UT4LdYMndpHPluvLmepk8nXIHZ5CwHOZgnutMEsziwZ/6AxvXUaxF+V1MT34SyWmh1
         mNuez9o1oRGEWlEbRcrmJT4ZzVKvWshNytqB/ortVrXiLsm4LDRHqBBBzNzjHR+mBepO
         yN6b1qN755PNSabrB7oX+9oWWHyFs3Hq7pAuGhZh85+yFQ9blETgd51r/yKA8YpS8Uw/
         qUdNOyYU+2aaUBLMK5oiYpuzIz7bMrUZLJbgS0SwCLlOpCefaqcJwYwIm0OeX/sUdOMn
         91w9M+OjXPi0jcJqWdQWq90GfcS2GCpfn6fze8tKtbYuJSOlVesGVPkmN/IrySFbCMkr
         KPpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=SzoBZS3VN9ohaFrg0l2MCU0Xbm9BxT/5YLPewmnW8Xc=;
        b=YcwW1TpesC9CahWydUlGLWziGkZvft/a4MgIGG+bH9BeDLgXLuMkT4Ad4uT1O3p0FU
         9YYtO5lTdXc7r6B43wPE7oBkl//BdThd5aaF4AnpdQYDFyPZGll3eo+os4LGyTNCu9dk
         KRq8FjpPUminiKKYynh3Ax8B5/xgd1czcp3M7G766v8H5RfyWmFF6he5SNyzIIUyQ3NK
         iigWLMKrCqBUKGZbLXbBTTWCqIuGvxmpJX1YA/clDZyuQ/Ryb2wZ7SBj+n02M3saRXV7
         gCvKP0GUKLCCML2PqKelgTcqLs59sPnczBlwjiM7s/j0GxQu2AHrCk9uWEqlwpnyPtub
         JkJw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SzoBZS3VN9ohaFrg0l2MCU0Xbm9BxT/5YLPewmnW8Xc=;
        b=BnLCQNrFVnV2zpllRk446ymKnnhFXbicW5YYxyGTAKK/xFpli6t22eAssj3e5BHfCA
         WfkrXRc2/9Eu4Z5ef4tMPWH++vYODLRl/3BuEo4LC4VtxRxo+c4kc6qtTqzzwiFt451r
         aRuUcL7N2Xo+IeYp4H3UfQjdizZldWvm9RjLEBKHc2Xa6VzK48xETs5RnHb0/6Blhc9L
         NjY2yxIj8eRML8YAdCLdYALQqlbjjvZdFVOJY9Q6U2EkshfD7uRft5vP30k6hbj1ZhFX
         iOXn9aHvH1Jxo1cioCHrGR3Kb3epoRST/3Eo56aI7vk7VYgFomJKRY73i+qqA5/8fsEd
         M2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SzoBZS3VN9ohaFrg0l2MCU0Xbm9BxT/5YLPewmnW8Xc=;
        b=Cm187FRo6N6BaSBhtjlujEJ+JBX4jNAIy5gwByj3oVaCP1idqHJMKHF3ewSh3xnlcX
         NdHlORvHJn7d+l2GEVr4tiTeeXUlWvtA2eiSAnWjGOu29ibOidAX/VIssuwAJVKG0CXX
         9tOFcmppEabLumyG9FJoMQ70CxY0rcR2yQeJuxfrW1Rw5Miy29Aa6n49xSj/Wm15wDNA
         dN7Edi/JrpM3W7CepWMWZGiCEdeaJJXWjzdAVak0NothrU1qNEtM40MAL1BTVGd6HBcS
         ASea1JPFvYwkSzD0tzAqjXPSlgMRNr6s69hd0xn4mmWUth6d6Pe4YRFZphr8A0W6jV9q
         +uWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532RW/elWIKe9QL8ku1jYLHs9eBQebRQlyNny4NOhjbztrhZyWN9
	zezc9fn/TUNDCGKQ1KDgpNE=
X-Google-Smtp-Source: ABdhPJwi93A6g87gWJ1hnkhIHEwzpvSYqijeRywQ2u/EXAearw0F6qMYJtEpDAVuo/lv3hwHHjdFww==
X-Received: by 2002:a5d:40c3:: with SMTP id b3mr3512121wrq.157.1601838016801;
        Sun, 04 Oct 2020 12:00:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:80cf:: with SMTP id b198ls1353029wmd.0.gmail; Sun, 04
 Oct 2020 12:00:15 -0700 (PDT)
X-Received: by 2002:a7b:cc89:: with SMTP id p9mr13506229wma.4.1601838015751;
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838015; cv=none;
        d=google.com; s=arc-20160816;
        b=FcYb0QYHHdffC+ybINRvcJn8ArveoHUYCseP96vvoZt6ySYH2jKPmlzaAIge6LmswG
         B0uO98sdTtRLK6dultrRo/xZU52W2UEjbLoh7i7rLG+F7sLzBR4GN/iy6AOx+R3bgEyf
         qbxVHJwUqLAUYCETtv5CVFhMbqzp6jA61hicJN7wJ8T9iWOfQxB9SaEB6EhGHn+c47kU
         KQwbojn69uZ76UO1IUpTS969M3ltZhuo9bbpnTUMt3beFC7+AyvRewuYkeS1IpaVYnJx
         i+hanp4BWi5Lh3NWta9k6fmpvmyMisodNR+//up2F2yd9x8bQKND0v8DNSBGsMBOzgfV
         aaSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=RrMn394rC/P65iDV9aJ5xz3qM1e/z5eVBjmf/EOyej8=;
        b=bn2I6fHYjnhZ0zTUvlWUKW6fbWbezNwFzIZUEaiHDKL2gW/uJUl3a+9i/mlNXYxzzT
         qtmEsTNC8VwfKS4g7VsRVY6dRRqFmAGt3WWaxVClYnQP0cqpzM9y4jGwc2wqU1e8ojHf
         edOqWhdbBTBxoN21hT/DBAa6hjXBrSILhwjF7pDWFKrfCE06K3IORIwbchn8pDm56+rP
         4vHO8b4HFG98gQ5qJ14cTG+PdjXOiR4+ZGIgwDJUwFe8tMPqXiGBW7eqFOUNQiXsoPpI
         ICwTtfHZuCkEr5sg2hMdQaswpbham6HkswzuvCX6XOpl2oAoFAQsul9pSU+kVk8Crl/f
         BMQQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 72si33835wme.1.2020.10.04.12.00.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J0Fwx025172
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:15 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060k017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:15 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 34/45] arm64: smmu: Refactor ID1 evaluation
Date: Sun,  4 Oct 2020 20:59:55 +0200
Message-Id: <de4c5a29c0129742ef84a5e5c5d919b367f08856.1601838005.git.jan.kiszka@siemens.com>
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
 hypervisor/arch/arm64/smmu.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 5073c705..8d0ce757 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -54,17 +54,14 @@
 #define ID0_NUMSMRG(id)			GET_FIELD(id, 7, 0)
 
 #define ARM_SMMU_GR0_ID1		0x24
+#define ID1_PAGESIZE			(1 << 31)
+#define ID1_NUMPAGENDXB(id)		GET_FIELD(id, 30, 28)
+#define ID1_NUMS2CB(id)			GET_FIELD(id, 23, 16)
+#define ID1_NUMCB(id)			GET_FIELD(id, 7, 0)
+
 #define ARM_SMMU_GR0_ID2		0x28
 #define ARM_SMMU_GR0_ID7		0x3c
 
-#define ID1_PAGESIZE			(1 << 31)
-#define ID1_NUMPAGENDXB_SHIFT		28
-#define ID1_NUMPAGENDXB_MASK		7
-#define ID1_NUMS2CB_SHIFT		16
-#define ID1_NUMS2CB_MASK		0xff
-#define ID1_NUMCB_SHIFT			0
-#define ID1_NUMCB_MASK			0xff
-
 #define ID2_IAS_SHIFT			0
 #define ID2_IAS_MASK			0xf
 #define ID2_OAS_SHIFT			4
@@ -420,15 +417,15 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	smmu->pgshift = (id & ID1_PAGESIZE) ? 16 : 12;
 
 	/* Check for size mismatch of SMMU address space from mapped region */
-	size = 1 << (((id >> ID1_NUMPAGENDXB_SHIFT) & ID1_NUMPAGENDXB_MASK) + 1);
+	size = 1 << (ID1_NUMPAGENDXB(id) + 1);
 	size <<= smmu->pgshift;
 	if (smmu->cb_base != gr0_base + size)
 		printk("Warning: SMMU address space size (0x%lx) "
 		       "differs from mapped region size (0x%tx)!\n",
 		       size * 2, (smmu->cb_base - gr0_base) * 2);
 
-	smmu->num_s2_context_banks = (id >> ID1_NUMS2CB_SHIFT) & ID1_NUMS2CB_MASK;
-	smmu->num_context_banks = (id >> ID1_NUMCB_SHIFT) & ID1_NUMCB_MASK;
+	smmu->num_s2_context_banks = ID1_NUMS2CB(id);
+	smmu->num_context_banks = ID1_NUMCB(id);
 	if (smmu->num_s2_context_banks > smmu->num_context_banks)
 		return trace_error(-ENODEV);
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/de4c5a29c0129742ef84a5e5c5d919b367f08856.1601838005.git.jan.kiszka%40siemens.com.
