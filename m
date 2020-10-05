Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLHD5L5QKGQEFZV2TZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC9B28302E
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:57 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id a17sf2808112lfl.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876397; cv=pass;
        d=google.com; s=arc-20160816;
        b=VH2mODcOO5EQiE0eYAEcJ/HA0DHugP+CCvTll+fybycRONwSYLCriNakMtSFmpJkJT
         3v+le3PV9+F0i6+1MnH8q83RUK2e1VfX8DAd51DjX6/oXWoQICGO7ovIQk2kRl9u+xfA
         vpRYAZFJPj0t1n1BNcgfNTRpEaHEvDr7nkPefbHyR2cPlHyUSaLQazzbNTPmID1n1Vci
         F3f1dMDlxyfjjZTS0Nj3iiivwbJrvEL3eswzrNyKfPP4h+nmIiT8Brr3jZlpUdkM9y39
         MzQ4KULrWkuDTg4a5vBOhe3lVYiQWPtPj77A/oF0P0LVCko6doiP91htQ9QHm0FBXq+Y
         fhjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=mNQGXvniaquCguqGoDSd3rulz8I0nH1F2B/GlJIZgYg=;
        b=CSHDGJElnevN2H8869ULF1SMG3bq/r5abCtbeNO718UDW6UwoLR6IFsatMVdK+gMqf
         j5ZhYBLNyDEesY6evfXRPUbn25CAcZWGF9vvSP0B3JlcswELboZcU0bBiIFYUuJsR7ZM
         h6R5ijbXyg/gJXmEHza8aIPgbPeSRsT1doImth8HYdtpA5+yr48KOV7IkWfLakTAVSVp
         y4mQiyMGVtvPKn4ExolzWObZhLX0UZsOOWg5UJ9RRs1NcKun/RD669CCYCZPn+CHJtue
         wjpte/glKe30rcoN0insmz+DTr8bgNa2F+u7ttidMJ0TIQ5xGwHtLJXvCopa+PDuVfkp
         zWTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mNQGXvniaquCguqGoDSd3rulz8I0nH1F2B/GlJIZgYg=;
        b=VNLl8boRCCYR5UGiUIPeh/Em6/w0WG461Idzgk6lAJgH6cH+kXwcZLxzxGmubEAZkT
         k9CeTvaUawe8iBYGxVPY7PLypwLWKGqsa0AplxX909lhYYM7qBEytxSoREkynzmxxs1V
         WbjEKYOs7QRm2zyjLgGDGp3oyPSWAJqwcwOZ3X9Q7+YK/QOvnWSuYUgZ1YV3EDTXEvS3
         2SAR7Wb+NdGFF0zXBSg86rH99n0yDDurA61bq3jAnKxTq7YG7Fx35cf9xSoYvRQK8+hz
         pwDw7GWTQw9S6djnVuEiLtZwAyNZ4hWJnzCk3i1BHyVS9aDzsj6UNVurF8mRdN63RTIP
         rpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mNQGXvniaquCguqGoDSd3rulz8I0nH1F2B/GlJIZgYg=;
        b=hAY8MsQbSfVQ6M9NP3rlaAdmsW5NM36ipUAsoUv6HkZn4VAbWf52DWwKerB6V7Uy/G
         Xp3ernkNQZZ19o8fGoiFLIf7+ato5QQogkroX5ZIF8HYmm6OV3woNWpW65s2Lp/xYZ1X
         HDD0JWpArCUhc3N71foMZ/mpuCNDhuHuN1u3BLqB8k+ZSlV51i3Rna+HvVvwBVuGEntT
         pKoGjpgxHZb4/cckJuEI//tLVQsQWT7jf0vOIF/O3MBr2zLQXU7/nVN8eamM6NYd6yYP
         VVU1LSII7Y6zjBCYo2k2kE+tTv1AEDimtG4Z0nB2nI6yqmukcqVqOG3rHd/qgQWKN849
         cU3Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531338H4lNS0Em2nN9OC/Cwzj4rALcfxBXIfOS/2K1kd4xehdpI4
	vR+S+yK00xzqxn/UorBAKwc=
