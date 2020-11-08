Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB37DUH6QKGQEYWVJXVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3f.google.com (mail-io1-xd3f.google.com [IPv6:2607:f8b0:4864:20::d3f])
	by mail.lfdr.de (Postfix) with ESMTPS id A20B42AADDF
	for <lists+jailhouse-dev@lfdr.de>; Sun,  8 Nov 2020 23:32:17 +0100 (CET)
Received: by mail-io1-xd3f.google.com with SMTP id j10sf4454567iog.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 08 Nov 2020 14:32:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604874736; cv=pass;
        d=google.com; s=arc-20160816;
        b=CbYaAiIu40/4o55TsMnkV+lFPLYAVtg5KMdYbLBOZpLGlet5XOAxQcuAinkfRs53yy
         eHwVD4i8Ye8RMsqjqNB7ut7qjPj/m12bLRgbF1wcCbUs8SWF7mp3ZDgQtGO2XHiK+W3x
         mmZyKfogt02ZNmfRQ3UEWMwoS1QbAgBewohr2BS/ZnlTsMoLz9pES1PkVjKMsrpybIGZ
         G5YfB8ulodiyQ4+Sh3MMAEC/8gh5M51p5XR3xhkbMtgBcT1nU/LkinJJCdd5gIsn21H3
         FZdD0kgEcgkwo3upDERnjwma0+V8skqOcMFTxUbWCz73+jRTBVUcokxl55XFedVe4Xi3
         +f4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=EdLydZzxwp8uoeoC3zjevX8JVra3yUxbF8w0uGQJPYY=;
        b=EDH+7nK9YoCRD/FqrqVeOvFQOigDFVdfSiqhuOmxwPelpmkAsaehJYeG78dBOlXhcZ
         AD4bjElF3DKYI2AD9CkmrZ32VlpMMGZfPCOc8iWgEM/Ldu2P35G8+N7AgPzk1ZPxitCb
         Ougel2sBHycz1Ii1kr2JHjlrnjSKNw1XX09ygDjOzZYkZytsmPRepN4gd8+IIvSypNph
         wOlQEec3hScVLwsLdDhFDFoFROHMGutaKwTCW8wlEIUS3SvERJnndO1vmIxFE6BfILid
         s82nHNVzSaVj40QAWacssrnkjJfP5K/zbYAdNxhUOVlkNDpfbXYYHYfXzZxmbRCoinkc
         a63Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=HzjRn8uk;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=EdLydZzxwp8uoeoC3zjevX8JVra3yUxbF8w0uGQJPYY=;
        b=q20SE9o0D6A2n9JPhrOJhE4BR5fCu44xxao6xAVZ2SZUHYhbWRmxNO1cC5Ea3YTdD6
         5PLiOtcUrznxkJtKipNzB76O3gcNZkvZFdsMpnL6u0IvYtWGrxCOhMVo43MkfOkpWWcy
         SEPCFeaQNNfNERNc0foHcMFfjertn7Zm25ANX3kPDhl3vCVZfDsDfb//o2JnEjAusnjq
         SewoSyiDBAccjFvT4tN1YrTqfe4I/jLm72tEpRGtPuaNWVZSARYFKjSTD+LQ64yM5dYa
         Xiqiwq9EMrNS7thE4Czpboz/HMiXVXNG3mGOEYGKx3Qsmli//VpKIC2LgGYCBxMjjvY8
         mdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EdLydZzxwp8uoeoC3zjevX8JVra3yUxbF8w0uGQJPYY=;
        b=XQhonRPldmau8Ln+Mw23VYEkKLQrrCT+0J9Ab1ucvwKDuQEzAG+0kmgPvkSjiSnGs+
         yn1IKLVPSFLt++W4pQqH/Yw8nxgP0ih81WvaOtEiO2g7ib1BRdCvudaWcXxekWTcJwzx
         1qH8bH3y/93ECWJlewapuKa+kcaxQizqYxn9Y84Qxu8vLR5EaBNlO+JHA8/sHhwi0EMX
         UKpW9obBBv678yQd2zqRqniN4D3/8M9fNtzYsZnN+0/829L5cksXTyB9m7iJSd28YOcA
         C98BWH/9UoRelpuvN92UYdht5xCyI4o6MRjcPJkjIQ8BVvOvBK/VMw2wFwVetmNyzEh6
         74zg==
