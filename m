Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB36CSDUQKGQEFO3YXDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93b.google.com (mail-ua1-x93b.google.com [IPv6:2607:f8b0:4864:20::93b])
	by mail.lfdr.de (Postfix) with ESMTPS id 3031E62FD5
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2019 07:09:05 +0200 (CEST)
Received: by mail-ua1-x93b.google.com with SMTP id j22sf1762197uaq.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jul 2019 22:09:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562648944; cv=pass;
        d=google.com; s=arc-20160816;
        b=AqxJvOiOtzTXKY6B9kt3S1KhseCpTy/hxqqV2sZsZdOyps3tobTOHIaDCFxlpeC8Xs
         Ue9Gbd/BObtn0HpAsofEBz7SrKy2FuWkBU/VzhwCtHZ50zajljsUfPNHnj+/ngCtqA1Q
         0+dNTOXxD4IOjT+SC3DFE3bySVWmQCV/JwDwAN4z9nZ0S+hkmoM/qkqG64hkkUd2v6Hs
         OPZqq43aQur0pw5xUSfgIlyRIZXBbzv3qh3eee+4xBs0qnGnRU9XjYq5fb+ifK+dSlbp
         1Ovrd+rU6BBG/JzspCjw6z2PiB2BqTwkhp9MLP/mrroVe0y6tEG7QcA0GPRNJuO6TPwS
         o65w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=PGbVybwRk4FbuLr9yDYO+AuiXumz8uVQ2hzXvhwAk6Y=;
        b=jm1j1bZ1ERo8zr+mXZE0CEvJxku8q8Yubgtyc98XSiFXxvqqL6Pr6isWzrsFgjap0o
         r7gRZ6vhMCgpibPLIEH5yLqIKdiRrUmRLBBanQ5mZNVaLY4Kuqu71Hu/KVkLN2J2E5sG
         yI2fSaiMDOzHB5nsRK8p3W8oPD/q1JLURZAwQnzTqnljVJAtWKV9sUKQgx+L9WPfZ245
         DkUnYPG5RbQPrJghZRIsiFq60+qTPrJBlA05duQNOMur1fPFfNxza7zV/IUE/jtfL2iF
         4TOqJs8fRFV5iIpFZh9u3bJV71enK2XuON1WR4eLlxaQ+t5tYl6KczkJKdl+ModLh7C8
         FU6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=HZ8xWsf0;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PGbVybwRk4FbuLr9yDYO+AuiXumz8uVQ2hzXvhwAk6Y=;
        b=IqSpiwmAs+vVfz17ommdtwIKurFOi52gdWtFUq8odgPks/ocrrWDbrqw5vMo5tRcTP
         2Ul0pJBt1ONWzqXbtTmC+QfgR8Odup3+HNn2k0WDvjE5SDtXl3oNjz/8owrymGTNqEar
         csmBOqzOdY58cE7+q1Llmm4KEqrcLCZBEEST/XJ07phuy5FVPhoxSy3058E132WZf4Hy
         Y5/NAWV63y0S/4o9UZFCWIIi8QAYHIIqBfbezNCrkRos+v+k8yy9fhq8Mt4W09RjD9Uh
         LZee3vNGNJHT1S/dDzYkRjCDAFbesm1xcJdbG7upvA3w3/ayyDB7e6DBv/49tV++nRTQ
         suxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PGbVybwRk4FbuLr9yDYO+AuiXumz8uVQ2hzXvhwAk6Y=;
        b=IXltqf/lA1xc4ZVn0eKjtxevR1E1dN9YtOobMp7H0QoMhQLJvtrKYhr8oJhfZsz2wP
         uq3kUU6+Odn3KSMqK0Nndbe8Gj0Gaxmgbv0s5tuZDQHK4GngCydXIJ011lEQZKx58aAG
         fCEVRC1YT5vuGDmXsS8ttdtJ71UXSglRIS3mrE6BtYrkc0JwC2SQL7sIURNJFjPhU8Bx
         q7M8ImJ7VY5cK1pg6G7yFKBJ+dD9VWQcWXv8BOoFUiTAVx4n6YKKrkdZkd04xLo4bwKn
         uUP9xrWwqtMWsWVKL/4NznC3Sh4BwKONTzXUk77GMuT2UYTDvghJAVXTf/dETbOeQq1d
         Hf2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWec5kx0QmnaLDq+bIovSGW28tMjxsfmoq5IMQH/bjC2nKGxjoJ
	D92WIy8zN8DwlfA6RX2kyog=
