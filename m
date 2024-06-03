Return-Path: <jailhouse-dev+bncBCCMRLPB2UFRBFXC62ZAMGQEGDPPC5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb37.google.com (mail-yb1-xb37.google.com [IPv6:2607:f8b0:4864:20::b37])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A188D81D5
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Jun 2024 14:03:37 +0200 (CEST)
Received: by mail-yb1-xb37.google.com with SMTP id 3f1490d57ef6-dfa74682897sf4411395276.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jun 2024 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717416216; x=1718021016; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LS0hzYgdo9ZTTLtTwsl5hzQEVNLz9yjRli6W7kekuGA=;
        b=SvgX7ULyP9XOwqEf5VJgUlZV2PnmH6CoxKVKM/XXiofTuxz22Jinrc3c5Vvtv4wIDD
         DNbozGNO4VinAKVSEqPHzT5bKgdjQhL5laFulrpUj4sADw090PAQQ9Li0vWW1nuAGqSR
         BBEXcjwpZSMs+HlJAg+kWL4cR7x4ShmpegUXh2BB2/VHSHuszuyXZ4nrXf2UNsElwt1i
         01QbOO14mjzG848D9IN03FmLsN30nk8U7jEjrvi2fXIWqaZ4ehRcjGbAEVur4kGnrQpu
         kWTvgVt/FMwlDJ39xLSZuQBNW7BHRhA8VMmjtIxCxTrOe2ZuXGdvbO0+V9mRn6jVltEj
         /BOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717416216; x=1718021016; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LS0hzYgdo9ZTTLtTwsl5hzQEVNLz9yjRli6W7kekuGA=;
        b=jZR3XyxPoeTtInWYEiZ+/MZyKIjHumEfXXjft/j+Zr2qw2vq1GOA+BMqv6afjwcf8I
         WCCu8d6WwerhFJxlPGhFGGXW3EazWLqB5vPRlkXN1b7gz9+8QcrKvqxfVKNPWCH8I41g
         Iqu+jKCnCA9wGRKkWAyENoa64LlrDVu6jzpyExhPc3z9XdqmelZMP3XHbr482AlK+a6u
         TseXMkMLb/7oJlFl4IPC4sgzvEKRO2HqKfAO8oDQImmb9sAAThN9xt3tTMWb9ZA8UlCl
         tg9lqOGtbCvjzLTjK09nYdau6jQ1PIaf5jEPpOICVxpJkSFOsJPD8LLpPrf4aRoma2Zm
         Xo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717416216; x=1718021016;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LS0hzYgdo9ZTTLtTwsl5hzQEVNLz9yjRli6W7kekuGA=;
        b=FuvOHivOJAwWCyFA+MPwpQVaXULW623L4s6SC+A7eae1p3IP0T+mIzsXfHAm+neacl
         odUkyKfb9p6gsekeaU0+6LsWXZL5G1YrvBi4vgeGaOMBnaIBD3SfVGUyyPGGnjjdgQuZ
         /jcX4O9sFc0S1NBBX6fTlUtn2VT63MFMg892VXeUIxa6JUw1IQyYN4lE9rrxHGwhtUoZ
         2IOFpOONIalUiNneOoY482pOVsqu1te3m4JxNoJwdVg/uGf2nlN+5XpfaoDpgZv1wKXv
         6gR2frOh9ZFxUnfFiqlqwWL2sAE2ddgtEuapuiokK9RXimZ8UMRbRWPdd9UGtriaR+ww
         e5xg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVWHemxn/E3kAiPx3PPxWqU/fmr4u34XAjnYrg5W6l0tHOnetW6bMj6SPKZFwTh+7fE9p3gga4kgu35+T9Tl4aSxh03Adym7cMYG08=
X-Gm-Message-State: AOJu0Yxtf01rNeyTjLclpkDH9II902CTDFXrAieW/Vwk4p/gZKAyPLar
	ka5dyyBy2qs/CD737b6UQq7Y0z2l48AOlI4AdCwQTba6eKGF2LQz
X-Google-Smtp-Source: AGHT+IHFrEdWaqiYtDU5fJC4X0ugklugTyaQyEXnFAun5XwLWOr2RHpF25AvziiN1j4SZw3lm7nDgQ==
X-Received: by 2002:a25:8083:0:b0:df7:9295:ffc5 with SMTP id 3f1490d57ef6-dfa73be5231mr7936102276.5.1717416214820;
        Mon, 03 Jun 2024 05:03:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5b:d11:0:b0:df7:8e77:7d6b with SMTP id 3f1490d57ef6-dfa595af18dls615026276.0.-pod-prod-03-us;
 Mon, 03 Jun 2024 05:03:33 -0700 (PDT)
