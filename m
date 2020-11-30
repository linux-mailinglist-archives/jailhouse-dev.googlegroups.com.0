Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB45RSL7AKGQEYMRX55Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA2D2C7E52
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 08:02:12 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id q15sf6207614ljp.23
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Nov 2020 23:02:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606719732; cv=pass;
        d=google.com; s=arc-20160816;
        b=crSAg4openNjvMaTS6aNskxV72itwRGLZAytfJiBNg0ojtR87+86EBNlAoaqt9kp3I
         XXzKVpu8/KyZVl0LzZ0w3p7tgfVvG1Ntx3typ0dWflbqpXAXCcmtELvBnW5X8oXymUNJ
         CDz7VHGpLlmPNgDKJtK3IIJ0KXZGE5vG9TL8y5xprLMvleDtVdBsHiLXBoNkPw7d+r0Q
         2jQj5M0k5IA1jBWayHqOl/iG4XlelfFo2dgKxdqG1EdoEZG6pabx+Y4zg8Snk/1qfNr0
         kiFeBfPWO/FjSMWMIR0kPxS52GyVOxLFwcQtOvCnUJV1IIETYLbk1pjcFDzAFmSOarOU
         rwjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=JpEhHpJuWP6DiyKy80bddXDCxb+AtdbNXjFcRIEbK/k=;
        b=mSnA/rEKXImBfgeL9zqDdMj08cemVF+FOqbHG8fyj0SF9TEPSnyGaE+/0kqkYbp1XJ
         Gz1bghbRC1sc/SHEapbG62AM1kbR3a3CfiQd55vlj0JY3NdI7sR50svkB1NUD6ke7Nlw
         B8HcYo7ft2SxWWYeAFo39EIRa5c0v07NTC1ExOSynvDO4GD5CJm6R4wbXgMooNusQ3d/
         +kzcD+8d3mlT305S6ispfxny5SXlZjco7xu4yt/PB9qPheSzhHJ9l6IW2TmIlCincYbw
         NNHf0bM7mT5q5ezBjMiB2FnGALS6m2SmLT05nKsXobN/YjhAaxS1mDagrhG4QqXXvEAf
         9maw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JpEhHpJuWP6DiyKy80bddXDCxb+AtdbNXjFcRIEbK/k=;
        b=nVaMG2UW5WntShuLAi1WOgMoPhnYVWki2p8SncdYsr0NCQsX+duRYYfPUi2wBRKUlE
         tClihxP800OeudhSOXpeJpHS0rol/3AJrmV6O9lqQr6Yzf7c3hJie1WYvFv5CKUhRS7u
         8qI/toFlNe8vGC6CsDM2Y9ycKEGFBKpA8wD/T6DQDLgQrL0yn+PauQ9YdahDlDSI2DSe
         Q6i2tu4WtXngJ7ccakjOFXumX+5dBFuPCcAerm6mFfxD7pDZPi8KvLS3Q1WRkKiQT4a1
         dIss2qh1+7t4MFHBKr9cvEF1fpMD9StwN1qxlcjpG33nv8PBLoZGcNN7q6m4+pErrJQw
         MkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=JpEhHpJuWP6DiyKy80bddXDCxb+AtdbNXjFcRIEbK/k=;
        b=D53RE4DCAcGAnLzj1+VzlFpmdna2Fyqg6G5eJKF6P89tcdwU9z6TV8eS96zHeMY6Oc
         fusQajzzEFnEve6XsaFJdCQ0qbNRa8X0ru/0UxBYGcfkTkEcQmWTBQ8z7lerjsdxBkL6
         TfCx7iM8XXp0RExODv25sgVA7x647i+eMCrJFswWpM6jSejnjDuARVFjngowrxOP+9MC
         iBDDdS5FzxsdXdGBkZ0J2ajhrmnHEfZA+daUYVnVb1ock3RECPxK4cxWny5Q+bRRu7/v
         1f839/I6e3Pwmj8ioEwTRXNSkmK2O7BG9lBkGapkZQAiuOpVVFAGUg1hZhebjWg8w5TE
         saWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5306VD7tE5n3UrmqEmZIOgwRMcYnyhT5875YXkaZz5RsKS32U3eP
	B2jJv1LsjXOnsIAdCOD+z/0=
