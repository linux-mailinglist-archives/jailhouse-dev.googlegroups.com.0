Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBHX45T5QKGQEQV6V2BA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 97968283AFD
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 17:39:12 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id e3sf1296856ljn.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 08:39:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601912352; cv=pass;
        d=google.com; s=arc-20160816;
        b=fYvhXFMPDgacWXXAJLZ4x7w0yr1Zdleg7ii+FVl+qppVRtDgIXSAhUe7QhaoyWluzO
         vxOy6X27CWEZVrbuGGVDba0RU2qML+L7YXrSyBxEJZ4nS4gDfdDE15keBiU+nxWQg/Pu
         OBIw2qv+P9CNqwDD3c1roXf1OJz0wr2VZQDjPQfmUIrJT/hN/JD6URuTA0eHtumPTbta
         o0BbUWr+SgoCdsBF4YY4xIFpvqgPfQlCv0EafAb+3phvRbApdzyNsAOy70jeOY0IImpy
         Y6aGOizmhSOcBNON9ut6tYV/vWrPkqB6+1HvDPl6NtEkN2ltbcDIyROCb7SkSLc3MVif
         W/ug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=N8EX6vsU2bKt6tncLKgL6AhQUuMhl+7jVKIYf2CSNYY=;
        b=Xd0S14Vr18x5ERmvcTACO+kyuR9ByYsrboALfPyBREPwMPY3qPtjImqQvvA44Wl9pg
         cNTK1BwniJnM/b73qXmAmmN9IDCcytAWNItP//csd7opZ0FPV0OBxU6KaYKM2yGVUvIR
         gn7LLjtYRMAPI+Xg1aGaeDGIQ2AAOF4gAUwxLB+qV7Jj4kKR368PB21S1KKSR88sNyaS
         0ZT5dBSeGPe/oFSkr473afiIt7dTbF6ZzZ7SxxnVLpC1XKI0lCsbEO7JFrIOdVV1OF11
         +Pmc6wN73EnwJ77q7eVqP1ytXdRK6SPKQlCbypHuXZMtyyOMqG/p23Fyx+vwph8CsXpY
         J7cg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=pWnXnpSR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N8EX6vsU2bKt6tncLKgL6AhQUuMhl+7jVKIYf2CSNYY=;
        b=Tm4CQWlAOQSSdj/kDtcuOP1jR89XON53GKHG+d5p+vMv794iUEJZLilFDO1Y5LiBdJ
         QyLsR5f8Z17dUcZU1m8Httv/QaOcQY1fY3do8h/5zU9Vr9ZAOc8a7UTqET2cRqEZdpYZ
         c1WJ8MJ2YWi2MTV8bOIJaMj/WvEGFH4wMJNvSiiC7wNBO9G6THbP+V6mj9Prgm28T7Vh
         ahBo8dNUSOGCdtcQeH5BhoJm3XCKCaUwKeNM4nws1jfobTU+bfBj6chmxTG4Y80QfV1M
         bB/Woyc4/nnhb50YLXZtqDNhm4SfAw5bs3/Mt3NEAnVgSmk1F2L9lKeZwP5rFJiVfufV
         R8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N8EX6vsU2bKt6tncLKgL6AhQUuMhl+7jVKIYf2CSNYY=;
        b=BCDsTAPYVG59c5ku85ZWrSgdzi6+2A69EwwQcQSrSDLdyJptxhg9oWTOdvg6M836vX
         WaDSjOqaLoO4N3gwnb4NxwzdfW7imiV2TSlzN6ArnRQAZmvz7CqlFCe3VURe8GMULjYB
         yaswxauKaAzZOvIgF9Y4T2ifo+X3ogxsHbXgQQxuqC0v3a4o2Q+8pmjloWm1bx+Jop9I
         WW1KEWlapfl27e63hl+ui16SqeXhIYGwBh7hfsEMkskQO+EAwYcvK4SEU25uxy38uDt8
         gR/zn0WDTMMS8G00Tarh3h8XzG857KLyrFrOz/bBFP7rPtdcHuqg1Oe2kDgtTP6O7sf2
         3Qtg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5309Dq/VHALMZdt54T4aTYcuXCphm0OKBeJMOpMtGjrzGWVFN/QG
	cYP0s1akUWO2zHOHOPAmDwo=
X-Google-Smtp-Source: ABdhPJzhafdBEJFc9ZfGYmUNKkJBMW695Wc4cO9wTxb4lw06qJE2SS5DoKxdEWQ/3oV036ubhQU7XA==
X-Received: by 2002:a2e:8619:: with SMTP id a25mr109772lji.390.1601912350637;
        Mon, 05 Oct 2020 08:39:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b0e9:: with SMTP id h9ls1179871ljl.5.gmail; Mon, 05 Oct
 2020 08:39:07 -0700 (PDT)
