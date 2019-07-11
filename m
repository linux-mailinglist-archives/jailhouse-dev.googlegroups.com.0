Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJHGTPUQKGQET3LSSLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id DF93465326
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 10:28:20 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id m25sf396463lfh.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 01:28:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562833700; cv=pass;
        d=google.com; s=arc-20160816;
        b=KX/TqieqzJQe9ukFKwrVo0kbeaC018vTtyBYW8jEfArlddwIXb/ypPrhXmtplB6YnC
         BBHkOcDvYx8qjS2akqsV6MTgdWzQQUbLpetjez3zghXqo50b032lgoY5rjJA4jvDOBCA
         /+p9nZ/A3nH0xfxOVsJYYUmITD94BqannW+4g2EFpwBv7QP3cSnCF2FrBQm1WaLjpcuJ
         XcH/zFE53FiLWWNxhen8UbJJlOkpQnH9sjeD5wH9m7k75b9c+vPF8XHR9ZtRn1G/CaKo
         9i4wXOxg8CEJVexAV1MEhBRLf3A8K8TVR6r0eXBEXt+1rd7G4YllI0M383cFLw7LgH5W
         cnIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=1xsyh5PyMTklmQioCVyRLrrM8T8S+qsqsU+O9zdoT8M=;
        b=1GQu0GpactRgY8epg8D5khKeoa3EwpSAYa6ioQvZUBzS5Hr/UdKdDIYpGvFi1vOiFb
         wjZ+LxlEeQvg31abtvjbz2KybQFn/r3W/5qAm2eG+OGKjha7n2AtVtfFC5DyPPfCmBz1
         uQjl+JM3lRaMetzIq1Jy8D8E0+w0OaWLOAwWqUYHZZ82jrqUIahpJM5Fird8Lulm30Uo
         U9jMoZTBOnbyBXh/A3YaHHAi3wIrxiGGbU/WgaUZlQgobKiCdXWtBlv1hqURDolcna49
         mUiphZbrQpJfRR5MlZNtULMzZHOUHcm0Li2dBK7UjrKU0p0rhAbtFVjG8gJcYHc+372a
         c+7g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1xsyh5PyMTklmQioCVyRLrrM8T8S+qsqsU+O9zdoT8M=;
        b=Qmn+4U4OpPhmB2EpEtvI7QBJcOxEv5whAzbsS1yPlqHFGL/mXdBuZmjVplzFwE+4iU
         57aTAwmVRonloWxsQf9OzOvOBYz0C/aIB+kf3YtKqayvZySPuhHCiaV6gHdAqRfD8BEv
         DmnnERu/xpNlcFHMASKN7/Opz11xxQ58RTKOz302JFxDgepzWa13wZT9H1ieI7Kf4Np1
         GpRm47ru6bz/efC3wqU72ShyC5+4lnVSCbSkNxdFhE5eVXPQcyHW7GWUPACm3Gz8e126
         gfTd4kL/7/DhuwfwI7kiaJk4A4M/XFmy6NfPn73GJ3ZWgJwutAPWGDhhCeyKvBAYc/6D
         1COA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1xsyh5PyMTklmQioCVyRLrrM8T8S+qsqsU+O9zdoT8M=;
        b=Pr+lX5q8otRGad4XAFcd45B9tyj2ac7bGB5XRoT2Zw9kk+/clC8ImzaWtu1rQGDWsL
         BFV4izBtdbvaaQd71YUl5Yf/PLa/owhAJUnGoCDtFmnzceI5nUlEPyHkdLDsC4o8xpcY
         gvF9X2VQFlemTWMcCjYFB8pgWfZPmoDd36pS2QQepzlOJ0huKpQoeZ66y3SPZfQbqyaY
         aOaA0haIZbcvE5BuZeEc3KR9zWfV6tV/uyDG0JrpxuhQZJbhq3bA2HYTGaCMoVDqpwKb
         JBd3O8Uxn4ByVqQ7UygHmVlZDTXQrPPcFKcZFfFroDgwini2LkMyithn9ETiqjuX8KSk
         YR9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXF5R8+Zy8PwBnUoz28hImwYYxgvjVwVUtZosj4o2ANc9Rk3E1M
	cHCn+RgEy7vcPA8LXSptPQw=
X-Google-Smtp-Source: APXvYqwBn+pam7coHC4i3HoY5m5ZWjPZL8nO+2VIUhgI1LwzuKqKR++ccbf+9TOc+AVbpkjOLIuPiw==
X-Received: by 2002:a2e:480a:: with SMTP id v10mr1622858lja.94.1562833700478;
        Thu, 11 Jul 2019 01:28:20 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9153:: with SMTP id q19ls622530ljg.13.gmail; Thu, 11 Jul
 2019 01:28:19 -0700 (PDT)