X-Google-Smtp-Source: APXvYqwIOWT8tAHohT8KPTeKXGDvg5ct7BViNvMMeTPnb4Zp+20iCP80A1vidLy2hlbKdqztamm7tg==
X-Received: by 2002:ab0:30a4:: with SMTP id b4mr12791888uam.134.1562648943916;
        Mon, 08 Jul 2019 22:09:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:8bc3:: with SMTP id n186ls1010037vsd.12.gmail; Mon, 08
 Jul 2019 22:09:03 -0700 (PDT)
X-Received: by 2002:a67:fe5a:: with SMTP id m26mr13872658vsr.230.1562648943438;
        Mon, 08 Jul 2019 22:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562648943; cv=none;
        d=google.com; s=arc-20160816;
        b=Ite16qC3uBjua/Y4M2eOTHZzssGc2NTXc10HdnOiaKzwEyjgpu8alRlJpUcrH6h216
         K/nDXpNq/AFmz78Z2YFp64G6jyxf7DOFKOErTMyo3HihHH76ZCbwRHogELEBKKeapnnp
         0rgX6Twu7/D4oTY71zWuEB89rO3fGGvptOQuJG58D/1Qudm4SVOl6QYvCnPzn1kJeaG0
         WScRPUveJhmS5OjtERDWamq7UV+H99LsLQzfXPlQSJwTLUV1V6JGrlNn9qNMryCYKTOt
         WkbGwIfzVXFAfCzzCqXNA3m5X8iQ6ba85aARhWDBJQr3R+dEfGtlJT8h4TU3cUQjgbFM
         GXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=xqatBs7Z9kzecHdjxxZ+0MGakOCsrpSOBbMqlu2/FDc=;
        b=P4s3Umgh1TqSX10I6pHPLM/6rbWP8wqD9L4jlagoHVkxrpDJjYlVHcohCkhsNuClk0
         XTEXH+IBALUJUjzjwPSDeTgyCg9BclGmJfKsy5S+ezTpAsD+toXohZph3eHnhaPqoLzf
         e5hbkAwIi5OphBvMqIm2WpbQr5VkgB7RRL4nJee9Ut7UTDFxPkd0Z6LYzAjUPK0EsQ/F
         qMSyDdDEQTHazE5mI7IML4zhBgIU39ykX+RT0KtyYZvMhMKrMZyKV0SQ8iS7IkJABkBX
         Rbd38QyGNB+eaHuOyGTN+NG6QuJb7bJ8OdC/LiKU/sh/9JUfc7X23QpxyHOptIxZ4FtN
         8d3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=HZ8xWsf0;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-13.smtp.github.com (out-13.smtp.github.com. [192.30.254.196])
        by gmr-mx.google.com with ESMTPS id i9si304869vsj.0.2019.07.08.22.09.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 22:09:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) client-ip=192.30.254.196;
Date: Mon, 08 Jul 2019 22:09:01 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/ivshmem2/46b642-7c49bb@github.com>
Subject: [siemens/jailhouse] 3e86aa: configs: qemu-x86: Fix ACPI region size
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=HZ8xWsf0;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.196 as
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

  Branch: refs/heads/wip/ivshmem2
  Home:   https://github.com/siemens/jailhouse
  Commit: 3e86aafd0e777246998bc6cf9a6676046b5f2397
      https://github.com/siemens/jailhouse/commit/3e86aafd0e777246998bc6cf9a6676046b5f2397
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: qemu-x86: Fix ACPI region size

