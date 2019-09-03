Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQMCXDVQKGQEAVVAANI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D452A60F1
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 07:59:30 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id h18sf2434294ljm.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 22:59:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567490370; cv=pass;
        d=google.com; s=arc-20160816;
        b=npAz/VMyZotMSaJim6S8y9aUNPdt9w+c5Ok2qafeQebUYtgYBiMf/jIQGG4Sz7dTXT
         YImL1gf09N1njAkHlHJSkNhVRK4Fn0yfjWcRuNI5f6wrimeYpdmLpolu9soJFnoZLL6y
         xsNRBs3ZmxOxk6H46kpJyhJUwIjlA1yllS4KwTIz+1r/DzagJxEg4WK8+IVAfW76KgUM
         LL8h0662hjZKIEWEWzh+XPGDa0L4usPo5odWPvFvMqPJiRpJ6G90ifmL63LjIVS33qnS
         UCh1Sm7vHmtAzWMRu6nKTzLlR+JWrS2g7XIiftKPspq734RoOlOu3AHwCL5XPxrmnNXm
         hhlw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=/dxdj/F5oeXiLdSflus4BDPwc3KOl/ZiyuXaw+2C/j0=;
        b=w8dzw+MJOeYyeWmC1FvxXBTH6zVYuWAIRHti3uFHYI7cE8fyypqOws1MT7cPRPWwMo
         s+0K1jDHIEWeZ+hMwbnsjO3BUhpL0bYHV/PzdsIedPkmZ+pJmqvh/FUN3EFgoDLnLkEk
         b/olJ6A3YtJMxE36JqqVPbVTmpZv01pRhl0uNefSTlrn7kZ6cKSduoV2u6vSru1tmbgj
         3LrLTQY0XE5LuSNosuB83U22WPjKjCBSHMSH/8nDVPN9YPtuO+4bBZHDdldl1dKozYkc
         piu/hDjFpkt4cDmEMTT7M5W58VRZXpV2BGNSjX/yQGtM4uf48UB8IUnpeahwLGJ+rGVq
         5t+w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/dxdj/F5oeXiLdSflus4BDPwc3KOl/ZiyuXaw+2C/j0=;
        b=Orc+Vea8sOWTuWNacdEq03rnTPIg8uoxfWRx/lrcENBk/ByyqcDBHhQO9eREK1/DjX
         HZ8/S0uBS9h30IoWI7ivg24Z8Fm8NCzHLcdVra31F7bijT6qxDB/jXWBUVmb7eH76BuK
         Bfn7jVnWkgOSDvyaNNzNOh2Ih23dLMvOSjGYMPcV+pL/athDWQBOtSKaabmJ2I39xGt4
         wFqXSpKzdgubx1B8jpqijt/jjxRbDf130HHQaU56hdcYHAkwU3/4MgFHVwNSS8MEQYx0
         +Ov13sEWu/UCIWUkvFWT4JP8RyMngCbH+/s5K59xDDsTpnrA2WSTr6wyAZXODZPFxCkY
         VvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/dxdj/F5oeXiLdSflus4BDPwc3KOl/ZiyuXaw+2C/j0=;
        b=NX5gZ8DA3BQmREdDrBYnk5bPkK1dA8SD53d2J5fE00Vksj4VS/tgKmhG3B4IyE47KO
         BH0wDN75ywk+jiCdXZ3Obt49UqvXdlE68MfWJAikk6GaEGALcpGlbvXR8b+mdIKf6Dr8
         8Q+Zk7bzgl85yljzpUXh5X8Rar/ZB1XS1YsQr0CGTZBEk+1r2QOC/vJWU33N5hr/9aJZ
         NZcxIRyFu0SUMcCRcb3tU8mzwQgfl46Njbf+BDlumFm+pE/51fTl+YxKkJhGmTysJZUZ
         y6PLubnlErdan+nwwhEvtsWbrrWW3eS3f+NtG8fhsypJaUk5SCsGRBVg3Q9Ho0iTQEx2
         ZA0g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWlqRwZ9OmV0yPzFEwmA+q3sAiMqEvZhRSRBJu/alUScek+jrS8
	YyvjP+xwZ91FvSAtb4O/V1U=
