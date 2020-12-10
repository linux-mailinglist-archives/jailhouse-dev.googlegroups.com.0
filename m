Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3VXY77AKGQEROO3GHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEF02D556F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 09:27:27 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id a205sf882583wme.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 00:27:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607588847; cv=pass;
        d=google.com; s=arc-20160816;
        b=yPyhdDbzjv7Sxj6q4ae2uxKMpkb6aCVzDMLP5NJ24V/wrlmOLItrypod5oHbmWY0oZ
         DJvSvX8Sf6foR3q6D1brD6cGuuDO5s2A9oL5BwGXMcrkDgRAapLZ22TjJGmqBBVrGLC5
         eOqKx8YvnKImVZo/+G5g/2sAdYa0NPBRjxEGVTbs+Udt2F6vyQs1yMgOrR+fKxG0hb43
         f4QY/q3cGpP9Fd2Z3kRZLzgNQzEt30u7I8SBGowtAgrkJsYvropMI1xPGlm5iM0oEecy
         YIOJoLFXeeVtEFDZ3MmFD+gI/TaQS1kT7MmX3phZeSGNL8bltS8YXZ2Uw3jTFmiGCYdB
         Bkrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=vOionETSFC16PhOb5S9Vy9CC/kYrRODOmA6wupu3Zsw=;
        b=AfAyhWF1D1bG+7T7OT4jdsO5YKpVoOHfcxrn70Q8ZL0aNhYQcgU5/PC9FehrC5fokY
         J0JnC4vBtTxfWGUuvcXXY8V7gLINfSiTs/wimEK+X5fGXBYaeuH1+zPC9qXuQtXbSzw2
         vQ9/cLf8TbVP1AowoTwpsE9ImkZAOl3IMyRG4/6Cy7JWtLvHImTtNxC+0+C5OZxpyM/Y
         t9v5gjhOxBqTMNJwqfJZtn1HGayssxnLlt2Zy+dCU9kOnZYBVyfHgy2n2yhyRnjQlvIT
         5MOxIZfVa1W5+4UPAGE8XMM79p5bW2mH6JZ6vUhu1Z0Gxg8Dbxs718zMAvBgq9g6Ic47
         GF+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vOionETSFC16PhOb5S9Vy9CC/kYrRODOmA6wupu3Zsw=;
        b=Kw0rhXqBlPqmHTgXADfDBlEd/h3271B7BHf31Nna6X4JPIdlIS6Yv4D8yQ5Bz2Otno
         NH121h8DDUnsRJzCLGp46s5MwY6EnGGHPKSl1FGPJXOv4NviUc04zy+eBbclHdzJ1Iso
         N0LT5TAZpyqKxNLoj9+hIQdsTyZmSAD/x2/3daB7lMKeIJ73hfaoJdriryogoFkpuT4u
         hcsQLfWXa5Qb1MAUznRKJvQtkIdr/dHfCuAUsrR/UlorYPkk3Lhv4xAJW6epZ9u1YMsD
         74+V2Maap92WCqTHwK30rsNWRhSJnDI7Bhpdq22Pa7N9NrrJvrIqO3V8xn+OzcNUejrc
         puIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vOionETSFC16PhOb5S9Vy9CC/kYrRODOmA6wupu3Zsw=;
        b=VKG2/rBJvTJCXdRb0ymQFiiil9dwxMzfywVBX2wAAZbrB6MvWEvHxl0gu59rTXw02W
         Uo8S6iPYv/JMQJbP3mWtQ+y/aABOisG76fjWf2JWMBArwQBiK1CNQH2IC/n+RfSFSPpF
         NJbL/Clvohul0+tfgnu4Q3Fy1QCfPnuCW0jgJd/QSbj9GnXng/1FvUGKj5lj7LEFnZsN
         bsKtIDCOSTjsbWgHwte4zDJFzEGFBpuitHgy/bA+NZ8Xpib2odxZn+YV4HngzAtpNNak
         iHt5e2CotiPp+3BPh/AgS9YhUgdr7nHoR5oDAlKPec5Y+BcY839jLRk0CGHyFhe3Tups
         M6zQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532rnbUe+Y2c5CpoEQKbr+le9Tzm5e4+ttERMBVDuHtzkhFhcJjJ
	HaBuVrEpPoCWDYpbDlhBhJI=
X-Google-Smtp-Source: ABdhPJwnqCV9TZi3UU9g6zVpbXCf/3XY/6NiuQ4FwSvqAPcciTRnpP4xEfKj1jgn8Ef728M4Tmw3nQ==
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr6733960wmg.145.1607588846946;
        Thu, 10 Dec 2020 00:27:26 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1f8e:: with SMTP id f136ls1010313wmf.0.canary-gmail;
 Thu, 10 Dec 2020 00:27:26 -0800 (PST)
