Return-Path: <jailhouse-dev+bncBDR6BW4XXEARBLHVW2DQMGQEYCO3TII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83c.google.com (mail-qt1-x83c.google.com [IPv6:2607:f8b0:4864:20::83c])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D703C73DD
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Jul 2021 18:09:17 +0200 (CEST)
Received: by mail-qt1-x83c.google.com with SMTP id j15-20020ac84c8f0000b0290257b7db4a28sf2718034qtv.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Jul 2021 09:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OQTLxcymqAQHdNe0vfMDIZNcJlkK2qKHyiDFBtaR4Cw=;
        b=Q3AMHI/tY/LkdmlIMWbnfuTPcsvdgtKqXZQT2DhiH9105YlTIzX18ehtYtuY7NL2zy
         GK70pZZxpjLQdsXzgg4ezyNF7aKkjAIKUfwMfsKhoMqi7tjRzJ8TBdkCwtsMNfrAQzqs
         eVMkkkwQpju8liKKa4qRybPFGv09+vgom23jEygOT+OY1/mdTaYLy/1Qit/P4SnQatAh
         HvUxv0Z3zUHtZaCH66HY7Qi2xLHsjXE0jz/aU+CLEqpOoF27gIQl2BU6BmoEe7LR6rtw
         51CoqFdL0jDInoiVxBCImhKZD+pqIwBHEro7L1bRxKdXdjbk5YH80q5st4cObDqEYqVJ
         4Pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OQTLxcymqAQHdNe0vfMDIZNcJlkK2qKHyiDFBtaR4Cw=;
        b=G0NKbTvRtGr+ZE5abqESe4QaQcAaB+pg4VDP8gA46v9vkLeIHzJXT7MwcIa1i5/rEO
         Vq6U1ZiubPWHf6Q9yKkwq5G7Ofl5zLBmZ3HIK4CsxkNYFuNV43tTr4L8xg48i7FcAONO
         MNvzF22MQYLXT6BaUJkMUbTdGyGe9NgPJ+MYQ85EPzLjEC7brxrR0ci4YtHOlYjkEPez
         EQz3SQAdQ/iu3/4Z6/LuDlgjZppICojF8R0oWO1NNGzko0Jx8kukbGYPfrMG13zviffg
         fCQxVq+/2gpLgpvJFxiBqVsbv5747nCNEGDDT8+/WgObtMQP2O0Ebvq47N2w4wANSVsz
         ATHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533hj2B88L3m6k01tcUVcF6V+zBIJaGuLVtQsFIRxMex2+AoD13Q
	h2k8HW+dIrNA+5giQ8MNmPQ=
X-Google-Smtp-Source: ABdhPJyCyPkTnG76cynM6v4NC2cuZh5RvB2TiiZdeR1RL5+s4QRN/3Pne9MmvNwDp7rn5SSlER0l+A==
X-Received: by 2002:a05:620a:4e8:: with SMTP id b8mr4967746qkh.357.1626192556839;
        Tue, 13 Jul 2021 09:09:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:aa8d:: with SMTP id t135ls6402867qke.0.gmail; Tue, 13
 Jul 2021 09:09:16 -0700 (PDT)
X-Received: by 2002:ae9:ddc2:: with SMTP id r185mr5034742qkf.107.1626192555802;
        Tue, 13 Jul 2021 09:09:15 -0700 (PDT)
Date: Tue, 13 Jul 2021 09:09:14 -0700 (PDT)
From: Huang Shihua <shihua.huang@prodrive-technologies.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e52ea42b-f7ac-4f70-b23f-717c5d530dc5n@googlegroups.com>
Subject: Ivshmem-demo: root cell failed to receive interrupts
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1712_1228712098.1626192554947"
X-Original-Sender: shihua.huang@prodrive-technologies.com
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

------=_Part_1712_1228712098.1626192554947
Content-Type: multipart/alternative; 
	boundary="----=_Part_1713_1377027820.1626192554948"

------=_Part_1713_1377027820.1626192554948
Content-Type: text/plain; charset="UTF-8"

HI,

Currently, I'm trying to run the ivshmem-demo to establish communication 
between Linux root cell and one non-root cell. Configuration files are 
attached.

Two cases were tested:

   1. Let the non-root cell load the ivshmem-demo and then target at itself 
   (target=1). *All interrupts can be sent and received correctly*.
   2. Let the root cell and the non-root cell send interrupts to each 
   other. I.e., root cell runs *./tools/demos/ivshmem-demo -t 1, *while the 
   non-root cell load *inmates/demos/x86/ivshmem-demo.bin -s "target=0" -a 
   0x1000 *and then run. The result turned out to be, 
      - the non-root cell got the interrupts from the root cell,
      - *while the root cell did not receive any interrupt.*
   
As Jan mentioned 
in https://groups.google.com/g/jailhouse-dev/c/GRCWFzNaHX8/m/ht8z51BOCgAJ, 
tuning the iommu index should do the trick.
However, unfortunately, it did not work for me :c

There are 8 iommu units on the hardware, I tuned the iommu index in the 
root cell configuration from 0 to 7. The same behavior, no interrupts were 
received by the root cell, remains when tuning the index from 0 to 6. When 
the iommu is set to 7, the kernel crashed immediately when the demo was 
started on the non-root cell. 

Any idea regarding why the root cell always failed to receive interrupts?

Kind regards,
Shihua Huang

*dmesg:*
[  598.073909] pci 0000:00:0e.0: [110a:4106] type 00 class 0xff0000
[  598.073934] pci 0000:00:0e.0: reg 0x10: [mem 0x00000000-0x00000fff]
[  598.073941] pci 0000:00:0e.0: reg 0x14: [mem 0x00000000-0x00000fff]
[  598.075200] pci 0000:00:0e.0: BAR 0: assigned [mem 0xb0000000-0xb0000fff]
[  598.075206] pci 0000:00:0e.0: BAR 1: assigned [mem 0xb0001000-0xb0001fff]
[  598.075323] uio_ivshmem 0000:00:0e.0: enabling device (0000 -> 0002)
[  598.075387] uio_ivshmem 0000:00:0e.0: state_table at 0x000000003f0f0000, 
size 0x0000000000001000
[  598.075392] uio_ivshmem 0000:00:0e.0: rw_section at 0x000000003f0f1000, 
size 0x0000000000009000
[  598.075401] uio_ivshmem 0000:00:0e.0: input_sections at 
0x000000003f0fa000, size 0x0000000000006000
[  598.075406] uio_ivshmem 0000:00:0e.0: output_section at 
0x000000003f0fa000, size 0x0000000000002000
[  598.075993] uio_ivshmem 0000:00:0e.0: uio_ivshmem[0000:00:0e.0] requests 
irq 0
.....
[  598.076478] uio_ivshmem 0000:00:0e.0: uio_ivshmem[0000:00:0e.0] requests 
irq 15


*root cell print:*
*sudo ./tools/demos/ivshmem-demo -t 1*
open(sysfs) /sys/class/uio/uio0/maps/map0/size
ID = 0
Maximum peers = 3
open(sysfs) /sys/class/uio/uio0/maps/map1/size
open(sysfs) /sys/class/uio/uio0/maps/map2/size
open(sysfs) /sys/class/uio/uio0/maps/map3/size
open(sysfs) /sys/class/uio/uio0/maps/map4/size
state[0] = 1
state[1] = 0
state[2] = 0
rw[0] = 0
rw[1] = 0
rw[2] = -1347440721
in@0x0000 = 0
in@0x2000 = 0
in@0x4000 = -1347440721

Sending interrupt 1 to peer 1
Sending interrupt 1 to peer 1
...


*non-root cell print:*
IVSHMEM: bar0 is at 0x00000000ff000000
IVSHMEM: bar1 is at 0x00000000ff001000
IVSHMEM: ID is 1
IVSHMEM: max. peers is 3
IVSHMEM: state table is at 0x000000003f0f0000
IVSHMEM: R/W section is at 0x000000003f0f1000
IVSHMEM: input sections start at 0x000000003f0fa000
IVSHMEM: output section is at 0x000000003f0fc000
IVSHMEM: initialized device
state[0] = 1
state[1] = 2
state[2] = 0
rw[0] = 0
rw[1] = 0
rw[2] = -1347440721
in@0x0000 = 0
in@0x2000 = 0
in@0x4000 = -1347440721

