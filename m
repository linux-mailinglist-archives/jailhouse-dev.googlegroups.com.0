Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBFFGSLVAKGQEYBJGC5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 8420280133
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Aug 2019 21:46:29 +0200 (CEST)
Received: by mail-ot1-x339.google.com with SMTP id h26sf41567959otr.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Aug 2019 12:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=r2Sp+Bf5zVuxXZCxwkdXTsbSkPdttamKVSirkgs/ZWM=;
        b=qtcZQbLRNmsK4XnI6e5mmagzLYPIlPQU1EIjeqTTNzlwYARBlhkLtiY1Wpn/+Qeq+i
         0YSDXuuNto/qBUBG4QTyhqJr6/zbMArwt2RjoU0hCtXJ6Tlc97efRMxc1D5ZFT0wLdh3
         bbmP0eA9YB0uik9CBmZOzXP0qgvA/K0EBQgQqMQN/qfVSVDBQaSuKUzpTyIRGI8+rOxx
         8vfCJdANILmXMsEdNP16V+Y32X7o1cZn35at3Mgu5Ej37e9pA8x01+1weY9yFBLaMQC4
         A+trTIJGIN3IWPlN4DH26rDk38asxA80sr99HOWc0aZojL0xKx1YctWgk6dR+RGGn4SY
         QkQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=r2Sp+Bf5zVuxXZCxwkdXTsbSkPdttamKVSirkgs/ZWM=;
        b=oEyEoUwXjIxWTGnxvq0Zk5nXXDyUytqjemQ6Qy1Vb3l+JvwphWoduc8/KvX0qds9I9
         jw4U/5sf+kDffErz2yA21cogEow8sTBBsG8WDCensfzJ+gkvrtpq+YXlZQ//B6i9MW1y
         rb4BtS4MQrNBFiZckjpA4Ji494jasgI3fFdHGg5fJuIJZU/0sJQ0XCoh7T/AOBtQOIhy
         leZmC78IlZbzMB0akoK1hqgBakUoy/9Lbva8nW/8mO0EItJSW22jINGUpjwyn8WgWWj6
         yyCZ/zvHmM8deiQClHpG+RHcdaX3e8kxy3Nkd+HLmVEZPcGa5aDOCnrNCvkhtKKEe10f
         qpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=r2Sp+Bf5zVuxXZCxwkdXTsbSkPdttamKVSirkgs/ZWM=;
        b=oTpV6iHemKVWVDFLw7L2Javfsp2KPoxYe8epGPJ7WmkCZN0tUlQ/kB5GcpEDKU2dJy
         UNVdZmbdI7A2xb+5+TFZSohh1d39ldQ86F0wt41hHpEHkLpOE/mDKjjOTtp7sHsF8h7Y
         BTodaxXfBXAX8h4FaQ1KLkf6gdnNeJTThkjOYktpKlp+J5cT/KHbNmhGRyWV4ywENHY+
         XzTFRPle93rVEKq2QMfClO2PZTI5N4LX6LIQQs2yl83RVHnLOd226z+poK8asKHzErxu
         HeJprQEJqtM2fe9RBSZS40byFhCEfHdyqXh5QuvbNnoP7Qa/ddKBNl5YFMqOwHOlnXgp
         U41Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUCeHXbee2xqKQsp1deGcRba5quumkbBQvcBwtIRaomcD4ehiqj
	hwlRvO8H7Itt/YjnigZ4y7Q=
X-Google-Smtp-Source: APXvYqxWN6sNPKGe7HvYFo7Fl33fgOkySlVSxyNqK4V2c6np0VECNLeF4N6B+djI5aNT9mDvzW2BMA==
X-Received: by 2002:a05:6830:1688:: with SMTP id k8mr2003614otr.233.1564775188384;
        Fri, 02 Aug 2019 12:46:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:313:: with SMTP id i19ls6533198oie.3.gmail; Fri, 02
 Aug 2019 12:46:28 -0700 (PDT)
