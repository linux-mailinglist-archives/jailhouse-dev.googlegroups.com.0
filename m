Return-Path: <jailhouse-dev+bncBCMKTTEX5MOBBSG7QKZQMGQELJA4A5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D938FD5D3
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Jun 2024 20:34:51 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id 3f1490d57ef6-dfa78a1b142sf306424276.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Jun 2024 11:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717612490; x=1718217290; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TrjApVUHhbPnxV5fScez1tDklAWEhyNNsPOeQmKgaxE=;
        b=GWFVlvlPHUwAzhtgpz+z7u0HnYHUu7zOao1TBlj6P/ew0bkooYjM6+0VN/ebR9TODx
         POwxQ2lQQxlUhNCNZNA1ubsShjUD8ji1/GZVZib+Quco/2eRLUbF8OjwsOEoGDDlA0H5
         hHG/dIhuVkN4OqA8b7XBD+XUKUvMy+lgB+3TOjwj0sud4DROIz2+HIP7HX/Ol4NcZkca
         Y10+LBLE4IPCCy1Ti7Wd/oW5T/60TY8/7SB3SklvyJNkegQYGmmcw+/1TOLlIpmyfGcI
         BZAYBnMUNleasw5JclIshAY7TZdnl89x+u4CI8dWMkEF2iMFM1kOzz45B77hWagqM8Ds
         ccFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717612490; x=1718217290; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrjApVUHhbPnxV5fScez1tDklAWEhyNNsPOeQmKgaxE=;
        b=M7BxQaV8Rb/oQ0BXhegUjHy1PQvClt3Lv9cqzNLyxtmB4AVJefc62l8GMlqA6lSnrg
         T5sKl5BDXF+kxrQ3yGT+O+OEnp6LHDK8sec2Zb0XGeLhNTR89ygPvG3b21oPM+4PG8Ak
         bk1NzgCeAGBfvjlleYbQQQGET7LFg3FZgkad7h2uXqgJdmydk7bfPqfsMqmFUV3YpwuQ
         kYU+ofrs8vAYLTFTvtjN7j2Aj5H8EDNFRb0doMGEczePWAP+4spITuRTAmgabN7zysiu
         WC/GU7Aq/OMoxRqdUS1e6pzeguzrzB2Jt46rwVDkYIIq4Xu5UfQBymscz4Ngo7di5r5v
         v5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717612490; x=1718217290;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TrjApVUHhbPnxV5fScez1tDklAWEhyNNsPOeQmKgaxE=;
        b=lW7ExuUox+KoOaFxkWRXCOBaGO8D4dgKu22fGeYkLLx7xslwMubTS1Hs6axu5hwK4C
         LeqJ2zjh3wX7IW0QchQ+TFgLHgjs/7UuVfdZ32acueUD3PfmpCecoShM6/fGm5RcOLW1
         /MNyBfakoS9fy+lcKt/5GC31Q/Vt8xp1BXOysAabdcNuJBZ6CgT6VqAqLtNx97RFavxP
         Jq/4TLfoLaJwPx3gQGBmuxRAoMsNPDjpmF3E0AATENexe82dZLISMU9kFWlhuGVuH63k
         Fy0O304+8jV/5mexqEvpPKKVIeR6q0bIBsvt6pAJzcoInjYkZpEgJmtlkE/aaklnzsQf
         ipIQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVLNkFFLGovBAD4pCbfQB13xR8yzWrKt5UC4Pdl/VEkhM6Dx2+LtfkgrWiRQksOEtjpNigFe9wx18ENX/f5Kbdux98JQK1bn/a7FJo=
X-Gm-Message-State: AOJu0YxBcH0waNBRPdN7fk/Xq/nvMxNSr4rop3kW6hLyScQkstXvZy1W
	Cv1lTaH6qSq9RqOq00ZoplFpUa01UK2rFuTJXL55yCUR7W/jSB05
X-Google-Smtp-Source: AGHT+IEm7NhEHuvqLCQ6aki5w7S61hqB5FAQygqSCGexyr5ajNIew2Gfc6Ldqjswyw0gAG2dlg+2Gg==
X-Received: by 2002:a25:c544:0:b0:df7:955f:9b99 with SMTP id 3f1490d57ef6-dfacaced9aamr3287949276.47.1717612489520;
        Wed, 05 Jun 2024 11:34:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:26c3:0:b0:dfa:8443:a04 with SMTP id 3f1490d57ef6-dfae025f830ls70802276.1.-pod-prod-02-us;
 Wed, 05 Jun 2024 11:34:48 -0700 (PDT)
