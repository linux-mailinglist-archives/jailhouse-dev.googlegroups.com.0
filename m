Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWXB66BQMGQEHXESGTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A9B364CC6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:06:34 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id v20-20020a5d59140000b02901028c7a1f7dsf9658136wrd.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866394; cv=pass;
        d=google.com; s=arc-20160816;
        b=o3UeOb7blFErTi1ZlGad7RfZbOR4tuki7pYNkV96+z0Sjq5IdmY6NS52ulZzwabThW
         Mjwv1PlMdEmXgVJtgPoLTyhDHPZjkQY0SqkAhf9mcIbDf2cEfHQTAyntOeu0IsRhHp8i
         1AAiJhTfuEh6YxUomZDZLfkAs6s7BpSPyphzMOTDi1bKvveGAhTiaQsA83JKortGAp74
         6CVVb0vQjKoOEVg+6G5UzZgvPTR14U7m051VA9URhttFCJSA3pq7D/Ck2+MP9jnPRVC7
         vAyOOTMEUmtSeDag7dN0H8gAEomDAkW6zIsa8HVqS4GR+CeMVWq5c0RZoXRoU1F0DM8C
         zybw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :sender:dkim-signature;
        bh=rgM9pNQYUnEYONPCkUlWROMxMIL4sR5wIAJTULsdFhc=;
        b=bRDeppA4mx+UZte9XoeZN+eEYTGh+bPmwrFXLgFcmSOX9Gb8gsP7/n2twwZUEeh6sS
         y63+dYQEPoHGs8rExZ6kOCbwRqAE7zzTsMN4U8Mave2sBBCoMna6QCK+bHCD4qB9oBTe
         1AImATmZKH33I/AOjgrAKUs8gfpdYY9jhMKaitI5ilYtawZ26oDugbVcTXzw0ZBXCaiS
         LhFZJUdkgCx6fvV8o4RdjSe6JGcMt19UNegWvBFefuPktzx2SVbJWh7sytwTfYwgTorg
         iSWKFL4M0M8e9abBB/EVStD4w6zDXOPIWiFGZkFhgjVdjj4H6w/FGKo8wRZhaM8ylKV4
         yYLg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rgM9pNQYUnEYONPCkUlWROMxMIL4sR5wIAJTULsdFhc=;
        b=c41klW6tc6A6EcEyPX1r5cL83bDRfqJGE5FC7gwxyUm5lk+7ikVVKL9gI5qiiDjZbB
         It+y0Fh+VjhtgPxYm7q89niiPmUUHlJkdkpy9Vls61Q44go5csWf6QLzCs95t6sZ7ipq
         j9HC8nDbb79EyzUtVWPONOtxwLejynefrxnQYdLeCp3VhUllCxitDrclIwV0Zz8tMCaV
         JgkNTeNMx0WDlmbDs0w+RvYcm4TKH0U3PWvzbucE6PhY+06lGUgcBkL/86SCt3pSrVr8
         H2a4wynGmzuUai5jdY9zWDyBBrbtDB3z2Bldo9UZdQkLaimdFY0RmvRxB/JKqFJ7Vsbl
         aGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rgM9pNQYUnEYONPCkUlWROMxMIL4sR5wIAJTULsdFhc=;
        b=K5W3kLH+zObOCqdq0d00GSzIefkSVMRsxG76GuS9KJ5MvcIkoiJa+CfhQ8j3JsA8cq
         Y9/qithcFVNhqT3OhN5Z/IAqFrgpTieNQKkd8CAN6OR6+ACvN2OnSHh+4siIdpLMcSiB
         pA26hkWMtAkUDITn1Jh0Leliv+4cvMHI/0SHkGAGfpI36VXjUdUl5OAP1nFjHO2uNGjc
         NbHAMfmXo8SSNu3FKDyRLjvj2XGUWmznrA9vA8HfhqeFdEwPnruqhW58J3ECPdzRWHGp
         j1r7ecFRYMl/XTdX2Rz3UF+KDqnRBXk35ifpJJSHQXoF9QekIo/lIRa2dkbGdHxVVgKH
         sj1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530e9quXHo0aEkp2cJ5sBQHmu5pddhfzdsVt4ePynVnsPhgj35Ze
	OBfuPGVjrDR6U4sd5Cz2NgY=
