Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBH4O373AKGQETVZLMRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63c.google.com (mail-ej1-x63c.google.com [IPv6:2a00:1450:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2051ED3C2
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jun 2020 17:52:00 +0200 (CEST)
Received: by mail-ej1-x63c.google.com with SMTP id d14sf992574ejt.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 08:52:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591199520; cv=pass;
        d=google.com; s=arc-20160816;
        b=Sl0EPZHZXgbfCKV1jCHsQxfYKN7rPJihkrIB2IcLz/jTGrHm0EdcH1ghJ/R/98wr5/
         vjoZQtWX9QNO+9sqWWJK+yC82qX63bzm22T/3/PmJr75y2jfbUB2x5vyQosww2Wc3uuF
         ZRBNcbbGeUveoKrFXKVPFDhyROi1s2fvb75XiKbsf9EgBN6+sW2e0EO+QkziWUXBYZ0L
         flwbwh+rvkcnKAIjHrneqAaD1jwoMCD67ZfMDqOSgxlG+uL2KS1luKNUrCEyOLb1Pmwa
         YOGMJe3LTx1k6wew2mqsp78ID/M9kRN4p+gZZwgRmn2oMpIaMeBerSAl3jTv9Do5W3Nt
         E/4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=5xYb/0VVZz1bam0O7aRIle8drbMDLytsyyV2/9fKZZY=;
        b=dqZTDP3eYmEZ0N1U47jHYx3HkhYk7rSXsBS1JprNjiOjln8DJQiuaTS+P2PAqHgPK7
         ws67/y7ricYH1ugohU3y781dWRtpbT5MbrZg31syFU1pHElfdk3rgP+Z7KxBFQyNnERQ
         OquoW6o1/FuJgloFETWToMRtgt7nEypfGDs1UdSBpaQgl1Hw1QCbvkfekBmrn0eVHpkB
         xzTEHd7LldeT6Pd8Z9TRIiSbRzyfwNABTcQA51B7u70Zv7C6IzEc3H2G5A71oxYdSDio
         ewnHJ5MVSBI0/0BrFV49kCTtyH9J0b29sFQn90xVgBy4k+V4hjusrQ7lTE53lMIe0VHY
         gK7w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5xYb/0VVZz1bam0O7aRIle8drbMDLytsyyV2/9fKZZY=;
        b=oWV2iBczThaLyfBCC/8CgNNLZcRxzzSX/WNDN2GEkwfaxvnfxym0USMeybTDN4iprf
         SH50XKaE9BlqxiwXstzv5DZz6pv2pXc6uauQCkqwNsW92yV+HIfboKIqEwbUsEJPARVC
         JknXWt1PVMsdgS0a2BDHsKO8uqmmdpCZUQjCKNQF5A+CMGYtrJ0B3IhGqHPD2y59etF1
         kTYNsmxh+VIY6+JIZZ/9gleryjPmkznyM1gKUooenNDeIsEJHEV86mjLkYt2+WSysY5U
         1va2c78y/YnWpjMpDuVLlLTvI6xjqsQmEc3NUCKfGN7sT+8TiBZG0mDA1Fe5aPqrVhlC
         xekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5xYb/0VVZz1bam0O7aRIle8drbMDLytsyyV2/9fKZZY=;
        b=tbe1gpvVvfPKA8P+K7/HSWNI/sNQrmZ676TA74mvOeyBUwXhi5Les7vBFi/TGeUYXU
         dYnqZAfuAadN9Prde8v6dj9NE47jd4juX9R/lTrNkxkbrCVBeoKuHAldSknGHB1rumOF
         A/kuoquckBKmOvqb+katvsbV1yu9EClzoFTjusfLdIyPTI8pCnq7IfJCB6bZvBa497Ir
         ANJD+5MkkZ2SqK111JHmu6uQaMYgabeIKhWnWihbhhbKsD/ImcuoQIGd/p4fcqMHw4af
         ask8pBOkFjUoYg4uC0TBWFNOwG8Rp6KKvaL2pmDWICqNxnDX2U9/hhTbYlTV2Cryt777
         0i3w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532TjC49UkXGc47YYg1SOTK0e8YYaSO+ylH56SXLVtNuZV2W+6Tm
	e73wwuuDEfqVMOWML2dw8Hc=
X-Google-Smtp-Source: ABdhPJy82CAgJP7eImvtstypKGBagR6DJEbEqetvVZuFvrx8P1F/RjHz5g+BRAwDu8VSZsC78PZw0A==
X-Received: by 2002:aa7:da17:: with SMTP id r23mr39223eds.261.1591199519904;
        Wed, 03 Jun 2020 08:51:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:9f21:: with SMTP id b30ls2952774edf.1.gmail; Wed, 03 Jun
 2020 08:51:59 -0700 (PDT)
X-Received: by 2002:a05:6402:a49:: with SMTP id bt9mr78052edb.300.1591199519209;
        Wed, 03 Jun 2020 08:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591199519; cv=none;
        d=google.com; s=arc-20160816;
        b=ceEWt9jgBKiE6zJLyJqKdjeU82d8cfmqCHjK4P7QLOQZkHbeKq7kocp9thlIZsl9A+
         hRXC+fe7CwpsNqtAOMMoK95ZQpZz/tkh/ZewYSBi+DMKkHPMch9Z5ss4HS+JWtu1W+X3
         vbzGo+Ylbue7HjrXuvgKuSlsxyb8KgjzRxruxPC0gBG4EM002Bqh1C4vEbjhkhuuUCW/
         dKga0bOnvxqHoPGv55ew2VS2klCLRUJVFNWSZpglyqi5OPCy/cA18QQEvc82pazPSeep
         gHAQJpGFO2W17IipbdPSadmjUNxJ7QRgXJxlAg5jgGGUCJ9k1n0415HNxCIJ1/cG402U
         xSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=alyyadgQjasMu3L9AhBO6VmzoxxR+T/cz5s+leMgRkQ=;
        b=wnxTcWLZlJq/mIR2Anebv5PLlloi7BK3CDWJAHMC4eI5tWFu0XesZzRskXdPx95VCK
         uPeqaJ8miAEFRGBisPBFAGUSUCAMRQg1b8c7IX7MzGJ2t9E17/zm4JNSFDT33mkX1TDY
         Oe0SszlDDpLtyiPgmwDnpEfzMUv3kGvQq0m5cueWZwM7832MkkHLpOSW/zcJv+HhRNEF
         kYHQDiUnHwTymRKn4oojELgIuXZmRywUSHfhKMsA7whyw7bEGbKMfZZypyxTSUZzRRPQ
         DGxVFRzZ7fXmuDCXIcOVNPuOyKesuW8uqe5JG3VHlnsAk/Wfmt6I5MkeO/LOwKDoiNuV
         aPAg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id bt20si132618edb.2.2020.06.03.08.51.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 08:51:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 053FpwKi017297
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jun 2020 17:51:58 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.36.189])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 053FpwjS008838
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jun 2020 17:51:58 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 1/4] u-boot-*: Do not use ftp URLs anymore
Date: Wed,  3 Jun 2020 17:51:55 +0200
Message-Id: <1f883620e1ee375fb9d629c7e243dc908cf28d6d.1591199517.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591199517.git.jan.kiszka@siemens.com>
References: <cover.1591199517.git.jan.kiszka@siemens.com>
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

