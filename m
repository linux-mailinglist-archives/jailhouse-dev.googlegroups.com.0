Return-Path: <jailhouse-dev+bncBCU2BPFD7YFRBH7266XAMGQE6R7BKPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id E72D4869A21
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Feb 2024 16:17:53 +0100 (CET)
Received: by mail-yb1-xb3b.google.com with SMTP id 3f1490d57ef6-dcd94cc48a1sf6243142276.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Feb 2024 07:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1709047072; x=1709651872; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMDLC1VP1OaS+H2A+ZBtsGOPMGr39BNH2H3BCv/XjDk=;
        b=rw8dsCk7AkiGN2Jg6H1Zg8HAkShswRSvZHtYZ9fjdnpwQvIxGuyLET7F+5/oMrWODJ
         fupkPkTjh3NeTgxnGz4oPQEXEblPcsAHvXlXz3d3baZ9a9qKQbV1gziilOzCnO8VGT4S
         8qbUfwB056jwD1Qik8UDzqjgNZHepjhWLBWU+Ea++vbFdWiCpIDZaoY5lrkP7BYXCZUa
         ER3e58BaAf+jsDR7RRDNV8g0wgSl7NqhSIe5D9ES3d7kcGqJLwNCRL7k1ycBjH7oye/H
         GxCm232yArcUn6sbq8y1yf/3OGktpOBmhQf0fY6ItvrN7m+iVhbdqSUr8Y+YmsQiqR+q
         OewQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709047072; x=1709651872; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMDLC1VP1OaS+H2A+ZBtsGOPMGr39BNH2H3BCv/XjDk=;
        b=g6q5r3t18h+2i0LKEOdhYY5vs6DXRZbw11Ei28GBGFYRjYvhFWy4i+rd8mRKRw8HnH
         Dep2tvKYziZKbVk6547PqB/PaDxnFnzq6b3Rb/bOn4vG74goGGfkPCrB+iqTFVJyzE0u
         AI9Y30kBYUKK/aAmdgfKC2An5d3PxJdlX2pV9dtHnBYNmmNlfGn4PIdR8MM0uKfSFp6i
         V//uk2zgl9vBBPABsMvsh2K8NbBXn88dbKSMtV/MbO1m7hHyOPTlkwHYD7LjnTc47P+v
         v7w7SHfueMGShjPBxtAYLmWDSlZu9JL0A/rRWNIFKKd4Ex3DUBMLvICzkocTaMr2xDuv
         JLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709047072; x=1709651872;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMDLC1VP1OaS+H2A+ZBtsGOPMGr39BNH2H3BCv/XjDk=;
        b=iVOvaGjnd7AlvsrMt+LX0jzF7YpURsVdW9pHjuQXPHOC0SlhRhpgBPCVKUO028hpmp
         RuIOfetrcqO6nLBO1D48evQHMKza4ddJR1x1oQInC1Cbt+BJrUc6ngedEveIdPFx2cFD
         yqt3CmCZUyy9pMgU99ktw8eL6w2Fa1NvstHMFCwB1VG16FpVAF7ovvu1jJaZdIkhdmMD
         WNUkhE3Zm6cKnJ0Ej6zT3EBEtv5nHkAuxSCajXNwTlEKfT/J/Bfv8vNqn4YYB+ZMB85f
         LLwfT3EFKeb2jbpbvrMWWR5FXw3dBShoOggfeKvs4Ft40vr3vtbXG1wc7cbmj0GfEFx9
         D8Rg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVE/cn313KV8YxZj1EmC3NfLb2eDk+FGSij6eLuE96nIvNExPYdGR6qoErbFlnPM7M1OQPO1YqMNqNOSkZ1PBgwXN91VfWl9rAOq+A=
X-Gm-Message-State: AOJu0YxM5VU7IKscna2q4K/5nvvmKAYjCEGxvgnujbJmhBFKUhXL0nKi
	Y/EW1cyNHvx5aZvSxh2r0gH5QmUJ0tOh52jgvHsEL+xb4+5i6qq8
