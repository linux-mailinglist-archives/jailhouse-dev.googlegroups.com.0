Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUFJ76DQMGQEUDL66YI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EFD3D7228
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Jul 2021 11:41:37 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id e22-20020a1969160000b029037107a2a7aesf5428294lfc.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Jul 2021 02:41:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627378897; cv=pass;
        d=google.com; s=arc-20160816;
        b=WXfONUKjiyoJ4oWS1v4rRKxiEatnZNeklXC5jpAlTKQkJX6tSoAan6c2+jRiRKg1AN
         pV+TI04fypaMEGCp7cJS/8WVdMh/EtMlNl/ANcBI36MQbZ4cukU0fCOytwPH6TJk+tqx
         893WnZTv7GSWjEQFqd4YAqsafjaA7SqJcOZJyVFERr22Uj/Q9c5MXTBMnwF4WJ/sOHAr
         1RTKqZ+DZsgwDJa+nuBdPOalWoSW6sJkCtNA4y3d50ZM08VqoGCA1EIRfmGdQRMETD75
         fXM/PuaeUcWAhmcPN8N0TjDkVHLx8dwWvspxCTFPPo2MRcIL1Nsi32+eVv6Tvdak9UF/
         FQ5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=wwqBWjfsGgT8OudSJAa5DWqAQR89pXcAmJ1LHhQI8U8=;
        b=0GO/R12ZsC0mwXvs/RVwugCXzE0OTYiybSG+23ljghk9R8axf5/hLA9mcD4kyVfRoG
         PtXlXPx/nydk7ztztEmjKxeOi1kQDu6HbjmK0phdhYvbKAtNz8/nsm36lUY3wfAMHt9h
         Wiwy3jbwcfRZ1+VAvuPDro6fKEsWlYf//0tm1wu1yu2PQjdgzk2VqXFbrivUn7eks+Zv
         30SRi141JCehPwQFn5gkV2I1TgpCSJFnQtArmG/JzyRpPmqjjetez9fjT48zZ6Ge72kO
         49RH543HzqJF3tgNeFdbGn7Ml/vQo6efspslHJ4pwiyalKHLpAkXJpFOEDbzgx6uNDGW
         OWYA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wwqBWjfsGgT8OudSJAa5DWqAQR89pXcAmJ1LHhQI8U8=;
        b=NGJCnQG6EoHqDHUQvBXh0ya9db03UrtK8y8RhS0fIyAuK7S8bOsLSraUP94KhDfj1X
         vo0LOFc2q04XBwMG8eNgZR6eA6opRmp20zPsh0owxmXA8xQuS98LrAB38x1kL/PwluMl
         /IAOnQIvsqUAWnfJM5baZdSszKbME8bR17OqjNuz/eDx/arHseT8LE98s+xB7p+YBd6N
         S9BbtBmVniZNa/DHeksfU9pNBEzxJyNfiGVQLYXCL26waluEt5U16ENAGLUcqavRjz+X
         j8ByUtl5LcbGe4TguBIyySFZQ0bICLySEeeT2kf/SH1BKHuJlnWosV8gnBOu/sJtzwSM
         8vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wwqBWjfsGgT8OudSJAa5DWqAQR89pXcAmJ1LHhQI8U8=;
        b=pYK8TKennxBJIvfRDjrOvxJzMCNGM3+EUIHLHjDIsVMqHufr7yXdZaPYyA36sl9hqZ
         pLcES7/IcOC7vs74J/DsIGaklJpqZW44cmIH6simDu6/ThAaHhD7rhq4Ohf5ZsHJvnW1
         M0l9WeDrcPlaDzo1syhABoNHSa9oC4Tt2afl1sbv7UozABRWF17X9ImQmnAnObqLaZBk
         K72XeYzg0smsWSQ0pXcCFVmv8mfHf+yaESbqXpdEiPHp/AZnOPYoD5pUmtGmiTviRVPW
         n4MBVx7Nkh1lsnZlbyeHZL56WQVp6r2lDqEzVHaJpMFFdV9HeiFp7qxw8n40vaRJ8be9
         Hl8Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ZRAre68nNjgor5GwzTM8zMJW1tfUtMu1kmMJY2j7YVyLR04hf
	t1N5qNGZilAbX+UZhXD5wng=
X-Google-Smtp-Source: ABdhPJxcIdTMtntcyk2U7Ji+3zmxonNS06AXOrbBQmuo3Hyny3xinzkaNH2QLPRseR7R1DRMP5bO+A==
X-Received: by 2002:a05:6512:3a86:: with SMTP id q6mr16078353lfu.548.1627378897037;
        Tue, 27 Jul 2021 02:41:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:b89:: with SMTP id b9ls181574lfv.1.gmail; Tue, 27
 Jul 2021 02:41:35 -0700 (PDT)
