Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBEGU7KBQMGQEURGNTAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D5E3655F7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 12:16:49 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id f13-20020a2ea0cd0000b02900bdd20adfc9sf7296674ljm.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 03:16:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618913808; cv=pass;
        d=google.com; s=arc-20160816;
        b=JDuEhcKX5Ia8lXHJOgLU74Rwr2l4x+IwB2mYdkqFgJtC6ZEjnj/HynbKEaRFzerSDy
         7UZB9etyDkc+EV1nbMLOqY7rCDLIT2B5qvuJmzfr08Nk7uhWzBYpMsOJXhDvMAu0o3TE
         hlUWneSWM6Sr1bCG1yeKErA6nQraBLOQhNoQZIjd8xx6QTy+dhFWajrUzj7IvSxhOKyN
         k79RafNm9mVPZs+d8gZ9hZvxukKfIuFZigQ3T7DMUAhE9yTn1y49sRbuf4XzsLmYRtX3
         nCmxsM37JO65CsnsjXE4z3Ch9cyrP926nPfDU1PL6Lv270vjGz9lHJaJMHXNKYgnV2sp
         hV2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=LXxZye2XbyfX8jvEJi0PxxK0Th81y/MGQPIHB+ZEZPg=;
        b=RmsXKxqxDmjOnWFdicEiXD6j0mSk6JFRZ1wMacpZbt0uUtYWyCJJHqbrzpDSt2dlk3
         e8PJRTlm7COU7HvERw+lsptuXEOF5+tzBSSRE8vALi/AVs36/tRvbM5mRkpge9f5eoiD
         CI/wbKmXYGPczuj3sMF8WcnbQB2J5DuSrNDn5HHDn+7HPQvIAt51DgYQ68TM9hWa6Gu6
         95sxGcIW6VNMc2ULwDNUuJrGNgwhRc7wRZYX7ykU5z4n+Tt5BSSRQVZ9BM/XOX3hmmMQ
         kQd7+PgU6DtPH2Su6mgmsR16pnVrsr7y0SGOcKnhohqt9zgnXDTOtHfn7VQtu1m/KRLI
         J8Xw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LXxZye2XbyfX8jvEJi0PxxK0Th81y/MGQPIHB+ZEZPg=;
        b=Svp4rn4FMKezDfaOM625cwunqmEpDoBHbg7kqNdWpMP32pc3GbnhW5vLLn/mfpytRH
         O/n/BS55gG0uE4Md5BqfZrpgFw0SbnFwWmUWAteqN5xaZ2sufcBeJTxxeYQMGN2VUiRs
         1U0so1I5bUXQ+0GATuLR2KZfTH/u0i46yaShmm9CEEdtO1YT7pJWIDOzvWaiMLzpiOcf
         tf2vkPuD4KhBE+1mE8UqsdzA+1zQeZ8jbeWchDyL9ftDthnz7mdxojR/XeRHewLlpmVg
         LLWMzBDunhSsAB4dNI8sReFYbDvmDBewBENMsn5GOOS2hfCMswe9Q0GJ4342mqipAXEP
         afkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=LXxZye2XbyfX8jvEJi0PxxK0Th81y/MGQPIHB+ZEZPg=;
        b=O6LaQTmN+cP8GCpAx4Ux8aa4AEXHBtqPp6YSevefM7IrByZqrS8uy/tPV/V/0w8gIa
         fa4CabVHbMtm8T4qS8tY4XCpaiHj6YSf4/8ehX8eIiyF6kF92zSw9xjXH8d1FAQsNe9C
         z8Yi1K2YfhvoK3k1OKYKJCdYFDve/+hV5L9JI4CJMVdef3auRmdqZA/ns296cjaE/2d5
         YOhZ/yBXBVPhuzlxM31k2gH+pBfvC0nYGYzwuEshjEvwfOeDHKOjkFGpjE9tnYx7d06B
         6011q3AkDGuXQ2cOF7z00+mAm46XadTUVEcc9EUHawQEAVbqPIDKJVsVX8gNwL2CQVQE
         3ECg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531OcAiLgq+yOn4WO1wn8MyAKOaOla4UOY+W9y7VDikDJ5RP6HzK
	y7bkEk36/u+Us+SY25MPGD4=
