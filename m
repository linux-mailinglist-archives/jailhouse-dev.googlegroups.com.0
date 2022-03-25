Return-Path: <jailhouse-dev+bncBD7P35MOH4IIXN7XSEDBUBHMJXKIM@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0694E7643
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Mar 2022 16:11:08 +0100 (CET)
Received: by mail-qk1-x737.google.com with SMTP id d12-20020a379b0c000000b0067d8cda1aaasf5285153qke.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Mar 2022 08:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4B5oh0EiyOwHTeJU7mIVjcgmR8sXgYb9v3SLnRJ1ZkI=;
        b=OGItmRBJzLZQC8m1WN3wjtYUmzfvAr7PAYxFc56gYSlvjcpoD+BlCahDNh0IzvQMD5
         O8Iq+z7pR+GNvy7xL13aSGLaNnh9m/xYpb1ODDcGhCEaFajU1u3kITeUO1oNYygdws2d
         +7NmjlQFvnYyqpFrX9+kQepjItgcwTGBsJyFKjW9/oMBkqA/jFkD9veO4cyjnUa/I7eh
         qLvY3ZJ3/1H3XSxOfppvaEM+EB4rAyb8Nlt5LnMAy4TLWTJY8B2uDQeng/T3BnoFS1GK
         NdJbM6xG2GTYrJmue6vDk3VvuExDPjqbPftErAS3hmJBF/uEZDwM3cLARTooZZ7vXR39
         hwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:reply-to:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4B5oh0EiyOwHTeJU7mIVjcgmR8sXgYb9v3SLnRJ1ZkI=;
        b=VMUpqcvozNHK+cIWJrDUApPiKJ/VDAfujzAYjpp6AAChdVtpEePqctMt1jTRmOrX5X
         Phq/+Xz1azDZKPS3T2OsJuPtWPWJWTZR1wGagGhcpgfLY/Gry0/DrjLlt3mXda4R3SlF
         YRfP5EcE9CNQ2Y1l5HrZmlx+QzmlbyglUGSmCBqK5Q3/2vjRmBW4RLB+YHoQYgi+T4iD
         GguULzC6U5hi2dGCqLQsSXeRPvVedY8e8NIO8IfTFotXUl83nlcnVjRh94o4WTvgMpxE
         UyGz4JcPc8hjrQ5kWkOMJ3RmFIQHJQc7HUh7tI/QX78K16G8x6SNaPwSRsloqpZzFExC
         T2HQ==
X-Gm-Message-State: AOAM530RN+wZ1QCH9mbrNNouXoswmPs1zdEmJK/KZdz6FN3z1W7s9vUQ
	vroAIOuohemCnAUL0StQQJc=
X-Google-Smtp-Source: ABdhPJycSxbI3VAPLAh0PxezJLMXxDj/J97b+soZkjbm0i6jY+wgfGWyPD/awGIL3qEWg8emxz2x1Q==
X-Received: by 2002:a05:6214:10e8:b0:42c:184a:7b9 with SMTP id q8-20020a05621410e800b0042c184a07b9mr9438477qvt.48.1648221067562;
        Fri, 25 Mar 2022 08:11:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:1990:b0:2e0:6d9b:df1c with SMTP id
 u16-20020a05622a199000b002e06d9bdf1cls3619069qtc.2.gmail; Fri, 25 Mar 2022
 08:11:06 -0700 (PDT)
X-Received: by 2002:ac8:5a88:0:b0:2e1:bbda:3b21 with SMTP id c8-20020ac85a88000000b002e1bbda3b21mr9515060qtc.307.1648221066480;
        Fri, 25 Mar 2022 08:11:06 -0700 (PDT)
Date: Fri, 25 Mar 2022 08:11:05 -0700 (PDT)
From: "'johannes lex' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b708cd52-3034-4d11-a61c-1e4c992c096dn@googlegroups.com>
Subject: Jetson TX2 - access to peripherals from inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4_986269951.1648221065757"
X-Original-Sender: johannes.lex.5@googlemail.com
X-Original-From: johannes lex <johannes.lex.5@googlemail.com>
Reply-To: johannes lex <johannes.lex.5@googlemail.com>
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

------=_Part_4_986269951.1648221065757
Content-Type: multipart/alternative; 
	boundary="----=_Part_5_1751823081.1648221065757"

