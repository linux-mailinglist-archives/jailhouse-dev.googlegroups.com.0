Return-Path: <jailhouse-dev+bncBDHL5ROYQ4LRBE77SWZQMGQEEYJPF4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0DE901580
	for <lists+jailhouse-dev@lfdr.de>; Sun,  9 Jun 2024 12:10:28 +0200 (CEST)
Received: by mail-yb1-xb3b.google.com with SMTP id 3f1490d57ef6-dfa56e1a163sf6534106276.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 09 Jun 2024 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717927828; x=1718532628; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2I8dN69rZ2b8NrdeING+pVPON7o7Z1CWZovYIht4hA=;
        b=U04nATN5lnmb/6/5GAUprFkFqdVoJ2VkX0fxl9zFRD/CRt7wc4fbT7lklomxo46ucs
         Ivls8P/uCmyHN9hGnIxUF9ScJK60pa4PmVDrUVPRSIRg2iuSpjKNlyT9726ZWYpqikai
         XgaPZtaZjdqzy3ikcqFDNzW1LwBBbp0wlgmE5asGyeuQ1aQNEzginN7wZvSl3JRWEm2R
         7XqXiGJp6jp+RyLQHaRzrGPJdcyqbWFQmqDu0wxVa1H1FoYpodyabHh1oTZs9CKjn3iw
         fufq4EkV3EaQlrxtWr2D9/JgK+s0dQIo5p44Mas8sj5p1qI20oytdhfKOyjCXCN5uA6q
         gTDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717927828; x=1718532628; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2I8dN69rZ2b8NrdeING+pVPON7o7Z1CWZovYIht4hA=;
        b=ea8+x9Qalv5IMG8T+LLVtvBrbjCpdBsRsJJEAqJXHjGFCbUg3VZzUIH38mkYUcd8Rm
         FfJDrEflF9JqBctoqaKa+s1kPi7uxHiMlX4Znunobzp0GxAY4lQxRclMtuGKZ/Xjacm1
         6S8mqasvMjjA5MAeU/DPOnenfK3jS9PnK/VfPRT7Lxj1AJbxSgRJd+D1biVxtKgz+0a7
         R2yTvd26JBIfLBAiJaEgRHnZKyDj2bwq7gUMrhaluBYwLh/d0J0Hm94H5XeeiWQXLy8J
         Bv0rdyUq3qFCQ4fONxiaC+bA5cpGzOBuBLf4WCMB/ZPFnqJb+/je7RSd77J+m72wQcWh
         xtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717927828; x=1718532628;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2I8dN69rZ2b8NrdeING+pVPON7o7Z1CWZovYIht4hA=;
        b=uFv5QpkOqNBfOIER9hL/ejjIN9B+ODQzILNqsvGlflIYPaffk+ojrGP8V6NHxIT1J0
         lxWZ2DJDCtuax391HD88/KocUUrTCpyUQa+PKnifBOEFp6SwtTOje5PqC0gv+83QSkps
         CsJI26NzZD19UOgYiGbe4moW59YiuL6vagDRVor3pXIY7B5Ko6oDYPjIrn+igeczvipr
         XorCww3umZI4E2XiOkeiMfNg5hcDMS89qk1/Ra74DukZ4we+xsWcluQlHdM/AS0BP/LT
         pNwP9tjReMtphKCpSP8jdXpVCThNyVwzjfqq/deWG8YBW5KB4OdmV35NYG0bUNPTX+RD
         I9lw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUsHn2Kq+HD5ayOboCJ8Tujsi16nagiVjiadpcXfgKFwjPPWodXt+xARe7gbKDVKXOXi6jyEBtEBgGzP8vRjce0mhjrno7UuoMeb3M=
X-Gm-Message-State: AOJu0Yxr0g/+5a2ddaRpDn1aBgLbf0NdNSA+TDLoBr3R0AV7s1c7l6ZL
	V5bD/HRx5qeqYMtSXe7gnNYMhcukl+RKEoryQLNjx83sUz/SE6Gf
