Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB3FYZTYAKGQEM5PGIAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9C213117C
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 12:39:26 +0100 (CET)
Received: by mail-ot1-x337.google.com with SMTP id v7sf17267915otr.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 03:39:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578310765; cv=pass;
        d=google.com; s=arc-20160816;
        b=n7qYgbrlPS2ciksb4vjenu4lAzlfyu9wDSB0LgJ21qpWzLi2TkiWNCh3qIvdMsvLRF
         8qkaJ4FsHAlnRCLfca9sLIUkXjqpUNb9HlYevgRIRUvTRCLHMhlBOE4ofh8opyvaIylC
         lCP2GwQXKNSf9aIUx+7H6V0LywJuhfuE/jCBoQOWm7vtVMXlDJwql3rh3KiasNc3wWTZ
         CZ84XRHgiRffE9GBEYsESA4syc7AaIKKLuTuFCi5wiGwfEeJhOwP9DIPVWAF8+TIQ85j
         9XBHBe7BC7oX9+rDMC2sRaHptOnuYV2rQcF7pKG5xBE/sIu0Xvhyno/6Ti1NUwF6Fwtd
         /Z7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=0nMJkV0g2hnPvpm/kFFGd5BI4HTfOisrmS+opDJRBNU=;
        b=gKy/Z0tLoZ0bRfcUXkMIDVNjhsozJ7FuVPY/trslnzJroDSlinuvxd+EZMVFF/fNiM
         fPAy0TZNqf26OZE0lWZbzm0VkGH1uvyO943Z8LYxVshlSx1MvZHvCFMTlcOyR39dB9GZ
         S16J3YL9TL9IVidGPZHmND9wx01HdpYisVP27tHORTFjaXEvkCXd5jSIfN5m0eO28g9m
         LcjOOovljzWf0iol0K0Jyni+CH/Zoxlu3qW1hnYJeWglglxjM2WJQuJXQYICv4UFrIqd
         mOStD7+0mmWX/e9r3YX295VZNABfWCKkxyQsLSHamCOI5TB4HcatdfUQ0gOGymGJ7yeP
         A/WA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=CiSs4E0X;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0nMJkV0g2hnPvpm/kFFGd5BI4HTfOisrmS+opDJRBNU=;
        b=DrQvwE3OR37Elpop0wM3TjKPVNg/x2dv+9mKOo5SJSIfA3AYoEWGXp4cpZRs21ss2m
         qlQ5YTZXhpwR2txhkBjoalq922IgszcAfNdSmdlorepFqblrXGgWpv7AH4X8fAtisZDu
         Y1F9/ptaobgQuEIFKvGJTsV6UI2sk1kLdXucyXD36JksPuDUig2O0sj0l12G/xKiMqBi
         w44K1KsnfGlofPnzovll5UEmL/b0CMkAd24I6PaGMYI2Tl2p72HYtRIiItWJwafnsVIB
         WR8uLfIglpZI2ObRMJHMKDM5l0utuuB3vxTYbw+sSwJTwRXm+FpS673J3axSxJorXlCR
         37yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0nMJkV0g2hnPvpm/kFFGd5BI4HTfOisrmS+opDJRBNU=;
        b=CC6M8/QQNMEiJWcL76xQf0/ijbGvox69ioZRv6b3nOHJS7FcJgQaUvEvqWzBxM+oVD
         g9VzM0wsxS6G4RSuEVM/wcLgEEo9aeEYIy4wXBU8gXDWq760yQTwKYGh3oZ2jeSmVEnL
         tGCd5bMNu9MYnl5jPq5fGn0Xr95ZyOWGFfqZfsoemExdF29To2H47FRY4RcXRlCkmnU9
         FURy1A+t2CWaW2nJMBOMPug8QxwxR6Nz+twftNsTFdJ15EwbwheBdcV2/jx6c0iD2hdz
         TsMyn2gvcEU73CsnpXXaffsfU9u45/eQBJt8C7NWqg1WukkRe04ckF2pgvzVCBjMwQMj
         v3lA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXO7dz3dcOSCp7zgg/9zudn3Z3Yi5A3dr7H3Nx1AQhjz7eAP8nZ
	TMFQtYdn/Z8Sf8SO3p2TQtM=
X-Google-Smtp-Source: APXvYqxIKgCLEYjVageIP1/UQ3kIsMNfjm2sSM4q19g5o2lyc2CT8zCJVog3Vvn28srTQqK3KScihw==
X-Received: by 2002:a05:6830:10a:: with SMTP id i10mr9632341otp.365.1578310765036;
        Mon, 06 Jan 2020 03:39:25 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:4a4:: with SMTP id l4ls734418otd.11.gmail; Mon, 06
 Jan 2020 03:39:24 -0800 (PST)
