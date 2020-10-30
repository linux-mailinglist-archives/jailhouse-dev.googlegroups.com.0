Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUNR576AKGQENXHG5LQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 138612A00E0
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 10:11:46 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id r19sf997035wmh.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 02:11:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1604049105; cv=pass;
        d=google.com; s=arc-20160816;
        b=y/lHzZX5Zsl46P1vpOefEUS/N+oGvVt8HqppgspkpMAQC2qMsYVOt/iJZz31/taTCV
         6FOcqTX4+ni0c0BKWoSB81nHgpyFSHkl6SOX/VnT27+f2tTVQtcosX5+v7qYW1ub83KD
         R7kjWZVOLirSZULFAOs/EskRl/SwhkZErW/3HthBZLJaZabTE9IQMCK+CbQEtF51NyGh
         4xuHjRAEyF3nUZK9o93JhNRM4k3tzB76R5XkBHTCvBer8HIFNw+IzRxIagd3D5YjpuDT
         21TrqJYZrmPhi0qLGL24W9ql3yeaoF9Qm5LdkBjFv+8zwWGdjNH3v9ovTzY9p6OcNomI
         5r3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=loU2tHeOj8mGA+wTwMNKUC5tW85R+kSVfFcz/Td1f1o=;
        b=k4AEu9Vb2Vfo31tZEAuIfIaXY5ufrg0W4px4E4itEXvFNR9qTH9o+B72SyaywZdOp1
         DTuUbobBhUTHWR8F51l42zRYEQpMspngr+CkbQiiEMxENq5d8NessVD7CGh5pAVtWhVF
         KcNPLM7BCGlCFoXCNbipfUZoG/1jUKX26Awyk/PoJHKl6DJEwcrdMzDZAsYgay7WVT9w
         YyzpUHLwBF0H47xIFAPukrpgBLiPEVAqRkopqWD+IQJapd+ZweQXoCEweyWs4blbL/+W
         t+EAB4MAzTh1bemEwPEVBPPMfutGrE0Evv2Mpp6NluITmLTIepg1hkFVJNcBeZeXCweB
         sw0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=loU2tHeOj8mGA+wTwMNKUC5tW85R+kSVfFcz/Td1f1o=;
        b=LksRhWFRv/UfSIGUoZY/RsBRuIGmPVs/8EWRCij4vzy7/K/u/mR00XDBenFGcuJjdG
         xeC/ZxFoTXXkqcYsJDQFCOQ67lAbL3k+1xxyQ/PjZV4nHu04GVYNTfy5bmI5JcHoCYKi
         QOZveqTkfsUOlvPVXs8Z3XRh6lDthPm4MYDtG1RhT55PymZH4c5HSxkcw1q3+zW73WwP
         8HYq18aGe7agHFDhsTh9c/9iKVv9ygY0Vw53CXt/ARPamblkX84hdvdcOwP+CIGCBgKS
         BuQwIquAejBpcKRSVYNmMHjlarie2QUxsV7T1rzHQPOiLJDQryD/LfM9aS0RIE2Y2p7C
         YO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=loU2tHeOj8mGA+wTwMNKUC5tW85R+kSVfFcz/Td1f1o=;
        b=ZiqtNWs2RbTSO8D7dklSFJpJklk6UXbYULnUCsM2LotBzmijdw5lUqLMxj4LqJRCox
         5HRpfp7zaHtbkzaCaHcFQojgnM7zG+w10RSBEBVqYYAPUZ6PoGFFFWaedZRU/trhy+t8
         jko0NBl/03KTSxqrdbDSa5yXs9k2+X3nXz3z6orCZYKZnV2kEW/kw4ekeMPEoklSgD7+
         wYJMtNc2CaZQvsVTacnFFT7BXH+3P05XwWrWKrSkP7HPWWoujDsa67pbSGQ/O3XguXCq
         PaxV5skZw8/3vVK/UKB8zs3GRtkoPkclPWrCEiOaPJ7YHXmJVV2wW1iVhnILBqUsLmFP
         59fQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5301rJjZ6pQ6yUqyYMpbbNg6cO5J7EVqZNTAVpruxBo+uKZ8BTXC
	qK+AVp4CYRULeSbOz4dz8C8=
X-Google-Smtp-Source: ABdhPJyzU73TIk07B48IuV7PqI9I/QbumG4Z+VP2/T+/0CyHPPSiqktIQjhPgSLtYfOP+cgJhxX4TQ==
X-Received: by 2002:adf:914c:: with SMTP id j70mr1884134wrj.170.1604049105765;
        Fri, 30 Oct 2020 02:11:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f7c4:: with SMTP id a4ls701761wrq.1.gmail; Fri, 30 Oct
 2020 02:11:44 -0700 (PDT)
