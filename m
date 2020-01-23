Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBV4FU3YQKGQEWY27FWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id C51BD1466AE
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jan 2020 12:26:15 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id b202sf380774wmb.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jan 2020 03:26:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579778775; cv=pass;
        d=google.com; s=arc-20160816;
        b=X3jCLxgr7BYHLBzbi+C9nLGKXy55x9rhaWq7RthbOzQKYJry8Q3mtykd86KQOUBTVY
         XmygD3AyudPqujL/gt9IERa9c7fwv5IoOfXzVrqI/L3pkVPmpeh58CUP7M2x3YoisFAH
         LQC0CGpsmEM2TzMxPoSf1SQ09LJNya7Q7iTaE6btGuWG4oepnoEVt3K4rMMVgSIKiEZG
         9kIILZXDNU2H1Ih5KMYXGbkqAumVuBXSkz4YdlGE2Eq9QMxnO2GVgoOa3UULgG53OSG/
         wnohXwAVJIhLRv3mdvY+EAfvebGkxEVr2UqOqe2WXiEUflnMCXc4wL9owLeK3LRCXx1v
         E/XQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=BOwqmoIcd7icqGUzwIKcEQJDFhwCVU50DqCmqH3aMe8=;
        b=AhYyPCOduzSiW/Utmnih1pObLYfeh100DUJ3owe4FbtHcXxBX6B/jDBkXE9fHEXenG
         qGj0bxsVdAcDZ7TLzCGb1EjcF/MxcZazH338DHon8Dj0v7a28Xgiqdkpo8opDy6cIQgn
         s0nAKO+yJub6/F0htu6YXpj724iVFaUHMHbCoQjiyD+3n3DVRugGVmAvF8PGCB58ynsw
         cNTuam04BGwmGmO9HiAixYQ4K+H8JavhY3F+xbnuYHiMoLn1hbydS1eUJF5u1NpbYMst
         301gkU1vlIctmFEAx5aM2t4K6RwaEJ/hBVKHtdTrOnPlWnEPWiQgiFhdPSJnSzruvOON
         yNOA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=q5C+yzxH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BOwqmoIcd7icqGUzwIKcEQJDFhwCVU50DqCmqH3aMe8=;
        b=F34h/prL9O46vzOJfmTuX9Fitn1CRxx0ZtT+XY6LvwDnkciirjKbyxULU6Y3deFsbp
         TiTIVOmRnzzLP5SgCtytyrh8HpsI7FTWfQAmbtfiF3UDmTY750v1iY3xz5l3es8aH9/F
         cQzYsM/g38ETpryFNI2dJijnhCZvp5iR4rPzCfWZyxioUw18hWbV8kRAbk87ETLsxtcL
         SmulIoPPv0aN9Nw3Ri3j0QbNjaLXRwieYE8No1sK8akYgO4zz5bXOaxqXXWpbgTKk9ih
         xGWgOzMkUUD6kMVy0HNE8p6YHWVK6e9gDisj/VCR36tNxYjpMdpXDkq5itCSkoF1WtxE
         jc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BOwqmoIcd7icqGUzwIKcEQJDFhwCVU50DqCmqH3aMe8=;
        b=ETdkl9px+YGfpfoJ3cMj6PWftmKg/a39u71z8dQ0tALuVuXk2DorCJPA0O0YN2Xbla
         ULQ6uMFKeVGBLpPdAq2BgccS6uYPJGKu/aBWLjfwPfgs2jQoJWTuLuhB0SzSyQg4pBQt
         UJ39ftdFqF0as0FZIrBnUVnvPd5rW4wYNRsnM3zY0nPcUx+wBeoKyfB3GbQ9u43qAVSw
         lIivFj5wVS2enBXba4RD8OqIzSrnRW9UOxqQl9UQZgNHiNsuhDIMxo/fuVhMSW0qmFWq
         FOgc7fekaMpKsoe9pWK7EBv9CLNMLCJvEH7uL6v1HmCxu+kZT6Fhj5f2qJLo0EoEw7pW
         K7og==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXjajUIaLHxU1dxgnQKj+SUVCwEar+8HWVLXdXkREa5fCfgW2I4
	MV8+mWyEgc2u8Zz7G6ehvB8=
X-Google-Smtp-Source: APXvYqyvCuPhDdmYJSJ9WoqzKZjan5spuLuFEYzHFhColEokGnEDMAV7HrDxuzWwocYMlKC6wGEZ+Q==
X-Received: by 2002:adf:dfd2:: with SMTP id q18mr17871188wrn.152.1579778775421;
        Thu, 23 Jan 2020 03:26:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4fc2:: with SMTP id h2ls8278234wrw.2.gmail; Thu, 23 Jan
 2020 03:26:14 -0800 (PST)
