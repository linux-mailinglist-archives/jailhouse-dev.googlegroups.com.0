Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBEWL76AAMGQEQ456DIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F4D31247C
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Feb 2021 14:05:23 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id k5sf6423906lfo.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Feb 2021 05:05:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612703123; cv=pass;
        d=google.com; s=arc-20160816;
        b=r+2KTzcBiyuYYNo9ZALsyAWJSjH1yyKyV+x+TzXk4tWx/t2q9v+/VWe01dGz0JuB/s
         PPZ4gha9oDv1RJ01UG5eQ3DBvQWc6ulu+CNSkvHUder9jI6EBXGpwmkcYKRi+4myFBwU
         7CKZZgE5DyLyHMp7zhwzurTunUbZ1fwRUgxH1Ht8jfeXHTmW/7YmBrFV4AbaHkp+j4fq
         R+uMUdD3QtKViY6YesiJNkltHLe+zZCT0ENhtxLG+yo8fMT8clHfBo41GVmuYz4eaFRU
         aWo6pcHswcL5H/2VkvW8wirOgZ9/ZrGIs/nANgt7OziDsjiyhMZ7AkDok1W6qDwTnYiW
         6/pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=Yls4SXaMAzz1H52GyhtGim0j1zwzOn3w57nKKj7YXtU=;
        b=G3fWP8TrMGwKBR463bH+8781lF4d4qQH+LW2uj0G5/ZiaSIWGmXpKDFuU4x/7hRHpl
         aa9+18m6TjezsOhYJXvIzyTTx54LBMBWdJiMPxUetFuHHqDF7w6e5n9xUNFhRRVvmTBW
         Y5m2UTfDuFq3kPQml/4QYgjkocStUFlgjNyI6uzMADcMGc+DmkBsY61F78bHgEfgdNZD
         0u0gtGEzx3gFAOLvDcWBFEHwDvwoOPSt6h3z/CCHfeC7QCUNMllyFL+CwGBrGmdzHeeU
         RNOuPu7r02v1DRfI/MdHsysXbuGFgd/QLmr6ywHil4xYSYngA+LJa7zrX2Kh+oQaBY+s
         yqBw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=RAH80XeL;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Yls4SXaMAzz1H52GyhtGim0j1zwzOn3w57nKKj7YXtU=;
        b=CbmKgSGAVNhbPUidhndU6Z1LyUwqIPq3pqJBI0pfA1Ul6ZE1vFcauzev6bPE5oDaih
         0GfAP1LeQp2QQvEyBa3zE5SvxjmQLW902WbrhfRB/MNZNPsGuznZqUbTh9+H1SY1/2gV
         f/DDqDlNXTM9aPVdSw7DX3ssKpGNRT5N06sryJZSUkFcjGlzkxz0unAihYGKj6uxUcXS
         t6S2xUaUShHbGJd7qN1h1a9+mWwXonI7MjCyJdUsGJbWJPgEolb5dFkdA59HRs0GFH1t
         PeO8mSmoTyQzHtjXp6rLpWRwrrDW3sJOy9LNZ0G9hyrFcIi4KNJ8hxwpOq3WoxcfTH59
         U9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Yls4SXaMAzz1H52GyhtGim0j1zwzOn3w57nKKj7YXtU=;
        b=Da7/jEE4h5bGoenYI5JHh6mvw0eWPyYlRakhzpBsnrARIwGeSoBMIdU09SJM7aFtQi
         eBVy2DlZMJe/N+X7yGarss5bEYbh8mIGNdeNA1pdOmLbxsjuZVuNzEqRYgRzjxIgURpO
         AiVlWV+zJB38B2Gahq9qzkX/0A5P33Ez3IdHeEebJe61NLcN+utqf4YMBEvuNQB/lgka
         jtq1zxPazJuBipI4EYmGjwT54LditR3OS/aIn3KZ2XJtuXUukvYlDiI3oI4a9rNAJz2a
         JEMrjHSkxcHDEQxL62R7idRdfGTMQEdrVEM30V3J4zJrg9Akb2E9gq1joxhMSMQc5SJT
         4sqQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Czw38BqXx5cJSpcoYZ9jzkBs1xRWLnLvvtTSHZw36+NkusNqe
	uW+69MalJcl9pF3r9LIh5ZY=
X-Google-Smtp-Source: ABdhPJxghmzqVmKFHYMt0IHtw6fQKFC4CMu5CtluR/5EfGNKT9IXO8Pa5u6iR0yOVs5Le8pVjlUcqQ==
X-Received: by 2002:a2e:9b90:: with SMTP id z16mr156060lji.168.1612703123051;
        Sun, 07 Feb 2021 05:05:23 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:97c5:: with SMTP id m5ls2365459ljj.10.gmail; Sun, 07 Feb
 2021 05:05:22 -0800 (PST)
