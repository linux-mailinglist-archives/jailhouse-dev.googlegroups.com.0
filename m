Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBH5CXX7AKGQEZDMVFOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id D34802D2887
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Dec 2020 11:10:39 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id y5sf1971065wrs.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Dec 2020 02:10:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607422239; cv=pass;
        d=google.com; s=arc-20160816;
        b=x0qNfxYxtH9TYAmFDX2Z6LOIe4vWGriTqq2NNFnXXQ5yA3nXwZmF3zFEcCkxHMliY2
         yTxyI5GePNjdxCKIvKSry1LmQsEqKYIpwDPsZJmSa/hNgUf7a3aeCq+3OSYxl4Uy1Pwo
         +jpd2XZBZKnZkJkuJqlrcT9yFMHYKJKWUrz5VOtWB50EMqgY3baqcR8JtZ/2D0Zz0qLv
         z+kOcHcFc9igPX1cPlB+8fEPz0PXlEvO+XZNyBQUbzOzEDuWPOsZSPCHk06IvCnnmJ2z
         CY/zMIkdaNRwFsRlOXkf0xvxE6I4dhEhXdCHQ7iKl6APOCeNSGxkG5EnMlme/hB194fE
         oo3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ImyLxdDs71K+gdMoLrwrfMo15s1HrmGRARYrq77IKUM=;
        b=JMSnJ6iwUG46z3I8ZWRPzQBmMMaX+/jDo8fX23p9J9g0RwbcOQkjwd8IImmAs/3Rnd
         cIZwWjnSdXLrTnuK0zg1VsE1sQ+T06T5RMZvMfX+bCOXgirvkcKRACMNQ6vTpP79a7qX
         ic0rwRiovQVOyoIJsx1eCIe1q6eVZnBT507BuHZvSTZa8zdzxvmWYf/zaoiS2yMKYQMA
         avGID05Ut5CuW7FZeQQXCP3b8iCvvlkWVu7C3YeXWztPacglyzUpYthFMToSd0so5RZD
         N2La8LvXW2PXkAyQZ7pUM5l6zhyyPmfAxcQeFAW90Yh3wrlVeuzk9s8dXahm9NDZg6Ar
         FaYA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ImyLxdDs71K+gdMoLrwrfMo15s1HrmGRARYrq77IKUM=;
        b=FvnNzeQ65J1VMUE4Bisee1l74kyov+WRz2LT1hLU5EOBgcX6u5visu2DDRBpq8Cvwt
         Rd7ZX40C/psbXipcdrUCbi4j92vDuCokT9VJCwG44B5HvnXgAm0HyyLKEozIEta8sQ6g
         t7iayeRCx1VhFG7SxxhLZ28QvxZpZL9nQS2e+X1Y8/KNmaFEksJV9RiIDlWfW6m/GDth
         c+Ue+H/SbU15IsM8ARV7y31I4pud/Vibpn5kGjOsVYVdw2rIsZzWKGquwxcRBE8ZsuD5
         6zGm5Hcxz54JZnKAwb1mTyGnmX0KWF0hF42pQCtjBgip7oRE3PgItnveKl4RYOWN4azw
         pPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ImyLxdDs71K+gdMoLrwrfMo15s1HrmGRARYrq77IKUM=;
        b=R6Ygyj3MOWDV/+1ZAx2FuSDtVBuLBBnR4O1N5KPNLjXvchkMjpZOY8LSpkmxk2sG+D
         3cu/QLDHlA/WLrKIucb69FnOzpeSdE58hM3nbAmzchCWUl7Hq2cT1sbWuRqmjUIczVjd
         aQQvTHvWO+CrTI/AtO1yNqI+h0/BEAD171W4fMVNxJ41I7llGe00e8EvbZTevk/defcO
         o+alVYB6L9dMENqMz5bCtE6tbDqGAoLW7ImzFxsYu7JRo2JsKpianem9p9oZrYmPUnfq
         o21gZLKWLYOuzcRKKe+1G/lUNCJ2gchT+HB3MMR4z/uOK68gGhpTrE/6Jw0ZPyft5Xar
         4YQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5313ACel/RYzQxuO1vxT84qWpNsfGhizQ4qH4GswIgurmnrbbmv/
	uw51S0jPA8Tj/Opln8y0rJM=
