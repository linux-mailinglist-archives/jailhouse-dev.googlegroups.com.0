Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIUU7H3AKGQE2BHGC4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8296E1F1AEB
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 16:24:34 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id j128sf5311016wmj.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 07:24:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591626274; cv=pass;
        d=google.com; s=arc-20160816;
        b=0EmlllCU65CjDyzi/0uV4VIIdZvFHFMcSe+42df3WwKJWfWR9OmwufmSPBaf2/NCpk
         hCRR/oOn1gakIoVskbBU4uuyMrKznT7/voG6txMaFtyzZdB9V94lWcrF5cT7QezGYJtu
         8DzLTELYm2LCGQq6iII5jqt6SD+DUwfXdJNnW7LbNS7MhmyEoUzqmen1YtqWv+yzuE5c
         jfOTeGwAhYUgTQdBeCPQHHmcYykmqoYshs7ieFLCmgw6tPTZHgI8yFdtQD2wwMZTG8r4
         2RrqfotBVHlpiVMTTPT4NbmhGtaEFAd9Iqa0xO2XK09eERwa/HD2Z6mc13WtDROuj07I
         YJ5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=okwYStRXbef6zd++iMRTDuiDOy/VjoGcMK6AfrcwMeY=;
        b=TQ+IgnzV05rBLYWlTVBvaCcMESW6Mq1f7g0nfeZYIqnfr6B2Na10IYEnfzrM7rEPWw
         NHznsai8uQT4voWMdOa2pyx6ygMY7xB+BxfYERAIJf3LpZhIdESgoOFUCLMK7ajL/vaQ
         v8PUOxtQflpr+hCigS3Hs+Y9KJbVUIix238is+4Wi6yY5a6OfutLFrfAQTRuadb3Pj1v
         7v1AqqmMjLGI/TYo0qghsBNBTX5Fdh3lYe0sz7aWi3mtJOsKMfQgRDTwIdTZxBViFKVw
         TIa/kHKcOsoxYHxM5pRSXerl5K6c1k4C+RDFS/92rLFsWwwtVC1WsyDtF8K4xxe7oCJO
         VXzQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=okwYStRXbef6zd++iMRTDuiDOy/VjoGcMK6AfrcwMeY=;
        b=egOAN/cOJjtKpqwhlSPk3cWJTLkICg9z3IpnvWcjrTvJnmwLYAUkpHUpvIoMNyPTbK
         6e5zxbHqFrEd2ecZuqkUpkFrrBveDOi/mfFjhnSiUSW1XYjdHLavG2L5nySAbBlTx43x
         k4JcH9MKdGA3ZsZIz6XcmG9lcjI5bOohlpeRL9rETHGSIeD62ebX09fiBqTp3gakNSOq
         jZzQFTxRsF1mNExQ2NyU95JvC/OeWIh5F3OoO0K6IE2WvbQPC0rjLuPA8mJSD7Ktmt4f
         f4WWyD1PB4aux8uVUsyVNbd1elg6K4q/j50Ik8RDh8jmueIFl5rN0GRLBO0rUv2/SzYW
         0E6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=okwYStRXbef6zd++iMRTDuiDOy/VjoGcMK6AfrcwMeY=;
        b=N7WuMNLku2DJqCm9nPp42fRQ1BM9b7huO8ALKwtxuPMfEgdDtnJOJ6vchFmg/9rnzO
         0J7nek7pdF/UwJGgRy0rU3/sOCFQ8zp2fACzAxsOkiYrHU9BqEqGvYTmhsDOzxDaWZ8Y
         0H+uqCor3QYwUZvYUA4bHe6AyVTHj9cfwMG+mKFlRIP/Y3FU8Q85OofYTy+Lb0rPYr3N
         ej1lv3Nmm3YHiPYv8fHGLGsKfFKUM4cgSuUkQDLWrTeTitIt4bpaxjf13XK72anbZzOZ
         Aj8ve4+wmaqP/J3X3e+VQH8IYkauaM1YKo3y2BAE3+nPXV/APgb5nSv6Vh4tfPRTBRVs
         qPGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530ewXXK5v8mjZC7At/KpFOCU9+WGgUZ7kDvTBwcld3nN5trUBmM
	O7CusBiutfdRvOZA7dtbcW8=
