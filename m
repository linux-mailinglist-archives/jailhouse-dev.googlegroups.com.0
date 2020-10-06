Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK7G575QKGQEBEKDLSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9E32844DC
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:31:40 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id v5sf4874981wrr.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:31:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958700; cv=pass;
        d=google.com; s=arc-20160816;
        b=btLuEK07bdZlr+se/f5eL6MyW6//2YAr6sH/QX1ZnGOr4yJwQ3DEWss0g3s57y0W2i
         ukqTukUg3WAeN3d6/VVsS8wI6zhprNeozLH9k4mEviom7d0sXHKCX/dATqFM8YyzriNq
         K0DkttGG1bPhifriWJ+gWa4zTPsRs4tiNk2RMn5vnffHMz1DqZPtY2aGUCoLuJIqU8QM
         vSlu26AVCMT3p0i4g7xN+AuCBGhe+mwSxU6vH5VEdAxDa3U1oYaBFVgdjHminsSqTMWm
         BxXeAWmFDF5celfSyyUuyAhJ7a5hmAWoBF+Lddki/jkP3eo13Kainh0XqtRs0CAkEsiC
         vSuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=I/fzbHeEl7AgIwLLBXlEZduwSfC5jebQCh+zIdE/CuI=;
        b=I96+9+v63a/F8ObzlXMcQjdsywlJlc41eVz/HrKrCPcfHGa7/oTpE6lvlLKtp435HL
         EPNlZsc88Xt4B1Jai/reGbT1gFgvrhS2hrxWcxxl3DLBhdeeqE3ebFC98N8VLvEaWqGU
         RJ4UfoXVfM8zM4dHN6FU6WFDOS5aDm4OnncDcf02sHSLoBQRaggf3NjxcYr1FIkRVsdO
         CEfFUzwV3snbRBWfqlDKUkd7KDigyQoWmUIWkJ8S9U6dynbbQD0AypjDjmWeiVuNfwit
         NHusnOgeha15/jREoCq1axXgmaORmwqtKb3xMFtNwPIToCDq34BW7aHLePFJsGDqRdYt
         et7w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=I/fzbHeEl7AgIwLLBXlEZduwSfC5jebQCh+zIdE/CuI=;
        b=n+Tn1p7OQHMuyW1EjcS+OAEPuiHeLYmRf6+gdQEkknOb2o/Kt3URPuFu1/6cdgb8h+
         G5KUD1y66K+uBWvU8QEHgWvvWZVB2zXpNxc09e0vp0KIkMk7F+MXls4cUeqxUwXAxZCO
         t4R+fBGdhiEYenqF+snLfS3PKOAiNWZVT0SW5N5K/Z1Mi3fNsN8sxY4dGgUkV/LS/965
         qjfX+NHe9D4P0kst35qf0HdA0wZWibN/WXPptaEC7ruFydDsRuQRuF6SNkOPv7XjsLrM
         K0mfiFNMa8isrNF/IQvcWQOqzTI7Gs7XDHMg+JSQ/WcMvqT+cOH/eqItiBE3VpvCxURw
         0MoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=I/fzbHeEl7AgIwLLBXlEZduwSfC5jebQCh+zIdE/CuI=;
        b=tw/118RM8kdT3stsUksH0jTyUxhXzfitb8ArE3hJJlNPvSAygDvF4Y1Csi1ZRl7dDK
         5Lf7aGd9ygzOpHcL1KHm54Uw+nHmMMtFcd7cFduUPl/zNiaMxhvYGY0Lhi1GHTbMmdYC
         Sh3w3p30d6BifTjyWEiAfHVQM3EXpWzCQ4TimFA9u82PyGtx7N/vEC5UEWs7Trr5Coqh
         kEDyL4UzAxY12w5hZgqpI8Qw0TcqyuoGovZ66EKsepY2LUNSVn0Cvs24PuCWJhN60qaz
         bdzAumiXMtp6e5/cQnEzRgNIc6Vq4gUH1xFo6ywlm7yBOzQAzHpep+//pEU4xzHtPjKn
         dl4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532v8g6KsWu2yZFhiIXsGG8OzM8RqWZADXQ804AhPffcTE8hveE5
	wbNZAh2XWpd27tDBDB41PQc=
