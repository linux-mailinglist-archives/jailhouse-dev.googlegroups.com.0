Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBM6Z5X6QKGQELQLFLEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x639.google.com (mail-pl1-x639.google.com [IPv6:2607:f8b0:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 981D82C00F7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 09:03:01 +0100 (CET)
Received: by mail-pl1-x639.google.com with SMTP id b4sf10736218plr.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 00:03:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606118580; cv=pass;
        d=google.com; s=arc-20160816;
        b=tMKYG3tdtmSOtCve9kt20+xoPE9i4EbLvVi6XuHMQAXB1QFvSOZili7eReAJXyzaCi
         pZCb92JoL8qqRrTxlJOwLzGzMK/2ZqLNJ8pYVgLkKtkTexJZIfkTy1YuS7lkkYn2EGDS
         mr9eN9eG8xgru82GPwQdTDIov7d1OzFKVKxb6Lxmu9NCxQz9ShOfbd8LF3r4kzoEMdSp
         u7z/mvQuZLzKpow25/ISnPLiNUlqY8b61lMoU7NEe3+YEyxVQmFzIqnP1DXxr3UmCzO2
         LeJu0zarHLO04928X6ru+cSk7LNjxyACOnr9eVfQIXCjKQfQ/h6/2cYehhAe+6sUg0Gt
         uV8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=ytjp48rHWZaRkzlunlytyrR3y1DGkRTBRcqpl58F3XQ=;
        b=qbdLC4P8Zi7W6X8htV5U1sbgN1KmJXpuJjHgMxenIo2ZlH9WvH8rWyQVy5yv8aSHPr
         eNE5Fml0PGxzgqWt1vQHsbCtkEfkNKLl3EH/NXFO7nzQ5Uq35PJWS6DddJwl3+FdTMV2
         ucm/K2pWzWbta0Q2AvELRB4HoSbE7khjmbOVU1ZKG0ZPSriiUJaV4kfObk0FZApMrk9o
         C9FeTbAf1VDKF87Y6Hwtob/Mvvf1ojG9w9UCCFkN673vcCq0wYj5WslYwsDb9RorPcci
         pkenI9MWnp0J7WsF6vPPz0yimkZdDP1GDZo3nMuy1FB/hR2oVhcoyvePLUFDA4o/EqL9
         qp9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=vtCZckGa;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=ytjp48rHWZaRkzlunlytyrR3y1DGkRTBRcqpl58F3XQ=;
        b=j+Yuu/yHvd01hYKqP6rwCDKFv9bpSTREBRVIW1FDF+oFEypSQ9j321lolTq2qWC1Qq
         zWetTKoXvL0Ofm2SO4jtCC7b57O2vd5xxoxgYO9DUWsobF0UqU+EIjWlzpjBSGa7i2hP
         hUtAVRDdfoKz12+BmYbisy7/yzXR7LOAraCYonolmn6vKcBZR3J35Y6PoewQ3PncVMdN
         6LDVVdMrx2VJNfB+Fvi9ciXlASxG6TPbFZuyMEwtkrdaGP4r0lJ2OoBFl6mVGQvtSujg
         r9UuIxrhkXfe8NC4OeehUgHcpyr2WDOlJObs739SRX2XN5Pmlz3eNGNdva+AaOYYL+tP
         uxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ytjp48rHWZaRkzlunlytyrR3y1DGkRTBRcqpl58F3XQ=;
        b=AXRuhBi/nzhAj+YyFN7CKmco5qcUNwxvTMmXeApFGXAoUixZ+D4kKhQPC8APyMEVbD
         IXQkfs2CkuMB/+R7SCkJ2k5cJ1JlBYSaif63CesJcnR8dC0Wxd/AhF/h9S23sGlBEt+s
         0j0Bxf0uuxpCr5KQJ9F2KZR2PAvwPdVYJEbCNjruEKPVpfYiBLOMmqdw4bTMs+y0BAyO
         0zdPyzZtOVkTR/ZMqMgGtGNbBMsGdw8WvppEiZei7jMgbl1HbECZv6ihxe4630ulHhhE
         YqGYZkxJTKYuwO6j5oFiCPhyc3Gru/XFCQhwXHZyY8wwR1bmUtNi88L0FU6/vQDm3hJH
         X0tQ==
X-Gm-Message-State: AOAM530rx63VraPhhWGWr9ArUaOSU2DkCFZTfeH4roqwwGRlyBVtYrCo
	s0c0DAHdlbS2I9Q+BRJiJm8=
X-Google-Smtp-Source: ABdhPJxJUjc1Juvd+M/kNgb06Wg6BV0WtgjeW08gjDCEnBCT7YzEak/gk7CEeH5eOE/c50Vigl0lBg==
X-Received: by 2002:aa7:9606:0:b029:198:14c4:4f44 with SMTP id q6-20020aa796060000b029019814c44f44mr2825404pfg.80.1606118580099;
        Mon, 23 Nov 2020 00:03:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:9a47:: with SMTP id x7ls5929307plv.1.gmail; Mon, 23
 Nov 2020 00:02:59 -0800 (PST)
X-Received: by 2002:a17:90a:e604:: with SMTP id j4mr24528268pjy.19.1606118579104;
        Mon, 23 Nov 2020 00:02:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606118579; cv=none;
        d=google.com; s=arc-20160816;
        b=Be7Xvye6OgcOzASYDBHsRY60986jdzjpsk8pvj+lQHpkPzR9EE6i6CcKH6MbhCNYhA
         uN9W0J0jgpQBMPUt9FDerX7Oae486CFFpVzXA0mJBSeazV1yYNxErI0R9rxxwm6YnUZS
         nmBKmZJIqAQGPON75DVwXsD5Vn48FPDUOM/9BPGBaMGJfkE3UG3SA6o+O8RB7JnKHEAq
         SJsUq+mqh2gt+5Py4ORUmaGe4bBpkyBxHtJlwHrM9/8kPbLVlE/GdNS9WJHDwyE9ex+0
         rQNVlA97DCcP/hqa9N8+h7BIqGaOydyZiC4opV0FhvixmhoxhVvirOR5Gtfk+L2Cvgt4
         Dj6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=yrnbLUb89haWBzVeh6KTOFYgzHexG3Vyag0sTpPD+MQ=;
        b=xVUvXNelviwWwjjWS1FnZ6JQ3s4zg/PwkpETkv5zGzQAJlVxOD6H0zLkzantw7saKK
         2iOVJXIYW+pq1jpT+OuZRrZr6reOPS8kc5x9ei59+0L8VMudg1fUEU+SXzNCMFqBG36Y
         Hc+R82D/ynTCQaa885yvZ9gX8WdB4vFMFnlTxYI9nQy0JxWx1uVkmqRlMAvRh5GrEGtc
         vI/odx/zcRHfdGImiJhky4CWOlQ3+WcwY+oBl6FhQmieQPqNdT4ACG2H71591iQgYBAs
         cpEU+EvLTQednMMVHogrJktPNptfOa3QeuVHq5oizidZDtRTk+M7htsKDrc5tJVBpgcN
         dZoA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=vtCZckGa;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from smtp.github.com (out-26.smtp.github.com. [192.30.252.209])
        by gmr-mx.google.com with ESMTPS id u133si752751pfc.0.2020.11.23.00.02.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 00:02:59 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) client-ip=192.30.252.209;
Received: from github.com (hubbernetes-node-d93252b.ash1-iad.github.net [10.56.25.24])
	by smtp.github.com (Postfix) with ESMTPA id 4DA9A5E07F6
	for <jailhouse-dev@googlegroups.com>; Mon, 23 Nov 2020 00:02:58 -0800 (PST)
Date: Mon, 23 Nov 2020 00:02:58 -0800
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/2f52a1-097bed@github.com>
Subject: [siemens/jailhouse] 7a3fec: hypervisor: Makefile: hook-in Wextra
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=vtCZckGa;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.209 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Nikhil Devshatwar <noreply@github.com>
Reply-To: Nikhil Devshatwar <noreply@github.com>
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
  Commit: 7a3fecfc146052dd154597a0b9e12545ea67afef
      https://github.com/siemens/jailhouse/commit/7a3fecfc146052dd154597a0b9e12545ea67afef
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/Makefile

  Log Message:
  -----------
  hypervisor: Makefile: hook-in Wextra

Wextra covers multiple warnings including Wunused-parameter, which
triggers a lot of noise without bringing much benefit for this code.

Completly disable Wunused-parameter and suppress Werror for the warnings
we still want to fix.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9f96f595f954d267389b67c6f4ad43f0c120033f
      https://github.com/siemens/jailhouse/commit/9f96f595f954d267389b67c6f4ad43f0c120033f
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/include/jailhouse/string.h
    M hypervisor/include/jailhouse/types.h
    M hypervisor/lib.c

  Log Message:
  -----------
  hypervisor: add wordsize dependent size_t type

This solves warnings due to -Wbuiltin-declaration-mismatch

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b7f3e4f10081e9ed05850e8190e73b9bae1af460
      https://github.com/siemens/jailhouse/commit/b7f3e4f10081e9ed05850e8190e73b9bae1af460
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/arm-common/lib.c
    M hypervisor/arch/arm-common/psci.c
    M hypervisor/control.c
    M hypervisor/include/jailhouse/control.h
    M hypervisor/setup.c

  Log Message:
  -----------
  hypervisor, arm-common: provide an explicit uint INVALID_CPU_ID

Substitute the implicit "-1" occurrence for an invalid CPU id with an
unsigned int INVALID_CPU_ID that can be used in all "uint-related"
comparisons.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
[Jan: add extra empty line in control.h]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4661a29314a6190517359cb060580e533f42dfbb
      https://github.com/siemens/jailhouse/commit/4661a29314a6190517359cb060580e533f42dfbb
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/mmio.c

  Log Message:
  -----------
  hypervisor: mmio: fix Wsign-compare by casting index to u32.

In the branch, index is 0 or positive, and num_mmio_regions is less than
max s32.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 18700dd8bb52935116ba18bb1ec3970b682f8aa6
      https://github.com/siemens/jailhouse/commit/18700dd8bb52935116ba18bb1ec3970b682f8aa6
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/printk.c

  Log Message:
  -----------
  hypervisor: printk: Fix Wsign-compare in align()

This is complicated to fix without a cast. A possible alternative is to
cast the char* to an unsigned long "address" type, but that is even less
intuitive. Since p1 > p0, cast the ptrdiff to uint.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d40176e686498da108d42075d700327f6d18392f
      https://github.com/siemens/jailhouse/commit/d40176e686498da108d42075d700327f6d18392f
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M inmates/lib/printk.c

  Log Message:
  -----------
  inmates: lib: fix align() in printk similarly to the hypervisor

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 13769274ae884a7a340b9cc89c455f832ddb2b58
      https://github.com/siemens/jailhouse/commit/13769274ae884a7a340b9cc89c455f832ddb2b58
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/pci.c

  Log Message:
  -----------
  hypervisor: Wsign-compare: force the "right" promotion direction

Only part of the problem, Wconversion would complain as well.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
[Jan: move cast to the left side]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 58842ef0e2c586a910767f5d00dfb47adc7ac2d3
      https://github.com/siemens/jailhouse/commit/58842ef0e2c586a910767f5d00dfb47adc7ac2d3
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/arm-common/paging.c

  Log Message:
  -----------
  arm-common: paging: fix old style declaration (-Wold-style-declaration)

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6f8a07bbbd8b5c8e975318ecd7382f3e3c9ccfbc
      https://github.com/siemens/jailhouse/commit/6f8a07bbbd8b5c8e975318ecd7382f3e3c9ccfbc
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/psci.h

  Log Message:
  -----------
  arm-common: provide unsigned int PSCI_INVALID_ADDRESS

Avoid using "-1" to indicate an invalid address.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ca0e7a0a0e0f3527e353ccaa57582e3ba0e8535d
      https://github.com/siemens/jailhouse/commit/ca0e7a0a0e0f3527e353ccaa57582e3ba0e8535d
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v2.c
    M hypervisor/arch/arm-common/gic-v3.c

  Log Message:
  -----------
  arm-common: gic*: use uint instead of int when needed (Wsign-compare)

And similarly to gicv2_handle_irq_target(), rename "i" to "n" to avoid
suggesting that "i" is an integer. For gic-v2, fix it consistently also
in gicv2_read_lr() and gicv2_write_lr().

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d7fcf4e6b5319e17a21d4bfe5560a13f9ea70f73
      https://github.com/siemens/jailhouse/commit/d7fcf4e6b5319e17a21d4bfe5560a13f9ea70f73
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/dcaches.h
    M hypervisor/arch/arm/mmu_hyp.c

  Log Message:
  -----------
  arm, arm-common: Wsign-compare: arm_dcaches_flush(): take unsigned long as size

A better overall fix would be to have size always being specified as
size_t.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 58842ffe99b6b476bbab06af2e7c3f5d406a12af
      https://github.com/siemens/jailhouse/commit/58842ffe99b6b476bbab06af2e7c3f5d406a12af
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu-v3.c

  Log Message:
  -----------
  arm64: smmu-v3: use uint instead of int when needed (Wsign-compare)

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 315f5cb2c05f8bc7a91ba971a69559a019dd3a1f
      https://github.com/siemens/jailhouse/commit/315f5cb2c05f8bc7a91ba971a69559a019dd3a1f
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu-v3.c

  Log Message:
  -----------
  arm64: smmu-v3: rename 'i' -> 'n', 'j' -> 's'

Consistently use 'n' for unsigned int iterators, and use 's' for stream
iterator.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9a3f1d194487be44774bd92ef2f29a63443028e6
      https://github.com/siemens/jailhouse/commit/9a3f1d194487be44774bd92ef2f29a63443028e6
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/arm64/ti-pvu.c

  Log Message:
  -----------
  arm64: ti-pvu: fix Wsign-compare by casting size to u64.

No information lost in the cast, size is > 0 there and fits u64.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3b3673ebd966c4a03efeb9279ef601c16684c23e
      https://github.com/siemens/jailhouse/commit/3b3673ebd966c4a03efeb9279ef601c16684c23e
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Wsign-compare: make iterator uint

Partial fix, Wconversion will complain anyway due to the return int.
Consistently use 'n' for unsigned int iterator.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 958219c056a08bbcbed05cf53e0505ae091025da
      https://github.com/siemens/jailhouse/commit/958219c056a08bbcbed05cf53e0505ae091025da
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/x86/paging.c
    M hypervisor/arch/x86/svm.c

  Log Message:
  -----------
  x86: fix simple Wsign-compare warnings

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1e5f64f6e75cffbb2bc9e287bd83868e351cb3ef
      https://github.com/siemens/jailhouse/commit/1e5f64f6e75cffbb2bc9e287bd83868e351cb3ef
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/x86/apic.c

  Log Message:
  -----------
  x86: apic: Wsign-compare change to uint and update comparison check accordingly

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
[Jan: fix APIC register loop after making n unsigned]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: eaa4e760d5c0c63fbec00531d335f67ebde64b3d
      https://github.com/siemens/jailhouse/commit/eaa4e760d5c0c63fbec00531d335f67ebde64b3d
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/x86/cat.c

  Log Message:
  -----------
  x86: cat: fix Wsign-compare

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7746f934d8985d038ca9a1b550dea625bd3606e2
      https://github.com/siemens/jailhouse/commit/7746f934d8985d038ca9a1b550dea625bd3606e2
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/x86/vtd.c

  Log Message:
  -----------
  x86: vtd: fix Wsign-compare

This is still not 100% clean, since the fix generate wrong
int-conversions on "n" when used as a return value (i.e.,
Wconversion would complain).

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 931e6b69ccdd3422eee33517f67dd26eb4e81563
      https://github.com/siemens/jailhouse/commit/931e6b69ccdd3422eee33517f67dd26eb4e81563
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/x86/vcpu.c

  Log Message:
  -----------
  x86: vcpu: force cast to prevent Wsign-compare

The cast is just to prevent fallouts due to the Werror.
rax is really an unsigned value, but int to unsigned promotion is mixed
too many times to be easily fixed.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ec5673c064a317c58a27adc9fdc64feb33f759bd
      https://github.com/siemens/jailhouse/commit/ec5673c064a317c58a27adc9fdc64feb33f759bd
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/x86/control.c
    M hypervisor/arch/x86/entry.S
    M hypervisor/arch/x86/include/asm/processor.h

  Log Message:
  -----------
  x86: introduce EXCEPTION_NO_ERROR to avoid int to uint comparison on error frame

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bd051f287e15dfa254bd45a32eea1f918ace8067
      https://github.com/siemens/jailhouse/commit/bd051f287e15dfa254bd45a32eea1f918ace8067
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/Makefile

  Log Message:
  -----------
  hypervisor: Makefile: remove Wno-error from CFLAGS

Re-enable Werror for all the warnings that have been fixed.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b9203413465d4d0de429664b97f55180b6e3732e
      https://github.com/siemens/jailhouse/commit/b9203413465d4d0de429664b97f55180b6e3732e
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M configs/arm64/zynqmp-zcu102.c

  Log Message:
  -----------
  configs: arm64: add SMMUv2 configuration for ZCU102

Add SMMU support for: USB, SD, GEM. (See Table 16-3 + 16-11
Ultrascale+ TRM.)

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 856435123457e059327ada14ff559f93f5766b7c
      https://github.com/siemens/jailhouse/commit/856435123457e059327ada14ff559f93f5766b7c
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/include/jailhouse/utils.h

  Log Message:
  -----------
  hypervisor: include: Add a BUG() macro

Add a new BUG macro in utils which can be used in places
where you don't expect control to reach.

Whenever this happens, the code will intentionally crash
via a null pointer de reference.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9af75bf69ab9f20f962e880a3abb43c5768d6a59
      https://github.com/siemens/jailhouse/commit/9af75bf69ab9f20f962e880a3abb43c5768d6a59
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/arm64/include/asm/traps.h
    M hypervisor/arch/arm64/traps.c

  Log Message:
  -----------
  arm64: Report exception link register ELR in the regdump

For an arm64 CPU, when an exception is taken, the PC of the
CPU is copied in the ELR_ELx. This is useful for debugging which
code path caused the exception.

Modify fill_trap_context to populate ELR_EL2 and dump it as part
of the dump_regs

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 097bed0fa5985cd0ee8099f3d24d3b9c38c2b8c7
      https://github.com/siemens/jailhouse/commit/097bed0fa5985cd0ee8099f3d24d3b9c38c2b8c7
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-11-08 (Sun, 08 Nov 2020)

  Changed paths:
    M hypervisor/arch/arm64/include/asm/ti-pvu.h
    M hypervisor/arch/arm64/ti-pvu.c

  Log Message:
  -----------
  arm64: pvu: Avoid failure in config_commit

Current PVU iommu implementation ignores possible failures in the
config_commit part. This would allow inconsistent configuration
to run and may introduce unknown bugs.

Solve this by making sure that the pvu_iommu_config_commit never
fails. Catch the errors early in the mapping phase. Use
"free_tlb_count" to track available no of TLBs for chaining.
This can be used to check if any mapping causes it to potentially
use more no of TLBs than that are free. This will ensure that
the allocationg for chaining will not fail.

Change the return type to void for few functions. Add comments to
explain behavior in case of failure. Remove un necessary checks
that would never trigger.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/2f52a11d7346...097bed0fa598

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/2f52a1-097bed%40github.com.
