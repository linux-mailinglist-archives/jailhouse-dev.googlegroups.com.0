Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBT57YH2QKGQE5H2YJGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F4A1C4601
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 May 2020 20:32:48 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id x8sf359051wrl.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 May 2020 11:32:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588617167; cv=pass;
        d=google.com; s=arc-20160816;
        b=VfswnPZCGZZrOde7vOf+ai8XlKu9CivgeFfbiJiQLKGD8qEOVOrD0FDkLufKTsR9VJ
         +dx82SOIm5W9YRwGYmqRa9awQ4PLttjRDnUhTdkWAJiRxI10JfjtfGnDcvVkJlNvFfjw
         L9yFy1oT5I5TCLyIuzOIU1+fulIGOoX5BRqE4k4mnbk8eQfyjafGnyybXe62GYixAFGM
         tqhLOjO6tHLIuKFLCYS+a1D7y/wn4Ul/rxD79zt4ZI4Ej/6CH8vWK6rqAqDuWCFm6chx
         Qm2Y5/FJFJTcwaje3DFIe6i0yPiy4sRSk7UohdvsIDcdnXwGBQoYRxPll0fpO5lF1QKs
         IeGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=7EZ63GqfxDvOVjOwA1VVIxXk77YP2rrvgqltvN5gUI4=;
        b=CCxw+xj0A/DadQx5o3ZJ7cPrRiXYFTQMplBfhBhM/BmochpDjhe5G6EV/3RP1RBruv
         naxHX5mG0DH/gCjBf2ijnDNqG+UAapW65AFaXsp0OxJyNoVRvUhazbo7FXb2QYPXIlpd
         KmTPxrjYmkJxCI6tyqnwqBKcWOnIpx8mCpKq7muflp36AGb4JYPxO87qjP9IJ7hGapuq
         Qxt8/XdCDVXXHX0Zo5ePYcN6WfDqvSR6Uv5RmVlLcUkN7jF7gpVJyM+z1QiYI213I7P0
         2SsgIrAhdfgFvG0hnfjhHlzRaEwpO3JYTd1Evz8+GK2OcyUDu2Lc+4ScfO8AsxB9TwPe
         zXSQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7EZ63GqfxDvOVjOwA1VVIxXk77YP2rrvgqltvN5gUI4=;
        b=lpbVODKdu+XycrVt6yBf6OTx3VVsf9k/0T2f5c1xdx3XHUp0flhwFzdcRZKNE/oxQa
         e/XORlekkWqVfJTcids2tGLgDgE2fdjbJ50SHzZheoju3Y5xw8hJbbcL2eh1IqsZ/NuT
         LlEyb2hEcd+Tfx1b29HnAsIlb2odJhSv6VquCPARfKN49APKgiI+ZHtwKOAjVsxg9AOo
         mAiuXsg+5/YtPhm5udIgUNKnSbABbVMsNG9PqfoFI7iUEZyhfUsHw6L7MwlHfyxlL7Qr
         PyX7LmIFIhRSEW3bfISK83Qjz57OJzTDn/gf/nXmQYwZ/Y0fUaXOZ2zsfuQ0fpZYBOxR
         o0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7EZ63GqfxDvOVjOwA1VVIxXk77YP2rrvgqltvN5gUI4=;
        b=qCzzcbdMyo0TDgfpz2dCruGgXk3EBWZ2CUTDtEk5abbeqQmJQkV6pCA2Yev3vp9pjH
         1Zm97U0CGANh1ynp5/EM+3raIQHPs0xZ++EdFYuorAfR3C0dJmlgVbvaVvwbgznGvIDY
         oy7Jz+A4OUQKB+4vdeBUgWHhXBT6vbCONWUR9b6KINTjL1vZfaNmWJp49ORsSsw0J382
         yEwZAPuXU9axsl1EymlerPEyAcWU2mxQPfEYISUem4Y2yPWfraeRT9Vx/5pkSDt8Z+EG
         AVrD/gPYSjd8ajG/gHL9FVgB5vjCWdQXjHVragS9bt131t4OQh3bwB9XLEAQh7e6y1U2
         6fmg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubecyDQdAl7AsuKXGUgDRUQWJdOXce7ptbt/63FgYubgvCe18VP
	55ROYVCi7xQginerCNfCLPc=
