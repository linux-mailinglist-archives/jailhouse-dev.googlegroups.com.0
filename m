Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIEO373AKGQES7QBZ7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 733951ED3C6
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jun 2020 17:52:01 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id t12sf330754ljd.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 08:52:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591199521; cv=pass;
        d=google.com; s=arc-20160816;
        b=o5htVAtWeNukvr7N505GMStPOUIw9yrDu+NLmW33FDeTT+se9+GmWNjnir9/QhHfqd
         8gsiidTDqEFRIFa0YQMYa5vfknC5xuXrFk867OASO29vGFm2lK0DHDVm79mKw32RtQbE
         IKX4iMTluppOQD4PiX9JkboVLfkfaah+MInzl9A4+RThM5xw0EmDKQECccbYG1RxJ+gH
         PPuR+cRIFP9eAioR0wHjMofKLBVthC1IWBbEI6EJTadIXTEHCTMrcSd05iV/QWxbvZrU
         4KDMPp4UBG4F+UNt+GaPYthhqOlW94hB96kzodYNizxDDQbfwqac/rEpmC5/m0mgJ3hX
         mLWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=8G1HoOkYaHHYq09OnS4XtJI0bwUoQwredxemJxRYSgI=;
        b=cqiz3losfSCKdTcYVzqQfITIXvmCbAGwQdpKo0kXvzHkImFHWOVOvKNcq2vKhLVvT8
         PVrSlF04bIQdI2acR5LP2kDq1HiQYNxG5n68n3i9h877+B9MoBnNcSD3mMpjB7/neO5U
         rAFqf0oqBHbziDhUq+zEloRO3+b3+48qGKfaeMupqkisY9jABdkyx2VlXNB5fKso2v3X
         O2Ed3KMkl3T9Hc3K8VajtZXqzCw+y1MQ2G8MfIZYdqkmEa12a+pldVGGs5Hvlh5WjYZ2
         dQUUldZPTYRXYp2Y10+sf0atZ5/Kc/Kl1XNsWI0yHdTPkDN+0pVK9sn5ocqzk87bXX1v
         HoMg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8G1HoOkYaHHYq09OnS4XtJI0bwUoQwredxemJxRYSgI=;
        b=JYmQ0yVJDB3S18r3rcG68NCoPCy+moHLxUHzuHNWSBnD16qBDVERKsM6AEVu1hAZSM
         zbejyGW1sJnXZZlRzcgvDLYvzC6BGwo7THa0aNTIcgVyliM1CQM5fxLPkplgu3GVGrJk
         0Aj8mOtSw7d5EqxKEK6QAdq02M+TMvQRtpKnGcj74l4XFepDYn0OqIRVG9lw5Ji4bpp5
         wiap7Nsulspf208yP1A1y5YekGnQQPbzU217ydtTNDfsI4keVFhoYBUi4Adtf2QcHBsn
         8x95cpR7fodYZirIJDdtbAfg/PAn2D/ORAwuHGoi/gKZPRFTsEmrqugewgfnAVvSvvmE
         oNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8G1HoOkYaHHYq09OnS4XtJI0bwUoQwredxemJxRYSgI=;
        b=KMiJeETmd76mlKBXeYR9ITkA/5M+X478RaOtKGv/O2mYpAwEB1/lHkkVVTOJgn78dH
         FJJWnY0M+apkvAT9hQqZ3sDcEhhB1X6FIYqVIxqrdR2nOvJirSnvJuL9Yh8eyWDSPCss
         aBS5YpGNRmttoeqtuPPte3KeL1zQDSU/eUGt8Hl1Fc4/coWdW4WhaBbWHr7toGZHRsFk
         5RECWwm7rTN6BGpmOWkCAgM06QlDkVGWiEtdKzc8W5S6wIvHmFXdZHOusUoCKcInRGk9
         AXbebItdEmZzqzdGewW8aG8KgPKq7g6+TQvv1y0PC7yP+RF+IKAAqOIjQu6ODggnMn8e
         tNZg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5335RHgLa2MN1Nwv0KYGe7spnNHWnHPrYCpdz+PQmi7ebZHvSrFo
	id25rbvVYlFh6J/YnTs7c+I=
