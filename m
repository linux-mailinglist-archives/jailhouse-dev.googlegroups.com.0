Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTM4T2CQMGQEYQNR33I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DFA38C51B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:41:18 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id u5-20020adf9e050000b029010df603f280sf9247162wre.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:41:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593678; cv=pass;
        d=google.com; s=arc-20160816;
        b=id1zT/Xf1qtahw5xyMkz/lpFXoHPgsEBwVftsW9wLyC8vW4iAQUK7bLeovLD8GzcZO
         gSykgY38YHf7UAptMuuotfqysHeX5vS8HUj8+GDxnbi0TRo172m0SHtYoHa9ItytQM8V
         RSpCoKcZkoCxirqAwshpUN3Xi6Y3EsWwqm+vI9NXrFfqR+ef1sIzpfx4MwwFRrxq9pii
         rsGOogM2i/yuOCSIpS+QSmHldvy49/mcgwJyEp30dFmJ3wkPKtzHFbWOdE2byojejBdq
         //J/DMgyPMajAo7TMRjkxZru1uJKbPbY3C30FQKzVw0UYDaCivw1/v/oiMT/nPxa+ae4
         leUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=lAOaBCo0W7bKFOEAL+Aq7QUbPKvKq4ahORwZOC3+Ol8=;
        b=osg/whEgXCl6EYBdeVa0gXB632U5ylQ+yb81rLkkvF4SGGkvo3zvow2H8FCAKKCdKa
         H03JwqGu5eTk5z90lCoLfPcpusuSiqjHdDkMopf75lAZO5JDTMp6eGwlB08nA5C7/A5V
         dd+S8Hmm2+SUkPdL5+4JsgsvmgFmea/tr+mGr7b7zXMOahKdDBw7eluc5zxVMAKqEK6l
         QQtAxPodfNxrCWCCRhIXjDr/d/ajPAnozk8qfNkcbE5UZ69OJNnuTuTUm7rYtfKuwEou
         AIk4hMT9eFG1TgDcijxiYKjsQccdrZPrftWpX5kMms/5web6DOC/Q4HvWSrX4C7qih0Q
         oegQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lAOaBCo0W7bKFOEAL+Aq7QUbPKvKq4ahORwZOC3+Ol8=;
        b=bheElU73x8e0KtcZsxAlBg1vFaUFOAurXVgGqoyZixMHTK5Zfhy5VHRZtwvd4RFmh8
         ENge6QzKQZIX4XvDz6L3G0sryyM4t5c0n8ea3KktCoi4deOi4hvNTgj7Y+uWZ632mzJD
         /roCA7EMd/q6dOzMyaI52N8D8w6FnTLvzPNWA0GKDe0KRzSxGk3XEDFK4YS4hhQSbocx
         uCQylhqB7BRyX98mTYDdHE7M++7x7LkyM/nP4tRrN88tOsBWch6K5RplnvDJXmszTfOu
         EVIN0QBIJadOArkmAi7zFJ2NmiOZCinAe+wruB7GP2nX+G90FIjg8ulQQv1MYce5ygsA
         Yygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lAOaBCo0W7bKFOEAL+Aq7QUbPKvKq4ahORwZOC3+Ol8=;
        b=p2YwyNaU+my7RFLoxEGMjKZ5xbeeeHGAWf2JxoK35nhR56QOjveRL+juSpUfYFAA9t
         i5h5kQcgFLUN8hACfyWy5YJZpJ35VtiYgd7THZfh6vRPAkrCSr3bQdVA/B2emB2wdzu3
         4hJry2QlwM1TPSH7MzKAmCPRy94uam0tYnamSjqHS3RZh5woLJEGOtN1wAW00qeVom+d
         XrN7fdNYKMaohqEko/x2fFUoOm4RV0zpYl2361KpXaWywVk9ZITYc7pJ/PzQ45u+WgBf
         lG17rhOxGFe9coEr/3/XaUgoEHTCPxM39wSrFVFQMOIwyyT82ubD9PxO5LHU+zniHhwF
         araA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532lQkk/JQaDYnx4R6ayvHVyzkN8YSDxkg/5xtrdVH2t2see1uDE
	VRY3q+QKfMAps+vj9iiciFk=
