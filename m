Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBV5IYCBQMGQE3SVXW7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3c.google.com (mail-qv1-xf3c.google.com [IPv6:2607:f8b0:4864:20::f3c])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C22359835
	for <lists+jailhouse-dev@lfdr.de>; Fri,  9 Apr 2021 10:46:16 +0200 (CEST)
Received: by mail-qv1-xf3c.google.com with SMTP id p5sf2689247qvr.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 09 Apr 2021 01:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gNNu8Wc4dl78a//9JYtxzb6Xl+asqpk7RUhgd5gqxNk=;
        b=IfAdzJa35tiQ50tnHwfKn0fukpoyjl2QfKrHG7E/LwQS2j2kdqig96Dg033UCAeTPE
         OGQH9tfraIXlksVQVZIiWN8XB97fos2kMtiJhv2uMmmpzEPAVgz0mbWIIAJKMFIIQIHv
         5VT/V7RK44ipNHboeNZFodmdDhuI1A0ak2buL8cVRghZ01XeQV2Wul2drZGskeH7mV8T
         uv++Ldux+usGVcQP0CMFwmcX0B4ATUQ6oF255HgbRQLMPLCKb3db8O7MpvYQrsNMp83J
         DzGFQjIMHrxWFNX4mTAFyCgLMDSJQ4VN5V54JHCpzoGTnilbR1WJqLe+sjGQq/9jKFQd
         sung==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gNNu8Wc4dl78a//9JYtxzb6Xl+asqpk7RUhgd5gqxNk=;
        b=AABoNlPG36ReG+uLFHUVOuU2la+wSuW9ELS5KirNfM9RKKwSK2aSaPYudR3QFuofGl
         shyKZkxDAcSMbZfV5HtUM/waJgAiSCurkXTudRtKVYsDiVUzyUXw8LRYzj9F9YHOcwGm
         DbP4XO4lMqeKL9ePX1hiUoIKjqDQDEZGltOVCtOyr29laKx0ieZaWwHBpOoEtp/WYJNK
         s59VfkFO8pgTNcrhA9tjYBUi7hJf43KqE8hkqywEf6Zt/ZGXgw1ikINMJf+vMA/p4kNJ
         BB2ZtN1RmLtp9pq1YRCk1J1JyeN3zBhPMoPvopfipol1rqpcSrMOARcjwErSyNJau+Xt
         xukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gNNu8Wc4dl78a//9JYtxzb6Xl+asqpk7RUhgd5gqxNk=;
        b=Z7itpQkNcyYScaBI5yFtYi5WLr86Gy86qkRNoWZBuGseT+BxihbOJvn2Ov+NoICQ2X
         Ysj+IPRnrSN0sE5RgBAvGvuGgdfUs2Qh1ZGKLzm3SEDPglNgr49UX0sHbYR2eA9CyYla
         E+mEWx2Q+Ubiu+4aK+uPnaxVtYBweS//lgpaCOoK6JQEKLKZRNbaYkmdCFLnsZx2NnC5
         ZGJijNer90Ulf7oRrtLuvw0kDqVoQaMakyp5PUjql1rAAr36eKjqavoSJfK7I05J0wxN
         n85CgTQzG3G+QlOiHjh6tmQOd9OgCz2LCcrKZ8tysLnWk0rrX0CzMMkUD3UuDBXPJcX2
         u8qg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5307Dz9SAJVIyT8eNKXcXdGH3Z3KGBebw6g//fsojJrRYQ/ii9Oa
	JXN9rj1574t7VqhGNc4Bd5U=
X-Google-Smtp-Source: ABdhPJx+AAgrR1Ph1dhTmKTxfFwgNVYN9duNTrDHRXRy0jfZ3UPGzUP06OT2dhlqA2b01JLcdGG1Uw==
X-Received: by 2002:a05:620a:40e:: with SMTP id 14mr12721365qkp.200.1617957975868;
        Fri, 09 Apr 2021 01:46:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5a88:: with SMTP id c8ls3547126qtc.1.gmail; Fri, 09 Apr
 2021 01:46:15 -0700 (PDT)
X-Received: by 2002:ac8:7386:: with SMTP id t6mr8379477qtp.107.1617957975236;
        Fri, 09 Apr 2021 01:46:15 -0700 (PDT)
Date: Fri, 9 Apr 2021 01:46:14 -0700 (PDT)
From: Smith li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ed7d5b78-da24-41bb-8d36-605086fb26ben@googlegroups.com>
Subject: run two linux inmates on raspberry 4b
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3950_95464550.1617957974715"
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

