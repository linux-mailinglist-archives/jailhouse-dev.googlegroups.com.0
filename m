Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBH6AQHUQKGQEWUBKGEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3b.google.com (mail-yw1-xc3b.google.com [IPv6:2607:f8b0:4864:20::c3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEAC60F86
	for <lists+jailhouse-dev@lfdr.de>; Sat,  6 Jul 2019 10:47:29 +0200 (CEST)
Received: by mail-yw1-xc3b.google.com with SMTP id d135sf6479133ywd.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 06 Jul 2019 01:47:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562402848; cv=pass;
        d=google.com; s=arc-20160816;
        b=ALvC+hmkjBNjtV3Znc937NGGDr3bmDxy6nMW7/NAh0T06+lizb9G3mHGP9Z0ZpOjPI
         8KFfHXKYJjRLZa6nWp6/vkIE9WGs3yMSI2XmV6f/y7VXAr8baSCgETtrjYKkWFmVk6fF
         qjDpApbrwFxIYanErzhY/JvNoPe1kinUYuBARZPLEyt5uPDTLp7T5ClsnS1HMd0oSuCP
         kk9lhWaNfpiDvqXCr9nW6JNxatsSns3lt64N5nc2MsCWmhPnxxIZrPGgUgLHA1S2lygV
         jTBVHtZhhHV2uqGM7w5WJG6e5LpGlVBRXNxYa95sTCvyjT42lY5V0w3cMqIoQq8MYpkm
         qUNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=L3m/otNNj+L1AJ9HoXoeciBqAdHruap/oXzbV0r/8ng=;
        b=nFuUnXu0NmPmBGHNwmaSuMbpzHo7grjXluSrqUZ2zGUoVrAgfJwL5s1n8IO0Is6ype
         sLpbd7ZFEoGgXhBrb30SvHyOKI8IKDh/am9o59JBdzhs5ANhEEIIOBvpju74qEp+0c7b
         7LzfIOZImiJxbthqomkzRLPfLMlVhtHDCJZf9EIZUO0tPF5WCaVpEhhr3qftFWqqpOZl
         fnJjYXLURXQAEjG5zcPO9bcOgLKPB6XR6RkcopAndlq5CcqgdVAiLK+Z+nhey58rftNI
         KYuTNEMfbIhLA1WcQrLnfIGtH0GXGRtQKFb42019JCPUNnlZTgpByqmcQy+xkTj/byIm
         qFFA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=SM3mjBCK;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.197 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L3m/otNNj+L1AJ9HoXoeciBqAdHruap/oXzbV0r/8ng=;
        b=ndKF5P/y+GhOA0D2KCo+yIrTincl/dmXUiM3LZYtpCCK3thGfH6jz4vfbZZyuRGOMG
         3QAZFHvwXFJ3e7SuAxPxzNMvCyicxF5hLdtynb1uG63Is7iDfJv8sCw/r7HJc9Eom6pP
         iD6w8P/mW8WSKbq6VREKnJ7GyrPFfkXcKOTZ+ERsK8GC29HWdeOC04sw6TjPsYvmEobW
         Y8nJAensYe3Kl/MkoUZIQ1XsxPQ9rGT6GcxJEWZfpaLp78RKsGkxZejGXtwp1Np4WUmr
         j1x6af/R5hJ/LCQQNCjhjc6qaoB8p4oJhKJJ1kpetDI93SaS+FuzYlFQtLVlej+C+0g2
         d5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L3m/otNNj+L1AJ9HoXoeciBqAdHruap/oXzbV0r/8ng=;
        b=CV7XY9SFUYQSNtcQ/SGIyeyq8lUAJrW1ZIQy8g359YG5l7S7WEbBQ9allBhbmGx/s+
         rRbqqp8xz1s+rJiQaMHRZ7Kj5PZ/pK9oXlZk0Kb9P+EKqyacfHN9mQLDRNB6r97NLZDm
         PtBlB7XQkGmjseyGdou9dPVew46pQmVO8ciW2V8Q24QiEXW/J+bf+HngY1zXf9NnAJjn
         Hbn4g5pNmuShrPv9IcBkffz6zYzHSEcS8SBAr+IA4S5xdpT1mRvQHy9xJ4G3qgYr68C+
         Eatxjesio+9VfC9W6RrV5YIZ4TvFY06fLIXab/F/FN846VbLd5ah7feahkLpof9HUxXb
         tgNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXjU/pChUYD+uH7loKi69YcaSZVx5iQ96Y3xTW2AUkPAqGvjjnn
	NJGg1tIKV5RLtHw4CVrGVmY=
X-Google-Smtp-Source: APXvYqyeEGpXHWz8yaJUI2vlGaZoEJPrL6cPWxqjH0aaOGEW/Tm8isyrw2bE2WeUVsCXFcmd7z8rqQ==
X-Received: by 2002:a81:8242:: with SMTP id s63mr4518823ywf.134.1562402848325;
        Sat, 06 Jul 2019 01:47:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:bbce:: with SMTP id c14ls1398220ybk.2.gmail; Sat, 06 Jul
 2019 01:47:27 -0700 (PDT)
X-Received: by 2002:a25:5d12:: with SMTP id r18mr4625252ybb.302.1562402847646;
        Sat, 06 Jul 2019 01:47:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562402847; cv=none;
        d=google.com; s=arc-20160816;
        b=jf/8m8a2W/QHkTociqrHs1l0yfqnUcp6NPgYCPaZdx/Nae00TbZn9cHMpMxPY3RbVv
         9H3s3KpFEU5Pzy4Uu5S26PuGjFmsfKOZVig8eeRnICWmW6do+nL9+mkZEHlaIcO9Poll
         Go1UbdchPnlJm4jLZ0Av7tZaoHhKSABz4uqqYUaPl8s36ek3k0tWP9Fq51FTbMhHoTC4
         NJaOTz4YtGaZMbveFijG8LV4YPf5Nknt70rQonKE/Hb34GNBJUC29lrnxpOHNUDCoTOL
         FxRc/wrDY8o0IXWpnp6hz5fRwjUz1JXuMyYC2gK31Xs9KCV3HUuJ3o8/KCBFJUQZcyHA
         wAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=n+MBgTshJW/GXYNpX9i95wDjvt6Elph15yr0d2i7EM8=;
        b=RpiZPuwn5Yk6KJCKdpEZBRdXT+f+j1FEO4GDTNJuR7rwQbtFnT0pL06bc6rTW9NZeJ
         zyFFNVEeQtDT7zk5pw2hkAgMcxCAg/0n5OgbSlDofHv0o+FZPvE2y+Ul2BSrAnhCADbG
         E3RKREQAlzpBvEvlY648DpelAgDaGznXJ1GK0vNyYsLXBO8W4nw72rEEiBLQG51Pd1JB
         SKe3+YwffvNIIzb4p46VH4dgN3bnhog4LjXizQyV/c8EdA+3H2U1+HiVofO8BybXMqe/
         8xQspsP34l7wol2nCYw9WyTTJnrvGUbJYGjlwSH7F6U21JVf7R1ewax8dRHy3BQXE1va
         IfbQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=SM3mjBCK;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.197 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-14.smtp.github.com (out-14.smtp.github.com. [192.30.254.197])
        by gmr-mx.google.com with ESMTPS id j15si481301ywa.3.2019.07.06.01.47.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 06 Jul 2019 01:47:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.197 as permitted sender) client-ip=192.30.254.197;
Date: Sat, 06 Jul 2019 01:47:26 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/961576-a17c46@github.com>
Subject: [siemens/jailhouse] 6e27d3: arm: Account for non-compliant
 PSCI_VERSION return...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=SM3mjBCK;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.197 as
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

  Branch: refs/heads/master
  Home:   https://github.com/siemens/jailhouse
  Commit: 6e27d3af3557c8d1bca5423aee32e828cca567c0
      https://github.com/siemens/jailhouse/commit/6e27d3af3557c8d1bca5423aee32e828cca567c0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-10 (Mon, 10 Jun 2019)

  Changed paths:
    M hypervisor/arch/arm-common/smccc.c

  Log Message:
  -----------
  arm: Account for non-compliant PSCI_VERSION return codes

U-Boot returns PSCI_NOT_SUPPORTED, rather than the implemented 0.2. This
is practically harmless as the succeeding PSCI 1.0 call will then fail,
but it is cleaner to filter out all negative return codes.

Fixes: ea924a3fec98 ("arm64: Initialise SMCCC backend")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Tested-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>


  Commit: 51526fc263194e6b4a68e5042c8685db3eb2d179
      https://github.com/siemens/jailhouse/commit/51526fc263194e6b4a68e5042c8685db3eb2d179
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M configs/arm/orangepi0.c

  Log Message:
  -----------
  configs: orangepi0: Keep hypervisor away from "secure" memory

U-Boot places its PSCI EL3 code somewhere in the top 1 MB, and Jailhouse
so far overwrote this during enabling - because it was not secured. This
slipped through widely unnoticed as long as no one tried physical
CPU offline/online after Jailhouse ran. But since we implemented Spectre
mitigation, we started to query the firmware - and crashed. Avoid this
by keeping some safe gap to the firmware, reducing the hypervisor memory
by 1M, just like on the Jetson TK1.

Fixes: MiniDebConf 2019 live demo
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: aacdeacd2175a12a0f338c766bbc22d5927d1b91
      https://github.com/siemens/jailhouse/commit/aacdeacd2175a12a0f338c766bbc22d5927d1b91
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M inmates/tests/x86/mmio-access.c

  Log Message:
  -----------
  inmates: x86: mmio: fix data width of test

The sequence 67 48 a1 f8 1f 10 00 is "addr32 mov 0x101ff8, %rax".

In fact, data is accessed 64-bit wide, and not 32-bit wide as the
comment stated, and as the comparison expected.

0x67 only restricts the absolute address operand, and not the data
width.

Let's also use the mnemonic instead of the binary representation.

Cc: Henning Schild <henning.schild@siemens.com>
Fixes: 23f745cbe19089d ("x86: mmio: Skip over address size prefix found in x32 code")
Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 194c4326a3fc35d00ce0457d39daecb2a9825715
      https://github.com/siemens/jailhouse/commit/194c4326a3fc35d00ce0457d39daecb2a9825715
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M hypervisor/control.c

  Log Message:
  -----------
  core: Reset PCI devices on CELL_SET_LOADABLE

This ensures two things: Physical devices active prior to
CELL_SET_LOADABLE will be silenced (no more DMA) and cannot conflict
with the load operation anymore. And ivshmem devices can send the
information about the reset to their peer earlier than during a later
CELL_START-reset.

This comes at the price of resetting the devices again on CELL_START.
Could be optimized, but not worth it at this point.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 81381959ba1ab889fb6de85822cae8ba874fce24
      https://github.com/siemens/jailhouse/commit/81381959ba1ab889fb6de85822cae8ba874fce24
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M hypervisor/arch/x86/vtd.c

  Log Message:
  -----------
  x86: Clarify why we call arch_ivshmem_update_msix on vtd_emulate_inv_int

No functional change, just documenting the possibly non-obvious.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 703110f3445686b7bc251c0eb54169776aa58f5f
      https://github.com/siemens/jailhouse/commit/703110f3445686b7bc251c0eb54169776aa58f5f
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M inmates/lib/include/inmate_common.h

  Log Message:
  -----------
  inmates: lib: Use wider types for time-related constants

Especially when timing is involved, multiplications tend to overflow
32 bit. It's better to use 64 bit variables during the calculation. ULL
for constants ensures the correct width of intermediate results.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9aa052340033f010e8259ab826ad682b85577e1d
      https://github.com/siemens/jailhouse/commit/9aa052340033f010e8259ab826ad682b85577e1d
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M inmates/lib/x86/timing.c

  Log Message:
  -----------
  inmates: x86: timing: use a wider type for delay_us

As pm_timer_read() + microsecs * NS_PER_USEC may overflow on 32 bit
systems. Use a 64 bit type.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 17ec94cf03857841fcb48e54e5277a604456d644
      https://github.com/siemens/jailhouse/commit/17ec94cf03857841fcb48e54e5277a604456d644
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M inmates/lib/x86/include/inmate.h
    M inmates/lib/x86/timing.c

  Log Message:
  -----------
  inmates: x86: timing: adjust type of apic_timer_set

ulong restricts us to ~4.3sec on 32 bit x86 systems. We do a cast to
ullong in any case, so simply pass a wider type.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 29c42ec2e45051229f7cc44365ca209295a8250c
      https://github.com/siemens/jailhouse/commit/29c42ec2e45051229f7cc44365ca209295a8250c
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M inmates/lib/x86/include/inmate.h
    M inmates/lib/x86/timing.c

  Log Message:
  -----------
  inmates: x86: use correct types for pm_timer_read

If we should ever compile timing.c for 32 bit inmates, then unsigned long is
the wrong type. A 32 bit type (aka unsigned long on 32 bit) is too small to
hold the result.

This ensures that we won't hit a bug when enabling on 32 bit. Once we will
enable timing.c on 32 bit, we will have to implement 64 bit division
intrinsics.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 45f3d21e11ddb0124fc6377862a58d6a35e8ae2e
      https://github.com/siemens/jailhouse/commit/45f3d21e11ddb0124fc6377862a58d6a35e8ae2e
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M inmates/lib/x86/Makefile

  Log Message:
  -----------
  inmates: x86: Don't compile smp.c for 32 bit inmate library

We don't compile timing.c for 32 bit inmates. But it is required for smp.c, as
smp_start_cpu() calls delay_us().

We don't have 32 bit SMP demo inmates, and compiling timing.c for 32 bit is a
tricky task because of 64 bit divisions. Simply deactivate SMP for 32 bit
inmates for the moment.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a1ec2cdc0a6962beb38b95c7ccf94880a5726c98
      https://github.com/siemens/jailhouse/commit/a1ec2cdc0a6962beb38b95c7ccf94880a5726c98
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M hypervisor/arch/arm/Kbuild

  Log Message:
  -----------
  Kbuild: Remove the reference to the formerly supported vexpress platform

Just a tiny cosmetic fixup: We don't support vexpress any longer. Remove
the hint to its unit.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 96b7f2f659d8e624d12c60a0c14ec8b0f196bb9c
      https://github.com/siemens/jailhouse/commit/96b7f2f659d8e624d12c60a0c14ec8b0f196bb9c
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M hypervisor/arch/x86/mmio.c
    M inmates/tests/x86/mmio-access-32.c
    M inmates/tests/x86/mmio-access.c

  Log Message:
  -----------
  x86: mmio: fix preserve mask for instructions with zero-extend

movzx is a move with zero-extend. It will either move 1 byte (0f b6) or
2 bytes (0f b7). The destination are lower 8 or 16 bits. Zero-extend
means that upper bits need to be cleared. The definition of upper bits
depends on the destination register.

We already have a preserve mask that allows us for to clear or preserve
bits when emulating the instruction. In case of movzx, the preserve mask
only depends on the width of the destination register. For the
destination register, we have the following cases:

  - rax -- instruction has REX prefix 0x48 (rex_w set)
  - eax -- default case, no prefix, nothing
  -  ax -- instruction has OP SZ override prefix 0x66
  -  al -- not possible, and doesn't make sense for movzx

Now, rax and eax have the same effect: Always clear all upper bits (IOW,
bits 8-63 if access_size is 1 or bits 16-63 if access_size is 2).
Solution for rax and eax is easy: Simply don't set the preserve mask at
all.

The fun part is if we have the 0x66 operand override size prefix. This
means that the 'visibility' of the destination register is narrowed to
16 bit.

In case of a 1 byte move (0f b6), copy the source to bits 0-7, clear
bits 8-15 and preserve bits 16-63. access_width ensures that we only
copy 8 bit to bits 0-7, and the preserve_mask 0xffff.ffff.ffff.0000 does
the rest: preserve bits 16-63 and implicitely clear bits 8-15.

In case of a 2 byte move (0f b7), copy the source to bits 0-15, clear
nothing and preserve bits 16-63. access_width ensures that we only copy
16 bit to bits 0-15, and the preserve_mask 0xffff.ffff.ffff.0000 does
the rest: preserve bits 16-63.

Once this pattern is clear, the fix in the hypervisor is straight forward.

Amend existing and add new test cases that test correct behaviour.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[Jan: minor comment and style massaging]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f6d9a8ee10fa0db447f0227109f3fb3f0e10910e
      https://github.com/siemens/jailhouse/commit/f6d9a8ee10fa0db447f0227109f3fb3f0e10910e
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M inmates/lib/x86/header-32.S
    M inmates/lib/x86/header.S
    M inmates/lib/x86/include/inmate.h
    M inmates/lib/x86/setup.c
    M inmates/lib/x86/smp.c

  Log Message:
  -----------
  inmates: x86: use a valid stack for secondary CPUs

Woops -- we shared the stack across CPUs.

To fix this, let the CPU consume the stack pointer held by 'stack'. In case of
the parallel cell startup, only the primary CPU will consume the stack.

After setting the stack, the consumer will zero the variable to signalise that
it's ready (cf. ap_entry).

Even if we don't support SMP for 32 bit inmates, align 32 bit header code, as
well as 64 bit header code.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b90517d24c06cbd6e0a904eacb5ed2a9cd3cd383
      https://github.com/siemens/jailhouse/commit/b90517d24c06cbd6e0a904eacb5ed2a9cd3cd383
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M inmates/lib/x86/Makefile
    A inmates/lib/x86/header-64.S
    R inmates/lib/x86/header.S

  Log Message:
  -----------
  inmates: x86: rename header.S to header-64.S

The 32-bit header is called header-32.S, so let's name the 64-bit header
header-64.S.

With this, we can also simplify and tune the Makefile a bit. This makes
life easier, if we later add further 32/64-bit specific targets.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: aad513cab6a0418a494224a031af27ab8a1d33ce
      https://github.com/siemens/jailhouse/commit/aad513cab6a0418a494224a031af27ab8a1d33ce
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M inmates/lib/x86/Makefile
    M inmates/lib/x86/header-32.S
    M inmates/lib/x86/header-64.S
    A inmates/lib/x86/header-common.S
    M inmates/lib/x86/inmate.lds

  Log Message:
  -----------
  inmates: x86: introduce a common assembler entry point

Early startup code is equivalent for both, 32 and 64 bit, so let's
consolidate them.

This patch introduces an empty start32 hook that is empty at the moment.
Later, we will use it to enable SSE, which, again, will be the same code
for 32 and 64 bit.

There's only one drawback: We need __reset_entry at 0x0, but it's now up
to the linker's mood which files it places there first. Enforce to
linker to always place __reset_entry to 0x0 by introducing the
subsection .boot.reset_entry.

Additionally, tweak the Makefile a bit.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ebe650906de0118ccc1a477c90b39dd7d12411e9
      https://github.com/siemens/jailhouse/commit/ebe650906de0118ccc1a477c90b39dd7d12411e9
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M inmates/lib/arm64/include/asm/sysregs.h
    A inmates/lib/include/string.h

  Log Message:
  -----------
  inmates: Add string.h

We will need it at another spot, let's share definitions.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7b54f8f83fb30106a1caec26604a335fbbb7d833
      https://github.com/siemens/jailhouse/commit/7b54f8f83fb30106a1caec26604a335fbbb7d833
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M inmates/lib/x86/include/asm/regs.h
    M inmates/lib/x86/mem.c

  Log Message:
  -----------
  inmates: x86: Add acessors for different system registers

Add R/W accessors for CR3, CR4, XCR0 and implement CPUID.

And use these acessors where it's already possible.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[Jan: adjusted indentions of READ_CR]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 87e01b983df674a838d19e46971227da96e0a30b
      https://github.com/siemens/jailhouse/commit/87e01b983df674a838d19e46971227da96e0a30b
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M inmates/lib/x86/Makefile
    A inmates/lib/x86/cpu-features.c
    M inmates/lib/x86/header-32.S
    M inmates/lib/x86/header-64.S
    M inmates/lib/x86/include/asm/regs.h

  Log Message:
  -----------
  inmates: x86: discover and activate SSE/AVX

Recent gcc versions emit SSE instructions for 32-bit inmates (e.g., in
hex2str or cmdline_parse routines). Inmates aren't able to execute those
instructions as SSE is not enabled and will crash.

Enabling SSE is the same code for 32 and 64 bit x86 and straight
forward: Lookup SSE/AVX availability via cpuid and set according bits in
control registers.

Simply call the routine before calling the actual C entry point.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 99fd82ad52e78229ba942a77966cdb9bfdc8da15
      https://github.com/siemens/jailhouse/commit/99fd82ad52e78229ba942a77966cdb9bfdc8da15
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    A inmates/lib/include/test.h
    A inmates/lib/test.c
    M inmates/lib/x86/Makefile
    M inmates/tests/x86/mmio-access-32.c
    M inmates/tests/x86/mmio-access.c

  Log Message:
  -----------
  inmates: introduce test.h and test.c

MMIO access tests use the same test pattern. Let's share the code.
Later, we will also reuse it for the SSE test.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6b4b705396f43a5174052403dfde788e4d3ceca9
      https://github.com/siemens/jailhouse/commit/6b4b705396f43a5174052403dfde788e4d3ceca9
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M inmates/tests/x86/Makefile
    A inmates/tests/x86/sse-demo.c

  Log Message:
  -----------
  inmates: x86: Add SSE/AVX test inmate

Depending on availability, this inmates executes some SSE/AVX
instructions, compares the result against an expected result and exits.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[Jan: replaced source link for sse-demo-32.c with makefile rule]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a45a418b18c68e92755e9932461e4b0e2d31db58
      https://github.com/siemens/jailhouse/commit/a45a418b18c68e92755e9932461e4b0e2d31db58
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M inmates/lib/x86/Makefile.lib

  Log Message:
  -----------
  inmates: x86: Ensure 32-bit targets are built with SSE support

Not all compilers may have this enabled by default when building 32-bit
applications. Ubuntu does not, e.g.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d4590025a8a6d26b30ac7049a13b48ca20a08e28
      https://github.com/siemens/jailhouse/commit/d4590025a8a6d26b30ac7049a13b48ca20a08e28
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M inmates/lib/x86/Makefile
    M inmates/tests/x86/Makefile

  Log Message:
  -----------
  inmates: Add missing FORCE dependencies

These rules require unconditional evaluation to ensure rebuilds when
only variables change. Adding this reveals that we missing 32-bit
objects in targets so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 67650b23970d44465b5ee2d8b959b50de6357a70
      https://github.com/siemens/jailhouse/commit/67650b23970d44465b5ee2d8b959b50de6357a70
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M scripts/gen_pci_defs.sh

  Log Message:
  -----------
  scripts: fix comment

The file was moved during integration. Align the comment.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 89dd25256c2edf17a4183ff937383cea41c4121e
      https://github.com/siemens/jailhouse/commit/89dd25256c2edf17a4183ff937383cea41c4121e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M hypervisor/arch/x86/setup.c

  Log Message:
  -----------
  x86: Avoid duplicate arch_cpu_restore() on failing arch_cpu_init()

entry() calls arch_cpu_restore() when something went wrong. Calling it
twice may have been harmless in the past, but now it hangs. And it's
pointless anyway.

Looks like this was wrong since day 1.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9cb414c4bd22a9dbb12e53691c4227ed5df64529
      https://github.com/siemens/jailhouse/commit/9cb414c4bd22a9dbb12e53691c4227ed5df64529
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M scripts/header_check

  Log Message:
  -----------
  scripts: Fix header_check

jailhouse/console.h also requires types.h.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e93db0cc4fc295deec9e3c946bf10d7f7dc98409
      https://github.com/siemens/jailhouse/commit/e93db0cc4fc295deec9e3c946bf10d7f7dc98409
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M hypervisor/arch/x86/svm.c

  Log Message:
  -----------
  x86: amd: fix comment in MSR bitmap

So far, the MSR bitmap intercepted writes to 0x803 (APIC_REG_LVR). But
we need to intercept reads. We don't have a real x2apic, so we need to
forward reads to the apic.

Interestingly, APIC_REG_LVR reads via MSR never happened so far:
Root-Cell Linux won't use x2apic's MSR-based access, as, of course, it
doesn't see a x2apic in case of an AMD.

On the other hand, we emulate and use x2apic for non-root inmates. But
our inmate library won't issue REG_LVR.

The correctness of the comments of rest of the list was checked with a
short helper tool.

There's also a read-intercepted area that can be zipped.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2140ffdbaf41d14fc65992d837f50b3604584f3b
      https://github.com/siemens/jailhouse/commit/2140ffdbaf41d14fc65992d837f50b3604584f3b
  Author: Mario Mintel <mario.mintel@st.oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M hypervisor/arch/x86/vtd.c

  Log Message:
  -----------
  x86: vtd: Print BDF instead of hexadecimal device address

As it improves readability of hypervisor messages for debugging purposes.

Signed-off-by: Mario Mintel <mario.mintel@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cceea32298464574bade43726f2070f19bef7ce7
      https://github.com/siemens/jailhouse/commit/cceea32298464574bade43726f2070f19bef7ce7
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M hypervisor/arch/arm-common/pci.c
    M hypervisor/arch/x86/pci.c
    M hypervisor/include/jailhouse/mmio.h

  Log Message:
  -----------
  pci: Replace mmio_write64 with mmio_write64_split

MSI-X vector tables hold 64-bit entries. So far, we used mmio_write64 to
set them.

This conforms the PCI specification: "For all accesses to MSI-X Table and MSI-X
PBA fields, software must use aligned full DWORD or aligned full QWORD
transactions; otherwise the result is undefined" (PCI Local Bus Specification
Rev 3.0, chapter 6.8.2).

