Return-Path: <jailhouse-dev+bncBCCMRLPB2UFRBFHQ62ZAMGQETO4E2IA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6FA8D8252
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Jun 2024 14:33:26 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id 3f1490d57ef6-df771b5e942sf7282324276.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jun 2024 05:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717418005; x=1718022805; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDtH4sU2lV1xWBfAS8QiUIfwavJ/vs7DgP/qK1Xo92I=;
        b=i4XiFneaEFAuwhZIKeueN3awjVIQA7HUiXqoUFe30FPXv2MdZ1ZwA94ePIM0veGXTF
         3HT0xLg8zbck/8bsipX7Y2TOqbwIRCdYc9wyZ4QiJB61r+ON2olQOeS9yj/NFwXiung8
         SuHBRzv8zW3Yu3TsoBZgdc8bbAkt0JASIBA20RaigPPQlbAhl78aSh05wtoJWZ5bDPz5
         6F2lxSNAqDAsD8hRatqW9r0HPDoDqwMTOPGoVdHvlS0/saVeWBulkOIN9p4SocNOWlhT
         Y9iXy7LggPYk48QGbEOdfo4kW/KXtOOQbeg+d8tBN1j/rjCsxZ1oFcj0DmY+NN20gAQD
         s5GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717418005; x=1718022805; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDtH4sU2lV1xWBfAS8QiUIfwavJ/vs7DgP/qK1Xo92I=;
        b=G7RCpocDDVrBk1H5ryCTALYPPNw3J7eL2PROYmpl9bDkC4cVPtrsqVfsYaDz8lAkwg
         7bYaM3bRWRnPDwZIZzkFdjq7bCiuvEks4skc0VSM5fxANi/QkYwDCrhKKF+JAVypgyhA
         JTwqIguC6iyFhHTALHSvLrHmVzfcISf3ORXpS5pvo1mwa4x+3VOmyrmnhmLnGJ+CS6Hw
         hLkey0Qcg2qf90O8jA7lzDHuhuKgzp9rmjE+8N+RU4xoYuI8xaHnu5YNqoDvCDpSJ+hM
         zM7axf2UWgEg32V8HI0wB2kFs0mSqtYBXRV6A47PnLmd1e5OSFDcz9dztmqODRIMnKR6
         IjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717418005; x=1718022805;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDtH4sU2lV1xWBfAS8QiUIfwavJ/vs7DgP/qK1Xo92I=;
        b=KQvD7meWsfHzQfix8wutZwUYrWnKvPNf52mkmf0l24yv9GrHUxxolmGC8C5TDCxWR1
         CVDyZT7p4pwba5GpB7ZYzOSeVSolVqzM05rMyHsNNsX9pm6Ccn5PZSFav9nRL3g8WPhm
         2xWJtqb3mCKenSHpfM8GULwk2LnaeuObC1CmYiMe4To9rwC9a4jRXcyJ46aGffVdk3ll
         3NIwdjH/nsnrAZ2OCCNrQ0XE7mYFc9vS/9oa1D6ttLkC3cWJweijQMl2tFETIpI6LfDp
         DHQsU7g4ULhAN3SInYsPueMSH3/1Apk6EzwJO5rTW32eVQt2rtlcwH3n2nhOxYr2PQZI
         tCqg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCU56hHL6nVmxlQgWCFdCL9jsgXcnNABR4StA08PBWZK6n3H2kej6g/PAd+Fs40TK6XMH5Bj7C/Cwr7wPzZG2pSYKNwCiONkERkbj38=
X-Gm-Message-State: AOJu0Ywpyjg40DtMj2TwvQPyrH0uvDFFUhWh51aUltbKhrY2/rFw3OQ7
	NN80ywL7JkC+dFetjvt5S2FwcIsP99riOw05OBEUp3xfTQeYFG2r
X-Google-Smtp-Source: AGHT+IELkGeOgTYVNb179OOEthQApgpEGV7nq+lto51xdlfSL9kqaxE1G589MUqrHWHigRx3fN+yqQ==
X-Received: by 2002:a25:6b4b:0:b0:dcf:f9bd:fe05 with SMTP id 3f1490d57ef6-dfa73d9d171mr8379025276.48.1717418005269;
        Mon, 03 Jun 2024 05:33:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:a8d:b0:dfa:81ff:d907 with SMTP id
 3f1490d57ef6-dfa81ffed66ls665117276.2.-pod-prod-08-us; Mon, 03 Jun 2024
 05:33:24 -0700 (PDT)
