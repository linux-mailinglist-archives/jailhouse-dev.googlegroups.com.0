Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBJNLUTZQKGQEENTVZ2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1039.google.com (mail-pj1-x1039.google.com [IPv6:2607:f8b0:4864:20::1039])
	by mail.lfdr.de (Postfix) with ESMTPS id 043FE181E32
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Mar 2020 17:45:27 +0100 (CET)
Received: by mail-pj1-x1039.google.com with SMTP id mp23sf1487794pjb.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Mar 2020 09:45:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583945125; cv=pass;
        d=google.com; s=arc-20160816;
        b=Os/+57avGWSTM4Em/gL/wn2V/j0/WniQwKqnLEA1GrhbB9lcO7VMSEhGsI+A59zPP2
         vntsKnSNCWyjRRH83B+V/MPQk9PeetA9WpYp2GbgqI8ikQIxki3Aa6xdx1z/Pz+sevC9
         s87hzg8avkweD5Pv8Mok5Q0C+xD/1v8oeMShQyB3FEPsE4qkKQ6FaNJzNUkM2Kd+Dwau
         dIFeG42PNJCvC/tbkaa7IARJQqOlpu8TDprnTAz6pqj6JasLV7IEJXlXJlCB7gjNbO1t
         Is+vJlsBWRoZ7tBn0Gps33wopeVJEvfrqmoxCD33MZOzAYRBEilZBkS+2Q+8jQW46u+N
         hzfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=WzIww4WIrEaM+eTHrFbDxJI+0zBlmSmA2sTNyPMQ/3Q=;
        b=SjBlJex3IrU3IYheuLY+JFkUQbFql/CGcp2ssWgb2m7MaXTS5KHTtQmO9L48F+QVgw
         ONzF9jhEqMBlr/T4LxMHJCI1klGQCeQHXdMgk4d8ZwINIDFg4Pbazj9Dsu4sDV7AxhKq
         /uRrch77YEc+hcErRPRxM/d29n3Wo5VSA+6KMePT2/FfEARPvItHRwYDqBTsEVonKJvp
         J5w07dyWotyJ+H+KrZrDhP3Y3Vl84CI/2ewDdP68NqyoLidEPHr/jkC4VivNfXpjLwlY
         KUaTis++EUdhYrfPWuYpEbEf5+d9g62JODdlO2jS4zIMmUP8KYtlJvlHuzPaXAzDn6Yy
         77lQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=aIOcd7wD;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WzIww4WIrEaM+eTHrFbDxJI+0zBlmSmA2sTNyPMQ/3Q=;
        b=k88VOMphiqE2BzAuRbbnLIfnkDy/wFvHHe1sAX5zvWmPaCjD4VdGUeWhK6L0O9B28g
         B2/rwLQVHXVahJI+CMzbkZbM9xwY8zFI3ePdw4laDHTAaMPU262Pspsaym0kMn/uW/y4
         xl8oNIWZDynPn89dlVebikSK/9HvKMStDpjIm0gZX4gEtIJydTFCvbdguPYriaefJ4uo
         VP6N5FsheRnFQ4J1lSJ96F2bWvs2pFJA6RviwP1+6CwexavgwYhemWx3XjKBbvtPbuhe
         1IPAbqxFCYRJqfVLvYfuPME/bK8N/fSCRVDzlviFpA4Bjgk/ghUoYJm689aE/MzNhPHm
         My+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WzIww4WIrEaM+eTHrFbDxJI+0zBlmSmA2sTNyPMQ/3Q=;
        b=JMnh+nG26jKqooLlZAUXPpk8i+uMxP2dxq7FFMAkvEJvqWHZSJsVdrZP9V2N/vIo/m
         GZBhWJ2vHvOpZGahA3w4v08UiWNsG0XosJvxQYclhyT0kolH14fWa2LzBQqI0YLVpl7B
         DZHkmDWf7+7rRp7pg3BPekgLSq1r76bk+7Z2nWhxkPiwSitPr8Wmp9lbGy79UynjuCgi
         VUCtOJGFwncX94HQSIjIezAJgXEjaln9EN91FDWHv8o7YQMlP977ygn/f6+nPxYJr1bG
         forQy7zi++e3PTLpqRVZtE3Lka7SMgNxk+WJoWThrckATR0bR08qtjGzqZ2zyO8obA7P
         2GWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ04PTZKUs9COi1EocdNfPVw6ghe+wpsRp9tdJzva6BE4oCO/zHF
	qund1Tl3pX7xHFi/h6bI6Dw=