X-Google-Smtp-Source: ABdhPJwNBo2P1b+v7UlYpKixrSdYXl75KtEAR8AfWRDjovwh5/R1UC8jjcU9zYKvaW2vVchMTkqpzA==
X-Received: by 2002:a1c:3b46:: with SMTP id i67mr3026367wma.108.1607422239593;
        Tue, 08 Dec 2020 02:10:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1d8a:: with SMTP id d132ls815635wmd.0.gmail; Tue, 08 Dec
 2020 02:10:38 -0800 (PST)
X-Received: by 2002:a1c:e042:: with SMTP id x63mr3202638wmg.68.1607422238535;
        Tue, 08 Dec 2020 02:10:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607422238; cv=none;
        d=google.com; s=arc-20160816;
        b=ofiO9FSGmMmyATD3XudCqM6AxgZxf+fP7Rfd10WE1DagnQShE109ZeSp2YxsAL6kdz
         vLGOH10i4qaH3TRV/CfH9myPhNgrn9fWLxhMbZPt3yxChqmsVNcR1QP9spELFL1J4e3+
         2vtCQXfAa/nJHv4h7Lke1z/e0PmQMuN1Ds+PVpkRQCb1+/58j7ekltm6PCmJie9e62CW
         OuwtK2W/WHy7Q3FxmW5spBlpteZx4dBY4f5t9dyuQfiVm0tFDJCCGlzlS4OZqTpcn3Q7
         p/4V4/Z2zbVNCWbbuH9gcifqxBkLS7FrlRVcYayqce4JGYrebw3KVF+f01Cvad2DUeVn
         +Rzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=vKbhjDhSJGzhsUm8ei9rjzdeKlTOERoAC+0fejBmj/M=;
        b=yRRm0RWjtrgRIdRivg2lnJyarYl0Lpixkw7grezLWY0SJW1Vzv+xdDBHOzmX7x5zwM
         M1Uaqc6E0mtGFoyE+hNaDNsF0Qg7WQ33dkehcFF1AwRSYunhBqh9P1qZrGfZIkkETf7P
         MSrYhuUQn/7GiMk5uloI9WX36fkxQAxANEpZm+4s8i/vhHRI9Qf/FPcAvvwkmKX3sm5E
         5XG+gbRCB+q48evTkVgv/CIMGv1vKNLKKM6D4FlI2gc357mi/OY6XxZ40/UMsTawAKFp
         RGPyMz17EqHFxV+vnFoFWnxbkfefc/+4CLzl7K5T+noARVW1a5P3VG+Wiraf03Is/chy
         ezkw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 6si302383wrg.2.2020.12.08.02.10.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Dec 2020 02:10:38 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0B8AAbWX000478
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Dec 2020 11:10:37 +0100
Received: from [167.87.36.107] ([167.87.36.107])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B8AAbrj001777;
	Tue, 8 Dec 2020 11:10:37 +0100
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5043bde5-fe69-398a-a0c6-9957459f2b57@siemens.com>
Date: Tue, 8 Dec 2020 11:10:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760F7FE11280F9619178C5888CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
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

