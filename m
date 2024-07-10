Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBNEBXC2AMGQEEJ5U7ZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E97A92C936
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2024 05:32:06 +0200 (CEST)
Received: by mail-yb1-xb3d.google.com with SMTP id 3f1490d57ef6-e03a3aafc6esf9358561276.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2024 20:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720582325; x=1721187125; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sjfj3F9OoMbggpOdFqcgko0zJ1YzkficXDyn5CH4SKw=;
        b=QTRhKCX/mIrdh8R21e0R6Lqjz+3mXz+uwbj0nyJ3pwXb/hGxbFvJgZfYSvYpWtIbE/
         yX+zAGy82urrKZwnPE189Q6Ho2s+851xD+stnvOUVPzgvasiRN594g78HL9Il8dQlyFI
         4ohH8r8RJd4SeCeTY4+YhRqWpC7ZgKKOdH21mUvtaZE+2dmlhKWqsmjvh4Z9z3qHJoE2
         FrUZ5wGBeahhUswbG0qjHhoD24+jK7DgajjBcnLDmKzfMNtdCZMUTsmZbxIzK5zbgA7j
         cxGkAV5drurMB5Yj5Qi1tNiw02nZXVw1r4yw7ha7Va/BPBhoyFqfzD4za0M3zGF5Si3L
         uqGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720582325; x=1721187125; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjfj3F9OoMbggpOdFqcgko0zJ1YzkficXDyn5CH4SKw=;
        b=B7IlYmFdWT+0B8PgqM2JUNGAlscC/dR7X6kHzjde1p4sqLwOHlttISCW5mTbU3toDD
         U+4xljBTv7XTPPwwSgsnLjG0s4EFSof03cv3FcfaaN/rSzU0nAWoz75tvIa/ak6+1bBW
         gP09newdLwBkEZOAFkckKv7zIS8k7HZ+ooB0X1N76xDcIvyGUwOvFm1C9BAWmrgbS+NF
         toxt4sPFF7EuCGiXzn2NpjvHsUTlk678tLDyk9Zt45sppMV9Ggc80/3nYWH62HJRYUz3
         e3t8OjSwgEYpGJiyoT7iIHigpDrkcsN0P9mhgnm3AngXh8jSCb37e1qRuNw2LvtJF29f
         L6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720582325; x=1721187125;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sjfj3F9OoMbggpOdFqcgko0zJ1YzkficXDyn5CH4SKw=;
        b=EIJsVGkEK1oJRKOudqHmz1p6vwkwXCzO90cH+yH1aU40Z8Zoe38VZxUOidr7xfJNSv
         u/mLRoMOe14QBCt/eCHWdGgFztzyl18FbA1RBJOMWbu6iOy1yaks9kse/L86jIUGoyS8
         h/DAH4iE4J5dMLUPcMsoFtjWs8+qbixCXrUKcSd2RixiEcJ8SBcwOb6tNwHvLU9etXbS
         zKPwzahzzBA2IIYxnm45TmX+BGnmf4nhZ/Qfe/uGk7eoyX8cVDjLK3xFOynfo/fykwtn
         68jg7kwheMooYCby0tiD/P827mefg6c7FxDFsneSzHUeLPB8Gtw1Vevk3Ua0kbXTsacp
         Tuwg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXBVBCoNJNP2ik0Ho4GQaBy6960zTN6XlsEyjJll2kjdPE770ZXHV5WjeyruETo5rOthEJxGvglyQ2b0MVRMTAqoPRmtczx8FAxkG8=
X-Gm-Message-State: AOJu0YxRVEzSRJjDqVPjIS3g8trj175skLATx8b5VeE+Yedou/Xh3aSM
	mQYUR32aTqrjTmaiKpJFBHdW30BfMCaqDws7e9EwX09OAJyQvDw4
