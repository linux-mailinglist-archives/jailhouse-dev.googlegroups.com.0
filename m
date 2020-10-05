Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB6GU5T5QKGQE2US7LUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C5B28376C
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 16:15:21 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id l17sf4033715wrw.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 07:15:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601907321; cv=pass;
        d=google.com; s=arc-20160816;
        b=VqWg1s8S3v5A+xTKuATvljILpkHkNmjOC32lNajXRbxVEtb2gIUTrPAudJttkowrmk
         1Qvyb6U7VYyd2uI31S2K/GpQ1fgBWHGT3hxbzAQi6Zqn2OqFJoNrmSXdYtJ2HBXXKodO
         gkubPHCYWqVuAQGv9soMlck895qeKHm7Ousg8qoF+DvSyjSAzi4H7yeMTwtzJOYharSt
         nloZIvI45JMrsc62V5dNRF5F3kNJyMeO8uz3pVuwS0ncm4UjEeUDFirLyIKKw/lORWnW
         /y5TJLpmBA4H8RHhTC7h9jtbWjBUyS8nDdbySm4UTRo2fkFzPMsEL0WzCAFCEi6aJVV3
         Rruw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=XENZrmk3zBMGXDBimPPu0YEoqo+qgejK4/J5gjDBvrE=;
        b=dlRa6Nlz4MzHUkLLSIDFuzet1ltVxfBAJJDt2WF4n9gyx3QLkcutCieHltUnKGDyQ8
         0iWCiFPZVU6wW1H7Mvrr4MV/uyyfXk+sPddzbzEZJ+Lvml8Zqpq8bOS4zA/DxnV8ZVsF
         IHnCOyOJM4Fu4Vgj3Al9xbly4EtAm3u8JIyMZ13tgczWV35QSsLUparuxbhTF2oaBEji
         lFo6rCzH5jtt5Zt4AYT+9fHJau8e2Odhi3GgFVIORJv6ajfb16H9us71Odu9vy0j3g4X
         3mJ28T6JSU1Q6SCyiljP9dWnbqrYfPaZxGOgWMTBA4C48KFBfl9DgKjYw7wXMSa4YZvl
         02Rw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Td32m+Hh;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XENZrmk3zBMGXDBimPPu0YEoqo+qgejK4/J5gjDBvrE=;
        b=pT98QJ2sh6JxLoP/xbMzsUJsoi2e5QP/bfPUXn87chg1c8B8Vlxq9e1e2s62/qldJZ
         ms7p/LAJTOO7P89NoFMy32c7axmn1y9Pq8eG1y/2s/7HCufr9I6jeVJ3ct8rW/XN3Gza
         wWdzfl9CnSxFq5PnE7tPvw1r/K1jz6tNH48XWkiFRwCcV6nOPj/NhZNRHLyf2lJxMT7U
         IyKpNTQsT0F+ftFcrnHT+S8eYfTSu3M9p37zEZTJKFnsKi9cgknRcqLMid7NgKVsz+Yc
         fgPI7fGNes0g8VCkG/1IvJmv/pVSD7TxSLFtNhpx2qS3aRWVwY/iBexPTCPiOw8BVftH
         xkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XENZrmk3zBMGXDBimPPu0YEoqo+qgejK4/J5gjDBvrE=;
        b=s4Z/jqeBJWsuSUa8CNMrR4woh61BxROMWBRwCZX7Qm8eg74cTWM56OEge96fEob0dx
         eAoWSaScDUvDbdBI2899V4herzfkMt7GbX2LJ5xD94N7tTjv5s22bso9Js2WxiTswrin
         lTr/OiOPVF72CS05Ron1ASA8W5KMsnHyl3jDGIOgXzK6Gd3DXnXHYoCoMsILjEFVq543
         XrJtncl94gnq95wVfYDsynKtRxk3c3SNtx0Oi5fKvuU5lzNNdMCpI4rmDWTPPpfhB3qW
         IogtzidfQqXlpIz3+F+Ijlpo7P15wY4sneWMgBGB/Yk3z1XeAcjNA62tpvo/N/B/LtLD
         dZEg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530eyJlcOoTD0B5QkEcDQfS3o3zxeq3rtkCIR4dSNEDJQ1gF/o6P
	ESbFMBGp03q7ddJIab+YYLg=
X-Google-Smtp-Source: ABdhPJy0ThvAAlPJ5LSi6uBQ78O7dy3jQNhyGgtMGE5cYq6BhHvOdpqvmkfqcipzeem69mxydgaDXg==
X-Received: by 2002:a5d:4151:: with SMTP id c17mr19279363wrq.302.1601907320934;
        Mon, 05 Oct 2020 07:15:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e3c3:: with SMTP id k3ls538491wrm.1.gmail; Mon, 05 Oct
 2020 07:15:19 -0700 (PDT)
