Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB6VJ2GBAMGQEELATOMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD273416C6
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:38:35 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id c7sf12540600wml.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 00:38:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616139514; cv=pass;
        d=google.com; s=arc-20160816;
        b=qq0k1r2et6xh9VsbjJjeaU30s0KPXVcManiFbehRXKtMZ1umP1juLW6KO5D+1Y+ram
         irM+hkQigPWpRXK2WuK9y3ZwEzgx4lUdpOw/hiT7TujVV0ecPJ3k9JYy/nixUpPpes1/
         uWkjyVcZ5EBe4CDlCue1QosFZ+GREyXD/vhOkcTAt8u75fQ4hE58XwW/GK5baFp/XhY2
         0G8WGkORIlkIkikr9JSSTNdCOTVjM5vUxlThN4ubKkK8NXvwzcmEY5EsfmjKANCuiN72
         NBGGvHw2uPpabQdFd+RukplU35HX3B3RaTkMYIIykum/ITxGuGqrvhCZu/ZNW7y4MLhD
         etJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=/uJKHA8wgujmMo8hERDCpra+ucVWvO3Ok5gA5dLsWms=;
        b=pu8BukwWUmvTV448chXqkjG4jQN8VdpQ6SvCAzSKjA8PUfUSZiX7RgZTCSuLDTaHgo
         5PofvZwOtO3GOi59Kr5G/DqtdOBZqBDjxBfaADnURB2EeZb5EpKJpknBwMAJ2NfP9v+4
         QR61Avn+ks0wxdWQk6Z0yM1nKTpSnlsjvAiFDuIX+9Q9mHGaydW2QlQuT+wwLLsXe12C
         /9oWe3ojvK5+egp54oVyAjPsLFHwHxESEIYh/ulQLPPW7I+HhS70uASGLd32WMthfEbg
         NJTLFf+0KsobtuQ0dR31+DAA57urKhIZ+wcZhL7smcvcG3nEs7jdaGgU/afqMXZsweim
         bQfw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/uJKHA8wgujmMo8hERDCpra+ucVWvO3Ok5gA5dLsWms=;
        b=TPW5hQn6wU/7p79nuYJol1Ofb+CtbzEcLEZWWh2unBo3FbfHSUlzGrO0avUx3osx2Q
         iamCI0XCzEray3Grv0L55sSK2HDH+suWP1wplWnAVsVm9T9MyiR2OOOhmF8nyN9UDWm6
         v+9RJc4GqkB2CAy/rMbIy67fM+SsVzXmXuMhrFIk8efDX6JwSARVZvU4SeH6NAROmi0K
         tSvNX+FL0lt6Yjhs8qvVDUUEKg0slEx0kgXxPKp0mVNM8R22FGPFRc96lahnzyeDFhDj
         a2y4eZo4XOIeHqZchbizEI+nlKAXaaSgi25PGSdRitLmqOydo4UZbg8RP+HsGS+Jzhma
         Y+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/uJKHA8wgujmMo8hERDCpra+ucVWvO3Ok5gA5dLsWms=;
        b=AQZD984YkRsG5vA/Z2pNI/AwEm6mS9nGTGUTqPSRQQ86s9BM564eEHi+0rRchbhXsl
         SOlqBsWjyzORxyNBts6apwPSVuoed69MiaavhDDTKtFFxQnSf+dNpIIRLTn8yvqNm2+l
         N59JyjZztfAWEY5py/T8h1p7uWV/dt9YVJSGz/tZvZt/GMgMMbO0K+N/2ly0eB+BfTBD
         zyaGn+Y/sKr3jfuuIi9PdE/g7N5sapDlXVre8OkE62tTVbIh/Xxl/H8a6XExEEGTMBhx
         EZxdniYcTPcn4hKSKSlQUlbSbU5CbqPK+5Lbh+jbkDWAkvF8tCZyai/4tkIIeVmFq39i
         rCZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531gDO5TZ4/PaxssJr2RtYFIsa02t4WC1M3gRG53YX2m1D6BF6s3
	OJa+NIuiGCWA0/phoqxJMHk=
X-Google-Smtp-Source: ABdhPJzhgO6apONTgdFISC9FPPCWXlms12QGo9seR6gdblfho4b2Ixx99qvnTy6MvKDt9odhF75tpQ==
X-Received: by 2002:adf:fb0e:: with SMTP id c14mr3168395wrr.140.1616139514761;
        Fri, 19 Mar 2021 00:38:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c763:: with SMTP id x3ls2163056wmk.1.canary-gmail; Fri,
 19 Mar 2021 00:38:33 -0700 (PDT)
