Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIGB5T5QKGQEAGWMCJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FF42836A0
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 15:33:21 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id p17sf357735wmi.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 06:33:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601904801; cv=pass;
        d=google.com; s=arc-20160816;
        b=eoZt2Vh7SeqtEWEbVV53vEJ0Yt1/B7SA1vve9Ok17CR50QifAb7LLEhvwrtuW9OBSe
         QAXXhOY7Sfb/p+InW/V3FbcpDavgYfmOD37USb5y2xBV5zZm2O8dArheTrV/r0VQ7UyH
         ZUzG8WSc6DGck1vDcDw5wViDoC8LTSVg2HfklNTwGC1Q/RawejrMjwH5WyU473Gmhu/x
         njCWMKg1SMfeIsTY/Dg7NgaxgTAtAGRACGfniZQwItpEXWOzhw97ySuZM3OzwMBcmnXB
         0nalOSN2h3zfssZs6HIdzyabqzBJ3/FwK7Ult3AuPI7QKKFaij5n7dYmNl5YRHOi6zbU
         10ZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=kSsVQmQC0WCnKXipMJJK2rNYtduQtRKbo4RxbIZu5q0=;
        b=scd6o80FxosV5BbRiSIBLH4VDG/ZzvWBkjhU5bSj+NvwXx5g0SwWGLC6eg5m0Zb6fb
         x8R1l3ORt+JhYX/wmtSIkUYcXv+oePWsHr/yEZAUWxuAmWQ7w5S7xu6MSkY6PrMxjPRv
         niRF2xIKpYd7l7qXHk/I1iS35VYVLFYaxTYrAI6Sf/Z1poFLRqW+tuQu+fUfAM2/xiPY
         TBa9fxpX9aBsp3KUaLr1+FhOtfG118x16jaiAhQFVrJvGg9OokJCCOffkBdjeJLmlaAc
         2VRHMBkciUftU2to9uuhwiazaSJIwPIldIrKYQMyWY7+yH/ul2pX6ljHvQyk5lsG0y0P
         i2dA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=kKDzAqBL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kSsVQmQC0WCnKXipMJJK2rNYtduQtRKbo4RxbIZu5q0=;
        b=XU9/GowArZBWIc3QnOjZzoazsNMhidEK+kx4sRnOw0N38FzL6cVce+Z+463FEDndLl
         Uih1kX6Yzxozrhpq2YMFOZLisQMwOHuEJ1MTYww5ZD8/PjojkU9vel54n0y4/g7rd5Cx
         /irvqEYizHBET29/OxZn4G9yyhXBVowt2TaVj6Q9LxAZ6m24I/t0tCx32ox3Fr8F64mF
         CEFHGzg59I11L5DU7bzzumP6eH0X9wuJAqFKZXv8H1P9M4FlIJeyJb3DdD6BN+qiD2io
         cI1b+8cKhoR/y8nmqmWmUw3xYQBAgL5YPD0G4HEjfvz3Hf5kO3dBQQhvgiYoPBcl9r3i
         gOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kSsVQmQC0WCnKXipMJJK2rNYtduQtRKbo4RxbIZu5q0=;
        b=EsXVtkk79rnthSRcUKJS6Ij4DnmWW0LxAAIsKeJPUcrfoqVni+uOrX6PyzR5BjDLWo
         SE6H3JqWKEviigA/TP4ZBhkDVmrSI06eOHGp4jbYFlPmeA59zQtzEyIfl0erBwYvu/IE
         vV9wCUj//gPgGqV9A4YvU8wIYYKaonm8AS+KxjuaxRsdPF/N5wtQJPGKKwBaQgtobaqC
         XKgcorpqOo6R+OTsv5tkZpOCiysY6P2XxQ7kY/s68WgW0XyN9wT85l/WhBnOiVyHonUU
         m9QqHO8mWmJt7Ws65wKFh9qg10xYreyyqMCfuDzKRMGlcXL6QrCt8vSQgjXg95mvSqRl
         Rjgg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533/38u2qUKR2XolkdCzfRM61aliaZxjDNWKgy5NRuxcMhFpQS9B
	Ke54uUQb8YkrPFSgucg9JqE=
X-Google-Smtp-Source: ABdhPJxtLF3DpS2p73e3BOgRK+gDDa3I6jhFiynuz9HEjlkGQgRZzNVIwxbqE1sWkCNWbyEifoLqRA==
X-Received: by 2002:adf:f843:: with SMTP id d3mr12591710wrq.226.1601904801227;
        Mon, 05 Oct 2020 06:33:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cbc4:: with SMTP id n4ls4853087wmi.3.gmail; Mon, 05 Oct
 2020 06:33:20 -0700 (PDT)
