Return-Path: <jailhouse-dev+bncBC33JYE2XMMRBINUZXUAKGQEN2S5NVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe37.google.com (mail-vs1-xe37.google.com [IPv6:2607:f8b0:4864:20::e37])
	by mail.lfdr.de (Postfix) with ESMTPS id 766EC567D8
	for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Jun 2019 13:42:26 +0200 (CEST)
Received: by mail-vs1-xe37.google.com with SMTP id t82sf261639vst.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Jun 2019 04:42:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561549345; cv=pass;
        d=google.com; s=arc-20160816;
        b=NlGyfXwdv6+vmPFPRX+8aRkyV8h5/4Q7ia8wrrxv6s8wtrSbqWqT0ASVek/WUrhLFy
         NgL5Z3/8YEOb7KGDYSVEA/YX2PSTu6HHvjSQWFbfpzV+gVZa9KZlWivCH8ZuNKOJlNWt
         7GzuZB+r6cGRdn5saCUeEKvednpRbigt77T7xACgIX8hPvUYTT8UvF6Y6onMdfTDczPe
         HrOU6ERckUqYFY8CqfhbKWQ8rx57oA5oxEv7KPWkAeHu91TMQ5olwzArtE/FUPHxBtbh
         fd0XpQayzqhe4hCdljrFqBMKkmh1vF5IOlcF5ef+Fa3mStTawh+QhkTFyRf5DmHPoEPk
         jFzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=msHLbR5RUqlfHxJHpFtIV0E12ZdR1dI36flJPzBokfM=;
        b=VNv2lOa+y6BO2vDCQFC5SqguuYaX79gla2hMt4NIMD4Xb/Qd7HqrsXD44EtSCuSoiO
         PLHsTtcdrk20JSStdBlViAsUCrxJGLnElSMjz3cXs/Y6jP0nQGp8lEQPDjZduq7Ip4zp
         PnJa2tVajN8m+ZTNKLftjIMGRxv4cwoq/iU0ozt4wux+gcx5Qa7oMqHejwnghzLFTrV3
         QNWnCrl/rDm8On4SOxTwLOh4Ywz4O3QSs6iYr3vAtkyqaY5bFLge/aLyKT0J71tynBif
         ssCXLnBJwALpSEOqviR0zTh2YT70ErgBmNebzGtq9XYMmI7J1KbRCRneW39nddw2zk8O
         MWHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pIMuxXMN;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=msHLbR5RUqlfHxJHpFtIV0E12ZdR1dI36flJPzBokfM=;
        b=mg30YR6Gxoq9GqEwbXEgWthNaQaHoZW+Z0aFzl7/gsF9KMNxG7H7u5Km4DFtDKzFU5
         zNKiQ8Ih7yqVXROKtUyzK9/wQlWRAG7bXQJ54GKMHO7719nP63QBAz2ZHeUq2MT+5VME
         84/VsL0HaN5H5Lj64HN2Z/e7HJOHSzYPCoO+rV9Bi6MoH/9oHkiW5AIKG/6ZlpFE0h6U
         O4GPEvFpDHxkriwupTFWUZ3P8JuSqe5hwoo+378PSTpN2VxAnoCxnOMd2GABfsDw3McU
         B6nc9oKxb83E0NPld5y8X35U1wVKrNkNSDzFyRnt7KErXIQ4cAczGzGzi0mdB2xOsnRl
         Bq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=msHLbR5RUqlfHxJHpFtIV0E12ZdR1dI36flJPzBokfM=;
        b=TcMbkgADOiFvQDqSxkc14ltQytKtCXSfTq7XqV4+02dxx4N04BdlmOeugnstPJN6gd
         A69zasaL9mYQZXXPGov02IZVMnP1GW2ikTPAHuWcKlvdBYCw/7OeBfkVf8/kT60Lam5b
         h7SdncwXBkz2ZBcGd3kj4XkgM1zJIZgvqDcGO9PwYJ6B57O7XhWzXEjPCcHLe0ERC6DD
         Xzk+5wB81xyYPs91M/ObmKuDkS2iytAB7feEn7/bdOu1UKQZaAWYgr+7NBWwv5cHzGrq
         tdjRN0D4ubKDNRCHfhtpYaVCygHfDH6vWH3p4tvspROcxjLffmG2NoHhhHujGoC8Y7CE
         Egdw==
X-Gm-Message-State: APjAAAXCnsJ2D2jRBX5ED7lXAz/5dxGpMCYuUkqsT90us4SWB3/ZK0+Z
	l3tmKKsWJ+hCHk31maYzGvQ=
X-Google-Smtp-Source: APXvYqz1VPeWikwHPbMkGdBZG2ABGeo6bMVqfH/d7KOsGIUlbZvqeNJwQHOc3i6QgS8fPvgp7nF4ZQ==
X-Received: by 2002:a67:e41a:: with SMTP id d26mr2740813vsf.71.1561549345388;
        Wed, 26 Jun 2019 04:42:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:7c46:: with SMTP id x67ls158082vsc.14.gmail; Wed, 26 Jun
 2019 04:42:25 -0700 (PDT)
