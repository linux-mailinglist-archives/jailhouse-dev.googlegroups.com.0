Return-Path: <jailhouse-dev+bncBC6PHVWAREERBTFD7GZAMGQEO6RCESY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb37.google.com (mail-yb1-xb37.google.com [IPv6:2607:f8b0:4864:20::b37])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6778FA682
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jun 2024 01:29:18 +0200 (CEST)
Received: by mail-yb1-xb37.google.com with SMTP id 3f1490d57ef6-dfa73a21131sf6000583276.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jun 2024 16:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717457357; x=1718062157; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wa4VKt0m9mbM8UkxCxqh7IxnMkxsGiB3v9bO0V3bm50=;
        b=NQZmSGzVeEPa7DVEv+hTd7oMf/OrR9ra8Y61DA1svruyxc1/LNyf+QPLx4dHrN3rt/
         ogCtGtVJbZxJy5vn0k+vPuVU5v3zX95wHl6x+Ur84FCIzWxGLdJpvMtXA6ilfz6B4NwP
         RZn1PjHpv35nWu6h7oYh9Og5p7LgpkY0+Z3ETc8dl0mRpthETtYpEX15Bm9t6ttQCfjz
         aLA+gVDd+oSKlKskdr3ZP0H1y6d/3fIpuEU332JtFMPGedz/iH0jwX/giMubjGLtPqMC
         0dDJXs3qoyks5PqQhp59977TI4DRafWmh+CRCuiLqj/ESu1jhdokCSAuewvrnJZ05knc
         MVfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717457357; x=1718062157; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wa4VKt0m9mbM8UkxCxqh7IxnMkxsGiB3v9bO0V3bm50=;
        b=dH9aVvhWPW9NDeTRA/t1Pqes8J/2AvIwUa4iLRV2qKzcUT9kCAc0r54W7Hs4Ju3bPL
         lp9zO5ZTHIrBgLDplkq9wjKY2/lqBTBcJkXDxWZO906n6/S5/UtMFdYhRHPMx1py8zG4
         77fEVhkGdIeKklQO7uMqowkTHa+nAteeptj9rcQXvUIk2gaidNIeURQbvK+BjHUVY/jy
         jFUqEwNK7LsnXoUfCXYaqrwGX1G3FBPcvf43kyTDriPSIhY7pjPeKgEES7CM5g/qHFR1
         hpzF81n6jLN91Ot0NHTdy8rMXLI2Pk/Wu8VgVyb3nX7bp4DKUW5SW0EsQVUVRwCKlWYt
         +AJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717457357; x=1718062157;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wa4VKt0m9mbM8UkxCxqh7IxnMkxsGiB3v9bO0V3bm50=;
        b=Fo9SM6QlDE27QvZdDNdGXSvnBz+5YHl5VPiScDZp88jJXEwT6M5obhx+Ac9+8ZGN7q
         PgkMvguB6L2viLcIV39pUqw5kXsfWJF5ofN2Df4BPBawFG/3KwL5Sd6BjbHxd0fiTQ+T
         t5Q7q115hEGyyNrp23i3fOVZvCV+/iSxThOv/4AUJRWTc9k652zpE5Oja81Jp2mKlWYW
         RXoFqh3A7uhbQk+iQO5cC84L4Hozh4SuknixjjSpgrxJbOe5bpipfA661pdJm3fqx5Fa
         6HcEAp/KU5C6vrqnJz43jxvxGV/aKLXknU6KdTI+chWT2kFMfSGj80YKuzSbcrxCC1+a
         06LA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXiYcdYv/J33vghaaiWpQWQRCzN3C5I5pCQVrxpS6mJ3X/R+5bx+6IKBJGv9rf4mRB8iEN0dmA+8AaszmVGE1AvDDrjg8e3rh21FTA=
X-Gm-Message-State: AOJu0YxLNd4hWMahk2QFuUo34w/Magtbky/85Xi/m4iwbADnS2Latw8L
	/pkYq8fasGKIfZXg+jqOcnCCcrbsA1dJ2K25PwMVfApARLbRJ+al
