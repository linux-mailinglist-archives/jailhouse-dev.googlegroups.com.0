Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBSU47XUQKGQE3PXCEXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 654A579661
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 21:51:40 +0200 (CEST)
Received: by mail-ot1-x340.google.com with SMTP id n19sf34592469ota.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 12:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Tpa4V+nYYz2TuM2NdEGhyZVHq6GrbkoKXq5ANqvjqcc=;
        b=iGL0V1PhBVm2gF0ISlv070uxnzRZgh4JSVVe4m9Bo1KMNm7DPO04YEVIsfM5q37+sy
         PrO/XPc5R8uCkW3dYDAyV0TPs787fNYlxEfJdKMCt84yG/f8mrpdrTHYw4/EVlfUfOtp
         vENhiRy0Wm591+MH3UVziNbp6jEt83JUenVZvx+9cxY4NCog3ar6q0KscObQrG6VUHHK
         1+HVNdyZf0hZPPZ2LH5nnp9wZqlhZaXNGvfAXlz3fNiBSk38th8WGko8I3zDOiny4hlB
         3EbbvLua20z+5urdZ2JIOnLtov/Q4eQJddeWtt16+Vv1SAtfkqNUrI3bOdiMVQCuX4nF
         Fkbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Tpa4V+nYYz2TuM2NdEGhyZVHq6GrbkoKXq5ANqvjqcc=;
        b=YKoT+XHDYmR/Dp73rAau1WIs5e1QMfY/HwaaGwgzRSQ7oGdJmj1uLki6xx76ISgTVF
         ian21+m1IYO5y7oB1ZbNDiJH9x5ucxJPC+CjIFbpp3+9koPUDqCwX6r0lB3qVjUc49wy
         w+jaHF27fh0KNGsvu94RF36ayMAhbn2HviiDlZD1TFnPIrJye3jKuZccup8KrmQhrDH3
         rdtWchemrAQixDNmqh+pluRd6JeJ8zwu+sJcVZv3y4yuUVnWafQnL1kNbEo+PpfMIwRT
         +Qd9zonbmB8Cjnzj0yWsGeCReaZVN34zUsBFBeAyIXBb/4DaEyS374XRCToAm6MwuiVy
         ifYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Tpa4V+nYYz2TuM2NdEGhyZVHq6GrbkoKXq5ANqvjqcc=;
        b=RZUKEEVb/L90LsMLuv5xWIqquDNjPKgfRq2DvEuMWXyo7lH4tdh2HRWHaLb4U0x3vp
         ulFiZ/ZZcvukfnjRCul7O3n6EauRqnnF7b+FZHT5bHS/ZX1Fcwu/xX0hSGWv2N95jguo
         +pLg+uEbY5huQNJZM/bLjWisVhBQvtF3TCl5WsoUISG9XbMJ/2CfNy1iCHKxj7n91tMr
         1TY8MSybGM3+o3LQECOpTYB2b2tW7XftNCt/17KRgz6wCr8ZYR7nZwpNTdGMyPaziVz8
         IrG8r07G28QhnyUBmQwYj3J+IKdlmZ6N3IXLKvhw6yfCtNYOJ2AyJGl6BVk+SBg/ghqA
         OMGw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW+YciwlN143KOg/a7xrmiUrZ5zyAXcW4S73u105P7PpRiyVbPP
	Sn+5QZ6WyTgcOf7bMTCUg4I=
X-Google-Smtp-Source: APXvYqzRh3cQqnTOoRf1+por9OVSU296CpsslWDcBsI6hiViBmcZCLVywh+AyTnGKpekC4OkNyc3vg==
X-Received: by 2002:a9d:6287:: with SMTP id x7mr42298857otk.359.1564429899050;
        Mon, 29 Jul 2019 12:51:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:c615:: with SMTP id w21ls7496329oif.15.gmail; Mon, 29
 Jul 2019 12:51:38 -0700 (PDT)
