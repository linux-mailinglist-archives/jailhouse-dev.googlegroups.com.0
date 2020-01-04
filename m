Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBXGRYHYAKGQEGL723DA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3b.google.com (mail-vk1-xa3b.google.com [IPv6:2607:f8b0:4864:20::a3b])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE931301C2
	for <lists+jailhouse-dev@lfdr.de>; Sat,  4 Jan 2020 11:28:45 +0100 (CET)
Received: by mail-vk1-xa3b.google.com with SMTP id h18sf18316785vkh.13
        for <lists+jailhouse-dev@lfdr.de>; Sat, 04 Jan 2020 02:28:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578133725; cv=pass;
        d=google.com; s=arc-20160816;
        b=jboE8pd17mWAdipnGZeX8hCFk2qZJz5q6tsrGkWeHQnFpJmglRi9euh9vUDQITu9Hf
         vnFDgBW+ybHysm4lde1hTLgQ7mejnrEJZVwnEKm0AZy3YFMoZroAN0P1qTd970hdyyKn
         1cAMZ+7XqSrg2NaaDLH7E2SBzrFtL/lIDCedUMkuqkFWRroLZsk0DwSfX0Cc+/5J9gO4
         yD6U+sMhO10/a8i+/AsMU1wpp1aaJ5huC40AsJnaDVhIh1jthTZrbnWYCkB1Nm6sfNkG
         dwnHeJjJXFVujWniBGC7DkrOi41DI01LFt6mTpkfjtE2VDrTZneYZc6BlbAFFq+JHXfD
         Dw5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=muVGIeB9FxeCYIcRpgn2FsS7PFav1ROIQMeS6KQc650=;
        b=voTKFsT7G4r2Z5j+JIQlUYn3vM4zQwThY8NW46AVeLdoUBOi3q7Seukhj/GtZPI4RT
         BnW+gu8n2VddnmxSH2flvyL/thW57ugGyUHtZtQik9qULmb3ZwwRpMUoRbnEInBy2HDG
         VWvqiF5kzy8zZy3mDNfpdNGN+2JpQLxL52iWHiS7riDtVfLNiWMUAcsMopqkzt7LcAoB
         NnlNfDnBB9UbW/nPBMZu7qp5fe/5qMa5YZgUUCU11wh/mVMEkJMjJFQ5K0CMCcTilZyH
         A8tiCWVJGSb1Ymy/oHnk/0IItP+NmQsRtEIP6LfymDto9rSqcIAEThQeNjAluNRcgM2O
         0fIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=zrbwNA5d;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=muVGIeB9FxeCYIcRpgn2FsS7PFav1ROIQMeS6KQc650=;
        b=LoMQ2Yrm9Hp3UBgLGgu3SHJtH1qoxcJ8JCq3mJgz/LMYCRPxe4NyGnb7Bw8Ii0njca
         mWgewlagb6fPOP4J8xm9Z46d67XHeEEtm2RWjkapiM8FcWZ0HheAvs05I5Zqt1ZgMon7
         4k/w39Oq2KJNikfrYj4YoOOnTiEWhRXfqDCCNXjkK/Bp6nDvZhEK0qTWS7HhVwhXtCDK
         DLAkIt7Bgs0aEeUSkjqUL8BWlJHt018bnegs6TqGF7ltSRDUyoTjaOS+3nSVMpjW3qIB
         wUcM3fMdAbu1dRMRr7NxYLFdcumH7u8ak+77+IECx/xAIvfbVPBkwaOVDqVqxMqO0s/S
         fKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=muVGIeB9FxeCYIcRpgn2FsS7PFav1ROIQMeS6KQc650=;
        b=jnDzZbO6Olo+Jz3kBg6E4TihYqJ5+P5AxVtJzn0IqD7jjtH9UWM+y8QJ6nWnCoDFCk
         lDoaDNRHP2lpL5v3cEzvbuwvatixPaL1twCnRPRDEAodMJRP8+1NQCYPzi2ezuku2dRo
         6CagPKNuhiNiFpnlPVF5VLEojMzSSouVANhUBMT+ur8L13dn7LV2IMgkD1hUyqRa6BQn
         kNSHk9K4BdMVwo8/oCIvtoy7CZgT8k3Ryn3VPkQuHCNOI85l+IUOFrQ+z2GE0OoqCJ6w
         ANodz/nhGe3DWbJchHCTFZrcnCh2r6FWJxvGVfoeprzh0qFBNmhoskEO+EBVrWcRNUVz
         qwgg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXMO0gwNBtQfqkXt62Gg64R+VUNRrmUglgsZSZUIZdt4CHVI33L
	oBCsWW3gYEoVHVZRcRJdV8s=
