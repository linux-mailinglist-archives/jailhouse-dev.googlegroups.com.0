Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB56AYH2QKGQEKPA2U7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3F11C460C
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 May 2020 20:35:36 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id y5sf1397367ljn.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 May 2020 11:35:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588617336; cv=pass;
        d=google.com; s=arc-20160816;
        b=FCJsv+MkWTHDikcYpgqe4hyjXkKKrPouDASFa+eQX/s3GxiSMPFhATrQeT+n0Do2qN
         6caFGYcUj7bbY35HIYYlYyYdk1wdE+MnePeP4UUkoZw5gM6Lk6WI2wYtweAYwg5px8kj
         IaiSvEdpP2sEhT4CmuvqItRVHBGhpISR2sADUIIlZRLRYNg+bPETNzEdkwxeBBij8ZBE
         JSo88wJsL3zmsKLWda65FXjkksP89T3DLg2w306uwkbhaHuHWHX4zfksFXCGKKdfio/G
         xDiHR1+8xuLsLph1MTxSWz+dSvnXZ9MM9vgH20AmayNRcfGXZD04SAPv+xyZPxBm/OhZ
         leeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=8iSdPBXRc9vP9pI+Fb9M6j5Da4GK6+e0YxU1WCznJaM=;
        b=sl8WW+QjOGDacKGB44gRPOcrPK3pq5vPmLY+xXO4OnBHKvWSiQkjAZ1HFQyaslsjiJ
         eQIXg+KIxee/fZmFrN01dhXAOPJa8uKFAQHwAfw6vLvB2r0z/Cm/8NSYFWqBZvDOSIfo
         o783NYGIjlzWGwsNR50rWwk5WfWCUXWNvAdf5gHqfww8EDNiqqsVdR2Rso7pqvdPs//P
         yZVHF8GFrKBnpjGgBCiUoweSrdvYZcRAOiCAhSEuZlLxNcDQUYhaizl7Lq6Ekrb86wWa
         r/gxRSessTTj/3IvEGTq0M0b6y02sFWjEPW4cZ89cCKS7DZgnRsBhmdz6dfF4nN0qoxE
         HoOw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8iSdPBXRc9vP9pI+Fb9M6j5Da4GK6+e0YxU1WCznJaM=;
        b=TEUWmz7sOUJxqU3umJptg3jncqBbEgZjfIrh9KrKMjyfJVEDuGCwkBZVoy7i4tPjOC
         8s+z6MuHnug1zWq8y+96X4ec46Z5iVf5CzioTqzuRk6vMU5AAqCeMg1FPjqsfNKzcIZa
         QENoKMU+Z/GwxCMMFEZm55jEACJ1FkF9yaGRbcyGTyeBmIi144MUCG87UzTrFKPuar7P
         wVQjqJqSJu4I2gp74IuR7Gg8yZFT1+yYP+5vZ3JBzZSuflsSIQBB6PVlIym72SUvHfMZ
         jwq4WfSln262umgSk+wwSuWHcgeGqfXeUtxVD9udwMCorsV3GgrKNwhtXQ+kBolggK8j
         z6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=8iSdPBXRc9vP9pI+Fb9M6j5Da4GK6+e0YxU1WCznJaM=;
        b=CWc+jpVMwJKUatotFZtLgzLSBp8GrDr0x68gxq1MESldSrRpoJgL2iVNde+Lp/IrfG
         cLgF3LyJcnP3Ba3T5zz4PFBdLyoVBMXI2Ffgf1RrFv13D38u/pHXQctskQo8bAcTg/OB
         4Y1s+YmQwwKNdbEgQi5pnzKNydfu6qxckJVrAt0r+T0MEszLjMCgcR7pfCuL2XjVki/w
         hSh988SOw67h4rvEX/Tt+tBWULqGcMRH7F0VmQgLzJDG7wMVCVIfJtSQTfSwQrmjqHgi
         c5BohLBCj73S4LB7tR7G3nEOCTAP9BpBIYmvmH8fnmNia5cPYsGeNvQzfeNIHj9kFlJm
         4eJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZ+b+VkbEUHmwXfbs+us8SzjE4YaaJKGtslyJ8bhHH/5wBASE+2
	40HRZMZA4nuhbQNeWyNYCkk=
