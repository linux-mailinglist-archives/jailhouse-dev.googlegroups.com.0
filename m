Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTWCW72AKGQE7V2JSWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 137121A2421
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Apr 2020 16:36:01 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id bm26sf1983318edb.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Apr 2020 07:36:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586356560; cv=pass;
        d=google.com; s=arc-20160816;
        b=NNAdhuWBLR3D/1OG3QNq3qURITsx2dvJiW/YsAEbCneHhJ/Mihn3OrRJCdoR4jpCPw
         JYFDAK6RCvy+nIL68hw5BpVGORJZ5cFj2KyAvY86THaZubxsas5iW7MYH+b5/qv1neaN
         e87drh8aE7bg4EkJ7mxEfRG/hImAYKRLrr/quih7GcfaWE95yNvhP9REGbNpCpbk6n4Y
         34n9LKkHQ+1CTrx5jYCsJPKnnrFFQD76tkVwVgaXc6pLElgq0961BbpPuFdqO5HJT1mX
         9sWempKd+V5tieUjY+KnmMkKnkbLefjhYE7uwL/4S0WebNJKrZlPk26rkMycqj5ndqsH
         BvKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=bZZmhKiA1GkNCddCrGNL0NDrcE0hZfq5fOQEwlawoRY=;
        b=XP0fAt3Y1fMQzf1BrJ/hdbD2/iG6da3n0lQP2h1TQCmbsixykKZf6qnlAkxjKydG1n
         i5xkZpSaZOhXj0mxiSF2JhJzvCksL+oy+KXelnU9nlYDkbWxZhVxSh1ODDNwj1a27OAI
         /z1Gp8IHz8QaxWbVoM8t+CO0PkrBw64U1lN3iPAbg5ZrpWYRnzdTXplT7vMQl7VRP/3b
         7tqfZoUrHCqspWqnVnLt8b7f5/OnEwlDDdJhi8wyX6WJUOE4NMFGU0fgN0r9kfCLOxaK
         YYka38VS8/+5PkWnHW1KgW50MB6CoDAA/QtwZECch61XwFD3+w04psB75ScSpnE+Uqet
         YCbQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bZZmhKiA1GkNCddCrGNL0NDrcE0hZfq5fOQEwlawoRY=;
        b=ZKyYqE8iClAwDQJKK7IpD3Fyx++8AJflj7XGaqJuoqDvO1G9gmVNBzuhjW+onkso5n
         4HiV22hzBdqcvCyHoZ2iDvFq3biOi+ghvvVbsrsXkOpwGBvzAsWZZwKq6ftRG/jE2YJJ
         zhLoFV4OMEicTjIAkXSbVe7XdQwxBXBV5BrUixpManhwxUxd6UG0zJFR9qldnk+ntx90
         X8ni/oTh2jKUXKt0M4d2b7ZDkSBjJVOqhE/QTuU6J4ZynRDmokiSToGNm+EwohyW3ca6
         YuTADYxGm3pEKfHRx0xmPc39ndBzsjfkbUrQqZOh/eja1XNIxOv1IogrngGsL3V4myZQ
         UfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bZZmhKiA1GkNCddCrGNL0NDrcE0hZfq5fOQEwlawoRY=;
        b=hgH4/85qTA4RghkXsVRLJWZ8h7U+njTodyqxjOEpo6nNkAW+biOaHGo18s171VtQv4
         IrZIjvm3Nuiq/kRS/pWUJHpvMMeYvf4b+hZDMPiqMbAOEzPms8yJhoTpfa88caCza6+y
         YEwetU4sfYQtzsrT3+ZvlzyTKb+uWvFG+XAda/V3IpITerLCpDaUNs7jH969rBL1wdCo
         toQnT2C/IjF309L8qBu8O+/2SzzEOMCeRqio7FF5dm0mO2CJwHEMvcQo2XVlBsp8gdRc
         phDi9NZY5F7sv+xonQyuMhcxX4APwkFqqyiOm6kt59ot+wDmdBM6ZGAjc+R2upEqvpvY
         fBtw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Pub9/Fle43YugX3g6T1RucpZ319VbCFswz3lnGYm0tpS8aiYpMyy
	NkPY79j4+2sw7JB8vaQbzYI=
