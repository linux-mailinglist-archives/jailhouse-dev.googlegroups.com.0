Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBI7GTPUQKGQEAZQ4MNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C1365325
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 10:28:20 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id l4sf1283559lja.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 01:28:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562833700; cv=pass;
        d=google.com; s=arc-20160816;
        b=LT5jPRzOrKER3vnOqDRIzLB84O+tc4mGH6gsXZr2aa+npW4UdnALAt0acBOZmd6M6c
         33UwlKmRhvA9TYrZyRvT2qdRvbNC7jB5YhOXI20TqAcj5Gqnh0DpzxOgNQixhNLdXiue
         T8qCppu0D4EVZqDDMqRckyLrtNZ5YCLJ6ZdLrDGqO6VpnWDsZ8WGzWqeULhQm5eTuB29
         TbFauJPMem/k/6SWYM01UBTlMj8f+xt8GFT5OXMYgZmu9PsV4bMq7T0ZIBL9INoPP3gB
         gALYy2T1NJ9oxjBRTgu9VEW98BOxGvpCtn/pwL/q15e8MC5IVNPaGzU+tE7PxML0WdLU
         hKDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=LUQLneKfvUOxKAAjv/kG+MzTQ4BXvGMu3ujOLnd400Q=;
        b=QD/pTbIiConMVd3bbvywzBwo8zw8s/Y5FEQsuwq3pQc4pPVTGdvwzP9tHA0LcnpDWt
         x3py5o+FYRDxBY0KVR6mJeaHKUju6IBRdOp28/HP5HH7WAzQ+Dg6NLEiwD6Y/pXK9XVx
         LAHk0Q9TXA1CfKnrcitwTrEPoH5CNoxxdBkPkdOpRNWoIBgo0TrFj7TqlRGzhFBcjgU3
         1gkVcIp5l4cp9WjvTg47/EMBPCw9nXBzfDJWepwfzTK3mxNYLBnbNf3J1x3DrFWj2/v3
         svMQs71YokwKRrNUbz7a602lhQrR5XXwTg38SjM/PnEGcS73oPLrBacsdrtmvDoOY6v0
         r6wQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LUQLneKfvUOxKAAjv/kG+MzTQ4BXvGMu3ujOLnd400Q=;
        b=ncfAcK0fclSMCd6U5mGoeq9656J4g9YJmAyCIjrJQUgrhcAP+GBIB4I5Yr+otiNYhO
         z28wRT3QIRtR7U7GALEUPZxZPUwQGrUMKn9VbpPPdi3ho/BLuS9/in9U69A6EvFFixHX
         VHh3aDtSYDslForYG1CR59jNewfn+GSCSS/az1LdVlI0CJp/TqYch5Yw7+pTN7SUeh1F
         7+joTNzyEvrY5ko/D8Caf+zTTCJSlvAzGXv2htOiWKPtdxt1A+QZJ2Uiopdc7OeFyBWf
         mjnvXpL8BMEcf3cGqRZTeBTw9eyAirGGTohdCgNMMq94WBzXq2y3JHNhPXZJyJtO7sw1
         CKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=LUQLneKfvUOxKAAjv/kG+MzTQ4BXvGMu3ujOLnd400Q=;
        b=CyFrDyOsT+ufxMR5boEtfBL+wsKGaFVzLYc45/EUnWMaMAwBeOZja6WuA7mz6OenXV
         N8tjxkhbSBJJ5+fbA65kvaz0HWsebgplkSG5MlCMFTUfy+2BIx/d/zCfuQEsVBjoV7VZ
         fxFzn3XoIADmKhnmPyHiE83AjuvEerePANdrQ1rev94JqC+6KlXkpjYfNVUy2U9C2ge1
         F+HUzUFyWLvZykMK8JUQtamfhT/DogI2cIkyJtS1EocphR3AEKzU6Pg1w3UptniZ782R
         ulawHkDoRs7hnFejsXdJq0BBzTzJRmd7O8yzxE3B2W8BllsEdBZ2ZHe0g6P8mwO9eMKb
         T87Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXJhgevMnwv488rLYCbjZVIz0cZjrJ5TsiKgW0kKXCIZcZW4QZu
	365mYz6qCgwHAZ2r7Nu6vH4=
X-Google-Smtp-Source: APXvYqwChwaLBBKbC9FAHsr++Im1Baz4AB66EUnbMB0/hMYDRhlTGij9Oy1nwJPxhBVqM7Wjo2q+9w==
X-Received: by 2002:a2e:2bd3:: with SMTP id r80mr1695293ljr.23.1562833699963;
        Thu, 11 Jul 2019 01:28:19 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6556:: with SMTP id z83ls618713ljb.11.gmail; Thu, 11 Jul
 2019 01:28:19 -0700 (PDT)
X-Received: by 2002:a2e:2411:: with SMTP id k17mr1729272ljk.136.1562833698944;
        Thu, 11 Jul 2019 01:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562833698; cv=none;
        d=google.com; s=arc-20160816;
        b=MPBDYfX6DZ1Oagon0LutVBYKvm56eWSSSwWLY+yoeR6wfLpMwx9HqRFF22a0NVEEbq
         OmxFVgrhNoLQyai5Hc1FqeH6pff8AQmPZwWGGFpbtbKBmC746eUiI6gI9nMAfmfuIl5p
         XITtMqaFXZ66Rtd8dBEiUS0ljeG6r/CmrCusGdXplCvYl8gxYdWsA7Qmy+oF0t0iCvsG
         Qk7STk+Lhjy2UP6D9HzquQafbfNxzP9jUQAVaimhRNHIsxF7981P49coaWHM3w5gpMZC
         qxEI5rGlSRObfF0x0u4mLWSb9yCD2KYaUiU0Ze+LHAFeiWal6vThe0kQVB47mc/vYTt9
         F5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=3K3ecRSGknOWgczouICZogEOlVJg13NW5Wk70qlSxAM=;
        b=zniSwNkpmwzCP6bet/sS61on89XKpfX6VWCUtJVDNkrVpCOPsvLaEdP2PNj7vA6Zez
         BT5gNMwMWv/EjEU3bMuiXMI3vbe0aQxVmCzDgrTfccnKj4Q0GizUSPJCqMjls+ic+CsY
         tquXQEfT/7VLBC/o2e4VUWALV/BfHuJuJiC1UUWFg5EMPbeaCXBXsLbSqra5/h3ljcZL
         EqEScJ2IbTv+e9IO6HnBnbjwDJpvXO9AuKGsQzxkFnQUtnaRfJUu2Or4oXmqiRfMXiQ/
         pamzFKhh9XN58wiwuVy9ltVKPX73W26CoVDdRKeJiiqASZprAqAWPY8gOA1VCUWS3Cp7
         eNVg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id v29si297937lfq.2.2019.07.11.01.28.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 01:28:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x6B8SHHX009534
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:18 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.22.161])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6B8SG7O010515
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:17 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 2/8] non-root-initramfs: Update to 2019.02.2
Date: Thu, 11 Jul 2019 10:28:10 +0200
Message-Id: <33efd0705737377ff58361be883f2a60cfbca918.1562833696.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1562833696.git.jan.kiszka@siemens.com>
References: <cover.1562833696.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1562833696.git.jan.kiszka@siemens.com>
References: <cover.1562833696.git.jan.kiszka@siemens.com>
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-core/non-root-initramfs/files/amd64-config | 376 ++++++++++++++-----
 recipes-core/non-root-initramfs/files/arm64-config | 398 +++++++++++++++++----
 recipes-core/non-root-initramfs/files/armhf-config | 379 +++++++++++++++-----
 ...018.05.1.bb => non-root-initramfs_2019.02.2.bb} |   4 +-
 4 files changed, 911 insertions(+), 246 deletions(-)
 rename recipes-core/non-root-initramfs/{non-root-initramfs_2018.05.1.bb => non-root-initramfs_2019.02.2.bb} (81%)

diff --git a/recipes-core/non-root-initramfs/files/amd64-config b/recipes-core/non-root-initramfs/files/amd64-config
index 498f156..ccf4537 100644
--- a/recipes-core/non-root-initramfs/files/amd64-config
+++ b/recipes-core/non-root-initramfs/files/amd64-config
@@ -1,6 +1,6 @@
 #
 # Automatically generated file; DO NOT EDIT.
-# Buildroot 2018.05.1 Configuration
+# Buildroot 2019.02.2 Configuration
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_HOST_GCC_AT_LEAST_4_5=y
@@ -10,6 +10,7 @@ BR2_HOST_GCC_AT_LEAST_4_8=y
 BR2_HOST_GCC_AT_LEAST_4_9=y
 BR2_HOST_GCC_AT_LEAST_5=y
 BR2_HOST_GCC_AT_LEAST_6=y
+BR2_HOST_GCC_AT_LEAST_7=y
 
 #
 # Target options
@@ -36,6 +37,7 @@ BR2_ARCH_HAS_MMU_MANDATORY=y
 # BR2_powerpc is not set
 # BR2_powerpc64 is not set
 # BR2_powerpc64le is not set
+# BR2_riscv is not set
 # BR2_sh is not set
 # BR2_sparc is not set
 # BR2_sparc64 is not set
@@ -82,7 +84,6 @@ BR2_GIT="git"
 BR2_CVS="cvs"
 BR2_LOCALFILES="cp"
 BR2_SCP="scp"
-BR2_SSH="ssh"
 BR2_HG="hg"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
@@ -125,6 +126,7 @@ BR2_GLOBAL_PATCH_DIR=""
 # Advanced
 #
 # BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
+# BR2_FORCE_HOST_BUILD is not set
 # BR2_REPRODUCIBLE is not set
 
 #
@@ -162,19 +164,15 @@ BR2_TOOLCHAIN_BUILDROOT_LIBC="uclibc"
 #
 # Kernel Header Options
 #
-# BR2_KERNEL_HEADERS_3_2 is not set
-# BR2_KERNEL_HEADERS_4_1 is not set
 # BR2_KERNEL_HEADERS_4_4 is not set
 # BR2_KERNEL_HEADERS_4_9 is not set
-# BR2_KERNEL_HEADERS_4_10 is not set
-# BR2_KERNEL_HEADERS_4_11 is not set
-# BR2_KERNEL_HEADERS_4_12 is not set
-# BR2_KERNEL_HEADERS_4_13 is not set
 # BR2_KERNEL_HEADERS_4_14 is not set
-# BR2_KERNEL_HEADERS_4_15 is not set
-BR2_KERNEL_HEADERS_4_16=y
+BR2_KERNEL_HEADERS_4_19=y
+# BR2_KERNEL_HEADERS_4_20 is not set
 # BR2_KERNEL_HEADERS_VERSION is not set
-BR2_DEFAULT_KERNEL_HEADERS="4.16.17"
+# BR2_KERNEL_HEADERS_CUSTOM_TARBALL is not set
+# BR2_KERNEL_HEADERS_CUSTOM_GIT is not set
+BR2_DEFAULT_KERNEL_HEADERS="4.19.36"
 BR2_PACKAGE_LINUX_HEADERS=y
 
 #
@@ -195,10 +193,12 @@ BR2_UCLIBC_TARGET_ARCH="x86_64"
 #
 # Binutils Options
 #
+BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI=y
 # BR2_BINUTILS_VERSION_2_28_X is not set
 # BR2_BINUTILS_VERSION_2_29_X is not set
-BR2_BINUTILS_VERSION_2_30_X=y
-BR2_BINUTILS_VERSION="2.30"
+# BR2_BINUTILS_VERSION_2_30_X is not set
+BR2_BINUTILS_VERSION_2_31_X=y
+BR2_BINUTILS_VERSION="2.31.1"
 BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
 
 #
@@ -207,9 +207,9 @@ BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
 # BR2_GCC_VERSION_4_9_X is not set
 # BR2_GCC_VERSION_5_X is not set
 # BR2_GCC_VERSION_6_X is not set
-BR2_GCC_VERSION_7_X=y
-BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
-BR2_GCC_VERSION="7.3.0"
+# BR2_GCC_VERSION_7_X is not set
+BR2_GCC_VERSION_8_X=y
+BR2_GCC_VERSION="8.3.0"
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
@@ -225,14 +225,17 @@ BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS=y
 # Host GDB Options
 #
 # BR2_PACKAGE_HOST_GDB is not set
+BR2_PACKAGE_GDB_NEEDS_CXX11=y
 
 #
 # Toolchain Generic Options
 #
+BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS=y
+BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK=y
 BR2_INSTALL_LIBSTDCPP=y
 BR2_TOOLCHAIN_HAS_THREADS=y
 BR2_TOOLCHAIN_HAS_THREADS_NPTL=y
-BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
+BR2_TOOLCHAIN_HAS_UCONTEXT=y
 BR2_TOOLCHAIN_SUPPORTS_PIE=y
 BR2_USE_MMU=y
 BR2_TARGET_OPTIMIZATION=""
@@ -275,7 +278,10 @@ BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16=y
-BR2_TOOLCHAIN_HEADERS_AT_LEAST="4.16"
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST="4.19"
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_3=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_4=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_5=y
@@ -286,7 +292,8 @@ BR2_TOOLCHAIN_GCC_AT_LEAST_4_9=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_5=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_6=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_7=y
-BR2_TOOLCHAIN_GCC_AT_LEAST="7"
+BR2_TOOLCHAIN_GCC_AT_LEAST_8=y
+BR2_TOOLCHAIN_GCC_AT_LEAST="8"
 BR2_TOOLCHAIN_HAS_MNAN_OPTION=y
 BR2_TOOLCHAIN_HAS_SYNC_1=y
 BR2_TOOLCHAIN_HAS_SYNC_2=y
@@ -301,15 +308,17 @@ BR2_TOOLCHAIN_HAS_LIBQUADMATH=y
 #
 BR2_ROOTFS_SKELETON_DEFAULT=y
 # BR2_ROOTFS_SKELETON_CUSTOM is not set
-# BR2_ROOTFS_MERGED_USR is not set
 BR2_TARGET_GENERIC_HOSTNAME="jailhouse"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
-BR2_TARGET_GENERIC_PASSWD_MD5=y
-# BR2_TARGET_GENERIC_PASSWD_SHA256 is not set
+BR2_TARGET_GENERIC_PASSWD_SHA256=y
 # BR2_TARGET_GENERIC_PASSWD_SHA512 is not set
-BR2_TARGET_GENERIC_PASSWD_METHOD="md5"
+BR2_TARGET_GENERIC_PASSWD_METHOD="sha-256"
 BR2_INIT_BUSYBOX=y
 # BR2_INIT_SYSV is not set
+
+#
+# systemd needs a glibc toolchain w/ SSP, headers >= 3.10
+#
 # BR2_INIT_NONE is not set
 # BR2_ROOTFS_DEVICE_CREATION_STATIC is not set
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
@@ -320,6 +329,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 #
 BR2_ROOTFS_DEVICE_TABLE="system/device_table.txt"
 # BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES is not set
+# BR2_ROOTFS_MERGED_USR is not set
 BR2_TARGET_ENABLE_ROOT_LOGIN=y
 BR2_TARGET_GENERIC_ROOT_PASSWD=""
 BR2_SYSTEM_BIN_SH_BUSYBOX=y
@@ -341,6 +351,7 @@ BR2_TARGET_GENERIC_GETTY_TERM="vt100"
 BR2_TARGET_GENERIC_GETTY_OPTIONS=""
 BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
 BR2_SYSTEM_DHCP=""
+BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
 # BR2_ENABLE_LOCALE_PURGE is not set
 
 #
@@ -425,7 +436,7 @@ BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 #
 
 #
-# kodi needs an OpenGL EGL with either an openGL or an OpenGL ES backend
+# kodi needs an OpenGL EGL backend with OpenGL support
 #
 # BR2_PACKAGE_LAME is not set
 # BR2_PACKAGE_MADPLAY is not set
@@ -438,6 +449,7 @@ BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 # miraclecast needs systemd and a glibc toolchain w/ threads and wchar
 #
 # BR2_PACKAGE_MJPEGTOOLS is not set
+BR2_PACKAGE_MJPEGTOOLS_SIMD_SUPPORT=y
 # BR2_PACKAGE_MODPLUGTOOLS is not set
 # BR2_PACKAGE_MOTION is not set
 
@@ -451,7 +463,7 @@ BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 # BR2_PACKAGE_MUSEPACK is not set
 
 #
-# ncmpc needs a toolchain w/ wchar, threads
+# ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 4.9
 #
 # BR2_PACKAGE_OPUS_TOOLS is not set
 BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
@@ -479,7 +491,7 @@ BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
 #
 
 #
-# vlc needs a toolchain w/ C++, dynamic library, wchar, threads, headers >= 3.7
+# vlc needs a toolchain w/ C++, dynamic library, wchar, threads, gcc >= 4.9, headers >= 3.7
 #
 # BR2_PACKAGE_VORBIS_TOOLS is not set
 # BR2_PACKAGE_WAVPACK is not set
@@ -498,6 +510,7 @@ BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
 #
 # p7zip needs a toolchain w/ threads, wchar, C++
 #
+# BR2_PACKAGE_PIGZ is not set
 
 #
 # pixz needs a toolchain w/ threads, wchar
@@ -516,6 +529,10 @@ BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
 # BR2_PACKAGE_BLKTRACE is not set
 # BR2_PACKAGE_BONNIE is not set
 BR2_PACKAGE_CACHE_CALIBRATOR=y
+
+#
+# clinfo needs an OpenCL provider
+#
 # BR2_PACKAGE_DHRYSTONE is not set
 # BR2_PACKAGE_DIEHARDER is not set
 # BR2_PACKAGE_DMALLOC is not set
@@ -590,6 +607,7 @@ BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS=y
 # oprofile needs a toolchain w/ C++, wchar
 #
 # BR2_PACKAGE_PAX_UTILS is not set
+# BR2_PACKAGE_PCM_TOOLS is not set
 # BR2_PACKAGE_PV is not set
 
 #
@@ -605,13 +623,10 @@ BR2_PACKAGE_RT_TESTS=y
 # BR2_PACKAGE_SPIDEV_TEST is not set
 # BR2_PACKAGE_STRACE is not set
 # BR2_PACKAGE_STRESS is not set
+# BR2_PACKAGE_STRESS_NG is not set
 
 #
-# stress-ng needs a glibc toolchain w/ dynamic library, headers >= 3.3
-#
-
-#
-# sysdig needs a toolchain w/ C++, gcc >= 4.8, dynamic library and a Linux kernel to be built
+# sysdig needs a glibc or uclibc toolchain w/ C++, gcc >= 4.8, dynamic library and a Linux kernel to be built
 #
 
 #
@@ -627,6 +642,7 @@ BR2_PACKAGE_TRINITY_ARCH_SUPPORTS=y
 # BR2_PACKAGE_UCLIBC_NG_TEST is not set
 BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS=y
 # BR2_PACKAGE_VALGRIND is not set
+# BR2_PACKAGE_VMTOUCH is not set
 # BR2_PACKAGE_WHETSTONE is not set
 
 #