X-Received: by 2002:a7b:c7c9:: with SMTP id z9mr17928400wmk.91.1601904800234;
        Mon, 05 Oct 2020 06:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601904800; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/Fkz5Si1K0AF66qiE8DLApGoueKFP0r8e/edj5z1QGYG7h81sC4i4PEjL4XGxayD6
         SHHEYkrRAx1KUOutGNWiACqnAyfDbIevgj4FDb/Mp2NKc4q4PVJAiW9SuP8BfyqGOGYz
         8mRJ+u3jzeJuWvpcgMKEteJ0e8h8n1ro5qoou9XYFaSQbdP1mmDhl6x5R0WoIQcM0vQx
         XuW0uL3zj7+nTOsGG3Ie1lFjs4NYf0nXc1I+RHas/eArZuWjhuUWqWq7tOwtvrSOxRL7
         OTdT5YOJNr8mh4JPu1cO+CEPqfNUKR/JiPWISsv3pjQUd+GyDAocqxWlOJHkeL6gKQVW
         M6xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=zktD3ZmFdW1opTsH6r1OQt9AtRV7UEUNb/lKAOcT58k=;
        b=tV1TxEgW2zihSBIQ7dAFcYrYDpL1JQYlUtWjbEs1cTVbi42kzPXA1EtoUIIPKMwCxY
         DVUYOlS1EbjhHUB5K0cAxFxepTqPTaF4GbPfWyhrA28s+VUHr45xcvoXhCYJknZtcJLg
         DjW1WK3wrV2Y5nCE0iE1NE3AfHyrB93T8R7dMiKW5/Gysn8Hy7ZG1BWAm1NNiEzaMc4x
         sOhLMv+eSOyzmb/N6SfObGGzWRvZJyhCu249GsxWQbsNS18GcPJLHfqBqJO6GiAwmZZw
         QA72jI3+G/WO0EK8KDicn8IvA/hdjL7E4pF3Y8PHXdmvzXS6xioipEwsdCNN+wnYGyE6
         iKGw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=kKDzAqBL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id c144si910wme.2.2020.10.05.06.33.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 06:33:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4C4hPW65vTzxnS;
	Mon,  5 Oct 2020 15:33:19 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 5 Oct 2020
 15:33:19 +0200
Subject: Re: [RFC PATCH] inmates: x86: add cache access time test
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jan Kiszka
	<jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Wolfgang Mauerer <wolfgang.mauerer@oth-regensburg.de>
References: <20201002235640.196730-1-ralf.ramsauer@oth-regensburg.de>
 <2b5258fb-ff56-c74d-08c8-2cbd22c8478f@siemens.com>
 <938c741d-ca30-a960-5cbb-ebf1d4b3f4a4@oth-regensburg.de>
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
Message-ID: <536f0af0-f82d-a5a7-4d2f-8a7a73537c04@oth-regensburg.de>
Date: Mon, 5 Oct 2020 15:33:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <938c741d-ca30-a960-5cbb-ebf1d4b3f4a4@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=kKDzAqBL;
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