X-Google-Smtp-Source: APiQypIkMROgG4ZFPxzC7FKcT4TYDf89mELCssOCQ8ODDwDrLaP5JhN6gZFZ4erq1j+TeMUz5jDE3g==
X-Received: by 2002:a05:6402:1a32:: with SMTP id be18mr3226215edb.245.1586356559919;
        Wed, 08 Apr 2020 07:35:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c1cc:: with SMTP id d12ls2313845edp.2.gmail; Wed, 08 Apr
 2020 07:35:58 -0700 (PDT)
X-Received: by 2002:a1c:750f:: with SMTP id o15mr5141459wmc.110.1586356558021;
        Wed, 08 Apr 2020 07:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586356558; cv=none;
        d=google.com; s=arc-20160816;
        b=QyioItUfPVjrU+dbmAtl/5FO7x0q7ajIDReuA0xnn9fG+RpmMhe+18CKfexd4O7T6r
         5grmEt5qRRxM/aHz25zXUnBHbtyXYilS+VpnQ4CyQpRKelPF0vVZP/06q/IVnoW2Ypms
         o7Q6y/Otj/FI2vE5MrPWVSm+6Fivg3UfeALads5JwyCYs2myKxLEcTlXkR266oelB+d6
         2MC8V2nRgaVFmkBA2IwDsTQdFR79eLgCnVqZSPkK+Y9W/5XSmTNb2QInNx3FHewGfr5p
         cZh+s2DnGomgP5K2Gey7DGHARsJycR8ipsdp0OWqYJcdEiwAyOZr8rOU5VD6miOZ0HE8
         vz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=kpcX1USYkTHh67UGMbfi+rOy6Ot1RebQHpWrtXZHbRY=;
        b=yalZZlpEwzDPj2EHuojZJNB/das2RJaE3G7kVwZg1X/nciUJWqfCsOEsDn1DKv+LPX
         g4vOEy+LG+ncY1DwftHVDhJLYylToR2y/1ZkpBB2xXyYsS4ohwsj+HnRlbIAiBgdXxJE
         NPIM5gviRs2flo1V520KtZvuiu/IkZM9l/V6SQANIO0viQ0NirJM4yulUsF0NA+b44sy
         wdkwOaM9g6LtGEbFMJ5VizbGZRLDSdqjEnefUEGUKt45jKxidRqNRxAI90++L7pIJmYa
         snqB0M5rIgDdVEfe/l+mXUWOHqPyKnb5E9vQvSOikcjae2JBSel92GX6hrgppIeUdbcw
         Xntw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id u16si7746wmd.2.2020.04.08.07.35.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Apr 2020 07:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 038EZvcG012825
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Apr 2020 16:35:57 +0200
Received: from [167.87.240.97] ([167.87.240.97])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 038EZu1K032638;
	Wed, 8 Apr 2020 16:35:56 +0200
Subject: Re: [PATCH V3 2/2] Cell configs for imx8mm EVK board.
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200409140447.4244-1-alice.guo@nxp.com>
 <20200409140447.4244-2-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2248d1f8-eebe-87f3-cdcc-3d545c6399ae@siemens.com>
