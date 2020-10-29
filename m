Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBN775H6AKGQEK7JRHYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id EF45829E68B
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 09:39:19 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id z8sf997681lji.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 01:39:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603960759; cv=pass;
        d=google.com; s=arc-20160816;
        b=bPespnjsXTSLimJ91c1vMR3Youa/HVDKcx+HCRd7/VdgmCl2XZuOKTOmT3nzgwIVrt
         RaR6488P5GVM4AuymOB4sZyq1NlviDqGTPmuYd8mSeINLQJODQMdyZ5QLfnv4tmQ/Z07
         pAw2U/bEL3I9X2HAwd118w5XW5ThgFoD/N10qaNzyFbFGNu/5Ly817iy3IQ9EHoyJ0FU
         AehChlKOIzmpUyp1TLKaoFzEXhZRz7jJ8GIIDGjwa6ySyNaz/nup7mx4lyLMDGpSZxGg
         FjFCMoM8qQ8UQtFaLX4Wt6l45AKy7R0ckSISq4OkfmW/PGXOr2Yih9odmt3br2OkXzNV
         vfmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=vueDyk0w6wGHO5yrABqYp0PTO2iamU8zAfHRcMKPS7Y=;
        b=qBL7iLmBRIi1IKSHsitCkx9cWg7tvP7vZkcoXyinAD+iJ8XH4I78ByRd5/edsFDUhr
         vlpw9AK05XU056fwcyjyACoFh7SkAkc4HCFWti/h+MSTLBiaI6VoBJ+wpS1/N+pH9rya
         66173LrL/X8nHo95t8krxir/HOgeFS7mm9V1eQY2xGffM4xY4JiQ3lPPTYbQid71SD5j
         iPsZ8U8swKDFx1x6JnJ9UsIU0dCiAoTYAIkzajUVBh8bFJdyMO0dcf2QSCO7LMYz/Su6
         gqmqQkBOo9pr1BAdH1w1AdC01zOoJ6/K8b+xgJwoIPB+VjV2LWIlQr2msGYBynFc4m3M
         Slvg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=V8wpfiYV;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vueDyk0w6wGHO5yrABqYp0PTO2iamU8zAfHRcMKPS7Y=;
        b=Wy1oTLs3qirkTBAz5OkmE8PhwpXh03Ds1laWjyKQ0urp2fsoalezm7tVazEbQpfnlb
         tMbQ1gI8LQ2ImKu+iUGap4+HgLpg0Jczy3cFBOXvw6jjDYj9OvUjUFgFI2EUgNAoK15c
         SbH0323PlJt4uxVFMrFQzBYH8NRfIpVtKhCDBaF+ydSVXx48YgShEz50dw/4lZkutmgm
         MILtPa9+zXk0GGmx6VkSydEb4KEyPX2xLCpeKtsuF6+7YUw1U6Nt2OavTRTOCmF//eJk
         XwkGebTV7ynVhg3+onJXhLA7dsY+mJuUbB3Pwb/X+pP4Aq9wG+vwvidoz7F7vq3unnOo
         CQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vueDyk0w6wGHO5yrABqYp0PTO2iamU8zAfHRcMKPS7Y=;
        b=rIQkoNSMBT4WCqLBcnfsm98lp8EGulKWcbKIg6iSvppXiNiYqzuXMQd4VA5a1gFaTX
         374W4HJv+m6nZD723WTbOjfAEadPuQhmg3RvqjbLge8TVyAip6MIFtF/xafSxBnD3XBP
         lPaMtpfj+nF3BpxQOx3qzEnFlbD9xcDa/6WNrG1P5ygrzbsx8ts29GFs5QAFZ7L/7hTL
         ja77i81N7mFUbDgZp1/CkoVy3qbeC8ax+MgnYvu42rXprS0rFdDN8qn+1rFccHowtepV
         d1h2iwA1oZvlnRKM3bhaBhtxt1fttbj+/V0riMd1OyWfhqITVM48MYx+xyPIgsCdOknV
         3LLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532+zcEBSW5xcYHmMpBn6HZJAyCYdJ63gUo7jlPVU7nYLsX1VQSf
	AQlbQNjy+Ljv/4n77GCT4pk=
