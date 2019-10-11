Return-Path: <jailhouse-dev+bncBC33JYE2XMMRB4HQQLWQKGQEZTNXIKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id C05C6D4656
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 19:14:29 +0200 (CEST)
Received: by mail-ot1-x338.google.com with SMTP id i8sf5199281otc.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 10:14:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570814068; cv=pass;
        d=google.com; s=arc-20160816;
        b=tViluLFKPNaC4fI+4e3A6ohpRhGNyao0fN8vnuWGGKs6QVkV2hL/hwhK5lyir7x0vD
         AOrgNn1JDrFNuA/x/ET2txGSkIGagMkqrF0q+oD2GWgLTESZltUc449PgNknvnnbnHRZ
         kupLgULX+ywo4xOwBAS+/ONedA+Zn9avQfTMV8Jv0fbYVg6e0W9iP//6yfnDAUvjhJDj
         D3X+YY/MeOJt/lagQKawVOfez4XAo9PjQ1SzydT2gTczYU5awZrJbaNsbFt3gOntGhjI
         qOR39ABCf/moo+XSSCrlCTdCUDFBbmuKjMYT2gjSwbDYyf7oaNB1CSDCDg13rgS7+Le+
         dfsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ffXOFQFncRL62bZal4SI9o5PLA0E8dhlEq7iXzcQEz8=;
        b=cVrYerboTWrsNJFkJ+kl6ZkdrAyVwN1xj1hdnKpnq3Yb3VbzXW+ZcR/WaHQ5VXIkg3
         mfxp3JI0afM9XuDR8UPpeD5U0MyiPi7st4yblgLhL2uw+PyEO2dnd2YcsJ094xXn3761
         rddCJHEtJ72qhwYXy0mJMEN4xYEgJr1BPC4uHRuVxRCOBg6Ash1bfWq6H+0Japvo6kQT
         wexIDwCXg6UGZnI/8B/ff2NGXIX7spMebecc/GzHBaqirgljbsqeetI7rdT14wIUQCj+
         WUGOHjj8yHUDA+049cve0ytt1R++6572/qNssJJvxvBOjV70wXmKm8H3yopjevfDHuq+
         8jAA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uV4UlXT7;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ffXOFQFncRL62bZal4SI9o5PLA0E8dhlEq7iXzcQEz8=;
        b=BKuiv/1l3nXnYwB9fB6qjvpn4BJvcpQTQR14KiG5m3mVMLLxORRm5CZmAMpH6LsJHQ
         eH/ZO8bW7DhgYS9M/wcoYQEaiFEKhQ4vW6+qZaKUWH9DAHoieXKxk6l3DA4ae13F1vVB
         WRT0ANVphdtPGNlz8dwn2bQsJhwRu+oan2RRV7lpi3lOxy9hCnmnhDeax5dyH9rn4m3g
         qQpydcgWnuWC+SBDDGG7XjhJibNj4qqSpUJ2KSQ6EHXnNJSICSccvP4eDRw1UcifgUnn
         n/xSNtqIifVZPM54uHL+TTQcHwuyHs7mE8U8MuLSCGlBvDJqQIbdwKaKP7c8+EATkbhv
         LZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ffXOFQFncRL62bZal4SI9o5PLA0E8dhlEq7iXzcQEz8=;
        b=NW8MRRqBGCZ5aV6G2qvro2QVVZ0t1t9Dk0qJFNoK4fFghMvS86MeZ4aw/8W59t6Dfe
         dgziponXkrukF9Vs0XkvFa68OZMCE7q1d8cIJUz9DpyLl5ZBuw6gyhMquXFyK1ssXEnD
         y/EfNz9t3MmUWfvatCYu1UF0ksJZdyl6So3neu0ASgMLaKs99lkpXk93WxoMkVx+O11Z
         ehzpgeX3aOyo/nRIMQ8pF6W4SlSwUGoMXRYiBudFK1JziS6Xkhn+DSQiKi7h9Uh54D0F
         qrXvegmtifc03OR1Nw9XAw+0rM3BYIs8m6hTnRwYIXdiNAoXCCd3k0qJW08Rd5Rrtkhf
         lUag==
