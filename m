Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4E2T2CQMGQE7TXU75Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id DF10B38C50D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:37:36 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id r15-20020a05600c35cfb029017cc4b1e9fasf1789956wmq.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:37:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593456; cv=pass;
        d=google.com; s=arc-20160816;
        b=p7wt2WOJAo9NQFAGQQfs2ZiQN3+JfKB+CulvZnrqhJjxur0IN5yuxV/vEdtukX25eJ
         SLeQU18krySResj1pP926R1c5ciAQYWz4Lg1jdf8rq1AdoJdYV2NiC7mKQcBQlgEMD01
         R2NtQ87VbOZDLvI08TPYNTJx2TZaR3mhg4uZT+EfDwTYL5T7YeBfpkZppTqViBtg6Th9
         wD1R1hbYd/2BB5pw9npCuBfWKUojRrU6oNhL88y8O3RPKKondeAKcTZrVphOhwuinmZ4
         bfhGWn7EV0OWZqDGlxMVBkXvguau5MBplwcTpIaIlz9RlgjKO7CSPtVJz6/JwfhpuwZM
         0PgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=7S851hVXFzG6Oz7jWNOcjwSrkp7gDcKtCoA5GhgPrXo=;
        b=KkrFNhyxivkEqW3wk1krE3i73yK6/vjVkfcfqRzlpR8FpA+E5eAvcUAWFGf2tstpxS
         UyZsYW5maPAde0Fo+UhxP+VQtMZvJEIDwhDYksCRSX60he2pPMB5tl8/eQWShVzGvMEf
         ZtOLYn0wy5GCikIP8RLsgtWZg2HdPYy3LXB8jcuvDZXTwaXyfHerPfuONRxap2eqbqKD
         OEBjsJxxr7RWkUOIilgG9DtbuT8GzTbsnM8i9mZxToK0TRAtVzlykMbqJl9Zhf7FUkQ3
         kZcrRVkYNTUV1rCQb9Gii2mPV97LpvrgSwSQy6Q3+J/D+Aw9GRpaSFWrajsPZa/zs/Gl
         WdTw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7S851hVXFzG6Oz7jWNOcjwSrkp7gDcKtCoA5GhgPrXo=;
        b=sog+2zGHWJAmp6nr4p+JqmK13xATseirZVdgoyc7pR0j7g5cdZ3T9DqgF/Rx1hOdZg
         h6LoVSwUrTgl6n/xyT8hXxVQqC+LhhXuzF7dZbEDO8GD2qLj90ZaBkHHL9tcWwQ80G1J
         3kWdrfnXDddVZ3FCq7XK2NAaRLQk45klPfEyTZqjfWUuon5iDE3ON87IwZWDXwdmlysM
         K/RQOTfZ3NcKbkH970DnEIoKASiTQZzlccTdz7Abkuyb6gTZC4S70NpBM2iy/OHaGUtb
         tsRnt15w8Lury2NOk1ZbOCmDfsxEQSQMPEJdMm0N5/R+oZgeebcvcF7qflOjfeDyfMgA
         N6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7S851hVXFzG6Oz7jWNOcjwSrkp7gDcKtCoA5GhgPrXo=;
        b=lzs7oYoUkjKp7nOVGaWOEGXeghPjePtZy0WJ9Rlptag8/+M94+GBYczTHo8VkOP0sN
         xwm5D4oxd4PyWiwrd2r9taJsb7E7afsbKGqRWabVc5zIEsiykK6i3GjhlslNjM9IBrPW
         eKJMpNs2GeluOuH7rrZKjvVoH2NeCHfr85tZp6tdooXHW1AutEAeSbVtvmhW6NJfrmD6
         KvKFQthw2LlIvhSBZAml9Kpt87iPFYoqmnpCiIaAzN3bOUa1Wa4B5j4K7+VZMGrMWxEo
         d2hRXPNFQcJgngnqGceUM0ymkY/1PkMR7lBoriwUbqIIAdtgnSAJnOoHoGRi1E9XDHhC
         R/mQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531BB136M3PXAPPf+VI+31y+0HYdTueiR/Xtn/FpVDtmuUWuBd0n
	/R+OYw3+V8L4BMQpvW47Z18=
