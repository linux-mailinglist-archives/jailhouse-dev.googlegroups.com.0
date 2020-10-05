Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJOY5T5QKGQEV6XRFII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EA628378F
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 16:22:30 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id l15sf4072966wro.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 07:22:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601907750; cv=pass;
        d=google.com; s=arc-20160816;
        b=jmOuduegA5uvy2qmJjfpwhzy/Z5qtK4Zoqo1wzvqwIoBBpHWZKeNJ6dwjPJkI/KG1R
         QDCIhkIUeX55L6weHFFS3YGXdqEdyJdGRyk0FqpeZlDa1SmRhiXhbzTS5wwZFPbNz1/k
         PukvoHzZNJYmxbqbDFNVcfK7bTgsgM8FPL2WPwJYk+Ysk5UWDWs4CH8IvYyh4gazVuUf
         ymfYJEqiMBARD+Fre15//JYj+Zrh69jWQCbMrVPgiXlM566dpukJ3GD3LAKrJtJZUjOF
         58uZplcWPAJKgRqM12+9eo35D0b2Uv0y/Jn6m9SE2lHM+5+ZnCh6FAyhKuzN47q+oiIy
         bmPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=UbE0+tyyhHWsaf3/CF0Yh99Ario0F0BOA65B68wIv4o=;
        b=UmVt7atg5Yy9O9A/A51CMoIK8R/MpBnL26+t6o35T1/dy9jfqHBZ0Sp20TKWBpXyiC
         4F/nuVok4r/U997pOsQNXioT8NdGkdHKF+lPZPMuwDIHYenSbM7OABi/cRhBlFx1Wh6m
         Ic1W9pPHEgsOu93wIkyGscXOgb6XWFCLY4iIjXcyo1Ohu5LmkqSjCGI9jwK70ClKyiw0
         DTNJ9qHcAvvFeOJxELU8De/h+cbly1ELxhBdY7qp4LQBd3wF3RZ5ik7hb1WQmpf/4pa6
         yrSiioydzMelcutP3CiSv1vrkQ+q1ApCF2UPoWj5aXq4CffYJyIRiRF6GxqaSu44EUsw
         Q5KQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UbE0+tyyhHWsaf3/CF0Yh99Ario0F0BOA65B68wIv4o=;
        b=iPf4NyFJw4JNthqelDhH99T1R4YTzh1QEFey2BymZiwvu3+S0EXHho9UNu/48QMKTp
         xUskRKuXDjevVAPEBisByrqcgFxyS5mtt8GfH01hNFEuCV38Vbt2ssjeDQMv20Kd8VjN
         j4xO7RHhQymg1uFrQth8OBevHB6ngp0Q2RFtdpy+3iSZ4b1douL0mMExwym4VDC8zEhE
         Zqwlq5stiTNzu9Hdy4uHW1jHPckSZ1SADEdwZNj6dsqW3xhj+iIP4FVXTDQCMk9qqE4w
         T4QCDjT4+ZodQNUAo5ShyqOA/NkZFH1hi4njvvlxxBYgGMePe951Xo7uUAna6+3f1Ilb
         9jKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=UbE0+tyyhHWsaf3/CF0Yh99Ario0F0BOA65B68wIv4o=;
        b=c7h6GKiQ28JBEJiIQNHaQUoMRB/HQblZLucqpGqQxiz/DjKorlIUO09UXU7bfMpTk8
         NuOf34M9fjotj+LDVEv/t+0yUtjH5Y6OF52HB/7q53w1CpBvd52yzSlZKiFe0CadXYVx
         wgUuYaXO8XMFG5SHK7jqdRd85RopvagGbLmjiSAzufQyr+57SUWote9X9B/B06n0Efly
         mKwSoDhpSQMvRJkKsz/DRX54wPcy3p2MpcvP5J6ZYXkL6ZGkZAFxorXrHP6xYVxz3FkC
         vu24/WyBEsz96bMvQQCSWmjBoOMWytwEyx4ti3i5g3HNE7cotI2vgwjIWq1iNQBEbxR1
         XsgA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531GSj3FYCm8GmFxnRpq33vGtwW4ESx/50QPQhm0T6M3BEqIq9AT
	Viu/faGDc4s60ppOYIrvpig=
X-Google-Smtp-Source: ABdhPJx5MJuyUck08rNimWLeZ3oRyku4ql48qlhIsD95A+aY+uU8Lsapb1UELttDsAlcXYGqU8WSYA==
X-Received: by 2002:a5d:680b:: with SMTP id w11mr19202554wru.73.1601907750144;
        Mon, 05 Oct 2020 07:22:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e3c3:: with SMTP id k3ls570035wrm.1.gmail; Mon, 05 Oct
 2020 07:22:29 -0700 (PDT)
