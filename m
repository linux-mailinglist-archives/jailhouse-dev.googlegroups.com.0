Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBT62WS2AMGQEXRLI4DQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113f.google.com (mail-yw1-x113f.google.com [IPv6:2607:f8b0:4864:20::113f])
	by mail.lfdr.de (Postfix) with ESMTPS id AB78392B972
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2024 14:30:09 +0200 (CEST)
Received: by mail-yw1-x113f.google.com with SMTP id 00721157ae682-6502e4c5aafsf50930947b3.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2024 05:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720528208; x=1721133008; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QmLISRgbK0RH4YrkQ4APYQwasw99ivObo8tHK1BFPoQ=;
        b=jYxATUBCnblJ4p/ZOrOBZeR7NTeOxkVxdGHA985o9Bd2sT1NhgIGxfoC6XabBZfxFd
         B+zvcOQw2DXHU3OZ37u+fB5oQ5krUGYGf1UL209yelzidyljDiVhoOL8+vjyw3TSekD/
         mUimXtq2K0VUGS9fYClbsvhoBOTWeiJFW7/UpSlnr39nHtMlCP5crFYB7SvZ9UA2UgG8
         sG7eW+c0YFHiAll89fQWkDwDKrO2aHLSSPAuBa6aY0YQl6AFXkH3OPhJ3/DdHyRQA5zb
         VEwyK7tmGZIJ39DRXvzldCGVpXA87QRILlq6PKtUEDx7NqBSQsXBN10qGup3uGRf6w7X
         z3vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720528208; x=1721133008; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmLISRgbK0RH4YrkQ4APYQwasw99ivObo8tHK1BFPoQ=;
        b=fXIdKsueLgGvEkKpWdNNWWjWz90A/8+jtXJVRKf0LTrZuNGSnFBwbhn42ik52Rz9tV
         hQBUmYb2K8od0jqfcNmps53mhFkKlsuZnhVDUCeYEnIJ1dThgpjinaVGB8x/rSUAl60D
         Sc/v58nkAB6TFwO1O47pni09A8Mte7xD62EvNv6tPD4ys/3kbKZhn9bZI6oMwhyK1E17
         D4J8d0WIpKY48PdERt06QCy4F+vwH5ui1M7QorcFXs95RnNBYi30uWYnlbTAZSPI57Vh
         /NT5Pet2NwmbGPRD5k3TfxqDnU70Wqn8nN/IJIDLxIn4dNmmvU4nyuNZo6R0e9Gt/M70
         qsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720528208; x=1721133008;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QmLISRgbK0RH4YrkQ4APYQwasw99ivObo8tHK1BFPoQ=;
        b=HhMhVPnvxmSWzG9OgLaZV9ALKY6uy6x1xrMHWItF32mcFcecgf5auO8JO1bMb+TyRg
         5Y7M6jIm39JkeEJ06bKWC0KHNpIuM8XSibUBctE+686QT7wY9mFrS2Rw1gsgWoc5ZFfF
         mNoYPImXU2UslK7LPqieYPCOcX4DgYSlK7KS6KP08nsqLWJ7mmwKhxQrggkokxlzpvhO
         ZZq4eXiGmuLu4il8sulr2D7yp2R3MWCAwffuYeEcxqLyMxNFdiYcd2FyIHxBmvioIDuX
         SZISGSN5Ci1XeGFUtHuHCq+OLoD9TXBHj6X82s0O9BCEwUSIgDbl7LpDUP0+ieVSY64j
         xU8g==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCU7uszypA42IP4kyIrV52FxpgCJpN0YF0np5r0ddgJUb2oyGq5KreXvlbmAfO/SRtp5cIZFydJhdzVozTzlXc6E/F+w1NSluQRFack=
X-Gm-Message-State: AOJu0YwFoWEMH2vx5b5VsGCC9Veb5xnI9YyQI+3iTzQn3D9knmzHK3rG
	C1zXB4/6NTxVLGwPEzZiK6qQh96wDboUeg+BwpkPzX0R1kuD+PAH