X-Google-Smtp-Source: ABdhPJyGCSQe5kPkkVAq+/6DKVreJjhNuPlP4nRerCymtGLYnvfcufVjRb7smu8eYcTnAXdfgDvviw==
X-Received: by 2002:a19:8ad4:: with SMTP id m203mr5450061lfd.183.1601876397074;
        Sun, 04 Oct 2020 22:39:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:86c8:: with SMTP id n8ls871400ljj.1.gmail; Sun, 04 Oct
 2020 22:39:55 -0700 (PDT)
X-Received: by 2002:a2e:8884:: with SMTP id k4mr3990362lji.333.1601876395766;
        Sun, 04 Oct 2020 22:39:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876395; cv=none;
        d=google.com; s=arc-20160816;
        b=AmdY1yH1PU6WzQox3oDWMQoltXLcdThTfrpKDWdp9FErbUZUG8awRJETKlM1LKTscN
         Ov8ClEHYzLtS9xsNlatOQtVtgQierT0hlOmDpw/uCMDjli7lEYgaZbCFB13UqJFTIzZz
         GHpC3mdUsV98Vm1H/kV2DXLizEzrSFWNSC66YVDsk641LOaj80nXga/PBG5bJu+1vaVR
         wdFyGrKV2o0D9x4UttyzpYTa2/29r+0Ffbc5jKAsNt9Sbzu/C709Ty3IKhNGxdFebON0
         mGt2DZm8wbQgMdsR+JPD9KqQ5Kn9sJCxXN0otYETgTIyXoZFNtfb7lZFS7hAlYfv2Gcz
         d1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=E42LyEdpx11Qw46bGmy66HNVTZGHaXKueiEnfuqaQRU=;
        b=bvSmZ9ohq5hiHD8MLsXtQqPQcbHFi9zLrlueVAqi8Hbzj9OMSGgkSR7W/c1BIlTZ3V
         KkgerappDgunp25XLfFVJwOxA5FLWXboCY5qu+WxMBr6SR6qlmL9N8ftGBqH1CQoSyeg
         hvTiGcutcXN+9j8Y/ztTd0MEgCHA9PnYOMM8w02kcUCy3GDNLdwXBkgvYvBAd1mrfA8k
         T4q2rpNJCeRt4AWU6rOFip1ko1Q4PCzWKySYUE1lt0Uw2AufaSvCXJF+tXasn0Sg7agW
         Y/+s5JWD7DCRB6uTo0OUR+MmwPr0EBJPw7+yRbRTGn4U7WmYuahAwaHqd6Fsss12Qxrt
         3N/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id q20si225150lji.2.2020.10.04.22.39.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0955dt2u002244
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:55 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncR025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:54 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 18/19] macchiatobin: Convert to stand-alone TF-A recipe and update versions
Date: Mon,  5 Oct 2020 07:39:48 +0200
Message-Id: <4741ccfb52ae7c66ac129f505ab7c2a546f39893.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
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

This means turning things around: U-Boot is built first as dependency of
TF-A. IMAGER_INSTALL and IMAGER_BUILD_DEPS are updated to pull TF-A.
And the TF-A artifacts mv-ddr-marvell and binaries-marvell are moved to
the new stand-alone recipe.

