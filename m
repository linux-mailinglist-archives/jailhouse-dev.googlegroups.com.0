Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBQPEXPYQKGQENQYNYUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB1C14A5EB
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 15:22:57 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id f17sf6161350wrt.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 06:22:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580134977; cv=pass;
        d=google.com; s=arc-20160816;
        b=QrdM6WcrWBkMdkLlDQuUFc+qvvXsLXO9mwF1A7+ZjVMjBs1I0uPvr8TtKEH64sVERj
         DUwe+kILxQ7iyT+NaypmrisvZcGaEm9+lwAz4DxDdNBWDqdQ0MdRuK1NKwq6JnmicC8Y
         qgE0fMwfdaJcl94AUntKmItZ43M3E8LnG3pWnq0uIr6YhLd+hpnIFtGGJ4OWD2rvsjoE
         GedBlOCE+31D6E+baSu+5l9I92rwSq1eq5+gRQD9FUP/wMcfD72BFFxYxlolMcy4KV9E
         OVt+L6obm/+H/NEb5W+EPsBXj4/WKDTqHCto6wkciF8JOgWX0n5OkwF9n12Ty6EfEtZL
         fI+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=JVrf51iuS4lZ05T4sUbUEQXmIQqOOCObe6MUB6nn+Z0=;
        b=byd09OeY0V07gzZsTqzP0zllfXSYcsY2rxVtf7HQeZwcbTo1EnnmVmBevRp8MJWsuO
         ysiGPyZj5PfwOvD9v1+QC8o/tA66Bk67yoSt6BdXPUHkaeNwR07V+V7QF3lC3rhQXJqp
         7ynNoS1AuimT571d5IW7O5xwmoO6QzkHMtFmJ6f6r+CFxmiyuG9LMRLYCJv+kBHT8mPT
         mOve9GcmlwYSvA3v77i2pQhxlsDrRBAQ/uoFWHBmZProRo0yxCk3Ri/7v3q9tYKzrfIO
         +P7WQTrIZ9pxYOv2S6IiEcFhgC1GypC4NdIYmg4ukJaoOR+T0d2rKWPC9oBkCcVH3MGT
         dNdA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=oQudBvZN;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JVrf51iuS4lZ05T4sUbUEQXmIQqOOCObe6MUB6nn+Z0=;
        b=NyNJy4VxpdsQYtbFfG2olICc9puH/Opecr5e8uY2RH2TOWBhlg5b5UaSfolIk4KUjo
         BUZclLtUBVCXY7swil3r8zlH07b8CZ1oWvuJVna7UdQjNDE4D5v3UPcR2e10VzEGRGu2
         t7RWslo9q3KxxrX+1RATs/FpoY6tjoA6Na/JXY6SfK0g6kCAiox+I5mGp/MrtCrjHvvq
         LfjtmWopoN485P33M4DqQVXDWQqO6jrQkPALtnE/0p0wI2oTiBeH07nPZeUZQmTGNCxl
         /ZUKMpVL6qHdUYMYgxqm2zmJgcXkqFMxPdBOu0J+DmrkulJgj/1MyeDkecT5rMomt4vq
         sgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JVrf51iuS4lZ05T4sUbUEQXmIQqOOCObe6MUB6nn+Z0=;
        b=ay79TYcWsKhHwPBV/pfEWj08+kUejiLZNk6vAxiE17A9gxnvyruKUMtn2iQjIxRc+l
         usVt81bkq6Ow1fWrt56nbfhp+Ai3U2iHeADYZwokQLYAfGdbmrJdsLh16K51ams8kwgR
         hVdNAARmorLkGVRXj5unYX/tKEilB6OeQfAJjt8bXELCmA7p0PySJdri+NFIi73E380l
         L5J/k3f4OUqUjzocr+aPkon3+1lezsKAnyEgXZ40w4gZJkNEShVhCZzwlesQ0e+uaisn
         56kPK8fuVrdaKgktX8uEZ3C7uX02kxMEnZe//iYlzabqNennyQszqnKN/+Ibky7eDln+
         dbQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWB0oTTMkX2P8/dqVDuV2nTNiiJCLot1LqfR6B7/rzFa+x0cMIy
	hxmmMLna+qmvCGGfFjjfBcs=
X-Google-Smtp-Source: APXvYqytTZbOt6ENfOefczMg72liRn8OGX97HraWYRXzV7NLV+E22uWU9mtCg33oqKid0mZzUObu4g==
X-Received: by 2002:a1c:a796:: with SMTP id q144mr14539631wme.6.1580134977719;
        Mon, 27 Jan 2020 06:22:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:6385:: with SMTP id x127ls4666774wmb.2.gmail; Mon, 27
 Jan 2020 06:22:56 -0800 (PST)
