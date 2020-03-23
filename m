Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYNV4LZQKGQEKTD7WYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id C353A18F390
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Mar 2020 12:17:54 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id z4sf754411ljj.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Mar 2020 04:17:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1584962274; cv=pass;
        d=google.com; s=arc-20160816;
        b=miwMO+W6EoFZqR0Ws/9XBnQLHvwJD7sDw/Ryn8bamT7qolhNMzrKguS24TJbzjLTHv
         mqRIE7p52laJ8NNxbryPaEntxDZkkvKRugnNWDzNRIYYMRuqPZGGr5bZbjWpkYd5qWed
         y5DDGeDzvQxFq1D59wYGTt6F4Te5+4i89y0uaNbRU5IrAxHmON9EBhvaDjXDjkyf48pv
         IviDlY1AectJ+KHcbQeVL5rdSyb0R/3xZg/akvqrX2HIWLaEl1AIgve1E8/83GKZqQ24
         7jUaY8g2bTL/wSbZvkFbttkyZXNhC1EKaDjcKDCzOzeiuxKvAUWBXzY6P4uwss27H//L
         0yBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=k8hvT8F68nTCB99pFiCpHqLTt3MFIB7N8a67DFDqBW0=;
        b=KvFsWP7WU7HSwJnpftVFjSKcOChKRXBCqZOCGSsYB+YuPJhBUXZgXEIqAE3f5+08M/
         zPjKvIeVkVJJsrdTw0+lFg6AKJeF8JGnTOFJmkXBzkUWElQ1zcc3hyAmJ58wbQ0MJEWJ
         GwXzYdk8ZHe8kMK3nNKBQWhQcriR9Uwjh1pPnD383gAjgoeVyr1Ft6eLkoTCiH/ehKUI
         ObJrSobcVYd0s5TQxUtztjHqShCb1yhP/t+tfsHP/cJ2xAliVt08LIa7xjXQT0JAXu2M
         hOAKDgPzY7dYNmVCx+VVqxymxB3Nujg6//i2LRtqtnLEX7cjqrmh9lPBc8UxkrsKlO8O
         QW1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=k8hvT8F68nTCB99pFiCpHqLTt3MFIB7N8a67DFDqBW0=;
        b=qlNCe2PRF9dC5TQ8WwgDMZpCrsZ5lXq3XD3lH8mBgAMM3zLuvJlR3Tj5nNhb5m36qE
         wfX9bvCLUdiikzSyPtDEityRjcUCM6V/TrK/aHIDdNis//UtEueUxgfwqX764b5eIoxn
         uJSfo4k7lJCq3iWx2jkI0KTik0SL2bYNo4eJUxjZD0/Fdi/AU1Lodvebr5rv/6S+/y8X
         mG8MH//g70eC85Hjpb/zNq68IzKOfGlkhRlJ8QESpcpXzWFUmTjb6vJOql9nN0exV4nm
         Bngmg2a1G3KLFHIC2zMk6bcRw9hx+MAc/yy7Ih10tcQ23/Fh6RM4Greh8dpEzII5hil8
         SUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=k8hvT8F68nTCB99pFiCpHqLTt3MFIB7N8a67DFDqBW0=;
        b=qrq45kA42nS/qfxBsCpheWyIj34disq1MxFo92IGcaLK+zrHS+/1P4SI0/UhvTQlw7
         KjXrQWlOV+od55ZHO3tuGX3iPHVMM034ZdEoC+F8aY7Z2/QbEDopJA8R8liEKytVpcD0
         yzKGkVIit4JB6ExlzHfC9McQHdrsoWZ117QUtMszteNnUbFpH7X/2u9JDTWiPmXzGL3C
         /9aogDPmCmZLj8aujiNlA+7BlYpbwn4lxB39pnf2mn0ufJMOigirLgLZ1iPaSlgiFuLk
         QtBnSs/JI2BBwuyLuv9qUQWjy662xGH2GOSkhHMqf2m2dD0d9s2T7cNQC8M1pJsGqxpJ
         hJKw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1WdcvYUZxiiCQ7DX2IMyDdeMQBbqx8AK7DeRJ9XxRIMKlPCWC0
	P/RnVQt+Ey+GzkdXLhgC0QA=
X-Google-Smtp-Source: ADFU+vt3rxfbtT+WcKdhJ2Tw4PhkIVh5DqRalOuDqglqq91kXIuhN3a2ImLy05Hf68fvo4uYzmxzXw==
X-Received: by 2002:a2e:b8c1:: with SMTP id s1mr1984156ljp.0.1584962274099;
        Mon, 23 Mar 2020 04:17:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1103:: with SMTP id l3ls1983957lfg.6.gmail; Mon, 23
 Mar 2020 04:17:53 -0700 (PDT)
