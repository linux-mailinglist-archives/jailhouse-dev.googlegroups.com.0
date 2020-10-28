Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUNA476AKGQEXVMBFWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCD629D204
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 21:10:58 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id b8sf209579ljk.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 13:10:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603915858; cv=pass;
        d=google.com; s=arc-20160816;
        b=V75o1wRdUGOgbhPYYPRkCEQ8IzxHOE8Yd8+XywFy+Wx34udLbNCrJYxGE5O5JKs2fw
         N8kf/OXV0GCUbjZ5qzL13dNZ2L/T89eSi/cSx5KHSV950Cj2Nr/QGnnlZ4qiaK4EufyQ
         OTK6VZGeclUsgc3269sMgQ0neTkCAGZy5MLFqlepmzw3eB9QvjyL7Ixl9gplCWa134/X
         d6Xm4IYj97S5BKsqrqLgGSSqR4l+5IP6Zos/wMj5rdvZsEaJHaXJX1LfRYUHbrJ97gTu
         ZFGGPhCkRJZ5x5pLRWfDQrMRKPLW4Vm1GJb1y7JCo1i+1NCgTVA4dD3w7a9EUc8cKSOL
         07ug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=m/YRAv/8KZ8KVf9PwAh3fMUUBmhWGb8w/XihG+36eqU=;
        b=GfxDvcuKyYp9C3xSQ+NAIMGVVOQj92JBJL0av1L4kBV5Dvto0Fs3V3hVHppMxqqSi2
         NidgrnG2KYr8DYsIMgljkTQAlnHKlfSd3KUvfn3nGT8jYBVPKxF0zQN7v2j8KAeU1VKP
         BLjr0fwKpXYWHzOWGBnyVspp9TOPeOL6+Hz9u6FI51u0GRRChjIBxYdJFHIbT7oe0Lo0
         Jx6BMfBXzU10Yeu5jXw6pBeh1PfPj2nBK+zX3NtjR4Enqp2n6n79aHYXquL1Tmso+twq
         q/F874WxuDz2FOGn9xMas8Z2RpIfXRuJqPvp6LNQjWkYudU0WlgpG7C1sIozaLohQ0ck
         WJcw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=m/YRAv/8KZ8KVf9PwAh3fMUUBmhWGb8w/XihG+36eqU=;
        b=hYqGQpHUtQs4X/PGlJyEV0OOTGATP5yVxJ3iiXDs/0LgIfqN/qF18wv0Ug5u796de6
         jEbQXYfwYMux42LrdogVh7CcHovs9QPVQIDzX23zzJzNBI+aGpoXCRP8YDTeUsBUOibM
         rl5YQTmwAKFibK6LbWmF46Rhnivw6ooaBB+PejkdQqxlOkj4KREmKAHHAH7VeI1T+rFi
         iH0MpH+gbMG9XEoHTVMAVEfAM7Y5CCQuz8PzcbTTqBOn45GtiavDMBZvsILeH0IQO/Jq
         ulDXGX+7+qeyr1qYis0y9X2aO9stiqq1v9n4c1/80aWtxKIAGwhPo4Z9YdQcGNB5G6DG
         +thQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=m/YRAv/8KZ8KVf9PwAh3fMUUBmhWGb8w/XihG+36eqU=;
        b=dzzW39t0YW25u0WdwHj5+ibOR3RvSziTIBA25gE1RCUhoxgL/7Xh3t+eQxkdpZv7x1
         cCU2m2sNCWplEAhNA2OUphMHPi8LBTnqxenels3MmRvF6WEbzXhz9SzmWoimUdJ++IL7
         1johUxZUnT0CBncUVYcBdYsblVYH4t4q6l9ZH1JaCkryM/gKZwGT+UiMqPD6CUo81VM8
         +jUR4BXbTW/USiffsev92V0uh0iiJKY7v3ZLM9oUykRyxdIt3iwyvCpfYFmcC+haTSrX
         K9PubrwEDGDgS3nah7xChmioi4n3i3SClNzCaWQj688yHXY+DU2zIxSES0yVIvOI850U
         8kbQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532xcUXwL1N2eC3NpnwaZxtwoH/ZjX4A+HUcsd228TWqcTXBs4de
	xeffblQBq7kFqo8Eq5iR9zc=
X-Google-Smtp-Source: ABdhPJxzHGs6ORC8YRt7CBR9ySCMuc8BBIuh2/EKSi3X45x8YbkNwdOdFeptU4yJy+ND/4HLivwUWA==
X-Received: by 2002:a2e:a492:: with SMTP id h18mr366505lji.103.1603915858079;
        Wed, 28 Oct 2020 13:10:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7a0e:: with SMTP id v14ls105619ljc.7.gmail; Wed, 28 Oct
 2020 13:10:56 -0700 (PDT)
