Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKHD5L5QKGQEUKP5ODI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F2F28301C
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:53 +0200 (CEST)
Received: by mail-ej1-x63a.google.com with SMTP id i21sf1805614ejb.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876393; cv=pass;
        d=google.com; s=arc-20160816;
        b=reqteAzkyU+cDWf7hT1lkziKaKLQigcY3UVF5v6dXAwc+BHhFbl/Ouh2DsKvS9ClwL
         Fd4w05PGv+DXZvQUMzM/jMCO9IbEe8VMrEt5Gil9v8YH4bDEZUMSPf9KPIXJmAzZL5pD
         eH3cKXCEMEdC7Dz3EDh7oFgaNnypeQeMrkwU7zinSdAcoLMpe7b91zA4niswvIUaD60B
         k1dLI8DhGhApmF5MjyUJuKoHE/OBzWdVrttRLfVg5pXhC8YfyTdavhrvmHhRO11+xREq
         Jw4gzTaM5PEcvGtyFjlIMACCrKJ0huIzY2orj04+tU9YZuqFxf1k6SXMELsV6KhiUOOp
         4k/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=cXTQ/l6OM/I1YEtiBWRRDe4ejWShSOJ0ww4kfV8e16g=;
        b=sT5wi4RkNEknGyluzsVLJLEoUChlBAPsGS3zyPVYhkYyke/JGBdjWNBrIco0WMajck
         5BKZ6NVDiQqYR8OXsR2+KGX0V0s6LiwF9+C/zwiC7q/MtS3SvRJV1wRUkC5vKG/NnaY1
         vvv0Dwe7b8XHyzjxRrVAwRbGvTf2h191WVZi7fbpUneI3T1kMrcjyNbHr2zzybhAddKC
         zK6fX16aXFGmJppjmUrzeVXYtJNaFZeNzh2IGfaoMUeJb+zTKX2lae55V6/OB24idbvM
         S9WjhkjdEwVFy1M6HK5jAJG7AdhXFl+uUhGaQ8Mf5EwRgSLA3gzmGuhFlLk6dWk4IpTk
         loMA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cXTQ/l6OM/I1YEtiBWRRDe4ejWShSOJ0ww4kfV8e16g=;
        b=LoH8yFlZBCMbd4ESsLDq1GVT8EXIeDS0A9+3EIggJXMK33MqUkM+LGsN952z0peZfL
         57iQ+NcmSEiqkX72XidyJcbSwLKDavfY2TI4nabbs9crITtVZnD8N3JVdXcDWxF73zUK
         CP26McxXfe6I0aU+sRH/RI6tkGWXczA+RQtyehYjlqdSVvIIaJQx7/ptNqKO3Nx6vwi6
         Y470Y0SBkSXHT8D55dXTjpWLiR+RaZuC2jFyJFhs6g0UMTzKVlkv8i00hNxZE38QRyAT
         Ysit0XXlKS3nP645JAFxGq19RmNJ18uH4Fw9k0MBxWuXjwjboybURvcOj+ODODvltijh
         Cx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cXTQ/l6OM/I1YEtiBWRRDe4ejWShSOJ0ww4kfV8e16g=;
        b=pgAjDQLGpgMKI5NDkAkUPnA+LZeH2T4vY2jt/zW/57agwH5eRj0zcLSWckKiLu0bB0
         JYJmW0ZYVykggycf4Rb5w5goHsGSvHQKjnuhAtEE8oGM/nW7mKW6GpN3qfrq6V4yNSv1
         4aOjUmnnHDqW1o3fiS3OUbiWSwyzKYmmrsCijBFBGoLrWLlHm0zvFgyOgA2mKogauy+p
         oJojWapGef0iwYf051KEpG0QgGzgOKbDUqhxNWD3iUPkp5+/noi52PwAbasdmaC4clQc
         y4Wf5xsuRoqD4h0HzyZN99h0ZYft+IZbjvZi2zc1gMTnulk7/v4QqjbrMDhXaCilK//8
         N0rQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Op0qdwXUCcX6AtPhtCWUe8oH2mvmxcMHrdERJcJ/In9C8kzaD
	/4gU7KsJlCrMYDsbfee84os=
