Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBTWSQLWQKGQE3OKKW5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD02D450E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 18:09:51 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id n18sf4557434wro.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 09:09:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570810190; cv=pass;
        d=google.com; s=arc-20160816;
        b=N9NIs53ITr34puhRqkP2SO7ggNsYTn6R5IjJjqJsFQXLI3Ym/VV19ctSP7B1FLXVnQ
         L2FgGApls7BiELBksB6ODyiA5frk9SnSr1h9StzoEeoybMrDKj4guDxCzXfUManWN+pf
         Rt3ZfplW51Ez8kD81QWbY+jy2t4uOUJg5xnY6kxAQhs9J6QvcDN+RxbXsE1vJYSOD6XL
         HoMCR9I+nsV7Li9hzLW4YiZlINmya43qnXCDZHtMoU9hGapkkWvVzD9kEusLBbxzQcLK
         72CKk7I4tCa7feldmCwuUA44OC1aC/8exRUs+VTBwDaJYbFox8s0urAxsyV2lpPBkAO5
         qwSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=MFVtUzWVzo1obj3QLXGIakTdCAvxf6tqn6Y/2OCq98s=;
        b=wqKy2lyNSQXSUSH5ChC3oDw7DSNlOzJUXBw+q8WxfaI2gpoM7BOgTVIlYTcPGM6Hqi
         igk28gd+Ez14vUcEkYMY7QrUCqcBFWAdnwsOqur0KfaZC7FN9p3Jmod4bTREhXw24xkZ
         HMCdejX1MS0F53BTwm3oPqDEr3e2GkMQUg2KTbGBLWwfun43AzMDv9aMH5mB3BWMfIAn
         wFHHXyIuUXjJ4OprS9qs9lx12/Ng+lmVIAblLLKLGRP2j9R4HfVuaphPqTOmzsz5rSXI
         0DUMBY+Ri8TbYmAYWmBRoFNi/yRfJMUBCmEDAuv4XeYSnRzti0pi22ayUIaMeN27qLK2
         DbWA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bFpfM6FB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MFVtUzWVzo1obj3QLXGIakTdCAvxf6tqn6Y/2OCq98s=;
        b=LhVvCgGdweERdPx+sla8xazyn9SjXQxPQigVbA9PqIGKSPw5bJYm0FxAxRv7aAO/FQ
         pKCFAGy3rAbt+s5Q0GWijKJvhbATbBH+omwmfsteuiBENaMEBM37fpC8ZaCK5KUaG5yR
         6lywPX7ep2zRGC5hfqYtEL9smjAVyJk9NGPYJfxyaKsEixEh2AfQPyL2YeGa6i1/OKlM
         8VinipWfeo42ar78/1+WvLbEmzqsYqzfIqYTDUZktI7VhLDbTXFcIPYzBmyJWb3WbpUW
         xp0bbsmEuVlqtXKT0ofbJXUA+GSIvfXN7+9AaO5bWbordlpwhj4y2cUE1mqDtsyOXt0J
         gkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MFVtUzWVzo1obj3QLXGIakTdCAvxf6tqn6Y/2OCq98s=;
        b=BmIi4UQ/MHOJefWa9Ir7WriQUstQMK1ztt2G4IB3yOHrXm9wKuMekj/hgwuRu6bYJr
         t103ovqRVc3JrtP3DdNpc1HkYbqwtBPJeAzUwq+gHmbUBX1alhGZrSfoF94et1sw4kc2
         3laHMMYng5SLs7KKHcYFULDul63clAPCzGCuoZ4jOtkjfgbEbjG4QboFEvJwULlPRE8I
         x/EXjRqA5dXIv2qJ69JeyhL9fmMtv66UlAEOSK/ybqcUe3uVJcnT8cWfzrlv80y8e4DT
         YJve+RewgPYCiRe2MfA07mFl9wcTkZQPk5NiBk09h6ziswG6mIAP9y7tte7HKlRBnDyL
         jpyw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUawnOgo82TD4u5N5Qc+MW1zwE6fFaCDrFe4Eu/HPpGJkb51Ip9
	4/+PAzovKPXpMsDJ7G7oJ1o=
