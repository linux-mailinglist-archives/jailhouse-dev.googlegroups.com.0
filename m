Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNVD23UQKGQEU3AUVEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F5D6FDEB
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 12:36:43 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id m8sf3526827lfl.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 03:36:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563791803; cv=pass;
        d=google.com; s=arc-20160816;
        b=c7Z1ZttnX6tj2zQxpUgHFWFT6y5gnjJYCdiL/drF8po2T36zFiUhgLqs3yp1tS0RR7
         eVcEDmSqd78SSITetbHxmi7LI8qt3pv9+HTnMJuSXu/8JwzdRwKF9vPt8GnLH1Nbgdud
         +w7v39VBybJNLNesTAGhiglN5q76jr/Zh4cyHbBiJJ7sAzdqlmG7Enu6zThFVrKROlwO
         U8sSw4fzCWEjb9Os+dyYxGgDUWzBPQuhj0FXmW3I414kaTEzrv4CJaKMLaIwQpctijvw
         v5zZg6hQ37sk2iRcOjgF3wCGXl1U6daRrCNlYmC5/KtsWw85a7go7kRLOwOnZmtiWwtz
         V+OQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=nap33sLkGwO1KXYCHsO5IyxBLEVmkM+/+s+jyXpbf+o=;
        b=lN3obtBhvQuNbcWKwZnmvbgrYDmD9ogHIbOibmn242au3qd7XDQuNgCTVI6r6QRyPu
         XIeea8VXC+ba+eN9cB/TUt24qHxyYq7WMedd8LBb65cm34rFi7aOHxsVeT9+m6zMB2nv
         rAldYfzSCnTk1ObuSN9iazuypa45iE8FYjUiJyYItZ5TfaQZWGKxYbnBipSFp9Dn0xEV
         ZuY9pjbz6aUTsm0USB5vl79FSJrs1L0HfFjnfEqMUdH+J1gVzyBp+ng48q/z93s+Ptu8
         sZIPmsRv/yQ4mx7NjbHu6maguWQ0B+HxzpY8AZQyQiTAn6t+FLcT0d4g64axOABBui4G
         I0bw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nap33sLkGwO1KXYCHsO5IyxBLEVmkM+/+s+jyXpbf+o=;
        b=TsXXjB9cfut+IwQOMWT4UnoRRmaismghhwqFbweYxvNv0Au6Q8IumAuWbK2FLTp7/h
         3ElkwVqFRMa1OJKXifcAr5Pb3N7EeU9IWzBTc6Czd0X418yL17/qo66tSa66gav2DaI2
         31Sr1FP08oqcQte3ZijQaTTWc7g2HJAF/iYJ/8spR+qer9OiW7ApooEKg2btRH6jyfwp
         v30M3+cITqjGVq85qv9VpmzTAVp3QhkHlJijWV4OX806CyWY5WwxsJiOAaPIwegG3X25
         1og84ZP90Yi/gWQAOrdPCx1A1yhw0pjyvZKxVCHkrJkbXjBWpw2oztPKS3K9s9cmtWJ0
         LT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nap33sLkGwO1KXYCHsO5IyxBLEVmkM+/+s+jyXpbf+o=;
        b=lHUlILRYl4Zu4EseAx6Sw/u6ryWtNdnPsxn45zG8ELVSoozJYuC3+E3vDaf/ostZtC
         wJscPCxbB+8HWQb2xO5tRuEHs3Btp0Ogat8cAxFoSOAoVmPK77xfbalVn4YsiuL3y6ao
         Mc4SVDJf81mA9GIovX3e9diL3MHqcKKdzDSYghppFhdBEXKOJ+zdJMXfyN7KRLFumUxd
         ElLOAVC54DJD1vozyisqKmDbU0QqxgNW1CpNgz7hBva6DPu849CvSErEcXuqr39l9xyQ
         WAikRJCpNEE3wxrBEXobL698LYYUrCQ+4VbSztsK3WhkkYUcjV+qG76QNWH+9wFEREB8
         SdNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW3hnIXWIMPSiTfCIGuFvbLJZebZkvwB9qWtxF2k0uBT93a9je3
	zbzifpEdXqG54bgP7TAsxiw=