X-Google-Smtp-Source: ABdhPJyko5751yfiwL3f2m41fN+ui/PBrwVDV0tCtszvEY+RMvI50o/E1CNLHmM/1u9l7Q7rr6OLbw==
X-Received: by 2002:a17:906:cb94:: with SMTP id mf20mr14308462ejb.8.1601876392979;
        Sun, 04 Oct 2020 22:39:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1d3c:: with SMTP id dh28ls3861860edb.0.gmail; Sun,
 04 Oct 2020 22:39:51 -0700 (PDT)
X-Received: by 2002:a50:80e3:: with SMTP id 90mr15760393edb.39.1601876391655;
        Sun, 04 Oct 2020 22:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876391; cv=none;
        d=google.com; s=arc-20160816;
        b=TTu6xGaogbR7ggUrZWu5Z0bcVF0cIbE6t8QREMPdDGS7awZzWs19HvnCuj2eSz7sol
         cuxfoLZceJjXzGXgGpp76l4vnDg+Ar4XVDGL+QeGZoR88oIJzIp5xtyVY9UwnlwZ7qFT
         RXNLeNvGAd93pOeI0ZH8S5DU6BWnX4bBdqfMO3wCisu/XRCzzSSpdnchKvSrok4ayA2m
         21uDALY1pxm70rFCkA4WR9bPG0TSD3l0N1geY4BL8loiRn6cJ+JdsStUt6z18s8yX2w3
         mJI6wjYp+Ti1Y2EfiF9pp7Jlx31cmgeY4msvEZn0ZYYl4h0LW8A5rK3/KLsujKefzyXo
         DIbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=1FO8DIWqT1KP2fpOWjlEZ4ydrvioM7isuIsBR6bMPxE=;
        b=o9co+XFlm6mNmfgM2+mx3k378T5zuSuukVxNTyZGdVZXPZviIpeQtsYSqwbta3lyOA
         fDYIujUQdoRP+3x9tQjj7vgpBxeWqSa5RXoyU1BnjAnOYfzXkX8/cyk0QkaYSHU+LQMn
         Cmk11aHJc4R2nxKMPvYVjiwZ9/VpFdBpi5kEnW8Qhc55QDlu7Cj7QlsXaqWUvFTy7aDn
         piga+3HCJKFJSI/n8SaxuW5QXKewKjZDKcjaZXLVFIzajqEdnoENqMc5KsaBNcDCvS0T
         vHm3OgSb61PIG66Hp61x0Lpsr557Ok2fao+4syX5I0pbtzE1MqzB7bsdD3Uk7sULP4R0
         6x8A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id a16si376650ejk.1.2020.10.04.22.39.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0955doZe002204
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Oct 2020 07:39:50 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dnc9025569;
	Mon, 5 Oct 2020 07:39:50 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [jh-images][PATCH 00/19] Add Ultra96 v2, refactor/update TF-A integration
Date: Mon,  5 Oct 2020 07:39:30 +0200
Message-Id: <cover.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
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

The primary functional enhancement of this series is support for the
newer Ultra96 v2.

In addition, the series refactors the Trusted Firmware A integration,
using a soon to-be-upstreamed Isar patch. The refactoring also bumps the
version of TF-A and U-Boot on affected boards, namely Ultra96, RPi4,
Pine64+, MACCHIATObin. For the last two, I'd need some test feedback as
I do not have them in reach.

