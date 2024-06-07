Return-Path: <jailhouse-dev+bncBDTPDP6E6MLRBAOFROZQMGQE7QBXJDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1139.google.com (mail-yw1-x1139.google.com [IPv6:2607:f8b0:4864:20::1139])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD09900104
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2024 12:35:47 +0200 (CEST)
Received: by mail-yw1-x1139.google.com with SMTP id 00721157ae682-629f8a92145sf30747307b3.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2024 03:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717756546; x=1718361346; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AFLAdwHL6obz8EHlGiNwE+2e2zAYZ8nn8U+avRcxr1o=;
        b=IcWdZg0qCceR49auhbL8GjGc5Vu5F88WMFK+c58ZVswxfKAovKqgx0SpbkkQg9qbxT
         ouwCWIMCtdv2kDZ7cBNIIdw4uEpMJ2jkM1DDM2PhooYIOS0XVWH0A290cKihaL1ZNih3
         Pr7z8n50Ql+bedcbPZKtLok191piwgtjZ35BLuPMIrQi7OeXZf3+UQFFTwYGH783lzq/
         Q9HPV4UpbLEv+lGvYOdhh7Rkh/gOi9mI5+8z6BruUjzs5CNiPiYPgh62aWV0lnu3+O7s
         mXpne8oJ+Ae2ZkLwMe0xeZ4845E/N1pJlT338lh7hrI8VXKclcI1YbDB/YvYhLJBbmBm
         uoeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717756546; x=1718361346; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFLAdwHL6obz8EHlGiNwE+2e2zAYZ8nn8U+avRcxr1o=;
        b=DalBFBgo7MDptIxu9kmCbvqpuIGl4nf27dJEBtLeuJuIkzAHH/d4IEHAZt6mhsm5Gy
         7WNj2TkZn2O10HQzj+u97hKItWLHIjbDzx4dsy54ijKgSmVHvNwGoRTnUzASavupi6A/
         HZmPtrcXwVRp03AyL1J7FKNLSJe/2KvwXgZ83NaPFw+CM8nUE1VBHoibzgqx+k0q7J3f
         yVQr1JqrNKmZLuLutNzDdUouNwNG6d04OYaEHIHVh7ZwEhrw9UHQBeL0RhQc0+2Ih3uP
         wCp6CIDELcukc6JjbaoF/NmqXC1WKvrklEma6xrIiYeWs/5+3Gij3+r64y3amD1N8ask
         DdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717756546; x=1718361346;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AFLAdwHL6obz8EHlGiNwE+2e2zAYZ8nn8U+avRcxr1o=;
        b=vMnDERkvJ2xA7tC5PZrGn/MYP0A6WW+kWmx7pmMVZkw7U99sMVz+ymm0tq8dfEDqs+
         39vFO1DmXFweepkINOm0HuLcM9rYj4tRYP4myOqnfKnmxI7moG9KO6ZU/52r4mavW7op
         AMwhI/bshm1VqYcWv1JOTIlESWfcGEwz4XLAztZR/CYfbIxEdTnw6d/Vum4GrLCeMTwb
         9N6/w7ouH880XlnE0ABEKGgItxAt7u/1Yl/H7kUWM6CeJVJz8l0Og4gMmuFpSNs1VhPM
         S3k/a7S+LTJyJ4ZGwWOSRDTvZtRSr7mj+yJeGlt26zFwbaDmLn18TiXUFWdDJzszK4WT
         PVkw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUUoSft+ErPGl0fLNkmH6IgFDJimr4uOpqqMRdWDPml9GXUIItn8HhNDfTDregvORPkn6uNJpgicj7WgYE2FR3xpaaT7eQCdCMmqqM=
X-Gm-Message-State: AOJu0YxWaEBWVtAAu9Xk3OkKp55qV1md0UztJSph7GlLA3id5XQ+m3gz
	4wFDt9FgXSCou/DvMzHJXg4oiXNQviwWb+YElRl8iB0CacbVXMGE
X-Google-Smtp-Source: AGHT+IHxS3IxLCmqAbb7m8vRF0TTvVDOE5LKZATdi1+7wtO2j72vP8WLDEH9E4MX02bngoBVLQge2Q==
X-Received: by 2002:a25:df87:0:b0:dfa:4730:ee8f with SMTP id 3f1490d57ef6-dfaf65c574fmr1787248276.61.1717756546329;
        Fri, 07 Jun 2024 03:35:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:1303:0:b0:dfa:81ff:d907 with SMTP id 3f1490d57ef6-dfaf17abab3ls1494800276.2.-pod-prod-08-us;
 Fri, 07 Jun 2024 03:35:44 -0700 (PDT)
