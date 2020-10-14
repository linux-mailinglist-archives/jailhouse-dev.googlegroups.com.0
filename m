Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWPNTL6AKGQEOBOKETQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63b.google.com (mail-ej1-x63b.google.com [IPv6:2a00:1450:4864:20::63b])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9F928DB47
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:13 +0200 (CEST)
Received: by mail-ej1-x63b.google.com with SMTP id d13sf882441ejz.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664153; cv=pass;
        d=google.com; s=arc-20160816;
        b=KN9FyukBiLiSuELVC4T7AtKCb8jFbw1v5H4lKr4JHwR1xZQjsmqv9RtZCpwnwt9voP
         2rp9VSMyy/tMUCYHOxKr7J23XOp6IxYJxlOEtWqIj+A8r6Muvs2D3D1+Ljw+j8SO3oSr
         XBxRIHNBLnasMZ+lQDMbqHHKNHxf0t6iJkoF/4r0S1dpnFe0fGVtW+Bt4RMDSGZImcxv
         q/t97f8sFffFGYzmCBcwDnaz2uSfvS649jQODUeKpHwo859VUp8AzpjKmdVEGP1JWoPI
         zYvtuwwqBYIC2WMCJMGQ3bDjBvyU8Ag2AcFdeCC7GBHKZGhLvLPlEC2dLZ/0MvDzYx04
         8YEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=1SC0DbczCLnew95gV1Lvk+rDDtEbUKpDZDus2Uq9ntQ=;
        b=r1z6dahiDmIPREJ9ekhypr273IOErToPKEIkXBYW+gq/LLQE/qA0aA1ZV8Ws/IjBH5
         xLSerXi1otbGPcXzvEMH8FVPjec1DPwOXizKp11Ev6FxZwvBflgLsvktUn89iJbYXKd8
         jmRzs7E6R2QdNaZESEB3q+niyl5oct7D3ZJ0dJYDcsKS1fwP74KbKpPGtQZNgbzaEmEC
         6BOZNq78aG6D8NMGFE2bzzI22PYlBLpCi0d8J0XxMicT8ghfHphebDTnDzidifDP3Vrv
         VH4NXMoRjcbHT+Noodj+N2uFXtaZ2xRpURnyQlaJd28BlZ9RZ6g8qxNioAMxwNvdhFhp
         h3AQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1SC0DbczCLnew95gV1Lvk+rDDtEbUKpDZDus2Uq9ntQ=;
        b=iktj8uNbPWb5pj2ozbS5pFcOMl+/xsoqsBzwGeieBhCLl9y12OCDcwdz8kf0eYVe6f
         xAQyMe45hpZpXseimkHtCdDX4A8wPlxdp6seSzr/t/jC7qkuEdztDJFaxddjcURc5OAj
         kMkHg+aXOcQ3T8jDFwYLvMPhSTirGG2DuQeDgnpx8/9jzFFvFtC4rIHhrcV9RXhkqcmu
         ZfYikta0bk/bhvTbe3Hc93aqIv4Pve7CL/hPD0ORwXCBqF+HHt/aTcyqw2SRZg++ZgEt
         AG+yhkDG/niSKqXodpB8FJkTAzUe3viW5CgvVXyy7aMbcaGKAhle9/qVq5TpNfkLLKnS
         PMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1SC0DbczCLnew95gV1Lvk+rDDtEbUKpDZDus2Uq9ntQ=;
        b=i3zTSHtGvHGZxeA6xfCkJvtI/eV73+of5Gkxa5dmpOx/O+q9V4woGax2BhGXRaXyPE
         62ho4akLdeNAsjAEMZb91UHQiDBMSy5W0NI4xoAFaVQCQJASqpJMXIRnFA5mneUeUU/8
         +E58yzA7nCE4IdXe5zylH23m8A6dMWxC3pl1DyGK0CqEYAdIOU2MAg9fTqx+D9x8DI8g
         qIVQUZyXqubNvFjQg+BD2RPgJq+qf0hFWPU/WSrs4ttBcfV3C7ZfDWMejoJ3xOimsuvL
         UnTK8+fRcRXKZQB52w5TBUB1kS/B3dhl79pQeqqInQMn6moVO7dETRYvE9LJkNmSn/0g
         fZDQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532JxR4raKCxE2oiT9GyPrJP905lVZXHqPu7SdnqHrQg3wpNRfIt
	szTUE1kOcnz0Qr0xcl7WOMo=
X-Google-Smtp-Source: ABdhPJw1975CeW/gAyCkY9Hl6TMn4l+BYuJ2lJuQ8JT6CZShycgj4a6erfo0xJa8d8H7hTO9SN7wKQ==
X-Received: by 2002:a17:906:3716:: with SMTP id d22mr4144231ejc.267.1602664153671;
        Wed, 14 Oct 2020 01:29:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:7381:: with SMTP id er1ls1232117ejc.8.gmail; Wed, 14
 Oct 2020 01:29:12 -0700 (PDT)
X-Received: by 2002:a17:906:d292:: with SMTP id ay18mr4290990ejb.244.1602664152509;
        Wed, 14 Oct 2020 01:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664152; cv=none;
        d=google.com; s=arc-20160816;
        b=gTL7PZlkYfcCtbY6LvpsGVdLAax2LY2NLMmoE7W3Q8/KEFP0GV9sFDdH8XwMjRLjr2
         OMbg5CuMLKYoRzFvyWgnKhWRsdysBccUbbvUKbOqN8Kf4KYBvc+/1gno2VGaboWdpV14
         2VG3KDnJaWKv6aEihHouF5vbKL4zTfqW0O1ujsJfdZOwJYwKRjRZcEJaxsDElS0YEvVn
         wuJJFBbrSN+HfU52vKBYju190BVSVvkvcwrnp3vnfYkDFbZL0rcHdvNPtmsngqXeZJI4
         YpYCw3cKNIKV3JLms5nLLEUqIPIdYOSfCsZHRxQMh3aH1mwQOnKsklf0eNKwRhvWJNLO
         vZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=kCb5yeLI7/haIqqyXO3vOY1Hc1HPskZTAE7g0g4SuEE=;
        b=FE7KlcPjXu17llXiA8UpW3iTZlp+TEQIDjQkgm5MgjG37N5zqwr5FB9JYr9D4lGrr/
         9S4S+5t/VJDQvviP4y4k+9RE5Cy6rF87mC/NaYNULnUfDkqBVYTFD+areOTQAiRwf/sF
         WQrguz7cfwH+D+WXLl4nMxmaiwp9zIkZaS0ltWc35gG63KFTEXacYwgi2X9zD9bYj1ze
         mWb0HA7v8NDLmDOvT+BFEJecrvCR4+n6cR/9l6yx0QkLJDdpxexXuCbK41aQFFrR5qJ1
         P1903iTUrgBvnJNN7yvMouoNM8Tk9Ajp9AYl4vyIyzc+xIfPeOFRhooeSN3+gvv/RXG+
         xinA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id lf25si26175ejb.0.2020.10.14.01.29.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09E8TCJI032614
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:12 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAIp002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:11 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 05/46] arm64: smmu: Deny transfers by default
Date: Wed, 14 Oct 2020 10:28:29 +0200
Message-Id: <b96d5afeb7364d21131a2c6a03a3f1bba290a634.1602664150.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b96d5afeb7364d21131a2c6a03a3f1bba290a634.1602664150.git.jan.kiszka%40siemens.com.
