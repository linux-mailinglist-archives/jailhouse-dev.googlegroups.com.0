Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB6OUTXYAKGQEIGD2MFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1038.google.com (mail-pj1-x1038.google.com [IPv6:2607:f8b0:4864:20::1038])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B9812BDD0
	for <lists+jailhouse-dev@lfdr.de>; Sat, 28 Dec 2019 15:45:15 +0100 (CET)
Received: by mail-pj1-x1038.google.com with SMTP id bg6sf8955258pjb.5
        for <lists+jailhouse-dev@lfdr.de>; Sat, 28 Dec 2019 06:45:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577544314; cv=pass;
        d=google.com; s=arc-20160816;
        b=buTMvgl530GjFeAI5nYoqz6P54zwUUp7EMa9+3TP2Xzznu9sRMjJVfSvmcDks1FJYR
         jx58FKNoObuk2j11lr0yOmT2gEMqCA8IYPHfPRxcAhDmJYlWXz3yUCEROIbi2Qx6pTAp
         jvdal56RxLOObuunxBNacVbMAyf+7qpLrRNBzSBkLFOI8vKjbk8EXjJvgMu9n0ezdq6v
         I2v1Vgh9ZPx/d8II8d3+X+/uqe4++g0vwIYzGRcuLpEY5qTchvgSg5mv0KhiKxMZnibm
         09RG1TikkwPA2V1dxh7wEukCQxAmkmOqELDBLXNy+1reEWHhI2RuIPiSYs1Q3wvFIYJW
         OAJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=m2C3WXH9ZmllQS29/6zZto8AwHn+Tb25DwqyIU9PyMA=;
        b=TnOXDVKs+Q94IjQiSov4McgzoU9PCpXQufcFxOhJUYqHzawrLmpuv149Lkt4U1tYcF
         kqp+S+TQefYelLoWu6hG7YA3xdqga1P0Gvu1c9GffpUovVibBadlHLIc3t7la8O/E5II
         WyPV2WtgnNNENeO7hJNw5jciGfq9nywzCaQHVf2iwRgFwey/ZOQ+SclvgClVoA6c4P4y
         5y2jG7sznpJbGYkm6H6Ccmn/+s6tJPWwWorRh1cMXLBGy21S2Kxc5dpickC7GfRa3yBM
         X+hBSV5jorlrFgwX7NZYmKUBjWX3YBwtYdvYC2XWqaeGk4R2nMVo7wvCqstDjB80kKR2
         cUMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=aQz+W10E;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=m2C3WXH9ZmllQS29/6zZto8AwHn+Tb25DwqyIU9PyMA=;
        b=fW95z8QFCUUdPZ5LIDmY991zbBZ31FgdFIaek2MTh3vj05gFXsV2Mb2PvToUBp9b7B
         9bO7PhI1v8Xe7lL8NTGU3MQKX7xO0hCd38sCu0ViIdUutDyR8XvWBlGbiDCcWFqGnr+3
         mS7PWf2mXSfL8IP+EMDH7Klz93+isZ+19efO121dt0Cddkw95tIvUYKYBtPlvnHexI2Z
         cbPvaImUqUUKu7b6Tb2rhneoEn5Svwr91iIXCOYt477/zvSoeUBoCdq0iJoqpEMAXi6G
         XST9N4+/KuA1JxyIsH3E+45htHvIF1gR5jenokH2yWfKS3RQ/Nv+SJVts5tno84IRMjn
         +QOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=m2C3WXH9ZmllQS29/6zZto8AwHn+Tb25DwqyIU9PyMA=;
        b=aBQ0wWZsLgZHAyKXWLN8vBAxi9a+lvjKzNvJf4001MwDewaJAccTTMYjmV6aCIqRDQ
         9XViDqbcQrWZ2o70di1C6tXn5YatbVDBmMw2LwMhgNmg9YRqH+edn64ZcURBXR6w3yVc
         6E2QfZiYyEUAQLmtM4HULzU7XzhwhYOeW/ENCjBp5ggEwUa5dfwTtq4ijYQJm/bc8Osz
         WuwwTePdkNaON9lCH4P4cDHG1JQaATbNMF5CHDBDh3eLRgKGxy+rj9eR+6jvoJ2d4HU8
         36+hLScZS6L9uaXkQ/bKuPBOeSGEjavWZvjhuFRxBVllqQa4SM2kq2uNgpmMx4ZqHVoB
         FRPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWeACUYtqK2V8fUq6mq29gZ5Zgx1thEs9G+EMfOp1fla/Up7lV7
	kkGBVQGFLf9HmXimH6kKoPk=
