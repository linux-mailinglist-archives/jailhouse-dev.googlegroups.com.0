Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBAOXQOGQMGQEAPRJ4OQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C69345EFB2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Nov 2021 15:13:22 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id k5-20020a05651210c500b0040934a07fbdsf4245548lfg.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Nov 2021 06:13:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1637936001; cv=pass;
        d=google.com; s=arc-20160816;
        b=oFINPvp+I2WO1pDwOkFN+UFNST4fbwb7P8GQkb65jTp+o2FP+b31Ruu+TDyPyhcGmf
         Nlji7yY514mbWkHLD9ymnPbRv4RYF3Pkx3IXBTOMyqlQWMREA8upM5vbuEGUDH649vVB
         GpS53Cdh7t+Rg5/fjvk7lqV7nJAdwuQb2ao06WlS1rwOMy/Sw8HRKVNtk5cdT4UJiZpq
         5BKsU4z/VEtwhaUAPuHgf11O8gzC//R7/FoJPErRyMN6pNMHLuMW7W7m7nyzIBhqXqhI
         h9qyckS7sIlHLh7OLmj6tY9GdL9+hsozUJZuAUDlfXiXVVUndPdgXrPWsQGt9SGEGLXg
         l6hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=b9RQz6GaQY/mfBW3Zgpa382GNp0ue7Zcd9N/0Sh/NC0=;
        b=Jv/Q7xTTABgtCYIbdZ4wnFqs+iu0zep2Z48rvYY1p9XteKZHEPUVWnh6wHoJwy/WXi
         sfRB0pj77k4lEoB6AWqTO9ymsfN6f+7A/J+puGHjCTR75yohYMSymEqBvdn6ajd3QdLa
         5XA45KZP5+N5yTrqEfjralSnOV/xhy7awjc9Wt9NH1b5YfHbgqOgX9JL2sIGPpSzTzcy
         33GMhH4Y3AZo2A0uNiM4z9ekPWEsIwnLmdAsSLUPlLkEWxVMIF8kklllMnJozSAw+lnn
         5TR0xVGAWZsMz5zstwTdNCgHKw1HNUZHmvA+ZHt0RONDZ3hjLkf5KoQe8Hg+zwMeEyz+
         d28w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=RakfwW17;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=b9RQz6GaQY/mfBW3Zgpa382GNp0ue7Zcd9N/0Sh/NC0=;
        b=iS+wcQ04uxmwu+i9bxCx0gD4MNfcmqAoqa9Xi8a1ptnTK5Tr90ABONVjjqnRPsyagM
         Q2NZZ97vQOAG/uLipbv/7/ewZpZSb9/H/deF+Kiqif0vomA7ibfS1IThrJNstmbgT44J
         2fYy/UKXEj3S0WHBMf9rTSVe041wqdJh8VLnu2kZDKWZ/rYSttLg9W1Cl3OrtZbt8mG+
         6gwijjFll34r6UYBNFyqZVdO4JfRMLDOHZatIUnBKz56KXFCmba/0uWD+35rIQkTlM+y
         on98QiduqCjoSarNdgMRej1X8TPLGPQioB+P0PyJXVd1nLjfFl1K6vSHWFqwVdt+rjg3
         CPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=b9RQz6GaQY/mfBW3Zgpa382GNp0ue7Zcd9N/0Sh/NC0=;
        b=CHzb6IfqCfR9r7GAYWYpeTx/aMnuuzIHUX1JIdd07Je9nGcZdGh34hGpqxAkZGO81/
         WI7Rzb0u0tgTwcy1WYdDVzfsqymSazlk8gawS9hJ2WxYegORqxYIjdPpICns5OlrbOCW
         ySMCNqh60Ci5FCl9GHUxjepAFhn8OQrjeJ60lICZARyGM2ekzhPPZwQt6FQGzPTBvDHj
         ojGo676NdY72sPWgLj4FCtUt3W83bg4hk4Ft4jmEUPNwOoN0jgt2Hm4Dpm2Zu+HqaHQW
         aVJ9iuSpJivz3v7vzmdZWYRve6u/AIS1Ox/CP9I79tHNYo7utyWTepH32SGeatJZupZ4
         DM/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531OksEzrQOtyPRWHAmdjTi6NsrcXNR8r6v8ijwsxOgWvXEoXevU
	PM1Gs+2wN4qwjWXVE6vlXPs=
