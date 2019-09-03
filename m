Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBTXYXPVQKGQE76EUPOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF5AA77B0
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 01:50:40 +0200 (CEST)
Received: by mail-ot1-x337.google.com with SMTP id k70sf11537892otk.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Sep 2019 16:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0Lvo4PnsRmPg2nQ7QL7R6OVw8cm+sohC0xssqY1IF9c=;
        b=aCa0bhMask4eBECPZQYl3gX4mhkhraQeZYSU1BXpqvaR3DzqGeqnGZTs4TOkGjzkfZ
         FCgK4JRGpVO8CHfM71ZkDv3ILTEyqJ999VtgmHPKxnteKTqTOfgTQKnIRERAaKIoRvxy
         xak4++rsMnYaklRT6lwcJIO9Z9+Su6OmuhownyPqy4MWQnHRxzQgF83IlUpbuJHDyMxc
         5AEicBtw77ogZ8sd4lGQRwI2yz9k19DqMPTp4x5TxFvlLc9LMngZ1gS7qSbYIVFZaQpf
         lliJXB+WkGzhrg0gfEGux2kB2KSFAVio6UqZQRtkZZ3oKmudr43vbTxshCRsKARKVYOj
         qpvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0Lvo4PnsRmPg2nQ7QL7R6OVw8cm+sohC0xssqY1IF9c=;
        b=m5cN6G5Jxdmkcp5ZguOBnpSJBIBBG6U7AEEFeWVew4VIT7laPe/n4liOu3+sZhoC+v
         UnY/aRlqxaBkMkZkYU0g72AENKna11HeMbWZgDEbdHPKcgW/RSdk6g8paxXlrXOtmKZp
         w6iDOhwVkhidFGLFbhc6tFc8GdGlZ1zL386/gcPnrKJpeYu+QGz3jza+jOqhHJhSfANo
         Jr4PfYT8aqH4P5q0S0FvzWgfe+IaGq8gON7HYzyKV8IUlnZxizxORy7RN9iNgRKWMOzQ
         eisFdNjWQUc62kZb99ziixDzMjFZG+KXW+Fdku9f5ajclOdzuhjSVBDkv0zRHG2Y/gAJ
         VENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=0Lvo4PnsRmPg2nQ7QL7R6OVw8cm+sohC0xssqY1IF9c=;
        b=hWA2JhdubxGpMFPAo5wIp11sUVLrJOlGalkMUuGFUKSmBlfMljYfnlzExGtpyKzguv
         is9QM6k2KalBtiLRJXvNv7xfPgyTfL/tx+9Gvs5vai70GAlji4/gUkerzak1Hmf+Kcut
         iVEQiR2QRauz1JopxT099Zx5ysh9Oihm3LtpkJP5MgH4hshfrxlqIOdL0Idx5zGt/+V0
         i2TcQWyM2HMTqpMG58rh37bhqLS+22HOHRLKulGvrK5cuhPyQw2KnjHI8QMFd5XORKIe
         fVGHDrHqJHyjV1VXRBMU/GJJLyz9DfJ61dYUnNOWH3kVIffxFA0puiNDDBsuL3urfBf9
         i+kw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU4g8RvBUjHMdYOoVgESlUWcLkvG2O6jUe37U8tkFy2IG1IfKkN
	UR39PNtbu2VpqZel7RrTQYY=
X-Google-Smtp-Source: APXvYqzvmLBsKUYVNzTHlfYrpzrnrBbcCEIRjOZdAz+V3jktwCbsYca31OW7+r0+fhunPE+L5gUfiA==
X-Received: by 2002:a05:6830:4d6:: with SMTP id s22mr31705590otd.295.1567554638798;
        Tue, 03 Sep 2019 16:50:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:159:: with SMTP id j25ls1554489otp.12.gmail; Tue,
 03 Sep 2019 16:50:38 -0700 (PDT)
X-Received: by 2002:a9d:1eb:: with SMTP id e98mr391915ote.244.1567554638100;
        Tue, 03 Sep 2019 16:50:38 -0700 (PDT)
