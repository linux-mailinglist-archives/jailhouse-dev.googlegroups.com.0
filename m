Return-Path: <jailhouse-dev+bncBCC7XQGMWINBBUG2XWWQMGQEPPPLE3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1BE838815
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jan 2024 08:40:02 +0100 (CET)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-dc237543b74sf4809303276.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jan 2024 23:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705995601; x=1706600401; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pf17JRo/c4TlMBBbQmd3DVhNBg8vENLl0aYNxIugnyw=;
        b=KnjGe+imXiejtAp+5m6KRrLF2rEKzzvunxlnJ9AO8POykD60V5W19quWTQ/KM+kEfx
         oq9Y0SPeX4uYwoU4cMS1jBoyMXLY/iTmfRMtodsTLY2PJ+iDSbp8afYr62niI9/rEhlW
         LiyCjHbIh/0VW568ckcqN54g1FXUFIYWfczqfNB9DvbYBDjcGc0NPJONnsrNzRvXY6Gi
         EaQvkzUqIepuSMSHVt3UTEBLcA0OK1R8M/fGahu1ks9h9nreuew9XJ88P/+QIPPswYZT
         d0JoW9XWevMR2FZTLZhZ5h+PZ4F9bNVfUG0gvXrG1FiUQFOxwKT44QYjw4DzAR/ZvsMe
         Fw3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705995601; x=1706600401; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pf17JRo/c4TlMBBbQmd3DVhNBg8vENLl0aYNxIugnyw=;
        b=ZEodkR5hLimAGr4JrXaRoIT6q5AcaiLq7LCF+za7ikg1321m+Jzn78x+2xwvWd2FC/
         HAich3Mx/4ylCXPzy/F3Moi5Ep6xFo+6tzFRd7FCJ1jxVKO/+jPBhq2DvmhCE1cDZp4Z
         oy0Lg1mCJckKW9cMNDTZvShd0mkMOnLzLk/HALVbJ6ohf2Qgh1lSkd5CB+eDOm/RXfJW
         JjpSkETC8DcWvFXHIoCXuUgtLgooKlD34JC2Sibk5Jpcj1vZYAbWNItePwAPzgHQiala
         TVAaYuZFbb19TteC6inmEFPPeL2kf4UaPvePFPWM3uqZ7hgMxp2VWkRxw1I5m6trutbn
         1Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705995601; x=1706600401;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pf17JRo/c4TlMBBbQmd3DVhNBg8vENLl0aYNxIugnyw=;
        b=TI1nQ9vk7XdwuK8BaJdEGui5A3ieVge1WhTZ8QUCTFx5T3HX9WYyW2Qvj46HH0Gglo
         oOPeMA3iOuP9qafYE+3MmlLvDpT3YaojhCWi4ZiYsocI9bj5DZCBYweUP0dLc0HtWwNj
         /5XMPLDWHPV4vFM73ZE9IzQieFC2eylDWpWUH5fvxvcGkRZN09fk8IVu8MslnhlAMOXC
         5uoIP6IPhgKilAmi7HStv+MExHNIqxqsTODj+I0/ne3+nY1YZnpSOJLqC2MML1nMiyEQ
         Gf4Ny9Gxofv8krbLID9gUMDCwY/whA2A48DKAEsEzu85KfEspa//BOQXAUzEQJmP8BrU
         NaRw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yysbd+7HKrERrwltGarASTJ8QMz6S+UtgRYyUtEjmVZQJRZ9TWw
	WCnCd7JvSDBE8J+VqjqM+NyxwXG/HrNXF84GCHxbGCAZUB4hQdB3
X-Google-Smtp-Source: AGHT+IHCgHDjdblfR/dt+x4hM54xwxzRnjpl2FGSKwn7Qgg031jhMzRfHAHFr4XRbDjpMs0qxWTTcQ==
X-Received: by 2002:a25:f509:0:b0:dbf:1edf:37ef with SMTP id a9-20020a25f509000000b00dbf1edf37efmr2794249ybe.54.1705995601105;
        Mon, 22 Jan 2024 23:40:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:726:b0:dc2:1c63:41cd with SMTP id
 l6-20020a056902072600b00dc21c6341cdls65740ybt.0.-pod-prod-00-us; Mon, 22 Jan
 2024 23:40:00 -0800 (PST)
X-Received: by 2002:a25:1982:0:b0:dc3:6b67:9342 with SMTP id 124-20020a251982000000b00dc36b679342mr562651ybz.4.1705995599639;
        Mon, 22 Jan 2024 23:39:59 -0800 (PST)
Date: Mon, 22 Jan 2024 23:39:58 -0800 (PST)
From: Jerry Yang <prodigyyanng@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9d0f81ec-4d3e-47cd-b9dc-8594c70b783cn@googlegroups.com>
In-Reply-To: <94af8176-06ff-4427-8403-6589ab3bbc09n@googlegroups.com>
References: <94af8176-06ff-4427-8403-6589ab3bbc09n@googlegroups.com>
Subject: Re: Start Non-root Linux on IMX8MP
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_33386_510057698.1705995598985"
X-Original-Sender: prodigyyanng@gmail.com
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

------=_Part_33386_510057698.1705995598985
Content-Type: multipart/alternative; 
	boundary="----=_Part_33387_791957420.1705995598985"

------=_Part_33387_791957420.1705995598985
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My cmd is :
jailhouse enable imx8mp.cell
export PATH=3D$PATH:/home/comet/OK8MP_linux_kernel/extra/jailhouse/tools/
jailhouse cell linux imx8mp-linux-demo.cell Image -d imx8mp-evk-inmate.dtb=
=20
-c "clk_ignore_unused console=3Dttymxc3,115200=20
earlycon=3Dec_imx6q,0x30890000,115200  root=3D/dev/mmcblk2p2 rootwait rw"

=E5=9C=A82024=E5=B9=B41=E6=9C=8823=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+=
8 15:34:28<Jerry Yang> =E5=86=99=E9=81=93=EF=BC=9A