X-Received: by 2002:a05:690c:dd3:b0:62c:67f4:4c4 with SMTP id 00721157ae682-62c798123d4mr28304497b3.7.1717416212708;
        Mon, 03 Jun 2024 05:03:32 -0700 (PDT)
Date: Mon, 3 Jun 2024 05:03:31 -0700 (PDT)
From: Clarksville Pop <popclarksville@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f4fb0b7c-dfe1-4238-9804-8042307e2764n@googlegroups.com>
Subject: BUY MUSHROOM CHOCOLATE BARS ONLINE - BEST PSILOCYBIN MUSHROOMS
 CHOCOLATE BARS ONLINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_160060_1235469242.1717416211779"
X-Original-Sender: popclarksville@gmail.com
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

------=_Part_160060_1235469242.1717416211779
Content-Type: multipart/alternative; 
	boundary="----=_Part_160061_815478398.1717416211779"

------=_Part_160061_815478398.1717416211779
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy Wonder Psilocybin Gummies =E2=80=93 Everything you need to know
/product/buy-mushroom-gummies-psilocybin
>https://t.me/Mushies_12
>https://t.me/Mushies_12
>https://t.me/Mushies_12
Wonder Magic Mushroom Infused Gummies are for you if you dislike the taste=
=20
of consuming dried magic mushrooms.
>https://t.me/Mushies_12
>https://t.me/Mushies_12
>https://t.me/Mushies_12
>https://t.me/Mushies_12
These flavorful psilocybin-infused gummies come in a variety of flavors=20
while still providing a potent kick. A great choice for those who are new=
=20
to Magic Mushrooms or experienced with psychedelics as each piece contains=
=20
300mg of magic mushrooms.
>https://t.me/Mushies_12
>https://t.me/Mushies_12
>https://t.me/Mushies_12
Contents =E2=80=93 Whats inside
/product/buy-joe-rogan-mushroom-gummies-psilocybin/
Magic Mushroom Content
Each pack contains 10 pieces (300mg/piece) for a total 3,000mg of mushrooms=
.

Magic Mushroom Strain
Psilocybe Cubensis.
>https://t.me/Mushies_12
>https://t.me/Mushies_12
>https://t.me/Mushies_12
Flavour
Cranberry

Dosage Instructions
For a Museum Dose, consume 2 gummies very 90 minutes until desire effects=
=20
are achieved. For a Psychedelic Trip Dose, consume 6 gummies and add 3=20
gummies every 90 minutes until desired effects are achieved.
>https://t.me/Mushies_12
>https://t.me/Mushies_12
>https://t.me/Mushies_12
Benefits of consuming gummies rather than traditional magic mushrooms
/product/buy-joe-rogan-mushroom-gummies-psilocybin
Much easier to digest, no more =E2=80=98gut rot=E2=80=99
No more muscle aches and cramps
Tastes much better than eating raw mushrooms
Fast acting =E2=80=93 hits you within 30-45 minutes
>https://t.me/Mushies_12
>https://t.me/Mushies_12
>https://t.me/Mushies_12
Much nicer comedown, no sick feeling, no hangover
Only lasts half as long as regular shrooms =E2=80=93 making it much easier =
to=20
control the length of your high
Ingredients
Sucrose, Water, Gelatin, Glucose Syrup, Citric Acid, Natural Flavours, Mct=
=20
Oil, Pectin, Carnauba Wax, Psilocybin Mushrooms.

>https://t.me/Mushies_12
>https://t.me/Mushies_12
>https://t.me/Mushies_12
>https://t.me/Mushies_12

