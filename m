Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBVEI6LUAKGQELQLQ2CQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id 661835E215
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 12:32:53 +0200 (CEST)
Received: by mail-qt1-x837.google.com with SMTP id p43sf1744208qtk.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 03:32:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562149972; cv=pass;
        d=google.com; s=arc-20160816;
        b=cigc8unlXutSFQnoZItiqa3LMBBWAOtNZCjW75Gp9fbldALutWu1bTeMNkb+mjaUV2
         0HKQwZw7nxg7bc9JCWcPDavkXFnqpSJDKc529MBHFr6jDuB3ORi5WGXDY7rQCdyjHYEo
         WXPPGFukzuqQUxCe5fq1nr7K6b6bR7YY8G0I/iHqFDEDqkLppnSgMdRaoYlv0cqql2eF
         9pf7SivuhGnPONiddzdkxenbgQUohDcXertdWajs38PpjHlTSaRRIrq+GBmGExsgihtY
         J+HOrT0zCP/oBHoYKfkBx0LuSM/7hUQJyROko069NXzBSmPHvPo9dOGu4HMw+6RJTX2J
         +Khg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=pvV3qMZUfOb9+ClguoKoEXuyLubKC7AEwLNhQsWIgJM=;
        b=ZFtJo9+4S6HeAIeW9sqpxNjylCx6EtUOsxaRs2HgDj056ty/6YdKjMxRUnbANnBS3h
         g/ia3Vb4+7dNLEj/y1nL2I3eZEWkDqKlASs92Z9PFfBqWwJSjqBi5Wj3C9k07B9W5yNz
         rmyTZgmtM/MYZY8pFfqBTb0fdnm281SIFPdrB95QS4F+q+a8UYQd/o/+5W/XvS0UHgpg
         WS8J2IibvkA5IYfuvVT//c3kLtW01WVhFx7eTus6jVfC6VIpPY0+0nS0MtccDNKDxIcV
         JHknsbX9Wo6fG9B/BmTTft7/Qcpnr7Wlz+JtSKNMOiRl3NR3JVk8WqnSNUoEu/k1B5ik
         uhNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=c7e4gIVp;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pvV3qMZUfOb9+ClguoKoEXuyLubKC7AEwLNhQsWIgJM=;
        b=kVg4YtJxcNNYCxfYAew/HdsZt4M941ciV8GbUU0H7ez9SiV7ACkEixQ0/RmTX+MCGH
         lltCXtjfUFuDMacQXKh9Yd5gyYHpUato6PDvrcx34pUeUNX6kKPD8mYDdTuTruYWKoOh
         fiG6Mebqz9M3FegJjduAo4QV7P/1BrJr0SqQl9fc5JVKoqb0m+J2O1NTPDB8dmQC12P0
         LwN6X5C9hRtr2N6krAKPS000Um1x/cPy8xjCJADrzb2C67GB+37zhYZoDrDFpDQK0zQ4
         oD7n2RHm015JL0wPqcWT2b+B9jHpnPKDBhS56PFZcI4S7pCPoVpKQQIz5a4U9MQiJ0Mo
         /uBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pvV3qMZUfOb9+ClguoKoEXuyLubKC7AEwLNhQsWIgJM=;
        b=dcAepngf0phh3vSjZ/suqosBUTkiNmxczUdSsFnulM3MTMLHtZhC7zAui81iccnMkI
         85uD+3z37bDYsNsTlqTq6MsEPShMFiVFv6KLVkI+87t7XozszqhD6y69xJmnWQhqBMZ/
         JualVcap0n3o7Mdayrcj0CI0FaxagGGALwUwDRDF9T2V7vkja7Qyg9KfH16wqIlxGWYj
         5TjMlvT+ZOuesSv7EAh5hrqb5a0Hf1YEYx3G3ONBj+AguqrQlZezYiXV06x0/d0jUP/Y
         QeyCFKNdlUz8PfPPtebmi609xR68+bb4NZgW6po+wf359FKvOuqsSDiDPnLSh5p9dzck
         c4QA==
