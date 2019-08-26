Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBSMMRXVQKGQECEQDWCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A869C753
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 04:39:07 +0200 (CEST)
Received: by mail-oi1-x23a.google.com with SMTP id p17sf2020065oip.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Aug 2019 19:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+QMs/MlEaKVPoLxk/ggvcrRNZVzkDhMvC1A+aDugSUU=;
        b=l0ljfYe27fhxvtqCB9+PyCa1H4QGzwJi8+6ZWuoi0rTQndszUQGtBC8a9ezXe/Y4mI
         +VZpUynM1QaxVL+FXPxgpsczstnslbl255cAwMm1agWUTE9uMhVbnRWdo98ig/waz+2M
         S9JKHMKAvV39wfT6waHOAXxrcOOuu0e3fI9fDZUr5R1VwLcwyHCA0lQSJXxvu/1RsUY9
         EWFMAUK9R02AYmCc3fBDcHqAPnNNhLy3ws+Ami0ZUFBc7S40l2Q+2mqkT7I79qtg6TUz
         uY7qmHjvUjUxDd6pI1fvYCwRJDIkS4V2CAZOmuISFB9Ys4SUyg2DF19XbANVnuYdrmE1
         5JWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+QMs/MlEaKVPoLxk/ggvcrRNZVzkDhMvC1A+aDugSUU=;
        b=I+ncxycH0xGxRVDRwPsj3oa4W+UFfLXOA8etMBnxZUVBTgCW076sxqv9ILu5zhunvg
         sIEd3z7G0tSe4GCuKTiPW1yb/Rd1yV8PSzcPgcRvjt4mcw9ELuIWu8nVwVfb7nuS63ha
         ljfilWlD5Qs3svujPeJSqZeYhwsP9QUJjWb82x0DNXaOULIcB9exosXlzZb2EGI9fiZM
         cTmwzT34dYeifg6LNos/ZWFfjqRJ4jGcEHu+/lF3KZJgYs5pjRq/KP1NOQ45vwBPbbRu
         KPeZzds1H0KGkpDWlQDo8DPprw5kI8iqb6RvWxwbanBDbrp3gC7UeAXhTB7FLgLaJppH
         r6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+QMs/MlEaKVPoLxk/ggvcrRNZVzkDhMvC1A+aDugSUU=;
        b=XkvpC0Sb8lhfvuVRJNC/xPITeJG9AYPJTiuShLD6rzfpWalAOmfBOwi09VyihnOnjV
         /0uhjg/LMBZn4HQGcJLay4zV6lJFhY9DpjO2wmBCXLvfEaBPSCEGECU6odx25vRr/VIq
         vX1Zx5eSiKRkPqBvv/jpYlVSpxX1PE25tmBnE5Pux/YM0m4X4gbUG78eaud6gTswhK6W
         O7+rlrlg78/QPAV5rKqEI+UzKhdl3/w7jx3j00lGH8qZ1b4WSM3V+0Zsih5o65+GH1tX
         JwfHFlP3nD+8zEe/KqmyFrvRpdFkqIraN9qyEF63hjLlUangfh7zcO9WzroYuLXqClJT
         Omhw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVLt9Dn3dLiKV3+X4+xQ/uhUopX6dZv0Kadcr++sCxTU2Lrb22B
	v3XHTsvrWxx3aajB1NsBLs0=
X-Google-Smtp-Source: APXvYqx22DbRDAioMeGCbYqQ8NTuFhGv82TynRa5DP7PJG/CbRFbDZo0nGruKqSgMiWxIJ8Go1laLA==
X-Received: by 2002:a05:6830:1f07:: with SMTP id u7mr13710354otg.328.1566787146383;
        Sun, 25 Aug 2019 19:39:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:36c:: with SMTP id 99ls2354406otv.3.gmail; Sun, 25 Aug
 2019 19:39:05 -0700 (PDT)
X-Received: by 2002:a05:6830:15d8:: with SMTP id j24mr12861962otr.272.1566787145644;
        Sun, 25 Aug 2019 19:39:05 -0700 (PDT)
Date: Sun, 25 Aug 2019 19:39:04 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <521c355a-eacc-434e-b50d-dd7c797be08a@googlegroups.com>
In-Reply-To: <67cdfa4b-86e9-496a-3878-b5a0016b75c0@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <39b83770-5562-437f-a25b-415d85dc7c3b@googlegroups.com>
 <94e3009c-aa34-e8f1-b503-d3a8b138d9a9@siemens.com>
 <43d8fdde-153f-40ec-8974-4388efab8315@googlegroups.com>
 <c30da773-76bd-3691-3828-e8f7ed592d52@siemens.com>
 <12a82b12-b9bd-4258-87fb-9525f4bb648a@googlegroups.com>
 <5fe86ed7-e82f-3fef-6eef-a888e4ef6be7@siemens.com>
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
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1384_1361904212.1566787145025"
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

