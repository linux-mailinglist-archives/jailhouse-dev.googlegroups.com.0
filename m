Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBMMA6WZAMGQEKAJB7AQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id C16818D7AA2
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Jun 2024 06:01:55 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id 3f1490d57ef6-df78fddad5dsf7845335276.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 02 Jun 2024 21:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717387314; x=1717992114; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+33XLDIC/Bneij/bmDYEINOoQ7BPclweFGSViyOzvm4=;
        b=NoCHv5+p9+d0OFLVZ+awDr8DJHbqk3fYvWjIZk/Iqz49ScybWEjGY3PRv6JS4W8AUK
         dkTpcWFpfafYRuT96nWVYVqr339tFotfW+X0ZfoiBZOrauw50fqDiQMklzRcdeTAfjOI
         Iwl4pkCR107uItg0kjGXaDgLF0VXzCxAygbGgMeYQvZlAsK2PAtdS9JoBU2QGZquJ7PP
         fmcTJld3wVxEUaGKrfxv++Xl/Ehf2xRvochfgpasZhaD9E7WBJvUxg/VtEkl15Du69yE
         lR+Yhxu3y2VDtiTTSSh5Wn4y/k4XjseHFEYBYRe847BHflWbd1adBnRpTRxUGTc8K3c4
         4I0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717387314; x=1717992114; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+33XLDIC/Bneij/bmDYEINOoQ7BPclweFGSViyOzvm4=;
        b=AE/VKP7HS6fftCBG0thHz19ULR22L9r5MbmMTJFDNgoZOBm1TIyknwHzonr+ub05JU
         OkxPG5IdCRg9D37BSnzJF6Cp2rGBDGolZQeroDs66vRRQpt6fkw/u4Wu/tVcehxkkA0l
         Z8B4/pfdPISngpNWPHjhbodBvj9IqOHBhjENDUkFDomw4X+tKQAEtIOZ77pN8YAbFfWC
         rNdJkiuzZkGfrxx8BWrfylZgIe5DoxAzALPljN5uvR5WfjG+5SAKod8VB2L34v6Ek9Ic
         Csbbfpz7D6lzO+bF8637Xc4uZQTyvwg2WDP76z3E1pYsDIbcPxPxVNf3+XJOqyP8lK4l
         n0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717387314; x=1717992114;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+33XLDIC/Bneij/bmDYEINOoQ7BPclweFGSViyOzvm4=;
        b=vtf33iIE9dMaHKV4D/hT12YYtuz4q8uWMCBaGek4dQNtwaDpM3TJOaR9fPiYE17y1d
         z8+oaczDYOVDZbWQXTYCj42svP2G5WwrDItgxqskjgjz/ln2lCKhk3s9+TmK7GTUiraR
         a6AoWSz0mhw8xMZQkix1UWLwVPnuSGcAqShrnEpwdKg3faDnLjsm4OHfGs+rLwc6rhaH
         Cr4qL8wtb2aLfR6K4hy5394plF82cBZB4K5yhBm/neBJfcn5v24WCIZthU1QB3chxAsk
         HTsXvWJvrosoEfd4oh0MEPbLrIyXJ3ZkFKyOb687UxIDv5+bnWxC4uyhOcpeS/6yZ2KE
         n98g==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVN5bCS7VB6I8qxghc5W38xcHgTMubxEpSnaMiMo+O/xN7bN/HpkT0tLuc3j2nw346JX6FbqNfOXKYMIcs4sNNj9ZpDy6lNuh5bwoE=
X-Gm-Message-State: AOJu0YxeUh4kHj2npBmBf64G4t/iOVB0WVEH28gG2+PTrLYKpJgENh16
	Po2soHwFZkXxHQVxNUl6q9aHxh22n6ydTCiQ6RAB4gmeTergiG+3
X-Google-Smtp-Source: AGHT+IGC7FDwnLA9rY9f8iV7O8hUa8v6fBypiJNXPcBNibxtkygvqxpD1R4r+TFja+ti5HUY5TtvRQ==
X-Received: by 2002:a05:6902:2841:b0:dee:5dc4:59cf with SMTP id 3f1490d57ef6-dfa73c2209amr8593709276.26.1717387314557;
        Sun, 02 Jun 2024 21:01:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:bd5:0:b0:df7:8a9f:8453 with SMTP id 3f1490d57ef6-dfa59ae880dls1874054276.1.-pod-prod-04-us;
 Sun, 02 Jun 2024 21:01:53 -0700 (PDT)
