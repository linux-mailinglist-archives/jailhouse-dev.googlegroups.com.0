Return-Path: <jailhouse-dev+bncBD4MLPEEWIHBBE7D52VAMGQE5Q3N2CY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43e.google.com (mail-pf1-x43e.google.com [IPv6:2607:f8b0:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7737F1D40
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Nov 2023 20:20:53 +0100 (CET)
Received: by mail-pf1-x43e.google.com with SMTP id d2e1a72fcca58-6c415e09b1bsf5445228b3a.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Nov 2023 11:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700508052; x=1701112852; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhHrQGgvVXlthtOuetz5u0lvGKfIamJPXPYWcJtYTVw=;
        b=QM/Sb+AquYjMPa0zYMDWW9y3TI4d34xWC8vEyxv5IujrGGiE4H8G3lkowr2Ewr96GE
         8ew88RzFT4odOXWNn3KkSsSNS7dhvw+XAnGqkq8lSeHCF10xO6Ywob7dnvG8P59rNqt9
         +hTZh3VoHR9PmQ+aoYgx5Rv4CaV5hQGPm5LD1c+hyhlUq0jxsLWFV+9WiWmwrpSO7q3j
         /PIQaXzczajHhv8hIgrJkzAke1sHMxt4iuZ/JzJy2P7S53WCwdmItOBbRM1U/Ad2KJGr
         N12BhqqfvW6568c2ETxyztysH4HGiNcwUk0+rV9/6v3FeAIvmdraiA/vHbX7JnoiNHm6
         itZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700508052; x=1701112852; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhHrQGgvVXlthtOuetz5u0lvGKfIamJPXPYWcJtYTVw=;
        b=lEjfj4RNXuBgvpe9nibi9RwtwHYoDFS+cELvHa3gdj46LtgjiBk1DCSAhiQP0HTwZV
         sfMuq54eGmnHo//Yqv/cU/Qv2Z0Rmcf62oK+qEz8k3eTUIMT2EKKvdyxfygsAigxOZPX
         nW6L4RaKfM97OGaT5Scp8VAZ5jBQbcO3hrjthiGstiUOvgtkYtH2F33tIreXg0CHgz7/
         4JO0KeK5sWgUgXK9jwHz9OxAxV6Wv/MMs0cgl64h7QkkrBy2eckkymG5nvWkDwOeIkd9
         4Vg4TCtsFtZW04ur7hd+UE44ywgLDrHoHgwUuvtxAH/JMiDqTn78Ed2u9C1luS4x8Q8w
         gWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700508052; x=1701112852;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhHrQGgvVXlthtOuetz5u0lvGKfIamJPXPYWcJtYTVw=;
        b=Qc8NtULkv8+K9TQxfLfmQ72SV+WFosI5xM9E1ZptBuFV+L5Yq3OiZmzqBNMCVdY8fJ
         +7ng1oAO1ju//hls0sDmO2clqF+/dld49lLMA8r1u4PLBOgO+CsUIAirHEKzD5IoAxtQ
         W/Vpd9ypYlbmbWrg/ZYg1rGblH+r0l9eC2Kbt8OZFOhRlzvIsQNkun7h9KPFYi32NRnE
         ZvzQYzEfuN6buQbTOsgOu1Y5+tKK4qKY7bxXlx3MorKqSYvhG/u0PhI3qPNeP+udPaFG
         Pi9eOkF9/QqrUma8RmfbDJxuLqoDJPmWEqns17HTA8/qKs2C9buFjvUZbOe36ouBnEqg
         pnEQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwezF9ilgYIX+beV6bQi+K2feyx5U5VcoZFV/kcKJlMFVqfqEh4
	RcsMlVxgcDClZ2BQN5BuSN8=
X-Google-Smtp-Source: AGHT+IHpdLKwwJoDEqJaqW6OmE+MnuikBTSWcYBraVa2WYS/6Edl/7sXayfQI9a0iZ0vZfeurCDbKw==
X-Received: by 2002:a05:6a00:2e99:b0:6b2:baa0:6d4c with SMTP id fd25-20020a056a002e9900b006b2baa06d4cmr7564369pfb.33.1700508052075;
        Mon, 20 Nov 2023 11:20:52 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:2da0:b0:6cb:b4c2:36f8 with SMTP id
 fb32-20020a056a002da000b006cbb4c236f8ls583264pfb.2.-pod-prod-03-us; Mon, 20
 Nov 2023 11:20:50 -0800 (PST)
X-Received: by 2002:a63:2543:0:b0:5be:9b7:23ed with SMTP id l64-20020a632543000000b005be09b723edmr1731560pgl.3.1700508050328;
        Mon, 20 Nov 2023 11:20:50 -0800 (PST)
Date: Mon, 20 Nov 2023 11:20:49 -0800 (PST)
From: Paresh Bhagat <pareshbhagat29@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2847752b-a183-418c-9c42-42641c6ffe20n@googlegroups.com>
Subject: Jailhouse enable pci error
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_48758_537177723.1700508049337"
X-Original-Sender: pareshbhagat29@gmail.com
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

------=_Part_48758_537177723.1700508049337
Content-Type: multipart/alternative; 
	boundary="----=_Part_48759_693376357.1700508049337"

------=_Part_48759_693376357.1700508049337
Content-Type: text/plain; charset="UTF-8"

Any fix for the following error while trying to enable jailhouse ? 
something wrong with the memory allocation? 

Initializing Jailhouse hypervisor v0.12 (324-ge57d1eff-dirty) on CPU 0
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/993, remap 0/131072
Initializing processors:
 CPU 0... OK
 CPU 2... OK
 CPU 1... OK
 CPU 3... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: ARM SMMU
Initializing unit: PVU IOMMU
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "k3-am62p5-sk"
Adding virtual PCI device 00:01.0 to cell "k3-am62p5-sk"
Page pool usage after late setup: mem 78/993, remap 144/131072
Activating hypervisor
[  122.542841] pci-host-generic 76000000.pci: host bridge /pci@0 ranges:
[  122.542873] pci-host-generic 76000000.pci:      MEM 
0x0076100000..0x0076103fff -> 0x0076100000
[  122.542947] pci-host-generic 76000000.pci: ECAM at [mem 
0x76000000-0x760fffff] for [bus 00]
[  122.543103] pci-host-generic 76000000.pci: PCI host bridge to bus 0001:00
[  122.543112] pci_bus 0001:00: root bus resource [bus 00]
[  122.543119] pci_bus 0001:00: root bus resource [mem 
0x76100000-0x76103fff]
root@am62pxx-evm:/usr/share/jailhouse# [  122.543161] pci 0001:00:00.0: 
[110a:4106] type 00 class 0xff0000
[  122.543187] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x0000ffff]
[  122.543455] pci 0001:00:01.0: [110a:4106] type 00 class 0xff0001
[  122.543481] pci 0001:00:01.0: reg 0x10: [mem 0x00000000-0x0000ffff]
[  122.545437] pci 0001:00:00.0: BAR 0: no space for [mem size 0x00010000]
[  122.545458] pci 0001:00:00.0: BAR 0: failed to assign [mem size 
0x00010000]
[  122.545466] pci 0001:00:01.0: BAR 0: no space for [mem size 0x00010000]
[  122.545471] pci 0001:00:01.0: BAR 0: failed to assign [mem size 
0x00010000]
[  122.545896] The Jailhouse is opening.
Unhandled data read at 0xb00328(4)
FATAL: unhandled trap (exception class 0x24)

i have attached root cell config and output of cat /proc/iomem for 
referrence.

Thanks

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2847752b-a183-418c-9c42-42641c6ffe20n%40googlegroups.com.

------=_Part_48759_693376357.1700508049337
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Any fix for the following error while trying to enable jailhouse ? somethin=
g wrong with the memory allocation?=C2=A0<br /><br />Initializing Jailhouse=
 hypervisor v0.12 (324-ge57d1eff-dirty) on CPU 0<br />Code location: 0x0000=
ffffc0200800<br />Page pool usage after early setup: mem 39/993, remap 0/13=
1072<br />Initializing processors:<br />=C2=A0CPU 0... OK<br />=C2=A0CPU 2.=
.. OK<br />=C2=A0CPU 1... OK<br />=C2=A0CPU 3... OK<br />Initializing unit:=
 irqchip<br />Initializing unit: ARM SMMU v3<br />Initializing unit: ARM SM=
MU<br />Initializing unit: PVU IOMMU<br />Initializing unit: PCI<br />Addin=
g virtual PCI device 00:00.0 to cell "k3-am62p5-sk"<br />Adding virtual PCI=
 device 00:01.0 to cell "k3-am62p5-sk"<br />Page pool usage after late setu=
p: mem 78/993, remap 144/131072<br />Activating hypervisor<br />[ =C2=A0122=
.542841] pci-host-generic 76000000.pci: host bridge /pci@0 ranges:<br />[ =
=C2=A0122.542873] pci-host-generic 76000000.pci: =C2=A0 =C2=A0 =C2=A0MEM 0x=
0076100000..0x0076103fff -&gt; 0x0076100000<br />[ =C2=A0122.542947] pci-ho=
st-generic 76000000.pci: ECAM at [mem 0x76000000-0x760fffff] for [bus 00]<b=
r />[ =C2=A0122.543103] pci-host-generic 76000000.pci: PCI host bridge to b=
us 0001:00<br />[ =C2=A0122.543112] pci_bus 0001:00: root bus resource [bus=
 00]<br />[ =C2=A0122.543119] pci_bus 0001:00: root bus resource [mem 0x761=
00000-0x76103fff]<br />root@am62pxx-evm:/usr/share/jailhouse# [ =C2=A0122.5=
43161] pci 0001:00:00.0: [110a:4106] type 00 class 0xff0000<br />[ =C2=A012=
2.543187] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x0000ffff]<br />[ =
=C2=A0122.543455] pci 0001:00:01.0: [110a:4106] type 00 class 0xff0001<br /=
>[ =C2=A0122.543481] pci 0001:00:01.0: reg 0x10: [mem 0x00000000-0x0000ffff=
]<br />[ =C2=A0122.545437] pci 0001:00:00.0: BAR 0: no space for [mem size =
0x00010000]<br />[ =C2=A0122.545458] pci 0001:00:00.0: BAR 0: failed to ass=
ign [mem size 0x00010000]<br />[ =C2=A0122.545466] pci 0001:00:01.0: BAR 0:=
 no space for [mem size 0x00010000]<br />[ =C2=A0122.545471] pci 0001:00:01=