Date: Wed, 8 Apr 2020 16:35:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200409140447.4244-2-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 09.04.20 16:04, Alice Guo wrote:
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>   configs/arm64/imx8mm-inmate-demo.c | 125 ++++++++++++++++++
>   configs/arm64/imx8mm-linux-demo.c  | 165 +++++++++++++++++++++++
>   configs/arm64/imx8mm.c             | 203 +++++++++++++++++++++++++++++
>   3 files changed, 493 insertions(+)
>   create mode 100644 configs/arm64/imx8mm-inmate-demo.c
>   create mode 100644 configs/arm64/imx8mm-linux-demo.c
>   create mode 100644 configs/arm64/imx8mm.c
> 
> diff --git a/configs/arm64/imx8mm-inmate-demo.c b/configs/arm64/imx8mm-inmate-demo.c
> new file mode 100644
> index 00000000..5791b945
> --- /dev/null
> +++ b/configs/arm64/imx8mm-inmate-demo.c
> @@ -0,0 +1,125 @@
> +/*
> + * iMX8MM target - gic-demo
> + *
> + * Copyright 2020 NXP
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
> +	struct jailhouse_memory mem_regions[8];
> +	struct jailhouse_irqchip irqchips[1];
> +	struct jailhouse_pci_device pci_devices[1];
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = "inmate-demo",
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> +
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
> +		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +		.vpci_irq_base = 76,
> +
> +		.console = {
> +			.address = 0x30890000,
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
> +		/* IVSHMEM shared memory regions (demo) */
> +		{
> +			.phys_start = 0xbba00000,
> +			.virt_start = 0xbba00000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbba01000,
> +			.virt_start = 0xbba01000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbba0a000,
> +			.virt_start = 0xbba0a000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbba0c000,
> +			.virt_start = 0xbba0c000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbba0e000,
> +			.virt_start = 0xbba0e000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* UART2 */ {
> +			.phys_start = 0x30890000,
> +			.virt_start = 0x30890000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM: start from the bottom of inmate memory */ {
> +			.phys_start = 0xb3c00000,
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
> +			.pin_base = 96,
> +			.pin_bitmap = {
> +				0x1 << (76 + 32 - 96) /* SPI 76 */
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
> diff --git a/configs/arm64/imx8mm-linux-demo.c b/configs/arm64/imx8mm-linux-demo.c
> new file mode 100644
> index 00000000..a3e85c0a
> --- /dev/null
> +++ b/configs/arm64/imx8mm-linux-demo.c
> @@ -0,0 +1,165 @@
> +/*
> + * iMX8MM target - linux-demo
> + *
> + * Copyright 2020 NXP
> + *
> + * Authors:
> + *  Peng Fan <peng.fan@nxp.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +/*
> + * Boot 2nd Linux cmdline:
> + * export PATH=$PATH:/usr/share/jailhouse/tools/
> + * jailhouse cell linux imx8mm-linux-demo.cell Image -d fsl-imx8mm-evk-inmate.dtb -c "clk_ignore_unused console=ttymxc3,115200 earlycon=ec_imx6q,0x30890000,115200  root=/dev/mmcblk2p2 rootwait rw"
> + */
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
> +		.vpci_irq_base = 74, /* Not include 32 base */
> +	},
> +
> +	.cpus = {
> +		0xc,
> +	},
> +
> +	.mem_regions = {
> +		/* IVHSMEM shared memory region for 00:00.0 */ {
> +			.phys_start = 0xbba00000,
> +			.virt_start = 0xbba00000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ ,
> +		},
> +		{
> +			.phys_start = 0xbba01000,
> +			.virt_start = 0xbba01000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
> +		},
> +		{
> +			.phys_start = 0xbba0a000,
> +			.virt_start = 0xbba0a000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
> +		},
> +		{
> +			.phys_start = 0xbba0c000,
> +			.virt_start = 0xbba0c000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		{
> +			.phys_start = 0xbba0e000,
> +			.virt_start = 0xbba0e000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xbbb00000, 0),
> +		/* UART2 earlycon */ {
> +			.phys_start = 0x30890000,
> +			.virt_start = 0x30890000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* UART4 */ {
> +			.phys_start = 0x30a60000,
> +			.virt_start = 0x30a60000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* SHDC1 */ {
> +			.phys_start = 0x30b60000,
> +			.virt_start = 0x30b60000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* RAM: Top at 4GB Space */ {
> +			.phys_start = 0xbb700000,
> +			.virt_start = 0,
> +			.size = 0x10000, /* 64KB */
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* RAM */ {
> +			/*
> +			 * We could not use 0x80000000 which conflicts with
> +			 * COMM_REGION_BASE
> +			 */
> +			.phys_start = 0x93c00000,
> +			.virt_start = 0x93c00000,
> +			.size = 0x24000000,
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
> +				(1 << (24 + 32 - 32)) | (1 << (29 + 32 - 32))
> +			},
> +		},
> +		/* IVSHMEM */ {
> +			.address = 0x38800000,
> +			.pin_base = 96,
> +			.pin_bitmap = {
> +				0xf << (74 + 32 - 96)
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
> diff --git a/configs/arm64/imx8mm.c b/configs/arm64/imx8mm.c
> new file mode 100644
> index 00000000..88365919
> --- /dev/null
> +++ b/configs/arm64/imx8mm.c
> @@ -0,0 +1,203 @@
> +/*
> + * i.MX8MM Target
> + *
> + * Copyright 2020 NXP
> + *
> + * Authors:
> + *  Peng Fan <peng.fan@nxp.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Reservation via device tree: reg = <0x0 0xffaf0000 0x0 0x510000>
> + */
> +
> +#include <jailhouse/types.h>
> +#include <jailhouse/cell-config.h>
> +
> +struct {
> +	struct jailhouse_system header;
> +	__u64 cpus[1];
> +	struct jailhouse_memory mem_regions[16];
> +	struct jailhouse_irqchip irqchips[3];
> +	struct jailhouse_pci_device pci_devices[2];
> +} __attribute__((packed)) config = {
> +	.header = {
> +		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> +		.hypervisor_memory = {
> +			.phys_start = 0xb7c00000,
> +			.size =       0x00400000,
> +		},
> +		.debug_console = {
> +			.address = 0x30890000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_CON_TYPE_IMX |
> +				 JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_REGDIST_4,
> +			.type = JAILHOUSE_CON_TYPE_IMX,
> +		},
> +		.platform_info = {
> +			/*
> +			 * .pci_mmconfig_base is fixed; if you change it,
> +			 * update the value in mach.h
> +			 * (PCI_CFG_BASE) and regenerate the inmate library
> +			 */
> +			.pci_mmconfig_base = 0xbb800000,
> +			.pci_mmconfig_end_bus = 0,
> +			.pci_is_virtual = 1,
> +			.pci_domain = 0,
> +
> +			.arm = {
> +				.gic_version = 3,
> +				.gicd_base = 0x38800000,
> +				.gicr_base = 0x38880000,
> +				.maintenance_irq = 25,
> +			},
> +		},
> +		.root_cell = {
> +			.name = "imx8mm",
> +
> +			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +			.cpu_set_size = sizeof(config.cpus),
> +			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +			.num_irqchips = ARRAY_SIZE(config.irqchips),
> +			.vpci_irq_base = 51, /* Not include 32 base */
> +		},
> +	},
> +
> +	.cpus = {
> +		0xf,
> +	},
> +
> +	.mem_regions = {
> +		/* IVHSMEM shared memory region for 00:00.0 */ {
> +			.phys_start = 0xbba00000,
> +			.virt_start = 0xbba00000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ ,
> +		},
> +		{
> +			.phys_start = 0xbba01000,
> +			.virt_start = 0xbba01000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
> +		},
> +		{
> +			.phys_start = 0xbba0a000,
> +			.virt_start = 0xbba0a000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
> +		},
> +		{
> +			.phys_start = 0xbba0c000,
> +			.virt_start = 0xbba0c000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		{
> +			.phys_start = 0xbba0e000,
> +			.virt_start = 0xbba0e000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xbbb00000, 0),
> +		/* IO */ {
> +			.phys_start = 0x00000000,
> +			.virt_start = 0x00000000,
> +			.size =	      0x40000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* RAM 00*/ {
> +			.phys_start = 0x40000000,
> +			.virt_start = 0x40000000,
> +			.size = 0x73c00000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* Inmate memory */{
> +			.phys_start = 0xb3c00000,
> +			.virt_start = 0xb3c00000,
> +			.size = 0x04000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* RAM 01 */ {
> +			.phys_start = 0xb8000000,
> +			.virt_start = 0xb8000000,
> +			.size = 0x03700000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* Loader */{
> +			.phys_start = 0xbb700000,
> +			.virt_start = 0xbb700000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* RAM 02 */ {
> +			.phys_start = 0xbbc00000,
> +			.virt_start = 0xbbc00000,
> +			.size = 0x02400000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* OP-TEE reserved memory */{
> +			.phys_start = 0xbe000000,
> +			.virt_start = 0xbe000000,
> +			.size = 0x2000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +	},
> +
> +	.irqchips = {
> +		/* GIC */ {
> +			.address = 0x38800000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +		/* GIC */ {
> +			.address = 0x38800000,
> +			.pin_base = 160,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +		/* GIC */ {
> +			.address = 0x38800000,
> +			.pin_base = 288,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +	},
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
> +};
> 

Thanks, applied both to next now. In patch 1, I also updated the dates 
as discussed.

BTW, when sending new versions of a patch, it is helpful for the 
reviewers to have a brief changelog to the previous version included 
(below the "--" separator).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2248d1f8-eebe-87f3-cdcc-3d545c6399ae%40siemens.com.
