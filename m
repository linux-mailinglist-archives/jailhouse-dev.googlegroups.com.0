Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXE2W35AKGQEUVEMWTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AD725848D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 01:53:01 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id u11sf63706lfk.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 16:53:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598917980; cv=pass;
        d=google.com; s=arc-20160816;
        b=jv0iZNuxkSh2dJVkxxu+45aQ6bzYPfCtZ32B9lNwyMGhbSqOIZvw3BWWgkGoMZD3oS
         vKW2blgbo32QdV+REaU1B0AsQp9nCS+6N3+he2YjN6xBMj5Cwr1xVSWxESZQMCTISDa6
         DtVjWl88OVWKIgIHB2z2xIhdNJl+egWW5Uy0mfLmAh3+SsMPEJb1avDlGuxYq6m5N3Xy
         o2SwZJcj6wg0DW5PR8eOaIDqf/bkQJOejzQfVib5wVRJjgIEfdLQlU2DopgsuO80k574
         o7Z/IeeBIbEW6KMWQYS/z9g0bHio+A8gYPNNrkVmk8FfPO9scdQS9wcr17gGcs7sRZ2h
         tN/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=HiayXz0IiHOZSgCVDwcecbaHeNC3cd4r6lOFlP89Tak=;
        b=NVDp+k/B64OAodFIZd5bSnpgqnq9OpKnjqcQfpOEJ1/tDO6u+ZqvGaMt51Uu3m0IO6
         6BL12eL1NiPpDWRF0oL9PN2m7RTrmUiNJpXL3qx6pdCGuKf3vBWswYrJ62zvHgm7h97d
         cJbDNiHqodqgvKTm1RiBB+AvBi0wRKsFcVt+krMZXsEHeKCCqcJiUpSI9Gw+Ndvlf0SE
         c2hdyvfZERBBipTLqupzlCH2ABuxNSaBoqZG9gg+vbrMiIN7ZeRuqZcAE9k0dsZgz0xq
         DseW5f5Er02nHc6OC5MSnpfkk5RUg1BaqfI80ExPTXjUWb4VKxCTtFKxcF+f39rP42Wg
         t10w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HiayXz0IiHOZSgCVDwcecbaHeNC3cd4r6lOFlP89Tak=;
        b=DS9ppv8vC2dfBYhPkUqcvR46IJzulCy+GZ2Dyg0VqFNwUYG9ZEDaiZE8rcSL1LAd9N
         9M2usW7F3JCfMKe23fjkd8pDTLO6WuJz+PlyrTqignWrxvqNnVuqU6VK+akBs7KLsK80
         V/yBlAD0fDu0QQgWhYYZPSIqCZA6wRKRjkcMjfeQooFFr3QXOwEH7CWk99MOkwKLuT3p
         RPOymek1Gw2tmB705LODRXH2S0k5z79Mbf0FG5nFL4baWWkiUyXhQUocOaLkbC5RNYQd
         kLNdqP4ELbGNnwXQ/F3jqhgssQ3objYs5+Id//sOfeZBRkQOgRCdkcmitBkvGqqjDJFZ
         6Pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HiayXz0IiHOZSgCVDwcecbaHeNC3cd4r6lOFlP89Tak=;
        b=Wbmjh4s+WOBBu1Mi6nn6K5uGWZLkaTVu9sRs25shFA8GtXm1bI0OMaguHZ6iausa8t
         lwkvS6pB/ssX5C4dVTochR60WcC61uUGbfPqvLQp6oYIo5VrUgG2RwjeP4IEygAEl/cT
         6PS4Aa7zupFbRs9WIb04q7ewOh/DHYPMDWR7zAPNGBd0hm2/w2/4vs2AwPwHC8MOTYH5
         V4jD6yRdhRjv4kLQ+1ZdZjvW9oLcAwaW/37tMTQkaw3jCEtlUKEgsNQRjkhEmhUTC3Hp
         aP1jZAC+7mL/LkaEiyEUijZ+FjG7Z9z7zwNKfMQE67K8MqzRbNkRK/JPE1dTup5jAQFQ
         5btg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531hw+fquxMdgKZU2l/CNq1emoYevOZVgErYEHa7iPxD1YVOuYm5
	N1YyRaqGDPtzJKbPQ99y4o4=
