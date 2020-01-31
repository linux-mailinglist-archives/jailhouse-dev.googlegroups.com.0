Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBV65Z7YQKGQEQKB3SXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id F139514E9EE
	for <lists+jailhouse-dev@lfdr.de>; Fri, 31 Jan 2020 10:09:43 +0100 (CET)
Received: by mail-lf1-x137.google.com with SMTP id y4sf1236271lfg.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 31 Jan 2020 01:09:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580461783; cv=pass;
        d=google.com; s=arc-20160816;
        b=xVGwm+OfRKtHQ1K3DnzWn7yvWz3jDm2tu+IHCUJR1lrQbyiMFHpfW9isbnTivxRtCh
         4Xb+Wtkk3D+k80ZZN77uhasoXYG4WVNCFbteQHQV9aC4PhotkbYMnX9KUBsK73E85ps5
         dAGHhvL0Qb1FXPhX/dmcJVnu8tsirsTntMTVZ4tETI9agvRVn2oRCIkCWh0ccLpUb2jT
         TF9LSYLU8grOInF7DxZVcCD2N/QFj1qxsFiwe01MNDcJutjqzLnoTI+5yFvWT8eXmoZk
         yCBNIbZ1je59MhYOUJ1RKUpe49ZDZYWCjDZ7j8dX9/0HMe4iAzdDwWdR9eAnEep+qSLf
         Hhvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=/cjM3QqpuDsyLvq9ualCHRfYwMcLjVwfG7irIlJGzao=;
        b=gJj/w9lISwwKhtqnslyDGxB1d3q4S401XGJ4zy0OjnPGhAkKJljExNylPdpU9LgSq8
         xAUi05wNFXVpLW/Zn6D/AgUR/YKoutbSnT76FP0dNBs3XiO365GFL7dJ9+Y4lEnMHQma
         XL9i/YXaGvJseVkGRy6f1wgeqUposl34gNmdbeArTLSRfmNe3T7Zsm+vXESRpW+CZ7VI
         Qw/FmNKisfz7SFH22qYHOg85Y5KDWGHZgaLdWnc9YdzCsi/kZV20sIkrlMSKE95uIZip
         l9Oa43USeN7/oJWGyMqMLyLUKymZotopJ6lbESAzrbFabZflF2oGYqFZ2HC14f7A1gK6
         nzaA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/cjM3QqpuDsyLvq9ualCHRfYwMcLjVwfG7irIlJGzao=;
        b=fKDTbYfbvstLWcFLEv1KtNi7Qm4B+FJ9d+wG1mW/eivYa5hSP+UmN5+NC+wFsFHxPr
         FCywYH9uJ9VhaJb/PhVvn42h4CzXHFibfTzk2h2o9ss/eH7yuqryAj+WxLKT8TcQ2mHJ
         2iH/WxhIuQbMi+5gpvanrjAgqo0tpb8F+HoIiMDAAcBAlPAIpBBHcEZzP9MSzIgl49NB
         vA3qETojyCQG64xEd875ItVszzuNbk3qHwTOPWJcflp4LLpLA0OMaiX4vX23NAzJbOE4
         U9NFz2N1fvWJZSKX5/3xsmlwaUYpx3lUHCNTY8i+/soL5LgC2GH8K5SgotNaZxdnlxTa
         zQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/cjM3QqpuDsyLvq9ualCHRfYwMcLjVwfG7irIlJGzao=;
        b=RLlUIOVH6ZjUQpxE5jj9ZMSjG5/eb+OjGKa3Y1S/+1fhn1RkDq3wuAiZqvBnOjz9yT
         qALc/xhYHaayr3/QR7vFkJN/nxdyJ6XBtbHMc2s7NpHzOI2jlmkMvFNwiJOiD3PLRIFV
         eHQHC2J6MHFjVZ2WPPA9RX/AsU2Gx1UUDXqb1fv62OwVvGMgfLZWynNl7tQEnbEwJ+D0
         9h3OavANkIZafH+mR+XHpPgRgz0b/w3shk17h9SEA2ampwqBxH0y9qCBcZzhcxpwUpdz
         vWA3HwhK4T4XM/9vmz0t6C4fdpVrhZuAZaMD1+v5dYU78IxJCmLlgGTCoWxBKsUCXrIU
         FgBg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU5SscSd/AeMYzyPZyAg8pmEJIMjB3lzgfS89h9CR7b6WYbC6B/
	ZyKbhV4lm9IKOaHIV7DVolo=
