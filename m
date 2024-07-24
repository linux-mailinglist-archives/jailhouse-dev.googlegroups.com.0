Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBVNMQW2QMGQEIIKXDMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6162893B792
	for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Jul 2024 21:30:31 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-e035f7b5976sf661885276.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Jul 2024 12:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1721849430; x=1722454230; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PhjuCzp3I71rQUigHIoPARIUlKCIOZTQQpjg+P0xpk4=;
        b=WaUbvckIsLJ0dyqknn5PYEmEUAOapGejLVyFYfC6i0yUaFiwfbF2j9Lqet2wl1yGCU
         fx2EB7rXoR51ttHWqdzMlR6D8Hx0UczofMrdFqh+NWrbaL/A6j9SrwHOOklRapEB6DKf
         9d9hZ1Bb++QHCrET/Ww5QtPEDDTvkMEgjJwux+f8g7nB8H2dbYuaL2ZU8Zof+ri6enn+
         3EzjeKsC4Z0osSJGQqBugqoitcfUxJwXNV2iTwlRQ1mKoG9hRAFyTPLFjUZn1SaV5LDW
         jtDNMFM6ZjqPXWMmvAF1l/6g4OtjDhLr+STD2LGsTSxypVBEp5rvSJieuBfK3e/a0G5Y
         7S9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721849430; x=1722454230; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhjuCzp3I71rQUigHIoPARIUlKCIOZTQQpjg+P0xpk4=;
        b=WZjgJ9iU8GAKRBbA9CUwCIfKv9VQBl3jrKCqAIElAEY5yuyfKeQjLtZqAR5dfDLSCa
         4yha1RCneJK9LDHCbllOfVl2ast4XMtMkHPefPPxxmHBHJH9LsmN9GF2Z0gMiUhrQPyu
         SilvdpzpaZFLsuI42kvQwOnPtMzE3YvweB4xcL5Nhux0g3W5uYpzc++kgzn9G/MelV89
         vX4qOVYOJurBy3LX8/21JeZuk2lvIQbKsXSLMquxNkp/DecRioAPf602NbL67T1ydtd5
         NNr0l4boKxMk7rmcX0QTj2+9XFsrVtKb+MzSkivINurvRd/7+uLwaulxkbgwgtkKP1he
         4jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721849430; x=1722454230;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PhjuCzp3I71rQUigHIoPARIUlKCIOZTQQpjg+P0xpk4=;
        b=XGPKYAtwON4WDm2hq6xbfyZ4OQJEaBVe3+yr581aImw8aHkniLB5dW4OBAzEjtD8Mh
         6Ago9Do8/RGMHu1G3FMHJsYb8Ks44oRsDEZJsr40144QV2+/VIWkGs5Y/kAslT8DAwKm
         lTxOTVslzFCLK63iQIhhSwSG1QLwag2zEQV+1U976gNU+Xo2NjT9x29R0kDY7Ksb4snN
         VrcsGJyTDDdpwVCaSzhyvRLG6QHH5eVl7sEOR4hXFoDIQwhmvAWG85wvqfXXx4cVQ3Pf
         kWWVBOjiIvV/zJo3k6o+3PAi2c992rXQEMjGq/+8sl+Yl1p/T1RINVQGamXxIwJEmT/u
         ReUA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWpUvH9uv1H+iNRXZLEBhb2e2dv8Njphqqg400W/pdo0bidqBRFA2hbY6rgUGbZeqQ8832/zZ/t2NqWH/kaDdJwV25lJABsF244+nA=
X-Gm-Message-State: AOJu0YzSgM2THlvFEflNtJyu4w9NXp6rN7TryNbyceKai/xbG3U+Pdmu
	AOtZ36k3926sPf/Kqw4sB9yb9oaWpsy+sRcJrMLyY5sUBvu9YWKc
X-Google-Smtp-Source: AGHT+IGnyf//gGaFEiHpREpdna4iWjQbdvPfXzOaym495MZ+1N4eXjWETiyrpvm81aqQJ/wQ+XhAdg==
X-Received: by 2002:a05:6902:1145:b0:e03:5d88:b470 with SMTP id 3f1490d57ef6-e0b223564eemr604716276.7.1721849430032;
        Wed, 24 Jul 2024 12:30:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1887:b0:e08:7506:2b74 with SMTP id
 3f1490d57ef6-e0b2212ddf3ls333798276.0.-pod-prod-04-us; Wed, 24 Jul 2024
 12:30:29 -0700 (PDT)
X-Received: by 2002:a05:690c:92:b0:62c:fb55:aeab with SMTP id 00721157ae682-6751521b027mr299487b3.8.1721849428639;
        Wed, 24 Jul 2024 12:30:28 -0700 (PDT)