X-Google-Smtp-Source: APXvYqxuvu3h1cv040K7U0uvavfWDHSLoXpXkiAZOPCyw1jRJBlxKlR2o4uS7lwcEbwIhP7Mqa/sOA==
X-Received: by 2002:a2e:9602:: with SMTP id v2mr5972588ljh.215.1567490369913;
        Mon, 02 Sep 2019 22:59:29 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3608:: with SMTP id d8ls1750066lja.0.gmail; Mon, 02 Sep
 2019 22:59:28 -0700 (PDT)
X-Received: by 2002:a2e:8510:: with SMTP id j16mr18661198lji.174.1567490368612;
        Mon, 02 Sep 2019 22:59:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567490368; cv=none;
        d=google.com; s=arc-20160816;
        b=MVDvh7K10U+4p31pFtxwrUq4l6wwvSZueehRUAXR7Nc0+iAamFzxJcZrIHkxSush9i
         UW8FCRjd69S+tSFVL+f3Ag4+XloAj6pTbWEingM6NeCOr74xe9hgLWlXqRsbC65byQWr
         emYCFO89STHi5zrFnldAfRNN1GY7adj1jZ/r4Sb95qR7XQS7MoNP3UGeLvpFeVI8GMl/
         PGfRNZc2tVhrCkF45U4FUwxh5pttkESKW6f/qU4AHQjDao2L0rCtvMCe6nF1NMhgk8ga
         ci0wf7/E+7T++D4XzvTYx4tBlgvXoOYacBothiTtCVARffGlEDRqAkwaAgPlJvpcd69l
         taIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=N44wHBQFQ6lmAcJ1g+ik//Ag7EskirIU3l/PGcPXECg=;
        b=wgNjo4ZoeBkA+jkdxNLOgxtmR4u4Oq8ZB0mGcn1MUvD8lOvs5rLRUf+VBIFBwZmVd+
         7GMjcmoQ/9MjAbuICuKmqpMnLVGvDG2DXD4EI0ghG9gYr9liuiWJgvsP+WkD7ADFd8Fp
         4MqX67Cfe2Qhe55IZcQv2+QLTNIWi6fPpInn7aDY6rLG9eZJamUxSZm6VHXMKcVi+Fcm
         lCOWjYDmK959cYrUrszFHi4p+xbEwh4+Te5bYG0OzK3jhhx2F+wzRhyQe2Oj6DOKM+Ch
         nE9pzWhthz97ItmclAZWWUfkbW5RY1DSNUTYfhCDtR+xdVq8YoboPx/zYqC0Uv+R7iim
         gx9w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id d3si65556lfq.1.2019.09.02.22.59.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 22:59:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x835xSoH009953
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:28 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.40.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x835xPkU010486
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:27 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 07/13] u-boot-macchiatobin: Update to 2019.09 and ATF 2.1
Date: Tue,  3 Sep 2019 07:59:19 +0200
Message-Id: <b75d5c8024bbd83812068e1a79a1932e04656107.1567490365.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
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

