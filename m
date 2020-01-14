Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBYVO67YAKGQEZOTIESQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9DE13ACD0
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 15:59:46 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id z3sf2772814lfq.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 06:59:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579013986; cv=pass;
        d=google.com; s=arc-20160816;
        b=oA9LQg7TG3AhGfUOQhykdaEuPHn+ZSqx1C4gxL2BOWxbtiMMCS2l6PUaHhjEIpzmjM
         aheV33OWnNAuhHJZjSD6f4MDKmMT6GeddkYv22eSUb4S6/d5aOSDZF/f+JVUAhSFURRJ
         e2tlyw7+mskPBLz9J7gB15NWhlaQawDM5y51Kas4dreS55KKNyXg+rlN9m0D6aaInhpY
         nTss1RkLA3ExB/T5tnWvLh0K+SsKceMqLUAqmvXhQzdXPeQnJJd9faBRL0F3t546rffZ
         tv3na5J9IX4txV3+kOg+fSZPplhWhjlLPZd2NDXHkIA55BTRw/Lo2vjZkBApdMTP6Pdz
         S3gA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=YAkVPTgWgQMU2ExedC9w8YrHttu2YrmSWC/PyVyO33A=;
        b=aOwVzUh/pXSeo6UUl0zExy5M0eKDPQPBRhd1ugxpGN+y+WmVfZ47af5WcoemXIYvg4
         YL0u1Ur0kFN4q0Hvdzf72GV6mE88QJ54T+eUuAlbSC+i6UhrpNqB7qA0w2DuHsHkIdJ3
         qUtR190SpxGtJrCquT2oRdkG0/P9hFhbt9FpVHk4duzLvdqTqcfyU7WVDNWhEekm8JWZ
         C2VQcZ8+zuB47F9dq3c6yzoy8BL6UNYo/IAyCLdX6oqTB3PiS91BlrDlzuXn3ebOBSZK
         pl7ZY2ftZyr+XVnLL4Sysx3KLq1/ZVmE+g30+840q0tt2b7ch6rN0PEYeXBkLrIzxenc
         +YmQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dkPJ0bRk;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YAkVPTgWgQMU2ExedC9w8YrHttu2YrmSWC/PyVyO33A=;
        b=nHdnQIE+5KTOOf51SpCrQ2mwlm8OP8eUnR+Bd6HnLDEFTvOHQShM4m5FCre+bJgTW5
         ItR6Hny2UsYY2mznbl9JwHe43mY2hsIWLgBHT0o7oulP5kYOQCVhq7mi0I2ZeL223xW5
         ZeEKit1c0BwEEqaHGNVOMN9QPNDoAo4O5SbewBDNshfRSljLuOHQzmuneuBkssQ/jgjc
         v+QoT1QJKl1jwV+Q4zEb8XBXkE87ZM/FKvvZ6XDrhF6K48/aw4iMZSuqyfaqNaiwbxKK
         UgnhU642mockJ/xcUMiLchyE1gyI5TEvXOXZ+rmfImj8PT3TIe1pZhaNk8cGjrMpfL21
         orOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YAkVPTgWgQMU2ExedC9w8YrHttu2YrmSWC/PyVyO33A=;
        b=GaTqhRh15yo7fCpGJ3/vTiFVal2h7scCUyl5sI2dwxyDwLUpLJmTr76++9Lzt+9TNQ
         wSmhCUUWLlJQbceXXqxr7i3TaeKrNgGDqvJviiduk9fVO8vnElThbNgCApJZ/COKV5jV
         F2+TQxcw7w9NyRN6PuqFHIYbOud4UC6Uiu9qVIqG/swTg/FmW/3M1UguysuPEXuKN+pD
         wO+lJ8C2CTgJI/j0FlZ4ENFF2IjHUSc6BJfyjgniQ4yhou07VRsO/MofxldB5Ddx6Dmd
         r3Eqyzy6VUulD1/UOZpxlCPRUdQZgXy9CltdHB07uyr6UN1ABx1RHmq6VEdRFP/W8fNC
         0Ayg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX/Elejtc1tk0Q5etvydIwcEBkyNokAOjmOVYWt7ntioLLY/wiN
	Osypdkn9OSws4dnzq1SVZFA=
X-Google-Smtp-Source: APXvYqzfJFLMqOSqM/M24YtE1RHXNZxaDhWYLpfdPWnVt5RYc9w5QPw3RV+w606SMpXLNS/FOv74Kg==
X-Received: by 2002:a2e:8145:: with SMTP id t5mr15305950ljg.144.1579013986144;
        Tue, 14 Jan 2020 06:59:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4acf:: with SMTP id m15ls1478275lfp.13.gmail; Tue, 14
 Jan 2020 06:59:45 -0800 (PST)
