Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK7G575QKGQEBEKDLSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63d.google.com (mail-ej1-x63d.google.com [IPv6:2a00:1450:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DA72844DD
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:31:40 +0200 (CEST)
Received: by mail-ej1-x63d.google.com with SMTP id e13sf5331444ejk.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:31:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958700; cv=pass;
        d=google.com; s=arc-20160816;
        b=tuEYRlXS7HtNCduwR7TF5W/2Oq14LYJFqyqH8FSjtmdTLbBbgceOrZRHJUbkC2Kxso
         EzA69AIF32KX5/reQKcWbPQCvh7pgmmGkt15RIGCYpig5GA7A6jpuN2vzZnFzH5ksWdJ
         iBlAd5dKrh0noG0Tm0wqtEoeXK2cObeN6RQAk1irwKh8zAbUdpURUevo1kxSLvNsxl29
         Wfnbad56CPiFk8wB/Jao+6f4iVuS47h/Dkmx+2BXGRgcPnnEJdWKU3J8QNihbE5VqQ04
         AqP3G6Wn6hjUMHZu8/dx0A5oTYLrhB4u9Em00byU8BAPbXO4N1cD3ffoGFeMyHcPiDeN
         DpgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=5amnxfmPjy7o6KeBgNN7xnkCJ77aGIWDayY7+m9xy78=;
        b=FKg20qtS+iTweucWFvLONxAVeFiRCYZKfjcJd7hph0A0n8jngwLjRcp3+BHuA7nA23
         5RbzABs/S0bEfcgcN4VSC1gHBaeP+Jj8SCXpyQKGM1oOo9xTQc5oWSmqN4fHbYoGnsMB
         yr9mwO9s70dMa08NDWM6vAL9UQjwngx8BM2SWZuqGwuwKU8xPIVIefSXnqG17JDsvzXi
         Vahoh6I2pHwDWkkAkgc8jggPyK/T9L1b1cvwVMNWKgksOJ66UpM9iqmpeTHd/DRO41ng
         BCFvTypkBD72eRQT4irOCMngzZbYT6Eyr9ytWPohOlpT5LaJUOhfMwHHpUDkF99ygxG0
         rLnQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5amnxfmPjy7o6KeBgNN7xnkCJ77aGIWDayY7+m9xy78=;
        b=Xm2LASHWn6Ynh4QK01YTL2lcoC5TpAGthYtkXIkfLOICi+StM2E/uoQWGKyB6QFUnH
         1G7S1PVg5vVhOLKmB0iAOrfsYOrzwu7dfli9RGdu+dnUXTtGPNbo9HXrUEqZXoav62hX
         UGueds3uMNknhYbwl1bJg5PPTlIatxOcTtuaXzzlRFTB/mmodyemYhjYbyaffNSlgXTY
         XQ6NgQaU4DqBR3FEdDjzHGOhTI3NeqZpUos/qlgQLs/DVpi1uBRcqGHTtqmfkX/P02vX
         DKwQrJUdRk40F4vtm+rC6TA6D4Ut60Dg7+ry2cwnG7iX3CjHlwlWQkxRQZ6LDM94MaSL
         9iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5amnxfmPjy7o6KeBgNN7xnkCJ77aGIWDayY7+m9xy78=;
        b=morA/xLW0GDK8eZsW+US31QS+AJRY4dbJRHumSidcNkeGlLT5CsaY2X9O+Ht/0IB8v
         8Zr5Tpp2+5AZ2WvvGEMP+v1TRlsla7nSTM2xR1jqdIk3hJbG7OqfjALiYnW+t5dDOGQi
         5L+Ql9M2XRRpAfNvjLrdcTNzn88dOGcsd6Lnou/5ukd6QB5QZmM1iCGfnpqmqk9VkN2S
         q+84AL8OOfYWOLG+OK2aouTjxFL2MHwWdIb0RYqzDz3hQzDYBsRy7K9EGGXBRrTFGmzz
         A3cHO9Bz2zZO8Vj9woEoKVNl3DjW5PV9mx2QY9F4NkQKDoSAe1LWPKIvSouyKyz+jKCu
         DfjQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530dPvAOXgb9+Jck1JAeWpij6Q99G/V3EUZS1OR5CTzLSgdxBkhn
	xSPtiasaB4qY6gl7f3GMvKs=
X-Google-Smtp-Source: ABdhPJyxUTcqkhgH9xjlK0MK40ayos3bfXlYLK066xg40kbcsF2QgC0y+UDU70rPspU3UmXGgvYZEg==
X-Received: by 2002:a17:907:435e:: with SMTP id oc22mr3272185ejb.485.1601958700664;
        Mon, 05 Oct 2020 21:31:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c545:: with SMTP id s5ls7737120edr.3.gmail; Mon, 05 Oct
 2020 21:31:39 -0700 (PDT)
X-Received: by 2002:aa7:dc18:: with SMTP id b24mr3392981edu.285.1601958699060;
        Mon, 05 Oct 2020 21:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958699; cv=none;
        d=google.com; s=arc-20160816;
        b=qXxaEZH3s8C7XuICV2y5yyRtfq3dboa6RKg/qEvaQ02/91UMMfzttRu7vQHO7bCqp3
         VfRYtpA96As/aaMxvP1QjtAgOIeBDl68JAsuQmXNZ/CAjRSQWCWOffRI1PCD++512DiN
         6Z/GO/Yo3c5xFDUK7Q5i1UsPEraJQKlr9BZAxrbrktEllQkwjscH4Wg3jWQq1l3N2s4s
         /b71k5MS3/iJ5ftIVf9SIR5dc/TBYZtaKC+BvIjVnVLB4UjN6g4KqQO1b+JHJGNSEE5T
         mgu097er2GZkMxXuNJmuBJ/yaDScSDsiMsP/ulu7HBq2d49hoixiSFDOZHrSiJjWv4jw
         Hg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=5AIKpN2+s5kDvJLZm1kYG2r9NZGN/qkRQN98oweXVU8=;
        b=SvN/as8Mh/rOi8800n3tM7myGc1myi7MQvXsVPd4E4TwlND+VQTp5k9NB/R57KiaUR
         /d6zBkArEfVYEC17/sN6dBfo1eURYBmzi/S9yTmRGms/v7g1IsaGSdGDjHG3XO0x3l1B
         IYSLzP2+6Y/88eh8yWgm7SEJkQFUjn5H8znLNEsZJvuUMVQRbY1x+pNHM+3QoOCQytnq
         nrTSCmMjeRA6unRPdkBrUkATIxzru1P5QcJq7r2F9JWtngLjO8tQwW5twpnihvtXIL50
         5maSK1GjhM/UBdulrZ3sWONKiB7afv4O5/r4XbRfyl5/h76bSoyg+Ex/qb5eJhc9xZYz
         IRPg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id g25si52206eds.3.2020.10.05.21.31.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:31:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0964Vcxq028457
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:38 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY7l008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:37 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 01/19] ultra96: Rename to ultra96-v1
Date: Tue,  6 Oct 2020 06:31:16 +0200
Message-Id: <a752463dce9fef2247431da23bd6d5dc8e66f406.1601958694.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601958694.git.jan.kiszka@siemens.com>
References: <cover.1601958694.git.jan.kiszka@siemens.com>
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

This prepares for adding support for the v2 which will be widely
identical, except where not:
 - fsbl
 - bitstream
 - device tree

The PMU firmware will be customized later as the current version works
sufficiently well for both boards.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/distro/jailhouse-demo.conf               |   2 +-
 .../ultra96-v1.conf}                          |   6 ++---
 conf/machine/ultra96.conf                     |  23 -----------------
 conf/machine/ultra96.inc                      |  24 ++++++++++++++++++
 ...mo.conf => ultra96-v1-jailhouse-demo.conf} |   2 +-
 images.list                                   |   2 +-
 recipes-bsp/u-boot/files/ultra96-rules        |   2 +-
 ...a96-fsbl.elf.xz => ultra96-v1-fsbl.elf.xz} | Bin
 .../{ultra96.bit.xz => ultra96-v1.bit.xz}     | Bin
 ...lf.LICENSE => ultra96-vX-fsbl.elf.LICENSE} |   0
 ...a96.bit.LICENSE => ultra96-vX.bit.LICENSE} |   0
 recipes-bsp/u-boot/files/ultra96.bif.tmpl     |   4 +--
 ...bb => u-boot-ultra96-v1_2019.10-atf2.2.bb} |  16 ++++++++----
 ...story-ultra96 => .bash_history-ultra96-v1} |   0
 .../{postinst-ultra96 => postinst-ultra96-v1} |   0
 15 files changed, 44 insertions(+), 37 deletions(-)
 copy conf/{multiconfig/ultra96-jailhouse-demo.conf => machine/ultra96-v1.conf} (64%)
 delete mode 100644 conf/machine/ultra96.conf
 create mode 100644 conf/machine/ultra96.inc
 rename conf/multiconfig/{ultra96-jailhouse-demo.conf => ultra96-v1-jailhouse-demo.conf} (89%)
 rename recipes-bsp/u-boot/files/{ultra96-fsbl.elf.xz => ultra96-v1-fsbl.elf.xz} (100%)
 rename recipes-bsp/u-boot/files/{ultra96.bit.xz => ultra96-v1.bit.xz} (100%)
 rename recipes-bsp/u-boot/files/{ultra96-fsbl.elf.LICENSE => ultra96-vX-fsbl.elf.LICENSE} (100%)
 rename recipes-bsp/u-boot/files/{ultra96.bit.LICENSE => ultra96-vX.bit.LICENSE} (100%)
 rename recipes-bsp/u-boot/{u-boot-ultra96_2019.10-atf2.2.bb => u-boot-ultra96-v1_2019.10-atf2.2.bb} (71%)
 rename recipes-core/customizations/files/{.bash_history-ultra96 => .bash_history-ultra96-v1} (100%)
 rename recipes-core/customizations/files/{postinst-ultra96 => postinst-ultra96-v1} (100%)

