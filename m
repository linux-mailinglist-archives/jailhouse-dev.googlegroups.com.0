Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGGB534QKGQEEFZECQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id C49B42481F9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 11:34:16 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id i15sf5867729wmb.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 02:34:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597743256; cv=pass;
        d=google.com; s=arc-20160816;
        b=E0FSUjH3oS1bF3b8B5lEoYUTurVasBQTnskHNCeHeY3xhhljV2IOFi3ridGJgEF9LR
         mSpoSJw/raCAC/NYInQPWw+87LOKAFsJu6oNfmlgIFk8y5V7mhL20Q+OgVkYkTLHi41h
         Apor1LiZjdvTExLeWs0M44uy/obNxGXGqzMzodKgqT3zSrFdBGaefIul96IkVAF1CJdT
         4aKFzsqTUgPDJRr8Z/rf4tzvjThNtUUIzI3/4lfk0raIyiFuvsOyk7Q+JGItPs1ttZOc
         2TXN4JQ7hZPPvTmuCVoy3ZmIhlN3XZ7m8/e0iA56kS0Mk5pfM0ZrSmxuDzEfS8JfN9Cg
         1nJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=ovd4k0ZTbNdz5vn2pkFPN4cx9zfKp0gkulE1RROKhDg=;
        b=C/uXmSKk1ZoYBVOKGlO7d13Ia2HkMlTYJ9Ty3Yg99BFRfHGoB1Bo9s/bdVAPIuetyc
         X/ltqSBArw5kPmifmTs5nkqn344kzK6VCanddU83Gpo4pWSml4AKA/TER7ebvQypXdQF
         GLDu5Ikn1mq3J0+QrdrTSU4a5Ljb6Fd9bmMkH6OWu5SGbbdg5I3vDGq/K9XJlejtooXI
         xfrVhwQDqrXN4CLLymmS39hDrhvCTGB3WGsJSkhQY1YAI87AJw3KXyVDz6CDrxzTJBRh
         SjdXx9P5owCos2AMj6jV6p70VY2M952J20h+z+gK4IWHqKYXDhyt3rYPc7CPBKJ4+Ewa
         60XA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ovd4k0ZTbNdz5vn2pkFPN4cx9zfKp0gkulE1RROKhDg=;
        b=NTF+Px4uEDQXwcNSI8NhPMn9sqlNkEmB8Prn9TZ2E25JWTkUrT/qTdvUXPi/NGTtdp
         t5khs1LDKOkVjut1QwhWKznNbFL6Dg04FAFQrcW7k/3mqx8zQGJ4DJ3CRoChnxJW03kV
         RkP8IH0Xc4YoScfJBchfCndHvc7BIV1kPGrm/0s7Y39jWzLSJtUbOKkoJsMPEWQeb/dd
         ioye6ZCGj7t1OpUf3mtqKhIJsX7EbxI2WKcbXbEIuG5xCfPUHHnb7gFe52+th31N81Lj
         yNEuMD5bjugkPakmMD8Kt1qlG+JA5UIWqXBOKuibcTvwpyHul7hgSNci6el6TMHwIm8x
         9GIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ovd4k0ZTbNdz5vn2pkFPN4cx9zfKp0gkulE1RROKhDg=;
        b=EkqT66FHWKnrAD4G8rIKaJCMYehV1n9FRgWEpfgWLJOpEO0PL/mI2itA1gfHUIoly7
         hBvN89t0QLiIO9EvTF/wkla+7SofBh/caKBoqUCMJWNMqUPRIEw4Ewt7PPP+L/2Q5xaK
         Wxoh3skaGzzrD3l5BWdGjOKDY8SKiW8mvqb0M59E6LjwezLSuzvXRtTcLVM/rDcuox+4
         9CXvpsh2pPtF9cqPSED8zW90+fUvW3dT8h14uxzyzb1C3Vz+7pKljoZPvo5FQeLLL9hu
         y6KdAPYuOl24blsfYCOOYM9Km+D9GnBUnNq4X2ntMVJkCSedWrOyII/oFjyqJ57/LRmN
         9BCw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533KxvQk6FJaJujvhB6dv6wEMz8THUYeeFWrCESmQOWHjzgIc5b0
	LGNuIbIo3rL8FMjdV5M3akU=
X-Google-Smtp-Source: ABdhPJwayDwM+Nsr2y5kLY6yP7oNWOTN+bkC80OiiAXTagiZXw6esrg6jvA1WasneojYLswaJ/Dhuw==
X-Received: by 2002:adf:c789:: with SMTP id l9mr20464218wrg.41.1597743256474;
        Tue, 18 Aug 2020 02:34:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81f4:: with SMTP id 107ls105368wra.2.gmail; Tue, 18 Aug
 2020 02:34:15 -0700 (PDT)
