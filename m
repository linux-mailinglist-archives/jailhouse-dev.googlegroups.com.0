Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBYOM43UQKGQEBVMNYTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BCC74E91
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 14:53:54 +0200 (CEST)
Received: by mail-ot1-x33e.google.com with SMTP id l7sf27358106otj.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ef/ZPOmLc1bhsE97YBldqGO9Fqi9ULumQKH7n69kUBk=;
        b=nxrexFzkWAajk1PLBK6DL+4nQb5LaDklWf6s0MgeO8Q2Ng2qExv3EIOU9Ti8K+dIGB
         lHKtnIaf4UrKWjSD+sGH5u67lh0wEYmdG9F3f1KmhgpDD1yflzATSUlxMei20JtCdBU/
         e6w1fKK4SlJngWGQa3W9DKj69vtPOU647MFVc2VpBvDSggcpw6plTDRsaRk85G0OWc68
         SoFQE6AyIdu9lrgZSZ1WdWaDZG1dzAAQIGlEr5FoLDG5ayfTGGZbh55tw55e/Yz49N6j
         PmX4z+SSaszbgokudy+XAPPWVnf7eQFHEMhZoqPl/fu4t29HOvK++yHILm+p9s3coCbs
         QCKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ef/ZPOmLc1bhsE97YBldqGO9Fqi9ULumQKH7n69kUBk=;
        b=VOQ889jQa+mwvErDP1fRSt0LvvC6mjE8J/oNWD4g+wGYZVUHJdKukBa4AVIb5Q5/mb
         qaSYvzr3iKjUx6K/eN7xDLWmyBxGrarKdSy0B9ceuV5b04cCD2afYjzGzHtXdd/2Rila
         E3vgA1l63EXZ0Gmly/KBXuzs5INzgcM08po0x3zpYNXI8ZWsJK2Keh3tDK1HyrxgpuNp
         zmB+KuCHJmQ+9kvnenOGW3J90wYR/4+ZlDb2zVfbRLRqba7WJw5IVi0ZIo7hwkMOUJyS
         wCkE8VhaLI8f+q4vOTckMqDg++N/56M9k4OMNZsPaaRfbBWPacwrYdUxrAg3E86yKDWq
         KvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Ef/ZPOmLc1bhsE97YBldqGO9Fqi9ULumQKH7n69kUBk=;
        b=pWuIjnvTpOZJ/VIG05PNWmE6AczXMfSOhonEStLmWxpViviXPPeM4Hp6laSNOBNW2u
         8gNYXxlnLP17868QJ6gYMQXt79pyVQ234RGJJaSn3B6IoefQEtkTy9EtW9IgOQPqaNW6
         NLqvWadOAfoqkSsLCDzASp6FjovZXtvT4aMOXJJAoSqbQxb0uRKDKeBijurMAQr1Ir5i
         4bfgTUBsaF6Lgz/h2TgQBibdxZnRiXef/JPbnHAv8bSYCtVarifR/casqYJ/2EmpFZqA
         nfLJhuBJ4nV2U8KbhQ++mjEcXcyR+FOgTchkll0NL93Wy7GVMw8NKzQ+zzb8gr2Ivm2A
         MGjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUF7tScvKSkb1CMBa8PYIQugA1RxlMxKKkzlOwrd81EwL6v/Whm
	6ik1hQbx1YVnWR7Sfbe447g=
X-Google-Smtp-Source: APXvYqw8TCl+5L40++9WVSg8oEL70xuLZE7/YsuS4SiOKcW8Td7fCK21WY9a4OPDqE/jL7qY7p96sw==
X-Received: by 2002:a9d:6194:: with SMTP id g20mr12364845otk.149.1564059233506;
        Thu, 25 Jul 2019 05:53:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:17e9:: with SMTP id j96ls513588otj.12.gmail; Thu, 25 Jul
 2019 05:53:53 -0700 (PDT)
X-Received: by 2002:a9d:7dd9:: with SMTP id k25mr39557017otn.350.1564059232763;
        Thu, 25 Jul 2019 05:53:52 -0700 (PDT)
Date: Thu, 25 Jul 2019 05:53:51 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
In-Reply-To: <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6853_602673622.1564059232050"
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