@@ -644,6 +660,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7, NPTL
 #
 # BR2_PACKAGE_CPPUNIT is not set
+# BR2_PACKAGE_CUNIT is not set
 
 #
 # cvs needs a toolchain w/ wchar
@@ -689,6 +706,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # curlftpfs needs a toolchain w/ wchar, threads, dynamic library
 #
+# BR2_PACKAGE_DAVFS2 is not set
 
 #
 # dosfstools needs a toolchain w/ wchar
@@ -723,6 +741,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # BR2_PACKAGE_GENEXT2FS is not set
 # BR2_PACKAGE_GENPART is not set
 # BR2_PACKAGE_GENROMFS is not set
+# BR2_PACKAGE_IMX_USB_LOADER is not set
 # BR2_PACKAGE_MMC_UTILS is not set
 # BR2_PACKAGE_MTD is not set
 
@@ -800,7 +819,10 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # BR2_PACKAGE_OPENTYRIAN is not set
 # BR2_PACKAGE_PRBOOM is not set
 # BR2_PACKAGE_SL is not set
-# BR2_PACKAGE_SOLARUS is not set
+
+#
+# solarus needs OpenGL and a toolchain w/ C++, gcc >= 4.8, NPTL, dynamic library
+#
 # BR2_PACKAGE_STELLA is not set
 
 #
@@ -822,6 +844,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # jhead needs a toolchain w/ wchar
 #
 # BR2_PACKAGE_LIBVA_UTILS is not set
+# BR2_PACKAGE_NETSURF is not set
 # BR2_PACKAGE_PNGQUANT is not set
 
 #
@@ -870,7 +893,6 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # Other GUIs
 #
-# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 
 #
@@ -890,11 +912,11 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 #
 
 #
-# midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 5, host gcc >= 4.8
+# midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8
 #
 
 #
-# vte needs a toolchain w/ wchar, threads, C++
+# vte needs a toolchain w/ wchar, threads, C++, gcc >= 4.8
 #
 
 #
@@ -949,11 +971,7 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 #
 
 #
-# dahdi-tools needs a toolchain w/ threads
-#
-
-#
-# dahdi-tools needs a Linux kernel to be built
+# dahdi-tools needs a toolchain w/ threads and a Linux kernel to be built
 #
 # BR2_PACKAGE_DBUS is not set
 # BR2_PACKAGE_DFU_UTIL is not set
@@ -981,6 +999,7 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 # BR2_PACKAGE_FAN_CTRL is not set
 # BR2_PACKAGE_FCONFIG is not set
 # BR2_PACKAGE_FIS is not set
+BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS=y
 # BR2_PACKAGE_FLASHROM is not set
 # BR2_PACKAGE_FMTOOLS is not set
 # BR2_PACKAGE_FXLOAD is not set
@@ -1062,6 +1081,7 @@ BR2_PACKAGE_PCIUTILS=y
 # BR2_PACKAGE_READ_EDID is not set
 # BR2_PACKAGE_RNG_TOOLS is not set
 # BR2_PACKAGE_RS485CONF is not set
+# BR2_PACKAGE_RTC_TOOLS is not set
 
 #
 # rtl8188eu needs a Linux kernel to be built
@@ -1084,11 +1104,13 @@ BR2_PACKAGE_PCIUTILS=y
 #
 # BR2_PACKAGE_SANE_BACKENDS is not set
 # BR2_PACKAGE_SDPARM is not set
+BR2_PACKAGE_SEDUTIL_ARCH_SUPPORTS=y
+# BR2_PACKAGE_SEDUTIL is not set
 BR2_PACKAGE_SETSERIAL=y
 # BR2_PACKAGE_SG3_UTILS is not set
 
 #
-# sigrok-cli needs a toolchain w/ wchar, threads, dynamic library, gcc >= 4.7
+# sigrok-cli needs a toolchain w/ locale, wchar, threads, dynamic library, gcc >= 4.7
 #
 
 #
@@ -1131,7 +1153,7 @@ BR2_PACKAGE_SETSERIAL=y
 #
 
 #
-# udisks needs a glibc or uClibc toolchain w/ wchar, threads, dynamic library
+# udisks needs a glibc toolchain w/ wchar, threads, dynamic library
 #
 # BR2_PACKAGE_UHUBCTL is not set
 
@@ -1266,7 +1288,9 @@ BR2_PACKAGE_OPENAL_ARCH_SUPPORTS=y
 # BR2_PACKAGE_OPUSFILE is not set
 # BR2_PACKAGE_PORTAUDIO is not set
 # BR2_PACKAGE_SBC is not set
+# BR2_PACKAGE_SPANDSP is not set
 # BR2_PACKAGE_SPEEX is not set
+# BR2_PACKAGE_SPEEXDSP is not set
 
 #
 # taglib needs a toolchain w/ C++, wchar
@@ -1287,7 +1311,10 @@ BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBSQUISH is not set
 # BR2_PACKAGE_LIBZIP is not set
 # BR2_PACKAGE_LZO is not set
-# BR2_PACKAGE_MINIZIP is not set
+
+#
+# minizip needs a toolchain w/ wchar
+#
 # BR2_PACKAGE_SNAPPY is not set
 # BR2_PACKAGE_SZIP is not set
 BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS=y
@@ -1317,7 +1344,7 @@ BR2_PACKAGE_BOTAN_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBGCRYPT is not set
 BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBGPG_ERROR is not set
-BR2_PACKAGE_LIBGPG_ERROR_SYSCFG="x86_64-pc-linux-gnu"
+BR2_PACKAGE_LIBGPG_ERROR_SYSCFG="x86_64-unknown-linux-gnu"
 # BR2_PACKAGE_LIBGPGME is not set
 # BR2_PACKAGE_LIBKCAPI is not set
 # BR2_PACKAGE_LIBKSBA is not set
@@ -1357,13 +1384,17 @@ BR2_PACKAGE_PROVIDES_HOST_OPENSSL="host-libopenssl"
 # kompexsqlite needs a toolchain w/ C++, wchar, threads, dynamic library
 #
 # BR2_PACKAGE_LEVELDB is not set
+# BR2_PACKAGE_LIBGIT2 is not set
 BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 
 #
-# mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 4.8
+# mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 6
 #
 # BR2_PACKAGE_MYSQL is not set
-# BR2_PACKAGE_POSTGRESQL is not set
+
+#
+# postgresql needs a toolchain w/ dynamic library, wchar
+#
 # BR2_PACKAGE_REDIS is not set
 # BR2_PACKAGE_SQLCIPHER is not set
 # BR2_PACKAGE_SQLITE is not set
@@ -1390,6 +1421,22 @@ BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_ASSIMP is not set
 
+#
+# at-spi2-atk needs a toolchain w/ wchar, threads
+#
+
+#
+# at-spi2-atk depends on X.org
+#
+
+#
+# at-spi2-core needs a toolchain w/ wchar, threads
+#
+
+#
+# at-spi2-core depends on X.org
+#
+
 #
 # atk needs a toolchain w/ wchar, threads
 #
@@ -1411,6 +1458,7 @@ BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 #
 # exiv2 needs a uClibc or glibc toolchain w/ C++, wchar, dynamic library, threads
 #
+# BR2_PACKAGE_EXEMPI is not set
 # BR2_PACKAGE_FONTCONFIG is not set
 # BR2_PACKAGE_FREETYPE is not set
 # BR2_PACKAGE_GD is not set
@@ -1431,6 +1479,7 @@ BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 # BR2_PACKAGE_HARFBUZZ is not set
 # BR2_PACKAGE_IJS is not set
 # BR2_PACKAGE_IMLIB2 is not set
+# BR2_PACKAGE_INTEL_GMMLIB is not set
 
 #
 # irrlicht needs X11 and an OpenGL provider
@@ -1542,9 +1591,10 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # BR2_PACKAGE_TIFF is not set
 # BR2_PACKAGE_WAYLAND is not set
 BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS=y
+BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT=y
 
 #
-# webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 5, host gcc >= 4.8
+# webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8
 #
 # BR2_PACKAGE_WEBP is not set
 # BR2_PACKAGE_WOFF2 is not set
@@ -1558,18 +1608,15 @@ BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS=y
 # BR2_PACKAGE_C_PERIPHERY is not set
 # BR2_PACKAGE_CCID is not set
 # BR2_PACKAGE_DTC is not set
+BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=y
 # BR2_PACKAGE_GNU_EFI is not set
-
-#
-# hackrf needs fftw's single precision
-#
+# BR2_PACKAGE_HACKRF is not set
 
 #
 # hidapi needs udev /dev management and a toolchain w/ NPTL threads
 #
 # BR2_PACKAGE_LCDAPI is not set
 # BR2_PACKAGE_LET_ME_CREATE is not set
-BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBAIO is not set
 
 #
@@ -1615,12 +1662,12 @@ BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBRTLSDR is not set
 
 #
-# libserial needs a toolchain w/ C++, threads, wchar
+# libserial needs a toolchain w/ C++, gcc >= 5, threads, wchar
 #
 # BR2_PACKAGE_LIBSERIALPORT is not set
 
 #
-# libsigrok needs a toolchain w/ wchar, threads, dynamic library, gcc >= 4.7
+# libsigrok needs a toolchain w/ wchar, locale, threads, dynamic library, gcc >= 4.7
 #
 
 #
@@ -1652,6 +1699,7 @@ BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_ANGULARJS is not set
 # BR2_PACKAGE_BOOTSTRAP is not set
+# BR2_PACKAGE_DUKTAPE is not set
 # BR2_PACKAGE_EXPLORERCANVAS is not set
 # BR2_PACKAGE_FLOT is not set
 # BR2_PACKAGE_JQUERY is not set
@@ -1704,10 +1752,7 @@ BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS=y
 # xerces-c++ needs a toolchain w/ C++, wchar
 #
 # BR2_PACKAGE_YAJL is not set
-
-#
-# yaml-cpp needs a toolchain w/ C++, threads, wchar
-#
+# BR2_PACKAGE_YAML_CPP is not set
 
 #
 # Logging
@@ -1761,6 +1806,7 @@ BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBOGG is not set
 BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBOPENH264 is not set
+# BR2_PACKAGE_LIBOPUSENC is not set
 # BR2_PACKAGE_LIBPLAYER is not set
 # BR2_PACKAGE_LIBTHEORA is not set
 # BR2_PACKAGE_LIBVPX is not set
@@ -1801,14 +1847,16 @@ BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS=y
 # BR2_PACKAGE_CURLPP is not set
 # BR2_PACKAGE_CZMQ is not set
 # BR2_PACKAGE_DAQ is not set
+# BR2_PACKAGE_DAVICI is not set
 # BR2_PACKAGE_FILEMQ is not set
 # BR2_PACKAGE_FLICKCURL is not set
 # BR2_PACKAGE_FREERADIUS_CLIENT is not set
 # BR2_PACKAGE_GEOIP is not set
 
 #
-# glib-networking needs a toolchain w/ wchar, threads
+# glib-networking needs a toolchain w/ wchar, threads, dynamic library
 #
+# BR2_PACKAGE_GRPC is not set
 
 #
 # gssdp needs a toolchain w/ wchar, threads
@@ -1844,6 +1892,7 @@ BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_LIBHTTPPARSER is not set
 # BR2_PACKAGE_LIBIDN is not set
+# BR2_PACKAGE_LIBIDN2 is not set
 # BR2_PACKAGE_LIBISCSI is not set
 # BR2_PACKAGE_LIBKRB5 is not set
 # BR2_PACKAGE_LIBLDNS is not set
@@ -1873,6 +1922,7 @@ BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBOAUTH is not set
 # BR2_PACKAGE_LIBOPING is not set
 # BR2_PACKAGE_LIBOSIP2 is not set
+# BR2_PACKAGE_LIBPAGEKITE is not set
 # BR2_PACKAGE_LIBPCAP is not set
 # BR2_PACKAGE_LIBPJSIP is not set
 # BR2_PACKAGE_LIBRSYNC is not set
@@ -1887,6 +1937,10 @@ BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBSTROPHE is not set
 BR2_PACKAGE_LIBTIRPC=y
 # BR2_PACKAGE_LIBTORRENT is not set
+
+#
+# libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.8
+#
 # BR2_PACKAGE_LIBUPNP is not set
 # BR2_PACKAGE_LIBUPNP18 is not set
 # BR2_PACKAGE_LIBUPNPP is not set
@@ -1898,8 +1952,13 @@ BR2_PACKAGE_LIBTIRPC=y
 # BR2_PACKAGE_MONGOOSE is not set
 # BR2_PACKAGE_NANOMSG is not set
 # BR2_PACKAGE_NEON is not set
+# BR2_PACKAGE_NGHTTP2 is not set
 # BR2_PACKAGE_NORM is not set
 
+#
+# nss-myhostname needs a glibc toolchain
+#
+
 #
 # nss-pam-ldapd needs a glibc toolchain
 #
@@ -1934,6 +1993,8 @@ BR2_PACKAGE_LIBTIRPC=y
 # thrift needs a toolchain w/ C++, wchar, threads
 #
 # BR2_PACKAGE_USBREDIR is not set
+# BR2_PACKAGE_WAMPCC is not set
+# BR2_PACKAGE_WEBSOCKETPP is not set
 # BR2_PACKAGE_ZEROMQ is not set
 # BR2_PACKAGE_ZMQPP is not set
 # BR2_PACKAGE_ZYRE is not set
@@ -1952,6 +2013,7 @@ BR2_PACKAGE_LIBTIRPC=y
 #
 # boost needs a toolchain w/ C++, threads, wchar
 #
+# BR2_PACKAGE_CAPNPROTO is not set
 
 #
 # clang needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library
@@ -1959,6 +2021,7 @@ BR2_PACKAGE_LIBTIRPC=y
 # BR2_PACKAGE_CLAPACK is not set
 BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS=y
 # BR2_PACKAGE_CLASSPATH is not set
+# BR2_PACKAGE_CMOCKA is not set
 
 #
 # cppcms needs a toolchain w/ C++, NPTL, wchar, dynamic library
@@ -1971,9 +2034,14 @@ BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS=y
 #
 # elfutils needs a uClibc or glibc toolchain w/ wchar, dynamic library
 #
+
+#
+# ell needs a toolchain w/ dynamic library, wchar
+#
 # BR2_PACKAGE_FFTW is not set
 # BR2_PACKAGE_FLANN is not set
 # BR2_PACKAGE_FLATBUFFERS is not set
+# BR2_PACKAGE_FLATCC is not set
 
 #
 # gconf needs a toolchain w/ threads, wchar, dynamic library
@@ -2011,6 +2079,8 @@ BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS=y
 #
 # libcgroup needs a glibc toolchain w/ C++
 #
+# BR2_PACKAGE_LIBCLC is not set
+# BR2_PACKAGE_LIBCORRECT is not set
 
 #
 # libcroco needs a toolchain w/ wchar, threads
@@ -2018,6 +2088,8 @@ BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBCROSSGUID is not set
 # BR2_PACKAGE_LIBCSV is not set
 # BR2_PACKAGE_LIBDAEMON is not set
+BR2_PACKAGE_LIBEASTL_ARCH_SUPPORTS=y
+# BR2_PACKAGE_LIBEASTL is not set
 # BR2_PACKAGE_LIBEE is not set
 # BR2_PACKAGE_LIBEV is not set
 # BR2_PACKAGE_LIBEVDEV is not set
@@ -2068,15 +2140,15 @@ BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS=y
 #
 # linux-pam needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library
 #
-BR2_PACKAGE_LLVM_ARCH_SUPPORTS=y
-BR2_PACKAGE_LLVM_TARGET_ARCH="X86"
 
 #
-# llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library
+# liquid-dsp requires a glibc or musl toolchain w/ dynamic library
 #
+BR2_PACKAGE_LLVM_ARCH_SUPPORTS=y
+BR2_PACKAGE_LLVM_TARGET_ARCH="X86"
 
 #
-# liquid-dsp requires a glibc or musl toolchain w/ dynamic library
+# llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library
 #
 
 #
@@ -2110,6 +2182,7 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 # BR2_PACKAGE_SKALIBS is not set
 # BR2_PACKAGE_SPHINXBASE is not set
 # BR2_PACKAGE_TINYCBOR is not set
+# BR2_PACKAGE_XAPIAN is not set
 
 #
 # Security
@@ -2190,11 +2263,14 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_AESPIPE is not set
 # BR2_PACKAGE_BC is not set
-# BR2_PACKAGE_CLAMAV is not set
+
+#
+# clamav needs a toolchain w/ C++, threads, wchar
+#
 # BR2_PACKAGE_COLLECTD is not set
 
 #
-# domoticz needs lua >= 5.2 and a toolchain w/ C++, NPTL, wchar, dynamic library
+# domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 4.8, NPTL, wchar, dynamic library
 #
 # BR2_PACKAGE_EMPTY is not set
 
@@ -2204,11 +2280,11 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 # BR2_PACKAGE_GOOGLEFONTDIRECTORY is not set
 
 #
-# gqrx needs a toolchain w/ C++, threads, wchar
+# gqrx needs a toolchain w/ C++, threads, wchar, dynamic library
 #
 
 #
-# gqrx needs qt5, gnuradio, fftw's single precision
+# gqrx needs qt5
 #
 
 #
@@ -2246,7 +2322,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 # BR2_PACKAGE_ARPTABLES is not set
 
 #
-# asterisk needs a glibc toolchain w/ C++
+# asterisk needs a glibc or uClibc toolchain w/ C++, dynamic library, threads, wchar
 #
 # BR2_PACKAGE_ATFTP is not set
 # BR2_PACKAGE_AUTOSSH is not set
@@ -2257,6 +2333,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 # BR2_PACKAGE_BATCTL is not set
 # BR2_PACKAGE_BCUSDK is not set
 # BR2_PACKAGE_BIND is not set
+# BR2_PACKAGE_BIRD is not set
 
 #
 # bluez-utils needs a toolchain w/ wchar, threads, dynamic library
@@ -2268,6 +2345,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 # BR2_PACKAGE_BMON is not set
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BOINC is not set
+# BR2_PACKAGE_BRCM_PATCHRAM_PLUS is not set
 # BR2_PACKAGE_BRIDGE_UTILS is not set
 # BR2_PACKAGE_BWM_NG is not set
 # BR2_PACKAGE_C_ICAP is not set
@@ -2284,6 +2362,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 # connman-gtk needs libgtk3 and a glibc or uClibc toolchain w/ wchar, threads, resolver, dynamic library
 #
 # BR2_PACKAGE_CONNTRACK_TOOLS is not set
+# BR2_PACKAGE_CORKSCREW is not set
 # BR2_PACKAGE_CRDA is not set
 # BR2_PACKAGE_CTORRENT is not set
 # BR2_PACKAGE_CUPS is not set
@@ -2293,6 +2372,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 #
 # BR2_PACKAGE_DANTE is not set
 # BR2_PACKAGE_DARKHTTPD is not set
