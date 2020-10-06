Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBP7G575QKGQEPA3RWYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB0D2844EC
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:32:00 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id j23sf1330806lji.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:32:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958720; cv=pass;
        d=google.com; s=arc-20160816;
        b=hvm1h7valKhf6Pjoush/i0BpngibwTtCbfZ1UR5/S6XH7bopGuusbONGgxB2RvI7rt
         7ow5fyWcjdyzgtAcCkAtVRNkgKPmwGiHLieKJmkSakp++1YbAXQXyEExbGurRoQyhL1d
         WGyL12iBhd4Xw6bZ0r5fFF+uBp5MFzhpnmmzM5x3BbHyyRO0nt1+bzrjxRpGi4PWlvtL
         aTyo01UCjdRVHDtVEMcvRq26Zk2u/YASCG/GjpaP5fSzvEZOwJPsYQ9j+2I0rY/C5ThL
         g01fV2cUZujzfABxeVsayLT3tWC7Z1aKAhvPRf59GEqwsTnqcfXeKIitby0HGFxm1aAw
         2A+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=Ll3RUn58sGReCQK7xynKj/ziS22zX99aOBT5my3N0ac=;
        b=g1H1qC5l0bv94reBmg8PqyGFWWFI8NYkF8nBM3hzQMbI+9eoJYHdeJzvYvY1hQsxJE
         1JmfSi/PRP3n81HNeRMthqjYH9F2Xg8zCwXPMVMYis6cUHGASezo72OFnwTgxxFU+FMt
         RfTFyGbYI5geq7Xvi2PB5XsjF/1spBfSLUAIuWP2KAIQkqDuXrnj4XBAEYDmATEudpAZ
         Jv90GWYHQUm9NWOj6tG6ixuJH1/Inl+J2jeS6tFc6l30LepQDxWKnMmm+ds/HT0481xy
         Dgzr6BfA1MkW3f0jXbd/eF6FJkliq5n5McK/4ZCzRraea3BA3nKpcl+QkXG33BSDqh6A
         6FgQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ll3RUn58sGReCQK7xynKj/ziS22zX99aOBT5my3N0ac=;
        b=VvMrgcG3Pn9U5PwtJ5iCu5T0y3oaxMgyjVOMCOfKJSSjQzrxH6l5JhCVt6ffiDNF2N
         7taf5PtyW2s4WbHty4oN5KOfmgvrNnB2wuKOVSQgeo3onvIWQ/N9CxUIRqn/ywMi1B56
         cN3oJqGwi3bar95vZjyOhU3xORXQ0a9UvetdrylWb9uwVE9D3U4x0z+5SkJjoc85Yz/L
         0XOptpNTNKT39PgbJXUEgRhHMal9GIAP7PFfNobxXzrWaA434w/VFZO6+bjce25OgxDr
         6gIeHq9XPoJyXDZMPhFgYsoZZTNYCBdCGRwWBjyvxADiFLRMmxQxjhAgSa+ZIQqdd9AA
         C99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ll3RUn58sGReCQK7xynKj/ziS22zX99aOBT5my3N0ac=;
        b=bzf8zQqEM6v9eUk51L58nfuk48Cgfis8QFxz+QHmARQ0Sr+xXvsEk3VCMGmg+3SOby
         suPXeQE97tkmHigi24U76VDoktUE0CtkCY8+qrQAZ7wCOrRo6Ung+y0o8j3CmwHxV3q2
         D1wNe9RrN9I4tePQcpRAifZH1P5cMuoM7jzz58I28NB2x6OTtLn4lTtEIdy4scKD9On2
         JV3xVdLXevdYWUvKwOBq7XCqWHfZmQ4Tmzal8Sp/aVVV+Rr2r+fd9n5nr1tpbdD0Ohjt
         zDi6kA6aeU3yJ32fAAcruXl6wQnM6wetYTtqC4xEbhPy2Rd37d+qvU1b5oJIaKtk++2t
         GuPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533jQHMDmUMBEXrinaePwZ6R//J0lAORkbhow/bIN+/f8qdIdBi1
	IredYnOLs84JBoIsJJdBbYI=
