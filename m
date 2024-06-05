Return-Path: <jailhouse-dev+bncBCMKTTEX5MOBB5G4QKZQMGQEOI2L2QY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F7F8FD5BE
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Jun 2024 20:29:10 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id 3f1490d57ef6-dfa5743655esf285114276.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Jun 2024 11:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717612149; x=1718216949; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQlvwZMN1+1pmaGgoZxxJY8XRSB0Yewu+FdqWUkbvgs=;
        b=S2mSrxfOzXxfmIN9aUBlvOqUED3WxSKeeFLnFMwIPNDb83/Ikyz5ZrciW4No+8a9sF
         wA23HtqoXtIOAQ5O3Cp2Au/1R391QapyF97l+pqZ+PaJFgmvjk2uKQPxBB0Ku2n/+zRj
         g7fT5HWSJyvl+e+56oChAZ2KbJGEARFBYTA5M9ClH0j1WA/VQ2pCekZpmTKjpb8tSrBV
         O7A9jq0Mj6fiZ+cdzOQuOrV5RqVFWGvr0rtLFe032CbqjINpPtuDXtgiAc7xbq2Ux0TQ
         JvkVd7tA6mIR+BFm6DEJHhGm7V9NrloaWYH/L+VhQ1X7H1phUb+WsgyNKUAazP3ajoXV
         3glA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717612149; x=1718216949; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQlvwZMN1+1pmaGgoZxxJY8XRSB0Yewu+FdqWUkbvgs=;
        b=HzeMjrDOOTh0jcWkYhwUMUCyuHkTgw01emw/3lYdRTEs953fBezyIcZMqkkJQB+NwV
         ccvvVmrF7i28q+50sQ/LtpXshbZezc+/JN4gE5+nmxalfwv9RMjUz7uvZUkN6zE78iq6
         mpvoOMJjLF93C9oIrr0AkU4jr/bjrtulXD6shW0iH0fTAYIi8/5IBVn+cSA8UaNz2Yju
         Mae4doN+vJb6v1gb6gU2ZFcoJ4FxWKFfSkp7f9BGtMjZQ+PjrJdYrG5vQ7x7AxPMdFB4
         /UNUHso7340zvUxp8VPm2Fl1iCZZyHTxRnG7dcRnvkc6tDXX6au4PRs80SQfR/8cj4qN
         Rj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717612149; x=1718216949;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQlvwZMN1+1pmaGgoZxxJY8XRSB0Yewu+FdqWUkbvgs=;
        b=cGiXgKBUKmq3O0kkP9R84EzkzSzV5IJ4o7qXLN27Fk9CpaVaj36/bFit+uVmjNvHd1
         vBReSx7S5AXbbl1xY7mg7wXpaFUwImA6dZft1m8lcA76eazYW1s2iY4ftFYplhW2pZwq
         YLWUQSnmW/OChrHBwLK2jtrBAgiVRDe3CuM4Yb4lxppFqyKGl5NlAH1aGd5TtasFjQlT
         /TZ/fXEA/9eK2ftKOTtbKw7VBLrmhCFYh/m/QTdiTYzE3AqLBLTEhTSYcGz65ufDye4J
         cdrSiQmcArphzXD/VUfRzGTvOoxsGxOtAIwQ2tINtfsf9gFbGyvZpCOcedw7lnsM62i+
         MOZg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUyT2pY6kjaX/BWFEwoBLm4bpN3L/YA0tHOtB5MZtLql4106CsU3jWPpkgECfV3gdPhcK7UWeUsWbFBWBwd3tt7VWUpmfs1TIa5cFI=
X-Gm-Message-State: AOJu0YytulC4UKvznD1IV7JfgR17amuthh6QcAbvl72djQpdulFg4ilL
	uoa/LBWQgZEa8nrjn1750jjhwqAYTR5X7DoICeK8CiV/cPKGRqpv
X-Google-Smtp-Source: AGHT+IFeb4WFi35EomTOmBPyoDWZ7+zBK7rltbRGV2wPt05Dd5feblXBCNsvb+DN5EQe7TD9URiTZA==
X-Received: by 2002:a25:6c89:0:b0:dfa:96e4:f54d with SMTP id 3f1490d57ef6-dfacacfeacamr3387764276.41.1717612149382;
        Wed, 05 Jun 2024 11:29:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:aaa6:0:b0:dfa:7878:d377 with SMTP id 3f1490d57ef6-dfacb61181els64506276.1.-pod-prod-01-us;
 Wed, 05 Jun 2024 11:29:08 -0700 (PDT)