diff --git a/conf/distro/jailhouse-demo.conf b/conf/distro/jailhouse-demo.conf
index 887871d..116b253 100644
--- a/conf/distro/jailhouse-demo.conf
+++ b/conf/distro/jailhouse-demo.conf
@@ -13,7 +13,7 @@ require conf/distro/debian-buster.conf
 
 KERNEL_NAME ?= "jailhouse"
 
-WKS_FILE = "${MACHINE}.wks"
+WKS_FILE ?= "${MACHINE}.wks"
 
 PREFERRED_VERSION_jailhouse-${KERNEL_NAME} ?= "0.12"
 
diff --git a/conf/multiconfig/ultra96-jailhouse-demo.conf b/conf/machine/ultra96-v1.conf
similarity index 64%
copy from conf/multiconfig/ultra96-jailhouse-demo.conf
copy to conf/machine/ultra96-v1.conf
index eccb51f..086a154 100644
--- a/conf/multiconfig/ultra96-jailhouse-demo.conf
+++ b/conf/machine/ultra96-v1.conf
@@ -1,7 +1,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2019
+# Copyright (c) Siemens AG, 2019-2020
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -9,6 +9,6 @@
 # SPDX-License-Identifier: MIT
 #
 
-MACHINE = "ultra96"
+require ultra96.inc
 
