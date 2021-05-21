Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJ46T2CQMGQENYJDWWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id D507F38C52D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:44:55 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id p10-20020a19f10a0000b02901d675ef8fb8sf5035248lfh.16
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:44:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593895; cv=pass;
        d=google.com; s=arc-20160816;
        b=0vOb6+qy8Li112JUAFrbIRB4XRh1wcLksHppVMtit5X5+sVGXtwjLNzPJnH3X/6994
         iVOeNGmP1kAUYOHbk8GHkM0bceWhl7q4XlE99q6WlcyM3SJnDtgsvINIPLfpbMSKkKLq
         wTiCh8pjprhbxAJSsks94zjl2is9Aq+dcSQetMSdP6uPR/wwCYBduGTqO4Naow5Jm7Mw
         5MdC7tDQl6FGEFxlmch0y81TpXtzwC8M6b7O+8vbrxFZ6LnnHZN5LCdp3GchjiJAFggz
         nrXc/aUubIV9ADu7eJsYhUeIfHiAv+q5xQgT5+CNZ/Wabfj0//Fu6XV632m4GVHrWdSj
         l32w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :sender:dkim-signature;
        bh=VUlfZmh9J61b2dsUHza7vbnaLhWkFhHiqTTWMQp3iLk=;
        b=Aw49So9CqTMKHCb1zLT9IUERcespsb0yt0/q+E42DX8Z7ZLIi202EgQq35OivV9ruo
         C8/D8S0jb0j6MOfy4bpXqrL/NRqpZyMDD2wsW3I3PgJpwBWLId7NIX2SdFj+veyTOZHK
         PWfIFlzjzmKwTEAb3lXKYlBEN2HnDvpvz3nkjtiswBiOUSHT4L29CiuDG3malEYpXY90
         KVK3f42zQ/oTzWsNZJpPdGziuvievJEMPihRl5Vzw+2mM9SZZ8oxWOrKGvWujVEMrBTK
         1bBf2QvQepMSAUNvwheo7EnXNOa+tHwoJ72KrZGrd5HC6PYU/X3nipibKLy1OnSpGoF6
         7z7w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VUlfZmh9J61b2dsUHza7vbnaLhWkFhHiqTTWMQp3iLk=;
        b=BUeEz2pLI+Rll812cPu/SQlThRY1/xPGLd8UEdFSdVYi7MQ7ACbKDTfJv3d/6at9HI
         rb6b9Z4LseRKA1S0vzcQi5xvP3Y11bHHhpIJJn0V7oaQ7rS2Ga5kqHcx+QTC6C3gOWEp
         ilPP/qtm3g52wrIbJ1WEBc5ePRQX9bC8H3q68KQhVO+spBRr3X5EPqmWkUr0s14Ue8yS
         YhDiJuLtwkHABEXvtNCGioXDL9JvYycoRqg25LLxmZtpJJgAnrwNJttPBzYdGWBPQABB
         eECTlubU20q8cgFF/gCBjNFfaPyPhkpLTDdB1ZMoNBW6mzbFvt0BkTmdcb0+YXKuD3K2
         vkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=VUlfZmh9J61b2dsUHza7vbnaLhWkFhHiqTTWMQp3iLk=;
        b=UVozK1uvFvJpYk2hy3dbAZbhqYhl4F4PrvOl3ltwc/5kFx5IWBSngIbW/ahLA5hedq
         vlXtsei4zVzpSGwMwdbq+nTM3j34KIewcQneoA9sYA7G+tlJaWUu6X49NYtwBfOKoUAF
         1b60DTTLFiQzAChbe31EEPhrKKuCspsZHWjxSpUB6nfwU1xPtfpvvmeap9r9D24jNlfZ
         vbpgBhjNYew62lNudDJhAhQch/hJiL4YXDYMsv04j4uczbrxyGhOci1xe49nVnLOlYI5
         AqGxvoCcJRTYgDB5R2MyWCj/+X05TPyCfHmvWZ7JsenSgwC1IZpTSp53hbMhmKidTUHu
         i03Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Zn0j34So2dafqMkvnDkUExDzKINdcRTv45hmQbnVhL45dx4ZG
	DV/K8i9LRZQzlbLvik7PXgw=
X-Google-Smtp-Source: ABdhPJyN1KIEFnpjn+kfqvGcnUS6PR1+5jB2bz51KkcptdQrE03HebhM7Zr9EtGCxZRPUG3r9ChxXw==
X-Received: by 2002:a19:7416:: with SMTP id v22mr1785495lfe.13.1621593895448;
        Fri, 21 May 2021 03:44:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6d09:: with SMTP id i9ls1147055ljc.2.gmail; Fri, 21 May
 2021 03:44:54 -0700 (PDT)
X-Received: by 2002:a2e:808a:: with SMTP id i10mr6536422ljg.288.1621593894253;
        Fri, 21 May 2021 03:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593894; cv=none;
        d=google.com; s=arc-20160816;
        b=SvA1JA6rDHT1uUScslsiXIRErlLugS9kVZK0iErh0awWUKvj/qEOAFFJEfvbV2w7SR
         eqLR7kvVwhiFiUOSkKieKCsYEMrALD352tJjHY/UHV8z0/lc8T8kRqiB5Q3zd66nk0Qq
         mYImH4eGRq3UpXuoi0m9pFCPQMCxQ5XCg6zbUu5wUEXKsv0UdTgB0r5WnB7d8QP5el10
         mh7s6yf7No5l/miaNJ9Uc63MLmtBAAw4xFYit/vprivCmPZrRRABivP395l3Jh1KJ5QX
         O8AY03fNjTYIpJEUzDZ9RE8h4aIT0yKcxFW5zupSLWukMWiUJCtfSEVlf7cihuFT7en8
         1DCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=0XBwSMt4Sx9ZoIESOGCsx4Z9g3QGSXP2KCs+O1Gky4Q=;
        b=n600wv8K+ZlIz9LADMg08y+jQACC4F72t9XCWVy2+3kXw2XU6an4jyFi3RbIVHlhrq
         tk38fF2tqDctdClAACvo6GX/HqxOFhb7jzR15p0DEz/VWLtq7DW55zELBy4+2HgAfs1L
         gRIWCrRX8aNb4CdhLUqh7JR4xU8e17RahK/mGNGCCiz9id4ZjfTpO4+L+03VxqBPUZH/
         sBjJSmzooeyiOFyhkEZpdS+4Q/LQIn9q3Vak7OD8bCe9n2URbg+tB1XVAHfO15HDaKz9
         lkusOoaBjPy+k8wBCtjXtqOKtxN2AQcTfCBuMmIDyRLolMt4XVJ0VoIFF6CRJvErYDdm
         gS2Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id f14si238307lfv.2.2021.05.21.03.44.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:44:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAiriv024422
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:44:53 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcI032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:38 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 13/22] wks files: Tune ext4 file systems to not be affected by y2038 issue
Date: Fri, 21 May 2021 12:37:25 +0200
Message-Id: <458c46922e2d618e69799be74a6ec70e91c88022.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
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
jailhouse-dev/458c46922e2d618e69799be74a6ec70e91c88022.1621593454.git.jan.k=
iszka%40siemens.com.
