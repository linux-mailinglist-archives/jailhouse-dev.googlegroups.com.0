Return-Path: <jailhouse-dev+bncBCYLJL5XV4JRBRONW22QMGQEMPHWO7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113c.google.com (mail-yw1-x113c.google.com [IPv6:2607:f8b0:4864:20::113c])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F3A946739
	for <lists+jailhouse-dev@lfdr.de>; Sat,  3 Aug 2024 05:40:55 +0200 (CEST)
Received: by mail-yw1-x113c.google.com with SMTP id 00721157ae682-688777c95c4sf57272407b3.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Aug 2024 20:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1722656454; x=1723261254; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M9elILpK0Tybtc8j2BTN23KxcCnx8HyWApA+xpaPpcg=;
        b=KG52NxppKWKGn/S497QWxtEw2JZtxTYYo/2r9E5mDd1cFwWlchgE+k2bPcGgTJI1AY
         0+nYV8zutWmPygXgxtLxk3/7NZ2CVYIYiWSO+2NKtE8ijEjOFqPJ/7s3D9Us6OzKIiWk
         cd7kPnTwqry0VgYVBJKPztv3l9wb55QNjOPVw7NUFJwyszwlvdg4RrS9LOQbhK8kt4jD
         gjl9SheSfk88uGsEYrf5lLFKTNA5kVWfqqyJE5ptUL+EHlPyucwSlKdkgWb770QXtqAz
         6dkWPfYFhf3xbdVa5ldH4RldiRV/InMSVL1oaOmEhYY2e4DWNqcCvX76dO+k4TJveXHZ
         XhXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722656454; x=1723261254; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9elILpK0Tybtc8j2BTN23KxcCnx8HyWApA+xpaPpcg=;
        b=he9cemXBmDrzFT2i/nPViMbJeGFZGRtlzaQm6++PnP6Nj5cKgOKicxBNDW7bKLSn43
         a/E73Zwvjh4ABJm+BT0nMsyk6ISDZ1oGEM4hUD2Q364GCpaYMM5/of/5q4Omlz7rt8w8
         pswMtUzk5X9q6OsJRUe7wh6U6Bavi00X7/8mdFooJOP1o1gs6DjIA4V+9zBDpj7BgPp8
         xX7e7iTji74LgZD7vX72lOYncwnWM25p3/aoWglz0YvHrTvpgPenClgxrZpEar+0v7rD
         WA77x8nKYDo11IO9CExcIGd0YV9LmIQtQVYndJ1bK5Zh0Aq40PToi55oVQEpq/FYgA4P
         qWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722656454; x=1723261254;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M9elILpK0Tybtc8j2BTN23KxcCnx8HyWApA+xpaPpcg=;
        b=Hi7H46pAAuvj1LVi3jQtpVmS6dzTMjAuWo6cl33AywyMqzjk4OVRCqXX+4vBk0xmjW
         ldDlxPgdBJbGw1qWTQWGi6BL6QtgDndNDDMtIunPCBWRgmlFZ0KRVWmxXh1TgUi7NyJP
         GS1rSBTLAkfEXWozDUavaU7Yfd7zIK5d1MrTHh3y49PlftW7EccpnKst7VSn+18ucV3/
         AGFX/a26nxxfrPQePcIBYncM98/B3F+LhMUyUzNu9B9RLjMLKYoP1PvNZj4E1C42M3mM
         IoIKuLufxnEHNdWlaL9HifNn9++12QeaPKXSCu1f+aH2JcN6sDPl5LBLkQhClCF4vRUe
         cyKA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVy2mmVBmgIgiA+N+A1H1wOdXaaSk8neBFykkP208tZcac7750stYfJq9VCvke0+6nMgHqlMpF/s3YjZBwR2isS7dr//1zbI4hMSoA=
X-Gm-Message-State: AOJu0YyOXpwev4Efvs6GO7rcN7n84THDIP4aoEiI9KCo4GE5ZhKTJns9
	dm5Rnqd8gywO/WNRSH1Uc+y50Vpi8BViLo80VUPyU/+Uwpv1Aj3X
