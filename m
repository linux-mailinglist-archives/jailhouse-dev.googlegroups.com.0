Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBNG35D5QKGQEI7BZ6QA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id E75EA282D84
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 22:16:52 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id b8sf321049ljk.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 13:16:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601842612; cv=pass;
        d=google.com; s=arc-20160816;
        b=BDTEqmMUKofgYyFjYJ5R0SNhQDcXj+7Rxq1NK8moG/FSzEofe6wYsYeie6RZM7ygvm
         ZVewWRZUhCC8gGsVgSv5FYfDBV0hdx/hkvZekiSJg60XwVoMKSl1qdcUo6BGNJ0lcM/u
         9jwPkYRHLc5Mv1qj2kfOosHJiWUBVDwlijQkI9zyJ4Fid06SDM/Y+lO7qnoWxT/ZEWF1
         PkDxq3De+EMHAyDJey1IdkYn2juJAkonlqS7FtZrrVyZksT7498vlNQU5iKHKJUYx/4U
         1wtQ9/kHAH1XUeqZmA+DE+IPxQpRkbFg0IotUd1xsQRs40La8fQNyrf0iQqdRGRE8av7
         yhBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:subject:autocrypt:from
         :references:cc:to:sender:dkim-signature;
        bh=ln6Sj1xrEFXV6jzauYR3ypMZi9QiF6tFN9LtIq9MQ2U=;
        b=m562GkOR8+afbndjaUeuGdDolF5NPDQ3BS4279xL/N3VNCwZmMvAT5DI4kcl+T4Ze8
         5vOSQmrHHWCIsHFa7b99p0EyhGNp0nfyKEF+bBHKATkIOqXj40Tz+c6S74zY761b+LOi
         DAohMTcncljAzUXt2Ztw4GfVprOPP3wF1YXJI6xd6HVwNdSKJXjGED+VV/tsQCGY7ins
         /FgcZhDF90XJVjYzJ0zKmEQ5yjRfVB0KL+ygThVEahYDYNaENZ98lLNdnhhaWWf7vqWy
         K6ZA4NFDuII0mC+S3VdZyVbrtGQXbZ2qADsHvvPuXPupEqbyU3fbh4UWo8p3vDNzaRU/
         YSbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=FavRriy7;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:references:from:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ln6Sj1xrEFXV6jzauYR3ypMZi9QiF6tFN9LtIq9MQ2U=;
        b=IYACyFFofi6R30LvTRCQIMa6Ubpc0tjGwY8xwqUHxcA5jQcfcOXB7EQchOCCr8oee0
         BqxXtjhMUvTs8u6gxdF2Mswqkv3qHGYSHKandYhfJCnnQA/7OSA7PtN/iEDrZMP5oMtn
         eUFafCCGnhLRo9MogsPd2n8TOl95K2pHRzT2l7bKhJi7j26YzHvhCqNmOh+haeeQzc8M
         o8x+CzmJFxRhm1f+FEjMeAZ/XoiGKX1kh2lqol8M0Yjfi9nL9TpfCsTFBmTyRxJJzZ6P
         HAmibX2NnudALKGCtP8qtQoAotVQ/tq458FIvXBpyh5U7AdT0Itf5Fg3RYnf8P/vi5JS
         i57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ln6Sj1xrEFXV6jzauYR3ypMZi9QiF6tFN9LtIq9MQ2U=;
        b=dZzmsqpZGjVXkf7nj9YFIzTFdW7EBPZhA4Hw9JJxxeD3ZZxxuK9qrpbUrtWe6RDobB
         Ja/oNXKqmH0k0FPaFqCeeM2p2n5gs7gzaF6Ihz1CenNaRK8CBK7LN9FtU2WsfcbH3GnC
         TyUO4uUXHtXB2gWljGzo/qUQPMdSaySOg7q/8tHaW5x/Lt3+ydUI7dP11062bcwqq/nu
         i7hxeu5E9fyHY4FLM5gzBam7gk+oLrnW/PNiYRRyoDsJSHYbPipQvHthsWZVGh2UFEa5
         hLzXGAGvhGiy4HAF7/J2js/a5u+FgzLAqU/P+KKInEYRxe6c2m/fN84q7YzkW5jKEjlm
         B5tw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532YfYNvknkHIYZkAE55GAjlzOt4bAH4QqVMbcinE8x90l8IX7Rv
	yLhCKETBKg8+Z3SI7CXt8oQ=
