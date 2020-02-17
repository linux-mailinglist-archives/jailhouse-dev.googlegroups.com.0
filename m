Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBOVOVHZAKGQEJRC6YLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3c.google.com (mail-yw1-xc3c.google.com [IPv6:2607:f8b0:4864:20::c3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 563F5160DF5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 10:05:00 +0100 (CET)
Received: by mail-yw1-xc3c.google.com with SMTP id 14sf5971350ywg.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 01:05:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581930299; cv=pass;
        d=google.com; s=arc-20160816;
        b=gIez6eWvjtHN/r2tNuYHtMJmyp6wETAxHoobfDdHkGp016wA6UOMPhWagjIJtLo/tH
         mlmUpcFV2F619mKNpqjGSeS7N2P0gVAIBl23ypDK6rsy1WFzrxymMkek1kZ6IcNe/pXg
         rCxxuXzpVBV74Y3kFPISkWbdKcrby6EYca8NWemoEPNvoV6fHR1PaihiJgu25NDN0jS2
         gQ7P6mDt9Bfsw+RLtY5ps+ZxhUF0aGXg1bxhSdMx10/m5Gr3Hwbjdasoyhsf+TIiRr2Z
         qnN2vuWrzGM5MtXs0RoWRRipM9Pu9N9HIHvnqNVT6aQM+8gAJ2uTmV59aERvM3HCUWGz
         djbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=74pfOPYr1oMJE7khpl0arcSmbr1oQwFjrSfLVCsbbC4=;
        b=hksA/LtwSKSwvLDgPbPfOqidv49qb9xygUCG0ttaTk445zGDfB/ANLn7szUytOHGav
         GakGaLi7jPHoV3YDtgHlLyGk2NXo2RwpnbTRfxAqryssq03WIkMQZFrxoVRB5SPJe/we
         GPWFQS6CvEln1ZULdar3W3xdc5//BNo1Lg+eTfyLjkuMaaEAeJp3foVjIhjo00LuYxB0
         f9a/aRqJrezW95jzVY+C4JMDcKrQdrZ7koMvh50aaxkKpVx63jKclNGkWagxIVsW1OXf
         ZLWh/46kQ1Lhfn71EWgBNdODU936t62gFDGGPIUFK2KqaFNMtRKFcCCMbUkP9ELg5HHn
         71LA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Sxigg5BF;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=74pfOPYr1oMJE7khpl0arcSmbr1oQwFjrSfLVCsbbC4=;
        b=aAs6RNVWBRclFHuqs5jBT504u/WprAacBsAojsrijbG9vm4jAaaRPZ8kms2Gg0Ainb
         aj+ahAZ9YrN1+nmtbsEzNgl3MGT63RUCcmszk+Eqnsb7g5h3Prvj58xLy9kHfIEXJsYh
         jcLGMhgUN43xRjdHTHd7q35APpTHO0ksmwgDfJ7/H4FILwpp9qdngUk9xk9S7z7ScE75
         Km6q9Buw/MQNJV+bHDf2+PX4GBv0TfGO7AODdrdjVe4lh+qtt6tVamwUUjXa5xe1vnMs
         pN7RHHS/UNCefiRShHgeiblWB/ew6F0UK87zIbhPJf7X6Ji/2XAzbLNVNouKuKRmrtxk
         S5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=74pfOPYr1oMJE7khpl0arcSmbr1oQwFjrSfLVCsbbC4=;
        b=LIr31OmYTjXdD5wMOsLoAA4m6Hl1WwMi4SZVDuFOTxbIKPL/oQTrl7j7SVEWYW6YhT
         9f2Gofs5BvzJHZlMEzCShFyMXhmBZ5DkDz1WnWXdVRoR3JBUGtiojE2Xx24hSxYqvQqu
         vXE3fZHRJdFEyg13+pbOX4JefcKs5dv13pGN4zykRyofAdN1xnHWd40jO20+xcaVXn7j
         oXVyj3nC013O7jVtKd5gYecGe5PHl6eqImKI9fQ0bFzVGtnBYfAPAaXz8tbq0uqhNtdE
         23H1SkfeWibexcOdLbobPfKbPAcKemXoiG+v01rXcrMd0BRnSTdFGszAApGOHaAr7int
         ESKw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWt9zV3UbTeqco/kG+DkwVQKwllJAYGorDTbOIDA4DuNY3qJTgd
	i0VUXQHj5x7nBkbTps6WsBM=
X-Google-Smtp-Source: APXvYqzXHvqwoj/myTAoKoULu7mnL4TxP90J/fU9aSgeEJ1wu3d1rR0XjXJTN1cSR1URl0o/mfLW0Q==
X-Received: by 2002:a05:6902:68f:: with SMTP id i15mr12863114ybt.119.1581930298869;
        Mon, 17 Feb 2020 01:04:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:77c2:: with SMTP id s185ls2051919ybc.7.gmail; Mon, 17
 Feb 2020 01:04:58 -0800 (PST)
X-Received: by 2002:a25:d886:: with SMTP id p128mr14774121ybg.457.1581930298046;
        Mon, 17 Feb 2020 01:04:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581930298; cv=none;
        d=google.com; s=arc-20160816;
        b=ST0ruBxucvpqA2vVsywOqR67VEE3ZHomba81pE4+5UqN5dqp7/InjquPnYA2v7x+pT
         p6aZx+mZzpfOHpO80zWecx3x3i2yYSjVkKlIiVYlb2+7MNA/SB4KeNvPlWzjC8YdqF7I
         WCjW7jkdGocxBe1779Bi+1jufTzqrQwJoQM/8xBZes1S9AQfZHSHYV4xcoJR3mutj4+x
         4elwXUJmB6Hzrbl460dUnxlIbXqgNRgNn5Y8loFfYv8qPxT8q+itPK6WHEnkgJNRaNW3
         vat7x1wF+4WRL/eM/x/kTU7xl9u9b8UYYNOnfzExNJdf41eBjOqJ+sny+bDQ0bxZ9t7E
         neEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=HXwvWbxl9hGk+sRaGY1zAdxGzvt2oq4dgtTxHyQLalo=;
        b=zIKRtIBqB44Tex2pHkdK7YvHLjVErIG8BRh/YzZaMVB+6xH4/T5dyyPohwckP2lFGT
         0u1MRQ0cGlDKRA6AwYUH5D+HKAUnKvHMBYJh7okunzhA9Pvm4L3/uE7/rgKUdouH/QbA
         P6+shdJUkkcnSwji0vkWgLkOoEGYy0pWgZXrOyvSx+AZnCw/JSWcpl1eS8w4+UL0uawl
         jhoX6bZVSSyKq7NQE6A1UiE96/wiPZgKe9IDbG/PfVUnHMSZTuCLFlSihxixiotHosq0
         PwUwrx03whkMIKCBGNs3/ggaOs4CpMpy8O8iu1n3c1TRqmw0oamtaweiQOLos8D6U+Cf
         8PXw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Sxigg5BF;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-1.smtp.github.com (out-1.smtp.github.com. [192.30.252.192])
        by gmr-mx.google.com with ESMTPS id 193si792040ybd.3.2020.02.17.01.04.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Feb 2020 01:04:58 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) client-ip=192.30.252.192;
Received: from github-lowworker-ca5950c.va3-iad.github.net (github-lowworker-ca5950c.va3-iad.github.net [10.48.17.57])
	by smtp.github.com (Postfix) with ESMTP id C3B6FC60A85
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 01:04:57 -0800 (PST)
Date: Mon, 17 Feb 2020 01:04:57 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/riscv/536441-13ad66@github.com>
Subject: [siemens/jailhouse] 5c5f2e: core, x86: Remove unneeded bitops.h
 inclusions
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Sxigg5BF;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.192 as
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

  Branch: refs/heads/wip/riscv
  Home:   https://github.com/siemens/jailhouse
  Commit: 5c5f2e20c53315e4604c07290e9a262bbba35dc4
      https://github.com/siemens/jailhouse/commit/5c5f2e20c53315e4604c07290e9a262bbba35dc4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    M hypervisor/arch/x86/apic.c
    M hypervisor/arch/x86/setup.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/control.c
    M hypervisor/paging.c
    M hypervisor/printk.c

  Log Message:
  -----------
  core, x86: Remove unneeded bitops.h inclusions

This header already comes with jailhouse/control.h which all require.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 46430c0f31887600ed4f11189dec4e25e1901fdb
      https://github.com/siemens/jailhouse/commit/46430c0f31887600ed4f11189dec4e25e1901fdb
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/bitops.h
    M hypervisor/arch/arm/mmio.c
    M hypervisor/arch/arm64/include/asm/bitops.h
    M hypervisor/arch/arm64/mmio.c

  Log Message:
  -----------
  arm, arm64: Move sign_extend out of bitops.h

This is arch-specific, and it only has callers in mmio.c.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1c4c15399f736c49be665ca7af343b90cb448108
      https://github.com/siemens/jailhouse/commit/1c4c15399f736c49be665ca7af343b90cb448108
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/bitops.h
    M hypervisor/arch/arm/mmio.c
    M hypervisor/arch/arm64/include/asm/bitops.h
    M hypervisor/arch/arm64/mmio.c
    M hypervisor/arch/x86/include/asm/bitops.h
    A hypervisor/include/jailhouse/bitops.h
    M hypervisor/include/jailhouse/control.h
    M scripts/header_check

  Log Message:
  -----------
  core: Introduce jailhouse/bitops.h

We will share generic bitops this way.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e2562f696de236219f5fba88f64bbe6fb08c4829
      https://github.com/siemens/jailhouse/commit/e2562f696de236219f5fba88f64bbe6fb08c4829
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/bitops.h
    M hypervisor/arch/arm64/include/asm/bitops.h
    M hypervisor/arch/x86/include/asm/bitops.h
    M hypervisor/include/jailhouse/bitops.h

  Log Message:
  -----------
  core: Make set/clear_bit generic and non-atomic

No caller of these functions exploit their atomicity, and this should
not change. So, simplify the code by using generic non-atomic versions.

On arm and arm64, some macros are folded in the only remaining user,
test_and_set_bit.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 84844ce64639ff86ca42d8ea2a2b7d437f6ef9be
      https://github.com/siemens/jailhouse/commit/84844ce64639ff86ca42d8ea2a2b7d437f6ef9be
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/bitops.h
    M hypervisor/arch/arm64/include/asm/bitops.h
    M hypervisor/arch/x86/include/asm/bitops.h
    M hypervisor/printk.c

  Log Message:
  -----------
  core: Rename test_and_set_bit to mark it atomic

Prepend "atomic" so that it becomes clear that this and only this bitop
works atomically.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ca7123a5c58d6e698c5349f29dfbac9a44e5e459
      https://github.com/siemens/jailhouse/commit/ca7123a5c58d6e698c5349f29dfbac9a44e5e459
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    A hypervisor/arch/arm-common/include/asm/bitops.h
    M hypervisor/arch/arm/include/asm/bitops.h
    M hypervisor/arch/arm64/include/asm/bitops.h

  Log Message:
  -----------
  arm, arm64: Factor out common bitops.h

Most parts are shared, so no point in duplicating them.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 13ad663d777d959201023c026c135dd4b720bf15
      https://github.com/siemens/jailhouse/commit/13ad663d777d959201023c026c135dd4b720bf15
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    A configs/riscv/qemu-riscv64.c
    A hypervisor/arch/riscv/Kbuild
    A hypervisor/arch/riscv/Makefile
    A hypervisor/arch/riscv/asm-defines.c
    A hypervisor/arch/riscv/control.c
    A hypervisor/arch/riscv/dbg-write.c
    A hypervisor/arch/riscv/entry.S
    A hypervisor/arch/riscv/include/asm/bitops.h
    A hypervisor/arch/riscv/include/asm/cell.h
    A hypervisor/arch/riscv/include/asm/control.h
    A hypervisor/arch/riscv/include/asm/ivshmem.h
    A hypervisor/arch/riscv/include/asm/jailhouse_header.h
    A hypervisor/arch/riscv/include/asm/mmio.h
    A hypervisor/arch/riscv/include/asm/paging.h
    A hypervisor/arch/riscv/include/asm/paging_modes.h
    A hypervisor/arch/riscv/include/asm/percpu.h
    A hypervisor/arch/riscv/include/asm/processor.h
    A hypervisor/arch/riscv/include/asm/sections.h
    A hypervisor/arch/riscv/include/asm/spinlock.h
    A hypervisor/arch/riscv/include/asm/types.h
    A hypervisor/arch/riscv/ivshmem.c
    A hypervisor/arch/riscv/lib.c
    A hypervisor/arch/riscv/paging.c
    A hypervisor/arch/riscv/pci.c
    A hypervisor/arch/riscv/setup.c
    A include/arch/riscv/asm/jailhouse_hypercall.h
    A inmates/demos/riscv/Makefile
    A inmates/lib/riscv/Makefile
    A inmates/tests/riscv/Makefile
    A inmates/tools/riscv/Makefile
    M scripts/include.mk

  Log Message:
  -----------
  RISC-V cornerstone

This allows to build Jailhouse for RISC-V, using QEMU as a first target.
The assembly entry routine can be called and returns a funky error for
now. All the rest are stubs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/536441a05729...13ad663d777d

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/riscv/536441-13ad66%40github.com.