-DISTRO = "jailhouse-demo"
+ULTRA96_VERSION = "1"
diff --git a/conf/machine/ultra96.conf b/conf/machine/ultra96.conf
deleted file mode 100644
index 5cdfebc..0000000
--- a/conf/machine/ultra96.conf
+++ /dev/null
@@ -1,23 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2019
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-DISTRO_ARCH = "arm64"
-
-IMAGE_TYPE = "wic-img"
-IMAGER_INSTALL += "u-boot-ultra96"
-IMAGER_BUILD_DEPS += "u-boot-ultra96"
-IMAGE_INSTALL_append = " u-boot-script"
-
-IMAGE_BOOT_FILES = "/usr/lib/u-boot/ultra96/boot.bin;boot.bin"
-
-PREFERRED_PROVIDER_u-boot-ultra96 = "u-boot-ultra96"
-
-IMAGE_PREINSTALL_append = " firmware-ti-connectivity"
diff --git a/conf/machine/ultra96.inc b/conf/machine/ultra96.inc
new file mode 100644
index 0000000..37637ad
--- /dev/null
+++ b/conf/machine/ultra96.inc
@@ -0,0 +1,24 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019-2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+DISTRO_ARCH = "arm64"
+
+IMAGE_TYPE = "wic-img"
+WKS_FILE = "ultra96.wks"
+IMAGER_INSTALL += "u-boot-ultra96-v${ULTRA96_VERSION}"
+IMAGER_BUILD_DEPS += "u-boot-ultra96-v${ULTRA96_VERSION}"
+IMAGE_INSTALL_append = " u-boot-script"
+
+IMAGE_BOOT_FILES = "/usr/lib/u-boot/ultra96-v${ULTRA96_VERSION}/boot.bin;boot.bin"
+
+PREFERRED_PROVIDER_u-boot-ultra96-v${ULTRA96_VERSION} = "u-boot-ultra96-v${ULTRA96_VERSION}"
+
+IMAGE_PREINSTALL_append = " firmware-ti-connectivity"
diff --git a/conf/multiconfig/ultra96-jailhouse-demo.conf b/conf/multiconfig/ultra96-v1-jailhouse-demo.conf
similarity index 89%
rename from conf/multiconfig/ultra96-jailhouse-demo.conf
rename to conf/multiconfig/ultra96-v1-jailhouse-demo.conf
index eccb51f..cb0da85 100644
--- a/conf/multiconfig/ultra96-jailhouse-demo.conf
+++ b/conf/multiconfig/ultra96-v1-jailhouse-demo.conf
@@ -9,6 +9,6 @@
 # SPDX-License-Identifier: MIT
 #
 
