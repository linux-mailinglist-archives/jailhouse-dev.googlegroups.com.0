Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBWH4QDVAKGQEXDXRB3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6C47A90C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 14:55:53 +0200 (CEST)
Received: by mail-oi1-x239.google.com with SMTP id 189sf24748722oii.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 05:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XPXBgSoYogXeqVzmCITtiG37pgzJsehPQYxu60S+iOo=;
        b=lUSAWVg+6GMylbmpI7Xw9dh1HwxtW1F8+SbQBiWxtfQLMEKPM9DnUmRjTU5Xoi9+Uo
         I16k3HglojquR6b7Zg5d4BRl+1C1ZArFz0dxMfJIM/ZfqViUL0kL2qHmY/p8fRxwTvq3
         C6ZSzgB02wiJttjGwM3ZGH0CWnQ1ekEYL7uooa6MM2xiXOC0u/u+Sv6Xid47smvM60to
         qkr0ut98yxXmkBwGKPjxQNrzNP6Zrs/Jd6fXMAyA6wvuElRLHwvuF2nQB/WCIZJFM9N/
         4yrKwK4FDGD31cyKjbZ73jnBv7iAdRTXuFn4KHyaOrFEQ9TGBbed1zqn84EQS1tpbKWv
         buYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XPXBgSoYogXeqVzmCITtiG37pgzJsehPQYxu60S+iOo=;
        b=Wf7/Kvm2unTLooNuMQX3V9b7DIs5QkNl5SByChvai0Nbna0eSu1yJn1suWsdzlQHe2
         /EtNwlkZZSpi81aZUnpbbPCLZYpp2U10XU/itOrq9f7SgBEquwrV4A699j8Uv6PegxZd
         s1Ag4Pz/RB7MvNblS7DX3npPnEqk3ZsA8rkIJT1dAf6nkE7np5LnaF4pYRRNykf+Rhhk
         avfERcmXC8kmg950uj8xkZzlUnQ2gw6FiTRgYXdOvtFk4LZIsvY6/N/YJQnGxZBtnziv
         JISAPel3Y0TQ5+txjo9zTuyj4VzgI4GpLgQzIe/gHVRj3fqbVE9/FBTH0m4efnOZMbZG
         9yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=XPXBgSoYogXeqVzmCITtiG37pgzJsehPQYxu60S+iOo=;
        b=p5o3AimOAlCX+08weS/WG3KdKwpwdkJlTnmH+ym7lbwYfj3iN2NpsP7PK0Dj8Iq097
         eg2wdy48K3JCVyhxlBr3rK7O4JiMK7MsoWx96NG7QEiyPn6eekG1LoUb7+HvtQOX9c3L
         +NeD/k7AwEOHaA9/3JBfDrzrGDWhUtAVndoX/WS7+DqqD+PUJovCWJiv1kxkJd3yOsb+
         wL1L8yFetGhImufLZ/S17+bJYrJ3Hpj5we3uDvAtPgGuZDi97CE5mvJDL/688GflV7r4
         zpSj/ZKLUfeWFNUhfZXSbKmp4FLAL8HDUxyuoWIdGtqZO6D0tYNlrfrkcCGNcszBQoq9
         Eslw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWreJr2LDQcTa4xFfcF3eAG7DoSYfmX7WMWO0CGHWdm2pmKpATT
	Jf5yBE+M2U4Va/jRiaE/W8E=
X-Google-Smtp-Source: APXvYqxNHiGdSVQoCBieTtwqea6lh76pPFTYOdf8HCYP25bMwazmRWkZzx3GxY8mGo6q6bBxr2de3A==
X-Received: by 2002:aca:39c4:: with SMTP id g187mr60045969oia.8.1564491352659;
        Tue, 30 Jul 2019 05:55:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a54:4705:: with SMTP id k5ls9382515oik.13.gmail; Tue, 30 Jul
 2019 05:55:52 -0700 (PDT)
X-Received: by 2002:aca:3158:: with SMTP id x85mr51505359oix.93.1564491351931;
        Tue, 30 Jul 2019 05:55:51 -0700 (PDT)
Date: Tue, 30 Jul 2019 05:55:51 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <39b83770-5562-437f-a25b-415d85dc7c3b@googlegroups.com>
In-Reply-To: <2f6c0983-78e1-73e0-183c-3983dd757ee8@siemens.com>
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
 <e5c36ed1-98a5-4a76-aca0-6589cf9c3108@googlegroups.com>
 <ef7a124c-e5e3-f61b-8ed0-aebf585c65d6@siemens.com>
 <dde1cd0e-407e-45b3-ae32-97c445100824@googlegroups.com>
 <2f6c0983-78e1-73e0-183c-3983dd757ee8@siemens.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8796_283210088.1564491351405"
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

