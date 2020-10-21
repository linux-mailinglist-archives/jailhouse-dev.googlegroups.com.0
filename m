Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBJUVYL6AKGQE7PJGNUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8240D2952DD
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 21:23:19 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id 11sf1451138lfg.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 12:23:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603308199; cv=pass;
        d=google.com; s=arc-20160816;
        b=zoL5y4Ok1RTO1wllMtjlvfn3d4bZcIbX02ZeEugPv06zsAAJ1JVNYeWCl9BFoMYige
         fo4u2Wbg2qyfqoFopIcjNRBPg1ovKMUZ28ZJ1KnVrR+SYyN2icPClmcZs/wn/QD5Dn+i
         fugaP+tiZ5IGFSq7yt2i1tSnLjvBcnNFoSzeJ73nCnI2Durp5pk6LalNdj4KbqLELBR3
         XH5ZRoZ5lxDHOknnQW30d0Ji/HLvyJ8/V8HjBzj8n6ZFq/e1MZIAqd8KA+YTCs3YwCIx
         P4ER3dZ5L2eHJN9wkcuEAtLO8kHgtOerHRSr10UM7M2O9+7Wqql4XP51PUSI6sE4Dr9f
         qpgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=yRE59F+b9FjAo21tU6cyz2y4pU3Rkyzv9+6+hAdqHX4=;
        b=O0IdSTJP2gFLDSgmKKoiWXihg7FzaExXuiQ0NYNKJ6NnmwjsPB9/PMUvgnPhZqoY4h
         ychCfHPOFBTDKyBA3TvyEGdELOWwkADWXz0dIuNN0EzACfXiRy3uMjXah3aQln6jLKXZ
         3CwOd86oQ/aBcS65zOkUrKkolA5L+EGpV52kGijUOdxJC5u5pjRobjcRVdwyCXe6JJJa
         +ZDs6jMVSSk39Z+ehvq5ZkwUEfJdOjDR8m5PTDW7MCL6910i4X1bm3vcr7EIHtwyoHhD
         y+skgU8GEosa/v5dRRatYPzz8Tua7PtU//CU4ISBtk0kAQ8132X3M8oLMVkY5MvhrGqQ
         wCSQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=U6WfJisT;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yRE59F+b9FjAo21tU6cyz2y4pU3Rkyzv9+6+hAdqHX4=;
        b=CEBNH6LyiJ/lVmnL+1HaN67Jb8hqtHDlibS2i0W+jKyPxkmApuQOsHIA5slpyoUpUf
         vg8hBVoZwWAXC93iKz6mYvJLYG6xDpN5gTzQ/EZgp5ghy40n7hJLjm9apMaBMKOLMkL5
         qYUQxtP0vF8Xmlg/OYjgG7Oh0zhpezjzJkWppfTdyWXWjuxUmr9tEPGGBkgbusaKy4lt
         GYTU6O8UK3C6lfqcGuH3GIEbVVFJqk0UI7PZFf5woSH4CgzBnE2eZqIrQ6EQwC2+hprM
         T91AftiKUzKpNQM52KLYxvC66FWBl9xFoS5awVJncp86gOc9tsXBgEY0IAWt94LF+Jij
         6mhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yRE59F+b9FjAo21tU6cyz2y4pU3Rkyzv9+6+hAdqHX4=;
        b=eIRxG4S4U5mUoGOfxHykc1rVD+8mwQ9wqB1Npflxa67+/9WA7oWEgW1EQ1ekokH/0C
         JZGO0yU2cJOzlhXbMUPnCnJM2EoDp5fL0aZuorE/7bn6Cff+xReQhfMb4MURNgRfRr3S
         I5bZbG0Y6kewTOW+jSM6yS8orGn5MNI1SwwI03pPo0oVKMa3dF+eudWFTtgcYsg9fXFM
         MHb0V8pIxSjyaAigwtKgCpyBArY7yqtIh/mD0kxp95Q1fbNjD9GKrysL7FoPejrxcO7T
         Y4TSoW99pLiFYuI6cLD8N2AI/mM/5LRJ4txdvyYDNDDy5gfFxV/4wh5UPS9y2OC0U1c1
         N1JA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530L4/93L0aeyHRwHipfF1qR8dPJojARtO11bS2o0pMuFgjnI+NN
	OacoEtW5CmI15igxm8ZbRjw=
