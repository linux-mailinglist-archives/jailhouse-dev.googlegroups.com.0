Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBBMJSDXQKGQEEPZI75Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id D035610E300
	for <lists+jailhouse-dev@lfdr.de>; Sun,  1 Dec 2019 19:20:55 +0100 (CET)
Received: by mail-oi1-x237.google.com with SMTP id g189sf17161304oif.10
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Dec 2019 10:20:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575224454; cv=pass;
        d=google.com; s=arc-20160816;
        b=s3iFf139fDSa5isL/llD4FwY0SBB+PGSM/iSOQB81hwWNiPVssx03exWM0bBFYOo5K
         CrOEFTm7THFt2JnJdmWgFGkp6am5GnY7c+ZKt6MH0u37Lf5DOpCMjrO4X/AN+R9ablNw
         zAf3acgE1DLNU99kwdp50rAmQCWln0IXhidfwuOgLoJWVc5y3Iq1VxadTuJk0wRrqrDt
         CZP7GMOsMXpeKet1GaryiZ/D7hdztm1UDc+giAxYm09NpmX4z+e1Bhft8R5JuFK3vF+5
         ArNSOODhxpzL/bBPtd2UVRsAjE5UydTclPK7PC/HF3lWdSpU1NFVjRqdVs6FxQEuDFB9
         NDfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=yanJz+m1D/WxlJ/T9XHc75TYIKIOa1Gfq59Lnqrubs4=;
        b=CrWHCKOlNhgFSvYCKQ4rem99MIsJlyyZlgPD47JUY0PHnrLevLS5TY7l0kwHSxvrW3
         50RlbSefe3u/I8Rnr0usFHdWliuLdCVWHqtvcy19Rctk1camoFB5ip3HRZNLZSWCojZn
         tkUyc9xoJGR/KeaUwxL8ZWIa4VGelXk1tJbEHrOQyHvDTx2iUDNs8xMa4xnlUUxXUoYz
         idFBJNCS/tSA+fVF2DqTJp9DngUirA+6Ji/+99PRRP2VQb3q7vt/95ougrzxHfFRr1Ux
         kdXN+UEaiufmgjC4/ZBqUTkOeo8XsElzomnps5uebppIPEoqPo7W3Oorfmijm4MkLSNw
         DP4w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=i7L11BzX;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yanJz+m1D/WxlJ/T9XHc75TYIKIOa1Gfq59Lnqrubs4=;
        b=FusqRqAYVVDyBZdDQRV0gBUuKXFP7STSCTCBzdgvR9bb1AiyYhVke6fekFonDifSJY
         ZdDUwqiteNz19vMHLZlWQDsCv7WE1kRsHa+iNDtfh6qMnZjNeLXMtgcYPwggLjMI83yU
         nRN8y7UV7qGVHUXBE1AtV0PiXKTFWrk230aKyCNEu+Io7UOPltBmstteSen9ZW0sYIRt
         NYr4feofw9ICcdRB1BhNCZ6Kf3CGu+xXj/DEU40KVwmPkxO6I1kdKvOe7S56s4uTlD4Y
         g8rIgCvtodHAeO1kxjBxnC6utlItl+Xi1kuGVlrlGqUZvdwtl0HuNXvzgaJn7E840l9v
         RVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yanJz+m1D/WxlJ/T9XHc75TYIKIOa1Gfq59Lnqrubs4=;
        b=MRgzxT8ijek8fYGSJ97PHwM13lT9foCB0nyD7cIr2GplSZwgWwEmqbj4URi/iwKQN4
         fJnj8HLmEmNmrarRJgT4DdWzIx0PVLa/5XypVjodqggMxv6/5E+bftZZrNY5JTYeyTwd
         /7ApZ5dhIE50hNy4PrAkccbDChKCXaiUBzqrK6e2heRY4nXQPHmISC7ErZCn6NcRxQOD
         QuFgVsd9rEd76Cdr2cG9E2fMuD9XjMRH6cZWPww4Lt+1w6W58eMJKeCLLSfqXCMMfC0q
         l9/xT6QP9ujjsZiUYeQxyp1Ioh728fH+OO9e/CdXJqPZ0i0PDvcPZzjnBJ9Qagg6vgeJ
         grxQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVJo1I1RO29ANMeS1KTqE5zu4MI4PFHfQq1VzHhpn+4Dij5YRGy
	09FamWAVPCK4c93y88sNeGY=
