Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYHNTL6AKGQEJ6INZDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6C028DB69
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:21 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id z8sf1046110lji.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664160; cv=pass;
        d=google.com; s=arc-20160816;
        b=o/ml/SqnEXYKwJUQDIiFAVyjReC0SfX+YtyTi+EEAuvKQZgocC8jj4NNqJ6bEkzYhj
         EWuyOiPq8aJWOmG8hI9MVK7A//Pm/nnv0LygBOWLaxhnCRPJ3EnaFG3MUCcSrF9cN/zs
         782t+YJO8+U6siktpo940/1vfnnmKeWXcYsORl026jfGXJWHLm6TcDv+V6MOxQIbRA0j
         /nPurg73dseEOCgHe3CkEv9YT3439mt4PkfUQCg+Ds4Pwj1UzUGtRrykacr4FBd84Ll5
         fjYWuNewlgiguoragJb7hrDnw4lmPtkvZABdp9hXUpyxJmCNgQztWomg+k4wkRMbON6Z
         4kBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=56rezpaAh1HbnTP+XTn9qigGmGN9cP6JCNeRQ/17yGo=;
        b=Q0M0/Ld8eYd9+QoHPh363Tm1EiEjldw1P2ie82EJh0t/IiwOT8O6QKevbV0nJx2AxG
         3hT+4/Royz1v++CohFFvEKnTtFpqaeMhoDmJ5sPVYGGyNHmqB6pDKDGMWg4RCwxheNAI
         SpyILyhcDL8iZQHdZwGmEcruC7xb4EXA5GsfbajGFBPKFxf6PU9KFyhY3jtJ+pwsduw8
         ljRJ0ZnaaMp6nw1Inc3mF6Ch1zn2RgNw9QlVPXJgu1iwoHP7wvzBQybAMKDLfOLH4TYI
         s1/nW1IVuppfW1PiKXeomMAsYF77ZhfYnCJNPGxp3fnLRQa0H75GMY8QUMmh8KltO7uD
         n+yg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=56rezpaAh1HbnTP+XTn9qigGmGN9cP6JCNeRQ/17yGo=;
        b=hMxYAmcuBGAFv6KU9Phk1AMZgIaycmL+498DY4PQB9w4qLyJSqT7ZsOaXfY74WFK5d
         g2sqPMTRTBXLMMtOPgo7pMHfhL4DPQvYLDYVYR7G/Ki0fvsj7RymXhAWJH1vb8uuUazZ
         znXL/Ffwn7i8BxYxU8yAa+4tokr2/fAgT5EDOIP8w7M/bimhiX6Lvp+AOxeqRWvNmo/U
         O+KHi8tzpuJyRqcbnau92SCDAW9kHr3EhCpkog9WSVws0xL7lZxje8XH9xtUOwJoSoVc
         MF0sDFSNJc4qcaKRCA9m7AWyLloUtp4BHhCMBDfRaO0ESpB94Me/wt1cPhuQ2ZZTI1Mq
         9hEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=56rezpaAh1HbnTP+XTn9qigGmGN9cP6JCNeRQ/17yGo=;
        b=Pfx7DQW4Jv65FwcqUhKAS4ZDYAWR0NC09uMp0xUgnF7G0NCnTE7MdYrIoDBk83IYbu
         CnbonlNjDW7PO1/i899iKAvxa2FNRvKNCW7ckpRO6vM71zzswtnLCHjBPVwiBCtbY2VJ
         oSXN1yeFqyOuvzVUiqdsXVr/UyHFizaof6m/xV/2j/Pu2mHGmCM1zlGG+2/nZUX6fNYR
         RCKqFRQkePKQT9mmSq9p7a3wKhS7JGK0x+6pF9vZlxIo9cTeGRp+61/UPjKyFW10DMqU
         z8KR6KhdiAqvpxy3bFQWFK3nhHoWl+ItoWh76OXBd8Cm2nCtYqZgQBsIN1Xw4muV8IJt
         41uQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532nGn6HbU44bP0Evp/7iYXEYJvhny+FjZk7B7UXEIJ+kFG+cFvZ
	EBHKBjlrua9RUYFwdWYHQBk=
X-Google-Smtp-Source: ABdhPJyXqcGUnVLh8L6nMs0cKuwR9Q3wa+CWpodt+8lBNGNsDsyDIcbsxA/pf3ldE2FTqMJpckofeQ==
X-Received: by 2002:a19:5c2:: with SMTP id 185mr1148866lff.15.1602664160613;
        Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls1311028lfd.3.gmail; Wed, 14
 Oct 2020 01:29:19 -0700 (PDT)
