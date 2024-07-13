Return-Path: <jailhouse-dev+bncBD37PS7EWQCRB3XXZK2AMGQEW3JVAFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB749306BF
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2024 19:40:00 +0200 (CEST)
Received: by mail-yb1-xb3a.google.com with SMTP id 3f1490d57ef6-e056d640abbsf5105364276.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2024 10:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720892399; x=1721497199; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zNQ4OKZLeOeN16+mz05GnzDJ4QB+cz+Y/0ygootN6R8=;
        b=qwRl2XsTBqt0C5caJYBzU3a0ZeWA+x3AKRZSwkp3jQWtY8w/dbSUEiF3asj9gUScqp
         s2VwLKxcmttAOfGsoA8n2KMiRayKBMw5Fa8UGR3PcmZFljyjqEU+gg/PmvVpDRUrQl9u
         x967ZxdrGY+dM0xFfCZFHHMNN6pATnnN68RtA+0bSNHZBY4vRwfa4T2U1HvVSHmslSMU
         eQX0yoBUs30Qwg3cdTKmn8179ydJQXXLXK94K0m4AusH352nV40U6gCdaTZFnQMJEur1
         LAB1mjxBYOzn7eEXQQ14cRprENQjnaMAPuiv5ifEqvpKIbfAAlK0JPnKUYM+pmZsiBmR
         V56w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720892399; x=1721497199; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNQ4OKZLeOeN16+mz05GnzDJ4QB+cz+Y/0ygootN6R8=;
        b=jV41YSiSm6vItO5EY/YP0PUpbjySDotA878XstWiYdBmwa+6p1Q0kY/0mxrqSwgtRu
         4j482Yu7Pd4HvGWdprXG3W07aJbTh8KaM456N+tmAQk3/EZCRMI7ht1bjE/xwKvy17DI
         Qwuyxn6iBfIGHdlrhGklZR9idyxcuE4NYL7pwpIoNSgCcHLEgaPWVZh1xV3Dzmsp5RH1
         4HVjSz6rtoZrxhbejgsgRrCmIRJ1RYzcjZES1sLiDqYVZha1KvM6rpbkq60Rb1K7YL+X
         ePCKlJfhYTzMFC6Tw5Uklj3TizqE8QHGHkqEURh2/xi02hmEQ7arePsTn0jLBGL0ljQX
         ppUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720892399; x=1721497199;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zNQ4OKZLeOeN16+mz05GnzDJ4QB+cz+Y/0ygootN6R8=;
        b=UL0quHUCDnnmUO4ErAlUFgHAOMk/3Y3iimTyjf8UWdrVcmoVo+Pai1v9EUTArEvAOv
         12x82pwOiZ/N5YyldLHQLdI8y7DmymwJp/fUgfBBW2n30klhCOOs/66b3s9T5mmCL+TF
         w8XM4fbsa/0FRu3ppgAd8ILZGWnBT7pvVeXI4tHAGC3FULrmDbfB0ugCuf+Q5imf9+7r
         Eb1HMG0I1pnoOwXAsilVTKxEbQ+4TBQtIh09+xtoDXY/icow959WP9O4yv+a9hTjT8JN
         PAcGTkqeDiPP84dvU7COJafdQfpxJlSwG4Pi6/LISwiODNp5vY6qlwke2slDmUsAZvWZ
         b08A==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUUoD/fSQLJsDh+WSYoBUEB0nmFaZF/5tEWrP4dXGCBebUCjdhQk9amxXnPXsPPD3GpUxbw8WorTO9sHGSzyqZSEdCHJ4ylcftakJs=
X-Gm-Message-State: AOJu0Yz1SRmO9GNxlM91/KsNkgzw9bOmgeWZrLcyMC7+HlsrIcF4Aiv1
	mNfe6p5Jyro48pYmWHuEfP9NBbav9WyvDagR797y0lY629VmlX3q
X-Google-Smtp-Source: AGHT+IE2fnPqaAJui/zb6ScZXePiFYCCzXv7RJnicgTUuhzJI9eWxK8h8vf09J/RQhnL9gzyHTwfCA==
X-Received: by 2002:a05:6902:513:b0:e05:66ee:8850 with SMTP id 3f1490d57ef6-e0566ee8affmr11349137276.32.1720892399046;
        Sat, 13 Jul 2024 10:39:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:703:b0:dfd:bfdd:cd15 with SMTP id
 3f1490d57ef6-e05790307e8ls5092619276.1.-pod-prod-07-us; Sat, 13 Jul 2024
 10:39:58 -0700 (PDT)