On 04/10/2020 22:16, Ralf Ramsauer wrote:
> On 10/4/20 8:38 PM, Jan Kiszka wrote:
>> On 03.10.20 01:56, Ralf Ramsauer wrote:
>>> On x86_64 systems, this test inmate measures the time that is required
>>> to read a value from main memory. Via rdtsc, it measures the CPU cycles
>>> that are required for the access. Acces can either happen cached, or
>>> uncached. In case of uncached access, the cache line will be flushed
>>> before access.
>>>
>>> This tool repeats the measurement for 10e6 times, and outputs the
>>> average cycles that were required for the access. Before accessing the
>>> actual measurement, a dummy test is used to determine the average
>>> overhead of one single measurement.
>>>
>>> And that's pretty useful, because this tool gives a lot of insights of
>>> differences between the root and the non-root cell: With tiny effort, we
>>> can also run it on Linux.
>>>
>>> If the 'overhead' time differs between root and non-root cell, this can
>>> be an indicator that there might be some timing or speed differences
>>> between the root and non-root cell.
>>>
>>> If the 'uncached' or 'cached' average time differs between the non-root
>>> and root cell, it's an indicator that both might have different hardware
>>> configurations / setups.
>>>
>>> The host tool can be compiled with:
>>> $ gcc -Os -Wall -Wextra -fno-stack-protector -mno-red-zone -o cache-timing ./inmates/tests/x86/cache-timings-host.c
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>>
>>> Hi Jan,
>>>
>>> what do you think about a test inmate like this one? It's still a RFC patch, as
>>> I'm not sure if the measurement setup is correct. Especially I might have too
>>> much fences.
>>>
>>> This test could be extended to run permanently and show the results of the last
>>> 1e3, 1e5 and 1e6 runs. Having this, this tool could be used to monitor
>>> influences of the root cell on the non-root cell's caches.
>>
>> Such benchmarks aren't bad. However, the current form does not qualify
>> for the test folder yet IMHO: no functional test, no easy evaluation of
>> benchmark results in order to generate a pass/fail criteria.
> 
> Ack, will move it to demos/. Before posting a v2: Did you have the
> chance to look at the usage of the fences? I'm pretty sure that I might
> have messed up something.
> 
>>
>>>
>>>
>>> Aaand btw: On a Xeon Gold 5118, we have following values on Linux resp. in the
>>> non-root cell:
>>>
>>> Linux:
>>> $ ./cache-timing
>>> Measurement rounds: 10000000
>>> Determining measurement overhead...
>>>   -> Average measurement overhead: 37 cycles
>>> Measuring uncached memory access...
>>>   -> Average uncached memory access: 222 cycles
>>> Measuring cached memory access...
>>>   -> Average cached memory access: 9 cycles
>>>
>>
>> Linux native or Linux in Jailhouse?
>>
>>> Non-Root:
>>> Cell "apic-demo" can be loaded
>>> Started cell "apic-demo"
>>> CPU 3 received SIPI, vector 100
>>> Measurement rounds: 10000000
>>> Determining measurement overhead...
>>>   -> Average measurement overhead: 82 cycles
>>> Measuring uncached memory access...
>>>   -> Average uncached memory access: 247 cycles
>>> Measuring cached memory access...
>>>   -> Average cached memory access: 19 cycles
>>
>> How does this compare to Linux in Jailhouse (if the above was native)?
> 
> Ok, the following table shows the three numbers for
> overhead / uncached / cached:
> 
> Measurement            | OH |  U$ | $
> -----------------------+----+-----+-----
> Linux native           | 37 | 222 |  9
> Linux root             | 37 | 226 |  9
> Linux non-root         | 37 | 215 |  9
> libinmate non-root [1] | 82 | 266 | 19
> libinmate non-root [2] | 36 | 217 |  8

Okay, fasten seatbelts, here's another one:

$ jh cell create my-cell
$ jh cell load my-cell apic-demo.bin
$ jh cell start my-cell
[snip]
Timer fired, jitter:    728 ns, min:    655 ns, max:    899 ns

And that one:
$ jh cell linux my-cell [...]
$ jh cell load my-cell apic-demo.bin
$ jh cell start my-cell
[snip]
Timer fired, jitter:    332 ns, min:    267 ns, max:    461 ns

Wow.

  Ralf

> 
> I get the numbers of [1], if I load cache-timings.bin to a fresh created
> cell, IOW:
> 
> $ jh cell create my-cell
> $ jh cell load my-cell cache-timings.bin
> $ jh cell start my-cell
> 
> Those numbers can be reproduced if I reload the cell (i.e., w/o
> destroying it). But in that very same cell, I will get the numbers of
> [2], if I load/start Linux first and THEN reload the cell with
> cache-timings.bin (w/o destroyment in between). IOW:
> 
> $ jh cell load linux my-cell ...
> $ jh cell start my-cell
> $ jh cell load my-cell cache-timings.bin
> $ jh cell start my-cell
> 
> Interesting. This means that Linux must have left some configuration
> artefacts. Still unclear what exactly.
> 
>>
>>>
>>> Cached Access on Linux is 2x faster than in the non-root cell - if my test is
>>> correct. This can - probably - explained by different cache configurations.
>>> Uncached access happens at almost the same speed.
>>>
>>> But do you have an explanation why the overhead measurement is more then 2x
>>> faster on Linux than in the non-root cell?
>>>
>>
>> Not yet, but I need the full picture first.
> 
> Hope the numbers above help.
> 
> Thanks!
>   Ralf
> 
>>
>> Jan
>>
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/536f0af0-f82d-a5a7-4d2f-8a7a73537c04%40oth-regensburg.de.
