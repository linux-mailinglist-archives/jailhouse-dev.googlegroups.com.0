Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKU6T2CQMGQETK7E4CY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B2C38C52F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:44:58 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id w8-20020a05651c1028b02900f6e4f47184sf4936562ljm.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:44:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593898; cv=pass;
        d=google.com; s=arc-20160816;
        b=f00Dbf+soebr3i4DN7NIPYw2iQf2OAttXaw429uIZC9nRZblL/CxnBAQshyfftm7j+
         q/T8Q+jF4FyIu7HL8gJhi+ZIZ4klUwcYWHvXVSDZ8pg6M+RflnrEXCGwLcb5HBpr6Ixm
         K0o+EufhE26ZIJMQROHNV8VGxPYzLOlbldNt+qvaLWUgTsRI8xPRGUTQDcXnD0ddpn23
         B0YLFzx3c1P5AjOb5cQIGof69ZvOIMCRZ5NNq053YUfWe9DdMKAPWhd+oM+wHrsQI/QB
         gkiUjE3NoH4MWjVpkXJCSjMfyGc8nEUnfN/ng+kRKXSI4k1tQqEzYhmxOFYBRs1rXTPH
         FyKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=34qp9nOgkElWUc/xoZk4hPVmD8myzwKt+jkeidrvfNU=;
        b=bgMLvuZZwGeQJfdzKPL1uRagpyebEvSZOhCseNIlPAL8WLVIoyAf/5kNAEKZx8YjKw
         U7aVkO/wkgcPgB6JcgrW7GE1HGPMeR4Iqm9G/QKTDikM2p2rBLwDS24s3VGXDx1S4Sur
         9ppSi5frC6jh41rNdQDv19LUs5slr+igQzUqGOZ2trD8ioHx3IiLAvkvqh9yHDBzvJQ0
         /aWNNos+hYFPpOT9YNqlPx4nDkhG5q92SQ0lI+X8ECT4Zr0ssx21BKVCfuvBJ0RxbfB4
         l5tbmFCNrjxYF6TtP6t0WmAEzThJepuTC6eMPjTGajG7MNUdggqqvYhLavQQ1NyrhzBW
         KTeA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=34qp9nOgkElWUc/xoZk4hPVmD8myzwKt+jkeidrvfNU=;
        b=rzr+BpnxnT7NW6pdmVNYJyxQrSwUJjL0R3lu+AIb3WqQPGNCJCMuboZCnQczCpZzsk
         08K/LgsJ78abc7nOGSYm+QhZCS9+ci/R5Yb87TgKRgsV/zaKb6bObF8DBzD6BX0xrbzm
         eoORcd+/tQHH71JyxCl9ancZgHt4FsjNLNbHzKKqBm8V1blm7jNRsCGijtcfLpqCPfJ4
         YfXqM5pKqNFo5etFgy367+4lvYOpDleE7vMI44KRqOPMu1IBmvk8XSc/wHvFTVRhixIQ
         j8yKwADtod59wfStICjkAknl8aMVv6f9n0SZ6lAn9kO5Lc+cyC+uwWy886VZEoNxvmm/
         fqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=34qp9nOgkElWUc/xoZk4hPVmD8myzwKt+jkeidrvfNU=;
        b=Vb1fMANeeJiQFLg+H8i89eikOgViwumDXjqcP/1Fx2hPGZrHO+QnHOh8dHtd9EgHbL
         4Ll2VqCk4icZAqwEJb/BZshtt2td/sptXYCZG6GQB2cEh55NEfzePxMUGvVJY1MxsIEU
         0t/qIGl+nwpiuDS5kgTNCfcNpFTFXZN0bjT7lNLaahFKs0RsWY12nCoZCm8rN6Cnqq/Y
         HLnahSUr9EDiGJBKJgPIMTkULdhsYPV3MetoJjywkYWPRJ4ge1qPV1thh3UKErCY8nUD
         0F76NvaZWd4HO/LXHxhM70hB/2jKt8MUINJaFWxvpsMBP7AcfLyT/N+sJ1PV5/zXxL5p
         7wHA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5328V1xZP+vzO6TLibYmQvOCG/Ob9G5kV6p1b80mLrKeUVam8FIm
	sjPvNhX7cITU3kpViWtFR8k=
X-Google-Smtp-Source: ABdhPJx1YK0Z4QidRPr2sX3L5JUew1fbzroqwNx6mfjJjoYibQEnLTkz2kTzPo0SYxsr5I7vGiZUJQ==
X-Received: by 2002:ac2:4470:: with SMTP id y16mr1899235lfl.266.1621593898364;
        Fri, 21 May 2021 03:44:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:230f:: with SMTP id o15ls335292lfu.1.gmail; Fri, 21
 May 2021 03:44:57 -0700 (PDT)