X-Google-Smtp-Source: ABdhPJyH7o8lkpZxNOL0lvr5eUBN0rw89sLxsiTCExV/0CZOJJteJ32tSARQ+mv8peY7Ha1Dx10QpA==
X-Received: by 2002:a5d:5389:: with SMTP id d9mr25603548wrv.77.1591626274244;
        Mon, 08 Jun 2020 07:24:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e510:: with SMTP id j16ls10341559wrm.2.gmail; Mon, 08
 Jun 2020 07:24:33 -0700 (PDT)
X-Received: by 2002:a5d:6087:: with SMTP id w7mr26131911wrt.158.1591626273578;
        Mon, 08 Jun 2020 07:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591626273; cv=none;
        d=google.com; s=arc-20160816;
        b=P9s/rNikB2D0bPD+3HDg9URoQrGJXdFa/HaCNZerh6NUrvF4SVSarhwotW4rAJg9OJ
         A6vFlJh5cw5Feko5zg/NFk38eV5sRYP/gpQDGM55v3ms4QGFlrIGssoMIzgUs+sDGmMG
         7hpcC9b9h6wpOqqQdOz1m6JpNdFke6roBBuz4F2VvE+XcOZvDx49FfdN9MpSt/iVWksE
         Bh0KFNy/zGAP8j+LGnCNrun8UoHrlO5/3HUDzIpr4dnPw7BodaX/ETcauyTyVKIJG7jV
         xehT4Zwebklt3yS02IUEniy39fWeaPYF+FnFNKzAXiZ4EA62KnqOg1E/qkzAUIeOFkMt
         PFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=k0YKguGrId5+1ZREFWz3WIfuMhoVc5eFfcGoY18bvK0=;
        b=BKl6vl9KJ9d4J/8tjULMGdjfpQqvsrzyqoaszxPfvZ3SX5vubQiGcq0SOrZfKA0PME
         iVu4K8+P4C7UtkbSQaI2IGqje9mAKhD5it8ZlhwB9ul+5s1zg8VBs+TSi+6XtwXTnmI+
         RrEIg9ZzOWFATrj8+UXsRbeDMtgmP2CB5EtMUyP6LZtL4hLVBZOqvWPx61ObTA7Ur5xM
         1nIs3EIms24So/szw+4XojG7gmdkRDZAd3/VwwxQpmdAxjWvH7N2yfh8mFFtSYE8E05G
         V68V0eAHmKsGYIaW/+9CVJfZVaskW01sNa0joCfc8t5MrpjV9u11CCKWfeMYPPTeE+jh
         wtaQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id m20si1073874wmc.0.2020.06.08.07.24.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 07:24:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 058EOWdM019619
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jun 2020 16:24:32 +0200
Received: from [139.22.35.12] ([139.22.35.12])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 058EOWjl027979;
	Mon, 8 Jun 2020 16:24:32 +0200
Subject: Re: [PATCH v2 4/9] configs: k3-j721e-evm: Add IVSHMEM demo device
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200608104255.18358-1-nikhil.nd@ti.com>
 <20200608104255.18358-5-nikhil.nd@ti.com>
 <d1f2b18a-2891-61c3-d66b-ce0c95575c09@siemens.com>
 <7c48aaa9-a5e1-4f1f-8947-a0f297d07354@siemens.com>
 <54f5799c-4dc6-b17d-7ab4-52fb5fd4ff6b@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1a4a35d9-8530-d4cd-da64-578d41f95eba@siemens.com>
Date: Mon, 8 Jun 2020 16:24:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <54f5799c-4dc6-b17d-7ab4-52fb5fd4ff6b@ti.com>
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

