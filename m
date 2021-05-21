Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBS44T2CQMGQE77QYJQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AEB38C51A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:41:15 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id v18-20020a0564023492b029038d5ad7c8a8sf6183416edc.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:41:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593675; cv=pass;
        d=google.com; s=arc-20160816;
        b=uRHJfgsiRt+d8R1JpXlb1CqPelfCecbcwH5C1zhND00niYFIPLteb9KY0oxlJ+sWhC
         XHTqUv3KDbRXNjk5j/XfTQQ3ENvjQqavBiwyRvqhRgU5ryeaBPiYbbtcA+jGSXhHPbOk
         BwRwNP0Qe+kf6QTTlhgi8IHJB/RgFtBB0p5TMpZ1bLpoEZVqwAnM7Vonvb6ACM8oDXRk
         Pa32Ypabc/gia1MjV5oQE6IjmgQk+e7IdtnGd3nnOk4vtQfDe1vfr2fIZCQc+EtHFQoV
         P6wv+auw/wq7JSzaPZO8L4T+s6mYCgAYY4L0z62cUZJgnsJ4VMLNcDKaUyvqz6kXkoQW
         suag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=Yz/JijBF79n5pwRia3l69lb8qEbUWN2yaeiKCdY+d2A=;
        b=WrbL/iEgwWgY1rR3KmGDBTCvL2ETlNygiM33BIVf79qVWLhrOxQaK9oqcv8hSYCun4
         Oa01u+oMfTdvlNYF/QCbCD/B6vHhgon6hS7HZDeDYKJ1W3u7TsKPg4yM9RUQTAxyNnNR
         gd8HqF0yLKOwR3kSSFMvDQ2QnE64Xt9F60tZ0V8sZkbMLA3cXgy6tZSV2ksVjFtMqVB3
         HnYQaTno/5uT201cJXlZaXIryVYM8LBGzUptvjynk5i9GaQU31M0yc66uj4PiJucu2mY
         5febdJg820obeXKcTaSk8xiaMiMN59n9zaeC4pCxz/lCpZqcSIzxpTOnTgNG7JMOOORR
         FpJQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Yz/JijBF79n5pwRia3l69lb8qEbUWN2yaeiKCdY+d2A=;
        b=lCSuYrfFiuPFAUC4ZShu2k1UMEcwzal6cOrKzppnFnLeK+t81D1M9nc1ZGhDWPSBLu
         27GCmsTmbhK3jXrSm1UVFZCJzalFUCXVw4TNzlbQz5R45eIVP9djSwkRkgzFPd6QJQba
         2NzJ6oxLLslJzYNenbJsSFKaZtvWu8YMozuHBKX58TwJw0uhYoSeW5RlMP7LiWMV5TWt
         QXqfM0F+WX6XAvFkF7AKbrYwXHSGNTTc63/rLq9NrqdkhWF4ikjwnOZntpTEzGFP+tU8
         qHdc6fzkM1R6YJqje+BbGg9a8vHthEAs4jgJOH94L5GXLheBHdgShP3H0RS3tAr37/bR
         IFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Yz/JijBF79n5pwRia3l69lb8qEbUWN2yaeiKCdY+d2A=;
        b=UfggFz5me48wNj1E3Gj9E3UOMCI5eEJIG0SvhGwJBdTbwyTZfNs8fh1OLDhOzUJXZY
         AJEre/mN62pNdhxJknPp5tGpZ4onR6w78GdDxzAYA1twCy25xyGWvJ0lD3tVhfZK7BkR
         Ag9zZopylTNQCio62bsPPNI17MAUmI+IRvwfsefBiNOOTXBjAo/tnoDWzTkFj0lPeoo4
         Mz7lFl/bziK3q6eV4qJkAoEe0PckJbBy8U7KGpf5NaW08GQ2f+8IOsvLjN2SKEXWvTl7
         tCLZo2uMlO+JSGluzOXoYtg5rXKIxSOvHfvfNBFQa1ZEkQuC/Fz9/x3WdV1NJuns5k/p
         6A9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532fs3m5Rp8Gpc/idLLH+qWAw8mzgVC2cTCWy9CtJvI2qzBqGeLt
	fM4K2fiVjUZ2adpPWnWKPdU=
