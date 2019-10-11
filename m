Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAXJQLWQKGQE4HSCH4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 9801DD45F0
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 18:57:39 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id w26sf1969266ljh.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 09:57:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570813059; cv=pass;
        d=google.com; s=arc-20160816;
        b=jT13WMGL/pNDxnZY+nIFilsnpnca/p9lCYFJs2PD3lfWRa7OA0TAV2K7jPw2NJ0pVf
         dT3S+telqCQHon98H5O6qmOaoP2ylg+dMSo0Cf+FKcp46sIfYKVztHsDoWk9rKIKY9Om
         TT1GK/cp2ZdgM179vyDujzL/fkVdj5dR0rjt8ZKU+IwgigccmHktrlp89/wdWtNih+bR
         y5jULvdnDgPcxNWc1e4RZfsAdZuV7Vjk0Ubs5+xmNp8HZ3MyvDyVGE+CY9xpKy26OFeM
         vcv5ODxuJKeH3ik1V+ZiuRtqTraa1L61ay++D9jWZb/AMe8rgB+AzozRmt3TLNqdjUbM
         F0Gw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=aIU/XXVmocWd9O2Kyg49Q2WHoaWgGj0x+QbKm1rm4/Y=;
        b=bjFsYZB6d0toxJL6I7UQt58Xoiz1kGRE210NFk0OK3HcErQ49jjR78UCnbhby8KGXx
         c1VL93RjzHHzcj/QTZKB6HivJO79nDowCLi3qkQqlRQnQC2cMU0R6YNFrTdwwXEFoG/3
         CMqShh9eRenGjm5qd1O8DCRYEt9KfYNdfha8p38gS04eP88ASwhmPU3P2LM7+LJoZ2l2
         mtD1VMYMgYxddhxcnCHqh9qDGX/2f7sYjZZS5gEPch33uzTYGxW3rXxv0SCZnpqXkMpl
         1KZN25KaKBOyzOF7kIn47fYIMpMKEij3TrfGeANdsnexi+QKnLgRpPwu4qTDaNXyqWCG
         2+NA==
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
        bh=aIU/XXVmocWd9O2Kyg49Q2WHoaWgGj0x+QbKm1rm4/Y=;
        b=RFy46fiFsg7QvkSEhBUZV1ijKLBY850sdlbdrtjaSaHpCLQiSy6skwV1MfgyW9mTEa
         SMz4o1vE1KNdQOEUdQ4sY9/+KJnRK551EBeqpAVxIYrN/JDm91v2qzah8qoqnJCfjVRE
         2+okGY9iJqrEd+ROf7nBeLRqKqqoGA3jigJb/40u3cUBt4DIx0hQblIMBrQKgjfPAPdC
         EMBH2Nkdshrj3saiabuvOXBLeHh4nMkLIGBPOxAkUeKm4Va+gCugGQyxUvdEx7CJWwHS
         wUWQQl/XQklAxK4nTHNPB3rV+Doypzu1DGpm+kdHLNHsODFYJuHh1w5S6g6zXd/wXt5N
         YNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aIU/XXVmocWd9O2Kyg49Q2WHoaWgGj0x+QbKm1rm4/Y=;
        b=Wwi3zzjfHZCdPxO5JCwXVDd5pA5091DuXhSaNb0tP4HIg1UUQag9UBDapQWdAxUpXS
         wxj2UC4pbwD/fhAn5kraApPDlEfj8D81lpJlEdB5jo5j7MG5IGAwhANeKgiaGdn260Ve
         TyXqg9eTml4aifQhObxKzgflVXocGiuRzPZbArptHFJavEiFdqaaIfzC9giBWLr25v6p
         1mERIzeP53B39Klh5YZ6mTsjJYVvL2JBRtGttTtiZvtQaCpTwe4bRPfPFC/oMEDi7E3U
         V+Vvd0YakkjtMQxIyAu8GsmEldf5McI7onMRoC3V1jw+U2YGriAeLeKO+NBBUcVPMlFD
         O6EQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWBfYQ6XBJ96xo0fSVZLRPGAAsiO/6J+sMQUiIUZE7gaA2j4J2a
	Vni6/NThYQjw5SkWL4fl4n4=
