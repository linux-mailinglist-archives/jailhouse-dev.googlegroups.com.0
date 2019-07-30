Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBP6MQDVAKGQE6RSD3II@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33f.google.com (mail-ot1-x33f.google.com [IPv6:2607:f8b0:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id D54327A6AF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 13:13:04 +0200 (CEST)
Received: by mail-ot1-x33f.google.com with SMTP id e103sf35649363ote.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 04:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vA9LAlfWB+z8Su1fgJtCS8/luE7bkraQZw9pFXlCIbw=;
        b=T4v1ZDWKPS1+Bq1TL7LgdRTPj1r8aBddBXA70CIQrjlV23xaMHaN7EXyBrZDdEcfvp
         1P/M+QIuz/jCY1mN6Snq7Jpk2kaKlKpQuCGIcIvh1nQAQCfdGUe9bwGHVDMi9wz4ugrT
         Q/LCzyvXFrxwCAIJolVWNU40Qs2AYFbL2FCvy+sSGiiWYndSpQnOpqMrqWDWJmidR84+
         M2ZILJmAmChoR+cZtX4TRi26URhB7hwwouB/MsQfUZWNZDvsw/yLmSdo9Q8QLnBQtDYv
         8JzhSQFh5NwZLGjRASS165wiZxMw7c1M5wbGe+tvsUUDN3o7t/YElJEYW8D3kc7xmzbL
         jCJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vA9LAlfWB+z8Su1fgJtCS8/luE7bkraQZw9pFXlCIbw=;
        b=R1OHLofrppnqdL7ifQJjlEXpc/+fWNwNXtX8rD2bzeGCcmKJog3peTyoBECmy4Nr9m
         cQ9uxN2NXaluxv32buLKzHN9G6B7yl0ZVk8haCD/vS+y/SKOdrHVo7llZ7FXDTSTUqsd
         bVK+X54eWCWxDWsI4p8rvYNO23+NlL9clsFIdlMjV7mL5hWvXxFsnBQKGqwEwfhgZ8Ft
         CuTrfCoq8SZdhLl+2vTIusAkYfmJ9BG1B6LD75sj/bvyFMN08yunKFxm5AKAr6nWkmkE
         j1pxO8wUZexTze1F4Ri3ctpaIZuni6AJwZA74tKqp6BkyNcVdXKKzkR6Q6sh8onJm8TU
         67RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vA9LAlfWB+z8Su1fgJtCS8/luE7bkraQZw9pFXlCIbw=;
        b=cVksFYqJwG9aBPT+hUycojshD+U/GbF1C15VsSGFBCzgRSJvdAuEJuVxBrWQgqtsZU
         7h5QqHO0aqibZJ9og6kCweA/4NF5ARwTnE0nkkvd9O3DKBrzVWgYTPZTuZ1ByD9SyS1V
         4SM0l47MwbbYBhAB7j7qekwk2O99VaYYp+V6xvfqGy8fulf5k966bPudk+RLDXFCB99S
         6deEPvHOa/pwv/vMaogcO4CMKLaRg2JqHianoaCqMW+Yfw0g9Z01z9DXFviudG1Zi1K2
         4AFUKz+aM7fZnrQIBRi1NUSJ06kNwKiRZwacgqzB7qKQQXcs22xu/0YxqDSSxz0seyql
         GDZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV8TzzRDgZioAB6alYz/dUXPvdg/nCM+VPyuojtYaq9Zkk2EPOd
	4YSA4mG/4l0KNYje9oxVZHE=
X-Google-Smtp-Source: APXvYqxaRW62jedwowSdKZgaNuT04z1XgkGA0lEbgE9iTc62HWQAXIFytRwvLDhkzFxFZifwXL+y7g==
X-Received: by 2002:aca:4255:: with SMTP id p82mr57752826oia.6.1564485183528;
        Tue, 30 Jul 2019 04:13:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:eea:: with SMTP id 97ls12374984otj.13.gmail; Tue, 30 Jul
 2019 04:13:03 -0700 (PDT)
X-Received: by 2002:a9d:39a6:: with SMTP id y35mr21829602otb.81.1564485182980;
        Tue, 30 Jul 2019 04:13:02 -0700 (PDT)
Date: Tue, 30 Jul 2019 04:13:02 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <888ae90d-0056-4bb4-b921-84c12346d972@googlegroups.com>
In-Reply-To: <dde1cd0e-407e-45b3-ae32-97c445100824@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <c1a63d36-2dd0-5b52-bb16-31794ab93b62@siemens.com>
 <fe00f482-c82c-4f93-8a0e-f73dc955888d@googlegroups.com>
 <b4e7dbee-58cd-3126-ce6b-7b54ee0ef241@siemens.com>
 <211205da-9e38-4178-895a-3ba80f214aa9@googlegroups.com>
 <6abaf77f-e4a7-7a9a-2ae9-8d1d8f1388bf@siemens.com>
 <1726f6bd-680a-46ac-a7f3-937cbba84208@googlegroups.com>
 <19e76b74-6d6e-010d-952a-5a36e606091b@web.de>
 <a5b27da1-b2aa-4ce0-863f-d9503a22b886@googlegroups.com>
 <885b4c3e-8d69-e516-aff4-46f2e50cb622@web.de>
 <edf7dab3-2c32-43bb-b13b-fce8bc452418@googlegroups.com>
 <4f76dc91-7542-40b8-a0d9-eea52e1dd92a@siemens.com>
 <e5c36ed1-98a5-4a76-aca0-6589cf9c3108@googlegroups.com>
 <ef7a124c-e5e3-f61b-8ed0-aebf585c65d6@siemens.com>
 <dde1cd0e-407e-45b3-ae32-97c445100824@googlegroups.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_9059_671703045.1564485182198"
X-Original-Sender: jpagsreis@gmail.com
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

------=_Part_9059_671703045.1564485182198
Content-Type: multipart/alternative; 
	boundary="----=_Part_9060_483394393.1564485182198"

------=_Part_9060_483394393.1564485182198
Content-Type: text/plain; charset="UTF-8"

I send in attachment root and non-root cell config files.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/888ae90d-0056-4bb4-b921-84c12346d972%40googlegroups.com.

------=_Part_9060_483394393.1564485182198
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I send in attachment root and non-root cell config files.<=
/div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/888ae90d-0056-4bb4-b921-84c12346d972%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/888ae90d-0056-4bb4-b921-84c12346d972%40googlegroups.com<=
/a>.<br />

------=_Part_9060_483394393.1564485182198--

------=_Part_9059_671703045.1564485182198
Content-Type: text/x-csrc; charset=UTF-8; name=ultra96-linux-demo2.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ultra96-linux-demo2.c
X-Attachment-Id: 0a4fee32-7194-47ad-8fd8-61873db4113c
Content-ID: <0a4fee32-7194-47ad-8fd8-61873db4113c>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for linux-demo inmate on Avnet Ultra96 board:
 * 2 CPUs, 128M RAM, serial port 2
 *
 * Copyright (c) Siemens AG, 2014-2019
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
=09struct jailhouse_cell_desc cell;
=09__u64 cpus[1];
=09struct jailhouse_memory mem_regions[6];
=09struct jailhouse_irqchip irqchips[1];
=09struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config =3D {
=09.cell =3D {
=09=09.signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
=09=09.revision =3D JAILHOUSE_CONFIG_REVISION,
=09=09.name =3D "non-root",
=09=09.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,/* |
=09=09JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,*/

=09=09.cpu_set_size =3D sizeof(config.cpus),
=09=09.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
=09=09.num_irqchips =3D ARRAY_SIZE(config.irqchips),
=09=09.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),

=09=09.vpci_irq_base =3D 140-32,

=09=09.console =3D {
=09=09=09.address =3D 0xff010000, /*UART1*/
=09=09=09//.address =3D 0xff000000, /*UART0*/ //se eu meter uart0 da erro u=
nhandled trap
=09=09=09.type=3D JAILHOUSE_CON_TYPE_XUARTPS,
=09=09=09.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
=09=09=09=09 JAILHOUSE_CON_REGDIST_4,
=09=09},
=09},

=09.cpus =3D {
=09=09//0xe, //1110
=09=09//0x8, //1000 - fica com cpu3
=09=090xc, //1100
=09},

=09.mem_regions =3D {
=09=09/* UART */ {
=09=09=09.phys_start =3D 0xff010000,
=09=09=09.virt_start =3D 0xff010000,
=09=09=09/*.phys_start =3D 0xff000000,
=09=09=09.virt_start =3D 0xff000000,*/
=09=09=09.size =3D 0x1000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x40000000,
=09=09=09.virt_start =3D 0x40000000,
=09=09=09.size =3D 0x20000000, //must be page size aligned
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
=09=09=09=09JAILHOUSE_MEM_DMA,/* |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED,*/ //se tirar JAILHOUSE_MEM_ROOTSHARED=
 da exception fault 0x20
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x7bef0000,
=09=09=09.virt_start =3D 0x7bef0000,
=09=09=09.size =3D 0x10000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x74000000,
=09=09=09.virt_start =3D 0x74000000,
=09=09=09.size =3D 0x7ef0000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
=09=09=09=09JAILHOUSE_MEM_LOADABLE,
=09=09},
=09=09/* IVSHMEM shared memory region */ {
=09=09=09.phys_start =3D 0x7bf00000,
=09=09=09.virt_start =3D 0x7bf00000,
=09=09=09.size =3D 0x100000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED,
=09=09},
=09=09/* communication region */ {
=09=09=09.virt_start =3D 0x80000000,
=09=09=09.size =3D 0x00001000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_COMM_REGION,
=09=09},
=09},
=09=09

=09.irqchips =3D {
=09=09/* GIC */ {
=09=09=09.address =3D 0xf9010000, /* GICD base address - Display controller=
 */
=09=09=09.pin_base =3D 32, /* The first irqchip starts at .pin_base=3D32 as=
 the first 32 interrupts are=20
reserved for SGIs and PPIs. */
=09=09=09.pin_bitmap =3D {
=09=09=09=09//1 << (54 - 32),
=09=09=09=091 << (53 - 32), // cat /proc/interrupts interrupt da UART0 AQUI=
 ESTA A DIFEREN=C3=87A
=09=09=09=090,
=09=09=09=090,
=09=09=09=09(1 << (140 - 128)) | (1 << (142 - 128)) //PL to PS interrupt si=
gnals 8 to 15.
=09=09=09},
=09=09},
=09},

=09.pci_devices =3D {
=09=09/* 00:00.0 */ {
=09=09=09.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
=09=09=09.bdf =3D 0 << 3, // 00:00.0
=09=09=09.iommu =3D 1,//
=09=09=09.bar_mask =3D {
=09=09=09=090xffffff00, 0xffffffff, 0x00000000,
=09=09=09=090x00000000, 0x00000000, 0x00000000,
=09=09=09},
=09=09=09.shmem_region =3D 4,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_CUSTOM,
=09=09=09.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
=09=09=09//.num_msix_vectors =3D 1,
=09=09},
=09},
};

------=_Part_9059_671703045.1564485182198
Content-Type: text/x-csrc; charset=UTF-8; name=ultra96.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ultra96.c
X-Attachment-Id: 0fea48a7-1ac1-44e2-a447-fbf6fbaf8758
Content-ID: <0fea48a7-1ac1-44e2-a447-fbf6fbaf8758>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for Avnet Ultra96 board
 *
 * Copyright (c) Siemens AG, 2016-2019
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
=09struct jailhouse_system header;
=09__u64 cpus[1];
=09struct jailhouse_memory mem_regions[3];
=09struct jailhouse_irqchip irqchips[1];
=09struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config =3D {
=09.header =3D {
=09=09.signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
=09=09.revision =3D JAILHOUSE_CONFIG_REVISION,
=09=09.flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
=09=09.hypervisor_memory =3D {
=09=09=09.phys_start =3D 0x7c000000,
=09=09=09.size =3D       0x00400000,
=09=09},
=09=09.debug_console =3D {
=09=09=09.address =3D 0xff010000,
=09=09=09.size =3D 0x1000,
=09=09=09.type =3D JAILHOUSE_CON_TYPE_XUARTPS,
=09=09=09.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
=09=09=09=09 JAILHOUSE_CON_REGDIST_4,
=09=09},
=09=09.platform_info =3D {
=09=09=09.pci_mmconfig_base =3D 0xfc000000,
=09=09=09.pci_mmconfig_end_bus =3D 0,
=09=09=09.pci_is_virtual =3D 1,
=09=09=09.arm =3D {
=09=09=09=09.gic_version =3D 2,
=09=09=09=09.gicd_base =3D 0xf9010000,
=09=09=09=09.gicc_base =3D 0xf902f000,
=09=09=09=09.gich_base =3D 0xf9040000,
=09=09=09=09.gicv_base =3D 0xf906f000,
=09=09=09=09.maintenance_irq =3D 25,
=09=09=09},
=09=09},
=09=09.root_cell =3D {
=09=09=09.name =3D "root",

=09=09=09.cpu_set_size =3D sizeof(config.cpus),
=09=09=09.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
=09=09=09.num_irqchips =3D ARRAY_SIZE(config.irqchips),
=09=09=09.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),

=09=09=09.vpci_irq_base =3D 136-32,
=09=09},
=09},

=09.cpus =3D {
=09=090xf,
=09},

=09.mem_regions =3D {
=09=09/* MMIO (permissive) */ {
=09=09=09.phys_start =3D 0xfd000000,
=09=09=09.virt_start =3D 0xfd000000,
=09=09=09.size =3D=09      0x03000000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_IO,
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x0,
=09=09=09.virt_start =3D 0x0,
=09=09=09.size =3D 0x7c000000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE,
=09=09},
=09=09/* IVSHMEM shared memory region for 00:00.0 */ {
=09=09=09.phys_start =3D 0x7bf00000,
=09=09=09.virt_start =3D 0x7bf00000,
=09=09=09.size =3D 0x100000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
=09=09},
=09},

=09.irqchips =3D {
=09=09/* GIC */ {
=09=09=09.address =3D 0xf9010000,
=09=09=09.pin_base =3D 32,
=09=09=09.pin_bitmap =3D {
=09=09=09=090xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
=09=09=09},
=09=09},
=09},

=09.pci_devices =3D {
=09=09/* 0001:00:00.0 */ {
=09=09=09.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
=09=09=09.iommu =3D 1,//
=09=09=09//.domain =3D 1,
=09=09=09.bdf =3D 0 << 3,
=09=09=09.bar_mask =3D {
=09=09=09=090xffffff00, 0xffffffff, 0x00000000,
=09=09=09=090x00000000, 0x00000000, 0x00000000,
=09=09=09},
=09=09=09.shmem_region =3D 2,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_CUSTOM,
=09=09=09.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,=20
=09=09=09//.num_msix_vectors =3D 1,//se colocar isto, qd fa=C3=A7o insmod u=
io_ivshmem.ko ele n diz "using jailhouse mode" e dps n existe /dev/uio1
=09=09},
=09},
};

------=_Part_9059_671703045.1564485182198--