X-Received: by 2002:a05:690c:f0f:b0:627:8b31:e74 with SMTP id 00721157ae682-62c798271d8mr24004707b3.7.1717387312957;
        Sun, 02 Jun 2024 21:01:52 -0700 (PDT)
Date: Sun, 2 Jun 2024 21:01:52 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <983afd72-1248-43ea-ac1f-bba15f42365en@googlegroups.com>
In-Reply-To: <e4ea14e3-f996-4838-b70d-0cafa8495557n@googlegroups.com>
References: <e4ea14e3-f996-4838-b70d-0cafa8495557n@googlegroups.com>
Subject: Re: WHAT ARE GOLDEN TEACHER MUSHROOMS AND WHERE ARE THEY SOLD
 ONLINE?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_150512_1964276402.1717387312256"
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

------=_Part_150512_1964276402.1717387312256
Content-Type: multipart/alternative; 
	boundary="----=_Part_150513_272259763.1717387312256"

------=_Part_150513_272259763.1717387312256
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/motionking_caliweed_psychedelics

Alix Rosine Pokam
unread,
Jun 1, 2024, 6:42:28=E2=80=AFPM (2 days ago)=20
=EE=A0=BA
=EE=85=9F
=EE=97=94
to Jailhouse
Golden Teachers are considered moderately potent among psilocybin=20
mushrooms. Their effects can vary depending on factors such as growing=20
conditions, individual tolerance, and dosage. Users generally report a=20
balance between visual and introspective effects.

     Effects: Like other psilocybin-containing mushrooms, consuming Golden=
=20
Teacher mushrooms can lead to altered states of consciousness characterized=
=20
by visual and auditory hallucinations, changes in perception of time and=20
space, introspection, and sometimes a sense of unity or connection with=20
one's surroundings
Some key characteristics of the Golden Teacher mushroom strain include:
     Appearance: The Golden Teacher strain typically features large,=20
golden-capped mushrooms with a distinct appearance. When mature, the caps=
=20
can take on a golden or caramel color, while the stem is usually thick and=
=20
white.
     Potency: Golden Teachers are considered moderately potent among=20
psilocybin mushrooms. Their effects can vary depending on factors such as=
=20
growing conditions, individual tolerance, and dosage. Users generally=20
report a balance between visual and introspective effects.
https://t.me/motionking_caliweed_psychedelics

     Effects: Like other psilocybin-containing mushrooms, consuming Golden=
=20
Teacher mushrooms can lead to altered states of consciousness characterized=
=20
by visual and auditory hallucinations, changes in perception of time and=20
space, introspection, and sometimes a sense of unity or connection with=20
one's surroundings.

     Cultivation: Golden Teachers are favored by cultivators due to their=
=20
relatively straightforward cultivation process. They are known for being=20
resilient and adaptable

https://t.me/motionking_caliweed_psychedelics


On Saturday, June 1, 2024 at 6:42:28=E2=80=AFPM UTC+1 Alix Rosine Pokam wro=
te:

> Golden Teachers are considered moderately potent among psilocybin=20
> mushrooms. Their effects can vary depending on factors such as growing=20
> conditions, individual tolerance, and dosage. Users generally report a=20
> balance between visual and introspective effects.
> https://t.me/tripgum
> https://t.me/tripgum
>      Effects: Like other psilocybin-containing mushrooms, consuming Golde=
n=20
> Teacher mushrooms can lead to altered states of consciousness characteriz=
ed=20
> by visual and auditory hallucinations, changes in perception of time and=
=20
> space, introspection, and sometimes a sense of unity or connection with=
=20
> one's surroundings
> Some key characteristics of the Golden Teacher mushroom strain include:
>      Appearance: The Golden Teacher strain typically features large,=20
> golden-capped mushrooms with a distinct appearance. When mature, the caps=
=20
> can take on a golden or caramel color, while the stem is usually thick an=
d=20
> white.
>      Potency: Golden Teachers are considered moderately potent among=20
> psilocybin mushrooms. Their effects can vary depending on factors such as=
=20
> growing conditions, individual tolerance, and dosage. Users generally=20
> report a balance between visual and introspective effects.
> https://t.me/tripgum
>      Effects: Like other psilocybin-containing mushrooms, consuming Golde=
n=20
> Teacher mushrooms can lead to altered states of consciousness characteriz=
ed=20
> by visual and auditory hallucinations, changes in perception of time and=
=20
> space, introspection, and sometimes a sense of unity or connection with=
=20
> one's surroundings.
> https://t.me/tripgum
>      Cultivation: Golden Teachers are favored by cultivators due to their=
=20
> relatively straightforward cultivation process. They are known for being=
=20
> resilient and adaptable, making them a suitable choice for beginners in=
=20
> mushroom cultivation.
>  https://t.me/tripgum
>
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/983afd72-1248-43ea-ac1f-bba15f42365en%40googlegroups.com.