X-Google-Smtp-Source: AGHT+IGZi1feq9HoWyLrk+EUQBbZr1H9QECKMIFjbjKyTgmayr0pBBV28LAVyyyrIqZ4fqqajbMW3Q==
X-Received: by 2002:a0d:ed44:0:b0:61a:e979:427e with SMTP id 00721157ae682-65918593c20mr13236327b3.11.1720528208126;
        Tue, 09 Jul 2024 05:30:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:120d:b0:e03:64a5:8bb0 with SMTP id
 3f1490d57ef6-e03bd107ab0ls2578979276.1.-pod-prod-00-us; Tue, 09 Jul 2024
 05:30:06 -0700 (PDT)
X-Received: by 2002:a05:690c:f06:b0:618:5009:cb71 with SMTP id 00721157ae682-65918d946b4mr451117b3.5.1720528206054;
        Tue, 09 Jul 2024 05:30:06 -0700 (PDT)
Date: Tue, 9 Jul 2024 05:30:05 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <8c6e1e58-e869-475c-9964-cda505a2f932n@googlegroups.com>
In-Reply-To: <14733703-b75f-4d24-b210-8ffdc318d6f2n@googlegroups.com>
References: <63491bca-29bc-440f-9258-fb03a69d9ef6n@googlegroups.com>
 <14733703-b75f-4d24-b210-8ffdc318d6f2n@googlegroups.com>
Subject: Re: BUY DEADHEAD CHEMIST DMT CARTS - DMT VAPE PENS ONLINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_30314_953576252.1720528205328"
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

------=_Part_30314_953576252.1720528205328
Content-Type: multipart/alternative; 
	boundary="----=_Part_30315_2024071393.1720528205328"

------=_Part_30315_2024071393.1720528205328
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


https://t.me/motionking_caliweed_psychedelics

DO NOT use DMT if you are taking antidepressants, have a heart condition,=
=20
or have high blood pressure

What is DMT?

Have you ever longed to disconnect from the outside world and get buried in=
=20
your thoughts?

Dimethyltryptamine (DMT) is a naturally 5meo dmt for sale hallucinogenic=20
tryptamine substance that has been utilized for generations in religious=20
shaman ceremonies and rituals. It=E2=80=99s also called as the =E2=80=9Cspi=
rit molecule=E2=80=9D=20
because of its powerful psychedelic effects, which can include altered=20
perception of space and time while taking you on a =E2=80=9Cbusinessman=E2=
=80=99s trip.=E2=80=9D



https://t.me/motionking_caliweed_psychedelics


DMT is a naturally occurring hallucinogenic substance found in plants such=
=20
as Acacia bark, among others. Religious shamans have long identified it as=
=20
one of God=E2=80=99s messengers because when smoked during ayahuasca ritual=
s, it=20
allowed them to speak with spirits=E2=80=94aided by hallucinations so power=
ful that=20
they believed these otherworldly entities lived outside of themselves.


https://t.me/motionking_caliweed_psychedelics

https://t.me/motionking_caliweed_psychedelics

On Tuesday, July 9, 2024 at 1:28:33=E2=80=AFPM UTC+1 Asah Randy wrote:

>
> https://t.me/motionking_caliweed_psychedelics
>
> DO NOT use DMT if you are taking antidepressants, have a heart condition,=
=20
> or have high blood pressure
>
> What is DMT?
>
> Have you ever longed to disconnect from the outside world and get buried=
=20
> in your thoughts?
>
> Dimethyltryptamine (DMT) is a naturally 5meo dmt for sale hallucinogenic=
=20
> tryptamine substance that has been utilized for generations in religious=
=20
> shaman ceremonies and rituals. It=E2=80=99s also called as the =E2=80=9Cs=
pirit molecule=E2=80=9D=20
> because of its powerful psychedelic effects, which can include altered=20
> perception of space and time while taking you on a =E2=80=9Cbusinessman=
=E2=80=99s trip.=E2=80=9D
>
>
>
> https://t.me/motionking_caliweed_psychedelics
>
> DMT is a naturally occurring hallucinogenic substance found in plants suc=
h=20
> as Acacia bark, among others. Religious shamans have long identified it a=
s=20
> one of God=E2=80=99s messengers because when smoked during ayahuasca ritu=
als, it=20
> allowed them to speak with spirits=E2=80=94aided by hallucinations so pow=
erful that=20
> they believed these otherworldly entities lived outside of themselves.
>
>
> https://t.me/motionking_caliweed_psychedelics
>
> https://t.me/motionking_caliweed_psychedelics
> On Friday, June 28, 2024 at 5:57:42=E2=80=AFAM UTC+1 Justin Baker wrote:
>
>> https://t.me/dannyw23official
>>
>>
>>
>> Don=E2=80=99t mix. Do not mix DMT with alcohol or any other drugs buy 5 =
meo DMT
>>
>>
>>
>> https://t.me/dannyw23official
>>
>>
>>
>> Positive mental state. Be sure to pick the right time to use DMT =E2=80=
=93 when=20
>> you are in a positive place and state of mind
>>
>>
>>
>> https://t.me/dannyw23official
>>
>>
>>
>> DO NOT use DMT if you are taking antidepressants, have a heart condition=
,=20
>> or have high blood pressure
>>
>> What is DMT?
>>
>> Have you ever longed to disconnect from the outside world and get buried=
=20
>> in your thoughts?
>>
>> Dimethyltryptamine (DMT) is a naturally 5meo dmt for sale hallucinogenic=
=20
>> tryptamine substance that has been utilized for generations in religious=
=20
>> shaman ceremonies and rituals. It=E2=80=99s also called as the =E2=80=9C=
spirit molecule=E2=80=9D=20
>> because of its powerful psychedelic effects, which can include altered=
=20
>> perception of space and time while taking you on a =E2=80=9Cbusinessman=
=E2=80=99s trip.=E2=80=9D
>>
>>
>>
>> https://t.me/dannyw23official
>>
>>
>>
>> DMT is a naturally occurring hallucinogenic substance found in plants=20
>> such as Acacia bark, among others. Religious shamans have long identifie=
d=20
>> it as one of God=E2=80=99s messengers because when smoked during ayahuas=
ca rituals,=20
>> it allowed them to speak with spirits=E2=80=94aided by hallucinations so=
 powerful=20
>> that they believed these otherworldly entities lived outside of themselv=
es.
>>
>>
>>
>> https://t.me/dannyw23official
>>
>>
>>
>>
>>
>> You may have heard of it before, but there is now a new method to enjoy=
=20
>> this potent chemical without ingesting it or smoking it. Budlyft is now=
=20
>> available!
>>
>> We provide a number of options for you to enjoy DMT, including vape pens=
=20
>> and e-liquids.
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8c6e1e58-e869-475c-9964-cda505a2f932n%40googlegroups.com.

------=_Part_30315_2024071393.1720528205328
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br /></div><div>https://t.me/motionking_caliweed_psychedelics<br /></=
div><div><br /></div><div style=3D"color: rgb(80, 0, 80);">DO NOT use DMT i=
f you are taking antidepressants, have a heart condition, or have high bloo=
d pressure<br /><br />What is DMT?<br /><br />Have you ever longed to disco=
nnect from the outside world and get buried in your thoughts?<br /><br />Di=
methyltryptamine (DMT) is a naturally 5meo dmt for sale hallucinogenic tryp=
tamine substance that has been utilized for generations in religious shaman=
 ceremonies and rituals. It=E2=80=99s also called as the =E2=80=9Cspirit mo=
