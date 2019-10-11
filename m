Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOGDQLWQKGQEINORDAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 23614D4482
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 17:37:29 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id d7sf5975588edp.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 08:37:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570808248; cv=pass;
        d=google.com; s=arc-20160816;
        b=N0v/EIV4zf5IhXyDZnEO9r3uq5WFtpFy5+e1a1ipTO74jNX2vU94lFdDHinFD9cTI7
         ldcq/Y5lMf4RXw4dORcXJgtSzzu5UptlXM9nytujd0+RkuBN6EBkvh9HP2gLHOYhBrXl
         Xzmt4h3BEia6MImVKDjtmDhu3t4Vph5y8UdIiSdUeBtLCT5LTZri+Ul91VRYyHv/I7o4
         V1mmwORl8zqBU8HMW9ZIAHeh+6C8UkGhZN14DMZK3bl40rLCeGdGcOFDS7m0ItW+ZV8p
         TiRvr7iHNW0ZV5JL77CAHbrzndqnxIIErZ57FXD3goHTj+Ikk+9dSdJbC2CxoXz3Q+JC
         8o3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=21QMd8UO/2w/sQXLkkWFjUvlJtS3oAnTUgwpMncspf8=;
        b=gI8D+AAWvNQw0QNtZwiT6O/86L4vlBBh1S85FDSs7KPNK5XE8IQTFLupPobX2hpXcz
         x6S/um8uMdCQ+4BkMB9AOBNjGtXrniMoxPzfCPg2gZyX6De/weRTwJcDVYYrcS4XvCUF
         EOwgoQnnZe/irZsLb6B58aSLL1z70XShs3Vqb/WodpCZOhauRrBhOuCA5fGeL7ZibhBS
         4557iwhyUjXGGT4Er+jd96uy4fYDptCbYBKwwr76afsa2G0FDSGcfzgpzq2q2ZLEKt3D
         qw7W6NdJ18gL3Eui8tZBMaXJp0mgYNpUcG/DhSRYFhEi7rRI+MKA4pd5yzH/IOjNEl2v
         ZZ/Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=21QMd8UO/2w/sQXLkkWFjUvlJtS3oAnTUgwpMncspf8=;
        b=CxuILzS7uil+wZ7odpJFh8uPbBUnUGw4uY/iKwyzVcBw5pHfuKqlWdDd9CBi6r8Upl
         uJwsGdmd0atNhGXIoD6DZzorLGS02kG4cSWCC1lfNwpKySgpzn2/lc/fzwKWe7H2r3U+
         VLSimM9X3wDGfA3NFZkzfWIk+pDVgtrJtkXdpOg8Q6/84prxzHNuwYn8Bbrn5iNPIqof
         sUUE+vgvk3oY/550szr/+rdCxctua4/K2CKjWdioOnWoeIrCn/ndYbYhbOz4SLlSp/i+
         JaKKq6Wyr/1ixEo+w3/jpmfg4ggOe2qoYPBoPEmarjQAElRxkABTQdqjwRoIHW6qNAMu
         myww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=21QMd8UO/2w/sQXLkkWFjUvlJtS3oAnTUgwpMncspf8=;
        b=B9osd4qlJFIBF1jta+bcUR9E/4XCTrOh1y2gKLJtNB4AxFNy/3cDN8aLakQ1+mS1HB
         ic21GbK0sk6HY53AHrVC7J7RlsQ1alBPXh4GNHwVtJ5zOauHjB0ohO/rMaUn/pj0bfrA
         xhbu1rKCC36vgq1h+IFwIpjB0HVM+i72PRBZ0BedtymYDReFykIOmvEHHT0LogEFOE+v
         u1rsS9+lQVYpLdhFm1LkjZB0K2XXB7Pt3PPJg1wL29E9kPr9XJScAjAO3NjqJXIrPhYx
         VKmJToy7wwiJsK/u/U9oHlutUXWulYhFaluiM3+7USOqUpoErZsQCKcZl69jvUXjfDA3
         SRkA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVMNmkx+oPx05V53Ukmf0uu3zFyjf6hgw1Yr4Q9vfFOH2g3r48w
	7H7SD3pc+Ad/znQp1C/UtHE=
