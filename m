Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVMG5LYQKGQEDV64SYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E96A1527D3
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Feb 2020 09:56:54 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id c6sf834288wrm.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Feb 2020 00:56:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580893014; cv=pass;
        d=google.com; s=arc-20160816;
        b=yF1adQ6kyaLTeahwCd7PWSlEfX34NYa9NT4rZrrbebXicpR5su7mmaIB5xZ/2w0cTC
         j0yKfbPryQXDZDnmjFwbaUhnR05m8BkWcFeMtlmH5upZfKvrOO8FZR2CVYV6aQVnfvKy
         spHwOXo/e44hgs1Pjaci+W3UwJYCDi34l4XJ/uxZjgBEqffnxirZfBmMMrEgU4lGOD5H
         vyrE9Vd9EV6qdYYwefqs/0S0vYOh3rpPZMSiUUtDHSAgkxcNWuWxp31ceJdQ1q0FZsPA
         IODa9sLMq3/EY+NR0QFbIUOpJSJoAk8qt/PGEEdF5KihDQMZHphDPb7iBWYaENTr6Iv0
         gCfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=yp4XXXFv5qAOWU2g82o+UbtqH3EtaV1zFQ4FKKeKc5U=;
        b=fV70PrNdIvSWk/STI1+bjRK+Qu90O79+mMh6DchsN4LwEO8xB8TTij8v3XUCHAM3BO
         9pavZbWZoyHyHXi+kCqHYpNpWfaTa7GsX7Bi70IGfYQkYayr0wV5+psMQPwWMbov9lWt
         b5/d08aMcN4lEGJUBgfo/P20pKPlCvjGGd806wUk+w7vCYbsbCmQv6lLKhxbQ0kmQrvp
         dFn5B1rKEYBdcxcpJPHQdo40J9/H7Jr/dEvpZlb8bSVeow2PFReS0CxeSxMYJmUuZDmU
         1bCxFu7Znnr/2+pYDWgRGbA5bm0GXA2bRRmTp5ZxoBYaYdvVBSOmhSf8fAxA4yNvBRpn
         v6bA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yp4XXXFv5qAOWU2g82o+UbtqH3EtaV1zFQ4FKKeKc5U=;
        b=XrhPVWZkSGapyKgcNr5sUjYjX3lss2SFV4YFdotN5VOKG54E/MYFF+Qu9e6cNYVtx5
         fw9xPVXQO+DLiHk89D8jiNE/YBj8jqLOPkAkweg1PPtxvnT8w1EL0V2mm3cGu0vQvG2t
         bgms/FH9ojUI7BQDMKQJe+4ySjMGJ9rkI70zxJP6JBs7BjEXXaalVVUMlXWf09oGfX28
         sMvy6anjZjDeeKMCK3Gmp0x9pq1r9g/vi95gFKsMOwq56gHVGZVQ+lcl7lQevXpZvirf
         pe0r92PE3Jm4/+3iKH/xNmq/ddfKnjClkO6qZKYTXP2a47FUJmgVVfHhsbZ8Dy/W5lak
         T+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yp4XXXFv5qAOWU2g82o+UbtqH3EtaV1zFQ4FKKeKc5U=;
        b=acw/vex8C7OoVi0nlTlwiy60OIK1M79tW/r49LsmyNrRtHZ65X/fKPtdbhWoOwlngI
         VshYEFzCf6ZLdMr0S7jmSsyFDCk/eBIm4wD9d8MQ3jVu2iYcicEpAm92Wf/xpsE5aBqj
         RSUDAFgeEGlzmuAWDxD2BHUKhKr35EiPfTZlVAuzB/mC7RtQ59X3LpKcZLqZBofHKFY5
         cHW5ri81Tl5VYhZuNtbBvdiWg2qA/aGFy6MSwgu7o2bWbJvLin+cIx+TuSKuBMPYgH7V
         463ergbxAFAnbTN/B/dV5kQrM5H7DHZHPWiIOqrvEGsbDApfZCyQvo4kgxCCumPDBox1
         4fPQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVoKjFY+bEcUQmeS5KAVYsYYekQtywrF/RNLe0zCEWZtjnrRjFy
	2xXfH6qaq/T9zBwvxyactKU=
