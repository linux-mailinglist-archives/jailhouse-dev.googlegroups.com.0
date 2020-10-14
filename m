Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSPNTL6AKGQEP72Y4BA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A96F28DB44
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:28:59 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id v125sf286732lfa.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:28:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664138; cv=pass;
        d=google.com; s=arc-20160816;
        b=Mw8tHWnoM+GvNyxwDFKvHLjKaBoyVyGGEa1xkK7ByBWL8f3kzX2fk9DhTOjY/rY9bf
         35qo44P7q07uD/BLo9GmhREI6QIl9/rkbX5LLxIoCH2trm8jYLRSnzPfJ5vLmchNJKIq
         24b11BwS4TWylJiCTxv1Y5iaLor0llK/qxHuVUQ4XNMKe6BfPFd5ms9yQpmpVT5DyHKk
         Pk2O3WYpH7uc2h+5n0C5eqPc+0dPTAaRRgEy1GRzP96lc+J28cH2xUv3j+6FsN2GDORg
         3jZ4EtoiQp5+UrzL6t3h3Z/Jp1byCJufEHgygLXZi9rziGxcpEO4Mwm9XffXqIgp0dnS
         n2EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=wWjRKHOyPNrSMRvoue1afp/RKd/vHIFaQPqGKmVaQjA=;
        b=TyJYpwc3TBdZ75rnFJ+9MLWI/BvgkI1kNYqVBTm2/mLOQJhxAqtjmPJiEC6sLK4JoO
         ZhjGZrth2wicBr1CX59B9c1lT+ZYnxCJhlQ6q3Z7//ppf0LEgzXw4VI1TFpK/zzqfwpt
         DtqUy/v/JAto0HlTS5wYkLIm49Hddy4PQoe7NhDnfxQp5R7+vJz8CDi3or5bjDxWfSXl
         Gv8DmurXRXOJM9//ovHbAnY3wQGJAZW6kZzpT3+XBxQB0RUZxMU4QuIiaqZaeGriRu4J
         ygb7OF4V2JDxBTJfiDAwZf4uYqqKd11nx+soRGY6ck2izoWqbslUI5M1JttswJtcokku
         4WVw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wWjRKHOyPNrSMRvoue1afp/RKd/vHIFaQPqGKmVaQjA=;
        b=aHRoWbPPGpO3tZFE8uYjRVzeMdsU417PHJWM5Oh4/OoUUSuSikdBRMmThaGBm9eW48
         Xp3JJkuaoSfPUSFhn2N/ONJrfC3/x4nHNWVhf1oEumVXSri1CIn7eVPOaP4Pu1fMh6Ll
         Nsn7OkqGf4lzyNGQ6ya7ycjKSSTJhubE15QMvplQ857rJuI7p3N4fupgmT1q6Vb65Y8c
         9UIoVMShJ2bOsa14B3HvKM/Bhqojc7bhAFXfpGC1KkRnOZjlo/CCOq9iZkzawRKPkDg3
         dy6hJ9VesqYzIB8oLl7rp1Yqvg9BxA1Qoq65PwdTYnVY1ZfsixbsvwLqwG/JSgvXhtMI
         846w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wWjRKHOyPNrSMRvoue1afp/RKd/vHIFaQPqGKmVaQjA=;
        b=Qt+Fo1IWBSjL3V5nDl5MNlHR+tM+VDbvkr7XBn8GBe/UJsOACHFA+K6dms6nnYvLMG
         2xQwzlTQx7xdjeE8rsy6nzLmBksGUExuvTR9uMBzmkeleH596yF92U5KlJ2uGXAfgXrh
         vVWQw8m+djUEMXKLYFvzvnCv0uDPs55Xv9FzYfC2n9NrhiCrap0vMraFwu8L9WMGDvoz
         5HrVMh7P4dKpirTVfb3LFrvwb4Zi/jJP+gRducGaAA3cuv53swGiFNN8gjPltcH43s7H
         deJ5M/EYiB4V9kEGLrqvdNzV/um0hoKo2SNylfHo1jw6PO2JV7l0C+KigLFaNa8bBYf8
         rV7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532w+/dGgoBZ2YcdKdF+fmZHCnrMdRa3YbhgHAXeBkXFMpcSKWt/
	S2ERqFR7qsAipQW2q/wSZdA=