X-Google-Smtp-Source: AGHT+IHJVlMAWgJqudwvQIoxpDlcPMk5/Bp1Nffuc7jfuC6Z9V7Mj4WawA0CXI7cTT3jxVnZihCpGQ==
X-Received: by 2002:a05:6902:1009:b0:e0b:fb2c:6429 with SMTP id 3f1490d57ef6-e0bfb2c7390mr668450276.46.1722656454183;
        Fri, 02 Aug 2024 20:40:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:708:b0:e0b:cdec:88a0 with SMTP id
 3f1490d57ef6-e0bf49b5bf4ls849506276.0.-pod-prod-05-us; Fri, 02 Aug 2024
 20:40:53 -0700 (PDT)
X-Received: by 2002:a05:690c:112:b0:648:3f93:6947 with SMTP id 00721157ae682-6896496d42dmr4290407b3.8.1722656452952;
        Fri, 02 Aug 2024 20:40:52 -0700 (PDT)
Date: Fri, 2 Aug 2024 20:40:52 -0700 (PDT)
From: Konyu Godwin <konyugodwin76@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <fa0858d4-b580-478f-a107-314e9b660bc8n@googlegroups.com>
In-Reply-To: <ca200c0c-6f28-46c1-9eb7-ce916905c37an@googlegroups.com>
References: <a9df6281-8035-4ff3-9cc0-0abb8eb2d8dan@googlegroups.com>
 <66e578aa-187d-434d-a623-e3a56dc8c9efn@googlegroups.com>
 <37a0ee94-2952-4dd0-84ad-8ac6423c1032n@googlegroups.com>
 <253d8699-c3a1-4ac0-ae08-3598f9856534n@googlegroups.com>
 <ca200c0c-6f28-46c1-9eb7-ce916905c37an@googlegroups.com>
Subject: CRY BABY 2G DISPOSABLE FOR SALE | PACKMAN 2G DISPOSABLE BUY NEAR NE
 ONLINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_129226_1392489130.1722656452443"
X-Original-Sender: konyugodwin76@gmail.com
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

------=_Part_129226_1392489130.1722656452443
Content-Type: multipart/alternative; 
	boundary="----=_Part_129227_344693282.1722656452443"

------=_Part_129227_344693282.1722656452443
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Website..=F0=9F=91=89 https://t.me/EgUNSNP43FY3MDJk .
There is a growing number of people who wish to buy shrooms online. It is=
=20
often hard to tell which form of products to buy since you cannot see it=20
physically. This is sometimes peculiar to newbies who haven=E2=80=99t tried=
 shrooms=20
before. They just don=E2=80=99t know how to go about it. Shroom Edibles are=
 not so=20
popularly discussed as often as you think. A lot of experienced shroom=20
users have not even had a taste of these Psilonauts Psilocybin Chocolate=20
Bar goodness that offer a premium psychedelic trip.
Website..=F0=9F=91=89 https://t.me/EgUNSNP43FY3MDJk
Shop..=F0=9F=91=89 https://t.me/EgUNSNP43FY3MDJk
https://t.me/EgUNSNP43FY3MDJk
Buy Albino Penis Envy Mushrooms, or =E2=80=9CAPE,=E2=80=9D is a genetically=
 isolated,=20
non-pigmented strain of the famous Polkadot chocolate. But the lack of=20
pigment gives the albino penile envy mushroom a bright white appearance.
https://t.me/EgUNSNP43FY3MDJk
https://t.me/EgUNSNP43FY3MDJk
https://t.me/EgUNSNP43FY3MDJk
Your best online shop to get platinum quality microdosing psychedelics=20
products online, pain,anxiety pills, and research chemicals.
Be 100% assured about the quality and genuineness of the product, and you=
=20
will also be able to buy quality psychedelics products at a fair price.
https://t.me/EgUNSNP43FY3MDJk
https://t.me/EgUNSNP43FY3MDJk
Website..=F0=9F=91=89 https://t.me/EgUNSNP43FY3MDJk

