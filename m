Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJHGTPUQKGQET3LSSLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CB865328
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 10:28:21 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id j22sf1286378ljb.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 01:28:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562833701; cv=pass;
        d=google.com; s=arc-20160816;
        b=nGfOHTGWT9ddC3RlhR+GnQrasMH09lohnYpSMcIIGYGCMeZxmHrTYdzjLysJhtDZ5g
         yuECDARuokNe6BBkoIqFCIKZBJ47ihoGOMrXWVcuw4Tmy9nIkjnDT9JZrMl7Tv/Ax4sy
         8CEdlrztNNodzLqCpA1j1NTuNWXoawbWGfgNB9Kv+oYUAgJ2hrgutLD3ysu/M9UXg/F2
         fD8oNQ0djxNwnjHSoMVpaIbHOVmg0/pXyi12brElOOo366eXZ4QTaZbOI8HdH00qxNTn
         mKWB1gEK2Je7vZTTIJWMKuhoYy332HoHsw7VJaJjPNpMbld1MurfEB1bw+HP2Hx+Lo6B
         pyGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=sW/gghen4Csj6ckbyvT77LIfOcR+1r5DuqjKePrwVBc=;
        b=Z4fIeZEx//6t1OEJdjadJpP44PH+9Gpy3AwJEjmGT+GcfXtLCJxxKme1zp2alqI11h
         CfxIRP9qwvZIY/QkMe2ZEqMKswH8fuTWDN5a8mCbcKXyoyR+9zFWSaTkhXHRgK0xKtDF
         lsqdozSPuX5runYworpjjT0yIn4+oX8GHl5nyCzHNQ9WfTbBWmoPNuS4CYRkfE9D/ntC
         8ohUnZTuFTuHfg71w3VE6YRXR7TcoTHhk+e8iXxWk4ABd+EsbtlQ7PVWB2KVcEEmkJ49
         HuhZYVdGs34vWoHDU/6UgYlBF2496BQpBIMdavTyixSKl7oSM6mR+xj1cxyeVUq1W/DM
         Uswg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=sW/gghen4Csj6ckbyvT77LIfOcR+1r5DuqjKePrwVBc=;
        b=VtbUyf6aHBRVo2VY9uysSVH5CYXJtXP6AeQxcrAPxZIhR8u9XHJabbzxXqVJVCk7N5
         cc4k3Dzsjw2NSnMVklZpSKKsXzrY8HMmJi+wmlwYeVtN1pPsqpVV8f8TdJeqbDogZvmF
         OBnEPUwaTMjq5FTv7IL7Q3iv+bnunrlIp1Bo6QSllMeBtmcZS3mTlnFI/2BFhLCWi2oF
         MZJYq04w+M24+Bxaxg6FodbMMjxf5npYiwxoPqNF2aal5I0EWUXaioMSa42MusgttkNQ
         1YxL4slpqKrz0Z8IaEJ6S+JuMojeTKMf/0FcFB3piqJbplMHTObs9UB2ctlGK+JptLa4
         zgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=sW/gghen4Csj6ckbyvT77LIfOcR+1r5DuqjKePrwVBc=;
        b=rOhjzl34elIIDQzBa4ahegu2b1e773pePbOg98APtGQdlnf2wpODvo18nNn6NkPytJ
         pKUtutN45FAM4nhRrzzkuLoG2gfdyWbCxU4x4jHvCzGR6IPVWKdyna1dQKmwi5k3i8Kt
         dLRfgo8CmWd9LQ9vaS4NeD2fGTRWDAfdxcUKuCfMrt9TFpwMZasifR7B+Y7TnGyZZ0jA
         iNF2E5AKj7p8qOUkWQVA66EZ4ItjQd/DrZVRX0sfP8WtdAOR+r+Jw5IgVyr/5PD5nQ0M
         c1fQwuTGNbOK0m0VHXShrqZl4wbTnQ20mzP8lqqAAs6XkoUV9Onfri9yGFrSobTWXDTv
         MBsg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVW/OgdGGPap8zD1wKZNgtDKFyzV45idGc41B9QhajSHFFeYSgq
	bD8n09/wnh8B+wWJOejFbfY=