Date: Tue, 3 Sep 2019 16:50:36 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <4c3f4741-3014-4721-a867-e303a516bb90@googlegroups.com>
In-Reply-To: <2afe4763-ee2e-4da7-8447-c544ff1f1f28@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
 <164159e0-478e-c5e9-fc8a-e0c0cb27da7a@siemens.com>
 <f1de42fc-bae2-4962-ace6-a38e99a441d4@googlegroups.com>
 <dd33650a-c068-52ca-4da7-4537de652bfa@siemens.com>
 <82a56f53-a498-4a27-8458-250d9a7e7078@googlegroups.com>
 <211c06d2-9f92-cbd1-8215-12c577eefa62@siemens.com>
 <2add490d-0d13-44f6-9873-d7fcbf1c4141@googlegroups.com>
 <2dc2470b-9494-4f43-a582-06c2558fa985@googlegroups.com>
 <df7be3b4-a447-0ff1-f43b-ee37bf6513bb@web.de>
 <c183c116-5942-4d08-a0a7-a897e8fbed20@googlegroups.com>
 <6dfd2128-011a-420f-860f-4ccb472c079f@googlegroups.com>
 <67cdfa4b-86e9-496a-3878-b5a0016b75c0@siemens.com>
 <521c355a-eacc-434e-b50d-dd7c797be08a@googlegroups.com>
 <4fe67562-ffb1-a306-542e-c27b0450bca1@web.de>
 <71ab42b5-b8c9-4392-9575-759f6eb899a0@googlegroups.com>
 <1c8ad7db-eb23-034d-dbad-33267d4227f1@siemens.com>
 <12e2c8ec-e900-4d3a-9f78-086803483af6@googlegroups.com>
 <be855ebb-4ed7-2f57-5870-ace709135e4f@siemens.com>
 <2afe4763-ee2e-4da7-8447-c544ff1f1f28@googlegroups.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2210_1066316040.1567554637198"
X-Original-Sender: jpagsreis@gmail.com
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

------=_Part_2210_1066316040.1567554637198
Content-Type: multipart/alternative; 
	boundary="----=_Part_2211_1916641426.1567554637198"

------=_Part_2211_1916641426.1567554637198
Content-Type: text/plain; charset="UTF-8"

After adding earlycon support to non-root cell, i realized that the problem 
is with non-root cell linux that doesn't even boot.
I send the non-root cell linux's early boot log (putty.log) and .dts and 
non-root cell config files.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4c3f4741-3014-4721-a867-e303a516bb90%40googlegroups.com.

------=_Part_2211_1916641426.1567554637198
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">After adding earlycon support to non-root cell, i realized=
 that the problem is with non-root cell linux that doesn&#39;t even boot.<d=
iv>I send the non-root cell linux&#39;s early boot log (putty.log) and .dts=
 and non-root cell config files.</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/4c3f4741-3014-4721-a867-e303a516bb90%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/4c3f4741-3014-4721-a867-e303a516bb90%40googlegroups.com<=
/a>.<br />

------=_Part_2211_1916641426.1567554637198--

------=_Part_2210_1066316040.1567554637198
Content-Type: application/octet-stream; name=inmate-zynqmp.dts
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=inmate-zynqmp.dts
X-Attachment-Id: fc9da2a4-8085-4a5d-97f7-f5248d924e00
Content-ID: <fc9da2a4-8085-4a5d-97f7-f5248d924e00>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Device tree for Linux inmate test on ZynqMP ZCU102 and Ultra96 boards,
 * corresponds to configs/arm64/zynqmp-zcu102-linux-demo.c and
 * configs/arm64/ultra96-linux-demo.c.
 *
 * Copyright (c) Siemens AG, 2016-2019
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <dt-bindings/interrupt-controller/arm-gic.h>

/dts-v1/;