X-Google-Smtp-Source: APXvYqzjnrZEMZ7F2BfaRvjL/162KNHjPv/9Bpeepx6n2vwIlfugeJ+gJXF2WUz0OAInzYTAzFHUrQ==
X-Received: by 2002:a05:6000:128e:: with SMTP id f14mr14071461wrx.161.1570810190704;
        Fri, 11 Oct 2019 09:09:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fe43:: with SMTP id m3ls2780328wrs.4.gmail; Fri, 11 Oct
 2019 09:09:50 -0700 (PDT)
X-Received: by 2002:adf:f441:: with SMTP id f1mr14734801wrp.340.1570810190157;
        Fri, 11 Oct 2019 09:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570810190; cv=none;
        d=google.com; s=arc-20160816;
        b=MusqFdH2Yu9LuM66eewu0DPhIXT2TSIqMl3cTcwmp7gQVVRGTc35kLQnKREzTztpIM
         /HmEbtuzrov7XoVzUBFd1QcHQBkU0Jc9q4zbDAfJHIB6/xQiy7IgsLhNmVruj+JlZKgC
         fXJYpHa7FczVt+qnhrTK32il23ReC23dZJC9pvlfV+dGJtmeFtKjcdeW3aPBCMaixAd0
         FHRQKnEirptIIDIT5lcLQTs+P7DwPJ4z1egv0s2CwM/6J3PqklaPqHmHhlamov0aRjRZ
         6ypYXDWvbhGHHWkmMv/WqsEVVnGMiT7AIINSGI018HNu7GY4CJWxpVXoomNuuktdsj4q
         0yTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=oSz94vZ3Kn+U01s/Wxtk/H1jc+XyeaGKSvu2Ty8k9Go=;
        b=K5s3adv4TQg0l8ifJemwLD+FXceyZGGL0LgHhe0Iy4XO7nc4pR5imkD507IFWFYdkw
         AJJZ8yZfV1K/CPbIPkvpc2KpkkqLhoazpV/x4JTIO9Pj75Es1I6/I9cj6Yutl6KxngFM
         7MN6NywKP9/4xiXNyCrf5PVtsYyU7HqNzWg+MGXDNuBF+4qYymusHVKfCGsjrZKlNH+Y
         j3OYqydTb4CrLTPCcTuoA4jAKGQ/LAqwwTfGdzgJ/dzbXVdJ88yjRDcM5k0np2Oqgxe3
         T9NGOcDf4CZywOvNLG7bZ3BZeDcw/WapUz2RUYHw0GMOlbtLQq2iiMsvQnnmx2BCQg6r
         Mopw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bFpfM6FB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id f11si475188wrp.3.2019.10.11.09.09.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 09:09:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46qXwF54q3zxvh;
	Fri, 11 Oct 2019 18:09:49 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Fri, 11 Oct
 2019 18:09:49 +0200
Subject: Re: [PATCH 3/4] arm: am57xx: introduce support for TI am57xx SOC
To: Jan Kiszka <jan.kiszka@siemens.com>, Vitaly Andrianov <vitalya@ti.com>,
	<jailhouse-dev@googlegroups.com>
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
 <1570731650-5335-4-git-send-email-vitalya@ti.com>
 <0b85c51a-0078-47fb-70ba-a8f9def7b852@siemens.com>
 <357f2bee-176a-af2c-e603-9f907f1594a0@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <a2ca04dc-8212-1e0b-c3dc-f3b58fc2cb12@oth-regensburg.de>
