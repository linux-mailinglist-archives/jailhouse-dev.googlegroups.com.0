Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB6US3D5AKGQEZ5FD6RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x437.google.com (mail-pf1-x437.google.com [IPv6:2607:f8b0:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 8947925F7CE
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 12:20:44 +0200 (CEST)
Received: by mail-pf1-x437.google.com with SMTP id o21sf8208696pfd.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 03:20:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599474043; cv=pass;
        d=google.com; s=arc-20160816;
        b=JuTgazd/cm8t2e0mEzvIzp9fbNfK26FjcKGlKJYjvZQVA7S2ZYICFCSxXlA8R3tAZo
         OQYMQQldzU6o74VpusabFOtcur/3OCNxFXqTuhTP8cqfeFsYSPSetRZ/0trV9bmvrzG6
         xL/Cf1KIDoaqU7jNjNT943H92FJgn96lQDQV4iXsbqI/cu+nh/+o+AAciXF68qyt+4xX
         i1JjGzTjQ4ZrDEp6pqm8Lp8ZQVxBGeB2A3ZsvgXPYHDJ0Qq6JkO2XJDVCSFmRUKBhxZ6
         iOpP0wch02HThMinHYJVuUmZqiEKeEgV/H3Mp8dM0+MHH/CIadm53aKNRn0m6V/6ZZ8j
         oMuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=+cGGtFSJWQ4i4osD8kmFZszf2tBXg8lU9M3x3xMKisg=;
        b=lmYQnySaCsQZI9mpqkuf2N3/eDrGdjawc+QsxNjxJotq/8RjTOiDRGunwu+kQTTsGc
         8Uc3mdvM7AhySQhUT2Ri4bQIoxEZ8vjk5YiacAIyI8N+ZLVhuGd+FxLBh5Vag3LBf3Lp
         pOxopqtwFedgSkPZCxcpTpk4XQLqPhzqJch0RM1h/IanQfln6C2jEZH8kuh8HyboA+Xq
         2uBido/VoB5tV+AlkJCMiWyDSUdDOPawyYMAH0aOuIMDcFeENqQjluIct7N17IAoeYSj
         v5wC85iZCSLvPjSqe0XnIRQ1/MS33eJgMFVfsheRyIZYfAgT70/qFrhIYQZKtnhGJdpd
         022A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="bmLl3g/J";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+cGGtFSJWQ4i4osD8kmFZszf2tBXg8lU9M3x3xMKisg=;
        b=Zw9gADL7mmpGflcFtYtHeNGxyPJuHMaHB0NHeXZtj0WbeX7ElI4hJZ3RBu271fxEOp
         wKI1PkYcQkTyMa5TCf6BF+/BM5D0Beajpe+3N4LjXJ7cCQgRl9CQHVEsex6ys8nqVZI9
         9oW6xEkxKFvcvyQYAs5xLxw2uwQUIsY2B/hzFGinc35isOtr1d6J1fV18BMMdl+4oIZF
         mebHN203upPnf7zbaYzhAmiXdXqx0AgDsI7pKE4B5unD2i8EBemJ9qSG3kI5OAHsUhGt
         NtCBLEtF21kfbQ+SsTccH1h3//OTjvIgi20/wSddY7UMXSoUQ151btNaAerSNzpa80l1
         c1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+cGGtFSJWQ4i4osD8kmFZszf2tBXg8lU9M3x3xMKisg=;
        b=kOWo19UqYQLXi39oLnu7dFgPHqrFVMKJ87eC8LghlzutaY/f/YOLHpkRwkkAZh4a9C
         be1i+97tcPKCGlvV2VPJPGAkUWeZwVF6g/RmUxrlfqo64IPlX5hyzoELe0g9JSWUypvC
         ziRVv+RxQxSFChU+PM31Pzd1MAj2m1UhsT9pifHc+iiXd0dDda1NFURQJjQf9OchOYUn
         DIHATELP1nSadVwuEVnvnDm/yZlW4ZuguuX42vmf6Nnf0Gq5XTdAJLlzzTDZTo1fg+nd
         8mk4a9fbehP9ts3ukTbWctiHJID1/KfnkhN1Up+HXNVfFeHHcmfLfcoBO2beZAuV+zIt
         nSDQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533i8dPASW221XDJUNRrOMzCAmixgknJiDA4AkqlLBmu8obIS7tE
	W7hOgfQm4ik/3HNLdxDcaHI=
X-Google-Smtp-Source: ABdhPJzMNA/ER24r9IytZLtKbF8U66DyySKi5yJokEHvqzBEqOuCqFpRbFBo5iGwKbSVMKWACFgZ1g==
X-Received: by 2002:a63:3d0e:: with SMTP id k14mr700289pga.219.1599474042864;
        Mon, 07 Sep 2020 03:20:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:9d01:: with SMTP id i1ls4738106pgd.5.gmail; Mon, 07 Sep
 2020 03:20:42 -0700 (PDT)
X-Received: by 2002:a63:ff07:: with SMTP id k7mr16087202pgi.39.1599474042030;
        Mon, 07 Sep 2020 03:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599474042; cv=none;
        d=google.com; s=arc-20160816;
        b=fdiPP6xJCy3iIjYpkWoIzqcGGg0X8zwqZMtbzCu6XrwMevPmL6eKpBGZfCYWpCvfgl
         GVsq/aCtN66fViFcTMp+tb6B0M6mfRdATIE/WZvJoWeNcHTueV9AJM+Wc/7jXCrmhf+Q
         uSxWvqKdCPXAjOBgT3P9lbal7cRIVD1vnn/aDLaRyZb+DcxD/+f+hUb16lxllJroq3VS
         DvKp3UizQXiUXv7P2J6Xv0ngFtYY92VX0fNcXb7+iwY5J2MmjPgS975pLQuIKM6QzKio
         W2qPGWLVr4cK0vKZjx0tnr8lQj3k1MrJJKfaQ1qTVuCab7otemoMdEJtZ3b7IxGluwPL
         LFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=WNNA/tKx1HLCHT7uW0tkfLAvA5psTpAyyZrgIR3uqbk=;
        b=wWxogBDcBsY7kcNA9R+xrco1qa1FgRNwTYYjAvd8teBgBQH0z5wKgkQ9LgaENKKc91
         PL+rzc6TKe8D0qokW6dTopuDNbZRN9qhS47w0urK84M1Y3Nsjpcc7eOaSkeIJZ1MEs8j
         yQBFgFuYvNOvCAYPXCmZhJUi68RjHWI4w29cU/okG48PLNZ0iM7xQ2yHulSoz7pro8yz
         mZFWBfDyFoU2ThJgCOu+UqtNJeN1hoaBYwsOjhqGMpAvKh4D3bnSNdKNcyJ1d62GdXtB
         gNAiWIxf+XtT9gZdx+XDzqFFz/hAiqBRuOyDHzRt1AahiksQATR4Px/hyEe0PwzV3oIw
         X1yA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="bmLl3g/J";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-21.smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id v17si848854pjy.3.2020.09.07.03.20.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Sep 2020 03:20:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Received: from github-lowworker-cd7bc13.ac4-iad.github.net (github-lowworker-cd7bc13.ac4-iad.github.net [10.52.25.102])
	by smtp.github.com (Postfix) with ESMTP id 45FD2520A58
	for <jailhouse-dev@googlegroups.com>; Mon,  7 Sep 2020 03:20:41 -0700 (PDT)
Date: Mon, 07 Sep 2020 03:20:41 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/6d7eed-3e1ae5@github.com>
Subject: [siemens/jailhouse] a8d033: Documentation: fix display resolution
 number
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="bmLl3g/J";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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
  Commit: a8d033c65dbb8667fc795e16aa4ce60dd45b18f0
      https://github.com/siemens/jailhouse/commit/a8d033c65dbb8667fc795e16aa4ce60dd45b18f0
  Author: Daniel Sangorrin <daniel.sangorrin@toshiba.co.jp>
  Date:   2020-08-27 (Thu, 27 Aug 2020)

  Changed paths:
    M Documentation/debug-output.md

  Log Message:
  -----------
  Documentation: fix display resolution number

I was wondering why the configuration size didn't match
the multiplication and then I realised there was an
errata.

Signed-off-by: Daniel Sangorrin <daniel.sangorrin@toshiba.co.jp>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7bcab7c38b2c853ec068b35d61205ef660fceaac
      https://github.com/siemens/jailhouse/commit/7bcab7c38b2c853ec068b35d61205ef660fceaac
  Author: Jakub Luzny <jakub@luzny.cz>
  Date:   2020-08-27 (Thu, 27 Aug 2020)

  Changed paths:
    M configs/arm64/dts/inmate-rpi4.dts
    M configs/arm64/rpi4-inmate-demo.c
    M configs/arm64/rpi4-linux-demo.c
    M configs/arm64/rpi4.c

  Log Message:
  -----------
  configs: arm64: Add support for RPi4 with more than 1G of memory

Add the required memory regions to support 2G, 4G and 8G RAM variants
of the Raspberry Pi 4. Tested on all the bigger variants, not on 1G, as I don't
have one on hand and it's not available anymore.

Also moved the memory used by Jailhouse for the hypervisor and cells from
0x30000000 to 0x20000000 to avoid conflict with GPU memory. That is fine for
gpu_mem setting of up to 256. The memory is supposed to be reserved using
reserved-memory node in the device tree.

To support variants with >2G RAM, the PCI MMIO config space was moved into the
ARM Local Peripherals address range, into free space behind the GIC.

Signed-off-by: Jakub Luzny <jakub@luzny.cz>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8e1aea00f77d1c1a4b2313255966b741c2f1fd93
      https://github.com/siemens/jailhouse/commit/8e1aea00f77d1c1a4b2313255966b741c2f1fd93
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-08-29 (Sat, 29 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v2.c

  Log Message:
  -----------
  arm-common: gicv2: Fix byte access to ITARGETR

Byte-size write accesses overwrote all fields the issuing cell owned,
not only the target byte. And byte-size read accesses may have returned
the wrong value. This was broken since the beginning, just wasn't
stressed properly so far. Latest jailhouse-enabling/5.4-rpi revealed it
finally.

Fixes: ee6b35ba9037 ("arm: GICv2: handle SPI routing")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


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


Compare: https://github.com/siemens/jailhouse/compare/6d7eed9ccf14...3e1ae553f995

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/6d7eed-3e1ae5%40github.com.