+# BR2_PACKAGE_DEHYDRATED is not set
 BR2_PACKAGE_DHCPCD=y
 # BR2_PACKAGE_DHCPDUMP is not set
 # BR2_PACKAGE_DNSMASQ is not set
@@ -2303,6 +2383,7 @@ BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS=y
 BR2_PACKAGE_DROPBEAR_SMALL=y
 # BR2_PACKAGE_DROPBEAR_WTMP is not set
 # BR2_PACKAGE_DROPBEAR_LASTLOG is not set
+# BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO is not set
 # BR2_PACKAGE_EBTABLES is not set
 
 #
@@ -2319,6 +2400,7 @@ BR2_PACKAGE_ETHTOOL_PRETTY_PRINT=y
 #
 # freeswitch needs a toolchain w/ C++, dynamic library, threads, wchar
 #
+# BR2_PACKAGE_GERBERA is not set
 
 #
 # gesftpserver needs a toolchain w/ wchar, threads
@@ -2329,6 +2411,8 @@ BR2_PACKAGE_ETHTOOL_PRETTY_PRINT=y
 # gupnp-tools needs libgtk3
 #
 # BR2_PACKAGE_HANS is not set
+BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS=y
+# BR2_PACKAGE_HAPROXY is not set
 # BR2_PACKAGE_HIAWATHA is not set
 # BR2_PACKAGE_HOSTAPD is not set
 
@@ -2371,6 +2455,10 @@ BR2_PACKAGE_IPUTILS=y
 #
 # BR2_PACKAGE_IW is not set
 
+#
+# iwd needs a toolchain w/ dynamic library, wchar
+#
+
 #
 # janus-gateway needs a toolchain w/ dynamic library, threads, wchar
 #
@@ -2395,6 +2483,7 @@ BR2_PACKAGE_IPUTILS=y
 # BR2_PACKAGE_MACCHANGER is not set
 # BR2_PACKAGE_MEMCACHED is not set
 # BR2_PACKAGE_MII_DIAG is not set
+# BR2_PACKAGE_MINI_SNMPD is not set
 
 #
 # minidlna needs a toolchain w/ dynamic library, threads, wchar
@@ -2403,14 +2492,14 @@ BR2_PACKAGE_IPUTILS=y
 # BR2_PACKAGE_MJPG_STREAMER is not set
 
 #
-# modemmanager needs udev /dev management and a toolchain w/ wchar, threads
+# modemmanager needs a toolchain w/ wchar, threads
 #
 BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_MONGREL2 is not set
 # BR2_PACKAGE_MONKEY is not set
 
 #
-# mosh needs a toolchain w/ C++, threads, dynamic library, wchar, host and target gcc >= 4.5
+# mosh needs a toolchain w/ C++, threads, dynamic library, wchar, host and target gcc >= 4.8
 #
 # BR2_PACKAGE_MOSQUITTO is not set
 # BR2_PACKAGE_MROUTED is not set
@@ -2449,6 +2538,7 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_OPEN_PLC_UTILS is not set
 # BR2_PACKAGE_OPENNTPD is not set
 # BR2_PACKAGE_OPENOBEX is not set
+# BR2_PACKAGE_OPENRESOLV is not set
 # BR2_PACKAGE_OPENSSH is not set
 # BR2_PACKAGE_OPENSWAN is not set
 # BR2_PACKAGE_OPENVPN is not set
@@ -2487,7 +2577,7 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_RSYNC is not set
 
 #
-# rtorrent needs a toolchain w/ C++, threads, wchar
+# rtorrent needs a toolchain w/ C++, threads, wchar, gcc >= 4.9
 #
 # BR2_PACKAGE_RTPTOOLS is not set
 # BR2_PACKAGE_S6_DNS is not set
@@ -2498,6 +2588,7 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 #
 # BR2_PACKAGE_SCONESERVER is not set
 # BR2_PACKAGE_SER2NET is not set
+# BR2_PACKAGE_SHADOWSOCKS_LIBEV is not set
 # BR2_PACKAGE_SHAIRPORT_SYNC is not set
 # BR2_PACKAGE_SHELLINABOX is not set
 # BR2_PACKAGE_SMCROUTE is not set
@@ -2529,7 +2620,6 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_THTTPD is not set
 # BR2_PACKAGE_TINC is not set
 # BR2_PACKAGE_TINYHTTPD is not set
-# BR2_PACKAGE_TN5250 is not set
 # BR2_PACKAGE_TOR is not set
 # BR2_PACKAGE_TRACEROUTE is not set
 # BR2_PACKAGE_TRANSMISSION is not set
@@ -2631,7 +2721,7 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 #
 # Real-Time
 #
-BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS=y
+BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS=y
 # BR2_PACKAGE_XENOMAI is not set
 
 #
@@ -2703,6 +2793,7 @@ BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_SCREEN is not set
 # BR2_PACKAGE_SUDO is not set
+# BR2_PACKAGE_TINI is not set
 
 #
 # tmux needs a toolchain w/ wchar, locale
@@ -2722,18 +2813,25 @@ BR2_PACKAGE_AUDIT_ARCH_SUPPORTS=y
 # BR2_PACKAGE_CGROUPFS_MOUNT is not set
 
 #
-# circus needs Python and a toolchain w/ C++, NPTL
+# circus needs Python and a toolchain w/ C++, threads
 #
 # BR2_PACKAGE_CPULOAD is not set
 # BR2_PACKAGE_DAEMON is not set
 # BR2_PACKAGE_DC3DD is not set
 # BR2_PACKAGE_DDRESCUE is not set
+# BR2_PACKAGE_DOCKER_CLI is not set
 
 #
 # docker-compose needs a toolchain w/ wchar, threads, dynamic library
 #
-# BR2_PACKAGE_DOCKER_CONTAINERD is not set
-# BR2_PACKAGE_DOCKER_ENGINE is not set
+
+#
+# docker-containerd needs a glibc or musl toolchain w/ threads
+#
+
+#
+# docker-engine needs a glibc or musl toolchain w/ threads
+#
 # BR2_PACKAGE_DOCKER_PROXY is not set
 # BR2_PACKAGE_EFIBOOTMGR is not set
 BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS=y
@@ -2751,7 +2849,10 @@ BR2_PACKAGE_INITSCRIPTS=y
 # iotop depends on python or python3
 #
 # BR2_PACKAGE_IPRUTILS is not set
-# BR2_PACKAGE_IRQBALANCE is not set
+
+#
+# irqbalance needs a toolchain w/ wchar, threads
+#
 # BR2_PACKAGE_KEYUTILS is not set
 # BR2_PACKAGE_KMOD is not set
 
@@ -2763,6 +2864,7 @@ BR2_PACKAGE_INITSCRIPTS=y
 # libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar
 #
 # BR2_PACKAGE_LXC is not set
+# BR2_PACKAGE_MENDER is not set
 # BR2_PACKAGE_MONIT is not set
 # BR2_PACKAGE_NCDU is not set
 # BR2_PACKAGE_NUMACTL is not set
@@ -2772,6 +2874,10 @@ BR2_PACKAGE_INITSCRIPTS=y
 # openvmtools needs a glibc or musl toolchain w/ wchar, threads, RPC, locale
 #
 
+#
+# pamtester depends on linux-pam
+#
+
 #
 # polkit needs a toolchain w/ wchar, threads
 #
@@ -2786,7 +2892,6 @@ BR2_PACKAGE_INITSCRIPTS=y
 #
 # rauc needs a toolchain w/ wchar, threads
 #
-# BR2_PACKAGE_RUNC is not set
 # BR2_PACKAGE_S6 is not set
 # BR2_PACKAGE_S6_LINUX_INIT is not set
 # BR2_PACKAGE_S6_LINUX_UTILS is not set
@@ -2801,15 +2906,13 @@ BR2_PACKAGE_INITSCRIPTS=y
 #
 # BR2_PACKAGE_SWUPDATE is not set
 BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS=y
+BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS=y
 # BR2_PACKAGE_TPM_TOOLS is not set
 
 #
-# tpm2-abrmd needs a uClibc or glibc toolchain w/ C++, wchar, threads
-#
-
-#
-# tpm2-tools needs a uClibc or glibc toolchain w/ C++, wchar, threads
+# tpm2-abrmd needs a toolchain w/ dynamic library, wchar, threads
 #
+# BR2_PACKAGE_TPM2_TOOLS is not set
 
 #
 # unscd needs a glibc toolchain
@@ -2837,6 +2940,7 @@ BR2_PACKAGE_XVISOR_ARCH_SUPPORTS=y
 # Filesystem images
 #
 # BR2_TARGET_ROOTFS_AXFS is not set
+# BR2_TARGET_ROOTFS_BTRFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_CPIO_NONE=y
@@ -2849,6 +2953,7 @@ BR2_TARGET_ROOTFS_CPIO_NONE=y
 # BR2_TARGET_ROOTFS_CPIO_UIMAGE is not set
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
+# BR2_TARGET_ROOTFS_F2FS is not set
 
 #
 # initramfs needs a Linux kernel to be built
@@ -2875,6 +2980,7 @@ BR2_TARGET_GRUB2_ARCH_SUPPORTS=y
 # grub2 needs a toolchain w/ wchar
 #
 # BR2_TARGET_GUMMIBOOT is not set
+# BR2_TARGET_SHIM is not set
 # BR2_TARGET_SYSLINUX is not set
 # BR2_TARGET_UBOOT is not set
 
@@ -2883,7 +2989,10 @@ BR2_TARGET_GRUB2_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_HOST_AESPIPE is not set
 # BR2_PACKAGE_HOST_ANDROID_TOOLS is not set
+# BR2_PACKAGE_HOST_BTRFS_PROGS is not set
+# BR2_PACKAGE_HOST_CARGO is not set
 # BR2_PACKAGE_HOST_CHECKPOLICY is not set
+# BR2_PACKAGE_HOST_CHECKSEC is not set
 # BR2_PACKAGE_HOST_CMAKE is not set
 # BR2_PACKAGE_HOST_CRAMFS is not set
 # BR2_PACKAGE_HOST_CRYPTSETUP is not set
@@ -2893,6 +3002,7 @@ BR2_TARGET_GRUB2_ARCH_SUPPORTS=y
 # BR2_PACKAGE_HOST_DTC is not set
 # BR2_PACKAGE_HOST_E2FSPROGS is not set
 # BR2_PACKAGE_HOST_E2TOOLS is not set
+# BR2_PACKAGE_HOST_F2FS_TOOLS is not set
 # BR2_PACKAGE_HOST_FAKETIME is not set
 # BR2_PACKAGE_HOST_FWUP is not set
 # BR2_PACKAGE_HOST_GENEXT2FS is not set
@@ -2927,19 +3037,119 @@ BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS=y
 # BR2_PACKAGE_HOST_QEMU is not set
 # BR2_PACKAGE_HOST_RAUC is not set
+# BR2_PACKAGE_HOST_RCW is not set
+BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_RUSTC_ARCH="x86_64"
+# BR2_PACKAGE_HOST_RUSTC is not set
+BR2_PACKAGE_PROVIDES_HOST_RUSTC="host-rust-bin"
 # BR2_PACKAGE_HOST_SAM_BA is not set
 # BR2_PACKAGE_HOST_SQUASHFS is not set
+# BR2_PACKAGE_HOST_SWIG is not set
 # BR2_PACKAGE_HOST_UBOOT_TOOLS is not set
 # BR2_PACKAGE_HOST_UTIL_LINUX is not set
+# BR2_PACKAGE_HOST_UTP_COM is not set
 # BR2_PACKAGE_HOST_VBOOT_UTILS is not set
 # BR2_PACKAGE_HOST_XORRISO is not set
 # BR2_PACKAGE_HOST_ZIP is not set
+# BR2_PACKAGE_HOST_ZSTD is not set
 
 #
 # Legacy config options
 #
 
+#
+# Legacy options removed in 2019.02
+#
+# BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK is not set
+# BR2_PACKAGE_QT is not set
+# BR2_PACKAGE_QTUIO is not set
+# BR2_PACKAGE_PINENTRY_QT4 is not set
+# BR2_PACKAGE_POPPLER_QT is not set
+# BR2_PACKAGE_OPENCV3_WITH_QT is not set
+# BR2_PACKAGE_OPENCV_WITH_QT is not set
+# BR2_PACKAGE_AMD_CATALYST_CCCLE is not set
+# BR2_PACKAGE_SDL_QTOPIA is not set
+# BR2_PACKAGE_PYTHON_PYQT is not set
+# BR2_PACKAGE_GNURADIO_QTGUI is not set
+# BR2_PACKAGE_LUACRYPTO is not set
+# BR2_PACKAGE_TN5250 is not set
+# BR2_PACKAGE_BOOST_SIGNALS is not set
+# BR2_PACKAGE_FFTW_PRECISION_SINGLE is not set
+# BR2_PACKAGE_FFTW_PRECISION_DOUBLE is not set
+# BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE is not set
+# BR2_PACKAGE_LUA_5_2 is not set
+# BR2_TARGET_GENERIC_PASSWD_MD5 is not set
+
+#
+# Legacy options removed in 2018.11
+#
+# BR2_TARGET_XLOADER is not set
+# BR2_PACKAGE_TIDSP_BINARIES is not set
+# BR2_PACKAGE_DSP_TOOLS is not set
+# BR2_PACKAGE_GST_DSP is not set
+# BR2_PACKAGE_BOOTUTILS is not set
+# BR2_PACKAGE_EXPEDITE is not set
+# BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT is not set
+# BR2_KERNEL_HEADERS_4_10 is not set
+# BR2_KERNEL_HEADERS_4_11 is not set
+# BR2_KERNEL_HEADERS_4_12 is not set
+# BR2_KERNEL_HEADERS_4_13 is not set
+# BR2_KERNEL_HEADERS_4_15 is not set
+# BR2_KERNEL_HEADERS_4_17 is not set
+# BR2_PACKAGE_LIBNFTNL_XML is not set
+# BR2_KERNEL_HEADERS_3_2 is not set
+# BR2_KERNEL_HEADERS_4_1 is not set
+# BR2_KERNEL_HEADERS_4_16 is not set
+# BR2_KERNEL_HEADERS_4_18 is not set
+
+#
+# Legacy options removed in 2018.08
+#
+# BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT is not set
+# BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19 is not set
+# BR2_PACKAGE_XPROTO_APPLEWMPROTO is not set
+# BR2_PACKAGE_XPROTO_BIGREQSPROTO is not set
+# BR2_PACKAGE_XPROTO_COMPOSITEPROTO is not set
+# BR2_PACKAGE_XPROTO_DAMAGEPROTO is not set
+# BR2_PACKAGE_XPROTO_DMXPROTO is not set
+# BR2_PACKAGE_XPROTO_DRI2PROTO is not set
+# BR2_PACKAGE_XPROTO_DRI3PROTO is not set
+# BR2_PACKAGE_XPROTO_FIXESPROTO is not set
+# BR2_PACKAGE_XPROTO_FONTCACHEPROTO is not set
+# BR2_PACKAGE_XPROTO_FONTSPROTO is not set
+# BR2_PACKAGE_XPROTO_GLPROTO is not set
+# BR2_PACKAGE_XPROTO_INPUTPROTO is not set
+# BR2_PACKAGE_XPROTO_KBPROTO is not set
+# BR2_PACKAGE_XPROTO_PRESENTPROTO is not set
+# BR2_PACKAGE_XPROTO_RANDRPROTO is not set
+# BR2_PACKAGE_XPROTO_RECORDPROTO is not set
+# BR2_PACKAGE_XPROTO_RENDERPROTO is not set
+# BR2_PACKAGE_XPROTO_RESOURCEPROTO is not set
+# BR2_PACKAGE_XPROTO_SCRNSAVERPROTO is not set
+# BR2_PACKAGE_XPROTO_VIDEOPROTO is not set
+# BR2_PACKAGE_XPROTO_WINDOWSWMPROTO is not set
+# BR2_PACKAGE_XPROTO_XCMISCPROTO is not set
+# BR2_PACKAGE_XPROTO_XEXTPROTO is not set
+# BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO is not set
+# BR2_PACKAGE_XPROTO_XF86DGAPROTO is not set
+# BR2_PACKAGE_XPROTO_XF86DRIPROTO is not set
+# BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO is not set
+# BR2_PACKAGE_XPROTO_XINERAMAPROTO is not set
+# BR2_PACKAGE_XPROTO_XPROTO is not set
+# BR2_PACKAGE_XPROTO_XPROXYMANAGEMENTPROTOCOL is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLES2 is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11 is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_DISPMANX is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER is not set
+# BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME is not set
+# BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPG123 is not set
+# BR2_GDB_VERSION_7_11 is not set
+# BR2_GDB_VERSION_7_10 is not set
+
 #
 # Legacy options removed in 2018.05
 #
diff --git a/recipes-core/non-root-initramfs/files/arm64-config b/recipes-core/non-root-initramfs/files/arm64-config
index aa8910a..087d10d 100644
--- a/recipes-core/non-root-initramfs/files/arm64-config
+++ b/recipes-core/non-root-initramfs/files/arm64-config
@@ -1,6 +1,6 @@
 #
 # Automatically generated file; DO NOT EDIT.
-# Buildroot 2018.05.1 Configuration
+# Buildroot 2019.02.2 Configuration
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_HOST_GCC_AT_LEAST_4_5=y
@@ -10,6 +10,7 @@ BR2_HOST_GCC_AT_LEAST_4_8=y
 BR2_HOST_GCC_AT_LEAST_4_9=y
 BR2_HOST_GCC_AT_LEAST_5=y
 BR2_HOST_GCC_AT_LEAST_6=y
+BR2_HOST_GCC_AT_LEAST_7=y
 
 #
 # Target options
@@ -37,6 +38,7 @@ BR2_aarch64=y
 # BR2_powerpc is not set
 # BR2_powerpc64 is not set
 # BR2_powerpc64le is not set
+# BR2_riscv is not set
 # BR2_sh is not set
 # BR2_sparc is not set
 # BR2_sparc64 is not set
@@ -50,6 +52,7 @@ BR2_GCC_TARGET_CPU="cortex-a53"
 BR2_BINFMT_SUPPORTS_SHARED=y
 BR2_READELF_ARCH_NAME="AArch64"
 BR2_BINFMT_ELF=y
+BR2_ARM_CPU_HAS_FPU=y
 BR2_ARM_CPU_HAS_VFPV2=y
 BR2_ARM_CPU_HAS_VFPV3=y
 BR2_ARM_CPU_HAS_VFPV4=y
@@ -84,6 +87,18 @@ BR2_cortex_a53=y
 # BR2_thunderx2t99 is not set
 # BR2_thunderx2t99p1 is not set
 # BR2_vulcan is not set
+
+#
+# armv8.2a cores
+#
+# BR2_cortex_a55 is not set
+# BR2_cortex_a75 is not set
+# BR2_cortex_a75_a55 is not set
+
+#
+# armv8.3a cores
+#
+# BR2_saphira is not set
 # BR2_ARM_FPU_VFPV2 is not set
 # BR2_ARM_FPU_VFPV3 is not set
 # BR2_ARM_FPU_VFPV3D16 is not set
