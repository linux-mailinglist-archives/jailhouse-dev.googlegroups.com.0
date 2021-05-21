Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4M2T2CQMGQES7B3IGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8711238C511
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:37:38 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id r15-20020a2eb60f0000b02900eddb317c52sf8622070ljn.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:37:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593458; cv=pass;
        d=google.com; s=arc-20160816;
        b=xd2LUSHNCdafSYTp4rWtHHjiZ3x8yaUIdQIV5wA0YwP7jXLRrKU+HNtmjT8IWtMw96
         fdoxDdsQ7PrbVRxWSbox5nub44vtyfPnc5wBABCHkg3LCyK5LqfUS8tIlaXsTj1fwhkx
         072Utb79rr4OGE9qFy+XiHad2HAYDb0O0jtTKeU3ly8hv5kAkWVkZEKDK5a4LEGfVqCt
         adfm4f+J9VObX8ucXakyYdrTDA59L8juCHV4TkpZ3ErfwSTBcrgNR5XwhXQeduTxqN1D
         NKtChTMppJCDVicxv+TgPdViPhX8bN1javQDJjXsqrZBsflAbvuW0BbO4f+Kn87g4hHp
         6Wkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=04HM/36Kjg1FPOM9Kd6JbaFdkd1nTH+Mwr+sJzbNAI8=;
        b=NXLLO8m3QWfvN6faFCcUno9YiVCqUEpErFSTY/Cq8ByW2zvVAtqZ3gXCxSir5qT9dt
         2v/0pIVp54ecX6+nTPsv8gHemZJ6e0jj9Rz9dCGQJ1uRcUSyCSWYp0l8jWJeE/JbnfvP
         quqTCTRDFXhmpIJ2qIbdCZtoHMO9lWlHnI3obIUo3pj0eLXAAfis4fYtCygMXvtf9upz
         VjgT/5VVrsC0XV8DyIrX7Cr3wkcYF36i30yXhHmYZieA/pEAAYEfi09/sKduoVoD22MB
         ZsKPTK2Z5Y1LPNGCAIYlwdh9z601Vd5ErI/c9CaEdYx8+UB+lV9tt5rKGB0Bp9k6klMV
         qDEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=04HM/36Kjg1FPOM9Kd6JbaFdkd1nTH+Mwr+sJzbNAI8=;
        b=rZq6iClbbq4dUiOtM+Q09/WkgBW8pezBJP+lvfnQtxNPDgspm4N+ATwGvO0Ye8ShsV
         NM2uTn7g5obv+jOoZv7SNk2dM/zdXKyIobklSqCpxuPNsSQL9DJCX/3C3+R9g/yBGSPc
         1mr/eAQ3dcCS56DU7aU7DSie0BjcyjH35bTfO39n4aY7ME2FyGVwgWipIMqADNk7PQDG
         bd0uqccabx+AiPH3W2F496LqhuA0/bCSPqUq/xqCc9ktKwsXTiqwYVn/uwWj60i+g4IA
         Nat+rGoRnLWFJF/agl8OU90G1sV2h+Uteo1inxy2nR05WFvkOqYI02boHJh9hqtKXzEZ
         VY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=04HM/36Kjg1FPOM9Kd6JbaFdkd1nTH+Mwr+sJzbNAI8=;
        b=EypX82ijNqaOgRad5/0qiXadrrTtrzGECIj32fuAy+2+O976VQWoxMQH3EzU5tAF31
         mF0F0JBRqs+UsIGRt36H1B7VyBHJRBzM4BSxfBEVauJOKEsPdG/MUjGHByYkk3adxlQz
         gX2lSorDxxVIu5O29IIGrvWEngRT5eEPTvIP+TBGvoY2bKXTCV7/lMufpO5dbIcWtUPr
         8sD8Hwg0lQ4EJkXbiUSO5iJMEM/9+i806/OIx4xKPK9FeMyvXMxBogDAG4fHPFlzfsWj
         7jSGeRNr2DJv/25XdfPDxWj2JtSEJbMC19R47//E1qHQKoeoon3w8W6rWCy+ndYUsolO
         6zPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531QkqWTfcR8lzzQwMOoNYJ6/7LdnZFPxDX3CNbQpsgkKw5HOkDp
	cf2pBLy2kidAo9hC2YDyfXU=
