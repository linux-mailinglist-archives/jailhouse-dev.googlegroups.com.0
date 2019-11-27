Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBR4S7HXAKGQEDQDJU5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 2929D10AD16
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Nov 2019 11:00:40 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id 90sf8569853wrq.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Nov 2019 02:00:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574848839; cv=pass;
        d=google.com; s=arc-20160816;
        b=uxlKdAbX+6GpeWZSL7G6LwQSRxCrRfHKBxvNkFEJfBR4eIk6USf2g4iaLpv4HmQJZT
         k2/Kv5+KbuYE3PI0Eq5CSwURJV7lYCe7g42sH8wU2MIi4dTt97OkUT0KDKZg2DG6wdmK
         7s5K2YA5zbX5EhGadfpYyQYebTAuRF4OcMCrDHVrjt4EScJnSVnYyiJ0a2q2ROskLPoR
         ezuTKUVkZs1QM+96tBl7jYmp4NEagfpqebmRMmRpWMkcvsKwkOuHTVlDAzN2BfIvM0Mk
         slygq02ZYFFOuEyNYRiY7mJmMj915I/DWAD4Fwr0iNlJcC+FM9nAjgF/PLSbRitIOiBE
         R2Pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=lumvfZv7lNcrrBBqulwiN3cuijaXPSoWHJqv62LqDes=;
        b=lVtLvWCNig/n+JagoARg4YRftwjvMfMcMJwpgNCOBNtKb1V9Q28a9RaHwH/WOad5eJ
         Z2cAvgp/NDm/0VySLe5CgJ1JmVBLmYTDXlcnqziZH7fk4AkKuEB3drGjka/bESsMc/ry
         x2tunHyG4XEWl2A5N6wQ26sI5BGaG7VlgPJGVQtPm7ytYbN3t9NwEkshM9PoevNq5pFI
         OWIDQQ5Unve1DoriuJjTAa6NSrjpCKHXjoiqsrVgZXNyw9M85La0hfOzoAQLtUlOL7EF
         J/VMiJ8+rqp0B6XJmBlym0vEqHaSYi7+1Mx5xWZlf44iwZZuFb/Bb8dRLDpxw1YS9Yd+
         xx6A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lumvfZv7lNcrrBBqulwiN3cuijaXPSoWHJqv62LqDes=;
        b=sKIzoRChbbwxj56AgQTgDIqHYw7SXQaN7k4q3ztjFAM8Rmazkef8RFkFt5kYhOZzlp
         YUXuSJdtrbo8EatMBMyhe7+eTWowW5vh3eZGgaqoSv8ZqAfLmbt8TudL+bQ/DMJzps6Q
         VCyEdES0qxLTpRfK/yhbaX5EgesTv6fJVSUqFC2/TnjFlsSelM6T0d1Kb0YirT1m29sB
         sqX4Wb9MtMuyrbB/bM2njlPa0CT9pJDQv8pqjRsFTzOG+Q4pWXK0wsxUv2e608MTX8tf
         1DBt3yCDwf3xWWKScPXX5SjhSnlCNa35zgKeVcpBp58BqPNP5mY94Q9g1nlhNVfHxbuJ
         QJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lumvfZv7lNcrrBBqulwiN3cuijaXPSoWHJqv62LqDes=;
        b=RjXCJ+3BTTyUbai4rDWWt4KNrzIqUTPb002KckeQ1ejxTiNQGS21tznNNAMzxS6+2r
         CWDHnrFyJBI0ZTSGrG3+4Acxk5vz7sjUyApbVBbVH6KUbX+4vA0qTgfPjFpDGrHpygrQ
         Dkv7QoEKASKHaxqC9Rka5WqeoLhlp4EIuN+mQCDfEftW9whKb97RXQx8on+xR6dA/zTV
         jvYgORSXYQJapq/0jCUhlC+MOrSa06v4mgIhyBVyZh2GsurWbFS6MJ+JNpGyN7y/ecoT
         yEYoQW3AEsM98cTfhevRK9Nq1sJMcqkjD8RnK8F9UijmtigMlrY6VXiA+Eco7P/9XQ/5
         lJFQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXh9PXivriPjhYnkvcfGUVYVuvl+uipV8viGSMmE5M9WAJZirs9
	LRW09ZkuY35tt7q3Gc3QWVk=