/ {
	model = "Jailhouse cell on ZynqMP";

	#address-cells = <2>;
	#size-cells = <2>;

	interrupt-parent = <&gic>;

	hypervisor {
		compatible = "jailhouse,cell";
	};

	cpus {
		#address-cells = <2>;
		#size-cells = <0>;

		cpu@3 {
			compatible = "arm,cortex-a53", "arm,armv8";
			device_type = "cpu";
			reg = <0x0 0x3>;
			enable-method = "psci";
		};
	};

	psci {
		compatible = "arm,psci-0.2";
		method = "smc";
	};

	timer {
		compatible = "arm,armv8-timer";
		interrupts = <GIC_PPI 13
				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
			     <GIC_PPI 14
				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
			     <GIC_PPI 11
				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
			     <GIC_PPI 10
				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
	};

	gic: interrupt-controller@f6801000 {
		compatible = "arm,gic-400";
		reg = <0x0 0xf9010000 0x0 0x1000>,
		      <0x0 0xf902f000 0x0 0x2000>;
		interrupt-controller;
		#interrupt-cells = <3>;
	};

	uartclk: clock {
		compatible = "fixed-clock";
		#clock-cells = <0>;
		clock-frequency = <100000000>;
	};
	

	uart1: serial@ff010000 {
		compatible = "cdns,uart-r1p12", "xlnx,xuartps";
		reg = <0x0 0xff010000 0x0 0x1000>;
		interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
		clocks = <&uartclk>, <&uartclk>;
		clock-names = "uart_clk", "pclk";
	};
	

	pci@fc000000 {
		compatible = "pci-host-ecam-generic";
		device_type = "pci";
		bus-range = <0 0>;
		#address-cells = <3>;
		#size-cells = <2>;
		#interrupt-cells = <1>;
		interrupt-map-mask = <0 0 0 7>;
		interrupt-map = <0 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_EDGE_RISING>,
				<0 0 0 2 &gic GIC_SPI 109 IRQ_TYPE_EDGE_RISING>,
				<0 0 0 3 &gic GIC_SPI 110 IRQ_TYPE_EDGE_RISING>,
				<0 0 0 4 &gic GIC_SPI 111 IRQ_TYPE_EDGE_RISING>;
		reg = <0x0 0xfc000000 0x0 0x100000>;
		ranges =
			<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
	};
};

------=_Part_2210_1066316040.1567554637198
Content-Type: text/x-csrc; charset=UTF-8; name=ultra96-linux-demo-col.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ultra96-linux-demo-col.c
X-Attachment-Id: a2c942bd-ef09-49d6-b5c2-a2a3b032123c
Content-ID: <a2c942bd-ef09-49d6-b5c2-a2a3b032123c>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for linux-demo inmate on Avnet Ultra96 board:
 * 2 CPUs, 128M RAM, serial port 2
 *
 * Copyright (c) Siemens AG, 2014-2019
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
=09struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config =3D {
=09.cell =3D {
=09=09.signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
=09=09.revision =3D JAILHOUSE_CONFIG_REVISION,
=09=09.name =3D "linux-non-root",
=09=09/*
=09=09 * The flag JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED allows inmates t=
o invoke
=09=09 * the dbg putc hypercall.
=09=09 *
=09=09 * If JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE is set, inmates should us=
e the
=09=09 * virtual console. This flag implies JAILHOUSE_CELL_VIRTUAL_CONSOLE_=
PERMITTED.
=09=09 */
=09=09.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG | JAILHOUSE_CELL_VIRTUAL_CO=
NSOLE_PERMITTED |
=09=09JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,

=09=09.cpu_set_size =3D sizeof(config.cpus),
=09=09.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
=09=09.num_irqchips =3D ARRAY_SIZE(config.irqchips),
=09=09.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),

=09=09.vpci_irq_base =3D 140-32,

=09=09.console =3D {
=09=09=09.address =3D 0xff010000, /*UART1*/
=09=09=09//.address =3D 0xff000000, /*UART0*/ //se eu meter uart0 da erro u=
nhandled trap
=09=09=09.type=3D JAILHOUSE_CON_TYPE_XUARTPS,
=09=09=09.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
=09=09=09=09 JAILHOUSE_CON_REGDIST_4,
=09=09},
=09},

=09.cpus =3D {
=09=090x8, //1000 - fica com cpu3
=09},

