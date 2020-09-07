Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB5UR3D5AKGQEYAAJJDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe3a.google.com (mail-vs1-xe3a.google.com [IPv6:2607:f8b0:4864:20::e3a])
	by mail.lfdr.de (Postfix) with ESMTPS id A705325F7A8
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 12:18:31 +0200 (CEST)
Received: by mail-vs1-xe3a.google.com with SMTP id n128sf2612443vsd.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 03:18:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599473910; cv=pass;
        d=google.com; s=arc-20160816;
        b=v8Xiu7kEqVhoF3Shiiay3Tf1wyL5iTzbrRcMuuXXYeRVNgN6Q0Tt/QKOTpxQYcNa3P
         76l0hTnsJf1qd8OT9zu9PHrlW6hMf34Ea83zGnf4kzAevbS16eYpMsbDwd6KoeQZJGJt
         1+HY66KRjADWvcC/axcu3OYfbuUovto5u4356F2m1KdhvnNh8cTNkcSGLcVhyMM0lcyZ
         chbzUvLCvqu5ZGZMwz8kQ6Sm6/5S9K49qctQE9831b3aBsgFOxl0IYZs2H6p3x9zx8Ey
         M+VRJA+UaQCcsjUAlABaaxC1gRKbDNtL4fWbKGnHFsuerkULw4dDruO4I6jStgU4aV+W
         AiHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=V1jMGlIRgOpigov8h281s30lTrkPoNZRIzmaU14otGY=;
        b=TyGy2wSpdkHMUT0ht8UK+BtyhaCRha1bCqJgb6INTWQ//kPXhDLlYh0QPIkOStH1Ep
         v8fYQbvGUrWU37yrvpmJClgKiIo208DFwVPHnV+NCD4BMjZ6b4kzRaZfNTtHDqHrI6p4
         D9xyAVJkCVdkblGszB/7ZZ80he0mt6uz4P8O15uf5YLNOWjW/igVTurK6de45etFy1Du
         pegfcdAmoJ2j2UDcxQcnx5OJde4I66MiktSwtj9G2dzIKkMS0QiqhJFJInkTaOng5xjI
         +HU2VLPV+QlzXnLB9RGo/i5u+8hPVKxUMLvcT3ANOV0gqGHiBhVYT9lmGNAffE/anJDv
         BxIQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=sfri55qh;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V1jMGlIRgOpigov8h281s30lTrkPoNZRIzmaU14otGY=;
        b=Ehxa59izamlo1cyKg9fLIL4RXuDH2c0MNT8Y7NE78Ngo6EOs6kXt9orrY0jFaymc47
         WqOxYrvLauUgWJ3Gf5JS3YRoyKtgsTXnwFIwk0Au/r+fodIkyCnHDo8YB+q2758eS/iR
         nq4mBSxpsVjPmSxMOkvQglOTnf606IAwB5eQNaLkjYwiMFy/VkGUQa5KGi5WNFQhfy7b
         LVyfbm1THXa1y/2QY6Sc4MPmTJDbeZkrmKSJFc7dzR4P2lfatK5fcVIobB9hSUhq1EWD
         +vNP0vPddvXPiLyRh/iLjALTCb28sWbWrWANXUi4Vfp/bWelE+A8IHjQNf5GiD7KTsCU
         8VXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=V1jMGlIRgOpigov8h281s30lTrkPoNZRIzmaU14otGY=;
        b=hsJ+IFuRfYdR07cpYglU6Hkr7fiIMh0tJ8e4yt3c8NgMzSDbRfwP8SGTUaG+WwskZ3
         pJbp4YWp8M8F7Z7Z6J/ZS4Ywx2sws3SVE1awBuUxhCzpsWXr7ZCFeD70eoAWGYmZNDxV
         PDl4YVYooFV/6fQ86fEC4riHeY3PJo6WW8o3sRRhjg5ofbw6SHPebA2vlLgIl3sK/kGR
         SGbXoLVuqBX+OQGgM0OgXWQ+in8wHCZIzw46ANto9kDPzer2pajElEjin9TnZHrQq2Z2
         q0p2bZA0c80a3WFjXgsFCuFKtgesQQYsVukCA/I9AglvBi1qJKyuZb69GybIA0fNZae/
         Bazw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533a1QD37F2gdR90fFfZsvqQVXhGZVCYSgVPMwDnZimRBEmDHHf0
	XipYUYYWSKtLp+NdgtLtY5E=
