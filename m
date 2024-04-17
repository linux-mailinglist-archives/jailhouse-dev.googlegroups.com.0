Return-Path: <jailhouse-dev+bncBCWZR36CYUJBB6FJ7SYAMGQEGC3F7VQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD7B8A79BB
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Apr 2024 02:16:58 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id 3f1490d57ef6-de3d9eacb57sf3657434276.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 16 Apr 2024 17:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1713313017; x=1713917817; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRlFjteUCqYJtfWN0lHDao/j/BCjQ2odxXAx8q8/iM8=;
        b=mg9BZNn44R5JzDjuSw/tVfDS7rlhs3RrJ3EPQnEQkEDNwyK5TTDYSCCeMik5v/v/OR
         KKG40e+0yvb5U7b0jckPoatXo4eeQ3rOXHxRUDyg8/CAn91fmeZkAWeCemmphitgVSNL
         GKIQtsJtPrMcOEAT5zy9jve1s9dUsAcltCd5JtlVbiPqMopyT7qxY8EIcsPpWOAzugxO
         9iW0Xs8reUM+bOmF/Tu+5zQsArXZYYms0oaHKObXLY0vv2P4Rgc5boPlhRH6RrlJAHFB
         cFMh7wHWTq2G0Z+WvLEjU8SWDn+bEuhQ/mqD9/6NYXAi72/GZN8omHDHi4uQr8Ihmnfz
         11ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713313017; x=1713917817; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRlFjteUCqYJtfWN0lHDao/j/BCjQ2odxXAx8q8/iM8=;
        b=Buaef4iRwlASfFwbFhUa+a73Ul9G28LUJMb4xwe11kYgTY1fhxUxszORobMUVZp58P
         34Q+CHZ7gF2ATH+B7Hq2fUiAoXQRP1ZCc222xeWPZszJuFMh3RGZllFNS1EKNRxXZ2Uy
         UoCxocimwnazGHTIPoHAuKIsPl2uvq4IBdIS/AylKKP0b2FOEPT4dp8N/nadZBP4k7+k
         /Ndp1Ir2nUo66yWiwWmdV7T7sDCjwwflnzocbKUZ8QMbObB8gWPOZVnLG/zF2LA7oE67
         J4vkyJRy2I+WsbU4TOODGEaxSmZOB7XZQig+y9MrAX66+zli99Q8lb/MQJo9LDwSWYgL
         mmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713313017; x=1713917817;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRlFjteUCqYJtfWN0lHDao/j/BCjQ2odxXAx8q8/iM8=;
        b=gzMOq0bl1wUpOPqN4HMUtucM4f9DWLcqDtncgWOHmDrZbWR8depqR2ZJssAZr5SADO
         OokZlnfbIeY/7y2RNWvZMBkJYz47dRQHHRErY7xJNuc8Hm6kZc3ixnC1KC2GQicOw9Qg
         iC8eqqD2YoBbhONWbCbVQn5/E6Kw7ELy0pGsRpfppzQooctrr+5hGamEATsRG1XSziEl
         ef6zjSyKN0oQ0w3ViM4YuUDv4ijGcXMSFGVB0TV++iGUMARam7AIXZ9/QJiGY53lqJ7X
         sv0DD5cLQlgxvrlHOny290Lzaym+v0n9FDtWJ5EvcoPg0tTCbc8XT+u0nbyPJ/s3x4Vj
         FWIQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCU8RnRAVxgkR1b8kXdsqeQMu4lo3s2R/GD7GkzQ1hQFiqzEcpI2LQpjmFo7UevAdhpBubCTYfW/vVFhkK6g2u+DjMHIkpg0FmZPobs=
X-Gm-Message-State: AOJu0YxghZe0ckWNAAnUOT3LYYnWXhi/uGH+IMWoYUaLJV9/nQajdcxF
	mVqqm4TJTXkiiC26o3Ke9x+V2FTL3NgzkFnjnnZkxrWREZsocLeO
X-Google-Smtp-Source: AGHT+IGq77FhyHHML916Io3BoXQKrq4vPEpbhk8/0oqZIo8J+iuwEHYDQCTwN3Wg8dn/uNM33Bi1Qw==
X-Received: by 2002:a25:adde:0:b0:dcf:f78f:a570 with SMTP id d30-20020a25adde000000b00dcff78fa570mr13563145ybe.7.1713313017613;
        Tue, 16 Apr 2024 17:16:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d892:0:b0:dcd:a08f:c83f with SMTP id p140-20020a25d892000000b00dcda08fc83fls1125248ybg.1.-pod-prod-08-us;
 Tue, 16 Apr 2024 17:16:56 -0700 (PDT)