------=_Part_6853_602673622.1564059232050
Content-Type: multipart/alternative; 
	boundary="----=_Part_6854_1406458226.1564059232050"

------=_Part_6854_1406458226.1564059232050
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Even when i set all RAM regions to non rootshared, the problem continues=20
(send in attachment the newly adjusted config file). Is the linux image=20
that i am using too big (1,2GB)? I've generated the image using the steps=
=20
described on setup-on-zynqmp-zcu102.md (Testing Jailhouse Linux).


quinta-feira, 25 de Julho de 2019 =C3=A0s 11:00:36 UTC+1, Jan Kiszka escrev=
eu:
>
> On 25.07.19 11:32, Jo=C3=A3o Reis wrote:=20
> > Hello,=20
> >=20
> > I'm trying to apply cache coloring to Linux and Erika. As root cell=20
> Linux cannot=20
> > be colored, i intend to use colored Linux in a non-root cell and colore=
d=20
> Erika=20
> > in another non-root cell (the system stays as: Linux in root cell, Linu=
x=20
> and=20
> > Erika in non-root cells).=20
> >=20
> > The problem that is occuring to me is when i issue the command:=20
> jailhouse cell=20
> > linux ultra96-linux-demo.cell Image -i rootfs.cpio -c "console=3DttyS0,=
=20
> 115200"=20
> >=20
> > The error is the following:=20
> >=20
> > root@xilinx-ultra96-reva-2018_2:~# jailhouse cell linux=20
> ultra96-linux-demo.cell=20
> > Image -d inmate-zynqmp-zcu102-2.dtb -i rootfs.cpio -c "console=3DttyS0,=
=20
> 115200"=20
> > [  127.150370] python invoked oom-killer:=20
> > gfp_mask=3D0x16080c0(GFP_KERNEL|__GFP_ZERO|__GFP_NOTRACK),=20
> nodemask=3D(null), =20
> > order=3D0, oom_score_adj=3D0=20
>
> Looks like your inmate configuration grants too little memory for the=20
> Linux=20
> guest. Note that the in-tree configs may only be happily used with very=
=20
> small=20
> Linux images, just as the buildroot we generate via jailhouse-images.=20
>
> Looking at your config...=20
>
>         /* RAM */ {=20
>                 .phys_start =3D 0x74000000,=20
>                 .virt_start =3D 0x74000000,=20
>                 .size =3D 0x7ef0000,=20
>                 .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=20
>                         JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |=20
>                         JAILHOUSE_MEM_LOADABLE,=20
>         },=20
>
> This one is fine and will be available to the guest.=20
>
>         /* RAM */{=20
>                 .phys_start =3D 0x3fd00000,=20
>                 .virt_start =3D 0x3fd00000,=20
>                 .size =3D 0x202f0000, //must be page size aligned=20
>                 .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=20
>                         JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |=
=20
>                         JAILHOUSE_MEM_ROOTSHARED, //se tirar=20
> JAILHOUSE_MEM_ROOTSHARED da exception=20
> fault 0x20=20
>         },=20
>
> This one isn't because it shares RAM with the root cell that is probably=
=20
> not=20
> intended to be shared. But it will also not be presented as RAM to the=20
> non-root=20
> cell (via the devices tree) because of the ROOTSHARED tag.=20
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
jailhouse-dev/320981f3-9d93-46c5-b95f-ddb68083f7ee%40googlegroups.com.