X-Google-Smtp-Source: APXvYqxQSTQFfWy+pwtz4BrtsFj+/QeOPdLRw/45M7Ce1EvLHUUfRSL68J2kNVXDA4t68tAAwPMDjA==
X-Received: by 2002:a63:134e:: with SMTP id 14mr61648114pgt.115.1577544313821;
        Sat, 28 Dec 2019 06:45:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:b789:: with SMTP id e9ls8069186pls.4.gmail; Sat, 28
 Dec 2019 06:45:13 -0800 (PST)
X-Received: by 2002:a17:90a:d807:: with SMTP id a7mr34321639pjv.15.1577544313196;
        Sat, 28 Dec 2019 06:45:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577544313; cv=none;
        d=google.com; s=arc-20160816;
        b=rEb4kRqEzSWgSXVbwciBSzUA8kAx7FytL7AozAzVZJu8Kh4Zary1j47Tnu/b/s8HvT
         XXpQMc74wbey1TNWlsz4ZVJYPIqyFRsTtdWvRf2tOE9qWJjVRHXJZnLO/Olyu5AVc5tk
         vkn//XSYC/9N3m8pWvIXDPHpoKyyZh9jJnmI2chW6/MiYuvftmqH3NIDbHjn++HueUv3
         fMe4LFTpiQqCHOnszfo7e+9Ba3LwGuMdDCpXkJ2h7UNDIaeGxB1LJ9I3Mlg0Ufm++OOM
         FmDk2hJBafW0rGV2HQ8YPIHWAWtZFsGzO4dZbdsZpv/TsOtLmZuVpag1AeuHM/KK4jLD
         TWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=q229Nr7d/H1vBNAxLQjP+y2mCLKN+B3GZ2Ra7YitWkY=;
        b=qesGOXJBOHjLaheQsMESBWi5LF3henxnxGvg714HDYCmCwJn8HtSv4GUjKzbfKhE4W
         QOhNBqW/e7HMJRwPsCjY/RzFdJnD5puEQo20738PeD38dMAyiZoB09feQR50qQA5VFcB
         80SyOJpubDMIReAChnoz2iWAK8o2/iTnX4SUDCoqOikufE+rv+GBfReqUlMMZrMzMBMZ
         gyILt5GUEbDcWZ8CGVjo3CwXUyAQgP7xREdWyF7Ot7YTiQPHgPZYCjbwjr6mh9bE4QSd
         cmBV2hddXprqGpFESax1FpUK2Iz+fCLJWdoZmklRpvsZrnFddwWJX8jjQU+s+9Wo3UQ3
         x2Mg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=aQz+W10E;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-5.smtp.github.com (out-5.smtp.github.com. [192.30.252.196])
        by gmr-mx.google.com with ESMTPS id n20si1241298pgl.1.2019.12.28.06.45.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Dec 2019 06:45:13 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) client-ip=192.30.252.196;
