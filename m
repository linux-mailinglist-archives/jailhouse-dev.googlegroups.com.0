Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBLPB2LWAKGQERUBOTEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC9BC8AA4
	for <lists+jailhouse-dev@lfdr.de>; Wed,  2 Oct 2019 16:14:06 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id c23sf10966244edb.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 02 Oct 2019 07:14:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570025646; cv=pass;
        d=google.com; s=arc-20160816;
        b=GurKdy3KV2QAO7SJp0V9tf5L+ArvRWJ/84lDLznPYdbCVEmA6hog9z8yMrCASbUUQM
         Wch6PyIRKsR1khKNjhje9blaGOGaRl+x06PuUYLSC0F32L4tVdQe0dSn/nd6kE5+pDu4
         EOPM+12h7Ep7zamZtFC8ocIm55cdtBPy+WN145hbgVH/IEocBXhXo9T61xw9nKqi1bkC
         js9Yvy7iiJ811FuCqJdH2EXnYFnzfjd9ofMpwgKYv/Vt09LVdS9l8MiGiyPOMFvILPSm
         FDU9ubJZZg5xF4c7dyEZEDwOSS5mXY/PD077qieZCzadptj4ITX5w2NPGDwb3O/wNyCn
         5I1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=6Vt76rToDw6pzPSE7LE0xcQ0W//q9s3Ot/FdpJyPL5Y=;
        b=yxwjcAbYUYKAryKrNviIhAMSmhQmSaEY+ReS1u0pQA6yC7wKjaAQDTQ1ZYnxT1wdEk
         7Zqi2DjwCaSz1DEdWaCPPX5zIA9GMCwwBHyOqg0bC79rvUUbvP674vDfozwC/APFOPSx
         alDestS72toE+AySYjUWQF6TU0yT9QHoO3i6fx4gfoS7gis7lvCNg2SoaJaq4uuuUC5l
         ZfK5PmeG2EyYUJ9pvOBYP2yB//agEKcUudRCxr0SISz7FQjlK+l27hG5Rt8E9bNpg4Y6
         YPOEEcJN8/Mc7HHAFlPvKYSxiMOKhiJ5oMXlRMUytVPhbqUzDGksGPG9B+pE8f1UHAGy
         S6Sw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ZQAqhZEC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6Vt76rToDw6pzPSE7LE0xcQ0W//q9s3Ot/FdpJyPL5Y=;
        b=ibS6+yX8KXPJtSI2OrzwxIZlTFX7smdRDiPL2q1wnTScPNekK1PwPXjXtsyLcRelK6
         lt1xvqHUglMtM+Z7GmeZtd+5rPhdyxGvgasN+NwAHt4yI1cH5zkcmYmHja7yJ5WhTEEk
         GXOP3vv7OEWV2RycaoeKPLlhMl11QzNjN6dALanGgRPb639cVOKOXRPxdZUPnilBKeYq
         AZ2zVKI1kl8RAfzpDQ2RhFgkSrk/GyHvQAkwxFGX9UqEwjVDz8IfTIDrw0kQ6bYbi03V
         V7IAuhqQs7JNn2ftV+6j2mTvahxRoktHfp1HYfg/M6aRA3c7MZY2nxGJ3VgnQ6ZujdUD
         UjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6Vt76rToDw6pzPSE7LE0xcQ0W//q9s3Ot/FdpJyPL5Y=;
        b=GZtWHCNtI+kNCqRjQqaGDKeC2ydhNCx2VlfGgB1uETDS44FddiIK+AUuukgl5vctFX
         vWFN/tzRwBV1c6IODgTGgSkLTKWHJ4mOasasyTpMBuV/DHgdObebUl68koilxSDQfsKF
         Yh/n53muqlwqOZS6Nh2J/svFguOqRVqKNAZfZ+uDu5x7rUk3wwMS4imtT93gStG/aigo
         CFpmpfAKMEXzR0BIPqQiF9g6oO+/s61TKnD8D/qcYF+WNl22HK1lV3bv+nH2McQY6poM
         OGEbbMc304Wm+5SRHoX4FAGGQ9YHGLwxWoQiZHYvZlwZTUC/BXzNeOqe2mOKtrGgS2kA
         5rlQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXBPxlpUGDJJ7PS6AMwmqCrANaJ/hbJtN3X4dqDwZ0AzWDLlrnB
	hzva2Zpgv+KvMOF9rvM4Nsc=
