Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBS4YXPYQKGQEAPESRAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 223B714A32B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 12:41:00 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id b13sf5892779wrx.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 03:41:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580125260; cv=pass;
        d=google.com; s=arc-20160816;
        b=oSfrTA0i4dRCXGfk+ieioZkMNfMlTMYK+bs/Or//evXdY/cEHzhMae/MRprFjPxoYi
         oPM6yd+J63xPwPxUyqbdRO0NLyQeNoMxz7SI2OIsBjs1tfPywTKtjk4Bo7SAPnJJBk6j
         9chnefQmJ10hglbGbMOGPhwxZU1PGyFHuJunS6XArOMt9e80X22+Nl9LSsQQzArUrbHD
         N80hKP+A6zI/HMhFxdesUWEuF7l9U/Cpc9Q+18YIi/QaijbMLyK2g/1x0Wa97+JT8C6Q
         FkFtU3KPtn2K3BJrAQd+64Iv/AvA+gXy9kPw2nvGJSzhBZUWn2mETEH/Fxtlcx5u/rO1
         FArw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=er5pktGv2iVrZ0coLqAJgpOQ+jBplO4gwo6MOramuPI=;
        b=L7jN2m3bpOm1HMEfq+aoqw29Cpgmiw9SWDzbVrSR2jyzYPhj2WLdsIJ3mYc7I6A9WH
         2i4TTCD5BBDlzLutU/QdndUSiz3HrZsa5W1oxObzai0S2RpTJfmtpLsJEFg/TZiA9LUw
         5oCAu7BjIXx3KK1LZgVWnYsscrnQtwFO1ul2F+2gDfiR37RbmgaCYDtImU5fyfTAh8oy
         d6r39H4MXvluCSrkswmZy9QqQXScJtjDaC3Al1qkb5CTyOpGw5GWZx4HG2HdwwBbdWsw
         3JaeIjOIayp627IHShivTg3Bz3Hs9T2wNKB5tXX4PZ86vXQst0jGSWCVauDGQIE8+6o3
         HgxQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ApesIBzL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=er5pktGv2iVrZ0coLqAJgpOQ+jBplO4gwo6MOramuPI=;
        b=HnXJxDl3puTL73rSKIF4Ftdm4QlIlpbY7LnJv3Qecy/jJQo/BbyCz2Zde5YIxHi9hR
         hJ6cuF7v3AJdsMUe2ZE7IIHBuqQXKn/hfCTce2/X058y60oLb/zLrdNAXJ8qW1Vdiim6
         z/9iZ39mOyvWNW+i0HePXtP9FPUyI5pVGJvoEcPruNiQ52Icu2j93XOBH0RaM53mP6LS
         Wm2nxYXaMeGMyKGAeR46aDkdws2B8u9quEbDEG4g+U76nnMUe/B7G9aNr3d1swhHP820
         PXcQm03Mm99KUXl01nd5AJD/JrMDFcdGWXOwdupLpCz4N4sviI1aYv/MUZJVQodaOdnU
         PyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=er5pktGv2iVrZ0coLqAJgpOQ+jBplO4gwo6MOramuPI=;
        b=da2bWF9TAaqVMM6hHeLlDHs4NBYgnt+H6otpUoA4NEbUpkM8+eFKFeQEXyeindy0oL
         ND9+ZSYEguPP3/1MEmln1L9Tmw06/6IvJHqDXv8a7PNIK7ByvcixJSRY+DMAtgVAB265
         nca2DXO7wJGDp1VizBYveduvcacqx9CzQ36t8N6VPwTimOS/y+TV9sEF8ViZleH873J+
         jchW2dvqHOx/FxqTSlK65ZVFYx9vvt6SP8utstZNE7X7G8XIlRwTiZYO/dCmnF4pVEuM
         GmVDxGIX9zeX4QDMH0+i5k01CHe0yKxLD58vd9TDJUjHCLZdT6ooUYPfCjDpLgkTaF6N
         H9BA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVW1LXorKHiId0Q7/+5caLsfbzFf95qqdTuGTvHj4NnQGGrThpD
	nCckjrzwvy+Am/jWpnBQMO4=
