Return-Path: <jailhouse-dev+bncBCB7D7MXMMINVDWW5ECRUBCPTDJRK@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id 9074E6FD07
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 11:52:27 +0200 (CEST)
Received: by mail-qk1-x737.google.com with SMTP id d9sf33033374qko.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 02:52:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563789146; cv=pass;
        d=google.com; s=arc-20160816;
        b=aEwfxHS/kjj1Kcu6k+hsbECKbySHgOBmd8DPY8YZyU27bjFPQquHPJtCC6kc5xS/iN
         XYE5WaZUiiLqa7idORc97XW2iRya/JPCCX0QwTFB6+02/IlVc6zNQtLtZLbgVbCEYJji
         kELu5AOiG3vq/Sw8Er0c0zfdpwozdPRuMjNp+Q73KsGlAAztTUbTEpF8he2xPfXIVEeA
         rROWYoTkEdy6TMhPsuPKpzvkCUWS/vakEmakU4KwaKcABEtASUO2AQlVuLF6Ah2IoTTu
         /oIcg7r8VS96Z8z+fIyrVCIZdBahAUJePtl1v1DzW7Mkal1QhDD2Smy5KohCCSg+lx0h
         k7iA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=b0ukZrXzkpnJfyeUp0PXdV7cxWWWnNkwzADJ/r2TKLI=;
        b=MQnmlxjMdJ7USlBRMo/CuhoM5L8FuU6aYMB3E08fDlXwIIh+oiRZEC2W+w8U83o7UO
         aaZ2C4Q7iGil2gPAQ9ZOL5ELdfaHr6TpZiMYH/ZuO39Ezv5nAOrxO0hN3U2EYI6b5l/k
         OCRwcN5AOZX+g9ve8HeHazIa1h1b6E//d0dkNOdFX6YYEVLl/j9jP0vIvDubh9VdE4DW
         qiyO3xHoqlwFu3hfctyMtWj3R9BplJu15P0NcHgMChpIkESoJlj3Tbc1HHMllJiKf+i2
         4TUUWJXUuq04GgYZi2i8EQAJ7AwaCgYxXU5/S3QuIWwYfOJ4FHJpsDeRJNQGIiy0em9O
         /6jg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=onTL2dgy;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=b0ukZrXzkpnJfyeUp0PXdV7cxWWWnNkwzADJ/r2TKLI=;
        b=PSO146TEANhxnxBIwLwHtFDLn3vvjiTnOn04cYOheaIDJwj33L8DTaA72p+60/9MSk
         XgpNvUVUcDVBxbzpq0r899awFp/BLylYnbYmC+GgoOWh8w1hFuAIfLJ5DCJIxCKKcyJj
         47UMqP0tcAdBdPtaEqtOOaOUnmHDnkoNBFXKkAW7lgiC/qX0uzRIeKyQQqrBQjK+9h1N
         EoDVU1jKxwrRo5mmaZtGcp+p3zNiFjmPC5qDJcRBYuRji0r/pkaRkssLwXIOM6UaVOzv
         crVhrq14Cyx7aDC1FtL7ylXpadgca8cS2b6QVkjw/3NvPDJYJOiJRljWCZQjb8XbwTvu
         J/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=b0ukZrXzkpnJfyeUp0PXdV7cxWWWnNkwzADJ/r2TKLI=;
        b=Q7KD3VEkakfNAnuj9GmPOzZkFvdH3cfsWp/HkefAov3rtSokGuPKkEY5eVQNsoBjs8
         HpKovSrfPj8x9Ge3AsTgZ/Yqo4zNyLUTPXqib6kmsIkL2oIkT7sayEvSayIZxV9YT7I+
         LVAVRFfvnSGN9n7QYEMPVgpAQjWE6MQXCZZ2QIl0EhqIsHYOtthN8WEa+Mgiy3iVPYyn
         viKK4RxZxCqlhI1FX84F+DXb5yfduEhzuH6u/PON4gEUcjZ4CSzwnw5PvK9pWKPL5inT
         UaJIAdxgYcvSdr1ZDc2qePDarSJuhqAP25AfFs8XODSyrc3/luvd7xEpuGHb6bnofJ7T
         0WWA==
