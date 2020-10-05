Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLHD5L5QKGQEFZV2TZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FA228302D
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:57 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id h17sf2814207lfc.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876397; cv=pass;
        d=google.com; s=arc-20160816;
        b=LHzKUxwozeM4+qxOomfj0bS5Q2DZvz3POZSGXySWsxE1LYVwpoYghq99mLcnqHllGH
         3fZrA1fMxAMdPkqECT7q/Yi3frWfY+89FNo6897CmN7zClu+eC02N0MPYOoWN67xBUum
         IUg7b6gStr4qtJyBOe48bHGpvtCmXHSsrKZnOxWw1Qt+AxiDJb/btdFXOnJ36WkZuZfX
         v4qaInd2smyGpZF3t6mg+4H9loc5pJ7rKD+fCDAPVFm0RVyVR0CJPfiV9CufVly6caNW
         PDtvqoKP03f4P2wOKlEbkX5LMWWCYLkF/kQbZdQfp+69/QZndRH9EBjwZnScUrJL5b6P
         +9fA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=pryX8kb5WDy6VjMdZOG9tEeWKiLMqXyb1W5gR2FQivY=;
        b=nEETQPw2Iiyl6F0mTQTqPrJ2uYDvntmDKBo9KfswqU5FDKt+yi/s4LPYdaj8ApcMNc
         34zUbnbavBJw1/tjhDOtu0Xxpmv4rutpxbiZZEKGmKUuz7BRd6efIxZHknlL3ywGg+Om
         2oUN5H42fXiydJ0m2JHl7H4Gjwar0pAPTgI3ma5RhJlSeEvmF/rZjXSlEF5EKFH8JfWP
         dDQxi2ZlDV+jSyQ9ic3bBsyFQ9pyW7sxmBTBSM6zRfpkIuLPQCMonzc9lFLASN8RWJZ8
         uG3qq1qAFkAIV8jqfZzwdSnBh8TWpJLRgJ5x5hEx/x7lfCKUUVEHSaYUpu6FYbzYDRqw
         ukRw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pryX8kb5WDy6VjMdZOG9tEeWKiLMqXyb1W5gR2FQivY=;
        b=VM+hmEoZs3vel/xDnozW+lKenyM9DIJoiA97TfrA8vXfKOtu5gzTjbRBClGTEZxSty
         PttmLIAgkXplQBxLVV6wbVjyjRCUfzDQdIaEwX1GmbKBdaBbgmRORevgxqVcB4AJjuop
         1n3ZdhDvGoOvMs9/L1PuGSzxCdyba4VKO4EjEvOqMkkJ7iavE2/KTv2BhIdj0o/nr6bc
         JEnTE9cq4Ijhbq3McTVtcek5dBCVmN+KesXCmUU02vWp84+fKeuS0IoO8GIHSsjgHQKR
         V6cj+0YfhU1jc5slkKn2qFBtXiSAzjl3KHJMzVlqUiaYVv2OdrXIsRM0ugQ+RZG6WNdy
         gfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pryX8kb5WDy6VjMdZOG9tEeWKiLMqXyb1W5gR2FQivY=;
        b=tTeEjhgarCFn0M/6WyF1SG/b8m5XHY1o610ahrQ3vFYyqHxXZojPZZsOLUplo0xry0
         2FOyIhrjAbJkfAaLYFewshtOiPZ0SgHvAoigU0KUithdxh+9F/Z6QXOYVi60NZEzaFz+
         q5x7W1uKJVr29PzoaBgJhRNvluBbuVmHAbNvXsqMe7w21atuMI7KKZbQb4NeQ7wOYqA4
         guCVaZzobsE1UoKl4cRaIojr9wVEZ9TytbfGOgurFGj71nJv2Lh5Z+3TslnrxoA/3IhP
         p5k4BKfZEQEsP4rYuvuHqddioNMD3p9PssEwCQ0U9+5cBPY4U5/j1rOS81epNca6uPwc
         SYdg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533CtkTS4iu+dYf2iyJDDEhd3upRSuYy3nEJ4x7mV/uzwUk5emK5
	vhwPcLkVvh9A61NiX8Zz4SI=