X-Received: by 2002:adf:f3c4:: with SMTP id g4mr1862198wrp.207.1604049104683;
        Fri, 30 Oct 2020 02:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604049104; cv=none;
        d=google.com; s=arc-20160816;
        b=EXztQHwvGwhEgXIsi1TSsWHds0LqRaWsoJr+NuYoADSeqQMzOGLwmU4F8AfUMQ/s2N
         czYrpk0T1HCAx5u2C1UZSbjyo2swiyo6Z1tjdjBAgC+H1dwsADFSmuPTOLxn96U/dxbH
         29R7fmtFU1KqkPITJ75h59pdSXlb5ropP9sNINRMdjRxAnw9LCglLWCOy9jgZ+E2FRnm
         R8q0GwJQgRg7/jeww68ZpsyM8+9hOp4mF0AFDKNFA/QmaN3DcOZ7D9JWY0AIzYtL97wi
         MbmFlXdi1dmCQGFxEOi6phTOAdlEjm9XbYKTt4O+22BeJ22/Ua1XaUUM7jbUf3a7hzEI
         B3SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=9UuW9evA/q8MStKJhuJi6FExZR0vdoAB5JaOaAT7vR0=;
        b=gqBKXradk9czKgZNvjd8+4BFqVmTEBmMutjjXiCIBcy5pwnx9Q6pCYAqWfUORyNCUT
         klEczRWCo2vRl5qiFVbC+nCmLnsJl/sz7KpCFuZfLz6ke2IxW0mcX53d+8kH4MiwAaCf
         3GOzjWNQKOU41pBEhtPjUdDEFxp8HA/6WHrV/JnT/tlVtnf2Iz140/gb+53Kcp0N6y1+
         JlZa9/liZdcMSWasVXcMe8mPQmSiLTsjnhp+OZUzUEhRWw2OWAW0yC4pNxnF7c0/qeY7
         /xBZikc4DLzMJYd46kg8kX17Wm9d8+dH7ULgB3HkZVN2toPs4DIi4V4zr0L2TgpPBuX/
         dw7g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z83si24920wmc.3.2020.10.30.02.11.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2020 02:11:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09U9BfDt006193
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Oct 2020 10:11:41 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09U9BefZ002259;
	Fri, 30 Oct 2020 10:11:40 +0100
Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
From: Jan Kiszka <jan.kiszka@siemens.com>
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
 <eaa35809-1823-9bac-a971-12b9e4a2ec54@siemens.com>
 <72e5d7a9-e647-e0c5-62a6-9572cbdeee67@tum.de>
 <30e5b66a-f514-c4c8-e517-49dccd94a097@siemens.com>
Message-ID: <03da8732-0592-cdc5-c4d2-b5edcb3cab5d@siemens.com>
Date: Fri, 30 Oct 2020 10:11:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <30e5b66a-f514-c4c8-e517-49dccd94a097@siemens.com>
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

