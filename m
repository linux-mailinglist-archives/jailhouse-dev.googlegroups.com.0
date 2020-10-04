Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBONX5D5QKGQEH2JVOHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 841B7282CAD
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:10 +0200 (CEST)
Received: by mail-ej1-x63a.google.com with SMTP id y25sf2398262ejj.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838010; cv=pass;
        d=google.com; s=arc-20160816;
        b=bgyoFohARAxy6FP6G94a82X2qKkCK5pYRT+xAbmsGbpkDSGPncsePeDS4GC2/tK/zy
         wA2BYERLjI6TLIgU3mr+w6t6ylZMJ+7cutg3HlriP7eMOwoFhmAzHltvwdbC2+fl9ccr
         tiDm0NrCiHiUzyJkyTnugE3rPLqfU2gfsNmytn3C7yHMWZ/8dtFojE+i7hPwW8nt7Y45
         y9648dn7gJwa6bzn9et2jcnqQbcKPjFutq6og3y3G5FdC2MTV41hO1RkQyOdN+MWAFRf
         UKIIxKrfua6DX68kKTwvGAEAVh+45CvCRWwsD/vxn9eoC77TceaCoV1HCy50ZQ4agJE0
         PTBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=9hVPEdK0LnTulEUjEl07xsXzGz0BdyxXZgigv86wP/4=;
        b=hXjvRZEL35vVRhc5nSV+03nmSIE2xssHdh92H3j4/CtSP4ZYxlgdmFY7g23F4II7gF
         M/tgAhNzYPIYM6IphQhT3y3lHyVULMc6fNUCkbIPsNUC1k/0ueh6rMrCCEcPSRkitWx+
         Ei4DUfmKkv254ht4j+cm/rFPtHpgtMn0e8mBx41HpmSzGuyuy1lOcQz4lgug5ZhzCEys
         sOjoQWFa54vMWeZ0d5ZGgE9fvvEKmWEsgR3FA/q3FCvyKLD6RkhIDXYcGldMPy2Vng92
         8dWfNpGSuAVCHBK1UPr4jHfLonOPmCmb/Eb1r8+4H42B0J/E8axf2SlQvTPJtPWoNqrY
         MKLw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9hVPEdK0LnTulEUjEl07xsXzGz0BdyxXZgigv86wP/4=;
        b=UVQo22aDzWlXLDtexEWJsVNRBw5TPheeWPDHbPPXTAS6QwofDEVugFGoPEAsXSQzsJ
         P6LbTSPZARr9zntFBZ2X7kCaQo+92Hryjhv+bYB0F4iQIAq574PgGGN7Ra6TOem8EMqS
         7RrGWPnbFQD8BMZnn6ch37IKKZPB8hzQvKNJL0E5ouNDfH9OJNRZiLjXnfW/h82Wu+g3
         IPYcrRQhzeSmIujvSFt9I1lgZMK+/4hZd++mHgpEpX9UNYeIuv4kFdKvnv0p/v/qUy4+
         D4/2bW1fpR6vb6XBS/PtVgKCZsBTsoEjTDK/yGhTnc2m/ZTKgF6o0n7pnqewVVQBc2nA
         fxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9hVPEdK0LnTulEUjEl07xsXzGz0BdyxXZgigv86wP/4=;
        b=eRCg53Pm+pcbraMKhHzKRLAwfNS3mI8GpxnrjhYQAISUWpzT3DVMTCYbqbAD9SkY/g
         aMnSbw71cCMbNgzobp6MNXhNMmsiE5+0bIqdXsuG9/J2XB72Yk8Lri0qKgc5VxnO83ZW
         q3SUuM5v79jMYEIrE3x19t8VccuJzQe68bSIPZz/KAkkX/24OjC8Lgmno+nF5aSwhgwt
         W7b6FMD3O2m37JB2TvzCLoLkaoEfpqof1DDPbDMWn/A95JKpEr1+CtJY+jtYXnCriiy4
         okZtRvMRV2us/kKxxV4WitgLOPZV+VwM+XH8Lk8Mn5IhIGPUFsEB9BYbBDdFl34+B+6v
         S//w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53133Ej3a3ntyvD9jX9gRine/toKhW5VwOOebygQuhOJjs76OZM2
	9FeYTwCzssebJ7iY5cfdCRc=