X-Received: by 2002:adf:9043:: with SMTP id h61mr18565174wrh.237.1601907319952;
        Mon, 05 Oct 2020 07:15:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601907319; cv=none;
        d=google.com; s=arc-20160816;
        b=JqBqK5UeKeMeJy6aXMkF/qd83/TYYt56VVrXquooFvpWZ2vO/y1ocmHIAzzedr0GUh
         QH7HNWWZVyxc4Mxj6Nl4xY+d+YNG6Nodk1cVS5S4eajqWlQj1X/7gAT5b0velAkJyIBO
         WCh5L0ftQ6ZzF+E6d+2Hb4+7lUo1pYPU9DaUQqZVQa4tIU80niVj1nlT4GCQkIpzvp6W
         yFmg3kFQQzbmJ38+UO/fQlYWfmBKDaKpV3LbwJ860IZqXJpCyGN9mrCkJ4FaO1mhFkGf
         00KmUCxU9q+/LNFlYJkBUtHfb3axjgCUbABdFidPejoExD+3x9ueSFcGFp5wIVjS8hio
         /QZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=YVqYXS34NkWRd3qyghvCMl+ArRMFXtNl4iS4S8EMkIk=;
        b=Gt1saFrEH7heLofxDKE9/lktSbbSV+OIQSak2nDn8IkOelOWxDh8nfXXbc9aG4CqmU
         6OkLlPm39ccnUp/OEdxVnTrpT5Eb4WRbslgiTSbg5oKXuDKYr02CH1cN68e8psbRpyvO
         6WnNFXd4sUQutVrtkFqHcH5GShnH2SsHKK3p/WN5hEjZfE55mAVZqJrCH8BH63f/HGVq
         Hp7vRVIN7/EzOOi1c42f8ZExiBiWxnBfYxSu366BC+RzUynS3ZXNyp5ZN/cqjrwhGwSS
         kh9HgFQDHBkvB6fOJDbdHCNTRAxuT9HU2cSz0guc7Uh/x/ZjjHtZ+u5wN/ayJrTG+slp
         QRUw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Td32m+Hh;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id 11si125078wmg.0.2020.10.05.07.15.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 07:15:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4C4jKz47MbzxpN;
	Mon,  5 Oct 2020 16:15:19 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 5 Oct 2020
 16:15:19 +0200
Subject: Re: [EXT] Re: [RFC PATCH] inmates: x86: add cache access time test
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Wolfgang Mauerer <wolfgang.mauerer@oth-regensburg.de>
References: <20201002235640.196730-1-ralf.ramsauer@oth-regensburg.de>
 <2b5258fb-ff56-c74d-08c8-2cbd22c8478f@siemens.com>
 <938c741d-ca30-a960-5cbb-ebf1d4b3f4a4@oth-regensburg.de>
 <536f0af0-f82d-a5a7-4d2f-8a7a73537c04@oth-regensburg.de>
 <afea514c-53ea-9b2a-883a-a077f50a6711@siemens.com>
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
Message-ID: <51fcda91-88ca-af58-5d89-4bed2563dd8a@oth-regensburg.de>
Date: Mon, 5 Oct 2020 16:15:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <afea514c-53ea-9b2a-883a-a077f50a6711@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Td32m+Hh;
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



