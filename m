Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYHNTL6AKGQEJ6INZDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE5728DB6D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:21 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id n133sf290164lfa.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664161; cv=pass;
        d=google.com; s=arc-20160816;
        b=JBzJ5IxAJMPhP7Z652+VTXG9lcaVoV0O+8LcHs1mNBLB8Jy8YDH/Rwx8BrkoOzvxX0
         3IX2WhPKrCRytIVaTBc6vNMlky3M+yHOFI6aZNPyWTmU+F4qM2qsjccXP9SL5EWfwzLL
         r9FaFUwvmPzgnAW2pzU4NWs3mdbApmYBbFnrBtsaolBEUH0c04plYFpO0o1CxJGvGaP4
         LvK3sW+zLlprhitlRsKJ0o29Bi5WO1b1QlSamA8ozPCsa46/g79V/nEcla+Fpzt093UM
         3razsMKik1WSo1K+K5KpF6ZMc1GvzAwq+yc8i13q8Pgfh6Do/JHVZzJaIJRGyB4n0z5E
         dgUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=tk6dmMU/w42ExQLxWD75sKfcbKCWDLDBw+ueeWCf0J0=;
        b=MPhLDZahCvxtJyfZLDQnj1sUn8BDRVLcNKmXoKxRy6Tqv9bubR/x9Anw2kVmlOV4gW
         NnxbsDbI+rKan6IjM3pOZdMJr0mnWMHlgcOKTBP9kjoPLWKkBUHbftA7nG4Vwc53LfxF
         vmE6UXOZcu3cA2taMSG/+BTWZE9lTqluP1ekw/usS/Ub20X8vGgkInl2vgmpQ2wnX15H
         EZbcJ8bgfp9D16FEAfOVnfSn/rbL7q6uGdt/QI2k0NTX+2NRVunh+tLfjDzimk2yQ2Gr
         iSFIVMjEtWN3FP0lWgClK2PWsZcinFEUA1nHtM1SEBRhZy/Enmy+xaxr4xl0/tBcZJHe
         9CEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tk6dmMU/w42ExQLxWD75sKfcbKCWDLDBw+ueeWCf0J0=;
        b=HzpSKS0DFbIHMpVP8nuiZa/KKpydGoQGGKf2+ks9LVE/hKH8w0OtlVNHCcjmR+lbUH
         poY3sVixzPrqknEEPqqPfZeJU2EugcMfz9/IucRExWTsZ0sguQjwlyD1naVXdsoPwru/
         NZfQvgTL13wk4ZGYcsqXYOmHT1HpdaKOnueRbeXMXZOkqKECsoN1YTgcfIIwkX2t02Oh
         4d0GawFRHZR7F2xKiOIyUkFSLWh9lzFpi2Tag+crxcixfZJKPi32XWe/ab7eY1mcDjHj
         HuxNwOQOQdx5xHZFCc62JLV/u3cfFeewxFU4iliYTWgpeQ14SdUwCIL8o6l+Lvets18j
         upag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tk6dmMU/w42ExQLxWD75sKfcbKCWDLDBw+ueeWCf0J0=;
        b=d+FaK8U+PpAVPCBIm92K2fS4uds59+uLcn1XvFU3e5MpjBe7MdqQMBvu7USsLEj2RN
         UaiaH5I/qC6sSQSJAk4PuTSshRHVvpT9VW57cGlwU2i2j3rGlD/RQtkGoxhn6o4s8F7u
         +fBF84KdTT6ii8BxR0P43Ozpv7I/1NyF0xggBFBDnz1ApsbEH9Kp7ZYG3sbsPnXaCpBN
         qU2KGyI/6aIhLIkicxrq9b0YIvu+gH7J/0dJ4wdw95SahEIyQEH1L+4ILY5I13S02LxY
         VVb6tI8fNhNi9/DCfYmY5/6aNOxby0AE2yJbS2JX4U8baXE7PaLiJiPuk8/PJn73+AuR
         43wA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531iwd+tEz3XPU5KuYoUyS6aFvwYgaw6pY/O46VR8bWvvuPsFcdc
	WMrn2ANvx9lBKUZJBamcLRU=
