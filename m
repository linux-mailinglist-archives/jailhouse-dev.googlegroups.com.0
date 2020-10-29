Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAGG5H6AKGQEWTBFTZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F72729E395
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 07:36:49 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id l12sf248743wme.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 23:36:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603953409; cv=pass;
        d=google.com; s=arc-20160816;
        b=UXRtwMQ602HhkaZnGRu+zLT0MdSHVOc3WCExnRLPl8/cFrra4knQ9l48jqPPnVi4qQ
         vjU+YtCaYe6QRE1QR/wAPOQAq3mWjef7NoazllAKQkVok2FGpyfv8B2G/zOM6Vjpc8Az
         Cx5PK3eezRP9CJVInHJrrGLjiASJGABsQ2FgDYF6UlhmaWbuNLt0a1cbNtUHXdy+eFnf
         agQQdUiuyHLsj3NO3dN0QZnJecYpzv1n0MjvWMKgzf77h9fPGKUVbmRmVVGonGp0ETQC
         gJpcSuoiZ4LAqmGGWO8enUfjM0EbDamoWTIjnTZt4lbU4KQJpUF4YAMoSqQMmkJnRgu5
         yElQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=Afl7n7LhRbz1myxRUxTO/4VtwFJgbshCSI0WxUswdIg=;
        b=tKbg1tDx4XHrrZM9bE5sxIEyZeWmDLIdHLaXYUulDWWhUUClUah2ao/qr+rUwmrhP9
         nw63K48Rw4jSkffAqFSBaxhjmFLpVRtuFADRTFgLUnZxYAjDP+qbN9JkgM5hS5eV6Rwi
         mllAv8OOIleXdTUqxKMw7L44cHhMx4CHbo/8aWRmGN4SUo/eT2UuqzUCptBpuomOiT1y
         +F875ypIgAsiltB0r8V+JOJUQWVh7k93S1FmueuuSl82yZdlN0rSHl7MLehT+O8+MvC+
         bYdJ8artXLwA178yENDgbH7A2uPmje5PKaJGsKsxdjwA66Tympw1iwTkLRuyH3y1bCQ0
         zdZQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Afl7n7LhRbz1myxRUxTO/4VtwFJgbshCSI0WxUswdIg=;
        b=OP5HPFKJD50nmxY5qZwbeSR9uwl47t8Eo2JoOY0sVeerWq2b7+waA0p4sUHvadpnKN
         1db6xaWj1y7hAxLMj4jE4k9pl85k09lxga2yVmetVPUkDNB+bS8mTAYCCG1R5Sv/mZa7
         9JntNB3R9snlxfJN1cm/58NRDyxfCd57MKibYa38VY8hlF9/UlxF//EKMLElxzj0Qh2t
         z8qzWBmlAT+tAlHf9lb2v7xE9wWAEvIeHjSX0wxOoI55C1l8S1QlEo58nyemN2+W3VTl
         ANu8eKtd51VrFfXOsDF6kgJZInIwvq/PU+i7qESNunnEnuA/JaV76N7r51t9Uk/t8Hyw
         uVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Afl7n7LhRbz1myxRUxTO/4VtwFJgbshCSI0WxUswdIg=;
        b=Y3bfCQzoppIUL2LNyNK9aRFUTsDLzgy3QQ4waF/G+nY2KFHXHZgOKn3vr89nokAp7M
         otZ4aUNDJPK3dm5gPufm1/zQtBP/SxmORxt4JspjR2C3pisW/hmYgzbNLIcDaOrrM5Lu
         RWaL0aAO55RHzOywLN73K7DFKUljGA7nTLh0Wh1ZbMhUwDKBcQXjnkF87WTebGE4F8V4
         xPv+K3KZNT3FLjQaCkPj1buKsENN+NKl4wb5dKX9W4GLGJOn/V5kEWdXyMejxyu6THDZ
         QvaqiQt2BcRmHer7ETcB/rrAmTh+FjU+2thzvctLFzFr3UPE5Qiob/QBR5F7ulzoR3rC
         laKg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533b2itX9ETpGBCZiCyPE2UjUifQaTKR37GNak9P1b8vnZGlg+pS
	y7dcBpNP5TXBOJ7Fest7+us=