X-Received: by 2002:a9d:7b4a:: with SMTP id f10mr6204012oto.4.1578310764297;
        Mon, 06 Jan 2020 03:39:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578310764; cv=none;
        d=google.com; s=arc-20160816;
        b=g6CkRtgWDovlFa/+867VDz6hIfdeXtrVffn9Gh2tJXup1mHDN7ZejX0mitWh2Q9jm7
         p+J93uqMmF2uoJUz4syF1byqaJt8/7xdnQtYjLbNzztk0vK1VqSmjWu8MSowqykNrxCJ
         4679zYCFm9FjLFfx5sFWoQKr1Lnmak4OXIwzC7N9mALes1WFwmk4wndI9JaHaw32tS+a
         TW3HuCM9XjRo0lqa7VfCPqF1r2HF2w+/i36TAfTYxyXGs4Pm+XwGFKUXo2oVoVNImDq6
         pIuh7M2GfMZ+gBxAE95qcZgxZlxeO0l3Pq43KG+ijCvT0sbm///lLVe2qW2UxTuvKrZq
         thxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=MCmqBv31KZGlIkw3wJHNDW2j95A5sm6KhISqPozfFJM=;
        b=sNJuwTqplPCfG6i45eYZLqOiEfA/9PL6P18yrlAXOsTZR3BbmotytZYx89JO5liXAV
         AhbdNpIEj6SLBLheHwrI3bNkpSiqy91fz7cAQAQP0c0r2OrwZ7UdDMgkbQAwMFdxE8x6
         q1OkCl/2v+FRAnd1uLyzPyMCuriWeE7u59Y0Gi3LU7RT2peambpa56TVvCWLZBbcswBq
         WigYqRRIHaR9zUeZkLBUusQ2DN4LH5m7TPPKTMVp7yJW96UP0VKocQbvHw1Ivsf7y/FF
         Qxz4LZVQU45PqXsHSUs4lrnqUldpULHON1Vu/XNB0wNC8Bi1YVruuBO+3oTUdazZe4XN
         Sjng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=CiSs4E0X;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-5.smtp.github.com (out-5.smtp.github.com. [192.30.252.196])
        by gmr-mx.google.com with ESMTPS id w63si2257963oif.2.2020.01.06.03.39.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 03:39:24 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) client-ip=192.30.252.196;
Date: Mon, 06 Jan 2020 03:39:23 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/95c27c-c316cc@github.com>
Subject: [siemens/jailhouse] a76e76: x86: vtd: Protect against invalid IQT
 register values
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=CiSs4E0X;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.196 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: a76e766bae0dbe2118f9e36e605cfdbc66ba04fa
      https://github.com/siemens/jailhouse/commit/a76e766bae0dbe2118f9e36e605cfdbc66ba04fa
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/arch/x86/vtd.c

  Log Message:
  -----------
  x86: vtd: Protect against invalid IQT register values

Avoid that we may loop infinitely in case the root cell provides an
invalid IQT with RsvdZ bits set and also all queue entries on the page
valid. While this would only affect the root cell, it's also more
future-proof to ignore the other bits.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fd53ad43967498d818069c55b08cac7c405a1517
      https://github.com/siemens/jailhouse/commit/fd53ad43967498d818069c55b08cac7c405a1517
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/arch/x86/vtd.c
    M hypervisor/control.c
    M hypervisor/mmio.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  core: Use PAGE_OFFS_MASK consistently

Replace remaining ~PAGE_MASK patterns with the more readable
PAGE_OFFS_MASK.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: aff91500baa493a7607e47be3a3f6cdbd8135cae
      https://github.com/siemens/jailhouse/commit/aff91500baa493a7607e47be3a3f6cdbd8135cae
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Use Siemens-provided device ID

We deviated too much from the original ivshmem, and we will even more.
Therefore, Siemens reserved the device ID 4106h from its pool under the
PCI vendor ID 110Ah. Start using it.

Note though that the device interface is not yet finalized under this
ID. Every driver developing against it must be prepared to see a moving
target, under Jailhouse as well as other implementations, specifically
for QEMU.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8148a2502cff4b4a009be81ac33ed94edbdf3729
      https://github.com/siemens/jailhouse/commit/8148a2502cff4b4a009be81ac33ed94edbdf3729
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/ivshmem.h
    M hypervisor/arch/x86/include/asm/ivshmem.h
    M scripts/header_check

  Log Message:
  -----------
  core: Restrict asm/ivshmem.h to inclusion by jailhouse/ivshmem.h

The asm header will gain a dependency on the generic one and, thus,
should no longer be considered for direct inclusion. Adjust the header
check accordingly.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c2c1b65e1525139e7560a79be0cad84742a455ea
      https://github.com/siemens/jailhouse/commit/c2c1b65e1525139e7560a79be0cad84742a455ea
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Derive MMIO register region size from cell config

The BAR mask encodes the size of a PCI device resource. Use this to
allow a target-dependent setting via the cell configuration so that
alignment to the cell's page size becomes feasible. This will enable the
cell OS to map the MMIO region as a whole into user space.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2aa7465e260b04d1f133aaa88e1c66af9a97f977
      https://github.com/siemens/jailhouse/commit/2aa7465e260b04d1f133aaa88e1c66af9a97f977
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Enable unprivileged MMIO register access

Make sure that unsupported accesses to the MMIO register region do not
raise immediate panic. We should rather ignore them. This allows the
cell OS to hand out the region to unprivileged users.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5ac5b95f6c044722cc9d8cefeaedd6aa83c46068
      https://github.com/siemens/jailhouse/commit/5ac5b95f6c044722cc9d8cefeaedd6aa83c46068
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/bananapi.c
    M configs/arm/emtrion-rzg1e-linux-demo.c
    M configs/arm/emtrion-rzg1e.c
    M configs/arm/emtrion-rzg1h-linux-demo.c
    M configs/arm/emtrion-rzg1h.c
    M configs/arm/emtrion-rzg1m-linux-demo.c
    M configs/arm/emtrion-rzg1m.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm/jetson-tk1.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/espressobin.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/hikey.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/jetson-tx1.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-am654-idk.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/macchiatobin.c
    M configs/arm64/miriac-sbc-ls1046a-linux-demo.c
    M configs/arm64/miriac-sbc-ls1046a.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  configs: Use constants for bar_mask of ivshmem devices

There are two possible settings for this parameter, one for INTx and one
for MSI-X. Both are invariant for all archs, so let's pull them out of
the config files. That will also simplify upcoming changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: deb9716d0eeebe7a4eb04df4e74d59e390dfe1f4
      https://github.com/siemens/jailhouse/commit/deb9716d0eeebe7a4eb04df4e74d59e390dfe1f4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  core: ivshmem: Convert MMIO register region to 4K and 32-bit