> Hello,=20
>
> I'm practicing start the nonroot linux on okmx8mp.
> I booted root Linux from the SD card and then planned to boot non-root=20
> Linux from the EMMC.
> I'm stuck booting non-root Linux and I really don't know what the problem=
=20
> is.
>  [image: =E6=88=AA=E5=B1=8F2024-01-23 13.07.05.png]
> Below are my root dts, cell files, nonroot dts, cell files
>
> OK8MP-C-root.dts:
> // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> /*
> * Copyright 2019 NXP
> */
>
> /dts-v1/;
>
> #include "OK8MP-C.dts"
>
> / {
> interrupt-parent =3D <&gic>;
>
> resmem: reserved-memory {
> #address-cells =3D <2>;
> #size-cells =3D <2>;
> ranges;
> };
> };
>
> &cpu_pd_wait {
> /delete-property/ compatible;
> };
>
> &clk {
> init-on-array =3D <IMX8MP_CLK_USDHC3_ROOT
> IMX8MP_CLK_NAND_USDHC_BUS
> IMX8MP_CLK_HSIO_ROOT
> IMX8MP_CLK_UART4_ROOT
> IMX8MP_CLK_OCOTP_ROOT>;
> };
>
> &{/busfreq} {
> status =3D "disabled";
> };
>
> &{/reserved-memory} {
> jh_reserved: jh@fdc00000 {
> no-map;
> reg =3D <0 0xfdc00000 0x0 0x400000>;
> };
>
> loader_reserved: loader@fdb00000 {
> no-map;
> reg =3D <0 0xfdb00000 0x0 0x00100000>;
> };
>
> ivshmem_reserved: ivshmem@fda00000 {
> no-map;
> reg =3D <0 0xfda00000 0x0 0x00100000>;
> };
>
> ivshmem2_reserved: ivshmem2@fd900000 {
> no-map;
> reg =3D <0 0xfd900000 0x0 0x00100000>;
> };
>
> pci_reserved: pci@fd700000 {
> no-map;
> reg =3D <0 0xfd700000 0x0 0x00200000>;
> };
>
> inmate_reserved: inmate@c0000000 {
> no-map;
> reg =3D <0 0xc0000000 0x0 0x3d700000>;
> };
> };
>
> &iomuxc {
> pinctrl_uart4: uart4grp {
> fsl,pins =3D <
> MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX 0x49
> MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX 0x49
> >;
> };
> };
>
> &usdhc3 { // emmc: mmc2=EF=BC=8C=E5=8D=B3=E4=BB=8Eemmc=E5=90=AF=E5=8A=A8=
=E7=9A=84Linux
> status =3D "disabled";
> };
>
> &uart4 {
> /delete-property/ dmas;=20
> /delete-property/ dma-names;
> pinctrl-names =3D "default";
> pinctrl-0 =3D <&pinctrl_uart4>;
> status =3D "disabled";
> };
>
> &uart2 { // uart1=3Dttymxc0 uart4=3Dttymxc3 default for ttymxc1
> /* uart4 is used by the 2nd OS, so configure pin and clk */
> pinctrl-0 =3D <&pinctrl_uart2>, <&pinctrl_uart4>;
> assigned-clocks =3D <&clk IMX8MP_CLK_UART4>;
> assigned-clock-parents =3D <&clk IMX8MP_CLK_24M>;
> };
>
> &usdhc2 {
> pinctrl-0 =3D <&pinctrl_usdhc3>, <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio=
>;
> pinctrl-1 =3D <&pinctrl_usdhc3>, <&pinctrl_usdhc2_100mhz>,=20
> <&pinctrl_usdhc2_gpio>;
> pinctrl-2 =3D <&pinctrl_usdhc3>, <&pinctrl_usdhc2_200mhz>,=20
> <&pinctrl_usdhc2_gpio>;
> };
>
>
> imx8mp.c
> /*
> * i.MX8MM Target
> *
> * Copyright 2018 NXP
> *
> * Authors:
> * Peng Fan <peng...@nxp.com>
> *
> * This work is licensed under the terms of the GNU GPL, version 2. See
> * the COPYING file in the top-level directory.
> *
> * Reservation via device tree: reg =3D <0x0 0xffaf0000 0x0 0x510000>
> */
>
> #include <jailhouse/types.h>
> #include <jailhouse/cell-config.h>
>
> struct {
> struct jailhouse_system header;
> __u64 cpus[1];
> struct jailhouse_memory mem_regions[15];
> struct jailhouse_irqchip irqchips[3];
> struct jailhouse_pci_device pci_devices[2];
> } __attribute__((packed)) config =3D {
> .header =3D {
> .signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
> .revision =3D JAILHOUSE_CONFIG_REVISION,
> .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> .hypervisor_memory =3D {
> .phys_start =3D 0xfdc00000,
> .size =3D 0x00400000,
> },
> .debug_console =3D {
> .address =3D 0x30890000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_CON_TYPE_IMX |
> JAILHOUSE_CON_ACCESS_MMIO |
> JAILHOUSE_CON_REGDIST_4,
> .type =3D JAILHOUSE_CON_TYPE_IMX,
> },
> .platform_info =3D {
> .pci_mmconfig_base =3D 0xfd700000,
> .pci_mmconfig_end_bus =3D 0,
> .pci_is_virtual =3D 1,
> .pci_domain =3D 0,
>
> .arm =3D {
> .gic_version =3D 3,
> .gicd_base =3D 0x38800000,
> .gicr_base =3D 0x38880000,
> .maintenance_irq =3D 25,
> },
> },
> .root_cell =3D {
> .name =3D "imx8mp",
>
> .num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
> .cpu_set_size =3D sizeof(config.cpus),
> .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
> .num_irqchips =3D ARRAY_SIZE(config.irqchips),
> /* gpt5/4/3/2 not used by root cell */
> .vpci_irq_base =3D 51, /* Not include 32 base */
> },
> },
>
> .cpus =3D {
> 0xf,
> },
>
> .mem_regions =3D {
> /* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
> .phys_start =3D 0xfd900000,
> .virt_start =3D 0xfd900000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ,
> },
> {
> .phys_start =3D 0xfd901000,
> .virt_start =3D 0xfd901000,
> .size =3D 0x9000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
> },
> {
> .phys_start =3D 0xfd90a000,
> .virt_start =3D 0xfd90a000,
> .size =3D 0x2000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
> },
> {
> .phys_start =3D 0xfd90c000,
> .virt_start =3D 0xfd90c000,
> .size =3D 0x2000,
> .flags =3D JAILHOUSE_MEM_READ,
> },
> {
> .phys_start =3D 0xfd90e000,
> .virt_start =3D 0xfd90e000,
> .size =3D 0x2000,
> .flags =3D JAILHOUSE_MEM_READ,
> },
> /* IVSHMEM shared memory regions for 00:01.0 (networking) */
> JAILHOUSE_SHMEM_NET_REGIONS(0xfda00000, 0),
> /* IO */ {
> .phys_start =3D 0x00000000,
> .virt_start =3D 0x00000000,
> .size =3D 0x40000000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* RAM 00*/ {
> .phys_start =3D 0x40000000,
> .virt_start =3D 0x40000000,
> .size =3D 0x80000000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE,
> },
> /* Inmate memory */{
> .phys_start =3D 0xc0000000,
> .virt_start =3D 0xc0000000,
> .size =3D 0x3d700000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE,
> },
> /* Loader */{
> .phys_start =3D 0xfdb00000,
> .virt_start =3D 0xfdb00000,
> .size =3D 0x100000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE,
> },
> /* OP-TEE reserved memory?? */{
> .phys_start =3D 0xfe000000,
> .virt_start =3D 0xfe000000,
> .size =3D 0x2000000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> },
> /* RAM04 */{
> .phys_start =3D 0x100000000,
> .virt_start =3D 0x100000000,
> .size =3D 0xC0000000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> },
> },
>
> .irqchips =3D {
> /* GIC */ {
> .address =3D 0x38800000,
> .pin_base =3D 32,
> .pin_bitmap =3D {
> 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> },
> },
> /* GIC */ {
> .address =3D 0x38800000,
> .pin_base =3D 160,
> .pin_bitmap =3D {
> 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> },
> },
> /* GIC */ {
> .address =3D 0x38800000,
> .pin_base =3D 288,
> .pin_bitmap =3D {
> 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> },
> },
> },
>
> .pci_devices =3D {
> { /* IVSHMEM 0000:00:00.0 (demo) */
> .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> .domain =3D 0,
> .bdf =3D 0 << 3,
> .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> .shmem_regions_start =3D 0,
> .shmem_dev_id =3D 0,
> .shmem_peers =3D 3,
> .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> },
> { /* IVSHMEM 0000:00:01.0 (networking) */
> .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> .domain =3D 0,
> .bdf =3D 1 << 3,
> .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> .shmem_regions_start =3D 5,
> .shmem_dev_id =3D 0,
> .shmem_peers =3D 2,
> .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
> },
> },
> };
>
>
> imx8mp-evk-inmate.dts:
> // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> /*
> * Copyright 2019 NXP
> */
>
> /dts-v1/;
>
> #include <dt-bindings/interrupt-controller/arm-gic.h>
>
> / {
> model =3D "Freescale i.MX8MP EVK";
> compatible =3D "fsl,imx8mp-evk", "fsl,imx8mp";
> interrupt-parent =3D <&gic>;
> #address-cells =3D <2>;
> #size-cells =3D <2>;
>
> aliases {
> serial3 =3D &uart4;
> mmc2 =3D &usdhc3;
> };
>
> cpus {
> #address-cells =3D <1>;
> #size-cells =3D <0>;
>
> A53_2: cpu@2 {
> device_type =3D "cpu";
> compatible =3D "arm,cortex-a53";
> reg =3D <0x2>;
> clock-latency =3D <61036>; /* two CLK32 periods */
> next-level-cache =3D <&A53_L2>;
> enable-method =3D "psci";
> #cooling-cells =3D <2>;
> };
>
> A53_3: cpu@3 {
> device_type =3D "cpu";
> compatible =3D "arm,cortex-a53";
> reg =3D <0x3>;
> clock-latency =3D <61036>; /* two CLK32 periods */
> next-level-cache =3D <&A53_L2>;
> enable-method =3D "psci";
> #cooling-cells =3D <2>;
> };
>
> A53_L2: l2-cache0 {
> compatible =3D "cache";
> };
> };
>
> psci {
> compatible =3D "arm,psci-1.0";
> method =3D "smc";
> };
>
> gic: interrupt-controller@38800000 {
> compatible =3D "arm,gic-v3";
> reg =3D <0x0 0x38800000 0 0x10000>, /* GIC Dist */
> <0x0 0x38880000 0 0xC0000>; /* GICR (RD_base + SGI_base) */
> #interrupt-cells =3D <3>;
> interrupt-controller;
> interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> interrupt-parent =3D <&gic>;
> };
>
> timer {
> compatible =3D "arm,armv8-timer";
> interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>=
, /*=20
> Physical Secure */
> <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical=
=20
> Non-Secure */
> <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
> <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>; /* Hypervisor=
=20
> */
> clock-frequency =3D <8333333>;
> };
>
> clk_dummy: clock@7 {
> compatible =3D "fixed-clock";
> #clock-cells =3D <0>;
> clock-frequency =3D <0>;
> clock-output-names =3D "clk_dummy";
> };
>
> /* The clocks are configured by 1st OS */
> clk_400m: clock@8 {
> compatible =3D "fixed-clock";
> #clock-cells =3D <0>;
> clock-frequency =3D <200000000>;
> clock-output-names =3D "200m";
> };
>
> clk_266m: clock@9 {
> compatible =3D "fixed-clock";
> #clock-cells =3D <0>;
> clock-frequency =3D <266000000>;
> clock-output-names =3D "266m";
> };
>
> osc_24m: clock@1 {
> compatible =3D "fixed-clock";
> #clock-cells =3D <0>;
> clock-frequency =3D <24000000>;
> clock-output-names =3D "osc_24m";
> };
>
> pci@fd700000 {
> compatible =3D "pci-host-ecam-generic";
> device_type =3D "pci";
> bus-range =3D <0 0>;
> #address-cells =3D <3>;
> #size-cells =3D <2>;
> #interrupt-cells =3D <1>;
> interrupt-map-mask =3D <0 0 0 7>;
> interrupt-map =3D <0 0 0 1 &gic GIC_SPI 154 IRQ_TYPE_EDGE_RISING>,
> <0 0 0 2 &gic GIC_SPI 155 IRQ_TYPE_EDGE_RISING>,
> <0 0 0 3 &gic GIC_SPI 156 IRQ_TYPE_EDGE_RISING>,
> <0 0 0 4 &gic GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
> reg =3D <0x0 0xfd700000 0x0 0x100000>;
> ranges =3D <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
> };
>
> soc@0 {
> compatible =3D "simple-bus";
> #address-cells =3D <1>;
> #size-cells =3D <1>;
> ranges =3D <0x0 0x0 0x0 0x3e000000>;
>
> aips3: bus@30800000 {
> compatible =3D "simple-bus";
> reg =3D <0x30800000 0x400000>;
> #address-cells =3D <1>;
> #size-cells =3D <1>;
> ranges;
>
> uart4: serial@30a60000 {
> compatible =3D "fsl,imx8mp-uart", "fsl,imx6q-uart";
> reg =3D <0x30a60000 0x10000>;
> interrupts =3D <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> status =3D "disabled";
> };
>
> usdhc3: mmc@30b60000 {
> compatible =3D "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
> reg =3D <0x30b60000 0x10000>;
> interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> fsl,tuning-start-tap =3D <20>;
> fsl,tuning-step=3D <2>;
> status =3D "disabled";
> };
> };
> };
> };
>
> &uart4 {
> clocks =3D <&osc_24m>,
> <&osc_24m>;
> clock-names =3D "ipg", "per";
> status =3D "okay";
> };
>
> &usdhc3 {
> clocks =3D <&clk_dummy>,
> <&clk_266m>,
> <&clk_400m>;
> clock-names =3D "ipg", "ahb", "per";
> bus-width =3D <8>;
> non-removable;
> status =3D "okay";
> };
>
>
> imx8mp-linux-demo.c:
> /*
> * iMX8MM target - linux-demo
> *
> * Copyright 2019 NXP
> *
> * Authors:
> * Peng Fan <peng...@nxp.com>
> *
> * This work is licensed under the terms of the GNU GPL, version 2. See
> * the COPYING file in the top-level directory.
> */
>
> /*
> * Boot 2nd Linux cmdline:
> * export PATH=3D$PATH:/home/comet/OK8MP_linux_kernel/extra/jailhouse/tool=
s/
> * jailhouse cell linux imx8mp-linux-demo.cell Image -d=20
> imx8mp-evk-inmate.dtb -c "clk_ignore_unused console=3Dttymxc3,115200=20
> earlycon=3Dec_imx6q,0x30890000,115200 root=3D/dev/mmcblk2p2 rootwait rw"
> */
> #include <jailhouse/types.h>
> #include <jailhouse/cell-config.h>
>
> struct {
> struct jailhouse_cell_desc cell;
> __u64 cpus[1];
> struct jailhouse_memory mem_regions[15];
> struct jailhouse_irqchip irqchips[2];
> struct jailhouse_pci_device pci_devices[2];
> } __attribute__((packed)) config =3D {
> .cell =3D {
> .signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
> .revision =3D JAILHOUSE_CONFIG_REVISION,
> .name =3D "linux-inmate-demo",
> .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,
>
> .cpu_set_size =3D sizeof(config.cpus),
> .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
> .num_irqchips =3D ARRAY_SIZE(config.irqchips),
> .num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
> .vpci_irq_base =3D 154, /* Not include 32 base */
> },
>
> .cpus =3D {
> 0xc,
> },
>
> .mem_regions =3D {
> /* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
> .phys_start =3D 0xfd900000,
> .virt_start =3D 0xfd900000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> },
> {
> .phys_start =3D 0xfd901000,
> .virt_start =3D 0xfd901000,
> .size =3D 0x9000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_ROOTSHARED,
> },
> {
> .phys_start =3D 0xfd90a000,
> .virt_start =3D 0xfd90a000,
> .size =3D 0x2000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> },
> {
> .phys_start =3D 0xfd90c000,
> .virt_start =3D 0xfd90c000,
> .size =3D 0x2000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> },
> {
> .phys_start =3D 0xfd90e000,
> .virt_start =3D 0xfd90e000,
> .size =3D 0x2000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_ROOTSHARED,
> },
> /* IVSHMEM shared memory regions for 00:01.0 (networking) */
> JAILHOUSE_SHMEM_NET_REGIONS(0xfda00000, 1),
> /* UART2 earlycon */ {
> .phys_start =3D 0x30890000,
> .virt_start =3D 0x30890000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> },
> /* UART4 */ {
> .phys_start =3D 0x30a60000,
> .virt_start =3D 0x30a60000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* SHDC3 */ {
> .phys_start =3D 0x30b60000,
> .virt_start =3D 0x30b60000,
> .size =3D 0x10000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* RAM: Top at 4GB Space */ {
> .phys_start =3D 0xfdb00000,
> .virt_start =3D 0,
> .size =3D 0x10000, /* 64KB */
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> },
> /* RAM */ {
> /*
> * We could not use 0x80000000 which conflicts with
> * COMM_REGION_BASE
> */
> .phys_start =3D 0xc0000000,
> .virt_start =3D 0xc0000000,
> .size =3D 0x3d700000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> JAILHOUSE_MEM_LOADABLE,
> },
> /* communication region */ {
> .virt_start =3D 0x80000000,
> .size =3D 0x00001000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_COMM_REGION,
> },
> },
>
> .irqchips =3D {
> /* uart2/sdhc1 */ {
> .address =3D 0x38800000,
> .pin_base =3D 32,
> .pin_bitmap =3D {
> (1 << (24 + 32 - 32)) | (1 << (29 + 32 - 32))
> },
> },
> /* IVSHMEM */ {
> .address =3D 0x38800000,
> .pin_base =3D 160,
> .pin_bitmap =3D {
> 0xf << (154 + 32 - 160) /* SPI 154-157 */
> },
> },
> },
>
> .pci_devices =3D {
> { /* IVSHMEM 00:00.0 (demo) */
> .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> .domain =3D 0,
> .bdf =3D 0 << 3,
> .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> .shmem_regions_start =3D 0,
> .shmem_dev_id =3D 2,
> .shmem_peers =3D 3,
> .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> },
> { /* IVSHMEM 00:01.0 (networking) */
> .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> .domain =3D 0,
> .bdf =3D 1 << 3,
> .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> .shmem_regions_start =3D 5,
> .shmem_dev_id =3D 1,
> .shmem_peers =3D 2,
> .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
> },
> },
> };
>
>
> I really need help.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9d0f81ec-4d3e-47cd-b9dc-8594c70b783cn%40googlegroups.com.

------=_Part_33387_791957420.1705995598985
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My cmd is :<br />jailhouse enable imx8mp.cell<br />export PATH=3D$PATH:/hom=
e/comet/OK8MP_linux_kernel/extra/jailhouse/tools/<br />jailhouse cell linux=
 imx8mp-linux-demo.cell Image -d imx8mp-evk-inmate.dtb -c "clk_ignore_unuse=
d console=3Dttymxc3,115200 earlycon=3Dec_imx6q,0x30890000,115200 =C2=A0root=
=3D/dev/mmcblk2p2 rootwait rw"<br /><br /><div class=3D"gmail_quote"><div d=
ir=3D"auto" class=3D"gmail_attr">=E5=9C=A82024=E5=B9=B41=E6=9C=8823=E6=97=
=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+8 15:34:28&lt;Jerry Yang> =E5=86=99=E9=
=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin=
: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex=
;">Hello,=C2=A0<div><br></div><div>I&#39;m practicing start the nonroot lin=
ux on okmx8mp.</div><div>I booted root Linux from the SD card and then plan=
ned to boot non-root Linux from the EMMC.<br></div><div>I&#39;m stuck booti=
ng non-root Linux and I really don&#39;t know what the problem is.<br></div=
><div>=C2=A0<img alt=3D"=E6=88=AA=E5=B1=8F2024-01-23 13.07.05.png" width=3D=
"534px" height=3D"349px" src=3D"https://groups.google.com/group/jailhouse-d=
ev/attach/1a5c005bfa30a/%E6%88%AA%E5%B1%8F2024-01-23%2013.07.05.png?part=3D=
0.1&amp;view=3D1"></div><div>Below are my root dts, cell files, nonroot dts=
, cell files<br><br>OK8MP-C-root.dts:<br><div style=3D"color:rgb(212,212,21=
2);background-color:rgb(30,30,30);font-family:&quot;JetBrains Mono&quot;,Me=
nlo,Monaco,&quot;Courier New&quot;,monospace,Menlo,Monaco,&quot;Courier New=
&quot;,monospace;font-size:12px;line-height:18px;white-space:pre"><div><spa=
n style=3D"color:rgb(106,153,85)">// SPDX-License-Identifier: (GPL-2.0+ OR =
MIT)</span></div><div><span style=3D"color:rgb(106,153,85)">/*</span></div>=
<div><span style=3D"color:rgb(106,153,85)"> * Copyright 2019 NXP</span></di=
v><div><span style=3D"color:rgb(106,153,85)"> */</span></div><br><div>/dts-=
v1/;</div><br><div><span style=3D"color:rgb(86,156,214)">#include</span><sp=
an style=3D"color:rgb(206,145,120)"> &quot;OK8MP-C.dts&quot;</span></div><b=
r><div>/ {</div><div>    interrupt-parent =3D &lt;&amp;gic&gt;;</div><br><d=
iv>    resmem: reserved-memory {</div><div>        #address-cells =3D &lt;<=
span style=3D"color:rgb(181,206,168)">2</span>&gt;;</div><div>        #size=
-cells =3D &lt;<span style=3D"color:rgb(181,206,168)">2</span>&gt;;</div><d=
iv>        ranges;</div><div>    };</div><div>};</div><br><div>&amp;cpu_pd_=
wait {</div><div>    /delete-property/ compatible;</div><div>};</div><br><d=
iv>&amp;clk {</div><div>    init-on-array =3D &lt;<span style=3D"color:rgb(=
181,206,168)">IMX8MP_CLK_USDHC3_ROOT</span></div><div>             <span st=
yle=3D"color:rgb(181,206,168)">IMX8MP_CLK_NAND_USDHC_BUS</span></div><div> =
            <span style=3D"color:rgb(181,206,168)">IMX8MP_CLK_HSIO_ROOT</sp=
an></div><div>             <span style=3D"color:rgb(181,206,168)">IMX8MP_CL=
K_UART4_ROOT</span></div><div>             <span style=3D"color:rgb(181,206=
,168)">IMX8MP_CLK_OCOTP_ROOT</span>&gt;;</div><div>};</div><br><div>&amp;{/=
busfreq} {</div><div>    status =3D <span style=3D"color:rgb(206,145,120)">=
&quot;disabled&quot;</span>;</div><div>};</div><br><div>&amp;{/reserved-mem=
ory} {</div><div>    jh_reserved: jh@fdc00000 {</div><div>        no-map;</=
div><div>        reg =3D &lt;<span style=3D"color:rgb(181,206,168)">0</span=
> <span style=3D"color:rgb(181,206,168)">0xfdc00000</span> <span style=3D"c=
olor:rgb(181,206,168)">0x0</span> <span style=3D"color:rgb(181,206,168)">0x=
400000</span>&gt;;</div><div>    };</div><br><div>    loader_reserved: load=
er@fdb00000 {</div><div>        no-map;</div><div>        reg =3D &lt;<span=
 style=3D"color:rgb(181,206,168)">0</span> <span style=3D"color:rgb(181,206=
,168)">0xfdb00000</span> <span style=3D"color:rgb(181,206,168)">0x0</span> =
<span style=3D"color:rgb(181,206,168)">0x00100000</span>&gt;;</div><div>   =
 };</div><br><div>    ivshmem_reserved: ivshmem@fda00000 {</div><div>      =
  no-map;</div><div>        reg =3D &lt;<span style=3D"color:rgb(181,206,16=
8)">0</span> <span style=3D"color:rgb(181,206,168)">0xfda00000</span> <span=
 style=3D"color:rgb(181,206,168)">0x0</span> <span style=3D"color:rgb(181,2=
