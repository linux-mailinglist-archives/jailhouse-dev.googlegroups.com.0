Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQW6W35QKGQELXUKZGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CF327832B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 10:50:11 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id a7sf839332wmc.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 01:50:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601023811; cv=pass;
        d=google.com; s=arc-20160816;
        b=uV0x4o/eHRdR5c7bRClr1tPflmS7J5+k+xFiSdiYG+US59HX6cjVqgJ00aTX2VeELT
         VjtS9Cuy67uA1WP1pC7t6OYYzVcekmyM+fRG8KHIkS3x2BeTN229sO/jhlXpZo7tlBLQ
         pIIQfENRM3Rszm5lxFg8wqgHL1MxAIvBoNsbS3j+SVzbI0CNBZYz6eBflHmDkj+7174s
         q3Z5IJeb6ZghdJpx+gojGEAXhfzmfUIGoOFocNZMEAhYiR3iLA1ES7ZKt8K9W5hkYGsX
         3bKPTln99C8OXanJ+MnRyceUZeCdPtVWMJRDroVesR/SL4BNniGICdqjVQWx2Elg+d1b
         fckw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=r5qysGpUq3afQtcvfZIwnkIxxB8mgyURNWzz7UCqC98=;
        b=QAWYs1B7a6FxV1/FWYBjxD1WEesmBucJeT2cvpdMhLeIXOKYnP1+FzL/iouM5GjBwF
         LE8paY4X78MAEu/41XqVyxOrmQdBNTgwgFtqDl1gkRoEsPAyuv1Mu71P5s3XqxkHXmHV
         /wCaz88l9URDXpSZ2tP6RqEBVBJThoR8IpqBghY6Utz1qfvC3yUL9sTcpCH1wFtcX4op
         dvq/y1burYiRzUA+zwpZuh35t+tqTwarX97A3CHnr1dc1m3+QQJr13wKe9PBA3+pacuE
         FiyH98mZJ25EWzjUeb8Cl/aktuJEqDRN9zxFTyz0Z0+jIfiQb6gq0ZFL50NI4sb35Ndy
         SONg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=r5qysGpUq3afQtcvfZIwnkIxxB8mgyURNWzz7UCqC98=;
        b=AohoqCDg6DrEHa9wqZjoqo6MzlzlIXcgvpvygPhrUodAccjc9cZsQcykCxV0JNc7Rc
         +FcvUOnlBW1GYr5F1EKfbZzMm4XL4CWAq6plSLqw9sct5b7IiCmxZ9HQBtYmth0WSJbT
         bI8+8sY+xr06Ojr81Y9L2/DyoNvim4jUXPJyAV/4AF7wbxp9OVjrH1WzZmno2qklF2X/
         Az4u77EC/e1cnIP2obeyWWf/mdmotOGnMsL5iDP2AoZ5uKAen805eyRCGrVeDH5oKHp4
         vyPFpebl5XZCGbfovErryRXBgQaDle5lq+5biWYlXfPX7TW+NJR1SXQR55QQSby0vjV2
         RZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=r5qysGpUq3afQtcvfZIwnkIxxB8mgyURNWzz7UCqC98=;
        b=MTUTZ3hsFrnyY/MeGWGiPBjEsvnnlxjYjYYe5f5wzE2gQ+eL/jM3zicnfaboWeCNx7
         ywLTlBS45tUPs5R4QJL0UAv1j4RpPnI7xXV1hve6JSBOidMeqNkRa0rpN8aHeMkk7VUo
         WrhjM8rNrhyDTplpQsjV14AeS8mzdC61IP5+Y8DWZ0TKEEzyoRczXVxc1sv5yKG6fOnE
         cHvMqzTNAJXAdl9tZAETUV5HhBLb3uNc4jmiePysYDD+V98j3c+3ipL1ePOY2uqhGlna
         MQkEupq2lxz2qr7gu0hELwGabYQPvcANcYUEvh1ORyTw9uOV/IfZq7Uwn6c+7cKwEAww
         ndtQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530ecx90V59gP08X2LVPafsJfE2POdjtsBhXWl3dCkHFtrPQ+yCs
	ShWPEN92l7IXJB/Ff2Q4FAY=
X-Google-Smtp-Source: ABdhPJwPgB/3Ny0fYEZmIUFAfWOP4vnsNgbwT5qADBLBk+G1RRjKQPjNON3Etc6NIYusRVQrqUpnEw==
X-Received: by 2002:a1c:7c1a:: with SMTP id x26mr2031581wmc.112.1601023811027;
        Fri, 25 Sep 2020 01:50:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e3c3:: with SMTP id k3ls2515194wrm.1.gmail; Fri, 25 Sep
 2020 01:50:09 -0700 (PDT)
