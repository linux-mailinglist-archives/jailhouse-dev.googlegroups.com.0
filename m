Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBV7B66BQMGQEW6WKJSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB1A364CC0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:06:31 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id y13-20020adfdf0d0000b02901029a3bf796sf9677702wrl.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866391; cv=pass;
        d=google.com; s=arc-20160816;
        b=QwPfgGj7LOty6jbLuz5GYpkh3eL+EmkTMHMMlKpABI5cV5FCclHRS0GW4552hHGSza
         oZtB84o7yFu8r3xwY3kfxpZLD7E1f1Ezh7hocnTUMoLxNS1dUnAFFo4Ce7+kt1lmhUFy
         hXW8Klo7TvgDis9aSnx9K0UZd1q9MNZr8ThhExvoDnaKk2ipZmqx1LHK5jzuz1YDyQJs
         SOEI3esgbyx5JKwHxkicBM7UOf+jo2+aWBTIfqo0Lhjx9AMvJxTngYvXcrGUhtZyZFqj
         OGZGpJqC8sja+wT0I5O6ceznwQTYedc0+nUse6a/DHFCQAJs1FZabPayFQ27fdPyxUYx
         AWBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=1LMQQLwlGJhzrSNISGuTOUWauePQIZFlH57IDU3P/Uc=;
        b=eQOVf9v4iONAp3uToovMvNTMS36iDklImhuwAeIJKTL5AQg63jgjs5DEkRyycuz4gr
         ce7KeUr6CB1x0n2Mnw1XQZuxp+g/X5ZPHmPUOvpPRL+dFj2hlcbmgn8J3EzBkXMv6aSk
         nvsIGj1EFGv2uAJzRGaONL9Wl/yFcKSn22W9WwM7SCJFbGOLJIyo1+NTo1gIkm3jxnsk
         wBna/qyqRAIXLUzoA7rN77G+VVN+5gwJIF0WbNDQwoE/jXKJaVnufMxHTkZnFdefOPAV
         q3cCxfUbq35qZ9PpCDmLOvrE3gaApnoRpN4QyObFH7kD4QNN1TP8l6E3wZXAikkQ7OGZ
         i/fw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1LMQQLwlGJhzrSNISGuTOUWauePQIZFlH57IDU3P/Uc=;
        b=fJFoiSQ8YcqJUfwrG+PghwVxIZeDhn8IW43NX80Kth3gEqG5Hem34DtyiYPUpePgYg
         Zame5iufWTOARjnkecCLerpFGLEN58vFnvJBT1gKNVO3AVwhdprWyUAaZ3uk6Pj8fjOq
         3Ja1oazvLphyZBkiVPPVM4i1HO88J13d7ukkEaPkzje0S5JQ/OX+IETVUDiQ3FUq6v9I
         U5JlvKGl0NHwAdbzraD/w8IifGrqmL06dizCPEJvW+G4pCY5TOvy8/ZGkabDiUSKYYKF
         8d9Qsxl/bbMvYfO/t2Zm7ZxK+1pH3LqymMBUOzVAFiviSRdjxpOdkRvE+OmyLfzIPSNP
         gTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1LMQQLwlGJhzrSNISGuTOUWauePQIZFlH57IDU3P/Uc=;
        b=oA2hWTib03mRLx5iphaKzSDDHD2eitmdhAMEHNttz8VfLvBpfUYEFKH6s1w8l01eE5
         Xv3n2bBlSh5j8bBZ1KbZrQz2HMfwz36sZnq6QJKdRFJE8YW+ku1kLNDa0b68XIH/SkjP
         yFcP0A3l1G1Z4pgYy1jAz2+ypn70Dc0XFKw+aszS9lNWHDA6lMC6kg5TjaHXA5i3Zp3Q
         Y/ZrdsSqukqmwA1KFFjrMBIf8gusCrl4sXFtskT2MxHlq8ogOC212HX3vyQSnGHFPKNM
         yYm675VU7qmXkppKKuTuZ9bZnrVczrSIYP2w3OMXjE+aRCtlgOcBL1Q+JEnPq/DrWasC
         HdGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530s4wxXxJQQLDDMdhQLttPnTDMJYNRwUZnsWrzaAhjKvDqk01NU
	uG4rjG8EO4Xi3O0qvl3Auxo=
X-Google-Smtp-Source: ABdhPJzSskuN2mFLnQk7hRI1mS8aHRF3enQ56V0qidrQFwvOEb4JDzvkCE9gA+mwW9bhOYYfi4K7cg==
X-Received: by 2002:a7b:c7c8:: with SMTP id z8mr986360wmk.112.1618866391713;
        Mon, 19 Apr 2021 14:06:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d1e5:: with SMTP id g5ls9314658wrd.1.gmail; Mon, 19 Apr
 2021 14:06:30 -0700 (PDT)
