Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQFXTCEQMGQEZHF2LCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id D65873F7354
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Aug 2021 12:30:24 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id k13-20020aa7c04d000000b003bf04c03fc4sf12091075edo.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Aug 2021 03:30:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629887424; cv=pass;
        d=google.com; s=arc-20160816;
        b=jQNJ8sytQCAAYUh6jTkjWNiDIIlCCq2DJC5l0GWlAzvB8iDsAU2sc0dWSRfR/qSfvu
         Sxya2bW0ZF+yQRc5v/sDyIAMHWCDY8Tdt8Xa7ifIA+M67BSdP+7QRRXCNNtdE9rKbszI
         sk0zte+cGOs//PUeCrUUlJ+c1ZBCqeGZlmY6Ka1cP1fKkj4agJ2KXasC+7I1zFrvDWYJ
         N6WJTQvvlSbh/O+s8jkMdgK+y3wCGxc+WlI+lt91s0w1I3ZKroX3hEM2Gjf7VD7fw25X
         0CaF/rlgkIFWN69yP78vMkMzS43Jr8GIIhvXEiL6WfSGCixaORKGugKDKebaz4dj1bb4
         NWRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ppHG9p0+7l1REsj7L6QgDzAgTQyJgrG/6GUz+ImXaAM=;
        b=IHiKqXzOmDv9xrzO13PYiF6+nViRpu3ge0emIWEj+z445XYUQ2SXqZ9t6HUsEJdKGV
         78IdIaWBnhcfQ/AjixJVTnzbwpW/yzKloe/IyJVsdyC+VLVWSqHOpps1KANdkhG6gJSf
         8uBWjHAlLr9o50LP47o9QpsoOfnXD5c3Mx0ejcOnSGJbGe0xh1OmYa0iUTM2YEYuso0A
         360gy4yEgIBhErzgDSP+/zV0J9qMjnuJbRc5pIJ95kFz2y2Owbd0hIWiEhbnKpDKiWcL
         41Ur7bWR9wP4U+6lauyZ3UDFQ02fs+1+9f6Qw4jetHRBqlUvgB4x+eVxIHCyY9FELURf
         WsbQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ppHG9p0+7l1REsj7L6QgDzAgTQyJgrG/6GUz+ImXaAM=;
        b=ZJdfEWtUlEbb5EOsbiuKuXNZRvqun3Esy25G0zUw8rb/WcIupl8CvN7pM4HPvEDwpk
         9cvoTeN4eZvAWEDscZGpKlTSkWH55s35oBYMhLrejFRbzBXyBW0W3bhhXnho0R2wKCVE
         ESSkIX6Rr25mRzCeF6ZHCcWcmW6Ub9BsBAii+XrrwMEqGq/lTSnB/YjrHE4xwqHqWpgV
         WgCsAvXJ1xXxCgERagR0AeCaKmtF4wukzG2gdeUwRPGZgdEVEDOglF2f1DpX26LNLg7k
         2nAAlfreoXLeOHFZ4Azn/1aGL5+P4mDZl3D/qSwN7WwhhtzUUaXVi+1bXvZopkwqtKSf
         HQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ppHG9p0+7l1REsj7L6QgDzAgTQyJgrG/6GUz+ImXaAM=;
        b=ewr3d1e7CHr+LMBj/hbtrMYQKaGXj/+oZjtntQ8oBcKeT2VGOYq5AH0qLFBMwdpaG9
         ErCebULSb4NwIWWTyLdT097Ebtn8ws+3Dr6skoxo/D4k7SBvPVVa2kfZRZOPvf1KQAup
         PSr7G4k+sEu/OYK0tju7evzn1npIb0Tcjg3AdJiUoZ+hkwGiOZOBw9n1qnksZWuRPQO2
         ZoNNBvdJHZQU2BDAeAz6LmObStjULOyeFD9GXedMDlQjDqYG503ImUVVbHMMxTCSGyYk
         l0KeygHPof1XEArOPShilSu5xu5AJI1bSQrw6ZHiPOADqSuuRcy2INUtMLjcGzXl0pO2
         hMOA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531KC2XjFB44EFOk07jnJe9kjQCI+Zl5WTROmXd5qP+V54y9vwVE
	gS9Jc6UEhphjY6URSGCnrOQ=
X-Google-Smtp-Source: ABdhPJz4vKYkL7Ui/5kFgjmrekrM6RWelLhZq0R7tkTZGVPDntT0EmzGGLahM7lZIatwzko/Ua+KZQ==
X-Received: by 2002:a05:6402:1d8b:: with SMTP id dk11mr7460832edb.267.1629887424569;
        Wed, 25 Aug 2021 03:30:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7e4f:: with SMTP id z15ls898829ejr.1.gmail; Wed, 25
 Aug 2021 03:30:23 -0700 (PDT)