Nevertheless, some vendors don't support 64-bit writes, e.g., Broadcom ethernet
cards (BCM5720). mmio_write64 stalls, and the transfer won't happen.

Replace mmio_write64 with a wrapper mmio_write64_split that substitutes the
64-bit write with two 32-bit write operations. This accessor first writes the
upper 32 bits and then the lower 32 bits.

Credits go to Jan, the root cause of this bug was found in a private off-list
discussion.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4a13a062a71914f3046bedecc09909718915d3b4
      https://github.com/siemens/jailhouse/commit/4a13a062a71914f3046bedecc09909718915d3b4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M include/jailhouse/cell-config.h
    M pyjailhouse/sysfs_parser.py
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  core, tools: Add msi_maskable flag to jailhouse_pci_device

Will be needed to avoid injecting interrupts from masked vectors.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ea6596df9217b1fb83a7e7ac73d825b603c8af33
      https://github.com/siemens/jailhouse/commit/ea6596df9217b1fb83a7e7ac73d825b603c8af33
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M hypervisor/arch/x86/pci.c

  Log Message:
  -----------
  x86: pci: Do not inject masked MSI vectors on handover

Recent Linux versions initialize MSI with a placeholder vector,
MANAGED_IRQ_SHUTDOWN_VECTOR, but keep them masked. As we ignored the
mask so far, we injected this vector on handover. That caused and
spurious interrupt warning and, worse, blocking of vectors with equal or
lower priority because Linux does not ack unused vectors anymore (an
issue of its own).

