Return-Path: <jailhouse-dev+bncBCCMRLPB2UFRB77M62ZAMGQEVJQ5OIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113e.google.com (mail-yw1-x113e.google.com [IPv6:2607:f8b0:4864:20::113e])
	by mail.lfdr.de (Postfix) with ESMTPS id C95C28D8235
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Jun 2024 14:26:41 +0200 (CEST)
Received: by mail-yw1-x113e.google.com with SMTP id 00721157ae682-62c823393a4sf33344227b3.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jun 2024 05:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717417601; x=1718022401; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiXa2sfsxG0mhGvTdY4OhQH78YoPb7Vw3WjKy+VmkUw=;
        b=iUcRdierBVXbXaMaWH8mnhM1WDgn8snEekzD1sfs9zlBDZANJhRixuLyRxWphQTgxZ
         gKf1Hm3us4HqYWBw7SvlN9rjWD82xy3gs/zbl6a3v9p+mxdnRT6qIpg3Yc4/ZAaM1Vlh
         fsODXso59+WjH0uaiap89ePbks4l6KU4QMTVjtjRfQhQBSmyuvldK6WJG1jW5Zo7sJC5
         N5/FP8+uKf89ukny6McUl57JYgzAIBcnDPPkujAHphgeRt40MLdWNHDSJud6mhGVDn/f
         10YYm6xCxKFmmFAU5U+2KsZDo5qGqWW2csBl4tLlRm/WLwke7/SPHK+wbDcwFtjbD7wC
         /E8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717417601; x=1718022401; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EiXa2sfsxG0mhGvTdY4OhQH78YoPb7Vw3WjKy+VmkUw=;
        b=YW3XL9xsY3fNCNrUYRbLgFSB9xjWVOcrVoUudDJ/DnUxzXGOTtOiDLtwfn05jsWhuU
         667nRhik/5FBucxqgFV38E+dCBovAxIq60kNwRQSa2AOjudvg+20r8lTXPpALcMm+ZUM
         CdQwcSgMfFDnS2HAHHzQl+C+OqfEssXduZPFLzlf6h0VJ08z+DuwY3lsjCXpf6yjh7eV
         yj4JBK/Ve75sLE1bvMp2m1PlZx5U09UGXFL13qasX/kOxjdO+0/jBKvL/1gM7WIzydWC
         ICg1A6KL0CuDAr5oeuZ9+GH5sqpoaeGogftwe60uhdP4TBTxTzLTuBpLG0PI5StnujuS
         XB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717417601; x=1718022401;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiXa2sfsxG0mhGvTdY4OhQH78YoPb7Vw3WjKy+VmkUw=;
        b=thoROAN8SuXgXnwfYfpqkWlIfpkZUWtc+6Si6pG5ZvbVOWALZYRIBma4vPZM9TOTVf
         6kGEw6Nnyy3xFk2hT75QPEK+AXf8yryofdZwQ9co2S08tQgHR2JNw2I/4lSbABy7EY7T
         Oq1G3uBjCs+VrhUW6rowND9sO89C+EkEcpjLPlN/Q/Dg7XvMf8Ii0Ay38TOHfpS4gdi1
         Yg+jol5GCG9d66z59rZoPwPi+EHlwVtUMYbE4wV7IaLlETtwXy2sZpFQ4+c2wM4ddf45
         lHqvOdbrVpSXUfAzh8QAMUGP2XYWmuKkMevp0wBMjbAQMGHmt9WkymoGJeQ88D+zvW6L
         tTmA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVnXhZFNcw1ooOMYQbJIkLVmVLWkJmRSJ8Ii0lcsz/5uipVwCW6lyGCJ+ELHEM8yJSD/r+Kk1f4tVi88FtSj9gQJCixNuVJLVWHuNM=
X-Gm-Message-State: AOJu0YwRILCgq+fooG1J56Q1IG2DjmvBNTdJPHnf2EeWAahKMankZvvh
	I515BLUVdIB0kNCsi6ROKWXFawe/0dVa9Au3hfXLiNn3AaX1k7AC
X-Google-Smtp-Source: AGHT+IG5UcJOJeKGoTWbJTYQ5ilqRcGJ9gzJouFzLhP2NBLS1+oeZmWvIxiF6epwpIwRFE74x5wpVw==
X-Received: by 2002:a25:9108:0:b0:dcb:e82c:f7f with SMTP id 3f1490d57ef6-dfa73bce77dmr8538614276.12.1717417600510;
        Mon, 03 Jun 2024 05:26:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:2fd3:0:b0:dfa:77ba:dc1f with SMTP id 3f1490d57ef6-dfa77bade59ls14162276.2.-pod-prod-06-us;
 Mon, 03 Jun 2024 05:26:39 -0700 (PDT)
X-Received: by 2002:a25:ab13:0:b0:df7:6584:5d6f with SMTP id 3f1490d57ef6-dfa73daa1femr2178641276.13.1717417597477;
        Mon, 03 Jun 2024 05:26:37 -0700 (PDT)
Date: Mon, 3 Jun 2024 05:26:36 -0700 (PDT)
From: Clarksville Pop <popclarksville@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <24d9b651-bfdf-4621-8dd9-5ebbd6f304e1n@googlegroups.com>
Subject: WHERE TO BUY 1P 300ug LSD BLOTTERS ONLINE UK
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_478813_1448803510.1717417596825"
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

------=_Part_478813_1448803510.1717417596825
Content-Type: multipart/alternative; 
	boundary="----=_Part_478814_1682829768.1717417596825"

------=_Part_478814_1682829768.1717417596825
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
jailhouse-dev/24d9b651-bfdf-4621-8dd9-5ebbd6f304e1n%40googlegroups.com.

------=_Part_478814_1682829768.1717417596825
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
om/d/msgid/jailhouse-dev/24d9b651-bfdf-4621-8dd9-5ebbd6f304e1n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/24d9b651-bfdf-4621-8dd9-5ebbd6f304e1n%40googlegroups.co=
m</a>.<br />

------=_Part_478814_1682829768.1717417596825--

------=_Part_478813_1448803510.1717417596825--