X-Google-Smtp-Source: APXvYqwEtnW8NZqwJKKPU7oB4cp4colCkpOpfw3ckqi0vuPaqGm9ScqQZq8nF7XVoG6FIL7fRjDT6A==
X-Received: by 2002:a17:906:82cf:: with SMTP id a15mr14568769ejy.279.1570808248793;
        Fri, 11 Oct 2019 08:37:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d98d:: with SMTP id u13ls1819252eds.12.gmail; Fri, 11
 Oct 2019 08:37:28 -0700 (PDT)
X-Received: by 2002:aa7:d842:: with SMTP id f2mr14294950eds.27.1570808248132;
        Fri, 11 Oct 2019 08:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570808248; cv=none;
        d=google.com; s=arc-20160816;
        b=yiLvF81OsKDHCM8uNQ2VR9/uUgeeEHwROaqDjzh4/ouMH19XZLru40a0wrIkCOpPON
         b6JBmNfXtweAC0rMpV1y+JIjBn1CRpYlyavPv/zyJaaZRd4oYYhPdohmjWM/mUw2lAf1
         D8HlDuJPvvcaKkfAqMNP97/hjRAWj760yjzazEab3i95AHYtKotrJngkdadfGleHdVOL
         juh2dMRwwlpHxIrLxfd6jnHzM+6Q61rvE370N72+4lX2rqtSkVO2k1DXqDZOgXnGo13e
         bGFyTMoqrtVkaXH0SkhXLo5Im9vhm1J2VGXLFuREQ137LPtkywKAeMY7Pdea2txHu/aQ
         2EWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=37X9CAitRQ9yFnZtANQovBZf5X5KLMXsWwDP03aWoio=;
        b=jPfjqACswzu4ntkjDRPkLdtsSmqVo9tVli134Q9foi1Pfpi7cD0h0+E781GYDrUOaS
         RWqIMCQ2ZBjt+kE7tjDlYk62Iyx4HGO8nkBvUVAeqWyB6LdmUgpGc6B1nV8qhGUeu523
         V37W4EBU1X4tlKwd7BoPdbTyVQjfB+MwiShD/woLELUeCmU0IruMj5Ii0M8+k3u3VYs1
         PtfIWngoOkaqnRqt3KutPvUZZpUWyFsODapQu0PaJJGEgoEdUHe9GDPEQWagi3FAMiJ4
         RyCwG1BtAcebLlRCXwNcorDKrnoG8daLU8hftHIVtp5/pDzTzIOP39nl0MiqGat5oHet
         wPIQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id q8si254729edn.5.2019.10.11.08.37.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 08:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x9BFbRAs018576
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Oct 2019 17:37:27 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9BFbQuh023124;
	Fri, 11 Oct 2019 17:37:27 +0200
Subject: Re: [PATCH 3/4] arm: am57xx: introduce support for TI am57xx SOC
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Vitaly Andrianov <vitalya@ti.com>, jailhouse-dev@googlegroups.com
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
 <1570731650-5335-4-git-send-email-vitalya@ti.com>
 <0b85c51a-0078-47fb-70ba-a8f9def7b852@siemens.com>
