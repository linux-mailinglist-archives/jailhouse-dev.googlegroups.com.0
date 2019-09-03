Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQECXDVQKGQEP2RMEAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC4EA60ED
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 07:59:29 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id 19sf6510675wmk.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 22:59:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567490368; cv=pass;
        d=google.com; s=arc-20160816;
        b=Pjw5p7wJBgXAkadB9uROIsd2/5Qb6UrPKA7t1QB9eJZPrxWKq7H3I2iAS3sqUPpc7n
         DeQw5+ET3EnC0RJRLALl+mKjWNOsI7N+zAtOb8sJQ3zh9O4Phw0gyR7ccqnJsFz/VZzd
         6Liuxjgux+z6D+VB8thSYm7N3xc1FNuyZARfmrh5th04Sp7YeEiUMjhJdG/Lbq6dq7tB
         T35Ts8PALkMXfiw0tyi5U7WF1/EBF2nbx6NvSt/xte04Nf0KohqdjJBlgMbZOYx5oE+W
         SjmZYJlHOi2hOE3akgOd6he4nlPwARkd4FiruZ3/w8nCzqCI9VVZomh4YiD0een3PtcS
         nrkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=wylH6FjUwm9iY2UhbIS6qGmy5nTb15P8XRGSoP3ZDbY=;
        b=bqToVM7kDpTfXYrMZuveVSW+1dM7m8DYrzGChE5j5lbbz3gmfoc4yrqrCyLHSprMxM
         886Zh4C8b+N8oGeTzJfGE41ndXZpTsv4nbazDxuYqwZpAkaIpLO1U8qJam7Ggom4Jk7h
         bjIAc6zXdGBv9amcdeI3GNmZuZIa09d+Y5ZlDXUR1u9qPSAo0QnR17aNAWteJ3dvWKKv
         bflZxCpRXKpgsGuahn9RTRHRHX3A5kFeF/5svLpvO4oY1ClzKLK4h3hPGxKcQvCOFrgI
         CFHwU8abHExjuBgoKLOEX6s17I/Rfvm/Q+BPhkv7+Eo0p+D2lzeKGebRGksEOCK9J+g8
         9WqQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wylH6FjUwm9iY2UhbIS6qGmy5nTb15P8XRGSoP3ZDbY=;
        b=PTIeXt+WlKX/YhBoJUY9tA7ntv4vXnrvDWfNt5VMKIbGJxHnDEtMxxq1e7LRE7K8Mh
         W+y6YIx0lQLQhRs7gLbrQWYAEjnB0LOZWizgDePQUy8jYM3gnUdTx2MKVhq6C59RqTO1
         ++dziSfqo5efRc5PXXt3phQQoF3YGD23/cZ/OyPFYzMKNh4pq39PkAIV3+U0j7DXu7r0
         T2PbsEc3nUJeLNY1iKg9w/rBlgvsbgYGlKZTD3KxMLa2KuEyMC17Uk7OQUDN8vr8U2e3
         YiIjhSXXXci3yieREC6CJ+0/H6h58a5qSz7ECjDu6uMi3cSIeOf5WHk+tZyA10doWRqp
         bZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wylH6FjUwm9iY2UhbIS6qGmy5nTb15P8XRGSoP3ZDbY=;
        b=U1W5cmmzS1qzadt774Pm/o0BrmLqhKySnHKnK4NxXL34uisTtFFtrRXrlXDTj4cCGE
         Tf2JWRauzIqcR1pS3y0jwIQWRph+GgbGEeT/puk49mqbI6rUPQKAALpYzMDziOIapAcT
         EYXLnx9B/tZeud3lRVxhA87bnV5TUTkFOXv2O4DOXy7hoYMIaiynNO23z+/nAAXP7fdZ
         KZfAC+uk9QThJVmNuoAthf73ibT3XCZyN48VTudQjgTXzBnGKyvr7NbF8u9y/34PBco/
         QxY1fXi4CZrfgWL75HT/CgUGSNSe5glw+0dWHEev1Kd2EHBKkNCobTb5qr0Bl7yqx7eW
         Kt/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVS/ldpQvDDK8DdB2fHakGCh3aroASp47ruytjawvmXvEw3y/4F
	CJ39x6/spD53hRQM7UDk0/4=
X-Google-Smtp-Source: APXvYqzNqaUnAH4ZCfFt6L4SGtqKhU1hUF/qMkil3QC89BE/A/MZ7X/YQNnltiRgF2CoE5okg0g5hg==
X-Received: by 2002:a05:600c:491:: with SMTP id d17mr10400687wme.61.1567490368740;
        Mon, 02 Sep 2019 22:59:28 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:448a:: with SMTP id j10ls15250wrq.12.gmail; Mon, 02 Sep
 2019 22:59:27 -0700 (PDT)
