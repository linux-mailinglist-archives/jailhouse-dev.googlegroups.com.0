Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFE67D3QKGQEWYYMN5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D682129F1
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Jul 2020 18:45:08 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id d3sf15362396edq.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Jul 2020 09:45:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593708308; cv=pass;
        d=google.com; s=arc-20160816;
        b=Guw8Q0EY1aH6ok0uYKUhgm2SgzE5qRszMYZydy7hAawUNlT8z0ZfDk6D+fDqXmLuPM
         brpxwoF1qCTrekQnCiV97KnakW34R08Ohln4JB5LbWGH8OvH+zlpcDwlTHi/lrs/CRvM
         URBeX6xM6Y3jG3xOHC3ABcWgq8UabGHd/GTe2t5oSpOgnGf0ojXbITnPFKB0mrMP9/rm
         sGqgSs50T+5v96y2cNWo/xlg3nuQn4wXdhdXpuu0jctr/Kegnax/l9z1r+gKwHttw14u
         EFbAWR793Y4g5VsRVAn6zYqx4t3aJgiQZA2231lAUuWnOKl0sBuBaahWQ+htTyJnhAKN
         JtNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=CwdFYzB8//CTv7ov4D1rEGL0cWYoChWDjdScDag7jME=;
        b=OwyWpQce8lWYZE020ZYD4fr0ms9ov59Hm37xkAsQRAQ5IJPQshqxs+CiTOt0JPjNUZ
         4y3opqplSDpBh/KrAN5AKsnmiz6qfHg7wT4cBI+jTY2ik/OQVt4U/cJ9EB1HjJt4grhz
         j9wcKflm0B8cVTNDtHVqDiUaPItPyxFCQKHWVlzEEgucbVNotvmcdcqBv/J9a88FZqhX
         J14TI/WImlzWkCLXgJEx0/G1BS36Q87UpJBDzS+DB+Xh+JwKzbgn6/ArZM9fvjUf6pl1
         d68nsMf4hLiscom5oCCUUMFfdps7E1VaXmBzoAyuRQHY7NCd9KVtSYce4Ai783+UZlos
         RopA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CwdFYzB8//CTv7ov4D1rEGL0cWYoChWDjdScDag7jME=;
        b=GXrTUphplr2WBy0apA2YjdY/GL/uHd3ayX4p42+1g3Gdw799aXPB7X0FirM3EXkCCE
         6ZzY9dSnp0P1fHg3oWfs5vohpj2HXXmjyZ3t8NvMlbPRV0iMMlHV+qgUt4dF8hEcWetl
         KFu9rs3vr3+PNEMzAt0Jko5jQ0vTr/1auFJsGiEYjh6u4e5rSNRSGP6TQg5SscE/T/lo
         an3TR2C9isTjvOVu6NCH+qizDGoue9vZdVuJaUIrFDXHRfLkQkhGqhacTwQQrwiRKsjV
         WL6nnhwjbkgdDp76pQpjWG8AzUcdG2OZcO19NDmUfFDma2qVLiPmUwc5pGUaaWB1NY6W
         JwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CwdFYzB8//CTv7ov4D1rEGL0cWYoChWDjdScDag7jME=;
        b=Mtc7COvoBWGRWjH6239sUBEamtcuK1dup5z5HHmQh4Y+XkomfcIpq24el4qCHJxeKs
         I1IH8ziYzZd05Igghg3S6UBI3qnvlykZP56SLz7UkRwz4kFfB3p3/MjPOpVGnWBjdt1v
         GEAuiNRHwwiw61H/tLuJWjbOsTRkVw/JHdoScjzLd5o9ff6YkxhpJ7byMXc1UxANB4jv
         QRhm6Xl76OiHp0K2SDf38CIwuPu7HkrTAmnJ1do6YLMjrAYAK5mCASIWqngIIA1AT1sF
         0PuL0BrVv1DhpH0MWYpyFzP+tnbaffzQoqGevq1wrQ1ZNir4DaFrO0RlWXGv9l3YAmZL
         QC5w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5301OaaUNFSSgUYoxScZO2nOZgQPFya5wuQvhths5RczeI7gpulw
	8gSysIdOALCRzfB9/sllMbw=
