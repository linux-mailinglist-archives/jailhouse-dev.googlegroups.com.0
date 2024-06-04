Return-Path: <jailhouse-dev+bncBDHL5ROYQ4LRBDPA7OZAMGQE6T4H36Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 362048FB02D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jun 2024 12:44:31 +0200 (CEST)
Received: by mail-yb1-xb3a.google.com with SMTP id 3f1490d57ef6-dfa486f381asf1170107276.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Jun 2024 03:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717497870; x=1718102670; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2VoKVM3ES/2RBw7OPKtHOwn4p//DHCuCMEM4x8cUAw=;
        b=CWZcaRZWKXI/bYzigKhMjxMIOucFb2QiunGdl0i7w/6fbXVIQvVdu+q+kpW6PgeNMq
         bw85xO2F6uyW9ElemfqdCNYSr//o9tPQgCMprYdA0oAZaIYf/W9NDELyloq6cQalxNzv
         M8PCl0qps+PhPtt0I7nWBBP4EUuz2dhvEhcCGl1JLDCBSqELXfvxLO8sbXob5SV9fDn+
         Jd42rLNYRFBYa/sw9NXQboWK1Jk452DgZhOjN2A28+2lXyZ5TuQrdby3V5E5AFkrONte
         bGLpu50RtRnIxoZDWGKHnmcXlCHbns2ilKLTtx40Mt7opnQRH0X359r1v48eZf74DDd8
         EHIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717497870; x=1718102670; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2VoKVM3ES/2RBw7OPKtHOwn4p//DHCuCMEM4x8cUAw=;
        b=W5XSTXZpmNEaqAaorS0VdMr3Cz50FfrP0OW7liZ/+fnyka7457teNBtXlqdvC9L6SG
         21xMPuSVzse01DusoA79bxGV+QnG33DI+6fO1cN26xKHe5tJCmEDzidhkevLq44qAMfy
         2TJuyRfmgsV4IduXpz9FvqvANHjqvKVlbuiithawi3kRMnI6HedWRA0UNG6SYPCRQcOJ
         BNsGsTCzLwkoh7mIhV0p5Kb9GswDzcTXhIW11AK1q8UspCOOq7U0pejNB9aKIx6/FrZy
         NivvGUOaNWU1UhSpOFmauaCZcthGji6JZpld265R/4+4ZJN2BHCNxN4hqG2h+eOGvrmv
         nCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717497870; x=1718102670;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2VoKVM3ES/2RBw7OPKtHOwn4p//DHCuCMEM4x8cUAw=;
        b=C+GuN82HrtEUhwbwMGio9mJgCuYVTsNrkSjdmm4Yt8rBFLA8BQyztuCd7GfijgA8bg
         Vj+doMhJASWMMRH6CecqOGuMtrKmfZe0S9gNS6F9FzPwppik5j57HtOOM0qjBCaNxmhb
         GxrWe0WqgzMpeRlu3JvTJs30FKHh03cT5hgZs010BxigxkkrgD16itLe2DxlB4/2ieCr
         YlGaNjLnORt7PpSdiL+QNStrtxXTsTbyP3iNIBxtT6ft67Efxp31kF+Yfm8Ok/oRXn41
         BTg2a6HNQ/JyE9kyYCs9gFbjOq0LIxVmXSy65bVSqf9SkZBZuYJuI7eToqACNVMh8lZX
         65kg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXVGv7UKJx8xwWkfjNEX4KCo1hC24qkto6/TLcLnyTdY9xExoksrLZX5H3N88hQ4u4iVhda4pem++j3cE9Dbw4rfMsMHUc3BuOi9Gw=
X-Gm-Message-State: AOJu0YwE3Y5VLug9kEdv6xUKVZyCI5RlK4A+joUDY7ecJzjxejLtZhfC
	K7rmQOBSXZApwpNP10/djMnykvBBDK/ERqWoGKfvFvgLoomnrfvF