Date: Sat, 28 Dec 2019 06:45:12 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/ivshmem2/446d77-048806@github.com>
Subject: [siemens/jailhouse] 6d9dce: core: ivshmem: Use Siemens-provided
 device ID
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=aQz+W10E;       spf=pass
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

  Branch: refs/heads/wip/ivshmem2
  Home:   https://github.com/siemens/jailhouse
  Commit: 6d9dced28335991d62595b68a06fe1b02cb96478
      https://github.com/siemens/jailhouse/commit/6d9dced28335991d62595b68a06fe1b02cb96478
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

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


  Commit: 95ee38236f0928517dd51e0bde31e56097a1ee72
      https://github.com/siemens/jailhouse/commit/95ee38236f0928517dd51e0bde31e56097a1ee72
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

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


  Commit: e93455a8de7fa25e72b3284d8ddc13314033ad92
      https://github.com/siemens/jailhouse/commit/e93455a8de7fa25e72b3284d8ddc13314033ad92
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

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


  Commit: 6faf468538dea9174834817ecda0c92293bbbee4
      https://github.com/siemens/jailhouse/commit/6faf468538dea9174834817ecda0c92293bbbee4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Enable unprivileged MMIO register access

Make sure that unsupported accesses to the MMIO register region do not
raise immediate panic. We should rather ignore them. This allows the
cell OS to hand out the region to unprivileged users.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6f7920c7e7e47344e45c34ba6bec0d7d5b1a825d
      https://github.com/siemens/jailhouse/commit/6f7920c7e7e47344e45c34ba6bec0d7d5b1a825d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

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

There are two possible settings for this parameter, for INTx and for
MSI-X. Both are invariant for all archs, so let's pull them out of the
config files. That will also simplify upcoming changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0d7b8370075a38dd2cc80c18c9a954e5adebef20
      https://github.com/siemens/jailhouse/commit/0d7b8370075a38dd2cc80c18c9a954e5adebef20
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

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


  Commit: 70d0a57f18ec00566adf0cfe089939d3636decc9
      https://github.com/siemens/jailhouse/commit/70d0a57f18ec00566adf0cfe089939d3636decc9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

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


  Commit: ad506cd159f6f64e36d7457fdfab7e5215d2f610
      https://github.com/siemens/jailhouse/commit/ad506cd159f6f64e36d7457fdfab7e5215d2f610
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

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


  Commit: c33c9f8404409ee3ac8465f27307c5c277a236b5
      https://github.com/siemens/jailhouse/commit/c33c9f8404409ee3ac8465f27307c5c277a236b5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Reorganize MMIO registers

A number of changes to the MMIO registers are upcoming. This prepares
the layout for that and renames DBELL to more telling DOORBELL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ec3ece3914d440a647da7ef84f677b1b6a6e68d0
      https://github.com/siemens/jailhouse/commit/ec3ece3914d440a647da7ef84f677b1b6a6e68d0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename IVPOS register to ID

This is a more logical name for the register as it returns a unique
identifier of the device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 90cebbf6f01181ac657f57d66f51bb8d6ab80d5e
      https://github.com/siemens/jailhouse/commit/90cebbf6f01181ac657f57d66f51bb8d6ab80d5e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add MAX_PEERS register

This allows the guest to discover the maximum number of peers connected
via an ivshmem device. We only support 2 so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1b731bd7fb5169c88565c85fc1a3a7efa01b93bc
      https://github.com/siemens/jailhouse/commit/1b731bd7fb5169c88565c85fc1a3a7efa01b93bc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

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
ordering. Such stability will be needed when when defining ID-dependent
unidirectional shared memory regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 86e527ecca66deb9100043017a9cd2bde6fc84f4
      https://github.com/siemens/jailhouse/commit/86e527ecca66deb9100043017a9cd2bde6fc84f4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Use device ID from config

Convert the creation-order based ID assignment to the one now provided
by the cell configuration.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4ef70482c7de6f126ab7c7c8e2060a1087844ae0
      https://github.com/siemens/jailhouse/commit/4ef70482c7de6f126ab7c7c8e2060a1087844ae0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

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


  Commit: 30b8919dd59a0c20080ea69aed71ecf65210cbc3
      https://github.com/siemens/jailhouse/commit/30b8919dd59a0c20080ea69aed71ecf65210cbc3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Mask MSI-X vector on reset