X-Google-Smtp-Source: ABdhPJwuMuCNtggOAcyl20eBFSJljmCAhebhfdRZzZGs+JYaQtior95CiSIG1eCpYwrvHDPJvwoidg==
X-Received: by 2002:a05:651c:1397:: with SMTP id k23mr1847581ljb.263.1598917980644;
        Mon, 31 Aug 2020 16:53:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls1779982lff.0.gmail; Mon, 31
 Aug 2020 16:52:59 -0700 (PDT)
X-Received: by 2002:a19:4915:: with SMTP id w21mr1794769lfa.2.1598917979573;
        Mon, 31 Aug 2020 16:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598917979; cv=none;
        d=google.com; s=arc-20160816;
        b=SVYPIxZh9VXZejstjER89D6+aHY69NMhDXRsuHjvkpMyMRZI1o2B/XTNhE7sC1u52A
         ebIplcKx9O1KcUmew67+zq1LmLWjShUmZh3XdpvadMJxUQTof2qQj+hs25LIEO61CH1u
         6KCRf+hycIm4m8XDQ5Wzr0z3oRnkhD/QEl6OeaMv1/fValqm5/CLhetAJjTNJbMNpWeY
         XjkEwsc0psaE0mKngwmI7hbkJppBgd9g0zoy+e6lqLukdkyPUk7e38cGxnKdy9NWUf5M
         qbkJBdjufp2fKhwGBgX5xQDFsq5dgXVUvn25gXqAa7a6A3fJqhkA9PwKOjrdgT3CpgSS
         7Emg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=dIlCjYLCZzWO/np1K5GrWr/OWLbT0K2neSJlw1F5V30=;
        b=ohfzEiT+j7CreqiLyde2tjD9n+OMxcDTDDyFYvdxSaUPl0zZN394dGEyO9TRwXaBlU
         e3i9osqzc8ZaAmo5+2H6DS+xAq9FxR3/k/d22a4Zyc8aLu8iKa3XLUejh7X9A1e96+i0
         fA/7bcZr67qz9bjy3xkqRMqnTiTvt+LS8WvB2pusJGOHZA2/H1MPBFVzvB61pgMXl8yu
         W47dyJc2qVebbHVCzjdLwEu5rG4K66iHilK8/ATqWXGwN/kS8bgAwwsGP14k9GOIp66W
         HbUQWNUcmClpCmZWePEeP+jkiByt77rZUZsCBSW2H5gVdgG7DUhs2noeqCDmYJOoB8SJ
         Z83A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id k10si176239ljj.0.2020.08.31.16.52.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 16:52:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 07VNqwa7007224
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:52:58 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.128.15])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VNqorL007358
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:52:57 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 5/7] rpi-firmware: Switch to overlay-based RAM reservation to support all variants
Date: Tue,  1 Sep 2020 01:52:48 +0200
Message-Id: <2b6ce773b417abf02d7f1853e8acb0d8222f89f9.1598917969.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1598917969.git.jan.kiszka@siemens.com>
References: <cover.1598917969.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

This is needed to support latest changes in the Jailhouse configuration
which moved the reservation area in the middle of the RAM. It also opens
the door for supporting models with more RAM.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-bsp/rpi-firmware/files/cmdline.txt    |   1 -
 .../rpi-firmware/files/debian/cmdline.txt     |   1 +
 .../files/{ => debian}/config.txt             |   1 +
 .../rpi-firmware/files/debian/jailhouse.dts   |  21 ++
 .../files/debian/rpi-firmware.install         |   8 +
 recipes-bsp/rpi-firmware/files/rules          |   7 +
 .../rpi-firmware/rpi-firmware_1.20200212.bb   |  24 +-
 ...d-support-for-RPi4-with-more-than-1G.patch | 306 ++++++++++++++++++
 recipes-jailhouse/jailhouse/jailhouse_0.12.bb |   1 +
 9 files changed, 357 insertions(+), 13 deletions(-)
 delete mode 100644 recipes-bsp/rpi-firmware/files/cmdline.txt
 create mode 100644 recipes-bsp/rpi-firmware/files/debian/cmdline.txt
 rename recipes-bsp/rpi-firmware/files/{ => debian}/config.txt (86%)
 create mode 100644 recipes-bsp/rpi-firmware/files/debian/jailhouse.dts
 create mode 100644 recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
 create mode 100644 recipes-bsp/rpi-firmware/files/rules
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-configs-arm64-Add-support-for-RPi4-with-more-than-1G.patch