X-Received: by 2002:aca:4a4e:: with SMTP id x75mr53641828oia.154.1564429898385;
        Mon, 29 Jul 2019 12:51:38 -0700 (PDT)
Date: Mon, 29 Jul 2019 12:51:37 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <edf7dab3-2c32-43bb-b13b-fce8bc452418@googlegroups.com>
In-Reply-To: <885b4c3e-8d69-e516-aff4-46f2e50cb622@web.de>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <c1a63d36-2dd0-5b52-bb16-31794ab93b62@siemens.com>
 <fe00f482-c82c-4f93-8a0e-f73dc955888d@googlegroups.com>
 <b4e7dbee-58cd-3126-ce6b-7b54ee0ef241@siemens.com>
 <211205da-9e38-4178-895a-3ba80f214aa9@googlegroups.com>
 <6abaf77f-e4a7-7a9a-2ae9-8d1d8f1388bf@siemens.com>
 <1726f6bd-680a-46ac-a7f3-937cbba84208@googlegroups.com>
 <19e76b74-6d6e-010d-952a-5a36e606091b@web.de>
 <a5b27da1-b2aa-4ce0-863f-d9503a22b886@googlegroups.com>
 <885b4c3e-8d69-e516-aff4-46f2e50cb622@web.de>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8377_1604816126.1564429897655"
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

------=_Part_8377_1604816126.1564429897655
Content-Type: multipart/alternative; 
	boundary="----=_Part_8378_442489948.1564429897655"

------=_Part_8378_442489948.1564429897655
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yeah, i forgot to set the flag and the .dtb file i was using wasn't the=20
right one (now i am using inmate-zynqmp.dts). But even when i set the flag,=
=20
it still gives me the same error.
Send here the output of /proc/iomem:

00000000-3ecfffff : System RAM
  00080000-00deffff : Kernel code
  00e70000-01134fff : Kernel data
3ed00000-3ed3ffff : 3ed00000.ddr
3fd00000-5fffffff : System RAM
7c000000-7c3fffff : Jailhouse hypervisor
fc000000-fc0fffff : PCI ECAM
fc100000-fc101fff : //pci@0
  fc100000-fc1000ff : 0000:00:00.0

And the config as it is now in attachment.

s=C3=A1bado, 27 de Julho de 2019 =C3=A0s 13:57:31 UTC+1, Jan Kiszka escreve=
u:
>
> On 27.07.19 14:34, Jo=C3=A3o Reis wrote:=20
> > I reduced the kernel image to 90MB and the initramfs to 80MB. In the no=
n=20
> root=20
> > cell config file, i declared a memory region with size 0x5fff000=20
> (~1.45GB) (send=20
> > in attachment), and even when i issue "jailhouse cell linux=20
> > ultra96-linux-demo.cell Image -d inmate-zynqmp-zcu102-2.dtb -i=20
> rootfs.cpio -c=20
> > "console=3DttyS0, 115200" -k 4", it still gives me the error of no spac=
e=20
> found to=20
> > load all images.=20
> >=20
>
> At least the config your attached contains no loadable RAM regions.=20
>
> Jan=20
>
> --=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/edf7dab3-2c32-43bb-b13b-fce8bc452418%40googlegroups.com.

------=_Part_8378_442489948.1564429897655
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yeah, i forgot to set the flag and the .dtb file i was usi=
ng wasn&#39;t the right one (now i am using inmate-zynqmp.dts). But even wh=
en i set the flag, it still gives me the same error.<div>Send here the outp=
ut of /proc/iomem:</div><div><br></div><div><div>00000000-3ecfffff : System=
 RAM</div><div>=C2=A0 00080000-00deffff : Kernel code</div><div>=C2=A0 00e7=