At 0x40000000, some PCI resource region starts. We accidentally
overlapped this so far which was unnoticed because ivshmem uses 64-bit
resources, and no other PCI device was placed in that region. When
changing ivshmem to 32-bit, this become relevant, though.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3a1b4e60b1bccf4525578b213643c738f2e787b0
      https://github.com/siemens/jailhouse/commit/3a1b4e60b1bccf4525578b213643c738f2e787b0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Use own temporary vendor and device ID

We deviated too much from the original ivshmem, and we will even more.
Until it's clear where the result will find its home, and in which form,
use an apparently free vendor ID that encodes "JH", and also assign this
ID to the device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4a9c850093331b72118c4c4bc7e33fb5ae8cb946
      https://github.com/siemens/jailhouse/commit/4a9c850093331b72118c4c4bc7e33fb5ae8cb946
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

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


  Commit: 9d327e9265751e2a91a54734debfaa1a91efecc9
      https://github.com/siemens/jailhouse/commit/9d327e9265751e2a91a54734debfaa1a91efecc9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Derive MMIO register region size from cell config

The BAR mask encodes the size of a PCI device resource. Use this to
allow a target-dependent setting via the cell configuration so that
alignment to the cell's page size become feasible. This will enable the
cell OS to map the MMIO region as a whole into user space.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9c73169b8db2486ef5704a2b07e2538935148e07
      https://github.com/siemens/jailhouse/commit/9c73169b8db2486ef5704a2b07e2538935148e07
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Enable unprivileged MMIO register access

Make sure that unsupported accesses to the MMIO register region do not
raise immediate panic. We should rather ignore them. This allows the
cell OS to hand out the region to unprivileged users.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a9bdcc5e62c18407638a5031298bb68d03768dfe
      https://github.com/siemens/jailhouse/commit/a9bdcc5e62c18407638a5031298bb68d03768dfe
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

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
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core, configs: ivshmem: Convert MMIO register region to 4K and 32-bit

Page-alignment is required so that the cell OS can map the region as a
whole to its user space. If a cell may use larger minimal page sizes,
the mask for BAR 0 has to be adjusted accordingly. For now we assume all
are on 4K.

While at it, reduce the MMIO region to 32-bit which saves one BAR.
64-bit was needlessly wasteful.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2873055d638ca6022829c3c0d8ea6ef8f6769d29
      https://github.com/siemens/jailhouse/commit/2873055d638ca6022829c3c0d8ea6ef8f6769d29
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/include/jailhouse/pci.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core, configs: ivshmem: Move MSI-X region into 32-bit BAR1

Compact the BAR usage and also reduce the MSI-X region to 32-bit again -
there is no need for 64-bit.

As both the MMIO register and the MSI-X region are now 32-bit, convert
their internal representation in ivshmem_endpoint to an u32 array.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d54d96b7191a17fe40b6163e66492a514ee8e7bd
      https://github.com/siemens/jailhouse/commit/d54d96b7191a17fe40b6163e66492a514ee8e7bd
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

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


  Commit: b4debb0461953c7076891970d6348d618fc558e2
      https://github.com/siemens/jailhouse/commit/b4debb0461953c7076891970d6348d618fc558e2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Reorganize MMIO registers

A number of changes to the MMIO registers are upcoming. This prepares
the layout for that and renames DBELL to more telling DOORBELL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cc9aa57f117ffc1be320d955bef3be87e7211cd4
      https://github.com/siemens/jailhouse/commit/cc9aa57f117ffc1be320d955bef3be87e7211cd4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename IVPOS register to ID

This is a more logical name for the register as it returns a unique
identifier of the device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: dbceac298ceb4464472419fd72653f5522405fba
      https://github.com/siemens/jailhouse/commit/dbceac298ceb4464472419fd72653f5522405fba
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add MAX_PEERS register

This allows the guest to discover the maximum number of peers connected
via an ivshmem device. We only support 2 so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b315b4cd344cab7c6fab295ec0a6b0c4826abee2
      https://github.com/siemens/jailhouse/commit/b315b4cd344cab7c6fab295ec0a6b0c4826abee2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add FEATURES register