X-Received: by 2002:a5d:65c2:: with SMTP id e2mr4329273wrw.128.1567490367967;
        Mon, 02 Sep 2019 22:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567490367; cv=none;
        d=google.com; s=arc-20160816;
        b=fVo5d7+hhKNSniH/iycIRIrSuicPw35S8AI1pNDzMaTKKO3WiNAqDKgIXFZiLECP7n
         dRGOgwqE5xYpER6jVp9VBF5EHxMUnQlogZ4/sd0R5LRbSyjVmKfU4H6GNMFQszqbzPFn
         P3QqemhNjZeFOVtymnmX5joHaam4NXE7Z4tdxb9Rii3Hwjh1OxFdUoG9UqdckcgrnyiU
         cpHiJYuoTSijs1LdKj3SuIdUrtuI0syJtD5zLPGKGpNj4RESNC7tudCKRTz2YYXE2ODW
         2tp6rRUbs1PZUU4Y7FTWkRAk8epHC7JRkRW13jByn8XHoYQPI5N7egNw0i4Icg/umVsH
         V6sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=sQ/pn8ozylGo/l21KXpgaefXsBxFz5MlieKs9KCLU+c=;
        b=XBmeB4LMWMbOaMN9pIg6sNfQpCf3C7x/MrDD7tdd48udxFVxKCozC7Imp/7hd2eGop
         5o9v0NB/TyxfrmMdZ5hYC6AjYHdPa+8yzLwOZ4Do9fXAiLuMdtd26M7zpHrgde3rX0Nb
         YbBmntVu8DH1cmgHGf2HefzvILGzOplYJApHB0Se+ydpoa26lyht2jFaF1I/fnLUF9YN
         sP5wxcrkGoAuYW7gIk2u+imnTD8jfJmtifXEkNfVGWuQv5wvDqAvDd8YTCE5GA8oRK/S
         RakkFhLuzH2uaKFzqv5rE18tPU0dcbP/wQHABZumToU7hinisI/ljB5hMOVqIr3G1SeU
         kB0A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id r1si481852wrp.3.2019.09.02.22.59.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 22:59:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x835xRPj009948
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:27 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.40.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x835xPkT010486
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:27 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 06/13] u-boot-ultra96: Switch to self-built PMU firmware
Date: Tue,  3 Sep 2019 07:59:18 +0200
Message-Id: <e141df895355bb5c2dfae5542045bb03e21233ad.1567490365.git.jan.kiszka@siemens.com>
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

This allows to update the firmware to the latest release and drop one
patch.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch} |  4 +--
 .../files/0001-zynqmp-Downgrade-to-PMUFW-0.3.patch | 32 ----------------------
 recipes-bsp/u-boot/files/ultra96.bif.tmpl          |  2 +-
 .../u-boot/u-boot-ultra96_2019.07-atf2.1.bb        |  8 +++---
 4 files changed, 7 insertions(+), 39 deletions(-)
 rename recipes-bsp/u-boot/files/{0002-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch => 0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch} (84%)
 delete mode 100644 recipes-bsp/u-boot/files/0001-zynqmp-Downgrade-to-PMUFW-0.3.patch

diff --git a/recipes-bsp/u-boot/files/0002-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch b/recipes-bsp/u-boot/files/0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch
similarity index 84%
rename from recipes-bsp/u-boot/files/0002-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch
rename to recipes-bsp/u-boot/files/0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch
index 520c7f7..ac20d26 100644
--- a/recipes-bsp/u-boot/files/0002-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch
+++ b/recipes-bsp/u-boot/files/0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch
@@ -1,7 +1,7 @@
-From b8c188c02b5afc51257903a35a399fd4632978e8 Mon Sep 17 00:00:00 2001
+From 06b5faeb1e6b18c86dc5fcdd1cc764ee49da1fbe Mon Sep 17 00:00:00 2001
 From: Jan Kiszka <jan.kiszka@siemens.com>
 Date: Sun, 25 Aug 2019 13:39:41 +0200
-Subject: [PATCH 2/2] Revert "tools/Makefile: fix HOSTCFLAGS with
+Subject: [PATCH] Revert "tools/Makefile: fix HOSTCFLAGS with
  CROSS_BUILD_TOOLS"
 
 This reverts commit 72c69ea8d603fd2448dd1d7c399c4f77b77773b7.