X-Received: by 2002:a05:690c:6c0a:b0:627:a961:1b32 with SMTP id 00721157ae682-62cbb5e0aedmr7337847b3.6.1717612487964;
        Wed, 05 Jun 2024 11:34:47 -0700 (PDT)
Date: Wed, 5 Jun 2024 11:34:47 -0700 (PDT)
From: JAMES BRYANT <jambel420@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a28671d8-e460-4695-8337-c1a386105f40n@googlegroups.com>
In-Reply-To: <ec68a154-64a0-43d1-a5c6-e6c4ee3cf81en@googlegroups.com>
References: <ec68a154-64a0-43d1-a5c6-e6c4ee3cf81en@googlegroups.com>
Subject: Re: $ORDER DMT VAPES, CARTRIDGES WITH POWDER ONLINE CALIFORNIA
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2025_1615305498.1717612487084"
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

------=_Part_2025_1615305498.1717612487084
Content-Type: multipart/alternative; 
	boundary="----=_Part_2026_40784774.1717612487084"

------=_Part_2026_40784774.1717612487084
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Your best online shop to get plantimum quality microdosing psychedelics=20
products online, pain,anxiety pills, and research chemicals.
Be 100% assurance=20

Buy DMT .5ml Purecybin =E2=80=93 300mg DMT=20
Online: https;t.me/Ricko_swavy8/product/buy-dmt-5ml-purecybin-300mg-dmt-onl=
ine/

Buy Dmt Online: https:t.me/Ricko_swavy8/product-category/dmt/

Buy LSD online: https:t.me/Ricko_swavy8/product-category/lsd/


Buy Magic Mushroom=20
Online: https:t.me/Ricko_swavy8/product-category/mushrooms/

Buy DeadHead Chemist DMT Vape=20
Cartridge: https:t.me/Ricko_swavy8/product-category/dmt/

Buy Exotic Marijuana Strains Online:

Buy 5-MEO DMT .5ml 150mg Mushrooms Canada=20
Online: https:t.me/Ricko_swavy8/product/buy-5-meo-dmt-5ml-150mg-mushrooms-c=
anada-online/

Buy 5-Meo-DMT(Cartridge) 1mL Deadhead Chemist=20
Online: https:t.me/Ricko_swavy8/product/buy-5-meo-dmtcartridge-1ml-deadhead=
-chemist-online/

Buy Microdose 4-AcO-DMT Deadhead Chemist=20
Online:https:t.me/Ricko_swavy8/product/buy-microdose-4-aco-dmt-deadhead-che=
mist-online/

Buy Deadhead Chemist DMT 3 Cartridges Deal 1mL=20
Online: https:t.me/Ricko_swavy8/product/buy-deadhead-chemist-dmt-3-cartridg=
es-deal-1ml-online/

Buy PolkaDot Magic Mushroom Belgian Chocolate 4G:

Buy Penis Envy Magic=20
Mushrooms: https://www.t.me/Ricko_swavy8/product/buy-new-penis-envy-mostly-=
stems-online/

Buy DMT 1ml Purecybin =E2=80=93 700mg DMT=20
Online: https://www.t.me/Ricko_swavy8/product/buy-dmt-1ml-purecybin-700mg-d=
mt-online/

Buy NN-DMT(Cartridge) 1mL | 800MG | MMD Cosmo=20
Online:https:t.me/Ricko_swavy8/product/buy-nn-dmtcartridge-1ml-800mg-mmd-co=
smo-online/

Golden Teacher Magic Mushrooms:

Buy One Up =E2=80=93 Psilocybin Mushroom Chocolate Bar
On Monday, June 3, 2024 at 5:33:23=E2=80=AFAM UTC-7 Clarksville Pop wrote:

> DMT VAPE PEN AND CARTS ONLINE IN LONDON/ENGLAND /CANADA/SAN FRANCISCO
>
>
> DMT is the fastest-acting and most intense psychedelic available =E2=80=
=93 it=E2=80=99s=20
> the best for new users who want an out-of-body experience that won=E2=80=
=99t last=20
> too long.
>
> https://t.me/Mushies_12
>
>
> When you buy DMT in Canada =E2=80=93 vaping is the most common DMT produc=
t.
> https://t.me/Mushies_12
> https://t.me/Mushies_12
>
> Using a DMT vape cartridge can help mask the signature odour that is=20
> emitted when smoking DMT.
>
> There is something about vaping that makes DMT use more palatable despite=
=20
> being the most powerful psychedelic in the world. DMT is used for oral=20
> consumption, inhaling through smoking, and mixed in brews (Ayahuasca) to=
=20
> create a longer-lasting high. If you want to buy DMT vapes in Canada =E2=
=80=93=20
> TheFunguys is your source to buy psychedelics online in Canada; we have a=
=20
> full-strength, high-quality DMT vape for sale online. Visit our website=
=20
> homepage for more information
> https://t.me/Mushies_12
> https://t.me/Mushies_12
>
> Our DMT vape pens function like any other vape by pressing the button and=
=20
> pulling off the mouthpiece. The vape cartridge is loaded with a DMT liqui=
d=20
> of dissolved Dimethyltryptamine powder or DMT crystals. These DMT pens ar=
e=20
> tiny and inconspicuous, with enough dosages to last 100 short trips or 30=
=20
> to 50 regular trips. Our DMT vape carts have 1g of oil in them.
>
> The battery is 350 mAh, 3.7v operation. 5 Clicks to turn the battery=20
> on/off.
>
> How Long Do The Effects Last?
>
> The great thing about DMT in vape form is you can regulate the effects by=
=20
> the amount of the pull. Generally, one hit will last between 10-20 minute=
s,=20
> but you can pull very lightly or strongly =E2=80=93 this is up to you; as=
 we always=20
> say, start slow, go slow, and figure out how it affects you.
>
> Three large inhalations will provide a potent experience for the average=
=20
> person, giving you a high lasting for a maximum of 40 minutes. Four hits =
is=20
> a high dose and will have a powerful effect.
>
> How to use the DMT Cartridge & Battery
>
> Once you have the vape, all you have to do is light it up using the butto=
n=20
> and take a few puffs at a time.
>
> =E2=80=A2 Find a chill place to enjoy the effects of the DMT, perhaps wit=
h a=20
> trusted friend.
>
> =E2=80=A2 You want to shake the pen before using it, as an unshaken cartr=
idge may=20
> leave you vaping only the solvent.
>
> =E2=80=A2 Click the button 5 times to turn on the vape
>
> =E2=80=A2 Hold the button as you pull on the vape
>
> =E2=80=A2 Exhale when ready
>
> =E2=80=A2 Feel the effects
>
> DMT Vape Pens FAQ:
>
> What is a DMT Pen?
>
> A DMT Vaporizer and cart is a vaporizing device that heats a liquid base=
=20
> of DMT to create fumes of the drug that can be inhaled into the lungs. Li=
ke=20
> other vape pens and e-cigarettes, the DMT cartridges use e-liquids to=20
> control and ease use. Unfortunately we don=E2=80=99t sell a straight DMT =
cartridge=20
> yet.
>
>
> https://t.me/Mushies_12
> https://t.me/Mushies_12
>
> This pen will allow users to vape DMT in small doses that provide short=
=20
> trips lasting 20 and 40 minutes. The term for the trips is =E2=80=98busin=
ess trip=E2=80=99=20
> since the effects are temporary and wear off quickly.
> https://t.me/Mushies_12
> https://t.me/Mushies_12
>
> The vape comes with a battery, a cartridge, and an enclosing case=E2=80=
=94the=20
> energy cell lights it up, and the cart stores the lit e-liquid (propylene=
=20
> glycol and other organic mixing agents) DMT base. When the=20
> n-Dimethyltryptamine (DMT), the active ingredient in the vapes, hits the=
=20
> coil, it vaporizes the liquid, providing a quick trip.
>
> The pen may utilize a standard vaporizer like an e-cigarette or one for=
=20
> marijuana vaping.
> https://t.me/Mushies_12
> https://t.me/Mushies_12
>
>
>
> Buying a DMT cartridge on its own can be interchangeable with regular 310=
=20
> vape batteries, making them versatile and easily accessible. You can use=
=20
> the vape pen to smoke anything in 310 cartridges, including THC and CBD=
=20
> carts.
>
> What is DMT?
>
> DMT is a naturally occurring compound in Ayahuasca, n-dimethyltryptamine,=
=20
> known as the =E2=80=9Cspirit molecule.=E2=80=9D A DMT trip is short and i=
ntense. This=20
> mind-altering substance can cause various, and some unpredictable, effect=
s,=20
> which can have potential benefits for personal growth. Some p
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a28671d8-e460-4695-8337-c1a386105f40n%40googlegroups.com.

