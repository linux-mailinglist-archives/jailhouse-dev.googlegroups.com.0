Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB6O6ZXWAKGQEJ2Y4DSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDCFC38D8
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Oct 2019 17:23:38 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id j125sf1572177wmj.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Oct 2019 08:23:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569943418; cv=pass;
        d=google.com; s=arc-20160816;
        b=kR1MS/REUucrQ9JLZgbtJLtO/WBuM/sMHYFbLLIwAgQ2t/in4gu5cR2xnMMzTNcIG6
         cx41lrwkm+aQulgbOVM7BqE1faTdx1ynaGhoexiQrgnsADdZhHSV9SdYdSXdu+H81kDX
         HYGBnjZnQGbJnn8byt2QdFGdq2grVbBf6fkymysPUFzCzF/+LDLJt3UgEtlPPnER79dJ
         mHcj+FCQ0QJ7ifLFS3cJTe5iHtt4rzfjvW6GD7Dm3dY2b8KqrMxnbGAy2WIpox2Xf4Gd
         Gc4PVX6t/3B1rha5YX4TiOYeO7hn7GQ0kSFLf9R54yKA8DhF4YeWvObrOfT3ZZdUgrPU
         i0bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=osVEY6afk2sgelCsGNCjZCQf/HUBP4oW2EtrUbQlf+4=;
        b=ZzrmWGl/x194T+d0qY/zRg4eStAabxPZOGfMSWlBvm+uz+mGIKc8P1GjMi7Xnz5zaF
         lhlo2i6him2X1lKzm2zdIf/y3kZNW27B9S/96wlhpY/9U3O+IC9nBH+kOxUMS26cBAZK
         qUUtWhN2GVw8xjC113vorG7agGj9lemnnlOxbm/6b1xVKrNsmnUe8dHgj7k9vP+1cYJU
         UDyo4Uwr7KQg47VBXjAOeg5/MR1BmmFeNyGoR+VQqYCGwU0MkK5UHNVjaC6S8ENfAWnw
         llpzlHKmPQlg77Eqw2wy0hH3slHZyJwZe3lljW+ruK5MYa7AMUwOcj4n0xvcScEsuFun
         X0mw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=V8+8VZXH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=osVEY6afk2sgelCsGNCjZCQf/HUBP4oW2EtrUbQlf+4=;
        b=njy0FBZ8q2xJOJUHWawR/Fz0A9B14PG7vaOu3asJci3OnY/T3L/s8I9qv50VtJy0U/
         LeVRWry2IuYDjBTh8U+bh7SlBbWdipLQtW/AtE3MMN+ajZpHi9LCyNsuqwk6lcIfWpz8
         vZO8pUnWcXKPmfz7lelpmAATi+lzJWGRVydiWveil6abR5++Cz+zhVNfHjyaoMCPvrtY
         n1mbF5YG2BhgJ8oo0D/7ol46zR/VBj+1rG47xgf/bUoZZP3gsVkE1+QJuWLb+q6OLx9t
         GgqvKtOuC+ml5RrhQ0NSkRR9d2LixltV4Z6Rw5c9ZWZFcfkKHeVXlr8aPNBVphW8kuNK
         6bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=osVEY6afk2sgelCsGNCjZCQf/HUBP4oW2EtrUbQlf+4=;
        b=eOZYPlxl9sefjt8+b6vzrNisb9ZZTiZh6AWFW3f3lP+1Hp3E/VpDS2WdULbzzR3AWe
         Xl1MFI5+ncY/t0Vko/QNLR2pCyFE1O2Q70STw8EVXMSg047HXHBsvlhtQA7Xk4+HuYvf
         IgjuPScok8LgAIEJUOvpPhr6fuE69h87Jmko6LU2ivPeCzzOhlNWqjJgv9YsDKKb8IlH
         VSvailqg6yXk55mdfI/fdMsHG2uXwAbJ5vEKGt1mLmfirFA0Rb6RRAfz/2SaRiW6SQ/m
         eFPcBsaa+cLcaNVQRGeOJcuXEvYcKeSorJyxVLl1PXwItyyR6IAI43zGmRnmFpfSkrse
         qbEA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXDPgOoJqoDfmxL8Ma4dGusB9E8C8bAP+nV4KvU8nuCjTnuX1cI
	nyTnMMw73A8r4xUDA2/jZMg=
X-Google-Smtp-Source: APXvYqyebm8y+HdwfoJ3gjG5+0OYn3KTNldpCFiEZFClqld4uUnryiHm2zj9B8AD796PuW1Yq2MRgw==
X-Received: by 2002:a5d:4985:: with SMTP id r5mr16676781wrq.139.1569943417900;
        Tue, 01 Oct 2019 08:23:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:474c:: with SMTP id o12ls825046wrs.16.gmail; Tue, 01 Oct
 2019 08:23:37 -0700 (PDT)
