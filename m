Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUXBQLWQKGQEKUCNO3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id C75B1D45A0
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 18:41:54 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id m14sf4588867wru.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 09:41:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570812114; cv=pass;
        d=google.com; s=arc-20160816;
        b=fTGjJc+CCIEIPO9NVR88Oh72XjmIz6EU5Vov66FkC+GRt03x4p8zLZD+lGe4LkcxOu
         fcnv5P1vEYOKHjxrRl+B/fNBVOvAvR71a8qial2cALda4focxxcdP5ea1pFa5bI7fIRW
         P06wV52toIXnQ+4jA05WX8VniYXNv3jYc/KRiVRzOUz6BKSy+ehFW02ILE6RddOtUlT0
         EmQwkV9ZnZTmGSHxPhUl+yFuezYz0CWYec62E59gjdB4RhMl1HpNKxN9v+zihqCVujXW
         jmCEGiIL3Kc9b7t0eHB+JYKyP2Z9yeiGJT1gJ7PeZhKIQHvhogKepaKb+UxiIHKrbhu5
         btXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=POoCveU9+PBIAo/z+6Fq1xfqp6wxuQj+K4NC06tez9Y=;
        b=lmapaHkYjEE8NjkQs9OfX2A7fmyA2VxCA3zaLWkbVuuzcFvnTMMVrcqtlE1feaCEUY
         Q/cvczN99CyFl3LyRZwFxQ4/Gb/uu3PW/ltQZHQLOAKgAmTOiSXs3v+5ekKhoQXgBKNz
         7Zn4eOeTyfLCp1N0sF1CtbDMmHUWe7Gv0amef5op5iW2aOYrD+yCE2aP20nzrHgOfFZB
         oDC3AQfKjQZdd/ZAgGCaoKqvuB7f4rdm+mw0BZoDPdqpyTtJrKimiuQR0judURKxq4YO
         wnA+FeDlq36eem7+E83lL2PLCipkaC9Mk0+xviofPRJT4VaDrrLNNX9Z3Q/r7Xh406uI
         OLWQ==
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
        bh=POoCveU9+PBIAo/z+6Fq1xfqp6wxuQj+K4NC06tez9Y=;
        b=h0ftOklEPqy3KZjWTsS69uk2MWHgTNwGcsX5aRNdns3euTvIWXNlqSeEL0EwAv74JY
         bqCSfwSvLiOiC+8NPSP2V0bUSTAh7GSgVLgKgCB4AQuBIh8uYsuXGlKV/QSXDfX6Pxei
         G52fukb7TB2ur/rngJoIdpoRLj+Z3aiuX76lxrIavW0FpjXiwTxLBlMG8I6j0B0Vdz0g
         rKn+rWeguAGwUcd+HP4y4rsM8p4NzB77RwfPw1WUNRRuBD/URLRPGobgT8O6iBuhXdhD
         9utE94v2gEWKpWcxuPeSjiKy5K7zsOZQGu3XKJRpoxNjr9XyB0lyWG34fhK5OQYxHM8s
         m8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=POoCveU9+PBIAo/z+6Fq1xfqp6wxuQj+K4NC06tez9Y=;
        b=ZQWMS5RDOisGE78rGYP44BWddwfpwW5KeiJctrXCTIKHtdevfBcYp4Rz81J0fb1z0G
         WwGlfTUFVqWOc5ftOtQE/Ue4FEUi+jMSOSnfyMcpOfXG2fXz0PCxd6NW7nNPGrv8Rq2j
         K65rsG3r/LN/JtUvAg1M7PjZW+ZyBwwAfCX/TEj0vwFDT+2zOrnPzAcOtdDm9+bPTYG7
         +loMwc4alt+CRp1amgpRFJf146B1CkEoJR2VQq5WZVOThzZSDkqN4CkSDRLG9sR8H5NO
         Gz6xc0ZCMyeSckVEoNrGcHNzKc+UwnIj7g1AEKpMwHcKeqeOU9yTzC2Nfdi1chslLLmN
         +S1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWTTXGnUXUguRVgWGcMjvtGjWEAH5BMybKrmB5AaSWAXlZLLZsO
	nrOhffTP3Ae8EIrqaQ4J540=
X-Google-Smtp-Source: APXvYqy7kVOqwXf14XIh6vWWeAOoF4rgxLsBA39XpYuwZm/Q3ObTC9XrKSOSxouByVMkMyE4MNvTWw==
X-Received: by 2002:a1c:2e94:: with SMTP id u142mr4075303wmu.69.1570812114442;
        Fri, 11 Oct 2019 09:41:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a391:: with SMTP id l17ls2780612wrb.11.gmail; Fri, 11
 Oct 2019 09:41:53 -0700 (PDT)