X-Gm-Message-State: APjAAAXhPaP1J+xIXcb8JJnhqtxuW6MLClZ872sH/nccvO9Y8Sg6sysF
	ijazZNlVpjSAep9tHN0rigo=
X-Google-Smtp-Source: APXvYqypXEHEXXcHadi5BQ09jx9QZqfmlo4nwGeEItOhjxhsWgcWIml6Bv1VaSU5VxT0gyAiHVrjPA==
X-Received: by 2002:a9d:5ccd:: with SMTP id r13mr12285243oti.73.1570814064611;
        Fri, 11 Oct 2019 10:14:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:32a4:: with SMTP id u33ls1590650otb.16.gmail; Fri, 11
 Oct 2019 10:14:24 -0700 (PDT)
X-Received: by 2002:a9d:66d2:: with SMTP id t18mr14079606otm.154.1570814064171;
        Fri, 11 Oct 2019 10:14:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570814064; cv=none;
        d=google.com; s=arc-20160816;
        b=t5vc6P8eFkGvH+XhaXLkvRHAofwAfWnisL4q/8P+fr/alR6wcKZjSsbjMHTrY4P8AU
         rceY8PZWcxwxkPlhfEnUqmCXXb4oczF+AyQTE0dQd57UQYLckiqnpRn1ODFZkvioY7Kz
         qZH9Xw2qtV/gu18o/p0BhkOuo11EoCVofX0hOgrNmQXqYdiiM/GLHkXlfdrzQ8rmL7ds
         /gUeQBO4Iq7cWGuCItnzRFAtsUlis9q/BlWyyl/HuEPbQaTmPo9FS+u9UGtDQqbcCVVK
         xqG28LEtnJaCkfbnjMDzDITxh9RQF1QLpQsX8ujG0coQ6sYXC15OFtZvpN16j+JGG6iM
         8q4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=CLZwmgRbIbwIXVIo/GQUnlNk0UpWIpTOQFWj+AB1jQg=;
        b=FxRCdN1XwcUcuh2v4L827QBxUSTaQ8Wuc7ljF5e5Spr0EZHX3W1NriS7PQc5Od1GPX
         myePOlQaeJnayU660EpI+RST1y/+JXnSV4HD9YLDy7wv8cunfgYoSaW/xCgtIXs5VvEH
         /lEee7+UMiJ9E0ABktdYRYTPfwN7MetuskzJV5kr/JVpvD7X3+lCV4oFIdS/d6QROTFQ
         k2HoB2x2wJ61TOq64EY3Vbj2ZKGOgsUeC0T2aWoLj3D6/NE7onMAWHEVJ/81BBTZafnD
         708NvDqWRWhDi0J2G7S3+ZN6dWM5loHJLMM+dJYuTmWedL3cUeYbv2zQictOvmNeStH7
         K50w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uV4UlXT7;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id n10si97060otf.2.2019.10.11.10.14.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 10:14:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BHENqD012062;
	Fri, 11 Oct 2019 12:14:23 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9BHEN8U068044
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Oct 2019 12:14:23 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 12:14:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 12:14:19 -0500
Received: from [158.218.117.99] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BHENqJ048102;
	Fri, 11 Oct 2019 12:14:23 -0500
Subject: Re: [EXTERNAL] Re: [PATCH 3/4] arm: am57xx: introduce support for TI
 am57xx SOC
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
 <1570731650-5335-4-git-send-email-vitalya@ti.com>
 <0b85c51a-0078-47fb-70ba-a8f9def7b852@siemens.com>
 <357f2bee-176a-af2c-e603-9f907f1594a0@siemens.com>
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <08dd6eee-2ea4-2c05-0309-138e2e18d5df@ti.com>
Date: Fri, 11 Oct 2019 13:08:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <357f2bee-176a-af2c-e603-9f907f1594a0@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=uV4UlXT7;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.23.248 as permitted
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

Jan,
Thanks for the quick response.

