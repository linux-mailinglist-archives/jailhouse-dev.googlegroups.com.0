Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB5UP334QKGQE6P72IEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 737232450BC
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Aug 2020 09:00:07 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id d21sf1881824ljg.14
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Aug 2020 00:00:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597474807; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y5GT2boJtJzFvf2CGtLnOAEKSWx8sMvnuOWQiSMkeSdVd+V5bL/LJaz3WamjsG0yEe
         6/N5VdnnVbPGSxCoZ32RTqZ47IDGr6gWhilWTvEyrp4tM4Yu4x1aeib9BdU1jIjk5laF
         URBneoe8OwYaEc9/BmwRPpOqeMiXfNsz9zp/BMPtDj5AQmi+VgNxUvcEg5yiiLNURGBT
         jdm5Nxm6jaR03wm/RHphqt3T0SWoh7Fi6Dz5Cx5bJXZdR7Hxj0uYjfMcWxSWAQyMJtCI
         S+SG5eINDLDgWctChb0+lM+aUXfZ7S6qOVQCKse/S+7F2T1yYoeghgroa2BZCFubGDe7
         3DHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=sQEHmS/3YiRSmlq8UjsFgXbSZRYdhYHc3q8Mc3aendY=;
        b=naghSjKHJt3CJnxqd++4sbkCwtu8F2aSTj/LigMg1Myf2oab9zlQDFPN12C+EMcFFE
         cacNWtv9f/gwRYOFqnTDBbb9LOiCJL5WEPWU0CeRorCgBa02MI/VC3hWDQsqGNpSOMW6
         RbGXKpY9EEc+oFU+zsxLDOjx+ILil1QaoshK+hSCVMgpZkE7gHogxPHSqTltcTV7BHQE
         qCuwLiRW1xWYSczA85jJ3EaiaeCb0HKIugi/WEKw/10r1rQkeFeF+FIVIwn+hHyNCtPt
         vPBL4aRKMxYM3Mijlccfo9Bn5oQjYF1h3oJ+ZcRjqiNtwwiqW8ZfLuzppk2HCzfDOKI7
         PACg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=GJiKvGjC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sQEHmS/3YiRSmlq8UjsFgXbSZRYdhYHc3q8Mc3aendY=;
        b=Ldck2B8uu7rq7/WSieRMXvmlyTrhnFeWzwLvf+g6ob2YHXWtI629lYaENo1CXjv8/a
         ams58dcJSWwXnhM5oQOUHxrhU1RLCi4Fpw8ZnxDH6QHybJX5HU9Z+1NPUgFqMYPa/U9H
         K5LVgIVpfX34vc7KFwz2tFyeeJ0VlUuOw48nGSmS+Iu5HNW68lquA3lzVUg9d+LIVPxY
         E0N1HdurTM+xHbUGmueqXXQfMW6S0gpNo5q4OJr+4O3fmKFSFyTlvw5isA69M4c+m9Ux
         Nm6mLnRUDGSrA8GDVFALsXQapV3COU4C9zFOTrTXQudKEegGGVy//7SMjUpN4vrTv4+W
         3TOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sQEHmS/3YiRSmlq8UjsFgXbSZRYdhYHc3q8Mc3aendY=;
        b=Wh1DPctcEy+qJMtt/G4+j31BGoShiysag0JaLM1dYZMs5etUojpBsUKqUeyBQnUxGx
         VDkQZ9ingjqQEYfsy2kne0HGr+Cqq+rACDF8i8W958FcWcSP4S4i9UV2ixH/NFKqUdjk
         J5QLMjyUlZ2g3UKcDQfvy8TFA9YOT+OpHEVtGIMy4qs2SxZdC1svghN4ELLK4v5r/uc0
         Im9LEudGPZdfgoj9/JaAapsrzdLQaPaQKh9PnsMS71h6hjwOg0I2wMY3s9vRXKlQ9qZa
         c5fZCQh3WTdN2mLE4uwBfjLIfyAYgeAvLsbgj52/QmhhVtRs4tlZAbVlR29o4MezaUkF
         HA0g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5315qrE5NpMrbgMzppd2imtYyVHnZYfEX8Q54zIabTfdpLCITRWg
	r6ggKGYOshVJGX7NUrhDwf0=
