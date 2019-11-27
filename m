Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBIFH7HXAKGQEOHKYYNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id C884910AE07
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Nov 2019 11:44:50 +0100 (CET)
Received: by mail-oi1-x23c.google.com with SMTP id l67sf10954895oih.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Nov 2019 02:44:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574851489; cv=pass;
        d=google.com; s=arc-20160816;
        b=Tx90Ba5bU8VPf3ZtH/zGpLpWDxdbIOgPLbii3vEOcOx9D4NmtUOTepevTm4mHU5RWg
         2BqLe85hLATKgcSox4WE/xZU0bw7ojAp2heXFnu6IAV2PpMuTUs7e5w0ePNVEYlP6F4e
         BYHT+lGin72fCeEi4i1DH+60AO3EXNkinvWL9PhfepkmL+KbyPspYqj6VFN9kgLJ69ml
         gGNkbIvIzTDgRQo5XifdV2ebPLcmajy+yhkyu2S2cl1s259oH5/Rc8WKmIQ/4PNSTB3b
         FX+Pco9OpcgIQPOXm/w7h1VHR9a22CAqlCmXO0qc3OSACDzpq+mPTtLch+RCW+4xUuoY
         +/Mg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=iUPqCSX+zSIZFZXQiRR9V36DVbP/k2eJRRtuUQkHxTI=;
        b=AnUEkDWTG/mvsiR+rhMxozTA0GLtJR9KX4z4azwHmYAB0z5Ul/ZG1LRZE9PxhDi9y3
         jHWrjCQYdzArbUU1e7E/xeIqpXD5wk89F1f6cmN75OUlbb0MKrL8wfVzrZu4rPO0H8ah
         0EGeAZXNTjzDkYg4lkUvkKWZc3kMtWfMdgEobr65TaQDXnz3re4cJ4aVVxloHJbUmSgU
         JarxCqarOhHACXjN8cAZn5D7V2vlRS32gfMcIAFp4SPFvPbRKwnGsSllWnk1cOpDjLU1
         Jy58GrL9ciGiTvoWQR4vFggaY0gEfi+VAmCp2oRgd2afzUCkZI6hkYJVzQGqStbbPT2z
         jezA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=US5hrrYP;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iUPqCSX+zSIZFZXQiRR9V36DVbP/k2eJRRtuUQkHxTI=;
        b=NjUy56fzFc1u1Z5Coy4h8ujd6R9Lxdj97lQpF4AF4eiNxX7dTXZG4EIjwqXleCzP4k
         qXP9ZLDza5P8Pqs74X4NQja3XrmdeuKFB4xvJ1VLNepTMhmEBPEoTK9kO6MHYyuSq6H8
         MizlHv+X+7L67NCZEgvp3v7zALVTtVdV7bzbp7sPBTm/7RPq3JqXTTXkWELeC95mmETM
         MHYZssq8rsmmKBcaQCWPkW5rez3t9tJoxYzF5wjuRiiVGjwrQxDQ7VFPzqbIBJLejDZR
         JnlZVNlX/Z1mbuyX4YObLl1Wq3F58In3xw0PlC9XpHFCQNDvdRBfbHRDi7Lo2T94NgVP
         jcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iUPqCSX+zSIZFZXQiRR9V36DVbP/k2eJRRtuUQkHxTI=;
        b=l0xhrnoZAKLlQj7rA6wUPwZKaAyuh0GiYcr85Q2aDEjA+Jq6a2ls9CScyVm2MESODJ
         UPtGUySRwzzeLzdZy5XRCEfatDjtF7ShE+dd8ibEhKyFOjwKk0Shku+T3N+GnmTGD6w5
         0cBBqUz/9kA/IfCMLqIe4FOcTKlGpI5YL4jj4nuRCVCh9OCg+X9AsIwQZgz2gUlutqFf
         HrO/Yh0UMzYHjYVhzt7YhbFgmz+Xn6cDwGu2X00nxZx8w9F2owMDV+5SL4tlL4OcHwDE
         mLqM0EaqCc0ZVHAVaQe7IN2HDwbheRIPjuin39DHI+B7YUdlS60RV8jyzZ+zbAbjHn9W
         Obpg==
X-Gm-Message-State: APjAAAUoxNGxfoPc5l/ErU82LE0z0GbrqJUSrjgIMghSX8ncGYokK47/
	RVmLvg83vK0GkCtODvAtpco=