X-Received: by 2002:adf:91c2:: with SMTP id 60mr3558991wri.292.1601023809917;
        Fri, 25 Sep 2020 01:50:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601023809; cv=none;
        d=google.com; s=arc-20160816;
        b=Gem37D/9yodynSmVJ6YiDbFQA5aUqbijHMgESNd+Bv3rXKOLtX8IxhKQHa8GMBc8et
         VQpGlfj+go5+fLctJgr/Hlkh8AGtldS6Z/gsVQkXwkYuc3AdQdub2ZpRgmm8fVebrS32
         zM662DQBaNKXcHy2MmRXpnsttro+UkMRsn3hjwsvVE7PGdyPGAASfRtl9TLJEhkrXqhq
         rTbDzf8OPt7eoUIZWMw/YnNYnZu4+IaRdWbDevMg59aghJYUCcPSWeaLCEoKB598jMFQ
         +5v/7oCiYXfJG0F1b5rja48y2p6jElH9TI1USUY/SKiuUBiGDc9SWCyu02uIq9HTzZhC
         P/VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=6chwAfQg8wK9kz1ZQM8FcssCnSxIFR9oFhKRtD/jB/0=;
        b=nzVelqOFRJcs85ZSXQNZPePyMtA8ZmryQYY/8QES/1vVyaqWX2DskUD7vPwEKQx8nG
         mvAzjQkHRDhgTaFy0UgOJuco4wtem7bwNmQp5aF4x1DPJ5T6AAOOH/wOf09EwbUpGWr4
         o6Y1wAtF2zO/LE1/BVfqWvYh9Px4GO4Y9UJqRaduskm3ZrBDkCBnUiMf0/qkr0c7fNeR
         lr5q+9ZS7LEDIZJ7KH1nZhy6p384b4aQHtLV4nA0dKal+RpBXWJ+gq08k14xPAt6GEHu
         /+tNLK/5WTYJs+6mYBtG7FXgjirTuBv3sMZ44cV6zLZrd+goexk1RUH1pMOz4iTSBfjJ
         sQRg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id k14si57503wrx.1.2020.09.25.01.50.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 01:50:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 08P8o9s5006954
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 10:50:09 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P8o7IL027224;
	Fri, 25 Sep 2020 10:50:09 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 4/8] arm64: smmu: Consolidate translation stage detection and reporting
Date: Fri, 25 Sep 2020 10:50:03 +0200
Message-Id: <04866b908593d05c8c8be29fda6c890d83a99a6c.1601023807.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601023807.git.jan.kiszka@siemens.com>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
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

We only support stage-2 translations, so quite a bit of inherited logic
from Linux can be dropped.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index e8dbf186..dc476618 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -34,8 +34,7 @@
 
 #define ARM_SMMU_FEAT_COHERENT_WALK	(1 << 0)
 #define ARM_SMMU_FEAT_STREAM_MATCH	(1 << 1)
-#define ARM_SMMU_FEAT_TRANS_S1		(1 << 2)
-#define ARM_SMMU_FEAT_TRANS_S2		(1 << 3)
+/* unused bits 2 and 3 */
 #define ARM_SMMU_FEAT_VMID16		(1 << 6)
 #define ARM_SMMU_FEAT_FMT_AARCH64_4K	(1 << 7)
 #define ARM_SMMU_FEAT_FMT_AARCH64_16K	(1 << 8)
@@ -602,16 +601,8 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	/* Only stage 2 translation is supported */
 	id &= ~(ID0_S1TS | ID0_NTS);
 
-	if (id & ID0_S2TS) {
-		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
-		printk("\tStage 2 translation\n");
-	}
-
-	if (!(smmu->features &
-		(ARM_SMMU_FEAT_TRANS_S1 | ARM_SMMU_FEAT_TRANS_S2))) {
-		printk("\tNo translation support!\n");
-		return -ENODEV;
-	}
+	if (!(id & ID0_S2TS))
+		return trace_error(-EIO);
 
 	/*
 	 * In order for DMA API calls to work properly, we must defer to what
@@ -742,14 +733,8 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	else
 		pgsize_bitmap |= smmu->pgsize_bitmap;
 	printk("\tsupported page sizes: 0x%08lx\n", smmu->pgsize_bitmap);
-
-	if (smmu->features & ARM_SMMU_FEAT_TRANS_S1)
-		printk("\tStage-1: %lu-bit VA -> %lu-bit IPA\n",
-		       smmu->va_size, smmu->ipa_size);
-
-	if (smmu->features & ARM_SMMU_FEAT_TRANS_S2)
-		printk("\tStage-2: %lu-bit IPA -> %lu-bit PA\n",
-		       smmu->ipa_size, smmu->pa_size);
+	printk("\tstage-2: %lu-bit IPA -> %lu-bit PA\n",
+	       smmu->ipa_size, smmu->pa_size);
 
 	return 0;
 }
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/04866b908593d05c8c8be29fda6c890d83a99a6c.1601023807.git.jan.kiszka%40siemens.com.
