Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBANETCEQMGQEYPSYO3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A4C3F7247
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Aug 2021 11:48:50 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id s15-20020a2eb8cf000000b001cbf358ed4esf1622965ljp.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Aug 2021 02:48:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629884929; cv=pass;
        d=google.com; s=arc-20160816;
        b=WmCwGfZETo7V62Dt7wJpQlA2JYTXir5t4n2V/PN/StYCMAcNMbCzX3hOXKKVqM9knp
         sHkboOE5gha+GlF2UWa/aY9ne1knd0kPpBr4ScHy51QbhQmVTDqaKywYzOaqnBdrUI4x
         UWyADlbjYUMW5QUj1rK2UMmFXn0pTZQ5ygpZaewXiuzzRUq8D16Vlx6BLvFICNdNsgSx
         vQytMQFbg8absj01n6GtcUUxNyjqG0NdDgS6JwmoLWNnqiazbdb/gXNC/zKwexL9bTHc
         m4do2OBXmFJIDWTgpznwjcuG7qbN/eyGjeq+/BJjo1XdnQYGjzLp0dMPF8BtkHiQ1HqR
         Jg+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ATqtzkS8zqdoNDTWro+KZm4idNj7yJsbKX/vW/Nf4p4=;
        b=SrrQw54hhZFfVECI7MTJEIAS436SmdS6qM+2bHOm8G9hEmDTfd0tU/Y25gfC7cetrl
         IQ6n1EJ8Ht0NJXHiztlZEUSeCcBaZXlUmnZC3xLfR9i2G9tSb7xMje+g7uHj8vBF0In7
         ZouKvAt43mGvlsEvuqWCa0vHM/JYCHa1jSOA9JB/FQITx7txYtrAwoxWx9V3eBghheHb
         uY/Sd69OBYIf1mA6jP5Rqy2nwXPnz8JxLeqpi3vckWiY8hHt8vUEEfAxdtWNkf2lS6Af
         CAzbfxW8uFswtgmCmjVHMD2fe5RlfFVyczKoVuCSP7JC5orNZEm3kWwpuMhhulFBWgO7
         RuhA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ATqtzkS8zqdoNDTWro+KZm4idNj7yJsbKX/vW/Nf4p4=;
        b=iD0VAS+GIFbBqF2cQvk8JIUO3LpoZCWJmXKuDk/Ej91ntb0WFR4P3chXWUng0RzhiI
         cMTQ/5/4ipZlQhQ0dKTlE9S4p2Pxo8hZgva/bM+RcC9Gi/TQTubEg0LQ+sH7e1/wGnob
         mRbBTGcPyqo+lGUU0x79GRqyYDmtQXhlXFyQb+QX0qOBZB7fKNfpJEoq5h5N1tX1JZnr
         lNhgnmpRUOhzpIeBmAABc3hJswBrJr4kSczu9bI38nAAEBTb3RsrPBOILY54wl5MDF00
         pe4k4bXEyqyVa1Dp9GNLjyQePJalMtmf6Skqk3kDPCfYMoYvhZeMwQ44Pyr/0O0KvpIw
         qnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ATqtzkS8zqdoNDTWro+KZm4idNj7yJsbKX/vW/Nf4p4=;
        b=D+HlpPO/YHysAo0roRVPS/rMkX0qUZHSe46+1/qfcx1RQHnkbi6AM/TK1oa09cREg0
         b4Y8RoYziWeg18wh/kylG1LYmGp8QWW0kkROGsTv9jtjGXpulaFbFfTwJwjMhZ7aivCu
         XPz+IYZ8NE1m4XUfFePAA/JTvPsaSAWyJrYFl9GRn2rx3kQwKrjeATXfUgcyOVX9QUiw
         uGgEBxKOESdHkPAR0+TrZZG7oZbbI+7OJpimw6AJNsVJDF7Dyibdw+DKIdNt30bIKp4p
         PBv2qYGpp2ZZnz9aCAnny0RMxTSeJtliM6VH3K9NlsC3BlNhgYRqPHSVrjDTtcztIDvr
         4YyQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531jWg2/iavmDV1yhtvkNs+L3wujloHPX6D2+q8CbV38cbVYSA5D
	UkXUYqFRpZQedaW8cYvy3Pk=
