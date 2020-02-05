Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWEG5LYQKGQEU4ACEOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 157731527D9
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Feb 2020 09:56:58 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id w11sf133625ljj.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Feb 2020 00:56:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580893017; cv=pass;
        d=google.com; s=arc-20160816;
        b=SdRQAyNWLYH0jAyv4hUJEBeeQS/R87WKnEVG7m4Y1duSPiNoyDukHd+QBGoZZUZu6h
         ijcj2fyZ4IUH0O79jJ8qTb+lnkWB0cuYo3t0AzXL45N7koBP6BnblUga/1nXzsZ3uobn
         xTN2YLwBECWth8z6AJbWpY1h6RarCkPcSldeLMMdJ9pp4Zvl3WyvjcxlepiayM/pGPKm
         QmJdZt/ooDDL8PEJHfLOt0ArcJ1ToRQ284tET71+pfR737Ix6Dw9MfY+0wAUq1oG1H6p
         bjKvO8995s2IpdqPWJWHKlfP0lZdktPwXZaeY53DwfJH2EzYokkZ8krY3S5yEgrWE3tE
         fFBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=nHjd64a9qmFnppDaZa5G2KPTSQucJ5jFNOibNRXOH9c=;
        b=nmstlLvazrben0LAXFGzh+f3ATWwG8yhpfF9at/b+JQgDll43thPyHuHLvoaN+wl6v
         OsPy1etedqCAltB7WHL6cHtqxBuYrfaVGcFIwykQwvenRf/Y1hrQ3NAHPuzWH5NJQYCp
         WH+JMk7GFrNB+w7mIou2+gQn7ndLmMYV/hNR4xiXKEpyjjLBlqBGorom9XKdQbDOMoDP
         CkfIh/C15dnO4J/pqXjVlgI592wkHcVSebA/Ho+75+OCxNZCsHT5NW7hZ5vZ1XG9caIU
         Cc62Q5jOGmGaRx4x6pwIn2ZVbLhtbVFmUY2KXS8n0Mb3JdZr6n2r0xJRa6kDNlQ/m7Oe
         qlzw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nHjd64a9qmFnppDaZa5G2KPTSQucJ5jFNOibNRXOH9c=;
        b=i+QwogcGBfTBEJxseQqPwqOFDoMm5RmJIFHcowJJkmvFxXW5Hb3AeyW1YvN7ObIn4o
         oKR7tZkue3XrFy7Va23/yhkRJyGZ5kq4vjdNf46R3J+GEKBWDvZ67mSOi9WwSekq5a3n
         aY8g5Y5KSC1sdauiTmRlbUyj815nut5YhuPfu0eOCPYYOmFFZ1EBwgQXxx+b6SpwrDu9
         KWjKuF2o85K1rfWaxOIbqvFcYosLzXEZ0aJTUxx1NO448wuoLZiUlNDxkeT9tu0s63BN
         /SfkkXHLBOTFcb3DNYnfI1gOHGgnrc7MkdqA1Z5/cCCf4AgxiASxNwMSti8hkioRQBw8
         6nYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nHjd64a9qmFnppDaZa5G2KPTSQucJ5jFNOibNRXOH9c=;
        b=nvbu8wMv1zfqLkeTPVWXsOO0kdvDjZifpUe9p75PnXdnP4W7B8LjlrTN+8gpeSIlJ4
         Uzt3md8SLuj7RTS4kEJr7uZqYjxq9SOAQJHxZCvvFeTHZChhhAzWiMqzSN9/+L08wp2f
         yTvY7Jntd0MR0bskCg2ijKKTwJQ5GWQWz9sfTykFrZRFcVXxqqSwrI531LA2P7Hb2dIg
         hWlY9OHS9Fsd0UC+OGmgdXOX6w9icrz1hojVrSc6FX+jsHazvpo13SjjMOnk9fkGm7fD
         hVSVbB+C3jTzZR0ZA+CaGDn8hdn/vRekBbpvmVCupnr7A0nUt1IhQbzCQTl2K6h+JyKJ
         NfVA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXvEdiiXqx04qRaPzmirFtloSSWtpvli7pxdxoAp9/P8vJ4P/Ba
	56ZM2trupEM8ZOT3x5k5N7o=
X-Google-Smtp-Source: APXvYqxP6sQEZWFy5U7v2zNTGEt4mIVuTE+8mphEm+m7rLhdXguxYZW2s6vMLD2xv+gVSIO3TXRm7g==
X-Received: by 2002:a19:48c5:: with SMTP id v188mr17548443lfa.100.1580893016896;
        Wed, 05 Feb 2020 00:56:56 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9c85:: with SMTP id x5ls224381lji.0.gmail; Wed, 05 Feb
 2020 00:56:55 -0800 (PST)
X-Received: by 2002:a2e:3608:: with SMTP id d8mr19750061lja.152.1580893015437;
        Wed, 05 Feb 2020 00:56:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580893015; cv=none;
        d=google.com; s=arc-20160816;
        b=xmlL0N11vQ5Y6NaJOJo34aPUzS45e2pPl7ybui7oxm2qkxJgT3dOrvUeSRqLSt+bbi
         hT520VTGOl6HycfDaeo4PpQCAoAodGBTuLdpbdO+NfXHJryZjVk6JtQ9O+L7bM1Boc5E
         8799Akoz1PlPky0gnBh6DuLy4V22jSX6O0gB/i7xxitYFPj7mfsTi6ifZeSXO1vrEOI5
         qlEeXgYvT8yEvz2N5YI5thrs/MIHYaIxOr0avSiVUbkxlgQP0S2cJikqleyufAcwQTI0
         JrTBjCC+XY88PeQd5UpA78gz6j9LeAEBGzxEInGJGSv6gBLW9urz8ITekqfC4ERTStQI
         ccXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=Z1n996RXl1t6h6fstMTgVxvKYbe+Wc4u6gUaMCKQ1nw=;
        b=cFPCgmGn8yli3HfLCkKei3HF1RzSinHeqoG29+S3wUIoytsu6/dBErSjW2vOwK2NmJ
         ZcXljilgl0gc7rxQFQHF27mDJap4k2fE30tKfDmXGiDnQ1QLMZUE2zzM1ApkIkcCaMaH
         aKn3+apca3xZ17Rsrmy5pjox8+DOPzaJ8qL03RkzcCPZOS3vt/U0rHYhY3wz4X5HsDlz
         OZLTuTxIPxpFUlpD6hKp3hLT4sY9kP408S5GW1QSSELR2XrvNvy2bNw9BB7FJ866uA4f
         c5amhBf/aGclwO5+dEzBoJ4WI94YdYOyqxB/oAbppakAIk9vKh0XdQ52UxnV4vKQTP/S
         RFJw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id j30si1157828lfp.5.2020.02.05.00.56.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Feb 2020 00:56:55 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0158usGH019898
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 09:56:54 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.54.219])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 0158up0q006156
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 09:56:54 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 6/7] non-root-initramfs: Update to buildroot 2019.11.1
Date: Wed,  5 Feb 2020 09:56:50 +0100
Message-Id: <be9291fadff18788a40839dff549fb9d8f35c7c1.1580893011.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1580893010.git.jan.kiszka@siemens.com>
References: <cover.1580893010.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1580893010.git.jan.kiszka@siemens.com>
References: <cover.1580893010.git.jan.kiszka@siemens.com>
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
 recipes-core/non-root-initramfs/files/amd64-config | 395 +++++++++++++++-----
 recipes-core/non-root-initramfs/files/arm64-config | 399 ++++++++++++++------
 recipes-core/non-root-initramfs/files/armhf-config | 412 +++++++++++++++------
 ...019.02.2.bb => non-root-initramfs_2019.11.1.bb} |   4 +-
 4 files changed, 882 insertions(+), 328 deletions(-)
 rename recipes-core/non-root-initramfs/{non-root-initramfs_2019.02.2.bb => non-root-initramfs_2019.11.1.bb} (87%)

diff --git a/recipes-core/non-root-initramfs/files/amd64-config b/recipes-core/non-root-initramfs/files/amd64-config
index 4a96858..be8856a 100644
--- a/recipes-core/non-root-initramfs/files/amd64-config
+++ b/recipes-core/non-root-initramfs/files/amd64-config
@@ -1,16 +1,13 @@
 #
 # Automatically generated file; DO NOT EDIT.
-# Buildroot 2019.02.2 Configuration
+# Buildroot 2019.11.1 Configuration
 #
 BR2_HAVE_DOT_CONFIG=y
-BR2_HOST_GCC_AT_LEAST_4_5=y
-BR2_HOST_GCC_AT_LEAST_4_6=y
-BR2_HOST_GCC_AT_LEAST_4_7=y
-BR2_HOST_GCC_AT_LEAST_4_8=y
 BR2_HOST_GCC_AT_LEAST_4_9=y
 BR2_HOST_GCC_AT_LEAST_5=y
 BR2_HOST_GCC_AT_LEAST_6=y
 BR2_HOST_GCC_AT_LEAST_7=y
+BR2_HOST_GCC_AT_LEAST_8=y
 
 #
 # Target options
@@ -32,6 +29,7 @@ BR2_ARCH_HAS_MMU_MANDATORY=y
 # BR2_mipsel is not set
 # BR2_mips64 is not set
 # BR2_mips64el is not set
+# BR2_nds32 is not set
 # BR2_nios2 is not set
 # BR2_or1k is not set
 # BR2_powerpc is not set
@@ -60,6 +58,7 @@ BR2_X86_CPU_HAS_SSE42=y
 # BR2_x86_nocona is not set
 # BR2_x86_core2 is not set
 BR2_x86_corei7=y
+# BR2_x86_westmere is not set
 # BR2_x86_corei7_avx is not set
 # BR2_x86_core_avx2 is not set
 # BR2_x86_atom is not set
@@ -132,6 +131,7 @@ BR2_GLOBAL_PATCH_DIR=""
 #
 # Security Hardening Options
 #
+# BR2_PIC_PIE is not set
 
 #
 # Stack Smashing Protection needs a toolchain w/ SSP
@@ -167,12 +167,12 @@ BR2_TOOLCHAIN_BUILDROOT_LIBC="uclibc"
 # BR2_KERNEL_HEADERS_4_4 is not set
 # BR2_KERNEL_HEADERS_4_9 is not set
 # BR2_KERNEL_HEADERS_4_14 is not set
-BR2_KERNEL_HEADERS_4_19=y
-# BR2_KERNEL_HEADERS_4_20 is not set
+# BR2_KERNEL_HEADERS_4_19 is not set
+BR2_KERNEL_HEADERS_5_3=y
 # BR2_KERNEL_HEADERS_VERSION is not set
 # BR2_KERNEL_HEADERS_CUSTOM_TARBALL is not set
 # BR2_KERNEL_HEADERS_CUSTOM_GIT is not set
-BR2_DEFAULT_KERNEL_HEADERS="4.19.36"
+BR2_DEFAULT_KERNEL_HEADERS="5.3.18"
 BR2_PACKAGE_LINUX_HEADERS=y
 
 #
@@ -194,22 +194,20 @@ BR2_UCLIBC_TARGET_ARCH="x86_64"
 # Binutils Options
 #
 BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI=y
-# BR2_BINUTILS_VERSION_2_28_X is not set
-# BR2_BINUTILS_VERSION_2_29_X is not set
 # BR2_BINUTILS_VERSION_2_30_X is not set
-BR2_BINUTILS_VERSION_2_31_X=y
-BR2_BINUTILS_VERSION="2.31.1"
+# BR2_BINUTILS_VERSION_2_31_X is not set
+BR2_BINUTILS_VERSION_2_32_X=y
+BR2_BINUTILS_VERSION="2.32"
 BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
 
 #
 # GCC Options
 #
-# BR2_GCC_VERSION_4_9_X is not set
 # BR2_GCC_VERSION_5_X is not set
-# BR2_GCC_VERSION_6_X is not set
 # BR2_GCC_VERSION_7_X is not set
-BR2_GCC_VERSION_8_X=y
-BR2_GCC_VERSION="8.3.0"
+# BR2_GCC_VERSION_8_X is not set
+BR2_GCC_VERSION_9_X=y
+BR2_GCC_VERSION="9.2.0"
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
@@ -225,7 +223,6 @@ BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS=y
 # Host GDB Options
 #
 # BR2_PACKAGE_HOST_GDB is not set
-BR2_PACKAGE_GDB_NEEDS_CXX11=y
 
 #
 # Toolchain Generic Options
@@ -237,6 +234,7 @@ BR2_TOOLCHAIN_HAS_THREADS=y
 BR2_TOOLCHAIN_HAS_THREADS_NPTL=y
 BR2_TOOLCHAIN_HAS_UCONTEXT=y
 BR2_TOOLCHAIN_SUPPORTS_PIE=y
+BR2_TOOLCHAIN_EXTRA_LIBS=""
 BR2_USE_MMU=y
 BR2_TARGET_OPTIMIZATION=""
 BR2_TARGET_LDFLAGS=""
@@ -281,7 +279,12 @@ BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19=y
-BR2_TOOLCHAIN_HEADERS_AT_LEAST="4.19"
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST="5.3"
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_3=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_4=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_5=y
@@ -293,7 +296,8 @@ BR2_TOOLCHAIN_GCC_AT_LEAST_5=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_6=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_7=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_8=y
-BR2_TOOLCHAIN_GCC_AT_LEAST="8"
+BR2_TOOLCHAIN_GCC_AT_LEAST_9=y
+BR2_TOOLCHAIN_GCC_AT_LEAST="9"
 BR2_TOOLCHAIN_HAS_MNAN_OPTION=y
 BR2_TOOLCHAIN_HAS_SYNC_1=y
 BR2_TOOLCHAIN_HAS_SYNC_2=y
@@ -315,6 +319,7 @@ BR2_TARGET_GENERIC_PASSWD_SHA256=y
 BR2_TARGET_GENERIC_PASSWD_METHOD="sha-256"
 BR2_INIT_BUSYBOX=y
 # BR2_INIT_SYSV is not set
+# BR2_INIT_OPENRC is not set
 
 #
 # systemd needs a glibc toolchain w/ SSP, headers >= 3.10
@@ -363,6 +368,7 @@ BR2_ROOTFS_OVERLAY="$(TOPDIR)/../overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/../build-ivshmem-demo.sh"
 BR2_ROOTFS_POST_FAKEROOT_SCRIPT=""
 BR2_ROOTFS_POST_IMAGE_SCRIPT=""
+BR2_ROOTFS_POST_SCRIPT_ARGS=""
 
 #
 # Kernel
@@ -376,6 +382,7 @@ BR2_PACKAGE_BUSYBOX=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES=""
 # BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
+# BR2_PACKAGE_BUSYBOX_SELINUX is not set
 # BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES is not set
 # BR2_PACKAGE_BUSYBOX_WATCHDOG is not set
 BR2_PACKAGE_SKELETON=y
@@ -428,11 +435,12 @@ BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS=y
 #
 # gstreamer 1.x needs a toolchain w/ wchar, threads
 #
+# BR2_PACKAGE_JACK1 is not set
 # BR2_PACKAGE_JACK2 is not set
 BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 
 #
-# kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.8, host gcc >= 4.6
+# kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.8
 #
 
 #
@@ -444,6 +452,7 @@ BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 #
 # mimic needs a toolchain w/ wchar
 #
+# BR2_PACKAGE_MINIMODEM is not set
 
 #
 # miraclecast needs systemd and a glibc toolchain w/ threads and wchar
@@ -454,7 +463,7 @@ BR2_PACKAGE_MJPEGTOOLS_SIMD_SUPPORT=y
 # BR2_PACKAGE_MOTION is not set
 
 #
-# mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.9
+# mpd needs a toolchain w/ C++, threads, wchar, gcc >= 6
 #
 # BR2_PACKAGE_MPD_MPC is not set
 # BR2_PACKAGE_MPG123 is not set
@@ -463,7 +472,7 @@ BR2_PACKAGE_MJPEGTOOLS_SIMD_SUPPORT=y
 # BR2_PACKAGE_MUSEPACK is not set
 
 #
-# ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 4.9
+# ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 6
 #
 # BR2_PACKAGE_OPUS_TOOLS is not set
 BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
@@ -503,6 +512,10 @@ BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
 #
 # BR2_PACKAGE_BROTLI is not set
 # BR2_PACKAGE_BZIP2 is not set
+
+#
+# lrzip needs a toolchain w/ wchar, threads, C++
+#
 # BR2_PACKAGE_LZ4 is not set
 # BR2_PACKAGE_LZIP is not set
 # BR2_PACKAGE_LZOP is not set
@@ -533,13 +546,14 @@ BR2_PACKAGE_CACHE_CALIBRATOR=y
 #
 # clinfo needs an OpenCL provider
 #
-# BR2_PACKAGE_DHRYSTONE is not set
-# BR2_PACKAGE_DIEHARDER is not set
-# BR2_PACKAGE_DMALLOC is not set
 
 #
-# dropwatch needs a toolchain w/ threads, wchar
+# dacapo needs OpenJDK
 #
+# BR2_PACKAGE_DHRYSTONE is not set
+# BR2_PACKAGE_DIEHARDER is not set
+# BR2_PACKAGE_DMALLOC is not set
+# BR2_PACKAGE_DROPWATCH is not set
 
 #
 # dstat needs a toolchain w/ wchar, threads, dynamic library
@@ -593,10 +607,7 @@ BR2_PACKAGE_LTRACE_ARCH_SUPPORTS=y
 # BR2_PACKAGE_MCELOG is not set
 # BR2_PACKAGE_MEMSTAT is not set
 # BR2_PACKAGE_NETPERF is not set
-
-#
-# netsniff-ng needs a glibc or musl toolchain w/ threads, headers >= 3.0
-#
+# BR2_PACKAGE_NETSNIFF_NG is not set
 
 #
 # nmon needs a glibc toolchain
@@ -608,6 +619,10 @@ BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_PAX_UTILS is not set
 # BR2_PACKAGE_PCM_TOOLS is not set
+
+#
+# piglit needs glibc or musl
+#
 # BR2_PACKAGE_PV is not set
 
 #
@@ -667,10 +682,8 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_CXXTEST is not set
 # BR2_PACKAGE_FLEX is not set
-
-#
-# gettext needs a toolchain w/ wchar
-#
+# BR2_PACKAGE_GETTEXT is not set
+BR2_PACKAGE_PROVIDES_HOST_GETTEXT="host-gettext-tiny"
 # BR2_PACKAGE_GIT is not set
 # BR2_PACKAGE_GIT_CRYPT is not set
 # BR2_PACKAGE_GPERF is not set