X-Received: by 2002:adf:fd49:: with SMTP id h9mr8043069wrs.115.1601907748975;
        Mon, 05 Oct 2020 07:22:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601907748; cv=none;
        d=google.com; s=arc-20160816;
        b=AaDyrY8590RArq+D6cP8+nSRd90OMZ0aJy3Izw7atNyDSNVMBxmsJgH7P9bgrImzm3
         WsuoDPTmrysd1ZoL+hdeNoEGlnscuX20TrJq28XrJimmMABrRkrJRCklVApBOZEzmiYI
         Y7XuXSoYH0mKYDLLqSwlpxFJO8muYcQfADARX0UFuoEpB1BhIH7P5Q3PWU2GF1Ipc2wc
         idQ/gJXkdyAE2OthTyv5SjjOQUQBpIk3wBjEHRoubdaHrYa+FXlJKnfZb/OBGiDS3bF5
         ah80/HScIHW5+yyKg7+lx7llrm7uNWZX49IJ8CV6zl0Vzc6yQj+4PQP8Hpab6c1t5frF
         hZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=/+5nKKW+jWiaqeWSpWk7JpUIm+h1IOWaoR3OfdJC+TI=;
        b=yngp6E3IdL4glml2LUrM/R3hDpCiTbzVMc4U2Bc/ctlPNMs09Pz0sFe78pUV3fdYzo
         kwLctVU7BNC6m7GugcjRTJuP3RcYVe2X38OvGSBOtBS2Pbq7PiD4TVV3Wel+pk9O/ASQ
         FhgOPbYgL2CHqGJDvddxZyMykIxQy1rnehd1vjyQN1RX07EjUEcM0jT5ejuHaHmUzOYs
         fEgBYESPIXusWm1oM6/udb4b9L2N6RHUBhTT0AAB4rOe1cUDYgivHu717h0aDMErwIh7
         m1qK26FXFoucLLvCyprRqpiwZIwS7icW/9mI9KiNKM2Y0pLR6Yw6Vh9L1v/W5cGAufOF
         Z7qQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id b80si5221wme.1.2020.10.05.07.22.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 07:22:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 095EMS7D001088
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Oct 2020 16:22:28 +0200
Received: from [167.87.39.163] ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 095EMReO017119;
	Mon, 5 Oct 2020 16:22:28 +0200
Subject: Re: [EXT] Re: [RFC PATCH] inmates: x86: add cache access time test
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Wolfgang Mauerer <wolfgang.mauerer@oth-regensburg.de>
References: <20201002235640.196730-1-ralf.ramsauer@oth-regensburg.de>
 <2b5258fb-ff56-c74d-08c8-2cbd22c8478f@siemens.com>
 <938c741d-ca30-a960-5cbb-ebf1d4b3f4a4@oth-regensburg.de>
 <536f0af0-f82d-a5a7-4d2f-8a7a73537c04@oth-regensburg.de>
 <afea514c-53ea-9b2a-883a-a077f50a6711@siemens.com>
 <51fcda91-88ca-af58-5d89-4bed2563dd8a@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d704b7bd-d150-b762-3811-ad0bdc839eef@siemens.com>