.0: BAR 0: failed to assign [mem size 0x00010000]<br />[ =C2=A0122.545896] =
The Jailhouse is opening.<br />Unhandled data read at 0xb00328(4)<br />FATA=
L: unhandled trap (exception class 0x24)<br /><br />i have attached root ce=
ll config and output of cat /proc/iomem for referrence.<div><br />Thanks</d=
iv>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2847752b-a183-418c-9c42-42641c6ffe20n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2847752b-a183-418c-9c42-42641c6ffe20n%40googlegroups.co=
m</a>.<br />

------=_Part_48759_693376357.1700508049337--

------=_Part_48758_537177723.1700508049337
Content-Type: text/plain; charset=US-ASCII; name=mem.txt
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=mem.txt
X-Attachment-Id: 22397318-f97e-45c1-b86c-bcb1a1ac2942
Content-ID: <22397318-f97e-45c1-b86c-bcb1a1ac2942>

root@am62pxx-evm:~# cat /proc/iomem
000f4000-000f42ab : pinctrl-single
00600000-006000ff : 600000.gpio gpio@600000
00601000-006010ff : 601000.gpio gpio@601000
00b00000-00b003ff : b00000.temperature-sensor temperature-sensor@b00000
00b01000-00b013ff : b00000.temperature-sensor temperature-sensor@b00000
01800000-0180ffff : GICD
01880000-0193ffff : GICR
02400000-024003ff : 2400000.timer timer@2400000
02410000-024103ff : 2410000.timer timer@2410000
02420000-024203ff : 2420000.timer timer@2420000
02430000-024303ff : 2430000.timer timer@2430000
02440000-024403ff : 2440000.timer timer@2440000
02450000-024503ff : 2450000.timer timer@2450000
02460000-024603ff : 2460000.timer timer@2460000
02470000-024703ff : 2470000.timer timer@2470000
02800000-0280001f : serial
02b10000-02b11fff : 2b10000.audio-controller mpu
04084000-04084087 : pinctrl-single
04201000-042010ff : 4201000.gpio gpio@4201000
08000000-081fffff : 8000000.ethernet cpsw_nuss
0e000000-0e0000ff : e000000.watchdog watchdog@e000000
0e010000-0e0100ff : e010000.watchdog watchdog@e010000
0e020000-0e0200ff : e020000.watchdog watchdog@e020000
0e030000-0e0300ff : e030000.watchdog watchdog@e030000
0e0f0000-0e0f00ff : e0f0000.watchdog watchdog@e0f0000
0fa00000-0fa00fff : fa00000.mmc mmc@fa00000
0fa08000-0fa083ff : fa00000.mmc mmc@fa00000
0fc40000-0fc400ff : fc40000.spi spi@fc40000
20000000-200000ff : 20000000.i2c i2c@20000000
20010000-200100ff : 20010000.i2c i2c@20010000
20020000-200200ff : 20020000.i2c i2c@20020000
29000000-290001ff : 29000000.mailbox mailbox@29000000
29010000-290101ff : 29010000.mailbox mailbox@29010000
2b1f0000-2b1f00ff : 2b1f0000.rtc rtc@2b1f0000
30102000-30102fff : 30102000.ticsi2rx ticsi2rx@30102000
30110000-301110ff : 30110000.phy phy@30110000
30200000-30200fff : 30200000.dss common
30202000-30202fff : 30200000.dss vidl1
30206000-30206fff : 30200000.dss vid
30207000-30207fff : 30200000.dss ovr1
30208000-30208fff : 30200000.dss ovr2
3020a000-3020afff : 30200000.dss vp1
3020b000-3020bfff : 30200000.dss vp2
30210000-3021ffff : 30210000.video-codec video-codec@30210000
40900000-409011ff : 40900000.crypto crypto@40900000
44043000-44043fdf : 44043000.system-controller debug_messages
48000000-480fffff : 48000000.interrupt-controller interrupt-controller@48000000
485c0000-485c00ff : 485c0000.dma-controller gcfg
485c0100-485c01ff : 485c0100.dma-controller gcfg
4a400000-4a47ffff : 4d000000.mailbox scfg
4a600000-4a67ffff : 4d000000.mailbox rt
4a800000-4a81ffff : 485c0000.dma-controller rchanrt
4a820000-4a83ffff : 485c0100.dma-controller rchanrt
4aa00000-4aa3ffff : 485c0000.dma-controller tchanrt
4aa40000-4aa5ffff : 485c0100.dma-controller tchanrt
4b800000-4bbfffff : 485c0000.dma-controller ringrt
4bc00000-4bcfffff : 485c0100.dma-controller ringrt
4c000000-4c01ffff : 485c0100.dma-controller bchanrt
4d000000-4d07ffff : 4d000000.mailbox target_data
4e100000-4e10ffff : 4e230000.dma-controller ringrt
4e180000-4e187fff : 4e230000.dma-controller rchanrt
4e230000-4e2300ff : 4e230000.dma-controller gcfg
4e400000-4e407fff : 4e400000.interrupt-controller interrupt-controller@4e400000
70000000-7000ffff : 70000000.sram sram@70000000
78000000-78007fff : 78000000.r5f
78100000-78107fff : 78000000.r5f
79000000-79007fff : 79000000.r5f
79020000-79027fff : 79000000.r5f
80000000-9b4fffff : System RAM
  82010000-8312ffff : Kernel code
  83130000-8334ffff : reserved
  83350000-8351ffff : Kernel data
  87fff000-87ffffff : reserved
  8feef000-8fefcfff : reserved
