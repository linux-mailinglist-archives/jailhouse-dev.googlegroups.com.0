Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBOG5THUAKGQEIWIKKBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 669AA475F0
	for <lists+jailhouse-dev@lfdr.de>; Sun, 16 Jun 2019 18:30:50 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id v67sf8603139yba.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 16 Jun 2019 09:30:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560702649; cv=pass;
        d=google.com; s=arc-20160816;
        b=mXOQJR/BZy2KWF+2UiPMYZ4NS8xcpZz4aZWcyMOXSnH8K9Fldw23F5DaULc0HQNZB9
         i/v0xuEHXq4m7p+gy62m4TWRwgdAKgPd/oUUq/agdtbiIofgOwELOa3NzugUMP5ZvRp6
         GrYTGrigYNYd1MAi8tZI0doOcSpUv9xuoSVeNoDBNOAP0/hMQHlEPrE04o3b3g6w/7B+
         zIrBmP1YdRdttWJtW1hkm/sOeB/X2c+Ti4uzSyATvR2bQn8h86t5Ul7sRILszIldlNjX
         265l3Ks8XV3Mwbo29qIPjwaA06rUAUch49HrgxdbLa+RhGCVPF+TShUwfU2hamGJQmMy
         Vohw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=V3kC5itfzlo9CZzzGzB5fqTGDnyeFzVzVzOKHpwX1jY=;
        b=ew9dJTGrihXKN2IzWZBn02Gu07UBpD4B9+GxVPrl/0UVzkh8Fs+z4Vkxjkc+rfLSnN
         /iBXaSAgpHZd82Sc43nFcROg4zaqhi6Q+bnWKCffSmGxfY28+I7+nXZy7jB6IUPpcxyJ
         h8kwJzHQ6TeMuTVJt9EmD0y3y16d9ADSd5QTICTyRXNWhsq9usTdVaWQzul4uUtsrU/I
         OntOvoyINN5Qjx6NIuJPesXLvvKhRSm6Q2wnaTuqKU4Scc6Xillvqzj+OZP1rs7ny1Ld
         sXu8vpt28Q2MyOAV3yxM6y0VFy3ZR+kbEhjbNpSnI8tFWY9X6we2BgLNdvr7RR/nobUG
         iS9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=PyycsonQ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V3kC5itfzlo9CZzzGzB5fqTGDnyeFzVzVzOKHpwX1jY=;
        b=rVNimV6bsAgyE/OzjxQMKKDIpz2eAlhVox9U4h9m3sFJ2cJqXMAYLIFwa95gv0R4Wt
         MLGNJVf13doQsRyVixMWh2b/XhMOllZoHfwtbGyX86qqW3enBoAe3Q6ihbyv4Iw8YpkH
         W8Um778bCHekxaJ0pbMonEZg8V0lhJ+gvucPkUPlp2+KB0byG/IALC28BiAxhNenqpIF
         JdbVSVBg6LwV1++CFebUCrhnchCg9+IGlIk3qFN3I/xQiIkWjReqyjm9aXBQajQU8ylf
         qWLB8Q37dSVL3vqvfeg2iTk9N0qKaYaCQ29p2Y88l1CX/pjznd6RB6cpPVkRNxKwalHl
         OFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=V3kC5itfzlo9CZzzGzB5fqTGDnyeFzVzVzOKHpwX1jY=;
        b=SRpQLnhS1GHYd52vt5OPbD6asq0cptxAtQYO2PsK7K6ZSmR8yid22v/vg+Wg/a9mg7
         rpVFGcpY4NI+MUcYgRFxlFfo5YN6Y4uaYF7rM3O/yGqVBwVf5Va9IwVSgoyCzHpxPuD7
         ZRKFeWHxoKu9Bs7+7sBESriBl2f7aDSr7DPIA1A7t4Ea96XfCs5yspIHLWkGAxjjEQlB
         L5cGXaqLlTCkkF+t8JR1gbE7JsTRTakZ8GFvbcsROJ1+BF/mBmR1yNyF3f7K1HnTQ1Ye
         VyRSckAkZI//WHJgugn6mDdxVHdpgvRCGFA0MF3haIPAwakxg7BcQpOlfzZrxHL4jn4A
         oV8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXoMT1HKdWEw36a0d0UYE6+WNtg6J6pPI6uzVH71HBEiY7V6aY7
	/UZXPfarAMo4csU0LUM4S3I=