X-Google-Smtp-Source: ABdhPJw2nq4/iQfEndLykyuSUKerAEhtvEtaCB/WDZSKM5dED6yEJ1x3SIxyeqk3x9ELvOx+C1Iovw==
X-Received: by 2002:a19:c50e:: with SMTP id w14mr1234495lfe.589.1603960759511;
        Thu, 29 Oct 2020 01:39:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:890b:: with SMTP id d11ls372065lji.6.gmail; Thu, 29 Oct
 2020 01:39:18 -0700 (PDT)
X-Received: by 2002:a2e:9985:: with SMTP id w5mr1454112lji.332.1603960758359;
        Thu, 29 Oct 2020 01:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603960758; cv=none;
        d=google.com; s=arc-20160816;
        b=aHarbMD2ygS5rNe6FcR6Xv0wBnhonmoMh2y3CRTaEO0RfU+FhqM9nSaulCPshdF42t
         0UkfHhanQn6GJYh+DwBjsaKRB0ZjHGYcormJH05M7Mf8TVG2ogNjYxyFv5bRP6btGVmK
         HryLgRcoL7gDV4iznIwCwodrRl4JzaE0qREGSTD7YQUxnsu6pwRkfUhk13lzedpYVo0s
         gFChCaQ/hfmqVoZPbJ+ZJRTEs+zyxvWXhpLphX54mqowPlEptbQOMmnbyIS93XevxlqX
         fqMyFTMgI/MOFd8m9HKn32RFlLOX099bEMVM3OezlnTrISWeJE64H8fG2sFhl+IXWC2P
         0o5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=gjzAEqPsBWiUaDLA49ERPF1KR4w2UE1mAFigiS0/UqQ=;
        b=NhhAEUNMbm58ttkmeWMEWOhAwcuQYE2A9MflzTBHyddCBZZkDRYeqKaoAVhoBz2AaO
         CS5hHmnyPC5BC7o3YXmrg7HdIxvokDAv02c0gJQrb5XozVtmiwBY8X978ir+L9DDwSRI
         WXbGiCp+A8cBAyw3Kg2WE9ivB5Ydfet5ogabRPYErPnscyki/ipYyWcONxjQrB9EIRZk
         7NSqYes8ngwPN897V/AFTX1fsh5aY1vqNWXdc2M9GTE80aw1ITM3wH2frHa98im+Lvn2
         GwxnOT2Q38AYh44e7yAW5Us8MmRHyjaxbKwbyo6QAsSEQtdfcCYT3R4KDuV+yCloWMMv
         l5TA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=V8wpfiYV;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id a1si53704lff.2.2020.10.29.01.39.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Oct 2020 01:39:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CMJl94SyGzyZg;
	Thu, 29 Oct 2020 09:39:17 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -3.134
X-Spam-Level: 
X-Spam-Status: No, score=-3.134 tagged_above=-999 required=5
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
	NICE_REPLY_A=-0.261] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id rVQg3rn2oxhu; Thu, 29 Oct 2020 09:39:17 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CMJl86PtvzyYr;
	Thu, 29 Oct 2020 09:39:16 +0100 (CET)
Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
To: Jan Kiszka <jan.kiszka@siemens.com>, Peng Fan <peng.fan@nxp.com>,
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
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <fa5b83f2-fa5c-e158-4b99-cc86db20ea43@tum.de>
Date: Thu, 29 Oct 2020 09:39:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4b408440-354d-521e-0a88-e1541eaed1d7@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=V8wpfiYV;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
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