X-Google-Smtp-Source: APXvYqwBFtADLilN3Js4vHa0EhNVvppe0H0eXrD3e7hD3LZQNRlmm0pDORt1Lk90DtzO1/jT638iIA==
X-Received: by 2002:a1c:f003:: with SMTP id a3mr4610156wmb.41.1580893013943;
        Wed, 05 Feb 2020 00:56:53 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82aa:: with SMTP id 39ls521169wrc.3.gmail; Wed, 05 Feb
 2020 00:56:53 -0800 (PST)
X-Received: by 2002:a5d:5305:: with SMTP id e5mr27603831wrv.18.1580893013294;
        Wed, 05 Feb 2020 00:56:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580893013; cv=none;
        d=google.com; s=arc-20160816;
        b=MwZP3KwoHcbqqECdhTKCKOYDbKla3LjDuh5iTIPNbus7JHCethFuEdF963oTxFEK1D
         hd4/uuMy4R8TdRRNCIWBdv3tqeeALAzWdby2B3bksQ8RiYr1DsAKY84G32/I1ftn5Odz
         R93Ky4VWp8JHJuQNMgs13vPeqfipJ2SV++58CRMVf7ShTZkdFFt9cuU4oK5tIZHTCBf3
         1+V4ITBna8ayqK4NwX1DrjRYX3rUqYjtzlBoIq/dP4+Ad17qLUEwES4u02N6OzZMeFMr
         EDVukDQ7PkDgurbyNk6agSUeieBKkni64JIH40U9thq/ZqrtxVoF2SMe+pWBaPQOZoUV
         +2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=P/UpwHfw3gFnCvSX1J6zjUvZVRSa8NymV/0stRMgamc=;
        b=0AyILDUxy1zCop2g9ER8UYytc8+T3iB8aew1XaArl7f4bYOKxcAah/x1r1Eev9xI2p
         S+N/XYlYz33thWtRT7KbsdipyoDvQ9fjiOkaJqlOflNtG/vQswxZazFftK4PMTNfYXGi
         JLLFTGhnGDXaw2ZaCGYOMIZpQmoCXv11JQZ2pN1Y8gg4zUoqIfyN49TfBKv+91IunOtH
         5XaMpMHccYcFOHlWQgTvEU/gsMV7f9iEZM2pmzIdb/1Pl7MHtydEw1oL6MH3YLw4ItR1
         N0x9X2P5vlMA7uUZ1+500v09Mv4Tx72rTR4pcrLXfhVoNeqCk9madY4EC5vNWBJZbI+x
         F52w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id p23si264812wma.1.2020.02.05.00.56.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Feb 2020 00:56:53 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0158uqlN013048
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 09:56:53 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.54.219])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 0158up0n006156
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 09:56:53 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 3/7] linux-jailhouse: Update to 5.4.17[-rt9] and rpi/5.4.16
Date: Wed,  5 Feb 2020 09:56:47 +0100
Message-Id: <bbc071447c57e8859a3a7a9ca8b357105ca828b6.1580893011.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1580893010.git.jan.kiszka@siemens.com>
References: <cover.1580893010.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1580893010.git.jan.kiszka@siemens.com>
References: <cover.1580893010.git.jan.kiszka@siemens.com>
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

Note that the RPi tree is rebasing, therefore also our jailhouse branch
for it. IOW, the previous RPi revision might have been broken
meanwhile. We will have to look into how to deal with that mess in the
future, possibly by not updating RPi at all.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../{linux-jailhouse-rpi_5.4.8.bb => linux-jailhouse-rpi_5.4.16.bb} | 4 ++--
 ...x-jailhouse-rt_5.4.5-rt3.bb => linux-jailhouse-rt_5.4.17-rt9.bb} | 4 ++--
 .../linux/{linux-jailhouse_5.4.7.bb => linux-jailhouse_5.4.17.bb}   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename recipes-kernel/linux/{linux-jailhouse-rpi_5.4.8.bb => linux-jailhouse-rpi_5.4.16.bb} (62%)
 rename recipes-kernel/linux/{linux-jailhouse-rt_5.4.5-rt3.bb => linux-jailhouse-rt_5.4.17-rt9.bb} (65%)
 rename recipes-kernel/linux/{linux-jailhouse_5.4.7.bb => linux-jailhouse_5.4.17.bb} (52%)