This obsolates the ATF 1.6 include with its build fix. The update also
removes one external dependency, namely ble-marvell.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../arm-trusted-firmware_1.6.inc                   | 18 -------
 ...tools-Fix-broken-object-compilation-rules.patch | 59 ----------------------
 recipes-bsp/u-boot/files/macchiatobin-rules        |  3 +-
 ....6.bb => u-boot-macchiatobin_2019.07-atf2.1.bb} | 10 ++--
 4 files changed, 5 insertions(+), 85 deletions(-)
 delete mode 100644 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.6.inc
 delete mode 100644 recipes-bsp/arm-trusted-firmware/files/0001-tools-Fix-broken-object-compilation-rules.patch
 rename recipes-bsp/u-boot/{u-boot-macchiatobin_2018.09-atf1.6.bb => u-boot-macchiatobin_2019.07-atf2.1.bb} (73%)

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.6.inc b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.6.inc
deleted file mode 100644
index 0605d5d..0000000
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.6.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2018, 2019
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-FILESPATH =. "${LAYERDIR_jailhouse}/recipes-bsp/arm-trusted-firmware/files:"
-
-SRC_URI += " \
-    https://github.com/ARM-software/arm-trusted-firmware/archive/v${ATF_PV}.tar.gz;name=atf \
-    file://0001-tools-Fix-broken-object-compilation-rules.patch;patchdir=${WORKDIR}/arm-trusted-firmware-${ATF_PV} \
-    "
-SRC_URI[atf.sha256sum] = "62120368f2196d3e126296c8116f3399568e100960a5122e52017d22766b7009"
diff --git a/recipes-bsp/arm-trusted-firmware/files/0001-tools-Fix-broken-object-compilation-rules.patch b/recipes-bsp/arm-trusted-firmware/files/0001-tools-Fix-broken-object-compilation-rules.patch
deleted file mode 100644
index 9e4a08a..0000000
--- a/recipes-bsp/arm-trusted-firmware/files/0001-tools-Fix-broken-object-compilation-rules.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From a8e3ae2e1f391296dc95a85ca4029ccf40e9bf14 Mon Sep 17 00:00:00 2001
-From: Jan Kiszka <jan.kiszka@siemens.com>
-Date: Tue, 2 Oct 2018 09:28:00 +0200
-Subject: [PATCH] tools: Fix broken object compilation rules
-
-As these rules depend on non-existing headers as well (likely copy &
-pasted from fiptool), they never matched, and the built-in rules were
-used. That led to random breakages when e.g. CPPFLAGS was suddenly
-evaluated and contained invalid options.
-
-For the stm32image, this reveals that we were relying on the built-in
-rules by passing -D_GNU_SOURCE via CPPFLAGS, rather than using CFLAGS as
-used in the local rule. Fix that as well.
-
-Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
----
- tools/doimage/Makefile    | 2 +-
- tools/stm32image/Makefile | 5 ++---
- 2 files changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/tools/doimage/Makefile b/tools/doimage/Makefile
-index bc74369f..9cec681a 100644
---- a/tools/doimage/Makefile
-+++ b/tools/doimage/Makefile
-@@ -39,7 +39,7 @@ ${PROJECT}: ${OBJECTS} Makefile
- 	@echo "Built $@ successfully"
- 	@echo
- 
--%.o: %.c %.h Makefile
-+%.o: %.c Makefile
- 	@echo "  CC      $<"
- 	${Q}${CC} -c ${CFLAGS} ${INCLUDE_PATHS} $< -o $@
- 
-diff --git a/tools/stm32image/Makefile b/tools/stm32image/Makefile
-index 80dfbecf..a593d316 100644
---- a/tools/stm32image/Makefile
-+++ b/tools/stm32image/Makefile
-@@ -12,8 +12,7 @@ PROJECT := stm32image${BIN_EXT}
- OBJECTS := stm32image.o
- V := 0
- 
--override CPPFLAGS += -D_GNU_SOURCE
--CFLAGS := -Wall -Werror -pedantic -std=c99
-+CFLAGS := -Wall -Werror -pedantic -std=c99 -D_GNU_SOURCE
- ifeq (${DEBUG},1)
-   CFLAGS += -g -O0 -DDEBUG
- else
-@@ -39,7 +38,7 @@ ${PROJECT}: ${OBJECTS} Makefile
- 	@echo "Built $@ successfully"
- 	@${ECHO_BLANK_LINE}
- 
--%.o: %.c %.h Makefile
-+%.o: %.c Makefile
- 	@echo "  CC      $<"
- 	${Q}${CC} -c ${CFLAGS} $< -o $@
- 
--- 
-2.16.4
-
diff --git a/recipes-bsp/u-boot/files/macchiatobin-rules b/recipes-bsp/u-boot/files/macchiatobin-rules
index 6656660..6bf28b3 100644
--- a/recipes-bsp/u-boot/files/macchiatobin-rules
+++ b/recipes-bsp/u-boot/files/macchiatobin-rules
@@ -27,8 +27,7 @@ override_dh_auto_build:
 	$(MAKE) USE_COHERENT_MEM=0 \
 	        PLAT=a80x0_mcbin \
 	        MV_DDR_PATH=../mv-ddr-marvell \
