Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBKVD6DTAKGQEDCBRTHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C341F55B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 15:18:34 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id g36sf3842444edg.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 06:18:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557926314; cv=pass;
        d=google.com; s=arc-20160816;
        b=sHz1Zml+/8vZ6CLihscLBdVSzrk6ZAlgVsHheGtXjAd+ckqrbmkEVpqBHgBu5/zBDS
         PwfmwHGZ5S1/3cDh1qQKkJ4ANXiENlmxaZ0Cf0f6uHM+nVcBjrdilH2zH3SCnu30WTpM
         61yjWyayBliKWTml8pmN8cBH3bcwlPP/L3eAbdBKGjf380RtXqiUG9FEeOu5jJ7z05fv
         K20ZjBDz5eKfhxZqR+HBkLsoznaMvK+3XwlacCpKffBg9jADPMHgolB7mLMaU0aM4+HN
         bviEWF7SuqeEHl7v/ROl+aXB0MaMZ5iAPkHwE2LIrTd2dd49Dhlxqg8MsR4QXO/SmB6C
         oyMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=0zjo8CoIeMZM5uzGksv76YOmuNtmzwnAXUMlq5nQUf8=;
        b=rcjDvkU+EESDgN3/p6YNyNh1qWfK1IKp+fyMHwCUKbMSBRbDKHh5SLPdTIPHpvsrzG
         VZWxt8CQY91Se3xU4wHrdZeFuRxHooO1Kxy6/imlJbzuiSTLRZlSO6ckVqYey2Qz9LHb
         IZdZOj052XnhqpkRnmqkE0KVoEcWsK55+7jPhFKSDhVyl0TljLknHJl+qp8uL7FdTLxc
         Mvq4tzDc+5m7nhbOQlBikt12YpnFGpUTVRrd5QwM06dypvzuPBcA6pxxX6qOr/SOzSrX
         KIe+wgaRj5JZvCGY8R1mLHa7CltgyEA6aSaeOg+km/JbPL16fe+sE/3+phjMwhEP0Mdq
         D/3w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=kzrLEhwO;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0zjo8CoIeMZM5uzGksv76YOmuNtmzwnAXUMlq5nQUf8=;
        b=mhEdZkJbFqqqcjMfPu+Mp27cbm5ujYKrjQZ7Eoe2QSlTe406JO/GSUVd6aENtoeHEx
         0LbUPYIA1K9Vf8L57ljyAo+WgXZR9If97hRSwyJK7UOYjNx643ugO4p8Lekz7XuIMWVC
         OgowQLCSlVDPOtuiPuBjFCG0oHakCt0UBQTxVG6PAv++gUt1GPNp1Vq8/ab6Qpx/iePA
         R+L0uI+oy4VLZyLIOOpLAaXodGMrqA9bHaX/D9T4F8XoDYhcc7ltzcjrmQTrQwh/3rkh
         muFVDA9Unc1irmWWOGhZzZh9LrKYAQU47b8J//qO87MsW9kWD1z9QKbGA/Hkgxqz+tgI
         4k8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=0zjo8CoIeMZM5uzGksv76YOmuNtmzwnAXUMlq5nQUf8=;
        b=eWIocPwUWQjZarlBwvPuo8H7dSVDA9RZxGy5eoJNmIKoMbV+8CJtx7li7ZjLfM+mWB
         LGx2PjWadgFfUTZPtHFGlzVdmk5I8mbQSs2wnIUJbXsE5fkTdBRGCdgPQA0WM6S0NsHG
         b5TYirhWxj2i/jwXFFjIVJFgsBK3oO/Z0e5T0s9+CAKndRRN7NYzfmJt5Gpl0aB36Fm1
         rI7rfLhHC0vPL/YFH0C+MH2t/8QOiFy9UozyaUovctEZFD60LdlPB8Uk+mrUM05kACbS
         f2VfOM+kuT0XE2Fv0cgc8vU6KtP/o6ZvJ73u0uc9BFLhORPO5hdbHJJu4Oz090Myg2q1
         IxQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXxj2coqhuomxmlxFlH00nDwoVZw2wLUXgFenEgR/vLobksNZed
	v8c+w7UWeBiycK7PIcs2kUw=
