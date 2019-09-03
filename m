Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPUCXDVQKGQENJWZ5UI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 697A4A60E8
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 07:59:27 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id b11sf3878811wmj.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 22:59:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567490367; cv=pass;
        d=google.com; s=arc-20160816;
        b=CrR/HSZes2y114IRj92SkEHOYFGtiuxDoyMKUbVq5okZ6LZBA3LEVzmlyUFVz9Zv7+
         eawhIzjGnDPZXKd5pM7bHUFSJTWsNgItWZgEjCrtsEqhptRnse+FD7ZIhQS3jZMiBgHj
         VM6s7rNCZm5AmLPJ68L4l+ZjVLKvW0saHyKcK4xFIFiztE54/y8+CuJxkQt3iWVSR0w+
         +NDQ9I7mfJy/Dh6/mGtmnxUmdCDWK4+Kp7hBF1MYcSzW8JddLqo1CgnV6HRkSTAzZelZ
         0zMWPVLrY77cnMndIwBBobAHBfrQybvyOGztvk72GhJVKNF9sM9WtJf55FVe4yx+fqho
         2fJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature;
        bh=D1VZQAMZR4/ynfrkDR40t0FohU6dpB58R/EYJF2qj1A=;
        b=exJ6Mw2qvJcD0Kc9LGm6ceEJSCfRQPsIAR1OCMz+VflHWuCrW4VlQmeU3uYdHzfpqj
         GbSwfHJOBdPTz05BOpewoIQPpwjFUaVmSB4pMpcyERMKslhhMBuAjFZYUevzLB+/ULG6
         7/fG+9vP1XeUEw8U9K6oDoZdDvHcu8cRshVJUfWEmSv2g6vd9uDAcpzDvXCGIlesy+Id
         xyA9IN9YMcIwC+8WCpN19pWulhtUrjytJTDH3l81S/xNQcA9CtgV/zfdgnAmWpQGLNdI
         uVtva3ZC+/69BilwloBi0T72icqK1TJZYkIbcBAoMbL7xau1R3sq+PcotmuPA5o7jGb4
         PZAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=D1VZQAMZR4/ynfrkDR40t0FohU6dpB58R/EYJF2qj1A=;
        b=S3lrOX31Z+OOoMdKveFl45E5RePtB8Z87wYWXneA2MxXtxW2yVDR9WIwE/uyCZOErg
         2uuoaBYl0gF3cmfvP6e2qeI+rZVtVQR/0215RejPm0EB+9EteuqWChZgWBaw9j2ZcCcD
         uXEPQDguARmDvw9F6MLFWnJ4ktXtJ/MihGJSgGyBMRme8TBB8Qlf+Cl39rNn7mXtMsmH
         uyWRcE8ZHjiiJ4KBbkj68JgTVJ8+yBYjBXygfR023D07L8s2p8evTJYjEaWQ1D9IK4A+
         7r/3nk0Cyo94D2+zYd5f38A/tjT8G4ITnQ5H5fzt4EzyF+nvm5hUWbL+EOG0EUi2xROa
         2g9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=D1VZQAMZR4/ynfrkDR40t0FohU6dpB58R/EYJF2qj1A=;
        b=VtKM/W00olViiz5dVqQ6SN9BOE2r4srwhzhwFWKkWbnG2kY1aim6eGuHHmbfoDh5IB
         0MX3ZUvw9XPzA7LfrYFEs4osCGQgvEBPciJwCG3JuJVP8e3A9dHpdxWoBEBQnbycRPSm
         okpnrcswoXkiJ1824uUEKEj7ez8vsp596iVtC9bBHMwtYbWBSNuF1HlMnm7V1LiIyTUO
         crPCD7J7cOtN259pGmsZk948NavuOvkVtopV0x6DW1u7y9FJ5Ir0ItH1dlXbu7w58JtO
         V0Opo6ZszMWVqN0pqgL85fESOQllNDSeiUCOeZY/+wpZHN4Kj8JnyqZngpXlZZZhopo1
         ydOg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWN3eblxMGWa0Dc9mN03NeVpgLe5MDsPA92bbgMK/+xMwTtJ2qh
	tgslb4MdIhx/3KRLkcX0XFk=
X-Google-Smtp-Source: APXvYqyRbi1EAWVkqKBihSbNLpZFt3DIR+p+I8c9c3ON+1yXPmZ3br3w2Zl4U4EW9tAdAic4WWw63Q==
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr6258495wrw.353.1567490367082;
        Mon, 02 Sep 2019 22:59:27 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9bd7:: with SMTP id e23ls4582746wrc.7.gmail; Mon, 02 Sep
 2019 22:59:26 -0700 (PDT)