@@ -105,7 +120,6 @@ BR2_GIT="git"
 BR2_CVS="cvs"
 BR2_LOCALFILES="cp"
 BR2_SCP="scp"
-BR2_SSH="ssh"
 BR2_HG="hg"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
@@ -148,6 +162,7 @@ BR2_GLOBAL_PATCH_DIR=""
 # Advanced
 #
 # BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
+# BR2_FORCE_HOST_BUILD is not set
 # BR2_REPRODUCIBLE is not set
 
 #
@@ -185,18 +200,15 @@ BR2_TOOLCHAIN_BUILDROOT_LIBC="uclibc"
 #
 # Kernel Header Options
 #
-# BR2_KERNEL_HEADERS_4_1 is not set
 # BR2_KERNEL_HEADERS_4_4 is not set
 # BR2_KERNEL_HEADERS_4_9 is not set
-# BR2_KERNEL_HEADERS_4_10 is not set
-# BR2_KERNEL_HEADERS_4_11 is not set
-# BR2_KERNEL_HEADERS_4_12 is not set
-# BR2_KERNEL_HEADERS_4_13 is not set
 # BR2_KERNEL_HEADERS_4_14 is not set
-# BR2_KERNEL_HEADERS_4_15 is not set
-BR2_KERNEL_HEADERS_4_16=y
+BR2_KERNEL_HEADERS_4_19=y
+# BR2_KERNEL_HEADERS_4_20 is not set
 # BR2_KERNEL_HEADERS_VERSION is not set
-BR2_DEFAULT_KERNEL_HEADERS="4.16.17"
+# BR2_KERNEL_HEADERS_CUSTOM_TARBALL is not set
+# BR2_KERNEL_HEADERS_CUSTOM_GIT is not set
+BR2_DEFAULT_KERNEL_HEADERS="4.19.36"
 BR2_PACKAGE_LINUX_HEADERS=y
 
 #
@@ -216,10 +228,12 @@ BR2_UCLIBC_INSTALL_UTILS=y
 #
 # Binutils Options
 #
+BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI=y
 # BR2_BINUTILS_VERSION_2_28_X is not set
 # BR2_BINUTILS_VERSION_2_29_X is not set
-BR2_BINUTILS_VERSION_2_30_X=y
-BR2_BINUTILS_VERSION="2.30"
+# BR2_BINUTILS_VERSION_2_30_X is not set
+BR2_BINUTILS_VERSION_2_31_X=y
+BR2_BINUTILS_VERSION="2.31.1"
 BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
 
 #
@@ -228,9 +242,9 @@ BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
 # BR2_GCC_VERSION_4_9_X is not set
 # BR2_GCC_VERSION_5_X is not set
 # BR2_GCC_VERSION_6_X is not set
-BR2_GCC_VERSION_7_X=y
-BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
-BR2_GCC_VERSION="7.3.0"
+# BR2_GCC_VERSION_7_X is not set
+BR2_GCC_VERSION_8_X=y
+BR2_GCC_VERSION="8.3.0"
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 # BR2_TOOLCHAIN_BUILDROOT_FORTRAN is not set
@@ -243,14 +257,16 @@ BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS=y
 # Host GDB Options
 #
 # BR2_PACKAGE_HOST_GDB is not set
+BR2_PACKAGE_GDB_NEEDS_CXX11=y
 
 #
 # Toolchain Generic Options
 #
+BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS=y
+BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK=y
 BR2_INSTALL_LIBSTDCPP=y
 BR2_TOOLCHAIN_HAS_THREADS=y
 BR2_TOOLCHAIN_HAS_THREADS_NPTL=y
-BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
 BR2_TOOLCHAIN_SUPPORTS_PIE=y
 BR2_USE_MMU=y
 BR2_TARGET_OPTIMIZATION=""
@@ -293,7 +309,10 @@ BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16=y
-BR2_TOOLCHAIN_HEADERS_AT_LEAST="4.16"
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST="4.19"
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_3=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_4=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_5=y
@@ -304,7 +323,8 @@ BR2_TOOLCHAIN_GCC_AT_LEAST_4_9=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_5=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_6=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_7=y
-BR2_TOOLCHAIN_GCC_AT_LEAST="7"
+BR2_TOOLCHAIN_GCC_AT_LEAST_8=y
+BR2_TOOLCHAIN_GCC_AT_LEAST="8"
 BR2_TOOLCHAIN_HAS_MNAN_OPTION=y
 BR2_TOOLCHAIN_HAS_SYNC_1=y
 BR2_TOOLCHAIN_HAS_SYNC_2=y
@@ -318,15 +338,17 @@ BR2_TOOLCHAIN_HAS_ATOMIC=y
 #
 BR2_ROOTFS_SKELETON_DEFAULT=y
 # BR2_ROOTFS_SKELETON_CUSTOM is not set
-# BR2_ROOTFS_MERGED_USR is not set
 BR2_TARGET_GENERIC_HOSTNAME="jailhouse"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
-BR2_TARGET_GENERIC_PASSWD_MD5=y
-# BR2_TARGET_GENERIC_PASSWD_SHA256 is not set
+BR2_TARGET_GENERIC_PASSWD_SHA256=y
 # BR2_TARGET_GENERIC_PASSWD_SHA512 is not set
-BR2_TARGET_GENERIC_PASSWD_METHOD="md5"
+BR2_TARGET_GENERIC_PASSWD_METHOD="sha-256"
 BR2_INIT_BUSYBOX=y
 # BR2_INIT_SYSV is not set
+
+#
+# systemd needs a glibc toolchain w/ SSP, headers >= 3.10
+#
 # BR2_INIT_NONE is not set
 # BR2_ROOTFS_DEVICE_CREATION_STATIC is not set
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
@@ -337,6 +359,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 #
 BR2_ROOTFS_DEVICE_TABLE="system/device_table.txt"
 # BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES is not set
+# BR2_ROOTFS_MERGED_USR is not set
 BR2_TARGET_ENABLE_ROOT_LOGIN=y
 BR2_TARGET_GENERIC_ROOT_PASSWD=""
 BR2_SYSTEM_BIN_SH_BUSYBOX=y
@@ -358,6 +381,7 @@ BR2_TARGET_GENERIC_GETTY_TERM="vt100"
 BR2_TARGET_GENERIC_GETTY_OPTIONS=""
 BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
 BR2_SYSTEM_DHCP=""
+BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
 # BR2_ENABLE_LOCALE_PURGE is not set
 
 #
@@ -442,7 +466,7 @@ BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 #
 
 #
-# kodi needs an OpenGL EGL with either an openGL or an OpenGL ES backend
+# kodi needs an OpenGL EGL backend with OpenGL support
 #
 # BR2_PACKAGE_LAME is not set
 # BR2_PACKAGE_MADPLAY is not set
@@ -468,7 +492,7 @@ BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 # BR2_PACKAGE_MUSEPACK is not set
 
 #
-# ncmpc needs a toolchain w/ wchar, threads
+# ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 4.9
 #
 # BR2_PACKAGE_OPUS_TOOLS is not set
 BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
@@ -496,7 +520,7 @@ BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
 #
 
 #
-# vlc needs a toolchain w/ C++, dynamic library, wchar, threads, headers >= 3.7
+# vlc needs a toolchain w/ C++, dynamic library, wchar, threads, gcc >= 4.9, headers >= 3.7
 #
 # BR2_PACKAGE_VORBIS_TOOLS is not set
 # BR2_PACKAGE_WAVPACK is not set
@@ -515,6 +539,7 @@ BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
 #
 # p7zip needs a toolchain w/ threads, wchar, C++
 #
+# BR2_PACKAGE_PIGZ is not set
 
 #
 # pixz needs a toolchain w/ threads, wchar
@@ -533,6 +558,10 @@ BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
 # BR2_PACKAGE_BLKTRACE is not set
 # BR2_PACKAGE_BONNIE is not set
 BR2_PACKAGE_CACHE_CALIBRATOR=y
+
+#
+# clinfo needs an OpenCL provider
+#
 # BR2_PACKAGE_DHRYSTONE is not set
 # BR2_PACKAGE_DIEHARDER is not set
 # BR2_PACKAGE_DMALLOC is not set
@@ -574,6 +603,11 @@ BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS=y
 BR2_PACKAGE_LMBENCH=y
 BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LTP_TESTSUITE is not set
+BR2_PACKAGE_LTRACE_ARCH_SUPPORTS=y
+
+#
+# ltrace needs a uClibc or glibc toolchain w/ wchar, dynamic library
+#
 
 #
 # lttng-babeltrace needs a toolchain w/ wchar, threads
@@ -606,10 +640,7 @@ BR2_PACKAGE_RT_TESTS=y
 # BR2_PACKAGE_SPIDEV_TEST is not set
 # BR2_PACKAGE_STRACE is not set
 # BR2_PACKAGE_STRESS is not set
-
-#
-# stress-ng needs a glibc toolchain w/ dynamic library, headers >= 3.3
-#
+# BR2_PACKAGE_STRESS_NG is not set
 # BR2_PACKAGE_TCF_AGENT is not set
 BR2_PACKAGE_TCF_AGENT_ARCH="a64"
 BR2_PACKAGE_TCF_AGENT_ARCH_SUPPORTS=y
@@ -620,6 +651,7 @@ BR2_PACKAGE_TRINITY_ARCH_SUPPORTS=y
 # BR2_PACKAGE_UCLIBC_NG_TEST is not set
 BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS=y
 # BR2_PACKAGE_VALGRIND is not set
+# BR2_PACKAGE_VMTOUCH is not set
 # BR2_PACKAGE_WHETSTONE is not set
 
 #
@@ -637,6 +669,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7, NPTL
 #
 # BR2_PACKAGE_CPPUNIT is not set
+# BR2_PACKAGE_CUNIT is not set
 
 #
 # cvs needs a toolchain w/ wchar
@@ -681,6 +714,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # curlftpfs needs a toolchain w/ wchar, threads, dynamic library
 #
+# BR2_PACKAGE_DAVFS2 is not set
 
 #
 # dosfstools needs a toolchain w/ wchar
@@ -715,6 +749,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # BR2_PACKAGE_GENEXT2FS is not set
 # BR2_PACKAGE_GENPART is not set
 # BR2_PACKAGE_GENROMFS is not set
+# BR2_PACKAGE_IMX_USB_LOADER is not set
 # BR2_PACKAGE_MMC_UTILS is not set
 # BR2_PACKAGE_MTD is not set
 
@@ -809,6 +844,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # jhead needs a toolchain w/ wchar
 #
 # BR2_PACKAGE_LIBVA_UTILS is not set
+# BR2_PACKAGE_NETSURF is not set
 # BR2_PACKAGE_PNGQUANT is not set
 
 #
@@ -853,7 +889,6 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # Other GUIs
 #
-# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 
 #
@@ -873,7 +908,11 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 #
 
 #
-# vte needs a toolchain w/ wchar, threads, C++
+# midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8
+#
+
+#
+# vte needs a toolchain w/ wchar, threads, C++, gcc >= 4.8
 #
 
 #
@@ -900,6 +939,7 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 # BR2_PACKAGE_ZD1211_FIRMWARE is not set
 # BR2_PACKAGE_18XX_TI_UTILS is not set
 # BR2_PACKAGE_ACPICA is not set
+# BR2_PACKAGE_ACPID is not set
 # BR2_PACKAGE_ACPITOOL is not set
 # BR2_PACKAGE_AER_INJECT is not set
 
@@ -926,14 +966,11 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 #
 
 #
-# dahdi-tools needs a toolchain w/ threads
-#
-
-#
-# dahdi-tools needs a Linux kernel to be built
+# dahdi-tools needs a toolchain w/ threads and a Linux kernel to be built
 #
 # BR2_PACKAGE_DBUS is not set
 # BR2_PACKAGE_DFU_UTIL is not set
+# BR2_PACKAGE_DMIDECODE is not set
 # BR2_PACKAGE_DMRAID is not set
 
 #
@@ -957,6 +994,8 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 # BR2_PACKAGE_FAN_CTRL is not set
 # BR2_PACKAGE_FCONFIG is not set
 # BR2_PACKAGE_FIS is not set
+BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS=y
+# BR2_PACKAGE_FLASHROM is not set
 # BR2_PACKAGE_FMTOOLS is not set
 # BR2_PACKAGE_FREESCALE_IMX is not set
 # BR2_PACKAGE_FXLOAD is not set
@@ -1024,6 +1063,7 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 BR2_PACKAGE_PCIUTILS=y
 # BR2_PACKAGE_PDBG is not set
 # BR2_PACKAGE_PICOCOM is not set
+# BR2_PACKAGE_PIGPIO is not set
 
 #
 # powertop needs a toolchain w/ C++, threads, wchar
@@ -1032,6 +1072,7 @@ BR2_PACKAGE_PCIUTILS=y
 # BR2_PACKAGE_READ_EDID is not set
 # BR2_PACKAGE_RNG_TOOLS is not set
 # BR2_PACKAGE_RS485CONF is not set
+# BR2_PACKAGE_RTC_TOOLS is not set
 
 #
 # rtl8188eu needs a Linux kernel to be built
@@ -1054,11 +1095,13 @@ BR2_PACKAGE_PCIUTILS=y
 #
 # BR2_PACKAGE_SANE_BACKENDS is not set
 # BR2_PACKAGE_SDPARM is not set
+BR2_PACKAGE_SEDUTIL_ARCH_SUPPORTS=y
+# BR2_PACKAGE_SEDUTIL is not set
 BR2_PACKAGE_SETSERIAL=y
 # BR2_PACKAGE_SG3_UTILS is not set
 
 #
-# sigrok-cli needs a toolchain w/ wchar, threads, dynamic library, gcc >= 4.7
+# sigrok-cli needs a toolchain w/ locale, wchar, threads, dynamic library, gcc >= 4.7
 #
 
 #
@@ -1101,7 +1144,7 @@ BR2_PACKAGE_SETSERIAL=y
 #
 
 #
-# udisks needs a glibc or uClibc toolchain w/ wchar, threads, dynamic library
+# udisks needs a glibc toolchain w/ wchar, threads, dynamic library
 #
 # BR2_PACKAGE_UHUBCTL is not set
 
@@ -1187,6 +1230,8 @@ BR2_PACKAGE_NODEJS_ARCH_SUPPORTS=y
 # BR2_PACKAGE_AUDIOFILE is not set
 # BR2_PACKAGE_BCG729 is not set
 # BR2_PACKAGE_CELT051 is not set
+BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS=y
+# BR2_PACKAGE_FDK_AAC is not set
 # BR2_PACKAGE_LIBAO is not set
 # BR2_PACKAGE_LIBASPLIB is not set
 # BR2_PACKAGE_LIBBROADVOICE is not set
@@ -1226,7 +1271,9 @@ BR2_PACKAGE_OPENAL_ARCH_SUPPORTS=y
 # BR2_PACKAGE_OPUSFILE is not set
 # BR2_PACKAGE_PORTAUDIO is not set
 # BR2_PACKAGE_SBC is not set
+# BR2_PACKAGE_SPANDSP is not set
 # BR2_PACKAGE_SPEEX is not set
+# BR2_PACKAGE_SPEEXDSP is not set
 
 #
 # taglib needs a toolchain w/ C++, wchar
@@ -1245,7 +1292,10 @@ BR2_PACKAGE_OPENAL_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBSQUISH is not set
 # BR2_PACKAGE_LIBZIP is not set
 # BR2_PACKAGE_LZO is not set
-# BR2_PACKAGE_MINIZIP is not set
+
+#
+# minizip needs a toolchain w/ wchar
+#
 # BR2_PACKAGE_SNAPPY is not set
 # BR2_PACKAGE_SZIP is not set
 BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS=y
@@ -1313,13 +1363,17 @@ BR2_PACKAGE_PROVIDES_HOST_OPENSSL="host-libopenssl"
 # kompexsqlite needs a toolchain w/ C++, wchar, threads, dynamic library
 #
 # BR2_PACKAGE_LEVELDB is not set
+# BR2_PACKAGE_LIBGIT2 is not set
 BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 
 #
-# mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 4.8
+# mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 6
 #
 # BR2_PACKAGE_MYSQL is not set
-# BR2_PACKAGE_POSTGRESQL is not set
+
+#
+# postgresql needs a toolchain w/ dynamic library, wchar
+#
 # BR2_PACKAGE_REDIS is not set
 # BR2_PACKAGE_SQLCIPHER is not set
 # BR2_PACKAGE_SQLITE is not set
@@ -1346,6 +1400,22 @@ BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_ASSIMP is not set
 
+#
+# at-spi2-atk needs a toolchain w/ wchar, threads
+#
+
+#
+# at-spi2-atk depends on X.org
+#
+
+#
+# at-spi2-core needs a toolchain w/ wchar, threads
+#
+
+#
+# at-spi2-core depends on X.org
+#
+
 #
 # atk needs a toolchain w/ wchar, threads
 #
@@ -1367,6 +1437,7 @@ BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 #
 # exiv2 needs a uClibc or glibc toolchain w/ C++, wchar, dynamic library, threads
 #
+# BR2_PACKAGE_EXEMPI is not set
 # BR2_PACKAGE_FONTCONFIG is not set
 # BR2_PACKAGE_FREETYPE is not set
 # BR2_PACKAGE_GD is not set
@@ -1496,6 +1567,12 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # BR2_PACKAGE_POPPLER is not set
 # BR2_PACKAGE_TIFF is not set
 # BR2_PACKAGE_WAYLAND is not set
+BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS=y
+BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT=y
+
+#
+# webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8
+#
 # BR2_PACKAGE_WEBP is not set
 # BR2_PACKAGE_WOFF2 is not set
 # BR2_PACKAGE_ZBAR is not set
@@ -1508,18 +1585,15 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # BR2_PACKAGE_C_PERIPHERY is not set
 # BR2_PACKAGE_CCID is not set
 # BR2_PACKAGE_DTC is not set
+BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=y
 # BR2_PACKAGE_GNU_EFI is not set
-
-#
-# hackrf needs fftw's single precision
-#
+# BR2_PACKAGE_HACKRF is not set
 
 #
 # hidapi needs udev /dev management and a toolchain w/ NPTL threads
 #
 # BR2_PACKAGE_LCDAPI is not set
 # BR2_PACKAGE_LET_ME_CREATE is not set
-BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBAIO is not set
 
 #
@@ -1565,12 +1639,12 @@ BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBRTLSDR is not set
 
 #
-# libserial needs a toolchain w/ C++, threads, wchar
+# libserial needs a toolchain w/ C++, gcc >= 5, threads, wchar
 #
 # BR2_PACKAGE_LIBSERIALPORT is not set
 
 #
-# libsigrok needs a toolchain w/ wchar, threads, dynamic library, gcc >= 4.7
+# libsigrok needs a toolchain w/ wchar, locale, threads, dynamic library, gcc >= 4.7
 #
 
 #
@@ -1601,6 +1675,7 @@ BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_ANGULARJS is not set
 # BR2_PACKAGE_BOOTSTRAP is not set