X-Google-Smtp-Source: AGHT+IFVkQQoDeqjYAvaS+k5xGZh/ky9DyKVJGrurjMWpRTT+6VUn8e2eQwCDZ8BjwTbXJwMxbPZKg==
X-Received: by 2002:a25:824a:0:b0:df7:8b37:19d6 with SMTP id 3f1490d57ef6-dfaf64cb9ffmr6742824276.23.1717927827796;
        Sun, 09 Jun 2024 03:10:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d391:0:b0:dfa:c78d:86ad with SMTP id 3f1490d57ef6-dfaf162a96dls3771606276.2.-pod-prod-05-us;
 Sun, 09 Jun 2024 03:10:26 -0700 (PDT)
X-Received: by 2002:a05:6902:1244:b0:dfb:20e:2901 with SMTP id 3f1490d57ef6-dfb020e2cfemr1775256276.6.1717927825993;
        Sun, 09 Jun 2024 03:10:25 -0700 (PDT)
Date: Sun, 9 Jun 2024 03:10:25 -0700 (PDT)
From: Hassan Mefire <mefirehassan00@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ebceef8a-694f-4eb8-99cd-4bb587b2641bn@googlegroups.com>
Subject: BUY 5-Meo DMT vape pen and cartridge Online
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_258354_1700775606.1717927825249"
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

------=_Part_258354_1700775606.1717927825249
Content-Type: multipart/alternative; 
	boundary="----=_Part_258355_1719061866.1717927825249"

------=_Part_258355_1719061866.1717927825249
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
jailhouse-dev/ebceef8a-694f-4eb8-99cd-4bb587b2641bn%40googlegroups.com.

------=_Part_258355_1719061866.1717927825249
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

DMT VAPE PEN AND CARTS ONLINE IN LONDON/ENGLAND /CANADA/SAN FRANCISCO<div><=
br /></div><div><br /></div><div>DMT is the fastest-acting and most intense=
 psychedelic available =E2=80=93 it=E2=80=99s the best for new=C2=A0users w=
ho want an out-of-body experience that won=E2=80=99t last too long.</div><d=
iv><br /></div><div><br /></div><div>https://t.me/psystoreoeg</div><div><br=
 /></div><div>When you=C2=A0buy DMT in Canada=C2=A0=E2=80=93 vaping is the =
most common DMT product.</div><div>https://t.me/psystoreoeg</div><div>https=
://t.me/psystoreoeg</div><div><br /></div><div>Using a DMT vape cartridge c=
an help mask the signature odour that is emitted when smoking DMT.</div><di=
v><br /></div><div>There is something about vaping that makes DMT use more =
palatable despite being the most powerful psychedelic in the world. DMT is =
used for oral consumption, inhaling through smoking, and mixed in brews (Ay=
ahuasca) to create a longer-lasting high. If you want to=C2=A0buy DMT vapes=
 in Canada=C2=A0=E2=80=93 TheFunguys is your source to=C2=A0buy psychedelic=
s online in Canada; we have a full-strength, high-quality DMT vape for sale=
 online. Visit our website homepage for more information</div><div><br /></=
div><div>https://t.me/psystoreoeg</div><div>https://t.me/psystoreoeg</div><=
div><br /></div><div>Our DMT vape pens function like any other vape by pres=
sing the button and pulling off the mouthpiece. The vape cartridge is loade=
d with a DMT liquid of dissolved Dimethyltryptamine powder or DMT crystals.=
 These DMT pens are tiny and inconspicuous, with=C2=A0enough dosages to las=
t 100 short trips or 30 to 50 regular trips.=C2=A0Our DMT vape carts have=
=C2=A01g of oil=C2=A0in them.</div><div><br /></div><div>The battery is 350=
 mAh, 3.7v operation.=C2=A05 Clicks to turn the battery on/off.</div><div><=