Page-alignment is required so that the cell OS can map the region as a
whole to its user space. If a cell may use larger minimal page sizes,
the mask for BAR 0 has to be adjusted accordingly. For now we assume all
are on 4K.

While at it, reduce the MMIO region to 32-bit which saves one BAR.
64-bit was needlessly wasteful.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7a90de7b67985977ec6c905a6a3ad43232b53f21
      https://github.com/siemens/jailhouse/commit/7a90de7b67985977ec6c905a6a3ad43232b53f21
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/include/jailhouse/pci.h
    M hypervisor/ivshmem.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  core: ivshmem: Move MSI-X region into 32-bit BAR1

Compact the BAR usage and also reduce the MSI-X region to 32-bit again -
there is no need for 64-bit.

As both the MMIO register and the MSI-X region are now 32-bit, convert
their internal representation in ivshmem_endpoint to an u32 array.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2e499d8cb509ab2bb7f0db2f345ca526f1ff134a
      https://github.com/siemens/jailhouse/commit/2e499d8cb509ab2bb7f0db2f345ca526f1ff134a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Move shared memory parameters into vendor specific capability

This gives us more flexibility in extending the parameters we expose via
the config space. The capability is already layed out to leave holes for
upcoming extensions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 44e10eb60815a584e40df5d569038813150076e9
      https://github.com/siemens/jailhouse/commit/44e10eb60815a584e40df5d569038813150076e9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Reorganize MMIO registers

A number of changes to the MMIO registers are upcoming. This prepares
the layout for that and renames DBELL to more telling DOORBELL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 313d2a86c530e0ab440e6520ac919f2933017a5d
      https://github.com/siemens/jailhouse/commit/313d2a86c530e0ab440e6520ac919f2933017a5d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename IVPOS register to ID

This is a more logical name for the register as it returns a unique
identifier of the device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 002ee2a2bebd524958014a5b81e45d8ae76cc207
      https://github.com/siemens/jailhouse/commit/002ee2a2bebd524958014a5b81e45d8ae76cc207
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add MAX_PEERS register

This allows the guest to discover the maximum number of peers connected
via an ivshmem device. We only support 2 so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3827aa3a1150358bb73f15471501430c65175eab
      https://github.com/siemens/jailhouse/commit/3827aa3a1150358bb73f15471501430c65175eab
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/bananapi.c
    M configs/arm/emtrion-rzg1e-linux-demo.c
    M configs/arm/emtrion-rzg1e.c
    M configs/arm/emtrion-rzg1h-linux-demo.c
    M configs/arm/emtrion-rzg1h.c
    M configs/arm/emtrion-rzg1m-linux-demo.c
    M configs/arm/emtrion-rzg1m.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm/jetson-tk1.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/espressobin.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/hikey.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/jetson-tx1.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-am654-idk.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/macchiatobin.c
    M configs/arm64/miriac-sbc-ls1046a-linux-demo.c
    M configs/arm64/miriac-sbc-ls1046a.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  configs: Add field for shmem device ID

This allows to set a stable ID that is independent of the cell creation
ordering. Such stability will be needed when defining ID-dependent
unidirectional shared memory regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f25565207c0de2d7c07a755c386d3039f2e0144a
      https://github.com/siemens/jailhouse/commit/f25565207c0de2d7c07a755c386d3039f2e0144a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Use device ID from config

Convert the creation order based ID assignment to the one now provided
by the cell configuration.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d9b343063d868bf0d479f115a165e7ad831f2b80
      https://github.com/siemens/jailhouse/commit/d9b343063d868bf0d479f115a165e7ad831f2b80
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/ivshmem.c
    M hypervisor/arch/x86/ivshmem.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add PCI-conforming INTx mask

Simple enough to add, and newer PCI specs demand this feature anyway:
allow to mask the INTx line via the command register.

For this purpose, factor out ivshmem_update_intx that determines the
state of the line prior to calling arch_ivshmem_update_intx. It also
skips over this call in case num_msix_vectors is non-null, offloading
this check from the arch function. Furthermore, move the calculation if
INTx is enabled and unmasked into that generic ivshmem_update_intx as
well.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 401be011e2635973b4872b68415103fd52258734
      https://github.com/siemens/jailhouse/commit/401be011e2635973b4872b68415103fd52258734
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Mask MSI-X vector on reset

This is demanded by the PCI spec.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ae9ee963d6994ee2f7093a9b97321d04ec8e0522
      https://github.com/siemens/jailhouse/commit/ae9ee963d6994ee2f7093a9b97321d04ec8e0522
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/ivshmem.c
    M hypervisor/arch/x86/ivshmem.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c
    M hypervisor/pci.c

  Log Message:
  -----------
  core: ivshmem: Reintroduce ivshmem_update_msix

This function consolidates the check for num_msix_vectors > 0 and
ivshmem_is_msix_masked, leaving arch_ivshmem_update_msix with less work.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 631b40d161a7b648aac842d5a756cd9ec076fde5
      https://github.com/siemens/jailhouse/commit/631b40d161a7b648aac842d5a756cd9ec076fde5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/include/jailhouse/pci.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Fold ivshmem_write_msix_control into caller

Using pci_msix_registers to model the update of the MSI-X control
register does not really simplify the code. Rather use a plain mask that
contains all modifiable bits, PCI_MSIX_CTRL_RW_MASK, and perform the
update in ivshmem_pci_cfg_write directly, analogously to the vendor
capability.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b39cefdd3d37de18bd854c70d4872f75e9f214da
      https://github.com/siemens/jailhouse/commit/b39cefdd3d37de18bd854c70d4872f75e9f214da
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename ivshmem_data to ivshmem_link