0000-01134fff : Kernel data</div><div>3ed00000-3ed3ffff : 3ed00000.ddr</div=
><div>3fd00000-5fffffff : System RAM</div><div>7c000000-7c3fffff : Jailhous=
e hypervisor</div><div>fc000000-fc0fffff : PCI ECAM</div><div>fc100000-fc10=
1fff : //pci@0</div><div>=C2=A0 fc100000-fc1000ff : 0000:00:00.0</div></div=
><div><br></div><div>And the config as it is now in attachment.</div><div><=
br>s=C3=A1bado, 27 de Julho de 2019 =C3=A0s 13:57:31 UTC+1, Jan Kiszka escr=
eveu:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8e=
x;border-left: 1px #ccc solid;padding-left: 1ex;">On 27.07.19 14:34, Jo=C3=
=A3o Reis wrote:
<br>&gt; I reduced the kernel image to 90MB and the initramfs to 80MB. In t=
he non root
<br>&gt; cell config file, i declared a memory region with size 0x5fff000 (=
~1.45GB) (send
<br>&gt; in attachment), and even when i issue &quot;jailhouse cell linux
<br>&gt; ultra96-linux-demo.cell Image -d inmate-zynqmp-zcu102-2.dtb -i roo=
tfs.cpio -c
<br>&gt; &quot;console=3DttyS0, 115200&quot; -k 4&quot;, it still gives me =
the error of no space found to
<br>&gt; load all images.
<br>&gt;
<br>
<br>At least the config your attached contains no loadable RAM regions.
<br>
<br>Jan
<br>
<br>--
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/edf7dab3-2c32-43bb-b13b-fce8bc452418%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/edf7dab3-2c32-43bb-b13b-fce8bc452418%40googlegroups.com<=
/a>.<br />

------=_Part_8378_442489948.1564429897655--

------=_Part_8377_1604816126.1564429897655
Content-Type: text/x-csrc; charset=UTF-8; name=ultra96-linux-demo2.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ultra96-linux-demo2.c
X-Attachment-Id: a8fea2c3-2c2f-4fa2-bf6f-725aa0c32bcf
Content-ID: <a8fea2c3-2c2f-4fa2-bf6f-725aa0c32bcf>

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
=09struct jailhouse_memory mem_regions[6];
=09struct jailhouse_irqchip irqchips[1];
=09struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config =3D {
=09.cell =3D {
=09=09.signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
=09=09.revision =3D JAILHOUSE_CONFIG_REVISION,
=09=09.name =3D "non-root",
=09=09.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,/* |
=09=09JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,*/

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
=09=09//0xe, //1110
=09=09//0x8, //1000 - fica com cpu3
=09=090xc, //1100
=09},

=09.mem_regions =3D {
=09=09/* UART */ {
=09=09=09.phys_start =3D 0xff010000,
=09=09=09.virt_start =3D 0xff010000,
=09=09=09/*.phys_start =3D 0xff000000,
=09=09=09.virt_start =3D 0xff000000,*/
=09=09=09.size =3D 0x1000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x3fd00000,
=09=09=09.virt_start =3D 0x3fd00000,
=09=09=09.size =3D 0x20300000, //must be page size aligned
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,/* |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED, *///se tirar JAILHOUSE_MEM_ROOTSHARED=
 da exception fault 0x20
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x7bef0000,
=09=09=09.virt_start =3D 0x7bef0000,
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
=09},
=09=09

=09.irqchips =3D {
=09=09/* GIC */ {
=09=09=09.address =3D 0xf9010000, /* GICD base address - Display controller=
 */
=09=09=09.pin_base =3D 32, /* The first irqchip starts at .pin_base=3D32 as=
 the first 32 interrupts are=20
reserved for SGIs and PPIs. */
=09=09=09.pin_bitmap =3D {
=09=09=09=09//1 << (54 - 32),
=09=09=09=091 << (53 - 32), // cat /proc/interrupts interrupt da UART0 AQUI=
 ESTA A DIFEREN=C3=87A
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
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_CUSTOM,
=09=09=09.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
=09=09=09//.num_msix_vectors =3D 1,
=09=09},
=09},
};

------=_Part_8377_1604816126.1564429897655--