------=_Part_150513_272259763.1717387312256
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>https://t.me/motionking_caliweed_psychedelics<br /></div><div><div sty=
le=3D"align-items: center; color: rgb(95, 99, 104); display: flex; height: =
48px; justify-content: space-between;"><div style=3D"overflow: hidden; text=
-overflow: ellipsis; white-space: nowrap;"><span style=3D"font-family: Robo=
to, Arial, sans-serif; letter-spacing: 0.25px; line-height: 20px; color: rg=
b(32, 33, 36); margin-top: 0px; margin-bottom: 0px; margin-right: 16px;"><b=
r />Alix Rosine Pokam</span></div><span style=3D"clip: rect(1px, 1px, 1px, =
1px); height: 1px; margin: 0px; overflow: hidden; padding: 0px; position: a=
bsolute; white-space: nowrap; width: 1px; z-index: -1000;">unread,</span><d=
iv style=3D"font-family: Roboto, Arial, sans-serif; font-size: 12px; letter=
-spacing: 0.3px; line-height: 16px; align-items: center; display: flex;">Ju=
n 1, 2024, 6:42:28=E2=80=AFPM=C2=A0(2 days ago)=C2=A0<div style=3D"height: =
48px; width: 48px;"><div role=3D"button" aria-label=3D"Not starred" tabinde=
x=3D"0" style=3D"user-select: none; transition: background 0.3s ease 0s; bo=
rder: 0px; border-radius: 50%; cursor: pointer; display: inline-block; flex=
-shrink: 0; height: 48px; outline: none; overflow: hidden; position: relati=
ve; text-align: center; width: 48px; z-index: 0; fill: rgb(95, 99, 104);"><=
div style=3D"transform: translate(-50%, -50%) scale(0); transition: opacity=
 0.2s ease 0s, visibility 0s ease 0.2s, transform 0s ease 0.2s, -webkit-tra=
nsform 0s ease 0.2s; background-size: cover; left: 0px; opacity: 0; pointer=
-events: none; position: absolute; top: 0px; visibility: hidden; background=
-image: radial-gradient(circle farthest-side, rgba(95, 99, 104, 0.16), rgba=
(95, 99, 104, 0.16) 80%, rgba(95, 99, 104, 0) 100%);"></div><span style=3D"=
align-items: center; display: flex; height: 48px; justify-content: center; =
position: relative; width: 48px;"><span style=3D"display: flex; position: r=
elative;"><span aria-hidden=3D"true" style=3D"font-family: &quot;Material I=
cons Extended&quot;; font-size: 20px; line-height: 1; letter-spacing: norma=
l; text-rendering: optimizelegibility; display: inline-block; overflow-wrap=
: normal; direction: ltr; font-feature-settings: &quot;liga&quot;;">=EE=A0=
=BA</span></span></span></div></div><div role=3D"button" aria-label=3D"Repl=
y all" tabindex=3D"0" style=3D"user-select: none; transition: background 0.=
3s ease 0s; border: 0px; border-radius: 50%; cursor: pointer; display: inli=
ne-block; flex-shrink: 0; height: 48px; outline: none; overflow: hidden; po=
sition: relative; text-align: center; width: 48px; z-index: 0; fill: rgb(95=
, 99, 104);"><div style=3D"transform: translate(-50%, -50%) scale(0); trans=
ition: opacity 0.2s ease 0s, visibility 0s ease 0.2s, transform 0s ease 0.2=
s, -webkit-transform 0s ease 0.2s; background-size: cover; left: 0px; opaci=
ty: 0; pointer-events: none; position: absolute; top: 0px; visibility: hidd=
en; background-image: radial-gradient(circle farthest-side, rgba(95, 99, 10=
4, 0.16), rgba(95, 99, 104, 0.16) 80%, rgba(95, 99, 104, 0) 100%);"></div><=
span style=3D"align-items: center; display: flex; height: 48px; justify-con=
tent: center; position: relative; width: 48px;"><span style=3D"display: fle=
x; position: relative;"><span aria-hidden=3D"true" style=3D"font-family: &q=
uot;Material Icons Extended&quot;; font-size: 20px; line-height: 1; letter-=
spacing: normal; text-rendering: optimizelegibility; display: inline-block;=
 overflow-wrap: normal; direction: ltr; font-feature-settings: &quot;liga&q=