X-Received: by 2002:a05:6512:1385:: with SMTP id p5mr16568304lfa.447.1627378895593;
        Tue, 27 Jul 2021 02:41:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627378895; cv=none;
        d=google.com; s=arc-20160816;
        b=PQbwSv4LBPkGL3pHFqDCRhaiqTHNMa9WytNKENKSdmoPRnUC04pit6EK6yKkvhk08c
         wm6p4YfWsAjxGInGeFbL3ZJlbkEMDAogWRloVHk7OZ598FnzYWUqd6seW/ec+oW8mDDN
         qu4Do16VOmf2OebeBfWf4I8g5eaTA6rOQZvzEDnDlrcfmvg8P94AWbxGJ1uDNUs/aDd5
         xGNuEk1p/OoMaGsfv9xpCGzS5x6mMwzWiuO73nPczyCDMsJbYampl1Jzxw7bNf8j4dy/
         84d9YWbbRAnEnnAl+3BrCnoUBt65Q/OWPsraMYTQrAitTi6abqTfe60cjyi5GWzad0SC
         0SnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ukR6t++xk3yJf8HnoU4h6HX0Ltk+ao0c/u21RqCcgAg=;
        b=At66PMu2jXAEiN1UI0PKqB5AHSvSAJAaPyguVcQ5a7Jv0SUuCk2H7Yj5wQm8ngHd/p
         CmDJ17ePSmHkJ/SsawGLkw/ATp/yBZqMNh1hegchPEZaKtOGioj5rRwgyQ+HLOSHjjLL
         72vQstVrGnMcj7I0UxuxHgtB+wKPd2vMHX5DjevKgpbsVPnpXNMWHxxDrTY+N3vp54/m
         fyQxDG/C5xWHb5jFw1yvMAvQvbLOhMLzOpoCMhEkqXbi+DqPf4wG18wYV89OXI7M0659
         bOqKZPIRQheyX6dSTOfCfDnt2ohOhDyqHJYOKWZRGITTsEmEy9A9L6ag365xZO0ir8uF
         BaXg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id q4si117277lji.2.2021.07.27.02.41.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jul 2021 02:41:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 16R9fY7P030850
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jul 2021 11:41:34 +0200
Received: from [167.87.33.191] ([167.87.33.191])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16R9fXlk015692;
	Tue, 27 Jul 2021 11:41:34 +0200
Subject: Re: [PATCH] ARM64: Set the right set TCR.(I)PS value
To: Dongjiu Geng <gengdongjiu1@gmail.com>
Cc: jailhouse-dev@googlegroups.com
References: <20210726100546.30332-1-gengdongjiu1@gmail.com>
 <07afe6db-18e4-8dce-a4f2-434bde1afe44@siemens.com>
 <CABSBigSq2QbUbQjNyd=t=71i3cianys_EreCVBCP2dzfqqR+eA@mail.gmail.com>
 <ea765444-4e6c-66f6-15c6-1ffc9b0bd130@siemens.com>
 <CABSBigQFP1t7Vd8bubKZhLUD_Nz1uj-Hw6fzsQwpg+Xvc3e_VA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <417abc6d-42e5-61ff-1b7f-cdcf8775b609@siemens.com>
