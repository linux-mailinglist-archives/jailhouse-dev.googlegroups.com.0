Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVVIWXUQKGQEU5JECBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A0E6A191
	for <lists+jailhouse-dev@lfdr.de>; Tue, 16 Jul 2019 06:36:38 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id u17sf4592419wmd.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 15 Jul 2019 21:36:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563251798; cv=pass;
        d=google.com; s=arc-20160816;
        b=J1pAjCHbZyxn2L+E0JLkrXARVYQN7Xz3QxkONTAmzJyZv1ABs4Kyy6Tf9AXBdPKFcZ
         XyU1vNF5PzfSzowPWPNV2AKMNbPHp7Xe3XH8TEFAFPu6GvKsBrzD77298lHBEkbtYr67
         Mm489hBTU8GjdZn2yZEvEhmp0H9zmMeuiGt0WdY3eYB5rfekyQRAIsPS67QznxBKq8Qv
         +o5jmAXiEuH2UbNt/XJMhhnkITapbvPAB9uE3C2PhPMeDFXs6+witzRVDEDKqmQQPCpx
         hZ3Eqstu/yLwiZ8BIg8EKPbz0o2yL6uucXXHgfYyKKy/JKydnvwxckqj1fRvSX6e2UV6
         PlmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=vww1Jr3ePPLlbaCnrB6W5nDv+dr1y8X1H26Us2RGj8c=;
        b=flMw2Lk2eW3VuMcP6Wvh9xz2vlTjkk+PF0HlbilxQ4YxRKhQ/luTzuwcC36GIkN3vS
         mASuxUrG6Q7fCWr9n0qOjkXXdyS4Qw2GCz9qlYmmVpY8ONAmn4VpiIV+P7nus34ElyR5
         1eu+tOKBpN96H2XwA/OYKDsf+OwTI4NqInHmmQsEQrfQR7nGBnfeEbT+EMA2FzjZ7H5y
         N3Hg3l+cz2H30dRisnhK0/A7OIk1uC+sw0eES7HgDaXKn3N4QWEUNVn6M32hfClYv+LT
         7tOoPZjOl5x8rrSA3HAj5RlO8N0ZYsypRyisWvf7hC3eabVDjGhT+J87UbvWgkxlFYVn
         wNgg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vww1Jr3ePPLlbaCnrB6W5nDv+dr1y8X1H26Us2RGj8c=;
        b=RmNJ42+WHt9V3DpEMn6zm65d6g04PMRz/Wmw5Jn9Mjb12+8JJNc0e8zu/8lzn7zoeV
         O9s2e4ZE3FXcLjSQP88ClLGHIKXmNpOJzN7ec0gXa2+gQjIESr8TKOYemhCqmRHuml7g
         XLpieGtycrlIqTJxzBxwm34qa5aru2vR1+BGGGqV2AaSufOTZhc8dJqo+dGuC2PKhFTn
         uoOL0/lk1rPUcvWxkl8fPsZfV8R9D9Q871e62Uo85KbncLMSFIiL266/sZW02t0Ts2jc
         aOlTc+Rj0gwChXhFWlSBCV8tdx623zubXdYGn3BLtug3OfIJzS5ul4lcNAMTXPXrgirp
         FgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vww1Jr3ePPLlbaCnrB6W5nDv+dr1y8X1H26Us2RGj8c=;
        b=bg547GRHZ07lBkyK2U8999HA5VAjprWJk/tyWnSWQ1ebCRQq3uvRl8sgMUbG++ssi2
         IDSb/x+wybs25CKj3atQ1nSKjxTdFKmaFh0l1K/R+P7Nargn5/56nh2o0CQGy7YIuIBv
         TivzEz45ze9Iz6WAR2quV4wozWEq8loCErYJ796XCGxnYYCpYJIMQvjZBcebMPR60qYI
         LZitYAZ7MSkAvsM372con+tJ0C7TRVoGAv88bYINyl5vPaJ32xin8LL+uM6bUb/YSCJJ
         u8xvnWSJ/EFZ6KF4tpIZIIW+UffuT1O3KeCHBXKp3JPEHFaJy47XrRYbAdgeaJpXlJmD
         l6pw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWcrWHQmQ0rnNtcimq/f6AYrh+UnUyGH3C9DtKTbfbi+rKvsYtn
	5XYEhGDnc1G8MDpbvDPXQl8=
