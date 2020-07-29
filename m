Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB66VQT4QKGQEUF6BJKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B749231AA1
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 09:53:32 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id p23sf378373wmc.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 00:53:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596009212; cv=pass;
        d=google.com; s=arc-20160816;
        b=ja24vB7IEjn6VS8+s9qc+DjkDsK6M3/pliOw9mimFdMY+wmZKO9i3PzkHRq4zjjNOR
         DQUIXegRkQ9YFlp58pJt9bN3DEACq4NVvJrKfejjeUeg8eGenSj4adRKwYU4RzS6CFv2
         siQSlod7JvvjZm/47AhGt1sY4goRGik6cMPyQZb6Olmyqj1GSLrB9dw87R7OShLyqGiI
         U2VZaursKOlpuQWlGsTyHzYvcE8aE1XTbFOaFIFsoa2waTL8TUnfSgwY/btGZu13ovqY
         8gvpn3yjy1AJZHyL8dz0CdGCPM1mxmn5l8StsmfTGAQ6DK2aJkUF3kPsSlAkanrUsO/j
         B6fg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=bUzRcG9fsLnvCfeCgK+4FTrp06XlUIJCgs5NbK0XNkc=;
        b=cKWFbF7cTf6dywKcPDvwZLyGqBwd8/s6uDNMyA9KQckfOO3nWi/S9GXY7VFHsuwRzr
         pxmkUt8f2ciqYvV+MejZhkSd+767erqYVSlw8BuSoHm0CqKLMk+I02FUBv7zUC7zXky+
         IgKERb8COpxVOW2isrImSHTYKD72dcs75bJ/FrQoS2tq0N5IY2DqvEpgupd1IUaxxij7
         E80WtE37bke6qIV576s0GhdIOrNSg5NDejGX0lZLs8xky0lD4zjr7Gzj/FX7+1XhE0OG
         OyENg3PAKQx4ZWvl0K+vyWdEk435k2FKNe67By2XUMfT8rB8iCtep+ESJCuh+L6wH97Q
         Svbw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bUzRcG9fsLnvCfeCgK+4FTrp06XlUIJCgs5NbK0XNkc=;
        b=nPQaADAz8x5nMesfgMyRDl/wUH+qZxkCD/nUBnSFEYfd9dZ1OaLSWFmPGTtSURiaDf
         RNkw/5PVmsLWtzXTj6FfRUCbL1osPOBnF0Hcngwrg1IAqwgc+3tuCAKcPdFIWh4TLyV/
         AFVVxFe/4yIgvbTxQlQZUYLVCIcar0nCor7oBa4/jH/zfrMUyOGDnASfzEOkgOwMXuO3
         IBdnqENUlUSyKJ/3YbFD/ZClM7VjqRuEb533q5UxPgDj652hePBj1/nUaA2DGLcYy3ZU
         U7ohpnLoGSSK7GkrLK5VkWfVkW0TLTY3vqkS+cgbIQpN3IN4GyneV8DYchIV9upcKsR4
         c/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bUzRcG9fsLnvCfeCgK+4FTrp06XlUIJCgs5NbK0XNkc=;
        b=W7O/k9FkbXHtkYHUjrQRIOn5jIFePWTxW7eGPS7pkgJkgnDreog2Sz1c3C5pYI1AOg
         3PSrwk65YxmbKaDwz3H8n7wpuV11QrvlUckyQPhwck27rHegyrT+/oVFNwKHtaS8qHNS
         ymwhMpLCy6jljvCOI+kH51KChV1QmGGOt/NqTIyEJycR7I2Bv5T3Fsak9sXUNSLVQaZI
         8L80K3Qv0toQegtRUXjB/c27VPECB3mo2tIwC2CL3hsuKaEDNRlntq13+z42BWpn9mT4
         ByzY/VHqGhpaYTSVXuwMn7A0YSfsIawDPX726EIhpOaLIdzshhl9PCitobFipidLShTm
         b4lA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530zXG8xwXzBlvDuMBX2I9VvmTKicmZDKldIrmmkMMzoYLcMpyhz
	V751CVRl1JPFMfHJWWV563Y=
X-Google-Smtp-Source: ABdhPJwaeTtQxuYxuZkVh69SKD+DvuzlVhZK2LisyzLMwP1lsEU+BZjVyyGzEs+ObzHqQGLwIRTLRw==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr7998088wml.25.1596009211875;
        Wed, 29 Jul 2020 00:53:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6407:: with SMTP id z7ls1427378wru.0.gmail; Wed, 29 Jul
 2020 00:53:31 -0700 (PDT)
