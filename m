Return-Path: <jailhouse-dev+bncBDTPDP6E6MLRB3O2RWZQMGQEEPG6XTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A17900CE3
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2024 22:28:31 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-df4d62ff39fsf4214443276.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2024 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717792110; x=1718396910; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iX2ULjjOxOBjmNitoKotXJ5tjM2zmtXtu5SIdVxc/Uc=;
        b=Ko+/A0MnET6uZNUzyZA+o+Grb75qWS5L+kN2d+fuVnZeop9Brwt7dHf2iLcLnWDpET
         HBJ14C8D97IQutfGPne63wmi6qZV+z0rk7IV++fjDmGdlyln0NT8EgMrprnZnieP5VSu
         uKp96LKd3OLwfzXtRQBG5ZajdVhYgXfsD8N0EEeTUvfOHIHkkZu6954PfAm38UElpsbz
         pDpJy7Ad4klXp3VykN0xZBDZblW9vHLGjBaoUSiq8qRd3qVnWBN0++P+vqbFZLVjAvy2
         N7lHf5XSZfEwNqGOF3mb7gBNka9zuZBft6mJwEId3FsKxs7qcyQTmKlXyJzp9WQonx4l
         dihw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717792110; x=1718396910; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iX2ULjjOxOBjmNitoKotXJ5tjM2zmtXtu5SIdVxc/Uc=;
        b=JyttOh6Otx9arRznjsb1E/cI+ZWUxFiAphEbX00ZveS0rfQ/vPdMoLyGO4ycR9/LIp
         8JacOG7IlT7mCei1xtwJH42/KhvtB+oYk/mE3UFobEDPgysLfjMJY0tKByKKcZ0qCzAk
         C8U0WN4KOToXzvC+q3GgAi5YMHYt3VYyIv6/P6BZI97PcihtQ5hSx/Z4NibvPZmTosQh
         z+abYAKj0xPeNs66rWUhT/3LdKcvlwu7iC9sn4cTrMg2fKV/QTD8uUS0yZvE+fSgW229
         WU8Dh6JgYRbrU6iHJefHA4WFsqNnE3gCCIzd+5PUsrqQ3mlTsY/cVPEcO3mC5/TZ84gi
         C6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717792110; x=1718396910;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iX2ULjjOxOBjmNitoKotXJ5tjM2zmtXtu5SIdVxc/Uc=;
        b=VcoETwU9WMyBjGCbRj6XRmOAGxK+CgIxSMR9dcdBubbJGBJcKTCrHZEWyO2jS+nhGC
         qr6Z3sq97M4X04O9jdpdIwDDY8olTMdVNbnXPs80M3kX6cFhjuO/EsVuiZ29juG9uymE
         tDXZLhXPjLZhEBCRAaBCaQx8yckK8LD/dRdTkLyfUozbTUgBBc2MhcW8TppcbZujBnqr
         JyArwAPd8QhyTfdukyTVNGQUx6v8FAw6J9W5qOEejAtoEGDL0SY8fS9B/D4TwxyVWH7c
         fHvI9EWiLyEnv6rMS7Wo1RVTSdu7HjwLjdGsggjNRLew+EBsGsrq6t6iCBzCUsry8JIR
         sJ0g==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCV5xJ3LNPRP+LCarm0/Sfcx8EUp1k6bu178SluxJWYmyi7idMJBjSvkuiORUDdYjequwqcRgNXEUsxyvcRBluR7mHOFO0FwgnCKGQM=
X-Gm-Message-State: AOJu0YxYbRednGY1kPnYMxaPpRR/ajF/LHq4kzel/04+Myh8jkZVOmkO
	hA46UeYV6xsXOlJaInT8+m0pCWFGJDHrmTxuuxDnV0NO3BJyDmgo
X-Google-Smtp-Source: AGHT+IE0CTsXnp52jDnEsRRzQjhNgPhVWXKR6jwdgfl+dXD//UafnUbEMfvScZb+o9Xn+5WemZysCA==
X-Received: by 2002:a25:aa4b:0:b0:dfb:6d6:a542 with SMTP id 3f1490d57ef6-dfb06d6aa3amr1850141276.28.1717792109723;
        Fri, 07 Jun 2024 13:28:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:fc09:0:b0:dfa:77ba:dc1f with SMTP id 3f1490d57ef6-dfaf162a805ls1805279276.2.-pod-prod-06-us;
 Fri, 07 Jun 2024 13:28:28 -0700 (PDT)
X-Received: by 2002:a05:690c:6101:b0:62c:67f4:507 with SMTP id 00721157ae682-62cd5663ca3mr8708997b3.7.1717792107864;
        Fri, 07 Jun 2024 13:28:27 -0700 (PDT)
Date: Fri, 7 Jun 2024 13:28:27 -0700 (PDT)
From: Macurley denzy <macurleyd@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <111e88df-9627-43bb-9f9c-6fbfb42bb2efn@googlegroups.com>
In-Reply-To: <24fd936d-df08-499e-a84f-27a878af50a9n@googlegroups.com>
References: <1e84942d-5882-4515-8312-2623d641ee03n@googlegroups.com>
 <c62f4a27-91cb-41a2-947a-ffdadfc4a692n@googlegroups.com>
 <94308113-15ad-4b8d-b834-5ee646aaff9fn@googlegroups.com>
 <89fc6920-718f-4d39-ad92-f97a37c93578n@googlegroups.com>
 <24fd936d-df08-499e-a84f-27a878af50a9n@googlegroups.com>
Subject: Re: Order Psilocybin Mushroom Chocolate Bras
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_239036_1982387290.1717792107391"
X-Original-Sender: macurleyd@gmail.com
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

------=_Part_239036_1982387290.1717792107391
Content-Type: multipart/alternative; 
	boundary="----=_Part_239037_1392512696.1717792107391"

------=_Part_239037_1392512696.1717792107391
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/111e88df-9627-43bb-9f9c-6fbfb42bb2efn%40googlegroups.com.

------=_Part_239037_1392512696.1717792107391
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
om/d/msgid/jailhouse-dev/111e88df-9627-43bb-9f9c-6fbfb42bb2efn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/111e88df-9627-43bb-9f9c-6fbfb42bb2efn%40googlegroups.co=
m</a>.<br />

------=_Part_239037_1392512696.1717792107391--

------=_Part_239036_1982387290.1717792107391--
