Return-Path: <jailhouse-dev+bncBC33PBVJQ4BRBNMKRCZQMGQEXFKWCXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6658FF4F9
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2024 20:51:35 +0200 (CEST)
Received: by mail-yb1-xb39.google.com with SMTP id 3f1490d57ef6-df7a6530373sf2227630276.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2024 11:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717699894; x=1718304694; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Zxn6kwV7tRUjYXQ4mxmisUNPDE2a5nHhdm88Mnh+s4=;
        b=h6QAbhkydGEKcRUxH/HoL99JtAB1vHYjyD1oM5sY58iDr5Uao3DZsyW8RcHjHV+CoZ
         Tda2zhK6q07/oce28tRy0qKlDCEf+bc05RMcDWMoHbjDRjPvA5D/Kg+QSGfxJuUOIt8k
         ExL6LzG9qWZD6Un1P6mc8h0IGV2OxuEUdNjbrDg/X2exP+iBpH0NodVEWMdjzgUZ6VVX
         ITNnelb46CvNQkMt2/OPOxZGwqSONvEwltAM1idn8kr83oqMIvkV0o64/PFpj8fcL4lC
         IL0SVHGNY3Sv7LtldmMxoV5xxviGmoy6e6XQSiHWhkaRQhfngWTPS+51NS+7rWgQ8OrA
         E+ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717699894; x=1718304694; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Zxn6kwV7tRUjYXQ4mxmisUNPDE2a5nHhdm88Mnh+s4=;
        b=IX0KVOaCaYFpQdkToWvmnsWThCoDRRwUNR8KnMczsLfj/pGMOH7mTI31PrY0cuv1Wt
         KM+ScRSjwT+AmxcDEsTFeuIj1BER0ecUasYHyCNA9OShJxZCaRaneLpgv2NRgzoGYlkn
         dktctcc6KAtHTK8bRU2LC3saBWLyen3BkIpUcuW1wjgBBc9SsLLf03LYkA47/ZT1MeCu
         QovhXu8t7uXH208dnNSwCJvM4/jC699pD1uFXwt2+g3R/TjL/akZIUFQw0S4Nvutc8ph
         fU/MUFo1FrPYJUEDYiQG6TWUKvhmgVNsgP3rMZGcHSwDLU6QY5aANT0sMkfzlgB4UN0c
         9EEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717699894; x=1718304694;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Zxn6kwV7tRUjYXQ4mxmisUNPDE2a5nHhdm88Mnh+s4=;
        b=txpVW0RWpm7tUB9KnI/k2UJjNwdeKself4gEH6SZrKrP9QylrrRcD78X/h7eXZAni3
         wcrdT0E776Z1wpiL2l+9grmPHyLmaPs5jpnb/8cU0Ims6cy0k85Bhi872hAjBjsDK8vX
         idnofaE7vCeNSGlfDgVmFOacodp0aUdHBVXs0Rtpxd1PzIz22WTe7IQFJL24T6ipt67S
         LNm29Bkoie3vGozpuKoIet/UKz1Sc0yJ21w8PlWThFYp/puQ6Zuj3oKdIE25oxQe/DD4
         PbwUq+D2UQ3hRmWTIAc5KIuVWpAfOFR/u+C1L5Dh9mdEjWowN8uXAlilGoKk717DuwHj
         5Tjg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCV7O2yimPwFBVT9qcTga7XXbJ0ATdlgJj5wdM8jZ/4jy3Qik+aHkwThqNrAHvjil8t6Hgc2u0DJs9GiPG3ibmZWY5p++s1ymoweuAs=
X-Gm-Message-State: AOJu0YyOXluicE1wf7QYmWyyevTjaoS3F9RZXKghE/tbO6+hjC8A7Syx
	wloZnJbEwq3PSeztLX8ZMQ/gXePOBhBCfE4jPiuze79g4tvObKnG
X-Google-Smtp-Source: AGHT+IGZI1h9Q9skLirXIwThy/EFEA0p8fh7CLXNoJUPUep7n8278L98uuaHY5IKB3VPrSx08h9ozg==
X-Received: by 2002:a25:6814:0:b0:dfa:7e84:cb5f with SMTP id 3f1490d57ef6-dfade9ddd2cmr2893211276.3.1717699894303;
        Thu, 06 Jun 2024 11:51:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7b03:0:b0:dfa:ce69:d4d5 with SMTP id 3f1490d57ef6-dfaf162a2fdls608805276.1.-pod-prod-09-us;
 Thu, 06 Jun 2024 11:51:33 -0700 (PDT)
X-Received: by 2002:a05:6902:2b08:b0:df4:d816:f5d5 with SMTP id 3f1490d57ef6-dfaf65b2789mr96811276.5.1717699892741;
        Thu, 06 Jun 2024 11:51:32 -0700 (PDT)
Date: Thu, 6 Jun 2024 11:51:32 -0700 (PDT)
From: Julse Ferry <ferryjulse@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <67397328-e73b-4abf-8d19-25bb96459d58n@googlegroups.com>
In-Reply-To: <cc24c93e-ebc3-45a1-a4c6-f0278f189437n@googlegroups.com>
References: <f4fb0b7c-dfe1-4238-9804-8042307e2764n@googlegroups.com>
 <cc24c93e-ebc3-45a1-a4c6-f0278f189437n@googlegroups.com>
Subject: Re: BUY MUSHROOM CHOCOLATE BARS ONLINE - BEST PSILOCYBIN MUSHROOMS
 CHOCOLATE BARS ONLINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_106360_2097257145.1717699892172"
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

------=_Part_106360_2097257145.1717699892172
Content-Type: multipart/alternative; 
	boundary="----=_Part_106361_1204402273.1717699892172"

------=_Part_106361_1204402273.1717699892172
Content-Type: text/plain; charset="UTF-8"

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

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/67397328-e73b-4abf-8d19-25bb96459d58n%40googlegroups.com.

------=_Part_106361_1204402273.1717699892172
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
br /><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/67397328-e73b-4abf-8d19-25bb96459d58n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/67397328-e73b-4abf-8d19-25bb96459d58n%40googlegroups.co=
m</a>.<br />

------=_Part_106361_1204402273.1717699892172--

------=_Part_106360_2097257145.1717699892172--
