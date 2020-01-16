Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSXYQDYQKGQEUO5UEIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C6B13D7F1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:50 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id t17sf481275wmi.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170890; cv=pass;
        d=google.com; s=arc-20160816;
        b=YiU5hytr6Ga1zNRrPQmYw4lfnF2YSBId9cI8ockhgyRzg4uTGZ1ewkLA0qXD14wiPc
         Rfl96s0CWJJetGh0O4t+Y2WrSmviGcz8nBztA1/1Pb7laY9VF89sDqmrsAUfNivHMtd9
         jONciQz9IJCei4AE3C/+Hk+f0bEL/TtRi6o58KnmMc/QOuwlbBAGHP2n7DBBF3bToOWP
         AlErLJR+JYTYmgtk4CP3jjj3fXZhyTlgd4DUaZUvqklDl72MPOktP0FB4KCjaiBs8iqd
         hHYVAUQNCU6522uLge/uG2v3OUkdygnhhw8s53vb6GumSyPoeJsEuSAMX/lCtnRSDF6G
         kaMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=Pwv4LjwkicHInjIFyKyGaIx6SXRk13jX0H7Mb+aCp1o=;
        b=JTTAwKksvNoGGonxn7lpX/cBTt/1IIVUwVuJIyxHCK//Y2BwtZxvv5/wqmD1sE7tnx
         r01ehO3M4vxIXyqx6Db509KyyHT0E/rVLqb+qXTOE/xgtf+eNZQ7D8W69JXYJ0GjU6KP
         bTirftRvk4o7l8P38csJ40TXHYOyQVxYi8skb/1O1OWIKpeXpTQGUdX/KigvOuGY3upG
         Igxnd9DhhxJ2vtA/fxc9Cj3vcho0p7xKVKyrtaib6g7SvTXbZLpoRUbJRyNXmgWPVuGc
         xy0sakck7cskEqHO7Nq8OtJXwijWzIfE/nLw2s0aScJFHj2iWuJ9CxEch3eCxEaS0YLe
         vdBw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Pwv4LjwkicHInjIFyKyGaIx6SXRk13jX0H7Mb+aCp1o=;
        b=dchitkzJXGaBfkGWZUdpZ+Yg0IGerdrEaN/FKETGReAoOsisNOxdAU5MJ8PqxQcmGN
         jp2oCJJPkTxIanfmoj3Wq4LVILqNzqk/zZUBPcX0FpQGwD0ccwHxmcGCAMeDG8qj7J9e
         BUqaOB8SD27jnwh678JyCRd+k5Nlki96q71dgPT3cWPfVIXIQeO7cteZ0Wol/Fbv36EC
         xt4+qwgJMIr8OmJqW4vNe61QcC2I1wP5hgfB0fCLdGiWXHoZQSojoKqD5/77RNTzpGiV
         y9R5oThnrXMOPWiz7lNpB/Cv4W/XPIdm6fcH5taaeu7ca9iRLCaZ6xXsEd+p5urHpBys
         vZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Pwv4LjwkicHInjIFyKyGaIx6SXRk13jX0H7Mb+aCp1o=;
        b=ETkBx1OWXiF6CDPAZOZ/0Fe3aAH//WcSB2K8QhOZqTrG2CBSnfB3efuXLQ5HLAgj+j
         2b7OHG36aOQxblvFk1Pu+6M+9uaMnmbfgHG8MjtYJU7AN6HlOTFw3CKxv3WfnEanoP4N
         jjjPSmxK1EOVVYpX/oa1IcyeeemsI8uV7UHQ1G3811VB6IBRtUeuF997hvvAic6Py9C3
         UWS+G6HqdYGrCcbR9rT6t6l/dOj4CZW7QypcltxKmzZtPjqOGwx7jx3K4D/B6xPWCj2e
         HgV0iDy+OoscSmnsDaOkhAkgOYSgaTFh5y//QMlGb6TD+69WFM+4Dfdn8TIyLde2/lPu
         Zogg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU5tOC/WRtle2tf1JNaaW4LlNRPCai4ziawYSFzMH8TrqJ4uXHx
	CWO0tfjA6kkNGwvm3XI7tSk=
X-Google-Smtp-Source: APXvYqxdZZPulzqLQl+MDd9uFMGTB6QtZRuMHo93qpzK/9WfNQ7AqkKC25xuFB8ocM2CwwPGIoZH1Q==
X-Received: by 2002:a05:600c:2117:: with SMTP id u23mr5354346wml.106.1579170890297;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7409:: with SMTP id p9ls1021648wmc.4.gmail; Thu, 16 Jan
 2020 02:34:49 -0800 (PST)
