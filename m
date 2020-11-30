Return-Path: <jailhouse-dev+bncBCY4NF5G6YJBBC52SL7AKGQEDTANH2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3712C7E9D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 08:19:40 +0100 (CET)
Received: by mail-qk1-x73b.google.com with SMTP id s29sf6186585qkm.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Nov 2020 23:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Bxq828V3KNDK/Wy2W1KtQT0QGtOTtdk0U8+GePb/Yvg=;
        b=ITAKTqehZLOOjl8QA0t3jVlvMH/yTiGoFn4xYaHi6jNdBSWEIhqh6HaTAcFc1slOI5
         mwGwIIDj1SFNa5XbdqZLY7HV5G7V4bZLRnQHElfErmDkHW2USDrXnMpHOjezUbX6w1ig
         MZceTTBrquM9Bc2UyLKkE3R4bMyuEhXp8oimc3k+3/cNq8NrDPZ7c8m4Ged27aAcCTeZ
         5aGufPp+/Z2M/Qn6ROcAMyPjx/wnW3VexiPgYMjNo49iVCKX64/bIJP0BAHykyD5eDp4
         7RUwv0zZ3WKSPujpUgB6120FLuqDMfnDjBUxZ7MSW2OC1yFI19qcrKOuX4uBgCGIpQY7
         cuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Bxq828V3KNDK/Wy2W1KtQT0QGtOTtdk0U8+GePb/Yvg=;
        b=VRLFNba7gNYXh44JI+fZijK9qSC9k6lwQH2945H/o7dTD0LtImEteN0RDIHdF5Djt+
         vpIalQLSKCHeWxwofj0tcCaftUXW2ufNff5Cw5cvwJmFn4sR/rJokDxCEipFgzU6Njel
         Ku4WJnPZC5VmapJ+lt6CfkHEu5uV53xRhy3VXUs2V4t/12pCPzVp1do5mzFnAWwO2cy6
         EhJzjRdJ4xlyK/J8jlUtIRaPXsaC1ASSizlPP0uba5SrneDfhl4oTEVLlR6RckZHdDfu
         vceAQaOgXxqQOZ1JoaruVLsR5ypva8KpzurJAeaHTCGfe2njGZsSdvSrp0nJfx+W792S
         kZZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Vmuwrdgifa7Pd3t9Dkz6/qBREEm4wTEn+6/hYk/U7+/zlpnyx
	HhDZBkLSnAF10CHaTNXWuN0=
X-Google-Smtp-Source: ABdhPJyHFTS0c1vVCqs+CXMVBblSl230xVOGU9hB8PnTh65tKrsJyD4kmlDMZWDRunwLiqFbVIpCPg==
X-Received: by 2002:a37:aa54:: with SMTP id t81mr21185900qke.468.1606720779614;
        Sun, 29 Nov 2020 23:19:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:6655:: with SMTP id j21ls4227170qtp.5.gmail; Sun, 29 Nov
 2020 23:19:39 -0800 (PST)
X-Received: by 2002:ac8:4311:: with SMTP id z17mr20035534qtm.90.1606720778973;
        Sun, 29 Nov 2020 23:19:38 -0800 (PST)
Date: Sun, 29 Nov 2020 23:19:38 -0800 (PST)
From: Peter Pan <jiafei.pan@nxp.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <09f76682-1c9d-4ddb-b8ca-3aab01218e47n@googlegroups.com>
In-Reply-To: <8a7f2697-3782-61d5-d68d-859e20fa1269@siemens.com>
References: <20201130070515.21504-1-Jiafei.Pan@nxp.com>
 <8a7f2697-3782-61d5-d68d-859e20fa1269@siemens.com>
Subject: Re: [PATCH] configs: add ls1046ardb linux demo
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2676_571058821.1606720778322"
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

------=_Part_2676_571058821.1606720778322
Content-Type: multipart/alternative; 
	boundary="----=_Part_2677_1413229233.1606720778322"

------=_Part_2677_1413229233.1606720778322
Content-Type: text/plain; charset="UTF-8"



On Monday, November 30, 2020 at 3:02:12 PM UTC+8 j.kiszka...@gmail.com 
wrote:

