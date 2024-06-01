Return-Path: <jailhouse-dev+bncBDJ5VLND4MLRBNFY5OZAMGQEYHFZW6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 609008D6EE3
	for <lists+jailhouse-dev@lfdr.de>; Sat,  1 Jun 2024 10:30:46 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-dfa84f6a603sf888923276.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 01 Jun 2024 01:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717230645; x=1717835445; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uhSDdSneQcx1sgqKENWPr8Ej0PCdQag8o7D5mNldDXo=;
        b=j+Nmc7jSJbhC3nNUaRBy2IVbx+VgAaboulN4hzA+usz4j4Y9fsG7fueDYlqJiRXpOy
         oSsS5JhuyZ37wdjqKAtcTXNcNhoP9PabYxgJp25390yR7bd69qI0XqAT3/rnYaz3wlw8
         PVF+vlCO8pv73hP2a5t/xiLjckULRVDFIqSIhLDbHkYtP6o5Up4X8tSemYJ7+6fV/MlW
         PJi2lrTBtMQl4R8iEHnxELlzYcNCLXTfd7dasiZ8rKjA+k0nte3AqBuB22o1Eqwnp1o3
         M4oGiRCe3H/xeJoV2OaSBlc2uOBldyBlcjzS4TafGT5Tuw9GimMxMdhP1XtAOsxd0vgX
         ATOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717230645; x=1717835445; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhSDdSneQcx1sgqKENWPr8Ej0PCdQag8o7D5mNldDXo=;
        b=EhMj79Df82dBrEJVcN8NZAZvQ0NaPLocqLbR503Dv4wxkApMcLi+UlpPmi38gq4A8j
         D/12JeBWkv0AkyaECODifjR+XkEqEt2/Kb/1FQ32gO4Uh4RLjbTThwu+2ILdEMxqZFBp
         pry8829yZAEDDe0VIAO+RrnYeO6WEH90qb+kk751lJ6TEPNZyAvwS0o8ORD7skULZGr9
         5LLDe72ipKGA6+v/zYtckkC7bUK4Yh2xAjeXRC4BH52u5iE8Lu6f67SzViw0WFMR17wl
         sWfw7KVl1tpdmd4napSWcIu6cRyW8OCClJs/fSDCdlaKS5sWa5BftZg9OOx2fprdOM62
         xBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717230645; x=1717835445;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uhSDdSneQcx1sgqKENWPr8Ej0PCdQag8o7D5mNldDXo=;
        b=gwtIWF96GworG62UUsBEVdu+svpLnWb3m0SthG948u2aFaiFfU9rDpdCnz+bhREr7R
         fVD8guhUx5YKCktMpxDnfGAqkrDA4kWist/P0mneI9I/DowksEftV390NS5DRKUC8gbM
         bbpBML74oCCNXv5QVBECQ2F7F7QR/BNsPeWW8zqrsOm8SU8pLcy7m9JDhMNx1epwxIjN
         9FyolxYlytjwHqsj3Q6AvtN6mBEGArPU2/toQGVZSUc+ZybSP8hw+y4stalJaS+37axL
         6GajQG8lVUKaotcQciMeZVNtqyMi2sN/6vzwf8U5qZ8DPGWBA5dVY4BiRYwaazqbNqkN
         jx/Q==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUOJuXmVIHCr58AY+Vq4LbkKhnOnreGnP1Y0m3YcK0mgmM26C33VWHIOB+GnqCM31u82oVjiVM837yrsg3EB7kAUT9OH8kNEINt9fk=
X-Gm-Message-State: AOJu0YxkUr4BD+KhcOpgZqRj8Zz5Oe+mTdi4z/pV7uimFqlGDKW3ZAAq
	w3Vajfi4zZNgNYsjm0Fz9WFcDuLOILcYPfsv59nmX3FMmDYj1NoU
