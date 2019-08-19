Return-Path: <jailhouse-dev+bncBCB7D7MXMMII7J7L5ICRUBFPBQ6HC@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3e.google.com (mail-vk1-xa3e.google.com [IPv6:2607:f8b0:4864:20::a3e])
	by mail.lfdr.de (Postfix) with ESMTPS id B98DE94AF2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 18:51:28 +0200 (CEST)
Received: by mail-vk1-xa3e.google.com with SMTP id l25sf478331vkn.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 09:51:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566233487; cv=pass;
        d=google.com; s=arc-20160816;
        b=q93eA+6O7T6AcrzRLlyRt21mxhuPbsrDMWJTcN+f+5KlBkgh4A36BkrkfQoFug6A7+
         51GqoeLlhuEhlNx03x8M4LmapLLYSxs+UKaXy8niklR1j8ER9xtr7h3GDhSOyVt0JGQE
         ix5taILRAK6mCES0abnfSrdB3Grom8u6n4SI9A5Y/2UVVp/F/vH0/cMDW8ALbkvcEVfr
         170QDOaPz1XZdezEAuwLO9QCj8lJl4htBv4MApDYiwEErrEO3aRfcDkG8L1aC6aY0onH
         p92202Zvlm1ybVRVowXXixX9186cnMqqGJ8/JJEZ+81dIuFtz97GSHyVO1gETpi+dSmh
         ZPTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=ltnICdTXO4YIg+KyyU9lXLdLzehn78ZTWHHmQSOLzvU=;
        b=eUSJfjMFTgI7ig/k8KEuVZZs3jHrnuhAqzsnAkCsm8Vz+RhYh6GC4/R06oFsDQdvL9
         TSZOyyRFWtJavGqRBLcweUJfY8o9W80TkqgiBjeE9UQ8WIF5ZWOKYlUUzsim0ItlChGD
         Tvhalu/J4jxrYQK6MlqO2aXnRBn/b20TjesXwSXWgQxC77q+7H9vI+vPnmg2AjpS88lg
         d6bojmbIz85nWLDQXvs90zzMsL2Kx0/P6etkrHTFoFEdsweAiUHD0cr9CplF/0uFq3fi
         JGeRpr6RnA3lhpqgVRmVnH1kRWo2X9OgSPWcP7Zx1jv4TAp0Qsr+EOopToUQMGyY2cBf
         IqJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hR6dd3s9;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=ltnICdTXO4YIg+KyyU9lXLdLzehn78ZTWHHmQSOLzvU=;
        b=s18l4YMKoztQMLfxI05RB6GceMSWqY9g43Xl1M5VnowmQoTKO7EzRBlOODQ3vYCzdU
         QzOsJeB5H5qiofin41YBhZFMn5jx7KOEHNDGfhtXwxP0kNKtGeVYiJiQ4S45ElNR21WJ
         rbm+HO4oYWVtMDxkDQKLPbnd4Ykw6Z0fVpGz7l8iBdT6YJGEnSg5IaGWmZVKe1nVnJ5q
         yjPH8gCTJZ5qf0pepLyGVnWhPiyZERPuAPjfqA22QEQ1Mr0GKI2ExVqQc0l2LblBS5ba
         wqS7v4obww1CkXHbDPrprhwyOEc2Ku3QZnsE8ciYKWa9c+ZqCc4Ox+CpgRUj+EQltC+3
         CRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ltnICdTXO4YIg+KyyU9lXLdLzehn78ZTWHHmQSOLzvU=;
        b=hnZDvpIoldBBssZ6mA6ghfe5Z5WHNDACLWhX6WvnC9xH5RSrra7gEg30XV9+jift94
         +zcAzQq+uniDwC77+S79+43d3j0J++4xnQU0FqMTlcjd7ghmMStbZe5xMGEFrDowfgmc
         pkCOP14JxsJu+FHtezymOaY9RrrcV1yjJsIv2HP8zEDGHaJ3mHW1jif6GAhVSswPlAUi
         5/WKHnpBnI7qlgpBPZ3vPZ9BQRm9Q4WGLcKl79N/H3n+G3F/qa0B4i+GLcuPWsw4YogK
         U0jAE1TO+P8BlAwn3Vb/1BvPlbmSKspnpqKekqyHND3dthBIS5DHLa7emoz3pFCyy4cR
         XM2Q==