X-Google-Smtp-Source: APXvYqwqbpcXuU/3lGqs3ELwZXOdk2EL/ea42amQb+7V67KDQgcZzuh0flJE9DNYIt969KHegeAR5Q==
X-Received: by 2002:a1f:bf86:: with SMTP id p128mr51043253vkf.3.1578133724669;
        Sat, 04 Jan 2020 02:28:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:2a83:: with SMTP id h3ls1945616uar.11.gmail; Sat, 04 Jan
 2020 02:28:44 -0800 (PST)
X-Received: by 2002:ab0:5512:: with SMTP id t18mr54921724uaa.128.1578133723967;
        Sat, 04 Jan 2020 02:28:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578133723; cv=none;
        d=google.com; s=arc-20160816;
        b=bRHwKg6i5ZOWfXQgajeOMu25fsDmPIxq6qI1Q77W+CPAwj6rY2sOzhSEipqXCEmaB7
         FQkKK7tkXKl/WP9ztIopC+OkfrsHnK//IWqUKbCQOfsIbM5JYCTAauvz2F4dGaHPPfPR
         1H7j8T+SwepzdEvfZCq7WoDjN0WZPfFmDKTgB+O3ZJuAWmD/KeFvKWR4IHpMhB/inhRl
         q55vORXqMaJZjigQj/cxBLg8xwHzXbJyfh0Npt1Wm7pGJNFfGX8zCx7D3k7Hrzzv+9gX
         1DIF8Jrs7BgP534Uqtm0V/8xTo1IqzuSjfdym7w6rPijx/mmGyqhPLxNqsmHlkvB3wSY
         VmLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=dywNdFChAY4rdZuJfLUJHs++5cO0l56lTsF3Z1x+kVo=;
        b=F2nCdmkKxrgjlKtI0WaG4IrT03iVdf/dJqwAkc97F+Kl73bV5d255iiqgxUtrkmvuJ
         0omFyc/HEAvIbbONZux7z9KacQB6q08idpKrfugHiKrY92G4vltnwlgych7Sl7AIQtpS
         083erpPd+R9VAi77gvYJwlhQPstaPFD10EVZZzOe8vDvLEPjIpzaxGphtggW7Px9GfXe
         ZaRPKTIZKbN+LJK+odAFcG5rJywKmjvZe/ve9CwrePa+auM+gFuvzlJYUY3yHlkw/ADM
         18af4eFM+d9OjlgKnxCUCVdqOKrqTHRYkazkoSlrzCN4aM/woaAMo19XVbTH2BYWNUBZ
         4ONg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=zrbwNA5d;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id z14si1865388vsf.0.2020.01.04.02.28.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jan 2020 02:28:43 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Received: from github-lowworker-25680bd.va3-iad.github.net (github-lowworker-25680bd.va3-iad.github.net [10.48.17.61])
	by smtp.github.com (Postfix) with ESMTP id A07AC520BE9
	for <jailhouse-dev@googlegroups.com>; Sat,  4 Jan 2020 02:28:43 -0800 (PST)
