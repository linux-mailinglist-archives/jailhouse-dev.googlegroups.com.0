Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRNQ7HXAKGQEDWI3EBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id A73B310AE70
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Nov 2019 12:04:37 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id g17sf12045208wru.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Nov 2019 03:04:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574852677; cv=pass;
        d=google.com; s=arc-20160816;
        b=YulEA3J7OlJM+N7xs6VPdqrUVZAjBEyGUqh8OS0Id+wRNt2OZB9lS9Fc9t8lN1wQGQ
         SVN3LXkjnjt/KKVbZ9y9XaB1VByoyyM+pk1NwrkO2lFAa3OaF2hEdV7KlPyH71R2vS0o
         C135kTjWsvfMnqbFptm55K4nBzSQXyr6SqJmpW69g/7gfGrG4wmO3PotjQxwdNZWRiN4
         tYFl/tWmDVI+jlYnUt0dAkwzihuIt2XYU+gDr4pFzgSTZpy/to6iHt8odxoWBCgtlAR2
         cAl9SoDZJN3P6iZy4ih/diJXoR5uLdoc+6ss//GYXV37/7bitUFbmbMX9kKKC3DabQDs
         r5qA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=VTNzlca6WB2ol1FE3+Saorj3qrgILFlKZYfFyxPUb+w=;
        b=mq9h6nq9q9WxknV1+ZMdRlO9jB6pRQrsZXpArB+LG/3aaQkkDCNlnK99aoTx/H7Bp2
         YJZQvE9pcMF6IuJUKw9REjlMkJagDl8XtrGp7wdWdPnwPYVKaqnQmyI3k76WXJ0Cq8EQ
         an1lEAiUOPcJ6yYiAFpUmnthORvxKtPMoHyLlv4KdYy/iYFCCeMBuEoE9xRwfyvUxpF5
         C6NLgktwpKhrEmGqbkywd77bCciEL0pPN9bEKkHoT9hCDByTuaoLZJTFjdEFbBAeZJTM
         ul8Afe04HGLacTtYCMt2H+11H4BS1YhnwdzX925voIo0Kv3626vroiwLKTBdQN3ogZxk
         RlBQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VTNzlca6WB2ol1FE3+Saorj3qrgILFlKZYfFyxPUb+w=;
        b=tij4lOUsvzua41eFP9Yf0TaFtBrtYzdqta4+PN1S37JPcCuv5qQki1Et3Y08F/JZXF
         Ke4A3bgRo5t0ifbJwv0AvfC6UR0JXwlh9znDGoHUJSsBjKJGKF/QMoDV7ewV03naBkG5
         OOXNvw26+yN1r0MNz5KTrrK0Tqs3exKencnlFNtSyXOjv0m6OjU7jnU5Stkj/clgk3bv
         dGm073pvXaVFU/Fj2HbxrzqC76EJM34e4NBdRlENj111TkDqTUvv6nDUXnHcGh1zwBGh
         dmr9n1GV+J/y4HpplljCAeGit2eWvPNGEO9vpv10YwXORS+eNav7u+SzXuf4Lm7mbIMp
         hnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VTNzlca6WB2ol1FE3+Saorj3qrgILFlKZYfFyxPUb+w=;
        b=nu8bw8lbyWtiS5OFJIRwxObv3o/7LOqZT1jXuWS5Fwe+qHueSWdGicntQdobHZ1a62
         ZpNu+fZETLJH7MsnqjQn9PU02Ha6sHUmJOSvfDaIek08i2R6Np0cl3ZEB/PeHU0qSfwy
         BkanL6lOePYUFfCDLRozVTzLYPDwd1IMGjNyIrW/aeV+KIYrqYbvqSTx8CT4ndC4xaor
         sqs0wlO1VZARVfQg6qHX69QBC0rzkDg3kaPtDlg5rK0YHjGwoXqOKzTCsQjWmtKSdE0+
         dXi5VajuZ7GstCn7EohgaDDQI03LpJa9NS9AK0ivKWaxvJeneWpBYziv4RDbgUAqBgf0
         bkhQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVrV32Wvm9x0Ur3D74xgBowk+0ZnH4nGyS8R9W87b5jHSBCyF+L
	N3yRradGgKO/FKsArbrKFdE=
X-Google-Smtp-Source: APXvYqwJYWuccQpY+2+vOjZ0BXfXxNVEDYnWwFWrtzUy398radTiazNkiQcsUrDEhh+c8JrsfdI4kg==
X-Received: by 2002:a5d:5345:: with SMTP id t5mr4589141wrv.0.1574852677324;
        Wed, 27 Nov 2019 03:04:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5512:: with SMTP id b18ls9606242wrv.16.gmail; Wed, 27
 Nov 2019 03:04:36 -0800 (PST)
