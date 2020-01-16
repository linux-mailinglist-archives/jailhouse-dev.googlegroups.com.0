Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSXYQDYQKGQEUO5UEIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id D747113D7F8
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:50 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id w72sf3775395lff.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170890; cv=pass;
        d=google.com; s=arc-20160816;
        b=SlFM2bZd9hS3gtAVsJR8wOpCRcUytP9qHMQ3JcTvZyYZ/WBj4r4ErG9q7mCiSfmDGA
         DtNeBlgFNNnQ3kTWiZNEubAdl0p5SnY1oawxAShK7Zw1fIFtSLmbn4USY0l+ypBeerCy
         OmjrzYRkjVOHqpksYZzOfbpkdC4fJr0RxOcJiS9KhjLU641dVwp7+LxEfUCSAHz4Jetp
         aWlybDSrINQG+Y5X4X4YBlAk2RasMZ69SLwyBwDWeR4VL4L1246ScM/brzPHbOjnqDaq
         QgGX5BOXZdDIEOUOTyYGQkc4XSci99JwWmhxcrTHaUE9v+f5NTjRv4AdFiB+9BXOmPwa
         nbeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature;
        bh=QyC4TuxI0IaBZ1aGhgHfUdzCTW4QOXYf1GyRacF6aXQ=;
        b=OHcF1rHxvkWPPDyIoMP9Yv3z4VscBUIDUGSQdtkEQDE4fYfUmQR3uXzvUuiO+krCIm
         IJhrYZYr/ydkSvC+2+qCEO0lYEq8ZYDq6jDTjfN7u82WjLq+iJNqjuP18qJBthcAOlaH
         2uH64Tkdwzfl8OC6BkIpo8CcEjF+cjE9cWiXIj+LjirjmGHGOd9VELFDSKXstMeXS9hQ
         /Wn6uk787G22brQ0YMXG9zDT7uzRu8OhA477hDyzNeBztZqwzZ4m3LB/gLFbQdmadOjm
         0KU2Ck7Zv4byrB1yjbN6n/Yz42nhhCX6GlK4zLZhUEaM21CNqHEjkzGI8ZYsLKiBVUfM
         ePtw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QyC4TuxI0IaBZ1aGhgHfUdzCTW4QOXYf1GyRacF6aXQ=;
        b=k+yZDRv2qZLS/6FXhh/HqhASVzypdABanw0dIcG8oZLsKGVpetiS+y/Mej1Pe/MsY8
         Yj5bDuy4xtKPAhF0/fHRLuuJuKSl1XAKlCmRoQehqe8SrTgPdjyaFdEFykp3kffObNXY
         c79dtE0ZGOZ9/A7PwiiPgnhQO0JwVm+HOFsWgphPZuT1COg0NQ6UEQEN1fRNonIjlIW3
         7bx+9q/14KdH8x8ApwEm+L0ohZqgXsgJYcD+BjILDMCcp1vftHl8CHL/qzxSxYt8QCPr
         dCEI1NM62W0h8zvfWXnMePokUG1X6iYibmVAjlp6woBLWIZsoKZP9J/VBWPzQDW5f4Ys
         5dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QyC4TuxI0IaBZ1aGhgHfUdzCTW4QOXYf1GyRacF6aXQ=;
        b=Al81d7OJFqLmqUaGUqZnVhmFxzeAkOfF6hg/33nUrk/mc3JguwxdX8XrzpFkvc7LOF
         E5E5tUAodUWAuzRJjtQRE20YAIpilQuRcd/Fi0yvrz7pbc86g14xthPPs6WZShZphhlr
         WqSf6sikDez8rpWOQpHp1jRLTvhwR7w+B9iQnlsRnBAAaLPRXE6o25USBs8GCuI/Zp6Z
         PN9lwHvdfr/Ti26es4vSaFb6/ltGQ5rgf68glFAYTzoXzI8ebh6A4Ph1QXPPmV3JEdix
         o9pthiNgEjQ1b0v68JDZpFFVwtDIhxgEkeaa/Km1e7eq3gg7ZsrHm0sAV7Tov6q5OHrE
         38LQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXn4GcGCCT85v/gahN3d/nzOvoNpiRfnBcdJwMAANZQqFg5CKDd
	WQYs0hwzqvAQcM9sExc+tow=
X-Google-Smtp-Source: APXvYqw4lnnToGlMsY4WEQQQVZO7Vw4y3sd09HAmgbkuEOweADHe9Qj1GsKmPlPLIsctqwy2u6kK5g==
X-Received: by 2002:ac2:5292:: with SMTP id q18mr2030622lfm.103.1579170890406;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1051:: with SMTP id x17ls3026975ljm.8.gmail; Thu,
 16 Jan 2020 02:34:49 -0800 (PST)
