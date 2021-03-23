Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSHF46BAMGQEYNJTETA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F24346039
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 14:53:12 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id j8sf510289wmq.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 06:53:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616507592; cv=pass;
        d=google.com; s=arc-20160816;
        b=Wqgiqv76DpPdNvjfc5ZNmhbgF4OCp9nvLKiD70FB/0TB9kt02edpQZZdDpiXqQER6o
         TlGjtoOHPqryR6DwZ9UFAEGKCA+XyQ5UnJmXj+bRouL7iKSb6HlVaZt7S1YEa9Ka5qGk
         qiXMdavW2vBOXWP6ycBIfcuZReIHnJNGsf2EwdgI829Fpn00Ra+gKYoFz5FvjImzNIB9
         hDKRxfY76K0ArtZHZ0xFG1/HzlqW2eK8N0jAff7q6xJgCp7B8V+FarSE2RWe9kjrR4eL
         Lvxf/joCLklpjABE6oEEwWaOvf+4kxWwRlffsrIziWtaul6SDoZbmW23buKJ5NudgdJ5
         MeNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=2gRD/dJu5pewNiaJ76ArmkekvudUv/LcxZK7YYwYe94=;
        b=c8er9GlU0R1YW5USc9mPHesI0chTAhJWpw6D99BSPJI/UK/djjdYLrcKA38ZqirFpD
         hJOtmR1ZOnnpbnTTHLDMJLpknNQK/5qd8Ad5B6C1sxaX7zU0POvf/ruHXnu/gr5Yl4Qv
         hswuc5EU+ZbXylB8trSb8glPdfs8E307zAkPui2h44ZjZ1iqFugmbyP5FeQiA+A20vAi
         FF1bUyp4fNcMHvJKoV2wFf9Ux4atwKZmPMurMgOi8vvBnRDIzY69BFAmOvwcEq2yu4d+
         xueIDFAVPH9B9iAW8D6wMK+H6pRqycFHLU9VKbwDFyW/KV7423kjkPVVLbjBig+WIHKy
         pcQg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2gRD/dJu5pewNiaJ76ArmkekvudUv/LcxZK7YYwYe94=;
        b=XMVWpeBUtTMXmw1RxEJC+HeGq8WLh/dJGXhMxcEnLIO70bLOez5UIm3O3uDCmGhPZS
         E4SGjvRHzjwHe9QiAgYwqVlv+hNy7zdzJJ+j7UUE+3QzEOE7fTnB61cRek0btO2sMV7A
         u7xKDEZKU+CcWaRjRIts6Ko7cDWZZ0rQ5unFxnqVJRD5pngeS/aTrKFv2kIF1vFcLNnw
         E6smW9m0e8b4aIeUHzi1iwixbeWPLeKnZv8gaWPSrZE1UgJ8axef582Yp1eL8/adqguy
         xT7KS3ba8t/9/vI6w6F+KbqFfcHXVyvBNDrW2Jr93ino6QH8Bu04Dhqpq8yDEoWq2DMB
         /1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2gRD/dJu5pewNiaJ76ArmkekvudUv/LcxZK7YYwYe94=;
        b=AZVEROax88E0rij24wh/PLwW2nNe1AKgh8fqhfie+wWVPVisOvGdzWjRlhWQZjxdKA
         jWUTdAq8W9nH3qt7/3uxywWcrHkf5zQnDZwwQB5d3RNLs/8MkAkbqxUBuzcWsmbEyMrJ
         GnUbuW5d6I8AdZHxzoUMgljT4//3CvBFwu/sbuEIYSyrhMsxoYonL1lIsOHkd0Rf5crX
         AWfTNQJ2p/C+j+edegaMJHCfmbh1oWzqfsY5OKYInVmdLnpnId4H0FTVMejFlIq0EN9r
         dYkjuNE5ayPItm0HuD9DlC6MK1gD+9dvnXEYa50Jr4wyzLw3e/5iqa7Tv8MZyyHH0wTp
         grMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530d5rk1l3AEUVHP4mu/i9dzKENWaor4LBfzxFIAaE+wn/biLXMs
	5fotJrXqZfSQhNAJe1+lvk4=
X-Google-Smtp-Source: ABdhPJwiMSodyy7MI3IpFtb9VpRMh0E28F5MRiSmB4QfYsWWyAKLygUUQrwbxgQr4a6zCT0+UeO4vQ==
X-Received: by 2002:a5d:55c4:: with SMTP id i4mr4175156wrw.84.1616507592390;
        Tue, 23 Mar 2021 06:53:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cc94:: with SMTP id p20ls1382824wma.0.gmail; Tue, 23 Mar
 2021 06:53:11 -0700 (PDT)
X-Received: by 2002:a1c:f715:: with SMTP id v21mr3561922wmh.187.1616507591408;
        Tue, 23 Mar 2021 06:53:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616507591; cv=none;
        d=google.com; s=arc-20160816;
        b=E2NwOXTCOBxwnPWMdZs7LpQzUFV+QCHL9YKoPF1v4odenccBMk8evSnt7rc+ldhirz
         tWxjsZ5sRPR2p1TFq5HllN2I4eW4k+AQr3U33ku2ypVViTejv+EaYps1Kd0p7fId3IDv
         eCBf/7kY3WqxIdIrMT0yTG6TU+iDlxKHAJlB6FIMuS1CHYLgiWdHN64M92ioHTgu5vgY
         AtFAV1gcBOBVj7E9Q4py+ztB8zPeoZWx/jJMbmiwt0qb2P/QtgaXIwDUc65hqGLvfFs9
         jVqoCsQYkDLSk2fBNqtvu0FfReg7OnQPSWB9CuSWhJd2ta4nVNLvCW5y+X/oSEBXWphk
         Mcmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Q/bRrT1wCOaMlxDxPcS3qU3qd4mlje1R76E9EAOmyVY=;
        b=BIGbTt75L4VjR24aWR4yfWf3U4HxAt8SYE7UGMDQ17Fg1mcFlNWtb+zG7iJutThvUz
         FhjYiibDSIBbLrUFeSAl6HGeJgVLF2EwurPg/fsiVvvy0PNscGj1IELP9guF4Y/LKPy6
         l+OxM1Ek4cPCuoMiA6P+w18J5k+W3sZlJQecusRTtJpgOQ7lMEh/za2ZlRHd/2pOe9Va
         Z8SA79OcK6PjrTxej7ylybNMsPlCpg3X0kV9MBStuPCaI1TAiAAbjy4aTq2uT/ewGVZz
         kb+LEPEHDwb7Trbnz/b25CM3vaOewGQOCuPXoOjdYz9J/nR6ILlEqXTsT6K/TANoQ29g
         zNCw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id k83si110358wma.0.2021.03.23.06.53.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 06:53:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12NDrBeJ004287
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:53:11 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12NDm2Mr029573
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:48:05 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 11/11] non-root-initramfs: Purge buildroot download cache on cleanall
Date: Tue, 23 Mar 2021 14:48:02 +0100
Message-Id: <58bc168fc126efbf74112fcc429e365f89080847.1616507282.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1616507282.git.jan.kiszka@siemens.com>
References: <cover.1616507282.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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
 recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb b/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb
index de8c296..be1348a 100644
--- a/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb
+++ b/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb
@@ -35,3 +35,5 @@ do_prepare_build() {
 
 	ln -sf ${DISTRO_ARCH}-config .config
 }
+
+do_cleanall[cleandirs] += "${DL_DIR}/buildroot"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/58bc168fc126efbf74112fcc429e365f89080847.1616507282.git.jan.kiszka%40siemens.com.