=09.mem_regions =3D {
=09=09/* UART */ {
=09=09=09.phys_start =3D 0xff010000,
=09=09=09.virt_start =3D 0xff010000,
=09=09=09.size =3D 0x1000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
=09=09},
=09=09/* Colored RAM for kernel image and initramfs*/ {
=09=09=09.phys_start =3D 0x40000000,
=09=09=09.virt_start =3D 0x40000000,
=09=09=09.size =3D 0x30000000, //must be page size aligned  //Image + rootf=
s.cpio =3D 200MB // 0x30000000 =3D 768MB
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
=09=09=09=09JAILHOUSE_MEM_DMA| JAILHOUSE_MEM_COLORED_CELL,=20
    =09=09=09.colors =3D 0xff00,
=09=09},
=09=09/* RAM for loader*/ {
=09=09=09.phys_start =3D 0x7bef0000,
=09=09=09.virt_start =3D 0, //needs to start at 0 for loader
=09=09=09.size =3D 0x10000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x74000000,
=09=09=09.virt_start =3D 0x74000000,
=09=09=09.size =3D 0x7ef0000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
=09=09=09=09JAILHOUSE_MEM_LOADABLE,
=09=09},
=09=09/* IVSHMEM shared memory region */ {
=09=09=09.phys_start =3D 0x7bf00000,
=09=09=09.virt_start =3D 0x7bf00000,
=09=09=09.size =3D 0x100000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED,
=09=09},
=09=09/* communication region */ {
=09=09=09.virt_start =3D 0x80000000,
=09=09=09.size =3D 0x00001000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_COMM_REGION,
=09=09},
=09=09/* IVSHMEM shared memory region (network) */ {
=09=09=09.phys_start =3D 0x7c000000,
=09=09=09.virt_start =3D 0x7c000000,
=09=09=09.size =3D 0x100000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED,
=09=09},
=09},
=09=09

=09.irqchips =3D {
=09=09/* GIC */ {
=09=09=09.address =3D 0xf9010000, /* GICD base address - Display controller=
 https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultra=
scale-trm.pdf page 329*/
=09=09=09.pin_base =3D 32, /* The first irqchip starts at .pin_base=3D32 as=
 the first 32 interrupts are=20
reserved for SGIs and PPIs. */ /* https://static.docs.arm.com/ddi0471/a/DDI=
0471A_gic400_r0p0_trm.pdf page 34*/
=09=09=09.pin_bitmap =3D { /* https://www.cl.cam.ac.uk/research/srg/han/ACS=
-P35/zynq/arm_gic_architecture_specification.pdf page 88 GICD-TYPER*/
=09=09=09=091 << (54 - 32), /* interrupt da UART1 */
=09=09=09=09//1 << (53 - 32), /* /proc/interrupts interrupt da UART0 AQUI E=
STA A DIFEREN=C3=87A / no zynqmp.dtsi na uart0 esta definido a interrupt 53=
-32=3D21 */
=09=09=09=090,
=09=09=09=090,
=09=09=09=09(1 << (140 - 128)) | (1 << (142 - 128)) //PL to PS interrupt si=
gnals 8 to 15.
=09=09=09},
=09=09},
=09},

=09.pci_devices =3D {
=09=09/* 00:00.0 */ {
=09=09=09.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
=09=09=09.bdf =3D 0 << 3, // 00:00.0
=09=09=09.iommu =3D 1,//
=09=09=09.bar_mask =3D {
=09=09=09=090xffffff00, 0xffffffff, 0x00000000,
=09=09=09=090x00000000, 0x00000000, 0x00000000,
=09=09=09},
=09=09=09.shmem_region =3D 4,
=09=09=09.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED, //Undefined t=
ype
=09=09=09//.num_msix_vectors =3D 1,
=09=09},
=09=09/* 00:01.0 */ {
=09=09=09.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
=09=09=09.bdf =3D 1 << 3, // 00:01.0
=09=09=09.iommu =3D 1,//
=09=09=09.bar_mask =3D {
=09=09=09=090xffffff00, 0xffffffff, 0x00000000,
=09=09=09=090x00000000, 0x00000000, 0x00000000,
=09=09=09},
=09=09=09.shmem_region =3D 6,
=09=09=09.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH, //Virtual peer-to-=
peer Ethernet
=09=09=09//.num_msix_vectors =3D 1,
=09=09},
=09},
};

------=_Part_2210_1066316040.1567554637198
Content-Type: text/plain; charset=US-ASCII; name=putty.log
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=putty.log
X-Attachment-Id: c9d701bd-4b4b-4208-a9fa-f00b77ff707b
Content-ID: <c9d701bd-4b4b-4208-a9fa-f00b77ff707b>

[    0.000000] Booting Linux on physical CPU 0x3

[    0.000000] Linux version 4.14.0-xilinx-v2018.2 (oe-user@oe-host) (gcc version 7.2.0 (GCC)) #4 SMP Tue Sep 3 18:58:35 WEST 2019

[    0.000000] Boot CPU: AArch64 Processor [410fd034]

[    0.000000] Machine model: Jailhouse cell on ZynqMP