@@ -718,7 +731,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 
 #
-# ecryptfs-utils needs a toolchain w/ threads, wchar, dynami library
+# ecryptfs-utils needs a toolchain w/ threads, wchar, dynamic library
 #
 
 #
@@ -807,6 +820,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # Games
 #
+# BR2_PACKAGE_ASCII_INVADERS is not set
 # BR2_PACKAGE_CHOCOLATE_DOOM is not set
 # BR2_PACKAGE_FLARE_ENGINE is not set
 # BR2_PACKAGE_GNUCHESS is not set
@@ -832,11 +846,15 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # Graphic applications
 #
+
+#
+# cog needs wpewebkit and a toolchain w/ threads
+#
 # BR2_PACKAGE_FSWEBCAM is not set
 # BR2_PACKAGE_GHOSTSCRIPT is not set
 
 #
-# glmark2 needs an OpenGL or an openGL ES and EGL backend provided by mesa3d
+# glmark2 needs an OpenGL or an openGL ES and EGL backend
 #
 # BR2_PACKAGE_GNUPLOT is not set
 
@@ -844,6 +862,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # jhead needs a toolchain w/ wchar
 #
 # BR2_PACKAGE_LIBVA_UTILS is not set
+BR2_PACKAGE_NETSURF_ARCH_SUPPORTS=y
 # BR2_PACKAGE_NETSURF is not set
 # BR2_PACKAGE_PNGQUANT is not set
 
@@ -851,6 +870,10 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # rrdtool needs a toolchain w/ wchar, threads
 #
 
+#
+# stellarium needs Qt5 and an OpenGL provider
+#
+
 #
 # tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 4.8, dynamic library, wchar
 #
@@ -864,9 +887,9 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # efl needs a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar
 #
+# BR2_PACKAGE_FB_TEST_APP is not set
 # BR2_PACKAGE_FBDUMP is not set
 # BR2_PACKAGE_FBGRAB is not set
-# BR2_PACKAGE_FB_TEST_APP is not set
 
 #
 # fbterm needs a toolchain w/ C++, wchar, locale
@@ -884,6 +907,10 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # BR2_PACKAGE_MESA3D is not set
 # BR2_PACKAGE_OCRAD is not set
 
+#
+# ogre needs a toolchain w/ C++, dynamic library, gcc >= 4.8, threads, wchar
+#
+
 #
 # psplash needs a toolchain w/ wchar
 #
@@ -912,7 +939,7 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 #
 
 #
-# midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8
+# midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6
 #
 
 #
@@ -934,6 +961,7 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 # BR2_PACKAGE_ARMBIAN_FIRMWARE is not set
 # BR2_PACKAGE_B43_FIRMWARE is not set
 # BR2_PACKAGE_LINUX_FIRMWARE is not set
+# BR2_PACKAGE_MURATA_CYW_FW is not set
 # BR2_PACKAGE_UX500_FIRMWARE is not set
 # BR2_PACKAGE_WILC1000_FIRMWARE is not set
 # BR2_PACKAGE_WILINK_BT_FIRMWARE is not set
@@ -956,6 +984,10 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 # bcache-tools needs udev /dev management
 #
 
+#
+# brickd needs udev /dev management, a toolchain w/ threads, wchar
+#
+
 #
 # brltty needs a toolchain w/ dynamic lib, threads, wchar
 #
@@ -1023,12 +1055,14 @@ BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS=y
 # BR2_PACKAGE_IUCODE_TOOL is not set
 # BR2_PACKAGE_KBD is not set
 # BR2_PACKAGE_LCDPROC is not set
+# BR2_PACKAGE_LIBUBOOTENV is not set
 # BR2_PACKAGE_LIBUIO is not set
-# BR2_PACKAGE_LINUXCONSOLETOOLS is not set
 
 #
 # linux-backports needs a Linux kernel to be built
 #
+# BR2_PACKAGE_LINUX_SERIAL_TEST is not set
+# BR2_PACKAGE_LINUXCONSOLETOOLS is not set
 # BR2_PACKAGE_LIRC_TOOLS is not set
 # BR2_PACKAGE_LM_SENSORS is not set
 
@@ -1040,6 +1074,7 @@ BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LUKSMETA is not set
 # BR2_PACKAGE_LVM2 is not set
 # BR2_PACKAGE_MDADM is not set
+# BR2_PACKAGE_MDEVD is not set
 # BR2_PACKAGE_MEMTEST86 is not set
 # BR2_PACKAGE_MEMTESTER is not set
 # BR2_PACKAGE_MEMTOOL is not set
@@ -1217,7 +1252,17 @@ BR2_PACKAGE_MONO_ARCH_SUPPORTS=y
 BR2_PACKAGE_NODEJS_ARCH_SUPPORTS=y
 
 #
-# nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 4.8, wchar
+# nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 4.9, wchar
+#
+BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS=y
+BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS=y
+
+#
+# openjdk needs X.Org
+#
+
+#
+# openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++
 #
 # BR2_PACKAGE_PERL is not set
 # BR2_PACKAGE_PHP is not set
@@ -1246,6 +1291,7 @@ BR2_PACKAGE_NODEJS_ARCH_SUPPORTS=y
 # BR2_PACKAGE_AUBIO is not set
 # BR2_PACKAGE_AUDIOFILE is not set
 # BR2_PACKAGE_BCG729 is not set
+# BR2_PACKAGE_CAPS is not set
 # BR2_PACKAGE_CELT051 is not set
 BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS=y
 # BR2_PACKAGE_FDK_AAC is not set
@@ -1308,6 +1354,7 @@ BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS=y
 #
 # libarchive needs a toolchain w/ wchar
 #
+# BR2_PACKAGE_LIBMSPACK is not set
 # BR2_PACKAGE_LIBSQUISH is not set
 # BR2_PACKAGE_LIBZIP is not set
 # BR2_PACKAGE_LZO is not set
@@ -1320,6 +1367,7 @@ BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS=y
 BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS=y
 # BR2_PACKAGE_ZLIB is not set
 BR2_PACKAGE_PROVIDES_HOST_ZLIB="host-libzlib"
+# BR2_PACKAGE_ZZIPLIB is not set
 
 #
 # Crypto
@@ -1351,6 +1399,8 @@ BR2_PACKAGE_LIBGPG_ERROR_SYSCFG="x86_64-unknown-linux-gnu"
 # BR2_PACKAGE_LIBMCRYPT is not set
 # BR2_PACKAGE_LIBMHASH is not set
 # BR2_PACKAGE_LIBNSS is not set
+# BR2_PACKAGE_LIBOLM is not set
+# BR2_PACKAGE_LIBP11 is not set
 # BR2_PACKAGE_LIBSCRYPT is not set
 
 #
@@ -1419,7 +1469,10 @@ BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 #
 # Graphics
 #
-# BR2_PACKAGE_ASSIMP is not set
+
+#
+# assimp needs a toolchain w/ C++, wchar
+#
 
 #
 # at-spi2-atk needs a toolchain w/ wchar, threads
@@ -1455,10 +1508,13 @@ BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 # chipmunk needs an OpenGL backend
 #
 
+#
+# exempi needs a toolchain w/ C++, dynamic library, threads, wchar
+#
+
 #
 # exiv2 needs a uClibc or glibc toolchain w/ C++, wchar, dynamic library, threads
 #
-# BR2_PACKAGE_EXEMPI is not set
 # BR2_PACKAGE_FONTCONFIG is not set
 # BR2_PACKAGE_FREETYPE is not set
 # BR2_PACKAGE_GD is not set
@@ -1481,6 +1537,14 @@ BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 # BR2_PACKAGE_IMLIB2 is not set
 # BR2_PACKAGE_INTEL_GMMLIB is not set
 
+#
+# intel-mediadriver needs X.org
+#
+
+#
+# intel-mediasdk needs X.org
+#
+
 #
 # irrlicht needs X11 and an OpenGL provider
 #
@@ -1504,7 +1568,7 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # BR2_PACKAGE_LIBEXIF is not set
 
 #
-# libfm needs X.org and a toolchain w/ wchar, threads, C++
+# libfm needs X.org and a toolchain w/ wchar, threads, C++, gcc >= 4.8
 #
 
 #
@@ -1518,7 +1582,10 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 #
 # libfreeimage needs a toolchain w/ C++, dynamic library, wchar
 #
-# BR2_PACKAGE_LIBGEOTIFF is not set
+
+#
+# libgeotiff needs a toolchain w/ C++, gcc >= 4.7, threads, wchar
+#
 
 #
 # libglew depends on X.org and needs an OpenGL backend
@@ -1534,7 +1601,7 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # BR2_PACKAGE_LIBGTA is not set
 
 #
-# libgtk3 needs a toolchain w/ wchar, threads, C++
+# libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.8
 #
 
 #
@@ -1550,7 +1617,7 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # BR2_PACKAGE_LIBRAW is not set
 
 #
-# librsvg needs a toolchain w/ wchar, threads, C++
+# librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.8
 #
 
 #
@@ -1566,6 +1633,10 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # libvips needs a toolchain w/ wchar, threads, C++
 #
 
+#
+# libwpe needs a toolchain w/ C++, dynamic library and an OpenEGL-capable backend
+#
+
 #
 # menu-cache needs a toolchain w/ wchar, threads
 #
@@ -1580,24 +1651,39 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # BR2_PACKAGE_OPENJPEG is not set
 
 #
-# pango needs a toolchain w/ wchar, threads, C++
+# pango needs a toolchain w/ wchar, threads, C++, gcc >= 4.8
 #
 
 #
 # pangomm needs a toolchain w/ C++, wchar, threads, gcc >= 4.9
 #
 # BR2_PACKAGE_PIXMAN is not set
-# BR2_PACKAGE_POPPLER is not set
+
+#
+# poppler needs a toolchain w/ wchar, C++, threads, dynamic library, gcc >= 5
+#
 # BR2_PACKAGE_TIFF is not set
 # BR2_PACKAGE_WAYLAND is not set
 BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS=y
-BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT=y
 
 #
-# webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8
+# webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6
 #
 # BR2_PACKAGE_WEBP is not set
 # BR2_PACKAGE_WOFF2 is not set
+
+#
+# wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and an OpenEGL-capable Wayland backend
+#
+BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS=y
+
+#
+# wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 6
+#
+
+#
+# wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend
+#
 # BR2_PACKAGE_ZBAR is not set
 # BR2_PACKAGE_ZXING_CPP is not set
 
@@ -1615,6 +1701,7 @@ BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=y
 #
 # hidapi needs udev /dev management and a toolchain w/ NPTL threads
 #
+# BR2_PACKAGE_JITTERENTROPY_LIBRARY is not set
 # BR2_PACKAGE_LCDAPI is not set
 # BR2_PACKAGE_LET_ME_CREATE is not set
 # BR2_PACKAGE_LIBAIO is not set
@@ -1705,6 +1792,7 @@ BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=y
 # BR2_PACKAGE_JQUERY is not set
 # BR2_PACKAGE_JSMIN is not set
 # BR2_PACKAGE_JSON_JAVASCRIPT is not set
+# BR2_PACKAGE_OPENLAYERS is not set
 
 #
 # JSON/XML
@@ -1757,7 +1845,6 @@ BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=y
 #
 # Logging
 #
-# BR2_PACKAGE_EVENTLOG is not set
 # BR2_PACKAGE_GLOG is not set
 # BR2_PACKAGE_LIBLOG4C_LOCALTIME is not set
 # BR2_PACKAGE_LIBLOGGING is not set
@@ -1768,17 +1855,26 @@ BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LOG4CPP is not set
 # BR2_PACKAGE_LOG4CXX is not set
 # BR2_PACKAGE_OPENTRACING_CPP is not set
+
+#
+# spdlog needs a toolchain w/ C++, threads, wchar
+#
 # BR2_PACKAGE_ZLOG is not set
 
 #
 # Multimedia
 #
 # BR2_PACKAGE_BITSTREAM is not set
+# BR2_PACKAGE_DAV1D is not set
 # BR2_PACKAGE_KVAZAAR is not set
 # BR2_PACKAGE_LIBAACS is not set
 # BR2_PACKAGE_LIBASS is not set
 # BR2_PACKAGE_LIBBDPLUS is not set
 # BR2_PACKAGE_LIBBLURAY is not set
+
+#
+# libcamera needs udev and a toolchain w/ C++, threads, gcc >= 5
+#
 # BR2_PACKAGE_LIBDCADEC is not set
 # BR2_PACKAGE_LIBDVBCSA is not set
 # BR2_PACKAGE_LIBDVBPSI is not set
@@ -1822,17 +1918,7 @@ BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS=y
 # BR2_PACKAGE_AGENTPP is not set
 
 #
-# alljoyn needs a toolchain w/ C++, threads, wchar and dynamic library
-#
-
-#
-# alljoyn-base needs a toolchain w/ C++, threads, wchar, dynamic library
-#
-# BR2_PACKAGE_ALLJOYN_TCL is not set
-# BR2_PACKAGE_ALLJOYN_TCL_BASE is not set
-
-#
-# azmq needs a toolchain w/ C++11, wchar and NTPL
+# azmq needs a toolchain w/ C++11, wchar and NPTL
 #
 # BR2_PACKAGE_AZURE_IOT_SDK_C is not set
 
@@ -1848,6 +1934,7 @@ BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS=y
 # BR2_PACKAGE_CZMQ is not set
 # BR2_PACKAGE_DAQ is not set
 # BR2_PACKAGE_DAVICI is not set
+# BR2_PACKAGE_ENET is not set
 # BR2_PACKAGE_FILEMQ is not set
 # BR2_PACKAGE_FLICKCURL is not set
 # BR2_PACKAGE_FREERADIUS_CLIENT is not set
@@ -1890,7 +1977,9 @@ BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS=y
 #
 # libgsasl needs a toolchain w/ wchar
 #
+# BR2_PACKAGE_LIBHTP is not set
 # BR2_PACKAGE_LIBHTTPPARSER is not set
+# BR2_PACKAGE_LIBHTTPSERVER is not set
 # BR2_PACKAGE_LIBIDN is not set
 # BR2_PACKAGE_LIBIDN2 is not set
 # BR2_PACKAGE_LIBISCSI is not set
@@ -1906,6 +1995,7 @@ BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBNATPMP is not set
 # BR2_PACKAGE_LIBNDP is not set
 # BR2_PACKAGE_LIBNET is not set
+# BR2_PACKAGE_LIBNETCONF2 is not set
 # BR2_PACKAGE_LIBNETFILTER_ACCT is not set
 # BR2_PACKAGE_LIBNETFILTER_CONNTRACK is not set
 # BR2_PACKAGE_LIBNETFILTER_CTHELPER is not set
@@ -1939,7 +2029,7 @@ BR2_PACKAGE_LIBTIRPC=y
 # BR2_PACKAGE_LIBTORRENT is not set
 
 #
-# libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.8
+# libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.9
 #
 # BR2_PACKAGE_LIBUPNP is not set
 # BR2_PACKAGE_LIBUPNP18 is not set
@@ -1948,6 +2038,7 @@ BR2_PACKAGE_LIBTIRPC=y
 # BR2_PACKAGE_LIBVNCSERVER is not set
 # BR2_PACKAGE_LIBWEBSOCK is not set
 # BR2_PACKAGE_LIBWEBSOCKETS is not set
+# BR2_PACKAGE_LIBYANG is not set
 # BR2_PACKAGE_LKSCTP_TOOLS is not set
 # BR2_PACKAGE_MONGOOSE is not set
 # BR2_PACKAGE_NANOMSG is not set
@@ -1977,17 +2068,20 @@ BR2_PACKAGE_LIBTIRPC=y
 #
 
 #
-# openzwave needs udev and a toolchain w/ C++, threads, wchar
+# openzwave needs a toolchain w/ C++, dynamic library, NPTL, wchar
 #
 # BR2_PACKAGE_ORTP is not set
 # BR2_PACKAGE_PAHO_MQTT_C is not set
+# BR2_PACKAGE_PAHO_MQTT_CPP is not set
 # BR2_PACKAGE_QDECODER is not set
 # BR2_PACKAGE_QPID_PROTON is not set
 # BR2_PACKAGE_RABBITMQ_C is not set
+# BR2_PACKAGE_RESTCLIENT_CPP is not set
 # BR2_PACKAGE_RTMPDUMP is not set
 # BR2_PACKAGE_SLIRP is not set
 # BR2_PACKAGE_SNMPPP is not set
 # BR2_PACKAGE_SOFIA_SIP is not set
+# BR2_PACKAGE_SYSREPO is not set
 
 #
 # thrift needs a toolchain w/ C++, wchar, threads
@@ -2013,10 +2107,11 @@ BR2_PACKAGE_LIBTIRPC=y
 #
 # boost needs a toolchain w/ C++, threads, wchar
 #
+# BR2_PACKAGE_C_CAPNPROTO is not set
 # BR2_PACKAGE_CAPNPROTO is not set
 
 #
-# clang needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library
+# clang needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library
 #
 # BR2_PACKAGE_CLAPACK is not set
 BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS=y
@@ -2047,6 +2142,7 @@ BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS=y
 # gconf needs a toolchain w/ threads, wchar, dynamic library
 #
 # BR2_PACKAGE_GFLAGS is not set
+# BR2_PACKAGE_GLI is not set
 
 #
 # glibmm needs a toolchain w/ C++, wchar, threads, gcc >= 4.9
@@ -2067,6 +2163,7 @@ BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBARGTABLE2 is not set
 BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBATOMIC_OPS is not set
+# BR2_PACKAGE_LIBAVL is not set
 # BR2_PACKAGE_LIBB64 is not set
 BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS=y
 
@@ -2148,7 +2245,7 @@ BR2_PACKAGE_LLVM_ARCH_SUPPORTS=y
 BR2_PACKAGE_LLVM_TARGET_ARCH="X86"
 
 #
-# llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library
+# llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library
 #
 
 #
@@ -2160,6 +2257,7 @@ BR2_PACKAGE_LLVM_TARGET_ARCH="X86"
 # BR2_PACKAGE_MPIR is not set
 # BR2_PACKAGE_MSGPACK is not set
 # BR2_PACKAGE_MTDEV2TUIO is not set
+# BR2_PACKAGE_MUSL_FTS is not set
 BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET="NEHALEM"
 BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS=y
 # BR2_PACKAGE_OPENBLAS is not set
@@ -2182,19 +2280,14 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 # BR2_PACKAGE_SKALIBS is not set
 # BR2_PACKAGE_SPHINXBASE is not set
 # BR2_PACKAGE_TINYCBOR is not set