Date: Sat, 04 Jan 2020 02:28:43 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/048806-4b795c@github.com>
Subject: [siemens/jailhouse] 22217b: core: ivshmem: Use Siemens-provided
 device ID
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=zrbwNA5d;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.202 as
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: 22217b9e35d72cfde614a70ce13f55294fa02547
      https://github.com/siemens/jailhouse/commit/22217b9e35d72cfde614a70ce13f55294fa02547
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 45cab7b2de208664b65223e89ee291247e065f1f
      https://github.com/siemens/jailhouse/commit/45cab7b2de208664b65223e89ee291247e065f1f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: ce559c4d89904280339a1f485e81e5ee214ec0c3
      https://github.com/siemens/jailhouse/commit/ce559c4d89904280339a1f485e81e5ee214ec0c3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 9653731551755218c937fa3bc3786f3a024db941
      https://github.com/siemens/jailhouse/commit/9653731551755218c937fa3bc3786f3a024db941
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Enable unprivileged MMIO register access

Make sure that unsupported accesses to the MMIO register region do not
raise immediate panic. We should rather ignore them. This allows the
cell OS to hand out the region to unprivileged users.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bf0ebd38eb1aa3f669a08309e5c086e80d73facf
      https://github.com/siemens/jailhouse/commit/bf0ebd38eb1aa3f669a08309e5c086e80d73facf
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 09cd29c3ba2bf53ecbf01911e5b435dc224ccca9
      https://github.com/siemens/jailhouse/commit/09cd29c3ba2bf53ecbf01911e5b435dc224ccca9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 41bbf781fdee2c5f7e8a25da5f58fdc20a92d7c3
      https://github.com/siemens/jailhouse/commit/41bbf781fdee2c5f7e8a25da5f58fdc20a92d7c3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: f1fb911d8bb4a1f91a869b1ded59cfdc9e533c4e
      https://github.com/siemens/jailhouse/commit/f1fb911d8bb4a1f91a869b1ded59cfdc9e533c4e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: f08951c49aa85867479dee5c5cb99e7bca8a718d
      https://github.com/siemens/jailhouse/commit/f08951c49aa85867479dee5c5cb99e7bca8a718d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Reorganize MMIO registers

A number of changes to the MMIO registers are upcoming. This prepares
the layout for that and renames DBELL to more telling DOORBELL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6bfcbfa6f4f0498756d61c29d3838e1ac8cbe494
      https://github.com/siemens/jailhouse/commit/6bfcbfa6f4f0498756d61c29d3838e1ac8cbe494
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename IVPOS register to ID

This is a more logical name for the register as it returns a unique
identifier of the device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e81de2ab0b20de3bb37f4b75e87b1811ecb2a8ab
      https://github.com/siemens/jailhouse/commit/e81de2ab0b20de3bb37f4b75e87b1811ecb2a8ab
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add MAX_PEERS register

This allows the guest to discover the maximum number of peers connected
via an ivshmem device. We only support 2 so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3b078aa0e9f3f773d7ce5649072e66d6b5e84cf6
      https://github.com/siemens/jailhouse/commit/3b078aa0e9f3f773d7ce5649072e66d6b5e84cf6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 873890818c91937fcbb89ef177eb55420672531f
      https://github.com/siemens/jailhouse/commit/873890818c91937fcbb89ef177eb55420672531f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Use device ID from config

Convert the creation-order based ID assignment to the one now provided
by the cell configuration.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1ee48a37170bf484952c6d84d6bbc65220917ed6
      https://github.com/siemens/jailhouse/commit/1ee48a37170bf484952c6d84d6bbc65220917ed6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 603e6476c7f8c3f30e073426ba869a7adc977040
      https://github.com/siemens/jailhouse/commit/603e6476c7f8c3f30e073426ba869a7adc977040
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Mask MSI-X vector on reset

This is demanded by the PCI spec.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1b4240309beee64f18840545ce1a6e7a0021e25f
      https://github.com/siemens/jailhouse/commit/1b4240309beee64f18840545ce1a6e7a0021e25f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 9bd1446a0f7dba0267be97be5a71712923003ee4
      https://github.com/siemens/jailhouse/commit/9bd1446a0f7dba0267be97be5a71712923003ee4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 91d7c64b39a174d03268388b5e21eee462fca6ce
      https://github.com/siemens/jailhouse/commit/91d7c64b39a174d03268388b5e21eee462fca6ce
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename ivshmem_data to ivshmem_link

