Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBNB7H3AKGQEL3LAIXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5B91F1B6E
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 16:51:49 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id e15sf5829923lfq.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 07:51:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591627909; cv=pass;
        d=google.com; s=arc-20160816;
        b=RJ7G9NM5uDct3IJod54jT7ezOJKkKd29e8KuyOvJZ/HBbe6wDiXqtThB5gRPJrRycE
         nZHGKY80ke3jktdFTe8alIqJZ7LjlG5VPJITnrhxEMXB2eorYBUVXHhV9lghmotaG543
         9cnIxY4fXOvaaXHCN09iq0i7SjHFWtRUq6Kw4Lkq5yw6QH2clqf07A0e1xw2VHn6FkEf
         6ijK7Y9g2KbwtegiMx5CuvVFlZ+CkjEEPCqN64W72oPjigcEzIMbbKSBM3tGR7K7sQch
         L3wHVr5a+nSZXiuMeWaV12vTQLX3MWG/XdlrE9vNLXeS9USeFjBjCIwMPK9M7/cLI6o+
         vNxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=kTRxxZoYypgaWbZ3DU3zXd3ASKsM8lL38pmsWIusUXs=;
        b=u9sSPUXg9U5Qa4duEDkGBYkfwe9X/U9LeUG2C0U7CuA9PwiY0yNN/dhGW3OhicicEJ
         FiqRnDca6/2POnLN6jHoK7/j8mzkd6ASA2FcanRXmayofBuDyfV3Cdyn5t/AflWVVT6d
         7JUaBio8iR7SgT31jVmM4AZeC2YfJ2PptAANCK/b+8NEk3QL9r6CbrZa9XiPu8VXIQCH
         8hnlqKCZaMrviysf491YpOWA8BOPT26w2xkosWoqOKSMeahjbYTVF/SIpOAGfvNCOEIF
         G9XTQaxmamSxRSai1BEMpjcrdAH8SNcoXq+LZgHMAMU6VYzOWy9ddFY9C5+FpCbh2XMV
         Wzag==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kTRxxZoYypgaWbZ3DU3zXd3ASKsM8lL38pmsWIusUXs=;
        b=q4onV0QKbWfi20wVxO95kTxfNw/seN16MWYa7PIAuia7Y78EegOxXSuUZ3U/UJ1xLu
         HdAoOZfsc7FaLmt3N87pEOq8fy57vU048RP3NMBrbbLY5MxdQjAo3NUkB5ydqEYs9Bkk
         GI7NLQ6xwizUgmiVJHfkqgDaRxzg/NKvFh2msSBZVu0L6h5I+PeIMq2kzyInPiXXbwEa
         k31vezWOyj0B8yhr4kQVKpUuCGuvMN9z4v8i/gyldfXyybXhuW62TOA2nbiz6ROPXWog
         +GYr3p+HuMKm3xuqDg8jeNUwaar93vMGWrQMZIY1OKTKyxOPq4tqj+hrHzD4IPSpgcR5
         YF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kTRxxZoYypgaWbZ3DU3zXd3ASKsM8lL38pmsWIusUXs=;
        b=q17SKdeM8c/AJPIi6P2QSTx4ilkcjSamfweTcdjWBCwXLB1qq/Oh1Dy2ui6IC+VG8i
         dAIROkHbVnYkA8TdeHl06Itq6TyLcpaqCFlBQBxG8xOO+ojHD6rXVxgd0Ff6AZ8DmN0I
         lNsknKhKKCDdatXrmj9WrqoxTIaR92R/EV4FFAhYKJ7McLSNMV5ZMO8Lsk0JTSPYa3Ba
         VmyInF3pStzenD0sHsVXAAeLFIiBUz8giht4w89YXuVJKUqO/qMCJzajmViICA0buY7F
         sXGEfAovuK23ogi3S9qnrPa5MXwOYUlnuPnF0HZQclgEIXRZ+cfMVqFCJYpxFZVkAtZQ
         qxzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Bq8SYRvDe/ZhpQwzqrYbe3v08TslkDfgTveGt3Usrye83Vhev
	pq4FvmraS/4JNH0sAYSSK5w=
