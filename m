Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBGW3VKYAMGQE2MWSVPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 61178893B22
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Apr 2024 14:50:36 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id 3f1490d57ef6-dc6b26ce0bbsf7355304276.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Apr 2024 05:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1711975835; x=1712580635; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXPIidByORSmmysl/fT59QpbCcFaVTWwiczstz9cCEk=;
        b=aEYC2kwogp0L3qCeFpWSkl8YIuYPqiZXQ+/jP9/jeDVVAoCa/j3stvc5wYB4Am7DV/
         GU04Gj9atTYtOMaGGaDgzlABJ4dvVKsUCM/N+6zGjwM4qw/Tbbfl6lL/NMDBowJqQ5K5
         ke3iFGYJJWzDTfIwvsyWU5LOsnS52Vx8hk0uxzEIztjTf1ePNBNM7t2sbMJotqy+9zuG
         rW27+THki1AOI7Ou20jwxNKplQ1KsbX0oMq3/urgcFYHkC/c2ZbnPyTMYUgO2p8AgQ4D
         ArHLyypzI0WL47yHrlVz3tt4EDu1pvG+/YzN8lPXHTTVlYhJXo7x4Wh0NJPhTjFj+xkp
         9sGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711975835; x=1712580635; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXPIidByORSmmysl/fT59QpbCcFaVTWwiczstz9cCEk=;
        b=On5fyBp3P902eY8jpf0v0HN+YHwQeWt46usW+/eheLh2Xem26BconlxZUXQD7HhaRi
         yrp9RuQbB0VQRilmGGlz0fbR0deJwpmlceghn3gtszIKi8PqOQTmp/+8NEftu4FvIQ2b
         WzMdvsC7cXhlVHCj2huuNHBrdstimClFiiovWFDllZw7d66oXSd65z7n29214BQB9ucJ
         44PcY4A5mSepLl87V8JDKp7WpiFJ8yfSdAi+OinXfRVPNJRU2paYqpRI/nZbfcMfp282
         UM0zjGWculKmNLfQZZT8k1SM+fdxU0oDoRyR50tJ4iovTQUmk1nPup298NKaTkSCOaWc
         F4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711975835; x=1712580635;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXPIidByORSmmysl/fT59QpbCcFaVTWwiczstz9cCEk=;
        b=VSCdkAYAYqB31kWWzLjEo2prdK7SY8feOj9nMtYnPZ168lxHefLtSKNPi43DJYKanr
         qHjdxhPNb+KUSzmOiAul/ldUORcJZHExBE3bYp5IEg/JTlH/sxMtI3tBH7HJeZelfAwx
         wuvbrU1Y+Gupqh3gFCR2vomVuXdYGPbH9zOHLdaa4eaqTqEf5mUMs9oA6Raree70KjU2
         AHkighQVmFqiGtMDfSlbl5Ewea/YWi20SmwT+bqNVUErWVAD7YDxBs7ePT6kaO15mxiC
         MfUZhdVCkLkgYxdlkXnmkGlNX5t2RbzKGa5vCkCoy/6YsVMqoSvxgVzeKf6rnlwgACuK
         DLhQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVln0vF47sg5MVgcFCGvPR2Bls3qXhIk4I6pwVR/uyZ7Xc3tXypnrMaMaXogJ1uwLCx/DCjLVNIqqWesuKvlguzyHQLD/NrSFhX0EM=
X-Gm-Message-State: AOJu0YxeXM682qThHFiaEGfuVTPZjRkrX9rOHq6lg1+Fh9prJZW1OA8W
	C6KllEvW5QLFzHuONkPq2LZHiM9h23GTtZH9d9eDHInM//WPTJsC
X-Google-Smtp-Source: AGHT+IFeFGgoJnFctCTaWsR2BRd6a5cfhytk6t8eba5rP5oVDA5p2MoQQJoFcK1UwgNF51Xj7Y/j7g==
X-Received: by 2002:a25:5882:0:b0:dcf:3ef5:4d30 with SMTP id m124-20020a255882000000b00dcf3ef54d30mr4445901ybb.17.1711975835159;
        Mon, 01 Apr 2024 05:50:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d3c3:0:b0:dcb:f35a:afeb with SMTP id e186-20020a25d3c3000000b00dcbf35aafebls315784ybf.2.-pod-prod-06-us;
 Mon, 01 Apr 2024 05:50:34 -0700 (PDT)
X-Received: by 2002:a05:6902:230d:b0:dbd:b165:441 with SMTP id do13-20020a056902230d00b00dbdb1650441mr2982304ybb.0.1711975833618;
        Mon, 01 Apr 2024 05:50:33 -0700 (PDT)
Date: Mon, 1 Apr 2024 05:50:33 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e0875091-623c-44fa-b323-d4edfe2d8f29n@googlegroups.com>
In-Reply-To: <CANNWOeL47QN14QG8gzusr=fLG67n8NgWZEcjXqpJ+MugdCp+2Q@mail.gmail.com>
References: <CANNWOeL47QN14QG8gzusr=fLG67n8NgWZEcjXqpJ+MugdCp+2Q@mail.gmail.com>
Subject: Re: Hallo Schatz
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_330554_1146778640.1711975833029"
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

------=_Part_330554_1146778640.1711975833029
Content-Type: multipart/alternative; 
	boundary="----=_Part_330555_1983792668.1711975833029"

------=_Part_330555_1983792668.1711975833029
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

