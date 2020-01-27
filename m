Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBSNIXPYQKGQEAKR3IVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id B691C14A399
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 13:15:05 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id be8sf6907351edb.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 04:15:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580127305; cv=pass;
        d=google.com; s=arc-20160816;
        b=pGlzvIKjqOxAml9dqvUJuHCxsTOJTUyxLPi0miuwvb89m6koL9P95bQIOinfIoZ8wq
         Wm7/QouXnEiDEyGpMPMMNpGF+rFGAsUzlC1gp8IlafcicVUSLIkeuyyd1wxvgFy5Fsfs
         QHfVz1gQXFpikTP7FlxLU43eAnwWHl7T4AUaKWqHpVwjg/iMxuLgwKLdBIiea43MAcLJ
         1BO6AtJyYFFvemnjY90t3yV0FVvOZdhudVKVvErE7uVeYMc5aIdgvLoS4vJ85ZwJj3Km
         3FyDW02dkXFi0QN/D+D4NxmtvreIgR9oohLUU5fa44kGMbex0HjZyXG7j9MZaj6VLU6V
         9gtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=kwPBMYrgK3nURqYEdxVSa0tAJhEmxa5IctOCGfUlACQ=;
        b=LcF5Xl41uOURuyahwfaJdfrsK3s1gp4Yb8owCj1tOxH1fhO916piKZEPUay5URhnll
         Tc3A8t5ywwj1CMbPs7SkV79JUdjZbD1xdqCerye4m1UC+GSoY1T23ZV47ys70zcwLpAc
         RL3jfxziyXTD3rQBOIvOML6U2yvpfS878rE5e2yU/+pYzPYKwKXyKq5FqeZ8Qgp/yYYs
         Ne2sCyUCYjBmgFf50upLbCI31zEPhXcfqT+DzI2NNLFDZ377q+rPnxC838efHZE20M5S
         aQ5/whUytyr6vyYd6jzgNPERPXLIdVFSOCmm0Ftw5O/+T6mtBMIumemG/YOZUlE1B3mO
         4nKQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cm7Tsn4T;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kwPBMYrgK3nURqYEdxVSa0tAJhEmxa5IctOCGfUlACQ=;
        b=IIvNFAcOXb+e7X5+NOe5Tdk2xbhsEqKihn+BVGxhH/iXhoHPbsPto8SnUDp3/xtwCs
         6/rDQQX5nino0O6qdBC7KqriuUwRhOVpAwaHNML3OLn/XqlSSF7btwBcg9cJV+9zDi5U
         i3SSGDH6HBtBNUXMR/55F+KpjaGXgPPztUFMaTVz2re4+Sg6jNHLWvsAGBlSbPwqaS+0
         b0ilHOczb9OFVFQ85Py5piptHv5ARB1NmDS6dQ9tYRV/X+FwRBPy5TvyGh7yN+Ag9y6t
         bmMexnh+yu7oASHpmXsP2XwB9BfBt4xD63euIzdkDz1doVYbxBDDUwPdyTbp88XNWst8
         mgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kwPBMYrgK3nURqYEdxVSa0tAJhEmxa5IctOCGfUlACQ=;
        b=t7I6lcnRwQY7G5GwMdsd7hM9Mm6Wr3EEJ7nN3/lJCOcHBCZu0Pc4mCIUJotHn+gYnx
         Nk3jlPVFTFInNQHvex2wTBV/5OxT3HYwuRGwajn3aStEVc+6uN4nfsakWayW4pVkoKHH
         0/P+r+h0kOOgDHXEwXT4sBlGgoUqaCfLbZqgHhP4sdD6UFqS51WOt1rq5UY/DssWF8J7
         PhUAxxwoaOZzHwPgAQkWRzXNWMVmg7rlb0C15rVv6fh6xUVYRiMdkQM9JxMLn4cLVPq7
         /vBd+DQubGEs0YsRnAjaVAEX0JVirkq/t9SYorusYLzamEs0Q+Q9v+dQqxB1hTAiB37j
         WRGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVdBFMtyzm/q8ugti5Jvw+VaFf8VCVK/pQfzaWE2DIJCzpdX1Dp
	2NRK3Sh8wCO7L/9jXoiARWY=
