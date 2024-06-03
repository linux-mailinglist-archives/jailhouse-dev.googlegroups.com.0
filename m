Return-Path: <jailhouse-dev+bncBCCMRLPB2UFRBLXM62ZAMGQESDTD4AY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8788D8230
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Jun 2024 14:25:20 +0200 (CEST)
Received: by mail-yb1-xb39.google.com with SMTP id 3f1490d57ef6-df79945652esf7006998276.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jun 2024 05:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717417519; x=1718022319; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qg6Z7nW50Krd9ibhFLw9PXF3iX9JimVx1m1ayB1FKqg=;
        b=Bi1HyFnvKqNV9cKOnqq5VjCelGgn234IcLGBuX5bknZKa9SVcoeOkepQA7Zt4fhVMn
         xQlRlKi05yWB5MkI2CFXbJc4meDRsapYKu/oBVEVo7Fy8BYcCeU3G7DhEjsUXbzkRd1i
         12OVS6t0hxc2AGzDURyCGUjZm+81rfaQdqXVAFV0yvz3hRUZBeMdZqOO2w/aH1tkzI5E
         kJvTacd39BaD7oreso6WVrVa18/Xw2eSaFTarjDaHbfILcKMtII7/4KlDzujkXD9r2CJ
         /sNIvm0wFD2nY6gOaxN5218y0oZlw2Hf2rLMVhZoKv/4zhV9sFlcfJ1/WsZoURGe6Agd
         gL1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717417519; x=1718022319; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qg6Z7nW50Krd9ibhFLw9PXF3iX9JimVx1m1ayB1FKqg=;
        b=Jr/If2VrywDd9u84OJQJrHZ+cROR9a8d1dnt+rjBcLSAZ9g39Iij7XIDqbZtf9jvD7
         I6sHpF3lvcL0w0vFZf5dGJIL28MIhMloS/jfRkKtTwcM9T6xR1Tkq4DOXShHZd9RzB9H
         d8R59LSGBW89i15dKEdDJYhGu+nJ/CVGwaV0BiIUu55FGChW3gKQ1uV89XkVochXU+sZ
         3UvgRvGoYyKvBKcDDAoueu8ftgwNMVNj9zxCXynJv2aM5chQ75vJcSWu0gpNCZ3Q1xHc
         4e/7QxBdYxa2cd/BpsY3EdqrJwd7JElb7dJHcv399m+dVc6+MiKY61JHMb6e7ojbDlTo
         vYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717417519; x=1718022319;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qg6Z7nW50Krd9ibhFLw9PXF3iX9JimVx1m1ayB1FKqg=;
        b=kNrE7PgpHehZ19uHx+LjSlSdZwEXBuCMA0y1eTBDRhWFaKL5sKdLlzIj2xMaL/ej6u
         tH28qKlC0eHRDDn7MgIDq7kqzCFsUVdYdmeB3aYSiMA73ALLp7YVgFjNYXh20DxsVI2t
         4SNWeTw0ZqElKCOuS796EWMtnUnV6dcyMtdcwm9S4g6b56fh6rC4s/k47D2dSjzmN0O3
         x+wMBfOvhlSFvmc70wrx6s1YHpxVJQv6y2kMPu+wLULzEyjFw463NXiuuNaQ3mGVoaWE
         SPSa1RAYuQ4gBXPEpnpbouyJhCw++wpkZ3djkPGCZ3FJmo3Q961YpGjbiMGyoyNw8BaA
         kuRw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUnfSSzCbFrxPWkP+V3B6s+F40W+SQa4zmheVEybXC2TuFUNsxA/1y0Y3paGufP/NA+zY9wQcFAlqh6ulavbNqj8j+7m+KiI7xntbs=
X-Gm-Message-State: AOJu0Yx/NNyIt3lMyhC9kmJa4hiKscuhET+o9xDBJJdETEmG+QOxMEr9
	CLXF1RZOMXuZMxwE6dv8u1VYVQ7c4+PxiwhTh1XmhSs1J+BOG1VO
X-Google-Smtp-Source: AGHT+IFw5/zd6ADwPjUT2CdDMa6fOYEVVtKOIOH8nOv1PYOpa+RtgZkFNthekqhh8OKFFej9PkG8YQ==
X-Received: by 2002:a25:b01:0:b0:df4:f2d2:fcd6 with SMTP id 3f1490d57ef6-dfa73dbb699mr8179497276.44.1717417518959;
        Mon, 03 Jun 2024 05:25:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7416:0:b0:df7:8a9f:8453 with SMTP id 3f1490d57ef6-dfab15f4288ls1184276.1.-pod-prod-04-us;
 Mon, 03 Jun 2024 05:25:17 -0700 (PDT)
X-Received: by 2002:a05:690c:c10:b0:61b:ec80:3137 with SMTP id 00721157ae682-62c7985e36fmr22500727b3.9.1717417516773;
        Mon, 03 Jun 2024 05:25:16 -0700 (PDT)
Date: Mon, 3 Jun 2024 05:25:15 -0700 (PDT)
From: Clarksville Pop <popclarksville@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1410b57e-b5b9-44fd-a127-ec2eccfafa0dn@googlegroups.com>
Subject: BUY PSILOCYBIN MUSHROOMS CHOCOLATE BARS ONLINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_572913_189718501.1717417515990"
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

------=_Part_572913_189718501.1717417515990
Content-Type: multipart/alternative; 
	boundary="----=_Part_572914_710270698.1717417515990"

------=_Part_572914_710270698.1717417515990
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
jailhouse-dev/1410b57e-b5b9-44fd-a127-ec2eccfafa0dn%40googlegroups.com.

------=_Part_572914_710270698.1717417515990
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
om/d/msgid/jailhouse-dev/1410b57e-b5b9-44fd-a127-ec2eccfafa0dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1410b57e-b5b9-44fd-a127-ec2eccfafa0dn%40googlegroups.co=
m</a>.<br />

------=_Part_572914_710270698.1717417515990--

------=_Part_572913_189718501.1717417515990--