X-Google-Smtp-Source: APXvYqyOXi4WTr4jrenxplC0Tx/CrgzEv7cmu+QL2tdkacXzxcnvLIj6j7g9682umr1n/M3h9BABWg==
X-Received: by 2002:a7b:c3c9:: with SMTP id t9mr6649695wmj.18.1580125259814;
        Mon, 27 Jan 2020 03:40:59 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c3d1:: with SMTP id d17ls6494682wrg.10.gmail; Mon, 27
 Jan 2020 03:40:59 -0800 (PST)
X-Received: by 2002:a05:6000:118e:: with SMTP id g14mr22396419wrx.39.1580125259031;
        Mon, 27 Jan 2020 03:40:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580125259; cv=none;
        d=google.com; s=arc-20160816;
        b=NU1gex5kU9qHcykIi9EE8sbYHltTjxHvq55V2jmC4PjF7OLu+7rSFU7DXUdXxIeVZr
         Rt8zlgQKwBBYmeIVgVemJxDog4GPQBZG6Fvbq1ksnLhak9lZ+zc+wcO8uPifUpWquYBl
         Kz1KIrP2IHda7mM0W61XI26MMA5XMj+a3683dd9Mli9hHBpCYJPeUqrDhIrzHJ6+zrK7
         SG+MnTAMs6fNkq64OrAHqOx4Su667wtK2kosyWy+TVWE6E/PsjP1zGgvmc6Tdl4ti17c
         2Nor+FicBgzfMet3euS8zo+aS5+cwTIgQVvZmhzB0op0kQhD5jy1Ncu7xVisq33IxiMn
         0RXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=KajZ3K/8TNm2bYhoTYcqHyuw6sONvLuLDbDNk2BJdxc=;
        b=cdEMasxcItz3HdAJqWjIfzuJXn81zDjdETELKV+dNXMsXEwR+FFP7CbSg9LxkJaPmR
         zuv2SjGzPtfoJ2uRiFgXLiQAdZOK+WdqqJKakRpzz5AN34ThR19xbRhsnzkj2t3xegmT
         4PsOzlCCD14LVgj++hZOSTGWCYJu0n0XC5bQI4tZuuTB8aQU+8XNsRKgPv60rSOGEtLn
         C+UGKhIz3+hxUSzzgIYazTYwIGI50JptH/ABVsCa3tkGzjU8sPxOPvsSVTALsyKi47Pp
         Bi2OR3QEg/cN+MuKB+odhtsnO168U0Ykp9wNF32JXL/mqRKlwhc4hhy5gcXldnX7Cfxp
         zzVg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ApesIBzL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id e21si328255wme.1.2020.01.27.03.40.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 03:40:59 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 485nrB5Ht5zxwm;
	Mon, 27 Jan 2020 12:40:58 +0100 (CET)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 27 Jan
 2020 12:40:58 +0100
Subject: Re: [PATCH 3/3] Documentation: Update hypervisor interfaces
 specification
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <cover.1580107046.git.jan.kiszka@web.de>
 <5ea60323214f8cbd4c12c529acfe5223a289a10c.1580107046.git.jan.kiszka@web.de>
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
Message-ID: <278d552b-7202-7463-f58d-b3a0d6e40114@oth-regensburg.de>
Date: Mon, 27 Jan 2020 12:40:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5ea60323214f8cbd4c12c529acfe5223a289a10c.1580107046.git.jan.kiszka@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ApesIBzL;
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