06,168)">0x00100000</span>&gt;;</div><div>    };</div><br><div>    ivshmem2=
_reserved: ivshmem2@fd900000 {</div><div>        no-map;</div><div>        =
reg =3D &lt;<span style=3D"color:rgb(181,206,168)">0</span> <span style=3D"=
color:rgb(181,206,168)">0xfd900000</span> <span style=3D"color:rgb(181,206,=
168)">0x0</span> <span style=3D"color:rgb(181,206,168)">0x00100000</span>&g=
t;;</div><div>    };</div><br><div>    pci_reserved: pci@fd700000 {</div><d=
iv>        no-map;</div><div>        reg =3D &lt;<span style=3D"color:rgb(1=
81,206,168)">0</span> <span style=3D"color:rgb(181,206,168)">0xfd700000</sp=
an> <span style=3D"color:rgb(181,206,168)">0x0</span> <span style=3D"color:=
rgb(181,206,168)">0x00200000</span>&gt;;</div><div>    };</div><br><div>   =
 inmate_reserved: inmate@c0000000 {</div><div>        no-map;</div><div>   =
     reg =3D &lt;<span style=3D"color:rgb(181,206,168)">0</span> <span styl=
e=3D"color:rgb(181,206,168)">0xc0000000</span> <span style=3D"color:rgb(181=
,206,168)">0x0</span> <span style=3D"color:rgb(181,206,168)">0x3d700000</sp=
an>&gt;;</div><div>    };</div><div>};</div><br><div>&amp;iomuxc {</div><di=
v>    pinctrl_uart4: uart4grp {</div><div>        fsl,pins =3D &lt;</div><d=
iv>            <span style=3D"color:rgb(181,206,168)">MX8MP_IOMUXC_UART4_RX=
D__UART4_DCE_RX</span>    <span style=3D"color:rgb(181,206,168)">0x49</span=
></div><div>            <span style=3D"color:rgb(181,206,168)">MX8MP_IOMUXC=
_UART4_TXD__UART4_DCE_TX</span>    <span style=3D"color:rgb(181,206,168)">0=
x49</span></div><div>        &gt;;</div><div>    };</div><div>};</div><br><=
div>&amp;usdhc3 { <span style=3D"color:rgb(106,153,85)">// emmc: mmc2=EF=BC=
=8C=E5=8D=B3=E4=BB=8Eemmc=E5=90=AF=E5=8A=A8=E7=9A=84Linux</span></div><div>=
    status =3D <span style=3D"color:rgb(206,145,120)">&quot;disabled&quot;<=
/span>;</div><div>};</div><br><div>&amp;uart4 {</div><div>    /delete-prope=
rty/ dmas; </div><div>    /delete-property/ dma-names;</div><div>    pinctr=
l-names =3D <span style=3D"color:rgb(206,145,120)">&quot;default&quot;</spa=
n>;</div><div>    pinctrl-0 =3D &lt;&amp;pinctrl_uart4&gt;;</div><div>    s=
tatus =3D <span style=3D"color:rgb(206,145,120)">&quot;disabled&quot;</span=
>;</div><div>};</div><br><div>&amp;uart2 { <span style=3D"color:rgb(106,153=
,85)">// uart1=3Dttymxc0 uart4=3Dttymxc3 default for ttymxc1</span></div><d=
iv>    <span style=3D"color:rgb(106,153,85)">/* uart4 is used by the 2nd OS=
, so configure pin and clk */</span></div><div>    pinctrl-0 =3D &lt;&amp;p=
inctrl_uart2&gt;, &lt;&amp;pinctrl_uart4&gt;;</div><div>    assigned-clocks=
 =3D &lt;&amp;clk <span style=3D"color:rgb(181,206,168)">IMX8MP_CLK_UART4</=