On Saturday, July 13, 2024 at 1:09:07=E2=80=AFAM UTC+1 Asah Randy wrote:

> https://t.me/motionking_caliweed_psychedelics
> mushrooms for sale  (Psilocybe Cubensis A+) are related to another popula=
r=20
> strain
>
> called the Albino A+. This strain is the result of growing Albino A+ with=
=20
> more natural sunlight
>
> which resulted in the =E2=80=9CAlbino=E2=80=9D portion being removed and =
the mushrooms=20
> showing a light golden
>
> caps. A+ Shrooms appear to be medium in size and have a slightly silvery=
=20
> hue with caps that are
>
> caramel yet not quite=20
> Telegram:https://t.me/motionking_caliweed_psychedelics
> The A+ strain is a descendent of the Mexicana strain and with this lineag=
e=20
> you should expect
>
> shamanic properties which include both colorful visuals and deep=20
> exploration of thoughts and
>
> feelings. Laughter is also part of the A+ magic mushroom experience when=
=20
> enjoyed in a group.
>
> A+ shrooms can be experienced alone for self-reflection or with a group o=
f=20
> friends for
>
> hours of https://t.me/motionking_caliweed_psychedelics
>
> Buy A+ mushrooms Online
>
> https://t.me/motionking_caliweed_psychedelics
>
> Eating Psilocybe cubensis(a+ mushroom strain ) typically causes changes i=
n=20
> mood and thinking patterns, as well as
>
>
> hallucinations at greater dosages. Unfortunately, nausea is also rather=
=20
> typical. Children are more
>
>
> prone to experiencing negative side effects, albeit they are uncommon.=20
> Though longer trips are
>
>
> conceivable, the typical high lasts six to eight hours and starts roughly=
=20
> 30 minutes after intake.
>
>
> psilocybin spores
>
>
> It=E2=80=99s debatable if any of the aforementioned changes in response t=
o strain.=20
> While some
>
>
> claim that =E2=80=9Ca cube is a cube,=E2=80=9D others contend that each s=
train is unique.=20
> The latter group claims=20
>
> https://t.me/motionking_caliweed_psychedelics
>
> https://t.me/motionking_caliweed_psychedelics
>
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fa0858d4-b580-478f-a107-314e9b660bc8n%40googlegroups.com.

------=_Part_129227_344693282.1722656452443
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Website..=F0=9F=91=89 https://t.me/EgUNSNP43FY3MDJk .<br />There is a growi=
ng number of people who wish to buy shrooms online. It is often hard to tel=
l which form of products to buy since you cannot see it physically. This is=
 sometimes peculiar to newbies who haven=E2=80=99t tried shrooms before. Th=
ey just don=E2=80=99t know how to go about it. Shroom Edibles are not so po=
pularly discussed as often as you think. A lot of experienced shroom users =
have not even had a taste of these Psilonauts Psilocybin Chocolate Bar good=
ness that offer a premium psychedelic trip.<br />Website..=F0=9F=91=89 http=
s://t.me/EgUNSNP43FY3MDJk<br />Shop..=F0=9F=91=89 https://t.me/EgUNSNP43FY3=
MDJk<br />https://t.me/EgUNSNP43FY3MDJk<br />Buy Albino Penis Envy Mushroom=
s, or =E2=80=9CAPE,=E2=80=9D is a genetically isolated, non-pigmented strai=
n of the famous Polkadot chocolate. But the lack of pigment gives the albin=
o penile envy mushroom a bright white appearance.<br />https://t.me/EgUNSNP=
43FY3MDJk<br />https://t.me/EgUNSNP43FY3MDJk<br />https://t.me/EgUNSNP43FY3=
MDJk<br />Your best online shop to get platinum quality microdosing psyched=
elics products online, pain,anxiety pills, and research chemicals.<br />Be =
100% assured about the quality and genuineness of the product, and you will=
 also be able to buy quality psychedelics products at a fair price.<br />ht=
