Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB25XXH3AKGQEOPWAFNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x539.google.com (mail-pg1-x539.google.com [IPv6:2607:f8b0:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7371E4201
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 14:24:13 +0200 (CEST)
Received: by mail-pg1-x539.google.com with SMTP id m15sf19228623pgl.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 05:24:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590582252; cv=pass;
        d=google.com; s=arc-20160816;
        b=EEYtat2zwoejHUUX+tcBnsJhAjgZQZxhzvpHFeAekjTTw6L0ZrqRjyrj6KjIr3S2I8
         uzqYDWSNqLh/6vPkNuE/ca5fc65tSHvTGPlhvsW9QEzsnn+rawDQfz0KYE9IKfmacda4
         6z0birMc4Iy0EqEXVQpMJXlel7Jhju5723TtQxlDkeNsSoo5kiwgMapPd1kQaFBTL7CM
         TD6iQ6lsmuzCAHtWYHjGoKF8cqfHdrEfP+9p1bNErE22AFawrC1upOOMnsL1vHVPj5dN
         1WfU9dGFgRiGmSoMyJcgukLJcXC5bo/7UY0rAnowopMsXrU7/b7//OzxEx7ELhV9ilCL
         pThQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=CipOkqNjWpMFLQWkCmo+hui/koXY3D58844qmbVZbFE=;
        b=fa9ycx4lVG76yv0Ld+qAACWqslTkAQiFLAJN2z4YSZNFssjSO7bCM6CIh2VDxZUPJl
         yLJOJ/DGig/3HqJcbC4dcJ68iRpl4F+59F6nECjmuVGGKzCib4q6d2yoWUnnCDW5HbyZ
         Sm0VifzMh9O2/NDJ8XosSozYOYGztscCE0vuMoYXGOvB8yIUepCV81Ff3Qk7WzUwZcGO
         BZBxHIATsm0X6SjbFCzWwj36tG0Jp6dFc0AZEffD38w4FM/WgCy8r7Cn4t+SS3VXsOOn
         OTqTr6k82Z/g4m9zol5v+XAeYzaLDEhsFYF7cD3rDf0OJkH6n/Sc/bK31SzXCtt+ONvA
         pn5g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WH1VIcJ+;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CipOkqNjWpMFLQWkCmo+hui/koXY3D58844qmbVZbFE=;
        b=gJgmsCcHfAQ4nQq9oFPGFiJGn8EFmT2aPVBWZOdBicUZMVV31COxseL+jblnSeTpLS
         D4TD2Tb01I03FrC5iOYiPIGasTDeVFJlJL8OL9ir/zXtkvcDJFmTO5jBQQJ3roVIJbde
         uAfrt7XCNYEu5XnbKA5ZqixWfEy61L7YrUGWTkTBraoymZ2boCNziRWyzQeeDWIKPU/L
         sZQiS+txM92mvzFw5ditQSNp+xGC73kLNh83fmO7MXrHvQF/5FtRqPb3sDFd/fauWSNo
         Tc2q9e5wPeAQj/uEiU0riS6z19adyx8MD/F6aFBkcOecO/9F1UWy9Hk8vq8RHMONhM+/
         Cphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CipOkqNjWpMFLQWkCmo+hui/koXY3D58844qmbVZbFE=;
        b=c62Wu+WLwmeDZO4ddSlkVj9MXi8TKxHP+NMRF67T7jnYo5DjnMU7eq5KhqfU4mM1j5
         zphhLjE9ZKp1EJQzvImIRAVeai2bc/rDPTB75cMM8/B/3xD67SgKK/k669p7IFMHPsyL
         wwPwBnmf4CAD29K9fFs5UMSFc/TIoqpIt52p0NExzaastJSF4NTroh1WodlgyubYoyZp
         0FSal4ZG6nGtG4QJqYn7TFy6t+Rcgn7SYcFYLyTwcIP078AZsw9MhNl08k7jhAC56JQV
         7NAdVsvNwv7efb0E5uVFY3oScZU2BJToqDnDaCF5BPpbs0eCWN6/Xbc7aMJczSaao+oR
         DaVQ==
X-Gm-Message-State: AOAM532nfm1pMnnOyjEZRqAVFnfZ0euE+ur2fqyRKepj2kpJLuhWBJzL
	Cvky1NTKulSaABpc0/TsmWQ=
X-Google-Smtp-Source: ABdhPJy1kMJQjq+p1/B4ftGxh/anXcMCVum+HWveIflBRZ/XyJYnvfJUUJC/wha8NQNqVjs1e1GVZw==
X-Received: by 2002:a63:dc44:: with SMTP id f4mr3899825pgj.442.1590582252069;
        Wed, 27 May 2020 05:24:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:8e4e:: with SMTP id d14ls1536805pfr.0.gmail; Wed, 27 May
 2020 05:24:11 -0700 (PDT)
X-Received: by 2002:a62:ed02:: with SMTP id u2mr3823576pfh.60.1590582251167;
        Wed, 27 May 2020 05:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590582251; cv=none;
        d=google.com; s=arc-20160816;
        b=EIv3tZYGOxX5XjNqPlQ6/Kwb5V47af1LeoqoL8OQo6X+UmnMsYFu4jhHlys85N5zzv
         JKCBeZFZzzJzKhA7EXc2EPa7/HMVvuKa6q5bX7ZaMVNqKYHapiwPCxtxV8Lrb4y1olJX
         3XanDuqIxm90C3/EkW/gkWeTwdGmVRsxjlM7AwwOFeLyewH2r8vOGthXB8zMIckZIZLT
         16INUFDT31qrEcfRi7xTEZ+c6nPjgKxjTmHDm9oXk/FnWlM0Cc10kW9XrwAt2H0ACZy+
         QhBZHm+q2kjKP2kOXOoXv954wm3lDjDOGfO2Mh4WGaZHz0AHkdMc/0ZCo9tzA9m0MtZy
         8IXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XRvutV/9r9W6B/xSUvcq56fFRALk8JVSFfvyGP/w+m8=;
        b=GpWNFi26HWNJSaPWBbF3X7JW5HpZN7mj4S1o7DeboGtmsbcjbIkbIPmvuFZDSddfZD
         EuNFTGCuSg+ORnCBYqKdCpmqaEfx6+kuSdR5rZfwMM9vuRYopsO43rUJ0pLm1N0MxIDX
         yg83vnBoPaggPSF0NCGBLc4zwGwHY6jTSsKFj0GT9WofKwiouI4WXxiR6rGHD4O3+XXJ
         UYG6V1HvNE39xsf7XPHgvLaoZCcLQnQy7wqamCBrvdGIFU88GDSsDJgUVbttEw4h5Jwy
         bFgQ76uaW+K2fECwXz/Z9f1EvVB+nncS426xJ4OmCWfiJNLLFzX5kJyWqJ7YwiyHXCEZ
         +tXg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WH1VIcJ+;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id c15si156759pjv.1.2020.05.27.05.24.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 05:24:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RCOAGu026083;
	Wed, 27 May 2020 07:24:10 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCOAfY063936;
	Wed, 27 May 2020 07:24:10 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 07:24:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 07:24:09 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCNxM5076356;
	Wed, 27 May 2020 07:24:08 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v1 5/5] configs: arm64: k3-j721e-evm: Fix failure with PCIe
Date: Wed, 27 May 2020 17:53:58 +0530
Message-ID: <20200527122358.14723-6-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527122358.14723-1-nikhil.nd@ti.com>
References: <20200527122358.14723-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=WH1VIcJ+;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
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

PCI kernel framework requires that all the instances in the
device tree either specify the PCIe domain or none does.

Currently, Jailhouse dynamic overlay describes the PCI domain
which causes problems because root cell DTS does not describe
this.

Fix this by not specifying the domain in root cell config.
Also, fix the size of the PCI target region to match with the
correct description in TRM.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 578caf02..dbf0ca7c 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -44,7 +44,7 @@ struct {
 			.pci_mmconfig_base = 0x76000000,
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
-			.pci_domain = 3,
+			.pci_domain = -1,
 			.arm = {
 				.gic_version = 3,
 				.gicd_base = 0x01800000,
@@ -173,7 +173,7 @@ struct {
 		/* PCIe Core */ {
 			.phys_start = 0x0d000000,
 			.virt_start = 0x0d000000,
-			.size = 0x01000000,
+			.size = 0x02000000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
@@ -398,7 +398,6 @@ struct {
 	.pci_devices = {
 		/* 0003:00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 3,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200527122358.14723-6-nikhil.nd%40ti.com.
