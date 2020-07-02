Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPHS7D3QKGQEPI2MBYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E09212D4A
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Jul 2020 21:45:01 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id i3sf17374056edq.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Jul 2020 12:45:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593719100; cv=pass;
        d=google.com; s=arc-20160816;
        b=VyP85oAzIXymZAL1IuPfHwLaY/BoKuTqFDphUTm8m1SmLUarqqk/T2pjBDNZ7qhFFe
         rcTVsIcelqJFrtvboZ1iwKV/Up1qyXTHIOYVLBPib2HuGFGrg1z99GJREQPHceM0pgDZ
         PW/RMrhovs1UoFsu2vTasRITilkrhV27tG2e2/4vRlOP2S9wGW2rtwDBH7kyMtHhQEAu
         iHNXOj96dHMz1R/1nyGQQo4h4yV/SRwxyOVj5B9s+lyWLeBaWtDffeqVXHrvkVxy5ehD
         becj6NsC5zhXsnSxxgNO3uOFzo/T1xiy3PXEYdBEp+t9Apj5HA3uqR1uZA+PJIV8wlmr
         TbRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=jcexd3jjopPJ2skiur1wkPoMvhgWuUjy7ESPXia1GIk=;
        b=hYTwt0l/zm+cbxRJTVdvRf0zKqaXSHtI023m7E1BAeVDSp3lu/vrct21bTqbF9a3y/
         D5A40FzZWH4euJ2cSUer19t/0F6l6lvKfQDpkEz9X8HpzMXW7+EaS+kFyhHhhZ8kRsJI
         ygVJzOHlgSn9DB1PJm/t5/4yQGlMw8jBa38vo2vVYlNHmiQw/fXKsItm62hVqApxMHPX
         5rU4zFLbhAaZ/pWXkWBiV//yXnyxH/VMiHP+w73OrKwpuT/5F+WtyEor3gXF2tdlULDN
         XUFSFjcJHtw3srbOdygzhqbmD24oTGdWtf2NbzrAnGwGrBBF1I2UmtfP5wj6V3r1r0JH
         RmLQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jcexd3jjopPJ2skiur1wkPoMvhgWuUjy7ESPXia1GIk=;
        b=BIoUAezfolLwaqyM1Sr8TqN/HfEMIiAqj0sU9voIPqAd4ZmLOkHsTXGNPXjxsEwcuG
         MIEu0ayo1NO5MQHt11XDTcCaBMtZ1e7J/DVkoDfu6mAZ/nZCEY7t2ePJPWyEgzJ09Er0
         383n9z41YqSN+75MW8ACefPWYSW9Tx/m80rTf+yRLWVeQ7tYme9KbZeJW/uApTHiIP62
         0p4fr7sIGgUWFtfQCM3CBCj2xz72nXJzTs5a0+E1PlWx9RyBit9HNRPeoYOvnRwlcFVZ
         dk4glOgkpH/JG/VGd9SMbU94+A4Z9SesTqIsorCcIaTjoEjFjVf+KHxawkA8WIkceqZw
         xcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jcexd3jjopPJ2skiur1wkPoMvhgWuUjy7ESPXia1GIk=;
        b=nYf6jidKYkGL8QhwLD/n6nbvqp5G5GOhNEnSaSdblWjUVCqg6K6URof9NKSUeh5QUp
         hbU9Cx4//FPmKNY/HQgHuqMPyZF5/mb+jbVyFwF8ksC+FguxHvHLXkxSjEb1BnXeuosO
         95QSvVVswBqUrpYfk0Gd1eYv4nKQowxqhSLQnZ9hp8leX5TZpnzzEx33m0c9kcHtqRZx
         2LPb6g7g1rd8bp549pjUhacCAcfYLoTeEJAA4qFAcTK94OvaTWu9hvjVC6958z6TucxW
         vXORi/Xb5pXc9vtIaQy3It5OWQ3YhUbab1tRR/RC5vac6WRWC2cTs3Bbf6lrGntYO1RZ
         UrZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533fVoxO/ZOIlpCj9WgNiHD1pTZAA2TfeqLcx8djAlAA//RF9heN
	6EXMiFfpGod1nl9SjPLpBNY=
