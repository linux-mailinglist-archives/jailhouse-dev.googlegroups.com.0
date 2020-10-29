Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCMG5L6AKGQE5SSKLUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7E129E6A5
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 09:53:30 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id s25sf997902ljo.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 01:53:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603961609; cv=pass;
        d=google.com; s=arc-20160816;
        b=tRkSgZK2d3m13L5Phw+4AngelK1SUGeTQo5KMzzKAXX48YQd3jA8vJvfYYDU37wZIw
         n3k9QIxAE+nJBLmtCNhYBvpFRBjYMzNVMz03O5km9FNmSQ/JD6P0LcE0jrDXAEFDPmSz
         38lbkYpc4mQ8lmjkFhodS6h43T/NY7y/bsnC23MTJ4cTkyzACncTDQD6nN3JA559IVRX
         8S3nLO3iJ1RDB5U7x6TMtAOfjWVMs0HJiLaYBzOyChufj1zxz4YK2Ye1BIfq+2MrwTxn
         E2WTM2RrQLWr/MoTAVjVi5DfOmcZ9+og/vV/Q20iNuCG5BH0UbwxMB1eCgGyx053OsAq
         YIuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=uaAZeC+ssRPjS6cs0/g2tqIxTLPg0wtYuLall7j2NcM=;
        b=1GnHiVkpZO0/Gf2WqPsWZUfGfRHo8MDWa5eIKpzN8+VRSFHPQqNcQ7Ty4I/Lm9y152
         hBhqsewFZXDLWIm5ZYa6JyGkMQgZszK6isy2BVamNV06ffiuCUPMOdIFdj+Rft+8rk+Q
         SXN4IUkUIIXoG3J6QMC19gDIQtkl5lOMU1bg1JG0gU/JYg5BQzYhVjF45S345oZjFsBx
         wgNz3KtBAbrPycoMEfLRh3HxXMVP8DPRRRnyyR6FLRQypOWQdjmEuYP0B1lBzED1Rp7p
         43Uuks7qgbE93twyI1AAH5uYzxuvKFhRJ0iNdQ/nKDNcMcVtLqqIN9SkFLx+ZAjGkiIy
         wjCw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uaAZeC+ssRPjS6cs0/g2tqIxTLPg0wtYuLall7j2NcM=;
        b=ia7Ot21jpyMj2mwts600sCVtHiMpr8IL8CzYKXbcENApCl6SsFnP8m2UF1XM7bdwH5
         CztPHkeROvMUNbyuI3NM5yDgtwGU2n//VTqoZWMjSk99eO2Qxrhmho9lvf9enkOIFUmg
         ghHz+BKZJsalJKvu4x8UY+S4ex6QH/o18Q2oy4TXCEl2GgMQfH/7+tBzyFRF4pZiV0sv
         03s8c4C6p75Loqbpj6dM0XnmrTGSE3W4M2WSuGmz9gHhpqAChos/5Iw0phS8Pv7btVzS
         +PE25vVYxbn+sAOndXQbcP1SVo7Asa5HzBndigZmyQNbMOC7c2kQAwKANcBpOWy1jQfL
         fqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uaAZeC+ssRPjS6cs0/g2tqIxTLPg0wtYuLall7j2NcM=;
        b=ljqTL0v636eNMNEB1riHXwe8ueixGvWzhyD0B1GOQlv0t/2djg3RONqyExwSozQEDH
         I9t7jmuJ6/uyI7O+/h9SBHcktZv2CYMxdtBGYqTPq4diFKBkwYT59k6qQ92+dewrRbwH
         iyeM2rcoofuSL+nFIy9ww6qOF1p926SigHbXl4isbXPPnTR/WUXG/f+bpKz9N0OXNZun
         2kOSvjuZMw59JuL/cyOlon2VTvTpMVKuAN0V0l8UpMEsxopkQIbiuCDYnpICD5Fx4fQT
         COU4wOE4Bp1gc3RPJreGWOiC6kjzzXUZ6h7a03qi1SheLzL00PplthRoN6y+0593xPJC
         ErgQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533I/zSVD5WxmJBYxrskH6v6zbqDazS8Bqt+o5emcfMbiH0XFGpg
	4PCyuJJb0dqG3iDU7peVO+Y=
X-Google-Smtp-Source: ABdhPJwAGqrMNQ93AcVUJKnlS5lX6EIbrlwECdDa/8PVWu5m6tyoFJGBwXZigyxt2P4SPEbCoeLxEQ==
X-Received: by 2002:a2e:90a:: with SMTP id 10mr1442974ljj.278.1603961609613;
        Thu, 29 Oct 2020 01:53:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls1085877lfd.3.gmail; Thu, 29
 Oct 2020 01:53:28 -0700 (PDT)