X-Google-Smtp-Source: APXvYqxeoSKrTRSyVOC94w2vo+t53/q+gtomDIEDRNMvI8ZcRx0TKwHqdFK5i1l67YTRBKdvHt37bw==
X-Received: by 2002:aa7:d711:: with SMTP id t17mr43261027edq.80.1557926314486;
        Wed, 15 May 2019 06:18:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:a501:: with SMTP id y1ls740465edb.9.gmail; Wed, 15 May
 2019 06:18:34 -0700 (PDT)
X-Received: by 2002:a50:99ca:: with SMTP id n10mr43276924edb.279.1557926313940;
        Wed, 15 May 2019 06:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557926313; cv=none;
        d=google.com; s=arc-20160816;
        b=KGJEBYnUswiCAixMpLcqL8YvIr5kOVPO7XIhoVDCLVpiOWeYEx4xFy9LoitmPgdM4S
         MVaZjEvWMroaTvejs325QZRTY+TfAGoNEaexmFX3ZstOvgc5An6AG2dKJAXGeNJkF2Gq
         QUB8KaaDWqWeiPivWv+C8DI1azlfbba5B1aM1/D7BJ8Zq1PWfF+vdLoE+4oIGX/P41mq
         33EtJDUnTC3Z8WakuB8Ai5Ysy/bthaMMzcIz1J5dyrcd0ZIMLCm3Jbd/eXqpEoBLxIC7
         fRaG7kR20axt536b/Xqq/kZg+su9RxPoWFfc1mwtjsvuF2njvR5FEt/RWVo4a7xtP2mR
         8u9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=J55z2zSff4+bRiJWtlOkUrg0EkEuvrTDpbU5ULQTEb0=;
        b=BSMeLYbRjYoi/nWdO3WHESzc6TFGh1VFe2lkZNTAcnquD7LKK2efYjS6TWoeKd4+7c
         aj5+hgZXZzjEyMPAVpF7EDFGK1oilbXxC7ueAeADRhdvBydZXoVdxKYh0fiZHFopgbMC
         wXC3A7ZCQ1AMbEqaaS6U756QsGIxdAfcPOPSRRPr6PbR6MxjpR2ZSTyMe5JgXhoopeYn
         yVi7RAF6yVJgbApTItqwMqwY5ZcjMhiS5O5K4zooCbiMqCCp0L4kFbY4VD/Nuac5aZmq
         no3HEpXi0a+mopOowLRN+5BPGsjJ/GrdFs0u3dxIQUvJs2ujZv6yRipO4B72Evxo8do6
         +Q8w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=kzrLEhwO;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id t36si330837edb.0.2019.05.15.06.18.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 06:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M3jof-1gaaAC15Zx-00rIwY; Wed, 15
 May 2019 15:18:33 +0200
Subject: Re: [PATCH 5/5] inmates: x86: Catch and report exceptions
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <cover.1557914551.git.jan.kiszka@web.de>
 <69941a22af559b8e3afc7cf078cf774e4593f79e.1557914551.git.jan.kiszka@web.de>
 <71db9659-843c-2e6d-93a8-09eea149b8b7@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <3dcf8dcf-a0fb-0b77-eb0a-a0364a957b0d@web.de>
