Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTGH5H6AKGQEHDD2ZEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAAE29E398
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 07:40:12 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id 91sf839272wrk.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 23:40:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603953612; cv=pass;
        d=google.com; s=arc-20160816;
        b=q2qlOhTmsMBqqFhv3Jatbw1n0eB8tA1So+bFkWFZ11e9AyySLHOC0qPrT3Rv5+N+VQ
         wMDZ6etIHS5/oZ2PworzgW6AKGawnKhpXj0hsqngtfQWsK+wd/NCjQ15NxkbVbA3qpuD
         EZVE+Yh5mneVh8wSBgqxBF3t591NtyXmOHZ3i2fs6GC/HGJ2DEdNDGaNq7bZwQbLLu6r
         KtEauMOOy+qEiTwEu5UKKoYWjDNTwC1ZrsBNnrEIyEanLDo/BoGDZZ/dr2VNH/0bAxJc
         gQ/gPm4MZUiobmh3YVtG2anpZJkd1D6PKcg6FJ0kU/hAGR4dimqhh0PaN27tVzbmm7VU
         gM5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=E80sCgm7cN90Vbd9mj+i/wD3zTN7cpsCeURd3Qm90Es=;
        b=A/Tnd7R3AjgQLdYTtp8WaSBjrwEMgxuCZx7EinFYHuR+Q4QFW/oJieK4+IeVh6rFqh
         03ebrLlh9+dvDW2e43JCJzLa3VDu5f51oslmvW72AxblJJRi1MUb0rrIoGrjmuVaY+ft
         BeG0wDN/g4P1nh1wB9O6qRQIqHngH+hYaeQQDcZsOKr3YoRp2VAe1bVZLIgvKU/lPo0K
         vGirQ1SlzfOZkSK9+sLmQSGjvswZMG/Z0WtjLuKERCDvizsStvJvG5uuEeoM2W6LkNAW
         0MTTEp8cYjfCdL8v8Tr+pfNr1EITluVl33vXNaQ0nMkpOmI7MWSoK4aTrPvMtYwpFdMQ
         JzKQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=E80sCgm7cN90Vbd9mj+i/wD3zTN7cpsCeURd3Qm90Es=;
        b=fwHTx/hQPVeEhkG3RQHw/1uIBnTs9yWyAVGswj0oCm7QqeuDWhIrqWSAih7GdH6uCh
         2OFl2Kx7XEuTAQNlNm9oM5Wuyca5I390gl1vr1etKg7L1q0RQIQdG279ZxdvJiP6VvwJ
         Ek5v4dsBxlHvq3ezdBR8JuG7cjpYn7WNfLVWkrjfdc07Z83maElY3KRt45ZZmQiOyGJK
         1Uq0elSPhmpnEGbNiwRSp3sP+QRNB/Eub+8Gev/HG7SIzeLSiRgxuXc9/Uc4JsEisheq
         Q8C9k2KdR1CBc6pswLWOzp8gA1tJwU1pwrtVCBoqxagmr/KJ9wBPn3d+Jv+0eAmGnY0d
         WckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=E80sCgm7cN90Vbd9mj+i/wD3zTN7cpsCeURd3Qm90Es=;
        b=qwtOO4xt7drt34qlyId71VTqRmpUc3ylK28nvyb8hT6f+/CaizXhrSUljQqw/USCK8
         xy6gWMHGva4n5nJvBgEILMMZW4cy91ucdBf7DodQGKYJB7ghfh9rImeZcSVIxuSIQ8ka
         DHDouuC2Q7KwG2Qo6lLiKuA56A8eMeYiGBqGCbq+ZXQddp8mIPdiHTp2d9hNJ5uw/1TN
         8aJ7egeltSoMbr/S8mE9b3lQMsdsBTc815lNBrXULmsw/qsBBQT8wV8zsrGqvofV8hni
         gV27kUkzUWiXE6/BV2OBHJvdbs1/nwOVSWYN+5TJeUbPE5h2HzAtVrocLHFSQe7rwnJJ
         er5Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531KOo5wMbJ02nN2wrtTMmjRZnWz7ddif9Gjhbppe7BbbABYZwGW
	X2VGykhwSkpyXhxYYylCyaQ=
