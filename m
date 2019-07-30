Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBUNZQDVAKGQEQ2AC4CQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id B62C47A616
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 12:32:51 +0200 (CEST)
Received: by mail-oi1-x23a.google.com with SMTP id d204sf24605417oib.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 03:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Gk+kVsLp1krFpu+dlAOcn4wrZb5wSBb0mARazAy14Kw=;
        b=Kw4FI6jWN1SfRHDOxP07dwLL9sLtGguPvIHHJIY3EOA3H3CbU31RRGC+ilpUv99fHT
         sTsgRs5x2lSo76vRi6Xb5I0m8zBt/dPUukxdg8YAsx8fnnC4Rg8i8LpEUARp7XmKPohB
         pt8RUazQKjRHZ0O+HPpxA1spgm5BpfSvhafm+D2dMnmzpA0js43JY21ma2mTpDTTH4AI
         jnY6rw/snc/AFe3x7JVWTpx13xl202jxryz7wUgmmfGDQHm2ORpb2ONo+Mo7Dk4paPt1
         D8mkwWgPvis7azRC+F03Wtu3WeB+8oH3yyKjvDrXl9O4bbxZXwvAjO2mRadGF8saWD/B
         pqAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Gk+kVsLp1krFpu+dlAOcn4wrZb5wSBb0mARazAy14Kw=;
        b=SHu3++LMbMm6cZm2X2MnBUDMaYzoWEaZzwmEW77RxZYiRga33oD1noEdxvZveX8iIk
         bq/wirhz5xYZ6HVXBMDOmV+wbPFfJRsAZqICVPIORshuJLbe0B6YlT/X2CzqdbNUzg6h
         Tu8gDvo0JaXkD9/7Ap3anJvw0vjEQsDWwuMxpIC5wk4sKoZU1Ew+249PULQNYLmbu/Bc
         Qb2Br0PLpo8jT/OoaqeGisTkt59OjJJYpEOHSZvHN2H3u1KkFc4KwB2HFFsFgWpaAt5k
         MiHyIhN1o+W8C0OnJYmRdD9Hrizw0gvBKH+XCp4/KbVhFwLkof24PVWahcyjDEHhvEBv
         iQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Gk+kVsLp1krFpu+dlAOcn4wrZb5wSBb0mARazAy14Kw=;
        b=uRSF0kA7CYyhW1VdxY1y2AD/ERxUB0Cf9r3Zuize9j+e1j7ll0B2TUCjeiGQrwYTpW
         C6zfCjwjwsOPj2Idn+HEFtG8R2y8ygY7TuXphGMexxv9DNqk3lLh7wy745wXVTGSleVg
         bQY7yIGQuX6x1RyxBhVV5XVHh9cWAJl9nJugW0jAB+9cOXKMPbhum7mB3RhEhJlYI/Bf
         2biFgNafCfSG7guZbBpW/9aNI/z4J7Hdx51mfHYzZNkb9cDLstZETOqt51oxl0zo/PEx
         fs+G21WMQ9/XckawZYtCWcyPiWT9Qn958/A6jDs0T0gmn+WYoDWQ4zO1xcBN/IBwNDyw
         +jgA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWhNNsdkbpWRKs+dJQR/lH388uzbzwomgxvlfKziQ0wVhQ5tLHh
	Ny9BxnMXG+LCSVPBA2qT7e0=
X-Google-Smtp-Source: APXvYqy0hBxY2TylubkQ8us2hspnWAETcf3aUBzMT4zH7Ra4GbyhvuWbCFhAFVmhEsKNqrt/hJMDNw==
X-Received: by 2002:a9d:7988:: with SMTP id h8mr15743972otm.301.1564482770208;
        Tue, 30 Jul 2019 03:32:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:12c3:: with SMTP id g61ls3312143otg.16.gmail; Tue, 30
 Jul 2019 03:32:49 -0700 (PDT)
X-Received: by 2002:a9d:7348:: with SMTP id l8mr33952375otk.111.1564482769573;
        Tue, 30 Jul 2019 03:32:49 -0700 (PDT)
Date: Tue, 30 Jul 2019 03:32:48 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <dde1cd0e-407e-45b3-ae32-97c445100824@googlegroups.com>
In-Reply-To: <ef7a124c-e5e3-f61b-8ed0-aebf585c65d6@siemens.com>
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
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8796_2059761509.1564482768753"
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

------=_Part_8796_2059761509.1564482768753
Content-Type: multipart/alternative; 
	boundary="----=_Part_8797_1824823283.1564482768753"

