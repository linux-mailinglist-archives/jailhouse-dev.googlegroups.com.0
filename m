Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVWH57YQKGQEFIOF7SY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B2815417F
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Feb 2020 11:00:54 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id m4sf2384912wmi.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Feb 2020 02:00:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580983254; cv=pass;
        d=google.com; s=arc-20160816;
        b=SLZ/PjUtomxLljqyFB6nWHorEQ2kWtp0I91oTMa5BgMOfcnTJeouP0Iqd5jDSd2Ccm
         XkejdJU7HDzzaS4kh2o2u0p7o8TIlqB/0H4067rXhmdv2Rv7mZNvunSQWlRV8YYtwz2S
         Z4z+fdPmJA7A80teWXEyEK8zRSqZ0c55BgI0YhfG8iQuiZYj/WlA1eX8KaQYE7P2lxBi
         2qcJJIuW87lHSiVGu8JOMuRk+0AYjIBfyyuMnoZaL+lFmEBPYSUWEC6MAQi9h3jy3eSe
         bN3uFQzP6W5PWHHcJkjf/NSmNf7regsnaVnFK3dgHmn1LHZIXKCUkpEGsTCCZDTwZI0z
         GU4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=pD17VAtlIMaQJXlvG4Q3uTQo8bySaVMMlznvtjM/m+o=;
        b=fE734jCX/PpnLKg+c/Gk9UPLodEpAWWfsBETnU1biWRs4x9Ube5Do1ZQK1COJMkr/0
         vaWqbWbRuH5/C5O+eKS7DGxXQR85/DOZcFbyGKjVjGN4hYHz0z4HXhcCqcsozttQR6LM
         mr2QRhQLdWDwjTiZy0/E5ZbK8JoWa2OAeAcVgP4CW6P66ocrWjqOxdLDTi5fnyivQPDx
         AN85S9+jeHUf1FxZ2cLJ3s+iPxe9LDG2NSt1PLPB1jk6Am20uaq93+YZov5Jlqg0xowr
         +AxhSmPUrouc7fE2mmIzT3bIK3gTfY+/vAXk0GJPyCOiJyMpQDMidkoFgEmuE53ntxTC
         pBag==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pD17VAtlIMaQJXlvG4Q3uTQo8bySaVMMlznvtjM/m+o=;
        b=YhSy0bsQjEPVKvmYRbLh9ayRb65p9CvI0i8NQgiMlwosX+Eq1R0uBE6bCqeg/YWHha
         CZmc3uY086tQdpembZg7rwRTdxQ/ukVETpNHk68ibw+l+c/zo9tzYEzeU0KwiRAqkqqo
         KWrwsGzYDuYOmIvjoRaFxCFfUnXGla/LJee5M29AmUxshPMrNECUraZPMfcbqTlmTOuz
         z++2KYD8HHPh0razDcoARbzU/SwxQJiC/pmfNlO7WvxSfq+my00s9CeO8/jxyXlAhXcN
         amKFfyqqeHlDHIsAvG2F5tNfbHtqCzlEJck3+K3yz3FQM2v52ugDRm7doUYbw+avdMZU
         I0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pD17VAtlIMaQJXlvG4Q3uTQo8bySaVMMlznvtjM/m+o=;
        b=l3mL0azm45wBrB8zTwOnizLTBxMlA4zRw0u7qoJkYjjfiVognE72KnIsVS1RfKjHgY
         q2ak5vr1DxdFO2q3VqAweNnL3UaUVJSQmKd/tupIzLz1UVNZ7BYLKWgt9VZYZ2u8pETM
         k03B1qcvzqFTh9xfOVQmqOfB0dsF1TZOydZYwI1T9nyvNo654TEFBNhHDKJ55OwoFJNY
         RvmPTYrpS7vZZyQ4NkXlVb1xJieG6q7zMF/m+1eUOEH+RlnoYRtd6DA/Fb6LXmtfY/cC
         ZUvbAdpdsckBojMm95DEXCLR8h/rS/i/nqJ+LX+tzT3V5BjoE14spKZgfP9eBzMSftVp
         VRgw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUZYTMH3HlVpa3+miiWzyoFrewxQFlCBwE1gbSQZpLhQYiZUpqE
	jlfcHGe8WMH8aK24r6V3xTY=
X-Google-Smtp-Source: APXvYqwhv6fL2e03SYBY4TwI8f5hp7nxbXH3tFGCznk/3fvW58N3dHlgroGhga1oPI+IuMlkrdpZYQ==
X-Received: by 2002:a05:6000:50:: with SMTP id k16mr2819418wrx.145.1580983254400;
        Thu, 06 Feb 2020 02:00:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb4c:: with SMTP id u12ls3426844wrn.6.gmail; Thu, 06 Feb
 2020 02:00:53 -0800 (PST)