Represents more clearly what the structure is about: meta data
describing the link between two ivshmem endpoints.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ff630fbb5799ce8c01b3b9931254d4f5365aefd6
      https://github.com/siemens/jailhouse/commit/ff630fbb5799ce8c01b3b9931254d4f5365aefd6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Avoid assumption about size of ivshmem_link

It does currently fit into one page, but there is no reason to hard-code
this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 31058b4182efb50253be921fbdc2e75b66efddb2
      https://github.com/siemens/jailhouse/commit/31058b4182efb50253be921fbdc2e75b66efddb2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Introduce link pointer to ivshmem_endpoint

Will be used when looking up an interrupt target by ID.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 890a822c0f13b027273ac5169796168aea372c52
      https://github.com/siemens/jailhouse/commit/890a822c0f13b027273ac5169796168aea372c52
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Relax peer matching rules

Only match based on BDF from no one. We will rework the number of shared
memory regions, and matching them all will an enormous effort. This
should rather be pushed eventually into an offline check.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a96354b7c1ab3a0f9757dfb3fc88284a083b2a7f
      https://github.com/siemens/jailhouse/commit/a96354b7c1ab3a0f9757dfb3fc88284a083b2a7f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 92eaf1669ada066f2f2ab71602f2bef782b38438
      https://github.com/siemens/jailhouse/commit/92eaf1669ada066f2f2ab71602f2bef782b38438
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 697f9d4e58e1f7604f1ba49b56ffdb2c3287396e
      https://github.com/siemens/jailhouse/commit/697f9d4e58e1f7604f1ba49b56ffdb2c3287396e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 1d745886b28d168db44007a6d643c4719a95fb96
      https://github.com/siemens/jailhouse/commit/1d745886b28d168db44007a6d643c4719a95fb96
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: e4ede686ffe45ee9ba70044c549ff15a98d7554a
      https://github.com/siemens/jailhouse/commit/e4ede686ffe45ee9ba70044c549ff15a98d7554a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 04597d05c2f612cab3bd248b62f76fa218d3c34f
      https://github.com/siemens/jailhouse/commit/04597d05c2f612cab3bd248b62f76fa218d3c34f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Re-add target ID to doorbell register

Just like the original ivshmem, use the upper 16 bits of the value
written to the doorbell register. This allows both self signaling and
lays the ground for multi-peer support.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 651fbc9dc43e1b2e64e3563312e82fe075a826c4
      https://github.com/siemens/jailhouse/commit/651fbc9dc43e1b2e64e3563312e82fe075a826c4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 68c9e83b86233a86cba762dc01ec1ea9611bc886
      https://github.com/siemens/jailhouse/commit/68c9e83b86233a86cba762dc01ec1ea9611bc886
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: b0f35db257b2a8b6de2f21a016a4b735ddcaa9a6
      https://github.com/siemens/jailhouse/commit/b0f35db257b2a8b6de2f21a016a4b735ddcaa9a6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 85ee43a920bdb4170153d5c8ede1e4927ab47029
      https://github.com/siemens/jailhouse/commit/85ee43a920bdb4170153d5c8ede1e4927ab47029
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Expand interrupt control to device level

This will allow to introduce a one-shot mode later on.

The reworked interrupt control register starts disabled on reset.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ef73086d404f105657af934f96bcd1ee315928b9
      https://github.com/siemens/jailhouse/commit/ef73086d404f105657af934f96bcd1ee315928b9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 4b096d1716fc263ce451fa2eb942b984af4bd936
      https://github.com/siemens/jailhouse/commit/4b096d1716fc263ce451fa2eb942b984af4bd936
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 58c72994dfef979af1dc7cc5a2601e9cb8d6eda2
      https://github.com/siemens/jailhouse/commit/58c72994dfef979af1dc7cc5a2601e9cb8d6eda2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: f52d4b66afd2cae6e214626b1d23da1aca9b845e
      https://github.com/siemens/jailhouse/commit/f52d4b66afd2cae6e214626b1d23da1aca9b845e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 6b6184b158ae0db703f49427bf2e7af2b7b9c526
      https://github.com/siemens/jailhouse/commit/6b6184b158ae0db703f49427bf2e7af2b7b9c526
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: cd329e69a1bb754ac7a2236a9174ed5f4924f794
      https://github.com/siemens/jailhouse/commit/cd329e69a1bb754ac7a2236a9174ed5f4924f794
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h

  Log Message:
  -----------
  core: ivshmem: Reorder ivshmem_endpoint fields

