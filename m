Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZ6AYH2QKGQERXGWEDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BB31C460B
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 May 2020 20:35:19 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id z5sf358579wrt.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 May 2020 11:35:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588617319; cv=pass;
        d=google.com; s=arc-20160816;
        b=puwNywPRJdbUJdM6dSxFNpKhxU+6fLbGDkoYcZ8mStJ4QgySY8YsW7Ml7NDOps88F0
         PjfRFeM9EtQDlESpcUFg33QZrdJmngs3LdJ/ORokI6ojm3v9VpXJmuMcsv6nqZKHqrlZ
         VaOydwRd2/AxlpmPKrGJK9UE1wMoZcnyse4sT/5upKvWYj3pWjp607WY5YnhVyn+HOQx
         xuV2hbb8/XXgAEpUUUeLJ0CNWmILkE+qCDGhiFjH26lLXp/j3SPgzEaEE1diaxkwO8C3
         Vb20ckmirW4NxybU4Bv7/BU9uhmFuxHvVb054sJcpOFGG2AzuA8QNYVaj2bpGxrcq2h2
         zW3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=QT6uLVk617Rexx6yHvUGLEOB74ZWMUdqrJvqaMpNSfA=;
        b=Jz/fKai7EIkl2qS/ixW7szq0pAB4SmnQ0LoHtrpHDne/B2w6fLYNz6CczMXGsJey8g
         o1u9NMWAX/uvRczhO76ek0wc45GIYFuIRhdYRd3SKiDVrrL9ZOpAQFBcmYNGEJgkH+gD
         xDiSxhotdIEmKvUiRomRItyw4WR0uL2mhNjM7uBHoatZ1vYm7OScIrRP4hxGMJib8s1u
         e2Xrei/QkO24ps4g+SHnmQAZ/HeX01CXA/b2ZPZ/Iq3FDzbdYSUBFvGTcYRWUfrTqAo+
         oOVDjikNTf2YohV1JnmkdPQH1uvv8GrRR0tcqx3fYZRbPkICe/zcDNitncy7WVdevULu
         ZXLw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QT6uLVk617Rexx6yHvUGLEOB74ZWMUdqrJvqaMpNSfA=;
        b=PXbdF3xuMZL3zz92AEK76apwMcyV9s2nsGGnmJR29SB7A/61XVEIkxfll4fB4y2Ycp
         YRe7aGSFCrFI4nRMFGmwo1Q8L3H7P+dptT/Vdd1pK3kvze2RqUR6N33zdir/U1tQZJOZ
         frSuK533kN7ZsY8TT590wjWwRdghr86fv4cvN4Lf18NEY/WvgGxVvktQyD3pFmM39E7i
         1pu/6LglphADGv86vRQZYk8wS9wjNP/9UEhAVZwOeCwDoEakyR3I1z85JHOgpDyIIeCq
         eOIETfnYvgIad/wkrCiWG50yPGKvrGP7HYX4EW8DHpce0WoZyNeY09zGjxzZAZe7Velk
         rATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QT6uLVk617Rexx6yHvUGLEOB74ZWMUdqrJvqaMpNSfA=;
        b=eiHAQmDOLQEDovU96fSmx4hPzQtRiTfGpAAgENL3Z1nZsUjh8iE87ypMoZjlIjDE91
         K7W6dlmVwgBcoAJqCu8c7sNlTVBj49z8WOG2ge6+f295iJLifOqU/A+mRHY28Us48NCZ
         aidzDYJJZL39ETKQJOdQRRtcqfh/Bib1gfl64V2Sw45rGhnQKPni9mNgnXRgP49EzFp2
         AgkdjsZyIUohRHdElfjBKUez/16LNZfGWanF0lod7mpPX8ReuHxZapYWZKkRT3gC2Lse
         onFdMxNAyIUj4Zv4xcMLcitAX2zfc11vFl6G/tg10eKo4VeIPHTdDdl5llhWvHHpT+DK
         lD7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZjE4GQjVXPL61x5CBMlzZqKlZbr561CiTynbO41lW/f7GyeeNi
	d93NhfiUB38RWzQqAlp25hU=
X-Google-Smtp-Source: APiQypLdv8SGetoIxMy0N8OsM70EAEIeOk3N0KIlxn9g90gIz9wudnONMVLNUKsg450zJZNWBpRPgQ==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr15409952wmc.62.1588617319279;
        Mon, 04 May 2020 11:35:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4411:: with SMTP id z17ls23826627wrq.11.gmail; Mon, 04
 May 2020 11:35:18 -0700 (PDT)