X-Google-Smtp-Source: APXvYqyUhVoz7letPSDVT+v7+j3L05yr0qREQIgQ8aJ4TuQqDNSsHHpPHCRMWmBdO2bx5u7IjJyKiw==
X-Received: by 2002:ac2:53a7:: with SMTP id j7mr9542734lfh.10.1570813059099;
        Fri, 11 Oct 2019 09:57:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:2286:: with SMTP id i128ls1066564lji.7.gmail; Fri, 11
 Oct 2019 09:57:37 -0700 (PDT)
X-Received: by 2002:a2e:b4f7:: with SMTP id s23mr9353511ljm.111.1570813057562;
        Fri, 11 Oct 2019 09:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570813057; cv=none;
        d=google.com; s=arc-20160816;
        b=QfPISDrpTm3Ov08LOBkjKRmLsBvK3vEbnS8dRKlq8eIJ7WAA0aau2k5jBvVPGLNh4Q
         p1o9adsV6rxIOUE+LM7/3Jy9MumEtVfvlsL1zPrRue3TR5lqJRW121+Qg5I3JJockxpe
         7OZRLJkQXB7jX365D7xJsMGpy+GbhvLF+04m8UWpRcjOjxINrdncNWWsR20QJZ7rf/Du
         /EtRwh8uzYqJdHL9TtcSuqqcj8VBaPGnx1UX11eVY+PhNspHGkPSanduJa9NmzRGeLn1
         Z6q+agemCW3NG2e/u0UA21bd5QAx4eVd554e5YKnYloE6kv5Oc8GFQjKfaxU9bEEw3hq
         5SNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=TMBUG86pkbstaBboQQb6RVEGJDJzh1GPmM+5JuOoTv0=;
        b=nSeXwo8nl+m45GKQvWjdHua7k7y0R6DOa6iYu9JRLcYcEbYI6ycdGZ9b+ygfu6UHzl
         kDqVsdx41jrCSGaZA/o5n2vn53o23BcuN6dL5l4PhMHtAxosUQtwLQq3fjm5fkJbMKyN
         tRqoLXQF3/gO3jyousAp0YMYqPlV3tSlI9MaYWxCWrEhnLplDkNc2/hA2Cnf+kFNtejv
         kw8uTzL4wxEFVrSIWTsYqMHosW0Gi903mtBR4xKHDXrzLQ72LoRq5dfLZrYgcG7Q/hNF
         LT0W+CqBey6iUqwpaK8zZ8S4h5l9VvTbQZMCOtImlW0b77cd4rbvPjO709wlMLYSfGmj
         9B4w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z4si333890lfe.4.2019.10.11.09.57.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 09:57:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x9BGvai5017815
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Oct 2019 18:57:36 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9BGvaOM018799;
	Fri, 11 Oct 2019 18:57:36 +0200
Subject: Re: [PATCH 3/4] arm: am57xx: introduce support for TI am57xx SOC
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Vitaly Andrianov <vitalya@ti.com>, jailhouse-dev@googlegroups.com
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
 <1570731650-5335-4-git-send-email-vitalya@ti.com>
 <0b85c51a-0078-47fb-70ba-a8f9def7b852@siemens.com>
 <357f2bee-176a-af2c-e603-9f907f1594a0@siemens.com>
 <a2ca04dc-8212-1e0b-c3dc-f3b58fc2cb12@oth-regensburg.de>
 <32d719ab-04f9-f57a-d8b1-33f6467da855@siemens.com>
 <f5316d70-5f44-93e0-dc2f-604cdd229fc6@oth-regensburg.de>
 <b3477139-cfe2-b8af-8b42-11487e4e4c87@siemens.com>
 <0368a897-9bda-63fe-5657-89891422c118@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5a39b4c6-2738-95d9-352a-2a79669f1c96@siemens.com>
Date: Fri, 11 Oct 2019 18:57:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <0368a897-9bda-63fe-5657-89891422c118@oth-regensburg.de>
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