X-Google-Smtp-Source: ABdhPJy8uUxE85FG3xu52DKvBm0+TWeB5JcztxIO3bbtZ6eOKIoiu/JEYtEn8zaKajBkc//icvb+LQ==
X-Received: by 2002:a05:651c:93:: with SMTP id 19mr11642232ljq.245.1591627909382;
        Mon, 08 Jun 2020 07:51:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:43bb:: with SMTP id t27ls2223261lfl.3.gmail; Mon, 08 Jun
 2020 07:51:48 -0700 (PDT)
X-Received: by 2002:ac2:5f82:: with SMTP id r2mr12572631lfe.119.1591627908517;
        Mon, 08 Jun 2020 07:51:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591627908; cv=none;
        d=google.com; s=arc-20160816;
        b=sJnitES0+zLV/aPHL1y/LfNcM2pCuBd6A/gCsFO3c/aKyXvPWg8Xkqr34Bd8df84vG
         q+L29TuVe/fMS21CkA2G1XBQ5mrVMr5hCk25212wpvNaOsAVmu/8VAez1HfT5SgjzUsN
         ApIM9ImNL0AOPaZOKP1RUCsPoG6KsVTDgIOx96v/Wt6WDF3HvQICz8UN2qynyyC4IBjp
         09fNwrn95dJolSoT9DV/taKU5HfgDm1/OjWRTkySNfj+iAl++ObMpsy8pLxeuM7dBaIW
         vxAwO7ZcsngAJyDBos9V/Q22m+19OrJvMLHcxkFBANvUxL45gSex9wq3tXKIJHaJcmXX
         Wh5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=cTy+EMeQSlYjTzp8iznTHv+vnOcmMVvrvHN93ugfZf0=;
        b=C6XC8ofQ6r6xAgJHofV7I7jBC+frUljGZvNqWmxT52EPebG6ZnGH3O4SCZavdzSZAu
         qoKsVVZcTLDAFZA+zoyqnLhugsJt0K8Tpn3cRtAJofi7qZPcikaJcHchdNVEFoFnckdP
         ciypr0EYijtxnyoRHaJSzWqzgEjdg9q+qUtOCy0ylKV52Qkt0Dxo/A1kXD3sFyUinvjY
         GV34NEROstD6CbdAH1/SBo0xibbmnOLfX9srV/hxV9+NO+iggy2J4Z8b4ivSF29xgxeg
         uXF+yUagyaqvUrsWXEUlvu2766d8i7O13V2kq82o1x0KID5IKhiaslKJHp94lV8OCeUv
         t/Eg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id x20si700894ljh.1.2020.06.08.07.51.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 07:51:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 058EplwN006918
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jun 2020 16:51:47 +0200
Received: from [139.22.35.12] ([139.22.35.12])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 058Epkfv023786;
	Mon, 8 Jun 2020 16:51:47 +0200
Subject: Re: [PATCH v2 4/9] configs: k3-j721e-evm: Add IVSHMEM demo device
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200608104255.18358-1-nikhil.nd@ti.com>
 <20200608104255.18358-5-nikhil.nd@ti.com>
 <d1f2b18a-2891-61c3-d66b-ce0c95575c09@siemens.com>
 <7c48aaa9-a5e1-4f1f-8947-a0f297d07354@siemens.com>
 <54f5799c-4dc6-b17d-7ab4-52fb5fd4ff6b@ti.com>
 <1a4a35d9-8530-d4cd-da64-578d41f95eba@siemens.com>
 <98cd82d2-61e5-a7d7-e83a-b734321f93f2@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <efc83a49-18e2-14b9-e581-7eef91766d80@siemens.com>
Date: Mon, 8 Jun 2020 16:51:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <98cd82d2-61e5-a7d7-e83a-b734321f93f2@ti.com>
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