span>&gt;;</div><div>    assigned-clock-parents =3D &lt;&amp;clk <span styl=
e=3D"color:rgb(181,206,168)">IMX8MP_CLK_24M</span>&gt;;</div><div>};</div><=
br><div>&amp;usdhc2 {</div><div>    pinctrl-0 =3D &lt;&amp;pinctrl_usdhc3&g=
t;, &lt;&amp;pinctrl_usdhc2&gt;, &lt;&amp;pinctrl_usdhc2_gpio&gt;;</div><di=
v>    pinctrl-1 =3D &lt;&amp;pinctrl_usdhc3&gt;, &lt;&amp;pinctrl_usdhc2_10=
0mhz&gt;, &lt;&amp;pinctrl_usdhc2_gpio&gt;;</div><div>    pinctrl-2 =3D &lt=
;&amp;pinctrl_usdhc3&gt;, &lt;&amp;pinctrl_usdhc2_200mhz&gt;, &lt;&amp;pinc=
trl_usdhc2_gpio&gt;;</div><div>};</div><br></div></div><div><br></div><div>=
imx8mp.c<br><div style=3D"color:rgb(212,212,212);background-color:rgb(30,30=
,30);font-family:&quot;JetBrains Mono&quot;,Menlo,Monaco,&quot;Courier New&=
quot;,monospace,Menlo,Monaco,&quot;Courier New&quot;,monospace;font-size:12=
px;line-height:18px;white-space:pre"><div><span style=3D"color:rgb(106,153,=
85)">/*</span></div><div><span style=3D"color:rgb(106,153,85)"> * i.MX8MM T=
arget</span></div><div><span style=3D"color:rgb(106,153,85)"> *</span></div=
><div><span style=3D"color:rgb(106,153,85)"> * Copyright 2018 NXP</span></d=
iv><div><span style=3D"color:rgb(106,153,85)"> *</span></div><div><span sty=
le=3D"color:rgb(106,153,85)"> * Authors:</span></div><div><span style=3D"co=
lor:rgb(106,153,85)"> *  Peng Fan &lt;<a href data-email-masked rel=3D"nofo=
llow">peng...@nxp.com</a>&gt;</span></div><div><span style=3D"color:rgb(106=
,153,85)"> *</span></div><div><span style=3D"color:rgb(106,153,85)"> * This=
 work is licensed under the terms of the GNU GPL, version 2.  See</span></d=
iv><div><span style=3D"color:rgb(106,153,85)"> * the COPYING file in the to=
p-level directory.</span></div><div><span style=3D"color:rgb(106,153,85)"> =
*</span></div><div><span style=3D"color:rgb(106,153,85)"> * Reservation via=
 device tree: reg =3D &lt;0x0 0xffaf0000 0x0 0x510000&gt;</span></div><div>=
<span style=3D"color:rgb(106,153,85)"> */</span></div><br><div><span style=
=3D"color:rgb(86,156,214)">#include </span><span style=3D"color:rgb(206,145=
,120)">&lt;jailhouse/types.h&gt;</span></div><div><span style=3D"color:rgb(=
86,156,214)">#include </span><span style=3D"color:rgb(206,145,120)">&lt;jai=
lhouse/cell-config.h&gt;</span></div><br><div><span style=3D"color:rgb(86,1=
56,214)">struct</span> {</div><div>    <span style=3D"color:rgb(86,156,214)=
">struct</span> jailhouse_system header;</div><div>    __u64 cpus[<span sty=
le=3D"color:rgb(181,206,168)">1</span>];</div><div>    <span style=3D"color=
:rgb(86,156,214)">struct</span> jailhouse_memory mem_regions[<span style=3D=
"color:rgb(181,206,168)">15</span>];</div><div>    <span style=3D"color:rgb=
(86,156,214)">struct</span> jailhouse_irqchip irqchips[<span style=3D"color=
:rgb(181,206,168)">3</span>];</div><div>    <span style=3D"color:rgb(86,156=
,214)">struct</span> jailhouse_pci_device pci_devices[<span style=3D"color:=
rgb(181,206,168)">2</span>];</div><div>} __attribute__((packed)) config =3D=
 {</div><div>    .header =3D {</div><div>        .signature =3D JAILHOUSE_S=
YSTEM_SIGNATURE,</div><div>        .revision =3D JAILHOUSE_CONFIG_REVISION,=
</div><div>        .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,</div><di=
v>        .hypervisor_memory =3D {</div><div>            .phys_start =3D <s=
pan style=3D"color:rgb(181,206,168)">0xfdc00000</span>,</div><div>         =
   .size =3D       <span style=3D"color:rgb(181,206,168)">0x00400000</span>=
,</div><div>        },</div><div>        .debug_console =3D {</div><div>   =
         .address =3D <span style=3D"color:rgb(181,206,168)">0x30890000</sp=
an>,</div><div>            .size =3D <span style=3D"color:rgb(181,206,168)"=
>0x1000</span>,</div><div>            .flags =3D JAILHOUSE_CON_TYPE_IMX |</=
div><div>                 JAILHOUSE_CON_ACCESS_MMIO |</div><div>           =
      JAILHOUSE_CON_REGDIST_4,</div><div>            .type =3D JAILHOUSE_CO=
N_TYPE_IMX,</div><div>        },</div><div>        .platform_info =3D {</di=
v><div>            .pci_mmconfig_base =3D <span style=3D"color:rgb(181,206,=
168)">0xfd700000</span>,</div><div>            .pci_mmconfig_end_bus =3D <s=
pan style=3D"color:rgb(181,206,168)">0</span>,</div><div>            .pci_i=
s_virtual =3D <span style=3D"color:rgb(181,206,168)">1</span>,</div><div>  =
          .pci_domain =3D <span style=3D"color:rgb(181,206,168)">0</span>,<=
/div><br><div>            .arm =3D {</div><div>                .gic_version=
 =3D <span style=3D"color:rgb(181,206,168)">3</span>,</div><div>           =
     .gicd_base =3D <span style=3D"color:rgb(181,206,168)">0x38800000</span=
>,</div><div>                .gicr_base =3D <span style=3D"color:rgb(181,20=
6,168)">0x38880000</span>,</div><div>                .maintenance_irq =3D <=
span style=3D"color:rgb(181,206,168)">25</span>,</div><div>            },</=
div><div>        },</div><div>        .root_cell =3D {</div><div>          =
  .name =3D <span style=3D"color:rgb(206,145,120)">&quot;imx8mp&quot;</span=
>,</div><br><div>            .num_pci_devices =3D ARRAY_SIZE(config.pci_dev=
ices),</div><div>            .cpu_set_size =3D <span style=3D"color:rgb(86,=
156,214)">sizeof</span>(config.cpus),</div><div>            .num_memory_reg=
ions =3D ARRAY_SIZE(config.mem_regions),</div><div>            .num_irqchip=
s =3D ARRAY_SIZE(config.irqchips),</div><div><span style=3D"color:rgb(106,1=
53,85)">            /* gpt5/4/3/2 not used by root cell */</span></div><div=
>            .vpci_irq_base =3D <span style=3D"color:rgb(181,206,168)">51</=
span>,<span style=3D"color:rgb(106,153,85)"> /* Not include 32 base */</spa=
n></div><div>        },</div><div>    },</div><br><div>    .cpus =3D {</div=
><div>        <span style=3D"color:rgb(181,206,168)">0xf</span>,</div><div>=
    },</div><br><div>    .mem_regions =3D {</div><div><span style=3D"color:=
rgb(106,153,85)">        /* IVHSMEM shared memory region for 00:00.0 (demo =
)*/</span> {</div><div>            .phys_start =3D <span style=3D"color:rgb=
(181,206,168)">0xfd900000</span>,</div><div>            .virt_start =3D <sp=
an style=3D"color:rgb(181,206,168)">0xfd900000</span>,</div><div>          =
  .size =3D <span style=3D"color:rgb(181,206,168)">0x1000</span>,</div><div=
>            .flags =3D JAILHOUSE_MEM_READ,</div><div>        },</div><div>=
        {</div><div>            .phys_start =3D <span style=3D"color:rgb(18=
1,206,168)">0xfd901000</span>,</div><div>            .virt_start =3D <span =
style=3D"color:rgb(181,206,168)">0xfd901000</span>,</div><div>            .=
size =3D <span style=3D"color:rgb(181,206,168)">0x9000</span>,</div><div>  =
          .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,</div><div> =
       },</div><div>        {</div><div>            .phys_start =3D <span s=
tyle=3D"color:rgb(181,206,168)">0xfd90a000</span>,</div><div>            .v=
irt_start =3D <span style=3D"color:rgb(181,206,168)">0xfd90a000</span>,</di=
v><div>            .size =3D <span style=3D"color:rgb(181,206,168)">0x2000<=
/span>,</div><div>            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM=
_WRITE ,</div><div>        },</div><div>        {</div><div>            .ph=
ys_start =3D <span style=3D"color:rgb(181,206,168)">0xfd90c000</span>,</div=
><div>            .virt_start =3D <span style=3D"color:rgb(181,206,168)">0x=
fd90c000</span>,</div><div>            .size =3D <span style=3D"color:rgb(1=
81,206,168)">0x2000</span>,</div><div>            .flags =3D JAILHOUSE_MEM_=
READ,</div><div>        },</div><div>        {</div><div>            .phys_=
start =3D <span style=3D"color:rgb(181,206,168)">0xfd90e000</span>,</div><d=
iv>            .virt_start =3D <span style=3D"color:rgb(181,206,168)">0xfd9=
0e000</span>,</div><div>            .size =3D <span style=3D"color:rgb(181,=
206,168)">0x2000</span>,</div><div>            .flags =3D JAILHOUSE_MEM_REA=
D,</div><div>        },</div><div><span style=3D"color:rgb(106,153,85)">   =
     /* IVSHMEM shared memory regions for 00:01.0 (networking) */</span></d=