X-Received: by 2002:a05:690c:fc6:b0:62c:c5e9:e651 with SMTP id 00721157ae682-62cd5586041mr5961477b3.1.1717756544551;
        Fri, 07 Jun 2024 03:35:44 -0700 (PDT)
Date: Fri, 7 Jun 2024 03:35:44 -0700 (PDT)
From: Macurley denzy <macurleyd@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c50ce2a2-538b-4a9d-b40b-f554756a411bn@googlegroups.com>
In-Reply-To: <8a6f938e-0d19-41a6-b03a-c746a691c426n@googlegroups.com>
References: <6e83c25b-e585-47a6-ad58-3d352bf2665bn@googlegroups.com>
 <a2c87186-0c40-40d5-b4a8-9f93d2fb3904n@googlegroups.com>
 <8a6f938e-0d19-41a6-b03a-c746a691c426n@googlegroups.com>
Subject: Re: ORDER BLUE MEANIE MUSHROOM/ BUY BLUE MEANIE MUSHROOM/ WHERE TO
 BUY BLUE MEANIE MUSHROOM CHOCOLATE BARS ONLINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_204686_913372328.1717756544104"
X-Original-Sender: macurleyd@gmail.com
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

------=_Part_204686_913372328.1717756544104
Content-Type: multipart/alternative; 
	boundary="----=_Part_204687_2076946011.1717756544104"

------=_Part_204687_2076946011.1717756544104
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy all your psychedelic products with me including clone cards
All products are available for deliveries and drop offs
Fast shipping and delivery of packages to all locations worldwide
Let me know with your orders
Text me on telegram @michaelhardy33
You can also join my channel for more products and reviews,link below

https://t.me/psychedelicfakenotes
https://t.me/psychedelicfakenotes
https://t.me/psychedelicfakenotes
https://t.me/psychedelicfakenotes

You can let me know anytime with your orders
Prices are also slightly negotiable depending on the quantity needed

Call or text +12099894742

On Saturday 1 June 2024 at 09:30:42 UTC+1 Dwayne Mickey wrote:

>
> Blue meanie mushrooms (Panaeolus cyanescens, formerly Copelandia=20
> cyanescens) =E2=80=94 also known as =E2=80=9Cblue meanies=E2=80=9D =E2=80=
=94 are a highly potent species of=20
> psilocybin mushroom. You will notice, however, that the first part of its=
=20
> scientific name (Panaeolus) is different from other species of magic=20
> mushrooms (e.g. Psilocybe cubensis, Psilocybe semilanceata). This is=20
> because it belongs to a different genus. Mushrooms from the genus Panaeol=
us=20
> are common, and they grow all over the world in tropical and temperate=20
> environments.
>
> Yet while blue meanies mushroom do not belong to the genus Psilocybe (as=
=20
> most magic mushrooms do), they still contain the same psychedelic=20
> compounds: psilocybin and psilocin. Many users seek out blue meanies=20
> mushroom because they are one of the most potent magic mushrooms, so you=
=20
> don=E2=80=99t need to take as much to achieve desired effects.
>
> https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online=
/
>
> Blue Meanie Mushroom Potency
> Are blue meanies mushrooms strong? The short answer is an emphatic =E2=80=
=9Cyes=E2=80=9D.=20
> But you=E2=80=99ll likely want to know just how strong they are.
>
> Albert Hofmann (the Swiss chemist who first synthesized LSD) analyzed=20
> Panaeolus cyanescens in the 1960s (they were then known as Copelandia=20
> cyanescens). He found they had high concentrations of psilocin but only=
=20
> slight quantities of psilocybin.
>
> https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online=
/
>
> High concentrations of psilocin mean that the effects of blue meanies may=
=20
> come on relatively quickly. This is because psilocin is the psychoactive=
=20
> chemical that causes psychedelic effects, whereas psilocybin is a prodrug=
=20
> that the body metabolizes into psilocin after ingestion.
>
> It is often reported that blue meanies are two to three times the strengt=
h=20
> of Psilocybe cubensis. But there is little data to support such claims.=
=20
> T.C. Stivje, in 1992, found that they were variable in their potency. The=
y=20
> can contain 0.17 to 0.95 percent psilocin and 0.16 to 0.19 psilocybin.=20
> Psilocybe cubensis, for comparison, has been found to have concentrations=
=20
> of psilocin and psilocybin ranging from 0.14 and 0.42 percent and 0.37 an=
d=20
> 1.30 percent, respectively.
>
> https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online=
/
>
> However, research from 2010 =E2=80=94 based on commercially grown magic m=
ushrooms=20
> seized by German customs authorities =E2=80=94 reveals that the highest t=
otal=20
> amounts of psilocin were detected in dried Panaeolus cyanescens, reaching=
=20
> up to 3.00+/-0.24 mg per 100 mg. This makes modern commercially cultivate=
d=20
> strains of this species the most potent psychedelic mushroom ever describ=
ed=20
> in published research.
>
> The above discussion shows that there may be some uncertainty regarding=
=20
> just how potent blue meanies are. Nonetheless, a good rule of thumb is th=
at=20
> they are generally quite potent. This means you should take a lower dosag=
e=20
> of them compared to less potent species of magic mushrooms (assuming you=
=20
> want a similar intensity of effects).
>
> https://Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/
>
> For example, Erowid lists the following dosages for Psilocybe cubensis, a=
=20
> medium strength psilocybin mushroom:
>
> Light: 0.25-1 g
> Common: 1-2.5 g
> Strong: 2.5-5 g
> Heavy: 5+ g
> Based on the levels of potency that blue meanies can reach, it is=20
> generally recommended to take half the normal dose of Psilocybe cubensis,=
=20
> and see what the effects are like.
>
> With this in mind, as well as Erowid=E2=80=99s dosage recommendations for=
=20
> Psilocybe cubensis, the following dosages for blue meanie mushrooms are a=
=20
> good rule of thumb:
> On Friday, May 31, 2024 at 12:26:50=E2=80=AFAM UTC+1 Will Smichel wrote:
>
>> Blue meanie mushrooms (Panaeolus cyanescens, formerly Copelandia=20
>> cyanescens) =E2=80=94 also known as =E2=80=9Cblue meanies=E2=80=9D =E2=
=80=94 are a highly potent species of=20
>> psilocybin mushroom. You will notice, however, that the first part of it=
s=20
>> scientific name (Panaeolus) is different from other species of magic=20
>> mushrooms (e.g. Psilocybe cubensis, Psilocybe semilanceata). This is=20
>> because it belongs to a different genus. Mushrooms from the genus Panaeo=
lus=20
>> are common, and they grow all over the world in tropical and temperate=
=20
>> environments.  Yet while blue meanies mushroom do not belong to the genu=
s=20
>> Psilocybe (as most magic mushrooms do), they still contain the same=20
>> psychedelic compounds: psilocybin and psilocin. Many users seek out blue=
=20
>> meanies mushroom because they are one of the most potent magic mushrooms=
,=20
>> so you don=E2=80=99t need to take as much to achieve desired effects. =
=20
>> https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-onlin=
e/ =20
>> Blue Meanie Mushroom Potency Are blue meanies mushrooms strong? The shor=
t=20
>> answer is an emphatic =E2=80=9Cyes=E2=80=9D. But you=E2=80=99ll likely w=
ant to know just how strong=20
>> they are.  Albert Hofmann (the Swiss chemist who first synthesized LSD)=
=20
>> analyzed Panaeolus cyanescens in the 1960s (they were then known as=20
>> Copelandia cyanescens). He found they had high concentrations of psiloci=
n=20
>> but only slight quantities of psilocybin. =20
>> https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-onlin=
e/ =20
>> High concentrations of psilocin mean that the effects of blue meanies ma=
y=20
>> come on relatively quickly. This is because psilocin is the psychoactive=
=20
>> chemical that causes psychedelic effects, whereas psilocybin is a prodru=
g=20
>> that the body metabolizes into psilocin after ingestion.  It is often=20
>> reported that blue meanies are two to three times the strength of Psiloc=
ybe=20
>> cubensis. But there is little data to support such claims. T.C. Stivje, =
in=20
>> 1992, found that they were variable in their potency. They can contain 0=
.17=20
>> to 0.95 percent psilocin and 0.16 to 0.19 psilocybin. Psilocybe cubensis=
,=20
>> for comparison, has been found to have concentrations of psilocin and=20
>> psilocybin ranging from 0.14 and 0.42 percent and 0.37 and 1.30 percent,=
=20
>> respectively. =20
>> https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-onlin=
e/ =20
>> However, research from 2010 =E2=80=94 based on commercially grown magic =
mushrooms=20
>> seized by German customs authorities =E2=80=94 reveals that the highest =
total=20
>> amounts of psilocin were detected in dried Panaeolus cyanescens, reachin=
g=20
>> up to 3.00+/-0.24 mg per 100 mg. This makes modern commercially cultivat=
ed=20
>> strains of this species the most potent psychedelic mushroom ever descri=
bed=20
>> in published research.  The above discussion shows that there may be som=
e=20
>> uncertainty regarding just how potent blue meanies are. Nonetheless, a g=
ood=20
>> rule of thumb is that they are generally quite potent. This means you=20
>> should take a lower dosage of them compared to less potent species of ma=
gic=20
>> mushrooms (assuming you want a similar intensity of effects). =20
>> https://Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/ =
=20
>> For example, Erowid lists the following dosages for Psilocybe cubensis, =
a=20
>> medium strength psilocybin mushroom:  Light: 0.25-1 g Common: 1-2.5 g=20
>> Strong: 2.5-5 g Heavy: 5+ g Based on the levels of potency that blue=20
>> meanies can reach, it is generally recommended to take half the normal d=
ose=20
>> of Psilocybe cubensis, and see what the effects are like.  With this in=
=20
>> mind, as well as Erowid=E2=80=99s dosage recommendations for Psilocybe c=
ubensis,=20
>> the following dosages for blue meanie mushrooms are a good rule of thumb=
:
>>
>> On Thursday, May 30, 2024 at 5:30:34=E2=80=AFPM UTC+1 Larry Cruz wrote:
>>
>>> Blue meanie mushrooms (Panaeolus cyanescens, formerly Copelandia=20
>>> cyanescens) =E2=80=94 also known as =E2=80=9Cblue meanies=E2=80=9D =E2=
=80=94 are a highly potent species of=20
>>> psilocybin mushroom. You will notice, however, that the first part of i=
ts=20
>>> scientific name (Panaeolus) is different from other species of magic=20
>>> mushrooms (e.g. Psilocybe cubensis, Psilocybe semilanceata). This is=20
>>> because it belongs to a different genus. Mushrooms from the genus Panae=
olus=20
>>> are common, and they grow all over the world in tropical and temperate=
=20
>>> environments.
>>>
>>> Yet while blue meanies mushroom do not belong to the genus Psilocybe (a=
s=20
>>> most magic mushrooms do), they still contain the same psychedelic=20
>>> compounds: psilocybin and psilocin. Many users seek out blue meanies=20
>>> mushroom because they are one of the most potent magic mushrooms, so yo=
u=20
>>> don=E2=80=99t need to take as much to achieve desired effects.
>>>
>>>
>>> https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-onli=
ne/
>>>
>>> Blue Meanie Mushroom Potency
>>> Are blue meanies mushrooms strong? The short answer is an emphatic=20
>>> =E2=80=9Cyes=E2=80=9D. But you=E2=80=99ll likely want to know just how =
strong they are.
>>>
>>> Albert Hofmann (the Swiss chemist who first synthesized LSD) analyzed=
=20
>>> Panaeolus cyanescens in the 1960s (they were then known as Copelandia=
=20
>>> cyanescens). He found they had high concentrations of psilocin but only=
=20
>>> slight quantities of psilocybin.
>>>
>>>
>>> https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-onli=
ne/
>>>
>>> High concentrations of psilocin mean that the effects of blue meanies=
=20
>>> may come on relatively quickly. This is because psilocin is the=20
>>> psychoactive chemical that causes psychedelic effects, whereas psilocyb=
in=20
>>> is a prodrug that the body metabolizes into psilocin after ingestion.
>>>
>>> It is often reported that blue meanies are two to three times the=20
>>> strength of Psilocybe cubensis. But there is little data to support suc=
h=20
>>> claims. T.C. Stivje, in 1992, found that they were variable in their=20
>>> potency. They can contain 0.17 to 0.95 percent psilocin and 0.16 to 0.1=
9=20
>>> psilocybin. Psilocybe cubensis, for comparison, has been found to have=
=20
>>> concentrations of psilocin and psilocybin ranging from 0.14 and 0.42=20
>>> percent and 0.37 and 1.30 percent, respectively.
>>>
>>>
>>> https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-onli=
ne/
>>>
>>> However, research from 2010 =E2=80=94 based on commercially grown magic=
=20
>>> mushrooms seized by German customs authorities =E2=80=94 reveals that t=
he highest=20
>>> total amounts of psilocin were detected in dried Panaeolus cyanescens,=
=20
>>> reaching up to 3.00+/-0.24 mg per 100 mg. This makes modern commerciall=
y=20
>>> cultivated strains of this species the most potent psychedelic mushroom=
=20
>>> ever described in published research.
>>>
>>> The above discussion shows that there may be some uncertainty regarding=
=20
>>> just how potent blue meanies are. Nonetheless, a good rule of thumb is =
that=20
>>> they are generally quite potent. This means you should take a lower dos=
age=20
>>> of them compared to less potent species of magic mushrooms (assuming yo=
u=20
>>> want a similar intensity of effects).
>>>
>>> https://Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/
>>>
>>> For example, Erowid lists the following dosages for Psilocybe cubensis,=
=20
>>> a medium strength psilocybin mushroom:
>>>
>>> Light: 0.25-1 g
>>> Common: 1-2.5 g
>>> Strong: 2.5-5 g
>>> Heavy: 5+ g
>>> Based on the levels of potency that blue meanies can reach, it is=20
>>> generally recommended to take half the normal dose of Psilocybe cubensi=
s,=20
>>> and see what the effects are like.
>>>
>>> With this in mind, as well as Erowid=E2=80=99s dosage recommendations f=
or=20
>>> Psilocybe cubensis, the following dosages for blue meanie mushrooms are=
 a=20
