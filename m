Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMOUQLWQKGQEX2365LI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id BC742D4523
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 18:13:37 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id k2sf4570543wrn.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 09:13:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570810417; cv=pass;
        d=google.com; s=arc-20160816;
        b=BLuOdwgqWp/LbApDAyJhqB776Ea5VXpz0GO1yqBqdn0DlGxgTqAFUVEJsJG+/VgZf0
         j7TDJLLPrdzGFIMfciRLGnMHlxXybiPVkkRNvhr8qB1ch9R37Yr+Bx8Iz5C9QfrvllQv
         /wiNtFbTBo2Xh7g09EUD4XVx2qHJ6eBIAmHa5wmehGPk8UADnECGKDQRqdBzyFrHEzcs
         0EQ2YK6KOr5jLJ8doZHWRSsrJdpZmtN9aGyJS2gKJkKxT/i3BirpzXuXikaZwHlgDbvi
         Vr4k9HrhFozFdMKF2uRZ+Ei26ib22qpcAeex/3pG1BXgTTP+ECiaPck+o2gta4uNRjT3
         mycQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=4BjA8+zOB3BFTraHiJM7cCPrOcRff4u8mKumXYwYQ5s=;
        b=CHR9u3VmiC8XTUgLe4a25yi1/M8RUENi7VmVfQ5vzhFV8AY4Ndw79foFkUV7YKc5cO
         4o6v6ADdSlTU5UBxl/P3NG2rVcozSXSYX0pdsZ4t5pGO+AqMxb40fhw7v084EFn6X6gs
         X/0APAf7YnWLc7ziaTOJzPql9342/XLFkQZq5bPUYmLRcsPonq+crh0sELy7QuxYI1YV
         NmPaHacIIP9CZ5iizNdgHJZdRXFx4lzMeUEqpytO7I1qWruEcOvjpuFmtBRMQ7X2MDl1
         PDzTZJXPfgXRLXak3Yfwki35eXqJDnHz7wh52NhoU+AYciueV7Gu6KIYkAVSo/kOtdi8
         SBcw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4BjA8+zOB3BFTraHiJM7cCPrOcRff4u8mKumXYwYQ5s=;
        b=Kwy+G4PA5xFOI1hUj5kxE7kBvtOBirdiC+wOj7mdaZOscNWDCobRjQkgKo3l6Q42OL
         T1whq+QC8UJcBoq7PrAD8n8lmuz7cvWgqqMayVMTkxKq643whQOVlpOTkmHG1OpBMXD6
         NZ0hkLJcTnPafesIlaFyabr4JGi9FmC1jd8Y1vtg4XLwPqymjgRiYITHwRyACg3vjlBL
         He2RW5v64nV2lp1YAs2ICCG0yxnE8O/YQ1SyQyL3Ys6DikLKFRlLdw+JORCUfeTEDcmc
         eZ09a8zEoiBkChv9ANZemswb/plINscB7mD+zP0s5mClSd2qNklubCqLhFFxotdUlMC/
         aM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4BjA8+zOB3BFTraHiJM7cCPrOcRff4u8mKumXYwYQ5s=;
        b=P9gEvdFjeCNyY40ygWTOEnHbk5PN2B+1zB7Lm99mf+HTRDRRF/FVnDaaNk6y/aTU+c
         nenHC9hIqF//fWebbCeSCI2pVEraiL1dovfsIaCC+6J7AQmnOsLjRjSjTnETK+LNfwev
         6BUHW7waAcZkSuPtrbC/k+J8N+xkLiajpd5O3Yc6lHxg9wxbJt3UEanhCZx5EccQK8U1
         x2Aqd3YSdSN6Rn1VR/X+rmMvmD7S1qpSPhMZ4v+rYxk6wZZn+Vj+7mP8wVGBJeYNiRkJ
         fllHwBL6hWTN+7P34/FssHWKKxGTEmHcD70XaaoITAf4wa9AHJ8/JOeAWD/pv6b88jU3
         av2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXyxhFHpGWnEJ7rKFF11X50gFoJkR5D9GsGaQgFcG2mu2otu+yN
	FMkIOzztG4vnGzG03+etl7s=