X-Google-Smtp-Source: AGHT+IGa/S5vyR56uaZhU72RRuPUUZaIyifmeRSPWS0sMxaX9U9WT3cdBvlVNGAxyLbXrUUlFu66XQ==
X-Received: by 2002:a25:3622:0:b0:dcf:3ef2:6182 with SMTP id d34-20020a253622000000b00dcf3ef26182mr2236689yba.0.1709047072584;
        Tue, 27 Feb 2024 07:17:52 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:df4a:0:b0:dcc:911c:557c with SMTP id w71-20020a25df4a000000b00dcc911c557cls781020ybg.0.-pod-prod-01-us;
 Tue, 27 Feb 2024 07:17:51 -0800 (PST)
X-Received: by 2002:a81:4fd7:0:b0:5e6:1e40:e2e3 with SMTP id d206-20020a814fd7000000b005e61e40e2e3mr399345ywb.5.1709047070907;
        Tue, 27 Feb 2024 07:17:50 -0800 (PST)
Date: Tue, 27 Feb 2024 07:17:50 -0800 (PST)
From: Suhaas Joshi <joshiesuhaas0@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <723d9677-0e1e-4111-8573-381896c4940fn@googlegroups.com>
Subject: ivshmem-demo not working: unhandled data read
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_42268_1717810662.1709047070099"
X-Original-Sender: joshiesuhaas0@gmail.com
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

------=_Part_42268_1717810662.1709047070099
Content-Type: multipart/alternative; 
	boundary="----=_Part_42269_1489060134.1709047070099"

------=_Part_42269_1489060134.1709047070099
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I have Jailhouse installed on an am62-sk-lp board. I am trying to run the 
ivshmem-demo on it. PFA the root and non-root cell config file (this file 
can also be found in the source code, as configs/arm64/k3-am625-sk.c). 

I am able to enable Jailhouse with the root cell and create a non-root cell 
and load the non-root cell with ivshmem-demo. But when I start the non-root 
cell, I get this error:

Unhandled data read at 0x76100000(2)

FATAL: unhandled trap (exception class 0x24)
Cell state before exception:
 pc: 0000000000005538 lr: 0000000000004884 spsr: 60000005 EL1
 sp: 0000000000007f90 elr: 0000000000005538 esr: 24 1 1400005
 x0: 0000000076000000 x1: 0000000000100000 x2: 0000000000000002
 x3: 0000000000000705 x4: 0000000000001000 x5: 0000000000001000
 x6: 0000000000000000 x7: 0000000000000000 x8: 0000000000000000
 x9: 0000000000000000 x10: 0000000000000000 x11: 0000000000000000
x12: 0000000000000000 x13: 0000000000000000 x14: 0000000000000000
x15: 0000000000000000 x16: 0000000000000000 x17: 0000000000000000
x18: 0000000000000000 x19: 0000000000000100 x20: 000000000000ffff
x21: 000000000000110a x22: 0000000000004106 x23: 0000000000000100
x24: 0000000000000000 x25: 0000000000000000 x26: 0000000000000000
x27: 0000000000000000 x28: 0000000000000000 x29: 0000000000000000

Parking CPU 2 (Cell: "inmate-demo")

I am guessing that the problem lies in the pci_mmconfig_base field in the 
root cell config file. It is currently set to 0x76000000. When I change the 
value, the error message doesn't occur. But when I open the other cell 
using minicom/tio, I don't see any output, so even though there's no error, 
I don't think the demo is working as expected.

Could someone let me know what the problem is?

Thanks
Suhaas

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/723d9677-0e1e-4111-8573-381896c4940fn%40googlegroups.com.

------=_Part_42269_1489060134.1709047070099
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello everyone,</div><div><br /></div><div>I have Jailhouse installed =
on an am62-sk-lp board. I am trying to run the ivshmem-demo on it. PFA the =
root and non-root cell config file (this file can also be found in the sour=
ce code, as configs/arm64/k3-am625-sk.c).=C2=A0</div><div><br /></div><div>=
I am able to enable Jailhouse with the root cell and create a non-root cell=
 and load the non-root cell with ivshmem-demo. But when I start the non-roo=
t cell, I get this error:</div><br /><div>Unhandled data read at 0x76100000=
(2)</div><div><div dir=3D"auto"><div dir=3D"auto"><br /></div><div dir=3D"a=
uto">FATAL: unhandled trap (exception class 0x24)</div><div dir=3D"auto">Ce=
ll state before exception:</div><div dir=3D"auto">=C2=A0pc: 000000000000553=
8   lr: 0000000000004884 spsr: 60000005     EL1</div><div dir=3D"auto">=C2=
=A0sp: 0000000000007f90  elr: 0000000000005538  esr: 24 1 1400005</div><div=
 dir=3D"auto">=C2=A0x0: 0000000076000000   x1: 0000000000100000   x2: 00000=