diff --git a/recipes-kernel/linux/linux-jailhouse-rpi_5.4.8.bb b/recipes-kernel/linux/linux-jailhouse-rpi_5.4.16.bb
similarity index 62%
rename from recipes-kernel/linux/linux-jailhouse-rpi_5.4.8.bb
rename to recipes-kernel/linux/linux-jailhouse-rpi_5.4.16.bb
index 3f49a31..44f0201 100644
--- a/recipes-kernel/linux/linux-jailhouse-rpi_5.4.8.bb
+++ b/recipes-kernel/linux/linux-jailhouse-rpi_5.4.16.bb
@@ -11,5 +11,5 @@
 
 require recipes-kernel/linux/linux-jailhouse_5.4.inc
 
-SRC_URI[sha256sum] = "cbec40dc889127df018fa41c7c39db8fab7728dd82cc04fe8336b2ed6c0e2bed"
-SRCREV = "b4a6c797cb8f2e60dea711dc1bd12acdd88e6eeb"
+SRC_URI[sha256sum] = "53de4d966d6072302fdc87ddce3ec94a22132638bcb8bf2c0944e0159d8db611"
+SRCREV = "e569bd2d6d2d7b958973bb8c6e9db9cfc05c790b"
diff --git a/recipes-kernel/linux/linux-jailhouse-rt_5.4.5-rt3.bb b/recipes-kernel/linux/linux-jailhouse-rt_5.4.17-rt9.bb
similarity index 65%
rename from recipes-kernel/linux/linux-jailhouse-rt_5.4.5-rt3.bb
rename to recipes-kernel/linux/linux-jailhouse-rt_5.4.17-rt9.bb
index 995fe7e..13ad237 100644
--- a/recipes-kernel/linux/linux-jailhouse-rt_5.4.5-rt3.bb
+++ b/recipes-kernel/linux/linux-jailhouse-rt_5.4.17-rt9.bb
@@ -13,5 +13,5 @@ require recipes-kernel/linux/linux-jailhouse_5.4.inc
 
 SRC_URI += "file://preempt-rt.cfg"
 
-SRC_URI[sha256sum] = "5714bd79562a43c17aa869a6dac40a19ac3965a3c1151aa4d0f66993eb69ae9d"
-SRCREV = "f8a16c29b76d12da917f14bbbbf97b862346e91e"
+SRC_URI[sha256sum] = "49ee37658114f123390e5c2b00bf177aa110e77ebfd62325a3267e29f34ec873"
+SRCREV = "83e85c7a8e18f1d72e5c78952a853b656def48b6"
diff --git a/recipes-kernel/linux/linux-jailhouse_5.4.7.bb b/recipes-kernel/linux/linux-jailhouse_5.4.17.bb
similarity index 52%
rename from recipes-kernel/linux/linux-jailhouse_5.4.7.bb
rename to recipes-kernel/linux/linux-jailhouse_5.4.17.bb
index bf1e3f0..e0d685c 100644
--- a/recipes-kernel/linux/linux-jailhouse_5.4.7.bb
+++ b/recipes-kernel/linux/linux-jailhouse_5.4.17.bb
@@ -1,7 +1,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2018
+# Copyright (c) Siemens AG, 2018-2020
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -11,5 +11,5 @@
 
 require recipes-kernel/linux/linux-jailhouse_5.4.inc
 
-SRC_URI[sha256sum] = "c2a9e69f32c017c4d32d7f87d3221232fc9053e8fd94f7e25e8e6867f9be2dd0"
-SRCREV = "9caa6a8cab0d7f46475990aaeb7dcc7721547ef0"
+SRC_URI[sha256sum] = "55cbeb4ba845f191006c4cd1611c13fbbc7b7248efeee374165d76306204d648"
+SRCREV = "6d9ce684e169f54e4cdf19f4e785600cac603fd8"
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bbc071447c57e8859a3a7a9ca8b357105ca828b6.1580893011.git.jan.kiszka%40siemens.com.