X-Received: by 2002:a25:aac1:0:b0:de1:d50:ad47 with SMTP id t59-20020a25aac1000000b00de10d50ad47mr4207533ybi.13.1713313015966;
        Tue, 16 Apr 2024 17:16:55 -0700 (PDT)
Date: Tue, 16 Apr 2024 17:16:55 -0700 (PDT)
From: Franknoel Njubuin <franknoelnjubuin@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9c62f9a2-796d-473b-841c-deb54519164dn@googlegroups.com>
Subject: ARE YOU SUFFERING FROM CANCER, INSOMNIA, ANXIETY  OR CHRONIC PAIN
 WORRY NO MORE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_19860_1960896619.1713313015420"
X-Original-Sender: franknoelnjubuin@gmail.com
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

------=_Part_19860_1960896619.1713313015420
Content-Type: multipart/alternative; 
	boundary="----=_Part_19861_428740931.1713313015420"

------=_Part_19861_428740931.1713313015420
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Contact us to buy premium psychedelics products like dmt vape pen and=20
carts, lsd tabs, ayahuasca, changa, mescaline, psilocybin mushrooms edibles=
=20
and concentrate and lots of other potent psychedelics products at=20
affordable prices with tracking. Shipping worldwide with top notch stealth=
=20
packaging on all orders.

https://t.me/kylekushman2021
https://t.me/kylekushman2021
https://t.me/kylekushman2021
https://t.me/kylekushman2021

Buy Premium Chronic Carts Full Gram
ROCKY MOUNTAIN ROSIN VAPE CARTS 1ML
Buy Exotic Marijuana Strains Online, Buy Marijuana wax, Shatter and=20
Concentrate, Buy weed online
Rosin Vape Pen Kit (Rocky Mountain Rosin)
4oz (600mg) THC Lean Cannabis Syrup =E2=80=93 BAKED BROS=E2=84=A2
Buy 150x DS-3.0 LSD crystal 125=C2=B5g
Buy 5-MeO-DMT Cartridge 1mL
Medicated Airhead Xtremes Bites Edibles =E2=80=93 500mg
Psilo =E2=80=93 Psilocybin Mushroom Gummy Cubes 3.5g
Chocolate Chuckles =E2=80=93 Psilocybin Mushroom Chocolate Bar 3.5g
Buy pink runtz online
Buy White Runtz Online
Buy White Cherry Gelato by Backpack Boyz
Buy Sharklato Strain online
Buy Gruntz (Gushers X Runtz) powered by Runtz
Buy Pinkman Goo strain
Apetamin Syrup 200 ml=20

https://t.me/kylekushman2021https://t.me/kylekushman2021

https://t.me/kylekushman2021

Golden Teacher Spore Syringe Microscopy Kit
Magic Mushroom Spore Syringe =E2=80=93 Albino A+ psilocybe cubensis
10x-100x 205ug IMPORTED Triangular LSD Tabs Needlepoint 99% PURE Crystal
20X =E2=80=93 100x Mickey Mouse LSD tabs 260 micro grams (260ug) PURE Aztec=
 Crytal
Golden Teacher Magic Mushrooms
Penis Envy Magic Mushrooms
Buy Dried B+ Psilocybe Cubensis strain
Premium magic mushroom capsules
Buy 2C-B Powder Buy 2C-B Pills
Buy 4-AcO-DMT
Buy GHB Capsules Online
Buy Dank Vapes carts Online
Buy Ayahuasca Tea Kit =E2=80=93 10 Minute Preparation
Buy Ayahuasca Tea
CBD WAX DAB CONCENTRATES
Buy MDMA Crystal (Recrystallized, Purified, Powdered)
28G Dutch Champagne MDMA Crystal (Free Shipping)
Buy MDMA Crystal 84% LAB TESTED
1P-LSD (125mcg) Blotter For Sale
Ibogaine Capsules For Sale
Buy AL-LAD Blotters Paper
Hallucinogenic Honey For Sale
buy mad honey online, hallucinogenic honey for sale, mad honey for sale,=20
where to buy real mad honey
Buy Ehrlich spot test kit
100ML 4-ACO-DMT Microdosing Kit
100ML 1P-LSD Microdosing Kit
Buy Wockhardt Online
DMT for sale
Buy DeadHead Chemist DMT Vape Cartridge
best DMT (Vape and Cartridge) 1mL, best DMT Vape and Cartridge, best DMT=20
Vape and Cartridge in USA, buy DMT Cartridge, buy DMT Cartridge in USA, buy=
=20
DMT Vape, Buy DMT Vape Cartridges Online, Buy DMT Vape Pen Carts for sale,=
=20
deadhead chemist DMT Pen, DeadHead Chemist DMT Vape Cartridge, DMT, dmt=20
cartridge for sale, DMT carts for sale, DMT Vape, dmt vape pen, DMT=20
vaporizer pen, Rocky Mountain Vape Cartridge, Spirit Molecule