+# BR2_PACKAGE_UVW is not set
 # BR2_PACKAGE_XAPIAN is not set
 
 #
 # Security
 #
-
-#
-# libselinux needs a glibc toolchain w/ threads, dynamic library
-#
-
-#
-# libsemanage needs a glibc toolchain w/ threads, dynamic library
-#
+# BR2_PACKAGE_LIBSELINUX is not set
+# BR2_PACKAGE_LIBSEMANAGE is not set
 # BR2_PACKAGE_LIBSEPOL is not set
 # BR2_PACKAGE_SAFECLIB is not set
 
@@ -2215,7 +2308,11 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 #
 
 #
-# icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.8, host gcc >= 4.8
+# fstrcmp needs a toolchain w/ wchar
+#
+
+#
+# icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.8
 #
 # BR2_PACKAGE_LIBCLI is not set
 
@@ -2236,13 +2333,14 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 #
 # newt needs a toolchain w/ wchar, dynamic library
 #
+# BR2_PACKAGE_ONIGURUMA is not set
 # BR2_PACKAGE_PCRE is not set
 # BR2_PACKAGE_PCRE2 is not set
 # BR2_PACKAGE_POPT is not set
 # BR2_PACKAGE_READLINE is not set
 # BR2_PACKAGE_SLANG is not set
 # BR2_PACKAGE_TCLAP is not set
-# BR2_PACKAGE_USTR is not set
+# BR2_PACKAGE_UTF8PROC is not set
 
 #
 # Mail
@@ -2263,11 +2361,17 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_AESPIPE is not set
 # BR2_PACKAGE_BC is not set
+BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS=y
+
+#
+# bitcoin needs a toolchain w/ C++, wchar
+#
 
 #
 # clamav needs a toolchain w/ C++, threads, wchar
 #
 # BR2_PACKAGE_COLLECTD is not set
+# BR2_PACKAGE_COLLECTL is not set
 
 #
 # domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 4.8, NPTL, wchar, dynamic library
@@ -2294,7 +2398,10 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LINUX_SYSCALL_SUPPORT is not set
 # BR2_PACKAGE_MCRYPT is not set
 # BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO is not set
-# BR2_PACKAGE_PROJ is not set
+
+#
+# proj needs a toolchain w/ C++, gcc >= 4.7, threads, wchar
+#
 BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 
 #
@@ -2305,6 +2412,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 #
 # shared-mime-info needs a toolchain w/ wchar, threads
 #
+# BR2_PACKAGE_SUNWAIT is not set
 
 #
 # taskd needs a toolchain w/ C++, wchar, dynamic library
@@ -2384,6 +2492,7 @@ BR2_PACKAGE_DROPBEAR_SMALL=y
 # BR2_PACKAGE_DROPBEAR_WTMP is not set
 # BR2_PACKAGE_DROPBEAR_LASTLOG is not set
 # BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO is not set
+BR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE=""
 # BR2_PACKAGE_EBTABLES is not set
 
 #
@@ -2425,6 +2534,7 @@ BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_IBRDTN_TOOLS is not set
 # BR2_PACKAGE_IBRDTND is not set
+# BR2_PACKAGE_IFMETRIC is not set
 # BR2_PACKAGE_IFTOP is not set
 BR2_PACKAGE_IFUPDOWN_SCRIPTS=y
 
@@ -2499,7 +2609,7 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_MONKEY is not set
 
 #
-# mosh needs a toolchain w/ C++, threads, dynamic library, wchar, host and target gcc >= 4.8
+# mosh needs a toolchain w/ C++, threads, dynamic library, wchar, gcc >= 4.8
 #
 # BR2_PACKAGE_MOSQUITTO is not set
 # BR2_PACKAGE_MROUTED is not set
@@ -2516,7 +2626,7 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_NETSTAT_NAT is not set
 
 #
-# NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library
+# NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library, wchar, threads
 #
 # BR2_PACKAGE_NFACCT is not set
 
@@ -2610,10 +2720,15 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 #
 # BR2_PACKAGE_SPICE_PROTOCOL is not set
 # BR2_PACKAGE_SQUID is not set
+# BR2_PACKAGE_SSHGUARD is not set
 # BR2_PACKAGE_SSHPASS is not set
 # BR2_PACKAGE_SSLH is not set
 # BR2_PACKAGE_STRONGSWAN is not set
 # BR2_PACKAGE_STUNNEL is not set
+
+#
+# suricata needs a toolchain w/ wchar, threads
+#
 # BR2_PACKAGE_TCPDUMP is not set
 # BR2_PACKAGE_TCPING is not set
 # BR2_PACKAGE_TCPREPLAY is not set
@@ -2625,7 +2740,12 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_TRANSMISSION is not set
 # BR2_PACKAGE_TUNCTL is not set
 # BR2_PACKAGE_TVHEADEND is not set
+# BR2_PACKAGE_UACME is not set
 # BR2_PACKAGE_UDPCAST is not set
+
+#
+# uftp needs a toolchain w/ threads, wchar
+#
 # BR2_PACKAGE_UHTTPD is not set
 # BR2_PACKAGE_ULOGD is not set
 # BR2_PACKAGE_USHARE is not set
@@ -2636,7 +2756,7 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_VDE2 is not set
 
 #
-# vdr needs a glibc or uClibc toolchain w/ C++, dynamic library, NPTL, wchar, headers >= 3.9
+# vdr needs a glibc toolchain w/ C++, dynamic library, NPTL, wchar, headers >= 3.9
 #
 
 #
@@ -2727,22 +2847,16 @@ BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS=y
 #
 # Security
 #
-
-#
-# checkpolicy needs a glibc toolchain w/ threads, dynamic library
-#
+# BR2_PACKAGE_CHECKPOLICY is not set
+# BR2_PACKAGE_IMA_EVM_UTILS is not set
+# BR2_PACKAGE_OPTEE_BENCHMARK is not set
+# BR2_PACKAGE_OPTEE_CLIENT is not set
 
 #
 # paxtest needs a glibc toolchain
 #
-
-#
-# policycoreutils needs a glibc toolchain w/ threads, dynamic library
-#
-
-#
-# refpolicy needs a glibc toolchain w/ threads, dynamic library
-#
+# BR2_PACKAGE_POLICYCOREUTILS is not set
+# BR2_PACKAGE_REFPOLICY is not set
 
 #
 # restorecond needs a toolchain w/ wchar, threads, dynamic library
@@ -2754,7 +2868,7 @@ BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS=y
 # BR2_PACKAGE_SEMODULE_UTILS is not set
 
 #
-# setools needs a glibc toolchain w/ threads, C++, wchar, dynamic library
+# setools needs a toolchain w/ threads, C++, wchar, dynamic library
 #
 
 #
@@ -2800,6 +2914,7 @@ BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_XMLSTARLET is not set
 # BR2_PACKAGE_XXHASH is not set
+# BR2_PACKAGE_YTREE is not set
 
 #
 # System tools
@@ -2813,7 +2928,7 @@ BR2_PACKAGE_AUDIT_ARCH_SUPPORTS=y
 # BR2_PACKAGE_CGROUPFS_MOUNT is not set
 
 #
-# circus needs Python and a toolchain w/ C++, threads
+# circus needs Python 3 and a toolchain w/ C++, threads
 #
 # BR2_PACKAGE_CPULOAD is not set
 # BR2_PACKAGE_DAEMON is not set
@@ -2822,7 +2937,7 @@ BR2_PACKAGE_AUDIT_ARCH_SUPPORTS=y
 # BR2_PACKAGE_DOCKER_CLI is not set
 
 #
-# docker-compose needs a toolchain w/ wchar, threads, dynamic library
+# docker-compose needs a toolchain w/ C++, wchar, threads, dynamic library
 #
 
 #
@@ -2853,6 +2968,10 @@ BR2_PACKAGE_INITSCRIPTS=y
 #
 # irqbalance needs a toolchain w/ wchar, threads
 #
+
+#
+# jailhouse needs a Linux kernel to be built
+#
 # BR2_PACKAGE_KEYUTILS is not set
 # BR2_PACKAGE_KMOD is not set
 
@@ -2863,15 +2982,18 @@ BR2_PACKAGE_INITSCRIPTS=y
 #
 # libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar
 #
-# BR2_PACKAGE_LXC is not set
 # BR2_PACKAGE_MENDER is not set
 # BR2_PACKAGE_MONIT is not set
 # BR2_PACKAGE_NCDU is not set
+
+#
+# netifrc needs openrc as init system
+#
 # BR2_PACKAGE_NUMACTL is not set
 # BR2_PACKAGE_NUT is not set
 
 #
-# openvmtools needs a glibc or musl toolchain w/ wchar, threads, RPC, locale
+# openvmtools needs a glibc or musl toolchain w/ wchar, threads, locale
 #
 
 #
@@ -2902,7 +3024,7 @@ BR2_PACKAGE_INITSCRIPTS=y
 # BR2_PACKAGE_SMACK is not set
 
 #
-# supervisor needs the python interpreter
+# supervisor needs a python interpreter
 #
 # BR2_PACKAGE_SWUPDATE is not set
 BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS=y
@@ -2913,6 +3035,7 @@ BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS=y
 # tpm2-abrmd needs a toolchain w/ dynamic library, wchar, threads
 #
 # BR2_PACKAGE_TPM2_TOOLS is not set
+# BR2_PACKAGE_TPM2_TOTP is not set
 
 #
 # unscd needs a glibc toolchain
@@ -2930,6 +3053,7 @@ BR2_PACKAGE_XVISOR_ARCH_SUPPORTS=y
 #
 # mc needs a toolchain w/ threads, wchar
 #
+# BR2_PACKAGE_MOST is not set
 
 #
 # nano needs a toolchain w/ wchar
@@ -2996,6 +3120,7 @@ BR2_TARGET_GRUB2_ARCH_SUPPORTS=y
 # BR2_PACKAGE_HOST_CMAKE is not set
 # BR2_PACKAGE_HOST_CRAMFS is not set
 # BR2_PACKAGE_HOST_CRYPTSETUP is not set
+# BR2_PACKAGE_HOST_DBUS_PYTHON is not set
 # BR2_PACKAGE_HOST_DFU_UTIL is not set
 # BR2_PACKAGE_HOST_DOS2UNIX is not set
 # BR2_PACKAGE_HOST_DOSFSTOOLS is not set
@@ -3004,21 +3129,27 @@ BR2_TARGET_GRUB2_ARCH_SUPPORTS=y
 # BR2_PACKAGE_HOST_E2TOOLS is not set
 # BR2_PACKAGE_HOST_F2FS_TOOLS is not set
 # BR2_PACKAGE_HOST_FAKETIME is not set
+# BR2_PACKAGE_HOST_FATCAT is not set
 # BR2_PACKAGE_HOST_FWUP is not set
 # BR2_PACKAGE_HOST_GENEXT2FS is not set
 # BR2_PACKAGE_HOST_GENIMAGE is not set
 # BR2_PACKAGE_HOST_GENPART is not set
 # BR2_PACKAGE_HOST_GNUPG is not set
-BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS=y
-BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS=y
+BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS=y
+BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS=y
+BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS=y
 # BR2_PACKAGE_HOST_GPTFDISK is not set
+# BR2_PACKAGE_HOST_IMAGEMAGICK is not set
 # BR2_PACKAGE_HOST_IMX_MKIMAGE is not set
 # BR2_PACKAGE_HOST_JQ is not set
 # BR2_PACKAGE_HOST_JSMIN is not set
+# BR2_PACKAGE_HOST_LIBP11 is not set
+# BR2_PACKAGE_HOST_LLD is not set
 # BR2_PACKAGE_HOST_LPC3250LOADER is not set
 # BR2_PACKAGE_HOST_LTTNG_BABELTRACE is not set
+# BR2_PACKAGE_HOST_MENDER_ARTIFACT is not set
 # BR2_PACKAGE_HOST_MKPASSWD is not set
 # BR2_PACKAGE_HOST_MTD is not set
 # BR2_PACKAGE_HOST_MTOOLS is not set
@@ -3028,10 +3159,12 @@ BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_PATCHELF=y
 # BR2_PACKAGE_HOST_PKGCONF is not set
 # BR2_PACKAGE_HOST_PWGEN is not set
+# BR2_PACKAGE_HOST_PYTHON is not set
 # BR2_PACKAGE_HOST_PYTHON_CYTHON is not set
 # BR2_PACKAGE_HOST_PYTHON_LXML is not set
 # BR2_PACKAGE_HOST_PYTHON_SIX is not set
 # BR2_PACKAGE_HOST_PYTHON_XLRD is not set
+# BR2_PACKAGE_HOST_PYTHON3 is not set
 BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS=y
@@ -3058,9 +3191,68 @@ BR2_PACKAGE_PROVIDES_HOST_RUSTC="host-rust-bin"
 #
 
 #
-# Legacy options removed in 2019.02
+# Legacy options removed in 2019.11
 #
+# BR2_PACKAGE_OPENVMTOOLS_PROCPS is not set
+# BR2_PACKAGE_ALLJOYN is not set
+# BR2_PACKAGE_ALLJOYN_BASE is not set
+# BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL is not set
+# BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION is not set
+# BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING is not set
+# BR2_PACKAGE_ALLJOYN_TCL_BASE is not set
+# BR2_PACKAGE_ALLJOYN_TCL is not set
+BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS=""
+# BR2_PACKAGE_PYTHON_PYSNMP_APPS is not set
+# BR2_KERNEL_HEADERS_5_2 is not set
+# BR2_TARGET_RISCV_PK is not set
+# BR2_PACKAGE_SQLITE_STAT3 is not set
+# BR2_KERNEL_HEADERS_5_1 is not set
+# BR2_PACKAGE_DEVMEM2 is not set
+# BR2_PACKAGE_USTR is not set
+# BR2_PACKAGE_KODI_SCREENSAVER_PLANESTATE is not set
+# BR2_PACKAGE_KODI_VISUALISATION_WAVEFORHUE is not set
+# BR2_PACKAGE_KODI_AUDIODECODER_OPUS is not set
+# BR2_PACKAGE_MESA3D_OSMESA is not set
+# BR2_PACKAGE_HOSTAPD_DRIVER_RTW is not set
+# BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW is not set
+# BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD is not set
+
+#
+# Legacy options removed in 2019.08
+#
+# BR2_TARGET_TS4800_MBRBOOT is not set
+# BR2_PACKAGE_LIBAMCODEC is not set
+# BR2_PACKAGE_ODROID_SCRIPTS is not set
+# BR2_PACKAGE_ODROID_MALI is not set
+# BR2_PACKAGE_KODI_PLATFORM_AML is not set
+# BR2_GCC_VERSION_6_X is not set
+# BR2_GCC_VERSION_4_9_X is not set
+# BR2_GDB_VERSION_7_12 is not set
+# BR2_PACKAGE_XAPP_MKFONTDIR is not set
+# BR2_GDB_VERSION_8_0 is not set
+# BR2_KERNEL_HEADERS_4_20 is not set
+# BR2_KERNEL_HEADERS_5_0 is not set
+
+#
+# Legacy options removed in 2019.05
+#
+# BR2_CSKY_DSP is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD is not set
+# BR2_PACKAGE_LUNIT is not set
+# BR2_PACKAGE_FFMPEG_FFSERVER is not set
+# BR2_PACKAGE_LIBUMP is not set
+# BR2_PACKAGE_SUNXI_MALI is not set
+# BR2_BINUTILS_VERSION_2_29_X is not set
+# BR2_BINUTILS_VERSION_2_28_X is not set
 # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK is not set
+
+#
+# Legacy options removed in 2019.02
+#
 # BR2_PACKAGE_QT is not set
 # BR2_PACKAGE_QTUIO is not set
 # BR2_PACKAGE_PINENTRY_QT4 is not set
@@ -3269,7 +3461,6 @@ BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES=0
 # BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK is not set
 # BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL is not set
 # BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD is not set
-# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC is not set
 # BR2_STRIP_none is not set
 # BR2_PACKAGE_BEECRYPT_CPP is not set
 # BR2_PACKAGE_SPICE_CLIENT is not set
diff --git a/recipes-core/non-root-initramfs/files/arm64-config b/recipes-core/non-root-initramfs/files/arm64-config
index fe9e1a2..6d76fb6 100644
--- a/recipes-core/non-root-initramfs/files/arm64-config
+++ b/recipes-core/non-root-initramfs/files/arm64-config
@@ -1,16 +1,13 @@
 #
 # Automatically generated file; DO NOT EDIT.
-# Buildroot 2019.02.2 Configuration
+# Buildroot 2019.11.1 Configuration
 #
 BR2_HAVE_DOT_CONFIG=y
-BR2_HOST_GCC_AT_LEAST_4_5=y
-BR2_HOST_GCC_AT_LEAST_4_6=y
-BR2_HOST_GCC_AT_LEAST_4_7=y
-BR2_HOST_GCC_AT_LEAST_4_8=y
 BR2_HOST_GCC_AT_LEAST_4_9=y
 BR2_HOST_GCC_AT_LEAST_5=y
 BR2_HOST_GCC_AT_LEAST_6=y
 BR2_HOST_GCC_AT_LEAST_7=y
+BR2_HOST_GCC_AT_LEAST_8=y
 
 #
 # Target options
@@ -33,6 +30,7 @@ BR2_aarch64=y
 # BR2_mipsel is not set
 # BR2_mips64 is not set
 # BR2_mips64el is not set
+# BR2_nds32 is not set
 # BR2_nios2 is not set
 # BR2_or1k is not set
 # BR2_powerpc is not set
@@ -71,8 +69,10 @@ BR2_cortex_a53=y
 # BR2_cortex_a73 is not set
 # BR2_cortex_a73_a35 is not set
 # BR2_cortex_a73_a53 is not set
+# BR2_emag is not set
 # BR2_exynos_m1 is not set
 # BR2_falkor is not set
+# BR2_phecda is not set
 # BR2_qdf24xx is not set
 # BR2_thunderx is not set
 # BR2_thunderxt81 is not set
@@ -94,9 +94,13 @@ BR2_cortex_a53=y
 # BR2_cortex_a55 is not set
 # BR2_cortex_a75 is not set
 # BR2_cortex_a75_a55 is not set
+# BR2_cortex_a76 is not set
+# BR2_cortex_a76_a55 is not set
+# BR2_neoverse_n1 is not set
+# BR2_tsv110 is not set
 
 #
-# armv8.3a cores
+# armv8.4a cores
 #
 # BR2_saphira is not set
 # BR2_ARM_FPU_VFPV2 is not set