[    0.000000] earlycon: jailhouse0 at I/O port 0x0 (options '')

[    0.000000] bootconsole [jailhouse0] enabled

[    0.000000] efi: Getting EFI parameters from FDT:

[    0.000000] efi: UEFI not found.

[    0.000000] cma: Reserved 256 MiB at 0x0000000051000000

root@xilinx-ultra96-reva-2018_2:~# [    0.000000] psci: probing for conduit method from DT.

[    0.000000] psci: PSCIv1.1 detected in firmware.

[    0.000000] psci: Using standard PSCI v0.2 function IDs

[    0.000000] psci: MIGRATE_INFO_TYPE not supported.

[    0.000000] percpu: Embedded 21 pages/cpu @ffffffc03becb000 s46488 r8192 d31336 u86016

[    0.000000] Detected VIPT I-cache on CPU0

[    0.000000] CPU features: enabling workaround for ARM erratum 845719

[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 225971

[    0.000000] Kernel command line: console=jailhouse

[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)

[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)

[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)

[    0.000000] Memory: 287112K/916416K available (7420K kernel code, 474K rwdata, 2632K rodata, 169408K init, 2127K bss, 367160K reserved, 262144K cma-reserved)

[    0.000000] Virtual kernel memory layout:

[    0.000000]     modules : 0xffffff8000000000 - 0xffffff8008000000   (   128 MB)

[    0.000000]     vmalloc : 0xffffff8008000000 - 0xffffffbebfff0000   (   250 GB)

[    0.000000]       .text : 0xffffff8008080000 - 0xffffff80087c0000   (  7424 KB)

[    0.000000]     .rodata : 0xffffff80087c0000 - 0xffffff8008a60000   (  2688 KB)

[    0.000000]       .init : 0xffffff8008a60000 - 0xffffff8012fd0000   (169408 KB)

[    0.000000]       .data : 0xffffff8012fd0000 - 0xffffff8013046a00   (   475 KB)

[    0.000000]        .bss : 0xffffff8013046a00 - 0xffffff801325a7c8   (  2128 KB)

[    0.000000]     fixed   : 0xffffffbefe7fd000 - 0xffffffbefec00000   (  4108 KB)

[    0.000000]     PCI I/O : 0xffffffbefee00000 - 0xffffffbeffe00000   (    16 MB)

[    0.000000]     vmemmap : 0xffffffbf00000000 - 0xffffffc000000000   (     4 GB maximum)

[    0.000000]               0xffffffbf00000000 - 0xffffffbf00d1c480   (    13 MB actual)

[    0.000000]     memory  : 0xffffffc000000000 - 0xffffffc03bef0000   (   958 MB)

[    0.000000] Hierarchical RCU implementation.

[    0.000000] 	RCU event tracing is enabled.

[    0.000000] 	RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=1.

[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1

[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0

[    0.000000] arch_timer: cp15 timer(s) running at 99.99MHz (virt).

[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1710236356, max_idle_ns: 440795202549 ns

[    0.000003] sched_clock: 56 bits at 99MHz, resolution 10ns, wraps every 4398046511099ns

[    0.008227] Console: colour dummy device 80x25

[    0.012510] Calibrating delay loop (skipped), value calculated using timer frequency.. 199.99 BogoMIPS (lpj=399999)

[    0.022911] pid_max: default: 32768 minimum: 301

[    0.027603] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)

[    0.034200] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes)

[    0.042102] ASID allocator initialised with 65536 entries

[    0.047384] Hierarchical SRCU implementation.

[    0.051867] EFI services will not be available.

[    0.056276] smp: Bringing up secondary CPUs ...

[    0.060740] smp: Brought up 1 node, 1 CPU

[    0.064725] SMP: Total of 1 processors activated.

[    0.069422] CPU features: detected feature: 32-bit EL0 Support

[    0.075239] CPU: All CPU(s) started at EL1

[    0.079322] alternatives: patching kernel code

[    0.084292] devtmpfs: initialized

[    0.087907] random: get_random_u32 called from bucket_table_alloc+0x108/0x260 with crng_init=0

[    0.096471] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns

[    0.106073] futex hash table entries: 256 (order: 3, 32768 bytes)

[    0.118682] pinctrl core: initialized pinctrl subsystem

[    0.124666] NET: Registered protocol family 16

[    0.129471] cpuidle: using governor menu

[    0.133300] vdso: 2 pages (1 code @ ffffff80087c6000, 1 data @ ffffff8012fd4000)

[    0.140616] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.

[    0.147739] random: fast init done

[    0.151860] DMA: preallocated 256 KiB pool for atomic allocations

[    0.158404] ff010000.serial: ttyPS0 at MMIO 0xff010000 (irq = 5, base_baud = 6250000) is a xuartps

[    0.188250] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages

[    0.196110] SCSI subsystem initialized

[    0.199851] pps_core: LinuxPPS API ver. 1 registered

[    0.204648] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>

[    0.213768] PTP clock support registered

[    0.217677] EDAC MC: Ver: 3.0.0

[    0.222131] FPGA manager framework

[    0.225722] Bluetooth: Core ver 2.22

[    0.229144] NET: Registered protocol family 31

[    0.233551] Bluetooth: HCI device and connection manager initialized

[    0.239890] Bluetooth: HCI socket layer initialized

[    0.244747] Bluetooth: L2CAP socket layer initialized

[    0.249793] Bluetooth: SCO socket layer initialized

[    0.256084] clocksource: Switched to clocksource arch_sys_counter

[    0.262135] VFS: Disk quotas dquot_6.6.0

[    0.265957] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)

[    0.280193] NET: Registered protocol family 2

[    0.284764] TCP established hash table entries: 8192 (order: 4, 65536 bytes)

[    0.291704] TCP bind hash table entries: 8192 (order: 5, 131072 bytes)

[    0.298322] TCP: Hash tables configured (established 8192 bind 8192)

[    0.304581] UDP hash table entries: 512 (order: 2, 16384 bytes)

[    0.310421] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)

