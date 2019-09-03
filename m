Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQ4CXDVQKGQEJ72XXAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F3CA60F5
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 07:59:31 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id b11sf3878875wmj.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 22:59:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567490371; cv=pass;
        d=google.com; s=arc-20160816;
        b=wZy8Ogt5/mjJcFRuhxFJ/e7m0y1ZTIwr0eWvl35ueB2hhOjNeCKfmrH51OB5wbExTk
         bqvl/se68Oc0TR3pRfp/X++rT0GR6IJEpIr2qzWPCAbiTXVIyxmQCdxkjnwPB1rcUW6w
         oGMQNRPbHDRW6GrlgU6ZiIMkPmPnnCWxLo6rU341AI8uW2koSiAB5vhV6vc3eif6NRDt
         IOn7Isvlrr0EpWCWA+3Gu4udgOQaSoshsXXDwmup+Dg03Zlc330Yf8KXpFiNkyqJwdvn
         kx0gCtn9JUSYQzUbWJvdm35Mu7DxbstnrAPb6vnzwYK6M3EcuRxD35qh9m/5Fwu2rHaM
         PRCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=aYdaj+cPWB0Z+GhTZTWZ/SLfCJQ+Yj0hcFyVTrI4Pms=;
        b=Hl6JmUSlHdZAqW1gfOv3rzbCRhFU+bsbOnFfmhjs8rbkgn7AT+dQMtNbRICB31dxEg
         /a8DsaQJIs9JsFTXdKRoU3gn6FOUOXnOdizKaFt03lB4/dmDXPOn4avaNK6LiHMDjrJo
         +uvNGTxIkPRxADmfAhcq2I8LT2SMivjfV+p5p4Z6nJRSAhzg5FXJfOYwmNvbxBwGIaov
         Sr7+D+kuvxTZrJrdCitwqdD2Af6qofEVaDh6qYtbweJXU+N+ZGwPQ3OxppKuhafTaHHp
         aJuHgkTO4OVfCv5tCWcwFNWtAlLc3pJa3V94NzdOW2JEpg9yTb6h0A9fl0yA2zqVg9RB
         x++w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aYdaj+cPWB0Z+GhTZTWZ/SLfCJQ+Yj0hcFyVTrI4Pms=;
        b=B/LZJpqcD05JKPtPUTOosS2Gwljur8LaLAreIVk5gHd7SalRIHwPZ1/lgKqUo2nhhk
         XtQzIgkhhUVwfKn1EZLVkSuxjC5srgJjLJRpnsisNkB9XhkZf9ewjqPDRdfKLDdeZ9NV
         A6IgUcrQIsGXDSGlpIjdQbU/skeeAzIX5VLLXrlQMzQboOTQPHZWHmFw7IQjT8gedUnE
         C0S4TXH+evzHN/Td8CkThBMZn4ykNXTjClP/BF8X/PmB92mu2HoSUKHDLDZaonXbc87N
         UoSYneFyrNofO+K1uNmYOutsfnrOn7OtI2/fmtk5WQXfbMeds6cNPouv4MP5VtYuE5SE
         OgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=aYdaj+cPWB0Z+GhTZTWZ/SLfCJQ+Yj0hcFyVTrI4Pms=;
        b=P6V4F5PaZdihlCrqtoSSPvQYb6ckVC98HppmDmv3x4lfOswIlrCob0WUZDz5/gPCcy
         pxbZ6Q1unyVbp0XlqgSqHcfDbDbXD34vuM8dIiKBcBdH7ptnw8WP/3yceqksN6tOxxMn
         5isB5Be9urniTEsp5VzcggB+g5R0mZPj5hhA8IJCFt5mpQwoGvo9Rdj57ew1KSYeHtuw
         FQ97S8RcTtc4HGYXaVTeaSqzCdh0OQxCIig0Kw8sAdXYHJvGeasi0DKptYO1ju+hNfaK
         td/OFwRruxHDsziZszm2Ix62tx4vfVmj6NJKG9pruzAxphqy+I6jONLvBS7wIKLCIhd4
         deow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXLELMEJaq8nxaX9lTNBBwbKh76UKamDVV1lyVxrcCigwzFQpfS
	N6H5LDi0MdJUSyDIjEJREdM=
