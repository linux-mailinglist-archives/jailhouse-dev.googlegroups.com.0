Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4M2T2CQMGQES7B3IGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2016738C50F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:37:38 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id s23-20020a1977170000b02901fc6bd7b408sf5036868lfc.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:37:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593457; cv=pass;
        d=google.com; s=arc-20160816;
        b=uS5djEMCd0mpHYU1ZL5xGdqkIHpuIzJgTHrKjpWqNO7oYdX2/UvDOnFuI0g/5mlj9j
         6+uvat4w0+P3BRhIPgNEM26NQcsqC0A4TATdA/HIuD2dVhE5DJoIzFN1UO7gCqFufz41
         OXgCc6bRS5r+dJF/7lOb4cBVrJaVKbkqERrxUXOG6gNp5aR40eGw4hZt1TGlrLnwaG0a
         XaN45Y1/GNPTuYNimGjagGlsfac3VhUJfMtut+NRdrU3E4VsTHleoxDkWd9aJkvcj5rT
         UoNNMhMU9FjERsdsdYYzwNUQYYPsarcENli4AQ9Y8ddZ3POqjdsPQ2QTACOJsbAL7ej/
         nccg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=YOdraqVwcUhKoqcNnpGFcBKnZtyixHK4PG6N2IB9jf4=;
        b=CJ1CuGhhl/K/qjemgh7Mh4jrI+Jh8Yq+YsqAHfEfE2gzgMpKjTsdF1lRox4NAj31sa
         xL4P59Z11oxnUNoUEBYwn2qER1fIfP2qO/DMMlX2abvbIrEoZJPwzfCu/Edik97SWDK+
         8H6pUNIgEG5gfjvrFWW6Sl+EfZDok5G0sv3M8vd/wXT2VhgeHJe8jrpLfl0mlp/ll2rA
         80ton20TR8V4WdfLQRX/9PwO4ZdizyLFZOwowQ9BlhNu8saxNMwwqO0FXQBQ8szDoLW9
         GmnBye0z/cq+AtmSQAYiM+QrSdPTEHEreFUJcfeJe5s0v5U1bxow+asxkrUjxWokcYZm
         GTMA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YOdraqVwcUhKoqcNnpGFcBKnZtyixHK4PG6N2IB9jf4=;
        b=YVEYIWzNFki7R9NieT6X0AVXVF7xpa9vVj5TwMwhAizSde3LBUHcSi1onEHYxRdoWo
         R59xaHdD053WPrdpiPGj9BrNGQicC6E0wvo6YPT21oADXGV8Bnfe+jLTVUvVjgO1g5cv
         ZG5xWmfDq1V9fb0t1GSU6UgAghBKmL6gDJmxKX+KDY/3z5otgqR96XRgR8PqfPOffjHh
         Aw3vHpFZ2wxnfw3Uc8/M+ppHToZFDkLneQaJCT9kku2F3P18CLbzfIi3+c32Kfcze3Xm
         2eQ2quJ9sgbPAzrezZu600sUYdAKpg0DcRaijQeMB3Jm5x4RiPzZbNoMgS6pj5T3ylI7
         I2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YOdraqVwcUhKoqcNnpGFcBKnZtyixHK4PG6N2IB9jf4=;
        b=N3pWmJO/e18rwz7yAW3AMuPKO4l2vBlkmyUIs7wdMcI5DCWQed1mKeyJWZInznzxhA
         Or35tc+j8OwDkdxRiwQcLlCjf8aGuey5eDv8qWQZyvzK6WnrIco9kH4ycftAU92HyetJ
         wzIBPN+hcPIp2fbf99fphd29YHshXPFm+0x15OamNwXg//xlARJJMfClo30zAoGWZLn/
         dZC7Ruf/DGbXWHzA9zBGzPpbLEFq96mvpmRR4hStvY2ieH0XPMHtqi0axJr8OMwpSSuZ
         3dPc3pgCMqF5AfuFOCZbzyKmF20lP7+6yvMq8iS1a9QW7YUZUY7U89tZ6pIWhI5beuP3
         bFEA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Auwx9/8i6hh+oQEhCZaLgy2IE8xYe/MLnS0dcYUGa3gSz9b2c
	kz0pEqnLnp1Ump/XUg8f4Dw=