iv><div>        JAILHOUSE_SHMEM_NET_REGIONS(<span style=3D"color:rgb(181,20=
6,168)">0xfda00000</span>, <span style=3D"color:rgb(181,206,168)">0</span>)=
,</div><div><span style=3D"color:rgb(106,153,85)">        /* IO */</span> {=
</div><div>            .phys_start =3D <span style=3D"color:rgb(181,206,168=
)">0x00000000</span>,</div><div>            .virt_start =3D <span style=3D"=
color:rgb(181,206,168)">0x00000000</span>,</div><div>            .size =3D =
      <span style=3D"color:rgb(181,206,168)">0x40000000</span>,</div><div> =
           .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |</div><div>=
                JAILHOUSE_MEM_IO,</div><div>        },</div><div><span styl=
e=3D"color:rgb(106,153,85)">        /* RAM 00*/</span> {</div><div>        =
    .phys_start =3D <span style=3D"color:rgb(181,206,168)">0x40000000</span=
>,</div><div>            .virt_start =3D <span style=3D"color:rgb(181,206,1=
68)">0x40000000</span>,</div><div>            .size =3D <span style=3D"colo=
r:rgb(181,206,168)">0x80000000</span>,</div><div>            .flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |</div><div>                JAILHOUSE=
_MEM_EXECUTE,</div><div>        },</div><div><span style=3D"color:rgb(106,1=
53,85)">        /* Inmate memory */</span>{</div><div>            .phys_sta=
rt =3D <span style=3D"color:rgb(181,206,168)">0xc0000000</span>,</div><div>=
            .virt_start =3D <span style=3D"color:rgb(181,206,168)">0xc00000=
00</span>,</div><div>            .size =3D <span style=3D"color:rgb(181,206=
,168)">0x3d700000</span>,</div><div>            .flags =3D JAILHOUSE_MEM_RE=
AD | JAILHOUSE_MEM_WRITE |</div><div>                JAILHOUSE_MEM_EXECUTE,=
</div><div>        },</div><div><span style=3D"color:rgb(106,153,85)">     =
   /* Loader */</span>{</div><div>            .phys_start =3D <span style=
=3D"color:rgb(181,206,168)">0xfdb00000</span>,</div><div>            .virt_=
start =3D <span style=3D"color:rgb(181,206,168)">0xfdb00000</span>,</div><d=
iv>            .size =3D <span style=3D"color:rgb(181,206,168)">0x100000</s=
pan>,</div><div>            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_W=
RITE |</div><div>                JAILHOUSE_MEM_EXECUTE,</div><div>        }=
,</div><div><span style=3D"color:rgb(106,153,85)">        /* OP-TEE reserve=
d memory?? */</span>{</div><div>            .phys_start =3D <span style=3D"=
color:rgb(181,206,168)">0xfe000000</span>,</div><div>            .virt_star=
t =3D <span style=3D"color:rgb(181,206,168)">0xfe000000</span>,</div><div> =
           .size =3D <span style=3D"color:rgb(181,206,168)">0x2000000</span=
>,</div><div>            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRIT=
E,</div><div>        },</div><div><span style=3D"color:rgb(106,153,85)">   =
     /* RAM04 */</span>{</div><div>            .phys_start =3D <span style=
=3D"color:rgb(181,206,168)">0x100000000</span>,</div><div>            .virt=
_start =3D <span style=3D"color:rgb(181,206,168)">0x100000000</span>,</div>=
<div>            .size =3D <span style=3D"color:rgb(181,206,168)">0xC000000=
0</span>,</div><div>            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_M=
EM_WRITE,</div><div>        },</div><div>    },</div><br><div>    .irqchips=
 =3D {</div><div><span style=3D"color:rgb(106,153,85)">        /* GIC */</s=
pan> {</div><div>            .address =3D <span style=3D"color:rgb(181,206,=
168)">0x38800000</span>,</div><div>            .pin_base =3D <span style=3D=
"color:rgb(181,206,168)">32</span>,</div><div>            .pin_bitmap =3D {=
</div><div>                <span style=3D"color:rgb(181,206,168)">0xfffffff=
f</span>, <span style=3D"color:rgb(181,206,168)">0xffffffff</span>, <span s=
tyle=3D"color:rgb(181,206,168)">0xffffffff</span>, <span style=3D"color:rgb=
(181,206,168)">0xffffffff</span>,</div><div>            },</div><div>      =
  },</div><div><span style=3D"color:rgb(106,153,85)">        /* GIC */</spa=
n> {</div><div>            .address =3D <span style=3D"color:rgb(181,206,16=
8)">0x38800000</span>,</div><div>            .pin_base =3D <span style=3D"c=
olor:rgb(181,206,168)">160</span>,</div><div>            .pin_bitmap =3D {<=
/div><div>                <span style=3D"color:rgb(181,206,168)">0xffffffff=
</span>, <span style=3D"color:rgb(181,206,168)">0xffffffff</span>, <span st=
yle=3D"color:rgb(181,206,168)">0xffffffff</span>, <span style=3D"color:rgb(=
181,206,168)">0xffffffff</span>,</div><div>            },</div><div>       =
 },</div><div><span style=3D"color:rgb(106,153,85)">        /* GIC */</span=
> {</div><div>            .address =3D <span style=3D"color:rgb(181,206,168=
)">0x38800000</span>,</div><div>            .pin_base =3D <span style=3D"co=
lor:rgb(181,206,168)">288</span>,</div><div>            .pin_bitmap =3D {</=
div><div>                <span style=3D"color:rgb(181,206,168)">0xffffffff<=
/span>, <span style=3D"color:rgb(181,206,168)">0xffffffff</span>, <span sty=
le=3D"color:rgb(181,206,168)">0xffffffff</span>, <span style=3D"color:rgb(1=
81,206,168)">0xffffffff</span>,</div><div>            },</div><div>        =
},</div><div>    },</div><br><div>    .pci_devices =3D {</div><div>        =
{<span style=3D"color:rgb(106,153,85)"> /* IVSHMEM 0000:00:00.0 (demo) */</=
span></div><div>            .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,</div><div=
>            .domain =3D <span style=3D"color:rgb(181,206,168)">0</span>,</=
div><div>            .bdf =3D <span style=3D"color:rgb(181,206,168)">0</spa=
n> &lt;&lt; <span style=3D"color:rgb(181,206,168)">3</span>,</div><div>    =
        .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,</div><div>          =
  .shmem_regions_start =3D <span style=3D"color:rgb(181,206,168)">0</span>,=
</div><div>            .shmem_dev_id =3D <span style=3D"color:rgb(181,206,1=
68)">0</span>,</div><div>            .shmem_peers =3D <span style=3D"color:=
rgb(181,206,168)">3</span>,</div><div>            .shmem_protocol =3D JAILH=
OUSE_SHMEM_PROTO_UNDEFINED,</div><div>        },</div><div>        {<span s=
tyle=3D"color:rgb(106,153,85)"> /* IVSHMEM 0000:00:01.0 (networking) */</sp=
an></div><div>            .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,</div><div> =
           .domain =3D <span style=3D"color:rgb(181,206,168)">0</span>,</di=
v><div>            .bdf =3D <span style=3D"color:rgb(181,206,168)">1</span>=
 &lt;&lt; <span style=3D"color:rgb(181,206,168)">3</span>,</div><div>      =
      .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,</div><div>            =
.shmem_regions_start =3D <span style=3D"color:rgb(181,206,168)">5</span>,</=
div><div>            .shmem_dev_id =3D <span style=3D"color:rgb(181,206,168=
)">0</span>,</div><div>            .shmem_peers =3D <span style=3D"color:rg=
b(181,206,168)">2</span>,</div><div>            .shmem_protocol =3D JAILHOU=
SE_SHMEM_PROTO_VETH,</div><div>        },</div><div>    },</div><div>};</di=
v><br></div></div><div><br></div><div>imx8mp-evk-inmate.dts:</div><div><div=
 style=3D"color:rgb(212,212,212);background-color:rgb(30,30,30);font-family=
:&quot;JetBrains Mono&quot;,Menlo,Monaco,&quot;Courier New&quot;,monospace,=
Menlo,Monaco,&quot;Courier New&quot;,monospace;font-size:12px;line-height:1=
8px;white-space:pre"><div><span style=3D"color:rgb(106,153,85)">// SPDX-Lic=
ense-Identifier: (GPL-2.0+ OR MIT)</span></div><div><span style=3D"color:rg=
b(106,153,85)">/*</span></div><div><span style=3D"color:rgb(106,153,85)"> *=
 Copyright 2019 NXP</span></div><div><span style=3D"color:rgb(106,153,85)">=
 */</span></div><br><div>/dts-v1/;</div><br><div><span style=3D"color:rgb(8=
