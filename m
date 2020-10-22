Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIU2YX6AKGQE2VTKALY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id F1341295B78
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 11:13:06 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id s25sf441489ljo.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 02:13:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603357986; cv=pass;
        d=google.com; s=arc-20160816;
        b=aQGhqrU1e6QAie2Trnf9qrKU/G0eINGBmFC0gMxYWOlMpkhujxFCrI4Ps12+MzdOJk
         Ilb2I2VaBD9x6M1sYGQ+u+AQkax+QtWUOJSpxf+DQA9YTCfGtOevyKeGEFN0VxPwpAa0
         8N2Yb3JmF0Yqpj9Q8bWcU5ZH59EfQJw8w6nRNbsSjhfPIkbDVdqv1Rs3/LnnYI1EuYgp
         Z2sJNhu9nHXbrhp8Wz8FfDXE2uBCNCnDaz2Tw6m1L5eqIIajGlF6+vsqxEBBL0pe6DMY
         fLJgtvMM5+7cGMna/SVDR4Cpzgxex3ipOhmLx4OKMRGZBjxI8OmyC2ui60FHOQWThz4w
         B2xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Yno7M7T4HcV7LQxKSKrGHoJCv1qV1S/SMHa0S6SwaTU=;
        b=QW3RXQ78dgWIKGXotOhbwGjTacaUQ7dqg6w+2t8WDM8CLl2ONHVzo6iRFuUCWlAnnS
         OhQ0aFrAwJWkpOeMI47ZHQXRll1DpcWcmif5K+B1f34Y9CqYEVhespLAemDdPpT9N0iz
         Qq0x33Nn2VWoYgUAreM62dQGVu5NhBXVZ/8zWgKcmTZtfkwWpSdYozgmWTMbFaIPDGFA
         SfD1XpXQHlUMOfEb9Co5AdGwMjv89hQn+bBBBKmnXj4252lxRn+4o73H3yLCXq5ZXtWI
         WcFq/SYWYy9zdF7ju3kr8Hyjlrp/nrBViaVbfXTm9S8AuWJaSMk7wSZR61T/OVIXk5GO
         eT7w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Yno7M7T4HcV7LQxKSKrGHoJCv1qV1S/SMHa0S6SwaTU=;
        b=XCidemjMxQ2u76Ch9wwZapeC/ZlPOAhszL3ByeURrDeG7lHX3BpltVdp+igu1cvJUR
         0iKL9SQJAL/QZkNeMkEWYNDwd8FQiEZ5mOuCc253Dz2pS5MYKc6yr2rjvlWYwGsPnL3m
         iTcA9nTYdRXxoezCVaiK6lpZXNljchPxGu6o/BLnSdm7J//XFVkbh9qvujllAny/DNY8
         rwyTfJsOwuQcguycvAB1ZOWqsgLfOgtOlXngybcBw63s9MLGq8wp6pAyUAiaBTybP42V
         H+njpsRBpU+vFcYfdSsAn+c2G0V6JXCrOaGllmmMdXHtDU0sRpUJtJNjV10N9sOEWXGB
         F2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Yno7M7T4HcV7LQxKSKrGHoJCv1qV1S/SMHa0S6SwaTU=;
        b=jCvmQQr8aBJYxFeZf90Zjv5ICM9Q6x6JdSMy+rfMz686/Laj+thx+zjbA/cJdWnBdJ
         UDFED4eij/bBo+8F9qhxyzdrd30ygbwmByKBLmgBUJiA3vPhlH0CxEcTewmyf3qbR+bq
         1HAUXvOvLfR33ePBHiRyvYiWiV1bsDIPcjK/keqV9K8SzgjsaDbZbQC+KFRQwbzPg3Vv
         BZHxAlBFgLOrLwLqZ6FCu+v7R55SSuz7LRHGp9qLB7rMdRE3Y6r2hLEJG05xwUDsrF/S
         CYPl2Z0nOlXmVuP1oTS+o9ic7bP3ROE8/P4dzstgdc60swBWZsrCmV5ex3jEuKpKEcU9
         cyzg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Svko3fd5xDt7fLsj4OLgihM2HUPIpFfnCmmu42zX1eVgg9cNZ
	PvU4u1Zq5Eg84L4M7ihHk7U=
X-Google-Smtp-Source: ABdhPJzC3/3F4DjokuORS7df6TB/6r6j6z0aDfLsQl/I7sV4RiVjWAbzu+wh/7nBpZqXeayd/mMFmg==
X-Received: by 2002:a05:651c:234:: with SMTP id z20mr647411ljn.337.1603357986543;
        Thu, 22 Oct 2020 02:13:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls740839lff.1.gmail; Thu, 22 Oct
 2020 02:13:05 -0700 (PDT)