tps://t.me/EgUNSNP43FY3MDJk<br />https://t.me/EgUNSNP43FY3MDJk<br />Website=
..=F0=9F=91=89 https://t.me/EgUNSNP43FY3MDJk<br /><br /><div class=3D"gmail=
_quote"><div dir=3D"auto" class=3D"gmail_attr">On Saturday, July 13, 2024 a=
t 1:09:07=E2=80=AFAM UTC+1 Asah Randy wrote:<br/></div><blockquote class=3D=
"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204,=
 204, 204); padding-left: 1ex;"><div><a href=3D"https://t.me/motionking_cal=
iweed_psychedelics" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_cali=
weed_psychedelics&amp;source=3Dgmail&amp;ust=3D1722742753652000&amp;usg=3DA=
OvVaw1JZmUv4V6CBv9eme_THYWT">https://t.me/motionking_caliweed_psychedelics<=
/a></div><div><div role=3D"region" aria-labelledby=3D"c991"></div></div><di=
v><div role=3D"region" aria-labelledby=3D"c991"><div><div><div style=3D"ove=
rflow-y:auto;outline:none"><div role=3D"list" aria-label=3D"Buy mushrooms o=
nline"><span aria-expanded=3D"true" role=3D"listitem" style=3D"border-botto=
m:1px solid rgb(232,234,237);padding-top:8px;padding-left:0px;border-left:2=
px solid rgb(77,144,240)"><div style=3D"outline:none"><div style=3D"display=
:flex"><div style=3D"min-width:0px"><div aria-labelledby=3D"c337" role=3D"r=
egion" style=3D"margin:12px 0px;overflow:auto;padding-right:20px">mushrooms=
 for sale=C2=A0 (Psilocybe Cubensis A+)=C2=A0are related to another popular=
 strain<br><br>called the Albino A+. This strain is the result of growing A=
lbino A+ with more natural sunlight<br><br>which resulted in the =E2=80=9CA=
lbino=E2=80=9D portion being removed and the mushrooms showing a light gold=
en<br><br>caps. A+ Shrooms appear to be medium in size and have a slightly =
silvery hue with caps that are<br><br>caramel yet not quite=C2=A0<br></div>=
</div></div></div></span></div></div></div><div><div style=3D"overflow-y:au=
to;outline:none"><div role=3D"list" aria-label=3D"Buy mushrooms online"><sp=
an aria-expanded=3D"true" role=3D"listitem" style=3D"border-bottom:1px soli=
d rgb(232,234,237);padding-top:8px;padding-left:0px;border-left:2px solid r=
gb(77,144,240)"><div style=3D"outline:none"><div style=3D"display:flex"><di=
v style=3D"min-width:0px"><div aria-labelledby=3D"c337" role=3D"region" sty=
le=3D"margin:12px 0px;overflow:auto;padding-right:20px">Telegram:<a href=3D=
"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"=
_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3D=
https://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D=
1722742753652000&amp;usg=3DAOvVaw1JZmUv4V6CBv9eme_THYWT">https://t.me/motio=
nking_caliweed_psychedelics</a><br>The A+ strain is a descendent of the Mex=
icana strain and with this lineage you should expect<br><br>shamanic proper=
ties which include both colorful visuals and deep exploration of thoughts a=
nd<br><br>feelings. Laughter is also part of the A+ magic mushroom experien=
ce when enjoyed in a group.<br><br>A+ shrooms can be experienced alone for =
self-reflection or with a group of friends for<br><br></div></div></div></d=
iv></span></div></div></div><div style=3D"overflow-y:auto;outline:none"><di=
v role=3D"list" aria-label=3D"Buy mushrooms online"><span aria-expanded=3D"=
true" role=3D"listitem" style=3D"border-bottom:1px solid rgb(232,234,237);p=
adding-top:8px;padding-left:0px;border-left:2px solid rgb(77,144,240)"><div=
 style=3D"outline:none"><div style=3D"display:flex"><div style=3D"min-width=