X-Google-Smtp-Source: APXvYqxrdtqKjx1IFJkc8br715UcEf6k6+ZsBYJqdNRcNCmWeaX3VW1PqTt2SJkJHZDPc5gFshzP6A==
X-Received: by 2002:a05:6830:11d3:: with SMTP id v19mr17041278otq.322.1575224454014;
        Sun, 01 Dec 2019 10:20:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a54:4597:: with SMTP id z23ls5580012oib.15.gmail; Sun, 01
 Dec 2019 10:20:53 -0800 (PST)
X-Received: by 2002:aca:c74e:: with SMTP id x75mr21689431oif.140.1575224453141;
        Sun, 01 Dec 2019 10:20:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575224453; cv=none;
        d=google.com; s=arc-20160816;
        b=vlVKCFXsz8R2u/0w5VdG80WnWYkw3MPxDIpF5gK2bwMSR2LKjCiG1KJwm3zawhI8jt
         IDnWPSJPubyYtV8GU5DBA8B96NcK4HqyVprMwY2n5AUkz8D3cUg1DvbRU2B5fzSpu2Sh
         kC7kwf8LJCfocYxbx+r0l12RkZTqduiaKHyxSgl6fGQNP8RPzGMlu2YZ2EpY2E078jSE
         17y3td96e7QP4ugOPbTOPCONz8KYEMpJhrsvS5KDLZi7m0J+bpJ/jtmUTldsa1CmY/Km
         1lld32lD7XbmA4964TursQklErDSWURzlW3BwLuzCVQAndAuTKfIyaYUo9b16DQCr7lJ
         jYwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=wENXKGjlH4UfUd/u912q7m+/SEMz0ekyp/5hiD5CGeo=;
        b=FZoKSCYX9B1/VhrfTtW1E3woBq36upXODBNCYOJdCZIAITXfvtbaRYSA65Anvubrq/
         CTQYsvLPhsHf10v3qbtE6M55NlWc98p2Xc3g5QWjJ2Pe5dm3dS9jt2+xgfYnrhdd/n7m
         CIfMSw/qfGonIWv7yjJzAZbw50ppMdkm1VAzkz+T14lTm5lkeAagviFQMaWzRWXukROw
         olZRzMO9+9L15AVg0ZUR+QeHqMnmub5jk19XVk9VRfHIgM+hh5X9YHwUGLscjj8TJfMu
         3LVqjm8OJIDdBUWnsB310KC2akZlgY2uj+Av1rKWPueQsQNImf++GNEk2VqA+zXtPhkr
         d7OQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=i7L11BzX;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-13.smtp.github.com (out-13.smtp.github.com. [192.30.254.196])
        by gmr-mx.google.com with ESMTPS id x65si1186219oig.5.2019.12.01.10.20.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Dec 2019 10:20:53 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) client-ip=192.30.254.196;
Received: from github-lowworker-292e294.va3-iad.github.net (github-lowworker-292e294.va3-iad.github.net [10.48.102.70])
	by smtp.github.com (Postfix) with ESMTP id 4A02F261576
	for <jailhouse-dev@googlegroups.com>; Sun,  1 Dec 2019 10:20:52 -0800 (PST)
Date: Sun, 01 Dec 2019 10:20:51 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/bac03e-446d77@github.com>
Subject: [siemens/jailhouse] a22a8d: README: Update x86 qemu command lines
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=i7L11BzX;       spf=pass
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: a22a8d84d20ecfe506b89a7f4019acb3febf8fa3
      https://github.com/siemens/jailhouse/commit/a22a8d84d20ecfe506b89a7f4019acb3febf8fa3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-08 (Fri, 08 Nov 2019)

  Changed paths:
    M README.md

  Log Message:
  -----------
  README: Update x86 qemu command lines

With the next QEMU release, VMX CPU features will no longer be passed
through from the host when using kvm64 as CPU. Rather use "host" as
model and ensure that incompatible PV features are off.

Use this chance to align the AMD command line, turning off some
additional PV feature.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 45c1fe05159bb2e44e962b466ab8207f0a91606e
      https://github.com/siemens/jailhouse/commit/45c1fe05159bb2e44e962b466ab8207f0a91606e
  Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  Date:   2019-11-10 (Sun, 10 Nov 2019)

  Changed paths:
    M tools/Makefile

  Log Message:
  -----------
  tools/Makefile: fix install of jailhouse-config-collect

