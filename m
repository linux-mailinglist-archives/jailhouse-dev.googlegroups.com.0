Return-Path: <jailhouse-dev+bncBCOP7S4BXEKBBO4W4SZAMGQEEOL2HKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE048D5639
	for <lists+jailhouse-dev@lfdr.de>; Fri, 31 May 2024 01:26:53 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id 3f1490d57ef6-df78efda253sf2282160276.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 May 2024 16:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717111612; x=1717716412; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DXWYZkbBNZhqNJcvZyCKCZiDPw5hBzVNpMvgTDNF0wY=;
        b=LnI71dHhui2MBGdieJofxiR6Q0bCzp4FDky3ft9b9+TbMh2t7uEHRu6RhfjnIXZRWI
         C4DhhE/FEBBwzY+ypjlLy3EadPmqT69g9NAzrkZiZ5S8m13lFB4ejhGQS345A3f2ImBE
         uSQSksbeEsOXoO+xIP7zqGmTvSoHTGhibcANeIr+so6Hn6ioOwt9pm+SsgoxIXnlz5av
         02zafe2qxDVJLn5CM/mMZTcCM0ZF3lbMNlhXSodMUSjsC6FYGQHUBFYCoFhp5yDHeCJl
         4kK6mtfGJEY1qFwD/wLKj9Kw43BF6CkaytkmUdUZbnjSApRITzjk+40qIYapt3cghFR9
         r8Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717111612; x=1717716412; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXWYZkbBNZhqNJcvZyCKCZiDPw5hBzVNpMvgTDNF0wY=;
        b=L06CMFVmzpqbq/2q6Ydhk4niEoW5y6Y0budv4vEUo/NZbtDcleFoRz79x8Y5uuDdYI
         U6NQygo+2S7v5MsxxTkjpyRUv4rJ6OpNouaR7pkFY/1ZJej3GufyRRtmMP1Hzq5gEuM/
         V8JkblYQ0otfcHLdUprGVn4TVgaM8nOKvu6rHPfkJj9ewSP1T74eloUenMMUf6Nq5wmE
         4ZRpr/mjf0TpcHrVRtkK76c6QuYFIHvsVUy8TfY8jmewpkBbUdmfmlGqyWboLvMNTJj5
         fpEg1Wl5s9Odrsgq3Bsd0pFQESORMjqKpvGuwV0czmJ+BzPCmFSm2006ivNZKEZ+p9le
         3WHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717111612; x=1717716412;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DXWYZkbBNZhqNJcvZyCKCZiDPw5hBzVNpMvgTDNF0wY=;
        b=RxXQXzS5FVShuTn/NtIBUJzoS+1GfjyYOQKMv8VM/wkS8y06qphQdqRmCZT6sk6dza
         kmw16PP3sBai+FkJ3MJSfKg1/yTR5lK9y/6WFWfUEUQ2ax04AYcx+iytYr1Ami5lL3Ps
         u6YDmg88KKNTFO9/lXJ8k+gD8aCUY2pxFhPSLU41RdSHx0/3v5j2uRPflliU++V+AIhC
         MKEfV9hfbAHOxoN041w1hsjyA9t12lERhgO56bzpTZNNX37/7u3Z+AutCHPfFustvrV0
         lv81QskuHxe79dJuQNlVkOw0rxKM8gLcBJ49Zj1z5xDPihhlPVa2REGTHcjSwWP1hmzH
         iefg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCU1ReQQTuEzKNWxqeBDuXGQ5hqGAdMmWsGM0LHU2euH+YBy0pcUxWP1G9VZ0rsFaA31j22mn5/qG+vD9FCko1FXMMent4YftH8W5yY=
X-Gm-Message-State: AOJu0Yw51kDQSHU3MDyXXRGgEOjs76UiCaIpVofpJbB+E02qL6h15+nf
	xMAM27M7AQNhrf6lbtr0LSXabAlZ6Vn//sAi1I2TBngkMu9VJiEy