Date: Wed, 24 Jul 2024 12:30:27 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d91db997-d470-4d8b-91fd-e99ec682d5fcn@googlegroups.com>
In-Reply-To: <c74e9a8d-3186-4d8a-8672-561b467a1ba8n@googlegroups.com>
References: <0a9db60d-e86b-4b33-b7d1-d609b9f786d6n@googlegroups.com>
 <e9bb3fdc-1bcf-4554-b34e-55f0e21c993en@googlegroups.com>
 <a7287bcc-f3a3-460c-bd92-cd118fef4e99n@googlegroups.com>
 <c4f9e9c3-c55d-48ac-b51a-f19e7a018c79n@googlegroups.com>
 <9a5eb3d1-06fa-4e78-9311-955f8d60e149n@googlegroups.com>
 <2f1d07e7-fa2d-4336-8433-1a41fd7d2dban@googlegroups.com>
 <2d5d2ca6-266b-4317-907d-de92f9f02da3n@googlegroups.com>
 <41047d94-f5d5-4297-a95c-9e5d5041d9e6n@googlegroups.com>
 <711eb2b4-64db-46f4-bb06-e56b1bf809d1n@googlegroups.com>
 <c74e9a8d-3186-4d8a-8672-561b467a1ba8n@googlegroups.com>
Subject: Re: Buy DMT mushrooms chocolate bars only
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_758_238894238.1721849427943"
X-Original-Sender: asahrandy54@gmail.com
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

------=_Part_758_238894238.1721849427943
Content-Type: multipart/alternative; 
	boundary="----=_Part_759_751321512.1721849427943"

------=_Part_759_751321512.1721849427943
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


https://t.me/motionking_caliweed_psychedelics