X-Received: by 2002:a1c:ddd6:: with SMTP id u205mr14134265wmg.151.1580134976801;
        Mon, 27 Jan 2020 06:22:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580134976; cv=none;
        d=google.com; s=arc-20160816;
        b=zZ9EFBXYoPHEMKICzOt8Cm5cfC+WEDsTG8TfsA1Wm+Gd55C1VGeTmRjzcmnkTulvZI
         2bsPKy/6isFEzXfLp50OR7suFUKH4ikqjW0gVZctmEBRVTjvzKJsPVlaPloqJppXGAja
         36ih8occPUkv1GfAJx7P/1a3WKNxdZ4hlg63QYdPSqGTlwoRkfawLTwcvjypsCxrWmri
         QCyXZ+H7uUKazLeVERihPtz58948v57D2IUhO8pnd3SBj1nHOS3w+XllK6Oj9D84vk8W
         S0FRNsRDdGewUafxtxhRH33F9Y4nfdjYUltuE5++NF2lCI5q8pL1yUb5l2CWqNIVpHyj
         l3Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:cc:to:subject:dkim-signature;
        bh=qYupXFEQSAQ8sM+8hgYB3ZNQHHQa/zUNvtr1hJ9Y4xw=;
        b=YlQDgVZsVvXKIUsBpYwZS/zZR1bR3ZtqYbhTIJlPYfruqRK419Bhq0v8lDELtpm2VA
         iwmWGf5t7js9EfHbhpFpe13mMV5HCkYosLN7cVPndBpZSHE9H+yn+Wpnh7zto1/dvZ/M
         5OftbVxn5azzuWw3/CvkJ6ywz/auqUlPD/+FlJklNXT549huex3SGuVAdkzLEioC62PI
         xR9BUqFJ2YuRWkshjCjlVDak0HgxuA40uPZDIilvvHmo9y1YN4BUdSUqrhaPqU3/qs0j
         oLgTa6aezVQFDWkQ51PXjTbUv7GaiuhVPlgEFpIpPxpzE5LtiLLezSXVzqpFnTPvMJyk
         CdkA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=oQudBvZN;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id m2si919292wmi.3.2020.01.27.06.22.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 06:22:56 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 485sR42bM9zxxP;
	Mon, 27 Jan 2020 15:22:56 +0100 (CET)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 27 Jan
 2020 15:22:56 +0100
Subject: Re: [PATCH 2/3] arm/arm64: Pad comm region to natural alignment
To: Jan Kiszka <jan.kiszka@web.de>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>
CC: <jailhouse-dev@googlegroups.com>
References: <cover.1580107046.git.jan.kiszka@web.de>
 <beb95b54284b1defd0f1952d43f8143cf303d38f.1580107046.git.jan.kiszka@web.de>
 <ef68e345-9b82-e82a-65e1-da1cb9faf2c0@oth-regensburg.de>
 <185db5e4-618f-db9c-cd1b-d199b6af0c61@web.de>
 <7c7b7f79-3d23-3e78-bda5-60d88d040bc4@web.de>
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
Message-ID: <80ed86e4-9082-42ad-b38d-7f97d440076e@oth-regensburg.de>
Date: Mon, 27 Jan 2020 15:22:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7c7b7f79-3d23-3e78-bda5-60d88d040bc4@web.de>
Content-Type: multipart/mixed;
	boundary="------------0CD6EA4158ECC2558ED911DC"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=oQudBvZN;
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

--------------0CD6EA4158ECC2558ED911DC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



