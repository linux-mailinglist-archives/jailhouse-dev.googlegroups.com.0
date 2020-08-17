Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7FT5L4QKGQEQOA4LLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id E61652468C4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 16:53:49 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id y11sf2915768ljm.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 07:53:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597676029; cv=pass;
        d=google.com; s=arc-20160816;
        b=PjPJ6iUR7G46tx/5UIuFQQZWERMV+0Lml1JnEmUk4CaWRTF8lONjaYnxp84jfykJEP
         xuYh6jyW6q+xki8QVr56vnUaBsFMxa4DeWJygSBKMi80AzZk7SCxdb2DcIFNAF99BU/L
         J1gbBVIONMxKVLxT9PMvf925FG004+jsgCA5pU+nR7gIh43SHWIUoPsAVBMy4NViZBpV
         VgdKqcJWuvTRcaA28rif1tcJAg0ak5fdjIU1Isp5RKhrVWVW4gHHP692oOQYfvZBTBPb
         rY/AOWXKb7jxb3It7obIDe5U5pU+xj94UezxTdkJqdqpvHL70G/mv2UfQ68+rNI0Gxwr
         3ZjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=+mRXe86IYF5bXOeCnf2T6rw+uil2Pt0XrkrSIbr+9LA=;
        b=dikcoLSzEiRTIUTSahyxB6uUDyy6yESXLIeH99K/j1yAAWe0FASA6u5z4Y/tMQfkik
         ujg5XuMBlH7pGDujkShfXDIgdNvipdLUP1ildmjIS2ToltHJS0cgOHxs40g0ZzohpukC
         PhkfnY4hAD9VEwle5DFDIhFok3RZTxSjTSaQIXonY9Dubo8PjlvFA4yDAy0J1zayp+uZ
         rRs5WKECrzpQcHLFBFeXvF2aaR+/EFce03imKIepPk86YoXSt8CDOHoYFk6Fnsh5cSQA
         4VVn8GhftH7s76vXzM0WUgiqqLAXml+njENfZOVTJVVf6Z7SGvVrFd9SWXbebI6j2q1E
         QcaA==
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
        bh=+mRXe86IYF5bXOeCnf2T6rw+uil2Pt0XrkrSIbr+9LA=;
        b=Sm9lsr44uHrk6DIqeLm2vokc6vMOpNLZ4scBRwW7SIzUGzVCvHImLmFHdbwNjnCHvw
         ZD9kuGclLoZBAi20H9/gWHJ5pfvYqkyGmxI9PTay93A4jGkfPqZshqdubD5qIyXsCOBH
         SVxSltuLifyHGxOMy6XEnwqih88wIx5Xst0SR2xpu7rEnlGy/xe6TI+GFb6HkPdk0cMF
         3shtDII3KiMDheZTaNMqAD/+At428FLii+EFiJ3z6RZnBEQoyCue8xjKV4aEJgRTl46t
         mQy8ii013D2YqoWGCeIg0szP7E4cQZbIWEeIAe1QAbbRAt4LK+frXy2XiNtr85Xot81g
         asVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+mRXe86IYF5bXOeCnf2T6rw+uil2Pt0XrkrSIbr+9LA=;
        b=lMTH2UeWVu5xE2cu0e4a3k06LtHWPldctjZHOLpSnlhWQwXddogVerZ3e41c3RF9Pw
         BmzANa74YyTYbjhAoyWwkEDBMhd1lmvsCwD7r1OlKEpxlZ4y02gQM4Gk0bz/d6dGZH+T
         SSndYnd8gO/5F3l0c4sdowgBtxKQDEIeQoE8dn5ItmMW0OH0Lz0nkIYrz8RFAb9vApdU
         2KAor2GsLEwp4r7rXF7bx+QvWhpMkpNv4MyMzmGP9+SvxEvoRq+oo80GNDaCmQq0v8Fj
         81J++1sJtCJ1FqIskdNnRyLwQWWpuDTImMO67GiA7J8aqYplDr/XwBmq47DPeWIW+pIW
         bQmw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5313bvrvoHMNOYUGQtEoGJiwHtC3BYw6XBbGDNAeDg1BPr1o1+c5
	NryLK4KGsrLpc1Fg37rqRaM=
X-Google-Smtp-Source: ABdhPJytqLtFAlQFMxfVUnROtI+G8/fiQou4PbaJOVd4UCCFXl8oBabdc2jtqUjiLdbLyCMtS7dqqA==
X-Received: by 2002:a2e:9cd6:: with SMTP id g22mr8291163ljj.344.1597676029180;
        Mon, 17 Aug 2020 07:53:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:60e:: with SMTP id 14ls131252lfg.0.gmail; Mon, 17 Aug
 2020 07:53:48 -0700 (PDT)