X-Google-Smtp-Source: APXvYqyVZaPkr6w0PwHHU9DDetxGqdekrBop+pCcIfUE/1+I8tL65J0wad4mz+ak5K/dkvk+uoL4JA==
X-Received: by 2002:a17:906:454c:: with SMTP id s12mr3221434ejq.69.1570025645952;
        Wed, 02 Oct 2019 07:14:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4e85:: with SMTP id v5ls488334eju.4.gmail; Wed, 02
 Oct 2019 07:14:05 -0700 (PDT)
X-Received: by 2002:a17:906:4e8f:: with SMTP id v15mr3357532eju.57.1570025644972;
        Wed, 02 Oct 2019 07:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570025644; cv=none;
        d=google.com; s=arc-20160816;
        b=F9CTO3GgaS6skySKAkWFTPmNeColvUf3N4weSoZ9b+posyeDB2a/G688Nxoqa2ejCt
         DLIdLjN0cOLQuDF2LY12DDcBhwWGUQdMvvW/wAfo0O2GPZq/0RrPHIS2wEpFg7MP6C+d
         4+yWvRRLF91+FW8v/NnzqOPFBO3tQBxx87Q331S51cZ0UHkNeRB9q1QnX1pbsxRBx0TO
         Kjw7JMgJ7wMKDMGqnmA0MWzMYfy+7ZDaGqtXTYV6c8oeH9D25U/8f7ItNah4EtXj9vaw
         2zx+riUfibzvZu9qlQE5n7RuS5GORoUP9ZUmwiLs86vV0bzkDfRxCtdQUI9Q2uvfBJJd
         V55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=eslvw++QVGLgk7Dk/tIpmlcRpcDXvOj25ckjEW4dtbY=;
        b=ZtcmDUKsWcTURG0w8W3HGx+vcoGBZUaE+dNDPLoGw8aHRpp4vm68UBltOm2sZVPH65
         1xOQnFE1W63UqYeSHUYsnMKuCrc1WJSkxRgBuCMJ6v8xGHpfRte0L5zHrQdNLxORHsTs
         rhUI/Q+MCgXBfdUwnYtW2OvLFSt4KC0gFDusViVzuILU++ghewtJCjxZdLVvcyowPymK
         soHBiLi+XmLnI60QbNSFeuPBnKLYa+JA8EJ4r+QVx/hX3N/d1/MKpDa0yZfHl+R+23gR
         797/t61AZYTWb/VJZk+B3PJ9RaMltyrzOYo8IUhunciQpNDmDTABphe00npBDufNLa0Y
         wuzQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ZQAqhZEC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id c31si1187988edb.0.2019.10.02.07.14.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 07:14:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46jymr3VkPzyBY;
	Wed,  2 Oct 2019 16:14:04 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 2 Oct 2019
 16:14:04 +0200
Subject: Re: [PATCH v3 00/14] pyjailhouse: x86: Implement config generator for
 port I/O
