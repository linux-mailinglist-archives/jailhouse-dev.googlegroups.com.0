Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBGMCY62AMGQEFQS6I4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb37.google.com (mail-yb1-xb37.google.com [IPv6:2607:f8b0:4864:20::b37])
	by mail.lfdr.de (Postfix) with ESMTPS id AB45093027A
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2024 01:49:47 +0200 (CEST)
Received: by mail-yb1-xb37.google.com with SMTP id 3f1490d57ef6-e0365571f87sf660561276.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jul 2024 16:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720828186; x=1721432986; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Db38PKtuFJ47to46tmOxOoZWg0pgvdDlMoJsdJOLX0I=;
        b=ikXMWD58pgE9rZu54E+Veki2Ff9gIJEMEomW1TjkrCOB3ixB0NTnuTAof77I0so3qT
         J8xwlDFyuwXx0TPPBNuHd+XswAxJfeyllYIpmB3BYhrpKi9tltpg5W2vvTlqAIqksOKX
         zfg2DhZ1cadCaHJotv5wTf2h/DWwvgLg3TKG7T3JzpQ0DMs+OmRFsWhM6qemYSEkWWVP
         MLJ3yMLZpTzjdxtxR2m/ez2C/ta+OYMxJOtxUOHmMhHGohXhH10LnlH8KcjrheBbqdzS
         5viZInI8EqZ0FBYKsdwpNGsPz5JAR5wp38USCRIc3+7IRWUUnUDCJn71fjkjpQpDmtTq
         Ykcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720828186; x=1721432986; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Db38PKtuFJ47to46tmOxOoZWg0pgvdDlMoJsdJOLX0I=;
        b=U63TWf9qyvkUcCuMuK52sKfivZsLauM+kkSPL2wf4UXi6hvUnwUCvEuwkdkwb3GWsN
         8Mj4zyXNgXKO3+1dFXu79Tynuhyh7avzOLVMsp86tAgA1+r2986/pckLL+yzAC5Fm7Jx
         aaOa+kCbizVlOFxKqB8hqt3etPpwp3k+NLnbH3J0UtTd+6MfhIRAABQsg0rfPAmFQuuu
         T/izPxphPTzARu0HwPlRnWKLQ4ka2kRKsEFlqRVeoiLxtqQOLagEdQdWVyxR2LBCRm79
         qWe3oeAUt8/Z0w3Qe02JQm0FSR/kOmDl2a3kI8X/atksfoMP4/zbpI6NWkUtzZMdiUTm
         eN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720828186; x=1721432986;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Db38PKtuFJ47to46tmOxOoZWg0pgvdDlMoJsdJOLX0I=;
        b=Qc2kSS7LoPTvpt1U6mklM43YIZOvQoTWsKtF7aALZu1y1vflwGvwDXCdu5EUPQcWBU
         s5ZYY8AX9W2JB6DLSIMFlj0gbqZ4CjtmorRyTpzjuly4OBYX7QcRfQ1+XDJHhYW/BTAq
         SEqOf5ABJvm8eZlkkiTMcE2ZWT0Z7N/2XuDUrSCHdTLuby45jqH72usMZ4YIRsgSwFeR
         YAbzjcpMquTAlS73xvsxxh9QhVfLPvC66bPsV7o5furrEVSQZ47UgRay/l4YWhTgtW0e
         heXbOg5EomnvxsYsQOnN5yCwMfnF+eX/2qWq+kVZZ/3BetAOfrqa9gv5/O1QTJYXihIS
         OAuQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCW3yNfLDmMbEFq3ufXpHK/JGCRnI1yLMcV1i0pp26R+mMbwkv8AH7BnmrFwl5JtqXwWGHkSVhayC5Oc+5EWLD5TSGq4ab3U+l7iunM=
X-Gm-Message-State: AOJu0YyKxWbUIsi+YZ054DaImJFLEJWsDxXOz4Ka0TGlXuujWdwpW6aC
	Waj5C7bsFyDOAUHMX1QPBdxc8V6BuxwGEmBaQsp8+KIzqesULu6+
X-Google-Smtp-Source: AGHT+IEx5wlKFuTd9qnNaz0rJGG7SOdFNUJoz1YVKJyBEGXKGO935bxUqRXgeSnbHZKuL83jPTMpFg==
X-Received: by 2002:a25:d897:0:b0:e03:b3b5:8d9e with SMTP id 3f1490d57ef6-e0578f43fdcmr5955673276.5.1720828186505;
        Fri, 12 Jul 2024 16:49:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:102b:b0:e03:2512:6e62 with SMTP id
 3f1490d57ef6-e0578ea7f03ls315581276.0.-pod-prod-06-us; Fri, 12 Jul 2024
 16:49:45 -0700 (PDT)
X-Received: by 2002:a05:6902:2586:b0:e02:c619:73d with SMTP id 3f1490d57ef6-e041b070201mr578194276.5.1720828184947;
        Fri, 12 Jul 2024 16:49:44 -0700 (PDT)
Date: Fri, 12 Jul 2024 16:49:44 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <15d75a5e-d496-43fa-a507-2399d854825cn@googlegroups.com>
In-Reply-To: <69f1e9a0-1646-455c-8725-c16bfa62f058n@googlegroups.com>
References: <25a41179-e94f-41ea-886b-7a4ffa0f87d7n@googlegroups.com>
 <69f1e9a0-1646-455c-8725-c16bfa62f058n@googlegroups.com>