Move state and ioregion to the end because they are not needed in
hot-paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ded816926257c960444e553119d1537f0bae0c7c
      https://github.com/siemens/jailhouse/commit/ded816926257c960444e553119d1537f0bae0c7c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    A Documentation/ivshmem-v2-specification.md

  Log Message:
  -----------
  Documentation: Add specification of IVSHMEM v2 device

Add a WiP specification for the new IVSHMEM version. This documents the
current state and should not be considered stable at this point.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 07de8937332c351a92e37a8757b3c165d28acc63
      https://github.com/siemens/jailhouse/commit/07de8937332c351a92e37a8757b3c165d28acc63
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  configs: Add ivshmem protocol defines for virtio to cell-config.h

This defines the protocol ID ranges for virtio backends and frontends
along with a view virtio device IDs, allowing to create such devices in
cell configs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ce4f73695087059b6487abb6e6bb52c0ec1c3883
      https://github.com/siemens/jailhouse/commit/ce4f73695087059b6487abb6e6bb52c0ec1c3883
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 9ecf47d61138825ca4d421fba4da72d90f7b1b4d
      https://github.com/siemens/jailhouse/commit/9ecf47d61138825ca4d421fba4da72d90f7b1b4d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: x86: Add virtio block device between qemu-x86 and linux-x86-demo

This enables the root cell to provide a virtio block device via ivshmem
to the non-root Linux cell.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f7c862369eb0e305a56a67a9ea80b9981ceae03c
      https://github.com/siemens/jailhouse/commit/f7c862369eb0e305a56a67a9ea80b9981ceae03c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 7964fb3826edd36a73486b3af642a65b1fa6643c
      https://github.com/siemens/jailhouse/commit/7964fb3826edd36a73486b3af642a65b1fa6643c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: d003c435809a9d758631863ebfc66ff71e2a6594
      https://github.com/siemens/jailhouse/commit/d003c435809a9d758631863ebfc66ff71e2a6594
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 51c4b3b4a95d7c602c76e83416c3c6eb397dd41d
      https://github.com/siemens/jailhouse/commit/51c4b3b4a95d7c602c76e83416c3c6eb397dd41d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: d85b28a156f54e5f03681d34e8e45fbb6c3e166b
      https://github.com/siemens/jailhouse/commit/d85b28a156f54e5f03681d34e8e45fbb6c3e166b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 2cc2b1dc4c5e465d8f7a5f1a27fee810ef965253
      https://github.com/siemens/jailhouse/commit/2cc2b1dc4c5e465d8f7a5f1a27fee810ef965253
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 04cb8ecadaf76992b73518d99b0bfdd461669b99
      https://github.com/siemens/jailhouse/commit/04cb8ecadaf76992b73518d99b0bfdd461669b99
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 863ed75b2fa7e15fd98739b25468c06f494bec92
      https://github.com/siemens/jailhouse/commit/863ed75b2fa7e15fd98739b25468c06f494bec92
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 67471142ba54d28e0b0fa2910c760cfaa34eed06
      https://github.com/siemens/jailhouse/commit/67471142ba54d28e0b0fa2910c760cfaa34eed06
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

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


  Commit: 4b795c3f7e5054a8106e1b7c975a943bcc47b844
      https://github.com/siemens/jailhouse/commit/4b795c3f7e5054a8106e1b7c975a943bcc47b844
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M configs/arm64/qemu-arm64-gic-demo.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c

  Log Message:
  -----------
  configs: arm64: Add ivshmem-demo support for qemu-arm64

Enhance the root cell config as well as gic-demo and linux-demo with a
3-peers ivshmem device so that ivshmem-demo can be used.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/04880694e57a...4b795c3f7e50

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/048806-4b795c%40github.com.
