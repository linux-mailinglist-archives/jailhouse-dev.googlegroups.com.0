Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBL5Q77UQKGQEER3PECQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id EA77C7A069
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 07:39:59 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id w27sf6506067lfk.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 22:39:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564465199; cv=pass;
        d=google.com; s=arc-20160816;
        b=aWnosHRUv2Od6kSktXtU6oEwPx3MKXy0GPHaWYJdeEo4h+eXDoTHdozstkwQT4h0dH
         H0UrwsZsSL7HbKbnzc2h29gmQ09+rQuHxjl0O2nKbowfZq749UvfsBJEt3GNeA07AObD
         pCUfgRlwHsO/PORetnBfXkeS8vL7fF8EPtbnJo5xOGoyYyIpJtDI0RHU+r18B02XgaYr
         CwQkLn985NUlLJ18K+lcnMgJwGQUOVKYCQtQuG6kcTz+mf6hHun3X43q8eqNtMUgBAoU
         GLnEC1y4hd7+tXo8HMWbk36OyWMvt33M4ahOIofwqoRxDXI6Aaa/wXy6L1bDZFulZECq
         iZSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=H8jJh42ghzln86DvSGN7UUTQuogZ0TkHG+EwXhvC9ZI=;
        b=Z89iFyctAUHdBqfstFbu7W1Z5HEWNSFFQMbnJ5d4A7CO1Ek7SzM6VVzBWvkMk0+tFf
         2pRcASbCvvENGFuSqMsOs0yrtKwMEgArQ7ZI9UrhI1EEcUpdFdyn0c7+SsHJ1xs2bvGh
         4ETsW6uAn+j27Q5N3D27/vNGglGZ9nwJ+I5m69AwYy46D0UG/G8Q9+zt34ta5kLzWAl7
         IZAh5sD1ntrzatR1R3zm2I4NBrF0BTXQxFU1JMc+owJS0GMMspO1VpCYfs8nu16GPHPJ
         vm8/f6u0wiN+EuYq2HobAJ+4Ye1uKYwMI0FmtqrQXLgnY37aAWIxyzk+2DHzzqXMcUcq
         IPyg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H8jJh42ghzln86DvSGN7UUTQuogZ0TkHG+EwXhvC9ZI=;
        b=X+sFFOXVQ/MGozbtTHrzrE/mo1oibQxeLjW4FjWoXLx1tisjGPKx9M/XfNinuvQxad
         WGtp8tPO+WoW+uPhbngARNT7JogDJfQV6XPt/oOXkv33RYlaB3R2qgQohOFiTROctFxl
         1GNA/iln2wbWd6uyXGfr7nzQvQZUR6tXCoe6ndA+0S9MgS6VY/XF53Dph5PyeTsygkLX
         hJUCA9HVq5oEmFOq2Q9AbgWYo8UKM1udtyykGuKmvANpAV3hRlvt5FepoVDR7qKqpANA
         dLlFCCkBaFICCmaISS/T60HUeaGQH2vRf8a6OgLUxTqIT7Jyl9Hc0GPzZ8VMqBgVptoL
         H/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H8jJh42ghzln86DvSGN7UUTQuogZ0TkHG+EwXhvC9ZI=;
        b=iIDUxaaCtEb5Xj+lfu9kUU5Cy0Q7pAmk0ZQPlJHRvQwwgP84/+I1GolZCaTO6TpSTg
         M5+OqwkeEvc64fBS6cDAOnO9MUoQF/5X2/v0YCMQnkXBVOm4p+wa8ihecaFlgGdnqoh5
         U7zRpqrTykoDKqvFlotoYDGCra84QK7XiVLPRDPMajuQDjT4SKhuCSjeDBTUPfcQGt5o
         7jku+iy8wrIeMqZlQZA445ao+6LRyw0cU902bjFGixEsYP6Z1O7lK2Vb6+VOA654CejX
         HVDv2bRF66LHXYHK7gcf/3NK7fnF0eaiLMYrOZdTsT4oG7wWKHj3swcPqTooqUbeR7/S
         knvg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAULPMbhKCg85QJrWdybsWLmuy9aoeZQMXV7eZHPh+podoOoPQo2
	+Sza1u/FzqDofEXhbMCZEZo=
X-Google-Smtp-Source: APXvYqyrz4mA0L8NbhoS5oVZUYj4v+hPZUYEtm9cYikK4D7yi55W8AspQRypY7XqKqn3BUSthC2I0g==
X-Received: by 2002:a19:f703:: with SMTP id z3mr53477431lfe.171.1564465199450;
        Mon, 29 Jul 2019 22:39:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:6b10:: with SMTP id d16ls5205384lfa.10.gmail; Mon, 29
 Jul 2019 22:39:58 -0700 (PDT)