On Monday, February 19, 2024 at 3:59:47=E2=80=AFAM UTC+1 ROSE RICHARD wrote=
:

> Hallo Schatz
> Ich bin Miss.Rose Richard aus Abidjan, Elfenbeink=C3=BCste (C=C3=B4te d'I=
voire). Ich=20
> bin ein 17-j=C3=A4hriges M=C3=A4dchen, eine Waise. Da ich keine Eltern ha=
be, drohen=20
> meine Onkel, mich wegen des Erbes, das mein Vater mir hinterlassen hat,=
=20
> umzubringen.
> Bitte, ich brauche Ihre aufrichtige Hilfe. Ich habe (3.500.000,00 $
> (US-Dollar) Drei Millionen f=C3=BCnfhunderttausend US-Dollar, die ich von=
=20
> meinem verstorbenen Vater geerbt habe, aber er hat das Geld auf ein=20
> Fest-/Suspense Konto bei einer der besten Banken hier in Abidjan=20
> eingezahlt, in Absprache mit der Bank, an die das Geld =C3=BCberwiesen we=
rden=20
> soll ein ausl=C3=A4ndisches Bankkonto f=C3=BCr Investitionen im Ausland, =
er verstarb=20
> jedoch, ohne das Geld zu =C3=BCberweisen.
> Mein Vater hat meinen Namen als seine einzige Tochter f=C3=BCr die n=C3=
=A4chsten=20
> Angeh=C3=B6rigen verwendet, als er das Geld eingezahlt hat, und das Geld =
kann=20
> nur auf ein ausl=C3=A4ndisches Bankkonto =C3=BCberwiesen werden.
> Alles, was ich brauche, ist Ihre Ehrlichkeit als mein ausl=C3=A4ndischer=
=20
> Berater, Ihre Hilfe bei der Anlage des Fonds und Ihre Hilfe bei der=20
> Fortf=C3=BChrung meiner Ausbildung in Ihrem Land.
> Bitte bekunden Sie Ihr Interesse, indem Sie mir zur=C3=BCckschreiben, wen=
n Sie=20
> bereit sind, mir bei diesem Zweck zu helfen. Anschlie=C3=9Fend werde ich =
Ihnen=20
> die erforderlichen Informationen zum weiteren Vorgehen zukommen lassen un=
d=20
> Ihnen anschlie=C3=9Fend 20 % des Gesamtbetrags f=C3=BCr Ihre Hilfe auszah=
len . Danke=20
> f=C3=BCr deine Besorgnis.
> Dein,
> Miss.Rose Richard
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e0875091-623c-44fa-b323-d4edfe2d8f29n%40googlegroups.com.

------=_Part_330555_1983792668.1711975833029
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
 Monday, February 19, 2024 at 3:59:47=E2=80=AFAM UTC+1 ROSE RICHARD wrote:<=
br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; b=
order-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div dir=3D"l=
tr">Hallo Schatz<br>Ich bin Miss.Rose Richard aus Abidjan, Elfenbeink=C3=BC=
ste (C=C3=B4te d&#39;Ivoire). Ich bin ein 17-j=C3=A4hriges M=C3=A4dchen, ei=
ne Waise. Da ich keine Eltern habe, drohen meine Onkel, mich wegen des Erbe=
s, das mein Vater mir hinterlassen hat, umzubringen.<br>Bitte, ich brauche =
Ihre aufrichtige Hilfe. Ich habe (3.500.000,00 $<br>(US-Dollar) Drei Millio=
nen f=C3=BCnfhunderttausend US-Dollar, die ich von meinem verstorbenen Vate=
r geerbt habe, aber er hat das Geld auf ein Fest-/Suspense Konto bei einer =
der besten Banken hier in Abidjan eingezahlt, in Absprache mit der Bank, an=
 die das Geld =C3=BCberwiesen werden soll ein ausl=C3=A4ndisches Bankkonto =
f=C3=BCr Investitionen im Ausland, er verstarb jedoch, ohne das Geld zu =C3=
=BCberweisen.<br>Mein Vater hat meinen Namen als seine einzige Tochter f=C3=
=BCr die n=C3=A4chsten Angeh=C3=B6rigen verwendet, als er das Geld eingezah=
lt hat, und das Geld kann nur auf ein ausl=C3=A4ndisches Bankkonto =C3=BCbe=
rwiesen werden.<br>Alles, was ich brauche, ist Ihre Ehrlichkeit als mein au=
sl=C3=A4ndischer Berater, Ihre Hilfe bei der Anlage des Fonds und Ihre Hilf=
e bei der Fortf=C3=BChrung meiner Ausbildung in Ihrem Land.<br>Bitte bekund=
en Sie Ihr Interesse, indem Sie mir zur=C3=BCckschreiben, wenn Sie bereit s=
ind, mir bei diesem Zweck zu helfen. Anschlie=C3=9Fend werde ich Ihnen die =
erforderlichen Informationen zum weiteren Vorgehen zukommen lassen und Ihne=
n anschlie=C3=9Fend 20 % des Gesamtbetrags f=C3=BCr Ihre Hilfe auszahlen . =
Danke f=C3=BCr deine Besorgnis.<br>Dein,<br>Miss.Rose Richard<br></div>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e0875091-623c-44fa-b323-d4edfe2d8f29n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e0875091-623c-44fa-b323-d4edfe2d8f29n%40googlegroups.co=
m</a>.<br />

------=_Part_330555_1983792668.1711975833029--

------=_Part_330554_1146778640.1711975833029--