On 11.10.19 18:55, Ralf Ramsauer wrote:
> On 10/11/19 6:41 PM, Jan Kiszka wrote:
>> On 11.10.19 18:30, Ralf Ramsauer wrote:
>>>
>>>
>>> On 10/11/19 6:13 PM, Jan Kiszka wrote:
>>>> On 11.10.19 18:09, Ralf Ramsauer wrote:
>>>>>
>>>>>
>>>>> On 10/11/19 5:37 PM, Jan Kiszka wrote:
>>>>>> On 11.10.19 17:24, Jan Kiszka wrote:
>>>>>>> On 10.10.19 20:20, 'Vitaly Andrianov' via Jailhouse wrote:
>>>>>>>> This commit introduces support for TI AM57xx SOC. Original support
>>>>>>>> was done
>>>>>>>> by Jan Kiszka for v0.7 version, but wasn't upstreamed yet.
>>>>>>>>
>>>>>>>
>>>>>>> This lacks a design description. Even for me, because I always
>>>>>>> need to
>>>>>>> recall the non-trival logic here.
>>>>>>>
>>>>>>> IIRC, SMP cores on that platform are brought up during boot by
>>>>>>> writing
>>>>>>> their continuation address into a mailbox (OMAP_WKUPGEN_BASE +
>>>>>>> OMAP_AUX_CORE_BOOT_<CPU>). They stay in that WFE state - how do we
>>>>>>> kick them out of this, normally as well as while under Jailhouse
>>>>>>> control? Where does the code for this checker loop come from when
>>>>>>> Jailhouse is in charge? Should Jailhouse better provider it, like w=
e
>>>>>>> do on x86 (look for parking_code)?
>>>>>>>
>>>>>>> For reference (should ideally go into the commit log or some commen=
t
>>>>>>> as well): AM572x TRM, section "33.3.4.1. Startup".
>>>>>>>
>>>>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>>>> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
>>>>>>>> ---
>>>>>>>>  =C2=A0=C2=A0=C2=A0 hypervisor/arch/arm/Kbuild=C2=A0=C2=A0 |=C2=A0=
 2 +
