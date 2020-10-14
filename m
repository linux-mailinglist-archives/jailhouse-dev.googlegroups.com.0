Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWPNTL6AKGQEOBOKETQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 450E528DB4A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:14 +0200 (CEST)
Received: by mail-ej1-x637.google.com with SMTP id ga21sf882891ejb.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664154; cv=pass;
        d=google.com; s=arc-20160816;
        b=ix58qBTgRNdjk8GD/+2/CR23633/80Df2AjRcpSnGST1OIjNfdjX5ngi01k9IJvEIh
         8P+v8G8r8HPc9G7rr9OJ4zrQGCexz4sHZic6XK7r/3vXNuc40jAB0TYGjC4WRumfSuJG
         tPtkwp4kjKCsMSTQadAPWY2OjdPAbgOJlTtbpl8jkGfeXd55OlKyAFMD0UzMkBCucMvX
         K1E3NYvcBKsuoBccBlfofqb49Yh7pBh7NTRUCkmYtoCf/VBqRTqFTL+OlG9xJPoUK/Ax
         SlMmSHI3zyFKKcSEQ2uwPmuqLMVKaYAr1oavd6RWwOum2TkNjbZhMf3b4VF7C8ov+Ngc
         bGKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=hF/R9viTkrILJyiNkb5SGVHOtZdOsa+cB80X4NfwJfg=;
        b=B4OuhwZt5bJk4Sjns6gWZsKMN872xGVWhKJb8mpiA9By9G/SlcmyxI0U+C9QVuL+gU
         dWwOqpT3+2foELwq9LJfQhamnfb9VWvs9gy4v6taHzjo40ZUVbmXJ0p2RAyUBvNzxO0P
         7mnYRIk5F5Gg2padl7+KAl8g0v0jlqKRbbpbzlBVU4Woe3/BrARECptVSpZtBiGxqqfz
         ExuKZAOSBitttRa53OtNRXcMhwHMXjG/EfRu8R7BhkLWRq1G6pOodCtLMOr8YuRD0MvB
         Stxp5sZMo8RbXFE0egv3/9HSa3Mozd95pb0tAIpwEInTJI3lG+zq0eYGtxI7BZVkNE46
         Do2Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hF/R9viTkrILJyiNkb5SGVHOtZdOsa+cB80X4NfwJfg=;
        b=U4UZh8MB545DUAGPasTBFwVPVG31bIjrdqPQeExmACtCEQc7ajTSlHj2Q4oMOSuOB/
         /AC0oqQbI2xHcKYlbnzB8GEFhqe1VkOSZ0Rz8XSgL0UgCryKMy/Aw2KqHp2MX7SgtMvO
         O2jWMGj3yomYXeuzvZdCbHOr2bG4ip2krvYEPToWossGPsP3xDeRUJmWm7/PdphI7/2J
         +Wh9BBw91AK1DhbqirQzGusnSOviEi6KS7YqbkPkQRRfn0G66pyYihJBgVDdyGbDZX3X
         Ai8ubUJNYV0kBCw2d7Nln5Jf/chboZKA530zLh+U9z/PGSymX133pArw2wO8EIK+p/Qu
         TA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hF/R9viTkrILJyiNkb5SGVHOtZdOsa+cB80X4NfwJfg=;
        b=twbSLklOKHBrc7up9RndcwT7NaoaR9+NJ1Ijr/9rirhl2b6tLES3f7vQoUJBdC611+
         5mlA8/JeA97gbjSyyUQ20YbvirBIzhUxVQBnE4YwL0/HNkAFYXhXhNen4hDfTcvAnPhr
         HX7TBfYN3X+N0E3Y9rL9j+RVqayhbv7NszvLR73g0DLWKBfCsKtzVyZ/WLHEkg/Dr8ZM
         9EWuCbnxE3qaTQJHKcqIFHkBfvGB6klNG9CVXfT0NYf8wHyENAwDtE1pOAq6+9d/+xJZ
         Xbl/J5kuAODvabnDmo4awBrEWKP1oFYyEriIFwGOuKmDQWNE6CLkJ1QaynahcOCDfzhT
         hfSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530g57lHgYxYRBN/df4ZkizmTpsadPL3eHg71ENcVuPngabOfy5g
	yQaaRf7lrPBhK+/JaubZR5M=
