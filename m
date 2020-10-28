Return-Path: <jailhouse-dev+bncBCJ2NIVKYUNBBDUF4X6AKGQEVCGPX2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id 9407F29CF62
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 11:06:08 +0100 (CET)
Received: by mail-qv1-xf38.google.com with SMTP id h12sf2698227qvk.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 03:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Iqb881nkpjp45w2tD1LeuQM4b4/Cz23NydraFct5yMQ=;
        b=KiMfurfaqib2o30etIA6FHECW0gbw8X4cx+iwNm/4PpuY9lPFQfTUyI7lqO0eOW5AU
         7sK2FGStLfqksDPyI9i+fgWw/88JFr9WIhqgVEy1N+KY3ONWIDZYfuHwanoTwe967G4i
         N7F9FDoDIjoQXe3gL0nilEWEK8dDGvAGSI6T17asTZpr5TSsWjg+g2sNmEbV57rhLhjF
         PiQpOd6jWFGhXBVL99uAudTC1NUMAbM5Mj9I+DHiGAIbcBRJWCmXlOY3anicWefxyrwq
         fKFfu3oEARo9LcpHNRoT7burUz+GbkqCpiGCTFn0hya8QgY7a/ux5OIx1WX1Bu8stfz6
         D9JA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Iqb881nkpjp45w2tD1LeuQM4b4/Cz23NydraFct5yMQ=;
        b=gt8v7u5QBbGhwcu/RWgMOg2tTZ1ZpBTXQRmBv84CwGKMystLciNpzrcxShsj6ADBne
         CBKBMZqd2XFl/PiBYyGj5CdJVL+VX0g8JXpFzRHZAo2ncOsd+QIZv53e62oBVMcvRneI
         6qOgBVIwuKaEJ9vf8AtJcSaX3FmnT+1jqGcESLyDmetK5O90IhU976ohMpoBPJSwcfZq
         yVcj3RScKyP8tbCYiDxpV1xB+1YWqcFmdhiCo3+Ws3kURR3rA9018XOaMwkf7kRgClHu
         H6tFDmeLqLJd9lwOO/uvNNNwwo2nyBXywcTesFkz1QuqVMFNF6r8QTQcxuvwAIQCw/3p
         OrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Iqb881nkpjp45w2tD1LeuQM4b4/Cz23NydraFct5yMQ=;
        b=QYQTnCz1NgGmh3b/2HINk1ZjvurWjCC/SKdRvOHPq45tFa29E+dtABl95fXpmtQZbr
         MGowap9BaCqPcrEKCVjbs6yVlNv6npEnq7DMbRZuC0uPvwGHFcw7rN4VOf3QSgtKErXn
         si53zpigMiU8qM4XoAG/Cg/w2+cL8UxOg7//TvxpDAOlIa244U/G9o7lwY4v743u+Cn5
         VuHIt0aiL7YSFmS1Nbn0aNHFFEjOA0TgbVHYbRnSCzR10aguiGXJt55a8vmT73sbJP88
         VDjpPCVInpUHfOo7B3GI8M43cQLOJISh75VFts9sZ0uSMuf1R+dZQ1JFuiTf+7jStzBR
         5nqQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530nqbkhHm2cngATbXYlnZ2K8Rgxb03hwygLoyIlUYGLfChb3ADA
	adKZlgYu2HK6k9+pUDfS4IQ=
X-Google-Smtp-Source: ABdhPJwNZWvJ64+gyEpNEqVrgVRnhnW6B1n4ejGHS7QC51a85Qg1W3h7vlIoFKDUew9qan77KSqWBA==
X-Received: by 2002:a37:7086:: with SMTP id l128mr6548490qkc.64.1603879566909;
        Wed, 28 Oct 2020 03:06:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:1248:: with SMTP id a8ls2206246qkl.11.gmail; Wed,
 28 Oct 2020 03:06:06 -0700 (PDT)
X-Received: by 2002:a37:7e42:: with SMTP id z63mr2680582qkc.307.1603879566105;
        Wed, 28 Oct 2020 03:06:06 -0700 (PDT)
Date: Wed, 28 Oct 2020 03:06:05 -0700 (PDT)
From: Peter pan <peter.panjf@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <58057754-ee40-4583-bd44-db19a6706069n@googlegroups.com>
Subject: Jailhouse hang on NXP ls1046a ARM64 platform
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_224_886665411.1603879565195"
X-Original-Sender: peter.panjf@gmail.com
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

------=_Part_224_886665411.1603879565195
Content-Type: multipart/alternative; 
	boundary="----=_Part_225_999389990.1603879565195"

------=_Part_225_999389990.1603879565195
Content-Type: text/plain; charset="UTF-8"

Hello Jailhouse Community,

I am trying to enable Jaihouse on NXP ls1046a platform which has four ARM 
A72 CPU Cores, but now the system hangs after I execute "jailhouse enable 
ls1046a.cell".

root@localhost:~/jailhouse/jailhouse# jailhouse enable ls1046a.cell

 

Initializing Jailhouse hypervisor v0.12 (73-gacdc9fcc-dirty) on CPU 2

