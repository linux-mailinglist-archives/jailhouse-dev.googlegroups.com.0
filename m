Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB7MVUWGQMGQEW5A67EI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B22466D10
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Dec 2021 23:38:53 +0100 (CET)
Received: by mail-ed1-x53e.google.com with SMTP id m12-20020a056402430c00b003e9f10bbb7dsf809550edc.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Dec 2021 14:38:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638484733; cv=pass;
        d=google.com; s=arc-20160816;
        b=g/p1yVJ7MhmHOejPJ+U+XzEhGcm+wFk8lTJI92TKO48DlxDn6lJH5YeBVUu6ivkEh4
         wBsUSdn+udHvQJXL6DhzI7aweKS9j5QWqqRaJcCZkjBQOZ7bzvBQNLN7NoJHk9f60y8d
         3U18/1WzmBHTlZvp/CAM4YrTE+C1W5OIFJkoEIinD6ZCFpkWh8szcr+wt5EW9AH73XLQ
         IgQb1sNQh9HqAXDKfvr3tyQ0Dpm9+Scu/IPSrVOeisNxgqZtc8xIZCP+a320NZnWjT9x
         dMQIO7tlbdvEzWj6gmgBU7gnhnQpcbsdcVqjmK60oUcT6gO0HmWRM78VejdSSDl7y2Jr
         phFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=TUKap3MsvJwqu8QQp7MspTI+rhP8giiXkS52z/tuJZ0=;
        b=Ga3hLqVjNjFmOoedJSDbJQvIJdMaISsNG9+2xMTJeB/cW459h7sxARRi9LCufUZSbb
         ULaUF5jM2j7tTMCQYk9QmzOj8WiuEg5wU78i7pNvQuYPYZK7dIsSewaeWWbCO+sQ/ujZ
         k/+fE4KvVxGvhlJIsKcwmTTOrxpIw2VJ4tWk62Xm/NbS4R4CkeIjCUmLrjmvZKIu3kTL
         c9dxxI4yVi8NVwJvb1AoJp/VnF63IhCqiFvx0eATNZuoaQMI1l4mwlFjgQ9yBtXeFvPA
         5TA0N3yKduYMxnhGQCJc7ralr4vsdfKnVL8JPWjMc/VmsY15p2F/QARtq3SzkuVXzvjg
         NABg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=FfKZfGJB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TUKap3MsvJwqu8QQp7MspTI+rhP8giiXkS52z/tuJZ0=;
        b=JRsO4vp5YQUi9aPIJm6sPaKU9AcG4YyS9YmAP9kNKZk3FJGlgHvJdgbrxNTh9qOH14
         TcW6sDx8LOBm4UuxQpXqNxM9DbgOMLIPQV9lBsLPnAWTfAghd2gh0kELd9JYASFCMJIO
         z6ZQiScoUX/wiF8uV1jhxU3/T0AUsqOjLhL0B2L9t/Hd0wWs7Os5Nn3GQJ7B6GLGs3Bp
         /XoE2rCFeCMiuLssW0WIJV1pvicoUl5kwm9KIJBGRnN1HUBfAeG0ILDii+/ob+CkUopB
         y+luvGPk0D1zQ8ippETAq1YBpK5iwqSQ72Kf7QMrQfh9pdZFtvO2N077W1dsj5SB2A6P
         9eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TUKap3MsvJwqu8QQp7MspTI+rhP8giiXkS52z/tuJZ0=;
        b=mU49FC1o1PPlxSdC8QhFv9Gs28XoO9t03LfPbEARzra0zIFTUTX9g1Qe4kyHMwCqs+
         1p8/qAL1PRAE93xtlIx7L2SPIFuISb6GFM62Kxcb8NG7Pm96vSwvEYL3TuFTeVxpdTAQ
         m0O9Qm7fKr9o3AXQawSxHK5uQMi/AZsdnllDQsLbUdbBTIflUqMU2QqWj32L7JyDRUgF
         jzSvUAvzxGL5oNPtYad48zv/7DC3lYd60eiYMYFNlKL7TFQ+EL4ASUTNobNtFsuhCkZq
         NQVAKxf9YZeyBhWXAIEN4hlWHkfegdo52QDVokaKBTs+U6t7QrGPbTp1NmsSn6K+EE3D
         jFpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5330Y0ZZG4OAyRddYGFhu/yHTJTXdVyBaDxWbQrILzDnb+M5gc8q
	9tPHg1rDQItirrpJqvMNnPk=
