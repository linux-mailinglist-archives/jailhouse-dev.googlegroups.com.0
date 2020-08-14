Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCNM3L4QKGQEOCIZRVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6793F244AE8
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 15:47:54 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id f14sf3369444wrm.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 06:47:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597412874; cv=pass;
        d=google.com; s=arc-20160816;
        b=LHoY8fbnq+KG4Nzj6rTgKhZy3WlCMub+glIUshDY87Pr39u7NmqitcCtCL+VT15Ahd
         3mrtBTWRv822AF0GNZbVLNWqUo9aWuTAbyXFiIr4nlQXC4lr1EB70RU5kSU4yRRRmHiC
         MncWUtHLov/FLjZia4h8u3xfP3mWIS/BS+7crj4r2Yu93YkfY4rkkdrXbTG19HZNDnsA
         0uLAVlwiHasFj198nFQ/wgt4ha36SRlud3YDI7+Ja4NHCZM0G60by07uIspD0X9WG+tX
         xwzYH+gTvAzKFPh8NJWk4dP/MDsdNvVnVroXXhs4zuO+dztZHBZlrqcwDXl6V/20fkAe
         iDJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=SV70BJy1bfRg/6GuBJ5/eecPa9ZD/cIsGxxpAHkQoDE=;
        b=nDjiogvaVBip93uZ/bnZF6kP8jJPmylfS/y0FxWhv9IWFnfFhEyeRnl8o5wVthTW4Q
         MQEajfbPU03gHp27DFZj+VTgqeQ3Ee4hgtAVskShm05cC+AE/y0NyK9m1nRAM+fXfyh9
         xy3K5X02/apfVJ701vqRDt+gTUCzM1vRJk1xwMCNeuA5WS7arK8xQ6937At/kcz5LRGA
         daVjDCL2dS9wKpzBiba9Ip2RtC5YJBemymh7vZQXp7MnzFF/mxOaaZQGYBLfoo84VXZq
         9go4yrSXvMp3Q2ubB11zIM1q6ulFX4XTbRD7BVnJOKRVT6UI7vQ2rJ67dxSLGO8Dn30S
         rqNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SV70BJy1bfRg/6GuBJ5/eecPa9ZD/cIsGxxpAHkQoDE=;
        b=VnEAfrGAoBpwW0YreIemcUP/HUu8Die0b15CuhqavW85VvrJoFUKpqJVL00VtmPAld
         GR9Zb2pWKPaFJ1i20BCNgXgHjFEo9aZil1lTeKqObOleQnoPGmxUl7MOlib8vPFs+LX+
         ig2dcLQkwfEl2wtiIYZjAhgHa0N7oXN5+iM1e0Qsx29XfkfQbfGHWprkYEDXKQkW3XLS
         qdE5/0kbv06+6nCjOCTs6+qfkpRdpHTc0C9embACtC0wHPj0v4NGu3tw7bvLJGRgmqTB
         NAnz9wNkYytNl/ocOU+LEWJUPUIIb7by670KzhG2/XYRYT2eR3VO6KoppVhAuEVAL9oJ
         pKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SV70BJy1bfRg/6GuBJ5/eecPa9ZD/cIsGxxpAHkQoDE=;
        b=dpOqcni4sbxIg4jj/XjydF1m7QbsJCalFt0ZSjhM41pYWViFvHe83YDlnHXXIUAxW0
         bnCU4guhvFMzRURSu9WnNxqMCLwCXaioRoGYivE3LNtzVMn5JDAzaq3ZqGidMxlAcNbu
         mX/UYNgXDUzCMPljkWyyQ6OtJLCaZi7XiIiGyormNxHxheIejJ2jAnFYU/kfy9fltf0C
         4TDWjAWHwc8XnO8H1IFYTMwgAFkMGbWdmeC49F1/eV9dAVFRcG9+IcmMyTOYs87Ny6Qx
         GIhz/i12uZxBa/yg/5WlDnRNpcTI01Gj9GUkXMYh9ISpI/pLEgh2vKUKwX+Y01sFqAJ3
         MhFw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533QbEpu4YjhCOhAzpncxS43xN/VJefMD94lnE1eU4dnXq7OME+7
	SYmpRnN3O7+bbY1UbMS/uNU=
X-Google-Smtp-Source: ABdhPJxYlBrLXK6gYlxuLW0AXbShVEuwu6APuVr/BGj+fqQ77o9AE6rzbVSTc+0CEkKCu5Yn3eHLSQ==
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr2742893wmh.4.1597412874127;
        Fri, 14 Aug 2020 06:47:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e78f:: with SMTP id n15ls80794wrm.1.gmail; Fri, 14 Aug
 2020 06:47:53 -0700 (PDT)
