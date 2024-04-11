Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBVW74GYAMGQEADV5B5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1508A222E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 01:18:48 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-ddaf165a8d9sf595401276.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 16:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712877527; x=1713482327; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26ghIMlWMbzUu6k3eJGRvZh3ajEcdeSVv7cA5rYEImg=;
        b=UHLsGe09ZgkbNP2bvnIoEPU2kW9XjcTvbDORb0rD69epLIoC9KtvtPGy0Fq3RefeWx
         fxxnf5+ZZuV0rFi/Qpqmy4NY9koe9A8WJYeJhAwnBKXiIjSuOBEJDrGjVmIT+JDXSY2T
         VY0Iu/pIppiD1Y0UVzBZI/nTnew2fiOxLsEei06cRojQDFUi1C/EO1JFbcPC+lqKyLwg
         tegrPRwP1B1FJ9EzJajJCNN8T9m2eW4vPmfgsBO5au1NERC3JM1Aoz2/LkBi4tVAM183
         GbRqWTj6aVZJEQRnnSyqNdlyZeUlrE9T/ZitzsayDVa6N+NN1YRgoAho1tNUWw/KMuaG
         VN4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712877527; x=1713482327; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26ghIMlWMbzUu6k3eJGRvZh3ajEcdeSVv7cA5rYEImg=;
        b=m4Y1aGryn6uchqqcR9q05oEErooHnGoQ5sWn57SQYyAx55fswOWQpH+dEVVtPgWKOW
         GtTurQy+2qvxaBJNc2pUZumuqIM8VS9rl5AR50ArlrWuWZ1ZjpVbzRYROtPTxzzKdEWU
         +1E93egw66Qa03gDJbLT3SD7dtaHiWA2Ed7HkWoCGX5GUyLMVXGDv3HIh0UJ34+cSmre
         zS5dNk+Ezf40FAvgB5wiJtEvoaSNVT1JUQp0Lf1ouaXCId/3fQwzCnmA3e12eC0dCtX4
         0cgJVjkHhGGwuH7lEjYzP6zru/kugL9eBNpqmHGZlU/l/VjHXJkiV9yICpIvJU6ceVyf
         TZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712877527; x=1713482327;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26ghIMlWMbzUu6k3eJGRvZh3ajEcdeSVv7cA5rYEImg=;
        b=YnG1YoBoeAYhPFN6+2nYg6yH5RglQxgfD/EUG8CEojr+hezFvNWaIps1OLKjTgeBKo
         Cm3fB5HpfQWQH/3HXW4aU6w3HX1Q5Es2Jbi+oxUS5D/vcaUysVjkbP2SoVExpuM3m5JA
         HiytYXF4lRyjwY8E7PeQb2z3PkrtNmLYGx1PuRBtJqaxsr1GZsWuoGqg/H3JeEtaT/Cf
         KgoiEYXiLXn2ySLO3RaVv4o/z6mLSAjnjSEK/xKFTJ1JMtFVwQq4n+9yMWtFn/XDhYYP
         pvDwpb/DTTwp46RKg1DKSERygLgoejVbOtDiGKIkMB/yq9TbzzdcAPGMYNnfjUGJM6fh
         cLrQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXeqLPUxP0CANx2ksfmHgFjwyO2k82Ywe97EAP4Uh/Y1GP14nGKMGSltU3tdQC99ViQ0voUbQSeIY2WNswKGAo+fLa49ZOY7AFc8js=
X-Gm-Message-State: AOJu0YxJVaY5Pj2E58gCU29eoy9Q3m87xQi5pKVwhrrTIOGMJKL3VE+6
	6FBrGl14mJ5lP9N/w55izZibcNjGpYgGvz6Yupj1OTCCq1astO59
X-Google-Smtp-Source: AGHT+IFiUIMHAGLIxc9JKisEnYrcyttg1hRsJv/xCeQA4QQoVQ4kdq3Xme0vcimJcry6ZHeKhbXi0g==
X-Received: by 2002:a25:be84:0:b0:dcc:58ed:6ecc with SMTP id i4-20020a25be84000000b00dcc58ed6eccmr903484ybk.41.1712877527172;
        Thu, 11 Apr 2024 16:18:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:dfd4:0:b0:dcb:b370:7d13 with SMTP id w203-20020a25dfd4000000b00dcbb3707d13ls478398ybg.2.-pod-prod-04-us;
 Thu, 11 Apr 2024 16:18:45 -0700 (PDT)