X-Received: by 2002:a2e:b8c7:: with SMTP id s7mr7495348ljp.397.1612703122118;
        Sun, 07 Feb 2021 05:05:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612703122; cv=none;
        d=google.com; s=arc-20160816;
        b=BOGriSwtjUZaLy5OuYzHvFgKeueiyKnBQ4p2NSsRZQfRJiaFcGdATrBfqVB6Ud8KoR
         xd5mEZLEvh9G44EyVF+h/1PsfBzYFEtaVgnzDpNna7mD8yXJWZ1Zc59wJeqnvXuLZnnU
         zb0psizRHmx5FWbduC9+0zJn6cXTmwMWDwZZ8uGJph2/cXwZrJGf3R3kndw3Dv5prSbh
         BIBo4eKcTDlpItxQapmYT4BXyGRrQJjDxFAvwetkXN5ZLq6hHnwIpauz/wdbm6xeYMKc
         roIlTMdY8mm1PB4aNetCXw/iEoCKpWyEC5TIesCnccxR/JG4IDgBOqATCgHadlAIH1UI
         WlRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=zzGFWrkViDV2xwrjxz0E1Huussf86hsMIL496aFO504=;
        b=c0YhZAag89N8zJ+DRZqy0G/hVd7beXbQXd13a/eZ/j87hS9f8e+F/VihRXOgsTo9Ds
         +IbnB619zzIbr6Yi6rrV4cnSs6fJMgGERIwO47zmILIUnmovJrMp/ttV4RTRaETuZywI
         cXOsHA4VMHVfv9gMeq19DetgwYClkqMyDx9D3t97nX7EXkmK4dONe4NxKAdTFoyGbbuO
         fbfqXIJDpNYb+dKFKUOZNh/vaggI91VCv1Er6VokVLx+LAHSUrOHwQv8Xwdq0I7/inQs
         bPGVW7ff7gSsehUAp0DphRcuoCy4acgs0MkmbIdyyLIs/Tu7MLsbGn5BbMOaPjJgexhh
         fqsA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=RAH80XeL;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id b4si57409lfp.11.2021.02.07.05.05.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 05:05:22 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DYTsY34LKzyWZ;
	Sun,  7 Feb 2021 14:05:21 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.874
X-Spam-Level: 
X-Spam-Status: No, score=-2.874 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	NICE_REPLY_A=-0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id gMlSHxu01OFj; Sun,  7 Feb 2021 14:05:04 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DYTsC6CPCzyVh;
	Sun,  7 Feb 2021 14:05:03 +0100 (CET)
Subject: Re: [PATCH v1 10/23] hypervisor: provide runtime assert() helper for
 DEBUG only
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
 <20210125120044.56794-11-andrea.bastoni@tum.de>
 <26da777c-4140-d916-e8f9-3c86b171f3f5@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <a3814e9b-ec64-cc51-54fc-2f9fd61d1b34@tum.de>
Date: Sun, 7 Feb 2021 14:05:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <26da777c-4140-d916-e8f9-3c86b171f3f5@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=RAH80XeL;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

On 07/02/2021 11:20, Jan Kiszka wrote:
> On 25.01.21 13:00, Andrea Bastoni wrote:
>> Debugging is enabled by adding CONFIG_DEBUG in config.h
>>
>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>> ---
>>  hypervisor/include/jailhouse/assert.h | 37 +++++++++++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>  create mode 100644 hypervisor/include/jailhouse/assert.h
>>
>> diff --git a/hypervisor/include/jailhouse/assert.h b/hypervisor/include/jailhouse/assert.h
>> new file mode 100644
>> index 00000000..eedb1b9f
>> --- /dev/null
>> +++ b/hypervisor/include/jailhouse/assert.h
>> @@ -0,0 +1,37 @@
>> +/*
>> + * Runtime assert.
>> + *
>> + * Copyright (C) Technical University of Munich, 2020
>> + *
>> + * Authors:
>> + *  Andrea Bastoni <andrea.bastoni@tum.de>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + */
>> +#ifndef _ASSERT_H
>> +#define _ASSERT_H
>> +
>> +#ifndef CONFIG_DEBUG
>> +/* runtime assert does nothing in non-debug configurations */
>> +#define assert(e) do { } while(0)
>> +
>> +#else
>> +extern void __assert_fail(
>> +		const char *file,
>> +		unsigned int line,
>> +		const char *func,
>> +		const char *expr) __attribute__((noreturn));
>> +
>> +#define assert(e) \
>> +	do { \
>> +		if (e) { \
>> +			/* empty */ \
>> +		} else { \
> 
> Just if (!(e)) ...
> 
> Or are you trying to emulate unlikely()?
> 
>> +			__assert_fail(__FILE__, __LINE__, __FUNCTION__, #e); \
> 
> assertion_failed(), and underscores aren't really needed.
> 
> __FUNCTION__ is overkill.
> 
>> +		} \
>> +	} while (0)
>> +
>> +#endif /* CONFIG_DEBUG */
>> +
>> +#endif
>>
> 
> I'm including to make assert() work unconditional. People should not
> throw them mindlessly at the code but really at places where things
> could go subtly wrong and we better fail in a controlled manner. If
> assert() worked in debug mode only, the barrier to add it could be too low.

I agree on not just throwing assert() mindlessly in the code, but I favor the
use of assert() as specification of a contract that can be checked at runtime.

If e.g., due to restructuring in other parts of the code you cause a contract to
be violated, you realize it quickly. In normal cases you want to have the
assertion only in testing, but, if you have an analysis phase of the code, you
could automatically transform the assertions into something that can be checked
at analysis-time.

> 
> Also, it would permit true BUG() == assert(0).
> 
> Jan
> 

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a3814e9b-ec64-cc51-54fc-2f9fd61d1b34%40tum.de.