X-Google-Smtp-Source: AGHT+IEfAIBth8JysDZZWeRbBn0SpKXyITqyx3ZV8eksxikS5pWRIGC9STbO6Bghv8X8bRu3yDPX8w==
X-Received: by 2002:a05:6902:118d:b0:dfa:705c:6e46 with SMTP id 3f1490d57ef6-dfa73bc3e41mr8711137276.1.1717497870133;
        Tue, 04 Jun 2024 03:44:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:103:0:b0:df7:71d2:bccb with SMTP id 3f1490d57ef6-dfa59aef9f7ls1663610276.1.-pod-prod-00-us;
 Tue, 04 Jun 2024 03:44:28 -0700 (PDT)
X-Received: by 2002:a81:4014:0:b0:627:de82:8077 with SMTP id 00721157ae682-62cabc78cd1mr4712207b3.2.1717497868611;
        Tue, 04 Jun 2024 03:44:28 -0700 (PDT)
Date: Tue, 4 Jun 2024 03:44:27 -0700 (PDT)
From: Hassan Mefire <mefirehassan00@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <eeba38ae-1d0e-4f81-95b6-d10b288d6277n@googlegroups.com>
Subject: Where can I BUY DMT vape pen and cartridge Online
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_12230_854378127.1717497867955"
X-Original-Sender: mefirehassan00@gmail.com
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

------=_Part_12230_854378127.1717497867955
Content-Type: multipart/alternative; 
	boundary="----=_Part_12231_2044447844.1717497867955"

------=_Part_12231_2044447844.1717497867955
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

DMT VAPE PEN AND CARTS ONLINE IN LONDON/ENGLAND /CANADA/SAN FRANCISCO


DMT is the fastest-acting and most intense psychedelic available =E2=80=93 =
it=E2=80=99s the=20
best for new users who want an out-of-body experience that won=E2=80=99t la=
st too=20
long.


https://t.me/psystoreoeg

When you buy DMT in Canada =E2=80=93 vaping is the most common DMT product.
https://t.me/psystoreoeg
https://t.me/psystoreoeg

Using a DMT vape cartridge can help mask the signature odour that is=20
emitted when smoking DMT.

There is something about vaping that makes DMT use more palatable despite=
=20
being the most powerful psychedelic in the world. DMT is used for oral=20
consumption, inhaling through smoking, and mixed in brews (Ayahuasca) to=20
create a longer-lasting high. If you want to buy DMT vapes in Canada =E2=80=
=93=20
TheFunguys is your source to buy psychedelics online in Canada; we have a=
=20
full-strength, high-quality DMT vape for sale online. Visit our website=20
homepage for more information

https://t.me/psystoreoeg
https://t.me/psystoreoeg

Our DMT vape pens function like any other vape by pressing the button and=
=20
pulling off the mouthpiece. The vape cartridge is loaded with a DMT liquid=
=20
of dissolved Dimethyltryptamine powder or DMT crystals. These DMT pens are=
=20
tiny and inconspicuous, with enough dosages to last 100 short trips or 30=
=20
to 50 regular trips. Our DMT vape carts have 1g of oil in them.

The battery is 350 mAh, 3.7v operation. 5 Clicks to turn the battery on/off=
.

How Long Do The Effects Last?

The great thing about DMT in vape form is you can regulate the effects by=
=20
the amount of the pull. Generally, one hit will last between 10-20 minutes,=
=20
but you can pull very lightly or strongly =E2=80=93 this is up to you; as w=
e always=20
say, start slow, go slow, and figure out how it affects you.

Three large inhalations will provide a potent experience for the average=20
person, giving you a high lasting for a maximum of 40 minutes. Four hits is=
=20
a high dose and will have a powerful effect.

How to use the DMT Cartridge & Battery

Once you have the vape, all you have to do is light it up using the button=
=20
and take a few puffs at a time.

=E2=80=A2 Find a chill place to enjoy the effects of the DMT, perhaps with =
a=20
trusted friend.

