Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBY5ZRLUAKGQEQNU6YUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 110FE44B78
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 20:58:45 +0200 (CEST)
Received: by mail-ot1-x337.google.com with SMTP id h12sf9672398otn.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 11:58:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560452324; cv=pass;
        d=google.com; s=arc-20160816;
        b=mn/L+6I6VH0bAADMRoaePWrfkXLfIG6V5MoFzfzrWzIjYfud7f08zKySsFrldJLZJY
         iPdHy1899plDxIJCgIVqVDUwfH7ymwsLbNvDSjRUGoDUGhW0ezAyfyF3zlHZDVPKg3qW
         IRwDKXST08fbhKnpnRg6Rf3KIukHMBcjRMQKWVJIFqtPr/Puyub8nYhOwQuslq4GwyCs
         viMfrkvfm2pXpRHYVW6GGB4vK+FembjZGLzggmNR8oIqRb0YDwhVl8BXlhih4qqUNsjU
         pQ55EPhgmRkKW+2g3pEt67Hig+GwJuhq4Eg1LxeHT4iMBlnzEfBtJQqEDnLNGFyUwIPc
         CmkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=tmsjmlU2PRxqWF6v57w6LptCME9UhE4VXOEa+a5x/9o=;
        b=FfxEUkASkHKqmCzp79qfXSh1IVOwHNVwnjIyhKPxHKIqyfKmD/vOOROn35co043CG7
         iVBzLTsnnH4JnHra6jwR5RwV2ajwp7BhSJBe0vdXSykA/oEiv7PanQYCPHR7GmxKqczi
         TMlPiFqHGmKr/6GFEEU+wgV3bVF4RTvVOsgnoFBKv4y4WsgXOtNouRICne2nFCYB4nzl
         PHwdUZkqNddx5LC580EoEV5X/4kKTZYG3yFVqUaVd8iQG8lGTkHGmaPOqEXOTniZdzL4
         wSlLTWBtjvgsSrAGQkw5jY556m0INPcPVUm3cQ+sxAicvvHo8e5Vh8t+vl4WYqMA2Hq9
         Kujg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=NOG6PgJw;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tmsjmlU2PRxqWF6v57w6LptCME9UhE4VXOEa+a5x/9o=;
        b=G1OTLKiwIGOYkC5T1J450tXHcnnnqIsIaFBFN3ZHB/SgLQcqrwbWqDGknR6ciMB/BK
         Nfsn3TCgI3XQSPzVFxkULEn8z/Txyarfbs1kR0n2MKqszAg4n10qqJfFdo2gvIrmT9G/
         sDa+hHJ3yABpkyy7Rj4Yr3DhxRNBPcKX4CW/+V0dmzLaSQq9Eaaqa+EFeTK/K0ZTOK2z
         aVRIHenUolstOp7igGXPCrt6/GyuCsQbD6pnCz7RMplEsXrFKGZwGC6O0La6o+/Z+STf
         qd1/gPqAHXWlAVLBzhDNtUy8Lq/hSeMrDOP6VgLV5QCPCLpBj2DUI9GoJRFKL6BMqOjg
         9hJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tmsjmlU2PRxqWF6v57w6LptCME9UhE4VXOEa+a5x/9o=;
        b=j5GPCqgUccWYvk18Z/C48Pg9Mt9Kn1ewwgAtIHrQ31/Y3PNeKxGpQY//VtIVjnTI4R
         d4U8RIw47DGQXW3eJ+XG5VVG3h3/G22+h2w9Wc6h6MkQsoSAzIYxyXM7LUiTXvfW7LHd
         KKfWrQxp5RpdJjpiZf1rSoCtuRjQFqgyo8UBiIw/y/EYnTnpTjKU2JthPAoPT1T5yb04
         DgfscB4MysrKOWMUgLJ4KPIt+RigynbZl5ZjxPZyZg0kUl54e76Ba8+RGjzaq1S6PKf4
         AIgynk0j2nLG2MDPrVsEYrWLQlwrpzDBKn0aO/fQkBUnVc2N2OpJVXeE6qMqC6hPnjTX
         6tRA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWtNFcP2t6fIKrxPAzT0mLHdZGYiwUirSCGv1oH+mSOJiUm/k6Q
	lnjcJOgJoeUD3ujvlhXEoTw=
