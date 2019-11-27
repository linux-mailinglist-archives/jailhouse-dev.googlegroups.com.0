Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB6627HXAKGQERXIXTHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC1C10AF9A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Nov 2019 13:35:08 +0100 (CET)
Received: by mail-ot1-x33e.google.com with SMTP id t10sf450382otc.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Nov 2019 04:35:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574858107; cv=pass;
        d=google.com; s=arc-20160816;
        b=yemverdRanPcsejsu97M0WEXPVtAI5J36PjdbXsnECKVFVbryDEsXKK+hpzeuF/N69
         fgkwAzngQlZeNkvFTUxkNBkTahMDiCPaoUfou2JRF6IlS9FMKOjZCOaLTAFWKkIjTaDG
         mNjeIYiviSXxEcj/yy1IpXGfDV8YHhpQZpJB2j6RFnrepgcK/LrKUIQG1yiZ7nDqwkkf
         xqBr3VXhK8yHjq998U5xEQ/77smc3tHwWC2pn1bZj579dHrUgnbQGZldu4aIxT8bIkqn
         fMKQM6mR6ECE5iW4jOIRNFXoInANmKFs1/ALPt3BZi7dinwyjhf9cfOggLCREFpJcDWs
         0i1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=B3itI8REKRPoLfdTBXEKXRZpwzBraxvZtCI12VD5hDk=;
        b=ZUqsmpmf7OU1Na3tQcREbEGzKaFoPc4jMwew6PKbgCOic0pYwQKtyPwoGuuXWDuscr
         XItp08qlegrjE1P6+xL4q4SRr96tCE9i0Siyh2eKolfU+pRs1F7FEpikhuaYghKoJ0LM
         q8ut8r9TxpnTNCnk0HlFwnH6JEcbSW5qfL3LqsCRcv0pR/ZiAhLkhEms5RTwEqXW+e2q
         TTovDRMfnANWEURXouRyANcdXaWbtFCJ4grRlhowmj3dleRM+M2+w7BPkKd/8Go3W5f7
         Uk8VM+fdEqU77f3t160mZCUeAY70kMpz8Rs6BxEWefUkD0TcE1MvCID9U5GFFgbRKZLB
         7IGA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Xcnqau79;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=B3itI8REKRPoLfdTBXEKXRZpwzBraxvZtCI12VD5hDk=;
        b=as9n6SpMt6nGl2LuDqu9bV7oQqWeg/ddg9lsTsyvICnTzsOa9GPbOnImdEvEblYd24
         JZlq+SMYkz3CNzFRIfEz+qVu9VShhOVNk0PlSjNL3Zz90kZBtme6yKQxyF0ixOxTo9ou
         bypfJo9fMX5x3H05j/8zhTBpD97ybYPONUdl8HIB0cpOMRdJqxsUjGq5DRp+w2K4Unxq
         5tkJJCNSdteuLPj4+RqqmCG9VSw4DjswV5ONZshtJWyNKsya6RpDKktWaJ0MGUt5XnzQ
         oEjLdixacL6AfipN4t4+Kn10rPh2GfaH+rqKC5PSEsebAzG9dJVnnxRFUsjdM4x6YwUy
         l1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=B3itI8REKRPoLfdTBXEKXRZpwzBraxvZtCI12VD5hDk=;
        b=hY2ej80tMSH14YOW2CKvvmlsZTcIztzbIPJQvXdB6xvjRAnhXdFLdS1ghT8tWZSDwn
         8VkH3FlKmmESTFeU3+qqa7HZbAbAKHc5mw4o8s76/r1mmErCZP0+kFGeX3voEj9YR1q4
         o69AGfidQt2TxufI6Mn8LI3RVTHI1YAm9aNrAhOGDtBkofZlaJ+3eOkgx0fpBR17+T/J
         QTdQGemWVvQA/r8Lt4tveO2N7UvDC8Imp51GbnnVV+Vd1uWR3UZIZE6RvLflAHQPEi0u
         hrAnU5szN7vuoe292l4ZYeHK6eHH1Lrbvd/z0VINzfiycGOksCk4oiCw3360OYbnjTqM
         qaGw==
X-Gm-Message-State: APjAAAX203g9acW86yY0YMCRtJFgXh7wM/UoKTZ43WME/VJ9DOx+ZTDm
	PG+/QeZsxDY741GTCKkVMHg=
X-Google-Smtp-Source: APXvYqzDQyZrEpifeUXtT5McDjwEQ3dXpk61k7pdpQkL/VE1WhcJEXGAtVfm01hwBdAoG2GzqZL5wA==
X-Received: by 2002:a54:481a:: with SMTP id j26mr4155449oij.20.1574858107383;
        Wed, 27 Nov 2019 04:35:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:3843:: with SMTP id f64ls3857872oia.12.gmail; Wed, 27
 Nov 2019 04:35:06 -0800 (PST)