X-Google-Smtp-Source: ABdhPJzJhsoz2wJE6hEz0hbMpzVcn50zKBP1lYV7Sqtnq67TbbjoXcO/JinctI0leLD/FAxrT4+77g==
X-Received: by 2002:a7b:c20c:: with SMTP id x12mr936282wmi.51.1618866394622;
        Mon, 19 Apr 2021 14:06:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6804:: with SMTP id w4ls9320284wru.2.gmail; Mon, 19 Apr
 2021 14:06:33 -0700 (PDT)
X-Received: by 2002:adf:dd08:: with SMTP id a8mr16620810wrm.252.1618866393773;
        Mon, 19 Apr 2021 14:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866393; cv=none;
        d=google.com; s=arc-20160816;
        b=TYKl1IB+oLhe32Wr9qgAHo478Pv9d28V6VBrmjDIcbMmAM+QVyWrnrNrruQeS92dV8
         njhsrfRG9WGZyQfxOGm6s/j70bN2cVY5U83u28xi6V9zXwvkOThPLzw66OKRJYayDOx4
         DBPlcZo26/sWV4TmIHDhyUrgCBnLLz6r1cb7tlnEmgtpc9nDFH0Cqxf9BbVnkqj5RKzW
         qmRnzjxn7ZWVio5V6QoanxHlg6aX7DLG+N8ifzMSx6hsuEJcMC24Yv3/58H1uOBCHqFA
         uYzfftbtPUegmikWIi9TfXGRzk4E4WE/YL5aV59E4drc341eklWcDyNXQ174DpiyxQCs
         VAiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=0XBwSMt4Sx9ZoIESOGCsx4Z9g3QGSXP2KCs+O1Gky4Q=;
        b=dJKVSaCNyetZ0s/B2uYFJ6mO1Z/9g0GF7TvRBz29lmPV7sja1K2zvetXZdO7NUwBW9
         U/TSwiHDcytdSuKCXxgmRzoSdY1c9H2hE2Eg98jX8A3gGQuR0pZGUGHe2CFX/pmQX7Tp
         X9Hpg9KzOL8LPZAHYOx3unlcu9ah413DFhfHigyILN9v9jaJFj+Ire1FrKpexQ/cKr3C
         /sKAjovgZ6M9Ix7ZA8Va35CQ8sxFPMHYZ8qqO1ovRM0qgdA+OLhymBZpuIqToU77csbV
         8nd+pC+jZlTdLMBqeON6uh0kk1Y/0DILGXjYGpEkSZ8MH0Fos3AGdLnY19KO5E4FyJ39
         r+vQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id y16si1043325wrh.3.2021.04.19.14.06.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:06:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JL6X2I022127
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:33 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6Tpg015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:33 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 13/20] wks files: Tune ext4 file systems to not be affected by y2038 issue
Date: Mon, 19 Apr 2021 23:06:22 +0200
Message-Id: <1237e6ba658892fff85670a0bcb3eb223f99ca9e.1618866389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1618866389.git.jan.kiszka@siemens.com>
References: <cover.1618866389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

As we are generating minimal images, their rootfs sizes may be below the
threshold that requires 256-byte or larger inodes. But those are
required to carry 64-bit time values, needed to avoid the y2038 problem.
Latest wic warns about this, so account for it.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 wic/espressobin.wks   | 2 +-
 wic/hikey620.wks      | 2 +-
 wic/ipc127e.wks       | 2 +-
 wic/macchiatobin.wks  | 2 +-
 wic/nuc6cay.wks       | 2 +-
 wic/orangepi-zero.wks | 2 +-
 wic/pine64-plus.wks   | 2 +-
 wic/rpi4.wks          | 2 +-
 wic/ultra96.wks       | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/wic/espressobin.wks b/wic/espressobin.wks
