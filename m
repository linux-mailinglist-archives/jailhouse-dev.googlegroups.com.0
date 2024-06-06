Return-Path: <jailhouse-dev+bncBD4J5XGZWMOBB6UARCZQMGQER43TWAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id C41748FF4AE
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2024 20:31:24 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-df796aaa57dsf1930632276.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2024 11:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717698683; x=1718303483; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OBuUGmCzDheOq1IA0IpyH78F73BvUl75t52ZNhSFvxM=;
        b=XexJTNmlyq7rhbRa7bxE239TjAkhH4EeeWCWgoxSMH7J/TgAC6Bhm9Uk9phHoQIpYV
         Q1o+Re1fgglhbuUo1xKzgVhQHTd/0c5OlyeWkyOVZGL53SIrxBzmr37CLg6fAc3B+5NT
         ZFnFdalYUqRHcSIw128lKHjGuz9PpryoWFXw9H2tjVfmGNOaDsrWcmc69DMejMX1gdJ9
         W4NiJyfKK/3ZdhyTbn4dBmxVIRKZM0EjUbMjN5NSRROHwKrAjSpzFEetwqGPanfPqAXd
         w4510KYTiXJVivIHsFM2RmEyoSXqSs2mMI+cRL+T6ryQG9Z6IqUMyH9nLhzUJm64hu5e
         Whew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717698683; x=1718303483; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBuUGmCzDheOq1IA0IpyH78F73BvUl75t52ZNhSFvxM=;
        b=PxERAPVixcq6+kyfLA/5wQjtJ7scGlyY9nMpiypGPBx7FSdEWNo7CnRx4RBCafzxPv
         49pkYun/3lijAV7NuAG9q+DC1HmZ8xYRjNaUJ2vHuj74P1qyEPfAhITbnOpi9H37cwX9
         069sSFJ+U5aHMtr5jlP4Zff+/qlodsCTKx2ccWuvS/NnLzlPHwd2qDWSGcMhrUNACVDz
         6nIkOCap1GJRxaqM7E49Q5HaPvlQGlE+nWJPildSgYoSC5hz3t+x6BhpU7axQgwy3ki+
         KhniBBKGRITzQGqJ+AdFlFbq3QI3+bZ5DzmHyCwHR1ldG5Om5X2X/5aDf0DQMG8k0rnf
         hPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717698683; x=1718303483;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OBuUGmCzDheOq1IA0IpyH78F73BvUl75t52ZNhSFvxM=;
        b=ntqirSIl8uZ8KS1lVw9R9ucNooxuXzrqCB+sWaZa23zRRsOclvGYziemdYrJndBXsj
         hyIxqYPabehJeJiIObzXa09q56L64xCup3HzlEzfwnJLVOnIaZHNYd3xVM0dZdZWqCgD
         N5wh1MU2/xEZo4ud/jBQYNpnhz827fS2RmhmcVTlyEU2mtW7bJqbgjba8dO2Db6TV+iM
         SLABi5uWEV88D2Tf6XRmk2xmYu4pr36jG9DctgZy286tB1+gmQewNWatOjvnJSGFvIkA
         EOEzlY9Mn3jWfM37jNvZxHCatOqDSJl32SHRSwwdqXQ1DuDXFiNeqmkmyfzz3kJTdmNp
         dIaw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUm4p+JP/RWObVPbPYxlKlHxN/cXD8j3+tQQV41ljnsgZH7l0OW2bIAagRTT9qKWaLibBpBSDzZ4n3BGS7E7i5IrzXbEKbHgnkL66I=
X-Gm-Message-State: AOJu0YzMI07dQ02uZps3f5ay+WHv1Whc/foyVZptxJLcZoUrHqcY3evC
	6UeUnJSwpMHF3jjGLEQ4myiFVS4/WZq2XPQGeX28NbnzLLe6VV4r
X-Google-Smtp-Source: AGHT+IE298xmZZT3rKmNDlTo9EO4I8mbZwpHTFYH9mmnc8qT2pyqzWtCDzpFbVl+2EQgHeLt/H23Mw==
X-Received: by 2002:a25:9385:0:b0:dfa:e0eb:5eeb with SMTP id 3f1490d57ef6-dfaf6499093mr262634276.5.1717698683358;
        Thu, 06 Jun 2024 11:31:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:fc22:0:b0:dfa:56ce:d390 with SMTP id 3f1490d57ef6-dfaf12a27edls540508276.0.-pod-prod-08-us;
 Thu, 06 Jun 2024 11:31:22 -0700 (PDT)
X-Received: by 2002:a05:6902:1101:b0:dcd:88e9:e508 with SMTP id 3f1490d57ef6-dfaf65535acmr55257276.5.1717698681677;
        Thu, 06 Jun 2024 11:31:21 -0700 (PDT)
Date: Thu, 6 Jun 2024 11:31:21 -0700 (PDT)
From: James Pemberton <jamespemberton420@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <94308113-15ad-4b8d-b834-5ee646aaff9fn@googlegroups.com>
In-Reply-To: <c62f4a27-91cb-41a2-947a-ffdadfc4a692n@googlegroups.com>
References: <1e84942d-5882-4515-8312-2623d641ee03n@googlegroups.com>
 <c62f4a27-91cb-41a2-947a-ffdadfc4a692n@googlegroups.com>
Subject: Re: Order Psilocybin Mushroom Chocolate Bras
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_16457_1445215900.1717698681243"
X-Original-Sender: jamespemberton420@gmail.com
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

------=_Part_16457_1445215900.1717698681243
Content-Type: multipart/alternative; 
	boundary="----=_Part_16458_1757500604.1717698681243"

------=_Part_16458_1757500604.1717698681243
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy all your psychedelic products with me including clone cards
All products are available for deliveries and drop offs
Fast shipping and delivery of packages to all locations worldwide=20
Let me know with your orders
Text me on telegram @Carlantonn01
You can also join my channel for more products and reviews,link below

https://t.me/psychoworldwide01
https://t.me/psychoworldwide01
https://t.me/psychoworldwide01
https://t.me/psychoworldwide01

Backup channel below=F0=9F=91=87=F0=9F=91=87=F0=9F=91=87

https://t.me/trippycross1
https://t.me/trippycross1
https://t.me/trippycross1


You can let me know anytime with your orders
Prices are also slightly negotiable depending on the quantity needed

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/94308113-15ad-4b8d-b834-5ee646aaff9fn%40googlegroups.com.

------=_Part_16458_1757500604.1717698681243
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy all your psychedelic products with me including clone cards<br />All pr=
oducts are available for deliveries and drop offs<br />Fast shipping and de=
livery of packages to all locations worldwide <br />Let me know with your o=
rders<br />Text me on telegram @Carlantonn01<br />You can also join my chan=
nel for more products and reviews,link below<br /><br />https://t.me/psycho=
worldwide01<br />https://t.me/psychoworldwide01<br />https://t.me/psychowor=
ldwide01<br />https://t.me/psychoworldwide01<br /><br />Backup channel belo=
w=F0=9F=91=87=F0=9F=91=87=F0=9F=91=87<br /><br />https://t.me/trippycross1<=
br />https://t.me/trippycross1<br />https://t.me/trippycross1<br /><br /><b=
r />You can let me know anytime with your orders<br />Prices are also sligh=
tly negotiable depending on the quantity needed<br /><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/94308113-15ad-4b8d-b834-5ee646aaff9fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/94308113-15ad-4b8d-b834-5ee646aaff9fn%40googlegroups.co=
m</a>.<br />

------=_Part_16458_1757500604.1717698681243--

------=_Part_16457_1445215900.1717698681243--
