Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBWPSW62AMGQEILXNIVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1140.google.com (mail-yw1-x1140.google.com [IPv6:2607:f8b0:4864:20::1140])
	by mail.lfdr.de (Postfix) with ESMTPS id 919E892C8C9
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2024 05:00:43 +0200 (CEST)
Received: by mail-yw1-x1140.google.com with SMTP id 00721157ae682-654d96c2bb5sf58707997b3.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2024 20:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720580442; x=1721185242; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WHjPXRyyMifCoeyWW8/Ze8s1bTLyrZQCQlQauTpDwIs=;
        b=GZDcI12FuXBZvp9Zm5kE35e4FH+O/MkeGTkrnZeSgGzlHEZHzIwnc2Y/9Sr3IT3jrD
         PnKPKylkHWlyN2dh6RBz7H/+FvGl79ORMxd27+EL0cuR80pPHTZer2rbXzaZ36tpQ2Dm
         Pr0aH04I41Igl6Pzr1dgj7wdBAfUiKjE3zIIGE61VPCTVlEVBWnoas3dgC1QL/sec+4h
         RrkyHAUGA/p41ekOEjv4hToFXKYxJChjZDEm/wn6zXxxHW/63w5mz0yv20fy/MubbbeK
         gq2lycZejSRgdH/gzlE6hiuGnRyJF76l0O2DMRFu5JwceQ0WlMPRl0UbA0wsu4AIX4zJ
         3AJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720580442; x=1721185242; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHjPXRyyMifCoeyWW8/Ze8s1bTLyrZQCQlQauTpDwIs=;
        b=WWfNKt8VgyU9NMhhjhhdwvdUeWMWw+QWQakHOfbwPB/DseaZ0iScL+TqlaO3qL/DRM
         TyqRgx3w8BJ1oTzZiwDvAI+JR7JALED0WxXVTsHly3QKpNewMGvi/o1Ykij0GTGJSmUF
         QA7yKiaNct1GPeC1FCrlbfca+2f4lhlJwhgMt2SJwdV17QoHkLPy1DPvaDsfeMyTELOM
         aBNSyDxn5A7VMthLKdN6yya65o96Jsrv9YW9P5WgVSh9okbJQYnXncT54+Vf8NiGbQKS
         nB2T8opXkZZiGSuEQjUH3bqZ+OegxWdsD+t3TYAGG+XZBWC3915IqgAfpSBDPuHeD9iJ
         O7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720580442; x=1721185242;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WHjPXRyyMifCoeyWW8/Ze8s1bTLyrZQCQlQauTpDwIs=;
        b=wpaMloBMe+Rs1yStnfR85/yoKERKaUnZDLOzw8uYJYswYf+HUHsWceD1NR7XXMDApK
         EEJk1d12xSMjHue1e7zDk9tCBP5dbUsjXKjMqnxKqKJVUlLS+6T47ysxq6Wk2t4aECqk
         vjgvN/0wfsSUtxmuLFvOLXOiDpkGkGVp5i3N/5/yOk5II2eAGNf3pvVacCXo+Z59pD/8
         WTVtHY6iSnOq5TXyl25LVSuIJ+bp+UlpBkvtpVvHq1NTkimahFyCGoGLellVWzXfmP4n
         1tEITwx1LDXOAcZgRZLixZsu2DTrE6ejDiplLi/kXp51+VBcqxnx9M0dv/7abTkRsfoL
         9CSQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCU0hjg038F9T4omYx031uow7jhCSO/MNFQSj69KKBTJtsZ6W7zLxORLC851lqPFESdXBgOpGcF4T2klbh5pCb1kewSNFIXUCpudWT4=
X-Gm-Message-State: AOJu0YyoFTa+N4VEOrcDOJl1Y+vZR2bWSi7HxokpbwzAs8Co/KAHuJO1
	yDHUIb5D9VUMQgKTC6iYh0QPnlSFduKlvvueEItOVLGnyoZNveoM
X-Google-Smtp-Source: AGHT+IH6zrwSPM8bDPaiWk44NmOjq8r76YYSTxtPLTTX7ZOYr3R8bYatBsMLY42fGpFzuC30qjcKVQ==
X-Received: by 2002:a25:c7ce:0:b0:e03:562c:7e92 with SMTP id 3f1490d57ef6-e041b064cbbmr5099766276.24.1720580442109;
        Tue, 09 Jul 2024 20:00:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:18d0:b0:e03:3d23:3957 with SMTP id
 3f1490d57ef6-e03bd231464ls8981409276.2.-pod-prod-05-us; Tue, 09 Jul 2024
 20:00:40 -0700 (PDT)
X-Received: by 2002:a05:6902:2403:b0:e03:554e:f396 with SMTP id 3f1490d57ef6-e041b05b915mr63749276.6.1720580440618;
        Tue, 09 Jul 2024 20:00:40 -0700 (PDT)