X-Received: by 2002:a2e:8197:: with SMTP id e23mr1884398ljg.250.1579170889499;
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170889; cv=none;
        d=google.com; s=arc-20160816;
        b=ldRmUFtjFwlXB1ARcy4xt93H5SySwja7uCFFQbCgndctPfRnRWmWVKsd4+tOi4vFzI
         jpr1BxwiY7P3iMbdCxdedM3PbhH7RF6sdeRsXcSOj1vlPU7pH/xDfFwqR8l3lHHqzDBe
         nvmfmlYAWDJP0iCoutcxBweC3Dum5dhg0p4x9dBctqTvcF6YMDCq5zGApEBu8y0XvOJM
         8xBNm4WdwZLoaIVKP9YNBFLPg0ogW0AXVPkXcqS1XcVDmH+MdiRvbXtItt7N/ft0lL5x
         G5Z9g3CewchTOwaO2dC08LrMRWIdoe6Y8/nsTeoak3XlDYrrjvy0dl1gaXp0n7ZPKktF
         InoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from;
        bh=tWhhEd093sP3hx+aU0rxXXDbiFji6dgYdowYktY/+QQ=;
        b=UVHs7O1LSEQ8WycfWQTcJ1vTU2ZVfB4ZInVqBIuo5/MhRldAq6zKJ5FiI9TMCzAWSp
         FzgyWB29I4qGAAlaICaYRiWALrcny6PsrX8rjhljjSkEqTT3X82IsUXkZt0W3VKsT9Bi
         lIldq3EP1avU2vGF7N9Uc5OwgJRKEfrCA+fMFR/w2Aosu7tPoAQ926japDHLGn3IziKK
         TBQxfdqLZwXosjByUrulOI/Ng9CYmmwvjx3e4zispO16xxhGS52aYs2tsEUa2sUnU29I
         hHtkAREm0zp0Tcib6XBGM4UE4GrvkdLb7U99zQgmGBrePPC0yVZFjH51CoDw1YmBWDY/
         o7BA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id o24si985372lji.4.2020.01.16.02.34.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 00GAYmJb015279
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:48 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQA031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:48 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 00/18] Update to latest Jailhouse, add RPi 4
Date: Thu, 16 Jan 2020 11:34:29 +0100
Message-Id: <cover.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
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

This adjusts jailhouse-images to the significant changes in current
Jailhouse master. It breaks support for 0.11, in favor of being ready
for upcoming 0.12.

Specifically, this means updating to kernel 5.4, adjusting the configs,
updating network interface names and providing ivshmem integration as
well as demos.

As bonus on top, this brings support for the latest Raspberry Pi 4. That
new SoC finally supports a proper GIC and can do virtualization. It is
still a bit off in its boot process, but that can be addressed here.

Jan

