Return-Path: <jailhouse-dev+bncBD2OND5J24FBB4OW6WPAMGQEXMV6Z2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb37.google.com (mail-yb1-xb37.google.com [IPv6:2607:f8b0:4864:20::b37])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D4168A371
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 Feb 2023 21:15:47 +0100 (CET)
Received: by mail-yb1-xb37.google.com with SMTP id k15-20020a5b0a0f000000b007eba3f8e3basf5778461ybq.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 Feb 2023 12:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UatJRlK6o9qDoxfRevCfRiXl72sP0YMHEd56DVtYSSM=;
        b=asXhJ33oUBjI79nvbCCE23BFJGzlSIIJZ9Qm3AG8izAMEC/8jhMaQXkXxfrW60VsGv
         CdFyEauQYKsjzlwesr+A6pcV58no2b8Sp1OR0/Ci76wpLtxPIibSrPPEuEYXuSnGURh+
         R/YoZK9NMO0LW6CFyTLIyCtAP8v+syuKNfKnFmyZZ3xXprbm5p7NHgzPrAF/AzncIZJf
         dsavNJyb+nzsW2n5rw0Xp0fTPNjg88VHkKIC+YQGfTKx36vk198ZBOnogeEB4H2e5GXh
         DDElZv1IquhKvNaMIG38wizWLHX3jzQbFR7yJ709IX8/vWomZPmuUGB/9DJ0owTjm/eZ
         13PA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UatJRlK6o9qDoxfRevCfRiXl72sP0YMHEd56DVtYSSM=;
        b=gVmhYqvLIjAdwZGkQv+G0o3Evqc28Z2xR/WLyzYMxeNnl5a1mFvfkZYjOK5Ufu1ctt
         atek0Pae7JrtQgmXGZktAAkd/zf5B73WLunx95svXdG75zc3eKspDH1YEuKwOTrICE4H
         T7MiXX3ZprM3vVDHj2qz83102kwhlAn/OAdz777yfSKsl6PhM+x5Yz4Um8htc13gIxgO
         baB1zdqefFNthfUvsufoTWvKnoarG/PhLkqV7T8Zf5SYaUp8qPb8B3rW1vcTvHGpowuq
         mggnO7XqIqlyezdoadnc5Jqa3G4Q8XSBNo3mc0jYzpPFvg3wtddyXDhEljhjebRUyljm
         T7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UatJRlK6o9qDoxfRevCfRiXl72sP0YMHEd56DVtYSSM=;
        b=dS+NuconnBzYxx+k9IVAs0x8MilOA0Q0taCseoaTA3yDomFOeqoNq/h7msAr7pRaJ9
         AZcyulTL7Z4aiSkuUoEBhFbRkM/X/Vr8049xG73zEFMXRn+5NoUIAMJYZ/9Hxs9vTXcS
         57R02D/UEU6IYhvolHMFDodjtxZybuZjP8fNLgWXkovl3ReqkvE1tt5wzH1dS7zTON3e
         fH/rIrPb4ZI+ZuELbDK4Qg/Sz2tMSUQsDRsFKsoZwOgSWvMgszozdereU7rnkdBcJQ2Y
         GZizLAeg/dP1Fb/Zc7JUFMphRNJiz/J7ximkxEWXjYp5JNHLioT/09ZkkG9CswKn6fSg
         IDJA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWhj+R5ljRKWeJY3msmcIxuzNx8w4i0KR+DQc1M3jdpdpBENlI/
	cqo7/6JuUX22EVuuTvnyn18=
X-Google-Smtp-Source: AK7set9QBWr65XTGy4bOPRo3NC2qKaP97LqH1BWtSogAZAh/X8WY/Dwz1XYNTUrvgScDoRXUUQQ3Tw==
X-Received: by 2002:a25:ada1:0:b0:80b:5fb5:2d99 with SMTP id z33-20020a25ada1000000b0080b5fb52d99mr1227764ybi.221.1675455346161;
        Fri, 03 Feb 2023 12:15:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:2303:0:b0:831:6ec8:688f with SMTP id j3-20020a252303000000b008316ec8688fls3560626ybj.11.-pod-prod-gmail;
 Fri, 03 Feb 2023 12:15:44 -0800 (PST)
X-Received: by 2002:a25:b70d:0:b0:801:e42b:29da with SMTP id t13-20020a25b70d000000b00801e42b29damr1088225ybj.369.1675455344516;
        Fri, 03 Feb 2023 12:15:44 -0800 (PST)