X-Google-Smtp-Source: APXvYqzsppxhkdrwMRemlxWkPFZcPFngBsv4cmNkybsQqXvzUhhPdN8fVMWmUjLySJ5fvIEAqNGpYQ==
X-Received: by 2002:a1c:9e03:: with SMTP id h3mr32239587wme.112.1567490371389;
        Mon, 02 Sep 2019 22:59:31 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cc01:: with SMTP id f1ls6225441wmh.4.canary-gmail; Mon,
 02 Sep 2019 22:59:30 -0700 (PDT)
X-Received: by 2002:a1c:658a:: with SMTP id z132mr41066618wmb.98.1567490370533;
        Mon, 02 Sep 2019 22:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567490370; cv=none;
        d=google.com; s=arc-20160816;
        b=YgvYXjIkXNo6ZtQriQln0s53hefvoLBJ7NWaXtJSKqp597lKemCAnUZvdYVB7ZrBJf
         9fvf4Eo+dCtk0/EW3ovRkVSBJDBIRFcVT7M7FQWwUU9Nh8601+dRhFx2PPScApfSPiZa
         sc5UJhySSwA+rDp7LeGUeX+z8jH/AC5+mhfWimhhDabwXG0JN5e/cy8HSQ34wRyrdtcj
         B8Kxo/Jtxj8fhiCVb3AKD5JBoN/iaTgYuitOZoMR213kVye4zsUzIYnsIWyLKIDtOm1T
         spSSznf8hG3RPnUdOEpV5zuOarK1RN6GAv08rIKlH9zwEbANrTiZHGIsW0rV1oJGd3gL
         I0hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=Byz6JenvYGEXOS9kUF9fI43PHoWtwaEDrNDiEe5jmas=;
        b=s8YacE6XMqVCd2a7HggJpOFJMtK4kaluOKGFfnTp8r5YCG5HfQuJcLhpM5/hGNzgv1
         cOguehyLdh89hUhYZmjpDopFxoxhM1pj4w0r3V+JLzSH1Z9VZFZ3cWzePga4d3TEe3AX
         v3IJpPXtjZSbe5JEhy+8ujqk/2PAQ+7c6ikAVBLNkloZE7xpX2ihsqoAySGW+CPQn0SU
         nXbohRJTFfloijNRhak3cZyQ/6YSBE34z+iNFTPo6AG30Cr5DRW8rp2sOFSR3Bj2R136
         8K429RHZOKQax11Bnyj5jiI0MdLOkQ6stNm96Kv/G2+5/4L1zG4KpGntdB7J2c0C7CxI
         kwYw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id l9si805024wmc.0.2019.09.02.22.59.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 22:59:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x835xUuE029714
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:30 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.40.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x835xPka010486
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:29 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 13/13] Update to Debian buster
Date: Tue,  3 Sep 2019 07:59:25 +0200
Message-Id: <77b3324d369a9e22fec6165566f4f75be4b47c71.1567490365.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
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

Buster brings gcc 8, and that means we need the related patch for
Jailhouse 0.11.

The non-root-initramfs has to be switches to newer rules format that
allows to disable fakeroot reliably (to avoid the nesting issue).