While at it, bump to TF-A 2.3 and U-Boot 2020.07. TF-A needs one patch
backported from the development tree in order to fix parallel build for
the a80x0_mcbin platform.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/machine/macchiatobin.conf                |   4 +-
 ...se-abspath-to-dereference-BUILD_BASE.patch | 144 ++++++++++++++++++
 ...-fix-gcc-warning-about-uninitialized.patch |   0
 .../trusted-firmware-a-macchiatobin_2.3.bb    |  34 +++++
 .../trusted-firmware-a_2.3.inc                |   2 +
 recipes-bsp/u-boot/files/macchiatobin-rules   |  40 -----
 .../u-boot-macchiatobin_2019.10-atf2.2.bb     |  43 ------
 .../u-boot/u-boot-macchiatobin_2020.07.bb     |  15 ++
 wic/macchiatobin.wks                          |   2 +-
 9 files changed, 198 insertions(+), 86 deletions(-)
 create mode 100644 recipes-bsp/trusted-firmware-a/files/0001-Use-abspath-to-dereference-BUILD_BASE.patch
 rename recipes-bsp/{u-boot => trusted-firmware-a}/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch (100%)
 create mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.3.bb
 delete mode 100644 recipes-bsp/u-boot/files/macchiatobin-rules
 delete mode 100644 recipes-bsp/u-boot/u-boot-macchiatobin_2019.10-atf2.2.bb
 create mode 100644 recipes-bsp/u-boot/u-boot-macchiatobin_2020.07.bb

diff --git a/conf/machine/macchiatobin.conf b/conf/machine/macchiatobin.conf
index 4829500..6a784b8 100644
--- a/conf/machine/macchiatobin.conf
+++ b/conf/machine/macchiatobin.conf
@@ -12,7 +12,7 @@
 DISTRO_ARCH = "arm64"
 
 IMAGE_TYPE = "wic-img"
-IMAGER_INSTALL += "u-boot-macchiatobin"
-IMAGER_BUILD_DEPS += "u-boot-macchiatobin"
+IMAGER_INSTALL += "trusted-firmware-a-macchiatobin"
+IMAGER_BUILD_DEPS += "trusted-firmware-a-macchiatobin"
 
 IMAGE_INSTALL += "u-boot-script"
