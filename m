Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBU6C5T5QKGQE6ODTSNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A452836AB
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 15:36:20 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id j1sf3424418edv.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 06:36:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601904980; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ngcl0bMCyxx0IdD0WKIAfNKbQv1lEO9taPDNiUoJZda8a1CPUBqARAlL3YhEXGYrTd
         mnixqS0bEUHoVNbuqwGNKmmXsQtUMZ0LjLHiSn2gyVriUxKqfTEvxlE8gNEck8OpZNh5
         rFLqHNd8SJEK1PFcv8FVZ+GvMmA1NYqRJ3CxIg/vsrFMgYi0iCx3C7sSXlqhJdNvL9fe
         HRb3kasfAx9LHPjRhswmfJrZT9yqDsK9gDrHuH7xfe/9yuCxcbLqlY409jQgdQWb3cMJ
         3eAUZZc1DqVPc+CVYIXYjERdXDLqiInaBObcQ46YQXscEOIOR6rWTx/wf9suRegevdZu
         dUXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=jkHifZwQgKYb5kkei0G3+d4FHU7JcjOS16deRN5TwgQ=;
        b=P/63ocaKpQHh5HNmPNg1flmxVgNpGMPKW0OIpduDDBxcavdFSacpf+C8HIIF1vsMhg
         1IPjLX9TWqEAf8k6ehtxLPaT8Wpp8AwhVrLiS/NdJ45b3MCBCtHd3y6McKX21wp3fEJH
         Fvevrwh8PauDNvViZGoEYPDSfKd1WRBolmMylNZwlD4YofHvUG9+uybYsolG1J65qbPP
         vamllkbnQ7DCX38Q5EgUZSrd1OG+HjrZn6kNN2tx/uL6Fel6A28SzmYz89iVqHkfLJYY
         2QtOnQIUzPUPphPO4iQLyGA25lfCDL6ZsTboF5W0928Z53LZR6YCWrGJPSr9rytaXVp4
         30hw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jkHifZwQgKYb5kkei0G3+d4FHU7JcjOS16deRN5TwgQ=;
        b=Uv8MHC7fXYd6LTMG8I7nlPq2b6gMLY8Gc0olnnnuANM4sQAtRC3odGQBcwiMCa26EQ
         YgBQ567L3NyJerGncrWkS+acmDngJXx48YsdeE8rQt2bRCyKlrja7rikw7mKx4h4CKQ+
         lBm0Ldw+m+nz0oJ+jSJBSTfbLZ8/915DI3cGlxEguZ2ws8G1rnvad1ZbZ3r3qaid8YTV
         w+UUs++wrhAz9v9bsPHORulSJiv0BrUqEozfr08INSyw0mqN1e2kRaKgTGuZ34wHEzKb
         otvsnjjOk+qIKN9E/CigpTAFBsk2D0pHvTwYHmz7YnX7XkjsPccqQ4jNKzcAAc5U2fbY
         vYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jkHifZwQgKYb5kkei0G3+d4FHU7JcjOS16deRN5TwgQ=;
        b=RD9adV6iawrj2qU+JWawmsqJLH78kxKMGJmY3dImwJEtR2ccUrp/tYW/T7DxkXvoAo
         AzFAJ36mCxnRawwKdjkelL5StzQUukUGjALNO8C0m+MXO1Gu2UzumAYXn4CHuVzvpssC
         q8Cq6/gYL/LezsTWJoSajC4ETBIKvvYpjlZy7XLN1jwKgdZCPJrs/CQ0PRtqjNbFm84r
         NKDz9zQLMTJ5qJkQVK/+5eifa9bco7raM35P7qjlH0aABZGqLfWQjprfCxzE78CgYLB8
         cRCatAPLGbRm7XKosIyucRoTUip5IwkXpi0C9MG6P3UgVPelLebzfhlIJlqPZBZAVFUj
         WDJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532LsB29iwqp70D405T/mb0q6S+ANdxbIFn3enbwj7oXxvlbWEND
	oVx1jsOpp1AJGZMKzg8CFH0=