X-Google-Smtp-Source: ABdhPJz/tEDP5JGU8zozDRwZIwmFupu9yk+MwXBbU1U6DkG8RR1kKEPWxm7eo2RFgACUBXDAC4TfGw==
X-Received: by 2002:a05:651c:104e:: with SMTP id x14mr6453561ljm.345.1621593458079;
        Fri, 21 May 2021 03:37:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6c2:: with SMTP id u2ls324303lff.3.gmail; Fri, 21
 May 2021 03:37:37 -0700 (PDT)
X-Received: by 2002:a19:550a:: with SMTP id n10mr1846529lfe.546.1621593457062;
        Fri, 21 May 2021 03:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593457; cv=none;
        d=google.com; s=arc-20160816;
        b=y4vSdMUrkCGVyG4GV6DOaA687i+oXq2+W9sKfhTgW8uyroRaBAahzg4+/JDz2ZY9LK
         Xjuoj4LXspX+IjvOAfnaFszjrJ/dOh5pNaFSrnKZetVrloe6N/JiyajOcHd7k+es6ZXN
         p8PMxnGBJmy+yEuJq23MbqEIgdU0rDsQnsuI/NsACshzrQJFgMtir76MgzNCDLSr/bkX
         GygiUvpCZ+s65Ze74xkjxTmeXwBmMuO5dxIgiYrdtnbk32rw8C+4p4Mtl5qlwkvHQH22
         KeNLp7zeSbytYNCHN5/knv1ty0q7wXQnws/cMA1qVZw/ssz8fpWKN4kx78wg1p4QOcaN
         EfKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=agpinA9jMusKw0FrxjVizUAc13uKBTI54+SsigrSIGI=;
        b=bghbXqZy7bGzIGoBA3KEjZKEFPdw4WxjmIrNTgMZUpnMv/wVBfDYApmc14Lz9Jqh4K
         rL6rQTzdY3F718zq9dG5wCokvGG2qpGfkOH5T9x/b6YBZhJIeqWmgOZTdUeu7sGMf42G
         BJeeM8pzzbNJUlj/qzMabkIqJ5CgleS9vYmtIuaVezUAq5OCqdb1QDzDJKK6rS5NRAUx
         HEpbpPAOoh76zqI/Uij9hcEa/nwijZZfV/TsEZd/wgHW8OXe3w0BPgeIdduqJelNHGjM
         FQ1R4kptJiKDjv0dxQvLdvOUj07FAtrUHT7tsj+q81rBtc5S3qokW+t9ZzpV91ghsJPD
         JFHA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id o11si216429lfk.12.2021.05.21.03.37.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:37:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAbapu002691
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:36 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcA032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:36 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 05/22] linux-jailhouse: Generalize armhf config
Date: Fri, 21 May 2021 12:37:17 +0200
Message-Id: <016fbc8a4f41f8a47bca12bce5e5cc15a1cee2c7.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
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

Add support for a qemu-arm target to the so far orangepi-zero only
kernel config. This requires lifting the number of CPUs to 8, enabling
vexpress in order to get pl011 UART and turning on a couple of virtio
drivers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...pi-zero_defconfig_5.4 => armhf_defconfig_5.4} | 16 ++++++++++++----
 recipes-kernel/linux/linux-jailhouse_5.4.inc     |  1 -
 2 files changed, 12 insertions(+), 5 deletions(-)
 rename recipes-kernel/linux/files/{orangepi-zero_defconfig_5.4 => armhf_defconfig_5.4} (96%)