6,156,214)">#include</span><span style=3D"color:rgb(206,145,120)"> &lt;dt-b=
indings/interrupt-controller/arm-gic.h&gt;</span></div><br><div>/ {</div><d=
iv>    model =3D <span style=3D"color:rgb(206,145,120)">&quot;Freescale i.M=
X8MP EVK&quot;</span>;</div><div>    compatible =3D <span style=3D"color:rg=
b(206,145,120)">&quot;fsl,imx8mp-evk&quot;</span>, <span style=3D"color:rgb=
(206,145,120)">&quot;fsl,imx8mp&quot;</span>;</div><div>    interrupt-paren=
t =3D &lt;&amp;gic&gt;;</div><div>    #address-cells =3D &lt;<span style=3D=
"color:rgb(181,206,168)">2</span>&gt;;</div><div>    #size-cells =3D &lt;<s=
pan style=3D"color:rgb(181,206,168)">2</span>&gt;;</div><br><div>    aliase=
s {</div><div>        serial3 =3D &amp;uart4;</div><div>        mmc2 =3D &a=
mp;usdhc3;</div><div>    };</div><br><div>    cpus {</div><div>        #add=
ress-cells =3D &lt;<span style=3D"color:rgb(181,206,168)">1</span>&gt;;</di=
v><div>        #size-cells =3D &lt;<span style=3D"color:rgb(181,206,168)">0=
</span>&gt;;</div><br><div>        A53_2: cpu@2 {</div><div>            dev=
ice_type =3D <span style=3D"color:rgb(206,145,120)">&quot;cpu&quot;</span>;=
</div><div>            compatible =3D <span style=3D"color:rgb(206,145,120)=
">&quot;arm,cortex-a53&quot;</span>;</div><div>            reg =3D &lt;<spa=
n style=3D"color:rgb(181,206,168)">0x2</span>&gt;;</div><div>            cl=
ock-latency =3D &lt;<span style=3D"color:rgb(181,206,168)">61036</span>&gt;=
; <span style=3D"color:rgb(106,153,85)">/* two CLK32 periods */</span></div=
><div>            next-level-cache =3D &lt;&amp;A53_L2&gt;;</div><div>     =
       enable-method =3D <span style=3D"color:rgb(206,145,120)">&quot;psci&=
quot;</span>;</div><div>            #cooling-cells =3D &lt;<span style=3D"c=
olor:rgb(181,206,168)">2</span>&gt;;</div><div>        };</div><br><div>   =
     A53_3: cpu@3 {</div><div>            device_type =3D <span style=3D"co=
lor:rgb(206,145,120)">&quot;cpu&quot;</span>;</div><div>            compati=
ble =3D <span style=3D"color:rgb(206,145,120)">&quot;arm,cortex-a53&quot;</=
span>;</div><div>            reg =3D &lt;<span style=3D"color:rgb(181,206,1=
68)">0x3</span>&gt;;</div><div>            clock-latency =3D &lt;<span styl=
e=3D"color:rgb(181,206,168)">61036</span>&gt;; <span style=3D"color:rgb(106=
,153,85)">/* two CLK32 periods */</span></div><div>            next-level-c=
ache =3D &lt;&amp;A53_L2&gt;;</div><div>            enable-method =3D <span=
 style=3D"color:rgb(206,145,120)">&quot;psci&quot;</span>;</div><div>      =
      #cooling-cells =3D &lt;<span style=3D"color:rgb(181,206,168)">2</span=
>&gt;;</div><div>        };</div><br><div>        A53_L2: l2-cache0 {</div>=
<div>            compatible =3D <span style=3D"color:rgb(206,145,120)">&quo=
t;cache&quot;</span>;</div><div>        };</div><div>    };</div><br><div> =
   psci {</div><div>        compatible =3D <span style=3D"color:rgb(206,145=
,120)">&quot;arm,psci-1.0&quot;</span>;</div><div>        method =3D <span =
style=3D"color:rgb(206,145,120)">&quot;smc&quot;</span>;</div><div>    };</=
div><br><div>    gic: interrupt-controller@38800000 {</div><div>        com=
patible =3D <span style=3D"color:rgb(206,145,120)">&quot;arm,gic-v3&quot;</=
span>;</div><div>        reg =3D &lt;<span style=3D"color:rgb(181,206,168)"=
>0x0</span> <span style=3D"color:rgb(181,206,168)">0x38800000</span> <span =
style=3D"color:rgb(181,206,168)">0</span> <span style=3D"color:rgb(181,206,=
168)">0x10000</span>&gt;, <span style=3D"color:rgb(106,153,85)">/* GIC Dist=
 */</span></div><div>              &lt;<span style=3D"color:rgb(181,206,168=
)">0x0</span> <span style=3D"color:rgb(181,206,168)">0x38880000</span> <spa=
n style=3D"color:rgb(181,206,168)">0</span> <span style=3D"color:rgb(181,20=
6,168)">0xC0000</span>&gt;; <span style=3D"color:rgb(106,153,85)">/* GICR (=
RD_base + SGI_base) */</span></div><div>        #interrupt-cells =3D &lt;<s=
pan style=3D"color:rgb(181,206,168)">3</span>&gt;;</div><div>        interr=
upt-controller;</div><div>        interrupts =3D &lt;<span style=3D"color:r=
gb(181,206,168)">GIC_PPI</span> <span style=3D"color:rgb(181,206,168)">9</s=
pan> <span style=3D"color:rgb(181,206,168)">IRQ_TYPE_LEVEL_HIGH</span>&gt;;=
</div><div>        interrupt-parent =3D &lt;&amp;gic&gt;;</div><div>    };<=
/div><br><div>    timer {</div><div>        compatible =3D <span style=3D"c=
olor:rgb(206,145,120)">&quot;arm,armv8-timer&quot;</span>;</div><div>      =
  interrupts =3D &lt;<span style=3D"color:rgb(181,206,168)">GIC_PPI</span> =
<span style=3D"color:rgb(181,206,168)">13</span> (<span style=3D"color:rgb(=
181,206,168)">GIC_CPU_MASK_SIMPLE</span>(<span style=3D"color:rgb(181,206,1=
68)">6</span>) | <span style=3D"color:rgb(181,206,168)">IRQ_TYPE_LEVEL_LOW<=
/span>)&gt;, <span style=3D"color:rgb(106,153,85)">/* Physical Secure */</s=
pan></div><div>                 &lt;<span style=3D"color:rgb(181,206,168)">=
GIC_PPI</span> <span style=3D"color:rgb(181,206,168)">14</span> (<span styl=
e=3D"color:rgb(181,206,168)">GIC_CPU_MASK_SIMPLE</span>(<span style=3D"colo=
r:rgb(181,206,168)">6</span>) | <span style=3D"color:rgb(181,206,168)">IRQ_=
TYPE_LEVEL_LOW</span>)&gt;, <span style=3D"color:rgb(106,153,85)">/* Physic=
al Non-Secure */</span></div><div>                 &lt;<span style=3D"color=
:rgb(181,206,168)">GIC_PPI</span> <span style=3D"color:rgb(181,206,168)">11=
</span> (<span style=3D"color:rgb(181,206,168)">GIC_CPU_MASK_SIMPLE</span>(=
<span style=3D"color:rgb(181,206,168)">6</span>) | <span style=3D"color:rgb=
(181,206,168)">IRQ_TYPE_LEVEL_LOW</span>)&gt;, <span style=3D"color:rgb(106=
,153,85)">/* Virtual */</span></div><div>                 &lt;<span style=
=3D"color:rgb(181,206,168)">GIC_PPI</span> <span style=3D"color:rgb(181,206=
,168)">10</span> (<span style=3D"color:rgb(181,206,168)">GIC_CPU_MASK_SIMPL=
E</span>(<span style=3D"color:rgb(181,206,168)">6</span>) | <span style=3D"=
color:rgb(181,206,168)">IRQ_TYPE_LEVEL_LOW</span>)&gt;; <span style=3D"colo=
r:rgb(106,153,85)">/* Hypervisor */</span></div><div>        clock-frequenc=
y =3D &lt;<span style=3D"color:rgb(181,206,168)">8333333</span>&gt;;</div><=
div>    };</div><br><div>    clk_dummy: clock@7 {</div><div>        compati=
ble =3D <span style=3D"color:rgb(206,145,120)">&quot;fixed-clock&quot;</spa=
n>;</div><div>        #clock-cells =3D &lt;<span style=3D"color:rgb(181,206=
,168)">0</span>&gt;;</div><div>        clock-frequency =3D &lt;<span style=
=3D"color:rgb(181,206,168)">0</span>&gt;;</div><div>        clock-output-na=
mes =3D <span style=3D"color:rgb(206,145,120)">&quot;clk_dummy&quot;</span>=
;</div><div>    };</div><br><div>    <span style=3D"color:rgb(106,153,85)">=
/* The clocks are configured by 1st OS */</span></div><div>    clk_400m: cl=
ock@8 {</div><div>        compatible =3D <span style=3D"color:rgb(206,145,1=
20)">&quot;fixed-clock&quot;</span>;</div><div>        #clock-cells =3D &lt=
;<span style=3D"color:rgb(181,206,168)">0</span>&gt;;</div><div>        clo=
ck-frequency =3D &lt;<span style=3D"color:rgb(181,206,168)">200000000</span=
>&gt;;</div><div>        clock-output-names =3D <span style=3D"color:rgb(20=
6,145,120)">&quot;200m&quot;</span>;</div><div>    };</div><br><div>    clk=
_266m: clock@9 {</div><div>        compatible =3D <span style=3D"color:rgb(=
206,145,120)">&quot;fixed-clock&quot;</span>;</div><div>        #clock-cell=
s =3D &lt;<span style=3D"color:rgb(181,206,168)">0</span>&gt;;</div><div>  =
      clock-frequency =3D &lt;<span style=3D"color:rgb(181,206,168)">266000=
000</span>&gt;;</div><div>        clock-output-names =3D <span style=3D"col=
or:rgb(206,145,120)">&quot;266m&quot;</span>;</div><div>    };</div><br><di=
v>    osc_24m: clock@1 {</div><div>        compatible =3D <span style=3D"co=
lor:rgb(206,145,120)">&quot;fixed-clock&quot;</span>;</div><div>        #cl=
ock-cells =3D &lt;<span style=3D"color:rgb(181,206,168)">0</span>&gt;;</div=
><div>        clock-frequency =3D &lt;<span style=3D"color:rgb(181,206,168)=
">24000000</span>&gt;;</div><div>        clock-output-names =3D <span style=
=3D"color:rgb(206,145,120)">&quot;osc_24m&quot;</span>;</div><div>    };</d=
iv><br><div>    pci@fd700000 {</div><div>        compatible =3D <span style=
=3D"color:rgb(206,145,120)">&quot;pci-host-ecam-generic&quot;</span>;</div>=
<div>        device_type =3D <span style=3D"color:rgb(206,145,120)">&quot;p=
ci&quot;</span>;</div><div>        bus-range =3D &lt;<span style=3D"color:r=
gb(181,206,168)">0</span> <span style=3D"color:rgb(181,206,168)">0</span>&g=
t;;</div><div>        #address-cells =3D &lt;<span style=3D"color:rgb(181,2=
06,168)">3</span>&gt;;</div><div>        #size-cells =3D &lt;<span style=3D=
"color:rgb(181,206,168)">2</span>&gt;;</div><div>        #interrupt-cells =
=3D &lt;<span style=3D"color:rgb(181,206,168)">1</span>&gt;;</div><div>    =
    interrupt-map-mask =3D &lt;<span style=3D"color:rgb(181,206,168)">0</sp=
an> <span style=3D"color:rgb(181,206,168)">0</span> <span style=3D"color:rg=
b(181,206,168)">0</span> <span style=3D"color:rgb(181,206,168)">7</span>&gt=
;;</div><div>        interrupt-map =3D &lt;<span style=3D"color:rgb(181,206=
,168)">0</span> <span style=3D"color:rgb(181,206,168)">0</span> <span style=
=3D"color:rgb(181,206,168)">0</span> <span style=3D"color:rgb(181,206,168)"=
>1</span> &amp;gic <span style=3D"color:rgb(181,206,168)">GIC_SPI</span> <s=
pan style=3D"color:rgb(181,206,168)">154</span> <span style=3D"color:rgb(18=
1,206,168)">IRQ_TYPE_EDGE_RISING</span>&gt;,</div><div>                &lt;=
<span style=3D"color:rgb(181,206,168)">0</span> <span style=3D"color:rgb(18=
1,206,168)">0</span> <span style=3D"color:rgb(181,206,168)">0</span> <span =
style=3D"color:rgb(181,206,168)">2</span> &amp;gic <span style=3D"color:rgb=
(181,206,168)">GIC_SPI</span> <span style=3D"color:rgb(181,206,168)">155</s=
pan> <span style=3D"color:rgb(181,206,168)">IRQ_TYPE_EDGE_RISING</span>&gt;=
,</div><div>                &lt;<span style=3D"color:rgb(181,206,168)">0</s=
pan> <span style=3D"color:rgb(181,206,168)">0</span> <span style=3D"color:r=
gb(181,206,168)">0</span> <span style=3D"color:rgb(181,206,168)">3</span> &=
amp;gic <span style=3D"color:rgb(181,206,168)">GIC_SPI</span> <span style=
=3D"color:rgb(181,206,168)">156</span> <span style=3D"color:rgb(181,206,168=
)">IRQ_TYPE_EDGE_RISING</span>&gt;,</div><div>                &lt;<span sty=
le=3D"color:rgb(181,206,168)">0</span> <span style=3D"color:rgb(181,206,168=
)">0</span> <span style=3D"color:rgb(181,206,168)">0</span> <span style=3D"=
color:rgb(181,206,168)">4</span> &amp;gic <span style=3D"color:rgb(181,206,=
168)">GIC_SPI</span> <span style=3D"color:rgb(181,206,168)">157</span> <spa=
n style=3D"color:rgb(181,206,168)">IRQ_TYPE_EDGE_RISING</span>&gt;;</div><d=
iv>        reg =3D &lt;<span style=3D"color:rgb(181,206,168)">0x0</span> <s=
pan style=3D"color:rgb(181,206,168)">0xfd700000</span> <span style=3D"color=
:rgb(181,206,168)">0x0</span> <span style=3D"color:rgb(181,206,168)">0x1000=
00</span>&gt;;</div><div>        ranges =3D &lt;<span style=3D"color:rgb(18=
1,206,168)">0x02000000</span> <span style=3D"color:rgb(181,206,168)">0x00</=
span> <span style=3D"color:rgb(181,206,168)">0x10000000</span> <span style=
=3D"color:rgb(181,206,168)">0x0</span> <span style=3D"color:rgb(181,206,168=
)">0x10000000</span> <span style=3D"color:rgb(181,206,168)">0x00</span> <sp=
an style=3D"color:rgb(181,206,168)">0x10000</span>&gt;;</div><div>    };</d=
iv><br><div>    soc@0 {</div><div>        compatible =3D <span style=3D"col=
or:rgb(206,145,120)">&quot;simple-bus&quot;</span>;</div><div>        #addr=
ess-cells =3D &lt;<span style=3D"color:rgb(181,206,168)">1</span>&gt;;</div=
><div>        #size-cells =3D &lt;<span style=3D"color:rgb(181,206,168)">1<=
/span>&gt;;</div><div>        ranges =3D &lt;<span style=3D"color:rgb(181,2=
06,168)">0x0</span> <span style=3D"color:rgb(181,206,168)">0x0</span> <span=
 style=3D"color:rgb(181,206,168)">0x0</span> <span style=3D"color:rgb(181,2=
