Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBANFSLWAKGQENCPJMSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id D8484B8D2D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Sep 2019 10:49:06 +0200 (CEST)
Received: by mail-oi1-x23f.google.com with SMTP id b187sf675631oii.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Sep 2019 01:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XgXjvxxUMGioS3o2RIqHA+cqX6/ZTsC/A/shMz/m9Yk=;
        b=SPt2Muku9LloGsZtoqi2GEeUgWbIF5AXQki/Xp4WNDvwwv4MEvTZSAEaZl5XZc1H2c
         qYnQynzlsnQlra59OrKS7RnVeeZuCLnD9YE1p1DKr8zw+kSHAspdbvW2qH0ZgnzSuahL
         p3bjgEP4I4/yP5ICJ4p7x/2WO3SXan6gx7sdhUMshxpj7R6EwsXARCHDWAh2eT7sul+i
         wltZLYZBd+RaUdbBeP/9YK6EMZORjMLUHD6BtjDWsjusRdkF8FyrNjMH6/ZJp7hhRliq
         A5DIRBgb9PIFqQrjibMunz2y4Uip2SKy6ZyI3muhiAWNoVcPBFyvXHlCNAgiEd89vUBB
         0iHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XgXjvxxUMGioS3o2RIqHA+cqX6/ZTsC/A/shMz/m9Yk=;
        b=XHH9PNdnHyduLciBKG0yqCPQ6VdA3N5My8JJIGPmIfCk9Sft/J+OVSDgA3wG96Tpm0
         PnRajtH6km5ysKN3le9aqh3qqRXAY9ATkzkSCrdcR/czIHzcjiW5GH9/QH3mhSm0FVwE
         zAV/jXuJ0qr4VYfnA+kt/mzw+zrNg9JDzAuaxN4xF4+u8Yus0BEjZ4XmEvGYfqC3YrU3
         e48zp9yo2OyfBG0khcVvDpeyqQNiz3O8b6n2lapYw+dLnkNtZPsnELWS4J8xP2SkaoH8
         4ryvLgIXP/gvGBU4968F+rZ7mM8lgUhUwwmtZ2DyQlLLZeyJtZbXHz17mZoKkUP10NFp
         XQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XgXjvxxUMGioS3o2RIqHA+cqX6/ZTsC/A/shMz/m9Yk=;
        b=lUOUW+/cFh5ecbHyRAaS5ixvv2ocM7NbyfuBOEu2wgHkNYlNkakWiyn0MxnW4vo9vQ
         LKPK1SrZWulDJWz/x3IRQymTEhEi7bpYS0b9Kw9FhMkY9f3GPt3FcrlRl/WM7xqcyEdZ
         6Uqhr2nXXL+yQrSCIaoB97w7VWIhpskwH8pYqT9uRkmRbl1wGi5lQ1rxZCAQzgVONDMj
         CsDcBqKTB+0LoxOA64pidER4KzT+rsiy34nkGUIG4T0yyNH/IwWRDblEGaoyEW16msLu
         kbF9A1rc7erf72zabIfdMrZdixg7g7wox8SKwTlYUt+PMVEcVSlHP4sNGm8FrWVzx5vK
         d7ig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUycbAdA8rPcrwf8tzW0eC/Wb6To4MBXfRKwBQ9RteWe7p68m6x
	g8W02e+KsraLx3GBfzNd6IY=
X-Google-Smtp-Source: APXvYqxRGYzwPIhYRpYlyu/OoIQuIEZOp75xg7+Lo2efcT99vIdbHgV/ALgUejBcMVpJnfPgngaDcQ==
X-Received: by 2002:a05:6830:210b:: with SMTP id i11mr10136787otc.367.1568969345327;
        Fri, 20 Sep 2019 01:49:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:2c42:: with SMTP id f60ls1473466otb.8.gmail; Fri, 20 Sep
 2019 01:49:04 -0700 (PDT)
X-Received: by 2002:a9d:be4:: with SMTP id 91mr10881111oth.111.1568969344694;
        Fri, 20 Sep 2019 01:49:04 -0700 (PDT)
Date: Fri, 20 Sep 2019 01:49:03 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f529a508-6259-43e5-a2f9-6b4c48bdf153@googlegroups.com>
Subject: Invalid MMIO access during PCI device initialization
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4020_198849338.1568969343731"
X-Original-Sender: Sonic.tw.tp@gmail.com
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

