Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBSV667ZQKGQE3OS5KMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 1530C19560C
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Mar 2020 12:11:07 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id m4sf5475092wme.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Mar 2020 04:11:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585307466; cv=pass;
        d=google.com; s=arc-20160816;
        b=EsgQSt05QaKIwjIISsrPiyRspOxoQyKVp7DnvC1CFqVbhSfnK73uLGTdw7LPHeDjy7
         lhoM5ikiadzyezG/iAIWTnMEfJsDaSdow34BcpDZuVHNARATcHlX8VW46bjuOLeLogn6
         LWVR0NZ6vhytC1dAPoZ+eRYKaqoBNHGchrlQT+MZdY9yMDXomlBIppOCLJVi5t0RUz1v
         acjNJrhpwPohNUUf/SFJGo8nu5+8xjAJEFTM/ejknG9aqd7xT5tlmLw55PHaR3pwjLwP
         7H2/EF0uV8XS8csgpHiGYVnSQNK5S+56q+i4V3Z7bTSE1XLoLmcw43IFDvPC25IJE82T
         Oe9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=jy+g3/rg7DJd+cyHnN1tVh/OnPCtx6anS/R9cvQY7Lw=;
        b=B5gomZdfMBPPOFVrwuEZ3UHHxeXyVEMSamuoXw6sQlWEyFIHJn9RrEiBKoQOhwMUK6
         6plfMLxiBcHPm1tsjk++6vcFSj63i1fxCP29ChAhHKWTwgu9nzs8yKBqzfVPw6d8aJp3
         88kyEYc2Jk55vRKr/f6H7Ny3DsOy4Mhu4pkx8nGeX+9oHGCgUHz6TFrJyGTGPSk62Gr8
         qczvMVzESArkvTAUQBHk7TGBLww73l1ENAE3zeGJiZX1B/4kdyIY06viZRMvhQCD6GQv
         E5pED6oMJmDa3rs0A8VPh10mkPyrNUczSrL3AnoqkwTvJ7fjof165J4BI22pSGDFVzdc
         Ni8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jy+g3/rg7DJd+cyHnN1tVh/OnPCtx6anS/R9cvQY7Lw=;
        b=RGd70sUJXXs1dPZ32PFr3cEbNBETumFRNYXkgfw+6NhYA9dN+S71IXTz4lABY0m7UP
         I8OPWqaIp8bF9y4rvwlcQF0GmCA2780XBi7+cKDaCl1ECsqQSgIbuNEUsP2CaJQu0JYc
         g0gfjdJdb6YAficqSk4oflp19NI8ucitJTD2GPmWpiZo/9js+Qe68PjcLAGLWF0gWn8L
         HTr85HTODWX8k0m2r6p20JSe/wkgrXa+wqJLWbunwugRCb4vaGAMmmGGKry6FOr3MeL0
         YIUsinuylE4NH/abuHwOnGf7YoCNWQVsbK2rLQgf/EXRsj6o/akeqHUkwT2MS/wrUJZI
         JsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jy+g3/rg7DJd+cyHnN1tVh/OnPCtx6anS/R9cvQY7Lw=;
        b=lIDFGUAkfmSohk+sxm68Ub078XNmZSbgLlui6IXufMU9JKJuGqucUXQ+YKSJG6LIEK
         W953D5znny0dsSuEEykT6GxXr6VDjCqiBvnRGtwXY8mq2+xcGAvaPZX6cFYNYikQOWY/
         VmwB62zKZb+S2FqlcP+Zy6tV7FcCj5cqLcDa7ZiD9vmoLdue/zmbNEaWERjUoqyeb78S
         +xDNMgNPzflgHDUad6qeVGm7HBp1g0+TJ2O+jH9PQVLVetJi4w8XoPxOFEh4Q7PVXkjC
         ZU5YdmH7G9vsfMUUy5Dk+vSV1AA7/njFwtecoV6rSUhufO+aHYVlhMC4fhs13fRDWaN0
         fKHQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ10LxSJTfQtrM1nCYmHYNkpsT2A+dhrGReSRZFpSaYW+v31D+8H
	0kKLuSdzQY/S+QHdF9+8Egc=