X-Google-Smtp-Source: ABdhPJzW6suDPAR7havh8R1TsMzDkplsaB7m9zFyjBXB2l5d8M6pHN9OuerBCtq/f2d2L9lXRwm/yg==
X-Received: by 2002:a17:906:5812:: with SMTP id m18mr12399469ejq.204.1601838010236;
        Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4c8c:: with SMTP id q12ls3145730eju.2.gmail; Sun, 04
 Oct 2020 12:00:09 -0700 (PDT)
X-Received: by 2002:a17:907:94cf:: with SMTP id dn15mr12302939ejc.114.1601838009179;
        Sun, 04 Oct 2020 12:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838009; cv=none;
        d=google.com; s=arc-20160816;
        b=dz46S6vC3L3uStJ7KY6KD8kJAgaSgiuPzswnT+INpgaB4DGn/q7TezzzLBIp7KO92A
         RB7Te+BG3352dHPt6W2WpVa81cX26N2ksOxn0/V/XWBGnoabEa+iZEHaUBXYuvjwSxtP
         6Bm2QcQ04L+F5y3wRKzE1lT8we40uPZJTGK/M0BW1AiwXiCxW4NTmh5LefrDY4CSX7GV
         /KxFIpjTLGO174DUMUsYanc41cLgAVLreHIrIsdkULR08o2pb20ulefIsbyaKHYYkWrD
         ThnWvWb88GbSe60dSUxTsw+1H4JhM735SMO5F4T6lqqRQvjJe84/Qpv1oz7EIh/48q9L
         uV5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=kCb5yeLI7/haIqqyXO3vOY1Hc1HPskZTAE7g0g4SuEE=;
        b=ZcaxpGSCvEN70zZso8df6xkKw/0kAy5gLfyY/4gA8onqa/jZ7UnZM8Gm77H0YFK/tL
         yjYkmgWQyrmHtGYGnbV0ZA+wBCyg2Q7IwueOO771w4V8QLkRsVzWV/q/jSjkSwtVzfrp
         gZmFic59CaUKbyzu7HJnByLPy3lzcFCkxouu8wsWsQhYQ7umoHKfWYPSiymUj+8sUpih
         /RuUia3/VFswjz/avKiui5tckkj4GP3FhbxjmwBjKEKM1BnldMsr8N4YsZwy1bL63y7J
         MaLTrnWdPTqPjeU5Ibqg7LJYKLRQ6tqXUVp8Sj3vHoJzTuYsCMes9tK5UW/cKEoU9T3W
         kKDw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id j32si148305edd.5.2020.10.04.12.00.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J08sA004270
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:08 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060G017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:08 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 04/45] arm64: smmu: Deny transfers by default
Date: Sun,  4 Oct 2020 20:59:25 +0200
Message-Id: <d59b094012dc4f14c62ec742648b9a98e153b554.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
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

Make sure that DMA transfers from unconfigured sources do not sneak by.
This is in line with the access policy for other resources: Deny what is
not explicitly allowed.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 69374b28..2564bbd2 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -216,7 +216,7 @@ enum arm_smmu_s2cr_type {
 };
 
 #define s2cr_init_val (struct arm_smmu_s2cr){	\
-	.type = S2CR_TYPE_BYPASS,		\
+	.type = S2CR_TYPE_FAULT,		\
 }
 
 enum arm_smmu_s2cr_privcfg {
@@ -483,7 +483,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 
 	/*
 	 * Reset stream mapping groups: Initial values mark all SMRn as
-	 * invalid and all S2CRn as bypass unless overridden.
+	 * invalid and all S2CRn as fault until overridden.
 	 */
 	for (i = 0; i < smmu->num_mapping_groups; ++i)
 		arm_smmu_write_sme(smmu, i);
@@ -534,7 +534,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 
 	/* Enable client access, handling unmatched streams as appropriate */
 	reg &= ~sCR0_CLIENTPD;
-	reg &= ~sCR0_USFCFG;
+	reg |= sCR0_USFCFG;
 
 	/* Disable forced broadcasting */
 	reg &= ~sCR0_FB;
@@ -637,7 +637,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 
 	smmu->cfgs = (struct arm_smmu_cfg *)(smmu->s2crs + size);
 
-	/* Configure to Bypass mode */
 	for (i = 0; i < size; i++)
 		smmu->s2crs[i] = s2cr_init_val;
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d59b094012dc4f14c62ec742648b9a98e153b554.1601838005.git.jan.kiszka%40siemens.com.