This register makes features of the ivshmem device discoverable for the
guest. So far, only bit 0 is defined and always set in the Jailhouse
implementation. It signals that all peers find the shared memory region
at the same guest physical address.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6a73474d607a560143e7ca7bb0ede139a3fea4dd
      https://github.com/siemens/jailhouse/commit/6a73474d607a560143e7ca7bb0ede139a3fea4dd
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

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
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  configs: Add field for shmem device ID

This allows to set a stable ID that is independent of the cell creation
ordering. Such stability will be needed when when defining ID-dependent
unidirectional shared memory regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 41b6609858deb90290a65c0c8df7e2b89e5fc7f0
      https://github.com/siemens/jailhouse/commit/41b6609858deb90290a65c0c8df7e2b89e5fc7f0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Use device ID from config

Convert the creation-order based ID assignment to the one now provided
by the cell configuration.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c02dfcafb1016988bb30e8dba276b83cf2f067e6
      https://github.com/siemens/jailhouse/commit/c02dfcafb1016988bb30e8dba276b83cf2f067e6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

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


  Commit: 82be10844c0e2311ab621d24cb5ead2a9230a343
      https://github.com/siemens/jailhouse/commit/82be10844c0e2311ab621d24cb5ead2a9230a343
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Mask MSI-X vector on reset

This is demanded by the PCI spec.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a9b1f911951ae3b07632ff77175485c569e05f69
      https://github.com/siemens/jailhouse/commit/a9b1f911951ae3b07632ff77175485c569e05f69
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

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


  Commit: 653e02096f787fe1e45ebbda7203cd0aa0ff2f2a
      https://github.com/siemens/jailhouse/commit/653e02096f787fe1e45ebbda7203cd0aa0ff2f2a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

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


  Commit: a4aab94b642a19ebfe69275259a1a879c3fc54b5
      https://github.com/siemens/jailhouse/commit/a4aab94b642a19ebfe69275259a1a879c3fc54b5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename ivshmem_data to ivshmem_link

Represents more clearly what the structure is about: meta data
describing the link between two ivshmem endpoints.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ac7852f9c40dac87ac1a5e529b18b0a915a09033
      https://github.com/siemens/jailhouse/commit/ac7852f9c40dac87ac1a5e529b18b0a915a09033
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Avoid assumption about size of ivshmem_link

It does currently fit into one page, but there is no reason to hard-code
this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 42ee052abf4526c040fbc4cb51deeb7997b5cca6
      https://github.com/siemens/jailhouse/commit/42ee052abf4526c040fbc4cb51deeb7997b5cca6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Introduce link pointer to ivshmem_endpoint

Will be used when looking up an interrupt target by ID.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d662b3eecb6cae5f24d46e7d360d04787b2fc312
      https://github.com/siemens/jailhouse/commit/d662b3eecb6cae5f24d46e7d360d04787b2fc312
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Relax peer matching rules

Only match based on BDF from no one. We will rework the number of shared
memory regions, and matching them all will an enormous effort. This
should rather be pushed eventually into an offline check.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0415280753c15cbdb2a29d7772e187b5306af369
      https://github.com/siemens/jailhouse/commit/0415280753c15cbdb2a29d7772e187b5306af369
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

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
Its mapping size can retrieved via a register in the the vendor cap.

The cell config format for PCI devices is extended: shmem_region becomes
shmem_regions_start, pointing to two memory regions now, the read-only
state table and the read/write shared memory. The two memory regions
must be consecutive because the size of the first one is used by ivshmem
drivers to derive the offset of the second one.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 90046acd3f93d87ff0920f44b2bc20f0dddbe42a
      https://github.com/siemens/jailhouse/commit/90046acd3f93d87ff0920f44b2bc20f0dddbe42a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

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


  Commit: 4dd8ab15ca60506a931ef14bf9c57fb2f3789c1f
      https://github.com/siemens/jailhouse/commit/4dd8ab15ca60506a931ef14bf9c57fb2f3789c1f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Re-add target ID to doorbell register

