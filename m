Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBB6AYH2QKGQESJQUKPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 434D71C4605
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 May 2020 20:33:44 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id p17sf1393476ljn.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 May 2020 11:33:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588617223; cv=pass;
        d=google.com; s=arc-20160816;
        b=V6wOGG+UzoenmKYdupLjWyP94pF2pssviIKkqG+6fCp+6OUM+udC72e4NCvEK6rLMy
         zCmJ3cAorc8ivPHgCpMoNwwBPq5QYbK2b9ZxMv415mv3X4iUiJmL9fAYXnAo0fgS19v7
         TweyoBG/CzOfyW7qLB1ZR2/FsoJTE1nYXSp0Rc97eXTmbKgjvaAZtiFafKcPsD/HSX+p
         dWPhPwH7iJw74di+nLchhwz/nyQxRS6FQvF8EMY+nKRRgkARwa4nsEHLcjvVrhDErvMg
         jXYhxqLkddU1HgAe9fv+gyEDibXA9s3+sUVgjlx/j3Hrjtfqa1gtG7uiZIg+Uq307+v8
         liFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=olhFAeCe5axo/TcQb+fxoDH0uLbNd5Ms6cT9NFXFKwM=;
        b=Yt14GB+8GM342yKjnYhrJrglG0OhywToJstaEU9ul3kfMUng+7Ot8iWHOnH9zKh64m
         e1/hRIB9zqv5TCspZLtIljyMotqV2fcOGTaXcq2crMhfimPOvtesnJwSAA6bLXw2I5yX
         MBMU8ZS3aK/kR1awg5x7L6IXOYgONlpMiCLvtDrvylx2qlG1bnwF58KpW3VB+FDd8B1J
         erkfclbJ0Q2oknIdFtxUgkA+O8C7bqas5nPaAz4OdCifxJ58WDruhivIuXQvd3BVMUAA
         oV7BBCU8AGZLfVKAMXf8MN3UqtxqVzUtphof7J9JPWbYOQS324H8B7fB1TCGrq/jZBVE
         h1Yw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=olhFAeCe5axo/TcQb+fxoDH0uLbNd5Ms6cT9NFXFKwM=;
        b=A1n5LryV8Y04bq81dMLlD7bKqSdFVLCFWVYO0qFiD8A+4OjQqfh9jKCRGS+mJXgeRV
         Cry2dxkyv+vcnnfOvJ5FpmiqMmQ+ALezfDHNpStqkXeDt5Sx6r0nM6FgN+FIaNkRu1dX
         wNbeLY30gNDPVNF1XPrKwWFi6pulEoRUYjHjyt6AVXCZD6oQBfzfFPPiBOsp90F3z/j1
         2p16UJUrvXHLAefVUiotfgOqN82qnR3nFKFuWYZty0nu4Z7UzS/qN9pr3ONZ1EaGVucn
         2uuxPh8wyLM+clF2RlRK1gSZD2mEe55bETskN1vqH7dxR8UyYD8zOZm5g2StcUM9JeD4
         gLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=olhFAeCe5axo/TcQb+fxoDH0uLbNd5Ms6cT9NFXFKwM=;
        b=O4FMPN0AMCwE5lJTAfkOnHrv8CfdgyHo1SotnQn3bOEbTNT73JqRjuPDkGqhHoKt2j
         piVYgGq59osYbbYKf4K3FTjMn30PJXEz+EPYTPVsYHH4PRFlqk92Ml+f0VMFTpQTldBU
         pimkp8X2VIgWKbXI+wQEX+P5vKiI0ar2Vmo6F7qm2hJUHedsqnXVzqAuda3T+y9xi8UQ
         /Ue2rIbJClwth6SHVQmFtTaZSGPPw58GO2KOhs1VA3nYHiBDVqP7Cj7DpZxB1xxMA+bB
         3EhBlN+sdaLbMG0GK0cIM3Hr3CAM8GGAcMESlp6bxuyecdc1/n0SlsHlhyK5siSOtFS5
         2Dmw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubhEqwAwQdWNG54U97lsnMpBpDOox3T2TH/zdCY90v2EPfLG2Us
	lioJpRMD2dpshXGOWV9JRJ4=