X-Google-Smtp-Source: APiQypLD6GPJMeNggaasTiXcRFFFrMEqr4cMWUO41qIbNIWf5WyknKb3KClmS83blKOCv3WYd4WGqw==
X-Received: by 2002:a19:ad45:: with SMTP id s5mr12748627lfd.106.1588617335924;
        Mon, 04 May 2020 11:35:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:2002:: with SMTP id s2ls2983935ljo.3.gmail; Mon, 04
 May 2020 11:35:35 -0700 (PDT)
X-Received: by 2002:a2e:898b:: with SMTP id c11mr11299663lji.197.1588617335052;
        Mon, 04 May 2020 11:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588617335; cv=none;
        d=google.com; s=arc-20160816;
        b=eO3kMFX1MvwEH2XWj5CDsWr8aG6GjutljZgStAK7dF0Z3DVd8ZjLbMkJ7Xpxq9tMzI
         /rMQv1f9FUHdf5D7cCA5QOv5bL+2kz4R1WildyLGQ8rojKbcu4tKEUdx6QgrHNCWnpcc
         Xwi1d5FfxGxiUssbF09MRKxyPF+nnYvrpVoE2EAo16/rNvcjJbt1TIjKxpu4BGV1Ul8w
         GVzWo6BDmLMM4EAi1cvc/q7yBgOdWv+WcUldG7SjbU030YM00NrtNh35mxTxFMFgEHXt
         ZlP6Lsr4waUwEyczvL7T9tVRNwOT+eGOhBaOIQkYYIxg84A10GxWxi63AUnwOZ7UVZSg
         p3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=3SzFFvGqDzNdy2g8tSt2hrxB8ZqEY+NK0+e68fZFgK0=;
        b=DBvYrYRhxfXM0sDE8FBKuPbr58IrfjwMoxl/L8fijx3YbWoaWKtcCH08BQbProZf0h
         PeXFzvNegwlUC0q9WRh5CL0g3D4HUZv515lerQC0PLHqJiHf4tjI3ihDf4U4JQw7b1nE
         ovNjz4nXkN+67BQvScOHUEqBHRa13D4WwrHD/gt/tMH5YgRx3av2C/CuwSS6FyPS2oF9
         hXypKNs5eBRMiXP2MX7CuzmJu1B9/bw1C+FuXn1v+NqFMeZlKiB2wltDyf4VHbcDi3Dj
         Mb5HjN5a+W7E4WXii9FNJZvyKxMEnBt90XdL5tE20ftJ/BH/gRD/j8KNDOZwt9bFVEuW
         TcNQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id u25si653324ljg.1.2020.05.04.11.35.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 11:35:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 044IZXgN023717
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 May 2020 20:35:33 +0200
Received: from [167.87.53.26] ([167.87.53.26])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 044IZW4b019225;
	Mon, 4 May 2020 20:35:32 +0200