Since commit 37bc6c12a1b365250c0dcdd82ae1ac5a869898e1,
jailhouse-config-collect is not installed anymore on target as HELPERS
is updated after install-libexec target so fix this mistake

Fixes: 37bc6c12a1b3 ("tools: Allow to build jailhouse-config-collect independent of PYTHON_PIP_USABLE")
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Jan: always initialize HELPERS]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6d689ad09e57f96aae32f842e9e8bbf4c4d39a17
      https://github.com/siemens/jailhouse/commit/6d689ad09e57f96aae32f842e9e8bbf4c4d39a17
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-17 (Sun, 17 Nov 2019)

  Changed paths:
    M hypervisor/arch/x86/efifb.c

  Log Message:
  -----------
  x86: efifb: Fix 1024x768 mode

Exactly, it's *768*. This digit flip broke scrolling at best or even
hang the box when the framebuffer mapping was sized as needed.

Fixes: 790ac72a3ee5 ("x86: Add EFI framebuffer debug console")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2338c060b38df1b3dbafc81371574353db2e4093
      https://github.com/siemens/jailhouse/commit/2338c060b38df1b3dbafc81371574353db2e4093
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-17 (Sun, 17 Nov 2019)

  Changed paths:
    M Documentation/debug-output.md

  Log Message:
  -----------
  Documentation: Fix EFI framebuffer configuration help

JAILHOUSE_CON_MMIO is mandatory, or the driver won't map the
framebuffer.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cd140c5a6d858a5b23bcb3dffd55876817aa79d0
      https://github.com/siemens/jailhouse/commit/cd140c5a6d858a5b23bcb3dffd55876817aa79d0
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-11-25 (Mon, 25 Nov 2019)

  Changed paths:
    M tools/jailhouse-config-create

  Log Message:
  -----------
  tools: jailhouse-config-create: fix python warnings

Python 3.8 complains:

  GEN     /home/ralf/jailhouse/tools/jailhouse-config-collect
/home/ralf/jailhouse/tools/jailhouse-config-create:230: SyntaxWarning: "is" with a literal. Did you mean "=="?
  if ((options.root is '/') and (os.geteuid() is not 0)):
/home/ralf/jailhouse/tools/jailhouse-config-create:230: SyntaxWarning: "is not" with a literal. Did you mean "!="?
  if ((options.root is '/') and (os.geteuid() is not 0)):

Fix it. And remove some parentheses.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 181fa02596902975a92232282f7b53e05545b48a
      https://github.com/siemens/jailhouse/commit/181fa02596902975a92232282f7b53e05545b48a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: c830d34c532bdcca69f93600152b8d3ca9045756
      https://github.com/siemens/jailhouse/commit/c830d34c532bdcca69f93600152b8d3ca9045756
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: 7e69864e78c803de8c44c42c0c747a6bbcac2b06
      https://github.com/siemens/jailhouse/commit/7e69864e78c803de8c44c42c0c747a6bbcac2b06
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: 98fe17e291d3020b4bb8e1a0364affe6bde95abe
      https://github.com/siemens/jailhouse/commit/98fe17e291d3020b4bb8e1a0364affe6bde95abe
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Enable unprivileged MMIO register access

Make sure that unsupported accesses to the MMIO register region do not
raise immediate panic. We should rather ignore them. This allows the
cell OS to hand out the region to unprivileged users.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6c0a3b9430b23b443164ce073051d8242b9fef8a
      https://github.com/siemens/jailhouse/commit/6c0a3b9430b23b443164ce073051d8242b9fef8a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: bae24f95289bff4e15879e2307110d0c6ddac901
      https://github.com/siemens/jailhouse/commit/bae24f95289bff4e15879e2307110d0c6ddac901
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: f6113c076982f4621d879e1c674672b5360eca0a
      https://github.com/siemens/jailhouse/commit/f6113c076982f4621d879e1c674672b5360eca0a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: e8bed05c3b6bcf95ce5785f3213a7ceff267e7db
      https://github.com/siemens/jailhouse/commit/e8bed05c3b6bcf95ce5785f3213a7ceff267e7db
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Reorganize MMIO registers