X-Received: by 2002:adf:e28f:: with SMTP id v15mr15235879wri.17.1570812113687;
        Fri, 11 Oct 2019 09:41:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570812113; cv=none;
        d=google.com; s=arc-20160816;
        b=uBl2s7aP97/wytLirvDchF1/UYTK7FtbQlYr+r9OCLPcTNGgGZXw6p4RE5DKNftXRM
         8WHBYowQAoyR0rTdrw141qA+N7ATZptSLL1XCRBPGqjhLMWAOUOcsezskHkueNzL1niX
         xUkE4f1MgvwddK0V9M94tolgCYcBb9ZZMlC70ZRYfeta/6ZWeM2j3yJs4tJwVpmM1qms
         U9HuiNiZ226OP6dCqef9IAvmuPH6ksUrJ71FbtFlZY6wVwLp7Use8H4tSu34VjmWykU7
         X/DCpkV2UiX4iF34PAloHc69180RM0xq61An0jwf7+yjvFZ1gU3fAvokxbXxWlXrCRYN
         /rVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=DoMEYwaGELnwrDoWD2TeNwoLUFyujl00U2XHjg2O7ik=;
        b=QtszaOUV275LMYXmsNlk1GT+vZAX+UcTWwwCevQDutIgT0MHt03+WQLNkTBmMi96Nn
         8ESuegW+dE58fYdOb6YpBA2rEUzVXybYn2Mr0ZmhiE6hmGWUzxQ6/7zErvxch/6ySjzJ
         FN/eNfK31fO05W08jxqROSVgnPzSUDlHt+Zq2Io/z0uE0XaeWtYPeITvC5xZEVe+jz7h
         9EBOEllZbWOCnkBPGnqJt8ley/eyIcc+1id/W8X8JBAPKdEviYyY2Y4fUwF5CvOFtIYm
         tVuKi7aWm8mRHy9OUS+2Xqy6KnnVO371xBm29hyO7UFFMVDjTZwnjr53NJX6B8Uxhjjx
         oHYA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 5si722450wmf.1.2019.10.11.09.41.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 09:41:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x9BGfr4V031196
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Oct 2019 18:41:53 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9BGfqEW003449;
	Fri, 11 Oct 2019 18:41:52 +0200
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b3477139-cfe2-b8af-8b42-11487e4e4c87@siemens.com>
Date: Fri, 11 Oct 2019 18:41:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <f5316d70-5f44-93e0-dc2f-604cdd229fc6@oth-regensburg.de>
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