X-Google-Smtp-Source: ABdhPJyi6RpWI6cYfwashlmeZzHIwN/rIEL00EFA8u6Cbf4VbyrqZWYVF+xhE/RA5GVOWgV/brPUMQ==
X-Received: by 2002:a1c:7702:: with SMTP id t2mr8841656wmi.115.1621593456596;
        Fri, 21 May 2021 03:37:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:2a8:: with SMTP id l8ls160175wry.1.gmail; Fri, 21
 May 2021 03:37:35 -0700 (PDT)
X-Received: by 2002:adf:f386:: with SMTP id m6mr9120502wro.111.1621593455610;
        Fri, 21 May 2021 03:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593455; cv=none;
        d=google.com; s=arc-20160816;
        b=kXLg0bvehm69wY5+8KX9+44jarEY6YsWc+21/CwbqpfNFCX345A4FTHmFFciX99Pwy
         7qAK9V+eMnLuICwtCrj1Y/Kr2dfIzXFmI3Z12goEdaRlApwIzA9Dw/rC1ujGKfNsr6nS
         RchyM36Q4AleDUwHWxSAVnr1ghq/BSSwc3pbfPnPQohgFcLgZEUU+TRSdU2mIHSJQ/aI
         JJvCuInPv7hzpksMqDBZzwrPFx2DFuDJI6ufUxbgqJZHH9sYju3txRPqQpRSNdtTtHmD
         JwJ2Kuza16rJoh+GsBHqZXAZTRmC+aGC89fuEzk0xlxDXBCmJRWfuoaO+0Zj5VsI4eCN
         O0jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from;
        bh=8V0+7IQXQXxpy89yIzmAARkSoZ1+UCOaFvF1nIqmyo8=;
        b=dKCsbvAFcVV0OPN6qtYJ6ER7Pmmw2nbwyxvKriYPJ5AdpSkh1xDYpVTn48AFrr6SV2
         PNkcjgbwBo+SCI+RyyBtRtVNbLVFBEPVbH9XzEwJU10vVEvGo3a8m1Bs9H5crlS5m6eb
         t/i1oCPSipMUdDEfNBWNzLpn8JBgNNU46z6dyn9O8tRrZJYrFoQsUASkpqAM3BqZE09n
         rPN5vdEEky2T9rzIStePuYZaIPIv2zZOmNxoujXX/70PjMKIu4UL4nppIqWT4JbRwfHk
         GbFhK0PQcD/smpLaIyy+keBLqqpWawQ0AVhMwXpxUMO8vpbqPubyTS9qo1H0S+BN+shC
         WQsQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id d11si560882wmb.0.2021.05.21.03.37.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:37:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAbZ6n002678
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:35 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYc5032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:35 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 00/22] Updates, consolidations, QEMU 32-bit ARM support
Date: Fri, 21 May 2021 12:37:12 +0200
Message-Id: <cover.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
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

Hopefully the final round. Changes since v2:
- fixed MACCHIATObin boot (TF-A regression in last release)
- Isar update
- build-images usage update
- fix for mounting /boot on efi images

Jan