Psilocybin Mushroom Gummy Cubes 3.5g
Chocolate Chuckles =E2=80=93 Psilocybin Mushroom Chocolate Bar 3.5g
Buy pink runtz online
Buy White Runtz Online
Buy White Cherry Gelato by Backpack Boyz
Buy Sharklato Strain online
Buy Gruntz (Gushers X Runtz) powered by Runtz
Buy Pinkman Goo strain
Apetamin Syrup 200 ml
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
Buy MDMA Crystal (Recrystallized, Purified, Pow


https://t.me/motionking_caliweed_psychedelics

https://t.me/motionking_caliweed_psychedelics
On Wednesday, July 24, 2024 at 8:28:35=E2=80=AFPM UTC+1 Asah Randy wrote:

>
> https://t.me/motionking_caliweed_psychedelics
>
> Psilo =E2=80=93 Psilocybin Mushroom Gummy Cubes 3.5g
> Chocolate Chuckles =E2=80=93 Psilocybin Mushroom Chocolate Bar 3.5g
> Buy pink runtz online
> Buy White Runtz Online
> Buy White Cherry Gelato by Backpack Boyz
> Buy Sharklato Strain online
> Buy Gruntz (Gushers X Runtz) powered by Runtz
> Buy Pinkman Goo strain
> Apetamin Syrup 200 ml
> Golden Teacher Spore Syringe Microscopy Kit
> Magic Mushroom Spore Syringe =E2=80=93 Albino A+ psilocybe cubensis
> 10x-100x 205ug IMPORTED Triangular LSD Tabs Needlepoint 99% PURE Crystal
> 20X =E2=80=93 100x Mickey Mouse LSD tabs 260 micro grams (260ug) PURE Azt=
ec Crytal
> Golden Teacher Magic Mushrooms
> Penis Envy Magic Mushrooms
> Buy Dried B+ Psilocybe Cubensis strain
> Premium magic mushroom capsules
> Buy 2C-B Powder Buy 2C-B Pills
> Buy 4-AcO-DMT
> Buy GHB Capsules Online
> Buy Dank Vapes carts Online
> Buy Ayahuasca Tea Kit =E2=80=93 10 Minute Preparation
> Buy Ayahuasca Tea
> CBD WAX DAB CONCENTRATES
> Buy MDMA Crystal (Recrystallized, Purified, Powdered)
> 28G=20
>
> https://t.me/motionking_caliweed_psychedelics
>
> https://t.me/motionking_caliweed_psychedelics
>
> On Wednesday, July 24, 2024 at 8:27:00=E2=80=AFPM UTC+1 Asah Randy wrote:
>
>> https://t.me/motionking_caliweed_psychedelics
>>
>> psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=
=20
>> effects, you get from eating the Mushroom and polka dot company chocolat=
e,=20
>> they are also a great way to microdose magic mushrooms. Microdosing magi=
c=20
>> mushrooms in the form of consuming mushroom chocolate bars have recently=
=20
>> increased in popularity.  https://t.me/motionking_caliweed_psychedelics
>>
>> https://t.me/motionking_caliweed_psychedelics
>>
>> On Tuesday, July 23, 2024 at 2:18:45=E2=80=AFAM UTC+1 Franknoel Njubuin =
wrote:
>>
>>> Contact us to buy premium psychedelics products like dmt vape pen and=
=20
>>> carts, lsd tabs, ayahuasca, changa, mescaline, psilocybin mushrooms edi=
bles=20
>>> and concentrate and lots of other potent psychedelics products at=20
>>> affordable prices with tracking. Shipping worldwide with top notch stea=
lth=20
>>> packaging on all orders.
>>> https://t.me/psychedelichome2021
>>> https://t.me/psychedelichome2021
>>> https://t.me/psychedelichome2021
>>> https://t.me/psychedelichome2021
>>>
>>> Buy Premium Chronic Carts Full Gram
>>> ROCKY MOUNTAIN ROSIN VAPE CARTS 1ML
>>> Buy Exotic Marijuana Strains Online, Buy Marijuana wax, Shatter and=20
>>> Concentrate, Buy weed online
>>> Rosin Vape Pen Kit (Rocky Mountain Rosin)
>>> 4oz (600mg) THC Lean Cannabis Syrup =E2=80=93 BAKED BROS=E2=84=A2
>>> Buy 150x DS-3.0 LSD crystal 125=C2=B5g
>>> Buy 5-MeO-DMT Cartridge 1mL
>>> Medicated Airhead Xtremes Bites Edibles =E2=80=93=20
>>> https://t.me/psychedelichome2021
>>> https://t.me/psychedelichome2021
>>> https://t.me/psychedelichome2021
>>> https://t.me/psychedelichome2021
>>>
>>> 500mg
>>> Psilo =E2=80=93 Psilocybin Mushroom Gummy Cubes 3.5g
>>> Chocolate Chuckles =E2=80=93 Psilocybin Mushroom Chocolate Bar 3.5g
>>> Buy pink runtz online
>>> Buy White Runtz Online
>>> Buy White Cherry Gelato by Backpack Boyz
>>> Buy Sharklato Strain online
>>> Buy Gruntz (Gushers X Runtz) powered by Runtz
>>> Buy Pinkman Goo strain
>>> Apetamin Syrup 200 ml
>>> Golden Teacher Spore Syringe Microscopy Kit
>>> Magic Mushroom Spore Syringe =E2=80=93 Albino A+ psilocybe cubensis
>>> 10x-100x 205ug IMPORTED Triangular LSD Tabs Needlepoint 99% PURE Crysta=
l
>>> 20X =E2=80=93 100x Mickey Mouse LSD tabs 260 micro grams (260ug) PURE A=
ztec=20
>>> Crytal
>>> Golden Teacher Magic Mushrooms
>>> Penis Envy Magic Mushrooms
>>> Buy Dried B+ Psilocybe Cubensis strain
>>> Premium magic mushroom capsules
>>> Buy 2C-B Powder Buy 2C-B Pills
>>> Buy 4-AcO-DMT
>>> Buy GHB Capsules Online
>>> Buy Dank Vapes carts Online
>>> Buy Ayahuasca Tea Kit =E2=80=93 10 Minute Preparation
>>> Buy Ayahuasca Tea
>>> CBD WAX DAB CONCENTRATES
>>> Buy MDMA Crystal (Recrystallized, Purified, Powdered)
>>> 28G Dutch Champagne MDMA Crystal (Free Shipping)
>>>
>>> https://t.me/psychedelichome2021
>>> https://t.me/psychedelichome2021
>>> https://t.me/psychedelichome2021
>>> https://t.me/psychedelichome2021
>>>
>>> Buy MDMA Crystal 84% LAB TESTED
>>> 1P-LSD (125mcg) Blotter For Sale
>>> Ibogaine Capsules For Sale
>>> Buy AL-LAD Blotters Paper
>>> Hallucinogenic Honey For Sale
>>> buy mad honey online, hallucinogenic honey for sale, mad honey for sale=
,=20
>>> where to buy real mad honey
>>> Buy Ehrlich spot test kit
>>> 100ML 4-ACO-DMT Microdosing Kit
>>> 100ML 1P-LSD Microdosing Kit
>>> Buy Wockhardt Online
>>> DMT for sale
>>> Buy DeadHead Chemist DMT Vape Cartridge
>>> best DMT (Vape and Cartridge) 1mL, best DMT Vape and Cartridge, best DM=
T=20
>>> Vape and Cartridge in USA, buy DMT Cartridge, buy DMT Cartridge in USA,=
 buy=20
>>> DMT Vape, Buy DMT Vape Cartridges Online, Buy DMT Vape Pen Carts for sa=
le,=20
>>> deadhead chemist DMT Pen, DeadHead Chemist DMT Vape Cartridge, DMT, dmt=
=20
>>> cartridge for sale, DMT carts for sale, DMT Vape, dmt vape pen, DMT=20
>>> vaporizer pen, Rocky Mountain Vape Cartridge, Spirit Molecule
>>>
>>> Buy Deadhead Chemist DMT (Vape and Cartridge) 1mL
>>>
>>> One Up =E2=80=93 Psilocybin Mushroom Chocolate Bar 3.5g
>>> 1 up psilocybin bar, Buy Microdosing Mushrooms Online USA, Buy Online=
=20
>>> Mushrooms chocolate Bars, Chocolate Mushrooms for Sale, High Quality=20
>>> Chocolate Shrooms., Mushrooms Chocolate, one up chocolate bar, one up=
=20
>>> chocolate shrooms, one up magic mushroom chocolate, one up mushroom bar=
,=20
>>> one up psilocybin mushroom chocolate bar, Psilocybin Chocolate Bar,=20
>>> Psychedelic mushroom chocolate bars, psychedelic mushroom chocolate bar=
s=20
>>> one up, RAW Chocolate, Shroom Chocolate
>>>
>>> https://t.me/psychedelichome2021
>>> https://t.me/psychedelichome2021
>>> https://t.me/psychedelichome2021
>>> https://t.me/psychedelichome2021
>>>
>>> On Wednesday, July 10, 2024 at 4:32:03=E2=80=AFAM UTC+1 Asah Randy wrot=
e:
>>>
>>>>
>>>> https://t.me/motionking_caliweed_psychedelics
>>>>
>>>> psilocybin-containing mushrooms. Aside from the fantastic, mind-blowin=
g=20
>>>> effects, you get from eating the Mushroom and polka dot company chocol=
ate,=20
>>>> they are also a great way to microdose magic mushrooms. Microdosing ma=
gic=20
>>>> mushrooms in the form of consuming mushroom chocolate bars have recent=
ly=20
>>>> increased in popularity.  https://t.me/motionking_caliweed_psychedelic=
s
>>>>
>>>> https://t.me/motionking_caliweed_psychedelics
>>>>
>>>>
>>>> https://t.me/motionking_caliweed_psychedelics
>>>> On Wednesday, July 10, 2024 at 4:30:20=E2=80=AFAM UTC+1 Asah Randy wro=
te:
>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> https://t.me/motionking_caliweed_psychedelics
>>>>>
>>>>> psilocybin-containing mushrooms. Aside from the fantastic,=20
>>>>> mind-blowing effects, you get from eating the Mushroom and polka dot=
=20
>>>>> company chocolate, they are also a great way to microdose magic mushr=
ooms.=20
>>>>> Microdosing magic mushrooms in the form of consuming mushroom chocola=
te=20
>>>>> bars have recently increased in popularity. =20
>>>>> https://t.me/motionking_caliweed_psychedelics
>>>>>
>>>>> https://t.me/motionking_caliweed_psychedelics
>>>>>
>>>>>
>>>>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d91db997-d470-4d8b-91fd-e99ec682d5fcn%40googlegroups.com.

------=_Part_759_751321512.1721849427943
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br /></div><div>https://t.me/motionking_caliweed_psychedelics<br /></=
div><div><br /></div>Psilocybin Mushroom Gummy Cubes 3.5g<br />Chocolate Ch=
uckles =E2=80=93 Psilocybin Mushroom Chocolate Bar 3.5g<br />Buy pink runtz=
 online<br />Buy White Runtz Online<br />Buy White Cherry Gelato by Backpac=
k Boyz<br />Buy Sharklato Strain online<br />Buy Gruntz (Gushers X Runtz) p=
owered by Runtz<br />Buy Pinkman Goo strain<br />Apetamin Syrup 200 ml<br /=
>Golden Teacher Spore Syringe Microscopy Kit<br />Magic Mushroom Spore Syri=
nge =E2=80=93 Albino A+ psilocybe cubensis<br />10x-100x 205ug IMPORTED Tri=
angular LSD Tabs Needlepoint 99% PURE Crystal<br />20X =E2=80=93 100x Micke=
y Mouse LSD tabs 260 micro grams (260ug) PURE Aztec Crytal<br />Golden Teac=
her Magic Mushrooms<br />Penis Envy Magic Mushrooms<br />Buy Dried B+ Psilo=
cybe Cubensis strain<br />Premium magic mushroom capsules<br />Buy 2C-B Pow=
der Buy 2C-B Pills<br />Buy 4-AcO-DMT<br />Buy GHB Capsules Online<br />Buy=
 Dank Vapes carts Online<br />Buy Ayahuasca Tea Kit =E2=80=93 10 Minute Pre=
paration<br />Buy Ayahuasca Tea<br />CBD WAX DAB CONCENTRATES<br />Buy MDMA=
 Crystal (Recrystallized, Purified, Pow<div><br /></div><div><br />https://=
t.me/motionking_caliweed_psychedelics<br /></div><div><br /></div><div>http=
s://t.me/motionking_caliweed_psychedelics<br /></div><div class=3D"gmail_qu=
ote"><div dir=3D"auto" class=3D"gmail_attr">On Wednesday, July 24, 2024 at =
8:28:35=E2=80=AFPM UTC+1 Asah Randy wrote:<br/></div><blockquote class=3D"g=
mail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 2=
04, 204); padding-left: 1ex;"><div><br></div><div><a href=3D"https://t.me/m=
otionking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" data-sa=
feredirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/mo=
tionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D172193571738700=
0&amp;usg=3DAOvVaw1fwQaP8kiTjZSdFr63O5OM">https://t.me/motionking_caliweed_=
psychedelics</a><br></div><br>Psilo =E2=80=93 Psilocybin Mushroom Gummy Cub=
es 3.5g<br>Chocolate Chuckles =E2=80=93 Psilocybin Mushroom Chocolate Bar 3=
.5g<br>Buy pink runtz online<br>Buy White Runtz Online<br>Buy White Cherry =
Gelato by Backpack Boyz<br>Buy Sharklato Strain online<br>Buy Gruntz (Gushe=
rs X Runtz) powered by Runtz<br>Buy Pinkman Goo strain<br>Apetamin Syrup 20=
0 ml<br>Golden Teacher Spore Syringe Microscopy Kit<br>Magic Mushroom Spore=
 Syringe =E2=80=93 Albino A+ psilocybe cubensis<br>10x-100x 205ug IMPORTED =
Triangular LSD Tabs Needlepoint 99% PURE Crystal<br>20X =E2=80=93 100x Mick=
ey Mouse LSD tabs 260 micro grams (260ug) PURE Aztec Crytal<br>Golden Teach=
er Magic Mushrooms<br>Penis Envy Magic Mushrooms<br>Buy Dried B+ Psilocybe =
Cubensis strain<br>Premium magic mushroom capsules<br>Buy 2C-B Powder Buy 2=
C-B Pills<br>Buy 4-AcO-DMT<br>Buy GHB Capsules Online<br>Buy Dank Vapes car=
ts Online<br>Buy Ayahuasca Tea Kit =E2=80=93 10 Minute Preparation<br>Buy A=
yahuasca Tea<br>CBD WAX DAB CONCENTRATES<br>Buy MDMA Crystal (Recrystallize=
d, Purified, Powdered)<br>28G=C2=A0<div><br></div><div><a href=3D"https://t=
.me/motionking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" da=
ta-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.=
me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1721935717=
387000&amp;usg=3DAOvVaw1fwQaP8kiTjZSdFr63O5OM">https://t.me/motionking_cali=
weed_psychedelics</a></div><div><br></div><div><a href=3D"https://t.me/moti=
onking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" data-safer=
edirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motio=
nking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1721935717387000&a=
mp;usg=3DAOvVaw1fwQaP8kiTjZSdFr63O5OM">https://t.me/motionking_caliweed_psy=
chedelics</a><br><br></div><div class=3D"gmail_quote"><div dir=3D"auto" cla=
ss=3D"gmail_attr">On Wednesday, July 24, 2024 at 8:27:00=E2=80=AFPM UTC+1 A=
sah Randy wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>=
<a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" =
style=3D"color:rgb(26,115,232)" target=3D"_blank" data-saferedirecturl=3D"h=
ttps://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_=
psychedelics&amp;source=3Dgmail&amp;ust=3D1721935717387000&amp;usg=3DAOvVaw=
1fwQaP8kiTjZSdFr63O5OM">https://t.me/motionking_caliweed_psychedelics</a><b=
r></div><div><br></div><div>psilocybin-containing mushrooms. Aside from the=
 fantastic, mind-blowing effects, you get from eating the Mushroom and polk=
a dot company chocolate, they are also a great way to microdose magic mushr=
ooms. Microdosing magic mushrooms in the form of consuming mushroom chocola=
te bars have recently increased in popularity.=C2=A0=C2=A0<a href=3D"https:=
//t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" style=3D"color:rg=
b(26,115,232)" target=3D"_blank" data-saferedirecturl=3D"https://www.google=
.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;=
source=3Dgmail&amp;ust=3D1721935717387000&amp;usg=3DAOvVaw1fwQaP8kiTjZSdFr6=
3O5OM">https://t.me/motionking_caliweed_psychedelics</a><br></div><div><br>=
</div><div><a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D=
"nofollow" style=3D"color:rgb(26,115,232)" target=3D"_blank" data-saferedir=
ecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionkin=
g_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1721935717387000&amp;u=
sg=3DAOvVaw1fwQaP8kiTjZSdFr63O5OM">https://t.me/motionking_caliweed_psyched=
elics</a></div><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gm=
ail_attr">On Tuesday, July 23, 2024 at 2:18:45=E2=80=AFAM UTC+1 Franknoel N=
jubuin wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Contact =
us to buy premium psychedelics products like dmt vape pen and carts, lsd ta=
bs, ayahuasca, changa, mescaline, psilocybin mushrooms edibles and concentr=
ate and lots of other potent psychedelics products at affordable prices wit=
h tracking. Shipping worldwide with top notch stealth packaging on all orde=
rs.<br>
<a href=3D"https://t.me/psychedelichome2021" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelichome2021&amp;source=3Dgmail&amp;ust=3D1721935717387000=
&amp;usg=3DAOvVaw17gdit-T0ER_YI0XfHQeOi">https://t.me/psychedelichome2021</=
a><br>
<a href=3D"https://t.me/psychedelichome2021" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelichome2021&amp;source=3Dgmail&amp;ust=3D1721935717387000=
&amp;usg=3DAOvVaw17gdit-T0ER_YI0XfHQeOi">https://t.me/psychedelichome2021</=
a><br>
<a href=3D"https://t.me/psychedelichome2021" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelichome2021&amp;source=3Dgmail&amp;ust=3D1721935717387000=
&amp;usg=3DAOvVaw17gdit-T0ER_YI0XfHQeOi">https://t.me/psychedelichome2021</=
a><br>
<a href=3D"https://t.me/psychedelichome2021" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelichome2021&amp;source=3Dgmail&amp;ust=3D1721935717387000=
&amp;usg=3DAOvVaw17gdit-T0ER_YI0XfHQeOi">https://t.me/psychedelichome2021</=
a><br>
<br>
Buy Premium Chronic Carts Full Gram<br>
ROCKY MOUNTAIN ROSIN VAPE CARTS 1ML<br>
Buy Exotic Marijuana Strains Online, Buy Marijuana wax, Shatter and Concent=
rate, Buy weed online<br>
Rosin Vape Pen Kit (Rocky Mountain Rosin)<br>
4oz (600mg) THC Lean Cannabis Syrup =E2=80=93 BAKED BROS=E2=84=A2<br>
Buy 150x DS-3.0 LSD crystal 125=C2=B5g<br>
Buy 5-MeO-DMT Cartridge 1mL<br>
Medicated Airhead Xtremes Bites Edibles =E2=80=93 <br>
<a href=3D"https://t.me/psychedelichome2021" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelichome2021&amp;source=3Dgmail&amp;ust=3D1721935717387000=
&amp;usg=3DAOvVaw17gdit-T0ER_YI0XfHQeOi">https://t.me/psychedelichome2021</=
a><br>
<a href=3D"https://t.me/psychedelichome2021" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelichome2021&amp;source=3Dgmail&amp;ust=3D1721935717387000=
&amp;usg=3DAOvVaw17gdit-T0ER_YI0XfHQeOi">https://t.me/psychedelichome2021</=
a><br>
<a href=3D"https://t.me/psychedelichome2021" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelichome2021&amp;source=3Dgmail&amp;ust=3D1721935717387000=
&amp;usg=3DAOvVaw17gdit-T0ER_YI0XfHQeOi">https://t.me/psychedelichome2021</=
a><br>
<a href=3D"https://t.me/psychedelichome2021" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelichome2021&amp;source=3Dgmail&amp;ust=3D1721935717387000=
&amp;usg=3DAOvVaw17gdit-T0ER_YI0XfHQeOi">https://t.me/psychedelichome2021</=
a><br>
<br>
500mg<br>
Psilo =E2=80=93 Psilocybin Mushroom Gummy Cubes 3.5g<br>
Chocolate Chuckles =E2=80=93 Psilocybin Mushroom Chocolate Bar 3.5g<br>
Buy pink runtz online<br>
Buy White Runtz Online<br>
Buy White Cherry Gelato by Backpack Boyz<br>
Buy Sharklato Strain online<br>
Buy Gruntz (Gushers X Runtz) powered by Runtz<br>
Buy Pinkman Goo strain<br>
Apetamin Syrup 200 ml<br>
Golden Teacher Spore Syringe Microscopy Kit<br>
Magic Mushroom Spore Syringe =E2=80=93 Albino A+ psilocybe cubensis<br>
10x-100x 205ug IMPORTED Triangular LSD Tabs Needlepoint 99% PURE Crystal<br=
>
20X =E2=80=93 100x Mickey Mouse LSD tabs 260 micro grams (260ug) PURE Aztec=
 Crytal<br>
Golden Teacher Magic Mushrooms<br>
Penis Envy Magic Mushrooms<br>
Buy Dried B+ Psilocybe Cubensis strain<br>
Premium magic mushroom capsules<br>
Buy 2C-B Powder Buy 2C-B Pills<br>
Buy 4-AcO-DMT<br>
Buy GHB Capsules Online<br>
Buy Dank Vapes carts Online<br>
Buy Ayahuasca Tea Kit =E2=80=93 10 Minute Preparation<br>
Buy Ayahuasca Tea<br>
CBD WAX DAB CONCENTRATES<br>
Buy MDMA Crystal (Recrystallized, Purified, Powdered)<br>
28G Dutch Champagne MDMA Crystal (Free Shipping)<br>
<br>
<a href=3D"https://t.me/psychedelichome2021" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelichome2021&amp;source=3Dgmail&amp;ust=3D1721935717387000=
&amp;usg=3DAOvVaw17gdit-T0ER_YI0XfHQeOi">https://t.me/psychedelichome2021</=
a><br>
<a href=3D"https://t.me/psychedelichome2021" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelichome2021&amp;source=3Dgmail&amp;ust=3D1721935717387000=
&amp;usg=3DAOvVaw17gdit-T0ER_YI0XfHQeOi">https://t.me/psychedelichome2021</=
a><br>
<a href=3D"https://t.me/psychedelichome2021" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelichome2021&amp;source=3Dgmail&amp;ust=3D1721935717387000=
&amp;usg=3DAOvVaw17gdit-T0ER_YI0XfHQeOi">https://t.me/psychedelichome2021</=
a><br>
<a href=3D"https://t.me/psychedelichome2021" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelichome2021&amp;source=3Dgmail&amp;ust=3D1721935717387000=
&amp;usg=3DAOvVaw17gdit-T0ER_YI0XfHQeOi">https://t.me/psychedelichome2021</=
a><br>
<br>
Buy MDMA Crystal 84% LAB TESTED<br>
1P-LSD (125mcg) Blotter For Sale<br>
Ibogaine Capsules For Sale<br>
Buy AL-LAD Blotters Paper<br>
Hallucinogenic Honey For Sale<br>
buy mad honey online, hallucinogenic honey for sale, mad honey for sale, wh=
ere to buy real mad honey<br>
Buy Ehrlich spot test kit<br>
100ML 4-ACO-DMT Microdosing Kit<br>
100ML 1P-LSD Microdosing Kit<br>
Buy Wockhardt Online<br>
DMT for sale<br>
Buy DeadHead Chemist DMT Vape Cartridge<br>
best DMT (Vape and Cartridge) 1mL, best DMT Vape and Cartridge, best DMT Va=
pe and Cartridge in USA, buy DMT Cartridge, buy DMT Cartridge in USA, buy D=
MT Vape, Buy DMT Vape Cartridges Online, Buy DMT Vape Pen Carts for sale, d=
eadhead chemist DMT Pen, DeadHead Chemist DMT Vape Cartridge, DMT, dmt cart=
ridge for sale, DMT carts for sale, DMT Vape, dmt vape pen, DMT vaporizer p=
en, Rocky Mountain Vape Cartridge, Spirit Molecule<br>
<br>
Buy Deadhead Chemist DMT (Vape and Cartridge) 1mL<br>
<br>
One Up =E2=80=93 Psilocybin Mushroom Chocolate Bar 3.5g<br>
1 up psilocybin bar, Buy Microdosing Mushrooms Online USA, Buy Online Mushr=
ooms chocolate Bars, Chocolate Mushrooms for Sale, High Quality Chocolate S=
hrooms., Mushrooms Chocolate, one up chocolate bar, one up chocolate shroom=
s, one up magic mushroom chocolate, one up mushroom bar, one up psilocybin =
mushroom chocolate bar, Psilocybin Chocolate Bar, Psychedelic mushroom choc=
olate bars, psychedelic mushroom chocolate bars one up, RAW Chocolate, Shro=
om Chocolate<br>
<br>
<a href=3D"https://t.me/psychedelichome2021" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelichome2021&amp;source=3Dgmail&amp;ust=3D1721935717387000=
&amp;usg=3DAOvVaw17gdit-T0ER_YI0XfHQeOi">https://t.me/psychedelichome2021</=
a><br>
<a href=3D"https://t.me/psychedelichome2021" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelichome2021&amp;source=3Dgmail&amp;ust=3D1721935717387000=
&amp;usg=3DAOvVaw17gdit-T0ER_YI0XfHQeOi">https://t.me/psychedelichome2021</=
a><br>
<a href=3D"https://t.me/psychedelichome2021" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelichome2021&amp;source=3Dgmail&amp;ust=3D1721935717387000=
&amp;usg=3DAOvVaw17gdit-T0ER_YI0XfHQeOi">https://t.me/psychedelichome2021</=
a><br>
<a href=3D"https://t.me/psychedelichome2021" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelichome2021&amp;source=3Dgmail&amp;ust=3D1721935717387000=
&amp;usg=3DAOvVaw17gdit-T0ER_YI0XfHQeOi">https://t.me/psychedelichome2021</=
a><br><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr"=
>On Wednesday, July 10, 2024 at 4:32:03=E2=80=AFAM UTC+1 Asah Randy wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br></div><div><a=
 href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" st=
yle=3D"color:rgb(26,115,232)" target=3D"_blank" data-saferedirecturl=3D"htt=
ps://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_ps=
ychedelics&amp;source=3Dgmail&amp;ust=3D1721935717387000&amp;usg=3DAOvVaw1f=
wQaP8kiTjZSdFr63O5OM">https://t.me/motionking_caliweed_psychedelics</a><br>=
</div><div><br></div><div><div style=3D"color:rgb(80,0,80)">psilocybin-cont=
aining mushrooms. Aside from the fantastic, mind-blowing effects, you get f=
rom eating the Mushroom and polka dot company chocolate, they are also a gr=
eat way to microdose magic mushrooms. Microdosing magic mushrooms in the fo=
rm of consuming mushroom chocolate bars have recently increased in populari=
ty.=C2=A0=C2=A0<a href=3D"https://t.me/motionking_caliweed_psychedelics" re=
l=3D"nofollow" style=3D"color:rgb(26,115,232)" target=3D"_blank" data-safer=
edirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motio=
nking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1721935717387000&a=
mp;usg=3DAOvVaw1fwQaP8kiTjZSdFr63O5OM">https://t.me/motionking_caliweed_psy=
chedelics</a><br></div><div style=3D"color:rgb(80,0,80)"><br></div><div sty=
le=3D"color:rgb(80,0,80)"><a href=3D"https://t.me/motionking_caliweed_psych=
edelics" rel=3D"nofollow" style=3D"color:rgb(26,115,232)" target=3D"_blank"=
 data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps:/=
/t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1721935=
717387000&amp;usg=3DAOvVaw1fwQaP8kiTjZSdFr63O5OM">https://t.me/motionking_c=
aliweed_psychedelics</a></div><br></div><br><a href=3D"https://t.me/motionk=
ing_caliweed_psychedelics" rel=3D"nofollow" style=3D"color:rgb(26,115,232)"=
 target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
en&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail=
&amp;ust=3D1721935717387000&amp;usg=3DAOvVaw1fwQaP8kiTjZSdFr63O5OM">https:/=
/t.me/motionking_caliweed_psychedelics</a><br><div class=3D"gmail_quote"><d=
iv dir=3D"auto" class=3D"gmail_attr">On Wednesday, July 10, 2024 at 4:30:20=
=E2=80=AFAM UTC+1 Asah Randy wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div><br></div><div><br></div><div><div style=3D"color:rgb(95=
,99,104);display:flex;min-height:48px"><div style=3D"overflow:hidden;text-o=
verflow:ellipsis;white-space:nowrap"><span style=3D"font-family:Roboto,Aria=
l,sans-serif;letter-spacing:0.25px;line-height:20px;color:rgb(32,33,36);mar=
gin-top:0px;margin-bottom:0px;margin-right:16px"><br><br></span></div><span=
 style=3D"min-height:1px;margin:0px;overflow:hidden;padding:0px;white-space=
