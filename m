Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBAGY6CZAMGQEVKTZXMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBF58D7443
	for <lists+jailhouse-dev@lfdr.de>; Sun,  2 Jun 2024 10:23:30 +0200 (CEST)
Received: by mail-yb1-xb3b.google.com with SMTP id 3f1490d57ef6-dfa829361c3sf2480138276.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 02 Jun 2024 01:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717316609; x=1717921409; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=snO+5KsyIAu+W1eBwYN//7ZJtHUov05ILccBVAqHpAI=;
        b=rprvusJwlStFcixiiFWhOJlieQ+AUuJfwT5AFDRuJZjaJ2evcXZQ2VBJiwEIA2iHVi
         v5EzvPyx1SfQvfaeMll0GBYhtQEmUXCdb4zWB8OZjly7ysOqHo8Ooteg/J/e2lDazwLL
         VWEpZRGh5Q7c5CvFNR/VqvkCEDxnBsBVUvyzIFReVQfP+BmKfkB0oMY7q/zh4Qj2q/ea
         HdcjDUjAavLYdh/8bGI7M93tztQDmRKgysknjBAXGVlEK6BDbJQ+9CTL3lKfpTKvkTz8
         GhAP1WYVvfyX3alQfrsz17q/wtuYdJZ//XFf0kkaHoGLSecZFJ2XjpzU4mE3SToB6Ea2
         3BhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717316609; x=1717921409; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snO+5KsyIAu+W1eBwYN//7ZJtHUov05ILccBVAqHpAI=;
        b=OOC003EVM1n0spLKeHmhZiZpju0Y5bopibBI0JnXSICSDdNdrdYc1q10bM9VQ2vjiK
         3JMgygItv/QY9ZCGra+I3uTELe7/2LztOoNJo+dd7rzpkytFyvc/VQWG70paKKSmszP1
         RP/JasFIDBK58VSTdA3CmjfpZFVS9nfC+qByQgmNSbgC6vJtNcCE49XI/5TIOF19Fomx
         KejM1JBIZdI1iUzRJ9vTJvuiXmhnGPVEKKew8CJB2tjwpJgLbSclkLxhWaPUI9T9N0Ux
         lk75rRReVZx7iORPKaj2a6kNfVtDCPevAy1Qs5JMMweZMq3PR7lxrpcWhni40Dz0pJ5n
         j/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717316609; x=1717921409;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=snO+5KsyIAu+W1eBwYN//7ZJtHUov05ILccBVAqHpAI=;
        b=dLY+5O1pm3gZ4PwjtWe0wRoYCcb/6KNO0i3BH45Ci3ioQpYnJzwKrz22KnwlfoEMXl
         gAdPMj6LIgHSpSy6dz+k5HTiWZQgrDe4fw4c7SNoF59IhFcmE37wIP5RXIL746YEIeqH
         D1E0ja4PVeRI9AI0Gr854MIeEJxj0xJQyHbxhBE5anouQfT2PUwMQz1rMkbOfWI7AfdD
         /EDHyVXJ/UlkIyypJ1HA3iVJuM0wf/hoP/M8jpJg6ogg11EAs5XzdC0VKynbTLpfu08J
         ySP+/lzjq9N+5f50ZZqz9XR+qSXbRGv/gSoW/6slScU6Vy1EIqfRHvQ47dFjqAq7lhlT
         f17w==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVuPLJ9FxlRBdA6lJIC4Uvxd9sv73gQUhnI2EXTKh7XJUXg8B9ilF1BWBcpeZ2Q4XiRYbWdHegyMQfhpaZsHZ9x0HUaohTU5QDGJgc=
X-Gm-Message-State: AOJu0YwVLUVIhXq4tkpaOnzlxiP5j3+1VemZGPmBMRdzDoemLq6TSEWz
	5a8rwHmA2qx3F5PUdb6C4jApfmsUWbcvac/VWVCAvrDOpXx5q7r3
X-Google-Smtp-Source: AGHT+IEx3sWPVV6F4A3yAWO1vwjYdXkQNZdpFzGRpLMQYvi8lpaMsYpx0pP0et83b03uqkUPHyBLIg==
X-Received: by 2002:a25:820f:0:b0:df4:ab4d:2c6c with SMTP id 3f1490d57ef6-dfa73bd0c07mr5529916276.6.1717316608975;
        Sun, 02 Jun 2024 01:23:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:a447:0:b0:dfa:56ce:d390 with SMTP id 3f1490d57ef6-dfa595a7d96ls427245276.0.-pod-prod-08-us;
 Sun, 02 Jun 2024 01:23:27 -0700 (PDT)