X-Google-Smtp-Source: ABdhPJxkxw8WaN9gnsv7tMkMHR6lAZy5fbLzR4Rb4wgm1H3xob7b36MwXZfO4eZ9NxuSIHXsYz/NAQ==
X-Received: by 2002:a05:6512:3ba5:: with SMTP id g37mr1781264lfv.453.1621593457596;
        Fri, 21 May 2021 03:37:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f94:: with SMTP id x20ls323961lfa.0.gmail; Fri, 21
 May 2021 03:37:36 -0700 (PDT)
X-Received: by 2002:a19:5018:: with SMTP id e24mr935135lfb.608.1621593456268;
        Fri, 21 May 2021 03:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593456; cv=none;
        d=google.com; s=arc-20160816;
        b=TTSFUgwAN0VLE/r4dY1B1b8sxqkegLEhO4gqqIsYvD95Tv3DjmVOfWkB5lIYcbcZHI
         nYPuUsqk2BaWTPbmBVZ/loy3WXLoapkn9Uud7aEMSrVqkylXOPIaPosESCJULzwYsG7e
         5dgRznuo0qe3tM/i+YRO+E5bGzN+Pn3VEV75wgYaZlgJ5WBsyQs5gv1b/UzF0H19GuVE
         SB3j75A9PBb2KsoeatfLdy08AHI0+KLD7RbgbXvTDYq1pDLExiK6539h3RPRAde8W0v/
         L4PYmMKAGJsKf6oASs0hsGr598bDui4fpfQOfRoJFnZS9djL7UpQeUumUWg0XjifPRZP
         PTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=0JCJqCIIG00JMU+YIH5zCSm/6RA4YfccBXDDwJ4NS08=;
        b=UfFI+a8R1ygpIAIPOfKXU+xuDcNJb2Ib84lwSh4oUfDpZUwgDnTRr2M4zrjru7IoxZ
         9Z2iCkBOwAkVJOJFjy0HMwnBE37AIbDbsfhklG4TvrRujSHxBmDW5C7u9tCRcWnwUf5l
         +sQ6cLC9QI9HZYYjoj/Gr3D4O1SUIIFht06PJ9AvZucLWJz6wbWPKXCeMLGD6VqCoKJi
         rbrYDQvaeR4q8DfEeHrcYG7SWTNx7sd1j54NoQki2PMbHlRH3WwzsEV50P2iAOcclQZK
         CJTwuMKePrRYMqEdX3XRJtN5Im3Mf5roea5l1S5CjGDIQtXxUsnqE/12PJhlaOKG5wwl
         AyaQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id k35si160026lfv.3.2021.05.21.03.37.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:37:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAbZnq017850
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:35 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYc6032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:35 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 01/22] Update Isar revision
Date: Fri, 21 May 2021 12:37:13 +0200
Message-Id: <2081733cde49420cbc8e6e87a05376550f8f7757.1621593454.git.jan.kiszka@siemens.com>
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

TF-A patch is upstream, time to update. For that, we need to tune
TF_A_BINARIES, switch to DEBIAN_BUILD_DEPENDS in u-boot recipes and set
DISTRO_APT_SOURCES.

Isar renamed the deployed kernel image of arm64, so we need to account
for differences now.