On 10/11/2019 11:37 AM, Jan Kiszka wrote:
> On 11.10.19 17:24, Jan Kiszka wrote:
>> On 10.10.19 20:20, 'Vitaly Andrianov' via Jailhouse wrote:
>>> This commit introduces support for TI AM57xx SOC. Original support was =
done
>>> by Jan Kiszka for v0.7 version, but wasn't upstreamed yet.
>>>
>>
>> This lacks a design description. Even for me, because I always need to r=
ecall the non-trival logic=20
>> here.
>>
>> IIRC, SMP cores on that platform are brought up during boot by writing t=
heir continuation address=20
>> into a mailbox (OMAP_WKUPGEN_BASE + OMAP_AUX_CORE_BOOT_<CPU>). They stay=
 in that WFE state - how=20
>> do we kick them out of this, normally as well as while under Jailhouse c=
ontrol? Where does the=20
>> code for this checker loop come from when Jailhouse is in charge? Should=
 Jailhouse better provider=20
>> it, like we do on x86 (look for parking_code)?

When I ported the AM572x support to the v0.10 version I played with putting=
 cpu offline and online.=20
If I'm not wrong in both cases (w/o Jailhouse or with) calling cpu_on() iss=
ues an smc call. I think=20
the parameter was #109, which sets ARM15 timer for the CPU1. Let me do some=
 research.

Regards,
-Vitaly

>>
>> For reference (should ideally go into the commit log or some comment as =
well): AM572x TRM, section=20
>> "33.3.4.1. Startup".
>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
>>> ---
>>> =C2=A0 hypervisor/arch/arm/Kbuild=C2=A0=C2=A0 |=C2=A0 2 +
>>> =C2=A0 hypervisor/arch/arm/am57xx.c | 98 ++++++++++++++++++++++++++++++=
++++++++++++++
>>> =C2=A0 2 files changed, 100 insertions(+)
>>> =C2=A0 create mode 100644 hypervisor/arch/arm/am57xx.c
>>>
>>> diff --git a/hypervisor/arch/arm/Kbuild b/hypervisor/arch/arm/Kbuild
>>> index e1bec1b..2ef89c3 100644
>>> --- a/hypervisor/arch/arm/Kbuild
>>> +++ b/hypervisor/arch/arm/Kbuild
>>> @@ -26,3 +26,5 @@ lib-y +=3D mmu_hyp.o caches.o
>>> =C2=A0 #=C2=A0 gcc7 will bring a new function attribute "no_profile_ins=
trument_function"
>>> =C2=A0 #=C2=A0 should switch to that for higher granularity, but gcc7 i=
s not even there
>>> =C2=A0 CFLAGS_mmu_hyp.o +=3D -fno-profile-arcs -fno-test-coverage
>>> +
>>> +lib-$(CONFIG_MACH_AM57XX) +=3D am57xx.o
>>> diff --git a/hypervisor/arch/arm/am57xx.c b/hypervisor/arch/arm/am57xx.=
c
>>> new file mode 100644
>>> index 0000000..1aa2328
>>> --- /dev/null
>>> +++ b/hypervisor/arch/arm/am57xx.c
>>> @@ -0,0 +1,98 @@
>>> +/*
>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>> + *
>>> + * Copyright (c) ARM Limited, 2014
>>> + * Copyright (c) Siemens AG, 2016
>>> + * Copyright (c) Texas Instruments Incorporated, 2019
>>> + *
>>> + * Authors:
>>> + *=C2=A0 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
>>> + *=C2=A0 Jan Kiszka <jan.kiszka@siemens.com>
>>> + *=C2=A0 Vitaly Andrianov <vitalya@ti.com>
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0 See
>>> + * the COPYING file in the top-level directory.
>>> + */
>>> +
>>> +#include <jailhouse/control.h>
>>> +#include <jailhouse/mmio.h>
>>> +#include <jailhouse/printk.h>
>>> +#include <jailhouse/unit.h>
>>> +#include <jailhouse/percpu.h>
>>> +#include <asm/control.h>
>>> +#include <asm/psci.h>
>>> +#include <asm/smccc.h>
>>> +#include <asm/setup.h>
>>> +#include <asm/traps.h>
>>> +#include <asm/sysregs.h>
>>> +
>>> +#define OMAP_WKUPGEN_BASE=C2=A0=C2=A0=C2=A0 0x48281000
>>> +#define OMAP_AUX_CORE_BOOT_0=C2=A0=C2=A0=C2=A0 0x800
>>> +
>>> +const unsigned int smp_mmio_regions;
>>
>> Unused.
>>
>>> +
>>> +static void *wkupgen_base =3D NULL;
>>> +
>>> +static int am57xx_init(void)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 wkupgen_base =3D paging_map_device(OMAP_WKUPGEN_BAS=
E, PAGE_SIZE);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return (wkupgen_base =3D=3D NULL) ? -ENOMEM : 0;
>>> +}
>>> +
>>> +static int am57xx_cell_init(struct cell *cell)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +
>>> +void suspend_cpu(unsigned int cpu_id);
>>> +static void am57xx_cell_exit(struct cell *cell)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>>> +=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell->cpu_set) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 public_per_cpu(cpu)->cpu_on=
_entry =3D
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmi=
o_read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu * 4);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 public_per_cpu(cpu)->cpu_on=
_context =3D 0;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 suspend_cpu(cpu);
>>
>> Why do we need suspend_cpu? It is suspended when the cell destruction st=
arts (via cell_suspend),=20
>> i.e. before this call.
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>
>> This resumes the CPU already here. Partly explains my questions on the t=
op: We have no signal, we=20
>> kick the re-assigned root cell cores off immediately.
>>
>> Start address is what Linux defined for its original boot by filling OMA=
P_AUX_CORE_BOOT_<CPU>. We=20
>> are lucky still being able to read this value back above...
>>
>> There is really no signal we could take that Linux sends when logically =
onlining the CPUs again=20
>> after cell destruction?
>>
>> BTW, what happens when you manually offline a CPU before assigning it to=
 new cell? Then the=20