Date: Tue, 27 Jul 2021 11:41:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CABSBigQFP1t7Vd8bubKZhLUD_Nz1uj-Hw6fzsQwpg+Xvc3e_VA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 27.07.21 11:38, Dongjiu Geng wrote:
> Jan Kiszka <jan.kiszka@siemens.com> =E4=BA=8E2021=E5=B9=B47=E6=9C=8826=E6=
=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=8810:29=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On 26.07.21 14:45, Dongjiu Geng wrote:
>>> Jan Kiszka <jan.kiszka@siemens.com> =E4=BA=8E2021=E5=B9=B47=E6=9C=8826=
=E6=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=886:22=E5=86=99=E9=81=93=EF=BC=
=9A
>>>>
>>>> On 26.07.21 12:05, Dongjiu Geng wrote:
>>>>> According to spec, the {I}PS should be never larger
>>>>> than the CPU hardware implemented physical address
>>>>> size(ID_AA64MMFR0_EL1.PARange). Otherwise, it
>>>>> may lead to some unexpected issues.
>>>>>
>>>>> we can refer to DDI0487G_a_armv8_arm's description below:
>>>>> If {I}PS is programmed to a value larger than the
>>>>> implemented PA size, then the PE behaves as if programmed
>>>>> with the implemented PA size, but software must not rely
>>>>> on this behavior. That is, the output address size is never
>>>>> largerthan the implemented PA size.
>>>>>
>>>>> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
>>>>> ---
>>>>> DDI0487G_a_armv8_arm: Physical address size implementation options
>>>>> ID_AA64MMFR0_EL1.PARange Total  PA size PA address size
>>>>>         0000                     4GB    32 bits, PA[31:0]
>>>>>         0001                     64GB   36 bits, PA[35:0]
>>>>>         0010                     1TB    40 bits, PA[39:0]
>>>>>         0011                     4TB    42 bits, PA[41:0]
>>>>>         0100                     16TB   44 bits, PA[43:0]
>>>>>         0101                     256TB  48 bits, PA[47:0]
>>>>>         0110                     4PB    52 bits, PA[51:0]
>>>>> ---
>>>>>  hypervisor/arch/arm64/entry.S              | 14 +++++++++++++-
>>>>>  hypervisor/arch/arm64/include/asm/paging.h |  5 +++++
>>>>>  2 files changed, 18 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/en=
try.S
>>>>> index 3f4ee871..99738f28 100644
>>>>> --- a/hypervisor/arch/arm64/entry.S
>>>>> +++ b/hypervisor/arch/arm64/entry.S
>>>>> @@ -388,6 +388,16 @@ el1_trap:
>>>>>       isb
>>>>>  .endm
>>>>>
>>>>> +/*
>>>>> + * set TCR.(I)PS to the highest supported ID_AA64MMFR0_EL1.PARange v=
alue
>>>>> + */
>>>>> +.macro tcr_compute_pa_size, tcr
>>>>> +     mrs     x9, id_aa64mmfr0_el1
>>>>> +     // Narrow PARange to fit the PS field in TCR_ELx
>>>>> +     ubfx    x9, x9, #ID_AA64MMFR0_PARANGE_SHIFT, #3
>>>>> +     bfi     \tcr, x9, #TCR_PS_SHIFT, #3
>>>>> +.endm
>>>>> +
>>>>
>>>> Why a macro, why not inlined?
>>>
>>> Thanks very much for your point out, yes, It's best to inline rather
>>> than macro definitions
>>>
>>>>
>>>>>  /*
>>>>>   * These are the default vectors. They are used on early startup and=
 if no
>>>>>   * Spectre v2 mitigation is available.
>>>>> @@ -460,8 +470,10 @@ enable_mmu_el2:
>>>>>       ldr     x1, =3D(T0SZ(48) | (TCR_RGN_WB_WA << TCR_IRGN0_SHIFT)  =
   \
>>>>>                              | (TCR_RGN_WB_WA << TCR_ORGN0_SHIFT)    =
 \
>>>>>                              | (TCR_INNER_SHAREABLE << TCR_SH0_SHIFT)=
 \
>>>>> -                            | (PARANGE_48B << TCR_PS_SHIFT)         =
 \
>>>>>                              | TCR_EL2_RES1)
>>>>> +
>>>>> +     tcr_compute_pa_size x1
>>>>> +
>>>>
>>>> So this is aiming at devices that have less than 48 bits parange, righ=
t?
>>>> Did you stumble over such a hardware? Or is this rather about devices
>>>> having more than 48 bits? Sorry, still trying to understand the detail=
s.
>>>
>>> Yes, I have a board with ARMv8 Cortex-A53 CPU, the Cortex-A53 CPU only
>>> supports 40 bits[1],
>>> not 48 bits=E3=80=82 And even some ARMv8 CPU support  53 bits parange, =
also not 48 bits.
>>>
>>
>> But the problem is around parange < 48, right?
>>
>>>
>>> [1] https://montcs.bloomu.edu/Information/RaspberryPi-ARMv8/technical-r=
eference-manual.DDI0500J_cortex_a53_trm.pdf
>>> Table 4-56 ID_AA64MMFR0_EL1 bit assignments
>>>
>>>     [3:0] PARange Physical address range supported:
>>>     0b0010 40 bits, 1 TB.
>>>
>>
>> OK - but the raspi was apparently still working, although out of spec.
>> Or did you see something breaking? Looking for a classification of this
>> issue ("ugly, but we were lucky so far" vs. "never worked with X / when
>> doing Y").
>=20
> ugly, but we were lucky so far, it was still working, The reason is
> that the CPU will ignore this configured value if this configured
> value is larger than the  CPU supported, but software must not rely.
> We can refer to Linux kernel code that sets the  TCR.{I}PS according
> to ID_AA64MMFR0_EL1.PARange.
>=20
> I found this mismatch issue when I was debugging, and think it is
> better not using hard coded to set it, so change it.
>=20

I don't disagree. Awaiting v2 of your patch.

Thanks,
Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/417abc6d-42e5-61ff-1b7f-cdcf8775b609%40siemens.com.