X-Google-Smtp-Source: AGHT+IEXveLWMEUwHZ+th29MwpKkAi0DFaUfYRmFBL71D6Gt6Ny/+5g30ZPWbxTvEjW6MoXY4wXruA==
X-Received: by 2002:a25:b2a4:0:b0:dff:33f5:478b with SMTP id 3f1490d57ef6-e041b1bf132mr4939679276.61.1720582325432;
        Tue, 09 Jul 2024 20:32:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:102a:b0:e03:bbb7:44d9 with SMTP id
 3f1490d57ef6-e03bce3feb8ls9309675276.0.-pod-prod-08-us; Tue, 09 Jul 2024
 20:32:04 -0700 (PDT)
X-Received: by 2002:a05:6902:e01:b0:e05:6026:f741 with SMTP id 3f1490d57ef6-e056026f8aemr19445276.2.1720582323885;
        Tue, 09 Jul 2024 20:32:03 -0700 (PDT)
Date: Tue, 9 Jul 2024 20:32:03 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2d5d2ca6-266b-4317-907d-de92f9f02da3n@googlegroups.com>
In-Reply-To: <2f1d07e7-fa2d-4336-8433-1a41fd7d2dban@googlegroups.com>
References: <0a9db60d-e86b-4b33-b7d1-d609b9f786d6n@googlegroups.com>
 <e9bb3fdc-1bcf-4554-b34e-55f0e21c993en@googlegroups.com>
 <a7287bcc-f3a3-460c-bd92-cd118fef4e99n@googlegroups.com>
 <c4f9e9c3-c55d-48ac-b51a-f19e7a018c79n@googlegroups.com>
 <9a5eb3d1-06fa-4e78-9311-955f8d60e149n@googlegroups.com>
 <2f1d07e7-fa2d-4336-8433-1a41fd7d2dban@googlegroups.com>
Subject: Re: Buy DMT mushrooms chocolate bars only
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_92770_123353437.1720582323164"
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

------=_Part_92770_123353437.1720582323164
Content-Type: multipart/alternative; 
	boundary="----=_Part_92771_731128617.1720582323164"

------=_Part_92771_731128617.1720582323164
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


https://t.me/motionking_caliweed_psychedelics

psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=20
effects, you get from eating the Mushroom and polka dot company chocolate,=
=20
they are also a great way to microdose magic mushrooms. Microdosing magic=
=20
mushrooms in the form of consuming mushroom chocolate bars have recently=20
increased in popularity.  https://t.me/motionking_caliweed_psychedelics

https://t.me/motionking_caliweed_psychedelics


https://t.me/motionking_caliweed_psychedelics
On Wednesday, July 10, 2024 at 4:30:20=E2=80=AFAM UTC+1 Asah Randy wrote:

>
>
>
>
>
> https://t.me/motionking_caliweed_psychedelics
>
> psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=
=20
> effects, you get from eating the Mushroom and polka dot company chocolate=
,=20
> they are also a great way to microdose magic mushrooms. Microdosing magic=
=20
> mushrooms in the form of consuming mushroom chocolate bars have recently=
=20
> increased in popularity.  https://t.me/motionking_caliweed_psychedelics
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
jailhouse-dev/2d5d2ca6-266b-4317-907d-de92f9f02da3n%40googlegroups.com.