X-Received: by 2002:a5d:468b:: with SMTP id u11mr16531233wrq.293.1618866390723;
        Mon, 19 Apr 2021 14:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866390; cv=none;
        d=google.com; s=arc-20160816;
        b=zahU/ww096kmHj3y1Jvg8Jks/gjn3NYs/Ar4xepPEzp1PFzXQFhtVQgrt1B/QxFJU8
         9FYUDYKfECU21OavX7HyM0TNDa4Ljadt3WptJvKkIcrueeFtG3loR/tWR2/RWfs+yiRk
         7P6iCon7YlcOQzWegSlkb7Ixx8KS8C/rLYJDpkcAh6c0TSwj6wNpyE5FnzCgD7HhQE7u
         2cQGOXYuaMCaRcZQmQVLG2FMy1mqJMtLX9i3WUPGYfDk1y/4MTYGwJC/UJ38RyIAJRYE
         AXPdwofhMo9gxmcHZm5UxICmcGQ+u8nfZgmS6lfiNI0pUpv9qmp6wcA+QEnyvwjowWZb
         7eDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=W7mDImY5Gsc8xRV4lc9MhXhwT+6I8yNZqqJn9XUeRSE=;
        b=rCqyTnThYJBZ2e1ztod09j7mqbVC9OTldOuzJ14mQEfEYVJ5uFfVwyNjv0M17uCpin
         wiEqfWRlCxHzkbqBCbnQDk1fDbIE7Un2bTxY5IsuvWoEYAtkZY3iD/wiQ1efODe7wYYV
         6s+1vx2J4Kbc+tRa5WN5qQna7cq7F22G8u1Eub6+E11awBnkiNuu+GGPrNeJMo61P4N+
         hSye5TH0kWoOEHyW6lncDXF5jaAppwa4CSb92VcPy3DVtENYYTNpd6nvRDpGkAehLJV6
         z17P3RH2Y+0nxYQjef8q7O+BbsMmf3J1wz9nijVOXbr+9dSCYaMw04qYUo6UMqB1qPe4
         B+Fg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 187si38324wmb.0.2021.04.19.14.06.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:06:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JL6UHX022599
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:30 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6TpU015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:30 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 01/20] Update Isar revision
Date: Mon, 19 Apr 2021 23:06:10 +0200
Message-Id: <503ad2923666d25e929d1d0eaf6b3a042f41215b.1618866389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1618866389.git.jan.kiszka@siemens.com>
References: <cover.1618866389.git.jan.kiszka@siemens.com>
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

TF-A patch is upstream, time to update. For that, we need to tune
TF_A_BINARIES, switch to DEBIAN_BUILD_DEPENDS in u-boot recipes and set
DISTRO_APT_SOURCES.

Isar renamed the deployed kernel image of arm64, so we need to account
for differences now.

Then Isar now forwards wic warnings. So we need to add an empty
bootloader line to the rpi4 wks file to avoid (harmless) complaints.

Finally, one Isar regression patch is needed that is not yet merged
upstream.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/distro/jailhouse-demo.conf               |   2 +
 ...de-for-building-custom-Trusted-Firmw.patch | 127 ------------------
 ...emove-unneeded-unconditional-recipes.patch |  32 +++++
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
 17 files changed, 55 insertions(+), 143 deletions(-)
 delete mode 100644 isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch
 create mode 100644 isar-patches/0001-fix-remove-unneeded-unconditional-recipes.patch

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
diff --git a/isar-patches/0001-fix-remove-unneeded-unconditional-recipes.patch b/isar-patches/0001-fix-remove-unneeded-unconditional-recipes.patch
new file mode 100644
index 0000000..0571905
--- /dev/null
+++ b/isar-patches/0001-fix-remove-unneeded-unconditional-recipes.patch
@@ -0,0 +1,32 @@
+From 2f8c868dde0b7e1fed194368e5aec8279ae57752 Mon Sep 17 00:00:00 2001
+From: Silvano Cirujano Cuesta <silvano.cirujano-cuesta@siemens.com>
+Date: Wed, 14 Apr 2021 17:18:06 +0200
+Subject: [PATCH] fix: remove unneeded unconditional recipes
+
+Commit 9c3499adf91 introduced the unconditional inclusion of the recipes
+isar-exclude-docs and isar-disable-apt-cache, but they would only needed
+for container images.
+
+That would have been anyway an optimization with questionable demand,
+therefore removing it.
+
+Signed-off-by: Silvano Cirujano Cuesta <silvano.cirujano-cuesta@siemens.com>
+---
+ meta/classes/image-container-extension.bbclass | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/meta/classes/image-container-extension.bbclass b/meta/classes/image-container-extension.bbclass
+index f693627..e26604a 100644
+--- a/meta/classes/image-container-extension.bbclass
++++ b/meta/classes/image-container-extension.bbclass
+@@ -6,7 +6,6 @@
+ # This class extends the image.bbclass for containerizing the root filesystem.
+ 
+ CONTAINER_FORMATS ?= "docker-archive"
+-IMAGE_INSTALL += "isar-exclude-docs isar-disable-apt-cache"
+ 
+ containerize_rootfs() {
+     local cmd="/bin/dash"
+-- 
+2.26.2
+
diff --git a/kas.yml b/kas.yml
index 8807257..0a2be57 100644
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
@@ -21,12 +21,12 @@ repos:
 
   isar:
     url: https://github.com/ilbers/isar
-    refspec: 93658f7a72679c89e14adc7bbdbf3f5d52b7ac0d
+    refspec: 7dd4f7a3e0633a1670e6edf84f31128de6a4ef53
     layers:
       meta:
     patches:
-      tf-a:
-        path: isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch
+      1-fix-u-boot-script:
+        path: isar-patches/0001-fix-remove-unneeded-unconditional-recipes.patch
         repo: jailhouse
 
 bblayers_conf_header:
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/503ad2923666d25e929d1d0eaf6b3a042f41215b.1618866389.git.jan.kiszka%40siemens.com.