X-Gm-Message-State: AOAM530pBiQYxSudmeLgix/1iBfRzkY9ErQrSTZkahSIqjhm6rl5Zlib
	xUv5ZvN/Ft8T2zzAWDGeDJc=
X-Google-Smtp-Source: ABdhPJwmahYLQcfkhH/I0xESdSwyCnFiQzEVxyfRI/Ok3mYdzm5aa9QPVuDDxWfVQ4eyyZN1lqkpXw==
X-Received: by 2002:a92:b311:: with SMTP id p17mr4082105ilh.194.1604874736139;
        Sun, 08 Nov 2020 14:32:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:5e9a:: with SMTP id f26ls1364905ilg.9.gmail; Sun, 08 Nov
 2020 14:32:15 -0800 (PST)
X-Received: by 2002:a05:6e02:f43:: with SMTP id y3mr6946271ilj.187.1604874735298;
        Sun, 08 Nov 2020 14:32:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604874735; cv=none;
        d=google.com; s=arc-20160816;
        b=pkCFuryxcYQL/2a70hskgdpD4hLg0y+lnICy1387udFVItvvzir0IZ8v0nOfVWA9Y0
         ekyoSNZEnGqffq/Oc3OGCo8ti1fRzRcuK8ZnNYbWFjkBYp2tessCA3/B71dh+SAp0SHI
         YbY3zG3GRZIQdsG1pZjEsdEMJ93hly7sbB9etLWIKjTmugoNFCWSmPgVNG75d7lKFVxu
         5DdkMOTSUe7WO70C9NHwLeR5+6EsVNczAGr3syOQlcJuzKq3gYPtijgWd9nGjQ8TSm8H
         enpQLvjjt4MirVFzFZ/Eltbv7/QAsyiPhlCRV9LYbgKy6euA34k7rkuqi3mjMNn91QYh
         0E0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=0I9oKMRjNta7vK7X1/Y05AN023AxyOoGb7fhl3tWzhs=;
        b=ZQ+6SQNXHufOaAbMcxsthqt9aRe6seYbZpORbUsyfY94C/lWMt1EMeJ2GTXcFa4tBL
         YW+t8L+3AjNoXIjmsZZekP/JDUjWhrzD9F0wUE7YKU0avqerEgZuoPccJFVO2/prt8UC
         /UjOPAHSA8BX+SQjh4kHe9sEt4mokD9d7Fd5TJc/Q1y9PUn8YnV/vSTV0QunMelvcWpU
         K4QYLsMz0COe8Z4kOpTAEGfDJ84pCSN1ihkvbtheJxl9AYlRqxNppJ3fq6Rcu7fm1PNF
         pV5e0Gk+IE4j0jSgKhPkJ0kpeUfoM8nHmTUYjove5OiE/dCk212Y24NFWADGF5z1c93o
         SxVA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=HzjRn8uk;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id j1si355653ilk.3.2020.11.08.14.32.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 14:32:15 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Received: from github.com (hubbernetes-node-1e41aa6.va3-iad.github.net [10.48.111.48])
	by smtp.github.com (Postfix) with ESMTPA id C782B340086
	for <jailhouse-dev@googlegroups.com>; Sun,  8 Nov 2020 14:32:14 -0800 (PST)
Date: Sun, 08 Nov 2020 14:32:14 -0800
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/2f52a1-097bed@github.com>
Subject: [siemens/jailhouse] 7a3fec: hypervisor: Makefile: hook-in Wextra
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=HzjRn8uk;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
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

  Branch: refs/heads/coverity_scan
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/2f52a1-097bed%40github.com.