X-Google-Smtp-Source: ABdhPJxKCRwHCl88cVowexZNhmYC155D6kVRVYUNw3v3lRaLgKyn+0Y+c4KLS+XJnUUFScPrAiN6tQ==
X-Received: by 2002:a17:907:1059:: with SMTP id oy25mr30337219ejb.90.1593708308370;
        Thu, 02 Jul 2020 09:45:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1d37:: with SMTP id dh23ls83042edb.1.gmail; Thu, 02
 Jul 2020 09:45:07 -0700 (PDT)
X-Received: by 2002:a05:6402:3138:: with SMTP id dd24mr36453844edb.118.1593708307625;
        Thu, 02 Jul 2020 09:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593708307; cv=none;
        d=google.com; s=arc-20160816;
        b=DmGhS6jmAI2sKz6k3TxbVSY99REzhBEzoFwaKoBRwga8K4Dv+roohgw6mzEDqBiqta
         OMb4x8bcr8NRrdgmvpHlOrCkc+i09xB2I47AhdtgVZW2ZUt/WkEnkgpRUIPQwCqeiI9z
         +PiD0PLSg/EvNTG++wODOBHEVe48RtqZtBmpGOf6vKATlpKSH3N6PefYFjSfstE5KVuJ
         cHiY6epPwnkleeVa3mgpH0Ps+fhBNFyOgz1ogFQjIgl8stSUqFMsPmv83ILH5NrblaPz
         8A3OvrpVkwL/G+ExbaQME5mmodZhLBMc4eqDppyy3QOeVfVFfzWD5an3yMLEkFvMvXXA
         qkVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=czV7pSodVXdcUE5E1TKa/SNu5mk/5XkqXup0aZctZHs=;
        b=HBl2OtkmLAOWJO+U5QnKoT6lxW3dAofuaCLm3+Eiaax+TvSwGkXopWcv4k4helmoLd
         /zc8TvOE38GyZanSoyWjTPW0TXUIeGneeSUtjDrOxMCIg5UYDFwUN+R2UYZ/SXOIyU+S
         KuKZJ6gbO72NsUAORACvoVN12lFjRNuNjaRlF+a7nLxw65+7MsBcRiSEJniWdrMCaoXA
         ZMN7Iw40mSjwQ7kLnHOvxndLh6ULCbYakur2+uEBfcJx5g4CAKPJvIcxfFyjbLRyOeTr
         cXQdBLLw4LO1iMHLJ+MnBvcQTvyMz8ofkG/wn9/WSDh8wdcn3f0mcksRmfJvB5C/Tb9m
         zZkQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q9si619189ejj.1.2020.07.02.09.45.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 09:45:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 062Gj6Ok004699
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jul 2020 18:45:06 +0200
Received: from [167.87.128.222] ([167.87.128.222])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 062Gj3vR012461;
	Thu, 2 Jul 2020 18:45:04 +0200
Subject: Re: jailhouse jitter?
To: Angelo Ruocco <angelo.ruocco.90@gmail.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>
Cc: Peng Fan <peng.fan@nxp.com>, Jailhouse <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>
References: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <38ffb4dc-20d6-3404-cc61-ea08ea8066f1@siemens.com>
 <e0b6c5f5-89a0-6e29-6700-e5d5064d4672@ti.com>
 <CADiTV-0qHuXt=wrGCp4RbFWcu=WGsZKB-doXOTxjMVZkRiiiCA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1d5b0ac8-0744-59ab-bb90-8133df4a1525@siemens.com>