X-Google-Smtp-Source: ABdhPJzaNEhDNOWXIifPhi+8BelnwSwfPq3+uV4eo4kTVQuZUAAw9biGnqA962BGJS07mJMZGuWepw==
X-Received: by 2002:a2e:8290:: with SMTP id y16mr2479288ljg.340.1591199520953;
        Wed, 03 Jun 2020 08:52:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4b43:: with SMTP id y64ls828954lfa.2.gmail; Wed, 03 Jun
 2020 08:52:00 -0700 (PDT)
X-Received: by 2002:a19:8b06:: with SMTP id n6mr99820lfd.66.1591199520130;
        Wed, 03 Jun 2020 08:52:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591199520; cv=none;
        d=google.com; s=arc-20160816;
        b=MIcKPsFremAy61azO7jW3GJqmTGEL0Ow9TYO502Imk16bAxz3DpLMnK8fQ801n0Rti
         D+LVHDC44BU6ZUsFyscnTsxPgL99J31w2qAkTrZJJbELj36lqidbGarwfLZKJKAApWF4
         EQDLF4kODr03IYrfsEHIeUoMSGzBKQAuaO4QgPL6LLbfQuBK8XjjSdCnpC0RySD7DrRp
         gFCb2xULC+PUR0z69ookTwSGghrlsBz7scYQFC11dm1T9cw5TvJzsb0ZPUI7F2DABjXF
         VQ7C++y/dCnirXaLI+ZlXrl0zNwejRCkRoZEJNSx8Gy7/A4ZtDvOI0yP4EbSrqlxGdMt
         ll2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=F+689NhqFS4MAWKLe+XwBkuWxVuGOzfFIiVVhAdJiq0=;
        b=x1Dwinz4rxApFLbwpTJ9C5ZRLkGp9la2mlyeO4YafjgH0+vJslBTc/wnK0rGBMC3nU
         Z9YzvTjFbaYpU1LiT0Cnqb3qlpDwSnEOEuOd37pM9azFLFBjZZqekSz7i24GQBSsDIj/
         96iE4yVZD+LvIvfZpqZ0IMYQkYwdogOeHXTahsldJlzWv38wpGIKmKH5H/Xsx7QK6mM7
         NjpDCnRAZtIavuxJK7KrFgRuLLiNHp0m8oeWjAbyNpleA3qLsS75+25nyAJVsuHmmJBz
         5gvtHj7CUpMc+DLLxZf4IEPFUUyf34Wv8Gns6xdhTG4UCX63DkdZ3ZA3yNAmP0PoVU73
         vj4w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id o23si137549lfb.4.2020.06.03.08.51.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 08:52:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 053Fpx90016308
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jun 2020 17:51:59 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.36.189])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 053FpwjU008838
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jun 2020 17:51:59 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 3/4] linux-jailhouse: Update stable kernel versions
Date: Wed,  3 Jun 2020 17:51:57 +0200
Message-Id: <1b24ea2b281a9b4edd130d377302b210095c3b16.1591199517.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591199517.git.jan.kiszka@siemens.com>
References: <cover.1591199517.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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
 ...-jailhouse-rpi_5.4.29.bb => linux-jailhouse-rpi_5.4.42.bb} | 4 ++--
 ...se-rt_5.4.28-rt19.bb => linux-jailhouse-rt_5.4.43-rt24.bb} | 4 ++--
 .../{linux-jailhouse_5.4.31.bb => linux-jailhouse_5.4.43.bb}  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename recipes-kernel/linux/{linux-jailhouse-rpi_5.4.29.bb => linux-jailhouse-rpi_5.4.42.bb} (62%)
 rename recipes-kernel/linux/{linux-jailhouse-rt_5.4.28-rt19.bb => linux-jailhouse-rt_5.4.43-rt24.bb} (65%)
 rename recipes-kernel/linux/{linux-jailhouse_5.4.31.bb => linux-jailhouse_5.4.43.bb} (62%)

