Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMFI3P4QKGQESQFKZ2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC7E244E63
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 20:13:04 +0200 (CEST)
Received: by mail-ej1-x63a.google.com with SMTP id op5sf3648584ejb.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 11:13:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597428784; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ze3KQTOF5CA5Cd/Ay5FRUdy8ta4RZR6cZcyfV24/IYGtrBzfahbnX7vGmmK7r1l6Db
         S3cSGt3rp696CTonmeNEFXjh0Yxy+RUXCjDOdCLQ2yz82Pm86O3jXJ7QYa8ipTykt79R
         Zelbj8vcfl2hfztVrVfMYTG6vT0oIVFPOdkp24gXtVJTHLoA1kE+hXhFEvHJTDOfnBoY
         0VCrjYqH0jvHup8KFazKymQHa16vu/sUQ8X5Irtp/CmLJlwPpiD8EoYGpvaTBLX934Bg
         qSxEidlYSDoE3CQJfJEpKGKW910DCgsRC2FP38At5BGTonRlvztUB8cfSCPrtE2V85m6
         ng3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=u6vZB24TZpAq3x0yZb6jEA3WsqrKgwgQd8S7lUH9a24=;
        b=Sj2oYrqMC525PR9LLuwBShsGbauV2JSkIk7KAsNM8xgD+aTI6zCaX84zY8T/QIVoii
         RvmbSSOSWibnvMFGCrkC/rYiMHcdOVzpLNOHdMwIRMPv1/m+xNkj0ziY9tW1xs8skfOL
         L4MQlBu7DvgArWelpB+YcPyJdSngShmGs0K2ql0Nt99eAIgL9QhEGYIo8F21BLmxbwpC
         AiVIckBVdoS+yRMQM1bhGtUUZS0MV6uK5aKvwmuWXUlMLgQUlO/LZ920CtkG7ZjYIqXP
         jPK3FZBtea55uTH4b0JWHKgBj0TQE7DZ4wPp1NkEb2eaIrH17itxrwf7+/Li85DyyGZ8
         +1DQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u6vZB24TZpAq3x0yZb6jEA3WsqrKgwgQd8S7lUH9a24=;
        b=lVt+gEaksDrT1c8jhjMRBL74mfPVtIewsuZMRyXjCMnuxDYp7xRyEvF3EyW2NEwGsH
         VgCYXlds/GZHbcSdygHg7i3FP2cqaogNaKM0c1xx0ivDsZegrNLtpA87MPJ8tdN46taw
         rSBqPzzpMfQy0tyZ2njvnprn4YmqiLDIP09pwJ5NvAloheT910o5tWEIerKVlzL+kYmF
         GqGvvceta6f/Pu4HXtZNQzdTeugrb283yapRQgyLarKqYtEMyoonGpTVb08I+t/LGG8u
         xxgdmi8id4uwWJuWfRHUFHI6vvTGYZJbtC+zzfV1x4OaNTARLGORZZs0IrbRUEgPe4iw
         qCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u6vZB24TZpAq3x0yZb6jEA3WsqrKgwgQd8S7lUH9a24=;
        b=FD2AABHy99q+YxaHjhKIdII5GaonbKEyA+DCf7HRJmWzVjiuHMco6lqk8SYP4OehAP
         6Kq4DacmjkgN0/vVOIu4jrVARzqGrzG7F6l7vxbbgJC32laZdyFdQo7cLgEwiwhqfQpH
         rOxwvnJBckoztZolKttjfcOtSiqALab1q2L2JXopNl/5gOmtXlEOckQI9chQaFDgMLuv
         reZpqBbJhY/a1t+N5YxchbhdahqSXTcsX6VfWWXtPqiAXQQPDpTOMRG+n+yAszLPURcq
         9+jEoZ1hpxQSMyAkR1/sHu+TbuGc776vSPTE6EnR68BE19xMj30D95upoVR77t/49ZhW
         3Fwg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533EeLnC6iS9A+CCD/6JdtDBOCWe0n+c7hBtwCddG7qpm+j2Yrrg
	Rw+r9AGAB2OiNPgXTKrIjbQ=
X-Google-Smtp-Source: ABdhPJytuEI9zUBFdN6MEIYmM5Ag1V6mldzfUcsOQaodxWtqcv0NxidS89WoIVfhaqDxAlUyZ6effg==
X-Received: by 2002:a50:da44:: with SMTP id a4mr3563479edk.36.1597428784536;
        Fri, 14 Aug 2020 11:13:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:bc05:: with SMTP id j5ls1196512edh.0.gmail; Fri, 14 Aug
 2020 11:13:03 -0700 (PDT)
