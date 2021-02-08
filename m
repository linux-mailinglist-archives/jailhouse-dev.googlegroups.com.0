Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTPUQOAQMGQEQLLYSJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id AD572312C24
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Feb 2021 09:46:06 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id k14sf7758311lfg.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Feb 2021 00:46:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612773966; cv=pass;
        d=google.com; s=arc-20160816;
        b=0B2W49Z+kE+3YCARBFQ3E2waKTC+RSeRGPp8WUE75g88mksNkgBEij/Wgc3kXBPwd9
         G1ue52PhT3PHRYv4w5Nt7e6GywC6vaRUHHmSD00a1/RlD+acgFZB1SQMTMR785f+WKoo
         fIjkzwNhQXUt+yyoQ9tWx2sqmOT85wnjd/Xb9dQW8KU1h+p8GZ8nz/c1Czf9tTvNoG/r
         cmEEJbzrhmz+VOXcFxTx9Ha9afiNk0Xd2GntG5iOZatO5orBg2Qs3epXDdke4mOZ+TjY
         gzfwQU9+EgPETptH7G/xnwBUiKgYWOwEV/ZDTJTfD/1mgfDI9rzujZZXPcXDHmQOD8Tl
         wrNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=lNIgnFGaMX44VkDKzd9dlK6ZEWkVf1gI6O/U2E1lzCw=;
        b=mTbkbqukeBvU7WkcEW0ydGyP1/k9bDyMqfyzpgP1kTz26aAfxbmHQ6D+j43dcjM3GB
         sSpVzD+/VfTeZiDeclDUXK7x6/jEJ+YRJIN2Ztrny296INDll9oYSVepU00u6+08dNKg
         Gded39Kb9ytcnjxqn/XZzoOLVlvY64yzedj3oJlWaJv5Vkg4iE0SbZtLpIS13nlzHvzV
         FvDehuTkHXcESNRelnTNGTzy9CK6D7Br3KShNI2eTc7KhvNK9RTttUmshg+2hOcLgRql
         PSF6+tcpauCv9Vy0LqfgXj/hF829My7EYb464bLgYbuJcCC1vHVeIOkQ5DVRkFWG1IzM
         ChfA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lNIgnFGaMX44VkDKzd9dlK6ZEWkVf1gI6O/U2E1lzCw=;
        b=D/QxO1Svid8HuHEn+awVuiPT9K0mTfEBr9o84ihee8w3Y7Nzm5AHrHz4VJigld+4tY
         1zCAKgj1zn89KPJuWlSrnNKXwZVnKFS6PrKrJ80SLnQSt++VNTAYrpfGCasDnJKqeV6p
         6vSRXsD2xiGH2mLDORauPOnLqWC9cP6OtXQmNdSKbMmZtaGD05liarkO/93q85HGhsn2
         z5M296AbMbXrnMHN9DEN8Hl0beDc8VBYaf9cMorS6gMM12tqxl66c/7qhyxVp68rVw68
         42UHp8Jj3OKbMdLUQf6tevzeNH5ZgVdAB42+JcKu2OyTikEL2TKPas13Md7vGl0Q5BZN
         Fi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=lNIgnFGaMX44VkDKzd9dlK6ZEWkVf1gI6O/U2E1lzCw=;
        b=PsgNplM8JvaVwARRv0ViMOwRfOqG8GvEzuNCEbJSnwrzI2XWsRrabmsu20IxPxUr96
         trnh35MMNL/7Z6MpdRHWuOAoOydH9gb/AYeqsVFGrco9t1XbDr1HUym7dXdWTBNaAW9q
         ZDXjlfTaYcZiXHR4bB705cxdRxvfa0pATPaflf2zvRrtjlVt2U1Y9FGZIjZo/8awHQVp
         wSKZUwGd3mH0Ibd0VfHZIxDQPeqWQvUDKWHiat9cCTKGogeqCUpshxmkD4WKzirFfCu/
         HmeMcfp+ZNV1BVXpy+MlgBKXqEjnqZ2SnPbtYiZ0zE2pnjJndIEei83GBaA/gLy3fO8Z
         Ctng==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533QBdJht1Laaws1JHrmydjP1nBr6AQcN86iMpHFdqPgJu6r1v3L
	JljiTUazCFPcSUGdx1oXOjU=
X-Google-Smtp-Source: ABdhPJzli+BOLXUcwHW9P1zLLsPxFsuje81/+sgqYSB0wSckgXSX86mQS1jPN2XCqP2BVk+/NsoIZA==
X-Received: by 2002:a19:7fce:: with SMTP id a197mr3944091lfd.77.1612773966126;
        Mon, 08 Feb 2021 00:46:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6d4:: with SMTP id u20ls3334579lff.1.gmail; Mon, 08
 Feb 2021 00:46:05 -0800 (PST)
