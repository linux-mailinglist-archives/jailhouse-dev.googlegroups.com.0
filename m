Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBG7WZK2AMGQEU3YAZYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id D26E59306BC
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2024 19:36:29 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-e03a3aafc6esf4919272276.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2024 10:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720892188; x=1721496988; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JXYefE3bnt94FlZx8KdUQUjHOOsC2/zCirIV1l7XYeo=;
        b=DRzYbTM5QAC92U6Sa7gNjhgC+oJoYRr29f6dePi1/8Pqs5RQ0umF5MhY+W566wGUzg
         VqFHKwtPPqXBtMIAXlKphHCT4+OMMp5FfLPBmX+LZHJYGXiGO7iWC1H8zDtgYR+dyGoN
         FY9JdpY0wsYelTS6d3dd6hmF9THvlUkFgRYQK5mCpj7NX75wwetMtakXO/rrrnvV0EXo
         OGfz5yPBp0cyicSCQoOCDw/jZ+e/XD++sMcN8YOAnoknqA/oDKacqj0JCsClr/t+l3oY
         UhnW4WdS9Ktq2O94cgi//T8mlB76i8Ht9sVFSpeh+VTY1MZyHRfK1Tp57PBQ++O4BSnO
         n8ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720892188; x=1721496988; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXYefE3bnt94FlZx8KdUQUjHOOsC2/zCirIV1l7XYeo=;
        b=WDW8QiSiE2n2hcwQf/pVTQIYgcWfweUxAWTGhKBPm+2J0zyX3HIp9JtE5PHkloDATk
         U6nQLDe9jCe67s75HbV4xPxbowusVgDw91UCsLarsZRBQitQ272BVPKNor1G58AhlrL0
         B3GIhRNf5wsXUIaBgdmjE5TBuMiSQXTCWfzzl9PePoNw2W89N5SXHXH6C+iFxrZ4N4Cj
         01siWi3wr7uwC3VjAJUXP6I8fcy3mCgMpOPJGuHyFbgdQqcHbRLDM8hQPZq4iMHgYOPg
         frw+W9rzgGSYK1ieQfTrwIRs9FpxBlj9++va71OruXFjyDR19bImH6T9MiVOdSNYRnUe
         XXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720892188; x=1721496988;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JXYefE3bnt94FlZx8KdUQUjHOOsC2/zCirIV1l7XYeo=;
        b=q0G9UWnJgWRJuXZtVLAGEBrciZ9tQwedRPiw2JLtEwB2fMm7uxjgwZ7s0ZoI1Ve5Rd
         TkaWCaVOvK9+cgbL1Jck7j+wWCPGhuYZAqtmwVVCrJHMfdGjOoKNJtmvU9+wVoZNi1xt
         MWVFZY6S5jXmWwp8XYdxZbkgvi6AFBiF9oFxzyxbs5lxQr+1f2euK7SrDxqbY7pGT5Zc
         67Kcj9ZcKjINaR4JOh62vuwknnGrEajhz1RGFY0kf51WrB+zIVLbnbxHWzAu3Yk+aNvL
         /Opkn71kU/Rey+/JkY0eSmr/31OxtBB9Qdl29e2R+asA3TSeyDanQ3TYyC5ROzXfi4m5
         MaTw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWbH6E+0DBFvgzsUPNQyLYDxkzb5mRdzyUkVmzc+8bdrU+445tnD1gB0T/QH3WVFzmANYnPfpC7qtSTeueNf2BBs8W5vdNhUbtgnH4=
X-Gm-Message-State: AOJu0YwRiqR22IETPgxOf0yickF60lPwhJ7xeJ2K+rhGkgvMqv3QBaCY
	Av4XbvA9L+ZeHgLjqqg9W7D9a4DBzUlgI5giHP3cD5P2Ue46PVpW
X-Google-Smtp-Source: AGHT+IEjp6T7iAzORSuBa3i/Kf2ggrlAfAN92Hm5reKc+HhbnDJJbfe7yKE47BHVcObtBeDYkPzcAQ==
X-Received: by 2002:a25:ce11:0:b0:e03:a983:3d83 with SMTP id 3f1490d57ef6-e041b078df6mr17402011276.27.1720892188578;
        Sat, 13 Jul 2024 10:36:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1896:b0:e02:c175:85f8 with SMTP id
 3f1490d57ef6-e05790394f3ls4547460276.1.-pod-prod-04-us; Sat, 13 Jul 2024
 10:36:27 -0700 (PDT)
X-Received: by 2002:a05:6902:1507:b0:e03:5b06:6db2 with SMTP id 3f1490d57ef6-e041b0347b7mr42568276.3.1720892187069;
        Sat, 13 Jul 2024 10:36:27 -0700 (PDT)