Date: Thu, 2 Jul 2020 18:45:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CADiTV-0qHuXt=wrGCp4RbFWcu=WGsZKB-doXOTxjMVZkRiiiCA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 02.07.20 15:31, Angelo Ruocco wrote:
> On 02/07/2020, 'Nikhil Devshatwar' via Jailhouse
> <jailhouse-dev@googlegroups.com> wrote:
>> On 02/07/20 5:14 pm, Jan Kiszka wrote:
>>> BTW, regarding direct interrupt delivery on ARM: In
>>> https://lwn.net/Articles/820830, it is reported that Bao has "found a
>>> way to map interrupts directly into guests". I didn't find the time yet
>>> to check if that is actually exit-free delivery, and that as a smart
>>> trick or rather a problematic hack. Or if that sentence is rather a
>>> misunderstanding. There is also the sentence: "Interrupts [...] have to
>>> be mediated through the hypervisor, which is unfortunate since that
>>> increases latency."
>>>
>>
>> I found this interesting and tried to read more about this.
>> I found some commits at [1] which does the direct injection.
>> Here is my rough understanding:
>>
>> * He is not setting the HCR_EL.FMO bit and that way all virtual
>> interrupts are turned off
>> * There is a new handler for handling "lower_el_aarch64_fiq"
>> which ends up being handled by the Hypervisor
>> * GICD is still being emulated so guests won't be able to route
>> interrupts to wrong CPUs. Isolation is maintained
>> * For triggering interrupts from Hypervisor (SGIs, etc) he is using SMC
>> calls and has a new service implemented in the ATF [2]
>> * I could not understand how the lower_el_aarch64_fiq exception is fired
>> so that the Hypervisor is invoked
>>
>> My guess is that most of the code change ihere s to enable interrupts in
>> the Hypervisor. Resetting HCR_EL2.FMO would send the interrupts at EL1
>> directly.
> 
> Yup, that's more or less it.
> 
> Just one clarifications, Bao *does* set the HCR_EL2.FMO, it doesn't
> set the HCR_EL2.HMO. The HMO bit lets the interrupts through, and they

HCR_EL2.HMO? On which revision of the ARMv8 spec are we looking? Cannot 
find that in mine.

> go directly to EL1/0. The virtual machines have complete access to the
> gicc and receive IRQs without overhead.
> As you have already pointed out, gicd is still emulated, so all the
> operation of "enable/disable/set_tarrget" are slow as usual, and still
> under control of the hypervisor.

And so is inner-guest SGI (IPI) submission, I suppose. Just like on 
Intel (so far).

> 
> The problem is that IRQs are completely invisible to EL2, so Bao needs
> to use FIQs for its internal functions. And to do that the only way is
> to go through the secure monitor in EL3 for each operation, having
> custom services running in the arm trusted firmware.

Ah, interesting pattern: FIQ becomes the NMI that enables such a trick 
on Intel CPUs. If FIQ triggering architecturally limited to EL3, or is 
that SoC-specific?

I'm not fully familiar with the ATF/TEE world yet, but your approach to 
model that service as SPD seems to block other use cases, like having a 
full TEE (OP-TEE). Wouldn't it rather make sense to model that as TEE app?

> 
> I've even thought of trying something similar in jailhouse, using the
> linux driver that, running in EL1, could let jailhouse access the IRQs
> even without the HMO bit set, and therefore allowing direct IRQs
> access to inmates without the need to put a custom service in the arm
> trusted firmware, but I found it a bit too intricate.
> 

You can't use the guest to model management interrupts that are there to 
interrupt the guest and inform the hypervisor about a high-prio event 
(like "kill that guest").

Jan

PS: Reminds me a bit of what I just had to do in order to plug some 
other hardware gap: https://github.com/siemens/k3-rti-wdt (hello, TI :D)

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1d5b0ac8-0744-59ab-bb90-8133df4a1525%40siemens.com.