Message-ID: <357f2bee-176a-af2c-e603-9f907f1594a0@siemens.com>
Date: Fri, 11 Oct 2019 17:37:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <0b85c51a-0078-47fb-70ba-a8f9def7b852@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 11.10.19 17:24, Jan Kiszka wrote:
> On 10.10.19 20:20, 'Vitaly Andrianov' via Jailhouse wrote:
>> This commit introduces support for TI AM57xx SOC. Original support was=
=20
>> done
>> by Jan Kiszka for v0.7 version, but wasn't upstreamed yet.
>>
>=20
> This lacks a design description. Even for me, because I always need to=20
> recall the non-trival logic here.
>=20
> IIRC, SMP cores on that platform are brought up during boot by writing=20
> their continuation address into a mailbox (OMAP_WKUPGEN_BASE +=20
> OMAP_AUX_CORE_BOOT_<CPU>). They stay in that WFE state - how do we kick=
=20
> them out of this, normally as well as while under Jailhouse control?=20
> Where does the code for this checker loop come from when Jailhouse is in=
=20
> charge? Should Jailhouse better provider it, like we do on x86 (look for=
=20
> parking_code)?
>=20
> For reference (should ideally go into the commit log or some comment as=
=20
> well): AM572x TRM, section "33.3.4.1. Startup".
>=20
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
>> ---
>> =C2=A0 hypervisor/arch/arm/Kbuild=C2=A0=C2=A0 |=C2=A0 2 +
>> =C2=A0 hypervisor/arch/arm/am57xx.c | 98=20
>> ++++++++++++++++++++++++++++++++++++++++++++
>> =C2=A0 2 files changed, 100 insertions(+)
>> =C2=A0 create mode 100644 hypervisor/arch/arm/am57xx.c
>>
>> diff --git a/hypervisor/arch/arm/Kbuild b/hypervisor/arch/arm/Kbuild
>> index e1bec1b..2ef89c3 100644
>> --- a/hypervisor/arch/arm/Kbuild
>> +++ b/hypervisor/arch/arm/Kbuild
>> @@ -26,3 +26,5 @@ lib-y +=3D mmu_hyp.o caches.o
>> =C2=A0 #=C2=A0 gcc7 will bring a new function attribute=20
>> "no_profile_instrument_function"
>> =C2=A0 #=C2=A0 should switch to that for higher granularity, but gcc7 is=
 not=20