X-Google-Smtp-Source: APiQypLnddsPqZcC1EtpYzm2LmMPa2yf7/XWfM+cPwQfi2DZ9qhpCzccCDtrgYcAltuR6WGgk00FXw==
X-Received: by 2002:ac2:5395:: with SMTP id g21mr12553920lfh.61.1588617223763;
        Mon, 04 May 2020 11:33:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ae17:: with SMTP id f23ls2441534lfc.9.gmail; Mon, 04 May
 2020 11:33:42 -0700 (PDT)
X-Received: by 2002:a05:6512:686:: with SMTP id t6mr12866265lfe.163.1588617222834;
        Mon, 04 May 2020 11:33:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588617222; cv=none;
        d=google.com; s=arc-20160816;
        b=pHKFHXWI3FsR7MEq9r2KhzfQSsaDPp7pMelKjzcpRMZxfNfOaxsT//Tg2n9lljIGJl
         PkLZVaRcMXT/n77DZ8Ryw8XLJLrHcbTDXikckqbEAEQVNAql9gBWEcj6XFJZpfxNF+2n
         aHUp4SSlaiBG7/xvpc8r7dG8oVQw8w6ajZ5eEm0qzhd1ZyCqIJVOEH/TbJswxcUIcVdD
         dcg+Zsw8twjjQDjhhBKO7cSSIna4eLzRMXumt5cQKx8TMT4T1zkGHFzfyqynCTlz860v
         YpoHSFNviOH8FKgvC6rG++VGab4gNN7ztlly2zAGkOu2iKQbj0Ngq95jQFAw+OYSgooQ
         m0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=9Is1b2SKyga9uhBPLzD1e9qb2wNAXdrHE0qyP9wIK98=;
        b=BvCCRmrWQkG4rwpZvm86goBjpZBfC1SC/Qc71ZXUbsI8oL3Fi5smgLDocgfzcWhTJR
         NM94HdbZAd5sLYf/5v6G/RmSmagQewlmbG71Oel9rTW7e5i+7GlzL0Hmm+F0fYKbng0u
         nAYAA9XoY5PNfx31DJjM2lt89yu8MUU7rjDoKnQ29Ix0r7hGnKJRNNcej1wUsQs4VN4F
         vmGmXR3pzLmQ8gvf0oQxoWni/nbd0//8G+DWHmh24bpFGM2cHuomatFlxkLDr1AuQHGt
         iwdtWWEKxRADkFB9zHvdLViyK1zKYgkHyBWWpAZiqEE7BZziNA83M9tJqTbqo9BXZeEl
         JI/A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q24si834834ljg.4.2020.05.04.11.33.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 11:33:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 044IXfM6026160
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 May 2020 20:33:41 +0200
Received: from [167.87.53.26] ([167.87.53.26])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 044IXeC4018119;
	Mon, 4 May 2020 20:33:40 +0200
Subject: Re: [PATCH v2 4/9] hypervisor, arm-common: add initial support for
 cache coloring
To: Marco Solieri <ms@xt3.it>, jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-5-ms@xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2bec9973-da05-eca5-5afd-2908762c20aa@siemens.com>
Date: Mon, 4 May 2020 20:33:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421100351.292395-5-ms@xt3.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Use a bitmask array with fixed size for the cell's color assignment.
> The largest amount of shared last-level segment cache equipping an Arm v8
> cluster for the embedded segment (i.e. Cortex A5?, A7?), which contains
> up to 8 cores, is 8 MiB with 16-ways associativity.
> Now, assuming the coloring algorithm to be the same as we support, i.e.
> smallest granularity with 4 KiB pages, we compute that up to 128 colors
> available.
> For this reason set the amount of colors supported to 128.
> 
> Colored regions defined by the flag JAILHOUSE_MEM_COLORED are mapped
> using the "colored" version of paging_create when needed.
> The colored version of paging_destroy is used only when unmapping from
> the root cell since we are assuming a 1:1 mapping for it.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <ms@xt3.it>
> ---
>   hypervisor/arch/arm-common/include/asm/cell.h |  4 ++
>   .../arch/arm-common/include/asm/coloring.h    | 22 +++++++
>   hypervisor/arch/arm-common/mmu_cell.c         | 62 ++++++++++++++++---
>   3 files changed, 79 insertions(+), 9 deletions(-)
>   create mode 100644 hypervisor/arch/arm-common/include/asm/coloring.h
> 
> diff --git a/hypervisor/arch/arm-common/include/asm/cell.h b/hypervisor/arch/arm-common/include/asm/cell.h
> index 9c6e8c6f..c5159b46 100644
> --- a/hypervisor/arch/arm-common/include/asm/cell.h
> +++ b/hypervisor/arch/arm-common/include/asm/cell.h
> @@ -14,6 +14,7 @@
>   #define _JAILHOUSE_ASM_CELL_H
>   
>   #include <jailhouse/paging.h>
> +#include <asm/coloring.h>
>   
>   struct pvu_tlb_entry;
>   
> @@ -26,6 +27,9 @@ struct arch_cell {
>   		u8 ent_count;
>   		struct pvu_tlb_entry *entries;
>   	} iommu_pvu; /**< ARM PVU specific fields. */
> +
> +	/** Color configuration as a bitmask */
> +	unsigned long color_bitmask[COLOR_BITMASK_SIZE];

