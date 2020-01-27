Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBP6FXPYQKGQEFIR2ELQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id 2883014A4B9
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:16:49 +0100 (CET)
Received: by mail-yb1-xb38.google.com with SMTP id q189sf7484787ybg.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:16:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580131008; cv=pass;
        d=google.com; s=arc-20160816;
        b=YSMth/Y4kMygmJH0spMdSeEmF9bwxHa8+tQgGxW9suKzIlJ0lXGB3gGUyUcCt1IPws
         cDG5G7pLL8OmLIUzZZY/anx9Kj7BYoi40wwzHUzI/JYEhTgG1kMEbtXfezWs8qKUTPHQ
         nQmEzkI3BsqpBgSAq0xQguS2/BlhuAJJ0L/devixGt4Kj5pvX06rnrhkgj2N4t8HvIv+
         almb3mEQbRV8k86jW9fqoNqkM2lrhQ0E9kwx1Xg8qHgG9qQS8LFYex8jciDBNl5/nDDy
         TwaWXx8PVGTMHybonQXBEVQjAQ0Ohi3L1P7HhoL8QEAm/QgIMetjYlIoo+dElVWwhNzc
         Jzhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=BminaOQd0SeVC8AdTvbgPmPxlHneWjIxN3Lr6OQ7kYY=;
        b=fexTejWSevYAGvOdyh8ZbmnTGKGYfZf/7MLfEeR7zLIvAPytD4MJCPV+LuLw48YhPc
         GzUjAyCkeoPnVCoj71rJ5djlLIq0Jra0TMtqokmDOgf0wQj9TXUaukKn4OPOCOza2uYi
         g+oWEhu9GcrrlFbl7VmWypY1u5v3TYKaIyDd47d0r3+xB4BQgOOBxCps5v3U6UXBZ997
         bgKEci6+742keMMBwf9xCJoP6hbg+xZ204eht6KhlvtYW/EmIhgkN/ePNdPidJC/grmW
         JJyPLebsgtWlyWDJYsEQEeeQARqI6AjNRMMuka/RJHS6Bjxz0TJCGgNcfUWcmvnWDeRq
         FByA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=JDXyBLX9;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BminaOQd0SeVC8AdTvbgPmPxlHneWjIxN3Lr6OQ7kYY=;
        b=doBqMOvqClX01fSINJx9hgV4Ehftnl9PfFi9lJqSSp5Nq0iyUNFYnVQk9zOcVefUkS
         DAOVOiwifiC7b/ul4RRfjBOSy9I+g0TvkSWuMeBu3gyDMOzU0RO/m0Bw7OSUaIXuapNt
         EPMpxS66gDEgKyIR7aov3Ci3Wj59disVvJ7cY0SApRrXdiBEEd2nkmfhFZyuwayP4Nhn
         1xJbiksG2xHja0uaiwGIgK0+ACRGyWqAUPCdqa5ihj3FrmmIsMGncjN74itpNEY4Srb4
         vf7x3fZfPDzlsEsMSvLsbkbjPPfjmd9LMW8XZoyXrV7ZFT/35keIUsj8WJJ3ih72Lfah
         2pRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BminaOQd0SeVC8AdTvbgPmPxlHneWjIxN3Lr6OQ7kYY=;
        b=p4r6bAgvYNhPJ8O6640vmAmlPmkuI05I5gqKpgefrlnecpREMWhT7ZZP2Bn5cbwbeV
         YZ2pZQZxX8G/pqTrRGIBmahBIc4mCtIxnNJHP4mveU3bEhIDVOYKV8VHnTazgcJ0djzN
         EwGOHWUyqmlXda6KoNATFtTHRGnmAbY4C7lYo4LKMMXUw/tew4tAEBGIOkMsxg4lyN18
         J09y81832fq5iy2P4Ctu1SOKnH+1nTwjrbttCbzceLYt8jn4kyKerRVfsbyKUCaWzrhR
         2S4p9PQDj+4+NjIDeZEG6HSfuqUwZPUjo1jC5USbKlCyj3xwYJfpxmG0sAqElINx1NaD
         7PHQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX8WPPrctZscIXgAte8jx6r+XrYFdEM/y2Xb0QOy1tVQ8lgkKz6
	bVbnezL6xlPcdlThcgxqN8Q=
