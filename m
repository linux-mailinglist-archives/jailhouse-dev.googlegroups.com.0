Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPPG575QKGQE33IUDPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DB72844EB
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:31:58 +0200 (CEST)
Received: by mail-ej1-x63a.google.com with SMTP id x22sf3234712ejs.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:31:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958718; cv=pass;
        d=google.com; s=arc-20160816;
        b=iiFbU0N4sZ26MZhZf+ymqgcwXjthAYGkqhUUmJFQJIGmxEO9yK9JEQmZkuzAavDp/a
         J6sGwb8dXkPJj14caeZcOgnFd6AjkzzTOxTe4OL20ovVJx8HtTmWRShWFf3/pLUH16G3
         1NmuWh7XW6dNQVNVTiRCR+dYPgWhFTasR6geu6MyuzkwyJZkJnQ5VHrU2kiCQ0zzWHDV
         Tja7i3LW+y1KkcwpFJLokWQPQUZGGdURFgE6WTnVEGBtwG8e3BAUM+ReRLcPSROLJ4ns
         0+ZtnykS7JNir3ShLidjMq/OW6MAvpDyXLsXpfn/3a4SaRcEOuyFWGFLFEgkw/Ql284/
         eDJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=cifBoD2YeYHWSWIFcbjiFCnpDr0NDUtkvYEGveAwRo8=;
        b=eSUY+uuyaEJeKmjTDwKiFWffw5fuHNd1QJgmuqaRexKk+X+K7yKl4T805HP9waAave
         7fId4AZweYK6Pm/Lv9JuotO2ELI02tbKnFKYa3WD0Z1ReFlzSE6eoklHfedp+gA2+VHD
         TzpHblWv+aG2TNXbOBVFKj8S7H6fHIkIOe6rLIOAJGFaisvatpRlczSipoUsxS+jnek3
         FBizgUsA+9CfN8F74uOwCZ5WTHK66mZQ0UG4CpdcBdbM+xQ3KORqhV3RIt9MIg0AmGC3
         fi1s33ucUJ5vSvXe5xL/4MboYO40F2PBicS9IsERVac10es7tMkDykwsXy5z0Kn7oyo7
         mvaw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cifBoD2YeYHWSWIFcbjiFCnpDr0NDUtkvYEGveAwRo8=;
        b=kIqxk0mGDDizF8aHVKmCYzplktp2POvsz6FUuUwk2zC9wcHUh17ZE3GAIkT7FOccI1
         f0Sow//5By+zF4KMPKkYUlaJWCVCuM0BGkkn+zP7YtrXugPHUiZJPxS3HVPsEFRp312o
         /mRzSnl8VBPqWEz1bzJX1H02GzvuX6ox2lIkxYGdkThoy9AQoykfcoms7Dx90G2toFo4
         kBZzmH7KkPiJhgOfus3L77Vcs9cy1VkglR8ke/SwokBt+wPi/BnQTUPtrGqsdtpnSd4Z
         oBglj1d5p0Whs8LbBMhEbpFx9r5BU9FocaxlXrxLrEJuAMu7oAJ5zgCKo7twUwFOn6YI
         JRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cifBoD2YeYHWSWIFcbjiFCnpDr0NDUtkvYEGveAwRo8=;
        b=jmVPcFyoUtsS+bUEk130A2eqRyc/9OVWoe7ZjsElzWb6abzsZiuMu8VhL9IPjkb5GJ
         M9OWE+cj6b7f0hnAcVwZg+6cmtlmOui7kDACsEcaFOYtH3+xxZb3BX4RBspV5mhKBpqx
         r0iEi8f2aq+oMLfF2B7NrKp1Rof5r84FNb0pLDmablF/du3tDnTImYM+htgpVZyRc9aB
         Y9FY4kQ9TwmH61inVl3I9Zkhaes1mFG8pWuw32Ekp42uuCLxBXOObr+yxIFBMWMgn1OI
         zo0CaGlCLdyCXhEap3pRSaa+NIZ8VYHBs1H6kfRpFSSlZYdxmVWLz88GwTR/hbINdi/T
         V6zw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ArSrYNfEtsU1KUIhINmOP1v1f0wELXoMNBsOnv/51PRqNvcew
	hfBj3AMhx6G8FOpLDJyHxmg=
X-Google-Smtp-Source: ABdhPJy6ecrq8ce9hLsovXxesP40eF424hX0U/sSqn8PU8gJjxqrPHfCWFxQHd25CM1dhO5A0JuBjA==
X-Received: by 2002:a17:907:382:: with SMTP id ss2mr3309391ejb.544.1601958718030;
        Mon, 05 Oct 2020 21:31:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:bf49:: with SMTP id g9ls7728662edk.1.gmail; Mon, 05 Oct
 2020 21:31:57 -0700 (PDT)
X-Received: by 2002:aa7:d61a:: with SMTP id c26mr3242054edr.303.1601958716952;
        Mon, 05 Oct 2020 21:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958716; cv=none;
        d=google.com; s=arc-20160816;
        b=z41aehrF8KesR5jiH+vPreqpvCqcibqp6WalOm8Ar3IWKvLQadlFLjjghAwzB5eFux
         4yktm+K6IL1xPmO1YZr+aBeCvb4br8fC/P5kEObc8d9Py2iqsaR9YtM6YCS385FS7ocD
         Kpv/PtZZdFCi6O7EbTjgAAFY5OaGT4mJKxMrSQS3iMlfCK4b90swwGvE7mfH3xw6FYlS
         puMIbSY4gdfF0Ko20AS0wjohwg50MPy8wm61zECZvrjq3LxlHRvSfFgR03UhNILlhVfq
         xm4ej7NDOiYbMICE8Dg1fyz+6G8bi7buTYg30VPW34bRHRkC0iVvEiWCfQftjv3gK43Z
         JzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=EyYAsUapOha5gVQwdCMeVDPCOzi3phDVJQQignWPA8g=;
        b=iVk3jn6/fH3yM/KnsjGS72yGY8nNhMfnvt+cvkq/LOGZnfVrqQ+I9h37Q2/68JMBy/
         Pi3fXrIK8FzZHoag2yEejfuK26fU5/6ehy/OdLEO+qyHilkm0pBpJTAManIf55cJ9SdR
         bTKxBDsTxvZsRr88DVQOCKc7hI+Ci3bYCg42veHOhiHsf8rWpsQYp5aLtVWXZt8l8hql
         dQgsJuQaVD/7iethhMMvRlsIMwv2xlxGo1q34dKtOz4w5iyDI1XOADZQgNYt2ApuO6o6
         yy/mi82NwXGgEV48rOtheM6tqqgsd91sNCVhUkbXn7RUh48+C90jqKw0O0OZFMs2eLuG
         smnw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id u13si21401edb.0.2020.10.05.21.31.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:31:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0964VuFw020322
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:56 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY80008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:55 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 14/19] Add new TF-A build infrastructure
Date: Tue,  6 Oct 2020 06:31:29 +0200
Message-Id: <68da147436149de570216ccb11a74489bed1328f.1601958694.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601958694.git.jan.kiszka@siemens.com>
References: <cover.1601958694.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/68da147436149de570216ccb11a74489bed1328f.1601958694.git.jan.kiszka%40siemens.com.