00000000002</div><div dir=3D"auto">=C2=A0x3: 0000000000000705   x4: 0000000=
000001000   x5: 0000000000001000</div><div dir=3D"auto">=C2=A0x6: 000000000=
0000000   x7: 0000000000000000   x8: 0000000000000000</div><div dir=3D"auto=
">=C2=A0x9: 0000000000000000  x10: 0000000000000000  x11: 0000000000000000<=
/div><div dir=3D"auto">x12: 0000000000000000  x13: 0000000000000000  x14: 0=
000000000000000</div><div dir=3D"auto">x15: 0000000000000000  x16: 00000000=
00000000  x17: 0000000000000000</div><div dir=3D"auto">x18: 000000000000000=
0  x19: 0000000000000100  x20: 000000000000ffff</div><div dir=3D"auto">x21:=
 000000000000110a  x22: 0000000000004106  x23: 0000000000000100</div><div d=
ir=3D"auto">x24: 0000000000000000  x25: 0000000000000000  x26: 000000000000=
0000</div><div dir=3D"auto">x27: 0000000000000000  x28: 0000000000000000  x=
29: 0000000000000000</div><div dir=3D"auto"><br /></div><div dir=3D"auto">P=
arking CPU 2 (Cell: "inmate-demo")</div><div dir=3D"auto"><br /></div><div =
dir=3D"auto">I am guessing that the problem lies in the pci_mmconfig_base f=
ield in the root cell config file. It is currently set to 0x76000000. When =
I change the value, the error message doesn't occur. But when I open the ot=
her cell using minicom/tio, I don't see any output, so even though there's =
no error, I don't think the demo is working as expected.</div><div dir=3D"a=
uto"><br /></div><div dir=3D"auto">Could someone let me know what the probl=
em is?<br /></div><div dir=3D"auto"><br /></div><div dir=3D"auto">Thanks</d=
iv><div dir=3D"auto">Suhaas<br /></div></div>
</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/723d9677-0e1e-4111-8573-381896c4940fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/723d9677-0e1e-4111-8573-381896c4940fn%40googlegroups.co=
m</a>.<br />

------=_Part_42269_1489060134.1709047070099--