X-Received: by 2002:a19:995:: with SMTP id 143mr939008lfj.228.1602664159446;
        Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664159; cv=none;
        d=google.com; s=arc-20160816;
        b=EZJCUDLGxliGpnebRgSZIEoEpla7FPe4r35dKpcIV9y4LA3rrCAWNrgpQUNGumBdbz
         zxt1S/I2vYhVbFsmx5fG2rd5NKBvVpsBUdREO1y9fZgZbN0rCrcGul270m4reyO0frn7
         UDSs7hvBlYFeTSEdor1a5yZuwoplQ9mksPHTCMfKHEwqpa+J8XQn3vzBLbxToazOQsRP
         919k4VoUbjRZPrXA41iVzawiEYTPQI8CdrxuZfSzSVrY8woYNPGrsD0XUB8z3iyw0glN
         TlrtWOgGWFOsI81DVh99mfkZFNTQCtNaK6xw1Ypg1wMJ3iog3vjuJgig9zXASvjEVnYp
         zsEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=0cEgmak76xxqBzIie7Ha7hz4lmbsG6o3v0vHQrnOcwM=;
        b=q5HyYfjvr3y7uP2Dd/e/hRu43QgxjyTlsXoZ3BbyQjKZWjN6DuF7Dg7fD9it4p2SFw
         d3v86GztxxBtJd8jII/ry3a0QDXXZDfWYN6IFRuB6yYEq7pJ9OL8yO1Ts4Zj8Pe2omcT
         nOim5OGRd6K5cuRX5daRC2Kop2LqXu7yfPj6eH4apNMTcil3hRPpv2f2NVmEDdPKn4fT
         Yj5Qvvej3hKXJZ71HIuXvmJOYKNTp678f6834+7CrSbh8PESjqy9HpBI54IlZBRSymC6
         dWtdMlPUJyoSLCYVducRVJ8tUail3/t3mXdv++jjXfvRvNbJothNOnCVXHkDxnlb0uTL
         rilw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id f23si72460ljg.8.2020.10.14.01.29.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09E8TILO000355
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:18 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJJ002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:18 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 33/46] arm64: smmu: Introduce arm_smmu_disable_context_bank
Date: Wed, 14 Oct 2020 10:28:57 +0200
Message-Id: <ad35cc802481666180ca9518401f55b80e26c5c0.1602664150.git.jan.kiszka@siemens.com>
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

This avoid having to carry the information if a context bank is enabled
and makes the code more readable.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index acfe0cd9..0fa48588 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -265,12 +265,6 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 
 	cb_base = ARM_SMMU_CB(smmu, idx);
 
-	/* Unassigned context banks only need disabling */
-	if (!cfg) {
-		mmio_write32(cb_base + ARM_SMMU_CB_SCTLR, 0);
-		return;
-	}
-
 	gr1_base = ARM_SMMU_GR1(smmu);
 
 	/* CBA2R */
@@ -298,6 +292,11 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 		     SCTLR_CFIE | SCTLR_CFRE | SCTLR_AFE | SCTLR_TRE | SCTLR_M);
 }
 
+static void arm_smmu_disable_context_bank(struct arm_smmu_device *smmu, int idx)
+{
+	mmio_write32(ARM_SMMU_CB(smmu, idx) + ARM_SMMU_CB_SCTLR, 0);
+}
+
 static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	void *gr0_base = ARM_SMMU_GR0(smmu);
@@ -341,7 +340,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	for (idx = 0; idx < smmu->num_context_banks; ++idx) {
 		void *cb_base = ARM_SMMU_CB(smmu, idx);
 
-		arm_smmu_write_context_bank(smmu, idx);
+		arm_smmu_disable_context_bank(smmu, idx);
 		mmio_write32(cb_base + ARM_SMMU_CB_FSR, FSR_FAULT);
 		/*
 		 * Disable MMU-500's not-particularly-beneficial next-page
@@ -598,8 +597,7 @@ static void arm_smmu_cell_exit(struct cell *cell)
 			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_FAULT, 0);
 		}
 
-		smmu->cbs[id].cfg = NULL;
-		arm_smmu_write_context_bank(smmu, id);
+		arm_smmu_disable_context_bank(smmu, id);
 
 		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID, id);
 		arm_smmu_tlb_sync_global(smmu);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ad35cc802481666180ca9518401f55b80e26c5c0.1602664150.git.jan.kiszka%40siemens.com.