>>>>>>>>  =C2=A0=C2=A0=C2=A0 hypervisor/arch/arm/am57xx.c | 98
>>>>>>>> ++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>>  =C2=A0=C2=A0=C2=A0 2 files changed, 100 insertions(+)
>>>>>>>>  =C2=A0=C2=A0=C2=A0 create mode 100644 hypervisor/arch/arm/am57xx.=
c
>>>>>>>>
>>>>>>>> diff --git a/hypervisor/arch/arm/Kbuild b/hypervisor/arch/arm/Kbui=
ld
>>>>>>>> index e1bec1b..2ef89c3 100644
>>>>>>>> --- a/hypervisor/arch/arm/Kbuild
>>>>>>>> +++ b/hypervisor/arch/arm/Kbuild
>>>>>>>> @@ -26,3 +26,5 @@ lib-y +=3D mmu_hyp.o caches.o
>>>>>>>>  =C2=A0=C2=A0=C2=A0 #=C2=A0 gcc7 will bring a new function attribu=
te
>>>>>>>> "no_profile_instrument_function"
>>>>>>>>  =C2=A0=C2=A0=C2=A0 #=C2=A0 should switch to that for higher granu=
larity, but gcc7 is not
>>>>>>>> even there
>>>>>>>>  =C2=A0=C2=A0=C2=A0 CFLAGS_mmu_hyp.o +=3D -fno-profile-arcs -fno-t=
est-coverage
>>>>>>>> +
>>>>>>>> +lib-$(CONFIG_MACH_AM57XX) +=3D am57xx.o
>>>>>>>> diff --git a/hypervisor/arch/arm/am57xx.c
>>>>>>>> b/hypervisor/arch/arm/am57xx.c
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000..1aa2328
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/hypervisor/arch/arm/am57xx.c
>>>>>>>> @@ -0,0 +1,98 @@
>>>>>>>> +/*
>>>>>>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>>>>>>> + *
>>>>>>>> + * Copyright (c) ARM Limited, 2014
>>>>>>>> + * Copyright (c) Siemens AG, 2016
>>>>>>>> + * Copyright (c) Texas Instruments Incorporated, 2019
>>>>>>>> + *
>>>>>>>> + * Authors:
>>>>>>>> + *=C2=A0 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
>>>>>>>> + *=C2=A0 Jan Kiszka <jan.kiszka@siemens.com>
>>>>>>>> + *=C2=A0 Vitaly Andrianov <vitalya@ti.com>
>>>>>>>> + *
>>>>>>>> + * This work is licensed under the terms of the GNU GPL, version =
2.
>>>>>>>> See
>>>>>>>> + * the COPYING file in the top-level directory.
>>>>>>>> + */
>>>>>>>> +
>>>>>>>> +#include <jailhouse/control.h>
>>>>>>>> +#include <jailhouse/mmio.h>
>>>>>>>> +#include <jailhouse/printk.h>
>>>>>>>> +#include <jailhouse/unit.h>
>>>>>>>> +#include <jailhouse/percpu.h>
>>>>>>>> +#include <asm/control.h>
>>>>>>>> +#include <asm/psci.h>
>>>>>>>> +#include <asm/smccc.h>
>>>>>>>> +#include <asm/setup.h>
>>>>>>>> +#include <asm/traps.h>
>>>>>>>> +#include <asm/sysregs.h>
>>>>>>>> +
>>>>>>>> +#define OMAP_WKUPGEN_BASE=C2=A0=C2=A0=C2=A0 0x48281000
>>>>>>>> +#define OMAP_AUX_CORE_BOOT_0=C2=A0=C2=A0=C2=A0 0x800
>>>>>>>> +
>>>>>>>> +const unsigned int smp_mmio_regions;
>>>>>>>
>>>>>>> Unused.
>>>>>>>
>>>>>>>> +
>>>>>>>> +static void *wkupgen_base =3D NULL;
>>>>>>>> +
>>>>>>>> +static int am57xx_init(void)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0 wkupgen_base =3D paging_map_device(OMAP_WKUPGE=
N_BASE, PAGE_SIZE);
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 return (wkupgen_base =3D=3D NULL) ? -ENOMEM : =
0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static int am57xx_cell_init(struct cell *cell)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +void suspend_cpu(unsigned int cpu_id);
>>>>>>>> +static void am57xx_cell_exit(struct cell *cell)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell->cpu_set) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 public_per_cpu(cpu)->c=
pu_on_entry =3D
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 mmio_read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu * 4);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 public_per_cpu(cpu)->c=
pu_on_context =3D 0;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 suspend_cpu(cpu);
>>>>>>>
>>>>>>> Why do we need suspend_cpu? It is suspended when the cell destructi=
on
>>>>>>> starts (via cell_suspend), i.e. before this call.
>>>>>>>
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>>>>>>
>>>>>>> This resumes the CPU already here. Partly explains my questions on
>>>>>>> the
>>>>>>> top: We have no signal, we kick the re-assigned root cell cores off
>>>>>>> immediately.
>>>>>>>
>>>>>>> Start address is what Linux defined for its original boot by fillin=
g
>>>>>>> OMAP_AUX_CORE_BOOT_<CPU>. We are lucky still being able to read thi=
s
>>>>>>> value back above...
>>>>>>>
>>>>>>> There is really no signal we could take that Linux sends when
>>>>>>> logically onlining the CPUs again after cell destruction?
>>>>>>>
>>>>>>> BTW, what happens when you manually offline a CPU before assigning =
it
>>>>>>> to new cell? Then the Jailhouse driver will not online it on
>>>>>>> destruction, but we kick it off unconditionally, don't we?
>>>>>>>
>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +int arch_handle_smc(struct trap_context *ctx)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned long *regs =3D ctx->regs;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 switch (regs[12]) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0 case 0x102:
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_write_banked_reg(E=
LR_hyp, regs[0]);
>>>>>>>
>>>>>>> This is probably "API_HYP_ENTRY" for the kernel - is there an
>>>>>>> official
>>>>>>> name?
>>>>>>>
>>>>>>> My current understanding is that Linux runs this during
>>>>>>> omap5_secondary_hyp_startup normally in the hope to be taking into
>>>>>>> HYP
>>>>>>> mode at the specified (r0) address. We simple jump there, but not i=
n
>>>>>>> SVC mode. Works by luck with Linux, right?
>>>>>>>
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 case 0x109:
>>>>>>>
>>>>>>> This is OMAP5_DRA7_MON_SET_CNTFRQ_INDEX according to Linux, and we
>>>>>>> should leave some words why we can simply call that smc on behalf o=
f
>>>>>>> the guest. I added it back then because "then it works", not becaus=
e
>>>>>>> of "I fully understand what I'm doing".
>>>>>>>
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile(
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ".arch_extension sec\n\t"
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "push {r0-r12, lr}\n\t"
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "mov ip,%0\n\t"
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "mov r0,%1\n\t"
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "smc #0\n\t"
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "pop {r0-r12, lr}\n\t"
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : : "r" (regs[0]), "r" (regs[12]));
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_skip_instruction(=
ctx);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (SMCCC_IS_CONV_64(regs[0]))
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_FORBIDDEN;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (IS_PSCI_UBOOT(regs[0])) {
>>>>>>>
>>>>>>> This path is here because non-root Linux is told to use PSCI for SM=
P
>>>>>>> management, right?
>>>>>>>
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs[0] =3D psci_dispa=
tch(ctx);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_skip_instruction(=
ctx);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 return handle_smc(ctx);
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +DEFINE_UNIT_SHUTDOWN_STUB( am57xx );
>>>>>>>
>>>>>>> ...(am58xx);
>>>>>>>
>>>>>>>> +DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB( am57xx );
>>>>>>>> +DEFINE_UNIT( am57xx, "AM57XX" );
>>>>>>>> +
>>>>>>>>
>>>>>>>
>>>>>>> Jan
>>>>>>>
>>>>>>
>>>>>> Oh, and there should also be a note on how this platform support is
>>>>>> enabled (CONFIG_MACH_AM57XX...) and that, when it's on, the hypervis=
or
>>>>>> binary is no longer universal - which is currently the case.
>>>>>>
>>>>>> The risk with this approach is that the optional code will silently
>>>>>> break over time because it is not part of the main tests. We had tha=
t
>>>>>> with vexpress in the past.
>>>>>
>>>>> What about a flag in the system configuration?
>>>>>
>>>>> I'd rather prefer to keep an universal binary, instead of
>>>>> re-introducing
>>>>> compile-time switches for different configurations. It was some effor=
t
>>>>> to get rid of those switches, and at the moment, only debugging
>>>>> switches
>>>>> and inmate-related switches are left.
>>>>>
>>>>> Downside: Even if the unit wouldn't register itself if the flag isn't
>>>>> set, the debug output would contain a confusing
>>>>> "Initializing unit AM57XX" entry.
>>>>
>>>> It's not against the idea behind units, though. On Intel, we also laun=
ch
>>>
>>> Sure, implementing this thing as an unit is fine. But the corresponding
>>> debug output might mislead.
>>>
>>>> CAT, irrespective of hardware support.
>>>
>>> Never noticed, but true. However, "Initializing unit CAT... Skipped"
>>> would be more intuitive. All we lack is a to allow ENOSYS as valid
>>> return value in units.
>>
>> That's a much more complex beast because then you would also need to
>> kick the unit out of its link-time created table, to be consistent.
>=20
> ... Or flag units as used in a simple bitmap. Iterators could then
> respect that map. A simple unsigned should be totally sufficient. I'll
> check that if I find some time...

Well, if all that is in the end only for the debug output... ;)

>=20
> Back to this patch:
>=20
> There's another obstacle... The patch before adds weak attributes to
> arch_handle_smc, and this one overloads the default implementation. If
> we want to keep the binary universal, this needs to be solved as well.

Yes, I know.

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
jailhouse-dev/5a39b4c6-2738-95d9-352a-2a79669f1c96%40siemens.com.