:nowrap;width:1px"></span><div style=3D"font-family:Roboto,Arial,sans-serif=
;font-size:12px;letter-spacing:0.3px;line-height:16px;display:flex"><br></d=
iv></div></div><div role=3D"region" aria-labelledby=3D"c2560" style=3D"marg=
in:12px 0px;overflow:auto;padding-right:20px"><div style=3D"color:rgb(80,0,=
80)"><div><a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"=
nofollow" style=3D"color:rgb(26,115,232)" target=3D"_blank" data-saferedire=
cturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking=
_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1721935717387000&amp;us=
g=3DAOvVaw1fwQaP8kiTjZSdFr63O5OM">https://t.me/motionking_caliweed_psychede=
lics</a></div><div><br></div><div><div>psilocybin-containing mushrooms. Asi=
de from the fantastic, mind-blowing effects, you get from eating the Mushro=
om and polka dot company chocolate, they are also a great way to microdose =
magic mushrooms. Microdosing magic mushrooms in the form of consuming mushr=
oom chocolate bars have recently increased in popularity.=C2=A0=C2=A0<a hre=
f=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" style=
=3D"color:rgb(26,115,232)" target=3D"_blank" data-saferedirecturl=3D"https:=
//www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psych=
edelics&amp;source=3Dgmail&amp;ust=3D1721935717387000&amp;usg=3DAOvVaw1fwQa=
P8kiTjZSdFr63O5OM">https://t.me/motionking_caliweed_psychedelics</a><br></d=
iv><div><br></div><div><a href=3D"https://t.me/motionking_caliweed_psychede=
lics" rel=3D"nofollow" style=3D"color:rgb(26,115,232)" target=3D"_blank" da=
ta-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.=
me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1721935717=
387000&amp;usg=3DAOvVaw1fwQaP8kiTjZSdFr63O5OM">https://t.me/motionking_cali=
weed_psychedelics</a></div><div><br></div></div></div></div><br></blockquot=
e></div></blockquote></div></blockquote></div></blockquote></div></blockquo=
te></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d91db997-d470-4d8b-91fd-e99ec682d5fcn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d91db997-d470-4d8b-91fd-e99ec682d5fcn%40googlegroups.co=
m</a>.<br />

------=_Part_759_751321512.1721849427943--

------=_Part_758_238894238.1721849427943--
