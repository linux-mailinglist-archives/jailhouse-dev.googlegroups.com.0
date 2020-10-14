Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXPNTL6AKGQEIXYUOOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2F128DB60
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:18 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id 14sf296408lfk.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664158; cv=pass;
        d=google.com; s=arc-20160816;
        b=gJWTu8cRN7DhVaOS7YjNBwPGSBIQI6orpErQkP0yBJrEjou/WsyU5xAZXwnjmPxOgt
         oVEAAE+M03t44o5KT4ARsb4F+NF//1HUcANO7TKNKNQYj97sLVr/WQSnwml4RqRNrW/5
         AoowtWEDhSlIHS/ursmhxwVEF1EhJcow+Hi5eeXsuPO8fTG+YBHKeQsY3s/i2tU/qXro
         BG8RSjrKl2wAc+9Hok+EbfO8MeMtqb1ICECoDJWmGrJvmL05v3DxdpVP3wArgia0Ayov
         cK7uQw/YZtgauD6H+3IQJwk4xEIBlhi1GUNSqO5u6/rBXSrgp9t3AW/gkMro26LeMrKz
         +Dxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=cNRJIDTZ019aSXMav78822mK5PVkfOFq4gqvlNhDb9U=;
        b=IXRRFluYFw3sT/NfvmkBbqQJslKlEpeQ+uhFa8JcZpusXUyX23ZCC2bJWTijeYvMF9
         rSSsWQ8j9HTVFVMKdiJAoXb8cNrxXyy3yrwYYAXfU7g6VXLRsZFgpL6CRKpieyo2CFd8
         vTYbzF9i+3imIoeH5+kTEUtWGsJCwNsWlQBk6JHogIn/+9wKUPIyELE1bm6k1J31aZah
         sBiwCdFWmzvuNUk8FvDYj5sQ/PmXpq//tLhngHjCFuFvikwDP4BoD4Ig7ew8JvBP8gqt
         yTxWLL40hZxXIUyh25daM0qvQsZyz8QMLmlDBjosn3gD+fvsAlJlR8uTZTrWjwUb5yD7
         4dbQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cNRJIDTZ019aSXMav78822mK5PVkfOFq4gqvlNhDb9U=;
        b=GKnLokCN8pP+QZQn6YSt9/SpzsAg/u8UONa3oAzvOPdgx5utZpuzIyWk3NTSv9I+Su
         IROd9QIlsOAWRHtijHRfa7wbXFLjIfZzr4nITLl3S7rtULvGxfVFI308A5eUZ7q3KJoA
         JcS/76tjSF6Y9/TY4sJhuMXiPq08JbZzIckWVrng5MfzkWzmBV4MvBWxcaUu7SffLGNd
         5QgSEycVZVVh27AZs33xLAc/gIVC/WIVZGO2mSAqZR8Z4l0yI4OV1VRBjmmrv/SWV4xE
         Livi7VwxjRbCFbyHUIjd5XR31WoC0m0KYyOr2oA7QXEFdg+hoh1hfJftThIFHbDDTGu9
         WScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cNRJIDTZ019aSXMav78822mK5PVkfOFq4gqvlNhDb9U=;
        b=RUzqCBmCpXunnSbONB0XaQ+YNGCdZ25uRwlFT9vPB10M6nUKVJqFF91fXyL3OJOJzd
         rLOG01hFba5rz5odwtlU+cfEBvez4YXjal6BBSs8fcJ8x7DuVX5uZXokPGapIHeBH7Hg
         3/HRGnoo37sFu7G8hT1SLKo1ywF4IHyixQAzHFWbJHx61uSLVo9N2noPboem7Xq4/GxH
         1eH7Vjox6CRCqM3ej/fXyIluZILAMP/5LI0I1iobcWLyVed2XYK06kyYAcXI6TnMj704
         BZOaFsovDAgJU6HkwzzdOmDnjNAeT7+mtqz6W4wV25RpVWiWWf+L8AzI1QHiqqldEe3N
         uYuQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532jUFbWCpoyLxiGrkO0HneTaseDlAnJsuWIbBNoWFeYegHsHg6u
	S4DjXsE8Pdv7nCbMGgZGjT4=