X-Received: by 2002:a05:690c:c8a:b0:627:a7b0:3c9e with SMTP id 00721157ae682-62c81affc50mr13516877b3.2.1717316607230;
        Sun, 02 Jun 2024 01:23:27 -0700 (PDT)
Date: Sun, 2 Jun 2024 01:23:26 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <cb3b68b2-1d11-4956-842e-9d1ec707936an@googlegroups.com>
In-Reply-To: <ba978c38-a6be-4d27-ac21-31299ce61affn@googlegroups.com>
References: <ba978c38-a6be-4d27-ac21-31299ce61affn@googlegroups.com>
Subject: Re: BUY ONE UP MUSHROOM CHOCOLATE BARS ONLINE IN USA
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_222762_445891211.1717316606342"
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

------=_Part_222762_445891211.1717316606342
Content-Type: multipart/alternative; 
	boundary="----=_Part_222763_1159704936.1717316606342"

------=_Part_222763_1159704936.1717316606342
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/prime_house00

Great Taste =E2=80=93 A chocolate bar that makes you trip your face off. Ho=
w could=20
that not be the dream?

Clean High =E2=80=93 We formulated this chocolate bar to produce a clean hi=
gh that=20
won=E2=80=99t leave you crashing after the initial peak. shroom chocolate

True Psychedelic Experience -Just cause it doesn=E2=80=99t taste like mushr=
ooms=20
doesn=E2=80=99t mean it=E2=80=99s not mushrooms. You won=E2=80=99t find any=
 drop in the quality of=20
your trip, in fact, you may even decide to switch to edibles!

Sneaky =E2=80=93 Sure, Magic Mushrooms are not legal in USA but that doesn=
=E2=80=99t=20
necessarily mean you want to be seen stuffing your face with them. For=20
those who want to keep it classy and discrete, nibbling on some chocolate=
=20
is the way to go. shroom chocolate bar

Versatile Dosage =E2=80=93 The combined 3.5g of mushrooms in this chocolate=
 can be=20
broken up for versatile dosage. Each square of this chocolate bar contains=
=20
approximately .6g of Magic Mushrooms, while each bar contains 3.5g. Whether=
=20
it=E2=80=99s a micro-dose or a full-on journey, this chocolate bar has got =
you=20
covered. shroom chocolate bar=20

https://t.me/prime_house00
On Saturday, June 1, 2024 at 12:06:01=E2=80=AFPM UTC-6 Alix Rosine Pokam wr=
ote:

>
>
> Great Taste =E2=80=93 A chocolate bar that makes you trip your face off. =
How could=20
> that not be the dream?
>
> Clean High =E2=80=93 We formulated this chocolate bar to produce a clean =
high that=20
> won=E2=80=99t leave you crashing after the initial peak. shroom chocolate
>
> True Psychedelic Experience -Just cause it doesn=E2=80=99t taste like mus=
hrooms=20
> doesn=E2=80=99t mean it=E2=80=99s not mushrooms. You won=E2=80=99t find a=
ny drop in the quality of=20
> your trip, in fact, you may even decide to switch to edibles!
>
> Sneaky =E2=80=93 Sure, Magic Mushrooms are not legal in USA but that does=
n=E2=80=99t=20
> necessarily mean you want to be seen stuffing your face with them. For=20
> those who want to keep it classy and discrete, nibbling on some chocolate=
=20
> is the way to go. shroom chocolate bar
>
> Versatile Dosage =E2=80=93 The combined 3.5g of mushrooms in this chocola=
te can be=20
> broken up for versatile dosage. Each square of this chocolate bar contain=
s=20
> approximately .6g of Magic Mushrooms, while each bar contains 3.5g. Wheth=
er=20
> it=E2=80=99s a micro-dose or a full-on journey, this chocolate bar has go=
t you=20
> covered. shroom chocolate bar
>
>
> https://t.me/tripgum/product/good-trip-milk-chocolate-bars-for-sale/
>
>
> Buy Good Trip Mushroom Chocolate Bars Online
>
> Have you ever wished mushrooms tasted better? We=E2=80=99re here to grant=
 that=20