X-Google-Smtp-Source: ABdhPJySNZgolcp9uP8HGLxntKXWtgRsjyoYck53ydQyNtBHGn4eX12PHKk7rDp3oB/ETtNF1y8JkQ==
X-Received: by 2002:a19:52:: with SMTP id 79mr1877457lfa.222.1603308198956;
        Wed, 21 Oct 2020 12:23:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b016:: with SMTP id y22ls88973ljk.3.gmail; Wed, 21 Oct
 2020 12:23:17 -0700 (PDT)
X-Received: by 2002:a2e:54f:: with SMTP id 76mr1901644ljf.73.1603308197729;
        Wed, 21 Oct 2020 12:23:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603308197; cv=none;
        d=google.com; s=arc-20160816;
        b=zj+hKNxANpU15n8yUl7+42gN2TaGcGrNU+aiXClvu+0S52vbnzYpH3y9cM+pyPcs1B
         JLk4YVtmiu3n8k9BaYRlSZlzSTgCq/ucJ6Rg27dEneK8mqu7CPa8eO6V1LJSIzVPcdZD
         aeRrOjld90V3xP0wa7ouXlrmY6GrkOS7uf8370T7N/d8gJBWGwNS3oRf7ydVW63yOxlx
         KksEyz0+A4L4p3juEvQT7i+oh/xlYNKheRjx9SdieyUb44Mb8DWP2RKsPIc5nVmd4elG
         DLojLat6MrlY52YJckdOVRToIiLBG+TgIzLOFqPc4U3USCEn25qz1nvL/8VuipcPkVLG
         nNHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=wvQXioNdznA9u+hl5CvPvd9e2s+UZcwddkEcM72HE3M=;
        b=IukNMqIhI2P/0vFdJ556TRo5L+HdQuV+9Z1+EpLYqFr9jegRbPrcYy0EppXQj93758
         zEAiakfQhS2BcaFRpXkWb1o7Xq6VuHMYRtVNx1STLXc7DuYq+/8gsuXb7bG+nXHqbc/z
         w/jpIJKQpUCM6G/mEPAANqy8qDAyfJMs/9/ylNEj3U9+HmTWgwaAx4AkKnRLglbR1ONu
         ZziVOi/0UwCtvcio34DznsggTjIdtF7rWZz7ub5zEqzDB0IBLmRNHgJ5GXmZvCJ9kn9D
         8npGSrFTPWa4xAtYPkFJF1CcAL/oVPhL+V24jAg+Q8nPyA86n6bAztN4nKP/rnSY5Wec
         j9KQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=U6WfJisT;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id o22si43092ljp.8.2020.10.21.12.23.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 12:23:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CGgPx1fHJzyZK;
	Wed, 21 Oct 2020 21:23:17 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.873
X-Spam-Level: 
X-Spam-Status: No, score=-2.873 tagged_above=-999 required=5
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
	LRZ_URL_PLAIN_SINGLE=0.001, NICE_REPLY_A=-0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id YFy4RNDKwajo; Wed, 21 Oct 2020 21:23:16 +0200 (CEST)