X-Received: by 2002:a1c:7210:: with SMTP id n16mr2382625wmc.13.1616139513784;
        Fri, 19 Mar 2021 00:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616139513; cv=none;
        d=google.com; s=arc-20160816;
        b=XhlFb1gp2Cjx5+45Jd9WVqSFijKovTDWRkpOkeyo7/ZcsmbhG//8dgy1ePGTvVAVgS
         n2kI1FxRTacgS86/ptAQnUM+/zYbr6aVCZPFUwBrr24wJjGMqLaGWxW7XLWuGH/M2i7z
         fuxJ2lXxGpT0JWXiRp59X+zh59hdrxTwb+bWsKvNe1FrWpc3yhGTHU3czA/pkROeQ4MQ
         LY4/k74Ga9y8krAS3A1LMYkknUysFfTQpnBpIWibfjp0wL9GGROAmXgqyBkEeoQLMKBU
         LiP1s7zrMk+cZ0oAYe+i4n1iHe/AglxFNnII8VSM21/N+O2D1RKlTF+EbxPTIO02FX5u
         Lvzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ucZc2Of3F8ksGfwEAAQtVHVjGUxF95S0O19H8UfKrFc=;
        b=syb24Do3JsMfuO5BQPwXZyXbiqpV3g9148sZW9iaH7NmZWtpVO6b37NPhZVYVNkHJA
         z2IU5JkUWCkmM8+X1KXyVfHEWQ+UnEzBP003qywvQDJSnVnjFf/bKTy58W55WSRIRyrG
         /w3Qcw9FkKGCtrIxRE0lq7naMU9gsfy003FcrdtVMCJ43lH+xr+4opLMyZQcr9VfbK5q
         Ff0rI0+5qQ7YQ0+jIRbO+C0gg3UXUjowiQNKExBMErMCCaYL/iLXp6BaRv+er+1utZ0P
         a5kdDnx6pHgCrSMoMhF+r/hLzUGFrEabTIQbqAyJRRLY6eHdMvAnPCm/XWdkmSDrhZVk
         aowQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id t124si308122wmb.3.2021.03.19.00.38.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 00:38:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12J7cXHY025986
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Mar 2021 08:38:33 +0100
Received: from [167.87.41.130] ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12J7cWZF011572;
	Fri, 19 Mar 2021 08:38:33 +0100
Subject: Re: [PATCH 1/2] configs: arm64: Add support for NXP LS1028ARDB
 platform
To: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>,
        jailhouse-dev@googlegroups.com
References: <20210309161735.26777-1-anda-alexandra.dorneanu@nxp.com>
 <20210309161735.26777-2-anda-alexandra.dorneanu@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <015e353b-2e97-5939-3f80-e32da0787a14@siemens.com>
Date: Fri, 19 Mar 2021 08:38:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309161735.26777-2-anda-alexandra.dorneanu@nxp.com>
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

On 09.03.21 17:17, Anda-Alexandra Dorneanu wrote:
> Add root cell, inmate cell and Linux demo cell configuration files for NXP
> LS1028ARDB platform.
> 

Thanks for enabling another platform!

The config checker found one issue (likely minor):

$ jailhouse config check configs/arm64/ls1028a-rdb.cell \
    configs/arm64/ls1028a-rdb-linux-demo.cell \
    configs/arm64/ls1028a-rdb-inmate-demo.cell
Reading configuration set:
  Root cell:     ls1028a (configs/arm64/ls1028a-rdb.cell)
  Non-root cell: linux-inmate-demo
(configs/arm64/ls1028a-rdb-linux-demo.cell)
  Non-root cell: inmate-demo (configs/arm64/ls1028a-rdb-inmate-demo.cell)
Overlapping memory regions inside cell:

In cell 'ls1028a', region 8
  phys_start: 0x0000000080000000
  virt_start: 0x0000000080000000
  size:       0x0000000040000000
  flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_EXECUTE
physically and virtually overlaps with region 11
  phys_start: 0x00000000bf900000
  virt_start: 0x00000000bf900000
  size:       0x0000000000100000
  flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_EXECUTE

Overlapping memory regions with hypervisor: None
Missing PCI MMCONFIG interceptions: None
Missing resource interceptions for architecture x86: None

> Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
> ---
>  configs/arm64/ls1028a-rdb-inmate-demo.c | 132 +++++
>  configs/arm64/ls1028a-rdb-linux-demo.c  | 152 ++++++
>  configs/arm64/ls1028a-rdb.c             | 617 ++++++++++++++++++++++++
>  3 files changed, 901 insertions(+)
>  create mode 100644 configs/arm64/ls1028a-rdb-inmate-demo.c
>  create mode 100644 configs/arm64/ls1028a-rdb-linux-demo.c
>  create mode 100644 configs/arm64/ls1028a-rdb.c
> 
> diff --git a/configs/arm64/ls1028a-rdb-inmate-demo.c b/configs/arm64/ls1028a-rdb-inmate-demo.c
> new file mode 100644
> index 00000000..9646975d
> --- /dev/null
> +++ b/configs/arm64/ls1028a-rdb-inmate-demo.c
> @@ -0,0 +1,132 @@
> +/*
> + * Configuration for LS1028ARDB board - inmate demo
> + *
> + * Copyright NXP 2021
> + *
> + * Authors:
> + *  Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
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
> +	struct jailhouse_memory mem_regions[7];
> +	struct jailhouse_irqchip irqchips[2];
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
> +		.vpci_irq_base = 40 - 32,
> +
> +		.console = {
> +			.address = 0x21c0600,
> +			.divider = 0x6d,
> +			.type = JAILHOUSE_CON_TYPE_8250,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				JAILHOUSE_CON_REGDIST_1,
> +		},
> +	},
> +
> +	.cpus = {
> +		0x2,
> +	},
> +
> +	.mem_regions = {
> +		/* IVSHMEM shared memory region for 00:00.0 */ {
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
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* DUART1 */ {
> +			.phys_start = 0x21c0000,
> +			.virt_start = 0x21c0000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM */ {
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
> +			.address = 0x6000000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				1 << (40 - 32),
> +				0,
> +				0,
> +				0,
> +			},
> +		},
> +		/* GIC */ {
> +			.address = 0x6000000,
> +			.pin_base = 160,
> +			.pin_bitmap = {
> +				0,
> +				0,
> +				0,
> +				0,
> +			},
> +		},

Why listing this (second) entry when it is empty? Same for the Linux inmate.

> +	},
> +
> +	.pci_devices = {
> +		{ /* IVSHMEM 00:00.0 */
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
> +};
> diff --git a/configs/arm64/ls1028a-rdb-linux-demo.c b/configs/arm64/ls1028a-rdb-linux-demo.c
> new file mode 100644
> index 00000000..fff8599f
> --- /dev/null
> +++ b/configs/arm64/ls1028a-rdb-linux-demo.c
> @@ -0,0 +1,152 @@
> +/*
> + * Configuration for LS1028ARDB board - linux demo
> + *
> + * Copyright 2021 NXP
> + *
> + * Authors:
> + *  Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
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
> +	struct jailhouse_memory mem_regions[13];
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
> +		.vpci_irq_base = 40 - 32,
> +	},
> +
> +	.cpus = {
> +		0x2,
> +	},
> +
> +	.mem_regions = {
> +		/* IVSHMEM shared memory region for 00:00.0 */ {
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
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* IVSHMEM shared memory regions for 00:01.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 1),
> +		/* DUART1 */ {
> +			.phys_start = 0x21c0000,
> +			.virt_start = 0x21c0000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* clockgen */ {
> +                        .phys_start = 0x01300000,
> +                        .virt_start = 0x01300000,
> +                        .size = 0xa0000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +                },
> +		/* RAM */ {
> +			.phys_start = 0xbf900000,
> +			.virt_start = 0,
> +			.size = 0x00010000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* RAM */ {
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
> +		/* GIC */ {
> +			.address = 0x6000000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				1 << (40 - 32) | 1 << (41 - 32) |
> +				1 << (42 - 32) | 1 << (43 - 32),
> +				0,
> +				0,
> +				0,
> +			},
> +		},
> +		/* GIC */ {
> +			.address = 0x6000000,
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
> +		{ /* IVSHMEM 00:00.0 */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 0,
> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 1,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +		{ /* IVSHMEM 00:01.0 */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 0,
> +			.bdf = 1 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 4,
> +			.shmem_dev_id = 1,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +		},
> +	},
> +};
> diff --git a/configs/arm64/ls1028a-rdb.c b/configs/arm64/ls1028a-rdb.c
> new file mode 100644
> index 00000000..f61a1615
> --- /dev/null
> +++ b/configs/arm64/ls1028a-rdb.c
> @@ -0,0 +1,617 @@
> +/*
> + * Configuration for LS1028ARDB board
> + *
> + * Copyright 2021 NXP
> + *
> + * Authors:
> + *  Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
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
> +	struct jailhouse_memory mem_regions[77];
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
> +			.address = 0x21c0500,
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
> +				.gic_version = 3,
> +				.gicd_base = 0x6000000,
> +				.gicr_base = 0x6040000,
> +				.maintenance_irq = 25,
> +			},
> +		},
> +		.root_cell = {
> +			.name = "ls1028a",
> +			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +			.cpu_set_size = sizeof(config.cpus),
> +			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +			.num_irqchips = ARRAY_SIZE(config.irqchips),
> +			.vpci_irq_base = 50 - 32,
> +		},
> +	},
> +
> +	.cpus = {
> +		0x3,
> +	},
> +
> +	.mem_regions = {
> +		/* IVSHMEM shared memory region for 00:00.0 */ {
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
> +		/* IVSHMEM shared memory regions for 00:01.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 0),
> +		/* RAM - 1GB - root cell */ {
> +			.phys_start = 0x80000000,
> +			.virt_start = 0x80000000,
> +			.size = 0x40000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* DRAM2 6GB */ {
> +			.phys_start = 0x2080000000,
> +			.virt_start = 0x2080000000,
> +			.size = 0x80000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* RAM - ~1GB - inmate */ {
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
> +			.size =	0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* dcfg */ {
> +			.phys_start = 0x01e00000,
> +			.virt_start = 0x01e00000,
> +			.size =	0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* rst */ {
> +			.phys_start = 0x01e60000,
> +			.virt_start = 0x01e60000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* scfg */ {
> +			.phys_start = 0x01fc0000,
> +			.virt_start = 0x01fc0000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* clockgen */ {
> +			.phys_start = 0x01300000,
> +			.virt_start = 0x01300000,
> +			.size = 0xa0000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* i2c0 */ {
> +			.phys_start = 0x02000000,
> +			.virt_start = 0x02000000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* i2c1 */ {
> +			.phys_start = 0x02010000,
> +			.virt_start = 0x02010000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +                /* i2c2 */ {
> +                        .phys_start = 0x02020000,
> +                        .virt_start = 0x02020000,
> +                        .size = 0x10000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +		/* i2c3 */ {
> +			.phys_start = 0x02030000,
> +			.virt_start = 0x02030000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* i2c4 */ {
> +			.phys_start = 0x02040000,
> +			.virt_start = 0x02040000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* i2c5 */ {
> +			.phys_start = 0x02050000,
> +			.virt_start = 0x02050000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* i2c6 */ {
> +			.phys_start = 0x02060000,
> +			.virt_start = 0x02060000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* i2c7 */ {
> +			.phys_start = 0x02070000,
> +			.virt_start = 0x02070000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* fspi */ {
> +			.phys_start = 0x020c0000,
> +			.virt_start = 0x020c0000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +                /* dspi0 */ {
> +                        .phys_start = 0x02100000,
> +                        .virt_start = 0x02100000,
> +                        .size = 0x10000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +		/* dspi1 */ {
> +			.phys_start = 0x02110000,
> +			.virt_start = 0x02110000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* dspi2 */ {
> +			.phys_start = 0x02120000,
> +			.virt_start = 0x02120000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* esdhc */ {
> +			.phys_start = 0x02140000,
> +			.virt_start = 0x02140000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* esdhc1 */ {
> +			.phys_start = 0x02150000,
> +			.virt_start = 0x02150000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* can0 */ {
> +			.phys_start = 0x02180000,
> +			.virt_start = 0x02180000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* can1 */ {
> +			.phys_start = 0x02190000,
> +			.virt_start = 0x02190000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* duart0 */ {
> +			.phys_start = 0x021c0000,
> +			.virt_start = 0x021c0000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* lpuart0 */ {
> +			.phys_start = 0x02260000,
> +			.virt_start = 0x02260000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* lpuart1 */ {
> +			.phys_start = 0x02270000,
> +			.virt_start = 0x02270000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* lpuart2 */ {
> +			.phys_start = 0x02280000,
> +			.virt_start = 0x02280000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* lpuart3 */ {
> +			.phys_start = 0x02290000,
> +			.virt_start = 0x02290000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* lpuart4 */ {
> +			.phys_start = 0x022a0000,
> +			.virt_start = 0x022a0000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* lpuart5 */ {
> +			.phys_start = 0x022b0000,
> +			.virt_start = 0x022b0000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* edma0 */ {
> +			.phys_start = 0x022c0000,
> +			.virt_start = 0x022c0000,
> +			.size = 0x30000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* gpio1 */ {
> +			.phys_start = 0x02300000,
> +			.virt_start = 0x02300000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* gpio2 */ {
> +			.phys_start = 0x02310000,
> +			.virt_start = 0x02310000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* gpio3 */ {
> +			.phys_start = 0x02320000,
> +			.virt_start = 0x02320000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* usb0 */ {
> +			.phys_start = 0x03100000,
> +			.virt_start = 0x03100000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* usb1 */ {
> +			.phys_start = 0x03110000,
> +			.virt_start = 0x03110000,
> +			.size = 0x10000,
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
> +		/* pcie1 */ {
> +			.phys_start = 0x03400000,
> +			.virt_start = 0x03400000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pcie2 */ {
> +			.phys_start = 0x03500000,
> +			.virt_start = 0x03500000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pcie2 pf0 */ {
> +			.phys_start = 0x035c0000,
> +			.virt_start = 0x035c0000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pcie1 host bridge */ {
> +			.phys_start = 0x8000000000,
> +			.virt_start = 0x8000000000,
> +			.size = 0x800000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pcie2 host bridge */ {
> +			.phys_start = 0x8800000000,
> +			.virt_start = 0x8800000000,
> +			.size = 0x800000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* gic its */ {
> +			.phys_start = 0x06020000,
> +			.virt_start = 0x06020000,
> +			.size = 0x20000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* crypto */ {
> +			.phys_start = 0x08000000,
> +			.virt_start = 0x08000000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* wdog0 */ {
> +			.phys_start = 0x0c000000,
> +			.virt_start = 0x0c000000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* wdog1 */ {
> +			.phys_start = 0x0c010000,
> +			.virt_start = 0x0c010000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* gpu */ {
> +			.phys_start = 0x0f0c0000,
> +			.virt_start = 0x0f0c0000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* sai1 */ {
> +			.phys_start = 0x0f100000,
> +			.virt_start = 0x0f100000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* sai2 */ {
> +			.phys_start = 0x0f110000,
> +			.virt_start = 0x0f110000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* sai3 */ {
> +			.phys_start = 0x0f120000,
> +			.virt_start = 0x0f120000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* sai4 */ {
> +			.phys_start = 0x0f130000,
> +			.virt_start = 0x0f130000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* sai5 */ {
> +			.phys_start = 0x0f140000,
> +			.virt_start = 0x0f140000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* sai6 */ {
> +			.phys_start = 0x0f150000,
> +			.virt_start = 0x0f150000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* tmu */ {
> +			.phys_start = 0x01f80000,
> +			.virt_start = 0x01f80000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pcie  */ {
> +			.phys_start = 0x1f0000000,
> +			.virt_start = 0x1f0000000,
> +			.size = 0x10000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pwm0 */ {
> +			.phys_start = 0x02800000,
> +			.virt_start = 0x02800000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pwm1 */ {
> +			.phys_start = 0x02810000,
> +			.virt_start = 0x02810000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pwm2 */ {
> +			.phys_start = 0x02820000,
> +			.virt_start = 0x02820000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pwm3 */ {
> +			.phys_start = 0x02830000,
> +			.virt_start = 0x02830000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pwm4 */ {
> +			.phys_start = 0x02840000,
> +			.virt_start = 0x02840000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pwm5 */ {
> +			.phys_start = 0x02850000,
> +			.virt_start = 0x02850000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pwm6 */ {
> +			.phys_start = 0x02860000,
> +			.virt_start = 0x02860000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* pwm7 */ {
> +			.phys_start = 0x02870000,
> +			.virt_start = 0x02870000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* rcpm */ {
> +			.phys_start = 0x01e30000,
> +			.virt_start = 0x01e30000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* dpclk */ {
> +			.phys_start = 0x0f1f0000,
> +			.virt_start = 0x0f1f0000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* malidp */ {
> +			.phys_start = 0x0f080000,
> +			.virt_start = 0x0f080000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* hdptx0 */ {
> +			.phys_start = 0x0f200000,
> +			.virt_start = 0x0f200000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +	},
> +
> +	.irqchips = {
> +		/* GIC */ {
> +			.address = 0x6000000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
> +			},
> +		},
> +		/* GIC */ {
> +			.address = 0x6000000,
> +			.pin_base = 160,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		{ /* IVSHMEM 00:00.0 */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 0,
> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 0,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +		{ /* IVSHMEM 00:01.0 */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 0,
> +			.bdf = 1 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 4,
> +			.shmem_dev_id = 0,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +		},
> +	},
> +};
> +
> 

Rest appears fine.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/015e353b-2e97-5939-3f80-e32da0787a14%40siemens.com.
