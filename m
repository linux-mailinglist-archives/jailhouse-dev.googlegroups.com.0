Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBANAT2CQMGQEG3W7GMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1526F38C53D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:48:34 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id k124-20020a1ca1820000b0290175dd5429afsf3681503wme.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:48:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621594113; cv=pass;
        d=google.com; s=arc-20160816;
        b=h0Q+hDE08bUJI144iebJ3hB01sWcmQEbudy5HZHSRVN1bpuEpZOku4YImeebCbHmJn
         /mwCsD9FB3HVI4MZmvYFq2YkzIewUnWMZ/UWqRJyMcUwyMPUXgmg52rZHtQW9WVWlxbI
         KyivYAbwWsnObTfKU1h3IbnyhEiKP8SZVSrQplTfANZpmoDMrbMqcC3pagQHFAG3kx28
         RPlHdJMsZH40JqT4mKletwsPm8Z3Us9bCTIMvUABatP6gNLgj3PbGNoKxU34+eYHWuAC
         hXPOSxSnAAkQJQZnkE7x3OkU0EN3V3RkUvi1PDqNoU691LPId3ittrqvpQBLbdoyY47z
         cNVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=1sqrswmFIoQMbVxMHgbWFclGUP4zpiBXTDtveEBNEgo=;
        b=f7f7AVMX7R11BNqdrtMuwUVgYePk+nzXug453PXoZ1R+m7wYkwi2zQcZyWNGyu6Nx2
         +/gdQhRUkNHSlH4FXCRNAbr5iwGYuwI4Xp0ppMwopdJCYqmfwS30RcWvHyk1y0p0QxX8
         6s7NJnFR5p9e+Bcctq2icI8bYSZhMm7r7YvinytVzOJbOQLn7QanX42DUAe0TG23b7QZ
         ia6OK8VOiF5Bf4nXytdi6Gzp71qoOg+pVRyt9MbGwaAWvaLiTB/5t1qiD5qj/1q2KwQ0
         S0y4bWMel1XCeDU/5cQ8ReJqC+oY1ZGmi0AhBW3IRoYZYVE5BjHW/u0s7co+WGtV5UsM
         gmQw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1sqrswmFIoQMbVxMHgbWFclGUP4zpiBXTDtveEBNEgo=;
        b=h4eK8Q6oyNBYCBpshpwZJ/jogWdY1VAW4oBKynJiXkpO7GrUEfjoAfw03XPW/0+UmQ
         JulZW+Xz4pMdCrm9QNx0j/AYFx4ZwIfSFjNul5zwzX8f0wwMy3fu5FcbCcSmCw1RJNZ8
         09V/g6gM+uiccNhuRjPbQifKqnHcKykE+fUJx/madGKAocCYDi3sBs2mQ2L53rkqZCMC
         xV5U/W8WlIiBBFp5MNgMCV4ae45NWA7v5u1d3i8CxJ+Cv498iuu+qZNaTO70hX/TMSSA
         9MlG4IYXiUxwzwvhr0fz7sGie9XbRThtFN0WG6LrBZ0jJuDGAXy7bY58FxtjjjkgT2Yj
         cFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1sqrswmFIoQMbVxMHgbWFclGUP4zpiBXTDtveEBNEgo=;
        b=J/Hij7PHZTZ6ZqAGUH0YVHB51iBrwr76pklQcOKfvGpP+4OMhWU7PqWZOGhUoXPFnS
         2CHQgfsdIXtG38FpQa1IScVDLYO3wm9NdyCWh/LYnoOiY7eT/bKcI30putUGtb/xFetR
         Gir+tYRmhv7LJg5TgAjToHqOX7hj/aDx+USQ1U+qYh+d8Lt4mPTLeQVue4P5WS9HuiFQ
         n4291W6F6mVoMWjKBAsVbnXwgIqW61Qhs0gK2h8VnWMjevTAoxvPt86VPMcwcrsxNkun
         iHuuADhrgZt9qIXw8CWaJwyS4cXnpupAVD4Y0wnnXHDuYNaxURBsAaCLvgbXX4k1t3bM
         c+kA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Rmavx4X/RY1fcF4u3SX+AhfwkKRo4BPcKQoJng1S6ip6AqTHP
	ICkxD12MaZ4pTlVe4fbgd/E=
