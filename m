Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBJXVWS2AMGQEFXI5E4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 887F992BAFF
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2024 15:27:04 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-e03ab732455sf1415549276.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2024 06:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720531623; x=1721136423; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0YPSX/M3aE4aIP2ES7wvqOH+9rStwNCs4EmPcyTVzvg=;
        b=c44GND0oVX1a47rXApKuVyzqRcmOEcNJwj1P9n7AP92q1Cx61eyQ5RRLNX22uHfHSF
         l1QijkCLj9c1fqlhjl7O80Q1a/kmfSRrpyILBDdTZRm8v3l1WsjmZUEQLP9YozWedan4
         ivNwSGGaK1FGlmIPJam7xvZz1tZjSQem5EvEjY5uxR65Tf3Jhk1AwvdcAyQ4NFQ4ZdLQ
         A7WBiR9yvG3S6YhNuJXzpxjIACklU3mGgyVYiWOBQAj+JdripzeJN4RCYdloKm0CqLFT
         Ez+iUu7iQj//s7FWrh9px8M+NFiI1PKqILtiVzV+ge1iGxGu8XHLDZSKjO5Nh+eu1mZZ
         AQbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720531623; x=1721136423; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YPSX/M3aE4aIP2ES7wvqOH+9rStwNCs4EmPcyTVzvg=;
        b=LAgOfj5AQrQCgoYXdTTvPjaSqUZP7TL3Q7sZohLZqArDESt7D9SyZYILg7AImXo2H9
         eLG8Gn0Wkm4q9wmd0/Rd6geAKP0AqC46mlS0rBxTCxXbZac8yN94o1iLL4rJSP6F1esm
         gM1DdU1HbQjSXoeaQX+S8v/hGY+Nwwd/UzJbVp1zuvoeg0u6cfcIPxxyZ+WClTr69t9N
         6OvboAIf0bH1ul+2Hvzz8BIgmVPg+bd9wqCwnbahnsLIndw7anOr1rhAe6UR/UKRd2Sf
         nIW1YY8ErtEF0vlIpR9OP99k+OHfgRv1+Fw8ukSGRtAGilHaQQhFbBsFj/Bp9uHZzxJg
         K0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720531623; x=1721136423;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0YPSX/M3aE4aIP2ES7wvqOH+9rStwNCs4EmPcyTVzvg=;
        b=PeIvs/HzyFapPzuZmjC2YCrANGucaPPa5vbFChHv0Y0CtdziBrORupdDHeAtvV+HEK
         V4YUhiSXnMi41BvLhQRVafA/opQvS9RhoPtanJWMDc96O21OsNIV4V23UZE+23up4VDW
         IeqNiiNwoLSQEiEku+QIxATEZCBuwMVJ2xV0N7itkPsqxqz8kiQ5zuaptEcEJBNLIv+E
         PWCujTSDs/ZBq0u56/TuYBExXr2EV/pKgMoVTtAkTRtys7hiyNUqQALX1TQ/IiPpYbH6
         XXc+NhjfrwFlUrpTCwgZNFNx8vY6Wptt1wRhvR44z6s1PIM4/voKmhnH1YsbO/N5bA1h
         lIEg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWQoav1neTCMwH1BNfP65WbvKZ9Ej5xDQb257Si/Vin67MEkRugfQC3BALsGzoXxd17izBnyit+iGAuHSYSm+mHJJ38I7pgV+Hlk/c=
X-Gm-Message-State: AOJu0YxaCI+a8FbYXrS6f7oDRsdRtYMsQlU2H9deKRKvgUmYrI37J+I5
	Bjf2jHK+qtQUtcIc8yusedM8QqCoQAQzbZ9zpKwoBLCQdTGcmN9F
X-Google-Smtp-Source: AGHT+IHhnQaEFzohNJ0HGgn15RFNOJO29gDW7cSxXiEMsfHH00gcL5vC2cLYXyX4ZAys0D/CVnH5+g==
X-Received: by 2002:a25:8801:0:b0:e03:4bab:49b5 with SMTP id 3f1490d57ef6-e041b039952mr2375622276.1.1720531623478;
        Tue, 09 Jul 2024 06:27:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:120d:b0:e02:b40e:8e90 with SMTP id
 3f1490d57ef6-e03bd1d5d32ls2159994276.2.-pod-prod-09-us; Tue, 09 Jul 2024
 06:27:02 -0700 (PDT)
