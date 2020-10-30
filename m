Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2VA576AKGQEEEZYCTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DDA2A0022
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 09:35:54 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id m20sf2372723wrb.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 01:35:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1604046954; cv=pass;
        d=google.com; s=arc-20160816;
        b=hOvtNEEOkcx/FekH3q1j0IrmFwO8AbQZrw3npVGRYqHaXgsB6xzCI5kKFdPUu+fi/F
         mVj1LtMhTPX+x5DYVTW6BIRHrAlohZjPJ/SjjncVQlpdTSS78/iOUa/5xIVm/QbH0clS
         RFbXP7sfmXPzX53hdeewyLi7+CtwmSTs0/bvh4WlZmvdTnvxDI/G9QVhoKJTib09tnzW
         16CLpFeRcfQEFe267H2eEDhvPKI6r1Vup0E2r4Xd6yho5vEwu2uFXNPk6yr42HK5Ef1D
         fNtaN7HWIF+zkLuGzypGlsxobrKGnd6XUXepm2wM5XHpLwDHUXUZkOZEdPCfXKAs/TXS
         3Qww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=B4gdSCMCuDef+Otfq/PXSkURWaz5XvYkrEuEOt8CNV0=;
        b=lZHSD+X3zqUKfqGtnEPu2Ow0ajimpdujEIgRRIw46PpdJ9U+jciB15IdEISKU8LERO
         rv92qvrDeRLCTt2drbOqQgm1axcpCmq8+ZYoqf6aBQDR6pbwRHDI+SDZHrEkWN+eW+UK
         d4PZuqDns+kvKRvSg31xHFfWjf2YHk+iDKh1Iy9xM4DVsMDw1//Zbq5JscB1TiO7AC/O
         BIYCjA3CJ6xZzrs03G0evpnxpIWisa+Y0IVsYCzBECWUAcP89qN237r2ESAopw+Ltu0M
         67f46BYMJlbqYirhWamBbQKarvv+UdWfynw1ASbtan0r39bItBbIzQT8cjUZ8Wbd/Zx2
         6fww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=B4gdSCMCuDef+Otfq/PXSkURWaz5XvYkrEuEOt8CNV0=;
        b=T42joSBSEcuw/Vkh3XOotRxDxM/7q6n4OoFGW0MsgncXy23QHLENh3Hcand0lCJG9g
         tB4xfXLEvUG0WsHtoavdiA8mBSELTUoJrKWqmCwMKRaoBTzYUd1YkoLoWe4yKY7RSMK6
         vZIWQpetYgnnAJWvWbfV3EbkXS2yU5ipSQuaP2SX8iR6rpcoohJxDHJFLFlCzme/AY0y
         JHsPO6MudtvYRxYdzVJL2B9IXiPC1ZDRWJlqWI+oAO36Z+H1b70ubuZNFpM8bH6yNdYM
         ulrvzPAGQ3KIu+9O4bIA0a6o0olS020+1FlgOPmNondZF+1G3CVTZLTFKC+0CkAUPk3z
         7TUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=B4gdSCMCuDef+Otfq/PXSkURWaz5XvYkrEuEOt8CNV0=;
        b=Zgdr4IYttFQ5cGvbhbHRTJNWm2QoqTBS9CO52CQD23DsZNkb9IiJdQtWnQ+gbdYH6/
         NuyABEVACPx2ANMm0i5nawd1jnuI3Ly6+tpiwxg86xj6uBMyLXK0k2R/z5tWKLmkJMfm
         oEol3juhIK20AxeOd20q3ZaCqJqJyNf1mp23wzMsU1U9DZ7vqv50L4xwrt1mnXEXmKkA
         b4nFTwrHWSvXwGVppn7wXxyii7Xo1WKiJiIZDf1MnX0LuoP5lxPHGXVe/6syggWfbI2I
         SsXVy7lFQnrdlahXb7IoiIoCO4pCfoAVqYrmQMzMs+eeTjLC7q7h214h3V91tcT8COVw
         v+5A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5338lk/qE1AQhfqDB3mp3p+iLIi1U1r09CD1L56m8Faa6h6DjfP3
	seEWNTU7x3jO4+yS7wdBP9k=
X-Google-Smtp-Source: ABdhPJwc2z8oMYpJMjxPD5MRUY4wKza/K6o/zmAKTXh5pU6L8/R7e32vs9KTXOecvAEg68QNyPuMXw==
X-Received: by 2002:a7b:ca4b:: with SMTP id m11mr1356988wml.53.1604046954422;
        Fri, 30 Oct 2020 01:35:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f7c4:: with SMTP id a4ls551232wrq.1.gmail; Fri, 30 Oct
 2020 01:35:53 -0700 (PDT)