X-Google-Smtp-Source: APXvYqxtAmFWmWUto19vgCD8bb4jGa/QmirgSMehzr2EP0eJbbCk+vpQ0FrIXwaH8BOhlVCcQpGZNQ==
X-Received: by 2002:a2e:9b90:: with SMTP id z16mr4390870lji.254.1580461783441;
        Fri, 31 Jan 2020 01:09:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b5d9:: with SMTP id g25ls1425177ljn.9.gmail; Fri, 31 Jan
 2020 01:09:42 -0800 (PST)
X-Received: by 2002:a2e:a404:: with SMTP id p4mr5487470ljn.234.1580461782547;
        Fri, 31 Jan 2020 01:09:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580461782; cv=none;
        d=google.com; s=arc-20160816;
        b=sgHGFgst1/e6DKUP+fNxc6Pp++rtjzNE8h0DFnalYbNIwIdM6MZ4xWoBQe1TffzQtB
         Dun4eelC3YczI1tWGQRUoAYI1+dl/pxqHDfLqdFyTAiraOgQnHUx6d7BI5ICh+ICW7fa
         4EvJMD/RGjR4gDIq0szj7+QBJ8Y/R3jM5tcD0lN2nvww43ThuJW7nvG+Q+DrzHkaM2Fa
         bk1Aqv/KhgHfCJ9Uq4wWeD1Spojh0vwKPAVzIsDoAvUZX+fdPS1hX7aEjKGLNCYW6rlX
         mEt7H695IsHofhMRgVdMylSiP7kgrEZRoF26RjeO88jeQwim9rUbzv8ZeuHbUcZaRZnx
         ZaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=/kb7GlcFep+ALLEgVSuRvHANsHAAPUkwh6nL9CvmyEs=;
        b=D0YbMl5jLpgTGfyd9rlgH9TdrEGcSGbjJDArg3xb5xdV3pCsdYwYkvJ3kpdUwZHXjl
         XjZsWFoG+XiyshEAOZ1PQBPYUSwnRCfJJ4/aAOP8rFGdH3jj7RYPuYuwczBtx2I9jKx6
         ZvRv/6WYD5i4AwlewMVOKPku5cyn0kUXqJ+FUXmxjc+6i3MDeNPthE3tO5JyVACtfuUR
         Yf0O0LZa4eriOBRsagy7qO/wh8yLp/vT5sQkwZ68OFY098OBJQjDtXkO/fZNZBZ3fIl4
         t+zHhBHo2lHUeDYHlYuUI25PSOrv8xsnqm1hGSQtg7qUR6axdKXhIo2XM+a7UR6W5Dri
         5hag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id o24si416130lji.4.2020.01.31.01.09.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jan 2020 01:09:42 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 00V99esi010394
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2020 10:09:40 +0100
Received: from [139.22.46.73] ([139.22.46.73])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00V99dYF006361;
	Fri, 31 Jan 2020 10:09:39 +0100
Subject: Re: [RFC PATCH v1 3/4] core: Implement regmap unit for partitioning
 registers
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: chase.conklin@arm.com
References: <20200127135611.21302-1-nikhil.nd@ti.com>
 <20200127135611.21302-4-nikhil.nd@ti.com>
 <8676e5d1-c804-f101-ebe4-0530ee47148c@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1254f0c6-913b-6164-bec1-8d8a552e46bd@siemens.com>
Date: Fri, 31 Jan 2020 10:09:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8676e5d1-c804-f101-ebe4-0530ee47148c@ti.com>
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

