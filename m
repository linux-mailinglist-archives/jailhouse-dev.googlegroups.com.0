Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK7D5L5QKGQE4NMQOXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4F128302A
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:56 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id m9sf2801876lfr.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876396; cv=pass;
        d=google.com; s=arc-20160816;
        b=0UAx96sS9vY+AqZ70/g6HwCeMx5bXpxll2nwSn9DjrLzctXXZysWvc7X4fIhq6ClMn
         yXTFZOOO/2Wqnb3Q4uVfF/+l+kflf1GGH94TbgF8QrvOR7y2XoNx4Wa7L44dlCJhRt7H
         tEEcbDni9p4jndGJtXsn2cTwaFjXLyLm5S1l+Z9jiFlM1LrD/oX0/iyvKTLiw7/ii8no
         QosAl6jC/MkOQbXgGCjJNwxr53vzP0895BABw54ALJ+PmRMtclTKSQWNCrEIRDnJ3AuA
         fDDfIdmOa2+YVF5zxbSVvwipJWphD6b2dz+8LZMn5d/kuwLVdiqUspzpxc/NInXIsgqt
         AOXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=8hB3CJoQY8IE35DhzOqkfQ7o9yksg9iaMEC1l4aG3hI=;
        b=IBeFLYMdXkJ8lxTxI22Ib6nNoHa4nBLFOauYpZrV6mIL7sWCjKk4bAQT3taTP0oz1C
         e9A12pCzj5m859+JK0eYw/vo3NUZpkomqdH7StzFvJEa/EO4kcRDZdLZ48G/WuPMWeMS
         Wacur8Ws8MczDfinIW9CMfUfwOBdyCSdeh+tmZV0K92gATPVjCyStizUBvxdArQkTUMU
         0pL7VMpWiUyiJH1NVh6T73nzEdD3QcIcHge4eSJit3TA8PZSnB8MLEumwF+D1u20SKfW
         0v9TYRiAikbeJCpcHBW8nrLRrv1CdQPDKj4r49XJfnh8xIBykoRNGs4g5Vi//KIVURPT
         y0yQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8hB3CJoQY8IE35DhzOqkfQ7o9yksg9iaMEC1l4aG3hI=;
        b=R2i1koec6hoG+pIJw6Tq5pnZbTX17MwG2x1RFYX/JFjzcNpHFnOkNwV8sRm/Xx1yUT
         3Igu8QJCE+qolMPd+lzHpl6b0CmjEPQi00xJMaUSzY3Wg05M8dmxg9BEqA2WwpRFwsBU
         iUqYP/mT/bTN/Dfj1idDaXIN47a19pTd+b+uUnJmJED6oK7exEMdtAAgKwykPTEyrHcB
         3cj6tjiKFGo9urSSeEecZ76oKGfXI63W0IlvjQ+SJd4duVPGhAg7/iKBdxyGlLHe+XmB
         niEGfgEZPpIvXKyeR78YRpLEDZi2cpeM7+Hb7sLqut1/ZVrmATwnB1ZPXFPO/8qI9COT
         Gvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8hB3CJoQY8IE35DhzOqkfQ7o9yksg9iaMEC1l4aG3hI=;
        b=T2CCgRHF7+Eafxb/5XfFaP3YwnUYuao4CVo/bVjMPZylLniqzcyv2SdweWutKTz1LD
         1iL8Ksb3Bcn5G2QkQ3PxlOnZr3mkjOJgKQ7/FMCIvviNEkm8lupaXPTL+EujbX5vOyry
         8oXcDjdCUMc99dgMoGmhl98XucRFHN5KQB3PvLxM/e6AEPTIGFUzGZpX5XN34Oayufdz
         t4AXBTIGfxmDJIdloqf5BQwFyA8s5MM4kbSf/0CG6fkeQLN2ok89yatwY+cjVOiHPKVc
         Uz18cOHb28X9qjV35sIEHPhacgEk5HsW93iBDhM9bts1ZPaRrfCX+uRynKfdY4K57TRo
         WlJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533hWoQMO52TdujhCcL697cXnYY6cF8aREIO5yObMCzFnGVwuGbb
	SoudUrUvCYjHBNqYmP8GTd4=
X-Google-Smtp-Source: ABdhPJyXtLtoq8ZF8QCWDtOhlIYjPhTzn2TQYh5IbiU2ANBHHnMyenHm6YRvTV0KwaGXyhk0LLgEeQ==
X-Received: by 2002:a19:7604:: with SMTP id c4mr5372514lff.132.1601876396250;
        Sun, 04 Oct 2020 22:39:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls361171lfd.3.gmail; Sun, 04 Oct
 2020 22:39:55 -0700 (PDT)