X-Google-Smtp-Source: ABdhPJzSKCoxTgb+usYZIj+ounm0lH7QRYrtqiuXotWxWin7GVSZZLhclPxHn11LhthcQpBFk99aSA==
X-Received: by 2002:a2e:3809:: with SMTP id f9mr3499212lja.5.1601842612481;
        Sun, 04 Oct 2020 13:16:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:555:: with SMTP id q21ls762172ljp.3.gmail; Sun, 04
 Oct 2020 13:16:51 -0700 (PDT)
X-Received: by 2002:a2e:b5d2:: with SMTP id g18mr3491528ljn.211.1601842611393;
        Sun, 04 Oct 2020 13:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601842611; cv=none;
        d=google.com; s=arc-20160816;
        b=FhQy3/2N7DjWkWt99ShpKsdTayvZByVKstn25vP1C9WBCEv/B0xGBv0aZR8DDhyPTq
         aGjYmDEJevWPnFaaIAMfCf8HQiK3nUPufq28wx3mMcJfFwyKQ0f1hhDkgB4NoTyrK1ys
         DYAFB4I5aqNGpiNaxO5DXQZiN9k+2Ki6OkC0Sh2Nzye9qLDbnPo99pPoQ5x424UC1Wu8
         ywK40Ba4UOmojE/XykaM97DsdWZ/qDoTIljNR23JkpzFSJ5QW7B3pPrShH00YFJFzbGl
         Uoc7V5GS48OoE7fqT5l2HiP44NKc1GIMYQlKEnKh8fKY49Xa0PFmsqa9Oh0GyFlJj3L1
         66xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:from:references:cc:to
         :dkim-signature;
        bh=o475FefPec13iylAD4Fm7oA6oeqab3KHV0MwlLFCueQ=;
        b=aFzlXtOWILrtSztTtFKCh3Z20zbOWIAUWKEkx1uHAgOLsoBSalDfdUoz3P+30+Az1N
         l54oBnF1ePve6/ExRXY2csW2JOjaeZy8KUcpk8Ow/SjK8NNy03o8KDrEjkC3WkGmHBGD
         eHD0a2Ao8QKJF9ZAX/kIsuRsYETKiAsyMIKcQdIrvRstjyzHFK0/QHgp3quTbWbq5EdZ
         iqkQ7v2/CW7yA1mC7HLvMnrE0G2W7C7ab0naRWUBUTGB8PsIoCi1IaSVWMMq/MSeCL2g
         hsWIsWNqgN7DWLnTTkdNLWHdHluQZdn8fC7NTNqUK0UyOTY9bD2GH4bCdbsNylHRna//
         Kuaw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=FavRriy7;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id q20si195129lji.2.2020.10.04.13.16.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 13:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4C4FPZ2yqlzxsr;
	Sun,  4 Oct 2020 22:16:50 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Sun, 4 Oct 2020
 22:16:50 +0200
To: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, <jailhouse-dev@googlegroups.com>
CC: Wolfgang Mauerer <wolfgang.mauerer@oth-regensburg.de>
References: <20201002235640.196730-1-ralf.ramsauer@oth-regensburg.de>
 <2b5258fb-ff56-c74d-08c8-2cbd22c8478f@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: [RFC PATCH] inmates: x86: add cache access time test