X-Google-Smtp-Source: ABdhPJyoub4Y6gnqghTIy3/SEPSzZBE5PuMoHTN09ArmDHUQEKVaNpIjUruCbb2gNU8fKna/LdkgAQ==
X-Received: by 2002:aa7:c504:: with SMTP id o4mr17804421edq.82.1601904979982;
        Mon, 05 Oct 2020 06:36:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d0c8:: with SMTP id bq8ls4311773ejb.3.gmail; Mon, 05
 Oct 2020 06:36:18 -0700 (PDT)
X-Received: by 2002:a17:906:3056:: with SMTP id d22mr15617528ejd.495.1601904978332;
        Mon, 05 Oct 2020 06:36:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601904978; cv=none;
        d=google.com; s=arc-20160816;
        b=Y4xJpVFMgO6RBcQbBZmSrhu2EQWUg0RHHAEs83HXaZ90yCkFA2dKoXfH+BojlssVAY
         acqpBViO9oYCz0zQuC4nWK2zPJH3vhsupPyUC+O2fBhddyD84qIOaU/GIrgWYnSSanxB
         s1yknm066vZnLxtxbiRm8iNsxr+pQpJASX7Em3L67TKVZhmqTg2Q7aUdWarqUSTNjsOG
         IWIYlDJA5Z7GQDaiIAPy5Yk/xK/0UJ0j3EUhGH14leKVVJfvTXeYWf/xlCtLUpCG2zMW
         gbbdiwsqgxEUsF6BTLoqbOE3Oa+OvhhOLjvTPtmeQiZzUBX6rH6UsG61SnsFskvEWAg1
         0L9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=mVMDopyqHKnNveyQOFFhXAOCTUCjBLqJs0l79SlxqH0=;
        b=rJQAxa6dyeu13+l3nBkf4RsrbuBrrpRHrEeWr41xZffpEfAjJevf5HYYR+AK7bOLrg
         GP53gPBIs2unXDzmza0iKNI+idbIY7dgGzsDRnuNjLzfZciWuCbAQdtXN2MZIPFrC2YL
         0vm08BniXM2VZuzFJuuzJ8WTp3dj8MB1JebxoyEA5GJtAHoHZMRMNN/298eZHjYUikuo
         rKPtIzn3Qc8IXAy+yfPo9zId4HqL/Aiqa3JipiX0gCH1erJi0zA4xMJP1sJsm9ix4Ox6
         vLmIOkYeBIQiVo9q1HAPeSz+PogNtVHqhL1G92bjbb41Ph2P9bxrytfohB0YPKaUE16c
         YVvg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id v18si180616edx.4.2020.10.05.06.36.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 06:36:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 095DaHG3007274
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Oct 2020 15:36:18 +0200
Received: from [167.87.39.163] ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 095DaH88021103;
	Mon, 5 Oct 2020 15:36:17 +0200
Subject: Re: [RFC PATCH] inmates: x86: add cache access time test
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Wolfgang Mauerer <wolfgang.mauerer@oth-regensburg.de>
References: <20201002235640.196730-1-ralf.ramsauer@oth-regensburg.de>
 <2b5258fb-ff56-c74d-08c8-2cbd22c8478f@siemens.com>
 <938c741d-ca30-a960-5cbb-ebf1d4b3f4a4@oth-regensburg.de>
 <536f0af0-f82d-a5a7-4d2f-8a7a73537c04@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <afea514c-53ea-9b2a-883a-a077f50a6711@siemens.com>
