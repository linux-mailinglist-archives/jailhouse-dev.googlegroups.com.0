Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYHNTL6AKGQEJ6INZDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B1C28DB6C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:21 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id a20sf1017994ljn.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664161; cv=pass;
        d=google.com; s=arc-20160816;
        b=uDJi2OzuxsY4aYJ1mGa+snbwnvOlvyhSk6xLHRAaC/pCHS5tNEYwsGms7KgmnXsW9x
         DCrxyo8TUOTaF2cg/j+3Exl38qzlhYI4oTI9KTf93qbjNFbme2Es/Y+/Uj27KiVzWhCM
         UrpNhfs7x83H2KzXGNQnhBq+RZiRBlk67GWVGSKWPZwhS4hVdA/rLQ3tUDFZQi57TTw9
         Z4O7siF+yDdg8vcgCdlfHZdzaWoshq37EKXed+UGZ58KONza5blOh9xfTG3kvD2UahJq
         pemJfhhYFfCdGC7JPeC12GVopKvdBbf0KPfghu9WsjATeR3YaGBMcTpIns3WZoNy9uvB
         AYzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=bHC0kUstfsKFKzbU2cpmufbG3lFyUTpfPE4seCtSqYM=;
        b=PyF+++I1cP53hkidVU6E+UiXG2X5UjLxs98Yg2CFEihgYXL75LulZvKlmrFHjwsomi
         I4xlC4w8bRc6yVsENOPLaMV/5FWdwnQjoiIGdWG49GQPRGKzOKKJ0KtpGusKiooDxhc8
         MQyNqiTqlH0W3Yrh7MZcGtrca8kClyVWUtQ63h2+7pPDZOnE0pu6jr3rxYoeNtJtpl6H
         zugiD8eJIgmq56AIovMekQJdiDkJMULtvRsWLwk6pW7rvo+BBp0sNZNGSTE61YT+68L0
         sxhNd2SJHwKgQ7hMgfgGUcO0gkaMJlGtc2LS3RwAnhmP9S4kbqzuXitDWF1bFOsh+FvV
         gUjQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bHC0kUstfsKFKzbU2cpmufbG3lFyUTpfPE4seCtSqYM=;
        b=gjSwxmf+xS7NgWY0RzBB3zV2ptgWOIvtjJAP0MlcCd89ia5gNnMMyUU9LsT9+INUiQ
         GYUdqY7i4vLZLiSioXaYCIu9dDP86nFamtgrksLiCr0RtzCDOIgZNUJWnlMTZF0xrc6G
         DjdsVwv5ixSPpBI+6nBhxnlgL48BF1sVITRkYCwUeiG5Cqltmtg3Adn897kpfjKye9DR
         DCOmcF/Q/mq7+aCnF1+KAErKEqeAg5tXAgovheVAiAj7fyznfvYq14fTjwKeHkDWKfmC
         y4sZGNIiBDno7Z5quQwy8ZpAusZg7OeQUJCEp2jXceI2PF1ejNPLyJpcs/w94ovRt36J
         gtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bHC0kUstfsKFKzbU2cpmufbG3lFyUTpfPE4seCtSqYM=;
        b=RATCX2q3OZH1KnYgBHUDVXlSmZyyVtBD7j5ipW6xE4HBrsq3rATteaI/ka+/NWDf0g
         lD8dA4FR2P/SP8nTybyXzEsotIWLgjaGTOkZLzrbRFp88grio4+ww6z/C3YNoEYuIJGS
         KG6sVak0P95+2X+TLP5Ehqfy3j9R6WJhbBoG6u/RlSAFe8vkCxv2a6wbjaKCkoqILhbz
         uDZqgCf7CtdR6AP9tklqXAJD+nrnuBRc8sfP8QbVyJ5pmRe/4a+q/U4vohP/wd4tVnhf
         cutblNgJsfd9+TxIyu9euI/53mOyxM8i0TmD7/QEo9zoBFodv8xbfuwil0ONNjiM10RM
         UMeA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533j0sX2Q7NKCktvjZPqOF1X6dzbm2fLdZVvuSAfbbcRUC26VWVD
	w4EzQuUuZHb+L8Fx48xx014=
X-Google-Smtp-Source: ABdhPJxmwRoy+/ieLoqFZ/NCwKRtpDavVCOaFVVceVDVetn/IO4QXnLmziz6t/mj/Xn8dTqmUuTn2g==
X-Received: by 2002:a19:a0b:: with SMTP id 11mr1139281lfk.110.1602664161069;
        Wed, 14 Oct 2020 01:29:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c111:: with SMTP id r17ls1059737lff.0.gmail; Wed, 14 Oct
 2020 01:29:19 -0700 (PDT)
X-Received: by 2002:a05:6512:3582:: with SMTP id m2mr1136164lfr.426.1602664159789;
        Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664159; cv=none;
        d=google.com; s=arc-20160816;
        b=wJF+Cg00HdSMPU2PIoGe2o5IcOPImN1S1AiX7Pk1OscwXOfWnCsm9ZtfJ2SWb6Fj6Z
         fxAj7cYT2WXK51cdsvmdQmiUXKUDF8JXWO4Avy0VY8XkayrxXYXMrTm7ZWmp/m9UkGAq
         KaXo8kN3U/EYObv37ToDzDSeyVYniBh+3QKlRnOYtKPBjRUeHSbBoirQs+QnSYxfPNaA
         lPtiO36oxhvPsUePWBKTAUCPtocDSefnw9de4FMtQMYpY0XHoiQJifwwzn7l85Ohh2UR
         t59hGnKLUNQvDo6ji0wlUDADFm3HRAPqR5L4CuzyUGtik6W/7HLIVtf0Eo7DzDpTPM8U
         356g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=RrMn394rC/P65iDV9aJ5xz3qM1e/z5eVBjmf/EOyej8=;
        b=wVzm5NmZQBy2dkVOiq2DFjAzWlMFTak2kqxVrArlPSJ/7kYor3HKnvqdZMgb/wa4/7
         RDMBPjG3qtqwPwoBYDJ9y4owjZrMl2evUYG+uwgOJN7H6gJiVPu8t+IcJbjDFBTqaYPy
         TO8NB9AC65VoR/GO2kDvkC5KpwWDBcwG+FIyiUmbrgpPk+ZnxMcNGd3/oj3ERVBMiL5e
         dm108OmPPtJfOS1X4bCOI0rS49BTosVxiq6OrInhq9bgteaFjMqCXi5uLTf6zqnVZs6/
         HHVGxvwV5H5w6HJ3XekwZiYooi2Lz1aNls2bJU6B6LLRwo06K1CyBgnlKmaTsQXwmqpD
         6/EQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id o142si61502lff.6.2020.10.14.01.29.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TJV7023985
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:19 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJL002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:19 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 35/46] arm64: smmu: Refactor ID1 evaluation
Date: Wed, 14 Oct 2020 10:28:59 +0200
Message-Id: <3b986befae0de1be689358610b8b64be78e00acc.1602664150.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3b986befae0de1be689358610b8b64be78e00acc.1602664150.git.jan.kiszka%40siemens.com.