Represents more clearly what the structure is about: meta data
describing the link between two ivshmem endpoints.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 37226ed0867dcc416dab440370814d543a632a27
      https://github.com/siemens/jailhouse/commit/37226ed0867dcc416dab440370814d543a632a27
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Avoid assumption about size of ivshmem_link

It does currently fit into one page, but there is no reason to hard-code
this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ceecf6cee1c337e28cb259a23cce010c161c81c8
      https://github.com/siemens/jailhouse/commit/ceecf6cee1c337e28cb259a23cce010c161c81c8
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Introduce link pointer to ivshmem_endpoint

Will be used when looking up an interrupt target by ID.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1e876ce52b5580d759b63d542d1119ff182da2f1
      https://github.com/siemens/jailhouse/commit/1e876ce52b5580d759b63d542d1119ff182da2f1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Relax peer matching rules

Only match based on BDF from now one. We will rework the number of
shared memory regions, and matching them all will an enormous effort.
This should rather be pushed eventually into an offline check.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 51f21ea3726f82aa8da6bc78e4038c855d155202
      https://github.com/siemens/jailhouse/commit/51f21ea3726f82aa8da6bc78e4038c855d155202
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M configs/x86/apic-demo.c
    M configs/x86/e1000-demo.c
    M configs/x86/ioapic-demo.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/pci-demo.c
    M configs/x86/qemu-x86.c
    M configs/x86/smp-demo.c
    M configs/x86/tiny-demo.c

  Log Message:
  -----------
  configs: x86: Rework ivshmem settings

Align the ivshmem-net size of x86 with arm/arm64 to 1 MB. This will
allow to use the same upcoming memory region macro for all archs. The
smaller demo ivshmem device is moved into the MB below the networking
device. This MB will take further devices later on.

To make space for this, move the demo inmates one MB down in physical
memory.

As we are reordering the memory reservation, also align the PCI device
IDs accordingly, swapping 00:0e.0 and 00:0f.0 for demo and network
device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 945028d7d210064c97963f15dd3e0a171ce46fd4
      https://github.com/siemens/jailhouse/commit/945028d7d210064c97963f15dd3e0a171ce46fd4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/bananapi.c
    M configs/arm/emtrion-rzg1e-linux-demo.c
    M configs/arm/emtrion-rzg1e.c
    M configs/arm/emtrion-rzg1h-linux-demo.c
    M configs/arm/emtrion-rzg1h.c
    M configs/arm/emtrion-rzg1m-linux-demo.c
    M configs/arm/emtrion-rzg1m.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm/jetson-tk1.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/espressobin.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/hikey.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/jetson-tx1.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-am654-idk.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/macchiatobin.c
    M configs/arm64/miriac-sbc-ls1046a-linux-demo.c
    M configs/arm64/miriac-sbc-ls1046a.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  configs: Factor out ivshmem memory region macro for network devices

This helps with defining the default case of the memory region that an
ivshmem network device needs. Just provide the start address, and
JAILHOUSE_SHMEM_NET_REGIONS will create a shared 1 MB region. The macro
already takes the device ID in order to be prepared for upcoming
unidirectional regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c7c9cc901548895d2ecb25387a4e3ebb764160af
      https://github.com/siemens/jailhouse/commit/c7c9cc901548895d2ecb25387a4e3ebb764160af
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/bananapi.c
    M configs/arm/emtrion-rzg1e-linux-demo.c
    M configs/arm/emtrion-rzg1e.c
    M configs/arm/emtrion-rzg1h-linux-demo.c
    M configs/arm/emtrion-rzg1h.c
    M configs/arm/emtrion-rzg1m-linux-demo.c
    M configs/arm/emtrion-rzg1m.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm/jetson-tk1.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/espressobin.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/hikey.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/jetson-tx1.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-am654-idk.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/macchiatobin.c
    M configs/arm64/miriac-sbc-ls1046a-linux-demo.c
    M configs/arm64/miriac-sbc-ls1046a.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: Move ivshmem memory regions at array start

Simplifies index calculation and reduces risk of errors. The only
downside is that regions are no longer ordered according to their
physical addresses.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ce1c12464e690fa53614200ed2fafb8b9e31093b
      https://github.com/siemens/jailhouse/commit/ce1c12464e690fa53614200ed2fafb8b9e31093b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/bananapi.c
    M configs/arm/emtrion-rzg1e-linux-demo.c
    M configs/arm/emtrion-rzg1e.c
    M configs/arm/emtrion-rzg1h-linux-demo.c
    M configs/arm/emtrion-rzg1h.c
    M configs/arm/emtrion-rzg1m-linux-demo.c
    M configs/arm/emtrion-rzg1m.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm/jetson-tk1.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/espressobin.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/hikey.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/jetson-tx1.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-am654-idk.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/macchiatobin.c
    M configs/arm64/miriac-sbc-ls1046a-linux-demo.c
    M configs/arm64/miriac-sbc-ls1046a.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c
    M hypervisor/ivshmem.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  core, configs: ivshmem: Add state table

Replace the register-based remote state read-back with a state table
that is located in read-only shared memory. Every peer has an entry in
this table. The entry position is based on the ID. This way, all peers
can read the other's state without causing a VM exit.

The state table is located at the beginning of the share memory region.
Its mapping size can be retrieved via a register in the the vendor cap.