X-Google-Smtp-Source: ADFU+vuzdGVlY0YKF89SzT+E0vo/EsqFQ6tTTO2vAVxsoTcoqnBT9ofre8ABNbIu8AJS0aiy8TcJ/g==
X-Received: by 2002:aa7:9790:: with SMTP id o16mr1665165pfp.322.1583945125424;
        Wed, 11 Mar 2020 09:45:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:9e2:: with SMTP id 89ls1363428pjo.2.canary-gmail;
 Wed, 11 Mar 2020 09:45:24 -0700 (PDT)
X-Received: by 2002:a17:902:8213:: with SMTP id x19mr3799755pln.161.1583945124626;
        Wed, 11 Mar 2020 09:45:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583945124; cv=none;
        d=google.com; s=arc-20160816;
        b=XZco+jYp0J8NnT2nqC1Dzm9g5QqDe1CLMn2/Oh14RjEUjBppPhyp7ByAv7Fte+8m7Y
         OLFu2oMac8MdU7Zxegv5VwX/HTsaLayOyawTLbUyq/8XTZJ1KKEyPlW/NijVSJNFEnBG
         5Ts/0FukrxhoHkTXx+GZWgGR2kKPc2ykuTdvKTkRmJCD2l8hSUCT5RJ2i6sWH+wZP19Y
         sRZKANyCRT2adD32drZbxyys+blA+REltRrlygCe339f0Im0b1IoybexwudPPLCBi5my
         d45aWzzYOz6zT7NF6295ySSEooUHtZ1e/oIU5PwZuIeK3gwW8Z7HRiInkak2QK5XwesF
         7vXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=HyWuQ7i7Gn7gerJDIE1hCZWf6BkhhSHkT/yUMS7Esg8=;
        b=duggDayre0/TOvrYrNXJ48yVanuSQ+qjnGUkmZMe43e5hL2vMFSeVI9R6ZCTB6GMOn
         3uNRdGceIaSfD/0jZ9aydyQmDnmm+I74gNpNSnR/2vFHUwrYnrR2MrL4HkkLvIXqW0fg
         S6dISQYUIg0i2HIIvjfAcqKZktZMjP1inW2XXa84YPdIrW620E9Z/h2DzKM4DUe75GAS
         w/khOzeOavHAHasbzPdntHTwCFQ9csKap13eh9FPD7dlJkVwW8X/CllsSmd351HbMc3g
         63lCaAnC9t3enNAqFikPPo4l5fijuYUqfY0YVidtA4X+ajDY8/FmbNoirpjExZEf1dJe
         rk3Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=aIOcd7wD;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-13.smtp.github.com (out-13.smtp.github.com. [192.30.254.196])
        by gmr-mx.google.com with ESMTPS id x128si128038pgx.2.2020.03.11.09.45.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Mar 2020 09:45:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) client-ip=192.30.254.196;
Received: from github-lowworker-5fb2734.va3-iad.github.net (github-lowworker-5fb2734.va3-iad.github.net [10.48.19.27])
	by smtp.github.com (Postfix) with ESMTP id 29A5D26172C
	for <jailhouse-dev@googlegroups.com>; Wed, 11 Mar 2020 09:45:23 -0700 (PDT)