9b500000-9e6fffff : reserved
9e700000-9e77ffff : System RAM
9e780000-9fffffff : reserved
a0000000-ffffffff : System RAM
  fbfff000-ffffefff : reserved
500000000-5ffffffff : fc40000.spi spi@fc40000
880000000-9df9fffff : System RAM
  9b1d40000-9ba9fffff : reserved
  9baa77000-9baa77fff : reserved
  9baa78000-9baac3fff : reserved
  9baac6000-9baac8fff : reserved
  9baac9000-9baadafff : reserved
  9baadb000-9df9fffff : reserved
9dfa00000-9ffffffff : reserved
root@am62pxx-evm:~#
------=_Part_48758_537177723.1700508049337
Content-Type: text/x-csrc; charset=US-ASCII; name=k3-am62p5-sk.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=k3-am62p5-sk.c
X-Attachment-Id: 93edd931-1861-434e-b6d5-1761968d5dfa
Content-ID: <93edd931-1861-434e-b6d5-1761968d5dfa>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) 2022 Texas Instruments Incorporated - http://www.ti.com/
 *
 * Configuration for K3 based AM62P5 EVM
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
	struct jailhouse_memory mem_regions[30];
	struct jailhouse_irqchip irqchips[5];
	struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.architecture = JAILHOUSE_ARM64,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x9dfc00000,
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
			.name = "k3-am62p5-sk",

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
			.phys_start = 0x9dfa00000,
			.virt_start = 0x9dfa00000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ,
		},
		{
			.phys_start = 0x9dfa10000,
			.virt_start = 0x9dfa10000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* Peer 0 */ {
			.phys_start = 0x9dfa20000,
			.virt_start = 0x9dfa20000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* Peer 1 */ {
			.phys_start = 0x9dfa30000,
			.virt_start = 0x9dfa30000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ,
		},
		/* Peer 2 */ {
			.phys_start = 0x9dfa40000,
			.virt_start = 0x9dfa40000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ,
		},
		/* IVSHMEM shared memory region for 00:01.0 */
		JAILHOUSE_SHMEM_NET_REGIONS(0x9dfb00000, 0),
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
			.size = 0x80000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* RAM */ {
			.phys_start = 0x880000000,
			.virt_start = 0x880000000,
			.size = 0x15fa00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* RAM. Reserved for inmates */ {
			.phys_start = 0x9e0000000,
			.virt_start = 0x9e0000000,
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
		/* CPSW */ {
			.phys_start = 0x08000000,
			.virt_start = 0x08000000,
			.size = 0x00200000,
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
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
			.shmem_regions_start = 0,
			.shmem_dev_id = 0,
			.shmem_peers = 3,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
		/* 0001:00:01.0 */ {
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 1,
			.bdf = 1 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
			.shmem_regions_start = 5,
			.shmem_dev_id = 0,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
	},
};

------=_Part_48758_537177723.1700508049337--
