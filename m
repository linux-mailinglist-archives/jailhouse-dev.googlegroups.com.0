Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQXF46BAMGQEHHGSOFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 807E3346035
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 14:53:07 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id k132sf781589wma.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 06:53:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616507587; cv=pass;
        d=google.com; s=arc-20160816;
        b=hwcVRtRPI12artqKvfYuAZygDkNUEdFdWe7BdbhiLYHl7m68cQrNu146YlMh/1PbqY
         IcLovj9sTFoPHWb+HAPnXs+GaIn8L14rdLD68VOAV/aoEPCWjzARgGt0y0xcBqn/xS1Y
         VPfwzgwhyR4d0wP8Hy3XDB5qc70Gd0mqsbfTvp9lc5lxWHo5G682tg6AGTTdwp4FRgCs
         7RJ6IRZUNsSSSTsfBrBtGGGeDaeCffH5wewuSFc/YkKXN02kSsd1ZycA/GK8Rn2KekL/
         1PWQXMY3y91eHrCbbunoDJFJk/syxgNayAu7WkLVU+1j3j2Ds10zFiLoDD8zOMWJwofE
         9pgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=1T+i7s5VhixWwaY4aGCvUhxPlflj4iMOwpXMFoL5+0A=;
        b=c86pmQfaRvTznB3JqRAYeVDsY1Qv8CJoQffR6PT3UfV5sI/xS1qugPXt7E4YkLV9XT
         UoSDeMxkspI++l8Lxes9GFcXVhHxE8uuxY/Edn3XPgPnvwXpBiFmRggz7JTLqfs2zF0E
         L6lzFWEtC9TwPsbnWHXNK5MKiJkWwwQODp2SU9lKhd9lO5K6VOR0yKJ1aBF3RO8xmJKP
         RXA3z+H5qAodRsEvO2pTQjP9zFHdTHD8JBvr4RgssCcRfTv42hT6bQe7BWUMyxsd8vnt
         +yUyRdAx72KzBuMp0CeR06joOwDepw3Dx3zwqF45+rzdmYOgOkEpZ8mRhueJn/zhJcuq
         hSZA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1T+i7s5VhixWwaY4aGCvUhxPlflj4iMOwpXMFoL5+0A=;
        b=Jn+qjlzzo+1xAWJUaccWzzDRgQ80eCsZPDLXbLM6J1x/Ev8MGCAdAcCU2fkrZMPkjM
         MYW2R7Ie5oe+OWapB/7/YQAxVtIa9SMZI/3yG/hg4LMiRYILWYfQPRIzIbXwddZDjKAG
         hoceW/12N+aq/Bqfl/luJeo18ak1ntgxXA6v4Z/k/eNOx1x5QQbAs1ZUxXV2uFpCr2Px
         uFDMI4y3pHjApvmB9bBz6kjojlxdKCWFSjTCUnYr9jRzhR8xjAUkEQHzVnrudav+BMIZ
         LIMG4q9Tshk7Mx7rYCRtJtFZLEzdkZ7/CdoaHRG0inrV/OB6tTDAQDfXz41Y5iERf6gK
         r31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1T+i7s5VhixWwaY4aGCvUhxPlflj4iMOwpXMFoL5+0A=;
        b=cmF5xPls7HI32AtD88cWIZUudJd0Bmb/YTyzfAXBPOoRkfpRVOlY7HaS2mxcqulfJF
         A/UeGrL/DHaEaqnkofEhxJXy/3EwM2xmT4E6mrEpyq19yDS8i9UvMY39Mq87KCIXuyAU
         U0hWRgthHaAkF5Ftf/ZXP78ozReBPxDHuHPlyrjKevezHR7TYiUWFXm28vhl/oicKtxe
         t/DTGzlOzL6ynMgr36jbU8LNS7JK4oXz6MRSIU8teFZ/G58jE5039Gfa5CMBInNYsm8s
         JE/k1N6tJ/KZccvUk0HP2CMNSxORw6H5FeRIhmQRk5uFLRrVF5v3x6hD830GelxEb/mS
         s37Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5328bUCsK6UdH4p9QZT53IQd5pw4NcQFUd00b77hIajuVcDQnvEN
	VrDMFZnCd7SwBcoqLYce0xQ=
X-Google-Smtp-Source: ABdhPJymkyL1VUvQkau/AohGGX8ePRhonSxeTVP82cFQ4MUeOELmQbVhKYt0HJwfcQ3+BghDVW248w==
X-Received: by 2002:a05:6000:1149:: with SMTP id d9mr4055427wrx.347.1616507587205;
        Tue, 23 Mar 2021 06:53:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:58f0:: with SMTP id f16ls2998710wrd.0.gmail; Tue, 23 Mar
 2021 06:53:06 -0700 (PDT)
