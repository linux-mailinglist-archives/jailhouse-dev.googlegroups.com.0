Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBBEELV7ZQKGQEBI35FBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E317184DCE
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Mar 2020 18:40:34 +0100 (CET)
Received: by mail-oi1-x23c.google.com with SMTP id c8sf3217767oib.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Mar 2020 10:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=083d2TiEt6kjNRbFsXb8GNre1WGifiKaQm8tDscyw8w=;
        b=LI0emiIUAtX4rKVKhhibxQlZwxXnjfCRTg1UYaiyumH1Ljliz+E0MvovOhp2+5YX/t
         xuaPiguDUO11nhtG64WVLr9I+nFE4uwuAot37fgKgmVykJJ7CT9a3KQxxgSBKt7vstQt
         Qjyfq66k7AXPt9Kbyu9olwUd4BOyW6uBv7FRAnm83j2HkQFOFrHqslUAdwLrw8+PLKb1
         9XTTX3SZE6tEDNNyy3SXkdUBRmOmC7ruvQjVO95p5CIdjUvS3AkXNNL4fr4FsCaz6tG0
         tIFxgZqYVdoCZN8LkgiW8w2C96HFlzjEIfVtclJh3vN4u6MpJPEX7PAjpUMSYIkIP8gf
         uEqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=083d2TiEt6kjNRbFsXb8GNre1WGifiKaQm8tDscyw8w=;
        b=S5yGP6mmBzQ32w6SRTGTaiIqJ6JHXSL6EPDBqigJF0IncJQXSJq5xg/jTLTQqdTSeX
         0d9ferrvw8PPhT9M9zfiDVOBIr2GiDuJmpwTeowVc1YpltTgm7lEqQDWfAlZbTLAdxx/
         WrT6i9eLlZemHaS7e2h5oZGolxT221K+FeVMrzqRXa1az5mHeMbbx2mpPZ124zh3eI2Y
         0ITpvIxF1MFSdZNww+x3CVu4sno4P1OcM1w7q/DrrNK8RN+MXoo/vFNTJJxpMTzQTqcd
         pqMsQj4cjhecbePLHLGCwV8XTbZxIi2lTDCPWJc5mt/imEwggrbbm4wA8PcmIbHvNTV7
         O/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=083d2TiEt6kjNRbFsXb8GNre1WGifiKaQm8tDscyw8w=;
        b=gxFZK2Pei4qtGeY59z+hQftfmrynpccwjiu0YX8Cit99JzieoQG+/POxC0NAyQb0oF
         YJzIkihmDobzNKtiaOrJYZYK27r9xT+p9liD3b3sUtxGibnzh8JAZ/u8Bz4WtFQ9I9Pf
         S7AtQyEXZVRKijy7i5yg6LPTxx32IbkGNY3rJyqbUa5D/66Rn39JfmyftMdvP+HsiE2c
         Mqi9WnFIJUM5/Yu7Cgx4/FFHwnOIhW3fznGCvyf/fHbN0hfUgQvnvpIHghNCPFzx7djp
         3a4jxQb4uuXgQ3JwoyRrRbhCjeBg6pXnzeXvor57l3uEth2xdgUGFXv9llmW9qM5QF8h
         +Nvg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2ryb/XhauBGvEYUywzgBojsXf+Kcl7pqp6PEBsq4Pj4Y4cS7ZP
	DF227Tk9BncCQd9sNWAzJGM=
X-Google-Smtp-Source: ADFU+vtv9wZR919B4WOo+7DnABwL6YqlrSZlPJopSb2Vc+/Kj1gWm6J9Zfw8kPUeqoildT/ulCAMpQ==
X-Received: by 2002:a9d:70c5:: with SMTP id w5mr12393570otj.58.1584121233148;
        Fri, 13 Mar 2020 10:40:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:12f2:: with SMTP id g105ls3191977otg.6.gmail; Fri, 13
 Mar 2020 10:40:32 -0700 (PDT)