X-Received: by 2002:ac2:43ca:: with SMTP id u10mr7506472lfl.147.1597676028061;
        Mon, 17 Aug 2020 07:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597676028; cv=none;
        d=google.com; s=arc-20160816;
        b=AlU+IUqJLd9MJIy8T+ThcKQv8wN5p7Opqn4o4T7m1Zu/cdVAG2LdyQ4AB2MOtQaY3R
         IovHOJ77tecxqs6O4+msAA8fuobblchZ3yjgmjRV+Cz3qhHan/zTz4Su4cv55M9sV5Cq
         ai9iDAR0w/Yl8gdQN8EejxCvAjU1cZGw41RJn7MZWbsqMQlFK2aKOZ6XXG/7tNFMd4N+
         LD5lAzN6Iv4gdVLEaiT7T/xfQBMGnjnq+Q0eMtG2+ez/HAE9TYlTXCNfnrH6ukCEa4mt
         ilCAd28t8+9BgZY6JpssoO0evDgI4oHuiLCoZNtWBPKHmL8nvu6Mh3Ud7cTvMWzzLKyp
         nUVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=GY7WumvWqE/+Fnd9VdyHMWHoyiSEA1GBrGTbmKYw268=;
        b=jtynQ/1N+P9XYgiqehtXbGbLpJNXVmHVdNf6s/8KcoDEEvv6+eJWY/hYfVpv7GLx3b
         UtBLJ/5CCi31AFmT62Dqe5MajtF60M9ilmubbUyKB8hfUra0QkJkRI8kAFA5y3TxVAYg
         VPEvMHgwPGevyEDuI95OcTU1/qnRpceZCzJPXdNH34VCG1uHnUHf7PjVq0uQ5NbrDvxV
         Fb3mZtGTyfthS6QUxJiOuebJx9vi6biH7tyyp+7p6OKa1Xdw5gGfeFpZPLoAgJNHvtta
         U9VvgkfPQv1irxUdfIzwtTjTZlqjRQwP5NCDn9vs/7RaZauvF6VtPYG+yoD5Aqhm8+Jl
         DR5g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id t3si503559ljg.1.2020.08.17.07.53.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 07:53:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 07HErle8017662
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Aug 2020 16:53:47 +0200
Received: from [167.87.134.109] ([167.87.134.109])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07HErisC032475;
	Mon, 17 Aug 2020 16:53:45 +0200
Subject: Re: [PATCH 06/10] Add libbaremetal
To: Peng Fan <peng.fan@nxp.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
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
 <DB6PR0402MB2760128F2AF78973F466B6B3885F0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4bfa6a8a-e4a8-9b4b-eb10-820242fab80a@siemens.com>
Date: Mon, 17 Aug 2020 16:53:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760128F2AF78973F466B6B3885F0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
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

On 17.08.20 11:41, Peng Fan wrote:
>> Subject: Re: [PATCH 06/10] Add libbaremetal
>=20
> Since we come to discuss in a bigger picture, how do you suggest
> to proceed about the bootloader part?
>=20

The key is to understand to use cases. What are your primary drivers to
push the loader out of Linux? Is it "just" boot speed, ie. do you need a
full-featured Jailhouse later on? Or how close would a static boot-time
partitioning come to your use cases?

Jan