On 29/10/2020 07:36, Jan Kiszka wrote:
> On 28.10.20 22:29, Andrea Bastoni wrote:
>> Hi,
>>
>> On 28/10/2020 21:14, Jan Kiszka wrote:
>>> On 27.10.20 10:22, Jan Kiszka wrote:
>>>> On 27.10.20 02:25, Peng Fan wrote:
>>>>> Jan,
>>>>>
>>>>>> Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
>>>>>>
>>>>>> On 14.10.20 10:28, Jan Kiszka wrote:
>>>>>>> Changes in v2:
>>>>>>>  - map 52-bit parange to 48
>>>>>>>
>>>>>>> That wasn't the plan when I started, but the more I dug into the
>>>>>>> details and started to understand the hardware, the more issues I
>>>>>>> found and the more dead code fragments from the Linux usage became
>>>>>> visible.
>>>>>>>
>>>>>>> Highlights of the outcome:
>>>>>>>  - Fix stall of SMMU due to unhandled stalled contexts (took me a while
>>>>>>>    to understand that...)
>>>>>>>  - Fix programming of CBn_TCR and TTBR
>>>>>>>  - Fix TLB flush on cell exit
>>>>>>>  - Fix bogus handling of Extended StreamID support
>>>>>>>  - Do not pass-through unknown streams
>>>>>>>  - Disable SMMU on shutdown
>>>>>>>  - Reassign StreamIDs to the root cell
>>>>>>>  - 225 insertions(+), 666 deletions(-)
>>>>>>>
>>>>>>> The code works as expected on the Ultra96-v2 here, but due to all the
>>>>>>> time that went into the rework, I had no chance to bring up my MX8QM
>>>>>>> so far. I'm fairly optimistic that things are not broken there as
>>>>>>> well, but if they are, bisecting should be rather simple with this
>>>>>>> series. So please test and review.
>>>>>>>
>>>>>>
>>>>>> Alice, Peng, already had a chance to review or test (ie. next)?
>>>>>
>>>>> I gave a test, sometimes I met SDHC ADMA error when
>>>>> `jailhouse enable imx8qm.cell`, sometimes it work well.
>>>>>
>>>>> I suspect when during jailhouse enable phase, there might be
>>>>> ongoing sdhc transactions not finished, not sure.
>>>>>
>>>>> I have not find time to look into details.
>>>>>
>>>>> Anyway, you could check in to master I think, we could address
>>>>> the issue later when I have time.
>>>>>
>>>>
>>>> Hmm, I would still like to understand this first... Do you have the
>>>> chance to bisect this effect to a commit? Otherwise, I guess I finally
>>>> need to get my board running.
>>>>
>>>
>>> It's running now (quite some effort due to the incomplete upstream state
>>> - e.g. upstream u-boot runs but cannot boot all downstream kernels...),
>>> but I wasn't able to reproduce startup issues. Shutting down Jailhouse
>>> often hangs, though, at least restarting does all the time. And that
>>> even with next. Seems we still do not properly turn off/on something here.
>>>
>>> Interestingly, this issue was not present on the zynqmp.
>>
>> On a different version of the SMMUv2 developed @ Boston University (Renato in
>> CC), re-using the same root page table as the cell created problems due to
>> different attributes (uncached) needed by some devices.
> 
> Why are so many folks working downstream on such essential things? Not
> helpful, for everyone, even if the goal should be "only" experimental
> results.
> 
>>
>>> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
>>> index 41c0ffb4..60743bc0 100644
>>> --- a/hypervisor/arch/arm64/smmu.c
>>> +++ b/hypervisor/arch/arm64/smmu.c
>>> @@ -220,6 +220,7 @@ static void arm_smmu_setup_context_bank(struct arm_smmu_device *smmu,
>>>         mmio_write32(cb_base + ARM_SMMU_CB_TCR, VTCR_CELL & ~TCR_RES0);
>>>  
>>>         /* TTBR0 */
>>> +       /* Here */
>>>         mmio_write64(cb_base + ARM_SMMU_CB_TTBR0,
>>>                      paging_hvirt2phys(cell->arch.mm.root_table) & TTBR_MASK);
>>
>> The issue in the BU version was solved by allocating a new page for this.
>>
> 
> Only the root level? How were those entries different?

Only the root level. IIRC, NC by default, instead of Normal.

>> I wanted to check this effect for the version on next, but didn't find the time
>> to do it so far :/
>>
> 
> How was the issue triggered?

From the discussions I had, on the ZCU102, devices were randomly triggering
erros/ stopped working.


> 
> 
> I made some progress meanwhile: Linux was also using the SMMU. I'll send
> a patch shortly that detects that, like we already in VT-d at least.
> Interestingly, this should have been broken on the Ultra96 as well, just
> didn't notice.
> 
> With that, I'm running enable/disable loops now, but I lose my Ethernet
> link after a while. Returns after ifdown/up, and the system looks fine
> otherwise. Seems as if we drop transactions in the transition phase.
> However, a dd running in parallel was not triggering any issues.
> 
> Jan
> 

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fa5b83f2-fa5c-e158-4b99-cc86db20ea43%40tum.de.