>> even there
>> =C2=A0 CFLAGS_mmu_hyp.o +=3D -fno-profile-arcs -fno-test-coverage
>> +
>> +lib-$(CONFIG_MACH_AM57XX) +=3D am57xx.o
>> diff --git a/hypervisor/arch/arm/am57xx.c b/hypervisor/arch/arm/am57xx.c
>> new file mode 100644
>> index 0000000..1aa2328
>> --- /dev/null
>> +++ b/hypervisor/arch/arm/am57xx.c
>> @@ -0,0 +1,98 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright (c) ARM Limited, 2014
>> + * Copyright (c) Siemens AG, 2016
>> + * Copyright (c) Texas Instruments Incorporated, 2019
>> + *
>> + * Authors:
>> + *=C2=A0 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
>> + *=C2=A0 Jan Kiszka <jan.kiszka@siemens.com>
>> + *=C2=A0 Vitaly Andrianov <vitalya@ti.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0 See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include <jailhouse/control.h>
>> +#include <jailhouse/mmio.h>
>> +#include <jailhouse/printk.h>
>> +#include <jailhouse/unit.h>
>> +#include <jailhouse/percpu.h>
>> +#include <asm/control.h>
>> +#include <asm/psci.h>
>> +#include <asm/smccc.h>
>> +#include <asm/setup.h>
>> +#include <asm/traps.h>
>> +#include <asm/sysregs.h>
>> +
>> +#define OMAP_WKUPGEN_BASE=C2=A0=C2=A0=C2=A0 0x48281000
>> +#define OMAP_AUX_CORE_BOOT_0=C2=A0=C2=A0=C2=A0 0x800
>> +
>> +const unsigned int smp_mmio_regions;
>=20
> Unused.
>=20
>> +
>> +static void *wkupgen_base =3D NULL;
>> +
>> +static int am57xx_init(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 wkupgen_base =3D paging_map_device(OMAP_WKUPGEN_BASE=
, PAGE_SIZE);
>> +
>> +=C2=A0=C2=A0=C2=A0 return (wkupgen_base =3D=3D NULL) ? -ENOMEM : 0;
>> +}
>> +
>> +static int am57xx_cell_init(struct cell *cell)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +void suspend_cpu(unsigned int cpu_id);
>> +static void am57xx_cell_exit(struct cell *cell)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>> +=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell->cpu_set) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 public_per_cpu(cpu)->cpu_on_=
entry =3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio=
_read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu * 4);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 public_per_cpu(cpu)->cpu_on_=
context =3D 0;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 suspend_cpu(cpu);
>=20
> Why do we need suspend_cpu? It is suspended when the cell destruction=20
> starts (via cell_suspend), i.e. before this call.
>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>=20
> This resumes the CPU already here. Partly explains my questions on the=20
> top: We have no signal, we kick the re-assigned root cell cores off=20
> immediately.
>=20
> Start address is what Linux defined for its original boot by filling=20
> OMAP_AUX_CORE_BOOT_<CPU>. We are lucky still being able to read this=20
> value back above...
>=20
> There is really no signal we could take that Linux sends when logically=
=20
> onlining the CPUs again after cell destruction?
>=20
> BTW, what happens when you manually offline a CPU before assigning it to=
=20
> new cell? Then the Jailhouse driver will not online it on destruction,=20
> but we kick it off unconditionally, don't we?
>=20
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> +int arch_handle_smc(struct trap_context *ctx)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned long *regs =3D ctx->regs;
>> +
>> +=C2=A0=C2=A0=C2=A0 switch (regs[12]) {
>> +=C2=A0=C2=A0=C2=A0 case 0x102:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_write_banked_reg(ELR_hyp=
, regs[0]);
>=20
> This is probably "API_HYP_ENTRY" for the kernel - is there an official=20
> name?
>=20
> My current understanding is that Linux runs this during=20
> omap5_secondary_hyp_startup normally in the hope to be taking into HYP=20
> mode at the specified (r0) address. We simple jump there, but not in SVC=
=20
> mode. Works by luck with Linux, right?
>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>> +=C2=A0=C2=A0=C2=A0 case 0x109:
>=20
> This is OMAP5_DRA7_MON_SET_CNTFRQ_INDEX according to Linux, and we=20
> should leave some words why we can simply call that smc on behalf of the=
=20
> guest. I added it back then because "then it works", not because of "I=20
> fully understand what I'm doing".
>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".ar=
ch_extension sec\n\t"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "pus=
h {r0-r12, lr}\n\t"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "mov=
 ip,%0\n\t"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "mov=
 r0,%1\n\t"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "smc=
 #0\n\t"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "pop=
 {r0-r12, lr}\n\t"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : : =
"r" (regs[0]), "r" (regs[12]));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_skip_instruction(ctx);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (SMCCC_IS_CONV_64(regs[0]))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_FORBIDDEN;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (IS_PSCI_UBOOT(regs[0])) {
>=20
> This path is here because non-root Linux is told to use PSCI for SMP=20
> management, right?
>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs[0] =3D psci_dispatch(ct=
x);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_skip_instruction(ctx);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return handle_smc(ctx);
>> +}
>> +
>> +DEFINE_UNIT_SHUTDOWN_STUB( am57xx );
>=20
> ...(am58xx);
>=20
>> +DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB( am57xx );
>> +DEFINE_UNIT( am57xx, "AM57XX" );
>> +
>>
>=20
> Jan
>=20

Oh, and there should also be a note on how this platform support is=20
enabled (CONFIG_MACH_AM57XX...) and that, when it's on, the hypervisor=20
binary is no longer universal - which is currently the case.

The risk with this approach is that the optional code will silently=20
break over time because it is not part of the main tests. We had that=20
with vexpress in the past.

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
jailhouse-dev/357f2bee-176a-af2c-e603-9f907f1594a0%40siemens.com.