X-Google-Smtp-Source: APXvYqw3mwsvRhqJaNDr024f38ajEPrOZ8ax2AyAz8WktMdGHCGFTq51oKh5btVK5eGav2dGwVNPmA==
X-Received: by 2002:adf:e312:: with SMTP id b18mr44005113wrj.203.1574848839858;
        Wed, 27 Nov 2019 02:00:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5512:: with SMTP id b18ls9542987wrv.16.gmail; Wed, 27
 Nov 2019 02:00:39 -0800 (PST)
X-Received: by 2002:adf:ab41:: with SMTP id r1mr18457508wrc.281.1574848839132;
        Wed, 27 Nov 2019 02:00:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574848839; cv=none;
        d=google.com; s=arc-20160816;
        b=sf80JVWvQo+BzNf58x0vPU8q9Z1sji+JCnm0X64SmhzS3QROYyNEo2sSm9cWvelOL4
         1iggbA7IQdcSNj7dGVrpNupLLz1hJGseboOtOsyPYhJMRybI5B5HWK0b01VsAka2VDaH
         QVT4vL+CUMPpMtmF/Yl6wE9KU1CsjEuio2m3mpBvCxUvs9OpwjeQ1cUobg1fkTcPSjss
         0SPcEsQ8kPikdqNHzIoDvPsKPQtR4LRc/xhdzNQda4kPRl6PEJwKY4hM47yQj2nRfEDZ
         A7a4Y9Jy4e2TkaesEsWENNLyvFJRDq4AKmiv4mC07rFzyWnvD0WlCgzPScuk3iimQyCo
         uYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=tjo6e7lKZ5RSZujC82Uz8yMRGOaGFalzqOd2anqkFWE=;
        b=OBrrfVvIcLcFsMEfKt/R1bX085HqsgbQAMUfFYKmz/LLANpFezI7h6G6Kyw2JGhoGK
         hab4xDKTZ8A92WMoON4lLuM4ucRjywIQUjdU52Yz1KulSD0csuHBGauNqCyRjt8td/HA
         E+yrBDhRLfP62dNZDxRpwUwZ2B0ehoEyBI8O9p67ldIej/1KZgCKdf+XdKKvAhieg16f
         QMNvNokc/gyfWTWMtLnm+4lOe+Z7tFVtEqzsj0dvXPv6LpswxD/llxUKXPiSJ4HEHSFe
         JMioe9v8ZpinL0veeP6NiNmWVB9GpZOo+bV+RlqXLUWsIbbfA2z3FdiTFyF+kZ235zX2
         Ly6w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id x5si244952wmx.0.2019.11.27.02.00.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Nov 2019 02:00:39 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id xARA0cdv008838
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Nov 2019 11:00:38 +0100
Received: from [167.87.21.155] ([167.87.21.155])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xARA0bwM011789;
	Wed, 27 Nov 2019 11:00:38 +0100
Subject: Re: ITS emulation in Jailhouse
To: Nikhil Devshatwar <nikhil.nd@ti.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <ddc49d2b6a6f47a2b847b44aa1416074@ti.com>
 <81a7f9d2-d6b5-0eac-9bb9-1fa14a56df40@siemens.com>
 <5c5e4cf2-c901-d080-1565-82a16ea45813@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <aefae30d-e481-73dd-8852-2fa65928ec5f@siemens.com>
Date: Wed, 27 Nov 2019 11:00:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <5c5e4cf2-c901-d080-1565-82a16ea45813@ti.com>
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