X-Received: by 2002:adf:f7c6:: with SMTP id a6mr3122132wrq.164.1580983253462;
        Thu, 06 Feb 2020 02:00:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580983253; cv=none;
        d=google.com; s=arc-20160816;
        b=n2Lz41S2Ht9bp72QVufc+LBm6+GttaWE00PzvQSGzpohNZAJwUi1J12+4i8hBZfr/+
         lL2QS3xzhrOLnW00/cy2zzIV7HBK5tjUiKOLk4EXuaTV6qeH7UwbO2HiTnIt+Kb+zIdP
         FGJT64L2LEHkR0wb79EWDq2jjZ/eBl7jXkPsV/A6UFUOn/kxUdcnyZPN9y13bl3VvPRK
         iHxKpiXUP1VkDaodAfYBEBHqdlH3vlizzM/Ees8v7X9skW39xWnwh1nOWjg1+qftjIe9
         2uJTIOKUs6KvH8GIXFM+AfHhb8hcsGnZhmSbPmCOXQJxv0Kr+8/CKngfbLC39+IT3PcP
         6W3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=V/AvTbyuqkvizXd9uHPUJQp7dO+RB1wPZqRzjH/wdLU=;
        b=HJfey6OzJ/pPu3yN25//ZIuNqdoDzkzrUk9n3aBVTo+eT+74gxDMfldZ+vsU5iVdA5
         jQZzizRIifBdX2BllL6hXDJqIt3drDKGbkzm4hCHj5jTFFRTyo5qf86Bm3Z9vFj1idTL
         TPG3993UT+xcZ5PHKG9Mo/eL1tKgQS3s3ZEIihfOJ7xrYTRBZ6fRZb2lDaDe0g2F3+Ua
         wJ2p8pI9B7eCMSoZ8Pm+QVtaSGdiUkt1GxCq1OKIoGKBesNd9gsH9KRJo/hxFQ+FWqjP
         QoNlehEfv4lB2QbpbNzqtxxQZr5OxyfLAv8y+pWO7BlgjVhoeF0dACmI2YPgUinp7fNi
         ZqvQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id u9si115898wri.3.2020.02.06.02.00.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Feb 2020 02:00:53 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 016A0qTd005936
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2020 11:00:52 +0100
Received: from [139.22.120.131] ([139.22.120.131])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 016A0qqF008201;
	Thu, 6 Feb 2020 11:00:52 +0100
Subject: Re: [PATCH v3 2/3] configs/arm64: Add inmate demo for pine64-plus
 board
To: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>,
        jailhouse-dev@googlegroups.com
References: <20200204101313.2495-1-vijaikumar.kanagarajan@gmail.com>
 <20200204101313.2495-3-vijaikumar.kanagarajan@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <512cf9ab-a1ea-7b1e-a4c5-4f81afb0280d@siemens.com>
Date: Thu, 6 Feb 2020 11:00:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200204101313.2495-3-vijaikumar.kanagarajan@gmail.com>
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

On 04.02.20 11:13, Vijai Kumar K wrote:
> - GIC demo and ivshmem-demo are validated.
> 
> Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> ---
>  configs/arm64/pine64-plus-inmate-demo.c | 131 ++++++++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 configs/arm64/pine64-plus-inmate-demo.c
> 
> diff --git a/configs/arm64/pine64-plus-inmate-demo.c b/configs/arm64/pine64-plus-inmate-demo.c
> new file mode 100644
> index 00000000..0564412d
> --- /dev/null
> +++ b/configs/arm64/pine64-plus-inmate-demo.c
> @@ -0,0 +1,131 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Configuration for gic-demo inmate on Pine64+ board
> + *
> + * Copyright (c) Vijai Kumar K, 2019-2020
> + *
> + * Authors:
> + *  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
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
> +		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
> +		.vpci_irq_base = 125,
> +
> +		.console = {
> +			.address = 0x1c28000,
> +			.type = JAILHOUSE_CON_TYPE_8250,
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
> +		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
> +		/* State Table */ {
> +			.phys_start = 0xbbef1000,
> +			.virt_start = 0xbbef1000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* Read/Write Section */ {
> +			.phys_start = 0xbbef2000,
> +			.virt_start = 0xbbef2000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* Output (peer 0) */ {
> +			.phys_start = 0xbbefb000,
> +			.virt_start = 0xbbefb000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* Output (peer 1) */ {
> +			.phys_start = 0xbbefd000,
> +			.virt_start = 0xbbefd000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* Output (peer 2) */ {
> +			.phys_start = 0xbbeff000,
> +			.virt_start = 0xbbeff000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* UART */ {
> +			.phys_start = 0x1c28000,
> +			.virt_start = 0x1c28000,
> +			.size = 0x400,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32 |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM */ {
> +			.phys_start = 0xbbee1000,
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
> +			.address = 0x01c81000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				0,
> +				0,
> +				0,
> +				(1 << (157 - 128))
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		{ /* IVSHMEM 0001:00:00.0 (demo) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 1,

Domain is actually 0 for this inmate, but also meaningless (only
processed by the Linux driver for the root cell).

> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 1,
> +			.shmem_peers = 3,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +	},
> +};
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/512cf9ab-a1ea-7b1e-a4c5-4f81afb0280d%40siemens.com.