True Psychedelic Experience Just cause it doesn=E2=80=99t taste like mushro=
oms=20
doesn=E2=80=99t mean it=E2=80=99s not mushrooms. You wo tvn=E2=80=99t find =
any drop in the quality=20
of your trip, in fact, you may even decide to switch to=20
edibles!>https://t.me/Mushies_12
>https://t.me/Mushies_12
>https://t.me/Mushies_12
>https://t.me/Mushies_12
> :Sneaky-Sure, Magic Mushrooms are legal in Canada but that doesn=E2=80=99=
t=20
necessarily mean you want to be seen stuffing your face with them For those=
=20
who want to keep it classy and discrete, nibbling on some chocolate is the=
=20
way to go. shroom chocolate bar =E2=80=A2
>https://t.me/Mushies_12
>https://t.me/Mushies_12
>https://t.me/Mushies_12
>https://t.me/Mushies_12=20
https://psilocybin/product-category/mushroom-products/
>https://t.me/Mushies_12
> Versatile Dosage =E2=80=93 The combined 3.5g of mushrooms in Good Trip Mu=
shroom=20
Chocolate Bars can be broken up for a versatile dosage. Each square of this=
=20
chocolate bar contains approximately .6g of Magic Mushrooms, while each bar=
=20
contains 3.5g. Whether it=E2=80=99s a micro-dose or a full-on journey, this=
=20
chocolate bar has got you covered. shroom chocolate bar
> https://t.me/Mushies_12/products
>https://t.me/Mushies_12/products https://t.me/Mushies_12/products
>https://t.me/Mushies_12/products
> Here=E2=80=99s a great idea, on the house! Go on a cookout with some frie=
nds,=20
enjoy some smoky BBQ and wash it down with some Magic Mushroom Chocolate=20
for dessert. You=E2=80=99ll be thanking us when the whole gang starts peaki=
ng! Get=20
yours now! shroom chocolate bar join our exclusive telegram channel. Good=
=20
Trip Shrooms Chocolate Bars For Sale
>
> PSILOCYBIN/
https://t.me/https://t.me/mushies_12
https://t.me/https://t.me/mushies_12
https://t.me/https://t.me/mushies_12
/product-category/mushroom-products/
>
>
> Good Trip Shrooms Chocolate Bars For Sale
> Buy psilo-gummy online, chocolate mushrooms for sale, Chocolates, edible,=
=20
Good Trip Mushroom Chocolate Bars, Gummy mushroom shaped candy, Mushroom=20
chocolate bar UK, mushroom chocolate bars California, mushroom chocolat

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f4fb0b7c-dfe1-4238-9804-8042307e2764n%40googlegroups.com.

------=_Part_160061_815478398.1717416211779
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy Wonder Psilocybin Gummies =E2=80=93 Everything you need to know<div>/pr=
oduct/buy-mushroom-gummies-psilocybin</div><div>&gt;https://t.me/Mushies_12=
</div><div>&gt;https://t.me/Mushies_12</div><div>&gt;https://t.me/Mushies_1=
2</div><div>Wonder Magic Mushroom Infused Gummies are for you if you dislik=
e the taste of consuming dried magic mushrooms.</div><div>&gt;https://t.me/=
Mushies_12</div><div>&gt;https://t.me/Mushies_12</div><div>&gt;https://t.me=
/Mushies_12</div><div>&gt;https://t.me/Mushies_12</div><div>These flavorful=
 psilocybin-infused gummies come in a variety of flavors while still provid=
ing a potent kick. A great choice for those who are new to Magic Mushrooms =
or experienced with psychedelics as each piece contains 300mg of magic mush=
rooms.</div><div>&gt;https://t.me/Mushies_12</div><div>&gt;https://t.me/Mus=
hies_12</div><div>&gt;https://t.me/Mushies_12</div><div>Contents =E2=80=93 =
Whats inside</div><div>/product/buy-joe-rogan-mushroom-gummies-psilocybin/<=
/div><div>Magic Mushroom Content</div><div>Each pack contains 10 pieces (30=
0mg/piece) for a total 3,000mg of mushrooms.</div><div><br /></div><div>Mag=
ic Mushroom Strain</div><div>Psilocybe Cubensis.</div><div>&gt;https://t.me=
/Mushies_12</div><div>&gt;https://t.me/Mushies_12</div><div>&gt;https://t.m=
e/Mushies_12</div><div>Flavour</div><div>Cranberry</div><div><br /></div><d=
iv>Dosage Instructions</div><div>For a Museum Dose, consume 2 gummies very =
90 minutes until desire effects are achieved. For a Psychedelic Trip Dose, =
consume 6 gummies and add 3 gummies every 90 minutes until desired effects =
are achieved.</div><div>&gt;https://t.me/Mushies_12</div><div>&gt;https://t=
.me/Mushies_12</div><div>&gt;https://t.me/Mushies_12</div><div>Benefits of =
consuming gummies rather than traditional magic mushrooms</div><div>/produc=
t/buy-joe-rogan-mushroom-gummies-psilocybin</div><div>Much easier to digest=
, no more =E2=80=98gut rot=E2=80=99</div><div>No more muscle aches and cram=
ps</div><div>Tastes much better than eating raw mushrooms</div><div>Fast ac=
ting =E2=80=93 hits you within 30-45 minutes</div><div>&gt;https://t.me/Mus=
hies_12</div><div>&gt;https://t.me/Mushies_12</div><div>&gt;https://t.me/Mu=
shies_12</div><div>Much nicer comedown, no sick feeling, no hangover</div><=
div>Only lasts half as long as regular shrooms =E2=80=93 making it much eas=
ier to control the length of your high</div><div>Ingredients</div><div>Sucr=
ose, Water, Gelatin, Glucose Syrup, Citric Acid, Natural Flavours, Mct Oil,=
 Pectin, Carnauba Wax, Psilocybin Mushrooms.</div><div><br /></div><div>&gt=