There is still some room for improvement, but none that should delay the
first integration:
 - revision-specific PMU firmware for Ultra96 (primarily changes the
   power button IIUC)
 - wilc3000 wifi driver clean-up (lengthy story, but I'd like to move
   closerto the official downstream repo, which should move us closer to
   a potential upstreamed one (wilc1000 is already in 5.9)

Jan


CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
CC: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>

Jan Kiszka (19):
  ultra96: Rename to ultra96-v1
  u-boot-ultra96: Set fsbl config explicitly
  u-boot: Add specifics for Ultra96-v2
  linux-jailhouse: Drop unused patch
  linux-jailhouse: Add patches for Ultra96-v2
  wilc: Add out-of-tree wifi driver for Ultra96-v2
  customizations: Add Ultra96-v2
  Hook up Ultra96-v2 support
  README: Add Ultra96-v2 support
  ultra96: Disable initrd usage
  ultra96: Add rootwait kernel parameter
  pine64-plus: Disable initrd
  Consolidate PREFERRED_PROVIDER_u-boot
  Add new TF-A build infrastructure
  rpi4: Convert to stand-alone TF-A recipe and update to 2.3
  pine64: Convert to stand-alone TF-A recipe and update versions
  ultra96: Convert to stand-alone TF-A recipe and update versions
  macchiatobin: Convert to stand-alone TF-A recipe and update versions
  arm-trusted-firmware: Remove now unused artifacts

 README.md                                     |  10 +-
 conf/distro/jailhouse-demo.conf               |   5 +-
 conf/machine/macchiatobin.conf                |   6 +-
 conf/machine/pine64-plus.conf                 |   1 -
 conf/machine/rpi4.conf                        |   4 +-
 .../ultra96-v1.conf}                          |   6 +-
 .../ultra96-v2.conf}                          |   8 +-
 conf/machine/{ultra96.conf => ultra96.inc}    |  11 +-
 ...mo.conf => ultra96-v1-jailhouse-demo.conf} |   2 +-
 ...mo.conf => ultra96-v2-jailhouse-demo.conf} |   2 +-
 images.list                                   |   3 +-
 ...de-for-building-custom-Trusted-Firmw.patch | 127 ++++++++
 kas.yml                                       |   4 +
 .../arm-trusted-firmware-rpi4_2.2.bb          |  28 --
 .../arm-trusted-firmware_2.2.inc              |  20 --
 ...-Prepare-for-skipping-initialisation.patch | 127 --------
 ...2-plat-rpi4-Skip-UART-initialisation.patch | 109 -------
 ...pi3-4-Add-support-for-offlining-CPUs.patch |  47 ---
 .../arm-trusted-firmware/files/rpi-rules      |  23 --
 ...se-abspath-to-dereference-BUILD_BASE.patch | 144 ++++++++
 ...-fix-gcc-warning-about-uninitialized.patch |   0
 .../trusted-firmware-a-macchiatobin_2.3.bb    |  34 ++
 .../trusted-firmware-a-pine64-plus_2.3.bb     |   6 +-
 .../trusted-firmware-a-rpi4_2.3.bb            |   6 +-
 .../trusted-firmware-a-ultra96_2.3.bb         |  17 +
 .../trusted-firmware-a_2.3.inc                |  19 ++
 ...efile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch |  31 --
 recipes-bsp/u-boot/files/macchiatobin-rules   |  40 ---
 recipes-bsp/u-boot/files/pine64-plus-rules    |  10 +-
 recipes-bsp/u-boot/files/ultra96-rules        |   5 +-
 ...a96-fsbl.elf.xz => ultra96-v1-fsbl.elf.xz} | Bin
 .../{ultra96.bit.xz => ultra96-v1.bit.xz}     | Bin
 .../u-boot/files/ultra96-v2-fsbl.elf.xz       | Bin 0 -> 44040 bytes
 recipes-bsp/u-boot/files/ultra96-v2.bit.xz    | Bin 0 -> 58072 bytes
 ...lf.LICENSE => ultra96-vX-fsbl.elf.LICENSE} |   0
 ...a96.bit.LICENSE => ultra96-vX.bit.LICENSE} |   0
 recipes-bsp/u-boot/files/ultra96.bif.tmpl     |   7 +-
 recipes-bsp/u-boot/u-boot-2020.07.inc         |  17 +
 .../u-boot-macchiatobin_2019.10-atf2.2.bb     |  43 ---
 .../u-boot/u-boot-macchiatobin_2020.07.bb     |   7 +-
 .../u-boot-pine64-plus_2019.10-atf2.2.bb      |  33 --
 .../u-boot/u-boot-pine64-plus_2020.07.bb      |  25 ++
 .../u-boot/u-boot-ultra96-v1_2020.07.bb       |  40 +++
 .../u-boot/u-boot-ultra96-v2_2020.07.bb       |   1 +
 .../u-boot/u-boot-ultra96_2019.10-atf2.2.bb   |  43 ---
 ...story-ultra96 => .bash_history-ultra96-v1} |   0
 .../files/.bash_history-ultra96-v2            |   1 +
 .../{postinst-ultra96 => postinst-ultra96-v1} |   0
 .../customizations/files/postinst-ultra96-v2  |   1 +
 ...-revC-Give-wifi-some-time-after-powe.patch |  38 ---
 ...san-Separate-out-clk-related-data-to.patch |  99 ++++++
 ...san-Add-sampling-clock-for-a-phy-to-.patch | 232 +++++++++++++
 ...03-arm64-zynqmp-Add-firmware-DT-node.patch |  37 +++
 ...zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch | 109 +++++++
 ...san-Add-support-to-set-clock-phase-d.patch | 160 +++++++++
 ...ware-xilinx-Add-SDIO-Tap-Delay-nodes.patch |  44 +++
 ...san-Add-support-for-ZynqMP-Platform-.patch | 308 ++++++++++++++++++
 ...irmware-xilinx-Add-DLL-reset-support.patch |  57 ++++
 ...san-Add-support-for-DLL-reset-for-Zy.patch |  99 ++++++
 ...p-Add-ZynqMP-SDHCI-compatible-string.patch |  52 +++
 ...san-Modified-SD-default-speed-to-19M.patch |  64 ++++
 ...support-for-Avnet-Ultra96-rev2-board.patch |  83 +++++
 .../linux/files/arm64_defconfig_5.4           |   2 +-
 recipes-kernel/linux/linux-jailhouse_5.4.inc  |  12 +
 recipes-kernel/wilc/files/debian/wilc.install |   1 +
 recipes-kernel/wilc/wilc_15.2-avnet.bb        |  33 ++
 wic/macchiatobin.wks                          |   2 +-
 wic/pine64-plus.wks                           |   2 +-
 wic/ultra96.wks                               |   4 +-
 69 files changed, 1877 insertions(+), 634 deletions(-)
 copy conf/{multiconfig/ultra96-jailhouse-demo.conf => machine/ultra96-v1.conf} (64%)
 copy conf/{multiconfig/ultra96-jailhouse-demo.conf => machine/ultra96-v2.conf} (54%)
 rename conf/machine/{ultra96.conf => ultra96.inc} (52%)
 copy conf/multiconfig/{ultra96-jailhouse-demo.conf => ultra96-v1-jailhouse-demo.conf} (89%)
 copy conf/multiconfig/{ultra96-jailhouse-demo.conf => ultra96-v2-jailhouse-demo.conf} (89%)
 create mode 100644 isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch
 delete mode 100644 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb
 delete mode 100644 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
 delete mode 100644 recipes-bsp/arm-trusted-firmware/files/0001-console-16550-Prepare-for-skipping-initialisation.patch
 delete mode 100644 recipes-bsp/arm-trusted-firmware/files/0002-plat-rpi4-Skip-UART-initialisation.patch
 delete mode 100644 recipes-bsp/arm-trusted-firmware/files/0003-rpi3-4-Add-support-for-offlining-CPUs.patch
 delete mode 100644 recipes-bsp/arm-trusted-firmware/files/rpi-rules
 create mode 100644 recipes-bsp/trusted-firmware-a/files/0001-Use-abspath-to-dereference-BUILD_BASE.patch
 rename recipes-bsp/{u-boot => trusted-firmware-a}/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch (100%)
 create mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.3.bb
 copy conf/multiconfig/ultra96-jailhouse-demo.conf => recipes-bsp/trusted-firmware-a/trusted-firmware-a-pine64-plus_2.3.bb (58%)
 copy conf/multiconfig/ultra96-jailhouse-demo.conf => recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.3.bb (59%)
 create mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.3.bb
 create mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc
 delete mode 100644 recipes-bsp/u-boot/files/0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch
 delete mode 100644 recipes-bsp/u-boot/files/macchiatobin-rules
 rename recipes-bsp/u-boot/files/{ultra96-fsbl.elf.xz => ultra96-v1-fsbl.elf.xz} (100%)
 rename recipes-bsp/u-boot/files/{ultra96.bit.xz => ultra96-v1.bit.xz} (100%)
 create mode 100644 recipes-bsp/u-boot/files/ultra96-v2-fsbl.elf.xz
 create mode 100644 recipes-bsp/u-boot/files/ultra96-v2.bit.xz
 rename recipes-bsp/u-boot/files/{ultra96-fsbl.elf.LICENSE => ultra96-vX-fsbl.elf.LICENSE} (100%)
 rename recipes-bsp/u-boot/files/{ultra96.bit.LICENSE => ultra96-vX.bit.LICENSE} (100%)
 create mode 100644 recipes-bsp/u-boot/u-boot-2020.07.inc
 delete mode 100644 recipes-bsp/u-boot/u-boot-macchiatobin_2019.10-atf2.2.bb
 rename conf/multiconfig/ultra96-jailhouse-demo.conf => recipes-bsp/u-boot/u-boot-macchiatobin_2020.07.bb (51%)
 delete mode 100644 recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
 create mode 100644 recipes-bsp/u-boot/u-boot-pine64-plus_2020.07.bb
 create mode 100644 recipes-bsp/u-boot/u-boot-ultra96-v1_2020.07.bb
 create mode 120000 recipes-bsp/u-boot/u-boot-ultra96-v2_2020.07.bb
 delete mode 100644 recipes-bsp/u-boot/u-boot-ultra96_2019.10-atf2.2.bb
 rename recipes-core/customizations/files/{.bash_history-ultra96 => .bash_history-ultra96-v1} (100%)
 create mode 120000 recipes-core/customizations/files/.bash_history-ultra96-v2
 rename recipes-core/customizations/files/{postinst-ultra96 => postinst-ultra96-v1} (100%)
 create mode 120000 recipes-core/customizations/files/postinst-ultra96-v2
 delete mode 100644 recipes-kernel/linux/files/0001-arm64-dts-zcu100-revC-Give-wifi-some-time-after-powe.patch
 create mode 100644 recipes-kernel/linux/files/0001-mmc-sdhci-of-arasan-Separate-out-clk-related-data-to.patch
 create mode 100644 recipes-kernel/linux/files/0002-mmc-sdhci-of-arasan-Add-sampling-clock-for-a-phy-to-.patch
 create mode 100644 recipes-kernel/linux/files/0003-arm64-zynqmp-Add-firmware-DT-node.patch
 create mode 100644 recipes-kernel/linux/files/0004-firmware-zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch
 create mode 100644 recipes-kernel/linux/files/0005-mmc-sdhci-of-arasan-Add-support-to-set-clock-phase-d.patch
 create mode 100644 recipes-kernel/linux/files/0006-firmware-xilinx-Add-SDIO-Tap-Delay-nodes.patch
 create mode 100644 recipes-kernel/linux/files/0007-mmc-sdhci-of-arasan-Add-support-for-ZynqMP-Platform-.patch
 create mode 100644 recipes-kernel/linux/files/0008-firmware-xilinx-Add-DLL-reset-support.patch
 create mode 100644 recipes-kernel/linux/files/0009-mmc-sdhci-of-arasan-Add-support-for-DLL-reset-for-Zy.patch
 create mode 100644 recipes-kernel/linux/files/0010-arm64-zynqmp-Add-ZynqMP-SDHCI-compatible-string.patch
 create mode 100644 recipes-kernel/linux/files/0011-mmc-sdhci-of-arasan-Modified-SD-default-speed-to-19M.patch
 create mode 100644 recipes-kernel/linux/files/0012-arm64-dts-Add-support-for-Avnet-Ultra96-rev2-board.patch
 create mode 100644 recipes-kernel/wilc/files/debian/wilc.install
 create mode 100644 recipes-kernel/wilc/wilc_15.2-avnet.bb

-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1601876389.git.jan.kiszka%40siemens.com.
