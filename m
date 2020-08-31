Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWE2W35AKGQEWZMO3FI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E49125848A
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 01:52:57 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id j17sf2769749lfe.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 16:52:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598917977; cv=pass;
        d=google.com; s=arc-20160816;
        b=a4xWFlmiCXvNqQv7LOfiBXDOGGPGzZwJpi8m3EZqGiRHVxBY+te3BqiXdwsB2sf55S
         /3Rr3ilf4alJeelOXHwkyRwYVgOETWl6qGgFKaHfwHrO8PEGLTGxQMFnalUrtzKeCKXb
         Ta3Rv8ujnDSkfMhKsYYmYqKLL4vTedvEKDQJxwTkeDabz+iXt3E/OAhzmlptq3RhFcUE
         9jki+bJEWrc84MBXhZIOakadH8G9wVrlF2It912Ttjjs0r8mQ0jhRz8JocMmkNaqemgN
         0kpAgEE1WM5m+QXxVOyP+cQv9x8DPU3Lc+VDDBNTDXe0ViCpGl1fM8LYvBcp5hWzlX4Z
         Y3CQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=I1a9YtVBdZMU9WORyw+ke5pVftnAkjoSeSKRp+wbEwE=;
        b=XpdIAER9S5xOkvqRbZhqYSz6L93fgluXEebsKgplg5UMyUuqURkLJ5Q9nrZfo0Ox4m
         /yXfTw2fTpkS2Ip1nOuqULeMg58XmjYpBklU226Ei5UKJnKZQ2f0SqCzBdFiEjRYKDWy
         TpXc462mwM5N1DfsbSUTDDdq9oifWh4k7zWIKbgyzuCsgwvF0AAzXga8LtPcFX+OH/Wm
         2yPInsoSCWi/ddmZeKOjYCa3LS4vANRnqAEn4xS6Iy6TUxBlCkY/uZERHknOfzCx5GOA
         g9HVNG8Mh35+Ci5PstYTjOTlApT2qKHVa669Sue3mPro27LyBM6sCU/kMxAiy/np3Rkv
         qqcQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=I1a9YtVBdZMU9WORyw+ke5pVftnAkjoSeSKRp+wbEwE=;
        b=M06feEWhpLhp0A1vRR9emg7WXGp/9tRIqtlE8hsgGZFuqL+BxLO5FdOjZgW8/W5bsw
         T0ITqhWMJP5elo1ow8cU36a4MXu3FI1bY4ClQ9nKs6sVJBTc2BCPgbtnrkYmC53H8KsB
         i1B0aFgefl5ayH/sb+94iDbw+L3Hwh2Cj5dlQjmmz0bJDuOgBONFkzBJh+JKlZaNAmKP
         RKfWBoIzj3fUHd13OeuJk0ArhRgqukGyOTRmAp36RatzOEX2VEf54kD06hpBuTf8kuwd
         XaaxLsEg+dlrD/BI54z7ecAt+JQMYD/bm7w0DX7CEWvEOK8AOfto6zCrVjqBnfhVuMl0
         F0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=I1a9YtVBdZMU9WORyw+ke5pVftnAkjoSeSKRp+wbEwE=;
        b=I+j4aGdoGOVxwkqBk7SvgsTXD868WlxV6D5yiazm9fartGlKnmEhO9NxL/xSewJy6K
         JVZ34OHOSvN25rLVnAdpYWmgoVMrYJ7qYejPh7v+2Ldv12wE8TLHE9P9eGCKUtWXFG8L
         W4RV9BnvtyZZVnjHSJNBEH8wEDiw1YCjSi936Wnw+gYxl9TnfhhC+I29OOps4ydPJzq9
         cama0E4fdomytDtM/57g370okXT21P3KgnKdkCuYSJgVfzCPDPQFuZjNN9K3JOhkjT29
         kP0u2aQKt/vLKas79GvTEyWcth3qqRZ4G4UKNb/woPxpO6gG5QpuYpc2DfY+lKaeI8OO
         IGOA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530nAQZdSpsOlZPfFfr4zo53QiyECgQrZE+NQT3XtNCFM6LXfeEB
	V5kyF2G97E7YsKRqU2eEVWk=