X-Received: by 2002:a05:6402:6c8:: with SMTP id n8mr3527297edy.195.1597428783857;
        Fri, 14 Aug 2020 11:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597428783; cv=none;
        d=google.com; s=arc-20160816;
        b=BVoQt0rj89HXhrQ7pNd5t2kdq6RlJVSiMrm17FHhHN+7XBl0U3WtEeyzxa/ajIvQ52
         fDJbXuIAFMLe0KSaWZG1eGro/6wli+O1RYAz5CKagSj5DD2eTz4zU71UdKhy9dczgjAy
         Zownu/lFAYnMpdf5oWZJzPvdN+xCY6OQCHXWKokN8Bni2Npwv0zt1CK5QGbw5/Wc9nTo
         kt/QwyErXjqCON24/8TajVK1kmn1oCRHpX3Kbl5kLG+aiN/dQwwq/8dycQoQPhADxyG9
         XuQCiIwKGEnzdHZG4TpkqLXLx6Sblq4FLLJiMlK2rHuYP0y6TxT6ddCqfU5pLo+dbQ58
         3Q+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ySUDF4ax1W4/ydm8PsHaRshTnMWNthbsKvkd1OSh2tc=;
        b=GnjUiDbVIYL9c7FwtG44pYtlT+BhtbQLbg/ZR3UF4NSBBkihV8syBhDr2dc2hgcWdO
         VW5NKifgJBHE9TW5sMxjIyiZAP/Js4zKWDCC2J89wtbE42dxgtbOHWsYgwLFNV3uhIJb
         d5+iZz6y5ie1tFQjaUuaNxZ3UuY65HWuXx4O+3Bc/G/xZYgZQD55bhR5/A1TLuLvNw/q
         bXcoawxJzrIhLubr0K3NSBR1UmGmpxV+CSS82Q0aadbSSQNwdDEGhnyuV3BVkLITm9wo
         +lCGkwtfi3TaszHaySQ9nULVO5QY5Aq9V6QKL5JxbgFd2YoHlVmVeyMgHuXm1iCMszBC
         7jDw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id b6si421677edq.1.2020.08.14.11.13.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 11:13:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 07EID3Lt006451
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Aug 2020 20:13:03 +0200
Received: from [167.87.129.142] ([167.87.129.142])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07EID0Cg003869;
	Fri, 14 Aug 2020 20:13:01 +0200
Subject: Re: [PATCH 06/10] Add libbaremetal
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Peng Fan <peng.fan@nxp.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>,
        Wolfgang Mauerer <wolfgang.mauerer@oth-regensburg.de>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-7-peng.fan@nxp.com>
 <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
 <DB6PR0402MB2760040A34FE70576005395E88400@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <deb41f1a-1b87-ebd1-50d2-d7d299d35d8e@siemens.com>
 <9e8f00b4-2a2d-8bb8-e92c-8e23e5910af0@oth-regensburg.de>
 <5cd1415a-f4d0-b307-e81a-769b7be8eebb@siemens.com>
 <f81327a9-db37-be4d-4aa3-862b7d0416f3@oth-regensburg.de>
 <47babf84-565b-db76-7e42-47b0a2d5ed00@siemens.com>
 <9d551e5e-25fb-4c8f-66a4-934187b9650f@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4f2c2e19-eba7-6020-5f1c-137f9e8c5efe@siemens.com>