On 08.06.20 16:35, Nikhil Devshatwar wrote:
> 
> 
> On 08/06/20 7:54 pm, Jan Kiszka wrote:
>> On 08.06.20 13:43, Nikhil Devshatwar wrote:
>>> On 08/06/20 4:51 pm, Jan Kiszka wrote:
>>>> On 08.06.20 13:16, Jan Kiszka wrote:
>>>>> On 08.06.20 12:42, nikhil.nd@ti.com wrote:
>>>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>>
>>>>>> Add a new IVSHMEM PCIe virtual device for a 2 peer
>>>>>> IVSHMEM demo communication.
>>>>>>  (0 = root cell, 1 = baremetal / linux-demo)
>>>>>> Also add the corresponding memory regions for state and output
>>>>>> aligned at 64k boundary.
>>>>>>
>>>>>> Update the bdf numbers for consistency across all platforms.
>>>>>> Assign domain = 4 since the platform already has 4 physical
>>>>>> controllers.
>>>>>>
>>>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>> ---
>>>>>>  configs/arm64/k3-j721e-evm-linux-demo.c | 52 ++++++++++++++++++++----
>>>>>>  configs/arm64/k3-j721e-evm.c            | 53 ++++++++++++++++++++-----
>>>>>>  2 files changed, 89 insertions(+), 16 deletions(-)
>>>>>>
>>>>>> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>>> index cda1614a..05517751 100644
>>>>>> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>>> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>>> @@ -24,9 +24,9 @@
>>>>>>  struct {
>>>>>>  	struct jailhouse_cell_desc cell;
>>>>>>  	__u64 cpus[1];
>>>>>> -	struct jailhouse_memory mem_regions[18];
>>>>>> +	struct jailhouse_memory mem_regions[22];
>>>>>>  	struct jailhouse_irqchip irqchips[4];
>>>>>> -	struct jailhouse_pci_device pci_devices[1];
>>>>>> +	struct jailhouse_pci_device pci_devices[2];
>>>>>>  	__u32 stream_ids[2];
>>>>>>  } __attribute__((packed)) config = {
>>>>>>  	.cell = {
>>>>>> @@ -56,8 +56,35 @@ struct {
>>>>>>  	},
>>>>>>  
>>>>>>  	.mem_regions = {
>>>>>> -		/* IVSHMEM shared memory region for 00:01.0 */
>>>>>> -		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 1),
>>>>>> +		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
>>>>>> +		{
>>>>>> +			.phys_start = 0x89fe00000,
>>>>>> +			.virt_start = 0x89fe00000,
>>>>>> +			.size = 0x10000,
>>>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>>>>>> +		},
>>>>>> +		{
>>>>>> +			.phys_start = 0x89fe10000,
>>>>>> +			.virt_start = 0x89fe10000,
>>>>>> +			.size = 0x10000,
>>>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
>>>>>> +				 JAILHOUSE_MEM_WRITE ,
>>>>>> +		},
>>>>>> +		{
>>>>>> +			.phys_start = 0x89fe20000,
>>>>>> +			.virt_start = 0x89fe20000,
>>>>>> +			.size = 0x10000,
>>>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>>>>>> +		},
>>>>>> +		{
>>>>>> +			.phys_start = 0x89fe30000,
>>>>>> +			.virt_start = 0x89fe30000,
>>>>>> +			.size = 0x10000,
>>>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
>>>>>> +				 JAILHOUSE_MEM_WRITE ,
>>>>>> +		},
>>>>> You are missing the state table. Was this tested?
>>>> Ah, it's there, just 64K large due to the different page size.
>>>>
>>>>> Please derive from existing examples, using the same patterns and sizes.
>>>>> Reference is qemu-arm64.
>>>> Still, please follow the default pattern (with adjusted page size),
>>>> which means triangle by default, 3 peers. That may eventually become
>>>> part of an automated test, and then all boards should better have the
>>>> same pattern ready.
>>> j721e has only two A72 cores. So max two cells can be created.
>>> linux-demo and inmate-demo are mutually exclusive.
>> Oh, sorry, missed that completely. I was expecting a quad-core at least.
>>
>>> That's why I have given the same id to both because I can never launch
>>> it in parallel.
>>>
>>> Do you recommend to still give a separate id for these cells?
>> Nope, that's fine then.
>>
>> But now I wonder why we need to patch any of the demo code. If both do
>> respect the max-peers value and send to (my-id + 1) % max-peers, they
>> should "just work", no?
> Same reason as before.
> To be able to choose whom exactly you want to send interrupt.
> Triangle is only for demo, but this way, you can send interrupts to any
> device.

If there can only be two cells at the same time, root cell always in,
it's about root cell sending ID 1, and ID-1 cell sending root cell. Now
both demos encode hard that max-peers is 3. That can be fixed (i.e. read
the related ivshmem register), and then things will just work (TM). No
command line switched needed. They would only be needed if you had a
setup with less than max-peers, but that is not the issue here.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/efc83a49-18e2-14b9-e581-7eef91766d80%40siemens.com.