X-Received: by 2002:adf:e80d:: with SMTP id o13mr43863202wrm.73.1574852676448;
        Wed, 27 Nov 2019 03:04:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574852676; cv=none;
        d=google.com; s=arc-20160816;
        b=mF16UoVAn9s4uqlGtDM84ebNNWZAbWCQMUjwt0mGN5w5SoGTHKJQNuhH/TzXOBo95j
         bw9cvRiUoT5cD/TOQOzOxN/MznMo7edZC5fEn0rFI3v4NPiV4Chn0sUtZsrbagnmDSYo
         WPsQ/nsMr+pJTCuePCrvolpVck0C5UQFfWIGEPlxAh6HqhIjxoj2iTRhldnemP7pI+Jg
         o8R0s6UDzTsvHhgYy/5JnOG4TSSgBEiuHJ/zhMa3gdUvhbbFSpmqMr5XUWAXau3SgDZb
         Jujq2bHB0vsBDHko9f/otBPAOX0oDZt8lLgRZafcFg4qUnKx83xtZ4NFUcJ54GMLHnb4
         e3jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=eBMF+uG+/7XoB/bW6dAnFviOby/Qfyuw9LqC8h83LDI=;
        b=b0gz5fXvxDR6OxnhG5fIZUjsPCc0T2blWO7lZTV10mad0VoHy0G0TYmL8Q0q4jm8Ia
         HakNC63SRKpVZ+mtpINbhp+1fEnFB/9iBN4mwIM5IrpQY7QeaezknjTUKNVfx7QgVJGT
         AcQWcBI2MBiRpTFnShJKlnp/wgLCxgnBUtPiEjNAlxIBJI9pmFy3fcRlT8MrNHMP3Hve
         vSkIau3OAbMX8aSNmlOQNHHdEXuUb8L5egNTrjFDNZZvpMoFQ4ejmS37QmBMgVQs5xX8
         9e4+Z9779By2ygyZDGsCLS3crOZIAQaqpV1zD8EyUe92ZYTrezojNt4s40P17nWO8tGh
         dcKw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id m15si91596wml.2.2019.11.27.03.04.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Nov 2019 03:04:36 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id xARB4ZW3011785
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Nov 2019 12:04:36 +0100
Received: from [167.87.21.155] ([167.87.21.155])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xARB4Yb1023274;
	Wed, 27 Nov 2019 12:04:35 +0100
Subject: Re: ITS emulation in Jailhouse
To: Nikhil Devshatwar <nikhil.nd@ti.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <ddc49d2b6a6f47a2b847b44aa1416074@ti.com>
 <81a7f9d2-d6b5-0eac-9bb9-1fa14a56df40@siemens.com>
 <5c5e4cf2-c901-d080-1565-82a16ea45813@ti.com>
 <aefae30d-e481-73dd-8852-2fa65928ec5f@siemens.com>
 <3a1c2af7-9ada-6d48-ee53-1d7e6e07518d@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <40699271-4907-9f8b-1283-078f135ff21d@siemens.com>
