Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIFXU77AKGQEPZFYO5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id D03BD2CE84A
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Dec 2020 07:48:00 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id w17sf2137652wrp.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Dec 2020 22:48:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607064480; cv=pass;
        d=google.com; s=arc-20160816;
        b=ceF5Ty8yUDQqALmV+tLOiyTngE26cjz/UPRAHa05bzWHaZfL3GcVF/Dl7diMEk3VQ8
         0tNbf9sWny7k2ls0iQPv7T7SdJmP7/sPQGITjD23Lvm4l2wFWheh3rkvSNTJrhZ8C2tX
         y3gJWReDcWlwZOxl/bhNPAS+FeD2dIggDYy0Q1rHP3ZoZ9oaNEnIRb6L1CFhcEu9VveP
         gMsMUay+lJG2M85rOEdTK4NB3ztcGsKLKtDJUQHV1/QsmVYM9nO6abxcgb42Qk7qp+7m
         0g5ftvG23sXDXuCe+1Fgv5KyfFvbdfOx0OQhq8G58SrktqlneAZdusDHtcB21RQZFzq7
         cgHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=zFSqDAJquyWD2zIkaswzaR8OhYxgNM5QM+4RBLeNSig=;
        b=H+97tQ2nKCTHN7FzVdnaUJYZP4LFS6Azzuqy+HdTcz6j+Xmkf2J4dEiwfrN0fiF+Bs
         tN4AFRGhbVqPNOqUmrRmC5rwwB4CP86MnjQX464jxxsgcVTdE2PApcidX0evEodd/3j5
         /sixNEN1wTlxKMhMEgVBqjCfNBVALzgDoKZMv2YU4ZUW46v+aIvoojGU4YI6zpEPSCxq
         22J3cBme/1PJePz9FZ+Ogt43xSQbUHB2jy4W6qscEy5r5pGpxJLs6O6eH4vLwLN5Udhm
         JUdKnHkBQLeHMqDZ70otsjQ9J/kFMZiVaRi7oWar15PJCNdBbtSwFSp6IUy1FKxETNYl
         PCVQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zFSqDAJquyWD2zIkaswzaR8OhYxgNM5QM+4RBLeNSig=;
        b=nWo+hH2oEkuQlJJRupELtloBR6j4smT9u3KCsiJYBddyv/a36X7vT6q1pbebBT24O6
         DcD4ZAzz/vLs/yPc8r1lR/fWw8pBSECm9tdwTo3mIpF3u5EAX/iS6WmeiZCj88546yf8
         QaACNKIWPZETlWu5aSxU8UteomRfgkPyEYccw2n5fkcCTuZXuj7nuhHlfhk33Od5JrIn
         cfpw7wdz5eUm7HXNqRFwWj9AXOvMQOqQKGyPYqVjXUGdS8h46LpJf82kznTS01bQjLhs
         bDpHl1KuROTLk1p50PKgY/KAVsRzsE7PGzazo3pSWSQApAJRqP0pl8ngH8qGkjRMpU6d
         p83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zFSqDAJquyWD2zIkaswzaR8OhYxgNM5QM+4RBLeNSig=;
        b=JhiYm1oDMg3dDXq6aFHS9XDqODWm7hG7j4Lod2TONgCFZjR7dMezvIAxJGPdNrbfeT
         KrhNAnBMnz7Ql7T9wrZI7/dv/7USublsQsbKDYaJrIL2uOGcqxxQZAk88XA+qh47rxSU
         AP6MR5G9A0FKKcQsn8mMEnQANxTADVVjMgwVvdFwYTJMjsrhZ+RsOUf/L2bhHn+MSw8A
         DIX1l1xfwxPAlmxU5kzsn8ZjxLrrfkPwIT+yYQRV1R1HKsB1pcrosHM1C+ogoQNU7qPy
         ZQ6Ew8kXcwscWyMnXb+4rJWb3fzfllXQtv2ZPhCvnYCW7Or6u9hYswlixBoRZRdm3/YL
         eLCg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ZT/qQXo6SweOPSwl9xC24oMkfwu3diC2j23KIuZu+Oe1dPXz0
	MxBByH8NGhVJ4uWOZ2S5g9M=
X-Google-Smtp-Source: ABdhPJzs4zVnjcBwKu7w5g6JJWBCulBYFKIMsBvfvUz+elKPZUUy0084LnPx3kAwOXhPR2lNHaC5zg==
X-Received: by 2002:a5d:6452:: with SMTP id d18mr3253084wrw.200.1607064480580;
        Thu, 03 Dec 2020 22:48:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c5d2:: with SMTP id n18ls3711187wmk.0.gmail; Thu, 03 Dec
 2020 22:47:59 -0800 (PST)