> Thanks,
> Peng.
>=20
>>
>> On 8/14/20 7:20 PM, Jan Kiszka wrote:
>>> On 14.08.20 19:06, Ralf Ramsauer wrote:
>>>>
>>>>
>>>> On 8/14/20 5:47 PM, Jan Kiszka wrote:
>>>>> On 14.08.20 17:06, Ralf Ramsauer wrote:
>>>>>> (+Cc Wolfgang, we recently had discussion on the boot process of
>>>>>> Jailhouse)
>>>>>>
>>>>>> On 8/14/20 11:43 AM, Jan Kiszka wrote:
>>>>>>> On 14.08.20 11:08, Peng Fan wrote:
>>>>>>>>> Subject: Re: [PATCH 06/10] Add libbaremetal
>>>>>>>>>
>>>>>>>>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
>>>>>>>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>>>>>>>
>>>>>>>>>> Add libbaremetal for sharing code between inmates and jailhouse
>>>>>>>>>> baremetal loader.
>>>>>>>>>>
>>>>>>>>>> The Makefile code is copied from inmates, currently only
>>>>>>>>>> string.c is moved from inmates to libbaremetal. In future, we
>>>>>>>>>> might need to share uart/mmu and etc.
>>>>>>>>>
>>>>>>>>> Might quickly become confusing to have two libs. What prevents
>>>>>>>>> renaming inmates/lib completely into libbaremetal? Sure, there
>>>>>>>>> are some jailhouse specifics in inmates/lib, but those could
>>>>>>>>> likely be put in some corner.
>>>>>>>>
>>>>>>>> How about rename inmates to baremetal?
>>>>>>>> And add bootloader stuff under baremetal?
>>>>>>>
>>>>>>> We could do
>>>>>>>
>>>>>>> baremetal
>>>>>>
>>>>>> What we provide is a minimalist runtime environment, which is not
>>>>>> just limited to baremetal applications (depends on the definition
>>>>>> of baremetal, though). But=E2=80=A6
>>>>>>
>>>>>>> =E2=94=9C=E2=94=80=E2=94=80 demo-inmates
>>>>>>> =E2=94=9C=E2=94=80=E2=94=80 lib
>>>>>>> =E2=94=9C=E2=94=80=E2=94=80 tests
>>>>>>> =E2=94=94=E2=94=80=E2=94=80 tools
>>>>>>>
>>>>>>> and put the jailhouse loader under tools. Inmates is a "brand" in
>>>>>>> Jailhouse context, so it should remain in some form. But it's
>>>>>>> true, some
>>>>>>
>>>>>> =E2=80=A6 yep, the branding is the point why we should keep calling =
them
>>>>>> 'inmates'.
>>>>>>
>>>>>>> of the existing demo inmates can already run without jailhouse.
>>>>>>
>>>>>> And that's the second point - we already have some kind of support
>>>>>> for this kind of use case. However, I agree that I wouldn't expect
>>>>>> the preloader inside inmates/.
>>>>>>
>>>>>>>
>>>>>>> Ralf, what do you think?
>>>>>>
>>>>>> Peng, I just read the code of the loader and I try to understand
>>>>>> what how it's exactly working. Nice work! Do I see that correctly:
>>>>>> You basically "imitate" Linux in a way that you manually do the
>>>>>> early setup (some register setup, GIC init, kick off all CPUs, hv st=
ubs, ...).
>>>>>>
>>>>>> IOW, you bring the system to the same state, where the Linux driver
>>>>>> would hand over Jailhouse. You activate Jailhouse, we then return
>>>>>> to the loader which got lifted to the first cell, the root cell.
>>>>>> Now you use the loader to partition the system, i.e., to create
>>>>>> cells. Therefore, you use the hypercall interface, just like Linux
>>>>>> would typically do it for us. Finally, there's the hand over to
>>>>>> Linux.
>>>>>>
>>>>>> But do we really need a separate loader? Can't we just place the
>>>>>> loader-related stuff at, say, the end of jailhouse.bin?
>>>>>>
>>>>>> To be more concrete, i think it should be possible to have the full
>>>>>> preloader-thing located under hypervisor/arch/arm64/. It should
>>>>>> also be possible to link everything that is required into
>>>>>> jailhouse.bin - so we would get one universal binary instead of a
>>>>>> chain of dependent binaries. [1]
>>>>>
>>>>> Interesting idea.
>>>>>
>>>>>>
>>>>>> Pro: You can make early use of the UART in your preloader without
>>>>>> having the need to, for example, duplicate drivers. That's quite
>>>>>> useful for debugging if something goes wrong very early. Secondly,
>>>>>> you can also piggyback on existing gic routines, no need to
>>>>>> reimplement phys_processor_id, =E2=80=A6
>>>>>>
>>>>>> The next thing after early boot would be the handover to jailhouse.
>>>>>> Before the handover, we set a flag that indicates that we do an
>>>>>> early boot of Jailhouse. We can use this flag to do the full
>>>>>> partitioning of the system before we return to the guests in one
>>>>>> single step. IOW, we never return to the preloader once the
>>>>>> handover happened. We can do that, as u-boot already placed our
>>>>>> guests and we just need to start them (as we would start regular
>>>>>> cells).
>>>>>>
>>>>>> The amount of additional logic in the actual hypervisor core should
>>>>>> be reasonably low.
>>>>>>
>>>>>> Did you already consider that strategy? Jan, what do you think?
>>>>>
>>>>> As we are already in visionary phase... There is another use case to
>>>>> consider:
>>>>>
>>>>> I'd like to have a Jailhouse variant that comes without a root cell.
>>>>> That means, we will need a booting procedure that creates all cells,
>>>>> loads and starts them - and then drops all the logic that could
>>>>> configure or destroy them (or never includes it in the first place -
>>>>> build-time setting). This should reduce the Jailhouse runtime code
>>>>> to much less than 10K LoC.
>>>>
>>>> Ok, that's indeed an awesome idea.
>>>>
>>>>>
>>>>> Peng's approach is useful in case you do want to keep the
>>>>> flexibility to reconfigure the system from a root cell, just like
>>>>> you can do when
>>>>
>>>> To be honest, I consider the "dynamic" reconfigurability of Jailhouse
>>>> as a development and testing utility rather than something that would
>>>> ever be useful for operative usage. This includes, of course,
>>>> jailhouse disabling.
>>>
>>> Reconfiguration, yes, but reloading can be a topic in certain scenarios=
.
>>> The current config locking mechanisms allows to keep this door for the
>>> root cell open, even while there is a critical cell running.
>>>
>>>>
>>>> What would be great would be a single-shot 'jailhouse freeze' (or,
>>>> ha, 'jailhouse detention') call, that throws away the whole hypercall
>>>> interface. Having such a thing, we an drop everything that is somehow
>>>> related to cell management: create, start, stop, destroy, stats,
>>>> disable, enable, ...
>>>>
>>>> And that would in fact be no big deal: Annotate all affected
>>>> routines, replace hyp vectors with stubs, drop the section, done.
>>>> Every code that has no other users than from a hypercall can be
>>>> dropped. Or do I miss something?
>>>
>>> I haven't thought this through in details yet, but I would be
>>> surprised if there weren't at least some smaller challenges in
>>> implementing that cleanly. Still, it's mostly about disabling code.
>>>
>>>>
>>>>> booting via Linux. The idea of adding a preloader is minimal
>>>>> invasive to the existing setup. My root-less mode will be maximal inv=
asive,
>> though.
>>>>
>>>> Why do you think that it would be maximal invasive?
>>>
>>> As it changes the current hypervisor code for sure. Just loading
>>> Jailhouse via a different thing than Linux does not bring many
>>> changes, at least to the core. See this series.
>>>
>>>>
>>>> Oh btw: who would receive the freed memory? Would it remain in the
>>>> hypervisor or be assigned back to a cell? Though that should probably
>>>> only be a few pages.
>>>
>>> What freed memory? When things are only created, nothing will be freed
>>> anymore. There will also be no jailhouse disable.
>>
>> There will, e.g., be a cell_create routine, that will be called once per=
 cell. After