X-Google-Smtp-Source: ABdhPJykJg4RzCUo2MV+xqzse/onrCoFBA1RcccwWnBv2Znm0M1ZuysJeiHhFndc7cb7Jjwok/VPaQ==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr2584014wmp.187.1601958700011;
        Mon, 05 Oct 2020 21:31:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:98d8:: with SMTP id a207ls527561wme.2.canary-gmail; Mon,
 05 Oct 2020 21:31:38 -0700 (PDT)
X-Received: by 2002:a1c:1f89:: with SMTP id f131mr2692815wmf.10.1601958698731;
        Mon, 05 Oct 2020 21:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958698; cv=none;
        d=google.com; s=arc-20160816;
        b=JVfTPsJPQmnpef4ofTzpB70pzb2c5rKmU3Z+8D3swkiqVZsQUZY+a7tvSBS362hKb3
         9rRAS71AJ8QX0OZ6MCtH6U+cgu7t9wJtCqX68f6cC8wU71H/vYbskPCFYAhbRSH4i+hg
         PzPSBD7Yih/RLRquO+/zVL0NVCUVwGv2cQGoDdHkBOzI7BwX+zCoVQ4R8DTYB7/MBtem
         CpQphWJyexdmOkYeVRNGmArFypVA6xVOChjasHXH310V3hp4wof3xsdOta5JhpuJBE0M
         2nrf3Nxv5RxTeOSerdXL+heT4tHQqtTws+/ujWxDMssVjLUDVdUFehRK4Ug+58IMa0ad
         ayyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=gaQqmuNm0ewhV6OvFWfWgRRNIgA3rBI9Qkb2Lu/ts64=;
        b=AnShdvHPMTT/z2hnKJ/P2pMiIUvOhEdAl+G36VAzzsUR2lK2m+/ysWsboM/Am/CF1a
         DiCtjaLux03gKBuhvp6scod50AYq2gwnK7dD2eWsSYQYyZiqwje0wG/5vLI3mUekbXtL
         /i0Io6y62Hevhytp2p/8GL7LuQUYFiVPAxw2PtlgJyWJf/IKktygfI8OiR7j4v4t1pkb
         SA6xB7uVWkqpza1oTLOpCPLCC87BTeIPut374uY6Jz4oKUoYbJS9cnyN6eE5aNbQe5Xe
         KvgKfGs1e54xGGsttqISrDCEuCaDr+pft12J6gQ3TrlvNuyDf4DMlwUfDcndUzMYFDsr
         bVzQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id c144si49066wme.2.2020.10.05.21.31.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:31:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0964Vbfe019984
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Oct 2020 06:31:37 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY7k008537;
	Tue, 6 Oct 2020 06:31:36 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [jh-images][PATCH v2 00/19] Add Ultra96 v2, refactor/update TF-A integration
Date: Tue,  6 Oct 2020 06:31:15 +0200
Message-Id: <cover.1601958694.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

Changes in v2:
 - Update to U-Boot 2020.10, apparently fixing MACCHIATObin

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
 recipes-bsp/u-boot/u-boot-2020.10.inc         |  17 +
 .../u-boot-macchiatobin_2019.10-atf2.2.bb     |  43 ---
 .../u-boot/u-boot-macchiatobin_2020.10.bb     |   7 +-
 .../u-boot-pine64-plus_2019.10-atf2.2.bb      |  33 --
 .../u-boot/u-boot-pine64-plus_2020.10.bb      |  25 ++
 .../u-boot/u-boot-ultra96-v1_2020.10.bb       |  40 +++
 .../u-boot/u-boot-ultra96-v2_2020.10.bb       |   1 +
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
 create mode 100644 recipes-bsp/u-boot/u-boot-2020.10.inc
 delete mode 100644 recipes-bsp/u-boot/u-boot-macchiatobin_2019.10-atf2.2.bb
 rename conf/multiconfig/ultra96-jailhouse-demo.conf => recipes-bsp/u-boot/u-boot-macchiatobin_2020.10.bb (51%)
 delete mode 100644 recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
 create mode 100644 recipes-bsp/u-boot/u-boot-pine64-plus_2020.10.bb
 create mode 100644 recipes-bsp/u-boot/u-boot-ultra96-v1_2020.10.bb
 create mode 120000 recipes-bsp/u-boot/u-boot-ultra96-v2_2020.10.bb
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1601958694.git.jan.kiszka%40siemens.com.