X-Received: by 2002:ac2:489c:: with SMTP id x28mr5325014lfc.544.1601876394935;
        Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876394; cv=none;
        d=google.com; s=arc-20160816;
        b=lObDaZ7LKcW8ZHJQu/lmfXidvmdMDBRRPSALTRILaLYJH03EiuZdpjZG9nLrBHVN5e
         f/4lMiUZwYne7Nki6fn9RGHxAumwKpGIV1AYb1YJFq4/xaA3THUwNaHzeFzHsTlpLuGy
         mh9Yr+U4Sf/NU78E8meIJQqTVH+paG29eVK52zO3ld5AnV8OHyTh6VxskD6UaeF/6W/X
         4fB6OIiKpPX6GgGNOvAc3g0oQr8XvYSnVrjPzVTCcO0N/UB2OrLJIDgUoQdKOGPEnjXb
         1bm/KBcXEFjtRbci0UHMdRy/wNavV+YY9J+Ebmi+KbKrnbsv4wKak84b0Zf/iL/C0893
         K1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=EyYAsUapOha5gVQwdCMeVDPCOzi3phDVJQQignWPA8g=;
        b=qKh7LpXYQSRnKaDOoQ2mMJpw6aR6856uv7V9rBIZZsIPW6Yff+TpUdI6sAkSK4F40U
         eYuXoD5whplI6GSlFuTuWX9x//zd6n/gF5mhqJCmufJZ1TqKdLv+owfSF9cv5EM5Fl28
         /ja2ZJ2RyYwf2CglF/Msm6GfMn94xTePUnbssS5fpEWw8uLPK9Kc4SVVTPuwlH8avRT9
         X47d6XqJomGTIe3AD8WLIhs7wWhgqbuZ5A+JQ0AjMuKiiBqT/nhont0XMP/P+LzsAcx4
         g+kXBIeHKrVTLHRGzLHh5T5Rzt7R24pHQgF8yVu+DQpthKBwlMOnYJb0DE8Y8A4IFp6X
         eBAA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id 11si210277lfl.4.2020.10.04.22.39.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0955dsin000954
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:54 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncN025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:53 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 14/19] Add new TF-A build infrastructure
Date: Mon,  5 Oct 2020 07:39:44 +0200
Message-Id: <68da147436149de570216ccb11a74489bed1328f.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
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

This prepares for building Trusted Firmware A always as package, like we
already do for rpi4. The infrastructure is added as Isar path that will
be upstreamed soon.

TF-A will will be packaged per-machine, just like U-Boot. So already
prepare the corresponding PREFERRED_PROVIDER rule.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/distro/jailhouse-demo.conf               |   1 +
 ...de-for-building-custom-Trusted-Firmw.patch | 127 ++++++++++++++++++
 kas.yml                                       |   4 +
 3 files changed, 132 insertions(+)
 create mode 100644 isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch

diff --git a/conf/distro/jailhouse-demo.conf b/conf/distro/jailhouse-demo.conf
index eeb5ea3..9f0aa92 100644
--- a/conf/distro/jailhouse-demo.conf
+++ b/conf/distro/jailhouse-demo.conf
@@ -17,6 +17,7 @@ WKS_FILE ?= "${MACHINE}.wks"
 
 PREFERRED_VERSION_jailhouse-${KERNEL_NAME} ?= "0.12"
 
+PREFERRED_PROVIDER_trusted-firmware-a-${MACHINE} ?= "trusted-firmware-a-${MACHINE}"
 PREFERRED_PROVIDER_u-boot-${MACHINE} ?= "u-boot-${MACHINE}"
 
 USERS += "root"