X-Received: by 2002:ac2:46cc:: with SMTP id p12mr1083545lfo.283.1603961608197;
        Thu, 29 Oct 2020 01:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603961608; cv=none;
        d=google.com; s=arc-20160816;
        b=DdJ486BAT94fvXkCH3daqHkyZa2EJiwe4Hyj5GeSR5+5Ac2OD6CvdE3q64AYeFp2o3
         mLRrQWgx/Pi/tRx4G1wBZikzarUQnQ57OYAlHa+dY43NGL5fHsz7uFUYSWb0Gc1mBund
         qPGtJ27p60cAKQNetKIHB5A6QBtsCQJH+fASEJQjZ7Md8dsPOda25Kpyck6DdPsqdDil
         23l5yvRr2pm3x6JfzJLmziP5gj4xmeXE2njTNwn14iBurisOPVmkeQ2I1Kcg+IoSa7/4
         BpQN44aXT+Bp5MKPPLymeZIxjHg6UlkW10GEcDgiFNq1kOFG46z3Cu1TeNSNcEEOQzH2
         P7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=6tjCHcnBDE+K1XONGf08ZbON1tGa2zGyZlMOnnluoHU=;
        b=JW3cBPZgTgDwf7FAX1G/MtIUHBi3OgxlZ9CPl/aVtVqNY2VfREgk6DenEJFXyR5D6P
         0I25Xk7NyXudl17XVxmH8Q8ar1ftI1q6mmH5TpscJwD3gTQr/oGke1fLV4zcraBzXUCF
         /ThMqhqrD1WdqT6AKwqoqwK55xOY+Sxhqt0QLKbpVb5MoXXavjedtEiNnl1gLuLSrUCg
         DNB71AF7QmBmqksxGDvFoO4B2IY/zZOWYEgkO7rkTbMmMNaoX5+BHtnGf0/ATYVo2HwI
         Jnswq1Bwv/gneCi9KFTWZkSQxw6coixJKdthfqGYIoxO7BMG4/F46V0bB5MsnuFJccAP
         CzQA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id x20si64776lfq.12.2020.10.29.01.53.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 01:53:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09T8rPaH023040
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Oct 2020 09:53:25 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09T8rNqG028342;
	Thu, 29 Oct 2020 09:53:23 +0100
Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
To: Andrea Bastoni <andrea.bastoni@tum.de>, Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>
Cc: Renato Mancuso <rmancuso@bu.edu>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
 <78334f5d-b665-8de6-31fc-10599877b3b1@siemens.com>
 <DB6PR0402MB2760F60895CFBCCAEA5F2F3A88160@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <bee3d688-1c2d-f4d8-f434-b9ff8d50ce10@siemens.com>
 <fd8fe9cc-9e69-4406-21e2-979b282b6d16@siemens.com>
 <8c0cec16-dc86-b316-ef84-af51a15c80aa@tum.de>
 <4b408440-354d-521e-0a88-e1541eaed1d7@siemens.com>
 <fa5b83f2-fa5c-e158-4b99-cc86db20ea43@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <eaa35809-1823-9bac-a971-12b9e4a2ec54@siemens.com>