X-Received: by 2002:a2e:864d:: with SMTP id i13mr1653512ljj.92.1562833699656;
        Thu, 11 Jul 2019 01:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562833699; cv=none;
        d=google.com; s=arc-20160816;
        b=VbGsSbB2jaSBlwsJXumQyPzTxmY2A5KjCV9PBR+Ys0L26HmRW/qf+GeF3U/sikwuLZ
         +HycZSedLTib7hCSlP27N8eyMrP/CsLpR4VFzu2Gveh91e2gcstxDkl24Cd1YQAXhOdp
         6Q2Ghrf9yQwRLTLdLovD/cUJ0DfKUPEHsN1a177i+2bX6isptH8KJnT12bwFDEfVZ/73
         IIOFlvrg3PlhMn8dMJDL9/wARjK9YoB2n93rP8Rn/K/poK/giEMk0lbTO3oanyZ/GwaK
         Lbznc+FfVgnPxLT4LfV5cN2R5fsDEpZrtPSdfuW9xozc1Tv48MVPwSsg/4kTtfrAI3Zy
         mlSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=CGc4at8jrC0R1sCD3Y48OMJaVkyJc2vKVMBi+nicfEw=;
        b=EocycF+DrJT0NJBGd/aJ0R/FIms+fXMyPWUo29f/EbEpewUaU+NiXGKk53ss2MhRX/
         vc4WfEPbVGrmIFDY+AeJ+ZkDrnK3iDQG1L188bDbcO5R8/0N6xtPbISy/zEwKPS7y7UL
         FduzD75l+MJ5+4XsQO9GjBRK8QEgJrYa5nWAEpisW7sQmIr97p++ptp9DrP1mtJ382uw
         dLof83sOxkOWh5MfrqT+yNgmo+iuU1Si59ZWWX5MimkPGq9lqIC98gUueUcDpheGYcoG
         ycn7AWA4dorBCJGEHOSl4wxaJ525h3ZmUp3gZOC1RuC+oyCkINkJ31By1j2NQv8AZHGA
         pKCw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id v29si297941lfq.2.2019.07.11.01.28.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 01:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6B8SIfJ022007
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:18 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.22.161])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6B8SG7S010515
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:18 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 6/8] jailhouse: Update to 0.11
Date: Thu, 11 Jul 2019 10:28:14 +0200
Message-Id: <70bed1a5c38baf98d8386b73d208e336c578100c.1562833696.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1562833696.git.jan.kiszka@siemens.com>
References: <cover.1562833696.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1562833696.git.jan.kiszka@siemens.com>
References: <cover.1562833696.git.jan.kiszka@siemens.com>
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/distro/jailhouse-demo.conf                    |   2 +-
 .../files/0001-configs-Add-Ultra96-board.patch     | 402 -----------------
 ...onfigs-Add-support-for-MACCHIATObin-board.patch | 489 ---------------------
 ...-orangepi0-Permit-access-to-another-clock.patch |  51 ---
 recipes-jailhouse/jailhouse/jailhouse_0.10.bb      |  18 -
 recipes-jailhouse/jailhouse/jailhouse_0.11.bb      |  14 +
 6 files changed, 15 insertions(+), 961 deletions(-)
 delete mode 100644 recipes-jailhouse/jailhouse/files/0001-configs-Add-Ultra96-board.patch
 delete mode 100644 recipes-jailhouse/jailhouse/files/0001-configs-Add-support-for-MACCHIATObin-board.patch
 delete mode 100644 recipes-jailhouse/jailhouse/files/0001-configs-orangepi0-Permit-access-to-another-clock.patch
 delete mode 100644 recipes-jailhouse/jailhouse/jailhouse_0.10.bb
 create mode 100644 recipes-jailhouse/jailhouse/jailhouse_0.11.bb

diff --git a/conf/distro/jailhouse-demo.conf b/conf/distro/jailhouse-demo.conf
index 6479317..fe40ca6 100644
--- a/conf/distro/jailhouse-demo.conf
+++ b/conf/distro/jailhouse-demo.conf
@@ -17,7 +17,7 @@ KERNEL_NAME ?= "jailhouse"
 
 WKS_FILE = "${MACHINE}.wks"
 
-PREFERRED_VERSION_jailhouse-${KERNEL_NAME} ?= "0.10"
+PREFERRED_VERSION_jailhouse-${KERNEL_NAME} ?= "0.11"
 
 USERS += "root"
 # 'root'
