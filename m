Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB5UVQDYQKGQEWKZ3WAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3e.google.com (mail-io1-xd3e.google.com [IPv6:2607:f8b0:4864:20::d3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C75913D4CB
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 08:04:24 +0100 (CET)
Received: by mail-io1-xd3e.google.com with SMTP id e15sf12080904ioh.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 23:04:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579158263; cv=pass;
        d=google.com; s=arc-20160816;
        b=iqW/edmlreKdqWK1uGKf6Wp7uEzJu4igTmuk1KE9N+ytkIMUSFD4EagbBwjW23j1Hf
         a7b+2ZQ3GMLXSEjln+6F1d8XM5HeRwZVhbMso+Va6CJcjb8UiqrgI4zoEStsM8MN3txd
         UwfK+SxeLdFCHvs1YEoF4lG4exHc5L2ZPsf34Tu5DQwyQEWP5jqHknOm8xvgOmY1xXNs
         3AsHyVVu6D6Gf0/MOONRq8yZp/ZRB//2MTdtQ292r4i39mVI331CfXWkCjDaRe0kgV4B
         mZv53VwfqxZxhvTpaHc8BUTVpar5eFev9tdK4L7o2601WJRVOzK/z4ue6LXcx2s9maqO
         GgOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=+wczJ/XTDP1MqEqy5snIURhNd0unXCI1bvLiVnB1s5o=;
        b=jFiBGrHH51UCMunrjQs/5ZwaA0pZd7WL/efqhmbDnHPedb0R0uXqYGH1J7iSc6udZZ
         jzWRrGzi5HIicQDBbwdh/c4u27cRFrFPvpWAKXVypGinN+c5Aq3mCXDd6AI0SjtDAOTs
         asRmM0e5xahA7qaAgcjDWfDOgXsYdC7PGifNKOw37LjzoE2QbD9Y9zN0BKbwEzOVYLBn
         PwUnl1T+fkHly7/UcjNUzxfqSXe+UxFPT4H7jH9Nj1xAJ+8soHVzZ8dr0zWky/UGUrHU
         ZGCgeHNmt8/TvaphsooivSHyn5MKD4d1qOnMJcUPF0yAww8R+7s/0lAuhKAddw15CGiv
         yw+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=uEj9PJsc;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+wczJ/XTDP1MqEqy5snIURhNd0unXCI1bvLiVnB1s5o=;
        b=DSHgbjODc7ruJ+inaXtwnbqXs1NESLtdo5joE5RWsjuR+lRt9jzhwYwa7RuEdbiV9S
         dSoJ1TxOJAXz6yRKgS0EmTgNsgh2CtUtyCfh8LORgIedgCVHlmhWgEqFchMUXT7AZEEX
         1DqNxMYlGozIF2uTPgpm/ZLnKRrjjSCxCgI7zfLyHraK//I9bwzRXOGAJbTYxDUsPpaH
         axksDeiq6V/1iwZPablfYD/GVAbgZRUu4l0XnyHiOhrY7X9qFo0CqgK6/pV/IjeFvRTw
         ibej7iLcy+lnT66KFkHdaQhsIzS7dQIMPftaZAqsstx1eHjulvZcIjspACi+Xjvb2Ifh
         2X8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+wczJ/XTDP1MqEqy5snIURhNd0unXCI1bvLiVnB1s5o=;
        b=UFNjpvp9Qycl7asTMldVjvi9QgGajV0Vy5nOdpAF93QFpytYHJwEyfUZYpWGESm4B8
         3c4oJvlioco7e5SjKUnD5Mt4TPdbGy4RrO3Uc41I7z44WMgC7l2oEsQ2eaT9PPeWlm97
         P6BeEuvy1we0vVTOiWIvQKEdKUly61GlvvRlZ37k8a4zQ+DcxKXceZbc64n4kZc3FQqZ
         G9pXHW2ciak4HweVdGGJ2uzZ6lET0Iy6urbXTAnQJWRBSJRSOehzrTHHq4cvNBVX7op4
         7lZACPwQL9UWAGk4yu3lqSTQ9i9Rv+3omRE8NLJyNfT3zxtK1U0jMGNvoqFPJpHl/5Hu
         EUUw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWjlVUU2ZoBjsPk2L3tQRhn8qQ1zkBl6SBgOGT0NCVkEVA4AMEI
	Q1O3aMsyKtsRXWQpxgFIWL0=
X-Google-Smtp-Source: APXvYqzYkca8gRKJazbPPATXTZ/Pi1YxYSMWeh8IeC4TF5zm79Etof1Dp1SqgqM3SjLBPJXzbfg1jg==
X-Received: by 2002:a6b:6e18:: with SMTP id d24mr25770748ioh.301.1579158263044;
        Wed, 15 Jan 2020 23:04:23 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:ba5b:: with SMTP id o88ls3811952ili.2.gmail; Wed, 15 Jan
 2020 23:04:22 -0800 (PST)
X-Received: by 2002:a92:b11:: with SMTP id b17mr2255217ilf.202.1579158262310;
        Wed, 15 Jan 2020 23:04:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579158262; cv=none;
        d=google.com; s=arc-20160816;
        b=0htl4Ppvd5rMwGgdR40wMK9bi9yfVCLZCJeQ6FUYnqk8B+/lq2XyIwuoALs8r/1QmM
         R7lweNDIgYGkTPEQOLWbTFTzujmBsfVVcreZiZrOt+AbnoaaVkFb9nwdXrSnvXDhLyfu
         gsSBJ9Ybuw03TxTkfJrggvIokGjXc/nGPmuNpukLsE2CXOK5FffZ5wSJbKrJ1k75S649
         eHSjP6SJ709qjqexmDQfg9IErlND1NGO58drwHgWxGJB2gDSpmQvkDyw1R3a6l/2OjPx
         csLnInlqSkEGjwkYyw3DqKSFHqYjt1G4XUNomEXV2AYZbH12IUQ5IV9AQlFQvjtKovED
         /KeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=wH84FwtiuIaIXMyGUthJyAdoHMNAEndNInzx5gpQJTM=;
        b=Kejz0dcBVw0FPYXvvF9DHt3pG/pslAcFbC6LWmP/+gnE8/7rfB0pHp639PxQmOK3nW
         6wW2Uin56puce7ERW0Q5l4N7y5Kye6ku0HWcYYf/ZmVq/KS+KzVFxUaec1Bl0Kitjg+k
         g9KjmJ4dK8uUovhWcR7l8fQT5jP/5hC1e+8trxytLQCj38RQtuqy/2DgOC3HGuBb6Kef
         rMbpOBWAOeZs5ZIRxsD8fxKvbS8jJ9jCCN0FINJb3Xkz1SPUpE/5jyuuYMCLJmHuoK/5
         eNXjJVGisY72bpZyQBKVaP/tl4+XfWh0FQTNRsQoOzxdWYmQQDPzm+iMXo0AxgVVnI2q
         SkIA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=uEj9PJsc;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-21.smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id z20si989905ill.5.2020.01.15.23.04.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 23:04:22 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Received: from github-lowworker-275fa97.va3-iad.github.net (github-lowworker-275fa97.va3-iad.github.net [10.48.17.64])
	by smtp.github.com (Postfix) with ESMTP id CE000A0CA0
	for <jailhouse-dev@googlegroups.com>; Wed, 15 Jan 2020 23:04:21 -0800 (PST)
Date: Wed, 15 Jan 2020 23:04:21 -0800
From: chacon01 <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/6a8ab1-cf0d15@github.com>
Subject: [siemens/jailhouse] 10b3d4: config: Remove unused
 JAILHOUSE_INVALID_STREAMID
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=uEj9PJsc;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.204 as
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


Compare: https://github.com/siemens/jailhouse/compare/6a8ab13d6f2b...cf0d156663a4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/6a8ab1-cf0d15%40github.com.
