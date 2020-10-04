Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNNN5D5QKGQE6BJ6M5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 508E9282C94
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 20:38:46 +0200 (CEST)
Received: by mail-ej1-x639.google.com with SMTP id v9sf2381370ejb.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 11:38:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601836726; cv=pass;
        d=google.com; s=arc-20160816;
        b=UromXTHku2+4oiIOI/iusUcx7aGkZw4XtmbCoi88/oK53Pgoiz89Y2nT6uCu3I3xz+
         xFWpTAGG5qdX+lMVSb+8/4XuOVibLSkzsMOoVphoQgtd2aRYZiOB1ymiq0dQpypxPpH7
         HaVIzLAsZ3UzQd1TClkUqfsfrV3KrLynCuhvXf02lBwGasxUv4Iz0KckQlrvrVjHw9AG
         aYTRTctrjRfygc/KttYepPoejEnix4R9SjmWk8oms6G4MBJlIjU82uCCLff8qjmpyxkq
         Ti+JcSFz53ENsbsNXTqVkCZW/kc0jIXCvjVR1tqZDQ2FL8q1TFw8t5tVlBGQxfLGb89i
         MQqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=cF0TAvuEpR1I6+aZ7EsBmHbRE4/EfCCY4AfrMQnxE3Q=;
        b=ZAmMk9bZIksogiIaebe4D/Ro8O4tQkNYt5sdUDXlK/ELlcuc6BABaSOu+fbN+aCCOc
         tqhHa3XMNwJqN3yCPnuvYWjvupUJ4UonhI9nTiyAB8hq4VDBWRwQ5/lymX8E0nFwVDUO
         FdeOS2N+SxOTip+btSFdoijLbht4llUPi3x8+2b9jSSj1j3qBb2ou3zI+/cOW4lEmUlL
         lyebLOxA4pViu87xOZng9azII5x0Us8legymAUJqKIbUy4yN9S/SnzSUapbpxbMAdutE
         EWrrTd/9NPaVk//Fxs3d3ujC+7ELi38/FI6jztH6dCpNg1+34z6rBhQ6lEtdhe6A53Bb
         BMxw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cF0TAvuEpR1I6+aZ7EsBmHbRE4/EfCCY4AfrMQnxE3Q=;
        b=Qj0HWxbOssEbN3lSk34EOkitYgDr/NwXmgQwhHUSpXvGqbp76pFjigUpUZ6B1c5L5t
         R+ZAqFaUVoFPCdIPBPxynLqwM8GF6lsn5+atA85544o/6lTUF+guY5R0Z+qS6+onM66o
         4fzMdEK5rjuWQ0ai8GHicqPi1x8jLgI7WiwYMpuwQ1z80ke8nWeaY5dQhtYA7oB+H5N4
         EQ2Pplpw+UqQlx0RYIhlPDjuJ9A34dk8wBYNKToDHe5CwkNt8AttwyOmGU5c0WHLN2hc
         FCuOvnBbMmCT8e+548woJhhNyb2Yn+TdiemdYr3ubqd84zt3JEStGM7bP3kOKD7eL88B
         InfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cF0TAvuEpR1I6+aZ7EsBmHbRE4/EfCCY4AfrMQnxE3Q=;
        b=hXjcmoNjdZitX7AxqQMXknvDgmw4vtlZGjusaW09wnvmgCZhROkcT9IuYAv7tkrkqo
         chqN+VxxzEJxzA74fAmzqCbu8Y3HTM8xfShdt2FH4UsHBfR/SqoGGH+T+sFx0tDC8fNX
         GQ1frAkjqHawHOmrNAlks8xdcWsy7iRqEwQXHE8Y9Qgtsr4nKuZJuhN+lawWgAAlkJOW
         TkRTBr+pkhhefB2j1Gdq0eCgpDWIbJGr0POKGNogcRtjXCvB/sy1chWxuEpYA2+teC6A
         dqIL2jVbSbqQb8KvW4+KtFcy4AGlScGkcEpab663cFMrWhlkDV/z+pP/d8D24KCoRWQR
         zozQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531EVWegl8XzOmiQcmIP1gjc+GSlEFS9YIXFVPiNOyG3smSsjg2s
	JQfbsM2XexeHLiAGO7elCgU=
X-Google-Smtp-Source: ABdhPJyepapF/4euq1lSXnbPHINzCzS9rBkpPY7TlELQD1SH1OeEz9Jmi4N53ThGo48f2zMkPWzUyA==
X-Received: by 2002:a17:906:e116:: with SMTP id gj22mr2923358ejb.313.1601836725994;
        Sun, 04 Oct 2020 11:38:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c545:: with SMTP id s5ls2854977edr.3.gmail; Sun, 04 Oct
 2020 11:38:44 -0700 (PDT)