Date: Fri, 14 Aug 2020 20:13:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9d551e5e-25fb-4c8f-66a4-934187b9650f@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 14.08.20 19:47, Ralf Ramsauer wrote:
> On 8/14/20 7:20 PM, Jan Kiszka wrote:
>> On 14.08.20 19:06, Ralf Ramsauer wrote:
>>>
>>>
>>> On 8/14/20 5:47 PM, Jan Kiszka wrote:
>>>> On 14.08.20 17:06, Ralf Ramsauer wrote:
>>>>> (+Cc Wolfgang, we recently had discussion on the boot process of
>>>>> Jailhouse)
>>>>>
>>>>> On 8/14/20 11:43 AM, Jan Kiszka wrote:
>>>>>> On 14.08.20 11:08, Peng Fan wrote:
>>>>>>>> Subject: Re: [PATCH 06/10] Add libbaremetal
>>>>>>>>
>>>>>>>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
>>>>>>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>>>>>>
>>>>>>>>> Add libbaremetal for sharing code between inmates and jailhouse
>>>>>>>>> baremetal loader.
>>>>>>>>>
>>>>>>>>> The Makefile code is copied from inmates, currently only
>>>>>>>>> string.c is
>>>>>>>>> moved from inmates to libbaremetal. In future, we might need to
>>>>>>>>> share
>>>>>>>>> uart/mmu and etc.
>>>>>>>>
>>>>>>>> Might quickly become confusing to have two libs. What prevents
>>>>>>>> renaming
>>>>>>>> inmates/lib completely into libbaremetal? Sure, there are some
>>>>>>>> jailhouse
>>>>>>>> specifics in inmates/lib, but those could likely be put in some
>>>>>>>> corner.
>>>>>>>
>>>>>>> How about rename inmates to baremetal?
>>>>>>> And add bootloader stuff under baremetal?
>>>>>>
>>>>>> We could do
>>>>>>
>>>>>> baremetal
>>>>>
>>>>> What we provide is a minimalist runtime environment, which is not jus=
t
>>>>> limited to baremetal applications (depends on the definition of
>>>>> baremetal, though). But=E2=80=A6
>>>>>
>>>>>> =E2=94=9C=E2=94=80=E2=94=80 demo-inmates
>>>>>> =E2=94=9C=E2=94=80=E2=94=80 lib
>>>>>> =E2=94=9C=E2=94=80=E2=94=80 tests
>>>>>> =E2=94=94=E2=94=80=E2=94=80 tools
>>>>>>
>>>>>> and put the jailhouse loader under tools. Inmates is a "brand" in
>>>>>> Jailhouse context, so it should remain in some form. But it's true,
>>>>>> some
>>>>>
>>>>> =E2=80=A6 yep, the branding is the point why we should keep calling t=
hem
>>>>> 'inmates'.
>>>>>
>>>>>> of the existing demo inmates can already run without jailhouse.
>>>>>
>>>>> And that's the second point - we already have some kind of support fo=
r
>>>>> this kind of use case. However, I agree that I wouldn't expect the
>>>>> preloader inside inmates/.
>>>>>
>>>>>>
>>>>>> Ralf, what do you think?
>>>>>
>>>>> Peng, I just read the code of the loader and I try to understand what
>>>>> how it's exactly working. Nice work! Do I see that correctly: You
>>>>> basically "imitate" Linux in a way that you manually do the early set=
up
>>>>> (some register setup, GIC init, kick off all CPUs, hv stubs, ...).
>>>>>
>>>>> IOW, you bring the system to the same state, where the Linux driver
>>>>> would hand over Jailhouse. You activate Jailhouse, we then return to
>>>>> the
>>>>> loader which got lifted to the first cell, the root cell. Now you use
>>>>> the loader to partition the system, i.e., to create cells. Therefore,
>>>>> you use the hypercall interface, just like Linux would typically do i=
t
>>>>> for us. Finally, there's the hand over to Linux.
>>>>>
>>>>> But do we really need a separate loader? Can't we just place the
>>>>> loader-related stuff at, say, the end of jailhouse.bin?
>>>>>
>>>>> To be more concrete, i think it should be possible to have the full
>>>>> preloader-thing located under hypervisor/arch/arm64/. It should also =
be
>>>>> possible to link everything that is required into jailhouse.bin - so =
we
>>>>> would get one universal binary instead of a chain of dependent
>>>>> binaries. [1]
>>>>
>>>> Interesting idea.
>>>>
>>>>>
>>>>> Pro: You can make early use of the UART in your preloader without
>>>>> having
>>>>> the need to, for example, duplicate drivers. That's quite useful for
>>>>> debugging if something goes wrong very early. Secondly, you can also
>>>>> piggyback on existing gic routines, no need to reimplement
>>>>> phys_processor_id, =E2=80=A6
>>>>>
>>>>> The next thing after early boot would be the handover to jailhouse.
>>>>> Before the handover, we set a flag that indicates that we do an early
>>>>> boot of Jailhouse. We can use this flag to do the full partitioning o=
f
>>>>> the system before we return to the guests in one single step. IOW, we
>>>>> never return to the preloader once the handover happened. We can do
>>>>> that, as u-boot already placed our guests and we just need to start
>>>>> them
>>>>> (as we would start regular cells).
>>>>>
>>>>> The amount of additional logic in the actual hypervisor core should b=
e
>>>>> reasonably low.
>>>>>
>>>>> Did you already consider that strategy? Jan, what do you think?
>>>>
>>>> As we are already in visionary phase... There is another use case to
>>>> consider:
>>>>
>>>> I'd like to have a Jailhouse variant that comes without a root cell.
>>>> That means, we will need a booting procedure that creates all cells,
>>>> loads and starts them - and then drops all the logic that could
>>>> configure or destroy them (or never includes it in the first place -
>>>> build-time setting). This should reduce the Jailhouse runtime code to
>>>> much less than 10K LoC.
>>>
>>> Ok, that's indeed an awesome idea.
>>>
>>>>
>>>> Peng's approach is useful in case you do want to keep the flexibility =
to
>>>> reconfigure the system from a root cell, just like you can do when
>>>
>>> To be honest, I consider the "dynamic" reconfigurability of Jailhouse a=
s
>>> a development and testing utility rather than something that would ever
>>> be useful for operative usage. This includes, of course, jailhouse
>>> disabling.
>>
>> Reconfiguration, yes, but reloading can be a topic in certain scenarios.
>> The current config locking mechanisms allows to keep this door for the
>> root cell open, even while there is a critical cell running.
>>
>>>
>>> What would be great would be a single-shot 'jailhouse freeze' (or, ha,
>>> 'jailhouse detention') call, that throws away the whole hypercall
>>> interface. Having such a thing, we an drop everything that is somehow
>>> related to cell management: create, start, stop, destroy, stats,
>>> disable, enable, ...
>>>
>>> And that would in fact be no big deal: Annotate all affected routines,
>>> replace hyp vectors with stubs, drop the section, done. Every code that
>>> has no other users than from a hypercall can be dropped. Or do I miss
>>> something?
>>
>> I haven't thought this through in details yet, but I would be surprised
>> if there weren't at least some smaller challenges in implementing that
>> cleanly. Still, it's mostly about disabling code.
>>
>>>
>>>> booting via Linux. The idea of adding a preloader is minimal invasive =
to
>>>> the existing setup. My root-less mode will be maximal invasive, though=
.
>>>
>>> Why do you think that it would be maximal invasive?
>>
>> As it changes the current hypervisor code for sure. Just loading
>> Jailhouse via a different thing than Linux does not bring many changes,
>> at least to the core. See this series.
>>
>>>
>>> Oh btw: who would receive the freed memory? Would it remain in the
>>> hypervisor or be assigned back to a cell? Though that should probably
>>> only be a few pages.
>>
>> What freed memory? When things are only created, nothing will be freed
>> anymore. There will also be no jailhouse disable.
>=20
> There will, e.g., be a cell_create routine, that will be called once per
> cell. After the creation of those cells, drop it, we won't need it again.