X-Google-Smtp-Source: ABdhPJyiADMCdyCRipUvUL51B7Z61nRoMifc4amnAaRK1LdrZnBsJq9Pxz2kL1YPe4jkJgxPJ15nJw==
X-Received: by 2002:a05:6512:48e:: with SMTP id v14mr1011354lfq.359.1602664138542;
        Wed, 14 Oct 2020 01:28:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7a0e:: with SMTP id v14ls487754ljc.7.gmail; Wed, 14 Oct
 2020 01:28:57 -0700 (PDT)
X-Received: by 2002:a05:651c:22f:: with SMTP id z15mr1449903ljn.324.1602664136957;
        Wed, 14 Oct 2020 01:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664136; cv=none;
        d=google.com; s=arc-20160816;
        b=bP9XetWo9iNV0KSpygnLNO+fs9kklwsggk3fRBlAp6ls5ytTqIDbEEFmbLpQxw06aD
         kgbsuWTmbZCsFAGzDOrKqHA4jChm+RVa5BFIdhsmniexUP/gZhEuQhwabTR5i9vUD0U3
         fAbKF3d7s4d2Xa4HxeCFp+CZO+LpLmP9Lf+whgqamaWtHjGQtzRjegTgwXrsld/4U9oM
         e902pJCBRJCUxMkNFUkvsrBqgqW8CWtXi03gI2NETQXJ6zFkMMJEmFffLW/BFByrTj2U
         3iVW9M52zLO9kdlbj9RZ07/pxwbQNJ7J3DQQRMJOLZdCmv7SoImYK3nL5CFENtq3zg4p
         WFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=wuWNjJIHn+pEiAGoT6hcUsr77DlKmUkRROMr+E5eW8s=;
        b=hb0VpnbwfWZGNnIlk3zEliY7UgVzZfFmgox5mOfSt1Nu0uNDOSfBA2Rg+j7RuQ8TPh
         k+RncRGeXpQCtlipNNKq1ufg8ee6jeECjiKC9lG1GTqtBhVQU74P0rGWTLard6rJk4Qj
         Eq+2orTIj2jca8SIqcW6dNky0Q1mJ+Gop8lhDryKDdz4bVD23U4jfbiE8uowa/6Mu3t1
         K0ncLrQ7Yvz4RkmiU4UmC/mChuFDMGx9B0QkbB2jYy5nlutGqV4ZmQQMvbRUDhRcKLCT
         x9bJHqfS1c6EJ1KdEc46/fya2SHIKtwJiDWSV8VXXCXsoZ/ZWl0hdcJ3yqWn4EFAWeLo
         9dyA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a1si80106lff.2.2020.10.14.01.28.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:28:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09E8Ssvp021108
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Oct 2020 10:28:55 +0200
Received: from [139.22.132.102] ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8Sse7002432;
	Wed, 14 Oct 2020 10:28:54 +0200
Subject: Re: [PATCH 03/45] arm64: Simplify get_cpu_parange, add 52-bit case
To: Chase Conklin <Chase.Conklin@arm.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Peng Fan <peng.fan@nxp.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
 <7434305f16589d47d0248ba127edd82bf234d9e0.1601838005.git.jan.kiszka@siemens.com>
 <AF18C444-D146-4E7F-9D8B-F1DCBD161882@arm.com>
 <3a2f9cd9-3cb6-611e-4cb2-642f8280ee86@siemens.com>
 <a4e8e137-e632-c312-3252-261a03cfc46a@siemens.com>
 <de3b9649-6e4f-cac7-2216-8c88572b0a16@siemens.com>
 <D7163164-6A8C-4704-9E08-CB0E97BBCCF4@arm.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8b50894d-2ab1-85e1-bcb4-cb68616ef1f9@siemens.com>