-	        SCP_BL2=../binaries-marvell/mrvl_scp_bl2_mss_ap_cp1_a8040.img \
-	        BLE_PATH=../ble-marvell \
+	        SCP_BL2=../binaries-marvell/mrvl_scp_bl2.img \
 	        BL33=$(U_BOOT_DIR)/u-boot.bin \
 	        all fip
 
diff --git a/recipes-bsp/u-boot/u-boot-macchiatobin_2018.09-atf1.6.bb b/recipes-bsp/u-boot/u-boot-macchiatobin_2019.07-atf2.1.bb
similarity index 73%
rename from recipes-bsp/u-boot/u-boot-macchiatobin_2018.09-atf1.6.bb
rename to recipes-bsp/u-boot/u-boot-macchiatobin_2019.07-atf2.1.bb
index 5eb5153..37b41f9 100644
--- a/recipes-bsp/u-boot/u-boot-macchiatobin_2018.09-atf1.6.bb
+++ b/recipes-bsp/u-boot/u-boot-macchiatobin_2019.07-atf2.1.bb
@@ -19,17 +19,15 @@ SRC_URI += " \
     ftp://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
     git://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell;protocol=https;branch=mv_ddr-armada-atf-mainline;rev=${MV_DDR_REV};destsuffix=mv-ddr-marvell \
     git://github.com/MarvellEmbeddedProcessors/binaries-marvell;protocol=https;branch=${MV_BIN_BRANCH};rev=${MV_BIN_REV};destsuffix=binaries-marvell \
-    git://github.com/MarvellEmbeddedProcessors/ble-marvell.git;protocol=https;branch=atf-mainline;rev=${MV_BLE_REV};destsuffix=ble-marvell \
     file://macchiatobin-rules \
     "
-SRC_URI[u-boot.sha256sum] = "839bf23cfe8ce613a77e583a60375179d0ad324e92c82fbdd07bebf0fd142268"
+SRC_URI[u-boot.sha256sum] = "bff4fa77e8da17521c030ca4c5b947a056c1b1be4d3e6ee8637020b8d50251d0"
 
 BUILD_DEPENDS =. "libssl-dev:native, "
 
-MV_DDR_REV="779e860c3b81eda192dd40270f46c0ff44e52113"
-MV_BIN_BRANCH="binaries-marvell-armada-18.06"
-MV_BIN_REV="14481806e699dcc6f7025dbe3e46cf26bb787791"
-MV_BLE_REV="61d305e3869dec8c8c5b8c2fd985548f9a424688"
+MV_DDR_REV="a881467ef0f0185e6570dd0483023fde93cbb5f5"
+MV_BIN_BRANCH="binaries-marvell-armada-18.12"
+MV_BIN_REV="c6c529ea3d905a28cc77331964c466c3e2dc852e"
 
 U_BOOT_CONFIG="mvebu_mcbin-88f8040_defconfig"
 U_BOOT_BIN="u-boot.bin"
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b75d5c8024bbd83812068e1a79a1932e04656107.1567490365.git.jan.kiszka%40siemens.com.
