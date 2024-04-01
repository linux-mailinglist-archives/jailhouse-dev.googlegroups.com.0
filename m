Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBLO2VKYAMGQEYTVW3XI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1137.google.com (mail-yw1-x1137.google.com [IPv6:2607:f8b0:4864:20::1137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B06B893B20
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Apr 2024 14:48:47 +0200 (CEST)
Received: by mail-yw1-x1137.google.com with SMTP id 00721157ae682-60ccc3cfa39sf66060887b3.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Apr 2024 05:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1711975726; x=1712580526; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IBy/bwY68HibX6Hr+7ZU8gs0zxTkgwczk40E8vabT1w=;
        b=JsejH+aKlV4zTlkqpD+g1zMMTC9VZH4RNUmmFuqC84rjgQ0gGwNB7szGo4qTbpsDH+
         zeZSxn+nV+35jUaOQozSeRcL8b2ryhA00/QgiX81/8ZyzBsXy8RUd/8I4ZinleH0CHDY
         /qgrxbZENWVs8QMGB/eflMI7hkGB6wp3a/yeRkZxw+eLNVRghXs7XLyDW2PAZN/xV3X+
         KLqz5zmmnYYzQrYYX5kFKYUUWbpHec2WcNiyqXncbitovKwcRMapuuKFVAR78cJQXQwU
         x0aXIgQRt8ri0JjnsSLxj60HqQ0xzYBCZdfAvu5zetH3wDF1cZcm0mwXOgTq88pMQleU
         VrOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711975726; x=1712580526; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBy/bwY68HibX6Hr+7ZU8gs0zxTkgwczk40E8vabT1w=;
        b=DSnkw0K6fk98oCg593HpTOG/L8DMdNFLRhqcOfPogF7hu3rxvmjg3r2keuVv2FjYgI
         hIIFZFqQt2xf2AtKe84YgxGjlnv7HC0UnCtokM73TRBC6Mb9eAcW4Gtttg+BzIxHVfPd
         AJrD4sFKFsDLGDEVhkkBI+part/xgvfvXgiQZGiWsBmIiuXsf50JywBmN0DXP0xot6/d
         Uuyyw4pf8/pJirtAk9Y5W59hoHV4kLqc90bGVUmvj7Zt57ujYE1xV/bl//MGTGURfpJV
         hm8i/npXLQubZ74oHeWJJxoiQX68/T+gvyKRX8ZOKhPhkcVVGLw7p7W3+K/uPzYwZ+q1
         32eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711975726; x=1712580526;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IBy/bwY68HibX6Hr+7ZU8gs0zxTkgwczk40E8vabT1w=;
        b=kS8cApnmGXRiIoBEmDJyvm5wafqwzaF5bRDyh5k/0wU/aazG/+tU6x0g4vR5s46M+m
         13CtKIq66Q564W22yFO7mKw9xW+9KGMr7XwJsuVm9J5i1j6leU00t41nMeDJRVUVYBQZ
         gWzz8PwpD27QIQRQ5gS99LfAXYuMdI/kGipxPqka589dKpYfjS/ZzEHPbT3IIpnPkmXA
         GsSQ5RGxl4Ts5RHAzRc+CAEC4eo/tspWxLSt9J7PRlZJ/+md4TnkZsB4jP7wwhFLvcJa
         rgUwTQsYG962viwTrVN/NaB8iJDivHDdATbq++TnibVtzFFjphlkBBzNugJiiyaV2gPS
         qPxQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVmoVc7/n2lZBwe6MF1hTZQy4tkqQy3kSLwg6P4xJg/rsJ5wREKMZayxL1sPOgsp2LUpxOmMlsEOe/Hrabbc/MK6j3VXFJBXZ2dr9U=
X-Gm-Message-State: AOJu0Yxu/a+CskEakmmVqmIc2lxTv9k5orpKOMa1pQz42uks5Dv9eAzX
	vdJxGsZjKv6c0/FxQZ0kcR8i3yhxaBhfOgt/T9gY9n/l61nzWkX0
X-Google-Smtp-Source: AGHT+IEEkpONAMjBLB2LRkyurwIvfyyv4hug72zMcvIYegl+n/UBESQ3OW9yRJIFgn+DTOhrJ3yJUA==
X-Received: by 2002:a5b:f03:0:b0:dcc:84ae:9469 with SMTP id x3-20020a5b0f03000000b00dcc84ae9469mr6469316ybr.64.1711975725964;
        Mon, 01 Apr 2024 05:48:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:df08:0:b0:dcd:a08f:c83e with SMTP id w8-20020a25df08000000b00dcda08fc83els2848143ybg.2.-pod-prod-07-us;
 Mon, 01 Apr 2024 05:48:44 -0700 (PDT)
X-Received: by 2002:a05:6902:154d:b0:dc7:48ce:d17f with SMTP id r13-20020a056902154d00b00dc748ced17fmr3074884ybu.10.1711975724632;
        Mon, 01 Apr 2024 05:48:44 -0700 (PDT)
Date: Mon, 1 Apr 2024 05:48:44 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <804bc443-2d74-484c-82fb-0d3748bf50aan@googlegroups.com>
In-Reply-To: <723d9677-0e1e-4111-8573-381896c4940fn@googlegroups.com>
References: <723d9677-0e1e-4111-8573-381896c4940fn@googlegroups.com>
Subject: Re: ivshmem-demo not working: unhandled data read
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_395812_67803959.1711975724027"
X-Original-Sender: massimilianodimajo097@gmail.com
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

------=_Part_395812_67803959.1711975724027
Content-Type: multipart/alternative; 
	boundary="----=_Part_395813_97267143.1711975724027"

------=_Part_395813_97267143.1711975724027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER
PAYPAL TRANSFER
CASHAPP TRANSFER
ZELLE TRANSFER
LOAN DEAL
TRANSFER WISE
WESTERN UNION TRANSFER
BITCOIN FLASHING
BANK ACCOUNT LOADING/FLASHING
IBAN TO IBAN TRANSFER
MONEYGRAM TRANSFER
IPIP/DTC
SLBC PROVIDER
CREDIT CARD TOP UP
DUMPS/ PINS
SEPA TRANSFER
WIRE TRANSFER
BITCOIN TOP UP
GLOBALPAY INC US
SKRILL USA
UNIONPAY RECEIVER

Thanks.


NOTE; ONLY SERIOUS / RELIABLE RECEIVERS CAN CONTACT.

DM ME ON WHATSAPP
+44 7529 555638

On Tuesday, February 27, 2024 at 4:17:50=E2=80=AFPM UTC+1 Suhaas Joshi wrot=
e:

> Hello everyone,
>
> I have Jailhouse installed on an am62-sk-lp board. I am trying to run the=
=20
> ivshmem-demo on it. PFA the root and non-root cell config file (this file=
=20
> can also be found in the source code, as configs/arm64/k3-am625-sk.c).=20
>
> I am able to enable Jailhouse with the root cell and create a non-root=20
> cell and load the non-root cell with ivshmem-demo. But when I start the=
=20
> non-root cell, I get this error:
>
> Unhandled data read at 0x76100000(2)
>
> FATAL: unhandled trap (exception class 0x24)
> Cell state before exception:
>  pc: 0000000000005538 lr: 0000000000004884 spsr: 60000005 EL1
>  sp: 0000000000007f90 elr: 0000000000005538 esr: 24 1 1400005
>  x0: 0000000076000000 x1: 0000000000100000 x2: 0000000000000002
>  x3: 0000000000000705 x4: 0000000000001000 x5: 0000000000001000
>  x6: 0000000000000000 x7: 0000000000000000 x8: 0000000000000000
>  x9: 0000000000000000 x10: 0000000000000000 x11: 0000000000000000
> x12: 0000000000000000 x13: 0000000000000000 x14: 0000000000000000
> x15: 0000000000000000 x16: 0000000000000000 x17: 0000000000000000
> x18: 0000000000000000 x19: 0000000000000100 x20: 000000000000ffff
> x21: 000000000000110a x22: 0000000000004106 x23: 0000000000000100
> x24: 0000000000000000 x25: 0000000000000000 x26: 0000000000000000
> x27: 0000000000000000 x28: 0000000000000000 x29: 0000000000000000
>
> Parking CPU 2 (Cell: "inmate-demo")
>
> I am guessing that the problem lies in the pci_mmconfig_base field in the=
=20
> root cell config file. It is currently set to 0x76000000. When I change t=
he=20
> value, the error message doesn't occur. But when I open the other cell=20
> using minicom/tio, I don't see any output, so even though there's no erro=
r,=20
> I don't think the demo is working as expected.
>
> Could someone let me know what the problem is?
>
> Thanks
> Suhaas
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/804bc443-2d74-484c-82fb-0d3748bf50aan%40googlegroups.com.

------=_Part_395813_97267143.1711975724027
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER<br />PAYPAL TRANSFER<br />CASHAPP TRANSFER<b=
r />ZELLE TRANSFER<br />LOAN DEAL<br />TRANSFER WISE<br />WESTERN UNION TRA=
NSFER<br />BITCOIN FLASHING<br />BANK ACCOUNT LOADING/FLASHING<br />IBAN TO=
 IBAN TRANSFER<br />MONEYGRAM TRANSFER<br />IPIP/DTC<br />SLBC PROVIDER<br =
/>CREDIT CARD TOP UP<br />DUMPS/ PINS<br />SEPA TRANSFER<br />WIRE TRANSFER=
<br />BITCOIN TOP UP<br />GLOBALPAY INC US<br />SKRILL USA<br />UNIONPAY RE=
CEIVER<br /><br />Thanks.<br /><br /><br />NOTE; ONLY SERIOUS / RELIABLE RE=
CEIVERS CAN CONTACT.<br /><br />DM ME ON WHATSAPP<br />+44 7529 555638<br /=
><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On=
 Tuesday, February 27, 2024 at 4:17:50=E2=80=AFPM UTC+1 Suhaas Joshi wrote:=
<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; =
border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div>Hello e=
veryone,</div><div><br></div><div>I have Jailhouse installed on an am62-sk-=
lp board. I am trying to run the ivshmem-demo on it. PFA the root and non-r=
oot cell config file (this file can also be found in the source code, as co=
nfigs/arm64/k3-am625-sk.c).=C2=A0</div><div><br></div><div>I am able to ena=
ble Jailhouse with the root cell and create a non-root cell and load the no=
n-root cell with ivshmem-demo. But when I start the non-root cell, I get th=
is error:</div><br><div>Unhandled data read at 0x76100000(2)</div><div><div=
 dir=3D"auto"><div dir=3D"auto"><br></div><div dir=3D"auto">FATAL: unhandle=
d trap (exception class 0x24)</div><div dir=3D"auto">Cell state before exce=
ption:</div><div dir=3D"auto">=C2=A0pc: 0000000000005538   lr: 000000000000=
4884 spsr: 60000005     EL1</div><div dir=3D"auto">=C2=A0sp: 0000000000007f=
90  elr: 0000000000005538  esr: 24 1 1400005</div><div dir=3D"auto">=C2=A0x=
0: 0000000076000000   x1: 0000000000100000   x2: 0000000000000002</div><div=
 dir=3D"auto">=C2=A0x3: 0000000000000705   x4: 0000000000001000   x5: 00000=
00000001000</div><div dir=3D"auto">=C2=A0x6: 0000000000000000   x7: 0000000=
000000000   x8: 0000000000000000</div><div dir=3D"auto">=C2=A0x9: 000000000=
0000000  x10: 0000000000000000  x11: 0000000000000000</div><div dir=3D"auto=
">x12: 0000000000000000  x13: 0000000000000000  x14: 0000000000000000</div>=
<div dir=3D"auto">x15: 0000000000000000  x16: 0000000000000000  x17: 000000=
0000000000</div><div dir=3D"auto">x18: 0000000000000000  x19: 0000000000000=
100  x20: 000000000000ffff</div><div dir=3D"auto">x21: 000000000000110a  x2=
2: 0000000000004106  x23: 0000000000000100</div><div dir=3D"auto">x24: 0000=
000000000000  x25: 0000000000000000  x26: 0000000000000000</div><div dir=3D=
"auto">x27: 0000000000000000  x28: 0000000000000000  x29: 0000000000000000<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Parking CPU 2 (Cell: &qu=
ot;inmate-demo&quot;)</div><div dir=3D"auto"><br></div><div dir=3D"auto">I =
am guessing that the problem lies in the pci_mmconfig_base field in the roo=
t cell config file. It is currently set to 0x76000000. When I change the va=
lue, the error message doesn&#39;t occur. But when I open the other cell us=
ing minicom/tio, I don&#39;t see any output, so even though there&#39;s no =
error, I don&#39;t think the demo is working as expected.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Could someone let me know what the proble=
m is?<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks</div><d=
iv dir=3D"auto">Suhaas<br></div></div>
</div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/804bc443-2d74-484c-82fb-0d3748bf50aan%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/804bc443-2d74-484c-82fb-0d3748bf50aan%40googlegroups.co=
m</a>.<br />

------=_Part_395813_97267143.1711975724027--

------=_Part_395812_67803959.1711975724027--