X-Google-Smtp-Source: ABdhPJyEKWWxITDQ179A8n2tr3DW1ziB7LqyEnyeuZLuMxH0BK2LDgltd+FHO43hOCfn0Pb4Tt6zQw==
X-Received: by 2002:a9f:2351:: with SMTP id 75mr10701768uae.29.1599473910463;
        Mon, 07 Sep 2020 03:18:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:270f:: with SMTP id s15ls1179915uao.7.gmail; Mon, 07 Sep
 2020 03:18:29 -0700 (PDT)
X-Received: by 2002:ab0:ef:: with SMTP id 102mr1013973uaj.142.1599473909685;
        Mon, 07 Sep 2020 03:18:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599473909; cv=none;
        d=google.com; s=arc-20160816;
        b=hwbuhEFtHvhsI1lLuXrf8sshRdLYjWhpML1ZYRVfqbkE3/E7218P8dnWQZ/uX0vrBL
         L8WRsRRfs8JhNcK7ywTmRLhxUJ6PpmJnh1PuXH9AIy8Z6x92ao7UO4w6/VFk81R9TlIX
         63CZ1zvQu4JUBoO5E+hyFqmwV4TxfhFi/7mpnvxc49UUvZKZA92EnWSAMnzF57+TSLw+
         fnO31Zodyid4WJ7GjuUV9UUqpl+eLgHiqwINKx9HJMe5APBPlZ5PpIK1TtebnX9wKRYZ
         cdIzfbqmcqCK/qBEirX+IiraBwxaMR7/z/buWUjRL3fLr/gxXzivtF8w5cwnFp5E7Xpg
         6S7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=iqnyTch4DQzM4DRtDA3lv8QQS/2Nh4Gs62LamUfJk+w=;
        b=MvMrLlup6vVQO3K1kJz8OktLnDU5aT0b/rMPk9nak2tFOzO5Mrj0vntRIrnyy7k+/D
         gpGofn2h+FfCiYCY4GHzjNi5PRSOsufDJnnS44KgyVLC6gol5m4C/3ZgM3EVsSb7OEU9
         aqTJr383RKLIwcTtufjZJyIheLzfPkx7mtPdpJKHLK0ZCct94Efb9UTc91Jt5C3cMBJt
         kFQJPTsn6vR5jvRSY3hs75RcK9NhLXo5/RGHpgSp9N6DdACDYlld2MonSiuRR/soeXgb
         ome2O8wkt93cjJc/nAk4Dv6DEuTApWbs/qgdRZX+eo1ai3jDFdcJDkWGZFkgLYydI28X
         J/nw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=sfri55qh;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-22.smtp.github.com (out-22.smtp.github.com. [192.30.252.205])
        by gmr-mx.google.com with ESMTPS id u19si762523vsl.0.2020.09.07.03.18.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Sep 2020 03:18:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) client-ip=192.30.252.205;
Received: from github-lowworker-a6a2749.va3-iad.github.net (github-lowworker-a6a2749.va3-iad.github.net [10.48.16.62])
	by smtp.github.com (Postfix) with ESMTP id 695DB560E5A
	for <jailhouse-dev@googlegroups.com>; Mon,  7 Sep 2020 03:18:29 -0700 (PDT)