X-Google-Smtp-Source: APXvYqy1Yb22odhkOIaFaHpNF6PD3TwJUGU1IUQzs3z0dk5ys2yQZntaLCKIhTiLfQtVuhC88g2W5w==
X-Received: by 2002:a1c:1bd8:: with SMTP id b207mr3794200wmb.62.1570810417408;
        Fri, 11 Oct 2019 09:13:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4c42:: with SMTP id n2ls2759127wrt.8.gmail; Fri, 11 Oct
 2019 09:13:36 -0700 (PDT)
X-Received: by 2002:a5d:4ecc:: with SMTP id s12mr11025156wrv.73.1570810416773;
        Fri, 11 Oct 2019 09:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570810416; cv=none;
        d=google.com; s=arc-20160816;
        b=n6S5EKXHCuYelEzi3T9y2CbOvsqEbdA6YVgz9S5aPhHa5HDgU8wWgXmW8pIfiNVqx+
         kNVyA1IaqaFrV51Nz6EQAERig3p5fj+eM5xfOXCy1xEHJC9BqUI9JuFRWIWJGwZ6K+0F
         5d+P2c3ijTeD073qvirw29i7B3aPAYrk7bAyjftNPp2SQhnQHdGgztlaS3tHWlyAs7VB
         Q3/WMfJiVNvZKeYhREn7to0D4ZMJ9/r6zShnMf3r/D4jMTSxnGApdsueeKVhqIAu2mNf
         hJCh3gPnwFTVutNOA+/OuQDc9YwJnPAKg5dqeY+xyQnSPjjTvT+YfICgFSVgfXlbSgVS
         Ozgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=T4zJ1N1wUyMRB0fFWNW9O1ou0YyOk8wOAmd+Zn1rrn0=;
        b=uZ6g9v69PQqIAF3LyMohe+/7BGbPO8MkkRPT9Xxwvpl4TYNpi7aoj552Dlqa8LlCrs
         jZQy7nJEnZXRfcsvYatQKhzkdGU/5f+XH2KFqdKETvnB3nkf5KHBuQSq5mZWTY4O2RCA
         y+2X7kNfVvS1xlAV35CY989BDy603ar+O0MewTBv3jdlMcqJhsNsdfkxWFUzADI2HNpa
         +u3qiJ2FiSB09VVFatc4TPCztFTcVST3wwS6myFM+5LhQtqe/CFAApfH8wwiwLG6H7zm
         ONNoNFWP7UEk95JYXMDmYgoq5TgEM98MdBYJ7Zrc6Yy6c9oXEbanvH7MWIBerrJBocuM
         e4Nw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id r1si404000wrn.2.2019.10.11.09.13.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 09:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x9BGDa0D001201
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Oct 2019 18:13:36 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9BGDa4P000924;
	Fri, 11 Oct 2019 18:13:36 +0200
Subject: Re: [PATCH 3/4] arm: am57xx: introduce support for TI am57xx SOC
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Vitaly Andrianov <vitalya@ti.com>, jailhouse-dev@googlegroups.com
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
 <1570731650-5335-4-git-send-email-vitalya@ti.com>
 <0b85c51a-0078-47fb-70ba-a8f9def7b852@siemens.com>
 <357f2bee-176a-af2c-e603-9f907f1594a0@siemens.com>
 <a2ca04dc-8212-1e0b-c3dc-f3b58fc2cb12@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <32d719ab-04f9-f57a-d8b1-33f6467da855@siemens.com>