X-Google-Smtp-Source: APXvYqzF7noMP6JOdNEm2rktGSGqnJd8l1lBrGJwxGZb3xwOJDZDxFyRJFNr0FvhScGsw7ujduGzcg==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr18414658wrj.10.1563251798360;
        Mon, 15 Jul 2019 21:36:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ec02:: with SMTP id x2ls6271391wrn.6.gmail; Mon, 15 Jul
 2019 21:36:37 -0700 (PDT)
X-Received: by 2002:a5d:4e4d:: with SMTP id r13mr34274200wrt.295.1563251797715;
        Mon, 15 Jul 2019 21:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563251797; cv=none;
        d=google.com; s=arc-20160816;
        b=Kxsgf4yFtWt6ODmfpcxCqkCImWTyHVvtbc8n9z68I16LzRa5D4Wbhdcsd/rSZta565
         Y8ct9IoO2T59S645UkVYaBJT/yHv+GSRiNPBz8vXYWaF/wmOPN1sTNaPl9MIwNnu1+//
         sEXNjZbB+WHAvQ9p0tYqmF9Dy1q8xHIc/iv2K6esejUSKF+DJ4P/JNC8lgYPv9+TCfoR
         ZhbDpxCPUr1fPDeXyHqwPmQIiV8SzmX0jCSth0c33/nsMIl0UWJWCx2h2hweBnzy9AEg
         WO79qUtLe7XijDBguGzyXv0njIhy0OMGJ3xk5Wwn9ZAq0/SJfA6l607jREWFLiBAAmt2
         aLig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=luycOed7u3HpAS34pd+kvllzEkxK7n240glZza0r9Wg=;
        b=g9eR8sa8JFDW3VR8lzZzW33ZxJdrqD7sPcWWnpMKhehmCw57pzDvgH4W0fKTgpNyH4
         C1sCyu7wZ1+HmbCDixLmw2k83qWkt24TSe/Tngq2NnUwhi8tkiWJ19tRhXBUGifuFLSU
         Fvmur0hXz+Lu0tz/OY2bEuwoEWbxdVzAyibQ/40+/ZNbPyPmaUJ4ff8OlMRCNMAG+NhW
         vaD369VMz9HidIoC02O1tNOgSEWr1d676Ru7LMMRMe/GJB0/VDXDeqARAyXstAOEsXsy
         KDmvn6TrMfuPdWeVplaeUBNCDh8qb8/DjwIsHbSU9v3alAm/phiaQXu768QIPJuBCfdR
         e8kA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id e12si1047471wma.2.2019.07.15.21.36.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 21:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6G4abhb012373
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jul 2019 06:36:37 +0200
Received: from [167.87.233.106] ([167.87.233.106])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6G4aZMJ014922;
	Tue, 16 Jul 2019 06:36:35 +0200
Subject: Re: [PATCH v3 2/6] arm-common: Introduce iommu functionality
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
 <20190709134836.10485-3-p-yadav1@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e36abeda-bdbb-4bf3-9a82-e5c321b56eea@siemens.com>