The cell config format for PCI devices is extended: shmem_region becomes
shmem_regions_start, pointing to two memory regions now, the read-only
state table and the read/write shared memory. The two memory regions
must be consecutive because the size of the first one is used by ivshmem
drivers to derive the offset of the second one.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a3830f502e125fe7f08259d8ed2f42d8bd13c425
      https://github.com/siemens/jailhouse/commit/a3830f502e125fe7f08259d8ed2f42d8bd13c425
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/ivshmem.h
    M hypervisor/arch/arm-common/ivshmem.c
    M hypervisor/arch/x86/include/asm/ivshmem.h
    M hypervisor/arch/x86/ivshmem.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rework interrupt configuration and injection

Revamp data structure, updating and locking around ivshmem interrupt
injection.

The structure arch_pci_ivshmem is renamed to arch_ivshmem_irq_cache to
clarify the purpose of this. This allows to invalidate the case
generically by setting it to 0.

The remote_lock is redefined as irq_lock, now protecting cache update
and usage as well as serializing updates with injections. We do not need
a lock around ivshmem_endpoint::remote updates because the pointer will
never reference an object that is no longer existing after removal.
Instead, the update of irq_cache while holding irq_lock now acts as
barrier.

Furthermore, ensure irq_cache invalidation on device reset. Not
performing that step so far could have caused bogus interrupt delivery
between cell reset and ivshmem device re-initialization.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2083bb0e8d32a9e6f51f1bcf2838558268013bf1
      https://github.com/siemens/jailhouse/commit/2083bb0e8d32a9e6f51f1bcf2838558268013bf1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Re-add target ID to doorbell register

Just like the original ivshmem, use the upper 16 bits of the value
written to the doorbell register. This allows both self signaling and
lays the ground for multi-peer support.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e3e4b5bfc61f24af31df139b9ba1d3c9f759365a
      https://github.com/siemens/jailhouse/commit/e3e4b5bfc61f24af31df139b9ba1d3c9f759365a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/ivshmem.c
    M hypervisor/arch/x86/ivshmem.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Switch to ivshmem_endpoint as parameter of arch_ivshmem_update_msix

For the sake of consistency: ivshmem-internal functions should use the
ivshmem_endpoint, external ones pci_device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f7c7a2364a12366c7e6aaa3af49217646221e36a
      https://github.com/siemens/jailhouse/commit/f7c7a2364a12366c7e6aaa3af49217646221e36a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/ivshmem.h
    M hypervisor/arch/arm-common/ivshmem.c
    M hypervisor/arch/x86/include/asm/ivshmem.h
    M hypervisor/arch/x86/ivshmem.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  core: ivshmem: Add support for multiple interrupt vectors

This allows to spread out state-related interrupts (always vector 0) and
other sources (e.g. RX/TX). The doorbell register accepts the desired
vector in its lower 16 bits, ignoring anything that is not supported by
the peers.

The MSI-X MMIO region is expanded to hold the maximum possible number of
vectors (currently 16). This static sizing keeps the hypervisor simple.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9784d4794857e1ba60c14c739d7382e3b954dbe3
      https://github.com/siemens/jailhouse/commit/9784d4794857e1ba60c14c739d7382e3b954dbe3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: Expand number of ivshmem vectors

The network devices have a use case for up to 2 (config, rx/tx). And the
user-defined ones should get the maximum supported, i.e. 16.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e5d2e732d94b7cdb9695f32049d9b6fb65026a93
      https://github.com/siemens/jailhouse/commit/e5d2e732d94b7cdb9695f32049d9b6fb65026a93
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Expand interrupt control to device level

This will allow to introduce a one-shot mode later on.

The reworked interrupt control register starts disabled on reset.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 289dc628d6a55f57ae86ee23486a3ead62087115
      https://github.com/siemens/jailhouse/commit/289dc628d6a55f57ae86ee23486a3ead62087115
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add one-shot interrupt mode

Add a control flag to the vendor capability that allows to switch
interrupt delivery into a one-shot mode: If enabled, the interrupt
control register is reset after each delivery.

This feature is useful for guests that want to throttle the delivery of
ivshmem interrupts to unprivileged users. The most prominent example is
the UIO framework of Linux. It receives interrupts of UIO devices in the
kernel on behalf of the user process, disables further events and
signals the arrival to the process. That one has to re-enable interrupts
in the device. Thus, it's scheduling naturally throttles the interrupt
arrival rate. With ivshmem, this procedure requires two VM exits per
interrupts when only using the related control register. With the
one-shot mode, one exit can be avoided.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: af86dc75e464dbd48bce55fc37042b3539eec604
      https://github.com/siemens/jailhouse/commit/af86dc75e464dbd48bce55fc37042b3539eec604
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/bananapi.c
    M configs/arm/emtrion-rzg1e-linux-demo.c
    M configs/arm/emtrion-rzg1e.c
    M configs/arm/emtrion-rzg1h-linux-demo.c
    M configs/arm/emtrion-rzg1h.c
    M configs/arm/emtrion-rzg1m-linux-demo.c
    M configs/arm/emtrion-rzg1m.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm/jetson-tk1.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/espressobin.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/hikey.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/jetson-tx1.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-am654-idk.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/macchiatobin.c
    M configs/arm64/miriac-sbc-ls1046a-linux-demo.c
    M configs/arm64/miriac-sbc-ls1046a.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c
    M hypervisor/ivshmem.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  core, configs: ivshmem: Add shared memory output sections support

This adds optional peer-specific output sections to the shared memory
region. Each peer will get its own read/write section that other peers
can only read from. The benefit of such model is that senders can be
sure their messages cannot be concurrently modified by other peers while
they are creating and before they may have signed them. Having a
private section avoids to need to copy in complete messages in integrity
sensitive scenarios.

These output sections are located after the common read/write section.
Their presence is signaled by non-zero value in the output section size
register.