Date: Fri, 11 Oct 2019 18:13:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <a2ca04dc-8212-1e0b-c3dc-f3b58fc2cb12@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 11.10.19 18:09, Ralf Ramsauer wrote:
>=20
>=20
> On 10/11/19 5:37 PM, Jan Kiszka wrote:
>> On 11.10.19 17:24, Jan Kiszka wrote:
>>> On 10.10.19 20:20, 'Vitaly Andrianov' via Jailhouse wrote:
>>>> This commit introduces support for TI AM57xx SOC. Original support
>>>> was done
>>>> by Jan Kiszka for v0.7 version, but wasn't upstreamed yet.
>>>>
>>>
>>> This lacks a design description. Even for me, because I always need to
>>> recall the non-trival logic here.
>>>
>>> IIRC, SMP cores on that platform are brought up during boot by writing
>>> their continuation address into a mailbox (OMAP_WKUPGEN_BASE +
>>> OMAP_AUX_CORE_BOOT_<CPU>). They stay in that WFE state - how do we
>>> kick them out of this, normally as well as while under Jailhouse
>>> control? Where does the code for this checker loop come from when
>>> Jailhouse is in charge? Should Jailhouse better provider it, like we
>>> do on x86 (look for parking_code)?
>>>
>>> For reference (should ideally go into the commit log or some comment
>>> as well): AM572x TRM, section "33.3.4.1. Startup".
>>>
>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
>>>> ---
>>>>  =C2=A0 hypervisor/arch/arm/Kbuild=C2=A0=C2=A0 |=C2=A0 2 +
>>>>  =C2=A0 hypervisor/arch/arm/am57xx.c | 98
>>>> ++++++++++++++++++++++++++++++++++++++++++++
>>>>  =C2=A0 2 files changed, 100 insertions(+)
>>>>  =C2=A0 create mode 100644 hypervisor/arch/arm/am57xx.c
>>>>
>>>> diff --git a/hypervisor/arch/arm/Kbuild b/hypervisor/arch/arm/Kbuild
>>>> index e1bec1b..2ef89c3 100644
>>>> --- a/hypervisor/arch/arm/Kbuild
>>>> +++ b/hypervisor/arch/arm/Kbuild
>>>> @@ -26,3 +26,5 @@ lib-y +=3D mmu_hyp.o caches.o
>>>>  =C2=A0 #=C2=A0 gcc7 will bring a new function attribute
>>>> "no_profile_instrument_function"
>>>>  =C2=A0 #=C2=A0 should switch to that for higher granularity, but gcc7=
 is not
