Return-Path: <jailhouse-dev+bncBCFOBSFJ6MNRBK6T4KZAMGQE63PS72I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 034E38D4FDB
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 May 2024 18:30:38 +0200 (CEST)
Received: by mail-yb1-xb3b.google.com with SMTP id 3f1490d57ef6-dfa4b878450sf1616166276.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 May 2024 09:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717086637; x=1717691437; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCR6hxPl43VH5UA4ArsMjpjiAFey+XyTjBYeuXzRPoc=;
        b=L+rtgg9SxgICqF9CiporXBq16WA2HEGWEk+yU58bcCG5whdK8cRnQftbwP7gDhAwqT
         UT9yrIiaco0TEv0dN2kksv3Cq+E5fRtlFaOyp2/8ICMRUjepVpZbCWr0oGooDWF9Nbvu
         2dTdnO76Z1WjjmsFSUTKhfBArpjdnrf6BHtJ5ONkM3bEuRvtQ+m38seNbmbrUDVMLRDL
         tUgAZ3Ybhf9pkRjUkprjV+ev7PtIbL1eHKXdjOJGWlwSeJEev+wODn+fsDu2lAvXoZ+d
         SKjlfMo8aH6CiNUPI9oVILVTSTQ5Gk/XUHG0hMSCwWh7GG84kDVgBx1kphgVfyV170av
         9GuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717086637; x=1717691437; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCR6hxPl43VH5UA4ArsMjpjiAFey+XyTjBYeuXzRPoc=;
        b=UPRsf9AhN1s7rXJ6df9EIPEs5IubIaaROmK5FvJZXxshzGVR93zjDIHWE5ETH2ytKm
         fPjKDbM+Yg+NJyB8VdDeKaijdUP9dhwdjDFgjnYbVENZ4S6jq5hs7QCPHHgivP4q0e+3
         tdb5WOvAm3wJuhFtIPsbcdUhW2gfpqEL/UmZ012wNY/VXlqmFBfP+U32FjrklcqB0g8j
         g7kCA7edHvqStzBgJed8cAgPb63KZkgDY0dY+bRTiKOE6u1h/McWWnDwms+MUa3cBumf
         q9k0vK2ae2MXuyDeL25FM9NztBkU5cwM8h42KzwL5aUsuW53lzi4WkEdp9AujUG6aPoo
         u64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717086637; x=1717691437;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCR6hxPl43VH5UA4ArsMjpjiAFey+XyTjBYeuXzRPoc=;
        b=QuGXFR6haexlffeV/W56MVcdPAZh31wBW+VHnwII99XcUSss/MEb3AuUnDeRSJDey9
         zCAr11c1tNZ6gdkepsvglZAV6T7BzVR4JCIYWg3BCY58Rfn8A4sJmfANjUPuHLo6eT5P
         AXCSgzBavLvRG9my8ztBXBdt2ouw+l+Byr/Z3kSk7f2iWGavefziPja755NAKKUcgW0d
         LswjxhCoOM38OwiKrSQPSFCq1IUCGOD4sUOtXPAB4NnPY/ZugfTzB/tafJBT9jR6RxHG
         n2nwW+2L8MFaACHud3/XYXL85j0VbZf0aQm4HZDttDlrIjXZlmGGiSrmDLRNzrNEaiuv
         cY5g==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWu7sLHOAUqQCgu/TUpS638yC9Y/AnxXSuN5LU43iaRI9TJ3KkuOD7I0H9xcLePshNbUwPEyZ6H2IbC8Kc5FU0ipOG5417VS+83Dxo=
X-Gm-Message-State: AOJu0Yx1H49hkzA0NF1G9XgXNJ/aqhs1GFQNapGv1ZU8BY3WtalLeMAB
	P2cmOxmWeuQ0C6LuVf1wskpTwWJSJEVWdFlHpTSCdrpCq8hOBdDI
X-Google-Smtp-Source: AGHT+IHP7Wtz0gb228pXZ1vCmEvA3Gf7eASX5Pnilg6IMQLqVuAZZlSEswo6+DMOnv2Ixu44L53img==
X-Received: by 2002:a25:c746:0:b0:de4:27f:e335 with SMTP id 3f1490d57ef6-dfa5a802910mr2667690276.64.1717086636794;
        Thu, 30 May 2024 09:30:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:df91:0:b0:dcc:4b24:c0da with SMTP id 3f1490d57ef6-dfa59b1ceccls1731681276.2.-pod-prod-02-us;
 Thu, 30 May 2024 09:30:34 -0700 (PDT)
X-Received: by 2002:a05:6902:20c6:b0:de4:67d9:a2c6 with SMTP id 3f1490d57ef6-dfa5a5b6dd5mr237967276.2.1717086634500;
        Thu, 30 May 2024 09:30:34 -0700 (PDT)
Date: Thu, 30 May 2024 09:30:33 -0700 (PDT)
From: Larry Cruz <atungang28@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6e83c25b-e585-47a6-ad58-3d352bf2665bn@googlegroups.com>
Subject: ORDER BLUE MEANIE MUSHROOM/ BUY BLUE MEANIE MUSHROOM/ WHERE TO BUY
 BLUE MEANIE MUSHROOM CHOCOLATE BARS ONLINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_117121_909064568.1717086633852"