On 08.12.20 10:46, Peng Fan wrote:
>> Subject: Re: ARM64 MSIX enabling error
>>
>> On 08.12.20 09:01, Peng Fan wrote:
>>>
>>>> Subject: Re: ARM64 MSIX enabling error
>>>>
>>>> On 08.12.20 06:28, Peng Fan wrote:
>>>>>> Subject: RE: ARM64 MSIX enabling error
>>>>>>
>>>>>>> Subject: Re: ARM64 MSIX enabling error
>>>>>>>
>>>>>>> On 07.12.20 08:46, Peng Fan wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> I use MSIX, not INTX in root cell file, but always met the following
>> error.
>>>>>>>> uio_ivshmem: probe of 0001:00:00.0 failed with error -28
>>>>>>>>
>>>>>>>>
>>>>>>>> I am trying virtio ivshmem on my board, but seems virtio ivshmem
>>>>>>>> vi_find_vqs not work with INTX, so I change to MSIX to see how.
>>>>>>>> But met upper error, any suggestions?
>>>>>>>
>>>>>>> MSI-X for virtual devices only works when injecting them into a
>>>>>>> physical PCI bus which is using MSI-X already. Is that the case here?
>>>>>>> If not, you need to debug the INTx case.
>>>>>>
>>>>>> ok. Thanks.
>>>>>>
>>>>>> I could see virtio-ivshmem-console /dev/uio1 shows a few lines log,
>>>>>>
>>>>>> But it responds to input very slow, when I press enter key, it
>>>>>> takes long time to respond.
>>>>>
>>>>> After correct the interrupt number, it responds to enter key fast.
>>>>> But if I not press enter key, the virtio-ivshmem-console /dev/uio1
>>>>> will show nothing. If I press enter key, it will show one line boot log.
>>>>> Press one more time, it will show the other boot log.
>>>>> I need press enter always, then could see the boot log printed out.
>>>>>
>>>>
>>>> Still interrupts issues, I would say. The GIC MMIO resources are not
>>>> accidentally passed through? Does /proc/interrupts report events for
>>>> the virtual device?
>>>
>>> ivshm_irq_handler is triggered in the beginning, for several times,
>>> but after that, there is no interrupt triggered from inmate Linux to root
>> Linux.
>>>
>>> The inmate Linux is dead loop in
>>> __send_to_port
>>>       ->
>>> 644         while (!virtqueue_get_buf(out_vq, &len)
>>> 645                 && !virtqueue_is_broken(out_vq))
>>> 646                 cpu_relax();
>>>
>>> If I press enter key in virtio-ivshmem-console /dev/uio1, it could pass the
>> loop.
>>> But it will run into it again later and not break out.
>>>
>>
>> I bet the "virtqueue_kick" that comes before this loop does not trigger an
>> interrupt on the backend side 
> 
> Indeed.
> 
> - or we have race that this is consumed without
>> delivering the expected answer to the frontend. Didn't recall to see this, so
>> I'm afraid you need to debug deeper.
> 
> This change make it work. I am using INTX, so num_vector is 1, however
> if device vector is 2 or 1, it will ignore the interrupt inject in hypervisor/
> ivshmem.c
> 
> @@ -361,9 +369,9 @@ int main(int argc, char *argv[])
> 
>                 memset(queue_config, 0, sizeof(queue_config));
>                 queue_config[0].size = 8;
> -               queue_config[0].device_vector = 1;
> +               queue_config[0].device_vector = 0;
>                 queue_config[1].size = 8;
> -               queue_config[1].device_vector = 2;
> +               queue_config[1].device_vector = 0;
>                 current_queue = -1;
> 
>                 vc->config.cols = winsize.ws_col;
> 

OK, we need to explore how many vectors are available and configure the
queues accordingly. I thought I did that already but apparently that
wasn't for real. Or it was only for ivshmem-net...

> 
> BTW: Do you think using kvmtool to include the virito ivshmemv2
> support is a good option? Or you insist standalone tool as your
> current design?

kvmtool is for... kvm. I'm not sure I you can easily factor out the
device models from the kvm part there.

I fact, I'm rather thinking of something list rustvmm to exploit as
device model supplier on the long run.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5043bde5-fe69-398a-a0c6-9957459f2b57%40siemens.com.
