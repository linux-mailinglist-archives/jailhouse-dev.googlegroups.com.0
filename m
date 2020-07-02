Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB6VY673QKGQEJPG76KQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93f.google.com (mail-ua1-x93f.google.com [IPv6:2607:f8b0:4864:20::93f])
	by mail.lfdr.de (Postfix) with ESMTPS id C74A3212429
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Jul 2020 15:09:15 +0200 (CEST)
Received: by mail-ua1-x93f.google.com with SMTP id 75sf7727744uai.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Jul 2020 06:09:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593695354; cv=pass;
        d=google.com; s=arc-20160816;
        b=HiIcHKgO4TTa1qTdu2nWnuA7GYOFj8o1XDOxWVjCfJ4EHc1o6GWH09d2UOLlCDe6v9
         qdN7PeEc3cfVPDg/L7p8hmcVEzlxGKSaIxkjkPAYUFqVuUIKQsDZBQlKG5srelgAklAa
         Gct82yzzuKhH+H2uoARpJTm5kmKkeM+ffwzN6w1BwO5dRBvdrStLTwAwZLgT1D7B8Tky
         FxLaz1ItG1xl2qdnLfuD+Cfvg/dkpJnhkwwWE0qOjSH3GCu4+nDmJj9KtpuKMiyyISUn
         NRVpJmSzaBtV+IyKXMpK1mxNR7wboMIgO4IBROTvA7iUc2kvguEXUaN3a0PMLayV0eSh
         B1mw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=kqLJOi3dy5Iqj7cbfvYg/YUztYC1WeCtCoSqNjz6D0I=;
        b=SGqE50F979WE44rG7ee7T0d7ScrgTKyEXd/h6h6mqpGvrum5k4iYdlfJsRopp0Ie1R
         7jX5wFwOEfT3KZ2mHfuU3a9294lbPkzKB9hKKKxgWmr/XuYl7WaSaDV8XqHwdRpQm+37
         Uk4qdXswul2tXQAvNSbq+OTVKLYo0IxZ8QJMbgjrIJWDGox9QOZMYm8y3VWdB00p5AmK
         dQA1FSrfKZp3IMiP7RBc761Z6V0RWg4fT4YQJ+jgQRPgyQ0U6uHS6oP6/2fEWs21M48D
         BpokNFRnuUr7XRLO1Igdx4F7xLeoYFMcn2Cj/l/v8Pai2c9JEMt2OO8wNhpNUKzDEet7
         J9gg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=unepzG4N;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=kqLJOi3dy5Iqj7cbfvYg/YUztYC1WeCtCoSqNjz6D0I=;
        b=EOU1T1HzCXjGcaLqdX++42PJfuNZmdSVA6hsQ99KDx2mhTFwAe6NSYPyhlXe3NeA3U
         qE9vDRmh7f3SF/yukjHfFT5OfCVqXoPPxLKlLUXdootDdiAq/n5VWNlt4uUkHk9/UCtD
         JEh2FciTlZBWuzu7DvdTpTufTk/+IuRKJuBjh+h4fgVk9wzfBXlX8FBDmY4hGy9ma7Wi
         gxbONtfTmDsWWyq+wfYplJrQSZXVEzQnC3J1XgLit/YaAQi+TOOIVpn5wSlMc8F3uX3d
         VFhFxtiJrfsc8zWEAX4sMhY8stkv3AqW//Xal5Vq+AUxD/DicdwVERUExj6TrSKTQXfa
         C3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kqLJOi3dy5Iqj7cbfvYg/YUztYC1WeCtCoSqNjz6D0I=;
        b=i1Ri7FxPbMZo9KLTARIWz3c2g1UWElCqhXyNTM5vbHLxOqiMawBRG3l2ANaJBmH6vc
         Pah/6BGMt2AM/Ao5b4diL0mLvY9T9qVPjVLG+AMwYyWXlWBaKJwG3Y2BNuEA2ifEtk6h
         /oWyhMKuYf+bK2JJ21ff/p6NkVc6VuE91AadlxhFemO2cQQaR3kRDgA/fmozrUwnE9Ko
         +ldSKv+Kzs+yPXnl7vmsObZJPy23sNrXyf6izkrhguCNao5gGzyNt6A+7GfgZsY+x/tj
         5O4TxxqwRSVJuuI1bjziN4JCZYu/x6CKTyw171uf76bK/sLJGSZTJpWfF7sdr9Tk9hrW
         vc3Q==
X-Gm-Message-State: AOAM530pRuUmCoPBgybI7Z0Kp4xyf3jCRcoJtcrzRqyzsxjs1OPHLNla
	ZEcDMR1tLeNEHaHe/We6B3o=
X-Google-Smtp-Source: ABdhPJx49DJaEg38AHk0eGueqws5DAGI4E8uH0Ub7cLuE0zpyL0V6CuLJ9NMAZWV7HjIEwb0c2pXMw==
X-Received: by 2002:a05:6102:30b5:: with SMTP id y21mr2304040vsd.42.1593695354361;
        Thu, 02 Jul 2020 06:09:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6102:3085:: with SMTP id l5ls712321vsb.4.gmail; Thu, 02
 Jul 2020 06:09:13 -0700 (PDT)
