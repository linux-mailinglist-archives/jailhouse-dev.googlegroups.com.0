Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQECXDVQKGQEP2RMEAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id F11C3A60EC
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 07:59:28 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id 205sf833448ljf.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 22:59:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567490368; cv=pass;
        d=google.com; s=arc-20160816;
        b=Yz4qB+tPhLYbrLwJJV1GUu48IbzIheoB6cpx1LXh6+phtPkgf49iyghWhsWpnOFZaA
         f8P9s8DL/ZiFEvQP9F+lTmP6wHUPOZ5zyhdUK4sDYpCelPkpCQpEoJVVdfUPL09/zWKS
         4zUFmWJ6luzFZHSvlOtDWv9c7Qy1DqzI37vTIwTQz63khAt+flOJbp/crKiT1169Rdx2
         UUH/LU3OjIe/ihMyFh+0NpZFfsSIauc1sR5XVxxk2CVbj78XZhiv2Zy5Lfb7bjRszBIb
         nRi0sDON2Fq9WDIq/MmDRaqBFjEogkmHaDyvkamsKagqyDMZaIeVKxmCjxlm2WoabD7G
         brpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=wTTCBWWOuGzS0igcJDFa0k46iJZ637fYLzQTsVYLP8M=;
        b=E9EG/AgT5V1RvVLGwihC9TK2ODsYALNzgbXfNUvPTPKLtxP6AGdJW4K775dIL+6csI
         hBo0uXcDZq2c2ekgXkuu4X58T2uAEmmf6bC3MJJ5WjIAgyknMVPaxpejawSCMJsykAab
         wkKHQlmg6WWNl/VYnrNrc8+ir6iXP+vNFh6eREREbndgdxunzMPQFxkINoSBLq80efv2
         U0KIf2asvPWYhyPjLHfWropY4P/NYgBjjHYHTz+8jdRHSyYKarBQKn+0zv4TuoFXrPl/
         9myyC2sNN7vaLQZ08ii6QskOWkLeWjXWM4QQYMLlyuKVjXLRfkJcZe0ZkavTayky0vEE
         OTUg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wTTCBWWOuGzS0igcJDFa0k46iJZ637fYLzQTsVYLP8M=;
        b=VDxUOjKKPU2pPLOEZy8pNYI1KUy99lCg110SuraDJTWolsQrg6Yr1+lKG0+uAj8weq
         EOGf5PVXyhpiafVM57GEsxFhOzyY4TZEMikJC20tAOeR62wO6sn7PchqHiME3KljDhw8
         PGgyNLZXmvnCXgQ4n7QrCjx75zBAY73n4Mcc9FzUisq56dD5Lb+ErqWU25d7//xJFbyJ
         UkzSpI65WSeY2e3ZkYasiPOZV0ZNZOpBanDD69059Po53S4dQYfVlxtPGkZz+6QuAqtY
         aM0Gq9em9GXvMqdedCieKeoH5t/5mIjY8KAbBgsLsQpqssDAyfQqmiwoRQ1cH8U9mA/i
         ce7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wTTCBWWOuGzS0igcJDFa0k46iJZ637fYLzQTsVYLP8M=;
        b=cX05iPvygYd5Br4nWTOhZGDIPu83FKmXvWFWw3dpCgXAPLolRJCVdH1jniel8/Lhda
         hKvXxWRX/6bVlTzSjkXwHeUmY+zKXxIoECTwoH0c9rCsCdqB0lNi4A0TC4uHDbqe257t
         Bt+Ic1sKY648V4F2UDILH396zNqZUsyM5aQtQkgA8uVouR1OQTcjYvu2mA0nbiG0o6lk
         BfZJe93//GtG2I/ouFsmtuUYkGDLOo4zzf3kzrKMDR4siEMG3GQH7ftGHK/t+U5gaF9E
         Q1ky/rfE0YD1MmZPR5Oe5nC3SRPb8xoWpdtD4i4vEIkKQf4spFrr+9Ggh5Her2FqlD0v
         ZL2w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUD1/2gqrzxVuSGcrX5rLr9gF/isgbWmu/kAdrk8ESqxxiEelek
	YLiTSIs7/yHv1EVt12lirLk=