------=_Part_8796_283210088.1564491351405
Content-Type: multipart/alternative; 
	boundary="----=_Part_8797_1286608916.1564491351405"

------=_Part_8797_1286608916.1564491351405
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The rest of the dump is:

"Parking CPU 1 (Cell: "root")"

ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 13:30:47 UTC+1, Jan Kiszka es=
creveu:
>
> On 30.07.19 12:32, Jo=C3=A3o Reis wrote:=20
> > This problem is still related to non root cell, when i issue jailhouse=
=20
> cell linux.=20
> >=20
>
> Which CPU & cell is stopped according to the output?=20
> Your dump is missing the line "Stopped CPU x (Cell: XXX)".=20
>
> Jan=20
>
> > ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 06:39:59 UTC+1, Jan Kiszk=
a escreveu:=20
> >=20
> >     On 30.07.19 04:18, Jo=C3=A3o Reis wrote:=20
> >     > Ok, that's it. But now, another error related to that memory=20
> region appears:=20
> >     >=20
> >     > FATAL: instruction abort at 0x4fffe1d0=20
> >     > FATAL: forbidden access (exception class 0x20)=20
> >     > Cell state before exception:=20
> >     >  pc: ffffff80080971d0   lr: ffffff8008768e14 spsr: 600001c5   =20
>  EL1=20
> >     >  sp: ffffff8008e73ea0  esr: 20 1 0000086=20
> >     >  x0: ffffffc04d2b7a00   x1: ffffffc04cff6000   x2:=20
> 0000000000000000=20
> >     >  x3: ffffff8008768de0   x4: 0000000000000015   x5:=20
> 00ffffffffffffff=20
> >     >  x6: 0000000029382596   x7: 0000000000000f94   x8:=20
> ffffffc04ff79404=20
> >     >  x9: 00000000000007df  x10: ffffffc04ff793e4  x11:=20
> 0000000000001dd8=20
> >     > x12: 0000000000000000  x13: 00000000000094e5  x14:=20
> 071c71c71c71c71c=20
> >     > x15: ffffff8008e78000  x16: ffffff800819b1e8  x17:=20
> 0000007fa7da3718=20
> >     > x18: ffffffc04ff7a460  x19: ffffffc04cff6000  x20:=20
> ffffffc04cff6018=20
> >     > x21: ffffffc04d2b7a00  x22: 0000000000000000  x23:=20
> ffffffc04cff6000=20
> >     > x24: 00000009ed76160a  x25: ffffffc04cff6000  x26:=20
> ffffff8008e82100=20
> >     > x27: 0000000000000400  x28: 0000000000df0018  x29:=20
> ffffff8008e73ea0=20
> >     >=20
> >     > The error happens in an address within the memory region i want t=
o=20
> put the=20
> >     Linux=20
> >     > images (3fd00000-5fffffff : System RAM), and that i declared on=
=20
> the config=20
> >     file.=20
> >=20
> >     Which cell raises this error (you cut off that information)? If it=
=20
> is the root=20
> >     cell, it may lack LOADABLE rights for the region. If it happens=20
> after loading,=20
> >     you forgot to reserve that memory via "mem=3D" or dtb reservations.=
=20
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
> https://groups.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-9=
7c445100824%40googlegroups.com=20
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-9=
7c445100824%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/39b83770-5562-437f-a25b-415d85dc7c3b%40googlegroups.com.