>> the creation of those cells, drop it, we won't need it again.
>>
>> If we have a universal binary, there will be a jailhouse disable will be=
 present
>> in the beginning. Once we decide freeze the configuration, drop it. If w=
e make
>> those things compile-time configurable, then it has potential to become =
a
>> variant hell.
>>
>>>
>>>>
>>>>> If root-less would be sufficient for cases you do not want
>>>>> Linux-based boot, we can skip this approach and head for root-less fu=
ll
>> steam.
>>>>
>>>> root-less means that the detention call (I like that) comes after
>>>> cell creation, but before cell start. .oO(we can even drop the
>>>> cell_start code, if we find a smart strategy to drop code right
>>>> before vmreturn)
>>>>
>>>
>>> I would rather envision some alternative configuration that contains
>>> all cell configs, not just the root cell (which would become a
>>> non-root cell as well). Loading would have to happen into the target
>>> memory regions before jailhouse enable, and the enabling would also
>>> imply starting all cells.
>>>
>>>>>
>>>>> If there are use cases for all three variant, we can try to look for
>>>>> common pieces in the two Linux-free options. My root-less mode would
>>>>> also need a single-step "create and start all cells", e.g. And your
>>>>> idea to include the bootstrap logic into an init section of
>>>>> jailhouse.bin is also attractive for both.
>>>>
>>>> Yes, I see the overlaps. By the way... Why don't we actually do:
>>>>
>>>> $ cat jh.bin sys.cell c1.cell c2.cell > jh.image
>>
>> Even better:
>>
>> cat preloader.bin jh.bin sys.cell c1.cell c2.cell > jh.image
>>
>> Again, the preloader.bin is still a binary image that only contains the =
preloader
>> section, but u-boot can directly jump into it. It is still developed und=
er
>> hypervisor/arch/foo and hence has full visibility of all symbols that ar=
e
>> available in regular jailhouse code and can potentially use them. We jus=
t
>> exploit the linker to export that section to a separate binary.
>>
>> If someone wants bare-metal boot mode, we just glue things together.
>>
>>>>
>>>> for the bare metal case?
>>>
>>> That comes close to what I have in mind, config-wise. sys.cell would
>>> still need a counter of cells that follow (simple to add to struct
>>> jailhouse_system).
>>
>> Not necessarily. We can also define a zero-termination. Once the first b=
yte of
>> the JHCELL magic isn't present, we're done. But that's details.
>>
>>   Ralf
>>
>>>
>>> Jan
>>>

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4bfa6a8a-e4a8-9b4b-eb10-820242fab80a%40siemens.com.