X-Google-Smtp-Source: ABdhPJzFtX9KAqROBIVoSN8M8d3lTg6MF7u+y69XpSDGd9qJoLYeSnzzX/DcKlmYMH8DCeepPx+/Lw==
X-Received: by 2002:a2e:9b96:: with SMTP id z22mr1643385lji.181.1601876396797;
        Sun, 04 Oct 2020 22:39:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7c08:: with SMTP id x8ls871524ljc.6.gmail; Sun, 04 Oct
 2020 22:39:55 -0700 (PDT)
X-Received: by 2002:a2e:a162:: with SMTP id u2mr2482648ljl.7.1601876395416;
        Sun, 04 Oct 2020 22:39:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876395; cv=none;
        d=google.com; s=arc-20160816;
        b=RNaGCc151upAxj9GMHk7N+oKwXgpXCZ++C5Gqdnsp5ylonF2QUoHDRltfNrNtcexms
         OtraidXQzAgtZYKO4bWXXGkIJOmblsxdP7zM6OxKJmd0ebflBzCVWiymShDJt3GoAHm+
         5Zo90QKBvmOgqNheYKp3fqcZLFPMVqVpaFfODAp1R1ddMLqa8ji+o0lFqRRcsjLrMffE
         6XQ23JQqmwCK8LLcjDbyC0rvpbmXnZr3ZeQjbhntbtd9YG3mnIKy0mFJgqL+UQ0g6Prg
         76uJS9TvLWsHiZvy4w4iX2VdwcfUg48HSusuIVG0ap3mRRJ1FZoH14TiNxkLOLi7yxje
         C68g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=qxkFzIEWe0hDVu0Qd/oHmdWGKJjDOr2omstVThHjmY0=;
        b=XzlrC4Rsi8FRA/HpTm77ZKMCdpqzyaSiEJ1hnZE09kLxITl6hsqUqwjaCYA5u8bGr7
         meULq1vtGAC1+S/QNHbQ9O4d7616QEUjkCufL2DJRU4m6XeLVWvuEOcKNYPqR7z1P9Rz
         f23Nvov8DdV4xhKEFMxb775jbNRGaMLmoKxPBhwCbqBcykIK2PhJn4r2TOdUTgiFd9ZG
         NUGoAPONblsyo1ydNSBMKSYWa7/+xBleTs/gT+IczhPIqgOYxshWOecdb1FG87SnY98U
         28MGIzyP3K5rNGDyAdj5Jq6P6kbaWw9WJEY/eJQCuEtqP23krDMs6F1CUI3zjeOcxe4D
         QZOw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id l82si183566lfd.13.2020.10.04.22.39.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0955dsMF031155
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:54 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncQ025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:54 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 17/19] ultra96: Convert to stand-alone TF-A recipe and update versions
Date: Mon,  5 Oct 2020 07:39:47 +0200
Message-Id: <884c6836e953a772a57981c5650e0edeb464aadd.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
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

Rework the U-Boot recipes to use TF-A as a package, rather than building
it in an embedded fashion.