index 330d70f..3b2ca07 100644
--- a/wic/espressobin.wks
+++ b/wic/espressobin.wks
@@ -9,6 +9,6 @@
 # SPDX-License-Identifier: MIT
 #
=20
-part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label platf=
orm --align 1024 --sourceparams "no_initrd=3Dyes,script_prepend=3Dsetenv de=
vtype mmc;setenv devnum 0;setenv distro_bootpart 1;setenv fdt_addr_r 0x4f00=
000;setenv fdtfile marvell/armada-3720-espressobin.dtb;setenv kernel_addr_r=
 0x5000000"
+part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --mkfs-extrao=
pts "-T default" --label platform --align 1024 --sourceparams "no_initrd=3D=
yes,script_prepend=3Dsetenv devtype mmc;setenv devnum 0;setenv distro_bootp=
art 1;setenv fdt_addr_r 0x4f00000;setenv fdtfile marvell/armada-3720-espres=
sobin.dtb;setenv kernel_addr_r 0x5000000"
=20
 bootloader --append "rw rootwait mem=3D768M"
diff --git a/wic/hikey620.wks b/wic/hikey620.wks
index e91fd99..9fe9e70 100644
--- a/wic/hikey620.wks
+++ b/wic/hikey620.wks
@@ -11,6 +11,6 @@
=20
 part /boot --source bootimg-efi-isar --sourceparams "loader=3Dgrub-efi" --=
ondisk mmcblk1 --label efi --part-type EF00 --align 1024
=20
-part / --source rootfs --ondisk mmcblk1 --fstype ext4 --label platform --a=
lign 1024 --use-uuid
+part / --source rootfs --ondisk mmcblk1 --fstype ext4 --mkfs-extraopts "-T=
 default" --label platform --align 1024 --use-uuid
=20
 bootloader --ptable gpt --timeout=3D3 --append "mem=3D1820M"
diff --git a/wic/ipc127e.wks b/wic/ipc127e.wks
index c11f9d1..777d446 100644
--- a/wic/ipc127e.wks
+++ b/wic/ipc127e.wks
@@ -11,6 +11,6 @@
=20
 part /boot --source bootimg-efi-isar --sourceparams "loader=3Dgrub-efi" --=
ondisk sda --label efi --part-type EF00 --align 1024
=20
-part / --source rootfs --ondisk sda --fstype ext4 --label platform --align=
 1024 --use-uuid
+part / --source rootfs --ondisk sda --fstype ext4 --mkfs-extraopts "-T def=
ault" --label platform --align 1024 --use-uuid
=20
 bootloader --ptable gpt --timeout 3 --append "intel_iommu=3Doff memmap=3D8=
2M\$0x3a000000"
diff --git a/wic/macchiatobin.wks b/wic/macchiatobin.wks
index ead8b14..021abbe 100644
--- a/wic/macchiatobin.wks
+++ b/wic/macchiatobin.wks
@@ -11,6 +11,6 @@
=20
 part u-boot --source rawcopy --sourceparams "file=3D/usr/lib/trusted-firmw=
are-a/macchiatobin/flash-image.bin" --no-table --align 2048 --size 2M
=20
-part / --source rootfs-u-boot --ondisk mmcblk1 --fstype ext4 --label platf=
orm --active --align 1024 --sourceparams "no_initrd=3Dyes"
+part / --source rootfs-u-boot --ondisk mmcblk1 --fstype ext4 --mkfs-extrao=
pts "-T default" --label platform --active --align 1024 --sourceparams "no_=
initrd=3Dyes"
=20
 bootloader --append "rw rootwait cma=3D32M mem=3D3840M"