Received: from [IPv6:2001:4ca0:2fff:11::2aa] (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CGgPw0Q1XzyZH;
	Wed, 21 Oct 2020 21:23:16 +0200 (CEST)
Subject: Re: [PATCH 00/26] Extend hypervisor compile warning set (and fix
 warnings)
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
 <7c3c49ea-93d7-2a15-d844-a2004231ebc5@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <aec791f3-9637-b08e-99b5-56d2b6341cce@tum.de>
Date: Wed, 21 Oct 2020 21:23:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7c3c49ea-93d7-2a15-d844-a2004231ebc5@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=U6WfJisT;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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

Hi,

On 21/10/2020 20:41, Jan Kiszka wrote:
> On 21.10.20 16:53, Andrea Bastoni wrote:
>> As part of a project I was experimenting with compiler warning options
>> that partial covers coding standard rules from e.g., MISRA 2012. An
>> example is Wconversion, and the narrower sign-conversion, sign-compare,
>> pointer-arch, cast-qual. E.g., Wconversion covers MISRA 2012 10.3 (and
>> parially 10.4, 10.1).
>>
> 
> Thanks a lot, this is valuable work! While standard compliance does not give you
> good code per se (*) and - if blindly followed - can even be counterproductive,

Agreed. It's not uncommon to actually indroduce bugs while blindly fixing
warnings... I hope I didn't do it ;)

> some warnings are low-hanging fruits, some report missing cleanups, and there
> was at least one bug caught this way. I'll go through the patches carefully and
> provide further feedback later.

Thanks!

> 
> (*) I once heard the saying that most coding standards exist in order to reduce
> the damage unexperienced coders can cause to critical programs. The sad truth is
> that such weird combinations are not uncommon in commercial software projects...
> 
>> Before enabling those, I've enabled some other warnings to filter out
>> definition/declaration "issues" that would clutter the compilation
>> otherwise. Specifically (Patch 0001), I've added: -Wextra -Wundef
>> -Wnested-externs -Wshadow -Wredundant-decls -Wdeprecated
>>
>> The warnings were not too many (most of them related to
>> unused-parameters), but there were some interesting ones e.g.:
>>
>> hypervisor: provide dedicated declaration for __page_pool and __text_start in
>> globals.h
> 
> Actually, it's only __page_pool, and we should make that global via paging.h.

Ah, right, __text_start is only used in setup.

>> hypervisor: introduce uptr_t (depending on the wordsize) and define size_t
>> accordingly
>> hypervisor, arm-common: provide an explicit uint INVALID_CPU_ID
>>
>>
>> The patch series fixes the warnings generated by "-Wextra -Wundef
>> -Wnested-externs -Wshadow -Wredundant-decls -Wdeprecated", and two small
>> bugs:
>>
>> x86: bitops: only x86_64 is supported, avoid picking the wrong default suffix
> 
> How did you come across that one? Luckily, we only ever set bit 0...

Saw this warning and took a look at the disassembly. Panic is probably not so
common anyway.

hypervisor/arch/x86/include/asm/bitops.h:54: Warning: no instruction mnemonic
suffix given and no register operands; using default for `bts'

>> arm64: smmu: fix double negative
> 
> Good catch. I will fold that into the original commit, providing credits.

Thanks.

>>
>> Up to "0024 x86: bitops: only x86_64 is supported, avoid picking the
>> wrong default suffix", the series is the same for both master and next.
>>
>> These two
>>
>> arm64: smmu: Wsign-compare: make iterator uint
>> arm64: smmu: fix double negative
>>
>> are only next related.
>>
>> I've compile-checked x86, arm, arm64, and tested arm64 (ZCU102), but I don't
>> have a suitable arm / x86 physical targets and I'm still figuring out
>> a crash I have on qemu-x86 (can reproduce with plain jailhouse-image
>> qemu image).
> 
> Obviously, I would be interested in learning about how that issue looks like and
> how you reproduce it.

Sorry. It's just me. I redirected the console not to use the VC but the serial
and I must have changed the default configuration. The exact start-qemu.sh works.

>>
>> I don't know if there's interest in extending the compiler flags with
>> warnings about code structure, but since the code compiles cleanly with
>> the patches, I thought about sharing them.
> 
> In general, anything that is providing a reasonable chance to reveal real issues
> early is welcome. But it's always a balance between excessive code restructuring
> to avoid false-positives or still oversensitive compilers and potentially
> valuable warnings.
> 
>>
>> Additional info:
>> gcc (Debian 10.2.0-13) 10.2.0
>>
>> JFTR:
>> Wcast-qual generates 276 warnings on arm64 (but they looks ~ the same,
>> it could be feasible fixing them) Wconversion + Wpointer-arith are a
>> worse beast (~ 1400 occurrences), and the "int" return convention in
>> Linux doesn't make it easy to cleanly fix them.
>>
> 
> Those fall under
> 
> "W=3 - more obscure warnings, can most likely be ignored"
> (linux/scripts/Makefile.extrawarn)
> 
> and there are likely good reasons for that.

Eheh, maybe too many warnings ;)

Maybe for smaller safety oriented code bases some of them could be considered.
E.g., it should be doable to preserve a const qualifier, and a (void *) may be
just casted to the right type when used in an operation, or if security is of
interest Wpadded could help for the API interface.

But yes, Wconversion, is a lot for likely very few catches...

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/aec791f3-9637-b08e-99b5-56d2b6341cce%40tum.de.
