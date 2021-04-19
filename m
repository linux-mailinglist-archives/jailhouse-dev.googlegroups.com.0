Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWXB66BQMGQEHXESGTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 26891364CC7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:06:35 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id h3-20020adfa4c30000b02901027da44a81sf9592240wrb.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866395; cv=pass;
        d=google.com; s=arc-20160816;
        b=dtZtGgMXn71FXgKND1aBUzh4Ikjt4mWEXRrbvbbUbKrONfJs7jnvetB8m9B5mzFiBr
         +V+AbzhTX0/sGWuicMkWb7INARowlVY5cbL8KXvSlM1NQWDcwqnN2h7pghwlIYRKBMOC
         hegNq4Wv6yPzwM3BR/rTIK60F7dyE0J1rUO7UtllsbPby2XIzB3kPB3Ot/AuiEfZY15a
         cHeq4vvi4GbhxzDFcMdhJQBuwTYsQ/Qjz9SdLqke0vJS8xTDgpklHYK5oZGLBcecUzBf
         zCGPmJJbqIBVXeVjiEfOYqKSjjTLfx5jr/SrJRvu7bRzmlc9hDSLt7cB1oMKb1CRC7+F
         7MKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=ykptldfk7QO9QxEJFbDqov3HFmfSLvlGjTpdtg00maE=;
        b=ZTScdioK2eWpEtq7HvOnulUR1E8zALfnv4gJvLkC26g+8MZ7aQUuzdfrKyBHZcq4CS
         w080oAo5r5goOxrGoywSW0lpiK/agRcZwTjJAlJ7mqSavIZXeAhZxl5E3YNi9HvFPKeF
         Y8wlM6LN5Oj+qXvVVAXB0NQavti4mMv3VdD8Axj2j6gAoIRUD9ZWb/ff8P+FOgPZ0vw1
         cq9E83ZQu5+bUAMN45NJ/+u2+L78uxU2MrbEwRcL1kRiW1fB47LKuydHuBj5mXC7Z9br
         UnwvAqzike+KjfhPyrUKDAFrGfU9cUNcloMMUijmHHRtlwwNG6XQ/Chgp0ZoG+6wwxxk
         Igww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ykptldfk7QO9QxEJFbDqov3HFmfSLvlGjTpdtg00maE=;
        b=qhicDDixtPigMOV9Y6upNG+jsuI3Q/Q+kx87I1zWIjP7mO/o3ZQcyVr0aMEdoB2QrW
         Ada0eFBY1+0frcxo9liPo4OnLdngZAityn1qMzN7rpW6LnIBtn/TCz5mRCCzm1luI4Xl
         km9IeW2dvSgFMRWm8H4asSl5o9JII4w7AXahusf4RxLzevx/NWRrnKCEyGjsF3x5e6mT
         EXhwHxaRXIJc6CMLeXQPjijjVRDvQ8afF9jI3wqLeoJ32/soa8pZzjqm3BTpZDCDStwk
         vIpd4F+j9lW1a7a8lhhoF2re4U743NaXTjLtNWXMFM/Sc6yHyIwIBXKUOh/fisTN0mCX
         L2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ykptldfk7QO9QxEJFbDqov3HFmfSLvlGjTpdtg00maE=;
        b=oCS8gicQ1DpjB38KkoOzkoNHjYtytdfpMHEqZw9R6DTBZdgDzRsPIHLMNzHdS/F5re
         f8Kny4a/FSSzL1bvrW3kKwq+iJHib8KcUzOISdgp766vMlfilgt5jvpVXR4Oc2YFd3Sx
         bcuGywOlXtvIVkQIH+pkEXyCXP5et9ELHNDam/TwQBISlsF4w9XmcVID+1x+xaw1N8C3
         ZgRi5tFRVCPpHWvQ+AFgiY5gJIbzaUVdJNtySBLfvbluaUVPQ65HIrNZJgAcesVHqiPt
         6QFzKVGoc1ByJ7iFO3COfrYCoucoDGOn5V8SumQV6OFR61eKcTsB8nCD1VZwLPphnUnJ
         32ZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Jcsaf/eU1VtJ+Uit8MkRAB25X/weDj8PRhtBIMuBzr2yb0qD7
	bZSL15oW7XT8OQNYnr3EK2s=
