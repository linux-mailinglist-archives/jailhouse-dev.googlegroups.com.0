Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB67T23YAKGQEPL73AGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63f.google.com (mail-pl1-x63f.google.com [IPv6:2607:f8b0:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B0C134010
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Jan 2020 12:16:13 +0100 (CET)
Received: by mail-pl1-x63f.google.com with SMTP id k9sf1358903pll.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Jan 2020 03:16:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578482172; cv=pass;
        d=google.com; s=arc-20160816;
        b=BInRRdIiLmdQIdQcwEzOM44S9+jAWH9t2ibk73qEmT5X/29UJmRP4GYA9cGewji+yN
         dyXYfvHaXA/C1+KRDqT6P50NAUWoeVAsd146T0S94wjFoySTypsjfRS8LIARHKiS3we0
         etltF8qG2a74Og9cNSnsYgREyGECwwoEDl1zea5XiGc2hJw6S1bdIRYkVK0ncN5lFPQ+
         wQjrMBRdzS75VOO3Xmpy96QKo4Dy02gG03+lgLgWJyhI37qTe/5zVIxRFXT58fvETIt0
         kNNakmLmzuZJxwbXtzDMG45JD7LMKC6FKFQ0VHaVkm/+LhIh7/HF+4J3ID+/i35IGpc8
         yQcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=GMwkOi/ZULqwB0LmEUhBP9cC4AuU2IH613tl5bB9MiM=;
        b=qGpkQ+VH2JYcmEktkiIHh87fZ8ADAewgwf7fgX086+sPYKbd0MfWu0RAm11sM2t5cB
         X6WAIJfxr7V1Ff4BECc+KtxWj1dXA+ISrwTrRhlPHblW1itdYLcqTZVf+NiA3+UjLZYS
         Yiw4EzxvxI+gQZeDEH/8DtQdwJe/i5VzLHpNN/Fq8ipF9wagCNadKWE/r4ZoGtq0m/wc
         wuA3bNw+3vJC5RyTsQD8hyGXjUu24u9pCs97Mj9Y4aUiittm/iCpjnu60w/1XvWf+yyr
         TK65kaLIzrJ2dc5BxEP4ONJALU8Jpv7ugRRVzlYw6gr4VNtRbregNHN4btzHq46N1cV9
         GyNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=w8L1z77u;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=GMwkOi/ZULqwB0LmEUhBP9cC4AuU2IH613tl5bB9MiM=;
        b=tA+EiJf38IyjchsOr43i10PV48mttQ29DcB8GB64wuU39Hg06vDYMFaC74BIfJoMTE
         ZR4derIay9TNST1j6MTeiR6lK+Sg2jNK6Rya6VPEo6FO9W2Manz1312zYbR8eNkiDUG+
         GqWOrlGhO859flnblPOqOxw0D8p6Zo0gxFcDH1t+K4/IRJ3mdcc8HY/dzbE/rGpwPotq
         NtN54Ocu8TYMh2hMhSz8rKgcSdC05lOmLleQjU9brAVUmPUROpvoVdxl1M9gb0fpI96I
         dF4cpPhtcpzNbugxrKnel9au6E1SC2JmolKBRqERFAN+BkWYsnPBnweTK6OE2AXpYb0h
         FJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GMwkOi/ZULqwB0LmEUhBP9cC4AuU2IH613tl5bB9MiM=;
        b=Y1XZPh0Z0oiYRzy4i4PBYj8yfKCl76jkHOFB8NYaOMqTHY8hK6x7byMGchEybnwK1x
         zxFANw/nNGxKLiVIZ1nYFI1VlV2EEdppxfD+AbVsoBEL+qc9OP72zVIi4s9MdT3b8YME
         XwcB7oXYdhZKauRn/CkK4kTwDrDZPs5i/Hf4dFHI9fIf6xd2De+G50smxd2Sjw/YubMi
         SkH34sdrfmFxrmNLl5wasMoAkuvcdD1pK9qVQuw1KMpO6MzuO0ppMIvkMmzZsVb6pDfh
         cgjFvnvgFYrrYef15zoRw3/jILAqfyAKgknq1uu5K3sRR13tcwqhCI6xx28R166T27W4
         VuQg==
X-Gm-Message-State: APjAAAUxyuBEFfLraUO573hL3BgtOCKmbSe3e7k9N4XlwVodzbybSPap
	ixHsxw2JzF5hHyPWoyH56UI=
X-Google-Smtp-Source: APXvYqziZmTUP7SpHE0EL3gBsUmnbGtH/uWhAWo9dnNwEFfilLVb14YpuMjUM8dkwH9nyIfM250/nQ==
X-Received: by 2002:a63:a357:: with SMTP id v23mr4662953pgn.223.1578482171762;
        Wed, 08 Jan 2020 03:16:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:cd83:: with SMTP id o125ls898968pfg.5.gmail; Wed, 08 Jan
 2020 03:16:11 -0800 (PST)
X-Received: by 2002:a63:950c:: with SMTP id p12mr4699286pgd.85.1578482171153;
        Wed, 08 Jan 2020 03:16:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578482171; cv=none;
        d=google.com; s=arc-20160816;
        b=NZwIz01vjGPBJn8tOBDb4t+TZy/lP4E9Ua12gte3oAKlRzuKr8RjPKhB9xmvsjcq2g
         ez+FQ+BukmoOMcv3k8hZMr3L5+nLt3FVHie9zFAQj6856nB4CxpV89dc5hbwdqaUgYVM
         xxlHwniDSYhqn8XbrOjl2ADRsjesNNXR34t8nDdrISanSggjoXO+STpJFWu/CU5qNHWY
         SBHjTuCoR+R/F4fm8C9jp35gDmfXdA+btokO6m9QVjv9Kevsv576ib7J11MjSxM6qfbI
         jChpUq6DZdZl4nI13zuDOC2NwIWnCEPu35C2Kn85Ne7msf6fl0TA2lJYra7xlMWs7Jry
         Rhgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=+LcgbIwgZ9+jvauira1Q7Si8mboSrMvbe/oUpnZquis=;
        b=LUf6D+FPZwWdnKcamzg4FMl9AoDWEQDVbzeLFnoApxTtnZcFAU2BbFBir/6bojd77v
         ncIDiIMJWpE3nP0nMCQNQjsFrnhTSZ3nM5X2jaDK1JCA9vyRqPaGNJG2tXqP96qUv/Kc
         DAPR929zrh4E4Jb3CNIn1f768WBbXMN6/Df9aunZQ3eSWvAAn8k7zBso46X9HtUeZzf6
         9cGJcxDOlhfUNR8PSU4Fh+1KAoSjnfaY8QcuNG7hgeMBovW/wfzvBRX4rxJhUj0MyUQk
         Re+9qJFs8FNqAgNoN2lI1QkNvdRSOr/UG8AFW0Z+7ZXtPYlgfiVHAiFkoiD7vZBsWg3w
         JCJw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=w8L1z77u;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id k1si137794pgj.0.2020.01.08.03.16.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jan 2020 03:16:11 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 008BGAAV070381;
	Wed, 8 Jan 2020 05:16:10 -0600
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 008BGAu9033207
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2020 05:16:10 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 05:16:10 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 05:16:10 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008BG8Bk031463;
	Wed, 8 Jan 2020 05:16:08 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v2 1/3] config: Remove unused JAILHOUSE_INVALID_STREAMID
Date: Wed, 8 Jan 2020 16:45:10 +0530
Message-ID: <20200108111512.9844-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=w8L1z77u;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Stream IDs are now described as arrays.
We do not need the sentinel JAILHOUSE_INVALID_STREAMID.
Remove this unused define.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 include/jailhouse/cell-config.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 54f0c8c6..5b983b38 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -74,8 +74,6 @@
 
 #define JAILHOUSE_CELL_DESC_SIGNATURE	"JHCELL"
 
-#define JAILHOUSE_INVALID_STREAMID			(~0)
-
 /**
  * The jailhouse cell configuration.
  *
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200108111512.9844-1-nikhil.nd%40ti.com.
