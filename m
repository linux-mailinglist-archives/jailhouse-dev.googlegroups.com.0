Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBYO22GCQMGQEV3CLF3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3f.google.com (mail-qv1-xf3f.google.com [IPv6:2607:f8b0:4864:20::f3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B95D3954E3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 May 2021 07:00:19 +0200 (CEST)
Received: by mail-qv1-xf3f.google.com with SMTP id v19-20020a0ce1d30000b02902187ed4452esf1704951qvl.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 30 May 2021 22:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=M6CrBfXm47EvQfFU5EsQB8Ui0Keo9zaMQ6Dc7527oNQ=;
        b=MfwiyoOEPsl4CqXvLlsPYHqfFGb+IXlUot07pgEwYUiVEVIeMiNbXiPDtSNjAAFzw+
         F0xfUvM//HvPAeeOemyFf74VJqmJgEKTlFCe8mObvMp0F0VBcHG7C0HqvC2MjNTRKp9q
         l4b20Tz+fJMO6PrvsSvU553zuzIseRcVzJOxnquL4arjw6M3MD+K+tepHnTRpqN6BjxV
         cfTHmzN68tqm5EqlUbMkLjRRNDCRvlN9HbVAUoJe3f1cmSUwZD5UbmimX8UySz/2diJy
         rmfy+K72Qbx5ZbKdw4DgT7zp061sjDoSoXduOsirzFS2bNGJyK7VGE9HB4jIzlF4SJQh
         qu1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M6CrBfXm47EvQfFU5EsQB8Ui0Keo9zaMQ6Dc7527oNQ=;
        b=frEFXgp+VQAXCv6vTayrjHG4VZFMPKVxALjUgP954I6sWLOZ62d5lJqxTdns5VAcxa
         MPebUPwNtjY4ECKoADtEowqXTq24V7F9XRIZDISmU1R8yLBS8mZIWoi9gAPfQDbH0ZrA
         KvR/GEbwzJXlK0E2sGS4hAruGhiKWcgptCdwrEv//c/hQRD/dT8rqPB5EWu/+4OsJ+SE
         wZG6xFE68QCwSx/LkLglGiIxIBrxczBASNGugioeLCKH1ipZ65fhp+hNrgjxWeh91Vd+
         hxa/GiSAi6I7X6XC4c6NTfqIvXek6Nkv51Qysb3y7kzV1rZ6xJW1wPB9nK8LOrukqTrY
         FG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M6CrBfXm47EvQfFU5EsQB8Ui0Keo9zaMQ6Dc7527oNQ=;
        b=gPcF3VkkgN3YuoN5H+qBL/s6nm4Phyeu4Epgfp+EooHdUaIB43D0xHSb++1SfPB/U3
         rDwJZS80U1Q4nA6OxZg6mCd5PF0ncEHaD7LvH/lo36dsCMyXxzDFCnbXeyqeTzrKUWzT
         4ivDPdodl3bE+YI4W/7EJMiZWt6FmKL5TQLiWs3a6AIyo5eHdD0GKBnUsgTKWBWFZtzi
         4kvdhhSYbSeWTZUIMFKn2EqIQIjh7kdprklau6/nYmdzO0UuLfp68cHx0/K9T058ccXz
         dlEd9aRiFa5UKDnPzfC3NSBAR08yNfW5XKX6elEsPahWutMptRd0moIJ+X+BFhF71UWO
         WDeg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530fUiP89KVaunchA2gIiwQ8Bbd9mVLtiqpsQmKaXCZdsiT7xPd4
	h+IghxHj4rnzBcS6kDQ0Pl8=
X-Google-Smtp-Source: ABdhPJzanlhV9FpG+AlNRTPLtNMsLfnWGy89zviGJ4i5lSe1Y9X47gJsqk8gS7LLOcGZW4+aVAeyuA==
X-Received: by 2002:a0c:c345:: with SMTP id j5mr149427qvi.26.1622437218091;
        Sun, 30 May 2021 22:00:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:f017:: with SMTP id l23ls8293098qkg.2.gmail; Sun, 30 May
 2021 22:00:17 -0700 (PDT)
X-Received: by 2002:a37:67c9:: with SMTP id b192mr14974217qkc.144.1622437217440;
        Sun, 30 May 2021 22:00:17 -0700 (PDT)
Date: Sun, 30 May 2021 22:00:16 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <31493abc-ae9a-42d9-996c-edf630f2456dn@googlegroups.com>
Subject: The right  configuration to  partition pci  device into inmate for
  QEMU
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2904_276981060.1622437216628"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_2904_276981060.1622437216628
Content-Type: multipart/alternative; 
	boundary="----=_Part_2905_1994499796.1622437216628"

------=_Part_2905_1994499796.1622437216628
Content-Type: text/plain; charset="UTF-8"

When I run  qemu demo. try to partition pci device into inmate.
I failed.

After some lone time trying , I sucess.
The PCI device  e1000e  is partitioned into inmate and ping sucess in 
inmate.
what the defference is:
1. I  add this into root.c(qemu-x86.c) and  qemu-linux-demo.c
{
.phys_start = 0xb0000000,//mmconfig
.virt_start = 0xb0000000,
.size = 0x10000000,
.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
},
or It will show   "Invalid PCI MMCONFIG write, device 02:00:0, reg:110, 
size:4"


2. use qemu-6.0 to run the qemu demo.
When use qemu -2..11.1 to run the demo the network  card cann't run sucess.
It  turns off  after I turn  on it use  ifconfig  up  command.

well, may it help someone.  whe to try the qemu demo for pci partition.



-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/31493abc-ae9a-42d9-996c-edf630f2456dn%40googlegroups.com.

------=_Part_2905_1994499796.1622437216628
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When I run&nbsp; qemu demo. try to partition pci device into inmate.<div>I =
failed.</div><div><br></div><div>After some lone time trying , I sucess.</d=
iv><div>The PCI device&nbsp;&nbsp;e1000e&nbsp; is partitioned into inmate a=
nd ping sucess in inmate.</div><div>what the defference is:</div><div>1. I&=
nbsp; add this into root.c(qemu-x86.c) and&nbsp; qemu-linux-demo.c<br></div=
><div><div><span style=3D"white-space:pre">		</span>{</div><div><span style=
=3D"white-space:pre">			</span>.phys_start =3D 0xb0000000,//mmconfig</div><=
div><span style=3D"white-space:pre">			</span>.virt_start =3D 0xb0000000,</=
div><div><span style=3D"white-space:pre">			</span>.size =3D 0x10000000,</d=
iv><div><span style=3D"white-space:pre">			</span>.flags =3D JAILHOUSE_MEM_=
READ | JAILHOUSE_MEM_WRITE,</div><div><span style=3D"white-space:pre">		</s=
pan>},</div></div><div>or It will show&nbsp; &nbsp;"Invalid PCI MMCONFIG wr=
ite, device 02:00:0, reg:110, size:4"</div><div><br></div><div><br></div><d=
iv>2. use qemu-6.0 to run the qemu demo.</div><div>When use qemu -2..11.1 t=
o run the demo the network&nbsp; card cann't run sucess.</div><div>It&nbsp;=
 turns off&nbsp; after I&nbsp;turn&nbsp; on it use&nbsp; ifconfig&nbsp; up&=
nbsp; command.</div><div><br></div><div>well, may it help someone.&nbsp; wh=
e to try the qemu demo for pci partition.</div><div><br></div><div><br></di=
v><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/31493abc-ae9a-42d9-996c-edf630f2456dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/31493abc-ae9a-42d9-996c-edf630f2456dn%40googlegroups.co=
m</a>.<br />

------=_Part_2905_1994499796.1622437216628--

------=_Part_2904_276981060.1622437216628
Content-Type: text/plain; charset=US-ASCII; name=qemu-linux-demo.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=qemu-linux-demo.c
X-Attachment-Id: 07fa90e5-1b0a-4b42-8d36-827bb31fdf1a
Content-ID: <07fa90e5-1b0a-4b42-8d36-827bb31fdf1a>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for Linux inmate, 1 CPU, 74 MB RAM, ~1MB shmem, serial ports
 *
 * Copyright (c) Siemens AG, 2013-2015
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

#define CONFIG_QEMU_E1000E_ASSIGNMENT




struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
#ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
	struct jailhouse_memory mem_regions[25];
#else
	struct jailhouse_memory mem_regions[20];
#endif
	struct jailhouse_cache cache_regions[1];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[4];
#ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
	struct jailhouse_pci_device pci_devices[5];
#else
	struct jailhouse_pci_device pci_devices[4];
#endif
	struct jailhouse_pci_capability pci_caps[6];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "linux-x86-demo",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
		.num_pci_caps = ARRAY_SIZE(config.pci_caps),
	},

	.cpus = {
		0b1100,
	},

	.mem_regions = {
		/* IVSHMEM shared memory region (virtio-blk front) */
		{
			.phys_start = 0x3f000000,
			.virt_start = 0x3f000000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x3f001000,
			.virt_start = 0x3f001000,
			.size = 0xdf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		{ 0 },
		{ 0 },
		/* IVSHMEM shared memory region (virtio-con front) */
		{
			.phys_start = 0x3f0e0000,
			.virt_start = 0x3f0e0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x3f0e1000,
			.virt_start = 0x3f0e1000,
			.size = 0xf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		{ 0 },
		{ 0 },
		/* IVSHMEM shared memory regions (demo) */
		{
			.phys_start = 0x3f0f0000,
			.virt_start = 0x3f0f0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x3f0f1000,
			.virt_start = 0x3f0f1000,
			.size = 0x9000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x3f0fa000,
			.virt_start = 0x3f0fa000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x3f0fc000,
			.virt_start = 0x3f0fc000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x3f0fe000,
			.virt_start = 0x3f0fe000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		/* IVSHMEM shared memory regions (networking) */
		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 1),
		/* low RAM */ {
			.phys_start = 0x3a600000,
			.virt_start = 0,
			.size = 0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */ {
			.virt_start = 0x00100000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_COMM_REGION,
		},
		/* high RAM */ {
			.phys_start = 0x3a700000,
			.virt_start = 0x00200000,
			.size = 0x4700000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
#ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
		/* MemRegion: feb40000-feb7ffff : 0000:00:02.0 */
		{
			.phys_start = 0xfeb40000,
			.virt_start = 0xfeb40000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feb80000-feb9ffff : e1000e */
		{
			.phys_start = 0xfeb80000,
			.virt_start = 0xfeb80000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feba0000-febbffff : e1000e */
		{
			.phys_start = 0xfeba0000,
			.virt_start = 0xfeba0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd1000-febd3fff : e1000e */
		{
			.phys_start = 0xfebd1000,
			.virt_start = 0xfebd1000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		{
			.phys_start = 0xb0000000,//mmconfig
			.virt_start = 0xb0000000,
			.size = 0x10000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
#endif
	},

	.cache_regions = {
		{
			.start = 0,
			.size = 2,
			.type = JAILHOUSE_CACHE_L3,
		},
	},

	.irqchips = {
		/* IOAPIC */ {
			.address = 0xfec00000,
			.id = 0xff00,
			.pin_bitmap = {
				(1 << 3) | (1 << 4),
			},
		},
	},

	.pio_regions = {
		PIO_RANGE(0x2f8, 8), /* serial 2 */
		PIO_RANGE(0x3f8, 8), /* serial 1 */
		PIO_RANGE(0xe010, 8), /* OXPCIe952 serial1 */
		PIO_RANGE(0xc040,0x20),/* e1000e */
	},

	.pci_devices = {
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.bdf = 0x0c << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 2,
			.shmem_regions_start = 0,
			.shmem_dev_id = 1,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
				VIRTIO_DEV_BLOCK,
		},
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.bdf = 0x0d << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 3,
			.shmem_regions_start = 4,
			.shmem_dev_id = 1,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
				VIRTIO_DEV_CONSOLE,
		},
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.bdf = 0x0e << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 16,
			.shmem_regions_start = 8,
			.shmem_dev_id = 2,
			.shmem_peers = 3,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.bdf = 0x0f << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 2,
			.shmem_regions_start = 13,
			.shmem_dev_id = 1,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
#ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
		{ /* e1000e */
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.domain = 0x0000,
			.bdf = 0x0010,
			.bar_mask = {
				0xfffe0000, 0xfffe0000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 6,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0xfebd0000,
		},
#endif
	},

	.pci_caps = {
		{ /* e1000e */
			.id = PCI_CAP_ID_PM,
			.start = 0xc8,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xd0,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0xe0,
			.len = 20,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xa0,
			.len = 12,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 4,
			.flags = 0,
		},
	}
};

------=_Part_2904_276981060.1622437216628
Content-Type: text/plain; charset=US-ASCII; name=qemu.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=qemu.c
X-Attachment-Id: 713f8383-c1ae-4970-a463-d7bedc3ddb64
Content-ID: <713f8383-c1ae-4970-a463-d7bedc3ddb64>

 /* NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x5200000$0x3a000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[17];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[8];
	struct jailhouse_pci_device pci_devices[7];
	struct jailhouse_pci_capability pci_caps[9];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x3a000000,
			.size = 0x600000,
		},
		.debug_console = {
			.address = 0x3f8,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xb0000000,
			.pci_mmconfig_end_bus = 0xff,
			.x86 = {
				.pm_timer_address = 0x608,
				.vtd_interrupt_limit = 128,
				.iommu_units = {
					{
						.type = JAILHOUSE_IOMMU_INTEL,
						.base = 0xfed90000,
						.size = 0x1000,
					},
				},
			},
		},
		.root_cell = {
			.name = "RootCell",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		},
	},

	.cpus = {
		0x000000000000000f,
	},

	.mem_regions = {
		/* MemRegion: 00000000-0009fbff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0xa0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00100000-00ffffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0xf00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 01000000-02ffffff : Kernel */
		{
			.phys_start = 0x1000000,
			.virt_start = 0x1000000,
			.size = 0x2000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 03000000-39ffffff : System RAM */
		{
			.phys_start = 0x3000000,
			.virt_start = 0x3000000,
			.size = 0x37000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 3f200000-3ffdefff : System RAM */
		{
			.phys_start = 0x3f200000,
			.virt_start = 0x3f200000,
			.size = 0xddf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: fd000000-fdffffff : vesafb */
		{
			.phys_start = 0xfd000000,
			.virt_start = 0xfd000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feb40000-feb7ffff : 0000:00:02.0 */
		{
			.phys_start = 0xfeb40000,
			.virt_start = 0xfeb40000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feb80000-feb9ffff : 0000:00:02.0 */
		{
			.phys_start = 0xfeb80000,
			.virt_start = 0xfeb80000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feba0000-febbffff : 0000:00:02.0 */
		{
			.phys_start = 0xfeba0000,
			.virt_start = 0xfeba0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd1000-febd3fff : 0000:00:02.0 */
		{
			.phys_start = 0xfebd1000,
			.virt_start = 0xfebd1000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd4000-febd7fff : ICH HD audio */
		{
			.phys_start = 0xfebd4000,
			.virt_start = 0xfebd4000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd8000-febd8fff : 0000:00:01.0 */
		{
			.phys_start = 0xfebd8000,
			.virt_start = 0xfebd8000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd9000-febd9fff : ahci */
		{
			.phys_start = 0xfebd9000,
			.virt_start = 0xfebd9000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
		{
			.phys_start = 0xfed00000,
			.virt_start = 0xfed00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 000c0000-000dffff : ROMs */
		{
			.phys_start = 0xc0000,
			.virt_start = 0xc0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3a600000-3f1fffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x3a600000,
			.virt_start = 0x3a600000,
			.size = 0x4c00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},

		{
			.phys_start = 0xb0000000,//mmconfig
			.virt_start = 0xb0000000,
			.size = 0x10000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	},

	.irqchips = {
		/* IOAPIC 0, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0xff00,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pio_regions = {
		/* Port I/O: 0000-001f : dma1 */
		/* PIO_RANGE(0x0, 0x20), */
		/* Port I/O: 0020-0021 : pic1 */
		/* PIO_RANGE(0x20, 0x2), */
		/* Port I/O: 0040-0043 : timer0 */
		PIO_RANGE(0x40, 0x4),
		/* Port I/O: 0050-0053 : timer1 */
		/* PIO_RANGE(0x50, 0x4), */
		/* Port I/O: 0060-0060 : keyboard */
		PIO_RANGE(0x60, 0x1),
		/* Port I/O: 0064-0064 : keyboard */
		PIO_RANGE(0x64, 0x1),
		/* Port I/O: 0080-008f : dma page reg */
		/* PIO_RANGE(0x80, 0x10), */
		/* Port I/O: 00a0-00a1 : pic2 */
		/* PIO_RANGE(0xa0, 0x2), */
		/* Port I/O: 00c0-00df : dma2 */
		/* PIO_RANGE(0xc0, 0x20), */
		/* Port I/O: 00f0-00ff : fpu */
		/* PIO_RANGE(0xf0, 0x10), */
		/* Port I/O: 02f8-02ff : serial */
		PIO_RANGE(0x2f8, 0x8),
		/* Port I/O: 03c0-03df : vesafb */
		PIO_RANGE(0x3c0, 0x20),
		/* Port I/O: 03f8-03ff : serial */
		PIO_RANGE(0x3f8, 0x8),
		/* Port I/O: 0510-051b : QEMU0002:00 */
		/* PIO_RANGE(0x510, 0xc), */
		/* Port I/O: 0600-0603 : ACPI PM1a_EVT_BLK */
		/* PIO_RANGE(0x600, 0x4), */
		/* Port I/O: 0604-0605 : ACPI PM1a_CNT_BLK */
		/* PIO_RANGE(0x604, 0x2), */
		/* Port I/O: 0608-060b : ACPI PM_TMR */
		/* PIO_RANGE(0x608, 0x4), */
		/* Port I/O: 0620-062f : ACPI GPE0_BLK */
		/* PIO_RANGE(0x620, 0x10), */
		/* Port I/O: 0630-0633 : iTCO_wdt.0.auto */
		/* PIO_RANGE(0x630, 0x4), */
		/* Port I/O: 0660-067f : iTCO_wdt.0.auto */
		/* PIO_RANGE(0x660, 0x20), */
		/* Port I/O: 0700-073f : i801_smbus */
		/* PIO_RANGE(0x700, 0x40), */
		/* Port I/O: c040-c05f : 0000:00:02.0 */
		PIO_RANGE(0xc040, 0x20),
		/* Port I/O: c060-c07f : 0000:00:1f.2 */
		PIO_RANGE(0xc060, 0x20),
	},

	.pci_devices = {
		/* PCIDevice: 00:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x8,
			.bar_mask = {
				0xff000000, 0x00000000, 0xfffff000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:02.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x10,
			.bar_mask = {
				0xfffe0000, 0xfffe0000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 6,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0xfebd0000,
		},
		/* PCIDevice: 00:1b.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xd8,
			.bar_mask = {
				0xffffc000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 1,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xf8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xfa,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0xffffffe0, 0xfffff000,
			},
			.caps_start = 7,
			.num_caps = 2,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xfb,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0xffffffc0, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
	},

	.pci_caps = {
		/* PCIDevice: 00:02.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xc8,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xd0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0xe0,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xa0,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0xc,
			.flags = 0,
		},
		/* PCIDevice: 00:1b.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x60,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:1f.2 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SATA,
			.start = 0xa8,
			.len = 0x2,
			.flags = 0,
		},
	},
};

------=_Part_2904_276981060.1622437216628--