X-Received: by 2002:a19:4f0c:: with SMTP id d12mr4150864lfb.117.1584962273234;
        Mon, 23 Mar 2020 04:17:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584962273; cv=none;
        d=google.com; s=arc-20160816;
        b=ccY11e7XOUMGsPK0YNaZOs2W7+mnomxJ+xcQAdtZhNcaSrwQjZD9Gyy/N82yoYtNfN
         YOnpt/KRsVLCTzL/JRUktpzdE+1ZTk95Kv1yfEJfEtntAP+i/KzumNppYqY0D9B83oVT
         YY5m+UtvsPtLXHIVcm9jtdFaU+hUhgAq+IUKOP+BGZzgu5WN3js9w+WIaytnKDgTfuKX
         woupgUz8+OyUk8VRHsDR5Fi7AJYxgJT/tDQtTDxKMBRXCY3vzwf+lPTAeeh9801MpZ+t
         v7lEYyeTNf3KX5w3XLeyPeXoJjUSY+fJdehCpkXz+wstp+c2VAl4GUCR8ETgUepfW+iE
         wIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=uNkWqBsDdRHb3P2aftARYPQKIhDh2K5LHN3SbwnDYLs=;
        b=BBurAjVqg8EyQQgpbDCfXXoAqJzPWqDn2deJu17XEM3LmYNqW36yXDIKbNovmx3Ikg
         fcYzMHNWr0UBKSZPvGWDXZ0pnywI/fwnOb+azS/JjCIE51fx8s0dD8XNtAbomySOzV+z
         QSTATX05tyjaf+y0O8UDv7olCFCTLTmbN0X7mXLgXMGEHyx0L63ckyjKLqMIKBD969LT
         86hgG3L8PpniQXsDlSMUl87RvGCzn/0w9LWkthL1pCwFbYrE3YoTfX7qY+zL4iAFkGjc
         jNEpcIK32zHuQnazfIRBqoMz/tpPayC990idyqrqJFS9y0VrPl3f+Hh3c1SZefYRBjYJ
         Dd7A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id s22si635765ljp.0.2020.03.23.04.17.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Mar 2020 04:17:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 02NBHpIh017433
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Mar 2020 12:17:52 +0100
Received: from [139.21.64.131] ([139.21.64.131])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02NBHnFb004969;
	Mon, 23 Mar 2020 12:17:50 +0100
Subject: Re: [PATCH 1/2] Cell configs for imx8mq EVK board.
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200324164343.13403-1-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7e8822cd-d73b-8197-7bbd-2adab6fa47ac@siemens.com>
Date: Mon, 23 Mar 2020 12:17:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200324164343.13403-1-alice.guo@nxp.com>
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

On 24.03.20 17:43, Alice Guo wrote:
    ^^^^^^^^^^^^^^

Someone is time-traveling here - will life be better in the future? ;)

> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>   configs/arm64/imx8mq-inmate-demo.c  |   4 +-
>   configs/arm64/imx8mq-ivshmem-demo.c | 124 ++++++++++++++++++++++

Why do we need a separate config for ivshmem? Can't you fold that into 
inmate-demo.c, like we do in the other targets?

This also applies to the second patch.

Jan

