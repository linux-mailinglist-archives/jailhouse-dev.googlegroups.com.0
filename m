Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBYOKQH3QKGQES73UENY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63c.google.com (mail-pl1-x63c.google.com [IPv6:2607:f8b0:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id 653011F4C7E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jun 2020 06:45:23 +0200 (CEST)
Received: by mail-pl1-x63c.google.com with SMTP id t13sf666359plo.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jun 2020 21:45:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591764321; cv=pass;
        d=google.com; s=arc-20160816;
        b=fGfQr4KrFGTj/CsIs39/APriOZ5DJA89HCwzQrcZLHlKFp1JpRsnGuqedwjYWkk0nW
         zmnZe1aWBDfLwYx5074kVBB7mOAlqSMnN57h7B6YYwrKY87MT8vqAwzYe8VlV7jQws+e
         +PCz6t2n3PUPP2f/h3GQjHrqmOgCxRDKrWwZzIepIhpb2rqJW/Znqd4H7ioaOt0rLmqA
         6n96ikDqX+wq1aeyVBbkPlZ5QwKp2oIlEyABb0Q76ZGVJZMfh3ML9qT7BuSucjcnEPc0
         53MPBLZiDgF7qtQlyhPeO/qp2k4WVPT1dTymfVZpmAahbuzwM9QSreiV3GVuM+AdPQMS
         KRqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=0Emvi/WZxwChBmVR29S/BuLNT9lwG0WSJfXTL5Lknlo=;
        b=VrpelL3AnpHby7B/G+VQLlYefc95x9U0N1oxye13yt2J+kCtJp5NoXqnfdDGgZZBWS
         rq6SphlP0El/BqpJttAX7W8f3af7INyObLclhSta637BiSAe+9UGoicOqRwiZeGHhChq
         Zu4+vqJXqB4Ri/72kxfbWSEi14iIFVVxI7FkT48l753JEs3EYQSUfgJzS1zTt2pmdUe4
         k8ZjLwMUL8o2dYESifTN084e0knFeC0XWQwM9mPNOMvVUgVRRc5/wqxwPPCm5WiHesHS
         pvUrZVIP2T0ZVUR4uvsGeZAZJ6snYDHxj+9Y47cyYEWdI/zpwCxUDpwxLaq4Dk0NRDnz
         8uPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=J2R6TKy0;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.197 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0Emvi/WZxwChBmVR29S/BuLNT9lwG0WSJfXTL5Lknlo=;
        b=bvR8DeARX4Nuusr/UU/AI+iwNRbv83ZT1dDuZmeSfIoPZwl0M/LLOo1tDb1Z8m+Sbs
         uNoKmzMnY7obb1oPTzWLZcTDu+qcFKfnM0o2M72T5IHIjizZ9mJ4IwCRU/iZh5Jqcf2U
         fMPsXG0IXtOvaNHLW7Nhxl2Zl3eEiGCGxK3Dx4/rL+uTwr1yjSZ9YIkMUQ22vFDWLRm8
         dvyvX5eziFu9kxUdnBGwDgcwqLn4LQYEqcfLxEtfq9Dycw5frwdz9LYrw84Vd/ZeRbOZ
         Yzm6Puy+IUETOXZLP0ZkZZ7Cy/DLy2Sdgs3hZMOGqLO66bI4l6mmEOzOsy8STiiQC785
         yhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0Emvi/WZxwChBmVR29S/BuLNT9lwG0WSJfXTL5Lknlo=;
        b=mDMs5brnrhn5Bb82aFvFZXqPVLB5DhE97Wu/udjrAjeT7yomXjkghewTNwRIO6biKg
         +Uy/a4ofKMjr1221BheAR86exSTXQMaXKBZZSjXIouUdwCWokTvlA0zkEGbGg2Q13UfD
         rP1PzKNO8jw363pFJSXMYZKqss+VVeQPlkD6Uk0E6+P9Unm/mEXX96myCWnR1A7Igk6b
         X7WhZLm2E9BLMCK654SoB/2hyFmhF/6Uoq3piTBWOt9MqNjQ8e4xpaOtB7Blt8uSM+0G
         acJKa/YEBDh9S+2/JcAgSA2BR7lj3jssouTybg595K9J2yTdeOezvTdsvyLmz3+tFxPn
         n3+w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531+yipSWN4z1PsREUql2yLoBp45Odc4T+1C3HyDJzvDVjymSmYd
	viBN8Cmuqflz0J7Kt/QlFJI=
X-Google-Smtp-Source: ABdhPJzmHwoigQ9wqxwRNxLBs+50a6eWGSVOU4Xh4f/3IiMMGvvj0kVWE62+egxnODtmhpctoUtwYA==
X-Received: by 2002:a17:90a:1da6:: with SMTP id v35mr1228869pjv.177.1591764321591;
        Tue, 09 Jun 2020 21:45:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:e312:: with SMTP id g18ls6852185pfh.9.gmail; Tue, 09 Jun
 2020 21:45:21 -0700 (PDT)
X-Received: by 2002:a62:1512:: with SMTP id 18mr1141717pfv.34.1591764320930;
        Tue, 09 Jun 2020 21:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591764320; cv=none;
        d=google.com; s=arc-20160816;
        b=SDFprhHRdMmJgt1tmjeHODliKk1c/P2Apu8AzrRhNiTzCJXUo0p/Yf6+pv83l6k3fN
         /16CemuzA1r/3ATn5dViASpnRQQhuT1cQapJDOxQy4owTGCwQRFDmd1e8+obUGKAoPj6
         Z/dRLX1M0bDbvlGTzcQYe0DlpPpUKo1oz2m7Ss2Fr7iTmw5Rf0hQZaJgIerfKJpjZ46J
         C7qMTcZuK3LDcG9M3RYB2njNO/tMIO5Uzicvo6MriqJSYxKUlgdPP0GnhOm1/1Oz79ka
         W10nUipj2qqA17T2aKN/6qOQB9tfHhDWK4OdNBYV0JF4aS9I5BvqwMxLS0iwUzcTTUFt
         1EoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=x2WnHS+2Z8jLOQnqxGQLG+ukN6Yb95/c3t8abIf1IP0=;
        b=cdaFXr33YkC+gfBnj4UvVNSB6Gbz6k4J1zTit7PpLNkTVe0Gd1fkn+JyMEjCLKNG4s
         3Bm99ntlNVWVmhU1Dnr5qtHEKTSUdFwYujcY8yx5sf1Aggb6ce1moeOA+td5wcnfdHCz
         /d7SJNoKR1RjBv3ahuzXNvqOEvdlq5A8MAI804Rzij0Ji9fBMZPjolux48ZKx2R0OATF
         hQTlbutC7+sh0vnkg7Ywm/Rdh2rKUGo70LkRrnkeFtUtErjvIr9v/SSjLKtyLcN9D4hR
         vZZ8SpaukAJSTrRsiGyZQQ1dAIQ64qbX+YYsx45B2oJyig0gBbjpSsoqxDwO8P4zxkpR
         55Uw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=J2R6TKy0;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.197 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-6.smtp.github.com (out-6.smtp.github.com. [192.30.252.197])
        by gmr-mx.google.com with ESMTPS id a22si281017pjv.3.2020.06.09.21.45.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 21:45:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.197 as permitted sender) client-ip=192.30.252.197;
Received: from github-lowworker-39b4a70.va3-iad.github.net (github-lowworker-39b4a70.va3-iad.github.net [10.48.16.66])
	by smtp.github.com (Postfix) with ESMTP id 4301B1C0C48
	for <jailhouse-dev@googlegroups.com>; Tue,  9 Jun 2020 21:45:20 -0700 (PDT)
Date: Tue, 09 Jun 2020 21:45:20 -0700
From: Peng Fan <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/80e81e-4ce765@github.com>
Subject: [siemens/jailhouse] 15169d: driver: Account for changes in kernel 5.7
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=J2R6TKy0;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.197 as
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
  Commit: 15169df2990fcd836f6488eae58b290a709b1d4f
      https://github.com/siemens/jailhouse/commit/15169df2990fcd836f6488eae58b290a709b1d4f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-05-30 (Sat, 30 May 2020)

  Changed paths:
    M driver/cell.c
    M driver/main.c

  Log Message:
  -----------
  driver: Account for changes in kernel 5.7

The cpu hotplug interface got reworked. Furthermore, our trick to avoid
kernel patching for EXPORT_SYMBOL purposes only is passing away with
kallsyms_lookup_name no longer being exported. Keep the infrastructure
for now for the sake of older kernels. We will remove it eventually.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b9df7b984d88f627c1973e8aaa4ef21d62117ab9
      https://github.com/siemens/jailhouse/commit/b9df7b984d88f627c1973e8aaa4ef21d62117ab9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm.c
    M configs/x86/f2a88xm-hd3.c
    M configs/x86/qemu-x86.c
    M hypervisor/arch/arm64/iommu.c
    M hypervisor/arch/arm64/smmu-v3.c
    M hypervisor/arch/arm64/ti-pvu.c
    M hypervisor/arch/x86/amd_iommu.c
    M hypervisor/arch/x86/iommu.c
    M hypervisor/arch/x86/vtd.c
    M include/jailhouse/cell-config.h
    M tools/jailhouse-cell-linux
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  configs, core, tools: Pull iommu_units out of arch-specific platform info

This is now used by x86 and ARM, so there is no need to keep the same
field in each arch-specific section of the platform_info structure.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3bbe8ec295e8fa7183c971345c499080042d4266
      https://github.com/siemens/jailhouse/commit/3bbe8ec295e8fa7183c971345c499080042d4266
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  cell-config: Rearrange paddings

Use the chance of a config revision bump to update / add padding bytes
so that 32-bit words are 32-bit aligned again.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e3747ae41359a3b0ef1c0eec9c75895e30c2d555
      https://github.com/siemens/jailhouse/commit/e3747ae41359a3b0ef1c0eec9c75895e30c2d555
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M tools/jailhouse-hardware-check

  Log Message:
  -----------
  tools: jailhouse-hardware-check: Clean up dead code

This became unused with 064cfe3834cb.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6fbce3c73e1a2d6df85e1496931bb7cbf6155574
      https://github.com/siemens/jailhouse/commit/6fbce3c73e1a2d6df85e1496931bb7cbf6155574
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M include/jailhouse/cell-config.h
    A pyjailhouse/config_parser.py
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  pyjailhouse: Factor out cell config parser

Move the cell configuration parsing classes from jailhouse-cell-linux
into a pyjailhouse module. This will allow reusing the code for the
upcoming config checker.

CellConfig must not terminate the caller anymore but rather raise a
RuntimeError if parsing fails. This can be handled properly by the
caller.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: decc4b2ff6fbcb6b2aff579e5cf0b36454132298
      https://github.com/siemens/jailhouse/commit/decc4b2ff6fbcb6b2aff579e5cf0b36454132298
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Translate struct.error into RuntimeError

The enables error reporting at an appropriate abstraction level.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 68401c86c58700c207069a9c423c2a0ed5bb7126
      https://github.com/siemens/jailhouse/commit/68401c86c58700c207069a9c423c2a0ed5bb7126
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Add SystemConfig

Add parsing of system configurations. This is so far only processing
essential fields needed to validate the structure, extract the
hypervisor memory and access the root cell data.

The root cell is parsed via CellConfig. As the embedded cell contains no
signature and revision, CellConfig needs to be made aware of this mode.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7b384de640f64a259086b900d4693b63558cde75
      https://github.com/siemens/jailhouse/commit/7b384de640f64a259086b900d4693b63558cde75
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Convert memory region flags into ExtendedEnum

This will allow printing them by name. JAILHOUSE_MEM also inherited from
int so that arithmetic operations continue to work. Ordering matters so
that string conversion is provided by ExtendedEnum, and we will only
fall back to int for integer representation.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 76b4537408f5864961d422e02fd0c52f94d3be91
      https://github.com/siemens/jailhouse/commit/76b4537408f5864961d422e02fd0c52f94d3be91
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Add pretty-printing of MemRegion

Will be used by config checker.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 818fd975706850a640ef20bee12a5d386ec63c29
      https://github.com/siemens/jailhouse/commit/818fd975706850a640ef20bee12a5d386ec63c29
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Add MemRegion overlap helpers

Add helpers that check if two regions overlap in the physical or virtual
address space. Will be used by config checker.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 79df6c32d6fbdc649b3a781128ebcbd3ff6b3d79
      https://github.com/siemens/jailhouse/commit/79df6c32d6fbdc649b3a781128ebcbd3ff6b3d79
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M tools/Makefile
    M tools/jailhouse-completion.bash
    A tools/jailhouse-config-check
    M tools/jailhouse.c

  Log Message:
  -----------
  tools: Add jailhouse configuration checker

This lays the ground for offline configuration checking. The checker is
mounted as "jailhouse config check", accepting the binary root cell and,
optionally, any number of non-root cells.

So far, only one check is implemented: Finding overlaps of memory
regions within a cell. But already this reveal a number of pending
issues in our in-tree configs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4f16acaa71dcee9087610921e7dab69fc9dc7ef6
      https://github.com/siemens/jailhouse/commit/4f16acaa71dcee9087610921e7dab69fc9dc7ef6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M tools/jailhouse-config-check

  Log Message:
  -----------
  tools: jailhouse-config-check: Add overlap check for hypervisor memory

This checks if any region in configuration set physically overlaps with
the memory reserved for the hypervisor.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ee7a9ef7b4ec087a36d8b1ca21d8495728bfc6c6
      https://github.com/siemens/jailhouse/commit/ee7a9ef7b4ec087a36d8b1ca21d8495728bfc6c6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M tools/jailhouse-cell-linux
    M tools/jailhouse.c

  Log Message:
  -----------
  tools: Refactor and align help outputs

Make sure the short option name is printed first. Use a few more telling
metavar names. Finally, align the short help printed by the jailhouse
frontend tool with that of the tool helpers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 95392673a20aed22dd7323b4c098022a729828e3
      https://github.com/siemens/jailhouse/commit/95392673a20aed22dd7323b4c098022a729828e3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M configs/arm64/ultra96-inmate-demo.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c

  Log Message:
  -----------
  configs: arm64: Align ultra96 config with qemu-arm64

This both fixes an overlap of the ivshmem region with root cell RAM
region and adds full ivshmem demo support to the three configs.
Reference was the qemu-arm64 config set.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0a2212a06dff9de94548c99979fe83b5de7cff38
      https://github.com/siemens/jailhouse/commit/0a2212a06dff9de94548c99979fe83b5de7cff38
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M configs/arm64/hikey.c

  Log Message:
  -----------
  configs: arm64: Fix hikey memory region overlap

Reported by config checker: RAM and ivshmem were overlapping.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0156237196f6ce4f3fe808ffa0f5e1ef86cba2a6
      https://github.com/siemens/jailhouse/commit/0156237196f6ce4f3fe808ffa0f5e1ef86cba2a6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M configs/arm64/imx8mn-linux-demo.c

  Log Message:
  -----------
  configs: arm64: Shrink imx8mn memory regions to required size

The last one was unused.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4ce7658dddfd5a1682a379d5ac46657e93fe1ff0
      https://github.com/siemens/jailhouse/commit/4ce7658dddfd5a1682a379d5ac46657e93fe1ff0
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-06-03 (Wed, 03 Jun 2020)

  Changed paths:
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  arm: irqchip: fix irq_bitmap setting

There is a implication that the pin_base in the cell file
should be "32 + 128 * i" with "i >= 0". However there is no checking
for that. Pepole might choose other pin_base, such as 160, 224 and etc.

Saying the 1st irqchip pin_base is 224, the 2nd irqchip pin_base is
160. When irqchip_cell_init loop into the 2nd irqchip, it will override
the settings of the 1st irqchip, because "224 - 160" is less that
"sizeof(__u32 pin_bitmap[4])", so to make things simple, we not enforce
the pin_base must be "32 + 128 * i", and make the upper example could
work is to check whether pin_bitmap has a non-zero value.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
[Jan: removed unneeded test]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/80e81e7edcfa...4ce7658dddfd

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/80e81e-4ce765%40github.com.