Subject: Re: [PATCH v2 8/9] configs: add colored cell configuations for ZCU102
To: Marco Solieri <ms@xt3.it>, jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-9-ms@xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2ef61ea7-5617-dcd8-24fe-1c80bca7615e@siemens.com>
Date: Mon, 4 May 2020 20:35:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421100351.292395-9-ms@xt3.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <ms@xt3.it>
> ---
>   configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  79 +++++++++++
>   configs/arm64/zynqmp-zcu102-linux-demo-col.c  | 128 ++++++++++++++++++
>   2 files changed, 207 insertions(+)
>   create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
>   create mode 100644 configs/arm64/zynqmp-zcu102-linux-demo-col.c
> 
> diff --git a/configs/arm64/zynqmp-zcu102-inmate-demo-col.c b/configs/arm64/zynqmp-zcu102-inmate-demo-col.c
> new file mode 100644
> index 00000000..83188b27
> --- /dev/null
> +++ b/configs/arm64/zynqmp-zcu102-inmate-demo-col.c
> @@ -0,0 +1,79 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Configuration for demo inmate on Xilinx ZynqMP ZCU102 eval board:
> + * 1 CPU, 64K RAM, 1 serial port, color range [0-7]
> + *
> + * Copyright (c) Universita' degli Studi di Modena e Reggio Emilia 2020
> + *
> + * Authors:
> + *  Luca Miccio <lucmiccio@gmail.com>
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
> +	struct jailhouse_memory mem_regions[3];
> +	struct jailhouse_cache cache_regions[1];
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = "inmate-demo-col",
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> +
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = 0,
> +		.num_pci_devices = 0,
> +		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
> +
> +		.console = {
> +			.address = 0xff010000,
> +			.type = JAILHOUSE_CON_TYPE_XUARTPS,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_REGDIST_4,
> +		},
> +	},
> +
> +	.cpus = {
> +		0x2,
> +	},
> +
> +	.mem_regions = {
> +		/* UART */ {
> +			.phys_start = 0xff010000,
> +			.virt_start = 0xff010000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM */ {
> +			.phys_start = 0x800600000,
> +			.virt_start = 0,
> +			.size =  0x00010000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
> +				JAILHOUSE_MEM_COLORED,
> +		},
> +		/* communication region */ {
> +			.virt_start = 0x80000000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_COMM_REGION,
> +		},
> +	},
> +
> +	.cache_regions = {
> +		{
> +			.start = 0,
> +			.size = 8,
> +		},
> +	},
> +};
> diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-col.c b/configs/arm64/zynqmp-zcu102-linux-demo-col.c
> new file mode 100644
> index 00000000..66f12a66
> --- /dev/null
> +++ b/configs/arm64/zynqmp-zcu102-linux-demo-col.c
> @@ -0,0 +1,128 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Configuration for linux-demo inmate on ZynqMP ZCU102:
> + * 2 CPUs, 128M RAM, serial port 2, color range [0-7]
> + *
> + * Copyright (c) Universita' degli Studi di Modena e Reggio Emilia 2020
> + *
> + * Authors:
> + *  Luca Miccio <lucmiccio@gmail.com>
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
> +	struct jailhouse_memory mem_regions[12];
> +	struct jailhouse_cache cache_regions[1];
> +	struct jailhouse_irqchip irqchips[1];
> +	struct jailhouse_pci_device pci_devices[2];
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = "ZynqMP-linux-demo-col",
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> +
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
> +		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
> +		.vpci_irq_base = 140-32,
> +
> +		.console = {
> +			.address = 0xff010000,
> +			.type = JAILHOUSE_CON_TYPE_XUARTPS,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_REGDIST_4,
> +		},
> +	},
> +
> +	.cpus = {
> +		0xc,
> +	},
> +
> +	.mem_regions = {
> +		/* IVSHMEM shared memory region for 00:01.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x800400000, 1),
> +		/* IVSHMEM shared memory region for 00:03.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x800700000, 0),
> +		/* UART */ {
> +			.phys_start = 0xff010000,
> +			.virt_start = 0xff010000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM */ {
> +			.phys_start = 0x800600000,
> +			.virt_start = 0,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* RAM */ {
> +			.phys_start = 0x810000000,
> +			.virt_start = 0x81000000,
> +			.size = 0x8000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> +				JAILHOUSE_MEM_LOADABLE | JAILHOUSE_MEM_COLORED,
> +		},
> +		/* communication region */ {
> +			.virt_start = 0x80000000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_COMM_REGION,
> +		},
> +	},
> +
> +	.cache_regions = {
> +		{
> +			.start = 0,
> +			.size = 8,
> +		},
> +	},
> +
> +	.irqchips = {
> +		/* GIC */ {
> +			.address = 0xf9010000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				1 << (54 - 32),
> +				0,
> +				0,
> +				(1 << (141 - 128)) | (1 << (143 - 128))
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		/* 00:01.0 */ {
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.bdf = 1 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 1,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +		},
> +		/* 00:03.0 */ {
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.bdf = 3 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 4,
> +			.shmem_dev_id = 0,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +		},
> +	},
> +
> +};
> 

You aren't setting your .col_load_address - I suspect this will explode 
then, no?

Besides that, using this on the ultra96 should be straightforward, 
right? Would make a demo case for jailhouse-images. Or we even configure 
some more different target.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2ef61ea7-5617-dcd8-24fe-1c80bca7615e%40siemens.com.