=E2=80=A2 You want to shake the pen before using it, as an unshaken cartrid=
ge may=20
leave you vaping only the solvent.

=E2=80=A2 Click the button 5 times to turn on the vape

=E2=80=A2 Hold the button as you pull on the vape

=E2=80=A2 Exhale when ready

=E2=80=A2 Feel the effects

DMT Vape Pens FAQ:

What is a DMT Pen?

A DMT Vaporizer and cart is a vaporizing device that heats a liquid base of=
=20
DMT to create fumes of the drug that can be inhaled into the lungs. Like=20
other vape pens and e-cigarettes, the DMT cartridges use e-liquids to=20
control and ease use. Unfortunately we don=E2=80=99t sell a straight DMT ca=
rtridge=20
yet.


https://t.me/psystoreoeg
https://t.me/psystoreoeg

This pen will allow users to vape DMT in small doses that provide short=20
trips lasting 20 and 40 minutes. The term for the trips is =E2=80=98busines=
s trip=E2=80=99=20
since the effects are temporary and wear off quickly.
https://t.me/psystoreoeg
https://t.me/psystoreoeg

The vape comes with a battery, a cartridge, and an enclosing case=E2=80=94t=
he=20
energy cell lights it up, and the cart stores the lit e-liquid (propylene=
=20
glycol and other organic mixing agents) DMT base. When the=20
n-Dimethyltryptamine (DMT), the active ingredient in the vapes, hits the=20
coil, it vaporizes the liquid, providing a quick trip.

The pen may utilize a standard vaporizer like an e-cigarette or one for=20
marijuana vaping.

https://t.me/psystoreoeg

https://t.me/psystoreoeg


Buying a DMT cartridge on its own can be interchangeable with regular 310=
=20
vape batteries, making them versatile and easily accessible. You can use=20
the vape pen to smoke anything in 310 cartridges, including THC and CBD=20
carts.

What is DMT?

DMT is a naturally occurring compound in Ayahuasca, n-dimethyltryptamine,=
=20
known as the =E2=80=9Cspirit molecule.=E2=80=9D A DMT trip is short and int=
ense. This=20
mind-altering substance can cause various, and some unpredictable, effects,=
=20
which can have potential benefits for personal growth. Some p

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/eeba38ae-1d0e-4f81-95b6-d10b288d6277n%40googlegroups.com.

------=_Part_12231_2044447844.1717497867955
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

DMT VAPE PEN AND CARTS ONLINE IN LONDON/ENGLAND /CANADA/SAN FRANCISCO<br />=
<br /><br />DMT is the fastest-acting and most intense psychedelic availabl=
e =E2=80=93 it=E2=80=99s the best for new=C2=A0users who want an out-of-bod=
y experience that won=E2=80=99t last too long.<br /><br /><br />https://t.m=
e/psystoreoeg<br /><br />When you=C2=A0buy DMT in Canada=C2=A0=E2=80=93 vap=
ing is the most common DMT product.<br />https://t.me/psystoreoeg<br />http=
s://t.me/psystoreoeg<br /><br />Using a DMT vape cartridge can help mask th=
e signature odour that is emitted when smoking DMT.<br /><br />There is som=
ething about vaping that makes DMT use more palatable despite being the mos=
t powerful psychedelic in the world. DMT is used for oral consumption, inha=
ling through smoking, and mixed in brews (Ayahuasca) to create a longer-las=
ting high. If you want to=C2=A0buy DMT vapes in Canada=C2=A0=E2=80=93 TheFu=
nguys is your source to=C2=A0buy psychedelics online in Canada; we have a f=
ull-strength, high-quality DMT vape for sale online. Visit our website home=
page for more information<br /><br />https://t.me/psystoreoeg<br />https://=
t.me/psystoreoeg<br /><br />Our DMT vape pens function like any other vape =
by pressing the button and pulling off the mouthpiece. The vape cartridge i=
s loaded with a DMT liquid of dissolved Dimethyltryptamine powder or DMT cr=
ystals. These DMT pens are tiny and inconspicuous, with=C2=A0enough dosages=
 to last 100 short trips or 30 to 50 regular trips.=C2=A0Our DMT vape carts=
 have=C2=A01g of oil=C2=A0in them.<br /><br />The battery is 350 mAh, 3.7v =