Date: Wed, 15 May 2019 15:18:31 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <71db9659-843c-2e6d-93a8-09eea149b8b7@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:XSNqfZSOz360Ev3kycSfkOvbe6vYbCBUpVGRyspz1zTv9744gJg
 pydS/k60a50W8bJea7Rchs3b9hKM0JGLUQ8g0B38RBkrqRxTidWaM2RHrgjPeIspqPPVOCP
 cNIIpPgkQQQ21Lzgs3ez430KLlmAOsVrlCYcCHs3jedAJ3hkGwUuKN8Q0AVUsjbd7WQoiUv
 DI0XiSX+zhDXTu0eVpelA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ruJTId71y30=:hxxb8F9OgBCjyxcKYYHf0Z
 8zHqCaDt2LVQhITpUpep4QMe+I8bfrLYsfjDcXr1/rZ7wz52u/6Pzzva9j/qDI5+60mM8m62o
 /F9ouPRHQ9Gs458EeFFrGVqhG9blBg4A4A9mZKJUeXxAHHOmJz7+J5TMND3SC7GEx9gNID5d0
 k9RWvCa0qI7rk1+Ob/8m69G8/FtSeQ4Jo4Yrck4rXBU34/ZfYR9r0jGzLbSaMwBZDFXAatDkD
 8+T4KbHq5A5fUSPavHC89Undwj/NwLC1H4lJTs0Rbck/njckDSV42CWszalUPtXU0390nNvhZ
 8NMGBk+wj2KXWIzUHCO3J3PPOlrd6cf7YjoztnVXNAqIZvSKXP3/J3mjLCnphBVhb7voX40cp
 cNGRmSh8M2KjBpl2ieXOomVAwWmXeoQKRrUqTj+A5TliT+5MH2kJIv/ljI9L7RrXvmkYQCZIp
 eQOaOj25MWT2DQhnfqkzMZRwuZxr1F8fOHTiMzb8da4i64BiLwooBrFbNPU3DQfnM+YoUMLTd
 cBnqHeP/tITm29+N/o0Sxnk/rYS5NVYNUaEEkBGVTQmHmzdquQPt9CFib/dajy14v7RrtRPxu
 VD7P334YTxN91yxxiJoLtpy7dek4GYRKhfml7DYkHrawau3mm4dOm0HwxsNsI/hrYL/pJZEco
 bRJF051/WNCH8TqiKisVVDEYgVn3rlxv7ZCb6rfmvx5thIEEOkztLbWZ/Vdc2hhLXXtLo5ZTr
 vc0CO5jhD43KjpJ3SLR5GRdQOVjS1xe2rYHqLjSwmmozoYkiMc3RYcoqyGflw6f1JqM7mA0oR
 kAZEl7d/wtxQ+fHJ4Vcy/Nn8sbQz1JlzSd/+7saSp5D0lVIgeXpKHo3fL4yEH17EDNUe5Fbu8
 r7DGNlTFnMLqUixMAIG6tTfNShEahOtpqZ5Go5gui3pjcy8oYwksR2JXqA6LnRJIku2uZot4V
 mi81OPnD0Hw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=kzrLEhwO;       spf=pass
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

On 15.05.19 14:48, Ralf Ramsauer wrote:
> Hi Jan,
>
> On 5/15/19 12:02 PM, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Add basic reporting of exceptions that are triggered by an inmate so
>> that we stop translating all of them into hypervisor-caught triple
>> faults. Reporting is optional and need to be enabled explicitly by an
>> inmate via excp_reporting_init().
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>   inmates/lib/x86/Makefile         |   2 +-
>>   inmates/lib/x86/excp.c           | 165 +++++++++++++++++++++++++++++++++++++++
>>   inmates/lib/x86/include/inmate.h |   2 +
>>   3 files changed, 168 insertions(+), 1 deletion(-)
>>   create mode 100644 inmates/lib/x86/excp.c
>>
>> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
>> index dc017b90..258eed18 100644
>> --- a/inmates/lib/x86/Makefile
>> +++ b/inmates/lib/x86/Makefile
>> @@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
>>
>>   always := lib.a lib32.a
>>
>> -TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o int.o
>> +TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o int.o excp.o
>
> excp.o is shared across 32 and 64 bit, and uses printk.
>
>    - Compiler might produce unsupported instructions in excp.o (as we had
>      before with SSE/AVX). In this case, the handlers won't help.
>
>    - If unsupported, and if we crash early, we also don't know if the
>      compiler produces SSE instructions for printk.o. So even if we
>      supress SSE for excp.o, it's very likely that there's some SSE stuff
>      inside printk.o, which will let us double fail.
>

That's the classic dilemma: how do you debug a debugger?

This infrastructure is not solving that. It's primarily targeting "application"
faults, i.e. everything that is called from inmate_main. Yes, if we do have any
of the issues you described above, we will continue to triple fault, at latest
on a fault in #DF. You can check that with your SSE scenario.

But if we avoid running into SSE paths under /normal/ conditions prior to
enabling it in early setup, exceptions won't be triggered, printk can look like
as it like to, and all will be fine.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3dcf8dcf-a0fb-0b77-eb0a-a0364a957b0d%40web.de.
For more options, visit https://groups.google.com/d/optout.