------=_Part_4020_198849338.1568969343731
Content-Type: multipart/alternative; 
	boundary="----=_Part_4021_748690050.1568969343732"

------=_Part_4021_748690050.1568969343732
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

I am having some problem with a physical PCI-e serial card and non-root 
Linux.

I have been using the serial card with the root Linux and non-root RTOS for 
a while whthout any problem.

Recently, I decided to try this card in a non-root Linux.
I compiled the Jailhouse enabled kernel and prepared a rootfs.
The non-root Linux work fine with an motherboard built-in 8250 serial.

I have a custom Linux driver for this PCI-e serial card.
Therefore, this card should be immune from the 8250.n_uart problem.
However, because the card is still in the COMMUNICATION_SERIAL class, 
8250_pci driver still will initialize the card during boot.

During this initialization, it will try to setup the virtual channels.
When it read the VC capability structures, the system hangs with the 
following log(I had made jailhouse to be more verbose).

More specifically, 

when it do pci_vc_do_save_buffer() in drivers/pci/vc.c and call 

pci_read_config_word(dev, pos + PCI_VC_PORT_CTRL, (u16 *)buf);

it will in turn call read_pci_config() in arch/x86/pci/early.c, resulting a 
fault.


Removing PCI device 02:00.0 from cell "RootCell"
Freeing 8 interrupt(s) for device 0200 at index 74
Adding PCI device 02:00.0 to cell "linux-x86-demo"
Reserving 1 interrupt(s) for device 0200 at index 72
Removing PCI device 02:00.1 from cell "RootCell"
Freeing 8 interrupt(s) for device 0201 at index 119
Adding PCI device 02:00.1 to cell "linux-x86-demo"
Reserving 1 interrupt(s) for device 0201 at index 73
Removing PCI device 02:00.2 from cell "RootCell"
Freeing 1 interrupt(s) for device 0202 at index 71
Adding PCI device 02:00.2 to cell "linux-x86-demo"
Reserving 1 interrupt(s) for device 0202 at index 71
Created cell "linux-x86-demo"
Page pool usage after cell creation: mem 468/16329, remap 65711/131072
Cell "linux-x86-demo" can be loaded
CPU 7 received SIPI, vector 100
Started cell "linux-x86-demo"
FATAL: unsupported instruction (0x66 0x00 0x00 0x00)
FATAL: Invalid MMIO/RAM read, addr: 0x000000008020010c size: 0
Name: linux-x86-demo
RIP: 0xffffffffb2550a08 RSP: 0xffffad0cc003bc08 FLAGS: 10286
RAX: 0xffffad0cd020010c RBX: 0xffffad0cd0200000 RCX: 0x000000000000010c
RDX: 0x00000000000000ff RSI: 0x0000000000000002 RDI: 0x0000000000000000
CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
RBP: 0x000000000000010c
DS: 0
SS: 0
GDTR_BASE: 0xfffffe0000001000 GDTR_LIMIT: 0x000000000000007f
IDTR_BASE: 0xfffffe0000000000 IDTR_LIMIT: 0x0000000000000fff
CR0: 0x0000000080050033 CR3: 0x0000000006c0a001 CR4: 0x00000000003626f0
EFER: 0x0000000000000d01
CPL: 0 RPL: 0
Parking CPU 7 (Cell: "linux-x86-demo")

I do not understand why only this specific read cause a fault, but others 
don't.
Did I misconfig anything in the cell config file(as an attachment).

Helps and suggestions are welcome

Yang

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f529a508-6259-43e5-a2f9-6b4c48bdf153%40googlegroups.com.