X-Gm-Message-State: APjAAAVvi3z7hJJQnJoEF0T4226goHhc+9wIpDxr039whnkuMG/ygxdS
	Tp6nJTGWIv0RhOmEjQEygAs=
X-Google-Smtp-Source: APXvYqz8/b/EOMARKrxGvHEIohvJQLFx5pACfKSNC5O8EhuVM8HPg75TxdaLcZdbw4pqkpd2BwFqYA==
X-Received: by 2002:ac8:3449:: with SMTP id v9mr49842857qtb.163.1563789146264;
        Mon, 22 Jul 2019 02:52:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:b712:: with SMTP id t18ls6442031qvd.6.gmail; Mon, 22 Jul
 2019 02:52:25 -0700 (PDT)
X-Received: by 2002:a0c:d0f6:: with SMTP id b51mr48266491qvh.225.1563789145973;
        Mon, 22 Jul 2019 02:52:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563789145; cv=none;
        d=google.com; s=arc-20160816;
        b=FJXc3Bh28kyTJR2X6WidtTUHpBOBN30IL4SCzbU3kH07knB9+jE2DzCUK244wQPTVH
         O54R04w0oN4m4BwxoQ3FUHO5eoDh/1eD6xsU6Zk5JCe++5/Ij2hAxYALVRUkB1sN9khm
         lYME5716kbpzKIles3L7vqx9CNA+9kTtpqzdVTiKv+CCcThSAlz4aNutT6CF0j9VeZgm
         xE6cbnumprB9PnXO29H7aYU2IrEcF32udtNk+DcEt9/uC/efxl9yIyYqMOxt99zJv6oX
         de2hDDxo/kdhThm7ayEVJCW09CxXbpxUXEJx3flZ5G46n76IZf5UUTD3rzIENVp9DaHo
         XQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Ntr3VcB9C1fh9OkHyZ2gYxasjd9CP3ZygCaXmT5Cgfw=;
        b=IS2TiS+EQuewnYR+BRanemByVTTMMjl+UCjGADYTMCOe3edfucAAj9fVb6dtzxiNxc
         bNcym5+ctFLod5G3KJvp+49dD6TGg76fM7eFWUHXOah0ANglB0O9CCSPkeYsfnC9gJfk
         f4M+TsLGcSUVA6h5Z9xT0uXR+dtOzNfZqkqMnaDN3A9pX6ejXhxdv/bjNRQ6GQrzMne/
         CVOqrakdSev1wDYLQYZ+2t0m1nOZ3dAChJRTwjBsD+bQ5h83Oe4j79dpuwpQLvqOnnO2
         ZerkQnUAxOR7Fq/Hv/xB54ApdNeeHgIDJv6TcZwTTbmkdGeFsRcjh3G+6UrlQ0dofKEe
         ASFQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=onTL2dgy;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id u204si1581724qka.6.2019.07.22.02.52.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 02:52:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6M9qPnh117269;
	Mon, 22 Jul 2019 04:52:25 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6M9qPVL023576
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 Jul 2019 04:52:25 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 22
 Jul 2019 04:52:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 22 Jul 2019 04:52:24 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6M9qLh5002529;
	Mon, 22 Jul 2019 04:52:23 -0500
Subject: Re: [PATCH v3 2/6] arm-common: Introduce iommu functionality
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Sekhar Nori <nsekhar@ti.com>, William Mills <wmills@ti.com>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
 <20190709134836.10485-3-p-yadav1@ti.com>
 <e36abeda-bdbb-4bf3-9a82-e5c321b56eea@siemens.com>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <147060c1-064c-cb85-0c71-2a5217573c43@ti.com>