------=_Part_6854_1406458226.1564059232050
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Even when i set all RAM regions to non rootshared, the pro=
blem continues (send in attachment the newly adjusted config file). Is the =
linux image that i am using too big (1,2GB)? I&#39;ve generated the image u=
sing the steps described on=C2=A0setup-on-zynqmp-zcu102.md (<span style=3D"=
font-size: small; color: rgb(36, 41, 46); font-family: -apple-system, Blink=
MacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Ap=
ple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&qu=
ot;;">Testing Jailhouse Linux).</span><div><br></div><br>quinta-feira, 25 d=
e Julho de 2019 =C3=A0s 11:00:36 UTC+1, Jan Kiszka escreveu:<blockquote cla=
ss=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #=
ccc solid;padding-left: 1ex;">On 25.07.19 11:32, Jo=C3=A3o Reis wrote:
<br>&gt; Hello,
<br>&gt;=20
<br>&gt; I&#39;m trying to apply cache coloring to Linux and Erika. As root=
 cell Linux cannot
<br>&gt; be colored, i intend to use colored Linux in a non-root cell and c=
olored Erika
<br>&gt; in another non-root cell (the system stays as: Linux in root cell,=
 Linux and
<br>&gt; Erika in non-root cells).
<br>&gt;=20
<br>&gt; The problem that is occuring to me is when i issue the command: ja=
ilhouse cell
<br>&gt; linux ultra96-linux-demo.cell Image -i rootfs.cpio -c &quot;consol=
e=3DttyS0, 115200&quot;
<br>&gt;=20
<br>&gt; The error is the following:
<br>&gt;=20
<br>&gt; root@xilinx-ultra96-reva-2018_<wbr>2:~# jailhouse cell linux ultra=
96-linux-demo.cell
<br>&gt; Image -d inmate-zynqmp-zcu102-2.dtb -i rootfs.cpio -c &quot;consol=
e=3DttyS0, 115200&quot;
<br>&gt; [=C2=A0 127.150370] python invoked oom-killer:
<br>&gt; gfp_mask=3D0x16080c0(GFP_KERNEL|<wbr>__GFP_ZERO|__GFP_NOTRACK), no=
demask=3D(null),=C2=A0
<br>&gt; order=3D0, oom_score_adj=3D0
<br>
<br>Looks like your inmate configuration grants too little memory for the L=
inux
<br>guest. Note that the in-tree configs may only be happily used with very=
 small
<br>Linux images, just as the buildroot we generate via jailhouse-images.
<br>
<br>Looking at your config...
<br>
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* RAM */ {
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.phys_start =3D 0x74000000,
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.virt_start =3D 0x74000000,
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.size =3D 0x7ef0000,
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WR=
ITE |
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
<wbr>JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
<wbr>JAILHOUSE_MEM_LOADABLE,
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
<br>
<br>This one is fine and will be available to the guest.
<br>
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* RAM */{
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.phys_start =3D 0x3fd00000,
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.virt_start =3D 0x3fd00000,
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.size =3D 0x202f0000, //must be page size aligne=
d
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WR=
ITE |
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
<wbr>JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
<wbr>JAILHOUSE_MEM_ROOTSHARED, //se tirar JAILHOUSE_MEM_ROOTSHARED da excep=
tion
<br>fault 0x20
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
<br>
<br>This one isn&#39;t because it shares RAM with the root cell that is pro=
bably not
<br>intended to be shared. But it will also not be presented as RAM to the =
non-root
<br>cell (via the devices tree) because of the ROOTSHARED tag.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b95f-ddb68083f7ee%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/320981f3-9d93-46c5-b95f-ddb68083f7ee%40googlegroups.com<=
/a>.<br />

------=_Part_6854_1406458226.1564059232050--

------=_Part_6853_602673622.1564059232050
Content-Type: text/x-csrc; charset=UTF-8; name=ultra96-linux-demo.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ultra96-linux-demo.c
X-Attachment-Id: 9ab1201d-7be7-4689-82e2-b0512da0dbab
Content-ID: <9ab1201d-7be7-4689-82e2-b0512da0dbab>

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
=09=09=09.phys_start =3D 0x7bef0000,
=09=09=09.virt_start =3D 0,
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
=09=09/* RAM */{
=09=09=09.phys_start =3D 0x3fd00000,
=09=09=09.virt_start =3D 0x3fd00000,
=09=09=09.size =3D 0x202f0000, //must be page size aligned
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,/* |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED, *///se tirar JAILHOUSE_MEM_ROOTSHARED=
 da exception fault 0x20
=09=09},
=09=09{
=09=09=09.phys_start =3D 0,
=09=09=09.virt_start =3D 0x10000,
=09=09=09.size =3D 0x3ed00000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE|
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,/* |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED,*/
=09=09},
=09},

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
=09=09=09.shmem_region =3D 3,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_CUSTOM,
=09=09=09.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
=09=09=09//.num_msix_vectors =3D 1,
=09=09},
=09},
};

------=_Part_6853_602673622.1564059232050--