While at it, bump to TF-A 2.3 and U-Boot 2020.07. The latter allows to
drop one patch.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../trusted-firmware-a-ultra96_2.3.bb         | 17 ++++++++++
 ...efile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch | 31 -------------------
 recipes-bsp/u-boot/files/ultra96-rules        |  3 --
 recipes-bsp/u-boot/files/ultra96.bif.tmpl     |  2 +-
 ...atf2.2.bb => u-boot-ultra96-v1_2020.07.bb} | 21 ++++---------
 .../u-boot-ultra96-v2_2019.10-atf2.2.bb       |  1 -
 .../u-boot/u-boot-ultra96-v2_2020.07.bb       |  1 +
 7 files changed, 25 insertions(+), 51 deletions(-)
 create mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.3.bb
 delete mode 100644 recipes-bsp/u-boot/files/0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch
 rename recipes-bsp/u-boot/{u-boot-ultra96-v1_2019.10-atf2.2.bb => u-boot-ultra96-v1_2020.07.bb} (50%)
 delete mode 120000 recipes-bsp/u-boot/u-boot-ultra96-v2_2019.10-atf2.2.bb
 create mode 120000 recipes-bsp/u-boot/u-boot-ultra96-v2_2020.07.bb

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.3.bb b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.3.bb
new file mode 100644
index 0000000..7b8b48b
--- /dev/null
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.3.bb
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
+require trusted-firmware-a_${PV}.inc
+
+TF_A_NAME = "ultra96"
+TF_A_PLATFORM = "zynqmp"
+TF_A_EXTRA_BUILDARGS = "RESET_TO_BL31=1 ZYNQMP_CONSOLE=cadence1"
+TF_A_BINARIES = "bl31/bl31.elf"
diff --git a/recipes-bsp/u-boot/files/0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch b/recipes-bsp/u-boot/files/0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch
deleted file mode 100644
index ac20d26..0000000
--- a/recipes-bsp/u-boot/files/0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 06b5faeb1e6b18c86dc5fcdd1cc764ee49da1fbe Mon Sep 17 00:00:00 2001
-From: Jan Kiszka <jan.kiszka@siemens.com>
-Date: Sun, 25 Aug 2019 13:39:41 +0200
-Subject: [PATCH] Revert "tools/Makefile: fix HOSTCFLAGS with
- CROSS_BUILD_TOOLS"
-
-This reverts commit 72c69ea8d603fd2448dd1d7c399c4f77b77773b7.
-
-Breaks CROSS_BUILD_TOOLS=y build with CONFIG_FIT and without
-CONFIG_FIT_SIGNATURE.
-
-Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
----
- tools/Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/tools/Makefile b/tools/Makefile
-index 33e90a8025..2717304003 100644
---- a/tools/Makefile
-+++ b/tools/Makefile
-@@ -274,7 +274,6 @@ subdir- += env
- 
- ifneq ($(CROSS_BUILD_TOOLS),)
- override HOSTCC = $(CC)
--override HOSTCFLAGS = $(CFLAGS)
- 
- quiet_cmd_crosstools_strip = STRIP   $^
-       cmd_crosstools_strip = $(STRIP) $^; touch $@
--- 
-2.16.4
-
diff --git a/recipes-bsp/u-boot/files/ultra96-rules b/recipes-bsp/u-boot/files/ultra96-rules
index a21e468..639c9ef 100644
--- a/recipes-bsp/u-boot/files/ultra96-rules
+++ b/recipes-bsp/u-boot/files/ultra96-rules
@@ -18,9 +18,6 @@ endif
 PARALLEL_BUILD=-j $(shell echo $$(($$(nproc) * 2)))
 
 override_dh_auto_build:
-	$(MAKE) $(PARALLEL_BUILD) -C ../arm-trusted-firmware-* \
-	        PLAT=zynqmp RESET_TO_BL31=1 bl31
-
 	echo "CONFIG_BOOTCOMMAND=\"setenv fdtfile xilinx/avnet-ultra96-rev$(ULTRA96_VERSION).dtb; run distro_bootcmd\"" \
 	    >> configs/${U_BOOT_CONFIG}
 	echo "CONFIG_WATCHDOG=n" >> configs/${U_BOOT_CONFIG}
diff --git a/recipes-bsp/u-boot/files/ultra96.bif.tmpl b/recipes-bsp/u-boot/files/ultra96.bif.tmpl
index e972929..64af516 100644
--- a/recipes-bsp/u-boot/files/ultra96.bif.tmpl
+++ b/recipes-bsp/u-boot/files/ultra96.bif.tmpl
@@ -14,6 +14,6 @@ image : {
 	[pmufw_image] /usr/share/zynqmp-pmufw/executable.elf
 	[bootloader, destination_cpu=a5x-0] ../ultra96-v${ULTRA96_VERSION}-fsbl.elf
 	../ultra96-v${ULTRA96_VERSION}.bit
-	[destination_cpu=a5x-0, exception_level=el-3,trustzone] ../arm-trusted-firmware-${ATF_PV}/build/zynqmp/release/bl31/bl31.elf
+	[destination_cpu=a5x-0, exception_level=el-3,trustzone] /usr/lib/trusted-firmware-a/ultra96/bl31.elf
 	[destination_cpu=a5x-0, exception_level=el-2] u-boot.elf
 }
