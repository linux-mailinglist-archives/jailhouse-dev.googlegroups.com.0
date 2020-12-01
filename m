Return-Path: <jailhouse-dev+bncBCY4NF5G6YJBBSPWS37AKGQEFQSEATA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73e.google.com (mail-qk1-x73e.google.com [IPv6:2607:f8b0:4864:20::73e])
	by mail.lfdr.de (Postfix) with ESMTPS id 057E32C95ED
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Dec 2020 04:40:59 +0100 (CET)
Received: by mail-qk1-x73e.google.com with SMTP id l7sf280665qkl.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 19:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EASQc41wt199ZsYZJ33GY9Cg60zj9q4jnfH1cLd4hUw=;
        b=WmLtJXvGhoq4U6gW9wp4sitbs/a9goDodYMpqSYoTRIRhKHH8xNOF7WQfVFE6mvG1O
         2BbB3KsAdyogozzOg53m9ck24IHQ6bNssodfzqaF5lk5NUrWjBxnpYSwmnl9/QO2HC69
         xUbc+R+Xyw15SH4HWPv4T4NY62mZITQyjpitwY12g+wLEhMldS4WOqFEk/c2ZxNg2Y+1
         sLznz9Bbai27WUqPRFIztIoaAqr7+cD/mmetZwFfWjyP8mEAvaxU/R31axd+rhqNkC9L
         zhEGwfIYtmoT7f9Vk9YpcVF7qFkq5YJBtWujF+qbl1gqV5rNx7yY9JaIQ7XFkZbhnidY
         PPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=EASQc41wt199ZsYZJ33GY9Cg60zj9q4jnfH1cLd4hUw=;
        b=pYtl1iKRhhZvD9CBDZBQQkjI73MQvGyPuIYZLNgFT3H+CubQVkDzP564qqeKT+ALYH
         1FnOkgyBfikQdcWkSaMunksAq6CUTEWGY2wQMM6QclBI/4F58APLZpWak1NcsDqBn3Sw
         Jb9Io2ne1X2Y30oR51c2XUIjgt4ncQVn/F5IJKz2DvcC7VK0WL/lk0bPyjx9piJ3cqJf
         AZSUB6+VmJpsUVjJj8q3vp13cR0DBuweIcyGufvb2sXZH04AvMBBEIKwmfTwz0VohsuR
         KFxXvZmYrBkCjpokRdjyw/lIuYJSkja7/kyeLXotCmTi7t6j/9kqUN0odQU9MzvacBvN
         JFoQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531OLeZpe0oX7KdBYLhcI9THKGXJIeJXW8+IqveU5262DvC117yx
	RliMNMHk5fFSddBTapcJcDk=
X-Google-Smtp-Source: ABdhPJxOZTIqwrrgD/hx2qiFH/AcNvtrscoY3zsNIf84x1fNutGf9QSrJokKRQEqfXQmxgSN44neKA==
X-Received: by 2002:ac8:5653:: with SMTP id 19mr907481qtt.136.1606794058093;
        Mon, 30 Nov 2020 19:40:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:4b69:: with SMTP id g9ls113399qts.11.gmail; Mon, 30 Nov
 2020 19:40:57 -0800 (PST)
X-Received: by 2002:ac8:53cd:: with SMTP id c13mr860639qtq.107.1606794057493;
        Mon, 30 Nov 2020 19:40:57 -0800 (PST)
Date: Mon, 30 Nov 2020 19:40:56 -0800 (PST)
From: Peter Pan <jiafei.pan@nxp.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0907fe4e-f1bc-4173-b710-172cc308670fn@googlegroups.com>
In-Reply-To: <41e873f3-1eff-a142-a9f1-de08ef22786f@siemens.com>
References: <20201130070515.21504-1-Jiafei.Pan@nxp.com>
 <8a7f2697-3782-61d5-d68d-859e20fa1269@siemens.com>
 <09f76682-1c9d-4ddb-b8ca-3aab01218e47n@googlegroups.com>
 <41e873f3-1eff-a142-a9f1-de08ef22786f@siemens.com>
Subject: Re: [PATCH] configs: add ls1046ardb linux demo
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8782_1715334264.1606794056723"
X-Original-Sender: jiafei.pan@nxp.com
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

------=_Part_8782_1715334264.1606794056723
Content-Type: multipart/alternative; 
	boundary="----=_Part_8783_708258856.1606794056723"

------=_Part_8783_708258856.1606794056723
Content-Type: text/plain; charset="UTF-8"



On Monday, November 30, 2020 at 6:20:37 PM UTC+8 j.kiszka...@gmail.com 
wrote:

> On 30.11.20 08:19, Peter Pan wrote: 
> > 
> > 
> > On Monday, November 30, 2020 at 3:02:12 PM UTC+8 j.kiszka...@gmail.com 
> > wrote: 
> > 
> > On 30.11.20 08:05, Jiafei Pan wrote: 
> > > Add root cell, inmate cell, ivshmem demo cell and Linux demo cell 
> > > configure files for NXP ls1046a RDB platform. 
> > > 
> > > Signed-off-by: Jiafei Pan <Jiafe...@nxp.com> 
> > > --- 
> > > configs/arm64/ls1046a-rdb-inmate-demo.c | 67 +++ 
> > > configs/arm64/ls1046a-rdb-ivshmem-demo.c | 142 +++++++ 
> > > configs/arm64/ls1046a-rdb-linux-demo.c | 165 ++++++++ 
> > > configs/arm64/ls1046a-rdb.c | 517 +++++++++++++++++++++++ 
> > > 4 files changed, 891 insertions(+) 
> > > create mode 100644 configs/arm64/ls1046a-rdb-inmate-demo.c 
> > > create mode 100644 configs/arm64/ls1046a-rdb-ivshmem-demo.c 
> > > create mode 100644 configs/arm64/ls1046a-rdb-linux-demo.c 
> > > create mode 100644 configs/arm64/ls1046a-rdb.c 
> > > 
> > > diff --git a/configs/arm64/ls1046a-rdb-inmate-demo.c 
> > b/configs/arm64/ls1046a-rdb-inmate-demo.c 
> > > new file mode 100644 
> > > index 00000000..0f4f2395 
> > > --- /dev/null 
> > > +++ b/configs/arm64/ls1046a-rdb-inmate-demo.c 
> > > @@ -0,0 +1,67 @@ 
> > > +/* 
> > > + * ls1046a RDB - inmate demo 
> > > + * 
> > > + * Copyright NXP 2020 
> > > + * 
> > > + * Authors: 
> > > + * Jiafei Pan <jiafe...@nxp.com> 
> > > + * 
> > > + * This work is licensed under the terms of the GNU GPL, version 
> > 2. See 
> > > + * the COPYING file in the top-level directory. 
> > > + */ 
> > > + 
> > > +#include <jailhouse/types.h> 
> > > +#include <jailhouse/cell-config.h> 
> > > + 
> > > +struct { 
> > > + struct jailhouse_cell_desc cell; 
> > > + __u64 cpus[1]; 
> > > + struct jailhouse_memory mem_regions[3]; 
> > > +} __attribute__((packed)) config = { 
> > > + .cell = { 
> > > + .signature = JAILHOUSE_CELL_DESC_SIGNATURE, 
> > > + .revision = JAILHOUSE_CONFIG_REVISION, 
> > > + .name = "inmate-demo", 
> > > + .flags = JAILHOUSE_CELL_PASSIVE_COMMREG, 
> > > + 
> > > + .cpu_set_size = sizeof(config.cpus), 
> > > + .num_memory_regions = ARRAY_SIZE(config.mem_regions), 
> > > + .num_irqchips = 0, 
> > > + .num_pci_devices = 0, 
> > > + 
> > > + .console = { 
> > > + .address = 0x21c0600, /* Uart1 in DUART1 */ 
> > > + .divider = 0xbd, /* baudrate: 115200 */ 
> > > + .type = JAILHOUSE_CON_TYPE_8250, 
> > > + .flags = JAILHOUSE_CON_ACCESS_MMIO | 
> > > + JAILHOUSE_CON_REGDIST_1, 
> > > + }, 
> > > + }, 
> > > + 
> > > + .cpus = { 
> > > + 0x8, 
> > > + }, 
> > > + 
> > > + .mem_regions = { 
> > > + /* DUART1 */ { 
> > > + .phys_start = 0x21c0000, 
> > > + .virt_start = 0x21c0000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED, 
> > > + }, 
> > > + /* RAM: Top at 2GB DRAM1 Space */ { 
> > > + .phys_start = 0xc0000000, 
> > > + .virt_start = 0, 
> > > + .size = 0x00010000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE, 
> > > + }, 
> > > + /* communication region */ { 
> > > + .virt_start = 0x80000000, 
> > > + .size = 0x00001000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_COMM_REGION, 
> > > + }, 
> > > + } 
> > > +}; 
> > > diff --git a/configs/arm64/ls1046a-rdb-ivshmem-demo.c 
> > b/configs/arm64/ls1046a-rdb-ivshmem-demo.c 
> > > new file mode 100644 
> > > index 00000000..907ba1f1 
> > > --- /dev/null 
> > > +++ b/configs/arm64/ls1046a-rdb-ivshmem-demo.c 
> > > @@ -0,0 +1,142 @@ 
> > > +/* 
> > > + * ls1046a RDB - ivshmem demo 
> > > + * 
> > > + * Copyright NXP 2020 
> > > + * 
> > > + * Authors: 
> > > + * Jiafei Pan <jiafe...@nxp.com> 
> > > + * 
> > > + * This work is licensed under the terms of the GNU GPL, version 
> > 2. See 
> > > + * the COPYING file in the top-level directory. 
> > > + */ 
> > > + 
> > > +#include <jailhouse/types.h> 
> > > +#include <jailhouse/cell-config.h> 
> > > + 
> > > +struct { 
> > > + struct jailhouse_cell_desc cell; 
> > > + __u64 cpus[1]; 
> > > + struct jailhouse_memory mem_regions[8]; 
> > > + struct jailhouse_irqchip irqchips[2]; 
> > > + struct jailhouse_pci_device pci_devices[1]; 
> > > +} __attribute__((packed)) config = { 
> > > + .cell = { 
> > > + .signature = JAILHOUSE_CELL_DESC_SIGNATURE, 
> > > + .revision = JAILHOUSE_CONFIG_REVISION, 
> > > + .name = "ivshmem-demo", 
> > > + .flags = JAILHOUSE_CELL_PASSIVE_COMMREG, 
> > > + 
> > > + .cpu_set_size = sizeof(config.cpus), 
> > > + .num_memory_regions = ARRAY_SIZE(config.mem_regions), 
> > > + .num_irqchips = ARRAY_SIZE(config.irqchips), 
> > > + .num_pci_devices = ARRAY_SIZE(config.pci_devices), 
> > > + .vpci_irq_base = 60 - 32, /* vPCI INTx */ 
> > > + 
> > > + .console = { 
> > > + .address = 0x21c0600, /* Uart1 in DUART1 */ 
> > > + .divider = 0xbd, /* baudrate: 115200 */ 
> > > + .type = JAILHOUSE_CON_TYPE_8250, 
> > > + .flags = JAILHOUSE_CON_ACCESS_MMIO | 
> > > + JAILHOUSE_CON_REGDIST_1, 
> > > + }, 
> > > + }, 
> > > + 
> > > + .cpus = { 
> > > + 0x8, 
> > > + }, 
> > > + 
> > > + .mem_regions = { 
> > > + /* IVHSMEM shared memory region for 00:00.0 */ { 
> > > + .phys_start = 0xfb700000, 
> > > + .virt_start = 0xfb700000, 
> > > + .size = 0x1000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, 
> > > + }, 
> > > + { 
> > > + .phys_start = 0xfb701000, 
> > > + .virt_start = 0xfb701000, 
> > > + .size = 0x9000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_ROOTSHARED, 
> > > + }, 
> > > + { 
> > > + .phys_start = 0xfb70a000, 
> > > + .virt_start = 0xfb70a000, 
> > > + .size = 0x2000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, 
> > > + }, 
> > > + { 
> > > + .phys_start = 0xfb70c000, 
> > > + .virt_start = 0xfb70c000, 
> > > + .size = 0x2000, 
> > > + //.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_ROOTSHARED, 
> > > + }, 
> > > + { 
> > > + .phys_start = 0xfb70e000, 
> > > + .virt_start = 0xfb70e000, 
> > > + .size = 0x2000, 
> > > + //.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + // JAILHOUSE_MEM_ROOTSHARED, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, 
> > > + }, 
> > > + /* DUART1 */ { 
> > > + .phys_start = 0x21c0000, 
> > > + .virt_start = 0x21c0000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED, 
> > > + }, 
> > > + /* RAM: Top at 4GB Space */ { 
> > > + .phys_start = 0xc0000000, 
> > > + .virt_start = 0, 
> > > + .size = 0x00010000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE, 
> > > + }, 
> > > + /* communication region */ { 
> > > + .virt_start = 0x80000000, 
> > > + .size = 0x00001000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_COMM_REGION, 
> > > + }, 
> > > + }, 
> > > + 
> > > + .irqchips = { 
> > > + /* GIC-400 */ { 
> > > + .address = 0x1410000, 
> > > + .pin_base = 32, 
> > > + .pin_bitmap = { 
> > > + 1 << (60 - 32), /* vPCI */ 
> > > + 0, 
> > > + 0, 
> > > + 0, 
> > > + }, 
> > > + }, 
> > > + /* GIC-400 */ { 
> > > + .address = 0x1410000, 
> > > + .pin_base = 160, 
> > > + .pin_bitmap = { 
> > > + 0, 
> > > + 0, 
> > > + 0, 
> > > + 0, 
> > > + }, 
> > > + }, 
> > > + }, 
> > > + 
> > > + .pci_devices = { 
> > > + { /* IVSHMEM 00:00.0 (demo) */ 
> > > + .type = JAILHOUSE_PCI_TYPE_IVSHMEM, 
> > > + .domain = 0, 
> > > + .bdf = 0 << 3, 
> > > + .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX, 
> > > + .shmem_regions_start = 0, 
> > > + .shmem_dev_id = 1, 
> > > + .shmem_peers = 1, 
> > > + .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED, 
> > > + }, 
> > > + }, 
> > > + 
> > > +}; 
> > > diff --git a/configs/arm64/ls1046a-rdb-linux-demo.c 
> > b/configs/arm64/ls1046a-rdb-linux-demo.c 
> > > new file mode 100644 
> > > index 00000000..c8f699bb 
> > > --- /dev/null 
> > > +++ b/configs/arm64/ls1046a-rdb-linux-demo.c 
> > > @@ -0,0 +1,165 @@ 
> > > +/* 
> > > + * ls1046a RDB target - linux-demo 
> > > + * 
> > > + * Copyright 2020 NXP 
> > > + * 
> > > + * Authors: 
> > > + * Jiafei Pan <jiafe...@nxp.com> 
> > > + * 
> > > + * This work is licensed under the terms of the GNU GPL, version 
> > 2. See 
> > > + * the COPYING file in the top-level directory. 
> > > + */ 
> > > + 
> > > +#include <jailhouse/types.h> 
> > > +#include <jailhouse/cell-config.h> 
> > > + 
> > > +struct { 
> > > + struct jailhouse_cell_desc cell; 
> > > + __u64 cpus[1]; 
> > > + struct jailhouse_memory mem_regions[16]; 
> > > + struct jailhouse_irqchip irqchips[2]; 
> > > + struct jailhouse_pci_device pci_devices[2]; 
> > > +} __attribute__((packed)) config = { 
> > > + .cell = { 
> > > + .signature = JAILHOUSE_CELL_DESC_SIGNATURE, 
> > > + .revision = JAILHOUSE_CONFIG_REVISION, 
> > > + .name = "linux-inmate-demo", 
> > > + .flags = JAILHOUSE_CELL_PASSIVE_COMMREG, 
> > > + 
> > > + .cpu_set_size = sizeof(config.cpus), 
> > > + .num_memory_regions = ARRAY_SIZE(config.mem_regions), 
> > > + .num_irqchips = ARRAY_SIZE(config.irqchips), 
> > > + .num_pci_devices = ARRAY_SIZE(config.pci_devices), 
> > > + .vpci_irq_base = 60 - 32, /* vPCI INTx: 60,61,62,63 */ 
> > > + }, 
> > > + 
> > > + .cpus = { 
> > > + 0xc, 
> > > + }, 
> > > + 
> > > + .mem_regions = { 
> > > + /* IVHSMEM shared memory region for 00:00.0 */ { 
> > > + .phys_start = 0xfb700000, 
> > > + .virt_start = 0xfb700000, 
> > > + .size = 0x1000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, 
> > > + }, 
> > > + { 
> > > + .phys_start = 0xfb701000, 
> > > + .virt_start = 0xfb701000, 
> > > + .size = 0x9000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_ROOTSHARED, 
> > > + }, 
> > > + { 
> > > + .phys_start = 0xfb70a000, 
> > > + .virt_start = 0xfb70a000, 
> > > + .size = 0x2000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, 
> > > + }, 
> > > + { 
> > > + .phys_start = 0xfb70c000, 
> > > + .virt_start = 0xfb70c000, 
> > > + .size = 0x2000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, 
> > > + }, 
> > > + { 
> > > + .phys_start = 0xfb70e000, 
> > > + .virt_start = 0xfb70e000, 
> > > + .size = 0x2000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_ROOTSHARED, 
> > > + }, 
> > > + /* IVSHMEM shared memory regions for 00:01.0 (networking) */ 
> > > + JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 1), 
> > > + /* DUART1 */ { 
> > > + .phys_start = 0x21c0000, 
> > > + .virt_start = 0x21c0000, 
> > > + .size = 0x1000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED, 
> > > + }, 
> > > + /* clockgen */ { 
> > > + .phys_start = 0x01ee1000, 
> > > + .virt_start = 0x01ee1000, 
> > > + .size = 0x1000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED, 
> > > + }, 
> > > + /* dcfg */ { 
> > > + .phys_start = 0x01ee0000, 
> > > + .virt_start = 0x01ee0000, 
> > > + .size = 0x1000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* RAM */ { 
> > > + .phys_start = 0xbf900000, 
> > > + .virt_start = 0, 
> > > + .size = 0x00010000, /* 64K */ 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE, 
> > > + }, 
> > > + /* RAM: Top at DRAM1 2GB Space */ { 
> > > + .phys_start = 0xc0000000, 
> > > + .virt_start = 0xc0000000, 
> > > + .size = 0x3b500000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA | 
> > > + JAILHOUSE_MEM_LOADABLE, 
> > > + }, 
> > > + /* communication region */ { 
> > > + .virt_start = 0x80000000, 
> > > + .size = 0x00001000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_COMM_REGION, 
> > > + }, 
> > > + }, 
> > > + 
> > > + .irqchips = { 
> > > + /* GIC-400 */ { 
> > > + .address = 0x1410000, 
> > > + .pin_base = 32, 
> > > + .pin_bitmap = { 
> > > + 1 << (60 -32) | 1 << (61 - 32) | 
> > > + 1 << (62 - 32) | 1 << (63 -32), /* vPCI */ 
> > > + 0, 
> > > + 0, 
> > > + 0, 
> > > + }, 
> > > + }, 
> > > + /* GIC-400 */ { 
> > > + .address = 0x1410000, 
> > > + .pin_base = 160, 
> > > + .pin_bitmap = { 
> > > + 0, 
> > > + 0, 
> > > + 0, 
> > > + 0, 
> > > + }, 
> > > + }, 
> > > + }, 
> > > + 
> > > + .pci_devices = { 
> > > + { /* IVSHMEM 00:00.0 (demo) */ 
> > > + .type = JAILHOUSE_PCI_TYPE_IVSHMEM, 
> > > + .domain = 0, 
> > > + .bdf = 0 << 3, 
> > > + .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX, 
> > > + .shmem_regions_start = 0, 
> > > + .shmem_dev_id = 2, 
> > > + .shmem_peers = 3, 
> > > + .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED, 
> > > + }, 
> > > + { /* IVSHMEM 00:01.0 (networking) */ 
> > > + .type = JAILHOUSE_PCI_TYPE_IVSHMEM, 
> > > + .domain = 0, 
> > > + .bdf = 1 << 3, 
> > > + .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX, 
> > > + .shmem_regions_start = 5, 
> > > + .shmem_dev_id = 1, 
> > > + .shmem_peers = 2, 
> > > + .shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH, 
> > > + }, 
> > > + }, 
> > > +}; 
> > > diff --git a/configs/arm64/ls1046a-rdb.c 
> > b/configs/arm64/ls1046a-rdb.c 
> > > new file mode 100644 
> > > index 00000000..3eb58005 
> > > --- /dev/null 
> > > +++ b/configs/arm64/ls1046a-rdb.c 
> > > @@ -0,0 +1,517 @@ 
> > > +/* 
> > > + * ls1046a RDB target - linux-demo 
> > > + * 
> > > + * Copyright 2020 NXP 
> > > + * 
> > > + * Authors: 
> > > + * Jiafei Pan <jiafe...@nxp.com> 
> > > + * 
> > > + * This work is licensed under the terms of the GNU GPL, version 
> > 2. See 
> > > + * the COPYING file in the top-level directory. 
> > > + */ 
> > > + 
> > > +#include <jailhouse/types.h> 
> > > +#include <jailhouse/cell-config.h> 
> > > + 
> > > +struct { 
> > > + struct jailhouse_system header; 
> > > + __u64 cpus[1]; 
> > > + struct jailhouse_memory mem_regions[64]; 
> > > + struct jailhouse_irqchip irqchips[2]; 
> > > + struct jailhouse_pci_device pci_devices[2]; 
> > > +} __attribute__((packed)) config = { 
> > > + .header = { 
> > > + .signature = JAILHOUSE_SYSTEM_SIGNATURE, 
> > > + .revision = JAILHOUSE_CONFIG_REVISION, 
> > > + .flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE, 
> > > + .hypervisor_memory = { 
> > > + .phys_start = 0xfba00000, 
> > > + .size = 0x00400000, 
> > > + }, 
> > > + .debug_console = { 
> > > + .address = 0x21c0500, /* Uart0 in DUART1 */ 
> > > + .size = 0x100, 
> > > + .type = JAILHOUSE_CON_TYPE_8250, 
> > > + .flags = JAILHOUSE_CON_ACCESS_MMIO | 
> > > + JAILHOUSE_CON_REGDIST_1, 
> > > + }, 
> > > + .platform_info = { 
> > > + .pci_mmconfig_base = 0xfb500000, 
> > > + .pci_mmconfig_end_bus = 0, 
> > > + .pci_is_virtual = 1, 
> > > + .pci_domain = -1, 
> > > + 
> > > + .arm = { 
> > > + .gic_version = 2, 
> > > + .gicd_base = 0x1410000, 
> > > + .gicc_base = 0x142f000, 
> > > + .gich_base = 0x1440000, 
> > > + .gicv_base = 0x146f000, 
> > > + .maintenance_irq = 25, 
> > > + }, 
> > > + }, 
> > > + .root_cell = { 
> > > + .name = "ls1046a", 
> > > + .num_pci_devices = ARRAY_SIZE(config.pci_devices), 
> > > + .cpu_set_size = sizeof(config.cpus), 
> > > + .num_memory_regions = ARRAY_SIZE(config.mem_regions), 
> > > + .num_irqchips = ARRAY_SIZE(config.irqchips), 
> > > + .vpci_irq_base = 67 - 32, /* Not include 32 base */ 
> > > + }, 
> > > + }, 
> > > + 
> > > + .cpus = { 
> > > + 0xf, 
> > > + }, 
> > > + 
> > > + .mem_regions = { 
> > > + /* IVHSMEM shared memory region for 00:00.0 */ { 
> > > + .phys_start = 0xfb700000, 
> > > + .virt_start = 0xfb700000, 
> > > + .size = 0x1000, 
> > > + .flags = JAILHOUSE_MEM_READ, 
> > > + }, 
> > > + { 
> > > + .phys_start = 0xfb701000, 
> > > + .virt_start = 0xfb701000, 
> > > + .size = 0x9000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, 
> > > + }, 
> > > + { 
> > > + .phys_start = 0xfb70a000, 
> > > + .virt_start = 0xfb70a000, 
> > > + .size = 0x2000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, 
> > > + }, 
> > > + { 
> > > + .phys_start = 0xfb70c000, 
> > > + .virt_start = 0xfb70c000, 
> > > + .size = 0x2000, 
> > > + .flags = JAILHOUSE_MEM_READ, 
> > > + }, 
> > > + { 
> > > + .phys_start = 0xfb70e000, 
> > > + .virt_start = 0xfb70e000, 
> > > + .size = 0x2000, 
> > > + .flags = JAILHOUSE_MEM_READ, 
> > > + }, 
> > > + /* IVSHMEM shared memory regions for 00:01.0 (networking) */ 
> > > + JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 0), 
> > > + /* RAM - 1GB at DRAM1 region - root cell */ { 
> > > + .phys_start = 0x80000000, 
> > > + .virt_start = 0x80000000, 
> > > + .size = 0x40000000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_EXECUTE, 
> > > + }, 
> > > + /* DRAM2 6GB */ { 
> > > + .phys_start = 0x880000000, 
> > > + .virt_start = 0x880000000, 
> > > + .size = 0x180000000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_EXECUTE, 
> > > + }, 
> > > + /* RAM: Inmate */ { 
> > > + .phys_start = 0xc0000000, 
> > > + .virt_start = 0xc0000000, 
> > > + .size = 0x3b500000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_EXECUTE, 
> > > + }, 
> > > + /* RAM: loader */ { 
> > > + .phys_start = 0xbf900000, 
> > > + .virt_start = 0xbf900000, 
> > > + .size = 0x00100000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_EXECUTE, 
> > > + }, 
> > > + /* DDR memory controller */ { 
> > > + .phys_start = 0x01080000, 
> > > + .virt_start = 0x01080000, 
> > > + .size = 0x1000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* IFC */ { 
> > > + .phys_start = 0x01530000, 
> > > + .virt_start = 0x01530000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* QSPI */ { 
> > > + .phys_start = 0x01550000, 
> > > + .virt_start = 0x01550000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* esdhc */ { 
> > > + .phys_start = 0x01560000, 
> > > + .virt_start = 0x01560000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* scfg */ { 
> > > + .phys_start = 0x01570000, 
> > > + .virt_start = 0x01570000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* crypto */ { 
> > > + .phys_start = 0x01700000, 
> > > + .virt_start = 0x01700000, 
> > > + .size = 0x100000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* qman */ { 
> > > + .phys_start = 0x01880000, 
> > > + .virt_start = 0x01880000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* bman */ { 
> > > + .phys_start = 0x01890000, 
> > > + .virt_start = 0x01890000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* fman */ { 
> > > + .phys_start = 0x01a00000, 
> > > + .virt_start = 0x01a00000, 
> > > + .size = 0x100000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* qportals CE */ { 
> > > + .phys_start = 0x500000000, 
> > > + .virt_start = 0x500000000, 
> > > + .size = 0x4000000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, 
> > > + }, 
> > > + /* qportals CI */ { 
> > > + .phys_start = 0x504000000, 
> > > + .virt_start = 0x504000000, 
> > > + .size = 0x4000000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* bportals CE */ { 
> > > + .phys_start = 0x508000000, 
> > > + .virt_start = 0x508000000, 
> > > + .size = 0x4000000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, 
> > > + }, 
> > > + /* bportals CI */ { 
> > > + .phys_start = 0x50c000000, 
> > > + .virt_start = 0x50c000000, 
> > > + .size = 0x4000000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* dcfg */ { 
> > > + .phys_start = 0x01ee0000, 
> > > + .virt_start = 0x01ee0000, 
> > > + .size = 0x1000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* clockgen */ { 
> > > + .phys_start = 0x01ee1000, 
> > > + .virt_start = 0x01ee1000, 
> > > + .size = 0x1000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* rcpm */ { 
> > > + .phys_start = 0x01ee2000, 
> > > + .virt_start = 0x01ee2000, 
> > > + .size = 0x1000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* tmu */ { 
> > > + .phys_start = 0x01f00000, 
> > > + .virt_start = 0x01f00000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* dspi */ { 
> > > + .phys_start = 0x02100000, 
> > > + .virt_start = 0x02100000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* i2c0 */ { 
> > > + .phys_start = 0x02180000, 
> > > + .virt_start = 0x02180000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* i2c1 */ { 
> > > + .phys_start = 0x02190000, 
> > > + .virt_start = 0x02190000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* i2c2 */ { 
> > > + .phys_start = 0x021a0000, 
> > > + .virt_start = 0x021a0000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* i2c3 */ { 
> > > + .phys_start = 0x021b0000, 
> > > + .virt_start = 0x021b0000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* duart1 */ { 
> > > + .phys_start = 0x021c0000, 
> > > + .virt_start = 0x021c0000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* duart2 */ { 
> > > + .phys_start = 0x021d0000, 
> > > + .virt_start = 0x021d0000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* gpio0 */ { 
> > > + .phys_start = 0x02300000, 
> > > + .virt_start = 0x02300000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* gpio1 */ { 
> > > + .phys_start = 0x02310000, 
> > > + .virt_start = 0x02310000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* gpio2 */ { 
> > > + .phys_start = 0x02320000, 
> > > + .virt_start = 0x02320000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* gpio3 */ { 
> > > + .phys_start = 0x02330000, 
> > > + .virt_start = 0x02330000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* lpuart0 */ { 
> > > + .phys_start = 0x02950000, 
> > > + .virt_start = 0x02950000, 
> > > + .size = 0x1000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* lpuart1 */ { 
> > > + .phys_start = 0x02960000, 
> > > + .virt_start = 0x02960000, 
> > > + .size = 0x1000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* lpuart2 */ { 
> > > + .phys_start = 0x02970000, 
> > > + .virt_start = 0x02970000, 
> > > + .size = 0x1000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* lpuart3 */ { 
> > > + .phys_start = 0x02980000, 
> > > + .virt_start = 0x02980000, 
> > > + .size = 0x1000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* lpuart4 */ { 
> > > + .phys_start = 0x02990000, 
> > > + .virt_start = 0x02990000, 
> > > + .size = 0x1000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* lpuart5 */ { 
> > > + .phys_start = 0x029a0000, 
> > > + .virt_start = 0x029a0000, 
> > > + .size = 0x1000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* wdog0 */ { 
> > > + .phys_start = 0x02ad0000, 
> > > + .virt_start = 0x02ad0000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* edma0 */ { 
> > > + .phys_start = 0x02c00000, 
> > > + .virt_start = 0x02c00000, 
> > > + .size = 0x30000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* usb0 */ { 
> > > + .phys_start = 0x02f00000, 
> > > + .virt_start = 0x02f00000, 
> > > + .size = 0x100000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* usb1 */ { 
> > > + .phys_start = 0x03000000, 
> > > + .virt_start = 0x03000000, 
> > > + .size = 0x100000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* usb2 */ { 
> > > + .phys_start = 0x03100000, 
> > > + .virt_start = 0x03100000, 
> > > + .size = 0x100000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* sata */ { 
> > > + .phys_start = 0x03200000, 
> > > + .virt_start = 0x03200000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* msi1 */ { 
> > > + .phys_start = 0x01580000, 
> > > + .virt_start = 0x01580000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* msi2 */ { 
> > > + .phys_start = 0x01590000, 
> > > + .virt_start = 0x01590000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* msi3 */ { 
> > > + .phys_start = 0x015a0000, 
> > > + .virt_start = 0x015a0000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* pcie0 */ { 
> > > + .phys_start = 0x03400000, 
> > > + .virt_start = 0x03400000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* pcie1 */ { 
> > > + .phys_start = 0x03500000, 
> > > + .virt_start = 0x03500000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* pcie2 */ { 
> > > + .phys_start = 0x03600000, 
> > > + .virt_start = 0x03600000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* pcie2 pf0 */ { 
> > > + .phys_start = 0x036c0000, 
> > > + .virt_start = 0x036c0000, 
> > > + .size = 0x10000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* PCI host bridge 0 */ { 
> > > + .phys_start = 0x4000000000, 
> > > + .virt_start = 0x4000000000, 
> > > + .size = 0x800000000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* PCI host bridge 1 */ { 
> > > + .phys_start = 0x4800000000, 
> > > + .virt_start = 0x4800000000, 
> > > + .size = 0x800000000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + /* PCI host bridge 2 */ { 
> > > + .phys_start = 0x5000000000, 
> > > + .virt_start = 0x5000000000, 
> > > + .size = 0x800000000, 
> > > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > > + JAILHOUSE_MEM_IO, 
> > > + }, 
> > > + }, 
> > > + 
> > > + .irqchips = { 
> > > + /* GIC */ { 
> > > + .address = 0x1410000, 
> > > + .pin_base = 32, 
> > > + .pin_bitmap = { 
> > > + 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff 
> > > + }, 
> > > + }, 
> > > + /* GIC */ { 
> > > + .address = 0x1410000, 
> > > + .pin_base = 160, 
> > > + .pin_bitmap = { 
> > > + 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff 
> > > + }, 
> > > + }, 
> > > + }, 
> > > + 
> > > + .pci_devices = { 
> > > + { /* IVSHMEM 00:00.0 (demo) */ 
> > > + .type = JAILHOUSE_PCI_TYPE_IVSHMEM, 
> > > + .domain = 0, 
> > > + .bdf = 0 << 3, 
> > > + .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX, 
> > > + .shmem_regions_start = 0, 
> > > + .shmem_dev_id = 0, 
> > > + .shmem_peers = 3, 
> > > + .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED, 
> > > + }, 
> > > + { /* IVSHMEM 00:01.0 (networking) */ 
> > > + .type = JAILHOUSE_PCI_TYPE_IVSHMEM, 
> > > + .domain = 0, 
> > > + .bdf = 1 << 3, 
> > > + .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX, 
> > > + .shmem_regions_start = 5, 
> > > + .shmem_dev_id = 0, 
> > > + .shmem_peers = 2, 
> > > + .shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH, 
> > > + }, 
> > > + }, 
> > > +}; 
> > > 
> > 
> > You are missing the linux inmate dtb. 
> > 
> > 
> > Hi, Jan, 
> > 
> > I am reusing the root cell dts: include root cell dts and then delete or 
> > modify some nodes,  so do you think we need to create a standalone dts 
> > for inmate cell? thanks. 
>
> Would be smoother for your users. 
>
> Jan 
>

Thanks Jan, will provide it.

One more question about:

*Also, inmate-demo and linux-demo should not overlap in CPUs (if you 
have>2) so that you can run three cells in parallel. *

In fact we only have two uart console on the board, so I think run two 
cells in parallel will be better, otherwise if we run three cells, we have 
to use one uart console for two cells, any comments? thanks. 
 
Jiafei.

>
> -- 
> Siemens AG, T RDA IOT 
> Corporate Competence Center Embedded Linux 
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0907fe4e-f1bc-4173-b710-172cc308670fn%40googlegroups.com.

------=_Part_8783_708258856.1606794056723
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">O=
n Monday, November 30, 2020 at 6:20:37 PM UTC+8 j.kiszka...@gmail.com wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; =
border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On 30.11.20 =
08:19, Peter Pan wrote:
<br>&gt;=20
<br>&gt;=20
<br>&gt; On Monday, November 30, 2020 at 3:02:12 PM UTC+8 <a href=3D"" data=
-email-masked=3D"" rel=3D"nofollow">j.kiszka...@gmail.com</a>
<br>&gt; wrote:
<br>&gt;=20
<br>&gt;     On 30.11.20 08:05, Jiafei Pan wrote:
<br>&gt;     &gt; Add root cell, inmate cell, ivshmem demo cell and Linux d=
emo cell
<br>&gt;     &gt; configure files for NXP ls1046a RDB platform.
<br>&gt;     &gt;
<br>&gt;     &gt; Signed-off-by: Jiafei Pan &lt;<a href=3D"" data-email-mas=
ked=3D"" rel=3D"nofollow">Jiafe...@nxp.com</a>&gt;
<br>&gt;     &gt; ---
<br>&gt;     &gt; configs/arm64/ls1046a-rdb-inmate-demo.c | 67 +++
<br>&gt;     &gt; configs/arm64/ls1046a-rdb-ivshmem-demo.c | 142 +++++++
<br>&gt;     &gt; configs/arm64/ls1046a-rdb-linux-demo.c | 165 ++++++++
<br>&gt;     &gt; configs/arm64/ls1046a-rdb.c | 517 +++++++++++++++++++++++
<br>&gt;     &gt; 4 files changed, 891 insertions(+)
<br>&gt;     &gt; create mode 100644 configs/arm64/ls1046a-rdb-inmate-demo.=
c
<br>&gt;     &gt; create mode 100644 configs/arm64/ls1046a-rdb-ivshmem-demo=
.c
<br>&gt;     &gt; create mode 100644 configs/arm64/ls1046a-rdb-linux-demo.c
<br>&gt;     &gt; create mode 100644 configs/arm64/ls1046a-rdb.c
<br>&gt;     &gt;
<br>&gt;     &gt; diff --git a/configs/arm64/ls1046a-rdb-inmate-demo.c
<br>&gt;     b/configs/arm64/ls1046a-rdb-inmate-demo.c
<br>&gt;     &gt; new file mode 100644
<br>&gt;     &gt; index 00000000..0f4f2395
<br>&gt;     &gt; --- /dev/null
<br>&gt;     &gt; +++ b/configs/arm64/ls1046a-rdb-inmate-demo.c
<br>&gt;     &gt; @@ -0,0 +1,67 @@
<br>&gt;     &gt; +/*
<br>&gt;     &gt; + * ls1046a RDB - inmate demo
<br>&gt;     &gt; + *
<br>&gt;     &gt; + * Copyright NXP 2020
<br>&gt;     &gt; + *
<br>&gt;     &gt; + * Authors:
<br>&gt;     &gt; + * Jiafei Pan &lt;<a href=3D"" data-email-masked=3D"" re=
l=3D"nofollow">jiafe...@nxp.com</a>&gt;
<br>&gt;     &gt; + *
<br>&gt;     &gt; + * This work is licensed under the terms of the GNU GPL,=
 version
<br>&gt;     2. See
<br>&gt;     &gt; + * the COPYING file in the top-level directory.
<br>&gt;     &gt; + */
<br>&gt;     &gt; +
<br>&gt;     &gt; +#include &lt;jailhouse/types.h&gt;
<br>&gt;     &gt; +#include &lt;jailhouse/cell-config.h&gt;
<br>&gt;     &gt; +
<br>&gt;     &gt; +struct {
<br>&gt;     &gt; + struct jailhouse_cell_desc cell;
<br>&gt;     &gt; + __u64 cpus[1];
<br>&gt;     &gt; + struct jailhouse_memory mem_regions[3];
<br>&gt;     &gt; +} __attribute__((packed)) config =3D {
<br>&gt;     &gt; + .cell =3D {
<br>&gt;     &gt; + .signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
<br>&gt;     &gt; + .revision =3D JAILHOUSE_CONFIG_REVISION,
<br>&gt;     &gt; + .name =3D "inmate-demo",
<br>&gt;     &gt; + .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,
<br>&gt;     &gt; +
<br>&gt;     &gt; + .cpu_set_size =3D sizeof(config.cpus),
<br>&gt;     &gt; + .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
<br>&gt;     &gt; + .num_irqchips =3D 0,
<br>&gt;     &gt; + .num_pci_devices =3D 0,
<br>&gt;     &gt; +
<br>&gt;     &gt; + .console =3D {
<br>&gt;     &gt; + .address =3D 0x21c0600, /* Uart1 in DUART1 */
<br>&gt;     &gt; + .divider =3D 0xbd, /* baudrate: 115200 */
<br>&gt;     &gt; + .type =3D JAILHOUSE_CON_TYPE_8250,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_CON_ACCESS_MMIO |
<br>&gt;     &gt; + JAILHOUSE_CON_REGDIST_1,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; +
<br>&gt;     &gt; + .cpus =3D {
<br>&gt;     &gt; + 0x8,
<br>&gt;     &gt; + },
<br>&gt;     &gt; +
<br>&gt;     &gt; + .mem_regions =3D {
<br>&gt;     &gt; + /* DUART1 */ {
<br>&gt;     &gt; + .phys_start =3D 0x21c0000,
<br>&gt;     &gt; + .virt_start =3D 0x21c0000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* RAM: Top at 2GB DRAM1 Space */ {
<br>&gt;     &gt; + .phys_start =3D 0xc0000000,
<br>&gt;     &gt; + .virt_start =3D 0,
<br>&gt;     &gt; + .size =3D 0x00010000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* communication region */ {
<br>&gt;     &gt; + .virt_start =3D 0x80000000,
<br>&gt;     &gt; + .size =3D 0x00001000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_COMM_REGION,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + }
<br>&gt;     &gt; +};
<br>&gt;     &gt; diff --git a/configs/arm64/ls1046a-rdb-ivshmem-demo.c
<br>&gt;     b/configs/arm64/ls1046a-rdb-ivshmem-demo.c
<br>&gt;     &gt; new file mode 100644
<br>&gt;     &gt; index 00000000..907ba1f1
<br>&gt;     &gt; --- /dev/null
<br>&gt;     &gt; +++ b/configs/arm64/ls1046a-rdb-ivshmem-demo.c
<br>&gt;     &gt; @@ -0,0 +1,142 @@
<br>&gt;     &gt; +/*
<br>&gt;     &gt; + * ls1046a RDB - ivshmem demo
<br>&gt;     &gt; + *
<br>&gt;     &gt; + * Copyright NXP 2020
<br>&gt;     &gt; + *
<br>&gt;     &gt; + * Authors:
<br>&gt;     &gt; + * Jiafei Pan &lt;<a href=3D"" data-email-masked=3D"" re=
l=3D"nofollow">jiafe...@nxp.com</a>&gt;
<br>&gt;     &gt; + *
<br>&gt;     &gt; + * This work is licensed under the terms of the GNU GPL,=
 version
<br>&gt;     2. See
<br>&gt;     &gt; + * the COPYING file in the top-level directory.
<br>&gt;     &gt; + */
<br>&gt;     &gt; +
<br>&gt;     &gt; +#include &lt;jailhouse/types.h&gt;
<br>&gt;     &gt; +#include &lt;jailhouse/cell-config.h&gt;
<br>&gt;     &gt; +
<br>&gt;     &gt; +struct {
<br>&gt;     &gt; + struct jailhouse_cell_desc cell;
<br>&gt;     &gt; + __u64 cpus[1];
<br>&gt;     &gt; + struct jailhouse_memory mem_regions[8];
<br>&gt;     &gt; + struct jailhouse_irqchip irqchips[2];
<br>&gt;     &gt; + struct jailhouse_pci_device pci_devices[1];
<br>&gt;     &gt; +} __attribute__((packed)) config =3D {
<br>&gt;     &gt; + .cell =3D {
<br>&gt;     &gt; + .signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
<br>&gt;     &gt; + .revision =3D JAILHOUSE_CONFIG_REVISION,
<br>&gt;     &gt; + .name =3D "ivshmem-demo",
<br>&gt;     &gt; + .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,
<br>&gt;     &gt; +
<br>&gt;     &gt; + .cpu_set_size =3D sizeof(config.cpus),
<br>&gt;     &gt; + .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
<br>&gt;     &gt; + .num_irqchips =3D ARRAY_SIZE(config.irqchips),
<br>&gt;     &gt; + .num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
<br>&gt;     &gt; + .vpci_irq_base =3D 60 - 32, /* vPCI INTx */
<br>&gt;     &gt; +
<br>&gt;     &gt; + .console =3D {
<br>&gt;     &gt; + .address =3D 0x21c0600, /* Uart1 in DUART1 */
<br>&gt;     &gt; + .divider =3D 0xbd, /* baudrate: 115200 */
<br>&gt;     &gt; + .type =3D JAILHOUSE_CON_TYPE_8250,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_CON_ACCESS_MMIO |
<br>&gt;     &gt; + JAILHOUSE_CON_REGDIST_1,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; +
<br>&gt;     &gt; + .cpus =3D {
<br>&gt;     &gt; + 0x8,
<br>&gt;     &gt; + },
<br>&gt;     &gt; +
<br>&gt;     &gt; + .mem_regions =3D {
<br>&gt;     &gt; + /* IVHSMEM shared memory region for 00:00.0 */ {
<br>&gt;     &gt; + .phys_start =3D 0xfb700000,
<br>&gt;     &gt; + .virt_start =3D 0xfb700000,
<br>&gt;     &gt; + .size =3D 0x1000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARE=
D,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + {
<br>&gt;     &gt; + .phys_start =3D 0xfb701000,
<br>&gt;     &gt; + .virt_start =3D 0xfb701000,
<br>&gt;     &gt; + .size =3D 0x9000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_ROOTSHARED,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + {
<br>&gt;     &gt; + .phys_start =3D 0xfb70a000,
<br>&gt;     &gt; + .virt_start =3D 0xfb70a000,
<br>&gt;     &gt; + .size =3D 0x2000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARE=
D,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + {
<br>&gt;     &gt; + .phys_start =3D 0xfb70c000,
<br>&gt;     &gt; + .virt_start =3D 0xfb70c000,
<br>&gt;     &gt; + .size =3D 0x2000,
<br>&gt;     &gt; + //.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHA=
RED,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_ROOTSHARED,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + {
<br>&gt;     &gt; + .phys_start =3D 0xfb70e000,
<br>&gt;     &gt; + .virt_start =3D 0xfb70e000,
<br>&gt;     &gt; + .size =3D 0x2000,
<br>&gt;     &gt; + //.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + // JAILHOUSE_MEM_ROOTSHARED,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARE=
D,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* DUART1 */ {
<br>&gt;     &gt; + .phys_start =3D 0x21c0000,
<br>&gt;     &gt; + .virt_start =3D 0x21c0000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* RAM: Top at 4GB Space */ {
<br>&gt;     &gt; + .phys_start =3D 0xc0000000,
<br>&gt;     &gt; + .virt_start =3D 0,
<br>&gt;     &gt; + .size =3D 0x00010000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* communication region */ {
<br>&gt;     &gt; + .virt_start =3D 0x80000000,
<br>&gt;     &gt; + .size =3D 0x00001000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_COMM_REGION,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; +
<br>&gt;     &gt; + .irqchips =3D {
<br>&gt;     &gt; + /* GIC-400 */ {
<br>&gt;     &gt; + .address =3D 0x1410000,
<br>&gt;     &gt; + .pin_base =3D 32,
<br>&gt;     &gt; + .pin_bitmap =3D {
<br>&gt;     &gt; + 1 &lt;&lt; (60 - 32), /* vPCI */
<br>&gt;     &gt; + 0,
<br>&gt;     &gt; + 0,
<br>&gt;     &gt; + 0,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* GIC-400 */ {
<br>&gt;     &gt; + .address =3D 0x1410000,
<br>&gt;     &gt; + .pin_base =3D 160,
<br>&gt;     &gt; + .pin_bitmap =3D {
<br>&gt;     &gt; + 0,
<br>&gt;     &gt; + 0,
<br>&gt;     &gt; + 0,
<br>&gt;     &gt; + 0,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; +
<br>&gt;     &gt; + .pci_devices =3D {
<br>&gt;     &gt; + { /* IVSHMEM 00:00.0 (demo) */
<br>&gt;     &gt; + .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
<br>&gt;     &gt; + .domain =3D 0,
<br>&gt;     &gt; + .bdf =3D 0 &lt;&lt; 3,
<br>&gt;     &gt; + .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
<br>&gt;     &gt; + .shmem_regions_start =3D 0,
<br>&gt;     &gt; + .shmem_dev_id =3D 1,
<br>&gt;     &gt; + .shmem_peers =3D 1,
<br>&gt;     &gt; + .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; +
<br>&gt;     &gt; +};
<br>&gt;     &gt; diff --git a/configs/arm64/ls1046a-rdb-linux-demo.c
<br>&gt;     b/configs/arm64/ls1046a-rdb-linux-demo.c
<br>&gt;     &gt; new file mode 100644
<br>&gt;     &gt; index 00000000..c8f699bb
<br>&gt;     &gt; --- /dev/null
<br>&gt;     &gt; +++ b/configs/arm64/ls1046a-rdb-linux-demo.c
<br>&gt;     &gt; @@ -0,0 +1,165 @@
<br>&gt;     &gt; +/*
<br>&gt;     &gt; + * ls1046a RDB target - linux-demo
<br>&gt;     &gt; + *
<br>&gt;     &gt; + * Copyright 2020 NXP
<br>&gt;     &gt; + *
<br>&gt;     &gt; + * Authors:
<br>&gt;     &gt; + * Jiafei Pan &lt;<a href=3D"" data-email-masked=3D"" re=
l=3D"nofollow">jiafe...@nxp.com</a>&gt;
<br>&gt;     &gt; + *
<br>&gt;     &gt; + * This work is licensed under the terms of the GNU GPL,=
 version
<br>&gt;     2. See
<br>&gt;     &gt; + * the COPYING file in the top-level directory.
<br>&gt;     &gt; + */
<br>&gt;     &gt; +
<br>&gt;     &gt; +#include &lt;jailhouse/types.h&gt;
<br>&gt;     &gt; +#include &lt;jailhouse/cell-config.h&gt;
<br>&gt;     &gt; +
<br>&gt;     &gt; +struct {
<br>&gt;     &gt; + struct jailhouse_cell_desc cell;
<br>&gt;     &gt; + __u64 cpus[1];
<br>&gt;     &gt; + struct jailhouse_memory mem_regions[16];
<br>&gt;     &gt; + struct jailhouse_irqchip irqchips[2];
<br>&gt;     &gt; + struct jailhouse_pci_device pci_devices[2];
<br>&gt;     &gt; +} __attribute__((packed)) config =3D {
<br>&gt;     &gt; + .cell =3D {
<br>&gt;     &gt; + .signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
<br>&gt;     &gt; + .revision =3D JAILHOUSE_CONFIG_REVISION,
<br>&gt;     &gt; + .name =3D "linux-inmate-demo",
<br>&gt;     &gt; + .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,
<br>&gt;     &gt; +
<br>&gt;     &gt; + .cpu_set_size =3D sizeof(config.cpus),
<br>&gt;     &gt; + .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
<br>&gt;     &gt; + .num_irqchips =3D ARRAY_SIZE(config.irqchips),
<br>&gt;     &gt; + .num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
<br>&gt;     &gt; + .vpci_irq_base =3D 60 - 32, /* vPCI INTx: 60,61,62,63 *=
/
<br>&gt;     &gt; + },
<br>&gt;     &gt; +
<br>&gt;     &gt; + .cpus =3D {
<br>&gt;     &gt; + 0xc,
<br>&gt;     &gt; + },
<br>&gt;     &gt; +
<br>&gt;     &gt; + .mem_regions =3D {
<br>&gt;     &gt; + /* IVHSMEM shared memory region for 00:00.0 */ {
<br>&gt;     &gt; + .phys_start =3D 0xfb700000,
<br>&gt;     &gt; + .virt_start =3D 0xfb700000,
<br>&gt;     &gt; + .size =3D 0x1000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARE=
D,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + {
<br>&gt;     &gt; + .phys_start =3D 0xfb701000,
<br>&gt;     &gt; + .virt_start =3D 0xfb701000,
<br>&gt;     &gt; + .size =3D 0x9000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_ROOTSHARED,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + {
<br>&gt;     &gt; + .phys_start =3D 0xfb70a000,
<br>&gt;     &gt; + .virt_start =3D 0xfb70a000,
<br>&gt;     &gt; + .size =3D 0x2000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARE=
D,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + {
<br>&gt;     &gt; + .phys_start =3D 0xfb70c000,
<br>&gt;     &gt; + .virt_start =3D 0xfb70c000,
<br>&gt;     &gt; + .size =3D 0x2000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARE=
D,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + {
<br>&gt;     &gt; + .phys_start =3D 0xfb70e000,
<br>&gt;     &gt; + .virt_start =3D 0xfb70e000,
<br>&gt;     &gt; + .size =3D 0x2000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_ROOTSHARED,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* IVSHMEM shared memory regions for 00:01.0 (networkin=
g) */
<br>&gt;     &gt; + JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 1),
<br>&gt;     &gt; + /* DUART1 */ {
<br>&gt;     &gt; + .phys_start =3D 0x21c0000,
<br>&gt;     &gt; + .virt_start =3D 0x21c0000,
<br>&gt;     &gt; + .size =3D 0x1000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* clockgen */ {
<br>&gt;     &gt; + .phys_start =3D 0x01ee1000,
<br>&gt;     &gt; + .virt_start =3D 0x01ee1000,
<br>&gt;     &gt; + .size =3D 0x1000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* dcfg */ {
<br>&gt;     &gt; + .phys_start =3D 0x01ee0000,
<br>&gt;     &gt; + .virt_start =3D 0x01ee0000,
<br>&gt;     &gt; + .size =3D 0x1000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* RAM */ {
<br>&gt;     &gt; + .phys_start =3D 0xbf900000,
<br>&gt;     &gt; + .virt_start =3D 0,
<br>&gt;     &gt; + .size =3D 0x00010000, /* 64K */
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* RAM: Top at DRAM1 2GB Space */ {
<br>&gt;     &gt; + .phys_start =3D 0xc0000000,
<br>&gt;     &gt; + .virt_start =3D 0xc0000000,
<br>&gt;     &gt; + .size =3D 0x3b500000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
<br>&gt;     &gt; + JAILHOUSE_MEM_LOADABLE,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* communication region */ {
<br>&gt;     &gt; + .virt_start =3D 0x80000000,
<br>&gt;     &gt; + .size =3D 0x00001000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_COMM_REGION,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; +
<br>&gt;     &gt; + .irqchips =3D {
<br>&gt;     &gt; + /* GIC-400 */ {
<br>&gt;     &gt; + .address =3D 0x1410000,
<br>&gt;     &gt; + .pin_base =3D 32,
<br>&gt;     &gt; + .pin_bitmap =3D {
<br>&gt;     &gt; + 1 &lt;&lt; (60 -32) | 1 &lt;&lt; (61 - 32) |
<br>&gt;     &gt; + 1 &lt;&lt; (62 - 32) | 1 &lt;&lt; (63 -32), /* vPCI */
<br>&gt;     &gt; + 0,
<br>&gt;     &gt; + 0,
<br>&gt;     &gt; + 0,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* GIC-400 */ {
<br>&gt;     &gt; + .address =3D 0x1410000,
<br>&gt;     &gt; + .pin_base =3D 160,
<br>&gt;     &gt; + .pin_bitmap =3D {
<br>&gt;     &gt; + 0,
<br>&gt;     &gt; + 0,
<br>&gt;     &gt; + 0,
<br>&gt;     &gt; + 0,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; +
<br>&gt;     &gt; + .pci_devices =3D {
<br>&gt;     &gt; + { /* IVSHMEM 00:00.0 (demo) */
<br>&gt;     &gt; + .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
<br>&gt;     &gt; + .domain =3D 0,
<br>&gt;     &gt; + .bdf =3D 0 &lt;&lt; 3,
<br>&gt;     &gt; + .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
<br>&gt;     &gt; + .shmem_regions_start =3D 0,
<br>&gt;     &gt; + .shmem_dev_id =3D 2,
<br>&gt;     &gt; + .shmem_peers =3D 3,
<br>&gt;     &gt; + .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + { /* IVSHMEM 00:01.0 (networking) */
<br>&gt;     &gt; + .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
<br>&gt;     &gt; + .domain =3D 0,
<br>&gt;     &gt; + .bdf =3D 1 &lt;&lt; 3,
<br>&gt;     &gt; + .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
<br>&gt;     &gt; + .shmem_regions_start =3D 5,
<br>&gt;     &gt; + .shmem_dev_id =3D 1,
<br>&gt;     &gt; + .shmem_peers =3D 2,
<br>&gt;     &gt; + .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; +};
<br>&gt;     &gt; diff --git a/configs/arm64/ls1046a-rdb.c
<br>&gt;     b/configs/arm64/ls1046a-rdb.c
<br>&gt;     &gt; new file mode 100644
<br>&gt;     &gt; index 00000000..3eb58005
<br>&gt;     &gt; --- /dev/null
<br>&gt;     &gt; +++ b/configs/arm64/ls1046a-rdb.c
<br>&gt;     &gt; @@ -0,0 +1,517 @@
<br>&gt;     &gt; +/*
<br>&gt;     &gt; + * ls1046a RDB target - linux-demo
<br>&gt;     &gt; + *
<br>&gt;     &gt; + * Copyright 2020 NXP
<br>&gt;     &gt; + *
<br>&gt;     &gt; + * Authors:
<br>&gt;     &gt; + * Jiafei Pan &lt;<a href=3D"" data-email-masked=3D"" re=
l=3D"nofollow">jiafe...@nxp.com</a>&gt;
<br>&gt;     &gt; + *
<br>&gt;     &gt; + * This work is licensed under the terms of the GNU GPL,=
 version
<br>&gt;     2. See
<br>&gt;     &gt; + * the COPYING file in the top-level directory.
<br>&gt;     &gt; + */
<br>&gt;     &gt; +
<br>&gt;     &gt; +#include &lt;jailhouse/types.h&gt;
<br>&gt;     &gt; +#include &lt;jailhouse/cell-config.h&gt;
<br>&gt;     &gt; +
<br>&gt;     &gt; +struct {
<br>&gt;     &gt; + struct jailhouse_system header;
<br>&gt;     &gt; + __u64 cpus[1];
<br>&gt;     &gt; + struct jailhouse_memory mem_regions[64];
<br>&gt;     &gt; + struct jailhouse_irqchip irqchips[2];
<br>&gt;     &gt; + struct jailhouse_pci_device pci_devices[2];
<br>&gt;     &gt; +} __attribute__((packed)) config =3D {
<br>&gt;     &gt; + .header =3D {
<br>&gt;     &gt; + .signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
<br>&gt;     &gt; + .revision =3D JAILHOUSE_CONFIG_REVISION,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
<br>&gt;     &gt; + .hypervisor_memory =3D {
<br>&gt;     &gt; + .phys_start =3D 0xfba00000,
<br>&gt;     &gt; + .size =3D 0x00400000,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + .debug_console =3D {
<br>&gt;     &gt; + .address =3D 0x21c0500, /* Uart0 in DUART1 */
<br>&gt;     &gt; + .size =3D 0x100,
<br>&gt;     &gt; + .type =3D JAILHOUSE_CON_TYPE_8250,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_CON_ACCESS_MMIO |
<br>&gt;     &gt; + JAILHOUSE_CON_REGDIST_1,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + .platform_info =3D {
<br>&gt;     &gt; + .pci_mmconfig_base =3D 0xfb500000,
<br>&gt;     &gt; + .pci_mmconfig_end_bus =3D 0,
<br>&gt;     &gt; + .pci_is_virtual =3D 1,
<br>&gt;     &gt; + .pci_domain =3D -1,
<br>&gt;     &gt; +
<br>&gt;     &gt; + .arm =3D {
<br>&gt;     &gt; + .gic_version =3D 2,
<br>&gt;     &gt; + .gicd_base =3D 0x1410000,
<br>&gt;     &gt; + .gicc_base =3D 0x142f000,
<br>&gt;     &gt; + .gich_base =3D 0x1440000,
<br>&gt;     &gt; + .gicv_base =3D 0x146f000,
<br>&gt;     &gt; + .maintenance_irq =3D 25,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; + .root_cell =3D {
<br>&gt;     &gt; + .name =3D "ls1046a",
<br>&gt;     &gt; + .num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
<br>&gt;     &gt; + .cpu_set_size =3D sizeof(config.cpus),
<br>&gt;     &gt; + .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
<br>&gt;     &gt; + .num_irqchips =3D ARRAY_SIZE(config.irqchips),
<br>&gt;     &gt; + .vpci_irq_base =3D 67 - 32, /* Not include 32 base */
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; +
<br>&gt;     &gt; + .cpus =3D {
<br>&gt;     &gt; + 0xf,
<br>&gt;     &gt; + },
<br>&gt;     &gt; +
<br>&gt;     &gt; + .mem_regions =3D {
<br>&gt;     &gt; + /* IVHSMEM shared memory region for 00:00.0 */ {
<br>&gt;     &gt; + .phys_start =3D 0xfb700000,
<br>&gt;     &gt; + .virt_start =3D 0xfb700000,
<br>&gt;     &gt; + .size =3D 0x1000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + {
<br>&gt;     &gt; + .phys_start =3D 0xfb701000,
<br>&gt;     &gt; + .virt_start =3D 0xfb701000,
<br>&gt;     &gt; + .size =3D 0x9000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + {
<br>&gt;     &gt; + .phys_start =3D 0xfb70a000,
<br>&gt;     &gt; + .virt_start =3D 0xfb70a000,
<br>&gt;     &gt; + .size =3D 0x2000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + {
<br>&gt;     &gt; + .phys_start =3D 0xfb70c000,
<br>&gt;     &gt; + .virt_start =3D 0xfb70c000,
<br>&gt;     &gt; + .size =3D 0x2000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + {
<br>&gt;     &gt; + .phys_start =3D 0xfb70e000,
<br>&gt;     &gt; + .virt_start =3D 0xfb70e000,
<br>&gt;     &gt; + .size =3D 0x2000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* IVSHMEM shared memory regions for 00:01.0 (networkin=
g) */
<br>&gt;     &gt; + JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 0),
<br>&gt;     &gt; + /* RAM - 1GB at DRAM1 region - root cell */ {
<br>&gt;     &gt; + .phys_start =3D 0x80000000,
<br>&gt;     &gt; + .virt_start =3D 0x80000000,
<br>&gt;     &gt; + .size =3D 0x40000000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_EXECUTE,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* DRAM2 6GB */ {
<br>&gt;     &gt; + .phys_start =3D 0x880000000,
<br>&gt;     &gt; + .virt_start =3D 0x880000000,
<br>&gt;     &gt; + .size =3D 0x180000000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_EXECUTE,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* RAM: Inmate */ {
<br>&gt;     &gt; + .phys_start =3D 0xc0000000,
<br>&gt;     &gt; + .virt_start =3D 0xc0000000,
<br>&gt;     &gt; + .size =3D 0x3b500000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_EXECUTE,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* RAM: loader */ {
<br>&gt;     &gt; + .phys_start =3D 0xbf900000,
<br>&gt;     &gt; + .virt_start =3D 0xbf900000,
<br>&gt;     &gt; + .size =3D 0x00100000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_EXECUTE,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* DDR memory controller */ {
<br>&gt;     &gt; + .phys_start =3D 0x01080000,
<br>&gt;     &gt; + .virt_start =3D 0x01080000,
<br>&gt;     &gt; + .size =3D 0x1000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* IFC */ {
<br>&gt;     &gt; + .phys_start =3D 0x01530000,
<br>&gt;     &gt; + .virt_start =3D 0x01530000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* QSPI */ {
<br>&gt;     &gt; + .phys_start =3D 0x01550000,
<br>&gt;     &gt; + .virt_start =3D 0x01550000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* esdhc */ {
<br>&gt;     &gt; + .phys_start =3D 0x01560000,
<br>&gt;     &gt; + .virt_start =3D 0x01560000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* scfg */ {
<br>&gt;     &gt; + .phys_start =3D 0x01570000,
<br>&gt;     &gt; + .virt_start =3D 0x01570000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* crypto */ {
<br>&gt;     &gt; + .phys_start =3D 0x01700000,
<br>&gt;     &gt; + .virt_start =3D 0x01700000,
<br>&gt;     &gt; + .size =3D 0x100000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* qman */ {
<br>&gt;     &gt; + .phys_start =3D 0x01880000,
<br>&gt;     &gt; + .virt_start =3D 0x01880000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* bman */ {
<br>&gt;     &gt; + .phys_start =3D 0x01890000,
<br>&gt;     &gt; + .virt_start =3D 0x01890000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* fman */ {
<br>&gt;     &gt; + .phys_start =3D 0x01a00000,
<br>&gt;     &gt; + .virt_start =3D 0x01a00000,
<br>&gt;     &gt; + .size =3D 0x100000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* qportals CE */ {
<br>&gt;     &gt; + .phys_start =3D 0x500000000,
<br>&gt;     &gt; + .virt_start =3D 0x500000000,
<br>&gt;     &gt; + .size =3D 0x4000000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* qportals CI */ {
<br>&gt;     &gt; + .phys_start =3D 0x504000000,
<br>&gt;     &gt; + .virt_start =3D 0x504000000,
<br>&gt;     &gt; + .size =3D 0x4000000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* bportals CE */ {
<br>&gt;     &gt; + .phys_start =3D 0x508000000,
<br>&gt;     &gt; + .virt_start =3D 0x508000000,
<br>&gt;     &gt; + .size =3D 0x4000000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* bportals CI */ {
<br>&gt;     &gt; + .phys_start =3D 0x50c000000,
<br>&gt;     &gt; + .virt_start =3D 0x50c000000,
<br>&gt;     &gt; + .size =3D 0x4000000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* dcfg */ {
<br>&gt;     &gt; + .phys_start =3D 0x01ee0000,
<br>&gt;     &gt; + .virt_start =3D 0x01ee0000,
<br>&gt;     &gt; + .size =3D 0x1000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* clockgen */ {
<br>&gt;     &gt; + .phys_start =3D 0x01ee1000,
<br>&gt;     &gt; + .virt_start =3D 0x01ee1000,
<br>&gt;     &gt; + .size =3D 0x1000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* rcpm */ {
<br>&gt;     &gt; + .phys_start =3D 0x01ee2000,
<br>&gt;     &gt; + .virt_start =3D 0x01ee2000,
<br>&gt;     &gt; + .size =3D 0x1000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* tmu */ {
<br>&gt;     &gt; + .phys_start =3D 0x01f00000,
<br>&gt;     &gt; + .virt_start =3D 0x01f00000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* dspi */ {
<br>&gt;     &gt; + .phys_start =3D 0x02100000,
<br>&gt;     &gt; + .virt_start =3D 0x02100000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* i2c0 */ {
<br>&gt;     &gt; + .phys_start =3D 0x02180000,
<br>&gt;     &gt; + .virt_start =3D 0x02180000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* i2c1 */ {
<br>&gt;     &gt; + .phys_start =3D 0x02190000,
<br>&gt;     &gt; + .virt_start =3D 0x02190000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* i2c2 */ {
<br>&gt;     &gt; + .phys_start =3D 0x021a0000,
<br>&gt;     &gt; + .virt_start =3D 0x021a0000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* i2c3 */ {
<br>&gt;     &gt; + .phys_start =3D 0x021b0000,
<br>&gt;     &gt; + .virt_start =3D 0x021b0000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* duart1 */ {
<br>&gt;     &gt; + .phys_start =3D 0x021c0000,
<br>&gt;     &gt; + .virt_start =3D 0x021c0000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* duart2 */ {
<br>&gt;     &gt; + .phys_start =3D 0x021d0000,
<br>&gt;     &gt; + .virt_start =3D 0x021d0000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* gpio0 */ {
<br>&gt;     &gt; + .phys_start =3D 0x02300000,
<br>&gt;     &gt; + .virt_start =3D 0x02300000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* gpio1 */ {
<br>&gt;     &gt; + .phys_start =3D 0x02310000,
<br>&gt;     &gt; + .virt_start =3D 0x02310000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* gpio2 */ {
<br>&gt;     &gt; + .phys_start =3D 0x02320000,
<br>&gt;     &gt; + .virt_start =3D 0x02320000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* gpio3 */ {
<br>&gt;     &gt; + .phys_start =3D 0x02330000,
<br>&gt;     &gt; + .virt_start =3D 0x02330000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* lpuart0 */ {
<br>&gt;     &gt; + .phys_start =3D 0x02950000,
<br>&gt;     &gt; + .virt_start =3D 0x02950000,
<br>&gt;     &gt; + .size =3D 0x1000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* lpuart1 */ {
<br>&gt;     &gt; + .phys_start =3D 0x02960000,
<br>&gt;     &gt; + .virt_start =3D 0x02960000,
<br>&gt;     &gt; + .size =3D 0x1000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* lpuart2 */ {
<br>&gt;     &gt; + .phys_start =3D 0x02970000,
<br>&gt;     &gt; + .virt_start =3D 0x02970000,
<br>&gt;     &gt; + .size =3D 0x1000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* lpuart3 */ {
<br>&gt;     &gt; + .phys_start =3D 0x02980000,
<br>&gt;     &gt; + .virt_start =3D 0x02980000,
<br>&gt;     &gt; + .size =3D 0x1000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* lpuart4 */ {
<br>&gt;     &gt; + .phys_start =3D 0x02990000,
<br>&gt;     &gt; + .virt_start =3D 0x02990000,
<br>&gt;     &gt; + .size =3D 0x1000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* lpuart5 */ {
<br>&gt;     &gt; + .phys_start =3D 0x029a0000,
<br>&gt;     &gt; + .virt_start =3D 0x029a0000,
<br>&gt;     &gt; + .size =3D 0x1000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* wdog0 */ {
<br>&gt;     &gt; + .phys_start =3D 0x02ad0000,
<br>&gt;     &gt; + .virt_start =3D 0x02ad0000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* edma0 */ {
<br>&gt;     &gt; + .phys_start =3D 0x02c00000,
<br>&gt;     &gt; + .virt_start =3D 0x02c00000,
<br>&gt;     &gt; + .size =3D 0x30000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* usb0 */ {
<br>&gt;     &gt; + .phys_start =3D 0x02f00000,
<br>&gt;     &gt; + .virt_start =3D 0x02f00000,
<br>&gt;     &gt; + .size =3D 0x100000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* usb1 */ {
<br>&gt;     &gt; + .phys_start =3D 0x03000000,
<br>&gt;     &gt; + .virt_start =3D 0x03000000,
<br>&gt;     &gt; + .size =3D 0x100000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* usb2 */ {
<br>&gt;     &gt; + .phys_start =3D 0x03100000,
<br>&gt;     &gt; + .virt_start =3D 0x03100000,
<br>&gt;     &gt; + .size =3D 0x100000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* sata */ {
<br>&gt;     &gt; + .phys_start =3D 0x03200000,
<br>&gt;     &gt; + .virt_start =3D 0x03200000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* msi1 */ {
<br>&gt;     &gt; + .phys_start =3D 0x01580000,
<br>&gt;     &gt; + .virt_start =3D 0x01580000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* msi2 */ {
<br>&gt;     &gt; + .phys_start =3D 0x01590000,
<br>&gt;     &gt; + .virt_start =3D 0x01590000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* msi3 */ {
<br>&gt;     &gt; + .phys_start =3D 0x015a0000,
<br>&gt;     &gt; + .virt_start =3D 0x015a0000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* pcie0 */ {
<br>&gt;     &gt; + .phys_start =3D 0x03400000,
<br>&gt;     &gt; + .virt_start =3D 0x03400000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* pcie1 */ {
<br>&gt;     &gt; + .phys_start =3D 0x03500000,
<br>&gt;     &gt; + .virt_start =3D 0x03500000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* pcie2 */ {
<br>&gt;     &gt; + .phys_start =3D 0x03600000,
<br>&gt;     &gt; + .virt_start =3D 0x03600000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* pcie2 pf0 */ {
<br>&gt;     &gt; + .phys_start =3D 0x036c0000,
<br>&gt;     &gt; + .virt_start =3D 0x036c0000,
<br>&gt;     &gt; + .size =3D 0x10000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* PCI host bridge 0 */ {
<br>&gt;     &gt; + .phys_start =3D 0x4000000000,
<br>&gt;     &gt; + .virt_start =3D 0x4000000000,
<br>&gt;     &gt; + .size =3D 0x800000000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* PCI host bridge 1 */ {
<br>&gt;     &gt; + .phys_start =3D 0x4800000000,
<br>&gt;     &gt; + .virt_start =3D 0x4800000000,
<br>&gt;     &gt; + .size =3D 0x800000000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* PCI host bridge 2 */ {
<br>&gt;     &gt; + .phys_start =3D 0x5000000000,
<br>&gt;     &gt; + .virt_start =3D 0x5000000000,
<br>&gt;     &gt; + .size =3D 0x800000000,
<br>&gt;     &gt; + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; + JAILHOUSE_MEM_IO,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; +
<br>&gt;     &gt; + .irqchips =3D {
<br>&gt;     &gt; + /* GIC */ {
<br>&gt;     &gt; + .address =3D 0x1410000,
<br>&gt;     &gt; + .pin_base =3D 32,
<br>&gt;     &gt; + .pin_bitmap =3D {
<br>&gt;     &gt; + 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; + /* GIC */ {
<br>&gt;     &gt; + .address =3D 0x1410000,
<br>&gt;     &gt; + .pin_base =3D 160,
<br>&gt;     &gt; + .pin_bitmap =3D {
<br>&gt;     &gt; + 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; +
<br>&gt;     &gt; + .pci_devices =3D {
<br>&gt;     &gt; + { /* IVSHMEM 00:00.0 (demo) */
<br>&gt;     &gt; + .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
<br>&gt;     &gt; + .domain =3D 0,
<br>&gt;     &gt; + .bdf =3D 0 &lt;&lt; 3,
<br>&gt;     &gt; + .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
<br>&gt;     &gt; + .shmem_regions_start =3D 0,
<br>&gt;     &gt; + .shmem_dev_id =3D 0,
<br>&gt;     &gt; + .shmem_peers =3D 3,
<br>&gt;     &gt; + .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + { /* IVSHMEM 00:01.0 (networking) */
<br>&gt;     &gt; + .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
<br>&gt;     &gt; + .domain =3D 0,
<br>&gt;     &gt; + .bdf =3D 1 &lt;&lt; 3,
<br>&gt;     &gt; + .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
<br>&gt;     &gt; + .shmem_regions_start =3D 5,
<br>&gt;     &gt; + .shmem_dev_id =3D 0,
<br>&gt;     &gt; + .shmem_peers =3D 2,
<br>&gt;     &gt; + .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
<br>&gt;     &gt; + },
<br>&gt;     &gt; + },
<br>&gt;     &gt; +};
<br>&gt;     &gt;
<br>&gt;=20
<br>&gt;     You are missing the linux inmate dtb.
<br>&gt;=20
<br>&gt;=20
<br>&gt; Hi, Jan,
<br>&gt;=20
<br>&gt; I am reusing the root cell dts: include root cell dts and then del=
ete or
<br>&gt; modify some nodes,&nbsp; so do you think we need to create a stand=
alone dts
<br>&gt; for inmate cell? thanks.
<br>
<br>Would be smoother for your users.
<br>
<br>Jan
<br></blockquote><div><br></div><div>Thanks Jan, will provide it.</div><div=
><br></div><div>One more question about:</div><div><span style=3D"backgroun=
d-color: white;"><b>Also, inmate-demo and linux-demo should not overlap in =
CPUs (if you have<br>&gt;2) so that you can run three cells in parallel.&nb=
sp;</b></span></div><div><br></div><div>In fact we only have two uart conso=
le on the board, so I think run two cells in parallel will be better, other=
wise if we run three cells, we have to use one uart console for two cells, =
any comments? thanks.&nbsp;<br></div><div>&nbsp;</div><div>Jiafei.</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1=
px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0907fe4e-f1bc-4173-b710-172cc308670fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0907fe4e-f1bc-4173-b710-172cc308670fn%40googlegroups.co=
m</a>.<br />

------=_Part_8783_708258856.1606794056723--

------=_Part_8782_1715334264.1606794056723--