------=_Part_42268_1717810662.1709047070099
Content-Type: text/x-csrc; charset=US-ASCII; name=root.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=root.c
X-Attachment-Id: f661bc9a-60b2-43e6-b23d-ab6b5348f700
Content-ID: <f661bc9a-60b2-43e6-b23d-ab6b5348f700>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) 2022 Texas Instruments Incorporated - http://www.ti.com/
 *
 * Configuration for K3 based AM625 EVM
 *
 * Authors:
 *  Matt Ranostay <mranostay@ti.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[35];
	struct jailhouse_irqchip irqchips[5];
	struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.architecture = JAILHOUSE_ARM64,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0xdfc00000,
			.size = 0x400000,
		},
		.debug_console = {
			.address = 0x02800000,
			.size = 0x1000,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_4,
		},
		.platform_info = {
			.pci_mmconfig_base = 0x76000000,
			.pci_mmconfig_end_bus = 0,
			.pci_is_virtual = 1,
			.pci_domain = 1,
			.arm = {
				.gic_version = 3,
				.gicd_base = 0x01800000,
				.gicr_base = 0x01880000,
				.maintenance_irq = 25,
			},
		},
		.root_cell = {
			.name = "k3-am625-sk",

			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.vpci_irq_base = 180 - 32,
		},
	},

	.cpus = {
		0xf,
	},

	.mem_regions = {
		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
		{
			.phys_start = 0xdfa00000,
			.virt_start = 0xdfa00000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ,
		},
		{
			.phys_start = 0xdfa10000,
			.virt_start = 0xdfa10000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* Peer 0 */ {
			.phys_start = 0xdfa20000,
			.virt_start = 0xdfa20000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* Peer 1 */ {
			.phys_start = 0xdfa30000,
			.virt_start = 0xdfa30000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ,
		},
		/* Peer 2 */ {
			.phys_start = 0xdfa40000,
			.virt_start = 0xdfa40000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ,
		},
		/* IVSHMEM shared memory region for 00:01.0 */
		JAILHOUSE_SHMEM_NET_REGIONS(0xdfb00000, 0),
		{
			.phys_start = 0x01810000,
			.virt_start = 0x01810000,
			.size = 0x00070000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		{
			.phys_start = 0x018a0000,
			.virt_start = 0x018a0000,
			.size = 0x00060000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* RAM */ {
			.phys_start = 0x80000000,
			.virt_start = 0x80000000,
			.size = 0x5fa00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* RAM. Reserved for inmates */ {
			.phys_start = 0xe0000000,
			.virt_start = 0xe0000000,
			.size = 0x20000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* ctrl mmr */ {
			.phys_start = 0x000f0000,
			.virt_start = 0x000f0000,
			.size = 0x00030000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* GPIO */ {
			.phys_start = 0x00600000,
			.virt_start = 0x00600000,
			.size = 0x00002000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* GPU */ {
			.phys_start = 0x0fd00000,
			.virt_start = 0x0fd00000,
			.size = 0x00020000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* TimeSync Router */ {
			.phys_start = 0x00a40000,
			.virt_start = 0x00a40000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* Wake Up Domain VTM0 */ {
			.phys_start = 0x00b00000,
			.virt_start = 0x00b00000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* First peripheral window, 1 of 2 */ {
			.phys_start = 0x01000000,
			.virt_start = 0x01000000,
			.size = 0x00800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* First peripheral window, 2 of 2 */ {
			.phys_start = 0x01900000,
			.virt_start = 0x01900000,
			.size = 0x01229000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* Second peripheral window */ {
			.phys_start = 0x0e000000,
			.virt_start = 0x0e000000,
			.size = 0x01d00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* Third peripheral window */ {
			.phys_start = 0x20000000,
			.virt_start = 0x20000000,
			.size = 0x0a008000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* OCSRAM */ {
			.phys_start = 0x70000000,
			.virt_start = 0x70000000,
			.size = 0x00010000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* DSS */ {
			.phys_start = 0x30200000,
			.virt_start = 0x30200000,
			.size = 0x00010000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* DMSS */ {
			.phys_start = 0x48000000,
			.virt_start = 0x48000000,
			.size = 0x06400000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* PRUSS-M */ {
			.phys_start = 0x30040000,
			.virt_start = 0x30040000,
			.size = 0x00080000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* USB */ {
			.phys_start = 0x31000000,
			.virt_start = 0x31000000,
			.size = 0x00050000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* USB */ {
			.phys_start = 0x31100000,
			.virt_start = 0x31100000,
			.size = 0x00050000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* GPMC */ {
			.phys_start = 0x3b000000,
			.virt_start = 0x3b000000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* GPMC */ {
			.phys_start = 0x50000000,
			.virt_start = 0x50000000,
			.size = 0x08000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* CPSW */ {
			.phys_start = 0x08000000,
			.virt_start = 0x08000000,
			.size = 0x00200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* CRYPTO */ {
			.phys_start = 0x40900000,
			.virt_start = 0x40900000,
			.size = 0x0030000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* First Wake Up Domain */ {
			.phys_start = 0x2b000000,
			.virt_start = 0x2b000000,
			.size = 0x00301000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* Second Wake Up Domain */ {
			.phys_start = 0x43000000,
			.virt_start = 0x43000000,
			.size = 0x00020000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* MCU Domain Range */ {
			.phys_start = 0x04000000,
			.virt_start = 0x04000000,
			.size = 0x01ff2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
	},

	.irqchips = {
		{
			.address = 0x01800000,
			.pin_base = 32,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
			},
		},
		{
			.address = 0x01800000,
			.pin_base = 160,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
			},
		},
		{
			.address = 0x01800000,
			.pin_base = 288,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
			},
		},
		{
			.address = 0x01800000,
			.pin_base = 416,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
			},
		},
		{
			.address = 0x01800000,
			.pin_base = 544,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
			},
		},
	},

	.pci_devices = {
		/* 0001:00:00.0 */ {
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 1,
			.bdf = 0 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
			.shmem_regions_start = 0,
			.shmem_dev_id = 0,
			.shmem_peers = 3,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
		/* 0001:00:01.0 */ {
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 1,
			.bdf = 1 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
			.shmem_regions_start = 5,
			.shmem_dev_id = 0,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
	},
};

------=_Part_42268_1717810662.1709047070099--