diff --git a/recipes-bsp/u-boot/u-boot-ultra96-v1_2019.10-atf2.2.bb b/recipes-bsp/u-boot/u-boot-ultra96-v1_2020.07.bb
similarity index 50%
rename from recipes-bsp/u-boot/u-boot-ultra96-v1_2019.10-atf2.2.bb
rename to recipes-bsp/u-boot/u-boot-ultra96-v1_2020.07.bb
index fd593f7..bfee2fe 100644
--- a/recipes-bsp/u-boot/u-boot-ultra96-v1_2019.10-atf2.2.bb
+++ b/recipes-bsp/u-boot/u-boot-ultra96-v1_2020.07.bb
@@ -9,34 +9,25 @@
 # SPDX-License-Identifier: MIT
 #
 
-U_BOOT_PV="${@d.getVar('PV').split('-atf')[0]}"
-ATF_PV="${@d.getVar('PV').split('-atf')[1]}"
-
-require recipes-bsp/u-boot/u-boot-custom.inc
-require recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_${ATF_PV}.inc
+require u-boot-${PV}.inc
 
 ULTRA96_VERSION ?= "1"
 
 SRC_URI += " \
-    https://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
-    file://0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch \
     file://ultra96-v${ULTRA96_VERSION}.bit.xz \
     file://ultra96-v${ULTRA96_VERSION}-fsbl.elf.xz \
     file://ultra96.bif.tmpl \
     file://ultra96-rules \
     "
-SRC_URI[u-boot.sha256sum] = "8d6d6070739522dd236cba7055b8736bfe92b4fac0ea18ad809829ca79667014"
 
 TEMPLATE_FILES += "ultra96.bif.tmpl"
-TEMPLATE_VARS += "ATF_PV ULTRA96_VERSION"
-
-DEPENDS += "zynqmp-pmufw"
-BUILD_DEPENDS += ", zynqmp-pmufw:native"
+TEMPLATE_VARS += "ULTRA96_VERSION"
 
-U_BOOT_CONFIG="avnet_ultra96_rev1_defconfig"
-U_BOOT_BIN="u-boot.elf"
+DEPENDS += "zynqmp-pmufw trusted-firmware-a-ultra96"
+BUILD_DEPENDS += ", zynqmp-pmufw:native, trusted-firmware-a-ultra96"
 
-S = "${WORKDIR}/u-boot-${U_BOOT_PV}"
+U_BOOT_CONFIG = "xilinx_zynqmp_virt_defconfig"
+U_BOOT_BIN = "u-boot.elf"
 
 do_prepare_build_append() {
     cp ${WORKDIR}/ultra96-rules ${S}/debian/rules
diff --git a/recipes-bsp/u-boot/u-boot-ultra96-v2_2019.10-atf2.2.bb b/recipes-bsp/u-boot/u-boot-ultra96-v2_2019.10-atf2.2.bb
deleted file mode 120000
index 69f9e26..0000000
--- a/recipes-bsp/u-boot/u-boot-ultra96-v2_2019.10-atf2.2.bb
+++ /dev/null
@@ -1 +0,0 @@
-u-boot-ultra96-v1_2019.10-atf2.2.bb
\ No newline at end of file
diff --git a/recipes-bsp/u-boot/u-boot-ultra96-v2_2020.07.bb b/recipes-bsp/u-boot/u-boot-ultra96-v2_2020.07.bb
new file mode 120000
index 0000000..7cd683f
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-ultra96-v2_2020.07.bb
@@ -0,0 +1 @@
+u-boot-ultra96-v1_2020.07.bb
\ No newline at end of file
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/884c6836e953a772a57981c5650e0edeb464aadd.1601876389.git.jan.kiszka%40siemens.com.