We can avoid the issue by evaluating the mask state, if any, prior to
injection.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c76b85f3a6c23ecbf77c6f8a5401a76b1be47a15
      https://github.com/siemens/jailhouse/commit/c76b85f3a6c23ecbf77c6f8a5401a76b1be47a15
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M hypervisor/arch/arm-common/pci.c
    M hypervisor/arch/x86/pci.c
    M hypervisor/include/jailhouse/pci.h
    M hypervisor/pci.c

  Log Message:
  -----------
  core: Rename arch_pci_suppress_msi to arch_pci_set_suppress_msi

As this function both enables and disables the suppression, add a "set"
to its name. Also align the parameter name.

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 01ba0796542ed1a7febf223413ca09c5caa86ef3
      https://github.com/siemens/jailhouse/commit/01ba0796542ed1a7febf223413ca09c5caa86ef3
  Author: Pratyush Yadav <p-yadav1@ti.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M hypervisor/paging.c

  Log Message:
  -----------
  core: Fix aligned_start calculation in page_alloc_internal()

Right now, page_alloc_aligned() can fail to give aligned pages when more
than one page is being allocated. This is because the aligned_start
calculation is flawed.

Taking an example from a test case, let's say 8 pages need to be
allocated. This means an alignment of 15 bits. The mask here is 0x7. If
the page pool's base address is 0xffffc021f000, this gives us
aligned_start = 0x7. This start is clearly not aligned at a 15 bits
boundary (3 bits after shifting by PAGE_SHIFT). It is exactly the
opposite. It will never be aligned except when the page pool start also
happens to be aligned at that boundary.

