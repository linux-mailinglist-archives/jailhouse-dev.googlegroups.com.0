Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAG767YAKGQECVOSYMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D8613AFAC
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 17:42:41 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id z17sf3129331ljz.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 08:42:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579020161; cv=pass;
        d=google.com; s=arc-20160816;
        b=QyJJD15ertzKJt+3HOrzoYKfU1CZjvv3COV01KGX8rwmbuLbSen++NL3bFqQ3UXJPo
         Ct8wg0ZHslqohsR741EOev1vaPQiPAJ8yuBOHW9UZoqpLeCLMwt4XuyNLD2n46kXiYbP
         Dih6zD6ZWJnVENob5weXQSF4sf4sSs2NeA3lBub/6Ujrh8s5D5EZ2i//NWp/KZl+3++U
         vnNhVydAr75G5PgCa0hrLLeKZxiqZtXUNFoERtsQzu1ROUOPBquLgsv8TILtC9lU6cCT
         TiPvQdJLz3C9+dTgAj3m7kIE8FeHbbM2Gg9ALofwfKtfqqaIyRTGw710tv2u71xReHNh
         ELGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=eiSmJKb0gpQF3+gc4cQhqswJt812mh0dq5qRceOapdg=;
        b=Q8Vi+W3Rdnv5dUjh3s86O6fG5eC+xcC3cusYkxvaT637r+ZTCa90usPSwL6IPEriJf
         NReP4NTXaYfyK4hQ1JdM69165EsNHWlqnwEuhFqTE180w3ORU7FSSwmOE13olGRrKxi6
         sLulhNSVQ4QLk5K2eLBW4KTYsYXYVHX+sf8545ylpsBi3JuupsOlKcgFx1Jmh0+sDrYL
         BDk8DdygXYcb2syc1galuicafZQnL0NUFQB4lWZW6DrmjzS8u3hpo4/f8RNB0B6zfNSZ
         SPQjeruQ2qYfOFwcsLWfrrpYwGjcWvUB6sdzacPmDxnTv2bvYQZJEoPki5NSFs5lpH62
         4vLg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eiSmJKb0gpQF3+gc4cQhqswJt812mh0dq5qRceOapdg=;
        b=GwJAHUPeO4TbXLmCwMrMgCe3cqqmnRGsDsLNyPDOnUDBtKX2HC6QNvFjDxk2Pr+3qh
         7umP4PKAfUz/lYX22W16rmt/ZetQY7v1wHSegP0gJwjd1JNcWibOzyoNLrybuSi5CoDI
         xkC4ERMx6e7h/Y2V6YC6b9sppCYJ10pbZpXklQzxgTfrFDjMXiBbX9BAN4W/WOEbRkNG
         NjyeQWoA5B+18OZY2r9OLmpSGoe08hX0nNSIp/ftLmoE3Ci6YFdcAMKBB/8nxlB3VClp
         13cCCfGv7GMzC0ZyW4BU8o3LtrtFaicGHUF8ktqe9ON79gFmxdqznPmVF/84jjN+Bu1K
         rMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eiSmJKb0gpQF3+gc4cQhqswJt812mh0dq5qRceOapdg=;
        b=l/ZI9Aa6w0LdpZsZnASXOKTHwVdsXtno7w5laE8LI2V+oaOI+aPqKTIkcnpgWYxvOl
         yQedjm7EyBwh2SMauT7ffxr+a1bpO0Lobu7YwSQghKIQPnD5uIyBBqDiZS/zsTeXVqT2
         vayOJMU2eSjjjewLQqujFIpe/CELZZiF9mXMiJfoBfo+Le0c1UNDyaaIXnr4v73jhI6X
         AtZ0sfWQYKiKkO17Pk2zp4Ttliz3XrpyPfB92XbTXjLfsH9dGj4ISy6+isV1Avdy+eah
         AxwkmWsOK+AukY5aBCv/lNVw0x8sxzO3GyJyZvXUuG2sHg6O1RdTLyq5k+5Ff/hmuKR9
         PVyg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUIY2z76Zbfk52Es2K9CGCClYTi1sgaJKpyo0nLUzkre+21jE7n
	FaTEePNEIuFTcdyeM3QLUgY=
X-Google-Smtp-Source: APXvYqxyOurDMW2CDnCS0bUvZRPtoqzSFp3hZgniKfxirl2m5LZC1Iz/NJp/Hqhc2aVtTpyQ52cz0g==
X-Received: by 2002:a2e:9708:: with SMTP id r8mr15159976lji.92.1579020160962;
        Tue, 14 Jan 2020 08:42:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:554a:: with SMTP id l10ls1531607lfk.14.gmail; Tue, 14
 Jan 2020 08:42:40 -0800 (PST)
