Return-Path: <jailhouse-dev+bncBD4J5XGZWMOBBI67Q6ZQMGQEXHIQICI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113c.google.com (mail-yw1-x113c.google.com [IPv6:2607:f8b0:4864:20::113c])
	by mail.lfdr.de (Postfix) with ESMTPS id E78DC8FF38F
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2024 19:19:33 +0200 (CEST)
Received: by mail-yw1-x113c.google.com with SMTP id 00721157ae682-627e4afa326sf18449777b3.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2024 10:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717694372; x=1718299172; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0LRp4Wc1JYeBUZjqvPVcAGtMNyii9ne/h3QcQiBFBok=;
        b=VWA3ptE1J2IBtI9/YmKGgInjprJTZv9EPz4HfgjmIfbbx5Ej1VP6CkGanEDoBYBM6H
         mjxHViwyHgutQNW0yzQpxY6AskwZDjGLaPyacxQfCHti2ykcW3xY6zukJDgCCFbJ2f3t
         AAmPJr0FfQw4pTW66LSu2/YX9WxYzZJ3gG4KYVD7bMDQa/Gks8BD9/+5MJaJHmVzYXu0
         eNRb3mNELjhqBB7KxIX7BdrlOaUyOzPu//DQE9vpeToKy7eryAGtLyN77NxYmjZ6shXZ
         DR587TwqtOCSrLm4MP6B3ilRQussQruAEjQT/8jJVmiys5E5J+1yDjYdYbT1evFZx7/u
         Z+2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717694372; x=1718299172; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LRp4Wc1JYeBUZjqvPVcAGtMNyii9ne/h3QcQiBFBok=;
        b=KPUg3HEv2mvupp2D38KZkO+8NLo/W6JZ8r784V9oV4grBFqeek4lAp4PtTWoGHuwUF
         +ZxIj45L5gP1OfGAAdQeoN6B7GAf2rodSS2SP0swBH3U64p5tuD42A0rVTfSxsV0S3Et
         gSzqcHtTfRArm4uN0FTmNCVGYt+JcliI1VqQpTRpI7DYFfseteihGgvP7aKkhlZZdHH7
         bn8FBtt2sN74Pt7dG3BePtOWScxWVeLxwc9q2YYhR21/UnnJHNW5DnSN/ymoPjI6uZ3J
         wszzwW1MpWy1S8p2JdVD9i+qxuLA/bBTQN++M6ucQoJAA2MeODY5O1fNmlh5og+04om9
         Flow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717694372; x=1718299172;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0LRp4Wc1JYeBUZjqvPVcAGtMNyii9ne/h3QcQiBFBok=;
        b=dp+PIYipxk4Qt2QLoVWX7TBYBUBDHZz9IsdqTfx/GgNcis3dsvCZrR0Qp/Q1oXClu5
         kRsO7ix+mGzqP8Yh7reDiF45vx9vy3nNvy3z/69VIGD15h24i9pzpVK8P6vwuG/5msl2
         Lze9fGaNM+bX+T2zEkRvycFUVNBNYe5EDJ7TX2uA3U7Ff3ZkOMArYvScAkl/CzMVCsJP
         cCVT2Qeo9tZWzt5nAKfBxPLBFNGjpnrgmRbhSmOLzmvbudPXDtPmlWa6SEih+kb9hIHo
         UDBVkA6kvSQVYjYL7MqZKRdF4WgbMO3Wk0Gn9fV+kOJGUTmipCo6GNarHyr3zzBF+WQw
         BmFQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXO65nxtnyzCNlpmy+pw2JU/VovK4qWUzsbkhx1VlOjo7s09NNai0EupHix1Ulzgv7g2NkI8r1f7XNXyMzkg3sv9En5QcaP/YZg4Uc=
X-Gm-Message-State: AOJu0YzyVEX2Cjs1Xr+4Gy1CFIPi5+0SkpWwAZS+Fgu5Px8uzsK2iELi
	6Y7aL+NcLlbNm7UgR0wv550Hcdw7DQQGhRKsl3tcvuf7l24Kv6DY
X-Google-Smtp-Source: AGHT+IH+St8hTI1QA4shY9q4U4uq1GL/MAvjZL2Q5ykvIrVlITOb9Tz/ryEP/YFjUfI5oQHZU/DrPQ==
X-Received: by 2002:a25:b8b:0:b0:dfa:c421:c7d with SMTP id 3f1490d57ef6-dfaf65b3eadmr36009276.9.1717694372492;
        Thu, 06 Jun 2024 10:19:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7497:0:b0:dfa:7e98:585 with SMTP id 3f1490d57ef6-dfaf16316e6ls450417276.2.-pod-prod-04-us;
 Thu, 06 Jun 2024 10:19:30 -0700 (PDT)
X-Received: by 2002:a81:4c03:0:b0:627:a73f:b38 with SMTP id 00721157ae682-62cbb4a1c41mr11852597b3.1.1717694370523;
        Thu, 06 Jun 2024 10:19:30 -0700 (PDT)
Date: Thu, 6 Jun 2024 10:19:29 -0700 (PDT)
From: James Pemberton <jamespemberton420@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c6e2bd6d-17a2-495c-bf75-c5a56224bf50n@googlegroups.com>
In-Reply-To: <c7951ae6-63ae-4039-bded-de14a8e33d7bn@googlegroups.com>
References: <842603fc-b313-4fc4-93cc-09484d5e62bcn@googlegroups.com>
 <73461ad5-1f07-47e3-976b-72a1e7780017n@googlegroups.com>
 <c7951ae6-63ae-4039-bded-de14a8e33d7bn@googlegroups.com>
Subject: Re: Buy top priority polkadot Whoppers mushroom Belgian ...
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_102337_470025657.1717694369930"
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

------=_Part_102337_470025657.1717694369930
Content-Type: multipart/alternative; 
	boundary="----=_Part_102339_1723603386.1717694369930"

------=_Part_102339_1723603386.1717694369930
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
jailhouse-dev/c6e2bd6d-17a2-495c-bf75-c5a56224bf50n%40googlegroups.com.

------=_Part_102339_1723603386.1717694369930
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />Buy all your psychedelic products with me including clone cards<br />=
All products are available for deliveries and drop offs<br />Fast shipping =
and delivery of packages to all locations worldwide <br />Let me know with =
your orders<br />Text me on telegram @Carlantonn01<br />You can also join m=
y channel for more products and reviews,link below<br /><br />https://t.me/=
psychoworldwide01<br />https://t.me/psychoworldwide01<br />https://t.me/psy=
choworldwide01<br />https://t.me/psychoworldwide01<br /><br />Backup channe=
l below=F0=9F=91=87=F0=9F=91=87=F0=9F=91=87<br /><br />https://t.me/trippyc=
ross1<br />https://t.me/trippycross1<br />https://t.me/trippycross1<br /><b=
r /><br />You can let me know anytime with your orders<br />Prices are also=
 slightly negotiable depending on the quantity needed<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c6e2bd6d-17a2-495c-bf75-c5a56224bf50n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c6e2bd6d-17a2-495c-bf75-c5a56224bf50n%40googlegroups.co=
m</a>.<br />

------=_Part_102339_1723603386.1717694369930--

------=_Part_102337_470025657.1717694369930--