------=_Part_5_1751823081.1648221065757
Content-Type: text/plain; charset="UTF-8"

Hello everybody,

i'm investigating the jailhouse hypervisor for a research project of an 
automotive company.

As a first step, i want to set up the Jetson TX2 Board and add an inmate 
which toggels one GPIO Pin. I used the VM from the ERIKA V3 
(https://www.erika-enterprise.com/index.php/download/virtual-machines.html) 
as a base development platform.
So far, Jailhouse is running and my configs seem to work. 

However, I can't access (not even read) the registers of the GPIO or any 
other peripheral which i assign to my cell, except the already configured 
UART.
The cell config and assignment of the registers themself seems to work: i 
can, for example, read the register 0x02210890 from the Linux host before 
creating the cell. After creating the cell, a read attempt from the Linux 
host leads to a system crash.
Unfortunately, i can't read that register from the inmate as well :/

Do you have a clue why i can't read the register in my setup? I've attached 
my configs and the source code for the bare metal application of the inmate.

Or do you have any examples in which you access the GPIOs (or other 
peripherals) of the Jetson TX2 from an inmate which you could share?

Thank you in advance,
Johannes

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b708cd52-3034-4d11-a61c-1e4c992c096dn%40googlegroups.com.

------=_Part_5_1751823081.1648221065757
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everybody,<br><br>i'm investigating the jailhouse hypervisor for a re=
search project of an automotive company.<br><br>As a first step, i want to =
set up the Jetson TX2 Board and add an inmate which toggels one GPIO Pin. I=
 used the VM from the ERIKA V3 (https://www.erika-enterprise.com/index.php/=
download/virtual-machines.html) as a base development platform.<br>So far, =
Jailhouse is running and my configs seem to work.&nbsp;<div><br></div><div>=
However, I can't access (not even read) the registers of the GPIO or any ot=
her peripheral which i assign to my cell, except the already configured UAR=
T.</div><div>The cell config and assignment of the registers themself seems=
 to work: i can, for example, read the register&nbsp;0x02210890 from the Li=
nux host before creating the cell. After creating the cell, a read attempt =
from the Linux host leads to a system crash.</div><div>Unfortunately, i can=
't read that register from the inmate as well :/<br><br>Do you have a clue =
why i can't read the register in my setup? I've attached my configs and the=
 source code for the bare metal application of the inmate.<br><br>Or do you=
 have any examples in which you access the GPIOs (or other peripherals) of =
the Jetson TX2 from an inmate which you could share?<br><br>Thank you in ad=
vance,<br>Johannes<br><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b708cd52-3034-4d11-a61c-1e4c992c096dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/b708cd52-3034-4d11-a61c-1e4c992c096dn%40googlegroups.co=
m</a>.<br />

------=_Part_5_1751823081.1648221065757--

------=_Part_4_986269951.1648221065757
Content-Type: text/plain; charset=US-ASCII; name=Console_Output.txt
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=Console_Output.txt
X-Attachment-Id: 168c2745-1a35-49f3-a03b-5fd12ac42a9a
Content-ID: <168c2745-1a35-49f3-a03b-5fd12ac42a9a>

nvidia@tegra-ubuntu:~$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 16.04.7 LTS
Release:        16.04
Codename:       xenial
nvidia@tegra-ubuntu:~$ sudo devmem2 0x02210890
/dev/mem opened.
Memory mapped at address 0x7fb51ba000.
Value at address 0x2210890 (0x7fb51ba890): 0x0
nvidia@tegra-ubuntu:~$ sudo jailhouse cell create jetson-tx2-gpio-demo.cell
[ 1019.958463] CPU0: shutdown
[ 1019.961171] psci: CPU0 killed.
Shared memory connection established: "jetson-tx2-demo" <--> "Jetson-TX2"
Shared memory connection established: "jetson-tx2-demo" <--> "Jetson-TX2"
Created cell "jetson-tx2-demo"
Page pool usage after cell creation: mem 119/16355, remap 101/131072
[ 1020.034356] Created Jailhouse cell "jetson-tx2-demo"
nvidia@tegra-ubuntu:~$ sudo jailhouse cell load jetson-tx2-demo read_register.bin
Cell "jetson-tx2-demo" can be loaded
nvidia@tegra-ubuntu:~$ sudo jailhouse cell start jetson-tx2-demo
Started cell "jetson-tx2-demo"
Hello, inmate started
reading UART: 13 address: 3100000
address gpio: 2210890
nvidia@tegra-ubuntu:~$ sudo devmem2 0x02210890
/dev/mem opened.
Memory mappUed nhandled data read at 0x2210890(8)

FATAL: unhandled trap (exception class 0x24)
Cell state before exception:
 pc: 0000000000400c04   lr: 0000000000400ba8 spsr: 60000000     EL0
 sp: 0000007fe76ad8b0  esr: 24 1 1c08007
 x0: 0000007fb28bb890   x1: 0000007fb28bb000   x2: 0000000000000001
 x3: 0000000000000000   x4: 0000000000000000   x5: 0040000000005404
 x6: 0000000000413037   x7: 0000000000000000   x8: 0000000000000040
 x9: ffffff80ffffffc8  x10: 0000007fe76ad8b0  x11: 0000007fe76ad8b0
x12: 00000000000003f3  x13: 0000000000000000  x14: 0000000000000000
x15: 0000007fb28c0000  x16: 0000000000412058  x17: 0000007fb278dd70
x18: 0000000000000a03  x19: 0000000000400da0  x20: 0000000000000000
x21: 0000000000000000  x22: 0000000000000000  x23: 0000000000000000
x24: 0000000000000000  x25: 0000000000000000  x26: 0000000000000000
x27: 0000000000000000  x28: 0000000000000000  x29: 0000007fe76ad8b0

Parking CPU 4 (Cell: "Jetson-TX2")
at address 0x7fb28bb000.

------=_Part_4_986269951.1648221065757
Content-Type: text/x-csrc; charset=US-ASCII; name=register_read.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=register_read.c
X-Attachment-Id: 46ac47a7-4081-4cc0-abfa-8d12255ada22
Content-ID: <46ac47a7-4081-4cc0-abfa-8d12255ada22>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) ARM Limited, 2014
 *
 * Authors:
 *  Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <inmate.h>