------=_Part_92771_731128617.1720582323164
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br /></div><div><a href=3D"https://t.me/motionking_caliweed_psychedel=
ics" rel=3D"nofollow" target=3D"_blank" style=3D"color: rgb(26, 115, 232);"=
>https://t.me/motionking_caliweed_psychedelics</a><br /></div><div><br /></=
div><div><div style=3D"color: rgb(80, 0, 80);">psilocybin-containing mushro=
oms. Aside from the fantastic, mind-blowing effects, you get from eating th=
e Mushroom and polka dot company chocolate, they are also a great way to mi=
crodose magic mushrooms. Microdosing magic mushrooms in the form of consumi=
ng mushroom chocolate bars have recently increased in popularity.=C2=A0=C2=
=A0<a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollo=
w" target=3D"_blank" style=3D"color: rgb(26, 115, 232);">https://t.me/motio=
nking_caliweed_psychedelics</a><br /></div><div style=3D"color: rgb(80, 0, =
80);"><br /></div><div style=3D"color: rgb(80, 0, 80);"><a href=3D"https://=
t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" s=
tyle=3D"color: rgb(26, 115, 232);">https://t.me/motionking_caliweed_psyched=
elics</a></div><br /></div><br /><a href=3D"https://t.me/motionking_caliwee=
d_psychedelics" rel=3D"nofollow" target=3D"_blank" style=3D"color: rgb(26, =
115, 232);">https://t.me/motionking_caliweed_psychedelics</a><br /><div cla=
ss=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Wednesday, Jul=
y 10, 2024 at 4:30:20=E2=80=AFAM UTC+1 Asah Randy wrote:<br/></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px so=
lid rgb(204, 204, 204); padding-left: 1ex;"><div><br></div><div><br></div><=
div><div style=3D"color:rgb(95,99,104);display:flex;min-height:48px"><div s=
tyle=3D"overflow:hidden;text-overflow:ellipsis;white-space:nowrap"><span st=
yle=3D"font-family:Roboto,Arial,sans-serif;letter-spacing:0.25px;line-heigh=
t:20px;color:rgb(32,33,36);margin-top:0px;margin-bottom:0px;margin-right:16=
px"><br><br></span></div><span style=3D"min-height:1px;margin:0px;overflow:=
hidden;padding:0px;white-space:nowrap;width:1px"></span><div style=3D"font-=
family:Roboto,Arial,sans-serif;font-size:12px;letter-spacing:0.3px;line-hei=
ght:16px;display:flex"><br></div></div></div><div role=3D"region" aria-labe=
lledby=3D"c2560" style=3D"margin:12px 0px;overflow:auto;padding-right:20px"=
><div style=3D"color:rgb(80,0,80)"><div><a href=3D"https://t.me/motionking_=
caliweed_psychedelics" rel=3D"nofollow" style=3D"color:rgb(26,115,232)" tar=
get=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp=
;ust=3D1720668622263000&amp;usg=3DAOvVaw0QL3cS1NxKYY-qdgufRfRY">https://t.m=
e/motionking_caliweed_psychedelics</a></div><div><br></div><div><div>psiloc=
ybin-containing mushrooms. Aside from the fantastic, mind-blowing effects, =
you get from eating the Mushroom and polka dot company chocolate, they are =
also a great way to microdose magic mushrooms. Microdosing magic mushrooms =
in the form of consuming mushroom chocolate bars have recently increased in=
 popularity.=C2=A0=C2=A0<a href=3D"https://t.me/motionking_caliweed_psyched=
elics" rel=3D"nofollow" style=3D"color:rgb(26,115,232)" target=3D"_blank" d=
ata-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t=
.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D172066862=
2263000&amp;usg=3DAOvVaw0QL3cS1NxKYY-qdgufRfRY">https://t.me/motionking_cal=
iweed_psychedelics</a><br></div><div><br></div><div><a href=3D"https://t.me=
/motionking_caliweed_psychedelics" rel=3D"nofollow" style=3D"color:rgb(26,1=
15,232)" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/u=
rl?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=
=3Dgmail&amp;ust=3D1720668622263000&amp;usg=3DAOvVaw0QL3cS1NxKYY-qdgufRfRY"=
>https://t.me/motionking_caliweed_psychedelics</a></div><div><br></div></di=
v></div></div><br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2d5d2ca6-266b-4317-907d-de92f9f02da3n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2d5d2ca6-266b-4317-907d-de92f9f02da3n%40googlegroups.co=
m</a>.<br />

------=_Part_92771_731128617.1720582323164--

------=_Part_92770_123353437.1720582323164--