X-Google-Smtp-Source: AGHT+IF68sL6P0BwAYqCMbIxP0SU+rON3HUWWhOiyei8H5t3al4KoIrYfPxQwnfJ8qGi52nl00ythw==
X-Received: by 2002:a25:3c42:0:b0:de5:4f12:7ea0 with SMTP id 3f1490d57ef6-dfa73be4a33mr4278265276.8.1717230644933;
        Sat, 01 Jun 2024 01:30:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d046:0:b0:dfa:8443:a04 with SMTP id 3f1490d57ef6-dfa84430c63ls188353276.1.-pod-prod-02-us;
 Sat, 01 Jun 2024 01:30:43 -0700 (PDT)
X-Received: by 2002:a05:690c:dcf:b0:622:c8eb:6ffd with SMTP id 00721157ae682-62c794aa9a5mr11002637b3.0.1717230643131;
        Sat, 01 Jun 2024 01:30:43 -0700 (PDT)
Date: Sat, 1 Jun 2024 01:30:42 -0700 (PDT)
From: Dwayne Mickey <dwnmickey@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <8a6f938e-0d19-41a6-b03a-c746a691c426n@googlegroups.com>
In-Reply-To: <a2c87186-0c40-40d5-b4a8-9f93d2fb3904n@googlegroups.com>
References: <6e83c25b-e585-47a6-ad58-3d352bf2665bn@googlegroups.com>
 <a2c87186-0c40-40d5-b4a8-9f93d2fb3904n@googlegroups.com>
Subject: Re: ORDER BLUE MEANIE MUSHROOM/ BUY BLUE MEANIE MUSHROOM/ WHERE TO
 BUY BLUE MEANIE MUSHROOM CHOCOLATE BARS ONLINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_127622_558769659.1717230642428"
X-Original-Sender: dwnmickey@gmail.com
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

------=_Part_127622_558769659.1717230642428
Content-Type: multipart/alternative; 
	boundary="----=_Part_127623_2022945668.1717230642428"

------=_Part_127623_2022945668.1717230642428
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Blue meanie mushrooms (Panaeolus cyanescens, formerly Copelandia=20
cyanescens) =E2=80=94 also known as =E2=80=9Cblue meanies=E2=80=9D =E2=80=
=94 are a highly potent species of=20
psilocybin mushroom. You will notice, however, that the first part of its=
=20
scientific name (Panaeolus) is different from other species of magic=20
mushrooms (e.g. Psilocybe cubensis, Psilocybe semilanceata). This is=20
because it belongs to a different genus. Mushrooms from the genus Panaeolus=
=20
are common, and they grow all over the world in tropical and temperate=20
environments.

Yet while blue meanies mushroom do not belong to the genus Psilocybe (as=20
most magic mushrooms do), they still contain the same psychedelic=20
compounds: psilocybin and psilocin. Many users seek out blue meanies=20
mushroom because they are one of the most potent magic mushrooms, so you=20
don=E2=80=99t need to take as much to achieve desired effects.

https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/

Blue Meanie Mushroom Potency
Are blue meanies mushrooms strong? The short answer is an emphatic =E2=80=
=9Cyes=E2=80=9D.=20
But you=E2=80=99ll likely want to know just how strong they are.

Albert Hofmann (the Swiss chemist who first synthesized LSD) analyzed=20
Panaeolus cyanescens in the 1960s (they were then known as Copelandia=20
cyanescens). He found they had high concentrations of psilocin but only=20
slight quantities of psilocybin.

https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/

High concentrations of psilocin mean that the effects of blue meanies may=
=20
come on relatively quickly. This is because psilocin is the psychoactive=20
chemical that causes psychedelic effects, whereas psilocybin is a prodrug=
=20
that the body metabolizes into psilocin after ingestion.

It is often reported that blue meanies are two to three times the strength=
=20
of Psilocybe cubensis. But there is little data to support such claims.=20
T.C. Stivje, in 1992, found that they were variable in their potency. They=
=20
can contain 0.17 to 0.95 percent psilocin and 0.16 to 0.19 psilocybin.=20
Psilocybe cubensis, for comparison, has been found to have concentrations=
=20
of psilocin and psilocybin ranging from 0.14 and 0.42 percent and 0.37 and=
=20
1.30 percent, respectively.

