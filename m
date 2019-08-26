Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBUFHSDVQKGQEOHWXULA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3f.google.com (mail-io1-xd3f.google.com [IPv6:2607:f8b0:4864:20::d3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AF29D4CE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 19:16:02 +0200 (CEST)
Received: by mail-io1-xd3f.google.com with SMTP id a20sf23278806iok.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 10:16:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566839760; cv=pass;
        d=google.com; s=arc-20160816;
        b=fTd51UsG8i+tmRMM6UjArvrEgsr5YvutKoLJUURGn/aKixfyHhG5X3E44IIw0on6xV
         CtYsgQ4y1DZXqKzkkJOzu9Ub/WEpwV5UcoFZHgGUd5CHVvJV1Jnje2h2Kb61DvLCORgY
         wudEAGtP2OGkUbGcglpkCZOykbREMTIM5nAkyA3/6qmz43HbYTUih4Awc9B4pT4jz827
         bUHRbdvD05xet5bAA2M6K+B3qjFhtNQHnM+u2Cfu0lPvLr0IeZWLjt5kmgQGv98oEses
         NczuKiU1/BfvuBAfxJ3vVInqkSSVzuxNNgIlc/BbxnO46RC4Og1C38510AJ7b4lE7Ymn
         CVlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=E/HxOsoFdUC1ZAbhGuVJi+Ko7PJKH6fatAhUmPPxQSI=;
        b=v61YRtWog8YuWEOLB+twxPwLHx9cGYOoPjwjzEQFfCA91o9N9+vhBWnqR8uEnqZQm9
         ifUDdDGTsomNM/rtOwYMg01vrNYVzpJAqb0Q0yzxW+GuYqCTeI4alPn9YDijUuN4ggbW
         bMYmrS1ooEN9wyWlx+pVRG85CVdBMkB+H6kSqHOovfK1QV5u+RRhkegULis+Cgkf7NLP
         ZWbtUc3joC4i3bc5TTZi2z0ns6t5sQgG17w1XWa5xOayL25J+Dph/sNkEWeiU9j0ZEmH
         bHoPWvfkqbCjm1WjK3W1Q2vm6hw8/6erJAQVYBT7TKTADgxj68JGL1k56lgvBPS7JIOW
         lLbA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=oG5NKj4H;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=E/HxOsoFdUC1ZAbhGuVJi+Ko7PJKH6fatAhUmPPxQSI=;
        b=soq4TJ0qZfdOaY0uMnTPLYViJlupZu4Zniw8JUlD7tmsEHeYH3P0VCMHpJnW5HncCC
         F8oi45YmxxZVNsFmgmhrVidAq+355nK0tseVaok+vvlOJ/9gq3YJvmbFqtP7N5xQsLz+
         aVyQLkaA3A/XS0QJSnPUedQ4uqCgQSHl1vKfYyMs07tzKYkxXg6TNL1AN4bVTbCwmFOG
         jFbXUNchn2xWhkl9LbzHvSdwPtiWAYv1zPI3RD/Vzhy5Ti8EnxpdcL5aaZ0wwc00UsiN
         Mt1NvTJAMJ4ct7YKLoTe5PH+qDdJmXhjKb6IGv7GYjWeCLYDZ8s2wKXznk2culwmRTMz
         iFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=E/HxOsoFdUC1ZAbhGuVJi+Ko7PJKH6fatAhUmPPxQSI=;
        b=MV2W6mdzNvnjdrJ93+/YBicotjFBzKSTS+nsAhiXbFyU2x7/i+z5C3+n9zFW5DxAJ1
         2EwPkdvywqlqOSvhxjvYpl+pOfHIr/D6/UHa4Yo4C2YdlocIBNGRiqIqN6vyi5Vv4CTv
         GDiEB/BbIqAP4/qLvmlio2j2nAHm3JpOA3xgkEdxxehCYAqL9J9CEmdhlvwe3rN9hl5K
         fJDEB7uOa9zNEGnCb7ZeLoQWEEFAr1sQS71gnx6/pdb+a4HXSFQgua7VNGB2u71VghkV
         XYpkkA6DIRW1XO0cj8pLhjD3o9SxzNvaodEtOl/U0hpOkmiZCJLCqA1MjKNpatVcNqDF
         7x1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXr7muD3+Mid1OTdkSAmJrrlR+bq6qtdOn4C0nOi8T3YvWwhemB
	Wc1qzzG1eRblPPA5IMue8Ho=
X-Google-Smtp-Source: APXvYqzbH20Z+OZqtlda/ZehsmtoLVMHSZ71DX2DoXEzP2mPW285e2SSzj5qvI8bqNgZTcmUdlg39g==
X-Received: by 2002:a6b:4011:: with SMTP id k17mr6551894ioa.288.1566839760752;
        Mon, 26 Aug 2019 10:16:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a02:3b22:: with SMTP id c34ls2145606jaa.12.gmail; Mon, 26
 Aug 2019 10:15:59 -0700 (PDT)
X-Received: by 2002:a02:c6b7:: with SMTP id o23mr9404432jan.48.1566839759868;
        Mon, 26 Aug 2019 10:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566839759; cv=none;
        d=google.com; s=arc-20160816;
        b=uvBc+kVxoBdMKzk386BRkJwRTWBaWXt8JKB9bONwGvv64XmsvWgKpAD/Ekw84iBXdw
         3Y3lptaBz0ZKPjBJyCL3NOJrXMkPZ3lX9DSDOGGKNtdYxLg4tG5y3sEwl9RwSogBcoUg
         EJ5pW2hZvSxNQoN04ZiNZKGsVK8lAURnBZfOxldX5pESb9vTGobjLxk/7Ny8+HqLqxuX
         933GLgvSTo/Lv9WSlxoREjNAEeLDqxTE5qDP0UOQJu0nXpFGnF4ey8oO8ZWUqZT4QbOa
         NVP8H1TBrCGW8O5OkzEngV32scrWo2cIXV7wI2gekHNvA0spjtKqfNUtPaGRbIQ7dCeP
         ilJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=dhh12ITYeoUzSgUkenhFcAJp1eM4Q5BEGdN/vL0rqJM=;
        b=anToDzDZW209Nw+nF5Kkc6FFNpA0gHDQpQU0aPBlrZ9oZNeXTxPWzSwpSvOFsYWgNx
         WUCVK/VcJYrJj0UAXgbAxiiIqr6IZz0gGcyYYIrWzz3lm7lVqds05gbjcStbqD0c756g
         VE4ohpi87U1WFnUu9bKmfiuogbUc80klHoqpBkodaaJ72tsgIxuQ5F78oA3PxkBCqc2u
         9oU78K8/k3rVvhZcsqSFzQZYv1stlsn9liaSbybOXaMxoH3hpq4rKEVwY9B0AIIYjjaL
         uGyCGzJs3l4/nYkAf0oNLTsRVuHtt/dI5K1fJbqCozFkD8WUkyFf/PpGO8FetQTNfqYT
         LFcQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=oG5NKj4H;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-7.smtp.github.com (out-7.smtp.github.com. [192.30.252.198])
        by gmr-mx.google.com with ESMTPS id i4si647386ioe.3.2019.08.26.10.15.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 10:15:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) client-ip=192.30.252.198;
Date: Mon, 26 Aug 2019 10:15:59 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/55de04-8e77d6@github.com>
Subject: [siemens/jailhouse] 07baf3: iommu: x86: Generalize iommu definition
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=oG5NKj4H;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.198 as
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
  Commit: 07baf39e3b66f1d92805e79b6a494365267b6636
      https://github.com/siemens/jailhouse/commit/07baf39e3b66f1d92805e79b6a494365267b6636
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2019-08-11 (Sun, 11 Aug 2019)

  Changed paths:
    M configs/x86/f2a88xm-hd3.c
    M configs/x86/qemu-x86.c
    M hypervisor/arch/x86/amd_iommu.c
    M hypervisor/arch/x86/vtd.c
    M include/jailhouse/cell-config.h
    M pyjailhouse/sysfs_parser.py
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  iommu: x86: Generalize iommu definition

Right now, jailhouse only supports iommu for x86.
Generalize the data structures to support iommus of different types

Assumption is that each jailhouse_system can define iommu
instances of different types. Extend the jailhouse_iommu
to add type info.

Update the x86 config files to reflect updated data the new type field.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[p-yadav1@ti.com: Add Intel IOMMU and fix compiler errors for AMD and VT-D]
Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 52a995b2b19b028ad3a13df48e345f58f49648d2
      https://github.com/siemens/jailhouse/commit/52a995b2b19b028ad3a13df48e345f58f49648d2
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2019-08-24 (Sat, 24 Aug 2019)

  Changed paths:
    M hypervisor/arch/arm-common/Kbuild
    M hypervisor/arch/arm-common/control.c
    A hypervisor/arch/arm-common/include/asm/iommu.h
    A hypervisor/arch/arm-common/iommu.c
    M hypervisor/arch/arm-common/mmu_cell.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  arm-common: Introduce iommu functionality

Add the iommu hooks for ARM and ARM64 architectures with
dummy implementations and update the Kbuild to include new iommu files

Introduce following hooks:
iommu_map_memory - Setup iommu mapping for the memory region
iommu_unmap_memory - Unmap the iommu mapping for the mem region
iommu_config_commit - Commit all the changes to the mem mapping

Call the map/unmap iommu functions in addition to CPU map/unmap and
config_commit.
Also add iommu_units in the platform data for ARM cells.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
[Jan: removed bogus jailhouse/config.h includes]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0f2d9d3c8cda68b1ba29b1812c485f15854fdf7d
      https://github.com/siemens/jailhouse/commit/0f2d9d3c8cda68b1ba29b1812c485f15854fdf7d
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2019-08-24 (Sat, 24 Aug 2019)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/iommu.h
    M include/jailhouse/cell-config.h
    M tools/jailhouse-cell-linux
    M tools/jailhouse-hardware-check

  Log Message:
  -----------
  core: Add stream id list in the cell config

When ARM IOMMU drivers are supported, it will setup the IO address
translation tables unique for each DMA context in the system.

A typical DMA context is identified by an integer called stream id.
To setup the correct IOMMU mapping, hypervisor should know
list of all the streamIDs that should be setup in the IOMMU.

Add an array of stream IDs in the cell config, bump up the config revision.
Change the python struct unpacking logic in the tools to reflect
revised config structure.

While at it, tell struct.calcsize to not use padding for size calculation.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[p-yadav1@ti.com: Make the stream_ids array resizeable]
Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e194da32533d99e8bf4cad860b562d57f91a239d
      https://github.com/siemens/jailhouse/commit/e194da32533d99e8bf4cad860b562d57f91a239d
  Author: Lokesh Vutla' via Jailhouse <jailhouse-dev@googlegroups.com>
  Date:   2019-08-24 (Sat, 24 Aug 2019)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  arm64: iommu: smmu-v3: Add support for smmu v3 configuration from config files

Add SMMU v3 type to jailhouse_iommu_type.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 458f7d0a6bdf3fc66e94fe09ff5fb2ab3e2c6c5f
      https://github.com/siemens/jailhouse/commit/458f7d0a6bdf3fc66e94fe09ff5fb2ab3e2c6c5f
  Author: Pratyush Yadav <p-yadav1@ti.com>
  Date:   2019-08-24 (Sat, 24 Aug 2019)

  Changed paths:
    M hypervisor/arch/arm64/Kbuild
    A hypervisor/arch/arm64/smmu-v3.c

  Log Message:
  -----------
  arm64: iommu: smmu-v3: Add data structure initialization and stage 2 for SMMUv3

A System Memory Management Unit(SMMU) performs a task analogous to a
CPU's MMU, translating addresses for device requests from system I/O
devices before the requests are passed into the system interconnect.

Implement a driver for SMMU v3 that maps and unmaps memory for specified
stream ids.

The guest cells are assigned stream IDs in their configs and only those
assigned stream IDs can be used by the cells. There is no checking in
place to make sure two cells do not use the same stream IDs. This must
be taken care of when creating the cell configs.

This driver is implemented based on the following assumptions:
- Running on a Little endian 64 bit core compatible with ARM v8
  architecture.
- SMMU supporting only AARCH64 mode.
- SMMU AARCH 64 stage 2 translation configurations are compatible with
  ARMv8 VMSA. So re-using the translation tables of CPU for SMMU.

This driver is loosely based on the Linux kernel SMMU v3 driver.

Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
[Jan: dropped comments about SMMU emulation - not present here,
      added iommu_count_units() check to arm_smmuv3_cell_exit]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8e77d610dd4869223a5209c11e4314c2e1d4d334
      https://github.com/siemens/jailhouse/commit/8e77d610dd4869223a5209c11e4314c2e1d4d334
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-24 (Sat, 24 Aug 2019)

  Changed paths:
    M driver/main.c

  Log Message:
  -----------
  driver: Fix backward compatibility of lapic_timer_period symbol

It was not enough to only rename lapic_timer_period back to
lapic_timer_frequency for older kernels. First, our macro
RESOLVE_EXTERNAL_SYMBOL was not prepared to be provided a macro as well
and was still using the untranslated 5.3-name. And if we do not want to
break up that macro, we need to map lapic_timer_period_sym as well.

Reported-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Fixes: e7674ea7425f ("driver: Account for renaming of lapic_timer_frequency in 5.3")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/55de0454d880...8e77d610dd48

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/55de04-8e77d6%40github.com.