Those are legacy and can break with certain proxies.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-bsp/u-boot/u-boot-macchiatobin_2019.10-atf2.2.bb | 2 +-
 recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb  | 2 +-
 recipes-bsp/u-boot/u-boot-ultra96_2019.10-atf2.2.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-macchiatobin_2019.10-atf2.2.bb b/recipes-bsp/u-boot/u-boot-macchiatobin_2019.10-atf2.2.bb
index c80e07f..20271d1 100644
--- a/recipes-bsp/u-boot/u-boot-macchiatobin_2019.10-atf2.2.bb
+++ b/recipes-bsp/u-boot/u-boot-macchiatobin_2019.10-atf2.2.bb
@@ -16,7 +16,7 @@ require recipes-bsp/u-boot/u-boot-custom.inc
 require recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_${ATF_PV}.inc
 
 SRC_URI += " \
-    ftp://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
+    https://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
     git://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell;protocol=https;branch=mv_ddr-armada-atf-mainline;rev=${MV_DDR_REV};destsuffix=mv-ddr-marvell \
     git://github.com/MarvellEmbeddedProcessors/binaries-marvell;protocol=https;branch=${MV_BIN_BRANCH};rev=${MV_BIN_REV};destsuffix=binaries-marvell \
     file://0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch;patchdir=${WORKDIR}/mv-ddr-marvell \
diff --git a/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb b/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
index 4842ef8..af911a5 100644
--- a/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
+++ b/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
@@ -16,7 +16,7 @@ require recipes-bsp/u-boot/u-boot-custom.inc
 require recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_${ATF_PV}.inc
 
 SRC_URI += " \
-    ftp://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
+    https://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
     file://pine64-plus-rules \
     "
 SRC_URI[u-boot.sha256sum] = "8d6d6070739522dd236cba7055b8736bfe92b4fac0ea18ad809829ca79667014"
diff --git a/recipes-bsp/u-boot/u-boot-ultra96_2019.10-atf2.2.bb b/recipes-bsp/u-boot/u-boot-ultra96_2019.10-atf2.2.bb
index b87d7ce..57424e5 100644
--- a/recipes-bsp/u-boot/u-boot-ultra96_2019.10-atf2.2.bb
+++ b/recipes-bsp/u-boot/u-boot-ultra96_2019.10-atf2.2.bb
@@ -16,7 +16,7 @@ require recipes-bsp/u-boot/u-boot-custom.inc
 require recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_${ATF_PV}.inc
 
 SRC_URI += " \
-    ftp://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
+    https://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
     file://0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch \
     file://ultra96.bit.xz \
     file://ultra96-fsbl.elf.xz \
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1f883620e1ee375fb9d629c7e243dc908cf28d6d.1591199517.git.jan.kiszka%40siemens.com.