https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/

However, research from 2010 =E2=80=94 based on commercially grown magic mus=
hrooms=20
seized by German customs authorities =E2=80=94 reveals that the highest tot=
al=20
amounts of psilocin were detected in dried Panaeolus cyanescens, reaching=
=20
up to 3.00+/-0.24 mg per 100 mg. This makes modern commercially cultivated=
=20
strains of this species the most potent psychedelic mushroom ever described=
=20
in published research.

The above discussion shows that there may be some uncertainty regarding=20
just how potent blue meanies are. Nonetheless, a good rule of thumb is that=
=20
they are generally quite potent. This means you should take a lower dosage=
=20
of them compared to less potent species of magic mushrooms (assuming you=20
want a similar intensity of effects).

https://Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/

For example, Erowid lists the following dosages for Psilocybe cubensis, a=
=20
medium strength psilocybin mushroom:

Light: 0.25-1 g
Common: 1-2.5 g
Strong: 2.5-5 g
Heavy: 5+ g
Based on the levels of potency that blue meanies can reach, it is generally=
=20
recommended to take half the normal dose of Psilocybe cubensis, and see=20
what the effects are like.

With this in mind, as well as Erowid=E2=80=99s dosage recommendations for P=
silocybe=20
cubensis, the following dosages for blue meanie mushrooms are a good rule=
=20
of thumb:
On Friday, May 31, 2024 at 12:26:50=E2=80=AFAM UTC+1 Will Smichel wrote:

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
> environments.  Yet while blue meanies mushroom do not belong to the genus=
=20
> Psilocybe (as most magic mushrooms do), they still contain the same=20
> psychedelic compounds: psilocybin and psilocin. Many users seek out blue=
=20
> meanies mushroom because they are one of the most potent magic mushrooms,=
=20
> so you don=E2=80=99t need to take as much to achieve desired effects. =20
> https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online=
/ =20
> Blue Meanie Mushroom Potency Are blue meanies mushrooms strong? The short=
=20
> answer is an emphatic =E2=80=9Cyes=E2=80=9D. But you=E2=80=99ll likely wa=
nt to know just how strong=20
> they are.  Albert Hofmann (the Swiss chemist who first synthesized LSD)=
=20
> analyzed Panaeolus cyanescens in the 1960s (they were then known as=20
> Copelandia cyanescens). He found they had high concentrations of psilocin=
=20
> but only slight quantities of psilocybin. =20
> https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online=
/ =20
> High concentrations of psilocin mean that the effects of blue meanies may=
=20
> come on relatively quickly. This is because psilocin is the psychoactive=
=20
> chemical that causes psychedelic effects, whereas psilocybin is a prodrug=
=20
> that the body metabolizes into psilocin after ingestion.  It is often=20
> reported that blue meanies are two to three times the strength of Psilocy=
be=20
> cubensis. But there is little data to support such claims. T.C. Stivje, i=
n=20
> 1992, found that they were variable in their potency. They can contain 0.=
17=20
> to 0.95 percent psilocin and 0.16 to 0.19 psilocybin. Psilocybe cubensis,=
=20
> for comparison, has been found to have concentrations of psilocin and=20
> psilocybin ranging from 0.14 and 0.42 percent and 0.37 and 1.30 percent,=
=20
> respectively. =20
> https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online=
/ =20
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
> in published research.  The above discussion shows that there may be some=
=20
> uncertainty regarding just how potent blue meanies are. Nonetheless, a go=
od=20
> rule of thumb is that they are generally quite potent. This means you=20
> should take a lower dosage of them compared to less potent species of mag=
ic=20
> mushrooms (assuming you want a similar intensity of effects). =20
> https://Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/ =20
> For example, Erowid lists the following dosages for Psilocybe cubensis, a=
=20
> medium strength psilocybin mushroom:  Light: 0.25-1 g Common: 1-2.5 g=20
> Strong: 2.5-5 g Heavy: 5+ g Based on the levels of potency that blue=20
> meanies can reach, it is generally recommended to take half the normal do=
se=20
> of Psilocybe cubensis, and see what the effects are like.  With this in=
=20
> mind, as well as Erowid=E2=80=99s dosage recommendations for Psilocybe cu=
bensis,=20
> the following dosages for blue meanie mushrooms are a good rule of thumb:
>
> On Thursday, May 30, 2024 at 5:30:34=E2=80=AFPM UTC+1 Larry Cruz wrote:
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
>> environments.
>>
>> Yet while blue meanies mushroom do not belong to the genus Psilocybe (as=
=20
>> most magic mushrooms do), they still contain the same psychedelic=20
>> compounds: psilocybin and psilocin. Many users seek out blue meanies=20
>> mushroom because they are one of the most potent magic mushrooms, so you=
=20
>> don=E2=80=99t need to take as much to achieve desired effects.
>>
>> https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-onlin=
e/
>>
>> Blue Meanie Mushroom Potency
>> Are blue meanies mushrooms strong? The short answer is an emphatic =E2=
=80=9Cyes=E2=80=9D.=20
>> But you=E2=80=99ll likely want to know just how strong they are.
>>
>> Albert Hofmann (the Swiss chemist who first synthesized LSD) analyzed=20
>> Panaeolus cyanescens in the 1960s (they were then known as Copelandia=20
>> cyanescens). He found they had high concentrations of psilocin but only=
=20
>> slight quantities of psilocybin.
>>
>> https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-onlin=
e/
>>
>> High concentrations of psilocin mean that the effects of blue meanies ma=
y=20
>> come on relatively quickly. This is because psilocin is the psychoactive=
=20
>> chemical that causes psychedelic effects, whereas psilocybin is a prodru=
g=20
>> that the body metabolizes into psilocin after ingestion.
>>
>> It is often reported that blue meanies are two to three times the=20
>> strength of Psilocybe cubensis. But there is little data to support such=
=20
>> claims. T.C. Stivje, in 1992, found that they were variable in their=20
>> potency. They can contain 0.17 to 0.95 percent psilocin and 0.16 to 0.19=
=20
>> psilocybin. Psilocybe cubensis, for comparison, has been found to have=
=20
>> concentrations of psilocin and psilocybin ranging from 0.14 and 0.42=20
>> percent and 0.37 and 1.30 percent, respectively.
>>
>> https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-onlin=
e/
>>
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
>> in published research.
>>
>> The above discussion shows that there may be some uncertainty regarding=
=20
>> just how potent blue meanies are. Nonetheless, a good rule of thumb is t=
hat=20
>> they are generally quite potent. This means you should take a lower dosa=
ge=20
>> of them compared to less potent species of magic mushrooms (assuming you=
=20
>> want a similar intensity of effects).
>>
>> https://Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/
>>
>> For example, Erowid lists the following dosages for Psilocybe cubensis, =
a=20
>> medium strength psilocybin mushroom:
>>
>> Light: 0.25-1 g
>> Common: 1-2.5 g
>> Strong: 2.5-5 g
>> Heavy: 5+ g
>> Based on the levels of potency that blue meanies can reach, it is=20
>> generally recommended to take half the normal dose of Psilocybe cubensis=
,=20
>> and see what the effects are like.
>>
>> With this in mind, as well as Erowid=E2=80=99s dosage recommendations fo=
r=20
>> Psilocybe cubensis, the following dosages for blue meanie mushrooms are =
a=20
>> good rule of thumb:
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8a6f938e-0d19-41a6-b03a-c746a691c426n%40googlegroups.com.