Then Isar now forwards wic warnings. So we need to add an empty
bootloader line to the rpi4 wks file to avoid (harmless) complaints.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/distro/jailhouse-demo.conf               |   2 +
 ...de-for-building-custom-Trusted-Firmw.patch | 127 ------------------
 kas.yml                                       |   8 +-
 .../trusted-firmware-a-macchiatobin_2.3.bb    |   2 +-
 .../trusted-firmware-a-ultra96_2.3.bb         |   2 +-
 .../u-boot/u-boot-pine64-plus_2020.10.bb      |   2 +-
 .../u-boot/u-boot-ultra96-v1_2020.10.bb       |   2 +-
 .../files/.bash_history-espressobin           |   2 +-
 .../files/.bash_history-hikey620              |   2 +-
 .../files/.bash_history-macchiatobin          |   2 +-
 .../files/.bash_history-pine64-plus           |   2 +-
 .../files/.bash_history-qemu-arm64            |   2 +-
 .../customizations/files/.bash_history-rpi4   |   2 +-
 .../files/.bash_history-ultra96-v1            |   2 +-
 start-qemu.sh                                 |   4 +-
 wic/rpi4.wks                                  |   3 +
 16 files changed, 21 insertions(+), 145 deletions(-)
 delete mode 100644 isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch

diff --git a/conf/distro/jailhouse-demo.conf b/conf/distro/jailhouse-demo.conf
index 9f0aa92..032efe3 100644
--- a/conf/distro/jailhouse-demo.conf
+++ b/conf/distro/jailhouse-demo.conf
@@ -11,6 +11,8 @@
 
 require conf/distro/debian-buster.conf
 
+DISTRO_APT_SOURCES = "conf/distro/debian-buster.list"
+
 KERNEL_NAME ?= "jailhouse"
 
 WKS_FILE ?= "${MACHINE}.wks"