X-Google-Smtp-Source: ABdhPJzmGw06BVBD4uBOLGxMGFAYyNC7jP3Ju4CLGovwdQap6qoJhCYlsDexcX2CdKkEfA93rAjRYw==
X-Received: by 2002:ac2:5385:: with SMTP id g5mr10892910lfh.375.1618913808758;
        Tue, 20 Apr 2021 03:16:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a785:: with SMTP id c5ls5099738ljf.8.gmail; Tue, 20 Apr
 2021 03:16:47 -0700 (PDT)
X-Received: by 2002:a2e:a0d0:: with SMTP id f16mr609574ljm.65.1618913807602;
        Tue, 20 Apr 2021 03:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618913807; cv=none;
        d=google.com; s=arc-20160816;
        b=dS6cpcTwdX4H3doSK6BGfRDSmxUXwzadR1Fk3C2vzjsnyFhAgO4oDOgaVilxKvoUyE
         fpk4InEzW5Pp1manJfHFwE7dFZsmQhbkrPoQ4clYbsh4tNaQ8qgyuM+pGODFNhEBscrZ
         tdmp3asqsJbt3ViPzkMhczoNowA4PFkC6t9cOBR8sXp6iTlkdAKwdMksrZRjtRu6vQPb
         2l9JlYrGZDB67ACcWwK1lica2lPlQQsA96k7Dof+K3vM2xO50Y71KsOtlO8Cplo4fRxH
         8F9VQFKFHnZ7xr5wJr1JlSr99JftsYovOJPa4XvzumLofbrAyMTH3UEcYawHI2SIcdbu
         AccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=M00ADLjgQUcJhxJPb7RqdWMtAHOIPkjwpivn+ESFdO4=;
        b=Dxji1qQ4ygaPdWR+SrTblC78XJ68gRNTMFOGdP/PWi7xUZ8XhJBSSISTrcn2DXRxLJ
         rerNXJfjLL1ovRICCzHOeLmOhqLO6gDYnCd8/ZKLHDBDr2gJGEHQVpWoTj78qSYJIyDC
         0QS1O0rMnOlAAHMW2BGmNO+HCss7V9hZpmtsEl64GpwjI8vS1ATrN4gnW2Ej1CY4/iJS
         9HLxT829dbbeXkO3apfw1+51PeLnpNzZFnl51rmV62Qx6vpWfc7cXyZQX+fBVTkeSVqV
         ejAMOQbhxn7qwdFaNKwqrYOumizZG0yFuB9Nk1ctFlM2ZLDAeCkVCIcPeRdm/2jE8GQc
         BZGA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id p18si830678lji.8.2021.04.20.03.16.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Apr 2021 03:16:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 13KAGkqq011446
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Apr 2021 12:16:46 +0200
Received: from [167.87.240.116] ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13KAD8iK008789;
	Tue, 20 Apr 2021 12:13:09 +0200
Subject: Re: [PATCH V3 1/1] inmates/lib: Add zeroed alloc, and update usage
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <AS8PR02MB66632030F576308C52270C07B6489@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <2c45f24a-4c6e-2988-edf0-bdf35d269dec@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <881c7449-a4e3-ca2a-dfbb-fa28f24f6446@siemens.com>
Date: Tue, 20 Apr 2021 12:13:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <2c45f24a-4c6e-2988-edf0-bdf35d269dec@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 20.04.21 11:08, Ralf Ramsauer wrote:
> 
> 
> On 20/04/2021 10:49, Bram Hooimeijer wrote:
>> Adds zalloc(size, align) which allocates memory and fills it with zeros.
>> Replaces usage of alloc() in inmates/lib with zalloc().
>>
>> Motivation is that use of alloc without zeroing mem.c:map_range()
>> results in illegal page tables if memory contains artefacts.
>>
>> Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
> 
> Reviewed-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> 
> Thanks
>   Ralf
> 

Thanks to both of you, applied.

Jan

