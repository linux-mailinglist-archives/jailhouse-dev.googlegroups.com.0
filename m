Return-Path: <jailhouse-dev+bncBCB7D7MXMMIM3KEX54CRUBHRAGDYO@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43b.google.com (mail-pf1-x43b.google.com [IPv6:2607:f8b0:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F17610F588
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Dec 2019 04:19:43 +0100 (CET)
Received: by mail-pf1-x43b.google.com with SMTP id u13sf1276799pfl.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Dec 2019 19:19:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575343181; cv=pass;
        d=google.com; s=arc-20160816;
        b=dBNPo2IzgqTs5Zy4EjMHkuA0r/e03es6qOO64exoIB61XoZEmN620SWeH3fD+/h/bB
         pak/3CxvkgiTtRssfVmDy2ML2NbW1NBMw5LU+8nxqU3gJnJY07mdGgRwaBWQqXZEnyG+
         MY+enK6OQZwiA4ypmg1JYvfZubqLZF3WcsLipaepbmChcLAJGJ/WWnkXWFeJuh72MBPk
         MMKOG2F4dcMIwztsyJe/KP2TwOoJkXPB2Ky5DC+OZmA66Hwd9Ka8+zJGDOUDasmfJGmd
         T2LN7NemN9wLMaJqTC1fqxcRdyYe/EjXmG6Tzhu2F0xC+7BpRUCaFnhiH0utDWywiCwe
         SKWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=OcU+fgA2s8Mmcx+2O4bsCSW4CQDsjwjLTb2PWYw168Q=;
        b=teHIJiQqhk3/m/mnkDgIDY+AOo7ViPbEBOsbI7VolUp6OEJSDG4Rh7RTwRQ/e+OSsw
         R60pe+JKXh4t3DYxL9dYlGhPfCSpxv1eS+WvUaR3SUHUuKuBfIeCuEGzH5Lh1FJ8C/lO
         fY/o0XAbM2ywZ9h838qVLNLl+K0NMtM5CYf9D476Pa9pV0P4YTE7r9Ec7GPbyRlnsKgA
         1Jfqn3hnb6iPTYGLaX2QVU0C97vtWx2+fgjILC3L3He5wv42zOqiWF0L546UnlAFRh37
         jpnkVtyqPB2IVHKrCHhnSf2LyAB9oHq/FT8PqSx4K49qNbky9Mo0xLaVmO2gIMuHaafh
         8U+w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=c4PeKNjY;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OcU+fgA2s8Mmcx+2O4bsCSW4CQDsjwjLTb2PWYw168Q=;
        b=n8cBWbrLPkP6Te5sGgXEHEjc3EJJQKqZU/prN48NYVk6Xogxsw/qYGEoG5e5e3QwZw
         bciQFJ9XPzyenDSKHtVQ+vSAU488zajqkAXetDlPdcipApFoVXnQXPcSoAfXwMIBTrQN
         DFhWNQXs4GQPE4mFKiXDEh0Zct8d3HxLmnoZPcH0C7n5i+MbZW4y2ChQ+UkhZusIzzz3
         +ZU3kssgJseaiz9Ozy8P6T311iFNFheiKt3LpQV4m9QCmUBwhzmlRgFM8qvpJIF8Xf+W
         pizPSvZaEZJYnBAFVhVL+8DrUofztJ16wAGWTdjXEQPIUaGI/kCQPR0cPr2f+41Y/KbF
         Z/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OcU+fgA2s8Mmcx+2O4bsCSW4CQDsjwjLTb2PWYw168Q=;
        b=fomvn9J3p1gsW8ySsI5MEiWYMKcu66P5TXkFRMrg3rOokJgJ+IPc99wcyFkiohv5b1
         YbW4bMIvQn5zSfnGoryQEPV42e3YgE/+ZhK4whw++GkypIrhi7AZM3OwW7Fb1My2I4fT
         XR87L72HBLfCXXUcPR1BBmsFg5n1/GIn3sc4fPS5GrUtfVfO2zKQrUonkppcYiJml+30
         FiUV83UTMF4ByU+m1SEJawC07HelWEvtqyTTwG/EbI6FrCT40vEJnzKxXj6IhSdyIUvd
         k3wUTFoOKq7vcVsRiyYLSbwj7ZgxLgSOoATffo9Dx8dbI7qQek0n0MHwRn2TC/jtVwEj
         6Skg==
X-Gm-Message-State: APjAAAUFz/Q3CzO5zzMydcHZ47v+ryGbzfJENNyKO3sTXF0YwGg9cyCu
	1aYFt3KCwOfIK1hj7CBFISc=
X-Google-Smtp-Source: APXvYqzTY2jh1QGnH2eNjTOeDvVpwKQC4qB3e5E0YbMYFvwu9GMVQ9MYqoY8Y6zMADoq0zMUOprjaw==
X-Received: by 2002:a65:4387:: with SMTP id m7mr2862446pgp.449.1575343181357;
        Mon, 02 Dec 2019 19:19:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:a982:: with SMTP id bh2ls439121plb.9.gmail; Mon, 02
 Dec 2019 19:19:40 -0800 (PST)
X-Received: by 2002:a17:90b:46cf:: with SMTP id jx15mr3219712pjb.2.1575343180794;
        Mon, 02 Dec 2019 19:19:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575343180; cv=none;
        d=google.com; s=arc-20160816;
        b=II9ZesUdB4qH/y8+ebxCOYO67BL0QXmBDkk9xlpmhK6aU+3FdasbddevdFhSeLOORt
         5VeDkSR1e3EyzJq3msOlcUgpVvm2PoruwJ/SfI/68OgoIN0pGlmv7U1P/PhW5jz9RBT+
         UiTMl9H7K9VOtLmDwXf0eQKJuBPhCM7FuHQd8w9KFoM/ucw+WkBwgdXuJdZwrr+fu0ih
         SI+6ZfIIX/h/XTI8PWk32XUU7wXNWtw0uI+1dhto4iVyf0E+V4v0wJSJ2xWjWc3m/A1N
         weg/DPgjDV6SJBsjCmZ3OH+UjwAvo/CzMKBwvxLsmLoWxi8H53rH1fkcHYsmeneM2LQH
         gYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Axy7mm5JtLzIJZ9b2s6sYfimFtPKiAXQP8DnYeMGQ2M=;
        b=BaGZcby6sYvFWxmv96ytuqC4+nN/8OtUEpZSV49tybtwu6As4oWlleOvVZuwavUQCZ
         9gcpIWxYHbnc8ZBqlQF1GlKUKaRokrfbGGMhPFKrdoxKCVD8wyoVXwmsqNi6PDg+pd2U
         axevHFI0jNypV46ZT1ri/KBf8wWPG0AtTcuFJ/S80+qO/rGK5TmCHYpcy2gP0yis08IO
         TU3seNlCoVUpx813vbgBCodDE82UyadAImtfm58KwRgeFPIrcX3BQy2AEXkXQe/yS/ZL
         EF57Q2J5d96pTKwsbeGleHGYdKKwvAzSFhIAT7KPnO09M8yEVLygVb7sPH2yGNZnq0qx
         YjQw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=c4PeKNjY;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id j2si105208pfi.1.2019.12.02.19.19.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Dec 2019 19:19:40 -0800 (PST)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB33Jdwp049485;
	Mon, 2 Dec 2019 21:19:39 -0600
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB33JdTT104868;
	Mon, 2 Dec 2019 21:19:39 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 2 Dec
 2019 21:19:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 2 Dec 2019 21:19:38 -0600
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB33JZRW008660;
	Mon, 2 Dec 2019 21:19:35 -0600
Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
To: Jan Kiszka <jan.kiszka@siemens.com>, Peng Fan <peng.fan@nxp.com>,
        Marco
 Solieri <ms@xt3.it>, Jailhouse <jailhouse-dev@googlegroups.com>,
        "Devshatwar,
 Nikhil" <nikhil.nd@ti.com>
CC: "marko.bertogna@unimore.it" <marko.bertogna@unimore.it>,
        "tomasz.kloda@unimore.it" <tomasz.kloda@unimore.it>,
        "giulioc@xilinx.com"
	<giulioc@xilinx.com>,
        "'claudio@evidence.eu.com'" <claudio@evidence.eu.com>,
        "fabio.federici@utrc.utc.com" <fabio.federici@utrc.utc.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <AM0PR04MB4481B3186519C11BBFEE8DBA88430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <AM0PR04MB44818E5F2BA11C16A6B9E70088430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <14abb592-d8c4-6c89-1e98-d774e0dd21ad@siemens.com>
 <AM0PR04MB4481E19D836B1CA3925FC88388430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <dbfe8d28-c4e9-e7d4-1400-0868c61f89b2@siemens.com>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <f7558cfd-7886-8b97-73fe-303a4781b486@ti.com>
Date: Tue, 3 Dec 2019 08:48:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <dbfe8d28-c4e9-e7d4-1400-0868c61f89b2@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=c4PeKNjY;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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



On 02/12/19 1:03 PM, Jan Kiszka wrote:
> On 02.12.19 08:24, Peng Fan wrote:
>> Hi Jan,
>>
>>> -----Original Message-----
>>> From: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>
>>> On Behalf Of Jan Kiszka
>>> Sent: 2019=E5=B9=B412=E6=9C=882=E6=97=A5 14:27
>>> To: Peng Fan <peng.fan@nxp.com>; Marco Solieri <ms@xt3.it>; Jailhouse
>>> <jailhouse-dev@googlegroups.com>
>>> Cc: marko.bertogna@unimore.it; tomasz.kloda@unimore.it;
>>> giulioc@xilinx.com; 'claudio@evidence.eu.com' <claudio@evidence.eu.com>=
;
>>> fabio.federici@utrc.utc.com
>>> Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
>>>
>>> On 02.12.19 03:52, Peng Fan wrote:
>>>> + jailhouse mailist.
>>>>
>>>>> -----Original Message-----
>>>>> From: Peng Fan
>>>>> Sent: 2019=E5=B9=B412=E6=9C=882=E6=97=A5 10:51
>>>>> To: Marco Solieri <ms@xt3.it>
>>>>> Cc: marko.bertogna@unimore.it; tomasz.kloda@unimore.it;
>>>>> giulioc@xilinx.com; claudio@evidence.eu.com;
>>>>> fabio.federici@utrc.utc.com
>>>>> Subject: RE: [PATCH 0/8] Add cache coloring support for Arm
>>>>>
>>>>>> Subject: [PATCH 0/8] Add cache coloring support for Arm
>>>>>>
>>>>>
>>>>> I am reading the patchset, but this patchset could not resolve the
>>>>> cache contention between root cell Linux and inmate cell, right? It
>>>>> only address the cache contention inside the inmate cell, if I unders=
tand
>>> correctly.
>>>>>
>>>>> Is there any v2 plan to address the upper issue?
>>>>>
>>>>> To address root cell color issue, 1:1 mapping in root cell might not
>>>>> work, because IPA/PA needs a remap, but this will waste PA space, if
>>>>> inmate only need a small area PA space. Seems root/inmate cache
>>>>> contention is hard to avoid.
>>>
>>> Coloring the root cell is indeed a tricky issue as I remarked back then=
 as
>>> well. I
>>> suspect the best way will be trying the approach that TI has a prototyp=
e for:
>>> start Jailhouse via a loader (could be a UEFI
>>> executable) and boot the root cell Linux already colored after that -> =
no DMA
>>> in-flight problems.

This is still a prototype and not yet productized :)

>>
>> To SoCs that not have SMMU, coloring the root cell will incur DMA issue,=
 such as
>> CMA will not work. If root cell could not be colored, does it make sense=
 to color
>> inmate cell?
>=20
> CMA is generally a problem, not only for the root cell without SMMU...
>=20
> If you cannot color the root cell, you can only suspend it and move all w=
ork
> over to non-root cells. Granted, this will waste even more resources.
>=20
>>
>> Does TI has public code for their work? I not find that in list. I recal=
led
>> that TI mostly want to start inmate cell as soon as possible not for cac=
he
>> coloring.
>=20
> Lokesh, Nikhil?

You might not find what you are looking for, but here is the link:
https://git.ti.com/cgit/jailhouse/ti-jailhouse/log/?h=3Dti-jailhouse-0.10

Thanks and regards,
Lokesh

>=20
>>
>>>
>>> What you cannot solve is the memory usage. That is inherent to coloring=
.
>>> So, what we actually want is vendors like your employer finally impleme=
nting
>>> cache partitioning in hardware. ;)
>>
>> That needs to purchase ARM's new hardware IP, such as ARMv8.3.
>=20
> Yes...
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f7558cfd-7886-8b97-73fe-303a4781b486%40ti.com.
