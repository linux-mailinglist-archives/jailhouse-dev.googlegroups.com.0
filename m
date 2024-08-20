Return-Path: <jailhouse-dev+bncBCHZFNW24INBBCGTSG3AMGQE6P2XOUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x3b.google.com (mail-oa1-x3b.google.com [IPv6:2001:4860:4864:20::3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 509AC95837D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2024 12:01:46 +0200 (CEST)
Received: by mail-oa1-x3b.google.com with SMTP id 586e51a60fabf-27003dcbfe8sf4637466fac.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2024 03:01:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1724148105; cv=pass;
        d=google.com; s=arc-20160816;
        b=rjuysUODY/nH85vaqFoCUBM1YZGyy8aN8abKqaNY9s/PFcaMsZIi4x00u8dPdjVNaQ
         k29skM/JuiAxGw9yrYIStKuy3lpH8aGGt71vh52t+87P+u0ePtp7A7puwXDBcPpoX3NU
         vzrBRxxDxY/0XdpwtVbePD4MPx63OWMPqJ5kjim8LghPX0eyl7RMQq1H+gxUjCYXQOpy
         OsQjLoBOkB1Mk3ADCHkZnbB5p5wzuf/H3drGZxVymUBNj/b22AX9I9hfbd9sZ3HFwhIi
         W+gDOQOz2S9PRzaMzjnhrB/50iRCrTUGUxWTnHciwE8Vef1GnJJmLziDMP0UK/hMYT5i
         NNPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=EMxTJ91OxuM3W6pRPBbxfhGB5sZl9vUZ+WerOnahMew=;
        fh=2SJaLqOdQHio1F3xGfEhjvtI6aIIyKIWQKsBtpqSgZQ=;
        b=EfUqth1qzG8grSo3BDy4EYVsENXAwbrnKf7L9aRlRdQRhzo/IeUMFKSjgp86sgQU1F
         nKDthyI2KlUxU++z4aMsWi65nzTPpDwWKVJgbLN0L2CzilPeJEa6GZj88UlQ+rTdaljM
         XFnzlR+O13F4CAyc0JuoMEIkv0U9VUVAH28msTojRy1uaPpKuPF1t5GkvbDgbRUwRn9c
         m+7raTIP7CNFvTs4cZjPbBCeTWueB4r4tAEeZiTT4kNcMYN2xTV6RCM623zaLZJ8lx39
         RJ8SdM9MJybLV4iORTlb8Um38yWEp3F0ivbYXzK+UhPbGOWWzRJePhhQjRb2ipzvqtkC
         w5PA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="DKqdSEt/";
       spf=pass (google.com: domain of when.a.cat.sits.beside.you@gmail.com designates 2607:f8b0:4864:20::d29 as permitted sender) smtp.mailfrom=when.a.cat.sits.beside.you@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=pass header.i=@googlegroups.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1724148105; x=1724752905; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EMxTJ91OxuM3W6pRPBbxfhGB5sZl9vUZ+WerOnahMew=;
        b=vxTR1BVSUbkYaCX/0+9zMw42MpsiGVibtXqT++fKcR8t4r7xZQ+kRPZ+EEReemhDWf
         +0AYSczlYSL2Q2P1fC/IyrX1gnUSguu4GkQDpWT6P2DC171V66BoThogdstukqGKR3N4
         etzZeroSk1mx+x79+rJgMRh8RolxjJNDPiB/gzwss1+Yje0ZCcuR9Y9Tz++EnfGI2air
         L3UomXYDqBTjllNTO2FNAxRFvCLNUXhO6x+Kl7g5Tmyd4Ww5v79UplAWsNZzyRojp3D/
         sc8X/66WwQBkNSUsxt4pMBLeCAcAh89IiOvJhL3LVEE5gShewf2HB98QRlRjYo0s/n7R
         DyBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724148105; x=1724752905; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EMxTJ91OxuM3W6pRPBbxfhGB5sZl9vUZ+WerOnahMew=;
        b=e54KjmGuL6LNkuO6WOXf4nve8eNyaawZoUiVHpsXG+o+2f+I5DfVOZwtiGj3uvniNa
         4nafWi2LC9ZEZg5gExnjKJijKsMpZCzWMY9tMu6XIQCWxT34MmDltp8WgPWfZ6z9Yp/6
         vf9SDneccEtYrSEhgMCE4eENaw2cIvJDcOo8wuLxL6jYs39CV2MaqFOIjQoW+dy6dsjt
         M7VjlFxlaFnA+Ur7EoMU++jEUzyuE6j7Y+HGMBH8UmOU0akQpIHTIoVae4UOyQkjcVpx
         /7otYE18ygIlcuByYIf7kkVgFoRBbTerEcjbCl4pdCNb05JgE7wXQHNe1A3iudhjJv5o
         TlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724148105; x=1724752905;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EMxTJ91OxuM3W6pRPBbxfhGB5sZl9vUZ+WerOnahMew=;
        b=hLZgL//WTMrRSffxsFudC0TfVr4sDzOwO+stv4dBr1uOTj9oKtX1v+ylYN1tk07mfy
         26RVGzAXNLzf782WOKG0KgZV9826wpFtVwV0RtUJcKrURgJ5Hwe9/Ym/30HuJDnaG4VM
         Jwyaz6JrRWKfO1+PBx3Ce5l2lWfY5Ub1sRm0+pyfw65j2/Md10tIUTlsDFmKKNfqMkHu
         +mec+tr4VtpoFQM5aPydmEiXd5UZQQVgJK1dhJiAokRFa8ZYw+qf5pigrY0Pvl/9jszF
         P6orOufdSRvyIOaZ1enf4DA8OWbi7eVypyyls/cC6lkEImALf8S4QnJbZHp+wTe6Gkrk
         vHPA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCVhyLdwUsaloN/cnZ0dyZotkfQN5QYvTmy4WweYSt+YDmNHw1cfOuS0Q8xD13eqAuJ5uQ+ut6OxnOSpGgQOSiCMdu7WRyZCj9kKXAA=
X-Gm-Message-State: AOJu0Yz2SwW1BHtfbAMX1gzY3m6uGdQD66ltmCllvO5kPoCm0q5PcziV
	s7gj8BUZMy8BRaPP7+DMos5ElHokDtvPWc2JrCYkIAnZOQ5l7bL7
X-Google-Smtp-Source: AGHT+IHjhvWCGsUK/q4sPGCNMpiV4XrkDNTPb64iSYOrpKzDir/8UNm9/xyzvOnXeGFcorRMRyDaCw==
X-Received: by 2002:a05:6870:168c:b0:25e:f4e:da53 with SMTP id 586e51a60fabf-2701c522e08mr15464806fac.37.1724148104716;
        Tue, 20 Aug 2024 03:01:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:b0c:b0:264:3056:9e20 with SMTP id
 586e51a60fabf-26ffeedeee4ls1862427fac.0.-pod-prod-09-us; Tue, 20 Aug 2024
 03:01:43 -0700 (PDT)
X-Received: by 2002:a05:6871:e2e8:b0:261:72a:1336 with SMTP id 586e51a60fabf-2701c587c2bmr12979418fac.50.1724148103327;
        Tue, 20 Aug 2024 03:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724148103; cv=none;
        d=google.com; s=arc-20160816;
        b=UWLvj+6AZU0TvL8o4Y/1ZnfrAmDCMgATdnqjVCKVqufmlOAR5ldEOkf0+kcYX8qmdi
         UptRSal3SKel1I0fVSIH8pFr4JjN3l9z9ateZqgR8XpQxJIwamcm6lugAa2bONgyDwmL
         A/kaH9aTgZubSBQxwPlfJYgeAqurZMAo3vqq/0gbgFbHxHfUhFqh5PgfNyD1M3ILQYMB
         xC/fxlAuRo3Oq0vkUQtJI4Q4oGN0DrA2J+To+0SGtwYGH/t7iVC9PvnzrMrnsLkdL2sW
         rtxZzMDp9jyezXK8SN6c8dIGFWqv5lnJYZaEAMgFES0KHxpYTvqIYBuk1RRa+sH9aESa
         7AcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/MkkMz9CKXWhtdbo2Srf5GW2t1mP1rzB0vSHm7Foqak=;
        fh=2tQzQ7BDCTqJm82PDY7f/SoNACc8xWmtm+Icohy5zLg=;
        b=aIN94EterzME+esnb95AKSaUeomLMzH4C2FugvjmL759FEueqZTGPbTdeCR4Ig1ots
         xpG+1ULT9h7nk4v4CPNh4J71G2erEBH5dw17SX9dv9MhjsvjT1UzHfl6ZJMp+ntILdov
         B5jVGPgabwPuEhJsvLWfxS25n1dWJ4q7XhvjxXST4urESmjYQqwNnrKz3MkJ3WBi3mau
         T0bLnz1iATH1DjcuG8ayKmauTXe7ZHQBQ4KL0ql0V4OkFfEgEx2s6ReLKQthkbgEkrhc
         6sLkjYLhxUY45OJK1C1I7+T1JsPYL83Xllmcn3vQgMEzLb5H7AgOYNIPbLFDaD1Ayo9u
         cmnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="DKqdSEt/";
       spf=pass (google.com: domain of when.a.cat.sits.beside.you@gmail.com designates 2607:f8b0:4864:20::d29 as permitted sender) smtp.mailfrom=when.a.cat.sits.beside.you@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=pass header.i=@googlegroups.com
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com. [2607:f8b0:4864:20::d29])
        by gmr-mx.google.com with ESMTPS id 41be03b00d2f7-7c6b65ba579si627965a12.4.2024.08.20.03.01.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 03:01:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of when.a.cat.sits.beside.you@gmail.com designates 2607:f8b0:4864:20::d29 as permitted sender) client-ip=2607:f8b0:4864:20::d29;
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-81f8bc5af74so17802739f.3
        for <jailhouse-dev@googlegroups.com>; Tue, 20 Aug 2024 03:01:43 -0700 (PDT)