Buy Deadhead Chemist DMT (Vape and Cartridge) 1mL

One Up =E2=80=93 Psilocybin Mushroom Chocolate Bar 3.5g
1 up psilocybin bar, Buy Microdosing Mushrooms Online USA, Buy Online=20
Mushrooms chocolate Bars, Chocolate Mushrooms for Sale, High Quality=20
Chocolate Shrooms., Mushrooms Chocolate, one up chocolate bar, one up=20
chocolate shrooms, one up magic mushroom chocolate, one up mushroom bar,=20
one up psilocybin mushroom chocolate bar, Psilocybin Chocolate Bar,=20
Psychedelic mushroom chocolate bars, psychedelic mushroom chocolate bars=20
one up, RAW Chocolate, Shroom Chocolate

https://t.me/kylekushman2021

https://t.me/kylekushman2021 https://t.me/kylekushman2021

https://t.me/kylekushman2021

https://t.me/kylekushman2021

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9c62f9a2-796d-473b-841c-deb54519164dn%40googlegroups.com.

------=_Part_19861_428740931.1713313015420
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Contact us to buy premium psychedelics products like dmt vape pen and carts=
, lsd tabs, ayahuasca, changa, mescaline, psilocybin mushrooms edibles and =
concentrate and lots of other potent psychedelics products at affordable pr=
ices with tracking. Shipping worldwide with top notch stealth packaging on =
all orders.<div><br /><a href=3D"https://t.me/kylekushman2021" rel=3D"nofol=
low" target=3D"_blank" style=3D"color: rgb(26, 115, 232);">https://t.me/kyl=
ekushman2021</a><br /><a href=3D"https://t.me/kylekushman2021" rel=3D"nofol=
low" target=3D"_blank" style=3D"color: rgb(26, 115, 232);">https://t.me/kyl=
ekushman2021</a><br /><a href=3D"https://t.me/kylekushman2021" rel=3D"nofol=
low" target=3D"_blank" style=3D"color: rgb(26, 115, 232);">https://t.me/kyl=
ekushman2021</a></div><div><a href=3D"https://t.me/kylekushman2021" rel=3D"=
nofollow" target=3D"_blank" style=3D"color: rgb(26, 115, 232);">https://t.m=
e/kylekushman2021</a></div><div><br />Buy Premium Chronic Carts Full Gram<b=
r />ROCKY MOUNTAIN ROSIN VAPE CARTS 1ML<br />Buy Exotic Marijuana Strains O=
nline, Buy Marijuana wax, Shatter and Concentrate, Buy weed online<br />Ros=
in Vape Pen Kit (Rocky Mountain Rosin)<br />4oz (600mg) THC Lean Cannabis S=
yrup =E2=80=93 BAKED BROS=E2=84=A2<br />Buy 150x DS-3.0 LSD crystal 125=C2=
=B5g<br />Buy 5-MeO-DMT Cartridge 1mL<br />Medicated Airhead Xtremes Bites =
Edibles =E2=80=93 500mg<br />Psilo =E2=80=93 Psilocybin Mushroom Gummy Cube=
s 3.5g<br />Chocolate Chuckles =E2=80=93 Psilocybin Mushroom Chocolate Bar =
3.5g<br />Buy pink runtz online<br />Buy White Runtz Online<br />Buy White =
Cherry Gelato by Backpack Boyz<br />Buy Sharklato Strain online<br />Buy Gr=
untz (Gushers X Runtz) powered by Runtz<br />Buy Pinkman Goo strain<br />Ap=
etamin Syrup 200 ml=C2=A0</div><div><br /></div><div><a href=3D"https://t.m=
e/kylekushman2021" rel=3D"nofollow" target=3D"_blank" style=3D"color: rgb(2=
6, 115, 232);">https://t.me/kylekushman2021</a><a href=3D"https://t.me/kyle=
kushman2021" rel=3D"nofollow" target=3D"_blank" style=3D"color: rgb(26, 115=
, 232);">https://t.me/kylekushman2021</a><br /></div><div><br /></div><div>=
<a href=3D"https://t.me/kylekushman2021" rel=3D"nofollow" target=3D"_blank"=
 style=3D"color: rgb(26, 115, 232);">https://t.me/kylekushman2021</a><br />=