X-Received: by 2002:a05:6512:305:: with SMTP id t5mr1507878lfp.350.1612773964961;
        Mon, 08 Feb 2021 00:46:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612773964; cv=none;
        d=google.com; s=arc-20160816;
        b=ShJCc2t/Vs1ND4Fzsbqowh3ep3KwwpQXPRvG6gcox8jDszrX3SbqAZ1e4kPfSNTwJq
         E4sLCqwwIpFIv73WB/jJl0mN+I0aLwZFQdcxIlED2bz5qPIe7OQF/EZP5eZy3aJyS67s
         BuIManv6vWj3tSyebLXBE3ZksNhFzUbk1fzJWAmGtMYUU+Q9ZqklwBEj/3yEuExFaC3Y
         4F07vjl9optjJt9dkYlQfLWpIV/LTcer7ZoDlJCWdNOtn0OUwNIhm4u1q3qnowhuE7qR
         ZMn5QOk5O8fKkSRynwD0C6c16/02RkGhmAiLUwEwyzTAPhVBGcFiR7zoziZBi49YdhP7
         sRug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=NADsLHepAU0iY3deZlYWYXgpwRFvQM7qTSd0sLOIpSA=;
        b=teF5ZPgAujDoIXJb3sLVSzkrWvt+J5FuuO0+0MrpdegvO2wRB11DF9CzvGu7QLGFIs
         8LSwTYQ5fcdR140/uEl52boAMPJoCItG87mHqMRiRjjHnwqXHem+cZx1wcwVG1AgNEPd
         sVjOm6o3mbtij4wklTHd0ppkT8cdE9oi/vdXkbDyPkxBlA9TsCQozENe+jQ0y9kvDUAN
         uNoN0QCEjOzRbnpTDSrJKJuSGYhWL9InnJpxGb5IruPRGUtP9TTy7xE03JhMn0LaeD/i
         QsN8CVBB4PJX/rei2Anm7efLxug6ERYj4b0fSsTdchtmlZcB9ILpB5/VkNcRfWWNULlr
         bq4Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id m17si481477lfg.0.2021.02.08.00.46.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Feb 2021 00:46:04 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 1188k1PV001327
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Feb 2021 09:46:01 +0100
Received: from [139.22.33.193] ([139.22.33.193])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1188k0Jr024156;
	Mon, 8 Feb 2021 09:46:01 +0100
Subject: Re: [PATCH v1 10/23] hypervisor: provide runtime assert() helper for
 DEBUG only
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
 <20210125120044.56794-11-andrea.bastoni@tum.de>
 <26da777c-4140-d916-e8f9-3c86b171f3f5@siemens.com>
 <a3814e9b-ec64-cc51-54fc-2f9fd61d1b34@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <23460976-58f9-67f9-f112-e84f179b8890@siemens.com>
Date: Mon, 8 Feb 2021 09:46:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a3814e9b-ec64-cc51-54fc-2f9fd61d1b34@tum.de>
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

On 07.02.21 14:05, Andrea Bastoni wrote:
> On 07/02/2021 11:20, Jan Kiszka wrote:
>> On 25.01.21 13:00, Andrea Bastoni wrote:
>>> Debugging is enabled by adding CONFIG_DEBUG in config.h
>>>
>>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>>> ---
>>>  hypervisor/include/jailhouse/assert.h | 37 +++++++++++++++++++++++++++
>>>  1 file changed, 37 insertions(+)
>>>  create mode 100644 hypervisor/include/jailhouse/assert.h
>>>
>>> diff --git a/hypervisor/include/jailhouse/assert.h b/hypervisor/include/jailhouse/assert.h
>>> new file mode 100644
>>> index 00000000..eedb1b9f
>>> --- /dev/null
>>> +++ b/hypervisor/include/jailhouse/assert.h
>>> @@ -0,0 +1,37 @@
>>> +/*
>>> + * Runtime assert.
>>> + *
>>> + * Copyright (C) Technical University of Munich, 2020
>>> + *
>>> + * Authors:
>>> + *  Andrea Bastoni <andrea.bastoni@tum.de>
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>>> + * the COPYING file in the top-level directory.
>>> + */
>>> +#ifndef _ASSERT_H
>>> +#define _ASSERT_H
>>> +
>>> +#ifndef CONFIG_DEBUG
>>> +/* runtime assert does nothing in non-debug configurations */
>>> +#define assert(e) do { } while(0)
>>> +
>>> +#else
>>> +extern void __assert_fail(
>>> +		const char *file,
>>> +		unsigned int line,
>>> +		const char *func,
>>> +		const char *expr) __attribute__((noreturn));
>>> +
>>> +#define assert(e) \
>>> +	do { \
>>> +		if (e) { \
>>> +			/* empty */ \
>>> +		} else { \
>>
>> Just if (!(e)) ...
>>
>> Or are you trying to emulate unlikely()?
>>
>>> +			__assert_fail(__FILE__, __LINE__, __FUNCTION__, #e); \
>>
>> assertion_failed(), and underscores aren't really needed.
>>
>> __FUNCTION__ is overkill.
>>
>>> +		} \
>>> +	} while (0)
>>> +
>>> +#endif /* CONFIG_DEBUG */
>>> +
>>> +#endif
>>>
>>
>> I'm including to make assert() work unconditional. People should not
>> throw them mindlessly at the code but really at places where things
>> could go subtly wrong and we better fail in a controlled manner. If
>> assert() worked in debug mode only, the barrier to add it could be too low.
> 
> I agree on not just throwing assert() mindlessly in the code, but I favor the
> use of assert() as specification of a contract that can be checked at runtime.
> 
> If e.g., due to restructuring in other parts of the code you cause a contract to
> be violated, you realize it quickly. In normal cases you want to have the
> assertion only in testing, but, if you have an analysis phase of the code, you
> could automatically transform the assertions into something that can be checked
> at analysis-time.

My argument against runtime contract checks at function entry is the low
complexity of this code. I heard that "you must check all your inputs"
from some safety veterans when they looked at the code and find nothing
like that. But that is nonsense in most cases here specifically for
local functions. And it leads to bad code structuring as well (you start
to avoid factoring out functions as that creates interfaces).

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/23460976-58f9-67f9-f112-e84f179b8890%40siemens.com.
