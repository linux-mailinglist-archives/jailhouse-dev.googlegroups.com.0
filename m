Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB6U4ZD2AKGQEUINPLEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x540.google.com (mail-pg1-x540.google.com [IPv6:2607:f8b0:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9791A5366
	for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Apr 2020 20:37:49 +0200 (CEST)
Received: by mail-pg1-x540.google.com with SMTP id v29sf4434872pgo.12
        for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Apr 2020 11:37:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586630267; cv=pass;
        d=google.com; s=arc-20160816;
        b=tiELEJFqJsEGqk528torpHAuX0MQFwsuRWf/j5yGkv8ohRrVXFdBTm0BSuPHHTAeL6
         lzjiFllx52lvp/gm7++4dr/B7BIeKiMf0PTbxd5TczGZu8/uwGOQnVEGTmGyqjTfDuNa
         E+T5/n7XDCXG2GCYs2YgnYJWt/czn5zp1hpiO4KwSihst1I9NA2QCm4KElVPbm9DqYLJ
         fodpVtKq7S6PQM+ERcXaXeO/m65Apvity81Pi3rCtfgWi3Rvz3c18KkJCxoKdTLH311h
         5j2YQPxZWkdJJvX05NFIr1yyZhLM7XzIUUCpPdXy2IxmHjjJLPwLbijcvKqYV5AhwW4V
         MBWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=A2VyytXuZSnJD5gPIaCZl+5nluHwakV28KTTx4Wg4WU=;
        b=z/BRnML4bXQfWoeWan9B7CBYIImelcywUfrX/Sq08oSWSIB3OTFOq+jK7Sx7BvKjQZ
         34zmK8tkxtzzQ++qLfZNGgofauTX5cYn+xjnoWIOaU0SPnA28SNeizsMtASgF4wNkgt6
         UMMnQIboxK/Kaww3PyKeFJCuepe6W9WLCQ2OzjEYhJWL/tZCQjbeRvo23eZuEKZq5rNx
         RUuQmhIzP3a0PcpYc1uwRjEjybAzNVaxguvqdga+m41MmOHrUnXGClYXHaOyaBqRE3FZ
         ZEui7cWk470mQkrsXV83luVR0JfNCQxUrFT6fpgg7zFCkxv8mr8oOXej9ZJK1UCQzPmb
         pPCQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d69SeT+U;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=A2VyytXuZSnJD5gPIaCZl+5nluHwakV28KTTx4Wg4WU=;
        b=ma4+PUcpi5z4mwEjnOqMP5eNaLtuXyFhOEyjMX8efDz5jelTVk0DeGoqnwPsSY6msU
         X6SYyyrCI21f0bY8/A9WNkjwyGgH6tpoAofJ0ZwlZ2KQk9Zfxrr2WUh44Z52xrQ6N6qY
         ninETq3cr/t9Ud4eCrBb7jg+gTOWC4AymkdY94Y6RU3wj7dvJC+nOMX9a+TAyaNDboGI
         zjSBbw97+/yNks2wXtKJVCfcJGYjNXEdJSz2EetOqgh0xehc1IKwoiEnAbSg4a1V4542
         MyymKZJBMdgEOg4Z/ViGvbnOpoMYpEy78VNkE73chV9hWS3GoawIvWG1NV6QOXEeksKF
         LMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=A2VyytXuZSnJD5gPIaCZl+5nluHwakV28KTTx4Wg4WU=;
        b=H3gw+lhCuXTEVKm76P3pJT1hc9hVK8fG+QSVE1ySEFdl4pD33v5iA7t8g8lLwL+Juj
         SHW8V4OPmK+I5qe83+Lhy1v/YcZ76rC8362L/XbWDM/Ta2xKRcyweW+rfJFaZZfKv2S1
         juuFtzoBprZALfGRH3lVHUTe7JTe/ppb7FrOTxlQglTDHypN6mURdiOltnLK2yXj4Tnp
         JgZNiHnRRi5S7SeEM+Z2Hg28nUPDGW57Z59AZGWwg5G8E1mYzOA6B+8Hq1BSLDrGJcSt
         uHPaurBl9FEWDq5MItZUQpYjVQrR+49e6WOWXvpIjCadziEtavLQkymVcB8FxKcGTmDe
         ljmA==
X-Gm-Message-State: AGi0PuajZNI+623VUmTTPezQ8BlpdrtXnf8tlBc33ARN4ddN1Gkyb5pc
	GLeDojqRNO/WO+vpFT4W1eQ=
X-Google-Smtp-Source: APiQypIJ5x2eCOYh2Dgb0/aWjgS+RSWZiVY/wB1oxN0iR2fyQ7Rez1Y39OEnqSENQ6eKpG0TE6TkqQ==
X-Received: by 2002:a63:2cce:: with SMTP id s197mr10358004pgs.184.1586630267159;
        Sat, 11 Apr 2020 11:37:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:fe93:: with SMTP id x19ls7652056plm.1.gmail; Sat, 11
 Apr 2020 11:37:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1985:: with SMTP id mv5mr12537939pjb.69.1586630266460;
        Sat, 11 Apr 2020 11:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586630266; cv=none;
        d=google.com; s=arc-20160816;
        b=yJ3IUcSHLlG0UL35yB6VWGSOzqDajQRHRvMtwRKR1f/tS/KkWf76T053D2ttMUV8bP
         TdbWaM4Ejg+obTG+/1ABz7nkegTaR+kib3S2b5HMMZRd0CU+gob0Bj0YPE8KzBQhbZNB
         SdCKgjwzpdwO4wBqbzfPuzD3wArPAlRUhKmWuu8esupUmsaWmwvWyOUX2eS8s5hf0LCP
         T2k8wzCRI/jraMyLdnRWxmqjdTkPdKr19EYQzZM5b5TeMWPvtQxc/UDmUrD37fuxxlH+
         ggl/Lonv22b23GUZEYNIt+ce4Qgx2TEeOigmEawrgBlMRu2IT93H/qm6x38vs9oWlJTY
         EqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jPlP1LQGgmknOVv9C3J07M0mcrDiTbRSUQwzmYzsYpI=;
        b=l0PC0vyxPKXZj9emTVwgoFFOIRt30AF7p5NJaASOC2ZJwoTQPx5LUI5J5ZYAw051H0
         bwjySCiM//GmbrZNT0z2MyQIOUVWZoTo86VJUo8lVf6Z7YPkq+fli/W2HS/V4+meaJ1h
         7TXV1NMvH5ka+PqF4Gak2SwpVpySC/mcaKRrpq2b/nE93LTtLNQizkOE4/2+lJvzGJf3
         VIJC8sxRaI5imHfLIT8INxC0rOZLWJ/TwmECVDzG8yTJR0Tv0BZgrqVwc01GClvA8mms
         Lv2DiNycxagIBCWeTOkhZcyaISiYYge7T9UcI+99PzHSp+cbbrb103vWNdc3kAbrn4E/
         KZ6A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d69SeT+U;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id 63si235889plf.2.2020.04.11.11.37.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 Apr 2020 11:37:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03BIbjb3107048;
	Sat, 11 Apr 2020 13:37:45 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03BIbjeQ074364
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 11 Apr 2020 13:37:45 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sat, 11
 Apr 2020 13:37:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sat, 11 Apr 2020 13:37:45 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03BIbgdN015265;
	Sat, 11 Apr 2020 13:37:43 -0500
Subject: Re: [PATCH] arm64: ti-pvu: Panic on errors during config_commit
To: Jan Kiszka <jan.kiszka@web.de>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <f87739b0-2990-1229-4cfc-105c36f4efa5@web.de>
 <9528c94f-c351-7ac4-889c-6d422be130ca@ti.com>
 <5badd0af-e586-fa58-f3f4-9aed052fd04d@web.de>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <a826d22a-1c54-3962-b42a-085a8df872ea@ti.com>
Date: Sun, 12 Apr 2020 00:07:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5badd0af-e586-fa58-f3f4-9aed052fd04d@web.de>
Content-Type: multipart/alternative;
	boundary="------------9D6B6E53988A3EF7E467134D"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=d69SeT+U;       spf=pass
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

--------------9D6B6E53988A3EF7E467134D
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On 11/04/20 11:28 pm, Jan Kiszka wrote:
> On 11.04.20 19:25, 'Nikhil Devshatwar' via Jailhouse wrote:
>> Hi Jan,
>>
>> On 11/04/20 4:31 pm, Jan Kiszka wrote:
>>> From: Jan Kiszka<jan.kiszka@siemens.com>
>>>
>>> So far, any error returned by a function called by
>>> pvu_iommu_config_commit was ignored, only reported to the console. That
>>> would have resulted in an inconsistent configuration being run. Also,
>>> pvu_tlb_alloc and pvu_tlb_chain didn't even report an errors at all,=20
>>> and
>>> the former also returned an incorrect code then.
>> This is because I have implemented all the functions with return codes.
>> I have implemented the pvu_iommu_config_commit with int return type.
>>
>> =C2=A0From the design perspective, the pvu_xxx APIs are written from any=
=20
>> place.
>
> Nope, they aren't, I checked that.
>
>> It's the config_commit call which is nont returnable, So that function
>> should panic.
>>
>> So, the only place for panic should be either in the=20
>> pvu_iommu_config_commit
>> Or, in the iommu_config_commit
>>
>> Regards,
>> Nikhil D
>>> We rather need to panic-stop the system in case some configuration bit
>>> cannot be programmed because there is no way to roll back from a
>>> config_commit by design.
>>>
>>> Signed-off-by: Jan Kiszka<jan.kiszka@siemens.com>
>>> ---
>>>
>>> I wonder if there isn't a way - provided it's not too complex - to=20
>>> build
>>> up the programming during cell_init/exit, validate it at that chance,
>>> cache it, and only apply that state on config_commit. Would mean less
>>> panic.
>> I gave some thought to create the data structures before config_commit.
>> But as of now, there is no way that exist.
>> Following is the sequence of calls
>>
>> pvu_iommu_map_memory
>> pvu_iommu_map_memory
>> ..
>> pvu_iommu_map_memory
>> pvu_iommu_config_commit
>>
>> There is nothing that gets called from framework, and there is no way to
>> figure out if the pvu_iommu_map_memory is the last call
>
> OK, so none of the error conditions can be predicted from the given
> config and current configuration due to the unknown upcoming mappings? I
> don't thinks so. E.g. the alignment checks in pvu_entry_write(). The
> entries checked here come from a a cache, and that is built in
> pvu_iommu_map_memory where we are able to return a proper error.
>
All the alignment check errors are defensive programming only.
So it can be guaranteed that these functions will succeed when called=20
from the
config_commit, except the alloc_tlb failure.

I can maintain a free_entries count per device and check if the entry count
exceeds that. Assuming that the last memory_map and config_commit for a=20
cell happen
in order before any other cell's map_memory is called.

This way, we can track the errors and fail the cell creation.
I would still recommend a return value check and panic to track bugs in=20
the entry creation logic.

Regards,
Nikhil D

>>
>>> I also wonder when that error pvu_tlb_chain can actually happen, or if
>>> the check was just defensive programming. Maybe you also have a better
>>> error text for it.
>> Yes, its defensive programming, done as part of making the pvu_xx APIs
>> primitive calls.
>
> If there is no way to trigger the case via broken configuration, we can
> drop that test and the related panic. And checking the code again, I'm
> inclinded to believe this.
>
>>> hypervisor/arch/arm64/include/asm/ti-pvu.h |=C2=A0 2 +-
>>> =C2=A0 hypervisor/arch/arm64/ti-pvu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 65=20
>>> +++++++++++++-----------------
>>> =C2=A0 2 files changed, 30 insertions(+), 37 deletions(-)
>>>
>>> diff --git a/hypervisor/arch/arm64/include/asm/ti-pvu.h=20
>>> b/hypervisor/arch/arm64/include/asm/ti-pvu.h
>>> index 2c340b3a..466b5b3f 100644
>>> --- a/hypervisor/arch/arm64/include/asm/ti-pvu.h
>>> +++ b/hypervisor/arch/arm64/include/asm/ti-pvu.h
>>> @@ -125,6 +125,6 @@ int pvu_iommu_map_memory(struct cell *cell,
>>> =C2=A0 int pvu_iommu_unmap_memory(struct cell *cell,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct jai=
lhouse_memory *mem);
>>>
>>> -int pvu_iommu_config_commit(struct cell *cell);
>>> +void pvu_iommu_config_commit(struct cell *cell_added_removed);
>>>
>>> =C2=A0 #endif /* _IOMMMU_PVU_H_ */
>>> diff --git a/hypervisor/arch/arm64/ti-pvu.c=20
>>> b/hypervisor/arch/arm64/ti-pvu.c
>>> index b06ba843..91d39848 100644
>>> --- a/hypervisor/arch/arm64/ti-pvu.c
>>> +++ b/hypervisor/arch/arm64/ti-pvu.c
>>> @@ -15,7 +15,7 @@
>>> =C2=A0=C2=A0 * There are limitations on the number of available context=
s, page=20
>>> sizes,
>>> =C2=A0=C2=A0 * number of pages that can be mapped, etc.
>>> =C2=A0=C2=A0 *
>>> - * PVU is desgined to be programmed with all the memory mapping at=20
>>> once.
>>> + * PVU is designed to be programmed with all the memory mapping at=20
>>> once.
>>> =C2=A0=C2=A0 * Therefore, it defers the actual register programming til=
l=20
>>> config_commit.
>>> =C2=A0=C2=A0 * Also, it does not support unmapping of the pages at runt=
ime.
>>> =C2=A0=C2=A0 *
>>> @@ -83,16 +83,18 @@ static u32 pvu_tlb_is_enabled(struct pvu_dev=20
>>> *dev, u16 tlbnum)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>>
>>> -static int pvu_tlb_chain(struct pvu_dev *dev, u16 tlbnum, u16=20
>>> tlb_next)
>>> +static void pvu_tlb_chain(struct pvu_dev *dev, u16 tlbnum, u16=20
>>> tlb_next)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb *tlb;
>>>
>>> -=C2=A0=C2=A0=C2=A0 if (tlb_next <=3D tlbnum || tlb_next <=3D dev->max_=
virtid)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>> +=C2=A0=C2=A0=C2=A0 if (tlb_next <=3D tlbnum || tlb_next <=3D dev->max_=
virtid) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic_printk("ERROR: PVU: I=
nvalid TLB index %d for=20
>>> chaining\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 tlb_next);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic_stop();
>>> +=C2=A0=C2=A0=C2=A0 }
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tlb =3D (struct pvu_hw_tlb *)dev->tlb_ba=
se + tlbnum;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write32_field(&tlb->chain, PVU_TLB_=
CHAIN_MASK, tlb_next);
>>> -=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>>
>>> =C2=A0 static u32 pvu_tlb_next(struct pvu_dev *dev, u16 tlbnum)
>>> @@ -113,7 +115,8 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev,=20
>>> u16 virtid)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return i;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> -=C2=A0=C2=A0=C2=A0 return 0;
>>> +=C2=A0=C2=A0=C2=A0 panic_printk("ERROR: PVU: Not enough TLB entries\n"=
);
>>> +=C2=A0=C2=A0=C2=A0 panic_stop();
>>> =C2=A0 }
>>>
>>> =C2=A0 static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
>>> @@ -159,8 +162,8 @@ static void pvu_entry_enable(struct pvu_dev=20
>>> *dev, u16 tlbnum, u8 index)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->tlb_data[tlbnum] |=3D (1 << index);
>>> =C2=A0 }
>>>
>>> -static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct pvu_tlb_entry *ent)
>>> +static void pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct pvu_tlb_entry *ent)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb_entry *entry;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb *tlb;
>>> @@ -175,16 +178,16 @@ static int pvu_entry_write(struct pvu_dev=20
>>> *dev, u16 tlbnum, u8 index,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pgsz >=3D ARRAY_SIZE(pvu_page_size_b=
ytes)) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("ERROR: PVU: %s: Uns=
upported page size %llx\n",
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __f=
unc__, ent->size);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic_printk("ERROR: PVU: U=
nsupported page size %llx\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ent->size);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic_stop();
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!is_aligned(ent->virt_addr, ent->siz=
e) ||
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !is_aligned(ent-=
>phys_addr, ent->size)) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("ERROR: PVU: %s: Add=
ress %llx =3D> %llx is not aligned=20
>>> with size %llx\n",
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __f=
unc__, ent->virt_addr, ent->phys_addr, ent->size);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic_printk("ERROR: PVU: A=
ddress %llx =3D> %llx is not=20
>>> aligned with size %llx\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ent->virt_addr, ent->phys_addr, ent->size);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic_stop();
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write32(&entry->reg0, ent->virt_add=
r & 0xffffffff);
>>> @@ -200,7 +203,6 @@ static int pvu_entry_write(struct pvu_dev *dev,=20
>>> u16 tlbnum, u8 index,
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Do we need "DSB NSH" here to make sur=
e all writes are=20
>>> finised? */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pvu_entry_enable(dev, tlbnum, index);
>>> -=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>>
>>> =C2=A0 static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
>>> @@ -328,17 +330,17 @@ static void pvu_entrylist_sort(struct=20
>>> pvu_tlb_entry *entlist, u32 num_entries)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 }
>>>
>>> -static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
>>> +static void pvu_iommu_program_entries(struct cell *cell, u8 virtid)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int inst, i, tlbnum, idx, ent_c=
ount;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pvu_tlb_entry *ent, *cell_entries=
;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pvu_dev *dev;
>>> -=C2=A0=C2=A0=C2=A0 int ret, tlb_next;
>>> +=C2=A0=C2=A0=C2=A0 int tlb_next;
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cell_entries =3D cell->arch.iommu_pvu.en=
tries;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ent_count =3D cell->arch.iommu_pvu.ent_c=
ount;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ent_count =3D=3D 0 || cell_entries =
=3D=3D NULL)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Program same memory mapping for all o=
f the instances */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (inst =3D 0; inst < pvu_count; inst+=
+) {
>>> @@ -356,20 +358,15 @@ static int pvu_iommu_program_entries(struct=20
>>> cell *cell, u8 virtid)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (idx =3D=3D 0 && i >=3D dev->num_entries) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Find next available TLB and chain to i=
t */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tlb_next =3D pvu_tlb_alloc(dev, virtid);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (tlb_next < 0)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pvu_tlb_chain(dev, tlbnum, tlb_next);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pvu_tlb_enable(dev, tlbnum);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tlbnum =3D tlb_next;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 }
>>>
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D pvu_entry_write(dev, tlbnum, idx, ent);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(ret)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pvu=
_entry_write(dev, tlbnum, idx, ent);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pvu_tlb_enable(d=
ev, tlbnum);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> -=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>>
>>> =C2=A0 /*
>>> @@ -434,13 +431,12 @@ int pvu_iommu_unmap_memory(struct cell *cell,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>>
>>> -int pvu_iommu_config_commit(struct cell *cell)
>>> +void pvu_iommu_config_commit(struct cell *cell_added_removed)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i, virtid;
>>> -=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>>>
>>> -=C2=A0=C2=A0=C2=A0 if (pvu_count =3D=3D 0 || !cell)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +=C2=A0=C2=A0=C2=A0 if (pvu_count =3D=3D 0 || !cell_added_removed)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Chaining the TLB entries adds ex=
tra latency to translate those
>>> @@ -448,20 +444,17 @@ int pvu_iommu_config_commit(struct cell *cell)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Sort the entries in descending o=
rder of page sizes to=20
>>> reduce effects
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * of chaining and thus reducing av=
erage translation latency
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0 pvu_entrylist_sort(cell->arch.iommu_pvu.entries,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 cell->arch.iommu_pvu.ent_count);
>>> + pvu_entrylist_sort(cell_added_removed->arch.iommu_pvu.entries,
>>> + cell_added_removed->arch.iommu_pvu.ent_count);
>>>
>>> -=C2=A0=C2=A0=C2=A0 for_each_stream_id(virtid, cell->config, i) {
>>> +=C2=A0=C2=A0=C2=A0 for_each_stream_id(virtid, cell_added_removed->conf=
ig, i) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (virtid > MAX=
_VIRTID)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 continue;
>>>
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D pvu_iommu_program_e=
ntries(cell, virtid);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pvu_iommu_program_entries(c=
ell_added_removed, virtid);
>> panic here instead of other places
>
> Given that all those functions are only invoked from here and that the
> error codes can't be propagated beyond here, there is no point in
> pushing things down.
>
> Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a826d22a-1c54-3962-b42a-085a8df872ea%40ti.com.

--------------9D6B6E53988A3EF7E467134D
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    Hi Jan,<br>
    <br>
    <div class=3D"moz-cite-prefix">On 11/04/20 11:28 pm, Jan Kiszka wrote:<=
br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:5badd0af-e586-fa58-f3f4-9aed052fd04d@web.de">On 11.04.20
      19:25, 'Nikhil Devshatwar' via Jailhouse wrote:
      <br>
      <blockquote type=3D"cite">Hi Jan,
        <br>
        <br>
        On 11/04/20 4:31 pm, Jan Kiszka wrote:
        <br>
        <blockquote type=3D"cite">From: Jan
          Kiszka<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jan.kiszk=
a@siemens.com">&lt;jan.kiszka@siemens.com&gt;</a>
          <br>
          <br>
          So far, any error returned by a function called by
          <br>
          pvu_iommu_config_commit was ignored, only reported to the
          console. That
          <br>
          would have resulted in an inconsistent configuration being
          run. Also,
          <br>
          pvu_tlb_alloc and pvu_tlb_chain didn't even report an errors
          at all, and
          <br>
          the former also returned an incorrect code then.
          <br>
        </blockquote>
        This is because I have implemented all the functions with return
        codes.
        <br>
        I have implemented the pvu_iommu_config_commit with int return
        type.
        <br>
        <br>
        =C2=A0From the design perspective, the pvu_xxx APIs are written fro=
m
        any place.
        <br>
      </blockquote>
      <br>
      Nope, they aren't, I checked that.
      <br>
      <br>
      <blockquote type=3D"cite">It's the config_commit call which is nont
        returnable, So that function
        <br>
        should panic.
        <br>
        <br>
        So, the only place for panic should be either in the
        pvu_iommu_config_commit
        <br>
        Or, in the iommu_config_commit
        <br>
        <br>
        Regards,
        <br>
        Nikhil D
        <br>
        <blockquote type=3D"cite">We rather need to panic-stop the system
          in case some configuration bit
          <br>
          cannot be programmed because there is no way to roll back from
          a
          <br>
          config_commit by design.
          <br>
          <br>
          Signed-off-by: Jan Kiszka<a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:jan.kiszka@siemens.com">&lt;jan.kiszka@siemens.com&gt;</a>
          <br>
          ---
          <br>
          <br>
          I wonder if there isn't a way - provided it's not too complex
          - to build
          <br>
          up the programming during cell_init/exit, validate it at that
          chance,
          <br>
          cache it, and only apply that state on config_commit. Would
          mean less
          <br>
          panic.
          <br>
        </blockquote>
        I gave some thought to create the data structures before
        config_commit.
        <br>
        But as of now, there is no way that exist.
        <br>
        Following is the sequence of calls
        <br>
        <br>
        pvu_iommu_map_memory
        <br>
        pvu_iommu_map_memory
        <br>
        ..
        <br>
        pvu_iommu_map_memory
        <br>
        pvu_iommu_config_commit
        <br>
        <br>
        There is nothing that gets called from framework, and there is
        no way to
        <br>
        figure out if the pvu_iommu_map_memory is the last call
        <br>
      </blockquote>
      <br>
      OK, so none of the error conditions can be predicted from the
      given
      <br>
      config and current configuration due to the unknown upcoming
      mappings? I
      <br>
      don't thinks so. E.g. the alignment checks in pvu_entry_write().
      The
      <br>
      entries checked here come from a a cache, and that is built in
      <br>
      pvu_iommu_map_memory where we are able to return a proper error.
      <br>
      <br>
    </blockquote>
    All the alignment check errors are defensive programming only.<br>
    So it can be guaranteed that these functions will succeed when
    called from the <br>
    config_commit, except the alloc_tlb failure.<br>
    <br>
    I can maintain a free_entries count per device and check if the
    entry count<br>
    exceeds that. Assuming that the last memory_map and config_commit
    for a cell happen<br>
    in order before any other cell's map_memory is called.<br>
    <br>
    This way, we can track the errors and fail the cell creation.<br>
    I would still recommend a return value check and panic to track bugs
    in the entry creation logic.<br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:5badd0af-e586-fa58-f3f4-9aed052fd04d@web.de">
      <blockquote type=3D"cite">
        <br>
        <blockquote type=3D"cite">I also wonder when that error
          pvu_tlb_chain can actually happen, or if
          <br>
          the check was just defensive programming. Maybe you also have
          a better
          <br>
          error text for it.
          <br>
        </blockquote>
        Yes, its defensive programming, done as part of making the
        pvu_xx APIs
        <br>
        primitive calls.
        <br>
      </blockquote>
      <br>
      If there is no way to trigger the case via broken configuration,
      we can
      <br>
      drop that test and the related panic. And checking the code again,
      I'm
      <br>
      inclinded to believe this.
      <br>
      <br>
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">=C2=A0
          hypervisor/arch/arm64/include/asm/ti-pvu.h |=C2=A0 2 +-
          <br>
          =C2=A0 hypervisor/arch/arm64/ti-pvu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 65
          +++++++++++++-----------------
          <br>
          =C2=A0 2 files changed, 30 insertions(+), 37 deletions(-)
          <br>
          <br>
          diff --git a/hypervisor/arch/arm64/include/asm/ti-pvu.h
          b/hypervisor/arch/arm64/include/asm/ti-pvu.h
          <br>
          index 2c340b3a..466b5b3f 100644
          <br>
          --- a/hypervisor/arch/arm64/include/asm/ti-pvu.h
          <br>
          +++ b/hypervisor/arch/arm64/include/asm/ti-pvu.h
          <br>
          @@ -125,6 +125,6 @@ int pvu_iommu_map_memory(struct cell
          *cell,
          <br>
          =C2=A0 int pvu_iommu_unmap_memory(struct cell *cell,
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const stru=
ct jailhouse_memory *mem);
          <br>
          <br>
          -int pvu_iommu_config_commit(struct cell *cell);
          <br>
          +void pvu_iommu_config_commit(struct cell
          *cell_added_removed);
          <br>
          <br>
          =C2=A0 #endif /* _IOMMMU_PVU_H_ */
          <br>
          diff --git a/hypervisor/arch/arm64/ti-pvu.c
          b/hypervisor/arch/arm64/ti-pvu.c
          <br>
          index b06ba843..91d39848 100644
          <br>
          --- a/hypervisor/arch/arm64/ti-pvu.c
          <br>
          +++ b/hypervisor/arch/arm64/ti-pvu.c
          <br>
          @@ -15,7 +15,7 @@
          <br>
          =C2=A0=C2=A0 * There are limitations on the number of available
          contexts, page sizes,
          <br>
          =C2=A0=C2=A0 * number of pages that can be mapped, etc.
          <br>
          =C2=A0=C2=A0 *
          <br>
          - * PVU is desgined to be programmed with all the memory
          mapping at once.
          <br>
          + * PVU is designed to be programmed with all the memory
          mapping at once.
          <br>
          =C2=A0=C2=A0 * Therefore, it defers the actual register programmi=