>> Jailhouse driver will not online it on destruction, but we kick it off u=
nconditionally, don't we?
>>
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +}
>>> +
>>> +int arch_handle_smc(struct trap_context *ctx)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 unsigned long *regs =3D ctx->regs;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 switch (regs[12]) {
>>> +=C2=A0=C2=A0=C2=A0 case 0x102:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_write_banked_reg(ELR_hy=
p, regs[0]);
>>
>> This is probably "API_HYP_ENTRY" for the kernel - is there an official n=
ame?
>>
>> My current understanding is that Linux runs this during omap5_secondary_=
hyp_startup normally in=20
>> the hope to be taking into HYP mode at the specified (r0) address. We si=
mple jump there, but not=20
>> in SVC mode. Works by luck with Linux, right?
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>> +=C2=A0=C2=A0=C2=A0 case 0x109:
>>
>> This is OMAP5_DRA7_MON_SET_CNTFRQ_INDEX according to Linux, and we shoul=
d leave some words why we=20
>> can simply call that smc on behalf of the guest. I added it back then be=
cause "then it works", not=20
>> because of "I fully understand what I'm doing".
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".a=
rch_extension sec\n\t"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "pu=
sh {r0-r12, lr}\n\t"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "mo=
v ip,%0\n\t"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "mo=
v r0,%1\n\t"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "sm=
c #0\n\t"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "po=
p {r0-r12, lr}\n\t"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=
 "r" (regs[0]), "r" (regs[12]));
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_skip_instruction(ctx);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (SMCCC_IS_CONV_64(regs[0]))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_FORBIDDEN;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (IS_PSCI_UBOOT(regs[0])) {
>>
>> This path is here because non-root Linux is told to use PSCI for SMP man=
agement, right?
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs[0] =3D psci_dispatch(c=
tx);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_skip_instruction(ctx);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return handle_smc(ctx);
>>> +}
>>> +
>>> +DEFINE_UNIT_SHUTDOWN_STUB( am57xx );
>>
>> ...(am58xx);
>>
>>> +DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB( am57xx );
>>> +DEFINE_UNIT( am57xx, "AM57XX" );
>>> +
>>>
>>
>> Jan
>>
>=20
> Oh, and there should also be a note on how this platform support is enabl=
ed (CONFIG_MACH_AM57XX...)=20
> and that, when it's on, the hypervisor binary is no longer universal - wh=
ich is currently the case.
>=20
> The risk with this approach is that the optional code will silently break=
 over time because it is=20
> not part of the main tests. We had that with vexpress in the past.
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/08dd6eee-2ea4-2c05-0309-138e2e18d5df%40ti.com.