Date: Thu, 29 Oct 2020 09:53:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fa5b83f2-fa5c-e158-4b99-cc86db20ea43@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 29.10.20 09:39, Andrea Bastoni wrote:
> On 29/10/2020 07:36, Jan Kiszka wrote:
>> On 28.10.20 22:29, Andrea Bastoni wrote:
>>> Hi,
>>>
>>> On 28/10/2020 21:14, Jan Kiszka wrote:
>>>> On 27.10.20 10:22, Jan Kiszka wrote:
>>>>> On 27.10.20 02:25, Peng Fan wrote:
>>>>>> Jan,
>>>>>>
>>>>>>> Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
>>>>>>>
>>>>>>> On 14.10.20 10:28, Jan Kiszka wrote:
>>>>>>>> Changes in v2:
>>>>>>>>  - map 52-bit parange to 48
>>>>>>>>
>>>>>>>> That wasn't the plan when I started, but the more I dug into the
>>>>>>>> details and started to understand the hardware, the more issues I
>>>>>>>> found and the more dead code fragments from the Linux usage became
>>>>>>> visible.
>>>>>>>>
>>>>>>>> Highlights of the outcome:
>>>>>>>>  - Fix stall of SMMU due to unhandled stalled contexts (took me a while
>>>>>>>>    to understand that...)
>>>>>>>>  - Fix programming of CBn_TCR and TTBR
>>>>>>>>  - Fix TLB flush on cell exit
>>>>>>>>  - Fix bogus handling of Extended StreamID support
>>>>>>>>  - Do not pass-through unknown streams
>>>>>>>>  - Disable SMMU on shutdown
>>>>>>>>  - Reassign StreamIDs to the root cell
>>>>>>>>  - 225 insertions(+), 666 deletions(-)
>>>>>>>>
>>>>>>>> The code works as expected on the Ultra96-v2 here, but due to all the
>>>>>>>> time that went into the rework, I had no chance to bring up my MX8QM
>>>>>>>> so far. I'm fairly optimistic that things are not broken there as
>>>>>>>> well, but if they are, bisecting should be rather simple with this
>>>>>>>> series. So please test and review.
>>>>>>>>
>>>>>>>
>>>>>>> Alice, Peng, already had a chance to review or test (ie. next)?
>>>>>>
>>>>>> I gave a test, sometimes I met SDHC ADMA error when
>>>>>> `jailhouse enable imx8qm.cell`, sometimes it work well.
>>>>>>
>>>>>> I suspect when during jailhouse enable phase, there might be
>>>>>> ongoing sdhc transactions not finished, not sure.
>>>>>>
>>>>>> I have not find time to look into details.
>>>>>>
>>>>>> Anyway, you could check in to master I think, we could address
>>>>>> the issue later when I have time.
>>>>>>
>>>>>
>>>>> Hmm, I would still like to understand this first... Do you have the
>>>>> chance to bisect this effect to a commit? Otherwise, I guess I finally
>>>>> need to get my board running.
>>>>>
>>>>
>>>> It's running now (quite some effort due to the incomplete upstream state
>>>> - e.g. upstream u-boot runs but cannot boot all downstream kernels...),
>>>> but I wasn't able to reproduce startup issues. Shutting down Jailhouse
>>>> often hangs, though, at least restarting does all the time. And that
>>>> even with next. Seems we still do not properly turn off/on something here.
>>>>
>>>> Interestingly, this issue was not present on the zynqmp.
>>>
>>> On a different version of the SMMUv2 developed @ Boston University (Renato in
>>> CC), re-using the same root page table as the cell created problems due to
>>> different attributes (uncached) needed by some devices.
>>
>> Why are so many folks working downstream on such essential things? Not
>> helpful, for everyone, even if the goal should be "only" experimental
>> results.
>>
>>>
>>>> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
>>>> index 41c0ffb4..60743bc0 100644
>>>> --- a/hypervisor/arch/arm64/smmu.c
>>>> +++ b/hypervisor/arch/arm64/smmu.c
>>>> @@ -220,6 +220,7 @@ static void arm_smmu_setup_context_bank(struct arm_smmu_device *smmu,
>>>>         mmio_write32(cb_base + ARM_SMMU_CB_TCR, VTCR_CELL & ~TCR_RES0);
>>>>  
>>>>         /* TTBR0 */
>>>> +       /* Here */
>>>>         mmio_write64(cb_base + ARM_SMMU_CB_TTBR0,
>>>>                      paging_hvirt2phys(cell->arch.mm.root_table) & TTBR_MASK);
>>>
>>> The issue in the BU version was solved by allocating a new page for this.
>>>
>>
>> Only the root level? How were those entries different?
> 
> Only the root level. IIRC, NC by default, instead of Normal.
> 
>>> I wanted to check this effect for the version on next, but didn't find the time
>>> to do it so far :/
>>>
>>
>> How was the issue triggered?
> 
> From the discussions I had, on the ZCU102, devices were randomly triggering
> erros/ stopped working.
> 

I just ran a enable/disable loop aside flood-ping + dd on the Ultra96-v2
(I would expect it to be identical to the ZCU102 in this regard), and
that did not trigger any (visible) issues yet. I'll retry with lowering
the enable frequency.

Jan

> 
>>
>>
>> I made some progress meanwhile: Linux was also using the SMMU. I'll send
>> a patch shortly that detects that, like we already in VT-d at least.
>> Interestingly, this should have been broken on the Ultra96 as well, just
>> didn't notice.
>>
>> With that, I'm running enable/disable loops now, but I lose my Ethernet
>> link after a while. Returns after ifdown/up, and the system looks fine
>> otherwise. Seems as if we drop transactions in the transition phase.
>> However, a dd running in parallel was not triggering any issues.
>>
>> Jan
>>
> 

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/eaa35809-1823-9bac-a971-12b9e4a2ec54%40siemens.com.