+# BR2_PACKAGE_DUKTAPE is not set
 # BR2_PACKAGE_EXPLORERCANVAS is not set
 # BR2_PACKAGE_FLOT is not set
 # BR2_PACKAGE_JQUERY is not set
@@ -1653,10 +1728,7 @@ BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS=y
 # xerces-c++ needs a toolchain w/ C++, wchar
 #
 # BR2_PACKAGE_YAJL is not set
-
-#
-# yaml-cpp needs a toolchain w/ C++, threads, wchar
-#
+# BR2_PACKAGE_YAML_CPP is not set
 
 #
 # Logging
@@ -1711,6 +1783,7 @@ BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBOGG is not set
 BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBOPENH264 is not set
+# BR2_PACKAGE_LIBOPUSENC is not set
 # BR2_PACKAGE_LIBPLAYER is not set
 # BR2_PACKAGE_LIBTHEORA is not set
 # BR2_PACKAGE_LIBVPX is not set
@@ -1749,14 +1822,16 @@ BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS=y
 # BR2_PACKAGE_CURLPP is not set
 # BR2_PACKAGE_CZMQ is not set
 # BR2_PACKAGE_DAQ is not set
+# BR2_PACKAGE_DAVICI is not set
 # BR2_PACKAGE_FILEMQ is not set
 # BR2_PACKAGE_FLICKCURL is not set
 # BR2_PACKAGE_FREERADIUS_CLIENT is not set
 # BR2_PACKAGE_GEOIP is not set
 
 #
-# glib-networking needs a toolchain w/ wchar, threads
+# glib-networking needs a toolchain w/ wchar, threads, dynamic library
 #
+# BR2_PACKAGE_GRPC is not set
 
 #
 # gssdp needs a toolchain w/ wchar, threads
@@ -1792,6 +1867,7 @@ BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_LIBHTTPPARSER is not set
 # BR2_PACKAGE_LIBIDN is not set
+# BR2_PACKAGE_LIBIDN2 is not set
 # BR2_PACKAGE_LIBISCSI is not set
 # BR2_PACKAGE_LIBKRB5 is not set
 # BR2_PACKAGE_LIBLDNS is not set
@@ -1821,6 +1897,7 @@ BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBOAUTH is not set
 # BR2_PACKAGE_LIBOPING is not set
 # BR2_PACKAGE_LIBOSIP2 is not set
+# BR2_PACKAGE_LIBPAGEKITE is not set
 # BR2_PACKAGE_LIBPCAP is not set
 # BR2_PACKAGE_LIBPJSIP is not set
 # BR2_PACKAGE_LIBRSYNC is not set
@@ -1835,6 +1912,10 @@ BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBSTROPHE is not set
 BR2_PACKAGE_LIBTIRPC=y
 # BR2_PACKAGE_LIBTORRENT is not set
+
+#
+# libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.8
+#
 # BR2_PACKAGE_LIBUPNP is not set
 # BR2_PACKAGE_LIBUPNP18 is not set
 # BR2_PACKAGE_LIBUPNPP is not set
@@ -1846,8 +1927,13 @@ BR2_PACKAGE_LIBTIRPC=y
 # BR2_PACKAGE_MONGOOSE is not set
 # BR2_PACKAGE_NANOMSG is not set
 # BR2_PACKAGE_NEON is not set
+# BR2_PACKAGE_NGHTTP2 is not set
 # BR2_PACKAGE_NORM is not set
 
+#
+# nss-myhostname needs a glibc toolchain
+#
+
 #
 # nss-pam-ldapd needs a glibc toolchain
 #
@@ -1882,6 +1968,8 @@ BR2_PACKAGE_LIBTIRPC=y
 # thrift needs a toolchain w/ C++, wchar, threads
 #
 # BR2_PACKAGE_USBREDIR is not set
+# BR2_PACKAGE_WAMPCC is not set
+# BR2_PACKAGE_WEBSOCKETPP is not set
 # BR2_PACKAGE_ZEROMQ is not set
 # BR2_PACKAGE_ZMQPP is not set
 # BR2_PACKAGE_ZYRE is not set
@@ -1900,11 +1988,13 @@ BR2_PACKAGE_LIBTIRPC=y
 #
 # boost needs a toolchain w/ C++, threads, wchar
 #
+# BR2_PACKAGE_CAPNPROTO is not set
 
 #
 # clang needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library
 #
 # BR2_PACKAGE_CLAPACK is not set
+# BR2_PACKAGE_CMOCKA is not set
 
 #
 # cppcms needs a toolchain w/ C++, NPTL, wchar, dynamic library
@@ -1917,9 +2007,14 @@ BR2_PACKAGE_LIBTIRPC=y
 #
 # elfutils needs a uClibc or glibc toolchain w/ wchar, dynamic library
 #
+
+#
+# ell needs a toolchain w/ dynamic library, wchar
+#
 # BR2_PACKAGE_FFTW is not set
 # BR2_PACKAGE_FLANN is not set
 # BR2_PACKAGE_FLATBUFFERS is not set
+# BR2_PACKAGE_FLATCC is not set
 
 #
 # gconf needs a toolchain w/ threads, wchar, dynamic library
@@ -1957,6 +2052,8 @@ BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS=y
 #
 # libcgroup needs a glibc toolchain w/ C++
 #
+# BR2_PACKAGE_LIBCLC is not set
+# BR2_PACKAGE_LIBCORRECT is not set
 
 #
 # libcroco needs a toolchain w/ wchar, threads
@@ -1964,6 +2061,8 @@ BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBCROSSGUID is not set
 # BR2_PACKAGE_LIBCSV is not set
 # BR2_PACKAGE_LIBDAEMON is not set
+BR2_PACKAGE_LIBEASTL_ARCH_SUPPORTS=y
+# BR2_PACKAGE_LIBEASTL is not set
 # BR2_PACKAGE_LIBEE is not set
 # BR2_PACKAGE_LIBEV is not set
 # BR2_PACKAGE_LIBEVDEV is not set
@@ -2009,15 +2108,15 @@ BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS=y
 #
 # linux-pam needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library
 #
-BR2_PACKAGE_LLVM_ARCH_SUPPORTS=y
-BR2_PACKAGE_LLVM_TARGET_ARCH="AArch64"
 
 #
-# llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library
+# liquid-dsp requires a glibc or musl toolchain w/ dynamic library
 #
+BR2_PACKAGE_LLVM_ARCH_SUPPORTS=y
+BR2_PACKAGE_LLVM_TARGET_ARCH="AArch64"
 
 #
-# liquid-dsp requires a glibc or musl toolchain w/ dynamic library
+# llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library
 #
 
 #
@@ -2051,6 +2150,7 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 # BR2_PACKAGE_SKALIBS is not set
 # BR2_PACKAGE_SPHINXBASE is not set
 # BR2_PACKAGE_TINYCBOR is not set
+# BR2_PACKAGE_XAPIAN is not set
 
 #
 # Security
@@ -2131,11 +2231,14 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_AESPIPE is not set
 # BR2_PACKAGE_BC is not set
-# BR2_PACKAGE_CLAMAV is not set
+
+#
+# clamav needs a toolchain w/ C++, threads, wchar
+#
 # BR2_PACKAGE_COLLECTD is not set
 
 #
-# domoticz needs lua >= 5.2 and a toolchain w/ C++, NPTL, wchar, dynamic library
+# domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 4.8, NPTL, wchar, dynamic library
 #
 # BR2_PACKAGE_EMPTY is not set
 
@@ -2145,11 +2248,11 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 # BR2_PACKAGE_GOOGLEFONTDIRECTORY is not set
 
 #
-# gqrx needs a toolchain w/ C++, threads, wchar
+# gqrx needs a toolchain w/ C++, threads, wchar, dynamic library
 #
 
 #
-# gqrx needs qt5, gnuradio, fftw's single precision
+# gqrx needs qt5
 #
 
 #
@@ -2187,7 +2290,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 # BR2_PACKAGE_ARPTABLES is not set
 
 #
-# asterisk needs a glibc toolchain w/ C++
+# asterisk needs a glibc or uClibc toolchain w/ C++, dynamic library, threads, wchar
 #
 # BR2_PACKAGE_ATFTP is not set
 # BR2_PACKAGE_AUTOSSH is not set
@@ -2198,6 +2301,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 # BR2_PACKAGE_BATCTL is not set
 # BR2_PACKAGE_BCUSDK is not set
 # BR2_PACKAGE_BIND is not set
+# BR2_PACKAGE_BIRD is not set
 
 #
 # bluez-utils needs a toolchain w/ wchar, threads, dynamic library
@@ -2209,6 +2313,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 # BR2_PACKAGE_BMON is not set
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BOINC is not set
+# BR2_PACKAGE_BRCM_PATCHRAM_PLUS is not set
 # BR2_PACKAGE_BRIDGE_UTILS is not set
 # BR2_PACKAGE_BWM_NG is not set
 # BR2_PACKAGE_C_ICAP is not set
@@ -2225,6 +2330,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 # connman-gtk needs libgtk3 and a glibc or uClibc toolchain w/ wchar, threads, resolver, dynamic library
 #
 # BR2_PACKAGE_CONNTRACK_TOOLS is not set
+# BR2_PACKAGE_CORKSCREW is not set
 # BR2_PACKAGE_CRDA is not set
 # BR2_PACKAGE_CTORRENT is not set
 # BR2_PACKAGE_CUPS is not set
@@ -2234,6 +2340,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 #
 # BR2_PACKAGE_DANTE is not set
 # BR2_PACKAGE_DARKHTTPD is not set
+# BR2_PACKAGE_DEHYDRATED is not set
 BR2_PACKAGE_DHCPCD=y
 # BR2_PACKAGE_DHCPDUMP is not set
 # BR2_PACKAGE_DNSMASQ is not set
@@ -2244,6 +2351,7 @@ BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS=y
 BR2_PACKAGE_DROPBEAR_SMALL=y
 # BR2_PACKAGE_DROPBEAR_WTMP is not set
 # BR2_PACKAGE_DROPBEAR_LASTLOG is not set
+# BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO is not set
 # BR2_PACKAGE_EBTABLES is not set
 
 #
@@ -2260,6 +2368,7 @@ BR2_PACKAGE_ETHTOOL_PRETTY_PRINT=y
 #
 # freeswitch needs a toolchain w/ C++, dynamic library, threads, wchar
 #
+# BR2_PACKAGE_GERBERA is not set
 
 #
 # gesftpserver needs a toolchain w/ wchar, threads
@@ -2270,6 +2379,8 @@ BR2_PACKAGE_ETHTOOL_PRETTY_PRINT=y
 # gupnp-tools needs libgtk3
 #
 # BR2_PACKAGE_HANS is not set
+BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS=y
+# BR2_PACKAGE_HAPROXY is not set
 # BR2_PACKAGE_HIAWATHA is not set
 # BR2_PACKAGE_HOSTAPD is not set
 
@@ -2312,6 +2423,10 @@ BR2_PACKAGE_IPUTILS=y
 #
 # BR2_PACKAGE_IW is not set
 
+#
+# iwd needs a toolchain w/ dynamic library, wchar
+#
+
 #
 # janus-gateway needs a toolchain w/ dynamic library, threads, wchar
 #
@@ -2336,6 +2451,7 @@ BR2_PACKAGE_IPUTILS=y
 # BR2_PACKAGE_MACCHANGER is not set
 # BR2_PACKAGE_MEMCACHED is not set
 # BR2_PACKAGE_MII_DIAG is not set
+# BR2_PACKAGE_MINI_SNMPD is not set
 
 #
 # minidlna needs a toolchain w/ dynamic library, threads, wchar
@@ -2344,16 +2460,16 @@ BR2_PACKAGE_IPUTILS=y
 # BR2_PACKAGE_MJPG_STREAMER is not set
 
 #
-# modemmanager needs udev /dev management and a toolchain w/ wchar, threads
+# modemmanager needs a toolchain w/ wchar, threads
 #
 
 #
-# mongrel2 needs a uClibc or glibc toolchain w/ C++, NPTL, dynamic library
+# mongrel2 needs a uClibc or glibc toolchain w/ C++, threads, dynamic library
 #
 # BR2_PACKAGE_MONKEY is not set
 
 #
-# mosh needs a toolchain w/ C++, threads, dynamic library, wchar, host and target gcc >= 4.5
+# mosh needs a toolchain w/ C++, threads, dynamic library, wchar, host and target gcc >= 4.8
 #
 # BR2_PACKAGE_MOSQUITTO is not set
 # BR2_PACKAGE_MROUTED is not set
@@ -2392,6 +2508,7 @@ BR2_PACKAGE_IPUTILS=y
 # BR2_PACKAGE_OPEN_PLC_UTILS is not set
 # BR2_PACKAGE_OPENNTPD is not set
 # BR2_PACKAGE_OPENOBEX is not set
+# BR2_PACKAGE_OPENRESOLV is not set
 # BR2_PACKAGE_OPENSSH is not set
 # BR2_PACKAGE_OPENSWAN is not set
 # BR2_PACKAGE_OPENVPN is not set
@@ -2430,7 +2547,7 @@ BR2_PACKAGE_IPUTILS=y
 # BR2_PACKAGE_RSYNC is not set
 
 #
-# rtorrent needs a toolchain w/ C++, threads, wchar
+# rtorrent needs a toolchain w/ C++, threads, wchar, gcc >= 4.9
 #
 # BR2_PACKAGE_RTPTOOLS is not set
 # BR2_PACKAGE_S6_DNS is not set
@@ -2441,6 +2558,7 @@ BR2_PACKAGE_IPUTILS=y
 #
 # BR2_PACKAGE_SCONESERVER is not set
 # BR2_PACKAGE_SER2NET is not set
+# BR2_PACKAGE_SHADOWSOCKS_LIBEV is not set
 # BR2_PACKAGE_SHAIRPORT_SYNC is not set
 # BR2_PACKAGE_SHELLINABOX is not set
 # BR2_PACKAGE_SMCROUTE is not set
@@ -2468,7 +2586,6 @@ BR2_PACKAGE_IPUTILS=y
 # BR2_PACKAGE_THTTPD is not set
 # BR2_PACKAGE_TINC is not set
 # BR2_PACKAGE_TINYHTTPD is not set
-# BR2_PACKAGE_TN5250 is not set
 # BR2_PACKAGE_TOR is not set
 # BR2_PACKAGE_TRACEROUTE is not set
 # BR2_PACKAGE_TRANSMISSION is not set
@@ -2570,6 +2687,7 @@ BR2_PACKAGE_IPUTILS=y
 #
 # Real-Time
 #
+# BR2_PACKAGE_XENOMAI is not set
 
 #
 # Security
@@ -2640,6 +2758,7 @@ BR2_PACKAGE_IPUTILS=y
 #
 # BR2_PACKAGE_SCREEN is not set
 # BR2_PACKAGE_SUDO is not set
+# BR2_PACKAGE_TINI is not set
 
 #
 # tmux needs a toolchain w/ wchar, locale
@@ -2659,18 +2778,25 @@ BR2_PACKAGE_AUDIT_ARCH_SUPPORTS=y
 # BR2_PACKAGE_CGROUPFS_MOUNT is not set
 
 #
-# circus needs Python and a toolchain w/ C++, NPTL
+# circus needs Python and a toolchain w/ C++, threads
 #
 # BR2_PACKAGE_CPULOAD is not set
 # BR2_PACKAGE_DAEMON is not set
 # BR2_PACKAGE_DC3DD is not set
 # BR2_PACKAGE_DDRESCUE is not set
+# BR2_PACKAGE_DOCKER_CLI is not set
 
 #
 # docker-compose needs a toolchain w/ wchar, threads, dynamic library
 #
-# BR2_PACKAGE_DOCKER_CONTAINERD is not set
-# BR2_PACKAGE_DOCKER_ENGINE is not set
+
+#
+# docker-containerd needs a glibc or musl toolchain w/ threads
+#
+
+#
+# docker-engine needs a glibc or musl toolchain w/ threads
+#
 # BR2_PACKAGE_DOCKER_PROXY is not set
 # BR2_PACKAGE_EFIBOOTMGR is not set
 BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS=y
@@ -2688,7 +2814,10 @@ BR2_PACKAGE_INITSCRIPTS=y
 # iotop depends on python or python3
 #
 # BR2_PACKAGE_IPRUTILS is not set
-# BR2_PACKAGE_IRQBALANCE is not set
+
+#
+# irqbalance needs a toolchain w/ wchar, threads
+#
 # BR2_PACKAGE_KEYUTILS is not set
 # BR2_PACKAGE_KMOD is not set
 
@@ -2700,11 +2829,16 @@ BR2_PACKAGE_INITSCRIPTS=y
 # libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar
 #
 # BR2_PACKAGE_LXC is not set
+# BR2_PACKAGE_MENDER is not set
 # BR2_PACKAGE_MONIT is not set
 # BR2_PACKAGE_NCDU is not set
 # BR2_PACKAGE_NUMACTL is not set
 # BR2_PACKAGE_NUT is not set
 
+#
+# pamtester depends on linux-pam
+#
+
 #
 # polkit needs a toolchain w/ wchar, threads
 #
@@ -2719,7 +2853,6 @@ BR2_PACKAGE_INITSCRIPTS=y
 #
 # rauc needs a toolchain w/ wchar, threads
 #
-# BR2_PACKAGE_RUNC is not set
 # BR2_PACKAGE_S6 is not set
 # BR2_PACKAGE_S6_LINUX_INIT is not set
 # BR2_PACKAGE_S6_LINUX_UTILS is not set
@@ -2734,15 +2867,13 @@ BR2_PACKAGE_INITSCRIPTS=y
 #
 # BR2_PACKAGE_SWUPDATE is not set
 BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS=y
+BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS=y
 # BR2_PACKAGE_TPM_TOOLS is not set
 
 #
-# tpm2-abrmd needs a uClibc or glibc toolchain w/ C++, wchar, threads
-#
-
-#
-# tpm2-tools needs a uClibc or glibc toolchain w/ C++, wchar, threads
+# tpm2-abrmd needs a toolchain w/ dynamic library, wchar, threads
 #
+# BR2_PACKAGE_TPM2_TOOLS is not set
 
 #
 # unscd needs a glibc toolchain
@@ -2771,6 +2902,7 @@ BR2_PACKAGE_XVISOR_ARCH_SUPPORTS=y
 # Filesystem images
 #
 # BR2_TARGET_ROOTFS_AXFS is not set
+# BR2_TARGET_ROOTFS_BTRFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_CPIO_NONE=y
@@ -2783,6 +2915,7 @@ BR2_TARGET_ROOTFS_CPIO_NONE=y
 # BR2_TARGET_ROOTFS_CPIO_UIMAGE is not set
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
+# BR2_TARGET_ROOTFS_F2FS is not set
 
 #
 # initramfs needs a Linux kernel to be built
@@ -2804,7 +2937,13 @@ BR2_TARGET_ROOTFS_CPIO_NONE=y
 #
 # boot-wrapper-aarch64 needs a Linux kernel to be built
 #