operation.=C2=A05 Clicks to turn the battery on/off.<br /><br />How Long Do=
 The Effects Last?<br /><br />The great thing about DMT in vape form is you=
 can regulate the effects by the amount of the pull. Generally,=C2=A0one hi=
t will last between 10-20 minutes, but you can pull very lightly or strongl=
y =E2=80=93 this is up to you; as we always say, start slow, go slow, and f=
igure out how it affects you.<br /><br />Three large inhalations will provi=
de a potent experience for the average person, giving you a high lasting fo=
r a maximum of 40 minutes. Four hits is a high dose and will have a powerfu=
l effect.<br /><br />How to use the DMT Cartridge &amp; Battery<br /><br />=
Once you have the vape, all you have to do is light it up using the button =
and take a few puffs at a time.<br /><br />=E2=80=A2 Find a chill place to =
enjoy the effects of the DMT, perhaps with a trusted friend.<br /><br />=E2=
=80=A2 You want to shake the pen before using it, as an unshaken cartridge =
may leave you vaping only the solvent.<br /><br />=E2=80=A2 Click the butto=
n 5 times to turn on the vape<br /><br />=E2=80=A2 Hold the button as you p=
ull on the vape<br /><br />=E2=80=A2 Exhale when ready<br /><br />=E2=80=A2=
 Feel the effects<br /><br />DMT Vape Pens FAQ:<br /><br />What is a DMT Pe=
n?<br /><br />A DMT Vaporizer and cart is a vaporizing device that heats a =
liquid base of DMT to create fumes of the drug that can be inhaled into the=
 lungs. Like other vape pens and e-cigarettes, the DMT cartridges use e-liq=
uids to control and ease use. Unfortunately we don=E2=80=99t sell a straigh=
t DMT cartridge yet.<br /><br /><br />https://t.me/psystoreoeg<br />https:/=
/t.me/psystoreoeg<br /><br />This pen will allow users to vape DMT in small=
 doses that provide short trips lasting 20 and 40 minutes. The term for the=
 trips is =E2=80=98business trip=E2=80=99 since the effects are temporary a=
nd wear off quickly.<br />https://t.me/psystoreoeg<br />https://t.me/psysto=
reoeg<br /><br />The vape comes with a battery, a cartridge, and an enclosi=
ng case=E2=80=94the energy cell lights it up, and the cart stores the lit e=
-liquid (propylene glycol and other organic mixing agents) DMT base. When t=
he n-Dimethyltryptamine (DMT), the active ingredient in the vapes, hits the=
 coil, it vaporizes the liquid, providing a quick trip.<br /><br />The pen =
may utilize a standard vaporizer like an e-cigarette or one for marijuana v=
aping.<br /><br />https://t.me/psystoreoeg<br /><br />https://t.me/psystore=
oeg<br /><br /><br />Buying a DMT cartridge on its own can be interchangeab=
le with regular 310 vape batteries, making them versatile and easily access=
ible. You can use the vape pen to smoke anything in 310 cartridges, includi=
ng THC and CBD carts.<br /><br />What is DMT?<br /><br />DMT is a naturally=
 occurring compound in Ayahuasca, n-dimethyltryptamine, known as the =E2=80=
=9Cspirit molecule.=E2=80=9D A DMT trip is short and intense. This mind-alt=
ering substance can cause various, and some unpredictable, effects, which c=
an have potential benefits for personal growth. Some p<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/eeba38ae-1d0e-4f81-95b6-d10b288d6277n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/eeba38ae-1d0e-4f81-95b6-d10b288d6277n%40googlegroups.co=
m</a>.<br />

------=_Part_12231_2044447844.1717497867955--

------=_Part_12230_854378127.1717497867955--