X-Google-Smtp-Source: ABdhPJyB3snPZYvKcjgd5PS2lKkfJCWalfRbe4CQKl0pkZoOiQbPHyPpAlQOdpA+Qm+i8OuAVNZlpQ==
X-Received: by 2002:adf:e892:: with SMTP id d18mr3651663wrm.103.1603953409201;
        Wed, 28 Oct 2020 23:36:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cd12:: with SMTP id f18ls678753wmj.3.canary-gmail; Wed,
 28 Oct 2020 23:36:48 -0700 (PDT)
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr2693190wmi.133.1603953408103;
        Wed, 28 Oct 2020 23:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603953408; cv=none;
        d=google.com; s=arc-20160816;
        b=xASeXnrt/m0L1PQcQJnOPvbtjgBey7E+8xALLZNzfOjPJKe3avxsmy4OzFyw4DagLm
         JWlmpOGW/hxKtd9F+rOOARaD162A7l3jsJg7FNFZEB2DfQn5bKtTVWfYLZFMqLjEiEgJ
         EJkVkG0Pw2O4WbumtRmrqp+B00nyFB+UuqxJ/C5iZFKfPwPQWbZs8YGXLZIdRCGOu+k5
         mCW+l1IodiZe+SlQHmLXBiGhEEjjDVLiXz+oO7rcdm8Qc56STYQ0NV1eN3zLMZqYy5jX
         CQwFt9KlPJ6nsiFIS6vd3biv2ytQYuvpq7T5dvwOQ7L9mbsZvYrSI0ZlZGZxDFr7H4Di
         WBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=XbDd1+EMIqQvMPSG58IHhbJe2Obxk3qGu6B7EDQimEo=;
        b=fgFkuLhuYkRrwvx4/3joYstgzSCiMT5COLKpZdR2gp7ZdjZZcaPrcgyTflXiSiKAO3
         6ypIe4Fy4aKfCIe2AsfqfKI0z8AohRDyo0Qmi1yQyJ/zqkgpxr+y3xs4pbbzipYQcyP7
         8umzBP7VGtjjNZHnP5/ipXi6cKWFpbVeUzEfRi9ZBCTavCTfmNbqsuMcFV8bsNhLUpiQ
         lc9Ztver56WdbyPZlCQzEfMGMogR8ODA/999pCdj8GMf+wrD0BWQgcXdSJnTW6pdRxB0
         ZQi7yp/pIYFAvqSnM+Hq3J2bMnWIxl5+1NHwBbzaHgnFPP2UQ1l8XtYW0Ehme0t/yULu
         xQkg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 16si27069wmi.3.2020.10.28.23.36.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2020 23:36:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09T6aigs018464
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Oct 2020 07:36:44 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09T6ahRA016336;
	Thu, 29 Oct 2020 07:36:44 +0100
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4b408440-354d-521e-0a88-e1541eaed1d7@siemens.com>
Date: Thu, 29 Oct 2020 07:36:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8c0cec16-dc86-b316-ef84-af51a15c80aa@tum.de>
Content-Type: text/plain; charset="UTF-8"
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

