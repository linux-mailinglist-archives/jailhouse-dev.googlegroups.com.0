Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJNQ5X5QKGQEQNFDWGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EDD283D4B
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 19:30:13 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id u15sf4313853wrn.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 10:30:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601919013; cv=pass;
        d=google.com; s=arc-20160816;
        b=L4lG8HJI1XD1YKFpaVPBYXjQugJD7MMCuq4GNqJ07oXGIU5AmW4jhtpdzlIhWxiWj6
         Y8xer/3FZMfkhXjyYLApUv7jLbQxTjJWgD+F1L0WwpdRo40/z3R7NNIS09NdgBrwgxlm
         IRei7WLafId+9XWm6jJnKbhn2tAuT1UpP3dshEJ8hLqqkAuvK1t+N/Xu5/2kvfJ1PqX+
         bWT0O47aNSpr5Ulz+vxnwHb//xOWHgunrq5Z4XrbCI81UrvU+vNDt8AGK7afheES8ttH
         BITrWGP6+zFIoD9q+B4u5EqluWMTxxUnja2MrkPImrjUOFkR5FoPOm/HaeeaywNQINBI
         +Vgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=/0zFUUwbisZLfxeUewB3K13kVytw2V8ztvMPgFT0Ais=;
        b=azB1yJTaOU0u9nvXehB9emGkcrWFM7OD9vsZNnsSJPv7FpqRaNKs3ZPA8s3oD/ostG
         rX28CvCXmMviWWzqkBEFmnkYlybvlZLnW9M5y9YSOTB5mzgSoPyJMO2sarH3LXiyrp1d
         0GqCjiCHi5qhXJgI1lExtMFlnVqvEqak1dGANKiyt9kidvqd8sQsZxKx2ZXi1l/r60Kq
         XSKg0XjA7Vval5v4ocsaKadg2p+RbS/t21Qj9c0oF9h3D/zY+8A7TJpvNY4f1H8Hpi/q
         G8mAKAO5n6S5pQvru03sNf5LVjbFs6bytSVKgwFXSZuONBm91jJVlvo34Ld9QCg6SKd9
         nPcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=m1wc6EXJ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/0zFUUwbisZLfxeUewB3K13kVytw2V8ztvMPgFT0Ais=;
        b=k7Dpl4kpcj2Cj0aQPtTq6L2fpm/8LMbYsW7av+OjUzB7zsvWRPD2D6OEQNN6U3pHkO
         w+lKvFAND8efrdoxMmaIyf8hOD4OEXz0WhxM3pPoTFUyGozRhBQ86pXYQfi1b5Yb4taS
         ZwIzG58/HY7d09ruDTeFg9FdhAUjN3WKeRqZ7+A/RYQPJqim5KtuwVRhnXjMpPPFMTEn
         auIG37GtKT+I3eyQJQ/c1nspYEigv1dzZNfo9Hfew7KWgkPKBOIKPIK4dIPkopFe9C/e
         AlObya/dFk7mDVEzc08gtkKEnJ0AllDnIwccXM1EIVFr1yMZ80zmnErFS7u2L0csmJeZ
         S0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/0zFUUwbisZLfxeUewB3K13kVytw2V8ztvMPgFT0Ais=;
        b=O375HwkBGLJ9Hdv3bPNs4396qytFHVHvE/Lq56IBlMKAWJigJaR0ak94DCUCpbrhMW
         RIFh3ShuTnZMoaCa08jYVMlsJTaT2LzRWRu3ZzmoONgFFIsc6wAdDAVyVn46rI5Gtr0+
         /opi5WnTKXXlpSbrM9ssaE/se4AmTrUCOvkvZ3ubaLyCqNTsEHyzkBcwUHVotAqlGblo
         +BIETjuNRUlWZ5fEg9Y4ddCPxJ+KBNcZqF8WvU+2mirJp/Dek67XI+K5yeJB230PutIP
         3GvMrOm1HhUi7QbaCkNobVMGvGoF/U5/jQ8zN8NC3VgY/75HQ3ZTwmu4vofSRvsLlKZN
         f1Og==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530F/S3Xar3ysO2VJvHzElU/jKbG4gTcVvsgz4nm/IjG1UDGNwTT
	cDe2trRDMkwiUOeRMJN3ivM=