diff --git a/recipes-jailhouse/jailhouse/files/0001-configs-Add-Ultra96-board.patch b/recipes-jailhouse/jailhouse/files/0001-configs-Add-Ultra96-board.patch
deleted file mode 100644
index bd91e83..0000000
--- a/recipes-jailhouse/jailhouse/files/0001-configs-Add-Ultra96-board.patch
+++ /dev/null
@@ -1,402 +0,0 @@
-From e3cf65e67a605ead840f6d21d07627172185d13d Mon Sep 17 00:00:00 2001
-From: Jan Kiszka <jan.kiszka@siemens.com>
-Date: Sun, 6 Jan 2019 22:05:59 +0100
-Subject: [PATCH] configs: Add Ultra96 board
-
-This is very similar to the ZCU102 eval board, but still different.
-However, we can share at least the inmate device tree.
-
-Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
----
- Documentation/setup-on-zynqmp-zcu102.md            |   6 +-
- ...{inmate-zynqmp-zcu102.dts => inmate-zynqmp.dts} |   9 +-
- configs/arm64/ultra96-gic-demo.c                   |  72 +++++++++++++
- configs/arm64/ultra96-linux-demo.c                 | 116 ++++++++++++++++++++
- configs/arm64/ultra96.c                            | 117 +++++++++++++++++++++
- 5 files changed, 313 insertions(+), 7 deletions(-)
- rename configs/arm64/dts/{inmate-zynqmp-zcu102.dts => inmate-zynqmp.dts} (89%)
- create mode 100644 configs/arm64/ultra96-gic-demo.c
- create mode 100644 configs/arm64/ultra96-linux-demo.c
- create mode 100644 configs/arm64/ultra96.c
-
-diff --git a/Documentation/setup-on-zynqmp-zcu102.md b/Documentation/setup-on-zynqmp-zcu102.md
-index 58de6227..535933ff 100644
---- a/Documentation/setup-on-zynqmp-zcu102.md
-+++ b/Documentation/setup-on-zynqmp-zcu102.md
-@@ -138,8 +138,8 @@ is essential to do a new Linux image but with
- 
- The files `image/linux/Image` and `image/linux/rootfs.cpio` have to be copied 
- from the Petalinux project to the rootfs. Besides,
--`configs/arm64/dts/inmate-zynqmp-zcu102.dtb` file has to be copied from
--Jailhouse project. 
-+`configs/arm64/dts/inmate-zynqmp.dtb` file has to be copied from Jailhouse
-+project.
- 
- To load Linux in the guest cell:
- 
-@@ -163,7 +163,7 @@ To load Linux in the guest cell:
-     Activating hypervisor
-     [   39.844953] The Jailhouse is opening.
- 
--    # jailhouse cell linux zynqmp-zcu102-linux-demo.cell Image -d inmate-zynqmp-zcu102.dtb -i rootfs.cpio -c "console=ttyPS0,115200"
-+    # jailhouse cell linux zynqmp-zcu102-linux-demo.cell Image -d inmate-zynqmp.dtb -i rootfs.cpio -c "console=ttyPS0,115200"
-     [   81.967652] CPU2: shutdown
-     [   81.970285] psci: CPU2 killed.
-     [   82.015619] CPU3: shutdown
-diff --git a/configs/arm64/dts/inmate-zynqmp-zcu102.dts b/configs/arm64/dts/inmate-zynqmp.dts
-similarity index 89%
-rename from configs/arm64/dts/inmate-zynqmp-zcu102.dts
-rename to configs/arm64/dts/inmate-zynqmp.dts
-index 0e6dc122..e608f0ad 100644
---- a/configs/arm64/dts/inmate-zynqmp-zcu102.dts
-+++ b/configs/arm64/dts/inmate-zynqmp.dts
-@@ -1,10 +1,11 @@
- /*
-  * Jailhouse, a Linux-based partitioning hypervisor
-  *
-- * Device tree for Linux inmate test on ZynqMP ZCU102 board,
-- * corresponds to configs/arm64/zynqmp-zcu102-linux-demo.c
-+ * Device tree for Linux inmate test on ZynqMP ZCU102 and Ultra96 boards,
-+ * corresponds to configs/arm64/zynqmp-zcu102-linux-demo.c and
-+ * configs/arm64/ultra96-linux-demo.c.
-  *
-- * Copyright (c) Siemens AG, 2016
-+ * Copyright (c) Siemens AG, 2016-2019
-  *
-  * Authors:
-  *  Jan Kiszka <jan.kiszka@siemens.com>
-@@ -18,7 +19,7 @@
- /dts-v1/;
- 
- / {
--	model = "Jailhouse cell on ZynqMP ZCU102";
-+	model = "Jailhouse cell on ZynqMP";
- 
- 	#address-cells = <2>;
- 	#size-cells = <2>;
-diff --git a/configs/arm64/ultra96-gic-demo.c b/configs/arm64/ultra96-gic-demo.c
-new file mode 100644
-index 00000000..12556335
---- /dev/null
-+++ b/configs/arm64/ultra96-gic-demo.c
-@@ -0,0 +1,72 @@
-+/*
-+ * Jailhouse, a Linux-based partitioning hypervisor
-+ *
-+ * Configuration for gic-demo inmate on Avnet Ultra96 board:
-+ * 1 CPU, 64K RAM, 1 serial port
-+ *
-+ * Copyright (c) Siemens AG, 2016-2019
-+ *
-+ * Authors:
-+ *  Jan Kiszka <jan.kiszka@siemens.com>
-+ *
-+ * This work is licensed under the terms of the GNU GPL, version 2.  See
-+ * the COPYING file in the top-level directory.
-+ */
-+
-+#include <jailhouse/types.h>
-+#include <jailhouse/cell-config.h>
-+
-+#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-+
-+struct {
-+	struct jailhouse_cell_desc cell;
-+	__u64 cpus[1];
-+	struct jailhouse_memory mem_regions[3];
-+} __attribute__((packed)) config = {
-+	.cell = {
-+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
-+		.revision = JAILHOUSE_CONFIG_REVISION,
-+		.name = "gic-demo",
-+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
-+
-+		.cpu_set_size = sizeof(config.cpus),
-+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-+		.num_irqchips = 0,
-+		.pio_bitmap_size = 0,
-+		.num_pci_devices = 0,
-+
-+		.console = {
-+			.address = 0xff010000,
-+			.type = JAILHOUSE_CON_TYPE_XUARTPS,
-+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
-+				 JAILHOUSE_CON_REGDIST_4,
-+		},
-+	},
-+
-+	.cpus = {
-+		0x8,
-+	},
-+
-+	.mem_regions = {
-+		/* UART */ {
-+			.phys_start = 0xff010000,
-+			.virt_start = 0xff010000,
-+			.size = 0x1000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
-+		},
-+		/* RAM */ {
-+			.phys_start = 0x7bfe0000,
-+			.virt_start = 0,
-+			.size = 0x00010000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
-+		},
-+		/* communication region */ {
-+			.virt_start = 0x80000000,
-+			.size = 0x00001000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_COMM_REGION,
-+		},
-+	}
-+};
-diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
-new file mode 100644
-index 00000000..e6b33466
---- /dev/null
-+++ b/configs/arm64/ultra96-linux-demo.c
-@@ -0,0 +1,116 @@
-+/*
-+ * Jailhouse, a Linux-based partitioning hypervisor
-+ *
-+ * Configuration for linux-demo inmate on Avnet Ultra96 board:
-+ * 2 CPUs, 128M RAM, serial port 2
-+ *
-+ * Copyright (c) Siemens AG, 2014-2019
-+ *
-+ * Authors:
-+ *  Jan Kiszka <jan.kiszka@siemens.com>
-+ *
-+ * This work is licensed under the terms of the GNU GPL, version 2.  See
-+ * the COPYING file in the top-level directory.
-+ */
-+
-+#include <jailhouse/types.h>
-+#include <jailhouse/cell-config.h>
-+
-+#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-+
-+struct {
-+	struct jailhouse_cell_desc cell;
-+	__u64 cpus[1];
-+	struct jailhouse_memory mem_regions[5];
-+	struct jailhouse_irqchip irqchips[1];
-+	struct jailhouse_pci_device pci_devices[1];
-+} __attribute__((packed)) config = {
-+	.cell = {
-+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
-+		.revision = JAILHOUSE_CONFIG_REVISION,
-+		.name = "Ultra96-linux-demo",
-+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
-+
-+		.cpu_set_size = sizeof(config.cpus),
-+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-+		.num_irqchips = ARRAY_SIZE(config.irqchips),
-+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-+
-+		.vpci_irq_base = 140-32,
-+
-+		.console = {
-+			.address = 0xff010000,
-+			.type= JAILHOUSE_CON_TYPE_XUARTPS,
-+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
-+				 JAILHOUSE_CON_REGDIST_4,
-+		},
-+	},
-+
-+	.cpus = {
-+		0xc,
-+	},
-+
-+	.mem_regions = {
-+		/* UART */ {
-+			.phys_start = 0xff010000,
-+			.virt_start = 0xff010000,
-+			.size = 0x1000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
-+		},
-+		/* RAM */ {
-+			.phys_start = 0x7bef0000,
-+			.virt_start = 0,
-+			.size = 0x10000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
-+		},
-+		/* RAM */ {
-+			.phys_start = 0x74000000,
-+			.virt_start = 0x74000000,
-+			.size = 0x7ef0000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
-+				JAILHOUSE_MEM_LOADABLE,
-+		},
-+		/* IVSHMEM shared memory region */ {
-+			.phys_start = 0x7bf00000,
-+			.virt_start = 0x7bf00000,
-+			.size = 0x100000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_ROOTSHARED,
-+		},
-+		/* communication region */ {
-+			.virt_start = 0x80000000,
-+			.size = 0x00001000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_COMM_REGION,
-+		},
-+	},
-+
-+	.irqchips = {
-+		/* GIC */ {
-+			.address = 0xf9010000,
-+			.pin_base = 32,
-+			.pin_bitmap = {
-+				1 << (54 - 32),
-+				0,
-+				0,
-+				(1 << (140 - 128)) | (1 << (142 - 128))
-+			},
-+		},
-+	},
-+
-+	.pci_devices = {
-+		/* 00:00.0 */ {
-+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-+			.bdf = 0 << 3,
-+			.bar_mask = {
-+				0xffffff00, 0xffffffff, 0x00000000,
-+				0x00000000, 0x00000000, 0x00000000,
-+			},
-+			.shmem_region = 3,
-+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
-+		},
-+	},
-+};
-diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
-new file mode 100644
-index 00000000..1fc54356
---- /dev/null
-+++ b/configs/arm64/ultra96.c
-@@ -0,0 +1,117 @@
-+/*
-+ * Jailhouse, a Linux-based partitioning hypervisor
-+ *
-+ * Configuration for Avnet Ultra96 board
-+ *
-+ * Copyright (c) Siemens AG, 2016-2019
-+ *
-+ * Authors:
-+ *  Jan Kiszka <jan.kiszka@siemens.com>
-+ *
-+ * This work is licensed under the terms of the GNU GPL, version 2.  See
-+ * the COPYING file in the top-level directory.
-+ */
-+
-+#include <jailhouse/types.h>
-+#include <jailhouse/cell-config.h>
-+
-+#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
-+
-+struct {
-+	struct jailhouse_system header;
-+	__u64 cpus[1];
-+	struct jailhouse_memory mem_regions[3];
-+	struct jailhouse_irqchip irqchips[1];
-+	struct jailhouse_pci_device pci_devices[1];
-+} __attribute__((packed)) config = {
-+	.header = {
-+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
-+		.revision = JAILHOUSE_CONFIG_REVISION,
-+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
-+		.hypervisor_memory = {
-+			.phys_start = 0x7c000000,
-+			.size =       0x00400000,
-+		},
-+		.debug_console = {
-+			.address = 0xff010000,
-+			.size = 0x1000,
-+			.type = JAILHOUSE_CON_TYPE_XUARTPS,
-+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
-+				 JAILHOUSE_CON_REGDIST_4,
-+		},
-+		.platform_info = {
-+			.pci_mmconfig_base = 0xfc000000,
-+			.pci_mmconfig_end_bus = 0,
-+			.pci_is_virtual = 1,
-+			.arm = {
-+				.gic_version = 2,
-+				.gicd_base = 0xf9010000,
-+				.gicc_base = 0xf902f000,
-+				.gich_base = 0xf9040000,
-+				.gicv_base = 0xf906f000,
-+				.maintenance_irq = 25,
-+			},
-+		},
-+		.root_cell = {
-+			.name = "Ultra96",
-+
-+			.cpu_set_size = sizeof(config.cpus),
-+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-+			.num_irqchips = ARRAY_SIZE(config.irqchips),
-+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-+
-+			.vpci_irq_base = 136-32,
-+		},
-+	},
-+
-+	.cpus = {
-+		0xf,
-+	},
-+
-+	.mem_regions = {
-+		/* MMIO (permissive) */ {
-+			.phys_start = 0xfd000000,
-+			.virt_start = 0xfd000000,
-+			.size =	      0x03000000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_IO,
-+		},
-+		/* RAM */ {
-+			.phys_start = 0x0,
-+			.virt_start = 0x0,
-+			.size = 0x7c000000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_EXECUTE,
-+		},
-+		/* IVSHMEM shared memory region for 00:00.0 */ {
-+			.phys_start = 0x7bf00000,
-+			.virt_start = 0x7bf00000,
-+			.size = 0x100000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-+		},
-+	},
-+
-+	.irqchips = {
-+		/* GIC */ {
-+			.address = 0xf9010000,
-+			.pin_base = 32,
-+			.pin_bitmap = {
-+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
-+			},
-+		},
-+	},
-+
-+	.pci_devices = {
-+		/* 0001:00:00.0 */ {
-+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-+			.domain = 1,
-+			.bdf = 0 << 3,
-+			.bar_mask = {
-+				0xffffff00, 0xffffffff, 0x00000000,
-+				0x00000000, 0x00000000, 0x00000000,
-+			},
-+			.shmem_region = 2,
-+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
-+		},
-+	},
-+};
--- 
-2.16.4
-
diff --git a/recipes-jailhouse/jailhouse/files/0001-configs-Add-support-for-MACCHIATObin-board.patch b/recipes-jailhouse/jailhouse/files/0001-configs-Add-support-for-MACCHIATObin-board.patch
deleted file mode 100644
index e57938d..0000000
--- a/recipes-jailhouse/jailhouse/files/0001-configs-Add-support-for-MACCHIATObin-board.patch
+++ /dev/null
@@ -1,489 +0,0 @@
-From 06e3ecb5eefc4b199e0a60cb246fedea330caa21 Mon Sep 17 00:00:00 2001
-From: Jan Kiszka <jan.kiszka@siemens.com>
-Date: Sun, 30 Sep 2018 10:13:14 +0200
-Subject: [PATCH] configs: Add support for MACCHIATObin board
-
-Add configs for the Marvell Armada 8040-based MACCHIATObin board.
-
-As we set the pci_domain to 1 and the upstream kernel does not
-initialize linux,pci-domain, we need a patch to the DTB for the time
-being.
-
-MSI support should eventually be possible as well, but we still with
-INTx for the virtual shmem devices for now.
-
-Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
----
- configs/arm64/dts/inmate-macchiatobin.dts | 106 +++++++++++++++++++++++
- configs/arm64/macchiatobin-gic-demo.c     |  72 ++++++++++++++++
- configs/arm64/macchiatobin-linux-demo.c   | 124 +++++++++++++++++++++++++++
- configs/arm64/macchiatobin.c              | 134 ++++++++++++++++++++++++++++++
- 4 files changed, 436 insertions(+)
- create mode 100644 configs/arm64/dts/inmate-macchiatobin.dts
- create mode 100644 configs/arm64/macchiatobin-gic-demo.c
- create mode 100644 configs/arm64/macchiatobin-linux-demo.c
- create mode 100644 configs/arm64/macchiatobin.c
-
-diff --git a/configs/arm64/dts/inmate-macchiatobin.dts b/configs/arm64/dts/inmate-macchiatobin.dts
-new file mode 100644
-index 00000000..51f07da1
---- /dev/null
-+++ b/configs/arm64/dts/inmate-macchiatobin.dts
-@@ -0,0 +1,106 @@
-+/*
-+ * Jailhouse, a Linux-based partitioning hypervisor
-+ *
-+ * Device tree for Linux inmate test on MACCHIATObin,
-+ * corresponds to configs/arm64/macchiatobin-linux-demo.c
-+ *
-+ * Copyright (c) Siemens AG, 2016-2018
-+ *
-+ * Authors:
-+ *  Jan Kiszka <jan.kiszka@siemens.com>
-+ *
-+ * This work is licensed under the terms of the GNU GPL, version 2.  See
-+ * the COPYING file in the top-level directory.
-+ */
-+
-+#include <dt-bindings/interrupt-controller/arm-gic.h>
-+
-+/dts-v1/;
-+
-+/ {
-+	model = "Jailhouse cell on MACCHIATObin";
-+
-+	#address-cells = <2>;
-+	#size-cells = <2>;
-+
-+	interrupt-parent = <&gic>;
-+
-+	hypervisor {
-+		compatible = "jailhouse,cell";
-+	};
-+
-+	cpus {
-+		#address-cells = <1>;
-+		#size-cells = <0>;
-+
-+		cpu@100 {
-+			compatible = "arm,cortex-a72", "arm,armv8";
-+			device_type = "cpu";
-+			reg = <0x100>;
-+			enable-method = "psci";
-+		};
-+		cpu@101 {
-+			compatible = "arm,cortex-a72", "arm,armv8";
-+			device_type = "cpu";
-+			reg = <0x101>;
-+			enable-method = "psci";
-+		};
-+	};
-+
-+	psci {
-+		compatible = "arm,psci-0.2";
-+		method = "smc";
-+	};
-+
-+	timer {
-+		compatible = "arm,armv8-timer";
-+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
-+	};
-+
-+	gic: interrupt-controller@f0210000 {
-+		compatible = "arm,gic-400";
-+		#interrupt-cells = <3>;
-+		interrupt-controller;
-+		reg = <0x0 0xf0210000 0x0 0x10000>, /* GICD */
-+		      <0x0 0xf022f000 0x0 0x20000>; /* GICC */
-+	};
-+
-+	ap_syscon: system-controller@f06f4000 {
-+		compatible = "syscon", "simple-mfd";
-+		reg = <0 0xf06f4000 0 0x2000>;
-+
-+		ap_clk: clock {
-+			compatible = "marvell,ap806-clock";
-+			#clock-cells = <1>;
-+		};
-+	};
-+
-+	uart0: serial@f0512000 {
-+		compatible = "snps,dw-apb-uart";
-+		reg = <0 0xf0512000 0 0x100>;
-+		reg-shift = <2>;
-+		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
-+		reg-io-width = <1>;
-+		clocks = <&ap_clk 3>;
-+	};
-+
-+	pci@fc000000 {
-+		compatible = "pci-host-ecam-generic";
-+		device_type = "pci";
-+		bus-range = <0 0>;
-+		#address-cells = <3>;
-+		#size-cells = <2>;
-+		#interrupt-cells = <1>;
-+		interrupt-map-mask = <0 0 0 7>;
-+		interrupt-map = <0 0 0 1 &gic GIC_SPI 80 IRQ_TYPE_EDGE_RISING>,
-+				<0 0 0 2 &gic GIC_SPI 81 IRQ_TYPE_EDGE_RISING>,
-+				<0 0 0 3 &gic GIC_SPI 82 IRQ_TYPE_EDGE_RISING>,
-+				<0 0 0 4 &gic GIC_SPI 83 IRQ_TYPE_EDGE_RISING>;
-+		reg = <0x0 0xfc000000 0x0 0x100000>;
-+		ranges =
-+			<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
-+	};
-+};
-diff --git a/configs/arm64/macchiatobin-gic-demo.c b/configs/arm64/macchiatobin-gic-demo.c
-new file mode 100644
-index 00000000..713319d2
---- /dev/null
-+++ b/configs/arm64/macchiatobin-gic-demo.c
-@@ -0,0 +1,72 @@
-+/*
-+ * Jailhouse, a Linux-based partitioning hypervisor
-+ *
-+ * Configuration for gic-demo inmate on Marvell MACCHIATObin board:
-+ * 1 CPU, 64K RAM, 1 serial port
-+ *
-+ * Copyright (c) Siemens AG, 2017-2018
-+ *
-+ * Authors:
-+ *  Jan Kiszka <jan.kiszka@siemens.com>
-+ *
-+ * This work is licensed under the terms of the GNU GPL, version 2.  See
-+ * the COPYING file in the top-level directory.
-+ */
-+
-+#include <jailhouse/types.h>
-+#include <jailhouse/cell-config.h>
-+
-+#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-+
-+struct {
-+	struct jailhouse_cell_desc cell;
-+	__u64 cpus[1];
-+	struct jailhouse_memory mem_regions[3];
-+} __attribute__((packed)) config = {
-+	.cell = {
-+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
-+		.revision = JAILHOUSE_CONFIG_REVISION,
-+		.name = "gic-demo",
-+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
-+
-+		.cpu_set_size = sizeof(config.cpus),
-+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-+		.num_irqchips = 0,
-+		.pio_bitmap_size = 0,
-+		.num_pci_devices = 0,
-+
-+		.console = {
-+			.address = 0xf0512000,
-+			.type = JAILHOUSE_CON_TYPE_8250,
-+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
-+				 JAILHOUSE_CON_REGDIST_4,
-+		},
-+	},
-+
-+	.cpus = {
-+		0x2,
-+	},
-+
-+	.mem_regions = {
-+		/* UART */ {
-+			.phys_start = 0xf0512000,
-+			.virt_start = 0xf0512000,
-+			.size = 0x1000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
-+		},
-+		/* RAM */ {
-+			.phys_start = 0x13faf0000,
-+			.virt_start = 0,
-+			.size = 0x00010000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
-+		},
-+		/* communication region */ {
-+			.virt_start = 0x80000000,
-+			.size = 0x00001000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_COMM_REGION,
-+		},
-+	}
-+};
-diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
-new file mode 100644
-index 00000000..63fbbba7
---- /dev/null
-+++ b/configs/arm64/macchiatobin-linux-demo.c
-@@ -0,0 +1,124 @@
-+/*
-+ * Jailhouse, a Linux-based partitioning hypervisor
-+ *
-+ * Configuration for linux-demo inmate on MACCHIATObin:
-+ * 2 CPUs, 128M RAM, serial port
-+ *
-+ * Copyright (c) Siemens AG, 2014-2018
-+ *
-+ * Authors:
-+ *  Jan Kiszka <jan.kiszka@siemens.com>
-+ *
-+ * This work is licensed under the terms of the GNU GPL, version 2.  See
-+ * the COPYING file in the top-level directory.
-+ */
-+
-+#include <jailhouse/types.h>
-+#include <jailhouse/cell-config.h>
-+
-+#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-+
-+struct {
-+	struct jailhouse_cell_desc cell;
-+	__u64 cpus[1];
-+	struct jailhouse_memory mem_regions[6];
-+	struct jailhouse_irqchip irqchips[1];
-+	struct jailhouse_pci_device pci_devices[1];
-+} __attribute__((packed)) config = {
-+	.cell = {
-+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
-+		.revision = JAILHOUSE_CONFIG_REVISION,
-+		.name = "MACCHIATObin-linux-demo",
-+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
-+			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
-+
-+		.cpu_set_size = sizeof(config.cpus),
-+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-+		.num_irqchips = ARRAY_SIZE(config.irqchips),
-+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-+
-+		.vpci_irq_base = 112-32,
-+
-+		.console = {
-+			.address = 0xf0512000,
-+			.type = JAILHOUSE_CON_TYPE_8250,
-+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
-+				 JAILHOUSE_CON_REGDIST_4,
-+		},
-+	},
-+
-+	.cpus = {
-+		0xc,
-+	},
-+
-+	.mem_regions = {
-+		/* UART */ {
-+			.phys_start = 0xf0512000,
-+			.virt_start = 0xf0512000,
-+			.size = 0x1000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
-+		},
-+		/* syscon (read-only) */ {
-+			.phys_start = 0xf06f4000,
-+			.virt_start = 0xf06f4000,
-+			.size = 0x1000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_IO |
-+				JAILHOUSE_MEM_ROOTSHARED,
-+		},
-+		/* RAM */ {
-+			.phys_start = 0x13fa00000,
-+			.virt_start = 0,
-+			.size = 0x10000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
-+		},
-+		/* RAM */ {
-+			.phys_start = 0x137000000,
-+			.virt_start = 0x137000000,
-+			.size = 0x8000000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
-+				JAILHOUSE_MEM_LOADABLE,
-+		},
-+		/* IVSHMEM shared memory region */ {
-+			.phys_start = 0x13fb00000,
-+			.virt_start = 0x13fb00000,
-+			.size = 0x100000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_ROOTSHARED,
-+		},
-+		/* communication region */ {
-+			.virt_start = 0x80000000,
-+			.size = 0x00001000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_COMM_REGION,
-+		},
-+	},
-+
-+	.irqchips = {
-+		/* GIC */ {
-+			.address = 0xf0210000,
-+			.pin_base = 32,
-+			.pin_bitmap = {
-+				(1 << (51 - 32)),
-+				0,
-+				(1 << (112 - 96)),
-+				0
-+			},
-+		},
-+	},
-+
-+	.pci_devices = {
-+		/* 00:00.0 */ {
-+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-+			.bdf = 0 << 3,
-+			.bar_mask = {
-+				0xffffff00, 0xffffffff, 0x00000000,
-+				0x00000000, 0x00000000, 0x00000000,
-+			},
-+			.shmem_region = 4,
-+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
-+		},
-+	},
-+};
-diff --git a/configs/arm64/macchiatobin.c b/configs/arm64/macchiatobin.c
-new file mode 100644
-index 00000000..c0df0572
---- /dev/null
-+++ b/configs/arm64/macchiatobin.c
-@@ -0,0 +1,134 @@
-+/*
-+ * Jailhouse, a Linux-based partitioning hypervisor
-+ *
-+ * Configuration for Marvell MACCHIATObin board
-+ *
-+ * Copyright (c) Siemens AG, 2017-2018
-+ *
-+ * Authors:
-+ *  Jan Kiszka <jan.kiszka@siemens.com>
-+ *
-+ * This work is licensed under the terms of the GNU GPL, version 2.  See
-+ * the COPYING file in the top-level directory.
-+ *
-+ * Reservation via device tree: 0x800000000..0x83fffffff
-+ */
-+
-+#include <jailhouse/types.h>
-+#include <jailhouse/cell-config.h>
-+
-+#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
-+
-+struct {
-+	struct jailhouse_system header;
-+	__u64 cpus[1];
-+	struct jailhouse_memory mem_regions[5];
-+	struct jailhouse_irqchip irqchips[1];
-+	struct jailhouse_pci_device pci_devices[1];
-+} __attribute__((packed)) config = {
-+	.header = {
-+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
-+		.revision = JAILHOUSE_CONFIG_REVISION,
-+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
-+		.hypervisor_memory = {
-+			.phys_start = 0x13fc00000,
-+			.size =       0x000400000,
-+		},
-+		.debug_console = {
-+			.address = 0xf0512000,
-+			.size = 0x1000,
-+			.type = JAILHOUSE_CON_TYPE_8250,
-+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
-+				JAILHOUSE_CON_REGDIST_4,
-+		},
-+		.platform_info = {
-+			.pci_mmconfig_base = 0xfc000000,
-+			.pci_mmconfig_end_bus = 0,
-+			.pci_is_virtual = 1,
-+			.pci_domain = 1,
-+			.arm = {
-+				.gic_version = 2,
-+				.gicd_base = 0xf0210000,
-+				.gicc_base = 0xf022f000,
-+				.gich_base = 0xf0240000,
-+				.gicv_base = 0xf026f000,
-+				.maintenance_irq = 25,
-+			},
-+		},
-+		.root_cell = {
-+			.name = "MACCHIATObin",
-+
-+			.cpu_set_size = sizeof(config.cpus),
-+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-+			.num_irqchips = ARRAY_SIZE(config.irqchips),
-+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-+
-+			.vpci_irq_base = 108-32,
-+		},
-+	},
-+
-+	.cpus = {
-+		0xf,
-+	},
-+
-+	.mem_regions = {
-+		/* MMIO (permissive) */ {
-+			.phys_start = 0xf0300000,
-+			.virt_start = 0xf0300000,
-+			.size =	       0x4300000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_IO,
-+		},
-+		/* MMIO (PCIe) */ {
-+			.phys_start = 0xf6000000,
-+			.virt_start = 0xf6000000,
-+			.size =	       0x1000000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_IO,
-+		},
-+		/* RAM */ {
-+			.phys_start = 0x0,
-+			.virt_start = 0x0,
-+			.size = 0xc0000000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_EXECUTE,
-+		},
-+		/* RAM */ {
-+			.phys_start = 0x100000000,
-+			.virt_start = 0x100000000,
-+			.size = 0x3fb00000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_EXECUTE,
-+		},
-+		/* IVSHMEM shared memory region for 00:00.0 */ {
-+			.phys_start = 0x13fb00000,
-+			.virt_start = 0x13fb00000,
-+			.size = 0x100000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-+		},
-+	},
-+
-+	.irqchips = {
-+		/* GIC */ {
-+			.address = 0xf0210000,
-+			.pin_base = 32,
-+			.pin_bitmap = {
-+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
-+			},
-+		},
-+	},
-+
-+	.pci_devices = {
-+		/* 0001:00:00.0 */ {
-+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-+			.domain = 1,
-+			.bdf = 0 << 3,
-+			.bar_mask = {
-+				0xffffff00, 0xffffffff, 0x00000000,
-+				0x00000000, 0x00000000, 0x00000000,
-+			},
-+			.shmem_region = 4,
-+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
-+		},
-+	},
-+};
--- 
-2.16.4
-
diff --git a/recipes-jailhouse/jailhouse/files/0001-configs-orangepi0-Permit-access-to-another-clock.patch b/recipes-jailhouse/jailhouse/files/0001-configs-orangepi0-Permit-access-to-another-clock.patch
deleted file mode 100644
index 842e30d..0000000
--- a/recipes-jailhouse/jailhouse/files/0001-configs-orangepi0-Permit-access-to-another-clock.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 2a33e404de0148d81e76e8926a5d2846ce0989c5 Mon Sep 17 00:00:00 2001
-From: Jan Kiszka <jan.kiszka@siemens.com>
-Date: Sat, 10 Nov 2018 15:10:12 +0100
-Subject: [PATCH] configs: orangepi0: Permit access to another clock
-
-This is required when using 4.19 as root kernel.
-
-Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
----
- configs/arm/orangepi0.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
-index 0284ae45..9eca773d 100644
---- a/configs/arm/orangepi0.c
-+++ b/configs/arm/orangepi0.c
-@@ -20,7 +20,7 @@
- struct {
- 	struct jailhouse_system header;
- 	__u64 cpus[1];
--	struct jailhouse_memory mem_regions[8];
-+	struct jailhouse_memory mem_regions[9];
- 	struct jailhouse_irqchip irqchips[1];
- 	struct jailhouse_pci_device pci_devices[1];
- } __attribute__((packed)) config = {
-@@ -76,6 +76,13 @@ struct {
- 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
- 				JAILHOUSE_MEM_IO,
- 		},
-+		/* clock (permissive) */ {
-+			.phys_start = 0x01c20000,
-+			.virt_start = 0x01c20000,
-+			.size =            0x800,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
-+		},
- 		/* pinctrl PA */ {
- 			.phys_start = 0x01c20800,
- 			.virt_start = 0x01c20800,
-@@ -144,7 +151,7 @@ struct {
- 				0xffffff00, 0xffffffff, 0x00000000,
- 				0x00000000, 0x00000000, 0x00000000,
- 			},
--			.shmem_region = 7,
-+			.shmem_region = 8,
- 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
- 		},
- 	},
--- 
-2.16.4
-
diff --git a/recipes-jailhouse/jailhouse/jailhouse_0.10.bb b/recipes-jailhouse/jailhouse/jailhouse_0.10.bb
deleted file mode 100644
index 42616db..0000000
--- a/recipes-jailhouse/jailhouse/jailhouse_0.10.bb
+++ /dev/null
@@ -1,18 +0,0 @@
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
-require jailhouse.inc
-
-SRC_URI += "file://0001-configs-Add-support-for-MACCHIATObin-board.patch"
-SRC_URI += "file://0001-configs-orangepi0-Permit-access-to-another-clock.patch"
-SRC_URI += "file://0001-configs-Add-Ultra96-board.patch"
-
-SRCREV = "f596aa7355bc2134650544bdf1e13f1f55d3f2fc"
diff --git a/recipes-jailhouse/jailhouse/jailhouse_0.11.bb b/recipes-jailhouse/jailhouse/jailhouse_0.11.bb
new file mode 100644
index 0000000..38a35ce
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/jailhouse_0.11.bb
@@ -0,0 +1,14 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2018-2019
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require jailhouse.inc
+
+SRCREV = "58052a7a9d1f5904d72b1637282c877172ee69f6"
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/70bed1a5c38baf98d8386b73d208e336c578100c.1562833696.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