X-Google-Smtp-Source: ABdhPJw+uvc2iIipIaMDkp+qGIbsRIaH0FMtIYZnpxcWiHfas6qfWAyXlyEkthVuUBRNuzQGxZODRA==
X-Received: by 2002:a2e:b174:: with SMTP id a20mr1840657ljm.200.1598917976972;
        Mon, 31 Aug 2020 16:52:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b4d3:: with SMTP id r19ls1398526ljm.3.gmail; Mon, 31 Aug
 2020 16:52:55 -0700 (PDT)
X-Received: by 2002:a2e:7210:: with SMTP id n16mr1803783ljc.262.1598917975873;
        Mon, 31 Aug 2020 16:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598917975; cv=none;
        d=google.com; s=arc-20160816;
        b=i7o/owcWnYHYOHiRQrEOw2Ui6Le1lEBJ9fgxEA7ZcUTyMac01y3xo16ltJCNS9cRwU
         i5xWFpjuJtidE7jTLUXeYSupSnESD1U4Pd53vuzlPv0oLhPNFSpmfnKeUtqEpOW+EHP+
         1I/+/cTiX8DpsleETw8MGWgHPAfR5efXg9qJ2oz/qHu5zeO2G8ammeeSlxlAXQYnpT5+
         evqQvny5NwQ4/wDTf5gf38t3EqANOcgXy2sTcP9IvJrVHpX36vWN44gYkXZumYtBw55W
         j3ye1UCmbpkPYxxOq0se41rQQx9DEp68hpTJEdMfacDdBg9a4cHRS2SGRpEBTphk/QD9
         +3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=bOXa5greKDchU7N2zMW2rjna3hjG2vVLN1S23iqwBTY=;
        b=CCcTA8ibXQFdV2uw43xNIg/BCZpH6k4SpVx6XqcsL4PljUac8b0efGXxP69K86WF7I
         giXselVXTWUfNFsVZvjfMl8dECzoRAZsSnfKlTy8hj6+jxD75gh8kO4raLmynerKHZaV
         PQhszd+1zyM80d/wpJzvKDvbrk+fcJtFl6fi3+vSf/H30A/+7yIHpUN9RfdfPatgt6Nb
         EsYaNopUf+Bhfcm5giNswQ7WUzsykMAXZ81Hpm60IObwem+JTvZhBC4TWeYMSahe4tCc
         3/ORxkctU8V9UvOwV7CSzqE6xyVR9xKZsT2nVb/eWm3tV1ecI3nDaeqbxXCWYJyPdbUB
         iCog==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 11si94956lfl.4.2020.08.31.16.52.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 16:52:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 07VNqsf2020119
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:52:55 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.128.15])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VNqorI007358
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:52:54 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 2/7] linux-jailhouse: Update stable kernel versions
Date: Tue,  1 Sep 2020 01:52:45 +0200
Message-Id: <00284850651a221063debf9e524be96cda4a86e0.1598917969.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1598917969.git.jan.kiszka@siemens.com>
References: <cover.1598917969.git.jan.kiszka@siemens.com>
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...-jailhouse-rpi_5.4.42.bb => linux-jailhouse-rpi_5.4.59.bb} | 4 ++--
 ...se-rt_5.4.43-rt24.bb => linux-jailhouse-rt_5.4.58-rt35.bb} | 4 ++--
 .../{linux-jailhouse_5.4.43.bb => linux-jailhouse_5.4.61.bb}  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename recipes-kernel/linux/{linux-jailhouse-rpi_5.4.42.bb => linux-jailhouse-rpi_5.4.59.bb} (62%)
 rename recipes-kernel/linux/{linux-jailhouse-rt_5.4.43-rt24.bb => linux-jailhouse-rt_5.4.58-rt35.bb} (65%)
 rename recipes-kernel/linux/{linux-jailhouse_5.4.43.bb => linux-jailhouse_5.4.61.bb} (62%)