Jan Kiszka (18):
  Drop PREFERRED_PROVIDER_u-boot-tools
  u-boot-macchiatobin/ultra96: Update to U-Boot 2019.10 / ATF 2.2
  Update Isar revision
  non-root-initramfs: Include ivshmem-demo from Jailhouse
  customizations: Adjust to new ARM/ARM64 demo cell naming
  jailhouse: Adjust nuc6cay configs to upstream changes
  customizations: Adjust to new ivshmem-net interface names
  xradio: Update to support 5.4 kernel
  linux-jailhouse: Add built-in uio_ivshmem driver
  linux-jailhouse: Update to 5.4
  Temporary set default Jailhouse version to latest
  linux-jailhouse: Add RPi4 variant of the kernel
  arm-trusted-firmware: Build for RPi4
  rpi-firmware: Add recipe to bundle required binary blobs and config
  rpi-firmware-brcm80211: Pull firmware blobs for WiFi on RPi 4
  customizations: Add RPi 4 support
  Hook up Raspberry Pi 4 support
  README: Add Raspberry Pi 4 support

 README.md                                          |    7 +
 conf/distro/jailhouse-demo.conf                    |    2 +-
 conf/machine/macchiatobin.conf                     |    1 -
 conf/machine/rpi4.conf                             |   35 +
 conf/machine/ultra96.conf                          |    1 -
 .../multiconfig/rpi4-jailhouse-demo.conf           |    9 +-
 images.list                                        |    1 +
 kas.yml                                            |    2 +-
 opt-rt.yml                                         |    3 +-
 .../arm-trusted-firmware-rpi4_2.2.bb               |   28 +
 ...rmware_2.1.inc => arm-trusted-firmware_2.2.inc} |    4 +-
 ...t-xilinx-zynqmp-Initialize-IPI-table-from.patch |   68 -
 ...001-rpi3-4-Add-support-for-offlining-CPUs.patch |   46 +
 recipes-bsp/arm-trusted-firmware/files/rpi-rules   |   23 +
 .../rpi-firmware-brcm80211.bb                      |   13 +
 recipes-bsp/rpi-firmware/files/cmdline.txt         |    1 +
 recipes-bsp/rpi-firmware/files/config.txt          |   11 +
 .../rpi-firmware/rpi-firmware_1.20190925.bb        |   18 +
 ....1.bb => u-boot-macchiatobin_2019.10-atf2.2.bb} |    2 +-
 ...-atf2.1.bb => u-boot-ultra96_2019.10-atf2.2.bb} |    2 +-
 .../customizations/files/.bash_history-espressobin |   10 +-
 .../customizations/files/.bash_history-hikey620    |   10 +-
 .../files/.bash_history-macchiatobin               |   10 +-
 .../files/.bash_history-orangepi-zero              |   10 +-
 .../customizations/files/.bash_history-qemu-arm64  |   10 +-
 .../customizations/files/.bash_history-rpi4        |   14 +
 .../customizations/files/.bash_history-ultra96     |   10 +-
 recipes-core/customizations/files/ivshmem-net      |   18 +-
 recipes-core/customizations/files/postinst-rpi4    |    1 +
 recipes-core/non-root-initramfs/files/amd64-config |    2 +-
 recipes-core/non-root-initramfs/files/arm64-config |    2 +-
 recipes-core/non-root-initramfs/files/armhf-config |    2 +-
 .../non-root-initramfs/files/build-ivshmem-demo.sh |    8 +
 .../non-root-initramfs_2019.02.2.bb                |    5 +
 .../jailhouse/files/linux-nuc6cay-demo.c           |   75 +-
 recipes-jailhouse/jailhouse/files/nuc6cay.c        |   70 +-
 .../{amd64_defconfig_4.19 => amd64_defconfig_5.4}  |   31 +-
 .../{arm64_defconfig_4.19 => arm64_defconfig_5.4}  |   54 +-
 ..._defconfig_4.19 => orangepi-zero_defconfig_5.4} |   13 +-
 recipes-kernel/linux/files/preempt-rt.cfg          |    2 +-
 recipes-kernel/linux/files/rpi4_defconfig_5.4      | 1469 ++++++++++++++++++++
 recipes-kernel/linux/linux-jailhouse-rpi_5.4.8.bb  |   15 +
 .../linux/linux-jailhouse-rt_4.19.72-rt26.bb       |   21 -
 .../linux/linux-jailhouse-rt_5.4.5-rt3.bb          |   17 +
 recipes-kernel/linux/linux-jailhouse_4.19.81.bb    |   15 -
 recipes-kernel/linux/linux-jailhouse_5.4.7.bb      |   15 +
 ...-jailhouse_4.19.inc => linux-jailhouse_5.4.inc} |    7 +-
 recipes-kernel/xradio/xradio.bb                    |    2 +-
 wic/rpi4.wks                                       |   14 +
 49 files changed, 1949 insertions(+), 260 deletions(-)
 create mode 100644 conf/machine/rpi4.conf
 copy opt-rt.yml => conf/multiconfig/rpi4-jailhouse-demo.conf (54%)
 create mode 100644 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb
 rename recipes-bsp/arm-trusted-firmware/{arm-trusted-firmware_2.1.inc => arm-trusted-firmware_2.2.inc} (63%)
 delete mode 100644 recipes-bsp/arm-trusted-firmware/files/0001-plat-xilinx-zynqmp-Initialize-IPI-table-from.patch
 create mode 100644 recipes-bsp/arm-trusted-firmware/files/0001-rpi3-4-Add-support-for-offlining-CPUs.patch
 create mode 100644 recipes-bsp/arm-trusted-firmware/files/rpi-rules
 create mode 100644 recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb
 create mode 100644 recipes-bsp/rpi-firmware/files/cmdline.txt
 create mode 100644 recipes-bsp/rpi-firmware/files/config.txt
 create mode 100644 recipes-bsp/rpi-firmware/rpi-firmware_1.20190925.bb
 rename recipes-bsp/u-boot/{u-boot-macchiatobin_2019.07-atf2.1.bb => u-boot-macchiatobin_2019.10-atf2.2.bb} (94%)
 rename recipes-bsp/u-boot/{u-boot-ultra96_2019.07-atf2.1.bb => u-boot-ultra96_2019.10-atf2.2.bb} (91%)
 create mode 100644 recipes-core/customizations/files/.bash_history-rpi4
 create mode 100644 recipes-core/customizations/files/postinst-rpi4
 create mode 100755 recipes-core/non-root-initramfs/files/build-ivshmem-demo.sh
 rename recipes-kernel/linux/files/{amd64_defconfig_4.19 => amd64_defconfig_5.4} (93%)
 rename recipes-kernel/linux/files/{arm64_defconfig_4.19 => arm64_defconfig_5.4} (96%)
 rename recipes-kernel/linux/files/{orangepi-zero_defconfig_4.19 => orangepi-zero_defconfig_5.4} (97%)
 create mode 100644 recipes-kernel/linux/files/rpi4_defconfig_5.4
 create mode 100644 recipes-kernel/linux/linux-jailhouse-rpi_5.4.8.bb
 delete mode 100644 recipes-kernel/linux/linux-jailhouse-rt_4.19.72-rt26.bb
 create mode 100644 recipes-kernel/linux/linux-jailhouse-rt_5.4.5-rt3.bb
 delete mode 100644 recipes-kernel/linux/linux-jailhouse_4.19.81.bb
 create mode 100644 recipes-kernel/linux/linux-jailhouse_5.4.7.bb
 rename recipes-kernel/linux/{linux-jailhouse_4.19.inc => linux-jailhouse_5.4.inc} (73%)
 create mode 100644 wic/rpi4.wks

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1579170887.git.jan.kiszka%40siemens.com.