X-Received: by 2002:a05:6602:334d:b0:81f:922a:efdb with SMTP id
 ca18e2360f4ac-824f265be4dmr756556039f.1.1724148101966; Tue, 20 Aug 2024
 03:01:41 -0700 (PDT)
MIME-Version: 1.0
From: Daichi Fukui <when.a.cat.sits.beside.you@gmail.com>
Date: Tue, 20 Aug 2024 19:01:30 +0900
Message-ID: <CAFvH3+=Zi98Cc=PGA9YFR58cK+FQFFPpN-dLjv==HPP6r8mQxQ@mail.gmail.com>
Subject: [jh-images][PATCH] rpi4: replace trusted-firmware-a with arm-trusted-firmware
To: jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: when.a.cat.sits.beside.you@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20230601 header.b="DKqdSEt/";       spf=pass
 (google.com: domain of when.a.cat.sits.beside.you@gmail.com designates
 2607:f8b0:4864:20::d29 as permitted sender) smtp.mailfrom=when.a.cat.sits.beside.you@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=pass header.i=@googlegroups.com
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

From 1850220c870f5ae118508d0023e17e7050ff7d7f Mon Sep 17 00:00:00 2001
From: Daichi Fukui <daichi1.fukui@toshiba.co.jp>
Date: Thu, 8 Aug 2024 16:39:23 +0900
Subject: [jh-images][PATCH] rpi4: replace trusted-firmware-a with
arm-trusted-firmware

It looks like the snapshot at the following URL requires authentication.
However, since we don't have permission to access the tarball files there,
the access attempt fails with "Request is not authorized".

https://git.trustedfirmware.org/TF-A/trusted-firmware-a/snapshot

Fortunately, because ARM provides the firmware through GitHub, we'll
use that instead.

Signed-off-by: Daichi Fukui <daichi1.fukui@toshiba.co.jp>
---
 conf/machine/rpi4.conf                        |   4 +-
 .../arm-trusted-firmware-rpi4_2.2.bb          |  28 +++
 .../arm-trusted-firmware_2.2.inc              |  20 ++
 ...-Prepare-for-skipping-initialisation.patch | 127 +++++++++++
 ...2-plat-rpi4-Skip-UART-initialisation.patch | 109 +++++++++
 ...pi3-4-Add-support-for-offlining-CPUs.patch |  47 ++++
 .../arm-trusted-firmware/files/rpi-rules      |  23 ++
 ...ada-Add-missing-dependency-of-mrvl_f.patch |  33 ---
 ...memreserve-pattern-for-rpi3-and-rpi4.patch | 214 ------------------
 ...-errors-related-to-clock-gate-permis.patch |  45 ----
 ...-error-codes-to-match-Linux-and-PMU-.patch |  71 ------
 .../trusted-firmware-a-macchiatobin_2.4.bb    |  34 ---
 .../trusted-firmware-a-pine64-plus_2.4.bb     |  14 --
 .../trusted-firmware-a-rpi4_2.4.bb            |  17 --
 .../trusted-firmware-a-ultra96_2.4.bb         |  22 --
 .../trusted-firmware-a_2.4.inc                |  17 --
 16 files changed, 356 insertions(+), 469 deletions(-)
 create mode 100644
recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb
 create mode 100644
recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
 create mode 100644
recipes-bsp/arm-trusted-firmware/files/0001-console-16550-Prepare-for-skipping-initialisation.patch
 create mode 100644
recipes-bsp/arm-trusted-firmware/files/0002-plat-rpi4-Skip-UART-initialisation.patch
 create mode 100644
recipes-bsp/arm-trusted-firmware/files/0003-rpi3-4-Add-support-for-offlining-CPUs.patch
 create mode 100644 recipes-bsp/arm-trusted-firmware/files/rpi-rules
 delete mode 100644
recipes-bsp/trusted-firmware-a/files/0001-plat-marvell-armada-Add-missing-dependency-of-mrvl_f.patch
 delete mode 100644
recipes-bsp/trusted-firmware-a/files/0001-rpi-Use-common-memreserve-pattern-for-rpi3-and-rpi4.patch
 delete mode 100644
recipes-bsp/trusted-firmware-a/files/0001-zynqmp-pm-Filter-errors-related-to-clock-gate-permis.patch
 delete mode 100644