X-Received: by 2002:a17:906:c317:: with SMTP id s23mr18251391ejz.83.1629887423157;
        Wed, 25 Aug 2021 03:30:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629887423; cv=none;
        d=google.com; s=arc-20160816;
        b=Ghvanp3SmlWwWqKHi1JfG0bLDiRGQztLCbq2tic/ZEmRy3RMo2FHPmyPmFDP7zn3jE
         OtFtYx6uYAUCQGkUroopvoixYQ6BmLanbqDjae/g6ywpWXzfECPUzbs4rGcAHhsmLihH
         QuYLbY6fS6/w2/05rI9k0qIcVoyJvJz70Oiw/Fisje7ycOX2CuibpnYYkMgz7BxfpOcY
         Qs3NMlhM/ASFuXpet2sJoz4NqlvT24zMfJQlMiWfiIYzYLHat64bQJmu+TdKykwVJZJV
         cvbaIdQzfX2zM5CjoPMbuA2KIYuyfwqbY2LeVAsJqYB2m034NN1nXxqiAFnL3qqZ5klg
         1GCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=XAYtlHlvM+DfG+0C8/MwpJFuoVUzv65Vbvoh+CohNog=;
        b=IP+83G/Olbc2AD3USjINQS98QSyMq9ev2tAFiao6erARaaQ4jgpnWAR9tnPt95bqQv
         r8rWUsPbA74SI7/Ri4q90klN3D2TgqODAzwKpGC1qiEwlWHIYMpyUnorIgP0U0quxgWX
         6krYavTJv6WeKcf/ouEVoFcXXHLfLc+bDbniF0RQatu0q3HqjQd1tVIqqEd2BkYK8+5z
         epkhC/aFgF3smePZ8TbRzk13w5WsGUHvaxKidZaEw2Gh3vCPwlDutRk9+8GM6t+L/wKY
         ADA5lnVBIRd7sLOEtEyTA84Wo6/U0ZWCLrL3lAJyI2dJwSeN2/PVvffpGzaD6sJZnghT
         meBQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id z12si184692edq.1.2021.08.25.03.30.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Aug 2021 03:30:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 17PAUMBq032612
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Aug 2021 12:30:22 +0200
Received: from [167.87.245.18] ([167.87.245.18])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17PAUMcb000351;
	Wed, 25 Aug 2021 12:30:22 +0200
Subject: Re: [PATCH 2/6] x86/cat.c: Fix CBM for non-root cell w/ root COS.
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <PA4PR02MB66709EAFB592AB3A984173B0B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
 <fc2280e8-7800-2a80-a886-32179af203f2@siemens.com>
 <AS8PR02MB66632609691667C24AB23E92B6C69@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <bea596bb-88de-ed10-9329-782fd41d81a1@siemens.com>
 <AS8PR02MB6663DA419EAE9DE66D965A0EB6C69@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b33ef7aa-0210-1aab-c1f8-5194d28936f9@siemens.com>
Date: Wed, 25 Aug 2021 12:30:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB6663DA419EAE9DE66D965A0EB6C69@AS8PR02MB6663.eurprd02.prod.outlook.com>
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

[re-adding the list]