X-Received: by 2002:a05:6512:488:: with SMTP id v8mr2477732lfq.173.1579020160295;
        Tue, 14 Jan 2020 08:42:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579020160; cv=none;
        d=google.com; s=arc-20160816;
        b=m5l76z2Xb+rWexa2fvMD/R0gOAamGekE/P0dzzwyalhSFgNRIqZGkcTHvV85r3fYie
         M3jYyBMwUVnqQx5ArkLq6Lx5U9dMj+SewxqpkTVQIvnJLDi9DoR1CNDNRKayZs1eZiIR
         8THaIRYvZFWzgZtU4dlyq4w71hcrNxD0/Z3b3k+YeD/2r/06kX/3wQ91ZdH435uY/dlX
         0fSvaP/u7ZD8ovts4IXviLm19WNjJFdzsXyQlM9aoBEFnE8y0CHCIPpyPRsAeRvFwXy8
         d0nSXPMRb8qmMy1+sEhr9H1WGsfZ9v+yxJvyEOsNcPuYHrn/zPV/FHrCq87fEEJOW7rQ
         CWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=EZAoKEw4lvd64Bak+YR3Cn0XAwf4GV3ngjnO2izDvZ4=;
        b=SumDnTHeEGDF+/L2/AAGuGd1Fa4NFjUjT07R2zcTtY7z79zjCG7xI8TvQ+f4yT0ar4
         FSoUOluW+WvqutXyqEt6X91a+9uGOs/f3RR8Y/yaRrbTJ89Z19IHlCopTytf9J0TXct9
         u1XFiLy+Xx+heHWCoMABdwq9QW1Fzz+N3COej0O8uLKnhedIffQJ3jIhzFqrp2D/g1kG
         xeqf0Qg3DcQ5zko4eTABS6erAQoeSTWvLn2rrVwR0v8k7f2bVawEZ99EW+r4sYOowXdB
         jrN5O4HO9FVMxmCpbDChoTvbCwgCb9a+D9bSL+HuCdfaKI2pn5fjKYLRrB0tIy7NVCCl
         SWHw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id o24si710797lji.4.2020.01.14.08.42.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jan 2020 08:42:40 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 00EGgdFJ026363
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2020 17:42:39 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00EGgdmT011494;
	Tue, 14 Jan 2020 17:42:39 +0100
Subject: Re: [PATCH 23/38] configs: Factor out ivshmem memory region macro for
 network devices
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <cover.1578313099.git.jan.kiszka@siemens.com>
 <945028d7d210064c97963f15dd3e0a171ce46fd4.1578313099.git.jan.kiszka@siemens.com>
 <02d5b3ac-54d6-48bc-5eed-eb0a91186647@oth-regensburg.de>
 <7569e790-1298-6e1a-8465-57b7844b5d05@siemens.com>
 <4b31b9fe-4921-b4e9-b74d-bcea51397c3f@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0d310b2b-d421-2fe1-f650-64b801244fa2@siemens.com>
Date: Tue, 14 Jan 2020 17:42:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <4b31b9fe-4921-b4e9-b74d-bcea51397c3f@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 14.01.20 15:59, Ralf Ramsauer wrote:
>=20
>=20
> On 1/14/20 3:37 PM, Jan Kiszka wrote:
>> On 14.01.20 15:26, Ralf Ramsauer wrote:
>>> [...]
>>>
>>> On 1/6/20 1:18 PM, Jan Kiszka wrote:
>>>> diff --git a/include/jailhouse/cell-config.h
>>>> b/include/jailhouse/cell-config.h
>>>> index a62fa1ee..f82bbe8d 100644
>>>> --- a/include/jailhouse/cell-config.h
>>>> +++ b/include/jailhouse/cell-config.h
>>>> @@ -129,6 +129,15 @@ struct jailhouse_memory {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 flags;
>>>>  =C2=A0 } __attribute__((packed));
>>>>  =C2=A0 +#define JAILHOUSE_SHMEM_NET_REGIONS(start, dev_id)=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> +=C2=A0=C2=A0=C2=A0 {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phys_start =3D start,=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D start,=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x100000,=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_MEM_R=
EAD | JAILHOUSE_MEM_WRITE |=C2=A0=C2=A0=C2=A0 \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JA=
ILHOUSE_MEM_ROOTSHARED,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>
>>> In the end of the series, this makes calculation of .num_memory_region
>>> unintuitive: the macro will eventually roll out to four memory regions.
>>> Would it make sense to introduce a macro that denotes the number of
>>> regions that are created by JAILHOUSE_SHMEM_NET_REGIONS?
>>
>> What exactly do you propose? JAILHOUSE_SHMEM_NET_FOUR_REGIONS?
>=20
> #define THREE 3
>=20
> ... No. This macro will change as soon as we have support for more than
> two peers. If I understood the code correctly, then the number of
> regions depends on the number of peers.
>=20
> e.g.:
>=20
> #define JAILHOUSE_SHMEM_NO_REGIONS(peers)	(2 + peers)
>=20
> [...]
>=20
> .num_memory_regions =3D [123 + JAILHOUSE_SHMEM_NO_REGIONS(2) + ...]

Ah, ok. Feel free to propose that on top, at least the helper with one=20
or two users. The hard part of that is always editing the configs. I've=20
edited too many in the recent weeks...

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
jailhouse-dev/0d310b2b-d421-2fe1-f650-64b801244fa2%40siemens.com.