On 30.10.20 09:35, Jan Kiszka wrote:
> On 29.10.20 16:26, Andrea Bastoni wrote:
>> On 29/10/2020 09:53, Jan Kiszka wrote:
>>> On 29.10.20 09:39, Andrea Bastoni wrote:
>>>> On 29/10/2020 07:36, Jan Kiszka wrote:
>>>>> On 28.10.20 22:29, Andrea Bastoni wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 28/10/2020 21:14, Jan Kiszka wrote:
>>>>>>> On 27.10.20 10:22, Jan Kiszka wrote:
>>>>>>>> On 27.10.20 02:25, Peng Fan wrote:
>>>>>>>>> Jan,
>>>>>>>>>
>>>>>>>>>> Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
>>>>>>>>>>
>>>>>>>>>> On 14.10.20 10:28, Jan Kiszka wrote:
>>>>>>>>>>> Changes in v2:
>>>>>>>>>>>  - map 52-bit parange to 48
>>>>>>>>>>>
>>>>>>>>>>> That wasn't the plan when I started, but the more I dug into the
>>>>>>>>>>> details and started to understand the hardware, the more issues I
>>>>>>>>>>> found and the more dead code fragments from the Linux usage became
>>>>>>>>>> visible.
>>>>>>>>>>>
>>>>>>>>>>> Highlights of the outcome:
>>>>>>>>>>>  - Fix stall of SMMU due to unhandled stalled contexts (took me a while
>>>>>>>>>>>    to understand that...)
>>>>>>>>>>>  - Fix programming of CBn_TCR and TTBR
>>>>>>>>>>>  - Fix TLB flush on cell exit
>>>>>>>>>>>  - Fix bogus handling of Extended StreamID support
>>>>>>>>>>>  - Do not pass-through unknown streams
>>>>>>>>>>>  - Disable SMMU on shutdown
>>>>>>>>>>>  - Reassign StreamIDs to the root cell
>>>>>>>>>>>  - 225 insertions(+), 666 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> The code works as expected on the Ultra96-v2 here, but due to all the
>>>>>>>>>>> time that went into the rework, I had no chance to bring up my MX8QM
>>>>>>>>>>> so far. I'm fairly optimistic that things are not broken there as
>>>>>>>>>>> well, but if they are, bisecting should be rather simple with this
>>>>>>>>>>> series. So please test and review.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Alice, Peng, already had a chance to review or test (ie. next)?
>>>>>>>>>
>>>>>>>>> I gave a test, sometimes I met SDHC ADMA error when
>>>>>>>>> `jailhouse enable imx8qm.cell`, sometimes it work well.
>>>>>>>>>
>>>>>>>>> I suspect when during jailhouse enable phase, there might be
>>>>>>>>> ongoing sdhc transactions not finished, not sure.
>>>>>>>>>
>>>>>>>>> I have not find time to look into details.
>>>>>>>>>
>>>>>>>>> Anyway, you could check in to master I think, we could address
>>>>>>>>> the issue later when I have time.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Hmm, I would still like to understand this first... Do you have the
>>>>>>>> chance to bisect this effect to a commit? Otherwise, I guess I finally
>>>>>>>> need to get my board running.
>>>>>>>>
>>>>>>>
>>>>>>> It's running now (quite some effort due to the incomplete upstream state
>>>>>>> - e.g. upstream u-boot runs but cannot boot all downstream kernels...),
>>>>>>> but I wasn't able to reproduce startup issues. Shutting down Jailhouse
>>>>>>> often hangs, though, at least restarting does all the time. And that
>>>>>>> even with next. Seems we still do not properly turn off/on something here.
>>>>>>>
>>>>>>> Interestingly, this issue was not present on the zynqmp.
>>>>>>
>>>>>> On a different version of the SMMUv2 developed @ Boston University (Renato in
>>>>>> CC), re-using the same root page table as the cell created problems due to
>>>>>> different attributes (uncached) needed by some devices.
>>>>>
>>>>> Why are so many folks working downstream on such essential things? Not
>>>>> helpful, for everyone, even if the goal should be "only" experimental
>>>>> results.
>>>>>
>>>>>>
>>>>>>> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
>>>>>>> index 41c0ffb4..60743bc0 100644
>>>>>>> --- a/hypervisor/arch/arm64/smmu.c
>>>>>>> +++ b/hypervisor/arch/arm64/smmu.c
>>>>>>> @@ -220,6 +220,7 @@ static void arm_smmu_setup_context_bank(struct arm_smmu_device *smmu,
>>>>>>>         mmio_write32(cb_base + ARM_SMMU_CB_TCR, VTCR_CELL & ~TCR_RES0);
>>>>>>>  
>>>>>>>         /* TTBR0 */
>>>>>>> +       /* Here */
>>>>>>>         mmio_write64(cb_base + ARM_SMMU_CB_TTBR0,
>>>>>>>                      paging_hvirt2phys(cell->arch.mm.root_table) & TTBR_MASK);
>>>>>>
>>>>>> The issue in the BU version was solved by allocating a new page for this.
>>>>>>
>>>>>
>>>>> Only the root level? How were those entries different?
>>>>
>>>> Only the root level. IIRC, NC by default, instead of Normal.
>>>>
>>>>>> I wanted to check this effect for the version on next, but didn't find the time
>>>>>> to do it so far :/
>>>>>>
>>>>>
>>>>> How was the issue triggered?
>>>>
>>>> From the discussions I had, on the ZCU102, devices were randomly triggering
>>>> erros/ stopped working.
>>>>
>>>
>>> I just ran a enable/disable loop aside flood-ping + dd on the Ultra96-v2
>>> (I would expect it to be identical to the ZCU102 in this regard), and
>>> that did not trigger any (visible) issues yet. I'll retry with lowering
>>> the enable frequency.
>>
>> I extended the configuration of the zynqmp-zcu102 to use the SMMU and I've
>> started similar tests (enable/disable + flood ping + find /).
>>
>> With the flooding ping I can regularly trigger ethernet errors in the diable ->
>> enable interval e.g.,:
>>
>> [  373.470078] The Jailhouse was closed.
>> [  374.957052] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
>> [  374.966376] The Jailhouse is opening.
>>
>> Maybe just outstanding transactions.
>>
>> I got once an extended error that included the SD card
>>
>> [  112.215426] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
>> [  112.223243] mmc0: ADMA error: 0x02000000
>> ... full dump ...
>>
>> But I cannot detect from the log if it was after the disable or while jailhouse
>> was enabled.
>>
>> I didn't have time to debug much further. I want to double check (also with a
>> colleague) my current stream_id configuration because I only covered the LPD
>> masters and I want to check the other TBUs. (I'll post the configuration once
>> I've checked it.)
>>
> 
> I think I found another issue, may "The Issue" (tm): We enable the SMMU
> prior to having the guest page table created. That is only the case on
> config-commit. I'll try to move the device-reset function there and give
> that a shot soon.
> 

Yep, I have a stable enable/disable loop on my imx8qm now. Requires some
smaller refactorings. Patches will follow.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/03da8732-0592-cdc5-c4d2-b5edcb3cab5d%40siemens.com.