X-Received: by 2002:adf:ebc3:: with SMTP id v3mr17495005wrn.280.1579778774686;
        Thu, 23 Jan 2020 03:26:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579778774; cv=none;
        d=google.com; s=arc-20160816;
        b=Nh5EKUoONV78GRnHHVTRJQPYA6X8f4FkGDP3lHOXByX+6j4UN31K+xypummQfX21Fa
         SEocaSHHFc+iDVsYpMWhwLgA0couxbr0QbmYfTPwVJcQzUz39IW7XbrlHjxq/4EZXm2z
         GDeUbuIvh1VP1lLSdvu3b4bJrD2V7++oF6KF1FFQsHELjNzW25WXP6ZTHE7dh0O6uBct
         7RErKUGl1MjzWjlHROEFqjpJfc8U1VyjiQs9ypPvbb/n/jMUkjUdTTnAkv0SVT3rDdcj
         VXZc1dN+athRvIr5HkF94Cud6qcNOVnItla1RqbMKkB8GXrmvK2A7G3pbAgOG+6Tgz3B
         laLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=QqohbH58cTuwTPpjXIalgfUrVnEDc0Xcw0y2cVjbdoo=;
        b=TzbbjlpiTDy8YdIg3d15mnFgA7hnJUknAtZgzaKU7ifwvu+uFuKONq6fBOH+ZAbR6J
         iramyYd9tCVMa/NB6wKDpIQ1n5q3T4590LG9EAzUO3vvpGfOMM+zX5NHfncLKRYnk2WO
         02HZbub0X63nBHRvcPdo5cH25IRNL3efDOBga9ObwJ6fDbT5rHqi7E/2neIbwDUEQ6u6
         XmyCs+rjVzKX1GNU+hERQ9BmCfsT02THLDO2iQn18p/JXIt2a8YuIl+EC+2NpzPmfoYA
         P4/vBmbWqzAwlpIE0sFGsxhLfTYd6jhfmCJ8Y0ZP6Skd9W2GI88Aiqo1hMJcb6TxeMIA
         kqwQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=q5C+yzxH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id x5si319418wmk.1.2020.01.23.03.26.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jan 2020 03:26:14 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 483Kj223DzzxxP;
	Thu, 23 Jan 2020 12:26:14 +0100 (CET)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 23 Jan
 2020 12:26:14 +0100
Subject: Re: Difference in execution duration between root cell and inmate for
 same code
To: Michael Hinton <michael.g.hinton@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
 <c4f524ea-1273-0bb4-bd8d-c4a0599e40e0@oth-regensburg.de>
 <2c22faaa-1d5a-4ace-a7ed-7d614773a37c@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <210c9279-ce8b-67ff-ae88-6becb7f06b55@oth-regensburg.de>
Date: Thu, 23 Jan 2020 12:26:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2c22faaa-1d5a-4ace-a7ed-7d614773a37c@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=q5C+yzxH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

On 23/01/2020 08:43, Michael Hinton wrote:
> On Monday, January 20, 2020 at 4:32:45 AM UTC-7, Ralf Ramsauer wrote:
>=20
>     Hi Michael,
>=20
>     More exits, more overall penalty. Depends on your test case. You can
>     use
>     jailhouse cell stats to account for exits.
>=20
>=20
> Great idea. I started recording deltas in vmexit totals to better
> understand what is going on. Thanks.
>=20
>     I experienced a similar performance drop a while ago. In my case, it
>     was
>     misconfigured CAT -- too little cache for the non-root cell hit the
>     performance.
>=20
>=20
> Is CAT Intel's Cache Allocation Technology? I was unaware that Jailhouse
> had support for this yet. My configs don't specify anything regarding
> the cache, so what happens by default? Do you have more information you
> can refer me to?

Yes, Jailhouse comes with CAT support, but not every Intel CPU supports
CAT.=C2=B4CAT is configured by the inmate config via .cache_regions, see
example inmates.

  Ralf

>=20
> I'm going to describe my setup in more detail in my next post.
>=20
> -Michael
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/2c22faaa-1d5a-4ace-a7ed-7=
d614773a37c%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/2c22faaa-1d5a-4ace-a7ed-=
7d614773a37c%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/210c9279-ce8b-67ff-ae88-6becb7f06b55%40oth-regensburg.de.
