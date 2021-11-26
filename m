Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKFCQOGQMGQECJGLNHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd40.google.com (mail-io1-xd40.google.com [IPv6:2607:f8b0:4864:20::d40])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF0045EDCB
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Nov 2021 13:20:59 +0100 (CET)
Received: by mail-io1-xd40.google.com with SMTP id w16-20020a5d8a10000000b005e241c13c7bsf11570435iod.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Nov 2021 04:20:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1637929257; cv=pass;
        d=google.com; s=arc-20160816;
        b=bqlYnad7q8mczpTXZrKVboM63l3HA2aMqaoxmwqN9HeJVL4T/W1JZoVXAPM2bvYKru
         X5GdNPcrKzg2t5cN2KQD8u+AucHeYWuJ338AqBe2guDlyt5WW3YYPvyrLIfYXI34cWeC
         zHPvHEhG1dwSl0IvaO+Or6tZV5d4RyAVOqq3HPVZWUOEXw0pYBmuLaP4HwO4x3XGAbIX
         DIwRyUqzVuTxB4V7AQUv13XsIUaQ23vKDqV0BHWOvgdSsCdUNcbQObTgdRHp3yeO9Nt4
         z8bQS07O7By4HOudLl3br1P52yAa52VYYkl04TCfRGtdDBSS1T6cq5E5gr9q04N2q/eG
         HzKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=FKijc0zq1E7BLS0P8iMHOODhnIynPL8AxoJPj5mtFdI=;
        b=gFRTsmcUvQVP40aZrcejuh9+RPNBlBLxdIhk7XJ1hFKD1mp/t4Ij5rm2M0+gLKk/da
         r8TskHZwJNZoOFB7gFEHxvw2ANZuJStPiwR+oOTjgYwAQGVBzD2Un96A4X78UCo95f3r
         CbhXzxQp9/yegx7wPJ/yeFTcS9mwlqToHHDzuvtpPYVCd2pViqdiggg2NhTlL/tspQ8i
         KJObbOzyq8332tlyiLP7yvAqCBcVSNs6HKwbgFftjRHZqwLupMZZLA1mICRdclRjnKxl
         5Rk3pGkX0083VyskMZ9d0m+tfIjkCMeHGtkwU6sRtDSj6C8Q2xObSbgFQt2UNko8jkio
         hDpw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FKijc0zq1E7BLS0P8iMHOODhnIynPL8AxoJPj5mtFdI=;
        b=Nu0nr5kSMPFdD9dY0NDWfEJSC80q+Hz+3ae/wfMQoeygDNRa5cYdl4vxe97VHYV3Dd
         l4iDrWYNYiJdgpujLVOkKrxa0ssFLk8dDziJOa5trpRcYPa38xWOr2EG3pzCkYPMN7Ma
         HTiyTJEM6ZKpdhvtqAaTgZguKYgyaAPcKVcVk58EB+SsZCVpEBh6c7Hr7mnpDAH1QUP0
         a3RoUFwDuZvB1jtFAiw0KiuATz93LqGy40y+ShQMSeaijs51lsVrvKQD4y+axpSz19y3
         hqxh6RtjZTYTx3LlS1lb8r/lK4sMk+CXnHEZ7Aj98ktGLcxY9uPxkHCwXyV7bfGmWXkO
         YD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=FKijc0zq1E7BLS0P8iMHOODhnIynPL8AxoJPj5mtFdI=;
        b=xt3kuNTi1PjRyP0yHtqxuUjuJJhjscm4Ibyzl1SXbvm/0+klWZqlDP7KryOIW+0iRL
         gIphSQnA21nbJMsJrpV/InWLYCQC7Y91qHg00HkqebI/1nwXO7s4nHU60q28Q+hbUSJM
         zGPyVXivN6dOxtIR0uLyeCrb/M8r4DGIUnpL1foTPs0NRScceSCOoa+pP01Q3srgGRkP
         6gCWNFIywqJ3joLIAZxo9QhoX9FnXaNpUDS1QK0gowsWu7zH+T2BBRcC7K21h/e71n++
         4dNfe1tjjgiomUXKgL1SKsJI7ullynWBYoKps5CMjBZQZ8my52wd/GZ1iNvu3QAPbgQk
         PEmw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5329oTqjqhiMBsZTTlCE1Btmmp3/c77qERBFdc/KyvrQrbCTUNPq
	3n7/THulOVzAuFT3lSsze50=
X-Google-Smtp-Source: ABdhPJxkqg2UvdCIoml5LwdkcbdSOF4WwsJhpb8X2KApZFCbFo6Nxcom/5BVM2Ia+H/fMbRDJE8p2g==
X-Received: by 2002:a05:6638:12d6:: with SMTP id v22mr41680459jas.6.1637929256249;
        Fri, 26 Nov 2021 04:20:56 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:cf13:: with SMTP id o19ls642487ioa.1.gmail; Fri, 26 Nov
 2021 04:20:55 -0800 (PST)