recipes-bsp/trusted-firmware-a/files/0002-zynqmp-pm-update-error-codes-to-match-Linux-and-PMU-.patch
 delete mode 100644
recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.4.bb
 delete mode 100644
recipes-bsp/trusted-firmware-a/trusted-firmware-a-pine64-plus_2.4.bb
 delete mode 100644
recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.4.bb
 delete mode 100644
recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.4.bb
 delete mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.inc

diff --git a/conf/machine/rpi4.conf b/conf/machine/rpi4.conf
index 2aa2151..9748e66 100644
--- a/conf/machine/rpi4.conf
+++ b/conf/machine/rpi4.conf
@@ -12,7 +12,7 @@
 DISTRO_ARCH = "arm64"

 IMAGE_TYPE = "wic-img"
-IMAGER_BUILD_DEPS = "rpi-firmware trusted-firmware-a-rpi4
linux-image-${KERNEL_NAME}"
+IMAGER_BUILD_DEPS = "rpi-firmware arm-trusted-firmware-rpi4
linux-image-${KERNEL_NAME}"
 IMAGER_INSTALL += "${IMAGER_BUILD_DEPS}"

 IMAGE_BOOT_FILES = " \
@@ -26,7 +26,7 @@ IMAGE_BOOT_FILES = " \
     /usr/lib/rpi-firmware/overlays/*;overlays/ \
     /usr/lib/linux-image-*/broadcom/bcm2711-rpi-4-b.dtb \
     /usr/lib/linux-image-*/overlays/*;overlays/ \
-    /usr/lib/trusted-firmware-a/rpi4/bl31.bin;bl31.bin \
+    /usr/lib/arm-trusted-firmware/rpi4/bl31.bin;bl31.bin \
     /vmlinuz;kernel8.img \
     "

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb
b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb
new file mode 100644
index 0000000..2dd180a
--- /dev/null
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb
@@ -0,0 +1,28 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit dpkg
+
+ATF_PV = "${PV}"
+
+require arm-trusted-firmware_${PV}.inc
+
+SRC_URI += "file://rpi-rules"
+
+S = "${WORKDIR}/arm-trusted-firmware-${PV}"
+
+do_prepare_build[cleandirs] += "${S}/debian"
+do_prepare_build() {
+    cp ${WORKDIR}/rpi-rules ${WORKDIR}/rules
+    deb_debianize
+
+    echo "build/rpi4/release/bl31.bin
/usr/lib/arm-trusted-firmware/rpi4/" > ${S}/debian/install
+}
diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
new file mode 100644
index 0000000..9f75497
--- /dev/null
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
@@ -0,0 +1,20 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+FILESPATH =. "${LAYERDIR_jailhouse}/recipes-bsp/arm-trusted-firmware/files:"
+
+SRC_URI += " \
+    https://github.com/ARM-software/arm-trusted-firmware/archive/v${ATF_PV}.tar.gz;downloadfilename=atf-v${ATF_PV}.tar.gz;name=atf
\
+    file://0001-console-16550-Prepare-for-skipping-initialisation.patch;patchdir=${WORKDIR}/arm-trusted-firmware-${ATF_PV}
\
+    file://0002-plat-rpi4-Skip-UART-initialisation.patch;patchdir=${WORKDIR}/arm-trusted-firmware-${ATF_PV}
\
+    file://0003-rpi3-4-Add-support-for-offlining-CPUs.patch;patchdir=${WORKDIR}/arm-trusted-firmware-${ATF_PV}
\
+    "
+SRC_URI[atf.sha256sum] =
"07e3c058ae2d95c7d516a46fc93565b797e912c3271ddbf29df523b1ab1ee911"
diff --git a/recipes-bsp/arm-trusted-firmware/files/0001-console-16550-Prepare-for-skipping-initialisation.patch
b/recipes-bsp/arm-trusted-firmware/files/0001-console-16550-Prepare-for-skipping-initialisation.patch
new file mode 100644
index 0000000..10ca776
--- /dev/null
+++ b/recipes-bsp/arm-trusted-firmware/files/0001-console-16550-Prepare-for-skipping-initialisation.patch
@@ -0,0 +1,127 @@
+From 62b9c075700eedbc6d308b51b17e90c031c1a300 Mon Sep 17 00:00:00 2001
+From: Andre Przywara <andre.przywara@arm.com>
+Date: Thu, 12 Dec 2019 12:00:15 +0000
+Subject: [PATCH 1/3] console: 16550: Prepare for skipping initialisation
+
+On some platforms the UART might have already been initialised, for
+instance by firmware running before TF-A or by a separate management
+processor. In this case it would not be need to initialise it again
+(doing so could create spurious characters). But more importantly this
+saves us from knowing the right baudrate and the right base clock rate
+for the UART. This can lead to more robust and versatile firmware builds.
+
+Allow to skip the 16550 UART initialisation and baud rate divisor
+programming, by interpreting an input clock rate of "0" to signify this
+case. This will just skip the call to console_16550_core_init, but still
+will register the console properly.
+
+Users should just pass 0 as the second parameter, the baudrate (third
+parameter) will then be ignored as well.
+
+Fix copy & paste typos in comments for the console_16550_register()
+function on the way.
+
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+Change-Id: I9f8fca5b358f878fac0f31dc411358fd160786ee
+---
+ drivers/ti/uart/aarch32/16550_console.S | 18 +++++++++++++-----
+ drivers/ti/uart/aarch64/16550_console.S |  9 ++++++++-
+ include/drivers/ti/uart/uart_16550.h    |  5 +++++
+ 3 files changed, 26 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/ti/uart/aarch32/16550_console.S
b/drivers/ti/uart/aarch32/16550_console.S
+index 692188412..5cd9b30cd 100644
+--- a/drivers/ti/uart/aarch32/16550_console.S
++++ b/drivers/ti/uart/aarch32/16550_console.S
+@@ -89,16 +89,19 @@ endfunc console_16550_core_init
+       .globl console_16550_register
+
+       /* -------------------------------------------------------
+-       * int console_stm32_register(uintptr_t baseaddr,
++       * int console_16550_register(uintptr_t baseaddr,
+        *     uint32_t clock, uint32_t baud,
+-       *     struct console_stm32 *console);
+-       * Function to initialize and register a new STM32
++       *     console_16550_t *console);
++       * Function to initialize and register a new 16550
+        * console. Storage passed in for the console struct
+        * *must* be persistent (i.e. not from the stack).
++       * If r1 (UART clock) is 0, initialisation will be
++         * skipped, relying on previous code to have done
++         * this already. r2 is ignored then as well.
+        * In: r0 - UART register base address
+        *     r1 - UART clock in Hz
+-       *     r2 - Baud rate
+-       *     r3 - pointer to empty console_stm32 struct
++       *     r2 - Baud rate (ignored if r1 is 0)
++       *     r3 - pointer to empty console_16550_t struct
+        * Out: return 1 on success, 0 on error
+        * Clobber list : r0, r1, r2
+        * -------------------------------------------------------
+@@ -110,10 +113,15 @@ func console_16550_register
+       beq     register_fail
+       str     r0, [r4, #CONSOLE_T_16550_BASE]
+
++      /* A clock rate of zero means to skip the initialisation. */
++      cmp     r1, #0
++      beq     register_16550
++
+       bl      console_16550_core_init
+       cmp     r0, #0
+       beq     register_fail
+
++register_16550:
+       mov     r0, r4
+       pop     {r4, lr}
+       finish_console_register 16550 putc=1, getc=1, flush=1
+diff --git a/drivers/ti/uart/aarch64/16550_console.S
b/drivers/ti/uart/aarch64/16550_console.S
+index dab46e8c5..80c1b8646 100644
+--- a/drivers/ti/uart/aarch64/16550_console.S
++++ b/drivers/ti/uart/aarch64/16550_console.S
+@@ -92,9 +92,12 @@ endfunc console_16550_core_init
+        * Function to initialize and register a new 16550
+        * console. Storage passed in for the console struct
+        * *must* be persistent (i.e. not from the stack).
++       * If w1 (UART clock) is 0, initialisation will be
++       * skipped, relying on previous code to have done
++       * this already. w2 is ignored then as well.
+        * In: x0 - UART register base address
+        *     w1 - UART clock in Hz
+-       *     w2 - Baud rate
++       *     w2 - Baud rate (ignored if w1 is 0)
+        *     x3 - pointer to empty console_16550_t struct
+        * Out: return 1 on success, 0 on error
+        * Clobber list : x0, x1, x2, x6, x7, x14
+@@ -106,9 +109,13 @@ func console_16550_register
+       cbz     x6, register_fail
+       str     x0, [x6, #CONSOLE_T_16550_BASE]
+
++      /* A clock rate of zero means to skip the initialisation. */
++      cbz     w1, register_16550
++
+       bl      console_16550_core_init
+       cbz     x0, register_fail
+
++register_16550:
+       mov     x0, x6
+       mov     x30, x7
+       finish_console_register 16550 putc=1, getc=1, flush=1
+diff --git a/include/drivers/ti/uart/uart_16550.h
b/include/drivers/ti/uart/uart_16550.h
+index 32e38f0ac..2b95fa33a 100644
+--- a/include/drivers/ti/uart/uart_16550.h
++++ b/include/drivers/ti/uart/uart_16550.h
+@@ -87,6 +87,11 @@ typedef struct {
+  * framework. The |console| pointer must point to storage that will be valid
+  * for the lifetime of the console, such as a global or static local variable.
+  * Its contents will be reinitialized from scratch.
++ * When |clock| has a value of 0, the UART will *not* be initialised. This
++ * means the UART should already be enabled and the baudrate and clock setup
++ * should have been done already, either by platform specific code or by
++ * previous firmware stages. The |baud| parameter will be ignored in this
++ * case as well.
+  */
+ int console_16550_register(uintptr_t baseaddr, uint32_t clock, uint32_t baud,
+                          console_16550_t *console);
+--
+2.16.4
+
diff --git a/recipes-bsp/arm-trusted-firmware/files/0002-plat-rpi4-Skip-UART-initialisation.patch
b/recipes-bsp/arm-trusted-firmware/files/0002-plat-rpi4-Skip-UART-initialisation.patch
new file mode 100644
index 0000000..56cac70
--- /dev/null
+++ b/recipes-bsp/arm-trusted-firmware/files/0002-plat-rpi4-Skip-UART-initialisation.patch
@@ -0,0 +1,109 @@
+From 0ea846120c1df90cf8cf29ab3f664cf7e3eabc22 Mon Sep 17 00:00:00 2001
+From: Andre Przywara <andre.przywara@arm.com>
+Date: Thu, 12 Dec 2019 16:31:11 +0000
+Subject: [PATCH 2/3] plat: rpi4: Skip UART initialisation
+
+So far we have seen two different clock setups for the Raspberry Pi 4
+board, with the VPU clock divider being different. This was handled by
+reading the divider register and adjusting the base clock rate
+accordingly.
+Recently a new GPU firmware version appeared that changed the clock rate
+*again*, though this time at a higher level, so the VPU rate (and the
+apparent PLLC parent clock) did not seem to change, judging by reading
+the clock registers.
+So rather than playing cat and mouse with the GPU firmware or going
+further down the rabbit hole of exploring the whole clock tree, let's
+just skip the baud rate programming altogether. This works because the
+GPU firmware actually sets up and programs the debug UART already, so
+we can just use it.
+
+Pass 0 as the base clock rate to let the console driver skip the setup,
+also remove the no longer needed clock code.
+
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+Change-Id: Ica88a3f3c9c11059357c1e6dd8f7a4d9b1f98fd7
+---
+ plat/rpi/rpi4/aarch64/plat_helpers.S |  4 ++--
+ plat/rpi/rpi4/include/rpi_hw.h       |  8 --------
+ plat/rpi/rpi4/rpi4_bl31_setup.c      | 16 +++++-----------
+ 3 files changed, 7 insertions(+), 21 deletions(-)
+
+diff --git a/plat/rpi/rpi4/aarch64/plat_helpers.S
b/plat/rpi/rpi4/aarch64/plat_helpers.S
+index 46073b791..083c30e71 100644
+--- a/plat/rpi/rpi4/aarch64/plat_helpers.S
++++ b/plat/rpi/rpi4/aarch64/plat_helpers.S
+@@ -136,8 +136,8 @@ endfunc platform_mem_init
+        */
+ func plat_crash_console_init
+       mov_imm x0, PLAT_RPI3_UART_BASE
+-      mov_imm x1, PLAT_RPI4_VPU_CLK_RATE
+-      mov_imm x2, PLAT_RPI3_UART_BAUDRATE
++      mov     x1, xzr
++      mov     x2, xzr
+       b       console_16550_core_init
+ endfunc plat_crash_console_init
+
+diff --git a/plat/rpi/rpi4/include/rpi_hw.h b/plat/rpi/rpi4/include/rpi_hw.h
+index ed367ee20..b1dd4e92e 100644
+--- a/plat/rpi/rpi4/include/rpi_hw.h
++++ b/plat/rpi/rpi4/include/rpi_hw.h
+@@ -58,13 +58,6 @@
+  */
+ #define RPI3_PM_RSTS_WRCFG_HALT               U(0x00000555)
+
+-/*
+- * Clock controller
+- */
+-#define RPI4_IO_CLOCK_OFFSET          ULL(0x00101000)
+-#define RPI4_CLOCK_BASE                       (RPI_IO_BASE +
RPI4_IO_CLOCK_OFFSET)
+-#define RPI4_VPU_CLOCK_DIVIDER                ULL(0x0000000c)
+-
+ /*
+  * Hardware random number generator.
+  */
+@@ -88,7 +81,6 @@
+  */
+ #define RPI3_IO_MINI_UART_OFFSET      ULL(0x00215040)
+ #define RPI3_MINI_UART_BASE           (RPI_IO_BASE + RPI3_IO_MINI_UART_OFFSET)
+-#define PLAT_RPI4_VPU_CLK_RATE                ULL(1000000000)
+
+ /*
+  * GPIO controller
+diff --git a/plat/rpi/rpi4/rpi4_bl31_setup.c b/plat/rpi/rpi4/rpi4_bl31_setup.c
+index 53ab0c2e2..9e3b53979 100644
+--- a/plat/rpi/rpi4/rpi4_bl31_setup.c
++++ b/plat/rpi/rpi4/rpi4_bl31_setup.c
+@@ -119,8 +119,6 @@ void bl31_early_platform_setup2(u_register_t
arg0, u_register_t arg1,
+                               u_register_t arg2, u_register_t arg3)
+
+ {
+-      uint32_t div_reg;
+-
+       /*
+        * LOCAL_CONTROL:
+        * Bit 9 clear: Increment by 1 (vs. 2).
+@@ -136,16 +134,12 @@ void bl31_early_platform_setup2(u_register_t
arg0, u_register_t arg1,
+
+       /*
+        * Initialize the console to provide early debug support.
+-       * Different GPU firmware revisions set up the VPU divider differently,
+-       * so read the actual divider register to learn the UART base clock
+-       * rate. The divider is encoded as a 12.12 fixed point number, but we
+-       * just care about the integer part of it.
++       * We rely on the GPU firmware to have initialised the UART correctly,
++       * as the baud base clock rate differs across GPU firmware revisions.
++       * Providing a base clock of 0 lets the 16550 UART init routine skip
++       * the initial enablement and baud rate setup.
+        */
+-      div_reg = mmio_read_32(RPI4_CLOCK_BASE + RPI4_VPU_CLOCK_DIVIDER);
+-      div_reg = (div_reg >> 12) & 0xfff;
+-      if (div_reg == 0)
+-              div_reg = 1;
+-      rpi3_console_init(PLAT_RPI4_VPU_CLK_RATE / div_reg);
++      rpi3_console_init(0);
+
+       bl33_image_ep_info.pc = plat_get_ns_image_entrypoint();
+       bl33_image_ep_info.spsr = rpi3_get_spsr_for_bl33_entry();
+--
+2.16.4
+
diff --git a/recipes-bsp/arm-trusted-firmware/files/0003-rpi3-4-Add-support-for-offlining-CPUs.patch
b/recipes-bsp/arm-trusted-firmware/files/0003-rpi3-4-Add-support-for-offlining-CPUs.patch
new file mode 100644
index 0000000..02d0440
--- /dev/null
+++ b/recipes-bsp/arm-trusted-firmware/files/0003-rpi3-4-Add-support-for-offlining-CPUs.patch
@@ -0,0 +1,47 @@
+From 6368eab6c5129f4ee6679a2daa6f0d5315cfd655 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Sun, 8 Dec 2019 20:48:46 +0100
+Subject: [PATCH 3/3] rpi3/4: Add support for offlining CPUs
+
+The hooks were populated but the power down left the CPU in limbo-land.
+What we need to do - until there is a way to actually power off - is to
+turn off the MMU and enter the spinning loop as if we were cold-booted.
+This allows the on-call to pick up the CPU again.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+Change-Id: Iefc7a58424e3578ad3dd355a7bd6eaba4b412699
+---
+ plat/rpi/common/rpi3_pm.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/plat/rpi/common/rpi3_pm.c b/plat/rpi/common/rpi3_pm.c
+index 8c2d070c4..2a6bf076b 100644
+--- a/plat/rpi/common/rpi3_pm.c
++++ b/plat/rpi/common/rpi3_pm.c
+@@ -123,6 +123,15 @@ static void rpi3_pwr_domain_off(const
psci_power_state_t *target_state)
+ #endif
+ }
+
++void __dead2 plat_secondary_cold_boot_setup(void);
++
++static void __dead2
++rpi3_pwr_domain_pwr_down_wfi(const psci_power_state_t *target_state)
++{
++      disable_mmu_el3();
++      plat_secondary_cold_boot_setup();
++}
++
+ /*******************************************************************************
+  * Platform handler called when a power domain is about to be turned on. The
+  * mpidr determines the CPU to be turned on.
+@@ -224,6 +233,7 @@ static void __dead2 rpi3_system_off(void)
+ static const plat_psci_ops_t plat_rpi3_psci_pm_ops = {
+       .cpu_standby = rpi3_cpu_standby,
+       .pwr_domain_off = rpi3_pwr_domain_off,
++      .pwr_domain_pwr_down_wfi = rpi3_pwr_domain_pwr_down_wfi,
+       .pwr_domain_on = rpi3_pwr_domain_on,
+       .pwr_domain_on_finish = rpi3_pwr_domain_on_finish,
+       .system_off = rpi3_system_off,
+--
+2.16.4
+
diff --git a/recipes-bsp/arm-trusted-firmware/files/rpi-rules
b/recipes-bsp/arm-trusted-firmware/files/rpi-rules
new file mode 100644
index 0000000..abb65be
--- /dev/null
+++ b/recipes-bsp/arm-trusted-firmware/files/rpi-rules
@@ -0,0 +1,23 @@
+#!/usr/bin/make -f
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+ifneq ($(DEB_BUILD_GNU_TYPE),$(DEB_HOST_GNU_TYPE))
+export CROSS_COMPILE=$(DEB_HOST_GNU_TYPE)-
+endif
+
+PARALLEL_BUILD=-j $(shell echo $$(($$(nproc) * 2)))
+
+override_dh_auto_build:
+       CFLAGS= LDFLAGS= $(MAKE) $(PARALLEL_BUILD) PLAT=rpi4
+
+%:
+       dh $@
diff --git a/recipes-bsp/trusted-firmware-a/files/0001-plat-marvell-armada-Add-missing-dependency-of-mrvl_f.patch
b/recipes-bsp/trusted-firmware-a/files/0001-plat-marvell-armada-Add-missing-dependency-of-mrvl_f.patch
deleted file mode 100644
index 45491c1..0000000
--- a/recipes-bsp/trusted-firmware-a/files/0001-plat-marvell-armada-Add-missing-dependency-of-mrvl_f.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 389e7aa2c97c0faa79d59dbf8fce1394db05cb62 Mon Sep 17 00:00:00 2001
-From: Jan Kiszka <jan.kiszka@siemens.com>
-Date: Thu, 13 May 2021 10:48:22 +0200
-Subject: [PATCH] plat/marvell/armada: Add missing dependency of mrvl_flash
-
-Allows building only this target.
-
-Not for upstream, they fixed this implicitly while refactoring the
-build.
-
-Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
-Change-Id: I4901fa238a29842e03e34d0e0cb52816eea39183
----
- plat/marvell/armada/a8k/common/a8k_common.mk | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/plat/marvell/armada/a8k/common/a8k_common.mk
b/plat/marvell/armada/a8k/common/a8k_common.mk
-index c8273265e..9ac86a117 100644
---- a/plat/marvell/armada/a8k/common/a8k_common.mk
-+++ b/plat/marvell/armada/a8k/common/a8k_common.mk
-@@ -160,8 +160,7 @@ ${DOIMAGETOOL}: mrvl_clean
-       @$(DOIMAGE_LIBS_CHECK)
-       ${Q}${MAKE} --no-print-directory -C ${DOIMAGEPATH}
-
--mrvl_flash: ${BUILD_PLAT}/${FIP_NAME} ${DOIMAGETOOL} ${BUILD_PLAT}/ble.bin
-+mrvl_flash: ${BUILD_PLAT}/${FIP_NAME} ${DOIMAGETOOL}
${BUILD_PLAT}/ble.bin ${BUILD_PLAT}/bl1.bin
-       $(shell truncate -s %128K ${BUILD_PLAT}/bl1.bin)
-       $(shell cat ${BUILD_PLAT}/bl1.bin ${BUILD_PLAT}/${FIP_NAME} >
${BUILD_PLAT}/${BOOT_IMAGE})
-       ${DOIMAGETOOL} ${DOIMAGE_FLAGS} ${BUILD_PLAT}/${BOOT_IMAGE}
${BUILD_PLAT}/${FLASH_IMAGE}
--
---
-2.26.2
-
diff --git a/recipes-bsp/trusted-firmware-a/files/0001-rpi-Use-common-memreserve-pattern-for-rpi3-and-rpi4.patch
b/recipes-bsp/trusted-firmware-a/files/0001-rpi-Use-common-memreserve-pattern-for-rpi3-and-rpi4.patch
deleted file mode 100644
index fe7ac43..0000000
--- a/recipes-bsp/trusted-firmware-a/files/0001-rpi-Use-common-memreserve-pattern-for-rpi3-and-rpi4.patch
+++ /dev/null
@@ -1,214 +0,0 @@
-From 84bb39be8756f655e3882bbe529ac9921525fdb5 Mon Sep 17 00:00:00 2001
-From: Jan Kiszka <jan.kiszka@siemens.com>
-Date: Mon, 22 Mar 2021 19:58:58 +0100
-Subject: [PATCH] rpi: Use common memreserve pattern for rpi3 and rpi4
-
-This fixes the issue that recent kernels already have a memreserve for
-the startup stubs at address 0 and dislike adding another reservation at
-the same address.
-
-Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
-Change-Id: I275194ba59405728f1a7913cb0fea0d02e75fc50
----
- plat/rpi/common/include/rpi_shared.h |  2 +
- plat/rpi/common/rpi3_common.c        | 62 ++++++++++++++++++++++++
- plat/rpi/rpi3/rpi3_bl31_setup.c      | 70 +---------------------------
- plat/rpi/rpi4/rpi4_bl31_setup.c      |  3 +-
- 4 files changed, 66 insertions(+), 71 deletions(-)
-
-diff --git a/plat/rpi/common/include/rpi_shared.h
b/plat/rpi/common/include/rpi_shared.h
-index ddf239eb5..858bff2eb 100644
---- a/plat/rpi/common/include/rpi_shared.h
-+++ b/plat/rpi/common/include/rpi_shared.h
-@@ -38,4 +38,6 @@ int rpi3_vc_hardware_get_board_revision(uint32_t *revision);
-
- int plat_rpi_get_model(void);
-
-+void rpi3_dtb_add_mem_rsv(void *dtb, uint64_t rsc_base, uint64_t rsv_size);
-+
- #endif /* RPI3_PRIVATE_H */
-diff --git a/plat/rpi/common/rpi3_common.c b/plat/rpi/common/rpi3_common.c
-index ef88bf10e..77cd90b8b 100644
---- a/plat/rpi/common/rpi3_common.c
-+++ b/plat/rpi/common/rpi3_common.c
-@@ -6,6 +6,8 @@
-
- #include <assert.h>
-
-+#include <libfdt.h>
-+
- #include <platform_def.h>
-
- #include <arch_helpers.h>
-@@ -245,3 +247,63 @@ uint32_t plat_interrupt_type_to_line(uint32_t
type, uint32_t security_state)
-       /* Secure interrupts are signalled on the FIQ line always. */
-       return  __builtin_ctz(SCR_FIQ_BIT);
- }
-+
-+#if defined(RPI3_PRELOADED_DTB_BASE) || PLAT == rpi4
-+void rpi3_dtb_add_mem_rsv(void *dtb, uint64_t rsv_base, uint64_t rsv_size)
-+{
-+      int i, regions, rc;
-+      uint64_t addr, size;
-+
-+      INFO("rpi3: Checking DTB...\n");
-+
-+      /* Return if no device tree is detected */
-+      if (fdt_check_header(dtb) != 0)
-+              return;
-+
-+      regions = fdt_num_mem_rsv(dtb);
-+
-+      VERBOSE("rpi3: Found %d mem reserve region(s)\n", regions);
-+
-+      /* We expect to find one reserved region that we can modify */
-+      if (regions < 1)
-+              return;
-+
-+      /*
-+       * Look for the region that corresponds to the default boot firmware. It
-+       * starts at address 0, and it is not needed when the default firmware
-+       * is replaced by this port of the Trusted Firmware.
-+       */
-+      for (i = 0; i < regions; i++) {
-+              if (fdt_get_mem_rsv(dtb, i, &addr, &size) != 0)
-+                      continue;
-+
-+              if (addr != 0x0)
-+                      continue;
-+
-+              VERBOSE("rpi3: Firmware mem reserve region found\n");
-+
-+              rc = fdt_del_mem_rsv(dtb, i);
-+              if (rc != 0) {
-+                      INFO("rpi3: Can't remove mem reserve region
(%d)\n", rc);
-+              }
-+
-+              break;
-+      }
-+
-+      if (i == regions) {
-+              VERBOSE("rpi3: Firmware mem reserve region not found\n");
-+      }
-+
-+      /*
-+       * Reserve all SRAM. As said in the documentation, this isn't actually
-+       * secure memory, so it is needed to tell BL33 that this is a reserved
-+       * memory region. It doesn't guarantee it won't use it, though.
-+       */
-+      rc = fdt_add_mem_rsv(dtb, rsv_base, rsv_size);
-+      if (rc != 0) {
-+              WARN("rpi3: Can't add mem reserve region (%d)\n", rc);
-+      }
-+
-+      INFO("rpi3: Reserved 0x%llx - 0x%llx in DTB\n", rsv_base,
rsv_base + rsv_size);
-+}
-+#endif
-diff --git a/plat/rpi/rpi3/rpi3_bl31_setup.c b/plat/rpi/rpi3/rpi3_bl31_setup.c
-index 59157536b..959694e77 100644
---- a/plat/rpi/rpi3/rpi3_bl31_setup.c
-+++ b/plat/rpi/rpi3/rpi3_bl31_setup.c
-@@ -6,8 +6,6 @@
-
- #include <assert.h>
-
--#include <libfdt.h>
--
- #include <platform_def.h>
-
- #include <common/bl_common.h>
-@@ -151,76 +149,10 @@ void bl31_plat_arch_setup(void)
-       enable_mmu_el3(0);
- }
-
--#ifdef RPI3_PRELOADED_DTB_BASE
--/*
-- * Add information to the device tree (if any) about the reserved DRAM used by
-- * the Trusted Firmware.
-- */
--static void rpi3_dtb_add_mem_rsv(void)
--{
--      int i, regions, rc;
--      uint64_t addr, size;
--      void *dtb = (void *)RPI3_PRELOADED_DTB_BASE;
--
--      INFO("rpi3: Checking DTB...\n");
--
--      /* Return if no device tree is detected */
--      if (fdt_check_header(dtb) != 0)
--              return;
--
--      regions = fdt_num_mem_rsv(dtb);
--
--      VERBOSE("rpi3: Found %d mem reserve region(s)\n", regions);
--
--      /* We expect to find one reserved region that we can modify */
--      if (regions < 1)
--              return;
--
--      /*
--       * Look for the region that corresponds to the default boot firmware. It
--       * starts at address 0, and it is not needed when the default firmware
--       * is replaced by this port of the Trusted Firmware.
--       */
--      for (i = 0; i < regions; i++) {
--              if (fdt_get_mem_rsv(dtb, i, &addr, &size) != 0)
--                      continue;
--
--              if (addr != 0x0)
--                      continue;
--
--              VERBOSE("rpi3: Firmware mem reserve region found\n");
--
--              rc = fdt_del_mem_rsv(dtb, i);
--              if (rc != 0) {
--                      INFO("rpi3: Can't remove mem reserve region
(%d)\n", rc);
--              }
--
--              break;
--      }
--
--      if (i == regions) {
--              VERBOSE("rpi3: Firmware mem reserve region not found\n");
--      }
--
--      /*
--       * Reserve all SRAM. As said in the documentation, this isn't actually
--       * secure memory, so it is needed to tell BL33 that this is a reserved
--       * memory region. It doesn't guarantee it won't use it, though.
--       */
--      rc = fdt_add_mem_rsv(dtb, SEC_SRAM_BASE, SEC_SRAM_SIZE);
--      if (rc != 0) {
--              WARN("rpi3: Can't add mem reserve region (%d)\n", rc);
--      }
--
--      INFO("rpi3: Reserved 0x%llx - 0x%llx in DTB\n", SEC_SRAM_BASE,
--           SEC_SRAM_BASE + SEC_SRAM_SIZE);
--}
--#endif
--
- void bl31_platform_setup(void)
- {
- #ifdef RPI3_PRELOADED_DTB_BASE
-       /* Only modify a DTB if we know where to look for it */
--      rpi3_dtb_add_mem_rsv();
-+      rpi3_dtb_add_mem_rsv((void *)RPI3_PRELOADED_DTB_BASE,
SEC_SRAM_BASE, SEC_SRAM_SIZE);
- #endif
- }
-diff --git a/plat/rpi/rpi4/rpi4_bl31_setup.c b/plat/rpi/rpi4/rpi4_bl31_setup.c
-index cfacd1fe1..bd3c28fef 100644
---- a/plat/rpi/rpi4/rpi4_bl31_setup.c
-+++ b/plat/rpi/rpi4/rpi4_bl31_setup.c
-@@ -228,8 +228,7 @@ static void rpi4_prepare_dtb(void)
-       }
-
-       /* Reserve memory used by Trusted Firmware. */
--      if (fdt_add_reserved_memory(dtb, "atf@0", 0, 0x80000))
--              WARN("Failed to add reserved memory nodes to DT.\n");
-+      rpi3_dtb_add_mem_rsv(dtb, 0, 0x80000);
-
-       offs = fdt_node_offset_by_compatible(dtb, 0, "arm,gic-400");
-       gic_int_prop[0] = cpu_to_fdt32(1);              // PPI
---
-2.26.2
-
diff --git a/recipes-bsp/trusted-firmware-a/files/0001-zynqmp-pm-Filter-errors-related-to-clock-gate-permis.patch
b/recipes-bsp/trusted-firmware-a/files/0001-zynqmp-pm-Filter-errors-related-to-clock-gate-permis.patch
deleted file mode 100644
index 0c4dc0b..0000000
--- a/recipes-bsp/trusted-firmware-a/files/0001-zynqmp-pm-Filter-errors-related-to-clock-gate-permis.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From e85c1473dc49acb2feb2d552c9a1bad99e2477ca Mon Sep 17 00:00:00 2001
-From: Mirela Simonovic <mirela.simonovic@aggios.com>
-Date: Fri, 24 Aug 2018 17:09:07 +0200
-Subject: [PATCH 1/2] zynqmp: pm: Filter errors related to clock gate
- permissions
-
-Linux clock framework cannot properly deal with these errors. When the
-error is related to the lack of permissions to control the clock we
-filter the error and report the success to linux. Before recent changes
-in clock framework across the stack, this was done in the PMU-FW as a
-workaround. Since the PMU-FW now handles clocks and the permissions to
-control them using general principles rather than workarounds, it can
-no longer distinguish such exceptions and it has to return no-access
-error.
-
-Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
-Acked-by: Will Wong <WILLW@xilinx.com>
-Signed-off-by: Michal Simek <michal.simek@xilinx.com>
-Change-Id: I1491a80e472f44e322a542b29a20eb1cb3319802
----
- plat/xilinx/zynqmp/pm_service/pm_api_sys.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/plat/xilinx/zynqmp/pm_service/pm_api_sys.c
b/plat/xilinx/zynqmp/pm_service/pm_api_sys.c
-index b1720d9f6..cd9d597bf 100644
---- a/plat/xilinx/zynqmp/pm_service/pm_api_sys.c
-+++ b/plat/xilinx/zynqmp/pm_service/pm_api_sys.c
-@@ -907,7 +907,13 @@ static enum pm_ret_status pm_clock_gate(unsigned
int clock_id,
-
-       /* Send request to the PMU */
-       PM_PACK_PAYLOAD2(payload, api_id, clock_id);
--      return pm_ipi_send_sync(primary_proc, payload, NULL, 0);
-+      status = pm_ipi_send_sync(primary_proc, payload, NULL, 0);
-+
-+      /* If action fails due to the lack of permissions filter the error */
-+      if (status == PM_RET_ERROR_ACCESS)
-+              status = PM_RET_SUCCESS;
-+
-+      return status;
- }
-
- /**
---
-2.26.2
-
diff --git a/recipes-bsp/trusted-firmware-a/files/0002-zynqmp-pm-update-error-codes-to-match-Linux-and-PMU-.patch
b/recipes-bsp/trusted-firmware-a/files/0002-zynqmp-pm-update-error-codes-to-match-Linux-and-PMU-.patch
deleted file mode 100644
index 52fd942..0000000
--- a/recipes-bsp/trusted-firmware-a/files/0002-zynqmp-pm-update-error-codes-to-match-Linux-and-PMU-.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 25308b199ee9bd7ba150f9482c2fc5dab4b557a3 Mon Sep 17 00:00:00 2001
-From: Davorin Mista <davorin.mista@aggios.com>
-Date: Fri, 24 Aug 2018 17:09:06 +0200
-Subject: [PATCH 2/2] zynqmp: pm: update error codes to match Linux and PMU
- Firmware
-
-All EEMI error codes start with value 2000.
-
-Note: Legacy error codes ARGS (=1) and NOTSUPPORTED (=4) returned by
-current ATF code have been left in place.
-
-Signed-off-by: Davorin Mista <davorin.mista@aggios.com>
-Acked-by: Will Wong <WILLW@xilinx.com>
-Signed-off-by: Michal Simek <michal.simek@xilinx.com>
-Change-Id: I939afa85957cac88025d82a80f9f6dd49be993b6
----
- plat/xilinx/zynqmp/pm_service/pm_defs.h | 33 ++++++++++++++-----------
- 1 file changed, 18 insertions(+), 15 deletions(-)
-
-diff --git a/plat/xilinx/zynqmp/pm_service/pm_defs.h
b/plat/xilinx/zynqmp/pm_service/pm_defs.h
-index cae36c9d8..4776d424b 100644
---- a/plat/xilinx/zynqmp/pm_service/pm_defs.h
-+++ b/plat/xilinx/zynqmp/pm_service/pm_defs.h
-@@ -215,26 +215,29 @@ enum pm_opchar_type {
-
- /**
-  * @PM_RET_SUCCESS:           success
-- * @PM_RET_ERROR_ARGS:                illegal arguments provided
-+ * @PM_RET_ERROR_ARGS:                illegal arguments provided (deprecated)
-+ * @PM_RET_ERROR_NOTSUPPORTED:        feature not supported  (deprecated)
-+ * @PM_RET_ERROR_INTERNAL:    internal error
-+ * @PM_RET_ERROR_CONFLICT:    conflict
-  * @PM_RET_ERROR_ACCESS:      access rights violation
-+ * @PM_RET_ERROR_INVALID_NODE:        invalid node
-+ * @PM_RET_ERROR_DOUBLE_REQ:  duplicate request for same node
-+ * @PM_RET_ERROR_ABORT_SUSPEND:       suspend procedure has been aborted
-  * @PM_RET_ERROR_TIMEOUT:     timeout in communication with PMU
-- * @PM_RET_ERROR_NOTSUPPORTED:        feature not supported
-- * @PM_RET_ERROR_PROC:                node is not a processor node
-- * @PM_RET_ERROR_API_ID:      illegal API ID
-- * @PM_RET_ERROR_OTHER:               other error
-+ * @PM_RET_ERROR_NODE_USED:   node is already in use
-  */
- enum pm_ret_status {
-       PM_RET_SUCCESS,
--      PM_RET_ERROR_ARGS,
--      PM_RET_ERROR_ACCESS,
--      PM_RET_ERROR_TIMEOUT,
--      PM_RET_ERROR_NOTSUPPORTED,
--      PM_RET_ERROR_PROC,
--      PM_RET_ERROR_API_ID,
--      PM_RET_ERROR_FAILURE,
--      PM_RET_ERROR_COMMUNIC,
--      PM_RET_ERROR_DOUBLEREQ,
--      PM_RET_ERROR_OTHER,
-+      PM_RET_ERROR_ARGS = 1,
-+      PM_RET_ERROR_NOTSUPPORTED = 4,
-+      PM_RET_ERROR_INTERNAL = 2000,
-+      PM_RET_ERROR_CONFLICT = 2001,
-+      PM_RET_ERROR_ACCESS = 2002,
-+      PM_RET_ERROR_INVALID_NODE = 2003,
-+      PM_RET_ERROR_DOUBLE_REQ = 2004,
-+      PM_RET_ERROR_ABORT_SUSPEND = 2005,
-+      PM_RET_ERROR_TIMEOUT = 2006,
-+      PM_RET_ERROR_NODE_USED = 2007
- };
-
- /**
---
-2.26.2
-
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.4.bb
b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.4.bb
deleted file mode 100644
index 02a9234..0000000
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.4.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2019-2020
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-require trusted-firmware-a_${PV}.inc
-
-SRC_URI += " \
-    git://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell;protocol=https;rev=${MV_DDR_REV};destsuffix=mv-ddr-marvell
\
-    git://github.com/MarvellEmbeddedProcessors/binaries-marvell;protocol=https;branch=${MV_BIN_BRANCH};rev=${MV_BIN_REV};destsuffix=binaries-marvell
\
-    file://0001-plat-marvell-armada-Add-missing-dependency-of-mrvl_f.patch \
-    "
-
-MV_DDR_REV="7c351731d19645f64d2826a47e8f4d9cd1c74db3"
-MV_BIN_BRANCH="binaries-marvell-armada-18.12"
-MV_BIN_REV="c6c529ea3d905a28cc77331964c466c3e2dc852e"
-
-DEPENDS += "u-boot-macchiatobin"
-DEBIAN_BUILD_DEPENDS = "u-boot-macchiatobin, libssl-dev:native"
-
-TF_A_PLATFORM = "a80x0_mcbin"
-TF_A_EXTRA_BUILDARGS = " \
-    USE_COHERENT_MEM=0 \
-    MV_DDR_PATH=../mv-ddr-marvell \
-    SCP_BL2=../binaries-marvell/mrvl_scp_bl2.img \
-    BL33=/usr/lib/u-boot/macchiatobin/u-boot.bin \
-    mrvl_flash"
-TF_A_BINARIES = "release/flash-image.bin"
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-pine64-plus_2.4.bb
b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-pine64-plus_2.4.bb
deleted file mode 100644
index 9b27cab..0000000
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-pine64-plus_2.4.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2019-2020
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-require trusted-firmware-a_${PV}.inc
-
-TF_A_PLATFORM = "sun50i_a64"
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.4.bb
b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.4.bb
deleted file mode 100644
index 98d6904..0000000
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.4.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2019-2020
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-require trusted-firmware-a_${PV}.inc
-
-SRC_URI += " \
-    file://0001-rpi-Use-common-memreserve-pattern-for-rpi3-and-rpi4.patch"
-
-TF_A_PLATFORM = "rpi4"
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.4.bb
b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.4.bb
deleted file mode 100644
index 5d82d0a..0000000
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.4.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2019-2020
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-require trusted-firmware-a_${PV}.inc
-
-SRC_URI += " \
-    file://0001-zynqmp-pm-Filter-errors-related-to-clock-gate-permis.patch \
-    file://0002-zynqmp-pm-update-error-codes-to-match-Linux-and-PMU-.patch \
-    "
-
-TF_A_NAME = "ultra96"
-TF_A_PLATFORM = "zynqmp"
-TF_A_EXTRA_BUILDARGS = "RESET_TO_BL31=1 ZYNQMP_CONSOLE=cadence1"
-TF_A_BINARIES = "release/bl31/bl31.elf"
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.inc
b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.inc
deleted file mode 100644
index bd1e48e..0000000
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2019-2021
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-require recipes-bsp/trusted-firmware-a/trusted-firmware-a-custom.inc
-
-SRC_URI += "https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/snapshot/trusted-firmware-a-${PV}.tar.gz"
-SRC_URI[sha256sum] =
"bf3eb3617a74cddd7fb0e0eacbfe38c3258ee07d4c8ed730deef7a175cc3d55b"
-
-S = "${WORKDIR}/trusted-firmware-a-${PV}"
--
2.39.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAFvH3%2B%3DZi98Cc%3DPGA9YFR58cK%2BFQFFPpN-dLjv%3D%3DHPP6r8mQxQ%40mail.gmail.com.