X-Google-Smtp-Source: AGHT+IF09SJTAsQEYQYHHBQaUlLPDPyqzeD4lvQJkA1Ig9xJSqFcuz4VQpJNlK+63B/t2WBJZF4puw==
X-Received: by 2002:a25:d391:0:b0:dd0:c866:ec3a with SMTP id 3f1490d57ef6-dfa73c1f904mr10181321276.22.1717457357412;
        Mon, 03 Jun 2024 16:29:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:bc3:0:b0:dfa:7e23:93a1 with SMTP id 3f1490d57ef6-dfa7e239634ls121482276.0.-pod-prod-06-us;
 Mon, 03 Jun 2024 16:29:16 -0700 (PDT)
X-Received: by 2002:a25:ab13:0:b0:df7:6584:5d6f with SMTP id 3f1490d57ef6-dfa73daa1femr2509261276.13.1717457355883;
        Mon, 03 Jun 2024 16:29:15 -0700 (PDT)
Date: Mon, 3 Jun 2024 16:29:15 -0700 (PDT)
From: ecstasyclinic pharmacy <ecstasyclinicpharmacy@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e98a9d7b-88e4-4c76-9368-2ec4419f5e20n@googlegroups.com>
In-Reply-To: <3615d25c-98db-4157-a379-976987788b0en@googlegroups.com>
References: <3615d25c-98db-4157-a379-976987788b0en@googlegroups.com>
Subject: Re: BUY MAGIC MUSHROOM ONLINE AUSTRALIA
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_20321_1262660630.1717457355025"
X-Original-Sender: ecstasyclinicpharmacy@gmail.com
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

------=_Part_20321_1262660630.1717457355025
Content-Type: multipart/alternative; 
	boundary="----=_Part_20322_1564236561.1717457355026"

------=_Part_20322_1564236561.1717457355026
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

where to buy high quality LSD, pain and anxiety pills, depression=20
medications and research chemicals for research purposes? Be 99.99% sure of=
=20
product quality and authenticity. With a focus on quality and customer=20
satisfaction, we ensure that all our products are sourced from reputable=20
manufacturers and undergo rigorous testing for purity and potency.

https://t.me/ukverifiedv
https://t.me/ukverifiedv
https://t.me/ukverifiedv
Message @Clarkderby1 to place  your order