X-Google-Smtp-Source: ABdhPJy4mhQmJ2CVAPRNe0zypLCsoM5FSNz31MPa3grux0n1kXGUWstPxlDvhqPfc5F9eOGgB9EXdA==
X-Received: by 2002:a05:6000:1786:: with SMTP id e6mr16769195wrg.243.1618866394899;
        Mon, 19 Apr 2021 14:06:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4101:: with SMTP id j1ls297440wmi.2.canary-gmail;
 Mon, 19 Apr 2021 14:06:34 -0700 (PDT)
X-Received: by 2002:a1c:a182:: with SMTP id k124mr966353wme.132.1618866393938;
        Mon, 19 Apr 2021 14:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866393; cv=none;
        d=google.com; s=arc-20160816;
        b=UHu80RCWVuI6NnQRVIOF1y1TiBZyz/aNB4szW5lO/uJu+r7aed4wAeAsMw6GOI8hVs
         zGAcMttTwar97OjZFVicDeDLuYix03I5CPqP2N7MGdzsCFt0m5VTHGW3woLgzX1gquFu
         pbSyndMAVoNkp9Zkhi//ikklglTHtQQtXvwm2UpyOIazF29HHGW+KnxyLsYGTGJURUy/
         +uxnkJyd33F1ptJJyaZCh+/AoTZTe74L32h9CmHJ+Ex9KccAz57vZEFXFD1HuOo6dvmF
         /9wdg6oqw2aFCy55F6N5c+XJDPMsVlaYDNCFSIDG1hDtKFIWTOpRPlakG5U25Ztkl0aX
         +6Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=6oTjB+QVZU9NcJKbjrbTfDMaepF0Aczs2loVx8oFYJ0=;
        b=yn1d+CebOIT/PrqHg26SnD3MpbTZ+YGh/9SzUI/Jw36SaHKbGa7fq/HAFhzVtmdyM/
         1n+Ev8VNVbJAK2S4WWSlNQZMgZ7m9S3+ke/cW64h6KOBxP/9WYOC+AqIgRiMSp/7tCeR
         yeYC/dQeCY+CJ4RsP9tGfu3EJp3zIpxqErg510HsBdCJDDCEcRGNhnDYJXhliVgbfF/b
         c58IrDmhcakUtzlnAhaqvWWzXvxIV8jHGnge0IqfVmH81fLtNZYWyMW7SxsvvTbmEWWy
         kI6Gl+cpe9RwKRjSMD0/BUddG1w5WpQjhDQ6i2jvG3jfrr44xOpjQHF4LcK+eZt+1xip
         t9sg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id p189si32731wmp.1.2021.04.19.14.06.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:06:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JL6X4D022637
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:33 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6Tph015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:33 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 14/20] trusted-firmware-a: Update to release 2.4
Date: Mon, 19 Apr 2021 23:06:23 +0200
Message-Id: <d06e61a7bef83b184b30c89d88f592f4852ac716.1618866389.git.jan.kiszka@siemens.com>
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