On 27/01/2020 07:37, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Lots of things changed since the file was last touched. Add the
> hypercall ABIs for non-Intel-x86, update the "CPU Get Info" hypercall
> with new statistic types, and extend the Comm Region description with
> the console and non-x86 extensions added meanwhile.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  Documentation/hypervisor-interfaces.txt | 152 ++++++++++++++++++++++++++------
>  1 file changed, 125 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/hypervisor-interfaces.txt b/Documentation/hypervisor-interfaces.txt
> index f29bac43..74982e9d 100644
> --- a/Documentation/hypervisor-interfaces.txt
> +++ b/Documentation/hypervisor-interfaces.txt
> @@ -13,7 +13,8 @@ Detection
>  ---------
> 
>  This interface is useful for cell code that should work not only inside a
> -Jailhouse cell. The ABI is architecture specific.
> +Jailhouse cell. The ABI is architecture specific. So far, it is only available
> +for x86.
> 
> 
>  x86 ABI
> @@ -63,16 +64,36 @@ a similar channel. Details of the hypercall ABI are architecture specific and
>  will be defined in the following.
> 
> 
> -Intel x86 (IA-32/32e) ABI
> -- - - - - - - - - - - - -
> +x86 ABI
> +- - - -
> 
> -Instruction:    vmcall
> +Instruction:    vmcall (IA-32/32e) / vmmcall (AMD64)
>  Hypercall code: EAX
> -1. argument:    RDI (IA-32e) / EDI (IA-32)
> -2. argument:    RSI (IA-32e) / ESI (IA-32)
> +1. argument:    RDI (64-bit mode) / EDI (32-bit mode)
> +2. argument:    RSI (64-bit mode) / ESI (32-bit mode)
>  Return code:    EAX
> 
> 
> +ARMv7 ABI
> +- - - - -
> +
> +Instruction:    hvc #0x4a48
> +Hypercall code: r0
> +1. argument:    r1
> +2. argument:    r2
> +Return code:    r0
> +
> +
> +ARMv8 ABI
> +- - - - -
> +
> +Instruction:    hvc #0x4a48
> +Hypercall code: x0
> +1. argument:    x1
> +2. argument:    x2
> +Return code:    x0
> +
> +
>  Hypercall "Disable" (code 0)
>  - - - - - - - - - - - - - - -
> 
> @@ -230,14 +251,31 @@ Hypercall "CPU Get Info" (code 7)
>  Obtain information about a specific CPU.
> 
>  Arguments: 1. Logical ID of CPU to be queried
> -           2. Information type:
> +           2. Generic information type:
>                    0 - CPU state
>                 1000 - Total number of VM exits
> -               1001 - VM exits due to MMIO access
> -               1002 - VM exits due to PIO access
> -               1003 - VM exits due to IPI submissions
> -               1004 - VM exits due to management events
> -               1005 - VM exits due to hypercalls
> +               1001 - VM exits due to MMIO accesses
> +               1002 - VM exits due to management events
> +               1003 - VM exits due to hypercalls
> +
> +               x86-specific type:
> +
> +               1004 - VM exits due to PIO accesses
> +               1005 - VM exits due to xAPIC accesses
> +               1006 - VM exits due to CR accesses
> +               1007 - VM exits due to CPUID instructions
> +               1008 - VM exits due to XSETBV instructions
> +               1009 - VM exits due to exceptions
> +               1010 - VM exits due to unspecified MSR accesses
> +               1011 - VM exits due to x2APIC ICR MSR accesses
> +
> +               ARMv7/ARMv8-specific type:
> +
> +               1004 - VM exits due to IRQ injections

1004 is maintainance. Off by one.

Besides that:

Reviewed-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Ralf