X-Gm-Message-State: APjAAAWlRKMIo8f3m1ZMGsGDNYhPmBr+Zze+pb3PPOnNVPDcNjnfE1tL
	N2eyzmYG00APITU9dXvzCN4=
X-Google-Smtp-Source: APXvYqx0rBiBNM6nDRaxXD/jop9PP3ZJRE4zitm3GMcyWq92i0c1CgPS1MUcDO6iWrfHDP/7iwTatg==
X-Received: by 2002:a25:80ca:: with SMTP id c10mr20659596ybm.502.1562149972431;
        Wed, 03 Jul 2019 03:32:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:6ac3:: with SMTP id f186ls225963ybc.11.gmail; Wed, 03
 Jul 2019 03:32:51 -0700 (PDT)
X-Received: by 2002:a25:3fc4:: with SMTP id m187mr23580807yba.70.1562149971791;
        Wed, 03 Jul 2019 03:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562149971; cv=none;
        d=google.com; s=arc-20160816;
        b=iWUjyp83Ox5eQaLBgAuAzMievdrujoTsOSosBHupqVdLBl2F+LXMYvyIwLfkx8L8Eo
         GRBWBuP2X/WL9ao8uh4F5tikQ+AxOb51/OFrZ6YwstQspOCefz4H60H9FDtolPa9/coo
         DPyeZVZdT2aUa9wHkUbIjOTinDpBZBNgkU5u/GpyG8dWWEpe610Pm9PT+OOEg8QRJoAC
         1fUmVH1iwC6ed+UbV7yrO/FZh4PlAEgRs4pCqA5pMsIfb+CXvFURDwnfPWJttuzhZVLa
         DyF7Am+3/3b+rV67tA8fHBL8PswOiBQFo+J3fiXSmBM/1To4L9twpdgxyyCUt/uDscAq
         O6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=WUCQxw7hgoGaoL0prsR3WM+hOsquqPn3+ZAjT5l0kvk=;
        b=s40C6cLEFlDcClMQD2qcim06NaPAT7kaqBBO0+o6AnIIqm6Q1q/ov/7VrXvtW1UCYE
         W2qCcjwKVEc6x4sMd7v6wcRlZgiaOGJvF/nkYxpKERIfDRJaZXVlZUzD5CaS8PoLoTXz
         2+fk8jceekP/sUui/6qt64QI7S8lNnVZCQ64fmPuzRkcPDPA8GwTOzoy/vAsEXY2qD9t
         nXtgDJo1sKpGAqENUq0hsEVT2zAhVhllEHbi+/jCOPwzmnz0G2PLTDtgI2Y736IoC6Yc
         NOZwPPGY+y2uby9pdzy9g+9keZZwQ2aQVwRbthBpeUtW8DcV8n2m2gWCf+nhRI7i8x90
         ATHg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=c7e4gIVp;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id b129si78016ywb.4.2019.07.03.03.32.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 03:32:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x63AWppN059785;
	Wed, 3 Jul 2019 05:32:51 -0500
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x63AWpcb072076
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Jul 2019 05:32:51 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 3 Jul
 2019 05:32:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 3 Jul 2019 05:32:50 -0500
Received: from [172.24.190.229] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x63AWmhc118944;
	Wed, 3 Jul 2019 05:32:49 -0500
Subject: Re: [PATCH 6/6] arm64: iommu: smmu-v3: Add support for stage 1 and 2
 translations
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
 <20190702143607.16525-7-p-yadav1@ti.com>
 <47206b1b-aeec-d71c-6f4c-9b4680282ef7@siemens.com>
 <7e76f0f4-f9b8-12db-1dd7-dc63ee7a2004@ti.com>
 <17e77e2c-5f37-4532-858d-04fab20d9ece@siemens.com>
 <a01e9cb2-5c14-5451-156e-faf80bee74e7@ti.com>
 <45656e34-8ff5-80fd-8896-971441c61af2@siemens.com>
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <75ccac5a-5faf-c770-4759-1ea2cc8a47db@ti.com>
Date: Wed, 3 Jul 2019 16:03:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <45656e34-8ff5-80fd-8896-971441c61af2@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=c7e4gIVp;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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