X-Google-Smtp-Source: APiQypJwGzxNEakZTajAvYrrWZhyzlgqEQyVjxq2MHKERhW5/xqRjdZV9z3dGeC5bN3eFxXEtkIhHg==
X-Received: by 2002:a1c:3884:: with SMTP id f126mr16991395wma.91.1588617167608;
        Mon, 04 May 2020 11:32:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4088:: with SMTP id n130ls1185568wma.2.canary-gmail;
 Mon, 04 May 2020 11:32:46 -0700 (PDT)
X-Received: by 2002:a1c:5403:: with SMTP id i3mr17215226wmb.10.1588617166880;
        Mon, 04 May 2020 11:32:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588617166; cv=none;
        d=google.com; s=arc-20160816;
        b=ezfPWoktwysrpvZuyuji3rfaAWa99YOD4tMNvrelOG6B95rVELRS7gd0Wi9c8WCZyd
         iRoR+h99qltMNZIjb3Mdi6/r8LfI7Ku20cBH7iFqc0wElrxxc36fuFCT//jOWV1gd1/S
         G8d31DvTuFGZ3RkFDaYLY7gkGdJ8jB54sEkp+28I4Y/YTS58Ol/25AsRXksCxFIduplU
         jlt825oKfpE4n/WTToh7ludllOKDqrPsocQ26tdnq6pyFapmsJc36c6PZi6KU6oA42ft
         DLtR/HhZAv4kTpyKmhTrdb7NwOtk2Ckp5p7dvE00wC9fz6FWvoDvxY0J5UN8g8rvT2i+
         nIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=W/qB2vWQzBgUZ5RdO38exFf5RUdxePynJxS96jqh5Hk=;
        b=CQP9k14v8CYWke4e8G/n+j2sr2k/uFrpd5TWoyT2bYE1YgVA+aSWeKMUGV+gcgx2cP
         JVbnGH4vxfPcu3H2/+MARjECUoiVUMRlfMuLrxiuzzjrkBKfCmf6C8vuP6MKkmomNGeC
         RcBLMsL24XQMxwYYK228boGd3PRLqf4yUAgZi5G3BGYeuXBWdkNnXQajvJ2mg+cNibqX
         atBzjwzUi51T0fJBQWVX3G7YpjEwErAfyl5E8bC26ZSaUgysfo3GnIi7xcURAoScZ54G
         7wvsHmxCKASh4HEEkozPw0f/Ar5rwNDxWaiS9l7QlwvcUSmefYVCBZfEkGsuLV0mE55m
         3C3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id u16si39609wmd.2.2020.05.04.11.32.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 11:32:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 044IWkEW019065
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 May 2020 20:32:46 +0200
Received: from [167.87.53.26] ([167.87.53.26])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 044IWjch016586;
	Mon, 4 May 2020 20:32:45 +0200
Subject: Re: [PATCH v2 2/9] hypervisor: implement
 paging_create/destroy_colored
To: Marco Solieri <ms@xt3.it>, jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-3-ms@xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d492ee67-ee26-3533-5ca6-7c9e3e783abf@siemens.com>
Date: Mon, 4 May 2020 20:32:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421100351.292395-3-ms@xt3.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
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