X-Received: by 2002:adf:ab57:: with SMTP id r23mr762890wrc.180.1588617318440;
        Mon, 04 May 2020 11:35:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588617318; cv=none;
        d=google.com; s=arc-20160816;
        b=Xoyl8Kq7Var1Tw4abu1l9V+M9AhaD7fZXfZ6IOYo+5RilHz3xVVRyDlsBLqpvZnDNh
         /AFd+8kDnQUaVVkCPjq6Og8mhX1QL+OdA304tl0HwcNYnU2SPEiaTNmPXXCUujyyD+ap
         jiSKCzk1QPhQ3yAxgi311ixO02YQbq+y/33dv9sbnpNGTyiK/Er9bWsFfzEV+jOwhdZM
         0FjRJbUxpJgVd/7Sg2bNBiPjiv0wBFGP+2NL6r/XUuGOxDw0GqSMNsgMNLmUxnVutuiT
         uTzkxHlh3k/F8kKUQ4deLOtNxJT+TymhOGgJXsDeU0+nXGjhDuQ0JLsAaSH8nldW7nO1
         dABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Fk90fIjXwvXJXVuxDuZwBGxhSF8R8hE+Izle49H4aE0=;
        b=YojYKYB1e/5xvig9HQmzD3XzhAAtR+c9WP4hA4Ql3RZjoNp6+HEI5AxHDy6Gae1XaZ
         LfpOkoLSH8+IFS0BHN1IN7jBMqGqkfHA9xJYfWw89cYyHXefJhHNgsSi5ycACK8y6gQL
         zpE9Yp6ISOCvQeEn9Ha5yD4yMJAWrVMrymrWhB8rEsX/9XMPm1xUwSeuobvCCtflDtb6
         ZfndLYzYQOdzRPObo+5YyEScRgdKhxf33VmS27ig3lubGizaMrQ7lhFOt0JrW3h7Yifd
         Yps+ReZO4ZkzmbCH0pYZ8SDjFmBeAGXs/mwT70LR6HV4FXby8eSQqEekCOUUK5+R+SU/
         ahcw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id d10si578102wru.0.2020.05.04.11.35.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 11:35:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 044IZH4C022592
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 May 2020 20:35:17 +0200
Received: from [167.87.53.26] ([167.87.53.26])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 044IZGWj019101;
	Mon, 4 May 2020 20:35:17 +0200
Subject: Re: [PATCH v2 7/9] hypervisor, arm64: add cache coloring support
To: Marco Solieri <ms@xt3.it>, jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>,
        Angelo Ruocco <angelo.ruocco.90@gmail.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-8-ms@xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <08e4aad0-314e-cfee-c4d8-be313903d8b4@siemens.com>
Date: Mon, 4 May 2020 20:35:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421100351.292395-8-ms@xt3.it>
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
> Implement all the functions needed by the coloring interface for the
> arm64 architecture.
> Coloring selection is retrieved by the jailhouse_cache structure(s) in
> cell's configuration. Each structure defines a color range that will be
> mapped to the corresponding color bitmask. The configuration is
> cell-wide and will be used with all the memory regions flagged with
> JAILHOUSE_MEM_COLORED.
> If no color selection is provided by the user and coloring is enabled,
> use all the available colors on the platform.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <ms@xt3.it>
> Acked-by: Angelo Ruocco <angelo.ruocco.90@gmail.com>
> ---
>   hypervisor/arch/arm64/Kbuild     |   1 +
>   hypervisor/arch/arm64/coloring.c | 232 +++++++++++++++++++++++++++++++
>   2 files changed, 233 insertions(+)
>   create mode 100644 hypervisor/arch/arm64/coloring.c
> 
> diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
> index c34b0f32..6c566e4d 100644
> --- a/hypervisor/arch/arm64/Kbuild
> +++ b/hypervisor/arch/arm64/Kbuild
> @@ -22,3 +22,4 @@ always := lib.a
>   lib-y := $(common-objs-y)
>   lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
>   lib-y += iommu.o smmu-v3.o ti-pvu.o
> +lib-$(CONFIG_COLORING) += coloring.o
> diff --git a/hypervisor/arch/arm64/coloring.c b/hypervisor/arch/arm64/coloring.c
> new file mode 100644
> index 00000000..cb2d80e9
> --- /dev/null
> +++ b/hypervisor/arch/arm64/coloring.c
> @@ -0,0 +1,232 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) Universita' di Modena e Reggio Emilia, 2020
> + *
> + * Authors:
> + *  Luca Miccio <lucmiccio@gmail.com>
> + *  Marco Solieri <ms@xt3.it>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +#include <jailhouse/coloring.h>
> +#include <jailhouse/printk.h>
> +#include <jailhouse/entry.h>
> +#include <jailhouse/cell.h>
> +#include <jailhouse/control.h>
> +
> +#define for_each_cache_region(cache, config, counter)			\
> +	for ((cache) = jailhouse_cell_cache_regions(config), (counter) = 0;\
> +	     (counter) < (config)->num_cache_regions;			\
> +	     (cache)++, (counter)++)

