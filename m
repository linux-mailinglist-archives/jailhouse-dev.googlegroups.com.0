Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBLUO37TAKGQE7GYEHRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BCE1AAF8
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 09:11:43 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id v5sf6829498wrn.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 00:11:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557645102; cv=pass;
        d=google.com; s=arc-20160816;
        b=fa612hWCaICJ+4RfK+BWB7JCQTqfJEAXe4pJRPnPZIMbkAwBncXyDr71F597tQt0Gm
         R0FbuuLfKYEbd0d0jBk0abJ83a80ThzIPMPrK/gVEwWKkPXxFcZSjafygN+cHGYJxytP
         M5gtZ5e/q4vEunzHmgGCy2fEOzZ6eveuiXaOFgrZ81VmHeQb0dvNvSBOl/nsfFYrCHGa
         F6pGyvXsEAUQ8HvcHDPvBkZ0kf1Mc6kkJJHjraLHKhHZRPvW6G5Z8L/y3ncYAcMFM8bl
         K0b7gJJaGJV1JbeNWpqBvN+vj0BR57d4S+2JqkWq8o71LowZ/ugynqygFiK4+kDktPSx
         Cbrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=QC6evaaXyxjcUUOOjAAMOpPwDKVHNAP9Esuq4G68BRM=;
        b=cuq7460S/1dlBL3NvXMKyCrtaqwIAYLdUMtQjMvfanxYOROsNfxBtzqaSXAtarSc0W
         WGDIoB3Jt9CcoVU7U6VR4ra6RdXUIelPZU8fa+qNq4hPWRUk8Xsh2ptfVQC1nXSEgKCM
         jGOQKACw1tjpGkbU9c2Fd8VRnWf+4wTWKBHfeg8GZNuBiolkjdsPL1T6QD9rO3cqp33E
         /d+kNNXcYjtIB4m/OGVuqfeTyWW8WFI3saP8bMvQ4ezU8vAt1BmbZG4nwoy+wvh3dd7t
         I7BP1I4ZOjayPRvpwm9qleTfhDjxrawU0PPbtOjRNlqis5tiBzo2RLzxfgxPUuxJD9UY
         m4ug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cqT1f84H;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QC6evaaXyxjcUUOOjAAMOpPwDKVHNAP9Esuq4G68BRM=;
        b=iuhGGXHCG7Jy0gouu/dqI2u7OvUQwCqNfCdcrCL0u7G0rn5aRJavNciiY8S8GSB5DL
         os3/o12RtwkHGeGAf/NlHBZDkwbnqVkcQ4Bayk3FURx38ymlYmRbefGnkITzlgoJ+YJW
         Mh0gfsZdVsYYv2EtR1KxTre2SQTtqF2P9XEGUqfr3CijOrRQZfD+SxDz9sQ6gVNOiQn2
         4HopTsUZXJaJt45feU/Ch/egD1wIkwJbsJW0LwMNkrMMnsTkWLPd1zsjPTpHUJbGWkje
         gmD72L0qc3hY5XK/o4vQLxZC1js2Dg5thk9b9Yo97xlWO6wGhf6J3auTkH0twup7Avi8
         Nl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QC6evaaXyxjcUUOOjAAMOpPwDKVHNAP9Esuq4G68BRM=;
        b=JUNzLlYVbQp/U00/ceGokgOqcJw0Hc9IwX3FnXmek4W+JQd/9LR5ci8YxJGkJ5YODm
         M8AeaW06jUURS1N7tJQFEfdi+1T7Nhxxdw+87kWqdQhfowLqzzcIuuiJ6UhecdETC7/7
         O1AyJXaLIYE8hDrELmdgLQbo/pY6SnCV7zKIww4tQoBVAjM6Q0YA8VQV4jmE8t4FeKvC
         WnkmQ7lc0rB/nnW9aQlGPmwh980/7Cwl8Frcd0w9J3UAQidKrNVDYVByabm54scm7WGZ
         Q0kmscR0qRGWCRBzNfk0zxpYNTxWMFSDe2UFz9aJbNmBIaHKA/n7E7yEq2ywqQgaGrUd
         eoSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVW5zgwSNxPI/TsAxWg0HMxIVEtoGBuaj0PPhYUZdGmQNTqtZmL
	EFy4rMbxmLONOhRTAveOz7c=