X-Received: by 2002:aa7:db47:: with SMTP id n7mr13503582edt.315.1601836724704;
        Sun, 04 Oct 2020 11:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601836724; cv=none;
        d=google.com; s=arc-20160816;
        b=UpkmGioId20iShYi0LI2vhXpur+Fo5Ri9PkpEl2w61pVT2y2IknrfOxLcmbDIIY1Cu
         vvsDTIBzSx5VVnXK98U0wcl3G0plCKGwx2cfKgT6xXGBpzqeUxp/lFb9H/icGx/aThpz
         XVSo1pfNip1Gkb4CdMHaEldgmh/4b4qIU9cF38IE8TB/UFZ36oXvMKHnAPWOBW34iF4I
         FH0geQ8ZxQgmJmRK3NmVmU3V3IRPn4eW6Czan5kZDDp2tScDOpR462oIX/sB5zpy5B2k
         0QplThvuj1R0kalOR4BHWZRfkIltAQvpPT4kbbvWaWNWvg4yiA1/RYMNDvYoBT5gt/2z
         Xj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=++gkgPMJXMUDOt3C8T4weB3dVSEgzgYpNgntvGBn4yc=;
        b=XaEa+5RNq0WhZ+ZNQvl0dVZSjoS9XCweFX38cuzJRNxE9iYmZq9G1c0I8+LTYBuxYc
         CplHt5XJwuMm+mRSp5OwulrTUvp45yfYbfZspnnz+j7s7djGFF7q0V9N/GjbAa7a5/hj
         Ft76RUHZjZq+bMxEqP72I15Vz1nDz6FcsRokWCQJ2+Bei5z/nYCw6QFRXakDlOKTWpeV
         owC8SegAbznDTam5YtDV8CMdK5qgZt4FdzGshGX9yi1JuO7ZSV2rVZzRcmnkXq5MVXWs
         nUMeQMbHsz+gbafd5eTD0U3snR2oTayrwJ5fC0JreuLssKIlB6CeV5Xll8HpLNsvuGue
         UwgA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id u13si140016edb.0.2020.10.04.11.38.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 11:38:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 094IcipQ014790
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 Oct 2020 20:38:44 +0200
Received: from [167.87.242.108] ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094Ich77001950;
	Sun, 4 Oct 2020 20:38:43 +0200
Subject: Re: [RFC PATCH] inmates: x86: add cache access time test
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Wolfgang Mauerer <wolfgang.mauerer@oth-regensburg.de>
References: <20201002235640.196730-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2b5258fb-ff56-c74d-08c8-2cbd22c8478f@siemens.com>
Date: Sun, 4 Oct 2020 20:38:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201002235640.196730-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 03.10.20 01:56, Ralf Ramsauer wrote:
> On x86_64 systems, this test inmate measures the time that is required
> to read a value from main memory. Via rdtsc, it measures the CPU cycles
> that are required for the access. Acces can either happen cached, or
> uncached. In case of uncached access, the cache line will be flushed
> before access.
> 
> This tool repeats the measurement for 10e6 times, and outputs the
> average cycles that were required for the access. Before accessing the
> actual measurement, a dummy test is used to determine the average
> overhead of one single measurement.
> 
> And that's pretty useful, because this tool gives a lot of insights of
> differences between the root and the non-root cell: With tiny effort, we
> can also run it on Linux.
> 
> If the 'overhead' time differs between root and non-root cell, this can
> be an indicator that there might be some timing or speed differences
> between the root and non-root cell.
> 
> If the 'uncached' or 'cached' average time differs between the non-root
> and root cell, it's an indicator that both might have different hardware
> configurations / setups.
> 
> The host tool can be compiled with:
> $ gcc -Os -Wall -Wextra -fno-stack-protector -mno-red-zone -o cache-timing ./inmates/tests/x86/cache-timings-host.c
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
> 
> Hi Jan,
> 
> what do you think about a test inmate like this one? It's still a RFC patch, as
> I'm not sure if the measurement setup is correct. Especially I might have too
> much fences.
> 
> This test could be extended to run permanently and show the results of the last
> 1e3, 1e5 and 1e6 runs. Having this, this tool could be used to monitor
> influences of the root cell on the non-root cell's caches.

Such benchmarks aren't bad. However, the current form does not qualify
for the test folder yet IMHO: no functional test, no easy evaluation of
benchmark results in order to generate a pass/fail criteria.

> 
> 
> Aaand btw: On a Xeon Gold 5118, we have following values on Linux resp. in the
> non-root cell:
> 
> Linux:
> $ ./cache-timing
> Measurement rounds: 10000000
> Determining measurement overhead...
>   -> Average measurement overhead: 37 cycles
> Measuring uncached memory access...
>   -> Average uncached memory access: 222 cycles
> Measuring cached memory access...
>   -> Average cached memory access: 9 cycles
> 

Linux native or Linux in Jailhouse?

> Non-Root:
> Cell "apic-demo" can be loaded
> Started cell "apic-demo"
> CPU 3 received SIPI, vector 100
> Measurement rounds: 10000000
> Determining measurement overhead...
>   -> Average measurement overhead: 82 cycles
> Measuring uncached memory access...
>   -> Average uncached memory access: 247 cycles
> Measuring cached memory access...
>   -> Average cached memory access: 19 cycles

How does this compare to Linux in Jailhouse (if the above was native)?

> 
> Cached Access on Linux is 2x faster than in the non-root cell - if my test is
> correct. This can - probably - explained by different cache configurations.
> Uncached access happens at almost the same speed.
> 
> But do you have an explanation why the overhead measurement is more then 2x
> faster on Linux than in the non-root cell?
> 

Not yet, but I need the full picture first.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2b5258fb-ff56-c74d-08c8-2cbd22c8478f%40siemens.com.