X-Google-Smtp-Source: APXvYqy9ZCw1hDR9P94OE899pbDyE8ZnJ3Gchai6e2agueR0QL778Q9iqMEjpm0BAdkpv7z9GJd1ng==
X-Received: by 2002:a50:c04e:: with SMTP id u14mr12823656edd.193.1580127305341;
        Mon, 27 Jan 2020 04:15:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:e20e:: with SMTP id gf14ls2443651ejb.10.gmail; Mon,
 27 Jan 2020 04:15:04 -0800 (PST)
X-Received: by 2002:a17:906:2e53:: with SMTP id r19mr13265418eji.306.1580127304580;
        Mon, 27 Jan 2020 04:15:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580127304; cv=none;
        d=google.com; s=arc-20160816;
        b=ffIPCtsMn4zw2p3E1OdD7dgI4FgWLMKgtVcLBzeKDLLDxVCmheoBZp+tu16hCxRIpx
         vkbkVm7wOnrqIZfhNUNe8pvwEQ/114DdFXnztTnHOMW8xD2xZ4sFA65gsOTPmyCzbNaH
         Rc+N9ce/lfEEwLxwHF4A1nmw2KiphpBnrJCsVIGbblunbkBHOrP14pI6iVRW5kamR6b2
         ySCRr+M1Z53kkqy4F3pAAipk0/EDuHixCQjJXc7R43JLOj3XcuH0OhMH606Z9SfEV0Ao
         LJbuPBNdPPy+/SJkyG3DxTZ6j05DC/zmGi0yvC5ShcHBdqy3eN7292Va+BiqD9vtGe2Z
         gBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=rh7jIiXGHeFj12c/B+QxrE5W01voG5fFIGB4nCDnp24=;
        b=KQ0Ds8WHbxhc4ZpMDZW8GkCJaq6wrAl2aD2MaSyLuGpbaorMjWLIq3qTWq7hwCPDVY
         B9gK7XoO3XPxE9zoHh2LRhKhgYVcIz478VFTtxaMDOe752tUdQbipLCYlmD3I/fmSRaG
         ckd6HPLfdHELoNoJPHO2IvoS9ka+lcOUJDocp0ZDMJx+G6F5EqywvfXmmJQBj+633WvL
         1zt11Fm+QZC98zTwiOibc6q/pIHpxefBqc3ySPRkPNGlq68wcWDA2Hh0ElvHGNCegihy
         Gus9kYn78KoD8Ml6tdQpoBwK5xR7yE0VW+AVC7Zb/XDqEWArnkxfOtu6IpCwjdxT5XZX
         z4Zw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cm7Tsn4T;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id n21si790357eja.0.2020.01.27.04.15.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 04:15:04 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Laky4-1jK9mC0N9U-00kMLU; Mon, 27
 Jan 2020 13:15:04 +0100
Subject: Re: [PATCH 2/3] arm/arm64: Pad comm region to natural alignment
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <cover.1580107046.git.jan.kiszka@web.de>
 <beb95b54284b1defd0f1952d43f8143cf303d38f.1580107046.git.jan.kiszka@web.de>
 <ef68e345-9b82-e82a-65e1-da1cb9faf2c0@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <185db5e4-618f-db9c-cd1b-d199b6af0c61@web.de>
