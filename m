Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBF6N7XVQKGQEV6LWFDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B53DB3858
	for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Sep 2019 12:40:24 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id f9sf22204466edv.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Sep 2019 03:40:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568630424; cv=pass;
        d=google.com; s=arc-20160816;
        b=OjoXmRBKB4t7Qwjq0vFWYIezuD2ZzxUuAVTzDoUUS2frVPk2OacUTDuEVZMux4jAYi
         TZz/NHvBCKE7E2KNVu646cONmNuJ2ovS4C0gg9HzQ8FFHC+qJQBt0t6GwHER8ptJjxlJ
         hnaqJqBjqAup6sOqXRc9i4ZF4lj0oZ5yY4Yb5T4sAQ/4++IvuUwNGPQRGaBPINzp57u2
         7CGheYuf9IMA7gaRcJ05Kc3343lCdCxseHuwKB8As4okZGG5WUiswfV++5HhM/v3n19r
         exMMMby2MP4RsXC2CIcjW7W+LbmVLPZaY9qsAXeWwZzO8DmBcBjTknwFsF5v/3bjTCMY
         uejQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=jMUUoNUVpNVVuqNbKgj0USJZJNGuq2u//l5ozYOyfb8=;
        b=FyBbxAB/De1QiSqp+1XKFFN60hW/PAfYG/UOEg9gDVIDhEtHD1Xxl/4C9VM4Yq1xz+
         WFiZu7OFw2ALyIHQwwc/2APvK1kldlfVoZspFw+4vbDsBYVqORo7YkMoU78+l0ZvhHI5
         Ty5w2A8weFL+S4zEBRILMgXmQoMFeATsbLaTB0bfaDDtkkWi5a2bvu9wbYld14GUn+Wy
         t4Xz4iU+55NyHMAUrDjHL4u1UfMzgpxEBJ+1/HaPSku5bvecGM5MUuUg17b56t1TyUke
         OeK2pS/PPJ5OSiPAhOnws4I0/3AoBRwj2NEjwWZaWZYQn+BBbAAN/pURCtReDEupp8rP
         pwUw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=cbzaZo0s;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jMUUoNUVpNVVuqNbKgj0USJZJNGuq2u//l5ozYOyfb8=;
        b=bhhcfAmKN6XVZ9sOdQ7oL1oY6FXlBI1HprOsdjBMkIu2a1blAFS9hAhfCIX/zKZBYp
         6vpImNBPE9MBDyXvjEh1msbGXtvabIx3tlVusI8HwP/v1uVzawa6y3Q8r+4qGiu3HB6Z
         4G8+BjZppm5AEZ/aakoZc13f1ecJwJs6PgbTGgAwoRZ+wgREFrX4gQ31ufXyM6LCxlBh
         kDBjHRE/RMvh0PWih8ZCa3K0ZVWHvizcgq0/QCglUGc68ZRrOxm8NrMAp0TB91mAN/0K
         xEX+NA53wuVk5f/4MiJIrk1xghNwEn+U+m5l214V+Rv9gPwSpQKz33zhLX2V/0TSC4B4
         9VTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jMUUoNUVpNVVuqNbKgj0USJZJNGuq2u//l5ozYOyfb8=;
        b=NOUc5sDlrbp0MOZLy4MA9eQb+WuGKp7si70WS4DDN7gQs69wPwgLjGqrfLDm+cWbB5
         KOCqFKi5mKCe/JC+/3SmxT5e59+8CVSYew0W9KmcgK5pmfGFri6/nuYsf+iorX279dnE
         bkE0LhhU1QMetjtODPR4xBEZsWN9rFvV85uCmZy949qy00cRGkmyDbQ9hD+NdSjEWHb4
         g+GTxrAW6gMuOSk0S7tSDiuAvRG/WIPzILTRJwBLqf71bvV6Ciz9MwWWsSsxVvi045Qx
         pV45UAo/O1xoGWiG95+tO98h0pyCJhqhK+k+KYRiFVS7cmIxQeiwBKf7S/+3uCyOpGaA
         3vTA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVDUEKeKUySXUUvVaCenWwp41ylmzOtVwmces+rvmMVsGm4AC1q
	5qJUzwClJsGYNB53bey5EYM=
X-Google-Smtp-Source: APXvYqxjAw4lhy1BXWj7qbamu90Oleyzx7iBdjC4apusSs8UkpOK9iTCeHHK9/SAaa+W/yeuP2W4PQ==
X-Received: by 2002:a05:6402:125a:: with SMTP id l26mr23803634edw.95.1568630424146;
        Mon, 16 Sep 2019 03:40:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c44d:: with SMTP id n13ls254491edr.7.gmail; Mon, 16 Sep
 2019 03:40:23 -0700 (PDT)
