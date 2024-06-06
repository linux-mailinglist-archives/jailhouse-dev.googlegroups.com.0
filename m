Return-Path: <jailhouse-dev+bncBC33PBVJQ4BRBKEORCZQMGQEWMM5PTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 867A78FF50F
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2024 20:59:54 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id 3f1490d57ef6-dfa5a126302sf321149276.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2024 11:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717700393; x=1718305193; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRgjKnDfCIaVXXQrx0+6tFHiHYvVfYX2P+oEmyNYAPM=;
        b=XpyA8nKDWLzWR9q16WZPL/T/W5Vm/TOKbUCLmO/ZoTka53mhr/pU7MAkimixOKz2xh
         DD6tYR5ykq5JkcEa8dd6fXD12pBFJg4hpgOY2tGjoL40tzCCBxXx1/Y049Po1cKHU9NT
         ZbmhiDPSRX2E0VkPLrz/PQgxYeC7tIxXiOuO4cDztlgmeIcdVv6p+zvsV2ji/mY+hsaN
         9lqIwbY06karklek/s/LXLFUUm2X2URaoNxYPsqLWN3AT3tQbQ6sPMUHNEKsWZoyKuTd
         KcDjQzJDP2GRE3OFoiSGflhA99YEhAOg42k8YYVPv9GgfPRrnnliWvJmmTEzEDj3XTiW
         q8cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717700393; x=1718305193; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRgjKnDfCIaVXXQrx0+6tFHiHYvVfYX2P+oEmyNYAPM=;
        b=I1G2+5xnUQd7CGBqH8lzAuvEVl4de++gWfzkTxwqlgHqslXAwgvHft0sHC2bB+X+ew
         I6tTupQ87owhf8F1zrCmXARX3gTR2r0i+m4+cabl+WSGGfTmBcF8MOBtsUZaUskHRZ6S
         NRqP7fjJk8bV/9uB0hlwCuMADzwdpOX+NxVFJ/PSMRyWr+zuqzOAMuBW2JSRcE5vdBPR
         EfucTdwgVRHCnSWHPSUF4ebLIdJK47U/MAYpVpyC8DYXB+MaU0agYlF/kPD5x7hGlf28
         yv5mhtAA1EoGXIRACZjZqzDhS46R3Bss+horgr7KyeB9iWqNp5w/nO+GZJll2c79hdxm
         +jQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717700393; x=1718305193;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRgjKnDfCIaVXXQrx0+6tFHiHYvVfYX2P+oEmyNYAPM=;
        b=UaWHhnB1RFCNrBi1Qg10GpiPtWowmp//TarI7fhBDCNjyLesk4LeWandvK+R31XtmS
         9rtOD8cABgplg0efF89oEILdGGG/NRtSfV+oeIz/kEI3m3k85weP64toxxZceaNe4QZA
         bRV6ESr0Aw22Kh+ffey/xxQ+xll0nNIebfm2ErO8LlvjPASP6XihvgMT59FPb3+tfP2K
         TxN7WPxnoFjVybiXB0XMk8igAzbDWJ6NH66Uzorpcmvqbi25Y9Sg1BUwSorFnis9CSNp
         Gl475OVXvI31rvlzO0NI8YvJaJCAUsuqitmpeSzX9CVwD2Xt9PMfy/JfMVyPivkxuyN4
         eZEQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWug+vuOLDe3Vz206hQ7+gfB57A2AYBcmkK9CtPKlQboHnjEbp7HqQ+HPOUlNnHSYeqj/fhnyX7UucnNlr+ERs0UR4W68CxNqLTC5g=
X-Gm-Message-State: AOJu0Yx/Hk9lCNI/lqc3auF8h0R4Ah/2zUyeA6kQ8P0aktGtTlwICW2O
	cFX6eADbjHu3LeZbrJ3GTF1OxBism9dIxeYTjglU86gSEhaD+1Ev
X-Google-Smtp-Source: AGHT+IE2FPmzONwj0jXSW637fJJNPcwpmhLxwIEfGjZMDO6JN33YhO4CoT4o6p39bY6hjcQ3vmFx5g==
X-Received: by 2002:a25:ae55:0:b0:df7:a4de:60f3 with SMTP id 3f1490d57ef6-dfaf64f3c35mr292114276.1.1717700393138;
        Thu, 06 Jun 2024 11:59:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:9745:0:b0:dfa:8028:8bc9 with SMTP id 3f1490d57ef6-dfaf15f6c00ls550843276.1.-pod-prod-06-us;
 Thu, 06 Jun 2024 11:59:51 -0700 (PDT)
X-Received: by 2002:a25:ab46:0:b0:df4:da46:75d6 with SMTP id 3f1490d57ef6-dfaf652eb9cmr75344276.6.1717700391452;
        Thu, 06 Jun 2024 11:59:51 -0700 (PDT)
Date: Thu, 6 Jun 2024 11:59:50 -0700 (PDT)
From: Julse Ferry <ferryjulse@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0cbdc9c2-c312-4ecc-a78a-2715367eaa8bn@googlegroups.com>
In-Reply-To: <c09dcde8-54ee-4034-84ae-8882957215c1n@googlegroups.com>
References: <20386664-e1de-4554-a68e-cb40ec82036cn@googlegroups.com>
 <60398463-b922-46d6-8472-3259aa26b5d6n@googlegroups.com>
 <d5a1a6f4-91a8-462e-9750-3a0268433255n@googlegroups.com>
 <88b31542-2fed-47c2-94eb-c4d585904cc6n@googlegroups.com>
 <a40a6d9a-30b7-4bde-a22e-317a8b959309n@googlegroups.com>
 <c09dcde8-54ee-4034-84ae-8882957215c1n@googlegroups.com>
Subject: Re: BUY ONE UP MUSHROOM CHOCOLATE BARS ONLINE IN USA
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_11504_1805815115.1717700390973"
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

------=_Part_11504_1805815115.1717700390973
Content-Type: multipart/alternative; 
	boundary="----=_Part_11505_1728213926.1717700390973"

------=_Part_11505_1728213926.1717700390973
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0cbdc9c2-c312-4ecc-a78a-2715367eaa8bn%40googlegroups.com.

------=_Part_11505_1728213926.1717700390973
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />Buy all your psychedelic products with me including clone cards<br />=
All products are available for deliveries and drop offs<br />Fast shipping =
and delivery of packages to all locations worldwide<br />Let me know with y=
our orders<br />Text me on telegram @michaelhardy33<br />You can also join =
my channel for more products and reviews,link below<br /><br />https://t.me=
/psychedelicfakenotes<br />https://t.me/psychedelicfakenotes<br />https://t=
.me/psychedelicfakenotes<br />https://t.me/psychedelicfakenotes<br /><br />=
You can let me know anytime with your orders<br />Prices are also slightly =
negotiable depending on the quantity needed<br /><br />Call or text +120998=
94742<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0cbdc9c2-c312-4ecc-a78a-2715367eaa8bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0cbdc9c2-c312-4ecc-a78a-2715367eaa8bn%40googlegroups.co=
m</a>.<br />

------=_Part_11505_1728213926.1717700390973--

------=_Part_11504_1805815115.1717700390973--