------=_Part_8797_1286608916.1564491351405
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The rest of the dump is:<div><br></div><div>&quot;Parking =
CPU 1 (Cell: &quot;root&quot;)&quot;<br><br>ter=C3=A7a-feira, 30 de Julho d=
e 2019 =C3=A0s 13:30:47 UTC+1, Jan Kiszka escreveu:<blockquote class=3D"gma=
il_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid=
;padding-left: 1ex;">On 30.07.19 12:32, Jo=C3=A3o Reis wrote:
<br>&gt; This problem is still related to non root cell, when i issue jailh=
ouse cell linux.
<br>&gt;=20
<br>
<br>Which CPU &amp; cell is stopped according to the output?
<br>Your dump is missing the line &quot;Stopped CPU x (Cell: XXX)&quot;.
<br>
<br>Jan
<br>
<br>&gt; ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 06:39:59 UTC+1, Jan =
Kiszka escreveu:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 On 30.07.19 04:18, Jo=C3=A3o Reis wrote:
<br>&gt; =C2=A0 =C2=A0 &gt; Ok, that&#39;s it. But now, another error relat=
ed to that memory region appears:
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; FATAL: instruction abort at 0x4fffe1d0
<br>&gt; =C2=A0 =C2=A0 &gt; FATAL: forbidden access (exception class 0x20)
<br>&gt; =C2=A0 =C2=A0 &gt; Cell state before exception:
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0pc: ffffff80080971d0=C2=A0 =C2=A0lr: ffff=
ff8008768e14 spsr: 600001c5=C2=A0 =C2=A0 =C2=A0EL1
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0sp: ffffff8008e73ea0=C2=A0 esr: 20 1 0000=
086
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0x0: ffffffc04d2b7a00=C2=A0 =C2=A0x1: ffff=
ffc04cff6000=C2=A0 =C2=A0x2: 0000000000000000
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0x3: ffffff8008768de0=C2=A0 =C2=A0x4: 0000=
000000000015=C2=A0 =C2=A0x5: 00ffffffffffffff
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0x6: 0000000029382596=C2=A0 =C2=A0x7: 0000=
000000000f94=C2=A0 =C2=A0x8: ffffffc04ff79404
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0x9: 00000000000007df=C2=A0 x10: ffffffc04=
ff793e4=C2=A0 x11: 0000000000001dd8
<br>&gt; =C2=A0 =C2=A0 &gt; x12: 0000000000000000=C2=A0 x13: 00000000000094=
e5=C2=A0 x14: 071c71c71c71c71c
<br>&gt; =C2=A0 =C2=A0 &gt; x15: ffffff8008e78000=C2=A0 x16: ffffff800819b1=
e8=C2=A0 x17: 0000007fa7da3718
<br>&gt; =C2=A0 =C2=A0 &gt; x18: ffffffc04ff7a460=C2=A0 x19: ffffffc04cff60=
00=C2=A0 x20: ffffffc04cff6018
<br>&gt; =C2=A0 =C2=A0 &gt; x21: ffffffc04d2b7a00=C2=A0 x22: 00000000000000=
00=C2=A0 x23: ffffffc04cff6000
<br>&gt; =C2=A0 =C2=A0 &gt; x24: 00000009ed76160a=C2=A0 x25: ffffffc04cff60=
00=C2=A0 x26: ffffff8008e82100
<br>&gt; =C2=A0 =C2=A0 &gt; x27: 0000000000000400=C2=A0 x28: 0000000000df00=
18=C2=A0 x29: ffffff8008e73ea0
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; The error happens in an address within the memo=
ry region i want to put the
<br>&gt; =C2=A0 =C2=A0 Linux
<br>&gt; =C2=A0 =C2=A0 &gt; images (3fd00000-5fffffff : System RAM), and th=
at i declared on the config
<br>&gt; =C2=A0 =C2=A0 file.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Which cell raises this error (you cut off that infor=
mation)? If it is the root
<br>&gt; =C2=A0 =C2=A0 cell, it may lack LOADABLE rights for the region. If=
 it happens after loading,
<br>&gt; =C2=A0 =C2=A0 you forgot to reserve that memory via &quot;mem=3D&q=
uot; or dtb reservations.
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
=3D"MqgLYd6dCgAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascri=
pt:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;;return =
true;">jailho...@<wbr>googlegroups.com</a>
<br>&gt; &lt;mailto:<a href=3D"javascript:" target=3D"_blank" gdf-obfuscate=
d-mailto=3D"MqgLYd6dCgAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;=
javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;=
;return true;">jailhouse-dev+<wbr>unsubscribe@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/dde1cd0=
e-407e-45b3-ae32-97c445100824%40googlegroups.com" target=3D"_blank" rel=3D"=
nofollow" onmousedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid=
/jailhouse-dev/dde1cd0e-407e-45b3-ae32-97c445100824%40googlegroups.com&#39;=
;return true;" onclick=3D"this.href=3D&#39;https://groups.google.com/d/msgi=
d/jailhouse-dev/dde1cd0e-407e-45b3-ae32-97c445100824%40googlegroups.com&#39=
;;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/dde1cd=
0e-<wbr>407e-45b3-ae32-97c445100824%<wbr>40googlegroups.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/dde=
1cd0e-407e-45b3-ae32-97c445100824%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"thi=
s.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e=
-45b3-ae32-97c445100824%40googlegroups.com?utm_medium\x3demail\x26utm_sourc=
e\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.g=
oogle.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-97c445100824%40goog=
legroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;;return true;"=
>https://groups.google.com/d/<wbr>msgid/jailhouse-dev/dde1cd0e-<wbr>407e-45=
b3-ae32-97c445100824%<wbr>40googlegroups.com?utm_medium=3D<wbr>email&amp;ut=
m_source=3Dfooter</a>&gt;.
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/39b83770-5562-437f-a25b-415d85dc7c3b%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/39b83770-5562-437f-a25b-415d85dc7c3b%40googlegroups.com<=
/a>.<br />

------=_Part_8797_1286608916.1564491351405--

------=_Part_8796_283210088.1564491351405--