diff --git a/recipes-kernel/linux/linux-jailhouse-rpi_5.4.42.bb b/recipes-kernel/linux/linux-jailhouse-rpi_5.4.59.bb
similarity index 62%
rename from recipes-kernel/linux/linux-jailhouse-rpi_5.4.42.bb
rename to recipes-kernel/linux/linux-jailhouse-rpi_5.4.59.bb
index 32db5fd..a8b296e 100644
--- a/recipes-kernel/linux/linux-jailhouse-rpi_5.4.42.bb
+++ b/recipes-kernel/linux/linux-jailhouse-rpi_5.4.59.bb
@@ -11,5 +11,5 @@
 
 require recipes-kernel/linux/linux-jailhouse_5.4.inc
 
-SRC_URI[sha256sum] = "00028967b4ac4fb78380903d7ea7a952a5016a932e2c266b634f980896e423bc"
-SRCREV = "938661d5eb8740633d427810c37e83f16da8cc8b"
+SRC_URI[sha256sum] = "dc9719a70743bf98057eb1a4d1e40a2cbed9ea08fc752a1a1ddb0285d23a2ede"
+SRCREV = "108bab72978d4ec29ef6ac32506eb1783af599a2"
diff --git a/recipes-kernel/linux/linux-jailhouse-rt_5.4.43-rt24.bb b/recipes-kernel/linux/linux-jailhouse-rt_5.4.58-rt35.bb
similarity index 65%
rename from recipes-kernel/linux/linux-jailhouse-rt_5.4.43-rt24.bb
rename to recipes-kernel/linux/linux-jailhouse-rt_5.4.58-rt35.bb
index 03693ae..ed840e9 100644
--- a/recipes-kernel/linux/linux-jailhouse-rt_5.4.43-rt24.bb
+++ b/recipes-kernel/linux/linux-jailhouse-rt_5.4.58-rt35.bb
@@ -13,5 +13,5 @@ require recipes-kernel/linux/linux-jailhouse_5.4.inc
 
 SRC_URI += "file://preempt-rt.cfg"
 
-SRC_URI[sha256sum] = "299f777d0b253a4bbafd40ceade93f967d2bb637ed7bb4a6ed8064474fc08600"
-SRCREV = "db818a378db60497d2e14a697a486826772f5024"
+SRC_URI[sha256sum] = "7b58715af2468353b966dc57ec41737f41cde8729f1e2e209dc1d10e758464a3"
+SRCREV = "951c9e56a32b9ef1f9c1906b5cf8b47a8d953d64"
diff --git a/recipes-kernel/linux/linux-jailhouse_5.4.43.bb b/recipes-kernel/linux/linux-jailhouse_5.4.61.bb
similarity index 62%
rename from recipes-kernel/linux/linux-jailhouse_5.4.43.bb
rename to recipes-kernel/linux/linux-jailhouse_5.4.61.bb
index 5803cc9..2892828 100644
--- a/recipes-kernel/linux/linux-jailhouse_5.4.43.bb
+++ b/recipes-kernel/linux/linux-jailhouse_5.4.61.bb
@@ -11,5 +11,5 @@
 
 require recipes-kernel/linux/linux-jailhouse_5.4.inc
 
-SRC_URI[sha256sum] = "b813375218deffe894443e905351032d58c5746a855acd446258523d767a2177"
-SRCREV = "817f74fae9af14d74e43b69f74b93635dfabb751"
+SRC_URI[sha256sum] = "e6769cfb9fe666372a5baf52e116c6022ee8a0a2de48248a5897c6af54812a8e"
+SRCREV = "eb3ca54a7882348374d7ae32a749459c8bb4decd"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/00284850651a221063debf9e524be96cda4a86e0.1598917969.git.jan.kiszka%40siemens.com.