> +               1005 - VM exits due to SGI injections
> +               1006 - VM exits due to PSCI calls
> +               1007 - VM exits due to SMCCC calls
> +               1008 - VM exits due to CP15 accesses (only ARMv7)
> 
>  Statistic counters are reset when a CPU is assigned to a different cell. The
>  total number of VM exits may be different from the sum of all specific VM exit
> @@ -295,8 +333,9 @@ Communication region layout
>      +------------------------------+
>      |  Message from Cell (32 bit)  |
>      +------------------------------+
> -    |      Reserved (32 bit)       |
> +    : Generic Platform Information :
>      +------------------------------+
> +    :     Architecture-specific    :
>      :     Platform Information     :
>      +------------------------------+ - higher address
> 
> @@ -305,7 +344,7 @@ Platform Information part is architecture-specific. Its content is filled by
>  the hypervisor during cell creation and shall be considered read-only until
>  cell destruction.
> 
> -The ABI revision described here is 0. Future versions may not use a compatible
> +The ABI revision described here is 2. Future versions may not use a compatible
>  layout or field semantic, except for the fields "Signature", "ABI Revision" and
>  "Cell State".
> 
> @@ -385,22 +424,80 @@ to destroy or restart that cell. On restart, it will also reset the state field
>  to "Running".
> 
> 
> +Generic Platform Information
> +- - - - - - - - - - - - - - -
> +
> +    +--------------------------------------+ - begin of communication region
> +    :          header, see above           :   (lower address)
> +    +--------------------------------------+
> +    |      Information Flags (32 bit)      |
> +    +--------------------------------------+
> +    |       Console Address (64 bit)       |
> +    +--------------------------------------+
> +    |        Console Size (32 bit)         |
> +    +--------------------------------------+
> +    |        Console Type (16 bit)         |
> +    +--------------------------------------+
> +    |        Console Flags (16 bit)        |
> +    +--------------------------------------+
> +    |    Console UART Divider (32 bit)     |
> +    +--------------------------------------+
> +    |    Console UART Gate No. (32 bit)    |
> +    +--------------------------------------+
> +    | Console UART Clock Register (64 bit) |
> +    +--------------------------------------+
> +    |    PCI MMCONFIG Address (64 bit)     |
> +    +--------------------------------------+
> +    :         Architecture-specific        :
> +    :         Platform Information         :
> +    +--------------------------------------+ - higher address
> +
> +The Information Flags field defines two bits so far: Bit 0 is set when the cell
> +may use the Debug Console putc hypercall. Bit 1 is set when the cell shall use
> +the Debug Console putc hypercall as output console. Other bits in this field
> +are reserved.
> +
> +See [3] for a description of the console fields.
> +
> +
>  Platform Information for x86
>  - - - - - - - - - - - - - - -
> 
> -    +----------------------------------+ - begin of communication region
> -    :     generic part, see above      :   (lower address)
> -    +----------------------------------+
> -    |  PCI MMCONFIG Address (64 bit)   |
> -    +----------------------------------+
> -    |     PM Timer Address (16 bit)    |
> -    +----------------------------------+
> -    |     Number of CPUs (16 bit)      |
> -    +----------------------------------+
> -    |  TSC Frequency in kHz (32 bit)   |
> -    +----------------------------------+
> -    | APIC Timer Freq. in kHz (32 bit) |
> -    +----------------------------------+ - higher address
> +    +--------------------------------------+ - begin of communication region
> +    :          header, see above           :   (lower address)
> +    +--------------------------------------+
> +    :    generic information, see above    :
> +    +--------------------------------------+
> +    |       PM Timer Address (16 bit)      |
> +    +--------------------------------------+
> +    |       Number of CPUs (16 bit)        |
> +    +--------------------------------------+
> +    |    TSC Frequency in kHz (32 bit)     |
> +    +--------------------------------------+
> +    | APIC Timer Frequency in kHz (32 bit) |
> +    +--------------------------------------+ - higher address
> +
> +
> +Platform Information for ARMv7 and ARMv8
> +- - - - - - - - - - - - - - - - - - - - -
> +
> +    +--------------------------------------+ - begin of communication region
> +    :          header, see above           :   (lower address)
> +    +--------------------------------------+
> +    :    generic information, see above    :
> +    +--------------------------------------+
> +    |         GIC Version (8 bit)          |
> +    +--------------------------------------+
> +    |          Reserved (56 bit)           |
> +    +--------------------------------------+
> +    |   GIC Distributor Address (64 bit)   |
> +    +--------------------------------------+
> +    |  GIC CPU Interface Address (64 bit)  |
> +    +--------------------------------------+
> +    |  GIC Redistributor Address (64 bit)  |
> +    +--------------------------------------+
> +    |  Virtual PCI Host IRQ Base (32 bit)  |
> +    +--------------------------------------+ - higher address
> 
> 
>  References
> @@ -408,3 +505,4 @@ References
> 
>  [1] Documentation/cell-environments.txt
>  [2] Documentation/configuration-format.txt
> +[3] Documentation/debug-output.md
> --
> 2.16.4
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/278d552b-7202-7463-f58d-b3a0d6e40114%40oth-regensburg.de.