diff --git a/recipes-kernel/linux/linux-jailhouse-rpi_5.4.29.bb b/recipes-kernel/linux/linux-jailhouse-rpi_5.4.42.bb
similarity index 62%
rename from recipes-kernel/linux/linux-jailhouse-rpi_5.4.29.bb
rename to recipes-kernel/linux/linux-jailhouse-rpi_5.4.42.bb
index ed157f5..32db5fd 100644
--- a/recipes-kernel/linux/linux-jailhouse-rpi_5.4.29.bb
+++ b/recipes-kernel/linux/linux-jailhouse-rpi_5.4.42.bb
@@ -11,5 +11,5 @@
 
 require recipes-kernel/linux/linux-jailhouse_5.4.inc
 
-SRC_URI[sha256sum] = "458ee382435a4b546a1caa2d0bd7b732278f352aabc427e296102529bc668233"
-SRCREV = "a584b7ff4b4b151703547ac384c2f12a6cdbc83d"
+SRC_URI[sha256sum] = "00028967b4ac4fb78380903d7ea7a952a5016a932e2c266b634f980896e423bc"
+SRCREV = "938661d5eb8740633d427810c37e83f16da8cc8b"
diff --git a/recipes-kernel/linux/linux-jailhouse-rt_5.4.28-rt19.bb b/recipes-kernel/linux/linux-jailhouse-rt_5.4.43-rt24.bb
similarity index 65%
rename from recipes-kernel/linux/linux-jailhouse-rt_5.4.28-rt19.bb
rename to recipes-kernel/linux/linux-jailhouse-rt_5.4.43-rt24.bb
index e6bfa7e..03693ae 100644
--- a/recipes-kernel/linux/linux-jailhouse-rt_5.4.28-rt19.bb
+++ b/recipes-kernel/linux/linux-jailhouse-rt_5.4.43-rt24.bb
@@ -13,5 +13,5 @@ require recipes-kernel/linux/linux-jailhouse_5.4.inc
 
 SRC_URI += "file://preempt-rt.cfg"
 
-SRC_URI[sha256sum] = "807290fdb1f17aa20201b9814d78e9256645765654bc2befb8100110a4af5f47"
-SRCREV = "e24c5d5d42ceea850df147cbe71d77600941524a"
+SRC_URI[sha256sum] = "299f777d0b253a4bbafd40ceade93f967d2bb637ed7bb4a6ed8064474fc08600"
+SRCREV = "db818a378db60497d2e14a697a486826772f5024"
diff --git a/recipes-kernel/linux/linux-jailhouse_5.4.31.bb b/recipes-kernel/linux/linux-jailhouse_5.4.43.bb
similarity index 62%
rename from recipes-kernel/linux/linux-jailhouse_5.4.31.bb
rename to recipes-kernel/linux/linux-jailhouse_5.4.43.bb
index 44acedb..5803cc9 100644
--- a/recipes-kernel/linux/linux-jailhouse_5.4.31.bb
+++ b/recipes-kernel/linux/linux-jailhouse_5.4.43.bb
@@ -11,5 +11,5 @@
 
 require recipes-kernel/linux/linux-jailhouse_5.4.inc
 
-SRC_URI[sha256sum] = "d84c78d0931d2e5c784d30d73aa63cd6b1a849f5d957d87e1a660aa1f5a4c070"
-SRCREV = "45e6cf9c5dfd149cccadaf960907bd99408a2e70"
+SRC_URI[sha256sum] = "b813375218deffe894443e905351032d58c5746a855acd446258523d767a2177"
+SRCREV = "817f74fae9af14d74e43b69f74b93635dfabb751"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1b24ea2b281a9b4edd130d377302b210095c3b16.1591199517.git.jan.kiszka%40siemens.com.