On 03/07/19 3:26 PM, Jan Kiszka wrote:
> On 03.07.19 11:16, Pratyush Yadav wrote:
>>
>>
>> On 02/07/19 8:58 PM, Jan Kiszka wrote:
>>> On 02.07.19 16:57, Pratyush Yadav wrote:
>>>>
>>>>
>>>> On 02/07/19 8:12 PM, Jan Kiszka wrote:
>>>>> On 02.07.19 16:36, Pratyush Yadav wrote:
>>>>>> A System Memory Management Unit(SMMU) performs a task analogous to a
>>>>>> CPU's MMU, translating addresses for device requests from system I/O
>>>>>> devices before the requests are passed into the system interconnect.
>>>>>>
>>>>>> Implement a driver for SMMU v3 that maps and unmaps memory for speci=
fied
>>>>>> stream ids.
>>>>>>
>>>>>> An emulated SMMU is presented to inmates by trapping access to the M=
MIO
>>>>>> registers to enable stage 1 translations.=C2=A0 Accesses to the SMMU=
 memory
>>>>>> mapped registers are trapped and then routed to the emulated SMMU. T=
his
>>>>>> is not emulation in the sense that we fully emulate the device top t=
o
>>>>>> bottom. The emulation is used to provide an interface to the SMMU th=
at
>>>>>> the hypervisor can control to make sure the inmates are not doing
>>>>>> anything they should not. The actual translations are done by hardwa=
re.
>>>>>>
>>>>>> Emulation is needed because both stage 1 and stage 2 parameters are
>>>>>> configured in a single data structure, the stream table entry. For t=
his
>>>>>> reason, the inmates can't be allowed to directly control the stream
>>>>>> table entries, and by extension, the stream table.
>>>>>>
>>>>>> The guest cells are assigned stream IDs in their configs and only th=
ose
>>>>>> assigned stream IDs can be used by the cells. There is no checking i=
n
>>>>>> place to make sure two cells do not use the same stream IDs. This mu=
st
>>>>>> be taken care of when creating the cell configs.
>>>>>>
>>>>>> This driver is implemented based on the following assumptions:
>>>>>> - Running on a Little endian 64 bit core compatible with ARM v8
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 architecture.
>>>>>> - SMMU supporting only AARCH64 mode.
>>>>>> - SMMU AARCH 64 stage 2 translation configurations are compatible wi=
th
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 ARMv8 VMSA. So re-using the translation tab=
les of CPU for SMMU.
>>>>>>
>>>>>> Work left to do:
>>>>>> - Route event notifications to the correct cell and identify which e=
vent
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 needs to go to which cell.
>>>>>> - Add support for IRQ and MSI routing.
>>>>>> - Add support for PRI queues and ATS.
>>>>>> - Identify which cell caused a command queue error and notify it.
>>>>>> - Support sub-streams.
>>>>>>
>>>>>> A lot of the work left is optional features that the SMMU provides l=
ike
>>>>>> substreams, ATS, PRI. There is little reason to add them unless ther=
e is
>>>>>> a use case for them.
>>>>>
>>>>> One quick question again, I already had it for the RFC round: Would i=
t be tricky to split up this patch into single-stage only + 2-stage support=
? That would allow me to asses the additional complexity we import by addin=
g 2-stage support. Or is 2-stage support inherently coupled with the SMMU d=
esign so that such a split-up would neither make sense nor buy us anything?
>>>>
>>>> I considered splitting, but as far as I see, stage 1 and 2 are rather =
tightly coupled. If you want, I can split it into two parts where part 1 is=
 the defines, data structure declarations, and initialization. Part 2 will =