X-Google-Smtp-Source: APXvYqypKFNPCKzsHFTMozXzxrqexDhv1akvaYHOMTyo6yF1+eOIKL4gxMSSalgZ3xPcuo9lt5vY8Q==
X-Received: by 2002:aca:a884:: with SMTP id r126mr4044896oie.11.1560452323877;
        Thu, 13 Jun 2019 11:58:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:19c8:: with SMTP id k66ls1259308otk.15.gmail; Thu, 13
 Jun 2019 11:58:43 -0700 (PDT)
X-Received: by 2002:a9d:6e01:: with SMTP id e1mr27680280otr.220.1560452323339;
        Thu, 13 Jun 2019 11:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560452323; cv=none;
        d=google.com; s=arc-20160816;
        b=mz7Zhzaw0er+78Pt1osL6QaeNkiguLd6+2CFfSvBP+DJUlqKCpoIA81yLaOgJiElJp
         7qMFIruis0ng67GA9+e22/JaNv8M0KMdtlM59H+GdJlJ7+/fTVIpsFn0Xu00NPaWmg4C
         c/hx/CneaBfiwKh4aQG1fgV1Xh1iGO/ie5X7AdoOZu62+kFjXx7AscZfnmH/H2H+GTPs
         OXVP8oYXnaCaMKeXb2rLj6I8sgX6JVrY0Tpdjb2m8eXTo/gY0rEeOmcpSY+OaFNULKM6
         IDYI5fYBS83o7jeSWUJX9XTgYHGKjQ97yRRNiGL7TPOKyv7GmGXifvsBsdfxVamyZUMl
         aU6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=yyExQ5bSSP1rYvpROhE/gcp5ofNeGOssslu5JZfdMbk=;
        b=FH56u9EGgi5ZsRzNQ6udmFsyezGqBsHAz424zpNDTLrnsoEf4PSYEXqtHJN7OmhxYg
         nlAU5ZAoGI6oq3k0jjc6JgJK1Un0DrINvovbKOk8ih2vo7QxxRcNkvvsknLdzfNHmjXZ
         VC7jMw7UqA+c2bsRrxuxlq+MrQ+560Rfh02QKgXVrje1we8KgBHKr88rKmB1Xu9BlCJq
         bNmycFm/K/jDCnE+WiMYqPu1Z0P65oep0Suitv0RgB1atRCtKqgeIB7HtzY/zaHmoePG
         JjTi0EQnrh3w4w8z1GfoHplhxoKVbYNcfFXWFX4L5FiJgvNp08CwuV/AyMAWqY/D9YpC
         caEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=NOG6PgJw;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-22.smtp.github.com (out-22.smtp.github.com. [192.30.252.205])
        by gmr-mx.google.com with ESMTPS id 110si26180otj.4.2019.06.13.11.58.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 11:58:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) client-ip=192.30.252.205;
Date: Thu, 13 Jun 2019 11:58:42 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/e0de70-73489e@github.com>
Subject: [siemens/jailhouse] 8fe67f: inmates: lib: Use wider types for
 time-related con...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=NOG6PgJw;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.205 as
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


  Commit: 73489e2430f8dc0664f6f9185684f935650ff488
      https://github.com/siemens/jailhouse/commit/73489e2430f8dc0664f6f9185684f935650ff488
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


Compare: https://github.com/siemens/jailhouse/compare/e0de703fa9f3...73489e2430f8

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/e0de70-73489e%40github.com.
For more options, visit https://groups.google.com/d/optout.