Subject: Re: WERE TO BUY DMT CHOCOLATE BARS AND MUSHROOM ONLINE FOR SALE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_242528_130105900.1720828184322"
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

------=_Part_242528_130105900.1720828184322
Content-Type: multipart/alternative; 
	boundary="----=_Part_242529_1430301726.1720828184322"

------=_Part_242529_1430301726.1720828184322
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/motionking_caliweed_psychedelics

Mushroom Belgian Milk Chocolate is not only delicious, but it equates to 4=
=20
grams of     https://t.me/motionking_caliweed_psychedelics   =20
psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=20
effects, you get from eating the Mushroom and polka dot company chocolate,=
=20
they are also a great way to microdose magic mushrooms. Microdosing magic=
=20
mushrooms in the form of consuming mushroom chocolate bars have recently=20
increased in popularity.  https://t.me/motionking_caliweed_psychedelics =20
https://t.me/motionking_caliweed_psychedelics=20

https://t.me/motionking_caliweed_psychedelics


https://t.me/motionking_caliweed_psyched=20
<https://t.me/motionking_caliweed_psychedelics>

On Friday, July 12, 2024 at 5:48:54=E2=80=AFPM UTC-6 Asah Randy wrote:

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
> https://t.me/motionking_caliweed_psychedelics

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/15d75a5e-d496-43fa-a507-2399d854825cn%40googlegroups.com.

------=_Part_242529_1430301726.1720828184322
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>https://t.me/motionking_caliweed_psychedelics</div><div><br /></div><d=
iv><div><div>Mushroom Belgian Milk Chocolate is not only delicious, but it =
equates to 4 grams of=C2=A0=C2=A0=C2=A0=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank"=
 rel=3D"nofollow">https://t.me/motionking_caliweed_psychedelics</a>=C2=A0=
=C2=A0=C2=A0
 psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing
 effects, you get from eating the Mushroom and polka dot company=20
chocolate, they are also a great way to microdose magic mushrooms.=20
Microdosing magic mushrooms in the form of consuming mushroom chocolate=20
bars have recently increased in popularity.=C2=A0 <a href=3D"https://t.me/m=
otionking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow">https:/=
/t.me/motionking_caliweed_psychedelics</a>=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank"=
 rel=3D"nofollow">https://t.me/motionking_caliweed_psychedelics</a> <br /><=
/div><div><br /></div></div><div><a href=3D"https://t.me/motionking_caliwee=
d_psychedelics" target=3D"_blank" rel=3D"nofollow">https://t.me/motionking_=
caliweed_psychedelics</a></div><div><br /></div><div><br /></div><a href=3D=
"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank" rel=3D"no=
follow">https://t.me/motionking_caliweed_psyched</a></div><br /><div class=
=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Friday, July 12,=
 2024 at 5:48:54=E2=80=AFPM UTC-6 Asah Randy wrote:<br/></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid r=
gb(204, 204, 204); padding-left: 1ex;"><div><a href=3D"https://t.me/motionk=
ing_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionki=
ng_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1720914537045000&amp;=
usg=3DAOvVaw2ngbTBCg9AT5KAKWY46x1z">https://t.me/motionking_caliweed_psyche=
delics</a></div><div><br></div><div>Mushroom Belgian Milk Chocolate is not =
only delicious, but it equates to 4 grams of=C2=A0=C2=A0=C2=A0=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank"=
 rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3De=
n&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&=
amp;ust=3D1720914537045000&amp;usg=3DAOvVaw2ngbTBCg9AT5KAKWY46x1z">https://=
t.me/motionking_caliweed_psychedelics</a>=C2=A0=C2=A0=C2=A0 psilocybin-cont=
aining mushrooms. Aside from the fantastic, mind-blowing effects, you get f=
rom eating the Mushroom and polka dot company chocolate, they are also a gr=
eat way to microdose magic mushrooms. Microdosing magic mushrooms in the fo=
rm of consuming mushroom chocolate bars have recently increased in populari=
ty.=C2=A0 <a href=3D"https://t.me/motionking_caliweed_psychedelics" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;sour=
ce=3Dgmail&amp;ust=3D1720914537045000&amp;usg=3DAOvVaw2ngbTBCg9AT5KAKWY46x1=
z">https://t.me/motionking_caliweed_psychedelics</a>=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank"=
 rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3De=
n&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&=
amp;ust=3D1720914537045000&amp;usg=3DAOvVaw2ngbTBCg9AT5KAKWY46x1z">https://=
t.me/motionking_caliweed_psychedelics</a> <br></div><div><br></div><div><a =
href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp=
;ust=3D1720914537045000&amp;usg=3DAOvVaw2ngbTBCg9AT5KAKWY46x1z">https://t.m=
e/motionking_caliweed_psychedelics</a></div><div><br></div><div><br></div><=
a href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank" =
rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den=
&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&a=
mp;ust=3D1720914537045000&amp;usg=3DAOvVaw2ngbTBCg9AT5KAKWY46x1z">https://t=
.me/motionking_caliweed_psychedelics</a></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/15d75a5e-d496-43fa-a507-2399d854825cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/15d75a5e-d496-43fa-a507-2399d854825cn%40googlegroups.co=
m</a>.<br />

------=_Part_242529_1430301726.1720828184322--

------=_Part_242528_130105900.1720828184322--