On 27.11.19 10:53, Nikhil Devshatwar wrote:
>=20
> On 19/11/19 12:14 AM, Jan Kiszka wrote:
>> Hi Nikhil,
>>
>> On 18.11.19 14:26, Devshatwar, Nikhil wrote:
>>> HI Jan,
>>>
>>> Current Jailhouse implementation has support for partitioning the SPI=
=20
>>> interrupts on a GICv3.
>>>
>>> However, the LPI interrupts managed by the GIC ITS cannot be=20
>>> partitioned.
>>
>> Is this something we would need a GICv4 for?
>=20
> Yes. this applies to GICv3 and GICv4.

Too bad...

>=20
>>
>>>
>>> Typical usage of LPI are for connecting PCIe devices on arm64=20
>>> platforms where the endpoint sends MSI interrupts.
>>>
>>> Kernel drivers for GIC assumes full ownership of the ITS module.
>>
>> Means, it also touches registers it does not own? Or are there=20
>> conceptually shared resources in the ITS that everyone needs to access=
=20
>> when programmed own parts of it?
>=20
> Software needs to access the ID registers, setup base address of the=20
> different tables and queues.
>=20
> Most of this is done once for each PCI device
>=20
> When emulating, all these accesses should get trapped and policed by=20
> Jailhouse
>=20
>>
>>>
>>> To enable partitioning of PCI devices/functions (from same or=20
>>> different PCI controller) across VMs,
>>>
>>> One of the key important feature that will be needed is the ITS=20
>>> virtualization.
>>>
>>> Since the GIC ITS does not support per VM tables, one option would be=
=20
>>> to use emulation of the ITS module.
>>>
>>> Here is the proposal for such an approach.
>>>
>>> =C2=B7GIC kernel driver allocates separate ITS table in its VM address =
space
>>>
>>> =C2=B7When Jailhouse is enabled, Hypervisor allocates a new ITS table a=
nd=20
>>> copies the descriptors from root cell
>>>
>>> =C2=B7All accesses to the ITS registers are trapped and emulated in the=
=20
>>> Jailhouse
>>>
>>> =C2=B7Any attempt from a VM trying to setup the descriptor for a certai=
n=20
>>> device needs to be policed against VM ownership
>>>
>>> =C2=B7Jailhouse validates and updates the physical ITS table descriptor=
s=20
>>> to match the VM maintained tables
>>>
>>> This will be similar to the approach taken for SMMU stage1 emulation=20
>>> developed by Pratyush Yadav.
>>>
>>> What so you think about adding this support in the Jailhouse?
>>>
>>> Would you be willing to accept patches for the ITS emulation?
>>
>> Well, we do want assignment of PCI devices to different cells when=20
>> this is feasible, and we do want not only DMA partitioning but also=20
>> safe & secure interrupt handling. OTW: Yes, we need something that=20
>> enables that.
>>
>> And when the hardware does not (yet) support us in enforcing the=20
>> partitions during runtime, we need to emulate that in software. It's=20
>> just the question how complex that emulation needs to become, for=20
>> Linux or for "educated" guests.
>=20
> To give an overview, following will be the changes:
>=20
> * Initialize ITS as part of the jailhouse enable, setup tables and=20
> command queues
>=20
> * Most ITS MMR emulation will be allow/forbid read/write of a bitfield=20
> based on the VM accessing it
>=20
> * Emulation of base address register write would be to map guest table,=
=20
> copy few entries from guest table to hypervisor maintained table
>=20
> * Emulate event and command queues similar to the SMMU emulation

Ugh, sounds not as simple as I was hoping for.

>=20
> * Add support for LPI injection into vCPU (Since VM's CPU affinity is=20
> fixed, this can be optimized and can be a blind injection)
>=20

But this is something going away with GICv4, thanks to direct injection, no=
?

>=20
>>
>> BTW, those accesses to the ITS will not be on the interrupt handling=20
>> path, will they? Only for the setup and maybe affinity adjustment?
> IRQ acknoledgement does not need to access the ITS device table or=20
> interrupt translation table.

...but an injection trampoline is needed. No difference to current SPI=20
injections, though.

BTW, how does interrupt remapping play into this? I suspect there is a=20
similar concept on ARM as well, right?

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
jailhouse-dev/aefae30d-e481-73dd-8852-2fa65928ec5f%40siemens.com.
