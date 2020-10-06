Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQPG575QKGQEBHMPQHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9632844EE
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:32:02 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id s12sf646292wmj.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:32:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958721; cv=pass;
        d=google.com; s=arc-20160816;
        b=H15Eui5IbTuZdVnjZztJqZ9Mjh8Hh2z/tFc/i6e8mg5dd1cpRRKLk0gvDbSIg4ulsF
         PFSFa2jGNPKrmkc5C0RgcXFcrCKrlYt+NkeQ7ux0phDwG+6CN70kfhtasboX8STIkpxU
         r4YYiSA/vTdsQyjGyyQ1zp5EPQADp1wWH9PTg5iwlXJhraoyrYuU+OpUn7YQ/jTC6PCM
         9XFUWQi22iAT3sg3auJRs1YeNtxE/okke3uPPYLzg3qoJquLHD0g1E//NA1KcPdNiEVG
         RePZxaFXnk/MMjnTUhWEmTO9sLA+nZCh3e8AASWjx7VDWvWPebnQQwXsUYGl+POZijAP
         myvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=zqNlZv2D0bkNZqA48PVJZbwkyLpe1IWY+W/nxyO/H4U=;
        b=gzopyoYx3/ykcJEAHzVI5aWEmXo0M4gcvsgyekOJQZBdKHOQhKVuQGxfhseMf8j8ij
         97uB2Mxnp44KqFZg+Lr8XEQadhUQqy5KBmse2GUstgj2/v/Fa5bBBp4bGucoqD2/6KMA
         7nB+AAPSWo4nOoFu1MSwu1S87fOHoQxPg8X0LXWzXeGkXesz7eo+Pv9EqAbANgO97pfc
         B0vRxqpdKNdz4b79VPuaApofrS7XB7zjZ/dAxA+d38G+dlRs3mS+O/iBHoZU1PsXDF4Z
         KI7Cv9JCquvbCr4vCqOSoM4FxSTz7LIbrB3FCSTRu8SW7H9dnkhHZXxcU347iHtV1JZH
         yW5A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zqNlZv2D0bkNZqA48PVJZbwkyLpe1IWY+W/nxyO/H4U=;
        b=e804bfvkr5vLXfPkb+XnyF0ibrIDc2l9NtvByZ6xDJnLVW3D8Om3VeUM+UXz2/SVp8
         RBWsedD8xX1GMj8FZ2ywHwJw9t88nrJs+veQ9OgQuk8G0FK6OaQRYCBxWO/d1NFW18wa
         bhum/dPMbu/JyU6sivycgDeIfXsuWXFmBD9wD2KV1syUq99E4t5KRLSvwznxGchBOauB
         wGiG5NRfCbXiYtD2xK27stCI5+IoUBu42UeYEpWBbxSXv6Zv6XLYWFuvVd9vzxIAp8Xz
         V2RXfVyP58hQn/t/G3jmSzK+Yg5a8koD1X9UtMu+MRmEvnN+K8D31iqawJRScqQA08jW
         X+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zqNlZv2D0bkNZqA48PVJZbwkyLpe1IWY+W/nxyO/H4U=;
        b=VeDxYKiNJKj87qZjbchBSthhjyykhG6h+eh5HP4C+yZHdZQwH6isYVQz7jMhRGa7NF
         Iy7/Py6D/tMDrbqJc2GLaoUhvVHNDonZy7053aQSaSMozEuGZ264MO/GhGL5Sn4mUrcU
         YAESZOescIaqgH2vp/D0IZd/s1KA71/4DNM+yh81adajdLBXoB+JMhI8X18yCx1hWS/E
         DRJJC2hZAJHEdtk1ZeIvu8Vvv41ZBV7GBmPHQYUgkMLRRYPL3zG6+FwVwMvRmX20uFN/
         SdVxaotIouFw6/2j6It5CyTQlsk/atntndVacjL61WquZjzFcsEeknmL590DUh4hG4LV
         rEEA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530ZfcDde4XBL5MO2Iyh//iuk5oUywhjpRDghkid+vpxErnqhl0V
	biLcZqPooJStgl/oUmNw1J8=
X-Google-Smtp-Source: ABdhPJwqYJhJh8kUxW1uY4MCoFXpJlpWWalvW9tY8FhvQcygxmZbaBNnuCXlLVQtM62dE05w6r7qvA==
X-Received: by 2002:a5d:55c8:: with SMTP id i8mr2589345wrw.331.1601958721822;
        Mon, 05 Oct 2020 21:32:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:98d8:: with SMTP id a207ls527843wme.2.canary-gmail; Mon,
 05 Oct 2020 21:32:00 -0700 (PDT)