X-Received: by 2002:aca:4b93:: with SMTP id y141mr4056500oia.132.1574858106796;
        Wed, 27 Nov 2019 04:35:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574858106; cv=none;
        d=google.com; s=arc-20160816;
        b=idXt9Lb555ION7oVO6pbabsYwHP6HN04s/6VOa7OvwhDKNcveH3idcdtB1m2NVjAkx
         AVUztwyljQKggcceGfL7jiD8ORkhuxM25YO6hPcLGznwydEnXUMqZfIB/CWRY19SUkAo
         3urIjwYHxI/Yh2L+ToAv92DPxusVlZR9b1R6/oCdCXtb7TGI1rsSRHHQLLb4yrsisseR
         t831Pjs1ln+rm1+NruS8gQB5QJxeHRCNyT43wAUdQmT1MgYZWyLlqHIRsVso2tsK6Mzn
         w2YqZa8L2vVd/1NN2O9qL5sc+SsaKYPzNFzREahgmiSUUUxxmrEeBW2LoVo6iR4ObYcP
         RW4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=mILHTIufINvJPmminFBMbQD3F4b314P3CMXnnI2Yi28=;
        b=EZXnPB22GiE6jlC8fVBSQl0F8+Bao1cXTyI2qGQwJc0tVUptSVPzYThJgf2n/Db5cF
         RyF75rje0yhT8sdPrwQTELBevqQq9PkMn0P+HkLYXMInZKG9s28LhZLmzRY3ICpAy5v5
         aA8p68co80xpVdPfsYtmtc71bq9hKYMsfZkGFd/KpvdJWnh5qQg8L92UX3i/SME3sVAA
         yXgrNuERbL7Ael4x7qFsAxwlgsvxxrZfHNA9u70VSsM2IvFnZdXH2EoNB5zz8IZ5jYLF
         SAL0QpbaZyqFeh+JAzGF50t5ceEZfbdRbn4R/lOSz2gio9HoXv7CeWl2kbb/hOt06PZc
         w02w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Xcnqau79;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id j26si541290otk.0.2019.11.27.04.35.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Nov 2019 04:35:06 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xARCZ6Eu019086;
	Wed, 27 Nov 2019 06:35:06 -0600
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xARCZ6Fp046202;
	Wed, 27 Nov 2019 06:35:06 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 27
 Nov 2019 06:35:06 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 27 Nov 2019 06:35:06 -0600
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xARCZ3uh052504;
	Wed, 27 Nov 2019 06:35:04 -0600
Subject: Re: ITS emulation in Jailhouse
To: Jan Kiszka <jan.kiszka@siemens.com>,
        "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>,
        "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <ddc49d2b6a6f47a2b847b44aa1416074@ti.com>
 <81a7f9d2-d6b5-0eac-9bb9-1fa14a56df40@siemens.com>
 <5c5e4cf2-c901-d080-1565-82a16ea45813@ti.com>
 <aefae30d-e481-73dd-8852-2fa65928ec5f@siemens.com>
 <3a1c2af7-9ada-6d48-ee53-1d7e6e07518d@ti.com>
 <40699271-4907-9f8b-1283-078f135ff21d@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <55bc75bd-1cf3-f414-68c1-7ca22c0ab7a3@ti.com>
Date: Wed, 27 Nov 2019 18:04:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <40699271-4907-9f8b-1283-078f135ff21d@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Xcnqau79;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
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


