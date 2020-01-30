Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB4VYZPYQKGQE4HQXDZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id C77E514DC1A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 14:38:59 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id r14sf911270ljc.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 05:38:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580391539; cv=pass;
        d=google.com; s=arc-20160816;
        b=rcnSb+YdW+OiIQE0w143RxV+Ko/GROFLhhU3qH3JTsZnSmkVukYI09JTp6Opuyk4zt
         KUoFnBB1yyb5BVVyItFT1WacAlyFtQo/JF8+lNHuKeojzK3E0UZrkqXnDsk3qqOkIzFf
         vY0rxaQRHLkdqIAi09nmsAfp2HEAoKlUnS/9sovmZVmpCwbLQAX4Gb9eiC843AV0J8RG
         bJsLy2zMYXKUklnHPQW0c+1K4uQ2HzJpvvFmU2FRi9d/lbA3CTow8zm1bJo7DRgLGyNE
         dEH1O0mgLlpqE+lf8KR1AG2i09Jt0R3kAtRnmmAzloVsRIzzwXnGhDSIOBgjj3OrP2lc
         GySA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=FlN67b/bJFHeetvaG2NpABYl0xT7SzsNZutF7Ll6LLw=;
        b=HdMs3wQAWPPp/oQu2RbZBMl0wEEoYAT2SvYhV8kv73TopFQoXbhbMpMP2VCogfcM1J
         /+eUqglKIlQTcxVAjPHB2rfZ6X3DTQZfxIYeMJiglD/gnvqoEmw4lqHBF3bJcnNvrJqD
         Of/2PxKyyCDf+VBEx8bg8KJKR3HQ2n4JSCVslPmutbT1cbFQG2QnqHEuTIZ0ka0DlOxO
         AxffE0ihp4OEjFAtiwaMb1kbdQqDcOhEV5DtSxImMv9VzMJbfiOFj65/ObOKGtcVWrGv
         0YkatiJP7o0f5GpIocPxcsZlgDRtfppqxpXKz0PvK2XikwsgisiENHpWT01eM7yCmcHW
         t0SA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Wb9Mzfnv;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FlN67b/bJFHeetvaG2NpABYl0xT7SzsNZutF7Ll6LLw=;
        b=siwaoJypq/ginMUPvqVYaLPhrpBL3dLcesO8wwYuNgGdyOfgzh+0rtouCak/FSBptR
         8Wq1jrt/V5xyNoHHkzYIu2qxGY6i+XiU2RC3g0fuv4d1t1ngKoy3PMce2gyn6MmoGssa
         5zurjL8vOtL+taBkdxApDfMgxVeMK54lItjvdS/cHA8TSTXkhyMW5lG+CIvJtshgyOHG
         K1TDuVxK8+reZpXp+stcpcQdkLFaeaiiDnazeMW7wk8o+rw+kS/qwPOA0yPOjmpDBbNA
         Su8A2A5waSp3wIK4fu1f2dQYPl9INMF39cu4A1uLqU0ohFarc5dcLw8ALqqOdIOd6vrV
         qYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FlN67b/bJFHeetvaG2NpABYl0xT7SzsNZutF7Ll6LLw=;
        b=CrSKYaBABbwlQXHGeHawNlerUjPx8fMWZ1o8hu8ltCyL4GCSU1varlNNyGZ84N1yFf
         RvPlEuUeoKxG1MIAp3+FCY0R+lCju+hdQvoZ1c/44DRPYaCovYYfrw+us7eDQ3GUHifB
         EAfO6d0mxtDydmyqFe5Wk9UzQ1/pyQ7xfTQzOT9lQMoAjIT6IjGmOCVERCZfVlvLtfEl
         SiSIxcalFnt8QOD6uE2zmgtbyFayslHrlF0PwTNRclLpKj+N23Df35GgmQU6QaHQizcl
         vhFR/0ebnPF3u99S+XgKpxsgyzKLfthe0stDU9bcugVqi731HC2WwsPLiR42AwKaXISM
         p+7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXvuQTrFDpJUwuW3mzNeZYeiLr0NC+TCRI1PQwVeWbJm6nrDqpd
	5aXsbKtnuOaMzMQO90Z7hHw=
X-Google-Smtp-Source: APXvYqyflxWtodIv6/bYLW3n9lhzhgIDlm6AiUfps/S8t+eVKAKaSvSdlxrcmzetqV8HrZUmeHScpw==
X-Received: by 2002:a2e:a490:: with SMTP id h16mr2884357lji.115.1580391539154;
        Thu, 30 Jan 2020 05:38:59 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b4e7:: with SMTP id s7ls899139ljm.10.gmail; Thu, 30 Jan
 2020 05:38:58 -0800 (PST)