On 28.10.20 22:29, Andrea Bastoni wrote:
> Hi,
> 
> On 28/10/2020 21:14, Jan Kiszka wrote:
>> On 27.10.20 10:22, Jan Kiszka wrote:
>>> On 27.10.20 02:25, Peng Fan wrote:
>>>> Jan,
>>>>
>>>>> Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
>>>>>
>>>>> On 14.10.20 10:28, Jan Kiszka wrote:
>>>>>> Changes in v2:
>>>>>>  - map 52-bit parange to 48
>>>>>>
>>>>>> That wasn't the plan when I started, but the more I dug into the
>>>>>> details and started to understand the hardware, the more issues I
>>>>>> found and the more dead code fragments from the Linux usage became
>>>>> visible.
>>>>>>
>>>>>> Highlights of the outcome:
>>>>>>  - Fix stall of SMMU due to unhandled stalled contexts (took me a while
>>>>>>    to understand that...)
>>>>>>  - Fix programming of CBn_TCR and TTBR
>>>>>>  - Fix TLB flush on cell exit
>>>>>>  - Fix bogus handling of Extended StreamID support
>>>>>>  - Do not pass-through unknown streams
>>>>>>  - Disable SMMU on shutdown
>>>>>>  - Reassign StreamIDs to the root cell
>>>>>>  - 225 insertions(+), 666 deletions(-)
>>>>>>
>>>>>> The code works as expected on the Ultra96-v2 here, but due to all the
>>>>>> time that went into the rework, I had no chance to bring up my MX8QM
>>>>>> so far. I'm fairly optimistic that things are not broken there as
>>>>>> well, but if they are, bisecting should be rather simple with this
>>>>>> series. So please test and review.
>>>>>>
>>>>>
>>>>> Alice, Peng, already had a chance to review or test (ie. next)?
>>>>
>>>> I gave a test, sometimes I met SDHC ADMA error when
>>>> `jailhouse enable imx8qm.cell`, sometimes it work well.
>>>>
>>>> I suspect when during jailhouse enable phase, there might be
>>>> ongoing sdhc transactions not finished, not sure.
>>>>
>>>> I have not find time to look into details.
>>>>
>>>> Anyway, you could check in to master I think, we could address
>>>> the issue later when I have time.
>>>>
>>>
>>> Hmm, I would still like to understand this first... Do you have the
>>> chance to bisect this effect to a commit? Otherwise, I guess I finally
>>> need to get my board running.
>>>
>>
>> It's running now (quite some effort due to the incomplete upstream state
>> - e.g. upstream u-boot runs but cannot boot all downstream kernels...),
>> but I wasn't able to reproduce startup issues. Shutting down Jailhouse
>> often hangs, though, at least restarting does all the time. And that
>> even with next. Seems we still do not properly turn off/on something here.
>>
>> Interestingly, this issue was not present on the zynqmp.
> 
> On a different version of the SMMUv2 developed @ Boston University (Renato in
> CC), re-using the same root page table as the cell created problems due to
> different attributes (uncached) needed by some devices.

Why are so many folks working downstream on such essential things? Not
helpful, for everyone, even if the goal should be "only" experimental
results.

> 
>> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
>> index 41c0ffb4..60743bc0 100644
>> --- a/hypervisor/arch/arm64/smmu.c
>> +++ b/hypervisor/arch/arm64/smmu.c
>> @@ -220,6 +220,7 @@ static void arm_smmu_setup_context_bank(struct arm_smmu_device *smmu,
>>         mmio_write32(cb_base + ARM_SMMU_CB_TCR, VTCR_CELL & ~TCR_RES0);
>>  
>>         /* TTBR0 */
>> +       /* Here */
>>         mmio_write64(cb_base + ARM_SMMU_CB_TTBR0,
>>                      paging_hvirt2phys(cell->arch.mm.root_table) & TTBR_MASK);
> 
> The issue in the BU version was solved by allocating a new page for this.
> 

Only the root level? How were those entries different?

> I wanted to check this effect for the version on next, but didn't find the time
> to do it so far :/
> 

How was the issue triggered?


I made some progress meanwhile: Linux was also using the SMMU. I'll send
a patch shortly that detects that, like we already in VT-d at least.
Interestingly, this should have been broken on the Ultra96 as well, just
didn't notice.

With that, I'm running enable/disable loops now, but I lose my Ethernet
link after a while. Returns after ifdown/up, and the system looks fine
otherwise. Seems as if we drop transactions in the transition phase.
However, a dd running in parallel was not triggering any issues.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4b408440-354d-521e-0a88-e1541eaed1d7%40siemens.com.
