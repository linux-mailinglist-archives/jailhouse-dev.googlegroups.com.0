Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBQEJ6HUQKGQEWGJPAIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id B2538778BC
	for <lists+jailhouse-dev@lfdr.de>; Sat, 27 Jul 2019 14:34:10 +0200 (CEST)
Received: by mail-ot1-x340.google.com with SMTP id q22sf30686923otl.23
        for <lists+jailhouse-dev@lfdr.de>; Sat, 27 Jul 2019 05:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/MaHzvkW3EShWbmYUeYMOkFhaUgLHtnK/ky7wcDxN3M=;
        b=Set280ZNttRFCrMOGvGP4+h3mAfliHF5jIPIqc2ms7wJT4SK3cK+qMaM0HmyjgRLDF
         sHtI+3WvuiNlPjp0NWwg5ASVTyv00PkNvKlcs0kT2MmglRZW83jlKnCeN8IiX3Nixw/z
         Kx4MttspNt28HATXfpka9EzjyIvHqrUDMiPXgfJ/6dLlAbhMNfjdUQH7Q6XS2MrkRJS0
         Ff5ydvBNaJcvQTsGeR+T8BGJdqcT7nrqhZMbLbiJ+v7ZrbKRQnCTmtJNXXznvtMAtu0h
         Y1oSB6bVGTVOHEpvleLS7N1iTo0PpXsz/1BDlT1FP5xfP+0LVbF4pTwaE5vk4Mz6+/8T
         ixIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/MaHzvkW3EShWbmYUeYMOkFhaUgLHtnK/ky7wcDxN3M=;
        b=HkVhQbj4dCuE46U54vHGqt75C04DUwweaz04cYFBHwV+s7oIVOj33EiIXrEJ2purBs
         NweLILhBsEkAjawhhV7Z0O1h2tBI90Koy2Ea4eMcPX5/M0p5QQCcZoJdRXQ9FuQLrF0A
         Ui1SLA+VG7hKcF5jV/SSQk7d34fjptifURV2u/AbxFDqs2reFQqENKcRUuHIjP5nifyC
         TdJVKevwy8Tw264ddWcY+oqG2jYfCFoMSXgxPtKsPvk6FzEhElNF93PlmEGe/t06Ualp
         Z/yGs1Qcd4lE2LD3f6+CPg9VukA8RWJqRg5kAdXz4m31nzuI+suYcWmircKvieS+6LQe
         fvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/MaHzvkW3EShWbmYUeYMOkFhaUgLHtnK/ky7wcDxN3M=;
        b=KYL5D0ZbvVhVfFoj934A1MUmkjpuVkjl2CGi8zLulEVNxYYiJ0S/jJRMCR+7Senet4
         UHk5pH/JK6LnqS2MRS0LNveQdv4ZokMqW1XEacCX2jhrw4gSR15al9Art/KV5VtufleS
         axHpiQSdHAys8v9EYP8RWjqocFzmnOwK65/XIQXqAJxmkK4G9gvXW99ui4gZF+lloXLU
         0Z8ywzpQ822PiZ/O2hNhh7SSw89BZxHfoiMyTs+YC12rJxVLFWGL9ciXwlciZOIvBjrN
         bTBb/GEVxxGWJ1BSQgrk8CDkLqiij3WqI828N8mQtzm+QHPjIGN3d0cJETmySRcfjZvw
         hN8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUIImvoN1si8vcqynCI34R7pKa/Ty0uetFYX4ivank5xuawWgX+
	Mjet2Jp5zMonx9xGoHjTnYw=
X-Google-Smtp-Source: APXvYqzrKFaDbHU5ks9IkIYeU9pHbeUlpIT6rPCpnwl+erFqraTfH4sgN4dwqymhMXf+BGAwX7BujQ==
X-Received: by 2002:a05:6830:2010:: with SMTP id e16mr15085845otp.344.1564230849120;
        Sat, 27 Jul 2019 05:34:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:5d4:: with SMTP id d20ls7746711oij.14.gmail; Sat,
 27 Jul 2019 05:34:08 -0700 (PDT)
X-Received: by 2002:aca:3158:: with SMTP id x85mr44651181oix.93.1564230848381;
        Sat, 27 Jul 2019 05:34:08 -0700 (PDT)
Date: Sat, 27 Jul 2019 05:34:07 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a5b27da1-b2aa-4ce0-863f-d9503a22b886@googlegroups.com>
In-Reply-To: <19e76b74-6d6e-010d-952a-5a36e606091b@web.de>
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
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7985_115819774.1564230847653"
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

------=_Part_7985_115819774.1564230847653
Content-Type: multipart/alternative; 
	boundary="----=_Part_7986_1754567173.1564230847653"

------=_Part_7986_1754567173.1564230847653
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I reduced the kernel image to 90MB and the initramfs to 80MB. In the non=20
root cell config file, i declared a memory region with size 0x5fff000=20
(~1.45GB) (send in attachment), and even when i issue "jailhouse cell linux=
=20
ultra96-linux-demo.cell Image -d inmate-zynqmp-zcu102-2.dtb -i rootfs.cpio=
=20
-c "console=3DttyS0, 115200" -k 4", it still gives me the error of no space=
=20
found to load all images.