X-Google-Smtp-Source: APXvYqzDU6yeYDVpfJSWqTVgvvKjPHFwV7DMpz3Wvzg+c5MpKL0Y22AwKhaNoWuaTX5+gbXfTHBYwg==
X-Received: by 2002:a2e:3013:: with SMTP id w19mr35999452ljw.73.1563791802985;
        Mon, 22 Jul 2019 03:36:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:6b10:: with SMTP id d16ls3106242lfa.10.gmail; Mon, 22
 Jul 2019 03:36:37 -0700 (PDT)
X-Received: by 2002:ac2:4a6e:: with SMTP id q14mr358640lfp.154.1563791797765;
        Mon, 22 Jul 2019 03:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563791797; cv=none;
        d=google.com; s=arc-20160816;
        b=iwPbaOpnPbNB9VCFxItdz+mVBUQygCIrOOt9VTKpRqA7DO4wu/d+PbUv7x0xCJ1/uA
         WpPgZeBTSTSJPdKjut4c/vKcfr+vFJTZRKnUM1YMRI0jOFmeZdndgZ35AsUZurtT3yhh
         GrUUhSsChR+7mSF1FlDItND0Wc+YHIJG2o3p4lNKgM2WNdiRqBEHc23Z0uAaMxahkEmV
         y3wDjITmqqxIjcep+jdOkM+9n1wN7bLX2Q/aJkjjWzKCyGcGsVgDqj+Ub2ZVV+eeodlz
         K/PpW6sht4XXL7rvR2A4g2GJX3445ozTnIA73vtxlNabbIpVkMIEccEs4MRwwOkP+VXJ
         aPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ANUFuzp/WNvJqZKTGQzNmKdQex8YrsXDwduVTTGP6Sw=;
        b=L6hoE00j6CnSgFfBYp29LBnG10a3vJjCnJHG3H4Auf+KLlGRqfwkLKl4Ddj9jTd34k
         KVMdETNzHe5V4feM9QCluTsMZN1Mi+68/6zlukNL8qHYm1AzGmSo46T3axHb1P2pP1YV
         x6celR8dhmPGbJezcmrM/IShxlOwtidfTOYBjdO6v/Nmz9KplkjysdtzuPV0nv6PrTit
         lWZnDqPMccHGClFRQ+p3pihy4IRXBiM1J8zvPUcX4HmEEwmwh6D7UMG4B0b2+Jfpywb3
         wAzWPo7X1QvPCDZGgMN5+qSi4iMYxBQ1/RdOGDLCPQdTySJv2ioc35vrjCIKf11I8z0U
         +mHg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id r27si1707224ljn.3.2019.07.22.03.36.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 03:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x6MAaaMa015572
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jul 2019 12:36:37 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6MAaafh031117;
	Mon, 22 Jul 2019 12:36:36 +0200
Subject: Re: [PATCH v3 2/6] arm-common: Introduce iommu functionality
To: Lokesh Vutla <lokeshvutla@ti.com>, jailhouse-dev@googlegroups.com
Cc: Sekhar Nori <nsekhar@ti.com>, William Mills <wmills@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
 <20190709134836.10485-3-p-yadav1@ti.com>
 <e36abeda-bdbb-4bf3-9a82-e5c321b56eea@siemens.com>
 <147060c1-064c-cb85-0c71-2a5217573c43@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <180abb03-718e-880d-bdf8-b9c56258d58a@siemens.com>