Jan Kiszka (22):
  Update Isar revision
  Update to kas 2.4
  Address shellcheck reports
  jailhouse: Enforce selection of latest version
  linux-jailhouse: Generalize armhf config
  customizations: Add QEMU ARM
  Hook up QEMU ARM support
  README: Add QEMU ARM support
  xradio: Update source and firmware
  non-root-initramfs: Update to buildroot 2021.02
  non-root-initramfs: Update ivshmem-demo
  non-root-initramfs: Purge buildroot download cache on cleanall
  wks files: Tune ext4 file systems to not be affected by y2038 issue
  trusted-firmware-a: Update to release 2.4
  trusted-firmware-a-ultra96: Add patches needed for 5.10 kernel
  linux-jailhouse[-rt], wilc: Switch to 5.10
  trusted-firmware-a-rpi4: Add patch to improve memory reservation
  rpi4: Move jailhouse reservation
  rpi4: Switch to upstream 5.10 kernel
  rpi-firmware-brcm80211: Update to latest revision 1:20190114-1+rpt10
  nuc6cay, ipc127e, hikey620: Fix wks files for newer Isar versions
  build-images: Document --rt

 .gitignore                                    |    1 -
 .gitlab-ci.yml                                |    2 +-
 README.md                                     |    4 +-
 build-images.sh                               |   44 +-
 conf/distro/jailhouse-demo.conf               |    4 +-
 .../machine/qemu-arm.conf                     |    6 +-
 conf/machine/rpi4.conf                        |    2 -
 .../multiconfig/qemu-arm-jailhouse-demo.conf  |    6 +-
 images.list                                   |    1 +
 ...de-for-building-custom-Trusted-Firmw.patch |  127 -
 kas-container                                 |  372 ++
 kas.yml                                       |   12 +-
 opt-latest.yml                                |    2 +-
 opt-rt.yml                                    |    2 +-
 .../rpi-firmware-brcm80211.bb                 |    4 +-
 .../rpi-firmware/files/debian/aliases.dts     |   30 +
 .../rpi-firmware/files/debian/cmdline.txt     |    2 +-
 .../rpi-firmware/files/debian/config.txt      |    2 +-
 .../rpi-firmware/files/debian/jailhouse.dts   |   17 +-
 .../files/debian/rpi-firmware.install         |    1 +
 recipes-bsp/rpi-firmware/files/rules          |    1 +
 ...20200819.bb => rpi-firmware_1.20210303.bb} |    2 +-
 ...se-abspath-to-dereference-BUILD_BASE.patch |  144 -
 ...-fix-gcc-warning-about-uninitialized.patch |   40 -
 ...ada-Add-missing-dependency-of-mrvl_f.patch |   33 +
 ...memreserve-pattern-for-rpi3-and-rpi4.patch |  214 +
 ...-errors-related-to-clock-gate-permis.patch |   45 +
 ...-error-codes-to-match-Linux-and-PMU-.patch |   71 +
 ...=> trusted-firmware-a-macchiatobin_2.4.bb} |   10 +-
 ... => trusted-firmware-a-pine64-plus_2.4.bb} |    0
 ..._2.3.bb => trusted-firmware-a-rpi4_2.4.bb} |    3 +
 ...3.bb => trusted-firmware-a-ultra96_2.4.bb} |    7 +-
 ...e-a_2.3.inc => trusted-firmware-a_2.4.inc} |    6 +-
 .../u-boot/u-boot-pine64-plus_2020.10.bb      |    2 +-
 .../u-boot/u-boot-ultra96-v1_2020.10.bb       |    2 +-
 .../files/.bash_history-espressobin           |    2 +-
 .../files/.bash_history-hikey620              |    2 +-
 .../files/.bash_history-macchiatobin          |    2 +-
 .../files/.bash_history-pine64-plus           |    2 +-
 ...istory-hikey620 => .bash_history-qemu-arm} |    8 +-
 .../files/.bash_history-qemu-arm64            |    2 +-
 .../customizations/files/.bash_history-rpi4   |    2 +-
 .../files/.bash_history-ultra96-v1            |    2 +-
 .../non-root-initramfs/files/amd64-config     | 3799 +---------------
 .../non-root-initramfs/files/arm64-config     | 3756 +---------------
 .../non-root-initramfs/files/armhf-config     | 3885 +----------------
 ....11.1.bb => non-root-initramfs_2021.02.bb} |   10 +-
 ...i4-Move-RAM-reservation-down-by-256-.patch |  257 ++
 recipes-jailhouse/jailhouse/jailhouse_0.12.bb |    1 +
 ...s-xilinx-Remove-dtsi-for-fixed-clock.patch |  237 +
 ...san-Separate-out-clk-related-data-to.patch |   99 -
 ...-xilinx-Add-the-clock-nodes-for-zynq.patch |  581 +++
 ...san-Add-sampling-clock-for-a-phy-to-.patch |  232 -
 ...03-arm64-zynqmp-Add-firmware-DT-node.patch |   37 -
 ...zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch |  109 -
 ...san-Add-support-to-set-clock-phase-d.patch |  160 -
 ...ware-xilinx-Add-SDIO-Tap-Delay-nodes.patch |   44 -
 ...san-Add-support-for-ZynqMP-Platform-.patch |  308 --
 ...irmware-xilinx-Add-DLL-reset-support.patch |   57 -
 ...san-Add-support-for-DLL-reset-for-Zy.patch |   99 -
 ...p-Add-ZynqMP-SDHCI-compatible-string.patch |   52 -
 ...san-Modified-SD-default-speed-to-19M.patch |   64 -
 ...d64_defconfig_5.4 => amd64_defconfig_5.10} |   18 +-
 ...m64_defconfig_5.4 => arm64_defconfig_5.10} |   36 +-
 ...ero_defconfig_5.4 => armhf_defconfig_5.10} |   24 +-
 .../linux/linux-jailhouse-rpi_5.4.59.bb       |   15 -
 .../linux/linux-jailhouse-rt_5.10.27-rt36.bb  |   17 +
 .../linux/linux-jailhouse-rt_5.4.58-rt35.bb   |   17 -
 .../linux/linux-jailhouse_5.10.31.bb          |   15 +
 recipes-kernel/linux/linux-jailhouse_5.10.inc |   27 +
 .../linux/linux-jailhouse_5.4.61.bb           |   15 -
 recipes-kernel/linux/linux-jailhouse_5.4.inc  |   38 -
 ...001-Make-compatible-with-5.8-kernels.patch |  191 +
 recipes-kernel/wilc/wilc_15.2-avnet.bb        |    1 +
 recipes-kernel/xradio/xradio.bb               |    6 +-
 scripts/make_release                          |   10 +-
 start-qemu.sh                                 |   37 +-
 wic/espressobin.wks                           |    2 +-
 wic/hikey620.wks                              |    6 +-
 wic/ipc127e.wks                               |    4 +-
 wic/macchiatobin.wks                          |    2 +-
 wic/nuc6cay.wks                               |    4 +-
 wic/orangepi-zero.wks                         |    2 +-
 wic/pine64-plus.wks                           |    2 +-
 wic/rpi4.wks                                  |    5 +-
 wic/ultra96.wks                               |    2 +-
 86 files changed, 2269 insertions(+), 13257 deletions(-)
 copy recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.3.bb => conf/machine/qemu-arm.conf (59%)
 copy recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.3.bb => conf/multiconfig/qemu-arm-jailhouse-demo.conf (59%)
 delete mode 100644 isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch
 create mode 100755 kas-container
 create mode 100644 recipes-bsp/rpi-firmware/files/debian/aliases.dts
 rename recipes-bsp/rpi-firmware/{rpi-firmware_1.20200819.bb => rpi-firmware_1.20210303.bb} (86%)
 delete mode 100644 recipes-bsp/trusted-firmware-a/files/0001-Use-abspath-to-dereference-BUILD_BASE.patch
 delete mode 100644 recipes-bsp/trusted-firmware-a/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch
 create mode 100644 recipes-bsp/trusted-firmware-a/files/0001-plat-marvell-armada-Add-missing-dependency-of-mrvl_f.patch
 create mode 100644 recipes-bsp/trusted-firmware-a/files/0001-rpi-Use-common-memreserve-pattern-for-rpi3-and-rpi4.patch
 create mode 100644 recipes-bsp/trusted-firmware-a/files/0001-zynqmp-pm-Filter-errors-related-to-clock-gate-permis.patch
 create mode 100644 recipes-bsp/trusted-firmware-a/files/0002-zynqmp-pm-update-error-codes-to-match-Linux-and-PMU-.patch
 rename recipes-bsp/trusted-firmware-a/{trusted-firmware-a-macchiatobin_2.3.bb => trusted-firmware-a-macchiatobin_2.4.bb} (74%)
 rename recipes-bsp/trusted-firmware-a/{trusted-firmware-a-pine64-plus_2.3.bb => trusted-firmware-a-pine64-plus_2.4.bb} (100%)
 rename recipes-bsp/trusted-firmware-a/{trusted-firmware-a-rpi4_2.3.bb => trusted-firmware-a-rpi4_2.4.bb} (72%)
 rename recipes-bsp/trusted-firmware-a/{trusted-firmware-a-ultra96_2.3.bb => trusted-firmware-a-ultra96_2.4.bb} (60%)
 rename recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.3.inc => trusted-firmware-a_2.4.inc} (65%)
 copy recipes-core/customizations/files/{.bash_history-hikey620 => .bash_history-qemu-arm} (62%)
 rename recipes-core/non-root-initramfs/{non-root-initramfs_2019.11.1.bb => non-root-initramfs_2021.02.bb} (64%)
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-configs-arm64-rpi4-Move-RAM-reservation-down-by-256-.patch
 create mode 100644 recipes-kernel/linux/files/0001-Revert-arm64-dts-xilinx-Remove-dtsi-for-fixed-clock.patch
 delete mode 100644 recipes-kernel/linux/files/0001-mmc-sdhci-of-arasan-Separate-out-clk-related-data-to.patch
 create mode 100644 recipes-kernel/linux/files/0002-Revert-arm64-dts-xilinx-Add-the-clock-nodes-for-zynq.patch
 delete mode 100644 recipes-kernel/linux/files/0002-mmc-sdhci-of-arasan-Add-sampling-clock-for-a-phy-to-.patch
 delete mode 100644 recipes-kernel/linux/files/0003-arm64-zynqmp-Add-firmware-DT-node.patch
 delete mode 100644 recipes-kernel/linux/files/0004-firmware-zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch
 delete mode 100644 recipes-kernel/linux/files/0005-mmc-sdhci-of-arasan-Add-support-to-set-clock-phase-d.patch
 delete mode 100644 recipes-kernel/linux/files/0006-firmware-xilinx-Add-SDIO-Tap-Delay-nodes.patch
 delete mode 100644 recipes-kernel/linux/files/0007-mmc-sdhci-of-arasan-Add-support-for-ZynqMP-Platform-.patch
 delete mode 100644 recipes-kernel/linux/files/0008-firmware-xilinx-Add-DLL-reset-support.patch
 delete mode 100644 recipes-kernel/linux/files/0009-mmc-sdhci-of-arasan-Add-support-for-DLL-reset-for-Zy.patch
 delete mode 100644 recipes-kernel/linux/files/0010-arm64-zynqmp-Add-ZynqMP-SDHCI-compatible-string.patch
 delete mode 100644 recipes-kernel/linux/files/0011-mmc-sdhci-of-arasan-Modified-SD-default-speed-to-19M.patch
 rename recipes-kernel/linux/files/{amd64_defconfig_5.4 => amd64_defconfig_5.10} (98%)
 rename recipes-kernel/linux/files/{arm64_defconfig_5.4 => arm64_defconfig_5.10} (92%)
 rename recipes-kernel/linux/files/{orangepi-zero_defconfig_5.4 => armhf_defconfig_5.10} (95%)
 delete mode 100644 recipes-kernel/linux/linux-jailhouse-rpi_5.4.59.bb
 create mode 100644 recipes-kernel/linux/linux-jailhouse-rt_5.10.27-rt36.bb
 delete mode 100644 recipes-kernel/linux/linux-jailhouse-rt_5.4.58-rt35.bb
 create mode 100644 recipes-kernel/linux/linux-jailhouse_5.10.31.bb
 create mode 100644 recipes-kernel/linux/linux-jailhouse_5.10.inc
 delete mode 100644 recipes-kernel/linux/linux-jailhouse_5.4.61.bb
 delete mode 100644 recipes-kernel/linux/linux-jailhouse_5.4.inc
 create mode 100644 recipes-kernel/wilc/files/0001-Make-compatible-with-5.8-kernels.patch

-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1621593454.git.jan.kiszka%40siemens.com.
