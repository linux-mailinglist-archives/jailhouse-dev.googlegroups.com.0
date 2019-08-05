Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBWP4T7VAKGQESDOM4EQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D3B81631
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2019 12:00:59 +0200 (CEST)
Received: by mail-ot1-x339.google.com with SMTP id a8sf45836921oti.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Aug 2019 03:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jUmmja32ZquuK4itobd4fnNSNSGFppr2Co20B9fTAyg=;
        b=ZTTVgpe7lw71aTxxEHF4X3uBMhzBgO7AhRy0of65Cba+CCpi8i/tWVhPjV3OuaPT5h
         y21/PTqXV7aD+CqCoXfXYS2QixPH84M99oEeVs8SWxc5wiQhNNCgbucYgTaGdl4xYv7X
         7mT92EIi4TajsuS/x9wIc9a8K1ngOaWIkbbYQK+SE2i9FBY54MA2YXXcu5ecvUBcBfqE
         Scyhg2FrhALOX6oNz2SHLpfcRHFYRwPwwIY2zF/FyTE3hcUwHMRrF9fmJlbX+X9VHKzA
         GaQjkNe7O7/YJ254JmvRP4R363tqRyb9i1KJFEm3aJHEXQKnfFULROAjPhC27k4cBX7g
         h8ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jUmmja32ZquuK4itobd4fnNSNSGFppr2Co20B9fTAyg=;
        b=ez0MmzyMA+/1v9oaVNhSSHA/ULaptMdXrutmX7y85X/8hzLxqYEkiagR8j63+UTA4y
         AqVdSsGj38h0tvpXFFcJ+kE3QahfY9q9BnAt5HBsjsMtRKMV4j1IDphe37eqnSoynY9l
         JAP76+NLw3HhAcArqoD9Hkt5TWyNle5h22kryb2+ZNO88od1CIQKLRcIiAcfNSZ/N1mW
         ebFWDassPJB2JTBhKInw3U0JX1fCUdOiEEekNRGi9IZb0t8UDzfonr5ofEnYG+svb6aa
         pRNS2hEft2egoBBkuC/IUh0kB+omZj9vQIJRr7ShyF65yMw7LzWCEFfMYCTUXXV6L+eD
         nsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jUmmja32ZquuK4itobd4fnNSNSGFppr2Co20B9fTAyg=;
        b=OmYXVn/Wpj9uBojF6GF8GpHmcCzb3syAN96MW+ytYvjfH2miB0H9qftxrToVsYWhNY
         L9TSpp2BaBS7P2H9hzmabZJv9CIhymNhSTrzHligLXlAQeXRCfXKpXfHPvr/Lcl4Qnda
         KyhvLXl8fjT4LlLyoedTY5akQxcV+pLnhXfZfkNIFSwO7QFAoLB0OKlRajgfY/wDYNXT
         UxncVZULTnezITCe4amcD9RRgepZVh1NpAzeKXHXo0e2mp7hMkWuuhEXMD2GtUibNmNj
         +1OGJ5AyNU24C9IpqD9kLNz7g2RoTzCu39/XnUvNa3vkPp9q668AqP/rBTrsqoRLH/e0
         8OlQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVzm7S7jtveAWX2KuqtyCgV2+CFFOPMvVv2ZW9hUkq6NLx+7ZBQ
	npvuDdVhVojdtUmzVuj5rAQ=
X-Google-Smtp-Source: APXvYqxvmZByyJOrkQtZqHGREb2mye/KUufwJqqcvgnEM8FokaZ+94BWPIBMO6YVEFb5Jk3Gqvok4A==
X-Received: by 2002:a05:6830:1ae4:: with SMTP id c4mr91814329otd.261.1564999258021;
        Mon, 05 Aug 2019 03:00:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:71d0:: with SMTP id z16ls254166otj.2.gmail; Mon, 05 Aug
 2019 03:00:56 -0700 (PDT)