IVSHMEM: got interrupt 1 (#1)
state[0] = 1
state[1] = 2
state[2] = 0
rw[0] = 0
rw[1] = 1
rw[2] = -1347440721
in@0x0000 = 0
in@0x2000 = 10
in@0x4000 = -1347440721

IVSHMEM: sending IRQ 2 to peer 0

IVSHMEM: got interrupt 1 (#2)
state[0] = 1
state[1] = 2
state[2] = 0
rw[0] = 0
rw[1] = 2
rw[2] = -1347440721
in@0x0000 = 0
in@0x2000 = 20
in@0x4000 = -1347440721

IVSHMEM: sending IRQ 2 to peer 0
......


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e52ea42b-f7ac-4f70-b23f-717c5d530dc5n%40googlegroups.com.

------=_Part_1713_1377027820.1626192554948
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI,<div><br></div><div>Currently, I'm trying to run the ivshmem-demo to est=
ablish communication between Linux root cell and one non-root cell. Configu=
ration files are attached.</div><div><br></div><div>Two cases were tested:<=
/div><div><ol><li>Let the non-root cell load the ivshmem-demo and then targ=
et at itself (target=3D1). <u>All interrupts can be sent and received corre=
ctly</u>.</li><li>Let the root cell and the non-root cell send interrupts t=
o each other. I.e., root cell runs&nbsp;<i>./tools/demos/ivshmem-demo -t 1,=
 </i>while the non-root cell load <i>inmates/demos/x86/ivshmem-demo.bin -s =
"target=3D0" -a 0x1000 </i>and then run. The result turned out to be,&nbsp;=
<ul><li>the non-root cell got the interrupts from the root cell,</li><li><u=
>while the root cell did not receive any interrupt.</u></li></ul></li></ol>=
<div>As Jan mentioned in&nbsp;https://groups.google.com/g/jailhouse-dev/c/G=
RCWFzNaHX8/m/ht8z51BOCgAJ, tuning the iommu index should do the trick.</div=
></div><div>However, unfortunately, it did not work for me :c</div><div><br=
></div><div>There are 8 iommu units on the hardware, I tuned the iommu inde=
x in the root cell configuration from 0 to 7. The same behavior, no interru=
pts were received by the root cell, remains when tuning the index from 0 to=
 6. When the iommu is set to 7, the kernel crashed immediately when the dem=
o was started on the non-root cell.&nbsp;</div><div><br></div><div>Any idea=
 regarding why the root cell always failed to receive interrupts?</div><div=
><br></div><div>Kind regards,</div><div>Shihua Huang</div><div><br></div><d=
iv><b style=3D"">dmesg:</b></div><div><div>[&nbsp; 598.073909] pci 0000:00:=
0e.0: [110a:4106] type 00 class 0xff0000</div><div>[&nbsp; 598.073934] pci =
0000:00:0e.0: reg 0x10: [mem 0x00000000-0x00000fff]</div><div>[&nbsp; 598.0=
73941] pci 0000:00:0e.0: reg 0x14: [mem 0x00000000-0x00000fff]</div><div>[&=
nbsp; 598.075200] pci 0000:00:0e.0: BAR 0: assigned [mem 0xb0000000-0xb0000=
fff]</div><div>[&nbsp; 598.075206] pci 0000:00:0e.0: BAR 1: assigned [mem 0=
xb0001000-0xb0001fff]</div><div>[&nbsp; 598.075323] uio_ivshmem 0000:00:0e.=
0: enabling device (0000 -&gt; 0002)</div><div>[&nbsp; 598.075387] uio_ivsh=
mem 0000:00:0e.0: state_table at 0x000000003f0f0000, size 0x000000000000100=
0<br></div><div>[&nbsp; 598.075392] uio_ivshmem 0000:00:0e.0: rw_section at=
 0x000000003f0f1000, size 0x0000000000009000</div><div>[&nbsp; 598.075401] =
uio_ivshmem 0000:00:0e.0: input_sections at 0x000000003f0fa000, size 0x0000=
000000006000</div><div>[&nbsp; 598.075406] uio_ivshmem 0000:00:0e.0: output=
_section at 0x000000003f0fa000, size 0x0000000000002000</div><div>[&nbsp; 5=
98.075993] uio_ivshmem 0000:00:0e.0: uio_ivshmem[0000:00:0e.0] requests irq=
 0</div><div>.....</div></div><div>[&nbsp; 598.076478] uio_ivshmem 0000:00:=
0e.0: uio_ivshmem[0000:00:0e.0] requests irq 15<br></div><div><br></div><di=
v><br></div><div><b>root cell print:</b></div><div><div><u>sudo ./tools/dem=
os/ivshmem-demo -t 1</u></div><div>open(sysfs) /sys/class/uio/uio0/maps/map=
0/size</div><div>ID =3D 0</div><div>Maximum peers =3D 3</div><div>open(sysf=
s) /sys/class/uio/uio0/maps/map1/size</div><div>open(sysfs) /sys/class/uio/=
uio0/maps/map2/size</div><div>open(sysfs) /sys/class/uio/uio0/maps/map3/siz=
e</div><div>open(sysfs) /sys/class/uio/uio0/maps/map4/size</div><div>state[=
0] =3D 1</div><div>state[1] =3D 0</div><div>state[2] =3D 0</div><div>rw[0] =
=3D 0</div><div>rw[1] =3D 0</div><div>rw[2] =3D -1347440721</div><div>in@0x=
0000 =3D 0</div><div>in@0x2000 =3D 0</div><div>in@0x4000 =3D -1347440721</d=
iv><div><br></div><div>Sending interrupt 1 to peer 1</div><div>Sending inte=
rrupt 1 to peer 1</div></div><div>...</div><div><br></div><div><br></div><d=
iv><b>non-root cell print:</b></div><div><div>IVSHMEM: bar0 is at 0x0000000=
0ff000000</div><div>IVSHMEM: bar1 is at 0x00000000ff001000</div><div>IVSHME=
M: ID is 1</div><div>IVSHMEM: max. peers is 3</div><div>IVSHMEM: state tabl=
e is at 0x000000003f0f0000</div><div>IVSHMEM: R/W section is at 0x000000003=
f0f1000</div><div>IVSHMEM: input sections start at 0x000000003f0fa000</div>=
<div>IVSHMEM: output section is at 0x000000003f0fc000</div><div>IVSHMEM: in=
itialized device</div><div>state[0] =3D 1</div><div>state[1] =3D 2</div><di=
v>state[2] =3D 0</div><div>rw[0] =3D 0</div><div>rw[1] =3D 0</div><div>rw[2=
] =3D -1347440721</div><div>in@0x0000 =3D 0</div><div>in@0x2000 =3D 0</div>=
<div>in@0x4000 =3D -1347440721</div><div><br></div><div>IVSHMEM: got interr=
upt 1 (#1)</div><div>state[0] =3D 1</div><div>state[1] =3D 2</div><div>stat=
e[2] =3D 0</div><div>rw[0] =3D 0</div><div>rw[1] =3D 1</div><div>rw[2] =3D =
-1347440721</div><div>in@0x0000 =3D 0</div><div>in@0x2000 =3D 10</div><div>=
in@0x4000 =3D -1347440721</div><div><br></div><div>IVSHMEM: sending IRQ 2 t=
o peer 0</div><div><br></div><div>IVSHMEM: got interrupt 1 (#2)</div><div>s=
tate[0] =3D 1</div><div>state[1] =3D 2</div><div>state[2] =3D 0</div><div>r=
w[0] =3D 0</div><div>rw[1] =3D 2</div><div>rw[2] =3D -1347440721</div><div>=
in@0x0000 =3D 0</div><div>in@0x2000 =3D 20</div><div>in@0x4000 =3D -1347440=
721</div><div><br></div><div>IVSHMEM: sending IRQ 2 to peer 0</div></div><d=
iv>......</div><div><br></div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e52ea42b-f7ac-4f70-b23f-717c5d530dc5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e52ea42b-f7ac-4f70-b23f-717c5d530dc5n%40googlegroups.co=
m</a>.<br />

------=_Part_1713_1377027820.1626192554948--

------=_Part_1712_1228712098.1626192554947
Content-Type: text/x-csrc; charset=US-ASCII; name=non-root-cell.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=non-root-cell.c
X-Attachment-Id: 3ff4b1fa-a701-4ae3-9f84-a985813b6524
Content-ID: <3ff4b1fa-a701-4ae3-9f84-a985813b6524>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Minimal configuration for ivshmem inmate demo:
 * 1 CPU, 1MB RAM, serial ports, 4K shmem
 *
 * Copyright (c) Siemens AG, 2013, 2014
 *
 * Authors:
 *  Henning Schild <henning.schild@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[11];
	struct jailhouse_pio pio_regions[2];
	struct jailhouse_pci_device pci_devices[1];
	struct jailhouse_pci_capability pci_caps[0];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "ivshmem-demo",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
			JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,
		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_irqchips = 0,
		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
		.num_pci_caps = ARRAY_SIZE(config.pci_caps),

		.console = {
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO,
			.address = 0x3f8,
		},
	},

	.cpus = {
		0b0010,
	},

	.mem_regions = {
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
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x3f0fe000,
			.virt_start = 0x3f0fe000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		/* RAM */
		{
			.phys_start = 0x3ee00000,
			.virt_start = 0,
			.size = 0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */ {
			.virt_start = 0x00100000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_COMM_REGION,
		},
	},

	.pio_regions = {
		PIO_RANGE(0x2f8, 8), /* serial 2 */
		PIO_RANGE(0x3f8, 8), /* serial 1 */
	},

	.pci_devices = {
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0000,
			.bdf = 0x0e << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 16,
			.shmem_regions_start = 0,
			.shmem_dev_id = 1,
			.shmem_peers = 3,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
	},
};

------=_Part_1712_1228712098.1626192554947
Content-Type: text/x-csrc; charset=US-ASCII; name=root-cell.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=root-cell.c
X-Attachment-Id: 6cff2a78-97f0-4759-b189-0be065a4b956
Content-ID: <6cff2a78-97f0-4759-b189-0be065a4b956>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) Siemens AG, 2014-2017
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * Alternatively, you can use or redistribute this file under the following
 * BSD license:
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Configuration for Prodrive Technologies B.V. Zeus-2S-4209T-1U
 * created with '/usr/local/libexec/jailhouse/jailhouse config create --mem-hv 16M --mem-inmates 240M sysconfig.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x10000000$0x3a000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[134];
	struct jailhouse_irqchip irqchips[9];
	struct jailhouse_pio pio_regions[21];
	struct jailhouse_pci_device pci_devices[222];
	struct jailhouse_pci_capability pci_caps[123];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x3a000000,
			.size = 0x1000000,
		},
		.debug_console = {
			.address = 0x3f8,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xa0000000,
			.pci_mmconfig_end_bus = 0xff,
			.iommu_units = {
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xdf7fc000,
					.size = 0x1000,
				},
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xe8ffc000,
					.size = 0x1000,
				},
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xf27fc000,
					.size = 0x1000,
				},
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xfbffc000,
					.size = 0x1000,
				},
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xc2ffc000,
					.size = 0x1000,
				},
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xcc7fc000,
					.size = 0x1000,
				},
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xd5ffc000,
					.size = 0x1000,
				},
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xb97fc000,
					.size = 0x1000,
				},
			},
			.x86 = {
				.pm_timer_address = 0x508,
				.vtd_interrupt_limit = 1024,
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
		0x000000000000ffff,
	},

	.mem_regions = {
	/* IVSHMEM shared memory regions (demo) */
		{
			.phys_start = 0x3f0f0000,
			.virt_start = 0x3f0f0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ,
		},
		{
			.phys_start = 0x3f0f1000,
			.virt_start = 0x3f0f1000,
			.size = 0x9000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		{
			.phys_start = 0x3f0fa000,
			.virt_start = 0x3f0fa000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		{
			.phys_start = 0x3f0fc000,
			.virt_start = 0x3f0fc000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ,
		},
		{
			.phys_start = 0x3f0fe000,
			.virt_start = 0x3f0fe000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ,
		},
		/* MemRegion: 00000000-0006efff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0x6f000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00070000-0007ffff : System RAM */
		{
			.phys_start = 0x70000,
			.virt_start = 0x70000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 000f0000-000fffff : System ROM */
		{
			.phys_start = 0xf0000,
			.virt_start = 0xf0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 00100000-39ffffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0x39f00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 4a000000-74e59fff : System RAM */
		{
			.phys_start = 0x4a000000,
			.virt_start = 0x4a000000,
			.size = 0x2ae5a000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 74e9c000-86dfefff : System RAM */
		{
			.phys_start = 0x74e9c000,
			.virt_start = 0x74e9c000,
			.size = 0x11f63000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 74e5a000-74e9bfff : RESERVED */
		{
			.phys_start = 0x74e5a000,
			.virt_start = 0x74e5a000,
			.size = 0x42000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		/* MemRegion : Reserved but expectedly used for RMRR and APEI ERST*/
		{
			.phys_start = 0x86dff000,
			.virt_start = 0x86dff000,
			.size =       0x0b700000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_EXECUTE |
				JAILHOUSE_MEM_ROOTSHARED
		},
		/* /1* MemRegion: 89f5b018-89f5b06f : APEI ERST *1/ */
		/* { */
		/* 	.phys_start = 0x89f5b018, */
		/* 	.virt_start = 0x89f5b018, */
		/* 	.size = 0x1000, */
		/* 	.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, */
		/* }, */
		/* /1* MemRegion: 89f5b070-89f5d017 : APEI ERST *1/ */
		/* { */
		/* 	.phys_start = 0x89f5b070, */
		/* 	.virt_start = 0x89f5b070, */
		/* 	.size = 0x2000, */
		/* 	.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, */
		/* }, */
		/* MemRegion: 924ff000-934fefff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x924ff000,
			.virt_start = 0x924ff000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA
		},
		/* MemRegion: 934ff000-93ffefff : ACPI Tables */
		{
			.phys_start = 0x934ff000,
			.virt_start = 0x934ff000,
			.size = 0xb00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 93fff000-93ffffff : System RAM */
		{
			.phys_start = 0x93fff000,
			.virt_start = 0x93fff000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: b4000000-b7ffffff : 0000:05:00.0 */
		{
			.phys_start = 0xb4000000,
			.virt_start = 0xb4000000,
			.size = 0x4000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8040000-b805ffff : 0000:05:00.0 */
		{
			.phys_start = 0xb8040000,
			.virt_start = 0xb8040000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8100000-b8102fff : nvme */
		{
			.phys_start = 0xb8100000,
			.virt_start = 0xb8100000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8200000-b82fffff : 0000:03:00.0 */
		{
			.phys_start = 0xb8200000,
			.virt_start = 0xb8200000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8300000-b83fffff : igb */
		{
			.phys_start = 0xb8300000,
			.virt_start = 0xb8300000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8401000-b8403fff : igb */
		{
			.phys_start = 0xb8401000,
			.virt_start = 0xb8401000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8500000-b851ffff : igb */
		{
			.phys_start = 0xb8500000,
			.virt_start = 0xb8500000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8520000-b853ffff : igb */
		{
			.phys_start = 0xb8520000,
			.virt_start = 0xb8520000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8540000-b855ffff : igb */
		{
			.phys_start = 0xb8540000,
			.virt_start = 0xb8540000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8560000-b857ffff : igb */
		{
			.phys_start = 0xb8560000,
			.virt_start = 0xb8560000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8581000-b8583fff : igb */
		{
			.phys_start = 0xb8581000,
			.virt_start = 0xb8581000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8585000-b8587fff : igb */
		{
			.phys_start = 0xb8585000,
			.virt_start = 0xb8585000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8589000-b858bfff : igb */
		{
			.phys_start = 0xb8589000,
			.virt_start = 0xb8589000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b858d000-b858ffff : igb */
		{
			.phys_start = 0xb858d000,
			.virt_start = 0xb858d000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8600000-b867ffff : ahci */
		{
			.phys_start = 0xb8600000,
			.virt_start = 0xb8600000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8680000-b86fffff : ahci */
		{
			.phys_start = 0xb8680000,
			.virt_start = 0xb8680000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8700000-b8703fff : 0000:00:1f.2 */
		{
			.phys_start = 0xb8700000,
			.virt_start = 0xb8700000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8704000-b8705fff : ahci */
		{
			.phys_start = 0xb8704000,
			.virt_start = 0xb8704000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8706000-b8707fff : ahci */
		{
			.phys_start = 0xb8706000,
			.virt_start = 0xb8706000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b8709000-b87090ff : ahci */
		{
			.phys_start = 0xb8709000,
			.virt_start = 0xb8709000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b870b000-b870bfff : mei_me */
		{
			.phys_start = 0xb870b000,
			.virt_start = 0xb870b000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b870c000-b870c0ff : ahci */
		{
			.phys_start = 0xb870c000,
			.virt_start = 0xb870c000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b870d000-b870dfff : 0000:00:05.4 */
		{
			.phys_start = 0xb870d000,
			.virt_start = 0xb870d000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b9800000-b9800fff : 0000:17:05.4 */
		{
			.phys_start = 0xb9800000,
			.virt_start = 0xb9800000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c3000000-c3ffffff : i40e */
		{
			.phys_start = 0xc3000000,
			.virt_start = 0xc3000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c4000000-c4ffffff : i40e */
		{
			.phys_start = 0xc4000000,
			.virt_start = 0xc4000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c5000000-c57fffff : 0000:3d:00.1 */
		{
			.phys_start = 0xc5000000,
			.virt_start = 0xc5000000,
			.size = 0x800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c5800000-c5ffffff : 0000:3d:00.0 */
		{
			.phys_start = 0xc5800000,
			.virt_start = 0xc5800000,
			.size = 0x800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c6001000-c6007fff : i40e */
		{
			.phys_start = 0xc6001000,
			.virt_start = 0xc6001000,
			.size = 0x7000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c6009000-c600ffff : i40e */
		{
			.phys_start = 0xc6009000,
			.virt_start = 0xc6009000,
			.size = 0x7000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c6010000-c610ffff : 0000:3d:00.1 */
		{
			.phys_start = 0xc6010000,
			.virt_start = 0xc6010000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c6110000-c620ffff : 0000:3d:00.0 */
		{
			.phys_start = 0xc6110000,
			.virt_start = 0xc6110000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c6300000-c637ffff : 0000:3d:00.1 */
		{
			.phys_start = 0xc6300000,
			.virt_start = 0xc6300000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c6380000-c63fffff : 0000:3d:00.0 */
		{
			.phys_start = 0xc6380000,
			.virt_start = 0xc6380000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c6400000-c64fffff : 0000:3b:00.0 */
		{
			.phys_start = 0xc6400000,
			.virt_start = 0xc6400000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c6500000-c651ffff : 0000:3b:00.0 */
		{
			.phys_start = 0xc6500000,
			.virt_start = 0xc6500000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c6600000-c6600fff : 0000:3a:05.4 */
		{
			.phys_start = 0xc6600000,
			.virt_start = 0xc6600000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: cc800000-cc800fff : 0000:5d:05.4 */
		{
			.phys_start = 0xcc800000,
			.virt_start = 0xcc800000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d6000000-d6000fff : 0000:80:05.4 */
		{
			.phys_start = 0xd6000000,
			.virt_start = 0xd6000000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: df800000-df800fff : 0000:85:05.4 */
		{
			.phys_start = 0xdf800000,
			.virt_start = 0xdf800000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: e9000000-e9000fff : 0000:ae:05.4 */
		{
			.phys_start = 0xe9000000,
			.virt_start = 0xe9000000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f2800000-f2800fff : 0000:d7:05.4 */
		{
			.phys_start = 0xf2800000,
			.virt_start = 0xf2800000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd000000-fdabffff : pnp 00:03 */
		{
			.phys_start = 0xfd000000,
			.virt_start = 0xfd000000,
			.size = 0xac0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fdad0000-fdadffff : pnp 00:03 */
		{
			.phys_start = 0xfdad0000,
			.virt_start = 0xfdad0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fdb00000-fdffffff : pnp 00:03 */
		{
			.phys_start = 0xfdb00000,
			.virt_start = 0xfdb00000,
			.size = 0x500000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe000000-fe00ffff : pnp 00:03 */
		{
			.phys_start = 0xfe000000,
			.virt_start = 0xfe000000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe010000-fe010fff : 0000:00:1f.5 */
		{
			.phys_start = 0xfe010000,
			.virt_start = 0xfe010000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe011000-fe01ffff : pnp 00:03 */
		{
			.phys_start = 0xfe011000,
			.virt_start = 0xfe011000,
			.size = 0xf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe036000-fe03bfff : pnp 00:03 */
		{
			.phys_start = 0xfe036000,
			.virt_start = 0xfe036000,
			.size = 0x6000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe03d000-fe3fffff : pnp 00:03 */
		{
			.phys_start = 0xfe03d000,
			.virt_start = 0xfe03d000,
			.size = 0x3c3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe410000-fe7fffff : pnp 00:03 */
		{
			.phys_start = 0xfe410000,
			.virt_start = 0xfe410000,
			.size = 0x3f0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
		{
			.phys_start = 0xfed00000,
			.virt_start = 0xfed00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed12000-fed1200f : pnp 00:01 */
		{
			.phys_start = 0xfed12000,
			.virt_start = 0xfed12000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed12010-fed1201f : pnp 00:01 */
		{
			.phys_start = 0xfed12010,
			.virt_start = 0xfed12010,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed1b000-fed1bfff : pnp 00:01 */
		{
			.phys_start = 0xfed1b000,
			.virt_start = 0xfed1b000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed20000-fed3ffff : pnp 00:02 */
		{
			.phys_start = 0xfed20000,
			.virt_start = 0xfed20000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed40000-fed44fff : 00:05 TPM */
		{
			.phys_start = 0xfed40000,
			.virt_start = 0xfed40000,
			.size = 0x5000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed45000-fed8bfff : pnp 00:01 */
		{
			.phys_start = 0xfed45000,
			.virt_start = 0xfed45000,
			.size = 0x47000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed90000-fed93fff : pnp 00:02 */
		{
			.phys_start = 0xfed90000,
			.virt_start = 0xfed90000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ff000000-ffffffff : pnp 00:02 */
		{
			.phys_start = 0xff000000,
			.virt_start = 0xff000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 100000000-3057ffffff : System RAM */
		{
			.phys_start = 0x100000000,
			.virt_start = 0x100000000,
			.size = 0x2f58000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 380000000000-380000ffffff : 0000:00:1f.1 */
		{
			.phys_start = 0x380000000000,
			.virt_start = 0x380000000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803ffe00000-3803ffe1ffff : 0000:01:00.3 */
		{
			.phys_start = 0x3803ffe00000,
			.virt_start = 0x3803ffe00000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803ffe20000-3803ffe3ffff : 0000:01:00.3 */
		{
			.phys_start = 0x3803ffe20000,
			.virt_start = 0x3803ffe20000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803ffe40000-3803ffe5ffff : 0000:01:00.2 */
		{
			.phys_start = 0x3803ffe40000,
			.virt_start = 0x3803ffe40000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803ffe60000-3803ffe7ffff : 0000:01:00.2 */
		{
			.phys_start = 0x3803ffe60000,
			.virt_start = 0x3803ffe60000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803ffe80000-3803ffe9ffff : 0000:01:00.1 */
		{
			.phys_start = 0x3803ffe80000,
			.virt_start = 0x3803ffe80000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803ffea0000-3803ffebffff : 0000:01:00.1 */
		{
			.phys_start = 0x3803ffea0000,
			.virt_start = 0x3803ffea0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803ffec0000-3803ffedffff : 0000:01:00.0 */
		{
			.phys_start = 0x3803ffec0000,
			.virt_start = 0x3803ffec0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803ffee0000-3803ffefffff : 0000:01:00.0 */
		{
			.phys_start = 0x3803ffee0000,
			.virt_start = 0x3803ffee0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff00000-3803fff0ffff : xhci-hcd */
		{
			.phys_start = 0x3803fff00000,
			.virt_start = 0x3803fff00000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff10000-3803fff11fff : ioatdma */
		{
			.phys_start = 0x3803fff10000,
			.virt_start = 0x3803fff10000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff13000-3803fff13fff : ioatdma */
		{
			.phys_start = 0x3803fff13000,
			.virt_start = 0x3803fff13000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff14000-3803fff15fff : ioatdma */
		{
			.phys_start = 0x3803fff14000,
			.virt_start = 0x3803fff14000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff17000-3803fff17fff : ioatdma */
		{
			.phys_start = 0x3803fff17000,
			.virt_start = 0x3803fff17000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff18000-3803fff19fff : ioatdma */
		{
			.phys_start = 0x3803fff18000,
			.virt_start = 0x3803fff18000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff1b000-3803fff1bfff : ioatdma */
		{
			.phys_start = 0x3803fff1b000,
			.virt_start = 0x3803fff1b000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff1c000-3803fff1dfff : ioatdma */
		{
			.phys_start = 0x3803fff1c000,
			.virt_start = 0x3803fff1c000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff1f000-3803fff1ffff : ioatdma */
		{
			.phys_start = 0x3803fff1f000,
			.virt_start = 0x3803fff1f000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff20000-3803fff21fff : ioatdma */
		{
			.phys_start = 0x3803fff20000,
			.virt_start = 0x3803fff20000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff23000-3803fff23fff : ioatdma */
		{
			.phys_start = 0x3803fff23000,
			.virt_start = 0x3803fff23000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff24000-3803fff25fff : ioatdma */
		{
			.phys_start = 0x3803fff24000,
			.virt_start = 0x3803fff24000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff27000-3803fff27fff : ioatdma */
		{
			.phys_start = 0x3803fff27000,
			.virt_start = 0x3803fff27000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff28000-3803fff29fff : ioatdma */
		{
			.phys_start = 0x3803fff28000,
			.virt_start = 0x3803fff28000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff2b000-3803fff2bfff : ioatdma */
		{
			.phys_start = 0x3803fff2b000,
			.virt_start = 0x3803fff2b000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff2c000-3803fff2dfff : ioatdma */
		{
			.phys_start = 0x3803fff2c000,
			.virt_start = 0x3803fff2c000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff2f000-3803fff2ffff : ioatdma */
		{
			.phys_start = 0x3803fff2f000,
			.virt_start = 0x3803fff2f000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff30000-3803fff30fff : 0000:00:16.4 */
		{
			.phys_start = 0x3803fff30000,
			.virt_start = 0x3803fff30000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3803fff31000-3803fff31fff : 0000:00:14.2 */
		{
			.phys_start = 0x3803fff31000,
			.virt_start = 0x3803fff31000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3807ff400000-3807ff7fffff : ntb_hw_intel */
		{
			.phys_start = 0x3807ff400000,
			.virt_start = 0x3807ff400000,
			.size = 0x400000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3807ff800000-3807ffbfffff : ntb_hw_intel */
		{
			.phys_start = 0x3807ff800000,
			.virt_start = 0x3807ff800000,
			.size = 0x400000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3807ffc00000-3807ffc01fff : ntb_hw_intel */
		{
			.phys_start = 0x3807ffc00000,
			.virt_start = 0x3807ffc00000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3807ffc03000-3807ffc0ffff : ntb_hw_intel */
		{
			.phys_start = 0x3807ffc03000,
			.virt_start = 0x3807ffc03000,
			.size = 0xd000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3813fff00000-3813fff01fff : ioatdma */
		{
			.phys_start = 0x3813fff00000,
			.virt_start = 0x3813fff00000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3813fff03000-3813fff03fff : ioatdma */
		{
			.phys_start = 0x3813fff03000,
			.virt_start = 0x3813fff03000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3813fff04000-3813fff05fff : ioatdma */
		{
			.phys_start = 0x3813fff04000,
			.virt_start = 0x3813fff04000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3813fff07000-3813fff07fff : ioatdma */
		{
			.phys_start = 0x3813fff07000,
			.virt_start = 0x3813fff07000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3813fff08000-3813fff09fff : ioatdma */
		{
			.phys_start = 0x3813fff08000,
			.virt_start = 0x3813fff08000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3813fff0b000-3813fff0bfff : ioatdma */
		{
			.phys_start = 0x3813fff0b000,
			.virt_start = 0x3813fff0b000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3813fff0c000-3813fff0dfff : ioatdma */
		{
			.phys_start = 0x3813fff0c000,
			.virt_start = 0x3813fff0c000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3813fff0f000-3813fff0ffff : ioatdma */
		{
			.phys_start = 0x3813fff0f000,
			.virt_start = 0x3813fff0f000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3813fff10000-3813fff11fff : ioatdma */
		{
			.phys_start = 0x3813fff10000,
			.virt_start = 0x3813fff10000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3813fff13000-3813fff13fff : ioatdma */
		{
			.phys_start = 0x3813fff13000,
			.virt_start = 0x3813fff13000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3813fff14000-3813fff15fff : ioatdma */
		{
			.phys_start = 0x3813fff14000,
			.virt_start = 0x3813fff14000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3813fff17000-3813fff17fff : ioatdma */
		{
			.phys_start = 0x3813fff17000,
			.virt_start = 0x3813fff17000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3813fff18000-3813fff19fff : ioatdma */
		{
			.phys_start = 0x3813fff18000,
			.virt_start = 0x3813fff18000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3813fff1b000-3813fff1bfff : ioatdma */
		{
			.phys_start = 0x3813fff1b000,
			.virt_start = 0x3813fff1b000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3813fff1c000-3813fff1dfff : ioatdma */
		{
			.phys_start = 0x3813fff1c000,
			.virt_start = 0x3813fff1c000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3813fff1f000-3813fff1ffff : ioatdma */
		{
			.phys_start = 0x3813fff1f000,
			.virt_start = 0x3813fff1f000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3817ff400000-3817ff7fffff : ntb_hw_intel */
		{
			.phys_start = 0x3817ff400000,
			.virt_start = 0x3817ff400000,
			.size = 0x400000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3817ff800000-3817ffbfffff : ntb_hw_intel */
		{
			.phys_start = 0x3817ff800000,
			.virt_start = 0x3817ff800000,
			.size = 0x400000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3817ffc00000-3817ffc01fff : ntb_hw_intel */
		{
			.phys_start = 0x3817ffc00000,
			.virt_start = 0x3817ffc00000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3817ffc03000-3817ffc0ffff : ntb_hw_intel */
		{
			.phys_start = 0x3817ffc03000,
			.virt_start = 0x3817ffc03000,
			.size = 0xd000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 93497000-93499fff : ACPI DMAR RMRR */
		/* PCI device: 00:14.0 */
		/* { */
		/* 	.phys_start = 0x93497000, */
		/* 	.virt_start = 0x93497000, */
		/* 	.size = 0x3000, */
		/* 	.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | */
		/* 		JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA, */
		/* }, */
		/* MemRegion: 3b000000-49ffffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x3b000000,
			.virt_start = 0x3b000000,
			.size = 0xf000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	},

	.irqchips = {
		/* IOAPIC 8, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0x7f0f8,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 9, GSI base 24 */
		{
			.address = 0xfec01000,
			.id = 0x7002c,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 10, GSI base 32 */
		{
			.address = 0xfec08000,
			.id = 0x4172c,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 11, GSI base 40 */
		{
			.address = 0xfec10000,
			.id = 0x53a2c,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 12, GSI base 48 */
		{
			.address = 0xfec18000,
			.id = 0x65d2c,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 15, GSI base 72 */
		{
			.address = 0xfec20000,
			.id = 0x802c,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 16, GSI base 80 */
		{
			.address = 0xfec28000,
			.id = 0x1852c,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 17, GSI base 88 */
		{
			.address = 0xfec30000,
			.id = 0x2ae2c,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 18, GSI base 96 */
		{
			.address = 0xfec38000,
			.id = 0x3d72c,
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
		/* Port I/O: 0061-0061 : PNP0800:00 */
		PIO_RANGE(0x61, 0x1),
		/* Port I/O: 0064-0064 : keyboard */
		PIO_RANGE(0x64, 0x1),
		/* Port I/O: 0070-0071 : rtc0 */
		PIO_RANGE(0x70, 0x2),
		/* Port I/O: 0080-008f : dma page reg */
		/* PIO_RANGE(0x80, 0x10), */
		/* Port I/O: 00a0-00a1 : pic2 */
		/* PIO_RANGE(0xa0, 0x2), */
		/* Port I/O: 00b2-00b2 : APEI ERST */
		// This seems to be needed too for BIOS/ERST interaction.
		PIO_RANGE(0xb2, 0x1),
		/* Port I/O: 00c0-00df : dma2 */
		/* PIO_RANGE(0xc0, 0x20), */
		/* Port I/O: 00f0-00f0 : PNP0C04:00 */
		/* PIO_RANGE(0xf0, 0x1), */
		/* Port I/O: 03f8-03ff : serial */
		PIO_RANGE(0x3f8, 0x8),
		/* Port I/O: 0400-0401 : wdat_wdt */
		/* PIO_RANGE(0x400, 0x2), */
		/* Port I/O: 0408-0409 : wdat_wdt */
		/* PIO_RANGE(0x408, 0x2), */
		/* Port I/O: 040a-040b : wdat_wdt */
		/* PIO_RANGE(0x40a, 0x2), */
		/* Port I/O: 040e-040e : wdat_wdt */
		/* PIO_RANGE(0x40e, 0x1), */
		/* Port I/O: 0412-0413 : wdat_wdt */
		/* PIO_RANGE(0x412, 0x2), */
		/* Port I/O: 0500-0503 : ACPI PM1a_EVT_BLK */
		/* PIO_RANGE(0x500, 0x4), */
		/* Port I/O: 0504-0505 : ACPI PM1a_CNT_BLK */
		/* PIO_RANGE(0x504, 0x2), */
		/* Port I/O: 0508-050b : ACPI PM_TMR */
		/* PIO_RANGE(0x508, 0x4), */
		/* Port I/O: 0510-0515 : ACPI CPU throttle */
		PIO_RANGE(0x510, 0x6),
		/* Port I/O: 0550-0550 : ACPI PM2_CNT_BLK */
		/* PIO_RANGE(0x550, 0x1), */
		/* Port I/O: 0580-059f : ACPI GPE0_BLK */
		/* PIO_RANGE(0x580, 0x20), */
		/* Port I/O: 0600-061f : pnp 00:01 */
		/* PIO_RANGE(0x600, 0x20), */
		/* Port I/O: 0800-081f : pnp 00:01 */
		/* PIO_RANGE(0x800, 0x20), */
		/* Port I/O: 0880-0883 : pnp 00:01 */
		/* PIO_RANGE(0x880, 0x4), */
		/* Port I/O: 0ca2-0ca2 : ipmi_si */
		/* PIO_RANGE(0xca2, 0x1), */
		/* Port I/O: 0ca3-0ca3 : ipmi_si */
		/* PIO_RANGE(0xca3, 0x1), */
		/* Port I/O: 0ca6-0cab : pnp 00:01 */
		/* PIO_RANGE(0xca6, 0x6), */
		/* Port I/O: 2000-207f : 0000:05:00.0 */
		PIO_RANGE(0x2000, 0x80),
		/* Port I/O: 3000-301f : 0000:03:00.0 */
		PIO_RANGE(0x3000, 0x20),
		/* Port I/O: 4000-401f : 0000:01:00.3 */
		PIO_RANGE(0x4000, 0x20),
		/* Port I/O: 4020-403f : 0000:01:00.2 */
		PIO_RANGE(0x4020, 0x20),
		/* Port I/O: 4040-405f : 0000:01:00.1 */
		PIO_RANGE(0x4040, 0x20),
		/* Port I/O: 4060-407f : 0000:01:00.0 */
		PIO_RANGE(0x4060, 0x20),
		/* Port I/O: 5000-501f : 0000:00:17.0 */
		PIO_RANGE(0x5000, 0x20),
		/* Port I/O: 5020-503f : 0000:00:11.5 */
		PIO_RANGE(0x5020, 0x20),
		/* Port I/O: 5040-5047 : 0000:00:17.0 */
		PIO_RANGE(0x5040, 0x8),
		/* Port I/O: 5048-504f : 0000:00:11.5 */
		PIO_RANGE(0x5048, 0x8),
		/* Port I/O: 5050-5053 : 0000:00:17.0 */
		PIO_RANGE(0x5050, 0x4),
		/* Port I/O: 5054-5057 : 0000:00:11.5 */
		PIO_RANGE(0x5054, 0x4),
	},

	.pci_devices = {
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.bdf = 0x0e << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 16,
			.shmem_regions_start = 0,
			.shmem_dev_id = 0,
			.shmem_peers = 3,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
		/* PCIDevice: 00:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 8,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:04.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x20,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0x3803fff2e000,
		},
		/* PCIDevice: 00:04.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x21,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0x3803fff2a000,
		},
		/* PCIDevice: 00:04.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x22,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0x3803fff26000,
		},
		/* PCIDevice: 00:04.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x23,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0x3803fff22000,
		},
		/* PCIDevice: 00:04.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x24,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0x3803fff1e000,
		},
		/* PCIDevice: 00:04.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x25,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0x3803fff1a000,
		},
		/* PCIDevice: 00:04.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x26,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0x3803fff16000,
		},
		/* PCIDevice: 00:04.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x27,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0x3803fff12000,
		},
		/* PCIDevice: 00:05.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x28,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:05.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x2a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:05.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x2c,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 14,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x40,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:08.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x41,
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
		/* PCIDevice: 00:08.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x42,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:11.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x88,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 17,
			.num_caps = 1,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:11.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8d,
			.bar_mask = {
				0xffffe000, 0xffffff00, 0xfffffff8,
				0xfffffffc, 0xffffffe0, 0xfff80000,
			},
			.caps_start = 18,
			.num_caps = 3,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xa0,
			.bar_mask = {
				0xffff0000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 21,
			.num_caps = 2,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xa2,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 23,
			.num_caps = 2,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:16.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xb0,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 25,
			.num_caps = 2,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:16.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xb4,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 25,
			.num_caps = 2,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:17.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xb8,
			.bar_mask = {
				0xffffe000, 0xffffff00, 0xfffffff8,
				0xfffffffc, 0xffffffe0, 0xfff80000,
			},
			.caps_start = 18,
			.num_caps = 3,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1c.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xe0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 27,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1c.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xe4,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 27,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1c.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xe5,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 27,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xe8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 27,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
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
		/* PCIDevice: 00:1f.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xf9,
			.bar_mask = {
				0xff000000, 0xffffffff, 0x00000000,
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
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xfa,
			.bar_mask = {
				0xffffc000, 0x00000000, 0x00000000,
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
		/* PCIDevice: 00:1f.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xfd,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
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
		/* PCIDevice: 01:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x100,
			.bar_mask = {
				0xfffe0000, 0x00000000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 34,
			.num_caps = 11,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 1,
			.num_msix_vectors = 10,
			.msix_region_size = 0x1000,
			.msix_address = 0xb858c000,
		},
		/* PCIDevice: 01:00.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x101,
			.bar_mask = {
				0xfffe0000, 0x00000000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 45,
			.num_caps = 10,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 1,
			.num_msix_vectors = 10,
			.msix_region_size = 0x1000,
			.msix_address = 0xb8588000,
		},
		/* PCIDevice: 01:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x102,
			.bar_mask = {
				0xfffe0000, 0x00000000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 45,
			.num_caps = 10,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 1,
			.num_msix_vectors = 10,
			.msix_region_size = 0x1000,
			.msix_address = 0xb8584000,
		},
		/* PCIDevice: 01:00.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x103,
			.bar_mask = {
				0xfffe0000, 0x00000000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 45,
			.num_caps = 10,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 1,
			.num_msix_vectors = 10,
			.msix_region_size = 0x1000,
			.msix_address = 0xb8580000,
		},
		/* PCIDevice: 03:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x300,
			.bar_mask = {
				0xfff00000, 0x00000000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 55,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 1,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0xb8400000,
		},
		/* PCIDevice: 04:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x400,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 62,
			.num_caps = 6,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 05:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x500,
			.bar_mask = {
				0xfc000000, 0xfffe0000, 0xffffff80,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 68,
			.num_caps = 2,
			.num_msi_vectors = 2,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 06:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x600,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 10,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 33,
			.msix_region_size = 0x1000,
			.msix_address = 0xb8103000,
		},
		/* PCIDevice: 17:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 4,
			.domain = 0x0,
			.bdf = 0x1700,
			.bar_mask = {
				0xffff0000, 0xffffffff, 0xffc00000,
				0xffffffff, 0xffc00000, 0xffffffff,
			},
			.caps_start = 80,
			.num_caps = 8,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 33,
			.msix_region_size = 0x1000,
			.msix_address = 0x3807ffc02000,
		},
		/* PCIDevice: 17:05.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1728,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 17:05.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x172a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 17:05.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x172c,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 14,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 17:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1740,
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
		/* PCIDevice: 17:08.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1741,
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
		/* PCIDevice: 17:08.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1742,
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
		/* PCIDevice: 17:08.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1743,
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
		/* PCIDevice: 17:08.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1744,
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
		/* PCIDevice: 17:08.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1745,
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
		/* PCIDevice: 17:08.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1746,
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
		/* PCIDevice: 17:08.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1747,
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
		/* PCIDevice: 17:09.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1748,
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
		/* PCIDevice: 17:09.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1749,
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
		/* PCIDevice: 17:0e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1770,
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
		/* PCIDevice: 17:0e.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1771,
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
		/* PCIDevice: 17:0e.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1772,
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
		/* PCIDevice: 17:0e.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1773,
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
		/* PCIDevice: 17:0e.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1774,
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
		/* PCIDevice: 17:0e.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1775,
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
		/* PCIDevice: 17:0e.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1776,
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
		/* PCIDevice: 17:0e.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1777,
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
		/* PCIDevice: 17:0f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1778,
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
		/* PCIDevice: 17:0f.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x1779,
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
		/* PCIDevice: 17:1d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x17e8,
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
		/* PCIDevice: 17:1d.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x17e9,
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
		/* PCIDevice: 17:1d.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x17ea,
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
		/* PCIDevice: 17:1d.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x17eb,
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
		/* PCIDevice: 17:1e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x17f0,
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
		/* PCIDevice: 17:1e.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x17f1,
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
		/* PCIDevice: 17:1e.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x17f2,
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
		/* PCIDevice: 17:1e.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x17f3,
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
		/* PCIDevice: 17:1e.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x17f4,
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
		/* PCIDevice: 17:1e.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x17f5,
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
		/* PCIDevice: 17:1e.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x17f6,
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
		/* PCIDevice: 3a:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a00,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 88,
			.num_caps = 11,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:05.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a28,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:05.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a2a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:05.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a2c,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 14,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a40,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:09.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a48,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0a.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a50,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0a.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a51,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0a.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a52,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0a.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a53,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0a.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a54,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0a.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a55,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0a.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a56,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0a.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a57,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0b.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a58,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0b.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a59,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0b.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a5a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0b.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a5b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0c.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a60,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0c.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a61,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0c.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a62,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0c.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a63,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0c.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a64,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0c.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a65,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0c.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a66,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0c.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a67,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a68,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0d.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a69,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0d.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a6a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3a:0d.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x3a6b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3b:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 5,
			.domain = 0x0,
			.bdf = 0x3b00,
			.bar_mask = {
				0xfffe0000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 101,
			.num_caps = 5,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3c:03.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 5,
			.domain = 0x0,
			.bdf = 0x3c18,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 106,
			.num_caps = 5,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3d:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 5,
			.domain = 0x0,
			.bdf = 0x3d00,
			.bar_mask = {
				0xff000000, 0xffffffff, 0x00000000,
				0xffff8000, 0xffffffff, 0x00000000,
			},
			.caps_start = 111,
			.num_caps = 10,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 1,
			.num_msix_vectors = 129,
			.msix_region_size = 0x1000,
			.msix_address = 0xc6008000,
		},
		/* PCIDevice: 3d:00.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 5,
			.domain = 0x0,
			.bdf = 0x3d01,
			.bar_mask = {
				0xff000000, 0xffffffff, 0x00000000,
				0xffff8000, 0xffffffff, 0x00000000,
			},
			.caps_start = 111,
			.num_caps = 10,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 1,
			.num_msix_vectors = 129,
			.msix_region_size = 0x1000,
			.msix_address = 0xc6000000,
		},
		/* PCIDevice: 5d:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5d00,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 88,
			.num_caps = 11,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 5d:05.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5d28,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 5d:05.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5d2a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 5d:05.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5d2c,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 14,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 5d:0e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5d70,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 5d:0e.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5d71,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 121,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 5d:0f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5d78,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 5d:0f.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5d79,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 121,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 5d:12.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5d90,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 5d:12.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5d91,
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
		/* PCIDevice: 5d:12.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5d92,
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
		/* PCIDevice: 5d:15.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5da8,
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
		/* PCIDevice: 5d:15.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5da9,
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
		/* PCIDevice: 5d:16.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5db0,
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
		/* PCIDevice: 5d:16.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5db1,
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
		/* PCIDevice: 5d:16.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5db4,
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
		/* PCIDevice: 5d:16.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x5db5,
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
		/* PCIDevice: 80:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8000,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 88,
			.num_caps = 11,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 80:04.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x8020,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0x3813fff1e000,
		},
		/* PCIDevice: 80:04.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x8021,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0x3813fff1a000,
		},
		/* PCIDevice: 80:04.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x8022,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0x3813fff16000,
		},
		/* PCIDevice: 80:04.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x8023,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0x3813fff12000,
		},
		/* PCIDevice: 80:04.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x8024,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0x3813fff0e000,
		},
		/* PCIDevice: 80:04.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x8025,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0x3813fff0a000,
		},
		/* PCIDevice: 80:04.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x8026,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0x3813fff06000,
		},
		/* PCIDevice: 80:04.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x8027,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0x3813fff02000,
		},
		/* PCIDevice: 80:05.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8028,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 80:05.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x802a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 80:05.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x802c,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 14,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 80:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8040,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 80:08.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8041,
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
		/* PCIDevice: 80:08.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8042,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 85:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x8500,
			.bar_mask = {
				0xffff0000, 0xffffffff, 0xffc00000,
				0xffffffff, 0xffc00000, 0xffffffff,
			},
			.caps_start = 80,
			.num_caps = 8,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 33,
			.msix_region_size = 0x1000,
			.msix_address = 0x3817ffc02000,
		},
		/* PCIDevice: 85:05.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8528,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 85:05.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x852a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 85:05.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x852c,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 14,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 85:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8540,
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
		/* PCIDevice: 85:08.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8541,
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
		/* PCIDevice: 85:08.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8542,
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
		/* PCIDevice: 85:08.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8543,
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
		/* PCIDevice: 85:08.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8544,
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
		/* PCIDevice: 85:08.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8545,
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
		/* PCIDevice: 85:08.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8546,
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
		/* PCIDevice: 85:08.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8547,
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
		/* PCIDevice: 85:09.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8548,
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
		/* PCIDevice: 85:09.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8549,
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
		/* PCIDevice: 85:0e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8570,
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
		/* PCIDevice: 85:0e.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8571,
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
		/* PCIDevice: 85:0e.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8572,
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
		/* PCIDevice: 85:0e.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8573,
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
		/* PCIDevice: 85:0e.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8574,
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
		/* PCIDevice: 85:0e.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8575,
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
		/* PCIDevice: 85:0e.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8576,
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
		/* PCIDevice: 85:0e.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8577,
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
		/* PCIDevice: 85:0f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8578,
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
		/* PCIDevice: 85:0f.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x8579,
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
		/* PCIDevice: 85:1d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x85e8,
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
		/* PCIDevice: 85:1d.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x85e9,
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
		/* PCIDevice: 85:1d.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x85ea,
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
		/* PCIDevice: 85:1d.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x85eb,
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
		/* PCIDevice: 85:1e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x85f0,
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
		/* PCIDevice: 85:1e.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x85f1,
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
		/* PCIDevice: 85:1e.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x85f2,
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
		/* PCIDevice: 85:1e.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x85f3,
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
		/* PCIDevice: 85:1e.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x85f4,
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
		/* PCIDevice: 85:1e.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x85f5,
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
		/* PCIDevice: 85:1e.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0x85f6,
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
		/* PCIDevice: ae:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae00,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 88,
			.num_caps = 11,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:05.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae28,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:05.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae2a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:05.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae2c,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 14,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae40,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:09.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae48,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0a.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae50,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0a.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae51,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0a.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae52,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0a.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae53,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0a.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae54,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0a.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae55,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0a.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae56,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0a.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae57,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0b.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae58,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0b.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae59,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0b.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae5a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0b.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae5b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0c.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae60,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0c.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae61,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0c.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae62,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0c.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae63,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0c.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae64,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0c.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae65,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0c.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae66,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0c.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae67,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae68,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0d.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae69,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0d.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae6a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ae:0d.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xae6b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: d7:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd700,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 88,
			.num_caps = 11,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: d7:05.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd728,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: d7:05.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd72a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: d7:05.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd72c,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 14,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: d7:0e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd770,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: d7:0e.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd771,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 121,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: d7:0f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd778,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: d7:0f.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd779,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 121,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: d7:12.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd790,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: d7:12.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd791,
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
		/* PCIDevice: d7:12.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd792,
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
		/* PCIDevice: d7:15.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd7a8,
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
		/* PCIDevice: d7:15.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd7a9,
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
		/* PCIDevice: d7:16.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd7b0,
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
		/* PCIDevice: d7:16.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd7b1,
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
		/* PCIDevice: d7:16.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd7b4,
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
		/* PCIDevice: d7:16.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 7,
			.domain = 0x0,
			.bdf = 0xd7b5,
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
	},

	.pci_caps = {
		/* PCIDevice: 00:00.0 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x90,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xe0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x144,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1d0,
			.len = 0xe,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x250,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x280,
			.len = 0x1c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x300,
			.len = 0x3c,
			.flags = 0,
		},
		/* PCIDevice: 00:04.0 */
		/* PCIDevice: 00:04.1 */
		/* PCIDevice: 00:04.2 */
		/* PCIDevice: 00:04.3 */
		/* PCIDevice: 00:04.4 */
		/* PCIDevice: 00:04.5 */
		/* PCIDevice: 00:04.6 */
		/* PCIDevice: 00:04.7 */
		/* PCIDevice: 80:04.0 */
		/* PCIDevice: 80:04.1 */
		/* PCIDevice: 80:04.2 */
		/* PCIDevice: 80:04.3 */
		/* PCIDevice: 80:04.4 */
		/* PCIDevice: 80:04.5 */
		/* PCIDevice: 80:04.6 */
		/* PCIDevice: 80:04.7 */
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0x80,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x90,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xe0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:05.0 */
		/* PCIDevice: 00:05.2 */
		/* PCIDevice: 00:08.0 */
		/* PCIDevice: 00:08.2 */
		/* PCIDevice: 17:05.0 */
		/* PCIDevice: 17:05.2 */
		/* PCIDevice: 3a:05.0 */
		/* PCIDevice: 3a:05.2 */
		/* PCIDevice: 5d:05.0 */
		/* PCIDevice: 5d:05.2 */
		/* PCIDevice: 5d:0e.0 */
		/* PCIDevice: 5d:0f.0 */
		/* PCIDevice: 5d:12.0 */
		/* PCIDevice: 80:05.0 */
		/* PCIDevice: 80:05.2 */
		/* PCIDevice: 80:08.0 */
		/* PCIDevice: 80:08.2 */
		/* PCIDevice: 85:05.0 */
		/* PCIDevice: 85:05.2 */
		/* PCIDevice: ae:05.0 */
		/* PCIDevice: ae:05.2 */
		/* PCIDevice: d7:05.0 */
		/* PCIDevice: d7:05.2 */
		/* PCIDevice: d7:0e.0 */
		/* PCIDevice: d7:0f.0 */
		/* PCIDevice: d7:12.0 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:05.4 */
		/* PCIDevice: 17:05.4 */
		/* PCIDevice: 3a:05.4 */
		/* PCIDevice: 5d:05.4 */
		/* PCIDevice: 80:05.4 */
		/* PCIDevice: 85:05.4 */
		/* PCIDevice: ae:05.4 */
		/* PCIDevice: d7:05.4 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x44,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xe0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:11.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x80,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:11.5 */
		/* PCIDevice: 00:17.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x70,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SATA,
			.start = 0xa8,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:14.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x70,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:14.2 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:16.0 */
		/* PCIDevice: 00:16.4 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x8c,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:1c.0 */
		/* PCIDevice: 00:1c.4 */
		/* PCIDevice: 00:1c.5 */
		/* PCIDevice: 00:1d.0 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x90,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xa0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x220,
			.len = 0x10,
			.flags = 0,
		},
		/* PCIDevice: 01:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0x18,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0x70,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0xa0,
			.len = 0x3c,
			.flags = 0,
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
		{
			.id = PCI_EXT_CAP_ID_ARI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SRIOV | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x160,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_TPH | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1a0,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1c0,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1d0,
			.len = 0x8,
			.flags = 0,
		},
		/* PCIDevice: 01:00.1 */
		/* PCIDevice: 01:00.2 */
		/* PCIDevice: 01:00.3 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0x18,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0x70,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0xa0,
			.len = 0x3c,
			.flags = 0,
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
		{
			.id = PCI_EXT_CAP_ID_ARI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SRIOV | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x160,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_TPH | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1a0,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1d0,
			.len = 0x8,
			.flags = 0,
		},
		/* PCIDevice: 03:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0x18,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0x70,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0xa0,
			.len = 0x3c,
			.flags = 0,
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
		{
			.id = PCI_EXT_CAP_ID_TPH | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1a0,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 04:00.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x78,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x80,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0xc0,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x800,
			.len = 0x40,
			.flags = 0,
		},
		/* PCIDevice: 05:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 06:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x70,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xb0,
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
			.start = 0x148,
			.len = 0xc,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PWR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x158,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x168,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x188,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x190,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 17:00.0 */
		/* PCIDevice: 85:00.0 */
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0x80,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x90,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xe0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x144,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1d0,
			.len = 0xe,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x280,
			.len = 0x1c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x300,
			.len = 0x3c,
			.flags = 0,
		},
		/* PCIDevice: 3a:00.0 */
		/* PCIDevice: 5d:00.0 */
		/* PCIDevice: 80:00.0 */
		/* PCIDevice: ae:00.0 */
		/* PCIDevice: d7:00.0 */
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x40,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x60,
			.len = 0x14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x90,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xe0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x110,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x148,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1d0,
			.len = 0xe,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x250,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x280,
			.len = 0x1c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x300,
			.len = 0x3c,
			.flags = 0,
		},
		/* PCIDevice: 3a:08.0 */
		/* PCIDevice: 3a:09.0 */
		/* PCIDevice: 3a:0a.0 */
		/* PCIDevice: 3a:0a.1 */
		/* PCIDevice: 3a:0a.2 */
		/* PCIDevice: 3a:0a.3 */
		/* PCIDevice: 3a:0a.4 */
		/* PCIDevice: 3a:0a.5 */
		/* PCIDevice: 3a:0a.6 */
		/* PCIDevice: 3a:0a.7 */
		/* PCIDevice: 3a:0b.0 */
		/* PCIDevice: 3a:0b.1 */
		/* PCIDevice: 3a:0b.2 */
		/* PCIDevice: 3a:0b.3 */
		/* PCIDevice: 3a:0c.0 */
		/* PCIDevice: 3a:0c.1 */
		/* PCIDevice: 3a:0c.2 */
		/* PCIDevice: 3a:0c.3 */
		/* PCIDevice: 3a:0c.4 */
		/* PCIDevice: 3a:0c.5 */
		/* PCIDevice: 3a:0c.6 */
		/* PCIDevice: 3a:0c.7 */
		/* PCIDevice: 3a:0d.0 */
		/* PCIDevice: 3a:0d.1 */
		/* PCIDevice: 3a:0d.2 */
		/* PCIDevice: 3a:0d.3 */
		/* PCIDevice: ae:08.0 */
		/* PCIDevice: ae:09.0 */
		/* PCIDevice: ae:0a.0 */
		/* PCIDevice: ae:0a.1 */
		/* PCIDevice: ae:0a.2 */
		/* PCIDevice: ae:0a.3 */
		/* PCIDevice: ae:0a.4 */
		/* PCIDevice: ae:0a.5 */
		/* PCIDevice: ae:0a.6 */
		/* PCIDevice: ae:0a.7 */
		/* PCIDevice: ae:0b.0 */
		/* PCIDevice: ae:0b.1 */
		/* PCIDevice: ae:0b.2 */
		/* PCIDevice: ae:0b.3 */
		/* PCIDevice: ae:0c.0 */
		/* PCIDevice: ae:0c.1 */
		/* PCIDevice: ae:0c.2 */
		/* PCIDevice: ae:0c.3 */
		/* PCIDevice: ae:0c.4 */
		/* PCIDevice: ae:0c.5 */
		/* PCIDevice: ae:0c.6 */
		/* PCIDevice: ae:0c.7 */
		/* PCIDevice: ae:0d.0 */
		/* PCIDevice: ae:0d.1 */
		/* PCIDevice: ae:0d.2 */
		/* PCIDevice: ae:0d.3 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 3b:00.0 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x80,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x88,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x10,
			.flags = 0,
		},
		/* PCIDevice: 3c:03.0 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x80,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x88,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x138,
			.len = 0x8,
			.flags = 0,
		},
		/* PCIDevice: 3d:00.0 */
		/* PCIDevice: 3d:00.1 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0x18,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0x70,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0xa0,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_VPD,
			.start = 0xe0,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ARI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SRIOV | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x160,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_TPH | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1a0,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1b0,
			.len = 0x8,
			.flags = 0,
		},
		/* PCIDevice: 5d:0e.1 */
		/* PCIDevice: 5d:0f.1 */
		/* PCIDevice: d7:0e.1 */
		/* PCIDevice: d7:0f.1 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0xf4,
			.flags = 0,
		},
	},
};

------=_Part_1712_1228712098.1626192554947--