X-Received: by 2002:a5d:69d1:: with SMTP id s17mr270904wrw.77.1604046953379;
        Fri, 30 Oct 2020 01:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604046953; cv=none;
        d=google.com; s=arc-20160816;
        b=yltruQJq9edGHa39fl59UKgXhSCrAK/f/uxxH5gJbpajqq7rvhXeIgtrR5WO59OW7f
         hJj+P8y4CsMRdA1t11SNN/5BhEjMdxPd0AiaLKn9/50HNzfbJeCMIRvg0eGTTH0mGQRu
         lcF+i7LRcGb2lQT7k8y4BCvk/QVAnTfVgyfZWRrGCaRfMbXUM6N/XJRgtvv0z/C6i3fy
         satk3HkN1xFYYxfQgLOx/+PAw9+lZsMTPL4biphriO+S2hF1JjwdwC3nUl9cRHPINl0v
         da2ZinIiOjdYg+X/c2miL0bZMfz38Ljfmop5pwlvMvh7Dg/RdN4Uhi0gwgeVonBLJ1tg
         dpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=T2R1B23/RrI8fDBRsHjGkDdddLp6vM8Q6q9swuhy6ro=;
        b=oUwB8hS3ku08sMoucy2XEaXy72YZGALWYzIhOEr9DGHU76Tqd8/t5gg4mO0VYWYYko
         ACNbu408/5iQyrOT1pAKeLIenu3ZhDNuTrcSvdCBELsRvsAE2mEMwHq36y3yQr6wLBRI
         pnZHlZMTpBu97HWbgamk+VPqI+ox/ePrSefOrm1VZfsZpqhzj6UIgvXdonO67g42kGQK
         kcGejUgmrdjyBNwxVE5WKfkwR+o1Ib6MyYhBcbKH2UJC/4SAEH1dOIqos/732qNmzXbb
         QTmchZfJQ8XKnU2AYHuVFJtWPiboKN1oqUE50RNnum7WRzYneJqN4Uz2Phft4VRAckPm
         X34Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id c20si106790wmd.2.2020.10.30.01.35.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2020 01:35:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09U8ZoB9013995
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Oct 2020 09:35:50 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09U8Zmk7029154;
	Fri, 30 Oct 2020 09:35:49 +0100
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
 <eaa35809-1823-9bac-a971-12b9e4a2ec54@siemens.com>
 <72e5d7a9-e647-e0c5-62a6-9572cbdeee67@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <30e5b66a-f514-c4c8-e517-49dccd94a097@siemens.com>
Date: Fri, 30 Oct 2020 09:35:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <72e5d7a9-e647-e0c5-62a6-9572cbdeee67@tum.de>
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