X-Received: by 2002:adf:f20f:: with SMTP id p15mr4808844wro.17.1567490366174;
        Mon, 02 Sep 2019 22:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567490366; cv=none;
        d=google.com; s=arc-20160816;
        b=i6U6ArG400w5EUexJ+b/7HkUir3tY01s4M/Z4CSI4noskLkSCojHpC5C5gftSjR5T6
         KFcL+ZtGqd8dU94a9s551S4DUTnXzY0Dv3WRh5T4f8k6lmoiX3Aash1woWrxFf7/LofZ
         RHEh3aaaEmTQ8nb0BP9fCnT4eaRSVi2mA1hf0/aKu230/NS5D2NTzmzhBVplVgI0KqR2
         mcON+uj4xEsBtldXvghDQN0nx9bWPgujMV2QrxV3AjKHxN65PJopNcD5OP03tbWSM3hX
         aI4z+XgnDG2BPHQxWUzvTYiOpCKuKpa5sr2y/IyGh3uu8eN7yS4o2jThCyImSBeEsqvu
         RJ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from;
        bh=6a5WveZiaYqlLDl6T8rVYx2XLlVXrv6WBKHVBHyPTjc=;
        b=X3kLZArm973y5QdvpjmbExtJHNenSR4iw7tuUhHFWW9R3wkEVUVzVpmpNY/UuQDp8v
         JXT2mEvZeI9tvZ9oV3c/bOmHTcjCFpf7D8jixsYv9dKNKe4/IoqTNQlYZ9LmUtb0PHp0
         V0AwfcgJVpRpoKZbtFoJKpgyls7ekUqjEv0OGF5hDU8Ttlej35/JXInx8tGFE6CRl80J
         A0zJqZWeJ1hxeTWULW/1WGqDDBseOfO7t0H1kK/YNtjtr7KIA+KAM1+foOhB0VO5s2sB
         Q7aexQUbfkQQyCk6LFfwf+eQ2uCPyuhPtIhwN6DSOf7SeHHRB5SaEWFKPP72cZADus85
         ruMQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id s194si973903wme.2.2019.09.02.22.59.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 22:59:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x835xPiD009921
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:26 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.40.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x835xPkN010486
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:25 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 00/13] Update to Buster, U-Boot updates, builder updates, cleanups
Date: Tue,  3 Sep 2019 07:59:12 +0200
Message-Id: <cover.1567490365.git.jan.kiszka@siemens.com>
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

The primary contribution is the update of the images to Buster. That
requires some U-Boot updates to unbreak the build with gcc 8. We also
switch the ZynqMP PMU firmware to a self-built version at this time,
allowing an update at the price of a longer build of the Ultra96 target.
The other board affected by the U-Boot/ATF update is the MACCHIATObin.

Along this, a lot of cleanups are applied to use latest Isar features.
There is one known issue with the Isar build affecting this layer, but
it only matters when physical ARM64 targets are built in parallel. This
will be addressed later when Isar picked up all pending patches.

Jan