Date: Wed, 11 Mar 2020 09:45:22 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/new-cpu-config/000000-649112@github.com>
Subject: [siemens/jailhouse] 2e430e: arm, arm64: Make GICv3 arm64-only
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=aIOcd7wD;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.196 as
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

  Branch: refs/heads/wip/new-cpu-config
  Home:   https://github.com/siemens/jailhouse
  Commit: 2e430e38148352b9acc63d83d15ac6921da6e6d9
      https://github.com/siemens/jailhouse/commit/2e430e38148352b9acc63d83d15ac6921da6e6d9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-10 (Tue, 10 Mar 2020)

  Changed paths:
    M hypervisor/arch/arm-common/Kbuild
    R hypervisor/arch/arm-common/gic-v3.c
    M hypervisor/arch/arm-common/include/asm/gic.h
    R hypervisor/arch/arm-common/include/asm/gic_v3.h
    M hypervisor/arch/arm-common/irqchip.c
    R hypervisor/arch/arm/include/asm/arch_gicv3.h
    M hypervisor/arch/arm/traps.c
    M hypervisor/arch/arm64/Kbuild
    A hypervisor/arch/arm64/gic-v3.c
    R hypervisor/arch/arm64/include/asm/arch_gicv3.h
    A hypervisor/arch/arm64/include/asm/gic_v3.h
    M hypervisor/arch/arm64/traps.c

  Log Message:
  -----------
  arm, arm64: Make GICv3 arm64-only

There is no 32-bit ARM board that we support and that has a GICv3. Very
likely, such a board does not exist and never will. So move the GICv3
support in Jailhouse to arm64, removing no longer needed abstractions.

Rather than stubbing a GICv3 for irqchip_cpu_init, use #ifdef in this
case which is simpler and gives a more accurate error in case someone
configures a v3 for ARM.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fa52f73d979bd0d6ab32ff4bea8c6adac88c789e
      https://github.com/siemens/jailhouse/commit/fa52f73d979bd0d6ab32ff4bea8c6adac88c789e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-10 (Tue, 10 Mar 2020)

  Changed paths:
    M hypervisor/arch/arm-common/control.c
    M hypervisor/arch/arm-common/gic-v2.c
    M hypervisor/arch/arm-common/irqchip.c
    M hypervisor/arch/arm-common/lib.c
    M hypervisor/arch/arm/include/asm/types.h
    M hypervisor/arch/arm64/gic-v3.c
    M hypervisor/arch/arm64/include/asm/types.h
    M hypervisor/arch/x86/apic.c
    M hypervisor/arch/x86/cat.c
    M hypervisor/arch/x86/control.c
    M hypervisor/arch/x86/include/asm/types.h
    M hypervisor/arch/x86/iommu.c
    M hypervisor/control.c
    M hypervisor/include/jailhouse/cell.h
    M hypervisor/include/jailhouse/control.h
    M hypervisor/include/jailhouse/types.h
    M hypervisor/setup.c

  Log Message:
  -----------
  core: Use statically sized cpu sets

Given that we do not face excessive amounts of CPUs so far, are in fact
limited to 254 on x86 e.g., there is no point in the complex bitmap
allocation algorithm used for cpu_set. Introduce a per-arch upper limit
of CPUs (MAX_CPUS) and lay out struct cpu_set accordingly.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 44da5b1faed44a0fd7644ac99b4d0a8b72aea2b8
      https://github.com/siemens/jailhouse/commit/44da5b1faed44a0fd7644ac99b4d0a8b72aea2b8
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-10 (Tue, 10 Mar 2020)

  Changed paths:
    M hypervisor/setup.c

  Log Message:
  -----------
  core: Move cell_init() of root cell from init_early to init_late

This is possible because no one needs the initialization results of
cell_init() early. These results are in more precisely the cpu_set
bitmap and the mmio subsystem setup for the root cell. At the a same
time, cell_init() will later on benefit from having all CPUs
initialized.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d4e1ff6c540354cd5c91130e8ab759915bc52992
      https://github.com/siemens/jailhouse/commit/d4e1ff6c540354cd5c91130e8ab759915bc52992
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-11 (Wed, 11 Mar 2020)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  core: Change CPU configuration to an array of structures

Switch from a bitmap-based way to an array of structures for describing
cell CPUs. This has the advantage that we can decouple Jailhouse from
CPU enumeration of Linux and pass the physical CPUs to the hypervisor.
Furthermore, the structure can be extended later on to associate
configuration information such as cache partitions with a specific CPU.
To avoid breaking the config parser more than needed, 8 bytes are
already reserved in the new structure.