This field can become generic...

>   };
>   
>   #endif /* !_JAILHOUSE_ASM_CELL_H */
> diff --git a/hypervisor/arch/arm-common/include/asm/coloring.h b/hypervisor/arch/arm-common/include/asm/coloring.h
> new file mode 100644
> index 00000000..9404948f
> --- /dev/null
> +++ b/hypervisor/arch/arm-common/include/asm/coloring.h
> @@ -0,0 +1,22 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) Universita'  di Modena e Reggio Emilia, 2020
> + *
> + * Authors:
> + *  Luca Miccio <lucmiccio@gmail.com>
> + *  Marco Solieri <ms@xt3.it>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#ifndef _JAILHOUSE_ASM_COLORING_H
> +#define _JAILHOUSE_ASM_COLORING_H
> +
> +#define COLOR_BITMASK_SIZE 4
> +

...while this is probably arch-specific. But could start with a generic 
define as well split that up once some arch with a different need comes 
around.

> +/* Max. number of colors supported */
> +#define MAX_COLOR_SUPPORTED     128

MAX_COLOR_SUPPORTED = COLOR_BITMASK_SIZE * sizeof(u64)? Or should 
COLOR_BITMASK_SIZE be rather derived from the number of colors? But 
those depend on each other and are not separate tuneables.