X-Google-Smtp-Source: AGHT+IGzhGwM7vTRpq4N5+X/WGOSziFw8WQ1EcivAdgH3jHiXiWeH1RTHJm6gkaDbJI85X79hNvWfw==
X-Received: by 2002:a25:8d82:0:b0:df7:9bf8:a5c7 with SMTP id 3f1490d57ef6-dfa73dae760mr331234276.57.1717111612052;
        Thu, 30 May 2024 16:26:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:8e08:0:b0:df4:dad1:987f with SMTP id 3f1490d57ef6-dfa59ad44d3ls1495360276.1.-pod-prod-09-us;
 Thu, 30 May 2024 16:26:50 -0700 (PDT)
X-Received: by 2002:a05:690c:350d:b0:61d:3304:c25e with SMTP id 00721157ae682-62c797e723fmr491267b3.7.1717111610511;
        Thu, 30 May 2024 16:26:50 -0700 (PDT)
Date: Thu, 30 May 2024 16:26:49 -0700 (PDT)
From: Will Smichel <willsmichel88@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a2c87186-0c40-40d5-b4a8-9f93d2fb3904n@googlegroups.com>
In-Reply-To: <6e83c25b-e585-47a6-ad58-3d352bf2665bn@googlegroups.com>
References: <6e83c25b-e585-47a6-ad58-3d352bf2665bn@googlegroups.com>
Subject: Re: ORDER BLUE MEANIE MUSHROOM/ BUY BLUE MEANIE MUSHROOM/ WHERE TO
 BUY BLUE MEANIE MUSHROOM CHOCOLATE BARS ONLINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_148753_4394910.1717111609772"
X-Original-Sender: willsmichel88@gmail.com
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

------=_Part_148753_4394910.1717111609772
Content-Type: multipart/alternative; 
	boundary="----=_Part_148754_1458762277.1717111609772"

------=_Part_148754_1458762277.1717111609772
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
environments.  Yet while blue meanies mushroom do not belong to the genus=
=20
Psilocybe (as most magic mushrooms do), they still contain the same=20
psychedelic compounds: psilocybin and psilocin. Many users seek out blue=20
meanies mushroom because they are one of the most potent magic mushrooms,=
=20
so you don=E2=80=99t need to take as much to achieve desired effects. =20
https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/ =
=20
Blue Meanie Mushroom Potency Are blue meanies mushrooms strong? The short=
=20
answer is an emphatic =E2=80=9Cyes=E2=80=9D. But you=E2=80=99ll likely want=
 to know just how strong=20
they are.  Albert Hofmann (the Swiss chemist who first synthesized LSD)=20
analyzed Panaeolus cyanescens in the 1960s (they were then known as=20
Copelandia cyanescens). He found they had high concentrations of psilocin=
=20
but only slight quantities of psilocybin. =20
https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/ =
=20
High concentrations of psilocin mean that the effects of blue meanies may=
=20
come on relatively quickly. This is because psilocin is the psychoactive=20
chemical that causes psychedelic effects, whereas psilocybin is a prodrug=
=20
that the body metabolizes into psilocin after ingestion.  It is often=20
reported that blue meanies are two to three times the strength of Psilocybe=
=20
cubensis. But there is little data to support such claims. T.C. Stivje, in=
=20
1992, found that they were variable in their potency. They can contain 0.17=
=20
to 0.95 percent psilocin and 0.16 to 0.19 psilocybin. Psilocybe cubensis,=
=20
for comparison, has been found to have concentrations of psilocin and=20
psilocybin ranging from 0.14 and 0.42 percent and 0.37 and 1.30 percent,=20
respectively. =20
https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/ =
=20
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
in published research.  The above discussion shows that there may be some=
=20
uncertainty regarding just how potent blue meanies are. Nonetheless, a good=
=20
rule of thumb is that they are generally quite potent. This means you=20
should take a lower dosage of them compared to less potent species of magic=
=20
mushrooms (assuming you want a similar intensity of effects). =20
https://Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/  For=
=20
example, Erowid lists the following dosages for Psilocybe cubensis, a=20
medium strength psilocybin mushroom:  Light: 0.25-1 g Common: 1-2.5 g=20
Strong: 2.5-5 g Heavy: 5+ g Based on the levels of potency that blue=20
meanies can reach, it is generally recommended to take half the normal dose=
=20
of Psilocybe cubensis, and see what the effects are like.  With this in=20
mind, as well as Erowid=E2=80=99s dosage recommendations for Psilocybe cube=
nsis,=20
the following dosages for blue meanie mushrooms are a good rule of thumb:

On Thursday, May 30, 2024 at 5:30:34=E2=80=AFPM UTC+1 Larry Cruz wrote:

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
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a2c87186-0c40-40d5-b4a8-9f93d2fb3904n%40googlegroups.com.

------=_Part_148754_1458762277.1717111609772
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Blue meanie mushrooms (Panaeolus cyanescens, formerly Copelandia cyanescens=
) =E2=80=94 also known as =E2=80=9Cblue meanies=E2=80=9D =E2=80=94 are a hi=
ghly potent species of psilocybin mushroom. You will notice, however, that =
the first part of its scientific name (Panaeolus) is different from other s=
pecies of magic mushrooms (e.g. Psilocybe cubensis, Psilocybe semilanceata)=
. This is because it belongs to a different genus. Mushrooms from the genus=
 Panaeolus are common, and they grow all over the world in tropical and tem=
perate environments.=C2=A0
Yet while blue meanies mushroom do not belong to the genus Psilocybe (as mo=
st magic mushrooms do), they still contain the same psychedelic compounds: =
psilocybin and psilocin. Many users seek out blue meanies mushroom because =
they are one of the most potent magic mushrooms, so you don=E2=80=99t need =
to take as much to achieve desired effects.=C2=A0
https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/=
=C2=A0
Blue Meanie Mushroom Potency
Are blue meanies mushrooms strong? The short answer is an emphatic =E2=80=
=9Cyes=E2=80=9D. But you=E2=80=99ll likely want to know just how strong the=
y are.=C2=A0
Albert Hofmann (the Swiss chemist who first synthesized LSD) analyzed Panae=
olus cyanescens in the 1960s (they were then known as Copelandia cyanescens=
). He found they had high concentrations of psilocin but only slight quanti=
ties of psilocybin.=C2=A0
https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/=
=C2=A0
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
https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/=
=C2=A0
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
https://Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/=C2=A0
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
od rule of thumb:<br /><br /><div class=3D"gmail_quote"><div dir=3D"auto" c=
lass=3D"gmail_attr">On Thursday, May 30, 2024 at 5:30:34=E2=80=AFPM UTC+1 L=
arry Cruz wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margi=
n: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1e=
x;">Blue meanie mushrooms (Panaeolus cyanescens, formerly Copelandia cyanes=
cens) =E2=80=94 also known as =E2=80=9Cblue meanies=E2=80=9D =E2=80=94 are =
a highly potent species of psilocybin mushroom. You will notice, however, t=
hat the first part of its scientific name (Panaeolus) is different from oth=
er species of magic mushrooms (e.g. Psilocybe cubensis, Psilocybe semilance=
ata). This is because it belongs to a different genus. Mushrooms from the g=
enus Panaeolus are common, and they grow all over the world in tropical and=
 temperate environments.<div><br></div><div>Yet while blue meanies mushroom=
 do not belong to the genus Psilocybe (as most magic mushrooms do), they st=
ill contain the same psychedelic compounds: psilocybin and psilocin. Many u=
sers seek out blue meanies mushroom because they are one of the most potent=
 magic mushrooms, so you don=E2=80=99t need to take as much to achieve desi=
red effects.</div><div><br></div><div><a href=3D"https://t.me/Ricko_swavy8/=
product/buy-blue-meanies-magic-mushrooms-online/" target=3D"_blank" rel=3D"=
nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-onlin=
e/&amp;source=3Dgmail&amp;ust=3D1717197938312000&amp;usg=3DAOvVaw3-X1lbZJsv=
QhNT_yI3iqEw">https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mush=
rooms-online/</a></div><div><br></div><div>Blue Meanie Mushroom Potency</di=
v><div>Are blue meanies mushrooms strong? The short answer is an emphatic =
=E2=80=9Cyes=E2=80=9D. But you=E2=80=99ll likely want to know just how stro=
ng they are.</div><div><br></div><div>Albert Hofmann (the Swiss chemist who=
 first synthesized LSD) analyzed Panaeolus cyanescens in the 1960s (they we=
re then known as Copelandia cyanescens). He found they had high concentrati=
ons of psilocin but only slight quantities of psilocybin.</div><div><br></d=
iv><div><a href=3D"https://t.me/Ricko_swavy8/product/buy-blue-meanies-magic=
-mushrooms-online/" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/pr=
oduct/buy-blue-meanies-magic-mushrooms-online/&amp;source=3Dgmail&amp;ust=
=3D1717197938312000&amp;usg=3DAOvVaw3-X1lbZJsvQhNT_yI3iqEw">https://t.me/Ri=
cko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/</a></div><div><=
br></div><div>High concentrations of psilocin mean that the effects of blue=
 meanies may come on relatively quickly. This is because psilocin is the ps=