Consequently, all configs need to append two memory regions per ivshmem
device. We switch all ivshmem-net users to this unidirectional model,
setting their common read/write section to zero.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: dbafd4b0ab336488338753a3a2961c43d66a697f
      https://github.com/siemens/jailhouse/commit/dbafd4b0ab336488338753a3a2961c43d66a697f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/bananapi.c
    M configs/arm/emtrion-rzg1e-linux-demo.c
    M configs/arm/emtrion-rzg1e.c
    M configs/arm/emtrion-rzg1h-linux-demo.c
    M configs/arm/emtrion-rzg1h.c
    M configs/arm/emtrion-rzg1m-linux-demo.c
    M configs/arm/emtrion-rzg1m.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm/jetson-tk1.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/espressobin.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/hikey.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/jetson-tx1.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-am654-idk.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/macchiatobin.c
    M configs/arm64/miriac-sbc-ls1046a-linux-demo.c
    M configs/arm64/miriac-sbc-ls1046a.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  core, configs: ivshmem: Add multi-peer support

So far, it seemed restricting our ivshmem implementation to 2 peers
would both simplify it significantly and fulfill the vast majority of
use cases. Both turned out to be wrong assumption.

First of all, there are users with custom protocols that like to set up
a single ivshmem device between, e.g., the root cell and multiple
non-root cells. They would currently have to create one device pair per
link. This overcomes the limitation.

At the same time, the implementation turned out to be rather simple. We
basically just need to broadcast config change interrupts and rework the
bookkeeping so that an ivshmem_link is only destroyed with the last user
disappears. The rest was already refactored to account for multiple
peers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 71b9ef1653ccc8fb483900a37c7f69e6bf9a1c46
      https://github.com/siemens/jailhouse/commit/71b9ef1653ccc8fb483900a37c7f69e6bf9a1c46
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  core: ivshmem: Drop revision protocol ID

Drop the possibility to carry ivshmem protocol revision numbers in the
scarce 16-bit space of the protocol ID. Rather force users to either to
revision management inside the protocol (e.g. via shared memory) or use
a new protocol ID in case of incompatible changes - or even avoid such
incompatible changes. This frees more space that we will need when we
want to map virtio device types into this namespace.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 76301e7854828a646e81be64188948c285fa3ed8
      https://github.com/siemens/jailhouse/commit/76301e7854828a646e81be64188948c285fa3ed8
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h

  Log Message:
  -----------
  core: ivshmem: Reorder ivshmem_endpoint fields

Move state and ioregion to the end because they are not needed in
hot-paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 60ece6d5722c072bd38a1a6666d03cd2a9327fe5
      https://github.com/siemens/jailhouse/commit/60ece6d5722c072bd38a1a6666d03cd2a9327fe5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    A Documentation/ivshmem-v2-specification.md

  Log Message:
  -----------
  Documentation: Add specification of IVSHMEM v2 device

Add a WiP specification for the new IVSHMEM version. This documents the
current state and should not be considered stable at this point.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8c898c1b3c88f425a1c114a8fcf76d62f3971fd2
      https://github.com/siemens/jailhouse/commit/8c898c1b3c88f425a1c114a8fcf76d62f3971fd2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    A Documentation/inter-cell-communication.md
    R Documentation/inter-cell-communication.txt

  Log Message:
  -----------
  Documentation: Update inter-cell-communication

This is a rewrite, pointing to the spec document for details on the
device, describing the new configuration format. The demo section is
left blank until the related ivshmem-demos are updated.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 597ffd9b3a6048a531cc9c08f61790f84522bf24
      https://github.com/siemens/jailhouse/commit/597ffd9b3a6048a531cc9c08f61790f84522bf24
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: x86: Add multi-peer ivshmem demo

Add the demo ivshmem device also to the linux-x86-demo and make it
3-peers (root, ivshmem-demo, linux-x86-demo). This allows to test and
demonstrate the new multi-peer feature. For that, we need to move
ivshmem-demo on the 2nd CPU and shrink the RAM of the linux-x86-demo by
2 MB.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 045c612237ecd050fd853137adda5e395be79e89
      https://github.com/siemens/jailhouse/commit/045c612237ecd050fd853137adda5e395be79e89
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  configs: Add ivshmem protocol defines for virtio to cell-config.h

This defines the protocol ID ranges for virtio backends and frontends
along with a view virtio device IDs, allowing to create such devices in
cell configs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 09efa2549a9da07e9a7da956b4994fda73e43cd0
      https://github.com/siemens/jailhouse/commit/09efa2549a9da07e9a7da956b4994fda73e43cd0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: x86: Add virtio console device between qemu-x86 and linux-x86-demo

This enables the root cell to provide a virtio console via ivshmem to
the non-root Linux cell.

To make space for this shared memory and another upcoming one, move the
demo inmates one MB down in physical memory.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a8c0e957d9f81bd54dd2b3a66a1132ef77ab7eab
      https://github.com/siemens/jailhouse/commit/a8c0e957d9f81bd54dd2b3a66a1132ef77ab7eab
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: x86: Add virtio block device between qemu-x86 and linux-x86-demo

This enables the root cell to provide a virtio block device via ivshmem
to the non-root Linux cell.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 925342bff4101db0065dbc942f5824acaadfc26c
      https://github.com/siemens/jailhouse/commit/925342bff4101db0065dbc942f5824acaadfc26c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M inmates/demos/arm/gic-demo.c
    M inmates/demos/x86/apic-demo.c
    M inmates/demos/x86/ioapic-demo.c
    M inmates/demos/x86/ivshmem-demo.c
    M inmates/demos/x86/pci-demo.c
    M inmates/demos/x86/smp-demo.c
    M inmates/lib/arm-common/gic.c
    M inmates/lib/arm-common/include/inmate.h
    M inmates/lib/include/inmate_common.h
    M inmates/lib/x86/Makefile
    M inmates/lib/x86/include/inmate.h
    R inmates/lib/x86/int.c
    A inmates/lib/x86/irq.c

  Log Message:
  -----------
  inmates: Rework interrupt API