A number of changes to the MMIO registers are upcoming. This prepares
the layout for that and renames DBELL to more telling DOORBELL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 73821b711a9c15585cade746d5191e53851b837f
      https://github.com/siemens/jailhouse/commit/73821b711a9c15585cade746d5191e53851b837f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename IVPOS register to ID

This is a more logical name for the register as it returns a unique
identifier of the device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2454b08c40dc6704a121d2c879e47a5ddd0b1a38
      https://github.com/siemens/jailhouse/commit/2454b08c40dc6704a121d2c879e47a5ddd0b1a38
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add MAX_PEERS register

This allows the guest to discover the maximum number of peers connected
via an ivshmem device. We only support 2 so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9b1c4642e70dd34a2cfd9b30d7902feb9e542ad7
      https://github.com/siemens/jailhouse/commit/9b1c4642e70dd34a2cfd9b30d7902feb9e542ad7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: 9b04ebf9dec2c1dcb1897d3fbde532335183ea29
      https://github.com/siemens/jailhouse/commit/9b04ebf9dec2c1dcb1897d3fbde532335183ea29
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Use device ID from config

Convert the creation-order based ID assignment to the one now provided
by the cell configuration.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7b6acb5474c449eb660ef4e4971e906a683ef99d
      https://github.com/siemens/jailhouse/commit/7b6acb5474c449eb660ef4e4971e906a683ef99d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: f5402b8cf65e4a125a625cc1911c0da85bd2ac36
      https://github.com/siemens/jailhouse/commit/f5402b8cf65e4a125a625cc1911c0da85bd2ac36
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Mask MSI-X vector on reset

This is demanded by the PCI spec.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cac0e7aad3ab9a3fe2f263a0b42286801939f226
      https://github.com/siemens/jailhouse/commit/cac0e7aad3ab9a3fe2f263a0b42286801939f226
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: aea93c1717401efd80b6138afb47a780b5af0c73
      https://github.com/siemens/jailhouse/commit/aea93c1717401efd80b6138afb47a780b5af0c73
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: 483cb89a0021ea21eb3fa5bee96577fe4bfce74c
      https://github.com/siemens/jailhouse/commit/483cb89a0021ea21eb3fa5bee96577fe4bfce74c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename ivshmem_data to ivshmem_link

Represents more clearly what the structure is about: meta data
describing the link between two ivshmem endpoints.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 51619b91c0891362514092591fd8f09122e1883e
      https://github.com/siemens/jailhouse/commit/51619b91c0891362514092591fd8f09122e1883e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Avoid assumption about size of ivshmem_link

It does currently fit into one page, but there is no reason to hard-code
this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4e55f2ad56a942886ac94ef65003a543ee079171
      https://github.com/siemens/jailhouse/commit/4e55f2ad56a942886ac94ef65003a543ee079171
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Introduce link pointer to ivshmem_endpoint

Will be used when looking up an interrupt target by ID.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 77801a9b5130628bb14af4939e14122bcd1c49f1
      https://github.com/siemens/jailhouse/commit/77801a9b5130628bb14af4939e14122bcd1c49f1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Relax peer matching rules

Only match based on BDF from no one. We will rework the number of shared
memory regions, and matching them all will an enormous effort. This
should rather be pushed eventually into an offline check.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e71354234f567053488d4ac9a9d6b4ec3379c3dc
      https://github.com/siemens/jailhouse/commit/e71354234f567053488d4ac9a9d6b4ec3379c3dc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: da526840bf300763c2e523a4dc79231e96af33fc
      https://github.com/siemens/jailhouse/commit/da526840bf300763c2e523a4dc79231e96af33fc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: ef6b80dbdd7b1933958f0578009387b71306f534
      https://github.com/siemens/jailhouse/commit/ef6b80dbdd7b1933958f0578009387b71306f534
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Re-add target ID to doorbell register

Just like the original ivshmem, use the upper 16 bits of the value
written to the doorbell register. This allows both self signaling and
lays the ground for multi-peer support.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4c5b511ff7473236528c988e9ffd92fa582bbc02
      https://github.com/siemens/jailhouse/commit/4c5b511ff7473236528c988e9ffd92fa582bbc02
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: 877f0a46d6062747848e3433e7eff8f11b545c79
      https://github.com/siemens/jailhouse/commit/877f0a46d6062747848e3433e7eff8f11b545c79
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

  Changed paths:
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c
    M hypervisor/arch/arm-common/include/asm/ivshmem.h
    M hypervisor/arch/arm-common/ivshmem.c
    M hypervisor/arch/x86/include/asm/ivshmem.h
    M hypervisor/arch/x86/ivshmem.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core, configs: ivshmem: Add support for multiple interrupt vectors