X-Google-Smtp-Source: APXvYqysWJ2DE79d09MQEai/d7d6S76Ov5kVaMAj16e2I9UM303EtcX3nWGF0Z9rT8lF1J4nnIXwGQ==
X-Received: by 2002:a5b:2:: with SMTP id a2mr51262899ybp.244.1560702648861;
        Sun, 16 Jun 2019 09:30:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:3b05:: with SMTP id i5ls1826237yba.14.gmail; Sun, 16 Jun
 2019 09:30:48 -0700 (PDT)
X-Received: by 2002:a25:2308:: with SMTP id j8mr4425394ybj.262.1560702648310;
        Sun, 16 Jun 2019 09:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560702648; cv=none;
        d=google.com; s=arc-20160816;
        b=TGMWLGCLV/+HZJw8SLH/yDqN4rAqOxQhfKoLEzXz4+SQ1LV43YA1YtOaLkaFGmcg/m
         e1bDcsvY++c8wMnNXYwuWWTKcCjW7mse4E3Vk+qMSvMGlzuXCyVlECTHWLUddaE+owvX
         1+GWfr4Ki+HhDCRppIM5C/wxZCUvaVQVjrPye3NP8hE9/DXhPuzjul/sLiXE80q4lQaB
         7Y3WzJ23ewCaPqzTNGT401ZT2mKhhkV5+EPcL3OK+ZSe8sTu5mQvkfP1uiV5AAcncAbx
         HCKhh2HEM1LzVqtZBawlGKLcAsJ+vTawzOyR1YL+ovwKet/qDEkfQsLqNIUFZY1LLUag
         XHcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=38IcKDzOtmkdNAIRqB61KQFGz3XsFcjJCD8rZlAmHP0=;
        b=oGY+b97Eme+LtP318FANgQsWnaTq8+idiB6pa4GWIuPjnO6ttwIJ9BJUa6q4izlUZJ
         nsULxCC0Rf7wCPLOEBZGkmddXpP4hteTH73Ydx6PeTdOT274D8P7zpxNhO8Rp8n4W4Xl
         aIImM+DpC+vbX2oPLTMOebg5swU8guQKYze6hT/81zsZJ661gIL0XY3Q+0GAniFxeMZc
         rs+uKEwsYtVjWv3Nq1IeTSFQtkxZH6k/hA2ob9AeXCbw48tlg3Uz/SsPGA1TcXNMA/rI
         SXpdlndlsFbbQ7T7RNvWH4voggly+uS2D+DheciDLCckBaUXJ/WnEffRN8Q8MR1k6s62
         Gx/A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=PyycsonQ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-3.smtp.github.com (out-3.smtp.github.com. [192.30.252.194])
        by gmr-mx.google.com with ESMTPS id 66si434601ybe.5.2019.06.16.09.30.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Jun 2019 09:30:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) client-ip=192.30.252.194;
Date: Sun, 16 Jun 2019 09:30:48 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/e0de70-4abf1c@github.com>
Subject: [siemens/jailhouse] 8fe67f: inmates: lib: Use wider types for
 time-related con...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=PyycsonQ;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.194 as
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
  Commit: 8fe67f4b743818ef9157685a1fff92b19e704a4e
      https://github.com/siemens/jailhouse/commit/8fe67f4b743818ef9157685a1fff92b19e704a4e
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-13 (Thu, 13 Jun 2019)

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


  Commit: d737a471c71114f53ae0e41d219742c6af9bfe37
      https://github.com/siemens/jailhouse/commit/d737a471c71114f53ae0e41d219742c6af9bfe37
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-13 (Thu, 13 Jun 2019)

  Changed paths:
    M inmates/lib/x86/timing.c

  Log Message:
  -----------
  inmates: x86: timing: use a wider type for delay_us

As pm_timer_read() + microsecs * NS_PER_USEC may overflow on 32 bit
systems. Use a 64 bit type.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ecaeadc658705d25cc67553378cd9da609c498f3
      https://github.com/siemens/jailhouse/commit/ecaeadc658705d25cc67553378cd9da609c498f3
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-13 (Thu, 13 Jun 2019)

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


  Commit: 1a054d30bb3f76a64bcdc7883851cd46c8708b8b
      https://github.com/siemens/jailhouse/commit/1a054d30bb3f76a64bcdc7883851cd46c8708b8b
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-13 (Thu, 13 Jun 2019)

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


  Commit: fd06167340d5da1a8ac216ea42a514faf75b174e
      https://github.com/siemens/jailhouse/commit/fd06167340d5da1a8ac216ea42a514faf75b174e
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-13 (Thu, 13 Jun 2019)

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


  Commit: e1627b587ee778bdee5effc528747fd3290c81ea
      https://github.com/siemens/jailhouse/commit/e1627b587ee778bdee5effc528747fd3290c81ea
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-13 (Thu, 13 Jun 2019)

  Changed paths:
    M hypervisor/arch/arm/Kbuild

  Log Message:
  -----------
  Kbuild: Remove the reference to the formerly supported vexpress platform

