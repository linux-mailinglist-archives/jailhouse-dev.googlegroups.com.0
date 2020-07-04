Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBMPRQL4AKGQEHEQWSXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63d.google.com (mail-pl1-x63d.google.com [IPv6:2607:f8b0:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE32147A3
	for <lists+jailhouse-dev@lfdr.de>; Sat,  4 Jul 2020 19:13:23 +0200 (CEST)
Received: by mail-pl1-x63d.google.com with SMTP id f2sf12090514plt.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 04 Jul 2020 10:13:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593882802; cv=pass;
        d=google.com; s=arc-20160816;
        b=Fd442ExU4wepg4Sg5ucwYEq6lWw9qgy/gnpbVhw8EPDk1FAi3KVB/DBFK3Y48vKxCj
         hMnLO0cckY/GTvIlnzFDO9mHE6AZVIxPRzfgExrCjT16EtovVzd9PgIPO2/Kadhpal14
         7+kB2a+JNyWn2yo+XMWJwvQiplmfAd2+lgENZlP4+R5r97nlW0V+W+a3h0YE0cqOTJ0t
         JnQ/w6XOPH3tDsET8qu5AE73Z8hS+jcffd0mGHc6O4YjDCNnko3Vcsq5GJdOXNF6Cr1I
         rkC3y/SZ/blktjhRmhdzib07cyuSt0orF3xpAVMJQU4qW9NvwGKZiMp0g7ztQP5Vf5ZX
         1y8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=PvhiQBPjy9a5ski+UUhQwKm25Knp2my0AYEyHkONrvg=;
        b=K7zC5JKyrMxBipNxHT9N4coq7YyP+yakvz2x2IjBZCY9J53PxQPm+RSjFp28dra0in
         +F5+NlBVxeAqpZqgyU+e/D79IMSiSUpX/Lo9TRkNzx3jBHZJmEJfEOEEzxobYoYfavdq
         aOKYp6C5C5fN8Kd7VhjbUnjOAJ/+Y6Zj+bisGLpyfhsQv7KzJfDaS+WmybnqG5fuh9Ip
         gzqVod9sc5Wx+8pvCkTIvgbV+ZWSrbbKU1e9LQj7yq7kt2HXfhz288Sa+9Umh61qLvta
         /OUNtZJWrKORxJC/PObr+Mut3tv2pnCAXpGw3qR+Q+/aE/bWNv0dw7MgDp0UH2o4UhZS
         IStA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=z62QIRKU;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PvhiQBPjy9a5ski+UUhQwKm25Knp2my0AYEyHkONrvg=;
        b=gQ089Svl2yS/6DtfvDE5/r+Fx8FqyL58bnmIkYFLRkUvuSx3jH5G7oiVk+SYaFG+jQ
         7/83nvstyeTBkcZzTpNwpSTKoIP+1CZ4BytZKHCjJ/Aok2T+9sISsI1PYTV6JAy5HfJs
         JU9ZgrzBziCI6t3fMZP5YB9IH6o3eHWpPgSWAiFICY2lZ4JIZlZCGGh/am2nEmuxPf70
         7YDyCmdA/TJRN/XuVmB6KkqgF/Q/GEK546OaOXe2Wxxy34Qezp8mGU0/DJna81RVsAP6
         Vp8yLthmL74dlceCpFJyNAi37uVuxIt2hNqTVTb6ELgO6pkhPrdwDgQCNNd/OT4LLJ1K
         jC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PvhiQBPjy9a5ski+UUhQwKm25Knp2my0AYEyHkONrvg=;
        b=A2wrdHJvk6JdcLomECUu8FrsvlsBM1uA09OXm8x/aIfniEWqD4bRwjyrGOmicHStPB
         nKssO0Vv+fv2SEw8zslCVL9xY3ZSmrwpwmJaZHnlgsQ6NqPK7mcwdXZX0zeyTloqVoz5
         cm7KPZ68c8ucwRwLG5ft60EPet1BbfIi/FjkH58nPh8aIpAHiKRPRsNSt8BLBeKMtbrF
         iQ9ErYmKUQB5S1n7dFFf+lsv1v5gPpajFphCNQqeZvM5svFocGO7cGsdiYnkHHMcL0AO
         q/K8cz8fBRabqBbxWj4xCMgJ+S35SQfQvR57TKkf1H/K7JlwwaQ32TOqkaZYxyaP0kUg
         4P/Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531qIa6kAny3BFL8sObMkQTkNlIfzRn7jQvoVvSBr0BLbHUBjjsd
	p34W2bSq/x/FDXdWtWJ2k2c=
X-Google-Smtp-Source: ABdhPJzctqjZMVD8ngfLfHdCa6V/o8o7cbm+ic6AJ38NbqNBs87X/c/nLu+PpM8AQDFt6FxixqDJLw==
X-Received: by 2002:a63:5a17:: with SMTP id o23mr33856510pgb.218.1593882802027;
        Sat, 04 Jul 2020 10:13:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:8c10:: with SMTP id m16ls3880665pgd.7.gmail; Sat, 04 Jul
 2020 10:13:21 -0700 (PDT)
X-Received: by 2002:a63:5821:: with SMTP id m33mr34348082pgb.43.1593882801301;
        Sat, 04 Jul 2020 10:13:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593882801; cv=none;
        d=google.com; s=arc-20160816;
        b=QREDWYJdjIyh+YrrUNJd4WiI7LY60D7U4eTc/yDlYTL255F5y5K7tXhKe+jvT9wzx3
         k1upPBBwP4/e2SZQCSyXRz+dVnIpaxOhT6NZtmm179p3axxuSjv8mkBCYIY8B7rLeiT8
         yBaAYO1kcJiGzdVxMGIqa3kqP92ITS87orqEaBl2RtjByWTD9G/hR+TDoKX/1tU3WQr0
         /12xw7SwRUn3vfYWb3peRlbXj1zZphawGGoPg9j4qv0C1xTEaS97EiHZzRIi3bzh/OEA
         Ke/vyXRPCPU7WHES8pT0oN5qc9QcbuHAaut60oPRq7pT95zP63iA/cWUYBX/jEKqyySS
         uTlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=h73hV2t2sl5/X/T3zKpqAuID5iBbwP80RWOQjMVfiRc=;
        b=slsyoZLjntMzw+NytUFyBmYeuJbfLGgdqK1BS17ILau8saV7bIR1BsZgzB34U9Sukr
         0AEPn4MiIurFMDcgyMPT5oUDxyEQcVobadG0EgJQBDlBXKDvgFaq1EGJBa4BnboLQJQa
         /GQnpvdMjtE/TlfR4zbXNp7iAlU0uiwzyiAzja9Lu5iItpYWvnzgeqFUADA/R+ZnKKbo
         R090YoSKkQ/CShxcT7cOADksK95XMTS2/+X2rZqyY3OVwUVt8RUqi0srSoG0lG98xz1c
         tmkn9d2duKNxFr2e6fYj0u30T6wAo1R6qGoIVm70DmLHaPLquZhE51LSVE+LaRro0Iet
         qMKg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=z62QIRKU;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id t23si684097plr.4.2020.07.04.10.13.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jul 2020 10:13:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Received: from github-lowworker-f1f7af9.ash1-iad.github.net (github-lowworker-f1f7af9.ash1-iad.github.net [10.56.111.13])
	by smtp.github.com (Postfix) with ESMTP id A227D5203AC
	for <jailhouse-dev@googlegroups.com>; Sat,  4 Jul 2020 10:13:20 -0700 (PDT)
Date: Sat, 04 Jul 2020 10:13:20 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/8787b5-9c9457@github.com>
Subject: [siemens/jailhouse] 0ada89: tools: ivshmem-demo: Map memory regions
 with corre...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=z62QIRKU;       spf=pass
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
  Commit: 0ada89530a22e15528f0eb0e5a696e7e0e910c42
      https://github.com/siemens/jailhouse/commit/0ada89530a22e15528f0eb0e5a696e7e0e910c42
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M tools/ivshmem-demo.c

  Log Message:
  -----------
  tools: ivshmem-demo: Map memory regions with correct sizes

ivshmem protocol does not describe a fixed size for the
rw, input and output regions. For each platform, the uio
driver will populate this information in the sysfs.

Extract the size from sysfs maps entries and use it for
mapping different regions.
This will make the demo generic such that it will work on
all platforms with different sizes for ivshmem.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: terminate on error in of uio_read_mem_size]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1ce56fbe9a63fdea952d54d10a0ae338d7f46901
      https://github.com/siemens/jailhouse/commit/1ce56fbe9a63fdea952d54d10a0ae338d7f46901
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M tools/ivshmem-demo.c

  Log Message:
  -----------
  tools: ivshmem-demo: Adjust selection of interrupt target

Number of peers available on a platform is different.
Ideally, any peer should be able to communicate with
any other peer. By default, all demos send interrupt to
the next peer in a ring fashion.

Add support for passing a command line parameter to specify
exact peer to send interrupt to. Furthermore, avoid using a
hard-coded max-peers value for the default target selection.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: fix register access, print max-peers, massage commit log]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2b05593b1f9c1e109249a144bb22b01d9d8bd78d
      https://github.com/siemens/jailhouse/commit/2b05593b1f9c1e109249a144bb22b01d9d8bd78d
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M inmates/demos/ivshmem-demo.c

  Log Message:
  -----------
  inmates: ivshmem-demo: Parse target from cmdline