X-Received: by 2002:a05:6902:2386:b0:e03:9d57:57ee with SMTP id 3f1490d57ef6-e041b0545c2mr140327276.4.1720531622028;
        Tue, 09 Jul 2024 06:27:02 -0700 (PDT)
Date: Tue, 9 Jul 2024 06:27:01 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0a1d2b6c-6168-4572-9677-b1ca4325470en@googlegroups.com>
In-Reply-To: <717d828e-db8b-4978-81c0-d4701b5cd5a6n@googlegroups.com>
References: <717d828e-db8b-4978-81c0-d4701b5cd5a6n@googlegroups.com>
Subject: Re: Mushroom Belgian Milk Chocolate is not only delicious, but it
 equates to 4 grams of
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_138596_1295873180.1720531621381"
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

------=_Part_138596_1295873180.1720531621381
Content-Type: multipart/alternative; 
	boundary="----=_Part_138597_599101038.1720531621381"

------=_Part_138597_599101038.1720531621381
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

On Tuesday, July 9, 2024 at 7:25:41=E2=80=AFAM UTC-6 Asah Randy wrote:

> https://t.me/motionking_caliweed_psychedelics
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

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0a1d2b6c-6168-4572-9677-b1ca4325470en%40googlegroups.com.

------=_Part_138597_599101038.1720531621381
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br /></div><div><div role=3D"region" aria-labelledby=3D"c163"><div><a=
 href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank" r=
el=3D"nofollow">https://t.me/motionking_caliweed_psychedelics</a></div><div=
><br /></div><div>Mushroom Belgian Milk Chocolate is not only delicious, bu=
t it equates to 4 grams of=C2=A0=C2=A0=C2=A0</div><div><br /></div><div><a =
href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank" re=
l=3D"nofollow">https://t.me/motionking_caliweed_psychedelics</a></div><div>=
<br /></div><div>=C2=A0
psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=20
effects, you get from eating the Mushroom and polka dot company=20
chocolate, they are also a great way to microdose magic mushrooms.=20
Microdosing magic mushrooms in the form of consuming mushroom chocolate=20
bars have recently increased in popularity.=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank"=
 rel=3D"nofollow">https://t.me/motionking_caliweed_psychedelics</a> <br /><=
/div><div><br /></div><div><a href=3D"https://t.me/motionking_caliweed_psyc=
hedelics" target=3D"_blank" rel=3D"nofollow">https://t.me/motionking_caliwe=
ed_psychedelics</a></div></div></div><br /><div class=3D"gmail_quote"><div =
dir=3D"auto" class=3D"gmail_attr">On Tuesday, July 9, 2024 at 7:25:41=E2=80=
=AFAM UTC-6 Asah Randy wrote:<br/></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); pad=
ding-left: 1ex;"><div><a href=3D"https://t.me/motionking_caliweed_psychedel=
ics" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www=
.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedeli=
cs&amp;source=3Dgmail&amp;ust=3D1720617987688000&amp;usg=3DAOvVaw094IqyaIVX=
lNXuTk1BtMPE">https://t.me/motionking_caliweed_psychedelics</a></div><div><=
br></div><div>Mushroom Belgian Milk Chocolate is not only delicious, but it=
 equates to 4 grams of=C2=A0=C2=A0=C2=A0</div><div><br></div><div><a href=
=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=
=3D1720617987688000&amp;usg=3DAOvVaw094IqyaIVXlNXuTk1BtMPE">https://t.me/mo=
tionking_caliweed_psychedelics</a></div><div><br></div><div>=C2=A0
psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing eff=
ects, you get from eating the Mushroom and polka dot company chocolate, the=
y are also a great way to microdose magic mushrooms. Microdosing magic mush=
rooms in the form of consuming mushroom chocolate bars have recently increa=
sed in popularity.=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank"=
 rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3De=
n&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&=
amp;ust=3D1720617987688000&amp;usg=3DAOvVaw094IqyaIVXlNXuTk1BtMPE">https://=
t.me/motionking_caliweed_psychedelics</a> <br></div><div><br></div><div><a =
href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp=
;ust=3D1720617987688000&amp;usg=3DAOvVaw094IqyaIVXlNXuTk1BtMPE">https://t.m=
e/motionking_caliweed_psychedelics</a></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0a1d2b6c-6168-4572-9677-b1ca4325470en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0a1d2b6c-6168-4572-9677-b1ca4325470en%40googlegroups.co=
m</a>.<br />

------=_Part_138597_599101038.1720531621381--

------=_Part_138596_1295873180.1720531621381--