X-Google-Smtp-Source: ABdhPJx3uafAj5QS5db0KmaWaYKKeEGgvDKm2LE5WdVx3umY/9ekuQJ9Xk62HWDbfITrEQEClD23JA==
X-Received: by 2002:a05:600c:3796:: with SMTP id o22mr8401523wmr.139.1621594113870;
        Fri, 21 May 2021 03:48:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4f52:: with SMTP id m18ls2181038wmq.0.canary-gmail;
 Fri, 21 May 2021 03:48:32 -0700 (PDT)
X-Received: by 2002:a7b:c849:: with SMTP id c9mr8579405wml.84.1621594112885;
        Fri, 21 May 2021 03:48:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621594112; cv=none;
        d=google.com; s=arc-20160816;
        b=f6jzWQs9yzVBnBqazd3RIgS0WrIILavo4CDghG4CUmeBrD80qd8EGl81vz1G2jOOjy
         bRPEHm//j+Wq4NsKjXjUnb9I0h8gwN3EsyUXfZaA1Zuil/SN5qdS6L7fvbb26nli4SEF
         JVmspJfzOxVyLqrLBpGDL+RYPXlacyTuepqN7sN2zYQzvVa1o1QsTjxiDY0kuaDCFJAz
         aKrXxWGt3Q3PtlPbIqqbrZRGYHBkebG2o7b0Mg5BUH1IP3uzGCZsxZy3EBnjjO9w7dU6
         u51oNkdz87NhsHG7JN5rA8UEwrmZLK/y4Al+9kFSXiOdQhTcfODcmbO7hjARBz3eHezo
         n+1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Hpp8aDXL98xwIV/sCIPc51uiaHWe+UYD6Nc0LrfD2WA=;
        b=cHSTYLrndvkwTq024ilsONLf8mm+sf1Jycgn9TWX+vVsadvMNw0SclJTSARdolR3qh
         VZ354/QWRuwGQ1mWer5JQ7zx/1qzrYP+wv6EUvOqeC+iyrqlLajhvoEn2UDWAst/ZKaQ
         6pcLEgz4rMju6crpX6Y86l0IDtDm5mfbY2f6rcTeVeu9BvhXRYeP0JgO49vmvBGtLW8L
         uGHr3pG03YsIfn8IoLbZf1HKMUH5mk02q99rz5bFfUDMRDc9dRNyxr6ooJmmEdHMNBMI
         uqdAI2EhF7Gop3dhNVOby3qgHNtHxU49o0hqJyAFyWtN68eEpJTT5enblPFy7t0JEK56
         bsCQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id c4si50840wri.3.2021.05.21.03.48.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:48:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAmWYU028736
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:48:32 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcO032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:39 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 19/22] rpi4: Switch to upstream 5.10 kernel
Date: Fri, 21 May 2021 12:37:31 +0200
Message-Id: <909605ba74874eef0f5303067544ca5837e4d704.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
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

Finally, the retirement of the downstream fork. A little bit of tuning
is still needed, though:

 - alias for uart1 so that TF-A continue to provide output
 - aliases for mmc0/mmc1 to ensure stable topology (--use-uuid does not
   help as wic has no knowledge of the RPi bootloader)

Both changes are applied as DT overlay to avoid patches.

The RPi firmware needs an update as well. In the config.txt, we can now
drop enable_gic=1 as this is default.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/machine/rpi4.conf                        |  2 --
 .../rpi-firmware/files/debian/aliases.dts     | 30 +++++++++++++++++++
 .../rpi-firmware/files/debian/cmdline.txt     |  2 +-
 .../rpi-firmware/files/debian/config.txt      |  2 +-
 .../rpi-firmware/files/debian/jailhouse.dts   | 13 +++++++-
 .../files/debian/rpi-firmware.install         |  1 +
 recipes-bsp/rpi-firmware/files/rules          |  1 +
 ...20200819.bb => rpi-firmware_1.20210303.bb} |  2 +-
 .../linux/linux-jailhouse-rpi_5.4.59.bb       | 15 ----------
 recipes-kernel/linux/linux-jailhouse_5.4.inc  | 23 --------------
 10 files changed, 47 insertions(+), 44 deletions(-)
 create mode 100644 recipes-bsp/rpi-firmware/files/debian/aliases.dts
 rename recipes-bsp/rpi-firmware/{rpi-firmware_1.20200819.bb => rpi-firmware_1.20210303.bb} (86%)
 delete mode 100644 recipes-kernel/linux/linux-jailhouse-rpi_5.4.59.bb
 delete mode 100644 recipes-kernel/linux/linux-jailhouse_5.4.inc

