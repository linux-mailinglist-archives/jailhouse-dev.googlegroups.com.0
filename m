Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBPWISLWQKGQE5F2G4JI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc37.google.com (mail-yw1-xc37.google.com [IPv6:2607:f8b0:4864:20::c37])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D509D677B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 18:37:19 +0200 (CEST)
Received: by mail-yw1-xc37.google.com with SMTP id p205sf14075801ywc.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 09:37:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571071038; cv=pass;
        d=google.com; s=arc-20160816;
        b=KXzKnSxSONeIcx4hhvul4swECIPT5gmIR+z1FX/miK5QtPrecJcHaWzL5y9LMvoBTl
         PoFNo6V8bmCXcohrPxEzuTJfPPvGJETRDBBC4AuA9e9XAyCkdLWdlH19gfozKnYlKKq6
         ngEu/ZZB8Oer8o989bSoHykhwHgJOKKe1z1aUaAKPmiTkYZaAdbi9nIt+/McDTw9Ykt3
         g8D5w1cisLph17XsiAbso+8r+jEE/xEwu6g0KN1AyPSh5U64+wwRa+ib01XqjVHofSZ5
         cR8EdEku654LHIfOojE2ynajFKpdTHNwPGSIJOGjKxvPbZdtvY+KZ0/Wd8AvLw0lhmqo
         I/WQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=spcmkJ+kKmsKCe7jjGmT+X47Dg111gICY58gb9iyN1Q=;
        b=F8o3nMa4JWIcZEbQeRF/tT4LtRAjXzGGABmo4PrfjXnpdGr5Yjv5JgavCkN9s6ndEl
         bddjZB7zLsjadxCaNJSb0fs5wRUaSP2mYj3kE7hVSg9y/E4yIhyQp72+pLnPv5X+x0xe
         zwKaQemw1WRFinPeJzlcHVHOD3+fEPW+v11oc9N5shkPTt0upNWuNp7Or10UCjSNa2mw
         0ZOcU7T6cKA6gvTWV08U59OQso6YkeNTb/r3PL6CQXnQIb6DgrQ0MoiHJ6M9fzOmqPJm
         bJCpX8ZdNAUi5pyPZp3Qd8CsYKNAx8OyokBv0uul/giwO8oxYw+N41iwx8Zp5GYSiyLH
         yFrg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=You5ew+y;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=spcmkJ+kKmsKCe7jjGmT+X47Dg111gICY58gb9iyN1Q=;
        b=NLkFdnlhtLtHUBlhtEhpHy0OGBsjhD9oQZ9ELcCArogfQ7Jgbl7dBCr3EqdKo7dQOI
         dK4i5N9q3GMjNiefSfTLUBOyr8hHhjon4JL6GczCS31ZD4UiJkx93e8lutKKvsqi9SAd
         gx7MMVgWKQk28V+dVkIVrco1eFvMboXCExuT3VCgLcmxUhUeH8SmMZipC0muZDxAkYal
         OQPNoVz6WmcTGZ2EqUX1AylAFB4VyAnkIAqq4I2rKLIBLZRQkJcF4F8qhG3BZIvTdzTl
         2YBdWiUDpF9kPNBjvUS42uFmzsPvwGR/yPZ244dB65X00avudSlzF0OblaozY6F9aVQ1
         9/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=spcmkJ+kKmsKCe7jjGmT+X47Dg111gICY58gb9iyN1Q=;
        b=tk1TEaJEVOwgTjOIHYJ+79LW8pzJiLHsSZzTP2rtyLVXHileuxOfwZfMEC7P6aCFI1
         y/riuAk8nbs0lb4ECl0/WBplcTt4KPWd0OAeccHhfQ6u05xtYuhhTChi89Wu+FmDi+/i
         Hrm4DE3Wfnd8qMTD8RwttkVUoukTZT5hznZHPXgJjmGAmWByoYcW7SB5QCzWkvzoNIH+
         wKSyYwuSQkFVMVbsy1HW9zh7bKCWdLAM09mFPbeRqYnwfxnQSBBHl7ob7bLvjXFlZAub
         HdAq7eGclH6Mtekv+igipnFnf9ICiTsbo4ebAD4wFgEd8tQvxqc0GsbL9Mk1uHu3jagn
         SBPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUzxVSTrLUZRs2NeddkMEfs7andzxx2zn9q1Kg2NwzTwMPGMEyI
	kLhlPYZKjZxRgch0W9QyLZI=