This is demanded by the PCI spec.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b235ad77a1ce489131065d70c1f661f10b7b05e9
      https://github.com/siemens/jailhouse/commit/b235ad77a1ce489131065d70c1f661f10b7b05e9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

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


  Commit: e988e3abc1cbad0357515a3cc0d0bf87418f1287
      https://github.com/siemens/jailhouse/commit/e988e3abc1cbad0357515a3cc0d0bf87418f1287
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

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


  Commit: b58df24106473f6ad54dc3d4a35663d2e9277210
      https://github.com/siemens/jailhouse/commit/b58df24106473f6ad54dc3d4a35663d2e9277210
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename ivshmem_data to ivshmem_link

Represents more clearly what the structure is about: meta data
describing the link between two ivshmem endpoints.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6c27b9b94739472099266bc0ab21eb933e782d20
      https://github.com/siemens/jailhouse/commit/6c27b9b94739472099266bc0ab21eb933e782d20
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Avoid assumption about size of ivshmem_link

It does currently fit into one page, but there is no reason to hard-code
this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a2ff2b0fff117ecf853d3928753d4021953751af
      https://github.com/siemens/jailhouse/commit/a2ff2b0fff117ecf853d3928753d4021953751af
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Introduce link pointer to ivshmem_endpoint

Will be used when looking up an interrupt target by ID.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 619d86227a9bfb1df6a8e566b185599d6239ffdb
      https://github.com/siemens/jailhouse/commit/619d86227a9bfb1df6a8e566b185599d6239ffdb
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Relax peer matching rules

Only match based on BDF from no one. We will rework the number of shared
memory regions, and matching them all will an enormous effort. This
should rather be pushed eventually into an offline check.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5d345e8e5d5bff876ed08ba4e64a4d2d76e13ffe
      https://github.com/siemens/jailhouse/commit/5d345e8e5d5bff876ed08ba4e64a4d2d76e13ffe
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

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


  Commit: 3e39ac59295940317783a22f1edae13402b6db67
      https://github.com/siemens/jailhouse/commit/3e39ac59295940317783a22f1edae13402b6db67
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

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
  configs: Factor out ivshmem memory region macro for network device

This helps with defining the default case of the memory region that an
ivshmem network device needs. Just provide the start address, and
JAILHOUSE_SHMEM_NET_REGIONS will place a shared 1 MB region. The macro
already takes the device ID in order to be prepared for upcoming
unidirectional regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 22c549ef15a832021a0fd5d16adaaa038d51a145
      https://github.com/siemens/jailhouse/commit/22c549ef15a832021a0fd5d16adaaa038d51a145
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

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


  Commit: 6435c129e3295842112d33e663e5a5b1c36c824b
      https://github.com/siemens/jailhouse/commit/6435c129e3295842112d33e663e5a5b1c36c824b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

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
Its mapping size can retrieved via a register in the the vendor cap.

The cell config format for PCI devices is extended: shmem_region becomes
shmem_regions_start, pointing to two memory regions now, the read-only
state table and the read/write shared memory. The two memory regions
must be consecutive because the size of the first one is used by ivshmem
drivers to derive the offset of the second one.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c64b5a4578f2a26492d547a3c144f85493f66f28
      https://github.com/siemens/jailhouse/commit/c64b5a4578f2a26492d547a3c144f85493f66f28
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

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


  Commit: fa60afb8498ed78765cb69fb3bcea6651606e212
      https://github.com/siemens/jailhouse/commit/fa60afb8498ed78765cb69fb3bcea6651606e212
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Re-add target ID to doorbell register