X-Received: by 2002:a1c:3505:: with SMTP id c5mr2665884wma.65.1601958720814;
        Mon, 05 Oct 2020 21:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958720; cv=none;
        d=google.com; s=arc-20160816;
        b=nlA8tGF9M9LvhhPUcNFMt4LtiR5fnnuncB2Uf9f7c1CdcO425cFYNjb8Srs8YjQcXo
         n/ta1RjgayroEUiHnngndmHym0p/o16s33kurEPof0EJnnv7siSi4rn+2rt0hb7O/oaf
         mP5iTGZ5dZnO1DAJQ05gj//dYeviRGoGUgYMcxJ3eh1DJgVxaV8h0OCZDQIPrscZrUW4
         u6GVqT3MxtS0LGG3gRmeQStCWe6XPbWMMMJ4UtfWrLRCcLf/J/SNUP1M8TVhbZCOXuzD
         CMED3x4ogZSOyzI8wzCzRJ1+ZjeBlmfSZj2bZ92ui1y5YIl5LlPb+DidWnA/pDByhabd
         SCTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=18w7VkGPeAY2fHqBt+1sSaw/sqG6sNPnHzvQhX0FCOo=;
        b=RIQuN3o2GVM64wSGOSk5B++IeXfm+p53OFb+DvFxs0Hzcf0tMY2lUJaqQFp0XGXCBK
         Ql+Z2qD7oQHp+nrGkZdJ5jTNatmym1sGFr24Dcu4uKHZZyNu65RPjYCa7HLZT627jgsC
         XEIADSIo+QJn+rkHC9TkN/cJHgZ8t++DGO9m8ohz6JusXrVyVgGmp6ZwAkJK5tGn8wtQ
         zi0/iH3idj2YPSF+w85QAWKbUFjGtkefeXBN5FsQdDee4fQjgyo3rcw5Fr6tRTvpPTJp
         FjJ5wEQqrN2G5mpB+hyB3DFACAqOT5I1Wzgye59JgRZICNtTivtKq037sjugTf7xiK1Z
         50Ag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id b1si36182wmj.1.2020.10.05.21.32.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:32:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0964W0I0028748
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:32:00 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY83008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:59 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 17/19] ultra96: Convert to stand-alone TF-A recipe and update versions
Date: Tue,  6 Oct 2020 06:31:32 +0200
Message-Id: <4678a9cb5720c08dce06b4222c0d51a3aa72ab3d.1601958694.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601958694.git.jan.kiszka@siemens.com>
References: <cover.1601958694.git.jan.kiszka@siemens.com>
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

Rework the U-Boot recipes to use TF-A as a package, rather than building
it in an embedded fashion.

While at it, bump to TF-A 2.3 and U-Boot 2020.10. The latter allows to
drop one patch.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../trusted-firmware-a-ultra96_2.3.bb         | 17 ++++++++++
 ...efile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch | 31 -------------------
 recipes-bsp/u-boot/files/ultra96-rules        |  3 --
 recipes-bsp/u-boot/files/ultra96.bif.tmpl     |  2 +-
 ...atf2.2.bb => u-boot-ultra96-v1_2020.10.bb} | 21 ++++---------
 .../u-boot-ultra96-v2_2019.10-atf2.2.bb       |  1 -
 .../u-boot/u-boot-ultra96-v2_2020.10.bb       |  1 +
 7 files changed, 25 insertions(+), 51 deletions(-)
 create mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.3.bb
 delete mode 100644 recipes-bsp/u-boot/files/0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch
 rename recipes-bsp/u-boot/{u-boot-ultra96-v1_2019.10-atf2.2.bb => u-boot-ultra96-v1_2020.10.bb} (50%)
 delete mode 120000 recipes-bsp/u-boot/u-boot-ultra96-v2_2019.10-atf2.2.bb
 create mode 120000 recipes-bsp/u-boot/u-boot-ultra96-v2_2020.10.bb

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
diff --git a/recipes-bsp/u-boot/u-boot-ultra96-v1_2019.10-atf2.2.bb b/recipes-bsp/u-boot/u-boot-ultra96-v1_2020.10.bb
similarity index 50%
rename from recipes-bsp/u-boot/u-boot-ultra96-v1_2019.10-atf2.2.bb
rename to recipes-bsp/u-boot/u-boot-ultra96-v1_2020.10.bb
index fd593f7..bfee2fe 100644
--- a/recipes-bsp/u-boot/u-boot-ultra96-v1_2019.10-atf2.2.bb
+++ b/recipes-bsp/u-boot/u-boot-ultra96-v1_2020.10.bb
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
diff --git a/recipes-bsp/u-boot/u-boot-ultra96-v2_2020.10.bb b/recipes-bsp/u-boot/u-boot-ultra96-v2_2020.10.bb
new file mode 120000
index 0000000..32bbb1e
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-ultra96-v2_2020.10.bb
@@ -0,0 +1 @@
+u-boot-ultra96-v1_2020.10.bb
\ No newline at end of file
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4678a9cb5720c08dce06b4222c0d51a3aa72ab3d.1601958694.git.jan.kiszka%40siemens.com.