X-Received: by 2002:a05:6902:154d:b0:df7:b717:10c2 with SMTP id 3f1490d57ef6-dfa73bda088mr1396897276.2.1717418003809;
        Mon, 03 Jun 2024 05:33:23 -0700 (PDT)
Date: Mon, 3 Jun 2024 05:33:23 -0700 (PDT)
From: Clarksville Pop <popclarksville@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ec68a154-64a0-43d1-a5c6-e6c4ee3cf81en@googlegroups.com>
Subject: $ORDER DMT VAPES, CARTRIDGES WITH POWDER ONLINE CALIFORNIA
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_479397_1509530471.1717418003139"
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

------=_Part_479397_1509530471.1717418003139
Content-Type: multipart/alternative; 
	boundary="----=_Part_479398_42917772.1717418003139"

------=_Part_479398_42917772.1717418003139
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

DMT VAPE PEN AND CARTS ONLINE IN LONDON/ENGLAND /CANADA/SAN FRANCISCO


DMT is the fastest-acting and most intense psychedelic available =E2=80=93 =
it=E2=80=99s the=20
best for new users who want an out-of-body experience that won=E2=80=99t la=
st too=20
long.

https://t.me/Mushies_12


When you buy DMT in Canada =E2=80=93 vaping is the most common DMT product.
https://t.me/Mushies_12
https://t.me/Mushies_12

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
https://t.me/Mushies_12
https://t.me/Mushies_12

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


https://t.me/Mushies_12
https://t.me/Mushies_12

This pen will allow users to vape DMT in small doses that provide short=20
trips lasting 20 and 40 minutes. The term for the trips is =E2=80=98busines=
s trip=E2=80=99=20
since the effects are temporary and wear off quickly.
https://t.me/Mushies_12
https://t.me/Mushies_12

The vape comes with a battery, a cartridge, and an enclosing case=E2=80=94t=
he=20
energy cell lights it up, and the cart stores the lit e-liquid (propylene=
=20
glycol and other organic mixing agents) DMT base. When the=20
n-Dimethyltryptamine (DMT), the active ingredient in the vapes, hits the=20
coil, it vaporizes the liquid, providing a quick trip.

The pen may utilize a standard vaporizer like an e-cigarette or one for=20
marijuana vaping.
https://t.me/Mushies_12
https://t.me/Mushies_12



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
jailhouse-dev/ec68a154-64a0-43d1-a5c6-e6c4ee3cf81en%40googlegroups.com.

------=_Part_479398_42917772.1717418003139
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

DMT VAPE PEN AND CARTS ONLINE IN LONDON/ENGLAND /CANADA/SAN FRANCISCO<div><=
br /></div><div><br /></div><div>DMT is the fastest-acting and most intense=
 psychedelic available =E2=80=93 it=E2=80=99s the best for new=C2=A0users w=
ho want an out-of-body experience that won=E2=80=99t last too long.</div><d=
iv><br /></div><div>https://t.me/Mushies_12</div><div><br /></div><div><br =
/></div><div>When you=C2=A0buy DMT in Canada=C2=A0=E2=80=93 vaping is the m=
ost common DMT product.</div><div>https://t.me/Mushies_12</div><div>https:/=
/t.me/Mushies_12</div><div><br /></div><div>Using a DMT vape cartridge can =
help mask the signature odour that is emitted when smoking DMT.</div><div><=
br /></div><div>There is something about vaping that makes DMT use more pal=
atable despite being the most powerful psychedelic in the world. DMT is use=
d for oral consumption, inhaling through smoking, and mixed in brews (Ayahu=
asca) to create a longer-lasting high. If you want to=C2=A0buy DMT vapes in=
 Canada=C2=A0=E2=80=93 TheFunguys is your source to=C2=A0buy psychedelics o=
nline in Canada; we have a full-strength, high-quality DMT vape for sale on=
line. Visit our website homepage for more information</div><div>https://t.m=
e/Mushies_12</div><div>https://t.me/Mushies_12</div><div><br /></div><div>O=
ur DMT vape pens function like any other vape by pressing the button and pu=
lling off the mouthpiece. The vape cartridge is loaded with a DMT liquid of=
 dissolved Dimethyltryptamine powder or DMT crystals. These DMT pens are ti=