X-Received: by 2002:a54:4694:: with SMTP id k20mr3915654oic.136.1564775187797;
        Fri, 02 Aug 2019 12:46:27 -0700 (PDT)
Date: Fri, 2 Aug 2019 12:46:26 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f1de42fc-bae2-4962-ace6-a38e99a441d4@googlegroups.com>
In-Reply-To: <164159e0-478e-c5e9-fc8a-e0c0cb27da7a@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <1726f6bd-680a-46ac-a7f3-937cbba84208@googlegroups.com>
 <19e76b74-6d6e-010d-952a-5a36e606091b@web.de>
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
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_945_1526922542.1564775186963"
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

------=_Part_945_1526922542.1564775186963
Content-Type: multipart/alternative; 
	boundary="----=_Part_946_2027585519.1564775186963"

------=_Part_946_2027585519.1564775186963
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I send in attachment the root cell (ultra96.c) and non root cell=20
(ultra96-linux-demo2.c) config files, along with the .dtb i am using.

The Image and rootfs.cpio files occupy 89,9MB and 79,4MB, respectively.=20
(link to download them if you want to:=20
http://www.mediafire.com/folder/sopta5vdf01yfm8,kwk1yt5jc9zcpl3)

sexta-feira, 2 de Agosto de 2019 =C3=A0s 08:28:52 UTC+1, Jan Kiszka escreve=
u:
>
> On 02.08.19 04:34, Jo=C3=A3o Reis wrote:=20
> > The value of arch.ramdisk_address() is 2062893056, converted to=20
> hexadecimal is=20
> > 0x7AF54000, which is within the newly added RAM memory region that=20
> begins at=20
> > address 0x60000000.=20
> >=20
>
> OK, and what' the size that shall be transferred here? Keep in mind that=
=20
> there=20
> is only 0xF9C000 (16367616) left in that region. That information is part=
=20
> of the=20
> 'load' structure JailhouseCell.load assembles. If that size if too large,=
=20
> the=20
> driver will reject it. That would explain the error, not yet the reason=
=20
> for=20
> jailhouse-cell-linux to make that mistake.=20
>
> If you share your configs, the kernel and dtb images and the information=
=20
> how=20
> large the initramfs is, I can try to reproduce that.=20
>
> Jan=20
>
> > quarta-feira, 31 de Julho de 2019 =C3=A0s 07:22:32 UTC+1, Jan Kiszka=20
> escreveu:=20
> >=20
> >     On 31.07.19 02:40, Jo=C3=A3o Reis wrote:=20
> >     > Other thing i forgot was that on Ultrascale+ the RAM finishes at=
=20
> 2GB=20
> >     > (0x80000000), so i moved the memory region to 0x60000000, with a=
=20
> different=20
> >     size=20
> >     > to not overlap any other memory region.=20
> >     >=20
> >     > /* RAM */ {=20
> >     > .phys_start =3D 0x60000000,=20
> >     > .virt_start =3D 0x60000000,=20
> >     > .size =3D 0x1bef0000, //must be page size aligned=20
> >     > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=20
> >     > JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |=20
> >     > JAILHOUSE_MEM_DMA,=20
> >     > },=20
> >     >=20
> >     > But now it gives me the error on ramdisk_address:=20
> >     >=20
> >     > Traceback (most recent call last):=20
> >     >   File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line=
=20
> 831, in=20
> >     <module>=20
> >     >     cell.load(args.initrd.read(), arch.ramdisk_address())=20
> >     >   File=20
> "/usr/local/lib/python2.7/dist-packages/pyjailhouse/cell.py", line=20
> >     44, in=20
> >     > load=20
> >     >     fcntl.ioctl(self.dev <http://self.dev>,=20
> self.JAILHOUSE_CELL_LOAD, load)=20
> >     > IOError: [Errno 22] Invalid argument=20
> >     >=20
> >=20
> >     To make this a bit more systematic, I would recommend you to=20
> instrument the=20
> >     code, dump this address e.g., and match against what you think you=
=20
> configured.=20
> >=20
> >     Jan=20
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
> https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c=
7cbdad1507c%40googlegroups.com=20
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c=
7cbdad1507c%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20
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
jailhouse-dev/f1de42fc-bae2-4962-ace6-a38e99a441d4%40googlegroups.com.

------=_Part_946_2027585519.1564775186963
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I send in attachment the root cell (ultra96.c) and non roo=
t cell (ultra96-linux-demo2.c) config files, along with the .dtb i am using=
.<div><br></div><div>The Image and rootfs.cpio files occupy 89,9MB and 79,4=
MB, respectively. (link to download them if you want to: http://www.mediafi=
re.com/folder/sopta5vdf01yfm8,kwk1yt5jc9zcpl3)<br><br>sexta-feira, 2 de Ago=
sto de 2019 =C3=A0s 08:28:52 UTC+1, Jan Kiszka escreveu:<blockquote class=
=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #cc=
c solid;padding-left: 1ex;">On 02.08.19 04:34, Jo=C3=A3o Reis wrote:
<br>&gt; The value of arch.ramdisk_address() is=C2=A02062893056, converted =
to hexadecimal is
<br>&gt; 0x7AF54000, which is within the newly added RAM memory region that=
 begins at
<br>&gt; address 0x60000000.
<br>&gt;=20
<br>
<br>OK, and what&#39; the size that shall be transferred here? Keep in mind=
 that there
<br>is only 0xF9C000 (16367616) left in that region. That information is pa=
rt of the
<br>&#39;load&#39; structure JailhouseCell.load assembles. If that size if =
too large, the
<br>driver will reject it. That would explain the error, not yet the reason=
 for
<br>jailhouse-cell-linux to make that mistake.
<br>
<br>If you share your configs, the kernel and dtb images and the informatio=
n how
<br>large the initramfs is, I can try to reproduce that.
<br>
<br>Jan
<br>
<br>&gt; quarta-feira, 31 de Julho de 2019 =C3=A0s 07:22:32 UTC+1, Jan Kisz=
ka escreveu:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 On 31.07.19 02:40, Jo=C3=A3o Reis wrote:
<br>&gt; =C2=A0 =C2=A0 &gt; Other thing i forgot was that on Ultrascale+ th=
e RAM finishes at 2GB
<br>&gt; =C2=A0 =C2=A0 &gt; (0x80000000), so i moved the memory region to 0=
x60000000, with a different
<br>&gt; =C2=A0 =C2=A0 size
<br>&gt; =C2=A0 =C2=A0 &gt; to not overlap any other memory region.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; /* RAM */ {
<br>&gt; =C2=A0 =C2=A0 &gt; .phys_start =3D 0x60000000,
<br>&gt; =C2=A0 =C2=A0 &gt; .virt_start =3D 0x60000000,
<br>&gt; =C2=A0 =C2=A0 &gt; .size =3D 0x1bef0000, //must be page size align=
ed
<br>&gt; =C2=A0 =C2=A0 &gt; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_W=
RITE |
<br>&gt; =C2=A0 =C2=A0 &gt; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE =
|
<br>&gt; =C2=A0 =C2=A0 &gt; JAILHOUSE_MEM_DMA,
<br>&gt; =C2=A0 =C2=A0 &gt; },
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; But now it gives me the error on ramdisk_addres=
s:
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; Traceback (most recent call last):
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 File &quot;/usr/local/libexec/jailhouse/=
<wbr>jailhouse-cell-linux&quot;, line 831, in
<br>&gt; =C2=A0 =C2=A0 &lt;module&gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 cell.load(args.initrd.read(), arc=
h.ramdisk_address())
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 File &quot;/usr/local/lib/python2.7/<wbr=
>dist-packages/pyjailhouse/<wbr>cell.py&quot;, line
<br>&gt; =C2=A0 =C2=A0 44, in
<br>&gt; =C2=A0 =C2=A0 &gt; load
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 fcntl.ioctl(<a href=3D"http://sel=
f.dev" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;h=
ttp://www.google.com/url?q\x3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1=
\x26usg\x3dAFQjCNH9hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;return true;" onclick=3D=
"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fself.dev\x26s=
a\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNH9hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;retur=
n true;">self.dev</a> &lt;<a href=3D"http://self.dev" target=3D"_blank" rel=
=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.google.com/url?q\x=
3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNH9hLWbeS0NE=
b_1KzthAtPBQE9BRg&#39;;return true;" onclick=3D"this.href=3D&#39;http://www=
.google.com/url?q\x3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1\x26usg\x=
3dAFQjCNH9hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;return true;">http://self.dev</a>=
&gt;, self.JAILHOUSE_CELL_LOAD, load)
<br>&gt; =C2=A0 =C2=A0 &gt; IOError: [Errno 22] Invalid argument
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 To make this a bit more systematic, I would recommen=
d you to instrument the
<br>&gt; =C2=A0 =C2=A0 code, dump this address e.g., and match against what=
 you think you configured.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Jan
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
=3D"MeNVC13CEwAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascri=
pt:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;;return =
true;">jailho...@<wbr>googlegroups.com</a>
<br>&gt; &lt;mailto:<a href=3D"javascript:" target=3D"_blank" gdf-obfuscate=
d-mailto=3D"MeNVC13CEwAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;=
javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;=
;return true;">jailhouse-dev+<wbr>unsubscribe@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29=
b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com" target=3D"_blank" rel=3D"=
nofollow" onmousedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid=
/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com&#39;=
;return true;" onclick=3D"this.href=3D&#39;https://groups.google.com/d/msgi=
d/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com&#39=
;;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/1ebfd2=
9b-<wbr>3c2d-490d-bd2d-c7cbdad1507c%<wbr>40googlegroups.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/1eb=
fd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"thi=
s.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d=
-490d-bd2d-c7cbdad1507c%40googlegroups.com?utm_medium\x3demail\x26utm_sourc=
e\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.g=
oogle.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40goog=
legroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;;return true;"=
>https://groups.google.com/d/<wbr>msgid/jailhouse-dev/1ebfd29b-<wbr>3c2d-49=
0d-bd2d-c7cbdad1507c%<wbr>40googlegroups.com?utm_medium=3D<wbr>email&amp;ut=
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
om/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-a38e99a441d4%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-a38e99a441d4%40googlegroups.com<=
/a>.<br />

------=_Part_946_2027585519.1564775186963--

------=_Part_945_1526922542.1564775186963
Content-Type: text/x-csrc; charset=UTF-8; name=ultra96-linux-demo2.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ultra96-linux-demo2.c
X-Attachment-Id: 308c8f14-ea2e-44fe-ba67-f73353b81fa8
Content-ID: <308c8f14-ea2e-44fe-ba67-f73353b81fa8>

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
=09=09=09.phys_start =3D 0x60000000,
=09=09=09.virt_start =3D 0x60000000,
=09=09=09.size =3D 0x1bef0000, //must be page size aligned
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
=09=09=09=09JAILHOUSE_MEM_DMA,/* |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED,*/ //se tirar JAILHOUSE_MEM_ROOTSHARED=
 da exception fault 0x20
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

------=_Part_945_1526922542.1564775186963
Content-Type: text/x-csrc; charset=UTF-8; name=ultra96.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ultra96.c
X-Attachment-Id: e7674253-815d-432d-b45f-7f20d5ac6c24
Content-ID: <e7674253-815d-432d-b45f-7f20d5ac6c24>

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
=09=09=09.phys_start =3D 0x7c000000,
=09=09=09.size =3D       0x00400000,
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
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x0,
=09=09=09.virt_start =3D 0x0,
=09=09=09.size =3D 0x7c000000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE,
=09=09},
=09=09/* IVSHMEM shared memory region for 00:00.0 */ {
=09=09=09.phys_start =3D 0x7bf00000,
=09=09=09.virt_start =3D 0x7bf00000,
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
=09=09/* 0001:00:00.0 */ {
=09=09=09.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
=09=09=09.iommu =3D 1,//
=09=09=09//.domain =3D 1,
=09=09=09.bdf =3D 0 << 3,
=09=09=09.bar_mask =3D {
=09=09=09=090xffffff00, 0xffffffff, 0x00000000,
=09=09=09=090x00000000, 0x00000000, 0x00000000,
=09=09=09},
=09=09=09.shmem_region =3D 2,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_CUSTOM,
=09=09=09.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,=20
=09=09=09//.num_msix_vectors =3D 1,//se colocar isto, qd fa=C3=A7o insmod u=
io_ivshmem.ko ele n diz "using jailhouse mode" e dps n existe /dev/uio1
=09=09},
=09},
};