X-Google-Smtp-Source: ABdhPJxQ8qcaao/q9f72+gz+i2Ox6nvWNjRoerjibFxJWQVzMzhpI/qX3RFLQehvKj+gKYP0qH3CMA==
X-Received: by 2002:a05:6512:3127:: with SMTP id p7mr30376821lfd.57.1637936001604;
        Fri, 26 Nov 2021 06:13:21 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8611:: with SMTP id a17ls1020449lji.1.gmail; Fri, 26 Nov
 2021 06:13:20 -0800 (PST)
X-Received: by 2002:a2e:a795:: with SMTP id c21mr32022831ljf.239.1637936000564;
        Fri, 26 Nov 2021 06:13:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637936000; cv=none;
        d=google.com; s=arc-20160816;
        b=f2n9BRtB2oTkz0AEbsQxJNrz1rUhgJMUuJwyoLd1RwRZqg0BmXyyT0S0hPGwEYLgvE
         qCBLjB0gQIlfdlQyN/EWE7ROSp3jatBaLGUahcvmDhBgPN6WcphGArGffKnMTAIYEomH
         jV65uigZE0Pm+ixwP+mT/OKleEzwd0Yvcg/GoF+0ycLhmBsts618gfnZOVxrMABvjMn4
         LIj9C0F47GEziCTaFpW5oEz5fMD6nnUD+VGKQy2D/IQX9e8GXYKVgcmiKZzqawa7N+fL
         iB6BfToAsIWMBsny++a4D+u2BnzCnc7WOjjuDVuUYdxTJgzq3RHmePM1y7VbKY54s79p
         07eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pYOqAEqAiMFxV+407ku4F2IPtB8D/hXBmTGZVNnthyo=;
        b=TSrLCL2i6bGV1JA67c11jcYif9eTSH9XWMPwn/F8vcS9E5Kgp0ob+4FIqD2DJqhRkU
         Khf7Oec9VRHy4CojAwRpy9MA/dgXzDJtqvrzPXqwzDY4eaS0YRX8Gf40D4dsX51Xrswn
         7uszCjrZELqBPLA/ReDBx8XDE18uEmi+skHTQRsrP+I8YM2YSmJ94PuiDSpfmIuR2qvj
         inKWZU/6vFcyKcItap6pgnHiua2ng84h9Zp0R2hTb2kuRlT1K64Ks5mi6j+6W98e6XrV
         joU5kVYQ2uBH1GTxuImTSc0/4HJFz3CkaWd0ITp4AtTB1ZAuAAHDSLhyhhKzPWAc77pe
         diUw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=RakfwW17;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id r15si372515ljp.1.2021.11.26.06.13.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Nov 2021 06:13:20 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4J0xYC3bG0zxtH;
	Fri, 26 Nov 2021 15:13:19 +0100 (CET)
Received: from [IPV6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 15:13:19 +0100
Message-ID: <db093dd2-fde8-a39c-3981-77e39c150b0d@oth-regensburg.de>
Date: Fri, 26 Nov 2021 15:13:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/1] [RFC] configs: Introduce helper files to create
 inmate cell config
Content-Language: en-US
To: Jan Kiszka <jan.kiszka@siemens.com>, Stephane Viau
	<stephane.viau@oss.nxp.com>, <jailhouse-dev@googlegroups.com>
CC: Stephane Viau <stephane.viau@nxp.com>
References: <20211123135721.23908-1-stephane.viau@oss.nxp.com>
 <f7ccb54a-26b1-1c62-02d4-093b5ca897bc@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <f7ccb54a-26b1-1c62-02d4-093b5ca897bc@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=RakfwW17;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 26/11/2021 13:20, Jan Kiszka wrote:
> On 23.11.21 14:57, Stephane Viau wrote:
>> Inmate cell configurations all look alike - more or less.
>> Let's create a couple of header files to hide the fastidious stuff
>> (structure field names and so on) so that .c cell configuration files
>> look a bit less ugly.
>>
>> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
>> Signed-off-by: Stephane Viau <stephane.viau@nxp.com>
>> ---
>>   configs/arm64/cell-create.h   | 56 ++++++++++++++++++++++++++
>>   configs/arm64/cell-helper.h   | 76 +++++++++++++++++++++++++++++++++++
>>   configs/arm64/cell-template.c | 32 +++++++++++++++
>>   3 files changed, 164 insertions(+)
>>   create mode 100644 configs/arm64/cell-create.h
>>   create mode 100644 configs/arm64/cell-helper.h
>>   create mode 100644 configs/arm64/cell-template.c
>>
>> diff --git a/configs/arm64/cell-create.h b/configs/arm64/cell-create.h
>> new file mode 100644
>> index 00000000..871784fc
>> --- /dev/null
>> +++ b/configs/arm64/cell-create.h
>> @@ -0,0 +1,56 @@
>> +/*
>> + * Cell Configuration - Structure definition
>> + *
>> + * Copyright 2021 NXP
>> + *
>> + * Authors:
>> + *  Stephane Viau <stephane.viau@nxp.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include <jailhouse/types.h>
>> +#include <jailhouse/cell-config.h>
>> +
>> +struct {
>> +	struct jailhouse_cell_desc cell;
>> +	__u64 cpus[1];
>> +	struct jailhouse_memory mem_regions[CONFIG_INMATE_REGIONS_NUM + 1];
>> +	struct jailhouse_irqchip irqchips[CONFIG_INMATE_IRQCHIPS_NUM];
>> +} __attribute__((packed)) config = {
>> +	.cell = {
>> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>> +		.revision = JAILHOUSE_CONFIG_REVISION,
>> +		.name = CONFIG_INMATE_NAME,
>> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
>> +
>> +		.cpu_set_size = sizeof(config.cpus),
>> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
>> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
>> +		.num_pci_devices = 0,
>> +		.cpu_reset_address = CONFIG_INMATE_BASE,
>> +	},
>> +
>> +	.cpus = {
>> +		/*
>> +		 * bitmap of cores used by the inmate cell
>> +		 */
>> +		CONFIG_INMATE_CORE_BITMAP,
>> +	},
>> +
>> +	.mem_regions = {
>> +		COMM_REGION_RW(0x80000000, KB(4)), /* communication region */
>> +		CONFIG_INMATE_REGIONS
>> +	},
>> +
>> +	.irqchips = {
>> +		{
>> +			.address = CONFIG_INMATE_IRQCHIPS_ADDR,
>> +			.pin_base = CONFIG_INMATE_IRQCHIPS_BASE,
>> +			.pin_bitmap = {
>> +				CONFIG_INMATE_IRQCHIPS_BITMAP
>> +			}
>> +		}
>> +	},
>> +};
>> diff --git a/configs/arm64/cell-helper.h b/configs/arm64/cell-helper.h
>> new file mode 100644
>> index 00000000..d35bc0fb
>> --- /dev/null
>> +++ b/configs/arm64/cell-helper.h
>> @@ -0,0 +1,76 @@
>> +/*
>> + * Cell Configuration - Generic definitions
>> + *
>> + * Copyright 2021 NXP
>> + *
>> + * Authors:
>> + *  Stephane Viau <stephane.viau@nxp.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + *
>> + */
>> +
>> +#ifndef KB
>> +#define KB(bytes)	(1024 * (bytes))
>> +#define MB(bytes)	(1024 * KB(bytes))
>> +#endif
>> +
>> +#define REGION(phys, virt, bytes) \
>> +	.phys_start = (phys), \
>> +	.virt_start = (virt), \
>> +	.size = (bytes) \
>> +
>> +#define MEM_REGION_RW(phys, virt, bytes) \
>> +	{ \
>> +		REGION(phys, virt, bytes), \
>> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, \
>> +	}
>> +
>> +#define COMM_REGION_RW(virt, bytes) \
>> +	{ \
>> +		REGION(0x00000000, virt, bytes), \
>> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
>> +		         JAILHOUSE_MEM_COMM_REGION, \
>> +	}
>> +
>> +#define MEM_REGION_RWX(phys, virt, bytes) \
>> +	{ \
>> +		REGION(phys, virt, bytes), \
>> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
>> +		         JAILHOUSE_MEM_EXECUTE, \
>> +		}
>> +
>> +#define MEM_REGION_RWXL(phys, virt, bytes) \
>> +	{ \
>> +		REGION(phys, virt, bytes), \
>> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
>> +		         JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE, \
>> +	}
>> +
>> +#define MMIO_REGION_RO(phys, virt, bytes) \
>> +	{ \
>> +		REGION(phys, virt, bytes), \
>> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_IO, \
>> +	}
>> +
>> +#define MMIO_REGION_ROS(phys, virt, bytes) \
>> +	{ \
>> +		REGION(phys, virt, bytes), \
>> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_IO | \
>> +		         JAILHOUSE_MEM_ROOTSHARED, \
>> +	}
>> +
>> +#define MMIO_REGION_RW(phys, virt, bytes) \
>> +	{ \
>> +		REGION(phys, virt, bytes), \
>> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
>> +		         JAILHOUSE_MEM_IO, \
>> +	}
>> +
>> +#define MMIO_REGION_RWS(phys, virt, bytes) \
>> +	{ \
>> +		REGION(phys, virt, bytes), \
>> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
>> +		         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED, \
>> +	}