X-Received: by 2002:a05:690c:d17:b0:611:2c40:e8d0 with SMTP id cn23-20020a05690c0d1700b006112c40e8d0mr204725ywb.3.1712877525506;
        Thu, 11 Apr 2024 16:18:45 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:18:44 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d185ed11-12a1-4109-8071-f47d79d63d56n@googlegroups.com>
In-Reply-To: <E6DEC645-7662-4D3A-A532-86E4023BF913@gmx.de>
References: <20230602074808.1383333-1-bigeasy@linutronix.de>
 <BD7FE16F-42F5-4D5C-9182-2AFC442B43BC@gmx.de>
 <a31396bb7a77423097daa430eb011f6e@kumkeo.de>
 <E6DEC645-7662-4D3A-A532-86E4023BF913@gmx.de>
Subject: Re: [RFC PATCH 0/4] arm64: Limit cache invalidate to local CPU.
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_215986_125061625.1712877524909"
X-Original-Sender: massimilianodimajo097@gmail.com
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

------=_Part_215986_125061625.1712877524909
Content-Type: multipart/alternative; 
	boundary="----=_Part_215987_1234408688.1712877524909"

------=_Part_215987_1234408688.1712877524909
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER
PAYPAL TRANSFER
CASHAPP TRANSFER
ZELLE TRANSFER
LOAN DEAL
TRANSFER WISE
WESTERN UNION TRANSFER
BITCOIN FLASHING
BANK ACCOUNT LOADING/FLASHING
IBAN TO IBAN TRANSFER
MONEYGRAM TRANSFER
IPIP/DTC
SLBC PROVIDER
CREDIT CARD TOP UP
DUMPS/ PINS
SEPA TRANSFER
WIRE TRANSFER
BITCOIN TOP UP
GLOBALPAY INC US
SKRILL USA
UNIONPAY RECEIVER

Thanks.


NOTE; ONLY SERIOUS / RELIABLE RECEIVERS CAN CONTACT.

DM ME ON WHATSAPP
+44 7529 555638

On Friday, June 2, 2023 at 2:20:11=E2=80=AFPM UTC+1 Oliver Schwartz wrote:

> > They do not address the same problem. I can not see that=20
> flush_icache_all is modified, so this will not solve our problem. This=20
> patch will only minimize the effect.
>
> True. However, the same mechanism can be applied in the places where=20
> flush_icache_all is called to decide whether a cache invalidate broadcast=
=20
> is necessary or not.
>
> Oliver

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d185ed11-12a1-4109-8071-f47d79d63d56n%40googlegroups.com.

------=_Part_215987_1234408688.1712877524909
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER<br />PAYPAL TRANSFER<br />CASHAPP TRANSFER<b=
r />ZELLE TRANSFER<br />LOAN DEAL<br />TRANSFER WISE<br />WESTERN UNION TRA=
NSFER<br />BITCOIN FLASHING<br />BANK ACCOUNT LOADING/FLASHING<br />IBAN TO=
 IBAN TRANSFER<br />MONEYGRAM TRANSFER<br />IPIP/DTC<br />SLBC PROVIDER<br =
/>CREDIT CARD TOP UP<br />DUMPS/ PINS<br />SEPA TRANSFER<br />WIRE TRANSFER=
<br />BITCOIN TOP UP<br />GLOBALPAY INC US<br />SKRILL USA<br />UNIONPAY RE=
CEIVER<br /><br />Thanks.<br /><br /><br />NOTE; ONLY SERIOUS / RELIABLE RE=
CEIVERS CAN CONTACT.<br /><br />DM ME ON WHATSAPP<br />+44 7529 555638<br /=
><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On=
 Friday, June 2, 2023 at 2:20:11=E2=80=AFPM UTC+1 Oliver Schwartz wrote:<br=
/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; bor=
der-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">&gt; They do no=
t address the same problem. I can not see that flush_icache_all is modified=
, so this will not solve our problem. This patch will only minimize the eff=
ect.
<br>
<br>True. However, the same mechanism can be applied in the places where fl=
ush_icache_all is called to decide whether a cache invalidate broadcast is =
necessary or not.
<br>
<br>Oliver</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d185ed11-12a1-4109-8071-f47d79d63d56n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d185ed11-12a1-4109-8071-f47d79d63d56n%40googlegroups.co=
m</a>.<br />

------=_Part_215987_1234408688.1712877524909--

------=_Part_215986_125061625.1712877524909--