On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Add functions for colored page creation and destruction and initialize
> coloring on the platform.
> 
> The story of the life of a coloring page can be summarized as follows.
> 
> 1. Bits in the address that are useful for defining colors are computed,
>     and used for all mappings. The page size used to obtain the lower limit
>     is assumed to be aligned with the `PAGE_SIZE` constant defaulting at
>     4KiB, and also as the unit for the mapping operation, even when
>     consecutive pages would be possible.
> 
> 2. The colored regions can then mapped with a new paging function and
>     destructed with the old one, because `paging_destroy*` acts on virtual
>     addresses while coloring happens on the physical ones.
>     Paging_create has to handle the remap to root_cell too when e.g.
>     destroying cells.
> 
> 3. The colored unmap function is instead used only when destroying the
>     root cell mapping, since we assume that the root cell uses a 1:1 mapping
>     for memory regions.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <ms@xt3.it>
> ---
>   hypervisor/include/jailhouse/paging.h |  11 ++
>   hypervisor/paging.c                   | 155 ++++++++++++++++++++++++++
>   2 files changed, 166 insertions(+)
> 
> diff --git a/hypervisor/include/jailhouse/paging.h b/hypervisor/include/jailhouse/paging.h
> index 5513c4ec..032a3a04 100644
> --- a/hypervisor/include/jailhouse/paging.h
> +++ b/hypervisor/include/jailhouse/paging.h
> @@ -267,6 +267,17 @@ int paging_destroy(const struct paging_structures *pg_structs,
>   		   unsigned long virt, unsigned long size,
>   		   unsigned long paging_flags);
>   
> +int paging_create_colored(const struct paging_structures *pg_structs,
> +			  unsigned long phys, unsigned long size,
> +			  unsigned long virt, unsigned long access_flags,
> +			  unsigned long paging_flags,
> +			  unsigned long *color_bitmask, bool identity_map);
> +
> +int paging_destroy_colored(const struct paging_structures *pg_structs,
> +			   unsigned long virt, unsigned long size,
> +			   unsigned long paging_flags,
> +			   unsigned long *color_bitmask);
> +
>   void *paging_map_device(unsigned long phys, unsigned long size);
>   void paging_unmap_device(unsigned long phys, void *virt, unsigned long size);
>   
> diff --git a/hypervisor/paging.c b/hypervisor/paging.c
> index 876f1521..e8f741c2 100644
> --- a/hypervisor/paging.c
> +++ b/hypervisor/paging.c
> @@ -5,6 +5,8 @@
>    *
>    * Authors:
>    *  Jan Kiszka <jan.kiszka@siemens.com>
> + *  Luca Miccio <lucmiccio@gmail.com> (cache coloring support)
> + *  Marco Solieri <ms@xt3.it> (cache coloring support)
>    *
>    * This work is licensed under the terms of the GNU GPL, version 2.  See
>    * the COPYING file in the top-level directory.
> @@ -14,6 +16,7 @@
>   #include <jailhouse/printk.h>
>   #include <jailhouse/string.h>
>   #include <jailhouse/control.h>
> +#include <jailhouse/coloring.h>
>   
>   #define BITS_PER_PAGE		(PAGE_SIZE * 8)
>   
> @@ -438,6 +441,153 @@ int paging_destroy(const struct paging_structures *pg_structs,
>   	return 0;
>   }
>   
> +/**
> + * Create or modify a colored page map.
> + * @param pg_structs	Descriptor of paging structures to be used.
> + * @param phys		Physical address of the region to be mapped.
> + * @param size		Size of the region.
> + * @param virt		Virtual address the region should be mapped to.
> + * @param access_flags	Flags describing the permitted page access, see
> + * @ref PAGE_ACCESS_FLAGS.
> + * @param color_bitmask	Bitmask specifying value of coloring.
> + * @param identity_map	If true the mapping will be 1:1.
> + *
> + * @return 0 on success, negative error code otherwise.
> + *
> + * @note The function uses only 4 KiB page size for mapping.
> + *
> + * @see paging_destroy_colored
> + * @see paging_get_guest_pages
> + */
> +int paging_create_colored(const struct paging_structures *pg_structs,
> +			  unsigned long phys, unsigned long size,
> +			  unsigned long virt, unsigned long access_flags,
> +			  unsigned long paging_flags,
> +			  unsigned long *color_bitmask, bool identity_map)
> +{
> +
> +	phys &= PAGE_MASK;
> +	virt &= PAGE_MASK;
> +	size = PAGE_ALIGN(size);
> +
> +	while (size > 0) {
> +		const struct paging *paging = pg_structs->root_paging;
> +		page_table_t pt = pg_structs->root_table;
> +		pt_entry_t pte;
> +		int err;
> +
> +		phys = next_colored(phys, color_bitmask);
> +		if (identity_map)
> +			virt = phys;
> +
> +		while (1) {
> +			pte = paging->get_entry(pt, virt);
> +			if (paging->page_size == PAGE_SIZE) {
> +				paging->set_terminal(pte, phys, access_flags);
> +				flush_pt_entry(pte, paging_flags);
> +				break;
> +			}
> +			/* Loop until 4K page size by splitting hugepages */
> +			if (paging->entry_valid(pte, PAGE_PRESENT_FLAGS)) {
> +				err = split_hugepage(pg_structs->hv_paging,
> +							paging, pte, virt,
> +							paging_flags);
> +				if (err)
> +					return err;
> +				pt = paging_phys2hvirt(
> +					paging->get_next_pt(pte));
> +			} else {
> +				pt = page_alloc(&mem_pool, 1);
> +				if (!pt)
> +					return -ENOMEM;
> +
> +				paging->set_next_pt(pte, paging_hvirt2phys(pt));
> +				flush_pt_entry(pte, paging_flags);
> +			}
> +			paging++;
> +		}
> +		if (pg_structs == &hv_paging_structs)
> +			arch_paging_flush_page_tlbs(virt);
> +
> +		phys += paging->page_size;
> +		virt += paging->page_size;
> +		size -= paging->page_size;
> +	}
> +	return 0;
> +}
> +