diff --git a/isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch b/isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch
deleted file mode 100644
index 72b089f..0000000
--- a/isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From 6754548019e02c1dbf0d336d06dd14508eb1684c Mon Sep 17 00:00:00 2001
-From: Jan Kiszka <jan.kiszka@siemens.com>
-Date: Sun, 27 Sep 2020 12:08:45 +0200
-Subject: [PATCH] Add recipe include for building custom Trusted Firmware A
-
-Analogously to U-Boot, this adds an include file to be used in custom
-TF-A recipes. The typical customization points are TF_A_PLATFORM and
-possibly a couple of TF_A_EXTRA_BUILDARGS. The to-be-packaged binaries
-can be defined via TF_A_BINARIES.
-
-Debian has a binary package called "arm-trusted-firmware", targeting a
-couple of sunxi boards. We do not follow that legacy naming by intention
-and rather use the new official one. Debian will probably follow at some
-point.
-
-Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
----
- .../trusted-firmware-a/files/debian/compat    |  1 +
- .../files/debian/control.tmpl                 | 10 +++++
- .../trusted-firmware-a/files/debian/rules     | 19 ++++++++
- .../trusted-firmware-a-custom.inc             | 43 +++++++++++++++++++
- 4 files changed, 73 insertions(+)
- create mode 100644 meta/recipes-bsp/trusted-firmware-a/files/debian/compat
- create mode 100644 meta/recipes-bsp/trusted-firmware-a/files/debian/control.tmpl
- create mode 100755 meta/recipes-bsp/trusted-firmware-a/files/debian/rules
- create mode 100644 meta/recipes-bsp/trusted-firmware-a/trusted-firmware-a-custom.inc
-
-diff --git a/meta/recipes-bsp/trusted-firmware-a/files/debian/compat b/meta/recipes-bsp/trusted-firmware-a/files/debian/compat
-new file mode 100644
-index 00000000..f599e28b
---- /dev/null
-+++ b/meta/recipes-bsp/trusted-firmware-a/files/debian/compat
-@@ -0,0 +1 @@
-+10
-diff --git a/meta/recipes-bsp/trusted-firmware-a/files/debian/control.tmpl b/meta/recipes-bsp/trusted-firmware-a/files/debian/control.tmpl
-new file mode 100644
-index 00000000..7ffd189d
---- /dev/null
-+++ b/meta/recipes-bsp/trusted-firmware-a/files/debian/control.tmpl
-@@ -0,0 +1,10 @@
-+Source: ${PN}
-+Section: admin
-+Priority: optional
-+Standards-Version: 3.9.6
-+Build-Depends: ${DEBIAN_BUILD_DEPENDS}
-+Maintainer: ISAR project <isar-users@googlegroups.com>
-+
-+Package: trusted-firmware-a-${TF_A_NAME}
-+Architecture: ${DISTRO_ARCH}
-+Description: ${DESCRIPTION}, firmware binaries
-diff --git a/meta/recipes-bsp/trusted-firmware-a/files/debian/rules b/meta/recipes-bsp/trusted-firmware-a/files/debian/rules
-new file mode 100755
-index 00000000..70e1dd66
---- /dev/null
-+++ b/meta/recipes-bsp/trusted-firmware-a/files/debian/rules
-@@ -0,0 +1,19 @@
-+#!/usr/bin/make -f
-+
-+# Debian rules for custom Trusted Firmware A build
-+#
-+# This software is a part of ISAR.
-+# Copyright (c) Siemens AG, 2020
-+#
-+# SPDX-License-Identifier: MIT
-+
-+ifneq ($(DEB_BUILD_GNU_TYPE),$(DEB_HOST_GNU_TYPE))
-+export CROSS_COMPILE=$(DEB_HOST_GNU_TYPE)-
-+endif
-+
-+override_dh_auto_build:
-+	CFLAGS= LDFLAGS= $(MAKE) $(PARALLEL_MAKE) PLAT=$(TF_A_PLATFORM) \
-+		$(TF_A_EXTRA_BUILDARGS)
-+
-+%:
-+	dh $@
-diff --git a/meta/recipes-bsp/trusted-firmware-a/trusted-firmware-a-custom.inc b/meta/recipes-bsp/trusted-firmware-a/trusted-firmware-a-custom.inc
-new file mode 100644
-index 00000000..a065ce71
---- /dev/null
-+++ b/meta/recipes-bsp/trusted-firmware-a/trusted-firmware-a-custom.inc
-@@ -0,0 +1,43 @@
-+# Custom Trusted Firmware A build
-+#
-+# This software is a part of ISAR.
-+# Copyright (c) Siemens AG, 2020
-+#
-+# SPDX-License-Identifier: MIT
-+
-+inherit dpkg
-+
-+FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/files:"
-+
-+SRC_URI += "file://debian/"
-+
-+DESCRIPTION ?= "Custom Trusted Firmware A"
-+
-+TF_A_NAME ?= "${MACHINE}"
-+TF_A_PLATFORM ?= "unknown"
-+TF_A_EXTRA_BUILDARGS ?= ""
-+TF_A_BINARIES ?= "bl31.bin"
-+
-+DEBIAN_BUILD_DEPENDS ?= ""
-+
-+PROVIDES += "trusted-firmware-a-${TF_A_NAME}"
-+
-+TEMPLATE_FILES = "debian/control.tmpl"
-+TEMPLATE_VARS += "TF_A_NAME DEBIAN_BUILD_DEPENDS"
-+
-+do_prepare_build() {
-+    cp -r ${WORKDIR}/debian ${S}/
-+
-+    deb_add_changelog
-+
-+    rm -f ${S}/debian/trusted-firmware-a-${TF_A_NAME}.install
-+    for binary in ${TF_A_BINARIES}; do
-+        echo "build/${TF_A_PLATFORM}/release/$binary /usr/lib/trusted-firmware-a/${TF_A_NAME}/" >> \
-+            ${S}/debian/trusted-firmware-a-${TF_A_NAME}.install
-+    done
-+}
-+
-+dpkg_runbuild_prepend() {
-+    export TF_A_PLATFORM="${TF_A_PLATFORM}"
-+    export TF_A_EXTRA_BUILDARGS="${TF_A_EXTRA_BUILDARGS}"
-+}
--- 
-2.26.2
-
diff --git a/kas.yml b/kas.yml
index 8807257..8982373 100644
--- a/kas.yml
+++ b/kas.yml
@@ -1,7 +1,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2018-2019
+# Copyright (c) Siemens AG, 2018-2021
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -21,13 +21,9 @@ repos:
 
   isar:
     url: https://github.com/ilbers/isar
-    refspec: 93658f7a72679c89e14adc7bbdbf3f5d52b7ac0d
+    refspec: dbb9df67c1321aa7f6020948a964a2bcf636684a
     layers:
       meta:
-    patches:
-      tf-a:
-        path: isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch
-        repo: jailhouse
 
 bblayers_conf_header:
   standard: |
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.3.bb b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.3.bb
index 2df79c3..d5dced9 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.3.bb
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.3.bb
@@ -31,4 +31,4 @@ TF_A_EXTRA_BUILDARGS = " \
     SCP_BL2=../binaries-marvell/mrvl_scp_bl2.img \
     BL33=/usr/lib/u-boot/macchiatobin/u-boot.bin \
     all fip"
-TF_A_BINARIES = "flash-image.bin"
+TF_A_BINARIES = "release/flash-image.bin"
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.3.bb b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.3.bb
index 7b8b48b..d4fac2c 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.3.bb
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.3.bb
@@ -14,4 +14,4 @@ require trusted-firmware-a_${PV}.inc
 TF_A_NAME = "ultra96"
 TF_A_PLATFORM = "zynqmp"
 TF_A_EXTRA_BUILDARGS = "RESET_TO_BL31=1 ZYNQMP_CONSOLE=cadence1"
-TF_A_BINARIES = "bl31/bl31.elf"
+TF_A_BINARIES = "release/bl31/bl31.elf"
diff --git a/recipes-bsp/u-boot/u-boot-pine64-plus_2020.10.bb b/recipes-bsp/u-boot/u-boot-pine64-plus_2020.10.bb
index b813ae8..c3c1a06 100644
--- a/recipes-bsp/u-boot/u-boot-pine64-plus_2020.10.bb
+++ b/recipes-bsp/u-boot/u-boot-pine64-plus_2020.10.bb
@@ -17,7 +17,7 @@ SRC_URI += "file://pine64-plus-rules"
 U_BOOT_CONFIG = "pine64_plus_defconfig"
 U_BOOT_BIN = "u-boot-sunxi-with-spl.bin"
 