X-Received: by 2002:a19:60f:: with SMTP id 15mr517334lfg.163.1603357985225;
        Thu, 22 Oct 2020 02:13:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603357985; cv=none;
        d=google.com; s=arc-20160816;
        b=YFNWmeUh1st4C/gE2w/ie3FsL2Fw1aTKQnRqi7ggjqWV6UEqlrT3zZwjNJg25zcxXO
         J8gHgYNevo+/NgNbJQBIEwJlYXeRu5CZek2EbwN1bZepk2ULhtV5JLnvK/1gN6lKcVMC
         vBJssYs7UpDD+u3W0MuIlHb4PvYVrFiyqTGbFXG1eXlDlovc4J5eQnMcGoTtAXZhnuwB
         a7MSo+GKaLaCH1711BC1YUKBnmo4cZuh6MyWGARmh0IG0v6l1mZj719s+2xSZ/Ethuhb
         e76KzkoD8JsHAoJ+Dce4EcLqvU5Mp/KyznHm1rqEGx+bA19biKrHBDD/X+mL/qdUb1MM
         5AMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=dDcJcZK+J3/RlyFbt0SQGmK5Y9tHeLCKM06zcnM6hnI=;
        b=aouoOzna8bKj+GE5d5Q/p4Qu+Gm43hN2OjAq9zHe5883mOISG1sB1iM1Lv3M+KuJFv
         GmEZWeHEb6li5qTsUPoqTzwCldbFmV2MBiBaSWj3PkhvfTw9TyCIlrD+GmIPt1cv5oCC
         nudugKqsYz4jlS36k5RC4oIpvO4S34Kd5lIuxUbC4VqRhw6V6rrxe5HIZcWcY22uOWik
         yTMIqBHOh6xY9vnnu8+nhNmadsMhBK5FlK2VeVDiB/jU6OMm/2E7jvk59t4SPY0tIHOI
         6zRqB+av2rbFIGGX5Zmnn8U6HyAo/wAHl4fR7mMXHRXyGpydC1PbfZ96fNDClf5kFDAh
         ZioQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 8si41001lfm.7.2020.10.22.02.13.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2020 02:13:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09M9D4YH032277
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Oct 2020 11:13:04 +0200
Received: from [167.87.53.106] ([167.87.53.106])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09M9D3XH032155;
	Thu, 22 Oct 2020 11:13:03 +0200
Subject: Re: [PATCH 00/26] Extend hypervisor compile warning set (and fix
 warnings)
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
 <7c3c49ea-93d7-2a15-d844-a2004231ebc5@siemens.com>
 <aec791f3-9637-b08e-99b5-56d2b6341cce@tum.de>
 <893cadbb-bc59-7127-469f-3dd5a00c71b8@siemens.com>
 <37b3e925-3226-1011-bd08-bcfa8bad8b04@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <eeb6ae62-5a98-51b4-b261-5346ff8cb5a7@siemens.com>
Date: Thu, 22 Oct 2020 11:13:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <37b3e925-3226-1011-bd08-bcfa8bad8b04@tum.de>
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

On 22.10.20 10:13, Andrea Bastoni wrote:
> On 22/10/2020 07:21, Jan Kiszka wrote:
>> On 21.10.20 21:23, Andrea Bastoni wrote:
>>>>> The patch series fixes the warnings generated by "-Wextra -Wundef
>>>>> -Wnested-externs -Wshadow -Wredundant-decls -Wdeprecated", and two small
>>>>> bugs:
>>>>>
>>>>> x86: bitops: only x86_64 is supported, avoid picking the wrong default suffix
>>>>
>>>> How did you come across that one? Luckily, we only ever set bit 0...
>>>
>>> Saw this warning and took a look at the disassembly. Panic is probably not so
>>> common anyway.
>>>
>>> hypervisor/arch/x86/include/asm/bitops.h:54: Warning: no instruction mnemonic
>>> suffix given and no register operands; using default for `bts'
>>>
>>
>> gcc-10, right? I'm not getting it with 9.3.1 which I have here.
> 
> Yes. I also tried gcc-8 (gcc-8 (Debian 8.4.0-4) 8.4.0) and I was getting it as well.
> 

Maybe rather a binutils version thing? I'm on 2.32.0.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/eeb6ae62-5a98-51b4-b261-5346ff8cb5a7%40siemens.com.