-MACHINE = "ultra96"
+MACHINE = "ultra96-v1"
 
 DISTRO = "jailhouse-demo"
diff --git a/images.list b/images.list
index 3d7e12c..4917813 100644
--- a/images.list
+++ b/images.list
@@ -6,6 +6,6 @@ ipc127e		SIMATIC IPC127E (2 cores / 2 GB edition)
 espressobin	Marvell ESPRESSObin (1 GB edition)
 macchiatobin	Marvell MACCHIATObin
 hikey620	LeMaker HiKey (Kirin 620 SoC, 2 GB edition)
-ultra96		Avnet Ultra96
+ultra96-v1	Avnet Ultra96 v1
 rpi4		Raspberry Pi 4 (1-8 GB editions)
 pine64-plus	Pine64+ (Allwinner A64, 2 GB edition)
diff --git a/recipes-bsp/u-boot/files/ultra96-rules b/recipes-bsp/u-boot/files/ultra96-rules
index c650da9..a21e468 100644
--- a/recipes-bsp/u-boot/files/ultra96-rules
+++ b/recipes-bsp/u-boot/files/ultra96-rules
@@ -21,7 +21,7 @@ override_dh_auto_build:
 	$(MAKE) $(PARALLEL_BUILD) -C ../arm-trusted-firmware-* \
 	        PLAT=zynqmp RESET_TO_BL31=1 bl31
 
-	echo "CONFIG_BOOTCOMMAND=\"setenv fdtfile xilinx/avnet-ultra96-rev1.dtb; run distro_bootcmd\"" \
+	echo "CONFIG_BOOTCOMMAND=\"setenv fdtfile xilinx/avnet-ultra96-rev$(ULTRA96_VERSION).dtb; run distro_bootcmd\"" \
 	    >> configs/${U_BOOT_CONFIG}
 	echo "CONFIG_WATCHDOG=n" >> configs/${U_BOOT_CONFIG}
 	echo "CONFIG_WDT=n" >> configs/${U_BOOT_CONFIG}
diff --git a/recipes-bsp/u-boot/files/ultra96-fsbl.elf.xz b/recipes-bsp/u-boot/files/ultra96-v1-fsbl.elf.xz
similarity index 100%
rename from recipes-bsp/u-boot/files/ultra96-fsbl.elf.xz
rename to recipes-bsp/u-boot/files/ultra96-v1-fsbl.elf.xz
diff --git a/recipes-bsp/u-boot/files/ultra96.bit.xz b/recipes-bsp/u-boot/files/ultra96-v1.bit.xz
similarity index 100%
rename from recipes-bsp/u-boot/files/ultra96.bit.xz
rename to recipes-bsp/u-boot/files/ultra96-v1.bit.xz
diff --git a/recipes-bsp/u-boot/files/ultra96-fsbl.elf.LICENSE b/recipes-bsp/u-boot/files/ultra96-vX-fsbl.elf.LICENSE
similarity index 100%
rename from recipes-bsp/u-boot/files/ultra96-fsbl.elf.LICENSE
rename to recipes-bsp/u-boot/files/ultra96-vX-fsbl.elf.LICENSE
diff --git a/recipes-bsp/u-boot/files/ultra96.bit.LICENSE b/recipes-bsp/u-boot/files/ultra96-vX.bit.LICENSE
similarity index 100%
rename from recipes-bsp/u-boot/files/ultra96.bit.LICENSE
rename to recipes-bsp/u-boot/files/ultra96-vX.bit.LICENSE
diff --git a/recipes-bsp/u-boot/files/ultra96.bif.tmpl b/recipes-bsp/u-boot/files/ultra96.bif.tmpl
index 8281fb0..8c5355b 100644
--- a/recipes-bsp/u-boot/files/ultra96.bif.tmpl
+++ b/recipes-bsp/u-boot/files/ultra96.bif.tmpl
@@ -11,8 +11,8 @@
 
 image : {
 	[pmufw_image] /usr/share/zynqmp-pmufw/executable.elf
-	[bootloader, destination_cpu=a5x-0] ../ultra96-fsbl.elf
-	../ultra96.bit
+	[bootloader, destination_cpu=a5x-0] ../ultra96-v${ULTRA96_VERSION}-fsbl.elf
+	../ultra96-v${ULTRA96_VERSION}.bit
 	[destination_cpu=a5x-0, exception_level=el-3,trustzone] ../arm-trusted-firmware-${ATF_PV}/build/zynqmp/release/bl31/bl31.elf
 	[destination_cpu=a5x-0, exception_level=el-2] u-boot.elf
 }