>>> good rule of thumb:
>>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c50ce2a2-538b-4a9d-b40b-f554756a411bn%40googlegroups.com.

------=_Part_204687_2076946011.1717756544104
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy all your psychedelic products with me including clone cards<br />All pr=
oducts are available for deliveries and drop offs<br />Fast shipping and de=
livery of packages to all locations worldwide<br />Let me know with your or=
ders<br />Text me on telegram @michaelhardy33<br />You can also join my cha=
nnel for more products and reviews,link below<br /><br />https://t.me/psych=
edelicfakenotes<br />https://t.me/psychedelicfakenotes<br />https://t.me/ps=
ychedelicfakenotes<br />https://t.me/psychedelicfakenotes<br /><br />You ca=
n let me know anytime with your orders<br />Prices are also slightly negoti=
able depending on the quantity needed<br /><br />Call or text +12099894742<=
br /><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr=
">On Saturday 1 June 2024 at 09:30:42 UTC+1 Dwayne Mickey wrote:<br/></div>=
<blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left=
: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><br>Blue meanie mushroo=
ms (Panaeolus cyanescens, formerly Copelandia cyanescens) =E2=80=94 also kn=
own as =E2=80=9Cblue meanies=E2=80=9D =E2=80=94 are a highly potent species=
 of psilocybin mushroom. You will notice, however, that the first part of i=