------=_Part_2026_40784774.1717612487084
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />Your best online shop to get plantimum quality microdosing psychedeli=
cs products online, pain,anxiety pills, and research chemicals.<br />Be 100=
% assurance <br /><br />Buy DMT .5ml Purecybin =E2=80=93 300mg DMT Online:=
=C2=A0https;t.me/Ricko_swavy8/product/buy-dmt-5ml-purecybin-300mg-dmt-onlin=
e/<br /><br />Buy Dmt Online:=C2=A0https:t.me/Ricko_swavy8/product-category=
/dmt/<br /><br />Buy LSD online:=C2=A0https:t.me/Ricko_swavy8/product-categ=
ory/lsd/<br /><br /><br />Buy Magic Mushroom Online:=C2=A0https:t.me/Ricko_=
swavy8/product-category/mushrooms/<br /><br />Buy DeadHead Chemist DMT Vape=
 Cartridge:=C2=A0https:t.me/Ricko_swavy8/product-category/dmt/<br /><br />B=
uy Exotic Marijuana Strains Online:<br /><br />Buy 5-MEO DMT .5ml 150mg Mus=
hrooms Canada Online:=C2=A0https:t.me/Ricko_swavy8/product/buy-5-meo-dmt-5m=
l-150mg-mushrooms-canada-online/<br /><br />Buy 5-Meo-DMT(Cartridge) 1mL De=
adhead Chemist Online:=C2=A0https:t.me/Ricko_swavy8/product/buy-5-meo-dmtca=
rtridge-1ml-deadhead-chemist-online/<br /><br />Buy Microdose 4-AcO-DMT Dea=
dhead Chemist Online:https:t.me/Ricko_swavy8/product/buy-microdose-4-aco-dm=
t-deadhead-chemist-online/<br /><br />Buy Deadhead Chemist DMT 3 Cartridges=
 Deal 1mL Online:=C2=A0https:t.me/Ricko_swavy8/product/buy-deadhead-chemist=