diff --git a/conf/machine/rpi4.conf b/conf/machine/rpi4.conf
index b26effa..e8985e8 100644
--- a/conf/machine/rpi4.conf
+++ b/conf/machine/rpi4.conf
@@ -30,7 +30,5 @@ IMAGE_BOOT_FILES = " \
     /vmlinuz;kernel8.img \
     "
 
-KERNEL_NAME ?= "jailhouse-rpi"
-
 IMAGE_PREINSTALL_append = " firmware-brcm80211"
 IMAGE_INSTALL_append = " rpi-firmware-brcm80211"
diff --git a/recipes-bsp/rpi-firmware/files/debian/aliases.dts b/recipes-bsp/rpi-firmware/files/debian/aliases.dts
new file mode 100644
index 0000000..857bb96
--- /dev/null
+++ b/recipes-bsp/rpi-firmware/files/debian/aliases.dts
@@ -0,0 +1,30 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2021
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+/dts-v1/;
+/plugin/;
+/ {
+	compatible = "brcm,bcm2835";
+
+	fragment@0 {
+		target-path = "/";
+		__overlay__ {
+			aliases {
+				/* Needed to enable UART1 for use by TF-A */
+				uart1 = "/soc/serial@7e215040";
+
+				/* Ensure stable /dev/mmcblk0 assignment */
+				mmc0 = "/emmc2bus/emmc2@7e340000";
+				mmc1 = "/soc/sdhci@7e300000";
+			};
+		};
+	};
+};
diff --git a/recipes-bsp/rpi-firmware/files/debian/cmdline.txt b/recipes-bsp/rpi-firmware/files/debian/cmdline.txt
index cafe0e1..9d72941 100644
--- a/recipes-bsp/rpi-firmware/files/debian/cmdline.txt
+++ b/recipes-bsp/rpi-firmware/files/debian/cmdline.txt
@@ -1 +1 @@
-console=serial0,115200 root=/dev/mmcblk0p2 rootwait
+console=ttyS1,115200 root=/dev/mmcblk0p2 rootwait
diff --git a/recipes-bsp/rpi-firmware/files/debian/config.txt b/recipes-bsp/rpi-firmware/files/debian/config.txt
index b41ef6f..f72db53 100644
--- a/recipes-bsp/rpi-firmware/files/debian/config.txt
+++ b/recipes-bsp/rpi-firmware/files/debian/config.txt
@@ -7,6 +7,6 @@ max_framebuffers=2
 [all]
 enable_uart=1
 arm_64bit=1
-enable_gic=1
 armstub=bl31.bin
+dtoverlay=aliases
 dtoverlay=jailhouse