+BR2_TARGET_GRUB2_ARCH_SUPPORTS=y
+
+#
+# grub2 needs a toolchain w/ wchar
+#
 # BR2_TARGET_MV_DDR_MARVELL is not set
+# BR2_TARGET_SHIM is not set
 # BR2_TARGET_UBOOT is not set
 # BR2_TARGET_VEXPRESS_FIRMWARE is not set
 
@@ -2813,7 +2952,10 @@ BR2_TARGET_ROOTFS_CPIO_NONE=y
 #
 # BR2_PACKAGE_HOST_AESPIPE is not set
 # BR2_PACKAGE_HOST_ANDROID_TOOLS is not set
+# BR2_PACKAGE_HOST_BTRFS_PROGS is not set
+# BR2_PACKAGE_HOST_CARGO is not set
 # BR2_PACKAGE_HOST_CHECKPOLICY is not set
+# BR2_PACKAGE_HOST_CHECKSEC is not set
 # BR2_PACKAGE_HOST_CMAKE is not set
 # BR2_PACKAGE_HOST_CRAMFS is not set
 # BR2_PACKAGE_HOST_CRYPTSETUP is not set
@@ -2823,6 +2965,7 @@ BR2_TARGET_ROOTFS_CPIO_NONE=y
 # BR2_PACKAGE_HOST_DTC is not set
 # BR2_PACKAGE_HOST_E2FSPROGS is not set
 # BR2_PACKAGE_HOST_E2TOOLS is not set
+# BR2_PACKAGE_HOST_F2FS_TOOLS is not set
 # BR2_PACKAGE_HOST_FAKETIME is not set
 # BR2_PACKAGE_HOST_FWUP is not set
 # BR2_PACKAGE_HOST_GENEXT2FS is not set
@@ -2835,6 +2978,7 @@ BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS=y
 # BR2_PACKAGE_HOST_GPTFDISK is not set
 # BR2_PACKAGE_HOST_IMX_MKIMAGE is not set
+# BR2_PACKAGE_HOST_IMX_USB_LOADER is not set
 # BR2_PACKAGE_HOST_JQ is not set
 # BR2_PACKAGE_HOST_JSMIN is not set
 # BR2_PACKAGE_HOST_LPC3250LOADER is not set
@@ -2857,19 +3001,119 @@ BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS=y
 # BR2_PACKAGE_HOST_QEMU is not set
 # BR2_PACKAGE_HOST_RAUC is not set
+# BR2_PACKAGE_HOST_RCW is not set
+BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_RUSTC_ARCH="aarch64"
+# BR2_PACKAGE_HOST_RUSTC is not set
+BR2_PACKAGE_PROVIDES_HOST_RUSTC="host-rust-bin"
 # BR2_PACKAGE_HOST_SAM_BA is not set
 # BR2_PACKAGE_HOST_SQUASHFS is not set
+# BR2_PACKAGE_HOST_SWIG is not set
 # BR2_PACKAGE_HOST_UBOOT_TOOLS is not set
 # BR2_PACKAGE_HOST_UTIL_LINUX is not set
+# BR2_PACKAGE_HOST_UTP_COM is not set
 # BR2_PACKAGE_HOST_VBOOT_UTILS is not set
 # BR2_PACKAGE_HOST_XORRISO is not set
 # BR2_PACKAGE_HOST_ZIP is not set
+# BR2_PACKAGE_HOST_ZSTD is not set
 
 #
 # Legacy config options
 #
 
+#
+# Legacy options removed in 2019.02
+#
+# BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK is not set
+# BR2_PACKAGE_QT is not set
+# BR2_PACKAGE_QTUIO is not set
+# BR2_PACKAGE_PINENTRY_QT4 is not set
+# BR2_PACKAGE_POPPLER_QT is not set
+# BR2_PACKAGE_OPENCV3_WITH_QT is not set
+# BR2_PACKAGE_OPENCV_WITH_QT is not set
+# BR2_PACKAGE_AMD_CATALYST_CCCLE is not set
+# BR2_PACKAGE_SDL_QTOPIA is not set
+# BR2_PACKAGE_PYTHON_PYQT is not set
+# BR2_PACKAGE_GNURADIO_QTGUI is not set
+# BR2_PACKAGE_LUACRYPTO is not set
+# BR2_PACKAGE_TN5250 is not set
+# BR2_PACKAGE_BOOST_SIGNALS is not set
+# BR2_PACKAGE_FFTW_PRECISION_SINGLE is not set
+# BR2_PACKAGE_FFTW_PRECISION_DOUBLE is not set
+# BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE is not set
+# BR2_PACKAGE_LUA_5_2 is not set
+# BR2_TARGET_GENERIC_PASSWD_MD5 is not set
+
+#
+# Legacy options removed in 2018.11
+#
+# BR2_TARGET_XLOADER is not set
+# BR2_PACKAGE_TIDSP_BINARIES is not set
+# BR2_PACKAGE_DSP_TOOLS is not set
+# BR2_PACKAGE_GST_DSP is not set
+# BR2_PACKAGE_BOOTUTILS is not set
+# BR2_PACKAGE_EXPEDITE is not set
+# BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT is not set
+# BR2_KERNEL_HEADERS_4_10 is not set
+# BR2_KERNEL_HEADERS_4_11 is not set
+# BR2_KERNEL_HEADERS_4_12 is not set
+# BR2_KERNEL_HEADERS_4_13 is not set
+# BR2_KERNEL_HEADERS_4_15 is not set
+# BR2_KERNEL_HEADERS_4_17 is not set
+# BR2_PACKAGE_LIBNFTNL_XML is not set
+# BR2_KERNEL_HEADERS_3_2 is not set
+# BR2_KERNEL_HEADERS_4_1 is not set
+# BR2_KERNEL_HEADERS_4_16 is not set
+# BR2_KERNEL_HEADERS_4_18 is not set
+
+#
+# Legacy options removed in 2018.08
+#
+# BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT is not set
+# BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19 is not set
+# BR2_PACKAGE_XPROTO_APPLEWMPROTO is not set
+# BR2_PACKAGE_XPROTO_BIGREQSPROTO is not set
+# BR2_PACKAGE_XPROTO_COMPOSITEPROTO is not set
+# BR2_PACKAGE_XPROTO_DAMAGEPROTO is not set
+# BR2_PACKAGE_XPROTO_DMXPROTO is not set
+# BR2_PACKAGE_XPROTO_DRI2PROTO is not set
+# BR2_PACKAGE_XPROTO_DRI3PROTO is not set
+# BR2_PACKAGE_XPROTO_FIXESPROTO is not set
+# BR2_PACKAGE_XPROTO_FONTCACHEPROTO is not set
+# BR2_PACKAGE_XPROTO_FONTSPROTO is not set
+# BR2_PACKAGE_XPROTO_GLPROTO is not set
+# BR2_PACKAGE_XPROTO_INPUTPROTO is not set
+# BR2_PACKAGE_XPROTO_KBPROTO is not set
+# BR2_PACKAGE_XPROTO_PRESENTPROTO is not set
+# BR2_PACKAGE_XPROTO_RANDRPROTO is not set
+# BR2_PACKAGE_XPROTO_RECORDPROTO is not set
+# BR2_PACKAGE_XPROTO_RENDERPROTO is not set
+# BR2_PACKAGE_XPROTO_RESOURCEPROTO is not set
+# BR2_PACKAGE_XPROTO_SCRNSAVERPROTO is not set
+# BR2_PACKAGE_XPROTO_VIDEOPROTO is not set
+# BR2_PACKAGE_XPROTO_WINDOWSWMPROTO is not set
+# BR2_PACKAGE_XPROTO_XCMISCPROTO is not set
+# BR2_PACKAGE_XPROTO_XEXTPROTO is not set
+# BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO is not set
+# BR2_PACKAGE_XPROTO_XF86DGAPROTO is not set
+# BR2_PACKAGE_XPROTO_XF86DRIPROTO is not set
+# BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO is not set
+# BR2_PACKAGE_XPROTO_XINERAMAPROTO is not set
+# BR2_PACKAGE_XPROTO_XPROTO is not set
+# BR2_PACKAGE_XPROTO_XPROXYMANAGEMENTPROTOCOL is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLES2 is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11 is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_DISPMANX is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER is not set
+# BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME is not set
+# BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPG123 is not set
+# BR2_GDB_VERSION_7_11 is not set
+# BR2_GDB_VERSION_7_10 is not set
+
 #
 # Legacy options removed in 2018.05
 #
diff --git a/recipes-core/non-root-initramfs/files/armhf-config b/recipes-core/non-root-initramfs/files/armhf-config
index 92c48b6..9a422c8 100644
--- a/recipes-core/non-root-initramfs/files/armhf-config
+++ b/recipes-core/non-root-initramfs/files/armhf-config
@@ -1,6 +1,6 @@
 #
 # Automatically generated file; DO NOT EDIT.
-# Buildroot 2018.05.1 Configuration
+# Buildroot 2019.02.2 Configuration
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_HOST_GCC_AT_LEAST_4_5=y
@@ -10,6 +10,7 @@ BR2_HOST_GCC_AT_LEAST_4_8=y
 BR2_HOST_GCC_AT_LEAST_4_9=y
 BR2_HOST_GCC_AT_LEAST_5=y
 BR2_HOST_GCC_AT_LEAST_6=y
+BR2_HOST_GCC_AT_LEAST_7=y
 
 #
 # Target options
@@ -35,6 +36,7 @@ BR2_arm=y
 # BR2_powerpc is not set
 # BR2_powerpc64 is not set
 # BR2_powerpc64le is not set
+# BR2_riscv is not set
 # BR2_sh is not set
 # BR2_sparc is not set
 # BR2_sparc64 is not set
@@ -52,6 +54,7 @@ BR2_BINFMT_SUPPORTS_SHARED=y
 BR2_READELF_ARCH_NAME="ARM"
 BR2_BINFMT_ELF=y
 BR2_ARM_CPU_HAS_NEON=y
+BR2_ARM_CPU_HAS_FPU=y
 BR2_ARM_CPU_HAS_VFPV2=y
 BR2_ARM_CPU_HAS_VFPV3=y
 BR2_ARM_CPU_HAS_VFPV4=y
@@ -102,6 +105,7 @@ BR2_cortex_a7=y
 #
 # BR2_cortex_m3 is not set
 # BR2_cortex_m4 is not set
+# BR2_cortex_m7 is not set
 
 #
 # armv8 cores
@@ -117,8 +121,6 @@ BR2_cortex_a7=y
 # BR2_cortex_a73_a35 is not set
 # BR2_cortex_a73_a53 is not set
 # BR2_exynos_m1 is not set
-# BR2_falkor is not set
-# BR2_qdf24xx is not set
 # BR2_xgene1 is not set
 # BR2_ARM_EABI is not set
 BR2_ARM_EABIHF=y
@@ -146,7 +148,6 @@ BR2_GIT="git"
 BR2_CVS="cvs"
 BR2_LOCALFILES="cp"
 BR2_SCP="scp"
-BR2_SSH="ssh"
 BR2_HG="hg"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
@@ -189,6 +190,7 @@ BR2_GLOBAL_PATCH_DIR=""
 # Advanced
 #
 # BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
+# BR2_FORCE_HOST_BUILD is not set
 # BR2_REPRODUCIBLE is not set
 
 #
@@ -226,19 +228,15 @@ BR2_TOOLCHAIN_BUILDROOT_LIBC="uclibc"
 #
 # Kernel Header Options
 #
-# BR2_KERNEL_HEADERS_3_2 is not set
-# BR2_KERNEL_HEADERS_4_1 is not set
 # BR2_KERNEL_HEADERS_4_4 is not set
 # BR2_KERNEL_HEADERS_4_9 is not set
-# BR2_KERNEL_HEADERS_4_10 is not set
-# BR2_KERNEL_HEADERS_4_11 is not set
-# BR2_KERNEL_HEADERS_4_12 is not set
-# BR2_KERNEL_HEADERS_4_13 is not set
 # BR2_KERNEL_HEADERS_4_14 is not set
-# BR2_KERNEL_HEADERS_4_15 is not set
-BR2_KERNEL_HEADERS_4_16=y
+BR2_KERNEL_HEADERS_4_19=y
+# BR2_KERNEL_HEADERS_4_20 is not set
 # BR2_KERNEL_HEADERS_VERSION is not set
-BR2_DEFAULT_KERNEL_HEADERS="4.16.17"
+# BR2_KERNEL_HEADERS_CUSTOM_TARBALL is not set
+# BR2_KERNEL_HEADERS_CUSTOM_GIT is not set
+BR2_DEFAULT_KERNEL_HEADERS="4.19.36"
 BR2_PACKAGE_LINUX_HEADERS=y
 
 #
@@ -260,10 +258,12 @@ BR2_UCLIBC_TARGET_ARCH="arm"
 #
 # Binutils Options
 #
+BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI=y
 # BR2_BINUTILS_VERSION_2_28_X is not set
 # BR2_BINUTILS_VERSION_2_29_X is not set
-BR2_BINUTILS_VERSION_2_30_X=y
-BR2_BINUTILS_VERSION="2.30"
+# BR2_BINUTILS_VERSION_2_30_X is not set
+BR2_BINUTILS_VERSION_2_31_X=y
+BR2_BINUTILS_VERSION="2.31.1"
 BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
 
 #
@@ -272,9 +272,9 @@ BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
 # BR2_GCC_VERSION_4_9_X is not set
 # BR2_GCC_VERSION_5_X is not set
 # BR2_GCC_VERSION_6_X is not set
-BR2_GCC_VERSION_7_X=y
-BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
-BR2_GCC_VERSION="7.3.0"
+# BR2_GCC_VERSION_7_X is not set
+BR2_GCC_VERSION_8_X=y
+BR2_GCC_VERSION="8.3.0"
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 # BR2_TOOLCHAIN_BUILDROOT_FORTRAN is not set
@@ -287,14 +287,17 @@ BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS=y
 # Host GDB Options
 #
 # BR2_PACKAGE_HOST_GDB is not set
+BR2_PACKAGE_GDB_NEEDS_CXX11=y
 
 #
 # Toolchain Generic Options
 #
+BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS=y
+BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK=y
 BR2_INSTALL_LIBSTDCPP=y
 BR2_TOOLCHAIN_HAS_THREADS=y
 BR2_TOOLCHAIN_HAS_THREADS_NPTL=y
-BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
+BR2_TOOLCHAIN_HAS_UCONTEXT=y
 BR2_TOOLCHAIN_SUPPORTS_PIE=y
 BR2_USE_MMU=y
 BR2_TARGET_OPTIMIZATION=""
@@ -337,7 +340,10 @@ BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16=y
-BR2_TOOLCHAIN_HEADERS_AT_LEAST="4.16"
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST="4.19"
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_3=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_4=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_5=y
@@ -348,7 +354,8 @@ BR2_TOOLCHAIN_GCC_AT_LEAST_4_9=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_5=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_6=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_7=y
-BR2_TOOLCHAIN_GCC_AT_LEAST="7"
+BR2_TOOLCHAIN_GCC_AT_LEAST_8=y
+BR2_TOOLCHAIN_GCC_AT_LEAST="8"
 BR2_TOOLCHAIN_HAS_MNAN_OPTION=y
 BR2_TOOLCHAIN_HAS_SYNC_1=y
 BR2_TOOLCHAIN_HAS_SYNC_2=y
@@ -363,15 +370,17 @@ BR2_TOOLCHAIN_HAS_ATOMIC=y
 #
 BR2_ROOTFS_SKELETON_DEFAULT=y
 # BR2_ROOTFS_SKELETON_CUSTOM is not set
-# BR2_ROOTFS_MERGED_USR is not set
 BR2_TARGET_GENERIC_HOSTNAME="jailhouse"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
-BR2_TARGET_GENERIC_PASSWD_MD5=y
-# BR2_TARGET_GENERIC_PASSWD_SHA256 is not set
+BR2_TARGET_GENERIC_PASSWD_SHA256=y
 # BR2_TARGET_GENERIC_PASSWD_SHA512 is not set
-BR2_TARGET_GENERIC_PASSWD_METHOD="md5"
+BR2_TARGET_GENERIC_PASSWD_METHOD="sha-256"
 BR2_INIT_BUSYBOX=y
 # BR2_INIT_SYSV is not set
+
+#
+# systemd needs a glibc toolchain w/ SSP, headers >= 3.10
+#
 # BR2_INIT_NONE is not set
 # BR2_ROOTFS_DEVICE_CREATION_STATIC is not set
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
@@ -382,6 +391,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 #
 BR2_ROOTFS_DEVICE_TABLE="system/device_table.txt"
 # BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES is not set
+# BR2_ROOTFS_MERGED_USR is not set
 BR2_TARGET_ENABLE_ROOT_LOGIN=y
 BR2_TARGET_GENERIC_ROOT_PASSWD=""
 BR2_SYSTEM_BIN_SH_BUSYBOX=y
@@ -403,6 +413,7 @@ BR2_TARGET_GENERIC_GETTY_TERM="vt100"
 BR2_TARGET_GENERIC_GETTY_OPTIONS=""
 BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
 BR2_SYSTEM_DHCP=""
+BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
 # BR2_ENABLE_LOCALE_PURGE is not set
 
 #
@@ -487,7 +498,7 @@ BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 #
 
 #
-# kodi needs an OpenGL EGL with either an openGL or an OpenGL ES backend
+# kodi needs an OpenGL EGL backend with OpenGL support
 #
 # BR2_PACKAGE_LAME is not set
 # BR2_PACKAGE_MADPLAY is not set
@@ -513,7 +524,7 @@ BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 # BR2_PACKAGE_MUSEPACK is not set
 
 #
-# ncmpc needs a toolchain w/ wchar, threads
+# ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 4.9
 #
 
 #
@@ -545,7 +556,7 @@ BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
 #
 
 #
-# vlc needs a toolchain w/ C++, dynamic library, wchar, threads, headers >= 3.7
+# vlc needs a toolchain w/ C++, dynamic library, wchar, threads, gcc >= 4.9, headers >= 3.7
 #
 # BR2_PACKAGE_VORBIS_TOOLS is not set
 # BR2_PACKAGE_WAVPACK is not set
@@ -564,6 +575,7 @@ BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
 #
 # p7zip needs a toolchain w/ threads, wchar, C++
 #
+# BR2_PACKAGE_PIGZ is not set
 
 #
 # pixz needs a toolchain w/ threads, wchar
@@ -582,6 +594,10 @@ BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
 # BR2_PACKAGE_BLKTRACE is not set
 # BR2_PACKAGE_BONNIE is not set
 BR2_PACKAGE_CACHE_CALIBRATOR=y
+
+#
+# clinfo needs an OpenCL provider
+#
 # BR2_PACKAGE_DHRYSTONE is not set
 # BR2_PACKAGE_DIEHARDER is not set
 # BR2_PACKAGE_DMALLOC is not set