X-Received: by 2002:a19:710a:: with SMTP id m10mr1947083lfc.58.1579013985551;
        Tue, 14 Jan 2020 06:59:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579013985; cv=none;
        d=google.com; s=arc-20160816;
        b=WpPhxZjUMUaLVhyT8dk4tfJYScn1j9zvbPaku1QoY46iQzIf++XC/SelZdir+rwt7M
         DmZExwMMO0badaq5Xsi68Lzbs4JtX2bVhKfSrqi6LAeUxoY3zmJo6ncs/lW8mdvbmKHK
         D8xHIyq6p9VWkPXR2djulBUXX7WDZeJCSnBVpediULpRBOw/CZ9OvG2vvP0iwqaFF4RM
         CkzTlYgoC6GndZ9Z6Z4r07A3F511xg7ZahqHh/uv01K5oVMqbUmNluH5ukEN/pg/mv4u
         31EdK/xhW5eUkG3ywxFZTMzOrehdZER0jTSLsvz7P6L8dFszS4+sP8B6aDlJ72R2w/mg
         uGXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=rhMN/Yke7PduXEw8Q8ME84tNvDReBTfZMJ7uY4L13tI=;
        b=YfNIBSeKpAyTz7J6m4/XYudhR6zP3p33f/NSvzo2XWNGm9HHTxGIRPBojVuNV7e+Ou
         AnoW80/8SyQVeAg/FQrRf6pR1yzvIJM4FodNd+Pim/nTYNXnvfk8FpIS18t3LIYmYZ6s
         oVcvFRMld2VusCU1UIAPqJUSPZrnE8T/JZK/d/n8/PGCjLo2Rm7HcMRGvfF9XgODhC4D
         c8ZqfQG88zS1+Nl8DbIDpo1M1d/o/6zAtObqckbOIat5MEX6/vzLpFvhVlPpvAg0Phkd
         Uyoj3slwh1bHWDRQQ01sQkhxs+85PNf+MhjJWDUabWCpBwMhVEea2PyQszXSlz6vxJx5
         7/cg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dkPJ0bRk;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id o24si691530lji.4.2020.01.14.06.59.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jan 2020 06:59:45 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 47xtsX4WtNzxyr;
	Tue, 14 Jan 2020 15:59:44 +0100 (CET)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 14 Jan
 2020 15:59:44 +0100
Subject: Re: [PATCH 23/38] configs: Factor out ivshmem memory region macro for
 network devices
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
 <945028d7d210064c97963f15dd3e0a171ce46fd4.1578313099.git.jan.kiszka@siemens.com>
 <02d5b3ac-54d6-48bc-5eed-eb0a91186647@oth-regensburg.de>
 <7569e790-1298-6e1a-8465-57b7844b5d05@siemens.com>
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
Message-ID: <4b31b9fe-4921-b4e9-b74d-bcea51397c3f@oth-regensburg.de>
Date: Tue, 14 Jan 2020 15:59:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <7569e790-1298-6e1a-8465-57b7844b5d05@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dkPJ0bRk;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 1/14/20 3:37 PM, Jan Kiszka wrote:
> On 14.01.20 15:26, Ralf Ramsauer wrote:
>> [...]
>>
>> On 1/6/20 1:18 PM, Jan Kiszka wrote:
>>> diff --git a/include/jailhouse/cell-config.h
>>> b/include/jailhouse/cell-config.h
>>> index a62fa1ee..f82bbe8d 100644
>>> --- a/include/jailhouse/cell-config.h
>>> +++ b/include/jailhouse/cell-config.h
>>> @@ -129,6 +129,15 @@ struct jailhouse_memory {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 flags;
>>> =C2=A0 } __attribute__((packed));
>>> =C2=A0 +#define JAILHOUSE_SHMEM_NET_REGIONS(start, dev_id)=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0 {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phys_start =3D start,=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D start,=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x100000,=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_MEM_RE=
AD | JAILHOUSE_MEM_WRITE |=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAI=
LHOUSE_MEM_ROOTSHARED,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>
>> In the end of the series, this makes calculation of .num_memory_region
>> unintuitive: the macro will eventually roll out to four memory regions.
>> Would it make sense to introduce a macro that denotes the number of
>> regions that are created by JAILHOUSE_SHMEM_NET_REGIONS?
>=20
> What exactly do you propose? JAILHOUSE_SHMEM_NET_FOUR_REGIONS?

#define THREE 3

... No. This macro will change as soon as we have support for more than
two peers. If I understood the code correctly, then the number of
regions depends on the number of peers.

e.g.:

#define JAILHOUSE_SHMEM_NO_REGIONS(peers)	(2 + peers)

[...]

.num_memory_regions =3D [123 + JAILHOUSE_SHMEM_NO_REGIONS(2) + ...]

  Ralf

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4b31b9fe-4921-b4e9-b74d-bcea51397c3f%40oth-regensburg.de.