------=_Part_4021_748690050.1568969343732
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,</div><div><br></div><div>I am having som=
e problem with a physical PCI-e serial card and non-root Linux.</div><div><=
br></div><div>I have been using the serial card with the root Linux and non=
-root RTOS for a while whthout any problem.</div><div><br></div><div>Recent=
ly, I decided to try this card in a non-root Linux.</div><div>I compiled th=
e Jailhouse enabled kernel and prepared a rootfs.</div><div>The non-root Li=
nux work fine with an motherboard built-in 8250 serial.</div><div><br></div=
><div>I have a custom Linux driver for this PCI-e serial card.</div><div>Th=
erefore, this card should be immune from the 8250.n_uart problem.</div><div=
>However, because the card is still in the COMMUNICATION_SERIAL class, 8250=
_pci driver still will initialize the card during boot.</div><div><br></div=
><div>During this initialization, it will try to setup the virtual channels=
.</div><div>When it read the VC capability structures, the system hangs wit=
h the following log(I had made jailhouse to be more verbose).</div><div><br=
></div><div>More specifically, <br></div><div><br></div><div>when it do pci=
_vc_do_save_buffer() in drivers/pci/vc.c and call <br></div><div><br></div>=
<div>pci_read_config_word(dev, pos + PCI_VC_PORT_CTRL, (u16 *)buf);</div><d=
iv><br></div><div>it will in turn call read_pci_config() in arch/x86/pci/ea=
rly.c, resulting a fault.<br></div><div><br></div><div><br></div><div>Remov=
ing PCI device 02:00.0 from cell &quot;RootCell&quot;<br>Freeing 8 interrup=
t(s) for device 0200 at index 74<br>Adding PCI device 02:00.0 to cell &quot=
;linux-x86-demo&quot;<br>Reserving 1 interrupt(s) for device 0200 at index =
72<br>Removing PCI device 02:00.1 from cell &quot;RootCell&quot;<br>Freeing=
 8 interrupt(s) for device 0201 at index 119<br>Adding PCI device 02:00.1 t=
o cell &quot;linux-x86-demo&quot;<br>Reserving 1 interrupt(s) for device 02=
01 at index 73<br>Removing PCI device 02:00.2 from cell &quot;RootCell&quot=
;<br>Freeing 1 interrupt(s) for device 0202 at index 71<br>Adding PCI devic=
e 02:00.2 to cell &quot;linux-x86-demo&quot;<br>Reserving 1 interrupt(s) fo=
r device 0202 at index 71<br>Created cell &quot;linux-x86-demo&quot;<br>Pag=
e pool usage after cell creation: mem 468/16329, remap 65711/131072<br>Cell=
 &quot;linux-x86-demo&quot; can be loaded<br>CPU 7 received SIPI, vector 10=
0<br>Started cell &quot;linux-x86-demo&quot;<br>FATAL: unsupported instruct=
ion (0x66 0x00 0x00 0x00)<br>FATAL: Invalid MMIO/RAM read, addr: 0x00000000=
8020010c size: 0<br>Name: linux-x86-demo<br>RIP: 0xffffffffb2550a08 RSP: 0x=
ffffad0cc003bc08 FLAGS: 10286<br>RAX: 0xffffad0cd020010c RBX: 0xffffad0cd02=
00000 RCX: 0x000000000000010c<br>RDX: 0x00000000000000ff RSI: 0x00000000000=
00002 RDI: 0x0000000000000000<br>CS: 10 BASE: 0x0000000000000000 AR-BYTES: =
a09b EFER.LMA 1<br>RBP: 0x000000000000010c<br>DS: 0<br>SS: 0<br>GDTR_BASE: =
0xfffffe0000001000 GDTR_LIMIT: 0x000000000000007f<br>IDTR_BASE: 0xfffffe000=
0000000 IDTR_LIMIT: 0x0000000000000fff<br>CR0: 0x0000000080050033 CR3: 0x00=
00000006c0a001 CR4: 0x00000000003626f0<br>EFER: 0x0000000000000d01<br>CPL: =
0 RPL: 0<br>Parking CPU 7 (Cell: &quot;linux-x86-demo&quot;)<br></div><div>=
<br></div><div>I do not understand why only this specific read cause a faul=
t, but others don&#39;t.</div><div>Did I misconfig anything in the cell con=
fig file(as an attachment).</div><div><br></div><div>Helps and suggestions =
are welcome</div><div><br></div><div>Yang<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f529a508-6259-43e5-a2f9-6b4c48bdf153%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/f529a508-6259-43e5-a2f9-6b4c48bdf153%40googlegroups.com<=
/a>.<br />

------=_Part_4021_748690050.1568969343732--

