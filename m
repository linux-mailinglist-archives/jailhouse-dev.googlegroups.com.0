Return-Path: <jailhouse-dev+bncBCR7PPMN34DRB2VDU7VAKGQELXHEZYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A0B83978
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Aug 2019 21:15:56 +0200 (CEST)
Received: by mail-oi1-x237.google.com with SMTP id i6sf35739677oib.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 06 Aug 2019 12:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kadLbkUDPa9XVJexpPcoSYJKCtELVSsq/TtAw27TOss=;
        b=D8ti+mLExjnmVNLOJJsOULxG5fEFmHvI8R0+qExaXoyjHc29vB1+NFrcJtBNz4WLML
         kyk9czrI4vkoQrO+7S6ye+E04KF4KIek9iaQWLh7OPUcX9EStQDErCBbOjCkVgaEbWXC
         642OxXLVqO8Jj2RdFSiOHn5SwKR5P4jpnusJ/hFwNXvVknG/bBsbyhIs+NDhTe/9bPmm
         Z3tPaii9yRYPxAReDxwtXEDmZCK4X5DFe+GySIcEje7VaAXU0pKqslKJpbbPN5TlOkKN
         G0DHPOER3fI6FpxKSjQaxsqBZ9Kx0Y31fPVEvl5AatKEgZRZuC0R24gSIAGx0UtBtmkF
         K3Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kadLbkUDPa9XVJexpPcoSYJKCtELVSsq/TtAw27TOss=;
        b=uknpARHHlLo7gU/VbeH49gaZ9rV5prD0QfZQGEh8eSyU1zAmcthDusFQEkddXuWAKa
         Vc9+fcdwL9Qamjd5IjWdlQqnrW4fF0Tn5yEA4/U1ZSEEaZteufGum1Wz0GgJ/+eRZvRC
         c6XpFDo+CnIu1gt9TFxpTeb1UwEeDoOOZxsNsQqNl9G/aDoWwoE0DdC3AihpkzCXcIoE
         e2xoKiByQRGjacKVS2cUyjc6QuiqAI4fDeNKjgYCjxJLFIfmV9ZXyo7QO4/82N6sAbG+
         4oalwgBVhi52R+ioDBMb8NpEoBU/RZkYr5r/Mur9DfLXP9dttMX07CWNePpm07DMR/nX
         HcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kadLbkUDPa9XVJexpPcoSYJKCtELVSsq/TtAw27TOss=;
        b=mOrD0VcUzbYGaQqfWQ4sFEOLNvNlvPvv9/yQoijlQiwB0DunDTlmckkmVOoge5Ctbv
         PVLeyrw4s7NQAub41w5YOtkGnn4o3ErrVU708vysqDCICUHBo8ISkeBuQ452l5yQzaWa
         jZWWCSn6NAjsTkUNSVFy34/wAjg6lfvxwanYqQF+4F4ryhhTbWhXk5isLgysq2ng31WZ
         Fh7VituV/gNhJVPD4fD1y/Y0FiEvCCOU5EpZuTtfRUlWLbC5EyjKTYVqqjd4KMb2R8n2
         4iUzWVo0eNN7laRAFd06kGBhvcYnh+pBWQfCGUpMSw6NyuZfUabr9OVYmhYNQC1qLEos
         wQCg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUL2LwNSt01tzPMGZdNJGUt4AJs6TEkBoN56+5eIH1nYU0A4uJE
	7jL3E6L042UbP7B5265ohIw=
X-Google-Smtp-Source: APXvYqzkP0jZD6GwRXHLEXFZWdwv6Vy/JL3KpLu7nP2yC3piZy1iDL8/INJz1O6uA2y4WCi7DWGyaA==
X-Received: by 2002:aca:c4d5:: with SMTP id u204mr2564303oif.131.1565118954864;
        Tue, 06 Aug 2019 12:15:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:8e5:: with SMTP id d5ls942933oic.9.gmail; Tue, 06
 Aug 2019 12:15:54 -0700 (PDT)
X-Received: by 2002:aca:cc49:: with SMTP id c70mr3649897oig.174.1565118953853;
        Tue, 06 Aug 2019 12:15:53 -0700 (PDT)
Date: Tue, 6 Aug 2019 12:15:53 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <df6ad060-826f-48fa-b5a9-d5fa883c3629@googlegroups.com>
In-Reply-To: <211c06d2-9f92-cbd1-8215-12c577eefa62@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <edf7dab3-2c32-43bb-b13b-fce8bc452418@googlegroups.com>
 <4f76dc91-7542-40b8-a0d9-eea52e1dd92a@siemens.com>
 <e5c36ed1-98a5-4a76-aca0-6589cf9c3108@googlegroups.com>
 <ef7a124c-e5e3-f61b-8ed0-aebf585c65d6@siemens.com>
 <dde1cd0e-407e-45b3-ae32-97c445100824@googlegroups.com>
 <2f6c0983-78e1-73e0-183c-3983dd757ee8@siemens.com>
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
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2360_499159460.1565118953280"
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