------=_Part_127623_2022945668.1717230642428
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />Blue meanie mushrooms (Panaeolus cyanescens, formerly Copelandia cyan=
escens) =E2=80=94 also known as =E2=80=9Cblue meanies=E2=80=9D =E2=80=94 ar=
e a highly potent species of psilocybin mushroom. You will notice, however,=
 that the first part of its scientific name (Panaeolus) is different from o=
ther species of magic mushrooms (e.g. Psilocybe cubensis, Psilocybe semilan=
ceata). This is because it belongs to a different genus. Mushrooms from the=
 genus Panaeolus are common, and they grow all over the world in tropical a=
nd temperate environments.<div><br /></div><div>Yet while blue meanies mush=
room do not belong to the genus Psilocybe (as most magic mushrooms do), the=
y still contain the same psychedelic compounds: psilocybin and psilocin. Ma=
ny users seek out blue meanies mushroom because they are one of the most po=
tent magic mushrooms, so you don=E2=80=99t need to take as much to achieve =
desired effects.</div><div><br /></div><div>https://t.me/Ricko_swavy8/produ=
ct/buy-blue-meanies-magic-mushrooms-online/</div><div><br /></div><div>Blue=
 Meanie Mushroom Potency</div><div>Are blue meanies mushrooms strong? The s=