X-Google-Smtp-Source: ABdhPJzVFX5QKqmp6vb6KRTZfKVCeQeyG8bjDck+XRpl9GjjZDk7tTcTdf+Wx9KJIGMR7gEpZvYCvA==
X-Received: by 2002:a7b:cf04:: with SMTP id l4mr454219wmg.137.1601919013449;
        Mon, 05 Oct 2020 10:30:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:428e:: with SMTP id k14ls1308747wrq.0.gmail; Mon, 05 Oct
 2020 10:30:12 -0700 (PDT)
X-Received: by 2002:adf:f5c1:: with SMTP id k1mr476901wrp.271.1601919012309;
        Mon, 05 Oct 2020 10:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601919012; cv=none;
        d=google.com; s=arc-20160816;
        b=ajVJxd7Uk1Ch20nG1IxKXUbtZjky9nSI26xGfHJS7vs8VOq1ZdBhKgHSTkmltUSvvJ
         LlDVR0WXtb+ezv49cjOeav7pe8y8CI/YAlNkdoP4CooRp+YmLFU5B7MruLZ59mvST65E
         UFHHIUlmbvJ+7zqHHB8B9AbwsxYcJm/pDTD1MTFqcrq42dTOyYOtZFts9IWozL6M2KkI
         h7V2gMZGp2vq9+Ai8iake8us1BQpJaQMMcYmBGNG2xwEpQ1w3OeqAH7Frz9zZUuJ0NCy
         SL9KGVAL4s7wb22k1P2RZmvCGwceO9p8buGwe6IDT3N9+iISwRXDLOYkLhbJ/Y9gF5br
         Z6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=k6H4OudjK2JAMvmK8+MvvLk24XbSQURR7PW+RIONVWQ=;
        b=cRMggWOjVEGeOebBSzRcinaGgMlIxJfDMuza8Ac3c8gcXllQ4vC+xKwRLiq0K6vIq/
         ZS3lzLbFpZHe0yBb0s0z22HsL36dkRedI6M3lnTOOvRMTEXbr1iE7NAJNywg7EDO3Bsu
         eSXc6XtlXXQ4KBYz8AdTasZOPwTTxmcPPTjrELNKhn1pM9e1RKW77DPv0TTeT/j0HJmr
         h30hdUBMl6XYQ2zYBM+0nlVkrPtuOKLv3MEt7OOLEBlvjQ6I1LomoevjAiy6N8rVfwTY
         5InKbZ0SKFsvAUrxLHmMGd25+p/HAnOoTJEF/u7XfeAXMA2UZfVgennp5vyfEjFhWDoU
         XcrQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=m1wc6EXJ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id z62si7264wmb.0.2020.10.05.10.30.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 10:30:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4C4nfq5nfMzy18;
	Mon,  5 Oct 2020 19:30:11 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 5 Oct 2020
 19:30:11 +0200
Subject: Re: [EXT] Re: [RFC PATCH] inmates: x86: add cache access time test
To: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, <jailhouse-dev@googlegroups.com>
CC: Wolfgang Mauerer <wolfgang.mauerer@oth-regensburg.de>
References: <20201002235640.196730-1-ralf.ramsauer@oth-regensburg.de>
 <2b5258fb-ff56-c74d-08c8-2cbd22c8478f@siemens.com>
 <938c741d-ca30-a960-5cbb-ebf1d4b3f4a4@oth-regensburg.de>
 <536f0af0-f82d-a5a7-4d2f-8a7a73537c04@oth-regensburg.de>
 <afea514c-53ea-9b2a-883a-a077f50a6711@siemens.com>
 <51fcda91-88ca-af58-5d89-4bed2563dd8a@oth-regensburg.de>
 <d704b7bd-d150-b762-3811-ad0bdc839eef@siemens.com>
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
Message-ID: <4dbc53d4-893c-ae9a-f231-18e790b8901f@oth-regensburg.de>
Date: Mon, 5 Oct 2020 19:30:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d704b7bd-d150-b762-3811-ad0bdc839eef@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=m1wc6EXJ;
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