> wish by bringing you our Good Trip Mushroom Chocolate Bar. This bar is=20
> tasty, irresistible also, contains a total of 3.5g of Magic Mushrooms ( 6=
=20
> grams per chocolate square). And can be broken off into squares for=20
> flexible shroom dosage.
>
>
> https://t.me/tripgum/product/good-trip-milk-chocolate-bars-for-sale/
>
>
> IT has an awesome taste and smells good too chocolate. Good Trip Mushroom=
=20
> Chocolate Bars makes you trip your face off. So, how could that not be th=
e=20
> dream?. =E2=80=A2
>
>
> https://t.me/tripgum/product/good-trip-milk-chocolate-bars-for-sale/
>
>
> Clean High =E2=80=93 We formulated this chocolate bar to produce a clean =
high that=20
> won=E2=80=99t leave you crashing after the initial peak.
>
>
> https://t.me/tripgum/product/good-trip-milk-chocolate-bars-for-sale/
>
>
> True Psychedelic Experience Just cause it doesn=E2=80=99t taste like mush=
rooms=20
> doesn=E2=80=99t mean it=E2=80=99s not mushrooms. You won=E2=80=99t find a=
ny drop in the quality of=20
> your trip, in fact, you may even decide to switch to edibles!
>
> :Sneaky-Sure, Magic Mushrooms are legal in Canada but that doesn=E2=80=99=
t=20
> necessarily mean you want to be seen stuffing your face with them For tho=
se=20
> who want to keep it classy and discrete, nibbling on some chocolate is th=
e=20
> way to go. shroom chocolate bar =E2=80=A2
> https://t.me/tripgum
> https://t.me/tripgum
> https://t.me/tripgum
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/cb3b68b2-1d11-4956-842e-9d1ec707936an%40googlegroups.com.

------=_Part_222763_1159704936.1717316606342
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>https://t.me/prime_house00</div><div><br /></div>Great Taste =E2=80=93=
 A chocolate bar that makes you trip your face off. How could that not be t=
he dream?<br /><br />Clean
 High =E2=80=93 We formulated this chocolate bar to produce a clean high th=
at=20
won=E2=80=99t leave you crashing after the initial peak. shroom chocolate<b=
r /><br />True
 Psychedelic Experience -Just cause it doesn=E2=80=99t taste like mushrooms=
=20
doesn=E2=80=99t mean it=E2=80=99s not mushrooms. You won=E2=80=99t find any=
 drop in the quality=20
of your trip, in fact, you may even decide to switch to edibles!<br /><br /=
>Sneaky
 =E2=80=93 Sure, Magic Mushrooms are not legal in USA but that doesn=E2=80=
=99t=20
necessarily mean you want to be seen stuffing your face with them. For=20
those who want to keep it classy and discrete, nibbling on some=20
chocolate is the way to go. shroom chocolate bar<br /><br /><div>Versatile =
Dosage
 =E2=80=93 The combined 3.5g of mushrooms in this chocolate can be broken u=
p for
 versatile dosage. Each square of this chocolate bar contains=20
approximately .6g of Magic Mushrooms, while each bar contains 3.5g.=20
Whether it=E2=80=99s a micro-dose or a full-on journey, this chocolate bar =
has=20
got you covered. shroom chocolate bar <br /></div><div><br /></div><div>htt=
ps://t.me/prime_house00</div><div class=3D"gmail_quote"><div dir=3D"auto" c=
lass=3D"gmail_attr">On Saturday, June 1, 2024 at 12:06:01=E2=80=AFPM UTC-6 =
Alix Rosine Pokam wrote:<br/></div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding=
-left: 1ex;"><div><br></div><div><br></div><div>Great Taste =E2=80=93 A cho=
colate bar that makes you trip your face off. How could that not be the dre=
am?<br><br>Clean High =E2=80=93 We formulated this chocolate bar to produce=
 a clean high that won=E2=80=99t leave you crashing after the initial peak.=
 shroom chocolate<br><br>True Psychedelic Experience -Just cause it doesn=
=E2=80=99t taste like mushrooms doesn=E2=80=99t mean it=E2=80=99s not mushr=
ooms. You won=E2=80=99t find any drop in the quality of your trip, in fact,=
 you may even decide to switch to edibles!<br><br>Sneaky =E2=80=93 Sure, Ma=