On 29.10.20 16:26, Andrea Bastoni wrote:
> On 29/10/2020 09:53, Jan Kiszka wrote:
>> On 29.10.20 09:39, Andrea Bastoni wrote:
>>> On 29/10/2020 07:36, Jan Kiszka wrote:
>>>> On 28.10.20 22:29, Andrea Bastoni wrote:
>>>>> Hi,
>>>>>
>>>>> On 28/10/2020 21:14, Jan Kiszka wrote:
>>>>>> On 27.10.20 10:22, Jan Kiszka wrote:
>>>>>>> On 27.10.20 02:25, Peng Fan wrote:
>>>>>>>> Jan,
>>>>>>>>
>>>>>>>>> Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
>>>>>>>>>
>>>>>>>>> On 14.10.20 10:28, Jan Kiszka wrote:
>>>>>>>>>> Changes in v2:
>>>>>>>>>>  - map 52-bit parange to 48
>>>>>>>>>>
>>>>>>>>>> That wasn't the plan when I started, but the more I dug into the
>>>>>>>>>> details and started to understand the hardware, the more issues I
>>>>>>>>>> found and the more dead code fragments from the Linux usage became
>>>>>>>>> visible.
>>>>>>>>>>
>>>>>>>>>> Highlights of the outcome:
>>>>>>>>>>  - Fix stall of SMMU due to unhandled stalled contexts (took me a while
>>>>>>>>>>    to understand that...)
>>>>>>>>>>  - Fix programming of CBn_TCR and TTBR
>>>>>>>>>>  - Fix TLB flush on cell exit
>>>>>>>>>>  - Fix bogus handling of Extended StreamID support
>>>>>>>>>>  - Do not pass-through unknown streams
>>>>>>>>>>  - Disable SMMU on shutdown
>>>>>>>>>>  - Reassign StreamIDs to the root cell
>>>>>>>>>>  - 225 insertions(+), 666 deletions(-)
>>>>>>>>>>
>>>>>>>>>> The code works as expected on the Ultra96-v2 here, but due to all the
>>>>>>>>>> time that went into the rework, I had no chance to bring up my MX8QM
>>>>>>>>>> so far. I'm fairly optimistic that things are not broken there as
>>>>>>>>>> well, but if they are, bisecting should be rather simple with this
>>>>>>>>>> series. So please test and review.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Alice, Peng, already had a chance to review or test (ie. next)?
>>>>>>>>
>>>>>>>> I gave a test, sometimes I met SDHC ADMA error when
>>>>>>>> `jailhouse enable imx8qm.cell`, sometimes it work well.
>>>>>>>>
>>>>>>>> I suspect when during jailhouse enable phase, there might be
>>>>>>>> ongoing sdhc transactions not finished, not sure.
>>>>>>>>
>>>>>>>> I have not find time to look into details.
>>>>>>>>
>>>>>>>> Anyway, you could check in to master I think, we could address
>>>>>>>> the issue later when I have time.
>>>>>>>>
>>>>>>>
>>>>>>> Hmm, I would still like to understand this first... Do you have the
>>>>>>> chance to bisect this effect to a commit? Otherwise, I guess I finally
>>>>>>> need to get my board running.
>>>>>>>
>>>>>>
>>>>>> It's running now (quite some effort due to the incomplete upstream state
>>>>>> - e.g. upstream u-boot runs but cannot boot all downstream kernels...),
>>>>>> but I wasn't able to reproduce startup issues. Shutting down Jailhouse
>>>>>> often hangs, though, at least restarting does all the time. And that
>>>>>> even with next. Seems we still do not properly turn off/on something here.
>>>>>>
>>>>>> Interestingly, this issue was not present on the zynqmp.
>>>>>
>>>>> On a different version of the SMMUv2 developed @ Boston University (Renato in
>>>>> CC), re-using the same root page table as the cell created problems due to
>>>>> different attributes (uncached) needed by some devices.
>>>>
>>>> Why are so many folks working downstream on such essential things? Not
>>>> helpful, for everyone, even if the goal should be "only" experimental
>>>> results.
>>>>
>>>>>
>>>>>> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
>>>>>> index 41c0ffb4..60743bc0 100644
>>>>>> --- a/hypervisor/arch/arm64/smmu.c
>>>>>> +++ b/hypervisor/arch/arm64/smmu.c
>>>>>> @@ -220,6 +220,7 @@ static void arm_smmu_setup_context_bank(struct arm_smmu_device *smmu,
>>>>>>         mmio_write32(cb_base + ARM_SMMU_CB_TCR, VTCR_CELL & ~TCR_RES0);
>>>>>>  
>>>>>>         /* TTBR0 */
>>>>>> +       /* Here */
>>>>>>         mmio_write64(cb_base + ARM_SMMU_CB_TTBR0,
>>>>>>                      paging_hvirt2phys(cell->arch.mm.root_table) & TTBR_MASK);
>>>>>
>>>>> The issue in the BU version was solved by allocating a new page for this.
>>>>>
>>>>
>>>> Only the root level? How were those entries different?
>>>
>>> Only the root level. IIRC, NC by default, instead of Normal.
>>>
>>>>> I wanted to check this effect for the version on next, but didn't find the time
>>>>> to do it so far :/
>>>>>
>>>>
>>>> How was the issue triggered?
>>>
>>> From the discussions I had, on the ZCU102, devices were randomly triggering
>>> erros/ stopped working.
>>>
>>
>> I just ran a enable/disable loop aside flood-ping + dd on the Ultra96-v2
>> (I would expect it to be identical to the ZCU102 in this regard), and
>> that did not trigger any (visible) issues yet. I'll retry with lowering
>> the enable frequency.
> 
> I extended the configuration of the zynqmp-zcu102 to use the SMMU and I've
> started similar tests (enable/disable + flood ping + find /).
> 
> With the flooding ping I can regularly trigger ethernet errors in the diable ->
> enable interval e.g.,:
> 
> [  373.470078] The Jailhouse was closed.
> [  374.957052] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
> [  374.966376] The Jailhouse is opening.
> 
> Maybe just outstanding transactions.
> 
> I got once an extended error that included the SD card
> 
> [  112.215426] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
> [  112.223243] mmc0: ADMA error: 0x02000000
> ... full dump ...
> 
> But I cannot detect from the log if it was after the disable or while jailhouse
> was enabled.
> 
> I didn't have time to debug much further. I want to double check (also with a
> colleague) my current stream_id configuration because I only covered the LPD
> masters and I want to check the other TBUs. (I'll post the configuration once
> I've checked it.)
> 

I think I found another issue, may "The Issue" (tm): We enable the SMMU
prior to having the guest page table created. That is only the case on
config-commit. I'll try to move the device-reset function there and give
that a shot soon.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/30e5b66a-f514-c4c8-e517-49dccd94a097%40siemens.com.