And the orangepi target can drop the u-boot backport pick - injecting
additional apt sources via the machine conf was broken anyway and would
have exploded when adding a second ARM target.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/distro/jailhouse-demo.conf                    |  2 +-
 conf/machine/orangepi-zero.conf                    |  3 --
 conf/machine/preferences.orangepi-zero.conf        |  7 ---
 .../non-root-initramfs/files/debian/control        |  3 +-
 recipes-core/non-root-initramfs/files/debian/rules | 10 +---
 .../files/0001-arm-Fix-build-with-gcc-8.patch      | 56 ++++++++++++++++++++++
 recipes-jailhouse/jailhouse/jailhouse_0.11.bb      |  3 +-
 7 files changed, 62 insertions(+), 22 deletions(-)
 delete mode 100644 conf/machine/preferences.orangepi-zero.conf
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-arm-Fix-build-with-gcc-8.patch

diff --git a/conf/distro/jailhouse-demo.conf b/conf/distro/jailhouse-demo.conf
index faf2455..93bd0a1 100644
--- a/conf/distro/jailhouse-demo.conf
+++ b/conf/distro/jailhouse-demo.conf
@@ -9,7 +9,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-require conf/distro/debian-stretch.conf
+require conf/distro/debian-buster.conf
 
 KERNEL_NAME ?= "jailhouse"
 
diff --git a/conf/machine/orangepi-zero.conf b/conf/machine/orangepi-zero.conf
index 8d6c134..fb7bb2e 100644
--- a/conf/machine/orangepi-zero.conf
+++ b/conf/machine/orangepi-zero.conf
@@ -14,7 +14,4 @@ DISTRO_ARCH = "armhf"
 IMAGE_TYPE = "wic-img"
 IMAGER_INSTALL += "u-boot-sunxi"
 
-DISTRO_APT_SOURCES_append = " conf/distro/debian-buster.list"
-DISTRO_APT_PREFERENCES += "conf/machine/preferences.orangepi-zero.conf"
-
 IMAGE_INSTALL += "u-boot-script xradio-${KERNEL_NAME}"
diff --git a/conf/machine/preferences.orangepi-zero.conf b/conf/machine/preferences.orangepi-zero.conf
deleted file mode 100644
index 0bdd9ec..0000000
--- a/conf/machine/preferences.orangepi-zero.conf
+++ /dev/null
@@ -1,7 +0,0 @@
-Package: u-boot*
-Pin: release n=buster
-Pin-Priority: 501
-
-Package: *
-Pin: release n=buster
-Pin-Priority: -1
diff --git a/recipes-core/non-root-initramfs/files/debian/control b/recipes-core/non-root-initramfs/files/debian/control
index 059fb16..5ff2c5c 100644
--- a/recipes-core/non-root-initramfs/files/debian/control
+++ b/recipes-core/non-root-initramfs/files/debian/control
@@ -1,9 +1,10 @@
 Source: non-root-initramfs
 Section: misc
 Priority: optional
-Standards-Version: 3.9.6
+Standards-Version: 4.3.0
 Build-Depends: wget, cpio, unzip, rsync, python:native, bc
 Maintainer: Jan Kiszka <jan.kiszka@siemens.com>
+Rules-Requires-Root: no
 
 Package: non-root-initramfs
 Architecture: any
diff --git a/recipes-core/non-root-initramfs/files/debian/rules b/recipes-core/non-root-initramfs/files/debian/rules
index 0f7f079..6f2638b 100755
--- a/recipes-core/non-root-initramfs/files/debian/rules
+++ b/recipes-core/non-root-initramfs/files/debian/rules
@@ -13,22 +13,14 @@
 DPKG_EXPORT_BUILDFLAGS = 1
 include /usr/share/dpkg/default.mk
 
-build-image:
+override_dh_auto_configure:
 	cp ../.config .
 	${MAKE} olddefconfig
-	${MAKE}
-
-# Only this target runs outside of fakeroot. We need to hook into it because
-# buildroot uses fakeroot itself.
-build: build-image
 
 # This target saves autotools outputs from output/. But we perform a clean
 # rebuild so that restoring the files may fail and is also not needed.
 override_dh_update_autotools_config:
 
-# We are building via build-image.
-override_dh_auto_build:
-
 # No test desired.
 override_dh_auto_test:
 