Message-ID: <938c741d-ca30-a960-5cbb-ebf1d4b3f4a4@oth-regensburg.de>
Date: Sun, 4 Oct 2020 22:16:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2b5258fb-ff56-c74d-08c8-2cbd22c8478f@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US-large
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=FavRriy7;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 10/4/20 8:38 PM, Jan Kiszka wrote:
> On 03.10.20 01:56, Ralf Ramsauer wrote:
>> On x86_64 systems, this test inmate measures the time that is required
>> to read a value from main memory. Via rdtsc, it measures the CPU cycles
>> that are required for the access. Acces can either happen cached, or
>> uncached. In case of uncached access, the cache line will be flushed
>> before access.
>>
>> This tool repeats the measurement for 10e6 times, and outputs the
>> average cycles that were required for the access. Before accessing the
>> actual measurement, a dummy test is used to determine the average
>> overhead of one single measurement.
>>
>> And that's pretty useful, because this tool gives a lot of insights of
>> differences between the root and the non-root cell: With tiny effort, we
>> can also run it on Linux.
>>
>> If the 'overhead' time differs between root and non-root cell, this can
>> be an indicator that there might be some timing or speed differences
>> between the root and non-root cell.
>>
>> If the 'uncached' or 'cached' average time differs between the non-root
>> and root cell, it's an indicator that both might have different hardware
>> configurations / setups.
>>
>> The host tool can be compiled with:
>> $ gcc -Os -Wall -Wextra -fno-stack-protector -mno-red-zone -o cache-timing ./inmates/tests/x86/cache-timings-host.c
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>
>> Hi Jan,
>>
>> what do you think about a test inmate like this one? It's still a RFC patch, as
>> I'm not sure if the measurement setup is correct. Especially I might have too
>> much fences.
>>
>> This test could be extended to run permanently and show the results of the last
>> 1e3, 1e5 and 1e6 runs. Having this, this tool could be used to monitor
>> influences of the root cell on the non-root cell's caches.
> 
> Such benchmarks aren't bad. However, the current form does not qualify
> for the test folder yet IMHO: no functional test, no easy evaluation of
> benchmark results in order to generate a pass/fail criteria.

Ack, will move it to demos/. Before posting a v2: Did you have the
chance to look at the usage of the fences? I'm pretty sure that I might
have messed up something.

> 
>>
>>
>> Aaand btw: On a Xeon Gold 5118, we have following values on Linux resp. in the
>> non-root cell:
>>
>> Linux:
>> $ ./cache-timing
>> Measurement rounds: 10000000
>> Determining measurement overhead...
>>   -> Average measurement overhead: 37 cycles
>> Measuring uncached memory access...
>>   -> Average uncached memory access: 222 cycles
>> Measuring cached memory access...
>>   -> Average cached memory access: 9 cycles
>>
> 
> Linux native or Linux in Jailhouse?
> 
>> Non-Root:
>> Cell "apic-demo" can be loaded
>> Started cell "apic-demo"
>> CPU 3 received SIPI, vector 100
>> Measurement rounds: 10000000
>> Determining measurement overhead...
>>   -> Average measurement overhead: 82 cycles
>> Measuring uncached memory access...
>>   -> Average uncached memory access: 247 cycles
>> Measuring cached memory access...
>>   -> Average cached memory access: 19 cycles
> 
> How does this compare to Linux in Jailhouse (if the above was native)?

Ok, the following table shows the three numbers for
overhead / uncached / cached:

Measurement            | OH |  U$ | $
-----------------------+----+-----+-----
Linux native           | 37 | 222 |  9
Linux root             | 37 | 226 |  9
Linux non-root         | 37 | 215 |  9
libinmate non-root [1] | 82 | 266 | 19
libinmate non-root [2] | 36 | 217 |  8

I get the numbers of [1], if I load cache-timings.bin to a fresh created
cell, IOW:

$ jh cell create my-cell
$ jh cell load my-cell cache-timings.bin
$ jh cell start my-cell

Those numbers can be reproduced if I reload the cell (i.e., w/o
destroying it). But in that very same cell, I will get the numbers of
[2], if I load/start Linux first and THEN reload the cell with
cache-timings.bin (w/o destroyment in between). IOW:

$ jh cell load linux my-cell ...
$ jh cell start my-cell
$ jh cell load my-cell cache-timings.bin
$ jh cell start my-cell

Interesting. This means that Linux must have left some configuration
artefacts. Still unclear what exactly.

> 
>>
>> Cached Access on Linux is 2x faster than in the non-root cell - if my test is
>> correct. This can - probably - explained by different cache configurations.
>> Uncached access happens at almost the same speed.
>>
>> But do you have an explanation why the overhead measurement is more then 2x
>> faster on Linux than in the non-root cell?
>>
> 
> Not yet, but I need the full picture first.

Hope the numbers above help.

Thanks!
  Ralf

> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/938c741d-ca30-a960-5cbb-ebf1d4b3f4a4%40oth-regensburg.de.