Note that this commit breaks the build in order to break-up the
upcoming changes into smaller logical pieces.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 922e96fb6b686fa3bfda85bcd578f5b5ba71e004
      https://github.com/siemens/jailhouse/commit/922e96fb6b686fa3bfda85bcd578f5b5ba71e004
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-11 (Wed, 11 Mar 2020)

  Changed paths:
    M driver/cell.c
    M driver/main.c
    M driver/main.h
    M driver/sysfs.c

  Log Message:
  -----------
  driver: Convert to new CPU configuration format

The new format requires the driver to identify a CPU by its physical ID
and then pass its index in the config array to the hypervisor, both on
enabling as well as during runtime (status queries).

For that purpose, two per-cpu variables are initialized while enabling
Jailhouse: phys_cpu_id and jailhouse_cpu_id. Those allow to map the
physical and the Jailhouse-logical CPU IDs to the Linux-logical ID.
Where possible, Jailhouse will validate this mapping during setup.

The driver continues to maintain shadow cpumasks for the assigned CPUs
of a cell using Linux IDs so that those masks can be used for iterating
over them on Linux side.

The new configuration format allows the Linux and Jailhouse CPU ordering
to deviate. As this can cause confusion, a warning is issued by the
driver when such a constellation is detected during setup.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 15fd4c59b8228362372eee08ae793db9937fed43
      https://github.com/siemens/jailhouse/commit/15fd4c59b8228362372eee08ae793db9937fed43
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-11 (Wed, 11 Mar 2020)

  Changed paths:
    M hypervisor/arch/arm-common/lib.c
    M hypervisor/arch/arm-common/psci.c
    M hypervisor/arch/arm64/gic-v3.c
    M hypervisor/arch/arm64/paging.c
    M hypervisor/arch/x86/apic.c
    M hypervisor/arch/x86/control.c
    M hypervisor/control.c
    M hypervisor/include/jailhouse/control.h
    M hypervisor/include/jailhouse/percpu.h
    M hypervisor/include/jailhouse/processor.h
    M hypervisor/setup.c

  Log Message:
  -----------
  core: Convert to new CPU configuration format

These are the necessary changes to adapt the hypervisor core to the new
struct-array CPU configuration format.

Some things become easier - cpu_id_valid() is now a simple inline bounds
check, counting CPUs is already done in the config -, some more complex.
An arch-provided cpu_by_phys_processor_id() is now required in order to
map a non-root cell CPU on the logical ID used inside Jailhouse during
cell creation. Jailhouse keeps the bitmap of assigned CPUs per cell in
order to iterate over them without requiring that physical-to-logical
mapping during critical code paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0b1777040ebd26c70fd8e38137cb870d6f83b23f
      https://github.com/siemens/jailhouse/commit/0b1777040ebd26c70fd8e38137cb870d6f83b23f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-11 (Wed, 11 Mar 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py
    M tools/jailhouse-cell-linux
    M tools/jailhouse-config-create
    M tools/jailhouse-hardware-check
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  tools: Convert to new CPU configuration format

This updates the sysfs parser, config generator and other
config-evaluating tools to the new format.

For generating x86 configs, we are parsing /proc/cpuinfo for the initial
APIC ID and use that - in Linux order - to fill out the config template.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c3fe8da9a1b9be40f04e9a4b82d120b3a2b3b773
      https://github.com/siemens/jailhouse/commit/c3fe8da9a1b9be40f04e9a4b82d120b3a2b3b773
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-11 (Wed, 11 Mar 2020)

  Changed paths:
    M configs/x86/apic-demo.c
    M configs/x86/e1000-demo.c
    M configs/x86/f2a88xm-hd3.c
    M configs/x86/imb-a180.c
    M configs/x86/ioapic-demo.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/pci-demo.c
    M configs/x86/qemu-x86.c
    M configs/x86/smp-demo.c
    M configs/x86/tiny-demo.c

  Log Message:
  -----------
  configs: x86: Convert to new CPU configuration format

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c3e7cb0d5f69609fdad85c8f07a55e76d95b5de7
      https://github.com/siemens/jailhouse/commit/c3e7cb0d5f69609fdad85c8f07a55e76d95b5de7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-11 (Wed, 11 Mar 2020)

  Changed paths:
    M configs/arm/bananapi-inmate-demo.c
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/bananapi.c
    M configs/arm/emtrion-rzg1e-inmate-demo.c
    M configs/arm/emtrion-rzg1e-linux-demo.c
    M configs/arm/emtrion-rzg1e.c
    M configs/arm/emtrion-rzg1h-inmate-demo.c
    M configs/arm/emtrion-rzg1h-linux-demo.c
    M configs/arm/emtrion-rzg1h.c
    M configs/arm/emtrion-rzg1m-inmate-demo.c
    M configs/arm/emtrion-rzg1m-linux-demo.c
    M configs/arm/emtrion-rzg1m.c
    M configs/arm/jetson-tk1-inmate-demo.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm/jetson-tk1.c
    M configs/arm/orangepi0-inmate-demo.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c

  Log Message:
  -----------
  configs: arm: Convert to new CPU configuration format