X-Google-Smtp-Source: APXvYqzxZn3pHujsFdO8opueZs/1atbMmxtXk4NiuV6V9siHLLzjCod7zBzeHWtsDihNXBgNm9DKlQ==
X-Received: by 2002:ac2:54aa:: with SMTP id w10mr1634366lfk.67.1567490368552;
        Mon, 02 Sep 2019 22:59:28 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:5f55:: with SMTP id a21ls118208lfj.0.gmail; Mon, 02 Sep
 2019 22:59:27 -0700 (PDT)
X-Received: by 2002:a19:8c1d:: with SMTP id o29mr14898703lfd.73.1567490367609;
        Mon, 02 Sep 2019 22:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567490367; cv=none;
        d=google.com; s=arc-20160816;
        b=Wv2V9GxSLzIPCDElC91Zc0swFgxwj4V4og+pTpF9Sp5MSJ7oNUHLl2uV4HhquqtBlE
         QzjWFBs83vH3ot00c+pf6h+38W/LHCnwuhzDXfo4t3PWbFLN6fyYOLp8I8Azf4onoFFj
         N9OeMKCEUzGEwwpW70YGMY9x9+lt+S+3Io3PZI3MrKv3Y4WYKE0xMdjQoyojvROVvEiO
         fynQa/5rWwWP+CJyYYea5X+Ydrs+p/H6f/ez73Q4mLOFS7hCH/xLhQhiF0rFd2QpRqkq
         l8ms8tAGdxXcDB4XooQhrtqG1nDwngxqbnaVesnodSQZLlOWO+QsVQ1/XI9AWF+PBCiY
         /fCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=+KyAfDNP9vI1ew1rs5Td/ODKbBVOhzL3HGla2ICOZZw=;
        b=MqY0yxEFfQJ8C9Y8nzd5I8/sehEroYrMIZjuvrSANWLjo6ImzKypvvnv1L3gXveOyX
         3dnSD9xGC8nC0gdjzKNT+BIaRi+ApAxdZp3QNAMJN0KDZF+e32w7qbWTkDEh6OTIehQe
         +E1SooW+CYhKMDKBAREDoE2EmGtD7JkP3+TxzttzimcvjHYeYT8gM36/chSgGo6pMkjn
         lpXdoLIXJK02NA8jIwaULR+WyhYWp7LzwkSUdLkg3Zcom+XY+krwoNksebo4DpZMEMRm
         Na5xCY4zJtfVABRktP7sqO9vRypTojhwyou5jySok+3aFkns1Hffq7Na/fpEWTTi+GVo
         x4MA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id c8si403661lfm.4.2019.09.02.22.59.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 22:59:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x835xQuP009931
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:26 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.40.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x835xPkQ010486
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:26 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 03/13] u-boot-ultra96: Update to 2019.07 and ATF 2.1
Date: Tue,  3 Sep 2019 07:59:15 +0200
Message-Id: <f1ef3fe8bf5a157d18dffd6ef860cc4b978ec024.1567490365.git.jan.kiszka@siemens.com>
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

U-Boot requires an additional patch for the cross-building its tools.
ATF can drop the previously used compilation fix but needs a new one for
the ZynqMP specifically.