> On 30.11.20 08:05, Jiafei Pan wrote: 
> > Add root cell, inmate cell, ivshmem demo cell and Linux demo cell 
> > configure files for NXP ls1046a RDB platform. 
> > 
> > Signed-off-by: Jiafei Pan <Jiafe...@nxp.com> 
> > --- 
> > configs/arm64/ls1046a-rdb-inmate-demo.c | 67 +++ 
> > configs/arm64/ls1046a-rdb-ivshmem-demo.c | 142 +++++++ 
> > configs/arm64/ls1046a-rdb-linux-demo.c | 165 ++++++++ 
> > configs/arm64/ls1046a-rdb.c | 517 +++++++++++++++++++++++ 
> > 4 files changed, 891 insertions(+) 
> > create mode 100644 configs/arm64/ls1046a-rdb-inmate-demo.c 
> > create mode 100644 configs/arm64/ls1046a-rdb-ivshmem-demo.c 
> > create mode 100644 configs/arm64/ls1046a-rdb-linux-demo.c 
> > create mode 100644 configs/arm64/ls1046a-rdb.c 
> > 
> > diff --git a/configs/arm64/ls1046a-rdb-inmate-demo.c 
> b/configs/arm64/ls1046a-rdb-inmate-demo.c 
> > new file mode 100644 
> > index 00000000..0f4f2395 
> > --- /dev/null 
> > +++ b/configs/arm64/ls1046a-rdb-inmate-demo.c 
> > @@ -0,0 +1,67 @@ 
> > +/* 
> > + * ls1046a RDB - inmate demo 
> > + * 
> > + * Copyright NXP 2020 
> > + * 
> > + * Authors: 
> > + * Jiafei Pan <jiafe...@nxp.com> 
> > + * 
> > + * This work is licensed under the terms of the GNU GPL, version 2. See 
> > + * the COPYING file in the top-level directory. 
> > + */ 
> > + 
> > +#include <jailhouse/types.h> 
> > +#include <jailhouse/cell-config.h> 
> > + 
> > +struct { 
> > + struct jailhouse_cell_desc cell; 
> > + __u64 cpus[1]; 
> > + struct jailhouse_memory mem_regions[3]; 
> > +} __attribute__((packed)) config = { 
> > + .cell = { 
> > + .signature = JAILHOUSE_CELL_DESC_SIGNATURE, 
> > + .revision = JAILHOUSE_CONFIG_REVISION, 
> > + .name = "inmate-demo", 
> > + .flags = JAILHOUSE_CELL_PASSIVE_COMMREG, 
> > + 
> > + .cpu_set_size = sizeof(config.cpus), 
> > + .num_memory_regions = ARRAY_SIZE(config.mem_regions), 
> > + .num_irqchips = 0, 
> > + .num_pci_devices = 0, 
> > + 
> > + .console = { 
> > + .address = 0x21c0600, /* Uart1 in DUART1 */ 
> > + .divider = 0xbd, /* baudrate: 115200 */ 
> > + .type = JAILHOUSE_CON_TYPE_8250, 
> > + .flags = JAILHOUSE_CON_ACCESS_MMIO | 
> > + JAILHOUSE_CON_REGDIST_1, 
> > + }, 
> > + }, 
> > + 
> > + .cpus = { 
> > + 0x8, 
> > + }, 
> > + 
> > + .mem_regions = { 
> > + /* DUART1 */ { 
> > + .phys_start = 0x21c0000, 
> > + .virt_start = 0x21c0000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED, 
> > + }, 
> > + /* RAM: Top at 2GB DRAM1 Space */ { 
> > + .phys_start = 0xc0000000, 
> > + .virt_start = 0, 
> > + .size = 0x00010000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE, 
> > + }, 
> > + /* communication region */ { 
> > + .virt_start = 0x80000000, 
> > + .size = 0x00001000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_COMM_REGION, 
> > + }, 
> > + } 
> > +}; 
> > diff --git a/configs/arm64/ls1046a-rdb-ivshmem-demo.c 
> b/configs/arm64/ls1046a-rdb-ivshmem-demo.c 
> > new file mode 100644 
> > index 00000000..907ba1f1 
> > --- /dev/null 
> > +++ b/configs/arm64/ls1046a-rdb-ivshmem-demo.c 
> > @@ -0,0 +1,142 @@ 
> > +/* 
> > + * ls1046a RDB - ivshmem demo 
> > + * 
> > + * Copyright NXP 2020 
> > + * 
> > + * Authors: 
> > + * Jiafei Pan <jiafe...@nxp.com> 
> > + * 
> > + * This work is licensed under the terms of the GNU GPL, version 2. See 
> > + * the COPYING file in the top-level directory. 
> > + */ 
> > + 
> > +#include <jailhouse/types.h> 
> > +#include <jailhouse/cell-config.h> 
> > + 
> > +struct { 
> > + struct jailhouse_cell_desc cell; 
> > + __u64 cpus[1]; 
> > + struct jailhouse_memory mem_regions[8]; 
> > + struct jailhouse_irqchip irqchips[2]; 
> > + struct jailhouse_pci_device pci_devices[1]; 
> > +} __attribute__((packed)) config = { 
> > + .cell = { 
> > + .signature = JAILHOUSE_CELL_DESC_SIGNATURE, 
> > + .revision = JAILHOUSE_CONFIG_REVISION, 
> > + .name = "ivshmem-demo", 
> > + .flags = JAILHOUSE_CELL_PASSIVE_COMMREG, 
> > + 
> > + .cpu_set_size = sizeof(config.cpus), 
> > + .num_memory_regions = ARRAY_SIZE(config.mem_regions), 
> > + .num_irqchips = ARRAY_SIZE(config.irqchips), 
> > + .num_pci_devices = ARRAY_SIZE(config.pci_devices), 
> > + .vpci_irq_base = 60 - 32, /* vPCI INTx */ 
> > + 
> > + .console = { 
> > + .address = 0x21c0600, /* Uart1 in DUART1 */ 
> > + .divider = 0xbd, /* baudrate: 115200 */ 
> > + .type = JAILHOUSE_CON_TYPE_8250, 
> > + .flags = JAILHOUSE_CON_ACCESS_MMIO | 
> > + JAILHOUSE_CON_REGDIST_1, 
> > + }, 
> > + }, 
> > + 
> > + .cpus = { 
> > + 0x8, 
> > + }, 
> > + 
> > + .mem_regions = { 
> > + /* IVHSMEM shared memory region for 00:00.0 */ { 
> > + .phys_start = 0xfb700000, 
> > + .virt_start = 0xfb700000, 
> > + .size = 0x1000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, 
> > + }, 
> > + { 
> > + .phys_start = 0xfb701000, 
> > + .virt_start = 0xfb701000, 
> > + .size = 0x9000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_ROOTSHARED, 
> > + }, 
> > + { 
> > + .phys_start = 0xfb70a000, 
> > + .virt_start = 0xfb70a000, 
> > + .size = 0x2000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, 
> > + }, 
> > + { 
> > + .phys_start = 0xfb70c000, 
> > + .virt_start = 0xfb70c000, 
> > + .size = 0x2000, 
> > + //.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_ROOTSHARED, 
> > + }, 
> > + { 
> > + .phys_start = 0xfb70e000, 
> > + .virt_start = 0xfb70e000, 
> > + .size = 0x2000, 
> > + //.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + // JAILHOUSE_MEM_ROOTSHARED, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, 
> > + }, 
> > + /* DUART1 */ { 
> > + .phys_start = 0x21c0000, 
> > + .virt_start = 0x21c0000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED, 
> > + }, 
> > + /* RAM: Top at 4GB Space */ { 
> > + .phys_start = 0xc0000000, 
> > + .virt_start = 0, 
> > + .size = 0x00010000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE, 
> > + }, 
> > + /* communication region */ { 
> > + .virt_start = 0x80000000, 
> > + .size = 0x00001000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_COMM_REGION, 
> > + }, 
> > + }, 
> > + 
> > + .irqchips = { 
> > + /* GIC-400 */ { 
> > + .address = 0x1410000, 
> > + .pin_base = 32, 
> > + .pin_bitmap = { 
> > + 1 << (60 - 32), /* vPCI */ 
> > + 0, 
> > + 0, 
> > + 0, 
> > + }, 
> > + }, 
> > + /* GIC-400 */ { 
> > + .address = 0x1410000, 
> > + .pin_base = 160, 
> > + .pin_bitmap = { 
> > + 0, 
> > + 0, 
> > + 0, 
> > + 0, 
> > + }, 
> > + }, 
> > + }, 
> > + 
> > + .pci_devices = { 
> > + { /* IVSHMEM 00:00.0 (demo) */ 
> > + .type = JAILHOUSE_PCI_TYPE_IVSHMEM, 
> > + .domain = 0, 
> > + .bdf = 0 << 3, 
> > + .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX, 
> > + .shmem_regions_start = 0, 
> > + .shmem_dev_id = 1, 
> > + .shmem_peers = 1, 
> > + .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED, 
> > + }, 
> > + }, 
> > + 
> > +}; 
> > diff --git a/configs/arm64/ls1046a-rdb-linux-demo.c 
> b/configs/arm64/ls1046a-rdb-linux-demo.c 
> > new file mode 100644 
> > index 00000000..c8f699bb 
> > --- /dev/null 
> > +++ b/configs/arm64/ls1046a-rdb-linux-demo.c 
> > @@ -0,0 +1,165 @@ 
> > +/* 
> > + * ls1046a RDB target - linux-demo 
> > + * 
> > + * Copyright 2020 NXP 
> > + * 
> > + * Authors: 
> > + * Jiafei Pan <jiafe...@nxp.com> 
> > + * 
> > + * This work is licensed under the terms of the GNU GPL, version 2. See 
> > + * the COPYING file in the top-level directory. 
> > + */ 
> > + 
> > +#include <jailhouse/types.h> 
> > +#include <jailhouse/cell-config.h> 
> > + 
> > +struct { 
> > + struct jailhouse_cell_desc cell; 
> > + __u64 cpus[1]; 
> > + struct jailhouse_memory mem_regions[16]; 
> > + struct jailhouse_irqchip irqchips[2]; 
> > + struct jailhouse_pci_device pci_devices[2]; 
> > +} __attribute__((packed)) config = { 
> > + .cell = { 
> > + .signature = JAILHOUSE_CELL_DESC_SIGNATURE, 
> > + .revision = JAILHOUSE_CONFIG_REVISION, 
> > + .name = "linux-inmate-demo", 
> > + .flags = JAILHOUSE_CELL_PASSIVE_COMMREG, 
> > + 
> > + .cpu_set_size = sizeof(config.cpus), 
> > + .num_memory_regions = ARRAY_SIZE(config.mem_regions), 
> > + .num_irqchips = ARRAY_SIZE(config.irqchips), 
> > + .num_pci_devices = ARRAY_SIZE(config.pci_devices), 
> > + .vpci_irq_base = 60 - 32, /* vPCI INTx: 60,61,62,63 */ 
> > + }, 
> > + 
> > + .cpus = { 
> > + 0xc, 
> > + }, 
> > + 
> > + .mem_regions = { 
> > + /* IVHSMEM shared memory region for 00:00.0 */ { 
> > + .phys_start = 0xfb700000, 
> > + .virt_start = 0xfb700000, 
> > + .size = 0x1000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, 
> > + }, 
> > + { 
> > + .phys_start = 0xfb701000, 
> > + .virt_start = 0xfb701000, 
> > + .size = 0x9000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_ROOTSHARED, 
> > + }, 
> > + { 
> > + .phys_start = 0xfb70a000, 
> > + .virt_start = 0xfb70a000, 
> > + .size = 0x2000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, 
> > + }, 
> > + { 
> > + .phys_start = 0xfb70c000, 
> > + .virt_start = 0xfb70c000, 
> > + .size = 0x2000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, 
> > + }, 
> > + { 
> > + .phys_start = 0xfb70e000, 
> > + .virt_start = 0xfb70e000, 
> > + .size = 0x2000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_ROOTSHARED, 
> > + }, 
> > + /* IVSHMEM shared memory regions for 00:01.0 (networking) */ 
> > + JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 1), 
> > + /* DUART1 */ { 
> > + .phys_start = 0x21c0000, 
> > + .virt_start = 0x21c0000, 
> > + .size = 0x1000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED, 
> > + }, 
> > + /* clockgen */ { 
> > + .phys_start = 0x01ee1000, 
> > + .virt_start = 0x01ee1000, 
> > + .size = 0x1000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED, 
> > + }, 
> > + /* dcfg */ { 
> > + .phys_start = 0x01ee0000, 
> > + .virt_start = 0x01ee0000, 
> > + .size = 0x1000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* RAM */ { 
> > + .phys_start = 0xbf900000, 
> > + .virt_start = 0, 
> > + .size = 0x00010000, /* 64K */ 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE, 
> > + }, 
> > + /* RAM: Top at DRAM1 2GB Space */ { 
> > + .phys_start = 0xc0000000, 
> > + .virt_start = 0xc0000000, 
> > + .size = 0x3b500000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA | 
> > + JAILHOUSE_MEM_LOADABLE, 
> > + }, 
> > + /* communication region */ { 
> > + .virt_start = 0x80000000, 
> > + .size = 0x00001000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_COMM_REGION, 
> > + }, 
> > + }, 
> > + 
> > + .irqchips = { 
> > + /* GIC-400 */ { 
> > + .address = 0x1410000, 
> > + .pin_base = 32, 
> > + .pin_bitmap = { 
> > + 1 << (60 -32) | 1 << (61 - 32) | 
> > + 1 << (62 - 32) | 1 << (63 -32), /* vPCI */ 
> > + 0, 
> > + 0, 
> > + 0, 
> > + }, 
> > + }, 
> > + /* GIC-400 */ { 
> > + .address = 0x1410000, 
> > + .pin_base = 160, 
> > + .pin_bitmap = { 
> > + 0, 
> > + 0, 
> > + 0, 
> > + 0, 
> > + }, 
> > + }, 
> > + }, 
> > + 
> > + .pci_devices = { 
> > + { /* IVSHMEM 00:00.0 (demo) */ 
> > + .type = JAILHOUSE_PCI_TYPE_IVSHMEM, 
> > + .domain = 0, 
> > + .bdf = 0 << 3, 
> > + .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX, 
> > + .shmem_regions_start = 0, 
> > + .shmem_dev_id = 2, 
> > + .shmem_peers = 3, 
> > + .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED, 
> > + }, 
> > + { /* IVSHMEM 00:01.0 (networking) */ 
> > + .type = JAILHOUSE_PCI_TYPE_IVSHMEM, 
> > + .domain = 0, 
> > + .bdf = 1 << 3, 
> > + .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX, 
> > + .shmem_regions_start = 5, 
> > + .shmem_dev_id = 1, 
> > + .shmem_peers = 2, 
> > + .shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH, 
> > + }, 
> > + }, 
> > +}; 
> > diff --git a/configs/arm64/ls1046a-rdb.c b/configs/arm64/ls1046a-rdb.c 
> > new file mode 100644 
> > index 00000000..3eb58005 
> > --- /dev/null 
> > +++ b/configs/arm64/ls1046a-rdb.c 
> > @@ -0,0 +1,517 @@ 
> > +/* 
> > + * ls1046a RDB target - linux-demo 
> > + * 
> > + * Copyright 2020 NXP 
> > + * 
> > + * Authors: 
> > + * Jiafei Pan <jiafe...@nxp.com> 
> > + * 
> > + * This work is licensed under the terms of the GNU GPL, version 2. See 
> > + * the COPYING file in the top-level directory. 
> > + */ 
> > + 
> > +#include <jailhouse/types.h> 
> > +#include <jailhouse/cell-config.h> 
> > + 
> > +struct { 
> > + struct jailhouse_system header; 
> > + __u64 cpus[1]; 
> > + struct jailhouse_memory mem_regions[64]; 
> > + struct jailhouse_irqchip irqchips[2]; 
> > + struct jailhouse_pci_device pci_devices[2]; 
> > +} __attribute__((packed)) config = { 
> > + .header = { 
> > + .signature = JAILHOUSE_SYSTEM_SIGNATURE, 
> > + .revision = JAILHOUSE_CONFIG_REVISION, 
> > + .flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE, 
> > + .hypervisor_memory = { 
> > + .phys_start = 0xfba00000, 
> > + .size = 0x00400000, 
> > + }, 
> > + .debug_console = { 
> > + .address = 0x21c0500, /* Uart0 in DUART1 */ 
> > + .size = 0x100, 
> > + .type = JAILHOUSE_CON_TYPE_8250, 
> > + .flags = JAILHOUSE_CON_ACCESS_MMIO | 
> > + JAILHOUSE_CON_REGDIST_1, 
> > + }, 
> > + .platform_info = { 
> > + .pci_mmconfig_base = 0xfb500000, 
> > + .pci_mmconfig_end_bus = 0, 
> > + .pci_is_virtual = 1, 
> > + .pci_domain = -1, 
> > + 
> > + .arm = { 
> > + .gic_version = 2, 
> > + .gicd_base = 0x1410000, 
> > + .gicc_base = 0x142f000, 
> > + .gich_base = 0x1440000, 
> > + .gicv_base = 0x146f000, 
> > + .maintenance_irq = 25, 
> > + }, 
> > + }, 
> > + .root_cell = { 
> > + .name = "ls1046a", 
> > + .num_pci_devices = ARRAY_SIZE(config.pci_devices), 
> > + .cpu_set_size = sizeof(config.cpus), 
> > + .num_memory_regions = ARRAY_SIZE(config.mem_regions), 
> > + .num_irqchips = ARRAY_SIZE(config.irqchips), 
> > + .vpci_irq_base = 67 - 32, /* Not include 32 base */ 
> > + }, 
> > + }, 
> > + 
> > + .cpus = { 
> > + 0xf, 
> > + }, 
> > + 
> > + .mem_regions = { 
> > + /* IVHSMEM shared memory region for 00:00.0 */ { 
> > + .phys_start = 0xfb700000, 
> > + .virt_start = 0xfb700000, 
> > + .size = 0x1000, 
> > + .flags = JAILHOUSE_MEM_READ, 
> > + }, 
> > + { 
> > + .phys_start = 0xfb701000, 
> > + .virt_start = 0xfb701000, 
> > + .size = 0x9000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, 
> > + }, 
> > + { 
> > + .phys_start = 0xfb70a000, 
> > + .virt_start = 0xfb70a000, 
> > + .size = 0x2000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, 
> > + }, 
> > + { 
> > + .phys_start = 0xfb70c000, 
> > + .virt_start = 0xfb70c000, 
> > + .size = 0x2000, 
> > + .flags = JAILHOUSE_MEM_READ, 
> > + }, 
> > + { 
> > + .phys_start = 0xfb70e000, 
> > + .virt_start = 0xfb70e000, 
> > + .size = 0x2000, 
> > + .flags = JAILHOUSE_MEM_READ, 
> > + }, 
> > + /* IVSHMEM shared memory regions for 00:01.0 (networking) */ 
> > + JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 0), 
> > + /* RAM - 1GB at DRAM1 region - root cell */ { 
> > + .phys_start = 0x80000000, 
> > + .virt_start = 0x80000000, 
> > + .size = 0x40000000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_EXECUTE, 
> > + }, 
> > + /* DRAM2 6GB */ { 
> > + .phys_start = 0x880000000, 
> > + .virt_start = 0x880000000, 
> > + .size = 0x180000000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_EXECUTE, 
> > + }, 
> > + /* RAM: Inmate */ { 
> > + .phys_start = 0xc0000000, 
> > + .virt_start = 0xc0000000, 
> > + .size = 0x3b500000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_EXECUTE, 
> > + }, 
> > + /* RAM: loader */ { 
> > + .phys_start = 0xbf900000, 
> > + .virt_start = 0xbf900000, 
> > + .size = 0x00100000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_EXECUTE, 
> > + }, 
> > + /* DDR memory controller */ { 
> > + .phys_start = 0x01080000, 
> > + .virt_start = 0x01080000, 
> > + .size = 0x1000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* IFC */ { 
> > + .phys_start = 0x01530000, 
> > + .virt_start = 0x01530000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* QSPI */ { 
> > + .phys_start = 0x01550000, 
> > + .virt_start = 0x01550000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* esdhc */ { 
> > + .phys_start = 0x01560000, 
> > + .virt_start = 0x01560000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* scfg */ { 
> > + .phys_start = 0x01570000, 
> > + .virt_start = 0x01570000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* crypto */ { 
> > + .phys_start = 0x01700000, 
> > + .virt_start = 0x01700000, 
> > + .size = 0x100000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* qman */ { 
> > + .phys_start = 0x01880000, 
> > + .virt_start = 0x01880000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* bman */ { 
> > + .phys_start = 0x01890000, 
> > + .virt_start = 0x01890000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* fman */ { 
> > + .phys_start = 0x01a00000, 
> > + .virt_start = 0x01a00000, 
> > + .size = 0x100000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* qportals CE */ { 
> > + .phys_start = 0x500000000, 
> > + .virt_start = 0x500000000, 
> > + .size = 0x4000000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, 
> > + }, 
> > + /* qportals CI */ { 
> > + .phys_start = 0x504000000, 
> > + .virt_start = 0x504000000, 
> > + .size = 0x4000000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* bportals CE */ { 
> > + .phys_start = 0x508000000, 
> > + .virt_start = 0x508000000, 
> > + .size = 0x4000000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, 
> > + }, 
> > + /* bportals CI */ { 
> > + .phys_start = 0x50c000000, 
> > + .virt_start = 0x50c000000, 
> > + .size = 0x4000000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* dcfg */ { 
> > + .phys_start = 0x01ee0000, 
> > + .virt_start = 0x01ee0000, 
> > + .size = 0x1000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* clockgen */ { 
> > + .phys_start = 0x01ee1000, 
> > + .virt_start = 0x01ee1000, 
> > + .size = 0x1000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* rcpm */ { 
> > + .phys_start = 0x01ee2000, 
> > + .virt_start = 0x01ee2000, 
> > + .size = 0x1000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* tmu */ { 
> > + .phys_start = 0x01f00000, 
> > + .virt_start = 0x01f00000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* dspi */ { 
> > + .phys_start = 0x02100000, 
> > + .virt_start = 0x02100000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* i2c0 */ { 
> > + .phys_start = 0x02180000, 
> > + .virt_start = 0x02180000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* i2c1 */ { 
> > + .phys_start = 0x02190000, 
> > + .virt_start = 0x02190000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* i2c2 */ { 
> > + .phys_start = 0x021a0000, 
> > + .virt_start = 0x021a0000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* i2c3 */ { 
> > + .phys_start = 0x021b0000, 
> > + .virt_start = 0x021b0000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* duart1 */ { 
> > + .phys_start = 0x021c0000, 
> > + .virt_start = 0x021c0000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* duart2 */ { 
> > + .phys_start = 0x021d0000, 
> > + .virt_start = 0x021d0000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* gpio0 */ { 
> > + .phys_start = 0x02300000, 
> > + .virt_start = 0x02300000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* gpio1 */ { 
> > + .phys_start = 0x02310000, 
> > + .virt_start = 0x02310000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* gpio2 */ { 
> > + .phys_start = 0x02320000, 
> > + .virt_start = 0x02320000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* gpio3 */ { 
> > + .phys_start = 0x02330000, 
> > + .virt_start = 0x02330000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* lpuart0 */ { 
> > + .phys_start = 0x02950000, 
> > + .virt_start = 0x02950000, 
> > + .size = 0x1000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* lpuart1 */ { 
> > + .phys_start = 0x02960000, 
> > + .virt_start = 0x02960000, 
> > + .size = 0x1000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* lpuart2 */ { 
> > + .phys_start = 0x02970000, 
> > + .virt_start = 0x02970000, 
> > + .size = 0x1000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* lpuart3 */ { 
> > + .phys_start = 0x02980000, 
> > + .virt_start = 0x02980000, 
> > + .size = 0x1000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* lpuart4 */ { 
> > + .phys_start = 0x02990000, 
> > + .virt_start = 0x02990000, 
> > + .size = 0x1000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* lpuart5 */ { 
> > + .phys_start = 0x029a0000, 
> > + .virt_start = 0x029a0000, 
> > + .size = 0x1000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* wdog0 */ { 
> > + .phys_start = 0x02ad0000, 
> > + .virt_start = 0x02ad0000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* edma0 */ { 
> > + .phys_start = 0x02c00000, 
> > + .virt_start = 0x02c00000, 
> > + .size = 0x30000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* usb0 */ { 
> > + .phys_start = 0x02f00000, 
> > + .virt_start = 0x02f00000, 
> > + .size = 0x100000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* usb1 */ { 
> > + .phys_start = 0x03000000, 
> > + .virt_start = 0x03000000, 
> > + .size = 0x100000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* usb2 */ { 
> > + .phys_start = 0x03100000, 
> > + .virt_start = 0x03100000, 
> > + .size = 0x100000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* sata */ { 
> > + .phys_start = 0x03200000, 
> > + .virt_start = 0x03200000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* msi1 */ { 
> > + .phys_start = 0x01580000, 
> > + .virt_start = 0x01580000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* msi2 */ { 
> > + .phys_start = 0x01590000, 
> > + .virt_start = 0x01590000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* msi3 */ { 
> > + .phys_start = 0x015a0000, 
> > + .virt_start = 0x015a0000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* pcie0 */ { 
> > + .phys_start = 0x03400000, 
> > + .virt_start = 0x03400000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* pcie1 */ { 
> > + .phys_start = 0x03500000, 
> > + .virt_start = 0x03500000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* pcie2 */ { 
> > + .phys_start = 0x03600000, 
> > + .virt_start = 0x03600000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* pcie2 pf0 */ { 
> > + .phys_start = 0x036c0000, 
> > + .virt_start = 0x036c0000, 
> > + .size = 0x10000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* PCI host bridge 0 */ { 
> > + .phys_start = 0x4000000000, 
> > + .virt_start = 0x4000000000, 
> > + .size = 0x800000000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* PCI host bridge 1 */ { 
> > + .phys_start = 0x4800000000, 
> > + .virt_start = 0x4800000000, 
> > + .size = 0x800000000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + /* PCI host bridge 2 */ { 
> > + .phys_start = 0x5000000000, 
> > + .virt_start = 0x5000000000, 
> > + .size = 0x800000000, 
> > + .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
> > + JAILHOUSE_MEM_IO, 
> > + }, 
> > + }, 
> > + 
> > + .irqchips = { 
> > + /* GIC */ { 
> > + .address = 0x1410000, 
> > + .pin_base = 32, 
> > + .pin_bitmap = { 
> > + 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff 
> > + }, 
> > + }, 
> > + /* GIC */ { 
> > + .address = 0x1410000, 
> > + .pin_base = 160, 
> > + .pin_bitmap = { 
> > + 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff 
> > + }, 
> > + }, 
> > + }, 
> > + 
> > + .pci_devices = { 
> > + { /* IVSHMEM 00:00.0 (demo) */ 
> > + .type = JAILHOUSE_PCI_TYPE_IVSHMEM, 
> > + .domain = 0, 
> > + .bdf = 0 << 3, 
> > + .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX, 
> > + .shmem_regions_start = 0, 
> > + .shmem_dev_id = 0, 
> > + .shmem_peers = 3, 
> > + .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED, 
> > + }, 
> > + { /* IVSHMEM 00:01.0 (networking) */ 
> > + .type = JAILHOUSE_PCI_TYPE_IVSHMEM, 
> > + .domain = 0, 
> > + .bdf = 1 << 3, 
> > + .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX, 
> > + .shmem_regions_start = 5, 
> > + .shmem_dev_id = 0, 
> > + .shmem_peers = 2, 
> > + .shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH, 
> > + }, 
> > + }, 
> > +}; 
> > 
>
> You are missing the linux inmate dtb. 
>

Hi, Jan,

I am reusing the root cell dts: include root cell dts and then delete or 
modify some nodes,  so do you think we need to create a standalone dts for 
inmate cell? thanks.

Jiafei.
 

>
> Also, inmate-demo and linux-demo should not overlap in CPUs (if you have 
> >2) so that you can run three cells in parallel. 
>

Will update in next version, thanks.

Jiafei.
 

>
> Jan 
>
> -- 
> Siemens AG, T RDA IOT 
> Corporate Competence Center Embedded Linux 
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/09f76682-1c9d-4ddb-b8ca-3aab01218e47n%40googlegroups.com.

------=_Part_2677_1413229233.1606720778322
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">O=
n Monday, November 30, 2020 at 3:02:12 PM UTC+8 j.kiszka...@gmail.com wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; =
border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On 30.11.20 =
08:05, Jiafei Pan wrote:
<br>&gt; Add root cell, inmate cell, ivshmem demo cell and Linux demo cell
<br>&gt; configure files for NXP ls1046a RDB platform.
<br>&gt;=20
<br>&gt; Signed-off-by: Jiafei Pan &lt;<a href=3D"" data-email-masked=3D"" =
rel=3D"nofollow">Jiafe...@nxp.com</a>&gt;
<br>&gt; ---
<br>&gt;  configs/arm64/ls1046a-rdb-inmate-demo.c  |  67 +++
<br>&gt;  configs/arm64/ls1046a-rdb-ivshmem-demo.c | 142 +++++++
<br>&gt;  configs/arm64/ls1046a-rdb-linux-demo.c   | 165 ++++++++
<br>&gt;  configs/arm64/ls1046a-rdb.c              | 517 ++++++++++++++++++=
+++++
<br>&gt;  4 files changed, 891 insertions(+)
<br>&gt;  create mode 100644 configs/arm64/ls1046a-rdb-inmate-demo.c
<br>&gt;  create mode 100644 configs/arm64/ls1046a-rdb-ivshmem-demo.c
<br>&gt;  create mode 100644 configs/arm64/ls1046a-rdb-linux-demo.c
<br>&gt;  create mode 100644 configs/arm64/ls1046a-rdb.c
<br>&gt;=20
<br>&gt; diff --git a/configs/arm64/ls1046a-rdb-inmate-demo.c b/configs/arm=
64/ls1046a-rdb-inmate-demo.c
<br>&gt; new file mode 100644
<br>&gt; index 00000000..0f4f2395
<br>&gt; --- /dev/null
<br>&gt; +++ b/configs/arm64/ls1046a-rdb-inmate-demo.c
<br>&gt; @@ -0,0 +1,67 @@
<br>&gt; +/*
<br>&gt; + * ls1046a RDB - inmate demo
<br>&gt; + *
<br>&gt; + * Copyright NXP 2020
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jiafei Pan &lt;<a href=3D"" data-email-masked=3D"" rel=3D"nof=
ollow">jiafe...@nxp.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +#include &lt;jailhouse/types.h&gt;
<br>&gt; +#include &lt;jailhouse/cell-config.h&gt;
<br>&gt; +
<br>&gt; +struct {
<br>&gt; +	struct jailhouse_cell_desc cell;
<br>&gt; +	__u64 cpus[1];
<br>&gt; +	struct jailhouse_memory mem_regions[3];
<br>&gt; +} __attribute__((packed)) config =3D {
<br>&gt; +	.cell =3D {
<br>&gt; +		.signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
<br>&gt; +		.revision =3D JAILHOUSE_CONFIG_REVISION,
<br>&gt; +		.name =3D "inmate-demo",
<br>&gt; +		.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,
<br>&gt; +
<br>&gt; +		.cpu_set_size =3D sizeof(config.cpus),
<br>&gt; +		.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
<br>&gt; +		.num_irqchips =3D 0,
<br>&gt; +		.num_pci_devices =3D 0,
<br>&gt; +
<br>&gt; +		.console =3D {
<br>&gt; +			.address =3D 0x21c0600,	/* Uart1 in DUART1 */
<br>&gt; +			.divider =3D 0xbd, /* baudrate: 115200 */
<br>&gt; +			.type =3D JAILHOUSE_CON_TYPE_8250,
<br>&gt; +			.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
<br>&gt; +				JAILHOUSE_CON_REGDIST_1,
<br>&gt; +		},
<br>&gt; +	},
<br>&gt; +
<br>&gt; +	.cpus =3D {
<br>&gt; +		0x8,
<br>&gt; +	},
<br>&gt; +
<br>&gt; +	.mem_regions =3D {
<br>&gt; +		/* DUART1 */ {
<br>&gt; +			.phys_start =3D 0x21c0000,
<br>&gt; +			.virt_start =3D 0x21c0000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
<br>&gt; +		},
<br>&gt; +		/* RAM: Top at 2GB DRAM1 Space */ {
<br>&gt; +			.phys_start =3D 0xc0000000,
<br>&gt; +			.virt_start =3D 0,
<br>&gt; +			.size =3D 0x00010000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
<br>&gt; +		},
<br>&gt; +		/* communication region */ {
<br>&gt; +			.virt_start =3D 0x80000000,
<br>&gt; +			.size =3D 0x00001000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_COMM_REGION,
<br>&gt; +		},
<br>&gt; +	}
<br>&gt; +};
<br>&gt; diff --git a/configs/arm64/ls1046a-rdb-ivshmem-demo.c b/configs/ar=
m64/ls1046a-rdb-ivshmem-demo.c
<br>&gt; new file mode 100644
<br>&gt; index 00000000..907ba1f1
<br>&gt; --- /dev/null
<br>&gt; +++ b/configs/arm64/ls1046a-rdb-ivshmem-demo.c
<br>&gt; @@ -0,0 +1,142 @@
<br>&gt; +/*
<br>&gt; + * ls1046a RDB - ivshmem demo
<br>&gt; + *
<br>&gt; + * Copyright NXP 2020
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jiafei Pan &lt;<a href=3D"" data-email-masked=3D"" rel=3D"nof=
ollow">jiafe...@nxp.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +#include &lt;jailhouse/types.h&gt;
<br>&gt; +#include &lt;jailhouse/cell-config.h&gt;
<br>&gt; +
<br>&gt; +struct {
<br>&gt; +	struct jailhouse_cell_desc cell;
<br>&gt; +	__u64 cpus[1];
<br>&gt; +	struct jailhouse_memory mem_regions[8];
<br>&gt; +	struct jailhouse_irqchip irqchips[2];
<br>&gt; +	struct jailhouse_pci_device pci_devices[1];
<br>&gt; +} __attribute__((packed)) config =3D {
<br>&gt; +	.cell =3D {
<br>&gt; +		.signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
<br>&gt; +		.revision =3D JAILHOUSE_CONFIG_REVISION,
<br>&gt; +		.name =3D "ivshmem-demo",
<br>&gt; +		.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,
<br>&gt; +
<br>&gt; +		.cpu_set_size =3D sizeof(config.cpus),
<br>&gt; +		.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
<br>&gt; +		.num_irqchips =3D ARRAY_SIZE(config.irqchips),
<br>&gt; +		.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
<br>&gt; +		.vpci_irq_base =3D 60 - 32,	/* vPCI INTx */
<br>&gt; +
<br>&gt; +		.console =3D {
<br>&gt; +			.address =3D 0x21c0600,	/* Uart1 in DUART1 */
<br>&gt; +			.divider =3D 0xbd, /* baudrate: 115200 */
<br>&gt; +			.type =3D JAILHOUSE_CON_TYPE_8250,
<br>&gt; +			.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
<br>&gt; +				JAILHOUSE_CON_REGDIST_1,
<br>&gt; +		},
<br>&gt; +	},
<br>&gt; +
<br>&gt; +	.cpus =3D {
<br>&gt; +		0x8,
<br>&gt; +	},
<br>&gt; +
<br>&gt; +	.mem_regions =3D {
<br>&gt; +		/* IVHSMEM shared memory region for 00:00.0 */ {
<br>&gt; +			.phys_start =3D 0xfb700000,
<br>&gt; +			.virt_start =3D 0xfb700000,
<br>&gt; +			.size =3D 0x1000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
<br>&gt; +		},
<br>&gt; +		{
<br>&gt; +			.phys_start =3D 0xfb701000,
<br>&gt; +			.virt_start =3D 0xfb701000,
<br>&gt; +			.size =3D 0x9000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_ROOTSHARED,
<br>&gt; +		},
<br>&gt; +		{
<br>&gt; +			.phys_start =3D 0xfb70a000,
<br>&gt; +			.virt_start =3D 0xfb70a000,
<br>&gt; +			.size =3D 0x2000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
<br>&gt; +		},
<br>&gt; +		{
<br>&gt; +			.phys_start =3D 0xfb70c000,
<br>&gt; +			.virt_start =3D 0xfb70c000,
<br>&gt; +			.size =3D 0x2000,
<br>&gt; +			//.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_ROOTSHARED,
<br>&gt; +		},
<br>&gt; +		{
<br>&gt; +			.phys_start =3D 0xfb70e000,
<br>&gt; +			.virt_start =3D 0xfb70e000,
<br>&gt; +			.size =3D 0x2000,
<br>&gt; +			//.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +			//	JAILHOUSE_MEM_ROOTSHARED,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
<br>&gt; +		},
<br>&gt; +		/* DUART1 */ {
<br>&gt; +			.phys_start =3D 0x21c0000,
<br>&gt; +			.virt_start =3D 0x21c0000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
<br>&gt; +		},
<br>&gt; +		/* RAM: Top at 4GB Space */ {
<br>&gt; +			.phys_start =3D 0xc0000000,
<br>&gt; +			.virt_start =3D 0,
<br>&gt; +			.size =3D 0x00010000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
<br>&gt; +		},
<br>&gt; +		/* communication region */ {
<br>&gt; +			.virt_start =3D 0x80000000,
<br>&gt; +			.size =3D 0x00001000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_COMM_REGION,
<br>&gt; +		},
<br>&gt; +	},
<br>&gt; +
<br>&gt; +	.irqchips =3D {
<br>&gt; +		/* GIC-400 */ {
<br>&gt; +			.address =3D 0x1410000,
<br>&gt; +			.pin_base =3D 32,
<br>&gt; +			.pin_bitmap =3D {
<br>&gt; +				1 &lt;&lt; (60 - 32), /* vPCI */
<br>&gt; +				0,
<br>&gt; +				0,
<br>&gt; +				0,
<br>&gt; +			},
<br>&gt; +		},
<br>&gt; +		/* GIC-400 */ {
<br>&gt; +			.address =3D 0x1410000,
<br>&gt; +			.pin_base =3D 160,
<br>&gt; +			.pin_bitmap =3D {
<br>&gt; +				0,
<br>&gt; +				0,
<br>&gt; +				0,
<br>&gt; +				0,
<br>&gt; +			},
<br>&gt; +		},
<br>&gt; +	},
<br>&gt; +
<br>&gt; +	.pci_devices =3D {
<br>&gt; +		{ /* IVSHMEM 00:00.0 (demo) */
<br>&gt; +			.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
<br>&gt; +			.domain =3D 0,
<br>&gt; +			.bdf =3D 0 &lt;&lt; 3,
<br>&gt; +			.bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
<br>&gt; +			.shmem_regions_start =3D 0,
<br>&gt; +			.shmem_dev_id =3D 1,
<br>&gt; +			.shmem_peers =3D 1,
<br>&gt; +			.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
<br>&gt; +		},
<br>&gt; +	},
<br>&gt; +
<br>&gt; +};
<br>&gt; diff --git a/configs/arm64/ls1046a-rdb-linux-demo.c b/configs/arm6=
4/ls1046a-rdb-linux-demo.c
<br>&gt; new file mode 100644
<br>&gt; index 00000000..c8f699bb
<br>&gt; --- /dev/null
<br>&gt; +++ b/configs/arm64/ls1046a-rdb-linux-demo.c
<br>&gt; @@ -0,0 +1,165 @@
<br>&gt; +/*
<br>&gt; + * ls1046a RDB target - linux-demo
<br>&gt; + *
<br>&gt; + * Copyright 2020 NXP
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jiafei Pan &lt;<a href=3D"" data-email-masked=3D"" rel=3D"nof=
ollow">jiafe...@nxp.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +#include &lt;jailhouse/types.h&gt;
<br>&gt; +#include &lt;jailhouse/cell-config.h&gt;
<br>&gt; +
<br>&gt; +struct {
<br>&gt; +	struct jailhouse_cell_desc cell;
<br>&gt; +	__u64 cpus[1];
<br>&gt; +	struct jailhouse_memory mem_regions[16];
<br>&gt; +	struct jailhouse_irqchip irqchips[2];
<br>&gt; +	struct jailhouse_pci_device pci_devices[2];
<br>&gt; +} __attribute__((packed)) config =3D {
<br>&gt; +	.cell =3D {
<br>&gt; +		.signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
<br>&gt; +		.revision =3D JAILHOUSE_CONFIG_REVISION,
<br>&gt; +		.name =3D "linux-inmate-demo",
<br>&gt; +		.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,
<br>&gt; +
<br>&gt; +		.cpu_set_size =3D sizeof(config.cpus),
<br>&gt; +		.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
<br>&gt; +		.num_irqchips =3D ARRAY_SIZE(config.irqchips),
<br>&gt; +		.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
<br>&gt; +		.vpci_irq_base =3D 60 - 32,  /* vPCI INTx: 60,61,62,63 */
<br>&gt; +	},
<br>&gt; +
<br>&gt; +	.cpus =3D {
<br>&gt; +		0xc,
<br>&gt; +	},
<br>&gt; +
<br>&gt; +	.mem_regions =3D {
<br>&gt; +		/* IVHSMEM shared memory region for 00:00.0 */ {
<br>&gt; +			.phys_start =3D 0xfb700000,
<br>&gt; +			.virt_start =3D 0xfb700000,
<br>&gt; +			.size =3D 0x1000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
<br>&gt; +		},
<br>&gt; +		{
<br>&gt; +			.phys_start =3D 0xfb701000,
<br>&gt; +			.virt_start =3D 0xfb701000,
<br>&gt; +			.size =3D 0x9000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_ROOTSHARED,
<br>&gt; +		},
<br>&gt; +		{
<br>&gt; +			.phys_start =3D 0xfb70a000,
<br>&gt; +			.virt_start =3D 0xfb70a000,
<br>&gt; +			.size =3D 0x2000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
<br>&gt; +		},
<br>&gt; +		{
<br>&gt; +			.phys_start =3D 0xfb70c000,
<br>&gt; +			.virt_start =3D 0xfb70c000,
<br>&gt; +			.size =3D 0x2000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
<br>&gt; +		},
<br>&gt; +		{
<br>&gt; +			.phys_start =3D 0xfb70e000,
<br>&gt; +			.virt_start =3D 0xfb70e000,
<br>&gt; +			.size =3D 0x2000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_ROOTSHARED,
<br>&gt; +		},
<br>&gt; +		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
<br>&gt; +		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 1),
<br>&gt; +		/* DUART1 */ {
<br>&gt; +			.phys_start =3D 0x21c0000,
<br>&gt; +			.virt_start =3D 0x21c0000,
<br>&gt; +			.size =3D 0x1000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
<br>&gt; +		},
<br>&gt; +		/* clockgen */ {
<br>&gt; +                        .phys_start =3D 0x01ee1000,
<br>&gt; +                        .virt_start =3D 0x01ee1000,
<br>&gt; +                        .size =3D 0x1000,
<br>&gt; +                        .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE=
_MEM_WRITE |
<br>&gt; +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_=
ROOTSHARED,
<br>&gt; +                },
<br>&gt; +		/* dcfg */ {
<br>&gt; +			.phys_start =3D 0x01ee0000,
<br>&gt; +			.virt_start =3D 0x01ee0000,
<br>&gt; +			.size =3D 0x1000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* RAM */ {
<br>&gt; +			.phys_start =3D 0xbf900000,
<br>&gt; +			.virt_start =3D 0,
<br>&gt; +			.size =3D 0x00010000, /* 64K */
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
<br>&gt; +		},
<br>&gt; +		/* RAM: Top at DRAM1 2GB Space */ {
<br>&gt; +			.phys_start =3D 0xc0000000,
<br>&gt; +			.virt_start =3D 0xc0000000,
<br>&gt; +			.size =3D 0x3b500000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
<br>&gt; +				JAILHOUSE_MEM_LOADABLE,
<br>&gt; +		},
<br>&gt; +		/* communication region */ {
<br>&gt; +			.virt_start =3D 0x80000000,
<br>&gt; +			.size =3D 0x00001000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_COMM_REGION,
<br>&gt; +		},
<br>&gt; +	},
<br>&gt; +
<br>&gt; +	.irqchips =3D {
<br>&gt; +		/* GIC-400 */ {
<br>&gt; +			.address =3D 0x1410000,
<br>&gt; +			.pin_base =3D 32,
<br>&gt; +			.pin_bitmap =3D {
<br>&gt; +				1 &lt;&lt; (60 -32)  | 1 &lt;&lt; (61 - 32) |
<br>&gt; +					1 &lt;&lt; (62 - 32) | 1 &lt;&lt; (63 -32), /* vPCI */
<br>&gt; +				0,
<br>&gt; +				0,
<br>&gt; +				0,
<br>&gt; +			},
<br>&gt; +		},
<br>&gt; +		/* GIC-400 */ {
<br>&gt; +			.address =3D 0x1410000,
<br>&gt; +			.pin_base =3D 160,
<br>&gt; +			.pin_bitmap =3D {
<br>&gt; +				0,
<br>&gt; +				0,
<br>&gt; +				0,
<br>&gt; +				0,
<br>&gt; +			},
<br>&gt; +		},
<br>&gt; +	},
<br>&gt; +
<br>&gt; +	.pci_devices =3D {
<br>&gt; +		{ /* IVSHMEM 00:00.0 (demo) */
<br>&gt; +			.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
<br>&gt; +			.domain =3D 0,
<br>&gt; +			.bdf =3D 0 &lt;&lt; 3,
<br>&gt; +			.bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
<br>&gt; +			.shmem_regions_start =3D 0,
<br>&gt; +			.shmem_dev_id =3D 2,
<br>&gt; +			.shmem_peers =3D 3,
<br>&gt; +			.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
<br>&gt; +		},
<br>&gt; +		{ /* IVSHMEM 00:01.0 (networking) */
<br>&gt; +			.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
<br>&gt; +			.domain =3D 0,
<br>&gt; +			.bdf =3D 1 &lt;&lt; 3,
<br>&gt; +			.bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
<br>&gt; +			.shmem_regions_start =3D 5,
<br>&gt; +			.shmem_dev_id =3D 1,
<br>&gt; +			.shmem_peers =3D 2,
<br>&gt; +			.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
<br>&gt; +		},
<br>&gt; +	},
<br>&gt; +};
<br>&gt; diff --git a/configs/arm64/ls1046a-rdb.c b/configs/arm64/ls1046a-r=
db.c
<br>&gt; new file mode 100644
<br>&gt; index 00000000..3eb58005
<br>&gt; --- /dev/null
<br>&gt; +++ b/configs/arm64/ls1046a-rdb.c
<br>&gt; @@ -0,0 +1,517 @@
<br>&gt; +/*
<br>&gt; + * ls1046a RDB target - linux-demo
<br>&gt; + *
<br>&gt; + * Copyright 2020 NXP
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jiafei Pan &lt;<a href=3D"" data-email-masked=3D"" rel=3D"nof=
ollow">jiafe...@nxp.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +#include &lt;jailhouse/types.h&gt;
<br>&gt; +#include &lt;jailhouse/cell-config.h&gt;
<br>&gt; +
<br>&gt; +struct {
<br>&gt; +	struct jailhouse_system header;
<br>&gt; +	__u64 cpus[1];
<br>&gt; +	struct jailhouse_memory mem_regions[64];
<br>&gt; +	struct jailhouse_irqchip irqchips[2];
<br>&gt; +	struct jailhouse_pci_device pci_devices[2];
<br>&gt; +} __attribute__((packed)) config =3D {
<br>&gt; +	.header =3D {
<br>&gt; +		.signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
<br>&gt; +		.revision =3D JAILHOUSE_CONFIG_REVISION,
<br>&gt; +		.flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
<br>&gt; +		.hypervisor_memory =3D {
<br>&gt; +			.phys_start =3D 0xfba00000,
<br>&gt; +			.size =3D       0x00400000,
<br>&gt; +		},
<br>&gt; +		.debug_console =3D {
<br>&gt; +			.address =3D 0x21c0500, /* Uart0 in DUART1 */
<br>&gt; +			.size =3D 0x100,
<br>&gt; +			.type =3D JAILHOUSE_CON_TYPE_8250,
<br>&gt; +			.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
<br>&gt; +				 JAILHOUSE_CON_REGDIST_1,
<br>&gt; +		},
<br>&gt; +		.platform_info =3D {
<br>&gt; +			.pci_mmconfig_base =3D 0xfb500000,
<br>&gt; +			.pci_mmconfig_end_bus =3D 0,
<br>&gt; +			.pci_is_virtual =3D 1,
<br>&gt; +			.pci_domain =3D -1,
<br>&gt; +
<br>&gt; +			.arm =3D {
<br>&gt; +				.gic_version =3D 2,
<br>&gt; +				.gicd_base =3D 0x1410000,
<br>&gt; +				.gicc_base =3D 0x142f000,
<br>&gt; +				.gich_base =3D 0x1440000,
<br>&gt; +				.gicv_base =3D 0x146f000,
<br>&gt; +				.maintenance_irq =3D 25,
<br>&gt; +			},
<br>&gt; +		},
<br>&gt; +		.root_cell =3D {
<br>&gt; +			.name =3D "ls1046a",
<br>&gt; +			.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
<br>&gt; +			.cpu_set_size =3D sizeof(config.cpus),
<br>&gt; +			.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
<br>&gt; +			.num_irqchips =3D ARRAY_SIZE(config.irqchips),
<br>&gt; +			.vpci_irq_base =3D 67 - 32, /* Not include 32 base */
<br>&gt; +		},
<br>&gt; +	},
<br>&gt; +
<br>&gt; +	.cpus =3D {
<br>&gt; +		0xf,
<br>&gt; +	},
<br>&gt; +
<br>&gt; +	.mem_regions =3D {
<br>&gt; +		/* IVHSMEM shared memory region for 00:00.0 */ {
<br>&gt; +			.phys_start =3D 0xfb700000,
<br>&gt; +			.virt_start =3D 0xfb700000,
<br>&gt; +			.size =3D 0x1000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ,
<br>&gt; +		},
<br>&gt; +		{
<br>&gt; +			.phys_start =3D 0xfb701000,
<br>&gt; +			.virt_start =3D 0xfb701000,
<br>&gt; +			.size =3D 0x9000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt; +		},
<br>&gt; +		{
<br>&gt; +			.phys_start =3D 0xfb70a000,
<br>&gt; +			.virt_start =3D 0xfb70a000,
<br>&gt; +			.size =3D 0x2000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt; +		},
<br>&gt; +		{
<br>&gt; +			.phys_start =3D 0xfb70c000,
<br>&gt; +			.virt_start =3D 0xfb70c000,
<br>&gt; +			.size =3D 0x2000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ,
<br>&gt; +		},
<br>&gt; +		{
<br>&gt; +			.phys_start =3D 0xfb70e000,
<br>&gt; +			.virt_start =3D 0xfb70e000,
<br>&gt; +			.size =3D 0x2000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ,
<br>&gt; +		},
<br>&gt; +		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
<br>&gt; +		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 0),
<br>&gt; +		/* RAM - 1GB at DRAM1 region - root cell */ {
<br>&gt; +			.phys_start =3D 0x80000000,
<br>&gt; +			.virt_start =3D 0x80000000,
<br>&gt; +			.size =3D 0x40000000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_EXECUTE,
<br>&gt; +		},
<br>&gt; +		/* DRAM2 6GB */ {
<br>&gt; +			.phys_start =3D 0x880000000,
<br>&gt; +			.virt_start =3D 0x880000000,
<br>&gt; +			.size =3D 0x180000000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_EXECUTE,
<br>&gt; +		},
<br>&gt; +		/* RAM: Inmate */ {
<br>&gt; +			.phys_start =3D 0xc0000000,
<br>&gt; +			.virt_start =3D 0xc0000000,
<br>&gt; +			.size =3D 0x3b500000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_EXECUTE,
<br>&gt; +		},
<br>&gt; +		/* RAM: loader */ {
<br>&gt; +			.phys_start =3D 0xbf900000,
<br>&gt; +			.virt_start =3D 0xbf900000,
<br>&gt; +			.size =3D 0x00100000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_EXECUTE,
<br>&gt; +		},
<br>&gt; +		/* DDR memory controller */ {
<br>&gt; +			.phys_start =3D 0x01080000,
<br>&gt; +			.virt_start =3D 0x01080000,
<br>&gt; +			.size =3D	          0x1000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* IFC */ {
<br>&gt; +			.phys_start =3D 0x01530000,
<br>&gt; +			.virt_start =3D 0x01530000,
<br>&gt; +			.size =3D	         0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* QSPI */ {
<br>&gt; +			.phys_start =3D 0x01550000,
<br>&gt; +			.virt_start =3D 0x01550000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* esdhc */ {
<br>&gt; +			.phys_start =3D 0x01560000,
<br>&gt; +			.virt_start =3D 0x01560000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* scfg */ {
<br>&gt; +			.phys_start =3D 0x01570000,
<br>&gt; +			.virt_start =3D 0x01570000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* crypto */ {
<br>&gt; +			.phys_start =3D 0x01700000,
<br>&gt; +			.virt_start =3D 0x01700000,
<br>&gt; +			.size =3D 0x100000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* qman */ {
<br>&gt; +			.phys_start =3D 0x01880000,
<br>&gt; +			.virt_start =3D 0x01880000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +                /* bman */ {
<br>&gt; +                        .phys_start =3D 0x01890000,
<br>&gt; +                        .virt_start =3D 0x01890000,
<br>&gt; +                        .size =3D 0x10000,
<br>&gt; +                        .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE=
_MEM_WRITE |
<br>&gt; +                                JAILHOUSE_MEM_IO,
<br>&gt; +                },
<br>&gt; +		/* fman */ {
<br>&gt; +			.phys_start =3D 0x01a00000,
<br>&gt; +			.virt_start =3D 0x01a00000,
<br>&gt; +			.size =3D 0x100000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* qportals CE */ {
<br>&gt; +			.phys_start =3D 0x500000000,
<br>&gt; +			.virt_start =3D 0x500000000,
<br>&gt; +			.size =3D 0x4000000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt; +		},
<br>&gt; +		/* qportals CI */ {
<br>&gt; +			.phys_start =3D 0x504000000,
<br>&gt; +			.virt_start =3D 0x504000000,
<br>&gt; +			.size =3D 0x4000000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* bportals CE */ {
<br>&gt; +			.phys_start =3D 0x508000000,
<br>&gt; +			.virt_start =3D 0x508000000,
<br>&gt; +			.size =3D 0x4000000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt; +		},
<br>&gt; +		/* bportals CI */ {
<br>&gt; +			.phys_start =3D 0x50c000000,
<br>&gt; +			.virt_start =3D 0x50c000000,
<br>&gt; +			.size =3D 0x4000000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* dcfg */ {
<br>&gt; +			.phys_start =3D 0x01ee0000,
<br>&gt; +			.virt_start =3D 0x01ee0000,
<br>&gt; +			.size =3D 0x1000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +                /* clockgen */ {
<br>&gt; +                        .phys_start =3D 0x01ee1000,
<br>&gt; +                        .virt_start =3D 0x01ee1000,
<br>&gt; +                        .size =3D 0x1000,
<br>&gt; +                        .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE=
_MEM_WRITE |
<br>&gt; +                                JAILHOUSE_MEM_IO,
<br>&gt; +                },
<br>&gt; +		/* rcpm */ {
<br>&gt; +			.phys_start =3D 0x01ee2000,
<br>&gt; +			.virt_start =3D 0x01ee2000,
<br>&gt; +			.size =3D 0x1000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* tmu */ {
<br>&gt; +			.phys_start =3D 0x01f00000,
<br>&gt; +			.virt_start =3D 0x01f00000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* dspi */ {
<br>&gt; +			.phys_start =3D 0x02100000,
<br>&gt; +			.virt_start =3D 0x02100000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* i2c0 */ {
<br>&gt; +			.phys_start =3D 0x02180000,
<br>&gt; +			.virt_start =3D 0x02180000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* i2c1 */ {
<br>&gt; +			.phys_start =3D 0x02190000,
<br>&gt; +			.virt_start =3D 0x02190000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* i2c2 */ {
<br>&gt; +			.phys_start =3D 0x021a0000,
<br>&gt; +			.virt_start =3D 0x021a0000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* i2c3 */ {
<br>&gt; +			.phys_start =3D 0x021b0000,
<br>&gt; +			.virt_start =3D 0x021b0000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* duart1 */ {
<br>&gt; +			.phys_start =3D 0x021c0000,
<br>&gt; +			.virt_start =3D 0x021c0000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* duart2 */ {
<br>&gt; +			.phys_start =3D 0x021d0000,
<br>&gt; +			.virt_start =3D 0x021d0000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* gpio0 */ {
<br>&gt; +			.phys_start =3D 0x02300000,
<br>&gt; +			.virt_start =3D 0x02300000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* gpio1 */ {
<br>&gt; +			.phys_start =3D 0x02310000,
<br>&gt; +			.virt_start =3D 0x02310000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* gpio2 */ {
<br>&gt; +			.phys_start =3D 0x02320000,
<br>&gt; +			.virt_start =3D 0x02320000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* gpio3 */ {
<br>&gt; +			.phys_start =3D 0x02330000,
<br>&gt; +			.virt_start =3D 0x02330000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* lpuart0 */ {
<br>&gt; +			.phys_start =3D 0x02950000,
<br>&gt; +			.virt_start =3D 0x02950000,
<br>&gt; +			.size =3D 0x1000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* lpuart1 */ {
<br>&gt; +			.phys_start =3D 0x02960000,
<br>&gt; +			.virt_start =3D 0x02960000,
<br>&gt; +			.size =3D 0x1000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* lpuart2 */ {
<br>&gt; +			.phys_start =3D 0x02970000,
<br>&gt; +			.virt_start =3D 0x02970000,
<br>&gt; +			.size =3D 0x1000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* lpuart3 */ {
<br>&gt; +			.phys_start =3D 0x02980000,
<br>&gt; +			.virt_start =3D 0x02980000,
<br>&gt; +			.size =3D 0x1000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* lpuart4 */ {
<br>&gt; +			.phys_start =3D 0x02990000,
<br>&gt; +			.virt_start =3D 0x02990000,
<br>&gt; +			.size =3D 0x1000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* lpuart5 */ {
<br>&gt; +			.phys_start =3D 0x029a0000,
<br>&gt; +			.virt_start =3D 0x029a0000,
<br>&gt; +			.size =3D 0x1000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* wdog0 */ {
<br>&gt; +			.phys_start =3D 0x02ad0000,
<br>&gt; +			.virt_start =3D 0x02ad0000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* edma0 */ {
<br>&gt; +			.phys_start =3D 0x02c00000,
<br>&gt; +			.virt_start =3D 0x02c00000,
<br>&gt; +			.size =3D 0x30000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* usb0 */ {
<br>&gt; +			.phys_start =3D 0x02f00000,
<br>&gt; +			.virt_start =3D 0x02f00000,
<br>&gt; +			.size =3D 0x100000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* usb1 */ {
<br>&gt; +			.phys_start =3D 0x03000000,
<br>&gt; +			.virt_start =3D 0x03000000,
<br>&gt; +			.size =3D 0x100000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* usb2 */ {
<br>&gt; +			.phys_start =3D 0x03100000,
<br>&gt; +			.virt_start =3D 0x03100000,
<br>&gt; +			.size =3D 0x100000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* sata */ {
<br>&gt; +			.phys_start =3D 0x03200000,
<br>&gt; +			.virt_start =3D 0x03200000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* msi1 */ {
<br>&gt; +			.phys_start =3D 0x01580000,
<br>&gt; +			.virt_start =3D 0x01580000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* msi2 */ {
<br>&gt; +			.phys_start =3D 0x01590000,
<br>&gt; +			.virt_start =3D 0x01590000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* msi3 */ {
<br>&gt; +			.phys_start =3D 0x015a0000,
<br>&gt; +			.virt_start =3D 0x015a0000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* pcie0 */ {
<br>&gt; +			.phys_start =3D 0x03400000,
<br>&gt; +			.virt_start =3D 0x03400000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* pcie1 */ {
<br>&gt; +			.phys_start =3D 0x03500000,
<br>&gt; +			.virt_start =3D 0x03500000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* pcie2 */ {
<br>&gt; +			.phys_start =3D 0x03600000,
<br>&gt; +			.virt_start =3D 0x03600000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* pcie2 pf0 */ {
<br>&gt; +			.phys_start =3D 0x036c0000,
<br>&gt; +			.virt_start =3D 0x036c0000,
<br>&gt; +			.size =3D 0x10000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* PCI host bridge 0 */ {
<br>&gt; +			.phys_start =3D 0x4000000000,
<br>&gt; +			.virt_start =3D 0x4000000000,
<br>&gt; +			.size =3D 0x800000000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* PCI host bridge 1 */ {
<br>&gt; +			.phys_start =3D 0x4800000000,
<br>&gt; +			.virt_start =3D 0x4800000000,
<br>&gt; +			.size =3D 0x800000000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +		/* PCI host bridge 2 */ {
<br>&gt; +			.phys_start =3D 0x5000000000,
<br>&gt; +			.virt_start =3D 0x5000000000,
<br>&gt; +			.size =3D 0x800000000,
<br>&gt; +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; +				JAILHOUSE_MEM_IO,
<br>&gt; +		},
<br>&gt; +	},
<br>&gt; +
<br>&gt; +	.irqchips =3D {
<br>&gt; +		/* GIC */ {
<br>&gt; +			.address =3D 0x1410000,
<br>&gt; +			.pin_base =3D 32,
<br>&gt; +			.pin_bitmap =3D {
<br>&gt; +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
<br>&gt; +			},
<br>&gt; +		},
<br>&gt; +		/* GIC */ {
<br>&gt; +			.address =3D 0x1410000,
<br>&gt; +			.pin_base =3D 160,
<br>&gt; +			.pin_bitmap =3D {
<br>&gt; +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
<br>&gt; +			},
<br>&gt; +		},
<br>&gt; +	},
<br>&gt; +
<br>&gt; +	.pci_devices =3D {
<br>&gt; +		{ /* IVSHMEM 00:00.0 (demo) */
<br>&gt; +			.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
<br>&gt; +			.domain =3D 0,
<br>&gt; +			.bdf =3D 0 &lt;&lt; 3,
<br>&gt; +			.bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
<br>&gt; +			.shmem_regions_start =3D 0,
<br>&gt; +			.shmem_dev_id =3D 0,
<br>&gt; +			.shmem_peers =3D 3,
<br>&gt; +			.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
<br>&gt; +		},
<br>&gt; +		{ /* IVSHMEM 00:01.0 (networking) */
<br>&gt; +			.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
<br>&gt; +			.domain =3D 0,
<br>&gt; +			.bdf =3D 1 &lt;&lt; 3,
<br>&gt; +			.bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
<br>&gt; +			.shmem_regions_start =3D 5,
<br>&gt; +			.shmem_dev_id =3D 0,
<br>&gt; +			.shmem_peers =3D 2,
<br>&gt; +			.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
<br>&gt; +		},
<br>&gt; +	},
<br>&gt; +};
<br>&gt;=20
<br>
<br>You are missing the linux inmate dtb.
<br></blockquote><div><br></div><div>Hi, Jan,</div><div><br></div><div>I am=
 reusing the root cell dts: include root cell dts and then delete or modify=
 some nodes,&nbsp; so do you think we need to create a standalone dts for i=
nmate cell? thanks.</div><div><br></div><div>Jiafei.</div><div>&nbsp;</div>=
<blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left=
: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>Also, inmate-demo and linux-demo should not overlap in CPUs (if you hav=
e
<br>&gt;2) so that you can run three cells in parallel.
<br></blockquote><div><br></div><div>Will update in next version, thanks.</=
div><div><br></div><div>Jiafei.</div><div>&nbsp;</div><blockquote class=3D"=
gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, =
204, 204); padding-left: 1ex;">
<br>Jan
<br>
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
om/d/msgid/jailhouse-dev/09f76682-1c9d-4ddb-b8ca-3aab01218e47n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/09f76682-1c9d-4ddb-b8ca-3aab01218e47n%40googlegroups.co=
m</a>.<br />

------=_Part_2677_1413229233.1606720778322--

------=_Part_2676_571058821.1606720778322--
