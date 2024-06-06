Return-Path: <jailhouse-dev+bncBD4J5XGZWMOBBSO7Q6ZQMGQEYIJFK6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb37.google.com (mail-yb1-xb37.google.com [IPv6:2607:f8b0:4864:20::b37])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F2A8FF390
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2024 19:20:11 +0200 (CEST)
Received: by mail-yb1-xb37.google.com with SMTP id 3f1490d57ef6-dee902341c0sf1763302276.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2024 10:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717694410; x=1718299210; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkkuzRlBcGhMSFTxx3dAY94H71wGp1/IwKyn0V9ISpw=;
        b=sfnLeTMGDY/BCwSySTZypOHK1bKeCe2rOzdjAywzYulDxjmD0Z6dqdrAR6cRMTtBXV
         seMtRHL38BpblvP9u7DGkSnQ9yzdaYu69DJw7xmu6CHEyWZIm6mQi8yYGmgJwlH4M82R
         mR0lpCL1L00bTMNKY8B0vfZ5szwA5FU5QYZGSxFiWWkh0zS0t+qjMxx3E4rTlU+DBQJr
         3QcsORKqFXqJkprTh0jd3X6khiRzqRV3PBM/72DI0n+3WMh/iwFB7I7DnQMyKfM80g4g
         H8hAvlDDn2lvco98u4GFd5eh/ATC92fIgAly0iJGbPaidk6y2FGCsYlWZmwIgup8+inm
         +5cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717694410; x=1718299210; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkkuzRlBcGhMSFTxx3dAY94H71wGp1/IwKyn0V9ISpw=;
        b=HO0j1UH7E0rFHRBvds7for7ATbTczmYVmj338BLZhS7oTI4tIGRd9hhgf/n8S+OZFr
         NjyfY8+x4TuOlPRLuVkP4VAtFTywXAGUGh3GSEXa0iBm0dnXk1dSwSHlLlA0JYnlIfZ0
         bsGuskNN8km0qwX+yY156IWdCEufGuHXHuiQfh58mgObS9wv8lK+RvEjOfRbBkG/wYro
         3hPkkP9hivpzSf+goeC8ao+MrohUwUONLArEN4wfeqIN7QKGnnwgOObK+aimrYOXZULD
         fhWYYZNCDY9gyC1nS3DU3YKVYwJvRuw6wfjts6yovCxJx+Itr3aFQ05aGh6KswAX+4oi
         Lmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717694410; x=1718299210;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkkuzRlBcGhMSFTxx3dAY94H71wGp1/IwKyn0V9ISpw=;
        b=ttR691+lpno5q7Fm082RzyvvKHPfEeGxsczdfsZU7v0f47r6JV3O4E/pl25JPLzz0L
         ijdjUyRHqCWPn+LKtEvf0x0MCvafZzsRq2ZQSFlgAx+i/fjhi7Gfos0O3EBLl+af44Xs
         cI2xMupegaIG3kBws3J3+6s6VtPk2OpzRKsefO5ESuuv4P13sw3PVvRew0l3hO7Yq7AC
         HWhD38pOX2NKWDPgFfxzpyR/EYG1r/QCQT+4beawivfsn+AZVuW7XRFDfYBidFYjI5s2
         oPeCiJTkvzhwexNOcRiXGJoYgN0VcYXLf54XVlY95CTp8oBTdYiEkTmoAlbgH8fffyaS
         pskg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUzx7R5V8Lxt/VvWPr4hTI8H8viSjIdmd3lQCjIcVW4HccRZ2zXHkN/IVUuGMqhvOz2lCCXfFKaTjGEa7UxbUA6EMzCR/UIiNMLGuw=
X-Gm-Message-State: AOJu0YzHz13HecksnYMoTLv5pLL7V3KcxanDjlPCFK3v6SczdffRhmny
	aCAnsYpuzS73guSZRJVEJiQ5/r+9UHB/mCVnD4uBARe7tDTXZ29C
X-Google-Smtp-Source: AGHT+IEiALaFZwY8xosTsR6SC41cXPFrcIE7qwnFCxSXIeFvJBOy/+xsTvtE0/OVjAOugmxyHE7xkg==
X-Received: by 2002:a25:8487:0:b0:de1:1b21:4f8 with SMTP id 3f1490d57ef6-dfaf670b709mr10837276.62.1717694409846;
        Thu, 06 Jun 2024 10:20:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:aa87:0:b0:df7:69a2:f82b with SMTP id 3f1490d57ef6-dfaf1696c0els295930276.2.-pod-prod-00-us;
 Thu, 06 Jun 2024 10:20:08 -0700 (PDT)
X-Received: by 2002:a25:9004:0:b0:de5:a44c:25af with SMTP id 3f1490d57ef6-dfadec0b255mr638320276.5.1717694408264;
        Thu, 06 Jun 2024 10:20:08 -0700 (PDT)
Date: Thu, 6 Jun 2024 10:20:07 -0700 (PDT)
From: James Pemberton <jamespemberton420@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <12efd4d7-b978-4311-a680-c4517283c2ecn@googlegroups.com>
Subject: Buy polkadot bars in Usa
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_118711_755595445.1717694407371"
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

------=_Part_118711_755595445.1717694407371
Content-Type: multipart/alternative; 
	boundary="----=_Part_118712_1444128535.1717694407371"

------=_Part_118712_1444128535.1717694407371
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
jailhouse-dev/12efd4d7-b978-4311-a680-c4517283c2ecn%40googlegroups.com.

------=_Part_118712_1444128535.1717694407371
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
tly negotiable depending on the quantity needed<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/12efd4d7-b978-4311-a680-c4517283c2ecn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/12efd4d7-b978-4311-a680-c4517283c2ecn%40googlegroups.co=
m</a>.<br />

------=_Part_118712_1444128535.1717694407371--

------=_Part_118711_755595445.1717694407371--