X-Received: by 2002:adf:ef92:: with SMTP id d18mr20793702wro.71.1597743255590;
        Tue, 18 Aug 2020 02:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597743255; cv=none;
        d=google.com; s=arc-20160816;
        b=tXTQmjiTHrpyFLUHUh/fYj1WlZoB8BE0rLjiQsE64yEfXSIN3pHppKdanelAXZuPbU
         isufD6sIrEKWlryC+wLNt+MeD6PwYyZ/TvlUpruTaVGwek7zfg6exNe45244cOrcLT/z
         4iCOqmD4RaqOpt2fNuGNo1dK9baHIeA9jTIFJYw6/yeFz4t9oRYEyuzm1Wb0bmCNQxxE
         q2vMojHa2J+OZoBzayw119MivecMQl/tWZ4xEsub1lLORtbQd+dC308JnLPEKinuinOV
         LbJWr4UVjlH3NLaOusmagKDRvRZez0QCdQIAEtFNAVsoQdCoScVNPXEeZUSgY243WXPU
         CT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=CrTbF+qPSb8qTqJUK0y04OTHR1a+pu3Picv9PPYLL68=;
        b=wJfwMdURwpDkCZz65fFNQXLIfr2/URE0z5rRlnDZSpdJUksC09MEkjK+BPUnyq5siX
         Bqj+LNLaCGh/SATisWlQb1d8lla/p9sbBXasbh+No7H16ZAW8lDwzxDzAA1Af6gDoAnQ
         XFucog4/djO3I0MnR4NyidOVUuAXtKlTs4eUytGyjVSNZFBRGi4VVhRpbGDRjcpdf2Ac
         Lzla9Q4I+3rimt0wT+uGWHrItve5DkxEqMSa/NnLE/jLsZMxvbAkqB+WnwgB+4UYT4kH
         h/waZjOaGhMsZM6au+Vys66lAR6x0YvK0gSj2DgwbdSBfeJh/C9mzkol3EtzDbwurUko
         7N2Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z23si46194wml.1.2020.08.18.02.34.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 02:34:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 07I9YFiX004877
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 11:34:15 +0200
Received: from [139.22.40.250] ([139.22.40.250])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07I9YEsc012033;
	Tue, 18 Aug 2020 11:34:14 +0200
Subject: Re: [PATCH V3 4/4] configs: arm64: imx8dxl: add cell configuration
 files
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200819142807.20972-1-alice.guo@nxp.com>
 <20200819142807.20972-4-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1f4fa882-7330-b125-d4ec-3a724403d047@siemens.com>
Date: Tue, 18 Aug 2020 11:34:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819142807.20972-4-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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

On 19.08.20 16:28, Alice Guo wrote:
> Add "imx8dxl-inmate-demo-aarch32.c" to support AArch32 VM on the imx8dxl
> platform. Distinguish whether it is AArch32 inmate cell by the macro
> JAILHOUSE_CELL_AARCH32.
> 
> Add "imx8dxl-inmate-demo.c" for AArch64 VM.
> 
> "imx8dxl.c" is used for the root cell.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>  configs/arm64/imx8dxl-inmate-demo-aarch32.c |  14 ++
>  configs/arm64/imx8dxl-inmate-demo.c         |  68 ++++++++
>  configs/arm64/imx8dxl.c                     | 173 ++++++++++++++++++++
>  3 files changed, 255 insertions(+)
>  create mode 100644 configs/arm64/imx8dxl-inmate-demo-aarch32.c
>  create mode 100644 configs/arm64/imx8dxl-inmate-demo.c
>  create mode 100644 configs/arm64/imx8dxl.c
> 
> diff --git a/configs/arm64/imx8dxl-inmate-demo-aarch32.c b/configs/arm64/imx8dxl-inmate-demo-aarch32.c
> new file mode 100644
> index 00000000..f18d40a1
> --- /dev/null
> +++ b/configs/arm64/imx8dxl-inmate-demo-aarch32.c
> @@ -0,0 +1,14 @@
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
> +#define USE_AARCH32
> +#include "imx8dxl-inmate-demo.c"
> diff --git a/configs/arm64/imx8dxl-inmate-demo.c b/configs/arm64/imx8dxl-inmate-demo.c
> new file mode 100644
> index 00000000..089a0b8d
> --- /dev/null
> +++ b/configs/arm64/imx8dxl-inmate-demo.c
> @@ -0,0 +1,68 @@
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
> +#ifdef USE_AARCH32
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG | JAILHOUSE_CELL_AARCH32,
> +#else
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> +#endif
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

Applied also this and patch 3.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1f4fa882-7330-b125-d4ec-3a724403d047%40siemens.com.