On 05/10/2020 15:36, Jan Kiszka wrote:
> On 05.10.20 15:33, Ralf Ramsauer wrote:
>>
>>
>> On 04/10/2020 22:16, Ralf Ramsauer wrote:
>>> On 10/4/20 8:38 PM, Jan Kiszka wrote:
>>>> On 03.10.20 01:56, Ralf Ramsauer wrote:
>>>>> On x86_64 systems, this test inmate measures the time that is required
>>>>> to read a value from main memory. Via rdtsc, it measures the CPU cycles
>>>>> that are required for the access. Acces can either happen cached, or
>>>>> uncached. In case of uncached access, the cache line will be flushed
>>>>> before access.
>>>>>
>>>>> This tool repeats the measurement for 10e6 times, and outputs the
>>>>> average cycles that were required for the access. Before accessing the
>>>>> actual measurement, a dummy test is used to determine the average
>>>>> overhead of one single measurement.
>>>>>
>>>>> And that's pretty useful, because this tool gives a lot of insights of
>>>>> differences between the root and the non-root cell: With tiny effort, we
>>>>> can also run it on Linux.
>>>>>
>>>>> If the 'overhead' time differs between root and non-root cell, this can
>>>>> be an indicator that there might be some timing or speed differences
>>>>> between the root and non-root cell.
>>>>>
>>>>> If the 'uncached' or 'cached' average time differs between the non-root
>>>>> and root cell, it's an indicator that both might have different hardware
>>>>> configurations / setups.
>>>>>
>>>>> The host tool can be compiled with:
>>>>> $ gcc -Os -Wall -Wextra -fno-stack-protector -mno-red-zone -o cache-timing ./inmates/tests/x86/cache-timings-host.c
>>>>>
>>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>>> ---
>>>>>
>>>>> Hi Jan,
>>>>>
>>>>> what do you think about a test inmate like this one? It's still a RFC patch, as
>>>>> I'm not sure if the measurement setup is correct. Especially I might have too
>>>>> much fences.
>>>>>
>>>>> This test could be extended to run permanently and show the results of the last
>>>>> 1e3, 1e5 and 1e6 runs. Having this, this tool could be used to monitor
>>>>> influences of the root cell on the non-root cell's caches.
>>>>
>>>> Such benchmarks aren't bad. However, the current form does not qualify
>>>> for the test folder yet IMHO: no functional test, no easy evaluation of
>>>> benchmark results in order to generate a pass/fail criteria.
>>>
>>> Ack, will move it to demos/. Before posting a v2: Did you have the
>>> chance to look at the usage of the fences? I'm pretty sure that I might
>>> have messed up something.
>>>
>>>>
>>>>>
>>>>>
>>>>> Aaand btw: On a Xeon Gold 5118, we have following values on Linux resp. in the
>>>>> non-root cell:
>>>>>
>>>>> Linux:
>>>>> $ ./cache-timing
>>>>> Measurement rounds: 10000000
>>>>> Determining measurement overhead...
>>>>>   -> Average measurement overhead: 37 cycles
>>>>> Measuring uncached memory access...
>>>>>   -> Average uncached memory access: 222 cycles
>>>>> Measuring cached memory access...
>>>>>   -> Average cached memory access: 9 cycles
>>>>>
>>>>
>>>> Linux native or Linux in Jailhouse?
>>>>
>>>>> Non-Root:
>>>>> Cell "apic-demo" can be loaded
>>>>> Started cell "apic-demo"
>>>>> CPU 3 received SIPI, vector 100
>>>>> Measurement rounds: 10000000
>>>>> Determining measurement overhead...
>>>>>   -> Average measurement overhead: 82 cycles
>>>>> Measuring uncached memory access...
>>>>>   -> Average uncached memory access: 247 cycles
>>>>> Measuring cached memory access...
>>>>>   -> Average cached memory access: 19 cycles
>>>>
>>>> How does this compare to Linux in Jailhouse (if the above was native)?
>>>
>>> Ok, the following table shows the three numbers for
>>> overhead / uncached / cached:
>>>
>>> Measurement            | OH |  U$ | $
>>> -----------------------+----+-----+-----
>>> Linux native           | 37 | 222 |  9
>>> Linux root             | 37 | 226 |  9
>>> Linux non-root         | 37 | 215 |  9
>>> libinmate non-root [1] | 82 | 266 | 19
>>> libinmate non-root [2] | 36 | 217 |  8
>>
>> Okay, fasten seatbelts, here's another one:
>>
>> $ jh cell create my-cell
>> $ jh cell load my-cell apic-demo.bin
>> $ jh cell start my-cell
>> [snip]
>> Timer fired, jitter:    728 ns, min:    655 ns, max:    899 ns
>>
>> And that one:
>> $ jh cell linux my-cell [...]
>> $ jh cell load my-cell apic-demo.bin
>> $ jh cell start my-cell
>> [snip]
>> Timer fired, jitter:    332 ns, min:    267 ns, max:    461 ns
>>
>> Wow.
> 
> Power management? We eventually need to look into those nasty details...

Yes, very likely. I can can confirm that it's probably power management.
It looks like the following happens: the CPU gets throttled by
root-cell's Linux when offlining the CPU.

When we later run apic-demo on that CPU, we run it on a throttled CPU.
But if we load Linux on the very same cell before apic-demo, Linux will
take care of power management and bring the CPU up again.

Per default, my non-root Linux uses the performance cpufreq governor and
configures everthing to max speed.

To confirm my assumption: If I set the powersave governor before
reloading the cell with apic-demo, I get worse latencies again.

So this issue must definitely be somehow related to power management.

  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/51fcda91-88ca-af58-5d89-4bed2563dd8a%40oth-regensburg.de.