Date: Wed, 14 Oct 2020 10:28:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <D7163164-6A8C-4704-9E08-CB0E97BBCCF4@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 06.10.20 14:50, Chase Conklin wrote:
> On 05.10.20 23:58, Jan Kiszka wrote:
>> On 06.10.20 06:50, Jan Kiszka wrote:
>>> On 05.10.20 15:25, Jan Kiszka wrote:
>>>> On 05.10.20 15:13, Chase Conklin wrote:
>>>>> On 04.10.20 2:00, Jan Kiszka wrote:
>>>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>>
>>>>>> Array lookup is simpler, given this input-output mapping. Cover the
>>>>>> 52-bit case as well at this chance. This also obsoletes a couple of
>>>>>> PARANGE constants.
>>>>>>
>>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>> ---
>>>>>> hypervisor/arch/arm64/include/asm/paging.h |  5 -----
>>>>>> hypervisor/arch/arm64/paging.c             | 19 +++----------------
>>>>>> 2 files changed, 3 insertions(+), 21 deletions(-)
>>>>>>
>>>>>> diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/arch/arm64/include/asm/paging.h
>>>>>> index 67664efa..932dbb50 100644
>>>>>> --- a/hypervisor/arch/arm64/include/asm/paging.h
>>>>>> +++ b/hypervisor/arch/arm64/include/asm/paging.h
>>>>>> @@ -101,11 +101,6 @@
>>>>>> #define SL0_L02
>>>>>> #define SL0_L11
>>>>>> #define SL0_L20
>>>>>> -#define PARANGE_32B0x0
>>>>>> -#define PARANGE_36B0x1
>>>>>> -#define PARANGE_40B0x2
>>>>>> -#define PARANGE_42B0x3
>>>>>> -#define PARANGE_44B0x4
>>>>>> #define PARANGE_48B0x5
>>>>>> #define TCR_RGN_NON_CACHEABLE0x0
>>>>>> #define TCR_RGN_WB_WA0x1
>>>>>> diff --git a/hypervisor/arch/arm64/paging.c b/hypervisor/arch/arm64/paging.c
>>>>>> index db8314a6..cccce410 100644
>>>>>> --- a/hypervisor/arch/arm64/paging.c
>>>>>> +++ b/hypervisor/arch/arm64/paging.c
>>>>>> @@ -26,6 +26,7 @@ unsigned int cpu_parange_encoded;
>>>>>>   */
>>>>>> unsigned int get_cpu_parange(void)
>>>>>> {
>>>>>> +static const unsigned int pa_bits[] = { 32, 36, 40, 42, 44, 48, 52 };
>>>>>
>>>>> Hi Jan,
>>>>>
>>>>> I think it's safest and easiest to treat the 52-bit case as if it were
>>>>> 48-bit.
>>>>>
>>>>> The 52-bit case is a bit trickier than the others in that it requires a
>>>>> 64KB translation granule. With a 4KB translation granule, the maximum
>>>>> number of PA bits is 48; programming for 52-bit is treated as if it were
>>>>> 48-bit, so having this indicate that output addresses are 52-bit is a
>>>>> bit misleading.
>>>>>
>>>>> The real problem is that we set T0SZ such that the input address size is
>>>>> the same as the output address size. When not using a 64KB translation
>>>>> granule, programming a 52-bit input address size will result in
>>>>> translation faults.
>>>>
>>>> Ah, good to know. Will fix this. Also requires to cap
>>>> cpu_parange_encoded accordingly.
>>>>
>>>
>>> Fixed up in next. Not resending yet as the series is large, waiting for
>>> further feedback first.
>>>
>>
>> Hmm, I just realized that we are hard-coding PARANGE_48B for the initial
>> page table in entry.S. Is this safe even if the supported range is smaller?
> 
> It should be. Recall that the issue with 52-bit was really because the
> input size (VA bits) was larger than what is supported in the 4KB
> translation granule; there was no functional issue with programming a
> larger output size as the architecture would treat it as the largest
> supported value. Here, we don't have the input size problem and, like
> with the 52-bit case, the output size is treated as the largest
> supported one. We'd expect an address size fault if the translation were
> to produce an output address larger than the maximum supported size, but
> that shouldn't happen here since we assume that the PAs for the UART and
> hypervisor binary passed to init_bootstrap_pt are sane.
> 

Thanks for the clarification!

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8b50894d-2ab1-85e1-bcb4-cb68616ef1f9%40siemens.com.
