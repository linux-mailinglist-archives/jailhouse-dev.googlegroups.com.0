Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFOV4H6AKGQEAJM2ARY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 884D029C7A7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 19:44:38 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id u207sf906947wmu.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 11:44:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603824278; cv=pass;
        d=google.com; s=arc-20160816;
        b=B1d1f11IBQVEUK+027MqXiztW/W2CYOzXZo23RZX6iFZbw+0bxQFR66wiNnBp2Lbb5
         iab40XDZVxOkkd/WSL5MxCm+u+hW4YgJ/NYUa3ENW6ZivHlistoRtQn5IpNm1Dhh/nWA
         wBjX5iuMhdPrTEAoknfNv7ePPhG6MyB7REAbu/wP3B9KTpoHP4wlXX2m7m/OIgMLeozc
         AXBkZzy7v/HV357trWH+3thk6/SrwneSeuDImVjLRXEVLV69QCLuZXkN3iM1iMhj2mno
         4/KeRpWEXwlmY1sfr70AFIqhkB1JPo1twEkguWkgCKLvsGufqVFFt0bKsXSHlTttZpMp
         XrDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=MLWGwqEfGvrsE+lYSRGF6uENIpptkygM5tFYq2loIxY=;
        b=dGMsqdkmWr+wLJIrNqF0d6Yz+rO6N+dqL1wLPTz4FGmJZsj/F9C8l2C8YbMmfhNprc
         tEk1CR7wKQ+QAFWXv/wn5TTHm7pnUj6tqOzHQu9SDALO6ARONfk4nYpBiFvv2759JgCT
         2xW7CRAm7G/cLz+7aztVROkyOO9iK5Nyorm0M68QrxwGclylHcn1w56ZzG3V+vpcBHdq
         FWAIu0YoBpsmvmIzAW4y0rhbaypALZ0qMFiR5X9UPvvZIWleGephXQF/vi5jdsYisDqN
         evjzU+stTba1l5+ncUAZXjqb9hK5/i61owZi3UxZZfVEj50lEZlqD8lrfHN9lZRtz6u/
         vjdw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MLWGwqEfGvrsE+lYSRGF6uENIpptkygM5tFYq2loIxY=;
        b=tKSKgIPcgiZIBP0AqJ9w20KiUGRgoiTWITiEpnGhdbiak77e92M5Zejal65SkIVZT3
         GUwxO0NEvLq02XIPPWRyL4JsMKn6YCa4BCVBChjV9y+RZhViQmf1cU3yqbC3v+9+SF7h
         Tki9oawFulzjbDLeBBnMN3CxevEVF3kYqQslUOwnMTf4tGFGOo56EOYF8nKcwiiiWpea
         jkPlXFO+sjgGlqzqf4ayCg1OsS/E/aYeBEOtK++to5uIWYK1Z20LtOU2ciwB2TB7U4Qy
         CbqcndRnU0mn1VubtU4BRyJADFArZZPQUuQOb2BAR4BipH4D2I8CCD4oxefNXl+wZM7z
         Hvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MLWGwqEfGvrsE+lYSRGF6uENIpptkygM5tFYq2loIxY=;
        b=Zal1mVE6MukPNpQG3EXQLfv4CaYdU0OqqB0xnf6r7rELwk/9haRUZZjjMtYl6+ycer
         aY4vV8ByGpQpR3zY38d0781cDhN/RQAkZqxN++gsZ6DrggLHAJcE59udwuOOBYQsguwq
         u322BcY8bHJfrnbANh7VBS8bByhESoaA5RQJPjMjiysJnQVh9LQKWdkTHzElc22By6Yx
         9wAKicoikIeDkP1NsZXEfRXKafjMD88IcvlKHjCHn0saB66rgGuc1VbaSo6bZEHWH7i7
         WFK9VUyr9oRdtB0hii+iIwEM2QcSAFwCA5wfeS84MqDxq7/ckeoonL46RKb84qaKMRBc
         aKkQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530huMEs/3D0NM+ok1zqwVjb7M+kYd5K2R+wpS8Ve0KoiXEfwu7t
	CoAfz/m0zSc78WoPOm6HYmc=
X-Google-Smtp-Source: ABdhPJwDzpFwt9Jn6MhI76PkWojSPNxvfCfIkaAeY/RQkcRPmO/4yRlrNw+ioxWbmJ9Xkgt17s18pQ==
X-Received: by 2002:a5d:5612:: with SMTP id l18mr4675030wrv.372.1603824278296;
        Tue, 27 Oct 2020 11:44:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4e19:: with SMTP id g25ls1373205wmh.2.gmail; Tue, 27 Oct
 2020 11:44:37 -0700 (PDT)