diff --git a/recipes-bsp/trusted-firmware-a/files/0001-Use-abspath-to-dereference-BUILD_BASE.patch b/recipes-bsp/trusted-firmware-a/files/0001-Use-abspath-to-dereference-BUILD_BASE.patch
new file mode 100644
index 0000000..37b6251
--- /dev/null
+++ b/recipes-bsp/trusted-firmware-a/files/0001-Use-abspath-to-dereference-BUILD_BASE.patch
@@ -0,0 +1,144 @@
+From f62206b4871020506842807b263408e5162b23e9 Mon Sep 17 00:00:00 2001
+From: Grant Likely <grant.likely@arm.com>
+Date: Thu, 30 Jul 2020 08:50:10 +0100
+Subject: [PATCH] Use abspath to dereference $BUILD_BASE
+
+If the user tries to change BUILD_BASE to put the build products outside
+the build tree the compile will fail due to hard coded assumptions that
+$BUILD_BASE is a relative path. Fix by using $(abspath $(BUILD_BASE))
+to rationalize to an absolute path every time and remove the relative
+path assumptions.
+
+This patch also adds documentation that BUILD_BASE can be specified by
+the user.
+
+Signed-off-by: Grant Likely <grant.likely@arm.com>
+Signed-off-by: Manish Pandey <manish.pandey2@arm.com>
+Change-Id: Ib1af874de658484aaffc672f30029b852d2489c8
+---
+ Makefile                               | 6 ++++--
+ docs/getting_started/build-options.rst | 2 ++
+ lib/romlib/Makefile                    | 8 ++++----
+ plat/marvell/a8k/common/ble/ble.mk     | 8 ++++----
+ plat/nvidia/tegra/platform.mk          | 2 +-
+ plat/ti/k3/platform.mk                 | 2 +-
+ tools/sptool/sp_mk_generator.py        | 4 ++--
+ 7 files changed, 18 insertions(+), 14 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index f01a9ae3e..1290d4ff4 100644
+--- a/Makefile
++++ b/Makefile
+@@ -449,8 +449,10 @@ include common/backtrace/backtrace.mk
+ 
+ include ${MAKE_HELPERS_DIRECTORY}plat_helpers.mk
+ 
+-BUILD_BASE		:=	./build
+-BUILD_PLAT		:=	${BUILD_BASE}/${PLAT}/${BUILD_TYPE}
++ifeq (${BUILD_BASE},)
++     BUILD_BASE		:=	./build
++endif
++BUILD_PLAT		:=	$(abspath ${BUILD_BASE})/${PLAT}/${BUILD_TYPE}
+ 
+ SPDS			:=	$(sort $(filter-out none, $(patsubst services/spd/%,%,$(wildcard services/spd/*))))
+ 
+diff --git a/docs/getting_started/build-options.rst b/docs/getting_started/build-options.rst
+index 90fe83feb..c96499020 100644
+--- a/docs/getting_started/build-options.rst
++++ b/docs/getting_started/build-options.rst
+@@ -116,6 +116,8 @@ Common build options
+ -  ``BUILD_STRING``: Input string for VERSION_STRING, which allows the TF-A
+    build to be uniquely identified. Defaults to the current git commit id.
+ 
++-  ``BUILD_BASE``: Output directory for the build. Defaults to ``./build``
++
+ -  ``CFLAGS``: Extra user options appended on the compiler's command line in
+    addition to the options set by the build system.
+ 
+diff --git a/lib/romlib/Makefile b/lib/romlib/Makefile
+index cec94043d..2ff480bd4 100644
+--- a/lib/romlib/Makefile
++++ b/lib/romlib/Makefile
+@@ -10,14 +10,14 @@ LD          = $(CROSS_COMPILE)ld
+ OC          = $(CROSS_COMPILE)objcopy
+ CPP         = $(CROSS_COMPILE)cpp
+ ROMLIB_GEN  = ./romlib_generator.py
+-BUILD_DIR   = ../../$(BUILD_PLAT)/romlib
+-LIB_DIR     = ../../$(BUILD_PLAT)/lib
+-WRAPPER_DIR = ../../$(BUILD_PLAT)/libwrapper
++BUILD_DIR   = $(BUILD_PLAT)/romlib
++LIB_DIR     = $(BUILD_PLAT)/lib
++WRAPPER_DIR = $(BUILD_PLAT)/libwrapper
+ LIBS        = -lmbedtls -lfdt -lc
+ INC         = $(INCLUDES:-I%=-I../../%)
+ PPFLAGS     = $(INC) $(DEFINES) -P -x assembler-with-cpp -D__LINKER__ -MD -MP -MT $(BUILD_DIR)/romlib.ld
+ OBJS        = $(BUILD_DIR)/jmptbl.o $(BUILD_DIR)/init.o
+-MAPFILE     = ../../$(BUILD_PLAT)/romlib/romlib.map
++MAPFILE     = $(BUILD_PLAT)/romlib/romlib.map
+ 
+ ifneq ($(PLAT_DIR),)
+   WRAPPER_SOURCES   = $(shell $(ROMLIB_GEN) genwrappers -b $(WRAPPER_DIR) --list ../../$(PLAT_DIR)/jmptbl.i)
+diff --git a/plat/marvell/a8k/common/ble/ble.mk b/plat/marvell/a8k/common/ble/ble.mk
+index b6a9cd291..12e657581 100644
+--- a/plat/marvell/a8k/common/ble/ble.mk
++++ b/plat/marvell/a8k/common/ble/ble.mk
+@@ -5,9 +5,9 @@
+ 
+ MV_DDR_PATH		?=	drivers/marvell/mv_ddr
+ 
+-MV_DDR_LIB		= 	$(CURDIR)/$(BUILD_PLAT)/ble/mv_ddr_lib.a
+-LIBC_LIB		=	$(CURDIR)/$(BUILD_PLAT)/lib/libc.a
+-BLE_LIBS		= 	$(MV_DDR_LIB) $(LIBC_LIB)
++MV_DDR_LIB		=	$(BUILD_PLAT)/ble/mv_ddr_lib.a
++LIBC_LIB		=	$(BUILD_PLAT)/lib/libc.a
++BLE_LIBS		=	$(MV_DDR_LIB) $(LIBC_LIB)
+ PLAT_MARVELL		=	plat/marvell
+ 
+ BLE_SOURCES		+= 	$(BLE_PATH)/ble_main.c				\
+@@ -29,4 +29,4 @@ BLE_LINKERFILE		:=	$(BLE_PATH)/ble.ld.S
+ FORCE:
+ 
+ $(MV_DDR_LIB): FORCE
+-	@+make -C $(MV_DDR_PATH) --no-print-directory PLAT_INCLUDES="$(PLAT_INCLUDES)" PLATFORM=$(PLAT) ARCH=AARCH64 OBJ_DIR=$(CURDIR)/$(BUILD_PLAT)/ble
++	@+make -C $(MV_DDR_PATH) --no-print-directory PLAT_INCLUDES="$(PLAT_INCLUDES)" PLATFORM=$(PLAT) ARCH=AARCH64 OBJ_DIR=$(BUILD_PLAT)/ble
+diff --git a/plat/nvidia/tegra/platform.mk b/plat/nvidia/tegra/platform.mk
+index e03e1f37b..f7221afac 100644
+--- a/plat/nvidia/tegra/platform.mk
++++ b/plat/nvidia/tegra/platform.mk
+@@ -56,7 +56,7 @@ $(eval $(call add_define,ENABLE_TEGRA_WDT_LEGACY_FIQ_HANDLING))
+ $(eval $(call add_define,RELOCATE_BL32_IMAGE))
+ 
+ # modify BUILD_PLAT to point to SoC specific build directory
+-BUILD_PLAT	:=	${BUILD_BASE}/${PLAT}/${TARGET_SOC}/${BUILD_TYPE}
++BUILD_PLAT	:=	$(abspath ${BUILD_BASE})/${PLAT}/${TARGET_SOC}/${BUILD_TYPE}
+ 
+ # platform cflags (enable signed comparisons, disable stdlib)
+ TF_CFLAGS	+= -Wsign-compare -nostdlib
+diff --git a/plat/ti/k3/platform.mk b/plat/ti/k3/platform.mk
+index 65d5cc2a4..2de21aa7b 100644
+--- a/plat/ti/k3/platform.mk
++++ b/plat/ti/k3/platform.mk
+@@ -11,4 +11,4 @@ include ${PLAT_PATH}/common/plat_common.mk
+ include ${PLAT_PATH}/board/${TARGET_BOARD}/board.mk
+ 
+ # modify BUILD_PLAT to point to board specific build directory
+-BUILD_PLAT := ${BUILD_BASE}/${PLAT}/${TARGET_BOARD}/${BUILD_TYPE}
++BUILD_PLAT := $(abspath ${BUILD_BASE})/${PLAT}/${TARGET_BOARD}/${BUILD_TYPE}
+diff --git a/tools/sptool/sp_mk_generator.py b/tools/sptool/sp_mk_generator.py
+index 6b6fa1914..68fb82201 100755
+--- a/tools/sptool/sp_mk_generator.py
++++ b/tools/sptool/sp_mk_generator.py
+@@ -53,8 +53,8 @@ with open(sys.argv[2],'r') as in_file:
+     data = json.load(in_file)
+ json_file = os.path.abspath(sys.argv[2])
+ json_dir = os.path.dirname(json_file)
+-gen_file = sys.argv[1]
+-out_dir = sys.argv[3][2:]
++gen_file = os.path.abspath(sys.argv[1])
++out_dir = os.path.abspath(sys.argv[3])
+ dtb_dir = out_dir + "/fdts/"
+ print(dtb_dir)
+ 
+-- 
+2.26.2
+
diff --git a/recipes-bsp/u-boot/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch b/recipes-bsp/trusted-firmware-a/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch
similarity index 100%
rename from recipes-bsp/u-boot/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch
rename to recipes-bsp/trusted-firmware-a/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.3.bb b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.3.bb
new file mode 100644
index 0000000..2df79c3
--- /dev/null
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.3.bb
@@ -0,0 +1,34 @@
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
+SRC_URI += " \
+    git://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell;protocol=https;branch=mv_ddr-armada-atf-mainline;rev=${MV_DDR_REV};destsuffix=mv-ddr-marvell \
+    git://github.com/MarvellEmbeddedProcessors/binaries-marvell;protocol=https;branch=${MV_BIN_BRANCH};rev=${MV_BIN_REV};destsuffix=binaries-marvell \
+    file://0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch;patchdir=${WORKDIR}/mv-ddr-marvell \
+    "
+
+MV_DDR_REV="a881467ef0f0185e6570dd0483023fde93cbb5f5"
+MV_BIN_BRANCH="binaries-marvell-armada-18.12"
+MV_BIN_REV="c6c529ea3d905a28cc77331964c466c3e2dc852e"
+
+DEPENDS += "u-boot-macchiatobin"
+DEBIAN_BUILD_DEPENDS = "u-boot-macchiatobin, libssl-dev:native"
+
+TF_A_PLATFORM = "a80x0_mcbin"
+TF_A_EXTRA_BUILDARGS = " \
+    USE_COHERENT_MEM=0 \
+    MV_DDR_PATH=../mv-ddr-marvell \
+    SCP_BL2=../binaries-marvell/mrvl_scp_bl2.img \
+    BL33=/usr/lib/u-boot/macchiatobin/u-boot.bin \
+    all fip"
+TF_A_BINARIES = "flash-image.bin"
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc
index 8480b0d..06794c3 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc
@@ -14,4 +14,6 @@ require recipes-bsp/trusted-firmware-a/trusted-firmware-a-custom.inc
 SRC_URI += "https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/snapshot/trusted-firmware-a-${PV}.tar.gz"
 SRC_URI[sha256sum] = "37f917922bcef181164908c470a2f941006791c0113d738c498d39d95d543b21"
 
+SRC_URI += "file://0001-Use-abspath-to-dereference-BUILD_BASE.patch"
+
 S = "${WORKDIR}/trusted-firmware-a-${PV}"
diff --git a/recipes-bsp/u-boot/files/macchiatobin-rules b/recipes-bsp/u-boot/files/macchiatobin-rules
deleted file mode 100644
index 6bf28b3..0000000
--- a/recipes-bsp/u-boot/files/macchiatobin-rules
+++ /dev/null
@@ -1,40 +0,0 @@
-#!/usr/bin/make -f
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2018
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-ifneq ($(DEB_BUILD_GNU_TYPE),$(DEB_HOST_GNU_TYPE))
-export CROSS_COMPILE=$(DEB_HOST_GNU_TYPE)-
-SET_CROSS_BUILD_TOOLS=CROSS_BUILD_TOOLS=y
-endif
-
-PARALLEL_BUILD=-j $(shell echo $$(($$(nproc) * 2)))
-
-U_BOOT_DIR=$(PWD)
-
-override_dh_auto_build:
-	$(MAKE) $(PARALLEL_BUILD) $(U_BOOT_CONFIG)
-	$(MAKE) $(PARALLEL_BUILD) ${U_BOOT_BIN}
-	$(MAKE) $(PARALLEL_BUILD) $(SET_CROSS_BUILD_TOOLS) NO_SDL=1 tools-only envtools
-	cd ../arm-trusted-firmware-*; \
-	$(MAKE) USE_COHERENT_MEM=0 \
-	        PLAT=a80x0_mcbin \
-	        MV_DDR_PATH=../mv-ddr-marvell \
-	        SCP_BL2=../binaries-marvell/mrvl_scp_bl2.img \
-	        BL33=$(U_BOOT_DIR)/u-boot.bin \
-	        all fip
-
-override_dh_auto_install:
-	mv tools/env/lib.a tools/env/libubootenv.a
-
-override_dh_auto_test:
-
-%:
-	CFLAGS= LDFLAGS= dh $@ --parallel
diff --git a/recipes-bsp/u-boot/u-boot-macchiatobin_2019.10-atf2.2.bb b/recipes-bsp/u-boot/u-boot-macchiatobin_2019.10-atf2.2.bb
deleted file mode 100644
index 20271d1..0000000
--- a/recipes-bsp/u-boot/u-boot-macchiatobin_2019.10-atf2.2.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2018
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-U_BOOT_PV="${@d.getVar('PV').split('-atf')[0]}"
-ATF_PV="${@d.getVar('PV').split('-atf')[1]}"
-
-require recipes-bsp/u-boot/u-boot-custom.inc
-require recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_${ATF_PV}.inc
-
-SRC_URI += " \
-    https://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
-    git://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell;protocol=https;branch=mv_ddr-armada-atf-mainline;rev=${MV_DDR_REV};destsuffix=mv-ddr-marvell \
-    git://github.com/MarvellEmbeddedProcessors/binaries-marvell;protocol=https;branch=${MV_BIN_BRANCH};rev=${MV_BIN_REV};destsuffix=binaries-marvell \
-    file://0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch;patchdir=${WORKDIR}/mv-ddr-marvell \
-    file://macchiatobin-rules \
-    "
-SRC_URI[u-boot.sha256sum] = "8d6d6070739522dd236cba7055b8736bfe92b4fac0ea18ad809829ca79667014"
-
-BUILD_DEPENDS =. "libssl-dev:native, "
-
-MV_DDR_REV="a881467ef0f0185e6570dd0483023fde93cbb5f5"
-MV_BIN_BRANCH="binaries-marvell-armada-18.12"
-MV_BIN_REV="c6c529ea3d905a28cc77331964c466c3e2dc852e"
-
-U_BOOT_CONFIG="mvebu_mcbin-88f8040_defconfig"
-U_BOOT_BIN="u-boot.bin"
-
-S = "${WORKDIR}/u-boot-${U_BOOT_PV}"
-
-do_prepare_build_append() {
-    cp ${WORKDIR}/macchiatobin-rules ${S}/debian/rules
-
-    echo "../arm-trusted-firmware-${ATF_PV}/build/a80x0_mcbin/release/flash-image.bin /usr/lib/u-boot/macchiatobin" > \
-        ${S}/debian/u-boot-macchiatobin.install
-}
diff --git a/recipes-bsp/u-boot/u-boot-macchiatobin_2020.07.bb b/recipes-bsp/u-boot/u-boot-macchiatobin_2020.07.bb
new file mode 100644
index 0000000..2bab197
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-macchiatobin_2020.07.bb
@@ -0,0 +1,15 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2018-2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require u-boot-${PV}.inc
+
+U_BOOT_CONFIG = "mvebu_mcbin-88f8040_defconfig"
+U_BOOT_BIN = "u-boot.bin"
diff --git a/wic/macchiatobin.wks b/wic/macchiatobin.wks
index 4cb6aed..ead8b14 100644
--- a/wic/macchiatobin.wks
+++ b/wic/macchiatobin.wks
@@ -9,7 +9,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-part u-boot --source rawcopy --sourceparams "file=/usr/lib/u-boot/macchiatobin/flash-image.bin" --no-table --align 2048 --size 2M
+part u-boot --source rawcopy --sourceparams "file=/usr/lib/trusted-firmware-a/macchiatobin/flash-image.bin" --no-table --align 2048 --size 2M
 
 part / --source rootfs-u-boot --ondisk mmcblk1 --fstype ext4 --label platform --active --align 1024 --sourceparams "no_initrd=yes"
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4741ccfb52ae7c66ac129f505ab7c2a546f39893.1601876389.git.jan.kiszka%40siemens.com.