X-Original-Sender: atungang28@gmail.com
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

------=_Part_117121_909064568.1717086633852
Content-Type: multipart/alternative; 
	boundary="----=_Part_117122_473381170.1717086633852"

------=_Part_117122_473381170.1717086633852
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

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6e83c25b-e585-47a6-ad58-3d352bf2665bn%40googlegroups.com.

------=_Part_117122_473381170.1717086633852
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Blue meanie mushrooms (Panaeolus cyanescens, formerly Copelandia cyanescens=
) =E2=80=94 also known as =E2=80=9Cblue meanies=E2=80=9D =E2=80=94 are a hi=
ghly potent species of psilocybin mushroom. You will notice, however, that =
the first part of its scientific name (Panaeolus) is different from other s=
pecies of magic mushrooms (e.g. Psilocybe cubensis, Psilocybe semilanceata)=
. This is because it belongs to a different genus. Mushrooms from the genus=
 Panaeolus are common, and they grow all over the world in tropical and tem=
perate environments.<div><br /></div><div>Yet while blue meanies mushroom d=
o not belong to the genus Psilocybe (as most magic mushrooms do), they stil=
l contain the same psychedelic compounds: psilocybin and psilocin. Many use=
rs seek out blue meanies mushroom because they are one of the most potent m=
agic mushrooms, so you don=E2=80=99t need to take as much to achieve desire=
d effects.</div><div><br /></div><div>https://t.me/Ricko_swavy8/product/buy=
-blue-meanies-magic-mushrooms-online/</div><div><br /></div><div>Blue Meani=
e Mushroom Potency</div><div>Are blue meanies mushrooms strong? The short a=
nswer is an emphatic =E2=80=9Cyes=E2=80=9D. But you=E2=80=99ll likely want =
to know just how strong they are.</div><div><br /></div><div>Albert Hofmann=
 (the Swiss chemist who first synthesized LSD) analyzed Panaeolus cyanescen=
s in the 1960s (they were then known as Copelandia cyanescens). He found th=
ey had high concentrations of psilocin but only slight quantities of psiloc=
ybin.</div><div><br /></div><div>https://t.me/Ricko_swavy8/product/buy-blue=
-meanies-magic-mushrooms-online/</div><div><br /></div><div>High concentrat=
ions of psilocin mean that the effects of blue meanies may come on relative=
ly quickly. This is because psilocin is the psychoactive chemical that caus=
es psychedelic effects, whereas psilocybin is a prodrug that the body metab=
olizes into psilocin after ingestion.</div><div><br /></div><div>It is ofte=
n reported that blue meanies are two to three times the strength of Psilocy=
be cubensis. But there is little data to support such claims. T.C. Stivje, =
in 1992, found that they were variable in their potency. They can contain 0=
.17 to 0.95 percent psilocin and 0.16 to 0.19 psilocybin. Psilocybe cubensi=
s, for comparison, has been found to have concentrations of psilocin and ps=
ilocybin ranging from 0.14 and 0.42 percent and 0.37 and 1.30 percent, resp=
ectively.</div><div><br /></div><div>https://t.me/Ricko_swavy8/product/buy-=
blue-meanies-magic-mushrooms-online/</div><div><br /></div><div>However, re=
search from 2010 =E2=80=94 based on commercially grown magic mushrooms seiz=
ed by German customs authorities =E2=80=94 reveals that the highest total a=
mounts of psilocin were detected in dried Panaeolus cyanescens, reaching up=
 to 3.00+/-0.24 mg per 100 mg. This makes modern commercially cultivated st=
rains of this species the most potent psychedelic mushroom ever described i=
n published research.</div><div><br /></div><div>The above discussion shows=
 that there may be some uncertainty regarding just how potent blue meanies =
are. Nonetheless, a good rule of thumb is that they are generally quite pot=
ent. This means you should take a lower dosage of them compared to less pot=
ent species of magic mushrooms (assuming you want a similar intensity of ef=
fects).</div><div><br /></div><div>https://Ricko_swavy8/product/buy-blue-me=
anies-magic-mushrooms-online/</div><div><br /></div><div>For example, Erowi=
d lists the following dosages for Psilocybe cubensis, a medium strength psi=
locybin mushroom:</div><div><br /></div><div>Light: 0.25-1 g</div><div>Comm=
on: 1-2.5 g</div><div>Strong: 2.5-5 g</div><div>Heavy: 5+ g</div><div>Based=
 on the levels of potency that blue meanies can reach, it is generally reco=
mmended to take half the normal dose of Psilocybe cubensis, and see what th=
e effects are like.</div><div><br /></div><div>With this in mind, as well a=
s Erowid=E2=80=99s dosage recommendations for Psilocybe cubensis, the follo=
wing dosages for blue meanie mushrooms are a good rule of thumb:</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6e83c25b-e585-47a6-ad58-3d352bf2665bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6e83c25b-e585-47a6-ad58-3d352bf2665bn%40googlegroups.co=
m</a>.<br />

------=_Part_117122_473381170.1717086633852--

------=_Part_117121_909064568.1717086633852--