X-Received: by 2002:a67:330e:: with SMTP id z14mr15359223vsz.94.1593695353747;
        Thu, 02 Jul 2020 06:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593695353; cv=none;
        d=google.com; s=arc-20160816;
        b=NX5RflPoCTxOL0koUnKAAgHPG7nBIna/mQUvKNq7nKdz/+XGLIHy5CSKzczk+9GlOU
         Fv2fQ6IKwjD4wfDziUNuRk8ThNzgPzXh0YWDXx81vh2uvEtyYuFjlVAL60funDAC9ThS
         8JJIPJ2zK/Zp0jajk2C2i6JsCIFXBXetm+YhFn5T73mG3VaXFji1daqz5lkZ9RPeHdD/
         K266h+BJwyXZZwqKVFeAvgjlb1zik29dxe2TwSAaZ2faT299PlYnQbfTNHxM62EOlbwa
         Z++vJZCOqM461Q7fvFnRjkvLblEqcQHNcmEoRzPs9JAxanQNrQwKD340IyvtfQgfmIYS
         RrDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Falt2Zy+fGnrv9JZug1iwGQ1uef7RBKt0K9iaDzf79E=;
        b=TcHvS+yAXaVxJNKmp6RRnw97NbLYGB3E2YR22kI63Far6tRxJEyZsAA/CmQaK8umLG
         pd4QvG9BIxiIjbv4ftJAR8fwc7vq2UEyvyi7pUMnBh+1qQNIwdlKm8jkesKFIzfbVjjH
         ih8m0PYh93W6JgWh4xr/ylU+qtIJ188RAirlFWEMlf2VpStG6NnQEOwEGOcJpguaStu/
         zFkGdxLb96+9EYFp39kgSuDWQ56D9MY32FiWDf6N11aipJxmpDPw0BJwk1TkqhWKveVc
         59vfuD2z2jhWHqQPOf2FrXkpbE9WvdZYdYZrX5MbWZIorEf6MAcbkl8s7BD9MmeWyysU
         lfAw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=unepzG4N;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id y7si273546vko.5.2020.07.02.06.09.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 06:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 062D9DP6027159;
	Thu, 2 Jul 2020 08:09:13 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 062D9DXP101704
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jul 2020 08:09:13 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 2 Jul
 2020 08:09:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 2 Jul 2020 08:09:12 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 062D9AEW033681;
	Thu, 2 Jul 2020 08:09:11 -0500
Subject: Re: jailhouse jitter?
To: Jan Kiszka <jan.kiszka@siemens.com>, Peng Fan <peng.fan@nxp.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>, Alice Guo <alice.guo@nxp.com>
References: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <38ffb4dc-20d6-3404-cc61-ea08ea8066f1@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <e0b6c5f5-89a0-6e29-6700-e5d5064d4672@ti.com>
Date: Thu, 2 Jul 2020 18:39:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <38ffb4dc-20d6-3404-cc61-ea08ea8066f1@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=unepzG4N;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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



On 02/07/20 5:14 pm, Jan Kiszka wrote:
> On 02.07.20 12:03, Peng Fan wrote:
>> Hi Jan
>>
>> https://events19.linuxfoundation.org/wp-content/uploads/2018/07/Consolidate-Real-Time-and-HMI-with-ACRN-Hypervisor.pdf 
>>
>>
>> Have you ever see this? Page 13, there is a compare between ACRN and 
>> jailhouse on X86.
>>
>> So it show ACRN a bit better? But is there any big differences in 
>> design? I doubt this.
>>
> 
> You also need to read the paper where the stats came from: They 
> implemented APIC (GIC equivalent) pass-through also in ACRN, a feature 
> that Jailhouse introduced in 2013, and then tried to compare that two 
> Jailhouse and also RT-KVM. Unfortunately, there were configuration 
> mistakes in both of those other setup. The one in Jailhouse they found 
> themselves, redid the measurements, unsurprisingly found both to be the 
> same then (no hypervisor involved anymore), but they didn't update their 
> graphs, even not in the paper. The graphs where simply copied into that 
> presentation.
> 
> I attended that session and offered the presenter afterwards to review 
> their results in the future if those are taken over a stack they are not 
> familiar with. That would have also helped to avoid the architectural 
> mistake in their RT-KVM measurement setup which gave them result of by 
> one order of magnitude.
> 
> BTW, regarding direct interrupt delivery on ARM: In 
> https://lwn.net/Articles/820830, it is reported that Bao has "found a 
> way to map interrupts directly into guests". I didn't find the time yet 
> to check if that is actually exit-free delivery, and that as a smart 
> trick or rather a problematic hack. Or if that sentence is rather a 
> misunderstanding. There is also the sentence: "Interrupts [...] have to 
> be mediated through the hypervisor, which is unfortunate since that 
> increases latency."
> 

I found this interesting and tried to read more about this.
I found some commits at [1] which does the direct injection.
Here is my rough understanding:

* He is not setting the HCR_EL.FMO bit and that way all virtual 
interrupts are turned off
* There is a new handler for handling "lower_el_aarch64_fiq"
which ends up being handled by the Hypervisor
* GICD is still being emulated so guests won't be able to route 
interrupts to wrong CPUs. Isolation is maintained
* For triggering interrupts from Hypervisor (SGIs, etc) he is using SMC 
calls and has a new service implemented in the ATF [2]
* I could not understand how the lower_el_aarch64_fiq exception is fired 
so that the Hypervisor is invoked

My guess is that most of the code change ihere s to enable interrupts in 
the Hypervisor. Resetting HCR_EL2.FMO would send the interrupts at EL1 
directly.

[1] 
https://github.com/bao-project/bao-hypervisor/commit/ac41859fc26df8cbb16b25ca949f07f00c1d35a5
[2] 
https://github.com/bao-project/bao-hypervisor/commit/0aaa1cade8b5e846503e9b515ae278cfeda30a8b

Nikhil D

> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e0b6c5f5-89a0-6e29-6700-e5d5064d4672%40ti.com.
