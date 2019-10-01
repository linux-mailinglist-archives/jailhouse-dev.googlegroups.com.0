Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZXYZXWAKGQEEFYUR3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A749C3A4A
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Oct 2019 18:18:47 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id o9sf2822347lfd.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Oct 2019 09:18:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569946726; cv=pass;
        d=google.com; s=arc-20160816;
        b=p3S0jCiIYDmEE6c7cRnTIbp2Sd/GsywalnS3dDAIdZYExEP8SEawuEDhMvBbKLZgzW
         krS/OUTA35qljsBQUuySAxcA5ZkGzxMuOOSyzVgnpthltjXDdqa3RfXEReRmPJqYdJIl
         ACDSXikJrFbLiNo8J3Sym4RjTIfVmWpTuuiyopFJXr6zp4kcp2OwLp3hyA1lspnU7UDq
         OawEWGhjelvmtWoUPgMTap08sixtB3aEIJc2a4z6iltcL9yhYiM7DHWKN1Zz5yXtM3aW
         M1jtrMitkAsI8eAYnZrxJK1DSoucelaRixywKEZMk5VDb5YAqsAHsdVfHu8UtvsXlg2A
         Uciw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=9TpXAAQ4rXNCPD43csps2Hix2EqkgZxJ8rntSxrk2JU=;
        b=EvBRZApZ+Z9MrUPsqn8oyh/3duIew7op1mWYAsQXtws04NZXCp2D+GHlHmq1ge0ly1
         WqySZyG/nP+F4jS2BWJeby3+ngLGP1X4tazGOSLTMU8mRIJKI8jFRC1ghnS7A8FS/VgT
         hhsZnewaNaZQo28Nm+dOYaOzprNoeJVx2axBX1WCUsYup737+Z2LkM9WlyErcVqN3nbu
         Y4tTJq4tprUKdhNbc7Jy2SBV4ndoj6Cr1Adm1jqJ7o/YIPgqmUKD1sWgsTHDlsVlDpYs
         GaPuX9xEJ7JQTb6/kj2QDCFLsjF3lteLA4ImOiEWhFTGiN56XIxxz4O3VwpkoQ/mSLRB
         SWkA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="nJ/Lh0MQ";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9TpXAAQ4rXNCPD43csps2Hix2EqkgZxJ8rntSxrk2JU=;
        b=aTj1NQITjsE8Zmc+0OMDC/xTlgKptLKfKuNZaGLaHCP68ma6FqXVXC5K8QXYFb+nbi
         yyH0Znxx2Yg+66RR2WnF2l3f76aZ7KYhdYQ/d+JwU3wAcLl/MtUa7jFBxtNrcKuAUF78
         EOpyfxULPyCA+JSc9M/YVHHfRxDlgVxpSLRaxLI4S32KonxH24S293RepuVyfP21OBN8
         rMUHMz74YAU7pigNHXvlIgaXizWhHmecZncn7x1xMLkL13pCk86Gf2zV7sQ3dekaouwf
         bE/bwBZLEWoZWZxoWizldv8vsmnEMtZ9ahBEtdouCkMWhXo7XpxaMs9VgKprl1yvLGT1
         I/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9TpXAAQ4rXNCPD43csps2Hix2EqkgZxJ8rntSxrk2JU=;
        b=CgbYpWggofVfV1F0zYa76HOKULhN+ef/7UPh8FnAXoUBRq936etOLot9VLgbKl/US0
         6kyGWQ7muDKZtIfz4YVdMjNvb2EaxvJ9lTNNV2EdkI0JL1ZKVQ3rxPOOkYFje9dM8+wG
         fzNWIZlgpZyj9D1vnGl9TAW86QLV1nFfN+nyRoWg840JaQ82z1ffyawsYxm91ALWJwVZ
         bm16k4TE1hQlmPiSnZq+VGkdse+iR4gfLMd1NshwohGPZPZkFgogRCR2c1/rG75XeSj6
         FaMITsDx5AwK2M9a8Gy3hugB07SXYFY+mODiBOl/sw2r00J+XLe8GsfDvcRYM8gXQ42T
         3JvA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXifF2bh1IOfIhbMkHrL8wHMcb6Ux6rq+iF4xG+Qa1Dn+femBoj
	t5YEGSUW8QbF1kVKvQjLBUQ=
X-Google-Smtp-Source: APXvYqyDb77n3PUEKnmuGxBv6SAHToFClpJxxMYOO5cSpGAqyrygMbIDJkBY3NWc1621jWAku0LScg==
X-Received: by 2002:a2e:8558:: with SMTP id u24mr16601105ljj.191.1569946726708;
        Tue, 01 Oct 2019 09:18:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8915:: with SMTP id d21ls2111272lji.0.gmail; Tue, 01 Oct
 2019 09:18:46 -0700 (PDT)