While at it, use the template mechanism for completing ultra96.bif.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../arm-trusted-firmware_2.1.inc                   | 18 ++++++
 ...t-xilinx-zynqmp-Initialize-IPI-table-from.patch | 68 ++++++++++++++++++++++
 .../files/0001-zynqmp-Downgrade-to-PMUFW-0.3.patch | 12 ++--
 ...s-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch | 31 ++++++++++
 .../u-boot/files/{ultra96.bif => ultra96.bif.tmpl} |  2 +-
 ...-atf1.6.bb => u-boot-ultra96_2019.07-atf2.1.bb} | 10 ++--
 6 files changed, 130 insertions(+), 11 deletions(-)
 create mode 100644 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.inc
 create mode 100644 recipes-bsp/arm-trusted-firmware/files/0001-plat-xilinx-zynqmp-Initialize-IPI-table-from.patch
 create mode 100644 recipes-bsp/u-boot/files/0002-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch
 rename recipes-bsp/u-boot/files/{ultra96.bif => ultra96.bif.tmpl} (87%)
 rename recipes-bsp/u-boot/{u-boot-ultra96_2019.01-atf1.6.bb => u-boot-ultra96_2019.07-atf2.1.bb} (86%)

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.inc b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.inc
new file mode 100644
index 0000000..8fd5cce
--- /dev/null
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.inc
@@ -0,0 +1,18 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+FILESPATH =. "${LAYERDIR_jailhouse}/recipes-bsp/arm-trusted-firmware/files:"
+
+SRC_URI += " \
+    https://github.com/ARM-software/arm-trusted-firmware/archive/v${ATF_PV}.tar.gz;name=atf \
+    file://0001-plat-xilinx-zynqmp-Initialize-IPI-table-from.patch;patchdir=${WORKDIR}/arm-trusted-firmware-${ATF_PV} \
+    "
+SRC_URI[atf.sha256sum] = "7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657c9301686e7d8824ef575d059"
diff --git a/recipes-bsp/arm-trusted-firmware/files/0001-plat-xilinx-zynqmp-Initialize-IPI-table-from.patch b/recipes-bsp/arm-trusted-firmware/files/0001-plat-xilinx-zynqmp-Initialize-IPI-table-from.patch
new file mode 100644
index 0000000..dec3cb2
--- /dev/null
+++ b/recipes-bsp/arm-trusted-firmware/files/0001-plat-xilinx-zynqmp-Initialize-IPI-table-from.patch
@@ -0,0 +1,68 @@
+From f20643624a65cc8a992cbafe245af11fcf63ab6d Mon Sep 17 00:00:00 2001
+From: Jolly Shah <jolly.shah@xilinx.com>
+Date: Tue, 27 Aug 2019 11:23:08 -0700
+Subject: [PATCH] plat: xilinx: zynqmp: Initialize IPI table from
+ zynqmp_config_setup()
+
+Common ipi_table needs to be initialized before using any
+IPI command (i.e send/receive). Move zynqmp ipi config table
+initialization from sip_svc_setup() to zynqmp_config_setup().
+
+Signed-off-by: Tejas Patel <tejas.patel@xilinx.com>
+Signed-off-by: Jolly Shah <jolly.shah@xilinx.com>
+---
+ plat/xilinx/zynqmp/aarch64/zynqmp_common.c | 6 +++++-
+ plat/xilinx/zynqmp/sip_svc_setup.c         | 4 ----
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/plat/xilinx/zynqmp/aarch64/zynqmp_common.c b/plat/xilinx/zynqmp/aarch64/zynqmp_common.c
+index 8ff6c43604..ab5d95d1e2 100644
+--- a/plat/xilinx/zynqmp/aarch64/zynqmp_common.c
++++ b/plat/xilinx/zynqmp/aarch64/zynqmp_common.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2013-2016, ARM Limited and Contributors. All rights reserved.
++ * Copyright (c) 2013-2019, ARM Limited and Contributors. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -11,6 +11,7 @@
+ #include <drivers/generic_delay_timer.h>
+ #include <lib/mmio.h>
+ #include <lib/xlat_tables/xlat_tables.h>
++#include <plat_ipi.h>
+ #include <plat_private.h>
+ #include <plat/common/platform.h>
+ 
+@@ -325,6 +326,9 @@ unsigned int zynqmp_get_bootmode(void)
+ 
+ void zynqmp_config_setup(void)
+ {
++	/* Configure IPI data for ZynqMP */
++	zynqmp_ipi_config_table_init();
++
+ 	zynqmp_print_platform_name();
+ 	generic_delay_timer_init();
+ }
+diff --git a/plat/xilinx/zynqmp/sip_svc_setup.c b/plat/xilinx/zynqmp/sip_svc_setup.c
+index edb81f5c3b..9b182749cb 100644
+--- a/plat/xilinx/zynqmp/sip_svc_setup.c
++++ b/plat/xilinx/zynqmp/sip_svc_setup.c
+@@ -9,7 +9,6 @@
+ #include <common/runtime_svc.h>
+ #include <tools_share/uuid.h>
+ 
+-#include <plat_ipi.h>
+ #include "ipi_mailbox_svc.h"
+ #include "pm_svc_main.h"
+ 
+@@ -41,9 +40,6 @@ DEFINE_SVC_UUID2(zynqmp_sip_uuid,
+  */
+ static int32_t sip_svc_setup(void)
+ {
+-	/* Configure IPI data for ZynqMP */
+-	zynqmp_ipi_config_table_init();
+-
+ 	/* PM implementation as SiP Service */
+ 	pm_setup();
+ 
diff --git a/recipes-bsp/u-boot/files/0001-zynqmp-Downgrade-to-PMUFW-0.3.patch b/recipes-bsp/u-boot/files/0001-zynqmp-Downgrade-to-PMUFW-0.3.patch
index ce262b6..efc0bb8 100644
--- a/recipes-bsp/u-boot/files/0001-zynqmp-Downgrade-to-PMUFW-0.3.patch
+++ b/recipes-bsp/u-boot/files/0001-zynqmp-Downgrade-to-PMUFW-0.3.patch
@@ -1,7 +1,7 @@
-From 4a8103341c5420a65b80e9bbe0702bb66260b283 Mon Sep 17 00:00:00 2001
+From 1c7b8a169b9c10760debb6f35399fb2a59c3e250 Mon Sep 17 00:00:00 2001
 From: Jan Kiszka <jan.kiszka@siemens.com>
 Date: Sat, 5 Jan 2019 22:15:31 +0100
-Subject: [PATCH] zynqmp: Downgrade to PMUFW 0.3
+Subject: [PATCH 1/2] zynqmp: Downgrade to PMUFW 0.3
 
 We currently only have 0.3 pre-built at hand.
 
@@ -9,13 +9,13 @@ Not for upstream.
 
 Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
 ---
- arch/arm/include/asm/arch-zynqmp/sys_proto.h | 4 ++--
+ arch/arm/mach-zynqmp/include/mach/sys_proto.h | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/arch/arm/include/asm/arch-zynqmp/sys_proto.h b/arch/arm/include/asm/arch-zynqmp/sys_proto.h
+diff --git a/arch/arm/mach-zynqmp/include/mach/sys_proto.h b/arch/arm/mach-zynqmp/include/mach/sys_proto.h
 index 385c8825f2..857c512088 100644
---- a/arch/arm/include/asm/arch-zynqmp/sys_proto.h
-+++ b/arch/arm/include/asm/arch-zynqmp/sys_proto.h
+--- a/arch/arm/mach-zynqmp/include/mach/sys_proto.h
++++ b/arch/arm/mach-zynqmp/include/mach/sys_proto.h
 @@ -23,8 +23,8 @@
  
  #define ZYNQMP_SIP_SVC_GET_API_VERSION		0xC2000001
diff --git a/recipes-bsp/u-boot/files/0002-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch b/recipes-bsp/u-boot/files/0002-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch
new file mode 100644
index 0000000..520c7f7
--- /dev/null
+++ b/recipes-bsp/u-boot/files/0002-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch
@@ -0,0 +1,31 @@
+From b8c188c02b5afc51257903a35a399fd4632978e8 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Sun, 25 Aug 2019 13:39:41 +0200
+Subject: [PATCH 2/2] Revert "tools/Makefile: fix HOSTCFLAGS with
+ CROSS_BUILD_TOOLS"
+
+This reverts commit 72c69ea8d603fd2448dd1d7c399c4f77b77773b7.
+
+Breaks CROSS_BUILD_TOOLS=y build with CONFIG_FIT and without
+CONFIG_FIT_SIGNATURE.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ tools/Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 33e90a8025..2717304003 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -274,7 +274,6 @@ subdir- += env
+ 
+ ifneq ($(CROSS_BUILD_TOOLS),)
+ override HOSTCC = $(CC)
+-override HOSTCFLAGS = $(CFLAGS)
+ 
+ quiet_cmd_crosstools_strip = STRIP   $^
+       cmd_crosstools_strip = $(STRIP) $^; touch $@
+-- 
+2.16.4
+
diff --git a/recipes-bsp/u-boot/files/ultra96.bif b/recipes-bsp/u-boot/files/ultra96.bif.tmpl
similarity index 87%
rename from recipes-bsp/u-boot/files/ultra96.bif
rename to recipes-bsp/u-boot/files/ultra96.bif.tmpl
index 29add58..e4a7937 100644
--- a/recipes-bsp/u-boot/files/ultra96.bif
+++ b/recipes-bsp/u-boot/files/ultra96.bif.tmpl
@@ -13,6 +13,6 @@ image : {
 	[pmufw_image] ../usr/share/zynqmp/pmufw.elf
 	[bootloader, destination_cpu=a5x-0] ../usr/share/zynqmp/fsbl.elf
 	../design_1_wrapper.bit
-	[destination_cpu=a5x-0, exception_level=el-3,trustzone] ../arm-trusted-firmware-@ATF_PV@/build/zynqmp/release/bl31/bl31.elf
+	[destination_cpu=a5x-0, exception_level=el-3,trustzone] ../arm-trusted-firmware-${ATF_PV}/build/zynqmp/release/bl31/bl31.elf
 	[destination_cpu=a5x-0, exception_level=el-2] u-boot.elf
 }
diff --git a/recipes-bsp/u-boot/u-boot-ultra96_2019.01-atf1.6.bb b/recipes-bsp/u-boot/u-boot-ultra96_2019.07-atf2.1.bb
similarity index 86%
rename from recipes-bsp/u-boot/u-boot-ultra96_2019.01-atf1.6.bb
rename to recipes-bsp/u-boot/u-boot-ultra96_2019.07-atf2.1.bb
index f37985d..baa4ac7 100644
--- a/recipes-bsp/u-boot/u-boot-ultra96_2019.01-atf1.6.bb
+++ b/recipes-bsp/u-boot/u-boot-ultra96_2019.07-atf2.1.bb
@@ -18,17 +18,21 @@ require recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_${ATF_PV}.inc
 SRC_URI += " \
     ftp://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
     file://0001-zynqmp-Downgrade-to-PMUFW-0.3.patch \
+    file://0002-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch \
     https://download.opensuse.org/repositories/devel:/ARM:/Factory:/Contrib:/Zynq:/ZCU100/standard/noarch/zynqmp-pmufw-2017.1-7.3.noarch.rpm;name=pmufw \
     https://download.opensuse.org/repositories/devel:/ARM:/Factory:/Contrib:/Zynq:/ZCU100/standard/aarch64/zynqmp-fsbl-2017.1-7.2.aarch64.rpm;name=fsbl \
     https://download.opensuse.org/repositories/devel:/ARM:/Factory:/Contrib:/Zynq:/ZCU100/standard/noarch/zynqmp-hdf-20180326-4.3.noarch.rpm;name=hdf \
-    file://ultra96.bif \
+    file://ultra96.bif.tmpl \
     file://ultra96-rules \
     "
-SRC_URI[u-boot.sha256sum] = "50bd7e5a466ab828914d080d5f6a432345b500e8fba1ad3b7b61e95e60d51c22"
+SRC_URI[u-boot.sha256sum] = "bff4fa77e8da17521c030ca4c5b947a056c1b1be4d3e6ee8637020b8d50251d0"
 SRC_URI[pmufw.sha256sum] = "6b4fec22e76c3c44ba4bec72f6f73e85192373f2156b0af3ce9e8894312b968e"
 SRC_URI[fsbl.sha256sum] = "6f420f4cb049eb4ddd981fb9a1c964db9771e359dc51385a886bbcb27a9a616e"
 SRC_URI[hdf.sha256sum] = "246bef07b16cace18cc7c270dedcec89913b64fa623e590461250e3e038f88fd"
 
+TEMPLATE_FILES += "ultra96.bif.tmpl"
+TEMPLATE_VARS += "ATF_PV"
+
 U_BOOT_CONFIG="avnet_ultra96_rev1_defconfig"
 U_BOOT_BIN="u-boot.elf"
 
@@ -40,7 +44,5 @@ do_prepare_build_append() {
     unzip -u -d ${WORKDIR} ${WORKDIR}/usr/share/zynqmp/system.hdf \
         design_1_wrapper.bit
 
-    sed -i "s/@ATF_PV@/${ATF_PV}/g" ${WORKDIR}/ultra96.bif
-
     echo "boot.bin /usr/lib/u-boot/ultra96" > ${S}/debian/u-boot-ultra96.install
 }
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f1ef3fe8bf5a157d18dffd6ef860cc4b978ec024.1567490365.git.jan.kiszka%40siemens.com.
