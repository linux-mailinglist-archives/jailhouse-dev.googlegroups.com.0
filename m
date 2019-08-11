Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBIPHXXVAKGQELXWB5KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC5D88F02
	for <lists+jailhouse-dev@lfdr.de>; Sun, 11 Aug 2019 03:47:15 +0200 (CEST)
Received: by mail-ot1-x33b.google.com with SMTP id a21sf77396903otk.17
        for <lists+jailhouse-dev@lfdr.de>; Sat, 10 Aug 2019 18:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LbqWWH8l+S2eEQoBFBai5PNl2cl6SoS+qtC1sfWkuEg=;
        b=hogFU03Qo7VaWzUYPJ1Fy5byFTqD5iHLfplT6EKz2SITqeL/beWo0mOwnitGut2Ij6
         iHkyB6Cp4u4SGbloFk9R1mzy++4IrrqBdoOKdMhke3n6/nAZk0D4klrcTZ5rlOejQpNy
         q5XaLpk0Ry2hrVGjwFul8FnAeCN1bVB79FfyjKWuFadG3fZdu/axA+OQ0nkOWzFPF2X/
         /gKc5Q5wSxDWuGy8PhgThGZNvVOtLYRPdlpiaGXrYuk61wpWOTdRHSD+GbBn02+47AZd
         s9vkEWBZ54W2UDtLXPnWoykd3BFgNaZeZVIdaMzF37wn1VjW9f/7eyVJh2qT3ZtwN7T8
         LF+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LbqWWH8l+S2eEQoBFBai5PNl2cl6SoS+qtC1sfWkuEg=;
        b=m/AizG5KteM/fyStxnyfnOtDXlDhQ2VGsgfnetW8vbnpT/gnGC5Rg/HYmg/xij7+gM
         2N/+8fLL/10fuK3BYNNtiBJoBmhvlisxAj68pISDmhlDwuK9AB0h/VKSa0iIsNbvLhXi
         UQYbcb7uA1Inbhvu56WAqUrTrerQyTE4bVzL6TlE46u7o5JE+qI9/HGGeyvUNMr2MVwH
         sZSa4nSOcOpRIyPwsfz15khwB9R8AcJnRZazGBzy4SNNUQH/vmFf7jfHE05yyPg8ZXD3
         63zkl5oVzZeL5m2Zo05HavcLLLnEN7UIIMiU4sUzCIl47J9Dl9teo6CMny4IH8G24pbm
         Telw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=LbqWWH8l+S2eEQoBFBai5PNl2cl6SoS+qtC1sfWkuEg=;
        b=ntvjqOdcfiWNMALZJGXCQpMSHEepomyv+uLEKBTI29GfIrCK5kDBomWxIgHx1u1hHq
         7K0TgjCCDR1U16WlH+wVCPOmQV6WMcOo4mPxjKdvsNQztsbJWs5sxPt0uibuR60qDp4j
         eES5H0+ukZ0IQHkmx5vb2UF5SE3ui6jfz57DVopBxpAQ8hBdFwNT/wCsjM/S3qs2nQKd
         1MoGlCEjxZFkjGgJdF54Dm/N4Xnix+E+WzWSznItWzGFSy5EIsCV710smIa03+9FXTBZ
         FhfRGa6SGw3wCeyvwssXAAONM87roVqSVPY7LnmQzBV+FJUXJh9uGfYuHxV1lcyo1vE4
         SM6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXjn4sIgWsK0/2K4cCaLH4247bA8kjZiH776IdtVfs1nweqx7aN
	9Tt6pUwt2BptEscOyDmmBPY=
X-Google-Smtp-Source: APXvYqzsmeG3oo07+gdnUar707V/iq/17Xz0Gm/1cBh1BLidQcojRKsPff8c+kxq7/kbTys00CfANg==
X-Received: by 2002:a05:6808:3d5:: with SMTP id o21mr10254266oie.108.1565488034201;
        Sat, 10 Aug 2019 18:47:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:8e5:: with SMTP id d5ls2824801oic.9.gmail; Sat, 10
 Aug 2019 18:47:13 -0700 (PDT)
X-Received: by 2002:aca:4f17:: with SMTP id d23mr6488216oib.154.1565488033267;
        Sat, 10 Aug 2019 18:47:13 -0700 (PDT)
Date: Sat, 10 Aug 2019 18:47:12 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2dc2470b-9494-4f43-a582-06c2558fa985@googlegroups.com>
In-Reply-To: <2add490d-0d13-44f6-9873-d7fcbf1c4141@googlegroups.com>
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
 <2add490d-0d13-44f6-9873-d7fcbf1c4141@googlegroups.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_211_1209097816.1565488032690"
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

------=_Part_211_1209097816.1565488032690
Content-Type: multipart/alternative; 
	boundary="----=_Part_212_821227051.1565488032690"

------=_Part_212_821227051.1565488032690
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In my case, the only command i need to issue in Linux non-root, is to=20
execute a code. So, if there is a way to issue a single command to Linux=20
non-root without needing to have a single UART for Linux non-root, it could=
=20
do it too.

quarta-feira, 7 de Agosto de 2019 =C3=A0s 03:21:53 UTC+1, Jo=C3=A3o Reis es=
creveu:
>
> I have just one more question: after  i load Linux as non root, how can i=
=20
> issue commands to it? Do i need another uart? Or can i issue commands to=
=20
> non root Linux sharing uart with root?

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2dc2470b-9494-4f43-a582-06c2558fa985%40googlegroups.com.

------=_Part_212_821227051.1565488032690
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>In my case, the only command i need to issue in Linux=
 non-root, is to execute a code. So, if there is a way to issue a single co=
mmand to Linux non-root without needing to have a single UART for Linux non=
-root, it could do it too.</div><div><br></div>quarta-feira, 7 de Agosto de=
 2019 =C3=A0s 03:21:53 UTC+1, Jo=C3=A3o Reis escreveu:<blockquote class=3D"=
gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc so=
lid;padding-left: 1ex;">I have just one more question: after =C2=A0i load L=
inux as non root, how can i issue commands to it? Do i need another uart? O=
r can i issue commands to non root Linux sharing uart with root?</blockquot=
e></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2dc2470b-9494-4f43-a582-06c2558fa985%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/2dc2470b-9494-4f43-a582-06c2558fa985%40googlegroups.com<=
/a>.<br />

------=_Part_212_821227051.1565488032690--

------=_Part_211_1209097816.1565488032690--