------=_Part_1384_1361904212.1566787145025
Content-Type: multipart/alternative; 
	boundary="----=_Part_1385_294716508.1566787145025"

------=_Part_1385_294716508.1566787145025
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After adding the driver and starting the non-root Linux, i can see in=20
console the link between root and non-root being established.
"Adding virtual PCI device 00:01.0 to cell "linux-non-root
  Shared memory connection established: "linux-non-root" <--> "root"".=20

I can see the interrupt of ivshmem-net in /proc/interrupts and when i issue=
=20
"lspci" i can see the pci device listed with ivshmem-net driver attached to=
=20
it. But, when i issue "ifconfig" i don't find any interface besides=20
loopback and my pc's interface, supposedly i would have to see linux=20
non-root interface. Is there something missing (some driver maybe)?

segunda-feira, 19 de Agosto de 2019 =C3=A0s 14:42:16 UTC+1, Jan Kiszka escr=
eveu:
>
> On 15.08.19 21:42, Jo=C3=A3o Reis wrote:=20
> >  From what i understood about VETH, is that Linux root cell and Linux=
=20
> non-root=20
> > cell will be linked, and each command i will issue to root cell will be=
=20
> > forwarded to non-root cell, through that tunnel created by ivshmem-net,=
=20
> right?=20
> > Doesn't that mean that the command will be executed in both cells?=20
>
> The Linux ivshmem-net driver will provide you a virtual peer-to-peer=20
> Ethernet=20
> link between two cells. If you configure those interfaces accordingly, yo=
u=20
> can=20
> do whatever you like to do over that network, ssh, nfs, etc. There is no=
=20
> magic=20
> involved.=20
>
> Jan=20
>
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> Corporate Competence Center Embedded Linux=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/521c355a-eacc-434e-b50d-dd7c797be08a%40googlegroups.com.

------=_Part_1385_294716508.1566787145025
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">After adding the driver and starting the non-root Linux, i=
 can see in console the link between root and non-root being established.<d=
iv>&quot;Adding virtual PCI device 00:01.0 to cell &quot;linux-non-root<div=
>=C2=A0 Shared memory connection established: &quot;linux-non-root&quot; &l=
t;--&gt; &quot;root&quot;&quot;.=C2=A0<div><br></div><div>I can see the int=
errupt of ivshmem-net in /proc/interrupts and when i issue &quot;lspci&quot=
; i can see the pci device listed with ivshmem-net driver attached to it. B=
ut, when i issue &quot;ifconfig&quot; i don&#39;t find any interface beside=
s loopback and my pc&#39;s interface, supposedly i would have to see linux =
non-root interface. Is there something missing (some driver maybe)?<br><br>=
segunda-feira, 19 de Agosto de 2019 =C3=A0s 14:42:16 UTC+1, Jan Kiszka escr=
eveu:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8e=
x;border-left: 1px #ccc solid;padding-left: 1ex;">On 15.08.19 21:42, Jo=C3=
=A3o Reis wrote:
<br>&gt; =C2=A0From what i understood about VETH, is that Linux root cell a=
nd Linux non-root=20
<br>&gt; cell will be linked, and each command i will issue to root cell wi=
ll be=20
<br>&gt; forwarded to non-root cell, through that tunnel created by ivshmem=
-net, right?=20
<br>&gt; Doesn&#39;t that mean that the command will be executed in both ce=
lls?
<br>
<br>The Linux ivshmem-net driver will provide you a virtual peer-to-peer Et=
hernet=20
<br>link between two cells. If you configure those interfaces accordingly, =
you can=20
<br>do whatever you like to do over that network, ssh, nfs, etc. There is n=
o magic=20
<br>involved.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/521c355a-eacc-434e-b50d-dd7c797be08a%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/521c355a-eacc-434e-b50d-dd7c797be08a%40googlegroups.com<=
/a>.<br />

------=_Part_1385_294716508.1566787145025--