Allows to drop the backport patch. Requires to update some Marvell
dependency - and allows another patch removal.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...se-abspath-to-dereference-BUILD_BASE.patch | 144 ------------------
 ...-fix-gcc-warning-about-uninitialized.patch |  40 -----
 ...=> trusted-firmware-a-macchiatobin_2.4.bb} |   7 +-
 ... => trusted-firmware-a-pine64-plus_2.4.bb} |   0
 ..._2.3.bb => trusted-firmware-a-rpi4_2.4.bb} |   0
 ...3.bb => trusted-firmware-a-ultra96_2.4.bb} |   0
 ...e-a_2.3.inc => trusted-firmware-a_2.4.inc} |   6 +-
 7 files changed, 5 insertions(+), 192 deletions(-)
 delete mode 100644 recipes-bsp/trusted-firmware-a/files/0001-Use-abspath-to-dereference-BUILD_BASE.patch
 delete mode 100644 recipes-bsp/trusted-firmware-a/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch
 rename recipes-bsp/trusted-firmware-a/{trusted-firmware-a-macchiatobin_2.3.bb => trusted-firmware-a-macchiatobin_2.4.bb} (77%)
 rename recipes-bsp/trusted-firmware-a/{trusted-firmware-a-pine64-plus_2.3.bb => trusted-firmware-a-pine64-plus_2.4.bb} (100%)
 rename recipes-bsp/trusted-firmware-a/{trusted-firmware-a-rpi4_2.3.bb => trusted-firmware-a-rpi4_2.4.bb} (100%)
 rename recipes-bsp/trusted-firmware-a/{trusted-firmware-a-ultra96_2.3.bb => trusted-firmware-a-ultra96_2.4.bb} (100%)
 rename recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.3.inc => trusted-firmware-a_2.4.inc} (65%)