X-Google-Smtp-Source: APXvYqwKS6emaT2DOknrjyFCIh4bPN4Gw5kGUVGn5CN4Xa2xzbOiwso29W9Vlt2GALUukm4egBu0CQ==
X-Received: by 2002:a25:a0c3:: with SMTP id i3mr12795805ybm.396.1580131007820;
        Mon, 27 Jan 2020 05:16:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:9444:: with SMTP id l65ls1907803ywg.5.gmail; Mon, 27 Jan
 2020 05:16:47 -0800 (PST)
X-Received: by 2002:a81:3844:: with SMTP id f65mr12996292ywa.198.1580131007122;
        Mon, 27 Jan 2020 05:16:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580131007; cv=none;
        d=google.com; s=arc-20160816;
        b=Kk6nrsreeH1WqcSaioUCXwD7H5KbDlz7tPWEc8zbkehHRmhxzXkvSw/a7By7ycBw9g
         3eNlbASU6xCfCQP9OKzKW+SLN0oSES4INp+nEnNneauK6tph7i0L+X1UNicnQNqwQ++O
         MLlP4k0G3cxl6M3h7z+OxJwnoUnYneiIT44n/a8MhvoqF229wSQwAT4iqqONVVcbz9BK
         GY5HXLkLc/Fz/3NyHa2VrFAGIAVOK/ibDt6Tc8LLDjNYVNNwQca9ky3qs3EW12pHT5Y3
         4ChSJqVOwzuVBqlxQehjpUTH+UpdV+UC1XebxQjsggSDTBv4kOMo0+66w0hGHPIMrlty
         pfFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=EjaGw0aEjVTkJ6zo9LU4UhJ10dEMqe9/7+4JwP4DN9I=;
        b=K/zNxDcYAXlb+JkQWjVK8JA5v9pQShy/IM2te53eV18RKZdRNLsclcP4Q1HG76saFk
         lKqwTsA/Oy7En0I3w064bxkMsaX/shxu73u+bXPKGK+UEAkMg9aNzhzGVq7DAK2N8JZJ
         f6No/TRLRdADpus7fBpiP3WhTa506id2kXBZwl9yufaV40Jc1Au4cgquoWH0QLpnwT4+
         CUyShwkEouWm9w4loLuYba4Wj3IHGm7uPvEnuiLqX9duKG/JB25zH74MjR7yoXTJzbC0
         EGZUDlnFAS9rALbN29t+7UhVifTEPgNSSzgtTr3WlFRLpqKFhUjwBc6iQ/zUDY211hm2
         fr0g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=JDXyBLX9;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-28.smtp.github.com (out-28.smtp.github.com. [192.30.252.211])
        by gmr-mx.google.com with ESMTPS id v72si677942ybe.1.2020.01.27.05.16.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:16:47 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) client-ip=192.30.252.211;
Received: from github-lowworker-292e294.va3-iad.github.net (github-lowworker-292e294.va3-iad.github.net [10.48.102.70])
	by smtp.github.com (Postfix) with ESMTP id CF6408C08D1
	for <jailhouse-dev@googlegroups.com>; Mon, 27 Jan 2020 05:16:46 -0800 (PST)
Date: Mon, 27 Jan 2020 05:16:46 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/6a8ab1-c4024b@github.com>
Subject: [siemens/jailhouse] 10b3d4: config: Remove unused
 JAILHOUSE_INVALID_STREAMID
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=JDXyBLX9;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.211 as
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
  Commit: 10b3d473fb1e0938278b01ede8beb7bc881724a3
      https://github.com/siemens/jailhouse/commit/10b3d473fb1e0938278b01ede8beb7bc881724a3
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  config: Remove unused JAILHOUSE_INVALID_STREAMID

Stream IDs are now described as arrays.
We do not need the sentinel JAILHOUSE_INVALID_STREAMID.
Remove this unused define.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4205ef8698680aadc9ecca646f0d58a3dcf1b1ed
      https://github.com/siemens/jailhouse/commit/4205ef8698680aadc9ecca646f0d58a3dcf1b1ed
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu-v3.c

  Log Message:
  -----------
  arm64: smmu-v3: Fix crash in arm_smmuv3_cell_init

arm_smmuv3_cell_init and arm_smmuv3_cell_exit calls iterate over all
iommu_units to process the ones with SMMUV3 type.

