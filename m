Return-Path: <jailhouse-dev+bncBCVZJANLUQORBC73RGZQMGQEFRPUGHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id E98528FFA26
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2024 05:25:01 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id 3f1490d57ef6-dfa56e1a163sf2998680276.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2024 20:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717730701; x=1718335501; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jfi1+EorfSuFmAZ3aVSs7O2UG5Amt8Mfvl4jdTiCwEM=;
        b=fvla9EqHPcGLePX5k9yI1D+FPkh87n9TtMB2/Rz9ci/sH1uZNy64u1n0riF42xH83M
         PW2dUTf5Fb2hETe8Iom4cAezoqcH2oengMUWHq/wkdvr0HiWaZfk36DIneGrBDfbDWu8
         wSOrUHNH6DMsMJsjvNKaRych0tDL1yyTlH3uFKHEIyXgavUNF28KxHUROF4sThNSCaC+
         XVYt4Gytr8U6S2vn/R3YxuS8MEiO66qfkaftzzJv6jAiesbHWeOlgCeYO9QpSNWiuZ1e
         Gx+o6lYD2sFFzNCMcwwU+4m74PIWAyT6VnC3ab/DwBl23WXPtiULb0HdSXkvDA5r6PxO
         rhPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717730701; x=1718335501; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfi1+EorfSuFmAZ3aVSs7O2UG5Amt8Mfvl4jdTiCwEM=;
        b=hX62FT1TAzSXvgmAOf0awunk1/ZyNHkbvPN8WtnhYkAEHUhIWuwIDyY1qlSsUnN42Q
         HmHu01SUox+NKGCyUAFW4CiWW/Jb9ahi9B23kqH64wNVdP33vBeJXvt7ive6z54dgBfX
         a+PmQl1NeSAENvbj6y4KJ/+gBib0RxGB8G4sf8BfhER8vlvLshV8QI8pTNSzmzWUARY6
         HLJsUKudQM70Y126M9PEswEZS64bsD2wLRvc5H641Hvs+1OZzw/XRxElF6VZBY5gw3KN
         dIEXn1faX5L7R99DFZljvm9nN9kV6FCtb2mOOtE5F6da5l2pwvw6o25c2yBvbE6o0m9q
         rzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717730701; x=1718335501;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jfi1+EorfSuFmAZ3aVSs7O2UG5Amt8Mfvl4jdTiCwEM=;
        b=arPbtwbYP7JeO6nZY3qzOO/KI2T8vgSWp50v7nf1A3a6aSvBvlS4wzbdleXTCZSFV/
         zs9LVuw/Li5qhOAtSpXPpb5OuB07MHiauAveqYz+mbknIKNES1+1sruho94e3ctjlP5B
         cY+SYEwqI48qVEsUmfIWTDjYoaClRlUW4ogKY2cHxvLE8ylDmu1w05yW8mKlLnbQKgvD
         kKYganNuE+3QijEsoKA4MztFlkNb3kkZ3M+i43do7p52RYywwSuoV0zKDjN9jGaZEN/C
         9L06DzKgRWp+aSePdVkAtnD8KJFG3OIVeolVRxMhhmZNqEgDbJs2SA0cSUoyV4Uis6b7
         0JWQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVIerjSlKqlNXWzP/eVdPAdSn2elXzgVefFztCee+qEcVAUq5axuADVInJ0YC7iU8v1niYXjvl/UWuOocw6e5HsC0m0BddE7xJ5d40=
X-Gm-Message-State: AOJu0YxKJid7t9+Lpo4m8rJN5hrUFrvFADys5NoOkVqELI/aYh1iKQWK
	0D7+k8ZHjdz2XN5JR9N5MjeRp2P0x3i5c2SSURAS1edHlZHGd3Ka
X-Google-Smtp-Source: AGHT+IH0zAxRAud5UbW/BIbVjkvdyrWrMdopV0AAkE1b8svhuJXl+g6k3d+/wssfV+wlbotCn16cWw==
X-Received: by 2002:a25:df8b:0:b0:df4:d875:a7e2 with SMTP id 3f1490d57ef6-dfaf65b6669mr1280602276.44.1717730700699;
        Thu, 06 Jun 2024 20:25:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d6c4:0:b0:dfa:7e23:93a1 with SMTP id 3f1490d57ef6-dfaf12488afls436006276.0.-pod-prod-06-us;
 Thu, 06 Jun 2024 20:24:59 -0700 (PDT)
X-Received: by 2002:a05:6902:154c:b0:df7:6206:4bd6 with SMTP id 3f1490d57ef6-dfaf64ebd7fmr405192276.2.1717730699023;
        Thu, 06 Jun 2024 20:24:59 -0700 (PDT)
Date: Thu, 6 Jun 2024 20:24:58 -0700 (PDT)
From: Smith Crower <crowersmith440@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7f84c7bb-2fb2-436c-afdf-af021d6ccb2cn@googlegroups.com>
In-Reply-To: <04ba9710-af26-4c54-84f2-60f8836b94f6n@googlegroups.com>
References: <aeb5c4c3-f9da-438d-a0fa-02974b4397ean@googlegroups.com>
 <0a720ed1-6623-462c-ad4c-0b57cabe7c29n@googlegroups.com>
 <029f47ed-444c-49f7-9601-0e2cfb412d8en@googlegroups.com>
 <242ec17b-87be-4542-b0df-8a9c2675d2c9n@googlegroups.com>
 <1a06faa1-e727-487d-921e-7588c6efaff2n@googlegroups.com>
 <88aa3b87-0e2e-4ffd-93e0-6b6ec7bd6e02n@googlegroups.com>
 <04ba9710-af26-4c54-84f2-60f8836b94f6n@googlegroups.com>
Subject: Re: Buy DMT, LSD, ECSTACY MOLLY USA
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_163005_1835237274.1717730698454"
X-Original-Sender: crowersmith440@gmail.com
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

------=_Part_163005_1835237274.1717730698454
Content-Type: multipart/alternative; 
	boundary="----=_Part_163006_269936560.1717730698454"

------=_Part_163006_269936560.1717730698454
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
jailhouse-dev/7f84c7bb-2fb2-436c-afdf-af021d6ccb2cn%40googlegroups.com.

------=_Part_163006_269936560.1717730698454
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
om/d/msgid/jailhouse-dev/7f84c7bb-2fb2-436c-afdf-af021d6ccb2cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/7f84c7bb-2fb2-436c-afdf-af021d6ccb2cn%40googlegroups.co=
m</a>.<br />

------=_Part_163006_269936560.1717730698454--

------=_Part_163005_1835237274.1717730698454--