X-Received: by 2002:a05:6902:1545:b0:e03:2f91:b93b with SMTP id 3f1490d57ef6-e041b10bc17mr1368991276.8.1720892397680;
        Sat, 13 Jul 2024 10:39:57 -0700 (PDT)
Date: Sat, 13 Jul 2024 10:39:57 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <123e461a-7311-47d6-98a3-e832b626c900n@googlegroups.com>
In-Reply-To: <3e2b70dc-50fe-4dd2-998b-bc1d74cd3a95n@googlegroups.com>
References: <25a41179-e94f-41ea-886b-7a4ffa0f87d7n@googlegroups.com>
 <69f1e9a0-1646-455c-8725-c16bfa62f058n@googlegroups.com>
 <15d75a5e-d496-43fa-a507-2399d854825cn@googlegroups.com>
 <f5cf0adf-cbc4-4186-befa-0e3f997c65d9n@googlegroups.com>
 <3e2b70dc-50fe-4dd2-998b-bc1d74cd3a95n@googlegroups.com>
Subject: Re: WERE TO BUY DMT CHOCOLATE BARS AND MUSHROOM ONLINE FOR SALE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_522992_655309981.1720892397074"
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

------=_Part_522992_655309981.1720892397074
Content-Type: multipart/alternative; 
	boundary="----=_Part_522993_1846024730.1720892397074"

------=_Part_522993_1846024730.1720892397074
Content-Type: text/plain; charset="UTF-8"


unread,

unread,

https://t.me/motionking_caliweed_psychedelics
Mushroom Belgian Milk Chocolate is not only delicious, but it equates to 4 
grams of   

https://t.me/motionking_caliweed_psychedeli 
<https://t.me/motionking_caliweed_psychedelics> psilocybin-containing 
mushrooms. Aside from the fantastic, mind-blowing effects, you get from 
eating the Mushroom and polka dot company chocolate, they are also a great 
way to microdose magic mushrooms. Microdosing magic mushrooms in the form 
of consuming mushroom chocolate bars have recently increased in 
popularity.  https://t.me/motionking_caliweed_psychedelics

https://t.me/motionking_caliweed_psychedelics

https://t.me/motionking_caliweed_psychedelics
Mushroom Belgian Milk Chocolate is not only delicious, but it equates to 4 
grams of   

https://t.me/motionking_caliweed_psychedelics

  psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing 
effects, you get from eating the Mushroom and polka dot company chocolate, 
they are also a great way to microdose magic mushrooms. Microdosing magic 
mushrooms in the form of consuming mushroom chocolate bars have recently 
increased in popularity.  https://t.me/motionking_caliweed_psychedelics

https://t.me/motionking_caliweed_psychedelics

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/123e461a-7311-47d6-98a3-e832b626c900n%40googlegroups.com.

------=_Part_522993_1846024730.1720892397074
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br /></div><div><div style=3D"align-items: center; color: rgb(95, 99,=
 104); display: flex; height: 48px; justify-content: space-between;"><span =
style=3D"clip: rect(1px, 1px, 1px, 1px); height: 1px; margin: 0px; overflow=
: hidden; padding: 0px; position: absolute; white-space: nowrap; width: 1px=
; z-index: -1000;">unread,</span><div style=3D"color: rgba(0, 0, 0, 0.87);"=
><div style=3D"align-items: center; color: rgb(95, 99, 104); display: flex;=
 height: 48px; justify-content: space-between;"><div style=3D"overflow: hid=
den; text-overflow: ellipsis; white-space: nowrap;"><span style=3D"font-fam=
ily: Roboto, Arial, sans-serif; letter-spacing: 0.25px; line-height: 20px; =
color: rgb(32, 33, 36); margin-top: 0px; margin-bottom: 0px; margin-right: =
16px;"><br /></span></div><span style=3D"clip: rect(1px, 1px, 1px, 1px); he=
ight: 1px; margin: 0px; overflow: hidden; padding: 0px; position: absolute;=
 white-space: nowrap; width: 1px; z-index: -1000;">unread,</span></div></di=
v><div role=3D"region" aria-labelledby=3D"c1097" style=3D"margin: 12px 0px;=
 overflow: auto; padding-right: 20px; color: rgba(0, 0, 0, 0.87);"><div sty=