X-Received: by 2002:a67:d895:: with SMTP id f21mr2790304vsj.195.1561549345042;
        Wed, 26 Jun 2019 04:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561549345; cv=none;
        d=google.com; s=arc-20160816;
        b=uH3ZnUQY7eLmC0dW19GhZc8LEQP9vjLrkduEktCSXYQEQ32D6uDXkDzzhij+6vleMH
         ECNQ/YFY6RF33ngvPy87e766/0JjIu2dfp9r4RX2zFmmhpPRjAiRmqRfz/d1ZQqKldA1
         t+KbMzLRA5xEccQT4vduyVVScrlTh47gwdhOmGE6UB4WOdbxAjqllJuYlSMmnjPSoMcU
         pi/5OZs8DF4Ms/mn13D6DTXRMkvOV/M2xcMro1auAKKrCqXDiLAGqlt607p2/9pwIagU
         T5plxO5BkaWFGvbigCsEsFhAbclNZxXQSUq6ppLZXeziGRvPP9OeX731cM1ql+vk7wzP
         nc/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=8nSgfwrTSk6NAnQTqBvfXLyim2Jfnm2wlXmnTXt3OUU=;
        b=n3SIYAkZW5a9xFthfswL4bpi90OmcPyIFaptTTrODm/+il4pBbx0eVkiW4XZO9SQco
         z6KYA8Mx1iWPbw1FTm9RbYGEMgX5q47xnenoNAQSKKMDpqknWp05HYK+HALjXwJAZG80
         BTIabFKgHFEO6ssX2ckmKYAYy/IFLcsWj55swi0ldew7F8qQO27RC8dO5TWN1lnar9I3
         Pn1DaT9Q3zAGn5KRaN2P8uyziCty8nnJnAW7NoFrFZEDfrN/IB+N7vQA+6EQUQpz9AhM
         Fkky8CbN6ez6J8fFmXNSRbWDhEkS4t6rY508wP1WJACkLoI2IxEHDjqwWJS/wijsBlz+
         QVng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pIMuxXMN;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id s72si1035616vkd.3.2019.06.26.04.42.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 04:42:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QBgOhG058565;
	Wed, 26 Jun 2019 06:42:24 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QBgOMq103693
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Jun 2019 06:42:24 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 26
 Jun 2019 06:42:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 26 Jun 2019 06:42:23 -0500
Received: from [158.218.117.99] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5QBgN5V086055;
	Wed, 26 Jun 2019 06:42:23 -0500
Subject: Re: [EXTERNAL] Re: porting am57xx jailhouse support to v0.10 version
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
 <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
 <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
 <eae01b0c-3e7b-04ac-4ae0-24c407e85bd1@ti.com>
 <8558b60f-cfcd-ddc1-62b6-b3ab9cd762ee@siemens.com>
 <c724fb1e-4c24-8562-cc3b-bd35d45d098e@ti.com>
 <cb3304a1-b322-7f87-a67f-3c6f11fe3d7c@siemens.com>
 <b96fd4e8-686d-2df9-d4f3-32a2bc472630@ti.com>
 <dae8aa98-f7cd-d25f-b8d7-cb0006d08ff0@siemens.com>
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <f2210cae-3d9d-31e3-d587-6502c5863671@ti.com>
Date: Wed, 26 Jun 2019 07:38:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <dae8aa98-f7cd-d25f-b8d7-cb0006d08ff0@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=pIMuxXMN;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=vitalya@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Vitaly Andrianov <vitalya@ti.com>
Reply-To: Vitaly Andrianov <vitalya@ti.com>
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

