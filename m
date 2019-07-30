Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBB6S73UQKGQEODNDAHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id E437979E8E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 04:18:48 +0200 (CEST)
Received: by mail-oi1-x239.google.com with SMTP id u200sf24130148oia.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 19:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=njC3sIRpvrPUDWoE27mj2mp22n4a9CNUYh7CARgWK2M=;
        b=dnFYyUDvV+LzMnofYk+H+4Ns0mYa2XoMYbTU+4fvLpgZ8DYJUYu5VqnNMIBqZCa7BQ
         7Ez1TOjlbA4vy856QG5+1QQ8Fy9O70kYPWZbsy+GF4kHoKlthiBJ7BLnimge939njSs6
         Tcwylr9wR0SUK/tuLwViLPPuWnFTgp+EXzfo0RwwiWxMrjyeNy4xG5Ihvi1/4wa/C+JZ
         DRdtZk/42J62U+Uy10ZypnO6d82L76+OntP4bJ70EuP8TS8AMYf+WexEkTubqrJyMMvS
         z0LSqF/AVXL+XNfW+X6xg5LQaXcLMM6yncLHvnPMUfkd8Z7OfBu1zOoBcV41FCgsZ0t8
         Dqjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=njC3sIRpvrPUDWoE27mj2mp22n4a9CNUYh7CARgWK2M=;
        b=hv2eas8ydrriCHvc1SHze3amgOYbkhCgydlOv7R0cEqL9PYX5m+UMx6Uh2Qa99hOXD
         1xHb0gj/UKqW2DIarXQgikX0fyA7ZtLxeVU5Ig1or/darKjhFuP5vqnhbga1Kc38861c
         kz4WY2OyeG3YBoHWNIGod/zZwKwHCUIMl+OfvBwLwYGAneJYATAe4Xeoigr07xc6NGvU
         tbIrPC8NBux5YNG2BNKoqFnM2bZRl2yxsKe5lTbdNk0Od2GFROXpNs5rPn5gpM2xJHU8
         6o/yPCVt8MrtGlYYxeYHL59oUiBM89vkUU3YulWZmPBXHGl09wcN/58zE1THqoB0myOy
         1P2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=njC3sIRpvrPUDWoE27mj2mp22n4a9CNUYh7CARgWK2M=;
        b=dAjMCxnxWYGrLLWCR0sOfnPI9Pl2Cbq7x/bE+YGkcWCfJAa9jncyxfsRAK5jKt97nR
         yXPlcjg0ZjfYZ65EfHn0Ei51JeaD8RqICohHzrNsDTjinZGLo00TEhoLsKSGoHFDm68/
         xU5asjElddlp3AaxoqWQmV8Z/X2hhHTjvITPpdJatFf7eOzhlYJjBBbaxF5pgzS8Qh5L
         7Jsp2JGnR/iMCpB3/NGLEdeuG0AYFTcgmuoYv4pitg68urhDj3QR5/o2/dh7FJFkjtO5
         AniRGL23Joa8awxaDNGHvc7pdJvIUJ3KhaGF67ChR71QxVtir6++f7jwifJg9Tt/7cu1
         l1UQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVEzDxOBDIjOTg0rwKMkctKuyfUQ/Tz3PiZpvra9wxCx0RQEOlQ
	bMjOrY/ffZOb+Z9D+Bv7+fw=
X-Google-Smtp-Source: APXvYqzx+8eFpr+JSSBkp1W/ySmArCRLRCd4Vi9yTj6W9Yzu0THp/j5Gv9WWoGchdwFDvBprnu2GSQ==
X-Received: by 2002:aca:cfd0:: with SMTP id f199mr8635356oig.50.1564453127781;
        Mon, 29 Jul 2019 19:18:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:2489:: with SMTP id z9ls3071555ota.9.gmail; Mon, 29 Jul
 2019 19:18:47 -0700 (PDT)
X-Received: by 2002:a9d:3f62:: with SMTP id m89mr86745649otc.44.1564453127069;
        Mon, 29 Jul 2019 19:18:47 -0700 (PDT)
Date: Mon, 29 Jul 2019 19:18:46 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e5c36ed1-98a5-4a76-aca0-6589cf9c3108@googlegroups.com>
In-Reply-To: <4f76dc91-7542-40b8-a0d9-eea52e1dd92a@siemens.com>
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
 <edf7dab3-2c32-43bb-b13b-fce8bc452418@googlegroups.com>
 <4f76dc91-7542-40b8-a0d9-eea52e1dd92a@siemens.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8484_1795940902.1564453126381"
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

------=_Part_8484_1795940902.1564453126381
Content-Type: multipart/alternative; 
	boundary="----=_Part_8485_1877455494.1564453126381"

------=_Part_8485_1877455494.1564453126381
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, that's it. But now, another error related to that memory region appears=
:

FATAL: instruction abort at 0x4fffe1d0
FATAL: forbidden access (exception class 0x20)
Cell state before exception:
 pc: ffffff80080971d0   lr: ffffff8008768e14 spsr: 600001c5     EL1
 sp: ffffff8008e73ea0  esr: 20 1 0000086
 x0: ffffffc04d2b7a00   x1: ffffffc04cff6000   x2: 0000000000000000
 x3: ffffff8008768de0   x4: 0000000000000015   x5: 00ffffffffffffff
 x6: 0000000029382596   x7: 0000000000000f94   x8: ffffffc04ff79404
 x9: 00000000000007df  x10: ffffffc04ff793e4  x11: 0000000000001dd8
x12: 0000000000000000  x13: 00000000000094e5  x14: 071c71c71c71c71c
x15: ffffff8008e78000  x16: ffffff800819b1e8  x17: 0000007fa7da3718
x18: ffffffc04ff7a460  x19: ffffffc04cff6000  x20: ffffffc04cff6018
x21: ffffffc04d2b7a00  x22: 0000000000000000  x23: ffffffc04cff6000
x24: 00000009ed76160a  x25: ffffffc04cff6000  x26: ffffff8008e82100
x27: 0000000000000400  x28: 0000000000df0018  x29: ffffff8008e73ea0

The error happens in an address within the memory region i want to put the=
=20
Linux images (3fd00000-5fffffff : System RAM), and that i declared on the=
=20
config file.


segunda-feira, 29 de Julho de 2019 =C3=A0s 21:53:59 UTC+1, Jan Kiszka escre=
veu:
>
> On 29.07.19 21:51, Jo=C3=A3o Reis wrote:=20
> > Yeah, i forgot to set the flag and the .dtb file i was using wasn't the=
=20
> right=20
> > one (now i am using inmate-zynqmp.dts). But even when i set the flag, i=
t=20
> still=20
> > gives me the same error.=20
> > Send here the output of /proc/iomem:=20
> >=20
> > 00000000-3ecfffff : System RAM=20
> >   00080000-00deffff : Kernel code=20
> >   00e70000-01134fff : Kernel data=20
> > 3ed00000-3ed3ffff : 3ed00000.ddr=20
> > 3fd00000-5fffffff : System RAM=20
> > 7c000000-7c3fffff : Jailhouse hypervisor=20
> > fc000000-fc0fffff : PCI ECAM=20
> > fc100000-fc101fff : //pci@0=20
> >   fc100000-fc1000ff : 0000:00:00.0=20
> >=20
> > And the config as it is now in attachment.=20
>
> If you look at tools/jailhouse-cell-linux, you can see the conditions=20
> for considering a region as loadable RAM:=20
>
> class ARMCommon:=20
>     def setup(self, args, config):=20
>         [...]=20
>         for region in config.memory_regions:=20
>             # Filter out non-RAM regions and small ones at the start of=
=20
> the=20
>             # cell address space that is used for the loader.=20
>             if region.is_ram() and \=20
>                (region.virt_start > 0 or region.size > 0x10000):=20
>
>
> class MemoryRegion:=20
>     [...]=20
>     def is_ram(self):=20
>         return ((self.flags & (MemoryRegion.JAILHOUSE_MEM_READ |=20
>                                MemoryRegion.JAILHOUSE_MEM_WRITE |=20
>                                MemoryRegion.JAILHOUSE_MEM_EXECUTE |=20
>                                MemoryRegion.JAILHOUSE_MEM_DMA |=20
>                                MemoryRegion.JAILHOUSE_MEM_IO |=20
>                                MemoryRegion.JAILHOUSE_MEM_COMM_REGION |=
=20
>                                MemoryRegion.JAILHOUSE_MEM_ROOTSHARED)) =
=3D=3D=20
>                 (MemoryRegion.JAILHOUSE_MEM_READ |=20
>                  MemoryRegion.JAILHOUSE_MEM_WRITE |=20
>                  MemoryRegion.JAILHOUSE_MEM_EXECUTE |=20
>                  MemoryRegion.JAILHOUSE_MEM_DMA))=20
>
> Means, you are missing "MEM_DMA".=20
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
jailhouse-dev/e5c36ed1-98a5-4a76-aca0-6589cf9c3108%40googlegroups.com.