X-Google-Smtp-Source: ADFU+vtMyLd5zhLCuVVaAOQRWugmS8nCbDWo4XmPTmpiuBu7NMIKWPErAsuj7/ACSeR8ODjZgsgsdQ==
X-Received: by 2002:a1c:4b14:: with SMTP id y20mr1342064wma.163.1585307466651;
        Fri, 27 Mar 2020 04:11:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:230e:: with SMTP id j14ls277690wmj.0.canary-gmail; Fri,
 27 Mar 2020 04:11:05 -0700 (PDT)
X-Received: by 2002:a1c:2b06:: with SMTP id r6mr5072958wmr.25.1585307465882;
        Fri, 27 Mar 2020 04:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585307465; cv=none;
        d=google.com; s=arc-20160816;
        b=Qldj6+ZWSUbsMwpAcoto+2vkRb+UXhQp+6IiRaxhWoJc/lSM2a9qJUSftRbJXuZwwL
         E5GNTsYSoSTHVoGBsc8kd71u0IOH33YFh+Es9oQ85rI2yB6N1oi2X2/+IOwbISI+tuBg
         oIJAA2V4v/VArAZsd2PL6GpQGWKt7DsR9Q0j44MIAEIzSRWhkd3RCBMGF9vtJXGwf6w/
         0ClUc9Ug5X/e0TndrLJSg3hZGfZASgT7iJ/0B+gckWTBM2K4RxCpupxY0bOspk85uYA/
         H90k5Is4jkU3/e75EPWegGXk3s/n33+v4YwqRDGRhgAo7EH57+ttkjFiKA2lyOUbDgQs
         GsPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=PAvRTN0X+yZaI4fEanj4gKmURODcAjfA3s/vjvJAfK4=;
        b=VMGeeIbSJPWV8bIbPZ3pYjlt94DQgQHkz9JMSnBVP/BS+PznIHpp8CwJYJzGf5LEQJ
         7PwNT65JCHOhBLLsrJG+QfSYDYvF1LzSEqRZ84kKiGF5fPh0Xi8+o5avj7fvMsPWzS7/
         14pShDkQCaUzu1r5FyzMvFo19L/9uZtYKquNZ3V31Sw8QzM5T5gfHPafiYgU4UNVyxJa
         /vicvUiTmClCwPj6jingPVaxh1bkRmaHeAJVB5BrwmDVIsNMLHgN3ktsHfMItNdaWxuO
         6yGEhL4XL031M6Q13V0B3DuBul3EYLFtq/icJ0FsAhV6F4KymcQrYm+3UpiCtCdOMtyf
         Fmrg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id i22si363553wml.0.2020.03.27.04.11.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Mar 2020 04:11:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 02RBB5CM019918
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Mar 2020 12:11:05 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.0.5])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02RBB4rl024728;
	Fri, 27 Mar 2020 12:11:04 +0100
Date: Fri, 27 Mar 2020 12:11:02 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Alice Guo <alice.guo@nxp.com>
Cc: <jailhouse-dev@googlegroups.com>, <peng.fan@nxp.com>
Subject: Re: [PATCH V2 1/2] Cell configs for imx8mq EVK board.
Message-ID: <20200327121102.12ffdf7d@md1za8fc.ad001.siemens.net>
In-Reply-To: <20200326132025.5116-1-alice.guo@nxp.com>
References: <20200326132025.5116-1-alice.guo@nxp.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

On Thu, 26 Mar 2020 21:20:24 +0800
Alice Guo <alice.guo@nxp.com> wrote:

> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>  configs/arm64/imx8mq-inmate-demo.c |  70 +++++++++++--
>  configs/arm64/imx8mq-linux-demo.c  | 158
> +++++++++++++++++++++++++++++ configs/arm64/imx8mq.c             |
> 93 +++++++++++++++-- 3 files changed, 307 insertions(+), 14
> deletions(-) create mode 100644 configs/arm64/imx8mq-linux-demo.c
> 
> diff --git a/configs/arm64/imx8mq-inmate-demo.c
> b/configs/arm64/imx8mq-inmate-demo.c index 8c1ad624..d3c89aec 100644
> --- a/configs/arm64/imx8mq-inmate-demo.c
> +++ b/configs/arm64/imx8mq-inmate-demo.c
> @@ -1,7 +1,7 @@
>  /*
>   * iMX8MQ target - inmate demo
>   *
> - * Copyright NXP 2018
> + * Copyright 2018-2019 NXP

Maybe even 2020? And that is the only update to the several files you
touch, maybe do them all.

Henning

>   *
>   * Authors:
>   *  Peng Fan <peng.fan@nxp.com>
> @@ -16,7 +16,9 @@
>  struct {
>  	struct jailhouse_cell_desc cell;
>  	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[3];
> +	struct jailhouse_memory mem_regions[8];
> +	struct jailhouse_irqchip irqchips[1];
> +	struct jailhouse_pci_device pci_devices[1];
>  } __attribute__((packed)) config = {
>  	.cell = {
>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> @@ -26,8 +28,9 @@ struct {
>  
>  		.cpu_set_size = sizeof(config.cpus),
>  		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> -		.num_irqchips = 0,
> -		.num_pci_devices = 0,
> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
> +		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +		.vpci_irq_base = 108,
>  
>  		.console = {
>  			.address = 0x30860000,
> @@ -42,6 +45,38 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVHSMEM shared memory region for 00:00.0 */ {
> +			.phys_start = 0xbfd00000,
> +			.virt_start = 0xbfd00000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbfd01000,
> +			.virt_start = 0xbfd01000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbfd0a000,
> +			.virt_start = 0xbfd0a000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbfd0c000,
> +			.virt_start = 0xbfd0c000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbfd0e000,
> +			.virt_start = 0xbfd0e000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_ROOTSHARED,
> +		},
>  		/* UART1 */ {
>  			.phys_start = 0x30860000,
>  			.virt_start = 0x30860000,
> @@ -50,7 +85,7 @@ struct {
>  				JAILHOUSE_MEM_IO |
> JAILHOUSE_MEM_ROOTSHARED, },
>  		/* RAM: Top at 4GB Space */ {
> -			.phys_start = 0xffaf0000,
> +			.phys_start = 0xc0000000,
>  			.virt_start = 0,
>  			.size = 0x00010000,
>  			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE | @@ -62,5 +97,28 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_COMM_REGION,
>  		},
> -	}
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
> +			.shmem_protocol =
> JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +	},
>  };
> diff --git a/configs/arm64/imx8mq-linux-demo.c
> b/configs/arm64/imx8mq-linux-demo.c new file mode 100644
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
> + * This work is licensed under the terms of the GNU GPL, version 2.
> See
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
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbfd01000,
> +			.virt_start = 0xbfd01000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbfd0a000,
> +			.virt_start = 0xbfd0a000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbfd0c000,
> +			.virt_start = 0xbfd0c000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xbfd0e000,
> +			.virt_start = 0xbfd0e000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* IVSHMEM shared memory regions for 00:01.0
> (networking) */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xbfe00000, 1),
> +		/* UART1 earlycon */ {
> +			.phys_start = 0x30860000,
> +			.virt_start = 0x30860000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO |
> JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* UART2 */ {
> +			.phys_start = 0x30890000,
> +			.virt_start = 0x30890000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* SHDC1 */ {
> +			.phys_start = 0x30b40000,
> +			.virt_start = 0x30b40000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO |
> JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM: Top at 4GB Space */ {
> +			.phys_start = 0xbff00000,
> +			.virt_start = 0,
> +			.size = 0x10000, /* 64KB */
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* RAM: Top at 4GB Space */ {
> +			.phys_start = 0xc0000000,
> +			.virt_start = 0xc0000000,
> +			.size = 0x3dc00000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_DMA |
> +				JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* communication region */ {
> +			.virt_start = 0x80000000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_COMM_REGION,
> +		},
> +	},
> +
> +	.irqchips = {
> +		/* uart2/sdhc1 */ {
> +			.address = 0x38800000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				(1 << (27 + 32 - 32)) | (1 << (22 +
> 32 - 32))
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
> +			.shmem_protocol =
> JAILHOUSE_SHMEM_PROTO_UNDEFINED,
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
>  /*
>   * i.MX8MQ Target
>   *
> - * Copyright 2017 NXP
> + * Copyright 2017-2018 NXP
>   *
>   * Authors:
>   *  Peng Fan <peng.fan@nxp.com>
> @@ -18,25 +18,31 @@
>  struct {
>  	struct jailhouse_system header;
>  	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[4];
> +	struct jailhouse_memory mem_regions[14];
>  	struct jailhouse_irqchip irqchips[3];
> +	struct jailhouse_pci_device pci_devices[2];
>  } __attribute__((packed)) config = {
>  	.header = {
>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>  		.revision = JAILHOUSE_CONFIG_REVISION,
>  		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
>  		.hypervisor_memory = {
> -			.phys_start = 0xffc00000,
> +			.phys_start = 0xfdc00000,
>  			.size =       0x00400000,
>  		},
>  		.debug_console = {
>  			.address = 0x30860000,
>  			.size = 0x1000,
>  			.type = JAILHOUSE_CON_TYPE_IMX,
> -			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +			.flags = JAILHOUSE_CON_TYPE_IMX |
> +				 JAILHOUSE_CON_ACCESS_MMIO |
>  				 JAILHOUSE_CON_REGDIST_4,
>  		},
>  		.platform_info = {
> +			.pci_mmconfig_base = 0xbfb00000,
> +			.pci_mmconfig_end_bus = 0,
> +			.pci_is_virtual = 1,
> +
>  			.arm = {
>  				.gic_version = 3,
>  				.gicd_base = 0x38800000,
> @@ -47,9 +53,11 @@ struct {
>  		.root_cell = {
>  			.name = "imx8mq",
>  
> +			.num_pci_devices =
> ARRAY_SIZE(config.pci_devices), .cpu_set_size = sizeof(config.cpus),
>  			.num_memory_regions =
> ARRAY_SIZE(config.mem_regions), .num_irqchips =
> ARRAY_SIZE(config.irqchips),
> +			.vpci_irq_base = 51, /* Not include 32 base
> */ },
>  	},
>  
> @@ -58,6 +66,38 @@ struct {
>  	},
>  
>  	.mem_regions = {
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
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE ,
> +		},
> +		{
> +			.phys_start = 0xbfd0a000,
> +			.virt_start = 0xbfd0a000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE ,
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
> +		/* IVSHMEM shared memory regions for 00:01.0
> (networking) */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xbfe00000, 0),
>  		/* MMIO (permissive) */ {
>  			.phys_start = 0x00000000,
>  			.virt_start = 0x00000000,
> @@ -68,14 +108,28 @@ struct {
>  		/* RAM */ {
>  			.phys_start = 0x40000000,
>  			.virt_start = 0x40000000,
> -			.size = 0xbfb00000,
> +			.size = 0x7fb00000,
>  			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE,
>  		},
> -		/* IVSHMEM shared memory region for 00:00.0 */ {
> -			.phys_start = 0xffb00000,
> -			.virt_start = 0xffb00000,
> +		/* Linux Loader */{
> +			.phys_start = 0xbff00000,
> +			.virt_start = 0xbff00000,
>  			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* Inmate memory */{
> +			.phys_start = 0xc0000000,
> +			.virt_start = 0xc0000000,
> +			.size = 0x3dc00000,
> +			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* OP-TEE reserved memory */{
> +			.phys_start = 0xfe000000,
> +			.virt_start = 0xfe000000,
> +			.size = 0x2000000,
>  			.flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE, },
>  	},
> @@ -103,4 +157,27 @@ struct {
>  			},
>  		},
>  	},
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
> +			.shmem_protocol =
> JAILHOUSE_SHMEM_PROTO_UNDEFINED,
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
>  };

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200327121102.12ffdf7d%40md1za8fc.ad001.siemens.net.