X-Received: by 2002:adf:e845:: with SMTP id d5mr2861846wrn.228.1597412873370;
        Fri, 14 Aug 2020 06:47:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597412873; cv=none;
        d=google.com; s=arc-20160816;
        b=V7+JJIyyiAm1UY7o9+DP242j197nxsFhyKmJUDLjSWGFQLzY9lV63jl8N8e0TG3ePy
         rU8dMJ+9hBlOFsiyGRehhlXTcNoaQR0SWqoosJ9PDY5agAnZatm/B2M9yYYSV9CMnMLj
         lSbJ+P1/7WzHX4Pme3Sh2DL8I46wOXhkXhmKy0Q1XZ5Bn+9I0seMAN5yIFNmCK57+Jfm
         TgIYc7stCyEjd6a0PApl9VUV3RYwXe4jlu7lKHntrbxisoMpshjeCTXoPhho9a9TsJ7x
         q41BCoI3IlisYNRPn82sa9znj53954UxM/yvsVjDXeL86P0sDpruUO6cg4i7Tp/Ar081
         lzFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=a6/CHJY42o46UmnkM9+rCpXhJE+ig8VlfwBD7msEzV0=;
        b=guut1ICR8QKOWOpEze+gxQOiEHIYqUBY73lDrDzO61R6B/UxKYNczBlz0OrwBaenM0
         XCt1m15/cIAQDUTtjUhZ5XmKZPN0jFnC4b1LdD1ud4GkdcMBpcvm4gm4oOyB/w78mn9M
         uAm7NPupgTB0ye5yZAxnpf+7pqwkQWeFGYtemXhxa+I5Xr2DqxNxo6nkuPGKPbbvRwXM
         vXm2SIUM5Nq08DXewEIpDJbKl98tufMGlqb4VBzIka483jMkRmlRFCMb6gp4P1FPfIEB
         IFr2xPxPnJ1vVwVVmDwu8bk7wH3TrX8LaF12/9iEInYyQhHKOIYOnOLca43jCZPeBybH
         Ijlg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id j16si301808wrs.5.2020.08.14.06.47.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 06:47:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 07EDlqT5029715
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Aug 2020 15:47:52 +0200
Received: from [167.87.75.232] ([167.87.75.232])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07EDlqIf018622;
	Fri, 14 Aug 2020 15:47:52 +0200
Subject: Re: [PATCH V2 4/4] configs: arm64: imx8dxl: add cell configuration
 files
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200815190949.6837-1-alice.guo@nxp.com>
 <20200815190949.6837-4-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <abc77bec-9b59-e56f-a188-18859536ba3f@siemens.com>
Date: Fri, 14 Aug 2020 15:47:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200815190949.6837-4-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 15.08.20 21:09, Alice Guo wrote:
> Add imx8dxl-gic-demo-aarch32.c to support AArch32 VM on the imx8dxl
> platform. Distinguish whether it is AArch32 inmate cell by the macro
> JAILHOUSE_CELL_AARCH32.
> 
> Add "imx8dxl-gic-demo-aarch64.c" for AArch64 VM.
> 
> "imx8dxl.c" is used for the root cell.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>   configs/arm64/imx8dxl-gic-demo-aarch32.c |  64 +++++++++
>   configs/arm64/imx8dxl-gic-demo-aarch64.c |  64 +++++++++

Sorry, missed that so far:

Please add a imx8dxl-inmate-demo.c, instead of aarch64, and make sure it 
is in line with other inmate-demo configs. That will ease using this 
target with all kinds of inmates, including tests (once we have more...).

And for the aarch32 variant: If the only difference is the flag, maybe 
put that in a define and include the imx8dxl-inmate-demo.c, rather than 
copying it. Will make maintenance easier.