X-Google-Smtp-Source: ABdhPJw6EjaQRr76ZvoFCtLkpJdc1+hLIfn2GIuE2/LxPD5aKJ8MaVFDzId/NjHzbe+FvxwUTxGSFg==
X-Received: by 2002:aa7:db8d:: with SMTP id u13mr20688496edt.111.1638484733198;
        Thu, 02 Dec 2021 14:38:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:3d8e:: with SMTP id he14ls3048442ejc.6.gmail; Thu,
 02 Dec 2021 14:38:52 -0800 (PST)
X-Received: by 2002:a17:906:4bcf:: with SMTP id x15mr18741107ejv.273.1638484732164;
        Thu, 02 Dec 2021 14:38:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638484732; cv=none;
        d=google.com; s=arc-20160816;
        b=X7RgV6eBxHlnjXtPJvxlTEGdLPjcqLyBN5T0HSDI054+cTh5NQ6pn74TP/hKkI4/dF
         inu3YEwgpT1eBYygBoRv4DRwgo5Tb8I7KuDPvSgPsyBVlYhqWaNT3qwwrf21K/gitWho
         8c5T4h8+BKfwB5L0ctyQwyoJ0sTisPYncLRKtzGIeNGQS/1KdxEjM3H+lZkdiIaConwS
         cEV0xDGVI0BBSfoVrsk6qcq4z0i7hEE6BldbTeRoFlKTD3vBQ8IKMoQu2LQ+RC5Ln5g+
         4FMdWyrZR1eW9Mn/ybe6v14k4mR3wp6cGWv6/+AiLi4CJE589JU3hDhOaGuMTyNVN0st
         M0Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1bYlWeNIS1D2S5eaVb2xlhOm9oTemr17h/swirDlV30=;
        b=LQdPwHBRVrbJ6j18APcdhGkSiC/BuqaD/Zqg8lLJv51Ov3sT44Tz5G/vkhbzKRgQto
         005/QKpaSbWDr8PLLGYCL+WkUKlIsEfQ6II9sF4BbFZAmPCKoXLd1s0+setfjlkdLqSm
         VgSHMLEVGI0mNivZGAmzP+6E+qIbYcnnE+SHEv9HNVXIR1iiTIxg4Cf2upqWepPAhKRP
         uSzva7JSjBLqfaCJ0p+6vZ7ZJc5bsAe5oL9IzgAZPKWcxHuUS+24yEKnMwi7yn1OTrwl
         VBciYgD5MWwBGGXFfmjFL3jHfZGLTqH7rJrc/ECrl1lO33dZUAoDQsbYp8B60TU2hz1Z
         ncFg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=FfKZfGJB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id i23si51426edr.1.2021.12.02.14.38.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Dec 2021 14:38:52 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4J4rTl4Ydlzy1c;
	Thu,  2 Dec 2021 23:38:51 +0100 (CET)
Received: from [172.23.3.21] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 23:38:51 +0100
Message-ID: <b585ed4e-136f-34c9-a9a6-8f98050ac3ed@oth-regensburg.de>
Date: Thu, 2 Dec 2021 23:38:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [EXT] [PATCH v3 1/2] [RFC] configs: Introduce helper files to
 create inmate cell config
Content-Language: en-US
To: Stephane Viau <stephane.viau@oss.nxp.com>,
	<jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
References: <20211202154800.2671-1-stephane.viau@oss.nxp.com>
 <20211202154800.2671-2-stephane.viau@oss.nxp.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20211202154800.2671-2-stephane.viau@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=FfKZfGJB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 02/12/2021 16:47, Stephane Viau wrote:
> Inmate cell configurations all look alike - more or less.
> Let's create a couple of header files to hide the fastidious stuff
> (structure field names and so on) so that .c cell configuration files
> look a bit less ugly.
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> 
> ---
> 
> v2 -> v3:
> - Get rid of the *_NUM macros in config files and have them computed
>    instead (suggested by Ralf)
> 
> v1 -> v2:
> - Add PCI and Console helpers (needed for inmate cell conversion example)
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> ---
>   configs/arm64/cell-create.h   |  75 +++++++++++++++++++++++
>   configs/arm64/cell-helper.h   | 108 ++++++++++++++++++++++++++++++++++
>   configs/arm64/cell-template.c |  48 +++++++++++++++
>   3 files changed, 231 insertions(+)
>   create mode 100644 configs/arm64/cell-create.h
>   create mode 100644 configs/arm64/cell-helper.h
>   create mode 100644 configs/arm64/cell-template.c
> 
> diff --git a/configs/arm64/cell-create.h b/configs/arm64/cell-create.h
> new file mode 100644
> index 00000000..bfa9471b
> --- /dev/null
> +++ b/configs/arm64/cell-create.h
> @@ -0,0 +1,75 @@
> +/*
> + * Cell Configuration - Structure definition
> + *
> + * Copyright 2021 NXP
> + *
> + * Authors:
> + *  Stephane Viau <stephane.viau@nxp.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/types.h>
> +#include <jailhouse/cell-config.h>
> +
> +#define CONFIG_INMATE_REGIONS_NUM \
> +	(sizeof((struct jailhouse_memory[]){CONFIG_INMATE_REGIONS}) \
> +	/ sizeof(struct jailhouse_memory))
> +
> +#define CONFIG_INMATE_PCI_DEVICES_NUM \
> +	(sizeof((struct jailhouse_pci_device[]){CONFIG_INMATE_PCI_DEVICES}) \
> +	/ sizeof(struct jailhouse_pci_device))

Yep, that's nice. Did you check if we can use the ARRAY_SIZE() macro 
here to make it a bit smaller? Otherwise, I'd define a short helper that 
helps to avoid the almost same redundant definition.

> +
> +struct {
> +	struct jailhouse_cell_desc cell;
> +	__u64 cpus[1];
> +	struct jailhouse_memory mem_regions[CONFIG_INMATE_REGIONS_NUM + 1];
> +	struct jailhouse_irqchip irqchips[1];
> +	struct jailhouse_pci_device pci_devices[CONFIG_INMATE_PCI_DEVICES_NUM];
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = CONFIG_INMATE_NAME,
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> +
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
> +		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +		.cpu_reset_address = CONFIG_INMATE_BASE,
> +#ifdef CONFIG_INMATE_VPCI_IRQ_BASE
> +		.vpci_irq_base = CONFIG_INMATE_VPCI_IRQ_BASE,
> +#endif
> +#ifdef CONFIG_INMATE_CONSOLE
> +		.console = CONFIG_INMATE_CONSOLE,
> +#endif
> +	},
> +
> +	.cpus = {
> +		/*
> +		 * bitmap of cores used by the inmate cell
> +		 */
> +		CONFIG_INMATE_CORE_BITMAP,
> +	},
> +
> +	.mem_regions = {
> +		COMM_REGION_RW(0x80000000, KB(4)), /* communication region */
> +		CONFIG_INMATE_REGIONS
> +	},
> +
> +	.irqchips = {
> +		{
> +			.address = CONFIG_INMATE_IRQCHIPS_ADDR,
> +			.pin_base = CONFIG_INMATE_IRQCHIPS_BASE,
> +			.pin_bitmap = {
> +				CONFIG_INMATE_IRQCHIPS_BITMAP
> +			}
> +		}
> +	},
> +
> +	.pci_devices = {
> +		CONFIG_INMATE_PCI_DEVICES
> +	},
> +};
> diff --git a/configs/arm64/cell-helper.h b/configs/arm64/cell-helper.h
> new file mode 100644
> index 00000000..525d91c6
> --- /dev/null
> +++ b/configs/arm64/cell-helper.h
> @@ -0,0 +1,108 @@
> +/*
> + * Cell Configuration - Generic definitions
> + *
> + * Copyright 2021 NXP
> + *
> + * Authors:
> + *  Stephane Viau <stephane.viau@nxp.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef KB

Why do we need the ifndef? Is it defined anywhere else?

> +#define KB(bytes)	(1024 * (bytes))
> +#define MB(bytes)	(1024 * KB(bytes))

It's probably safer to use 1024ULL.

> +#endif
> +
> +#define REGION(phys, virt, bytes) \
> +	.phys_start = (phys), \
> +	.virt_start = (virt), \
> +	.size = (bytes) \

Just for consistency, I'd say to use

#define REGION(_phys, _virt, _size)



> +
> +#define MEM_REGION_ROS(phys, virt, bytes) \

and here as well, _phys, _virt_, _size.

> +	{ \
> +		REGION(phys, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, \
> +	}
> +
> +#define MEM_REGION_RW(phys, virt, bytes) \
> +	{ \
> +		REGION(phys, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, \
> +	}
> +
> +#define MEM_REGION_RWS(phys, virt, bytes) \
> +	{ \
> +		REGION(phys, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
> +			JAILHOUSE_MEM_ROOTSHARED, \
> +	}
> +
> +#define COMM_REGION_RW(virt, bytes) \
> +	{ \
> +		REGION(0x00000000, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
> +		         JAILHOUSE_MEM_COMM_REGION, \
> +	}
> +
> +#define MEM_REGION_RWX(phys, virt, bytes) \
> +	{ \
> +		REGION(phys, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
> +		         JAILHOUSE_MEM_EXECUTE, \
> +		}
> +
> +#define MEM_REGION_RWXL(phys, virt, bytes) \
> +	{ \
> +		REGION(phys, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
> +		         JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE, \
> +	}
> +
> +#define MMIO_REGION_RO(phys, virt, bytes) \
> +	{ \
> +		REGION(phys, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_IO, \
> +	}
> +
> +#define MMIO_REGION_ROS(phys, virt, bytes) \
> +	{ \
> +		REGION(phys, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_IO | \
> +		         JAILHOUSE_MEM_ROOTSHARED, \
> +	}
> +
> +#define MMIO_REGION_RW(phys, virt, bytes) \
> +	{ \
> +		REGION(phys, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
> +		         JAILHOUSE_MEM_IO, \
> +	}
> +
> +#define MMIO_REGION_RWS(phys, virt, bytes) \
> +	{ \
> +		REGION(phys, virt, bytes), \
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
> +		         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED, \
> +	}
> +
> +#define PCI_DEVICE_IVSHMEM(_domain, _bdf, regions_start, dev_id, peers) \
> +	{ \
> +		.type = JAILHOUSE_PCI_TYPE_IVSHMEM, \
> +		.domain = _domain, \
> +		.bdf = _bdf, \
> +		.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX, \
> +		.shmem_regions_start = regions_start, \
> +		.shmem_dev_id = dev_id, \
> +		.shmem_peers = peers, \
> +		.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED, \
> +	}
> +
> +#define CONSOLE(_address, _type, _flags) \
> +	{ \
> +		.address = _address, \
> +		.type = _type, \
> +		.flags = _flags, \
> +	}
> diff --git a/configs/arm64/cell-template.c b/configs/arm64/cell-template.c
> new file mode 100644
> index 00000000..8f57c387
> --- /dev/null
> +++ b/configs/arm64/cell-template.c
> @@ -0,0 +1,48 @@
> +/*
> + * Cell Configuration - Structure definition
> + *
> + * Copyright 2021 NXP
> + *
> + * Authors:
> + *  Stephane Viau <stephane.viau@nxp.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "cell-helper.h"
> +
> +/* Name, cores, entry point */
> +#define CONFIG_INMATE_NAME		"inmate-cell-name"
> +#define CONFIG_INMATE_CORE_BITMAP	(0b1100) /* inmate uses cores 2 and 3 */
> +#define CONFIG_INMATE_BASE		(0xc0000000) /* entry point in DDR */
> +
> +/* Memory & peripherals */
> +#define CONFIG_INMATE_REGIONS		\
> +	MEM_REGION_RWXL(0xc0000000, CONFIG_INMATE_BASE, MB(16)),   /* RAM */    \

