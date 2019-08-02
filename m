Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBIHCSHVAKGQEMCKXEEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E107FF74
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Aug 2019 19:21:37 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id e66sf50070319ybe.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Aug 2019 10:21:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564766496; cv=pass;
        d=google.com; s=arc-20160816;
        b=JV2agWT//chB4IL0XifaHno1lHJRkdfjr52vHnm/QG4WJOZwaD5wZ7SO8U9u8BLwrr
         Ln2vmk78q7M9u+ZWt32VNgp0++/RexjRAbGESYL+WCZR76RhszBK+Gu/Mv847/0Vz60k
         9HNygRcOnXL/DWVV7yMjxM6j/WeqW0E6IWlj0xv6IDoVrAluOarPIxgCuBz/DECqG8/q
         HiIe6Ot8SHEI/FQN5pVKIbUctucJZ64K45Kebp5eDvS1cSAf41vXx5NjTk5Lun8lxjYF
         E/grNf1J1m+BrF3rGnfBa+dTbEZliKu//NtxSmthkSPtlo1jpPc9PI8p6RQLCU8v7uO4
         L0/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=CY6ymfO0TLM7n+/7AXuLwP8s4xkXbXwX+YUF12b/7Dg=;
        b=GYA9e7hCR+L/fUVR8DsX1qmiye9FFmA/cpaZEiHRiHpE9wUknwcMkqxfPHaRqn2YE3
         zdKEPB9jhMLQboo5A6a4+CMKbMlYjAYHwlocnbPntGLHqDX+B0mlViI3nxMKf42+7bkF
         KpCSsx0HvZcDkoYcHP6afH6lPLeoA7n7D6Y9nw817LARnBUhnyEz2d9s31Kpnx/Lx8qG
         w17dgrbl8d2Dd67HpTqiXDUtmTnHqSS9njRD0IW3MPSwND7LQS5oLqIJSVpcA70jfYW2
         T6CnW4DtKTxEPfxWuQ9lMMkEjJ7iAxT5499U6VEQzidmErnCLQse6esruUhhIvQmgKas
         xTsQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=pnN4ZsR5;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CY6ymfO0TLM7n+/7AXuLwP8s4xkXbXwX+YUF12b/7Dg=;
        b=DM9JdkZgcxwLlOAZ1HbbN3MlaHKCW6KqR1YY6OgyQrBLtRDG0qFPL6SsvtQmF+7iye
         0hJRAzOZHtdJlsbISo4tSh8wpu3KZvh0JQ1wqCvpf49rAd+L6wmAyFE/ZtwsRQlucegM
         kGjVK2AhvRYXNb044dl0MWsArS3cf36YdoMQ9kHJioDs0OaXSVvW72b4gqFZ5L/CUZbv
         FL+wurOdLvfb31/RUtUid5WHD9Gh+rPei+Lh9pc4+QcJQ1MkIZWrq+kYqKiuv8Y7vKmq
         zAcPDqZRNv8V1lUn0e45HaSUO5oda9FB7XfaVqTefDdNYl90MYOV5S0rEn/1sP1MokHe
         yAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CY6ymfO0TLM7n+/7AXuLwP8s4xkXbXwX+YUF12b/7Dg=;
        b=hafRoGm0AMiBOQkQiZLaKg8sDhPgjrTEnJOkTXXpVIReKDaDYFUU/RQWJLNoFkdxHQ
         pYOnV0wpIacAF7QXImDTZ6F9Yucbcdi7toGqW0sf/LE+JYEd3CgHlr057HAbfGvbkj8p
         XQDju9HeFzudNCWgC5QJqMeHcXhj+tq+g8n3M92UL3gvF7MqTY4GorRGV8pvm+aXZWpy
         yxdlJl/4NtJURGzHRYmvhc3GmM3bGrEjDYQp/hxrgPrGvwdayuScImxbYDjTVqGmCu4P
         gu+kVqscBDoAM97kKPOfS7u0f/eKmwspjq3TeAbTy7dF/AUdB9VumUpC39Ey3qcL9tzv
         JypA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWV+0kr33DKHqkPHGj96HoYHKikU/makLbNVtWYtUCEGKQPOjTX
	5orYx/+Y/CD6mae/DuSv5yk=
X-Google-Smtp-Source: APXvYqxYYLlK2JypzerMCz4+ywEky5ZwlzNTFzA5F7Tcg5TjTJFggAzFcWcFWJ3i/BH50sGpzs8c3w==
X-Received: by 2002:a25:1e45:: with SMTP id e66mr71576269ybe.222.1564766496309;
        Fri, 02 Aug 2019 10:21:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5b:3c8:: with SMTP id t8ls3299134ybp.13.gmail; Fri, 02 Aug
 2019 10:21:35 -0700 (PDT)