------=_Part_2360_499159460.1565118953280
Content-Type: multipart/alternative; 
	boundary="----=_Part_2361_2028309579.1565118953282"

------=_Part_2361_2028309579.1565118953282
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, i've commented uart0 part from .dts and it can load now the=20
non-root cell linux!

segunda-feira, 5 de Agosto de 2019 =C3=A0s 12:05:09 UTC+1, Jan Kiszka escre=
veu:
>
> On 05.08.19 12:00, Jo=C3=A3o Reis wrote:=20
> > Ok, so i've increased non-root cell's RAM memory region by 256MB (now i=
t=20
> starts=20
> > from 0x50000000), and changed the reserved memory for hypervisor and=20
> non-root=20
> > cells (on u-boot: mem=3D1280M, which is equal to 0x50000000 bytes).=20
>
> OK, good.=20
>
> >=20
> > It can load the cell, and when it starts it gives me an error related t=
o=20
> UART0 (?):=20
> >=20
> > [   62.493128] Created Jailhouse cell "non-root"=20
> > Cell "non-root" can be loaded=20
> > Started cell "non-root"=20
> > Unhandled data read at 0xff000024(4)=20
>
> If you advertise UART0 to the non-root cell via the inmate device tree,=
=20
> you will=20
> get such an access. Are you doing that? The device trees we ship in=20
> Jailhouse=20
> use UART1.=20
>
> Jan=20
>
> > FATAL: unhandled trap (exception class 0x24)=20
> > Cell state before exception:=20
> >  pc: ffffff8008480448   lr: ffffff8008473a70 spsr: 80000085     EL1=20
> >  sp: ffffff800801b9e0  esr: 24 1 1830007=20
> >  x0: ffffff800d83c038   x1: 0000000000000000   x2: ffffff8008480440=20
> >  x3: ffffff8008011024   x4: 0000000000000000   x5: 0000000000000064=20
> >  x6: 0000000000000051   x7: 3030303035323620   x8: 7820612073692029=20
> >  x9: 2030535079747420  x10: 204f494d4d207461  x11: 3030303066667830=20
> > x12: 2071726928203030  x13: 736162202c35203d  x14: 3d20647561625f65=20
> > x15: ffffffffffffffff  x16: 0000000000000001  x17: 0000000000000001=20
> > x18: 0000000000000010  x19: ffffffc03a990000  x20: ffffff800d83c038=20
> > x21: ffffff800d6104c0  x22: ffffffc03a990100  x23: ffffff800d60e000=20
> > x24: 0000000000000000  x25: ffffffc03a99eb00  x26: ffffff8008959a38=20
> > x27: ffffffc03a99e600  x28: 0000000000000005  x29: ffffff800801b9e0=20
> > Parking CPU 2 (Cell: "non-root")=20
> >=20
> > segunda-feira, 5 de Agosto de 2019 =C3=A0s 07:30:59 UTC+1, Jan Kiszka=
=20
> escreveu:=20
> >=20
> >     On 02.08.19 21:46, Jo=C3=A3o Reis wrote:=20
> >     > I send in attachment the root cell (ultra96.c) and non root cell=
=20
> >     > (ultra96-linux-demo2.c) config files, along with the .dtb i am=20
> using.=20
> >     >=20
> >     > The Image and rootfs.cpio files occupy 89,9MB and 79,4MB,=20
> respectively.=20
> >     (link to=20
> >     > download them if you want to:=20
> >     > http://www.mediafire.com/folder/sopta5vdf01yfm8,kwk1yt5jc9zcpl3=
=20
> >     <http://www.mediafire.com/folder/sopta5vdf01yfm8,kwk1yt5jc9zcpl3>)=
=20
> >=20
> >     That's obviously too large for the remaining space in that region. =
I=20
> will=20
> >     try to=20
> >     reproduce in order to understand why the loader attempts this=20
> nevertheless.=20
> >     Meanwhile, you could try if expanding that region a bit more makes=
=20
> it work - or=20
> >     just moves the problem around.=20
> >=20
> >     Jan=20
> >=20
> >     >=20
> >     > sexta-feira, 2 de Agosto de 2019 =C3=A0s 08:28:52 UTC+1, Jan Kisz=
ka=20
> escreveu:=20
> >     >=20
> >     >     On 02.08.19 04:34, Jo=C3=A3o Reis wrote:=20
> >     >     > The value of arch.ramdisk_address() is 2062893056, converte=
d=20
> to=20
> >     >     hexadecimal is=20
> >     >     > 0x7AF54000, which is within the newly added RAM memory=20
> region that=20
> >     begins at=20
> >     >     > address 0x60000000.=20
> >     >     >=20
> >     >=20
> >     >     OK, and what' the size that shall be transferred here? Keep i=
n=20
> mind=20
> >     that there=20
> >     >     is only 0xF9C000 (16367616) left in that region. That=20
> information is=20
> >     part of=20
> >     >     the=20
> >     >     'load' structure JailhouseCell.load assembles. If that size i=
f=20
> too=20
> >     large, the=20
> >     >     driver will reject it. That would explain the error, not yet=
=20
> the=20
> >     reason for=20
> >     >     jailhouse-cell-linux to make that mistake.=20
> >     >=20
> >     >     If you share your configs, the kernel and dtb images and the=
=20
> >     information how=20
> >     >     large the initramfs is, I can try to reproduce that.=20
> >     >=20
> >     >     Jan=20
> >     >=20
> >     >     > quarta-feira, 31 de Julho de 2019 =C3=A0s 07:22:32 UTC+1, J=
an=20
> Kiszka=20
> >     escreveu:=20
> >     >     >=20
> >     >     >     On 31.07.19 02:40, Jo=C3=A3o Reis wrote:=20
> >     >     >     > Other thing i forgot was that on Ultrascale+ the RAM=
=20
> finishes=20
> >     at 2GB=20
> >     >     >     > (0x80000000), so i moved the memory region to=20
> 0x60000000, with a=20
> >     >     different=20
> >     >     >     size=20
> >     >     >     > to not overlap any other memory region.=20
> >     >     >     >=20
> >     >     >     > /* RAM */ {=20
> >     >     >     > .phys_start =3D 0x60000000,=20
> >     >     >     > .virt_start =3D 0x60000000,=20
> >     >     >     > .size =3D 0x1bef0000, //must be page size aligned=20
> >     >     >     > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=
=20
> >     >     >     > JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |=20
> >     >     >     > JAILHOUSE_MEM_DMA,=20
> >     >     >     > },=20
> >     >     >     >=20
> >     >     >     > But now it gives me the error on ramdisk_address:=20
> >     >     >     >=20
> >     >     >     > Traceback (most recent call last):=20
> >     >     >     >   File=20
> "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line=20
> >     >     831, in=20
> >     >     >     <module>=20
> >     >     >     >     cell.load(args.initrd.read(),=20
> arch.ramdisk_address())=20
> >     >     >     >   File=20
> >     "/usr/local/lib/python2.7/dist-packages/pyjailhouse/cell.py",=20
> >     >     line=20
> >     >     >     44, in=20
> >     >     >     > load=20
> >     >     >     >     fcntl.ioctl(self.dev <http://self.dev> <
> http://self.dev>=20
> >     <http://self.dev>,=20
> >     >     self.JAILHOUSE_CELL_LOAD, load)=20
> >     >     >     > IOError: [Errno 22] Invalid argument=20
> >     >     >     >=20
> >     >     >=20
> >     >     >     To make this a bit more systematic, I would recommend=
=20
> you to=20
> >     >     instrument the=20
> >     >     >     code, dump this address e.g., and match against what yo=
u=20
> think you=20
> >     >     configured.=20
> >     >     >=20
> >     >     >     Jan=20
> >     >     >=20
> >     >     >     --=20
> >     >     >     Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> >     >     >     Corporate Competence Center Embedded Linux=20
> >     >     >=20
> >     >     > --=20
> >     >     > You received this message because you are subscribed to the=
=20
> Google=20
> >     Groups=20
> >     >     > "Jailhouse" group.=20
> >     >     > To unsubscribe from this group and stop receiving emails=20
> from it,=20
> >     send an=20
> >     >     email=20
> >     >     > to jailho...@googlegroups.com <javascript:>=20
> >     >     > <mailto:jailhouse-dev+unsubscribe@googlegroups.com=20
> <javascript:> <javascript:>=20
> >     <javascript:>>.=20
> >     >     > To view this discussion on the web visit=20
> >     >     >=20
> >     >    =20
> >    =20
> https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c=
7cbdad1507c%40googlegroups.com=20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c=
7cbdad1507c%40googlegroups.com>=20
>
> >=20
> >     >    =20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c=
7cbdad1507c%40googlegroups.com=20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c=
7cbdad1507c%40googlegroups.com>>=20
>
> >=20
> >     >=20
> >     >     >=20
> >     >    =20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c=
7cbdad1507c%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c=
7cbdad1507c%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=20
>
> >=20
> >     >    =20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c=
7cbdad1507c%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c=
7cbdad1507c%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>>.=
=20
>
> >=20
> >     >=20
> >     >=20
> >     >     --=20
> >     >     Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> >     >     Corporate Competence Center Embedded Linux=20
> >     >=20
> >     > --=20
> >     > You received this message because you are subscribed to the Googl=
e=20
> Groups=20
> >     > "Jailhouse" group.=20
> >     > To unsubscribe from this group and stop receiving emails from it,=
=20
> send an=20
> >     email=20
> >     > to jailho...@googlegroups.com <javascript:>=20
> >     > <mailto:jailhouse-dev+unsubscribe@googlegroups.com <javascript:>=
=20
> <javascript:>>.=20
> >     > To view this discussion on the web visit=20
> >     >=20
> >    =20
> https://groups.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-a=
38e99a441d4%40googlegroups.com=20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-a=
38e99a441d4%40googlegroups.com>=20
>
> >=20
> >     >=20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-a=
38e99a441d4%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-a=
38e99a441d4%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.=20
>
> >=20
> >=20
> >=20
> >     --=20
> >     Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> >     Corporate Competence Center Embedded Linux=20
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> Groups=20
> > "Jailhouse" group.=20
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> an email=20
> > to jailho...@googlegroups.com <javascript:>=20
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com <javascript:>>.=20
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/82a56f53-a498-4a27-8458-2=
50d9a7e7078%40googlegroups.com=20
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/82a56f53-a498-4a27-8458-2=
50d9a7e7078%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20
>
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
jailhouse-dev/df6ad060-826f-48fa-b5a9-d5fa883c3629%40googlegroups.com.

------=_Part_2361_2028309579.1565118953282
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, i&#39;ve commented uart0 part from .dts and it can=
 load now the non-root cell linux!<div><br>segunda-feira, 5 de Agosto de 20=
19 =C3=A0s 12:05:09 UTC+1, Jan Kiszka escreveu:<blockquote class=3D"gmail_q=
uote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;pad=
ding-left: 1ex;">On 05.08.19 12:00, Jo=C3=A3o Reis wrote:
<br>&gt; Ok, so i&#39;ve increased non-root cell&#39;s RAM memory region by=
 256MB (now it starts
<br>&gt; from 0x50000000), and changed the reserved memory for hypervisor a=
nd non-root
<br>&gt; cells (on u-boot: mem=3D1280M, which is equal to 0x50000000 bytes)=
.
<br>
<br>OK, good.
<br>
<br>&gt;=20
<br>&gt; It can load the cell, and when it starts it gives me an error rela=
ted to UART0 (?):
<br>&gt;=20
<br>&gt; [=C2=A0 =C2=A062.493128] Created Jailhouse cell &quot;non-root&quo=
t;
<br>&gt; Cell &quot;non-root&quot; can be loaded
<br>&gt; Started cell &quot;non-root&quot;
<br>&gt; Unhandled data read at 0xff000024(4)
<br>
<br>If you advertise UART0 to the non-root cell via the inmate device tree,=
 you will
<br>get such an access. Are you doing that? The device trees we ship in Jai=
lhouse
<br>use UART1.
<br>
<br>Jan
<br>
<br>&gt; FATAL: unhandled trap (exception class 0x24)
<br>&gt; Cell state before exception:
<br>&gt; =C2=A0pc: ffffff8008480448=C2=A0 =C2=A0lr: ffffff8008473a70 spsr: =
80000085=C2=A0 =C2=A0 =C2=A0EL1
<br>&gt; =C2=A0sp: ffffff800801b9e0=C2=A0 esr: 24 1 1830007
<br>&gt; =C2=A0x0: ffffff800d83c038=C2=A0 =C2=A0x1: 0000000000000000=C2=A0 =
=C2=A0x2: ffffff8008480440
<br>&gt; =C2=A0x3: ffffff8008011024=C2=A0 =C2=A0x4: 0000000000000000=C2=A0 =
=C2=A0x5: 0000000000000064
<br>&gt; =C2=A0x6: 0000000000000051=C2=A0 =C2=A0x7: 3030303035323620=C2=A0 =
=C2=A0x8: 7820612073692029
<br>&gt; =C2=A0x9: 2030535079747420=C2=A0 x10: 204f494d4d207461=C2=A0 x11: =
3030303066667830
<br>&gt; x12: 2071726928203030=C2=A0 x13: 736162202c35203d=C2=A0 x14: 3d206=
47561625f65
<br>&gt; x15: ffffffffffffffff=C2=A0 x16: 0000000000000001=C2=A0 x17: 00000=
00000000001
<br>&gt; x18: 0000000000000010=C2=A0 x19: ffffffc03a990000=C2=A0 x20: fffff=
f800d83c038
<br>&gt; x21: ffffff800d6104c0=C2=A0 x22: ffffffc03a990100=C2=A0 x23: fffff=
f800d60e000
<br>&gt; x24: 0000000000000000=C2=A0 x25: ffffffc03a99eb00=C2=A0 x26: fffff=
f8008959a38
<br>&gt; x27: ffffffc03a99e600=C2=A0 x28: 0000000000000005=C2=A0 x29: fffff=
f800801b9e0
<br>&gt; Parking CPU 2 (Cell: &quot;non-root&quot;)
<br>&gt;=20
<br>&gt; segunda-feira, 5 de Agosto de 2019 =C3=A0s 07:30:59 UTC+1, Jan Kis=
zka escreveu:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 On 02.08.19 21:46, Jo=C3=A3o Reis wrote:
<br>&gt; =C2=A0 =C2=A0 &gt; I send in attachment the root cell (ultra96.c) =
and non root cell
<br>&gt; =C2=A0 =C2=A0 &gt; (ultra96-linux-demo2.c) config files, along wit=
h the .dtb i am using.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; The Image and rootfs.cpio files occupy 89,9MB a=
nd 79,4MB, respectively.
<br>&gt; =C2=A0 =C2=A0 (link to
<br>&gt; =C2=A0 =C2=A0 &gt; download them if you want to:
<br>&gt; =C2=A0 =C2=A0 &gt; <a href=3D"http://www.mediafire.com/folder/sopt=
a5vdf01yfm8,kwk1yt5jc9zcpl3" target=3D"_blank" rel=3D"nofollow" onmousedown=
=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fwww.mediaf=
ire.com%2Ffolder%2Fsopta5vdf01yfm8%2Ckwk1yt5jc9zcpl3\x26sa\x3dD\x26sntz\x3d=
1\x26usg\x3dAFQjCNGdQZbq4w7j3t8m9Rh4xfW5YVVk_A&#39;;return true;" onclick=
=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fwww.mediaf=
ire.com%2Ffolder%2Fsopta5vdf01yfm8%2Ckwk1yt5jc9zcpl3\x26sa\x3dD\x26sntz\x3d=
1\x26usg\x3dAFQjCNGdQZbq4w7j3t8m9Rh4xfW5YVVk_A&#39;;return true;">http://ww=
w.mediafire.com/<wbr>folder/sopta5vdf01yfm8,<wbr>kwk1yt5jc9zcpl3</a>
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"http://www.mediafire.com/folder/sopta=
5vdf01yfm8,kwk1yt5jc9zcpl3" target=3D"_blank" rel=3D"nofollow" onmousedown=
=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fwww.mediaf=
ire.com%2Ffolder%2Fsopta5vdf01yfm8%2Ckwk1yt5jc9zcpl3\x26sa\x3dD\x26sntz\x3d=
1\x26usg\x3dAFQjCNGdQZbq4w7j3t8m9Rh4xfW5YVVk_A&#39;;return true;" onclick=
=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fwww.mediaf=
ire.com%2Ffolder%2Fsopta5vdf01yfm8%2Ckwk1yt5jc9zcpl3\x26sa\x3dD\x26sntz\x3d=
1\x26usg\x3dAFQjCNGdQZbq4w7j3t8m9Rh4xfW5YVVk_A&#39;;return true;">http://ww=
w.mediafire.com/<wbr>folder/sopta5vdf01yfm8,<wbr>kwk1yt5jc9zcpl3</a>&gt;)
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 That&#39;s obviously too large for the remaining spa=
ce in that region. I will
<br>&gt; =C2=A0 =C2=A0 try to
<br>&gt; =C2=A0 =C2=A0 reproduce in order to understand why the loader atte=
mpts this nevertheless.
<br>&gt; =C2=A0 =C2=A0 Meanwhile, you could try if expanding that region a =
bit more makes it work - or
<br>&gt; =C2=A0 =C2=A0 just moves the problem around.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Jan
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; sexta-feira, 2 de Agosto de 2019 =C3=A0s 08:28:=
52 UTC+1, Jan Kiszka escreveu:
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 On 02.08.19 04:34, Jo=C3=A3o Reis=
 wrote:
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; The value of arch.ramdisk_ad=
dress() is=C2=A02062893056, converted to
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 hexadecimal is
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; 0x7AF54000, which is within =
the newly added RAM memory region that
<br>&gt; =C2=A0 =C2=A0 begins at
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; address 0x60000000.
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 OK, and what&#39; the size that s=
hall be transferred here? Keep in mind
<br>&gt; =C2=A0 =C2=A0 that there
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 is only 0xF9C000 (16367616) left =
in that region. That information is
<br>&gt; =C2=A0 =C2=A0 part of
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 the
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &#39;load&#39; structure Jailhous=
eCell.load assembles. If that size if too
<br>&gt; =C2=A0 =C2=A0 large, the
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 driver will reject it. That would=
 explain the error, not yet the
<br>&gt; =C2=A0 =C2=A0 reason for
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 jailhouse-cell-linux to make that=
 mistake.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 If you share your configs, the ke=
rnel and dtb images and the
<br>&gt; =C2=A0 =C2=A0 information how
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 large the initramfs is, I can try=
 to reproduce that.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 Jan
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; quarta-feira, 31 de Julho de=
 2019 =C3=A0s 07:22:32 UTC+1, Jan Kiszka
<br>&gt; =C2=A0 =C2=A0 escreveu:
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 On 31.07.19 02=
:40, Jo=C3=A3o Reis wrote:
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; Other thi=
ng i forgot was that on Ultrascale+ the RAM finishes
<br>&gt; =C2=A0 =C2=A0 at 2GB
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; (0x800000=
00), so i moved the memory region to 0x60000000, with a
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 different
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 size
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; to not ov=
erlap any other memory region.
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; /* RAM */=
 {
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; .phys_sta=
rt =3D 0x60000000,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; .virt_sta=
rt =3D 0x60000000,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; .size =3D=
 0x1bef0000, //must be page size aligned
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; JAILHOUSE=
_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; JAILHOUSE=
_MEM_DMA,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; },
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; But now i=
t gives me the error on ramdisk_address:
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; Traceback=
 (most recent call last):
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 Fi=
le &quot;/usr/local/libexec/jailhouse/<wbr>jailhouse-cell-linux&quot;, line
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 831, in
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &lt;module&gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =
=C2=A0 cell.load(args.initrd.read(), arch.ramdisk_address())
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 Fi=
le
<br>&gt; =C2=A0 =C2=A0 &quot;/usr/local/lib/python2.7/<wbr>dist-packages/py=
jailhouse/<wbr>cell.py&quot;,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 line
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 44, in
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; load
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =
=C2=A0 fcntl.ioctl(<a href=3D"http://self.dev" target=3D"_blank" rel=3D"nof=
ollow" onmousedown=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%=
3A%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNH9hLWbeS0NEb_1Kzth=
AtPBQE9BRg&#39;;return true;" onclick=3D"this.href=3D&#39;http://www.google=
.com/url?q\x3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjC=
NH9hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;return true;">self.dev</a> &lt;<a href=
=3D"http://self.dev" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this=
.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fself.dev\x26sa\x3d=
D\x26sntz\x3d1\x26usg\x3dAFQjCNH9hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;return tru=
e;" onclick=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2=
Fself.dev\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNH9hLWbeS0NEb_1KzthAtPBQE9=
BRg&#39;;return true;">http://self.dev</a>&gt; &lt;<a href=3D"http://self.d=
ev" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http=
://www.google.com/url?q\x3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1\x2=
6usg\x3dAFQjCNH9hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;return true;" onclick=3D"th=
is.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fself.dev\x26sa\x=
3dD\x26sntz\x3d1\x26usg\x3dAFQjCNH9hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;return t=
rue;">http://self.dev</a>&gt;
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"http://self.dev" target=3D"_blank" re=
l=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.google.com/url?q\=
x3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNH9hLWbeS0N=
Eb_1KzthAtPBQE9BRg&#39;;return true;" onclick=3D"this.href=3D&#39;http://ww=
w.google.com/url?q\x3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1\x26usg\=
x3dAFQjCNH9hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;return true;">http://self.dev</a=
>&gt;,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 self.JAILHOUSE_CELL_LOAD, load)
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; IOError: =
[Errno 22] Invalid argument
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 To make this a=
 bit more systematic, I would recommend you to
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 instrument the
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 code, dump thi=
s address e.g., and match against what you think you
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 configured.
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 Jan
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 --
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 Siemens AG, Co=
rporate Technology, CT RDA IOT SES-DE
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 Corporate Comp=
etence Center Embedded Linux
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; --
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; You received this message be=
cause you are subscribed to the Google
<br>&gt; =C2=A0 =C2=A0 Groups
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; &quot;Jailhouse&quot; group.
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; To unsubscribe from this gro=
up and stop receiving emails from it,
<br>&gt; =C2=A0 =C2=A0 send an
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 email
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; to <a>jailho...@googlegroups=
.com</a> &lt;javascript:&gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"javasc=
ript:" target=3D"_blank" gdf-obfuscated-mailto=3D"tLSXOOi5FAAJ" rel=3D"nofo=
llow" onmousedown=3D"this.href=3D&#39;javascript:&#39;;return true;" onclic=
k=3D"this.href=3D&#39;javascript:&#39;;return true;">jailhouse-dev+<wbr>uns=
ubscribe@googlegroups.com</a> &lt;javascript:&gt;
<br>&gt; =C2=A0 =C2=A0 &lt;javascript:&gt;&gt;.
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; To view this discussion on t=
he web visit
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0
<br>&gt; =C2=A0 =C2=A0 <a href=3D"https://groups.google.com/d/msgid/jailhou=
se-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com" target=3D"_=
blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://groups.goog=
le.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googleg=
roups.com&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.goo=
gle.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40google=
groups.com&#39;;return true;">https://groups.google.com/d/<wbr>msgid/jailho=
use-dev/1ebfd29b-<wbr>3c2d-490d-bd2d-c7cbdad1507c%<wbr>40googlegroups.com</=
a>
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com" target=
=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://groups=
.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40go=
oglegroups.com&#39;;return true;" onclick=3D"this.href=3D&#39;https://group=
s.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40g=
ooglegroups.com&#39;;return true;">https://groups.google.com/d/<wbr>msgid/j=
ailhouse-dev/1ebfd29b-<wbr>3c2d-490d-bd2d-c7cbdad1507c%<wbr>40googlegroups.=
com</a>&gt;
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com" target=
=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://groups=
.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40go=
oglegroups.com&#39;;return true;" onclick=3D"this.href=3D&#39;https://group=
s.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40g=
ooglegroups.com&#39;;return true;">https://groups.google.com/d/<wbr>msgid/j=
ailhouse-dev/1ebfd29b-<wbr>3c2d-490d-bd2d-c7cbdad1507c%<wbr>40googlegroups.=
com</a>
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com" target=
=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://groups=
.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40go=
oglegroups.com&#39;;return true;" onclick=3D"this.href=3D&#39;https://group=
s.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40g=
ooglegroups.com&#39;;return true;">https://groups.google.com/d/<wbr>msgid/j=
ailhouse-dev/1ebfd29b-<wbr>3c2d-490d-bd2d-c7cbdad1507c%<wbr>40googlegroups.=
com</a>&gt;&gt;
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com?utm_medi=
um=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmo=
usedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev=
/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com?utm_medium\x3demai=
l\x26utm_source\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;ht=
tps://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbd=
ad1507c%40googlegroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;=
;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/1ebfd29=
b-<wbr>3c2d-490d-bd2d-c7cbdad1507c%<wbr>40googlegroups.com?utm_medium=3D<wb=
r>email&amp;utm_source=3Dfooter</a>
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com?utm_medi=
um=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmo=
usedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev=
/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com?utm_medium\x3demai=
l\x26utm_source\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;ht=
tps://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbd=
ad1507c%40googlegroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;=
;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/1ebfd29=
b-<wbr>3c2d-490d-bd2d-c7cbdad1507c%<wbr>40googlegroups.com?utm_medium=3D<wb=
r>email&amp;utm_source=3Dfooter</a>&gt;
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com?utm_medi=
um=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmo=
usedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev=
/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com?utm_medium\x3demai=
l\x26utm_source\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;ht=
tps://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbd=
ad1507c%40googlegroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;=
;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/1ebfd29=
b-<wbr>3c2d-490d-bd2d-c7cbdad1507c%<wbr>40googlegroups.com?utm_medium=3D<wb=
r>email&amp;utm_source=3Dfooter</a>
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com?utm_medi=
um=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmo=
usedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev=
/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com?utm_medium\x3demai=
l\x26utm_source\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;ht=
tps://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbd=
ad1507c%40googlegroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;=
;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/1ebfd29=
b-<wbr>3c2d-490d-bd2d-c7cbdad1507c%<wbr>40googlegroups.com?utm_medium=3D<wb=
r>email&amp;utm_source=3Dfooter</a>&gt;&gt;&gt;.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 --
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 Siemens AG, Corporate Technology,=
 CT RDA IOT SES-DE
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 Corporate Competence Center Embed=
ded Linux
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; --
<br>&gt; =C2=A0 =C2=A0 &gt; You received this message because you are subsc=
ribed to the Google Groups
<br>&gt; =C2=A0 =C2=A0 &gt; &quot;Jailhouse&quot; group.
<br>&gt; =C2=A0 =C2=A0 &gt; To unsubscribe from this group and stop receivi=
ng emails from it, send an
<br>&gt; =C2=A0 =C2=A0 email
<br>&gt; =C2=A0 =C2=A0 &gt; to <a>jailho...@googlegroups.com</a> &lt;javasc=
ript:&gt;
<br>&gt; =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"javascript:" target=3D"_b=
lank" gdf-obfuscated-mailto=3D"tLSXOOi5FAAJ" rel=3D"nofollow" onmousedown=
=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D=
&#39;javascript:&#39;;return true;">jailhouse-dev+<wbr>unsubscribe@googlegr=
oups.com</a> &lt;javascript:&gt;&gt;.
<br>&gt; =C2=A0 =C2=A0 &gt; To view this discussion on the web visit
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 <a href=3D"https://groups.google.com/d/msgid/jailhou=
se-dev/f1de42fc-bae2-4962-ace6-a38e99a441d4%40googlegroups.com" target=3D"_=
blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://groups.goog=
le.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-a38e99a441d4%40googleg=
roups.com&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.goo=
gle.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-a38e99a441d4%40google=
groups.com&#39;;return true;">https://groups.google.com/d/<wbr>msgid/jailho=
use-dev/f1de42fc-<wbr>bae2-4962-ace6-a38e99a441d4%<wbr>40googlegroups.com</=
a>
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/f1de42fc-bae2-4962-ace6-a38e99a441d4%40googlegroups.com" target=
=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://groups=
.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-a38e99a441d4%40go=
oglegroups.com&#39;;return true;" onclick=3D"this.href=3D&#39;https://group=
s.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-a38e99a441d4%40g=
ooglegroups.com&#39;;return true;">https://groups.google.com/d/<wbr>msgid/j=
ailhouse-dev/f1de42fc-<wbr>bae2-4962-ace6-a38e99a441d4%<wbr>40googlegroups.=
com</a>&gt;
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/f1de42fc-bae2-4962-ace6-a38e99a441d4%40googlegroups.com?utm_medi=
um=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmo=
usedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev=
/f1de42fc-bae2-4962-ace6-a38e99a441d4%40googlegroups.com?utm_medium\x3demai=
l\x26utm_source\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;ht=
tps://groups.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-a38e9=
9a441d4%40googlegroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;=
;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/f1de42f=
c-<wbr>bae2-4962-ace6-a38e99a441d4%<wbr>40googlegroups.com?utm_medium=3D<wb=
r>email&amp;utm_source=3Dfooter</a>
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/f1de42fc-bae2-4962-ace6-a38e99a441d4%40googlegroups.com?utm_medi=
um=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmo=
usedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev=
/f1de42fc-bae2-4962-ace6-a38e99a441d4%40googlegroups.com?utm_medium\x3demai=
l\x26utm_source\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;ht=
tps://groups.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-a38e9=
9a441d4%40googlegroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;=
;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/f1de42f=
c-<wbr>bae2-4962-ace6-a38e99a441d4%<wbr>40googlegroups.com?utm_medium=3D<wb=
r>email&amp;utm_source=3Dfooter</a>&gt;&gt;.
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 --=20
<br>&gt; =C2=A0 =C2=A0 Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>&gt; =C2=A0 =C2=A0 Corporate Competence Center Embedded Linux
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
 Groups
<br>&gt; &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send an email
<br>&gt; to <a href=3D"javascript:" target=3D"_blank" gdf-obfuscated-mailto=
=3D"tLSXOOi5FAAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascri=
pt:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;;return =
true;">jailho...@<wbr>googlegroups.com</a>
<br>&gt; &lt;mailto:<a href=3D"javascript:" target=3D"_blank" gdf-obfuscate=
d-mailto=3D"tLSXOOi5FAAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;=
javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;=
;return true;">jailhouse-dev+<wbr>unsubscribe@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/82a56f5=
3-a498-4a27-8458-250d9a7e7078%40googlegroups.com" target=3D"_blank" rel=3D"=
nofollow" onmousedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid=
/jailhouse-dev/82a56f53-a498-4a27-8458-250d9a7e7078%40googlegroups.com&#39;=
;return true;" onclick=3D"this.href=3D&#39;https://groups.google.com/d/msgi=
d/jailhouse-dev/82a56f53-a498-4a27-8458-250d9a7e7078%40googlegroups.com&#39=
;;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/82a56f=
53-<wbr>a498-4a27-8458-250d9a7e7078%<wbr>40googlegroups.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/82a=
56f53-a498-4a27-8458-250d9a7e7078%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"thi=
s.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev/82a56f53-a498=
-4a27-8458-250d9a7e7078%40googlegroups.com?utm_medium\x3demail\x26utm_sourc=
e\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.g=
oogle.com/d/msgid/jailhouse-dev/82a56f53-a498-4a27-8458-250d9a7e7078%40goog=
legroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;;return true;"=
>https://groups.google.com/d/<wbr>msgid/jailhouse-dev/82a56f53-<wbr>a498-4a=
27-8458-250d9a7e7078%<wbr>40googlegroups.com?utm_medium=3D<wbr>email&amp;ut=
m_source=3Dfooter</a>&gt;.
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
om/d/msgid/jailhouse-dev/df6ad060-826f-48fa-b5a9-d5fa883c3629%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/df6ad060-826f-48fa-b5a9-d5fa883c3629%40googlegroups.com<=
/a>.<br />

------=_Part_2361_2028309579.1565118953282--

------=_Part_2360_499159460.1565118953280--