Do we need the backslash at the end of the line? But nice, no more 
fiddling with the array size. :)

> +
> +/* GIC */
> +#define CONFIG_INMATE_IRQCHIPS_ADDR	(0x38800000) /* GIC DISTRIBUTOR BASE ADDR */
> +#define CONFIG_INMATE_IRQCHIPS_BASE	(32)
> +#define CONFIG_INMATE_IRQCHIPS_BITMAP	\
> +	/* interrupts 32..63 */         \
> +	0,                              \
> +	/* interrupts 64..95 */         \
> +	0,                              \
> +	/* interrupts 96..127 */        \
> +	1 << (76 + 32 - 96), /* SPI */  \
> +	/* interrupts 128..159 */       \
> +	0

I still think that rolling out the irqchip isn't worth it, LoC-wise. But 
let's wait for further comments/suggestions.

Thanks
   Ralf

> +
> +#define CONFIG_INMATE_VPCI_IRQ_BASE	(76)
> +
> +#define CONFIG_INMATE_PCI_DEVICES	\
> +	PCI_DEVICE_IVSHMEM(2, 0, 0, 1, 1)
> +
> +/*
> + * #define CONFIG_INMATE_CONSOLE \
> + * 	CONSOLE(0x30890000, JAILHOUSE_CON_TYPE_IMX, \
> + * 		JAILHOUSE_CON_ACCESS_MMIO | JAILHOUSE_CON_REGDIST_4)
> + */
> +
> +#include "cell-create.h"
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b585ed4e-136f-34c9-a9a6-8f98050ac3ed%40oth-regensburg.de.