X-Google-Smtp-Source: ABdhPJzlhL8M0RjRqMvHzRSQaDHJxLxmj6Htf+w5iC1Xwc4W96D3O0J3dOhVeVcRdtDId9XHcmfvhw==
X-Received: by 2002:a2e:a889:: with SMTP id m9mr16974631ljq.195.1629884929678;
        Wed, 25 Aug 2021 02:48:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:c13:: with SMTP id z19ls1002802lfu.0.gmail; Wed, 25
 Aug 2021 02:48:48 -0700 (PDT)
X-Received: by 2002:ac2:5f04:: with SMTP id 4mr809304lfq.499.1629884928371;
        Wed, 25 Aug 2021 02:48:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629884928; cv=none;
        d=google.com; s=arc-20160816;
        b=RPu8OVpw4OgYTFeH6ss91MlpC7auKrRjjboIMrmP0iISpy2hEnSsPWj62ZF1p12J2a
         O8CT2tXsGovKmHxYWNgj7IVul3YsXS9tWjplI03ElKq5bQTZ1vWrPQ1EDEwhHXVj8LUt
         pHW1CMElO/xsifK9CkktwM98Ijud8pcsmKzgTpAxqX7AJcIGXzDX1hSK6r0yk7GevQXq
         Ak1nqrFInhSWzxC2KAunjbtyv6B35NcNb2SLXE2ifzUSWddECDJhCvqXT3XsEyb/DIVg
         eNLwtRGdvxL1MVCK+puHA/TrDEQxoWbehvDqnMWyuz1OXwuoUN+og2q9wmilVGyTlssz
         eELQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=6thj+Rjsys56P0mRUWoOCwh5yiC4/4X267j9e8zvcx8=;
        b=DB3Ssc196xsVCZO2dYMMz1n1kL8snrHW6+zMBAnktMVeK8SuLnrCB5NBocWCYyGFzr
         NKAva0xl6OqUpLGcl9fJCgzNf/vQ06SVOw1MaDo9Dmgx9BvltYiM5tzymgIK7lQ/pJLK
         gOo7+PmmnF9E0zHh0InDBxtiHwcpoXz1q+6arIvH1dLmRg/Cja5TcMyoxjgWCrDyR7dh
         hFI5kcji9z/c/MfCVjWIR700KQvdQ3Ox2X/S3qYTg+GfLEhGSQTnGBkBgg+VkjW34pDJ
         r48rVoFX9uXo965bf7H1dkK6+Z/odS27xzDzfsBl61BCUiFE//Ywhs0OSVDq8N/45f83
         6aBg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id h2si1192543lft.5.2021.08.25.02.48.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Aug 2021 02:48:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 17P9mlU6028026
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Aug 2021 11:48:47 +0200
Received: from [167.87.245.18] ([167.87.245.18])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17P9mkRI021807;
	Wed, 25 Aug 2021 11:48:47 +0200
Subject: Re: [PATCH 2/6] x86/cat.c: Fix CBM for non-root cell w/ root COS.
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR02MB66709EAFB592AB3A984173B0B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
 <fc2280e8-7800-2a80-a886-32179af203f2@siemens.com>
 <AS8PR02MB66632609691667C24AB23E92B6C69@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <bea596bb-88de-ed10-9329-782fd41d81a1@siemens.com>
Date: Wed, 25 Aug 2021 11:48:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB66632609691667C24AB23E92B6C69@AS8PR02MB6663.eurprd02.prod.outlook.com>
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