ts scientific name (Panaeolus) is different from other species of magic mus=
hrooms (e.g. Psilocybe cubensis, Psilocybe semilanceata). This is because i=
t belongs to a different genus. Mushrooms from the genus Panaeolus are comm=
on, and they grow all over the world in tropical and temperate environments=
.<div><br></div><div>Yet while blue meanies mushroom do not belong to the g=
enus Psilocybe (as most magic mushrooms do), they still contain the same ps=
ychedelic compounds: psilocybin and psilocin. Many users seek out blue mean=
ies mushroom because they are one of the most potent magic mushrooms, so yo=
u don=E2=80=99t need to take as much to achieve desired effects.</div><div>=
<br></div><div><a href=3D"https://t.me/Ricko_swavy8/product/buy-blue-meanie=
s-magic-mushrooms-online/" target=3D"_blank" rel=3D"nofollow" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://t.me/Ricko=
_swavy8/product/buy-blue-meanies-magic-mushrooms-online/&amp;source=3Dgmail=
&amp;ust=3D1717842934885000&amp;usg=3DAOvVaw04CcVf6ly-qfvk6vsxFQ8h">https:/=
/t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/</a></di=
v><div><br></div><div>Blue Meanie Mushroom Potency</div><div>Are blue meani=
es mushrooms strong? The short answer is an emphatic =E2=80=9Cyes=E2=80=9D.=
 But you=E2=80=99ll likely want to know just how strong they are.</div><div=
><br></div><div>Albert Hofmann (the Swiss chemist who first synthesized LSD=
) analyzed Panaeolus cyanescens in the 1960s (they were then known as Copel=
andia cyanescens). He found they had high concentrations of psilocin but on=
ly slight quantities of psilocybin.</div><div><br></div><div><a href=3D"htt=
ps://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/" ta=
rget=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google=
.com/url?hl=3Den-GB&amp;q=3Dhttps://t.me/Ricko_swavy8/product/buy-blue-mean=
ies-magic-mushrooms-online/&amp;source=3Dgmail&amp;ust=3D1717842934885000&a=
mp;usg=3DAOvVaw04CcVf6ly-qfvk6vsxFQ8h">https://t.me/Ricko_swavy8/product/bu=
y-blue-meanies-magic-mushrooms-online/</a></div><div><br></div><div>High co=
ncentrations of psilocin mean that the effects of blue meanies may come on =
relatively quickly. This is because psilocin is the psychoactive chemical t=
hat causes psychedelic effects, whereas psilocybin is a prodrug that the bo=
dy metabolizes into psilocin after ingestion.</div><div><br></div><div>It i=
s often reported that blue meanies are two to three times the strength of P=
silocybe cubensis. But there is little data to support such claims. T.C. St=
ivje, in 1992, found that they were variable in their potency. They can con=
tain 0.17 to 0.95 percent psilocin and 0.16 to 0.19 psilocybin. Psilocybe c=
ubensis, for comparison, has been found to have concentrations of psilocin =
and psilocybin ranging from 0.14 and 0.42 percent and 0.37 and 1.30 percent=
, respectively.</div><div><br></div><div><a href=3D"https://t.me/Ricko_swav=
y8/product/buy-blue-meanies-magic-mushrooms-online/" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den-GB=
&amp;q=3Dhttps://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms=
-online/&amp;source=3Dgmail&amp;ust=3D1717842934885000&amp;usg=3DAOvVaw04Cc=
Vf6ly-qfvk6vsxFQ8h">https://t.me/Ricko_swavy8/product/buy-blue-meanies-magi=
c-mushrooms-online/</a></div><div><br></div><div>However, research from 201=
0 =E2=80=94 based on commercially grown magic mushrooms seized by German cu=
stoms authorities =E2=80=94 reveals that the highest total amounts of psilo=
cin were detected in dried Panaeolus cyanescens, reaching up to 3.00+/-0.24=
 mg per 100 mg. This makes modern commercially cultivated strains of this s=