>>>> even there
>>>>  =C2=A0 CFLAGS_mmu_hyp.o +=3D -fno-profile-arcs -fno-test-coverage
>>>> +
>>>> +lib-$(CONFIG_MACH_AM57XX) +=3D am57xx.o
>>>> diff --git a/hypervisor/arch/arm/am57xx.c b/hypervisor/arch/arm/am57xx=
.c
>>>> new file mode 100644
>>>> index 0000000..1aa2328
>>>> --- /dev/null
>>>> +++ b/hypervisor/arch/arm/am57xx.c
>>>> @@ -0,0 +1,98 @@
>>>> +/*
>>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>>> + *
>>>> + * Copyright (c) ARM Limited, 2014
>>>> + * Copyright (c) Siemens AG, 2016
>>>> + * Copyright (c) Texas Instruments Incorporated, 2019
>>>> + *
>>>> + * Authors:
>>>> + *=C2=A0 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
>>>> + *=C2=A0 Jan Kiszka <jan.kiszka@siemens.com>
>>>> + *=C2=A0 Vitaly Andrianov <vitalya@ti.com>
>>>> + *
>>>> + * This work is licensed under the terms of the GNU GPL, version 2.
>>>> See
>>>> + * the COPYING file in the top-level directory.
>>>> + */
>>>> +
>>>> +#include <jailhouse/control.h>
>>>> +#include <jailhouse/mmio.h>
>>>> +#include <jailhouse/printk.h>
>>>> +#include <jailhouse/unit.h>
>>>> +#include <jailhouse/percpu.h>
>>>> +#include <asm/control.h>
>>>> +#include <asm/psci.h>
>>>> +#include <asm/smccc.h>
>>>> +#include <asm/setup.h>
>>>> +#include <asm/traps.h>
>>>> +#include <asm/sysregs.h>
>>>> +
>>>> +#define OMAP_WKUPGEN_BASE=C2=A0=C2=A0=C2=A0 0x48281000
>>>> +#define OMAP_AUX_CORE_BOOT_0=C2=A0=C2=A0=C2=A0 0x800
>>>> +
>>>> +const unsigned int smp_mmio_regions;
>>>
>>> Unused.
>>>
>>>> +
>>>> +static void *wkupgen_base =3D NULL;
>>>> +
>>>> +static int am57xx_init(void)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 wkupgen_base =3D paging_map_device(OMAP_WKUPGEN_BA=
SE, PAGE_SIZE);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return (wkupgen_base =3D=3D NULL) ? -ENOMEM : 0;
>>>> +}
>>>> +
>>>> +static int am57xx_cell_init(struct cell *cell)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>> +}
>>>> +
>>>> +void suspend_cpu(unsigned int cpu_id);
>>>> +static void am57xx_cell_exit(struct cell *cell)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>>>> +=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell->cpu_set) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 public_per_cpu(cpu)->cpu_o=
n_entry =3D
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm=
io_read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu * 4);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 public_per_cpu(cpu)->cpu_o=
n_context =3D 0;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 suspend_cpu(cpu);
>>>
>>> Why do we need suspend_cpu? It is suspended when the cell destruction
>>> starts (via cell_suspend), i.e. before this call.
>>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>>
>>> This resumes the CPU already here. Partly explains my questions on the
>>> top: We have no signal, we kick the re-assigned root cell cores off
>>> immediately.
>>>
>>> Start address is what Linux defined for its original boot by filling
>>> OMAP_AUX_CORE_BOOT_<CPU>. We are lucky still being able to read this
>>> value back above...
>>>
>>> There is really no signal we could take that Linux sends when
>>> logically onlining the CPUs again after cell destruction?
>>>
>>> BTW, what happens when you manually offline a CPU before assigning it
>>> to new cell? Then the Jailhouse driver will not online it on
>>> destruction, but we kick it off unconditionally, don't we?
>>>
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +}
>>>> +
>>>> +int arch_handle_smc(struct trap_context *ctx)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 unsigned long *regs =3D ctx->regs;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 switch (regs[12]) {
>>>> +=C2=A0=C2=A0=C2=A0 case 0x102:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_write_banked_reg(ELR_h=
yp, regs[0]);
>>>
>>> This is probably "API_HYP_ENTRY" for the kernel - is there an official
>>> name?
>>>
>>> My current understanding is that Linux runs this during
>>> omap5_secondary_hyp_startup normally in the hope to be taking into HYP
>>> mode at the specified (r0) address. We simple jump there, but not in
>>> SVC mode. Works by luck with Linux, right?
>>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>>> +=C2=A0=C2=A0=C2=A0 case 0x109:
>>>
>>> This is OMAP5_DRA7_MON_SET_CNTFRQ_INDEX according to Linux, and we
>>> should leave some words why we can simply call that smc on behalf of
>>> the guest. I added it back then because "then it works", not because
>>> of "I fully understand what I'm doing".
>>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile(
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".=
arch_extension sec\n\t"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "p=
ush {r0-r12, lr}\n\t"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "m=
ov ip,%0\n\t"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "m=
ov r0,%1\n\t"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "s=
mc #0\n\t"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "p=
op {r0-r12, lr}\n\t"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : =
: "r" (regs[0]), "r" (regs[12]));
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_skip_instruction(ctx)=
;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (SMCCC_IS_CONV_64(regs[0]))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_FORBIDDEN;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (IS_PSCI_UBOOT(regs[0])) {
>>>
>>> This path is here because non-root Linux is told to use PSCI for SMP
>>> management, right?
>>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs[0] =3D psci_dispatch(=
ctx);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_skip_instruction(ctx)=
;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return handle_smc(ctx);
>>>> +}
>>>> +
>>>> +DEFINE_UNIT_SHUTDOWN_STUB( am57xx );
>>>
>>> ...(am58xx);
>>>
>>>> +DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB( am57xx );
>>>> +DEFINE_UNIT( am57xx, "AM57XX" );
>>>> +
>>>>
>>>
>>> Jan
>>>
>>
>> Oh, and there should also be a note on how this platform support is
>> enabled (CONFIG_MACH_AM57XX...) and that, when it's on, the hypervisor
>> binary is no longer universal - which is currently the case.
>>
>> The risk with this approach is that the optional code will silently
>> break over time because it is not part of the main tests. We had that
>> with vexpress in the past.
>=20
> What about a flag in the system configuration?
>=20
> I'd rather prefer to keep an universal binary, instead of re-introducing
> compile-time switches for different configurations. It was some effort
> to get rid of those switches, and at the moment, only debugging switches
> and inmate-related switches are left.
>=20
> Downside: Even if the unit wouldn't register itself if the flag isn't
> set, the debug output would contain a confusing
> "Initializing unit AM57XX" entry.

It's not against the idea behind units, though. On Intel, we also launch=20
CAT, irrespective of hardware support.

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
jailhouse-dev/32d719ab-04f9-f57a-d8b1-33f6467da855%40siemens.com.