X-Google-Smtp-Source: ABdhPJwRsLMZ9zm2u8q4cRkLjEVAwEwrLnEv3M+14Syw3/XlIs4SgU1fes2lZ5GYXnyld3AJ46eGqg==
X-Received: by 2002:aa7:d64b:: with SMTP id v11mr35261634edr.381.1593719100765;
        Thu, 02 Jul 2020 12:45:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:b2cd:: with SMTP id cf13ls3108580ejb.10.gmail; Thu,
 02 Jul 2020 12:45:00 -0700 (PDT)
X-Received: by 2002:a17:906:eb5a:: with SMTP id mc26mr25020649ejb.42.1593719100014;
        Thu, 02 Jul 2020 12:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593719100; cv=none;
        d=google.com; s=arc-20160816;
        b=Un0xSMyVtcbXRRuag85z2NW36x3YvQTRIMthVOOL8LbBSbKLtkdY5l5oN3JiTQQoWD
         WcRgfa+p2Ek4V21xcPK4BapKTUTbZa/RMcoGJ24eGpDPNzPPAMEuaKMjYLyLMTQ9TuED
         snJtXQl1tFrJs10eqJKROT7SR21sx4VT04vXvRuvKV4xQK2jIozkHzj8kC7wW68auaxk
         Qtr/nOy3/6ttgnmUg8ti8mB98x86PSaR84ELYXIQNg/weqSt2TOCUs7Oh7vlHK3hr/dM
         qDhuQJ8SgP7Joh/icXeE64bua08/TFDHKe0u/RXwQrEGT4auC5lj1Gyi/mfMdZko/6AY
         olnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=C72f89G7c05mgujzOpKjylxX4oLbNe/VK9ZinSp7d+Q=;
        b=TOZU0YHSr3qVKFHHJCZSP3zf+2in+HnAA1zir0Be+RurYduk4xBi0/3nf3+E1O4GJE
         eZ0c/E4ZWKt+y9FwwWltO/mVcFIUhGimeI+KR0kxOPZI1Hy8JLOmFCs+B+epvFZJ3r44
         3HdSCWeV+7or+lcxDEifgOzJXE0n/WuoBdvQcPqEU3VSDKEP7BVY9rK1IDdUrXQNzQlw
         /ps5AxMCxtFznpLKAYG33juxc379yWj2DbmnWyvBYEhXUJbWEEabs1Q6vCzM1n/SDXig
         AN3OZQ/9EvhldQ3ir4DGVjCWdxiV9/sDqofqDGyotjtZ1vb4EPa01UAUR+VqjqiZSOzP
         aBDA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id i18si550381edr.1.2020.07.02.12.44.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 12:45:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 062JiwNU005440
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jul 2020 21:44:58 +0200
Received: from [167.87.128.222] ([167.87.128.222])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 062JikOk010714;
	Thu, 2 Jul 2020 21:44:50 +0200
Subject: Re: jailhouse jitter?
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Angelo Ruocco <angelo.ruocco.90@gmail.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, Peng Fan <peng.fan@nxp.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, Alice Guo
 <alice.guo@nxp.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <38ffb4dc-20d6-3404-cc61-ea08ea8066f1@siemens.com>
 <e0b6c5f5-89a0-6e29-6700-e5d5064d4672@ti.com>
 <CADiTV-0qHuXt=wrGCp4RbFWcu=WGsZKB-doXOTxjMVZkRiiiCA@mail.gmail.com>
 <1d5b0ac8-0744-59ab-bb90-8133df4a1525@siemens.com>