X-Received: by 2002:adf:e909:: with SMTP id f9mr2924998wrm.129.1569943417164;
        Tue, 01 Oct 2019 08:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569943417; cv=none;
        d=google.com; s=arc-20160816;
        b=V4FGsJMdwhuEqjMaoXnc6pUfJumwfpiZjn3crRCqBpulLPCS0ye3NVSkDSniyeYpog
         JkJc/rcB9E9ZSlygbc992IQr3hv48RCgWyqv/HvDQuV2uwRy1G4bC3j2GNPV9lDmpCWv
         HP0huQTjCFR1kJ2TMNYME/Z0/3oAa59a/heYsBxiCMr9PQLPL+809+z9mt6YGWh+B+C5
         tTxK6PjK9qPPs0VG76uXQgPfmJYztwrCEcP3dmswOwsp79rQE48hadmW41UlfQn5uITT
         b+IdaZ5NigCIBTLHVwAjwQWiw2mkt07/peBFHI2Rt+7AmVl0f7aPUUzGQmFPXcX2m+XA
         1ewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=HW7+Xj+3u/DWSEO5x1Gd/deLteK8RO9IKuI59iMYrbw=;
        b=psS+T0MxoiE7bb5XcJTP9cfr+qq0IBt+rHCZ14GD4PM8N1LyxZGs+Mf1Pn9lXtIJMP
         CixR4Sb1L1lm3x4ps9tx8sKXo8ZbF4cPZ8ePetZWJX4nODuHEMogb6iWl6q8WviBEIpb
         gx7ltw5FEXkrATWuJtHQnhPahMzvAArg6ttDzLfO0OlqQZcH+lKnAH/GAu/5DkXKAYYB
         U5V71S6/jFX2go9aaEMXNw4HiGmzrMHs4AIofFfnZFCW+tWKvwuKNgAayVKWmBoHqONL
         tCW54R7ztbAWr6wuzOWA6LSIUIOzlxjHFi4QkBGLq85ZFb1EFFRbnYGxv6hNp5d2amKD
         3SWg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=V8+8VZXH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id t15si675604wrs.3.2019.10.01.08.23.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 08:23:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46jNMX5kDHzyDx;
	Tue,  1 Oct 2019 17:23:36 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 1 Oct 2019
 17:23:36 +0200
Subject: Re: [PATCH v3 00/14] pyjailhouse: x86: Implement config generator for
 port I/O
To: Jan Kiszka <jan.kiszka@siemens.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <0713c187-2670-7914-1ad6-561bc4073920@siemens.com>
 <724ad1a6-00b9-b921-122c-25c26e75349c@st.oth-regensburg.de>
 <f31ce534-911d-ccba-c96d-529eb7a5c828@siemens.com>
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
Message-ID: <922f18c5-418d-cfcd-1078-e632a9266464@oth-regensburg.de>
Date: Tue, 1 Oct 2019 17:23:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <f31ce534-911d-ccba-c96d-529eb7a5c828@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=V8+8VZXH;
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

Hi Jan,

On 9/30/19 9:28 PM, Jan Kiszka wrote:
> On 30.09.19 21:25, Andrej Utz wrote:
>> Hi Jan,
>>
>> On 30.09.19 21:19, Jan Kiszka wrote:
>>> On 30.09.19 21:13, Andrej Utz wrote:
>>>> This patch series eases configuration of port I/O devices for x86
>>>> plattforms by generating an initial PIO region list. To sustain
>>>> previous
>>>> behavior, most entries are disabled (commented out). Only whitelisted
>>>> device ports are allowed. This includes the peripheral PCI port space.
>>>
>>> Did you also try what explodes when enforcing the generated list? I
>>> mean, if there is no mess like with hidden memory regions, things
>>> just Just Work (TM).
>>
>> Not yet. Analysis of additional whitelist candidates shall follow.
> 
> We probably need a mixture: white-listing know-harmless thing that are
> requested in the legacy range, combined with permitting the PCI
> device-related regions.

Ack. With a little luck we can rely on entries in /proc/ioports, at
least for PCI ports above 0xd00.

I just compared lspci vs. ioports on some machines: Looks like ioports
contains everything that can be found in PCI config space. But ioports
contains even more.

What are those pnp entries good for? E.g.:
  f800-f87f : pnp 00:01
  f880-f8ff : pnp 00:01
  [...]

Are these reserved areas for PCI devices?

And on my laptop, I can also find ACPI stuff above 0xd00:

0d00-ffff : PCI Bus 0000:00
  1640-164f : pnp 00:01
  1800-187f : pnp 00:01
    1800-1803 : ACPI PM1a_EVT_BLK
    1804-1805 : ACPI PM1a_CNT_BLK
    1808-180b : ACPI PM_TMR
    1820-182f : ACPI GPE0_BLK
    1850-1850 : ACPI PM2_CNT_BLK

How should we deal with that?

And what about VGA? We whitelist 0x3b0-0x3df on any machine. Shouldn't
VGA be listed in ioports if present? At least for qemu that's the case.
If we can rely on that, then we wouldn't even have to whitelist VGA. [1]

Besides that, we could enrich PIO ranges with a comment that links them
to their corresponding BDF, just like we do for memory regions.

In any case, platform specific stuff will remain static.

  Ralf

> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/922f18c5-418d-cfcd-1078-e632a9266464%40oth-regensburg.de.
