Return-Path: <jailhouse-dev+bncBCSPHTXQ2UMRBK6D673QKGQEIAWZQ3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5BF2124B6
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Jul 2020 15:31:24 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id e8sf8647783ljk.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Jul 2020 06:31:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593696684; cv=pass;
        d=google.com; s=arc-20160816;
        b=c7i5RkZ8wzyG8dr38Np0wNQR3Q4g5k9mn+I0SUmyys/uXsqLZfD/hf4fyFC8khqrp8
         Cas4aWX4HHZ9MqU4COeDJvkcqP5w4o/WXAHy0AwBuXxWb82BHmufbkjkILRWBYFlQA4k
         U5DnA7/uAfTBntT+hmlVuu5Rym+2l4hWS24UoyYz61UKEs6qS5oYfvkSxWEf8JltpG2s
         gqKOtntAn1IdTkiYjADS31rqEYHFDM5Qwx8Gyg5K5lTdP3/2atN1ATlnTsUNI7TKFME/
         LM7MEq0T+RtcmhuSKI0nMtsG4fY2qfZKza1fKyC5iacRRdboHpAWwrO5/g2cMSS9RLDD
         4lJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=WzwvalpqJrls8VMMMj19Aq3wWFhkbiceTPOpNfQ9aaU=;
        b=AtTIv9ge3A/BYv/0RAnR3DLL+AMP+hrnrDVkN2yAg5N9AhkhqRfMcZXxwAKVXYEbUW
         Cuq+G7D5op9mo6fB9NallSYYvhNSCBLR5AyMs3vHlAh6w13XJCPAe9JG6FU2DCVOkODC
         erM2BZmjveldJ+6egrKVLlFGdkniCeArQ55s2NcJUz3//xpSiUWZpP23PA1g3joxhV7+
         DFkt7vS5maK+p/JC+A2tUPRCmXTmhk4oibTXBtLZ5w+aNbqFJm11qM9e+ZUcf4Gv6pb0
         yNDC9hH3eds/94F6G7o/gPx/xyzcuTSJ4Fqqd/BMPqG9pEAYoxbBywwthV7gSKc6+hhG
         iL7Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Plsl7Sc5;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::630 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:in-reply-to:references:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WzwvalpqJrls8VMMMj19Aq3wWFhkbiceTPOpNfQ9aaU=;
        b=tWTBJ8YEteO3yrR4PEP4U8DGERoawce1CooeaYkWnVOczgMA23w7/QXwd8a6S5f6HB
         siSdG7NmoS4PLfyAQJZB+qyW3ybO94X2EpEuJXRBDbm6zV+XGmepWBHiio9TwSabEJ7m
         4SYG01ou5okAKbKp/i4UDybTMG6ZjsumvhCUMz+hFGcGgErWEzMTo77mPY3egs7TEn0Z
         Vq0zY5WGFxCJnLsuzbYZxC7GcSgHOs1ASb+7KPyKS6bBbZNsG2jren/Pjnp+9ew30YNZ
         ECp3fUI8cv/Kmc5oUY/w0imHdeyoxwWnwmWf/VQJ+19keYNXq6LH/H1mSio9dC6Qne7Q
         xNuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WzwvalpqJrls8VMMMj19Aq3wWFhkbiceTPOpNfQ9aaU=;
        b=CiC75+2WAA+yVmfeAhkaHFcguvNCC/1IwV5Vb/J4quU7SxYEB2B1l7X0mCZx/KL7Yl
         Www8yRV5GDA+MLDYyZobWWFMWdeKnFfzuEzVCrFY/lJOC52hiMvSh+z/jvBo2Dj6QusY
         GCaOTehdWBEftkhN04FVvJoSP8vfuSahRmAqUJpFmIqx+QcU8eR+Jor8qaG8vD9bPuLI
         tKsy6QlYvfa7lxeEitWiTV9McHsDlwxbOpVMJ1dJcUYLpd8XHBudCXDN0IZf1iA34sdt
         D2DwBu6lfzRSmIL9VfFksDEwHs2jVXySw0ZilmZn4f955bOoq+ECmYk1TElxCY4e7Cn6
         yg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:in-reply-to:references:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WzwvalpqJrls8VMMMj19Aq3wWFhkbiceTPOpNfQ9aaU=;
        b=STvWeLjrik1h9/LkNEqlXG0IjiuABSubtkXfFmkAnsoemn4iPa//k3QL+BXvDP26w4
         qkPHnSAVYNgxgb9R9ebSainmBFXh9f0j4ZnpJS09VbabaaaJEf8/o/3NSJ/SpK985dzc
         9POCIVo5qnZE4MMtDe1shc9tK2ogTLDyOQEPcN4iu/OcJHoEZ/hFn8B11UD8CAR0yH4W
         vnjeATBBF6U0gtdSFf+tQclAI5dyJ29HxR6JEtz4O6jA6i9+PJgC2DnE3UDBZURLIrKn
         OH/aG3OOVq79kId4tExjj5eJdXx92NpAVS9gAwreIRjZnCggoafgSY5yd2qHIkfy9mTC
         mv5A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53143OVO3YhzwgydjmwRqw/NLXo0wBOolwLruVADBPLoGaBsqWLK
	/0iYJSLJnacMyQ7U8za/skc=