Date: Fri, 3 Feb 2023 12:15:43 -0800 (PST)
From: Michele Spina <michelespina99@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a7f72f6c-3bc0-40d4-99e5-3aa00c166671n@googlegroups.com>
Subject: Linux to FreeRTOS IVSHMEMv2
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2994_61634087.1675455343640"
X-Original-Sender: michelespina99@gmail.com
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

------=_Part_2994_61634087.1675455343640
Content-Type: multipart/alternative; 
	boundary="----=_Part_2995_891660382.1675455343640"

------=_Part_2995_891660382.1675455343640
Content-Type: text/plain; charset="UTF-8"

Hi to everyone!
I'm trying to implement an IVSHMEM example (for an university project) 
between the Linux root cell and a FreeRTOS non-root cell on Zynq ZCU104.
First of all, Jailhouse and cells have been successfully loaded on the 
board by modifying the zcu102 configuration files on the repository.
Now, I'm trying to add a IVSHMEM between the two cell but I don't 
understand how to do that.
In particular, I've not completely understood the interrupting mechanism.
Once I define the IVSHMEM regions and the PCI device in the conf files, 
when a guest program writes in the R/W region it automatically sends an 
interrupt to the other peer or I have to use a known library that I haven't 
find yet? The Doorbell register is automatically setted at configuration 
time or I have to define it in the guest program?
I tried to have a look on the demos for ivshmem but everytime I've seen a 
lot of differences even in the basic libraries to include.

Thank you in advance,
MS

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a7f72f6c-3bc0-40d4-99e5-3aa00c166671n%40googlegroups.com.

------=_Part_2995_891660382.1675455343640
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi to everyone!<br />I'm trying to implement an IVSHMEM example (for an uni=
versity project) between the Linux root cell and a FreeRTOS non-root cell o=
n Zynq ZCU104.<div>First of all, Jailhouse and cells have been successfully=
 loaded on the board by modifying the zcu102 configuration files on the rep=
ository.</div><div>Now, I'm trying to add a IVSHMEM between the two cell bu=
t I don't understand how to do that.</div><div>In particular, I've not comp=
letely understood the interrupting mechanism.</div><div>Once I define the I=
VSHMEM regions and the PCI device in the conf files, when a guest program w=
rites in the R/W region it automatically sends an interrupt to the other pe=
er or I have to use a known library that I haven't find yet? The Doorbell r=
egister is automatically setted at configuration time or I have to define i=
t in the guest program?</div><div>I tried to have a look on the demos for i=
vshmem but everytime I've seen a lot of differences even in the basic libra=
ries to include.</div><div><br /></div><div>Thank you in advance,</div><div=
>MS</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a7f72f6c-3bc0-40d4-99e5-3aa00c166671n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a7f72f6c-3bc0-40d4-99e5-3aa00c166671n%40googlegroups.co=
m</a>.<br />

------=_Part_2995_891660382.1675455343640--

------=_Part_2994_61634087.1675455343640
Content-Type: text/x-csrc; charset=US-ASCII; name=zynqmp-zcu104-root.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=zynqmp-zcu104-root.c
X-Attachment-Id: a8e3b30a-ec8e-4bf1-aa80-88b90a87aa56
Content-ID: <a8e3b30a-ec8e-4bf1-aa80-88b90a87aa56>