X-Google-Smtp-Source: ABdhPJxLRiE9xxXqtBBwxMeGYjZCXCVu/cuNkne1oaNMzuDJPA/GXTkHDwI8vOIMc/KPqUDR7e7Hkg==
X-Received: by 2002:adf:ce8a:: with SMTP id r10mr3652172wrn.188.1603953612437;
        Wed, 28 Oct 2020 23:40:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:cd8c:: with SMTP id q12ls1674816wrj.0.gmail; Wed, 28 Oct
 2020 23:40:11 -0700 (PDT)
X-Received: by 2002:adf:9d44:: with SMTP id o4mr3702621wre.229.1603953611281;
        Wed, 28 Oct 2020 23:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603953611; cv=none;
        d=google.com; s=arc-20160816;
        b=Vs8OvG4rMG9PEVPhIPXCPbHacvfDG/zF4Zo7n6bYPjHcMZObF2qgj9qEw/5RGslnKg
         f1e800PWkMp98yQdvy2Y4bgryyfnv7JA+ennSVfulMesoeu12+f1+58g5wz5Oiq7FH4r
         xTyDy+qqVS9jsk6sVERGbnnn7CNkYMEWf4aO4InvoEJ/AO+jMvIArdJsg+GXMBFkrjJ8
         /liqk6dBh2/dlXkaZ738+nOfGXJ9hQ9JhhLzw4xXdE/wHP74ZOL4RWFzeJT3YdYoCTd4
         jpuvivxlFBu1NwqjJAZ5EeYtfFhJt2WyxDui4g+Vmc+LxezNW73BhwWAOI3MVOCZYZrc
         y1vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=B8M/4jl0U31T7rn5qzwnYiwZjzSsuZVZ8Hlo9XktMNg=;
        b=GpeDqIb8tGYwYFoCM/QinU/snd9ZIOIjl/fwqUIeQNFmpJth+F61lPvcptlNJMncpH
         ZOy/I0RiODcrfohzL037mbU0CsQGoqu/8cstgf4MISc7zuIStNPJUMvY3TtTxF7Mnk9o
         pFhSyXs33hGQCtNpCeBns36jwXo3nZ98DS3dT9RekA/v7bZi7K32dEqGd953Lyr3j6ra
         Ch7gqRCcFZXB5oyk4+vkuyhioL94l2Z+Ja3xk2JMcudaYyh2V+zn0kkIxulhaJHv7NuO
         XGAreI3N9UhcRBtqRZZ5godMKIvD7T+Ipx5nQ38pc9x3oXapuCmoxyOYv7mVHPh/J+FB
         L+Rw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id 207si46624wme.0.2020.10.28.23.40.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2020 23:40:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09T6eAuE013352
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 29 Oct 2020 07:40:11 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09T6e7KJ018966
	for <jailhouse-dev@googlegroups.com>; Thu, 29 Oct 2020 07:40:09 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [jh-images][PATCH] linux-jailhouse: Disable SMMUs in arm64 config
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <3eccff87-8f79-d58d-22ef-7b30ab0f2701@siemens.com>
Date: Thu, 29 Oct 2020 07:40:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

This only affects the Ultra96 at this stage but will also be important
for future boards with SMMU support enabled in Jailhouse.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-kernel/linux/files/arm64_defconfig_5.4 | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-kernel/linux/files/arm64_defconfig_5.4 b/recipes-kernel/linux/files/arm64_defconfig_5.4
index cfa2da6..8c400db 100644
--- a/recipes-kernel/linux/files/arm64_defconfig_5.4
+++ b/recipes-kernel/linux/files/arm64_defconfig_5.4
@@ -435,8 +435,6 @@ CONFIG_PLATFORM_MHU=y
 CONFIG_PCC=y
 CONFIG_BCM2835_MBOX=y
 CONFIG_BCM_FLEXRM_MBOX=y
-CONFIG_ARM_SMMU=y
-CONFIG_ARM_SMMU_V3=y
 CONFIG_RASPBERRYPI_POWER=y
 CONFIG_ARCH_R8A7795=y
 CONFIG_ARCH_R8A7796=y
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3eccff87-8f79-d58d-22ef-7b30ab0f2701%40siemens.com.
