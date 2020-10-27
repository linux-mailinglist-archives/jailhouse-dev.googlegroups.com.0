Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBZOS4H6AKGQEAOLWSKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 628FC29C795
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 19:39:34 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id z8sf1204761lji.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 11:39:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603823974; cv=pass;
        d=google.com; s=arc-20160816;
        b=OPZVDlTeH9yGQoQe/Q78u5VLLkhaWpHfMBD+rT5CTJdXXfOnkzt+djj1WBgVUETkh4
         IXBZswaCcn/ICS6rIq1TAS9s/V7391Cfm/8tDlDRqDp28UdFUPkIb+dYaSOQugxk9ixJ
         qAiUW9N3S0P7etn+xZeaBlm/M4sqFCkfY25ynz1n9rBapdsVBSjhy1qsIGUkqs75BDLO
         L4ZE1fN86yRm0YLm4jeDw9VffCN/RMFFrrtzvVqodFZRdbvnVP/ce5vo2gjp79bv45RA
         i/j78AKjoCOw4qdBxnpiobHygwc088llPP5Jl8cBXDjkmalvvih2rfKbwaTWZWJ5MgQT
         12pQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=Gf+2Umd29H3kxP91sjSV6o+mwkyhwkQ1Rh3RgRqWrZQ=;
        b=Ufz0V3KIpmSCEQbv5GqnUQzS2wooxdOQaIrzMLIMrS+peKqIoQpO4n6m51gyKhQWy4
         G2q0RRgEIHKJzik0hobSegGnFDcu/ca3tHxsQ5IhkHDBX/KhG7hiD8S/XkPbCSklG1pQ
         yT7N/EHg4z1Lf3SuOw8FPu5N+9qB5xgZ/wuulGtPXkw35kZm5U2emKUqQGbl45PA8i9a
         ey9+9gc4TYGvz4MHM1zhjJYZnGwOL4jF6ZUrQ66w7RTI/76RR6NSJ148zMEkEmsGGyPC
         fcI0oVcEIKSZY8A7s/dvnmnvi48eb6HY95W96C/lUrd+RRr1MTFMTWJaBhYXmnOlsqhP
         nVXQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="dAD1/mBg";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Gf+2Umd29H3kxP91sjSV6o+mwkyhwkQ1Rh3RgRqWrZQ=;
        b=ODK5qbJB13C8qPcQn+QZqwG+j0JBxaOSqUNKoB7Xe5xnYAc6X0TINxKg2fLrHCgcbs
         LUQbyxw4Xpi/Fx4UmTh41WEMDc7SV0jt2Jy6EVHEl8e41SeCQ1qT8trL9G0jf+Thtuhv
         YnenwdelcQ1o9rI+uiQ9pZA+z8Z9peabgZhZb+66sW8r2cxsCQXekkB5M53+VUCF65OH
         6LhJjioe7XciEBnMCNPvgNgo2X8TUtKRkrlIOXOYlTCZvkh1r++cAOrLquziumuKZYbL
         zmLQEvH2AMXuxWkE3f8MOXUqhkWTGHSH0tF871iUgItzOmMoo4KldnwbXl60tq7hIvq/
         Ienw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Gf+2Umd29H3kxP91sjSV6o+mwkyhwkQ1Rh3RgRqWrZQ=;
        b=i9oTqAs4KzO19SvlToFoUZW70hhueids0eJhoorm6hT77qRASvuyi8+B8/Vlg0HEKx
         kK6umN29x2NIs4RkkH18fWGcD7rNQTdX+EsINBzDg8qxySQimktnOzX8wKCrfz/wY3bo
         qfG59auiX+7TVcmtaNb2Hk2AoS5dZhr53hfuQv0UNlXcHemjGU/37jV1OXO0iXE/kYfr
         5JEZdvs01KINaukVoZocGm0WQDQHX/9HwiZhJA1JGnDhOR/nyx44XLRKP2Y9NQzkLnmt
         x6WJZ64j8NY2rTl8SP65uM1hsYSi5Ve6O5VbtUflz4pk6KpFyF8pq18QIkeEe49/C+5o
         fQvw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530GaNNULideXSHeD1Jrg9JBgOC41FSQaTslbBDWKUurfGvJ4mON
	2IGelLYo24pqoiIImmou9do=
X-Google-Smtp-Source: ABdhPJwm7tW6h6nH49GLqk+8Ss0dj+Vefyt+2MOh+SJp8XjzEdcjck5sV39yztH6K7wmXi9c/fHgcA==
X-Received: by 2002:a2e:2ac1:: with SMTP id q184mr1732643ljq.391.1603823973956;
        Tue, 27 Oct 2020 11:39:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a86:: with SMTP id p6ls521006lji.0.gmail; Tue, 27 Oct
 2020 11:39:32 -0700 (PDT)