pecies the most potent psychedelic mushroom ever described in published res=
earch.</div><div><br></div><div>The above discussion shows that there may b=
e some uncertainty regarding just how potent blue meanies are. Nonetheless,=
 a good rule of thumb is that they are generally quite potent. This means y=
ou should take a lower dosage of them compared to less potent species of ma=
gic mushrooms (assuming you want a similar intensity of effects).</div><div=
><br></div><div><a href=3D"https://Ricko_swavy8/product/buy-blue-meanies-ma=
gic-mushrooms-online/" target=3D"_blank" rel=3D"nofollow" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://Ricko_swavy8/p=
roduct/buy-blue-meanies-magic-mushrooms-online/&amp;source=3Dgmail&amp;ust=
=3D1717842934885000&amp;usg=3DAOvVaw23NEH0zK_01YezlGLDBthH">https://Ricko_s=
wavy8/product/buy-blue-meanies-magic-mushrooms-online/</a></div><div><br></=
div><div>For example, Erowid lists the following dosages for Psilocybe cube=
nsis, a medium strength psilocybin mushroom:</div><div><br></div><div>Light=
: 0.25-1 g</div><div>Common: 1-2.5 g</div><div>Strong: 2.5-5 g</div><div>He=
avy: 5+ g</div><div>Based on the levels of potency that blue meanies can re=
ach, it is generally recommended to take half the normal dose of Psilocybe =
cubensis, and see what the effects are like.</div><div><br></div><div>With =
this in mind, as well as Erowid=E2=80=99s dosage recommendations for Psiloc=
ybe cubensis, the following dosages for blue meanie mushrooms are a good ru=
le of thumb:</div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gma=
il_attr">On Friday, May 31, 2024 at 12:26:50=E2=80=AFAM UTC+1 Will Smichel =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Blue meanie mus=
hrooms (Panaeolus cyanescens, formerly Copelandia cyanescens) =E2=80=94 als=
o known as =E2=80=9Cblue meanies=E2=80=9D =E2=80=94 are a highly potent spe=
cies of psilocybin mushroom. You will notice, however, that the first part =
of its scientific name (Panaeolus) is different from other species of magic=
 mushrooms (e.g. Psilocybe cubensis, Psilocybe semilanceata). This is becau=
se it belongs to a different genus. Mushrooms from the genus Panaeolus are =
common, and they grow all over the world in tropical and temperate environm=
ents.=C2=A0
Yet while blue meanies mushroom do not belong to the genus Psilocybe (as mo=
st magic mushrooms do), they still contain the same psychedelic compounds: =
psilocybin and psilocin. Many users seek out blue meanies mushroom because =
they are one of the most potent magic mushrooms, so you don=E2=80=99t need =
to take as much to achieve desired effects.=C2=A0
<a href=3D"https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushroo=
ms-online/" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://t.me/Ricko_swavy8/product=
/buy-blue-meanies-magic-mushrooms-online/&amp;source=3Dgmail&amp;ust=3D1717=
842934885000&amp;usg=3DAOvVaw04CcVf6ly-qfvk6vsxFQ8h">https://t.me/Ricko_swa=
vy8/product/buy-blue-meanies-magic-mushrooms-online/</a>=C2=A0
Blue Meanie Mushroom Potency
Are blue meanies mushrooms strong? The short answer is an emphatic =E2=80=
=9Cyes=E2=80=9D. But you=E2=80=99ll likely want to know just how strong the=
y are.=C2=A0
Albert Hofmann (the Swiss chemist who first synthesized LSD) analyzed Panae=
olus cyanescens in the 1960s (they were then known as Copelandia cyanescens=
). He found they had high concentrations of psilocin but only slight quanti=
ties of psilocybin.=C2=A0
<a href=3D"https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushroo=
ms-online/" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://t.me/Ricko_swavy8/product=
/buy-blue-meanies-magic-mushrooms-online/&amp;source=3Dgmail&amp;ust=3D1717=
842934885000&amp;usg=3DAOvVaw04CcVf6ly-qfvk6vsxFQ8h">https://t.me/Ricko_swa=
vy8/product/buy-blue-meanies-magic-mushrooms-online/</a>=C2=A0
High concentrations of psilocin mean that the effects of blue meanies may c=
ome on relatively quickly. This is because psilocin is the psychoactive che=
mical that causes psychedelic effects, whereas psilocybin is a prodrug that=
 the body metabolizes into psilocin after ingestion.=C2=A0