X-Received: by 2002:a1c:2cc2:: with SMTP id s185mr4268949wms.77.1603824277169;
        Tue, 27 Oct 2020 11:44:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603824277; cv=none;
        d=google.com; s=arc-20160816;
        b=qAPsgKX8LUqpWQ+4cvAZMlnbLyztEqXtq870Ie6iBmv5yo/3SMlX4Ynwoq5m1bsAV5
         ZCFI6RaY0tun4sX06Yk23ZmUnvmxLf+Fie2qF5TTa5jTG77xWMqjGIqGgEGRkeqSYDV5
         rBxnjhl9lI2U4wvnUGu/gra6PyfXqzdkFnAFmMe3drRufhuAVR/BglPg064npRGOvkWW
         y1+unI63y5OrNmlY9go8uwp7Hnv42VyGf4v8CXrBCltZCbISYiK0wwSDx4WYRCV9qLrA
         teWBpqDGro88YAvXkJQjBWv+naFyN7QPEkohG1L6Fx32BZY/Jv7SgYC72hDJgIVIJW9t
         OQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=xZnpTDxKx1ZsY4Tmlc3ZSYgSAlh4+WbDRuSlZUi7R9Y=;
        b=qLxSXIVB1qmtl4lXTcmd8913IkDbRxZMyFTFn4jxez5iaXTF/nR2mswGVoYUWuhwoa
         Y88Qh9HsfjyuIZWtJO8mJQMWceN2qA0/y8LeNQSBu7V+Ul0pZJXcHWtIgPWRViONixMy
         q6QfUm/3RNsqgD9AMEP8f9tCWHk+7ficU5WUqPE3g976S5WKY0rezcv/Usz3+i8qx/c4
         Gn+JWpFoLJGInPPlpePIAKIaNUhRGFhAX5XESyyqfVBbikolCuR31BQDeqHaxPAOvORZ
         36tqYRH/JXfmmB4wxphMW17Byrdcao1QrxhMpax8L688VLTqzlxUffzyBGFso7kk1wQ4
         7Yjg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id e5si81697wrj.3.2020.10.27.11.44.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 11:44:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09RIia5K027082
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 19:44:36 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09RIiaSR007066;
	Tue, 27 Oct 2020 19:44:36 +0100
Subject: Re: [PATCH v2 11/33] hypervisor: introduce uptr_t (depending on the
 wordsize) and define size_t accordingly
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-12-andrea.bastoni@tum.de>
 <b8849626-071b-f074-8e8b-b6cada812fae@siemens.com>
 <0c29c249-2a95-26dd-1790-9df1f4fbe2d5@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c51882a5-1bd5-3bb3-58e3-3eab6171ad43@siemens.com>
Date: Tue, 27 Oct 2020 19:44:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0c29c249-2a95-26dd-1790-9df1f4fbe2d5@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 27.10.20 19:39, Andrea Bastoni wrote:
> On 27/10/2020 13:36, Jan Kiszka wrote:
>> On 22.10.20 19:58, Andrea Bastoni wrote:
>>> This solves warnings due to -Wbuiltin-declaration-mismatch
>>>
>>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>>> ---
>>>  hypervisor/include/jailhouse/string.h | 5 +++--
>>>  hypervisor/include/jailhouse/types.h  | 8 ++++++++
>>>  hypervisor/lib.c                      | 6 +++---
>>>  3 files changed, 14 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hypervisor/include/jailhouse/string.h b/hypervisor/include/jailhouse/string.h
>>> index 24f0b0b4..7dc3de3b 100644
>>> --- a/hypervisor/include/jailhouse/string.h
>>> +++ b/hypervisor/include/jailhouse/string.h
>>> @@ -12,9 +12,10 @@
>>>   * This work is licensed under the terms of the GNU GPL, version 2.  See
>>>   * the COPYING file in the top-level directory.
>>>   */
>>> +#include <jailhouse/types.h>
>>>  
>>> -void *memcpy(void *d, const void *s, unsigned long n);
>>> -void *memset(void *s, int c, unsigned long n);
>>> +void *memcpy(void *d, const void *s, size_t n);
>>> +void *memset(void *s, int c, size_t n);
>>>  
>>>  int strcmp(const char *s1, const char *s2);
>>>  
>>> diff --git a/hypervisor/include/jailhouse/types.h b/hypervisor/include/jailhouse/types.h
>>> index 828e40f7..f97dc252 100644
>>> --- a/hypervisor/include/jailhouse/types.h
>>> +++ b/hypervisor/include/jailhouse/types.h
>>> @@ -55,6 +55,14 @@ typedef u32 __u32;
>>>  typedef s64 __s64;
>>>  typedef u64 __u64;
>>>  
>>> +#if BITS_PER_LONG == 64
>>> +typedef unsigned long uptr_t;
>>> +#else
>>> +typedef unsigned int uptr_t;
>>> +#endif
>>> +
>>> +typedef uptr_t size_t;
>>
>> What's the benefit of the indirection via uptr_t?
> 
> Since I was adding a size dependent type, I thought to add an equivalent to
> uintptr_t which could be used in other contexts. Probably I should have called
> it uintptr_t directly.

If you find use cases for that time in the code, please go ahead in
refactor. But we do not build a universal library with the hypervisor.
So rather define size_t directly if there is no user (yet).

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c51882a5-1bd5-3bb3-58e3-3eab6171ad43%40siemens.com.