diff --git a/wic/nuc6cay.wks b/wic/nuc6cay.wks
index 341e948..a8cbff9 100644
--- a/wic/nuc6cay.wks
+++ b/wic/nuc6cay.wks
@@ -11,6 +11,6 @@
=20
 part /boot --source bootimg-efi-isar --sourceparams "loader=3Dgrub-efi" --=
ondisk sda --label efi --part-type EF00 --align 1024
=20
-part / --source rootfs --ondisk sda --fstype ext4 --label platform --align=
 1024 --use-uuid
+part / --source rootfs --ondisk sda --fstype ext4 --mkfs-extraopts "-T def=
ault" --label platform --align 1024 --use-uuid
=20
 bootloader --ptable gpt --timeout 3 --append "rootwait intel_iommu=3Doff m=
emmap=3D82M\$0x3a000000"
diff --git a/wic/orangepi-zero.wks b/wic/orangepi-zero.wks
index df0b6d2..9482e13 100644
--- a/wic/orangepi-zero.wks
+++ b/wic/orangepi-zero.wks
@@ -11,6 +11,6 @@
=20
 part u-boot --source rawcopy --sourceparams "file=3D/usr/lib/u-boot/orange=
pi_zero/u-boot-sunxi-with-spl.bin" --no-table --align 8
=20
-part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label platf=
orm --align 1024 --sourceparams "no_initrd=3Dyes,script_prepend=3Dsetenv fd=
t_high 0xffffffff"
+part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --mkfs-extrao=
pts "-T default" --label platform --align 1024 --sourceparams "no_initrd=3D=
yes,script_prepend=3Dsetenv fdt_high 0xffffffff"
=20
 bootloader --append "mem=3D128M vmalloc=3D512M"
diff --git a/wic/pine64-plus.wks b/wic/pine64-plus.wks
index 307e355..ca077e9 100644
--- a/wic/pine64-plus.wks
+++ b/wic/pine64-plus.wks
@@ -11,6 +11,6 @@
=20
 part u-boot --source rawcopy --sourceparams "file=3D/usr/lib/u-boot/pine64=
-plus/u-boot-sunxi-with-spl.bin" --no-table --align 8
=20
-part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label platf=
orm --align 1024 --active --sourceparams "no_initrd=3Dyes"
+part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --mkfs-extrao=
pts "-T default" --label platform --align 1024 --active --sourceparams "no_=
initrd=3Dyes"
=20
 bootloader --append "rootwait mem=3D1792M"
diff --git a/wic/rpi4.wks b/wic/rpi4.wks
index 2d10b99..d895eec 100644
--- a/wic/rpi4.wks
+++ b/wic/rpi4.wks
@@ -11,7 +11,7 @@
=20
 part --source bootimg-partition --ondisk mmcblk0 --fstype vfat --label boo=
t --align 1 --size 32 --overhead-factor 1 --extra-space 0
=20
-part / --source rootfs --ondisk mmcblk0 --fstype ext4 --label platform --a=
lign 1024 --active
+part / --source rootfs --ondisk mmcblk0 --fstype ext4 --mkfs-extraopts "-T=
 default" --label platform --align 1024 --active
=20
 # silence wic
 bootloader
diff --git a/wic/ultra96.wks b/wic/ultra96.wks
index 41d092e..06db02a 100644
--- a/wic/ultra96.wks
+++ b/wic/ultra96.wks
@@ -11,6 +11,6 @@
=20
 part --source bootimg-partition --ondisk mmcblk0 --fstype vfat --label boo=
t --align 1 --size 16 --overhead-factor 1 --extra-space 0
=20
-part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label platf=
orm --align 1024 --active --sourceparams "no_initrd=3Dyes"
+part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --mkfs-extrao=
pts "-T default" --label platform --align 1024 --active --sourceparams "no_=
initrd=3Dyes"
=20
 bootloader --append "rootwait mem=3D1820M"
--=20
2.26.2

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1237e6ba658892fff85670a0bcb3eb223f99ca9e.1618866389.git.jan.k=
iszka%40siemens.com.