Just like the original ivshmem, use the upper 16 bits of the value
written to the doorbell register. This allows both self signaling and
lays the ground for multi-peer support.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 84c37d0c4c965b4261b9f2a37b0e2889ede95d25
      https://github.com/siemens/jailhouse/commit/84c37d0c4c965b4261b9f2a37b0e2889ede95d25
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

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


  Commit: 983262134993efa54f02a478694c442289884d59
      https://github.com/siemens/jailhouse/commit/983262134993efa54f02a478694c442289884d59
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

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


  Commit: e680dc59518b8681f7b32e17977f2e3b7a4ae4d4
      https://github.com/siemens/jailhouse/commit/e680dc59518b8681f7b32e17977f2e3b7a4ae4d4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

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


  Commit: 644ea0bcf7a1459d733f7b459426b62a0b91616f
      https://github.com/siemens/jailhouse/commit/644ea0bcf7a1459d733f7b459426b62a0b91616f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Expand interrupt control to device level

This will allow to introduce a one-shot mode later on.

The reworked interrupt control register starts disabled on reset.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d8fef1e581b0c815fc140320909cb64410aff707
      https://github.com/siemens/jailhouse/commit/d8fef1e581b0c815fc140320909cb64410aff707
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

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


  Commit: bf7e606884149c0aac53ce7557f104d9d3d9258c
      https://github.com/siemens/jailhouse/commit/bf7e606884149c0aac53ce7557f104d9d3d9258c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

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


  Commit: 5890fa29798400820c97d69ca01920e64a5b26fa
      https://github.com/siemens/jailhouse/commit/5890fa29798400820c97d69ca01920e64a5b26fa
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

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


  Commit: 6e6de7a3a16490c7986610eab437f77de936dc6e
      https://github.com/siemens/jailhouse/commit/6e6de7a3a16490c7986610eab437f77de936dc6e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

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


  Commit: 98bb39c61a5d6545c9c1d71c776d16ae4c2d33b0
      https://github.com/siemens/jailhouse/commit/98bb39c61a5d6545c9c1d71c776d16ae4c2d33b0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

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


  Commit: 1ad6a06b6b60d32a5d78d4f9f677e3d3d35daef3
      https://github.com/siemens/jailhouse/commit/1ad6a06b6b60d32a5d78d4f9f677e3d3d35daef3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h

  Log Message:
  -----------
  core: ivshmem: Reorder ivshmem_endpoint fields

Move state and ioregion to the end because they are not needed in
hot-paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 443ea045914c05f404cf0e3a8ca37233469f7975
      https://github.com/siemens/jailhouse/commit/443ea045914c05f404cf0e3a8ca37233469f7975
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

  Changed paths:
    A Documentation/ivshmem-v2-specification.md

  Log Message:
  -----------
  Documentation: Add specification of IVSHMEM v2 device

Add a WiP specification for the new IVSHMEM version. This documents the
current state and should not be considered stable at this point.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e57c2d76a36dc641a8b2a62bd6c69ae98d01a1f3
      https://github.com/siemens/jailhouse/commit/e57c2d76a36dc641a8b2a62bd6c69ae98d01a1f3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  configs: Add ivshmem protocol defines for virtio to cell-config.h

This defines the protocol ID ranges for virtio backends and frontends
along with a view virtio device IDs, allowing to create such devices in
cell configs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 96bef996ba06d2baabd41c6ecabd31924fd2790e
      https://github.com/siemens/jailhouse/commit/96bef996ba06d2baabd41c6ecabd31924fd2790e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

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


  Commit: 04880694e57a8f9fbe91f1dcced0db191c0590ba
      https://github.com/siemens/jailhouse/commit/04880694e57a8f9fbe91f1dcced0db191c0590ba
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-28 (Sat, 28 Dec 2019)

  Changed paths:
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: x86: Add virtio block device between qemu-x86 and linux-x86-demo

This enables the root cell to provide a virtio block device via ivshmem
to the non-root Linux cell.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/446d77478239...04880694e57a

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/ivshmem2/446d77-048806%40github.com.