@@ -658,13 +674,10 @@ BR2_PACKAGE_RT_TESTS=y
 # BR2_PACKAGE_SPIDEV_TEST is not set
 # BR2_PACKAGE_STRACE is not set
 # BR2_PACKAGE_STRESS is not set
+# BR2_PACKAGE_STRESS_NG is not set
 
 #
-# stress-ng needs a glibc toolchain w/ dynamic library, headers >= 3.3
-#
-
-#
-# sysdig needs a toolchain w/ C++, gcc >= 4.8, dynamic library and a Linux kernel to be built
+# sysdig needs a glibc or uclibc toolchain w/ C++, gcc >= 4.8, dynamic library and a Linux kernel to be built
 #
 # BR2_PACKAGE_TCF_AGENT is not set
 BR2_PACKAGE_TCF_AGENT_ARCH="arm"
@@ -676,6 +689,7 @@ BR2_PACKAGE_TRINITY_ARCH_SUPPORTS=y
 # BR2_PACKAGE_UCLIBC_NG_TEST is not set
 BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS=y
 # BR2_PACKAGE_VALGRIND is not set
+# BR2_PACKAGE_VMTOUCH is not set
 # BR2_PACKAGE_WHETSTONE is not set
 
 #
@@ -693,6 +707,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7, NPTL
 #
 # BR2_PACKAGE_CPPUNIT is not set
+# BR2_PACKAGE_CUNIT is not set
 
 #
 # cvs needs a toolchain w/ wchar
@@ -737,6 +752,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # curlftpfs needs a toolchain w/ wchar, threads, dynamic library
 #
+# BR2_PACKAGE_DAVFS2 is not set
 
 #
 # dosfstools needs a toolchain w/ wchar
@@ -771,6 +787,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # BR2_PACKAGE_GENEXT2FS is not set
 # BR2_PACKAGE_GENPART is not set
 # BR2_PACKAGE_GENROMFS is not set
+# BR2_PACKAGE_IMX_USB_LOADER is not set
 # BR2_PACKAGE_MMC_UTILS is not set
 # BR2_PACKAGE_MTD is not set
 
@@ -849,7 +866,10 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # BR2_PACKAGE_OPENTYRIAN is not set
 # BR2_PACKAGE_PRBOOM is not set
 # BR2_PACKAGE_SL is not set
-# BR2_PACKAGE_SOLARUS is not set
+
+#
+# solarus needs OpenGL and a toolchain w/ C++, gcc >= 4.8, NPTL, dynamic library
+#
 # BR2_PACKAGE_STELLA is not set
 
 #
@@ -871,6 +891,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # jhead needs a toolchain w/ wchar
 #
 # BR2_PACKAGE_LIBVA_UTILS is not set
+# BR2_PACKAGE_NETSURF is not set
 # BR2_PACKAGE_PNGQUANT is not set
 
 #
@@ -919,7 +940,6 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # Other GUIs
 #
-# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 
 #
@@ -939,11 +959,11 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 #
 
 #
-# midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 5, host gcc >= 4.8
+# midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8
 #
 
 #
-# vte needs a toolchain w/ wchar, threads, C++
+# vte needs a toolchain w/ wchar, threads, C++, gcc >= 4.8
 #
 
 #
@@ -977,6 +997,7 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 # a10disp needs a Linux kernel to be built
 #
 # BR2_PACKAGE_ACPICA is not set
+# BR2_PACKAGE_ACPID is not set
 # BR2_PACKAGE_ACPITOOL is not set
 # BR2_PACKAGE_AER_INJECT is not set
 # BR2_PACKAGE_AM335X_PRU_PACKAGE is not set
@@ -1005,11 +1026,7 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 #
 
 #
-# dahdi-tools needs a toolchain w/ threads
-#
-
-#
-# dahdi-tools needs a Linux kernel to be built
+# dahdi-tools needs a toolchain w/ threads and a Linux kernel to be built
 #
 # BR2_PACKAGE_DBUS is not set
 # BR2_PACKAGE_DFU_UTIL is not set
@@ -1036,6 +1053,8 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 # BR2_PACKAGE_FAN_CTRL is not set
 # BR2_PACKAGE_FCONFIG is not set
 # BR2_PACKAGE_FIS is not set
+BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS=y
+# BR2_PACKAGE_FLASHROM is not set
 # BR2_PACKAGE_FMTOOLS is not set
 # BR2_PACKAGE_FREESCALE_IMX is not set
 # BR2_PACKAGE_FXLOAD is not set
@@ -1120,6 +1139,7 @@ BR2_PACKAGE_PCIUTILS=y
 # BR2_PACKAGE_PDBG is not set
 # BR2_PACKAGE_PICOCOM is not set
 # BR2_PACKAGE_PIFMRDS is not set
+# BR2_PACKAGE_PIGPIO is not set
 
 #
 # powertop needs a toolchain w/ C++, threads, wchar
@@ -1130,6 +1150,7 @@ BR2_PACKAGE_PCIUTILS=y
 # BR2_PACKAGE_RNG_TOOLS is not set
 # BR2_PACKAGE_RPI_USERLAND is not set
 # BR2_PACKAGE_RS485CONF is not set
+# BR2_PACKAGE_RTC_TOOLS is not set
 
 #
 # rtl8188eu needs a Linux kernel to be built
@@ -1152,11 +1173,13 @@ BR2_PACKAGE_PCIUTILS=y
 #
 # BR2_PACKAGE_SANE_BACKENDS is not set
 # BR2_PACKAGE_SDPARM is not set
+BR2_PACKAGE_SEDUTIL_ARCH_SUPPORTS=y
+# BR2_PACKAGE_SEDUTIL is not set
 BR2_PACKAGE_SETSERIAL=y
 # BR2_PACKAGE_SG3_UTILS is not set
 
 #
-# sigrok-cli needs a toolchain w/ wchar, threads, dynamic library, gcc >= 4.7
+# sigrok-cli needs a toolchain w/ locale, wchar, threads, dynamic library, gcc >= 4.7
 #
 
 #
@@ -1219,7 +1242,7 @@ BR2_PACKAGE_SETSERIAL=y
 #
 
 #
-# udisks needs a glibc or uClibc toolchain w/ wchar, threads, dynamic library
+# udisks needs a glibc toolchain w/ wchar, threads, dynamic library
 #
 # BR2_PACKAGE_UHUBCTL is not set
 
@@ -1354,7 +1377,9 @@ BR2_PACKAGE_OPENAL_ARCH_SUPPORTS=y
 # BR2_PACKAGE_OPUSFILE is not set
 # BR2_PACKAGE_PORTAUDIO is not set
 # BR2_PACKAGE_SBC is not set
+# BR2_PACKAGE_SPANDSP is not set
 # BR2_PACKAGE_SPEEX is not set
+# BR2_PACKAGE_SPEEXDSP is not set
 
 #
 # taglib needs a toolchain w/ C++, wchar
@@ -1375,7 +1400,10 @@ BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBSQUISH is not set
 # BR2_PACKAGE_LIBZIP is not set
 # BR2_PACKAGE_LZO is not set
-# BR2_PACKAGE_MINIZIP is not set
+
+#
+# minizip needs a toolchain w/ wchar
+#
 # BR2_PACKAGE_SNAPPY is not set
 # BR2_PACKAGE_SZIP is not set
 BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS=y
@@ -1445,13 +1473,17 @@ BR2_PACKAGE_PROVIDES_HOST_OPENSSL="host-libopenssl"
 # kompexsqlite needs a toolchain w/ C++, wchar, threads, dynamic library
 #
 # BR2_PACKAGE_LEVELDB is not set
+# BR2_PACKAGE_LIBGIT2 is not set
 BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 
 #
-# mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 4.8
+# mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 6
 #
 # BR2_PACKAGE_MYSQL is not set
-# BR2_PACKAGE_POSTGRESQL is not set
+
+#
+# postgresql needs a toolchain w/ dynamic library, wchar
+#
 # BR2_PACKAGE_REDIS is not set
 # BR2_PACKAGE_SQLCIPHER is not set
 # BR2_PACKAGE_SQLITE is not set
@@ -1478,6 +1510,22 @@ BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_ASSIMP is not set
 
+#
+# at-spi2-atk needs a toolchain w/ wchar, threads
+#
+
+#
+# at-spi2-atk depends on X.org
+#
+
+#
+# at-spi2-core needs a toolchain w/ wchar, threads
+#
+
+#
+# at-spi2-core depends on X.org
+#
+
 #
 # atk needs a toolchain w/ wchar, threads
 #
@@ -1499,6 +1547,7 @@ BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 #
 # exiv2 needs a uClibc or glibc toolchain w/ C++, wchar, dynamic library, threads
 #
+# BR2_PACKAGE_EXEMPI is not set
 # BR2_PACKAGE_FONTCONFIG is not set
 # BR2_PACKAGE_FREETYPE is not set
 # BR2_PACKAGE_GD is not set
@@ -1629,9 +1678,10 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # BR2_PACKAGE_TIFF is not set
 # BR2_PACKAGE_WAYLAND is not set
 BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS=y
+BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT=y
 
 #
-# webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 5, host gcc >= 4.8
+# webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8
 #
 # BR2_PACKAGE_WEBP is not set
 # BR2_PACKAGE_WOFF2 is not set
@@ -1646,18 +1696,15 @@ BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS=y
 # BR2_PACKAGE_C_PERIPHERY is not set
 # BR2_PACKAGE_CCID is not set
 # BR2_PACKAGE_DTC is not set
+BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=y
 # BR2_PACKAGE_GNU_EFI is not set
-
-#
-# hackrf needs fftw's single precision
-#
+# BR2_PACKAGE_HACKRF is not set
 
 #
 # hidapi needs udev /dev management and a toolchain w/ NPTL threads
 #
 # BR2_PACKAGE_LCDAPI is not set
 # BR2_PACKAGE_LET_ME_CREATE is not set
-BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBAIO is not set
 
 #
@@ -1703,12 +1750,12 @@ BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBRTLSDR is not set
 
 #
-# libserial needs a toolchain w/ C++, threads, wchar
+# libserial needs a toolchain w/ C++, gcc >= 5, threads, wchar
 #
 # BR2_PACKAGE_LIBSERIALPORT is not set
 
 #
-# libsigrok needs a toolchain w/ wchar, threads, dynamic library, gcc >= 4.7
+# libsigrok needs a toolchain w/ wchar, locale, threads, dynamic library, gcc >= 4.7
 #
 
 #
@@ -1744,6 +1791,7 @@ BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_ANGULARJS is not set
 # BR2_PACKAGE_BOOTSTRAP is not set
+# BR2_PACKAGE_DUKTAPE is not set
 # BR2_PACKAGE_EXPLORERCANVAS is not set
 # BR2_PACKAGE_FLOT is not set
 # BR2_PACKAGE_JQUERY is not set
@@ -1796,10 +1844,7 @@ BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS=y
 # xerces-c++ needs a toolchain w/ C++, wchar
 #
 # BR2_PACKAGE_YAJL is not set
-
-#
-# yaml-cpp needs a toolchain w/ C++, threads, wchar
-#
+# BR2_PACKAGE_YAML_CPP is not set
 
 #
 # Logging
@@ -1858,6 +1903,7 @@ BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBOGG is not set
 BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBOPENH264 is not set
+# BR2_PACKAGE_LIBOPUSENC is not set
 # BR2_PACKAGE_LIBPLAYER is not set
 # BR2_PACKAGE_LIBTHEORA is not set
 # BR2_PACKAGE_LIBVPX is not set
@@ -1898,14 +1944,16 @@ BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS=y
 # BR2_PACKAGE_CURLPP is not set
 # BR2_PACKAGE_CZMQ is not set
 # BR2_PACKAGE_DAQ is not set
+# BR2_PACKAGE_DAVICI is not set
 # BR2_PACKAGE_FILEMQ is not set
 # BR2_PACKAGE_FLICKCURL is not set
 # BR2_PACKAGE_FREERADIUS_CLIENT is not set
 # BR2_PACKAGE_GEOIP is not set
 
 #
-# glib-networking needs a toolchain w/ wchar, threads
+# glib-networking needs a toolchain w/ wchar, threads, dynamic library
 #
+# BR2_PACKAGE_GRPC is not set
 
 #
 # gssdp needs a toolchain w/ wchar, threads
@@ -1941,6 +1989,7 @@ BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_LIBHTTPPARSER is not set
 # BR2_PACKAGE_LIBIDN is not set
+# BR2_PACKAGE_LIBIDN2 is not set
 # BR2_PACKAGE_LIBISCSI is not set
 # BR2_PACKAGE_LIBKRB5 is not set
 # BR2_PACKAGE_LIBLDNS is not set
@@ -1970,6 +2019,7 @@ BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBOAUTH is not set
 # BR2_PACKAGE_LIBOPING is not set
 # BR2_PACKAGE_LIBOSIP2 is not set
+# BR2_PACKAGE_LIBPAGEKITE is not set
 # BR2_PACKAGE_LIBPCAP is not set
 # BR2_PACKAGE_LIBPJSIP is not set
 # BR2_PACKAGE_LIBRSYNC is not set
@@ -1984,6 +2034,10 @@ BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBSTROPHE is not set
 BR2_PACKAGE_LIBTIRPC=y
 # BR2_PACKAGE_LIBTORRENT is not set
+
+#
+# libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.8
+#
 # BR2_PACKAGE_LIBUPNP is not set
 # BR2_PACKAGE_LIBUPNP18 is not set
 # BR2_PACKAGE_LIBUPNPP is not set
@@ -1995,8 +2049,13 @@ BR2_PACKAGE_LIBTIRPC=y
 # BR2_PACKAGE_MONGOOSE is not set
 # BR2_PACKAGE_NANOMSG is not set
 # BR2_PACKAGE_NEON is not set
+# BR2_PACKAGE_NGHTTP2 is not set
 # BR2_PACKAGE_NORM is not set
 
+#
+# nss-myhostname needs a glibc toolchain
+#
+
 #
 # nss-pam-ldapd needs a glibc toolchain
 #
@@ -2031,6 +2090,8 @@ BR2_PACKAGE_LIBTIRPC=y
 # thrift needs a toolchain w/ C++, wchar, threads
 #
 # BR2_PACKAGE_USBREDIR is not set
+# BR2_PACKAGE_WAMPCC is not set
+# BR2_PACKAGE_WEBSOCKETPP is not set
 # BR2_PACKAGE_ZEROMQ is not set
 # BR2_PACKAGE_ZMQPP is not set
 # BR2_PACKAGE_ZYRE is not set
@@ -2049,6 +2110,7 @@ BR2_PACKAGE_LIBTIRPC=y
 #
 # boost needs a toolchain w/ C++, threads, wchar
 #
+# BR2_PACKAGE_CAPNPROTO is not set
 
 #
 # clang needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library
@@ -2056,6 +2118,7 @@ BR2_PACKAGE_LIBTIRPC=y
 # BR2_PACKAGE_CLAPACK is not set
 BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS=y
 # BR2_PACKAGE_CLASSPATH is not set
+# BR2_PACKAGE_CMOCKA is not set
 
 #
 # cppcms needs a toolchain w/ C++, NPTL, wchar, dynamic library
@@ -2068,9 +2131,14 @@ BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS=y
 #
 # elfutils needs a uClibc or glibc toolchain w/ wchar, dynamic library
 #
+
+#
+# ell needs a toolchain w/ dynamic library, wchar
+#
 # BR2_PACKAGE_FFTW is not set
 # BR2_PACKAGE_FLANN is not set
 # BR2_PACKAGE_FLATBUFFERS is not set
+# BR2_PACKAGE_FLATCC is not set
 
 #
 # gconf needs a toolchain w/ threads, wchar, dynamic library
@@ -2108,7 +2176,9 @@ BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS=y
 #
 # libcgroup needs a glibc toolchain w/ C++
 #
+# BR2_PACKAGE_LIBCLC is not set
 # BR2_PACKAGE_LIBCOFI is not set
+# BR2_PACKAGE_LIBCORRECT is not set
 
 #
 # libcroco needs a toolchain w/ wchar, threads
@@ -2166,15 +2236,15 @@ BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS=y
 #
 # linux-pam needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library
 #
-BR2_PACKAGE_LLVM_ARCH_SUPPORTS=y
-BR2_PACKAGE_LLVM_TARGET_ARCH="ARM"
 
 #
-# llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library
+# liquid-dsp requires a glibc or musl toolchain w/ dynamic library
 #
+BR2_PACKAGE_LLVM_ARCH_SUPPORTS=y
+BR2_PACKAGE_LLVM_TARGET_ARCH="ARM"
 
 #
-# liquid-dsp requires a glibc or musl toolchain w/ dynamic library
+# llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library
 #
 
 #
@@ -2208,6 +2278,7 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 # BR2_PACKAGE_SKALIBS is not set
 # BR2_PACKAGE_SPHINXBASE is not set
 # BR2_PACKAGE_TINYCBOR is not set
+# BR2_PACKAGE_XAPIAN is not set
 
 #
 # Security
@@ -2288,11 +2359,14 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_AESPIPE is not set
 # BR2_PACKAGE_BC is not set
-# BR2_PACKAGE_CLAMAV is not set
+
+#
+# clamav needs a toolchain w/ C++, threads, wchar
+#
 # BR2_PACKAGE_COLLECTD is not set
 
 #
-# domoticz needs lua >= 5.2 and a toolchain w/ C++, NPTL, wchar, dynamic library
+# domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 4.8, NPTL, wchar, dynamic library
 #
 # BR2_PACKAGE_EMPTY is not set
 
@@ -2302,11 +2376,11 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 # BR2_PACKAGE_GOOGLEFONTDIRECTORY is not set
 
 #
-# gqrx needs a toolchain w/ C++, threads, wchar
+# gqrx needs a toolchain w/ C++, threads, wchar, dynamic library
 #
 
 #
-# gqrx needs qt5, gnuradio, fftw's single precision
+# gqrx needs qt5
 #
 
 #
@@ -2344,7 +2418,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 # BR2_PACKAGE_ARPTABLES is not set
 
 #
-# asterisk needs a glibc toolchain w/ C++
+# asterisk needs a glibc or uClibc toolchain w/ C++, dynamic library, threads, wchar
 #
 # BR2_PACKAGE_ATFTP is not set
 # BR2_PACKAGE_AUTOSSH is not set
@@ -2355,6 +2429,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 # BR2_PACKAGE_BATCTL is not set
 # BR2_PACKAGE_BCUSDK is not set
 # BR2_PACKAGE_BIND is not set
+# BR2_PACKAGE_BIRD is not set
 
 #
 # bluez-utils needs a toolchain w/ wchar, threads, dynamic library
@@ -2366,6 +2441,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 # BR2_PACKAGE_BMON is not set
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BOINC is not set
+# BR2_PACKAGE_BRCM_PATCHRAM_PLUS is not set
 # BR2_PACKAGE_BRIDGE_UTILS is not set
 # BR2_PACKAGE_BWM_NG is not set
 # BR2_PACKAGE_C_ICAP is not set