On 31.01.20 09:19, Nikhil Devshatwar wrote:
> 
> 
> On 27/01/20 7:26 pm, nikhil.nd@ti.com wrote:
>> From: Nikhil Devshatwar<nikhil.nd@ti.com>
>>
>> Implement regmap as a unit, Use reg_map_data as book keeping
>> data structure per cell.
>>
>> Register a MMIO handler for each regmap region and handle the
>> mmio access based on the regmap described in the config.
>>
>> Implement the regmap_modify_root to map and unmap the regmap
>> access from the root cell while creating inmate cells.
>>
>> Signed-off-by: Nikhil Devshatwar<nikhil.nd@ti.com>
>> ---
>>   hypervisor/Makefile                   |   2 +-
>>   hypervisor/include/jailhouse/cell.h   |   2 +
>>   hypervisor/include/jailhouse/regmap.h |  47 +++++
>>   hypervisor/regmap.c                   | 258 ++++++++++++++++++++++++++
>>   4 files changed, 308 insertions(+), 1 deletion(-)
>>   create mode 100644 hypervisor/include/jailhouse/regmap.h
>>   create mode 100644 hypervisor/regmap.c
>>
>> diff --git a/hypervisor/Makefile b/hypervisor/Makefile
>> index 893ead42..62c86a4b 100644
>> --- a/hypervisor/Makefile
>> +++ b/hypervisor/Makefile
>> @@ -36,7 +36,7 @@ ifneq ($(wildcard $(INC_CONFIG_H)),)
>>   KBUILD_CFLAGS += -include $(INC_CONFIG_H)
>>   endif
>>   
>> -CORE_OBJECTS = setup.o printk.o paging.o control.o lib.o mmio.o pci.o ivshmem.o
>> +CORE_OBJECTS = setup.o printk.o paging.o control.o lib.o mmio.o pci.o ivshmem.o regmap.o
>>   CORE_OBJECTS += uart.o uart-8250.o
>>   
>>   ifdef CONFIG_JAILHOUSE_GCOV
>> diff --git a/hypervisor/include/jailhouse/cell.h b/hypervisor/include/jailhouse/cell.h
>> index c804a5df..90575bb9 100644
>> --- a/hypervisor/include/jailhouse/cell.h
>> +++ b/hypervisor/include/jailhouse/cell.h
>> @@ -69,6 +69,8 @@ struct cell {
>>   	unsigned int num_mmio_regions;
>>   	/** Maximum number of MMIO regions. */
>>   	unsigned int max_mmio_regions;
>> +	/** List of register maps assigned to this cell. */
>> +	struct reg_map_data *regmap;
>>   };
>>   
>>   extern struct cell root_cell;
>> diff --git a/hypervisor/include/jailhouse/regmap.h b/hypervisor/include/jailhouse/regmap.h
>> new file mode 100644
>> index 00000000..98faf2c8
>> --- /dev/null
>> +++ b/hypervisor/include/jailhouse/regmap.h
>> @@ -0,0 +1,47 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright (c) 2019 Texas Instruments Incorporated -http://www.ti.com
>> + *
>> + * Authors:
>> + *  Nikhil Devshatwar<nikhil.nd@ti.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef _JAILHOUSE_REGMAP_H
>> +#define _JAILHOUSE_REGMAP_H
>> +
>> +#include <jailhouse/types.h>
>> +#include <asm/mmio.h>
>> +#include <jailhouse/cell-config.h>
>> +
>> +struct cell;
>> +
>> +/**
>> + * @defgroup REGMAP Regmap subsystem
>> + *
>> + * This subsystem provides interpretation and handling of intercepted
>> + * register accesses performed by cells.
>> + *
>> + * @{
>> + */
>> +
>> +#define JAILHOUSE_REGMAP_WORDS		8
>> +#define JAILHOUSE_REGMAP_BITS		(JAILHOUSE_REGMAP_WORDS * 32)
>> +
>> +/** Register map description */
>> +struct reg_map_data {
>> +	/** Reference to regmap defined in config */
>> +	const struct jailhouse_regmap *info;
>> +	/** Owning cell */
>> +	struct cell *cell;
>> +	/** virt address where this regmap is mapped */
>> +	void *map_base;
>> +	/** Ownership details for each register */
>> +	u32 reg_bitmap[JAILHOUSE_REGMAP_WORDS];
>> +};
>> +
>> +/** @} REGMAP */
>> +#endif /* !_JAILHOUSE_REGMAP_H */
>> diff --git a/hypervisor/regmap.c b/hypervisor/regmap.c
>> new file mode 100644
>> index 00000000..9f3d32dc
>> --- /dev/null
>> +++ b/hypervisor/regmap.c
>> @@ -0,0 +1,258 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright (c) 2019 Texas Instruments Incorporated -http://www.ti.com
>> + *
>> + * Authors:
>> + *  Nikhil Devshatwar<nikhil.nd@ti.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include <jailhouse/cell.h>
>> +#include <jailhouse/control.h>
>> +#include <jailhouse/paging.h>
>> +#include <jailhouse/printk.h>
>> +#include <jailhouse/unit.h>
>> +#include <jailhouse/percpu.h>
>> +#include <jailhouse/regmap.h>
>> +
>> +static inline bool regmap_is_enabled(struct reg_map_data *regmap, int reg)
>> +{
>> +	u32 idx, mask;
>> +
>> +	idx = reg / 32;
>> +	mask = 1 << (reg % 32);
>> +
>> +	return regmap->reg_bitmap[idx] & mask ? 1 : 0;
>> +}
>> +
>> +static inline void regmap_enable(struct reg_map_data *regmap, int reg)
>> +{
>> +	u32 idx, mask;
>> +
>> +	idx = reg / 32;
>> +	mask = 1 << (reg % 32);
>> +
>> +	regmap->reg_bitmap[idx] |= mask;
>> +}
>> +
>> +static inline void regmap_disable(struct reg_map_data *regmap, int reg)
>> +{
>> +	u32 idx, mask;
>> +
>> +	idx = reg / 32;
>> +	mask = 1 << (reg % 32);
>> +
>> +	regmap->reg_bitmap[idx] &= ~mask;
>> +}
>> +
>> +/**
>> + * Find the regmap which degines the ownership bitmap for
>> + * the register address provided.
>> + *
>> + * @param cell		Cell in which to search.
>> + * @param addr		Register address to match
>> + * @param idx		Pointer to index, populated with index of register in
>> + *			the matching regmap
>> + *
>> + * @return Valid reg_map_data or NULL when not found.
>> + */
>> +static struct reg_map_data *cell_get_regmap(struct cell *cell,
>> +	unsigned long addr, unsigned int *idx)
>> +{
>> +	const struct jailhouse_regmap *info;
>> +	struct reg_map_data *regmap;
>> +	unsigned long start, end;
>> +	u32 i;
>> +
>> +	for (i = 0; i < cell->config->num_regmaps; i++) {
>> +		regmap = &cell->regmap[i];
>> +		info = regmap->info;
>> +		start = (unsigned long)info->reg_base;
>> +		end = (unsigned long)start + info->reg_size * info->reg_count;
>> +
>> +		if (addr < start || addr >= end)
>> +			continue;
>> +
>> +		*idx = (addr - info->reg_base) / info->reg_size;
>> +		return regmap;
>> +	}
>> +	return NULL;
>> +}
>> +
>> +/**
>> + * Handle emulation of regmap access as per permission bitmap
>> + * Check regmap access permissions and ownership
>> + * Based on that, allow or forbid the MMIOs access to register
>> + *
>> + * @param arg		Private argument, reg_map_data.
>> + * @param mmio		describes the mmio access which caused the fault
>> + *
>> + * @return		MMIO_HANDLED if the access is as per regmap description,
>> + *			MMIO_ERROR if it violates some of the permissions,
>> + */
>> +static enum mmio_result regmap_handler(void *arg, struct mmio_access *mmio)
>> +{
>> +	struct reg_map_data *regmap = (struct reg_map_data *)arg;
>> +	const struct jailhouse_regmap *info;
>> +	unsigned int idx;
>> +
>> +	info = regmap->info;
>> +	idx = mmio->address / info->reg_size;
>> +
>> +	if (mmio->is_write) {
>> +		if ((info->flags & JAILHOUSE_MEM_WRITE) == 0)
>> +			return MMIO_ERROR;
>> +	} else {
>> +		if ((info->flags & JAILHOUSE_MEM_READ) == 0)
>> +			return MMIO_ERROR;
>> +	}
>> +
>> +	if (regmap_is_enabled(regmap, idx)) {
>> +		mmio_perform_access(regmap->map_base, mmio);
>> +		return MMIO_HANDLED;
>> +	}  else {
>> +		printk("MMIO access disabled\n");
>> +		return MMIO_ERROR;
>> +	}
>> +}
>> +
>> +/**
>> + * Modify root_cell's bitmap to (un)mask the registers defined in inmate cell.
>> + * Ignore if the root cell does not describe the regmap used by inmate
>> + * Handles the case where root cell describes the registers using
>> + * different address range
>> + *
>> + * @param cell		inmate cell handle.
>> + * @param regmap	register (un)map to be removed from root_cell.
>> + * @param map		true to map the regmap, false to unmap.
>> + *
>> + * @return 0 on successfully (un)mapping the regmap.
>> + */
>> +static int regmap_modify_root(struct cell *cell, struct reg_map_data *regmap,
>> +		bool map)
>> +{
>> +	const struct jailhouse_regmap *info = regmap->info;
>> +	struct reg_map_data *root_regmap = NULL;
>> +	unsigned long long addr;
>> +	u32 reg, idx;
>> +
>> +	if (cell == &root_cell)
>> +		return 0;
>> +	if (info->flags & JAILHOUSE_MEM_ROOTSHARED)
>> +		return 0;
>> +
>> +	for (reg = 0; reg < info->reg_count; reg++) {
>> +
>> +		addr = info->reg_base + reg * info->reg_size;
>> +		if (!root_regmap) {
>> +			root_regmap = cell_get_regmap(&root_cell, addr, &idx);
>> +			if (!root_regmap)
>> +				continue;
>> +		}
>> +
>> +		if (regmap_is_enabled(regmap, reg)) {
>> +			if (map) {
>> +				regmap_enable(root_regmap, idx);
>> +
>> +			/* For unmapping, ensure that its mapped in root cell regmap */
>> +			} else if (regmap_is_enabled(root_regmap, idx)) {
>> +
>> +				regmap_disable(root_regmap, idx);
>> +			} else {
>> +				printk("ERROR: Root cell does not own bitmap for reg %llx\n",
>> +						addr);
>> +				return -EINVAL;
>> +			}
>> +		}
>> +
>> +		/* reuse the same root_regmap for next register if idx is within limit */
>> +		idx++;
>> +		if (idx >= root_regmap->info->reg_count)
>> +			root_regmap = NULL;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int regmap_cell_init(struct cell *cell)
>> +{
>> +	const struct jailhouse_regmap *info;
>> +	struct reg_map_data *regmap;
>> +	u32 i, num_pages, size;
>> +	int ret;
>> +
>> +	if (cell->config->num_regmaps == 0)
>> +		return 0;
>> +
>> +	num_pages = PAGES(cell->config->num_regmaps * sizeof(struct reg_map_data));
>> +	cell->regmap = page_alloc(&mem_pool, num_pages);
>> +	if (!cell->regmap)
>> +		return -ENOMEM;
>> +
>> +	info = jailhouse_cell_regmaps(cell->config);
>> +	for (i = 0; i < cell->config->num_regmaps; i++, info++) {
>> +
>> +		regmap = &cell->regmap[i];
>> +		regmap->info = info;
>> +		regmap->cell = cell;
>> +		size = info->reg_size * info->reg_count;
>> +
>> +		if (info->reg_count > JAILHOUSE_REGMAP_BITS ||
>> +		    (info->flags & (JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE)) == 0)
>> +			goto invalid;
>> +
>> +		regmap->map_base = paging_map_device(info->reg_base, size);
>> +		if (!regmap->map_base)
>> +			return -ENOMEM;
>> +
>> +		memcpy(regmap->reg_bitmap, info->reg_bitmap,
>> +			sizeof(regmap->reg_bitmap));
>> +
>> +		mmio_region_register(cell, info->reg_base, size,
>> +			regmap_handler, regmap);
>> +
>> +		/* Unmap the memory so that handler can be triggered */
>> +		ret = paging_destroy(&cell->arch.mm, info->reg_base, size,
>> +				PAGING_COHERENT);
> 
> Jan/Chase,
> 
> I was doing some more testing / debug with this.
> I root caused that the paging_destroy call does not take effect.
> 
> I have the fix (7cffb9b7d54d "core: fix hugepage splitting in 
> paging_destroy") from the next branch
> Do we have one more bug causing the paging_destroy to be ignored?

Can you be more specific about the scenario (mapping before 
paging_destroy, parameters to paging_destroy)? Can you instrument the 
paging_destroy to visualize what is happening?

Besides that, the paging_destroy here is supposed to be removed in a 
newer version of the patch because we will model regmap as memory 
region. But even without that, I would have voted for requiring the user 
to avoid duplicate mappings.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1254f0c6-913b-6164-bec1-8d8a552e46bd%40siemens.com.