diff --git a/recipes-kernel/linux/files/orangepi-zero_defconfig_5.4 b/recipes-kernel/linux/files/armhf_defconfig_5.4
similarity index 96%
rename from recipes-kernel/linux/files/orangepi-zero_defconfig_5.4
rename to recipes-kernel/linux/files/armhf_defconfig_5.4
index 4895867..fafdebb 100644
--- a/recipes-kernel/linux/files/orangepi-zero_defconfig_5.4
+++ b/recipes-kernel/linux/files/armhf_defconfig_5.4
@@ -30,8 +30,8 @@ CONFIG_ARCH_SUNXI=y
 # CONFIG_MACH_SUN6I is not set
 # CONFIG_MACH_SUN7I is not set
 # CONFIG_MACH_SUN9I is not set
+CONFIG_ARCH_VEXPRESS=y
 CONFIG_ARM_ERRATA_430973=y
-CONFIG_ARM_ERRATA_720789=y
 CONFIG_ARM_ERRATA_754322=y
 CONFIG_ARM_ERRATA_754327=y
 CONFIG_ARM_ERRATA_764369=y
@@ -45,6 +45,7 @@ CONFIG_ARM_ERRATA_852421=y
 CONFIG_ARM_ERRATA_852423=y
 CONFIG_SMP=y
 CONFIG_HAVE_ARM_ARCH_TIMER=y
+CONFIG_NR_CPUS=8
 CONFIG_ARM_PSCI=y
 # CONFIG_ARM_MODULE_PLTS is not set
 # CONFIG_ATAGS is not set
@@ -70,13 +71,17 @@ CONFIG_CFG80211_DEBUGFS=y
 CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=y
 CONFIG_MAC80211_LEDS=y
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
 CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCI_HOST_GENERIC=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_OF_OVERLAY=y
+CONFIG_VIRTIO_BLK=y
 CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
 # CONFIG_NET_VENDOR_3COM is not set
 # CONFIG_NET_VENDOR_ADAPTEC is not set
 # CONFIG_NET_VENDOR_AGERE is not set
@@ -150,6 +155,9 @@ CONFIG_SERIAL_8250_NR_UARTS=8
 CONFIG_SERIAL_8250_RUNTIME_UARTS=8
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
@@ -157,15 +165,12 @@ CONFIG_I2C_MV64XXX=y
 CONFIG_SPI=y
 CONFIG_SPI_SUN6I=y
 CONFIG_GPIO_SYSFS=y
-CONFIG_POWER_RESET=y
-CONFIG_POWER_SUPPLY=y
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_SUNXI_WATCHDOG=y
 CONFIG_MFD_SUN4I_GPADC=m
 CONFIG_MFD_AXP20X_I2C=y
 CONFIG_REGULATOR=y
-CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_GPIO=y
 # CONFIG_HID_A4TECH is not set
 # CONFIG_HID_APPLE is not set
@@ -201,6 +206,9 @@ CONFIG_UIO=y
 CONFIG_UIO_IVSHMEM=y
 CONFIG_VIRT_DRIVERS=y
 CONFIG_JAILHOUSE_DBGCON=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_MMIO=y
 # CONFIG_SUN8I_A23_CCU is not set
 # CONFIG_SUN8I_A33_CCU is not set
 # CONFIG_SUN8I_A83T_CCU is not set
diff --git a/recipes-kernel/linux/linux-jailhouse_5.4.inc b/recipes-kernel/linux/linux-jailhouse_5.4.inc
index 5b4bb19..c703839 100644
--- a/recipes-kernel/linux/linux-jailhouse_5.4.inc
+++ b/recipes-kernel/linux/linux-jailhouse_5.4.inc
@@ -12,7 +12,6 @@
 require recipes-kernel/linux/linux-custom.inc
 
 KERNEL_DEFCONFIG = "${DISTRO_ARCH}_defconfig_5.4"
-KERNEL_DEFCONFIG_orangepi-zero = "orangepi-zero_defconfig_5.4"
 KERNEL_DEFCONFIG_rpi4 = "rpi4_defconfig_5.4"
 
 SRC_URI += " \
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/016fbc8a4f41f8a47bca12bce5e5cc15a1cee2c7.1621593454.git.jan.kiszka%40siemens.com.
