Return-Path: <jailhouse-dev+bncBC33JYE2XMMRBE4QSLWQKGQEITXUM3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43e.google.com (mail-pf1-x43e.google.com [IPv6:2607:f8b0:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD19D6551
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 16:37:09 +0200 (CEST)
Received: by mail-pf1-x43e.google.com with SMTP id b13sf13532246pfp.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 07:37:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571063828; cv=pass;
        d=google.com; s=arc-20160816;
        b=XYfikJdvQvTxJH13A6Q8gSOTn6X0LbATGARPvKE64j8/DL7l2+k4h9JBzpVXyvLfFe
         Uol1AscAMBxeABlCrhAAMzO1kjOc/1ZOfEyWCnOXqWHmZFWS4oc8NlUdyuWcyNL5gwy4
         M5HV2n6GKIxfRgbGG6eleT2p0i2miSYj2wEydQCyguJNujGy3txnrZG0Ga/EFHmj8cbI
         VzeqMhIniYy3Q2fbOCb3CxcL9+SRSe8TT904wRRBKZYEKIVq/JHS/QrYNudWZyKoD3ev
         Rdko7ilOd78+/OTl86UrATnAHzSmI723Uy6s0X0x+gORtwlnYq0oVP8fze4ni8OE0YCa
         /Kww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Y7clpJwlKM0vEzFvHKZ9qMGNQyLwm29rf++WFakYcU0=;
        b=lUvFGdSJg1hz/+xJ+IRzlX9HcPGT6Szdw0ap/L7w+MFONbfvBZUID00kXrNCdpFQAK
         T7W5hU0TOJ1x6q/rPWpLHESvjTiaVlaYN6UqWn1LfvAc/1rovi4ImTjL7KpXUlZZKDQh
         tJ8yKvj3+Uaigau0LBBx0GLo7p866n05qrPK5MznTwcfAZyWtT+aT2sQ+33gsLOiEJhr
         m8LUlhrJg4GWW8vF3PIT5YjgyY/irK3YthwJPvtQaAgT1Oxxy62Aq2iMvY2VUB7X7Mh8
         P/yw4HxYxmJmXigGM22cwreJbeZdFBAUJsgQtXwsS2d6A5ok88E6c7oOeuC/wrJmhuHI
         IOag==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fcyqYXLG;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Y7clpJwlKM0vEzFvHKZ9qMGNQyLwm29rf++WFakYcU0=;
        b=fajbFxcjZEvVXOUD7cI19AJOSiMn/YxcL20AJIcakfkdmdbE9+dEv5m7+drsXbKdtY
         Mu52wefDQZDGqPXcgXlhEt1XO3Ci/4B9AsUbWKs/cPGtZWFnMPfpXAmTgQCxfnlmVg+H
         MwF8cNfTURDs0e5FV9PINFSJhBXuLzC7GqQd4hAOUVO+hfVqrMmmDdIm0+O8bFqJy7cH
         NmQ+Iwt38xMvpCYGsRWF+oeGzE3Th+Ik1OYscICYiAWJ8fQvGkKn2Sl19V/l1IqvEVuJ
         oMZanZbgkUyMr0BjhTdoSAinpBGlSSg2v+rA/jIXeB+C1YUtNOrScgT9lexSh9nxws2f
         7eIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Y7clpJwlKM0vEzFvHKZ9qMGNQyLwm29rf++WFakYcU0=;
        b=T2g0WWbw3Kgv6hRHoyBhtY0c+hb4xBvgo+4tZF4lV/qTB6D2+eVvmyHTkCI8vj6k/G
         EQjgnRxGbroqbINrf3CZjuysTu/F/kEZ2XxehGcSfzNj4FWqRvjp5y/PueE8h2UojZt7
         KAeQqpqkUA+YYWL0QjXRTRDNQ3V6j2m+qc68a1zv2sbJjF3CjoFsxq8/s2OJikgHLOIi
         mR/HLQyPLQ0j+V6pWnXOWZ5jU7TiXYbtIAK3dj0pp7es1sahA4ou2SHmKzb7tw7hExtc
         900CU0ALz4mfz1/0npic8x6N0rlU5trZwuquTJhYKkAliJWKCgKA0sQe7gxPiTP2PaIa
         AdFQ==
X-Gm-Message-State: APjAAAWmtfeJZ6Q6sZMe1f+/7Ikmm0cf5uj4rAYPyN5cu5ZJRlAyXsN3
	UDHHzfSXcE8JLtTqhT5/53U=
X-Google-Smtp-Source: APXvYqwJ/VAO2IIUbkModMWjGGU24P2rkXAHekGX3Z/f51fci0laHPwuZiFXUYZp3otycIwLfbav2g==
X-Received: by 2002:a63:1f48:: with SMTP id q8mr14695266pgm.215.1571063828234;
        Mon, 14 Oct 2019 07:37:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:e517:: with SMTP id n23ls4074912pff.5.gmail; Mon, 14 Oct
 2019 07:37:07 -0700 (PDT)
X-Received: by 2002:a63:d34b:: with SMTP id u11mr34785098pgi.442.1571063827213;
        Mon, 14 Oct 2019 07:37:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063827; cv=none;
        d=google.com; s=arc-20160816;
        b=MY14ImvwKGUyXcNGqBej0m8oaHZi9bWdioBiaEwSypCEdhUZ2gR02Tpwjam1KWYdHv
         uMyEVnq3ZZE2RMniIwy1AImiDIhURFbLqlEcpq0onJPhDglVdYadRTiTXXvhwrLyJeRW
         6HnMeTvAmQ2EqkRkIA/TzmT8kR0gbJYzit3kWOGgN75wY3YcIA8rH0kT97y7eNS9yUaB
         216BErH5/bVQhoCESRs36V0Bit9Oa+A1d8wHIF4dxxWn7OdXs0feOWM2BsHcoW1TKaUI
         zeqcaIdB1Ox6jQVFoh5dactTRqqTq362Hp2BP6ftVcIe6hFPBhanC6A8vBo6jNOpETeQ
         p6mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=kDSFX+rzi/cWeDyj+L6T2lS87IJZTFg2aoXxULFfZS0=;
        b=UAqwBKSAifvb0qggNh5jiIVv/LNA1WiR64jFG0FUREkYn0RSIbbxR6CCOb+jCQ4pMr
         mHGU5ZlRZMfDiehc99CctGWNNQ6pkT97lhvJHTU9ESi3fQkU2VQPXPADSuovkaMrOAHJ
         hOIWhnhuLxgnbIDz756GA/ocx2pkq1OsEYZUfrMGgOGMP9OiVgbUKcB1nlspTXR/magD
         Z4ATaiUQP1XkObBccEuVuNtEbxFOEbwNCbjHsqu4gWLQPMEsdXt3j6D1450SnWVqvDYc
         oKoOhpOKamJOCYoVEyyrHDu2ricBU+n/TQ5JnOAFYqj0QOvS2+1HNyx12ChdYsEZp5Hc
         Lz3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fcyqYXLG;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id fh7si2683pjb.0.2019.10.14.07.37.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 07:37:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9EEb60L011463;
	Mon, 14 Oct 2019 09:37:06 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9EEb6rM124996
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Oct 2019 09:37:06 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 14
 Oct 2019 09:36:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 14 Oct 2019 09:37:05 -0500
Received: from [158.218.117.99] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9EEb5B5053761;
	Mon, 14 Oct 2019 09:37:05 -0500
Subject: Re: [EXTERNAL] Re: [PATCH 3/4] arm: am57xx: introduce support for TI
 am57xx SOC
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>,
        <jailhouse-dev@googlegroups.com>
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
 <1570731650-5335-4-git-send-email-vitalya@ti.com>
 <0b85c51a-0078-47fb-70ba-a8f9def7b852@siemens.com>
 <357f2bee-176a-af2c-e603-9f907f1594a0@siemens.com>
 <a2ca04dc-8212-1e0b-c3dc-f3b58fc2cb12@oth-regensburg.de>
 <32d719ab-04f9-f57a-d8b1-33f6467da855@siemens.com>
 <f5316d70-5f44-93e0-dc2f-604cdd229fc6@oth-regensburg.de>
 <b3477139-cfe2-b8af-8b42-11487e4e4c87@siemens.com>
 <0368a897-9bda-63fe-5657-89891422c118@oth-regensburg.de>
 <5a39b4c6-2738-95d9-352a-2a79669f1c96@siemens.com>
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <d2ecceeb-3da3-c86b-0deb-fe7deb9c2d62@ti.com>
Date: Mon, 14 Oct 2019 10:31:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <5a39b4c6-2738-95d9-352a-2a79669f1c96@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=fcyqYXLG;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted
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

On 10/11/2019 12:57 PM, Jan Kiszka wrote:
> On 11.10.19 18:55, Ralf Ramsauer wrote:
>> On 10/11/19 6:41 PM, Jan Kiszka wrote:
>>> On 11.10.19 18:30, Ralf Ramsauer wrote:
>>>>
>>>>
>>>> On 10/11/19 6:13 PM, Jan Kiszka wrote:
>>>>> On 11.10.19 18:09, Ralf Ramsauer wrote:
>>>>>>
>>>>>>
>>>>>> On 10/11/19 5:37 PM, Jan Kiszka wrote:
>>>>>>> On 11.10.19 17:24, Jan Kiszka wrote:
>>>>>>>> On 10.10.19 20:20, 'Vitaly Andrianov' via Jailhouse wrote:
>>>>>>>>> This commit introduces support for TI AM57xx SOC. Original suppor=
t
>>>>>>>>> was done
>>>>>>>>> by Jan Kiszka for v0.7 version, but wasn't upstreamed yet.
>>>>>>>>>
>>>>>>>>
>>>>>>>> This lacks a design description. Even for me, because I always
>>>>>>>> need to
>>>>>>>> recall the non-trival logic here.
>>>>>>>>
>>>>>>>> IIRC, SMP cores on that platform are brought up during boot by
>>>>>>>> writing
>>>>>>>> their continuation address into a mailbox (OMAP_WKUPGEN_BASE +
>>>>>>>> OMAP_AUX_CORE_BOOT_<CPU>). They stay in that WFE state - how do we
>>>>>>>> kick them out of this, normally as well as while under Jailhouse
>>>>>>>> control? Where does the code for this checker loop come from when
>>>>>>>> Jailhouse is in charge? Should Jailhouse better provider it, like =
we
>>>>>>>> do on x86 (look for parking_code)?
>>>>>>>>
>>>>>>>> For reference (should ideally go into the commit log or some comme=
nt
>>>>>>>> as well): AM572x TRM, section "33.3.4.1. Startup".
>>>>>>>>
>>>>>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>>>>> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
>>>>>>>>> ---
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 hypervisor/arch/arm/Kbuild=C2=A0=C2=A0 |=
=C2=A0 2 +
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 hypervisor/arch/arm/am57xx.c | 98
>>>>>>>>> ++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 2 files changed, 100 insertions(+)
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 create mode 100644 hypervisor/arch/arm/a=
m57xx.c
>>>>>>>>>
>>>>>>>>> diff --git a/hypervisor/arch/arm/Kbuild b/hypervisor/arch/arm/Kbu=
ild
>>>>>>>>> index e1bec1b..2ef89c3 100644
>>>>>>>>> --- a/hypervisor/arch/arm/Kbuild
>>>>>>>>> +++ b/hypervisor/arch/arm/Kbuild
>>>>>>>>> @@ -26,3 +26,5 @@ lib-y +=3D mmu_hyp.o caches.o
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 #=C2=A0 gcc7 will bring a new function a=
ttribute
>>>>>>>>> "no_profile_instrument_function"
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 #=C2=A0 should switch to that for higher=
 granularity, but gcc7 is not
>>>>>>>>> even there
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 CFLAGS_mmu_hyp.o +=3D -fno-profile-arcs =
-fno-test-coverage
>>>>>>>>> +
>>>>>>>>> +lib-$(CONFIG_MACH_AM57XX) +=3D am57xx.o
>>>>>>>>> diff --git a/hypervisor/arch/arm/am57xx.c
>>>>>>>>> b/hypervisor/arch/arm/am57xx.c
>>>>>>>>> new file mode 100644
>>>>>>>>> index 0000000..1aa2328
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/hypervisor/arch/arm/am57xx.c
>>>>>>>>> @@ -0,0 +1,98 @@
>>>>>>>>> +/*
>>>>>>>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>>>>>>>> + *
>>>>>>>>> + * Copyright (c) ARM Limited, 2014
>>>>>>>>> + * Copyright (c) Siemens AG, 2016
>>>>>>>>> + * Copyright (c) Texas Instruments Incorporated, 2019
>>>>>>>>> + *
>>>>>>>>> + * Authors:
>>>>>>>>> + *=C2=A0 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
>>>>>>>>> + *=C2=A0 Jan Kiszka <jan.kiszka@siemens.com>
>>>>>>>>> + *=C2=A0 Vitaly Andrianov <vitalya@ti.com>
>>>>>>>>> + *
>>>>>>>>> + * This work is licensed under the terms of the GNU GPL, version=
 2.
>>>>>>>>> See
>>>>>>>>> + * the COPYING file in the top-level directory.
>>>>>>>>> + */
>>>>>>>>> +
>>>>>>>>> +#include <jailhouse/control.h>
>>>>>>>>> +#include <jailhouse/mmio.h>
>>>>>>>>> +#include <jailhouse/printk.h>
>>>>>>>>> +#include <jailhouse/unit.h>
>>>>>>>>> +#include <jailhouse/percpu.h>
>>>>>>>>> +#include <asm/control.h>
>>>>>>>>> +#include <asm/psci.h>
>>>>>>>>> +#include <asm/smccc.h>
>>>>>>>>> +#include <asm/setup.h>
>>>>>>>>> +#include <asm/traps.h>
>>>>>>>>> +#include <asm/sysregs.h>
>>>>>>>>> +
>>>>>>>>> +#define OMAP_WKUPGEN_BASE=C2=A0=C2=A0=C2=A0 0x48281000
>>>>>>>>> +#define OMAP_AUX_CORE_BOOT_0=C2=A0=C2=A0=C2=A0 0x800
>>>>>>>>> +
>>>>>>>>> +const unsigned int smp_mmio_regions;
>>>>>>>>
>>>>>>>> Unused.
>>>>>>>>
>>>>>>>>> +
>>>>>>>>> +static void *wkupgen_base =3D NULL;
>>>>>>>>> +
>>>>>>>>> +static int am57xx_init(void)
>>>>>>>>> +{
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 wkupgen_base =3D paging_map_device(OMAP_WKUPG=
EN_BASE, PAGE_SIZE);
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 return (wkupgen_base =3D=3D NULL) ? -ENOMEM :=
 0;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static int am57xx_cell_init(struct cell *cell)
>>>>>>>>> +{
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +void suspend_cpu(unsigned int cpu_id);
>>>>>>>>> +static void am57xx_cell_exit(struct cell *cell)
>>>>>>>>> +{
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell->cpu_set) {
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 public_per_cpu(cpu)->=
cpu_on_entry =3D
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 mmio_read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu * 4);
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 public_per_cpu(cpu)->=
cpu_on_context =3D 0;
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 suspend_cpu(cpu);
>>>>>>>>
>>>>>>>> Why do we need suspend_cpu? It is suspended when the cell destruct=
ion
>>>>>>>> starts (via cell_suspend), i.e. before this call.
>>>>>>>>
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>>>>>>>
>>>>>>>> This resumes the CPU already here. Partly explains my questions on
>>>>>>>> the
>>>>>>>> top: We have no signal, we kick the re-assigned root cell cores of=
f
>>>>>>>> immediately.
>>>>>>>>
>>>>>>>> Start address is what Linux defined for its original boot by filli=
ng
>>>>>>>> OMAP_AUX_CORE_BOOT_<CPU>. We are lucky still being able to read th=
is
>>>>>>>> value back above...
>>>>>>>>
>>>>>>>> There is really no signal we could take that Linux sends when
>>>>>>>> logically onlining the CPUs again after cell destruction?
>>>>>>>>
>>>>>>>> BTW, what happens when you manually offline a CPU before assigning=
 it
>>>>>>>> to new cell? Then the Jailhouse driver will not online it on
>>>>>>>> destruction, but we kick it off unconditionally, don't we?
>>>>>>>>
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +int arch_handle_smc(struct trap_context *ctx)
>>>>>>>>> +{
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned long *regs =3D ctx->regs;
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 switch (regs[12]) {
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 case 0x102:
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_write_banked_reg(=
ELR_hyp, regs[0]);
>>>>>>>>
>>>>>>>> This is probably "API_HYP_ENTRY" for the kernel - is there an
>>>>>>>> official
>>>>>>>> name?
>>>>>>>>
>>>>>>>> My current understanding is that Linux runs this during
>>>>>>>> omap5_secondary_hyp_startup normally in the hope to be taking into
>>>>>>>> HYP
>>>>>>>> mode at the specified (r0) address. We simple jump there, but not =
in
>>>>>>>> SVC mode. Works by luck with Linux, right?
>>>>>>>>
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 case 0x109:
>>>>>>>>
>>>>>>>> This is OMAP5_DRA7_MON_SET_CNTFRQ_INDEX according to Linux, and we
>>>>>>>> should leave some words why we can simply call that smc on behalf =
of
>>>>>>>> the guest. I added it back then because "then it works", not becau=
se
>>>>>>>> of "I fully understand what I'm doing".
>>>>>>>>
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile(
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ".arch_extension sec\n\t"
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "push {r0-r12, lr}\n\t"
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "mov ip,%0\n\t"
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "mov r0,%1\n\t"
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "smc #0\n\t"
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "pop {r0-r12, lr}\n\t"
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : : "r" (regs[0]), "r" (regs[12]));
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_skip_instruction=
(ctx);
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (SMCCC_IS_CONV_64(regs[0]))
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_FORBIDDEN=
;
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (IS_PSCI_UBOOT(regs[0])) {
>>>>>>>>
>>>>>>>> This path is here because non-root Linux is told to use PSCI for S=
MP
>>>>>>>> management, right?
>>>>>>>>
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs[0] =3D psci_disp=
atch(ctx);
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_skip_instruction=
(ctx);
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 return handle_smc(ctx);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +DEFINE_UNIT_SHUTDOWN_STUB( am57xx );
>>>>>>>>
>>>>>>>> ...(am58xx);
>>>>>>>>
>>>>>>>>> +DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB( am57xx );
>>>>>>>>> +DEFINE_UNIT( am57xx, "AM57XX" );
>>>>>>>>> +
>>>>>>>>>
>>>>>>>>
>>>>>>>> Jan
>>>>>>>>
>>>>>>>
>>>>>>> Oh, and there should also be a note on how this platform support is
>>>>>>> enabled (CONFIG_MACH_AM57XX...) and that, when it's on, the hypervi=
sor
>>>>>>> binary is no longer universal - which is currently the case.
>>>>>>>
>>>>>>> The risk with this approach is that the optional code will silently
>>>>>>> break over time because it is not part of the main tests. We had th=
at
>>>>>>> with vexpress in the past.
>>>>>>
>>>>>> What about a flag in the system configuration?
>>>>>>
>>>>>> I'd rather prefer to keep an universal binary, instead of
>>>>>> re-introducing
>>>>>> compile-time switches for different configurations. It was some effo=
rt
>>>>>> to get rid of those switches, and at the moment, only debugging
>>>>>> switches
>>>>>> and inmate-related switches are left.
>>>>>>
>>>>>> Downside: Even if the unit wouldn't register itself if the flag isn'=
t
>>>>>> set, the debug output would contain a confusing
>>>>>> "Initializing unit AM57XX" entry.
>>>>>
>>>>> It's not against the idea behind units, though. On Intel, we also lau=
nch
>>>>
>>>> Sure, implementing this thing as an unit is fine. But the correspondin=
g
>>>> debug output might mislead.
>>>>
>>>>> CAT, irrespective of hardware support.
>>>>
>>>> Never noticed, but true. However, "Initializing unit CAT... Skipped"
>>>> would be more intuitive. All we lack is a to allow ENOSYS as valid
>>>> return value in units.
>>>
>>> That's a much more complex beast because then you would also need to
>>> kick the unit out of its link-time created table, to be consistent.
>>
>> ... Or flag units as used in a simple bitmap. Iterators could then
>> respect that map. A simple unsigned should be totally sufficient. I'll
>> check that if I find some time...
>=20
> Well, if all that is in the end only for the debug output... ;)
>=20
>>
>> Back to this patch:
>>
>> There's another obstacle... The patch before adds weak attributes to
>> arch_handle_smc, and this one overloads the default implementation. If
>> we want to keep the binary universal, this needs to be solved as well.
>=20
> Yes, I know.
>=20
> Jan
>=20

Jan and Ralf,

A while back I tried unmodified hypervisor by just adding am572x-evm.cell c=
onfig.
Basically everything worked except cell destroy. I repeated this experiment=
 today.
When I issued the cell destroy command I got:

root@am57xx-evm:~/jh# Closing cell "AM57XX-EVM-uart-demo"
Page pool usage after cell destruction: mem 49/4073, remap 5/131072
[  187.112795] CPU1: failed to come online
[  187.118622] Jailhouse: failed to bring CPU 1 back online
[  187.124806] Destroyed Jailhouse cell "AM57XX-EVM-uart-demo"

After that Linux is running on ARM0 core only. Basically I can create anoth=
er cell for gic-demo.bin,=20
I can run it and shutdown. I cannot just destroy the cell with getting ARM1=
 running Linux again.

As far as I know when we issue cpu_down() the CPU is calling WFI instructio=
n (Linux kernel page) and=20
waiting for event. When we create a cell the hypervisor switches the page a=
nd runs the ARM1 at the=20
same WFI loop at virtual address 0x0. I guess when we destroy the cell, hyp=
ervisor shall return ARM1=20
kernel page and cpu_up() should continue from that point.

When I was debugging this issue that time, I saw then after destroy the ARM=
1 remained executing WFI=20
and hypervisor page. I didn't know why was that, and adding AM57XX unit hel=
ped to solve this issue.
But may be that is just a hack and you have a idea how to solve the "destro=
y" issue w/o introducing=20
the AM57XX unit.

Thanks,
-Vitaly

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d2ecceeb-3da3-c86b-0deb-fe7deb9c2d62%40ti.com.