ny and inconspicuous, with=C2=A0enough dosages to last 100 short trips or 3=
0 to 50 regular trips.=C2=A0Our DMT vape carts have=C2=A01g of oil=C2=A0in =
them.</div><div><br /></div><div>The battery is 350 mAh, 3.7v operation.=C2=
=A05 Clicks to turn the battery on/off.</div><div><br /></div><div>How Long=
 Do The Effects Last?</div><div><br /></div><div>The great thing about DMT =
in vape form is you can regulate the effects by the amount of the pull. Gen=
erally,=C2=A0one hit will last between 10-20 minutes, but you can pull very=
 lightly or strongly =E2=80=93 this is up to you; as we always say, start s=
low, go slow, and figure out how it affects you.</div><div><br /></div><div=
>Three large inhalations will provide a potent experience for the average p=
erson, giving you a high lasting for a maximum of 40 minutes. Four hits is =
a high dose and will have a powerful effect.</div><div><br /></div><div>How=
 to use the DMT Cartridge &amp; Battery</div><div><br /></div><div>Once you=
 have the vape, all you have to do is light it up using the button and take=
 a few puffs at a time.</div><div><br /></div><div>=E2=80=A2 Find a chill p=
lace to enjoy the effects of the DMT, perhaps with a trusted friend.</div><=
div><br /></div><div>=E2=80=A2 You want to shake the pen before using it, a=
s an unshaken cartridge may leave you vaping only the solvent.</div><div><b=
r /></div><div>=E2=80=A2 Click the button 5 times to turn on the vape</div>=
<div><br /></div><div>=E2=80=A2 Hold the button as you pull on the vape</di=
v><div><br /></div><div>=E2=80=A2 Exhale when ready</div><div><br /></div><=
div>=E2=80=A2 Feel the effects</div><div><br /></div><div>DMT Vape Pens FAQ=
:</div><div><br /></div><div>What is a DMT Pen?</div><div><br /></div><div>=
A DMT Vaporizer and cart is a vaporizing device that heats a liquid base of=
 DMT to create fumes of the drug that can be inhaled into the lungs. Like o=
ther vape pens and e-cigarettes, the DMT cartridges use e-liquids to contro=
l and ease use. Unfortunately we don=E2=80=99t sell a straight DMT cartridg=
e yet.</div><div><br /></div><div><br /></div><div>https://t.me/Mushies_12<=
/div><div>https://t.me/Mushies_12</div><div><br /></div><div>This pen will =
allow users to vape DMT in small doses that provide short trips lasting 20 =
and 40 minutes. The term for the trips is =E2=80=98business trip=E2=80=99 s=
ince the effects are temporary and wear off quickly.</div><div>https://t.me=
/Mushies_12</div><div>https://t.me/Mushies_12</div><div><br /></div><div>Th=
e vape comes with a battery, a cartridge, and an enclosing case=E2=80=94the=
 energy cell lights it up, and the cart stores the lit e-liquid (propylene =
glycol and other organic mixing agents) DMT base. When the n-Dimethyltrypta=
mine (DMT), the active ingredient in the vapes, hits the coil, it vaporizes=
 the liquid, providing a quick trip.</div><div><br /></div><div>The pen may=
 utilize a standard vaporizer like an e-cigarette or one for marijuana vapi=
ng.</div><div>https://t.me/Mushies_12</div><div>https://t.me/Mushies_12</di=
v><div><br /></div><div><br /></div><div><br /></div><div>Buying a DMT cart=
ridge on its own can be interchangeable with regular 310 vape batteries, ma=
king them versatile and easily accessible. You can use the vape pen to smok=
e anything in 310 cartridges, including THC and CBD carts.</div><div><br />=
</div><div>What is DMT?</div><div><br /></div><div>DMT is a naturally occur=
ring compound in Ayahuasca, n-dimethyltryptamine, known as the =E2=80=9Cspi=
rit molecule.=E2=80=9D A DMT trip is short and intense. This mind-altering =
substance can cause various, and some unpredictable, effects, which can hav=
e potential benefits for personal growth. Some p</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ec68a154-64a0-43d1-a5c6-e6c4ee3cf81en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ec68a154-64a0-43d1-a5c6-e6c4ee3cf81en%40googlegroups.co=
m</a>.<br />

------=_Part_479398_42917772.1717418003139--

------=_Part_479397_1509530471.1717418003139--
