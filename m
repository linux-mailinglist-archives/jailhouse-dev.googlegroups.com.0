Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBW7NTL6AKGQEC54ASDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0F928DB53
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:15 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id t17sf968210wrm.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664155; cv=pass;
        d=google.com; s=arc-20160816;
        b=F00b96T886DmlvrE+P1kDE02zJIpoQKOx/1FpNknywnecQGjGu0pArozvuFDYqGAWK
         1z9002yC5E2tautBG8qK1716LyK9IYQH/TmhWIjT4Jh1zOoBNcZQYpd2WNrLEqXzAzXl
         t/2ZHfW4n1fVmZ+5a3eCyKK7WCaqOqcaRrG0bNqgeBrEIUXS7EdSqSS4N0jak+J8l0V5
         JXTWW0OJvOwqGg56MB2RoL7pyhA+JwjgvzKwC5gGLdCiOjFUN4EwPH6tFR06QcrIW1i4
         4TLB40pYWjRdKFaUumIXUvmeYCG3SenlKJarQMNME96m3uNgkJwMc9HYIqNYsuATBIns
         kWsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=etck58Y3WnuemGMT+7PsBOhpRpbOGcIJ71+LPT/lmHM=;
        b=FWKqWybTJ5k+aOFY5Gii/YcH4Btj76AhEefgHao7zJ2iUAbtD9IZAHD42UMch4Em9r
         Ea46XpHzmmWe3RmEjdvCF2bHOpT6UvUt9yfps9kQuV+x+ZEEcXjgrUhk/SXkozkMRjGi
         E/ZVN262DWfZ+rdZGMT5hfZtNHCy8IdJ7NaP30mncktv9weX31HypgJ4dohYvpOu2hB7
         cYM/37MKO4ldN3zo+JY4BlbgSXKxpkRA8HCk63CSDY69nUw6k1fwzp6FMD57sgJj002r
         PQuakIlo24dH/Az047qtMSJLmekQXCf7uR4XALhkazjZ+Lpbub1si/HShyBRISRFZyVH
         8sdQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=etck58Y3WnuemGMT+7PsBOhpRpbOGcIJ71+LPT/lmHM=;
        b=lULH5Wi0RcCYfmWX9/VFLDG4nanSaHFjp1WEKKIGH/GwOY+I9IHEQ8EyXyj7m0E04h
         ukGyuE/RF+UbVV0ycCGC4Y8jVqGUdkLur2g+pphKkwmGOrdjT9mK+bzs4QdpHh1RokOY
         8AxCy8iGeiCDGgLshpdBp6JE+5uoJPxGusFRGeEVjnDopS7rTbhUI9HAXDvjRTZ02aNE
         e+/70i+uddS4cPAb/2MOx9DDeRMgj+ujSzcdHm/y9DpBpgB0ESZKSWQi6pg/w2CYKm7S
         bvw6Ec5R9/i2rx2kDCiNopZEwYA4IPxfwQ+6cjnYQeH1uM48UkcTJXmrodsUaFloapnq
         eygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=etck58Y3WnuemGMT+7PsBOhpRpbOGcIJ71+LPT/lmHM=;
        b=ujY5aFaHdQimNrqZ9s95uoWgARVbAxUJNyqaBLDh88f71wsEwbUkyvkOq0E32JEGHP
         f9qlVBRjI4pxoZeO7EKCJ3+xksKayy882DNxKwLal5lkLpJhWQfmALBnegHyeUfdEHyP
         vJpcqD9vlvBRhFvwRh+gyYox+RRnTx1prHSbuVs/rvA41LG3onZNqWD/n3FZ83TS05uS
         /kEwUBZTK+KZ+1pUcOSbpPjfP4tSssKdtoWqMDo9ats/qkW8ez5gVRLIAXIp2QffGkGq
         8Oi89bmghGi1GwY/EcCz0mcGkF7jVKClEtcwrg1fdjFjHmlcBOuwj/ps9wE1UYFsKPg0
         tnmA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532TSzDtBFEhVuBuqfPr9tDmQOfa6cBuabynoNtmJn+cZoBcia3s
	bPjmNIKYSJFUkOcZohxZ8x8=
X-Google-Smtp-Source: ABdhPJwtMELWmE+xfWy4s23jVCVFO+9klDjPWYttRfMLB3AYGbRvZIXoyocmlF6ORCI7ikTLicwMuQ==
X-Received: by 2002:a7b:c92c:: with SMTP id h12mr2361173wml.134.1602664155539;
        Wed, 14 Oct 2020 01:29:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cbc4:: with SMTP id n4ls746441wmi.3.gmail; Wed, 14 Oct
 2020 01:29:14 -0700 (PDT)