On 08.06.20 13:43, Nikhil Devshatwar wrote:
> 
> 
> On 08/06/20 4:51 pm, Jan Kiszka wrote:
>> On 08.06.20 13:16, Jan Kiszka wrote:
>>> On 08.06.20 12:42, nikhil.nd@ti.com wrote:
>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>
>>>> Add a new IVSHMEM PCIe virtual device for a 2 peer
>>>> IVSHMEM demo communication.
>>>>  (0 = root cell, 1 = baremetal / linux-demo)
>>>> Also add the corresponding memory regions for state and output
>>>> aligned at 64k boundary.
>>>>
>>>> Update the bdf numbers for consistency across all platforms.
>>>> Assign domain = 4 since the platform already has 4 physical
>>>> controllers.
>>>>
>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>> ---
>>>>  configs/arm64/k3-j721e-evm-linux-demo.c | 52 ++++++++++++++++++++----
>>>>  configs/arm64/k3-j721e-evm.c            | 53 ++++++++++++++++++++-----
>>>>  2 files changed, 89 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
>>>> index cda1614a..05517751 100644
>>>> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
>>>> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
>>>> @@ -24,9 +24,9 @@
>>>>  struct {
>>>>  	struct jailhouse_cell_desc cell;
>>>>  	__u64 cpus[1];
>>>> -	struct jailhouse_memory mem_regions[18];
>>>> +	struct jailhouse_memory mem_regions[22];
>>>>  	struct jailhouse_irqchip irqchips[4];
>>>> -	struct jailhouse_pci_device pci_devices[1];
>>>> +	struct jailhouse_pci_device pci_devices[2];
>>>>  	__u32 stream_ids[2];
>>>>  } __attribute__((packed)) config = {
>>>>  	.cell = {
>>>> @@ -56,8 +56,35 @@ struct {
>>>>  	},
>>>>  
>>>>  	.mem_regions = {
>>>> -		/* IVSHMEM shared memory region for 00:01.0 */
>>>> -		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 1),
>>>> +		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
>>>> +		{
>>>> +			.phys_start = 0x89fe00000,
>>>> +			.virt_start = 0x89fe00000,
>>>> +			.size = 0x10000,
>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>>>> +		},
>>>> +		{
>>>> +			.phys_start = 0x89fe10000,
>>>> +			.virt_start = 0x89fe10000,
>>>> +			.size = 0x10000,
>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
>>>> +				 JAILHOUSE_MEM_WRITE ,
>>>> +		},
>>>> +		{
>>>> +			.phys_start = 0x89fe20000,
>>>> +			.virt_start = 0x89fe20000,
>>>> +			.size = 0x10000,
>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>>>> +		},
>>>> +		{
>>>> +			.phys_start = 0x89fe30000,
>>>> +			.virt_start = 0x89fe30000,
>>>> +			.size = 0x10000,
>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
>>>> +				 JAILHOUSE_MEM_WRITE ,
>>>> +		},
>>> You are missing the state table. Was this tested?
>> Ah, it's there, just 64K large due to the different page size.
>>
>>> Please derive from existing examples, using the same patterns and sizes.
>>> Reference is qemu-arm64.
>> Still, please follow the default pattern (with adjusted page size),
>> which means triangle by default, 3 peers. That may eventually become
>> part of an automated test, and then all boards should better have the
>> same pattern ready.
> j721e has only two A72 cores. So max two cells can be created.
> linux-demo and inmate-demo are mutually exclusive.

Oh, sorry, missed that completely. I was expecting a quad-core at least.

> That's why I have given the same id to both because I can never launch
> it in parallel.
> 
> Do you recommend to still give a separate id for these cells?

Nope, that's fine then.

But now I wonder why we need to patch any of the demo code. If both do
respect the max-peers value and send to (my-id + 1) % max-peers, they
should "just work", no?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1a4a35d9-8530-d4cd-da64-578d41f95eba%40siemens.com.