On 06/25/2019 11:50 AM, Jan Kiszka wrote:
> On 24.06.19 23:44, 'Vitaly Andrianov' via Jailhouse wrote:
>> On 06/24/2019 12:27 PM, Jan Kiszka wrote:
>>> On 24.06.19 15:29, Vitaly Andrianov wrote:
>>>> On 06/24/2019 09:23 AM, Jan Kiszka wrote:
>>>>> On 24.06.19 14:27, Vitaly Andrianov wrote:
>>>>>> Hi Jan, Ralf,
>>>>>>
>>>>>> On 06/12/2019 03:27 PM, 'Vitaly Andrianov' via Jailhouse wrote:
>>>>>>> Hi Ralf,
>>>>>>> Thanks you for the quick response.
>>>>>>>
>>>>>>
>>>>>> [skip]
>>>>>>
>>>>>>>>>
>>>>>>>>> so, I have to implement the corresponding am57xx_init() and
>>>>>>>>> am57xx_cell_exit().
>>>>>>>>>
>>>>>>>>> Here is the old mach_cell_exit function, but many of the function=
s it
>>>>>>>>> uses disappeared in the v0.10 version.
>>>>>>>>>
>>>>>>>>> void mach_cell_exit(struct cell *cell)
>>>>>>>>> {
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>>>>>>>>>
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell=
->cpu_set) {
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_entry =3D
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 mmio_read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp=
u * 4);
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_context =3D 0;
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_suspend_cpu(cpu);
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>> }
>>>>>>>>>
>>>>>>
>>>>>> I have implemented the am57xx unit. At the am57xx_cell_exit() I set =
cpu_on_entry to=20
>>>>>> omap5_secondary_hyp_startup() - physical address. That was in the wo=
rking v0.8 mach_cell_exit().
>>>>>> But I'm not sure what shall I do with the remaining 3 calls:
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_context =3D 0;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_suspend_cpu(cpu);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>>>>>
>>>>>> When I execute "jailhouse cell destroy 1" the kernel cannot bring cp=
u1 online and it still in=20
>>>>>> the hypervisor's WFI loop.
>>>>>>
>>>>>> Any advise?
>>>>>
>>>>> Can you share the code?
>>>>>
>>>>> But, again, we will likely need more redesign anyway because the prev=
ious approach was already=20
>>>>> hacky. E.g. it was rather fishy to pass through the WakeupGen page an=
d issuing smc calls.
>>>>>
>>>>> Can you describe the CPU boot flow from OS perspective, or refer to a=
 description? Back then, I=20
>>>>> implemented it via Linux reverse engineering.
>>>>>
>>>>> Jan
>>>>>
>>>>
>>>> I just made suspend_cpu() not static and called from am57xx_exit_cell(=
). I got cpu_up() working=20
>>>> after that. Now I have the both uart-demo and git-demo working now. Le=
t me clean the code and I=20
>>>> push it to the temporally branch to TI external git repo. After that w=
e can discuss what I need=20
>>>> to do to implement the correct way.
>>>>
>>>
>>> OK, sounds good!
>>>
>>> Jan
>>>
>> Jan,
>>
>> I pushed the sources to my private branch=20
>> https://git.ti.com/processor-sdk/jailhouse/commits/am57xx-next-va. I hav=
e uart-demo and gic-demo=20
>> working, but non of my other inmates works. All accesses to peripheral a=
ddresses causes data=20
>> aborts. I guess that is because I have not=20
>=20
> Check - when in doubt via instrumenting the calls - if the regions at the=
 faulting addresses are=20
> actually mapped -> arch_map_memory_region.
>=20

arch_map_memory_region 0x48020000/0x48020000/0x00001000  0x00000093
arch_map_memory_region 0x48424000/0x48424000/0x00001000  0x00000093
arch_map_memory_region 0x48826000/0x48826000/0x00001000  0x00000093
arch_map_memory_region 0x4a000000/0x4a000000/0x00e00000  0x00000093
arch_map_memory_region 0xee000000/0x00000000/0x00800000  0x00000047
arch_map_memory_region 0x00000000/0x80000000/0x00001000  0x00000023
Created cell "AM57XX-EVM-timer8-demo"
Page pool usage after cell creation: mem 62/4073, remap 6/131072

Each region from the am57xx-evm-ti-app.c are mapped.

>> implemented am57xx_mmio_count_regions(), but I don't understand how I ha=
ve to implement this=20
>> function.
>> Please can you explain what the function shall do?
>=20
> This function returns the number of emulated MMIO regions a unit provides=
 (number of=20
> mmio_region_register calls). Yours does not have any so far, thus using t=
he stub is fine.
>=20
>>
>> Regarding the CPU boot. As I understand when the cpu_down() is called, C=
PU1 is not shutdown, but=20
>> go to omap_do_wfi(), where it is waiting for SMC. When we destroy a cell=
, CPU0 calls cpu_up(1) =3D>=20
>> omap4_boot_secondary() =3D> arch_send_wakeup_ipi_mask() and CPU1 got awa=
ken from wfi. As I=20
>> understand the am57xx_cell_exit() shall assign cpu_on_entry address of t=
he omap_do_wfi(). Is that=20
>> correct?
>=20
> I do not recall the details of the OMAP2 wakeup sequence yet. I'm startin=
g to remember that the way=20
> how the guest puts an offline core into shutdown state made it trickier t=
o wake it up again.
>=20
> We definitely need to understand two things before being able to emulate =
the secondary core setup:
>=20
>  =C2=A0- Is it fine to permit direct access to the WakeupGen page, or sho=
uld
>  =C2=A0=C2=A0 we rather emulated that? Even if the only accessed register=
 is fine,
>  =C2=A0=C2=A0 we need to validate all addresses we expose.
>  =C2=A0- Is it safe to issue that smc on call 0x109, and what is that cal=
l?
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f2210cae-3d9d-31e3-d587-6502c5863671%40ti.com.
For more options, visit https://groups.google.com/d/optout.