X-Google-Smtp-Source: APXvYqz7VF7EdC17A4XG5/j1unCb681TYhaPct1cg4MDkq7fH+C91xNTH09p1Gc0av+suVJOy/V6Jw==
X-Received: by 2002:a5d:624f:: with SMTP id m15mr4316383wrv.102.1557645102794;
        Sun, 12 May 2019 00:11:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5186:: with SMTP id k6ls2350129wrv.12.gmail; Sun, 12 May
 2019 00:11:41 -0700 (PDT)
X-Received: by 2002:a5d:6912:: with SMTP id t18mr1525541wru.17.1557645101961;
        Sun, 12 May 2019 00:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557645101; cv=none;
        d=google.com; s=arc-20160816;
        b=LBZehOI6U7ipJRkyZgSlpL9Cp+XtYMY5MQDT7wJ5KWjUl8ie3kZF/xYg8yF/bw62Yi
         mtOs6XWAxpB6gAHSE+K31tWRYytwGwlH1VKDSsoLhIyROY2rt6WxErbJ589uQ2YTdkz5
         owQ2b9kRJNhL+4SdmnLAKaBT+Ns78GUdfZ6TCsG09NDKsE9hwEcfwDnEnTii3PKHhGfW
         lLwcunkfoEBGUxg7rU2QVYdYsmiJlIMNxBxId2fw0jl8V0P9GRsS+BMoLnnNRHlvUVWk
         L3UUjV727wD5DbukIXeNGDPYJcydEyx2QJpHugxefNOzJ8g0U7umx5RdZc8b4y1rDjXC
         n32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=ev7DS6OIGdVqsswhZHR7mPFQGTbEO05cV1M8CAf0fyM=;
        b=lmfnlJvdsimTT3kGM9quMGObq6ThsoB+WtgWXJ/1dkk4HVUtM8ozy3RGkAy372Zzuy
         d56OYxXtz/ChZPEjHcj/TdWdt04b+FxDk/50UtBNM7tDZYNtVjZBrKpEpFLMza0jeh2u
         KdtZ0a32T9qZx6RJCVM9qecF7tWLA2DQCFVHR39qjWGUx2jyxGgrxUPWYBcRdQ0gDE2R
         F8rwbysTHc3iNQo7Qjit1Gl92xByIVIYZlNHdTLumUOliA1VrzS6kjMtbj9aC21ypU7H
         CyAb2NgarymcoWfimyyWlBByLv+/XZuDvp5jNYvJl7XxZRL3U+Sr8rr9mFz4Dey0hOsv
         VpTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cqT1f84H;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id u2si2423644wri.2.2019.05.12.00.11.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 00:11:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M9oaG-1halFt1Lei-00B3HY; Sun, 12
 May 2019 09:11:41 +0200
Subject: Re: [PATCH] inmates: x86: AMD: use the correct vmmcall instruction
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190507125229.29432-1-ralf.ramsauer@oth-regensburg.de>
 <356bd7bb-6784-820a-fe77-f7ef1584d6fa@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <ee47159d-4ea2-5a75-1bcc-c978b2ac74b2@web.de>