X-Received: by 2002:a05:6830:20c9:: with SMTP id z9mr12094256otq.44.1584121232287;
        Fri, 13 Mar 2020 10:40:32 -0700 (PDT)
Date: Fri, 13 Mar 2020 10:40:31 -0700 (PDT)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2568a874-f368-4cec-9076-bad2a0669af4@googlegroups.com>
Subject: how to make two non root cell with different resource allocation
 (serial port, IVSHMEM) in jetson tx1
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1528_875332984.1584121231568"
X-Original-Sender: samirroj2016@gmail.com
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

------=_Part_1528_875332984.1584121231568
Content-Type: multipart/alternative; 
	boundary="----=_Part_1529_1373229030.1584121231568"

------=_Part_1529_1373229030.1584121231568
Content-Type: text/plain; charset="UTF-8"

I tried to make two different non-root cell by taking jetson-tx1-demo as an 
example when I try to create cell it says resource busy. Then I make 
another configuration as espresso-demo i was able to create cell but when I 
tried to change communication region and UART region (I mean address) it 
shows un-handled error but when I kept UART and communication address same 
as the tx1-demo it was successfully loaded and started with tx1-demo. 
Displaying result in the same serial port.
I have attached three configuration 
1.jetson-tx1-demo(in built in jailhouse)
2.jetson-tx1-inmate1(configured by using 1 as template) (resource busy 
error)
3.jetson-tx1-inmate2(configured by using espresso-demo as template)
4.jetson-tx1 root cell
Questions:
1. Do all cell have same UART, IVSHMEM, and communication 
region(0x80000000; I checked with other arm64 cell also all of them have 
same address why?)?
2. How can I direct output of each cell to different serial port?
3. Why there is resource busy error in second case?
4. I don't understand how to declare irqchip and pci_device for each cell 
and root cell? (most difficult one)

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2568a874-f368-4cec-9076-bad2a0669af4%40googlegroups.com.

------=_Part_1529_1373229030.1584121231568
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I tried to make two different non-root cell by taking=
 jetson-tx1-demo as an example when I try to create cell it says resource b=
usy. Then I make another configuration as espresso-demo i was able to creat=
e cell but when I tried to change communication region and UART region (I m=
ean address) it shows un-handled error but when I kept UART and communicati=
on address same as the tx1-demo it was successfully loaded and started with=
 tx1-demo. Displaying result in the same serial port.</div><div>I have atta=
ched three configuration <br></div><div>1.jetson-tx1-demo(in built in jailh=
ouse)</div><div>2.jetson-tx1-inmate1(configured by using 1 as template) (re=
source busy error)<br></div><div>3.jetson-tx1-inmate2(configured by using e=
spresso-demo as template)</div><div>4.jetson-tx1 root cell<br></div><div>Qu=
estions:</div><div>1. Do all cell have same UART, IVSHMEM, and communicatio=
n region(0x80000000; I checked with other arm64 cell also all of them have =
same address why?)?</div><div>2. How can I direct output of each cell to di=
fferent serial port?</div><div>3. Why there is resource busy error in secon=
d case?</div><div>4. I don&#39;t understand how to declare irqchip and pci_=
device for each cell and root cell? (most difficult one)<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2568a874-f368-4cec-9076-bad2a0669af4%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/2568a874-f368-4cec-9076-bad2a0669af4%40googlegroups.com<=
/a>.<br />

------=_Part_1529_1373229030.1584121231568--

