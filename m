Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOPD66BQMGQE6A5H7KQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0226B364CDE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:10:18 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id z3-20020a05640240c3b029037fb0c2bd3bsf11947770edb.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:10:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866617; cv=pass;
        d=google.com; s=arc-20160816;
        b=OyB0JxL2YcnJdE+yxosvmOhEoqrtHmW4pTGZLz3UNmfyxXCiCaz+2JkldCrpyJ47ss
         pB11Tu+vYqW69bL8gHBp1TfId/VqitwYn5MEmeWIXUUmZwbRWwt7UFF4KMh3ReQ6OLka
         qooZEkJ0cUjojNo5ZPwOKMUAkPZQwboOaBx1LUPaEChI6ndzl/xZr1TZ/5D/eJavijUN
         9i5B5QIsqAQB075VEWDjkLlYYngIC7hdL+vD/dWxfAPAIvWy2z/vcB944cnneN2DGV1+
         RlBHxTmRUXfVChIMgxgkn9MwHC0SguIUoyApUM9rdslu1CKVi+x7P/D6ITLewHA9obH9
         YM7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=JRiQxlPTZf9MdydVC9FYUe/J+AmXS5la7s0P9yLkF40=;
        b=T+t6HEg9DIrEQ63BDNEOJTPWRjysbFF/3Wr1XkUFu71NzXnVjecO0YZ4oUJ1wuxCce
         yhb52T7tVhSkGEdAtIffyR8dJgX1SXupZdNbV7Hed1bJSU2B+KE7jplh/iLvepsnTDXH
         xo2UeqI64SVHAepzti5x75Hm8Ozd0XIHnlFaJxquIKG4z38v1impyjCNG6mhcqn8Jhbt
         IkbRQQsC8lIueB6Mp+ZHP2aTUHosvzcBLrQTjrVMBClmtJwZ7Rgg7UaAyfQzWM0FO3yA
         9dCbW/Ra2IkVvbWc0E48FDIHNN1zv00KgEyuEW+ZJePheVfIM5Ooaq4np0LzrKBKxq7/
         qVJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JRiQxlPTZf9MdydVC9FYUe/J+AmXS5la7s0P9yLkF40=;
        b=iqHbZ5ncgcgxLsWOXj23XcqEfXUbp17JWUHQJ63Gcc+9fEV8mfmg0N6RFu2OWb3BX6
         Ez1pR13BSTpYKmaypl63/PEW3sOkkmG5BWiGVJshH1cubJR48bk+KWJ6ghEY6cOaiBMv
         4suM601U+VJjEgszz9tb/NmWIJW4F6URRir5srZxgwNHWWjkRCGG4sNbnRGuP+GPAA9C
         nvyl7Sk7cnb3t4uesNnqw8IZoMqF+WKhvSeAw9awNUgO7oXGalp3nB3hX0V269vvgf2q
         sgRVlZMQVAIXmvhxseLNM310G1X9pzOO7RUEnADVNqbU2kCyAvXzjbvrCQe5qFBKaBsQ
         +jJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JRiQxlPTZf9MdydVC9FYUe/J+AmXS5la7s0P9yLkF40=;
        b=B0HhhjVFssv8O4vfh+h3Kjh6ewkyvWH/AwyXox5tvrGnzT8BASESuA9QdNDWxlcaGF
         lqwSBNA0KgO8AknRAiLZXbFBpAZku2MmaWrQlCdo+5GXQmZ/6VmAAbwOM4aQsTGv0nNC
         DrgZzoXxBSJglr7WslqmB7iTEdg5Hi0Qbp9sI2yF4ZKMUAY/hKpP6J/hy7gdwv8czEjq
         MU2XaGJXx93FKhxRHWhr3YRlcJeMogIxM11CKbwKaAcPe9q6ARDP+yebJ0COxyjCEuYT
         qiLZcpAkkMne6JKBLvcT2DNtO1JlC2GpBEqH+etK9Aza1j2JQbcySCLoIN1aqDHItaEg
         /acg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530h014eEgsHmBZJ8tL+VgPhbhui9cyamGgui73T7d0WO/S2F3DC
	arwjvhorsWlYFcHpPOW+LNg=
X-Google-Smtp-Source: ABdhPJxix9OCa1eeqVWs89mC+UHxgH+Do5QGCga212a4iRyKf2PfGEFFFiRDLgf56GbPnOPNbHHMZQ==
X-Received: by 2002:a05:6402:343:: with SMTP id r3mr10551094edw.96.1618866617731;
        Mon, 19 Apr 2021 14:10:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:4c2:: with SMTP id n2ls2861982edw.2.gmail; Mon, 19
 Apr 2021 14:10:16 -0700 (PDT)
X-Received: by 2002:aa7:dc0b:: with SMTP id b11mr28432522edu.124.1618866616799;
        Mon, 19 Apr 2021 14:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866616; cv=none;
        d=google.com; s=arc-20160816;
        b=bjo0eWPSTo96x9DFcmQ2Z/OyrqekYmqkI431nfAz5vPoDP3JvPrg2yqkZHYK9sgzD6
         SClmKu/uiDhUbpewI1QohplrOsoMDHopyTYxH+3JdhNrHdXP6OJYQvL2COlZOX9NWFO7
         7GliBCM897THA84SkzMOvjR8MUyEtHcYCj5xrtrrNppmicMFjaVhJXLrqGtIWP3TH3M6
         NsKWzN54H+dpMBMKjqTculYtzwBim+1jr0WGEfkYcxAFbopfdxf30p+q+SP6BMzUMALL
         9wGNaylDlOUAikjnAeI1doVuIyedcxS+a3lcWquil1c8R/m8WAUBqdeFrBAid40WFkvV
         hb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Hpp8aDXL98xwIV/sCIPc51uiaHWe+UYD6Nc0LrfD2WA=;
        b=ZoXjBIvo7ISTe1M8UniYUkRb9U1vtJNPxH3sqh+OeDRHfkKJY10rbgA5IHprPPi//s
         2GMgzVYN7PrSR/nVx3+Qmw++HrPybHW7w5ifcPjlSBD2ZhylutZji2jU+cqgVTN6qDQc
         oZZwMRAxWkd7tffA50gaEUliXyhtRkp+CkdMye75c6cEhQx39qL4bhFEpT6K6WdmjV9N
         7dJx1dAlgzO/pVbV2R/z4yHbuIDLSqP56eG30hg0tOsYizl+cIyrjxDDBECK+MwR2dhN
         Y8xpJ3raPyUZKRmuR/TlcfILzch5OXJjn2bO60tK2INg4B4bzwc7fk56hceM/cOkOkFf
         fscw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id h7si516803ede.0.2021.04.19.14.10.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:10:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JLAG6p027320
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:10:16 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6Tpm015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:34 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 19/20] rpi4: Switch to upstream 5.10 kernel
Date: Mon, 19 Apr 2021 23:06:28 +0200
Message-Id: <c048a8d6024cba5caf1009ae168242d6e39ca6ba.1618866389.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c048a8d6024cba5caf1009ae168242d6e39ca6ba.1618866389.git.jan.kiszka%40siemens.com.