</div><div><br />Golden Teacher Spore Syringe Microscopy Kit<br />Magic Mus=
hroom Spore Syringe =E2=80=93 Albino A+ psilocybe cubensis<br />10x-100x 20=
5ug IMPORTED Triangular LSD Tabs Needlepoint 99% PURE Crystal<br />20X =E2=
=80=93 100x Mickey Mouse LSD tabs 260 micro grams (260ug) PURE Aztec Crytal=
<br />Golden Teacher Magic Mushrooms<br />Penis Envy Magic Mushrooms<br />B=
uy Dried B+ Psilocybe Cubensis strain<br />Premium magic mushroom capsules<=
br />Buy 2C-B Powder Buy 2C-B Pills<br />Buy 4-AcO-DMT<br />Buy GHB Capsule=
s Online<br />Buy Dank Vapes carts Online<br />Buy Ayahuasca Tea Kit =E2=80=
=93 10 Minute Preparation<br />Buy Ayahuasca Tea<br />CBD WAX DAB CONCENTRA=
TES<br />Buy MDMA Crystal (Recrystallized, Purified, Powdered)<br />28G Dut=
ch Champagne MDMA Crystal (Free Shipping)<br />Buy MDMA Crystal 84% LAB TES=
TED<br />1P-LSD (125mcg) Blotter For Sale<br />Ibogaine Capsules For Sale<b=
r />Buy AL-LAD Blotters Paper<br />Hallucinogenic Honey For Sale<br />buy m=
ad honey online, hallucinogenic honey for sale, mad honey for sale, where t=
o buy real mad honey<br />Buy Ehrlich spot test kit<br />100ML 4-ACO-DMT Mi=
crodosing Kit<br />100ML 1P-LSD Microdosing Kit<br />Buy Wockhardt Online<b=
r />DMT for sale<br />Buy DeadHead Chemist DMT Vape Cartridge<br />best DMT=
 (Vape and Cartridge) 1mL, best DMT Vape and Cartridge, best DMT Vape and C=
artridge in USA, buy DMT Cartridge, buy DMT Cartridge in USA, buy DMT Vape,=
 Buy DMT Vape Cartridges Online, Buy DMT Vape Pen Carts for sale, deadhead =
chemist DMT Pen, DeadHead Chemist DMT Vape Cartridge, DMT, dmt cartridge fo=
r sale, DMT carts for sale, DMT Vape, dmt vape pen, DMT vaporizer pen, Rock=
y Mountain Vape Cartridge, Spirit Molecule<br /><br />Buy Deadhead Chemist =
DMT (Vape and Cartridge) 1mL<br /><br />One Up =E2=80=93 Psilocybin Mushroo=
m Chocolate Bar 3.5g<br />1 up psilocybin bar, Buy Microdosing Mushrooms On=
line USA, Buy Online Mushrooms chocolate Bars, Chocolate Mushrooms for Sale=
, High Quality Chocolate Shrooms., Mushrooms Chocolate, one up chocolate ba=
r, one up chocolate shrooms, one up magic mushroom chocolate, one up mushro=
om bar, one up psilocybin mushroom chocolate bar, Psilocybin Chocolate Bar,=
 Psychedelic mushroom chocolate bars, psychedelic mushroom chocolate bars o=
ne up, RAW Chocolate, Shroom Chocolate<br /><br /><a href=3D"https://t.me/k=
ylekushman2021" rel=3D"nofollow" target=3D"_blank" style=3D"color: rgb(26, =
115, 232);">https://t.me/kylekushman2021</a><br /><br /><a href=3D"https://=
t.me/kylekushman2021" rel=3D"nofollow" target=3D"_blank" style=3D"color: rg=
b(26, 115, 232);">https://t.me/kylekushman2021</a>=C2=A0<a href=3D"https://=
t.me/kylekushman2021" rel=3D"nofollow" target=3D"_blank" style=3D"color: rg=
b(26, 115, 232);">https://t.me/kylekushman2021</a><br /><br /><a href=3D"ht=
tps://t.me/kylekushman2021" rel=3D"nofollow" target=3D"_blank" style=3D"col=
or: rgb(26, 115, 232);">https://t.me/kylekushman2021</a><br /><br /><a href=
=3D"https://t.me/kylekushman2021" rel=3D"nofollow" target=3D"_blank" style=
=3D"color: rgb(26, 115, 232);">https://t.me/kylekushman2021</a></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/9c62f9a2-796d-473b-841c-deb54519164dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/9c62f9a2-796d-473b-841c-deb54519164dn%40googlegroups.co=
m</a>.<br />

------=_Part_19861_428740931.1713313015420--

------=_Part_19860_1960896619.1713313015420--