>   configs/arm64/imx8dxl.c                  | 173 +++++++++++++++++++++++
>   3 files changed, 301 insertions(+)
>   create mode 100644 configs/arm64/imx8dxl-gic-demo-aarch32.c
>   create mode 100644 configs/arm64/imx8dxl-gic-demo-aarch64.c
>   create mode 100644 configs/arm64/imx8dxl.c
> 
> diff --git a/configs/arm64/imx8dxl-gic-demo-aarch32.c b/configs/arm64/imx8dxl-gic-demo-aarch32.c
> new file mode 100644
> index 00000000..80dbd366
> --- /dev/null
> +++ b/configs/arm64/imx8dxl-gic-demo-aarch32.c
> @@ -0,0 +1,64 @@
> +/*
> + * iMX8DXL target - gic-demo
> + *
> + * Copyright 2020 NXP
> + *
> + * Authors:
> + *  Alice Guo <alice.guo@nxp.com>
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
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = "gic-demo-aarch32",
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG | JAILHOUSE_CELL_AARCH32,
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = 0,
> +		.num_pci_devices = 0,
> +		.console = {
> +			.address = 0x5a060000,
> +			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
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
> +		/* UART1 */ {
> +			.phys_start = 0x5a060000,
> +			.virt_start = 0x5a060000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM: Top at 4GB Space */ {
> +			.phys_start = 0xa1700000,
> +			.virt_start = 0,
> +			.size = 0x00100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* communication region */ {
> +			.virt_start = 0x80000000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_COMM_REGION,
> +		},
> +	}
> +};
> diff --git a/configs/arm64/imx8dxl-gic-demo-aarch64.c b/configs/arm64/imx8dxl-gic-demo-aarch64.c
> new file mode 100644
> index 00000000..88d436fe
> --- /dev/null
> +++ b/configs/arm64/imx8dxl-gic-demo-aarch64.c
> @@ -0,0 +1,64 @@
> +/*
> + * iMX8DXL target - gic-demo
> + *
> + * Copyright 2020 NXP
> + *
> + * Authors:
> + *  Alice Guo <alice.guo@nxp.com>
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
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = "gic-demo",
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = 0,
> +		.num_pci_devices = 0,
> +		.console = {
> +			.address = 0x5a060000,
> +			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
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
> +		/* UART1 */ {
> +			.phys_start = 0x5a060000,
> +			.virt_start = 0x5a060000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM: Top at 4GB Space */ {
> +			.phys_start = 0xa1700000,
> +			.virt_start = 0,
> +			.size = 0x00100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* communication region */ {
> +			.virt_start = 0x80000000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_COMM_REGION,
> +		},
> +	}
> +};
> diff --git a/configs/arm64/imx8dxl.c b/configs/arm64/imx8dxl.c
> new file mode 100644
> index 00000000..f94692bc
> --- /dev/null
> +++ b/configs/arm64/imx8dxl.c
> @@ -0,0 +1,173 @@
> +/*
> + * i.MX8DXL Target
> + *
> + * Copyright 2020 NXP
> + *
> + * Authors:
> + *  Alice Guo <alice.guo@nxp.com>
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
> +	struct jailhouse_memory mem_regions[15];
> +	struct jailhouse_irqchip irqchips[3];
> +	struct jailhouse_pci_device pci_devices[2];
> +} __attribute__((packed)) config = {
> +	.header = {
> +		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> +		.hypervisor_memory = {
> +			.phys_start = 0xbfc00000,
> +			.size =       0x00400000,
> +		},
> +		.debug_console = {
> +			.address = 0x5a060000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_CON_TYPE_IMX_LPUART |
> +				 JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_REGDIST_4,
> +			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
> +		},
> +		.platform_info = {
> +			.pci_mmconfig_base = 0xbf700000,
> +			.pci_mmconfig_end_bus = 0x0,
> +			.pci_is_virtual = 1,
> +			.pci_domain = 0,
> +			.arm = {
> +				.gic_version = 3,
> +				.gicd_base = 0x51a00000,
> +				.gicr_base = 0x51b00000,
> +				.maintenance_irq = 25,
> +			},
> +		},
> +		.root_cell = {
> +			.name = "imx8dxl",
> +			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +			.cpu_set_size = sizeof(config.cpus),
> +			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +			.num_irqchips = ARRAY_SIZE(config.irqchips),
> +			.vpci_irq_base = 2, /* Not include 32 base */

Is SPI 2 actually free on this board? Usually, those low IRQs are all in 
use. Just to double-check.

> +		},
> +	},
> +
> +	.cpus = {
> +		0x3,
> +	},
> +
> +	.mem_regions = {
> +		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
> +			.phys_start = 0xbf900000,
> +			.virt_start = 0xbf900000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		{
> +			.phys_start = 0xbf901000,
> +			.virt_start = 0xbf901000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
> +		},
> +		{
> +			.phys_start = 0xbf90a000,
> +			.virt_start = 0xbf90a000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
> +		},
> +		{
> +			.phys_start = 0xbf90c000,
> +			.virt_start = 0xbf90c000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		{
> +			.phys_start = 0xbf90e000,
> +			.virt_start = 0xbf90e000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xbfa00000, 0),
> +		/* MMIO (permissive): TODO: refine the map */ {
> +			.phys_start = 0x00000000,
> +			.virt_start = 0x00000000,
> +			.size =	      0x80000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* RAM */ {
> +			.phys_start = 0x80200000,
> +			.virt_start = 0x80200000,
> +			.size = 0x21d00000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* Inmate memory */{
> +			.phys_start = 0xa1700000,
> +			.virt_start = 0xa1700000,
> +			.size = 0x1e000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +		/* Loader */{
> +			.phys_start = 0xbfb00000,
> +			.virt_start = 0xbfb00000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +	},
> +
> +	.irqchips = {
> +		/* GIC */ {
> +			.address = 0x51a00000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +		/* GIC */ {
> +			.address = 0x51a00000,
> +			.pin_base = 160,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +		/* GIC */ {
> +			.address = 0x51a00000,
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

Will a linux inmate config follow?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/abc77bec-9b59-e56f-a188-18859536ba3f%40siemens.com.