This allows to spread out state-related interrupts (always vector 0) and
other sources (e.g. RX/TX). The doorbell register accepts the desired
vector in its lower 16 bits, ignoring anything that is not supported by
the peers.

The MSI-X MMIO region is expanded to hold the maximum possible number of
vectors (currently 16). This static sizing keeps the hypervisor simple.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0b71285fb36cd720589b69dbc305564b54f91363
      https://github.com/siemens/jailhouse/commit/0b71285fb36cd720589b69dbc305564b54f91363
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: 8194ed4d806e5aed5503a607c6117ecb257bcfba
      https://github.com/siemens/jailhouse/commit/8194ed4d806e5aed5503a607c6117ecb257bcfba
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Expand interrupt control to device level

This will allow to introduce a one-shot mode later on.

The reworked interrupt control register starts disabled on reset.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 13b3c91ad24042462b3a5232e6865681f094a403
      https://github.com/siemens/jailhouse/commit/13b3c91ad24042462b3a5232e6865681f094a403
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: 73c609c0b1db5bc8f08947321d9ac99480f0e13b
      https://github.com/siemens/jailhouse/commit/73c609c0b1db5bc8f08947321d9ac99480f0e13b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: d6a6b3e9176979a416072c13a2ef5c535cbe746c
      https://github.com/siemens/jailhouse/commit/d6a6b3e9176979a416072c13a2ef5c535cbe746c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: f2d279f9ee20146e973971940e2aa935bad25769
      https://github.com/siemens/jailhouse/commit/f2d279f9ee20146e973971940e2aa935bad25769
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: 34af32f3c6ed31c227d10645d5204e76e2219718
      https://github.com/siemens/jailhouse/commit/34af32f3c6ed31c227d10645d5204e76e2219718
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

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


  Commit: cf63efa8f3c36a32d42ca27495224672ff348b8f
      https://github.com/siemens/jailhouse/commit/cf63efa8f3c36a32d42ca27495224672ff348b8f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h

  Log Message:
  -----------
  core: ivshmem: Reorder ivshmem_endpoint fields

Move state and ioregion to the end because they are not needed in
hot-paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: caae0c91a05b2a836a8616c4ce6c16e5e044d07f
      https://github.com/siemens/jailhouse/commit/caae0c91a05b2a836a8616c4ce6c16e5e044d07f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

  Changed paths:
    A Documentation/ivshmem-v2-specification.md

  Log Message:
  -----------
  Documentation: Add specification of IVSHMEM v2 device

Add a WiP specification for the new IVSHMEM version. This documents the
current state and should not be considered stable at this point.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a94db6b861d129f4a7e321ce6ccd3ba2e1f4b7ef
      https://github.com/siemens/jailhouse/commit/a94db6b861d129f4a7e321ce6ccd3ba2e1f4b7ef
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-26 (Tue, 26 Nov 2019)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  configs: Add ivshmem protocol defines for virtio to cell-config.h

This defines the protocol ID ranges for virtio backends and frontends
along with a view virtio device IDs, allowing to create such devices in
cell configs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: dac55c615dcd8d21aff114f1829622dabde5563e
      https://github.com/siemens/jailhouse/commit/dac55c615dcd8d21aff114f1829622dabde5563e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-01 (Sun, 01 Dec 2019)

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
  configs: x86: Add virtio console device between qemu-x86 and linux-x86-demo

This enables the root cell to provide a virtio console via ivshmem to
the non-root Linux cell.

To make space for this shared memory and another upcoming one, move the
demo inmates one MB down in physical memory.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 446d77478239d18d5955b4f2346173c6fc65ef32
      https://github.com/siemens/jailhouse/commit/446d77478239d18d5955b4f2346173c6fc65ef32
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-01 (Sun, 01 Dec 2019)

  Changed paths:
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: x86: Add virtio block device between qemu-x86 and linux-x86-demo

This enables the root cell to provide a virtio block device via ivshmem
to the non-root Linux cell.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/bac03e4d5f54...446d77478239

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/bac03e-446d77%40github.com.