X-Received: by 2002:a2e:9587:: with SMTP id w7mr2872021ljh.42.1580391538405;
        Thu, 30 Jan 2020 05:38:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580391538; cv=none;
        d=google.com; s=arc-20160816;
        b=xiHceBLVA4+JgsTLQUZ+dGgcuxIl7Q8Ptkguorz5fcpuqE9QKal3uhOaKJh9QDi52z
         ABjCB4CkJWy6bfaNlp1kV1q9JSSVDQ+x3Ne2REPB4Ao/VXFh5Vtn6EdhlChTyeb+ltDs
         RJ/5Iy3IaGf99MqTsT5q5xL/oo5F4AiUPMsv3/3j9D2ievWiasFy2QgDgwnA05wA3wRu
         eYP5zzB3R7fqDLv8N0sUeuYVWAQXK8ILV7z6Tm2SIl4a2RDVKQIMN2vGkLUs3vQ4LfDW
         7HIC5Mjv+dtzuOqok4whfPO0/6M4gXazb7/b5tEVmSp3NqgoblrZC2PG4luUJvym1mjx
         A6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=CNEw/eXNyry6mUOYuATBKpJXFQoZ+BLyjus2NFDd3g4=;
        b=d+fsmqh+9gG2BsOzFgBpEEU9ggeOgGlJlDZfTjDRlolqVLHScVNaCK5l2pAQX2BTxn
         BeBtQB3BhQeNa8E2fE4R9oSUwBqg8vz108mvf4tz1FuMhw5idM4ACH7ltAj3OSHkgIF1
         3flCTs9D3lSTYUmlhiroodLGP0YkFWz7gZ1o5ZiySAo1vaywQDb9byQfCVXxyPSxkV2R
         M+cBxyqcxFST2t2jG712uyXZvF6dgfHxazV5g9Kkvni+7AdTai2cAf65JyOF4PYW8qe7
         tsdFdudVcSvU3htfKeSA2nATJKyIwLQjSPRLrdZDLe7MoD1arFyRXSrFehEODq0YFQ6V
         rYEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Wb9Mzfnv;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id 68si203194lfi.3.2020.01.30.05.38.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2020 05:38:57 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 487hJw32CRzxws;
	Thu, 30 Jan 2020 14:38:56 +0100 (CET)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 30 Jan
 2020 14:38:56 +0100
Subject: Re: [RFC PATCH v1 0/4] Add support for partitioning registers
To: Nikhil Devshatwar <nikhil.nd@ti.com>, Jan Kiszka <jan.kiszka@web.de>, Ralf
 Ramsauer <ralf.ramsauer@oth-regensburg.de>, <jailhouse-dev@googlegroups.com>
References: <20200127135611.21302-1-nikhil.nd@ti.com>
 <e4e85734-bcc5-d833-3f31-53e90c186de3@web.de>
 <d52d8792-9d28-e76c-5f0d-b00e456ae03c@oth-regensburg.de>
 <c02f19d0-183e-a12c-5364-ccb391a2cab8@ti.com>
 <7222df54-40c7-6958-570e-9eb50365e905@web.de>
 <0edd40f6-b214-f2ed-93e5-d7866b552088@ti.com>
 <87f662c1-4be7-747f-5017-088c04f75ae0@web.de>
 <fb168c39-b767-6ae5-3fb0-08d5128a061c@ti.com>
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
Message-ID: <7be98c82-d415-8215-d35c-11241d3727cd@oth-regensburg.de>
Date: Thu, 30 Jan 2020 14:38:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <fb168c39-b767-6ae5-3fb0-08d5128a061c@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Wb9Mzfnv;
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