X-Google-Smtp-Source: ABdhPJwZ+cWOy0WG4QnTfeMFKCuabw6ZSWOrT6fZUUXl54IZnLVCcJHnRTRAcyrEG70oQVrPu7qGGg==
X-Received: by 2002:a17:906:7c4b:: with SMTP id g11mr9581732ejp.461.1621593675517;
        Fri, 21 May 2021 03:41:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1293:: with SMTP id k19ls51294ejb.9.gmail; Fri, 21
 May 2021 03:41:14 -0700 (PDT)
X-Received: by 2002:a17:906:31c6:: with SMTP id f6mr9624952ejf.446.1621593674509;
        Fri, 21 May 2021 03:41:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593674; cv=none;
        d=google.com; s=arc-20160816;
        b=ilrTyDQLkmCQFhSdNz5xeMrF3ZqKlGnc3eJRKi9acFwloWJl2sCLkPKMdNILQNVPkb
         gbnVBByllg7DOhVDPGEZW10rtqNOTbbKLHgxfTyT28AYThqNznsA9U5Ogt+3z3WPktc8
         qnIPseDTzyKQtOn4181PV8xnA9Qhdwo4hGq+O3rVyURfmZy2EcXltYGUOONd3anVeEGd
         DGi3TFqC0Xi8zDjO8Lv1lbLieIPQcSlpetlEUZ2eihNGFuRa2qz0FCPKpl3m/9gBtSh1
         JcnGutjVLAFK37AghvvViykLHC8Q57WwmoZeTajj9tCFLuqu5Wgoix5yXI/qS1Cucxt0
         SFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=PejFWhaEFreKWXpINmzBPs78tIeOFD37pYa7KP5GlX8=;
        b=Ng1rnWA0tPufe48coMhQpdo5dqFkWAiJgFS6kbtCL2Kr088JmTIlLoFzbySCvKdb1/
         V+LIzktd4A6AzcXqjEbJyF59MgpGkq7gvoPjsw/lBzfNo/kbZ2XtVSK+vN8cifQbIWKp
         MZwKIWAZ20K8WQHOUyKuw7EEZ8aCmrzF7FwHS+X6BeOpqlciu3VxmjbmREvGqn04LX1p
         PtFvJLiKJpBcwzJhNMbG2KLfOpjkaeMglFIxw+j5DwsIL7R08Lk0bnFO9ElUph63vPe1
         xmTMQzlAgWB5CYorsJtYGv/+914KrwYXaqqs2TcNTTNgDyVrmjqXnG7hfQVZDvBTSU1t
         kT9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id r21si429331ejo.0.2021.05.21.03.41.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:41:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAfDrQ021677
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:41:14 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYc9032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:36 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 04/22] jailhouse: Enforce selection of latest version
Date: Fri, 21 May 2021 12:37:16 +0200
Message-Id: <64c102a9df6f713170129ac0e8f7c94927a8592e.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

Moving forward to kernel 5.10 would require so many backports to the
0.12 release that it is better to temporarily switch into "latest-only"
mode. This will be reverted once some 0.13 release is available.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/distro/jailhouse-demo.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/distro/jailhouse-demo.conf b/conf/distro/jailhouse-demo.conf
index 032efe3..5b0fb54 100644
--- a/conf/distro/jailhouse-demo.conf
+++ b/conf/distro/jailhouse-demo.conf
@@ -17,7 +17,7 @@ KERNEL_NAME ?= "jailhouse"
 
 WKS_FILE ?= "${MACHINE}.wks"
 
-PREFERRED_VERSION_jailhouse-${KERNEL_NAME} ?= "0.12"
+PREFERRED_VERSION_jailhouse-${KERNEL_NAME} ?= "0.9999-next"
 
 PREFERRED_PROVIDER_trusted-firmware-a-${MACHINE} ?= "trusted-firmware-a-${MACHINE}"
 PREFERRED_PROVIDER_u-boot-${MACHINE} ?= "u-boot-${MACHINE}"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/64c102a9df6f713170129ac0e8f7c94927a8592e.1621593454.git.jan.kiszka%40siemens.com.