X-Google-Smtp-Source: ABdhPJyRWtWTTch0CLVt/EUbCNzOol8HokjgxsliQUb6VMFIPmYNYOZg+J3spuk3eZ75vFxsZqDpow==
X-Received: by 2002:a2e:b0da:: with SMTP id g26mr11897058ljl.299.1593696684018;
        Thu, 02 Jul 2020 06:31:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5f95:: with SMTP id r21ls2198531lfe.3.gmail; Thu, 02 Jul
 2020 06:31:23 -0700 (PDT)
X-Received: by 2002:ac2:5a5e:: with SMTP id r30mr18526154lfn.30.1593696683040;
        Thu, 02 Jul 2020 06:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593696683; cv=none;
        d=google.com; s=arc-20160816;
        b=0uJB7el+DyzzLLe4LnC2MrVr5+lWY90R4fwjwJGtMjg5/b+sJ/Sm98l2ycpDns0Tbt
         1vkZKgQQej0ZVhsvu21Y78Lpk0CZHpbb8T2SVTcncqAhK7nwuDqTJWjNw4c5w3r2VKU8
         grQ2BvZDQ1f/7f6nA2LgxvUOzAsCARZLvDvQp3HeJo+3IGpr4q1Axfo1mt65oxtvVbTJ
         NvDp8lmzIKm0e82t5hVOzyQSLp9V3lgRAWXdWMUyhq3g92hzokMWFlAEKzqjQfWh7q+T
         IO9iRofcz/5d7fiPblDp5v1vQcaq3THIOAKeD4oJM9MDPSCnEMjvCubyW2gr1bQsjxEF
         b4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=PpmThRvh6xZs+7joCD7UKjq09j7ck05WtrmBr3G5AoA=;
        b=h1wkKifTUFjcJCgg8T7yYLnw3Xt6G2uO5aeMoCih5OVj7zF8FnA8cGsXFHkgOK0liM
         FJvZSSAcyHkhenjP+RahtKm0Esssx00jE2Yq5uuS1Kq/UMUbbvYFyrPbvl8VFnR7c3bm
         DpdpWSGFBb95OZ1rfeUR06ioD45MeHYYzr8ittzApxAiTTb4NfV9yQteHkR8BMlzJvyR
         64x48PSnshy7xLdEqgmQnh6NjpplOZPMtPxgvrwyiguD1fZmOXcXhdfbXRoRgEJsR+Zu
         d9C4p0mlgoC+HG/Kd/nuvUgiG6RULPjecWBonqRoS7ZjZ8+9bEvZMLw8J4bzMBm467MP
         wQ9g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Plsl7Sc5;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::630 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com. [2a00:1450:4864:20::630])
        by gmr-mx.google.com with ESMTPS id b13si243889lfc.1.2020.07.02.06.31.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2020 06:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::630 as permitted sender) client-ip=2a00:1450:4864:20::630;
Received: by mail-ej1-x630.google.com with SMTP id f12so3392565eja.9
        for <jailhouse-dev@googlegroups.com>; Thu, 02 Jul 2020 06:31:23 -0700 (PDT)
X-Received: by 2002:a17:906:7212:: with SMTP id m18mr27426891ejk.29.1593696682710;
 Thu, 02 Jul 2020 06:31:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:3509:0:0:0:0 with HTTP; Thu, 2 Jul 2020 06:31:21
 -0700 (PDT)