------=_Part_945_1526922542.1564775186963
Content-Type: application/octet-stream; name=inmate-zynqmp.dtb
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=inmate-zynqmp.dtb
X-Attachment-Id: 81337e2a-e2c1-4bc8-9dda-536314abbd91
Content-ID: <81337e2a-e2c1-4bc8-9dda-536314abbd91>

0A3+7QAAB1wAAAA4AAAGYAAAACgAAAARAAAAEAAAAAAAAAD8AAAGKAAAAAAAAAAAAAAAAAAAAAAA
AAABAAAAAAAAAAMAAAAZAAAAAEphaWxob3VzZSBjZWxsIG9uIFp5bnFNUAAAAAAAAAADAAAABAAA
AAYAAAACAAAAAwAAAAQAAAAVAAAAAgAAAAMAAAAEAAAAIQAAAAEAAAABaHlwZXJ2aXNvcgAAAAAA
AwAAAA8AAAAyamFpbGhvdXNlLGNlbGwAAAAAAAIAAAABY3B1cwAAAAAAAAADAAAABAAAAAYAAAAC
AAAAAwAAAAQAAAAVAAAAAAAAAAFjcHVAMgAAAAAAAAMAAAAZAAAAMmFybSxjb3J0ZXgtYTUzAGFy
bSxhcm12OAAAAAAAAAADAAAABAAAAD1jcHUAAAAAAwAAAAgAAABJAAAAAAAAAAIAAAADAAAABQAA
AE1wc2NpAAAAAAAAAAIAAAABY3B1QDMAAAAAAAADAAAAGQAAADJhcm0sY29ydGV4LWE1MwBhcm0s
YXJtdjgAAAAAAAAAAwAAAAQAAAA9Y3B1AAAAAAMAAAAIAAAASQAAAAAAAAADAAAAAwAAAAUAAABN
cHNjaQAAAAAAAAACAAAAAgAAAAFwc2NpAAAAAAAAAAMAAAANAAAAMmFybSxwc2NpLTAuMgAAAAAA
AAADAAAABAAAAFRzbWMAAAAAAgAAAAF0aW1lcgAAAAAAAAMAAAAQAAAAMmFybSxhcm12OC10aW1l
cgAAAAADAAAAMAAAAFsAAAABAAAADQAA/wgAAAABAAAADgAA/wgAAAABAAAACwAA/wgAAAABAAAA
CgAA/wgAAAACAAAAAWludGVycnVwdC1jb250cm9sbGVyQGY2ODAxMDAwAAAAAAAAAwAAAAwAAAAy
YXJtLGdpYy00MDAAAAAAAwAAACAAAABJAAAAAPkBAAAAAAAAAAAQAAAAAAD5AvAAAAAAAAAAIAAA
AAADAAAAAAAAAGYAAAADAAAABAAAAHsAAAADAAAAAwAAAAQAAACMAAAAAQAAAAMAAAAEAAAAkgAA
AAEAAAACAAAAAWNsb2NrAAAAAAAAAwAAAAwAAAAyZml4ZWQtY2xvY2sAAAAAAwAAAAQAAACaAAAA
AAAAAAMAAAAEAAAApwX14QAAAAADAAAABAAAAIwAAAACAAAAAwAAAAQAAACSAAAAAgAAAAIAAAAB
c2VyaWFsQGZmMDAwMDAwAAAAAAMAAAAdAAAAMmNkbnMsdWFydC1yMXAxMgB4bG54LHh1YXJ0cHMA
AAAAAAAAAwAAABAAAABJAAAAAP8AAAAAAAAAAAAQAAAAAAMAAAAMAAAAWwAAAAAAAAAVAAAABAAA
AAMAAAAIAAAAtwAAAAIAAAACAAAAAwAAAA4AAAC+dWFydF9jbGsAcGNsawAAAAAAAAIAAAABc2Vy
aWFsQGZmMDEwMDAwAAAAAAMAAAAdAAAAMmNkbnMsdWFydC1yMXAxMgB4bG54LHh1YXJ0cHMAAAAA
AAAAAwAAABAAAABJAAAAAP8BAAAAAAAAAAAQAAAAAAMAAAAMAAAAWwAAAAAAAAAWAAAABAAAAAMA
AAAIAAAAtwAAAAIAAAACAAAAAwAAAA4AAAC+dWFydF9jbGsAcGNsawAAAAAAAAIAAAABcGNpQGZj
MDAwMDAwAAAAAAAAAAMAAAAWAAAAMnBjaS1ob3N0LWVjYW0tZ2VuZXJpYwAAAAAAAAMAAAAEAAAA
PXBjaQAAAAADAAAACAAAAMoAAAAAAAAAAAAAAAMAAAAEAAAABgAAAAMAAAADAAAABAAAABUAAAAC
AAAAAwAAAAQAAAB7AAAAAQAAAAMAAAAQAAAA1AAAAAAAAAAAAAAAAAAAAAcAAAADAAAAgAAAAOcA
AAAAAAAAAAAAAAAAAAABAAAAAQAAAAAAAABsAAAAAQAAAAAAAAAAAAAAAAAAAAIAAAABAAAAAAAA
AG0AAAABAAAAAAAAAAAAAAAAAAAAAwAAAAEAAAAAAAAAbgAAAAEAAAAAAAAAAAAAAAAAAAAEAAAA
AQAAAAAAAABvAAAAAQAAAAMAAAAQAAAASQAAAAD8AAAAAAAAAAAQAAAAAAADAAAAHAAAAPUCAAAA
AAAAABAAAAAAAAAAEAAAAAAAAAAAAQAAAAAAAgAAAAIAAAAJbW9kZWwAI2FkZHJlc3MtY2VsbHMA
I3NpemUtY2VsbHMAaW50ZXJydXB0LXBhcmVudABjb21wYXRpYmxlAGRldmljZV90eXBlAHJlZwBl
bmFibGUtbWV0aG9kAGludGVycnVwdHMAaW50ZXJydXB0LWNvbnRyb2xsZXIAI2ludGVycnVwdC1j
ZWxscwBsaW51eCxwaGFuZGxlACNjbG9jay1jZWxscwBjbG9jay1mcmVxdWVuY3kAY2xvY2tzAGNs
b2NrLW5hbWVzAGJ1cy1yYW5nZQBpbnRlcnJ1cHQtbWFwLW1hc2sAaW50ZXJydXB0LW1hcAByYW5n
ZXMA
------=_Part_945_1526922542.1564775186963--