Date: Tue, 9 Jul 2024 20:00:39 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <09e4e05f-7dbe-4327-bd28-81ba4c1d61c4n@googlegroups.com>
In-Reply-To: <b0c1a293-aa7f-4e3a-9afa-c576dc42a378n@googlegroups.com>
References: <717d828e-db8b-4978-81c0-d4701b5cd5a6n@googlegroups.com>
 <0a1d2b6c-6168-4572-9677-b1ca4325470en@googlegroups.com>
 <b0c1a293-aa7f-4e3a-9afa-c576dc42a378n@googlegroups.com>
Subject: Re: Mushroom Belgian Milk Chocolate is not only delicious, but it
 equates to 4 grams of
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_88086_994358312.1720580439575"
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

------=_Part_88086_994358312.1720580439575
Content-Type: multipart/alternative; 
	boundary="----=_Part_88087_103292757.1720580439575"

------=_Part_88087_103292757.1720580439575
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/motionking_caliweed_psychedelics

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
increased in popularity.  https://t.me/motionking_caliweed_psychedelics=20

https://t.me/motionking_caliweed_psychedelics


On Tuesday, July 9, 2024 at 7:28:33=E2=80=AFAM UTC-6 Asah Randy wrote:

>
> Mushroom Belgian Milk Chocolate is not only delicious, but it equates to =
4=20
> grams of  =20
>
> https://t.me/motionking_caliweed_psychedelics
>
>   psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=
=20
> effects, you get from eating the Mushroom and polka dot company chocolate=
,=20
> they are also a great way to microdose magic mushrooms. Microdosing magic=
=20
> mushrooms in the form of consuming mushroom chocolate bars have recently=
=20
> increased in popularity.  https://t.me/motionking_caliweed_psychedelics=
=20
>
> https://t.me/motionking_caliweed_psychedelics
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/09e4e05f-7dbe-4327-bd28-81ba4c1d61c4n%40googlegroups.com.

------=_Part_88087_103292757.1720580439575
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>https://t.me/motionking_caliweed_psychedelics</div><div><br /></div><d=
iv><span tabindex=3D"0" role=3D"listitem" aria-expanded=3D"true"><div tabin=
dex=3D"-1"><div><div><div role=3D"region" aria-labelledby=3D"c99"><div>Mush=
room Belgian Milk Chocolate is not only delicious, but it equates to 4 gram=
s of=C2=A0=C2=A0=C2=A0</div><div><br /></div><div><a href=3D"https://t.me/m=
otionking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow">https:/=
/t.me/motionking_caliweed_psychedelics</a></div><div><br /></div><div>=C2=
=A0
psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=20
effects, you get from eating the Mushroom and polka dot company=20
chocolate, they are also a great way to microdose magic mushrooms.=20
Microdosing magic mushrooms in the form of consuming mushroom chocolate=20
bars have recently increased in popularity.=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank"=
 rel=3D"nofollow">https://t.me/motionking_caliweed_psychedelics</a> <br /><=
/div><div><br /></div><div><a href=3D"https://t.me/motionking_caliweed_psyc=
hedelics" target=3D"_blank" rel=3D"nofollow">https://t.me/motionking_caliwe=
ed_psychedelics</a></div></div></div></div><div><div></div></div></div></sp=
an><span tabindex=3D"0" role=3D"listitem" aria-expanded=3D"false"><div tabi=
ndex=3D"-1"><div><div aria-hidden=3D"true"><div><div><br /></div></div></di=
v></div></div></span></div><br /><div class=3D"gmail_quote"><div dir=3D"aut=
o" class=3D"gmail_attr">On Tuesday, July 9, 2024 at 7:28:33=E2=80=AFAM UTC-=
6 Asah Randy wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left:=
 1ex;"><div><br></div><div><div>Mushroom Belgian Milk Chocolate is not only=
 delicious, but it equates to 4 grams of=C2=A0=C2=A0=C2=A0</div><div><br></=
div><div><a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"n=
ofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/u=
rl?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=
=3Dgmail&amp;ust=3D1720666774304000&amp;usg=3DAOvVaw3jGokM7mancstHUKIFakrB"=
>https://t.me/motionking_caliweed_psychedelics</a></div><div><br></div><div=
>=C2=A0
psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=20
effects, you get from eating the Mushroom and polka dot company=20
chocolate, they are also a great way to microdose magic mushrooms.=20
Microdosing magic mushrooms in the form of consuming mushroom chocolate=20
bars have recently increased in popularity.=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" =
target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3De=
n&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&=
amp;ust=3D1720666774304000&amp;usg=3DAOvVaw3jGokM7mancstHUKIFakrB">https://=
t.me/motionking_caliweed_psychedelics</a> <br></div><div><br></div><div><a =
href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" tar=
get=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp=
;ust=3D1720666774304000&amp;usg=3DAOvVaw3jGokM7mancstHUKIFakrB">https://t.m=
e/motionking_caliweed_psychedelics</a></div></div><br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/09e4e05f-7dbe-4327-bd28-81ba4c1d61c4n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/09e4e05f-7dbe-4327-bd28-81ba4c1d61c4n%40googlegroups.co=
m</a>.<br />

------=_Part_88087_103292757.1720580439575--

------=_Part_88086_994358312.1720580439575--
