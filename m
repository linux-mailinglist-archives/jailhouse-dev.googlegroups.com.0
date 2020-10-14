Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWPNTL6AKGQEOBOKETQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 376FB28DB48
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:14 +0200 (CEST)
Received: by mail-ej1-x637.google.com with SMTP id j2sf865766ejm.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664154; cv=pass;
        d=google.com; s=arc-20160816;
        b=f2IwFSTSFO1qM2gyTGnQEcugXmE6EvWp3z99JCXQAK6BFRMnhARgRadRIe2fWdEtpC
         0tk6K36r2DSidojO8QsMjJ0LGeIn3ECiP9RBb4bseOAGOotXS1RutAFBUkda5e/dr2C+
         HocUoHNrBYbgF5lVZQsVye4zvx+RjyPNoydrqSqkhyLTXTm5MumtpU+VlKk4uN3wHQlD
         MciMFfLnWwN/W4rc4y8RGL0ewDF7XzM4vAUVrIHa8AzZJrfkuOw9PMTfPFf1y4pPdl0a
         o1op4Eu1QhgbQSX5PYrvd7yyFPPfbUZidTy67LeLuX9HZC8a1Akk8AHdKlO/FTTgw/Zt
         N1TQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=sEoJOdUEPlLD94RaioVidExaqYVoDlOcEtN3IMWBSaA=;
        b=NpojzH9HjryGDkyrIbgwfzAeG8/qm+cok+Ef3tOfOAHwe14XH4VMuVKhaZQSOiwn+J
         LGo4EkgS558GPdz2083keK7FAvjXiemR633vw/W1+Z1VdICgYHoq1JeSqwmujc2bHL2Z
         Hy3xLEF63Oms8Rf1vOAOOcdeox0Gz8E4eTC7jZgmDdqm8/GsVy3biRpZpxQnj9MtM1Cy
         kTvLXoo9iUPSLbJ8Q3x4A90jRS8jbeBttquDlrJUFskneYxv0Nvj+t3badoz+RdmiRox
         H0ziYVTKmiJWoSO9WWxqnM/NNS0XZWCFbY1mvhjolpjdjyzBFIezdR70/XobaoJaYDGm
         ebxA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sEoJOdUEPlLD94RaioVidExaqYVoDlOcEtN3IMWBSaA=;
        b=rbWE1AsiMxQ0qOFzZ2bh7npSOyYsKg1q2qWDQ7u53loXoKCyvt1n5eSh8PxYn4Y+Ia
         A1T+g0Kg5TgsIc3vx85wbUFP2bLps5Oh5cLYjr6Htnr/KohhMty7FGV0bw+h4dSZtfzD
         7BMZLHG3JJz9quQp7lVP/9gH5ZUgcipVigXmzpUIE40dz5iDN8JWppEgNWuZUGP0/XQr
         vDW6TwoEvJG4y+NlJa2chRD5CRWJy4LMrEcXCpI5CNTygD8uwK/0suQ7KvgVKpfuRe3a
         aTfudwSwqk0J2mZY5TCTjQInuOBmUtUIsJ6ywg8g5SfuPYRLayrV/r7KN8K9UMpDTbg8
         AjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sEoJOdUEPlLD94RaioVidExaqYVoDlOcEtN3IMWBSaA=;
        b=TtWQCAl59oWG3BCgHdyu+MMQ0e8RWFxACVVOeRo98V2Iap6XkSa9i0Ebr6fEhNIkV8
         10qr+jzrM2XF3jMVVLSLyQ5leUfrVPXqtPJeUhiSH3SrymkQQm6YXM8/w2pgUdAYt+Xe
         oXbwbvrtVuHZLjPKLwIBSGJT57XqKHrFqNi3H3lk/ZeiqIrdWfz6/mzislafCQPFxoRh
         px3vWK+cax62O1KminkpFJtA17qzinrUW602UCOGzL4kGVQ8s77YCbtVEPNlN3JhvcTF
         xxLMkXEe3L+w2bgA1M8qaDPIx4gHzBuFTKuiXWvlPQ6ldX7SmSrPFgYc3GtuNgS8+13T
         l8NQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531xj00+qEU10u/T7jsBmEfmvJRPZs3+oKeKpalp8uHQe5WEnV0Y
	AVSPzG1qUDynuevoM21JzYA=
X-Google-Smtp-Source: ABdhPJykZ6DY8UaCmFqo1x3c+gxnj/647dBkL7IBtBLDFN93LlmT/AgA0DzXVUR7mtRHVrLeQQHJMg==
X-Received: by 2002:a05:6402:b0e:: with SMTP id bm14mr3905332edb.19.1602664153892;
        Wed, 14 Oct 2020 01:29:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:f252:: with SMTP id gy18ls1233914ejb.7.gmail; Wed,
 14 Oct 2020 01:29:12 -0700 (PDT)