[    0.316838] NET: Registered protocol family 1

[    0.322079] RPC: Registered named UNIX socket transport module.

[    0.327835] RPC: Registered udp transport module.

[    0.332509] RPC: Registered tcp transport module.

[    0.337195] RPC: Registered tcp NFSv4.1 backchannel transport module.

[    1.387815] Unable to handle kernel paging request at virtual address 5000000c0

[    1.395058] Mem abort info:

[    1.397788]   Exception class = DABT (current EL), IL = 32 bits

[    1.403682]   SET = 0, FnV = 0

[    1.406721]   EA = 0, S1PTW = 0

[    1.409843] Data abort info:

[    1.412708]   ISV = 0, ISS = 0x00000005

[    1.416527]   CM = 0, WnR = 0

[    1.419475] [00000005000000c0] user address but active_mm is swapper

[    1.425819] Internal error: Oops: 96000005 [#1] SMP

[    1.430673] Modules linked in:

[    1.433715] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.14.0-xilinx-v2018.2 #4

[    1.440914] Hardware name: Jailhouse cell on ZynqMP (DT)

[    1.446211] task: ffffffc03a828d00 task.stack: ffffff8008010000

[    1.452124] PC is at __radix_tree_lookup+0x1c/0xe8

[    1.456886] LR is at radix_tree_lookup_slot+0x14/0x28

[    1.461920] pc : [<ffffff80087a7f0c>] lr : [<ffffff80087a7fec>] pstate: 60000005

[    1.469297] sp : ffffff8008013970

[    1.472596] x29: ffffff8008013970 x28: ffffff8008abbba8 

[    1.477890] x27: 0000000000000000 x26: ffffff80087d1a80 

[    1.483185] x25: 00000000014200ca x24: ffffffc02e400000 

[    1.488480] x23: ffffffc02e4001b8 x22: 0000000000001000 

[    1.493775] x21: 0000000000000000 x20: 0000000000000000 

[    1.499070] x19: ffffffc02e4001c0 x18: 0000000000000010 

[    1.504364] x17: 0000000000000007 x16: ffffffc03a801108 

[    1.509659] x15: ffffff8012fd8000 x14: 6f2e35332d6e6f68 

[    1.514954] x13: 747970632e64616f x12: 0000000000000008 

[    1.520249] x11: 0101010101010101 x10: 0000000000000040 

[    1.525544] x9 : ffffffc02e4001c0 x8 : ffffff80081509c8 

[    1.530838] x7 : 0007ffffffffffff x6 : 00000005000000c1 

[    1.536133] x5 : 00000005000000c0 x4 : 0000000000000001 

[    1.541428] x3 : ffffff8008013988 x2 : 0000000000000000 

[    1.546723] x1 : 0000000000000000 x0 : ffffffc02e4001c0 

[    1.552019] Process swapper/0 (pid: 1, stack limit = 0xffffff8008010000)

[    1.558702] Call trace:

[    1.561134] Exception stack(0xffffff8008013830 to 0xffffff8008013970)

[    1.567557] 3820:                                   ffffffc02e4001c0 0000000000000000

[    1.575369] 3840: 0000000000000000 ffffff8008013988 0000000000000001 00000005000000c0

[    1.583182] 3860: 00000005000000c1 0007ffffffffffff ffffff80081509c8 ffffffc02e4001c0

[    1.590993] 3880: 0000000000000040 0101010101010101 0000000000000008 747970632e64616f

[    1.598805] 38a0: 6f2e35332d6e6f68 ffffff8012fd8000 ffffffc03a801108 0000000000000007

[    1.606617] 38c0: 0000000000000010 ffffffc02e4001c0 0000000000000000 0000000000000000

[    1.614429] 38e0: 0000000000001000 ffffffc02e4001b8 ffffffc02e400000 00000000014200ca

[    1.622241] 3900: ffffff80087d1a80 0000000000000000 ffffff8008abbba8 ffffff8008013970

[    1.630053] 3920: ffffff80087a7fec ffffff8008013970 ffffff80087a7f0c 0000000060000005

[    1.637866] 3940: ffffff80080139b0 0000000000000003 ffffffffffffffff ffffff800814ef3c

[    1.645676] 3960: ffffff8008013970 ffffff80087a7f0c

[    1.650540] [<ffffff80087a7f0c>] __radix_tree_lookup+0x1c/0xe8

[    1.656358] [<ffffff8008135d40>] find_get_entry+0x20/0x158

[    1.661822] [<ffffff8008135e9c>] find_lock_entry+0x24/0xd0

[    1.667293] [<ffffff800814fe58>] shmem_getpage_gfp.isra.8+0x98/0xa60

[    1.673627] [<ffffff8008150a00>] shmem_write_begin+0x38/0x60

[    1.679270] [<ffffff8008137128>] generic_perform_write+0x90/0x180

[    1.685345] [<ffffff8008139708>] __generic_file_write_iter+0x100/0x1c8

[    1.691855] [<ffffff8008139954>] generic_file_write_iter+0x184/0x210

[    1.698194] [<ffffff800819a8bc>] __vfs_write+0xac/0x118

[    1.703400] [<ffffff800819ab04>] vfs_write+0x9c/0x1a8

[    1.708435] [<ffffff800819adb8>] SyS_write+0x48/0xb0

[    1.713384] [<ffffff8008a627d4>] xwrite+0x34/0x7c

[    1.718068] [<ffffff8008a6284c>] do_copy+0x30/0xf4

[    1.722842] [<ffffff8008a621d0>] write_buffer+0x34/0x50

[    1.728050] [<ffffff8008a62be4>] unpack_to_rootfs+0xe0/0x260

[    1.733692] [<ffffff8008a62d90>] populate_rootfs+0x2c/0x114

[    1.739250] [<ffffff8008083980>] do_one_initcall+0x38/0x128

[    1.744812] [<ffffff8008a60cc4>] kernel_init_freeable+0x138/0x1d8

[    1.750880] [<ffffff80087b1ae0>] kernel_init+0x10/0x100

[    1.756087] [<ffffff8008084a90>] ret_from_fork+0x10/0x18

[    1.761384] Code: 924004c4 f100049f 540005a1 927ff8c5 (394000a4) 

[    1.767464] ---[ end trace f9d866e48b0d3f01 ]---

[    1.772179] Unable to handle kernel paging request at virtual address 200000010

[    1.779373] Mem abort info:

[    1.782130]   Exception class = DABT (current EL), IL = 32 bits

[    1.788032]   SET = 0, FnV = 0

[    1.791070]   EA = 0, S1PTW = 0

[    1.794194] Data abort info:

[    1.797059]   ISV = 0, ISS = 0x00000005

[    1.800878]   CM = 0, WnR = 0

[    1.803825] [0000000200000010] user address but active_mm is swapper

[    1.810167] Internal error: Oops: 96000005 [#2] SMP

[    1.815022] Modules linked in:

[    1.818063] CPU: 0 PID: 18 Comm: kworker/0:1 Tainted: G      D         4.14.0-xilinx-v2018.2 #4

[    1.826740] Hardware name: Jailhouse cell on ZynqMP (DT)

[    1.832041] Workqueue: events delayed_fput

[    1.836115] task: ffffffc03a8c8480 task.stack: ffffff8013278000

[    1.842023] PC is at fsnotify+0x2ac/0x438

[    1.846012] LR is at fsnotify+0xbc/0x438

[    1.849916] pc : [<ffffff80081db554>] lr : [<ffffff80081db364>] pstate: 00000145

[    1.857293] sp : ffffff801327bcb0

[    1.860592] x29: ffffff801327bcc0 x28: ffffffc03a814c40 

[    1.865887] x27: ffffffc03a814c40 x26: ffffff8008975b18 

[    1.871182] x25: 0000000000000000 x24: ffffffc03a280910 

[    1.876476] x23: 0000000000000001 x22: 0000000000000000 

[    1.881771] x21: ffffffc02e400578 x20: 0000000000000008 

[    1.887066] x19: 0000000000000008 x18: ffffffc03bed5460 

[    1.892361] x17: 000000002e12e1da x16: 00000000946d4223 

[    1.897656] x15: ffffff8012fd8000 x14: 0000000000000000 

[    1.902950] x13: ffffffc03bed5400 x12: 00000000699f84e4 

[    1.908245] x11: 0000000000000000 x10: 0000000000000880 

[    1.913540] x9 : ffffff801327bd90 x8 : ffffffc03a8c8d60 

[    1.918835] x7 : ffffffc03a8c8600 x6 : 0000000000000000 

[    1.924129] x5 : 0000000000000000 x4 : 0000000000000001 

[    1.929424] x3 : 0000000000000000 x2 : 0000004028f0f000 

[    1.934719] x1 : 0000000000000069 x0 : 0000000200000000 

[    1.940015] Process kworker/0:1 (pid: 18, stack limit = 0xffffff8013278000)

[    1.946958] Call trace:

[    1.949390] Exception stack(0xffffff801327bb70 to 0xffffff801327bcb0)

[    1.955813] bb60:                                   0000000200000000 0000000000000069

[    1.963626] bb80: 0000004028f0f000 0000000000000000 0000000000000001 0000000000000000

[    1.971438] bba0: 0000000000000000 ffffffc03a8c8600 ffffffc03a8c8d60 ffffff801327bd90

[    1.979250] bbc0: 0000000000000880 0000000000000000 00000000699f84e4 ffffffc03bed5400

[    1.987062] bbe0: 0000000000000000 ffffff8012fd8000 00000000946d4223 000000002e12e1da

[    1.994874] bc00: ffffffc03bed5460 0000000000000008 0000000000000008 ffffffc02e400578

[    2.002686] bc20: 0000000000000000 0000000000000001 ffffffc03a280910 0000000000000000

[    2.010498] bc40: ffffff8008975b18 ffffffc03a814c40 ffffffc03a814c40 ffffff801327bcc0

[    2.018310] bc60: ffffff80081db364 ffffff801327bcb0 ffffff80081db554 0000000000000145

[    2.026122] bc80: ffffff801327bcd0 ffffff80080f061c ffffffffffffffff ffffff80080f061c

[    2.033933] bca0: ffffff801327bcc0 ffffff80081db554

[    2.038795] [<ffffff80081db554>] fsnotify+0x2ac/0x438

[    2.043830] [<ffffff800819be4c>] __fput+0x164/0x1c8

[    2.048690] [<ffffff800819bee8>] delayed_fput+0x38/0x50

[    2.053901] [<ffffff80080b2d74>] process_one_work+0x1dc/0x348

[    2.059627] [<ffffff80080b2f28>] worker_thread+0x48/0x488

[    2.065010] [<ffffff80080b8bbc>] kthread+0x12c/0x130

[    2.069956] [<ffffff8008084a90>] ret_from_fork+0x10/0x18

[    2.075251] Code: f90027ba f94116a0 d2800019 b4000040 (f9400819) 

[    2.081326] ---[ end trace f9d866e48b0d3f02 ]---

[    2.086519] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

[    2.086519] 

[    2.095488] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

------=_Part_2210_1066316040.1567554637198--