After the loop, it unconditionally issues commands with first element
of smmu. This causes Unhandled HYP exception  while enabling jailhouse.
Also, it fails to issue commands on the subsequent SMMU units.

Fix this by issuing the sync command only if the iommu is SMMUV3 type.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 89712d8a4acefb59b319c50b13720d580abe77de
      https://github.com/siemens/jailhouse/commit/89712d8a4acefb59b319c50b13720d580abe77de
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: arm64: k3-j721e-evm: Add SMMUv3 IOMMU in platform_data

J721e has a single ARM System MMU version3 for 2 stage
address translation of DMA requests from different peripherals.
Add this as iommu unit in the k3-j721e root cell configuration.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 05b6322f057a4091be5323e33cec02c129c6006a
      https://github.com/siemens/jailhouse/commit/05b6322f057a4091be5323e33cec02c129c6006a
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M hypervisor/control.c

  Log Message:
  -----------
  core: Update cell_state while destroying the cell

Update the cell_state to SHUT_DOWN as part of the cell_destroy
This will make sure that the memory_unmap calls and unit's
cell_exit calls can see the correct status of the cell.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3fac413f064777bd25972e09f3020aecd1fd070a
      https://github.com/siemens/jailhouse/commit/3fac413f064777bd25972e09f3020aecd1fd070a
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M configs/x86/f2a88xm-hd3.c
    M hypervisor/arch/x86/amd_iommu.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  configs: Move amd specific fields in separate struct

Create a union for all vendor specific fields and move the
amd specific fields in separate struct.
Also update the amd unit references of these fields.

This is to handle multiple iommu devices and their custom fields
separately.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: adjusted f2a88xm-hd3.c to new format]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ce9a667714d92711b7950d32b8c68dc68088a72e
      https://github.com/siemens/jailhouse/commit/ce9a667714d92711b7950d32b8c68dc68088a72e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/Kbuild
    R hypervisor/arch/arm-common/iommu.c
    M hypervisor/arch/arm/Kbuild
    A hypervisor/arch/arm/iommu.c
    M hypervisor/arch/arm64/Kbuild
    A hypervisor/arch/arm64/iommu.c

  Log Message:
  -----------
  arm/arm64: Move iommu.o out of arm-common

There is no IOMMU support for 32-bit arm, and it's likely to now show up
there anymore. Make the iommu binding module arch-specific so that we
can add calls to the arm64 variant without affecting arm.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1fb0d740f3edcf17ed20302200aa849b12356e3b
      https://github.com/siemens/jailhouse/commit/1fb0d740f3edcf17ed20302200aa849b12356e3b
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/cell.h
    M hypervisor/arch/arm64/Kbuild
    A hypervisor/arch/arm64/include/asm/ti-pvu.h
    M hypervisor/arch/arm64/iommu.c
    A hypervisor/arch/arm64/ti-pvu.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  arm64: ti-pvu: Add support for ti-pvu iommu unit

Add support for Texas Instrument's Peripheral Virtualization Unit
* Define a new IOMMU type and extra fields in the platform_data
* Add new cofig option CONFIG_IOMMU_TI_PVU
* Integrate with the arm iommu support such that multiple types
  of IOMMU can be supported.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: moved into arm64 completely, fixed whitespace warnings, fixed includes]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b9c52578a5c4f6388b5c2a6dae8d09a6fa9d33f7
      https://github.com/siemens/jailhouse/commit/b9c52578a5c4f6388b5c2a6dae8d09a6fa9d33f7
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: arm64: k3-j721e-evm: Add PVU IOMMU devices in platform_data

J721e device has 3 instance of PVU which can be used as IOMMU.
Each PVU has a config region and a TLB region where the memory
mapping information is stored.
Describe these as part of the root cell's platform_data.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8b517289b0e3da45ba72cfbaf94cf4a05b8e2574
      https://github.com/siemens/jailhouse/commit/8b517289b0e3da45ba72cfbaf94cf4a05b8e2574
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: arm64: k3-j721e-evm: Add stream ids for devices behind IOMMU

Add stream_ids for peripherals which are behind IOMMU instances.
PVU and SMMU-V3 sets up memory mapping for all of these contexts
for correct 2nd stage translation.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9eb8608a209b0ab7aa6032fe8dfb38d043d4c1e2
      https://github.com/siemens/jailhouse/commit/9eb8608a209b0ab7aa6032fe8dfb38d043d4c1e2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-14 (Tue, 14 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Unconditionally check ID range

