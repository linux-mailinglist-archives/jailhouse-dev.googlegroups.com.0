Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBQU55XUQKGQERUCKC4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23b.google.com (mail-oi1-x23b.google.com [IPv6:2607:f8b0:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D89771CD
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 21:04:36 +0200 (CEST)
Received: by mail-oi1-x23b.google.com with SMTP id d204sf21496255oib.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 12:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=m6jXRgCQpY9aeNvIx9WcwEl7Rx1FalnneLmTXdYoHBw=;
        b=hIngpHxpFMi3p2/ojS2fGlSBeYJc6Z0JXGSw2z6o86I/H+f8FmsLh8Gi1WaVq1aUf5
         lgla06lzRcmrOTX531vM2WV71yKj9nHLuCldtkAXDiuFB8yat5VCUkAilwwqgLJbnf8n
         sxleFO8Telb0kg5jl067TN78Wq/xJYFOTkrofQ/wcxzNNvdLu1y5vHc+eUZzjkL/Hvo3
         5Pg1N5gTIfaRgvqgQYEQT3tb/B1xkh0tEx24cmGo5E66efYzgaAfHZAYj3I4sk+GTBF0
         bxcsSBxdh4DDUvGSiuqCH0Ff1/zsibVmm7bQZXonT1wQF3ClZ+GlPeokG7z6VzpegJkK
         Od2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=m6jXRgCQpY9aeNvIx9WcwEl7Rx1FalnneLmTXdYoHBw=;
        b=fTkoGtJ0KMZTMTI1qhRQgHgWNsnFmphJ2PuUDYYmZCQFpzYjLI0xNv1Q8XeT4pVwEb
         UEVU3uqMEhbx9hjk4OL8Cv+/REj6MRUimn0F4G/YfA9EiTh5Ko160udBaR4U/jTBYkdY
         M2eI2E4Wkcn2jHI3Cwf3O4WFaTZOCnYhkPw9PVuqSE8KfFDE+PXvqENFSWqvYaVpk5E6
         Ea9pRUodX1XWKS5UVBehrSOZP1Zt52AwzYGRCHqkIseZ4cmr1ONTkjMlAEO2iUerxBTw
         9wIXkQZCYKQHG3OcMpJs4bltaF2x1X2kNouLtv0XoO/vSqbpA8VpXkqgMPXUmFavuxqN
         cqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=m6jXRgCQpY9aeNvIx9WcwEl7Rx1FalnneLmTXdYoHBw=;
        b=atkMALEsV3HffNt7UV9KNHVYpJ3YByXT1Bq5yIzVoFpaYZDKWBwNVHaC3oAFqD51Ui
         3sh+s7ZjNj54WWa6STqoRuS69Pw5VumGTNjXZwhW3xnrWR3WbKYLqJWJI9prpVSqh2TL
         cj2o/nV8bQyiEhXNQ/40jag2pLvyqfAdS6mS6OgYBIHC3jFhRpDoZ34V6mOq4qhQgop1
         mMEMfPmy9JlUD2WPIGnfhxkJdEMOWfkjVA2rluA1LDwJnazPt/2RDexc8qc8pjWm4f9p
         8OxJF7DDzhxutnX0Cca2da9vNtVKQbOhg3LhL6F3dHIJRDoWN6f/zu/ZEpslGRe5xcUb
         CnkA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXvi15M6J5kj7huie6VEsDv5+KhkztYyGoPZdAj8mYfUGfTZn4G
	OQQmXNOA5829VB3Zw7NnXPI=
X-Google-Smtp-Source: APXvYqwnQrYlw6uEH3+NoD1wW8Ja63btBMlENYUCcu8GtwMuCg8axSkyZuBlaU6DO+dJbL1VbyUfqw==
X-Received: by 2002:a9d:67cf:: with SMTP id c15mr4919071otn.326.1564167875073;
        Fri, 26 Jul 2019 12:04:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:3e45:: with SMTP id h5ls1443927otg.11.gmail; Fri, 26 Jul
 2019 12:04:34 -0700 (PDT)
X-Received: by 2002:a9d:5a82:: with SMTP id w2mr68517850oth.240.1564167874595;
        Fri, 26 Jul 2019 12:04:34 -0700 (PDT)
Date: Fri, 26 Jul 2019 12:04:33 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1726f6bd-680a-46ac-a7f3-937cbba84208@googlegroups.com>
In-Reply-To: <6abaf77f-e4a7-7a9a-2ae9-8d1d8f1388bf@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <c1a63d36-2dd0-5b52-bb16-31794ab93b62@siemens.com>
 <fe00f482-c82c-4f93-8a0e-f73dc955888d@googlegroups.com>
 <b4e7dbee-58cd-3126-ce6b-7b54ee0ef241@siemens.com>
 <211205da-9e38-4178-895a-3ba80f214aa9@googlegroups.com>
 <6abaf77f-e4a7-7a9a-2ae9-8d1d8f1388bf@siemens.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7657_1383694022.1564167874033"
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

------=_Part_7657_1383694022.1564167874033
Content-Type: multipart/alternative; 
	boundary="----=_Part_7658_204927098.1564167874036"

------=_Part_7658_204927098.1564167874036
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The kernel and initramfs are splitted. I don't know how does the=20
decompression factor works, because the kernel image is already=20
decompressed. In this context what value must i place on kernel=20
decomposition factor?

sexta-feira, 26 de Julho de 2019 =C3=A0s 18:46:43 UTC+1, Jan Kiszka escreve=
u:
>
> On 26.07.19 19:28, Jo=C3=A3o Reis wrote:=20
> > No, the initramfs size is uncompressed (compressed is ~170MB). What -k=
=20
> switch=20
> > are you referring to?=20
> >=20
>
> jailhouse cell linux --help=20
> [...]=20
>   --kernel-decomp-factor N, -k N=20
>                         decompression factor of the kernel image, used to=
=20
>                         reserve space between the kernel and the initramf=
s=20
>
> Do you have split kernel and initramfs, or both combined into one?=20
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
jailhouse-dev/1726f6bd-680a-46ac-a7f3-937cbba84208%40googlegroups.com.

------=_Part_7658_204927098.1564167874036
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The kernel and initramfs are splitted. I don&#39;t know ho=
w does the decompression factor works, because the kernel image is already =
decompressed. In this context what value must i place on kernel decompositi=
on factor?<br><br>sexta-feira, 26 de Julho de 2019 =C3=A0s 18:46:43 UTC+1, =
Jan Kiszka escreveu:<blockquote class=3D"gmail_quote" style=3D"margin: 0;ma=
rgin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 26.07.1=
9 19:28, Jo=C3=A3o Reis wrote:
<br>&gt; No, the initramfs size is uncompressed (compressed is ~170MB). Wha=
t -k switch
<br>&gt; are you referring to?
<br>&gt;=20
<br>
<br>jailhouse cell linux --help
<br>[...]
<br>=C2=A0 --kernel-decomp-factor N, -k N
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 decompression factor of the kernel image, used to
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 reserve space between the kernel and the initramfs
<br>
<br>Do you have split kernel and initramfs, or both combined into one?
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
om/d/msgid/jailhouse-dev/1726f6bd-680a-46ac-a7f3-937cbba84208%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/1726f6bd-680a-46ac-a7f3-937cbba84208%40googlegroups.com<=
/a>.<br />

------=_Part_7658_204927098.1564167874036--

------=_Part_7657_1383694022.1564167874033--