X-Gm-Message-State: APjAAAUk+BzTASj997HU4RDRySNV1MTDb8E8zdI3tKdehO4GKVQjTqIw
	/b75MGhp37DF/9dM9CiMz2c=
X-Google-Smtp-Source: APXvYqzod+B2J/FvwjWV1aSr9MHP88AYV1F47zMYgXDwnHzhHIc0C+F33z7XtAwdGi1wi1KSWTrvWg==
X-Received: by 2002:ab0:7714:: with SMTP id z20mr14665029uaq.34.1566233487761;
        Mon, 19 Aug 2019 09:51:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:7241:: with SMTP id d1ls1001823uap.14.gmail; Mon, 19 Aug
 2019 09:51:27 -0700 (PDT)
X-Received: by 2002:ab0:2e99:: with SMTP id f25mr14056676uaa.133.1566233487440;
        Mon, 19 Aug 2019 09:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566233487; cv=none;
        d=google.com; s=arc-20160816;
        b=GlKKSUxGr2dkfVtLt/6CnbvwospBMs+JRxJbCL1gTIpsIVu8tBJ+w5L5Y2gFQfdTkl
         af5xu7Y0dpDQveHHDNbKjQXxlpc6+cuHt4BQlj18A3O0iLI/x5HKEgs85lomZWgvcDfR
         dkcwifNhYo/r3LPvC8dKCb51BbQRHhqDO8KdzmSetFgSJFSDY390s97UB0ZXlQa5+ZL3
         A2WMUjq+FAfmB67xGmOFbJHdwc3rAysGMTAwpyr5H/nhJvcIavYk1BcC1I8uWzihlKFV
         UvHUJOJ7avGQlo//vbURcn9VS2mCFdGUYs3AD9g897JubK+3QqE/lSb3zw2SGIOuBoIn
         tMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=F0nhBzclaUYhhvAXYU0O8YmP9Zu4njccocUwlNUdOEM=;
        b=spQx7pNUX1u1aYYrCzEY1h264Hrte4IGvSLk6gVdgF8CfpYB1LfDgMuX/TDe1rUHOx
         KloqcwRIPTRMYIqY4ZwGN4ZUvy/HD94QE83+gri2H9aUd8+fLZX8vUYwbnleVBjf7kYE
         6lGJmstekE3DZ36zuUj9+3oaOa6evdvbBNLwgDO7GVX5hJKSFDigwp4FyJjvrUMYwIIA
         XaoWYEhM7VUyQQlYGZ5GeAJyCGAxrOWtJQ1/7iFEvwAKIOv/aZFOUh0jsSlrM06KgGGp
         jwKABQjmvUGyw1ZQoTfYTFu4VDyUvsSfxJ7PN5lI1Jjv3s0JinosrHpTBaERCVv0Syxq
         XAGA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hR6dd3s9;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id w19si101022vkm.3.2019.08.19.09.51.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 09:51:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JGpQZO015111;
	Mon, 19 Aug 2019 11:51:26 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JGpQXu032725
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Aug 2019 11:51:26 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 11:51:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 11:51:26 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JGpOp5035193;
	Mon, 19 Aug 2019 11:51:25 -0500
Subject: Re: [PATCH v2 2/4] configs: arm64: Add support for k3-j721-evm board
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <jailhouse-dev@googlegroups.com>,
        <jan.kiszka@siemens.com>
References: <1566224813-20129-1-git-send-email-nikhil.nd@ti.com>
 <1566224813-20129-3-git-send-email-nikhil.nd@ti.com>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <05754d1d-ab11-a07d-ae5c-1c113e4b9fc6@ti.com>
Date: Mon, 19 Aug 2019 22:20:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1566224813-20129-3-git-send-email-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=hR6dd3s9;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as
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