X-Received: by 2002:a25:d852:0:b0:de5:bc2f:72bb with SMTP id 3f1490d57ef6-dfacad0c20bmr126655276.12.1717612148054;
        Wed, 05 Jun 2024 11:29:08 -0700 (PDT)
Date: Wed, 5 Jun 2024 11:29:07 -0700 (PDT)
From: JAMES BRYANT <jambel420@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bec25c63-2c3a-43b1-8671-ccefe95573f1n@googlegroups.com>
In-Reply-To: <24d9b651-bfdf-4621-8dd9-5ebbd6f304e1n@googlegroups.com>
References: <24d9b651-bfdf-4621-8dd9-5ebbd6f304e1n@googlegroups.com>
Subject: Re: WHERE TO BUY 1P 300ug LSD BLOTTERS ONLINE UK
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4289_789599669.1717612147277"
X-Original-Sender: jambel420@gmail.com
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

------=_Part_4289_789599669.1717612147277
Content-Type: multipart/alternative; 
	boundary="----=_Part_4290_1801312788.1717612147277"

------=_Part_4290_1801312788.1717612147277
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy Good Trip Mushroom Chocolate Bars Online
Have you ever wished mushrooms tasted better? We=E2=80=99re here to grant t=
hat wish=20
by bringing you our Good Trip Mushroom Chocolate Bar. This bar is tasty,=20
irresistible also, contains a total of 3.5g of Magic Mushrooms ( 6 grams=20
per chocolate square). And can be broken off into squares for flexible=20
shroom dosage.

https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/

IT has an awesome taste and smells good too chocolate. Good Trip Mushroom=
=20
Chocolate Bars makes you trip your face off. So, how could that not be the=
=20
dream?. =E2=80=A2

https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/

Clean High =E2=80=93 We formulated this chocolate bar to produce a clean hi=
gh that=20
won=E2=80=99t leave you crashing after the initial peak.

https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/

True Psychedelic Experience Just cause it doesn=E2=80=99t taste like mushro=
oms=20
doesn=E2=80=99t mean it=E2=80=99s not mushrooms. You won=E2=80=99t find any=
 drop in the quality of=20
your trip, in fact, you may even decide to switch to edibles!
:Sneaky-Sure, Magic Mushrooms are legal in Canada but that doesn=E2=80=99t=
=20
necessarily mean you want to be seen stuffing your face with them For those=
=20
who want to keep it classy and discrete, nibbling on some chocolate is the=
=20
way to go. shroom chocolate bar=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/bec25c63-2c3a-43b1-8671-ccefe95573f1n%40googlegroups.com.

------=_Part_4290_1801312788.1717612147277
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy Good Trip Mushroom Chocolate Bars Online<br />Have you ever wished mush=
rooms tasted better? We=E2=80=99re here to grant that wish by bringing you =
our Good Trip Mushroom Chocolate Bar. This bar is tasty, irresistible also,=
 contains a total of 3.5g of Magic Mushrooms ( 6 grams per chocolate square=
). And can be broken off into squares for flexible shroom dosage.<br /><br =
/>https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/=
<br /><br />IT has an awesome taste and smells good too chocolate. Good Tri=
p Mushroom Chocolate Bars makes you trip your face off. So, how could that =
not be the dream?. =E2=80=A2<br /><br />https://t.me/Ricko_swavy8/product/g=
ood-trip-milk-chocolate-bars-for-sale/<br /><br />Clean High =E2=80=93 We f=
ormulated this chocolate bar to produce a clean high that won=E2=80=99t lea=
ve you crashing after the initial peak.<br /><br />https://t.me/Ricko_swavy=
8/product/good-trip-milk-chocolate-bars-for-sale/<br /><br />True Psychedel=
ic Experience Just cause it doesn=E2=80=99t taste like mushrooms doesn=E2=
=80=99t mean it=E2=80=99s not mushrooms. You won=E2=80=99t find any drop in=
 the quality of your trip, in fact, you may even decide to switch to edible=
s!<br />:Sneaky-Sure, Magic Mushrooms are legal in Canada but that doesn=E2=
=80=99t necessarily mean you want to be seen stuffing your face with them F=
or those who want to keep it classy and discrete, nibbling on some chocolat=
e is the way to go. shroom chocolate bar=C2=A0<br /><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/bec25c63-2c3a-43b1-8671-ccefe95573f1n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/bec25c63-2c3a-43b1-8671-ccefe95573f1n%40googlegroups.co=
m</a>.<br />

------=_Part_4290_1801312788.1717612147277--

------=_Part_4289_789599669.1717612147277--