@@ -168,6 +172,7 @@ BR2_GLOBAL_PATCH_DIR=""
 #
 # Security Hardening Options
 #
+# BR2_PIC_PIE is not set
 
 #
 # Stack Smashing Protection needs a toolchain w/ SSP
@@ -203,12 +208,12 @@ BR2_TOOLCHAIN_BUILDROOT_LIBC="uclibc"
 # BR2_KERNEL_HEADERS_4_4 is not set
 # BR2_KERNEL_HEADERS_4_9 is not set
 # BR2_KERNEL_HEADERS_4_14 is not set
-BR2_KERNEL_HEADERS_4_19=y
-# BR2_KERNEL_HEADERS_4_20 is not set
+# BR2_KERNEL_HEADERS_4_19 is not set
+BR2_KERNEL_HEADERS_5_3=y
 # BR2_KERNEL_HEADERS_VERSION is not set
 # BR2_KERNEL_HEADERS_CUSTOM_TARBALL is not set
 # BR2_KERNEL_HEADERS_CUSTOM_GIT is not set
-BR2_DEFAULT_KERNEL_HEADERS="4.19.36"
+BR2_DEFAULT_KERNEL_HEADERS="5.3.18"
 BR2_PACKAGE_LINUX_HEADERS=y
 
 #
@@ -229,22 +234,20 @@ BR2_UCLIBC_INSTALL_UTILS=y
 # Binutils Options
 #
 BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI=y
-# BR2_BINUTILS_VERSION_2_28_X is not set
-# BR2_BINUTILS_VERSION_2_29_X is not set
 # BR2_BINUTILS_VERSION_2_30_X is not set
-BR2_BINUTILS_VERSION_2_31_X=y
-BR2_BINUTILS_VERSION="2.31.1"
+# BR2_BINUTILS_VERSION_2_31_X is not set
+BR2_BINUTILS_VERSION_2_32_X=y
+BR2_BINUTILS_VERSION="2.32"
 BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
 
 #
 # GCC Options
 #
-# BR2_GCC_VERSION_4_9_X is not set
 # BR2_GCC_VERSION_5_X is not set
-# BR2_GCC_VERSION_6_X is not set
 # BR2_GCC_VERSION_7_X is not set
-BR2_GCC_VERSION_8_X=y
-BR2_GCC_VERSION="8.3.0"
+# BR2_GCC_VERSION_8_X is not set
+BR2_GCC_VERSION_9_X=y
+BR2_GCC_VERSION="9.2.0"
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 # BR2_TOOLCHAIN_BUILDROOT_FORTRAN is not set
@@ -257,7 +260,6 @@ BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS=y
 # Host GDB Options
 #
 # BR2_PACKAGE_HOST_GDB is not set
-BR2_PACKAGE_GDB_NEEDS_CXX11=y
 
 #
 # Toolchain Generic Options
@@ -268,6 +270,7 @@ BR2_INSTALL_LIBSTDCPP=y
 BR2_TOOLCHAIN_HAS_THREADS=y
 BR2_TOOLCHAIN_HAS_THREADS_NPTL=y
 BR2_TOOLCHAIN_SUPPORTS_PIE=y
+BR2_TOOLCHAIN_EXTRA_LIBS=""
 BR2_USE_MMU=y
 BR2_TARGET_OPTIMIZATION=""
 BR2_TARGET_LDFLAGS=""
@@ -312,7 +315,12 @@ BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19=y
-BR2_TOOLCHAIN_HEADERS_AT_LEAST="4.19"
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST="5.3"
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_3=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_4=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_5=y
@@ -324,7 +332,8 @@ BR2_TOOLCHAIN_GCC_AT_LEAST_5=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_6=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_7=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_8=y
-BR2_TOOLCHAIN_GCC_AT_LEAST="8"
+BR2_TOOLCHAIN_GCC_AT_LEAST_9=y
+BR2_TOOLCHAIN_GCC_AT_LEAST="9"
 BR2_TOOLCHAIN_HAS_MNAN_OPTION=y
 BR2_TOOLCHAIN_HAS_SYNC_1=y
 BR2_TOOLCHAIN_HAS_SYNC_2=y
@@ -345,6 +354,7 @@ BR2_TARGET_GENERIC_PASSWD_SHA256=y
 BR2_TARGET_GENERIC_PASSWD_METHOD="sha-256"
 BR2_INIT_BUSYBOX=y
 # BR2_INIT_SYSV is not set
+# BR2_INIT_OPENRC is not set
 
 #
 # systemd needs a glibc toolchain w/ SSP, headers >= 3.10
@@ -393,6 +403,7 @@ BR2_ROOTFS_OVERLAY="$(TOPDIR)/../overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/../build-ivshmem-demo.sh"
 BR2_ROOTFS_POST_FAKEROOT_SCRIPT=""
 BR2_ROOTFS_POST_IMAGE_SCRIPT=""
+BR2_ROOTFS_POST_SCRIPT_ARGS=""
 
 #
 # Kernel
@@ -406,6 +417,7 @@ BR2_PACKAGE_BUSYBOX=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES=""
 # BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
+# BR2_PACKAGE_BUSYBOX_SELINUX is not set
 # BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES is not set
 # BR2_PACKAGE_BUSYBOX_WATCHDOG is not set
 BR2_PACKAGE_SKELETON=y
@@ -458,11 +470,12 @@ BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS=y
 #
 # gstreamer 1.x needs a toolchain w/ wchar, threads
 #
+# BR2_PACKAGE_JACK1 is not set
 # BR2_PACKAGE_JACK2 is not set
 BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 
 #
-# kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.8, host gcc >= 4.6
+# kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.8
 #
 
 #
@@ -474,6 +487,7 @@ BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 #
 # mimic needs a toolchain w/ wchar
 #
+# BR2_PACKAGE_MINIMODEM is not set
 
 #
 # miraclecast needs systemd and a glibc toolchain w/ threads and wchar
@@ -483,7 +497,7 @@ BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 # BR2_PACKAGE_MOTION is not set
 
 #
-# mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.9
+# mpd needs a toolchain w/ C++, threads, wchar, gcc >= 6
 #
 # BR2_PACKAGE_MPD_MPC is not set
 # BR2_PACKAGE_MPG123 is not set
@@ -492,7 +506,7 @@ BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 # BR2_PACKAGE_MUSEPACK is not set
 
 #
-# ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 4.9
+# ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 6
 #
 # BR2_PACKAGE_OPUS_TOOLS is not set
 BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
@@ -532,6 +546,10 @@ BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
 #
 # BR2_PACKAGE_BROTLI is not set
 # BR2_PACKAGE_BZIP2 is not set
+
+#
+# lrzip needs a toolchain w/ wchar, threads, C++
+#
 # BR2_PACKAGE_LZ4 is not set
 # BR2_PACKAGE_LZIP is not set
 # BR2_PACKAGE_LZOP is not set
@@ -562,13 +580,14 @@ BR2_PACKAGE_CACHE_CALIBRATOR=y
 #
 # clinfo needs an OpenCL provider
 #
-# BR2_PACKAGE_DHRYSTONE is not set
-# BR2_PACKAGE_DIEHARDER is not set
-# BR2_PACKAGE_DMALLOC is not set
 
 #
-# dropwatch needs a toolchain w/ threads, wchar
+# dacapo needs OpenJDK
 #
+# BR2_PACKAGE_DHRYSTONE is not set
+# BR2_PACKAGE_DIEHARDER is not set
+# BR2_PACKAGE_DMALLOC is not set
+# BR2_PACKAGE_DROPWATCH is not set
 
 #
 # dstat needs a toolchain w/ wchar, threads, dynamic library
@@ -619,10 +638,7 @@ BR2_PACKAGE_LTRACE_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LTTNG_TOOLS is not set
 # BR2_PACKAGE_MEMSTAT is not set
 # BR2_PACKAGE_NETPERF is not set
-
-#
-# netsniff-ng needs a glibc or musl toolchain w/ threads, headers >= 3.0
-#
+# BR2_PACKAGE_NETSNIFF_NG is not set
 
 #
 # nmon needs a glibc toolchain
@@ -633,6 +649,10 @@ BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS=y
 # oprofile needs a toolchain w/ C++, wchar
 #
 # BR2_PACKAGE_PAX_UTILS is not set
+
+#
+# piglit needs glibc or musl
+#
 # BR2_PACKAGE_PV is not set
 # BR2_PACKAGE_RAMSMP is not set
 # BR2_PACKAGE_RAMSPEED is not set
@@ -676,10 +696,8 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_CXXTEST is not set
 # BR2_PACKAGE_FLEX is not set
-
-#
-# gettext needs a toolchain w/ wchar
-#
+# BR2_PACKAGE_GETTEXT is not set
+BR2_PACKAGE_PROVIDES_HOST_GETTEXT="host-gettext-tiny"
 # BR2_PACKAGE_GIT is not set
 # BR2_PACKAGE_GIT_CRYPT is not set
 # BR2_PACKAGE_GPERF is not set
@@ -726,7 +744,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 
 #
-# ecryptfs-utils needs a toolchain w/ threads, wchar, dynami library
+# ecryptfs-utils needs a toolchain w/ threads, wchar, dynamic library
 #
 
 #
@@ -815,6 +833,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # Games
 #
+# BR2_PACKAGE_ASCII_INVADERS is not set
 # BR2_PACKAGE_CHOCOLATE_DOOM is not set
 # BR2_PACKAGE_FLARE_ENGINE is not set
 # BR2_PACKAGE_GNUCHESS is not set
@@ -832,11 +851,15 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # Graphic applications
 #
+
+#
+# cog needs wpewebkit and a toolchain w/ threads
+#
 # BR2_PACKAGE_FSWEBCAM is not set
 # BR2_PACKAGE_GHOSTSCRIPT is not set
 
 #
-# glmark2 needs an OpenGL or an openGL ES and EGL backend provided by mesa3d
+# glmark2 needs an OpenGL or an openGL ES and EGL backend
 #
 # BR2_PACKAGE_GNUPLOT is not set
 
@@ -844,6 +867,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # jhead needs a toolchain w/ wchar
 #
 # BR2_PACKAGE_LIBVA_UTILS is not set
+BR2_PACKAGE_NETSURF_ARCH_SUPPORTS=y
 # BR2_PACKAGE_NETSURF is not set
 # BR2_PACKAGE_PNGQUANT is not set
 
@@ -851,6 +875,10 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # rrdtool needs a toolchain w/ wchar, threads
 #
 
+#
+# stellarium needs Qt5 and an OpenGL provider
+#
+
 #
 # tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 4.8, dynamic library, wchar
 #
@@ -860,9 +888,9 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_CEGUI06 is not set
 # BR2_PACKAGE_DIRECTFB is not set
+# BR2_PACKAGE_FB_TEST_APP is not set
 # BR2_PACKAGE_FBDUMP is not set
 # BR2_PACKAGE_FBGRAB is not set
-# BR2_PACKAGE_FB_TEST_APP is not set
 
 #
 # fbterm needs a toolchain w/ C++, wchar, locale
@@ -880,6 +908,10 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # BR2_PACKAGE_MESA3D is not set
 # BR2_PACKAGE_OCRAD is not set
 
+#
+# ogre needs a toolchain w/ C++, dynamic library, gcc >= 4.8, threads, wchar
+#
+
 #
 # psplash needs a toolchain w/ wchar
 #
@@ -908,7 +940,7 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 #
 
 #
-# midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8
+# midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6
 #
 
 #
@@ -930,6 +962,7 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 # BR2_PACKAGE_ARMBIAN_FIRMWARE is not set
 # BR2_PACKAGE_B43_FIRMWARE is not set
 # BR2_PACKAGE_LINUX_FIRMWARE is not set
+# BR2_PACKAGE_MURATA_CYW_FW is not set
 # BR2_PACKAGE_RPI_BT_FIRMWARE is not set
 # BR2_PACKAGE_RPI_FIRMWARE is not set
 # BR2_PACKAGE_RPI_WIFI_FIRMWARE is not set
@@ -951,6 +984,10 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 # bcache-tools needs udev /dev management
 #
 
+#
+# brickd needs udev /dev management, a toolchain w/ threads, wchar
+#
+
 #
 # brltty needs a toolchain w/ dynamic lib, threads, wchar
 #
@@ -1015,12 +1052,14 @@ BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS=y
 # BR2_PACKAGE_IRDA_UTILS is not set
 # BR2_PACKAGE_KBD is not set
 # BR2_PACKAGE_LCDPROC is not set
+# BR2_PACKAGE_LIBUBOOTENV is not set
 # BR2_PACKAGE_LIBUIO is not set
-# BR2_PACKAGE_LINUXCONSOLETOOLS is not set
 
 #
 # linux-backports needs a Linux kernel to be built
 #
+# BR2_PACKAGE_LINUX_SERIAL_TEST is not set
+# BR2_PACKAGE_LINUXCONSOLETOOLS is not set
 # BR2_PACKAGE_LIRC_TOOLS is not set
 # BR2_PACKAGE_LM_SENSORS is not set
 
@@ -1032,6 +1071,7 @@ BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LUKSMETA is not set
 # BR2_PACKAGE_LVM2 is not set
 # BR2_PACKAGE_MDADM is not set
+# BR2_PACKAGE_MDEVD is not set
 # BR2_PACKAGE_MEMTESTER is not set
 # BR2_PACKAGE_MEMTOOL is not set
 
@@ -1045,11 +1085,6 @@ BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_NVME is not set
 
-#
-# odroid-mali needs a glibc toolchain
-#
-# BR2_PACKAGE_ODROID_SCRIPTS is not set
-
 #
 # ofono needs a toolchain w/ dynamic library, wchar, threads
 #
@@ -1200,7 +1235,17 @@ BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS=y
 BR2_PACKAGE_NODEJS_ARCH_SUPPORTS=y
 
 #
-# nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 4.8, wchar
+# nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 4.9, wchar
+#
+BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS=y
+BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS=y
+
+#
+# openjdk needs X.Org
+#
+
+#
+# openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++
 #
 # BR2_PACKAGE_PERL is not set
 # BR2_PACKAGE_PHP is not set
@@ -1229,6 +1274,7 @@ BR2_PACKAGE_NODEJS_ARCH_SUPPORTS=y
 # BR2_PACKAGE_AUBIO is not set
 # BR2_PACKAGE_AUDIOFILE is not set
 # BR2_PACKAGE_BCG729 is not set
+# BR2_PACKAGE_CAPS is not set
 # BR2_PACKAGE_CELT051 is not set
 BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS=y
 # BR2_PACKAGE_FDK_AAC is not set
@@ -1289,6 +1335,7 @@ BR2_PACKAGE_OPENAL_ARCH_SUPPORTS=y
 #
 # libarchive needs a toolchain w/ wchar
 #
+# BR2_PACKAGE_LIBMSPACK is not set
 # BR2_PACKAGE_LIBSQUISH is not set
 # BR2_PACKAGE_LIBZIP is not set
 # BR2_PACKAGE_LZO is not set
@@ -1301,6 +1348,7 @@ BR2_PACKAGE_OPENAL_ARCH_SUPPORTS=y
 BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS=y
 # BR2_PACKAGE_ZLIB is not set
 BR2_PACKAGE_PROVIDES_HOST_ZLIB="host-libzlib"
+# BR2_PACKAGE_ZZIPLIB is not set
 
 #
 # Crypto
@@ -1330,6 +1378,8 @@ BR2_PACKAGE_LIBGPG_ERROR_SYSCFG="aarch64-unknown-linux-gnu"
 # BR2_PACKAGE_LIBMCRYPT is not set
 # BR2_PACKAGE_LIBMHASH is not set
 # BR2_PACKAGE_LIBNSS is not set
+# BR2_PACKAGE_LIBOLM is not set
+# BR2_PACKAGE_LIBP11 is not set
 # BR2_PACKAGE_LIBSCRYPT is not set
 
 #
@@ -1398,7 +1448,10 @@ BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 #
 # Graphics
 #
-# BR2_PACKAGE_ASSIMP is not set
+
+#
+# assimp needs a toolchain w/ C++, wchar
+#
 
 #
 # at-spi2-atk needs a toolchain w/ wchar, threads
@@ -1434,10 +1487,13 @@ BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 # chipmunk needs an OpenGL backend
 #
 
+#
+# exempi needs a toolchain w/ C++, dynamic library, threads, wchar
+#
+
 #
 # exiv2 needs a uClibc or glibc toolchain w/ C++, wchar, dynamic library, threads
 #
-# BR2_PACKAGE_EXEMPI is not set
 # BR2_PACKAGE_FONTCONFIG is not set
 # BR2_PACKAGE_FREETYPE is not set
 # BR2_PACKAGE_GD is not set
@@ -1482,7 +1538,7 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # BR2_PACKAGE_LIBEXIF is not set
 
 #
-# libfm needs X.org and a toolchain w/ wchar, threads, C++
+# libfm needs X.org and a toolchain w/ wchar, threads, C++, gcc >= 4.8
 #
 
 #
@@ -1496,7 +1552,10 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 #
 # libfreeimage needs a toolchain w/ C++, dynamic library, wchar
 #
-# BR2_PACKAGE_LIBGEOTIFF is not set
+
+#
+# libgeotiff needs a toolchain w/ C++, gcc >= 4.7, threads, wchar
+#
 
 #
 # libglew depends on X.org and needs an OpenGL backend
@@ -1512,7 +1571,7 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # BR2_PACKAGE_LIBGTA is not set
 
 #
-# libgtk3 needs a toolchain w/ wchar, threads, C++
+# libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.8
 #
 
 #
@@ -1528,7 +1587,7 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # BR2_PACKAGE_LIBRAW is not set
 
 #
-# librsvg needs a toolchain w/ wchar, threads, C++
+# librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.8
 #
 
 #
@@ -1543,6 +1602,10 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # libvips needs a toolchain w/ wchar, threads, C++
 #
 
+#
+# libwpe needs a toolchain w/ C++, dynamic library and an OpenEGL-capable backend
+#
+
 #
 # menu-cache needs a toolchain w/ wchar, threads
 #
@@ -1557,24 +1620,39 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # BR2_PACKAGE_OPENJPEG is not set
 
 #
-# pango needs a toolchain w/ wchar, threads, C++
+# pango needs a toolchain w/ wchar, threads, C++, gcc >= 4.8
 #
 
 #
 # pangomm needs a toolchain w/ C++, wchar, threads, gcc >= 4.9
 #
 # BR2_PACKAGE_PIXMAN is not set