X-Google-Smtp-Source: APXvYqzMuyU7dzl9+KHarTHp0MCpw7t2k66Qp5fzwH4IpYopScdVHC81k/0l5+2dG0CG76wjEK9EeQ==
X-Received: by 2002:a9d:7d01:: with SMTP id v1mr2858034otn.167.1574851488449;
        Wed, 27 Nov 2019 02:44:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:d909:: with SMTP id q9ls2022306oig.11.gmail; Wed, 27 Nov
 2019 02:44:48 -0800 (PST)
X-Received: by 2002:aca:52c4:: with SMTP id g187mr380174oib.76.1574851487976;
        Wed, 27 Nov 2019 02:44:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574851487; cv=none;
        d=google.com; s=arc-20160816;
        b=vpL/qDuwjlN2TKAnweSdXBI0QMWQ/X1OFFdBxaw+lDe1edhk57aN02WjVxgKDboDKX
         IuajlhvFToxEIsfc1sz4CudbSLOAzndF1V++tegtMZEZKSHvjTv1O89MBxCGRN1ONqFG
         dBmgsMGcu6ItlmmN2rmmU6oYC7MEvdhWG94HVKp7jyYBB9Q1r9CDb+hGPM/RNh7Gdr82
         rSvsjovly0pcNzQhp/k3BRtMS8+kOckQyY78NfIt7vav906UtwCI7Y7FP79L7bHOCwnQ
         LW9n4y8D7dSoKrV/56/3uwQH9nQzUFct9cKoNKkQMY8HOu/OgWYiVlPyQPR3nA5JXMcc
         UZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=RYeCbYll1sKWD8OAngLeDiMXIYIPQzhnJcZr7YOKds8=;
        b=b//oMy+z60C5dAA8G9mppVKEMXW3EE9ct8p1u7+68DJmGxNb6RIiQ90ESPM653ZRfw
         IvmK9BBaFXhBYpJx9xL7HRhbs/fq+ZCf9TVjGzHVVE05HKafuz2RapEos5Ohv5ejqW7L
         Vqa05gO5d84iZS4wq8s8DtjhHQcBjn7iASbecTdhigm9XPS41+Nf0nSrpo6bnpoWWLwc
         6e2azWYx4C3Xcog1g57nCbcbjywdrhQIOU0UMrer/p7/7GTmUM3VxnDI49UMOUP8Htq2
         qHNvStJz6e0bWYYQkZxO0JN+RShTowIyBfdAiQC7qnJo2GGygldvh+QtaPMLWoDrhb6d
         ntlA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=US5hrrYP;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id c24si125381oto.3.2019.11.27.02.44.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Nov 2019 02:44:47 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xARAilhI005362;
	Wed, 27 Nov 2019 04:44:47 -0600
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xARAilfG048842
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Nov 2019 04:44:47 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 27
 Nov 2019 04:44:47 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 27 Nov 2019 04:44:47 -0600
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xARAiiHu007420;
	Wed, 27 Nov 2019 04:44:45 -0600
Subject: Re: ITS emulation in Jailhouse
To: Jan Kiszka <jan.kiszka@siemens.com>,
        "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>,
        "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <ddc49d2b6a6f47a2b847b44aa1416074@ti.com>
 <81a7f9d2-d6b5-0eac-9bb9-1fa14a56df40@siemens.com>
 <5c5e4cf2-c901-d080-1565-82a16ea45813@ti.com>
 <aefae30d-e481-73dd-8852-2fa65928ec5f@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <3a1c2af7-9ada-6d48-ee53-1d7e6e07518d@ti.com>
Date: Wed, 27 Nov 2019 16:14:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <aefae30d-e481-73dd-8852-2fa65928ec5f@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=US5hrrYP;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
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