100% discreet and confidential,
-Your personal information is 100% SECURE.
-Your orders are 100% secure and anonymous.
-Fast delivery worldwide (you can track the shipment with the provided=20
tracking numbe

On Saturday, June 1, 2024 at 10:56:36=E2=80=AFAM UTC-7 Alix Rosine Pokam wr=
ote:

>
> Psilocybin Gummies - Mushroom Gummy Cubes 3.5g online | Buy Psilocybin=20
> Gummies 100% Fast And Discreet Shipping
>
>
> Worldwide
>
> Buy Magic Mushrooms Online | Psychedelics For Sale USA | Mushroom=20
> Chocolate Bars Online
>
> Buy Xanax 2mg bars, Hydrocodone, Diazepam, Dilaudid, Oxycotin, Roxycodone=
,=20
> Suboxone, Subutex, Klonpin, Soma, Ritalin
>
> Buy microdosing psychedelics online | Buy magic mushrooms gummies online =
|=20
> buy dmt carts online usa
>
> DMT for Sale | Order DMT Cartridges Online | Buy DMT Online | WHere to Bu=
y=20
> DMT in Australia
>
> NN DMT for Sale | Order DMT Cartridges Online | Buy DMT Online Europe |=
=20
> WHere to Buy DMT Near Me |Buy DMT USA
>
>
>
>
>
> Your best online shop to get plantimum quality microdosing psychedelics=
=20
> products online, pain,anxiety pills, and research
>
>
> chemicals.
>
> Be 100% assured about the quality and genuineness of the product.
>
>
> Buy DMT .5ml Purecybin =E2=80=93 300mg DMT Online:=20
> https://t.me/tripgum/product/buy-dmt-5ml-purecybin-300mg-dmt-
>
>
> online/
>
>
> Buy Dmt Online: https://t.me/tripgum/product-category/dmt/
>
>
> Buy LSD online:
>
>
>
> Buy Magic Mushroom Online:=20
> https://t.me/tripgum/product-category/mushrooms/
>
>
> Buy DeadHead Chemist DMT Vape Cartridge:=20
> https://t.me/tripgum/product-category/dmt/
>
>
> Buy Exotic Marijuana Strains Online:
>
>
> Buy 5-MEO DMT .5ml 150mg Mushrooms Canada Online:=20
> https://t.me/tripgum/product/buy-5-meo-dmt-5ml-150mg-
>
>
> mushrooms-canada-online/
>
>
> Buy 5-Meo-DMT(Cartridge) 1mL Deadhead Chemist Online:=20
> https://t.me/tripgum/product/buy-5-meo-dmtcartridge-
>
>
> 1ml-deadhead-chemist-online/
>
>
> Buy Microdose 4-AcO-DMT Deadhead Chemist Online:
> https://t.me/tripgum/product/buy-microdose-4-aco-dmt-
>
>
> deadhead-chemist-online/
>
>
> Buy Deadhead Chemist DMT 3 Cartridges Deal 1mL Online:=20
> https://t.me/tripgum/product/buy-deadhead-chemist-
>
>
> dmt-3-cartridges-deal-1ml-online/
>
>
> Buy PolkaDot Magic Mushroom Belgian Chocolate 4G:
>
>
> Buy Penis Envy Magic Mushrooms:=20
> https://t.me/tripgum/product/buy-new-penis-envy-mostly-stems-online/
>
>
> Buy DMT 1ml Purecybin =E2=80=93 700mg DMT Online:=20
> https://t.me/tripgum/product/buy-dmt-1ml-purecybin-700mg-dmt-
>
>
> online/
>
>
> Buy NN-DMT(Cartridge) 1mL | 800MG | MMD Cosmo Online:
> https://t.me/tripgum/product/buy-nn-dmtcartridge-1ml-
>
>
> 800mg-mmd-cosmo-online/
>
>
> Golden Teacher Magic Mushrooms:
>
>
> Buy One Up =E2=80=93 Psilocybin Mushroom Chocolate Bar 3.5g:
>
>
> Buy 100 Microgram 1P-LSD Blotter Tab online:
>
>
> 1P-LSD (125mcg) Blotter For Sale:
>
>
> Where to Order Xanax 2mg bas pfizer Online, Buy Mexican Blues 30S, Black=
=20
> tar H, Clear, Yayo,
>
> China White, Percocets, Valium, Adderall(IR & XR), Methadone, Hydrocodone=
,=20
> Diazepam, Dilaudid, Oxycotin, Roxycodone,
>
>
> Suboxone, Subutex, Klonpin, Soma, Ritalin
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e98a9d7b-88e4-4c76-9368-2ec4419f5e20n%40googlegroups.com.

------=_Part_20322_1564236561.1717457355026
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

where to buy high quality LSD, pain and anxiety pills, depression medicatio=
ns and research chemicals for research purposes? Be 99.99% sure of product =
quality and authenticity. With a focus on quality and customer satisfaction=
, we ensure that all our products are sourced from reputable manufacturers =
and undergo rigorous testing for purity and potency.<br /><br />https://t.m=
e/ukverifiedv<br />https://t.me/ukverifiedv<br />https://t.me/ukverifiedv<b=
r />Message @Clarkderby1 to place =C2=A0your order<br /><br />100% discreet=
 and confidential,<br />-Your personal information is 100% SECURE.<br />-Yo=
ur orders are 100% secure and anonymous.<br />-Fast delivery worldwide (you=
 can track the shipment with the provided tracking numbe<br /><br /><div cl=
ass=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Saturday, Jun=
e 1, 2024 at 10:56:36=E2=80=AFAM UTC-7 Alix Rosine Pokam wrote:<br/></div><=
blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left:=
 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div><br></div><div>Psil=
ocybin Gummies - Mushroom Gummy Cubes 3.5g online | Buy Psilocybin Gummies =
100% Fast And Discreet Shipping<br></div><div><br><br>Worldwide<br><br>Buy =
Magic Mushrooms Online | Psychedelics For Sale USA | Mushroom Chocolate Bar=
s Online<br><br>Buy Xanax 2mg bars, Hydrocodone, Diazepam, Dilaudid, Oxycot=
in, Roxycodone, Suboxone, Subutex, Klonpin, Soma, Ritalin<br><br>Buy microd=
osing psychedelics online | Buy magic mushrooms gummies online | buy dmt ca=
rts online usa<br><br>DMT for Sale | Order DMT Cartridges Online | Buy DMT =
Online | WHere to Buy DMT in Australia<br><br>NN DMT for Sale | Order DMT C=
artridges Online | Buy DMT Online Europe | WHere to Buy DMT Near Me |Buy DM=
T USA<br><br><br><br><br><br>Your best online shop to get plantimum quality=
 microdosing psychedelics products online, pain,anxiety pills, and research=
<br><br><br>chemicals.<br><br>Be 100% assured about the quality and genuine=
ness of the product.<br><br><br>Buy DMT .5ml Purecybin =E2=80=93 300mg DMT =
Online: <a href=3D"https://t.me/tripgum/product/buy-dmt-5ml-purecybin-300mg=
-dmt-" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/tripgum/product/buy-dmt-5ml-=
purecybin-300mg-dmt-&amp;source=3Dgmail&amp;ust=3D1717543744233000&amp;usg=
=3DAOvVaw3V9qxjqRraGHxTHMmfEkyk">https://t.me/tripgum/product/buy-dmt-5ml-p=
urecybin-300mg-dmt-</a><br><br><br>online/<br><br><br>Buy Dmt Online: <a hr=
ef=3D"https://t.me/tripgum/product-category/dmt/" target=3D"_blank" rel=3D"=
nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://t.me/tripgum/product-category/dmt/&amp;source=3Dgmail&amp;ust=3D=
1717543744233000&amp;usg=3DAOvVaw2yrOxOpG11M2b0Af4KOizp">https://t.me/tripg=
um/product-category/dmt/</a><br><br><br>Buy LSD online:<br><br><br><br>Buy =
Magic Mushroom Online: <a href=3D"https://t.me/tripgum/product-category/mus=
hrooms/" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https:/=
/www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/tripgum/product-category/m=
ushrooms/&amp;source=3Dgmail&amp;ust=3D1717543744233000&amp;usg=3DAOvVaw08m=
eSVZ0-QiwaxEV0XljZ7">https://t.me/tripgum/product-category/mushrooms/</a><b=
r><br><br>Buy DeadHead Chemist DMT Vape Cartridge: <a href=3D"https://t.me/=
tripgum/product-category/dmt/" target=3D"_blank" rel=3D"nofollow" data-safe=
redirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/trip=
gum/product-category/dmt/&amp;source=3Dgmail&amp;ust=3D1717543744233000&amp=
;usg=3DAOvVaw2yrOxOpG11M2b0Af4KOizp">https://t.me/tripgum/product-category/=
dmt/</a><br><br><br>Buy Exotic Marijuana Strains Online:<br><br><br>Buy 5-M=
EO DMT .5ml 150mg Mushrooms Canada Online: <a href=3D"https://t.me/tripgum/=
product/buy-5-meo-dmt-5ml-150mg-" target=3D"_blank" rel=3D"nofollow" data-s=
aferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/t=
ripgum/product/buy-5-meo-dmt-5ml-150mg-&amp;source=3Dgmail&amp;ust=3D171754=
3744233000&amp;usg=3DAOvVaw0wsNRw64my9WZs7EpPUfLU">https://t.me/tripgum/pro=
duct/buy-5-meo-dmt-5ml-150mg-</a><br><br><br>mushrooms-canada-online/<br><b=
r><br>Buy 5-Meo-DMT(Cartridge) 1mL Deadhead Chemist Online: <a href=3D"http=
s://t.me/tripgum/product/buy-5-meo-dmtcartridge-" target=3D"_blank" rel=3D"=
nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://t.me/tripgum/product/buy-5-meo-dmtcartridge-&amp;source=3Dgmail&=
amp;ust=3D1717543744233000&amp;usg=3DAOvVaw2BlIKehmbQCO1Y_B8r3laN">https://=
t.me/tripgum/product/buy-5-meo-dmtcartridge-</a><br><br><br>1ml-deadhead-ch=
emist-online/<br><br><br>Buy Microdose 4-AcO-DMT Deadhead Chemist Online:<a=
 href=3D"https://t.me/tripgum/product/buy-microdose-4-aco-dmt-" target=3D"_=
blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?=
hl=3Den&amp;q=3Dhttps://t.me/tripgum/product/buy-microdose-4-aco-dmt-&amp;s=
ource=3Dgmail&amp;ust=3D1717543744233000&amp;usg=3DAOvVaw1IdtUvj8-luU5cBGE3=
P27Z">https://t.me/tripgum/product/buy-microdose-4-aco-dmt-</a><br><br><br>=
deadhead-chemist-online/<br><br><br>Buy Deadhead Chemist DMT 3 Cartridges D=
eal 1mL Online: <a href=3D"https://t.me/tripgum/product/buy-deadhead-chemis=
t-" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Den&amp;q=3Dhttps://t.me/tripgum/product/buy-deadhead-ch=
emist-&amp;source=3Dgmail&amp;ust=3D1717543744233000&amp;usg=3DAOvVaw2y7U-o=
LkIThsHkMHoY4-F6">https://t.me/tripgum/product/buy-deadhead-chemist-</a><br=
><br><br>dmt-3-cartridges-deal-1ml-online/<br><br><br>Buy PolkaDot Magic Mu=
shroom Belgian Chocolate 4G:<br><br><br>Buy Penis Envy Magic Mushrooms: <a =
href=3D"https://t.me/tripgum/product/buy-new-penis-envy-mostly-stems-online=
/" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.g=
oogle.com/url?hl=3Den&amp;q=3Dhttps://t.me/tripgum/product/buy-new-penis-en=
vy-mostly-stems-online/&amp;source=3Dgmail&amp;ust=3D1717543744233000&amp;u=
sg=3DAOvVaw076Fr5nvg-1fGrMpGplTRH">https://t.me/tripgum/product/buy-new-pen=
is-envy-mostly-stems-online/</a><br><br><br>Buy DMT 1ml Purecybin =E2=80=93=
 700mg DMT Online: <a href=3D"https://t.me/tripgum/product/buy-dmt-1ml-pure=
cybin-700mg-dmt-" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/tripgum/product=
/buy-dmt-1ml-purecybin-700mg-dmt-&amp;source=3Dgmail&amp;ust=3D171754374423=
3000&amp;usg=3DAOvVaw26YLOq9vdULNRtBLkF-UNk">https://t.me/tripgum/product/b=
uy-dmt-1ml-purecybin-700mg-dmt-</a><br><br><br>online/<br><br><br>Buy NN-DM=
T(Cartridge) 1mL | 800MG | MMD Cosmo Online:<a href=3D"https://t.me/tripgum=
/product/buy-nn-dmtcartridge-1ml-" target=3D"_blank" rel=3D"nofollow" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/=
tripgum/product/buy-nn-dmtcartridge-1ml-&amp;source=3Dgmail&amp;ust=3D17175=
43744233000&amp;usg=3DAOvVaw2GapEbAAdtbeGypA-Yr13p">https://t.me/tripgum/pr=
oduct/buy-nn-dmtcartridge-1ml-</a><br><br><br>800mg-mmd-cosmo-online/<br><b=
r><br>Golden Teacher Magic Mushrooms:<br><br><br>Buy One Up =E2=80=93 Psilo=
cybin Mushroom Chocolate Bar 3.5g:<br><br><br>Buy 100 Microgram 1P-LSD Blot=
ter Tab online:<br><br><br>1P-LSD (125mcg) Blotter For Sale:<br><br><br>Whe=
re to Order Xanax 2mg bas pfizer Online, Buy Mexican Blues 30S, Black tar H=
, Clear, Yayo,<br><br>China White, Percocets, Valium, Adderall(IR &amp; XR)=
, Methadone, Hydrocodone, Diazepam, Dilaudid, Oxycotin, Roxycodone,<br><br>=
<br>Suboxone, Subutex, Klonpin, Soma, Ritalin<br></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e98a9d7b-88e4-4c76-9368-2ec4419f5e20n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e98a9d7b-88e4-4c76-9368-2ec4419f5e20n%40googlegroups.co=
m</a>.<br />

------=_Part_20322_1564236561.1717457355026--

------=_Part_20321_1262660630.1717457355025--