>> ---
>>  inmates/lib/alloc.c                 | 9 +++++++++
>>  inmates/lib/arm-common/mem.c        | 3 +--
>>  inmates/lib/include/inmate_common.h | 1 +
>>  inmates/lib/x86/mem.c               | 4 ++--
>>  inmates/lib/x86/smp.c               | 2 +-
>>  5 files changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/inmates/lib/alloc.c b/inmates/lib/alloc.c
>> index e68e6cc1..5da6828a 100644
>> --- a/inmates/lib/alloc.c
>> +++ b/inmates/lib/alloc.c
>> @@ -5,6 +5,7 @@
>>   *
>>   * Authors:
>>   *  Jan Kiszka <jan.kiszka@siemens.com>
>> + *  Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
>>   *
>>   * This work is licensed under the terms of the GNU GPL, version 2.  See
>>   * the COPYING file in the top-level directory.
>> @@ -47,3 +48,11 @@ void *alloc(unsigned long size, unsigned long align)
>>  	heap_pos = base + size;
>>  	return (void *)base;
>>  }
>> +
>> +void *zalloc(unsigned long size, unsigned long align)
>> +{
>> +	void *base = alloc(size, align);
>> +	memset(base, 0, size);
>> +
>> +	return base;
>> +}
>> diff --git a/inmates/lib/arm-common/mem.c b/inmates/lib/arm-common/mem.c
>> index 5951fafc..5064b002 100644
>> --- a/inmates/lib/arm-common/mem.c
>> +++ b/inmates/lib/arm-common/mem.c
>> @@ -56,8 +56,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
>>  	while (size) {
>>  		pgd_index = PGD_INDEX(vaddr);
>>  		if (!(page_directory[pgd_index] & LONG_DESC_TABLE)) {
>> -			pmd = alloc(PAGE_SIZE, PAGE_SIZE);
>> -			memset(pmd, 0, PAGE_SIZE);
>> +			pmd = zalloc(PAGE_SIZE, PAGE_SIZE);
>>  			/* ensure the page table walker will see the zeroes */
>>  			synchronization_barrier();
>>  
>> diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
>> index 5af1213a..1c20a0af 100644
>> --- a/inmates/lib/include/inmate_common.h
>> +++ b/inmates/lib/include/inmate_common.h
>> @@ -103,6 +103,7 @@ void __attribute__((format(printf, 1, 2))) printk(const char *fmt, ...);
>>  extern unsigned long heap_pos;
>>  
>>  void *alloc(unsigned long size, unsigned long align);
>> +void *zalloc(unsigned long size, unsigned long align);
>>  
>>  void *memset(void *s, int c, unsigned long n);
>>  void *memcpy(void *d, const void *s, unsigned long n);
>> diff --git a/inmates/lib/x86/mem.c b/inmates/lib/x86/mem.c
>> index 7e1c8b83..764bdb4b 100644
>> --- a/inmates/lib/x86/mem.c
>> +++ b/inmates/lib/x86/mem.c
>> @@ -57,7 +57,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
>>  		if (*pt_entry & PAGE_FLAG_PRESENT) {
>>  			pt = (unsigned long *)(*pt_entry & PAGE_MASK);
>>  		} else {
>> -			pt = alloc(PAGE_SIZE, PAGE_SIZE);
>> +			pt = zalloc(PAGE_SIZE, PAGE_SIZE);
>>  			*pt_entry = (unsigned long)pt | PAGE_DEFAULT_FLAGS;
>>  		}
>>  
>> @@ -65,7 +65,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
>>  		if (*pt_entry & PAGE_FLAG_PRESENT) {
>>  			pt = (unsigned long *)(*pt_entry & PAGE_MASK);
>>  		} else {
>> -			pt = alloc(PAGE_SIZE, PAGE_SIZE);
>> +			pt = zalloc(PAGE_SIZE, PAGE_SIZE);
>>  			*pt_entry = (unsigned long)pt | PAGE_DEFAULT_FLAGS;
>>  		}
>>  
>> diff --git a/inmates/lib/x86/smp.c b/inmates/lib/x86/smp.c
>> index 94ce2913..625ddaf0 100644
>> --- a/inmates/lib/x86/smp.c
>> +++ b/inmates/lib/x86/smp.c
>> @@ -54,7 +54,7 @@ void smp_start_cpu(unsigned int cpu_id, void (*entry)(void))
>>  	u64 base_val = ((u64)cpu_id << 32) | APIC_LVL_ASSERT;
>>  
>>  	ap_entry = entry;
>> -	stack = alloc(PAGE_SIZE, PAGE_SIZE) + PAGE_SIZE;
>> +	stack = zalloc(PAGE_SIZE, PAGE_SIZE) + PAGE_SIZE;
>>  
>>  	write_msr(X2APIC_ICR, base_val | APIC_DM_INIT);
>>  	delay_us(10000);
>>

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/881c7449-a4e3-ca2a-dfbb-fa28f24f6446%40siemens.com.