------=_Part_1528_875332984.1584121231568
Content-Type: text/x-csrc; charset=US-ASCII; name=jetson-tx1.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=jetson-tx1.c
X-Attachment-Id: 1939abee-4465-4e7d-b081-3052e7a55e56
Content-ID: <1939abee-4465-4e7d-b081-3052e7a55e56>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for Jailhouse Jetson TX1 board
 *
 * Copyright (C) 2016 Evidence Srl
 *
 * Authors:
 *  Claudio Scordino <claudio@evidence.eu.com>
 *  Bruno Morelli <b.morelli@evidence.eu.com>
 *  Luca Cuomo <l.cuomo@evidence.eu.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * NOTE: Add "mem=3968M vmalloc=512M" to the kernel command line.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[44];
        struct jailhouse_irqchip irqchips[2];
	struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.hypervisor_memory = {
			.phys_start = 0x17c000000,
			.size = 0x4000000,
		},
		.debug_console = {
			.address = 0x70006000,
			.size = 0x0040,
			.flags = JAILHOUSE_CON1_TYPE_8250 |
				 JAILHOUSE_CON1_ACCESS_MMIO |
				 JAILHOUSE_CON1_REGDIST_4 |
				 JAILHOUSE_CON2_TYPE_ROOTPAGE,
		},
		.platform_info = {
			.pci_mmconfig_base = 0x48000000,
			.pci_mmconfig_end_bus = 0,
			.pci_is_virtual = 1,
			.pci_domain = -1,

			.arm = {
				.gic_version = 2,
				.gicd_base = 0x50041000,
				.gicc_base = 0x50042000,
				.gich_base = 0x50044000,
				.gicv_base = 0x50046000,
				.maintenance_irq = 25,
			}
		},
		.root_cell = {
			.name = "Jetson-TX1",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			/*On jetson TX1 IRQ from 212 to 223 are not assigned.
			The root cell will use from 212 to 217. 
			Note: Jailhouse	adds 32 (GIC's SPI) 
			to the .vpci_irq_base , so 180 is the base value*/
			.vpci_irq_base = 180,
		},
	},

	.cpus = {
		0xf,
	},


	.mem_regions = {

		/* APE 1 */ {
			.phys_start = 0x00000000,
			.virt_start = 0x00000000,
			.size = 0x00D00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* PCIE */ {
			.phys_start = 0x01000000,
			.virt_start = 0x01000000,
			.size = 0x3F000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* Data memory */ {
			.phys_start = 0x040000000,
			.virt_start = 0x040000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* host1x */ {
			.phys_start = 0x50000000,
			.virt_start = 0x50000000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* Graphics Host */ {
			.phys_start = 0x54000000,
			.virt_start = 0x54000000,
			.size = 0x3000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* GPU */ {
			.phys_start = 0x57000000,
			.virt_start = 0x57000000,
			.size = 0x9000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* Semaphores */ {
			.phys_start = 0x60000000,
			.virt_start = 0x60000000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* Legacy Interrupt Controller (ICTRL) */ {
			.phys_start = 0x60004000,
			.virt_start = 0x60004000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* TMR */ {
			.phys_start = 0x60005000,
			.virt_start = 0x60005000,
			.size = 0x01000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* Clock and Reset */ {
			.phys_start = 0x60006000,
			.virt_start = 0x60006000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* Flow Controller */ {
			.phys_start = 0x60007000,
			.virt_start = 0x60007000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* AHB-DMA */ {
			.phys_start = 0x60008000,
			.virt_start = 0x60008000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* System registers, secure boot, activity monitor */ {
			.phys_start = 0x6000c000,
			.virt_start = 0x6000c000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* GPIOs + exception vectors */ {
			.phys_start = 0x6000d000,
			.virt_start = 0x6000d000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* IPATCH */ {
			.phys_start = 0x60010000,
			.virt_start = 0x60010000,
			.size = 0x0010000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* APB-DMA + VGPIO */ {
			.phys_start = 0x60020000,
			.virt_start = 0x60020000,
			.size = 0x5000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* MISC stuff (see datasheet) */ {
			.phys_start = 0x70000000,
			.virt_start = 0x70000000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* UARTs */ {
			.phys_start = 0x70006000,
			.virt_start = 0x70006000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* PWM Controller */ {
			.phys_start = 0x7000a000,
			.virt_start = 0x7000a000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* I2C  + SPI*/ {
			.phys_start = 0x7000c000,
			.virt_start = 0x7000c000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* RTC  + PMC + FUSE + KFUSE */ {
			.phys_start = 0x7000e000,
			.virt_start = 0x7000e000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* Sensors */ {
			.phys_start = 0x70010000,
			.virt_start = 0x70010000,
			.size = 0x0008000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* MC */ {
			.phys_start = 0x70019000,
			.virt_start = 0x70019000,
			.size = 0x7000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* SATA */ {
			.phys_start = 0x70020000,
			.virt_start = 0x70020000,
			.size = 0x0010000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* HDA */ {
			.phys_start = 0x70030000,
			.virt_start = 0x70030000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* CLUSTER CLOCK */ {
			.phys_start = 0x70040000,
			.virt_start = 0x70040000,
			.size = 0x0040000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* XUSB */ {
			.phys_start = 0x70090000,
			.virt_start = 0x70090000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* DDS */ {
			.phys_start = 0x700a0000,
			.virt_start = 0x700a0000,
			.size = 0x0002000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* SDMMCs */ {
			.phys_start = 0x700b0000,
			.virt_start = 0x700b0000,
			.size = 0x5000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* SPEEDO */ {
			.phys_start = 0x700c0000,
			.virt_start = 0x700c0000,
			.size = 0x0008000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* DP2 + APB2JTAG */ {
			.phys_start = 0x700e0000,
			.virt_start = 0x700e0000,
			.size = 0x0002000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* SOC_THERM */ {
			.phys_start = 0x700e2000,
			.virt_start = 0x700e2000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* MIPI_CAL */ {
			.phys_start = 0x700e3000,
			.virt_start = 0x700e3000,
			.size = 0x100,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* SYSCTR0 */ {
			.phys_start = 0x700f0000,
			.virt_start = 0x700f0000,
			.size = 0x0010000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* SYSCTR1 */ {
			.phys_start = 0x70100000,
			.virt_start = 0x70100000,
			.size = 0x0010000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* DVFS */ {
			.phys_start = 0x70110000,
			.virt_start = 0x70110000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* APE 2 */ {
			.phys_start = 0x702c0000,
			.virt_start = 0x702c0000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* QSPI */ {
			.phys_start = 0x70410000,
			.virt_start = 0x70410000,
			.size = 0x0001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* STM + CSITE */ {
			.phys_start = 0x71000000,
			.virt_start = 0x71000000,
			.size = 0x2000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* AHB_A1 */ {
			.phys_start = 0x78000000,
			.virt_start = 0x78000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* AHB_A2 or USB */ {
			.phys_start = 0x7c000000,
			.virt_start = 0x7c000000,
			.size = 0x2000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* System RAM */ {
			.phys_start = 0x80000000,
			.virt_start = 0x80000000,
			.size = 0xfc000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* IVHSMEM  1*/ {
                        .phys_start = 0x17ba00000,
                        .virt_start = 0x17ba00000,
                        .size = 0x100000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,

                },

		/* IVHSMEM  2*/ {
                        .phys_start = 0x17bd00000,
                        .virt_start = 0x17bd00000,
                        .size = 0x100000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
                },

	},

	.irqchips = {
		/* GIC */ {
			.address = 0x50041000,
			.pin_base = 32,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* GIC */ {
			.address = 0x50041000,
			.pin_base = 160,
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
			.shmem_region = 42,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,

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
                        .shmem_region = 43,
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,

                },
        },

};

------=_Part_1528_875332984.1584121231568
Content-Type: text/x-csrc; charset=US-ASCII; name=jetson-tx1-demo.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=jetson-tx1-demo.c
X-Attachment-Id: 88d3ed0c-d9d1-4085-abe2-29e4a3b728c8
Content-ID: <88d3ed0c-d9d1-4085-abe2-29e4a3b728c8>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for uart+ivshmem demo inmate on Nvidia Jetson TX1:
 * 1 CPU, 64K RAM, serial port 0
 *
 * Copyright (c)  2018 Evidence Srl
 *
 * Authors:
 *  Luca Cuomo <l.cuomo@evidence.eu.com>
 *
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
	struct jailhouse_memory mem_regions[4];
	struct jailhouse_irqchip irqchips[2];
	struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "jetson-tx1-demo",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
		/*On Jetson TX1 the IRQs from 212 to 223 are not assigned.
		The bare metal cell will use IRQs from 218 to 223.
		Note: Jailhouse adds 32 (GIC's SPI) to the .vpci_irq_base,
		so 186 is the base value*/
		.vpci_irq_base = 186,
	},

	.cpus = {
		0x8,
	},

	.mem_regions = {
		/* UART */ {
			.phys_start = 0x70006000,
			.virt_start = 0x70006000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* RAM */ {
			.phys_start = 0x17bfe0000,
			.virt_start = 0,
			.size = 0x00010000,
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
                        .phys_start = 0x17ba00000,
                        .virt_start = 0x17ba00000,
                        .size = 0x100000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE  |
                                JAILHOUSE_MEM_ROOTSHARED,

                },

                /* IVHSMEM  2*/ /*{
                        .phys_start = 0x17bd00000,
                        .virt_start = 0x17bd00000,
                        .size = 0x100000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_ROOTSHARED ,

                },*/ //IVHSMEM 2 used in jetson-tx1-inmate1 
	},

	.irqchips = {
		/* GIC */ {
			.address = 0x50041000,
                        .pin_base = 32,
                        /* Interrupts:
                           46 for UART C  */
                        .pin_bitmap = {
				0,
				1<<(46-32)
                        },
                },

		/* GIC */ {
			.address = 0x50041000,
                        .pin_base = 160,
                        /* Interrupts:
                           186 for IVSHMEM,
                           belongs to the bare metal cell  */
                        .pin_bitmap = {
				0,
				3<<(186-160)
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
			/* num_msix_vectors needs to be 0 for INTx operation*/
			.num_msix_vectors = 0, 
                        .shmem_region = 3, /* must be no of IVSHMEM region above */
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
                },
		 /*{
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .bdf = 0xf << 3,
                        .bar_mask = {
                                0xffffff00, 0xffffffff, 0x00000000,
                                0x00000000, 0x00000000, 0x00000000,
                        },
                        /* num_msix_vectors needs to be 0 for INTx operation*/
                       /* .num_msix_vectors = 0,
                        .shmem_region = 4, /* must be no of IVSHMEM region above */
                       /* .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
                },*/
        },
};

------=_Part_1528_875332984.1584121231568
Content-Type: text/x-csrc; charset=US-ASCII; name=jetson-tx1-inamte2.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=jetson-tx1-inamte2.c
X-Attachment-Id: 658001a6-cf48-439f-90ec-4dd54e50c57f
Content-ID: <658001a6-cf48-439f-90ec-4dd54e50c57f>

/*this cell is created and loaded successfully while the error obtained while changining UART adderss alone and Communication
region alone is placed in comments*/

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])

struct {
        struct jailhouse_cell_desc cell;
        __u64 cpus[1];
        struct jailhouse_memory mem_regions[3];
        //struct jailhouse_irqchip irqchips[2];
        //struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config = {
        .cell = {
                .signature = JAILHOUSE_CELL_DESC_SIGNATURE,
                .revision = JAILHOUSE_CONFIG_REVISION,
                .name = "jetson-tx1-inmate2",
                .flags = JAILHOUSE_CELL_PASSIVE_COMMREG,

                .cpu_set_size = sizeof(config.cpus),
                .num_memory_regions = ARRAY_SIZE(config.mem_regions),
                .num_irqchips = 0, //ARRAY_SIZE(config.irqchips),
                .num_pci_devices = 0, //ARRAY_SIZE(config.pci_devices),
                //.vpci_irq_base = 186,
        },

        .cpus = {
                0x4,
        },

        .mem_regions = {
                /* UART */ {
                        .phys_start = 0x70006000,/*when change to 0x70006200 (address of UARTC ) 
						unhandlled error at 0x70006024 when loading cell*/
                        .virt_start = 0x70006000,
                        .size = 0x1000,//size decress to oxe00 for 0x70006200
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
                },
                /* RAM */ {
                        .phys_start = 0x17a000000,
                        .virt_start = 0,
                        .size = 0x00010000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
                                JAILHOUSE_MEM_LOADABLE,
                },
                /* communication region */ {
                        .virt_start = 0x80000000,//when change to 0x80001000 unhandlled error at 0x80000006 when loading cell
                        .size = 0x00001000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_COMM_REGION,
                },
        }
};
                                                                     

------=_Part_1528_875332984.1584121231568
Content-Type: text/x-csrc; charset=US-ASCII; name=jetson-tx1-inmate1.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=jetson-tx1-inmate1.c
X-Attachment-Id: 616f51fc-8a61-4ecb-a4be-5a863d2f1d98
Content-ID: <616f51fc-8a61-4ecb-a4be-5a863d2f1d98>

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])

struct {
        struct jailhouse_cell_desc cell;
        __u64 cpus[1];
        struct jailhouse_memory mem_regions[4];
        struct jailhouse_irqchip irqchips[2];
        struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config = {
        .cell = {
                .signature = JAILHOUSE_CELL_DESC_SIGNATURE,
                .revision = JAILHOUSE_CONFIG_REVISION,
                .name = "jetson-tx1-inmate1",
                .flags = JAILHOUSE_CELL_PASSIVE_COMMREG,

                .cpu_set_size = sizeof(config.cpus),
                .num_memory_regions = ARRAY_SIZE(config.mem_regions),
                .num_irqchips = ARRAY_SIZE(config.irqchips),
                .num_pci_devices = ARRAY_SIZE(config.pci_devices),
                .vpci_irq_base = 190,//186 in tx1-demo
        },

        .cpus = {
                0x4,
        },

        .mem_regions = {
                /* UART */ {
                        .phys_start = 0x70006000,
                        .virt_start = 0x70006000,
                        .size = 0x1000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_IO,
                },//same as tx1-demo
                /* RAM */ {
                        .phys_start = 0x17a000000,//0xbfe000000 in tx1-demo
                        .virt_start = 0,
                        .size = 0x00010000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
                },
                /* communication region */ {
                        .virt_start = 0x80000000,
                        .size = 0x00001000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_COMM_REGION,
 		},//same as tx1-demo

                 /*IVHSMEM  2*/ {
                        .phys_start = 0x17bd00000,
                        .virt_start = 0x17bd00000,
                        .size = 0x100000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_ROOTSHARED ,

                },
        },

        .irqchips = {
                /* GIC */ {
                        .address = 0x50041000,
                        .pin_base = 32,
                        /* Interrupts:
                           37 for UART B  */
                        .pin_bitmap = {
                                0,
                                1<<(37-32)//46-32 for tx1-demo
                        },
                },

                /* GIC */ {
                        .address = 0x50041000,
                        .pin_base = 160,
                        /* Interrupts:
                           190 for IVSHMEM,
                           belongs to the bare metal cell  */
                        .pin_bitmap = {
                                0,
                                3<<(190-160) //186-160 for tx1-demo
                        },
                },
        },

        .pci_devices = {
                {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .bdf = 0x0 << 3,
                        .bar_mask = {
                                0x00000000, 0x00000000, 0xffffffff,
                                0xffffffff, 0x00000000, 0x00000000,
                        },
                        /* num_msix_vectors needs to be 0 for INTx operation*/
                        .num_msix_vectors = 0,
                        .shmem_region = 3, /* must be no of IVSHMEM region above */
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
                },
                 
        },
};




------=_Part_1528_875332984.1584121231568--