/*
 * Configuration for the ZCU104 root cell. Copied from ultra96.c
 * and changed where necessary.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[6];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x7fc00000,
			.size =       0x00400000,
		},
		.debug_console = {
			.address = 0xff000000,
			.size = 0x1000,
			.type = JAILHOUSE_CON_TYPE_XUARTPS,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_4,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xfc000000,
			.pci_mmconfig_end_bus = 0,
			.pci_is_virtual = 1,
			.arm = {
				.gic_version = 2,
				.gicd_base = 0xf9010000, /*GIC (Generic Interrupt Controller) distributor register base*/
				.gicc_base = 0xf902f000, /*GIC cpu interface register base*/
				.gich_base = 0xf9040000, /*GIC virtual interface control register base*/
				.gicv_base = 0xf906f000, /*GIC virtual cpu interface register base*/
				.maintenance_irq = 25,
			},
		},
		.root_cell = {
			.name = "ZCU104-root",

			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),

			.vpci_irq_base = 136-32,
		},
	},

	.cpus = {
		0xf,
	},
	
	.mem_regions = {
		/* IVSHMEM shared memory regions (demo) */
		// state region
		{
			.phys_start = 0x7bf00000,
			.virt_start = 0x7bf00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ,
		},
		// R/W region
		{
			.phys_start = 0x7bf00000 + 0x1000,
			.virt_start = 0x7bf00000 + 0x1000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		{ 0 },
		{ 0 },

		/* MMIO (permissive) */ {
			.phys_start = 0xfd000000,
			.virt_start = 0xfd000000,
			.size =	      0x03000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* RAM */ {
			.phys_start = 0x00000000,
			.virt_start = 0x00000000,
			.size =       0x7fb00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
	},

	.irqchips = {
		/* GIC */ {
			.address = 0xf9010000,
			.pin_base = 32,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
			},
		},
	},

	.pci_devices = {
		/* 0001:00:01.0 */ {
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 1,
			.bdf = 1 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
			.shmem_regions_start = 0,
			.shmem_dev_id = 0,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
	}, 
};


------=_Part_2994_61634087.1675455343640
Content-Type: text/x-csrc; charset=UTF-8; name=zynqmp-zcu104-inmate-demo.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=zynqmp-zcu104-inmate-demo.c
X-Attachment-Id: f9bd7b51-b553-48b3-9f14-097ff8c0f84e
Content-ID: <f9bd7b51-b553-48b3-9f14-097ff8c0f84e>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for demo inmate on Avnet Ultra96 board:
 * 1 CPU, 64K RAM, 1 serial port
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
=09struct jailhouse_cell_desc cell;
=09__u64 cpus[1];
=09struct jailhouse_memory mem_regions[7];
=09struct jailhouse_irqchip irqchips[1];
=09struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config =3D {
=09.cell =3D {
=09=09.signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
=09=09.revision =3D JAILHOUSE_CONFIG_REVISION,
=09=09.name =3D "inmate-demo",
=09=09.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,

=09=09.cpu_set_size =3D sizeof(config.cpus),
=09=09.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
=09=09.num_irqchips =3D 0,
=09=09.num_pci_devices =3D 0,

=09=09.console =3D {
=09=09=09.address =3D 0xff000000,
=09=09=09.type =3D JAILHOUSE_CON_TYPE_XUARTPS,
=09=09=09.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
=09=09=09=09 JAILHOUSE_CON_REGDIST_4,
=09=09},
=09},

=09.cpus =3D {
=09=090x8,
=09},

=09.mem_regions =3D {
=09=09/* IVSHMEM shared memory regions (demo) */
=09=09// state region
=09=09{
=09=09=09.phys_start =3D 0x7bf00000,
=09=09=09.virt_start =3D 0x7bf00000,
=09=09=09.size =3D 0x1000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
=09=09},
=09=09// R/W region
=09=09{
=09=09=09.phys_start =3D 0x7bf00000 + 0x1000,
=09=09=09.virt_start =3D 0x7bf00000 + 0x1000,
=09=09=09.size =3D 0x1000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_ME=
M_ROOTSHARED,
=09=09},
=09=09{ 0 },
=09=09{ 0 },
=09=09/* UART */ {
=09=09=09.phys_start =3D 0xff000000,
=09=09=09.virt_start =3D 0xff000000,
=09=09=09.size =3D 0x1000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED, //la demo prevedev=
a la stampa delle celle, l'UART =C3=A8 1 e quindi condivisa
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x7bfe0000,=20
=09=09=09.virt_start =3D 0,
=09=09=09.size =3D 0x00010000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
=09=09},
=09=09/* communication region */ {
=09=09=09.virt_start =3D 0x80000000,
=09=09=09.size =3D 0x00001000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_COMM_REGION,
=09=09},
=09}

=09//preso da zynqmp-zcu102-linux-demo.c, probabile bisogno di modifica al =
bitmap
=09.irqchips =3D {
=09=09/* GIC */ {
=09=09=09.address =3D 0xf9010000,
=09=09=09.pin_base =3D 32,
=09=09=09.pin_bitmap =3D {
=09=09=09=091 << (54 - 32),
=09=09=09=090,
=09=09=09=090,
=09=09=09=09(1 << (140 - 128)) | (1 << (142 - 128))
=09=09=09},
=09=09},
=09},

=09.pci_devices =3D {
=09=09{
=09=09=09.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
=09=09=09.domain =3D 1,
=09=09=09.bdf =3D 1 << 3,
=09=09=09.bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
=09=09=09.shmem_regions_start =3D 0,
=09=09=09.shmem_dev_id =3D 1,
=09=09=09.shmem_peers =3D 2,
=09=09=09.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
=09=09},
=09},
};

------=_Part_2994_61634087.1675455343640--