On 28/01/2020 09:09, 'Nikhil Devshatwar' via Jailhouse wrote:
>=20
>=20
> On 28/01/20 2:41 am, Jan Kiszka wrote:
>> On 27.01.20 20:41, Nikhil Devshatwar wrote:
>>>
>>>
>>> On 27/01/20 10:03 pm, Jan Kiszka wrote:
>>>> On 27.01.20 17:13, Nikhil Devshatwar wrote:
>>>>>
>>>>>
>>>>> On 27/01/20 9:30 pm, Ralf Ramsauer wrote:
>>>>>> On 27/01/2020 15:49, Jan Kiszka wrote:
>>>>>>> On 27.01.20 14:56, nikhil.nd via Jailhouse wrote:
>>>>>>>> From: Nikhil Devshatwar<nikhil.nd@ti.com>
>>>>>>>>
>>>>>>>> This series adds support for partitioning registers across
>>>>>>>> different
>>>>>>>> cells
>>>>>>>> in the Jailhouse. Jailhouse supports partitioning memory regions;
>>>>>>>> where it uses
>>>>>>>> MMU mapping for page aligned regions and subpage handler for non
>>>>>>>> aligned regions.
>>>>>>>>
>>>>>>>> However, most of the embedded platforms will have common set of
>>>>>>>> registers which
>>>>>>>> need to be partitioned at the granularity of single register. One
>>>>>>>> such
>>>>>>>> example is
>>>>>>>> the pinmux registers avaialble in many platforms including K3
>>>>>>>> J721e.
>>>>>>>>
>>>>>>>> This series implements a regmap unit which allows to describe the
>>>>>>>> ownerhip of the
>>>>>>>> registers using a simple bitmap. This scales well when you have to
>>>>>>>> partition
>>>>>>>> hundreds of control module or pinmux registers.
>>>>>>>>
>>>>>>>> Nikhil Devshatwar (4):
>>>>>>>> =C2=A0=C2=A0=C2=A0 configs: arm64: k3-j721e-linux: Add USB mem_reg=
ions
>>>>>>>> =C2=A0=C2=A0=C2=A0 core: Introduce regmaps in cell config for part=
itioning
>>>>>>>> registers
>>>>>>>> =C2=A0=C2=A0=C2=A0 core: Implement regmap unit for partitioning re=
gisters
>>>>>>>> =C2=A0=C2=A0=C2=A0 configs: k3-j721e: Add regmaps for PADCONFIG re=
gisters
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0 configs/arm64/k3-j721e-evm-linux-demo.c |=C2=A0 41 ++=
+-
>>>>>>>> =C2=A0=C2=A0 configs/arm64/k3-j721e-evm.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 ++
>>>>>>>> =C2=A0=C2=A0 hypervisor/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>>>>>>> =C2=A0=C2=A0 hypervisor/include/jailhouse/cell.h=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 2 +
>>>>>>>> =C2=A0=C2=A0 hypervisor/include/jailhouse/regmap.h=C2=A0=C2=A0 |=
=C2=A0 47 +++++
>>>>>>>> =C2=A0=C2=A0 hypervisor/regmap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 258
>>>>>>>> ++++++++++++++++++++++++
>>>>>>>> =C2=A0=C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 22 +-
>>>>>>>> =C2=A0=C2=A0 tools/jailhouse-cell-linux=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
>>>>>>>> =C2=A0=C2=A0 tools/jailhouse-hardware-check=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>>>>>>> =C2=A0=C2=A0 9 files changed, 387 insertions(+), 7 deletions(-)
>>>>>>>> =C2=A0=C2=A0 create mode 100644 hypervisor/include/jailhouse/regma=
p.h
>>>>>>>> =C2=A0=C2=A0 create mode 100644 hypervisor/regmap.c
>>>>>>>>
>>>>>>> Worthwhile to discuss, indeed. The key question for me is how
>>>>>>> well it
>>>>>>> could map on other SoCs. Ralf, do you think it could be that simple=
,
>>>>>>> based on your experiments? Or could we also face scenarios where we
>>>>>> The question is what you try to achieve:
>>>>>>
>>>>>> Jan, when you introduced subpaging, the goal was to allow to assign
>>>>>> devices to different domains, if multiple devices are located on the
>>>>>> same page. We can observe that pattern on many platforms, and
>>>>>> subpaging
>>>>>> provides a "generic" solution.
>>>>>>
>>>>>> So what do you try to achieve with subpaging on a byte-wise/bit-wise
>>>>>> granularity? Make a non-partitionable device partitionable? That wil=
l
>>>>>> only work for some rare cases.
>>>>> The main intention here was not to partition peripheral devices, but
>>>>> just the registers
>>>>> which are not really related to any device.
>>>>>
>>>>> Most SoCs will have something like this where pinmux registers,
>>>>> efuse registers, internal muxes, MAC addresses, and other config
>>>>> options
>>>>> are provided.
>>>>
>>>> Can you point out another SoC that we support which would benefit from
>>>> this description method?
>>>>
>>>
>>> e.g. We support jetson-tk1 which uses Nvidia tegra124. It can benefit
>>> from this.
>>> There are lots of pinctrl nodes in the mainline Linux kernel device
>>> tree[0] and [1]
>>>
>>> Currently, the pinmux configuration is described in root cell device
>>> tree [2] but not available in inmate device tree [3]
>>>
>>> [0] -
>>> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra1=
24.dtsi#L334
>>>
>>> [1] -
>>> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra1=
24-jetson-tk1.dts#L83
>>>
>>> [2] -
>>> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra1=
24-jetson-tk1.dts#L1035
>>>
>>> [3] -
>>> https://github.com/siemens/jailhouse/blob/master/configs/arm/dts/inmate=
-jetson-tk1.dts
>>>
>>>
>>> With this regmap framwork, it is possible to define the pinmux node suc=
h
>>> that
>>> inmate Linux kernel can configure the pinmux when running in
>>> Jailhouse cell.
>>>
>>>>>
>>>>> This series was intended to solve these kind of register partitioning=
.
>>>>
>>>> So, subpaging does not scale when we have a scattered access map,
>>>> right?
>>> Yes
>>>> But can we use this description method to replace subpaging? The latte=
r
>>>> registers an contiguous mmio dispatch region, your approach
>>>> additionally
>>>> checks within that region a bitmap. A subpage entry can handle up to
>>>> PAGE_SIZE-1, a regmap currently only 256 bytes.
>>> regmap implentation can be changed to support 4k pages as well.
>>> That way, a bitmap can be generated to pass to regmap. But there is
>>> additional overhead of checking the offset.
>>> But yes, regmap can replace subpage, however, this change should be
>>> transparant without having to change the jailhouse_memory descriptions.
>>>
>>>> I wonder if we can
>>>> combine both, maybe expand the memory region to optionally refer to a
>>>> bitmap for finer-grained access control.
>>> Yes, that is also a good option, This will increas the size of cell
>>> config though.
>>
>> I don't think so, at least not noteworthy.
>>
>> One benefit of combining both would be benefiting from the more precise
>> access size control features of the memory region. The regmap only
>> supports one register size, memory region all of them. Also, we may save
>> quite a bit of registration and dispatching code in the hypervisor.
>>
>> How about something like this:
>>
>> /* when set, access_bitmap_base is used for subpages */
>> #define JAILHOUSE_MEM_ACCESS_BITMAP=C2=A0=C2=A0=C2=A0 0x0200
>>
>> struct jailhouse_memory {
>> =C2=A0=C2=A0=C2=A0=C2=A0__u64 phys_start;
>> =C2=A0=C2=A0=C2=A0=C2=A0__u64 virt_start;

Does the offset inside the page need to be the same for phys and virt?

>> =C2=A0=C2=A0=C2=A0=C2=A0__u64 size;
>> =C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;
>> =C2=A0=C2=A0=C2=A0=C2=A0__u32 access_bitmap_base;

We don't need access_bitmap_base.

When we iterate over all memory regions, we know the pointer to the next
bitmap. Initially, the pointer points to the end of the config. That's
all information we need. Together with the size member of the current
region, we can simply online calculate the location of the next bitmap
and forward the pointer.

For the bitmap: Ideally, the first entry of the bitmap is non-zero,
otherwise phys_start would be off, right?

>> } __attribute__((packed));
>>
>> Then we would append access bitmaps to the config as needed, and each
>> access_bitmap_base would point into that data. The size of each bitmap
>> would be (jailhouse_memory.size + 7) / 8. A bit set in the bitmap means
>> access allowed. In theory, we would get away with just adding the bitmap
>> test to mmio_handle_subpage.

Ack. I like this idea.

Bitmap size could also be aligned with the bit width of the target
architecture. But that's just a minor detail...

> I like this as well.
> Right now I am calling paging_destroy to make sure that the MMIO handler
> gets triggered.
> This can be avoided if the mem_region itself can be definesd it as bitmap=
.
>=20
> Ralf, what are your thoughts?

We can easily extend this idea to allow for bit wise granularity:

#define JAILHOUSE_MEM_ACCESS_BYTEMAP    0x0200
#define JAILHOUSE_MEM_ACCESS_BITMAP     0x0400

struct jailhouse_memory {
	__u64 phys_start;
	__u64 virt_start;
	__u64 size;
	__u32 flags;
} __attribute__((packed));

The length of the bitmap is either (.size + 7) / 8 in case of
JAILHOUSE_MEM_ACCESS_BYTEMAP and .size in case of
JAILHOUSE_MEM_ACCESS_BITMAP.

  Ralf

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7be98c82-d415-8215-d35c-11241d3727cd%40oth-regensburg.de.