diff --git a/recipes-bsp/rpi-firmware/files/cmdline.txt b/recipes-bsp/rpi-firmware/files/cmdline.txt
deleted file mode 100644
index 2126fb6..0000000
--- a/recipes-bsp/rpi-firmware/files/cmdline.txt
+++ /dev/null
@@ -1 +0,0 @@
-console=serial0,115200 root=/dev/mmcblk0p2 rootwait mem=768M
diff --git a/recipes-bsp/rpi-firmware/files/debian/cmdline.txt b/recipes-bsp/rpi-firmware/files/debian/cmdline.txt
new file mode 100644
index 0000000..cafe0e1
--- /dev/null
+++ b/recipes-bsp/rpi-firmware/files/debian/cmdline.txt
@@ -0,0 +1 @@
+console=serial0,115200 root=/dev/mmcblk0p2 rootwait
diff --git a/recipes-bsp/rpi-firmware/files/config.txt b/recipes-bsp/rpi-firmware/files/debian/config.txt
similarity index 86%
rename from recipes-bsp/rpi-firmware/files/config.txt
rename to recipes-bsp/rpi-firmware/files/debian/config.txt
index e66fa16..b41ef6f 100644
--- a/recipes-bsp/rpi-firmware/files/config.txt
+++ b/recipes-bsp/rpi-firmware/files/debian/config.txt
@@ -9,3 +9,4 @@ enable_uart=1
 arm_64bit=1
 enable_gic=1
 armstub=bl31.bin