X-Received: by 2002:a05:600c:2c53:: with SMTP id r19mr5333421wmg.39.1579170889376;
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170889; cv=none;
        d=google.com; s=arc-20160816;
        b=msva5Ghm6+PP9+Q8d7oxwV7ukzJZVjhE+BHLYY8e4wOB6VTwZrcZOnnKiVQH9jfR0K
         t3Nx/uuPnpBV8NWg27Hs2SuXvGrGmff01MBtbGdb8jGotUb9joRz7BAFZ1s1sGJUvL5Z
         QcJTTK2ajANXAYN8iIw4brgxS6XS3vyTxw6LpFvLLrhZ2QBoZqsbE1N/pOnXR65SjP55
         TCJwNx8e17pBopCvqZBIJOZGTcRpfnZXL0Ffs6txXNtboD+2aZjd91aG8cHlM3vHPHf0
         R0WNBXWrOB/uWFnHuqAxXsfH9ALjAW9Ecifsdd0oTbCbsUa0SUnsAgoj6RJT840JBawD
         WkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=f3WVHnwzVgcMEIpBQwrHaO7l6oysR6NXSVFvtuV0fVQ=;
        b=lEPPNuwVO5Qwy+7QaLuCZVTRuAJjEmnfOS76oI0doQGwl0JtnNfNfIgMZnHmVtre2h
         vVWBzZHTFnjNuUbR6fsJAhshUz6zDCziprVO/Ygc6Tpz0No3+Gy7u/59pcnHy768/ILP
         GJNbUzdh2GOuQgdRpX/E+6x0pAtEm7zp6Oe0Ov33LcOrAYlM1iqJRcpHdN3Us5j9fXKu
         ENpjN5xMBL3cb8gEabAyrUVhvtLa+jWkypSoHQtJ2PQDHfvZ2C+ktfVqFXLS8W9ZVM1N
         do8oiDx0HnruwllQzkLnPQD0W9M3V2u41mxlJex1rd8N8Nd/oJayG8TjzyitPzG1jA+j
         z52w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id j188si103694wma.2.2020.01.16.02.34.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 00GAYmbR032062
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQC031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:48 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 02/18] u-boot-macchiatobin/ultra96: Update to U-Boot 2019.10 / ATF 2.2
Date: Thu, 16 Jan 2020 11:34:31 +0100
Message-Id: <94238caff510daf171b442f1fda43bce4db9db36.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
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

This allows to drop the now included zynqmp fix from ATF.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...rmware_2.1.inc => arm-trusted-firmware_2.2.inc} |  3 +-
 ...t-xilinx-zynqmp-Initialize-IPI-table-from.patch | 68 ----------------------
 ....1.bb => u-boot-macchiatobin_2019.10-atf2.2.bb} |  2 +-
 ...-atf2.1.bb => u-boot-ultra96_2019.10-atf2.2.bb} |  2 +-
 4 files changed, 3 insertions(+), 72 deletions(-)
 rename recipes-bsp/arm-trusted-firmware/{arm-trusted-firmware_2.1.inc => arm-trusted-firmware_2.2.inc} (63%)
 delete mode 100644 recipes-bsp/arm-trusted-firmware/files/0001-plat-xilinx-zynqmp-Initialize-IPI-table-from.patch
 rename recipes-bsp/u-boot/{u-boot-macchiatobin_2019.07-atf2.1.bb => u-boot-macchiatobin_2019.10-atf2.2.bb} (94%)
 rename recipes-bsp/u-boot/{u-boot-ultra96_2019.07-atf2.1.bb => u-boot-ultra96_2019.10-atf2.2.bb} (91%)

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.inc b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
similarity index 63%
rename from recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.inc
rename to recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
index 8fd5cce..2281d72 100644
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.inc
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
@@ -13,6 +13,5 @@ FILESPATH =. "${LAYERDIR_jailhouse}/recipes-bsp/arm-trusted-firmware/files:"
 
 SRC_URI += " \
     https://github.com/ARM-software/arm-trusted-firmware/archive/v${ATF_PV}.tar.gz;name=atf \
-    file://0001-plat-xilinx-zynqmp-Initialize-IPI-table-from.patch;patchdir=${WORKDIR}/arm-trusted-firmware-${ATF_PV} \
     "