X-Google-Smtp-Source: APXvYqzaiV0sQFrcEL6Ey6Pva37W1GWk+3DP18QDaicXDQjTl2E2Z0Haw27tQWwNnTmgwM6+1C+Jfw==
X-Received: by 2002:a81:1ac4:: with SMTP id a187mr13972219ywa.482.1571071038493;
        Mon, 14 Oct 2019 09:37:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:8109:: with SMTP id o9ls2394431ybk.3.gmail; Mon, 14 Oct
 2019 09:37:17 -0700 (PDT)
X-Received: by 2002:a25:50cc:: with SMTP id e195mr2426856ybb.269.1571071037802;
        Mon, 14 Oct 2019 09:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571071037; cv=none;
        d=google.com; s=arc-20160816;
        b=RUfFusSuFTCzzD4VJeJUAXR1m5knB/KfBFfG6UKPDSGZ8GvteaJ4Y528IJALDIP+qL
         ymbBwj7Ovjx+RtORFvbXo9sZCoB8OblU0FnScGh+ZswCLlSUI7mfKRXRHyHADuFB9R0C
         3uapovDyNgvgR+Aj1PI7O4RVpIj+UEHw1fNGih8RWWWtSCFuHvvA0Eqmhaj79sgpSymv
         Ason/1fgTUneAgw6Wvph8pw1OOpB5PshZorZ71cUhac70Ticdy77q4shKDfyTbhLPPqa
         WPZeGib0T+fZSSC7E4rrFFNRV4+AgVmmF6pqivxpD7s+5RX0GmQLknG70RNgwUyfilqI
         ZzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=MMhEJWW1Tt7seFoRe/b5lm2bKe9kU6O3FFc31kUsHUo=;
        b=tUAcgS3lZy30JsB6WU6fnzf+KZfmDQrIJn2p5TGGBTsJsh/ZcNQZprJ9mn5dfgXDNw
         7wnlJ4ObSeUSBj71iW/cGRzn23bHKBZi9DGJOyIoOls9vUgYD1Q2CrYQlYqmdA0bzIOa
         udK7vcOPWFVsAlU84asyUJdP7jI7oRQhsdbldp3bttgWhKTePXT8gkFv0HP29pFzV8/a
         a6RndDF0fv/Wqde+EI2g1cIWKQYnKvi6mmXWral4II5T9FVkpCzvGmV2bLUMhMuU4uPB
         OqtggxXQ3jmjaLgaarrdeuoF7A+2ftdQE6+CRg8pC5STlu8qfjwjwQgUhal025gqfbov
         UYcg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=You5ew+y;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-18.smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id p140si1829977ywg.4.2019.10.14.09.37.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 09:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Date: Mon, 14 Oct 2019 09:37:17 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/ivshmem2/a53853-0026e0@github.com>
Subject: [siemens/jailhouse] 8f5cc8: core: ivshmem: Use own temporary vendor
 and device ID
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=You5ew+y;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
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
  Commit: 8f5cc84abf7f407162fb689efeb87fd0a2794bf0
      https://github.com/siemens/jailhouse/commit/8f5cc84abf7f407162fb689efeb87fd0a2794bf0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: 76bb6975b243592306e33287fda2731854a6ece7
      https://github.com/siemens/jailhouse/commit/76bb6975b243592306e33287fda2731854a6ece7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: 0292d3bddbb2691939a668fa6ea328a022a53319
      https://github.com/siemens/jailhouse/commit/0292d3bddbb2691939a668fa6ea328a022a53319
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: c55d7e77235a7f307661c481cc8b793b0916b313
      https://github.com/siemens/jailhouse/commit/c55d7e77235a7f307661c481cc8b793b0916b313
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Enable unprivileged MMIO register access