hort answer is an emphatic =E2=80=9Cyes=E2=80=9D. But you=E2=80=99ll likely=
 want to know just how strong they are.</div><div><br /></div><div>Albert H=
ofmann (the Swiss chemist who first synthesized LSD) analyzed Panaeolus cya=
nescens in the 1960s (they were then known as Copelandia cyanescens). He fo=
und they had high concentrations of psilocin but only slight quantities of =
psilocybin.</div><div><br /></div><div>https://t.me/Ricko_swavy8/product/bu=
y-blue-meanies-magic-mushrooms-online/</div><div><br /></div><div>High conc=
entrations of psilocin mean that the effects of blue meanies may come on re=
latively quickly. This is because psilocin is the psychoactive chemical tha=
t causes psychedelic effects, whereas psilocybin is a prodrug that the body=
 metabolizes into psilocin after ingestion.</div><div><br /></div><div>It i=
s often reported that blue meanies are two to three times the strength of P=
silocybe cubensis. But there is little data to support such claims. T.C. St=
ivje, in 1992, found that they were variable in their potency. They can con=
tain 0.17 to 0.95 percent psilocin and 0.16 to 0.19 psilocybin. Psilocybe c=
ubensis, for comparison, has been found to have concentrations of psilocin =
and psilocybin ranging from 0.14 and 0.42 percent and 0.37 and 1.30 percent=
, respectively.</div><div><br /></div><div>https://t.me/Ricko_swavy8/produc=
t/buy-blue-meanies-magic-mushrooms-online/</div><div><br /></div><div>Howev=
er, research from 2010 =E2=80=94 based on commercially grown magic mushroom=
s seized by German customs authorities =E2=80=94 reveals that the highest t=
otal amounts of psilocin were detected in dried Panaeolus cyanescens, reach=
ing up to 3.00+/-0.24 mg per 100 mg. This makes modern commercially cultiva=
ted strains of this species the most potent psychedelic mushroom ever descr=
ibed in published research.</div><div><br /></div><div>The above discussion=
 shows that there may be some uncertainty regarding just how potent blue me=
anies are. Nonetheless, a good rule of thumb is that they are generally qui=
te potent. This means you should take a lower dosage of them compared to le=
ss potent species of magic mushrooms (assuming you want a similar intensity=
 of effects).</div><div><br /></div><div>https://Ricko_swavy8/product/buy-b=
lue-meanies-magic-mushrooms-online/</div><div><br /></div><div>For example,=
 Erowid lists the following dosages for Psilocybe cubensis, a medium streng=
th psilocybin mushroom:</div><div><br /></div><div>Light: 0.25-1 g</div><di=
v>Common: 1-2.5 g</div><div>Strong: 2.5-5 g</div><div>Heavy: 5+ g</div><div=
>Based on the levels of potency that blue meanies can reach, it is generall=
y recommended to take half the normal dose of Psilocybe cubensis, and see w=
hat the effects are like.</div><div><br /></div><div>With this in mind, as =
well as Erowid=E2=80=99s dosage recommendations for Psilocybe cubensis, the=
 following dosages for blue meanie mushrooms are a good rule of thumb:</div=
