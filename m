Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJ7D5L5QKGQEQTH2XGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id A960428301A
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:52 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id y3sf3538866wrl.21
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876392; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ki9N1QOEnd1dexMEiaip1S8U1+cvDbRqHWcTxdNsulwEUWahuhBA1lH4kBREHwfn7p
         g2k+uYy1J7n05F5RfFsqQrepM2SICfdcBM97DGghYkKEnD9+bl5tRfzaxqCNxdBX0aqA
         Otm8pGc25jM/rFf3TVrabmzRM6Wf1px4IkZvIgNFHFvU4dfHbBLW3KK6+zaF0DH1CWZA
         e62rgYtoJbSOwXpuMYvgu4fn7UbDPNoeWngep7d71JO83R5ZtO1tYGoU76oBwDc4msef
         7SqiGEowcNrO908CjB7HgsRmzVNWCC9cnQ/rpCiuPZbzL1sbGfNMxpQSJBor/Ul8V5XJ
         muCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=7C444M/79WEo971SuGKGv559ANSbkBMNfGyLLSIusl4=;
        b=ixkTy94JywRS6bjChYFzPShEY5DzH6YZjamPVMtCdYWTXnLQ8ISlQC2nAo8XIGCmq5
         bhDrJ5PL44Bo3M3XnunaBdKL+jyxFDqUPT0nSW6Mj/gy8HaLXPYxMxIyAinc0AmMvYtL
         DcEwP3WdKLUW4f2ZzJF9ENuRckm1u4bHqvOh4D7ld7Yxx/uuUhDBj6pMRAoVB9R6ydWQ
         ErK+DlERcAxFiahcxDzuHAzbvfVj+tHnAZvIMcA3NyMdyCx1o7t27WEuFlJFceXvW/Vs
         WB28aa1NKAD5eOSvezN0EXzz9mFDYoogjiv05DteGT4Ddlh5WQ0nj+2q+LITTKchmXVx
         MEeQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7C444M/79WEo971SuGKGv559ANSbkBMNfGyLLSIusl4=;
        b=PmjnlIcqhkotygTo7y1Gn6vZr9uM/an5BVIKJ1Ik/xGqrGl9QTyVD1My4D+JCpxtB7
         LCSlQhKgFo+9WqRKTiA4SIc+D5H1DVRSSgzFxnVDNH1HbiQHgBWMD98QWJHb7ytFunlv
         OFXzi5u5nnjStMIY7DLR5pNy/8heB6IUwRF/+hphA+IN4XTCRLr13eroYBeY/e++abSN
         qiMlthXkwFfvfA++w5fNPsoqKBVTC+L6x9YQI7FdYJ4akh/c9JzZqUtZdcYIFbEt5rHN
         7CYAj2qBsGrsHiS2XmT7tekMt9mjV3kCoXgpcqEbiw/i5S2dS3/TlLMQ5aViTVLocm/F
         XdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7C444M/79WEo971SuGKGv559ANSbkBMNfGyLLSIusl4=;
        b=NYI0nZ8LPwZJD/35SBTyD+0XQZ1a2SWIc3mMK5peOZ7lupe/VL2hFygIbqBeVlVDYa
         jCBQZM/o7BEO5sIFhTBfXkoWXguSZLPFap+vlVSrJtLDXhDUSlUW/XpMwzZHWEedHOXC
         SEj9hqGv33/WvTkA+u/gWHkK/lx/ygTpv+7hLCMw4NpPJpZxUJzukWsobbA/li4oB1tL
         59UPR5LpYFQ4cCjGYTsk9F2LZSkMuGLn5yLTFGCFoOqaeeKqe7j0lY/LZlS0OiBUosKu
         Z60rC1OMNXUTFoIxkHG2TBkR+qlDYWR3hNoF6cb4oD312ETgvhBEZHN8DF5qFE8UuWei
         x6Zw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530khyhI0E+2mVPMJweXja7yz08d3hsZelhkww9CsP7+AEIA5uUT
	EzTQcwKus5Mm3viKRmVvSlg=
X-Google-Smtp-Source: ABdhPJwUtLhBLkRHCgcLVxjD5mqoySntEm5oGhgLpI9iP3h3vtr0whc+daPpq9mIpp0tt58pf8c6uw==
X-Received: by 2002:adf:f548:: with SMTP id j8mr16087914wrp.114.1601876392374;
        Sun, 04 Oct 2020 22:39:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cbc4:: with SMTP id n4ls4088802wmi.3.gmail; Sun, 04 Oct
 2020 22:39:51 -0700 (PDT)
X-Received: by 2002:a1c:32c6:: with SMTP id y189mr15567589wmy.51.1601876391155;
        Sun, 04 Oct 2020 22:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876391; cv=none;
        d=google.com; s=arc-20160816;
        b=EPQPHK7Fyp1gf/DEPWXVUCo8LiJIorphLI/x27t2HA5paB8TQKkMgfBX/qM2XV4h4a
         dbfnnzIx0WLI0BrPEUWxiuY2t2S8+TitkTJudD358vTHEYuFp2pV1YpPZTb9Lp0VV/af
         T/lPziK+UD5i/1FOqYgLwJ4ROuzmrDlMeuANWSB6XWhfv0pWNUx5MjY11MfDfhvmRKIp
         noJOBHIxQjUwJJtSMPBqr5+bkPLw/zeD+I09RjpwLKcEfIlfjTGU1P4ba7XWdaGxs0Ly
         ezNm1AFl9c2RZ+jJBe1pdZsbYsuD01nAc69NpAq2+7/eWkj7WJQAB6MdUuINBQesvg1K
         yvXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=5AIKpN2+s5kDvJLZm1kYG2r9NZGN/qkRQN98oweXVU8=;
        b=PiCeOO/DYHPpwOF5Ih72AuDtgyKPy4mlrBd8UDUrWbAjL4eviF1MONPFN2RzZbnPEu
         2cdxAkNo1zNK74M1Ed16T8VKuTAV+ykavVWh4GGS5KEnVreGlLb7rTH6e9mSsfeyXKRO
         9/QDfLKJuHV6DYbXDwRQ/S7VmSKvfDEAegX0WxNzR86AQawRwq+znXNJ+hKna0pHip1T
         bCv58ClkLKuFBmN5xko6oGy3uziHq/c6oh7mRH/8S+LJ77fhe+Js5rO4zp+a1GpzDA19
         2QarWIPgliVNWBL7NmI2LdszaUAIrLwK7WR6UN0YoWpXH5yh3BSaR8helDewvt99rME0
         hIDQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id b80si196888wme.1.2020.10.04.22.39.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0955doXY000902
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:50 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncA025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:50 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 01/19] ultra96: Rename to ultra96-v1
Date: Mon,  5 Oct 2020 07:39:31 +0200
Message-Id: <a752463dce9fef2247431da23bd6d5dc8e66f406.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a752463dce9fef2247431da23bd6d5dc8e66f406.1601876389.git.jan.kiszka%40siemens.com.