diff --git a/recipes-jailhouse/jailhouse/files/0001-arm-Fix-build-with-gcc-8.patch b/recipes-jailhouse/jailhouse/files/0001-arm-Fix-build-with-gcc-8.patch
new file mode 100644
index 0000000..ade9989
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/files/0001-arm-Fix-build-with-gcc-8.patch
@@ -0,0 +1,56 @@
+From 9f233898917f8c1141132606f2f2c624405d8c81 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Sat, 13 Jul 2019 12:08:40 +0200
+Subject: [PATCH] arm: Fix build with gcc-8
+
+The inline .arch_extension statements are ignored by gcc-8. We rather
+need -march=armv7ve now.
+
+To keep older gcc prior to version 5 happy, leave the inline statements
+in place. Can be removed once we require newer gcc for other reasons.
+
+Reported-by: Vitaly Andrianov <vitalya@ti.com>
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ hypervisor/arch/arm/Makefile              | 2 +-
+ hypervisor/arch/arm/include/asm/smc.h     | 1 +
+ hypervisor/arch/arm/include/asm/sysregs.h | 1 +
+ 3 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/hypervisor/arch/arm/Makefile b/hypervisor/arch/arm/Makefile
+index 2f930cf3..a170b593 100644
+--- a/hypervisor/arch/arm/Makefile
++++ b/hypervisor/arch/arm/Makefile
+@@ -12,4 +12,4 @@
+ 
+ LINUXINCLUDE += -I$(src)/arch/arm-common/include
+ 
+-KBUILD_CFLAGS += -marm
++KBUILD_CFLAGS += -marm -march=armv7ve
+diff --git a/hypervisor/arch/arm/include/asm/smc.h b/hypervisor/arch/arm/include/asm/smc.h
+index 34944a2d..5cde3d8b 100644
+--- a/hypervisor/arch/arm/include/asm/smc.h
++++ b/hypervisor/arch/arm/include/asm/smc.h
+@@ -10,6 +10,7 @@
+  * the COPYING file in the top-level directory.
+  */
+ 
++/* for gcc < 5 */
+ asm (".arch_extension sec\n");
+ 
+ static inline int smc(unsigned long id)
+diff --git a/hypervisor/arch/arm/include/asm/sysregs.h b/hypervisor/arch/arm/include/asm/sysregs.h
+index 76dd5b55..b7eaccf6 100644
+--- a/hypervisor/arch/arm/include/asm/sysregs.h
++++ b/hypervisor/arch/arm/include/asm/sysregs.h
+@@ -283,6 +283,7 @@
+ #define arm_read_sysreg(...) _arm_read_sysreg(__VA_ARGS__)
+ 
+ #ifndef __ASSEMBLY__
++/* for gcc < 5 */
+ asm(".arch_extension virt\n");
+ 
+ #define arm_write_sysreg_32(op1, crn, crm, op2, val) \
+-- 
+2.16.4
+
diff --git a/recipes-jailhouse/jailhouse/jailhouse_0.11.bb b/recipes-jailhouse/jailhouse/jailhouse_0.11.bb
index 4d7aca1..5df3597 100644
--- a/recipes-jailhouse/jailhouse/jailhouse_0.11.bb
+++ b/recipes-jailhouse/jailhouse/jailhouse_0.11.bb
@@ -13,7 +13,8 @@ require jailhouse.inc
 
 SRC_URI += " \
     file://nuc6cay_0.11.c \
-    file://linux-nuc6cay-demo_0.11.c"
+    file://linux-nuc6cay-demo_0.11.c \
+    file://0001-arm-Fix-build-with-gcc-8.patch"
 
 SRCREV = "58052a7a9d1f5904d72b1637282c877172ee69f6"
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/77b3324d369a9e22fec6165566f4f75be4b47c71.1567490365.git.jan.kiszka%40siemens.com.