X-Received: by 2002:a05:6830:4ac:: with SMTP id l12mr1758191otd.333.1564999256610;
        Mon, 05 Aug 2019 03:00:56 -0700 (PDT)
Date: Mon, 5 Aug 2019 03:00:55 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <82a56f53-a498-4a27-8458-250d9a7e7078@googlegroups.com>
In-Reply-To: <dd33650a-c068-52ca-4da7-4537de652bfa@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <a5b27da1-b2aa-4ce0-863f-d9503a22b886@googlegroups.com>
 <885b4c3e-8d69-e516-aff4-46f2e50cb622@web.de>
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
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1500_573612306.1564999255958"
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

------=_Part_1500_573612306.1564999255958
Content-Type: multipart/alternative; 
	boundary="----=_Part_1501_1640002238.1564999255958"

------=_Part_1501_1640002238.1564999255958
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, so i've increased non-root cell's RAM memory region by 256MB (now it=20
starts from 0x50000000), and changed the reserved memory for hypervisor and=
=20
non-root cells (on u-boot: mem=3D1280M, which is equal to 0x50000000 bytes)=
.

It can load the cell, and when it starts it gives me an error related to=20
UART0 (?):

[   62.493128] Created Jailhouse cell "non-root"
Cell "non-root" can be loaded
Started cell "non-root"
Unhandled data read at 0xff000024(4)
FATAL: unhandled trap (exception class 0x24)
Cell state before exception:
 pc: ffffff8008480448   lr: ffffff8008473a70 spsr: 80000085     EL1
 sp: ffffff800801b9e0  esr: 24 1 1830007
 x0: ffffff800d83c038   x1: 0000000000000000   x2: ffffff8008480440
 x3: ffffff8008011024   x4: 0000000000000000   x5: 0000000000000064
 x6: 0000000000000051   x7: 3030303035323620   x8: 7820612073692029
 x9: 2030535079747420  x10: 204f494d4d207461  x11: 3030303066667830
x12: 2071726928203030  x13: 736162202c35203d  x14: 3d20647561625f65
x15: ffffffffffffffff  x16: 0000000000000001  x17: 0000000000000001
x18: 0000000000000010  x19: ffffffc03a990000  x20: ffffff800d83c038
x21: ffffff800d6104c0  x22: ffffffc03a990100  x23: ffffff800d60e000
x24: 0000000000000000  x25: ffffffc03a99eb00  x26: ffffff8008959a38
x27: ffffffc03a99e600  x28: 0000000000000005  x29: ffffff800801b9e0
Parking CPU 2 (Cell: "non-root")