Date: Mon, 22 Jul 2019 12:36:35 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <147060c1-064c-cb85-0c71-2a5217573c43@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 22.07.19 11:51, Lokesh Vutla wrote:
> 
> 
> On 16/07/19 10:06 AM, Jan Kiszka wrote:
>> On 09.07.19 15:48, 'Pratyush Yadav' via Jailhouse wrote:
>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>
>>> Add the iommu hooks for ARM and ARM64 architectures with
>>> dummy implementations.
>>> Update the Kbuild to include new iommu files
>>>
>>> Introduce following hooks:
>>> iommu_map_memory - Setup iommu mapping for the memory region
>>> iommu_unmap_memory - Unmap the iommu mapping for the mem region
>>> iommu_config_commit - Commit all the changes to the mem mapping
>>>
>>> Call the map/unmap iommu functions in addition to CPU map/unmap and
>>> config_commit.
>>> Also add iommu_units in the platform data for ARM cells.
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>>> ---
>>>  hypervisor/arch/arm-common/Kbuild             |  2 +-
>>>  hypervisor/arch/arm-common/control.c          |  6 ++++
>>>  .../arch/arm-common/include/asm/iommu.h       | 26 +++++++++++++++
>>>  hypervisor/arch/arm-common/iommu.c            | 32 +++++++++++++++++++
>>>  hypervisor/arch/arm-common/mmu_cell.c         | 25 +++++++++++++++
>>>  hypervisor/include/jailhouse/control.h        |  1 +
>>>  hypervisor/setup.c                            |  2 +-
>>>  include/jailhouse/cell-config.h               |  2 ++
>>>  8 files changed, 94 insertions(+), 2 deletions(-)
>>>  create mode 100644 hypervisor/arch/arm-common/include/asm/iommu.h
>>>  create mode 100644 hypervisor/arch/arm-common/iommu.c
>>>
>>> diff --git a/hypervisor/arch/arm-common/Kbuild b/hypervisor/arch/arm-common/Kbuild
>>> index 78b9e512..6f57ef02 100644
>>> --- a/hypervisor/arch/arm-common/Kbuild
>>> +++ b/hypervisor/arch/arm-common/Kbuild
>>> @@ -17,6 +17,6 @@ ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
>>>  objs-y += dbg-write.o lib.o psci.o control.o paging.o mmu_cell.o setup.o
>>>  objs-y += irqchip.o pci.o ivshmem.o uart-pl011.o uart-xuartps.o uart-mvebu.o
>>>  objs-y += uart-hscif.o uart-scifa.o uart-imx.o
>>> -objs-y += gic-v2.o gic-v3.o smccc.o
>>> +objs-y += gic-v2.o gic-v3.o smccc.o iommu.o
>>>  
>>>  common-objs-y = $(addprefix ../arm-common/,$(objs-y))
>>> diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
>>> index b59c05d6..d712b049 100644
>>> --- a/hypervisor/arch/arm-common/control.c
>>> +++ b/hypervisor/arch/arm-common/control.c
>>> @@ -16,6 +16,7 @@
>>>  #include <jailhouse/printk.h>
>>>  #include <asm/control.h>
>>>  #include <asm/psci.h>
>>> +#include <asm/iommu.h>
>>>  
>>>  static void enter_cpu_off(struct public_per_cpu *cpu_public)
>>>  {
>>> @@ -208,7 +209,12 @@ void arch_flush_cell_vcpu_caches(struct cell *cell)
>>>  
>>>  void arch_config_commit(struct cell *cell_added_removed)
>>>  {
>>> +	u8 err;
>>> +
>>>  	irqchip_config_commit(cell_added_removed);
>>> +	err = iommu_config_commit(cell_added_removed);
>>
>> Passing an error here seems overkill. You are not generating any errors in
>> iommu_config_commit.
> 
> Yeah, I can drop the check here. Do you also want to make the function to return
> void?

As long as it does not produce errors, yes. Once it does, we need to think about
that.

> 
>>
>>> +	if (err)
>>> +		printk("WARNING: iommu_config_commit failed\n");
>>>  }
>>>  
>>>  void __attribute__((noreturn)) arch_panic_stop(void)
>>> diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h b/hypervisor/arch/arm-common/include/asm/iommu.h
>>> new file mode 100644
>>> index 00000000..d33ec17c
>>> --- /dev/null
>>> +++ b/hypervisor/arch/arm-common/include/asm/iommu.h
>>> @@ -0,0 +1,26 @@
>>> +/*
>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>> + *
>>> + * Copyright (c) 2018 Texas Instruments Incorporated - http://www.ti.com
>>> + *
>>> + * Authors:
>>> + *  Nikhil Devshatwar <nikhil.nd@ti.com>
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>>> + * the COPYING file in the top-level directory.
>>> + */
>>> +
>>> +#ifndef _JAILHOUSE_ASM_IOMMU_H
>>> +#define _JAILHOUSE_ASM_IOMMU_H
>>> +
>>> +#include <jailhouse/types.h>
>>> +#include <jailhouse/utils.h>
>>> +#include <jailhouse/config.h>
>>> +#include <jailhouse/cell-config.h>
>>> +
>>> +int iommu_map_memory_region(struct cell *cell,
>>> +			    const struct jailhouse_memory *mem);
>>> +int iommu_unmap_memory_region(struct cell *cell,
>>> +			      const struct jailhouse_memory *mem);
>>> +int iommu_config_commit(struct cell *cell);
>>> +#endif
>>> diff --git a/hypervisor/arch/arm-common/iommu.c b/hypervisor/arch/arm-common/iommu.c
>>> new file mode 100644
>>> index 00000000..5bc9e6a9
>>> --- /dev/null
>>> +++ b/hypervisor/arch/arm-common/iommu.c
>>> @@ -0,0 +1,32 @@
>>> +/*
>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>> + *
>>> + * Copyright (c) 2018 Texas Instruments Incorporated - http://www.ti.com
>>> + *
>>> + * Authors:
>>> + *  Nikhil Devshatwar <nikhil.nd@ti.com>
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>>> + * the COPYING file in the top-level directory.
>>> + */
>>> +
>>> +#include <jailhouse/control.h>
>>> +#include <jailhouse/config.h>
>>> +#include <asm/iommu.h>
>>> +
>>> +int iommu_map_memory_region(struct cell *cell,
>>> +			    const struct jailhouse_memory *mem)
>>> +{
>>> +	return 0;
>>> +}
>>> +
>>> +int iommu_unmap_memory_region(struct cell *cell,
>>> +			      const struct jailhouse_memory *mem)
>>> +{
>>> +	return 0;
>>> +}
>>> +
>>> +int iommu_config_commit(struct cell *cell)
>>> +{
>>> +	return 0;
>>> +}
>>> diff --git a/hypervisor/arch/arm-common/mmu_cell.c b/hypervisor/arch/arm-common/mmu_cell.c
>>> index 36a3016f..d51f92ca 100644
>>> --- a/hypervisor/arch/arm-common/mmu_cell.c
>>> +++ b/hypervisor/arch/arm-common/mmu_cell.c
>>> @@ -15,12 +15,14 @@
>>>  #include <jailhouse/printk.h>
>>>  #include <asm/sysregs.h>
>>>  #include <asm/control.h>
>>> +#include <asm/iommu.h>
>>>  
>>>  int arch_map_memory_region(struct cell *cell,
>>>  			   const struct jailhouse_memory *mem)
>>>  {
>>>  	u64 phys_start = mem->phys_start;
>>>  	u32 flags = PTE_FLAG_VALID | PTE_ACCESS_FLAG;
>>> +	int err = 0;
>>>  
>>>  	if (mem->flags & JAILHOUSE_MEM_READ)
>>>  		flags |= S2_PTE_ACCESS_RO;
>>> @@ -37,6 +39,17 @@ int arch_map_memory_region(struct cell *cell,
>>>  		flags |= S2_PAGE_ACCESS_XN;
>>>  	*/
>>>  
>>> +	/*
>>> +	 * Entire hypervisor memory is mapped to empty_page to avoid faults
>>> +	 * at the shutdown. We don't need this in the IOMMU mapping
>>> +	 * Skip mapping empty_page in the iommu mapping
>>> +	 */
>>
>> I agree this is not needed, but how much does it cost? Given the additional
>> effort here and on unmap and that we do not optimize this on x86, I would really
>> like to understand the benefits.
> 
> Isn't it wrong that hypervisor memory accessible by IOMMU? I guess it was added
> to just make things right. Do you want to drop it?

It is not wrong. At most, a device can read from that empty backing page. That's
why we did not care about this on x86. And if it would be a problem (more
regarding resources then), then it should be addressed generically.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/180abb03-718e-880d-bdf8-b9c56258d58a%40siemens.com.
