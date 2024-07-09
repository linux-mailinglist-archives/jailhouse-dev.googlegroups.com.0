Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBA7WWS2AMGQEQARW6QQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id ED81F92BB07
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2024 15:28:36 +0200 (CEST)
Received: by mail-yb1-xb3a.google.com with SMTP id 3f1490d57ef6-e02b7adfb95sf9711856276.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2024 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720531716; x=1721136516; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K/XNuQCWquHgfLvmO2Y12W+cutp4iX8hR3Ghd30KpfI=;
        b=EvHe7O+96GtRmI+3839fPIeNUYhUdum9vWhx6nmPcsI9wJeUox+J6YpRa4N8NBNlW/
         XiTOJ5E0X1HP108uR4IqHwrB8xj6jUH+dIp2/jAMi0a/EKNs7iM+I/6d2+oIjAi1xXaa
         2xcmPBRIPUAshnzyuULV398+0sGVPBSIgItkN6+KNgfpFFTIf/R3ieREBD9lILe8fGyW
         3Rc8r4ni3iSp6PNmTTpVWxhacks/PnV/fx2qBjdfIu4NoqI8QV65Q+9phnZa20qzcY9C
         Jgzt2tXqyApsIazx3QG0pXa6srPSVP97o3FZj+sO2GqlL7WWuI/wwO8Zn/ZUDDb13+WJ
         9aZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720531716; x=1721136516; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/XNuQCWquHgfLvmO2Y12W+cutp4iX8hR3Ghd30KpfI=;
        b=Kwc192qmkhc3ZSISCcWvq0IsBZkobaFHjSDABhGHCYyZ8HAni+BotrGYiwU6FpVb5T
         rI7J2ZvBOcfUcl3wK9Nl40GW4KwDw2XEKQjQVjen+vlus8vXrIozSCkylIgqfKOJX46O
         opAA3kjQyKz87x60N70L4X2uImryZzHtied3zO2OQ0AJd207cKLkbjZYDHdzdhDfsWcx
         c7dt5ZSUx560e7yCSQhx0C02yt/R95+E1f1WCPmZjrRN0sxfe/Um/ugmvjo+PnDbj6ew
         OiLaf3DsjtgM8dxX64g5scwsFOciWj+/vz8ypAZgakhC3KOP0eR36PFNDF3lYiwialhh
         ZG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720531716; x=1721136516;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K/XNuQCWquHgfLvmO2Y12W+cutp4iX8hR3Ghd30KpfI=;
        b=M/kTVtYYpxgtGl+0OGpkrFiqZK0uatlpF1KVspU308KkvNCwpHOe06ArorzGTq9CpH
         pVYaxOo288ZCiM2b89G/CTjKrZ1PaMYzkG2ouKRZpT0h4oB3E6d3+CS9c6RL6RMdKQER
         R25ZCbVjcFZjWeNZndteW9LnrWeBZH7qrR1Tkxuk4FJhzCxPA5WvOXBYApnrROBKoUHl
         mHWftlJszuTAqIz5Cg1UhLPFLpK3L2x4gut4dbUhfr5KTbWppw9o0cQAMTkk4MhbtkAY
         Z9eZZYyrUClHZW1ApGrcWtHeCXMwuAQmmoUaLlIVA3Gy4Y+Y1c1PfpA9KhI7nLrRffpB
         LD/w==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXmyZ0JUJV7IRqIp/kV9lGxrAtXqCuaLQYkHkpdbeC4ZyA0S1A2CH0dYtfVKWTDqnSbRHuR3Tqd1qB1wFCitOksEjhGwY745WXa3ug=
X-Gm-Message-State: AOJu0Yzf4e3vVDxS2qQssmR0mIhnLJa0QlPI1+zMbQjy49ffFvtMs7UG
	UULEWRZvbVa6H2jdIO+jpmBYkt4obafvgJZfQIBA312k7sFmSFw7
X-Google-Smtp-Source: AGHT+IGC4MOK5KBNSGfrBhZHda1n6d3Nlj34sbFkVH9ogxIbNO231EJRWfWaRqF5d6sunFO0UiL1Og==
X-Received: by 2002:a25:a529:0:b0:e03:4575:78d7 with SMTP id 3f1490d57ef6-e041b171d23mr2544612276.55.1720531715777;
        Tue, 09 Jul 2024 06:28:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:18c3:b0:dfd:bfdd:cd15 with SMTP id
 3f1490d57ef6-e03bd02eb1als8428152276.1.-pod-prod-07-us; Tue, 09 Jul 2024
 06:28:34 -0700 (PDT)
X-Received: by 2002:a05:6902:1b12:b0:e03:b3e8:f9a1 with SMTP id 3f1490d57ef6-e041b02fabamr179821276.2.1720531713891;
        Tue, 09 Jul 2024 06:28:33 -0700 (PDT)
Date: Tue, 9 Jul 2024 06:28:33 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b0c1a293-aa7f-4e3a-9afa-c576dc42a378n@googlegroups.com>
In-Reply-To: <0a1d2b6c-6168-4572-9677-b1ca4325470en@googlegroups.com>
References: <717d828e-db8b-4978-81c0-d4701b5cd5a6n@googlegroups.com>
 <0a1d2b6c-6168-4572-9677-b1ca4325470en@googlegroups.com>
Subject: Re: Mushroom Belgian Milk Chocolate is not only delicious, but it
 equates to 4 grams of
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_136980_1972374793.1720531713234"
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

------=_Part_136980_1972374793.1720531713234
Content-Type: multipart/alternative; 
	boundary="----=_Part_136981_807224460.1720531713234"

------=_Part_136981_807224460.1720531713234
Content-Type: text/plain; charset="UTF-8"


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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b0c1a293-aa7f-4e3a-9afa-c576dc42a378n%40googlegroups.com.

------=_Part_136981_807224460.1720531713234
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br /></div><div><div>Mushroom Belgian Milk Chocolate is not only deli=
cious, but it equates to 4 grams of=C2=A0=C2=A0=C2=A0</div><div><br /></div=
><div><a href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_=
blank" rel=3D"nofollow">https://t.me/motionking_caliweed_psychedelics</a></=
div><div><br /></div><div>=C2=A0
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
om/d/msgid/jailhouse-dev/b0c1a293-aa7f-4e3a-9afa-c576dc42a378n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/b0c1a293-aa7f-4e3a-9afa-c576dc42a378n%40googlegroups.co=
m</a>.<br />

------=_Part_136981_807224460.1720531713234--

------=_Part_136980_1972374793.1720531713234--