diff --git a/recipes-bsp/u-boot/files/0001-zynqmp-Downgrade-to-PMUFW-0.3.patch b/recipes-bsp/u-boot/files/0001-zynqmp-Downgrade-to-PMUFW-0.3.patch
deleted file mode 100644
index efc0bb8..0000000
--- a/recipes-bsp/u-boot/files/0001-zynqmp-Downgrade-to-PMUFW-0.3.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1c7b8a169b9c10760debb6f35399fb2a59c3e250 Mon Sep 17 00:00:00 2001
-From: Jan Kiszka <jan.kiszka@siemens.com>
-Date: Sat, 5 Jan 2019 22:15:31 +0100
-Subject: [PATCH 1/2] zynqmp: Downgrade to PMUFW 0.3
-
-We currently only have 0.3 pre-built at hand.
-
-Not for upstream.
-
-Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
----
- arch/arm/mach-zynqmp/include/mach/sys_proto.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/arch/arm/mach-zynqmp/include/mach/sys_proto.h b/arch/arm/mach-zynqmp/include/mach/sys_proto.h
-index 385c8825f2..857c512088 100644
---- a/arch/arm/mach-zynqmp/include/mach/sys_proto.h
-+++ b/arch/arm/mach-zynqmp/include/mach/sys_proto.h
-@@ -23,8 +23,8 @@
- 
- #define ZYNQMP_SIP_SVC_GET_API_VERSION		0xC2000001
- 
--#define ZYNQMP_PM_VERSION_MAJOR		1
--#define ZYNQMP_PM_VERSION_MINOR		0
-+#define ZYNQMP_PM_VERSION_MAJOR		0
-+#define ZYNQMP_PM_VERSION_MINOR		3
- #define ZYNQMP_PM_VERSION_MAJOR_SHIFT	16
- #define ZYNQMP_PM_VERSION_MINOR_MASK	0xFFFF
- 
--- 
-2.16.4
-
diff --git a/recipes-bsp/u-boot/files/ultra96.bif.tmpl b/recipes-bsp/u-boot/files/ultra96.bif.tmpl
index e4a7937..4ff0638 100644
--- a/recipes-bsp/u-boot/files/ultra96.bif.tmpl
+++ b/recipes-bsp/u-boot/files/ultra96.bif.tmpl
@@ -10,7 +10,7 @@
 #
 
 image : {
-	[pmufw_image] ../usr/share/zynqmp/pmufw.elf
+	[pmufw_image] /usr/share/zynqmp-pmufw/executable.elf
 	[bootloader, destination_cpu=a5x-0] ../usr/share/zynqmp/fsbl.elf
 	../design_1_wrapper.bit
 	[destination_cpu=a5x-0, exception_level=el-3,trustzone] ../arm-trusted-firmware-${ATF_PV}/build/zynqmp/release/bl31/bl31.elf
diff --git a/recipes-bsp/u-boot/u-boot-ultra96_2019.07-atf2.1.bb b/recipes-bsp/u-boot/u-boot-ultra96_2019.07-atf2.1.bb
index baa4ac7..14f5879 100644
--- a/recipes-bsp/u-boot/u-boot-ultra96_2019.07-atf2.1.bb
+++ b/recipes-bsp/u-boot/u-boot-ultra96_2019.07-atf2.1.bb
@@ -17,22 +17,22 @@ require recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_${ATF_PV}.inc
 
 SRC_URI += " \
     ftp://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
-    file://0001-zynqmp-Downgrade-to-PMUFW-0.3.patch \
-    file://0002-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch \
-    https://download.opensuse.org/repositories/devel:/ARM:/Factory:/Contrib:/Zynq:/ZCU100/standard/noarch/zynqmp-pmufw-2017.1-7.3.noarch.rpm;name=pmufw \
+    file://0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch \
     https://download.opensuse.org/repositories/devel:/ARM:/Factory:/Contrib:/Zynq:/ZCU100/standard/aarch64/zynqmp-fsbl-2017.1-7.2.aarch64.rpm;name=fsbl \
     https://download.opensuse.org/repositories/devel:/ARM:/Factory:/Contrib:/Zynq:/ZCU100/standard/noarch/zynqmp-hdf-20180326-4.3.noarch.rpm;name=hdf \
     file://ultra96.bif.tmpl \
     file://ultra96-rules \
     "
 SRC_URI[u-boot.sha256sum] = "bff4fa77e8da17521c030ca4c5b947a056c1b1be4d3e6ee8637020b8d50251d0"
-SRC_URI[pmufw.sha256sum] = "6b4fec22e76c3c44ba4bec72f6f73e85192373f2156b0af3ce9e8894312b968e"
 SRC_URI[fsbl.sha256sum] = "6f420f4cb049eb4ddd981fb9a1c964db9771e359dc51385a886bbcb27a9a616e"
 SRC_URI[hdf.sha256sum] = "246bef07b16cace18cc7c270dedcec89913b64fa623e590461250e3e038f88fd"
 
 TEMPLATE_FILES += "ultra96.bif.tmpl"
 TEMPLATE_VARS += "ATF_PV"
 
+DEPENDS += "zynqmp-pmufw"
+BUILD_DEPENDS += ", zynqmp-pmufw:native"
+
 U_BOOT_CONFIG="avnet_ultra96_rev1_defconfig"
 U_BOOT_BIN="u-boot.elf"
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e141df895355bb5c2dfae5542045bb03e21233ad.1567490365.git.jan.kiszka%40siemens.com.