------=_Part_1384_1361904212.1566787145025
Content-Type: text/x-csrc; charset=UTF-8; name=ultra96-linux-demo-col.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ultra96-linux-demo-col.c
X-Attachment-Id: cabcb4be-d6ba-4ffb-b621-de77e44222ce
Content-ID: <cabcb4be-d6ba-4ffb-b621-de77e44222ce>

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
=09=09.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,  /* |
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
=09=09=09.virt_start =3D 0x40000000, //Image + rootfs.cpio =3D 200MB
=09=09=09.size =3D 0x30000000, //must be page size aligned
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

------=_Part_1384_1361904212.1566787145025
Content-Type: text/x-csrc; charset=UTF-8; name=ultra96-col.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ultra96-col.c
X-Attachment-Id: 6c8704f5-6ed7-4542-9f1d-7b68d9abc591
Content-ID: <6c8704f5-6ed7-4542-9f1d-7b68d9abc591>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for Avnet Ultra96 board
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
=09struct jailhouse_system header;
=09__u64 cpus[1];
=09struct jailhouse_memory mem_regions[3];
=09struct jailhouse_irqchip irqchips[1];
=09struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config =3D {
=09.header =3D {
=09=09.signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
=09=09.revision =3D JAILHOUSE_CONFIG_REVISION,
=09=09.flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
=09=09.hypervisor_memory =3D {
=09=09=09//.phys_start =3D 0x7c000000,
=09=09=09//.size =3D       0x00400000,
=09=09=09.phys_start =3D 0x7d000000,
=09=09=09.size =3D       0x01000000,
=09=09},
=09=09.debug_console =3D {
=09=09=09.address =3D 0xff010000,
=09=09=09.size =3D 0x1000,
=09=09=09.type =3D JAILHOUSE_CON_TYPE_XUARTPS,
=09=09=09.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
=09=09=09=09 JAILHOUSE_CON_REGDIST_4,
=09=09},
=09=09.platform_info =3D {
=09=09=09.pci_mmconfig_base =3D 0xfc000000,
=09=09=09.pci_mmconfig_end_bus =3D 0,
=09=09=09.pci_is_virtual =3D 1,
=09=09=09.pci_domain =3D -1,
=09=09=09.llc_way_size =3D 0x10000,
=09=09=09.arm =3D {
=09=09=09=09.gic_version =3D 2,
=09=09=09=09.gicd_base =3D 0xf9010000,
=09=09=09=09.gicc_base =3D 0xf902f000,
=09=09=09=09.gich_base =3D 0xf9040000,
=09=09=09=09.gicv_base =3D 0xf906f000,
=09=09=09=09.maintenance_irq =3D 25,
=09=09=09},
=09=09},
=09=09.root_cell =3D {
=09=09=09.name =3D "root",

=09=09=09.cpu_set_size =3D sizeof(config.cpus),
=09=09=09.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
=09=09=09.num_irqchips =3D ARRAY_SIZE(config.irqchips),
=09=09=09.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),

=09=09=09.vpci_irq_base =3D 136-32,
=09=09},
=09},

=09.cpus =3D {
=09=090xf,
=09},

=09.mem_regions =3D {
=09=09/* MMIO (permissive) */ {
=09=09=09.phys_start =3D 0xfd000000,
=09=09=09.virt_start =3D 0xfd000000,
=09=09=09.size =3D=09      0x03000000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_IO,
=09=09},
=09=09/* Colored RAM for inmates*/ {
=09=09=09.phys_start =3D 0x0,
=09=09=09.virt_start =3D 0x0,
=09=09=09.size =3D 0x7d000000,
=09=09=09//.size =3D 0x7c000000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE,// | JAILHOUSE_MEM_COLORED,
=09=09},
=09=09/* IVSHMEM shared memory region for 00:01.0 (network) */ {
=09=09=09.phys_start =3D 0x7c000000,
=09=09=09.virt_start =3D 0x7c000000,
=09=09=09.size =3D 0x100000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
=09=09},
=09},

=09.irqchips =3D {
=09=09/* GIC */ {
=09=09=09.address =3D 0xf9010000,
=09=09=09.pin_base =3D 32,
=09=09=09.pin_bitmap =3D {
=09=09=09=090xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
=09=09=09},
=09=09},
=09},

=09.pci_devices =3D {
=09=09/* 0001:00:01.0 */ {
=09=09=09.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
=09=09=09.iommu =3D 1,//
=09=09=09//.domain =3D 1,
=09=09=09.bdf =3D 1 << 3, // 00:01.0
=09=09=09.bar_mask =3D {
=09=09=09=090xffffff00, 0xffffffff, 0x00000000,
=09=09=09=090x00000000, 0x00000000, 0x00000000,
=09=09=09},
=09=09=09.shmem_region =3D 2,
=09=09=09.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH, //Virtual peer-to-=
peer Ethernet
=09=09=09//.num_msix_vectors =3D 1,//se colocar isto, qd fa=C3=A7o insmod u=
io_ivshmem.ko ele n diz "using jailhouse mode" e dps n existe /dev/uio1
=09=09},
=09},
};

------=_Part_1384_1361904212.1566787145025--