-# BR2_PACKAGE_POPPLER is not set
+
+#
+# poppler needs a toolchain w/ wchar, C++, threads, dynamic library, gcc >= 5
+#
 # BR2_PACKAGE_TIFF is not set
 # BR2_PACKAGE_WAYLAND is not set
 BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS=y
-BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT=y
 
 #
-# webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8
+# webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6
 #
 # BR2_PACKAGE_WEBP is not set
 # BR2_PACKAGE_WOFF2 is not set
+
+#
+# wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and an OpenEGL-capable Wayland backend
+#
+BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS=y
+
+#
+# wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 6
+#
+
+#
+# wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend
+#
 # BR2_PACKAGE_ZBAR is not set
 # BR2_PACKAGE_ZXING_CPP is not set
 
@@ -1592,6 +1670,7 @@ BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=y
 #
 # hidapi needs udev /dev management and a toolchain w/ NPTL threads
 #
+# BR2_PACKAGE_JITTERENTROPY_LIBRARY is not set
 # BR2_PACKAGE_LCDAPI is not set
 # BR2_PACKAGE_LET_ME_CREATE is not set
 # BR2_PACKAGE_LIBAIO is not set
@@ -1681,6 +1760,7 @@ BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=y
 # BR2_PACKAGE_JQUERY is not set
 # BR2_PACKAGE_JSMIN is not set
 # BR2_PACKAGE_JSON_JAVASCRIPT is not set
+# BR2_PACKAGE_OPENLAYERS is not set
 
 #
 # JSON/XML
@@ -1733,7 +1813,6 @@ BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=y
 #
 # Logging
 #
-# BR2_PACKAGE_EVENTLOG is not set
 # BR2_PACKAGE_GLOG is not set
 # BR2_PACKAGE_LIBLOG4C_LOCALTIME is not set
 # BR2_PACKAGE_LIBLOGGING is not set
@@ -1744,18 +1823,26 @@ BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LOG4CPP is not set
 # BR2_PACKAGE_LOG4CXX is not set
 # BR2_PACKAGE_OPENTRACING_CPP is not set
+
+#
+# spdlog needs a toolchain w/ C++, threads, wchar
+#
 # BR2_PACKAGE_ZLOG is not set
 
 #
 # Multimedia
 #
 # BR2_PACKAGE_BITSTREAM is not set
+# BR2_PACKAGE_DAV1D is not set
 # BR2_PACKAGE_KVAZAAR is not set
 # BR2_PACKAGE_LIBAACS is not set
-# BR2_PACKAGE_LIBAMCODEC is not set
 # BR2_PACKAGE_LIBASS is not set
 # BR2_PACKAGE_LIBBDPLUS is not set
 # BR2_PACKAGE_LIBBLURAY is not set
+
+#
+# libcamera needs udev and a toolchain w/ C++, threads, gcc >= 5
+#
 # BR2_PACKAGE_LIBDCADEC is not set
 # BR2_PACKAGE_LIBDVBCSA is not set
 # BR2_PACKAGE_LIBDVBPSI is not set
@@ -1799,17 +1886,7 @@ BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS=y
 # BR2_PACKAGE_AGENTPP is not set
 
 #
-# alljoyn needs a toolchain w/ C++, threads, wchar and dynamic library
-#
-
-#
-# alljoyn-base needs a toolchain w/ C++, threads, wchar, dynamic library
-#
-# BR2_PACKAGE_ALLJOYN_TCL is not set
-# BR2_PACKAGE_ALLJOYN_TCL_BASE is not set
-
-#
-# azmq needs a toolchain w/ C++11, wchar and NTPL
+# azmq needs a toolchain w/ C++11, wchar and NPTL
 #
 # BR2_PACKAGE_AZURE_IOT_SDK_C is not set
 
@@ -1823,6 +1900,7 @@ BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS=y
 # BR2_PACKAGE_CZMQ is not set
 # BR2_PACKAGE_DAQ is not set
 # BR2_PACKAGE_DAVICI is not set
+# BR2_PACKAGE_ENET is not set
 # BR2_PACKAGE_FILEMQ is not set
 # BR2_PACKAGE_FLICKCURL is not set
 # BR2_PACKAGE_FREERADIUS_CLIENT is not set
@@ -1865,7 +1943,9 @@ BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS=y
 #
 # libgsasl needs a toolchain w/ wchar
 #
+# BR2_PACKAGE_LIBHTP is not set
 # BR2_PACKAGE_LIBHTTPPARSER is not set
+# BR2_PACKAGE_LIBHTTPSERVER is not set
 # BR2_PACKAGE_LIBIDN is not set
 # BR2_PACKAGE_LIBIDN2 is not set
 # BR2_PACKAGE_LIBISCSI is not set
@@ -1881,6 +1961,7 @@ BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBNATPMP is not set
 # BR2_PACKAGE_LIBNDP is not set
 # BR2_PACKAGE_LIBNET is not set
+# BR2_PACKAGE_LIBNETCONF2 is not set
 # BR2_PACKAGE_LIBNETFILTER_ACCT is not set
 # BR2_PACKAGE_LIBNETFILTER_CONNTRACK is not set
 # BR2_PACKAGE_LIBNETFILTER_CTHELPER is not set
@@ -1914,7 +1995,7 @@ BR2_PACKAGE_LIBTIRPC=y
 # BR2_PACKAGE_LIBTORRENT is not set
 
 #
-# libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.8
+# libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.9
 #
 # BR2_PACKAGE_LIBUPNP is not set
 # BR2_PACKAGE_LIBUPNP18 is not set
@@ -1923,6 +2004,7 @@ BR2_PACKAGE_LIBTIRPC=y
 # BR2_PACKAGE_LIBVNCSERVER is not set
 # BR2_PACKAGE_LIBWEBSOCK is not set
 # BR2_PACKAGE_LIBWEBSOCKETS is not set
+# BR2_PACKAGE_LIBYANG is not set
 # BR2_PACKAGE_LKSCTP_TOOLS is not set
 # BR2_PACKAGE_MONGOOSE is not set
 # BR2_PACKAGE_NANOMSG is not set
@@ -1952,17 +2034,20 @@ BR2_PACKAGE_LIBTIRPC=y
 #
 
 #
-# openzwave needs udev and a toolchain w/ C++, threads, wchar
+# openzwave needs a toolchain w/ C++, dynamic library, NPTL, wchar
 #
 # BR2_PACKAGE_ORTP is not set
 # BR2_PACKAGE_PAHO_MQTT_C is not set
+# BR2_PACKAGE_PAHO_MQTT_CPP is not set
 # BR2_PACKAGE_QDECODER is not set
 # BR2_PACKAGE_QPID_PROTON is not set
 # BR2_PACKAGE_RABBITMQ_C is not set
+# BR2_PACKAGE_RESTCLIENT_CPP is not set
 # BR2_PACKAGE_RTMPDUMP is not set
 # BR2_PACKAGE_SLIRP is not set
 # BR2_PACKAGE_SNMPPP is not set
 # BR2_PACKAGE_SOFIA_SIP is not set
+# BR2_PACKAGE_SYSREPO is not set
 
 #
 # thrift needs a toolchain w/ C++, wchar, threads
@@ -1988,10 +2073,11 @@ BR2_PACKAGE_LIBTIRPC=y
 #
 # boost needs a toolchain w/ C++, threads, wchar
 #
+# BR2_PACKAGE_C_CAPNPROTO is not set
 # BR2_PACKAGE_CAPNPROTO is not set
 
 #
-# clang needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library
+# clang needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library
 #
 # BR2_PACKAGE_CLAPACK is not set
 # BR2_PACKAGE_CMOCKA is not set
@@ -2020,6 +2106,7 @@ BR2_PACKAGE_LIBTIRPC=y
 # gconf needs a toolchain w/ threads, wchar, dynamic library
 #
 # BR2_PACKAGE_GFLAGS is not set
+# BR2_PACKAGE_GLI is not set
 
 #
 # glibmm needs a toolchain w/ C++, wchar, threads, gcc >= 4.9
@@ -2040,6 +2127,7 @@ BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBARGTABLE2 is not set
 BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBATOMIC_OPS is not set
+# BR2_PACKAGE_LIBAVL is not set
 # BR2_PACKAGE_LIBB64 is not set
 BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS=y
 
@@ -2116,7 +2204,7 @@ BR2_PACKAGE_LLVM_ARCH_SUPPORTS=y
 BR2_PACKAGE_LLVM_TARGET_ARCH="AArch64"
 
 #
-# llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library
+# llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library
 #
 
 #
@@ -2128,6 +2216,7 @@ BR2_PACKAGE_LLVM_TARGET_ARCH="AArch64"
 # BR2_PACKAGE_MPIR is not set
 # BR2_PACKAGE_MSGPACK is not set
 # BR2_PACKAGE_MTDEV2TUIO is not set
+# BR2_PACKAGE_MUSL_FTS is not set
 BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET="ARMV8"
 BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS=y
 # BR2_PACKAGE_OPENBLAS is not set
@@ -2150,19 +2239,14 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 # BR2_PACKAGE_SKALIBS is not set
 # BR2_PACKAGE_SPHINXBASE is not set
 # BR2_PACKAGE_TINYCBOR is not set
+# BR2_PACKAGE_UVW is not set
 # BR2_PACKAGE_XAPIAN is not set
 
 #
 # Security
 #
-
-#
-# libselinux needs a glibc toolchain w/ threads, dynamic library
-#
-
-#
-# libsemanage needs a glibc toolchain w/ threads, dynamic library
-#
+# BR2_PACKAGE_LIBSELINUX is not set
+# BR2_PACKAGE_LIBSEMANAGE is not set
 # BR2_PACKAGE_LIBSEPOL is not set
 # BR2_PACKAGE_SAFECLIB is not set
 
@@ -2183,7 +2267,11 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 #
 
 #
-# icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.8, host gcc >= 4.8
+# fstrcmp needs a toolchain w/ wchar
+#
+
+#
+# icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.8
 #
 # BR2_PACKAGE_LIBCLI is not set
 
@@ -2204,13 +2292,14 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 #
 # newt needs a toolchain w/ wchar, dynamic library
 #
+# BR2_PACKAGE_ONIGURUMA is not set
 # BR2_PACKAGE_PCRE is not set
 # BR2_PACKAGE_PCRE2 is not set
 # BR2_PACKAGE_POPT is not set
 # BR2_PACKAGE_READLINE is not set
 # BR2_PACKAGE_SLANG is not set
 # BR2_PACKAGE_TCLAP is not set
-# BR2_PACKAGE_USTR is not set
+# BR2_PACKAGE_UTF8PROC is not set
 
 #
 # Mail
@@ -2231,11 +2320,17 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_AESPIPE is not set
 # BR2_PACKAGE_BC is not set
+BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS=y
+
+#
+# bitcoin needs a toolchain w/ C++, wchar
+#
 
 #
 # clamav needs a toolchain w/ C++, threads, wchar
 #
 # BR2_PACKAGE_COLLECTD is not set
+# BR2_PACKAGE_COLLECTL is not set
 
 #
 # domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 4.8, NPTL, wchar, dynamic library
@@ -2262,7 +2357,10 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LINUX_SYSCALL_SUPPORT is not set
 # BR2_PACKAGE_MCRYPT is not set
 # BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO is not set
-# BR2_PACKAGE_PROJ is not set
+
+#
+# proj needs a toolchain w/ C++, gcc >= 4.7, threads, wchar
+#
 BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 
 #
@@ -2273,6 +2371,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 #
 # shared-mime-info needs a toolchain w/ wchar, threads
 #
+# BR2_PACKAGE_SUNWAIT is not set
 
 #
 # taskd needs a toolchain w/ C++, wchar, dynamic library
@@ -2352,6 +2451,7 @@ BR2_PACKAGE_DROPBEAR_SMALL=y
 # BR2_PACKAGE_DROPBEAR_WTMP is not set
 # BR2_PACKAGE_DROPBEAR_LASTLOG is not set
 # BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO is not set
+BR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE=""
 # BR2_PACKAGE_EBTABLES is not set
 
 #
@@ -2393,6 +2493,7 @@ BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_IBRDTN_TOOLS is not set
 # BR2_PACKAGE_IBRDTND is not set
+# BR2_PACKAGE_IFMETRIC is not set
 # BR2_PACKAGE_IFTOP is not set
 BR2_PACKAGE_IFUPDOWN_SCRIPTS=y
 
@@ -2469,7 +2570,7 @@ BR2_PACKAGE_IPUTILS=y
 # BR2_PACKAGE_MONKEY is not set
 
 #
-# mosh needs a toolchain w/ C++, threads, dynamic library, wchar, host and target gcc >= 4.8
+# mosh needs a toolchain w/ C++, threads, dynamic library, wchar, gcc >= 4.8
 #
 # BR2_PACKAGE_MOSQUITTO is not set
 # BR2_PACKAGE_MROUTED is not set
@@ -2486,7 +2587,7 @@ BR2_PACKAGE_IPUTILS=y
 # BR2_PACKAGE_NETSTAT_NAT is not set
 
 #
-# NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library
+# NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library, wchar, threads
 #
 # BR2_PACKAGE_NFACCT is not set
 
@@ -2576,10 +2677,15 @@ BR2_PACKAGE_IPUTILS=y
 # BR2_PACKAGE_SPAWN_FCGI is not set
 # BR2_PACKAGE_SPICE_PROTOCOL is not set
 # BR2_PACKAGE_SQUID is not set
+# BR2_PACKAGE_SSHGUARD is not set
 # BR2_PACKAGE_SSHPASS is not set
 # BR2_PACKAGE_SSLH is not set
 # BR2_PACKAGE_STRONGSWAN is not set
 # BR2_PACKAGE_STUNNEL is not set
+
+#
+# suricata needs a toolchain w/ wchar, threads
+#
 # BR2_PACKAGE_TCPDUMP is not set
 # BR2_PACKAGE_TCPING is not set
 # BR2_PACKAGE_TCPREPLAY is not set
@@ -2591,7 +2697,12 @@ BR2_PACKAGE_IPUTILS=y
 # BR2_PACKAGE_TRANSMISSION is not set
 # BR2_PACKAGE_TUNCTL is not set
 # BR2_PACKAGE_TVHEADEND is not set
+# BR2_PACKAGE_UACME is not set
 # BR2_PACKAGE_UDPCAST is not set
+
+#
+# uftp needs a toolchain w/ threads, wchar
+#
 # BR2_PACKAGE_UHTTPD is not set
 # BR2_PACKAGE_ULOGD is not set
 # BR2_PACKAGE_USHARE is not set
@@ -2602,7 +2713,7 @@ BR2_PACKAGE_IPUTILS=y
 # BR2_PACKAGE_VDE2 is not set
 
 #
-# vdr needs a glibc or uClibc toolchain w/ C++, dynamic library, NPTL, wchar, headers >= 3.9
+# vdr needs a glibc toolchain w/ C++, dynamic library, NPTL, wchar, headers >= 3.9
 #
 
 #
@@ -2692,22 +2803,16 @@ BR2_PACKAGE_IPUTILS=y
 #
 # Security
 #
-
-#
-# checkpolicy needs a glibc toolchain w/ threads, dynamic library
-#
+# BR2_PACKAGE_CHECKPOLICY is not set
+# BR2_PACKAGE_IMA_EVM_UTILS is not set
+# BR2_PACKAGE_OPTEE_BENCHMARK is not set
+# BR2_PACKAGE_OPTEE_CLIENT is not set
 
 #
 # paxtest needs a glibc toolchain
 #
-
-#
-# policycoreutils needs a glibc toolchain w/ threads, dynamic library
-#
-
-#
-# refpolicy needs a glibc toolchain w/ threads, dynamic library
-#
+# BR2_PACKAGE_POLICYCOREUTILS is not set
+# BR2_PACKAGE_REFPOLICY is not set
 
 #
 # restorecond needs a toolchain w/ wchar, threads, dynamic library
@@ -2719,7 +2824,7 @@ BR2_PACKAGE_IPUTILS=y
 # BR2_PACKAGE_SEMODULE_UTILS is not set
 
 #
-# setools needs a glibc toolchain w/ threads, C++, wchar, dynamic library
+# setools needs a toolchain w/ threads, C++, wchar, dynamic library
 #
 
 #
@@ -2765,6 +2870,7 @@ BR2_PACKAGE_IPUTILS=y
 #
 # BR2_PACKAGE_XMLSTARLET is not set
 # BR2_PACKAGE_XXHASH is not set
+# BR2_PACKAGE_YTREE is not set
 
 #
 # System tools
@@ -2778,7 +2884,7 @@ BR2_PACKAGE_AUDIT_ARCH_SUPPORTS=y
 # BR2_PACKAGE_CGROUPFS_MOUNT is not set
 
 #
-# circus needs Python and a toolchain w/ C++, threads
+# circus needs Python 3 and a toolchain w/ C++, threads
 #
 # BR2_PACKAGE_CPULOAD is not set
 # BR2_PACKAGE_DAEMON is not set
@@ -2787,7 +2893,7 @@ BR2_PACKAGE_AUDIT_ARCH_SUPPORTS=y
 # BR2_PACKAGE_DOCKER_CLI is not set
 
 #
-# docker-compose needs a toolchain w/ wchar, threads, dynamic library
+# docker-compose needs a toolchain w/ C++, wchar, threads, dynamic library
 #
 
 #
@@ -2818,6 +2924,10 @@ BR2_PACKAGE_INITSCRIPTS=y
 #
 # irqbalance needs a toolchain w/ wchar, threads
 #
+
+#
+# jailhouse needs a Linux kernel to be built
+#
 # BR2_PACKAGE_KEYUTILS is not set
 # BR2_PACKAGE_KMOD is not set
 
@@ -2828,10 +2938,13 @@ BR2_PACKAGE_INITSCRIPTS=y
 #
 # libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar
 #
-# BR2_PACKAGE_LXC is not set
 # BR2_PACKAGE_MENDER is not set
 # BR2_PACKAGE_MONIT is not set
 # BR2_PACKAGE_NCDU is not set
+
+#
+# netifrc needs openrc as init system
+#
 # BR2_PACKAGE_NUMACTL is not set
 # BR2_PACKAGE_NUT is not set
 
@@ -2863,7 +2976,7 @@ BR2_PACKAGE_INITSCRIPTS=y
 # BR2_PACKAGE_SMACK is not set
 
 #
-# supervisor needs the python interpreter
+# supervisor needs a python interpreter
 #
 # BR2_PACKAGE_SWUPDATE is not set
 BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS=y
@@ -2874,6 +2987,7 @@ BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS=y
 # tpm2-abrmd needs a toolchain w/ dynamic library, wchar, threads
 #
 # BR2_PACKAGE_TPM2_TOOLS is not set
