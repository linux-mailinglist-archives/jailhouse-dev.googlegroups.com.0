Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWHB66BQMGQEFDW26XY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEB6364CC2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:06:32 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id s7-20020adfc5470000b0290106eef17cbdsf6233177wrf.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866392; cv=pass;
        d=google.com; s=arc-20160816;
        b=W1MsHOxJ+PhTMSXEB56dcfeKezX6tBWbAPmz7qy6fM2vCaH5lXdyNwjAstQsMNlChe
         +hCtVbxkIFoLmIX20sIb9Z4MXLFxRBlCmVq9+aNBFbWodK3k/7R968g4nA55abpBQVrF
         lEgY1IQ85AmdaA1H3w4K8BzPXT+qf49237jIm+Any615v0igONHLFV/eB7YBvCLyNgyK
         fvPG6M6Kpzpl68Wds/hkOWKvEN8dvGEizZ1dmW+jgT70Kq0zcyRGsbK7pSofsaoKIBEb
         u9PhoNeF5+BbRc2S3bhZCsE7f83wjjQ3MFK/4os6TCe6iHobqZyGMHb+eNAsFb9DHtJL
         yGzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=/sJXiM49NEzD7cAHb/DjIdxW09sa7z9Uv/YxvqFnnp4=;
        b=ehcRAq/8dRplh865DLoykhPIy6JcSF+jTyR5gww22mb2l6Su09dwxn6LhYqtQBOQKp
         8kB/AnaZDyGjgbf9v+mfnBCSvEspdRZmCCuVIOCr68SngpzFjUjLCTNJ4NO6FWa9HpnG
         RWQ+fFxA3K5aHllI6yH5WefZ/+vI4wq2JOf2EzU/+SNN/lH7G623BKsnVw2pdTqLO9Dg
         BLxekkDY/TuC06sjXANO05yNp1OkoYC+QGfzTFsjAa3tNUrgVEiz43nTUxFSWivxvWZm
         ox5r/eTjqUjzezW06frJJoFKj5afDX2xftrZGhzjLEnYpjh0P8OZSRO49D0KruK/DkFi
         lLCw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/sJXiM49NEzD7cAHb/DjIdxW09sa7z9Uv/YxvqFnnp4=;
        b=nNz5lBeIPda5CCZSbdfXQEa6R7bRa8kkmVaGR6UG6aaHM/8bJ07lQFobXCuGe+kacp
         lLOHildtr0l8p3G4pJrrTCB2a6dFU2ki5b64aw98Za4WGEtlHnZrG6Eiy+saFjZ9YJlr
         8+uJx5yu0E/8CkufcBoo+QLEB4lHtX1Vi4Ad1jascHOFbxmDZvuoJA8vOMxYG18ucOai
         CKKnrbXc1beZh5vQziU1BxNGMcYc9iP9dwfdQxH6rRwfZoKadOFEc6cvaRWbmFczm5j9
         SeaIdb0PZpNA8qLMai2BlJjSFZt1LVqZq+wnUbYiLQAOmLFBI1nm1QrFtLGyueSTnsp3
         Najg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/sJXiM49NEzD7cAHb/DjIdxW09sa7z9Uv/YxvqFnnp4=;
        b=S/gs98ZtM9i0tqI7YTujkqNNiXXE26ijfBQR+Otaj+toK3fNRO0dUc+OH62+oW6qMu
         untDQSqiS5t8SKcCaF4URdImMV08bzwVqDRXm9nNd3h3dhgrNbyRDu4ADCnFiXSekoc4
         29t4khRmQj7C7V4NA6cYbZpvm7CpUmdCNFSE/WGYfykcesIVxQfQCQFI8uparLy2q4c8
         gpmOXLRLF5POp10T9GYl+4rXiu5clt9uqxtlNirnsazF11NJtK6okK34XyrHRTGx9eV5
         9bO9gMzLnfo1djdbF1msm/fPKjh3aJ+DpcBwzZQgQB4Qxm284kfCmsw/aq2IYYzeQcOw
         eJ4A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5315fyg4P6tDvvw2p8MO5KOl3F5xHL1UqxMJd6LATDHbsl3ZIPsU
	UAgMjELNTyB01370UIK5iGw=
X-Google-Smtp-Source: ABdhPJwf6yBLH9ooyz3h4zrksbqOzpkexQc8xEFANPPWZoEf+n7tTVXJKM/2wVWjPIfMdkJfAJnRCg==
X-Received: by 2002:a5d:4fc7:: with SMTP id h7mr16667586wrw.23.1618866392494;
        Mon, 19 Apr 2021 14:06:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6804:: with SMTP id w4ls9320189wru.2.gmail; Mon, 19 Apr
 2021 14:06:31 -0700 (PDT)
X-Received: by 2002:adf:f0cc:: with SMTP id x12mr16934422wro.16.1618866391579;
        Mon, 19 Apr 2021 14:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866391; cv=none;
        d=google.com; s=arc-20160816;
        b=DedE23nAiTX3wmw399YUdISBH6lXUw0WgufQHzJLl3rHLAAhSLa/Yki4f/yacZtiwm
         ntOEWRltZDx3OwDEJ28o1pzq4rsRqD0DMBnmRjrRYxZ6MhXUicPDX2BpDMbbnhtGHMw/
         9G0IW9WcAHzfND4XyQfK/5F5CvlgQ2gPe3/SaqZoNK8OdfB5OiWoj89uQuFCyfAIsGeW
         /LkfQbVlIdyzh6mcbFJYNSfET5aBwumcCQsx7/8BIyjWBqOaDo20cxiP/PVTFS4TtGn5
         s3ydPh3W47LUioD9G1Z9x4x80363YE2gAdlxEdEilxvAPz0V38C48yDVgNyTV8o5+j+1
         9aBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=agpinA9jMusKw0FrxjVizUAc13uKBTI54+SsigrSIGI=;
        b=YYrKqlzS+ta1orUXIGkV2WyvZXvEmq/NNU7BV0FXDERhRvNonVruWtgmLNnjWNCToM
         kxKo48lZts/gU4ixVyN7bUL77ohhhv2hZx8wB+6tXZ3xfrS8sNk5xHaMERiSFgGQVWmS
         3UvCeRB5NF4+3a+/IpGBRlOEbSYhbbLmmacL9n2Sus/3pklyzl/yTU0MGbZMY2evey90
         vRwHmQJ9RTlE+t+wFECI4+y9Wlp/wBgNoQvKsRGvFnyPRELTXdYqhFdTgNjZXjRfjC9M
         G2TLKQJFnhDrTJrHnyJrz9bQC/qG5L5YDMjWcBofkGgpunZglpuVKrnKU7bxwjXxSYYh
         IG0Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id y16si1043317wrh.3.2021.04.19.14.06.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:06:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JL6V3C022112
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:31 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6TpY015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:31 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 05/20] linux-jailhouse: Generalize armhf config
Date: Mon, 19 Apr 2021 23:06:14 +0200
Message-Id: <eb957011838a308c856a34d130ee707a1009cec6.1618866389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1618866389.git.jan.kiszka@siemens.com>
References: <cover.1618866389.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/eb957011838a308c856a34d130ee707a1009cec6.1618866389.git.jan.kiszka%40siemens.com.