diff --git a/recipes-bsp/rpi-firmware/files/debian/jailhouse.dts b/recipes-bsp/rpi-firmware/files/debian/jailhouse.dts
index b51163e..7ee9336 100644
--- a/recipes-bsp/rpi-firmware/files/debian/jailhouse.dts
+++ b/recipes-bsp/rpi-firmware/files/debian/jailhouse.dts
@@ -1,3 +1,14 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020-2021
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
 /dts-v1/;
 /plugin/;
 / {
@@ -20,7 +31,7 @@
 	};
 
 	fragment@1 {
-		target = <&pcie0>;
+		target-path = "/scb/pcie@7d500000";
 		__overlay__ {
 			linux,pci-domain = <0x00000000>;
 		};
diff --git a/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install b/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
index dba3266..9de5c71 100644
--- a/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
+++ b/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
@@ -4,6 +4,7 @@ boot/*.dat			usr/lib/rpi-firmware/
 boot/*.dtb			usr/lib/rpi-firmware/
 boot/*.elf			usr/lib/rpi-firmware/
 boot/overlays/README		usr/lib/rpi-firmware/overlays/
+boot/overlays/aliases.dtbo	usr/lib/rpi-firmware/overlays/
 boot/overlays/jailhouse.dtbo	usr/lib/rpi-firmware/overlays/
 debian/cmdline.txt		usr/lib/rpi-firmware/
 debian/config.txt		usr/lib/rpi-firmware/
diff --git a/recipes-bsp/rpi-firmware/files/rules b/recipes-bsp/rpi-firmware/files/rules
index 8d60529..286b525 100644
--- a/recipes-bsp/rpi-firmware/files/rules
+++ b/recipes-bsp/rpi-firmware/files/rules
@@ -1,6 +1,7 @@
 #!/usr/bin/make -f
 
 override_dh_auto_build:
+	dtc -O dtb -b 0 -@ debian/aliases.dts -o boot/overlays/aliases.dtbo
 	dtc -O dtb -b 0 -@ debian/jailhouse.dts -o boot/overlays/jailhouse.dtbo
 
 %:
diff --git a/recipes-bsp/rpi-firmware/rpi-firmware_1.20200819.bb b/recipes-bsp/rpi-firmware/rpi-firmware_1.20210303.bb
similarity index 86%
rename from recipes-bsp/rpi-firmware/rpi-firmware_1.20200819.bb
rename to recipes-bsp/rpi-firmware/rpi-firmware_1.20210303.bb
index 67b92a5..ed678be 100644
--- a/recipes-bsp/rpi-firmware/rpi-firmware_1.20200819.bb
+++ b/recipes-bsp/rpi-firmware/rpi-firmware_1.20210303.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
     https://github.com/raspberrypi/firmware/archive/${PV}.tar.gz;downloadfilename=${PN}-${PV}.tar.gz \
     file://debian \
     file://rules"
-SRC_URI[sha256sum] = "661e4c2c33ef9354da50ff2f679b697ea94d2d820166cde749692133e3461c34"
+SRC_URI[sha256sum] = "9b57137c602ecb0d05de6c530c5e5e77d0ad2cb3ffe43e98db81cd44b046de85"
 
 S = "${WORKDIR}/firmware-${PV}"
 
diff --git a/recipes-kernel/linux/linux-jailhouse-rpi_5.4.59.bb b/recipes-kernel/linux/linux-jailhouse-rpi_5.4.59.bb
deleted file mode 100644
index a8b296e..0000000
--- a/recipes-kernel/linux/linux-jailhouse-rpi_5.4.59.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2020
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-require recipes-kernel/linux/linux-jailhouse_5.4.inc
-
-SRC_URI[sha256sum] = "dc9719a70743bf98057eb1a4d1e40a2cbed9ea08fc752a1a1ddb0285d23a2ede"
-SRCREV = "108bab72978d4ec29ef6ac32506eb1783af599a2"
diff --git a/recipes-kernel/linux/linux-jailhouse_5.4.inc b/recipes-kernel/linux/linux-jailhouse_5.4.inc
deleted file mode 100644
index c56e1c0..0000000
--- a/recipes-kernel/linux/linux-jailhouse_5.4.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2018-2020
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-require recipes-kernel/linux/linux-custom.inc
-
-KERNEL_DEFCONFIG = "${DISTRO_ARCH}_defconfig_5.4"
-KERNEL_DEFCONFIG_rpi4 = "rpi4_defconfig_5.4"
-
-SRC_URI += " \
-    https://github.com/siemens/linux/archive/${SRCREV}.tar.gz;downloadfilename=linux-${SRCREV}.tar.gz \
-    file://${KERNEL_DEFCONFIG}"
-
-S = "${WORKDIR}/linux-${SRCREV}"
-
-KBUILD_DEPENDS += "liblz4-tool"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/909605ba74874eef0f5303067544ca5837e4d704.1621593454.git.jan.kiszka%40siemens.com.