X-Received: by 2002:a1c:60d5:: with SMTP id u204mr2333308wmb.46.1602664154535;
        Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664154; cv=none;
        d=google.com; s=arc-20160816;
        b=KoBIiOtztUtYp5IZlCKTBPKKGjavk/PwR3YJ7csYWh1rPgfCR0MQKyr4eORqII9W/7
         CT1vkhcgSq/p/8jVqlVpMaNHb6EncW8EaYIsnGnfJZgVPJsc6FaIHnMBh61pWzi23Cm2
         7HgWzxMrkK1imBhdhM50nHZf5NpxpjqLBv3ZH9Kd6e02JR/9VvLZuWA7lh4Fk7YsDZVb
         o5sVJ1ddEzsxK5PMKr+hZ3AVYYN/puGbL5uTkpaZKoWlfeTmV0MKIylxntaHiejYhowG
         ljeVofQkjWYUIVO58zubKTA9uoyCroiupUvgWsaGZF6n+/nXWwechKmIMvu5uZqLAIx2
         XieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=ML70qeWad+pnfvExdmDIAM15d7hORrW40z1yYnfYsM0=;
        b=d2LC1C6b3HakGfJWnSwp6IEBWfSM9H5yVpBqC1z1f7RD+Im6HLT1gq5yUZfaVj54Z9
         QU2TFyXvsLXR/agoH3kHeNwCuob3gEdzJy7rkF0Tlyo0j1YIq02GZX8TQwLVACws25CN
         8VxDCYVlsECk5naJSS3ESjTb+p7On42+fY3wO9XH+B9vjK8R9vz6gco7Y385JedyU6L4
         uFPOPL9S1ztCDkvDDd++XKvvN9DPt95ekZw6Mn39qC2xcJFAte058Qo8jI9DkAWRT8LF
         qymU53vi8R4fHu062LnB+HJABq2m5FnO4Qs+Pi84Bue+mpoUdw9oWRnmMhC3KwhmM748
         Zhwg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id w206si42027wmb.2.2020.10.14.01.29.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09E8TE3N032670
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:14 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAIx002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:13 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 13/46] arm64: smmu: Add shutdown handler
Date: Wed, 14 Oct 2020 10:28:37 +0200
Message-Id: <2d088f8a96e82f52d54570d6374bfe42c13a48f9.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
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

Properly disable the SMMU on shutdown as well as on errors during setup.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 34c99a6a..f20a44f6 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -890,6 +890,17 @@ static void arm_smmu_cell_exit(struct cell *cell)
 	}
 }
 
+static void arm_smmu_shutdown(void)
+{
+	struct arm_smmu_device *smmu;
+	unsigned int dev;
+
+	for_each_smmu(smmu, dev) {
+		mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0,
+			     sCR0_CLIENTPD);
+	}
+}
+
 static int arm_smmu_init(void)
 {
 	struct jailhouse_iommu *iommu;
@@ -906,8 +917,10 @@ static int arm_smmu_init(void)
 		smmu->arm_sid_mask = iommu->arm_mmu500.sid_mask;
 
 		smmu->base = paging_map_device(iommu->base, iommu->size);
-		if (!smmu->base)
-			return -ENOMEM;
+		if (!smmu->base) {
+			err = -ENOMEM;
+			goto error;
+		}
 
 		printk("ARM MMU500 at 0x%llx with:\n", iommu->base);
 
@@ -915,11 +928,11 @@ static int arm_smmu_init(void)
 
 		err = arm_smmu_device_cfg_probe(smmu);
 		if (err)
-			return err;
+			goto error;
 
 		err = arm_smmu_device_reset(smmu);
 		if (err)
-			return err;
+			goto error;
 
 		arm_smmu_test_smr_masks(smmu);
 
@@ -929,9 +942,14 @@ static int arm_smmu_init(void)
 	if (num_smmu_devices == 0)
 		return 0;
 
-	return arm_smmu_cell_init(&root_cell);
+	err = arm_smmu_cell_init(&root_cell);
+	if (!err)
+		return 0;
+
+error:
+	arm_smmu_shutdown();
+	return err;
 }
 
 DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(arm_smmu);
-DEFINE_UNIT_SHUTDOWN_STUB(arm_smmu);
 DEFINE_UNIT(arm_smmu, "ARM SMMU");
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2d088f8a96e82f52d54570d6374bfe42c13a48f9.1602664150.git.jan.kiszka%40siemens.com.