To: Jan Kiszka <jan.kiszka@siemens.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <0713c187-2670-7914-1ad6-561bc4073920@siemens.com>
 <724ad1a6-00b9-b921-122c-25c26e75349c@st.oth-regensburg.de>
 <f31ce534-911d-ccba-c96d-529eb7a5c828@siemens.com>
 <922f18c5-418d-cfcd-1078-e632a9266464@oth-regensburg.de>
 <eb961a5f-0ed3-b821-b9b2-666a9fdcbfd8@siemens.com>
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
Message-ID: <48835bb9-5fe5-852b-e538-00c7b6fb6498@oth-regensburg.de>
Date: Wed, 2 Oct 2019 16:14:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <eb961a5f-0ed3-b821-b9b2-666a9fdcbfd8@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ZQAqhZEC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 10/1/19 5:34 PM, Jan Kiszka wrote:
> On 01.10.19 17:23, Ralf Ramsauer wrote:
>> Hi Jan,
>>
>> On 9/30/19 9:28 PM, Jan Kiszka wrote:
>>> On 30.09.19 21:25, Andrej Utz wrote:
>>>> Hi Jan,
>>>>
>>>> On 30.09.19 21:19, Jan Kiszka wrote:
>>>>> On 30.09.19 21:13, Andrej Utz wrote:
>>>>>> This patch series eases configuration of port I/O devices for x86
>>>>>> plattforms by generating an initial PIO region list. To sustain
>>>>>> previous
>>>>>> behavior, most entries are disabled (commented out). Only whiteliste=
d
>>>>>> device ports are allowed. This includes the peripheral PCI port
>>>>>> space.
>>>>>
>>>>> Did you also try what explodes when enforcing the generated list? I
>>>>> mean, if there is no mess like with hidden memory regions, things
>>>>> just Just Work (TM).
>>>>
>>>> Not yet. Analysis of additional whitelist candidates shall follow.
>>>
>>> We probably need a mixture: white-listing know-harmless thing that are
>>> requested in the legacy range, combined with permitting the PCI
>>> device-related regions.
>>
>> Ack. With a little luck we can rely on entries in /proc/ioports, at
>> least for PCI ports above 0xd00.
>>
>> I just compared lspci vs. ioports on some machines: Looks like ioports
>> contains everything that can be found in PCI config space. But ioports
>> contains even more.
>>
>> What are those pnp entries good for? E.g.:
>> =C2=A0=C2=A0 f800-f87f : pnp 00:01
>> =C2=A0=C2=A0 f880-f8ff : pnp 00:01
>> =C2=A0=C2=A0 [...]
>>
>> Are these reserved areas for PCI devices?
>=20
> pnp, ACPI, some further platform resources.

Will the root cell touch those ports? So far, it looks like it doesn't.

>=20
>>
>> And on my laptop, I can also find ACPI stuff above 0xd00:
>>
>> 0d00-ffff : PCI Bus 0000:00
>> =C2=A0=C2=A0 1640-164f : pnp 00:01
>> =C2=A0=C2=A0 1800-187f : pnp 00:01
>> =C2=A0=C2=A0=C2=A0=C2=A0 1800-1803 : ACPI PM1a_EVT_BLK
>> =C2=A0=C2=A0=C2=A0=C2=A0 1804-1805 : ACPI PM1a_CNT_BLK
>> =C2=A0=C2=A0=C2=A0=C2=A0 1808-180b : ACPI PM_TMR
>> =C2=A0=C2=A0=C2=A0=C2=A0 1820-182f : ACPI GPE0_BLK
>> =C2=A0=C2=A0=C2=A0=C2=A0 1850-1850 : ACPI PM2_CNT_BLK
>>
>> How should we deal with that?
>=20
> PM_TMR is passed through anyway, at least to non-root cells. The rest is
> more dangerous, potentially. But a "works by default" setting may have
> to include them.
>=20
>>
>> And what about VGA? We whitelist 0x3b0-0x3df on any machine. Shouldn't
>> VGA be listed in ioports if present? At least for qemu that's the case.
>> If we can rely on that, then we wouldn't even have to whitelist VGA. [1]
>=20
> Yes. VGA, if it shall be with the root cell (common case), should be
> listed.

Alright.

So here you can find a WIP version of this series that comes with
support for selective whitelisting PCI devices:

https://github.com/lfd/jailhouse/tree/ioports-ralf-v2

So far, I successfully tested this approach on Qemu and on a real
machine. No crashes so far. (which I didn't expect, to be honest ;-) )

Jan, could you please test this approach? Just run it on your local
machine, look at the output, and compare it with /proc/ioports. If this
is the way to go, I'll make a clean series out of it. The head commit is
probably the most interesting one.

Thanks
  Ralf

>=20
>>
>> Besides that, we could enrich PIO ranges with a comment that links them
>> to their corresponding BDF, just like we do for memory regions.
>=20
> Ack.
>=20
>>
>> In any case, platform specific stuff will remain static.
>>
>=20
> Yes, and we may see more failure there when we start to restrict the
> access.
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/48835bb9-5fe5-852b-e538-00c7b6fb6498%40oth-regensburg.de.
