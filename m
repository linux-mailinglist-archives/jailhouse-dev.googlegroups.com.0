Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRPF46BAMGQELTKTF4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2D4346036
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 14:53:10 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id i26sf1454475ljn.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 06:53:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616507590; cv=pass;
        d=google.com; s=arc-20160816;
        b=BV5TkQFYTViuqTCip2nW9YHoMEPzordbc3B5HG2AtKusWXUvsOGevYiXRNhaQ9bTew
         pzcLKVsZZpgwS+g8hum/KprNkdm+7GThG5MPnuygOiOa99loee8AebnlYlZJqiZAwq+7
         0rwgy6iEMLjvKUlVMPwjn0fHCgovLy/w6InhpZK2LiqVKPKaHsKwWkDI5NiCG0Ipv0X/
         FE8BW04G6g4gU0afVDOiB1d3eJ3JNT0eJ0yzmcJS2Lb13tYMhFVz13rANDzO5Db87xiS
         okzfFZ69ojDttCxCGv8tmJrASgS0H1M//BZyoW+f4EwStDrRiyOwgt8gcd4EykNGluF2
         AOZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=LLRqcUha595439j4zWE1gS4jXOjieiKwwO1Dxa+goZs=;
        b=ZdUqKrm2G9UPRgB6+C7HR3annkUd/ehq8PZmTPnTxYUk1tt+I06N1q/dhjCuxt75nB
         GQVQKiL8mSi/B68DPFbxrNM/44Jrsm6fdWjxzVF2bJFe7gcziO+IOHP5W9uSRt37aDHQ
         goqQ11HE4ESiCQZ7z6SjAj5Ooea8NtMwWFobX2UWDMFQS6SI8OKLRNx7wmivGTraKhIi
         RakvUrd7V/NOw3F0tGldBbE2wPKCGw7bSLp/C/gAjQYyhPHAaMq9jS/3Cw8Su8Ahs5OA
         a6K1vSPMy8g27ngR/CUJgl62n/58J7rJssC6m316OD8Kz8/7cOQMA8vEcL8FiEtwF6Bo
         zWGg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LLRqcUha595439j4zWE1gS4jXOjieiKwwO1Dxa+goZs=;
        b=bHlryjS7A6yq9FV6DdgUkkt8Y3dgU5UxW8c7gbvAm+/ogqlYuiqfh0g40qFa8j4EYZ
         oah4eje+lxZRPZQ/RLrmfjy7v/E2AlRq/rUmZ3ez4oAKv/ZizuVHHb7OzjrwMFGlDaMT
         VVtt6cHX6g28tdho4xw3JRaCPZutnpWWZmBbTM/mwsj/0BecpxEVoQrVk3YwG2GClo0L
         BMD5LgHzGMYw5ADpM0WPvZvpkudRORnBhg4Kuf33oKwGtZrCfuoIN14v99rhcmSo1R/u
         ZLAqU4KqI5PCiE8aq7EnGlYypqo98G2M8QkeG6IOJLqWQMPdxivA2sCDXDAMpW690Wxn
         ZjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LLRqcUha595439j4zWE1gS4jXOjieiKwwO1Dxa+goZs=;
        b=FhO9glfQjaBnmlAf/8kSEJgzjvcssqTy69cuBn1+3f5C5zjynD7nZuLL8414XJb+ZU
         Eqkz57onQsSByvSN1rA3+SvyblyvM4VQlvjicLQwI+eGYPoaZiq7XSAS6z+ZMmBzlrQo
         2GGf22cY3nU3maLZk8OlD1JUAy2rDn941v9QOjgvd2UD6tn9S4fByQj9RU56Yy0Y9jCB
         yRZ2rZWhtskKI0I/c9x4E7iZ6SI71oycw2QUuVEKmWdzLrFb7yxcEFrOvqUvsonmm1gv
         ROderuxUZ5A2jkm0WijUwFjHGjs6z/L1y6VN11hEfloTb/20C4oZPqMF/KBb/jyvzTSW
         jPww==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532NxBfip+etJ+LStE3c+RAAnKuv7Neswd7oNfsD1C46SlX0g4Uo
	Mv9ZJy1M9D8uJMA8hYuzkbY=