;https://t.me/Mushies_12</div><div>&gt;https://t.me/Mushies_12</div><div>&g=
t;https://t.me/Mushies_12</div><div>&gt;https://t.me/Mushies_12</div><div><=
br /></div><div>True Psychedelic Experience Just cause it doesn=E2=80=99t t=
aste like mushrooms doesn=E2=80=99t mean it=E2=80=99s not mushrooms. You wo=
 tvn=E2=80=99t find any drop in the quality of your trip, in fact, you may =
even decide to switch to edibles!&gt;https://t.me/Mushies_12</div><div>&gt;=
https://t.me/Mushies_12</div><div>&gt;https://t.me/Mushies_12</div><div>&gt=
;https://t.me/Mushies_12</div><div>&gt; :Sneaky-Sure, Magic Mushrooms are l=
egal in Canada but that doesn=E2=80=99t necessarily mean you want to be see=
n stuffing your face with them For those who want to keep it classy and dis=
crete, nibbling on some chocolate is the way to go. shroom chocolate bar =
=E2=80=A2</div><div>&gt;https://t.me/Mushies_12</div><div>&gt;https://t.me/=
Mushies_12</div><div>&gt;https://t.me/Mushies_12</div><div>&gt;https://t.me=
/Mushies_12 https://psilocybin/product-category/mushroom-products/</div><di=
v>&gt;https://t.me/Mushies_12</div><div>&gt; Versatile Dosage =E2=80=93 The=
 combined 3.5g of mushrooms in Good Trip Mushroom Chocolate Bars can be bro=
ken up for a versatile dosage. Each square of this chocolate bar contains a=
pproximately .6g of Magic Mushrooms, while each bar contains 3.5g. Whether =
it=E2=80=99s a micro-dose or a full-on journey, this chocolate bar has got =
you covered. shroom chocolate bar</div><div>&gt; https://t.me/Mushies_12/pr=
oducts</div><div>&gt;https://t.me/Mushies_12/products https://t.me/Mushies_=
12/products</div><div>&gt;https://t.me/Mushies_12/products</div><div>&gt; H=
ere=E2=80=99s a great idea, on the house! Go on a cookout with some friends=
, enjoy some smoky BBQ and wash it down with some Magic Mushroom Chocolate =
for dessert. You=E2=80=99ll be thanking us when the whole gang starts peaki=
ng! Get yours now! shroom chocolate bar join our exclusive telegram channel=
. Good Trip Shrooms Chocolate Bars For Sale</div><div>&gt;</div><div>&gt; P=
SILOCYBIN/</div><div>https://t.me/https://t.me/mushies_12</div><div>https:/=
/t.me/https://t.me/mushies_12</div><div>https://t.me/https://t.me/mushies_1=
2</div><div>/product-category/mushroom-products/</div><div>&gt;</div><div>&=
gt;</div><div>&gt; Good Trip Shrooms Chocolate Bars For Sale</div><div>&gt;=
 Buy psilo-gummy online, chocolate mushrooms for sale, Chocolates, edible, =
Good Trip Mushroom Chocolate Bars, Gummy mushroom shaped candy, Mushroom ch=
ocolate bar UK, mushroom chocolate bars California, mushroom chocolat</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f4fb0b7c-dfe1-4238-9804-8042307e2764n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f4fb0b7c-dfe1-4238-9804-8042307e2764n%40googlegroups.co=
m</a>.<br />

------=_Part_160061_815478398.1717416211779--

------=_Part_160060_1235469242.1717416211779--