X-Google-Smtp-Source: ABdhPJw4ZWGk65NwHqbTQ6tQ6406wOywX8yAVwcEHxEY/gaCD5QqnWvQBIqpE+JuMG6shw/bVYIE7w==
X-Received: by 2002:a2e:8997:: with SMTP id c23mr1234834lji.132.1602664158198;
        Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:14d:: with SMTP id c13ls488269ljd.8.gmail; Wed, 14
 Oct 2020 01:29:16 -0700 (PDT)
X-Received: by 2002:a2e:b0cb:: with SMTP id g11mr1391244ljl.397.1602664156870;
        Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664156; cv=none;
        d=google.com; s=arc-20160816;
        b=LztOh5U3IFDFzO5wVsaCBmgjklz1k9qw4GiZ/wiFeho1n+FpU2uHjrs0VyohdYDu2C
         ZzMj3wXLHa/wyRC1/kStyzSbw1i8+pKauxSMNs3hiCHIruHuulcfCR5rxsj2gu9E6IRg
         /MlQY/Yf3+ASmtkIKH3oygnLPUehM7ZuBrB/DStHtpMzYdW3eZbjVexs/v+J1iOU+DBh
         9p0c9WzqlmTBGhSlGQR36H8EjGbhv34bF3enb6RuR38/CgN+DNyiABNkt9zcXv3oyoqw
         o53N5BoE4zYLsF5OWxtFAjclu/hmd350o3Yx9L3v0Ee4hz76po3soD2+AUfU7zUJv4hS
         EBeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=q3msRyArHF4h6NZc6zHo5+hdbujvf8ZBIJr6jMB93rs=;
        b=or1789ScDTShhxw4XMIUiugD1hKWdfpj5R1jlTfbodaGN98xpCj8GQWmQAa3i4dAbP
         jZ6CVboe1c8R8+hNIJp3fxAWLDrs69P2+G281qn2nQU6sUkrqW/Yy9VwgYDhGoQoo1FO
         RSC3pIrwwAPNNN+nWJRFJzMwQ1p/+1jdWNFAHlNLhBjHU/VSPL+YLrXXxLltlpWeb1SU
         GYLe0Xp04ixEUijjnb797IoNUmt2MznYDsrAuUFV88GH/7wOj5WeXKivh12R3plswTSt
         JIO5Nxm9UjcxPVziVttFBHIAaRHKYhRQhNWA02zlXw/Uo3YdwdinhPAZUFg1Gj8U0BGY
         N36w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id x19si71335ljh.2.2020.10.14.01.29.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TGSm031258
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:16 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJ8002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:15 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 22/46] arm64: smmu: Drop write-only pgsize_bitmap
Date: Wed, 14 Oct 2020 10:28:46 +0200
Message-Id: <817fdb930c4999028f8cc5eabef679e25850d569.1602664150.git.jan.kiszka@siemens.com>
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 44cecd33..e5a47197 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -261,7 +261,6 @@ struct arm_smmu_device {
 
 static struct arm_smmu_device smmu_device[JAILHOUSE_MAX_IOMMU_UNITS];
 static unsigned int num_smmu_devices;
-static unsigned long pgsize_bitmap = -1;
 
 #define for_each_smmu(smmu, counter)				\
 	for ((smmu) = &smmu_device[0], (counter) = 0;		\
@@ -652,10 +651,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_64K)
 		smmu->pgsize_bitmap |= SZ_64K | SZ_512M;
 
-	if (pgsize_bitmap == -1UL)
-		pgsize_bitmap = smmu->pgsize_bitmap;
-	else
-		pgsize_bitmap |= smmu->pgsize_bitmap;
 	printk(" supported page sizes: 0x%08lx\n"
 	       " stage-2: %lu-bit IPA -> %lu-bit PA\n",
 	       smmu->pgsize_bitmap, smmu->ipa_size, smmu->pa_size);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/817fdb930c4999028f8cc5eabef679e25850d569.1602664150.git.jan.kiszka%40siemens.com.