br /></div><div>How Long Do The Effects Last?</div><div><br /></div><div>Th=
e great thing about DMT in vape form is you can regulate the effects by the=
 amount of the pull. Generally,=C2=A0one hit will last between 10-20 minute=
s, but you can pull very lightly or strongly =E2=80=93 this is up to you; a=
s we always say, start slow, go slow, and figure out how it affects you.</d=
iv><div><br /></div><div>Three large inhalations will provide a potent expe=
rience for the average person, giving you a high lasting for a maximum of 4=
0 minutes. Four hits is a high dose and will have a powerful effect.</div><=
div><br /></div><div>How to use the DMT Cartridge &amp; Battery</div><div><=
br /></div><div>Once you have the vape, all you have to do is light it up u=
sing the button and take a few puffs at a time.</div><div><br /></div><div>=
=E2=80=A2 Find a chill place to enjoy the effects of the DMT, perhaps with =
a trusted friend.</div><div><br /></div><div>=E2=80=A2 You want to shake th=
e pen before using it, as an unshaken cartridge may leave you vaping only t=
he solvent.</div><div><br /></div><div>=E2=80=A2 Click the button 5 times t=
o turn on the vape</div><div><br /></div><div>=E2=80=A2 Hold the button as =
you pull on the vape</div><div><br /></div><div>=E2=80=A2 Exhale when ready=
</div><div><br /></div><div>=E2=80=A2 Feel the effects</div><div><br /></di=
v><div>DMT Vape Pens FAQ:</div><div><br /></div><div>What is a DMT Pen?</di=
v><div><br /></div><div>A DMT Vaporizer and cart is a vaporizing device tha=
t heats a liquid base of DMT to create fumes of the drug that can be inhale=
d into the lungs. Like other vape pens and e-cigarettes, the DMT cartridges=
 use e-liquids to control and ease use. Unfortunately we don=E2=80=99t sell=
 a straight DMT cartridge yet.</div><div><br /></div><div><br /></div><div>=
https://t.me/psystoreoeg</div><div>https://t.me/psystoreoeg</div><div><br /=
></div><div>This pen will allow users to vape DMT in small doses that provi=
de short trips lasting 20 and 40 minutes. The term for the trips is =E2=80=
=98business trip=E2=80=99 since the effects are temporary and wear off quic=
kly.</div><div>https://t.me/psystoreoeg</div><div>https://t.me/psystoreoeg<=
/div><div><br /></div><div>The vape comes with a battery, a cartridge, and =
an enclosing case=E2=80=94the energy cell lights it up, and the cart stores=
 the lit e-liquid (propylene glycol and other organic mixing agents) DMT ba=
se. When the n-Dimethyltryptamine (DMT), the active ingredient in the vapes=
, hits the coil, it vaporizes the liquid, providing a quick trip.</div><div=
><br /></div><div>The pen may utilize a standard vaporizer like an e-cigare=
tte or one for marijuana vaping.</div><div><br /></div><div>https://t.me/ps=
ystoreoeg</div><div><br /></div><div>https://t.me/psystoreoeg</div><div><br=
 /></div><div><br /></div><div>Buying a DMT cartridge on its own can be int=
erchangeable with regular 310 vape batteries, making them versatile and eas=
ily accessible. You can use the vape pen to smoke anything in 310 cartridge=
s, including THC and CBD carts.</div><div><br /></div><div>What is DMT?</di=
v><div><br /></div><div>DMT is a naturally occurring compound in Ayahuasca,=
 n-dimethyltryptamine, known as the =E2=80=9Cspirit molecule.=E2=80=9D A DM=
T trip is short and intense. This mind-altering substance can cause various=
, and some unpredictable, effects, which can have potential benefits for pe=
rsonal growth. Some p</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ebceef8a-694f-4eb8-99cd-4bb587b2641bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ebceef8a-694f-4eb8-99cd-4bb587b2641bn%40googlegroups.co=
m</a>.<br />

------=_Part_258355_1719061866.1717927825249--

------=_Part_258354_1700775606.1717927825249--