X-Received: by 2002:a1c:7218:: with SMTP id n24mr6865610wmc.186.1607588845985;
        Thu, 10 Dec 2020 00:27:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607588845; cv=none;
        d=google.com; s=arc-20160816;
        b=z1E4+HrnjPFf9p5an5vTygRaTsipHH38CnDD+DGE2Cij6F7XVm6TYIYeV4UPyq3la0
         zh4EKavo7SNDDBRzjl2Tt2U+obSeOyMrbCoxD/2Wl/X7Ylc5veTrqdqfKAlERGlCcy4a
         2O7Csbo5/YV7orvSBaKHN7GrCGb4w5WmABRK4fI6T1xsG/QYSveycpooNv16EFIQmQyI
         SNP17Sb+EVXQBZRpn/N2C1doRMfcIWr8eCfPMsaKa33zPyQ4QZ46xk8M0aIrJ85RcwYm
         VWFStF3lJGjOJCUaeK/wnhbGmwEVxcqR7/PaT/6FzqChhVVsLvBa1bQR3bD01IVjquxK
         lyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ClaL7kj9QBgPf5fA9krCC1nCDm4xWcEqMoexqtdS6+4=;
        b=Xr2ATY8n2uSNrBWeDNpl6dZGQC2VukM4TBABTXfSD3H3INobz9NZMq1HeIeThj4hai
         InKrHJ20DUOniBtCrPsPiGgG4H1xQq2Wg3i2ZRBik6I/FieAPzTOgKG2Ca1Cz3Jtf0AQ
         zw4eK/8adisn5vi/Z12Adupx4FT6zqYc8d/6sktrxhPkqt7t9cGf3Vf1qwRnWOF7fSwb
         KpDaoBj9T72bwTKuMBdUl251elIvLWR9Bs8heMLuWywyuaOKSrL4XfQSFOyJD5A5xZcn
         NR/13R1mx15yGJ3BSk+a/zdzhTj36zvkTUAxX6Bd8Q2G5YqXn98n761m6QEG93HLyzMf
         ZMtA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 10si168749wml.0.2020.12.10.00.27.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 00:27:25 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0BA8RP8D024418
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Dec 2020 09:27:25 +0100
Received: from [167.87.36.107] ([167.87.36.107])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0BA8ROoZ013330;
	Thu, 10 Dec 2020 09:27:25 +0100
Subject: Re: ARM64 MSIX enabling error
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <DB6PR0402MB2760E09A5E40B4818663E07D88CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <3bbd059e-632b-da36-1f79-de1731e1352e@siemens.com>
 <DB6PR0402MB2760AF37C2A42481C80249E788CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760C14BDE7BECED2A60906488CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <543a61e2-e521-5c89-0d96-9f06946f0aae@siemens.com>
 <DB6PR0402MB27605393AB95974CE4D8944E88CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <35de9824-dc88-dd3a-175f-6db6c086d2a6@siemens.com>
 <DB6PR0402MB2760F7FE11280F9619178C5888CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <5043bde5-fe69-398a-a0c6-9957459f2b57@siemens.com>
 <DB6PR0402MB27604611BF7DE87E43799E3A88CC0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3879a23f-0d6e-4aa0-f8bf-9774b4ddfff7@siemens.com>
Date: Thu, 10 Dec 2020 09:27:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB27604611BF7DE87E43799E3A88CC0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
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