uot;;">=EE=85=9F</span></span></span></div><div role=3D"presentation" style=
=3D"display: flex;"><div role=3D"button" aria-label=3D"More" aria-disabled=
=3D"false" tabindex=3D"0" aria-haspopup=3D"true" aria-expanded=3D"false" st=
yle=3D"user-select: none; transition: background 0.3s ease 0s; border: 0px;=
 border-radius: 50%; cursor: pointer; display: inline-block; fill: rgb(95, =
99, 104); flex-shrink: 0; height: 48px; outline: none; overflow: hidden; po=
sition: relative; text-align: center; width: 48px; z-index: 0;"><div style=
=3D"transform: translate(-50%, -50%) scale(0); transition: opacity 0.2s eas=
e 0s; background-size: cover; left: 0px; opacity: 0; pointer-events: none; =
position: absolute; top: 0px; visibility: hidden;"></div><span style=3D"lin=
e-height: 44px; position: relative; display: flex; height: 48px; width: 48p=
x;"><span style=3D"margin: 0px; display: flex; align-items: center; flex-gr=
ow: 1; justify-content: center;"><span aria-hidden=3D"true" style=3D"font-f=
amily: &quot;Material Icons Extended&quot;; font-size: 20px; line-height: 1=
; letter-spacing: normal; text-rendering: optimizelegibility; display: inli=
ne-block; overflow-wrap: normal; direction: ltr; font-feature-settings: &qu=
ot;liga&quot;;">=EE=97=94</span></span></span></div></div></div></div><div =
style=3D"margin: -10px 0px 10px;"><span style=3D"font-family: Roboto, Arial=
, sans-serif; font-size: 12px; letter-spacing: 0.3px; line-height: 16px; co=
lor: rgb(95, 99, 104);">to=C2=A0Jailhouse</span></div></div><div role=3D"re=
gion" aria-labelledby=3D"c32653" style=3D"margin: 12px 0px; overflow: auto;=
 padding-right: 20px;"><div>Golden Teachers are considered moderately poten=