:0px"><div aria-labelledby=3D"c337" role=3D"region" style=3D"margin:12px 0p=
x;overflow:auto;padding-right:20px">hours of=C2=A0<a href=3D"https://t.me/m=
otionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" data-sa=
feredirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/mo=
tionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D172274275365200=
0&amp;usg=3DAOvVaw1JZmUv4V6CBv9eme_THYWT">https://t.me/motionking_caliweed_=
psychedelics</a><br><br>Buy A+ mushrooms Online<br></div></div></div></div>=
</span></div></div></div><div><div><div style=3D"overflow-y:auto;outline:no=
ne"><div role=3D"list" aria-label=3D"Buy mushrooms online"><span aria-expan=
ded=3D"true" role=3D"listitem" style=3D"border-bottom:1px solid rgb(232,234=
,237);padding-top:8px;padding-left:0px;border-left:2px solid rgb(77,144,240=
)"><div style=3D"outline:none"><div style=3D"display:flex"><div style=3D"mi=
n-width:0px"><div aria-labelledby=3D"c337" role=3D"region" style=3D"margin:=
12px 0px;overflow:auto;padding-right:20px"><br><a href=3D"https://t.me/moti=
onking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" data-safer=
edirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motio=
nking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1722742753652000&a=
mp;usg=3DAOvVaw1JZmUv4V6CBv9eme_THYWT">https://t.me/motionking_caliweed_psy=
chedelics</a><br><br>Eating Psilocybe cubensis(a+ mushroom strain ) typical=
ly causes changes in mood and thinking patterns, as well as<br><br><br>hall=
ucinations at greater dosages. Unfortunately, nausea is also rather typical=
. Children are more<br><br><br>prone to experiencing negative side effects,=
 albeit they are uncommon. Though longer trips are<br><br><br>conceivable, =
the typical high lasts six to eight hours and starts roughly 30 minutes aft=
er intake.<br><br><br>psilocybin spores<br><br><br>It=E2=80=99s debatable i=
f any of the aforementioned changes in response to strain. While some<br><b=
r><br>claim that =E2=80=9Ca cube is a cube,=E2=80=9D others contend that ea=
ch strain is unique. The latter group claims <br></div><div aria-labelledby=
=3D"c337" role=3D"region" style=3D"margin:12px 0px;overflow:auto;padding-ri=
ght:20px"><br></div></div></div></div></span></div></div></div></div></div>=
</div><div><div role=3D"region" aria-labelledby=3D"c991"><div><div style=3D=
"overflow-y:auto;outline:none"><div role=3D"list" aria-label=3D"Buy mushroo=
ms online"><span aria-expanded=3D"true" role=3D"listitem" style=3D"border-b=
ottom:1px solid rgb(232,234,237);padding-top:8px;padding-left:0px;border-le=
ft:2px solid rgb(77,144,240)"><div style=3D"outline:none"><div style=3D"dis=
play:flex"><div style=3D"min-width:0px"><div aria-labelledby=3D"c337" role=
=3D"region" style=3D"margin:12px 0px;overflow:auto;padding-right:20px"><a h=
ref=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" targ=
et=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&am=
p;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;=
ust=3D1722742753653000&amp;usg=3DAOvVaw0fS-T19PFO9hhKcdzottJi">https://t.me=
/motionking_caliweed_psychedelics</a></div><div aria-labelledby=3D"c337" ro=
le=3D"region" style=3D"margin:12px 0px;overflow:auto;padding-right:20px"><b=
r></div><div aria-labelledby=3D"c337" role=3D"region" style=3D"margin:12px =
0px;overflow:auto;padding-right:20px"><a href=3D"https://t.me/motionking_ca=
liweed_psychedelics" rel=3D"nofollow" target=3D"_blank" data-saferedirectur=
l=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_cal=
iweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1722742753653000&amp;usg=3D=
AOvVaw0fS-T19PFO9hhKcdzottJi">https://t.me/motionking_caliweed_psychedelics=
</a></div></div></div></div></span></div></div></div><div><br></div></div><=
/div><br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/fa0858d4-b580-478f-a107-314e9b660bc8n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/fa0858d4-b580-478f-a107-314e9b660bc8n%40googlegroups.co=
m</a>.<br />

------=_Part_129227_344693282.1722656452443--

------=_Part_129226_1392489130.1722656452443--