It is often reported that blue meanies are two to three times the strength =
of Psilocybe cubensis. But there is little data to support such claims. T.C=
. Stivje, in 1992, found that they were variable in their potency. They can=
 contain 0.17 to 0.95 percent psilocin and 0.16 to 0.19 psilocybin. Psilocy=
be cubensis, for comparison, has been found to have concentrations of psilo=
cin and psilocybin ranging from 0.14 and 0.42 percent and 0.37 and 1.30 per=
cent, respectively.=C2=A0
<a href=3D"https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushroo=
ms-online/" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://t.me/Ricko_swavy8/product=
/buy-blue-meanies-magic-mushrooms-online/&amp;source=3Dgmail&amp;ust=3D1717=
842934885000&amp;usg=3DAOvVaw04CcVf6ly-qfvk6vsxFQ8h">https://t.me/Ricko_swa=
vy8/product/buy-blue-meanies-magic-mushrooms-online/</a>=C2=A0
However, research from 2010 =E2=80=94 based on commercially grown magic mus=
hrooms seized by German customs authorities =E2=80=94 reveals that the high=
est total amounts of psilocin were detected in dried Panaeolus cyanescens, =
reaching up to 3.00+/-0.24 mg per 100 mg. This makes modern commercially cu=
ltivated strains of this species the most potent psychedelic mushroom ever =
described in published research.=C2=A0
The above discussion shows that there may be some uncertainty regarding jus=
t how potent blue meanies are. Nonetheless, a good rule of thumb is that th=
ey are generally quite potent. This means you should take a lower dosage of=
 them compared to less potent species of magic mushrooms (assuming you want=
 a similar intensity of effects).=C2=A0
<a href=3D"https://Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-on=
line/" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Den-GB&amp;q=3Dhttps://Ricko_swavy8/product/buy-blue-=
meanies-magic-mushrooms-online/&amp;source=3Dgmail&amp;ust=3D17178429348850=
00&amp;usg=3DAOvVaw23NEH0zK_01YezlGLDBthH">https://Ricko_swavy8/product/buy=
-blue-meanies-magic-mushrooms-online/</a>=C2=A0
For example, Erowid lists the following dosages for Psilocybe cubensis, a m=
edium strength psilocybin mushroom:=C2=A0
Light: 0.25-1 g
Common: 1-2.5 g
Strong: 2.5-5 g
Heavy: 5+ g
Based on the levels of potency that blue meanies can reach, it is generally=
 recommended to take half the normal dose of Psilocybe cubensis, and see wh=
at the effects are like.=C2=A0
With this in mind, as well as Erowid=E2=80=99s dosage recommendations for P=
silocybe cubensis, the following dosages for blue meanie mushrooms are a go=
od rule of thumb:<br><br><div class=3D"gmail_quote"><div dir=3D"auto" class=
=3D"gmail_attr">On Thursday, May 30, 2024 at 5:30:34=E2=80=AFPM UTC+1 Larry=
 Cruz wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Blue mean=
ie mushrooms (Panaeolus cyanescens, formerly Copelandia cyanescens) =E2=80=
=94 also known as =E2=80=9Cblue meanies=E2=80=9D =E2=80=94 are a highly pot=
ent species of psilocybin mushroom. You will notice, however, that the firs=
t part of its scientific name (Panaeolus) is different from other species o=
f magic mushrooms (e.g. Psilocybe cubensis, Psilocybe semilanceata). This i=
s because it belongs to a different genus. Mushrooms from the genus Panaeol=
us are common, and they grow all over the world in tropical and temperate e=
nvironments.<div><br></div><div>Yet while blue meanies mushroom do not belo=
ng to the genus Psilocybe (as most magic mushrooms do), they still contain =
the same psychedelic compounds: psilocybin and psilocin. Many users seek ou=
t blue meanies mushroom because they are one of the most potent magic mushr=
ooms, so you don=E2=80=99t need to take as much to achieve desired effects.=
</div><div><br></div><div><a href=3D"https://t.me/Ricko_swavy8/product/buy-=
blue-meanies-magic-mushrooms-online/" rel=3D"nofollow" target=3D"_blank" da=
ta-saferedirecturl=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps:/=
/t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/&amp;sou=
rce=3Dgmail&amp;ust=3D1717842934885000&amp;usg=3DAOvVaw04CcVf6ly-qfvk6vsxFQ=
8h">https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-onli=
ne/</a></div><div><br></div><div>Blue Meanie Mushroom Potency</div><div>Are=
 blue meanies mushrooms strong? The short answer is an emphatic =E2=80=9Cye=