On 09.12.20 02:35, Peng Fan wrote:
>> Subject: Re: ARM64 MSIX enabling error
>>
>> On 08.12.20 10:46, Peng Fan wrote:
>>>> Subject: Re: ARM64 MSIX enabling error
>>>>
>>>> On 08.12.20 09:01, Peng Fan wrote:
>>>>>
>>>>>> Subject: Re: ARM64 MSIX enabling error
>>>>>>
>>>>>> On 08.12.20 06:28, Peng Fan wrote:
>>>>>>>> Subject: RE: ARM64 MSIX enabling error
>>>>>>>>
>>>>>>>>> Subject: Re: ARM64 MSIX enabling error
>>>>>>>>>
>>>>>>>>> On 07.12.20 08:46, Peng Fan wrote:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> I use MSIX, not INTX in root cell file, but always met the
>>>>>>>>>> following
>>>> error.
>>>>>>>>>> uio_ivshmem: probe of 0001:00:00.0 failed with error -28
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I am trying virtio ivshmem on my board, but seems virtio
>>>>>>>>>> ivshmem vi_find_vqs not work with INTX, so I change to MSIX to
>> see how.
>>>>>>>>>> But met upper error, any suggestions?
>>>>>>>>>
>>>>>>>>> MSI-X for virtual devices only works when injecting them into a
>>>>>>>>> physical PCI bus which is using MSI-X already. Is that the case here?
>>>>>>>>> If not, you need to debug the INTx case.
>>>>>>>>
>>>>>>>> ok. Thanks.
>>>>>>>>
>>>>>>>> I could see virtio-ivshmem-console /dev/uio1 shows a few lines
>>>>>>>> log,
>>>>>>>>
>>>>>>>> But it responds to input very slow, when I press enter key, it
>>>>>>>> takes long time to respond.
>>>>>>>
>>>>>>> After correct the interrupt number, it responds to enter key fast.
>>>>>>> But if I not press enter key, the virtio-ivshmem-console /dev/uio1
>>>>>>> will show nothing. If I press enter key, it will show one line boot log.
>>>>>>> Press one more time, it will show the other boot log.
>>>>>>> I need press enter always, then could see the boot log printed out.
>>>>>>>
>>>>>>
>>>>>> Still interrupts issues, I would say. The GIC MMIO resources are
>>>>>> not accidentally passed through? Does /proc/interrupts report
>>>>>> events for the virtual device?
>>>>>
>>>>> ivshm_irq_handler is triggered in the beginning, for several times,
>>>>> but after that, there is no interrupt triggered from inmate Linux to
>>>>> root
>>>> Linux.
>>>>>
>>>>> The inmate Linux is dead loop in
>>>>> __send_to_port
>>>>>       ->
>>>>> 644         while (!virtqueue_get_buf(out_vq, &len)
>>>>> 645                 && !virtqueue_is_broken(out_vq))
>>>>> 646                 cpu_relax();
>>>>>
>>>>> If I press enter key in virtio-ivshmem-console /dev/uio1, it could
>>>>> pass the
>>>> loop.
>>>>> But it will run into it again later and not break out.
>>>>>
>>>>
>>>> I bet the "virtqueue_kick" that comes before this loop does not
>>>> trigger an interrupt on the backend side
>>>
>>> Indeed.
>>>
>>> - or we have race that this is consumed without
>>>> delivering the expected answer to the frontend. Didn't recall to see
>>>> this, so I'm afraid you need to debug deeper.
>>>
>>> This change make it work. I am using INTX, so num_vector is 1, however
>>> if device vector is 2 or 1, it will ignore the interrupt inject in
>>> hypervisor/ ivshmem.c
>>>
>>> @@ -361,9 +369,9 @@ int main(int argc, char *argv[])
>>>
>>>                 memset(queue_config, 0, sizeof(queue_config));
>>>                 queue_config[0].size = 8;
>>> -               queue_config[0].device_vector = 1;
>>> +               queue_config[0].device_vector = 0;
>>>                 queue_config[1].size = 8;
>>> -               queue_config[1].device_vector = 2;
>>> +               queue_config[1].device_vector = 0;
>>>                 current_queue = -1;
>>>
>>>                 vc->config.cols = winsize.ws_col;
>>>
>>
>> OK, we need to explore how many vectors are available and configure the
>> queues accordingly. I thought I did that already but apparently that wasn't for
>> real. Or it was only for ivshmem-net...
> 
> Please help create a patch, I am a bit new to this.

Now I remember why there is no detection yet: UIO lacks proper support
for multiple interrupt vectors. ivshmem-uio works around that by
registering on all possible vectors and reporting them via the single
event channel. But there is no interface for the UIO userspace part to
find out how many vectors the device supports at all.

We could either create such an interface - or we could enhance UIO
directly to support multiple interrupt vectors. I'm leaning towards the
latter...

> For ivshmem-net, do you plan to support virtio network?
> 

Not at this stage. It would require a better (more performant)
virtio-ivshmem back-end architecture to handle network with similar
throughput as we do via the symmetric ivshmem-net so far.

>>
>>>
>>> BTW: Do you think using kvmtool to include the virito ivshmemv2
>>> support is a good option? Or you insist standalone tool as your
>>> current design?
>>
>> kvmtool is for... kvm. I'm not sure I you can easily factor out the device
>> models from the kvm part there.
>>
>> I fact, I'm rather thinking of something list rustvmm to exploit as device model
>> supplier on the long run.
> 
> ok. I am not sure which is better currently. Rustvmm might be a good choice.
> 

I can't tell that for sure yet which path is best.

I only had a look at the virtio backend implementations of ACRN for
Linux, and those didn't appear worthwhile to reuse (too simplistic
implementations, too bound to the restricted device model of ACRN).

But from the perspective of current + growing popularity, rustvmm is
likely the best candidate, after QEMU (which is likely harder to reuse).

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3879a23f-0d6e-4aa0-f8bf-9774b4ddfff7%40siemens.com.