On 25.08.21 12:20, Bram Hooimeijer wrote:
>> On 25.08.21 11:38, Bram Hooimeijer wrote:
>>>> -----Original Message-----
>>>> From: Jan Kiszka
>>>> Sent: dinsdag 24 augustus 2021 23:13
>>>
>>>> On 02.02.21 17:44, Bram Hooimeijer wrote:
>>>>> The procedures for shrinking and extending the cat_mask of the rool
>>>>> cell affect other, non-root, cells as well, if these cell use the root COS.
>>>>> That is, when cells are configured without cache regions. The code
>>>>> is updated to reflect these changes not only in the root-cell, but
>>>>> in the struct corresponding to these non-root cells as well.
>>>>>
>>>>> Fixes: 3f04eb1753bb ("x86: Introduce Cache Allocation Technology
>>>>> support for Intel CPUs")
>>>>>
>>>>> Signed-off-by: Bram Hooimeijer
>>>>> <bram.hooimeijer@prodrive-technologies.com>
>>>>> ---
>>>>>  hypervisor/arch/x86/cat.c | 31 +++++++++++++++++++++++++++----
>>>>>  1 file changed, 27 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
>>>>> index f6719b1e..42fd83d9 100644
>>>>> --- a/hypervisor/arch/x86/cat.c
>>>>> +++ b/hypervisor/arch/x86/cat.c
>>>>> @@ -60,6 +60,13 @@ retry:
>>>>>       return cos;
>>>>>  }
>>>>>
>>>>> +/**
>>>>> + * Merge available bits in the CBM back to root by modifying the
>>>>> +cat_mask of
>>>>> + * the root.
>>>>> + *
>>>>> + * It is the callers responsibility to call
>>>>> +cat_update_cell(&root_cell), and
>>>>> + * to modify the cat_mask of the non-root cells sharing the root's COS.
>>>>> + */
>>>>>  static bool merge_freed_mask_to_root(void)  {
>>>>>       bool updated = false;
>>>>> @@ -86,6 +93,7 @@ static bool shrink_root_cell_mask(u64 cell_mask)  {
>>>>>       unsigned int lo_mask_start, lo_mask_len;
>>>>>       u64 lo_mask;
>>>>> +     struct cell *cell;
>>>>>
>>>>>       if ((root_cell.arch.cat_mask & ~cell_mask) == 0) {
>>>>>               /*
>>>>> @@ -125,8 +133,17 @@ static bool shrink_root_cell_mask(u64
>> cell_mask)
>>>>>               }
>>>>>       }
>>>>>
>>>>> -     printk("CAT: Shrunk root cell bitmask to %08llx\n",
>>>>> -            root_cell.arch.cat_mask);
>>>>> +     /* Cells using the root COS are also affected by shrinking. */
>>>>> +     printk("CAT: Set COS %d bitmask to %08llx for root cell",
>>>>> +            root_cell.arch.cos, root_cell.arch.cat_mask);
>>>>> +     for_each_non_root_cell(cell)
>>>>> +             if (cell->arch.cos == root_cell.arch.cos) {
>>>>> +                     cell->arch.cat_mask = root_cell.arch.cat_mask;
>>>>> +                     printk(", %s", cell->config->name);
>>>>> +             }
>>>>> +     printk("\n");
>>>>> +     /* However, updating the bitmask once suffices. This can be done
>>>>> +      * during code execution, no suspense required. (SDM
>>>>> + 17.19.6.3) */
>>>>>       cat_update_cell(&root_cell);
>>>>>
>>>>>       /* Drop this mask from the freed mask in case it was queued
>>>>> there. */ @@ -201,8 +218,14 @@ static void cat_cell_exit(struct cell
>> *cell)
>>>>>       freed_mask |= cell->arch.cat_mask & orig_root_mask;
>>>>>
>>>>>       if (merge_freed_mask_to_root()) {
>>>>> -             printk("CAT: Extended root cell bitmask to %08llx\n",
>>>>> -                    root_cell.arch.cat_mask);
>>>>> +             printk("CAT: Extended COS %d bitmask to %08llx for root cell",
>>>>> +                    root_cell.arch.cos, root_cell.arch.cat_mask);
>>>>> +             for_each_non_root_cell(oth_cell)
>>>>> +                     if (oth_cell->arch.cos == root_cell.arch.cos) {
>>>>> +                             oth_cell->arch.cat_mask = root_cell.arch.cat_mask;
>>>>> +                             printk(", %s", cell->config->name);
>>>>> +                     }
>>>>> +             printk("\n");
>>>>>               cat_update_cell(&root_cell);
>>>>>       }
>>>>>  }
>>>>>
>>>>
>>>> Valid point that arch.cat_mask for the sharing cell gets out of sync.
>>>> But what is the practical impact? We don't run cat_update_cell() for
>>>> sharing cells, and cat_cell_exit() does nothing in that case. This is
>>>> first of all to understand the impact of the issue.
>>>
>>> Fair point. I am not 100% into the details anymore, but I guess you
>>> are right that this does not have a practical impact. Of course, it
>>> can get a practical impact in the future if someone decides to use the
>>> mask for something, so I thought it would be good to fix it regardless.
>>>
>>>>
>>>> If there is impact, I'm considering to use (also) a mask pointer so
>>>> that there is no need to walk all cells on root cell updates.
>>>
>>> Just curious to get a better understanding of jailhouse: would these
>>> walks lead to a performance hit? The other cells would not be
>>> preempted, right? So it is just a list linear in the number of cells?
>>
>> Nope, my concern is just code size growth.
> 
> I see, will take that into account in the future. 
> 
>>
>> But while we may save a walk for updating the masks via indirection, we
>> conceptually still need walks for sharing cells to call cat_update_cell on them.
>> And that is probably the real issue with sharing as it implies stopping that cell
>> which is surely undesired.
> 
> I agree that this is undesired. It goes against both Jailhouse's philosophy as well 
> as the design intent for CAT, which is socket-shared indeed. 
> 
>>
>> We could only support "silent" sharing, i.e. between cells that have cores on
>> the same socket or otherwise withing the same CAT scope so that the
>> update done for the root cell CPUs automatically updates masks for the
>> other non-root CPUs as well (because the MSRs are shared).
> 
> This would indeed be the logical, and expected functioning. I see that this would
> require Jailhouse to become socket-aware, which might make matters more
> complex.

Well, the refactoring I'm doing have to goal to at least statically (at
configuration time) model CAT topologies. Those follow the last-level
cache topology, e.g. 2-cores share a CAT domain on a quad-core Apollo
Lake SoC. Or each socket has its own domain as it has its L3 cache on
Xeon processors. That's why I'm adding a cache ID field so that CPUs can
refer to the same cache instance.

> 
>> It's a complex beast, this CAT, despite its minimal interface.
> 
> Let me look through your other mails and see if I can think of some ways to
> make it simpler. 
> 

And I'm trying to bring my refactoring in a sharable form. They seem to
work on L2, wasn't able to retest on L3 setups again, though.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b33ef7aa-0210-1aab-c1f8-5194d28936f9%40siemens.com.