------=_Part_8485_1877455494.1564453126381
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, that&#39;s it. But now, another error related to that =
memory region appears:<div><br></div><div><div>FATAL: instruction abort at =
0x4fffe1d0</div><div>FATAL: forbidden access (exception class 0x20)</div><d=
iv>Cell state before exception:</div><div>=C2=A0pc: ffffff80080971d0=C2=A0 =
=C2=A0lr: ffffff8008768e14 spsr: 600001c5=C2=A0 =C2=A0 =C2=A0EL1</div><div>=
=C2=A0sp: ffffff8008e73ea0=C2=A0 esr: 20 1 0000086</div><div>=C2=A0x0: ffff=
ffc04d2b7a00=C2=A0 =C2=A0x1: ffffffc04cff6000=C2=A0 =C2=A0x2: 0000000000000=
000</div><div>=C2=A0x3: ffffff8008768de0=C2=A0 =C2=A0x4: 0000000000000015=
=C2=A0 =C2=A0x5: 00ffffffffffffff<br></div><div>=C2=A0x6: 0000000029382596=
=C2=A0 =C2=A0x7: 0000000000000f94=C2=A0 =C2=A0x8: ffffffc04ff79404<br></div=
><div>=C2=A0x9: 00000000000007df=C2=A0 x10: ffffffc04ff793e4=C2=A0 x11: 000=
0000000001dd8<br></div><div>x12: 0000000000000000=C2=A0 x13: 00000000000094=
e5=C2=A0 x14: 071c71c71c71c71c<br></div><div>x15: ffffff8008e78000=C2=A0 x1=
6: ffffff800819b1e8=C2=A0 x17: 0000007fa7da3718<br></div><div>x18: ffffffc0=
4ff7a460=C2=A0 x19: ffffffc04cff6000=C2=A0 x20: ffffffc04cff6018<br></div><=
div>x21: ffffffc04d2b7a00=C2=A0 x22: 0000000000000000=C2=A0 x23: ffffffc04c=
ff6000<br></div><div>x24: 00000009ed76160a=C2=A0 x25: ffffffc04cff6000=C2=
=A0 x26: ffffff8008e82100<br></div><div>x27: 0000000000000400=C2=A0 x28: 00=
00000000df0018=C2=A0 x29: ffffff8008e73ea0<br></div><div><br></div><div>The=
 error happens in an address within the memory region i want to put the Lin=
ux images (3fd00000-5fffffff : System RAM), and that i declared on the conf=
ig file.</div><div><br></div><br>segunda-feira, 29 de Julho de 2019 =C3=A0s=
 21:53:59 UTC+1, Jan Kiszka escreveu:<blockquote class=3D"gmail_quote" styl=
e=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left:=
 1ex;">On 29.07.19 21:51, Jo=C3=A3o Reis wrote:
<br>&gt; Yeah, i forgot to set the flag and the .dtb file i was using wasn&=
#39;t the right
<br>&gt; one (now i am using inmate-zynqmp.dts). But even when i set the fl=
ag, it still
<br>&gt; gives me the same error.
<br>&gt; Send here the output of /proc/iomem:
<br>&gt;=20
<br>&gt; 00000000-3ecfffff : System RAM
<br>&gt; =C2=A0 00080000-00deffff : Kernel code
<br>&gt; =C2=A0 00e70000-01134fff : Kernel data
<br>&gt; 3ed00000-3ed3ffff : 3ed00000.ddr
<br>&gt; 3fd00000-5fffffff : System RAM
<br>&gt; 7c000000-7c3fffff : Jailhouse hypervisor
<br>&gt; fc000000-fc0fffff : PCI ECAM
<br>&gt; fc100000-fc101fff : //pci@0
<br>&gt; =C2=A0 fc100000-fc1000ff : 0000:00:00.0
<br>&gt;=20
<br>&gt; And the config as it is now in attachment.
<br>
<br>If you look at tools/jailhouse-cell-linux, you can see the conditions
<br>for considering a region as loadable RAM:
<br>
<br>class ARMCommon:
<br>=C2=A0 =C2=A0 def setup(self, args, config):
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 [...]
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 for region in config.memory_regions:
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Filter out non-RAM regions =
and small ones at the start of the
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # cell address space that is =
used for the loader.
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if region.is_ram() and \
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(region.virt_sta=
rt &gt; 0 or region.size &gt; 0x10000):
<br>
<br>
<br>class MemoryRegion:
<br>=C2=A0 =C2=A0 [...]
<br>=C2=A0 =C2=A0 def is_ram(self):
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ((self.flags &amp; (MemoryRegion.JAI=
LHOUSE_MEM_<wbr>READ |
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegion.JAILHOUSE_MEM_<wbr>WR=
ITE |
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegion.JAILHOUSE_MEM_<wbr>EX=
ECUTE |
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegion.JAILHOUSE_MEM_<wbr>DM=
A |
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegion.JAILHOUSE_MEM_IO |
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegion.JAILHOUSE_MEM_<wbr>CO=
MM_REGION |
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegion.JAILHOUSE_MEM_<wbr>RO=
OTSHARED)) =3D=3D
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (MemoryRegion.J=
AILHOUSE_MEM_<wbr>READ |
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryReg=
ion.JAILHOUSE_MEM_<wbr>WRITE |
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryReg=
ion.JAILHOUSE_MEM_<wbr>EXECUTE |
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryReg=
ion.JAILHOUSE_MEM_<wbr>DMA))
<br>
<br>Means, you are missing &quot;MEM_DMA&quot;.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e5c36ed1-98a5-4a76-aca0-6589cf9c3108%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/e5c36ed1-98a5-4a76-aca0-6589cf9c3108%40googlegroups.com<=
/a>.<br />

------=_Part_8485_1877455494.1564453126381--

------=_Part_8484_1795940902.1564453126381--