Date: Sat, 13 Jul 2024 10:36:26 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f5cf0adf-cbc4-4186-befa-0e3f997c65d9n@googlegroups.com>
In-Reply-To: <15d75a5e-d496-43fa-a507-2399d854825cn@googlegroups.com>
References: <25a41179-e94f-41ea-886b-7a4ffa0f87d7n@googlegroups.com>
 <69f1e9a0-1646-455c-8725-c16bfa62f058n@googlegroups.com>
 <15d75a5e-d496-43fa-a507-2399d854825cn@googlegroups.com>
Subject: Re: WERE TO BUY DMT CHOCOLATE BARS AND MUSHROOM ONLINE FOR SALE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_389816_1579817253.1720892186270"
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

------=_Part_389816_1579817253.1720892186270
Content-Type: multipart/alternative; 
	boundary="----=_Part_389817_518614178.1720892186270"

------=_Part_389817_518614178.1720892186270
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Mushroom Belgian Milk Chocolate is not only delicious, but it equates to 4=
=20
grams of  =20

https://t.me/motionking_caliweed_psychedelics

  psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=
=20
effects, you get from eating the Mushroom and polka dot company chocolate,=
=20
they are also a great way to microdose magic mushrooms. Microdosing magic=
=20
mushrooms in the form of consuming mushroom chocolate bars have recently=20
increased in popularity.  https://t.me/motionking_caliweed_psychedelics

https://t.me/motionking_caliweed_psychedelics

On Saturday, July 13, 2024 at 12:49:44=E2=80=AFAM UTC+1 Asah Randy wrote:

> https://t.me/motionking_caliweed_psychedelics
>
> Mushroom Belgian Milk Chocolate is not only delicious, but it equates to =
4=20
> grams of     https://t.me/motionking_caliweed_psychedelics   =20
> psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=
=20
> effects, you get from eating the Mushroom and polka dot company chocolate=
,=20
> they are also a great way to microdose magic mushrooms. Microdosing magic=
=20
> mushrooms in the form of consuming mushroom chocolate bars have recently=
=20
> increased in popularity.  https://t.me/motionking_caliweed_psychedelics =
=20
> https://t.me/motionking_caliweed_psychedelics=20
>
> https://t.me/motionking_caliweed_psychedelics
>
>
> https://t.me/motionking_caliweed_psyched=20
> <https://t.me/motionking_caliweed_psychedelics>
>
> On Friday, July 12, 2024 at 5:48:54=E2=80=AFPM UTC-6 Asah Randy wrote:
>
>> https://t.me/motionking_caliweed_psychedelics
>>
>> Mushroom Belgian Milk Chocolate is not only delicious, but it equates to=
=20
>> 4 grams of     https://t.me/motionking_caliweed_psychedelics   =20
>> psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=
=20
>> effects, you get from eating the Mushroom and polka dot company chocolat=
e,=20
>> they are also a great way to microdose magic mushrooms. Microdosing magi=
c=20
>> mushrooms in the form of consuming mushroom chocolate bars have recently=
=20
>> increased in popularity.  https://t.me/motionking_caliweed_psychedelics =
=20
>> https://t.me/motionking_caliweed_psychedelics=20
>>
>> https://t.me/motionking_caliweed_psychedelics
>>
>>
>> https://t.me/motionking_caliweed_psychedelics
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f5cf0adf-cbc4-4186-befa-0e3f997c65d9n%40googlegroups.com.

------=_Part_389817_518614178.1720892186270
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br /></div><div>Mushroom Belgian Milk Chocolate is not only delicious=
, but it equates to 4 grams of=C2=A0=C2=A0=C2=A0</div><div><br /></div><div=
><a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow"=
 target=3D"_blank" style=3D"color: rgb(26, 115, 232);">https://t.me/motionk=
ing_caliweed_psychedelics</a></div><div><br /></div><div>=C2=A0 psilocybin-=
containing mushrooms. Aside from the fantastic, mind-blowing effects, you g=
et from eating the Mushroom and polka dot company chocolate, they are also =
a great way to microdose magic mushrooms. Microdosing magic mushrooms in th=
e form of consuming mushroom chocolate bars have recently increased in popu=
larity.=C2=A0=C2=A0<a href=3D"https://t.me/motionking_caliweed_psychedelics=
" rel=3D"nofollow" target=3D"_blank" style=3D"color: rgb(26, 115, 232);">ht=
tps://t.me/motionking_caliweed_psychedelics</a><br /></div><div><br /></div=
><div><a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofo=
llow" target=3D"_blank" style=3D"color: rgb(26, 115, 232);">https://t.me/mo=
tionking_caliweed_psychedelics</a></div><br /><div class=3D"gmail_quote"><d=
iv dir=3D"auto" class=3D"gmail_attr">On Saturday, July 13, 2024 at 12:49:44=
=E2=80=AFAM UTC+1 Asah Randy wrote:<br/></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204=
); padding-left: 1ex;"><div><a href=3D"https://t.me/motionking_caliweed_psy=
chedelics" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https=
://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psyc=
hedelics&amp;source=3Dgmail&amp;ust=3D1720978572450000&amp;usg=3DAOvVaw07Jo=
jYEiS7TKdCoeh52hrx">https://t.me/motionking_caliweed_psychedelics</a></div>=
<div><br></div><div><div><div>Mushroom Belgian Milk Chocolate is not only d=
elicious, but it equates to 4 grams of=C2=A0=C2=A0=C2=A0=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" =
target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3De=
n&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&=
amp;ust=3D1720978572450000&amp;usg=3DAOvVaw07JojYEiS7TKdCoeh52hrx">https://=
t.me/motionking_caliweed_psychedelics</a>=C2=A0=C2=A0=C2=A0
 psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing
 effects, you get from eating the Mushroom and polka dot company=20