X-Google-Smtp-Source: ABdhPJzbgQboBXKRs646scXho/rWfnE3oP3OKOr/f2pTmmu9YRCABwsWqo7ZVScMZkFAgWircuqB2A==
X-Received: by 2002:a19:6816:: with SMTP id d22mr1156991lfc.132.1602664161137;
        Wed, 14 Oct 2020 01:29:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls1311050lfd.3.gmail; Wed, 14
 Oct 2020 01:29:20 -0700 (PDT)
X-Received: by 2002:ac2:5473:: with SMTP id e19mr1108114lfn.544.1602664160031;
        Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664160; cv=none;
        d=google.com; s=arc-20160816;
        b=tn9vsrXGF0dBmsINH2fzQYQ3B2/OwJscJSKCYSYVITPuO/jO5wCmDJyeL6JDlQWsLR
         LsYei/TFFCubdgEBjJ/RKXAYfcsYdxwpvymkSwRK9jpNIqc3/45OqX5FI0ojLyl35QCw
         GD7u3LYvWVxQXBHCMAmNTUUCaohrnFZfoDva8x0776KdsZlvaEE3GAnDFZGFmrpFdNi+
         4hn8g+ytyCozn5QuI/envgolVnsCclLYWpoetZbCfVTMS3PGz19sqlYg9aoslMIDJBWf
         nEM7ttNwQhUHDdN8+iBhzylTMiaFclG44HOVEHMecxwsGgi6UdVjJWL8pAgkesTaLTGK
         irlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=4cs7LS9d0i+pTwHhq/5SPpwDZbJr/A3gJGUCWGPgdkg=;
        b=URP5LAB9M4bP1X4T6xssVtTt+ddjhtmMJbOMUuF2DJnFfDuSmZYarTU5SzEHlgv+7f
         ETIoWbdCDEARBSKRmBR6WRy3m0gHlRE1z2gKJN7YTOnAhAY9ZDE6fvaUbaKugqzJMxFD
         0a70jLicdJkA4PqzmG6FCKEBlfcs1YadlCFZ6j6AH22mIbwWVWfitYsD/921nm+ZIoiN
         Or6PlSoiqix3uxUoUkgQoNPNIhPQjHSxd+RHHL4a4SOPF+eFx/8+z/8L0M94hoR/eJwO
         2tfWm2rNj/A0RWkuISKsjSKLM3HSU0MSKSJB1HIUOzDJKWG56Btqg/auhOfeIfI/IzWu
         KWtA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id i17si63319ljn.4.2020.10.14.01.29.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TJTZ031374
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:19 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJM002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:19 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 36/46] arm64: smmu: Refactor ID2 evaluation
Date: Wed, 14 Oct 2020 10:29:00 +0200
Message-Id: <0a1641a9ca026ff86bce36e7682e482504c244cc.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

Use GET_FIELD where possible, change to descending bit order.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 8d0ce757..ace7a48d 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -60,14 +60,11 @@
 #define ID1_NUMCB(id)			GET_FIELD(id, 7, 0)
 
 #define ARM_SMMU_GR0_ID2		0x28
-#define ARM_SMMU_GR0_ID7		0x3c
-
-#define ID2_IAS_SHIFT			0
-#define ID2_IAS_MASK			0xf
-#define ID2_OAS_SHIFT			4
-#define ID2_OAS_MASK			0xf
 #define ID2_PTFS_4K			(1 << 12)
+#define ID2_OAS(id)			GET_FIELD(id, 7, 4)
+#define ID2_IAS(id)			GET_FIELD(id, 3, 0)
 
+#define ARM_SMMU_GR0_ID7		0x3c
 #define ID7_MAJOR_SHIFT			4
 #define ID7_MAJOR_MASK			0xf
 
@@ -439,11 +436,11 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 
 	/* ID2 */
 	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID2);
-	size = arm_smmu_id_size_to_bits((id >> ID2_IAS_SHIFT) & ID2_IAS_MASK);
+	size = arm_smmu_id_size_to_bits(ID2_IAS(id));
 	smmu->ipa_size = MIN(size, get_cpu_parange());
 
 	/* The output mask is also applied for bypass */
-	size = arm_smmu_id_size_to_bits((id >> ID2_OAS_SHIFT) & ID2_OAS_MASK);
+	size = arm_smmu_id_size_to_bits(ID2_OAS(id));
 	smmu->pa_size = size;
 
 	if (!(id & ID2_PTFS_4K))
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0a1641a9ca026ff86bce36e7682e482504c244cc.1602664150.git.jan.kiszka%40siemens.com.