Date: Mon, 5 Oct 2020 15:36:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <536f0af0-f82d-a5a7-4d2f-8a7a73537c04@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 05.10.20 15:33, Ralf Ramsauer wrote:
> 
> 
> On 04/10/2020 22:16, Ralf Ramsauer wrote:
>> On 10/4/20 8:38 PM, Jan Kiszka wrote:
>>> On 03.10.20 01:56, Ralf Ramsauer wrote:
>>>> On x86_64 systems, this test inmate measures the time that is required
>>>> to read a value from main memory. Via rdtsc, it measures the CPU cycles
>>>> that are required for the access. Acces can either happen cached, or
>>>> uncached. In case of uncached access, the cache line will be flushed
>>>> before access.
>>>>
>>>> This tool repeats the measurement for 10e6 times, and outputs the
>>>> average cycles that were required for the access. Before accessing the
>>>> actual measurement, a dummy test is used to determine the average
>>>> overhead of one single measurement.
>>>>
>>>> And that's pretty useful, because this tool gives a lot of insights of
>>>> differences between the root and the non-root cell: With tiny effort, we
>>>> can also run it on Linux.
>>>>
>>>> If the 'overhead' time differs between root and non-root cell, this can
>>>> be an indicator that there might be some timing or speed differences
>>>> between the root and non-root cell.
>>>>
>>>> If the 'uncached' or 'cached' average time differs between the non-root
>>>> and root cell, it's an indicator that both might have different hardware
>>>> configurations / setups.
>>>>
>>>> The host tool can be compiled with:
>>>> $ gcc -Os -Wall -Wextra -fno-stack-protector -mno-red-zone -o cache-timing ./inmates/tests/x86/cache-timings-host.c
>>>>
>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>> ---
>>>>
>>>> Hi Jan,
>>>>
>>>> what do you think about a test inmate like this one? It's still a RFC patch, as
>>>> I'm not sure if the measurement setup is correct. Especially I might have too
>>>> much fences.
>>>>
>>>> This test could be extended to run permanently and show the results of the last
>>>> 1e3, 1e5 and 1e6 runs. Having this, this tool could be used to monitor
>>>> influences of the root cell on the non-root cell's caches.
>>>
>>> Such benchmarks aren't bad. However, the current form does not qualify
>>> for the test folder yet IMHO: no functional test, no easy evaluation of
>>> benchmark results in order to generate a pass/fail criteria.
>>
>> Ack, will move it to demos/. Before posting a v2: Did you have the
>> chance to look at the usage of the fences? I'm pretty sure that I might
>> have messed up something.
>>
>>>
>>>>
>>>>
>>>> Aaand btw: On a Xeon Gold 5118, we have following values on Linux resp. in the
>>>> non-root cell:
>>>>
>>>> Linux:
>>>> $ ./cache-timing
>>>> Measurement rounds: 10000000
>>>> Determining measurement overhead...
>>>>   -> Average measurement overhead: 37 cycles
>>>> Measuring uncached memory access...
>>>>   -> Average uncached memory access: 222 cycles
>>>> Measuring cached memory access...
>>>>   -> Average cached memory access: 9 cycles
>>>>
>>>
>>> Linux native or Linux in Jailhouse?
>>>
>>>> Non-Root:
>>>> Cell "apic-demo" can be loaded
>>>> Started cell "apic-demo"
>>>> CPU 3 received SIPI, vector 100
>>>> Measurement rounds: 10000000
>>>> Determining measurement overhead...
>>>>   -> Average measurement overhead: 82 cycles
>>>> Measuring uncached memory access...
>>>>   -> Average uncached memory access: 247 cycles
>>>> Measuring cached memory access...
>>>>   -> Average cached memory access: 19 cycles
>>>
>>> How does this compare to Linux in Jailhouse (if the above was native)?
>>
>> Ok, the following table shows the three numbers for
>> overhead / uncached / cached:
>>
>> Measurement            | OH |  U$ | $
>> -----------------------+----+-----+-----
>> Linux native           | 37 | 222 |  9
>> Linux root             | 37 | 226 |  9
>> Linux non-root         | 37 | 215 |  9
>> libinmate non-root [1] | 82 | 266 | 19
>> libinmate non-root [2] | 36 | 217 |  8
> 
> Okay, fasten seatbelts, here's another one:
> 
> $ jh cell create my-cell
> $ jh cell load my-cell apic-demo.bin
> $ jh cell start my-cell
> [snip]
> Timer fired, jitter:    728 ns, min:    655 ns, max:    899 ns
> 
> And that one:
> $ jh cell linux my-cell [...]
> $ jh cell load my-cell apic-demo.bin
> $ jh cell start my-cell
> [snip]
> Timer fired, jitter:    332 ns, min:    267 ns, max:    461 ns
> 
> Wow.

Power management? We eventually need to look into those nasty details...

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/afea514c-53ea-9b2a-883a-a077f50a6711%40siemens.com.