X-Google-Smtp-Source: ABdhPJzrb+fUNEzA1lK9JcHpcHIB4k4veByu5VtccRProJOs7f2c0VqahwcgsPAG1vLfthEH0Umf4g==
X-Received: by 2002:a2e:918a:: with SMTP id f10mr2948506ljg.78.1597474806843;
        Sat, 15 Aug 2020 00:00:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:60e:: with SMTP id 14ls590251lfg.0.gmail; Sat, 15 Aug
 2020 00:00:05 -0700 (PDT)
X-Received: by 2002:ac2:5b46:: with SMTP id i6mr2808758lfp.135.1597474805710;
        Sat, 15 Aug 2020 00:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597474805; cv=none;
        d=google.com; s=arc-20160816;
        b=0JBAENn3Zwdw/l2nz5lrlJO8vKQoDBv70pIS1TEkKgbupu7G3Z4UNt7Ba8b1nD7atn
         TZvx1LUff2NR3GWLV9SLWHeObQPx37B2ByuQHF9sBU8e8XLN2HW3fcKm3IlYkQxsnkJ+
         c2znLmmTusUiDIlZ6GdcRc0KyRF9Q3RAb5d1kyIp7gIRNYC11HfRqHlkRF9Mj6Epe5xQ
         HmEgiNXoHHaHC29YB09MshMQwynqKsK2L/e7oo9Wpiwx9ni7EC+5R810J0xycGJC9Tr+
         rGjkcwoKUlBkCAfEHp6Hdj8UYX3t2tCCpypgloawnA6gCYR2ewoTYC6bq80IUoKhwcNS
         vgtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=jaWHaX0rvfQT6Emn2ovb4MYmWUHOkufuzixc1uMo7qA=;
        b=AXQgzoe0FObyzB3S52Qfb+LL2ccMJkzKiKLBMD0uyVkqPMZnt1IlR3fDuHv0KYmEqy
         Dh8aAgXTH3eFlc1IEPrFqVSSq9zeft6YnpwMOPQ+6l3OKc7NHVtSov83NHoikuftcPLV
         nxyZy7PGhodwUF+ArizjHYAR+6kcpaSA7KJghZ8kqpNKp2fcKnOPQbIALITJpXw7tV6W
         KoXUXiNz0pdJbqJ3ZsV2tLtDcyAjcXm5EEfaxFPSx24zkra/gCSREKuqKxGPhR8tkhR3
         DxQsOb7DpgidMBZUViojJmU+7LLGqimuEXygT9Uy0Stx8+p2GD8ppJYKjRQuvWnu/5LZ
         BYLQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=GJiKvGjC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id p12si443773ljj.0.2020.08.15.00.00.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2020 00:00:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MiuSe-1kaPgm2rWG-00f2UA; Sat, 15
 Aug 2020 09:00:04 +0200
Subject: Re: autojail an automatic jailhouse configuration frontend for
 jailhouse on AARCH64 devices
To: Christoph Gerum <christoph.gerum@uni-tuebingen.de>,
 jailhouse-dev@googlegroups.com
References: <ec8b8710-e966-1abf-0f64-d9e10d7e005c@uni-tuebingen.de>
 <a588e2a5-b7cd-7df8-7341-2e7f9da79b6f@siemens.com>
 <2b64a2ef-970b-bc7c-6e7d-8dd3f9fcc5e1@uni-tuebingen.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <ef151dec-8123-b296-6a23-4a9827a68874@web.de>