le=3D"color: rgb(80, 0, 80);"><div><br /></div><a href=3D"https://t.me/moti=
onking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" style=3D"c=
olor: rgb(26, 115, 232);">https://t.me/motionking_caliweed_psychedelics</a>=
<br /><span aria-expanded=3D"true" role=3D"listitem" style=3D"border-bottom=
: 1px solid rgb(232, 234, 237); padding-top: 8px; padding-left: 0px; border=
-left: 2px solid rgb(77, 144, 240);"><div style=3D"outline: none;"><div sty=
le=3D"display: flex;"><div style=3D"min-width: 0px;"><div role=3D"region" a=
ria-labelledby=3D"c429" style=3D"margin: 12px 0px; overflow: auto; padding-=
right: 20px;"><div><div role=3D"region" aria-labelledby=3D"c4610" style=3D"=
margin: 12px 0px; overflow: auto; padding-right: 20px;"><div>Mushroom Belgi=
an Milk Chocolate is not only delicious, but it equates to 4 grams of=C2=A0=
=C2=A0=C2=A0</div><div><br /></div><div><a href=3D"https://t.me/motionking_=
caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" style=3D"color: r=
gb(26, 115, 232);">https://t.me/motionking_caliweed_psychedeli</a>=C2=A0psi=
locybin-containing mushrooms. Aside from the fantastic, mind-blowing effect=
s, you get from eating the Mushroom and polka dot company chocolate, they a=
re also a great way to microdose magic mushrooms. Microdosing magic mushroo=
ms in the form of consuming mushroom chocolate bars have recently increased=
 in popularity.=C2=A0=C2=A0<a href=3D"https://t.me/motionking_caliweed_psyc=
hedelics" rel=3D"nofollow" target=3D"_blank" style=3D"color: rgb(26, 115, 2=
32);">https://t.me/motionking_caliweed_psychedelics</a></div><div><br /></d=
iv><div><a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"no=
follow" target=3D"_blank" style=3D"color: rgb(26, 115, 232);">https://t.me/=
motionking_caliweed_psychedelics</a></div></div></div></div></div></div></d=
iv></span></div></div></div></div><div role=3D"region" aria-labelledby=3D"c=
1097" style=3D"margin: 12px 0px; overflow: auto; padding-right: 20px;"><div=
 style=3D"color: rgb(80, 0, 80);"><div><br /></div><a href=3D"https://t.me/=
motionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" style=
=3D"color: rgb(26, 115, 232);">https://t.me/motionking_caliweed_psychedelic=
s</a><br /><span aria-expanded=3D"true" role=3D"listitem" style=3D"border-b=
ottom: 1px solid rgb(232, 234, 237); padding-top: 8px; padding-left: 0px; b=
order-left: 2px solid rgb(77, 144, 240);"><div style=3D"outline: none;"><di=
v style=3D"display: flex;"><div style=3D"min-width: 0px;"><div role=3D"regi=
on" aria-labelledby=3D"c429" style=3D"margin: 12px 0px; overflow: auto; pad=
ding-right: 20px;"><div><div role=3D"region" aria-labelledby=3D"c4610" styl=
e=3D"margin: 12px 0px; overflow: auto; padding-right: 20px;"><div>Mushroom =
Belgian Milk Chocolate is not only delicious, but it equates to 4 grams of=
=C2=A0=C2=A0=C2=A0</div><div><br /></div><div><a href=3D"https://t.me/motio=
nking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" style=3D"co=
lor: rgb(26, 115, 232);">https://t.me/motionking_caliweed_psychedelics</a><=
/div><div><br /></div><div>=C2=A0 psilocybin-containing mushrooms. Aside fr=
om the fantastic, mind-blowing effects, you get from eating the Mushroom an=
d polka dot company chocolate, they are also a great way to microdose magic=
 mushrooms. Microdosing magic mushrooms in the form of consuming mushroom c=
hocolate bars have recently increased in popularity.=C2=A0=C2=A0<a href=3D"=
https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_=
blank" style=3D"color: rgb(26, 115, 232);">https://t.me/motionking_caliweed=
_psychedelics</a><br /></div><div><br /></div><div><a href=3D"https://t.me/=
motionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" style=
=3D"color: rgb(26, 115, 232);">https://t.me/motionking_caliweed_psychedelic=
s</a></div></div></div></div></div></div></div></span></div></div><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/123e461a-7311-47d6-98a3-e832b626c900n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/123e461a-7311-47d6-98a3-e832b626c900n%40googlegroups.co=
m</a>.<br />

------=_Part_522993_1846024730.1720892397074--

------=_Part_522992_655309981.1720892397074--