06,168)">0x3e000000</span>&gt;;</div><br><div>        aips3: bus@30800000 {=
</div><div>            compatible =3D <span style=3D"color:rgb(206,145,120)=
">&quot;simple-bus&quot;</span>;</div><div>            reg =3D &lt;<span st=
yle=3D"color:rgb(181,206,168)">0x30800000</span> <span style=3D"color:rgb(1=
81,206,168)">0x400000</span>&gt;;</div><div>            #address-cells =3D =
&lt;<span style=3D"color:rgb(181,206,168)">1</span>&gt;;</div><div>        =
    #size-cells =3D &lt;<span style=3D"color:rgb(181,206,168)">1</span>&gt;=
;</div><div>            ranges;</div><br><div>            uart4: serial@30a=
60000 {</div><div>                compatible =3D <span style=3D"color:rgb(2=
06,145,120)">&quot;fsl,imx8mp-uart&quot;</span>, <span style=3D"color:rgb(2=
06,145,120)">&quot;fsl,imx6q-uart&quot;</span>;</div><div>                r=
eg =3D &lt;<span style=3D"color:rgb(181,206,168)">0x30a60000</span> <span s=
tyle=3D"color:rgb(181,206,168)">0x10000</span>&gt;;</div><div>             =
   interrupts =3D &lt;<span style=3D"color:rgb(181,206,168)">GIC_SPI</span>=
 <span style=3D"color:rgb(181,206,168)">29</span> <span style=3D"color:rgb(=
181,206,168)">IRQ_TYPE_LEVEL_HIGH</span>&gt;;</div><div>                sta=
tus =3D <span style=3D"color:rgb(206,145,120)">&quot;disabled&quot;</span>;=
</div><div>            };</div><br><div>            usdhc3: mmc@30b60000 {<=
/div><div>                compatible =3D <span style=3D"color:rgb(206,145,1=
20)">&quot;fsl,imx8mm-usdhc&quot;</span>, <span style=3D"color:rgb(206,145,=
120)">&quot;fsl,imx7d-usdhc&quot;</span>;</div><div>                reg =3D=
 &lt;<span style=3D"color:rgb(181,206,168)">0x30b60000</span> <span style=
=3D"color:rgb(181,206,168)">0x10000</span>&gt;;</div><div>                i=
nterrupts =3D &lt;<span style=3D"color:rgb(181,206,168)">GIC_SPI</span> <sp=
an style=3D"color:rgb(181,206,168)">24</span> <span style=3D"color:rgb(181,=
206,168)">IRQ_TYPE_LEVEL_HIGH</span>&gt;;</div><div>                fsl,tun=
ing-start-tap =3D &lt;<span style=3D"color:rgb(181,206,168)">20</span>&gt;;=
</div><div>                fsl,tuning-step=3D &lt;<span style=3D"color:rgb(=
181,206,168)">2</span>&gt;;</div><div>                status =3D <span styl=
e=3D"color:rgb(206,145,120)">&quot;disabled&quot;</span>;</div><div>       =
     };</div><div>        };</div><div>    };</div><div>};</div><br><div>&a=
mp;uart4 {</div><div>    clocks =3D &lt;&amp;osc_24m&gt;,</div><div>       =
 &lt;&amp;osc_24m&gt;;</div><div>    clock-names =3D <span style=3D"color:r=
gb(206,145,120)">&quot;ipg&quot;</span>, <span style=3D"color:rgb(206,145,1=
20)">&quot;per&quot;</span>;</div><div>    status =3D <span style=3D"color:=
rgb(206,145,120)">&quot;okay&quot;</span>;</div><div>};</div><br><div>&amp;=
usdhc3 {</div><div>    clocks =3D &lt;&amp;clk_dummy&gt;,</div><div>       =
 &lt;&amp;clk_266m&gt;,</div><div>        &lt;&amp;clk_400m&gt;;</div><div>=
    clock-names =3D <span style=3D"color:rgb(206,145,120)">&quot;ipg&quot;<=
/span>, <span style=3D"color:rgb(206,145,120)">&quot;ahb&quot;</span>, <spa=
n style=3D"color:rgb(206,145,120)">&quot;per&quot;</span>;</div><div>    bu=
s-width =3D &lt;<span style=3D"color:rgb(181,206,168)">8</span>&gt;;</div><=
div>    non-removable;</div><div>    status =3D <span style=3D"color:rgb(20=
6,145,120)">&quot;okay&quot;</span>;</div><div>};</div><br></div></div><div=
><br></div><div>imx8mp-linux-demo.c:<br><div style=3D"color:rgb(212,212,212=
);background-color:rgb(30,30,30);font-family:&quot;JetBrains Mono&quot;,Men=
lo,Monaco,&quot;Courier New&quot;,monospace,Menlo,Monaco,&quot;Courier New&=
quot;,monospace;font-size:12px;line-height:18px;white-space:pre"><div><span=
 style=3D"color:rgb(106,153,85)">/*</span></div><div><span style=3D"color:r=
gb(106,153,85)"> * iMX8MM target - linux-demo</span></div><div><span style=
=3D"color:rgb(106,153,85)"> *</span></div><div><span style=3D"color:rgb(106=
,153,85)"> * Copyright 2019 NXP</span></div><div><span style=3D"color:rgb(1=
06,153,85)"> *</span></div><div><span style=3D"color:rgb(106,153,85)"> * Au=
thors:</span></div><div><span style=3D"color:rgb(106,153,85)"> *  Peng Fan =
&lt;<a href data-email-masked rel=3D"nofollow">peng...@nxp.com</a>&gt;</spa=
n></div><div><span style=3D"color:rgb(106,153,85)"> *</span></div><div><spa=
n style=3D"color:rgb(106,153,85)"> * This work is licensed under the terms =
of the GNU GPL, version 2.  See</span></div><div><span style=3D"color:rgb(1=
06,153,85)"> * the COPYING file in the top-level directory.</span></div><di=
v><span style=3D"color:rgb(106,153,85)"> */</span></div><br><div><span styl=
e=3D"color:rgb(106,153,85)">/*</span></div><div><span style=3D"color:rgb(10=
6,153,85)"> * Boot 2nd Linux cmdline:</span></div><div><span style=3D"color=
:rgb(106,153,85)"> * export PATH=3D$PATH:/home/comet/OK8MP_linux_kernel/ext=
ra/jailhouse/tools/</span></div><div><span style=3D"color:rgb(106,153,85)">=
 * jailhouse cell linux imx8mp-linux-demo.cell Image -d imx8mp-evk-inmate.d=
tb -c &quot;clk_ignore_unused console=3Dttymxc3,115200 earlycon=3Dec_imx6q,=
0x30890000,115200  root=3D/dev/mmcblk2p2 rootwait rw&quot;</span></div><div=
><span style=3D"color:rgb(106,153,85)"> */</span></div><div><span style=3D"=
color:rgb(86,156,214)">#include </span><span style=3D"color:rgb(206,145,120=
)">&lt;jailhouse/types.h&gt;</span></div><div><span style=3D"color:rgb(86,1=
56,214)">#include </span><span style=3D"color:rgb(206,145,120)">&lt;jailhou=
se/cell-config.h&gt;</span></div><br><div><span style=3D"color:rgb(86,156,2=
14)">struct</span> {</div><div>    <span style=3D"color:rgb(86,156,214)">st=
ruct</span> jailhouse_cell_desc cell;</div><div>    __u64 cpus[<span style=
=3D"color:rgb(181,206,168)">1</span>];</div><div>    <span style=3D"color:r=
gb(86,156,214)">struct</span> jailhouse_memory mem_regions[<span style=3D"c=
olor:rgb(181,206,168)">15</span>];</div><div>    <span style=3D"color:rgb(8=
6,156,214)">struct</span> jailhouse_irqchip irqchips[<span style=3D"color:r=
gb(181,206,168)">2</span>];</div><div>    <span style=3D"color:rgb(86,156,2=
14)">struct</span> jailhouse_pci_device pci_devices[<span style=3D"color:rg=
b(181,206,168)">2</span>];</div><div>} __attribute__((packed)) config =3D {=
</div><div>    .cell =3D {</div><div>        .signature =3D JAILHOUSE_CELL_=
DESC_SIGNATURE,</div><div>        .revision =3D JAILHOUSE_CONFIG_REVISION,<=
/div><div>        .name =3D <span style=3D"color:rgb(206,145,120)">&quot;li=
nux-inmate-demo&quot;</span>,</div><div>        .flags =3D JAILHOUSE_CELL_P=
ASSIVE_COMMREG,</div><br><div>        .cpu_set_size =3D <span style=3D"colo=
r:rgb(86,156,214)">sizeof</span>(config.cpus),</div><div>        .num_memor=
y_regions =3D ARRAY_SIZE(config.mem_regions),</div><div>        .num_irqchi=
ps =3D ARRAY_SIZE(config.irqchips),</div><div>        .num_pci_devices =3D =
ARRAY_SIZE(config.pci_devices),</div><div>        .vpci_irq_base =3D <span =
style=3D"color:rgb(181,206,168)">154</span>,<span style=3D"color:rgb(106,15=
3,85)"> /* Not include 32 base */</span></div><div>    },</div><br><div>   =
 .cpus =3D {</div><div>        <span style=3D"color:rgb(181,206,168)">0xc</=
span>,</div><div>    },</div><br><div>    .mem_regions =3D {</div><div><spa=
n style=3D"color:rgb(106,153,85)">        /* IVHSMEM shared memory region f=
or 00:00.0 (demo )*/</span> {</div><div>            .phys_start =3D <span s=
tyle=3D"color:rgb(181,206,168)">0xfd900000</span>,</div><div>            .v=
irt_start =3D <span style=3D"color:rgb(181,206,168)">0xfd900000</span>,</di=
v><div>            .size =3D <span style=3D"color:rgb(181,206,168)">0x1000<=
/span>,</div><div>            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM=
_ROOTSHARED,</div><div>        },</div><div>        {</div><div>           =
 .phys_start =3D <span style=3D"color:rgb(181,206,168)">0xfd901000</span>,<=
/div><div>            .virt_start =3D <span style=3D"color:rgb(181,206,168)=
">0xfd901000</span>,</div><div>            .size =3D <span style=3D"color:r=
gb(181,206,168)">0x9000</span>,</div><div>            .flags =3D JAILHOUSE_=
MEM_READ | JAILHOUSE_MEM_WRITE |</div><div>                JAILHOUSE_MEM_RO=
OTSHARED,</div><div>        },</div><div>        {</div><div>            .p=
hys_start =3D <span style=3D"color:rgb(181,206,168)">0xfd90a000</span>,</di=
v><div>            .virt_start =3D <span style=3D"color:rgb(181,206,168)">0=
xfd90a000</span>,</div><div>            .size =3D <span style=3D"color:rgb(=
181,206,168)">0x2000</span>,</div><div>            .flags =3D JAILHOUSE_MEM=
_READ | JAILHOUSE_MEM_ROOTSHARED,</div><div>        },</div><div>        {<=
/div><div>            .phys_start =3D <span style=3D"color:rgb(181,206,168)=
">0xfd90c000</span>,</div><div>            .virt_start =3D <span style=3D"c=
olor:rgb(181,206,168)">0xfd90c000</span>,</div><div>            .size =3D <=
span style=3D"color:rgb(181,206,168)">0x2000</span>,</div><div>            =
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,</div><div>       =
 },</div><div>        {</div><div>            .phys_start =3D <span style=
=3D"color:rgb(181,206,168)">0xfd90e000</span>,</div><div>            .virt_=
start =3D <span style=3D"color:rgb(181,206,168)">0xfd90e000</span>,</div><d=
iv>            .size =3D <span style=3D"color:rgb(181,206,168)">0x2000</spa=
n>,</div><div>            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRI=
TE |</div><div>                JAILHOUSE_MEM_ROOTSHARED,</div><div>        =
},</div><div><span style=3D"color:rgb(106,153,85)">        /* IVSHMEM share=
d memory regions for 00:01.0 (networking) */</span></div><div>        JAILH=
OUSE_SHMEM_NET_REGIONS(<span style=3D"color:rgb(181,206,168)">0xfda00000</s=
pan>, <span style=3D"color:rgb(181,206,168)">1</span>),</div><div><span sty=
le=3D"color:rgb(106,153,85)">        /* UART2 earlycon */</span> {</div><di=
v>            .phys_start =3D <span style=3D"color:rgb(181,206,168)">0x3089=
0000</span>,</div><div>            .virt_start =3D <span style=3D"color:rgb=
(181,206,168)">0x30890000</span>,</div><div>            .size =3D <span sty=
le=3D"color:rgb(181,206,168)">0x1000</span>,</div><div>            .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |</div><div>                JA=
ILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,</div><div>        },</div><div><=
span style=3D"color:rgb(106,153,85)">        /* UART4 */</span> {</div><div=
>            .phys_start =3D <span style=3D"color:rgb(181,206,168)">0x30a60=
000</span>,</div><div>            .virt_start =3D <span style=3D"color:rgb(=
181,206,168)">0x30a60000</span>,</div><div>            .size =3D <span styl=
e=3D"color:rgb(181,206,168)">0x1000</span>,</div><div>            .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |</div><div>                JA=
ILHOUSE_MEM_IO,</div><div>        },</div><div><span style=3D"color:rgb(106=
,153,85)">        /* SHDC3 */</span> {</div><div>            .phys_start =
=3D <span style=3D"color:rgb(181,206,168)">0x30b60000</span>,</div><div>   =
         .virt_start =3D <span style=3D"color:rgb(181,206,168)">0x30b60000<=