Just a tiny cosmetic fixup: We don't support vexpress any longer. Remove
the hint to its unit.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 23766cddc2c5fe7e9a5cfb3db430cd14aa5315c2
      https://github.com/siemens/jailhouse/commit/23766cddc2c5fe7e9a5cfb3db430cd14aa5315c2
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-13 (Thu, 13 Jun 2019)

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


  Commit: 43b1a38ade21abbbf3cce72e039967c010e0cc09
      https://github.com/siemens/jailhouse/commit/43b1a38ade21abbbf3cce72e039967c010e0cc09
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

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


  Commit: 28c9c6114a64a389a6456054c79a4e07d2f563f0
      https://github.com/siemens/jailhouse/commit/28c9c6114a64a389a6456054c79a4e07d2f563f0
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

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


  Commit: 7dd41b56131331339ef7ec873dd51895dadfc147
      https://github.com/siemens/jailhouse/commit/7dd41b56131331339ef7ec873dd51895dadfc147
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

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


  Commit: 7079c583fbbe4220769a14459785fb108739fa44
      https://github.com/siemens/jailhouse/commit/7079c583fbbe4220769a14459785fb108739fa44
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M inmates/lib/arm64/include/asm/sysregs.h
    A inmates/lib/include/string.h

  Log Message:
  -----------
  inmates: Add string.h

We will need it at another spot, let's share definitions.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b74b055f8e48c927b49157488fb9d3cc11d3a3d0
      https://github.com/siemens/jailhouse/commit/b74b055f8e48c927b49157488fb9d3cc11d3a3d0
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

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


  Commit: 6aa1ac9ec5e4eae7040cf55126be818b30e31098
      https://github.com/siemens/jailhouse/commit/6aa1ac9ec5e4eae7040cf55126be818b30e31098
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

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


  Commit: 40d7b89cf7187babb2ccbeb5f89b61e743db6790
      https://github.com/siemens/jailhouse/commit/40d7b89cf7187babb2ccbeb5f89b61e743db6790
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

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


  Commit: 26561fa529d14fe31f844d121641cf6ac65df731
      https://github.com/siemens/jailhouse/commit/26561fa529d14fe31f844d121641cf6ac65df731
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

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


  Commit: dfe91a43796ac4c67b52f6f735e475b445b2a441
      https://github.com/siemens/jailhouse/commit/dfe91a43796ac4c67b52f6f735e475b445b2a441
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M inmates/lib/x86/Makefile.lib

  Log Message:
  -----------
  inmates: x86: Ensure 32-bit targets are built with SSE support

Not all compilers may have this enabled by default when building 32-bit
applications. Ubuntu does not, e.g.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ba6ec9bf9837ac2bdf31f09d2abce53dd8b0af82
      https://github.com/siemens/jailhouse/commit/ba6ec9bf9837ac2bdf31f09d2abce53dd8b0af82
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-15 (Sat, 15 Jun 2019)

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


  Commit: 77c96d4cd6023c6b6350db22d159063574d5c5ae
      https://github.com/siemens/jailhouse/commit/77c96d4cd6023c6b6350db22d159063574d5c5ae
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-15 (Sat, 15 Jun 2019)

  Changed paths:
    M scripts/gen_pci_defs.sh

  Log Message:
  -----------
  scripts: fix comment

The file was moved during integration. Align the comment.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5cf4cbf1dbc36afb026d10b6ee5e54d53968140d
      https://github.com/siemens/jailhouse/commit/5cf4cbf1dbc36afb026d10b6ee5e54d53968140d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-16 (Sun, 16 Jun 2019)

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


  Commit: 4abf1cb9c80151a882f0086933a459ed83a87da2
      https://github.com/siemens/jailhouse/commit/4abf1cb9c80151a882f0086933a459ed83a87da2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-16 (Sun, 16 Jun 2019)

  Changed paths:
    M scripts/header_check

  Log Message:
  -----------
  scripts: Fix header_check

jailhouse/console.h also requires types.h.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/e0de703fa9f3...4abf1cb9c801

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/e0de70-4abf1c%40github.com.
For more options, visit https://groups.google.com/d/optout.