Generalize the ivshmem-demo to work on different platforms
with different number of peers and ability to send interrupt
to any peer.

By default, the demo sends interrupt to next peer in a ring fashion.
Optionally, allow to specify the target peer from commandline.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: fix ARM targets by avoiding division]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1765512619afb5ce4b98da06350e833d80d765a5
      https://github.com/siemens/jailhouse/commit/1765512619afb5ce4b98da06350e833d80d765a5
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm-inmate-demo.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: k3-j721e-evm: Fix memory overlaps

Fix errors reported by jailhouse-config-check
Fix overlap of baremetal demos with IVSHMEM.
Remove regions of memory which is already covered as part of
some other memory region.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7bea86a841881f715c00155814131b09e2156d10
      https://github.com/siemens/jailhouse/commit/7bea86a841881f715c00155814131b09e2156d10
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M README.md

  Log Message:
  -----------
  README: drop the warning

Jailhouse has been chosen by Semiconductor Companies(TI, NXP)
in regular software releases. And it has also been deployed
in real products.

So let's mark jailhouse product ready,  drop the warning that
make people scared to use Jailhouse Hypervisor.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c03229127edacaebdd2c1dc31a74619f109c57f2
      https://github.com/siemens/jailhouse/commit/c03229127edacaebdd2c1dc31a74619f109c57f2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Strip trailing zeros from cell name

A cell name is either terminated by length or by null-byte. Avoid
picking up the latter into the python string.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9c945739d90c0adbad068dc9669b1b42522791da
      https://github.com/siemens/jailhouse/commit/9c945739d90c0adbad068dc9669b1b42522791da
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M tools/ivshmem-demo.c

  Log Message:
  -----------
  tools: ivshmem-demo: Fix convert indention to tabs

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/8787b55d3694...9c945739d90c

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/8787b5-9c9457%40github.com.
