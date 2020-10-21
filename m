Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBHMXYH6AKGQENF5CVNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC2D294F2C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:22 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id z7sf1720014wmi.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292062; cv=pass;
        d=google.com; s=arc-20160816;
        b=rUoRRI2pmfXXnFM4xb+jdh87/6oWz2bYurQ91W6PZShSBWe1oOHjOQ4J0gyUv89QCg
         ucdbgeBRBOeqwNZHlJmcq5mdBfJQUV8k5z1xFeHZTz3m0/y8SqKvS3IMyYS4HOA1iI+0
         nRObfWQrW0l4uvugTKMVSElp7pt0+xkrNVXQQdhOEfiDEP5rIrymD43PLfFJ0MGT5M+B
         o7UZp5rIDfmFt5tk0UCpx3sVeJpgOdi4v8t66M8/oGO0Lh2nqV0pMLQMgPck/xEDPr0g
         wgLSakneQf2WnwjYJ1P2cYShBuwWkAn4c5Wxmd1F8GlbI15S+OUIxrip3FU/4qiVG9bF
         gd+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=BI+PjPZvXXp7qCvpgOcF3GiTToA6ww1qvkalhX+cYZE=;
        b=Gl4l9fo5oTMp4NMXp/LY7oehP1w5+fY9KSsDPFRJ6EP49CGwGxVoTZtMMmD2Xv52YQ
         a9JGwlatEURNUMZBhDAc5rIBNXkZ6Gj0H23+owVTjZ0s2gT14lwCnBVSJy/RrrjM6FTd
         E4K8eseBdMFik9MDUqzDZ+fezP6YCSwOD/ago1nm80Oo8ndDLKbkNKSvVLmi6dDlxLJw
         W88FqSnbi5/+k10sklLATX4nB2ULEqSC/3SxmIn6J5WmSCxZ+o3ZQ0qkBN0dQ50OXvXr
         RhawzElaeC4XoN8vS0CTTGXX1/oQmjaOM10FlZSw8EFscTj0Uusmv77XZJVB8WuWmeW3
         WvIg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=1zOdh7Ui;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BI+PjPZvXXp7qCvpgOcF3GiTToA6ww1qvkalhX+cYZE=;
        b=YE/se7sESLmXHosjXKMlMhFM9+w6bhTxmmQsfV9rjYSRGPABi/zusa8bMmLCG5Cuoy
         Jff99VeOKCBXj2+xhVc2mtvMgF/HeoCYAw0RVR/mu1oTLFjHXkbv0wXDXpTomUvakJP9
         wTlx+be/S2rrL81TBOe7PMhlcYLuEwkDi575N+wNmPJbyj8Gtm2qDoDR/Ho3pgZAh34v
         PnlN12zUwYWGE1vioEopkS+CSh/Lu9oubOkWaFEKGTq6LFAP2uLA22JCi8+Id51tRIuJ
         FWOSnLoLX3R/E+JLrhwb+8+32eNauEf63fGXCKw6FltiehEllU6OWepI6sicmsHkwgCo
         Gl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BI+PjPZvXXp7qCvpgOcF3GiTToA6ww1qvkalhX+cYZE=;
        b=Wz6PU/1mB8AFu0phqXMV7SUaDKt+SlcYtW82arwaYY41DHxTvd7i1DSk18XuIYj4v2
         MMIbHyqgJblyxeXrkSMj5hlJ1ZfvuTR/wz8BuBznD90Ko5j3BqJKPPhQkJEOT1dmPggO
         CPbhFpA1hW3fJTtuwjCIavoPfG4zsnkcDBfOV0zxUsKQ0zPjpxWKKsm60+wgGcHXCckV
         gnJKqIMsCcWIxA+WO4mESp2f4Eqkwv4CojHwF6m8PZB4vCtqWWpjWrKMH3iVJP5I9WcE
         URKI1e4f9oMALRNAMb/MtELeC/NPl8Njpff8pZbdxJiN4q8hW8eOYFi8SESZsuYHsnPm
         3TEw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531QdTwi6n2fUzhCNIpiztrx7NrqasfVfLLsjhGd3wLazADWQUjN
	8qMxIHfjyPjhGK3kGdmmWvw=
X-Google-Smtp-Source: ABdhPJzWpH2rPeySCZZreOG7moeLmwjhi3MJCB1rJMkQn88xWBfvS3vY0T+kEnxuieBO8ODNl2lPjw==
X-Received: by 2002:a1c:1f87:: with SMTP id f129mr4110051wmf.182.1603292061855;
        Wed, 21 Oct 2020 07:54:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7d02:: with SMTP id y2ls114101wmc.2.canary-gmail; Wed,
 21 Oct 2020 07:54:21 -0700 (PDT)
X-Received: by 2002:a7b:c143:: with SMTP id z3mr4145667wmi.17.1603292061037;
        Wed, 21 Oct 2020 07:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292061; cv=none;
        d=google.com; s=arc-20160816;
        b=fv+zq6zvKCr55MnM/Afx/MPRR2bCyEP31PrvsMk09M/cZMJNMxN+/zBaqMs4DrEeJ6
         fls8VtZxw8//GDSGrl57jwrW3a5hIiKjHPYMrfRJJe72EfH+12nteG4oRubtv6KKcTLk
         +YQsU9mz1FsB+VdCMQiHwlEnjNKo7alfM0wX2ZJ4YRPNDWlLuDCwU/qc/7d4gR1r4TAb
         2S8JRGnY6T+pH5SZqZ710jzU6c8g6tcUiJ23KkAr334duu56uA2sGPQfHR8GH4Pm6qiO
         GaIONWLX+GuyT/qg63zuGGEAWYzTI/GE5uT4JVQKEt/mCgBMM7Oi7SlZJn47Z0pwiACn
         RGfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=3KK6F769swUUoe07Bu7rMkYxtag0jWooa0VbshOG5WE=;
        b=IlpeuoXbYZvIOQwZWLdeVB9GlXMcKEhg3LFA40Ls1Kf3u57XW2E+6T1HKDLjvkvH1+
         I2V4u7aX0SBzpjBgs15ZQfsM+PivZBHXrUHkmKxbwYgp/noPrbbqnV1GcKH5Oa5yo6P0
         eTaQDS41GyC48FsOC7f8x5D30aHyh5cKM36nalNyxifBLRs9VgQwVKnf8PVl+sXbKr30
         8WtgEGdyF7jSNnKOIPvzkHdaEDVuwYGOJXcYL2yOlxphG0TdqOLbPGnheSkkfx3DFXXC
         7AN3MzUg0HtdKRthz2WF0OzK28UiOg3tJBWb1JWa7NReoyY5T7guF+v33DBxJ2I/WsrN
         iprA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=1zOdh7Ui;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id e5si86531wrj.3.2020.10.21.07.54.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRc69X8zySK
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:20 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id haRlYwA8nw-w for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:20 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRc26xfzyWr
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:20 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 25/26] arm64: smmu: Wsign-compare: make iterator uint
Date: Wed, 21 Oct 2020 16:54:03 +0200
Message-Id: <20201021145404.100463-26-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=1zOdh7Ui;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Partial fix, Wconversion will complain anyway due to the return int.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/smmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index fa583745..7266fdb6 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -370,7 +370,8 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 {
 	struct arm_smmu_smr *smrs = smmu->smrs;
-	int i, free_idx = -EINVAL;
+	int free_idx = -EINVAL;
+	unsigned int i;
 
 	/* Stream indexing is blissfully easy */
 	if (!smrs)
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-26-andrea.bastoni%40tum.de.