Date: Sun, 12 May 2019 09:11:40 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <356bd7bb-6784-820a-fe77-f7ef1584d6fa@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:mj+SXfUSBON6ZzKpRdKRZ5vhKyIkrL+Fcvi8/k0+8BdWUeqmxxk
 J5uZxSCNE+TYZIl4bfsieeBAiLdiZcy07jQ7muIe8FpOKsnvDbkTq8cxmzfTQmNsHPY8XJy
 +M1f9aG1aaFf+OKN/Ge79OZCsYIVgRHcY9MqhaFU5aEEAC4T+NtDPkFsouyQhL5AF6L+wt6
 pqrQnFKD1xTsYBGhw75FQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:d1vOpnw0fns=:lR9HaUYPj03/dUfDR4wDfZ
 LVyAgjQvWb/e/998eeYUE4nN/BSzVC64CFWZJxP1sUaLVnjyyAQXYZKrtsAL7surQeg/4rHC1
 uMnvKPtg/o0c0TQ2t7UrzS5c1YYXryG627cn+zdfp2Pj0eomhUf+8W6okV9pkQp3wTB2TAZ5e
 eVq9b0X0h8FZSRMf+V3gYQns0vwb3eHTj8Ze8Rze5VKykbl1ZlB5DsmswXPxcvbdBoPbAT70X
 oJXgTOO/Gi775BLMmbmufiOsKWpJ0vXxfUkxNZ+jkBQ2BZx9Whu+k6j+QI6gypX43qTPb8N6j
 fU8cqCNYMHRlFClCtcmhlhzLeBS2Ehyx8kFd/n55KOzkP/Z8skEYKPIzkTrBPbnmoMoiLzXEM
 tZ4mAuz+xYz1NaDV/NoPHXeOw8KwwAunfnPnV52hTsUrgX7k7lbA868k3RYs99XYAyXNfqD+0
 vFa41rl4B72MQiWTMelB+c2RMfXy2hwmRyevcWs6cUKEbsC0E5BJP3/d6N62k46XK4XxOrQPi
 sqFZIdJ5pBuJuXJRB/NmJREJKTVcbc79Ep0p06dxckTWdwdOJhGHrC0RUYPnJ8tOS0JXoy6tH
 lAz/bQ6BAon11XWryA4FMBmAbRKm+DWQsi7B5f3t3zlJXv/mpw1d2N+JKt+Jle745ZMLZiP1A
 z0edQf2IF2PG4xc2XdjUvD0Py8oC/bmbqF34f+9gzEFBOJefGj4E8HwApQ9RGCABbrcDKQJMq
 Wzu1nRsgm6/a5WA66lzP8lFsNX8tQ5upPfqfEkznoYI3uZKAte+EZSGz7NMsfTSUzloXjR2d3
 Ar24Gam7HEAKkH7ahYuMGoO3yRZrRTygLTDJDi5XPLNNK/2x+zL1dH0YhrANqOjPMIM9u+KHX
 6MS0CDWspPGkzXhUuENurrbfuv7qAdryHrNHNkD5CTafolWSqQ1ExNoQTHeAMowVzjfuLJNIN
 33Xk/9nXs+w==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=cqT1f84H;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 07.05.19 15:06, Ralf Ramsauer wrote:
>
>
> On 5/7/19 2:52 PM, Ralf Ramsauer wrote:
>> I silently broke AMD inmates a while ago.
>>
>> In 4d6eb915ca78, I removed the call of hypercall_init() without
>> reintroducing it at the right location again. No one noticed so far, as
>> the bug (crash of the cell due to a wrong instruction) only happens on
>> AMD machines only if they use the virtual debugging console.
>>
>> Instead of calling hypercall_init() somewhere inside printk, let's move
>> it to setup.c, as we now have a arch_init_early() routine, which is the
>> right place for these kind of initialisations.
>>
>> Also remove X86_FEATURE_VMX, it was never used.
>>
>> Fixes: 4d6eb915ca78e ("inmates: x86: Use virtual console as additional console")
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>   inmates/lib/x86/Makefile    |  2 +-
>>   inmates/lib/x86/hypercall.c | 61 -------------------------------------
>>   inmates/lib/x86/setup.c     | 20 +++++++++++-
>>   3 files changed, 20 insertions(+), 63 deletions(-)
>>   delete mode 100644 inmates/lib/x86/hypercall.c
>>
>> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
>> index 15db65f8..97a37341 100644
>> --- a/inmates/lib/x86/Makefile
>> +++ b/inmates/lib/x86/Makefile
>> @@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
>>
>>   always := lib.a lib32.a
>>
>> -TARGETS := header.o hypercall.o ioapic.o printk.o setup.o smp.o uart.o
>> +TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o
>>   TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
>>   TARGETS += ../uart-8250.o ../printk.o
>>   TARGETS_64_ONLY := int.o mem.o pci.o timing.o
>> diff --git a/inmates/lib/x86/hypercall.c b/inmates/lib/x86/hypercall.c
>> deleted file mode 100644
>> index fc5cd5ac..00000000
>> --- a/inmates/lib/x86/hypercall.c
>> +++ /dev/null
>> @@ -1,61 +0,0 @@
>> -/*
>> - * Jailhouse, a Linux-based partitioning hypervisor
>> - *
>> - * Copyright (c) Valentine Sinitsyn, 2014
>> - *
>> - * Authors:
>> - *  Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
>> - *
>> - * This work is licensed under the terms of the GNU GPL, version 2.  See
>> - * the COPYING file in the top-level directory.
>> - *
>> - * Alternatively, you can use or redistribute this file under the following
>> - * BSD license:
>> - *
>> - * Redistribution and use in source and binary forms, with or without
>> - * modification, are permitted provided that the following conditions
>> - * are met:
>> - *
>> - * 1. Redistributions of source code must retain the above copyright
>> - *    notice, this list of conditions and the following disclaimer.
>> - *
>> - * 2. Redistributions in binary form must reproduce the above copyright
>> - *    notice, this list of conditions and the following disclaimer in the
>> - *    documentation and/or other materials provided with the distribution.
>> - *
>> - * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
>> - * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
>> - * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
>> - * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
>> - * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
>> - * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
>> - * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
>> - * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
>> - * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
>> - * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
>> - * THE POSSIBILITY OF SUCH DAMAGE.
>> - */
>> -
>> -#include <inmate.h>
>> -
>> -#define X86_FEATURE_VMX		(1 << 5)
>> -
>> -bool jailhouse_use_vmcall = true;
>> -
>> -#define AUTHENTIC_AMD(n)	(((const u32 *)"AuthenticAMD")[n])
>> -
>> -void hypercall_init(void)
>> -{
>> -	u32 eax, ebx, ecx, edx;
>> -
>> -	asm volatile("cpuid"
>> -		: "=a" (eax), "=b" (ebx), "=c" (ecx), "=d" (edx)
>> -		: "a" (0)
>> -		: "memory"
>> -	);
>> -
>> -	if (ebx == AUTHENTIC_AMD(0) &&
>> -	    edx == AUTHENTIC_AMD(1) &&
>> -	    ecx == AUTHENTIC_AMD(2))
>> -		jailhouse_use_vmcall = false;
>> -}
>> diff --git a/inmates/lib/x86/setup.c b/inmates/lib/x86/setup.c
>> index f79fd736..869e0962 100644
>> --- a/inmates/lib/x86/setup.c
>> +++ b/inmates/lib/x86/setup.c
>> @@ -1,10 +1,12 @@
>>   /*
>>    * Jailhouse, a Linux-based partitioning hypervisor
>>    *
>> - * Copyright (c) OTH Regensburg, 2018
>> + * Copyright (c) OTH Regensburg, 2018-2019
>> + * Copyright (c) Valentine Sinitsyn, 2014
>>    *
>>    * Authors:
>>    *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> + *  Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
>>    *
>>    * This work is licensed under the terms of the GNU GPL, version 2.  See
>>    * the COPYING file in the top-level directory.
>> @@ -38,6 +40,22 @@
>>
>>   #include <inmate.h>
>>
>> +#define AUTHENTIC_AMD(n)	(((const u32 *)"AuthenticAMD")[n])
>> +
>> +bool jailhouse_use_vmcall = true;
>> +
>>   void arch_init_early(void)
>>   {
>> +	u32 eax, ebx, ecx, edx;
>> +
>> +	asm volatile("cpuid"
>> +		: "=a" (eax), "=b" (ebx), "=c" (ecx), "=d" (edx)
>> +		: "a" (0)
>> +		: "memory"
>> +	);
>> +
>> +	if (ebx == AUTHENTIC_AMD(0) &&
>> +	    edx == AUTHENTIC_AMD(1) &&
>> +	    ecx == AUTHENTIC_AMD(2))
>> +		jailhouse_use_vmcall = false;
>>   }
>
> Forgot to remove hypercall_init from inmate.h. I can send a v2, if needed.
>
> diff --git a/inmates/lib/x86/include/inmate.h
> b/inmates/lib/x86/include/inmate.h
>
> index 5fe4e102..b6bc6145 100644
>
>
> --- a/inmates/lib/x86/include/inmate.h
>
>
> +++ b/inmates/lib/x86/include/inmate.h
>
>
> @@ -235,8 +235,6 @@ void ioapic_pin_set_vector(unsigned int pin,
>
>
>                             enum ioapic_trigger_mode trigger_mode,
>                             unsigned int vector);
>
> -void hypercall_init(void);
>
>
> -
>
>
>   unsigned long pm_timer_read(void);
>
>   unsigned long tsc_read_ns(void);
>

Thanks, merged with this addition.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ee47159d-4ea2-5a75-1bcc-c978b2ac74b2%40web.de.
For more options, visit https://groups.google.com/d/optout.