><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Frida=
y, May 31, 2024 at 12:26:50=E2=80=AFAM UTC+1 Will Smichel wrote:<br/></div>=
<blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left=
: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Blue meanie mushrooms (=
Panaeolus cyanescens, formerly Copelandia cyanescens) =E2=80=94 also known =
as =E2=80=9Cblue meanies=E2=80=9D =E2=80=94 are a highly potent species of =
psilocybin mushroom. You will notice, however, that the first part of its s=
cientific name (Panaeolus) is different from other species of magic mushroo=
ms (e.g. Psilocybe cubensis, Psilocybe semilanceata). This is because it be=
longs to a different genus. Mushrooms from the genus Panaeolus are common, =
and they grow all over the world in tropical and temperate environments.=C2=
=A0
Yet while blue meanies mushroom do not belong to the genus Psilocybe (as mo=
st magic mushrooms do), they still contain the same psychedelic compounds: =
psilocybin and psilocin. Many users seek out blue meanies mushroom because =
they are one of the most potent magic mushrooms, so you don=E2=80=99t need =
to take as much to achieve desired effects.=C2=A0
<a href=3D"https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushroo=
ms-online/" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/product/bu=
y-blue-meanies-magic-mushrooms-online/&amp;source=3Dgmail&amp;ust=3D1717317=
006343000&amp;usg=3DAOvVaw1jwEPWYf-Euv0X1ZbRvdBt">https://t.me/Ricko_swavy8=
/product/buy-blue-meanies-magic-mushrooms-online/</a>=C2=A0
Blue Meanie Mushroom Potency
Are blue meanies mushrooms strong? The short answer is an emphatic =E2=80=
=9Cyes=E2=80=9D. But you=E2=80=99ll likely want to know just how strong the=
y are.=C2=A0
Albert Hofmann (the Swiss chemist who first synthesized LSD) analyzed Panae=
olus cyanescens in the 1960s (they were then known as Copelandia cyanescens=
). He found they had high concentrations of psilocin but only slight quanti=
ties of psilocybin.=C2=A0
<a href=3D"https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushroo=
ms-online/" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/product/bu=
y-blue-meanies-magic-mushrooms-online/&amp;source=3Dgmail&amp;ust=3D1717317=
006343000&amp;usg=3DAOvVaw1jwEPWYf-Euv0X1ZbRvdBt">https://t.me/Ricko_swavy8=
/product/buy-blue-meanies-magic-mushrooms-online/</a>=C2=A0
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
ms-online/" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/product/bu=
y-blue-meanies-magic-mushrooms-online/&amp;source=3Dgmail&amp;ust=3D1717317=
006343000&amp;usg=3DAOvVaw1jwEPWYf-Euv0X1ZbRvdBt">https://t.me/Ricko_swavy8=
/product/buy-blue-meanies-magic-mushrooms-online/</a>=C2=A0
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
line/" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Den&amp;q=3Dhttps://Ricko_swavy8/product/buy-blue-mea=
nies-magic-mushrooms-online/&amp;source=3Dgmail&amp;ust=3D1717317006343000&=
amp;usg=3DAOvVaw3yO6Kxl4n2XvkxaUxGC_qd">https://Ricko_swavy8/product/buy-bl=
ue-meanies-magic-mushrooms-online/</a>=C2=A0
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
ta-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.=
me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/&amp;source=
=3Dgmail&amp;ust=3D1717317006344000&amp;usg=3DAOvVaw1k_P6QKAQ5-Jq-Xu2p0nl1"=
>https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/=
</a></div><div><br></div><div>Blue Meanie Mushroom Potency</div><div>Are bl=
ue meanies mushrooms strong? The short answer is an emphatic =E2=80=9Cyes=
=E2=80=9D. But you=E2=80=99ll likely want to know just how strong they are.=
</div><div><br></div><div>Albert Hofmann (the Swiss chemist who first synth=
esized LSD) analyzed Panaeolus cyanescens in the 1960s (they were then know=
n as Copelandia cyanescens). He found they had high concentrations of psilo=
cin but only slight quantities of psilocybin.</div><div><br></div><div><a h=
ref=3D"https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-o=
nline/" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://=
www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/product/buy-bl=
ue-meanies-magic-mushrooms-online/&amp;source=3Dgmail&amp;ust=3D17173170063=
44000&amp;usg=3DAOvVaw1k_P6QKAQ5-Jq-Xu2p0nl1">https://t.me/Ricko_swavy8/pro=
duct/buy-blue-meanies-magic-mushrooms-online/</a></div><div><br></div><div>=
High concentrations of psilocin mean that the effects of blue meanies may c=
ome on relatively quickly. This is because psilocin is the psychoactive che=
mical that causes psychedelic effects, whereas psilocybin is a prodrug that=
 the body metabolizes into psilocin after ingestion.</div><div><br></div><d=