X-Received: by 2002:a2e:818b:: with SMTP id e11mr116239ljg.0.1601912347838;
        Mon, 05 Oct 2020 08:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601912347; cv=none;
        d=google.com; s=arc-20160816;
        b=XeeK+gGndSKvmwrE532SebPnH4eeEemrBvfYUGtd8s/zjWPFUd6woR4AFp19uGiOEl
         5jtpCXvKjnOEGPFp2N9zQvfcE4LnvDV1D/38qyo6POtHp0ZPMK83pRs0+y0lxmT9FK0Q
         yVLrpQipXJBwqoUBvZCyi+RvegO1joGnuGdLkATLFY1uDLTXUE7TA7wfptcmIzLI/zxc
         HKWxHJd401xuuX1uLq5X6V1AFGWN4PjPGRmOFPXR3cEJfNpIKvb+mgS2zG9kw3yq5sPJ
         5H8TgYbGGUuMetreyqNeiMITJxQk+5R8QxANWUSaPh+FH81MlFRerlMYo2nMONsuwybY
         pW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=vKn6dk58DiHbfwx3ODI7Cd1KR9SlhgXPqDMF6Xhi24U=;
        b=TuLeespdWzqS62YoMR7jaPFlNwTddh1Cb5LK79IpRi7vurU0CgF1s5U53QVYlqID3j
         ySkMDEmHM3D4KEX/WFgwWeb0WXDk2ElTi4SdGL2VGfordXH/wvxKxHoAiafxBHbHsl0n
         1NK5BjW3rFj0PFNba1mbiyHCjA9RX7QzSYPRPgv6eXor38Q9x+wMyXQaekQz9SO9TRCU
         g1ty2gTy6p0FtrtWYWdFAfD8i7ux3cAGwvy47DhOW4pTu+yHqcFz4/0/JGLaBNzzSOy+
         QbR8ymPZupbP7Us3ctSG9ojf5faknd22R4g/87MrIPHYdtB5KIce1EGmsmwPxa39Mpj6
         wXOg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=pWnXnpSR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id c20si3502lfb.7.2020.10.05.08.39.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 08:39:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4C4lBf52tLzxvr;
	Mon,  5 Oct 2020 17:39:06 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 5 Oct 2020
 17:39:06 +0200
Subject: Re: [jh-images][PATCH 00/19] Add Ultra96 v2, refactor/update TF-A
 integration
To: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, <jailhouse-dev@googlegroups.com>
CC: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
 <f13614cc-920a-e8f9-8a36-e6992b736698@oth-regensburg.de>
 <1a0cc554-a3ce-1698-4d7c-392498d73fc2@siemens.com>
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
Message-ID: <4393040e-a217-ca5e-7b15-4803cd789b17@oth-regensburg.de>
Date: Mon, 5 Oct 2020 17:39:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1a0cc554-a3ce-1698-4d7c-392498d73fc2@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=pWnXnpSR;
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



On 05/10/2020 15:46, Jan Kiszka wrote:
> On 05.10.20 14:53, Ralf Ramsauer wrote:
>>
>>
>> On 05/10/2020 07:39, Jan Kiszka wrote:
>>> The primary functional enhancement of this series is support for the
>>> newer Ultra96 v2.
>>>
>>> In addition, the series refactors the Trusted Firmware A integration,
>>> using a soon to-be-upstreamed Isar patch. The refactoring also bumps the
>>> version of TF-A and U-Boot on affected boards, namely Ultra96, RPi4,
>>> Pine64+, MACCHIATObin. For the last two, I'd need some test feedback as
>>> I do not have them in reach.
>>
>> For the MACCHIATObin, please find the log attached. Early stage
>> bootloaders seem to run, while u-boot gets some abt while trying to load
>> the device tree.
>>
>> Test on jailhouse-images/next, 6d797f1f59d.
> 
> Grr... Will be hard to debug remotely.
> 
> Could you try generating a card with the old U-Boot revision?
> 
> diff --git a/recipes-bsp/u-boot/u-boot-macchiatobin_2020.07.bb b/recipes-bsp/u-boot/u-boot-macchiatobin_2019.10.bb
> similarity index 52%
> rename from recipes-bsp/u-boot/u-boot-macchiatobin_2020.07.bb
> rename to recipes-bsp/u-boot/u-boot-macchiatobin_2019.10.bb
> index 2bab197..088188e 100644
> --- a/recipes-bsp/u-boot/u-boot-macchiatobin_2020.07.bb
> +++ b/recipes-bsp/u-boot/u-boot-macchiatobin_2019.10.bb
> @@ -9,7 +9,12 @@
>  # SPDX-License-Identifier: MIT
>  #
>  
> -require u-boot-${PV}.inc
> +require recipes-bsp/u-boot/u-boot-custom.inc
> +
> +SRC_URI += "https://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
> +SRC_URI[sha256sum] = "8d6d6070739522dd236cba7055b8736bfe92b4fac0ea18ad809829ca79667014"
> +
> +S = "${WORKDIR}/u-boot-${PV}"
>  
>  U_BOOT_CONFIG = "mvebu_mcbin-88f8040_defconfig"
>  U_BOOT_BIN = "u-boot.bin"

Jep, the Macchiato successfully boots with this one.

  Ralf

> 
> TIA,
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4393040e-a217-ca5e-7b15-4803cd789b17%40oth-regensburg.de.