Date: Wed, 27 Nov 2019 12:04:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <3a1c2af7-9ada-6d48-ee53-1d7e6e07518d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 27.11.19 11:44, Nikhil Devshatwar wrote:
>=20
> On 27/11/19 3:30 PM, Jan Kiszka wrote:
>> On 27.11.19 10:53, Nikhil Devshatwar wrote:
>>>
>>> On 19/11/19 12:14 AM, Jan Kiszka wrote:
>>>> Hi Nikhil,
>>>>
>>>> On 18.11.19 14:26, Devshatwar, Nikhil wrote:
>>>>> HI Jan,
>>>>>
>>>>> Current Jailhouse implementation has support for partitioning the=20
>>>>> SPI interrupts on a GICv3.
>>>>>
>>>>> However, the LPI interrupts managed by the GIC ITS cannot be=20
>>>>> partitioned.
>>>>
>>>> Is this something we would need a GICv4 for?
>>>
>>> Yes. this applies to GICv3 and GICv4.
>>
>> Too bad...
>>
>>>
>>>>
>>>>>
>>>>> Typical usage of LPI are for connecting PCIe devices on arm64=20
>>>>> platforms where the endpoint sends MSI interrupts.
>>>>>
>>>>> Kernel drivers for GIC assumes full ownership of the ITS module.
>>>>
>>>> Means, it also touches registers it does not own? Or are there=20
>>>> conceptually shared resources in the ITS that everyone needs to=20
>>>> access when programmed own parts of it?
>>>
>>> Software needs to access the ID registers, setup base address of the=20
>>> different tables and queues.
>>>
>>> Most of this is done once for each PCI device
>>>
>>> When emulating, all these accesses should get trapped and policed by=20
>>> Jailhouse
>>>
>>>>
>>>>>
>>>>> To enable partitioning of PCI devices/functions (from same or=20
>>>>> different PCI controller) across VMs,
>>>>>
>>>>> One of the key important feature that will be needed is the ITS=20
>>>>> virtualization.
>>>>>
>>>>> Since the GIC ITS does not support per VM tables, one option would=20
>>>>> be to use emulation of the ITS module.
>>>>>
>>>>> Here is the proposal for such an approach.
>>>>>
>>>>> =C2=B7GIC kernel driver allocates separate ITS table in its VM addres=
s=20
>>>>> space
>>>>>
>>>>> =C2=B7When Jailhouse is enabled, Hypervisor allocates a new ITS table=
=20
>>>>> and copies the descriptors from root cell
>>>>>
>>>>> =C2=B7All accesses to the ITS registers are trapped and emulated in t=
he=20
>>>>> Jailhouse
>>>>>
>>>>> =C2=B7Any attempt from a VM trying to setup the descriptor for a cert=
ain=20
>>>>> device needs to be policed against VM ownership
>>>>>
>>>>> =C2=B7Jailhouse validates and updates the physical ITS table descript=
ors=20
>>>>> to match the VM maintained tables
>>>>>
>>>>> This will be similar to the approach taken for SMMU stage1=20
>>>>> emulation developed by Pratyush Yadav.
>>>>>
>>>>> What so you think about adding this support in the Jailhouse?
>>>>>
>>>>> Would you be willing to accept patches for the ITS emulation?
>>>>
>>>> Well, we do want assignment of PCI devices to different cells when=20
>>>> this is feasible, and we do want not only DMA partitioning but also=20
>>>> safe & secure interrupt handling. OTW: Yes, we need something that=20
>>>> enables that.
>>>>
>>>> And when the hardware does not (yet) support us in enforcing the=20
>>>> partitions during runtime, we need to emulate that in software. It's=
=20
>>>> just the question how complex that emulation needs to become, for=20
>>>> Linux or for "educated" guests.
>>>
>>> To give an overview, following will be the changes:
>>>
>>> * Initialize ITS as part of the jailhouse enable, setup tables and=20
>>> command queues
>>>
>>> * Most ITS MMR emulation will be allow/forbid read/write of a=20
>>> bitfield based on the VM accessing it
>>>
>>> * Emulation of base address register write would be to map guest=20
>>> table, copy few entries from guest table to hypervisor maintained table
>>>
>>> * Emulate event and command queues similar to the SMMU emulation
>>
>> Ugh, sounds not as simple as I was hoping for.
>>
>>>
>>> * Add support for LPI injection into vCPU (Since VM's CPU affinity is=
=20
>>> fixed, this can be optimized and can be a blind injection)
>>>
>>
>> But this is something going away with GICv4, thanks to direct=20
>> injection, no?
> Yes, the GICv4 has virtual LPI injection support.
>>
>>>
>>>>
>>>> BTW, those accesses to the ITS will not be on the interrupt handling=
=20
>>>> path, will they? Only for the setup and maybe affinity adjustment?
>>> IRQ acknoledgement does not need to access the ITS device table or=20
>>> interrupt translation table.
>>
>> ...but an injection trampoline is needed. No difference to current SPI=
=20
>> injections, though.
>>
>> BTW, how does interrupt remapping play into this? I suspect there is a=
=20
>> similar concept on ARM as well, right?
>=20
>=20
> ITS supports collection tables. ITS translates the LPI into a INTID and=
=20
> collectionID
>=20
> collectionID is used as index into collection table to find the=20
> interrupt remapping to different CPUs.
>=20
> When we are emulating, we may decide to support collection tables=20
> optionally/incrementatlly.
>=20
>=20
> More details at=20
> https://static.docs.arm.com/dai0492/b/GICv3_Software_Overview_Official_Re=
lease_B.pdf=20
>=20

Reading... When we initialize the ITS for physical use by Jailhouse,=20
this means we will migrate the prior usage of the root cell into an=20
emulated one, right? Read out the current state, copy it over the=20
Jailhouse resources while validating its current content, enabling the=20
new setup. Reminds me a lot of VT-d interrupt remapping - and I thought=20
that would be complex...

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
jailhouse-dev/40699271-4907-9f8b-1283-078f135ff21d%40siemens.com.