Should be factored out and made generally available. I'm carrying 
something similar for Intel CAT (not published yet, so you couldn't know).

> +
> +/** Default color bitmask uses all available colors */
> +unsigned long color_bitmask_default[COLOR_BITMASK_SIZE];
> +
> +/** Do care bits for coloring */
> +unsigned long addr_col_mask;
> +
> +/** Max number of colors available on the platform */
> +#define COLORING_MAX_NUM ((addr_col_mask >> PAGE_SHIFT) + 1)
> +
> +#define MSB_LONG_IDX(word) (word ? (BITS_PER_LONG - clz(word) - 1) : 0)

Add blank line.

> +static inline unsigned long msb_color_bitmask(unsigned long *color_bitmask)

No need for inline.

> +{
> +	unsigned long ret = 0;u
> +	unsigned int layer = COLOR_BITMASK_SIZE - 1;
> +
> +	if (!color_bitmask)
> +		return 0;
> +
> +	while (!ret) {
> +		ret = MSB_LONG_IDX(color_bitmask[layer]);
> +		layer--;
> +	}
> +
> +	return ret;
> +}
> +
> +#define CTR_LINESIZE_MASK	0x7
> +#define CTR_SIZE_SHIFT		13
> +#define CTR_SIZE_MASK		0x3FFF
> +#define CTR_SELECT_L2		(1 << 1)
> +#define CTR_SELECT_L3		(1 << 2)
> +#define CTR_CTYPEn_MASK		0x7
> +#define CTR_CTYPE2_SHIFT	3
> +#define CTR_LLC_ON		(1 << 2)
> +#define CTR_LOC_SHIFT		24
> +#define CTR_LOC_MASK		0x7
> +#define CTR_LOC_NOT_IMPLEMENTED	(1 << 0)
> +
> +unsigned long get_llc_way_size(void)
> +{
> +	unsigned int cache_sel;
> +	unsigned int cache_global_info;
> +	unsigned int cache_info;
> +	unsigned int cache_line_size;
> +	unsigned int cache_set_num;
> +	unsigned int cache_sel_tmp;
> +
> +	arm_read_sysreg(CLIDR_EL1, cache_global_info);
> +
> +	/* Check if at least L2 is implemented */
> +	if (((cache_global_info >> CTR_LOC_SHIFT) & CTR_LOC_MASK)
> +		== CTR_LOC_NOT_IMPLEMENTED) {
> +		printk("ERROR: L2 Cache not implemented\n");
> +		return trace_error(-ENODEV);
> +	}
> +
> +	/* Save old value of CSSELR_EL1 */
> +	arm_read_sysreg(CSSELR_EL1, cache_sel_tmp);
> +
> +	/* Get LLC index */
> +	if (((cache_global_info >> CTR_CTYPE2_SHIFT) & CTR_CTYPEn_MASK)
> +		== CTR_LLC_ON)
> +		cache_sel = CTR_SELECT_L2;
> +	else
> +		cache_sel = CTR_SELECT_L3;
> +
> +	/* Select the correct LLC in CSSELR_EL1 */
> +	arm_write_sysreg(CSSELR_EL1, cache_sel);
> +
> +	/* Ensure write */
> +	isb();
> +
> +	/* Get info about the LLC */
> +	arm_read_sysreg(CCSIDR_EL1, cache_info);
> +
> +	/* ARM TRM: (Log2(Number of bytes in cache line)) - 4. */
> +	cache_line_size = 1 << ((cache_info & CTR_LINESIZE_MASK) + 4);
> +	/* ARM TRM: (Number of sets in cache) - 1 */
> +	cache_set_num = ((cache_info >> CTR_SIZE_SHIFT) & CTR_SIZE_MASK) + 1;
> +
> +	/* Restore value in CSSELR_EL1 */
> +	arm_write_sysreg(CSSELR_EL1, cache_sel_tmp);
> +
> +	/* Ensure write */
> +	isb();
> +
> +	return (cache_line_size * cache_set_num);
> +}

I see the convenience of this function, I dislike the code size growth.

Is there a way for a Linux root user, via some sysfs or proc values to 
find out the required values that - as I assume - are unaccessible from 
userspace via the registers? That would eventually allow to fill 
llc_way_size when calling "jailhouse config create" on a non-x86 target.

> +
> +int coloring_paging_init(unsigned int llc_way_size)
> +{
> +	unsigned int i;
> +
> +	if (!llc_way_size) {
> +		llc_way_size = get_llc_way_size();
> +		if (!llc_way_size)
> +			return -ENODEV;
> +	}
> +
> +	/**
> +	 * Setup addr_col_mask
> +	 * This mask represents the bits in the address that can be used
> +	 * for defining available colors
> +	 */
> +	for (i = PAGE_SHIFT; i < MSB_LONG_IDX(llc_way_size); i++)
> +		set_bit(i, &addr_col_mask);
> +
> +	if (COLORING_MAX_NUM > MAX_COLOR_SUPPORTED)
> +		return -ENOMEM;
> +
> +	/* Setup default color bitmask */
> +	for (i = 0; i < COLORING_MAX_NUM; i++)
> +		set_bit(i, color_bitmask_default);
> +
> +	printk("Coloring information:\n");
> +	printk("LLC way size: %uKiB\n", llc_way_size >> 10);
> +	printk("Address color mask: 0x%lx\n", addr_col_mask);
> +	printk("Max number of avail. colors: %ld\n", COLORING_MAX_NUM);

How much of that information is code debugging, how much is valuable 
when configuring and operating a system?

> +	return 0;
> +}
> +
> +int coloring_cell_init(struct cell *cell)
> +{
> +	const struct jailhouse_cache *cache;
> +	int counter = 0;
> +	int i;
> +
> +	memset(cell->arch.color_bitmask, 0,
> +		sizeof(unsigned long) * COLOR_BITMASK_SIZE);
> +
> +	/* Root cell is currently not supported */
> +	if (cell == &root_cell)
> +		return 0;
> +
> +	for_each_cache_region(cache, cell->config, counter) {
> +		if ((cache->start + cache->size) > COLORING_MAX_NUM ||
> +			!cache->size) {
> +			printk("Wrong color config. Max value is %ld\n",
> +				COLORING_MAX_NUM);
> +			return -ERANGE;
> +		}
> +
> +		for (i = cache->start; i < (cache->start + cache->size); i++)
> +			set_bit(i, cell->arch.color_bitmask);
> +	}
> +
> +	/* If no coloring configuration is provided, use all colors available */
> +	if (!counter)
> +		memcpy(cell->arch.color_bitmask, color_bitmask_default,
> +			sizeof(unsigned long) * COLOR_BITMASK_SIZE);
> +
> +	printk("Cell [%s] color config: 0x%lx%lx%lx%lx\n",
> +		cell->config->name,
> +		cell->arch.color_bitmask[3], cell->arch.color_bitmask[2],
> +		cell->arch.color_bitmask[1], cell->arch.color_bitmask[0]);
> +
> +	return 0;
> +}
> +
> +unsigned long next_colored(unsigned long phys, unsigned long *color_bitmask)
> +{
> +	unsigned int high_idx;
> +	unsigned int phys_col_id;
> +	unsigned long retval = phys;
> +
> +	if (!color_bitmask)
> +		return phys;
> +
> +	high_idx = MSB_LONG_IDX(addr_col_mask);
> +
> +	phys_col_id = (phys & addr_col_mask) >> PAGE_SHIFT;
> +	/**
> +	 * Loop over all possible colors starting from `phys_col_id` and find
> +	 * the next color id that belongs to `color_bitmask`.
> +	 */
> +	while (!test_bit(phys_col_id, color_bitmask)) {
> +		/**
> +		 * If we go out of bounds, restart from 0 and carry 1
> +		 * outside addr_col_mask MSB.
> +		 */
> +		if (phys_col_id > msb_color_bitmask(color_bitmask)) {
> +			phys_col_id = 0;
> +			retval += 1UL << (high_idx + 1);
> +		} else
> +			phys_col_id++;
> +	}
> +
> +	/* Reset old color configuration */
> +	retval &= ~(addr_col_mask);
> +	retval |= (phys_col_id << PAGE_SHIFT);
> +
> +	return retval;
> +}
> +
> +unsigned long get_end_addr(unsigned long start, unsigned long size,
> +	unsigned long *color_bitmask)
> +{
> +	unsigned color_num = 0;
> +
> +	/* Get number of colors from mask */
> +	for (int i = 0; i < MAX_COLOR_SUPPORTED; i++)
> +		if (test_bit(i, color_bitmask))
> +			color_num++;
> +
> +	/* Check if start address is compliant to color selection */
> +	start = next_colored(start, color_bitmask);
> +
> +	return start + PAGE_ALIGN((size*COLORING_MAX_NUM)/color_num);
> +}
> 

Maybe you can model coloring setup/teardown as a unit, just like CAT 
does. Avoids hooks, but it may require some stubbing as you use only few 
of the common callbacks. Just an idea.

In general, please rethink which parts really need to be specific to arm 
and keep only those here.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/08e4aad0-314e-cfee-c4d8-be313903d8b4%40siemens.com.