X-Received: by 2002:a19:5e10:: with SMTP id s16mr52428375lfb.13.1564465198748;
        Mon, 29 Jul 2019 22:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564465198; cv=none;
        d=google.com; s=arc-20160816;
        b=hB7TVzmxkE0t2oasuDJAdvdQETmorOWzuiO1YvkLIqfYPboMZS+Z+vmjexgZ5ytlxE
         53V3Ow8QaR9dfL+bhAH5VMVTCXpINBd/2j7AhujYWb11YN5RXIqo0jpfiyZAx2Y5NO9o
         FjbW/gFvZ/oqFRH/9jO44C4kXEh/3a35zTjIe+T4KOYb6mY8xnhPAtRYWDuN8IOBm5tt
         9kcjZCFalSk8VQZUk6j25lrC9avfAAGAyoqZ7vF1HZG2CL99yJ59MuGXuu2PuBLWXICn
         ZevJKgU2Grx+6h2Yk+rdrUpnR7s8qvGqZrkH0ss0bBX8mG0RpIMAd+aG35opkhKTuQnQ
         JGDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=r+grU0w2yaN4gyvap08rfdx2Q4ETTMZzRIYYTgwu2/s=;
        b=AQh0JqGRiagHIer0xDs8ckMD9AU5quwlT/qWvnknaaXynqfs5IDuAvsyFEIa+1Lq2J
         UsHcncpDSEeqAS0j/OD0XqZZ6+d2PvvgnjXmphLThdxf2g2oaBO7RSWrFPXfZ+dFdtmR
         bGRd3xc7oQwroWeBuaqFszvhVk9FquVqqYcfffXh0dwCfufXsC3/0g7rdSiolHELjy1/
         hWUZC27ixuODSsFQiKFfowYeELtib2ONq18hn8VAGdDP7mAkGkyJk5ubgActnV+lPo7E
         G6YipVvG/pO3rd803xeXFREIbXPhbL/m1xjR2TVMPc/rYItnn/BXtSroesgkKiK4casO
         VCDg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id f26si2978005lfp.5.2019.07.29.22.39.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 22:39:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6U5dvWe028111
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jul 2019 07:39:57 +0200
Received: from [167.87.38.173] ([167.87.38.173])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6U5duch029033;
	Tue, 30 Jul 2019 07:39:57 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <c1a63d36-2dd0-5b52-bb16-31794ab93b62@siemens.com>
 <fe00f482-c82c-4f93-8a0e-f73dc955888d@googlegroups.com>
 <b4e7dbee-58cd-3126-ce6b-7b54ee0ef241@siemens.com>
 <211205da-9e38-4178-895a-3ba80f214aa9@googlegroups.com>
 <6abaf77f-e4a7-7a9a-2ae9-8d1d8f1388bf@siemens.com>
 <1726f6bd-680a-46ac-a7f3-937cbba84208@googlegroups.com>
 <19e76b74-6d6e-010d-952a-5a36e606091b@web.de>
 <a5b27da1-b2aa-4ce0-863f-d9503a22b886@googlegroups.com>
 <885b4c3e-8d69-e516-aff4-46f2e50cb622@web.de>
 <edf7dab3-2c32-43bb-b13b-fce8bc452418@googlegroups.com>
 <4f76dc91-7542-40b8-a0d9-eea52e1dd92a@siemens.com>
 <e5c36ed1-98a5-4a76-aca0-6589cf9c3108@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ef7a124c-e5e3-f61b-8ed0-aebf585c65d6@siemens.com>
Date: Tue, 30 Jul 2019 07:39:56 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <e5c36ed1-98a5-4a76-aca0-6589cf9c3108@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 30.07.19 04:18, Jo=C3=A3o Reis wrote:
> Ok, that's it. But now, another error related to that memory region appea=
rs:
>=20
> FATAL: instruction abort at 0x4fffe1d0
> FATAL: forbidden access (exception class 0x20)
> Cell state before exception:
> =C2=A0pc: ffffff80080971d0=C2=A0 =C2=A0lr: ffffff8008768e14 spsr: 600001c=
5=C2=A0 =C2=A0 =C2=A0EL1
> =C2=A0sp: ffffff8008e73ea0=C2=A0 esr: 20 1 0000086
> =C2=A0x0: ffffffc04d2b7a00=C2=A0 =C2=A0x1: ffffffc04cff6000=C2=A0 =C2=A0x=
2: 0000000000000000
> =C2=A0x3: ffffff8008768de0=C2=A0 =C2=A0x4: 0000000000000015=C2=A0 =C2=A0x=
5: 00ffffffffffffff
> =C2=A0x6: 0000000029382596=C2=A0 =C2=A0x7: 0000000000000f94=C2=A0 =C2=A0x=
8: ffffffc04ff79404
> =C2=A0x9: 00000000000007df=C2=A0 x10: ffffffc04ff793e4=C2=A0 x11: 0000000=
000001dd8
> x12: 0000000000000000=C2=A0 x13: 00000000000094e5=C2=A0 x14: 071c71c71c71=
c71c
> x15: ffffff8008e78000=C2=A0 x16: ffffff800819b1e8=C2=A0 x17: 0000007fa7da=
3718
> x18: ffffffc04ff7a460=C2=A0 x19: ffffffc04cff6000=C2=A0 x20: ffffffc04cff=
6018
> x21: ffffffc04d2b7a00=C2=A0 x22: 0000000000000000=C2=A0 x23: ffffffc04cff=
6000
> x24: 00000009ed76160a=C2=A0 x25: ffffffc04cff6000=C2=A0 x26: ffffff8008e8=
2100
> x27: 0000000000000400=C2=A0 x28: 0000000000df0018=C2=A0 x29: ffffff8008e7=
3ea0
>=20
> The error happens in an address within the memory region i want to put th=
e Linux
> images (3fd00000-5fffffff : System RAM), and that i declared on the confi=
g file.

Which cell raises this error (you cut off that information)? If it is the r=
oot
cell, it may lack LOADABLE rights for the region. If it happens after loadi=
ng,
you forgot to reserve that memory via "mem=3D" or dtb reservations.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ef7a124c-e5e3-f61b-8ed0-aebf585c65d6%40siemens.com.