X-Received: by 2002:ac2:4199:: with SMTP id z25mr1788674lfh.444.1621593897131;
        Fri, 21 May 2021 03:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593897; cv=none;
        d=google.com; s=arc-20160816;
        b=si3+QuxKBUQLf3aCY6r0hRGQZ9bHY1UHlxW1oQcataeFTQzgZHULS6Ma2GidvUG1z2
         R2+LVmFTk3CZth8CkiKTyc2hRWJ9kz1YtdZ3Y8Aintva/lHc3Jh2HtVbYwKdHZM1enQD
         qMUgGGDhEjd7hXzziIDQS++luEX2/suWaL8S2bC9peY2I255N4rE0AkUivRb79y/sT+O
         acxGpl7G4rVWINkvU/pQIJMkPW9BiqFCsSsPyVWJrwNAx18BRWjs0kYo4yyb+PwO2u75
         3e8b6C7/T6r7Suqzp0mD/5inBVJClq2ffENVg5Wvkw+8/6ckiOwM5O/puo9HVQDIfZ2K
         3FxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=+QzTTRIVyKXHJ8ubN9HZwtXiOqic4tL6qEHBm+X8wLc=;
        b=kN+StyXJ33hsryVNyh7WQLjn6r0xYrHB+AlIvctprRYeIA7FVJyPQE39Wq3QPXTqnQ
         tYSW3w1HBRX3aZeA58XhkbXJOGSemXmO7/WeSgwYzwCs7LSjpqa65/AG1fRQUzn2VvPb
         dzjEXKU5mtzt6fhEvWwN8YfWRS4N4O0JEHSbAr4KdK1jzDtq2vkSzZZnRqT17o3Pu1sK
         XSnocqOlLN+QA2OB9CyU5qLSnL5/ex+UKoKGY2AAAqAvJWWJLIOp9Ib1kkVS/NTnQQHH
         D+tpifHDHhZ7KaFpOEAJ+3HZmrTy+LC5jNadjj4MSV72Jxt86MY+2NjSKbpoOpip/It7
         mwCQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id q8si349680ljg.4.2021.05.21.03.44.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:44:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAiudM024459
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:44:56 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcE032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:37 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 09/22] xradio: Update source and firmware
Date: Fri, 21 May 2021 12:37:21 +0200
Message-Id: <f966713c75604074eedd001537d71de81ce2472e.1621593454.git.jan.kiszka@siemens.com>
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

This will be needed for switching to kernel 5.10.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-kernel/xradio/xradio.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/xradio/xradio.bb b/recipes-kernel/xradio/xradio.bb
index e3f3d06..23d9526 100644
--- a/recipes-kernel/xradio/xradio.bb
+++ b/recipes-kernel/xradio/xradio.bb
@@ -11,15 +11,15 @@
 
 require recipes-kernel/linux-module/module.inc
 
-FW_URL = "https://github.com/armbian/firmware/blob/7172b4b6608b131cbd6c60253c78a231993beed8/xr819"
+FW_URL = "https://github.com/armbian/firmware/blob/aff348fa9eef0fcc97d4f2bb7304f0862baffc20/xr819"
 
 SRC_URI += " \
     git://github.com/fifteenhex/xradio \
     ${FW_URL}/boot_xr819.bin?raw=true;downloadfilename=boot_xr819.bin;sha256sum=6583350b3eb12f70fc6d6081426717bd0019b55c6558ffe820c1548f0702bb8c \
-    ${FW_URL}/fw_xr819.bin?raw=true;downloadfilename=fw_xr819.bin;sha256sum=4954ceb85807959c42e82c432109455bd9eabe95971402299a16d77ddd7d79f5 \
+    ${FW_URL}/fw_xr819.bin?raw=true;downloadfilename=fw_xr819.bin;sha256sum=fb81436ad7cc0876614a2a9c2a54c5a93a75315aee164e3a3afe3db80842a9e1 \
     ${FW_URL}/sdd_xr819.bin?raw=true;downloadfilename=sdd_xr819.bin;sha256sum=84d3fb3ca8e5d25a0c113a5063bccbeb5b53da230a0afa236b5b625f37db5161 \
     file://debian/xradio.install"
-SRCREV = "502489a9389ac7118401dc7271c56d128376e191"
+SRCREV = "6bf0e2e21c80456e2a3d4ad1267caecde7165871"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f966713c75604074eedd001537d71de81ce2472e.1621593454.git.jan.kiszka%40siemens.com.