t among psilocybin mushrooms. Their effects can vary depending on factors s=
uch as growing conditions, individual tolerance, and dosage. Users generall=
y report a balance between visual and introspective effects.<br /></div><di=
v><br />=C2=A0 =C2=A0 =C2=A0Effects: Like other psilocybin-containing mushr=
ooms, consuming Golden Teacher mushrooms can lead to altered states of cons=
ciousness characterized by visual and auditory hallucinations, changes in p=
erception of time and space, introspection, and sometimes a sense of unity =
or connection with one's surroundings<br />Some key characteristics of the =
Golden Teacher mushroom strain include:<br />=C2=A0 =C2=A0 =C2=A0Appearance=
: The Golden Teacher strain typically features large, golden-capped mushroo=
ms with a distinct appearance. When mature, the caps can take on a golden o=
r caramel color, while the stem is usually thick and white.<br />=C2=A0 =C2=
=A0 =C2=A0Potency: Golden Teachers are considered moderately potent among p=
silocybin mushrooms. Their effects can vary depending on factors such as gr=
owing conditions, individual tolerance, and dosage. Users generally report =
a balance between visual and introspective effects.<br />https://t.me/motio=
nking_caliweed_psychedelics</div><div><br />=C2=A0 =C2=A0 =C2=A0Effects: Li=
ke other psilocybin-containing mushrooms, consuming Golden Teacher mushroom=
s can lead to altered states of consciousness characterized by visual and a=
uditory hallucinations, changes in perception of time and space, introspect=
ion, and sometimes a sense of unity or connection with one's surroundings.<=
br /><br />=C2=A0 =C2=A0 =C2=A0Cultivation: Golden Teachers are favored by =
cultivators due to their relatively straightforward cultivation process. Th=
ey are known for being resilient and adaptable</div><div><br /></div><div>h=
ttps://t.me/motionking_caliweed_psychedelics<br /></div><div><br /></div></=
div><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr"=
>On Saturday, June 1, 2024 at 6:42:28=E2=80=AFPM UTC+1 Alix Rosine Pokam wr=
ote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8=
ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div>Gol=
den Teachers are considered moderately potent among psilocybin mushrooms. T=
heir effects can vary depending on factors such as growing conditions, indi=
vidual tolerance, and dosage. Users generally report a balance between visu=
al and introspective effects.<br></div><div><a href=3D"https://t.me/tripgum=
" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.go=
ogle.com/url?hl=3Den&amp;q=3Dhttps://t.me/tripgum&amp;source=3Dgmail&amp;us=
t=3D1717473593064000&amp;usg=3DAOvVaw38EspdJjL9A52sNpR_oVTG">https://t.me/t=
ripgum</a><br><a href=3D"https://t.me/tripgum" target=3D"_blank" rel=3D"nof=
ollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dh=
ttps://t.me/tripgum&amp;source=3Dgmail&amp;ust=3D1717473593064000&amp;usg=
=3DAOvVaw38EspdJjL9A52sNpR_oVTG">https://t.me/tripgum</a><br>=C2=A0 =C2=A0 =
=C2=A0Effects: Like other psilocybin-containing mushrooms, consuming Golden=
 Teacher mushrooms can lead to altered states of consciousness characterize=
d by visual and auditory hallucinations, changes in perception of time and =
space, introspection, and sometimes a sense of unity or connection with one=
&#39;s surroundings<br>Some key characteristics of the Golden Teacher mushr=
oom strain include:<br>=C2=A0 =C2=A0 =C2=A0Appearance: The Golden Teacher s=
train typically features large, golden-capped mushrooms with a distinct app=
earance. When mature, the caps can take on a golden or caramel color, while=
 the stem is usually thick and white.<br>=C2=A0 =C2=A0 =C2=A0Potency: Golde=
n Teachers are considered moderately potent among psilocybin mushrooms. The=
ir effects can vary depending on factors such as growing conditions, indivi=
dual tolerance, and dosage. Users generally report a balance between visual=
 and introspective effects.<br><a href=3D"https://t.me/tripgum" target=3D"_=
blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?=
hl=3Den&amp;q=3Dhttps://t.me/tripgum&amp;source=3Dgmail&amp;ust=3D171747359=
3064000&amp;usg=3DAOvVaw38EspdJjL9A52sNpR_oVTG">https://t.me/tripgum</a><br=
>=C2=A0 =C2=A0 =C2=A0Effects: Like other psilocybin-containing mushrooms, c=
onsuming Golden Teacher mushrooms can lead to altered states of consciousne=
ss characterized by visual and auditory hallucinations, changes in percepti=
on of time and space, introspection, and sometimes a sense of unity or conn=
ection with one&#39;s surroundings.<br><a href=3D"https://t.me/tripgum" tar=
get=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.=
com/url?hl=3Den&amp;q=3Dhttps://t.me/tripgum&amp;source=3Dgmail&amp;ust=3D1=
717473593064000&amp;usg=3DAOvVaw38EspdJjL9A52sNpR_oVTG">https://t.me/tripgu=
m</a><br>=C2=A0 =C2=A0 =C2=A0Cultivation: Golden Teachers are favored by cu=
ltivators due to their relatively straightforward cultivation process. They=
 are known for being resilient and adaptable, making them a suitable choice=
 for beginners in mushroom cultivation.<br>=C2=A0<a href=3D"https://t.me/tr=
ipgum" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/tripgum&amp;source=3Dgmail&a=
mp;ust=3D1717473593064000&amp;usg=3DAOvVaw38EspdJjL9A52sNpR_oVTG">https://t=
.me/tripgum</a><br><br></div><div><br></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/983afd72-1248-43ea-ac1f-bba15f42365en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/983afd72-1248-43ea-ac1f-bba15f42365en%40googlegroups.co=
m</a>.<br />

------=_Part_150513_272259763.1717387312256--

------=_Part_150512_1964276402.1717387312256--