This generalizes the API for initializing the subsystem and registering
a handler with it. x86 now uses the same pattern as the ARM
architectures: There is only one custom handler that is invoked with the
triggered interrupt number as parameter.

Along this, the API functions are changed to use the more readable "irq"
prefix.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c2445bb08100d0bbdf06f9217a8fb25ea7bfe185
      https://github.com/siemens/jailhouse/commit/c2445bb08100d0bbdf06f9217a8fb25ea7bfe185
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M inmates/demos/arm/gic-demo.c
    M inmates/lib/arm-common/gic.c
    M inmates/lib/arm-common/include/inmate.h
    M inmates/lib/include/inmate_common.h
    M inmates/lib/x86/irq.c

  Log Message:
  -----------
  inmates: Generalize gic_enable_irq to irq_enable

This will allow writing generic inmates that needs to use the service
for ARM. x86 is just a stub.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 856047f215d285e6a02ce2e13bb3e237a513cc67
      https://github.com/siemens/jailhouse/commit/856047f215d285e6a02ce2e13bb3e237a513cc67
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/arch/x86/control.c
    M hypervisor/control.c
    M include/arch/x86/asm/jailhouse_hypercall.h
    M include/jailhouse/hypercall.h

  Log Message:
  -----------
  core: Provide pci_mmconfig_base via Comm Region on all archs

This will simplify PCI support in bare-metal ARM inmates.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8607243c30ace3c194d56ae9b3f0273cced0bf1b
      https://github.com/siemens/jailhouse/commit/8607243c30ace3c194d56ae9b3f0273cced0bf1b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/control.c
    M include/arch/arm-common/asm/jailhouse_hypercall.h
    M include/jailhouse/hypercall.h

  Log Message:
  -----------
  arm-common: Provide vpci_irq_base via Comm Region

Allows bare-metal inmates to find the base SPI number of its virtual PCI
host controller.

Increment the ABI revision to conclude this change as well as the
previously generalized vpci_irq_base field.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 160f838caa791fe4eb725c9b249c74e5de4fc559
      https://github.com/siemens/jailhouse/commit/160f838caa791fe4eb725c9b249c74e5de4fc559
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M inmates/lib/arm-common/Makefile.lib
    A inmates/lib/arm-common/pci.c
    M inmates/lib/include/inmate_common.h
    M inmates/lib/x86/include/inmate.h
    M inmates/lib/x86/pci.c

  Log Message:
  -----------
  inmates: Make PCI support generic

Provide PCI support for ARM by implementing mmconfig-based
pci_read/write_config and moving shared defines and prototypes into the
common header. pci_msix_set_vector is only implemented as stub on ARM
so far, can be enhanced later.

As mmconfig implies mapping of that MMIO region, pci_init is introduced.
x86 does not need it and only implements a stub in order to allow
arch-independent inmates.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7e5652f6cd2d7250fd03a0f89fee39dde80cf506
      https://github.com/siemens/jailhouse/commit/7e5652f6cd2d7250fd03a0f89fee39dde80cf506
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M inmates/lib/arm-common/Makefile.lib
    R inmates/lib/arm-common/timer.c
    A inmates/lib/arm-common/timing.c
    M inmates/lib/include/inmate_common.h
    M inmates/lib/x86/include/inmate.h

  Log Message:
  -----------
  inmates: Provide delay_us for all archs

Implement the ARM version and move the prototype to the common header.
This will allow to use delay_us in arch-independent inmates.

The addition of delay_us justifies the renaming of arm-common/timer.c to
timing.c, also analogously to x86.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: aa744baef8179fb9af38b408077d3eacf491b4ba
      https://github.com/siemens/jailhouse/commit/aa744baef8179fb9af38b408077d3eacf491b4ba
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M inmates/lib/arm/include/arch/inmate.h
    M inmates/lib/arm64/include/arch/inmate.h
    M inmates/lib/include/inmate_common.h
    M inmates/lib/x86/include/inmate.h

  Log Message:
  -----------
  inmates: Provide generic enable/disable_irqs

Allows arch-independent inmates to control the interrupt mask.

Drop the unneeded "arch" prefix at this chance.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3d123343f83d3b1ff2ed4038ab4289544b7fac23
      https://github.com/siemens/jailhouse/commit/3d123343f83d3b1ff2ed4038ab4289544b7fac23
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M inmates/demos/arm/Makefile
    M inmates/demos/arm64/Makefile
    A inmates/demos/ivshmem-demo.c
    M inmates/demos/x86/Makefile
    R inmates/demos/x86/ivshmem-demo.c

  Log Message:
  -----------
  inmates: Rewrite ivshmem-demo

Provide a bare-metal demo inmate for the new ivshmem device, exploiting
almost all its features: state table, unidirectional shared memory,
multi-peer support, multiple interrupt vectors. This demo will be
accompanied by a Linux tool in order to span 3-peer demo between root,
bare-metal and a secondary Linux cell.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 87cc49f944ed756e930b70991726ca5595a30717
      https://github.com/siemens/jailhouse/commit/87cc49f944ed756e930b70991726ca5595a30717
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M .gitignore
    M tools/Makefile
    A tools/ivshmem-demo.c

  Log Message:
  -----------
  tools: Add ivshmem-demo for Linux/UIO