-BUILD_DEPENDS += ", libssl-dev, swig:native, python3-dev:native, trusted-firmware-a-pine64-plus"
+DEBIAN_BUILD_DEPENDS += ", libssl-dev, swig:native, python3-dev:native, trusted-firmware-a-pine64-plus"
 DEPENDS += "trusted-firmware-a-pine64-plus"
 
 do_prepare_build_append() {
diff --git a/recipes-bsp/u-boot/u-boot-ultra96-v1_2020.10.bb b/recipes-bsp/u-boot/u-boot-ultra96-v1_2020.10.bb
index bfee2fe..2f284b2 100644
--- a/recipes-bsp/u-boot/u-boot-ultra96-v1_2020.10.bb
+++ b/recipes-bsp/u-boot/u-boot-ultra96-v1_2020.10.bb
@@ -24,7 +24,7 @@ TEMPLATE_FILES += "ultra96.bif.tmpl"
 TEMPLATE_VARS += "ULTRA96_VERSION"
 
 DEPENDS += "zynqmp-pmufw trusted-firmware-a-ultra96"
-BUILD_DEPENDS += ", zynqmp-pmufw:native, trusted-firmware-a-ultra96"
+DEBIAN_BUILD_DEPENDS += ", zynqmp-pmufw:native, trusted-firmware-a-ultra96"
 
 U_BOOT_CONFIG = "xilinx_zynqmp_virt_defconfig"
 U_BOOT_BIN = "u-boot.elf"
diff --git a/recipes-core/customizations/files/.bash_history-espressobin b/recipes-core/customizations/files/.bash_history-espressobin
index 09fdb24..6d59f3e 100644
--- a/recipes-core/customizations/files/.bash_history-espressobin
+++ b/recipes-core/customizations/files/.bash_history-espressobin
@@ -6,7 +6,7 @@ jailhouse cell start inmate-demo
 jailhouse cell stats inmate-demo
 jailhouse cell destroy inmate-demo
 jailhouse cell linux /etc/jailhouse/espressobin-linux-demo.cell \
-                     /boot/vmlinuz* \
+                     /boot/vmlinux* \
                      -d /etc/jailhouse/dts/inmate-espressobin.dtb \
                      -i /usr/libexec/jailhouse/demos/rootfs.cpio \
                      -c "console=ttyMV0 ip=192.168.19.2"
diff --git a/recipes-core/customizations/files/.bash_history-hikey620 b/recipes-core/customizations/files/.bash_history-hikey620
index 41729a9..a25ee26 100644
--- a/recipes-core/customizations/files/.bash_history-hikey620
+++ b/recipes-core/customizations/files/.bash_history-hikey620
@@ -6,7 +6,7 @@ jailhouse cell start inmate-demo
 jailhouse cell stats inmate-demo
 jailhouse cell destroy inmate-demo
 jailhouse cell linux /etc/jailhouse/hikey-linux-demo.cell \
-                     /boot/vmlinuz* \
+                     /boot/vmlinux* \
                      -d /etc/jailhouse/dts/inmate-hikey.dtb \
                      -i /usr/libexec/jailhouse/demos/rootfs.cpio \
                      -c "console=ttyAMA0 ip=192.168.19.2"
diff --git a/recipes-core/customizations/files/.bash_history-macchiatobin b/recipes-core/customizations/files/.bash_history-macchiatobin
index 57a19cc..493aa1f 100644
--- a/recipes-core/customizations/files/.bash_history-macchiatobin
+++ b/recipes-core/customizations/files/.bash_history-macchiatobin
@@ -6,7 +6,7 @@ jailhouse cell start inmate-demo
 jailhouse cell stats inmate-demo
 jailhouse cell destroy inmate-demo
 jailhouse cell linux /etc/jailhouse/macchiatobin-linux-demo.cell \
-                     /boot/vmlinuz* \
+                     /boot/vmlinux* \
                      -d /etc/jailhouse/dts/inmate-macchiatobin.dtb \
                      -i /usr/libexec/jailhouse/demos/rootfs.cpio \
                      -c "console=ttyS0,115200 ip=192.168.19.2"
diff --git a/recipes-core/customizations/files/.bash_history-pine64-plus b/recipes-core/customizations/files/.bash_history-pine64-plus
index 8e8b246..a3f4c1b 100644
--- a/recipes-core/customizations/files/.bash_history-pine64-plus
+++ b/recipes-core/customizations/files/.bash_history-pine64-plus
@@ -6,7 +6,7 @@ jailhouse cell load inmate-demo \
 jailhouse cell start inmate-demo
 jailhouse cell stats inmate-demo
 jailhouse cell destroy inmate-demo
-jailhouse cell linux /etc/jailhouse/pine64-plus-linux-demo.cell /boot/vmlinuz* \
+jailhouse cell linux /etc/jailhouse/pine64-plus-linux-demo.cell /boot/vmlinux* \
                      -d /etc/jailhouse/dts/inmate-pine64-plus.dtb \
                      -i /usr/libexec/jailhouse/demos/rootfs.cpio \
                      -c "console=ttyS0,115200 ip=192.168.19.2"
diff --git a/recipes-core/customizations/files/.bash_history-qemu-arm64 b/recipes-core/customizations/files/.bash_history-qemu-arm64
index 73c5562..5e4ddcb 100644
--- a/recipes-core/customizations/files/.bash_history-qemu-arm64
+++ b/recipes-core/customizations/files/.bash_history-qemu-arm64
@@ -6,7 +6,7 @@ jailhouse cell start inmate-demo
 jailhouse cell stats inmate-demo
 jailhouse cell destroy inmate-demo
 jailhouse cell linux /etc/jailhouse/qemu-arm64-linux-demo.cell \
-                     /boot/vmlinuz* \
+                     /boot/vmlinux* \
                      -d /etc/jailhouse/dts/inmate-qemu-arm64.dtb \
                      -i /usr/libexec/jailhouse/demos/rootfs.cpio \
                      -c "console=ttyAMA0 ip=192.168.19.2"
diff --git a/recipes-core/customizations/files/.bash_history-rpi4 b/recipes-core/customizations/files/.bash_history-rpi4
index 3595205..bacbab3 100644
--- a/recipes-core/customizations/files/.bash_history-rpi4
+++ b/recipes-core/customizations/files/.bash_history-rpi4
@@ -6,7 +6,7 @@ jailhouse cell start inmate-demo
 jailhouse cell stats inmate-demo
 jailhouse cell destroy inmate-demo
 jailhouse cell linux /etc/jailhouse/rpi4-linux-demo.cell \
-                     /boot/vmlinuz* \
+                     /boot/vmlinux* \
                      -d /etc/jailhouse/dts/inmate-rpi4.dtb \
                      -i /usr/libexec/jailhouse/demos/rootfs.cpio \
                      -c "console=ttyS0,115200 ip=192.168.19.2"
diff --git a/recipes-core/customizations/files/.bash_history-ultra96-v1 b/recipes-core/customizations/files/.bash_history-ultra96-v1
index f73aec1..e06923a 100644
--- a/recipes-core/customizations/files/.bash_history-ultra96-v1
+++ b/recipes-core/customizations/files/.bash_history-ultra96-v1
@@ -6,7 +6,7 @@ jailhouse cell start inmate-demo
 jailhouse cell stats inmate-demo
 jailhouse cell destroy inmate-demo
 jailhouse cell linux /etc/jailhouse/ultra96-linux-demo.cell \
-                     /boot/vmlinuz* \
+                     /boot/vmlinux* \
                      -d /etc/jailhouse/dts/inmate-zynqmp.dtb \
                      -i /usr/libexec/jailhouse/demos/rootfs.cpio \
                      -c "console=ttyPS0,115200 ip=192.168.19.2"
diff --git a/start-qemu.sh b/start-qemu.sh
index abf2537..1472b99 100755
--- a/start-qemu.sh
+++ b/start-qemu.sh
@@ -35,6 +35,7 @@ case "$1" in
 			-device intel-iommu,intremap=on,x-buggy-eim=on \
 			-device intel-hda,addr=1b.0 -device hda-duplex \
 			-device e1000e,addr=2.0,netdev=net"
+		KERNEL_SUFFIX=vmlinuz
 		KERNEL_CMDLINE=" \
 			root=/dev/sda intel_iommu=off memmap=82M\$0x3a000000 \
 			vga=0x305"
@@ -50,6 +51,7 @@ case "$1" in
 			-device virtconsole,chardev=con -chardev vc,id=con \
 			-device virtio-blk-device,drive=disk \
 			-device virtio-net-device,netdev=net"
+		KERNEL_SUFFIX=vmlinux
 		KERNEL_CMDLINE=" \
 			root=/dev/vda mem=768M"
 		;;
@@ -70,5 +72,5 @@ shift 1
 ${QEMU_PATH}${QEMU} \
 	-drive file=${IMAGE_FILE},discard=unmap,if=none,id=disk,format=raw \
 	-m 1G -serial mon:stdio -netdev user,id=net \
-	-kernel ${IMAGE_PREFIX}-vmlinuz -append "${KERNEL_CMDLINE}" \
+	-kernel "${IMAGE_PREFIX}-${KERNEL_SUFFIX}" -append "${KERNEL_CMDLINE}" \
 	-initrd ${IMAGE_PREFIX}-initrd.img ${QEMU_EXTRA_ARGS} "$@"
diff --git a/wic/rpi4.wks b/wic/rpi4.wks
index 12a8509..2d10b99 100644
--- a/wic/rpi4.wks
+++ b/wic/rpi4.wks
@@ -12,3 +12,6 @@
 part --source bootimg-partition --ondisk mmcblk0 --fstype vfat --label boot --align 1 --size 32 --overhead-factor 1 --extra-space 0
 
 part / --source rootfs --ondisk mmcblk0 --fstype ext4 --label platform --align 1024 --active
+
+# silence wic
+bootloader
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2081733cde49420cbc8e6e87a05376550f8f7757.1621593454.git.jan.kiszka%40siemens.com.