In-Reply-To: <e0b6c5f5-89a0-6e29-6700-e5d5064d4672@ti.com>
References: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <38ffb4dc-20d6-3404-cc61-ea08ea8066f1@siemens.com> <e0b6c5f5-89a0-6e29-6700-e5d5064d4672@ti.com>
From: Angelo Ruocco <angelo.ruocco.90@gmail.com>
Date: Thu, 2 Jul 2020 15:31:21 +0200
Message-ID: <CADiTV-0qHuXt=wrGCp4RbFWcu=WGsZKB-doXOTxjMVZkRiiiCA@mail.gmail.com>
Subject: Re: jailhouse jitter?
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Peng Fan <peng.fan@nxp.com>, 
	Jailhouse <jailhouse-dev@googlegroups.com>, Alice Guo <alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: angelo.ruocco.90@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=Plsl7Sc5;       spf=pass
 (google.com: domain of angelo.ruocco.90@gmail.com designates
 2a00:1450:4864:20::630 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

On 02/07/2020, 'Nikhil Devshatwar' via Jailhouse
<jailhouse-dev@googlegroups.com> wrote:
>
>
> On 02/07/20 5:14 pm, Jan Kiszka wrote:
>> On 02.07.20 12:03, Peng Fan wrote:
>>> Hi Jan
>>>
>>> https://events19.linuxfoundation.org/wp-content/uploads/2018/07/Consolidate-Real-Time-and-HMI-with-ACRN-Hypervisor.pdf
>>>
>>>
>>>
>>> Have you ever see this? Page 13, there is a compare between ACRN and
>>> jailhouse on X86.
>>>
>>> So it show ACRN a bit better? But is there any big differences in
>>> design? I doubt this.
>>>
>>
>> You also need to read the paper where the stats came from: They
>> implemented APIC (GIC equivalent) pass-through also in ACRN, a feature
>> that Jailhouse introduced in 2013, and then tried to compare that two
>> Jailhouse and also RT-KVM. Unfortunately, there were configuration
>> mistakes in both of those other setup. The one in Jailhouse they found
>> themselves, redid the measurements, unsurprisingly found both to be the
>> same then (no hypervisor involved anymore), but they didn't update their
>> graphs, even not in the paper. The graphs where simply copied into that
>> presentation.
>>
>> I attended that session and offered the presenter afterwards to review
>> their results in the future if those are taken over a stack they are not
>> familiar with. That would have also helped to avoid the architectural
>> mistake in their RT-KVM measurement setup which gave them result of by
>> one order of magnitude.
>>
>> BTW, regarding direct interrupt delivery on ARM: In
>> https://lwn.net/Articles/820830, it is reported that Bao has "found a
>> way to map interrupts directly into guests". I didn't find the time yet
>> to check if that is actually exit-free delivery, and that as a smart
>> trick or rather a problematic hack. Or if that sentence is rather a
>> misunderstanding. There is also the sentence: "Interrupts [...] have to
>> be mediated through the hypervisor, which is unfortunate since that
>> increases latency."
>>
>
> I found this interesting and tried to read more about this.
> I found some commits at [1] which does the direct injection.
> Here is my rough understanding:
>
> * He is not setting the HCR_EL.FMO bit and that way all virtual
> interrupts are turned off
> * There is a new handler for handling "lower_el_aarch64_fiq"
> which ends up being handled by the Hypervisor
> * GICD is still being emulated so guests won't be able to route
> interrupts to wrong CPUs. Isolation is maintained
> * For triggering interrupts from Hypervisor (SGIs, etc) he is using SMC
> calls and has a new service implemented in the ATF [2]
> * I could not understand how the lower_el_aarch64_fiq exception is fired
> so that the Hypervisor is invoked
>
> My guess is that most of the code change ihere s to enable interrupts in
> the Hypervisor. Resetting HCR_EL2.FMO would send the interrupts at EL1
> directly.

Yup, that's more or less it.

Just one clarifications, Bao *does* set the HCR_EL2.FMO, it doesn't
set the HCR_EL2.HMO. The HMO bit lets the interrupts through, and they
go directly to EL1/0. The virtual machines have complete access to the
gicc and receive IRQs without overhead.
As you have already pointed out, gicd is still emulated, so all the
operation of "enable/disable/set_tarrget" are slow as usual, and still
under control of the hypervisor.

The problem is that IRQs are completely invisible to EL2, so Bao needs
to use FIQs for its internal functions. And to do that the only way is
to go through the secure monitor in EL3 for each operation, having
custom services running in the arm trusted firmware.

I've even thought of trying something similar in jailhouse, using the
linux driver that, running in EL1, could let jailhouse access the IRQs
even without the HMO bit set, and therefore allowing direct IRQs
access to inmates without the need to put a custom service in the arm
trusted firmware, but I found it a bit too intricate.

-- 
Angelo

>
> [1]
> https://github.com/bao-project/bao-hypervisor/commit/ac41859fc26df8cbb16b25ca949f07f00c1d35a5
> [2]
> https://github.com/bao-project/bao-hypervisor/commit/0aaa1cade8b5e846503e9b515ae278cfeda30a8b
>
> Nikhil D
>
>> Jan
>>
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/e0b6c5f5-89a0-6e29-6700-e5d5064d4672%40ti.com.
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CADiTV-0qHuXt%3DwrGCp4RbFWcu%3DWGsZKB-doXOTxjMVZkRiiiCA%40mail.gmail.com.