Just like the original ivshmem, use the upper 16 bits of the value
written to the doorbell register. This allows both self signaling and
lays the ground for multi-peer support.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 71b7cc270f17547b3295f7ee470d6f3cb09c5984
      https://github.com/siemens/jailhouse/commit/71b7cc270f17547b3295f7ee470d6f3cb09c5984
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

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


  Commit: 4cf53916e2cd76aa66f8f5fe3458e8603627bc37
      https://github.com/siemens/jailhouse/commit/4cf53916e2cd76aa66f8f5fe3458e8603627bc37
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/ivshmem.h
    M hypervisor/arch/arm-common/ivshmem.c
    M hypervisor/arch/x86/include/asm/ivshmem.h
    M hypervisor/arch/x86/ivshmem.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add support for multiple interrupt vectors

This allows to spread out state-related interrupts (always vector 0) and
other sources (e.g. RX/TX). The doorbell register accepts the desired
vector in its lower 16 bits, ignoring anything that is not supported by
the peers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4ac8974ae613e9c7bc511ec126a6c361834d792a
      https://github.com/siemens/jailhouse/commit/4ac8974ae613e9c7bc511ec126a6c361834d792a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: Expand number of ivshmem vectors

The network devices have a use case for up to 3 (config, rx, tx). And
the user-defined ones should get the maximum supported, i.e. 16.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5374056000752117fb03fbc67ea7483b277597ae
      https://github.com/siemens/jailhouse/commit/5374056000752117fb03fbc67ea7483b277597ae
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Expand interrupt control to device level

This will allow to introduce a one-shot mode later on.

The reworked interrupt control register starts disabled on reset.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 80ee6cbed86b61522b2b95247a3ac22b39d408aa
      https://github.com/siemens/jailhouse/commit/80ee6cbed86b61522b2b95247a3ac22b39d408aa
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

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


  Commit: 6ffdc5d3a8f710f0427d83a4ce84d940a6f05af1
      https://github.com/siemens/jailhouse/commit/6ffdc5d3a8f710f0427d83a4ce84d940a6f05af1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

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
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core, configs: ivshmem: Add unidirectional shared memory support

This adds optional peer-specific output sections to the shared memory
region. Each peer will get its own read/write section that other peers
can only read from. The benefit of such model is that senders can be
sure their messages cannot be concurrently modified by other peers while
they are creating and before they may have signed them. Having a
private section avoids having to copy in complete messages in integrity
sensitive scenarios.

These output sections are located after the common read/write section.
Their presence is signaled by non-zero value in the output section size
register.

Consequently, all configs need to append two memory regions per ivshmem
device. We switch all ivshmem-net users to this unidirectional model,
setting their common read/write section to zero.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0ad2098ec102d7b8d5e182d042aa247e076f7938
      https://github.com/siemens/jailhouse/commit/0ad2098ec102d7b8d5e182d042aa247e076f7938
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

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


  Commit: d7eb1f31dce4f272540693efe080393b45fc5943
      https://github.com/siemens/jailhouse/commit/d7eb1f31dce4f272540693efe080393b45fc5943
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

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
ivshmem-demo on the 2nd CPU.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f2e8b809b171716f465ef6136117430413c2780c
      https://github.com/siemens/jailhouse/commit/f2e8b809b171716f465ef6136117430413c2780c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

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


  Commit: 56ab3eebdd74661c286a2152ef51d98daeead7f2
      https://github.com/siemens/jailhouse/commit/56ab3eebdd74661c286a2152ef51d98daeead7f2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h

  Log Message:
  -----------
  core: ivshmem: Reorder ivshmem_endpoint fields

Move state and ioregion to the end because they are not needed in
hot-paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7c49bb479beea60d4dff51d807c42531da349e50
      https://github.com/siemens/jailhouse/commit/7c49bb479beea60d4dff51d807c42531da349e50
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-09 (Tue, 09 Jul 2019)

  Changed paths:
    A Documentation/ivshmem-v2-specification.md

  Log Message:
  -----------
  Documentation: Add specification of IVSHMEM v2 device

Add a WiP specification for the new IVSHMEM version. This documents the
current state and should not be considered stable at this point.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/46b64201e905...7c49bb479bee

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/ivshmem2/46b642-7c49bb%40github.com.
For more options, visit https://groups.google.com/d/optout.