Date: Mon, 27 Jan 2020 13:15:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ef68e345-9b82-e82a-65e1-da1cb9faf2c0@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:FLPSJoP0fOFA4U6ahpfHdZWkeKOi6lg2KN4EhJmK3KzGAybRLEf
 w7juOfP4bgBINLdMPj9HEpmxF+PGMgBbq67vtjlrK0a44mBHGTpUQj+OTP72iFHBfZE4CBS
 vstoZ57q787eIKar70iJ/U8gvq+zQ1f/dwdhrjms4hnkBVXyEX2kxNn0wHkdigF8PAWU9cq
 NJoasO4In5p6SOuYdXusQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:brvzqte026E=:Yy/3RRBlbvsXDHlJL8qjNA
 C/dWnGROgLBqvzkrh/tTohIKJygo2ewqDkC0Qu3J/RLhrEQis6+o2mJSCy5yXQJuYA9GO2Y7g
 6DQXi+ABMkI/gMOHivxJk1WXojV8XHcKwMsJ42eVu1QX80vScRtYFbZ7T3RagD07ooxM3qNoA
 p2XvTZxLuCt+etZwUekuvpspUAdqMBalhC4K6xAN5nUNwsKgL+HC72S842PuSSapEOSF0+ogx
 JgxYuNxEA8PU5qbENM18IuvaiTYNR1rk5dd5uRjXfvOe4pMrYL6oID7khv1KK86X/MFX7GG5f
 KmJflTwcJAOb3IkctCgV7EsleS1bejrbCIGtNw5f1FR+7jGOUTMOSVKOx17U3Ji+ArC83RH9C
 d4p0qpzoLWfVLRUhlmc4YC7cUAa9Pee9ncl8YlIfmrTFNWsjZCiIeXm9DlUnkEDa2z99LxIZ5
 aPECVXEGlGh9gE1gVyfwR55oDHzhIprweyukPG3vBH0q/wjJIlTAVOqOWt+IHBa4MawtwUE4/
 SpjE0FQlRb0FI9czPd6hw3RSAclJwWmp+1A1WLPmakAgt6h9dA0DL9Uyl+QYmbkHfg0ouVYY+
 dbGdroX4n8g7eOu3RJEfsANiSHpNMRC9IVebU6rXIYpC94FyZtHHRBA75FCSOuo2U5ij1Mavl
 n19MsWc5D4O7wU4Qi06RcoKY73/wB0GaWnUJDjCDUENrsD7+9QzzMHNPrRi3LxrktETVo2BYs
 +q6FZENGi0BUTmFUIDBkANuluhJ3ljOdvaCEfsXtK33JggQnLI5gFcwwxA7/hJfEAHFLOCSfS
 DbzHl4I0Nv1CoHeH8OQjfm3M5/wRoYRy1bmj4zhFnVMNPJKsN2ddM7JHjW9Y7amXzYA3N+fVK
 nT462hVe74zAcTxMr3oqY6klueRoqymcyzf3O/LLBt4316r9gL/lBWi4V64Cv+J3qbdQyRzy5
 vLdpqs4aUrEb9xNjblVqtc44ef/vGLJz3F3AGruSOkf7ZQ+88rb+xodVezquN5IvtIcfJcPTX
 +SGSbaYMw0ZiU8hhpyZUQ08617w/pkd+AlUcIx+1Sb9+/yBpQNnhogriUxbGR0zFDPwTT7NMN
 tT6fIzYA//3OgiuBbeswd4NsdjXNxL6dx0AucWFJaCeRixuZe8Kf+YAcFSdYrifs5aAI0iz/H
 atwVbXiKuoh9nxLk5IXOsGJxGjXVlwHO85jLvPIy7gPXY9E/ljY/syqptfuy8K0SCCiryBG21
 HfU0l57TvPSGCb6rc
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=cm7Tsn4T;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
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

On 27.01.20 12:40, Ralf Ramsauer wrote:
>
>
> On 27/01/2020 07:37, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Better pad than rely on both sides using the same compiler logic.
>
> Ack. But shouldn't we then, in turn, use __attribute__((unpacked)) to
> avoid that the compiler accidentally does some other unintended
> alignment / reordering?

Do you mean "packed"? It shouldn't be needed at this stage, but it
shouldn't harm as well.

>
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>   include/arch/arm-common/asm/jailhouse_hypercall.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/arch/arm-common/asm/jailhouse_hypercall.h b/include/arch/arm-common/asm/jailhouse_hypercall.h
>> index 83cec97b..aeab2816 100644
>> --- a/include/arch/arm-common/asm/jailhouse_hypercall.h
>> +++ b/include/arch/arm-common/asm/jailhouse_hypercall.h
>> @@ -38,6 +38,7 @@
>>
>>   #define COMM_REGION_COMMON_PLATFORM_INFO	\
>>   	__u8 gic_version;			\
>> +	__u8 padding[7];			\
>>   	__u64 gicd_base;			\
>>   	__u64 gicc_base;			\
>>   	__u64 gicr_base;			\
>
> BTW: It's really hard to trace how the structures are being defined.
>
> Instead of creating the structure in arch-specific parts for each
> architecture, I think it would be nicer to introduce the structure for
> all architectures, and then include arch-specific parts.

...as anonymous sub-structs - possibly.

Jan

>
> Maybe I'll find some time for a patch...
>
>    Ralf
>
>> --
>> 2.16.4
>>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/185db5e4-618f-db9c-cd1b-d199b6af0c61%40web.de.