diff --git a/recipes-bsp/trusted-firmware-a/files/0001-Use-abspath-to-dereference-BUILD_BASE.patch b/recipes-bsp/trusted-firmware-a/files/0001-Use-abspath-to-dereference-BUILD_BASE.patch
deleted file mode 100644
index 37b6251..0000000
--- a/recipes-bsp/trusted-firmware-a/files/0001-Use-abspath-to-dereference-BUILD_BASE.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From f62206b4871020506842807b263408e5162b23e9 Mon Sep 17 00:00:00 2001
-From: Grant Likely <grant.likely@arm.com>
-Date: Thu, 30 Jul 2020 08:50:10 +0100
-Subject: [PATCH] Use abspath to dereference $BUILD_BASE
-
-If the user tries to change BUILD_BASE to put the build products outside
-the build tree the compile will fail due to hard coded assumptions that
-$BUILD_BASE is a relative path. Fix by using $(abspath $(BUILD_BASE))
-to rationalize to an absolute path every time and remove the relative
-path assumptions.
-
-This patch also adds documentation that BUILD_BASE can be specified by
-the user.
-
-Signed-off-by: Grant Likely <grant.likely@arm.com>
-Signed-off-by: Manish Pandey <manish.pandey2@arm.com>
-Change-Id: Ib1af874de658484aaffc672f30029b852d2489c8
----
- Makefile                               | 6 ++++--
- docs/getting_started/build-options.rst | 2 ++
- lib/romlib/Makefile                    | 8 ++++----
- plat/marvell/a8k/common/ble/ble.mk     | 8 ++++----
- plat/nvidia/tegra/platform.mk          | 2 +-
- plat/ti/k3/platform.mk                 | 2 +-
- tools/sptool/sp_mk_generator.py        | 4 ++--
- 7 files changed, 18 insertions(+), 14 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index f01a9ae3e..1290d4ff4 100644
---- a/Makefile
-+++ b/Makefile
-@@ -449,8 +449,10 @@ include common/backtrace/backtrace.mk
- 
- include ${MAKE_HELPERS_DIRECTORY}plat_helpers.mk
- 
--BUILD_BASE		:=	./build
--BUILD_PLAT		:=	${BUILD_BASE}/${PLAT}/${BUILD_TYPE}
-+ifeq (${BUILD_BASE},)
-+     BUILD_BASE		:=	./build
-+endif
-+BUILD_PLAT		:=	$(abspath ${BUILD_BASE})/${PLAT}/${BUILD_TYPE}
- 
- SPDS			:=	$(sort $(filter-out none, $(patsubst services/spd/%,%,$(wildcard services/spd/*))))
- 
-diff --git a/docs/getting_started/build-options.rst b/docs/getting_started/build-options.rst
-index 90fe83feb..c96499020 100644
---- a/docs/getting_started/build-options.rst
-+++ b/docs/getting_started/build-options.rst
-@@ -116,6 +116,8 @@ Common build options
- -  ``BUILD_STRING``: Input string for VERSION_STRING, which allows the TF-A
-    build to be uniquely identified. Defaults to the current git commit id.
- 
-+-  ``BUILD_BASE``: Output directory for the build. Defaults to ``./build``
-+
- -  ``CFLAGS``: Extra user options appended on the compiler's command line in
-    addition to the options set by the build system.
- 
-diff --git a/lib/romlib/Makefile b/lib/romlib/Makefile
-index cec94043d..2ff480bd4 100644
---- a/lib/romlib/Makefile
-+++ b/lib/romlib/Makefile
-@@ -10,14 +10,14 @@ LD          = $(CROSS_COMPILE)ld
- OC          = $(CROSS_COMPILE)objcopy
- CPP         = $(CROSS_COMPILE)cpp
- ROMLIB_GEN  = ./romlib_generator.py
--BUILD_DIR   = ../../$(BUILD_PLAT)/romlib
--LIB_DIR     = ../../$(BUILD_PLAT)/lib
--WRAPPER_DIR = ../../$(BUILD_PLAT)/libwrapper
-+BUILD_DIR   = $(BUILD_PLAT)/romlib
-+LIB_DIR     = $(BUILD_PLAT)/lib
-+WRAPPER_DIR = $(BUILD_PLAT)/libwrapper
- LIBS        = -lmbedtls -lfdt -lc
- INC         = $(INCLUDES:-I%=-I../../%)
- PPFLAGS     = $(INC) $(DEFINES) -P -x assembler-with-cpp -D__LINKER__ -MD -MP -MT $(BUILD_DIR)/romlib.ld
- OBJS        = $(BUILD_DIR)/jmptbl.o $(BUILD_DIR)/init.o
--MAPFILE     = ../../$(BUILD_PLAT)/romlib/romlib.map
-+MAPFILE     = $(BUILD_PLAT)/romlib/romlib.map
- 
- ifneq ($(PLAT_DIR),)
-   WRAPPER_SOURCES   = $(shell $(ROMLIB_GEN) genwrappers -b $(WRAPPER_DIR) --list ../../$(PLAT_DIR)/jmptbl.i)
-diff --git a/plat/marvell/a8k/common/ble/ble.mk b/plat/marvell/a8k/common/ble/ble.mk
-index b6a9cd291..12e657581 100644
---- a/plat/marvell/a8k/common/ble/ble.mk
-+++ b/plat/marvell/a8k/common/ble/ble.mk
-@@ -5,9 +5,9 @@
- 
- MV_DDR_PATH		?=	drivers/marvell/mv_ddr
- 
--MV_DDR_LIB		= 	$(CURDIR)/$(BUILD_PLAT)/ble/mv_ddr_lib.a
--LIBC_LIB		=	$(CURDIR)/$(BUILD_PLAT)/lib/libc.a
--BLE_LIBS		= 	$(MV_DDR_LIB) $(LIBC_LIB)
-+MV_DDR_LIB		=	$(BUILD_PLAT)/ble/mv_ddr_lib.a
-+LIBC_LIB		=	$(BUILD_PLAT)/lib/libc.a
-+BLE_LIBS		=	$(MV_DDR_LIB) $(LIBC_LIB)
- PLAT_MARVELL		=	plat/marvell
- 
- BLE_SOURCES		+= 	$(BLE_PATH)/ble_main.c				\
-@@ -29,4 +29,4 @@ BLE_LINKERFILE		:=	$(BLE_PATH)/ble.ld.S
- FORCE:
- 
- $(MV_DDR_LIB): FORCE
--	@+make -C $(MV_DDR_PATH) --no-print-directory PLAT_INCLUDES="$(PLAT_INCLUDES)" PLATFORM=$(PLAT) ARCH=AARCH64 OBJ_DIR=$(CURDIR)/$(BUILD_PLAT)/ble
-+	@+make -C $(MV_DDR_PATH) --no-print-directory PLAT_INCLUDES="$(PLAT_INCLUDES)" PLATFORM=$(PLAT) ARCH=AARCH64 OBJ_DIR=$(BUILD_PLAT)/ble
-diff --git a/plat/nvidia/tegra/platform.mk b/plat/nvidia/tegra/platform.mk
-index e03e1f37b..f7221afac 100644
---- a/plat/nvidia/tegra/platform.mk
-+++ b/plat/nvidia/tegra/platform.mk
-@@ -56,7 +56,7 @@ $(eval $(call add_define,ENABLE_TEGRA_WDT_LEGACY_FIQ_HANDLING))
- $(eval $(call add_define,RELOCATE_BL32_IMAGE))
- 
- # modify BUILD_PLAT to point to SoC specific build directory
--BUILD_PLAT	:=	${BUILD_BASE}/${PLAT}/${TARGET_SOC}/${BUILD_TYPE}
-+BUILD_PLAT	:=	$(abspath ${BUILD_BASE})/${PLAT}/${TARGET_SOC}/${BUILD_TYPE}
- 
- # platform cflags (enable signed comparisons, disable stdlib)
- TF_CFLAGS	+= -Wsign-compare -nostdlib
-diff --git a/plat/ti/k3/platform.mk b/plat/ti/k3/platform.mk
-index 65d5cc2a4..2de21aa7b 100644
---- a/plat/ti/k3/platform.mk
-+++ b/plat/ti/k3/platform.mk
-@@ -11,4 +11,4 @@ include ${PLAT_PATH}/common/plat_common.mk
- include ${PLAT_PATH}/board/${TARGET_BOARD}/board.mk
- 
- # modify BUILD_PLAT to point to board specific build directory
--BUILD_PLAT := ${BUILD_BASE}/${PLAT}/${TARGET_BOARD}/${BUILD_TYPE}
-+BUILD_PLAT := $(abspath ${BUILD_BASE})/${PLAT}/${TARGET_BOARD}/${BUILD_TYPE}
-diff --git a/tools/sptool/sp_mk_generator.py b/tools/sptool/sp_mk_generator.py
-index 6b6fa1914..68fb82201 100755
---- a/tools/sptool/sp_mk_generator.py
-+++ b/tools/sptool/sp_mk_generator.py
-@@ -53,8 +53,8 @@ with open(sys.argv[2],'r') as in_file:
-     data = json.load(in_file)
- json_file = os.path.abspath(sys.argv[2])
- json_dir = os.path.dirname(json_file)
--gen_file = sys.argv[1]
--out_dir = sys.argv[3][2:]
-+gen_file = os.path.abspath(sys.argv[1])
-+out_dir = os.path.abspath(sys.argv[3])
- dtb_dir = out_dir + "/fdts/"
- print(dtb_dir)
- 
--- 
-2.26.2
-
diff --git a/recipes-bsp/trusted-firmware-a/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch b/recipes-bsp/trusted-firmware-a/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch
deleted file mode 100644
index 9daa485..0000000
--- a/recipes-bsp/trusted-firmware-a/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 1e4cd057a61000cf7d29f7047b68c2cade604465 Mon Sep 17 00:00:00 2001
-From: philhofer <phofer@umich.edu>
-Date: Mon, 1 Jul 2019 16:09:28 -0700
-Subject: [PATCH] mv_ddr4_training: fix gcc warning about uninitialized data
-
-ATF builds with -Wuninitialized -Werror, which causes a build
-failure with gcc 8.3.0 on line 455 of mv_ddr4_training_leveling.c
-
-Also, fix some nearby inconsistent indentation.
-
-Signed-off-by: philhofer <phofer@umich.edu>
----
- mv_ddr4_training_leveling.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/mv_ddr4_training_leveling.c b/mv_ddr4_training_leveling.c
-index 144e21a..4c0c0ab 100644
---- a/mv_ddr4_training_leveling.c
-+++ b/mv_ddr4_training_leveling.c
-@@ -368,7 +368,7 @@ static int mv_ddr4_dynamic_pb_wl_supp(u32 dev_num, enum mv_wl_supp_mode ecc_mode
- 	u32 subphy_num = ddr3_tip_dev_attr_get(dev_num, MV_ATTR_OCTET_PER_INTERFACE);
- 	u8 compare_result = 0;
- 	u32 orig_phase;
--	u32 rd_data, wr_data;
-+	u32 rd_data, wr_data = 0;
- 	u32 flag, step;
- 	struct mv_ddr_topology_map *tm = mv_ddr_topology_map_get();
- 	u32 ecc_phy_access_id;
-@@ -450,7 +450,7 @@ static int mv_ddr4_dynamic_pb_wl_supp(u32 dev_num, enum mv_wl_supp_mode ecc_mode
- 						if (orig_phase > 1)
- 							wr_data = (rd_data & ~0x1c0) | ((orig_phase - 2) << 6);
- 						else if (orig_phase == 1)
--								wr_data = (rd_data & ~0x1df);
-+							wr_data = (rd_data & ~0x1df);
- 						if (orig_phase >= 1)
- 							ddr3_tip_bus_write(dev_num, ACCESS_TYPE_UNICAST, if_id,
- 									   ACCESS_TYPE_UNICAST, subphy_num,
--- 
-2.16.4
-
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.3.bb b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.4.bb
similarity index 77%
rename from recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.3.bb
rename to recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.4.bb
index d5dced9..3133365 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.3.bb
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.4.bb
@@ -12,12 +12,11 @@
 require trusted-firmware-a_${PV}.inc
 
 SRC_URI += " \
-    git://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell;protocol=https;branch=mv_ddr-armada-atf-mainline;rev=${MV_DDR_REV};destsuffix=mv-ddr-marvell \
+    git://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell;protocol=https;rev=${MV_DDR_REV};destsuffix=mv-ddr-marvell \
     git://github.com/MarvellEmbeddedProcessors/binaries-marvell;protocol=https;branch=${MV_BIN_BRANCH};rev=${MV_BIN_REV};destsuffix=binaries-marvell \
-    file://0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch;patchdir=${WORKDIR}/mv-ddr-marvell \
     "
 
-MV_DDR_REV="a881467ef0f0185e6570dd0483023fde93cbb5f5"
+MV_DDR_REV="7c351731d19645f64d2826a47e8f4d9cd1c74db3"
 MV_BIN_BRANCH="binaries-marvell-armada-18.12"
 MV_BIN_REV="c6c529ea3d905a28cc77331964c466c3e2dc852e"
 
@@ -30,5 +29,5 @@ TF_A_EXTRA_BUILDARGS = " \
     MV_DDR_PATH=../mv-ddr-marvell \
     SCP_BL2=../binaries-marvell/mrvl_scp_bl2.img \
     BL33=/usr/lib/u-boot/macchiatobin/u-boot.bin \
-    all fip"
+    mrvl_flash"
 TF_A_BINARIES = "release/flash-image.bin"
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-pine64-plus_2.3.bb b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-pine64-plus_2.4.bb
similarity index 100%
rename from recipes-bsp/trusted-firmware-a/trusted-firmware-a-pine64-plus_2.3.bb
rename to recipes-bsp/trusted-firmware-a/trusted-firmware-a-pine64-plus_2.4.bb
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.3.bb b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.4.bb
similarity index 100%
rename from recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.3.bb
rename to recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.4.bb
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.3.bb b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.4.bb
similarity index 100%
rename from recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.3.bb
rename to recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.4.bb
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.inc
similarity index 65%
rename from recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc
rename to recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.inc
index 06794c3..bd1e48e 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.inc
@@ -1,7 +1,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2019-2020
+# Copyright (c) Siemens AG, 2019-2021
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -12,8 +12,6 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a-custom.inc
 
 SRC_URI += "https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/snapshot/trusted-firmware-a-${PV}.tar.gz"
-SRC_URI[sha256sum] = "37f917922bcef181164908c470a2f941006791c0113d738c498d39d95d543b21"
-
-SRC_URI += "file://0001-Use-abspath-to-dereference-BUILD_BASE.patch"
+SRC_URI[sha256sum] = "bf3eb3617a74cddd7fb0e0eacbfe38c3258ee07d4c8ed730deef7a175cc3d55b"
 
 S = "${WORKDIR}/trusted-firmware-a-${PV}"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d06e61a7bef83b184b30c89d88f592f4852ac716.1618866389.git.jan.kiszka%40siemens.com.