X-Google-Smtp-Source: ABdhPJyrKX6uYX+sQ7qnfFpou06XBc2ZkrRPV49cuPiwQJvy3KKqQ9uVdgJDti9DCxRhLwdHsxH7zg==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr8624862wmc.59.1621593677955;
        Fri, 21 May 2021 03:41:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f844:: with SMTP id d4ls172450wrq.3.gmail; Fri, 21 May
 2021 03:41:16 -0700 (PDT)
X-Received: by 2002:adf:fb87:: with SMTP id a7mr8988135wrr.58.1621593676793;
        Fri, 21 May 2021 03:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593676; cv=none;
        d=google.com; s=arc-20160816;
        b=DWN37dCz6ZpoQStF4JTtCMm+p+tgFKkW4HhacDAlm5w+Qezh+h/1LYuRdMyS1vE2L1
         ZbQSj+PaSO7mrWTeP5kgKF66E1R2Xqy/kc6G8kawnSTV8ElsReg9rFKjGssvlGx2cpa6
         SH7Z3Mhw5O0dt4zPCTLsHNtsU8KYET9d5WTwWr5lvn1Ez/cooyaqyRXnsW31LQqzm7F8
         nf6a6AdX87AOwjWDBZ5Sfzl+EGh5rwInyM/pcFaAyYSeWxbPZZ81DMyoHNS1KRQIz831
         JojFC6pmQGRgYuHey2HLUArBo5pEO/wYimNdKzzVZor2LRmZNVcUYgcmQaZygTB94eQ7
         S14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=f1wnLrpEyCaBb3COZHH/31JaXfJC1FVGOPx+s7ruiZ4=;
        b=t8q/psuBml4dgI14kwFwYEwDzuThX7tg2/oJWAlPk3rIaGa5bA3botQ0BRyTer7ySO
         tXONxYnQZqdLjroGgAOk9V6etmD6T3vpJHpQ8HxVq+MSlc8p++WDj7dyRqJpdNbwtQXV
         35SI02qc7r3uhcZbRfSBLzpvTmjgOausk9hCsVh4Ov0ViKAKvZ53tFIelA7tYRYg+Jkx
         33U/GIg3LU4xTX9EN5CYkTBpnAx+F1QOzqHGwqxMq+DCDHSNpX1Nn0UrvVMEeXnhQ97e
         kozAuSq5lzRH81/FmElkcjFqncbq+POxtDy8M2iDyPN85TZ27NoSg/TstwlBlyDbcwo/
         HV+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id t1si83435wrn.4.2021.05.21.03.41.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:41:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAfGba006731
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:41:16 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcJ032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:38 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 14/22] trusted-firmware-a: Update to release 2.4
Date: Fri, 21 May 2021 12:37:26 +0200
Message-Id: <a6c70883a6dae441a9d28fc0240198a53637f075.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
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

Allows to drop the backport patch.