@@ -2382,6 +2458,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 # connman-gtk needs libgtk3 and a glibc or uClibc toolchain w/ wchar, threads, resolver, dynamic library
 #
 # BR2_PACKAGE_CONNTRACK_TOOLS is not set
+# BR2_PACKAGE_CORKSCREW is not set
 # BR2_PACKAGE_CRDA is not set
 # BR2_PACKAGE_CTORRENT is not set
 # BR2_PACKAGE_CUPS is not set
@@ -2391,6 +2468,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 #
 # BR2_PACKAGE_DANTE is not set
 # BR2_PACKAGE_DARKHTTPD is not set
+# BR2_PACKAGE_DEHYDRATED is not set
 BR2_PACKAGE_DHCPCD=y
 # BR2_PACKAGE_DHCPDUMP is not set
 # BR2_PACKAGE_DNSMASQ is not set
@@ -2401,6 +2479,7 @@ BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS=y
 BR2_PACKAGE_DROPBEAR_SMALL=y
 # BR2_PACKAGE_DROPBEAR_WTMP is not set
 # BR2_PACKAGE_DROPBEAR_LASTLOG is not set
+# BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO is not set
 # BR2_PACKAGE_EBTABLES is not set
 
 #
@@ -2417,6 +2496,7 @@ BR2_PACKAGE_ETHTOOL_PRETTY_PRINT=y
 #
 # freeswitch needs a toolchain w/ C++, dynamic library, threads, wchar
 #
+# BR2_PACKAGE_GERBERA is not set
 
 #
 # gesftpserver needs a toolchain w/ wchar, threads
@@ -2427,6 +2507,8 @@ BR2_PACKAGE_ETHTOOL_PRETTY_PRINT=y
 # gupnp-tools needs libgtk3
 #
 # BR2_PACKAGE_HANS is not set
+BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS=y
+# BR2_PACKAGE_HAPROXY is not set
 # BR2_PACKAGE_HIAWATHA is not set
 # BR2_PACKAGE_HOSTAPD is not set
 
@@ -2469,6 +2551,10 @@ BR2_PACKAGE_IPUTILS=y
 #
 # BR2_PACKAGE_IW is not set
 
+#
+# iwd needs a toolchain w/ dynamic library, wchar
+#
+
 #
 # janus-gateway needs a toolchain w/ dynamic library, threads, wchar
 #
@@ -2493,6 +2579,7 @@ BR2_PACKAGE_IPUTILS=y
 # BR2_PACKAGE_MACCHANGER is not set
 # BR2_PACKAGE_MEMCACHED is not set
 # BR2_PACKAGE_MII_DIAG is not set
+# BR2_PACKAGE_MINI_SNMPD is not set
 
 #
 # minidlna needs a toolchain w/ dynamic library, threads, wchar
@@ -2501,14 +2588,14 @@ BR2_PACKAGE_IPUTILS=y
 # BR2_PACKAGE_MJPG_STREAMER is not set
 
 #
-# modemmanager needs udev /dev management and a toolchain w/ wchar, threads
+# modemmanager needs a toolchain w/ wchar, threads
 #
 BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_MONGREL2 is not set
 # BR2_PACKAGE_MONKEY is not set
 
 #
-# mosh needs a toolchain w/ C++, threads, dynamic library, wchar, host and target gcc >= 4.5
+# mosh needs a toolchain w/ C++, threads, dynamic library, wchar, host and target gcc >= 4.8
 #
 # BR2_PACKAGE_MOSQUITTO is not set
 # BR2_PACKAGE_MROUTED is not set
@@ -2547,6 +2634,7 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_OPEN_PLC_UTILS is not set
 # BR2_PACKAGE_OPENNTPD is not set
 # BR2_PACKAGE_OPENOBEX is not set
+# BR2_PACKAGE_OPENRESOLV is not set
 # BR2_PACKAGE_OPENSSH is not set
 # BR2_PACKAGE_OPENSWAN is not set
 # BR2_PACKAGE_OPENVPN is not set
@@ -2585,7 +2673,7 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_RSYNC is not set
 
 #
-# rtorrent needs a toolchain w/ C++, threads, wchar
+# rtorrent needs a toolchain w/ C++, threads, wchar, gcc >= 4.9
 #
 # BR2_PACKAGE_RTPTOOLS is not set
 # BR2_PACKAGE_S6_DNS is not set
@@ -2596,6 +2684,7 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 #
 # BR2_PACKAGE_SCONESERVER is not set
 # BR2_PACKAGE_SER2NET is not set
+# BR2_PACKAGE_SHADOWSOCKS_LIBEV is not set
 # BR2_PACKAGE_SHAIRPORT_SYNC is not set
 # BR2_PACKAGE_SHELLINABOX is not set
 # BR2_PACKAGE_SMCROUTE is not set
@@ -2623,7 +2712,6 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_THTTPD is not set
 # BR2_PACKAGE_TINC is not set
 # BR2_PACKAGE_TINYHTTPD is not set
-# BR2_PACKAGE_TN5250 is not set
 # BR2_PACKAGE_TOR is not set
 # BR2_PACKAGE_TRACEROUTE is not set
 # BR2_PACKAGE_TRANSMISSION is not set
@@ -2725,7 +2813,7 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 #
 # Real-Time
 #
-BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS=y
+BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS=y
 # BR2_PACKAGE_XENOMAI is not set
 
 #
@@ -2797,6 +2885,7 @@ BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_SCREEN is not set
 # BR2_PACKAGE_SUDO is not set
+# BR2_PACKAGE_TINI is not set
 
 #
 # tmux needs a toolchain w/ wchar, locale
@@ -2816,18 +2905,25 @@ BR2_PACKAGE_AUDIT_ARCH_SUPPORTS=y
 # BR2_PACKAGE_CGROUPFS_MOUNT is not set
 
 #
-# circus needs Python and a toolchain w/ C++, NPTL
+# circus needs Python and a toolchain w/ C++, threads
 #
 # BR2_PACKAGE_CPULOAD is not set
 # BR2_PACKAGE_DAEMON is not set
 # BR2_PACKAGE_DC3DD is not set
 # BR2_PACKAGE_DDRESCUE is not set
+# BR2_PACKAGE_DOCKER_CLI is not set
 
 #
 # docker-compose needs a toolchain w/ wchar, threads, dynamic library
 #
-# BR2_PACKAGE_DOCKER_CONTAINERD is not set
-# BR2_PACKAGE_DOCKER_ENGINE is not set
+
+#
+# docker-containerd needs a glibc or musl toolchain w/ threads
+#
+
+#
+# docker-engine needs a glibc or musl toolchain w/ threads
+#
 # BR2_PACKAGE_DOCKER_PROXY is not set
 # BR2_PACKAGE_EFIBOOTMGR is not set
 BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS=y
@@ -2845,7 +2941,10 @@ BR2_PACKAGE_INITSCRIPTS=y
 # iotop depends on python or python3
 #
 # BR2_PACKAGE_IPRUTILS is not set
-# BR2_PACKAGE_IRQBALANCE is not set
+
+#
+# irqbalance needs a toolchain w/ wchar, threads
+#
 # BR2_PACKAGE_KEYUTILS is not set
 # BR2_PACKAGE_KMOD is not set
 
@@ -2857,10 +2956,15 @@ BR2_PACKAGE_INITSCRIPTS=y
 # libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar
 #
 # BR2_PACKAGE_LXC is not set
+# BR2_PACKAGE_MENDER is not set
 # BR2_PACKAGE_MONIT is not set
 # BR2_PACKAGE_NCDU is not set
 # BR2_PACKAGE_NUT is not set
 
+#
+# pamtester depends on linux-pam
+#
+
 #
 # polkit needs a toolchain w/ wchar, threads
 #
@@ -2875,7 +2979,6 @@ BR2_PACKAGE_INITSCRIPTS=y
 #
 # rauc needs a toolchain w/ wchar, threads
 #
-# BR2_PACKAGE_RUNC is not set
 # BR2_PACKAGE_S6 is not set
 # BR2_PACKAGE_S6_LINUX_INIT is not set
 # BR2_PACKAGE_S6_LINUX_UTILS is not set
@@ -2890,15 +2993,13 @@ BR2_PACKAGE_INITSCRIPTS=y
 #
 # BR2_PACKAGE_SWUPDATE is not set
 BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS=y
+BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS=y
 # BR2_PACKAGE_TPM_TOOLS is not set
 
 #
-# tpm2-abrmd needs a uClibc or glibc toolchain w/ C++, wchar, threads
-#
-
-#
-# tpm2-tools needs a uClibc or glibc toolchain w/ C++, wchar, threads
+# tpm2-abrmd needs a toolchain w/ dynamic library, wchar, threads
 #
+# BR2_PACKAGE_TPM2_TOOLS is not set
 
 #
 # unscd needs a glibc toolchain
@@ -2927,6 +3028,7 @@ BR2_PACKAGE_XVISOR_ARCH_SUPPORTS=y
 # Filesystem images
 #
 # BR2_TARGET_ROOTFS_AXFS is not set
+# BR2_TARGET_ROOTFS_BTRFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_CPIO_NONE=y
@@ -2939,6 +3041,7 @@ BR2_TARGET_ROOTFS_CPIO_NONE=y
 # BR2_TARGET_ROOTFS_CPIO_UIMAGE is not set
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
+# BR2_TARGET_ROOTFS_F2FS is not set
 
 #
 # initramfs needs a Linux kernel to be built
@@ -2956,6 +3059,11 @@ BR2_TARGET_ROOTFS_CPIO_NONE=y
 #
 # BR2_TARGET_AFBOOT_STM32 is not set
 # BR2_TARGET_BAREBOX is not set
+BR2_TARGET_GRUB2_ARCH_SUPPORTS=y
+
+#
+# grub2 needs a toolchain w/ wchar
+#
 # BR2_TARGET_MXS_BOOTLETS is not set
 # BR2_TARGET_S500_BOOTLOADER is not set
 # BR2_TARGET_TS4800_MBRBOOT is not set
@@ -2966,8 +3074,11 @@ BR2_TARGET_ROOTFS_CPIO_NONE=y
 #
 # BR2_PACKAGE_HOST_AESPIPE is not set
 # BR2_PACKAGE_HOST_ANDROID_TOOLS is not set
+# BR2_PACKAGE_HOST_BTRFS_PROGS is not set
+# BR2_PACKAGE_HOST_CARGO is not set
 # BR2_PACKAGE_HOST_CBOOTIMAGE is not set
 # BR2_PACKAGE_HOST_CHECKPOLICY is not set
+# BR2_PACKAGE_HOST_CHECKSEC is not set
 # BR2_PACKAGE_HOST_CMAKE is not set
 # BR2_PACKAGE_HOST_CRAMFS is not set
 # BR2_PACKAGE_HOST_CRYPTSETUP is not set
@@ -2977,6 +3088,7 @@ BR2_TARGET_ROOTFS_CPIO_NONE=y
 # BR2_PACKAGE_HOST_DTC is not set
 # BR2_PACKAGE_HOST_E2FSPROGS is not set
 # BR2_PACKAGE_HOST_E2TOOLS is not set
+# BR2_PACKAGE_HOST_F2FS_TOOLS is not set
 # BR2_PACKAGE_HOST_FAKETIME is not set
 # BR2_PACKAGE_HOST_FWUP is not set
 # BR2_PACKAGE_HOST_GENEXT2FS is not set
@@ -3017,24 +3129,123 @@ BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS=y
 # BR2_PACKAGE_HOST_QEMU is not set
 # BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT is not set
 # BR2_PACKAGE_HOST_RAUC is not set
+# BR2_PACKAGE_HOST_RCW is not set
+BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_RUSTC_ARCH="armv7"
 BR2_PACKAGE_HOST_RUSTC_ABI="eabihf"
+# BR2_PACKAGE_HOST_RUSTC is not set
+BR2_PACKAGE_PROVIDES_HOST_RUSTC="host-rust-bin"
 # BR2_PACKAGE_HOST_SAM_BA is not set
 # BR2_PACKAGE_HOST_SQUASHFS is not set
 # BR2_PACKAGE_HOST_SUNXI_TOOLS is not set
+# BR2_PACKAGE_HOST_SWIG is not set
 # BR2_PACKAGE_HOST_TEGRARCM is not set
 BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS=y
 # BR2_PACKAGE_HOST_TI_CGT_PRU is not set
 # BR2_PACKAGE_HOST_UBOOT_TOOLS is not set
 # BR2_PACKAGE_HOST_UTIL_LINUX is not set
+# BR2_PACKAGE_HOST_UTP_COM is not set
 # BR2_PACKAGE_HOST_VBOOT_UTILS is not set
 # BR2_PACKAGE_HOST_XORRISO is not set
 # BR2_PACKAGE_HOST_ZIP is not set
+# BR2_PACKAGE_HOST_ZSTD is not set
 
 #
 # Legacy config options
 #
 
+#
+# Legacy options removed in 2019.02
+#
+# BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK is not set
+# BR2_PACKAGE_QT is not set
+# BR2_PACKAGE_QTUIO is not set
+# BR2_PACKAGE_PINENTRY_QT4 is not set
+# BR2_PACKAGE_POPPLER_QT is not set
+# BR2_PACKAGE_OPENCV3_WITH_QT is not set
+# BR2_PACKAGE_OPENCV_WITH_QT is not set
+# BR2_PACKAGE_AMD_CATALYST_CCCLE is not set
+# BR2_PACKAGE_SDL_QTOPIA is not set
+# BR2_PACKAGE_PYTHON_PYQT is not set
+# BR2_PACKAGE_GNURADIO_QTGUI is not set
+# BR2_PACKAGE_LUACRYPTO is not set
+# BR2_PACKAGE_TN5250 is not set
+# BR2_PACKAGE_BOOST_SIGNALS is not set
+# BR2_PACKAGE_FFTW_PRECISION_SINGLE is not set
+# BR2_PACKAGE_FFTW_PRECISION_DOUBLE is not set
+# BR2_PACKAGE_LUA_5_2 is not set
+# BR2_TARGET_GENERIC_PASSWD_MD5 is not set
+
+#
+# Legacy options removed in 2018.11
+#
+# BR2_TARGET_XLOADER is not set
+# BR2_PACKAGE_TIDSP_BINARIES is not set
+# BR2_PACKAGE_DSP_TOOLS is not set
+# BR2_PACKAGE_GST_DSP is not set
+# BR2_PACKAGE_BOOTUTILS is not set
+# BR2_PACKAGE_EXPEDITE is not set
+# BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT is not set
+# BR2_KERNEL_HEADERS_4_10 is not set
+# BR2_KERNEL_HEADERS_4_11 is not set
+# BR2_KERNEL_HEADERS_4_12 is not set
+# BR2_KERNEL_HEADERS_4_13 is not set
+# BR2_KERNEL_HEADERS_4_15 is not set
+# BR2_KERNEL_HEADERS_4_17 is not set
+# BR2_PACKAGE_LIBNFTNL_XML is not set
+# BR2_KERNEL_HEADERS_3_2 is not set
+# BR2_KERNEL_HEADERS_4_1 is not set
+# BR2_KERNEL_HEADERS_4_16 is not set
+# BR2_KERNEL_HEADERS_4_18 is not set
+
+#
+# Legacy options removed in 2018.08
+#
+# BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT is not set
+# BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19 is not set
+# BR2_PACKAGE_XPROTO_APPLEWMPROTO is not set
+# BR2_PACKAGE_XPROTO_BIGREQSPROTO is not set
+# BR2_PACKAGE_XPROTO_COMPOSITEPROTO is not set
+# BR2_PACKAGE_XPROTO_DAMAGEPROTO is not set
+# BR2_PACKAGE_XPROTO_DMXPROTO is not set
+# BR2_PACKAGE_XPROTO_DRI2PROTO is not set
+# BR2_PACKAGE_XPROTO_DRI3PROTO is not set
+# BR2_PACKAGE_XPROTO_FIXESPROTO is not set
+# BR2_PACKAGE_XPROTO_FONTCACHEPROTO is not set
+# BR2_PACKAGE_XPROTO_FONTSPROTO is not set
+# BR2_PACKAGE_XPROTO_GLPROTO is not set
+# BR2_PACKAGE_XPROTO_INPUTPROTO is not set
+# BR2_PACKAGE_XPROTO_KBPROTO is not set
+# BR2_PACKAGE_XPROTO_PRESENTPROTO is not set
+# BR2_PACKAGE_XPROTO_RANDRPROTO is not set
+# BR2_PACKAGE_XPROTO_RECORDPROTO is not set
+# BR2_PACKAGE_XPROTO_RENDERPROTO is not set
+# BR2_PACKAGE_XPROTO_RESOURCEPROTO is not set
+# BR2_PACKAGE_XPROTO_SCRNSAVERPROTO is not set
+# BR2_PACKAGE_XPROTO_VIDEOPROTO is not set
+# BR2_PACKAGE_XPROTO_WINDOWSWMPROTO is not set
+# BR2_PACKAGE_XPROTO_XCMISCPROTO is not set
+# BR2_PACKAGE_XPROTO_XEXTPROTO is not set
+# BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO is not set
+# BR2_PACKAGE_XPROTO_XF86DGAPROTO is not set
+# BR2_PACKAGE_XPROTO_XF86DRIPROTO is not set
+# BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO is not set
+# BR2_PACKAGE_XPROTO_XINERAMAPROTO is not set
+# BR2_PACKAGE_XPROTO_XPROTO is not set
+# BR2_PACKAGE_XPROTO_XPROXYMANAGEMENTPROTOCOL is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLES2 is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11 is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_DISPMANX is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER is not set
+# BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME is not set
+# BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPG123 is not set
+# BR2_GDB_VERSION_7_11 is not set
+# BR2_GDB_VERSION_7_10 is not set
+
 #
 # Legacy options removed in 2018.05
 #
diff --git a/recipes-core/non-root-initramfs/non-root-initramfs_2018.05.1.bb b/recipes-core/non-root-initramfs/non-root-initramfs_2019.02.2.bb
similarity index 81%
rename from recipes-core/non-root-initramfs/non-root-initramfs_2018.05.1.bb
rename to recipes-core/non-root-initramfs/non-root-initramfs_2019.02.2.bb
index 5783834..5ae36e0 100644
--- a/recipes-core/non-root-initramfs/non-root-initramfs_2018.05.1.bb
+++ b/recipes-core/non-root-initramfs/non-root-initramfs_2019.02.2.bb
@@ -1,7 +1,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2018
+# Copyright (c) Siemens AG, 2018-2019
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@ SRC_URI = " \
     file://debian/ \
     file://${DISTRO_ARCH}-config \
     file://overlay/"
-SRC_URI[sha256sum] = "8dc4b9bd22a165a4df0a1737f01de3dd0a6c15d9f8b16989426af062471a0abb"
+SRC_URI[sha256sum] = "0250b4e11d4aeba7cb5ac956b56e3069d3136c1e7fd741a658b0ea96c6b35181"
 
 S = "${WORKDIR}/buildroot-${PV}"
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/33efd0705737377ff58361be883f2a60cfbca918.1562833696.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
