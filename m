Return-Path: <jailhouse-dev+bncBD37PS7EWQCRB2XTW62AMGQEFFUXQDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9718092C8CF
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2024 05:03:08 +0200 (CEST)
Received: by mail-yb1-xb3d.google.com with SMTP id 3f1490d57ef6-dfa7a8147c3sf10084685276.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2024 20:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720580587; x=1721185387; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wAMm+8dDfc8jD7hr6Gy6xwceNjNozu80FBpyk9yThgE=;
        b=icLrZHyBfPtSIvNx42SmuaDxzypmKFRlTaRv7hX6QyqNONxWAyc2qmYQjG8z0lcLr6
         KTf8n6I7kRhdlwVDVsoUX3EfoRKrFyJZsS5E/4KTL/0YAO7dGakRE3x8HFeDxCdv+riT
         jvF4aEune8bnUvALBy0uAZA96iPWyDHNZUWLGWOj7ZAaRgLedk4oXn8cp5yTfYPUTHGX
         KHKrwApRk0yD/5EUTfMleo5tiKY3ALvph+IkRZjvrNT6LAzT/Dg8C2EgoNnDr2tjM3jQ
         2mDdYtDMl1mif8Nu9vHQiKOeWH8L/EUdsQVtlJ/YkQMpNJR16O3AOcdRq7snii1/Wrii
         WJUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720580587; x=1721185387; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAMm+8dDfc8jD7hr6Gy6xwceNjNozu80FBpyk9yThgE=;
        b=SEXbA2plY0xxI1Ug7wr9voklHUccPxRrpdl+wCiQq/k+GYFl79UHSIJWFa9eJ9UnJ/
         IjWnQtFcM8U1QojCbo2lyrunNQpvGtXFHgUGSvsWdYHUVrMXNLuVCimk1ZfkDqi6A8zc
         J794DPguTgEWVR//Slo5PXLZYZquwgZb3QoSLnKToIddFa9btawwew4st3G06bwria7O
         JVXmq0V3/qKcKcD6Q8jIrQvySeNA3XioM3RraFcaj7Q6tsOSamZLyse5HZhOuzJM+t+b
         f+IxJUorVAFt58jgROJSqhvtUOgdZkIZPns9oxt2yQOBfzf2a4wWXW2U8vmlI86xJNMr
         TWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720580587; x=1721185387;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wAMm+8dDfc8jD7hr6Gy6xwceNjNozu80FBpyk9yThgE=;
        b=vkjH/9t3snFVjWw2FQSMk9ZfZiDjIKIpoEpJgdocr1vkjnpTUpJ+tYoCWlTDJ/1omB
         9cvInfQo8nx9IX29wiHGX+df5qSDbCx1SBjbG5a1DyxsRhMEylgxT3Baj3G9x/b2Qv4B
         ik5sn9J6Y254LmYPnHPaAp9gtA3Y2v4CToSllM5Xvw55ShiQX8IB1hB7PqJ91z96hD5J
         9FLOeiDYubnc3meAlinm5TFt+dILv8QxZ4WMsVxCuwtB83KGpbQLzJTfCRPac+zPfGoq
         jQ/1V/K/Pw+pfMTc16lAVGjJITWEoA/EthXTW8gaEYZpyd18arrDcPlvG6F6ugBP67MK
         TaRA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWDTMix8qlh/QGmpKADFjFjSXqmpf+djH3B9pzqTW72jpx21LV+sbudGTF0XHiSD4NTHTzX16GRf+fmDfGtH9732cNKBSxu6+cvuU0=
X-Gm-Message-State: AOJu0YwG7+HyK0oVTL1j8A3T8tDHmvOjp/s5/iaIQtADCADZZ7rDRzY6
	x6DvtoHfxZf5D1SeCJbiy/D2/18kiUNSg4Rn2lJ3/Mb6aw9xFQgy
X-Google-Smtp-Source: AGHT+IFVkWeWsfi6Z0Kd6rTqvTB+c80py6AGYUnbvzPaUwmhPfyNPqWb0pBnCTLJ9uz0pb/FwPEL0Q==
X-Received: by 2002:a25:aa33:0:b0:e03:5e6c:57b2 with SMTP id 3f1490d57ef6-e041b153dcemr5029323276.53.1720580587412;
        Tue, 09 Jul 2024 20:03:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1886:b0:e03:aded:7d3a with SMTP id
 3f1490d57ef6-e03bd035889ls9339491276.1.-pod-prod-06-us; Tue, 09 Jul 2024
 20:03:06 -0700 (PDT)
X-Received: by 2002:a05:6902:a07:b0:e03:b5d0:2aa2 with SMTP id 3f1490d57ef6-e041b1e255amr281402276.13.1720580585935;
        Tue, 09 Jul 2024 20:03:05 -0700 (PDT)
Date: Tue, 9 Jul 2024 20:03:05 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <36e3590b-d5f8-44a2-9e40-51cc73e81ff7n@googlegroups.com>
In-Reply-To: <ef498f74-6a26-4848-838d-6e7d887d8281n@googlegroups.com>
References: <717d828e-db8b-4978-81c0-d4701b5cd5a6n@googlegroups.com>
 <0a1d2b6c-6168-4572-9677-b1ca4325470en@googlegroups.com>
 <b0c1a293-aa7f-4e3a-9afa-c576dc42a378n@googlegroups.com>
 <09e4e05f-7dbe-4327-bd28-81ba4c1d61c4n@googlegroups.com>
 <ef498f74-6a26-4848-838d-6e7d887d8281n@googlegroups.com>
Subject: Re: Mushroom Belgian Milk Chocolate is not only delicious, but it
 equates to 4 grams of
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_75546_707389293.1720580585264"
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

------=_Part_75546_707389293.1720580585264
Content-Type: multipart/alternative; 
	boundary="----=_Part_75547_395853475.1720580585264"

------=_Part_75547_395853475.1720580585264
Content-Type: text/plain; charset="UTF-8"

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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/36e3590b-d5f8-44a2-9e40-51cc73e81ff7n%40googlegroups.com.

------=_Part_75547_395853475.1720580585264
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>https://t.me/motionking_caliweed_psychedelics</div><div><br /></div><d=
iv><div>Mushroom Belgian Milk Chocolate is not only delicious, but it equat=
es to 4 grams of=C2=A0=C2=A0=C2=A0</div><div><br /></div><div><a href=3D"ht=
tps://t.me/motionking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofol=
low">https://t.me/motionking_caliweed_psychedelics</a></div><div><br /></di=
v><div>=C2=A0
psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=20
effects, you get from eating the Mushroom and polka dot company=20
chocolate, they are also a great way to microdose magic mushrooms.=20
Microdosing magic mushrooms in the form of consuming mushroom chocolate=20
bars have recently increased in popularity.=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank"=
 rel=3D"nofollow">https://t.me/motionking_caliweed_psychedelics</a> <br /><=
/div><div><br /></div><div><a href=3D"https://t.me/motionking_caliweed_psyc=
hedelics" target=3D"_blank" rel=3D"nofollow">https://t.me/motionking_caliwe=
ed_psychedelics</a></div></div><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/36e3590b-d5f8-44a2-9e40-51cc73e81ff7n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/36e3590b-d5f8-44a2-9e40-51cc73e81ff7n%40googlegroups.co=
m</a>.<br />

------=_Part_75547_395853475.1720580585264--

------=_Part_75546_707389293.1720580585264--
