Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBOEH4LUQKGQETRC3GIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4FD7336F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Jul 2019 18:13:44 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id e14sf10032472ljj.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Jul 2019 09:13:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563984824; cv=pass;
        d=google.com; s=arc-20160816;
        b=kbgwHcpx3rvuiJEOnsfVKnRGXi+isX2qsGx7mmGeOpBC18iJ3Z3AXBemnsNsWevkXr
         q6wHQdrHD+azy190/ite9kV9xJCni0WGziMBSbEhHsviFEeeItITQUYLnp9IoJ0f88Wa
         guLPX23oWbWPWRjtGCWzGxeF6AhMM77ot4FhMyRNLhNlg0WI66snIYsIcImQo/YoumxR
         WtAXVB80P8FbVKgiLo2qu3l7LdtWHyM+zaukyA8mK4keLc0voIaKhUX0T4kNS6Be3JU2
         lWAYddmT9tkspbZeXJs2cXHK9NyAsRhCTsKzhOjLKiej80GSYOQxJ0BPyB//XqKeLjAG
         ls9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=XQu3yf+0Z6lNjXdaB4HnTmEdWAgFc957WccUjdbbRUM=;
        b=McnLpceBNpTUMq3n/M6Gh5tx7T5QUVm0RClScH2BbRTbxHQ3IIIrt4SLDGW1Wv+wKk
         sK3MuPtYuoV+kCiGkw1i47xxmOn7TkKlni8gC/j2gYpOnsYKwPvPTo59vxeArJ/ZH7vm
         pkSq56/OC9CIVx2XWAAlgWCXCT3MrQuehKQKX8vKhGsWdk2tbaZdnFhjKb4MFNdmwV+0
         5/UMeI+S+g+1cNEoTabZJKdVgp/CPJqUgI9QhLMtJO445l/WPR70+Hwo83xR4CW4/vyv
         J+D/HxmHJbHa8zRvOv/ap5BNABZk9nZIc5kcX43x+Gtj4VL/qBJRgaOCFRZKFXNCUBlw
         t1XQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QslXz7WB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XQu3yf+0Z6lNjXdaB4HnTmEdWAgFc957WccUjdbbRUM=;
        b=CS63sCrhUoQt07jpJDBeVSIQ8Es1KhXdxOcQ+9zLUmXyLZCyDugfh11hd78XCDaywZ
         8SMiuReSDOO1a0l5L7iCKcorJQTtlqEFz84zfE1sQLQ9631o4ZcEOrmhW2pGsBJ2Iaut
         j1jAWFeIIwKOHrpSkCHarahF7Fi1nTuuNz7PBvWkWyEwVz/UlCeZ98cVnM4WdJZKlKCw
         NDC12SC8J8gKnQj4msMI6j+T00Y1KAC9hX1q2KYz91xjE78J9mF6q4kx3TW8uH2SnHSH
         WgcYlRpFCVHMNghTGMzD8SOw2Yucv+enkeCmHugPwFfBKJJjn/Gc0wkPMVGYgViuecbN
         R8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XQu3yf+0Z6lNjXdaB4HnTmEdWAgFc957WccUjdbbRUM=;
        b=tnBH8crjv1JFA0HUj1Q6QeQPG9iaQQIozR56ALA7lDG1rkWLJO+2qdiN6rcr8BcWK7
         Ir00Lh+KhULp3XarQmVSPT5MMAsXu8DOLayYnp9jTM2kAzgeOWc1UtfPh+Ivwn6jJT31
         F3IW94TSAPFIfSqx0vo4RZTM65gtWCpC11lMmpMeaQd+L+7QNc9/G9vn2FJzWmKVndgY
         d7s8BdS2y+QeooXcb8Naf689PjVZuyluYhs4sdHH22j5bO5JzW3ocX3gV76ms7AYhavj
         pinWdF2Gv/Hfi5z2G/kH+OE9AC6wQO9e6oTCsV4Kaxprr9TqZ85E2JkPJp9oc5xVnW73
         ByZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXb33RM/6boZgzpvQd9as6qc7vSERUh+BkGULAkznR50reVkSC2
	4cRdUzVxk6cl61oWCx0X90A=