X-Received: by 2002:a5e:8701:: with SMTP id y1mr34019076ioj.80.1637929255765;
        Fri, 26 Nov 2021 04:20:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637929255; cv=none;
        d=google.com; s=arc-20160816;
        b=Gb/Jl8c9Mluth93eBbcBZ9YnryxpAU3FsfMaNAWf0Crq0q/syzkjLnWuf3X8xFWlwx
         82cYYftJs+L6j/UAjVJpdl++t8v/XzfvjrpPexoWQCbCXz1KdPHn5f2mpeRJR2fLRWn6
         g0K7gKVuG/ySQyNXCbtpHIlCKYFdZmwpyH0hzT8yEYcJ7NI9ir0L90U4YEcFYzp9MDtr
         GNcVzuu47hcyePEZ+5r6wiNk7wR0AZ4F8QSmuZ4O5dkX22kInSCobvYpfp7zKP20Wywk
         wuq4SEBYpIGeUoN/W9JpUo7jnyQjRJInWKUEWIOtKfWbclmTapml11nBWFZjtXJrR5WB
         kKpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=CTB1J/dQn24QM8Yfm8AMANE/k4G3I4mgpNMCSXCFvcw=;
        b=qKlzH9HcqIhnzjK3Jjn7yCt5H4dx+Ua625pHPYdmwU7akI/oeGKJSfaQAzQh64kacN
         3lUTXfOy5awRu3GWv+AGAShCCdUH0o/60KnCK9lvr9DdzFV35AF8t1vbiNazO61kjefx
         O4KT+2RqNXeFLuS6ZPXjfEh6pIJy7AYEP6cmaVcus33PStxmWV3RsTjTyELPDqzU9Rtx
         Du5nhZzmUHtEt128IhUXLlHulXJC0etE0DY5AstXUKYBFxM203sSTvBtzHIcg5VFZKYK
         JSBs2maPHcGKEQWFfncrVBTCAd/d9lkvbG/3kztUwKxdU9CtfPqK5QWoLpBk5GNXAAZ9
         TbKQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id o6si757943ilu.4.2021.11.26.04.20.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Nov 2021 04:20:55 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 1AQCKrMG026871
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Nov 2021 13:20:53 +0100
Received: from [167.87.72.134] ([167.87.72.134])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1AQCKrS6023917;
	Fri, 26 Nov 2021 13:20:53 +0100
Subject: Re: [PATCH 1/1] [RFC] configs: Introduce helper files to create
 inmate cell config
To: Stephane Viau <stephane.viau@oss.nxp.com>, jailhouse-dev@googlegroups.com
Cc: Stephane Viau <stephane.viau@nxp.com>
References: <20211123135721.23908-1-stephane.viau@oss.nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f7ccb54a-26b1-1c62-02d4-093b5ca897bc@siemens.com>
Date: Fri, 26 Nov 2021 13:20:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211123135721.23908-1-stephane.viau@oss.nxp.com>
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