X-Received: by 2002:a5d:66c8:: with SMTP id k8mr4166798wrw.163.1616507586246;
        Tue, 23 Mar 2021 06:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616507586; cv=none;
        d=google.com; s=arc-20160816;
        b=X13tqBxSluBNPNIHWoemcU+y+sQ2NUb2kt3R2ecje6myPzzR2rJJ6ssFgxZXObIfys
         ys+wReBsAh3sYPM719z1a2FsnQCQo3gFWnWldwgDbcJto7ARe89SqTLCbpUTUHVb25A2
         hTDxG9AwCOcciGHuQoYsDNzLtU4VPPSMlS4LgfpDYwac23/ogz0TeNaMK0vX8g+0Y6C6
         v7fqQ2HbUNJnVPB2/lHhfjuix8gIUZHFm3RTJtN5TWP8LrZcLdXCqQeCsivE2f3RuOhi
         b5MEPOkEGtKFm/EsattKs7uoLZqN6/SCJcjlyvCCqqfiF4q3j7vHDfCZtlUUHPi0IqJc
         1STg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=an/kmNk4qMONIrRVe+Mx9r+MV+a9pMY1qBQReu+NGEo=;
        b=DLAncLcS+NY8TwY4c29XZ8UUH+pJV81JpnARrX8gsTiBhqp39yWMH7O9B3riSYkuQr
         OaptOdYP7qbHt+hAq890cdJiOICYMPzLF+gExpqIMgXHY25GF6tc9xB7KWmJL09hEeVZ
         6hTYYZ13CK4v3fsZoUdFKg/704HtrQGba6V8gqlCgWpoy76q69AWaof0sboylpL7j23b
         GprvTzS/HzH13E9vWj+y9sKYRDAyd+HU7d1A3OjwA0T6IsnA4N/PXLJB4Oh1eOErj6ax
         pkunkSTl4l81efhKriWu6r8lqladMhZ+xQllQO3j5DzfdpWd/EamLg8AQOBRF9sw45qk
         xGXw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id b6si161844wmc.2.2021.03.23.06.53.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 06:53:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12NDr5tP026118
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:53:06 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12NDm2Mq029573
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:48:05 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 10/11] non-root-initramfs: Update ivshmem-demo
Date: Tue, 23 Mar 2021 14:48:01 +0100
Message-Id: <18da77342916caea7da8f5cc2f20a5e262adcc2a.1616507282.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1616507282.git.jan.kiszka@siemens.com>
References: <cover.1616507282.git.jan.kiszka@siemens.com>
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

Use latest version from Jailhouse which contains a mem region mapping
size fix and support for less than 3 peers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../non-root-initramfs/non-root-initramfs_2021.02.bb        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb b/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb
index 48f2886..de8c296 100644
--- a/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb
+++ b/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb
@@ -15,15 +15,15 @@ DESCRIPTION = "Linux initramfs for Jailhouse non-root cells"
 
 SRC_URI = " \
     https://buildroot.org/downloads/buildroot-${PV}.tar.bz2 \
-    https://raw.githubusercontent.com/siemens/jailhouse/${SRC_REV_IVSHMEM_DEMO}/tools/ivshmem-demo.c;name=ivshmem-demo \
+    https://raw.githubusercontent.com/siemens/jailhouse/${SRC_REV_IVSHMEM_DEMO}/tools/demos/ivshmem-demo.c;name=ivshmem-demo \
     file://debian/ \
     file://${DISTRO_ARCH}-config \
     file://build-ivshmem-demo.sh \
     file://overlay/"
 SRC_URI[sha256sum] = "2d86279c26a2745b044e0b1cfa9bee17bd3b211e889f9a493defeed0ffaad588"
 
-SRC_REV_IVSHMEM_DEMO = "87cc49f944ed756e930b70991726ca5595a30717"
-SRC_URI[ivshmem-demo.sha256sum] = "e7cc426bb009c3c7d99c042ae45760494d8454647fbb042359655ea37ad1dcfc"
+SRC_REV_IVSHMEM_DEMO = "9325b765d1ef16af3ad6e84f6dee872cd9e553c9"
+SRC_URI[ivshmem-demo.sha256sum] = "7053e9f6c05e3c73b2b095f02c55b1c1d8a7f9760c9bd0b006c09d53a2acc024"
 
 S = "${WORKDIR}/buildroot-${PV}"
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/18da77342916caea7da8f5cc2f20a5e262adcc2a.1616507282.git.jan.kiszka%40siemens.com.