This check should not depend on whether we are adding a peer to link or
starting a new one.

Reported-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4bb52eeca50b9af8280ad570919aea141787d9fc
      https://github.com/siemens/jailhouse/commit/4bb52eeca50b9af8280ad570919aea141787d9fc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-15 (Wed, 15 Jan 2020)

  Changed paths:
    A configs/arm64/dts/inmate-rpi4.dts
    A configs/arm64/rpi4-inmate-demo.c
    A configs/arm64/rpi4-linux-demo.c
    A configs/arm64/rpi4.c

  Log Message:
  -----------
  configs: Add support for Raspberry Pi 4

This adds the system config, an inmate demo and a linux demo with dts
for running Jailhouse on the Raspberry Pi 4. Configs are designed for
the smallest, 1 GB variant. Models with more memory needs adjustments
or have to like like having 1 GB only.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 005fe368e11b27bb20f0ddd47b968ca9b5235c00
      https://github.com/siemens/jailhouse/commit/005fe368e11b27bb20f0ddd47b968ca9b5235c00
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-15 (Wed, 15 Jan 2020)

  Changed paths:
    M inmates/lib/arm-common/pci.c

  Log Message:
  -----------
  inmates: arm-common: Fix indention

Use tab instead of spaces.

Reported-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7cffb9b7d54dd3466b320f5467bd39110b35ac61
      https://github.com/siemens/jailhouse/commit/7cffb9b7d54dd3466b320f5467bd39110b35ac61
  Author: Chase Conklin <chase.conklin@arm.com>
  Date:   2020-01-15 (Wed, 15 Jan 2020)

  Changed paths:
    M hypervisor/paging.c

  Log Message:
  -----------
  core: fix hugepage splitting in paging_destroy

When unmapping pages, it is not sufficient to compare the size of the
page to the size of the region to be unmapped to know whether a
hugepage needs to be split. That approach does not split hugepages
when the region to be unmapped is larger than a hugepage but does not
cover the entire hugepage, resulting in areas outside the region to be
unmapped and leaving areas inside the region mapped.

Instead of comparing the size of the region to the size of the page,
check if the region overlaps only part of the page and split the
hugepage if it does.

Fixes: 1f7784032531 ("core: Add support for creating page tables with hugepages")
Signed-off-by: Chase Conklin <chase.conklin@arm.com>
[Jan: reduced by two local variables]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cf0d156663a49d33f9047e4b7b942a10b3fc3ba0
      https://github.com/siemens/jailhouse/commit/cf0d156663a49d33f9047e4b7b942a10b3fc3ba0
  Author: Chase Conklin <chase.conklin@arm.com>
  Date:   2020-01-15 (Wed, 15 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v3.c

  Log Message:
  -----------
  arm-common: gic-v3: ensure LR writes are visible

The GICv3 architecture does not guarantee that writes to the list
registers are self-synchronizing. As a result, it is possible for a
valid interrupt to be written into a list register but have the empty
list register status register report that list register as not holding
a valid interrupt. Since the empty list register status registers are
used to indicate which list registers can be used to inject an
interrupt to a cell, it is possible for a valid list register entry to
be overwritten, dropping the corresponding interrupt.

Fixes: 2ce9d14ca4e2 ("arm: GICv3 initialisation")
Signed-off-by: Chase Conklin <chase.conklin@arm.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f2706433efea646a7357cc399de9b24be6253a4a
      https://github.com/siemens/jailhouse/commit/f2706433efea646a7357cc399de9b24be6253a4a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-16 (Thu, 16 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm64/ti-pvu.c

  Log Message:
  -----------
  arm64: Fix initialized return value in pvu_iommu_config_commit

This is relevant in case there are no stream IDs in a cell config. Found
by Coverity.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c4024b68d0d17f6cf6d55a0b61845511ed19e6f7
      https://github.com/siemens/jailhouse/commit/c4024b68d0d17f6cf6d55a0b61845511ed19e6f7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-19 (Sun, 19 Jan 2020)

  Changed paths:
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  tools: config-create: Adjust template to latest changes

This was forgotten in 3fac413f0647.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/6a8ab13d6f2b...c4024b68d0d1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/6a8ab1-c4024b%40github.com.