-SRC_URI[atf.sha256sum] = "7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657c9301686e7d8824ef575d059"
+SRC_URI[atf.sha256sum] = "07e3c058ae2d95c7d516a46fc93565b797e912c3271ddbf29df523b1ab1ee911"
diff --git a/recipes-bsp/arm-trusted-firmware/files/0001-plat-xilinx-zynqmp-Initialize-IPI-table-from.patch b/recipes-bsp/arm-trusted-firmware/files/0001-plat-xilinx-zynqmp-Initialize-IPI-table-from.patch
deleted file mode 100644
index dec3cb2..0000000
--- a/recipes-bsp/arm-trusted-firmware/files/0001-plat-xilinx-zynqmp-Initialize-IPI-table-from.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From f20643624a65cc8a992cbafe245af11fcf63ab6d Mon Sep 17 00:00:00 2001
-From: Jolly Shah <jolly.shah@xilinx.com>
-Date: Tue, 27 Aug 2019 11:23:08 -0700
-Subject: [PATCH] plat: xilinx: zynqmp: Initialize IPI table from
- zynqmp_config_setup()
-
-Common ipi_table needs to be initialized before using any
-IPI command (i.e send/receive). Move zynqmp ipi config table
-initialization from sip_svc_setup() to zynqmp_config_setup().
-
-Signed-off-by: Tejas Patel <tejas.patel@xilinx.com>
-Signed-off-by: Jolly Shah <jolly.shah@xilinx.com>
----
- plat/xilinx/zynqmp/aarch64/zynqmp_common.c | 6 +++++-
- plat/xilinx/zynqmp/sip_svc_setup.c         | 4 ----
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/plat/xilinx/zynqmp/aarch64/zynqmp_common.c b/plat/xilinx/zynqmp/aarch64/zynqmp_common.c
-index 8ff6c43604..ab5d95d1e2 100644
---- a/plat/xilinx/zynqmp/aarch64/zynqmp_common.c
-+++ b/plat/xilinx/zynqmp/aarch64/zynqmp_common.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2013-2016, ARM Limited and Contributors. All rights reserved.
-+ * Copyright (c) 2013-2019, ARM Limited and Contributors. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -11,6 +11,7 @@
- #include <drivers/generic_delay_timer.h>
- #include <lib/mmio.h>
- #include <lib/xlat_tables/xlat_tables.h>
-+#include <plat_ipi.h>
- #include <plat_private.h>
- #include <plat/common/platform.h>
- 
-@@ -325,6 +326,9 @@ unsigned int zynqmp_get_bootmode(void)
- 
- void zynqmp_config_setup(void)
- {
-+	/* Configure IPI data for ZynqMP */
-+	zynqmp_ipi_config_table_init();
-+
- 	zynqmp_print_platform_name();
- 	generic_delay_timer_init();
- }
-diff --git a/plat/xilinx/zynqmp/sip_svc_setup.c b/plat/xilinx/zynqmp/sip_svc_setup.c
-index edb81f5c3b..9b182749cb 100644
---- a/plat/xilinx/zynqmp/sip_svc_setup.c
-+++ b/plat/xilinx/zynqmp/sip_svc_setup.c
-@@ -9,7 +9,6 @@
- #include <common/runtime_svc.h>
- #include <tools_share/uuid.h>
- 
--#include <plat_ipi.h>
- #include "ipi_mailbox_svc.h"
- #include "pm_svc_main.h"
- 
-@@ -41,9 +40,6 @@ DEFINE_SVC_UUID2(zynqmp_sip_uuid,
-  */
- static int32_t sip_svc_setup(void)
- {
--	/* Configure IPI data for ZynqMP */
--	zynqmp_ipi_config_table_init();
--
- 	/* PM implementation as SiP Service */
- 	pm_setup();
- 
diff --git a/recipes-bsp/u-boot/u-boot-macchiatobin_2019.07-atf2.1.bb b/recipes-bsp/u-boot/u-boot-macchiatobin_2019.10-atf2.2.bb
similarity index 94%
rename from recipes-bsp/u-boot/u-boot-macchiatobin_2019.07-atf2.1.bb
rename to recipes-bsp/u-boot/u-boot-macchiatobin_2019.10-atf2.2.bb
index 81ac2d7..c80e07f 100644
--- a/recipes-bsp/u-boot/u-boot-macchiatobin_2019.07-atf2.1.bb
+++ b/recipes-bsp/u-boot/u-boot-macchiatobin_2019.10-atf2.2.bb
@@ -22,7 +22,7 @@ SRC_URI += " \
     file://0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch;patchdir=${WORKDIR}/mv-ddr-marvell \
     file://macchiatobin-rules \
     "
-SRC_URI[u-boot.sha256sum] = "bff4fa77e8da17521c030ca4c5b947a056c1b1be4d3e6ee8637020b8d50251d0"
+SRC_URI[u-boot.sha256sum] = "8d6d6070739522dd236cba7055b8736bfe92b4fac0ea18ad809829ca79667014"
 
 BUILD_DEPENDS =. "libssl-dev:native, "
 
diff --git a/recipes-bsp/u-boot/u-boot-ultra96_2019.07-atf2.1.bb b/recipes-bsp/u-boot/u-boot-ultra96_2019.10-atf2.2.bb
similarity index 91%
rename from recipes-bsp/u-boot/u-boot-ultra96_2019.07-atf2.1.bb
rename to recipes-bsp/u-boot/u-boot-ultra96_2019.10-atf2.2.bb
index 8e80388..b87d7ce 100644
--- a/recipes-bsp/u-boot/u-boot-ultra96_2019.07-atf2.1.bb
+++ b/recipes-bsp/u-boot/u-boot-ultra96_2019.10-atf2.2.bb
@@ -23,7 +23,7 @@ SRC_URI += " \
     file://ultra96.bif.tmpl \
     file://ultra96-rules \
     "
-SRC_URI[u-boot.sha256sum] = "bff4fa77e8da17521c030ca4c5b947a056c1b1be4d3e6ee8637020b8d50251d0"
+SRC_URI[u-boot.sha256sum] = "8d6d6070739522dd236cba7055b8736bfe92b4fac0ea18ad809829ca79667014"
 
 TEMPLATE_FILES += "ultra96.bif.tmpl"
 TEMPLATE_VARS += "ATF_PV"
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/94238caff510daf171b442f1fda43bce4db9db36.1579170887.git.jan.kiszka%40siemens.com.