+# BR2_PACKAGE_TPM2_TOTP is not set
 
 #
 # unscd needs a glibc toolchain
@@ -2892,6 +3006,7 @@ BR2_PACKAGE_XVISOR_ARCH_SUPPORTS=y
 #
 # mc needs a toolchain w/ threads, wchar
 #
+# BR2_PACKAGE_MOST is not set
 
 #
 # nano needs a toolchain w/ wchar
@@ -2943,6 +3058,7 @@ BR2_TARGET_GRUB2_ARCH_SUPPORTS=y
 # grub2 needs a toolchain w/ wchar
 #
 # BR2_TARGET_MV_DDR_MARVELL is not set
+# BR2_TARGET_OPTEE_OS is not set
 # BR2_TARGET_SHIM is not set
 # BR2_TARGET_UBOOT is not set
 # BR2_TARGET_VEXPRESS_FIRMWARE is not set
@@ -2959,6 +3075,7 @@ BR2_TARGET_GRUB2_ARCH_SUPPORTS=y
 # BR2_PACKAGE_HOST_CMAKE is not set
 # BR2_PACKAGE_HOST_CRAMFS is not set
 # BR2_PACKAGE_HOST_CRYPTSETUP is not set
+# BR2_PACKAGE_HOST_DBUS_PYTHON is not set
 # BR2_PACKAGE_HOST_DFU_UTIL is not set
 # BR2_PACKAGE_HOST_DOS2UNIX is not set
 # BR2_PACKAGE_HOST_DOSFSTOOLS is not set
@@ -2967,22 +3084,28 @@ BR2_TARGET_GRUB2_ARCH_SUPPORTS=y
 # BR2_PACKAGE_HOST_E2TOOLS is not set
 # BR2_PACKAGE_HOST_F2FS_TOOLS is not set
 # BR2_PACKAGE_HOST_FAKETIME is not set
+# BR2_PACKAGE_HOST_FATCAT is not set
 # BR2_PACKAGE_HOST_FWUP is not set
 # BR2_PACKAGE_HOST_GENEXT2FS is not set
 # BR2_PACKAGE_HOST_GENIMAGE is not set
 # BR2_PACKAGE_HOST_GENPART is not set
 # BR2_PACKAGE_HOST_GNUPG is not set
-BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS=y
-BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS=y
+BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS=y
+BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS=y
+BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS=y
 # BR2_PACKAGE_HOST_GPTFDISK is not set
+# BR2_PACKAGE_HOST_IMAGEMAGICK is not set
 # BR2_PACKAGE_HOST_IMX_MKIMAGE is not set
 # BR2_PACKAGE_HOST_IMX_USB_LOADER is not set
 # BR2_PACKAGE_HOST_JQ is not set
 # BR2_PACKAGE_HOST_JSMIN is not set
+# BR2_PACKAGE_HOST_LIBP11 is not set
+# BR2_PACKAGE_HOST_LLD is not set
 # BR2_PACKAGE_HOST_LPC3250LOADER is not set
 # BR2_PACKAGE_HOST_LTTNG_BABELTRACE is not set
+# BR2_PACKAGE_HOST_MENDER_ARTIFACT is not set
 # BR2_PACKAGE_HOST_MKPASSWD is not set
 # BR2_PACKAGE_HOST_MTD is not set
 # BR2_PACKAGE_HOST_MTOOLS is not set
@@ -2992,10 +3115,12 @@ BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_PATCHELF=y
 # BR2_PACKAGE_HOST_PKGCONF is not set
 # BR2_PACKAGE_HOST_PWGEN is not set
+# BR2_PACKAGE_HOST_PYTHON is not set
 # BR2_PACKAGE_HOST_PYTHON_CYTHON is not set
 # BR2_PACKAGE_HOST_PYTHON_LXML is not set
 # BR2_PACKAGE_HOST_PYTHON_SIX is not set
 # BR2_PACKAGE_HOST_PYTHON_XLRD is not set
+# BR2_PACKAGE_HOST_PYTHON3 is not set
 BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS=y
@@ -3022,9 +3147,68 @@ BR2_PACKAGE_PROVIDES_HOST_RUSTC="host-rust-bin"
 #
 
 #
-# Legacy options removed in 2019.02
+# Legacy options removed in 2019.11
+#
+# BR2_PACKAGE_OPENVMTOOLS_PROCPS is not set
+# BR2_PACKAGE_ALLJOYN is not set
+# BR2_PACKAGE_ALLJOYN_BASE is not set
+# BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL is not set
+# BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION is not set
+# BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING is not set
+# BR2_PACKAGE_ALLJOYN_TCL_BASE is not set
+# BR2_PACKAGE_ALLJOYN_TCL is not set
+BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS=""
+# BR2_PACKAGE_PYTHON_PYSNMP_APPS is not set
+# BR2_KERNEL_HEADERS_5_2 is not set
+# BR2_TARGET_RISCV_PK is not set
+# BR2_PACKAGE_SQLITE_STAT3 is not set
+# BR2_KERNEL_HEADERS_5_1 is not set
+# BR2_PACKAGE_DEVMEM2 is not set
+# BR2_PACKAGE_USTR is not set
+# BR2_PACKAGE_KODI_SCREENSAVER_PLANESTATE is not set
+# BR2_PACKAGE_KODI_VISUALISATION_WAVEFORHUE is not set
+# BR2_PACKAGE_KODI_AUDIODECODER_OPUS is not set
+# BR2_PACKAGE_MESA3D_OSMESA is not set
+# BR2_PACKAGE_HOSTAPD_DRIVER_RTW is not set
+# BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW is not set
+# BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD is not set
+
+#
+# Legacy options removed in 2019.08
+#
+# BR2_TARGET_TS4800_MBRBOOT is not set
+# BR2_PACKAGE_LIBAMCODEC is not set
+# BR2_PACKAGE_ODROID_SCRIPTS is not set
+# BR2_PACKAGE_ODROID_MALI is not set
+# BR2_PACKAGE_KODI_PLATFORM_AML is not set
+# BR2_GCC_VERSION_6_X is not set
+# BR2_GCC_VERSION_4_9_X is not set
+# BR2_GDB_VERSION_7_12 is not set
+# BR2_PACKAGE_XAPP_MKFONTDIR is not set
+# BR2_GDB_VERSION_8_0 is not set
+# BR2_KERNEL_HEADERS_4_20 is not set
+# BR2_KERNEL_HEADERS_5_0 is not set
+
+#
+# Legacy options removed in 2019.05
 #
+# BR2_CSKY_DSP is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD is not set
+# BR2_PACKAGE_LUNIT is not set
+# BR2_PACKAGE_FFMPEG_FFSERVER is not set
+# BR2_PACKAGE_LIBUMP is not set
+# BR2_PACKAGE_SUNXI_MALI is not set
+# BR2_BINUTILS_VERSION_2_29_X is not set
+# BR2_BINUTILS_VERSION_2_28_X is not set
 # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK is not set
+
+#
+# Legacy options removed in 2019.02
+#
 # BR2_PACKAGE_QT is not set
 # BR2_PACKAGE_QTUIO is not set
 # BR2_PACKAGE_PINENTRY_QT4 is not set
@@ -3233,7 +3417,6 @@ BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES=0
 # BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK is not set
 # BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL is not set
 # BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD is not set
-# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC is not set
 # BR2_STRIP_none is not set
 # BR2_PACKAGE_BEECRYPT_CPP is not set
 # BR2_PACKAGE_SPICE_CLIENT is not set
diff --git a/recipes-core/non-root-initramfs/files/armhf-config b/recipes-core/non-root-initramfs/files/armhf-config
index d5cd5bf..d3f468b 100644
--- a/recipes-core/non-root-initramfs/files/armhf-config
+++ b/recipes-core/non-root-initramfs/files/armhf-config
@@ -1,16 +1,13 @@
 #
 # Automatically generated file; DO NOT EDIT.
-# Buildroot 2019.02.2 Configuration
+# Buildroot 2019.11.1 Configuration
 #
 BR2_HAVE_DOT_CONFIG=y
-BR2_HOST_GCC_AT_LEAST_4_5=y
-BR2_HOST_GCC_AT_LEAST_4_6=y
-BR2_HOST_GCC_AT_LEAST_4_7=y
-BR2_HOST_GCC_AT_LEAST_4_8=y
 BR2_HOST_GCC_AT_LEAST_4_9=y
 BR2_HOST_GCC_AT_LEAST_5=y
 BR2_HOST_GCC_AT_LEAST_6=y
 BR2_HOST_GCC_AT_LEAST_7=y
+BR2_HOST_GCC_AT_LEAST_8=y
 
 #
 # Target options
@@ -31,6 +28,7 @@ BR2_arm=y
 # BR2_mipsel is not set
 # BR2_mips64 is not set
 # BR2_mips64el is not set
+# BR2_nds32 is not set
 # BR2_nios2 is not set
 # BR2_or1k is not set
 # BR2_powerpc is not set
@@ -122,6 +120,21 @@ BR2_cortex_a7=y
 # BR2_cortex_a73_a53 is not set
 # BR2_exynos_m1 is not set
 # BR2_xgene1 is not set
+
+#
+# armv8.1a cores
+#
+
+#
+# armv8.2a cores
+#
+# BR2_cortex_a76 is not set
+# BR2_cortex_a76_a55 is not set
+# BR2_neoverse_n1 is not set
+
+#
+# armv8.4a cores
+#
 # BR2_ARM_EABI is not set
 BR2_ARM_EABIHF=y
 # BR2_ARM_FPU_VFPV2 is not set
@@ -196,6 +209,7 @@ BR2_GLOBAL_PATCH_DIR=""
 #
 # Security Hardening Options
 #
+# BR2_PIC_PIE is not set
 
 #
 # Stack Smashing Protection needs a toolchain w/ SSP
@@ -231,12 +245,12 @@ BR2_TOOLCHAIN_BUILDROOT_LIBC="uclibc"
 # BR2_KERNEL_HEADERS_4_4 is not set
 # BR2_KERNEL_HEADERS_4_9 is not set
 # BR2_KERNEL_HEADERS_4_14 is not set
-BR2_KERNEL_HEADERS_4_19=y
-# BR2_KERNEL_HEADERS_4_20 is not set
+# BR2_KERNEL_HEADERS_4_19 is not set
+BR2_KERNEL_HEADERS_5_3=y
 # BR2_KERNEL_HEADERS_VERSION is not set
 # BR2_KERNEL_HEADERS_CUSTOM_TARBALL is not set
 # BR2_KERNEL_HEADERS_CUSTOM_GIT is not set
-BR2_DEFAULT_KERNEL_HEADERS="4.19.36"
+BR2_DEFAULT_KERNEL_HEADERS="5.3.18"
 BR2_PACKAGE_LINUX_HEADERS=y
 
 #
@@ -259,22 +273,20 @@ BR2_UCLIBC_TARGET_ARCH="arm"
 # Binutils Options
 #
 BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI=y
-# BR2_BINUTILS_VERSION_2_28_X is not set
-# BR2_BINUTILS_VERSION_2_29_X is not set
 # BR2_BINUTILS_VERSION_2_30_X is not set
-BR2_BINUTILS_VERSION_2_31_X=y
-BR2_BINUTILS_VERSION="2.31.1"
+# BR2_BINUTILS_VERSION_2_31_X is not set
+BR2_BINUTILS_VERSION_2_32_X=y
+BR2_BINUTILS_VERSION="2.32"
 BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
 
 #
 # GCC Options
 #
-# BR2_GCC_VERSION_4_9_X is not set
 # BR2_GCC_VERSION_5_X is not set
-# BR2_GCC_VERSION_6_X is not set
 # BR2_GCC_VERSION_7_X is not set
-BR2_GCC_VERSION_8_X=y
-BR2_GCC_VERSION="8.3.0"
+# BR2_GCC_VERSION_8_X is not set
+BR2_GCC_VERSION_9_X=y
+BR2_GCC_VERSION="9.2.0"
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 # BR2_TOOLCHAIN_BUILDROOT_FORTRAN is not set
@@ -287,7 +299,6 @@ BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS=y
 # Host GDB Options
 #
 # BR2_PACKAGE_HOST_GDB is not set
-BR2_PACKAGE_GDB_NEEDS_CXX11=y
 
 #
 # Toolchain Generic Options
@@ -299,6 +310,7 @@ BR2_TOOLCHAIN_HAS_THREADS=y
 BR2_TOOLCHAIN_HAS_THREADS_NPTL=y
 BR2_TOOLCHAIN_HAS_UCONTEXT=y
 BR2_TOOLCHAIN_SUPPORTS_PIE=y
+BR2_TOOLCHAIN_EXTRA_LIBS=""
 BR2_USE_MMU=y
 BR2_TARGET_OPTIMIZATION=""
 BR2_TARGET_LDFLAGS=""
@@ -343,7 +355,12 @@ BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18=y
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19=y
-BR2_TOOLCHAIN_HEADERS_AT_LEAST="4.19"
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST="5.3"
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_3=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_4=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_4_5=y
@@ -355,7 +372,8 @@ BR2_TOOLCHAIN_GCC_AT_LEAST_5=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_6=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_7=y
 BR2_TOOLCHAIN_GCC_AT_LEAST_8=y
-BR2_TOOLCHAIN_GCC_AT_LEAST="8"
+BR2_TOOLCHAIN_GCC_AT_LEAST_9=y
+BR2_TOOLCHAIN_GCC_AT_LEAST="9"
 BR2_TOOLCHAIN_HAS_MNAN_OPTION=y
 BR2_TOOLCHAIN_HAS_SYNC_1=y
 BR2_TOOLCHAIN_HAS_SYNC_2=y
@@ -377,6 +395,7 @@ BR2_TARGET_GENERIC_PASSWD_SHA256=y
 BR2_TARGET_GENERIC_PASSWD_METHOD="sha-256"
 BR2_INIT_BUSYBOX=y
 # BR2_INIT_SYSV is not set
+# BR2_INIT_OPENRC is not set
 
 #
 # systemd needs a glibc toolchain w/ SSP, headers >= 3.10
@@ -425,6 +444,7 @@ BR2_ROOTFS_OVERLAY="$(TOPDIR)/../overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/../build-ivshmem-demo.sh"
 BR2_ROOTFS_POST_FAKEROOT_SCRIPT=""
 BR2_ROOTFS_POST_IMAGE_SCRIPT=""
+BR2_ROOTFS_POST_SCRIPT_ARGS=""
 
 #
 # Kernel
@@ -438,6 +458,7 @@ BR2_PACKAGE_BUSYBOX=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES=""
 # BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
+# BR2_PACKAGE_BUSYBOX_SELINUX is not set
 # BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES is not set
 # BR2_PACKAGE_BUSYBOX_WATCHDOG is not set
 BR2_PACKAGE_SKELETON=y
@@ -490,11 +511,12 @@ BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS=y
 #
 # gstreamer 1.x needs a toolchain w/ wchar, threads
 #
+# BR2_PACKAGE_JACK1 is not set
 # BR2_PACKAGE_JACK2 is not set
 BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 
 #
-# kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.8, host gcc >= 4.6
+# kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.8
 #
 
 #
@@ -506,6 +528,7 @@ BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 #
 # mimic needs a toolchain w/ wchar
 #
+# BR2_PACKAGE_MINIMODEM is not set
 
 #
 # miraclecast needs systemd and a glibc toolchain w/ threads and wchar
@@ -515,7 +538,7 @@ BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 # BR2_PACKAGE_MOTION is not set
 
 #
-# mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.9
+# mpd needs a toolchain w/ C++, threads, wchar, gcc >= 6
 #
 # BR2_PACKAGE_MPD_MPC is not set
 # BR2_PACKAGE_MPG123 is not set
@@ -524,7 +547,7 @@ BR2_PACKAGE_KODI_ARCH_SUPPORTS=y
 # BR2_PACKAGE_MUSEPACK is not set
 
 #
-# ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 4.9
+# ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 6
 #
 
 #
@@ -568,6 +591,10 @@ BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
 #
 # BR2_PACKAGE_BROTLI is not set
 # BR2_PACKAGE_BZIP2 is not set
+
+#
+# lrzip needs a toolchain w/ wchar, threads, C++
+#
 # BR2_PACKAGE_LZ4 is not set
 # BR2_PACKAGE_LZIP is not set
 # BR2_PACKAGE_LZOP is not set
@@ -598,13 +625,14 @@ BR2_PACKAGE_CACHE_CALIBRATOR=y
 #
 # clinfo needs an OpenCL provider
 #
-# BR2_PACKAGE_DHRYSTONE is not set
-# BR2_PACKAGE_DIEHARDER is not set
-# BR2_PACKAGE_DMALLOC is not set
 
 #
-# dropwatch needs a toolchain w/ threads, wchar
+# dacapo needs OpenJDK
 #
+# BR2_PACKAGE_DHRYSTONE is not set
+# BR2_PACKAGE_DIEHARDER is not set
+# BR2_PACKAGE_DMALLOC is not set
+# BR2_PACKAGE_DROPWATCH is not set
 
 #
 # dstat needs a toolchain w/ wchar, threads, dynamic library
@@ -653,10 +681,7 @@ BR2_PACKAGE_LTRACE_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LTTNG_TOOLS is not set
 # BR2_PACKAGE_MEMSTAT is not set
 # BR2_PACKAGE_NETPERF is not set
-
-#
-# netsniff-ng needs a glibc or musl toolchain w/ threads, headers >= 3.0
-#
+# BR2_PACKAGE_NETSNIFF_NG is not set
 
 #
 # nmon needs a glibc toolchain
@@ -667,6 +692,10 @@ BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS=y
 # oprofile needs a toolchain w/ C++, wchar
 #
 # BR2_PACKAGE_PAX_UTILS is not set
+
+#
+# piglit needs glibc or musl
+#
 # BR2_PACKAGE_PV is not set
 # BR2_PACKAGE_RAMSMP is not set
 # BR2_PACKAGE_RAMSPEED is not set
@@ -714,10 +743,8 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_CXXTEST is not set
 # BR2_PACKAGE_FLEX is not set
-
-#
-# gettext needs a toolchain w/ wchar
-#
+# BR2_PACKAGE_GETTEXT is not set
+BR2_PACKAGE_PROVIDES_HOST_GETTEXT="host-gettext-tiny"
 # BR2_PACKAGE_GIT is not set
 # BR2_PACKAGE_GIT_CRYPT is not set
 # BR2_PACKAGE_GPERF is not set
@@ -764,7 +791,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 
 #