Date: Mon, 07 Sep 2020 03:18:29 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/8e1aea-3e1ae5@github.com>
Subject: [siemens/jailhouse] e2b94a: kbuild: Avoid deprecated 'always'
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=sfri55qh;       spf=pass
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
  Commit: e2b94aed34874271a9ede06bf4521b4f16ea8b86
      https://github.com/siemens/jailhouse/commit/e2b94aed34874271a9ede06bf4521b4f16ea8b86
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-05 (Sat, 05 Sep 2020)

  Changed paths:
    M Kbuild
    M configs/Makefile
    M hypervisor/Makefile
    M hypervisor/arch/arm-common/Kbuild
    M hypervisor/arch/arm/Kbuild
    M hypervisor/arch/arm64/Kbuild
    M hypervisor/arch/x86/Kbuild
    M inmates/lib/arm-common/Makefile.lib
    M inmates/lib/arm/Makefile
    M inmates/lib/arm/Makefile.lib
    M inmates/lib/arm64/Makefile
    M inmates/lib/arm64/Makefile.lib
    M inmates/lib/x86/Makefile
    M inmates/lib/x86/Makefile.lib
    A scripts/always-compat.mk
    M tools/Makefile

  Log Message:
  -----------
  kbuild: Avoid deprecated 'always'

Switch to 'always-y' as suggested by 5.9.

For older kernels, we need to set 'always' to 'always-y'. This has to
happen conditionally in order to avoid warnings from 5.9 onward.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bf1953f94603d8222e545d531221f93ed640f97e
      https://github.com/siemens/jailhouse/commit/bf1953f94603d8222e545d531221f93ed640f97e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-06 (Sun, 06 Sep 2020)

  Changed paths:
    M driver/main.c

  Log Message:
  -----------
  driver: Adjust to kernel 5.8 and 5.9

Several things changed and require tuning:

 - __get_vm_area is gone, switch to __get_vm_area_caller which now
   requires another kernel patch to export it (pointless to try
   RESOLVE_EXTERNAL_SYMBOL since 5.7)

 - cr4_init_shadow was hidden from modules; set/clear VMXE directly
   instead so that the shadow is aligned to the real state; no action
   needed on AMD as EFER is carrying SVME

 - include asm/apic.h explicitly for lapic_timer_period

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e268d2fcf4d0c391ee961703b3f4478c4ebca863
      https://github.com/siemens/jailhouse/commit/e268d2fcf4d0c391ee961703b3f4478c4ebca863
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-07 (Mon, 07 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Fix wording of parse_iomem_tree comment

Makes it easier readable. No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 07378a910b85a911caa14eaf7d67d65cfdd6fc51
      https://github.com/siemens/jailhouse/commit/07378a910b85a911caa14eaf7d67d65cfdd6fc51
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-07 (Mon, 07 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Filter out AMD IOMMU memory regions

In case they are enabled while parsing the tree. Analogously to DMAR on
Intel, except that we do not need to keep them.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2403bc4d3d0aac83ff0732ed24ce4473744f1322
      https://github.com/siemens/jailhouse/commit/2403bc4d3d0aac83ff0732ed24ce4473744f1322
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-07 (Mon, 07 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Return true size from IORegion

Avoid having to override the size method in PortRegion and rather do the
correct calculation in IORegion already. This does not affect the
rounding in MemRegion.size.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 231c39f4b31e25d8ef413533e875ad3193a54e97
      https://github.com/siemens/jailhouse/commit/231c39f4b31e25d8ef413533e875ad3193a54e97
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-07 (Mon, 07 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Always walk reserved regions with children

Newer kernels and/or certain platforms (seen on AMD R1505G) list a all
PCI resources and some ACPI resources behind a top-level reserved
region. Skipping it leaves the config fairly incomplete.

Also fix up a trivial flake8 reporting at this chance.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c54b26397441ea9e580aba317071f5f98050f194
      https://github.com/siemens/jailhouse/commit/c54b26397441ea9e580aba317071f5f98050f194
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-07 (Mon, 07 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Factor out MemRegion.is_ram

To be reusing for merging RAM regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3e1ae553f995e2b23867e5f58633beabf0760583
      https://github.com/siemens/jailhouse/commit/3e1ae553f995e2b23867e5f58633beabf0760583
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-07 (Mon, 07 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Merge adjacent RAM regions

The kernel tends to report regions that are not page-aligned but
directly adjacent. Adding them as-is into the config will make accesses
fail because the regions will end up as incompletely configured sub-page
regions. Detect such cases and merge the regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/8e1aea00f77d...3e1ae553f995

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/8e1aea-3e1ae5%40github.com.