diff --git a/recipes-bsp/u-boot/u-boot-ultra96_2019.10-atf2.2.bb b/recipes-bsp/u-boot/u-boot-ultra96-v1_2019.10-atf2.2.bb
similarity index 71%
rename from recipes-bsp/u-boot/u-boot-ultra96_2019.10-atf2.2.bb
rename to recipes-bsp/u-boot/u-boot-ultra96-v1_2019.10-atf2.2.bb
index 57424e5..fd593f7 100644
--- a/recipes-bsp/u-boot/u-boot-ultra96_2019.10-atf2.2.bb
+++ b/recipes-bsp/u-boot/u-boot-ultra96-v1_2019.10-atf2.2.bb
@@ -1,7 +1,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2019
+# Copyright (c) Siemens AG, 2019-2020
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -15,18 +15,20 @@ ATF_PV="${@d.getVar('PV').split('-atf')[1]}"
 require recipes-bsp/u-boot/u-boot-custom.inc
 require recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_${ATF_PV}.inc
 
+ULTRA96_VERSION ?= "1"
+
 SRC_URI += " \
     https://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
     file://0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch \
-    file://ultra96.bit.xz \
-    file://ultra96-fsbl.elf.xz \
+    file://ultra96-v${ULTRA96_VERSION}.bit.xz \
+    file://ultra96-v${ULTRA96_VERSION}-fsbl.elf.xz \
     file://ultra96.bif.tmpl \
     file://ultra96-rules \
     "
 SRC_URI[u-boot.sha256sum] = "8d6d6070739522dd236cba7055b8736bfe92b4fac0ea18ad809829ca79667014"
 
 TEMPLATE_FILES += "ultra96.bif.tmpl"
-TEMPLATE_VARS += "ATF_PV"
+TEMPLATE_VARS += "ATF_PV ULTRA96_VERSION"
 
 DEPENDS += "zynqmp-pmufw"
 BUILD_DEPENDS += ", zynqmp-pmufw:native"
@@ -39,5 +41,9 @@ S = "${WORKDIR}/u-boot-${U_BOOT_PV}"
 do_prepare_build_append() {
     cp ${WORKDIR}/ultra96-rules ${S}/debian/rules
 
-    echo "boot.bin /usr/lib/u-boot/ultra96" > ${S}/debian/u-boot-ultra96.install
+    echo "boot.bin /usr/lib/u-boot/ultra96-v${ULTRA96_VERSION}" > ${S}/debian/u-boot-ultra96-v${ULTRA96_VERSION}.install
+}
+
+dpkg_runbuild_prepend() {
+    export ULTRA96_VERSION=${ULTRA96_VERSION}
 }
diff --git a/recipes-core/customizations/files/.bash_history-ultra96 b/recipes-core/customizations/files/.bash_history-ultra96-v1
similarity index 100%
rename from recipes-core/customizations/files/.bash_history-ultra96
rename to recipes-core/customizations/files/.bash_history-ultra96-v1
diff --git a/recipes-core/customizations/files/postinst-ultra96 b/recipes-core/customizations/files/postinst-ultra96-v1
similarity index 100%
rename from recipes-core/customizations/files/postinst-ultra96
rename to recipes-core/customizations/files/postinst-ultra96-v1
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a752463dce9fef2247431da23bd6d5dc8e66f406.1601958694.git.jan.kiszka%40siemens.com.