diff --git a/isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch b/isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch
new file mode 100644
index 0000000..72b089f
--- /dev/null
+++ b/isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch
@@ -0,0 +1,127 @@
+From 6754548019e02c1dbf0d336d06dd14508eb1684c Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Sun, 27 Sep 2020 12:08:45 +0200
+Subject: [PATCH] Add recipe include for building custom Trusted Firmware A
+
+Analogously to U-Boot, this adds an include file to be used in custom
+TF-A recipes. The typical customization points are TF_A_PLATFORM and
+possibly a couple of TF_A_EXTRA_BUILDARGS. The to-be-packaged binaries
+can be defined via TF_A_BINARIES.
+
+Debian has a binary package called "arm-trusted-firmware", targeting a
+couple of sunxi boards. We do not follow that legacy naming by intention
+and rather use the new official one. Debian will probably follow at some
+point.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ .../trusted-firmware-a/files/debian/compat    |  1 +
+ .../files/debian/control.tmpl                 | 10 +++++
+ .../trusted-firmware-a/files/debian/rules     | 19 ++++++++
+ .../trusted-firmware-a-custom.inc             | 43 +++++++++++++++++++
+ 4 files changed, 73 insertions(+)
+ create mode 100644 meta/recipes-bsp/trusted-firmware-a/files/debian/compat
+ create mode 100644 meta/recipes-bsp/trusted-firmware-a/files/debian/control.tmpl
+ create mode 100755 meta/recipes-bsp/trusted-firmware-a/files/debian/rules
+ create mode 100644 meta/recipes-bsp/trusted-firmware-a/trusted-firmware-a-custom.inc
+
+diff --git a/meta/recipes-bsp/trusted-firmware-a/files/debian/compat b/meta/recipes-bsp/trusted-firmware-a/files/debian/compat
+new file mode 100644
+index 00000000..f599e28b
+--- /dev/null
++++ b/meta/recipes-bsp/trusted-firmware-a/files/debian/compat
+@@ -0,0 +1 @@
++10
+diff --git a/meta/recipes-bsp/trusted-firmware-a/files/debian/control.tmpl b/meta/recipes-bsp/trusted-firmware-a/files/debian/control.tmpl
+new file mode 100644
+index 00000000..7ffd189d
+--- /dev/null
++++ b/meta/recipes-bsp/trusted-firmware-a/files/debian/control.tmpl
+@@ -0,0 +1,10 @@
++Source: ${PN}
++Section: admin
++Priority: optional
++Standards-Version: 3.9.6
++Build-Depends: ${DEBIAN_BUILD_DEPENDS}
++Maintainer: ISAR project <isar-users@googlegroups.com>
++
++Package: trusted-firmware-a-${TF_A_NAME}
++Architecture: ${DISTRO_ARCH}
++Description: ${DESCRIPTION}, firmware binaries
+diff --git a/meta/recipes-bsp/trusted-firmware-a/files/debian/rules b/meta/recipes-bsp/trusted-firmware-a/files/debian/rules
+new file mode 100755
+index 00000000..70e1dd66
+--- /dev/null
++++ b/meta/recipes-bsp/trusted-firmware-a/files/debian/rules
+@@ -0,0 +1,19 @@
++#!/usr/bin/make -f
++
++# Debian rules for custom Trusted Firmware A build
++#
++# This software is a part of ISAR.
++# Copyright (c) Siemens AG, 2020
++#
++# SPDX-License-Identifier: MIT
++
++ifneq ($(DEB_BUILD_GNU_TYPE),$(DEB_HOST_GNU_TYPE))
++export CROSS_COMPILE=$(DEB_HOST_GNU_TYPE)-
++endif
++
++override_dh_auto_build:
++	CFLAGS= LDFLAGS= $(MAKE) $(PARALLEL_MAKE) PLAT=$(TF_A_PLATFORM) \
++		$(TF_A_EXTRA_BUILDARGS)
++
++%:
++	dh $@
+diff --git a/meta/recipes-bsp/trusted-firmware-a/trusted-firmware-a-custom.inc b/meta/recipes-bsp/trusted-firmware-a/trusted-firmware-a-custom.inc
+new file mode 100644
+index 00000000..a065ce71
+--- /dev/null
++++ b/meta/recipes-bsp/trusted-firmware-a/trusted-firmware-a-custom.inc
+@@ -0,0 +1,43 @@
++# Custom Trusted Firmware A build
++#
++# This software is a part of ISAR.
++# Copyright (c) Siemens AG, 2020
++#
++# SPDX-License-Identifier: MIT
++
++inherit dpkg
++
++FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/files:"
++
++SRC_URI += "file://debian/"
++
++DESCRIPTION ?= "Custom Trusted Firmware A"
++
++TF_A_NAME ?= "${MACHINE}"
++TF_A_PLATFORM ?= "unknown"
++TF_A_EXTRA_BUILDARGS ?= ""
++TF_A_BINARIES ?= "bl31.bin"
++
++DEBIAN_BUILD_DEPENDS ?= ""
++
++PROVIDES += "trusted-firmware-a-${TF_A_NAME}"
++
++TEMPLATE_FILES = "debian/control.tmpl"
++TEMPLATE_VARS += "TF_A_NAME DEBIAN_BUILD_DEPENDS"
++
++do_prepare_build() {
++    cp -r ${WORKDIR}/debian ${S}/
++
++    deb_add_changelog
++
++    rm -f ${S}/debian/trusted-firmware-a-${TF_A_NAME}.install
++    for binary in ${TF_A_BINARIES}; do
++        echo "build/${TF_A_PLATFORM}/release/$binary /usr/lib/trusted-firmware-a/${TF_A_NAME}/" >> \
++            ${S}/debian/trusted-firmware-a-${TF_A_NAME}.install
++    done
++}
++
++dpkg_runbuild_prepend() {
++    export TF_A_PLATFORM="${TF_A_PLATFORM}"
++    export TF_A_EXTRA_BUILDARGS="${TF_A_EXTRA_BUILDARGS}"
++}
+-- 
+2.26.2
+
diff --git a/kas.yml b/kas.yml
index 6c3c987..8807257 100644
--- a/kas.yml
+++ b/kas.yml
@@ -24,6 +24,10 @@ repos:
     refspec: 93658f7a72679c89e14adc7bbdbf3f5d52b7ac0d
     layers:
       meta:
+    patches:
+      tf-a:
+        path: isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch
+        repo: jailhouse
 
 bblayers_conf_header:
   standard: |
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/68da147436149de570216ccb11a74489bed1328f.1601876389.git.jan.kiszka%40siemens.com.