On 11.10.19 18:30, Ralf Ramsauer wrote:
>=20
>=20
> On 10/11/19 6:13 PM, Jan Kiszka wrote:
>> On 11.10.19 18:09, Ralf Ramsauer wrote:
>>>
>>>
>>> On 10/11/19 5:37 PM, Jan Kiszka wrote:
>>>> On 11.10.19 17:24, Jan Kiszka wrote:
>>>>> On 10.10.19 20:20, 'Vitaly Andrianov' via Jailhouse wrote:
>>>>>> This commit introduces support for TI AM57xx SOC. Original support
>>>>>> was done
>>>>>> by Jan Kiszka for v0.7 version, but wasn't upstreamed yet.
>>>>>>
>>>>>
>>>>> This lacks a design description. Even for me, because I always need t=
o
>>>>> recall the non-trival logic here.
>>>>>
>>>>> IIRC, SMP cores on that platform are brought up during boot by writin=
g
>>>>> their continuation address into a mailbox (OMAP_WKUPGEN_BASE +
>>>>> OMAP_AUX_CORE_BOOT_<CPU>). They stay in that WFE state - how do we
>>>>> kick them out of this, normally as well as while under Jailhouse
>>>>> control? Where does the code for this checker loop come from when
>>>>> Jailhouse is in charge? Should Jailhouse better provider it, like we
>>>>> do on x86 (look for parking_code)?
>>>>>
>>>>> For reference (should ideally go into the commit log or some comment
>>>>> as well): AM572x TRM, section "33.3.4.1. Startup".
>>>>>
>>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
>>>>>> ---
>>>>>>  =C2=A0=C2=A0 hypervisor/arch/arm/Kbuild=C2=A0=C2=A0 |=C2=A0 2 +
>>>>>>  =C2=A0=C2=A0 hypervisor/arch/arm/am57xx.c | 98
>>>>>> ++++++++++++++++++++++++++++++++++++++++++++
>>>>>>  =C2=A0=C2=A0 2 files changed, 100 insertions(+)
>>>>>>  =C2=A0=C2=A0 create mode 100644 hypervisor/arch/arm/am57xx.c
>>>>>>
>>>>>> diff --git a/hypervisor/arch/arm/Kbuild b/hypervisor/arch/arm/Kbuild
>>>>>> index e1bec1b..2ef89c3 100644
>>>>>> --- a/hypervisor/arch/arm/Kbuild
>>>>>> +++ b/hypervisor/arch/arm/Kbuild
>>>>>> @@ -26,3 +26,5 @@ lib-y +=3D mmu_hyp.o caches.o
>>>>>>  =C2=A0=C2=A0 #=C2=A0 gcc7 will bring a new function attribute
>>>>>> "no_profile_instrument_function"
>>>>>>  =C2=A0=C2=A0 #=C2=A0 should switch to that for higher granularity, =
but gcc7 is not
>>>>>> even there
>>>>>>  =C2=A0=C2=A0 CFLAGS_mmu_hyp.o +=3D -fno-profile-arcs -fno-test-cove=
rage
>>>>>> +
>>>>>> +lib-$(CONFIG_MACH_AM57XX) +=3D am57xx.o
>>>>>> diff --git a/hypervisor/arch/arm/am57xx.c
>>>>>> b/hypervisor/arch/arm/am57xx.c
>>>>>> new file mode 100644
>>>>>> index 0000000..1aa2328
>>>>>> --- /dev/null
>>>>>> +++ b/hypervisor/arch/arm/am57xx.c
>>>>>> @@ -0,0 +1,98 @@
>>>>>> +/*
>>>>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>>>>> + *
>>>>>> + * Copyright (c) ARM Limited, 2014
>>>>>> + * Copyright (c) Siemens AG, 2016
>>>>>> + * Copyright (c) Texas Instruments Incorporated, 2019
>>>>>> + *
>>>>>> + * Authors:
>>>>>> + *=C2=A0 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
>>>>>> + *=C2=A0 Jan Kiszka <jan.kiszka@siemens.com>
>>>>>> + *=C2=A0 Vitaly Andrianov <vitalya@ti.com>
>>>>>> + *
>>>>>> + * This work is licensed under the terms of the GNU GPL, version 2.
>>>>>> See
>>>>>> + * the COPYING file in the top-level directory.
>>>>>> + */
>>>>>> +
>>>>>> +#include <jailhouse/control.h>
>>>>>> +#include <jailhouse/mmio.h>
>>>>>> +#include <jailhouse/printk.h>
>>>>>> +#include <jailhouse/unit.h>
>>>>>> +#include <jailhouse/percpu.h>
>>>>>> +#include <asm/control.h>
>>>>>> +#include <asm/psci.h>
>>>>>> +#include <asm/smccc.h>
>>>>>> +#include <asm/setup.h>
>>>>>> +#include <asm/traps.h>
>>>>>> +#include <asm/sysregs.h>
>>>>>> +
>>>>>> +#define OMAP_WKUPGEN_BASE=C2=A0=C2=A0=C2=A0 0x48281000
>>>>>> +#define OMAP_AUX_CORE_BOOT_0=C2=A0=C2=A0=C2=A0 0x800
>>>>>> +
>>>>>> +const unsigned int smp_mmio_regions;
>>>>>
>>>>> Unused.
>>>>>
>>>>>> +
>>>>>> +static void *wkupgen_base =3D NULL;
>>>>>> +
>>>>>> +static int am57xx_init(void)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 wkupgen_base =3D paging_map_device(OMAP_WKUPGEN_=
BASE, PAGE_SIZE);
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 return (wkupgen_base =3D=3D NULL) ? -ENOMEM : 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int am57xx_cell_init(struct cell *cell)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>>> +}
>>>>>> +
>>>>>> +void suspend_cpu(unsigned int cpu_id);
>>>>>> +static void am57xx_cell_exit(struct cell *cell)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>>>>>> +=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell->cpu_set) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 public_per_cpu(cpu)->cpu=
_on_entry =3D
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
mmio_read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu * 4);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 public_per_cpu(cpu)->cpu=
_on_context =3D 0;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 suspend_cpu(cpu);
>>>>>
>>>>> Why do we need suspend_cpu? It is suspended when the cell destruction
>>>>> starts (via cell_suspend), i.e. before this call.
>>>>>
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>>>>
>>>>> This resumes the CPU already here. Partly explains my questions on th=
e
>>>>> top: We have no signal, we kick the re-assigned root cell cores off
>>>>> immediately.
>>>>>
>>>>> Start address is what Linux defined for its original boot by filling
>>>>> OMAP_AUX_CORE_BOOT_<CPU>. We are lucky still being able to read this
>>>>> value back above...
>>>>>
>>>>> There is really no signal we could take that Linux sends when
>>>>> logically onlining the CPUs again after cell destruction?
>>>>>
>>>>> BTW, what happens when you manually offline a CPU before assigning it
>>>>> to new cell? Then the Jailhouse driver will not online it on
>>>>> destruction, but we kick it off unconditionally, don't we?
>>>>>
>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>> +}
>>>>>> +
>>>>>> +int arch_handle_smc(struct trap_context *ctx)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned long *regs =3D ctx->regs;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 switch (regs[12]) {
>>>>>> +=C2=A0=C2=A0=C2=A0 case 0x102:
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_write_banked_reg(ELR=
_hyp, regs[0]);
>>>>>
>>>>> This is probably "API_HYP_ENTRY" for the kernel - is there an officia=
l
>>>>> name?
>>>>>
>>>>> My current understanding is that Linux runs this during
>>>>> omap5_secondary_hyp_startup normally in the hope to be taking into HY=
P
>>>>> mode at the specified (r0) address. We simple jump there, but not in
>>>>> SVC mode. Works by luck with Linux, right?
>>>>>
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>>>>> +=C2=A0=C2=A0=C2=A0 case 0x109:
>>>>>
>>>>> This is OMAP5_DRA7_MON_SET_CNTFRQ_INDEX according to Linux, and we
>>>>> should leave some words why we can simply call that smc on behalf of
>>>>> the guest. I added it back then because "then it works", not because
>>>>> of "I fully understand what I'm doing".
>>>>>
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile(
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
".arch_extension sec\n\t"
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"push {r0-r12, lr}\n\t"
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"mov ip,%0\n\t"
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"mov r0,%1\n\t"
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"smc #0\n\t"
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"pop {r0-r12, lr}\n\t"
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
: : "r" (regs[0]), "r" (regs[12]));
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_skip_instruction(ct=
x);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 if (SMCCC_IS_CONV_64(regs[0]))
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_FORBIDDEN;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 if (IS_PSCI_UBOOT(regs[0])) {
>>>>>
>>>>> This path is here because non-root Linux is told to use PSCI for SMP
>>>>> management, right?
>>>>>
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs[0] =3D psci_dispatc=
h(ctx);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_skip_instruction(ct=
x);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 return handle_smc(ctx);
>>>>>> +}
>>>>>> +
>>>>>> +DEFINE_UNIT_SHUTDOWN_STUB( am57xx );
>>>>>
>>>>> ...(am58xx);
>>>>>
>>>>>> +DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB( am57xx );
>>>>>> +DEFINE_UNIT( am57xx, "AM57XX" );
>>>>>> +
>>>>>>
>>>>>
>>>>> Jan
>>>>>
>>>>
>>>> Oh, and there should also be a note on how this platform support is
>>>> enabled (CONFIG_MACH_AM57XX...) and that, when it's on, the hypervisor
>>>> binary is no longer universal - which is currently the case.
>>>>
>>>> The risk with this approach is that the optional code will silently
>>>> break over time because it is not part of the main tests. We had that
>>>> with vexpress in the past.
>>>
>>> What about a flag in the system configuration?
>>>
>>> I'd rather prefer to keep an universal binary, instead of re-introducin=
g
>>> compile-time switches for different configurations. It was some effort
>>> to get rid of those switches, and at the moment, only debugging switche=
s
>>> and inmate-related switches are left.
>>>
>>> Downside: Even if the unit wouldn't register itself if the flag isn't
>>> set, the debug output would contain a confusing
>>> "Initializing unit AM57XX" entry.
>>
>> It's not against the idea behind units, though. On Intel, we also launch
>=20
> Sure, implementing this thing as an unit is fine. But the corresponding
> debug output might mislead.
>=20
>> CAT, irrespective of hardware support.
>=20
> Never noticed, but true. However, "Initializing unit CAT... Skipped"
> would be more intuitive. All we lack is a to allow ENOSYS as valid
> return value in units.

That's a much more complex beast because then you would also need to=20
kick the unit out of its link-time created table, to be consistent.

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
jailhouse-dev/b3477139-cfe2-b8af-8b42-11487e4e4c87%40siemens.com.
