Return-Path: <jailhouse-dev+bncBC33PBVJQ4BRB7MLRCZQMGQE6I5GIFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113c.google.com (mail-yw1-x113c.google.com [IPv6:2607:f8b0:4864:20::113c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADCC8FF502
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2024 20:54:55 +0200 (CEST)
Received: by mail-yw1-x113c.google.com with SMTP id 00721157ae682-627eb3fb46csf20692467b3.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2024 11:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717700094; x=1718304894; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tnEscE4leqjf7bkU+RaAJor7f/AkU6x0nVSB5g6vwjI=;
        b=ny5CCdLiIxtd3f1s7X2S6Bzz2d/2VToRCYzZuWL+Qm5a/uHFgQX8kSMd94F859mtHD
         5FHYIQQ5gSpKv/FARQWtNEv0UzUME+zuYOSOYfNDqOYMShbNk51OL1eM2q6FBYBOOq4q
         18duX+GZdvD9w+tciX2AXxMMi4lcrzCwjqoVQWlhQqkPhlo1ud10f/tI7xNlK1WDizjm
         /q5Nl10upao3G1wCX3LRyHG9lqK1Dx3uj3bJ/8SUwyJo14Rctn62VDZu3+KyeP9GZwGu
         KTltdFXTP2LoKyjIZcPnogAaU3S9MAkAPKqxRhSM35X+vAiP8tfEYMzdrjhyGZO0uj7c
         t/iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717700094; x=1718304894; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnEscE4leqjf7bkU+RaAJor7f/AkU6x0nVSB5g6vwjI=;
        b=KEyR2PN7F/VG8D9pu19/Wwl/EIYMdckMM1EC1Ip3IRRgdUy7tYz/KYyszUX4kF40uL
         1738OdZmUTW5TYbxGVJLCbiTK5Iu7VZRoRRoFmEUeAhwXi2G4J0L7Z6HZKjUzf2vvwly
         4TDx67saCOKp7Caw3M/FaaQtIED/Hs9ST5Utjl2QhLQH2eHv7uVW52UXZVgwUMZJI28H
         DmORWTDqEtM2yYOdYDQ2HpcVtLd8vYth4ahf5+zgm0hrf8z9fChwo5Wj7UfNGUmhj/LC
         RK8zaKmzzAMWRo7kPKHfNv68wejOMX211I/Nr4hh7NLUwkIBOuSGouJtEw7VwawF0gJb
         xBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717700094; x=1718304894;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tnEscE4leqjf7bkU+RaAJor7f/AkU6x0nVSB5g6vwjI=;
        b=djCg8ONYEsHdhXLP1qvLCAGTGeaRY1IyfwXKkl8C6Kc4h1vqIBqpw88rdBZqeM1005
         +Jh2bweDw/xN09NJksr5F26ToM8ZcGVlNtrdrr9I0mZ/sUeJuxdpiL1hgqaC6KETnxcs
         zbgO0bCRwoJ4cvhF84H8llvO9y7MWhg7CoHxsgPWRkn+E0Z9C11uPhzQFBeSO2tSv3uN
         f1u+kSYBcV3Ro7eHMu6x+ky6FBxmg1sFhNq8MkH28c0D07qz6O8WZGZLbVytAwy6UPL/
         oaqsdzyZzJ2LTalCrVI2Tygy7AJJZI0ZVH4dyYxBnpEKwY6mXFo3S5LdLFlNihdwRcAT
         D49A==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVt7qLTk2+Yr3xXPvyYz/CIbfnOws7sQwqscLLrexdi94Oc2AXVK+J3ggIZYzsH/kXkeZFGYof9PEHUFmdM3O7Rs7Gb39VKZ49ad6g=
X-Gm-Message-State: AOJu0YzABkqLWAtID/mQklCOKc/fDHFMdRqILq3kVdLE07bqK0qedE9A
	gNPFtPizmtHs+pZ68cnkNAZ+8dtHGkXg1q9BsAp2+pDzp6695v+F
X-Google-Smtp-Source: AGHT+IFh0FxNLXQccdeHTHYCgPoGc1Rfeljp61LXBEp7BfF7CHKXl/m4BbRgPb8PmeskEkmEVD19pw==
X-Received: by 2002:a25:b46:0:b0:de5:416a:f9ab with SMTP id 3f1490d57ef6-dfaf64ec5f6mr296413276.25.1717700094371;
        Thu, 06 Jun 2024 11:54:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:aa87:0:b0:df7:69a2:f82b with SMTP id 3f1490d57ef6-dfaf1696c0els480973276.2.-pod-prod-00-us;
 Thu, 06 Jun 2024 11:54:53 -0700 (PDT)
X-Received: by 2002:a25:9004:0:b0:de5:a44c:25af with SMTP id 3f1490d57ef6-dfadec0b255mr688050276.5.1717700092652;
        Thu, 06 Jun 2024 11:54:52 -0700 (PDT)
Date: Thu, 6 Jun 2024 11:54:52 -0700 (PDT)
From: Julse Ferry <ferryjulse@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <89fc6920-718f-4d39-ad92-f97a37c93578n@googlegroups.com>
In-Reply-To: <94308113-15ad-4b8d-b834-5ee646aaff9fn@googlegroups.com>
References: <1e84942d-5882-4515-8312-2623d641ee03n@googlegroups.com>
 <c62f4a27-91cb-41a2-947a-ffdadfc4a692n@googlegroups.com>
 <94308113-15ad-4b8d-b834-5ee646aaff9fn@googlegroups.com>
Subject: Re: Order Psilocybin Mushroom Chocolate Bras
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_12358_1549715347.1717700092064"
X-Original-Sender: ferryjulse@gmail.com
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

------=_Part_12358_1549715347.1717700092064
Content-Type: multipart/alternative; 
	boundary="----=_Part_12359_1284357691.1717700092064"

------=_Part_12359_1284357691.1717700092064
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy all your psychedelic products with me including clone cards
All products are available for deliveries and drop offs
Fast shipping and delivery of packages to all locations worldwide
Let me know with your orders
Text me on telegram @michaelhardy33
You can also join my channel for more products and reviews,link below

https://t.me/psychedelicfakenotes
https://t.me/psychedelicfakenotes
https://t.me/psychedelicfakenotes
https://t.me/psychedelicfakenotes

You can let me know anytime with your orders
Prices are also slightly negotiable depending on the quantity needed

Call or text +12099894742

On Thursday, June 6, 2024 at 7:31:21=E2=80=AFPM UTC+1 James Pemberton wrote=
:

> Buy all your psychedelic products with me including clone cards
> All products are available for deliveries and drop offs
> Fast shipping and delivery of packages to all locations worldwide=20
> Let me know with your orders
> Text me on telegram @Carlantonn01
> You can also join my channel for more products and reviews,link below
>
> https://t.me/psychoworldwide01
> https://t.me/psychoworldwide01
> https://t.me/psychoworldwide01
> https://t.me/psychoworldwide01
>
> Backup channel below=F0=9F=91=87=F0=9F=91=87=F0=9F=91=87
>
> https://t.me/trippycross1
> https://t.me/trippycross1
> https://t.me/trippycross1
>
>
> You can let me know anytime with your orders
> Prices are also slightly negotiable depending on the quantity needed
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/89fc6920-718f-4d39-ad92-f97a37c93578n%40googlegroups.com.

------=_Part_12359_1284357691.1717700092064
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy all your psychedelic products with me including clone cards<br />All pr=
oducts are available for deliveries and drop offs<br />Fast shipping and de=
livery of packages to all locations worldwide<br />Let me know with your or=
ders<br />Text me on telegram @michaelhardy33<br />You can also join my cha=
nnel for more products and reviews,link below<br /><br />https://t.me/psych=
edelicfakenotes<br />https://t.me/psychedelicfakenotes<br />https://t.me/ps=
ychedelicfakenotes<br />https://t.me/psychedelicfakenotes<br /><br />You ca=
n let me know anytime with your orders<br />Prices are also slightly negoti=
able depending on the quantity needed<br /><br />Call or text +12099894742<=
br /><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr=
">On Thursday, June 6, 2024 at 7:31:21=E2=80=AFPM UTC+1 James Pemberton wro=
te:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8e=
x; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Buy all y=
our psychedelic products with me including clone cards<br>All products are =
available for deliveries and drop offs<br>Fast shipping and delivery of pac=
kages to all locations worldwide <br>Let me know with your orders<br>Text m=
e on telegram @Carlantonn01<br>You can also join my channel for more produc=
ts and reviews,link below<br><br><a href=3D"https://t.me/psychoworldwide01"=
 target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.goo=
gle.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychoworldwide01&amp;source=3Dgma=
il&amp;ust=3D1717786485491000&amp;usg=3DAOvVaw32enxBStQAraMGAJg8Y2y8">https=
://t.me/psychoworldwide01</a><br><a href=3D"https://t.me/psychoworldwide01"=
 target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.goo=
gle.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychoworldwide01&amp;source=3Dgma=
il&amp;ust=3D1717786485491000&amp;usg=3DAOvVaw32enxBStQAraMGAJg8Y2y8">https=
://t.me/psychoworldwide01</a><br><a href=3D"https://t.me/psychoworldwide01"=
 target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.goo=
gle.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychoworldwide01&amp;source=3Dgma=
il&amp;ust=3D1717786485491000&amp;usg=3DAOvVaw32enxBStQAraMGAJg8Y2y8">https=
://t.me/psychoworldwide01</a><br><a href=3D"https://t.me/psychoworldwide01"=
 target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.goo=
gle.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychoworldwide01&amp;source=3Dgma=
il&amp;ust=3D1717786485491000&amp;usg=3DAOvVaw32enxBStQAraMGAJg8Y2y8">https=
://t.me/psychoworldwide01</a><br><br>Backup channel below=F0=9F=91=87=F0=9F=
=91=87=F0=9F=91=87<br><br><a href=3D"https://t.me/trippycross1" target=3D"_=
blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?=
hl=3Den&amp;q=3Dhttps://t.me/trippycross1&amp;source=3Dgmail&amp;ust=3D1717=
786485491000&amp;usg=3DAOvVaw3CxqipMfGzHoAiUJEJ6uR6">https://t.me/trippycro=
ss1</a><br><a href=3D"https://t.me/trippycross1" target=3D"_blank" rel=3D"n=
ofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://t.me/trippycross1&amp;source=3Dgmail&amp;ust=3D1717786485491000&=
amp;usg=3DAOvVaw3CxqipMfGzHoAiUJEJ6uR6">https://t.me/trippycross1</a><br><a=
 href=3D"https://t.me/trippycross1" target=3D"_blank" rel=3D"nofollow" data=
-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me=
/trippycross1&amp;source=3Dgmail&amp;ust=3D1717786485491000&amp;usg=3DAOvVa=
w3CxqipMfGzHoAiUJEJ6uR6">https://t.me/trippycross1</a><br><br><br>You can l=
et me know anytime with your orders<br>Prices are also slightly negotiable =
depending on the quantity needed<br><br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/89fc6920-718f-4d39-ad92-f97a37c93578n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/89fc6920-718f-4d39-ad92-f97a37c93578n%40googlegroups.co=
m</a>.<br />

------=_Part_12359_1284357691.1717700092064--

------=_Part_12358_1549715347.1717700092064--