-dmt-3-cartridges-deal-1ml-online/<br /><br />Buy PolkaDot Magic Mushroom B=
elgian Chocolate 4G:<br /><br />Buy Penis Envy Magic Mushrooms:=C2=A0https:=
//www.t.me/Ricko_swavy8/product/buy-new-penis-envy-mostly-stems-online/<br =
/><br />Buy DMT 1ml Purecybin =E2=80=93 700mg DMT Online:=C2=A0https://www.=
t.me/Ricko_swavy8/product/buy-dmt-1ml-purecybin-700mg-dmt-online/<br /><br =
/>Buy NN-DMT(Cartridge) 1mL | 800MG | MMD Cosmo Online:https:t.me/Ricko_swa=
vy8/product/buy-nn-dmtcartridge-1ml-800mg-mmd-cosmo-online/<br /><br />Gold=
en Teacher Magic Mushrooms:<br /><br />Buy One Up =E2=80=93 Psilocybin Mush=
room Chocolate Bar<br /><div class=3D"gmail_quote"><div dir=3D"auto" class=
=3D"gmail_attr">On Monday, June 3, 2024 at 5:33:23=E2=80=AFAM UTC-7 Clarksv=
ille Pop wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin=
: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex=
;">DMT VAPE PEN AND CARTS ONLINE IN LONDON/ENGLAND /CANADA/SAN FRANCISCO<di=
v><br></div><div><br></div><div>DMT is the fastest-acting and most intense =
psychedelic available =E2=80=93 it=E2=80=99s the best for new=C2=A0users wh=
o want an out-of-body experience that won=E2=80=99t last too long.</div><di=
v><br></div><div><a href=3D"https://t.me/Mushies_12" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&am=
p;q=3Dhttps://t.me/Mushies_12&amp;source=3Dgmail&amp;ust=3D1717698595497000=
&amp;usg=3DAOvVaw2U8yslKrQUvjECSrsaUj4p">https://t.me/Mushies_12</a></div><=
div><br></div><div><br></div><div>When you=C2=A0buy DMT in Canada=C2=A0=E2=
=80=93 vaping is the most common DMT product.</div><div><a href=3D"https://=
t.me/Mushies_12" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D=
"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Mushies_12&amp;sou=
rce=3Dgmail&amp;ust=3D1717698595498000&amp;usg=3DAOvVaw28J9W9PYcM9c_MhnfLAH=
xg">https://t.me/Mushies_12</a></div><div><a href=3D"https://t.me/Mushies_1=
2" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.g=
oogle.com/url?hl=3Den&amp;q=3Dhttps://t.me/Mushies_12&amp;source=3Dgmail&am=
p;ust=3D1717698595498000&amp;usg=3DAOvVaw28J9W9PYcM9c_MhnfLAHxg">https://t.=
me/Mushies_12</a></div><div><br></div><div>Using a DMT vape cartridge can h=
elp mask the signature odour that is emitted when smoking DMT.</div><div><b=
r></div><div>There is something about vaping that makes DMT use more palata=
ble despite being the most powerful psychedelic in the world. DMT is used f=
or oral consumption, inhaling through smoking, and mixed in brews (Ayahuasc=
a) to create a longer-lasting high. If you want to=C2=A0buy DMT vapes in Ca=
nada=C2=A0=E2=80=93 TheFunguys is your source to=C2=A0buy psychedelics onli=
ne in Canada; we have a full-strength, high-quality DMT vape for sale onlin=
e. Visit our website homepage for more information</div><div><a href=3D"htt=
ps://t.me/Mushies_12" target=3D"_blank" rel=3D"nofollow" data-saferedirectu=
rl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Mushies_12&am=
p;source=3Dgmail&amp;ust=3D1717698595498000&amp;usg=3DAOvVaw28J9W9PYcM9c_Mh=
nfLAHxg">https://t.me/Mushies_12</a></div><div><a href=3D"https://t.me/Mush=
ies_12" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://=
www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Mushies_12&amp;source=3Dgma=
il&amp;ust=3D1717698595498000&amp;usg=3DAOvVaw28J9W9PYcM9c_MhnfLAHxg">https=
://t.me/Mushies_12</a></div><div><br></div><div>Our DMT vape pens function =
like any other vape by pressing the button and pulling off the mouthpiece. =
The vape cartridge is loaded with a DMT liquid of dissolved Dimethyltryptam=
ine powder or DMT crystals. These DMT pens are tiny and inconspicuous, with=
=C2=A0enough dosages to last 100 short trips or 30 to 50 regular trips.=C2=
=A0Our DMT vape carts have=C2=A01g of oil=C2=A0in them.</div><div><br></div=
><div>The battery is 350 mAh, 3.7v operation.=C2=A05 Clicks to turn the bat=
tery on/off.</div><div><br></div><div>How Long Do The Effects Last?</div><d=
iv><br></div><div>The great thing about DMT in vape form is you can regulat=
e the effects by the amount of the pull. Generally,=C2=A0one hit will last =
between 10-20 minutes, but you can pull very lightly or strongly =E2=80=93 =
this is up to you; as we always say, start slow, go slow, and figure out ho=
w it affects you.</div><div><br></div><div>Three large inhalations will pro=
vide a potent experience for the average person, giving you a high lasting =
for a maximum of 40 minutes. Four hits is a high dose and will have a power=
ful effect.</div><div><br></div><div>How to use the DMT Cartridge &amp; Bat=
tery</div><div><br></div><div>Once you have the vape, all you have to do is=
 light it up using the button and take a few puffs at a time.</div><div><br=
></div><div>=E2=80=A2 Find a chill place to enjoy the effects of the DMT, p=
erhaps with a trusted friend.</div><div><br></div><div>=E2=80=A2 You want t=
o shake the pen before using it, as an unshaken cartridge may leave you vap=
ing only the solvent.</div><div><br></div><div>=E2=80=A2 Click the button 5=
 times to turn on the vape</div><div><br></div><div>=E2=80=A2 Hold the butt=