-# ecryptfs-utils needs a toolchain w/ threads, wchar, dynami library
+# ecryptfs-utils needs a toolchain w/ threads, wchar, dynamic library
 #
 
 #
@@ -854,6 +881,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # Games
 #
+# BR2_PACKAGE_ASCII_INVADERS is not set
 # BR2_PACKAGE_CHOCOLATE_DOOM is not set
 # BR2_PACKAGE_FLARE_ENGINE is not set
 # BR2_PACKAGE_GNUCHESS is not set
@@ -879,11 +907,15 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # Graphic applications
 #
+
+#
+# cog needs wpewebkit and a toolchain w/ threads
+#
 # BR2_PACKAGE_FSWEBCAM is not set
 # BR2_PACKAGE_GHOSTSCRIPT is not set
 
 #
-# glmark2 needs an OpenGL or an openGL ES and EGL backend provided by mesa3d
+# glmark2 needs an OpenGL or an openGL ES and EGL backend
 #
 # BR2_PACKAGE_GNUPLOT is not set
 
@@ -891,6 +923,7 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # jhead needs a toolchain w/ wchar
 #
 # BR2_PACKAGE_LIBVA_UTILS is not set
+BR2_PACKAGE_NETSURF_ARCH_SUPPORTS=y
 # BR2_PACKAGE_NETSURF is not set
 # BR2_PACKAGE_PNGQUANT is not set
 
@@ -898,6 +931,10 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # rrdtool needs a toolchain w/ wchar, threads
 #
 
+#
+# stellarium needs Qt5 and an OpenGL provider
+#
+
 #
 # tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 4.8, dynamic library, wchar
 #
@@ -911,9 +948,9 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 #
 # efl needs a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar
 #
+# BR2_PACKAGE_FB_TEST_APP is not set
 # BR2_PACKAGE_FBDUMP is not set
 # BR2_PACKAGE_FBGRAB is not set
-# BR2_PACKAGE_FB_TEST_APP is not set
 
 #
 # fbterm needs a toolchain w/ C++, wchar, locale
@@ -931,6 +968,10 @@ BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=y
 # BR2_PACKAGE_MESA3D is not set
 # BR2_PACKAGE_OCRAD is not set
 
+#
+# ogre needs a toolchain w/ C++, dynamic library, gcc >= 4.8, threads, wchar
+#
+
 #
 # psplash needs a toolchain w/ wchar
 #
@@ -959,7 +1000,7 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 #
 
 #
-# midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8
+# midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6
 #
 
 #
@@ -982,6 +1023,7 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 # BR2_PACKAGE_ARMBIAN_FIRMWARE is not set
 # BR2_PACKAGE_B43_FIRMWARE is not set
 # BR2_PACKAGE_LINUX_FIRMWARE is not set
+# BR2_PACKAGE_MURATA_CYW_FW is not set
 # BR2_PACKAGE_RPI_BT_FIRMWARE is not set
 # BR2_PACKAGE_RPI_FIRMWARE is not set
 # BR2_PACKAGE_RPI_WIFI_FIRMWARE is not set
@@ -1010,6 +1052,10 @@ BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
 # bcache-tools needs udev /dev management
 #
 
+#
+# brickd needs udev /dev management, a toolchain w/ threads, wchar
+#
+
 #
 # brltty needs a toolchain w/ dynamic lib, threads, wchar
 #
@@ -1074,16 +1120,14 @@ BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS=y
 # BR2_PACKAGE_IRDA_UTILS is not set
 # BR2_PACKAGE_KBD is not set
 # BR2_PACKAGE_LCDPROC is not set
+# BR2_PACKAGE_LIBUBOOTENV is not set
 # BR2_PACKAGE_LIBUIO is not set
 
-#
-# libump needs a glibc toolchain
-#
-# BR2_PACKAGE_LINUXCONSOLETOOLS is not set
-
 #
 # linux-backports needs a Linux kernel to be built
 #
+# BR2_PACKAGE_LINUX_SERIAL_TEST is not set
+# BR2_PACKAGE_LINUXCONSOLETOOLS is not set
 # BR2_PACKAGE_LIRC_TOOLS is not set
 # BR2_PACKAGE_LM_SENSORS is not set
 
@@ -1099,6 +1143,7 @@ BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS=y
 # mali-t76x needs a glibc toolchain with armhf enabled
 #
 # BR2_PACKAGE_MDADM is not set
+# BR2_PACKAGE_MDEVD is not set
 # BR2_PACKAGE_MEMTESTER is not set
 # BR2_PACKAGE_MEMTOOL is not set
 
@@ -1112,11 +1157,6 @@ BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_NVME is not set
 
-#
-# odroid-mali needs a glibc toolchain
-#
-# BR2_PACKAGE_ODROID_SCRIPTS is not set
-
 #
 # ofono needs a toolchain w/ dynamic library, wchar, threads
 #
@@ -1199,10 +1239,6 @@ BR2_PACKAGE_SETSERIAL=y
 # sunxi-cedarx needs a glibc toolchain
 #
 
-#
-# sunxi-mali needs an EABIhf glibc toolchain
-#
-
 #
 # sunxi-mali needs an EABIhf glibc toolchain
 #
@@ -1306,7 +1342,17 @@ BR2_PACKAGE_MONO_ARCH_SUPPORTS=y
 BR2_PACKAGE_NODEJS_ARCH_SUPPORTS=y
 
 #
-# nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 4.8, wchar
+# nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 4.9, wchar
+#
+BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS=y
+BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS=y
+
+#
+# openjdk needs X.Org
+#
+
+#
+# openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++
 #
 # BR2_PACKAGE_PERL is not set
 # BR2_PACKAGE_PHP is not set
@@ -1335,6 +1381,7 @@ BR2_PACKAGE_NODEJS_ARCH_SUPPORTS=y
 # BR2_PACKAGE_AUBIO is not set
 # BR2_PACKAGE_AUDIOFILE is not set
 # BR2_PACKAGE_BCG729 is not set
+# BR2_PACKAGE_CAPS is not set
 # BR2_PACKAGE_CELT051 is not set
 BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS=y
 # BR2_PACKAGE_FDK_AAC is not set
@@ -1397,6 +1444,7 @@ BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS=y
 #
 # libarchive needs a toolchain w/ wchar
 #
+# BR2_PACKAGE_LIBMSPACK is not set
 # BR2_PACKAGE_LIBSQUISH is not set
 # BR2_PACKAGE_LIBZIP is not set
 # BR2_PACKAGE_LZO is not set
@@ -1409,6 +1457,7 @@ BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS=y
 BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS=y
 # BR2_PACKAGE_ZLIB is not set
 BR2_PACKAGE_PROVIDES_HOST_ZLIB="host-libzlib"
+# BR2_PACKAGE_ZZIPLIB is not set
 
 #
 # Crypto
@@ -1440,6 +1489,8 @@ BR2_PACKAGE_LIBGPG_ERROR_SYSCFG="arm-unknown-linux-gnueabi"
 # BR2_PACKAGE_LIBMCRYPT is not set
 # BR2_PACKAGE_LIBMHASH is not set
 # BR2_PACKAGE_LIBNSS is not set
+# BR2_PACKAGE_LIBOLM is not set
+# BR2_PACKAGE_LIBP11 is not set
 # BR2_PACKAGE_LIBSCRYPT is not set
 
 #
@@ -1508,7 +1559,10 @@ BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 #
 # Graphics
 #
-# BR2_PACKAGE_ASSIMP is not set
+
+#
+# assimp needs a toolchain w/ C++, wchar
+#
 
 #
 # at-spi2-atk needs a toolchain w/ wchar, threads
@@ -1533,6 +1587,7 @@ BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 #
 # atkmm needs a toolchain w/ C++, wchar, threads, gcc >= 4.9
 #
+# BR2_PACKAGE_BAYER2RGB_NEON is not set
 # BR2_PACKAGE_BULLET is not set
 # BR2_PACKAGE_CAIRO is not set
 
@@ -1544,10 +1599,13 @@ BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=y
 # chipmunk needs an OpenGL backend
 #
 
+#
+# exempi needs a toolchain w/ C++, dynamic library, threads, wchar
+#
+
 #
 # exiv2 needs a uClibc or glibc toolchain w/ C++, wchar, dynamic library, threads
 #
-# BR2_PACKAGE_EXEMPI is not set
 # BR2_PACKAGE_FONTCONFIG is not set
 # BR2_PACKAGE_FREETYPE is not set
 # BR2_PACKAGE_GD is not set
@@ -1592,7 +1650,7 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # BR2_PACKAGE_LIBEXIF is not set
 
 #
-# libfm needs X.org and a toolchain w/ wchar, threads, C++
+# libfm needs X.org and a toolchain w/ wchar, threads, C++, gcc >= 4.8
 #
 
 #
@@ -1606,7 +1664,10 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 #
 # libfreeimage needs a toolchain w/ C++, dynamic library, wchar
 #
-# BR2_PACKAGE_LIBGEOTIFF is not set
+
+#
+# libgeotiff needs a toolchain w/ C++, gcc >= 4.7, threads, wchar
+#
 
 #
 # libglew depends on X.org and needs an OpenGL backend
@@ -1622,7 +1683,7 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # BR2_PACKAGE_LIBGTA is not set
 
 #
-# libgtk3 needs a toolchain w/ wchar, threads, C++
+# libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.8
 #
 
 #
@@ -1638,7 +1699,7 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # BR2_PACKAGE_LIBRAW is not set
 
 #
-# librsvg needs a toolchain w/ wchar, threads, C++
+# librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.8
 #
 
 #
@@ -1653,6 +1714,10 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # libvips needs a toolchain w/ wchar, threads, C++
 #
 
+#
+# libwpe needs a toolchain w/ C++, dynamic library and an OpenEGL-capable backend
+#
+
 #
 # menu-cache needs a toolchain w/ wchar, threads
 #
@@ -1667,24 +1732,39 @@ BR2_PACKAGE_JPEG_SIMD_SUPPORT=y
 # BR2_PACKAGE_OPENJPEG is not set
 
 #
-# pango needs a toolchain w/ wchar, threads, C++
+# pango needs a toolchain w/ wchar, threads, C++, gcc >= 4.8
 #
 
 #
 # pangomm needs a toolchain w/ C++, wchar, threads, gcc >= 4.9
 #
 # BR2_PACKAGE_PIXMAN is not set
-# BR2_PACKAGE_POPPLER is not set
+
+#
+# poppler needs a toolchain w/ wchar, C++, threads, dynamic library, gcc >= 5
+#
 # BR2_PACKAGE_TIFF is not set
 # BR2_PACKAGE_WAYLAND is not set
 BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS=y
-BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT=y
 
 #
-# webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8
+# webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6
 #
 # BR2_PACKAGE_WEBP is not set
 # BR2_PACKAGE_WOFF2 is not set
+
+#
+# wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and an OpenEGL-capable Wayland backend
+#
+BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS=y
+
+#
+# wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 6
+#
+
+#
+# wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend
+#
 # BR2_PACKAGE_ZBAR is not set
 # BR2_PACKAGE_ZXING_CPP is not set
 
@@ -1703,6 +1783,7 @@ BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=y
 #
 # hidapi needs udev /dev management and a toolchain w/ NPTL threads
 #
+# BR2_PACKAGE_JITTERENTROPY_LIBRARY is not set
 # BR2_PACKAGE_LCDAPI is not set
 # BR2_PACKAGE_LET_ME_CREATE is not set
 # BR2_PACKAGE_LIBAIO is not set
@@ -1797,6 +1878,7 @@ BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=y
 # BR2_PACKAGE_JQUERY is not set
 # BR2_PACKAGE_JSMIN is not set
 # BR2_PACKAGE_JSON_JAVASCRIPT is not set
+# BR2_PACKAGE_OPENLAYERS is not set
 
 #
 # JSON/XML
@@ -1849,7 +1931,6 @@ BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=y
 #
 # Logging
 #
-# BR2_PACKAGE_EVENTLOG is not set
 # BR2_PACKAGE_GLOG is not set
 # BR2_PACKAGE_LIBLOG4C_LOCALTIME is not set
 # BR2_PACKAGE_LIBLOGGING is not set
@@ -1860,18 +1941,26 @@ BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LOG4CPP is not set
 # BR2_PACKAGE_LOG4CXX is not set
 # BR2_PACKAGE_OPENTRACING_CPP is not set
+
+#
+# spdlog needs a toolchain w/ C++, threads, wchar
+#
 # BR2_PACKAGE_ZLOG is not set
 
 #
 # Multimedia
 #
 # BR2_PACKAGE_BITSTREAM is not set
+# BR2_PACKAGE_DAV1D is not set
 # BR2_PACKAGE_KVAZAAR is not set
 # BR2_PACKAGE_LIBAACS is not set
-# BR2_PACKAGE_LIBAMCODEC is not set
 # BR2_PACKAGE_LIBASS is not set
 # BR2_PACKAGE_LIBBDPLUS is not set
 # BR2_PACKAGE_LIBBLURAY is not set
+
+#
+# libcamera needs udev and a toolchain w/ C++, threads, gcc >= 5
+#
 # BR2_PACKAGE_LIBDCADEC is not set
 # BR2_PACKAGE_LIBDVBCSA is not set
 # BR2_PACKAGE_LIBDVBPSI is not set
@@ -1919,17 +2008,7 @@ BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS=y
 # BR2_PACKAGE_AGENTPP is not set
 
 #
-# alljoyn needs a toolchain w/ C++, threads, wchar and dynamic library
-#
-
-#
-# alljoyn-base needs a toolchain w/ C++, threads, wchar, dynamic library
-#
-# BR2_PACKAGE_ALLJOYN_TCL is not set
-# BR2_PACKAGE_ALLJOYN_TCL_BASE is not set
-
-#
-# azmq needs a toolchain w/ C++11, wchar and NTPL
+# azmq needs a toolchain w/ C++11, wchar and NPTL
 #
 # BR2_PACKAGE_AZURE_IOT_SDK_C is not set
 
@@ -1945,6 +2024,7 @@ BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS=y
 # BR2_PACKAGE_CZMQ is not set
 # BR2_PACKAGE_DAQ is not set
 # BR2_PACKAGE_DAVICI is not set
+# BR2_PACKAGE_ENET is not set
 # BR2_PACKAGE_FILEMQ is not set
 # BR2_PACKAGE_FLICKCURL is not set
 # BR2_PACKAGE_FREERADIUS_CLIENT is not set
@@ -1987,7 +2067,9 @@ BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS=y
 #
 # libgsasl needs a toolchain w/ wchar
 #
+# BR2_PACKAGE_LIBHTP is not set
 # BR2_PACKAGE_LIBHTTPPARSER is not set
+# BR2_PACKAGE_LIBHTTPSERVER is not set
 # BR2_PACKAGE_LIBIDN is not set
 # BR2_PACKAGE_LIBIDN2 is not set
 # BR2_PACKAGE_LIBISCSI is not set
@@ -2003,6 +2085,7 @@ BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBNATPMP is not set
 # BR2_PACKAGE_LIBNDP is not set
 # BR2_PACKAGE_LIBNET is not set
+# BR2_PACKAGE_LIBNETCONF2 is not set
 # BR2_PACKAGE_LIBNETFILTER_ACCT is not set
 # BR2_PACKAGE_LIBNETFILTER_CONNTRACK is not set
 # BR2_PACKAGE_LIBNETFILTER_CTHELPER is not set
@@ -2036,7 +2119,7 @@ BR2_PACKAGE_LIBTIRPC=y
 # BR2_PACKAGE_LIBTORRENT is not set
 
 #
-# libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.8
+# libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.9
 #
 # BR2_PACKAGE_LIBUPNP is not set
 # BR2_PACKAGE_LIBUPNP18 is not set
@@ -2045,6 +2128,7 @@ BR2_PACKAGE_LIBTIRPC=y
 # BR2_PACKAGE_LIBVNCSERVER is not set
 # BR2_PACKAGE_LIBWEBSOCK is not set
 # BR2_PACKAGE_LIBWEBSOCKETS is not set
+# BR2_PACKAGE_LIBYANG is not set
 # BR2_PACKAGE_LKSCTP_TOOLS is not set
 # BR2_PACKAGE_MONGOOSE is not set
 # BR2_PACKAGE_NANOMSG is not set
@@ -2074,17 +2158,20 @@ BR2_PACKAGE_LIBTIRPC=y
 #
 
 #
-# openzwave needs udev and a toolchain w/ C++, threads, wchar
+# openzwave needs a toolchain w/ C++, dynamic library, NPTL, wchar
 #
 # BR2_PACKAGE_ORTP is not set
 # BR2_PACKAGE_PAHO_MQTT_C is not set
+# BR2_PACKAGE_PAHO_MQTT_CPP is not set
 # BR2_PACKAGE_QDECODER is not set
 # BR2_PACKAGE_QPID_PROTON is not set
 # BR2_PACKAGE_RABBITMQ_C is not set
+# BR2_PACKAGE_RESTCLIENT_CPP is not set
 # BR2_PACKAGE_RTMPDUMP is not set
 # BR2_PACKAGE_SLIRP is not set
 # BR2_PACKAGE_SNMPPP is not set
 # BR2_PACKAGE_SOFIA_SIP is not set
+# BR2_PACKAGE_SYSREPO is not set
 
 #
 # thrift needs a toolchain w/ C++, wchar, threads
@@ -2110,10 +2197,11 @@ BR2_PACKAGE_LIBTIRPC=y
 #
 # boost needs a toolchain w/ C++, threads, wchar
 #
+# BR2_PACKAGE_C_CAPNPROTO is not set
 # BR2_PACKAGE_CAPNPROTO is not set
 
 #
-# clang needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library
+# clang needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library
 #
 # BR2_PACKAGE_CLAPACK is not set
 BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS=y
@@ -2144,6 +2232,7 @@ BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS=y
 # gconf needs a toolchain w/ threads, wchar, dynamic library
 #
 # BR2_PACKAGE_GFLAGS is not set
+# BR2_PACKAGE_GLI is not set
 
 #
 # glibmm needs a toolchain w/ C++, wchar, threads, gcc >= 4.9
@@ -2164,6 +2253,7 @@ BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBARGTABLE2 is not set
 BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LIBATOMIC_OPS is not set
+# BR2_PACKAGE_LIBAVL is not set
 # BR2_PACKAGE_LIBB64 is not set
 BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS=y
 
@@ -2244,7 +2334,7 @@ BR2_PACKAGE_LLVM_ARCH_SUPPORTS=y
 BR2_PACKAGE_LLVM_TARGET_ARCH="ARM"
 
 #
-# llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library
+# llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library
 #
 
 #