------=_Part_8797_1824823283.1564482768753
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This problem is still related to non root cell, when i issue jailhouse cell=
=20
linux.

ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 06:39:59 UTC+1, Jan Kiszka es=
creveu:
>
> On 30.07.19 04:18, Jo=C3=A3o Reis wrote:=20
> > Ok, that's it. But now, another error related to that memory region=20
> appears:=20
> >=20
> > FATAL: instruction abort at 0x4fffe1d0=20
> > FATAL: forbidden access (exception class 0x20)=20
> > Cell state before exception:=20
> >  pc: ffffff80080971d0   lr: ffffff8008768e14 spsr: 600001c5     EL1=20
> >  sp: ffffff8008e73ea0  esr: 20 1 0000086=20
> >  x0: ffffffc04d2b7a00   x1: ffffffc04cff6000   x2: 0000000000000000=20
> >  x3: ffffff8008768de0   x4: 0000000000000015   x5: 00ffffffffffffff=20
> >  x6: 0000000029382596   x7: 0000000000000f94   x8: ffffffc04ff79404=20
> >  x9: 00000000000007df  x10: ffffffc04ff793e4  x11: 0000000000001dd8=20
> > x12: 0000000000000000  x13: 00000000000094e5  x14: 071c71c71c71c71c=20
> > x15: ffffff8008e78000  x16: ffffff800819b1e8  x17: 0000007fa7da3718=20
> > x18: ffffffc04ff7a460  x19: ffffffc04cff6000  x20: ffffffc04cff6018=20
> > x21: ffffffc04d2b7a00  x22: 0000000000000000  x23: ffffffc04cff6000=20
> > x24: 00000009ed76160a  x25: ffffffc04cff6000  x26: ffffff8008e82100=20
> > x27: 0000000000000400  x28: 0000000000df0018  x29: ffffff8008e73ea0=20
> >=20
> > The error happens in an address within the memory region i want to put=
=20
> the Linux=20
> > images (3fd00000-5fffffff : System RAM), and that i declared on the=20
> config file.=20
>
> Which cell raises this error (you cut off that information)? If it is the=
=20
> root=20
> cell, it may lack LOADABLE rights for the region. If it happens after=20
> loading,=20
> you forgot to reserve that memory via "mem=3D" or dtb reservations.=20
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
jailhouse-dev/dde1cd0e-407e-45b3-ae32-97c445100824%40googlegroups.com.

------=_Part_8797_1824823283.1564482768753
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This problem is still related to non root cell, when i iss=
ue jailhouse cell linux.<br><br>ter=C3=A7a-feira, 30 de Julho de 2019 =C3=
=A0s 06:39:59 UTC+1, Jan Kiszka escreveu:<blockquote class=3D"gmail_quote" =
style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-l=
eft: 1ex;">On 30.07.19 04:18, Jo=C3=A3o Reis wrote:
<br>&gt; Ok, that&#39;s it. But now, another error related to that memory r=
egion appears:
<br>&gt;=20
<br>&gt; FATAL: instruction abort at 0x4fffe1d0
<br>&gt; FATAL: forbidden access (exception class 0x20)
<br>&gt; Cell state before exception:
<br>&gt; =C2=A0pc: ffffff80080971d0=C2=A0 =C2=A0lr: ffffff8008768e14 spsr: =
600001c5=C2=A0 =C2=A0 =C2=A0EL1
<br>&gt; =C2=A0sp: ffffff8008e73ea0=C2=A0 esr: 20 1 0000086
<br>&gt; =C2=A0x0: ffffffc04d2b7a00=C2=A0 =C2=A0x1: ffffffc04cff6000=C2=A0 =
=C2=A0x2: 0000000000000000
<br>&gt; =C2=A0x3: ffffff8008768de0=C2=A0 =C2=A0x4: 0000000000000015=C2=A0 =
=C2=A0x5: 00ffffffffffffff
<br>&gt; =C2=A0x6: 0000000029382596=C2=A0 =C2=A0x7: 0000000000000f94=C2=A0 =
=C2=A0x8: ffffffc04ff79404
<br>&gt; =C2=A0x9: 00000000000007df=C2=A0 x10: ffffffc04ff793e4=C2=A0 x11: =
0000000000001dd8
<br>&gt; x12: 0000000000000000=C2=A0 x13: 00000000000094e5=C2=A0 x14: 071c7=
1c71c71c71c
<br>&gt; x15: ffffff8008e78000=C2=A0 x16: ffffff800819b1e8=C2=A0 x17: 00000=
07fa7da3718
<br>&gt; x18: ffffffc04ff7a460=C2=A0 x19: ffffffc04cff6000=C2=A0 x20: fffff=
fc04cff6018
<br>&gt; x21: ffffffc04d2b7a00=C2=A0 x22: 0000000000000000=C2=A0 x23: fffff=
fc04cff6000
<br>&gt; x24: 00000009ed76160a=C2=A0 x25: ffffffc04cff6000=C2=A0 x26: fffff=
f8008e82100
<br>&gt; x27: 0000000000000400=C2=A0 x28: 0000000000df0018=C2=A0 x29: fffff=
f8008e73ea0
<br>&gt;=20
<br>&gt; The error happens in an address within the memory region i want to=
 put the Linux
<br>&gt; images (3fd00000-5fffffff : System RAM), and that i declared on th=
e config file.
<br>
<br>Which cell raises this error (you cut off that information)? If it is t=
he root
<br>cell, it may lack LOADABLE rights for the region. If it happens after l=
oading,
<br>you forgot to reserve that memory via &quot;mem=3D&quot; or dtb reserva=
tions.
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
om/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-97c445100824%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-97c445100824%40googlegroups.com<=
/a>.<br />

------=_Part_8797_1824823283.1564482768753--

------=_Part_8796_2059761509.1564482768753--