On 23.11.21 14:57, Stephane Viau wrote:
> Inmate cell configurations all look alike - more or less.
> Let's create a couple of header files to hide the fastidious stuff
> (structure field names and so on) so that .c cell configuration files
> look a bit less ugly.
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> Signed-off-by: Stephane Viau <stephane.viau@nxp.com>
> ---
>  configs/arm64/cell-create.h   | 56 ++++++++++++++++++++++++++
>  configs/arm64/cell-helper.h   | 76 +++++++++++++++++++++++++++++++++++
>  configs/arm64/cell-template.c | 32 +++++++++++++++
>  3 files changed, 164 insertions(+)
>  create mode 100644 configs/arm64/cell-create.h
>  create mode 100644 configs/arm64/cell-helper.h
>  create mode 100644 configs/arm64/cell-template.c
> 
> diff --git a/configs/arm64/cell-create.h b/configs/arm64/cell-create.h
> new file mode 100644
> index 00000000..871784fc
> --- /dev/null
> +++ b/configs/arm64/cell-create.h
> @@ -0,0 +1,56 @@
> +/*
> + * Cell Configuration - Structure definition
> + *
> + * Copyright 2021 NXP
> + *
> + * Authors:
> + *  Stephane Viau <stephane.viau@nxp.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/types.h>
> +#include <jailhouse/cell-config.h>
> +
> +struct {
> +	struct jailhouse_cell_desc cell;
> +	__u64 cpus[1];
> +	struct jailhouse_memory mem_regions[CONFIG_INMATE_REGIONS_NUM + 1];
> +	struct jailhouse_irqchip irqchips[CONFIG_INMATE_IRQCHIPS_NUM];
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = CONFIG_INMATE_NAME,
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> +
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
> +		.num_pci_devices = 0,
> +		.cpu_reset_address = CONFIG_INMATE_BASE,
> +	},
> +
> +	.cpus = {
> +		/*
> +		 * bitmap of cores used by the inmate cell
> +		 */
> +		CONFIG_INMATE_CORE_BITMAP,
> +	},
> +
> +	.mem_regions = {
> +		COMM_REGION_RW(0x80000000, KB(4)), /* communication region */
> +		CONFIG_INMATE_REGIONS
> +	},
> +
> +	.irqchips = {
> +		{
> +			.address = CONFIG_INMATE_IRQCHIPS_ADDR,
> +			.pin_base = CONFIG_INMATE_IRQCHIPS_BASE,
> +			.pin_bitmap = {
> +				CONFIG_INMATE_IRQCHIPS_BITMAP
> +			}
> +		}
> +	},
> +};
> diff --git a/configs/arm64/cell-helper.h b/configs/arm64/cell-helper.h
> new file mode 100644
> index 00000000..d35bc0fb
> --- /dev/null
> +++ b/configs/arm64/cell-helper.h
> @@ -0,0 +1,76 @@
> +/*
> + * Cell Configuration - Generic definitions
> + *
> + * Copyright 2021 NXP
> + *
> + * Authors:
> + *  Stephane Viau <stephane.viau@nxp.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef KB
> +#define KB(bytes)	(1024 * (bytes))
> +#define MB(bytes)	(1024 * KB(bytes))
> +#endif
> +
> +#define REGION(phys, virt, bytes) \
> +	.phys_start = (phys), \
> +	.virt_start = (virt), \
> +	.size = (bytes) \
> +
> +#define MEM_REGION_RW(phys, virt, bytes) \
> +	{ \
> +		REGION(phys, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, \
> +	}
> +
> +#define COMM_REGION_RW(virt, bytes) \
> +	{ \
> +		REGION(0x00000000, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
> +		         JAILHOUSE_MEM_COMM_REGION, \
> +	}
> +
> +#define MEM_REGION_RWX(phys, virt, bytes) \
> +	{ \
> +		REGION(phys, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
> +		         JAILHOUSE_MEM_EXECUTE, \
> +		}
> +
> +#define MEM_REGION_RWXL(phys, virt, bytes) \
> +	{ \
> +		REGION(phys, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
> +		         JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE, \
> +	}
> +
> +#define MMIO_REGION_RO(phys, virt, bytes) \
> +	{ \
> +		REGION(phys, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_IO, \
> +	}
> +
> +#define MMIO_REGION_ROS(phys, virt, bytes) \
> +	{ \
> +		REGION(phys, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_IO | \
> +		         JAILHOUSE_MEM_ROOTSHARED, \
> +	}
> +
> +#define MMIO_REGION_RW(phys, virt, bytes) \
> +	{ \
> +		REGION(phys, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
> +		         JAILHOUSE_MEM_IO, \
> +	}
> +
> +#define MMIO_REGION_RWS(phys, virt, bytes) \
> +	{ \
> +		REGION(phys, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
> +		         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED, \
> +	}
> diff --git a/configs/arm64/cell-template.c b/configs/arm64/cell-template.c
> new file mode 100644
> index 00000000..bf731101
> --- /dev/null
> +++ b/configs/arm64/cell-template.c
> @@ -0,0 +1,32 @@
> +/*
> + * Cell Configuration - Structure definition
> + *
> + * Copyright 2021 NXP
> + *
> + * Authors:
> + *  Stephane Viau <stephane.viau@nxp.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "cell-helper.h"
> +
> +/* Name, cores, entry point */
> +#define CONFIG_INMATE_NAME		"inmate-cell-name"
> +#define CONFIG_INMATE_CORE_BITMAP	(0b1100) /* inmate uses cores 2 and 3 */
> +#define CONFIG_INMATE_BASE		(0xc0000000) /* entry point in DDR */
> +
> +/* Memory & peripherals */
> +#define CONFIG_INMATE_REGIONS_NUM	(1)
> +#define CONFIG_INMATE_REGIONS		\
> +	MEM_REGION_RWXL(0xc0000000, 0xc0000000, MB(16)),   /* RAM */    \
> +
> +/* GIC */
> +#define CONFIG_INMATE_IRQCHIPS_NUM	(1)
> +#define CONFIG_INMATE_IRQCHIPS_ADDR	(0x38800000) /* GIC DISTRIBUTOR BASE ADDR */
> +#define CONFIG_INMATE_IRQCHIPS_BASE	(32)
> +#define CONFIG_INMATE_IRQCHIPS_BITMAP	\
> +	(1 << (29 + 32 - 32)) /* UART4 */
> +
> +#include "cell-create.h"
> 

Thanks for the proposal. Could you share some converted inmates as well
so that we can see the impact more clearly?

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f7ccb54a-26b1-1c62-02d4-093b5ca897bc%40siemens.com.