>   configs/arm64/imx8mq-linux-demo.c   | 158 ++++++++++++++++++++++++++++
>   configs/arm64/imx8mq.c              |  93 ++++++++++++++--
>   4 files changed, 369 insertions(+), 10 deletions(-)
>   create mode 100644 configs/arm64/imx8mq-ivshmem-demo.c
>   create mode 100644 configs/arm64/imx8mq-linux-demo.c
> 
> diff --git a/configs/arm64/imx8mq-inmate-demo.c b/configs/arm64/imx8mq-inmate-demo.c
> index 8c1ad624..af57ebe9 100644
> --- a/configs/arm64/imx8mq-inmate-demo.c
> +++ b/configs/arm64/imx8mq-inmate-demo.c
> @@ -1,7 +1,7 @@
>   /*
>    * iMX8MQ target - inmate demo
>    *
> - * Copyright NXP 2018
> + * Copyright 2018-2019 NXP
>    *
>    * Authors:
>    *  Peng Fan <peng.fan@nxp.com>
> @@ -50,7 +50,7 @@ struct {
>   				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>   		},
>   		/* RAM: Top at 4GB Space */ {
> -			.phys_start = 0xffaf0000,
> +			.phys_start = 0xc0000000,
>   			.virt_start = 0,
>   			.size = 0x00010000,
>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> diff --git a/configs/arm64/imx8mq-ivshmem-demo.c b/configs/arm64/imx8mq-ivshmem-demo.c
> new file mode 100644
> index 00000000..d7b8f0a6
> --- /dev/null
> +++ b/configs/arm64/imx8mq-ivshmem-demo.c
> @@ -0,0 +1,124 @@
> +/*
> + * iMX8MQ target - ivshmem-demo
> + *
> + * Copyright 2018 NXP
> + *
> + * Authors:
> + *  Peng Fan <peng.fan@nxp.com>
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
> +	struct jailhouse_irqchip irqchips[1];
> +	struct jailhouse_pci_device pci_devices[1];
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = "ivshmem-demo",
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> +
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
> +		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +		.vpci_irq_base = 108, /* Not include 32 base */
> +
> +		.console = {
> +			.address = 0x30860000,
> +			.type = JAILHOUSE_CON_TYPE_IMX,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_REGDIST_4,
> +		},
> +	},
> +
> +	.cpus = {
> +		0x8,
> +	},
> +
> +	.mem_regions = {
> +		/* IVHSMEM shared memory region for 00:00.0 */ {
> +			.phys_start = 0xbfd00000,
> +			.virt_start = 0xbfd00000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbfd01000,
> +			.virt_start = 0xbfd01000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbfd0a000,
> +			.virt_start = 0xbfd0a000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbfd0c000,
> +			.virt_start = 0xbfd0c000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbfd0e000,
> +			.virt_start = 0xbfd0e000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* UART1 */ {
> +			.phys_start = 0x30860000,
> +			.virt_start = 0x30860000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM: Bottom at 4GB Space */ {
> +			.phys_start = 0xc0000000,
> +			.virt_start = 0,
> +			.size = 0x00010000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* communication region */ {
> +			.virt_start = 0x80000000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_COMM_REGION,
> +		},
> +	},
> +
> +	.irqchips = {
> +		/* GIC */ {
> +			.address = 0x38800000,
> +			.pin_base = 128,
> +			.pin_bitmap = {
> +				0x1 << (108 + 32 - 128) /* SPI 109 */
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		{ /* IVSHMEM 00:00.0 (demo) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 1,
> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 1,
> +			.shmem_peers = 1,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +	},
> +};
> diff --git a/configs/arm64/imx8mq-linux-demo.c b/configs/arm64/imx8mq-linux-demo.c
> new file mode 100644
> index 00000000..a59dd934
> --- /dev/null
> +++ b/configs/arm64/imx8mq-linux-demo.c
> @@ -0,0 +1,158 @@
> +/*
> + * iMX8MQ target - linux-demo
> + *
> + * Copyright 2018 NXP
> + *
> + * Authors:
> + *  Peng Fan <peng.fan@nxp.com>
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
> +	struct jailhouse_memory mem_regions[15];
> +	struct jailhouse_irqchip irqchips[2];
> +	struct jailhouse_pci_device pci_devices[2];
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = "linux-inmate-demo",
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> +
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
> +		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +		.vpci_irq_base = 108, /* Not include 32 base */
> +	},
> +
> +	.cpus = {
> +		0xc,
> +	},
> +
> +	.mem_regions = {
> +		/* IVHSMEM shared memory region for 00:00.0 */ {
> +			.phys_start = 0xbfd00000,
> +			.virt_start = 0xbfd00000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbfd01000,
> +			.virt_start = 0xbfd01000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbfd0a000,
> +			.virt_start = 0xbfd0a000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbfd0c000,
> +			.virt_start = 0xbfd0c000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbfd0e000,
> +			.virt_start = 0xbfd0e000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xbfe00000, 1),
> +		/* UART1 earlycon */ {
> +			.phys_start = 0x30860000,
> +			.virt_start = 0x30860000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* UART2 */ {
> +			.phys_start = 0x30890000,
> +			.virt_start = 0x30890000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* SHDC1 */ {
> +			.phys_start = 0x30b40000,
> +			.virt_start = 0x30b40000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM: Top at 4GB Space */ {
> +			.phys_start = 0xbff00000,
> +			.virt_start = 0,
> +			.size = 0x10000, /* 64KB */
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* RAM: Top at 4GB Space */ {
> +			.phys_start = 0xc0000000,
> +			.virt_start = 0xc0000000,
> +			.size = 0x3dc00000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> +				JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* communication region */ {
> +			.virt_start = 0x80000000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_COMM_REGION,
> +		},
> +	},
> +
> +	.irqchips = {
> +		/* uart2/sdhc1 */ {
> +			.address = 0x38800000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				(1 << (27 + 32 - 32)) | (1 << (22 + 32 - 32))
> +			},
> +		},
> +		/* IVSHMEM */ {
> +			.address = 0x38800000,
> +			.pin_base = 128,
> +			.pin_bitmap = {
> +				0x1 << (108 + 32 - 128) /* SPI 109 */
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		{ /* IVSHMEM 00:00.0 (demo) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 1,
> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 2,
> +			.shmem_peers = 3,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +		{ /* IVSHMEM 00:01.0 (networking) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 0,
> +			.bdf = 1 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 5,
> +			.shmem_dev_id = 1,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +		},
> +	},
> +};
> diff --git a/configs/arm64/imx8mq.c b/configs/arm64/imx8mq.c
> index 7d113264..3292bd29 100644
> --- a/configs/arm64/imx8mq.c
> +++ b/configs/arm64/imx8mq.c
> @@ -1,7 +1,7 @@
>   /*
>    * i.MX8MQ Target
>    *
> - * Copyright 2017 NXP
> + * Copyright 2017-2018 NXP
>    *
>    * Authors:
>    *  Peng Fan <peng.fan@nxp.com>
> @@ -18,25 +18,31 @@
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[4];
> +	struct jailhouse_memory mem_regions[14];
>   	struct jailhouse_irqchip irqchips[3];
> +	struct jailhouse_pci_device pci_devices[2];
>   } __attribute__((packed)) config = {
>   	.header = {
>   		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>   		.revision = JAILHOUSE_CONFIG_REVISION,
>   		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
>   		.hypervisor_memory = {
> -			.phys_start = 0xffc00000,
> +			.phys_start = 0xfdc00000,
>   			.size =       0x00400000,
>   		},
>   		.debug_console = {
>   			.address = 0x30860000,
>   			.size = 0x1000,
>   			.type = JAILHOUSE_CON_TYPE_IMX,
> -			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +			.flags = JAILHOUSE_CON_TYPE_IMX |
> +				 JAILHOUSE_CON_ACCESS_MMIO |
>   				 JAILHOUSE_CON_REGDIST_4,
>   		},
>   		.platform_info = {
> +			.pci_mmconfig_base = 0xbfb00000,
> +			.pci_mmconfig_end_bus = 0,
> +			.pci_is_virtual = 1,
> +
>   			.arm = {
>   				.gic_version = 3,
>   				.gicd_base = 0x38800000,
> @@ -47,9 +53,11 @@ struct {
>   		.root_cell = {
>   			.name = "imx8mq",
>   
> +			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
>   			.cpu_set_size = sizeof(config.cpus),
>   			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
>   			.num_irqchips = ARRAY_SIZE(config.irqchips),
> +			.vpci_irq_base = 51, /* Not include 32 base */
>   		},
>   	},
>   
> @@ -58,6 +66,38 @@ struct {
>   	},
>   
>   	.mem_regions = {
> +		/* IVHSMEM shared memory region for 00:00.0 */ {
> +			.phys_start = 0xbfd00000,
> +			.virt_start = 0xbfd00000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ ,
> +		},
> +		{
> +			.phys_start = 0xbfd01000,
> +			.virt_start = 0xbfd01000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
> +		},
> +		{
> +			.phys_start = 0xbfd0a000,
> +			.virt_start = 0xbfd0a000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
> +		},
> +		{
> +			.phys_start = 0xbfd0c000,
> +			.virt_start = 0xbfd0c000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		{
> +			.phys_start = 0xbfd0e000,
> +			.virt_start = 0xbfd0e000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xbfe00000, 0),
>   		/* MMIO (permissive) */ {
>   			.phys_start = 0x00000000,
>   			.virt_start = 0x00000000,
> @@ -68,14 +108,28 @@ struct {
>   		/* RAM */ {
>   			.phys_start = 0x40000000,
>   			.virt_start = 0x40000000,
> -			.size = 0xbfb00000,
> +			.size = 0x7fb00000,
>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>   				JAILHOUSE_MEM_EXECUTE,
>   		},
> -		/* IVSHMEM shared memory region for 00:00.0 */ {
> -			.phys_start = 0xffb00000,
> -			.virt_start = 0xffb00000,
> +		/* Linux Loader */{
> +			.phys_start = 0xbff00000,
> +			.virt_start = 0xbff00000,
>   			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* Inmate memory */{
> +			.phys_start = 0xc0000000,
> +			.virt_start = 0xc0000000,
> +			.size = 0x3dc00000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* OP-TEE reserved memory */{
> +			.phys_start = 0xfe000000,
> +			.virt_start = 0xfe000000,
> +			.size = 0x2000000,
>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>   		},
>   	},
> @@ -103,4 +157,27 @@ struct {
>   			},
>   		},
>   	},
> +
> +	.pci_devices = {
> +		{ /* IVSHMEM 0000:00:00.0 (demo) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 0,
> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 0,
> +			.shmem_peers = 3,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +		{ /* IVSHMEM 0000:00:01.0 (networking) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 0,
> +			.bdf = 1 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 5,
> +			.shmem_dev_id = 0,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +		},
> +	},
>   };
> 


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7e8822cd-d73b-8197-7bbd-2adab6fa47ac%40siemens.com.