Nice, I guess that at least these macros really help. Sysconfigs would 
also benefit from it.

>> diff --git a/configs/arm64/cell-template.c b/configs/arm64/cell-template.c
>> new file mode 100644
>> index 00000000..bf731101
>> --- /dev/null
>> +++ b/configs/arm64/cell-template.c
>> @@ -0,0 +1,32 @@
>> +/*
>> + * Cell Configuration - Structure definition
>> + *
>> + * Copyright 2021 NXP
>> + *
>> + * Authors:
>> + *  Stephane Viau <stephane.viau@nxp.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "cell-helper.h"
>> +
>> +/* Name, cores, entry point */
>> +#define CONFIG_INMATE_NAME		"inmate-cell-name"
>> +#define CONFIG_INMATE_CORE_BITMAP	(0b1100) /* inmate uses cores 2 and 3 */
>> +#define CONFIG_INMATE_BASE		(0xc0000000) /* entry point in DDR */
>> +
>> +/* Memory & peripherals */
>> +#define CONFIG_INMATE_REGIONS_NUM	(1)
>> +#define CONFIG_INMATE_REGIONS		\
>> +	MEM_REGION_RWXL(0xc0000000, 0xc0000000, MB(16)),   /* RAM */    \
>> +
>> +/* GIC */
>> +#define CONFIG_INMATE_IRQCHIPS_NUM	(1)
>> +#define CONFIG_INMATE_IRQCHIPS_ADDR	(0x38800000) /* GIC DISTRIBUTOR BASE ADDR */
>> +#define CONFIG_INMATE_IRQCHIPS_BASE	(32)
>> +#define CONFIG_INMATE_IRQCHIPS_BITMAP	\
>> +	(1 << (29 + 32 - 32)) /* UART4 */

In case of the irqchips, I don't see that the definitions bring any 
help. It's about the same size as rolling out the structures directly.

>> +
>> +#include "cell-create.h"
>>
> 
> Thanks for the proposal. Could you share some converted inmates as well
> so that we can see the impact more clearly?

Do you also have any plans for system configurations? At least the 
MEM_REGION-macros could help to condense stuff there as well.

Thanks
   Ralf

> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/db093dd2-fde8-a39c-3981-77e39c150b0d%40oth-regensburg.de.