------=_Part_3950_95464550.1617957974715
Content-Type: multipart/alternative; 
	boundary="----=_Part_3951_1348010669.1617957974715"

------=_Part_3951_1348010669.1617957974715
Content-Type: text/plain; charset="UTF-8"

These  file are my configurations to run two linux inmates on raspberry 4b.
Hardware memory is 2G.

How to use?
put three files into configs/arm64 folder, make , .c will be compiled to 
.cell
The OS and jailhouse I used is compiled from  jailhouse-image repository.

after run  "jailhouse enable rpi4-two-ivshmem-net-inmates.cell"  there will 
produce two  network device in root cell. one is set ip as 192.168.19.1 , 
the other should set by yourself to 192.168.20.1 

jailhouse cell linux rpi4-linux-demo1.cell \
/boot/vmlinuz* \
-d /etc/jailhouse/dts/inmate-rpi4.dtb \
-i /usr/libexec/jailhouse/demos/rootfs.cpio \
-c "console=ttyS0,115200 ip=192.168.19.2"

jailhouse cell linux rpi4-linux-demo2.cell \
/boot/vmlinuz* \
-d /etc/jailhouse/dts/inmate-rpi4.dtb \
-i /usr/libexec/jailhouse/demos/rootfs.cpio \
-c "console=ttyS0,115200 ip=192.168.20.2"

then the two inmate runs.

I take some content 
from  https://github.com/ekut-es/autojail/blob/master/configs/arm64/rpi4-two-ivshmem-net-inmates.c
But modified some content.

Wish this will help someone need it.

lake of doc make me headche.



-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ed7d5b78-da24-41bb-8d36-605086fb26ben%40googlegroups.com.

------=_Part_3951_1348010669.1617957974715
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

These&nbsp; file are my configurations to run two linux inmates on raspberr=
y 4b.<div>Hardware memory is 2G.</div><div><br></div><div>How to use?</div>=
<div>put three files into configs/arm64 folder, make , .c will be compiled =
to .cell</div><div>The OS and jailhouse I used is compiled from&nbsp; jailh=
ouse-image repository.</div><div><br></div><div>after run&nbsp; "jailhouse =
enable&nbsp;rpi4-two-ivshmem-net-inmates.cell"&nbsp; there will produce two=
&nbsp; network device in root cell. one is set ip as 192.168.19.1 , the oth=
er should set by yourself to 192.168.20.1&nbsp;</div><div><br></div><div><d=
iv>jailhouse cell linux rpi4-linux-demo1.cell \</div><div>/boot/vmlinuz* \<=
/div><div>-d /etc/jailhouse/dts/inmate-rpi4.dtb \</div><div>-i /usr/libexec=
/jailhouse/demos/rootfs.cpio \</div><div>-c "console=3DttyS0,115200 ip=3D19=
2.168.19.2"</div></div><div><br></div><div><div>jailhouse cell linux rpi4-l=
inux-demo2.cell \</div><div>/boot/vmlinuz* \</div><div>-d /etc/jailhouse/dt=
s/inmate-rpi4.dtb \</div><div>-i /usr/libexec/jailhouse/demos/rootfs.cpio \=
</div><div>-c "console=3DttyS0,115200 ip=3D192.168.20.2"</div></div><div><b=
r></div><div>then the two inmate runs.</div><div><br></div><div>I take some=
 content from&nbsp;&nbsp;https://github.com/ekut-es/autojail/blob/master/co=
nfigs/arm64/rpi4-two-ivshmem-net-inmates.c</div><div>But modified some cont=
ent.</div><div><br></div><div>Wish this will help someone need it.</div><di=
v><br></div><div>lake of doc make me headche.</div><div><br></div><div><br>=
</div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ed7d5b78-da24-41bb-8d36-605086fb26ben%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ed7d5b78-da24-41bb-8d36-605086fb26ben%40googlegroups.co=
m</a>.<br />

------=_Part_3951_1348010669.1617957974715--

------=_Part_3950_95464550.1617957974715
Content-Type: text/plain; charset=US-ASCII; name=rpi4-linux-demo2.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=rpi4-linux-demo2.c
X-Attachment-Id: 5d7f3670-fb6e-49df-a647-2de440810d8e
Content-ID: <5d7f3670-fb6e-49df-a647-2de440810d8e>