On 25.08.21 11:38, Bram Hooimeijer wrote:
>> -----Original Message-----
>> From: Jan Kiszka
>> Sent: dinsdag 24 augustus 2021 23:13
> 
>> On 02.02.21 17:44, Bram Hooimeijer wrote:
>>> The procedures for shrinking and extending the cat_mask of the rool
>>> cell affect other, non-root, cells as well, if these cell use the root COS.
>>> That is, when cells are configured without cache regions. The code is
>>> updated to reflect these changes not only in the root-cell, but in the
>>> struct corresponding to these non-root cells as well.
>>>
>>> Fixes: 3f04eb1753bb ("x86: Introduce Cache Allocation Technology
>>> support for Intel CPUs")
>>>
>>> Signed-off-by: Bram Hooimeijer
>>> <bram.hooimeijer@prodrive-technologies.com>
>>> ---
>>>  hypervisor/arch/x86/cat.c | 31 +++++++++++++++++++++++++++----
>>>  1 file changed, 27 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
>>> index f6719b1e..42fd83d9 100644
>>> --- a/hypervisor/arch/x86/cat.c
>>> +++ b/hypervisor/arch/x86/cat.c
>>> @@ -60,6 +60,13 @@ retry:
>>>       return cos;
>>>  }
>>>
>>> +/**
>>> + * Merge available bits in the CBM back to root by modifying the
>>> +cat_mask of
>>> + * the root.
>>> + *
>>> + * It is the callers responsibility to call
>>> +cat_update_cell(&root_cell), and
>>> + * to modify the cat_mask of the non-root cells sharing the root's COS.
>>> + */
>>>  static bool merge_freed_mask_to_root(void)  {
>>>       bool updated = false;
>>> @@ -86,6 +93,7 @@ static bool shrink_root_cell_mask(u64 cell_mask)  {
>>>       unsigned int lo_mask_start, lo_mask_len;
>>>       u64 lo_mask;
>>> +     struct cell *cell;
>>>
>>>       if ((root_cell.arch.cat_mask & ~cell_mask) == 0) {
>>>               /*
>>> @@ -125,8 +133,17 @@ static bool shrink_root_cell_mask(u64 cell_mask)
>>>               }
>>>       }
>>>
>>> -     printk("CAT: Shrunk root cell bitmask to %08llx\n",
>>> -            root_cell.arch.cat_mask);
>>> +     /* Cells using the root COS are also affected by shrinking. */
>>> +     printk("CAT: Set COS %d bitmask to %08llx for root cell",
>>> +            root_cell.arch.cos, root_cell.arch.cat_mask);
>>> +     for_each_non_root_cell(cell)
>>> +             if (cell->arch.cos == root_cell.arch.cos) {
>>> +                     cell->arch.cat_mask = root_cell.arch.cat_mask;
>>> +                     printk(", %s", cell->config->name);
>>> +             }
>>> +     printk("\n");
>>> +     /* However, updating the bitmask once suffices. This can be done
>>> +      * during code execution, no suspense required. (SDM 17.19.6.3)
>>> + */
>>>       cat_update_cell(&root_cell);
>>>
>>>       /* Drop this mask from the freed mask in case it was queued
>>> there. */ @@ -201,8 +218,14 @@ static void cat_cell_exit(struct cell *cell)
>>>       freed_mask |= cell->arch.cat_mask & orig_root_mask;
>>>
>>>       if (merge_freed_mask_to_root()) {
>>> -             printk("CAT: Extended root cell bitmask to %08llx\n",
>>> -                    root_cell.arch.cat_mask);
>>> +             printk("CAT: Extended COS %d bitmask to %08llx for root cell",
>>> +                    root_cell.arch.cos, root_cell.arch.cat_mask);
>>> +             for_each_non_root_cell(oth_cell)
>>> +                     if (oth_cell->arch.cos == root_cell.arch.cos) {
>>> +                             oth_cell->arch.cat_mask = root_cell.arch.cat_mask;
>>> +                             printk(", %s", cell->config->name);
>>> +                     }
>>> +             printk("\n");
>>>               cat_update_cell(&root_cell);
>>>       }
>>>  }
>>>
>>
>> Valid point that arch.cat_mask for the sharing cell gets out of sync.
>> But what is the practical impact? We don't run cat_update_cell() for sharing
>> cells, and cat_cell_exit() does nothing in that case. This is first of all to
>> understand the impact of the issue.
> 
> Fair point. I am not 100% into the details anymore, but I guess you are right
> that this does not have a practical impact. Of course, it can get a practical
> impact in the future if someone decides to use the mask for something, so I
> thought it would be good to fix it regardless.
> 
>>
>> If there is impact, I'm considering to use (also) a mask pointer so that there is
>> no need to walk all cells on root cell updates.
> 
> Just curious to get a better understanding of jailhouse: would these walks lead
> to a performance hit? The other cells would not be preempted, right? So it is 
> just a list linear in the number of cells?

Nope, my concern is just code size growth.

But while we may save a walk for updating the masks via indirection, we
conceptually still need walks for sharing cells to call cat_update_cell
on them. And that is probably the real issue with sharing as it implies
stopping that cell which is surely undesired.

We could only support "silent" sharing, i.e. between cells that have
cores on the same socket or otherwise withing the same CAT scope so that
the update done for the root cell CPUs automatically updates masks for
the other non-root CPUs as well (because the MSRs are shared).

It's a complex beast, this CAT, despite its minimal interface.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bea596bb-88de-ed10-9329-782fd41d81a1%40siemens.com.