At this chance, move the jetson-tk1-inmate-demo from CPU 3 to 1,
avoiding the overlap with its linux-demo and aligning it with other
systems with 4 or more cores.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b7abab489ba4adcaa4d5f4c07ff6943d48d93978
      https://github.com/siemens/jailhouse/commit/b7abab489ba4adcaa4d5f4c07ff6943d48d93978
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-11 (Wed, 11 Mar 2020)

  Changed paths:
    M configs/arm64/amd-seattle-inmate-demo.c
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/arm64/espressobin-inmate-demo.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/espressobin.c
    M configs/arm64/foundation-v8-inmate-demo.c
    M configs/arm64/foundation-v8-linux-demo.c
    M configs/arm64/foundation-v8.c
    M configs/arm64/hikey-inmate-demo.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/hikey.c
    M configs/arm64/imx8mq-inmate-demo.c
    M configs/arm64/imx8mq.c
    M configs/arm64/jetson-tx1-inmate-demo.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/jetson-tx1.c
    M configs/arm64/jetson-tx2-inmate-demo.c
    M configs/arm64/jetson-tx2.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-am654-idk.c
    M configs/arm64/k3-am654-inmate-demo.c
    M configs/arm64/k3-j721e-evm-inmate-demo.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c
    M configs/arm64/macchiatobin-inmate-demo.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/macchiatobin.c
    M configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
    M configs/arm64/miriac-sbc-ls1046a-linux-demo.c
    M configs/arm64/miriac-sbc-ls1046a.c
    M configs/arm64/pine64-plus-inmate-demo.c
    M configs/arm64/pine64-plus-linux-demo.c
    M configs/arm64/pine64-plus.c
    M configs/arm64/qemu-arm64-inmate-demo.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/rpi4-inmate-demo.c
    M configs/arm64/rpi4-linux-demo.c
    M configs/arm64/rpi4.c
    M configs/arm64/ultra96-inmate-demo.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102-inmate-demo.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c

  Log Message:
  -----------
  configs: arm64: Convert to new CPU configuration format

At this chance, the inmate demo is moved to the second core for
jetson-tx1, miriac, ultra96 and zynqmp-zcu102.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 649112fa4de2de64b64356c3ca2013b76bfcc3fa
      https://github.com/siemens/jailhouse/commit/649112fa4de2de64b64356c3ca2013b76bfcc3fa
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-11 (Wed, 11 Mar 2020)

  Changed paths:
    M hypervisor/control.c
    M hypervisor/include/jailhouse/control.h
    M hypervisor/include/jailhouse/types.h

  Log Message:
  -----------
  core: Optimize parsing of large CPU sets

Currently, the for_each_cpu iterators scan the whole given CPU set
bitwise. Since we use static CPU set sizes, we scan even more bits
needlessly for most workloads. This is particularly relevant for sending
IPIs that go out to set of CPUs.

But the common case of having a small and non-sparse bitmap can easily
be optimized by scanning the lower and upper boundaries once during
setup of the CPU set and then using those limits in for_each_cpu*.

At this chance, reduce the type of the boundaries to unsigned int
because we do not support 4 billion CPUs anyway.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/2e430e381483%5E...649112fa4de2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/new-cpu-config/000000-649112%40github.com.