In the above example, the address of the pointer returned was
0xffffc026e000 which is clearly not 15-bit aligned.

This change fixes this problem. Add align_mask to pool_start, and then
zero out the bottom mask bits. Adding align_mask ensures that
aligned_start is always greater than pool_start.

Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ada4d40ddc3ef811e26a271eb87a1c171c627ec9
      https://github.com/siemens/jailhouse/commit/ada4d40ddc3ef811e26a271eb87a1c171c627ec9
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Ignore empty PCI bus regions

On some systems the config generator permissively maps huge chunks of
PCI Bus MMIO space. This area needs to be intercepted by the hypervisor,
as parts of ivshmem-net devices may be behind that area.

Hence, ignore such regions.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
[Jan: tuned comment]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1b480b7c2eae1bd1b898e0df379c3fef1edd4337
      https://github.com/siemens/jailhouse/commit/1b480b7c2eae1bd1b898e0df379c3fef1edd4337
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M driver/pci.c

  Log Message:
  -----------
  driver: Fix memory leak on errors

When some of_changeset_add/update_property fails, the property needs to
be freed. Do this unconditionally in the common error path, just
ensuring that prop is always initialized and, when consumed, set to
NULL or the next value. The latter is already the case, we only need to
NULL prop after the finaly of_changeset_update_property.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e06e6e12b6873d054347d628361bcf446022f5d9
      https://github.com/siemens/jailhouse/commit/e06e6e12b6873d054347d628361bcf446022f5d9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M driver/pci.c
    M driver/vpci_template.dts

  Log Message:
  -----------
  driver: Adjust vpci overlay to new DT overlay rules

