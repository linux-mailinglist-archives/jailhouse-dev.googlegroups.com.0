Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRXF46BAMGQECGT3STI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FB3346038
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 14:53:11 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id v9sf1460711ljc.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 06:53:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616507591; cv=pass;
        d=google.com; s=arc-20160816;
        b=G5w1ul8mgE74jUI4/P6jeNND+PKwx4jPdYT5YDgB0OkZhzm+BzMqh1aUMZzKIUuqTv
         an7SE0tqT+Keezv2k6CCWx2GIOlion3eoqYuk7Dm9X4CHkiZDSAAfKliM5BzEhaAa/bJ
         WmcmOg7KTFSLfQXAO75eY2/DtWYZZcUdvvpwE0bdnFZnVClz+CSaHomXMmApYzAKxhms
         hy+KHyJh3rbE3Ph+DwbANXd9aCaFxQbH5JR8rX4FVlP+y2GFBpToaaEFplv3014sWW9k
         gSonXUDpAVAKOg2m3U7M8dhrrw6upnrBAUNKkIX2rmY6sv9BZ6yUMgpCxqV2fsnF2Cfs
         qUkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=06Yai0nqBV2HGpxpxu4dobCuedUnayqgrfC/YTSE6fQ=;
        b=SP1xKByF3LHDKe/qOBVaxv1OPACYPo/eZOwN7EXTC+tDvCv4bDfNhSZsUioCeoAIZy
         L8J1R2UzEnj4foUBJ8jNeOlRddvneImQXVA4OcQR5BeX0eEKlYJzALsViei5ydyRjSkU
         I53L2WZo0TVhqa4oZxmbxccssx9BdKNTACqaH6jy65b/ibRkWTyHr7atlp+b7XUVlFsd
         k6xxwmkPxBzP5CUJH4qMBIk+0OFDB60IyTAM7AnGaWSSlI6Mzw2NaBtJo9j2SGI9ytok
         x9Kzo37woZKdJpNTWyj7+UM8H20+OOqMtvnrcaa8pXrUHMhUFxde7V/VA1yG/0gLz/yR
         8CUw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=06Yai0nqBV2HGpxpxu4dobCuedUnayqgrfC/YTSE6fQ=;
        b=QrD8xZp6IztGqb+Nx7H42Kaaz9bG5kYTo//ZboZK0uPbadqjwhzBlDYvaxnzLck4qg
         B/2ImsD1YoJo8ZrszuYiBHnyNMGZXzyJ2YOvEq3tPHVTOyQIOGzia10lKoykETx6E8sI
         HYQTrG400Y44du7ntVU8gHBpcTkuWoSyrzrhHtZgT5Wdx7o/uC2PPZA8BQIK75RX4wI+
         F9SCpyhnZe1wF8GfoAiAKjkKaTH0h0a+eYYtvZQiQIQjFKXgjrT1ni2F6w2L3m2x6olL
         fjhUHBlGqUDDc7qO6U4xXUi+AsSOacHQWWy1NAWcSJpkub1pvd6gU0J1H6bjedU6BtR3
         vfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=06Yai0nqBV2HGpxpxu4dobCuedUnayqgrfC/YTSE6fQ=;
        b=R3YuLsMERcjMVN4nJEDjrXAeg6WGLCjlgpeNtXQxSESiRL+yo/XX9wt49H0HgUwFQA
         LcttO9hEmO4qhN5bZ1tHSFGPU9vjqf9SDH7AZviIUS8+XlZ/4oq/SvP/FrRuBI3Yx41B
         SuxkN9S2+9s4/f4tPMUQ4jgHY4BmIPnMLPg79KCFXuRBLD7sy3TvYq3Bz0XnPzw0m6Mu
         ktbEzYnFmf8NoYOAS0ovjx6hxlPcSDYb008tRQ9zccLlt/G0uesVKCnJsgLQykDl8vZs
         snDZNMXpvMGrJSYeiZKKuADcKZSDiVtQ3osSlMomQ3g6AUljmUKIpJhBejhh91GArRpD
         3Ysw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532sR0WghzJe+dz4q4nV9le3VZGpKG3Pit5wZJm8wModkA4XcIJR
	pLCJ/qTosBw2QfoqsnU6Qs4=
X-Google-Smtp-Source: ABdhPJy8Hi8G1fqVXxadBE+N0aQN6HjxllY2/04kIuAyRbjPYmfq5CZS9XRzo2Dxcq+PkAmXv3mxRw==
X-Received: by 2002:ac2:4298:: with SMTP id m24mr2776090lfh.429.1616507590877;
        Tue, 23 Mar 2021 06:53:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6c2:: with SMTP id u2ls4750664lff.3.gmail; Tue, 23
 Mar 2021 06:53:09 -0700 (PDT)
X-Received: by 2002:ac2:53a7:: with SMTP id j7mr2893318lfh.305.1616507589808;
        Tue, 23 Mar 2021 06:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616507589; cv=none;
        d=google.com; s=arc-20160816;
        b=Ze40UqjY8tkUFRvNMb76uESSmAhhsu+vG2cuENZTtDYXgEdmURw1OOKDBXwfDo2LYw
         zC1O82DsKnQUauWQEIg3YXeRbs8rq4WFIbIvJRdIw1r+JyK35UTVZjqPjEcYAhCk7iVJ
         DauD8rsiP+DaJ69HHiXCSgjwQHbU/e3pQdP8OkZkcHcC6aK4bIYb9w8J6RpL5LpfBbo2
         VExc1dhA0aauMt41Ggf+zf88asCOGxAIpH2e3UHUXx5c4Q66lpYxJ9nuNNSaLmnRmARI
         xVOEUGmbI57ax2cQdtAOYkEP/XDzObDt5z4rO3aXTNIVABoieryPfUBERydHdg10pn6d
         egpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=agpinA9jMusKw0FrxjVizUAc13uKBTI54+SsigrSIGI=;
        b=d9jxgPz/TsS7F1ZpVO3mvsR2f03PZLXOj/8NxOazbIXhtR3boAxHe0l19eOtK/V8Ar
         N1QDjy1gEb/WxghxF+/jXImyMZT7rHHu8GK6a5WwU/ePt5QANBCJF64wICti1T7+4DOm
         dZlzDbV0cOX8f10qZ9L0lvHbQbiw3GUtGWw46ls9vAELIn9Fc9RAnvX3MaVMP8RkeG2+
         Ucw9z+D1e00/POonw4kqbekHtMUAOWsRefrfdJz2sCYwADoOzy6ni0jFx8CkxHqUgv2g
         sKt7nsg+Hel0TBeY0O/ZwHALZaKE9YOGPO4JwipSg0mTLF96glVgy2OWMlycAn4Looey
         HgeA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id v3si698179lfd.4.2021.03.23.06.53.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 06:53:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12NDr9nv026274
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:53:09 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12NDm2Mk029573
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:48:03 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 04/11] linux-jailhouse: Generalize armhf config
Date: Tue, 23 Mar 2021 14:47:55 +0100
Message-Id: <d69ec0f04421c15c02effe8417f863bb8785e3bb.1616507282.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1616507282.git.jan.kiszka@siemens.com>
References: <cover.1616507282.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d69ec0f04421c15c02effe8417f863bb8785e3bb.1616507282.git.jan.kiszka%40siemens.com.