/span>,</div><div>            .size =3D <span style=3D"color:rgb(181,206,16=
8)">0x10000</span>,</div><div>            .flags =3D JAILHOUSE_MEM_READ | J=
AILHOUSE_MEM_WRITE |</div><div>                JAILHOUSE_MEM_IO,</div><div>=
        },</div><div><span style=3D"color:rgb(106,153,85)">        /* RAM: =
Top at 4GB Space */</span> {</div><div>            .phys_start =3D <span st=
yle=3D"color:rgb(181,206,168)">0xfdb00000</span>,</div><div>            .vi=
rt_start =3D <span style=3D"color:rgb(181,206,168)">0</span>,</div><div>   =
         .size =3D <span style=3D"color:rgb(181,206,168)">0x10000</span>,<s=
pan style=3D"color:rgb(106,153,85)"> /* 64KB */</span></div><div>          =
  .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |</div><div>         =
       JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,</div><div>        },=
</div><div><span style=3D"color:rgb(106,153,85)">        /* RAM */</span> {=
</div><div><span style=3D"color:rgb(106,153,85)">            /*</span></div=
><div><span style=3D"color:rgb(106,153,85)">             * We could not use=
 0x80000000 which conflicts with</span></div><div><span style=3D"color:rgb(=
106,153,85)">             * COMM_REGION_BASE</span></div><div><span style=
=3D"color:rgb(106,153,85)">             */</span></div><div>            .ph=
ys_start =3D <span style=3D"color:rgb(181,206,168)">0xc0000000</span>,</div=
><div>            .virt_start =3D <span style=3D"color:rgb(181,206,168)">0x=
c0000000</span>,</div><div>            .size =3D <span style=3D"color:rgb(1=
81,206,168)">0x3d700000</span>,</div><div>            .flags =3D JAILHOUSE_=
MEM_READ | JAILHOUSE_MEM_WRITE |</div><div>                JAILHOUSE_MEM_EX=
ECUTE | JAILHOUSE_MEM_DMA |</div><div>                JAILHOUSE_MEM_LOADABL=
E,</div><div>        },</div><div><span style=3D"color:rgb(106,153,85)">   =
     /* communication region */</span> {</div><div>            .virt_start =
=3D <span style=3D"color:rgb(181,206,168)">0x80000000</span>,</div><div>   =
         .size =3D <span style=3D"color:rgb(181,206,168)">0x00001000</span>=
,</div><div>            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE=
 |</div><div>                JAILHOUSE_MEM_COMM_REGION,</div><div>        }=
,</div><div>    },</div><br><div>    .irqchips =3D {</div><div><span style=
=3D"color:rgb(106,153,85)">        /* uart2/sdhc1 */</span> {</div><div>   =
         .address =3D <span style=3D"color:rgb(181,206,168)">0x38800000</sp=
an>,</div><div>            .pin_base =3D <span style=3D"color:rgb(181,206,1=
68)">32</span>,</div><div>            .pin_bitmap =3D {</div><div>         =
       (<span style=3D"color:rgb(181,206,168)">1</span> &lt;&lt; (<span sty=
le=3D"color:rgb(181,206,168)">24</span> + <span style=3D"color:rgb(181,206,=
168)">32</span> - <span style=3D"color:rgb(181,206,168)">32</span>)) | (<sp=
an style=3D"color:rgb(181,206,168)">1</span> &lt;&lt; (<span style=3D"color=
:rgb(181,206,168)">29</span> + <span style=3D"color:rgb(181,206,168)">32</s=
pan> - <span style=3D"color:rgb(181,206,168)">32</span>))</div><div>       =
     },</div><div>        },</div><div><span style=3D"color:rgb(106,153,85)=
">        /* IVSHMEM */</span> {</div><div>            .address =3D <span s=
tyle=3D"color:rgb(181,206,168)">0x38800000</span>,</div><div>            .p=
in_base =3D <span style=3D"color:rgb(181,206,168)">160</span>,</div><div>  =
          .pin_bitmap =3D {</div><div>                <span style=3D"color:=
rgb(181,206,168)">0xf</span> &lt;&lt; (<span style=3D"color:rgb(181,206,168=
)">154</span> + <span style=3D"color:rgb(181,206,168)">32</span> - <span st=
yle=3D"color:rgb(181,206,168)">160</span>)<span style=3D"color:rgb(106,153,=
85)"> /* SPI 154-157 */</span></div><div>            },</div><div>        }=
,</div><div>    },</div><br><div>    .pci_devices =3D {</div><div>        {=
<span style=3D"color:rgb(106,153,85)"> /* IVSHMEM 00:00.0 (demo) */</span><=
/div><div>            .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,</div><div>     =
       .domain =3D <span style=3D"color:rgb(181,206,168)">0</span>,</div><d=
iv>            .bdf =3D <span style=3D"color:rgb(181,206,168)">0</span> &lt=
;&lt; <span style=3D"color:rgb(181,206,168)">3</span>,</div><div>          =
  .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,</div><div>            .shm=
em_regions_start =3D <span style=3D"color:rgb(181,206,168)">0</span>,</div>=
<div>            .shmem_dev_id =3D <span style=3D"color:rgb(181,206,168)">2=
</span>,</div><div>            .shmem_peers =3D <span style=3D"color:rgb(18=
1,206,168)">3</span>,</div><div>            .shmem_protocol =3D JAILHOUSE_S=
HMEM_PROTO_UNDEFINED,</div><div>        },</div><div>        {<span style=
=3D"color:rgb(106,153,85)"> /* IVSHMEM 00:01.0 (networking) */</span></div>=
<div>            .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,</div><div>          =
  .domain =3D <span style=3D"color:rgb(181,206,168)">0</span>,</div><div>  =
          .bdf =3D <span style=3D"color:rgb(181,206,168)">1</span> &lt;&lt;=
 <span style=3D"color:rgb(181,206,168)">3</span>,</div><div>            .ba=
r_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,</div><div>            .shmem_re=
gions_start =3D <span style=3D"color:rgb(181,206,168)">5</span>,</div><div>=
            .shmem_dev_id =3D <span style=3D"color:rgb(181,206,168)">1</spa=
n>,</div><div>            .shmem_peers =3D <span style=3D"color:rgb(181,206=
,168)">2</span>,</div><div>            .shmem_protocol =3D JAILHOUSE_SHMEM_=
PROTO_VETH,</div><div>        },</div><div>    },</div><div>};</div><br></d=
iv></div><div><br></div><div>I really need help.</div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/9d0f81ec-4d3e-47cd-b9dc-8594c70b783cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/9d0f81ec-4d3e-47cd-b9dc-8594c70b783cn%40googlegroups.co=
m</a>.<br />

------=_Part_33387_791957420.1705995598985--

------=_Part_33386_510057698.1705995598985--