segunda-feira, 5 de Agosto de 2019 =C3=A0s 07:30:59 UTC+1, Jan Kiszka escre=
veu:
>
> On 02.08.19 21:46, Jo=C3=A3o Reis wrote:=20
> > I send in attachment the root cell (ultra96.c) and non root cell=20
> > (ultra96-linux-demo2.c) config files, along with the .dtb i am using.=
=20
> >=20
> > The Image and rootfs.cpio files occupy 89,9MB and 79,4MB, respectively.=
=20
> (link to=20
> > download them if you want to:=20
> > http://www.mediafire.com/folder/sopta5vdf01yfm8,kwk1yt5jc9zcpl3)=20
>
> That's obviously too large for the remaining space in that region. I will=
=20
> try to=20
> reproduce in order to understand why the loader attempts this=20
> nevertheless.=20
> Meanwhile, you could try if expanding that region a bit more makes it wor=
k=20
> - or=20
> just moves the problem around.=20
>
> Jan=20
>
> >=20
> > sexta-feira, 2 de Agosto de 2019 =C3=A0s 08:28:52 UTC+1, Jan Kiszka esc=
reveu:=20
> >=20
> >     On 02.08.19 04:34, Jo=C3=A3o Reis wrote:=20
> >     > The value of arch.ramdisk_address() is 2062893056, converted to=
=20
> >     hexadecimal is=20
> >     > 0x7AF54000, which is within the newly added RAM memory region tha=
t=20
> begins at=20
> >     > address 0x60000000.=20
> >     >=20
> >=20
> >     OK, and what' the size that shall be transferred here? Keep in mind=
=20
> that there=20
> >     is only 0xF9C000 (16367616) left in that region. That information i=
s=20
> part of=20
> >     the=20
> >     'load' structure JailhouseCell.load assembles. If that size if too=
=20
> large, the=20
> >     driver will reject it. That would explain the error, not yet the=20
> reason for=20
> >     jailhouse-cell-linux to make that mistake.=20
> >=20
> >     If you share your configs, the kernel and dtb images and the=20
> information how=20
> >     large the initramfs is, I can try to reproduce that.=20
> >=20
> >     Jan=20
> >=20
> >     > quarta-feira, 31 de Julho de 2019 =C3=A0s 07:22:32 UTC+1, Jan Kis=
zka=20
> escreveu:=20
> >     >=20
> >     >     On 31.07.19 02:40, Jo=C3=A3o Reis wrote:=20
> >     >     > Other thing i forgot was that on Ultrascale+ the RAM=20
> finishes at 2GB=20
> >     >     > (0x80000000), so i moved the memory region to 0x60000000,=
=20
> with a=20
> >     different=20
> >     >     size=20
> >     >     > to not overlap any other memory region.=20
> >     >     >=20
> >     >     > /* RAM */ {=20
> >     >     > .phys_start =3D 0x60000000,=20
> >     >     > .virt_start =3D 0x60000000,=20
> >     >     > .size =3D 0x1bef0000, //must be page size aligned=20
> >     >     > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=20
> >     >     > JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |=20
> >     >     > JAILHOUSE_MEM_DMA,=20
> >     >     > },=20
> >     >     >=20
> >     >     > But now it gives me the error on ramdisk_address:=20
> >     >     >=20
> >     >     > Traceback (most recent call last):=20
> >     >     >   File "/usr/local/libexec/jailhouse/jailhouse-cell-linux",=
=20
> line=20
> >     831, in=20
> >     >     <module>=20
> >     >     >     cell.load(args.initrd.read(), arch.ramdisk_address())=
=20
> >     >     >   File=20
> "/usr/local/lib/python2.7/dist-packages/pyjailhouse/cell.py",=20
> >     line=20
> >     >     44, in=20
> >     >     > load=20
> >     >     >     fcntl.ioctl(self.dev <http://self.dev> <http://self.dev=
>,=20
>
> >     self.JAILHOUSE_CELL_LOAD, load)=20
> >     >     > IOError: [Errno 22] Invalid argument=20
> >     >     >=20
> >     >=20
> >     >     To make this a bit more systematic, I would recommend you to=
=20
> >     instrument the=20
> >     >     code, dump this address e.g., and match against what you thin=
k=20
> you=20
> >     configured.=20
> >     >=20
> >     >     Jan=20
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
> https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c=
7cbdad1507c%40googlegroups.com=20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c=
7cbdad1507c%40googlegroups.com>=20
>
> >=20
> >     >=20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c=
7cbdad1507c%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c=
7cbdad1507c%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.=20
>
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
> https://groups.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-a=
38e99a441d4%40googlegroups.com=20
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-a=
38e99a441d4%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20
>
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
jailhouse-dev/82a56f53-a498-4a27-8458-250d9a7e7078%40googlegroups.com.

------=_Part_1501_1640002238.1564999255958
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, so i&#39;ve increased non-root cell&#39;s RAM memory r=
egion by 256MB (now it starts from 0x50000000), and changed the reserved me=
mory for hypervisor and non-root cells (on u-boot: mem=3D1280M, which is eq=
ual to 0x50000000 bytes).<br><br>It can load the cell, and when it starts i=
t gives me an error related to UART0 (?):<div><br><div>[=C2=A0 =C2=A062.493=
128] Created Jailhouse cell &quot;non-root&quot;</div><div>Cell &quot;non-r=
oot&quot; can be loaded</div><div>Started cell &quot;non-root&quot;</div><d=
iv>Unhandled data read at 0xff000024(4)</div><div>FATAL: unhandled trap (ex=
ception class 0x24)</div><div>Cell state before exception:</div><div>=C2=A0=
pc: ffffff8008480448=C2=A0 =C2=A0lr: ffffff8008473a70 spsr: 80000085=C2=A0 =
=C2=A0 =C2=A0EL1<br></div><div>=C2=A0sp: ffffff800801b9e0=C2=A0 esr: 24 1 1=
830007<br></div><div>=C2=A0x0: ffffff800d83c038=C2=A0 =C2=A0x1: 00000000000=
00000=C2=A0 =C2=A0x2: ffffff8008480440<br></div><div>=C2=A0x3: ffffff800801=
1024=C2=A0 =C2=A0x4: 0000000000000000=C2=A0 =C2=A0x5: 0000000000000064<br><=
/div><div>=C2=A0x6: 0000000000000051=C2=A0 =C2=A0x7: 3030303035323620=C2=A0=
 =C2=A0x8: 7820612073692029<br></div><div>=C2=A0x9: 2030535079747420=C2=A0 =
x10: 204f494d4d207461=C2=A0 x11: 3030303066667830</div><div>x12: 2071726928=
203030=C2=A0 x13: 736162202c35203d=C2=A0 x14: 3d20647561625f65</div><div>x1=
5: ffffffffffffffff=C2=A0 x16: 0000000000000001=C2=A0 x17: 0000000000000001=
<br></div><div>x18: 0000000000000010=C2=A0 x19: ffffffc03a990000=C2=A0 x20:=
 ffffff800d83c038<br></div><div>x21: ffffff800d6104c0=C2=A0 x22: ffffffc03a=
990100=C2=A0 x23: ffffff800d60e000<br></div><div>x24: 0000000000000000=C2=
=A0 x25: ffffffc03a99eb00=C2=A0 x26: ffffff8008959a38<br></div><div>x27: ff=
ffffc03a99e600=C2=A0 x28: 0000000000000005=C2=A0 x29: ffffff800801b9e0</div=
><div>Parking CPU 2 (Cell: &quot;non-root&quot;)</div><br>segunda-feira, 5 =
de Agosto de 2019 =C3=A0s 07:30:59 UTC+1, Jan Kiszka escreveu:<blockquote c=
lass=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px=
 #ccc solid;padding-left: 1ex;">On 02.08.19 21:46, Jo=C3=A3o Reis wrote:
<br>&gt; I send in attachment the root cell (ultra96.c) and non root cell
<br>&gt; (ultra96-linux-demo2.c) config files, along with the .dtb i am usi=
ng.
<br>&gt;=20
<br>&gt; The Image and rootfs.cpio files occupy 89,9MB and 79,4MB, respecti=
vely. (link to
<br>&gt; download them if you want to:
<br>&gt; <a href=3D"http://www.mediafire.com/folder/sopta5vdf01yfm8,kwk1yt5=
jc9zcpl3" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#3=
9;http://www.google.com/url?q\x3dhttp%3A%2F%2Fwww.mediafire.com%2Ffolder%2F=
sopta5vdf01yfm8%2Ckwk1yt5jc9zcpl3\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNG=
dQZbq4w7j3t8m9Rh4xfW5YVVk_A&#39;;return true;" onclick=3D"this.href=3D&#39;=
http://www.google.com/url?q\x3dhttp%3A%2F%2Fwww.mediafire.com%2Ffolder%2Fso=
pta5vdf01yfm8%2Ckwk1yt5jc9zcpl3\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNGdQ=
Zbq4w7j3t8m9Rh4xfW5YVVk_A&#39;;return true;">http://www.mediafire.com/<wbr>=
folder/sopta5vdf01yfm8,<wbr>kwk1yt5jc9zcpl3</a>)
<br>
<br>That&#39;s obviously too large for the remaining space in that region. =
I will try to
<br>reproduce in order to understand why the loader attempts this neverthel=
ess.
<br>Meanwhile, you could try if expanding that region a bit more makes it w=
ork - or
<br>just moves the problem around.
<br>
<br>Jan
<br>
<br>&gt;=20
<br>&gt; sexta-feira, 2 de Agosto de 2019 =C3=A0s 08:28:52 UTC+1, Jan Kiszk=
a escreveu:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 On 02.08.19 04:34, Jo=C3=A3o Reis wrote:
<br>&gt; =C2=A0 =C2=A0 &gt; The value of arch.ramdisk_address() is=C2=A0206=
2893056, converted to
<br>&gt; =C2=A0 =C2=A0 hexadecimal is
<br>&gt; =C2=A0 =C2=A0 &gt; 0x7AF54000, which is within the newly added RAM=
 memory region that begins at
<br>&gt; =C2=A0 =C2=A0 &gt; address 0x60000000.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 OK, and what&#39; the size that shall be transferred=
 here? Keep in mind that there
<br>&gt; =C2=A0 =C2=A0 is only 0xF9C000 (16367616) left in that region. Tha=
t information is part of
<br>&gt; =C2=A0 =C2=A0 the
<br>&gt; =C2=A0 =C2=A0 &#39;load&#39; structure JailhouseCell.load assemble=
s. If that size if too large, the
<br>&gt; =C2=A0 =C2=A0 driver will reject it. That would explain the error,=
 not yet the reason for
<br>&gt; =C2=A0 =C2=A0 jailhouse-cell-linux to make that mistake.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 If you share your configs, the kernel and dtb images=
 and the information how
<br>&gt; =C2=A0 =C2=A0 large the initramfs is, I can try to reproduce that.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Jan
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 &gt; quarta-feira, 31 de Julho de 2019 =C3=A0s 07:22=
:32 UTC+1, Jan Kiszka escreveu:
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 On 31.07.19 02:40, Jo=C3=A3o Reis=
 wrote:
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; Other thing i forgot was tha=
t on Ultrascale+ the RAM finishes at 2GB
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; (0x80000000), so i moved the=
 memory region to 0x60000000, with a
<br>&gt; =C2=A0 =C2=A0 different
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 size
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; to not overlap any other mem=
ory region.
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; /* RAM */ {
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; .phys_start =3D 0x60000000,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; .virt_start =3D 0x60000000,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; .size =3D 0x1bef0000, //must=
 be page size aligned
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; .flags =3D JAILHOUSE_MEM_REA=
D | JAILHOUSE_MEM_WRITE |
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; JAILHOUSE_MEM_EXECUTE | JAIL=
HOUSE_MEM_LOADABLE |
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; JAILHOUSE_MEM_DMA,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; },
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; But now it gives me the erro=
r on ramdisk_address:
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; Traceback (most recent call =
last):
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 File &quot;/usr/local=
/libexec/jailhouse/<wbr>jailhouse-cell-linux&quot;, line
<br>&gt; =C2=A0 =C2=A0 831, in
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &lt;module&gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 cell.load(args=
.initrd.read(), arch.ramdisk_address())
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 File &quot;/usr/local=
/lib/python2.7/<wbr>dist-packages/pyjailhouse/<wbr>cell.py&quot;,
<br>&gt; =C2=A0 =C2=A0 line
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 44, in
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; load
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 fcntl.ioctl(<a=
 href=3D"http://self.dev" target=3D"_blank" rel=3D"nofollow" onmousedown=3D=
"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fself.dev\x26s=
a\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNH9hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;retur=
n true;" onclick=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A=
%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNH9hLWbeS0NEb_1KzthAt=
PBQE9BRg&#39;;return true;">self.dev</a> &lt;<a href=3D"http://self.dev" ta=
rget=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www=
.google.com/url?q\x3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1\x26usg\x=
3dAFQjCNH9hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;return true;" onclick=3D"this.hre=
f=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x2=
6sntz\x3d1\x26usg\x3dAFQjCNH9hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;return true;">=
http://self.dev</a>&gt; &lt;<a href=3D"http://self.dev" target=3D"_blank" r=
el=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.google.com/url?q=
\x3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNH9hLWbeS0=
NEb_1KzthAtPBQE9BRg&#39;;return true;" onclick=3D"this.href=3D&#39;http://w=
ww.google.com/url?q\x3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1\x26usg=
\x3dAFQjCNH9hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;return true;">http://self.dev</=
a>&gt;,
<br>&gt; =C2=A0 =C2=A0 self.JAILHOUSE_CELL_LOAD, load)
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; IOError: [Errno 22] Invalid =
argument
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 To make this a bit more systemati=
c, I would recommend you to
<br>&gt; =C2=A0 =C2=A0 instrument the
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 code, dump this address e.g., and=
 match against what you think you
<br>&gt; =C2=A0 =C2=A0 configured.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 Jan
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
lank" gdf-obfuscated-mailto=3D"irw1KfKqFAAJ" rel=3D"nofollow" onmousedown=
=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D=
&#39;javascript:&#39;;return true;">jailhouse-dev+<wbr>unsubscribe@googlegr=
oups.com</a> &lt;javascript:&gt;&gt;.
<br>&gt; =C2=A0 =C2=A0 &gt; To view this discussion on the web visit
<br>&gt; =C2=A0 =C2=A0 &gt;
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
<br>&gt; =C2=A0 =C2=A0 &gt;
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
r>email&amp;utm_source=3Dfooter</a>&gt;&gt;.
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
=3D"irw1KfKqFAAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascri=
pt:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;;return =
true;">jailho...@<wbr>googlegroups.com</a>
<br>&gt; &lt;mailto:<a href=3D"javascript:" target=3D"_blank" gdf-obfuscate=
d-mailto=3D"irw1KfKqFAAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;=
javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;=
;return true;">jailhouse-dev+<wbr>unsubscribe@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/f1de42f=
c-bae2-4962-ace6-a38e99a441d4%40googlegroups.com" target=3D"_blank" rel=3D"=
nofollow" onmousedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid=
/jailhouse-dev/f1de42fc-bae2-4962-ace6-a38e99a441d4%40googlegroups.com&#39;=
;return true;" onclick=3D"this.href=3D&#39;https://groups.google.com/d/msgi=
d/jailhouse-dev/f1de42fc-bae2-4962-ace6-a38e99a441d4%40googlegroups.com&#39=
;;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/f1de42=
fc-<wbr>bae2-4962-ace6-a38e99a441d4%<wbr>40googlegroups.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/f1d=
e42fc-bae2-4962-ace6-a38e99a441d4%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"thi=
s.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2=
-4962-ace6-a38e99a441d4%40googlegroups.com?utm_medium\x3demail\x26utm_sourc=
e\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.g=
oogle.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-a38e99a441d4%40goog=
legroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;;return true;"=
>https://groups.google.com/d/<wbr>msgid/jailhouse-dev/f1de42fc-<wbr>bae2-49=
62-ace6-a38e99a441d4%<wbr>40googlegroups.com?utm_medium=3D<wbr>email&amp;ut=
m_source=3Dfooter</a>&gt;.
<br>
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
om/d/msgid/jailhouse-dev/82a56f53-a498-4a27-8458-250d9a7e7078%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/82a56f53-a498-4a27-8458-250d9a7e7078%40googlegroups.com<=
/a>.<br />

------=_Part_1501_1640002238.1564999255958--

------=_Part_1500_573612306.1564999255958--