Date: Tue, 16 Jul 2019 13:36:33 +0900
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190709134836.10485-3-p-yadav1@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 09.07.19 15:48, 'Pratyush Yadav' via Jailhouse wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Add the iommu hooks for ARM and ARM64 architectures with
> dummy implementations.
> Update the Kbuild to include new iommu files
> 
> Introduce following hooks:
> iommu_map_memory - Setup iommu mapping for the memory region
> iommu_unmap_memory - Unmap the iommu mapping for the mem region
> iommu_config_commit - Commit all the changes to the mem mapping
> 
> Call the map/unmap iommu functions in addition to CPU map/unmap and
> config_commit.
> Also add iommu_units in the platform data for ARM cells.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>  hypervisor/arch/arm-common/Kbuild             |  2 +-
>  hypervisor/arch/arm-common/control.c          |  6 ++++
>  .../arch/arm-common/include/asm/iommu.h       | 26 +++++++++++++++
>  hypervisor/arch/arm-common/iommu.c            | 32 +++++++++++++++++++
>  hypervisor/arch/arm-common/mmu_cell.c         | 25 +++++++++++++++
>  hypervisor/include/jailhouse/control.h        |  1 +
>  hypervisor/setup.c                            |  2 +-
>  include/jailhouse/cell-config.h               |  2 ++
>  8 files changed, 94 insertions(+), 2 deletions(-)
>  create mode 100644 hypervisor/arch/arm-common/include/asm/iommu.h
>  create mode 100644 hypervisor/arch/arm-common/iommu.c
> 
> diff --git a/hypervisor/arch/arm-common/Kbuild b/hypervisor/arch/arm-common/Kbuild
> index 78b9e512..6f57ef02 100644
> --- a/hypervisor/arch/arm-common/Kbuild
> +++ b/hypervisor/arch/arm-common/Kbuild
> @@ -17,6 +17,6 @@ ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
>  objs-y += dbg-write.o lib.o psci.o control.o paging.o mmu_cell.o setup.o
>  objs-y += irqchip.o pci.o ivshmem.o uart-pl011.o uart-xuartps.o uart-mvebu.o
>  objs-y += uart-hscif.o uart-scifa.o uart-imx.o
> -objs-y += gic-v2.o gic-v3.o smccc.o
> +objs-y += gic-v2.o gic-v3.o smccc.o iommu.o
>  
>  common-objs-y = $(addprefix ../arm-common/,$(objs-y))
> diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
> index b59c05d6..d712b049 100644
> --- a/hypervisor/arch/arm-common/control.c
> +++ b/hypervisor/arch/arm-common/control.c
> @@ -16,6 +16,7 @@
>  #include <jailhouse/printk.h>
>  #include <asm/control.h>
>  #include <asm/psci.h>
> +#include <asm/iommu.h>
>  
>  static void enter_cpu_off(struct public_per_cpu *cpu_public)
>  {
> @@ -208,7 +209,12 @@ void arch_flush_cell_vcpu_caches(struct cell *cell)
>  
>  void arch_config_commit(struct cell *cell_added_removed)
>  {
> +	u8 err;
> +
>  	irqchip_config_commit(cell_added_removed);
> +	err = iommu_config_commit(cell_added_removed);

Passing an error here seems overkill. You are not generating any errors in
iommu_config_commit.

> +	if (err)
> +		printk("WARNING: iommu_config_commit failed\n");
>  }
>  
>  void __attribute__((noreturn)) arch_panic_stop(void)
> diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h b/hypervisor/arch/arm-common/include/asm/iommu.h
> new file mode 100644
> index 00000000..d33ec17c
> --- /dev/null
> +++ b/hypervisor/arch/arm-common/include/asm/iommu.h
> @@ -0,0 +1,26 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) 2018 Texas Instruments Incorporated - http://www.ti.com
> + *
> + * Authors:
> + *  Nikhil Devshatwar <nikhil.nd@ti.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#ifndef _JAILHOUSE_ASM_IOMMU_H
> +#define _JAILHOUSE_ASM_IOMMU_H
> +
> +#include <jailhouse/types.h>
> +#include <jailhouse/utils.h>
> +#include <jailhouse/config.h>
> +#include <jailhouse/cell-config.h>
> +
> +int iommu_map_memory_region(struct cell *cell,
> +			    const struct jailhouse_memory *mem);
> +int iommu_unmap_memory_region(struct cell *cell,
> +			      const struct jailhouse_memory *mem);
> +int iommu_config_commit(struct cell *cell);
> +#endif
> diff --git a/hypervisor/arch/arm-common/iommu.c b/hypervisor/arch/arm-common/iommu.c
> new file mode 100644
> index 00000000..5bc9e6a9
> --- /dev/null
> +++ b/hypervisor/arch/arm-common/iommu.c
> @@ -0,0 +1,32 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) 2018 Texas Instruments Incorporated - http://www.ti.com
> + *
> + * Authors:
> + *  Nikhil Devshatwar <nikhil.nd@ti.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/control.h>
> +#include <jailhouse/config.h>
> +#include <asm/iommu.h>
> +
> +int iommu_map_memory_region(struct cell *cell,
> +			    const struct jailhouse_memory *mem)
> +{
> +	return 0;
> +}
> +
> +int iommu_unmap_memory_region(struct cell *cell,
> +			      const struct jailhouse_memory *mem)
> +{
> +	return 0;
> +}
> +
> +int iommu_config_commit(struct cell *cell)
> +{
> +	return 0;
> +}
> diff --git a/hypervisor/arch/arm-common/mmu_cell.c b/hypervisor/arch/arm-common/mmu_cell.c
> index 36a3016f..d51f92ca 100644
> --- a/hypervisor/arch/arm-common/mmu_cell.c
> +++ b/hypervisor/arch/arm-common/mmu_cell.c
> @@ -15,12 +15,14 @@
>  #include <jailhouse/printk.h>
>  #include <asm/sysregs.h>
>  #include <asm/control.h>
> +#include <asm/iommu.h>
>  
>  int arch_map_memory_region(struct cell *cell,
>  			   const struct jailhouse_memory *mem)
>  {
>  	u64 phys_start = mem->phys_start;
>  	u32 flags = PTE_FLAG_VALID | PTE_ACCESS_FLAG;
> +	int err = 0;
>  
>  	if (mem->flags & JAILHOUSE_MEM_READ)
>  		flags |= S2_PTE_ACCESS_RO;
> @@ -37,6 +39,17 @@ int arch_map_memory_region(struct cell *cell,
>  		flags |= S2_PAGE_ACCESS_XN;
>  	*/
>  
> +	/*
> +	 * Entire hypervisor memory is mapped to empty_page to avoid faults
> +	 * at the shutdown. We don't need this in the IOMMU mapping
> +	 * Skip mapping empty_page in the iommu mapping
> +	 */

I agree this is not needed, but how much does it cost? Given the additional
effort here and on unmap and that we do not optimize this on x86, I would really
like to understand the benefits.

> +	if (mem->phys_start != paging_hvirt2phys(empty_page)) {
> +		err = iommu_map_memory_region(cell, mem);
> +		if (err)
> +			return err;
> +	}
> +
>  	return paging_create(&cell->arch.mm, phys_start, mem->size,
>  			     mem->virt_start, flags, PAGING_COHERENT);
>  }
> @@ -44,6 +57,18 @@ int arch_map_memory_region(struct cell *cell,
>  int arch_unmap_memory_region(struct cell *cell,
>  			     const struct jailhouse_memory *mem)
>  {
> +	int err = 0;
> +
> +	/*
> +	 * empty_page is not mapped in the iommu
> +	 * Skip all the calls to unmap as well
> +	 */
> +	if (mem->phys_start != paging_hvirt2phys(empty_page)) {
> +		err = iommu_unmap_memory_region(cell, mem);
> +		if (err)
> +			return err;
> +	}
> +
>  	return paging_destroy(&cell->arch.mm, mem->virt_start, mem->size,
>  			      PAGING_COHERENT);
>  }
> diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
> index 72518f6a..43dee950 100644
> --- a/hypervisor/include/jailhouse/control.h
> +++ b/hypervisor/include/jailhouse/control.h
> @@ -20,6 +20,7 @@
>  
>  extern volatile unsigned long panic_in_progress;
>  extern unsigned long panic_cpu;
> +extern const u8 empty_page[PAGE_SIZE];
>  
>  /**
>   * @defgroup Control Control Subsystem
> diff --git a/hypervisor/setup.c b/hypervisor/setup.c
> index 99a2b0c3..e3b1b3c8 100644
> --- a/hypervisor/setup.c
> +++ b/hypervisor/setup.c
> @@ -24,7 +24,7 @@
>  
>  extern u8 __text_start[], __page_pool[];
>  
> -static const __attribute__((aligned(PAGE_SIZE))) u8 empty_page[PAGE_SIZE];
> +const __attribute__((aligned(PAGE_SIZE))) u8 empty_page[PAGE_SIZE];
>  
>  static DEFINE_SPINLOCK(init_lock);
>  static unsigned int master_cpu_id = -1;
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 781aac88..c988f7c5 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -258,6 +258,8 @@ struct jailhouse_system {
>  				u64 gich_base;
>  				u64 gicv_base;
>  				u64 gicr_base;
> +				struct jailhouse_iommu
> +					iommu_units[JAILHOUSE_MAX_IOMMU_UNITS];
>  			} __attribute__((packed)) arm;
>  		} __attribute__((packed));
>  	} __attribute__((packed)) platform_info;
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e36abeda-bdbb-4bf3-9a82-e5c321b56eea%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