Jan Kiszka (13):
  build-images: Drop --docker-args
  build-images: Use latest kas-docker internally
  u-boot-ultra96: Update to 2019.07 and ATF 2.1
  Add crosstool-based Microblaze toolchain
  Add recipe for building ZynqMP PMU firmware
  u-boot-ultra96: Switch to self-built PMU firmware
  u-boot-macchiatobin: Update to 2019.09 and ATF 2.1
  jailhouse: Use template mechanism for Debian control files
  non-root-initramfs: Autogenerate changelog
  Update Isar revision
  demo-image: Add dbus package
  u-boot-macchiatobin: Add build fix for mv-ddr-marvell
  Update to Debian buster

 .gitignore                                         |  1 +
 build-images.sh                                    | 41 +++++--------
 conf/distro/jailhouse-demo.conf                    |  2 +-
 conf/machine/orangepi-zero.conf                    |  3 -
 conf/machine/preferences.orangepi-zero.conf        |  7 ---
 kas.yml                                            |  2 +-
 ...rmware_1.6.inc => arm-trusted-firmware_2.1.inc} |  6 +-
 ...t-xilinx-zynqmp-Initialize-IPI-table-from.patch | 68 ++++++++++++++++++++++
 ...tools-Fix-broken-object-compilation-rules.patch | 59 -------------------
 ...s-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch | 31 ++++++++++
 ...ining-fix-gcc-warning-about-uninitialized.patch | 40 +++++++++++++
 .../files/0001-zynqmp-Downgrade-to-PMUFW-0.3.patch | 32 ----------
 recipes-bsp/u-boot/files/macchiatobin-rules        |  3 +-
 .../u-boot/files/{ultra96.bif => ultra96.bif.tmpl} |  4 +-
 ....6.bb => u-boot-macchiatobin_2019.07-atf2.1.bb} | 11 ++--
 ...-atf1.6.bb => u-boot-ultra96_2019.07-atf2.1.bb} | 16 ++---
 recipes-bsp/zynqmp-pmufw/files/debian/compat       |  1 +
 recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl | 10 ++++
 recipes-bsp/zynqmp-pmufw/files/debian/rules        | 24 ++++++++
 recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb    | 30 ++++++++++
 recipes-core/images/demo-image.bb                  |  2 +-
 .../non-root-initramfs/files/debian/changelog      |  5 --
 .../non-root-initramfs/files/debian/control        |  3 +-
 recipes-core/non-root-initramfs/files/debian/rules | 10 +---
 .../non-root-initramfs_2019.02.2.bb                |  2 +-
 .../crosstool-ng-microblaze_1.24.0.bb              | 32 ++++++++++
 .../crosstool-ng-microblaze/files/debian/compat    |  1 +
 .../files/debian/control.tmpl                      | 13 +++++
 .../crosstool-ng-microblaze/files/debian/rules     | 37 ++++++++++++
 .../crosstool-ng-microblaze/files/defconfig        | 10 ++++
 .../files/0001-arm-Fix-build-with-gcc-8.patch      | 56 ++++++++++++++++++
 recipes-jailhouse/jailhouse/files/debian/changelog |  5 --
 recipes-jailhouse/jailhouse/files/debian/control   | 13 -----
 .../jailhouse/files/debian/control.tmpl            | 13 +++++
 recipes-jailhouse/jailhouse/jailhouse.inc          |  6 +-
 recipes-jailhouse/jailhouse/jailhouse_0.11.bb      |  3 +-
 36 files changed, 416 insertions(+), 186 deletions(-)
 delete mode 100644 conf/machine/preferences.orangepi-zero.conf
 rename recipes-bsp/arm-trusted-firmware/{arm-trusted-firmware_1.6.inc => arm-trusted-firmware_2.1.inc} (57%)
 create mode 100644 recipes-bsp/arm-trusted-firmware/files/0001-plat-xilinx-zynqmp-Initialize-IPI-table-from.patch
 delete mode 100644 recipes-bsp/arm-trusted-firmware/files/0001-tools-Fix-broken-object-compilation-rules.patch
 create mode 100644 recipes-bsp/u-boot/files/0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch
 create mode 100644 recipes-bsp/u-boot/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch
 delete mode 100644 recipes-bsp/u-boot/files/0001-zynqmp-Downgrade-to-PMUFW-0.3.patch
 rename recipes-bsp/u-boot/files/{ultra96.bif => ultra96.bif.tmpl} (77%)
 rename recipes-bsp/u-boot/{u-boot-macchiatobin_2018.09-atf1.6.bb => u-boot-macchiatobin_2019.07-atf2.1.bb} (73%)
 rename recipes-bsp/u-boot/{u-boot-ultra96_2019.01-atf1.6.bb => u-boot-ultra96_2019.07-atf2.1.bb} (74%)
 create mode 100644 recipes-bsp/zynqmp-pmufw/files/debian/compat
 create mode 100644 recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl
 create mode 100755 recipes-bsp/zynqmp-pmufw/files/debian/rules
 create mode 100644 recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
 delete mode 100644 recipes-core/non-root-initramfs/files/debian/changelog
 create mode 100644 recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb
 create mode 100644 recipes-devtools/crosstool-ng-microblaze/files/debian/compat
 create mode 100644 recipes-devtools/crosstool-ng-microblaze/files/debian/control.tmpl
 create mode 100755 recipes-devtools/crosstool-ng-microblaze/files/debian/rules
 create mode 100644 recipes-devtools/crosstool-ng-microblaze/files/defconfig
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-arm-Fix-build-with-gcc-8.patch
 delete mode 100644 recipes-jailhouse/jailhouse/files/debian/changelog
 delete mode 100644 recipes-jailhouse/jailhouse/files/debian/control
 create mode 100644 recipes-jailhouse/jailhouse/files/debian/control.tmpl

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1567490365.git.jan.kiszka%40siemens.com.
