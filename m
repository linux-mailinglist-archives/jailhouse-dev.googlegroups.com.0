Return-Path: <jailhouse-dev+bncBCW2V5WNZMERB35U7D6QKGQEDCACF2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A7D2C3B50
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 09:48:48 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id s23sf571553lfi.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 00:48:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606294128; cv=pass;
        d=google.com; s=arc-20160816;
        b=Rus2XsUKL7aV/T2e7snQYGrATUohl3tFlKuCXpb0neVQYJK+bdFIpIvRl0CWD00H0T
         Kf/z84MDOQ1E+iQIZZ0Fc8qfllFtFGGJ6S04R1vhJSnwJbR0vwkDvJA2xQ8j6GgpdNPA
         sDsKmyzg+x63EAthpEVsfpq4Gt0m6TfiroLLBLGjRl5fHYaWwov6KUFBz8ghgtIef9vf
         qcrreOisZ+ocKvTkjyXg7MmL2cbiCbjGWJJ+oWks0kiv9LezPGHqGyGujy5vIflpqGE0
         7jtovblt4X8F6pPTBpC+3+pprOSBlc2/ZE5zyINUFHKv6uvJDHkcUZgypRuc+DDK13ce
         AEnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=IVsqIRh8FADez9o6e25GxrHnPetIdLblIQq2TWdYvYk=;
        b=lmls3U0VwUhQkPYsP8kaLmw4alT+8QfiIdrEsB+5OUKNvKSzpI3srYZK4dhTqFXCg1
         kbwYfOdC7ITgyjNgxhzAPr/wvGG/8erjesBQGc5D0paSyb7K42Lr28CMe0m/9SKYqQpn
         KuCQfnfmW48q1AWWABf05RWlV8vZ50Vy7ImmJm2kYgms2YgID8q1fOytt6W6YskLqyRO
         x7JS9IBGTWsYHUp+K/Tw5i/w4Mwc7vmjgNfxlpaijyZE+lp+5S+6YV6BuGcqfn1xuGhH
         jJwyx5JjRSHwQXuHiaK/29RRv+R1hieLECnMBb01QLGLuSv8ITGRNJL1xYVBkueWjsRu
         SrGg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=lHWwkA1O;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IVsqIRh8FADez9o6e25GxrHnPetIdLblIQq2TWdYvYk=;
        b=S8dhr3fyZ9/mbodubl/DqfEYtqbwDbZHegSF/aFPi95HxwDTkpAsV6Nt7dYp1JxW9p
         IAMglOGSYzJ2tO1J8B6Q0zmxwQkaU6aAXvdDvto8ScRZCR6Op5rmJ3NQxs48imnDJVJT
         Q0HBS1O1iOrpHKu/UTs3PHdwPiqw94BoEMDxzzCspsWMKZ7O+rgdl/7p7DjNJz5qU31x
         3e1fWipi5ioefsVdqW9BUFyL8edghIKOngrMknNCvL3ZSWV4DGDN23nLWEAU4H5IMEEj
         K47U43KxouumMzI53VPirYXnFYLfLQAEk6YjU5GcJ4d4ao1ytqMwzFUugqwOKJYDafR6
         mGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IVsqIRh8FADez9o6e25GxrHnPetIdLblIQq2TWdYvYk=;
        b=PGD/RIFPfkQQGVTn2ls4dHg38X55mltiWVwz7txiWqFQxa2CRrWpndtTnBoAZrqR3A
         Qo5QzAYyI/p4DnAv/XysiRlmqeEaI8trJtnfIrR9wKKsZOXfgEDi0AUicwVCs92blhe0
         /h1wsKWNdoS7AeMhQuDZKmf3+G/bCumqEuN+QPs7ffhXkO8GLr+7ZpIYCkTEyvMqV+tJ
         JZj2NXVofSAcMv1t783aLsE4Ido0xoMdIflP5m0F288oJ072ZFqvFOhuXdtfw50LGuvb
         oe367VfLrrcIp5w7qBjCnwVK7+WsaNXoRtpR3MtZhFaNcXfRbh1NlG7SrjVoWfEOlb0q
         1ghg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530hntKFnHKqAMY0MZb3oxq99HMcwR1swk9Wzi2f/QOPAAnFGRg5
	+OdCBSGwTL85+bx883Ue//Y=
X-Google-Smtp-Source: ABdhPJyQHgqHZfnQpUiKuhOOe9evXug8HVRiW5qwcGcMa0a7IDZPYAVl+8tEt+kOox90jTdgKXCqFw==
X-Received: by 2002:a19:e46:: with SMTP id 67mr72458lfo.108.1606294128382;
        Wed, 25 Nov 2020 00:48:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9059:: with SMTP id n25ls283375ljg.3.gmail; Wed, 25 Nov
 2020 00:48:47 -0800 (PST)