ng till
          config_commit.
          <br>
          =C2=A0=C2=A0 * Also, it does not support unmapping of the pages a=
t
          runtime.
          <br>
          =C2=A0=C2=A0 *
          <br>
          @@ -83,16 +83,18 @@ static u32 pvu_tlb_is_enabled(struct
          pvu_dev *dev, u16 tlbnum)
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
          <br>
          =C2=A0 }
          <br>
          <br>
          -static int pvu_tlb_chain(struct pvu_dev *dev, u16 tlbnum, u16
          tlb_next)
          <br>
          +static void pvu_tlb_chain(struct pvu_dev *dev, u16 tlbnum,
          u16 tlb_next)
          <br>
          =C2=A0 {
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb *tlb;
          <br>
          <br>
          -=C2=A0=C2=A0=C2=A0 if (tlb_next &lt;=3D tlbnum || tlb_next &lt;=
=3D
          dev-&gt;max_virtid)
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
          <br>
          +=C2=A0=C2=A0=C2=A0 if (tlb_next &lt;=3D tlbnum || tlb_next &lt;=
=3D
          dev-&gt;max_virtid) {
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic_printk("ERROR: =
PVU: Invalid TLB index %d for
          chaining\n",
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tlb_next);
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic_stop();
          <br>
          +=C2=A0=C2=A0=C2=A0 }
          <br>
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tlb =3D (struct pvu_hw_tlb *)dev-&=
gt;tlb_base + tlbnum;
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write32_field(&amp;tlb-&gt;ch=
ain,
          PVU_TLB_CHAIN_MASK, tlb_next);
          <br>
          -=C2=A0=C2=A0=C2=A0 return 0;
          <br>
          =C2=A0 }
          <br>
          <br>
          =C2=A0 static u32 pvu_tlb_next(struct pvu_dev *dev, u16 tlbnum)
          <br>
          @@ -113,7 +115,8 @@ static u32 pvu_tlb_alloc(struct pvu_dev
          *dev, u16 virtid)
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return i;
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
          <br>
          -=C2=A0=C2=A0=C2=A0 return 0;
          <br>
          +=C2=A0=C2=A0=C2=A0 panic_printk("ERROR: PVU: Not enough TLB entr=
ies\n");
          <br>
          +=C2=A0=C2=A0=C2=A0 panic_stop();
          <br>
          =C2=A0 }
          <br>
          <br>
          =C2=A0 static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
          <br>
          @@ -159,8 +162,8 @@ static void pvu_entry_enable(struct
          pvu_dev *dev, u16 tlbnum, u8 index)
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev-&gt;tlb_data[tlbnum] |=3D (1 &=
lt;&lt; index);
          <br>
          =C2=A0 }
          <br>
          <br>
          -static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum,
          u8 index,
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct pvu_tlb_entry *ent)
          <br>
          +static void pvu_entry_write(struct pvu_dev *dev, u16 tlbnum,
          u8 index,
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pvu_tlb_entry *ent)
          <br>
          =C2=A0 {
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb_entry *entry;
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb *tlb;
          <br>
          @@ -175,16 +178,16 @@ static int pvu_entry_write(struct
          pvu_dev *dev, u16 tlbnum, u8 index,
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
          <br>
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pgsz &gt;=3D ARRAY_SIZE(pvu_pa=
ge_size_bytes)) {
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("ERROR: PVU: %=
s: Unsupported page size
          %llx\n",
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 __func__, ent-&gt;size);
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic_printk("ERROR: =
PVU: Unsupported page size
          %llx\n",
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ent-&gt;size);
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic_stop();
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
          <br>
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!is_aligned(ent-&gt;virt_addr,=
 ent-&gt;size) ||
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !is_aligne=
d(ent-&gt;phys_addr, ent-&gt;size)) {
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("ERROR: PVU: %=
s: Address %llx =3D&gt; %llx is
          not aligned with size %llx\n",
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 __func__, ent-&gt;virt_addr, ent-&gt;phys_addr,
          ent-&gt;size);
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic_printk("ERROR: =
PVU: Address %llx =3D&gt; %llx is
          not aligned with size %llx\n",
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ent-&gt;virt_addr, ent-&gt;phys_addr,
          ent-&gt;size);
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic_stop();
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
          <br>
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write32(&amp;entry-&gt;reg0, =
ent-&gt;virt_addr
          &amp; 0xffffffff);
          <br>
          @@ -200,7 +203,6 @@ static int pvu_entry_write(struct pvu_dev
          *dev, u16 tlbnum, u8 index,
          <br>
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Do we need "DSB NSH" here to ma=
ke sure all writes are
          finised? */
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pvu_entry_enable(dev, tlbnum, inde=
x);
          <br>
          -=C2=A0=C2=A0=C2=A0 return 0;
          <br>
          =C2=A0 }
          <br>
          <br>
          =C2=A0 static u32 pvu_init_device(struct pvu_dev *dev, u16
          max_virtid)
          <br>
          @@ -328,17 +330,17 @@ static void pvu_entrylist_sort(struct
          pvu_tlb_entry *entlist, u32 num_entries)
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
          <br>
          =C2=A0 }
          <br>
          <br>
          -static int pvu_iommu_program_entries(struct cell *cell, u8
          virtid)
          <br>
          +static void pvu_iommu_program_entries(struct cell *cell, u8
          virtid)
          <br>
          =C2=A0 {
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int inst, i, tlbnum, idx,=
 ent_count;
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pvu_tlb_entry *ent, *cell_e=
ntries;
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pvu_dev *dev;
          <br>
          -=C2=A0=C2=A0=C2=A0 int ret, tlb_next;
          <br>
          +=C2=A0=C2=A0=C2=A0 int tlb_next;
          <br>
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cell_entries =3D cell-&gt;arch.iom=
mu_pvu.entries;
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ent_count =3D cell-&gt;arch.iommu_=
pvu.ent_count;
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ent_count =3D=3D 0 || cell_ent=
ries =3D=3D NULL)
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
          <br>
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Program same memory mapping for=
 all of the instances
          */
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (inst =3D 0; inst &lt; pvu_cou=
nt; inst++) {
          <br>
          @@ -356,20 +358,15 @@ static int
          pvu_iommu_program_entries(struct cell *cell, u8 virtid)
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (idx =3D=3D 0 &amp;&amp; i &gt;=3D
          dev-&gt;num_entries) {
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Find next available TLB and chai=
n to it
          */
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tlb_next =3D pvu_tlb_alloc(dev, vir=
tid);
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tlb_next &lt; 0)
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pvu_tlb_chain(dev, tlbnum, tlb_next=
);
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pvu_tlb_enable(dev, tlbnum);
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tlbnum =3D tlb_next;
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }
          <br>
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ret =3D pvu_entry_write(dev, tlbnum, idx, ent);
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (ret)
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pvu_entry_write(dev, tlbnum, idx, ent);
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pvu_tlb_en=
able(dev, tlbnum);
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
          <br>
          -=C2=A0=C2=A0=C2=A0 return 0;
          <br>
          =C2=A0 }
          <br>
          <br>
          =C2=A0 /*
          <br>
          @@ -434,13 +431,12 @@ int pvu_iommu_unmap_memory(struct cell
          *cell,
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
          <br>
          =C2=A0 }
          <br>
          <br>
          -int pvu_iommu_config_commit(struct cell *cell)
          <br>
          +void pvu_iommu_config_commit(struct cell *cell_added_removed)
          <br>
          =C2=A0 {
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i, virtid;
          <br>
          -=C2=A0=C2=A0=C2=A0 int ret =3D 0;
          <br>
          <br>
          -=C2=A0=C2=A0=C2=A0 if (pvu_count =3D=3D 0 || !cell)
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
          <br>
          +=C2=A0=C2=A0=C2=A0 if (pvu_count =3D=3D 0 || !cell_added_removed=
)
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
          <br>
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Chaining the TLB entries a=
dds extra latency to
          translate those
          <br>
          @@ -448,20 +444,17 @@ int pvu_iommu_config_commit(struct cell
          *cell)
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Sort the entries in descen=
ding order of page sizes to
          reduce effects
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * of chaining and thus reduc=
ing average translation
          latency
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
          <br>
          -=C2=A0=C2=A0=C2=A0 pvu_entrylist_sort(cell-&gt;arch.iommu_pvu.en=
tries,
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 cell-&gt;arch.iommu_pvu.ent_count);
          <br>
          +=C2=A0=C2=A0=C2=A0
          pvu_entrylist_sort(cell_added_removed-&gt;arch.iommu_pvu.entries,
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
          cell_added_removed-&gt;arch.iommu_pvu.ent_count);
          <br>
          <br>
          -=C2=A0=C2=A0=C2=A0 for_each_stream_id(virtid, cell-&gt;config, i=
) {
          <br>
          +=C2=A0=C2=A0=C2=A0 for_each_stream_id(virtid, cell_added_removed=
-&gt;config,
          i) {
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (virtid=
 &gt; MAX_VIRTID)
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 continue;
          <br>
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D pvu_iommu_pro=
gram_entries(cell, virtid);
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return ret;
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pvu_iommu_program_ent=
ries(cell_added_removed,
          virtid);
          <br>
        </blockquote>
        panic here instead of other places
        <br>
      </blockquote>
      <br>
      Given that all those functions are only invoked from here and that
      the
      <br>
      error codes can't be propagated beyond here, there is no point in
      <br>
      pushing things down.
      <br>
      <br>
      Jan
      <br>
    </blockquote>
    <br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a826d22a-1c54-3962-b42a-085a8df872ea%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/a826d22a-1c54-3962-b42a-085a8df872ea%40ti.com</a>.<br />

--------------9D6B6E53988A3EF7E467134D--