On 05/10/2020 16:22, Jan Kiszka wrote:
> On 05.10.20 16:15, Ralf Ramsauer wrote:
>>
>>
>> On 05/10/2020 15:36, Jan Kiszka wrote:
>>> On 05.10.20 15:33, Ralf Ramsauer wrote:
>>>>
>>>>
>>>> On 04/10/2020 22:16, Ralf Ramsauer wrote:
>>>>> On 10/4/20 8:38 PM, Jan Kiszka wrote:
>>>>>> On 03.10.20 01:56, Ralf Ramsauer wrote:
>>>>>>> On x86_64 systems, this test inmate measures the time that is required
>>>>>>> to read a value from main memory. Via rdtsc, it measures the CPU cycles
>>>>>>> that are required for the access. Acces can either happen cached, or
>>>>>>> uncached. In case of uncached access, the cache line will be flushed
>>>>>>> before access.
>>>>>>>
>>>>>>> This tool repeats the measurement for 10e6 times, and outputs the
>>>>>>> average cycles that were required for the access. Before accessing the
>>>>>>> actual measurement, a dummy test is used to determine the average
>>>>>>> overhead of one single measurement.
>>>>>>>
>>>>>>> And that's pretty useful, because this tool gives a lot of insights of
>>>>>>> differences between the root and the non-root cell: With tiny effort, we
>>>>>>> can also run it on Linux.
>>>>>>>
>>>>>>> If the 'overhead' time differs between root and non-root cell, this can
>>>>>>> be an indicator that there might be some timing or speed differences
>>>>>>> between the root and non-root cell.
>>>>>>>
>>>>>>> If the 'uncached' or 'cached' average time differs between the non-root
>>>>>>> and root cell, it's an indicator that both might have different hardware
>>>>>>> configurations / setups.
>>>>>>>
>>>>>>> The host tool can be compiled with:
>>>>>>> $ gcc -Os -Wall -Wextra -fno-stack-protector -mno-red-zone -o cache-timing ./inmates/tests/x86/cache-timings-host.c
>>>>>>>
>>>>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>>>>> ---
>>>>>>>
>>>>>>> Hi Jan,
>>>>>>>
>>>>>>> what do you think about a test inmate like this one? It's still a RFC patch, as
>>>>>>> I'm not sure if the measurement setup is correct. Especially I might have too
>>>>>>> much fences.
>>>>>>>
>>>>>>> This test could be extended to run permanently and show the results of the last
>>>>>>> 1e3, 1e5 and 1e6 runs. Having this, this tool could be used to monitor
>>>>>>> influences of the root cell on the non-root cell's caches.
>>>>>>
>>>>>> Such benchmarks aren't bad. However, the current form does not qualify
>>>>>> for the test folder yet IMHO: no functional test, no easy evaluation of
>>>>>> benchmark results in order to generate a pass/fail criteria.
>>>>>
>>>>> Ack, will move it to demos/. Before posting a v2: Did you have the
>>>>> chance to look at the usage of the fences? I'm pretty sure that I might
>>>>> have messed up something.
>>>>>
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Aaand btw: On a Xeon Gold 5118, we have following values on Linux resp. in the
>>>>>>> non-root cell:
>>>>>>>
>>>>>>> Linux:
>>>>>>> $ ./cache-timing
>>>>>>> Measurement rounds: 10000000
>>>>>>> Determining measurement overhead...
>>>>>>>   -> Average measurement overhead: 37 cycles
>>>>>>> Measuring uncached memory access...
>>>>>>>   -> Average uncached memory access: 222 cycles
>>>>>>> Measuring cached memory access...
>>>>>>>   -> Average cached memory access: 9 cycles
>>>>>>>
>>>>>>
>>>>>> Linux native or Linux in Jailhouse?
>>>>>>
>>>>>>> Non-Root:
>>>>>>> Cell "apic-demo" can be loaded
>>>>>>> Started cell "apic-demo"
>>>>>>> CPU 3 received SIPI, vector 100
>>>>>>> Measurement rounds: 10000000
>>>>>>> Determining measurement overhead...
>>>>>>>   -> Average measurement overhead: 82 cycles
>>>>>>> Measuring uncached memory access...
>>>>>>>   -> Average uncached memory access: 247 cycles
>>>>>>> Measuring cached memory access...
>>>>>>>   -> Average cached memory access: 19 cycles
>>>>>>
>>>>>> How does this compare to Linux in Jailhouse (if the above was native)?
>>>>>
>>>>> Ok, the following table shows the three numbers for
>>>>> overhead / uncached / cached:
>>>>>
>>>>> Measurement            | OH |  U$ | $
>>>>> -----------------------+----+-----+-----
>>>>> Linux native           | 37 | 222 |  9
>>>>> Linux root             | 37 | 226 |  9
>>>>> Linux non-root         | 37 | 215 |  9
>>>>> libinmate non-root [1] | 82 | 266 | 19
>>>>> libinmate non-root [2] | 36 | 217 |  8
>>>>
>>>> Okay, fasten seatbelts, here's another one:
>>>>
>>>> $ jh cell create my-cell
>>>> $ jh cell load my-cell apic-demo.bin
>>>> $ jh cell start my-cell
>>>> [snip]
>>>> Timer fired, jitter:    728 ns, min:    655 ns, max:    899 ns
>>>>
>>>> And that one:
>>>> $ jh cell linux my-cell [...]
>>>> $ jh cell load my-cell apic-demo.bin
>>>> $ jh cell start my-cell
>>>> [snip]
>>>> Timer fired, jitter:    332 ns, min:    267 ns, max:    461 ns
>>>>
>>>> Wow.
>>>
>>> Power management? We eventually need to look into those nasty details...
>>
>> Yes, very likely. I can can confirm that it's probably power management.
>> It looks like the following happens: the CPU gets throttled by
>> root-cell's Linux when offlining the CPU.
>>
>> When we later run apic-demo on that CPU, we run it on a throttled CPU.
>> But if we load Linux on the very same cell before apic-demo, Linux will
>> take care of power management and bring the CPU up again.
>>
>> Per default, my non-root Linux uses the performance cpufreq governor and
>> configures everthing to max speed.
>>
>> To confirm my assumption: If I set the powersave governor before
>> reloading the cell with apic-demo, I get worse latencies again.
>>
>> So this issue must definitely be somehow related to power management.
>>
> 
> This whole topic consists of three aspects at least:
> 
>  - understand what all can be controlled on Intel (and eventually also
>    AMD) CPUs and what cross-code effects it has
>  - model access control in the hypervisor
>  - make use of those tunings in our bare-metal cells
> 
> We can probably pull the last item to the front as it will provide
> direct input to the others.