Right, but that's just init code then, like the stuff we already have in=20
hypervisor/setup.c. I thought you meant "real" memory.

>=20
> If we have a universal binary, there will be a jailhouse disable will be
> present in the beginning. Once we decide freeze the configuration, drop
> it. If we make those things compile-time configurable, then it has
> potential to become a variant hell.

Dropping significant code chunks from a root-less jailhouse.bin would be=20
a valuable reason for such a config variant. You do not have to argue=20
over things that are provably not there.

>=20
>>
>>>
>>>> If root-less would be sufficient for cases you do not want Linux-based
>>>> boot, we can skip this approach and head for root-less full steam.
>>>
>>> root-less means that the detention call (I like that) comes after cell
>>> creation, but before cell start. .oO(we can even drop the cell_start
>>> code, if we find a smart strategy to drop code right before vmreturn)
>>>
>>
>> I would rather envision some alternative configuration that contains all
>> cell configs, not just the root cell (which would become a non-root cell
>> as well). Loading would have to happen into the target memory regions
>> before jailhouse enable, and the enabling would also imply starting all
>> cells.
>>
>>>>
>>>> If there are use cases for all three variant, we can try to look for
>>>> common pieces in the two Linux-free options. My root-less mode would
>>>> also need a single-step "create and start all cells", e.g. And your id=
ea
>>>> to include the bootstrap logic into an init section of jailhouse.bin i=
s
>>>> also attractive for both.
>>>
>>> Yes, I see the overlaps. By the way... Why don't we actually do:
>>>
>>> $ cat jh.bin sys.cell c1.cell c2.cell > jh.image
>=20
> Even better:
>=20
> cat preloader.bin jh.bin sys.cell c1.cell c2.cell > jh.image
>=20
> Again, the preloader.bin is still a binary image that only contains the
> preloader section, but u-boot can directly jump into it. It is still
> developed under hypervisor/arch/foo and hence has full visibility of all
> symbols that are available in regular jailhouse code and can potentially
> use them. We just exploit the linker to export that section to a
> separate binary.

Probably doable - will just blur our stats about what is hypervisor core=20
and what is boot loader.

>=20
> If someone wants bare-metal boot mode, we just glue things together.

You will still need some U-Boot scripting to load all the cells,=20
provided that needs to happen early as well.

>=20
>>>
>>> for the bare metal case?
>>
>> That comes close to what I have in mind, config-wise. sys.cell would
>> still need a counter of cells that follow (simple to add to struct
>> jailhouse_system).
>=20
> Not necessarily. We can also define a zero-termination. Once the first
> byte of the JHCELL magic isn't present, we're done. But that's details.

Given=20
https://groups.google.com/d/msgid/jailhouse-dev/20200807030632.28259-8-peng=
.fan%40nxp.com,=20
we will have a spare field anyway. ;)

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4f2c2e19-eba7-6020-5f1c-137f9e8c5efe%40siemens.com.