gic Mushrooms are not legal in USA but that doesn=E2=80=99t necessarily mea=
n you want to be seen stuffing your face with them. For those who want to k=
eep it classy and discrete, nibbling on some chocolate is the way to go. sh=
room chocolate bar<br><br>Versatile Dosage =E2=80=93 The combined 3.5g of m=
ushrooms in this chocolate can be broken up for versatile dosage. Each squa=
re of this chocolate bar contains approximately .6g of Magic Mushrooms, whi=
le each bar contains 3.5g. Whether it=E2=80=99s a micro-dose or a full-on j=
ourney, this chocolate bar has got you covered. shroom chocolate bar<br><br=
><br><a href=3D"https://t.me/tripgum/product/good-trip-milk-chocolate-bars-=
for-sale/" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https=
://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/tripgum/product/good-tri=
p-milk-chocolate-bars-for-sale/&amp;source=3Dgmail&amp;ust=3D17174029340060=
00&amp;usg=3DAOvVaw3_CvpoTNC5H79LjYfssnaQ">https://t.me/tripgum/product/goo=
d-trip-milk-chocolate-bars-for-sale/</a><br><br><br>Buy Good Trip Mushroom =
Chocolate Bars Online<br><br>Have you ever wished mushrooms tasted better? =
We=E2=80=99re here to grant that wish by bringing you our Good Trip Mushroo=
m Chocolate Bar. This bar is tasty, irresistible also, contains a total of =
3.5g of Magic Mushrooms ( 6 grams per chocolate square). And can be broken =
off into squares for flexible shroom dosage.<br><br><br><a href=3D"https://=
t.me/tripgum/product/good-trip-milk-chocolate-bars-for-sale/" target=3D"_bl=
ank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Den&amp;q=3Dhttps://t.me/tripgum/product/good-trip-milk-chocolate-bars-fo=
r-sale/&amp;source=3Dgmail&amp;ust=3D1717402934007000&amp;usg=3DAOvVaw3aSCX=
Hghhjguu4CiL_9e1U">https://t.me/tripgum/product/good-trip-milk-chocolate-ba=
rs-for-sale/</a><br><br><br>IT has an awesome taste and smells good too cho=
colate. Good Trip Mushroom Chocolate Bars makes you trip your face off. So,=
 how could that not be the dream?. =E2=80=A2<br><br><br><a href=3D"https://=
t.me/tripgum/product/good-trip-milk-chocolate-bars-for-sale/" target=3D"_bl=
ank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Den&amp;q=3Dhttps://t.me/tripgum/product/good-trip-milk-chocolate-bars-fo=
r-sale/&amp;source=3Dgmail&amp;ust=3D1717402934007000&amp;usg=3DAOvVaw3aSCX=
Hghhjguu4CiL_9e1U">https://t.me/tripgum/product/good-trip-milk-chocolate-ba=
rs-for-sale/</a><br><br><br>Clean High =E2=80=93 We formulated this chocola=
te bar to produce a clean high that won=E2=80=99t leave you crashing after =
the initial peak.<br><br><br><a href=3D"https://t.me/tripgum/product/good-t=
rip-milk-chocolate-bars-for-sale/" target=3D"_blank" rel=3D"nofollow" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/=
tripgum/product/good-trip-milk-chocolate-bars-for-sale/&amp;source=3Dgmail&=
amp;ust=3D1717402934007000&amp;usg=3DAOvVaw3aSCXHghhjguu4CiL_9e1U">https://=
t.me/tripgum/product/good-trip-milk-chocolate-bars-for-sale/</a><br><br><br=
>True Psychedelic Experience Just cause it doesn=E2=80=99t taste like mushr=
ooms doesn=E2=80=99t mean it=E2=80=99s not mushrooms. You won=E2=80=99t fin=
d any drop in the quality of your trip, in fact, you may even decide to swi=
tch to edibles!<br><br>:Sneaky-Sure, Magic Mushrooms are legal in Canada bu=
t that doesn=E2=80=99t necessarily mean you want to be seen stuffing your f=
ace with them For those who want to keep it classy and discrete, nibbling o=
n some chocolate is the way to go. shroom chocolate bar =E2=80=A2<br><a hre=
f=3D"https://t.me/tripgum" target=3D"_blank" rel=3D"nofollow" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/tripgum&=
amp;source=3Dgmail&amp;ust=3D1717402934007000&amp;usg=3DAOvVaw0Mgo5rr0i2-nE=
a8dee_O-K">https://t.me/tripgum</a></div><div><a href=3D"https://t.me/tripg=
um" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Den&amp;q=3Dhttps://t.me/tripgum&amp;source=3Dgmail&amp;=
ust=3D1717402934007000&amp;usg=3DAOvVaw0Mgo5rr0i2-nEa8dee_O-K">https://t.me=
/tripgum</a></div><div><a href=3D"https://t.me/tripgum" target=3D"_blank" r=
el=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&=
amp;q=3Dhttps://t.me/tripgum&amp;source=3Dgmail&amp;ust=3D1717402934007000&=
amp;usg=3DAOvVaw0Mgo5rr0i2-nEa8dee_O-K">https://t.me/tripgum</a><br><br></d=
iv></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/cb3b68b2-1d11-4956-842e-9d1ec707936an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/cb3b68b2-1d11-4956-842e-9d1ec707936an%40googlegroups.co=
m</a>.<br />

------=_Part_222763_1159704936.1717316606342--

------=_Part_222762_445891211.1717316606342--