------=_Part_4020_198849338.1568969343731
Content-Type: text/x-csrc; charset=US-ASCII; name=linux-x86-demo.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=linux-x86-demo.c
X-Attachment-Id: 3f598416-737d-44e6-ac87-6e075aaa6f5d
Content-ID: <3f598416-737d-44e6-ac87-6e075aaa6f5d>

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

#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[10];
	struct jailhouse_cache cache_regions[1];
	struct jailhouse_irqchip irqchips[1];
	__u8 pio_bitmap[0x2000];
	struct jailhouse_pci_device pci_devices[3];
	struct jailhouse_pci_capability pci_caps[9];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "linux-x86-demo",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
			JAILHOUSE_CELL_DEBUG_CONSOLE,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
		.num_pci_caps = ARRAY_SIZE(config.pci_caps),
	},

	.cpus = {
		0x80,
	},

	.mem_regions = {
		/* low RAM */ {
			.phys_start = 0x4100000,
			.virt_start = 0,
			.size = 0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */ {
			.virt_start = 0x00100000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_COMM_REGION,
		},
		/* high RAM */ {
			.phys_start = 0x04200000,
			.virt_start = 0x00200000,
			.size =       0x08000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* IVSHMEM shared memory regions */
		{ 0 },
		{
			.phys_start = 0x44220000,
			.virt_start = 0x40200000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x442a0000,
			.virt_start = 0x40280000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		/* MemRegion: fb502000-fb502fff : 0000:02:00.1 */
		{
			.phys_start = 0xfb502000,
			.virt_start = 0xfb502000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fb503000-fb503fff : 0000:02:00.1 */
		{
			.phys_start = 0xfb503000,
			.virt_start = 0xfb503000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fb504000-fb504fff : 0000:02:00.0 */
		{
			.phys_start = 0xfb504000,
			.virt_start = 0xfb504000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fb505000-fb505fff : 0000:02:00.0 */
		{
			.phys_start = 0xfb505000,
			.virt_start = 0xfb505000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	},

	.cache_regions = {
		{
			.start = 10,
			.size = 2,
			.type = JAILHOUSE_CACHE_L3,
		},
	},

	.irqchips = {
		/* IOAPIC */ {
			.address = 0xfec00000,
			.id = 0x1f0ff,
			.pin_bitmap = {
				(1 << 3) | (1 << 4),
			},
		},
	},

	.pio_bitmap = {
		[     0/8 ...  0x2f7/8] = -1,
		[ 0x2f8/8 ...  0x2ff/8] = 0, /* serial2 */
		[ 0x300/8 ...  0x3f7/8] = -1,
		[ 0x3f8/8 ...  0x3ff/8] = 0, /* serial1 */
		[ 0x400/8 ... 0xe00f/8] = -1,
		[0xe010/8 ... 0xe017/8] = 0, /* OXPCIe952 serial1 */
		[0xe018/8 ... 0xffff/8] = -1,
	},

	.pci_devices = {
		/* PCIDevice: 02:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x200,
			.bar_mask = {
				0xfffffff8, 0xfffff000, 0x00000000,
				0x00000000, 0x00000000, 0xfffff000,
			},
			.caps_start = 0,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 02:00.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x201,
			.bar_mask = {
				0xfffffff8, 0xfffff000, 0x00000000,
				0x00000000, 0x00000000, 0xfffff000,
			},
			.caps_start = 5,
			.num_caps = 4,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 02:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x202,
			.bar_mask = {
				0xfffffff8, 0xfffffff8, 0xfffff000,
				0x00000000, 0x00000000, 0xfffff000,
			},
			.caps_start = 5,
			.num_caps = 4,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
	},

	.pci_caps = {
		/* PCIDevice: 02:00.0 */
		{
			.id = 0x5,
			.start = 0x50,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x1,
			.start = 0x78,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x10,
			.start = 0x80,
			.len = 20,
			.flags = 0,
		},
		{
			.id = 0x2 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x50,
			.flags = 0,
		},
		{
			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x800,
			.len = 20,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 02:00.1 */
		/* PCIDevice: 02:00.2 */
		{
			.id = 0x5,
			.start = 0x50,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x1,
			.start = 0x78,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x10,
			.start = 0x80,
			.len = 20,
			.flags = 0,
		},
		{
			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 20,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
	}
};

------=_Part_4020_198849338.1568969343731--