X-Google-Smtp-Source: ABdhPJwH9pyiB47aeVBpkJtjP5EqWuw0sEIgAJxI0vgY+T8xli0In+X7ZUC4vuyu41zv+l4VvWSANw==
X-Received: by 2002:a2e:b164:: with SMTP id a4mr4864727ljm.271.1606719732223;
        Sun, 29 Nov 2020 23:02:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:58ed:: with SMTP id v13ls2439306lfo.2.gmail; Sun, 29 Nov
 2020 23:02:10 -0800 (PST)
X-Received: by 2002:a19:5205:: with SMTP id m5mr7964865lfb.310.1606719730903;
        Sun, 29 Nov 2020 23:02:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606719730; cv=none;
        d=google.com; s=arc-20160816;
        b=Lc85vh2w7yAbfXD5SFHl4VwuaGajIBUInMaPOxGAyu5hIW6kyCi7P9C4uR7sFnFGQM
         KgOsb1ELASHz99gXWfrJIJGeRFPukr0dJtNdDD3Yp8xyzT8FOrWo5ZAJX36TEk5Wt13d
         5RdeOCsr9GvvcOJsXxfyx3b1QcjilyhwMkpYNoblOtNjOINhu4PPza/O9mEyzSr1FHYr
         sq8+G2cewsk97kLSth294kto4U4mQtBbHgJnuc5y1DlXPVJFzw+MP76vWNaTMCSd+wmD
         eWj6aSBzZpLTBRyRb2nzgDAg17HC5Rn05cXUJh+g0Xq5eK9F74LrAOiSoUcQawPL5Q1T
         Gu1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=66tonC1Vwa3t92ZkL3INFQPDqujgGFddjhPM+UyuMSA=;
        b=YQCl6xKHZQmXkErTryVZbFVakXkslGLR2qFri1kl3XhGZTlRsWX63/oQ+XQ+bY+/nX
         7+CfRAV81A+2r6eKn0Cg7g6kyxxbNEEtcilI/hDm/iBCHf1QNN2gaDFGVUg6nPoQPETn
         QFTesxT6ooJWWE4VbHIZ+ukTDYI4m+lumT5SWieRI6YoiJR3fSp1fv868DC+96sYcGyj
         09lK2XdqnB3bmeOfMRprPbRLg5kWrK6REwg1vC9IzN3R6PuqmAhQ5NR21R7PkqLrTl13
         a+vxS0RWrv2yke9brgq1YM/YilWFPl/c2slxf+2yfE3Wi3lhM6vWL4eJgAzLM6hRO+IN
         hLJw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id m18si434103lfr.11.2020.11.29.23.02.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 29 Nov 2020 23:02:10 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0AU729Gh021794
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Nov 2020 08:02:10 +0100
Received: from [167.87.39.132] ([167.87.39.132])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AU729sK013787;
	Mon, 30 Nov 2020 08:02:09 +0100
Subject: Re: [PATCH] configs: add ls1046ardb linux demo
To: Jiafei Pan <Jiafei.Pan@nxp.com>, jailhouse-dev@googlegroups.com
References: <20201130070515.21504-1-Jiafei.Pan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8a7f2697-3782-61d5-d68d-859e20fa1269@siemens.com>
Date: Mon, 30 Nov 2020 08:02:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201130070515.21504-1-Jiafei.Pan@nxp.com>
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