X-Received: by 2002:a17:906:cc87:: with SMTP id oq7mr4266430ejb.335.1602664152683;
        Wed, 14 Oct 2020 01:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664152; cv=none;
        d=google.com; s=arc-20160816;
        b=NNGdA+KSf/mWSqM2Gie61ruPfPnuyAhmsCiPttc4oZyhg+4mLmI1A6y4xb0WWxmypu
         1NhX7mkXKRpWI/HZOqRqehYY3z4one6KHsoHKUynawAX28lOSnggOo9sjhRulvvfXdg1
         K0KaPIvpDA/D3NpSionQCHpDeuUPglETeAxLkMDjS2PQqi6I3wodfhdN1RY434dt+QTl
         Ub21aZe+7hn5xL8a+Cfl+ogr4X+pW8/Hda3Zj2IC+fk4tCUg6NsV0Rqab7zJ633FVaWf
         uBbVl02VI+55NnAHfx/vNJ1/QksN8X/wuqcLrSYwqtvW+p3Dt1pxX1ijQCLu7AIILRjK
         oeMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=fv2D9qcB1s/9hkc9sb/9N7T+Y/V/uwq6Eg1f9IA3Aus=;
        b=eXplbFIcmGl/HHZ1H8e36+PoLXoXv+oZrnZ9ZPUXT8uejd/tNNT9CeRXpCvE3Jfsu6
         Yjxy8U3rgY+2o7Lv4yVT1d2Lp+/oy8Qo6PAj1c3RVHrBWDpotlYewm6g0EYE07a57UR5
         LLchkzjnA4t2sKRKaYBIi/JofxKGLVptArv2uiu50XoqPJ/qUacLbK8sK/GiuVbfe4jL
         tGmTHCKxEv/Xsaaycwumu/y1DYYLsJG4F1UfShSnvkr7Vgziu5Pt2wfmBWJjddOlLZ/R
         l6XsWH03vT+kVGaBpic3+vPngoc4PWfyUI9oJrSHaB4226fsDEKQGqV1zY9mqWrE0MkN
         r+PQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id a16si104482ejk.1.2020.10.14.01.29.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TCNv023854
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:12 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAIq002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:12 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 06/46] arm64: smmu: Drop test for non-zero base address
Date: Wed, 14 Oct 2020 10:28:30 +0200
Message-Id: <1d94ae4dee332319caf23cc1f694a3059d8785eb.1602664150.git.jan.kiszka@siemens.com>
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

Setting type to JAILHOUSE_IOMMU_ARM_MMU500 already implies that the
entry is valid.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 2564bbd2..b3facb8b 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -937,32 +937,29 @@ static int arm_smmu_init(void)
 		if (iommu->type != JAILHOUSE_IOMMU_ARM_MMU500)
 			continue;
 
-		if (iommu->base) {
-			num++;
+		num++;
 
-			smmu_device[i].features &= ~ARM_SMMU_FEAT_COHERENT_WALK;
-			smmu_device[i].arm_sid_mask = iommu->arm_mmu500.sid_mask;
+		smmu_device[i].features &= ~ARM_SMMU_FEAT_COHERENT_WALK;
+		smmu_device[i].arm_sid_mask = iommu->arm_mmu500.sid_mask;
 
-			smmu_device[i].base = paging_map_device(iommu->base,
-								iommu->size);
-			if (!smmu_device[i].base)
-				return -ENOMEM;
+		smmu_device[i].base = paging_map_device(iommu->base,
+							iommu->size);
+		if (!smmu_device[i].base)
+			return -ENOMEM;
 
-			printk("ARM MMU500 at 0x%llx with:\n", iommu->base);
+		printk("ARM MMU500 at 0x%llx with:\n", iommu->base);
 
-			smmu_device[i].cb_base = smmu_device[i].base +
-						 iommu->size / 2;
+		smmu_device[i].cb_base = smmu_device[i].base + iommu->size / 2;
 
-			err = arm_smmu_device_cfg_probe(&smmu_device[i]);
-			if (err)
-				return err;
+		err = arm_smmu_device_cfg_probe(&smmu_device[i]);
+		if (err)
+			return err;
 
-			err = arm_smmu_device_reset(&smmu_device[i]);
-			if (err)
-				return err;
+		err = arm_smmu_device_reset(&smmu_device[i]);
+		if (err)
+			return err;
 
-			arm_smmu_test_smr_masks(&smmu_device[i]);
-		}
+		arm_smmu_test_smr_masks(&smmu_device[i]);
 	}
 
 	if (!num)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1d94ae4dee332319caf23cc1f694a3059d8785eb.1602664150.git.jan.kiszka%40siemens.com.