s=E2=80=9D. But you=E2=80=99ll likely want to know just how strong they are=
.</div><div><br></div><div>Albert Hofmann (the Swiss chemist who first synt=
hesized LSD) analyzed Panaeolus cyanescens in the 1960s (they were then kno=
wn as Copelandia cyanescens). He found they had high concentrations of psil=
ocin but only slight quantities of psilocybin.</div><div><br></div><div><a =
href=3D"https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-=
online/" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https:/=
/www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://t.me/Ricko_swavy8/product/bu=
y-blue-meanies-magic-mushrooms-online/&amp;source=3Dgmail&amp;ust=3D1717842=
934885000&amp;usg=3DAOvVaw04CcVf6ly-qfvk6vsxFQ8h">https://t.me/Ricko_swavy8=
/product/buy-blue-meanies-magic-mushrooms-online/</a></div><div><br></div><=
div>High concentrations of psilocin mean that the effects of blue meanies m=
ay come on relatively quickly. This is because psilocin is the psychoactive=
 chemical that causes psychedelic effects, whereas psilocybin is a prodrug =
that the body metabolizes into psilocin after ingestion.</div><div><br></di=
v><div>It is often reported that blue meanies are two to three times the st=
rength of Psilocybe cubensis. But there is little data to support such clai=
ms. T.C. Stivje, in 1992, found that they were variable in their potency. T=
hey can contain 0.17 to 0.95 percent psilocin and 0.16 to 0.19 psilocybin. =
Psilocybe cubensis, for comparison, has been found to have concentrations o=
f psilocin and psilocybin ranging from 0.14 and 0.42 percent and 0.37 and 1=
.30 percent, respectively.</div><div><br></div><div><a href=3D"https://t.me=
/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/" rel=3D"nofo=
llow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?=
hl=3Den-GB&amp;q=3Dhttps://t.me/Ricko_swavy8/product/buy-blue-meanies-magic=
-mushrooms-online/&amp;source=3Dgmail&amp;ust=3D1717842934885000&amp;usg=3D=
AOvVaw04CcVf6ly-qfvk6vsxFQ8h">https://t.me/Ricko_swavy8/product/buy-blue-me=
anies-magic-mushrooms-online/</a></div><div><br></div><div>However, researc=
h from 2010 =E2=80=94 based on commercially grown magic mushrooms seized by=
 German customs authorities =E2=80=94 reveals that the highest total amount=
s of psilocin were detected in dried Panaeolus cyanescens, reaching up to 3=
.00+/-0.24 mg per 100 mg. This makes modern commercially cultivated strains=
 of this species the most potent psychedelic mushroom ever described in pub=
lished research.</div><div><br></div><div>The above discussion shows that t=
here may be some uncertainty regarding just how potent blue meanies are. No=
netheless, a good rule of thumb is that they are generally quite potent. Th=
is means you should take a lower dosage of them compared to less potent spe=
cies of magic mushrooms (assuming you want a similar intensity of effects).=
</div><div><br></div><div><a href=3D"https://Ricko_swavy8/product/buy-blue-=
meanies-magic-mushrooms-online/" rel=3D"nofollow" target=3D"_blank" data-sa=
feredirecturl=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://Rick=
o_swavy8/product/buy-blue-meanies-magic-mushrooms-online/&amp;source=3Dgmai=
l&amp;ust=3D1717842934885000&amp;usg=3DAOvVaw23NEH0zK_01YezlGLDBthH">https:=
//Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/</a></div><d=
iv><br></div><div>For example, Erowid lists the following dosages for Psilo=
cybe cubensis, a medium strength psilocybin mushroom:</div><div><br></div><=
div>Light: 0.25-1 g</div><div>Common: 1-2.5 g</div><div>Strong: 2.5-5 g</di=
v><div>Heavy: 5+ g</div><div>Based on the levels of potency that blue meani=
es can reach, it is generally recommended to take half the normal dose of P=
silocybe cubensis, and see what the effects are like.</div><div><br></div><=
div>With this in mind, as well as Erowid=E2=80=99s dosage recommendations f=
or Psilocybe cubensis, the following dosages for blue meanie mushrooms are =
a good rule of thumb:</div></blockquote></div></blockquote></div></blockquo=
te></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c50ce2a2-538b-4a9d-b40b-f554756a411bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c50ce2a2-538b-4a9d-b40b-f554756a411bn%40googlegroups.co=
m</a>.<br />

------=_Part_204687_2076946011.1717756544104--

------=_Part_204686_913372328.1717756544104--