Code location: 0x0000ffffc0200800

Page pool usage after early setup: mem 39/992, remap 0/131072

Initializing processors:

 CPU 2... OK

 CPU 0... OK

 CPU 1... OK

 CPU 3... OK

Initializing unit: irqchip

Initializing unit: ARM SMMU v3

Initializing unit: ARM SMMU

No SMMU

Initializing unit: PVU IOMMU

Initializing unit: PCI

Adding virtual PCI device 00:00.0 to cell "ls1046"

Adding virtual PCI device 00:01.0 to cell "ls1046"

Page pool usage after late setup: mem 62/992, remap 5/131072

Activating hypervisor

WARN: unknown SGI received 5

WARN: unknown SGI received 5

//Linux hang here.

After did some debuging,  I found the issue is with the followng calling.

on_each_cpu(enter_hypervisor, header, 0);

The following is definition of on_each_cpu.

611 void on_each_cpu(void (*func) (void *info), void *info, int wait)

612 {

613         unsigned long flags;

614

615         preempt_disable();

616         smp_call_function(func, info, wait);

617         local_irq_save(flags);

618         func(info);

//Can panic here if call panic("return from hypervisor\n");

619         local_irq_restore(flags);  

//System hang and can't panic here if call panic("return from 
hypervisor\n");  

620         preempt_enable();

621 }

622 EXPORT_SYMBOL(on_each_cpu);
I found the system hangs just after execute  local_irq_restore(flags), 
because the system can panic if I call panic() just before 
local_irq_restore(), but can't panic if add panic() just after 
local_irq_restore().

I attached ls1046a.c. 

I am a newbies of Jailhouse,  how to debug such issue? any comments or 
suggestion is Welcome, thanks.


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/58057754-ee40-4583-bd44-db19a6706069n%40googlegroups.com.

------=_Part_225_999389990.1603879565195
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jailhouse Community,<div><br></div><div>I am trying to enable Jaihous=
e on NXP ls1046a platform which has four ARM A72 CPU Cores, but now the sys=
tem hangs after I execute "jailhouse enable ls1046a.cell".</div><div><br></=
div><div><p><font color=3D"#ff0000">root@localhost:~/jailhouse/jailhouse#
jailhouse enable ls1046a.cell</font></p>

<p><font color=3D"#ff0000">&nbsp;</font></p>

<p><font color=3D"#ff0000">Initializing
Jailhouse hypervisor v0.12 (73-gacdc9fcc-dirty) on CPU 2</font></p>

<p><font color=3D"#ff0000">Code location:
0x0000ffffc0200800</font></p>

<p><font color=3D"#ff0000">Page pool usage
after early setup: mem 39/992, remap 0/131072</font></p>

<p><font color=3D"#ff0000">Initializing
processors:</font></p>

<p><font color=3D"#ff0000">&nbsp;CPU 2... OK</font></p>

<p><font color=3D"#ff0000">&nbsp;CPU 0... OK</font></p>

<p><font color=3D"#ff0000">&nbsp;CPU 1... OK</font></p>

<p><font color=3D"#ff0000">&nbsp;CPU 3... OK</font></p>

<p><font color=3D"#ff0000">Initializing unit:
irqchip</font></p>

<p><font color=3D"#ff0000">Initializing unit:
ARM SMMU v3</font></p>

<p><font color=3D"#ff0000">Initializing unit:
ARM SMMU</font></p>

<p><font color=3D"#ff0000">No SMMU</font></p>

<p><font color=3D"#ff0000">Initializing unit:
PVU IOMMU</font></p>

<p><font color=3D"#ff0000">Initializing unit:
PCI</font></p>

<p><font color=3D"#ff0000">Adding virtual PCI
device 00:00.0 to cell "ls1046"</font></p>

<p><font color=3D"#ff0000">Adding virtual PCI
device 00:01.0 to cell "ls1046"</font></p>

<p><font color=3D"#ff0000">Page pool usage
after late setup: mem 62/992, remap 5/131072</font></p>

<p><font color=3D"#ff0000">Activating
hypervisor</font></p>

<p><font color=3D"#ff0000">WARN: unknown SGI
received 5</font></p>