Date: Mon, 5 Oct 2020 16:22:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <51fcda91-88ca-af58-5d89-4bed2563dd8a@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 05.10.20 16:15, Ralf Ramsauer wrote:
> 
> 
> On 05/10/2020 15:36, Jan Kiszka wrote:
>> On 05.10.20 15:33, Ralf Ramsauer wrote:
>>>
>>>
>>> On 04/10/2020 22:16, Ralf Ramsauer wrote:
>>>> On 10/4/20 8:38 PM, Jan Kiszka wrote:
>>>>> On 03.10.20 01:56, Ralf Ramsauer wrote:
>>>>>> On x86_64 systems, this test inmate measures the time that is required
>>>>>> to read a value from main memory. Via rdtsc, it measures the CPU cycles
>>>>>> that are required for the access. Acces can either happen cached, or
>>>>>> uncached. In case of uncached access, the cache line will be flushed
>>>>>> before access.
>>>>>>
>>>>>> This tool repeats the measurement for 10e6 times, and outputs the
>>>>>> average cycles that were required for the access. Before accessing the
>>>>>> actual measurement, a dummy test is used to determine the average
>>>>>> overhead of one single measurement.
>>>>>>
>>>>>> And that's pretty useful, because this tool gives a lot of insights of
>>>>>> differences between the root and the non-root cell: With tiny effort, we
>>>>>> can also run it on Linux.
>>>>>>
>>>>>> If the 'overhead' time differs between root and non-root cell, this can
>>>>>> be an indicator that there might be some timing or speed differences
>>>>>> between the root and non-root cell.
>>>>>>
>>>>>> If the 'uncached' or 'cached' average time differs between the non-root
>>>>>> and root cell, it's an indicator that both might have different hardware
>>>>>> configurations / setups.
>>>>>>
>>>>>> The host tool can be compiled with:
>>>>>> $ gcc -Os -Wall -Wextra -fno-stack-protector -mno-red-zone -o cache-timing ./inmates/tests/x86/cache-timings-host.c
>>>>>>
>>>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>>>> ---
>>>>>>
>>>>>> Hi Jan,
>>>>>>
>>>>>> what do you think about a test inmate like this one? It's still a RFC patch, as
>>>>>> I'm not sure if the measurement setup is correct. Especially I might have too
>>>>>> much fences.
>>>>>>
>>>>>> This test could be extended to run permanently and show the results of the last
>>>>>> 1e3, 1e5 and 1e6 runs. Having this, this tool could be used to monitor
>>>>>> influences of the root cell on the non-root cell's caches.
>>>>>
>>>>> Such benchmarks aren't bad. However, the current form does not qualify
>>>>> for the test folder yet IMHO: no functional test, no easy evaluation of
>>>>> benchmark results in order to generate a pass/fail criteria.
>>>>
>>>> Ack, will move it to demos/. Before posting a v2: Did you have the
>>>> chance to look at the usage of the fences? I'm pretty sure that I might
>>>> have messed up something.
>>>>
>>>>>
>>>>>>
>>>>>>
>>>>>> Aaand btw: On a Xeon Gold 5118, we have following values on Linux resp. in the
>>>>>> non-root cell:
>>>>>>
>>>>>> Linux:
>>>>>> $ ./cache-timing
>>>>>> Measurement rounds: 10000000
>>>>>> Determining measurement overhead...
>>>>>>   -> Average measurement overhead: 37 cycles
>>>>>> Measuring uncached memory access...
>>>>>>   -> Average uncached memory access: 222 cycles
>>>>>> Measuring cached memory access...
>>>>>>   -> Average cached memory access: 9 cycles
>>>>>>
>>>>>
>>>>> Linux native or Linux in Jailhouse?
>>>>>
>>>>>> Non-Root:
>>>>>> Cell "apic-demo" can be loaded
>>>>>> Started cell "apic-demo"
>>>>>> CPU 3 received SIPI, vector 100
>>>>>> Measurement rounds: 10000000
>>>>>> Determining measurement overhead...
>>>>>>   -> Average measurement overhead: 82 cycles
>>>>>> Measuring uncached memory access...
>>>>>>   -> Average uncached memory access: 247 cycles
>>>>>> Measuring cached memory access...
>>>>>>   -> Average cached memory access: 19 cycles
>>>>>
>>>>> How does this compare to Linux in Jailhouse (if the above was native)?
>>>>
>>>> Ok, the following table shows the three numbers for
>>>> overhead / uncached / cached:
>>>>
>>>> Measurement            | OH |  U$ | $
>>>> -----------------------+----+-----+-----
>>>> Linux native           | 37 | 222 |  9
>>>> Linux root             | 37 | 226 |  9
>>>> Linux non-root         | 37 | 215 |  9
>>>> libinmate non-root [1] | 82 | 266 | 19
>>>> libinmate non-root [2] | 36 | 217 |  8
>>>
>>> Okay, fasten seatbelts, here's another one:
>>>
>>> $ jh cell create my-cell
>>> $ jh cell load my-cell apic-demo.bin
>>> $ jh cell start my-cell
>>> [snip]
>>> Timer fired, jitter:    728 ns, min:    655 ns, max:    899 ns
>>>
>>> And that one:
>>> $ jh cell linux my-cell [...]
>>> $ jh cell load my-cell apic-demo.bin
>>> $ jh cell start my-cell
>>> [snip]
>>> Timer fired, jitter:    332 ns, min:    267 ns, max:    461 ns
>>>
>>> Wow.
>>
>> Power management? We eventually need to look into those nasty details...
> 
> Yes, very likely. I can can confirm that it's probably power management.
> It looks like the following happens: the CPU gets throttled by
> root-cell's Linux when offlining the CPU.
> 
> When we later run apic-demo on that CPU, we run it on a throttled CPU.
> But if we load Linux on the very same cell before apic-demo, Linux will
> take care of power management and bring the CPU up again.
> 
> Per default, my non-root Linux uses the performance cpufreq governor and
> configures everthing to max speed.
> 
> To confirm my assumption: If I set the powersave governor before
> reloading the cell with apic-demo, I get worse latencies again.
> 
> So this issue must definitely be somehow related to power management.
> 

This whole topic consists of three aspects at least:

 - understand what all can be controlled on Intel (and eventually also
   AMD) CPUs and what cross-code effects it has
 - model access control in the hypervisor
 - make use of those tunings in our bare-metal cells

We can probably pull the last item to the front as it will provide
direct input to the others.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d704b7bd-d150-b762-3811-ad0bdc839eef%40siemens.com.