On 27/01/2020 14:39, Jan Kiszka wrote:
> On 27.01.20 13:15, Jan Kiszka wrote:
>> On 27.01.20 12:40, Ralf Ramsauer wrote:
>>>
>>>
>>> On 27/01/2020 07:37, Jan Kiszka wrote:
>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>
>>>> Better pad than rely on both sides using the same compiler logic.
>>>
>>> Ack. But shouldn't we then, in turn, use __attribute__((unpacked)) to
>>> avoid that the compiler accidentally does some other unintended
>>> alignment / reordering?
>>
>> Do you mean "packed"? It shouldn't be needed at this stage, but it
>> shouldn't harm as well.
>>
>>>
>>>>
>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>> ---
>>>> =C2=A0 include/arch/arm-common/asm/jailhouse_hypercall.h | 1 +
>>>> =C2=A0 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/include/arch/arm-common/asm/jailhouse_hypercall.h
>>>> b/include/arch/arm-common/asm/jailhouse_hypercall.h
>>>> index 83cec97b..aeab2816 100644
>>>> --- a/include/arch/arm-common/asm/jailhouse_hypercall.h
>>>> +++ b/include/arch/arm-common/asm/jailhouse_hypercall.h
>>>> @@ -38,6 +38,7 @@
>>>>
>>>> =C2=A0 #define COMM_REGION_COMMON_PLATFORM_INFO=C2=A0=C2=A0=C2=A0 \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8 gic_version;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> +=C2=A0=C2=A0=C2=A0 __u8 padding[7];=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 gicd_base;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 gicc_base;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 gicr_base;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>
>>> BTW: It's really hard to trace how the structures are being defined.
>>>
>>> Instead of creating the structure in arch-specific parts for each
>>> architecture, I think it would be nicer to introduce the structure for
>>> all architectures, and then include arch-specific parts.
>>
>> ...as anonymous sub-structs - possibly.
>=20
> Not that easy: The anonymous struct thing does not work, and the doxygen
> documentation would have to be refactored as well.

Ack, just realised that as well.

Have a look at the attachment. If you agree on this idea, I'll make a
proper patch out of it.

  Ralf

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/80ed86e4-9082-42ad-b38d-7f97d440076e%40oth-regensburg.de.

--------------0CD6EA4158ECC2558ED911DC
Content-Type: text/x-patch; charset="UTF-8";
	name="0001-RFC-core-simplify-definition-of-comm-region.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-RFC-core-simplify-definition-of-comm-region.patch"

From e0a5d08e6cd3044f52fc9a4401b761906cecd38e Mon Sep 17 00:00:00 2001
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Date: Mon, 27 Jan 2020 15:08:50 +0100
Subject: [PATCH] RFC: core: simplify definition of comm region

Keeping everything at one place (as we do it in for cell-config.h) makes
the definition of the ABI much more readable.
---
 .../arch/arm-common/asm/jailhouse_hypercall.h |  7 ---
 include/arch/arm/asm/jailhouse_hypercall.h    |  5 --
 include/arch/arm64/asm/jailhouse_hypercall.h  |  5 --
 include/arch/x86/asm/jailhouse_hypercall.h    | 15 -----
 include/jailhouse/hypercall.h                 | 62 ++++++++++++++-----
 5 files changed, 46 insertions(+), 48 deletions(-)

diff --git a/include/arch/arm-common/asm/jailhouse_hypercall.h b/include/arch/arm-common/asm/jailhouse_hypercall.h
index aeab2816..0da658dd 100644
--- a/include/arch/arm-common/asm/jailhouse_hypercall.h
+++ b/include/arch/arm-common/asm/jailhouse_hypercall.h
@@ -36,10 +36,3 @@
  * THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-#define COMM_REGION_COMMON_PLATFORM_INFO	\
-	__u8 gic_version;			\
-	__u8 padding[7];			\
-	__u64 gicd_base;			\
-	__u64 gicc_base;			\
-	__u64 gicr_base;			\
-	__u32 vpci_irq_base;
diff --git a/include/arch/arm/asm/jailhouse_hypercall.h b/include/arch/arm/asm/jailhouse_hypercall.h
index 275d4891..f943145d 100644
--- a/include/arch/arm/asm/jailhouse_hypercall.h
+++ b/include/arch/arm/asm/jailhouse_hypercall.h
@@ -57,11 +57,6 @@
 
 #ifndef __ASSEMBLY__
 