Make sure that unsupported accesses to the MMIO register region do not
raise immediate panic. We should rather ignore them. This allows the
cell OS to hand out the region to unprivileged users.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: aa46a0510d9efa8dec75d3516d3f170f4eef5ed3
      https://github.com/siemens/jailhouse/commit/aa46a0510d9efa8dec75d3516d3f170f4eef5ed3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: 6f300f7429f779ff3b4d73f7bc654037bf65ded3
      https://github.com/siemens/jailhouse/commit/6f300f7429f779ff3b4d73f7bc654037bf65ded3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: 208debf7f2a8523e3f3c448c681ee1f77779c7fc
      https://github.com/siemens/jailhouse/commit/208debf7f2a8523e3f3c448c681ee1f77779c7fc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: 0c367d7b61e991c2997d5379183e606061620ba1
      https://github.com/siemens/jailhouse/commit/0c367d7b61e991c2997d5379183e606061620ba1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Reorganize MMIO registers

A number of changes to the MMIO registers are upcoming. This prepares
the layout for that and renames DBELL to more telling DOORBELL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fa983b0daa76a5bd200ef7b3aa622e9b521c3019
      https://github.com/siemens/jailhouse/commit/fa983b0daa76a5bd200ef7b3aa622e9b521c3019
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename IVPOS register to ID

This is a more logical name for the register as it returns a unique
identifier of the device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3f79134e51413e28df30c730f2f833b297133951
      https://github.com/siemens/jailhouse/commit/3f79134e51413e28df30c730f2f833b297133951
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add MAX_PEERS register

This allows the guest to discover the maximum number of peers connected
via an ivshmem device. We only support 2 so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a62ca4daa61eb62fbba19e975fd537d050689491
      https://github.com/siemens/jailhouse/commit/a62ca4daa61eb62fbba19e975fd537d050689491
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: 9242c5fd0e35bc76055aa25eaba06cbed9bb890f
      https://github.com/siemens/jailhouse/commit/9242c5fd0e35bc76055aa25eaba06cbed9bb890f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: 787873e2454d6dec33392f7072cf1eb5715cfd84
      https://github.com/siemens/jailhouse/commit/787873e2454d6dec33392f7072cf1eb5715cfd84
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Use device ID from config

Convert the creation-order based ID assignment to the one now provided
by the cell configuration.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 02d9b5966c28eb4b28d02188f6624f059ea1a9c1
      https://github.com/siemens/jailhouse/commit/02d9b5966c28eb4b28d02188f6624f059ea1a9c1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: 1146629dafc0cb0970a815a3568715204faa3ce2
      https://github.com/siemens/jailhouse/commit/1146629dafc0cb0970a815a3568715204faa3ce2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Mask MSI-X vector on reset

This is demanded by the PCI spec.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 385af6cb9432a3c0b18c0f554e5fcb4e07c23673
      https://github.com/siemens/jailhouse/commit/385af6cb9432a3c0b18c0f554e5fcb4e07c23673
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: 0ea921f2a9634cc8936de008b30d783f6c2a1e28
      https://github.com/siemens/jailhouse/commit/0ea921f2a9634cc8936de008b30d783f6c2a1e28
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: 417cdd9b446f1575290ac3bf0cbf9a5a3c6200c0
      https://github.com/siemens/jailhouse/commit/417cdd9b446f1575290ac3bf0cbf9a5a3c6200c0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename ivshmem_data to ivshmem_link

Represents more clearly what the structure is about: meta data
describing the link between two ivshmem endpoints.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 16c7e80e974833fb2fb84bf53f984abeb3ce6418
      https://github.com/siemens/jailhouse/commit/16c7e80e974833fb2fb84bf53f984abeb3ce6418
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Avoid assumption about size of ivshmem_link

It does currently fit into one page, but there is no reason to hard-code
this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 71622b6503e6388a56308717a00fa23392317e02
      https://github.com/siemens/jailhouse/commit/71622b6503e6388a56308717a00fa23392317e02
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Introduce link pointer to ivshmem_endpoint

Will be used when looking up an interrupt target by ID.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ba0dcab15efe68ac223baed2c3cc5d82cf7849e4
      https://github.com/siemens/jailhouse/commit/ba0dcab15efe68ac223baed2c3cc5d82cf7849e4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Relax peer matching rules