X-Google-Smtp-Source: APXvYqzGnFfEPhd3CfglgKZ3N18TaE5mN7IpfQVDa40gmL+Mh7m9czr+rnFo/BghLO/V3EI8H9tK7A==
X-Received: by 2002:ac2:41d3:: with SMTP id d19mr1167679lfi.127.1562833700963;
        Thu, 11 Jul 2019 01:28:20 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:50c2:: with SMTP id h2ls429543lfm.0.gmail; Thu, 11 Jul
 2019 01:28:20 -0700 (PDT)
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr1203781lfp.61.1562833700280;
        Thu, 11 Jul 2019 01:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562833700; cv=none;
        d=google.com; s=arc-20160816;
        b=PvL3W1QWyOuglCRekseZ7Zsjg6Qng+7rDfK82WAjBiGBEnitpp8Q0Kxf5v9zxi++Tc
         dhw12ViY5yoEfWKqS5kryn1VRp8Am0VQUVIzSjZyVqDxNcggekXMSb9QL4ANrkiab210
         Z8DGYKuAnMT+B0AbIKqax2uhZoeNuRDFnJRQauII0R6imwgTyB5kOyN+jNrgRXdT33Al
         iQHFEa6cRdQq2QRlgw1FEXtYdO5Wp5Nb7LR5/MvPE075fpJjrtufXovLcaJ4cw0zZpK0
         qsQ1xsCZBCcdcCrduHj67IdmRS41x8Ls6w+rf2X7pUd1AFb4WNCdvbCCcppGJjEC+O00
         tN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=o/+Jni5QiGFwqIiVFA0Zw1tzYGHzuk6hHnzjK2l5eI4=;
        b=V2+tAJYm7C6SvgBuLTK4OISA5EVFZTudbknyXNPbKgo0QjmK1CMAml27TB8+IpB4qk
         6c0XvxDIRbgEI6MD3xaVx8aW9sjcuyHz+iZJgl9pfkVVjtkPl9Yj/Z8QTwpUEW8tvHcC
         Nkd7sth8lwzPTjfw8AWAA6CdcVK+pXFDjSbNiNVv4LLOgVLZR9JmJHtnk92l9iB+OQ3n
         Qhc/ObHLJkDbR/Dm3GyNGlZ39PZOOodqurQNYG4gmJxN6Qw/5kvtPzNA6bo3vZgjkUeQ
         M5btXljUDw2gJFGLpzxJ+7feMjEkS/HwmBa2HA+98hZAYBR2KDF/Kd/3LInMxHjuvhcT
         HeSw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id m84si202022lje.1.2019.07.11.01.28.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 01:28:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x6B8SJ8h003018
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:19 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.22.161])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6B8SG7U010515
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:19 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 8/8] Update Isar revision
Date: Thu, 11 Jul 2019 10:28:16 +0200
Message-Id: <a993352053a1b45d55fab9c222bab67ab1099ecc.1562833696.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1562833696.git.jan.kiszka@siemens.com>
References: <cover.1562833696.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1562833696.git.jan.kiszka@siemens.com>
References: <cover.1562833696.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

This allows to drop the explicit HOST_DISTRO setting. The new Isar
version strongly suggests to add on-device ssh key generation, so do
this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/distro/jailhouse-demo.conf   | 4 +---
 kas.yml                           | 2 +-
 recipes-core/images/demo-image.bb | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/conf/distro/jailhouse-demo.conf b/conf/distro/jailhouse-demo.conf
index fe40ca6..faf2455 100644
--- a/conf/distro/jailhouse-demo.conf
+++ b/conf/distro/jailhouse-demo.conf
@@ -1,7 +1,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2018
+# Copyright (c) Siemens AG, 2018-2019
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -11,8 +11,6 @@
 
 require conf/distro/debian-stretch.conf
 
-HOST_DISTRO ?= "debian-stretch"
-
 KERNEL_NAME ?= "jailhouse"
 
 WKS_FILE = "${MACHINE}.wks"
diff --git a/kas.yml b/kas.yml
index 0c2a7a3..4ccba88 100644
--- a/kas.yml
+++ b/kas.yml
@@ -21,7 +21,7 @@ repos:
 
   isar:
     url: https://github.com/ilbers/isar
-    refspec: 59c7dd2b8b3172d53de1c7a39fbd49751193559a
+    refspec: bdf8d29eacfde381e4e17a9b953328723cd9bea0
     layers:
       meta:
 
diff --git a/recipes-core/images/demo-image.bb b/recipes-core/images/demo-image.bb
index 9917f2a..2cd09e0 100644
--- a/recipes-core/images/demo-image.bb
+++ b/recipes-core/images/demo-image.bb
@@ -22,4 +22,4 @@ IMAGE_PREINSTALL += " \
 
 IMAGE_INSTALL += "jailhouse-${KERNEL_NAME}"
 IMAGE_INSTALL += "customizations-${MACHINE} non-root-initramfs"
-IMAGE_INSTALL += "expand-on-first-boot"
+IMAGE_INSTALL += "expand-on-first-boot sshd-regen-keys"
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a993352053a1b45d55fab9c222bab67ab1099ecc.1562833696.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