chocolate, they are also a great way to microdose magic mushrooms.=20
Microdosing magic mushrooms in the form of consuming mushroom chocolate=20
bars have recently increased in popularity.=C2=A0 <a href=3D"https://t.me/m=
otionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" data-sa=
feredirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/mo=
tionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D172097857245000=
0&amp;usg=3DAOvVaw07JojYEiS7TKdCoeh52hrx">https://t.me/motionking_caliweed_=
psychedelics</a>=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" =
target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3De=
n&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&=
amp;ust=3D1720978572450000&amp;usg=3DAOvVaw07JojYEiS7TKdCoeh52hrx">https://=
t.me/motionking_caliweed_psychedelics</a> <br></div><div><br></div></div><d=
iv><a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollo=
w" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgm=
ail&amp;ust=3D1720978572450000&amp;usg=3DAOvVaw07JojYEiS7TKdCoeh52hrx">http=
s://t.me/motionking_caliweed_psychedelics</a></div><div><br></div><div><br>=
</div><a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofo=
llow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?=
hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3D=
gmail&amp;ust=3D1720978572450000&amp;usg=3DAOvVaw07JojYEiS7TKdCoeh52hrx">ht=
tps://t.me/motionking_caliweed_psyched</a></div><br><div class=3D"gmail_quo=
te"><div dir=3D"auto" class=3D"gmail_attr">On Friday, July 12, 2024 at 5:48=
:54=E2=80=AFPM UTC-6 Asah Randy wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div><a href=3D"https://t.me/motionking_caliweed_psychedel=
ics" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www=
.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedeli=
cs&amp;source=3Dgmail&amp;ust=3D1720978572450000&amp;usg=3DAOvVaw07JojYEiS7=
TKdCoeh52hrx">https://t.me/motionking_caliweed_psychedelics</a></div><div><=
br></div><div>Mushroom Belgian Milk Chocolate is not only delicious, but it=
 equates to 4 grams of=C2=A0=C2=A0=C2=A0=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" =
target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3De=
n&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&=
amp;ust=3D1720978572450000&amp;usg=3DAOvVaw07JojYEiS7TKdCoeh52hrx">https://=
t.me/motionking_caliweed_psychedelics</a>=C2=A0=C2=A0=C2=A0 psilocybin-cont=
aining mushrooms. Aside from the fantastic, mind-blowing effects, you get f=
rom eating the Mushroom and polka dot company chocolate, they are also a gr=
eat way to microdose magic mushrooms. Microdosing magic mushrooms in the fo=
rm of consuming mushroom chocolate bars have recently increased in populari=
ty.=C2=A0 <a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"=
nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/=
url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;sourc=
e=3Dgmail&amp;ust=3D1720978572450000&amp;usg=3DAOvVaw07JojYEiS7TKdCoeh52hrx=
">https://t.me/motionking_caliweed_psychedelics</a>=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" =
target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3De=
n&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&=
amp;ust=3D1720978572450000&amp;usg=3DAOvVaw07JojYEiS7TKdCoeh52hrx">https://=
t.me/motionking_caliweed_psychedelics</a> <br></div><div><br></div><div><a =
href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" tar=
get=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp=
;ust=3D1720978572450000&amp;usg=3DAOvVaw07JojYEiS7TKdCoeh52hrx">https://t.m=
e/motionking_caliweed_psychedelics</a></div><div><br></div><div><br></div><=
a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" t=
arget=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den=
&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&a=
mp;ust=3D1720978572450000&amp;usg=3DAOvVaw07JojYEiS7TKdCoeh52hrx">https://t=
.me/motionking_caliweed_psychedelics</a></blockquote></div></blockquote></d=
iv>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f5cf0adf-cbc4-4186-befa-0e3f997c65d9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f5cf0adf-cbc4-4186-befa-0e3f997c65d9n%40googlegroups.co=
m</a>.<br />

------=_Part_389817_518614178.1720892186270--

------=_Part_389816_1579817253.1720892186270--