X-Received: by 2002:adf:9361:: with SMTP id 88mr24442952wro.403.1596009211072;
        Wed, 29 Jul 2020 00:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596009211; cv=none;
        d=google.com; s=arc-20160816;
        b=ae03MBK4I4xw1CXns1g3+eFSLJ0SyxSYaXdYh89gPlLGaZw3ClzApXBJCxdB0WstsI
         zmM4H/OjbHq2xaiik/OUHe7c//KypN76wpTFzp7nxBja9o+LK1N/EdLmUb7OZhTY0d9F
         ZBCFKzm9RQsqKsz6yDGMs4Lpaw0L45kI3tWMiRJReWGVMHWvghfiL6dMr79a+3DnKPPv
         kWlNzhSgQk1bko1gc8V9FOclSCPEj4aOp2ILSMTnLkagM1cse9AsDV+LDXmssy2m7K8P
         TlZcNjTcYq00Lxh6av0Fw57Z6rMoGIdQhu2nttgGUoMTRxLSNn2E1wfQfUDR0iXOJBzJ
         gK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Yrc852IIDK+4EfNCMXvLEFTIcc0Tr+Q7RHpfCLWsOJw=;
        b=Du/N1DnkseYDYpDF6EDTSKCd8nb788I1LaEJPIoYlzhHXAT8iW5IlvrgyVQq+GnktK
         udXEozgGEKY5gXyG/Dlm3f75hWJxeGfJiITyxJlW6gUWuAwztxG7oaQIt509KiTPbAtc
         XFjCVK8yR7cz3dLxs3vrBHqqxxPQ5nfxuxiKPHg086GnOBZQD6/i+Jpdk4lQRONJ5IQi
         3AnyAJLS4RmyJd8UV1zxQA6ci38FThik54prk899oSAibuWrUcnWwIj5xsfoKIvhbI6s
         ctAjj/LA3twojWqpqhd2otKjYuydHr+GnU/qviuyRrIVr3haech6cGIeILf7nryfJ9C/
         LGjg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 92si57435wre.0.2020.07.29.00.53.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jul 2020 00:53:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 06T7rUKl018627
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jul 2020 09:53:30 +0200
Received: from [167.87.13.2] ([167.87.13.2])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06T7rR4O010715;
	Wed, 29 Jul 2020 09:53:28 +0200
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
To: Marco Solieri <marco.solieri@unimore.it>,
        Nicholas Mc Guire <der.herr@hofr.at>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
        giulioc@xilinx.com, c.scordino@huawei.com, fabio.federici@utrc.utc.com,
        Luca Miccio <206497@studenti.unimore.it>,
        Angelo Ruocco <220530@studenti.unimore.it>
References: <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
 <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
 <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
 <76259743-55bf-4d28-f344-1d829e040d00@siemens.com>
 <20200727211308.5mxhkffz5aj27ocb@carbon.xt3.it>
 <8f358d65-eecc-405e-c659-00f501cf5040@siemens.com>
 <20200728091507.35bodtnsvbgcwxvr@carbon.xt3.it>
 <ee0c4b0a-9ea3-4978-43fd-fe38a1321e9c@siemens.com>
 <20200728110945.w4o52pgtq33ic2pv@carbon.xt3.it>
 <d8b12a27-69dd-e47e-a7e2-258192696bc6@siemens.com>
 <20200728224145.qj4ljq2zm76ueo32@carbon.xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3ebac25b-6f04-79c1-f2c1-998fa7ecb308@siemens.com>