For the MACCHIATObin, this requires to update the mv-ddr dependency and
select a different build target but allows to remove another patch. We
need a new one to fix a build dependency bug, otherwise bl1.bin is not
included in the image.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...se-abspath-to-dereference-BUILD_BASE.patch | 144 ------------------
 ...-fix-gcc-warning-about-uninitialized.patch |  40 -----
 ...ada-Add-missing-dependency-of-mrvl_f.patch |  33 ++++
 ...=> trusted-firmware-a-macchiatobin_2.4.bb} |   8 +-
 ... => trusted-firmware-a-pine64-plus_2.4.bb} |   0
 ..._2.3.bb => trusted-firmware-a-rpi4_2.4.bb} |   0
 ...3.bb => trusted-firmware-a-ultra96_2.4.bb} |   0
 ...e-a_2.3.inc => trusted-firmware-a_2.4.inc} |   6 +-
 8 files changed, 39 insertions(+), 192 deletions(-)
 delete mode 100644 recipes-bsp/trusted-firmware-a/files/0001-Use-abspath-to-dereference-BUILD_BASE.patch
 delete mode 100644 recipes-bsp/trusted-firmware-a/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch
 create mode 100644 recipes-bsp/trusted-firmware-a/files/0001-plat-marvell-armada-Add-missing-dependency-of-mrvl_f.patch
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
diff --git a/recipes-bsp/trusted-firmware-a/files/0001-plat-marvell-armada-Add-missing-dependency-of-mrvl_f.patch b/recipes-bsp/trusted-firmware-a/files/0001-plat-marvell-armada-Add-missing-dependency-of-mrvl_f.patch
new file mode 100644
index 0000000..45491c1
--- /dev/null
+++ b/recipes-bsp/trusted-firmware-a/files/0001-plat-marvell-armada-Add-missing-dependency-of-mrvl_f.patch
@@ -0,0 +1,33 @@
+From 389e7aa2c97c0faa79d59dbf8fce1394db05cb62 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Thu, 13 May 2021 10:48:22 +0200
+Subject: [PATCH] plat/marvell/armada: Add missing dependency of mrvl_flash
+
+Allows building only this target.
+
+Not for upstream, they fixed this implicitly while refactoring the
+build.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+Change-Id: I4901fa238a29842e03e34d0e0cb52816eea39183
+---
+ plat/marvell/armada/a8k/common/a8k_common.mk | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/plat/marvell/armada/a8k/common/a8k_common.mk b/plat/marvell/armada/a8k/common/a8k_common.mk
+index c8273265e..9ac86a117 100644
+--- a/plat/marvell/armada/a8k/common/a8k_common.mk
++++ b/plat/marvell/armada/a8k/common/a8k_common.mk
+@@ -160,8 +160,7 @@ ${DOIMAGETOOL}: mrvl_clean
+ 	@$(DOIMAGE_LIBS_CHECK)
+ 	${Q}${MAKE} --no-print-directory -C ${DOIMAGEPATH}
+ 
+-mrvl_flash: ${BUILD_PLAT}/${FIP_NAME} ${DOIMAGETOOL} ${BUILD_PLAT}/ble.bin
++mrvl_flash: ${BUILD_PLAT}/${FIP_NAME} ${DOIMAGETOOL} ${BUILD_PLAT}/ble.bin ${BUILD_PLAT}/bl1.bin
+ 	$(shell truncate -s %128K ${BUILD_PLAT}/bl1.bin)
+ 	$(shell cat ${BUILD_PLAT}/bl1.bin ${BUILD_PLAT}/${FIP_NAME} > ${BUILD_PLAT}/${BOOT_IMAGE})
+ 	${DOIMAGETOOL} ${DOIMAGE_FLAGS} ${BUILD_PLAT}/${BOOT_IMAGE} ${BUILD_PLAT}/${FLASH_IMAGE}
+-
+-- 
+2.26.2
+
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.3.bb b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.4.bb
similarity index 77%
rename from recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.3.bb
rename to recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.4.bb
index d5dced9..02a9234 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.3.bb
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.4.bb
@@ -12,12 +12,12 @@
 require trusted-firmware-a_${PV}.inc
 
 SRC_URI += " \
-    git://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell;protocol=https;branch=mv_ddr-armada-atf-mainline;rev=${MV_DDR_REV};destsuffix=mv-ddr-marvell \
+    git://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell;protocol=https;rev=${MV_DDR_REV};destsuffix=mv-ddr-marvell \
     git://github.com/MarvellEmbeddedProcessors/binaries-marvell;protocol=https;branch=${MV_BIN_BRANCH};rev=${MV_BIN_REV};destsuffix=binaries-marvell \
-    file://0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch;patchdir=${WORKDIR}/mv-ddr-marvell \
+    file://0001-plat-marvell-armada-Add-missing-dependency-of-mrvl_f.patch \
     "
 
-MV_DDR_REV="a881467ef0f0185e6570dd0483023fde93cbb5f5"
+MV_DDR_REV="7c351731d19645f64d2826a47e8f4d9cd1c74db3"
 MV_BIN_BRANCH="binaries-marvell-armada-18.12"
 MV_BIN_REV="c6c529ea3d905a28cc77331964c466c3e2dc852e"
 
@@ -30,5 +30,5 @@ TF_A_EXTRA_BUILDARGS = " \
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a6c70883a6dae441a9d28fc0240198a53637f075.1621593454.git.jan.kiszka%40siemens.com.