X-Google-Smtp-Source: APXvYqxDjg8Xj1hOo6HpTGy2G1fRDusbiXQHcyWg7IRW117F73iNRda3aFBd1mN0zWFzeHobqrfjtA==
X-Received: by 2002:a2e:989a:: with SMTP id b26mr43029641ljj.31.1563984824570;
        Wed, 24 Jul 2019 09:13:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:43ca:: with SMTP id u10ls3854006lfl.3.gmail; Wed, 24 Jul
 2019 09:13:44 -0700 (PDT)
X-Received: by 2002:a19:ca4b:: with SMTP id h11mr36696228lfj.162.1563984824023;
        Wed, 24 Jul 2019 09:13:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563984824; cv=none;
        d=google.com; s=arc-20160816;
        b=gYZkcVbSvX/OPlCCh6NgyrtLk6v1rCHFjweANuXq/J1/XsuyEMgz4ZTwu7cpmWIUcp
         FaCrW6SJFb8Jp162waRznZGNsnm75fslU74Ur9kGKHC9eG6Fxs6rkIjFZKuXVclGWu4S
         WiuqSqKWjse2ngOpZ/scKAB2MtNN0wJKB477U7s37lj4QbIufpa6JR+brxdQ+G38Dhod
         sPHZb1Njm9hwww2WP+hKwJj2mfeGc9MYI8ocdh8JuquTPsALL2nnOT6XMMzy1gTpwZM5
         O7VmocNQa4v7eMCPlJuoQyBbIWekZZBkxge606D+S9aZPsrcOGh2tE2VO9mWw7vsERFs
         li/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=b+9CPJEsKrKKbUWBBjc3zfJ3TOTGE6UJoR4ZzS0Oano=;
        b=uv59dR8VRKwdce6yONtrnaGvahk+YgfyQxQUY+cNzJb/WB7gQZxpJBiE+A1fMlhlwq
         ymGgpoetaDf+aiucbnroYpdQpD2vmuYEslsq29XOtca3Qk9OuFM8EE1UmX4XIupGmcyV
         TRpcMLzkvl1QPCF3kRy0oz0isoYY75MOhrz3S1QM9jSCWNDE4Da85X/ra8AliVKkz+1D
         MbpXuNDN1/nLTk1dnOQowmpTB0BCUB9uEoEP54BKkGaNFyou0uihP7IdVE9+Pgqh74PT
         5Am/+4C3Dg03QQbTlR+3sM+vxNFchee2WiNzenNU4s0eYdVfKAu2YOxkTBG6BtTH+eXV
         rKRA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QslXz7WB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id q11si2240958ljg.2.2019.07.24.09.13.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 09:13:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45v0lB6bqJzyCD;
	Wed, 24 Jul 2019 18:13:42 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 24 Jul
 2019 18:13:42 +0200
Subject: Re: Jailhouse and PCI UARTs pt.2
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <80b316b3-a6e4-35be-7cc0-578f1ac685de@oth-regensburg.de>
 <3d158812-b502-3641-f509-2508560aa51f@siemens.com>
 <c3f7bb71-cfcd-c11f-01a8-e3fe5ad971ef@siemens.com>
 <11ec656b-e07f-f6cc-12b4-87e20085924f@oth-regensburg.de>
 <00a032ec-71ae-8b66-a85d-a8f809e2f17e@siemens.com>
 <1a789cc5-8c24-9cdf-fe4d-63485379c5be@oth-regensburg.de>
 <587c7a49-cf58-b9b3-3a80-454ac165636f@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <fc1c5074-15e2-6681-dfbb-a1ce22ebe6ae@oth-regensburg.de>