ychoactive chemical that causes psychedelic effects, whereas psilocybin is =
a prodrug that the body metabolizes into psilocin after ingestion.</div><di=
v><br></div><div>It is often reported that blue meanies are two to three ti=
mes the strength of Psilocybe cubensis. But there is little data to support=
 such claims. T.C. Stivje, in 1992, found that they were variable in their =
potency. They can contain 0.17 to 0.95 percent psilocin and 0.16 to 0.19 ps=
ilocybin. Psilocybe cubensis, for comparison, has been found to have concen=
trations of psilocin and psilocybin ranging from 0.14 and 0.42 percent and =
0.37 and 1.30 percent, respectively.</div><div><br></div><div><a href=3D"ht=
tps://t.me/Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/" t=
arget=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.googl=
e.com/url?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/product/buy-blue-meanie=
s-magic-mushrooms-online/&amp;source=3Dgmail&amp;ust=3D1717197938312000&amp=
;usg=3DAOvVaw3-X1lbZJsvQhNT_yI3iqEw">https://t.me/Ricko_swavy8/product/buy-=
blue-meanies-magic-mushrooms-online/</a></div><div><br></div><div>However, =
research from 2010 =E2=80=94 based on commercially grown magic mushrooms se=
ized by German customs authorities =E2=80=94 reveals that the highest total=
 amounts of psilocin were detected in dried Panaeolus cyanescens, reaching =
up to 3.00+/-0.24 mg per 100 mg. This makes modern commercially cultivated =
strains of this species the most potent psychedelic mushroom ever described=
 in published research.</div><div><br></div><div>The above discussion shows=
 that there may be some uncertainty regarding just how potent blue meanies =
are. Nonetheless, a good rule of thumb is that they are generally quite pot=
ent. This means you should take a lower dosage of them compared to less pot=
ent species of magic mushrooms (assuming you want a similar intensity of ef=
fects).</div><div><br></div><div><a href=3D"https://Ricko_swavy8/product/bu=
y-blue-meanies-magic-mushrooms-online/" target=3D"_blank" rel=3D"nofollow" =
data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://=
Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/&amp;source=3D=
gmail&amp;ust=3D1717197938312000&amp;usg=3DAOvVaw2i_qkuiFwRJ_qCg1RALItT">ht=
tps://Ricko_swavy8/product/buy-blue-meanies-magic-mushrooms-online/</a></di=
v><div><br></div><div>For example, Erowid lists the following dosages for P=
silocybe cubensis, a medium strength psilocybin mushroom:</div><div><br></d=
iv><div>Light: 0.25-1 g</div><div>Common: 1-2.5 g</div><div>Strong: 2.5-5 g=
</div><div>Heavy: 5+ g</div><div>Based on the levels of potency that blue m=
eanies can reach, it is generally recommended to take half the normal dose =
of Psilocybe cubensis, and see what the effects are like.</div><div><br></d=
iv><div>With this in mind, as well as Erowid=E2=80=99s dosage recommendatio=
ns for Psilocybe cubensis, the following dosages for blue meanie mushrooms =
are a good rule of thumb:</div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a2c87186-0c40-40d5-b4a8-9f93d2fb3904n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a2c87186-0c40-40d5-b4a8-9f93d2fb3904n%40googlegroups.co=
m</a>.<br />

------=_Part_148754_1458762277.1717111609772--

------=_Part_148753_4394910.1717111609772--