On 30.11.20 08:05, Jiafei Pan wrote:
> Add root cell, inmate cell, ivshmem demo cell and Linux demo cell
> configure files for NXP ls1046a RDB platform.
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> ---
>  configs/arm64/ls1046a-rdb-inmate-demo.c  |  67 +++
>  configs/arm64/ls1046a-rdb-ivshmem-demo.c | 142 +++++++
>  configs/arm64/ls1046a-rdb-linux-demo.c   | 165 ++++++++
>  configs/arm64/ls1046a-rdb.c              | 517 +++++++++++++++++++++++
>  4 files changed, 891 insertions(+)
>  create mode 100644 configs/arm64/ls1046a-rdb-inmate-demo.c
>  create mode 100644 configs/arm64/ls1046a-rdb-ivshmem-demo.c
>  create mode 100644 configs/arm64/ls1046a-rdb-linux-demo.c
>  create mode 100644 configs/arm64/ls1046a-rdb.c
> 
> diff --git a/configs/arm64/ls1046a-rdb-inmate-demo.c b/configs/arm64/ls1046a-rdb-inmate-demo.c
> new file mode 100644
> index 00000000..0f4f2395
> --- /dev/null
> +++ b/configs/arm64/ls1046a-rdb-inmate-demo.c
> @@ -0,0 +1,67 @@
> +/*
> + * ls1046a RDB - inmate demo
> + *
> + * Copyright NXP 2020
> + *
> + * Authors:
> + *  Jiafei Pan <jiafei.pan@nxp.com>
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
> +		.name = "inmate-demo",
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> +
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = 0,
> +		.num_pci_devices = 0,
> +
> +		.console = {
> +			.address = 0x21c0600,	/* Uart1 in DUART1 */
> +			.divider = 0xbd, /* baudrate: 115200 */
> +			.type = JAILHOUSE_CON_TYPE_8250,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				JAILHOUSE_CON_REGDIST_1,
> +		},
> +	},
> +
> +	.cpus = {
> +		0x8,
> +	},
> +
> +	.mem_regions = {
> +		/* DUART1 */ {
> +			.phys_start = 0x21c0000,
> +			.virt_start = 0x21c0000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM: Top at 2GB DRAM1 Space */ {
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
> +	}
> +};
> diff --git a/configs/arm64/ls1046a-rdb-ivshmem-demo.c b/configs/arm64/ls1046a-rdb-ivshmem-demo.c
> new file mode 100644
> index 00000000..907ba1f1
> --- /dev/null
> +++ b/configs/arm64/ls1046a-rdb-ivshmem-demo.c
> @@ -0,0 +1,142 @@
> +/*
> + * ls1046a RDB - ivshmem demo
> + *
> + * Copyright NXP 2020
> + *
> + * Authors:
> + *  Jiafei Pan <jiafei.pan@nxp.com>
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
> +	struct jailhouse_irqchip irqchips[2];
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
> +		.vpci_irq_base = 60 - 32,	/* vPCI INTx */
> +
> +		.console = {
> +			.address = 0x21c0600,	/* Uart1 in DUART1 */
> +			.divider = 0xbd, /* baudrate: 115200 */
> +			.type = JAILHOUSE_CON_TYPE_8250,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				JAILHOUSE_CON_REGDIST_1,
> +		},
> +	},
> +
> +	.cpus = {
> +		0x8,
> +	},
> +
> +	.mem_regions = {
> +		/* IVHSMEM shared memory region for 00:00.0 */ {
> +			.phys_start = 0xfb700000,
> +			.virt_start = 0xfb700000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfb701000,
> +			.virt_start = 0xfb701000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfb70a000,
> +			.virt_start = 0xfb70a000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfb70c000,
> +			.virt_start = 0xfb70c000,
> +			.size = 0x2000,
> +			//.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfb70e000,
> +			.virt_start = 0xfb70e000,
> +			.size = 0x2000,
> +			//.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +			//	JAILHOUSE_MEM_ROOTSHARED,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* DUART1 */ {
> +			.phys_start = 0x21c0000,
> +			.virt_start = 0x21c0000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM: Top at 4GB Space */ {
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
> +		/* GIC-400 */ {
> +			.address = 0x1410000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				1 << (60 - 32), /* vPCI */
> +				0,
> +				0,
> +				0,
> +			},
> +		},
> +		/* GIC-400 */ {
> +			.address = 0x1410000,
> +			.pin_base = 160,
> +			.pin_bitmap = {
> +				0,
> +				0,
> +				0,
> +				0,
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		{ /* IVSHMEM 00:00.0 (demo) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 0,
> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 1,
> +			.shmem_peers = 1,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +	},
> +
> +};
> diff --git a/configs/arm64/ls1046a-rdb-linux-demo.c b/configs/arm64/ls1046a-rdb-linux-demo.c
> new file mode 100644
> index 00000000..c8f699bb
> --- /dev/null
> +++ b/configs/arm64/ls1046a-rdb-linux-demo.c
> @@ -0,0 +1,165 @@
> +/*
> + * ls1046a RDB target - linux-demo
> + *
> + * Copyright 2020 NXP
> + *
> + * Authors:
> + *  Jiafei Pan <jiafei.pan@nxp.com>
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
> +	struct jailhouse_memory mem_regions[16];
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
> +		.vpci_irq_base = 60 - 32,  /* vPCI INTx: 60,61,62,63 */
> +	},
> +
> +	.cpus = {
> +		0xc,
> +	},
> +
> +	.mem_regions = {
> +		/* IVHSMEM shared memory region for 00:00.0 */ {
> +			.phys_start = 0xfb700000,
> +			.virt_start = 0xfb700000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfb701000,
> +			.virt_start = 0xfb701000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfb70a000,
> +			.virt_start = 0xfb70a000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfb70c000,
> +			.virt_start = 0xfb70c000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfb70e000,
> +			.virt_start = 0xfb70e000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 1),
> +		/* DUART1 */ {
> +			.phys_start = 0x21c0000,
> +			.virt_start = 0x21c0000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* clockgen */ {
> +                        .phys_start = 0x01ee1000,
> +                        .virt_start = 0x01ee1000,
> +                        .size = 0x1000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +                },
> +		/* dcfg */ {
> +			.phys_start = 0x01ee0000,
> +			.virt_start = 0x01ee0000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* RAM */ {
> +			.phys_start = 0xbf900000,
> +			.virt_start = 0,
> +			.size = 0x00010000, /* 64K */
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* RAM: Top at DRAM1 2GB Space */ {
> +			.phys_start = 0xc0000000,
> +			.virt_start = 0xc0000000,
> +			.size = 0x3b500000,
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
> +		/* GIC-400 */ {
> +			.address = 0x1410000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				1 << (60 -32)  | 1 << (61 - 32) |
> +					1 << (62 - 32) | 1 << (63 -32), /* vPCI */
> +				0,
> +				0,
> +				0,
> +			},
> +		},
> +		/* GIC-400 */ {
> +			.address = 0x1410000,
> +			.pin_base = 160,
> +			.pin_bitmap = {
> +				0,
> +				0,
> +				0,
> +				0,
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		{ /* IVSHMEM 00:00.0 (demo) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 0,
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
> diff --git a/configs/arm64/ls1046a-rdb.c b/configs/arm64/ls1046a-rdb.c
> new file mode 100644
> index 00000000..3eb58005
> --- /dev/null
> +++ b/configs/arm64/ls1046a-rdb.c
> @@ -0,0 +1,517 @@
> +/*
> + * ls1046a RDB target - linux-demo
> + *
> + * Copyright 2020 NXP
> + *
> + * Authors:
> + *  Jiafei Pan <jiafei.pan@nxp.com>
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
> +	struct jailhouse_memory mem_regions[64];
> +	struct jailhouse_irqchip irqchips[2];
> +	struct jailhouse_pci_device pci_devices[2];
> +} __attribute__((packed)) config = {
> +	.header = {
> +		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> +		.hypervisor_memory = {
> +			.phys_start = 0xfba00000,
> +			.size =       0x00400000,
> +		},
> +		.debug_console = {
> +			.address = 0x21c0500, /* Uart0 in DUART1 */
> +			.size = 0x100,
> +			.type = JAILHOUSE_CON_TYPE_8250,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_REGDIST_1,
> +		},
> +		.platform_info = {
> +			.pci_mmconfig_base = 0xfb500000,
> +			.pci_mmconfig_end_bus = 0,
> +			.pci_is_virtual = 1,
> +			.pci_domain = -1,
> +
> +			.arm = {
> +				.gic_version = 2,
> +				.gicd_base = 0x1410000,
> +				.gicc_base = 0x142f000,
> +				.gich_base = 0x1440000,
> +				.gicv_base = 0x146f000,
> +				.maintenance_irq = 25,
> +			},
> +		},
> +		.root_cell = {
> +			.name = "ls1046a",
> +			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +			.cpu_set_size = sizeof(config.cpus),
> +			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +			.num_irqchips = ARRAY_SIZE(config.irqchips),
> +			.vpci_irq_base = 67 - 32, /* Not include 32 base */
> +		},
> +	},
> +
> +	.cpus = {
> +		0xf,
> +	},
> +
> +	.mem_regions = {
> +		/* IVHSMEM shared memory region for 00:00.0 */ {
> +			.phys_start = 0xfb700000,
> +			.virt_start = 0xfb700000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		{
> +			.phys_start = 0xfb701000,
> +			.virt_start = 0xfb701000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +		{
> +			.phys_start = 0xfb70a000,
> +			.virt_start = 0xfb70a000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +		{
> +			.phys_start = 0xfb70c000,
> +			.virt_start = 0xfb70c000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		{
> +			.phys_start = 0xfb70e000,
> +			.virt_start = 0xfb70e000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 0),
> +		/* RAM - 1GB at DRAM1 region - root cell */ {
> +			.phys_start = 0x80000000,
> +			.virt_start = 0x80000000,
> +			.size = 0x40000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* DRAM2 6GB */ {
> +			.phys_start = 0x880000000,
> +			.virt_start = 0x880000000,
> +			.size = 0x180000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* RAM: Inmate */ {
> +			.phys_start = 0xc0000000,
> +			.virt_start = 0xc0000000,
> +			.size = 0x3b500000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* RAM: loader */ {
> +			.phys_start = 0xbf900000,
> +			.virt_start = 0xbf900000,
> +			.size = 0x00100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* DDR memory controller */ {
> +			.phys_start = 0x01080000,
> +			.virt_start = 0x01080000,
> +			.size =	          0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* IFC */ {
> +			.phys_start = 0x01530000,
> +			.virt_start = 0x01530000,
> +			.size =	         0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* QSPI */ {
> +			.phys_start = 0x01550000,
> +			.virt_start = 0x01550000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* esdhc */ {
> +			.phys_start = 0x01560000,
> +			.virt_start = 0x01560000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* scfg */ {
> +			.phys_start = 0x01570000,
> +			.virt_start = 0x01570000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* crypto */ {
> +			.phys_start = 0x01700000,
> +			.virt_start = 0x01700000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* qman */ {
> +			.phys_start = 0x01880000,
> +			.virt_start = 0x01880000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +                /* bman */ {
> +                        .phys_start = 0x01890000,
> +                        .virt_start = 0x01890000,
> +                        .size = 0x10000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +		/* fman */ {
> +			.phys_start = 0x01a00000,
> +			.virt_start = 0x01a00000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* qportals CE */ {
> +			.phys_start = 0x500000000,
> +			.virt_start = 0x500000000,
> +			.size = 0x4000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +		/* qportals CI */ {
> +			.phys_start = 0x504000000,
> +			.virt_start = 0x504000000,
> +			.size = 0x4000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* bportals CE */ {
> +			.phys_start = 0x508000000,
> +			.virt_start = 0x508000000,
> +			.size = 0x4000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +		/* bportals CI */ {
> +			.phys_start = 0x50c000000,
> +			.virt_start = 0x50c000000,
> +			.size = 0x4000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* dcfg */ {
> +			.phys_start = 0x01ee0000,
> +			.virt_start = 0x01ee0000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +                /* clockgen */ {
> +                        .phys_start = 0x01ee1000,
> +                        .virt_start = 0x01ee1000,
> +                        .size = 0x1000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +		/* rcpm */ {
> +			.phys_start = 0x01ee2000,
> +			.virt_start = 0x01ee2000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* tmu */ {
> +			.phys_start = 0x01f00000,
> +			.virt_start = 0x01f00000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* dspi */ {
> +			.phys_start = 0x02100000,
> +			.virt_start = 0x02100000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* i2c0 */ {
> +			.phys_start = 0x02180000,
> +			.virt_start = 0x02180000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* i2c1 */ {
> +			.phys_start = 0x02190000,
> +			.virt_start = 0x02190000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* i2c2 */ {
> +			.phys_start = 0x021a0000,
> +			.virt_start = 0x021a0000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* i2c3 */ {
> +			.phys_start = 0x021b0000,
> +			.virt_start = 0x021b0000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* duart1 */ {
> +			.phys_start = 0x021c0000,
> +			.virt_start = 0x021c0000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* duart2 */ {
> +			.phys_start = 0x021d0000,
> +			.virt_start = 0x021d0000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* gpio0 */ {
> +			.phys_start = 0x02300000,
> +			.virt_start = 0x02300000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* gpio1 */ {
> +			.phys_start = 0x02310000,
> +			.virt_start = 0x02310000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* gpio2 */ {
> +			.phys_start = 0x02320000,
> +			.virt_start = 0x02320000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* gpio3 */ {
> +			.phys_start = 0x02330000,
> +			.virt_start = 0x02330000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* lpuart0 */ {
> +			.phys_start = 0x02950000,
> +			.virt_start = 0x02950000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* lpuart1 */ {
> +			.phys_start = 0x02960000,
> +			.virt_start = 0x02960000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* lpuart2 */ {
> +			.phys_start = 0x02970000,
> +			.virt_start = 0x02970000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* lpuart3 */ {
> +			.phys_start = 0x02980000,
> +			.virt_start = 0x02980000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* lpuart4 */ {
> +			.phys_start = 0x02990000,
> +			.virt_start = 0x02990000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* lpuart5 */ {
> +			.phys_start = 0x029a0000,
> +			.virt_start = 0x029a0000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* wdog0 */ {
> +			.phys_start = 0x02ad0000,
> +			.virt_start = 0x02ad0000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* edma0 */ {
> +			.phys_start = 0x02c00000,
> +			.virt_start = 0x02c00000,
> +			.size = 0x30000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* usb0 */ {
> +			.phys_start = 0x02f00000,
> +			.virt_start = 0x02f00000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* usb1 */ {
> +			.phys_start = 0x03000000,
> +			.virt_start = 0x03000000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* usb2 */ {
> +			.phys_start = 0x03100000,
> +			.virt_start = 0x03100000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* sata */ {
> +			.phys_start = 0x03200000,
> +			.virt_start = 0x03200000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* msi1 */ {
> +			.phys_start = 0x01580000,
> +			.virt_start = 0x01580000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* msi2 */ {
> +			.phys_start = 0x01590000,
> +			.virt_start = 0x01590000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* msi3 */ {
> +			.phys_start = 0x015a0000,
> +			.virt_start = 0x015a0000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pcie0 */ {
> +			.phys_start = 0x03400000,
> +			.virt_start = 0x03400000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pcie1 */ {
> +			.phys_start = 0x03500000,
> +			.virt_start = 0x03500000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pcie2 */ {
> +			.phys_start = 0x03600000,
> +			.virt_start = 0x03600000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pcie2 pf0 */ {
> +			.phys_start = 0x036c0000,
> +			.virt_start = 0x036c0000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* PCI host bridge 0 */ {
> +			.phys_start = 0x4000000000,
> +			.virt_start = 0x4000000000,
> +			.size = 0x800000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* PCI host bridge 1 */ {
> +			.phys_start = 0x4800000000,
> +			.virt_start = 0x4800000000,
> +			.size = 0x800000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* PCI host bridge 2 */ {
> +			.phys_start = 0x5000000000,
> +			.virt_start = 0x5000000000,
> +			.size = 0x800000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +	},
> +
> +	.irqchips = {
> +		/* GIC */ {
> +			.address = 0x1410000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
> +			},
> +		},
> +		/* GIC */ {
> +			.address = 0x1410000,
> +			.pin_base = 160,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		{ /* IVSHMEM 00:00.0 (demo) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 0,
> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 0,
> +			.shmem_peers = 3,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +		{ /* IVSHMEM 00:01.0 (networking) */
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

You are missing the linux inmate dtb.

Also, inmate-demo and linux-demo should not overlap in CPUs (if you have
>2) so that you can run three cells in parallel.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8a7f2697-3782-61d5-d68d-859e20fa1269%40siemens.com.