#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[16];
	struct jailhouse_irqchip irqchips[2];
	struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "linux-demo2",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),

		.vpci_irq_base = 185-32,

		.console = {
			.address = 0xfe215040,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_4,
		},
	},

	.cpus = {
		0b1000,
	},

	.mem_regions = {
		/* IVSHMEM shared memory regions (demo) */
		{
			.phys_start = 0x4faf0000,
			.virt_start = 0x4faf0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x4faf1000,
			.virt_start = 0x4faf1000,
			.size = 0x9000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x4fafa000,
			.virt_start = 0x4fafa000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x4fafc000,
			.virt_start = 0x4fafc000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x4fafe000,
			.virt_start = 0x4fafe000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		/* IVSHMEM shared memory region */
		JAILHOUSE_SHMEM_NET_REGIONS(0x4fb00000, 1),
		/* UART */ {
			.phys_start = 0xfe215040,
			.virt_start = 0xfe215040,
			.size = 0x40,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |
				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
		},
		/* RAM */ {
			.phys_start = 0x4f900000,
			.virt_start = 0,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
		},
		/* RAM */ {
			.phys_start = 0x40000000,
			.virt_start = 0x40000000,
			.size = 0x08000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */ {
			.virt_start = 0x80000000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_COMM_REGION,
		},

	},

	.irqchips = {
		/* GIC */ {
			.address = 0xff841000,
			.pin_base = 32,
			.pin_bitmap = {
				0,
				0,
				1 << (125 - 96),
				0,
			},
		},
		/* GIC */ {
			.address = 0xff841000,
			.pin_base = 160,
			.pin_bitmap = {
				(1 << (185 - 160)) | (1 << (187 - 160)),
				0,
				0,
				0
			},
		},
	},

	.pci_devices = {
		{ /* IVSHMEM 00:00.0 (demo) */
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 1,
			.bdf = 0 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
			.shmem_regions_start = 0,
			.shmem_dev_id = 2,
			.shmem_peers = 3,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
		{ /* IVSHMEM 00:01.0 (networking) */
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.bdf = 2 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
			.shmem_regions_start = 5,
			.shmem_dev_id = 1,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
	},
};

------=_Part_3950_95464550.1617957974715
Content-Type: text/plain; charset=US-ASCII; name=rpi4-linux-demo1.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=rpi4-linux-demo1.c
X-Attachment-Id: aff12669-3053-4655-9722-c0ac1098a3d1
Content-ID: <aff12669-3053-4655-9722-c0ac1098a3d1>



#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[16];
	struct jailhouse_irqchip irqchips[2];
	struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "linux-demo1",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),

		.vpci_irq_base = 185-32,

		.console = {
			.address = 0xfe215040,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_4,
		},
	},

	.cpus = {
		0b0100,
	},

	.mem_regions = {
		/* IVSHMEM shared memory regions (demo) */
		{
			.phys_start = 0x2faf0000,
			.virt_start = 0x2faf0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x2faf1000,
			.virt_start = 0x2faf1000,
			.size = 0x9000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x2fafa000,
			.virt_start = 0x2fafa000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x2fafc000,
			.virt_start = 0x2fafc000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x2fafe000,
			.virt_start = 0x2fafe000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		/* IVSHMEM shared memory region */
		JAILHOUSE_SHMEM_NET_REGIONS(0x2fb00000, 1),
		/* UART */ {
			.phys_start = 0xfe215040,
			.virt_start = 0xfe215040,
			.size = 0x40,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |
				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
		},
		/* RAM */ {
			.phys_start = 0x2f900000,
			.virt_start = 0,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
		},
		/* RAM */ {
			.phys_start = 0x20000000,
			.virt_start = 0x20000000,
			.size = 0x08000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */ {
			.virt_start = 0x80000000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_COMM_REGION,
		},

	},

	.irqchips = {
		/* GIC */ {
			.address = 0xff841000,
			.pin_base = 32,
			.pin_bitmap = {
				0,
				0,
				1 << (125 - 96),
				0,
			},
		},
		/* GIC */ {
			.address = 0xff841000,
			.pin_base = 160,
			.pin_bitmap = {
				(1 << (185 - 160)) | (1 << (186 - 160)),
				0,
				0,
				0
			},
		},
	},

	.pci_devices = {
		{ /* IVSHMEM 00:00.0 (demo) */
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 1,
			.bdf = 0 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
			.shmem_regions_start = 0,
			.shmem_dev_id = 1,
			.shmem_peers = 3,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
		{ /* IVSHMEM 00:01.0 (networking) */
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.bdf = 1 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
			.shmem_regions_start = 5,
			.shmem_dev_id = 1,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
	},
};

------=_Part_3950_95464550.1617957974715
Content-Type: text/plain; charset=US-ASCII; 
	name=rpi4-two-ivshmem-net-inmates.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=rpi4-two-ivshmem-net-inmates.c
X-Attachment-Id: fda91a89-ed0d-4ac2-a4df-7dfe6b67371c
Content-ID: <fda91a89-ed0d-4ac2-a4df-7dfe6b67371c>



#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[26];
	struct jailhouse_irqchip irqchips[2];
	struct jailhouse_pci_device pci_devices[3];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x2fc00000,
			//0x51000000,
			.size       = 0x00400000,
		},
		.debug_console = {
			.address = 0xfe215040,
			.size = 0x40,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_4,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xff900000,
			// 0xe0000000,
			.pci_mmconfig_end_bus = 0,
			.pci_is_virtual = 1,
			.pci_domain = 1,
			.arm = {
				.gic_version = 2,
				.gicd_base = 0xff841000,
				.gicc_base = 0xff842000,
				.gich_base = 0xff844000,
				.gicv_base = 0xff846000,
				.maintenance_irq = 25,
			},
		},
		.root_cell = {
			.name = "rpi4-two",

			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),

			.vpci_irq_base = 182 - 32,
		},
	},

	.cpus = {
		0b1111,
	},

	.mem_regions = {
		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
		{
			.phys_start = 0x2faf0000,
			.virt_start = 0x2faf0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ,
		},
		{
			.phys_start = 0x2faf1000,
			.virt_start = 0x2faf1000,
			.size = 0x9000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		{
			.phys_start = 0x2fafa000,
			.virt_start = 0x2fafa000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		{
			.phys_start = 0x2fafc000,
			.virt_start = 0x2fafc000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ,
		},
		{
			.phys_start = 0x2fafe000,
			.virt_start = 0x2fafe000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ,
		},
		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
		JAILHOUSE_SHMEM_NET_REGIONS(0x2fb00000, 0),
		/* IVSHMEM shared memory regions for 00:02.0 (networking) */
		JAILHOUSE_SHMEM_NET_REGIONS(0x4fb00000, 0),
		/* MMIO 1 (permissive) */ {
			.phys_start = 0xfd500000,
			.virt_start = 0xfd500000,
			.size =        0x1b00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* MMIO 2 (permissive) */ {
			.phys_start = 0x600000000,
			.virt_start = 0x600000000,
			.size =         0x4000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* RAM (0M-~762M) */ {
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0x2fa10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},

		/* ~2M reserved for shared memory regions */

		/* 4M reserved for the hypervisor */

		/* RAM (768M-4032M) */ {
			.phys_start = 0x30000000,
			.virt_start = 0x30000000,
			.size = 0xcc000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},

		/* RAM (4096M-8192M) */ {
			.phys_start = 0x100000000,
			.virt_start = 0x100000000,
			.size = 0x100000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/*gpio 0xfe200000-0xfe201000*/
		// {
			// .phys_start = 0xfe200000,
			// .virt_start = 0xfe200000,
			// .size = 0x1000,
			// .flags = JAILHOUSE_MEM_READ|JAILHOUSE_MEM_WRITE|JAILHOUSE_MEM_IO|JAILHOUSE_MEM_IO_8|JAILHOUSE_MEM_IO_16|JAILHOUSE_MEM_IO_32|JAILHOUSE_MEM_IO_64,
		// },
	},

	.irqchips = {
		/* GIC */ {
			.address = 0xff841000,
			.pin_base = 32,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* GIC */ {
			.address = 0xff841000,
			.pin_base = 160,
			.pin_bitmap = {
				0xffffffff, 0xffffffff
			},
		},
	},

	.pci_devices = {
		{ /* IVSHMEM 0001:00:00.0 (demo) */
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 1,
			.bdf = 0 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
			.shmem_regions_start = 0,
			.shmem_dev_id = 0,
			.shmem_peers = 3,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
		{ /* IVSHMEM 0001:00:01.0 (networking) */
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 1,
			.bdf = 1 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
			.shmem_regions_start = 5,
			.shmem_dev_id = 0,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
		{ /* IVSHMEM 0001:00:02.0 (networking) */
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 1,
			.bdf = 2 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
			.shmem_regions_start = 9,
			.shmem_dev_id = 0,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
	},
};

------=_Part_3950_95464550.1617957974715--