have stage 1 emulation and stage 2.
>>>
>>> If part 1 will get away without emulating/intercepting bits of the SMMU=
, I bet it will be a win.
>>
>> It will.
>>
>>>>
>>>> Let me know if you'd prefer that, and I'll send the series tomorrow. I=
t's getting late and I'm about to leave for today.
>>>
>>> Sure, no hurry!
>>>
>>>>
>>>>> Background is that the majority of use case I see will not need more =
than one stage. I particular, you have no need for 2-stage support in simpl=
e bare-metal or RTOS cells, leaving this only potentially relevant for the =
root cell (or secondary Linux cells). If the feature is complex and can be =
disabled, we could skip it, reducing the code size.
>>>>
>>>> Hm, as far as I understand, stage 2 should be always needed because yo=
u need to translate from IPA to PA every time. Stage 1 could be optional if=
 the guest OS handles the scattering or gathering of the buffers. But don't=
 you always need to translate from IPA to PA (even though in case of Jailho=
use those translations are almost 1:1, and IPA =3D=3D PA)? When would you n=
ot need stage 2?
>>>>
>>>> Anyway, most of the code is setting up the SMMU and the data structure=
s, and stage 1 emulation. Stage 2 only part is very small. Removing it won'=
t save you more than 10-15 lines.
>>>
>>> As noted above: If eliminating guest visibility of the SMMU helps getti=
ng rid of related emulation and interception logic, I'm sure it will be mor=
e than 10 lines. If we need 2 stages configuration-wise in order to use the=
 SMMU at all, those 2 stages need to stay, of course.
>>
>> Ah, I thought you meant removing stage 2 and keeping stage 1.
>>
>> The SMMU can work with either or both stages enabled.
>>
>>> But I'm not into the details yet, just deriving from the history on IOM=
MU on x86 where you started with 1 stage (what we only support there so far=
), and only later on a second one was added in order to allow guests to map=
 hardware directly while isolating it under own control (e.g. protect again=
st userspace-mapped devices). The latter is a bonus feature with use cases,=
 though not yet in Jailhouse context.
>>
>> Guest visibility of the SMMU is useful when you have a device not capabl=
e of scatter-gather operations (we have some on our boards, like the video =
decoder). They expect a contiguous buffer of memory to work. Adding stage 1=
 translations eliminates the need for large contiguous buffers. Another use=
 case is when you have a multiple PCI devices under the same cell. You coul=
d easily protect memory regions of the two devices from each other with sta=
ge 1 translations.
>=20
> I get the first use case (legacy IP support - modern PCI devices no longe=
r have that issue, thus there was no need on x86 so far), but the second on=
e is exactly of that "nice-to-have" category which I consider not yet relev=
ant.
>=20
> On the downside is the fact that adding an emulation interface massively =
widens the attack surface of the hypervisor. That is easy to get wrong, jus=
t look at [1]. So I would really like to see this optional, either build-ti=
me or runtime configurable, so that you can turn the interface off if there=
 is no device around anymore that needs it (I assume future IP will remove =
such limitations more and more).

A build-time configuration will need at least 3-4 sets of #ifdefs scattered=
 throughout the driver, but it will reduce the binary size when the emulati=
on is not used. Run time configuration will come at the cost of larger bina=
ry size, but only a couple of if statements need to be added. Of course, so=
mething in the cell config will also need to be added to tell whether to us=
e both stages or not.

Which would you prefer?

> Jan
>=20
> [1] https://github.com/siemens/jailhouse/commit/ae8b272f997bc720efc7f1847=
6e5a407e2580ead
>=20

--=20
Regards,
Pratyush Yadav

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/75ccac5a-5faf-c770-4759-1ea2cc8a47db%40ti.com.
For more options, visit https://groups.google.com/d/optout.