iv>It is often reported that blue meanies are two to three times the streng=
th of Psilocybe cubensis. But there is little data to support such claims. =
T.C. Stivje, in 1992, found that they were variable in their potency. They =
can contain 0.17 to 0.95 percent psilocin and 0.16 to 0.19 psilocybin. Psil=
ocybe cubensis, for comparison, has been found to have concentrations of ps=
ilocin and psilocybin ranging from 0.14 and 0.42 percent and 0.37 and 1.30 =
percent, respectively.</div><div><br></div><div><a href=3D"https://t.me/Ric=
ko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/" rel=3D"nofollow=
" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mush=
rooms-online/&amp;source=3Dgmail&amp;ust=3D1717317006344000&amp;usg=3DAOvVa=
w1k_P6QKAQ5-Jq-Xu2p0nl1">https://t.me/Ricko_swavy8/product/buy-blue-meanies=
-magic-mushrooms-online/</a></div><div><br></div><div>However, research fro=
m 2010 =E2=80=94 based on commercially grown magic mushrooms seized by Germ=
an customs authorities =E2=80=94 reveals that the highest total amounts of =
psilocin were detected in dried Panaeolus cyanescens, reaching up to 3.00+/=
-0.24 mg per 100 mg. This makes modern commercially cultivated strains of t=
his species the most potent psychedelic mushroom ever described in publishe=
d research.</div><div><br></div><div>The above discussion shows that there =
may be some uncertainty regarding just how potent blue meanies are. Nonethe=
less, a good rule of thumb is that they are generally quite potent. This me=
ans you should take a lower dosage of them compared to less potent species =
of magic mushrooms (assuming you want a similar intensity of effects).</div=
><div><br></div><div><a href=3D"https://Ricko_swavy8/product/buy-blue-meani=
es-magic-mushrooms-online/" rel=3D"nofollow" target=3D"_blank" data-safered=
irecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://Ricko_swavy8=
/product/buy-blue-meanies-magic-mushrooms-online/&amp;source=3Dgmail&amp;us=
t=3D1717317006344000&amp;usg=3DAOvVaw3gXm0W_GDJjEjTTZcv1hpC">https://Ricko_=
swavy8/product/buy-blue-meanies-magic-mushrooms-online/</a></div><div><br><=
/div><div>For example, Erowid lists the following dosages for Psilocybe cub=
ensis, a medium strength psilocybin mushroom:</div><div><br></div><div>Ligh=
t: 0.25-1 g</div><div>Common: 1-2.5 g</div><div>Strong: 2.5-5 g</div><div>H=
eavy: 5+ g</div><div>Based on the levels of potency that blue meanies can r=
each, it is generally recommended to take half the normal dose of Psilocybe=
 cubensis, and see what the effects are like.</div><div><br></div><div>With=
 this in mind, as well as Erowid=E2=80=99s dosage recommendations for Psilo=
cybe cubensis, the following dosages for blue meanie mushrooms are a good r=
ule of thumb:</div></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/8a6f938e-0d19-41a6-b03a-c746a691c426n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/8a6f938e-0d19-41a6-b03a-c746a691c426n%40googlegroups.co=
m</a>.<br />

------=_Part_127623_2022945668.1717230642428--

------=_Part_127622_558769659.1717230642428--