on as you pull on the vape</div><div><br></div><div>=E2=80=A2 Exhale when r=
eady</div><div><br></div><div>=E2=80=A2 Feel the effects</div><div><br></di=
v><div>DMT Vape Pens FAQ:</div><div><br></div><div>What is a DMT Pen?</div>=
<div><br></div><div>A DMT Vaporizer and cart is a vaporizing device that he=
ats a liquid base of DMT to create fumes of the drug that can be inhaled in=
to the lungs. Like other vape pens and e-cigarettes, the DMT cartridges use=
 e-liquids to control and ease use. Unfortunately we don=E2=80=99t sell a s=
traight DMT cartridge yet.</div><div><br></div><div><br></div><div><a href=
=3D"https://t.me/Mushies_12" target=3D"_blank" rel=3D"nofollow" data-safere=
directurl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Mushie=
s_12&amp;source=3Dgmail&amp;ust=3D1717698595498000&amp;usg=3DAOvVaw28J9W9PY=
cM9c_MhnfLAHxg">https://t.me/Mushies_12</a></div><div><a href=3D"https://t.=
me/Mushies_12" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"h=
ttps://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Mushies_12&amp;sourc=
e=3Dgmail&amp;ust=3D1717698595498000&amp;usg=3DAOvVaw28J9W9PYcM9c_MhnfLAHxg=
">https://t.me/Mushies_12</a></div><div><br></div><div>This pen will allow =
users to vape DMT in small doses that provide short trips lasting 20 and 40=
 minutes. The term for the trips is =E2=80=98business trip=E2=80=99 since t=
he effects are temporary and wear off quickly.</div><div><a href=3D"https:/=
/t.me/Mushies_12" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Mushies_12&amp;=
source=3Dgmail&amp;ust=3D1717698595498000&amp;usg=3DAOvVaw28J9W9PYcM9c_Mhnf=
LAHxg">https://t.me/Mushies_12</a></div><div><a href=3D"https://t.me/Mushie=
s_12" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://ww=
w.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Mushies_12&amp;source=3Dgmail=
&amp;ust=3D1717698595498000&amp;usg=3DAOvVaw28J9W9PYcM9c_MhnfLAHxg">https:/=
/t.me/Mushies_12</a></div><div><br></div><div>The vape comes with a battery=
, a cartridge, and an enclosing case=E2=80=94the energy cell lights it up, =
and the cart stores the lit e-liquid (propylene glycol and other organic mi=
xing agents) DMT base. When the n-Dimethyltryptamine (DMT), the active ingr=
edient in the vapes, hits the coil, it vaporizes the liquid, providing a qu=
ick trip.</div><div><br></div><div>The pen may utilize a standard vaporizer=
 like an e-cigarette or one for marijuana vaping.</div><div><a href=3D"http=
s://t.me/Mushies_12" target=3D"_blank" rel=3D"nofollow" data-saferedirectur=
l=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Mushies_12&amp=
;source=3Dgmail&amp;ust=3D1717698595498000&amp;usg=3DAOvVaw28J9W9PYcM9c_Mhn=
fLAHxg">https://t.me/Mushies_12</a></div><div><a href=3D"https://t.me/Mushi=
es_12" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Mushies_12&amp;source=3Dgmai=
l&amp;ust=3D1717698595498000&amp;usg=3DAOvVaw28J9W9PYcM9c_MhnfLAHxg">https:=
//t.me/Mushies_12</a></div><div><br></div><div><br></div><div><br></div><di=
v>Buying a DMT cartridge on its own can be interchangeable with regular 310=
 vape batteries, making them versatile and easily accessible. You can use t=
he vape pen to smoke anything in 310 cartridges, including THC and CBD cart=
s.</div><div><br></div><div>What is DMT?</div><div><br></div><div>DMT is a =
naturally occurring compound in Ayahuasca, n-dimethyltryptamine, known as t=
he =E2=80=9Cspirit molecule.=E2=80=9D A DMT trip is short and intense. This=
 mind-altering substance can cause various, and some unpredictable, effects=
, which can have potential benefits for personal growth. Some p</div></bloc=
kquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a28671d8-e460-4695-8337-c1a386105f40n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a28671d8-e460-4695-8337-c1a386105f40n%40googlegroups.co=
m</a>.<br />

------=_Part_2026_40784774.1717612487084--

------=_Part_2025_1615305498.1717612487084--