lecule=E2=80=9D because of its powerful psychedelic effects, which can incl=
ude altered perception of space and time while taking you on a =E2=80=9Cbus=
inessman=E2=80=99s trip.=E2=80=9D<br /><br /><br /><br /></div><a href=3D"h=
ttps://t.me/motionking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofo=
llow" style=3D"color: rgb(26, 115, 232);">https://t.me/motionking_caliweed_=
psychedelics</a><div style=3D"color: rgb(80, 0, 80);"><br /><br />DMT is a =
naturally occurring hallucinogenic substance found in plants such as Acacia=
 bark, among others. Religious shamans have long identified it as one of Go=
d=E2=80=99s messengers because when smoked during ayahuasca rituals, it all=
owed them to speak with spirits=E2=80=94aided by hallucinations so powerful=
 that they believed these otherworldly entities lived outside of themselves=
.<div><br /></div></div><div><br /><a href=3D"https://t.me/motionking_caliw=
eed_psychedelics" target=3D"_blank" rel=3D"nofollow" style=3D"color: rgb(26=
, 115, 232);">https://t.me/motionking_caliweed_psychedelics</a><br /></div>=
<div><br /></div><div><a href=3D"https://t.me/motionking_caliweed_psychedel=
ics" target=3D"_blank" rel=3D"nofollow" style=3D"color: rgb(26, 115, 232);"=
>https://t.me/motionking_caliweed_psychedelics</a></div><br /><div class=3D=
"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Tuesday, July 9, 20=
24 at 1:28:33=E2=80=AFPM UTC+1 Asah Randy wrote:<br/></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(=
204, 204, 204); padding-left: 1ex;"><div><br></div><div><a href=3D"https://=
t.me/motionking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" d=
ata-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t=
.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D172061451=
4983000&amp;usg=3DAOvVaw2Pidx66SDL_JEHJxKK462L">https://t.me/motionking_cal=
iweed_psychedelics</a><br></div><br>DO NOT use DMT if you are taking antide=
pressants, have a heart condition, or have high blood pressure<br><br>What =
is DMT?<br><br>Have you ever longed to disconnect from the outside world an=
d get buried in your thoughts?<br><br>Dimethyltryptamine (DMT) is a natural=
ly 5meo dmt for sale hallucinogenic tryptamine substance that has been util=
ized for generations in religious shaman ceremonies and rituals. It=E2=80=
=99s also called as the =E2=80=9Cspirit molecule=E2=80=9D because of its po=
werful psychedelic effects, which can include altered perception of space a=
nd time while taking you on a =E2=80=9Cbusinessman=E2=80=99s trip.=E2=80=9D=
<br><br><br><br><a href=3D"https://t.me/motionking_caliweed_psychedelics" t=
arget=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.googl=
e.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp=
;source=3Dgmail&amp;ust=3D1720614514983000&amp;usg=3DAOvVaw2Pidx66SDL_JEHJx=
KK462L">https://t.me/motionking_caliweed_psychedelics</a><br><br>DMT is a n=
aturally occurring hallucinogenic substance found in plants such as Acacia =
bark, among others. Religious shamans have long identified it as one of God=
=E2=80=99s messengers because when smoked during ayahuasca rituals, it allo=
wed them to speak with spirits=E2=80=94aided by hallucinations so powerful =
that they believed these otherworldly entities lived outside of themselves.=
<div><br></div><div><br><a href=3D"https://t.me/motionking_caliweed_psyched=
elics" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychede=
lics&amp;source=3Dgmail&amp;ust=3D1720614514983000&amp;usg=3DAOvVaw2Pidx66S=
DL_JEHJxKK462L">https://t.me/motionking_caliweed_psychedelics</a><br></div>=
<div><br></div><div><a href=3D"https://t.me/motionking_caliweed_psychedelic=
s" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.g=
oogle.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics=
&amp;source=3Dgmail&amp;ust=3D1720614514983000&amp;usg=3DAOvVaw2Pidx66SDL_J=
EHJxKK462L">https://t.me/motionking_caliweed_psychedelics</a><br></div><div=
 class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Friday, Ju=