Isn't paging_create(...) the same as
paging_create_colored(..., color_bitmask=full, identity_map=dont-care)? 
Same fore paging_destroy. This duplication of highly sensitive code must 
be avoided.

> +/**
> + * Destroy a colored page map.
> + * @param pg_structs	Descriptor of paging structures to be used.
> + * @param virt		Virtual address the region to be unmapped.
> + * @param size		Size of the region.
> + * @param paging_flags	Flags describing the paging mode, see @ref PAGING_FLAGS.
> + * @param color_bitmask	Bitmask specifying value of coloring.
> + *
> + * @return 0 on success, negative error code otherwise.
> + *
> + * @see paging_create_colored
> + */
> +int paging_destroy_colored(const struct paging_structures *pg_structs,
> +			   unsigned long virt, unsigned long size,
> +			   unsigned long paging_flags,
> +			   unsigned long *color_bitmask)
> +{
> +	size = PAGE_ALIGN(size);
> +
> +	while (size > 0) {
> +		const struct paging *paging = pg_structs->root_paging;
> +		page_table_t pt[MAX_PAGE_TABLE_LEVELS];
> +		unsigned long page_size;
> +		pt_entry_t pte;
> +		int n = 0;
> +		int err;
> +
> +		virt = next_colored(virt, color_bitmask);
> +
> +		/* walk down the page table, saving intermediate tables */
> +		pt[0] = pg_structs->root_table;
> +		while (1) {
> +			pte = paging->get_entry(pt[n], virt);
> +			if (!paging->entry_valid(pte, PAGE_PRESENT_FLAGS))
> +				break;
> +			if (paging->get_phys(pte, virt) != INVALID_PHYS_ADDR) {
> +				if (paging->page_size == PAGE_SIZE)
> +					break;
> +
> +				err = split_hugepage(pg_structs->hv_paging,
> +						     paging, pte, virt,
> +						     paging_flags);
> +				if (err)
> +					return err;
> +			}
> +			pt[++n] = paging_phys2hvirt(paging->get_next_pt(pte));
> +			paging++;
> +		}
> +		/* advance by page size of current level paging */
> +		page_size = paging->page_size ? paging->page_size : PAGE_SIZE;
> +
> +		/* walk up again, clearing entries, releasing empty tables */
> +		while (1) {
> +			paging->clear_entry(pte);
> +			flush_pt_entry(pte, paging_flags);
> +			if (n == 0 || !paging->page_table_empty(pt[n]))
> +				break;
> +			page_free(&mem_pool, pt[n], 1);
> +			paging--;
> +			pte = paging->get_entry(pt[--n], virt);
> +		}
> +		if (pg_structs == &hv_paging_structs)
> +			arch_paging_flush_page_tlbs(virt);
> +
> +		if (page_size > size)
> +			break;
> +		virt += page_size;
> +		size -= page_size;
> +	}
> +	return 0;
> +}
> +
>   static unsigned long
>   paging_gvirt2gphys(const struct guest_paging_structures *pg_structs,
>   		   unsigned long gvirt, unsigned long tmp_page,
> @@ -702,6 +852,11 @@ int paging_init(void)
>   			return err;
>   	}
>   
> +	/* Setup coloring */
> +	if (coloring_paging_init(system_config->platform_info.llc_way_size)) {

Fold the setup in here, it doesn't look arch-specific to me. Some of its 
parameters may be, but that can be handled via arch includes.

> +		printk("Error: Unable to init cache coloring data\n");
> +		return -ENOMEM;
> +	}
>   	return 0;
>   }
>   
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d492ee67-ee26-3533-5ca6-7c9e3e783abf%40siemens.com.