Date: Fri, 11 Oct 2019 18:09:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <357f2bee-176a-af2c-e603-9f907f1594a0@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bFpfM6FB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 10/11/19 5:37 PM, Jan Kiszka wrote:
> On 11.10.19 17:24, Jan Kiszka wrote:
>> On 10.10.19 20:20, 'Vitaly Andrianov' via Jailhouse wrote:
>>> This commit introduces support for TI AM57xx SOC. Original support
>>> was done
>>> by Jan Kiszka for v0.7 version, but wasn't upstreamed yet.
>>>
>>
>> This lacks a design description. Even for me, because I always need to
>> recall the non-trival logic here.
>>
>> IIRC, SMP cores on that platform are brought up during boot by writing
>> their continuation address into a mailbox (OMAP_WKUPGEN_BASE +
>> OMAP_AUX_CORE_BOOT_<CPU>). They stay in that WFE state - how do we
>> kick them out of this, normally as well as while under Jailhouse
>> control? Where does the code for this checker loop come from when
>> Jailhouse is in charge? Should Jailhouse better provider it, like we
>> do on x86 (look for parking_code)?
>>
>> For reference (should ideally go into the commit log or some comment
>> as well): AM572x TRM, section "33.3.4.1. Startup".
>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
>>> ---
>>> =C2=A0 hypervisor/arch/arm/Kbuild=C2=A0=C2=A0 |=C2=A0 2 +
>>> =C2=A0 hypervisor/arch/arm/am57xx.c | 98
>>> ++++++++++++++++++++++++++++++++++++++++++++
>>> =C2=A0 2 files changed, 100 insertions(+)
>>> =C2=A0 create mode 100644 hypervisor/arch/arm/am57xx.c
>>>
>>> diff --git a/hypervisor/arch/arm/Kbuild b/hypervisor/arch/arm/Kbuild
>>> index e1bec1b..2ef89c3 100644
>>> --- a/hypervisor/arch/arm/Kbuild
>>> +++ b/hypervisor/arch/arm/Kbuild
>>> @@ -26,3 +26,5 @@ lib-y +=3D mmu_hyp.o caches.o
>>> =C2=A0 #=C2=A0 gcc7 will bring a new function attribute
>>> "no_profile_instrument_function"
>>> =C2=A0 #=C2=A0 should switch to that for higher granularity, but gcc7 i=
s not
>>> even there
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
=A0
>>> See
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
>> Why do we need suspend_cpu? It is suspended when the cell destruction
>> starts (via cell_suspend), i.e. before this call.
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>
>> This resumes the CPU already here. Partly explains my questions on the
>> top: We have no signal, we kick the re-assigned root cell cores off
>> immediately.
>>
>> Start address is what Linux defined for its original boot by filling
>> OMAP_AUX_CORE_BOOT_<CPU>. We are lucky still being able to read this
>> value back above...
>>
>> There is really no signal we could take that Linux sends when
>> logically onlining the CPUs again after cell destruction?
>>
>> BTW, what happens when you manually offline a CPU before assigning it
>> to new cell? Then the Jailhouse driver will not online it on
>> destruction, but we kick it off unconditionally, don't we?
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
>> This is probably "API_HYP_ENTRY" for the kernel - is there an official
>> name?
>>
>> My current understanding is that Linux runs this during
>> omap5_secondary_hyp_startup normally in the hope to be taking into HYP
>> mode at the specified (r0) address. We simple jump there, but not in
>> SVC mode. Works by luck with Linux, right?
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>> +=C2=A0=C2=A0=C2=A0 case 0x109:
>>
>> This is OMAP5_DRA7_MON_SET_CNTFRQ_INDEX according to Linux, and we
>> should leave some words why we can simply call that smc on behalf of
>> the guest. I added it back then because "then it works", not because
>> of "I fully understand what I'm doing".
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
>> This path is here because non-root Linux is told to use PSCI for SMP
>> management, right?
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
> Oh, and there should also be a note on how this platform support is
> enabled (CONFIG_MACH_AM57XX...) and that, when it's on, the hypervisor
> binary is no longer universal - which is currently the case.
>=20
> The risk with this approach is that the optional code will silently
> break over time because it is not part of the main tests. We had that
> with vexpress in the past.

What about a flag in the system configuration?

I'd rather prefer to keep an universal binary, instead of re-introducing
compile-time switches for different configurations. It was some effort
to get rid of those switches, and at the moment, only debugging switches
and inmate-related switches are left.

Downside: Even if the unit wouldn't register itself if the flag isn't
set, the debug output would contain a confusing
"Initializing unit AM57XX" entry.

  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a2ca04dc-8212-1e0b-c3dc-f3b58fc2cb12%40oth-regensburg.de.