//Registers for configuration of Pin I4 
#define GPIO_I4_CONFIG 0x02210880UL
//Register for output value of Pin I4 
#define GPIO_I4_OUTPUT 0x02210890UL

volatile unsigned int* uart_dummy; 
volatile unsigned int* gpio_output;

void inmate_main(void)
{
	int i;
	
	//this is the address for the debug console (UART A). Printk writes to this console so it is accessable
	uart_dummy = (unsigned int*) 0x03100000UL; 
	
	gpio_output= (unsigned int*)  GPIO_I4_OUTPUT; //i want to read the current GPIO Port I4 
    printk("Hello, inmate started\n");


	//the registers of the debug console can be read as expected
	printk("reading UART: %d address: %x\n", *uart_dummy, uart_dummy);

	printk("address gpio: %x \n", gpio_output);
	
	//////////////////////////////////////
	//THE GPIO REGISTER CAN NOT BE READ///
	printk("reading GPIO: %d \n", *gpio_output);//i want to read the current GPIO Port I4 
	//THIS POINT IS NEVER REACHED///
	////////////////////////////////
	
	while(++i); 

}

------=_Part_4_986269951.1648221065757
Content-Type: text/x-csrc; charset=US-ASCII; name=jetson-tx2-demo.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=jetson-tx2-demo.c
X-Attachment-Id: 491a001d-4474-48fd-a56c-cd1c6ef3a6af
Content-ID: <491a001d-4474-48fd-a56c-cd1c6ef3a6af>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for gic-demo or uart-demo inmate on Nvidia Jetson TX2:
 * 1 CPU, 64 MB RAM, serial port 0
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
	struct jailhouse_memory mem_regions[6];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "jetson-tx2-demo",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
		.vpci_irq_base = 300,

	},

	.cpus = {
		0x1,
	},

	.mem_regions = {
		/* UART */ {
			.phys_start = 0x3100000,
			.virt_start = 0x3100000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
		},
		/* GPIO_CTL */ {
			.phys_start = 0x02200000,
			.virt_start = 0x02200000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* RAM */ {
			.phys_start = 0x270000000,
			.virt_start = 0,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */ {
			.virt_start = 0x80000000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_COMM_REGION,
		},

		/* IVHSMEM  1*/ {
                        .phys_start = 0x275000000,
                        .virt_start = 0x275000000,
                        .size = 0x1000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE 
                        | JAILHOUSE_MEM_ROOTSHARED,

                },

                /* IVHSMEM  2*/ {
                        .phys_start = 0x275200000,
                        .virt_start = 0x275200000,
                        .size = 0x1000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE 
                         | JAILHOUSE_MEM_ROOTSHARED, 
                },

	},

	.irqchips = { 
		/* GIC */
		{
			.address = 0x03881000,
			.pin_base = 288,
			.pin_bitmap = {
				0,
				3 << (332 - 320) /* irq 332 and 333 */
			},
		},
	},

	.pci_devices = {
                {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .bdf = 0x0 << 3,
                        .bar_mask = {
                                0xffffff00, 0xffffffff, 0x00000000,
                                0x00000000, 0x00000000, 0x00000000,
                        },

                        /*num_msix_vectors needs to be 0 for INTx operation*/
                        .num_msix_vectors = 0,
                        .shmem_region = 4,
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
                        .domain = 0x0,
                },

                {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .bdf = 0xf << 3,
                        .bar_mask = {
                                0xffffff00, 0xffffffff, 0x00000000,
                                0x00000000, 0x00000000, 0x00000000,
                        },

                        /*num_msix_vectors needs to be 0 for INTx operation*/
                        .num_msix_vectors = 0,
                        .shmem_region = 5,
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
			.domain = 0x0,
                },
        },

};

------=_Part_4_986269951.1648221065757
Content-Type: text/x-csrc; charset=US-ASCII; name=jetson-tx2.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=jetson-tx2.c
X-Attachment-Id: 70ffdeb5-c450-47e1-acd8-1374b5408613
Content-ID: <70ffdeb5-c450-47e1-acd8-1374b5408613>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for Jailhouse Jetson TX2 board
 *
 * Copyright (C) 2018 Evidence Srl
 *
 * Authors:
 *  Claudio Scordino <claudio@evidence.eu.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * NOTE: Add "mem=7808M vmalloc=512M" to the kernel command line.
 *
 *	2:7000:0000 inmate (size: 100:0000 = 16 MB)
 *	2:7100:0000 hypervisor (size: 400:0000 = 64 MB)
 *
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[66];
	struct jailhouse_irqchip irqchips[3];
	struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.hypervisor_memory = {
			.phys_start = 0x271000000,
			.size = 0x4000000,
		},
		.debug_console = {
			.address = 0x3100000,
			.size = 0x10000,
			.flags = JAILHOUSE_CON1_TYPE_8250 |
				 JAILHOUSE_CON1_ACCESS_MMIO |
				 JAILHOUSE_CON1_REGDIST_4 |
				 JAILHOUSE_CON2_TYPE_ROOTPAGE,
		},
		.platform_info = {
			/* .pci_mmconfig_base is fixed; if you change it,
                         update the value in inmates/lib/arm-common/pci.c
                         (PCI_CFG_BASE) and regenerate the inmate library*/
                        .pci_mmconfig_base = 0x40000000, 
                        .pci_mmconfig_end_bus = 0x0,
                        .pci_is_virtual = 1,

			.arm = {
				.gicd_base = 0x03881000,
				.gicc_base = 0x03882000,
				.gich_base = 0x03884000,
				.gicv_base = 0x03886000,
				.gic_version = 2,
				.maintenance_irq = 25,
			}
		},
		.root_cell = {
			.name = "Jetson-TX2",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.vpci_irq_base = 288,
		},
	},

	.cpus = {
		0x39,
	},


	.mem_regions = {
		/* BPMP_ATCM */ {
                        .phys_start = 0x00000000,
                        .virt_start = 0x00000000,
                        .size = 0x40000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },

		/* MISC */ {
                        .phys_start = 0x00100000,
                        .virt_start = 0x00100000,
                        .size = 0x10000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },

		/* AXIP2P */ {
			.phys_start = 0x02100000,
			.virt_start = 0x02100000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* GPIO_CTL */ {
			.phys_start = 0x02200000,
			.virt_start = 0x02200000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_EXECUTE,
		},
		/* AXI2APB */ {
			.phys_start = 0x02300000,
			.virt_start = 0x02300000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},

		/* TSA */ {
			.phys_start = 0x2400000,
			.virt_start = 0x2400000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* PADCTL_A (PINMUX) */ {
			.phys_start = 0x02430000,
			.virt_start = 0x02430000,
			.size = 0x15000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* UFSHC */ {
			.phys_start = 0x02450000,
			.virt_start = 0x02450000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* ETHER_QOS */ {
			.phys_start = 0x02490000,
			.virt_start = 0x02490000,
			.size = 0x50000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* GPCDMA */ {
			.phys_start = 0x02600000,
			.virt_start = 0x02600000,
			.size = 0x210000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* APE */ {
			.phys_start = 0x02900000,
			.virt_start = 0x02900000,
			.size = 0x200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* MSS */ {
			.phys_start = 0x02c00000,
			.virt_start = 0x02c00000,
			.size = 0xb0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* LIC */ {
                        .phys_start = 0x03000000,
                        .virt_start = 0x03000000,
                        .size = 0x10000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* TOP_TKE */ {
			.phys_start = 0x03010000,
			.virt_start = 0x03010000,
			.size = 0xe0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* TIMER */ {
                        .phys_start = 0x03020000,
                        .virt_start = 0x03020000,
                        .size = 0xa0000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* UARTA */ {
			.phys_start = 0x03100000,
			.virt_start = 0x03100000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				     JAILHOUSE_MEM_EXECUTE,
		},
		/* UART-B */ {
			.phys_start = 0x03110000,
			.virt_start = 0x03110000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* I2C */ {
			.phys_start = 0x03160000,
			.virt_start = 0x03160000,
			.size = 0x90000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* PWM1 + PWM2 */ {
			.phys_start = 0x03280000,
			.virt_start = 0x03280000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* PWM3 - PWM8 */ {
			.phys_start = 0x032a0000,
			.virt_start = 0x032a0000,
			.size = 0x60000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SDMMC */ {
			.phys_start = 0x3400000,
			.virt_start = 0x3400000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SATA */ {
			.phys_start = 0x3500000,
			.virt_start = 0x3500000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* HDA */ {
			.phys_start = 0x3510000,
			.virt_start = 0x3510000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* XUSB_PADCTL + XUSB_HOST */ {
			.phys_start = 0x3520000,
			.virt_start = 0x3520000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* XUSB */ {
			.phys_start = 0x03540000,
			.virt_start = 0x03540000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* FUSE + KFUSE */ {
			.phys_start = 0x03820000,
			.virt_start = 0x03820000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* MIPICAL */ {
			.phys_start = 0x03990000,
			.virt_start = 0x03990000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* TACH_0 */ {
			.phys_start = 0x039c0000,
			.virt_start = 0x039c0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SE0 */ {
			.phys_start = 0x03ac0000,
			.virt_start = 0x03ac0000,
			.size = 0x30000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* TOP0_HSP */{
                        .phys_start = 0x03c00000,
                        .virt_start = 0x03c00000,
                        .size = 0xa0000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* VIC CAR */{
                        .phys_start = 0x05560000,
                        .virt_start = 0x05560000,
                        .size = 0x10000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* CSITE */ {
			.phys_start = 0x08000000,
			.virt_start = 0x08000000,
			.size = 0x2000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SCE VIC registers */ {
			.phys_start = 0x0b020000,
			.virt_start = 0x0b020000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SCE_PM */ {
			.phys_start = 0x0b1f0000,
			.virt_start = 0x0b1f0000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SCE_CFG */ {
			.phys_start = 0x0b230000,
			.virt_start = 0x0b230000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* AON VIC registers */ {
			.phys_start = 0x0c020000,
			.virt_start = 0x0c020000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* More I2C + SPI2 */ {
			.phys_start = 0x0c230000,
			.virt_start = 0x0c230000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* UARTC, UARTG, RTC, TSC */ {
			.phys_start = 0x0c280000,
			.virt_start = 0x0c280000,
			.size = 0x70000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* AON_GPIO_0 */ {
			.phys_start = 0x0c2f0000,
			.virt_start = 0x0c2f0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* AON_PADCTL_0 (PINMUX) */ {
			.phys_start = 0x0c300000,
			.virt_start = 0x0c300000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/*CAN 1, CAN2 */ {
			.phys_start = 0x0c310000,
			.virt_start = 0x0c310000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/*PWM4 (FAN) */ {
			.phys_start = 0x0c340000,
			.virt_start = 0x0c340000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* PMC */ {
			.phys_start = 0x0c360000,
			.virt_start = 0x0c360000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* BPMP VIC registers */ {
			.phys_start = 0x0d020000,
			.virt_start = 0x0d020000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* ACTMON  + SIMON + SOC_THERM */ {
			.phys_start = 0x0d230000,
			.virt_start = 0x0d230000,
			.size = 0x70000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/*CCPLEX CLUSTER*/{
                        .phys_start = 0x0e000000,
                        .virt_start = 0x0e000000,
                        .size = 0x400000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* PCIE0 */ {
			.phys_start = 0x10000000,
			.virt_start = 0x10000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SMMU0 */ {
			.phys_start = 0x12000000,
			.virt_start = 0x12000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* HOST1X */ {
			.phys_start = 0x13e00000,
			.virt_start = 0x13e00000,
			.size = 0x90000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* HOST1X_ACTMON */ {
			.phys_start = 0x13ec0000,
			.virt_start = 0x13ec0000,
			.size = 0x50000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* DPAUX1 */ {
			.phys_start = 0x15040000,
			.virt_start = 0x15040000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* NVCSI */ {
			.phys_start = 0x150c0000,
			.virt_start = 0x150c0000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* TSECB */ {
			.phys_start = 0x15100000,
			.virt_start = 0x15100000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* NVDISPLAY */ {
                        .phys_start = 0x15200000,
                        .virt_start = 0x15200000,
                        .size = 0x40000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* VIC */ {
			.phys_start = 0x15340000,
			.virt_start = 0x15340000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* NVJPG */ {
			.phys_start = 0x15380000,
			.virt_start = 0x15380000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* NVDEC + NVENC + TSEC + ISP  + SOR */ {
			.phys_start = 0x15480000,
			.virt_start = 0x15480000,
			.size = 0x1c0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* NI */ {
			.phys_start = 0x15700000,
			.virt_start = 0x15700000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SE1-SE4 */ {
			.phys_start = 0x15810000,
			.virt_start = 0x15810000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* GPU */ {
			.phys_start = 0x17000000,
			.virt_start = 0x17000000,
			.size = 0x9000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SYSRAM_0 */{
                        .phys_start = 0x30000000,
                        .virt_start = 0x30000000,
                        .size = 0x10000000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },

		/* System RAM */ {
			.phys_start = 0x80000000,
			.virt_start = 0x80000000,
			.size = 0x1F0000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* Inmate */ {
			.phys_start = 0x270000000,
			.virt_start = 0x270000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* Persistent RAM */ {
			.phys_start = 0x277080000,
			.virt_start = 0x277080000,
			.size = 0x200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* IVHSMEM  1*/ {
                        .phys_start = 0x275000000,
                        .virt_start = 0x275000000,
                        .size = 0x1000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,

                },

                /* IVHSMEM  2*/ {
                        .phys_start = 0x275200000,
                        .virt_start = 0x275200000,
                        .size = 0x1000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
                },
	},
	.irqchips = {
		/* GIC */ {
			.address = 0x03881000,
			.pin_base = 32,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* GIC */ {
			.address = 0x03881000,
			.pin_base = 160,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* GIC */ {
			.address = 0x03881000,
			.pin_base = 288,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pci_devices = {
                {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .bdf = 0x0 << 3,
                        .bar_mask = {
                                0xffffff00, 0xffffffff, 0x00000000,
                                0x00000000, 0x00000000, 0x00000000,
                        },

                        /*num_msix_vectors needs to be 0 for INTx operation*/
                        .num_msix_vectors = 0,
                        .shmem_region = 64,
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
                        .domain = 0x0,

                },

                {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .bdf = 0xf << 3,
                        .bar_mask = {
                                0xffffff00, 0xffffffff, 0x00000000,
                                0x00000000, 0x00000000, 0x00000000,
                        },

                        /*num_msix_vectors needs to be 0 for INTx operation*/
                        .num_msix_vectors = 0,
                        .shmem_region = 65,
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
			.domain = 0x0,

                },
        },


};

------=_Part_4_986269951.1648221065757--