X-Google-Smtp-Source: ABdhPJzo4sn/kaUzLoCvX5S6uX3oEEdk+w5snwDuD6s7bVL9wcy+pKZzaTUkhWetlxiReYH1OJHRiw==
X-Received: by 2002:aa7:cd09:: with SMTP id b9mr3875119edw.55.1602664153990;
        Wed, 14 Oct 2020 01:29:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4904:: with SMTP id b4ls1229435ejq.9.gmail; Wed, 14
 Oct 2020 01:29:12 -0700 (PDT)
X-Received: by 2002:a17:906:3589:: with SMTP id o9mr4287789ejb.218.1602664152898;
        Wed, 14 Oct 2020 01:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664152; cv=none;
        d=google.com; s=arc-20160816;
        b=h9tmjccyYyZGtcquX8jb+HMtmAUfkI9oZjkKtqSXhzC0VC8Ij54uyygktz6hIMnbo3
         AK49kFvDlHoCP26fXZvWfKo0wo87QAANDsV8ySU2Vg7A2e27dBVPZQatVl2Fb+Thdswg
         VXEOhDAwxooaPupGxqGYpQ/L9veGFq5oCBjz1162UrbmVmvomokQ/6AogWryeYxAdS47
         xPCIr+qRPyx9vcc4QdRUYhS4IIwwmwG4F4MbbitIDEh6qZDx3zHdcLsSwHwprXwsDdKK
         rWYEaecRw9LXSgPxAgQ/CN/ML78ol1bqdSboIgQL7OVgfpG64pp778nosAFTBmBVoHA0
         JHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=7oi4DfdqKhxYmfbJxoDUiWIVZOzaECmzMQpBumQkzQk=;
        b=eJzHcpiCdsxWf4gs7CLlvLzOcu9jeErLKcBhxUMj/xe5wDFPv3EROrF9tzld3ZJxs1
         eWnXfFhO/VmMGL38rq/TvGlrJlPtA1d2H1DDrA+Z6D+ZX50lkzkhssR63u7LtggDyonw
         Po4OIesx0ZPxwb1vaSwUNNo9mBS2bFkAqTk/PP78S900+mSnYUn//SllZg2IsSEKPguV
         keDaQCyRO8nlwz39u/nLt7ro0q8VjktpwMBNgNC4g+eGoqcNr01cop480SNMj1j9XnKm
         Jv0O8PR9XnAUaMVRnuBM8/2PbovWzMhRJEtGxQDGpEzKZXA/3AeJRXLtwWhJkChP/nuW
         mbNQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id n11si79207edi.1.2020.10.14.01.29.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TCwx031116
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:12 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAIr002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:12 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 07/46] arm64: smmu: Drop useless features initialization
Date: Wed, 14 Oct 2020 10:28:31 +0200
Message-Id: <72e1b91b0baddaa9a07625a99dd7cf8f437c200a.1602664150.git.jan.kiszka@siemens.com>
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

This field already comes zero-initialized.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index b3facb8b..59cc8a78 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -939,7 +939,6 @@ static int arm_smmu_init(void)
 
 		num++;
 
-		smmu_device[i].features &= ~ARM_SMMU_FEAT_COHERENT_WALK;
 		smmu_device[i].arm_sid_mask = iommu->arm_mmu500.sid_mask;
 
 		smmu_device[i].base = paging_map_device(iommu->base,
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/72e1b91b0baddaa9a07625a99dd7cf8f437c200a.1602664150.git.jan.kiszka%40siemens.com.