X-Received: by 2002:a05:651c:1341:: with SMTP id j1mr380640ljb.41.1603915856677;
        Wed, 28 Oct 2020 13:10:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603915856; cv=none;
        d=google.com; s=arc-20160816;
        b=DKifcxRuFNLgvLSBFWPGw8Eql/gQ0ip5sGhRX5OXOHbD3Hj7q8uI2a68BpWUGTTQOI
         jK5Q6E23RAuswSXrEbT2lEwsjGmiO97M//oqTFjxAqzxLYMGqABdGB85TbYqBiqXR7c0
         uDP70+Z6x0vVN5vv15nL/m0Ek4eduPx1a5VJerJGgSoqPHgcqgzAe88JVTu3JY7IHULz
         toZDmH2wZBuKRSRzLgeOGc9hu8lRzYO9ajaNNqWqwPevGd4MXQiEi7MWqXZ3ucSdfGyb
         NPIAecLypm9Y4ylSEtLnzPh9Nit1lzJJ6NVkVSS9aaz9s/ji2rIoOPrhUxWOaG3+TSI6
         YV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Ya+drnhO14BfrwqsAv/wJH3+tc+oRpSP0yg4ogQdmys=;
        b=PunPfwuIcuxCKBs33TuOlD+dFHrh5+GTKv0TOJ5HX/vADX+wwHQa3HeYusmZzcAWXj
         PI/cZAUQLzt6tDROB4T6ctUqoIe4d/RrB2cocl0DUC12ex6ZMuKB/W8LRBZBFDSigzRO
         H69NwtfSeJw+frhx0T3I9B4Emq2xcNa2GyP2xa7KxDuJ06atvxyd58NpHZU7QEOl6fVU
         lOiQ/nGS/uFualWGg+PPgPTxez0+/ETZ6H5AGgsulXSaz77hgCiTlKuWR3OyrNQ/O4uV
         1WZKgIUPdqz6oxEswidDd/t9eH/ejDT5eWFvIBubjqr35KDpQXWgJQf4pYZtbyWUuinS
         YNow==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id a17si16501ljj.6.2020.10.28.13.10.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2020 13:10:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09SKAtre017087
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Oct 2020 21:10:55 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09SKAtef006813;
	Wed, 28 Oct 2020 21:10:55 +0100
Subject: Re: [PATCH v2 12/33] hypervisor, arm-common: provide an explicit uint
 INVALID_CPU_ID
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-13-andrea.bastoni@tum.de>
 <12a22fcd-2e7c-8d03-195b-b363f8e34019@siemens.com>
 <00dd9db2-3af7-a1f0-ddb9-0ef73aa7fe68@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8ad705e0-fec5-7b97-9fe2-d949b1fec58f@siemens.com>
Date: Wed, 28 Oct 2020 21:10:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <00dd9db2-3af7-a1f0-ddb9-0ef73aa7fe68@tum.de>
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

On 27.10.20 19:53, Andrea Bastoni wrote:
> On 27/10/2020 14:10, Jan Kiszka wrote:
>> On 22.10.20 19:58, Andrea Bastoni wrote:
>>> Substitute the implicit "-1" occurrence for an invalid CPU id with an
>>> unsigned int INVALID_CPU_ID that can be used in all "uint-related"
>>> comparisons.
>>>
>>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>>> ---
>>>  hypervisor/arch/arm-common/lib.c       | 2 +-
>>>  hypervisor/arch/arm-common/psci.c      | 4 ++--
>>>  hypervisor/control.c                   | 2 +-
>>>  hypervisor/include/jailhouse/control.h | 5 +++--
>>>  hypervisor/setup.c                     | 4 ++--
>>>  5 files changed, 9 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/hypervisor/arch/arm-common/lib.c b/hypervisor/arch/arm-common/lib.c
>>> index 916cd54f..889b3d14 100644
>>> --- a/hypervisor/arch/arm-common/lib.c
>>> +++ b/hypervisor/arch/arm-common/lib.c
>>> @@ -31,5 +31,5 @@ unsigned int arm_cpu_by_mpidr(struct cell *cell, unsigned long mpidr)
>>>  		if (mpidr == (public_per_cpu(cpu)->mpidr & MPIDR_CPUID_MASK))
>>>  			return cpu;
>>>  
>>> -	return -1;
>>> +	return INVALID_CPU_ID;
>>>  }
>>> diff --git a/hypervisor/arch/arm-common/psci.c b/hypervisor/arch/arm-common/psci.c
>>> index 6a9abf60..242cad5b 100644
>>> --- a/hypervisor/arch/arm-common/psci.c
>>> +++ b/hypervisor/arch/arm-common/psci.c
>>> @@ -27,7 +27,7 @@ static long psci_emulate_cpu_on(struct trap_context *ctx)
>>>  	long result;
>>>  
>>>  	cpu = arm_cpu_by_mpidr(this_cell(), ctx->regs[1] & mask);
>>> -	if (cpu == -1)
>>> +	if (cpu == INVALID_CPU_ID)
>>>  		/* Virtual id not in set */
>>>  		return PSCI_DENIED;
>>>  
>>> @@ -63,7 +63,7 @@ static long psci_emulate_affinity_info(struct trap_context *ctx)
>>>  {
>>>  	unsigned int cpu = arm_cpu_by_mpidr(this_cell(), ctx->regs[1]);
>>>  
>>> -	if (cpu == -1)
>>> +	if (cpu == INVALID_CPU_ID)
>>>  		/* Virtual id not in set */
>>>  		return PSCI_DENIED;
>>>  
>>> diff --git a/hypervisor/control.c b/hypervisor/control.c
>>> index b38ac2e9..0078ef19 100644
>>> --- a/hypervisor/control.c
>>> +++ b/hypervisor/control.c
>>> @@ -48,7 +48,7 @@ unsigned long panic_cpu = -1;
>>>   * @note For internal use only. Use for_each_cpu() or for_each_cpu_except()
>>>   * instead.
>>>   */
>>> -unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set, int exception)
>>> +unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set, unsigned int exception)
>>
>> Overlong line.
> 
> OK. Didn't think this rule was too strict when the readability was slightly
> better and since I find other places where it was not enforced.
> 

There are exception (long error messages) and there might be a few
missed cases.

> But readability is a subjective matter anyway...
> 
> In addition to my patches, should I fix the other occurrences or do you prefer
> to only change those if that code changes for other reasons?
> 

Primarily avoid adding new violations. We do not need to run actively
after such cases, though, I guess there is enough other stuff :)

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8ad705e0-fec5-7b97-9fe2-d949b1fec58f%40siemens.com.