> +
> +#endif /* !_JAILHOUSE_ASM_COLORING_H */
> diff --git a/hypervisor/arch/arm-common/mmu_cell.c b/hypervisor/arch/arm-common/mmu_cell.c
> index db618960..912d9399 100644
> --- a/hypervisor/arch/arm-common/mmu_cell.c
> +++ b/hypervisor/arch/arm-common/mmu_cell.c
> @@ -13,6 +13,7 @@
>   #include <jailhouse/control.h>
>   #include <jailhouse/paging.h>
>   #include <jailhouse/printk.h>
> +#include <jailhouse/coloring.h>
>   #include <asm/sysregs.h>
>   #include <asm/control.h>
>   #include <asm/iommu.h>
> @@ -46,8 +47,29 @@ int arch_map_memory_region(struct cell *cell,
>   	if (err)
>   		return err;
>   
> -	err = paging_create(&cell->arch.mm, phys_start, mem->size,
> -			    mem->virt_start, access_flags, paging_flags);
> +	if (mem->flags & JAILHOUSE_MEM_COLORED)
> +		/**
> +		 * Identity mapping is necessary only when remapping to the root
> +		 * cell during destroy phase. To check if we are in the destroy

I'm not yet sure if I get that case complete: When a cell is destroyed, 
the root cell should get access to those resources it had before the 
cell was create. In case of colored memory, this would mean:

  - the root cell had a colored mapping over the respective memory range
  - the root cell had the colors that were later assign to the non-root
    cell

Now, if the latter case is true, colors will move back to the root cell 
(not yet sure if that is actually the case with your design, but it 
should be). Once they are, mapping a region back to the root cell will 
"magically" establish also the stripes that used to belong to the 
non-root cell.

> +		 * phase the control is made on the memory virtual start and
> +		 * col_load_address. We cannot have a scenario where these
> +		 * addresses are equal because:
> +		 * 1) virt_start == phys_start.
> +		 * 2) we assume that col_load_address is configured so that it
> +		 * does not interfere with memory layout.
> +		 * 3) if col_load_address is equal to phys_start there is a
> +		 * wrong root-cell configuration.
> +		 * It means that in the previous wrong scenario col_load_address
> +		 * overlaps some root-cell memory space.
> +		 */
> +		err = paging_create_colored(&cell->arch.mm, phys_start,
> +			mem->size, mem->virt_start, access_flags, paging_flags,
> +			cell->arch.color_bitmask, (cell == &root_cell) &&
> +			(mem->virt_start !=
> +				system_config->platform_info.col_load_address));
> +	else
> +		err = paging_create(&cell->arch.mm, phys_start, mem->size,
> +			mem->virt_start, access_flags, paging_flags);

BTW, the good thing about having a generic cell->color_bitmask would be 
that this field could be fully populated by default, and we would no 
longer need to differentiate between colored and non-colored here.

>   	if (err)
>   		iommu_unmap_memory_region(cell, mem);
>   
> @@ -63,8 +85,19 @@ int arch_unmap_memory_region(struct cell *cell,
>   	if (err)
>   		return err;
>   
> -	return paging_destroy(&cell->arch.mm, mem->virt_start, mem->size,
> -			      PAGING_COHERENT);
> +	/*
> +	 * Do not be confused -- since paging_destroy* acts on virtual
> +	 * addresses, paging_destroy can be physically colored, too.
> +	 * We need to destroy the mapping using coloring only when unmapping
> +	 * from the root cell during cell_create so that the correct regions are
> +	 * removed and then used from the cells.
> +	 */
> +	if (mem->flags & JAILHOUSE_MEM_COLORED && (cell == &root_cell))
> +		return paging_destroy_colored(&cell->arch.mm, mem->virt_start,
> +			mem->size, PAGING_COHERENT, cell->arch.color_bitmask);
> +	else
> +		return paging_destroy(&cell->arch.mm, mem->virt_start,
> +			mem->size, PAGING_COHERENT);
>   }
>   
>   unsigned long arch_paging_gphys2phys(unsigned long gphys, unsigned long flags)
> @@ -91,10 +124,20 @@ void arm_cell_dcaches_flush(struct cell *cell, enum dcache_flush flush)
>   				   NUM_TEMPORARY_PAGES * PAGE_SIZE);
>   
>   			/* cannot fail, mapping area is preallocated */
> -			paging_create(&this_cpu_data()->pg_structs, region_addr,
> -				      size, TEMPORARY_MAPPING_BASE,
> -				      PAGE_DEFAULT_FLAGS,
> -				      PAGING_NON_COHERENT | PAGING_NO_HUGE);
> +			if (mem->flags & JAILHOUSE_MEM_COLORED)
> +				paging_create_colored(
> +					&this_cpu_data()->pg_structs,
> +					region_addr, size,
> +					TEMPORARY_MAPPING_BASE,
> +					PAGE_DEFAULT_FLAGS,
> +					PAGING_NON_COHERENT | PAGING_NO_HUGE,
> +					cell->arch.color_bitmask, false);
> +			else
> +				paging_create(&this_cpu_data()->pg_structs,
> +					region_addr,
> +					size, TEMPORARY_MAPPING_BASE,
> +					PAGE_DEFAULT_FLAGS,
> +					PAGING_NON_COHERENT | PAGING_NO_HUGE);
>   
>   			arm_dcaches_flush((void *)TEMPORARY_MAPPING_BASE, size,
>   					  flush);
> @@ -120,7 +163,8 @@ int arm_paging_cell_init(struct cell *cell)
>   	if (!cell->arch.mm.root_table)
>   		return -ENOMEM;
>   
> -	return 0;
> +	/* Init coloring configuration of the cell */
> +	return coloring_cell_init(cell);

This is only added in patch 7.

We should try to preserve bisectability whenever possible. Reorder or 
provide stubs so that things remain buildable - and also runnable!

>   }
>   
>   void arm_paging_cell_destroy(struct cell *cell)
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2bec9973-da05-eca5-5afd-2908762c20aa%40siemens.com.