On 19/08/19 7:56 PM, Nikhil Devshatwar wrote:
> k3-j721e-evm is the new evaluation module from Texas Instruments
> which has the j721e SoC. (aka DRA829) It has a dual core
> ARM Cortex-A72 CPU cores, 4GiB of RAM, 2x Display ports,
> 6x UART ports, 5x ethernet ports, SD and eMMC interfaces for
> storage and many other connectivity, graphics, multimedia and
> other accelerator devices.
> 
> J721E TRM: http://www.ti.com/lit/ug/spruil1/spruil1.pdf
> 
> Add support for the jailhouse root cell config for this board.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
> Changes from v1:
> * Split up the peripheral mem_region to match with kernel dts
> 
>  configs/arm64/k3-j721e-evm.c | 343 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 343 insertions(+)
>  create mode 100644 configs/arm64/k3-j721e-evm.c
> 
> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
> new file mode 100644
> index 0000000..292093b
> --- /dev/null
> +++ b/configs/arm64/k3-j721e-evm.c
> @@ -0,0 +1,343 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + *
> + * Configuration for K3 based J721E-EVM
> + *
> + * Authors:
> + *  Nikhil Devshatwar <nikhil.nd@ti.com>
> + *  Lokesh Vutla <lokeshvutla@ti.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/types.h>
> +#include <jailhouse/cell-config.h>
> +
> +struct {
> +	struct jailhouse_system header;
> +	__u64 cpus[1];
> +	struct jailhouse_memory mem_regions[30];
> +	struct jailhouse_irqchip irqchips[6];
> +	struct jailhouse_pci_device pci_devices[1];
> +} __attribute__((packed)) config = {
> +	.header = {
> +		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> +		.hypervisor_memory = {
> +			.phys_start = 0x89fa00000,
> +			.size = 0x400000,
> +		},
> +		.debug_console = {
> +			.address = 0x02800000,
> +			.size = 0x1000,
> +			.type = JAILHOUSE_CON_TYPE_8250,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_MDR_QUIRK |
> +				 JAILHOUSE_CON_REGDIST_4,
> +		},
> +		.platform_info = {
> +			.pci_mmconfig_base = 0x76000000,
> +			.pci_mmconfig_end_bus = 0,
> +			.pci_is_virtual = 1,
> +			.pci_domain = 1,
> +			.arm = {
> +				.gic_version = 3,
> +				.gicd_base = 0x01800000,
> +				.gicr_base = 0x01900000,
> +				.maintenance_irq = 25,
> +			},
> +		},
> +		.root_cell = {
> +			.name = "k3-j721e-evm",
> +
> +			.cpu_set_size = sizeof(config.cpus),
> +			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +			.num_irqchips = ARRAY_SIZE(config.irqchips),
> +			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +			.vpci_irq_base = 191 - 32,
> +		},
> +	},
> +
> +	.cpus = {
> +		0x3,
> +	},
> +
> +	.mem_regions = {
> +		/* IVSHMEM shared memory region for 00:00.0 */ {
> +			.phys_start = 0x89fe00000,
> +			.virt_start = 0x89fe00000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +		/* ctrl mmr */ {
> +			.phys_start = 0x00100000,
> +			.virt_start = 0x00100000,
> +			.size = 0x00020000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* gpio */ {
> +			.phys_start = 0x00600000,
> +			.virt_start = 0x00600000,
> +			.size = 0x00032000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* serdes */ {
> +			.phys_start = 0x00900000,
> +			.virt_start = 0x00900000,
> +			.size = 0x00012000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* timesync router */ {
> +			.phys_start = 0x00A40000,
> +			.virt_start = 0x00A40000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* Most peripherals */ {
> +			.phys_start = 0x01000000,
> +			.virt_start = 0x01000000,
> +			.size = 0x0af03000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MAIN NAVSS */ {
> +			.phys_start = 0x30800000,
> +			.virt_start = 0x30800000,
> +			.size = 0x0bc00000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* PCIe Core */ {
> +			.phys_start = 0x0d000000,
> +			.virt_start = 0x0d000000,
> +			.size = 0x01000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* PCIe DAT */ {
> +			.phys_start = 0x10000000,
> +			.virt_start = 0x10000000,
> +			.size = 0x10000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* C71 */ {
> +			.phys_start = 0x64800000,
> +			.virt_start = 0x64800000,
> +			.size = 0x00800000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* C66_0 */ {
> +			.phys_start = 0x4D80800000,
> +			.virt_start = 0x4D80800000,
> +			.size = 0x00800000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* C66_1 */ {
> +			.phys_start = 0x4D81800000,
> +			.virt_start = 0x4D81800000,
> +			.size = 0x00800000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* GPU */ {
> +			.phys_start = 0x4E20000000,
> +			.virt_start = 0x4E20000000,
> +			.size = 0x00080000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +
> +

extra line..

> +		/* MCU NAVSS */ {
> +			.phys_start = 0x28380000,
> +			.virt_start = 0x28380000,
> +			.size = 0x03880000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU First peripheral window */ {
> +			.phys_start = 0x40200000,
> +			.virt_start = 0x40200000,
> +			.size = 0x00999000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU CTRL_MMR0 */ {
> +			.phys_start = 0x40f00000,
> +			.virt_start = 0x40f00000,
> +			.size = 0x00020000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU R5F Core0 */ {
> +			.phys_start = 0x41000000,
> +			.virt_start = 0x41000000,
> +			.size = 0x00020000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU R5F Core1 */ {
> +			.phys_start = 0x41400000,
> +			.virt_start = 0x41400000,
> +			.size = 0x00020000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU SRAM */ {
> +			.phys_start = 0x41c00000,
> +			.virt_start = 0x41c00000,
> +			.size = 0x00100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU WKUP peripheral window */ {
> +			.phys_start = 0x42040000,
> +			.virt_start = 0x42040000,
> +			.size = 0x03ac3000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU MMRs, remaining NAVSS */ {
> +			.phys_start = 0x45100000,
> +			.virt_start = 0x45100000,
> +			.size = 0x00c24000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU CPSW */ {
> +			.phys_start = 0x46000000,
> +			.virt_start = 0x46000000,
> +			.size = 0x00200000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU OSPI register space */ {
> +			.phys_start = 0x47000000,
> +			.virt_start = 0x47000000,
> +			.size = 0x00068400,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU FSS OSPI0/1 data region 0 */ {
> +			.phys_start = 0x50000000,
> +			.virt_start = 0x50000000,
> +			.size = 0x10000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU FSS OSPI0 data region 3 */ {
> +			.phys_start = 0x500000000,
> +			.virt_start = 0x500000000,
> +			.size = 0x100000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU FSS OSPI1 data region 3 */ {
> +			.phys_start = 0x700000000,
> +			.virt_start = 0x700000000,
> +			.size = 0x100000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +

extra line...

> +		/* RAM - first bank*/ {
> +			.phys_start = 0x80000000,
> +			.virt_start = 0x80000000,
> +			.size = 0x80000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> +				JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* RAM - second bank */ {
> +			.phys_start = 0x880000000,
> +			.virt_start = 0x880000000,
> +			.size = 0x1fa00000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> +				JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* RAM - reserved for hypervisor */ {
> +			.phys_start = 0x89fa00000,
> +			.virt_start = 0x89fa00000,
> +			.size = 0x600000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},

Why do you need to map hypervisor memory here?

Thanks and regards,
Lokesh

> +		/* RAM - reserved for inmate */ {
> +			.phys_start = 0x8a0000000,
> +			.virt_start = 0x8a0000000,
> +			.size = 0x60000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +	},
> +	.irqchips = {
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 160,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 288,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 416,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 544,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 800,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		/* 0001:00:00.0 */ {
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 1,
> +			.bdf = 0x00,
> +			.bar_mask = {
> +				0xffffff00, 0xffffffff, 0x00000000,
> +				0x00000000, 0x00000000, 0x00000000,
> +			},
> +			.shmem_region = 0,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +		},
> +	},
> +};
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/05754d1d-ab11-a07d-ae5c-1c113e4b9fc6%40ti.com.