On 27/11/19 3:30 PM, Jan Kiszka wrote:
> On 27.11.19 10:53, Nikhil Devshatwar wrote:
>>
>> On 19/11/19 12:14 AM, Jan Kiszka wrote:
>>> Hi Nikhil,
>>>
>>> On 18.11.19 14:26, Devshatwar, Nikhil wrote:
>>>> HI Jan,
>>>>
>>>> Current Jailhouse implementation has support for partitioning the=20
>>>> SPI interrupts on a GICv3.
>>>>
>>>> However, the LPI interrupts managed by the GIC ITS cannot be=20
>>>> partitioned.
>>>
>>> Is this something we would need a GICv4 for?
>>
>> Yes. this applies to GICv3 and GICv4.
>
> Too bad...
>
>>
>>>
>>>>
>>>> Typical usage of LPI are for connecting PCIe devices on arm64=20
>>>> platforms where the endpoint sends MSI interrupts.
>>>>
>>>> Kernel drivers for GIC assumes full ownership of the ITS module.
>>>
>>> Means, it also touches registers it does not own? Or are there=20
>>> conceptually shared resources in the ITS that everyone needs to=20
>>> access when programmed own parts of it?
>>
>> Software needs to access the ID registers, setup base address of the=20
>> different tables and queues.
>>
>> Most of this is done once for each PCI device
>>
>> When emulating, all these accesses should get trapped and policed by=20
>> Jailhouse
>>
>>>
>>>>
>>>> To enable partitioning of PCI devices/functions (from same or=20
>>>> different PCI controller) across VMs,
>>>>
>>>> One of the key important feature that will be needed is the ITS=20
>>>> virtualization.
>>>>
>>>> Since the GIC ITS does not support per VM tables, one option would=20
>>>> be to use emulation of the ITS module.
>>>>
>>>> Here is the proposal for such an approach.
>>>>
>>>> =C2=B7GIC kernel driver allocates separate ITS table in its VM address=
=20
>>>> space
>>>>
>>>> =C2=B7When Jailhouse is enabled, Hypervisor allocates a new ITS table=
=20
>>>> and copies the descriptors from root cell
>>>>
>>>> =C2=B7All accesses to the ITS registers are trapped and emulated in th=
e=20
>>>> Jailhouse
>>>>
>>>> =C2=B7Any attempt from a VM trying to setup the descriptor for a certa=
in=20
>>>> device needs to be policed against VM ownership
>>>>
>>>> =C2=B7Jailhouse validates and updates the physical ITS table descripto=
rs=20
>>>> to match the VM maintained tables
>>>>
>>>> This will be similar to the approach taken for SMMU stage1=20
>>>> emulation developed by Pratyush Yadav.
>>>>
>>>> What so you think about adding this support in the Jailhouse?
>>>>
>>>> Would you be willing to accept patches for the ITS emulation?
>>>
>>> Well, we do want assignment of PCI devices to different cells when=20
>>> this is feasible, and we do want not only DMA partitioning but also=20
>>> safe & secure interrupt handling. OTW: Yes, we need something that=20
>>> enables that.
>>>
>>> And when the hardware does not (yet) support us in enforcing the=20
>>> partitions during runtime, we need to emulate that in software. It's=20
>>> just the question how complex that emulation needs to become, for=20
>>> Linux or for "educated" guests.
>>
>> To give an overview, following will be the changes:
>>
>> * Initialize ITS as part of the jailhouse enable, setup tables and=20
>> command queues
>>
>> * Most ITS MMR emulation will be allow/forbid read/write of a=20
>> bitfield based on the VM accessing it
>>
>> * Emulation of base address register write would be to map guest=20
>> table, copy few entries from guest table to hypervisor maintained table
>>
>> * Emulate event and command queues similar to the SMMU emulation
>
> Ugh, sounds not as simple as I was hoping for.
>
>>
>> * Add support for LPI injection into vCPU (Since VM's CPU affinity is=20
>> fixed, this can be optimized and can be a blind injection)
>>
>
> But this is something going away with GICv4, thanks to direct=20
> injection, no?
Yes, the GICv4 has virtual LPI injection support.
>
>>
>>>
>>> BTW, those accesses to the ITS will not be on the interrupt handling=20
>>> path, will they? Only for the setup and maybe affinity adjustment?
>> IRQ acknoledgement does not need to access the ITS device table or=20
>> interrupt translation table.
>
> ...but an injection trampoline is needed. No difference to current SPI=20
> injections, though.
>
> BTW, how does interrupt remapping play into this? I suspect there is a=20
> similar concept on ARM as well, right?


ITS supports collection tables. ITS translates the LPI into a INTID and=20
collectionID

collectionID is used as index into collection table to find the=20
interrupt remapping to different CPUs.

When we are emulating, we may decide to support collection tables=20
optionally/incrementatlly.


More details at=20
https://static.docs.arm.com/dai0492/b/GICv3_Software_Overview_Official_Rele=
ase_B.pdf


>
> Jan
>
Regards,

Nikhil D

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3a1c2af7-9ada-6d48-ee53-1d7e6e07518d%40ti.com.