Date: Wed, 29 Jul 2020 09:53:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728224145.qj4ljq2zm76ueo32@carbon.xt3.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 29.07.20 00:41, Marco Solieri wrote:
> On Tue, Jul 28, 2020 at 01:30:37PM +0200, Jan Kiszka wrote:
>> On 28.07.20 13:09, Marco Solieri wrote:
>>> On Tue, Jul 28, 2020 at 11:26:45AM +0200, Jan Kiszka wrote:
>>>> On 28.07.20 11:15, Marco Solieri wrote:
>>>>> On Mon, Jul 27, 2020 at 11:39:48PM +0200, Jan Kiszka wrote:
>>>>>> On 27.07.20 23:13, Marco Solieri wrote:
>>>>>>> If we understand correctly your
>>>>>>> implementation, you are mapping the entire memory region and then
>>>>>>> copying blocks of the binary image using what you called "colored
>>>>>>> offset" function.  That was very similar to our first (unpublished)
>>>>>>> attempt to implement "colored loading", and we soon discovered it is not
>>>>>>> very efficient.  Loading time grows considerably and could impede
>>>>>>> scaling up to larger images (e.g. an Ubuntu-like rootfs).  We think that
>>>>>>> a better alternative is closer to what we proposed in the last patchset,
>>>>>>> that is:
>>>>>>> - create a colored mapping,
>>>>>>> - perform a "virtually" contiguous copy of the image.
>>>>>>>
>>>>>>> We understand that this logic has to be moved outside the hypervisor, so
>>>>>>> we would like to move it to the driver, exploiting Linux virtual addres
>>>>>>> space to create the colored mapping.  What do you think about it?
>>>>>>
>>>>>> Did you examine what was causing this slowdown? It seems highly
>>>>>> counter-intuitive to me, given that we are only copying from memory to
>>>>>> memory in 4K chunks, just using different virtual addresses - that' all.
>>>>>
>>>>> I think you are right, indeed.  Doublechecking our old (and slow)
>>>>> prototype, we discovered we were actually not just copying at each
>>>>> iteration step, but we were also been ioremapping.  That was most
>>>>> probably the cause of the slowdown.
>>>>>
>>>>> That leaves only a design point in favour of the contiguous virtual
>>>>> mapping.  It makes the implementation more robust and elegant, since it
>>>>> enables the copy operation to be independent from coloring and thus
>>>>> reusable.  This is enough for us to favour this approach.
>>>>>
>>>>
>>>> To my understanding, the choice is between:
>>>>
>>>> for_each_colored_chunk
>>>>       copy_chunk
>>>>
>>>> and
>>>>
>>>> for_each_colored_chunk
>>>>       remap_chunk
>>>> copy_whole image
>>>> drop_mapping
>>>>
>>>> As the first option can be reused for uncolored images as well, I do not
>>>> really see the value of option 2. Prove me wrong by code ;).
>>>
>>> I see.  I would easily agree with you if we assume to use the
>>> `jailhouse_get_colored_offs` (or something similar), but we rather not
>>> do so.
>>>
>>> Instead, the `next_colored` function should be favored as the
>>> fundamental coloring algorithm implementation, because it is closer to
>>> the hardware meaning of coloring, in the sense that it preserves the
>>> notion of bits in the address, instead of abstracting it away behind the
>>> notion of offsets in the memory space.
>>
>> I disagree here. First, because this abstraction is a benefit - provided I
>> didn't miss a case.
> 
> Abstraction is good only until something meaningful for you is hidden.
> Then, it becomes obfuscation.  Coloring is a concept that cannot be
> separated from its bitwise nature just because of some additional
> hypothesis (contiguous color assignment or contiguous color bits) that
> restricts the generality without bringing value.
> 
> 
>> And second, because the algorithm avoids the loop for the calculation
>> and simplifies the loop for the virtual memory copying or mapping (the
>> latter is not implemented yet, so just a claim of me so far).
> 
> The loop for calculation is useful when you have to deal with non
> contiguous color assignments, but it can be removed, of course.  I guess
> that also the other kinds can be removed, but this looks orthogonal to
> the chosen approach (next_colored or offset).
> 
> 
>>> As a by-product, the implementation is also more flexible and generic,
>>> since it could be applied also to different kind of coloring, e.g. to
>>> bank coloring.  In these cases, nasty placement of useful bits could
>>> make an "offset-oriented" implementation hard to read (and also very
>>> difficult to write :-P).  E.g., consider a case where only 12 and 14
>>> need to be used for a 4-colors platform configuration.
>>
>> If you can point out concrete platforms/SoCs with such properties, it would
>> help finding the best solution. I dislike design decisions that are based on
>> speculation what could come. Usually, they take costs for "extensibility",
>> and the outcome will still have to be adjusted when the real use case comes
>> along.
> 
> I agree with your position against unfounded extensibility arguments,
> but it does not apply here.
> 
> - I am not speculating about unreal possibilities, I was referring to
>    real hardware. The first result I found is Intel i7-860, where:
>    - cache coloring is possible on address bits: 12-18;
>    - bank coloring on: 13-15,21-22.
>    A discussion about bank/cache coloring on such platform is in
> 
>      Lei Liu, Z. Cui, Mingjie Xing, Y. Bao, M. Chen and Chengyong Wu, "A
>      software memory partition approach for eliminating bank-level
>      interference in multicore systems," 2012 21st International
>      Conference on Parallel Architectures and Compilation Techniques
>      (PACT), Minneapolis, MN, 2012, pp. 367-375.
> 

Bank coloring has also been explored in PALLOC in the past 
(https://github.com/heechul/palloc). I think Nicholas (CC'ed) and his 
fellows did a prototype with Jailhouse as well. Would be good to collect 
the requirements from today's CPUs for that (i7-860 is probably 
predating the needs of Jailhouse).

> - Nor the next_colored proposal brings additional costs, since compared
>    to the offset implementation
>    - it is simpler and more elementary;
>    - it has close or equal performance;
>    - a tested implementation is ready in v2.
> 

I agree that, if we still face non-contiguous bit ranges, 
straightforward calculations have to be replaced with a bitmap search 
algorithm like you did. Maybe then using ffsl.

> 
>> How did FreeBSB - or what BSD was it? - model coloring?
> 
> FreeBSD supports only a simple form of cache coloring -- I would not
> consider it as a reference, especially about extensibility beyond cache
> coloring.
> 

Good to know.

> 
>> Any other reference that may have worked on more that one board?
> 
> We tested the proposed solution on Xilinx ZU9 and ZU7, Nvidia TX2, and
> NXP i.MX8 QM.  We have tested a very similar implementation logic also
> in Xen on Arm v8 (Xilinx ZU9) and x86-64 (Intel i5-5xxx).
> 
> 
> Do you have any point in favour of the offset-based alternative
> implementation?
> 

As said above: If we need to handle non-contiguous bitmaps, ie. multiple 
jailhouse_cache regions per cell, your approach is needed. Then we 
should improve the implementation (make it arch-agnostic, move to 
jailhouse/coloring.h, use [__builtin_]ffsl).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3ebac25b-6f04-79c1-f2c1-998fa7ecb308%40siemens.com.