<p><font color=3D"#ff0000">WARN: unknown SGI
received 5</font></p><p>//Linux hang here.</p><p><font color=3D"#000000">Af=
ter did some debuging,&nbsp; I found the issue is with the followng calling=
.</font></p><p><font color=3D"#000000">on_each_cpu(enter_hypervisor, header=
, 0);<br></font></p><p>The following is definition of on_each_cpu.</p><p><f=
ont color=3D"#000000">611 void on_each_cpu(void (*func) (void *info), void =
*info, int wait)</font></p><p><font color=3D"#000000">612 {</font></p><p><f=
ont color=3D"#000000">613&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned long fl=
ags;</font></p><p><font color=3D"#000000">614</font></p><p><font color=3D"#=
000000">615&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;preempt_disable();</font></p><=
p><font color=3D"#000000">616&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;smp_call_fun=
ction(func, info, wait);</font></p><p><font color=3D"#000000">617&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;local_irq_save(flags);</font></p><p><font color=3D"=
#000000">618&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;func(info);</font></p><p><fon=
t color=3D"#000000">//Can panic here if call panic("return from hypervisor\=
n");</font></p><p><font color=3D"#000000">619&nbsp; &nbsp; &nbsp; &nbsp; </=
font><font color=3D"#ff0000">&nbsp;local_irq_restore(flags);&nbsp;&nbsp;</f=
ont></p><p>//System hang and can't panic here if call panic("return from hy=
pervisor\n");&nbsp;&nbsp;<font color=3D"#ff0000"><br></font></p><p><font co=
lor=3D"#000000">620&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;preempt_enable();</fon=
t></p><p><font color=3D"#000000">621 }</font></p><p><font color=3D"#000000"=
></font></p><p><font color=3D"#000000">622 EXPORT_SYMBOL(on_each_cpu);</fon=
t></p></div><div>I found the system hangs just after execute&nbsp; local_ir=
q_restore(flags), because the system can panic if I call panic() just befor=
e local_irq_restore(), but can't panic if add panic() just after local_irq_=
restore().</div><div><br></div><div>I attached ls1046a.c.&nbsp;<br></div><d=
iv><br></div><div>I am a&nbsp;newbies of Jailhouse,&nbsp; how to debug such=
 issue? any comments or suggestion is Welcome, thanks.</div><div><br></div>=
<div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/58057754-ee40-4583-bd44-db19a6706069n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/58057754-ee40-4583-bd44-db19a6706069n%40googlegroups.co=
m</a>.<br />

------=_Part_225_999389990.1603879565195--

------=_Part_224_886665411.1603879565195
Content-Type: text/x-csrc; charset=US-ASCII; name=ls1046a.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ls1046a.c
X-Attachment-Id: 37c597cd-056d-4ed1-af43-979325102b8b
Content-ID: <37c597cd-056d-4ed1-af43-979325102b8b>

/*
 * ls1046a target - linux-demo
 *
 * Copyright 2020 NXP
 *
 * Authors:
 *  Jiafei Pan <jiafei.pan@nxp.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[16];
	struct jailhouse_irqchip irqchips[2];
	struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0xfba00000,
			.size =       0x00400000,
		},
		.debug_console = {
			.address = 0x21c0500,
			.size = 0x100,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xfb500000,
			.pci_mmconfig_end_bus = 0,
			.pci_is_virtual = 1,
			.pci_domain = -1,

			.arm = {
				.gic_version = 2,
				.gicd_base = 0x1410000,
				.gicc_base = 0x142f000,
				.gich_base = 0x1440000,
				.gicv_base = 0x146f000,
				.maintenance_irq = 25,
			},
		},
		.root_cell = {
			.name = "ls1046",

			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.vpci_irq_base = 102-32, /* Not include 32 base */
		},
	},

	.cpus = {
		0xf,
	},

	.mem_regions = {
		/* IVHSMEM shared memory region for 00:00.0 */ {
			.phys_start = 0xfb700000,
			.virt_start = 0xfb700000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ,
		},
		{
			.phys_start = 0xfb701000,
			.virt_start = 0xfb701000,
			.size = 0x9000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		{
			.phys_start = 0xfb70a000,
			.virt_start = 0xfb70a000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ,
		},
		{
			.phys_start = 0xfb70c000,
			.virt_start = 0xfb70c000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ,
		},
		{
			.phys_start = 0xfb70e000,
			.virt_start = 0xfb70e000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 1),
		/* RAM - 1GB - root cell */ {
			.phys_start = 0x80000000,
			.virt_start = 0x80000000,
			.size = 0x40000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* RAM: Inmate */ {
			.phys_start = 0xc0000000,
			.virt_start = 0xc0000000,
			.size = 0x3b500000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* RAM: loader */ {
			.phys_start = 0xbf900000,
			.virt_start = 0xbf900000,
			.size = 0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},

		/* duart1 */ {
			.phys_start = 0x021c0000,
			.virt_start = 0x021c0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* duart2 */ {
			.phys_start = 0x021d0000,
			.virt_start = 0x021d0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* CCSR */ {
			.phys_start = 0x01000000,
			.virt_start = 0x01000000,
			.size = 0x0f000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* DCSR */ {
			.phys_start = 0x20000000,
			.virt_start = 0x20000000,
			.size = 0x04000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},

	},

	.irqchips = {
		/* GIC */ {
			.address = 0x1410000,
			.pin_base = 32,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* GIC */ {
			.address = 0x1410000,
			.pin_base = 160,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pci_devices = {
		{ /* IVSHMEM 00:00.0 (demo) */
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0,
			.bdf = 0 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
			.shmem_regions_start = 0,
			.shmem_dev_id = 0,
			.shmem_peers = 3,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
		{ /* IVSHMEM 00:01.0 (networking) */
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0,
			.bdf = 1 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
			.shmem_regions_start = 5,
			.shmem_dev_id = 0,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
	},
};

------=_Part_224_886665411.1603879565195--