X-Received: by 2002:a2e:91d0:: with SMTP id u16mr16497151ljg.164.1569946726076;
        Tue, 01 Oct 2019 09:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569946726; cv=none;
        d=google.com; s=arc-20160816;
        b=hNXuR8o66VGwgAmD4UZ+G93Zqu/DkmnKinQxKC8s2/OCnYaCZffgPtr2pEZfTvun/6
         FLJ4HFLOlI9Q6da17IJkai62v9YIwWrunIoOs2DH09e/t7MnbjJ0PFKIsOow1FqjsMl7
         51TtMKq74r4j6XWtn/hNvKQaeHLGun0W7Z/FSd50eP/LpGJfEpCEf4nED6dH3LI4DgMG
         MiSScCWJy+YsrO1qwn19Ne1ZYKwc1nslIzTN3Ch8PxN/TlzeHsSoCqThx3Xeios2zrXI
         u8jyGDmnslFVt2hvQ03b2LStGZfqfBzMif6Wy6gBHJ9mwBAEmfmV5huUdXyLoxFFwgmV
         uf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=gXLj2Niivgo8jcADqh7ZSqzhZJhQDq3XMqjaD0bPabc=;
        b=hmpHTD8jdqm0rcyE92L/E/OdgIM55p0TfHiaIRdIriipFhksf9moxf98/BSk2pMxz6
         V9P3tACcmb78A2E1jViKGTMIh406YjD1nuloY5+geswfzMBKHsvalU8XV3LEhUBbM2c2
         9qFFlgJm6JrKXiqRgZz4R3of0DswSP0RLkCZG5qf2Zd9xfmC1VRxLo8zwyVcnmUDYRwW
         oXCHSsGkIt1aOPdKAIZln+BJHDAh2mdZ1WhHuXrIZ+9PqwrFQKVQG6Y7Vm7X3CkbhG4Z
         9s4vd7W8eKLLzFThXybXKVqu63r3lm9ydwfeUGUhZy5WJFYM8lkaWvacf4o1OjzuweXv
         xHog==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="nJ/Lh0MQ";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id q25si783666ljg.5.2019.10.01.09.18.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 09:18:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46jPb90R0Gzy7Q;
	Tue,  1 Oct 2019 18:18:45 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 1 Oct 2019
 18:18:44 +0200
Subject: Re: [PATCH] configs: Fix qemu-x86 /wrt VGA access window
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <180104b9-95a8-3c54-211b-65d18da70d49@siemens.com>
 <9b69ab87-55e4-99ef-7138-6e0d2a2d35f0@oth-regensburg.de>
 <2b2842a9-bda0-3fc5-e390-d05e1730b591@siemens.com>
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
Message-ID: <9077da45-416c-e814-6cac-2ad331806ae7@oth-regensburg.de>
Date: Tue, 1 Oct 2019 18:18:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <2b2842a9-bda0-3fc5-e390-d05e1730b591@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="nJ/Lh0MQ";
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



On 10/1/19 5:28 PM, Jan Kiszka wrote:
> On 01.10.19 17:09, Ralf Ramsauer wrote:
>>
>> On 9/19/19 4:11 PM, Jan Kiszka wrote:
>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> Copy&paste mistake, other target were correctly set to a size of 0x30.
>>>
>>> Fixes: 654594bc0be7 ("x86: pio: use a whitelist instead of a
>>> permission bitmap")
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> ---
>>> =C2=A0 configs/x86/qemu-x86.c | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
>>> index f9877a21..03768f12 100644
>>> --- a/configs/x86/qemu-x86.c
>>> +++ b/configs/x86/qemu-x86.c
>>> @@ -205,7 +205,7 @@ struct {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PIO_RANGE(0x70, =
0x2), /* rtc */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PIO_RANGE(0x1ce,=
 0x3), /* vbe */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PIO_RANGE(0x2f8,=
 0x8), /* serial2 */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PIO_RANGE(0x3b0, 0x8), /* V=
GA */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PIO_RANGE(0x3b0, 0x30), /* =
VGA */
>>
>> /proc/ioports of Qemu 4.1.0 reports that vga is from 0x3c0-0x3df. Is
>> that correct or do we really need 3b0-3df?
>>
>=20
> The "hardware" provides this:
>=20
> (qemu) info mtree
> ...
> address-space: I/O
> =C2=A0 0000000000000000-000000000000ffff (prio 0, i/o): io
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 00000000000003b4-00000000000003b5 (prio 0, i/o): vga
> =C2=A0=C2=A0=C2=A0 00000000000003ba-00000000000003ba (prio 0, i/o): vga
> =C2=A0=C2=A0=C2=A0 00000000000003c0-00000000000003cf (prio 0, i/o): vga
> =C2=A0=C2=A0=C2=A0 00000000000003d4-00000000000003d5 (prio 0, i/o): vga
> =C2=A0=C2=A0=C2=A0 00000000000003da-00000000000003da (prio 0, i/o): vga
>=20
> The 0x3bx range is for text console IIRC. So, yes, we can further refine
> but should not exclude that part.

The actual reason why I ask is the PIO parser. If we should either rely
on /proc/ioports, or statically permit the window 0x3b0-0x3df.

And if we rely on /proc/ioports, then 0x3c0-0x3df should actually be
enough. Just tested in qemu: no crashes so far (w/o X).

  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9077da45-416c-e814-6cac-2ad331806ae7%40oth-regensburg.de.