Date: Sat, 15 Aug 2020 09:00:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <2b64a2ef-970b-bc7c-6e7d-8dd3f9fcc5e1@uni-tuebingen.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9VE7MMc40ktUWhUlXGwiUJGGgj8pXtDtlPVHtVd23hPSarIznWz
 ygN0DQspuiL7KNru6t+5Ph+Stlj6+46FC+c5d/3QpxaEQHr5OVFZjg+Z3M3eruVrmpXqC7C
 s70nzNc45pn7A4zHUZmY4Lh5RYL6MDZ+jEdSEcrmvsZZztWNnt5yn/hvpc7TknZ2yuHYJ39
 ALRl+YFrB191uUr3ALsNQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iJ6xfblGYts=:DCrkKvVUmCQlQuHQH/MzIL
 c7jVlc4xxVObpGTSgoQIUlXwbnsMaDgGZ6BvLTqdPtcfibTkSTgP8q3E3zdtK1XRzBqJ1sEb3
 m8QdhwW+lUMOndl24nhcuX+Mla4wdTNCkKMWLShAuQYu1sy+uYdVARH/4TExkH/z2M0FVOwo2
 MQJvjWKQCp2wsRNBkuZrlLLBlnOV+OSnybSqojsvXVtfTQb2SFkq60qLAy1++cY/+fMRM8OT4
 V8NSeYeUBy//fXFur1w2fWB3Mfg0gQJg+5wVLDsslH2VuphFTy8xFuQrAKgSPXMLOd+0EmUJR
 bzKRPhSdkcQT0bliRDEusR2bCXTnkFwx3gdg3vcVY6k3VcIR2GnQNwMrj99DySNN5T1Y0d9nn
 1VT53cKxVKYMzNJ6DJl4fETipUCSOCuY3KefS/44jwVXYPX3GqVyBR+ZjfCmM804FizNyAidM
 Pde1tyjDkACAzXQ+WN5z62+J2ufdsYN2IIvFAzgnMEIKSNSiMuB1r/T4PNFHcPCu2PmEZtNUf
 aXiLrZ+iPvUu1viERBxePN6W5M45600rPaudfaG4tpaUkIBFdwIS5Wf9tiJ/fMjY5i3t9DxHP
 NNuEKyApPcLWb0VvFiT8AhZucaFYLt9fnWqsUSRoABRAGHrN0UNuWsS0GdJHIQBeGUiM09USI
 C97cUDnOjLwajWjr/g9XBKjZErRGomadxMnNcDLYEBOjDBr788aADpqmjaJtHo3UWJzJgH401
 UAafm3LdnkgKiyQQshPeg7URG2KGgTdZU4SH34R3Qralix0zkKC51iE6fzIvguEe3dbgMgX8G
 FOS8pzi/AUbbKTo9+gQijGiNAiURl0l5meUDP01nXMkg2mYFXq97fletMDT6Y3VW6xEELb+bl
 MY0PCudup1wh6mxFz/N4nyv+YoxWhp7c3e8zKVct/f5YBR1kZTlPW7iUO/+ldhbF3UIhSxhun
 Wr3WU7JWOq6oPxID/zYZqEVlikdWU7fzAtsAjQ7Gv176WMr5h/cBQaRa4viFn5fhOpjCGHjrx
 axX4PMf8Du4iXCvyFme6YFydnQn3cPV8Vo2zrRLzMmluToT6se2xMUiW+YuYkYAM69JXDg+dX
 sPtWPxTHTbcrgXnbASLU97EZCVMTOQpnam/FQ08InudNXDFv0Ucd7H742/xwtslYurO9HpsxN
 aHNnUMp0fUQFCnw6SaLgWmY3TWqYU0Kw5uOeMbDIR6N9yR7Yvv3VFTlc+YBD4yiKrCw6e4Af6
 iVB5+o/iTPI42H/bV6gr9L05bzAWKWAhbkGk1wQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=GJiKvGjC;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 15.08.20 00:37, Christoph Gerum wrote:
> Hi Jan,
>
> Am 14.08.2020 um 17:29 schrieb Jan Kiszka:
>> Hi Christoph,
>>
>> On 14.08.20 10:58, Christoph Gerum wrote:
>>> Over the last few months, our team has been working on an automatic
>>> configuration utility for jailhouse. As our effort now nears a usable
>>> state, we would like to present it to the jailhouse community.
>>>
>>> Our tooling is available on https://github.com/ekut-es/autojail
>>>
>>> The documentation is available on
>>> https://atreus.informatik.uni-tuebingen.de/~gerum/autojail/
>>>
>>> The tooling works by extracting information about the target hardware
>>> from the Linux runtime system (currently mainly
>>> /sys/firmware/devicetree/),
>>
>> As you are processing a device tree already, can you also consume an
>> offline dtb?
>
> We currently, are only processing the online device tree, as we want to
> also know information from device tree overlays and dynamic device tree
> nodes generated by kernel modules.

Merging an overlay into a dtb while parsing it anyway is no black magic.
Offline support would be a very valuable feature, like we've seen with
the current config collector.

But nodes generated by modules are unlikely to be relevant for Jailhouse
- how should a module know more about the hardware than the device tree
which is supposed to describe it? Can you give an example?