ne 28, 2024 at 5:57:42=E2=80=AFAM UTC+1 Justin Baker wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><a href=3D"https://t.me/dannyw23offic=
ial" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www=
.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/dannyw23official&amp;source=3D=
gmail&amp;ust=3D1720614514983000&amp;usg=3DAOvVaw22BWQssP4NsUpeqYIKdC9O">ht=
tps://t.me/dannyw23official</a><br><br><br><br>Don=E2=80=99t mix. Do not mi=
x DMT with alcohol or any other drugs buy 5 meo DMT<br><br><br><br><a href=
=3D"https://t.me/dannyw23official" rel=3D"nofollow" target=3D"_blank" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/=
dannyw23official&amp;source=3Dgmail&amp;ust=3D1720614514983000&amp;usg=3DAO=
vVaw22BWQssP4NsUpeqYIKdC9O">https://t.me/dannyw23official</a><br><br><br><b=
r>Positive mental state. Be sure to pick the right time to use DMT =E2=80=
=93 when you are in a positive place and state of mind<br><br><br><br><a hr=
ef=3D"https://t.me/dannyw23official" rel=3D"nofollow" target=3D"_blank" dat=
a-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.m=
e/dannyw23official&amp;source=3Dgmail&amp;ust=3D1720614514983000&amp;usg=3D=
AOvVaw22BWQssP4NsUpeqYIKdC9O">https://t.me/dannyw23official</a><br><br><br>=
<br>DO NOT use DMT if you are taking antidepressants, have a heart conditio=
n, or have high blood pressure<br><br>What is DMT?<br><br>Have you ever lon=
ged to disconnect from the outside world and get buried in your thoughts?<b=
r><br>Dimethyltryptamine (DMT) is a naturally 5meo dmt for sale hallucinoge=
nic tryptamine substance that has been utilized for generations in religiou=
s shaman ceremonies and rituals. It=E2=80=99s also called as the =E2=80=9Cs=
pirit molecule=E2=80=9D because of its powerful psychedelic effects, which =
can include altered perception of space and time while taking you on a =E2=
=80=9Cbusinessman=E2=80=99s trip.=E2=80=9D<br><br><br><br><a href=3D"https:=
//t.me/dannyw23official" rel=3D"nofollow" target=3D"_blank" data-saferedire=
cturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/dannyw23of=
ficial&amp;source=3Dgmail&amp;ust=3D1720614514983000&amp;usg=3DAOvVaw22BWQs=
sP4NsUpeqYIKdC9O">https://t.me/dannyw23official</a><br><br><br><br>DMT is a=
 naturally occurring hallucinogenic substance found in plants such as Acaci=
a bark, among others. Religious shamans have long identified it as one of G=
od=E2=80=99s messengers because when smoked during ayahuasca rituals, it al=
lowed them to speak with spirits=E2=80=94aided by hallucinations so powerfu=
l that they believed these otherworldly entities lived outside of themselve=
s.<br><br><br><br><a href=3D"https://t.me/dannyw23official" rel=3D"nofollow=
" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Den&amp;q=3Dhttps://t.me/dannyw23official&amp;source=3Dgmail&amp;ust=3D17=
20614514983000&amp;usg=3DAOvVaw22BWQssP4NsUpeqYIKdC9O">https://t.me/dannyw2=
3official</a><br><br><br><br><br><br>You may have heard of it before, but t=
here is now a new method to enjoy this potent chemical without ingesting it=
 or smoking it. Budlyft is now available!<br><br>We provide a number of opt=
ions for you to enjoy DMT, including vape pens and e-liquids.<br></blockquo=
te></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/8c6e1e58-e869-475c-9964-cda505a2f932n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/8c6e1e58-e869-475c-9964-cda505a2f932n%40googlegroups.co=
m</a>.<br />

------=_Part_30315_2024071393.1720528205328--

------=_Part_30314_953576252.1720528205328--