On 27/11/19 4:34 PM, Jan Kiszka wrote:
> On 27.11.19 11:44, Nikhil Devshatwar wrote:
>>
>> On 27/11/19 3:30 PM, Jan Kiszka wrote:
>>> On 27.11.19 10:53, Nikhil Devshatwar wrote:
>>>>
>>>> On 19/11/19 12:14 AM, Jan Kiszka wrote:
>>>>> Hi Nikhil,
>>>>>
>>>>> On 18.11.19 14:26, Devshatwar, Nikhil wrote:
>>>>>> HI Jan,
>>>>>>
>>>>>> Current Jailhouse implementation has support for partitioning the=20
>>>>>> SPI interrupts on a GICv3.
>>>>>>
>>>>>> However, the LPI interrupts managed by the GIC ITS cannot be=20
>>>>>> partitioned.
>>>>>
>>>>> Is this something we would need a GICv4 for?
>>>>
>>>> Yes. this applies to GICv3 and GICv4.
>>>
>>> Too bad...
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Typical usage of LPI are for connecting PCIe devices on arm64=20
>>>>>> platforms where the endpoint sends MSI interrupts.
>>>>>>
>>>>>> Kernel drivers for GIC assumes full ownership of the ITS module.
>>>>>
>>>>> Means, it also touches registers it does not own? Or are there=20
>>>>> conceptually shared resources in the ITS that everyone needs to=20
>>>>> access when programmed own parts of it?
>>>>
>>>> Software needs to access the ID registers, setup base address of=20
>>>> the different tables and queues.
>>>>
>>>> Most of this is done once for each PCI device
>>>>
>>>> When emulating, all these accesses should get trapped and policed=20
>>>> by Jailhouse
>>>>
>>>>>
>>>>>>
>>>>>> To enable partitioning of PCI devices/functions (from same or=20
>>>>>> different PCI controller) across VMs,
>>>>>>
>>>>>> One of the key important feature that will be needed is the ITS=20
>>>>>> virtualization.
>>>>>>
>>>>>> Since the GIC ITS does not support per VM tables, one option=20
>>>>>> would be to use emulation of the ITS module.
>>>>>>
>>>>>> Here is the proposal for such an approach.
>>>>>>
>>>>>> =C2=B7GIC kernel driver allocates separate ITS table in its VM addre=
ss=20
>>>>>> space
>>>>>>
>>>>>> =C2=B7When Jailhouse is enabled, Hypervisor allocates a new ITS tabl=
e=20
>>>>>> and copies the descriptors from root cell
>>>>>>
>>>>>> =C2=B7All accesses to the ITS registers are trapped and emulated in=
=20
>>>>>> the Jailhouse
>>>>>>
>>>>>> =C2=B7Any attempt from a VM trying to setup the descriptor for a=20
>>>>>> certain device needs to be policed against VM ownership
>>>>>>
>>>>>> =C2=B7Jailhouse validates and updates the physical ITS table=20
>>>>>> descriptors to match the VM maintained tables
>>>>>>
>>>>>> This will be similar to the approach taken for SMMU stage1=20
>>>>>> emulation developed by Pratyush Yadav.
>>>>>>
>>>>>> What so you think about adding this support in the Jailhouse?
>>>>>>
>>>>>> Would you be willing to accept patches for the ITS emulation?
>>>>>
>>>>> Well, we do want assignment of PCI devices to different cells when=20
>>>>> this is feasible, and we do want not only DMA partitioning but=20
>>>>> also safe & secure interrupt handling. OTW: Yes, we need something=20
>>>>> that enables that.
>>>>>
>>>>> And when the hardware does not (yet) support us in enforcing the=20
>>>>> partitions during runtime, we need to emulate that in software.=20
>>>>> It's just the question how complex that emulation needs to become,=20
>>>>> for Linux or for "educated" guests.
>>>>
>>>> To give an overview, following will be the changes:
>>>>
>>>> * Initialize ITS as part of the jailhouse enable, setup tables and=20
>>>> command queues
>>>>
>>>> * Most ITS MMR emulation will be allow/forbid read/write of a=20
>>>> bitfield based on the VM accessing it
>>>>
>>>> * Emulation of base address register write would be to map guest=20
>>>> table, copy few entries from guest table to hypervisor maintained=20
>>>> table
>>>>
>>>> * Emulate event and command queues similar to the SMMU emulation
>>>
>>> Ugh, sounds not as simple as I was hoping for.
>>>
>>>>
>>>> * Add support for LPI injection into vCPU (Since VM's CPU affinity=20
>>>> is fixed, this can be optimized and can be a blind injection)
>>>>
>>>
>>> But this is something going away with GICv4, thanks to direct=20
>>> injection, no?
>> Yes, the GICv4 has virtual LPI injection support.
>>>
>>>>
>>>>>
>>>>> BTW, those accesses to the ITS will not be on the interrupt=20
>>>>> handling path, will they? Only for the setup and maybe affinity=20
>>>>> adjustment?
>>>> IRQ acknoledgement does not need to access the ITS device table or=20
>>>> interrupt translation table.
>>>
>>> ...but an injection trampoline is needed. No difference to current=20
>>> SPI injections, though.
>>>
>>> BTW, how does interrupt remapping play into this? I suspect there is=20
>>> a similar concept on ARM as well, right?
>>
>>
>> ITS supports collection tables. ITS translates the LPI into a INTID=20
>> and collectionID
>>
>> collectionID is used as index into collection table to find the=20
>> interrupt remapping to different CPUs.
>>
>> When we are emulating, we may decide to support collection tables=20
>> optionally/incrementatlly.
>>
>>
>> More details at=20
>> https://static.docs.arm.com/dai0492/b/GICv3_Software_Overview_Official_R=
elease_B.pdf=20
>>
>
> Reading... When we initialize the ITS for physical use by Jailhouse,=20
> this means we will migrate the prior usage of the root cell into an=20
> emulated one, right?
Yes, that's right.
> Read out the current state, copy it over the Jailhouse resources while=20
> validating its current content, enabling the new setup.

You only have to create a copy of the device table.

Individual device specific Interrupt translation tables are anyways=20
owned by the ITS kernel driver, Jailhouse should not touch it.

> Reminds me a lot of VT-d interrupt remapping - and I thought that=20
> would be complex...

I am not familiar with VT-d interrupt remapping, so can't comment.

But this will be similar to the SMMU takeover. Only the pointers to the=20
ITT tables are to be maintained by hypervisor. It should not worry about=20
each eventID and LPI as such

Nikhil D

>
> Jan
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/55bc75bd-1cf3-f414-68c1-7ca22c0ab7a3%40ti.com.