Only match based on BDF from no one. We will rework the number of shared
memory regions, and matching them all will an enormous effort. This
should rather be pushed eventually into an offline check.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ca6509d50e4a18c211b8b3097d165763127c5b6c
      https://github.com/siemens/jailhouse/commit/ca6509d50e4a18c211b8b3097d165763127c5b6c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: bdadf585a28df44c91524a80b9167f0bccc63391
      https://github.com/siemens/jailhouse/commit/bdadf585a28df44c91524a80b9167f0bccc63391
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: 7147854adc15aa8eed4e41af38dc74b381e6deac
      https://github.com/siemens/jailhouse/commit/7147854adc15aa8eed4e41af38dc74b381e6deac
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Re-add target ID to doorbell register

Just like the original ivshmem, use the upper 16 bits of the value
written to the doorbell register. This allows both self signaling and
lays the ground for multi-peer support.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 64f7b4179a3003d5e34757a8fff39f70a19e0e69
      https://github.com/siemens/jailhouse/commit/64f7b4179a3003d5e34757a8fff39f70a19e0e69
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: f4203b1f317d3c6457d9f31db3b79f617afd9b00
      https://github.com/siemens/jailhouse/commit/f4203b1f317d3c6457d9f31db3b79f617afd9b00
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: 339de181f2be5c9f575df8cbf0b40768f5479d49
      https://github.com/siemens/jailhouse/commit/339de181f2be5c9f575df8cbf0b40768f5479d49
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: 5ba8640c25fed6af52de54fdad83c4353e5fa635
      https://github.com/siemens/jailhouse/commit/5ba8640c25fed6af52de54fdad83c4353e5fa635
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Expand interrupt control to device level

This will allow to introduce a one-shot mode later on.

The reworked interrupt control register starts disabled on reset.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 94646b6f6f7c174b8c2bc69a954f97ca77cb55ad
      https://github.com/siemens/jailhouse/commit/94646b6f6f7c174b8c2bc69a954f97ca77cb55ad
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: cc6ee7eda89b9da91198a4ae0cb993b2700a334a
      https://github.com/siemens/jailhouse/commit/cc6ee7eda89b9da91198a4ae0cb993b2700a334a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: cc14267f0c054ba438a4eb3412139577821a303f
      https://github.com/siemens/jailhouse/commit/cc14267f0c054ba438a4eb3412139577821a303f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: ce74404a231f57a8339f3b95918db76de7fa8414
      https://github.com/siemens/jailhouse/commit/ce74404a231f57a8339f3b95918db76de7fa8414
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: f823de97b11fd71e10fa200b8c9267cc78cbc2f4
      https://github.com/siemens/jailhouse/commit/f823de97b11fd71e10fa200b8c9267cc78cbc2f4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

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


  Commit: 7599a361d2403c89e502cf8f68a9829fe80cf035
      https://github.com/siemens/jailhouse/commit/7599a361d2403c89e502cf8f68a9829fe80cf035
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h

  Log Message:
  -----------
  core: ivshmem: Reorder ivshmem_endpoint fields

Move state and ioregion to the end because they are not needed in
hot-paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6864a731087479e42716b16574edc48d2f391403
      https://github.com/siemens/jailhouse/commit/6864a731087479e42716b16574edc48d2f391403
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

  Changed paths:
    A Documentation/ivshmem-v2-specification.md

  Log Message:
  -----------
  Documentation: Add specification of IVSHMEM v2 device

Add a WiP specification for the new IVSHMEM version. This documents the
current state and should not be considered stable at this point.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 48b455f9e3dffc64956babd716c351ca949594aa
      https://github.com/siemens/jailhouse/commit/48b455f9e3dffc64956babd716c351ca949594aa
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-14 (Mon, 14 Oct 2019)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  configs: Add ivshmem protocol defines for virtio to cell-config.h

This defines the protocol ID ranges for virtio backends and frontends
along with a view virtio device IDs, allowing to create such devices in
cell configs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0026e0e522c3809233e16146d40979faed6fecd2
      https://github.com/siemens/jailhouse/commit/0026e0e522c3809233e16146d40979faed6fecd2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-14 (Mon, 14 Oct 2019)

  Changed paths:
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: x86: Add virtio console device between qemu-x86 and linux-x86-demo

This enables the root cell to provide a virtio console via ivshmem to
the non-root Linux cell.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/a53853ee6f54...0026e0e522c3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/ivshmem2/a53853-0026e0%40github.com.