s=C3=A1bado, 27 de Julho de 2019 =C3=A0s 07:23:24 UTC+1, Jan Kiszka escreve=
u:
>
> On 26.07.19 21:04, Jo=C3=A3o Reis wrote:=20
> > The kernel and initramfs are splitted. I don't know how does the=20
> decompression=20
> > factor works, because the kernel image is already decompressed. In this=
=20
> context=20
> > what value must i place on kernel decomposition factor?=20
> >=20
>
> On ARM, the kernel is always compressed. It decompresses itself on=20
> startup, and=20
> for that it needs some extra space. We estimate that by taking the kernel=
=20
> image=20
> size 4 times and add that as decompression space after the kernel image.=
=20
> The=20
> initramfs is placed after that.=20
>
> However, the placement logic in jailhouse-cell-linux is simplistic: It=20
> only=20
> searches for a single region that can hold both kernel image, kernel=20
> decompression space, dtb and initramfs together. Spreading those over=20
> multiple=20
> regions like you created is not supported. You could either rearrange you=
r=20
> regions to form one (if you do not depend on DMA in the second Linux cell=
,=20
> you=20
> can use virt!=3Dphys memory regions as well), reduce the size of your=20
> initramfs or=20
> use nfs as filesystem for the second Linux.=20
>
> Jan=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a5b27da1-b2aa-4ce0-863f-d9503a22b886%40googlegroups.com.

------=_Part_7986_1754567173.1564230847653
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I reduced the kernel image to 90MB and the initramfs to 80=
MB. In the non root cell config file, i declared a memory region with size =
0x5fff000 (~1.45GB) (send in attachment), and even when i issue &quot;jailh=
ouse cell linux ultra96-linux-demo.cell Image -d inmate-zynqmp-zcu102-2.dtb=
 -i rootfs.cpio -c &quot;console=3DttyS0, 115200&quot; -k 4&quot;, it still=
 gives me the error of no space found to load all images.<br><br>s=C3=A1bad=
o, 27 de Julho de 2019 =C3=A0s 07:23:24 UTC+1, Jan Kiszka escreveu:<blockqu=
ote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left=
: 1px #ccc solid;padding-left: 1ex;">On 26.07.19 21:04, Jo=C3=A3o Reis wrot=
e:
<br>&gt; The kernel and initramfs are splitted. I don&#39;t know how does t=
he decompression
<br>&gt; factor works, because the kernel image is already decompressed. In=
 this context
<br>&gt; what value must i place on kernel decomposition factor?
<br>&gt;
<br>
<br>On ARM, the kernel is always compressed. It decompresses itself on star=
tup, and
<br>for that it needs some extra space. We estimate that by taking the kern=
el image
<br>size 4 times and add that as decompression space after the kernel image=
. The
<br>initramfs is placed after that.
<br>
<br>However, the placement logic in jailhouse-cell-linux is simplistic: It =
only
<br>searches for a single region that can hold both kernel image, kernel
<br>decompression space, dtb and initramfs together. Spreading those over m=
ultiple
<br>regions like you created is not supported. You could either rearrange y=
our
<br>regions to form one (if you do not depend on DMA in the second Linux ce=
ll, you
<br>can use virt!=3Dphys memory regions as well), reduce the size of your i=
nitramfs or
<br>use nfs as filesystem for the second Linux.
<br>
<br>Jan
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a5b27da1-b2aa-4ce0-863f-d9503a22b886%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/a5b27da1-b2aa-4ce0-863f-d9503a22b886%40googlegroups.com<=
/a>.<br />

------=_Part_7986_1754567173.1564230847653--

------=_Part_7985_115819774.1564230847653
Content-Type: text/x-csrc; charset=UTF-8; name=ultra96-linux-demo2.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ultra96-linux-demo2.c
X-Attachment-Id: 30075f2d-8ebc-483e-bd41-4d2f8181b2dc
Content-ID: <30075f2d-8ebc-483e-bd41-4d2f8181b2dc>

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
=09=090xe, //1110
=09=09//0x8, //1000 - fica com cpu3
=09=09//0xc, //1100
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
=09=09=09.phys_start =3D 0,
=09=09=09.virt_start =3D 0,
=09=09=09.size =3D 0x5fff0000, //must be page size aligned
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE ,/*| JAILHOUSE_MEM_LOADABLE |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED, *///se tirar JAILHOUSE_MEM_ROOTSHARED=
 da exception fault 0x20
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x7bef0000,
=09=09=09.virt_start =3D 0x7bef0000,
=09=09=09.size =3D 0x10000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE,// | JAILHOUSE_MEM_LOADABLE,
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x74000000,
=09=09=09.virt_start =3D 0x74000000,
=09=09=09.size =3D 0x7ef0000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,/* |
=09=09=09=09JAILHOUSE_MEM_LOADABLE,*/
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
=09=09},
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

------=_Part_7985_115819774.1564230847653--