X-Received: by 2002:a50:ef12:: with SMTP id m18mr5534166eds.18.1568630423550;
        Mon, 16 Sep 2019 03:40:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568630423; cv=none;
        d=google.com; s=arc-20160816;
        b=cgK1ewXCjlXhOKnvgARmoOizN38oRh8iUvGRvs2e6iz377rFpYA9JXstF1PA0MwUh1
         mJ/zfNz/WiGvlyxCFk8/yn1V5Gdnhkdvidv+OG0NfhCTeyWA27trIe1lMOamv7iYmXrv
         yH4vYvahqdzic4zImmCkx+SBvG4f2N8loUnGXzIC7ysMaKBWEYdzGReo/kbVoflkHXpy
         WIbM7n6i5NGCDh7LLFr1q+P7WizJ68lc3mpBBzD18gZ8bLNgrHHoUfmTrhzz4YnyynG9
         ATRw+vOEFeNovGoAXSdCxzKpUFYUyGsEB78bM3ZXw1Ofi2v6ynj7akfKY6MGe0HSjsEs
         CX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=k3WDZT53RVV+kyJ2o4XgFJIAWIT37nj/GPpuzhnMp8I=;
        b=CcMC7dCO3LlFyZp75NAIUxPxjTxKjf6VduGawCgImAn2k8W0YjVWC5Ho/VjrRvdJ9E
         ymldetNCs+65Vh4g/KxPWYmaYtfcwIo4yMlGuB7JuzRF5OgmJmOKHMzvb1zH1y9lzxm6
         4V1RZ7ic0z8NpO0JQ7bAD3PrDFgJARRehmcxU0WVIQEKsBzaq1/lWrAq5229cDDbXWPz
         lWGKOElgnfF9abJcGSKySw8kKGZBmVgEBH8gKNRYwz9pBFRZizu4G50y2KV6RLbneAbf
         b/6cYqQ+7w6ygfimxn8tzeAOAoZI/g7UCvX+T8OBIV+klrmIIeJqXEJzKF8aVTuKhrxB
         zQjg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=cbzaZo0s;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id a2si921960ejx.0.2019.09.16.03.40.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Sep 2019 03:40:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46X2ng0DXzzy31;
	Mon, 16 Sep 2019 12:40:23 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 16 Sep
 2019 12:40:22 +0200
Subject: Re: [PATCH v4 0/2] x86/jailhouse: improve probing of platform UARTs
To: Thomas Gleixner <tglx@linutronix.de>
CC: Jan Kiszka <jan.kiszka@siemens.com>, Borislav Petkov <bp@alien8.de>,
	<x86@kernel.org>, <jailhouse-dev@googlegroups.com>, Ingo Molnar
	<mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>
References: <20190909151030.152012-1-ralf.ramsauer@oth-regensburg.de>
 <alpine.DEB.2.21.1909161154030.10731@nanos.tec.linutronix.de>
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
Message-ID: <f54af247-b27c-d772-641e-4a752a264dfd@oth-regensburg.de>
Date: Mon, 16 Sep 2019 12:40:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909161154030.10731@nanos.tec.linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=cbzaZo0s;
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



On 9/16/19 11:55 AM, Thomas Gleixner wrote:
> On Mon, 9 Sep 2019, Ralf Ramsauer wrote:
> 
>> Hi,
>>
>> probing of platform UARTs is a problem for x86 jailhouse non-root
>> cells: Linux doesn't know which UARTs belong to the cell and will probe
>> for all platform UARTs. This crashes the guest if access isn't
>> permitted. Current workarounds (tuning via 8250.nr_uarts) are hacky and
>> limited.
>>
>> But we do have some flags inside setup_data that indicate availability
>> of UARTs, so simply use it.
>>
>>    Ralf
>>
>> since v3:
>>    - Link: https://www.mail-archive.com/jailhouse-dev@googlegroups.com/msg07365.html
> 
> Could you please provide links which resolve via Message-ID of the cover letter?
> 
>        Link: https://lore.kernel.org/r/$MESSAGE_ID
> 
> These are way better as they allow retrieval via message ID even if the
> archive URL vanished at some point.

I fully agree, that's much more robust. I chose mail-archive as
jailhouse-dev isn't archived by lore.

However, if lore would ever archive this list, here are the links:

Link v4:
https://lore.kernel.org/r/<20190909151030.152012-1-ralf.ramsauer@oth-regensburg.de>
Link v3:
https://lore.kernel.org/r/<20190819183408.988013-1-ralf.ramsauer@oth-regensburg.de>
Link v2:
https://lore.kernel.org/r/<20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de>
Link v1:
https://lore.kernel.org/r/<20190802123333.4008-1-ralf.ramsauer@oth-regensburg.de>

  Ralf

> 
> Thanks,
> 
> 	tglx
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f54af247-b27c-d772-641e-4a752a264dfd%40oth-regensburg.de.