Recent kernels reject our root-level address-cells and size-cells
presetting - and they are right: We were overruling the the settings of
the base DT which only worked by chance.

But if we cannot set those values anymore, dtc will start complaining
about us relying on undefined cells values - nice. So we need to remove
the ranges property in order to avoid that. Then dtc complains about
that this PCI host controller node is incomplete. So we also remove the
device_type from the static overlay. Even nicer.

Now we only need to add the missing pieces to the dynamic part and
account for the possible address-cells and size-cells values.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 35912283c57b392f904c08c10831a9a47ceba528
      https://github.com/siemens/jailhouse/commit/35912283c57b392f904c08c10831a9a47ceba528
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M driver/vpci_template.dts

  Log Message:
  -----------
  driver: Declare virtual PCI controller dma-coherent

Just in case this matters for a user: We are coherent as we are purely
virtual.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a17c46ce809e256ff674fc981b0dcc26eb971b5b
      https://github.com/siemens/jailhouse/commit/a17c46ce809e256ff674fc981b0dcc26eb971b5b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M configs/arm64/qemu-arm64.c

  Log Message:
  -----------
  configs: qemu-arm64: Add PCI ECAM region

Available at least in recent QEMU versions by default. Not allowing
access breaks lspci, even without devices attached.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/96157677dfbb...a17c46ce809e

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/961576-a17c46%40github.com.
For more options, visit https://groups.google.com/d/optout.