X-Google-Smtp-Source: ABdhPJwDrcEUb63JHewFXGuBLdWp5iPeaHAfxqe7UjGxPpELsDm3vSr8l/LB0aAttO6dw3JNW+74kQ==
X-Received: by 2002:a05:6512:693:: with SMTP id t19mr2554562lfe.205.1616507590218;
        Tue, 23 Mar 2021 06:53:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3d16:: with SMTP id d22ls4872753lfv.1.gmail; Tue,
 23 Mar 2021 06:53:09 -0700 (PDT)
X-Received: by 2002:a05:6512:3d1c:: with SMTP id d28mr2572898lfv.41.1616507589157;
        Tue, 23 Mar 2021 06:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616507589; cv=none;
        d=google.com; s=arc-20160816;
        b=q/FcJPYTF2hr2U/aXyhN2Hqh+EbzG0ddi9D/tsEwvbW52XSxb2+hfvFtDt040kdnkU
         lhDqQ+yArM2uDdDSUKpxn+RdH4UxWnjkGjkkmIDUvvLDWwqfuJNTqAodKLcOOsSjEjtp
         kFNlzlj4DEZ6EIquYjGxiCxeHaXPTDl3U738CACDTrhUKc0Bu3sPBTxuNK9zMYTbgkWe
         RXAfeDzO1TvRwu8l/C4woLpr+mlnIMNK/su76V1zN6GxUm8qPnjfHwsQ5gsJFGq47Ecb
         ugx0qQ6SRo8ItNwsEvLL4srDmIAX43V4I6CXtViDkYMjPAAlweZcg3oSdWZAbXos4Vn9
         jPGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=RhR8XTy9J3fEHsRRtIrzyV+tMJyUddYVFJXEGoqtpeM=;
        b=cND/g3Dym4Ux9CAgzBBrFhbaEU/fLi2rDA6gC78hcdtNQKEfAIUS5N5IRJ+itC3+yB
         Cc39CcmMaSPNQZteHzgmEpWArkfyfhRiT7Z8L6jcQJxQ0/K+Q1g/XJmwvs/0j7H7Dq7h
         o8T375OB4jxRmx5ch+/ozejDhmytuFh4MT9Pigp+G684alPdwL283HFiVXePnCUVogTj
         XbIrBgO3/ifzGSB+lY9QszmWnEJXTlHGgsfF5co+oB++AGKTuwg1IMmKOUmh3UrMgo6M
         Xck7VwzMeeyMIvo+gA00eU2m8vjf6F3OTH03X+wcMdPgL22WKojxzZLjiRlMzt9XYFVU
         dyrg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id f21si678349ljg.6.2021.03.23.06.53.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 06:53:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12NDr8ah026237
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:53:08 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12NDm2Mh029573
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:48:03 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 01/11] Update Isar revision
Date: Tue, 23 Mar 2021 14:47:52 +0100
Message-Id: <ee3a0366e54ac7038fd44350de44101d7de9a5be.1616507282.git.jan.kiszka@siemens.com>
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

TF-A patch is upstream, time to update. For that, we need to tune
TF_A_BINARIES, switch to DEBIAN_BUILD_DEPENDS in u-boot recipes and set
DISTRO_APT_SOURCES.

Isar renamed the deployed kernel image of arm64, so we need to account
for differences now.

Finally, Isar now forwards wic warnings. So we need to add an empty
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
index 8807257..45428aa 100644
--- a/kas.yml
+++ b/kas.yml
@@ -1,7 +1,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2018-2019
+# Copyright (c) Siemens AG, 2018-2020
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -21,13 +21,9 @@ repos:
 
   isar:
     url: https://github.com/ilbers/isar
-    refspec: 93658f7a72679c89e14adc7bbdbf3f5d52b7ac0d
+    refspec: aa5dd75a7314798bba5b413eea2886983449bd28
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ee3a0366e54ac7038fd44350de44101d7de9a5be.1616507282.git.jan.kiszka%40siemens.com.