Date: Mon, 22 Jul 2019 15:21:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e36abeda-bdbb-4bf3-9a82-e5c321b56eea@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=onTL2dgy;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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



On 16/07/19 10:06 AM, Jan Kiszka wrote:
> On 09.07.19 15:48, 'Pratyush Yadav' via Jailhouse wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> Add the iommu hooks for ARM and ARM64 architectures with
>> dummy implementations.
>> Update the Kbuild to include new iommu files
>>
>> Introduce following hooks:
>> iommu_map_memory - Setup iommu mapping for the memory region
>> iommu_unmap_memory - Unmap the iommu mapping for the mem region
>> iommu_config_commit - Commit all the changes to the mem mapping
>>
>> Call the map/unmap iommu functions in addition to CPU map/unmap and
>> config_commit.
>> Also add iommu_units in the platform data for ARM cells.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>> ---
>>  hypervisor/arch/arm-common/Kbuild             |  2 +-
>>  hypervisor/arch/arm-common/control.c          |  6 ++++
>>  .../arch/arm-common/include/asm/iommu.h       | 26 +++++++++++++++
>>  hypervisor/arch/arm-common/iommu.c            | 32 +++++++++++++++++++
>>  hypervisor/arch/arm-common/mmu_cell.c         | 25 +++++++++++++++
>>  hypervisor/include/jailhouse/control.h        |  1 +
>>  hypervisor/setup.c                            |  2 +-
>>  include/jailhouse/cell-config.h               |  2 ++
>>  8 files changed, 94 insertions(+), 2 deletions(-)
>>  create mode 100644 hypervisor/arch/arm-common/include/asm/iommu.h
>>  create mode 100644 hypervisor/arch/arm-common/iommu.c
>>
>> diff --git a/hypervisor/arch/arm-common/Kbuild b/hypervisor/arch/arm-common/Kbuild
>> index 78b9e512..6f57ef02 100644
>> --- a/hypervisor/arch/arm-common/Kbuild
>> +++ b/hypervisor/arch/arm-common/Kbuild
>> @@ -17,6 +17,6 @@ ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
>>  objs-y += dbg-write.o lib.o psci.o control.o paging.o mmu_cell.o setup.o
>>  objs-y += irqchip.o pci.o ivshmem.o uart-pl011.o uart-xuartps.o uart-mvebu.o
>>  objs-y += uart-hscif.o uart-scifa.o uart-imx.o
>> -objs-y += gic-v2.o gic-v3.o smccc.o
>> +objs-y += gic-v2.o gic-v3.o smccc.o iommu.o
>>  
>>  common-objs-y = $(addprefix ../arm-common/,$(objs-y))
>> diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
>> index b59c05d6..d712b049 100644
>> --- a/hypervisor/arch/arm-common/control.c
>> +++ b/hypervisor/arch/arm-common/control.c
>> @@ -16,6 +16,7 @@
>>  #include <jailhouse/printk.h>
>>  #include <asm/control.h>
>>  #include <asm/psci.h>
>> +#include <asm/iommu.h>
>>  
>>  static void enter_cpu_off(struct public_per_cpu *cpu_public)
>>  {
>> @@ -208,7 +209,12 @@ void arch_flush_cell_vcpu_caches(struct cell *cell)
>>  
>>  void arch_config_commit(struct cell *cell_added_removed)
>>  {
>> +	u8 err;
>> +
>>  	irqchip_config_commit(cell_added_removed);
>> +	err = iommu_config_commit(cell_added_removed);
> 
> Passing an error here seems overkill. You are not generating any errors in
> iommu_config_commit.

Yeah, I can drop the check here. Do you also want to make the function to return
void?

> 
>> +	if (err)
>> +		printk("WARNING: iommu_config_commit failed\n");
>>  }
>>  
>>  void __attribute__((noreturn)) arch_panic_stop(void)
>> diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h b/hypervisor/arch/arm-common/include/asm/iommu.h
>> new file mode 100644
>> index 00000000..d33ec17c
>> --- /dev/null
>> +++ b/hypervisor/arch/arm-common/include/asm/iommu.h
>> @@ -0,0 +1,26 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright (c) 2018 Texas Instruments Incorporated - http://www.ti.com
>> + *
>> + * Authors:
>> + *  Nikhil Devshatwar <nikhil.nd@ti.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef _JAILHOUSE_ASM_IOMMU_H
>> +#define _JAILHOUSE_ASM_IOMMU_H
>> +
>> +#include <jailhouse/types.h>
>> +#include <jailhouse/utils.h>
>> +#include <jailhouse/config.h>
>> +#include <jailhouse/cell-config.h>
>> +
>> +int iommu_map_memory_region(struct cell *cell,
>> +			    const struct jailhouse_memory *mem);
>> +int iommu_unmap_memory_region(struct cell *cell,
>> +			      const struct jailhouse_memory *mem);
>> +int iommu_config_commit(struct cell *cell);
>> +#endif
>> diff --git a/hypervisor/arch/arm-common/iommu.c b/hypervisor/arch/arm-common/iommu.c
>> new file mode 100644
>> index 00000000..5bc9e6a9
>> --- /dev/null
>> +++ b/hypervisor/arch/arm-common/iommu.c
>> @@ -0,0 +1,32 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright (c) 2018 Texas Instruments Incorporated - http://www.ti.com
>> + *
>> + * Authors:
>> + *  Nikhil Devshatwar <nikhil.nd@ti.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include <jailhouse/control.h>
>> +#include <jailhouse/config.h>
>> +#include <asm/iommu.h>
>> +
>> +int iommu_map_memory_region(struct cell *cell,
>> +			    const struct jailhouse_memory *mem)
>> +{
>> +	return 0;
>> +}
>> +
>> +int iommu_unmap_memory_region(struct cell *cell,
>> +			      const struct jailhouse_memory *mem)
>> +{
>> +	return 0;
>> +}
>> +
>> +int iommu_config_commit(struct cell *cell)
>> +{
>> +	return 0;
>> +}
>> diff --git a/hypervisor/arch/arm-common/mmu_cell.c b/hypervisor/arch/arm-common/mmu_cell.c
>> index 36a3016f..d51f92ca 100644
>> --- a/hypervisor/arch/arm-common/mmu_cell.c
>> +++ b/hypervisor/arch/arm-common/mmu_cell.c
>> @@ -15,12 +15,14 @@
>>  #include <jailhouse/printk.h>
>>  #include <asm/sysregs.h>
>>  #include <asm/control.h>
>> +#include <asm/iommu.h>
>>  
>>  int arch_map_memory_region(struct cell *cell,
>>  			   const struct jailhouse_memory *mem)
>>  {
>>  	u64 phys_start = mem->phys_start;
>>  	u32 flags = PTE_FLAG_VALID | PTE_ACCESS_FLAG;
>> +	int err = 0;
>>  
>>  	if (mem->flags & JAILHOUSE_MEM_READ)
>>  		flags |= S2_PTE_ACCESS_RO;
>> @@ -37,6 +39,17 @@ int arch_map_memory_region(struct cell *cell,
>>  		flags |= S2_PAGE_ACCESS_XN;
>>  	*/
>>  
>> +	/*
>> +	 * Entire hypervisor memory is mapped to empty_page to avoid faults
>> +	 * at the shutdown. We don't need this in the IOMMU mapping
>> +	 * Skip mapping empty_page in the iommu mapping
>> +	 */
> 
> I agree this is not needed, but how much does it cost? Given the additional
> effort here and on unmap and that we do not optimize this on x86, I would really
> like to understand the benefits.

Isn't it wrong that hypervisor memory accessible by IOMMU? I guess it was added
to just make things right. Do you want to drop it?

Thanks and regards,
Lokesh

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/147060c1-064c-cb85-0c71-2a5217573c43%40ti.com.