This does almost the same as inmates/demos/ivshmem-demo.c, just using
the UIO driver for ivshmem under Linux.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8771cb77e4ea0e170272397bb59e491633e1b1f1
      https://github.com/siemens/jailhouse/commit/8771cb77e4ea0e170272397bb59e491633e1b1f1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    R configs/arm/bananapi-uart-demo.c
    R configs/arm64/amd-seattle-uart-demo.c
    R configs/arm64/foundation-v8-uart-demo.c
    R configs/arm64/k3-am654-uart-demo.c
    R configs/arm64/k3-j721e-evm-uart-demo.c

  Log Message:
  -----------
  configs: arm/arm64: Remove uart demos

Those add no value, compared to the gic-demo configs. They only increase
maintenance efforts.

The emtrion boards only have uart demos, no gic equivalents. Keep those
for now.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e2dad765c4a86de6e24b2beb67d13effdd9605b5
      https://github.com/siemens/jailhouse/commit/e2dad765c4a86de6e24b2beb67d13effdd9605b5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M Documentation/setup-on-zynqmp-zcu102.md
    M README.md
    R configs/arm/bananapi-gic-demo.c
    A configs/arm/bananapi-inmate-demo.c
    A configs/arm/emtrion-rzg1e-inmate-demo.c
    R configs/arm/emtrion-rzg1e-uart-demo.c
    A configs/arm/emtrion-rzg1h-inmate-demo.c
    R configs/arm/emtrion-rzg1h-uart-demo.c
    A configs/arm/emtrion-rzg1m-inmate-demo.c
    R configs/arm/emtrion-rzg1m-uart-demo.c
    R configs/arm/jetson-tk1-demo.c
    A configs/arm/jetson-tk1-inmate-demo.c
    R configs/arm/orangepi0-gic-demo.c
    A configs/arm/orangepi0-inmate-demo.c
    R configs/arm64/amd-seattle-gic-demo.c
    A configs/arm64/amd-seattle-inmate-demo.c
    R configs/arm64/espressobin-gic-demo.c
    A configs/arm64/espressobin-inmate-demo.c
    R configs/arm64/foundation-v8-gic-demo.c
    A configs/arm64/foundation-v8-inmate-demo.c
    R configs/arm64/hikey-gic-demo.c
    A configs/arm64/hikey-inmate-demo.c
    R configs/arm64/imx8mq-gic-demo.c
    A configs/arm64/imx8mq-inmate-demo.c
    R configs/arm64/jetson-tx1-demo.c
    A configs/arm64/jetson-tx1-inmate-demo.c
    R configs/arm64/jetson-tx2-demo.c
    A configs/arm64/jetson-tx2-inmate-demo.c
    R configs/arm64/k3-am654-gic-demo.c
    A configs/arm64/k3-am654-inmate-demo.c
    R configs/arm64/k3-j721e-evm-gic-demo.c
    A configs/arm64/k3-j721e-evm-inmate-demo.c
    R configs/arm64/macchiatobin-gic-demo.c
    A configs/arm64/macchiatobin-inmate-demo.c
    R configs/arm64/miriac-sbc-ls1046a-gic-demo.c
    A configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
    R configs/arm64/qemu-arm64-gic-demo.c
    A configs/arm64/qemu-arm64-inmate-demo.c
    R configs/arm64/ultra96-gic-demo.c
    A configs/arm64/ultra96-inmate-demo.c
    R configs/arm64/zynqmp-zcu102-gic-demo.c
    A configs/arm64/zynqmp-zcu102-inmate-demo.c

  Log Message:
  -----------
  configs, Documentation: arm/arm64: Rename gic-demo to inmate-demo

This expresses that the configs can already be used for gic and uart
demos, soon more and more also for ivshmem.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 68b8ff84ae8dcf2633310bb9f448e2823c3b6df8
      https://github.com/siemens/jailhouse/commit/68b8ff84ae8dcf2633310bb9f448e2823c3b6df8
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/bananapi.c
    M configs/arm/emtrion-rzg1e-linux-demo.c
    M configs/arm/emtrion-rzg1e.c
    M configs/arm/emtrion-rzg1h-linux-demo.c
    M configs/arm/emtrion-rzg1h.c
    M configs/arm/emtrion-rzg1m-linux-demo.c
    M configs/arm/emtrion-rzg1m.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm/jetson-tk1.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/espressobin.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/hikey.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/jetson-tx1.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-am654-idk.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/macchiatobin.c
    M configs/arm64/miriac-sbc-ls1046a-linux-demo.c
    M configs/arm64/miriac-sbc-ls1046a.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c

  Log Message:
  -----------
  configs: arm/arm64: Consistently move ivshmem-net devices one PCI slot up

This free 00:00.0 on the virtual PCI controllers for the demo ivshmem
device. It should come before the networking device because it also uses
memory located before it.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a59f8d33f182ebf613d41cb3154b35fe30a532b6
      https://github.com/siemens/jailhouse/commit/a59f8d33f182ebf613d41cb3154b35fe30a532b6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M configs/arm64/qemu-arm64-inmate-demo.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c

  Log Message:
  -----------
  configs: arm64: Add ivshmem-demo support for qemu-arm64

Enhance the root cell config as well as gic-demo and linux-demo with a
3-peers ivshmem device so that ivshmem-demo can be used.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c316cc753968526f1955a8958e564a8b7fa5c72d
      https://github.com/siemens/jailhouse/commit/c316cc753968526f1955a8958e564a8b7fa5c72d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M configs/arm/orangepi0-inmate-demo.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c

  Log Message:
  -----------
  configs: arm: Add ivshmem-demo support for orangepi0

Enhance the root cell config as well as gic-demo and linux-demo with a
3-peers ivshmem device so that ivshmem-demo can be used.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/95c27c2d9631...c316cc753968

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/95c27c-c316cc%40github.com.