Message-ID: <d0b0c698-7ee2-97dc-7b6e-685f2f169f39@siemens.com>
Date: Thu, 2 Jul 2020 21:44:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1d5b0ac8-0744-59ab-bb90-8133df4a1525@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 02.07.20 18:45, Jan Kiszka wrote:
> On 02.07.20 15:31, Angelo Ruocco wrote:
>> On 02/07/2020, 'Nikhil Devshatwar' via Jailhouse
>> <jailhouse-dev@googlegroups.com> wrote:
>>> On 02/07/20 5:14 pm, Jan Kiszka wrote:
>>>> BTW, regarding direct interrupt delivery on ARM: In
>>>> https://lwn.net/Articles/820830, it is reported that Bao has "found a
>>>> way to map interrupts directly into guests". I didn't find the time yet
>>>> to check if that is actually exit-free delivery, and that as a smart
>>>> trick or rather a problematic hack. Or if that sentence is rather a
>>>> misunderstanding. There is also the sentence: "Interrupts [...] have to
>>>> be mediated through the hypervisor, which is unfortunate since that
>>>> increases latency."
>>>>
>>>
>>> I found this interesting and tried to read more about this.
>>> I found some commits at [1] which does the direct injection.
>>> Here is my rough understanding:
>>>
>>> * He is not setting the HCR_EL.FMO bit and that way all virtual
>>> interrupts are turned off
>>> * There is a new handler for handling "lower_el_aarch64_fiq"
>>> which ends up being handled by the Hypervisor
>>> * GICD is still being emulated so guests won't be able to route
>>> interrupts to wrong CPUs. Isolation is maintained
>>> * For triggering interrupts from Hypervisor (SGIs, etc) he is using SMC
>>> calls and has a new service implemented in the ATF [2]
>>> * I could not understand how the lower_el_aarch64_fiq exception is fired
>>> so that the Hypervisor is invoked
>>>
>>> My guess is that most of the code change ihere s to enable interrupts in
>>> the Hypervisor. Resetting HCR_EL2.FMO would send the interrupts at EL1
>>> directly.
>>
>> Yup, that's more or less it.
>>
>> Just one clarifications, Bao *does* set the HCR_EL2.FMO, it doesn't
>> set the HCR_EL2.HMO. The HMO bit lets the interrupts through, and they
> 
> HCR_EL2.HMO? On which revision of the ARMv8 spec are we looking? Cannot 
> find that in mine.
> 
>> go directly to EL1/0. The virtual machines have complete access to the
>> gicc and receive IRQs without overhead.
>> As you have already pointed out, gicd is still emulated, so all the
>> operation of "enable/disable/set_tarrget" are slow as usual, and still
>> under control of the hypervisor.
> 
> And so is inner-guest SGI (IPI) submission, I suppose. Just like on 
> Intel (so far).
> 
>>
>> The problem is that IRQs are completely invisible to EL2, so Bao needs
>> to use FIQs for its internal functions. And to do that the only way is
>> to go through the secure monitor in EL3 for each operation, having
>> custom services running in the arm trusted firmware.
> 
> Ah, interesting pattern: FIQ becomes the NMI that enables such a trick 
> on Intel CPUs. If FIQ triggering architecturally limited to EL3, or is 
> that SoC-specific?
> 
> I'm not fully familiar with the ATF/TEE world yet, but your approach to 
> model that service as SPD seems to block other use cases, like having a 
> full TEE (OP-TEE). Wouldn't it rather make sense to model that as TEE app?
> 
>>
>> I've even thought of trying something similar in jailhouse, using the
>> linux driver that, running in EL1, could let jailhouse access the IRQs
>> even without the HMO bit set, and therefore allowing direct IRQs
>> access to inmates without the need to put a custom service in the arm
>> trusted firmware, but I found it a bit too intricate.
>>
> 
> You can't use the guest to model management interrupts that are there to 
> interrupt the guest and inform the hypervisor about a high-prio event 
> (like "kill that guest").
> 

I started to read and think about this more - and then I suddenly found 
SDEI [1]. Isn't our problem of having a non-IRQ event already solved by 
registering on / sending some event 0? And SDEI is implemented by ATF.

That would nicely overcome all the problems of the baod patch to ATF 
(integration, security, missing gicv3 support, blocking of other 
SPDs...). And even if I miss some catch in SDEI, the principle of 
synthetic events defined there is what we want for hypervisor management 
IPIs.

The only downside: On a safety critical system, you may rather want to 
get the firmware out of the picture during runtime, to reduce the safety 
scope to a real minimum. But, IIRC, GICv4 will solve direct interrupt 
injection in HW anyway.

Jan

[1] 
https://developer.arm.com/architectures/system-architectures/software-standards/sdei

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d0b0c698-7ee2-97dc-7b6e-685f2f169f39%40siemens.com.