-struct jailhouse_comm_region {
-	COMM_REGION_GENERIC_HEADER;
-	COMM_REGION_COMMON_PLATFORM_INFO;
-} __attribute__((packed));
-
 static inline __u32 jailhouse_call(__u32 num)
 {
 	register __u32 num_result asm(JAILHOUSE_CALL_NUM_RESULT) = num;
diff --git a/include/arch/arm64/asm/jailhouse_hypercall.h b/include/arch/arm64/asm/jailhouse_hypercall.h
index 9daa21fe..c12b9262 100644
--- a/include/arch/arm64/asm/jailhouse_hypercall.h
+++ b/include/arch/arm64/asm/jailhouse_hypercall.h
@@ -55,11 +55,6 @@
 
 #ifndef __ASSEMBLY__
 
-struct jailhouse_comm_region {
-	COMM_REGION_GENERIC_HEADER;
-	COMM_REGION_COMMON_PLATFORM_INFO;
-} __attribute__((packed));
-
 static inline __u64 jailhouse_call(__u64 num)
 {
 	register __u64 num_result asm(JAILHOUSE_CALL_NUM_RESULT) = num;
diff --git a/include/arch/x86/asm/jailhouse_hypercall.h b/include/arch/x86/asm/jailhouse_hypercall.h
index 8dffb5c0..aaac5100 100644
--- a/include/arch/x86/asm/jailhouse_hypercall.h
+++ b/include/arch/x86/asm/jailhouse_hypercall.h
@@ -95,21 +95,6 @@ extern bool jailhouse_use_vmcall;
 #include <jailhouse/hypercall.h>
 #endif
 
-/** Communication region between hypervisor and a cell. */
-struct jailhouse_comm_region {
-	COMM_REGION_GENERIC_HEADER;
-
-	/** I/O port address of the PM timer (x86-specific). */
-	__u16 pm_timer_address;
-	/** Number of CPUs available to the cell (x86-specific). */
-	__u16 num_cpus;
-	/** Calibrated TSC frequency in kHz (x86-specific). */
-	__u32 tsc_khz;
-	/** Calibrated APIC timer frequency in kHz or 0 if TSC deadline timer
-	 * is available (x86-specific). */
-	__u32 apic_khz;
-} __attribute__((packed));
-
 /**
  * Invoke a hypervisor without additional arguments.
  * @param num		Hypercall number.
diff --git a/include/jailhouse/hypercall.h b/include/jailhouse/hypercall.h
index 07574d3d..db6f89c1 100644
--- a/include/jailhouse/hypercall.h
+++ b/include/jailhouse/hypercall.h
@@ -105,24 +105,54 @@
 #define COMM_REGION_ABI_REVISION		2
 #define COMM_REGION_MAGIC			"JHCOMM"
 
-#define COMM_REGION_GENERIC_HEADER					\
-	/** Communication region magic JHCOMM */			\
-	char signature[6];						\
-	/** Communication region ABI revision */			\
-	__u16 revision;							\
-	/** Cell state, initialized by hypervisor, updated by cell. */	\
-	volatile __u32 cell_state;					\
-	/** Message code sent from hypervisor to cell. */		\
-	volatile __u32 msg_to_cell;					\
-	/** Reply code sent from cell to hypervisor. */			\
-	volatile __u32 reply_from_cell;					\
-	/** Holds static flags, see JAILHOUSE_COMM_FLAG_*. */		\
-	__u32 flags;							\
-	/** Debug console that may be accessed by the inmate. */	\
-	struct jailhouse_console console;				\
-	/** Base address of PCI memory mapped config. */		\
+/** Communication region between hypervisor and a cell. */
+struct jailhouse_comm_region {
+	/* Generic Platform Information */
+
+	/** Communication region magic JHCOMM */
+	char signature[6];
+	/** Communication region ABI revision */
+	__u16 revision;
+	/** Cell state, initialized by hypervisor, updated by cell. */
+	volatile __u32 cell_state;
+	/** Message code sent from hypervisor to cell. */
+	volatile __u32 msg_to_cell;
+	/** Reply code sent from cell to hypervisor. */
+	volatile __u32 reply_from_cell;
+	/** Holds static flags, see JAILHOUSE_COMM_FLAG_*. */
+	__u32 flags;
+	/** Debug console that may be accessed by the inmate. */
+	struct jailhouse_console console;
+	/** Base address of PCI memory mapped config. */
 	__u64 pci_mmconfig_base;
 
+	/* Architecture specific platform information */
+	union {
+		/* x86 specific platform information */
+		struct {
+		/** I/O port address of the PM timer (x86-specific). */
+		__u16 pm_timer_address;
+		/** Number of CPUs available to the cell (x86-specific). */
+		__u16 num_cpus;
+		/** Calibrated TSC frequency in kHz (x86-specific). */
+		__u32 tsc_khz;
+		/** Calibrated APIC timer frequency in kHz or 0 if TSC deadline timer
+		 * is available (x86-specific). */
+		__u32 apic_khz;
+		};
+
+		/* ARMv7 and ARMv8 specific platform information */
+		struct {
+			__u8 gic_version;
+			__u8 padding[7];
+			__u64 gicd_base;
+			__u64 gicc_base;
+			__u64 gicr_base;
+			__u32 vpci_irq_base;
+		};
+	};
+} __attribute__((packed));
+
 #include <asm/jailhouse_hypercall.h>
 
 #endif /* !_JAILHOUSE_HYPERCALL_H */
-- 
2.25.0


--------------0CD6EA4158ECC2558ED911DC--