@@ -2256,6 +2346,7 @@ BR2_PACKAGE_LLVM_TARGET_ARCH="ARM"
 # BR2_PACKAGE_MPIR is not set
 # BR2_PACKAGE_MSGPACK is not set
 # BR2_PACKAGE_MTDEV2TUIO is not set
+# BR2_PACKAGE_MUSL_FTS is not set
 BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET="ARMV7"
 BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS=y
 # BR2_PACKAGE_OPENBLAS is not set
@@ -2278,19 +2369,14 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 # BR2_PACKAGE_SKALIBS is not set
 # BR2_PACKAGE_SPHINXBASE is not set
 # BR2_PACKAGE_TINYCBOR is not set
+# BR2_PACKAGE_UVW is not set
 # BR2_PACKAGE_XAPIAN is not set
 
 #
 # Security
 #
-
-#
-# libselinux needs a glibc toolchain w/ threads, dynamic library
-#
-
-#
-# libsemanage needs a glibc toolchain w/ threads, dynamic library
-#
+# BR2_PACKAGE_LIBSELINUX is not set
+# BR2_PACKAGE_LIBSEMANAGE is not set
 # BR2_PACKAGE_LIBSEPOL is not set
 # BR2_PACKAGE_SAFECLIB is not set
 
@@ -2311,7 +2397,11 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 #
 
 #
-# icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.8, host gcc >= 4.8
+# fstrcmp needs a toolchain w/ wchar
+#
+
+#
+# icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.8
 #
 # BR2_PACKAGE_LIBCLI is not set
 
@@ -2332,13 +2422,14 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 #
 # newt needs a toolchain w/ wchar, dynamic library
 #
+# BR2_PACKAGE_ONIGURUMA is not set
 # BR2_PACKAGE_PCRE is not set
 # BR2_PACKAGE_PCRE2 is not set
 # BR2_PACKAGE_POPT is not set
 # BR2_PACKAGE_READLINE is not set
 # BR2_PACKAGE_SLANG is not set
 # BR2_PACKAGE_TCLAP is not set
-# BR2_PACKAGE_USTR is not set
+# BR2_PACKAGE_UTF8PROC is not set
 
 #
 # Mail
@@ -2359,11 +2450,17 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_AESPIPE is not set
 # BR2_PACKAGE_BC is not set
+BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS=y
+
+#
+# bitcoin needs a toolchain w/ C++, wchar
+#
 
 #
 # clamav needs a toolchain w/ C++, threads, wchar
 #
 # BR2_PACKAGE_COLLECTD is not set
+# BR2_PACKAGE_COLLECTL is not set
 
 #
 # domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 4.8, NPTL, wchar, dynamic library
@@ -2390,7 +2487,10 @@ BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=y
 # BR2_PACKAGE_LINUX_SYSCALL_SUPPORT is not set
 # BR2_PACKAGE_MCRYPT is not set
 # BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO is not set
-# BR2_PACKAGE_PROJ is not set
+
+#
+# proj needs a toolchain w/ C++, gcc >= 4.7, threads, wchar
+#
 BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 
 #
@@ -2401,6 +2501,7 @@ BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 #
 # shared-mime-info needs a toolchain w/ wchar, threads
 #
+# BR2_PACKAGE_SUNWAIT is not set
 
 #
 # taskd needs a toolchain w/ C++, wchar, dynamic library
@@ -2480,6 +2581,7 @@ BR2_PACKAGE_DROPBEAR_SMALL=y
 # BR2_PACKAGE_DROPBEAR_WTMP is not set
 # BR2_PACKAGE_DROPBEAR_LASTLOG is not set
 # BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO is not set
+BR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE=""
 # BR2_PACKAGE_EBTABLES is not set
 
 #
@@ -2521,6 +2623,7 @@ BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_IBRDTN_TOOLS is not set
 # BR2_PACKAGE_IBRDTND is not set
+# BR2_PACKAGE_IFMETRIC is not set
 # BR2_PACKAGE_IFTOP is not set
 BR2_PACKAGE_IFUPDOWN_SCRIPTS=y
 
@@ -2595,7 +2698,7 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_MONKEY is not set
 
 #
-# mosh needs a toolchain w/ C++, threads, dynamic library, wchar, host and target gcc >= 4.8
+# mosh needs a toolchain w/ C++, threads, dynamic library, wchar, gcc >= 4.8
 #
 # BR2_PACKAGE_MOSQUITTO is not set
 # BR2_PACKAGE_MROUTED is not set
@@ -2612,7 +2715,7 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_NETSTAT_NAT is not set
 
 #
-# NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library
+# NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library, wchar, threads
 #
 # BR2_PACKAGE_NFACCT is not set
 
@@ -2702,10 +2805,15 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_SPAWN_FCGI is not set
 # BR2_PACKAGE_SPICE_PROTOCOL is not set
 # BR2_PACKAGE_SQUID is not set
+# BR2_PACKAGE_SSHGUARD is not set
 # BR2_PACKAGE_SSHPASS is not set
 # BR2_PACKAGE_SSLH is not set
 # BR2_PACKAGE_STRONGSWAN is not set
 # BR2_PACKAGE_STUNNEL is not set
+
+#
+# suricata needs a toolchain w/ wchar, threads
+#
 # BR2_PACKAGE_TCPDUMP is not set
 # BR2_PACKAGE_TCPING is not set
 # BR2_PACKAGE_TCPREPLAY is not set
@@ -2717,7 +2825,12 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_TRANSMISSION is not set
 # BR2_PACKAGE_TUNCTL is not set
 # BR2_PACKAGE_TVHEADEND is not set
+# BR2_PACKAGE_UACME is not set
 # BR2_PACKAGE_UDPCAST is not set
+
+#
+# uftp needs a toolchain w/ threads, wchar
+#
 # BR2_PACKAGE_UHTTPD is not set
 # BR2_PACKAGE_ULOGD is not set
 # BR2_PACKAGE_USHARE is not set
@@ -2728,7 +2841,7 @@ BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=y
 # BR2_PACKAGE_VDE2 is not set
 
 #
-# vdr needs a glibc or uClibc toolchain w/ C++, dynamic library, NPTL, wchar, headers >= 3.9
+# vdr needs a glibc toolchain w/ C++, dynamic library, NPTL, wchar, headers >= 3.9
 #
 
 #
@@ -2819,22 +2932,16 @@ BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS=y
 #
 # Security
 #
-
-#
-# checkpolicy needs a glibc toolchain w/ threads, dynamic library
-#
+# BR2_PACKAGE_CHECKPOLICY is not set
+# BR2_PACKAGE_IMA_EVM_UTILS is not set
+# BR2_PACKAGE_OPTEE_BENCHMARK is not set
+# BR2_PACKAGE_OPTEE_CLIENT is not set
 
 #
 # paxtest needs a glibc toolchain
 #
-
-#
-# policycoreutils needs a glibc toolchain w/ threads, dynamic library
-#
-
-#
-# refpolicy needs a glibc toolchain w/ threads, dynamic library
-#
+# BR2_PACKAGE_POLICYCOREUTILS is not set
+# BR2_PACKAGE_REFPOLICY is not set
 
 #
 # restorecond needs a toolchain w/ wchar, threads, dynamic library
@@ -2846,7 +2953,7 @@ BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS=y
 # BR2_PACKAGE_SEMODULE_UTILS is not set
 
 #
-# setools needs a glibc toolchain w/ threads, C++, wchar, dynamic library
+# setools needs a toolchain w/ threads, C++, wchar, dynamic library
 #
 
 #
@@ -2892,6 +2999,7 @@ BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS=y
 #
 # BR2_PACKAGE_XMLSTARLET is not set
 # BR2_PACKAGE_XXHASH is not set
+# BR2_PACKAGE_YTREE is not set
 
 #
 # System tools
@@ -2905,7 +3013,7 @@ BR2_PACKAGE_AUDIT_ARCH_SUPPORTS=y
 # BR2_PACKAGE_CGROUPFS_MOUNT is not set
 
 #
-# circus needs Python and a toolchain w/ C++, threads
+# circus needs Python 3 and a toolchain w/ C++, threads
 #
 # BR2_PACKAGE_CPULOAD is not set
 # BR2_PACKAGE_DAEMON is not set
@@ -2914,7 +3022,7 @@ BR2_PACKAGE_AUDIT_ARCH_SUPPORTS=y
 # BR2_PACKAGE_DOCKER_CLI is not set
 
 #
-# docker-compose needs a toolchain w/ wchar, threads, dynamic library
+# docker-compose needs a toolchain w/ C++, wchar, threads, dynamic library
 #
 
 #
@@ -2955,10 +3063,13 @@ BR2_PACKAGE_INITSCRIPTS=y
 #
 # libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar
 #
-# BR2_PACKAGE_LXC is not set
 # BR2_PACKAGE_MENDER is not set
 # BR2_PACKAGE_MONIT is not set
 # BR2_PACKAGE_NCDU is not set
+
+#
+# netifrc needs openrc as init system
+#
 # BR2_PACKAGE_NUT is not set
 
 #
@@ -2989,7 +3100,7 @@ BR2_PACKAGE_INITSCRIPTS=y
 # BR2_PACKAGE_SMACK is not set
 
 #
-# supervisor needs the python interpreter
+# supervisor needs a python interpreter
 #
 # BR2_PACKAGE_SWUPDATE is not set
 BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS=y
@@ -3000,6 +3111,7 @@ BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS=y
 # tpm2-abrmd needs a toolchain w/ dynamic library, wchar, threads
 #
 # BR2_PACKAGE_TPM2_TOOLS is not set
+# BR2_PACKAGE_TPM2_TOTP is not set
 
 #
 # unscd needs a glibc toolchain
@@ -3018,6 +3130,7 @@ BR2_PACKAGE_XVISOR_ARCH_SUPPORTS=y
 #
 # mc needs a toolchain w/ threads, wchar
 #
+# BR2_PACKAGE_MOST is not set
 
 #
 # nano needs a toolchain w/ wchar
@@ -3065,8 +3178,8 @@ BR2_TARGET_GRUB2_ARCH_SUPPORTS=y
 # grub2 needs a toolchain w/ wchar
 #
 # BR2_TARGET_MXS_BOOTLETS is not set
+# BR2_TARGET_OPTEE_OS is not set
 # BR2_TARGET_S500_BOOTLOADER is not set
-# BR2_TARGET_TS4800_MBRBOOT is not set
 # BR2_TARGET_UBOOT is not set
 
 #
@@ -3082,6 +3195,7 @@ BR2_TARGET_GRUB2_ARCH_SUPPORTS=y
 # BR2_PACKAGE_HOST_CMAKE is not set
 # BR2_PACKAGE_HOST_CRAMFS is not set
 # BR2_PACKAGE_HOST_CRYPTSETUP is not set
+# BR2_PACKAGE_HOST_DBUS_PYTHON is not set
 # BR2_PACKAGE_HOST_DFU_UTIL is not set
 # BR2_PACKAGE_HOST_DOS2UNIX is not set
 # BR2_PACKAGE_HOST_DOSFSTOOLS is not set
@@ -3090,22 +3204,28 @@ BR2_TARGET_GRUB2_ARCH_SUPPORTS=y
 # BR2_PACKAGE_HOST_E2TOOLS is not set
 # BR2_PACKAGE_HOST_F2FS_TOOLS is not set
 # BR2_PACKAGE_HOST_FAKETIME is not set
+# BR2_PACKAGE_HOST_FATCAT is not set
 # BR2_PACKAGE_HOST_FWUP is not set
 # BR2_PACKAGE_HOST_GENEXT2FS is not set
 # BR2_PACKAGE_HOST_GENIMAGE is not set
 # BR2_PACKAGE_HOST_GENPART is not set
 # BR2_PACKAGE_HOST_GNUPG is not set
-BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS=y
-BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS=y
+BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS=y
+BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS=y
+BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS=y
 # BR2_PACKAGE_HOST_GPTFDISK is not set
+# BR2_PACKAGE_HOST_IMAGEMAGICK is not set
 # BR2_PACKAGE_HOST_IMX_MKIMAGE is not set
 # BR2_PACKAGE_HOST_IMX_USB_LOADER is not set
 # BR2_PACKAGE_HOST_JQ is not set
 # BR2_PACKAGE_HOST_JSMIN is not set
+# BR2_PACKAGE_HOST_LIBP11 is not set
+# BR2_PACKAGE_HOST_LLD is not set
 # BR2_PACKAGE_HOST_LPC3250LOADER is not set
 # BR2_PACKAGE_HOST_LTTNG_BABELTRACE is not set
+# BR2_PACKAGE_HOST_MENDER_ARTIFACT is not set
 # BR2_PACKAGE_HOST_MFGTOOLS is not set
 # BR2_PACKAGE_HOST_MKPASSWD is not set
 # BR2_PACKAGE_HOST_MTD is not set
@@ -3119,10 +3239,12 @@ BR2_PACKAGE_HOST_PATCHELF=y
 # BR2_PACKAGE_HOST_PKGCONF is not set
 # BR2_PACKAGE_HOST_PRU_SOFTWARE_SUPPORT is not set
 # BR2_PACKAGE_HOST_PWGEN is not set
+# BR2_PACKAGE_HOST_PYTHON is not set
 # BR2_PACKAGE_HOST_PYTHON_CYTHON is not set
 # BR2_PACKAGE_HOST_PYTHON_LXML is not set
 # BR2_PACKAGE_HOST_PYTHON_SIX is not set
 # BR2_PACKAGE_HOST_PYTHON_XLRD is not set
+# BR2_PACKAGE_HOST_PYTHON3 is not set
 BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS=y
 BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS=y
@@ -3155,9 +3277,68 @@ BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS=y
 #
 
 #
-# Legacy options removed in 2019.02
+# Legacy options removed in 2019.11
+#
+# BR2_PACKAGE_OPENVMTOOLS_PROCPS is not set
+# BR2_PACKAGE_ALLJOYN is not set
+# BR2_PACKAGE_ALLJOYN_BASE is not set
+# BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL is not set
+# BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION is not set
+# BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING is not set
+# BR2_PACKAGE_ALLJOYN_TCL_BASE is not set
+# BR2_PACKAGE_ALLJOYN_TCL is not set
+BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS=""
+# BR2_PACKAGE_PYTHON_PYSNMP_APPS is not set
+# BR2_KERNEL_HEADERS_5_2 is not set
+# BR2_TARGET_RISCV_PK is not set
+# BR2_PACKAGE_SQLITE_STAT3 is not set
+# BR2_KERNEL_HEADERS_5_1 is not set
+# BR2_PACKAGE_DEVMEM2 is not set
+# BR2_PACKAGE_USTR is not set
+# BR2_PACKAGE_KODI_SCREENSAVER_PLANESTATE is not set
+# BR2_PACKAGE_KODI_VISUALISATION_WAVEFORHUE is not set
+# BR2_PACKAGE_KODI_AUDIODECODER_OPUS is not set
+# BR2_PACKAGE_MESA3D_OSMESA is not set
+# BR2_PACKAGE_HOSTAPD_DRIVER_RTW is not set
+# BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW is not set
+# BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD is not set
+
+#
+# Legacy options removed in 2019.08
+#
+# BR2_TARGET_TS4800_MBRBOOT is not set
+# BR2_PACKAGE_LIBAMCODEC is not set
+# BR2_PACKAGE_ODROID_SCRIPTS is not set
+# BR2_PACKAGE_ODROID_MALI is not set
+# BR2_PACKAGE_KODI_PLATFORM_AML is not set
+# BR2_GCC_VERSION_6_X is not set
+# BR2_GCC_VERSION_4_9_X is not set
+# BR2_GDB_VERSION_7_12 is not set
+# BR2_PACKAGE_XAPP_MKFONTDIR is not set
+# BR2_GDB_VERSION_8_0 is not set
+# BR2_KERNEL_HEADERS_4_20 is not set
+# BR2_KERNEL_HEADERS_5_0 is not set
+
 #
+# Legacy options removed in 2019.05
+#
+# BR2_CSKY_DSP is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO is not set
+# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD is not set
+# BR2_PACKAGE_LUNIT is not set
+# BR2_PACKAGE_FFMPEG_FFSERVER is not set
+# BR2_PACKAGE_LIBUMP is not set
+# BR2_PACKAGE_SUNXI_MALI is not set
+# BR2_BINUTILS_VERSION_2_29_X is not set
+# BR2_BINUTILS_VERSION_2_28_X is not set
 # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK is not set
+
+#
+# Legacy options removed in 2019.02
+#
 # BR2_PACKAGE_QT is not set
 # BR2_PACKAGE_QTUIO is not set
 # BR2_PACKAGE_PINENTRY_QT4 is not set
@@ -3365,7 +3546,6 @@ BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES=0
 # BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK is not set
 # BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL is not set
 # BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD is not set
-# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC is not set
 # BR2_STRIP_none is not set
 # BR2_PACKAGE_BEECRYPT_CPP is not set
 # BR2_PACKAGE_SPICE_CLIENT is not set
diff --git a/recipes-core/non-root-initramfs/non-root-initramfs_2019.02.2.bb b/recipes-core/non-root-initramfs/non-root-initramfs_2019.11.1.bb
similarity index 87%
rename from recipes-core/non-root-initramfs/non-root-initramfs_2019.02.2.bb
rename to recipes-core/non-root-initramfs/non-root-initramfs_2019.11.1.bb
index 17d866f..a250d9e 100644
--- a/recipes-core/non-root-initramfs/non-root-initramfs_2019.02.2.bb
+++ b/recipes-core/non-root-initramfs/non-root-initramfs_2019.11.1.bb
@@ -1,7 +1,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2018-2019
+# Copyright (c) Siemens AG, 2018-2020
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -20,7 +20,7 @@ SRC_URI = " \
     file://${DISTRO_ARCH}-config \
     file://build-ivshmem-demo.sh \
     file://overlay/"
-SRC_URI[sha256sum] = "0250b4e11d4aeba7cb5ac956b56e3069d3136c1e7fd741a658b0ea96c6b35181"
+SRC_URI[sha256sum] = "05247d495b4bad032e33190ba7a1843f607c7957a19c4b8aa42cfc234795f36c"
 
 SRC_REV_IVSHMEM_DEMO = "87cc49f944ed756e930b70991726ca5595a30717"
 SRC_URI[ivshmem-demo.sha256sum] = "e7cc426bb009c3c7d99c042ae45760494d8454647fbb042359655ea37ad1dcfc"
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/be9291fadff18788a40839dff549fb9d8f35c7c1.1580893011.git.jan.kiszka%40siemens.com.