X-Google-Smtp-Source: ABdhPJxgJwxqS2yP2Teq680mf5OmMESuRDo9oq37oi8pUf2fo2UuBU03iHV0S9vbg79DQVCECFECsQ==
X-Received: by 2002:a2e:b610:: with SMTP id r16mr1070799ljn.226.1601958719970;
        Mon, 05 Oct 2020 21:31:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:93:: with SMTP id 19ls1439855ljq.4.gmail; Mon, 05
 Oct 2020 21:31:58 -0700 (PDT)
X-Received: by 2002:a2e:a48b:: with SMTP id h11mr925370lji.109.1601958718569;
        Mon, 05 Oct 2020 21:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958718; cv=none;
        d=google.com; s=arc-20160816;
        b=sK+zr3vftko9tzgc++cRGQBSga84b/N73j5v88KMjzspeieOAslUIxq0EcV/0EC8FW
         nDAgOCU1WwryFF3m7SH1dYGYgFVN/gFE7V+oSFmo5mo/hVrPadAcw3M6o71/FHyPygeM
         ONHNAL6bPRKrMWhbRzF5s1BAhPcdIL/CbfO2eD6Ito3YTLYdHnQirrCWKkSReYFup4XR
         N9TWfv02c3iq9BrZAYG9EZvRIIc3s1vyeNCtEkI8tTKt1Tx0ct1VyWFfSV8vwe+99dT6
         +3hP087E2liJR4dtMPQ9C3A5c4GUStqACiTlBf950aX+h2wcv0x9Ksr9QwhAo0Fc1Ck3
         D0NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=3b4xCseBtrcyED4ZlqVBO9MH0wC7Fh01o7emHT+ufy0=;
        b=h51U1dgp9st0HlIUbTxtxGGlaksOXoLO2nsmt9q5MrADXE3YQgogG1U6O+IOvXnC9L
         n2C95xILqlS6oH6PIej7G9So4K9Ac7fKCIqiO1thr9uDIk413JTIe5pCmG767vzEIYDZ
         5A5CxBE30hOKrnxybjpibGj/h3iHl1oDiqEvy5u2xK9JZtXnfx8E+eYXKwx6+BUHZbbr
         14kZUWdSM4+t5QpCscfWe+fZVn84VkaI2lpTe4SwbrsYP04/oqptHubqBlXpdSXx1cov
         xLWBREhhD9Ww5OOko77l+4F40JaHPgFX3QOdyO8e1pBUVEGca1hXX3dPrB6H6VVWVI6H
         TeVQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id t20si48377lfk.10.2020.10.05.21.31.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:31:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0964VvUg029931
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:57 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY81008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:57 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 15/19] rpi4: Convert to stand-alone TF-A recipe and update to 2.3
Date: Tue,  6 Oct 2020 06:31:30 +0200
Message-Id: <928a923e71da182db79e78d38ff9131c33579e85.1601958694.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601958694.git.jan.kiszka@siemens.com>
References: <cover.1601958694.git.jan.kiszka@siemens.com>
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

Use the trusted-firmware-a-custom.inc to model the rpi4 build. This
comes with a package renaming.

It also gives the chance to update to release 2.3 which allows to drop
patches. They will be removed from the tree later on, when the last user
of the old arm-trusted-firmware recipes is converted.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/machine/rpi4.conf                        |  4 +--
 .../arm-trusted-firmware-rpi4_2.2.bb          | 28 -------------------
 .../arm-trusted-firmware/files/rpi-rules      | 23 ---------------
 .../trusted-firmware-a-rpi4_2.3.bb            | 14 ++++++++++
 .../trusted-firmware-a_2.3.inc                | 17 +++++++++++
 5 files changed, 33 insertions(+), 53 deletions(-)
 delete mode 100644 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb
 delete mode 100644 recipes-bsp/arm-trusted-firmware/files/rpi-rules
 create mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.3.bb
 create mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc

diff --git a/conf/machine/rpi4.conf b/conf/machine/rpi4.conf
index 8ccef6b..b26effa 100644
--- a/conf/machine/rpi4.conf
+++ b/conf/machine/rpi4.conf
@@ -12,7 +12,7 @@
 DISTRO_ARCH = "arm64"
 
 IMAGE_TYPE = "wic-img"
-IMAGER_BUILD_DEPS = "rpi-firmware arm-trusted-firmware-rpi4 linux-image-${KERNEL_NAME}"
+IMAGER_BUILD_DEPS = "rpi-firmware trusted-firmware-a-rpi4 linux-image-${KERNEL_NAME}"
 IMAGER_INSTALL += "${IMAGER_BUILD_DEPS}"
 
 IMAGE_BOOT_FILES = " \
@@ -26,7 +26,7 @@ IMAGE_BOOT_FILES = " \
     /usr/lib/rpi-firmware/overlays/*;overlays/ \
     /usr/lib/linux-image-*/broadcom/bcm2711-rpi-4-b.dtb \
     /usr/lib/linux-image-*/overlays/*;overlays/ \
-    /usr/lib/arm-trusted-firmware/rpi4/bl31.bin;bl31.bin \
+    /usr/lib/trusted-firmware-a/rpi4/bl31.bin;bl31.bin \
     /vmlinuz;kernel8.img \
     "
 
diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb
deleted file mode 100644
index 2dd180a..0000000
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2019
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-inherit dpkg
-
-ATF_PV = "${PV}"
-
-require arm-trusted-firmware_${PV}.inc
-
-SRC_URI += "file://rpi-rules"
-
-S = "${WORKDIR}/arm-trusted-firmware-${PV}"
-
-do_prepare_build[cleandirs] += "${S}/debian"
-do_prepare_build() {
-    cp ${WORKDIR}/rpi-rules ${WORKDIR}/rules
-    deb_debianize
-
-    echo "build/rpi4/release/bl31.bin /usr/lib/arm-trusted-firmware/rpi4/" > ${S}/debian/install
-}
diff --git a/recipes-bsp/arm-trusted-firmware/files/rpi-rules b/recipes-bsp/arm-trusted-firmware/files/rpi-rules
deleted file mode 100644
index abb65be..0000000
--- a/recipes-bsp/arm-trusted-firmware/files/rpi-rules
+++ /dev/null
@@ -1,23 +0,0 @@
-#!/usr/bin/make -f
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2019
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-ifneq ($(DEB_BUILD_GNU_TYPE),$(DEB_HOST_GNU_TYPE))
-export CROSS_COMPILE=$(DEB_HOST_GNU_TYPE)-
-endif
-
-PARALLEL_BUILD=-j $(shell echo $$(($$(nproc) * 2)))
-
-override_dh_auto_build:
-	CFLAGS= LDFLAGS= $(MAKE) $(PARALLEL_BUILD) PLAT=rpi4
-
-%:
-	dh $@
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.3.bb b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.3.bb
new file mode 100644
index 0000000..2a655a3
--- /dev/null
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.3.bb
@@ -0,0 +1,14 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019-2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require trusted-firmware-a_${PV}.inc
+
+TF_A_PLATFORM = "rpi4"
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc
new file mode 100644
index 0000000..8480b0d
--- /dev/null
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc
@@ -0,0 +1,17 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019-2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require recipes-bsp/trusted-firmware-a/trusted-firmware-a-custom.inc
+
+SRC_URI += "https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/snapshot/trusted-firmware-a-${PV}.tar.gz"
+SRC_URI[sha256sum] = "37f917922bcef181164908c470a2f941006791c0113d738c498d39d95d543b21"
+
+S = "${WORKDIR}/trusted-firmware-a-${PV}"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/928a923e71da182db79e78d38ff9131c33579e85.1601958694.git.jan.kiszka%40siemens.com.