Date: Wed, 24 Jul 2019 18:13:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <587c7a49-cf58-b9b3-3a80-454ac165636f@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QslXz7WB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 7/23/19 7:58 PM, Jan Kiszka wrote:
> On 23.07.19 19:53, Ralf Ramsauer wrote:
>>
>>
>> On 7/23/19 7:21 PM, Jan Kiszka wrote:
>>> On 23.07.19 18:38, Ralf Ramsauer wrote:
>>>>
>>>>
>>>> On 7/23/19 5:35 PM, Jan Kiszka wrote:
>>>>> On 23.07.19 17:19, Jan Kiszka wrote:
>>>>>> On 23.07.19 16:50, Ralf Ramsauer wrote:
>>>>>>> Two bad news: Linux's 8250 driver needs patching. At least we need some
>>>>>>> parameter like 8250.platform=disable to disable the probing for platform
>>>>>>> uarts. Why?
>>>>>>>
>>>>>>> ATM, we must specify 8250.nr_uarts. Otherwise the kernel will touch
>>>>>>> restricted ports. It does touch those ports, as it lacks ACPI platform
>>>>>>> information and assumes 'any' platform UART is present.
>>>>>>
>>>>>> Yes, nr_uarts is the patch-free approach for now. I once had a hack that
>>>>>> propagated the information "this is Jailhouse, you may not find platform UARTs"
>>>>>> to the driver. But that was a hack, so I didn't propose that upstream along with
>>>>>> the other x86 changes. Plus, there are cases where we do want to use a platform
>>>>>> uart in the non-root cell.
>>>>>>
>>>>>>>
>>>>>>> I.e.:
>>>>>>>   8250.nr_uarts=1 only touches 0x3f8
>>>>>>>   8250.nr_uarts=2 touches 0x3f8 and 0x2f8
>>>>>>>   8250.nr_uarts=3 touches 0x3f8, 0x2f8, 0x3e9 (?)
>>>>>>>
>>>>>>> In addition to that I have a PCI device. And Linux won't probe it until
>>>>>>> it probed all other PIO ports. If I specify 8250.nr_uarts=1 (as I do
>>>>>>> want to restrict access to 0x2f8), it will never probe the PCI device.
>>>>>>>
>>>>>>> So at the moment, the hack is to set 8250.nr_uarts=4 and permit access
>>>>>>> to all ports. Yikes. At least I now know that the PCI device basically
>>>>>>> works, but still, this needs to be patched.
>>>>>>>
>>>>>>
>>>>>> OK, that was probably not yet addressed. We once had a setup with UARTs on a PCI
>>>>>> card, but that machine also had no platform UARTs IIRC.
>>>>>>
>>>>>> If there no other way to tell Linux the number of platform UARTs, we will have
>>>>>> to introduce one, for the sake of this use case already.
>>>>>>
>>>>>
>>>>> Maybe we can do something like arch/x86/platform/ce4100/ce4100.c to "tune" the
>>>>
>>>> Thanks for the pointer.
>>>>
>>>>> platform UARTs (ce4100_serial_fixup). But it still takes an extension of the
>>>>> boot protocol to provide Linux with the information about available platform UARTs.
>>>>
>>>> Hm. We do have the comm region... It will hold the config's struct
>>>> jailhouse_console. We could use this in combination with
>>>> serial8250_set_isa_configurator.
>>>>
>>>> This won't enable all platform uarts, but with this we could
>>>> automatically enable at least one platform uart + hypervisor debug
>>>> output. This should be sufficient for most cases.
>>>
>>> This is x86 only: If the well-known legacy ports are open in the config and also
>>> the related IRQs, cell-linux could set some to-be-defined flags in the
>>
>> Hmm. The config (as well as the comm region) lacks the IRQs of the
>> platform UART. But they should be static for platform UARTs afaict.
> 
> The config has this: irqchip at standard address 0xfec00000, pins 3 & 4. If set,
> then the UART is passed. The comm region is not needed here, the setup_data is
> filled by the loader.
> 
>>
>>> setup_data, and the kernel could tune the platform UART settings accordingly.
>>> "Should be simple" (TM).
>>
>> Yep, that wouldn't require any invasive modification of the platform
>> drivers.
>>
>> Three flags should be sufficient:
>>   - Use 0x2f8
>>   - Use 0x3f8
>>   - Use dbgcon
> 
> Nope, 4: PC-UART0..3. dbgcon has nothing to do with this.
> 
> If we want to propagate the comm region settings into some "console=X", that
> would be a pure kernel command line tuning by cell-linux.

Ok, got it. PoC implementation works fine! ATM, I require two patches on
top of jailhouse, and two kernel patches.

I still have to clean them up, but it should be integrated upstream.
Once integrated, we need no more "8250.nr_uarts=..." on x86.

Still have to debug the IOMMU fault events.

Thanks
  Ralf

> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fc1c5074-15e2-6681-dfbb-a1ce22ebe6ae%40oth-regensburg.de.