+dtoverlay=jailhouse
diff --git a/recipes-bsp/rpi-firmware/files/debian/jailhouse.dts b/recipes-bsp/rpi-firmware/files/debian/jailhouse.dts
new file mode 100644
index 0000000..546b817
--- /dev/null
+++ b/recipes-bsp/rpi-firmware/files/debian/jailhouse.dts
@@ -0,0 +1,21 @@
+/dts-v1/;
+/plugin/;
+/ {
+	compatible = "brcm,bcm2835";
+
+	fragment@0 {
+		target-path = "/";
+		__overlay__ {
+			reserved-memory {
+				#address-cells = <2>;
+				#size-cells = <1>;
+				ranges;
+
+				jailhouse@20000000 {
+					reg = <0 0x20000000 0x10000000>;
+					no-map;
+				};
+			};
+		};
+	};
+};
diff --git a/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install b/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
new file mode 100644
index 0000000..701a984
--- /dev/null
+++ b/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
@@ -0,0 +1,8 @@
+boot/bootcode.bin	usr/lib/rpi-firmware/
+boot/LICENCE.broadcom	usr/lib/rpi-firmware/
+boot/*.dat		usr/lib/rpi-firmware/
+boot/*.dtb		usr/lib/rpi-firmware/
+boot/*.elf		usr/lib/rpi-firmware/
+boot/overlays/*		usr/lib/rpi-firmware/overlays/
+debian/cmdline.txt	usr/lib/rpi-firmware/
+debian/config.txt	usr/lib/rpi-firmware/
diff --git a/recipes-bsp/rpi-firmware/files/rules b/recipes-bsp/rpi-firmware/files/rules
new file mode 100644
index 0000000..8d60529
--- /dev/null
+++ b/recipes-bsp/rpi-firmware/files/rules
@@ -0,0 +1,7 @@
+#!/usr/bin/make -f
+
+override_dh_auto_build:
+	dtc -O dtb -b 0 -@ debian/jailhouse.dts -o boot/overlays/jailhouse.dtbo
+
+%:
+	dh $@
diff --git a/recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb b/recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb
index 657ddd7..47e40b9 100644
--- a/recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb
+++ b/recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb
@@ -9,21 +9,21 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit dpkg-raw
+inherit dpkg
 
 SRC_URI = " \
     https://github.com/raspberrypi/firmware/archive/${PV}.tar.gz;downloadfilename=${PN}-${PV}.tar.gz \
-    file://cmdline.txt \
-    file://config.txt"
+    file://debian \
+    file://rules"
 SRC_URI[sha256sum] = "e3b0577beb62d886a45016447bdf8c2d57b794d3d71b502868b16ba82ff8fe43"
 
-do_install() {
-    install -v -d ${D}/usr/lib/rpi-firmware/overlays
-    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/bootcode.bin ${D}/usr/lib/rpi-firmware/
-    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/LICENCE.broadcom ${D}/usr/lib/rpi-firmware/
-    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/*.dat ${D}/usr/lib/rpi-firmware/
-    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/*.dtb ${D}/usr/lib/rpi-firmware/
-    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/*.elf ${D}/usr/lib/rpi-firmware/
-    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/overlays/* ${D}/usr/lib/rpi-firmware/overlays/
-    install -v -m 644 ${WORKDIR}/*.txt ${D}/usr/lib/rpi-firmware/
+S = "${WORKDIR}/firmware-${PV}"
+
+DEBIAN_BUILD_DEPENDS = "device-tree-compiler"
+
+do_prepare_build[cleandirs] += "${S}/debian"
+do_prepare_build() {
+    cp -r ${WORKDIR}/debian ${S}
+
+    deb_debianize
 }
diff --git a/recipes-jailhouse/jailhouse/files/0001-configs-arm64-Add-support-for-RPi4-with-more-than-1G.patch b/recipes-jailhouse/jailhouse/files/0001-configs-arm64-Add-support-for-RPi4-with-more-than-1G.patch
new file mode 100644
index 0000000..96d0e83
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/files/0001-configs-arm64-Add-support-for-RPi4-with-more-than-1G.patch
@@ -0,0 +1,306 @@
+From 7bcab7c38b2c853ec068b35d61205ef660fceaac Mon Sep 17 00:00:00 2001
+From: Jakub Luzny <jakub@luzny.cz>
+Date: Wed, 26 Aug 2020 18:16:42 +0200
+Subject: [PATCH 1/2] configs: arm64: Add support for RPi4 with more than 1G of
+ memory
+
+Add the required memory regions to support 2G, 4G and 8G RAM variants
+of the Raspberry Pi 4. Tested on all the bigger variants, not on 1G, as I don't
+have one on hand and it's not available anymore.
+
+Also moved the memory used by Jailhouse for the hypervisor and cells from
+0x30000000 to 0x20000000 to avoid conflict with GPU memory. That is fine for
+gpu_mem setting of up to 256. The memory is supposed to be reserved using
+reserved-memory node in the device tree.
+
+To support variants with >2G RAM, the PCI MMIO config space was moved into the
+ARM Local Peripherals address range, into free space behind the GIC.
+
+Signed-off-by: Jakub Luzny <jakub@luzny.cz>
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ configs/arm64/dts/inmate-rpi4.dts |  2 +-
+ configs/arm64/rpi4-inmate-demo.c  | 22 ++++++------
+ configs/arm64/rpi4-linux-demo.c   | 28 ++++++++--------
+ configs/arm64/rpi4.c              | 56 +++++++++++++++++++++----------
+ 4 files changed, 65 insertions(+), 43 deletions(-)
+
+diff --git a/configs/arm64/dts/inmate-rpi4.dts b/configs/arm64/dts/inmate-rpi4.dts
+index 52fd3ac2..ac6d4f58 100644
+--- a/configs/arm64/dts/inmate-rpi4.dts
++++ b/configs/arm64/dts/inmate-rpi4.dts
+@@ -96,7 +96,7 @@
+ 				<0 0 0 2 &gic GIC_SPI 154 IRQ_TYPE_EDGE_RISING>,
+ 				<0 0 0 3 &gic GIC_SPI 155 IRQ_TYPE_EDGE_RISING>,
+ 				<0 0 0 4 &gic GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
+-		reg = <0x0 0xe0000000 0x0 0x100000>;
++		reg = <0x0 0xff900000 0x0 0x100000>;
+ 		ranges =
+ 			<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+ 	};
+diff --git a/configs/arm64/rpi4-inmate-demo.c b/configs/arm64/rpi4-inmate-demo.c
+index 62442e7c..09dfc1f0 100644
+--- a/configs/arm64/rpi4-inmate-demo.c
++++ b/configs/arm64/rpi4-inmate-demo.c
+@@ -51,34 +51,34 @@ struct {
+ 	.mem_regions = {
+ 		/* IVSHMEM shared memory regions (demo) */
+ 		{
+-			.phys_start = 0x3faf0000,
+-			.virt_start = 0x3faf0000,
++			.phys_start = 0x2faf0000,
++			.virt_start = 0x2faf0000,
+ 			.size = 0x1000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		{
+-			.phys_start = 0x3faf1000,
+-			.virt_start = 0x3faf1000,
++			.phys_start = 0x2faf1000,
++			.virt_start = 0x2faf1000,
+ 			.size = 0x9000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		{
+-			.phys_start = 0x3fafa000,
+-			.virt_start = 0x3fafa000,
++			.phys_start = 0x2fafa000,
++			.virt_start = 0x2fafa000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		{
+-			.phys_start = 0x3fafc000,
+-			.virt_start = 0x3fafc000,
++			.phys_start = 0x2fafc000,
++			.virt_start = 0x2fafc000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		{
+-			.phys_start = 0x3fafe000,
+-			.virt_start = 0x3fafe000,
++			.phys_start = 0x2fafe000,
++			.virt_start = 0x2fafe000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+@@ -91,7 +91,7 @@ struct {
+ 				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		/* RAM */ {
+-			.phys_start = 0x3fa00000,
++			.phys_start = 0x2fa00000,
+ 			.virt_start = 0,
+ 			.size = 0x00010000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+diff --git a/configs/arm64/rpi4-linux-demo.c b/configs/arm64/rpi4-linux-demo.c
+index 9e7fad26..cf36fa22 100644
+--- a/configs/arm64/rpi4-linux-demo.c
++++ b/configs/arm64/rpi4-linux-demo.c
+@@ -52,39 +52,39 @@ struct {
+ 	.mem_regions = {
+ 		/* IVSHMEM shared memory regions (demo) */
+ 		{
+-			.phys_start = 0x3faf0000,
+-			.virt_start = 0x3faf0000,
++			.phys_start = 0x2faf0000,
++			.virt_start = 0x2faf0000,
+ 			.size = 0x1000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		{
+-			.phys_start = 0x3faf1000,
+-			.virt_start = 0x3faf1000,
++			.phys_start = 0x2faf1000,
++			.virt_start = 0x2faf1000,
+ 			.size = 0x9000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		{
+-			.phys_start = 0x3fafa000,
+-			.virt_start = 0x3fafa000,
++			.phys_start = 0x2fafa000,
++			.virt_start = 0x2fafa000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		{
+-			.phys_start = 0x3fafc000,
+-			.virt_start = 0x3fafc000,
++			.phys_start = 0x2fafc000,
++			.virt_start = 0x2fafc000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		{
+-			.phys_start = 0x3fafe000,
+-			.virt_start = 0x3fafe000,
++			.phys_start = 0x2fafe000,
++			.virt_start = 0x2fafe000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		/* IVSHMEM shared memory region */
+-		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 1),
++		JAILHOUSE_SHMEM_NET_REGIONS(0x2fb00000, 1),
+ 		/* UART */ {
+ 			.phys_start = 0xfe215040,
+ 			.virt_start = 0xfe215040,
+@@ -94,15 +94,15 @@ struct {
+ 				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		/* RAM */ {
+-			.phys_start = 0x3f900000,
++			.phys_start = 0x2f900000,
+ 			.virt_start = 0,
+ 			.size = 0x10000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+ 		},
+ 		/* RAM */ {
+-			.phys_start = 0x30000000,
+-			.virt_start = 0x30000000,
++			.phys_start = 0x20000000,
++			.virt_start = 0x20000000,
+ 			.size = 0x8000000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+diff --git a/configs/arm64/rpi4.c b/configs/arm64/rpi4.c
+index 92463184..7b6a7a02 100644
+--- a/configs/arm64/rpi4.c
++++ b/configs/arm64/rpi4.c
+@@ -1,7 +1,7 @@
+ /*
+  * Jailhouse, a Linux-based partitioning hypervisor
+  *
+- * Test configuration for Raspberry Pi 4 (32-bit, quad-core Cortex-A72, 1GB RAM)
++ * Test configuration for Raspberry Pi 4 (quad-core Cortex-A72, 1GB, 2GB, 4GB or 8GB RAM)
+  *
+  * Copyright (c) Siemens AG, 2020
+  *
+@@ -10,6 +10,8 @@
+  *
+  * This work is licensed under the terms of the GNU GPL, version 2.  See
+  * the COPYING file in the top-level directory.
++ *
++ * Reservation via device tree: reg = <0x0 0x20000000 0x10000000>;
+  */
+ 
+ #include <jailhouse/types.h>
+@@ -18,7 +20,7 @@
+ struct {
+ 	struct jailhouse_system header;
+ 	__u64 cpus[1];
+-	struct jailhouse_memory mem_regions[12];
++	struct jailhouse_memory mem_regions[14];
+ 	struct jailhouse_irqchip irqchips[2];
+ 	struct jailhouse_pci_device pci_devices[2];
+ } __attribute__((packed)) config = {
+@@ -27,7 +29,7 @@ struct {
+ 		.revision = JAILHOUSE_CONFIG_REVISION,
+ 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+ 		.hypervisor_memory = {
+-			.phys_start = 0x3fc00000,
++			.phys_start = 0x2fc00000,
+ 			.size       = 0x00400000,
+ 		},
+ 		.debug_console = {
+@@ -38,7 +40,7 @@ struct {
+ 				 JAILHOUSE_CON_REGDIST_4,
+ 		},
+ 		.platform_info = {
+-			.pci_mmconfig_base = 0xe0000000,
++			.pci_mmconfig_base = 0xff900000,
+ 			.pci_mmconfig_end_bus = 0,
+ 			.pci_is_virtual = 1,
+ 			.pci_domain = 1,
+@@ -70,37 +72,37 @@ struct {
+ 	.mem_regions = {
+ 		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+ 		{
+-			.phys_start = 0x3faf0000,
+-			.virt_start = 0x3faf0000,
++			.phys_start = 0x2faf0000,
++			.virt_start = 0x2faf0000,
+ 			.size = 0x1000,
+ 			.flags = JAILHOUSE_MEM_READ,
+ 		},
+ 		{
+-			.phys_start = 0x3faf1000,
+-			.virt_start = 0x3faf1000,
++			.phys_start = 0x2faf1000,
++			.virt_start = 0x2faf1000,
+ 			.size = 0x9000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+ 		},
+ 		{
+-			.phys_start = 0x3fafa000,
+-			.virt_start = 0x3fafa000,
++			.phys_start = 0x2fafa000,
++			.virt_start = 0x2fafa000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+ 		},
+ 		{
+-			.phys_start = 0x3fafc000,
+-			.virt_start = 0x3fafc000,
++			.phys_start = 0x2fafc000,
++			.virt_start = 0x2fafc000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ,
+ 		},
+ 		{
+-			.phys_start = 0x3fafe000,
+-			.virt_start = 0x3fafe000,
++			.phys_start = 0x2fafe000,
++			.virt_start = 0x2fafe000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ,
+ 		},
+ 		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+-		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 0),
++		JAILHOUSE_SHMEM_NET_REGIONS(0x2fb00000, 0),
+ 		/* MMIO 1 (permissive) */ {
+ 			.phys_start = 0xfd500000,
+ 			.virt_start = 0xfd500000,
+@@ -115,10 +117,30 @@ struct {
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_IO,
+ 		},
+-		/* RAM */ {
++		/* RAM (0M-~762M) */ {
+ 			.phys_start = 0x0,
+ 			.virt_start = 0x0,
+-			.size = 0x3fa10000,
++			.size = 0x2fa10000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++				JAILHOUSE_MEM_EXECUTE,
++		},
++
++		/* ~2M reserved for shared memory regions */
++
++		/* 4M reserved for the hypervisor */
++
++		/* RAM (768M-4032M) */ {
++			.phys_start = 0x30000000,
++			.virt_start = 0x30000000,
++			.size = 0xcc000000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++				JAILHOUSE_MEM_EXECUTE,
++		},
++
++		/* RAM (4096M-8192M) */ {
++			.phys_start = 0x100000000,
++			.virt_start = 0x100000000,
++			.size = 0x100000000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_EXECUTE,
+ 		},
+-- 
+2.26.2
+
diff --git a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
index 67df3fa..c0b5da3 100644
--- a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
+++ b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
@@ -17,6 +17,7 @@ SRC_URI += " \
     file://0002-configs-arm64-Add-inmate-demo-for-pine64-plus-board.patch \
     file://0003-configs-arm64-Add-Linux-demo-for-pine64-plus.patch \
     file://0001-inmates-x86-Add-LED-blinking-support-to-apic-demo.patch \
+    file://0001-configs-arm64-Add-support-for-RPi4-with-more-than-1G.patch \
     file://0002-arm-common-gicv2-Fix-byte-access-to-ITARGETR.patch \
     "
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2b6ce773b417abf02d7f1853e8acb0d8222f89f9.1598917969.git.jan.kiszka%40siemens.com.