X-Received: by 2002:a25:cf86:: with SMTP id f128mr2956414ybg.229.1564766495847;
        Fri, 02 Aug 2019 10:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564766495; cv=none;
        d=google.com; s=arc-20160816;
        b=E7koI+T05e3jVzvmJzjYN+sg5yVlgH5QOvsc0H+sZY/B2iWZyNokbefoCrh5SQqV/L
         vqvoPJb4QACnIEfL5pyGhc0lCqca+Zsjqs7Y0oa1oMSHjIhxUuPVBfY5AmITDi5ig6Y4
         ThnusIEjmYjs9L2u9gvD9f9HHdWoTtanK8Ccy5cjRLKjjRDaXT7Hyk4xkzUzDaqQU9DC
         P22P2pgP+Wfih8dtqXXtIJkWwZoQ8t/rDo+ZnJdbgPdgqS6WD4I3ZgS1wWbtXsIyHNa1
         VKtoElyCbuFp1OA48kH4Yw6j1FkGLYj9ayzVyx9j4vTgsESsKSrusGl6BXSahIG2a3A0
         KiHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=mhGIXYdIejF8JYovT7Ebbkso0kVu/XMk9xJn2czFcKU=;
        b=d4bqaEMpjaJgRPFdVtLgKiMCMZvmqGqiyJBk7fcg5NMNXvEFpNdbGq0rilq6SlMT8H
         YIeRh3h1vPj9Jm3Jg2rd6e7dHdlQ59XuNjz/eNzj2ZGgOsMrsuIDupksSivs+BawDY19
         OF7ojoMP2cWd+miooCk4J501hXZXVuaP1mzzn4XLdJjAA5Xp3ZG3dMYheRsdrRbsHAlV
         DFuXQiTjWO3GTZlf5sjjozG/Vy/YGLaxymYJxJ6lgivXvxHk1mY/+7fQi2GtHqgIA6Iy
         AKTekVjbvva4Cjvy6K93/SrnGa4xk3GskNA1xxPrNrShcCv+nisca3JroVL358wZnFTd
         pUPw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=pnN4ZsR5;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-4.smtp.github.com (out-4.smtp.github.com. [192.30.252.195])
        by gmr-mx.google.com with ESMTPS id r1si4406603ywg.4.2019.08.02.10.21.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 10:21:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) client-ip=192.30.252.195;
Date: Fri, 02 Aug 2019 10:21:35 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/55de04-44bce2@github.com>
Subject: [siemens/jailhouse] ad5b52: iommu: x86: Generalize iommu definition
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=pnN4ZsR5;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.195 as
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
  Commit: ad5b52654ed83c0c46fc8d726a9cf92e354f1312
      https://github.com/siemens/jailhouse/commit/ad5b52654ed83c0c46fc8d726a9cf92e354f1312
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2019-08-02 (Fri, 02 Aug 2019)

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


  Commit: 5b55404c57633cb74982c770305b3af5e886390b
      https://github.com/siemens/jailhouse/commit/5b55404c57633cb74982c770305b3af5e886390b
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2019-08-02 (Fri, 02 Aug 2019)

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
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0b31d4c4404f818b61054ab952fdba23f426b7e5
      https://github.com/siemens/jailhouse/commit/0b31d4c4404f818b61054ab952fdba23f426b7e5
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2019-08-02 (Fri, 02 Aug 2019)

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


  Commit: b6099373870d5f2bf5e08e73c4c9fe8ba8eefc5b
      https://github.com/siemens/jailhouse/commit/b6099373870d5f2bf5e08e73c4c9fe8ba8eefc5b
  Author: Lokesh Vutla <lokeshvutla@ti.com>
  Date:   2019-08-02 (Fri, 02 Aug 2019)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  arm64: iommu: smmu-v3: Add support for smmu v3 configuration from config files

Add SMMU v3 type to jailhouse_iommu_type.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 44bce2ac258540cac351b9a68eb98d2fb1c5ed20
      https://github.com/siemens/jailhouse/commit/44bce2ac258540cac351b9a68eb98d2fb1c5ed20
  Author: Pratyush Yadav <p-yadav1@ti.com>
  Date:   2019-08-02 (Fri, 02 Aug 2019)

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
[Jan: dropped comments about SMMU emulation - not present here]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/55de0454d880...44bce2ac2585

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/55de04-44bce2%40github.com.