>
>> Did you also already have a look at system-dt
>> (https://elinux.org/Device_tree_future#System_Device_Tree_2019.2C_2020)?
>> That could become the next logical step for dt-based systems.
>
> I have not been aware of system-dt. It might be an interesting
> possibility to completely avoid autojail specific configurations.
>>> and then generating jailhouse cell configs
>>> for root- and guest cells from a minimal configuration file.
>>
>> Important "detail": It comes with a new human-processable
>> configuration format, you YAML schema, right? Is that format as
>> powerful (or low-level) as the binary format, i.e. a full replacement
>> of the current C files?
>
> The yml files currently are more or less a superset of the low-level
> format. e.g. a memory region might look like:
>
>  =C2=A0=C2=A0=C2=A0 memory_regions:
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "System RAM":
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 physical_start_addr: 0x0
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtual_start_addr: 0x0
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size: 1 GB
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags: [MEM_READ, MEM_WRITE, =
MEM_EXECUTE]
>
> With a bit of syntactic sugar e.g. sizes can use human readable units,
> no counting of memory_regions needed.
>
>> Or does it provide abstractions like
>
> Abstractions are currently implemented by making most entries optional:
>
>> "give me 1GB, I don't care where"
>
> would be:
>
>  =C2=A0=C2=A0=C2=A0 memory_regions:
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "System RAM":
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size: 1 GB
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags: [MEM_READ, MEM_WRITE, =
MEM_EXECUTE]
>
>
>> "give me device B, with whatever I/O resources it comes"?
>
> This is currently expressed by the=C2=A0 device tree path:
>
>  =C2=A0=C2=A0=C2=A0 memory_regions:
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio: /soc/gpiomem
>

These are interesting features!

>
>> How is the (planned) workflow then? Currently on x86, you call "config
>> create" and then perform manual tuning on the resulting C config for
>> the root cell to make it work. I suspect that is what "autojail
>> extract" is about. In your case, tuning would be done on to the yml
>> file? How would will the workflow be for non-root cell configs?
>>
>> Hint: Add a user story to your documents would help getting a big
>> picture quicker.
>
> We have a different workflow and at least one user story per milestone:
>
> Assuming that we are able to connect to a target eval board via ssh.
>
> Milestone 1: Simplified config.
>
> autojail init

I don't get the init step. From a user perspective, it looks useless and
could be done internally when needed.

> autojail extract
>
> manually create cells.yml to specifie the configuration. Guest cells are
> created in the same cells.yml. e.g.:
>
> cells:
>  =C2=A0=C2=A0 root:
>  =C2=A0=C2=A0=C2=A0=C2=A0 name: "The Root Cell"
>  =C2=A0=C2=A0=C2=A0=C2=A0 type: root
>  =C2=A0=C2=A0=C2=A0=C2=A0 ...
>
>  =C2=A0=C2=A0 guest1:
>  =C2=A0=C2=A0=C2=A0=C2=A0 name: "The first guest celll"
>  =C2=A0=C2=A0=C2=A0=C2=A0 type: linux
>
>
>
> autojail config
>
> manually test generated *.c configuration, and change cells.yml until it
> works.
>

Skip the c-file generation and emit binary configs directly. Way more
user-friendly.

That reminds me of Andrej's pending patches in my inbox which add that
feature to pyjailhouse - you could simply use that once merged.

>
> Milestone 2: "jailhouse config create" on steroids
>
> At this milestone we wan't to allow the following use case:
>
> autojail init
> autojail extract
> autojail config --num-linux-guest 2 --memory-per-guest 128 MB
> autojail deploy
>
> Then you should be able to ssh into the root cell and directly into each
> guest and the root cell. Ideally with minimal, manual interventions.
>
> E.g we will configure ivshmem_net from root to each guest, and configure
> a bridge device or port forwarding in the root cell.
>
> Milestone 3+: Cell config management
>
> These have not fully finalized yet, but from Milestone 3 we intend to
> use an extended cells.yml that supports fine tuning capabilities on par
> with the current configuration format, while allowing tool support for
> the fine tuning as well.

If your config format is able express that, that would be a great
progress. Say, you can request a complete device tree node, but then you
can additionally define that a specific MMIO range of that device shall
not be accessible.

Stabilizing the config format for all these use cases will not be
trivial, but it can be the way forward for Jailhouse.

>
>>> It differs from the current jailhouse config in the following ways:
>>>
>>
>> I suspect you meant the current config generator
> Yes, sorry.
>
>>> =C2=A0=C2=A0=C2=A0 - It targets aarch64 instead of x86_64.
>>
>> A final architecture will have to address all archs, even if the input
>> for x86 will remain different.
>
> We don't have any plans to fully support X86 in autojail at the moment.
> But I am considering integrating our device tree work into pyjailhouse
> to allow jailhouse config create for ARM and AARCH64. At least as a
> first step. But if our configuration file format would prove interesting
> as well, we might reconsider those plans.

Definitely. Keep also in mind that our binary format is a moving target.
So, even if you build consequently upon pyjailhouse for parsing and
generating, you may have to rebase frequently when keeping things
out-of-tree.

>
>>> =C2=A0=C2=A0=C2=A0 - It supports configuration of guest and root cells.
>>> =C2=A0=C2=A0=C2=A0 - It allows a simplified configuration of IVSHMEM_NE=
T.
>>>
>>> The current release has the following limitations, which we would like
>>> to address in the coming weeks:
>>>
>>> =C2=A0=C2=A0=C2=A0 - No generation of configuration for the inmates (ne=
tworking,
>>> device-tree)
>>> =C2=A0=C2=A0=C2=A0 - Dead Simple Memory allocator that will probably gi=
ve up at a
>>> relatively low memory pressure.
>>
>> Where does the memory allocator come into play?
>
> The static memory allocator currently allows us to leave out physical
> and virtual addresses for the memory regions mapped to RAM. While
> keeping some additional constraints: e.g. MEM_LOADABLE regions are added
> to the root cell as well if their physical address range does not
> overlap with any memory region already specified in the root cell.

Got it - a valuable feature as well! Even more when coloring will come
into play.

>
>>> =C2=A0=C2=A0=C2=A0 - Configuration of inter-cell communication is suppo=
rted for
>>> IVSHMEM_NET devices only
>>> =C2=A0=C2=A0=C2=A0 - Only tested on Raspberry=C2=A0 PI 4B
>>> =C2=A0=C2=A0=C2=A0 - No configuration of SMMU or other IOMMUs
>>>
>>> The current release has so far only been tested on Raspberry PI 4B, and
>>> this announcement mainly is here as a request for comments, and to
>>> evaluate how our work might fit into the general jailhouse ecosystem.
>>>
>>> =C2=A0=C2=A0=C2=A0 - Would there be interest to somehow integrate it mo=
re closely into
>>> the jailhouse ecosystem?
>>> =C2=A0=C2=A0=C2=A0 - We would be very interested, if we could use it as=
 a configuration
>>> generator for the current work on memory coloring in jailhouse.
>>
>> Specifically coloring is a scenario where more tooling support for
>> config generation and validation is needed, indeed. You may have seen
>> that new "jailhouse config check" command which performs the latter
>> (and should work with your approach as well as it processes binary
>> configs), but we also need more of the former.
>
> One of the next points on my bucket list will be to directly integrate
> jailhouse config check into our workflow. Would you be willing to accept
> patches to move the actual checks to pyjailhouse to allow an easier use
> in external tooling.

That is the purpose of pyjailhouse: Make functionality available for
different frontends. So, yes.

>
>> So, yes, there is definitely interest in new ideas and concrete
>> solutions, specifically for arm64 (though not only). After having to
>> refactor configs/ recently, more than once, I would appreciate a lot
>> if we could reduce the manual maintenance.
>>
>> What needs careful thoughts are the possible use cases and workflows.
>> We need a solution that automates what can be safely automated,
>> ideally warns when user input or validation is needed and does not
>> stand in the way when manual tweaking must be applied. That is due to
>> the low abstraction level of the binary config format the hypervisor
>> consumes.
>
> One of our main goals is to be an experimentation field for finding the
> right abstractions to allow an easy configuration, while still enabling
> the fine tuning needed for more complex use cases.

Sounds reasonable, also given what I wrote above. We need to find the
right balance between downstream experimenting and upstream exposing (to
more use cases), though.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ef151dec-8123-b296-6a23-4a9827a68874%40web.de.