Just for the records, this is my local hack to get the inmate CPU in the
highest pstate:

diff --git a/inmates/lib/x86/setup.c b/inmates/lib/x86/setup.c
index 807db99e..9c03ca3b 100644
--- a/inmates/lib/x86/setup.c
+++ b/inmates/lib/x86/setup.c
@@ -42,6 +42,10 @@

 #define AUTHENTIC_AMD(n)       (((const u32 *)"AuthenticAMD")[n])

+#define MSR_IA32_PERF_CTRL     0x199
+#define MSR_IA32_MISC_ENABLE   0x1a0
+#define MAX_PSTATE             23
+
 void *stack = (void*)stack_top;

 struct desc_table_reg {
@@ -72,4 +76,9 @@ void arch_init_early(void)
        dtr.limit = sizeof(idt) - 1;
        dtr.base = (unsigned long)&idt;
        asm volatile("lidt %0" : : "m" (dtr));
+
+       u64 perf = read_msr(MSR_IA32_PERF_CTRL);
+       printk("CPU booted with: %llx\n", perf);
+       perf = MAX_PSTATE << 8;
+       write_msr(MSR_IA32_PERF_CTRL, perf);
 }


You can determine MAX_PSTATE with:
$ cat /sys/devices/system/cpu/intel_pstate/num_pstates

in the root-cell.

  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4dbc53d4-893c-ae9a-f231-18e790b8901f%40oth-regensburg.de.
