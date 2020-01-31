Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB6GGZ7YQKGQEJVTYT2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x637.google.com (mail-pl1-x637.google.com [IPv6:2607:f8b0:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 7958514E97F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 31 Jan 2020 09:21:14 +0100 (CET)
Received: by mail-pl1-x637.google.com with SMTP id h8sf3326240plr.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 31 Jan 2020 00:21:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580458873; cv=pass;
        d=google.com; s=arc-20160816;
        b=0saWnGVHG8ete3elXrZLKxDXR6QUzKcJgwE8dUGfaT3SWAjdLNLM6hwnAA74N5WNMK
         1X3mJWgEuE+hcdCYiDQpiDk2nZG/3dQfk4icXxFn52RKUkd9eSadDCFloUoWGjjWGIOR
         fUXdX+cH7PpxgHkL6byk6QZ6lxTBaUywMNkYru2Bsmgrw1TG5irTo3T9jclJauSx86D7
         rNV8871aoPhJ78uoHDTe0vyGKZ9u8UrkPLRtZSZdxz1y2ybR28Q//JlZ4hf1Q1VZRckp
         eTG79aImW/XbBuRc19e8A++WHuithSk9ziQeOm+7tutZaBeWSIdCSLyYJI+2y/Au31AM
         o6dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=ay4j/ZUkuJSoLwQu8w4bpYS0s0MzsTAJLPJ9RDmx1Ko=;
        b=uFdsBUReq6YruUf3EQqx2ac7Yw7r+KjMInIgkCtEWynNhNosxFQnDgQqwecd9jfjIV
         bN3ODnxqdOD97gxoRZLQPfnhppxLRMtuxLibqy4TCLSaSScacy5U4XFjmQfPcJLAgxZR
         4BYvMJGi+HmzwPZtPw1QAhWccn9KRhtaYJWStgxvkJhN88BuAfoWjkd2ws8TypAxb5+A
         Ir+H0HC6sykZW8vmLfI9GqrEuXgJZo2vU5Wgu2pEu9PRL11cThnVRtgQ+6KEcS5eqXKV
         lLqV7DpYXfJsjaHq2+WUl5kYUbRhzFhLuoCSd7bA60qT3pM05secL9uVjgvoPVVO91Oa
         qALA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=afyKU5Y5;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=ay4j/ZUkuJSoLwQu8w4bpYS0s0MzsTAJLPJ9RDmx1Ko=;
        b=KKpQaAHhCLcGUkGoUQFJIpfeWxi69oamSHNaYbJ+dOh4NAZWj+q3G4Q9vRCEe0Jjwc
         fk7h2WL8dGEUQ/w/lOy467EBpntSXUXwzzvSnAVswvKHf1HCqRuivEA2SqNBXZDCoUY5
         +S+Luxs70TtAWHShtTQcMlQEFfb61RWE23QpObqW8qiHi1FgzQyc0ClEuUXrriFxXKUu
         eqgIFu3yIA01n31IOc8F8g6c4ISZT+gKXXCdyJ3twYWbNxTsg2MmdgbhiWx455lU2AkJ
         NBfnvBzeclL5gMEGKcehMc77eMGog91NyZ2ZLtu6PUV4JZjUKaMfp2rhKvAO1/685Tb5
         veHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ay4j/ZUkuJSoLwQu8w4bpYS0s0MzsTAJLPJ9RDmx1Ko=;
        b=nWOcy98pboWEqDzbp/wbnyN1+IngRy+mlKpfUQTY6rn0amMZAOxxvlWT06H2dxNJdS
         q6bfmD66eFjZdcrKvBSceA/ANHJMMrOkhodmocXxIPIemDv2DSrcwSqDCtZp8sZHUAO0
         ZEMN94SxuloTAi4ZFNPLLqFy+bfahBtVNl38tDW+qaeo+G5Z4qj85Jl3w520Bo7h53kr
         LOEinC5oEAZ1pZ1mAHUpaDweYLSVgrsmms9QhUUldC4Px0p4hjhnUh+cZBmqpfC8nC/M
         hqY0Xh1/aFyNOkE4cqaoJfE6XsiD1xgR7LcTWjCMuQCTyQH+nuqJt2448cWJtWMULK2i
         ZRbg==
X-Gm-Message-State: APjAAAUq85f3ZnEQeC96mDxokcQ8MPPxNALwPEqIr+BEsrsALVFMINO6
	LwBsZ0mWJqlmgE77dcOdX4Y=
X-Google-Smtp-Source: APXvYqz4OLHkR65TAUnI0zO2+kLzPoEnLMEewH3SW+59oRFNn7YECdi/bi/H3QNFwK6ON9hKPTtogQ==
X-Received: by 2002:a17:90a:e996:: with SMTP id v22mr11201567pjy.53.1580458873140;
        Fri, 31 Jan 2020 00:21:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:874e:: with SMTP id g14ls250227pfo.9.gmail; Fri, 31 Jan
 2020 00:21:12 -0800 (PST)
X-Received: by 2002:aa7:9145:: with SMTP id 5mr9487712pfi.74.1580458872487;
        Fri, 31 Jan 2020 00:21:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580458872; cv=none;
        d=google.com; s=arc-20160816;
        b=BaQsmbRkIeX7DWyJBzhune/MWDbtIOonQFGgt4DZ1hea9sFhGGXVvuW8cBn+F7Oc1E
         Pwdg6/SzVX5rvug5zBK+6uBTyerkurmO3oUhFo/IvsEeJqrHqH4ql+GpVbdrVSn54XkE
         wBWvBoz1R2SmdN2KrsVNWvSeuEFh66ZlBaA2LQRuazrtkyu8BePqhGzlbcd2K+6QC/fh
         HW2Hrw7IoHhAmeOACOsqKo7F2Wve+ON4pH9RwHRCfLMsDIf+1NhRykLWGPO2M5iONGP4
         V/WfhALkCdFdT7UQQ96k/bVsfSBpZ8jRLYyDaI6C6L5DjK9S4ICBbkrMtk5LgOfxxvIv
         WCWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=EjW+qeAZr7Tcbzb2e+t0IXWVsz0QUXaDg5egijZjf4c=;
        b=gIMmVsZ/iO+ethpYYMvjncnKykkpgpJquDHrPy/ZNn00Y6Lyx1WpGjAcV97gSHFmy+
         +4GQ3TKqYGzeD3Ju46/xf5JlQWARNaItP5GsgLAzqQA1k8yIANJLXRgQX9gez0/JkwxC
         MBF/h+Zdlwcqg54i2Ta2otN0NxUbBwy1NoG5xZeX4LBlOzsJ9RFzoydL2/cHqMhPmSZv
         RWn6e/4IIB+uc4nGTpY3sKZxK1VH8mNJRL8QOhOq5ONtMKEl6TjOClO8dTqdWPYh/j5N
         dHHn6D9wR2zNzwQ0yfYlno/2TND4ufAVC/nMXWiiJU2larDLrX0N3nGbXJrv83m6EwhU
         5tiA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=afyKU5Y5;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id j123si290399pfd.5.2020.01.31.00.21.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jan 2020 00:21:12 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00V8L8AE075262;
	Fri, 31 Jan 2020 02:21:08 -0600
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00V8L8A5020435;
	Fri, 31 Jan 2020 02:21:08 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 02:21:08 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 02:21:08 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00V8L6i7089703;
	Fri, 31 Jan 2020 02:21:07 -0600
Subject: Re: [RFC PATCH v1 3/4] core: Implement regmap unit for partitioning
 registers
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, <chase.conklin@arm.com>
References: <20200127135611.21302-1-nikhil.nd@ti.com>
 <20200127135611.21302-4-nikhil.nd@ti.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <8676e5d1-c804-f101-ebe4-0530ee47148c@ti.com>
Date: Fri, 31 Jan 2020 13:49:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200127135611.21302-4-nikhil.nd@ti.com>
Content-Type: multipart/alternative;
	boundary="------------2BAEA8BF74DE19F8D4389626"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=afyKU5Y5;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

--------------2BAEA8BF74DE19F8D4389626
Content-Type: text/plain; charset="UTF-8"; format=flowed



On 27/01/20 7:26 pm, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>
> Implement regmap as a unit, Use reg_map_data as book keeping
> data structure per cell.
>
> Register a MMIO handler for each regmap region and handle the
> mmio access based on the regmap described in the config.
>
> Implement the regmap_modify_root to map and unmap the regmap
> access from the root cell while creating inmate cells.
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>   hypervisor/Makefile                   |   2 +-
>   hypervisor/include/jailhouse/cell.h   |   2 +
>   hypervisor/include/jailhouse/regmap.h |  47 +++++
>   hypervisor/regmap.c                   | 258 ++++++++++++++++++++++++++
>   4 files changed, 308 insertions(+), 1 deletion(-)
>   create mode 100644 hypervisor/include/jailhouse/regmap.h
>   create mode 100644 hypervisor/regmap.c
>
> diff --git a/hypervisor/Makefile b/hypervisor/Makefile
> index 893ead42..62c86a4b 100644
> --- a/hypervisor/Makefile
> +++ b/hypervisor/Makefile
> @@ -36,7 +36,7 @@ ifneq ($(wildcard $(INC_CONFIG_H)),)
>   KBUILD_CFLAGS += -include $(INC_CONFIG_H)
>   endif
>   
> -CORE_OBJECTS = setup.o printk.o paging.o control.o lib.o mmio.o pci.o ivshmem.o
> +CORE_OBJECTS = setup.o printk.o paging.o control.o lib.o mmio.o pci.o ivshmem.o regmap.o
>   CORE_OBJECTS += uart.o uart-8250.o
>   
>   ifdef CONFIG_JAILHOUSE_GCOV
> diff --git a/hypervisor/include/jailhouse/cell.h b/hypervisor/include/jailhouse/cell.h
> index c804a5df..90575bb9 100644
> --- a/hypervisor/include/jailhouse/cell.h
> +++ b/hypervisor/include/jailhouse/cell.h
> @@ -69,6 +69,8 @@ struct cell {
>   	unsigned int num_mmio_regions;
>   	/** Maximum number of MMIO regions. */
>   	unsigned int max_mmio_regions;
> +	/** List of register maps assigned to this cell. */
> +	struct reg_map_data *regmap;
>   };
>   
>   extern struct cell root_cell;
> diff --git a/hypervisor/include/jailhouse/regmap.h b/hypervisor/include/jailhouse/regmap.h
> new file mode 100644
> index 00000000..98faf2c8
> --- /dev/null
> +++ b/hypervisor/include/jailhouse/regmap.h
> @@ -0,0 +1,47 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com
> + *
> + * Authors:
> + *  Nikhil Devshatwar <nikhil.nd@ti.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#ifndef _JAILHOUSE_REGMAP_H
> +#define _JAILHOUSE_REGMAP_H
> +
> +#include <jailhouse/types.h>
> +#include <asm/mmio.h>
> +#include <jailhouse/cell-config.h>
> +
> +struct cell;
> +
> +/**
> + * @defgroup REGMAP Regmap subsystem
> + *
> + * This subsystem provides interpretation and handling of intercepted
> + * register accesses performed by cells.
> + *
> + * @{
> + */
> +
> +#define JAILHOUSE_REGMAP_WORDS		8
> +#define JAILHOUSE_REGMAP_BITS		(JAILHOUSE_REGMAP_WORDS * 32)
> +
> +/** Register map description */
> +struct reg_map_data {
> +	/** Reference to regmap defined in config */
> +	const struct jailhouse_regmap *info;
> +	/** Owning cell */
> +	struct cell *cell;
> +	/** virt address where this regmap is mapped */
> +	void *map_base;
> +	/** Ownership details for each register */
> +	u32 reg_bitmap[JAILHOUSE_REGMAP_WORDS];
> +};
> +
> +/** @} REGMAP */
> +#endif /* !_JAILHOUSE_REGMAP_H */
> diff --git a/hypervisor/regmap.c b/hypervisor/regmap.c
> new file mode 100644
> index 00000000..9f3d32dc
> --- /dev/null
> +++ b/hypervisor/regmap.c
> @@ -0,0 +1,258 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com
> + *
> + * Authors:
> + *  Nikhil Devshatwar <nikhil.nd@ti.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/cell.h>
> +#include <jailhouse/control.h>
> +#include <jailhouse/paging.h>
> +#include <jailhouse/printk.h>
> +#include <jailhouse/unit.h>
> +#include <jailhouse/percpu.h>
> +#include <jailhouse/regmap.h>
> +
> +static inline bool regmap_is_enabled(struct reg_map_data *regmap, int reg)
> +{
> +	u32 idx, mask;
> +
> +	idx = reg / 32;
> +	mask = 1 << (reg % 32);
> +
> +	return regmap->reg_bitmap[idx] & mask ? 1 : 0;
> +}
> +
> +static inline void regmap_enable(struct reg_map_data *regmap, int reg)
> +{
> +	u32 idx, mask;
> +
> +	idx = reg / 32;
> +	mask = 1 << (reg % 32);
> +
> +	regmap->reg_bitmap[idx] |= mask;
> +}
> +
> +static inline void regmap_disable(struct reg_map_data *regmap, int reg)
> +{
> +	u32 idx, mask;
> +
> +	idx = reg / 32;
> +	mask = 1 << (reg % 32);
> +
> +	regmap->reg_bitmap[idx] &= ~mask;
> +}
> +
> +/**
> + * Find the regmap which degines the ownership bitmap for
> + * the register address provided.
> + *
> + * @param cell		Cell in which to search.
> + * @param addr		Register address to match
> + * @param idx		Pointer to index, populated with index of register in
> + *			the matching regmap
> + *
> + * @return Valid reg_map_data or NULL when not found.
> + */
> +static struct reg_map_data *cell_get_regmap(struct cell *cell,
> +	unsigned long addr, unsigned int *idx)
> +{
> +	const struct jailhouse_regmap *info;
> +	struct reg_map_data *regmap;
> +	unsigned long start, end;
> +	u32 i;
> +
> +	for (i = 0; i < cell->config->num_regmaps; i++) {
> +		regmap = &cell->regmap[i];
> +		info = regmap->info;
> +		start = (unsigned long)info->reg_base;
> +		end = (unsigned long)start + info->reg_size * info->reg_count;
> +
> +		if (addr < start || addr >= end)
> +			continue;
> +
> +		*idx = (addr - info->reg_base) / info->reg_size;
> +		return regmap;
> +	}
> +	return NULL;
> +}
> +
> +/**
> + * Handle emulation of regmap access as per permission bitmap
> + * Check regmap access permissions and ownership
> + * Based on that, allow or forbid the MMIOs access to register
> + *
> + * @param arg		Private argument, reg_map_data.
> + * @param mmio		describes the mmio access which caused the fault
> + *
> + * @return		MMIO_HANDLED if the access is as per regmap description,
> + *			MMIO_ERROR if it violates some of the permissions,
> + */
> +static enum mmio_result regmap_handler(void *arg, struct mmio_access *mmio)
> +{
> +	struct reg_map_data *regmap = (struct reg_map_data *)arg;
> +	const struct jailhouse_regmap *info;
> +	unsigned int idx;
> +
> +	info = regmap->info;
> +	idx = mmio->address / info->reg_size;
> +
> +	if (mmio->is_write) {
> +		if ((info->flags & JAILHOUSE_MEM_WRITE) == 0)
> +			return MMIO_ERROR;
> +	} else {
> +		if ((info->flags & JAILHOUSE_MEM_READ) == 0)
> +			return MMIO_ERROR;
> +	}
> +
> +	if (regmap_is_enabled(regmap, idx)) {
> +		mmio_perform_access(regmap->map_base, mmio);
> +		return MMIO_HANDLED;
> +	}  else {
> +		printk("MMIO access disabled\n");
> +		return MMIO_ERROR;
> +	}
> +}
> +
> +/**
> + * Modify root_cell's bitmap to (un)mask the registers defined in inmate cell.
> + * Ignore if the root cell does not describe the regmap used by inmate
> + * Handles the case where root cell describes the registers using
> + * different address range
> + *
> + * @param cell		inmate cell handle.
> + * @param regmap	register (un)map to be removed from root_cell.
> + * @param map		true to map the regmap, false to unmap.
> + *
> + * @return 0 on successfully (un)mapping the regmap.
> + */
> +static int regmap_modify_root(struct cell *cell, struct reg_map_data *regmap,
> +		bool map)
> +{
> +	const struct jailhouse_regmap *info = regmap->info;
> +	struct reg_map_data *root_regmap = NULL;
> +	unsigned long long addr;
> +	u32 reg, idx;
> +
> +	if (cell == &root_cell)
> +		return 0;
> +	if (info->flags & JAILHOUSE_MEM_ROOTSHARED)
> +		return 0;
> +
> +	for (reg = 0; reg < info->reg_count; reg++) {
> +
> +		addr = info->reg_base + reg * info->reg_size;
> +		if (!root_regmap) {
> +			root_regmap = cell_get_regmap(&root_cell, addr, &idx);
> +			if (!root_regmap)
> +				continue;
> +		}
> +
> +		if (regmap_is_enabled(regmap, reg)) {
> +			if (map) {
> +				regmap_enable(root_regmap, idx);
> +
> +			/* For unmapping, ensure that its mapped in root cell regmap */
> +			} else if (regmap_is_enabled(root_regmap, idx)) {
> +
> +				regmap_disable(root_regmap, idx);
> +			} else {
> +				printk("ERROR: Root cell does not own bitmap for reg %llx\n",
> +						addr);
> +				return -EINVAL;
> +			}
> +		}
> +
> +		/* reuse the same root_regmap for next register if idx is within limit */
> +		idx++;
> +		if (idx >= root_regmap->info->reg_count)
> +			root_regmap = NULL;
> +	}
> +	return 0;
> +}
> +
> +static int regmap_cell_init(struct cell *cell)
> +{
> +	const struct jailhouse_regmap *info;
> +	struct reg_map_data *regmap;
> +	u32 i, num_pages, size;
> +	int ret;
> +
> +	if (cell->config->num_regmaps == 0)
> +		return 0;
> +
> +	num_pages = PAGES(cell->config->num_regmaps * sizeof(struct reg_map_data));
> +	cell->regmap = page_alloc(&mem_pool, num_pages);
> +	if (!cell->regmap)
> +		return -ENOMEM;
> +
> +	info = jailhouse_cell_regmaps(cell->config);
> +	for (i = 0; i < cell->config->num_regmaps; i++, info++) {
> +
> +		regmap = &cell->regmap[i];
> +		regmap->info = info;
> +		regmap->cell = cell;
> +		size = info->reg_size * info->reg_count;
> +
> +		if (info->reg_count > JAILHOUSE_REGMAP_BITS ||
> +		    (info->flags & (JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE)) == 0)
> +			goto invalid;
> +
> +		regmap->map_base = paging_map_device(info->reg_base, size);
> +		if (!regmap->map_base)
> +			return -ENOMEM;
> +
> +		memcpy(regmap->reg_bitmap, info->reg_bitmap,
> +			sizeof(regmap->reg_bitmap));
> +
> +		mmio_region_register(cell, info->reg_base, size,
> +			regmap_handler, regmap);
> +
> +		/* Unmap the memory so that handler can be triggered */
> +		ret = paging_destroy(&cell->arch.mm, info->reg_base, size,
> +				PAGING_COHERENT);

Jan/Chase,

I was doing some more testing / debug with this.
I root caused that the paging_destroy call does not take effect.

I have the fix (7cffb9b7d54d "core: fix hugepage splitting in 
paging_destroy") from the next branch
Do we have one more bug causing the paging_destroy to be ignored?

Regards,
Nikhil D
> +		if (ret)
> +			goto invalid;
> +
> +		ret = regmap_modify_root(cell, regmap, false);
> +		if (ret)
> +			goto invalid;
> +	}
> +
> +	return 0;
> +invalid:
> +	page_free(&mem_pool, cell->regmap, 1);
> +	return -EINVAL;
> +}
> +
> +static void regmap_cell_exit(struct cell *cell)
> +{
> +	struct reg_map_data *regmap;
> +	u32 i, num_pages;
> +
> +	for (i = 0; i < cell->config->num_regmaps; i++) {
> +		regmap = &cell->regmap[i];
> +		regmap_modify_root(cell, regmap, true);
> +	}
> +
> +	num_pages = PAGES(cell->config->num_regmaps);
> +	page_free(&mem_pool, cell->regmap, num_pages);
> +}
> +
> +static int regmap_init(void)
> +{
> +	return regmap_cell_init(&root_cell);
> +}
> +
> +static unsigned int regmap_mmio_count_regions(struct cell *cell)
> +{
> +	return cell->config->num_regmaps;
> +}
> +
> +DEFINE_UNIT_SHUTDOWN_STUB(regmap);
> +DEFINE_UNIT(regmap, "regmap");

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8676e5d1-c804-f101-ebe4-0530ee47148c%40ti.com.

--------------2BAEA8BF74DE19F8D4389626
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 27/01/20 7:26 pm, <a class=3D"moz-txt=
-link-abbreviated" href=3D"mailto:nikhil.nd@ti.com">nikhil.nd@ti.com</a>
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20200127135611.21302-4-nikhil.nd@ti.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Nikhil Devshatwar <a cla=
ss=3D"moz-txt-link-rfc2396E" href=3D"mailto:nikhil.nd@ti.com">&lt;nikhil.nd=
@ti.com&gt;</a>

Implement regmap as a unit, Use reg_map_data as book keeping
data structure per cell.

Register a MMIO handler for each regmap region and handle the
mmio access based on the regmap described in the config.

Implement the regmap_modify_root to map and unmap the regmap
access from the root cell while creating inmate cells.

Signed-off-by: Nikhil Devshatwar <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
---
 hypervisor/Makefile                   |   2 +-
 hypervisor/include/jailhouse/cell.h   |   2 +
 hypervisor/include/jailhouse/regmap.h |  47 +++++
 hypervisor/regmap.c                   | 258 ++++++++++++++++++++++++++
 4 files changed, 308 insertions(+), 1 deletion(-)
 create mode 100644 hypervisor/include/jailhouse/regmap.h
 create mode 100644 hypervisor/regmap.c

diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index 893ead42..62c86a4b 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -36,7 +36,7 @@ ifneq ($(wildcard $(INC_CONFIG_H)),)
 KBUILD_CFLAGS +=3D -include $(INC_CONFIG_H)
 endif
=20
-CORE_OBJECTS =3D setup.o printk.o paging.o control.o lib.o mmio.o pci.o iv=
shmem.o
+CORE_OBJECTS =3D setup.o printk.o paging.o control.o lib.o mmio.o pci.o iv=
shmem.o regmap.o
 CORE_OBJECTS +=3D uart.o uart-8250.o
=20
 ifdef CONFIG_JAILHOUSE_GCOV
diff --git a/hypervisor/include/jailhouse/cell.h b/hypervisor/include/jailh=
ouse/cell.h
index c804a5df..90575bb9 100644
--- a/hypervisor/include/jailhouse/cell.h
+++ b/hypervisor/include/jailhouse/cell.h
@@ -69,6 +69,8 @@ struct cell {
 	unsigned int num_mmio_regions;
 	/** Maximum number of MMIO regions. */
 	unsigned int max_mmio_regions;
+	/** List of register maps assigned to this cell. */
+	struct reg_map_data *regmap;
 };
=20
 extern struct cell root_cell;
diff --git a/hypervisor/include/jailhouse/regmap.h b/hypervisor/include/jai=
lhouse/regmap.h
new file mode 100644
index 00000000..98faf2c8
--- /dev/null
+++ b/hypervisor/include/jailhouse/regmap.h
@@ -0,0 +1,47 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) 2019 Texas Instruments Incorporated - <a class=3D"moz-txt=
-link-freetext" href=3D"http://www.ti.com">http://www.ti.com</a>
+ *
+ * Authors:
+ *  Nikhil Devshatwar <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ni=
khil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef _JAILHOUSE_REGMAP_H
+#define _JAILHOUSE_REGMAP_H
+
+#include &lt;jailhouse/types.h&gt;
+#include &lt;asm/mmio.h&gt;
+#include &lt;jailhouse/cell-config.h&gt;
+
+struct cell;
+
+/**
+ * @defgroup REGMAP Regmap subsystem
+ *
+ * This subsystem provides interpretation and handling of intercepted
+ * register accesses performed by cells.
+ *
+ * @{
+ */
+
+#define JAILHOUSE_REGMAP_WORDS		8
+#define JAILHOUSE_REGMAP_BITS		(JAILHOUSE_REGMAP_WORDS * 32)
+
+/** Register map description */
+struct reg_map_data {
+	/** Reference to regmap defined in config */
+	const struct jailhouse_regmap *info;
+	/** Owning cell */
+	struct cell *cell;
+	/** virt address where this regmap is mapped */
+	void *map_base;
+	/** Ownership details for each register */
+	u32 reg_bitmap[JAILHOUSE_REGMAP_WORDS];
+};
+
+/** @} REGMAP */
+#endif /* !_JAILHOUSE_REGMAP_H */
diff --git a/hypervisor/regmap.c b/hypervisor/regmap.c
new file mode 100644
index 00000000..9f3d32dc
--- /dev/null
+++ b/hypervisor/regmap.c
@@ -0,0 +1,258 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) 2019 Texas Instruments Incorporated - <a class=3D"moz-txt=
-link-freetext" href=3D"http://www.ti.com">http://www.ti.com</a>
+ *
+ * Authors:
+ *  Nikhil Devshatwar <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ni=
khil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include &lt;jailhouse/cell.h&gt;
+#include &lt;jailhouse/control.h&gt;
+#include &lt;jailhouse/paging.h&gt;
+#include &lt;jailhouse/printk.h&gt;
+#include &lt;jailhouse/unit.h&gt;
+#include &lt;jailhouse/percpu.h&gt;
+#include &lt;jailhouse/regmap.h&gt;
+
+static inline bool regmap_is_enabled(struct reg_map_data *regmap, int reg)
+{
+	u32 idx, mask;
+
+	idx =3D reg / 32;
+	mask =3D 1 &lt;&lt; (reg % 32);
+
+	return regmap-&gt;reg_bitmap[idx] &amp; mask ? 1 : 0;
+}
+
+static inline void regmap_enable(struct reg_map_data *regmap, int reg)
+{
+	u32 idx, mask;
+
+	idx =3D reg / 32;
+	mask =3D 1 &lt;&lt; (reg % 32);
+
+	regmap-&gt;reg_bitmap[idx] |=3D mask;
+}
+
+static inline void regmap_disable(struct reg_map_data *regmap, int reg)
+{
+	u32 idx, mask;
+
+	idx =3D reg / 32;
+	mask =3D 1 &lt;&lt; (reg % 32);
+
+	regmap-&gt;reg_bitmap[idx] &amp;=3D ~mask;
+}
+
+/**
+ * Find the regmap which degines the ownership bitmap for
+ * the register address provided.
+ *
+ * @param cell		Cell in which to search.
+ * @param addr		Register address to match
+ * @param idx		Pointer to index, populated with index of register in
+ *			the matching regmap
+ *
+ * @return Valid reg_map_data or NULL when not found.
+ */
+static struct reg_map_data *cell_get_regmap(struct cell *cell,
+	unsigned long addr, unsigned int *idx)
+{
+	const struct jailhouse_regmap *info;
+	struct reg_map_data *regmap;
+	unsigned long start, end;
+	u32 i;
+
+	for (i =3D 0; i &lt; cell-&gt;config-&gt;num_regmaps; i++) {
+		regmap =3D &amp;cell-&gt;regmap[i];
+		info =3D regmap-&gt;info;
+		start =3D (unsigned long)info-&gt;reg_base;
+		end =3D (unsigned long)start + info-&gt;reg_size * info-&gt;reg_count;
+
+		if (addr &lt; start || addr &gt;=3D end)
+			continue;
+
+		*idx =3D (addr - info-&gt;reg_base) / info-&gt;reg_size;
+		return regmap;
+	}
+	return NULL;
+}
+
+/**
+ * Handle emulation of regmap access as per permission bitmap
+ * Check regmap access permissions and ownership
+ * Based on that, allow or forbid the MMIOs access to register
+ *
+ * @param arg		Private argument, reg_map_data.
+ * @param mmio		describes the mmio access which caused the fault
+ *
+ * @return		MMIO_HANDLED if the access is as per regmap description,
+ *			MMIO_ERROR if it violates some of the permissions,
+ */
+static enum mmio_result regmap_handler(void *arg, struct mmio_access *mmio=
)
+{
+	struct reg_map_data *regmap =3D (struct reg_map_data *)arg;
+	const struct jailhouse_regmap *info;
+	unsigned int idx;
+
+	info =3D regmap-&gt;info;
+	idx =3D mmio-&gt;address / info-&gt;reg_size;
+
+	if (mmio-&gt;is_write) {
+		if ((info-&gt;flags &amp; JAILHOUSE_MEM_WRITE) =3D=3D 0)
+			return MMIO_ERROR;
+	} else {
+		if ((info-&gt;flags &amp; JAILHOUSE_MEM_READ) =3D=3D 0)
+			return MMIO_ERROR;
+	}
+
+	if (regmap_is_enabled(regmap, idx)) {
+		mmio_perform_access(regmap-&gt;map_base, mmio);
+		return MMIO_HANDLED;
+	}  else {
+		printk("MMIO access disabled\n");
+		return MMIO_ERROR;
+	}
+}
+
+/**
+ * Modify root_cell's bitmap to (un)mask the registers defined in inmate c=
ell.
+ * Ignore if the root cell does not describe the regmap used by inmate
+ * Handles the case where root cell describes the registers using
+ * different address range
+ *
+ * @param cell		inmate cell handle.
+ * @param regmap	register (un)map to be removed from root_cell.
+ * @param map		true to map the regmap, false to unmap.
+ *
+ * @return 0 on successfully (un)mapping the regmap.
+ */
+static int regmap_modify_root(struct cell *cell, struct reg_map_data *regm=
ap,
+		bool map)
+{
+	const struct jailhouse_regmap *info =3D regmap-&gt;info;
+	struct reg_map_data *root_regmap =3D NULL;
+	unsigned long long addr;
+	u32 reg, idx;
+
+	if (cell =3D=3D &amp;root_cell)
+		return 0;
+	if (info-&gt;flags &amp; JAILHOUSE_MEM_ROOTSHARED)
+		return 0;
+
+	for (reg =3D 0; reg &lt; info-&gt;reg_count; reg++) {
+
+		addr =3D info-&gt;reg_base + reg * info-&gt;reg_size;
+		if (!root_regmap) {
+			root_regmap =3D cell_get_regmap(&amp;root_cell, addr, &amp;idx);
+			if (!root_regmap)
+				continue;
+		}
+
+		if (regmap_is_enabled(regmap, reg)) {
+			if (map) {
+				regmap_enable(root_regmap, idx);
+
+			/* For unmapping, ensure that its mapped in root cell regmap */
+			} else if (regmap_is_enabled(root_regmap, idx)) {
+
+				regmap_disable(root_regmap, idx);
+			} else {
+				printk("ERROR: Root cell does not own bitmap for reg %llx\n",
+						addr);
+				return -EINVAL;
+			}
+		}
+
+		/* reuse the same root_regmap for next register if idx is within limit *=
/
+		idx++;
+		if (idx &gt;=3D root_regmap-&gt;info-&gt;reg_count)
+			root_regmap =3D NULL;
+	}
+	return 0;
+}
+
+static int regmap_cell_init(struct cell *cell)
+{
+	const struct jailhouse_regmap *info;
+	struct reg_map_data *regmap;
+	u32 i, num_pages, size;
+	int ret;
+
+	if (cell-&gt;config-&gt;num_regmaps =3D=3D 0)
+		return 0;
+
+	num_pages =3D PAGES(cell-&gt;config-&gt;num_regmaps * sizeof(struct reg_m=
ap_data));
+	cell-&gt;regmap =3D page_alloc(&amp;mem_pool, num_pages);
+	if (!cell-&gt;regmap)
+		return -ENOMEM;
+
+	info =3D jailhouse_cell_regmaps(cell-&gt;config);
+	for (i =3D 0; i &lt; cell-&gt;config-&gt;num_regmaps; i++, info++) {
+
+		regmap =3D &amp;cell-&gt;regmap[i];
+		regmap-&gt;info =3D info;
+		regmap-&gt;cell =3D cell;
+		size =3D info-&gt;reg_size * info-&gt;reg_count;
+
+		if (info-&gt;reg_count &gt; JAILHOUSE_REGMAP_BITS ||
+		    (info-&gt;flags &amp; (JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE)) =
=3D=3D 0)
+			goto invalid;
+
+		regmap-&gt;map_base =3D paging_map_device(info-&gt;reg_base, size);
+		if (!regmap-&gt;map_base)
+			return -ENOMEM;
+
+		memcpy(regmap-&gt;reg_bitmap, info-&gt;reg_bitmap,
+			sizeof(regmap-&gt;reg_bitmap));
+
+		mmio_region_register(cell, info-&gt;reg_base, size,
+			regmap_handler, regmap);
+
+		/* Unmap the memory so that handler can be triggered */
+		ret =3D paging_destroy(&amp;cell-&gt;arch.mm, info-&gt;reg_base, size,
+				PAGING_COHERENT);</pre>
    </blockquote>
    <br>
    Jan/Chase,<br>
    <br>
    I was doing some more testing / debug with this.<br>
    I root caused that the paging_destroy call does not take effect.<br>
    <br>
    I have the fix (7cffb9b7d54d "core: fix hugepage splitting in
    paging_destroy") from the next branch<br>
    Do we have one more bug causing the paging_destroy to be ignored?<br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <blockquote type=3D"cite"
      cite=3D"mid:20200127135611.21302-4-nikhil.nd@ti.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
+		if (ret)
+			goto invalid;
+
+		ret =3D regmap_modify_root(cell, regmap, false);
+		if (ret)
+			goto invalid;
+	}
+
+	return 0;
+invalid:
+	page_free(&amp;mem_pool, cell-&gt;regmap, 1);
+	return -EINVAL;
+}
+
+static void regmap_cell_exit(struct cell *cell)
+{
+	struct reg_map_data *regmap;
+	u32 i, num_pages;
+
+	for (i =3D 0; i &lt; cell-&gt;config-&gt;num_regmaps; i++) {
+		regmap =3D &amp;cell-&gt;regmap[i];
+		regmap_modify_root(cell, regmap, true);
+	}
+
+	num_pages =3D PAGES(cell-&gt;config-&gt;num_regmaps);
+	page_free(&amp;mem_pool, cell-&gt;regmap, num_pages);
+}
+
+static int regmap_init(void)
+{
+	return regmap_cell_init(&amp;root_cell);
+}
+
+static unsigned int regmap_mmio_count_regions(struct cell *cell)
+{
+	return cell-&gt;config-&gt;num_regmaps;
+}
+
+DEFINE_UNIT_SHUTDOWN_STUB(regmap);
+DEFINE_UNIT(regmap, "regmap");
</pre>
    </blockquote>
    <br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/8676e5d1-c804-f101-ebe4-0530ee47148c%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/8676e5d1-c804-f101-ebe4-0530ee47148c%40ti.com</a>.<br />

--------------2BAEA8BF74DE19F8D4389626--