X-Received: by 2002:a2e:3613:: with SMTP id d19mr927654lja.127.1606294126939;
        Wed, 25 Nov 2020 00:48:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606294126; cv=none;
        d=google.com; s=arc-20160816;
        b=UnQfp4ctof57r6X7ImMKKrvc0rjZ+zH0wkRYYV9M1vZb2TFAkcBk+lD+mzJ3DEh3RS
         YeueziulgA8zyHKEq8FLD1XZJ4v4Jr2xFuf5u7iY5eWlZW21txrl0DNzPixa3IXjcUFJ
         Bu19wNXTwDGVUhENduXedUqOOJabXPBOLdsgYrp7MMzSHbkXJ3VgbsCnwwgOaXpPUrwA
         VIvq1lob8kIWPYzAH1GGHPvO5PBRDttRMOpEEEpG2VDfIQNprQ9xJap+uSQ4w32uJoqw
         SEKn8jZmJY2/0wjUhNyY0U96COXhoFN/dlAWccNZVA4u43VRz4wYLQFbxk6WdTbRGNdn
         rhfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=NTphJIdoQm6bmgJGVeerpNOm4SE4mLIgJoU0z7etGzY=;
        b=TEvp6b4ldYMXhDqK+R+iY0b628iqI/L/fOynCC06NTwCfN4tMYJ0czkaADiEon4bwq
         nxyiA/8mJ1tOPodt3qU9grzVuV/MA7CSrJONVyExcNUR59ENBfAkm3Nrsz3ID/GQ9Ljm
         JTd5GHGxev8ajbl3kS1T2VgI426WD/muHRVQ00W3MZr1TpDtVI9XYLnj8OAGUhv9eUuF
         hQophpQC7H7ux8jwqzirG429OWL4S+GSon4N0x+/oEzJB3V92I8eDaLqzADAx0xSbSuA
         ZUNzIFaWhG8fZIemh1QF9T1sKEX6/uegjiulkMFT/x0Qq4OPFYW61553I2usstXN89CE
         UJWA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=lHWwkA1O;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id p13si67304lji.4.2020.11.25.00.48.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Nov 2020 00:48:46 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4Cgvgf1218zyTM;
	Wed, 25 Nov 2020 09:48:46 +0100 (CET)
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
	with LMTP id 7WenwYhOr5Md; Wed, 25 Nov 2020 09:48:45 +0100 (CET)
Received: from [10.162.12.242] (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4Cgvgd3gsszySF;
	Wed, 25 Nov 2020 09:48:45 +0100 (CET)
Subject: Re: [PATCH 01/14] arm-common: bitops: add most-significant-bit
 operation
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
 <20201123204613.252563-2-andrea.bastoni@tum.de>
 <8f2b8fa9-a695-a845-b02f-98e22180b4ae@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <bc91d85f-321e-596d-feeb-bbac5549fa18@tum.de>
Date: Wed, 25 Nov 2020 09:48:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8f2b8fa9-a695-a845-b02f-98e22180b4ae@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=lHWwkA1O;       spf=pass
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

On 25/11/2020 07:07, Jan Kiszka wrote:
> On 23.11.20 21:46, Andrea Bastoni wrote:
>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>> ---
>>  hypervisor/arch/arm-common/include/asm/bitops.h | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/hypervisor/arch/arm-common/include/asm/bitops.h b/hypervisor/arch/arm-common/include/asm/bitops.h
>> index 808c9a0f..a726862f 100644
>> --- a/hypervisor/arch/arm-common/include/asm/bitops.h
>> +++ b/hypervisor/arch/arm-common/include/asm/bitops.h
>> @@ -31,6 +31,7 @@ static inline unsigned long clz(unsigned long word)
>>  /* Returns the position of the least significant 1, MSB=31, LSB=0*/
>>  static inline unsigned long ffsl(unsigned long word)
>>  {
>> +	// FIXME: the ffsl on x86 isn't robust.
> 
> Can you elaborate?

There's an imbalance between the ffsl on arm and the ffsl on x86. The one on x86
doesn't check whether word is 0, this one does.

I haven't yet had time to check the callers and make sure that they will never
use 0.

I put the FIXME there before I implemented the assert(). Actually it could be
now possibile to do

unsigned long ffsl(unsigned long word)
{
    assert(word != 0);
    ...
}

And remove the check on arm.

Furthermore it is maybe possible to get rid of the __bultin_ffsl() and use
jailhouse own ffsl() implementation.

Best,
Andrea

> 
>>  	if (!word)
>>  		return 0;
>>  	asm volatile ("rbit %0, %0" : "+r" (word));
>> @@ -41,3 +42,12 @@ static inline unsigned long ffzl(unsigned long word)
>>  {
>>  	return ffsl(~word);
>>  }
>> +
>> +static inline unsigned long msbl(unsigned long word)
>> +{
>> +#if BITS_PER_LONG == 64
>> +	return 63 - clz(word);
>> +#else
>> +	return 32 - clz(word);
>> +#endif
>> +}
>>
> 
> Jan
> 

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bc91d85f-321e-596d-feeb-bbac5549fa18%40tum.de.