X-Received: by 2002:a05:600c:2903:: with SMTP id i3mr2416634wmd.41.1607064479490;
        Thu, 03 Dec 2020 22:47:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607064479; cv=none;
        d=google.com; s=arc-20160816;
        b=tb0A24zEM1deQputsrpzYF6YmH82jLOovq9KCeGz0GghxQwiLa6OPIQN92BtRDEuDO
         mnLI7YpxZmFQqQ73hguAlGVhnNSAc35lUtl5Ai6ijH9y5WvaZX2Epz/MYXrDClWxeBcq
         R8tAcoexqggsr2ad2+duUhYALZM+RYEgCy4YTUujekXYfYFNhWcwmkluj91A0pVANRqr
         wkg+hgO7xfsI7SVR1Sql+X6YwhQ7Ghvmg8Mg7gpwYXPIDTghGTOL58nmMi3GCGlHzqwf
         7SBZscDwz81alqDyjptwyIm/KyBRIeM6ogoBNynVdmM3WkQo0diZCsvRmijP0B74DFiM
         mDfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=2nhEIx3EgVtNvlIqZ3LDBlDR7lyztG4VNkA+wv10Xg0=;
        b=Hz8DpkzqtWW33Rp+siEb3pIgXbyGacVNLk1x3F3/8d72fv9YCevj1EXnEfwyavjIPf
         +uUBAJEOJWfsmqRe6+e0DYWgLdpmmq3bKrG0kLN2kN0Vqdi74mmF/g43Oq/WDnzHU43g
         dx1NL0UO0xB9VJOoWb560MTZJr2BdlGhdakKwCIaMIrwBxWLcld+8yZyhrM/a+Uyg9ZW
         3eLuL4Gp5MfKPdjWVqqafLyVhWVhhICie11fvUvaj5yBpsfObccc9ndJQAc4hqosMK4i
         cgz3aTSE0LTJL+JFNzzc2XdYGe9X9v9vWwiAt3ODHEOrdbD+9PYVGYkl1D2Hfex9Deqn
         O7HQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id x12si69358wmk.1.2020.12.03.22.47.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Dec 2020 22:47:59 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0B46lx7X014358
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Dec 2020 07:47:59 +0100
Received: from [167.87.33.175] ([167.87.33.175])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B46lwGw004262;
	Fri, 4 Dec 2020 07:47:58 +0100
Subject: Re: [PATCH v3 1/2] configs: ls1046a-rdb: add cell configure files
To: Jiafei Pan <Jiafei.Pan@nxp.com>, jailhouse-dev@googlegroups.com
References: <20201204034516.20000-1-Jiafei.Pan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <02423cc3-fb1a-5edf-a1c3-d4f7a762aff2@siemens.com>
Date: Fri, 4 Dec 2020 07:47:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204034516.20000-1-Jiafei.Pan@nxp.com>
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

On 04.12.20 04:45, Jiafei Pan wrote:
> Add root cell, inmate cell, and Linux demo cell configure files
> for NXP ls1046a RDB platform.
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> ---
> Change in v3:
> 	- Merge inmate demo and ivshmem demo configure files
> 
> Change in v2:
> 	- Removed some annotated code
> 
> 
>  configs/arm64/ls1046a-rdb-inmate-demo.c | 139 +++++++
>  configs/arm64/ls1046a-rdb-linux-demo.c  | 165 ++++++++
>  configs/arm64/ls1046a-rdb.c             | 517 ++++++++++++++++++++++++
>  3 files changed, 821 insertions(+)
>  create mode 100644 configs/arm64/ls1046a-rdb-inmate-demo.c
>  create mode 100644 configs/arm64/ls1046a-rdb-linux-demo.c
>  create mode 100644 configs/arm64/ls1046a-rdb.c
> 
> diff --git a/configs/arm64/ls1046a-rdb-inmate-demo.c b/configs/arm64/ls1046a-rdb-inmate-demo.c
> new file mode 100644
> index 00000000..b2b7c516
> --- /dev/null
> +++ b/configs/arm64/ls1046a-rdb-inmate-demo.c
> @@ -0,0 +1,139 @@
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
> +	struct jailhouse_memory mem_regions[8];
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

This still overlaps with the linux inmate. I'm fixing this on merge.

Jan

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
> +		{
> +			.phys_start = 0xfb70e000,
> +			.virt_start = 0xfb70e000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
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
> index 00000000..6bba61fb
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
> index 00000000..d05c1628
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


-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/02423cc3-fb1a-5edf-a1c3-d4f7a762aff2%40siemens.com.