X-Received: by 2002:a2e:808f:: with SMTP id i15mr1669784ljg.10.1603823972700;
        Tue, 27 Oct 2020 11:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603823972; cv=none;
        d=google.com; s=arc-20160816;
        b=0YDHvko9kBkZ9IBrTkftTU4JergdDQ71O1+9SV2nhunk1W2UAvIu+ADYvqF3IrqIJu
         AE7Khe2xicmekj/fVlFY32VTBzQfNO8mZAQAYh+G7gj3DvqvBUThXqupboiJfxb26IhL
         wto8R2ISXA3lzX0JmHBBCJVnPOK3ipRF5Ld+OHpGayyJNVBjVJz0il69TRjNU7CIkLNd
         SpwgjWRd59Y5YKgGVdwbOQX0GWYgYJV8gAHT/Dix34PZXXrIyppIBV+07f3BNh6JPQvP
         LzOmvq39cwc0l1uWOPTqVwotCT0a6+KFb5AmR0ODdWoKGhSob0Noy6KL4v25K8p3n3S2
         JhLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=B0FoulPjt6YlXeJ6uCqXhipuLA6n+Z6k/22t6cHJtwM=;
        b=bItm3mYoViUvFAvdNXMWHUXo9PBsewMAacWFi2fGbcxWrYUl/qJ/AnOCkRAXlCHB+i
         SWbv7ARiH5MfVYYrHN8N5VFxYsCqPmLVXUVOfNWOkgfoLTZdW8E6lpNebOoZmIdGw9Ej
         G7PJelcjKQJJ2D4aqorXOLXoKCDSPrPRE6dyWlHJVyWqboYUpJMnkvDB2RfxhW0XLytA
         kR2mHOzAv0Rg9H2Hu7IOA2vCgCQRF/q0wzy5L8615tPaJWepY4CR1y471eQiKvKCoT1f
         4TctJBEQZbFXlRKZ0KIlBIoUB3xCN8R4nYo26879Bi/+9Uid1Z1g+iPEs2p7dJ9PAQ0H
         kp3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="dAD1/mBg";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id 8si83280lfm.7.2020.10.27.11.39.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Oct 2020 11:39:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CLL8h0tZHzyW3;
	Tue, 27 Oct 2020 19:39:32 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -5.04
X-Spam-Level: 
X-Spam-Status: No, score=-5.04 tagged_above=-999 required=5
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
	NICE_REPLY_A=-2.167] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id XNi9UHnb1voB; Tue, 27 Oct 2020 19:39:31 +0100 (CET)
Received: from [10.162.12.242] (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CLL8g43ctzyVR;
	Tue, 27 Oct 2020 19:39:31 +0100 (CET)
Subject: Re: [PATCH v2 11/33] hypervisor: introduce uptr_t (depending on the
 wordsize) and define size_t accordingly
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-12-andrea.bastoni@tum.de>
 <b8849626-071b-f074-8e8b-b6cada812fae@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <0c29c249-2a95-26dd-1790-9df1f4fbe2d5@tum.de>
Date: Tue, 27 Oct 2020 19:39:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b8849626-071b-f074-8e8b-b6cada812fae@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="dAD1/mBg";       spf=pass
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

On 27/10/2020 13:36, Jan Kiszka wrote:
> On 22.10.20 19:58, Andrea Bastoni wrote:
>> This solves warnings due to -Wbuiltin-declaration-mismatch
>>
>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>> ---
>>  hypervisor/include/jailhouse/string.h | 5 +++--
>>  hypervisor/include/jailhouse/types.h  | 8 ++++++++
>>  hypervisor/lib.c                      | 6 +++---
>>  3 files changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/hypervisor/include/jailhouse/string.h b/hypervisor/include/jailhouse/string.h
>> index 24f0b0b4..7dc3de3b 100644
>> --- a/hypervisor/include/jailhouse/string.h
>> +++ b/hypervisor/include/jailhouse/string.h
>> @@ -12,9 +12,10 @@
>>   * This work is licensed under the terms of the GNU GPL, version 2.  See
>>   * the COPYING file in the top-level directory.
>>   */
>> +#include <jailhouse/types.h>
>>  
>> -void *memcpy(void *d, const void *s, unsigned long n);
>> -void *memset(void *s, int c, unsigned long n);
>> +void *memcpy(void *d, const void *s, size_t n);
>> +void *memset(void *s, int c, size_t n);
>>  
>>  int strcmp(const char *s1, const char *s2);
>>  
>> diff --git a/hypervisor/include/jailhouse/types.h b/hypervisor/include/jailhouse/types.h
>> index 828e40f7..f97dc252 100644
>> --- a/hypervisor/include/jailhouse/types.h
>> +++ b/hypervisor/include/jailhouse/types.h
>> @@ -55,6 +55,14 @@ typedef u32 __u32;
>>  typedef s64 __s64;
>>  typedef u64 __u64;
>>  
>> +#if BITS_PER_LONG == 64
>> +typedef unsigned long uptr_t;
>> +#else
>> +typedef unsigned int uptr_t;
>> +#endif
>> +
>> +typedef uptr_t size_t;
> 
> What's the benefit of the indirection via uptr_t?

Since I was adding a size dependent type, I thought to add an equivalent to
uintptr_t which could be used in other contexts. Probably I should have called
it uintptr_t directly.

>> +
>>  #endif /* !__ASSEMBLY__ */
>>  
>>  #endif /* !_JAILHOUSE_JAILHOUSE_TYPES_H */
>> diff --git a/hypervisor/lib.c b/hypervisor/lib.c
>> index fc9af7aa..e8a9733d 100644
>> --- a/hypervisor/lib.c
>> +++ b/hypervisor/lib.c
>> @@ -10,10 +10,10 @@
>>   * the COPYING file in the top-level directory.
>>   */
>>  
>> -#include <jailhouse/string.h>
>>  #include <jailhouse/types.h>
>> +#include <jailhouse/string.h>
> 
> If string.h needs types.h, it must include it itself - which you do
> above. So you can drop types.h from here.

Right.

> 
>>  
>> -void *memset(void *s, int c, unsigned long n)
>> +void *memset(void *s, int c, size_t n)
>>  {
>>  	u8 *p = s;
>>  
>> @@ -33,7 +33,7 @@ int strcmp(const char *s1, const char *s2)
>>  	return *(unsigned char *)s1 - *(unsigned char *)s2;
>>  }
>>  
>> -void *memcpy(void *dest, const void *src, unsigned long n)
>> +void *memcpy(void *dest, const void *src, size_t n)
>>  {
>>  	const u8 *s = src;
>>  	u8 *d = dest;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0c29c249-2a95-26dd-1790-9df1f4fbe2d5%40tum.de.
