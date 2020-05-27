Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOWUXH3AKGQE44AHDSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8B31E4388
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 15:25:14 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id c10sf10037209edw.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 06:25:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590585914; cv=pass;
        d=google.com; s=arc-20160816;
        b=GkPv7WU+M2AtBoFVhJhFk9Bncm0m7uRp4W77DjZ0RvqZbnwFcv6hOEzjnTNiX7/5DD
         e47/6Nvq0gaPudUvUmpurK1DksmAbibtFImKX6T302agBWVWmflSgea66+Vz+6WHhCmb
         bMtmax0QbYmvEfSBLXkJ9SizerGnH3i+e73XdFlXyWMJFFUwHzkTcdxG0x3K06afDqva
         QbvvYBRD8Q3PU0MrWFDeKpno6aIN158a0GehfkeORnOsh0re6xectSUZ7jEib6iayyyT
         d/Sz488aNVJE7x1hDLlhv1ywpTROCSX4cqZrfkR5qBvGyt8LbKqk2TuysvFy/lURC82e
         ghww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=doNw3Z2gNgmTtrsPlF2eqffPFdzg0MGRhDCrBE6PnSg=;
        b=g9OffwIvcBuTCYd0NKmFKHSrXP5Jm0XLp7iPDdxM6zEmDhiHx750E5h2KYxvgGxw90
         TcHjoasE1a0Y7loKpvQDwZG+szwoBdLcGWIdklysEQBYBKGnCMmGSOVEuzIgjjkDVzhy
         QvBdU96kiG2NwSOm3qmRijOKdK7sIggYE3SLAsNsWMjNCAeSL4tQs8V3p1LOsihO9QDF
         7jC6wX2drEL8y9G3hsA+50HZA7S3KSiGWNITriIQlc0XNurnPjLtMeIHUL+ksE3PD5BP
         Vrf0VbFzo3ZmQhLGgb9w/Q72IuQe7zvXRcxNHb8BQzc3BXn9gxK+fotr+XOogX3tqGXb
         GMhg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=doNw3Z2gNgmTtrsPlF2eqffPFdzg0MGRhDCrBE6PnSg=;
        b=HHUPUMlBng7D8c8Vd+Mna9CTLRv3XBQVXD6dEvNYTG46ZQnimnXSb7Zo2rx5cgeWOG
         2YO3gLAhgivOTzfX5oWTJ3CVF+Vi8SESpDhryc340sPgqRO7kFIFsgNTk6COQsJbuClU
         gRlP8Eco7fVfdPcO47CJ5GzndqSAD/wetHJwZ6ZzN0u0ROYmQ5wkfkTq0NWc7Ban4VhA
         67IgWH/UgXznCT+q7bxos/zmeVHiXuEAe42LLrQnjJVlJYtyhHunm0FNTLIHZejQq86V
         69Qs9C0WSHBN8buJV0RRIKk338RqYd0eL4kzDx6D0ZJ6vpXCieo21hAhpqDFuZYrSE1j
         pKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=doNw3Z2gNgmTtrsPlF2eqffPFdzg0MGRhDCrBE6PnSg=;
        b=IvkXKPnzDQFE3P5MAfoeM+3k9CcXYaHls4EKM0LN3KJJA1CFy6Hg4Zm7KyViILI4R8
         wLv3ifFfBx4LQ/2ESNt96D3FVsGNdZfFPcgbQ6vHayyM2IA8/y4OsYTptccrYEw9Z/WK
         HK6WpDLnQXDW2HD7J4p+VR2SMI0EZ4Tz3PUUEt8yzbwN4TZ+Pg7z7GYngGs7/3Uur1J1
         2YZ3bQ10UpZ+Xikj03ieaVm7kecjehALsTpqLsHL1veXLloXRBxRhybo472zXOs8HjtA
         4vHx9tZhg0gTo33Lqbbl6aNPiP8fjb0CU5RHoNOlx2JI6UPmRTFo7jfNUomna3pMZi9p
         ToLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533cereeMYDUQwbTA9LuMfKY755lweYJEQkj/39wpgtJtX3nB6qq
	VzvKlCRHI2AqOy2xmKkLgdg=
X-Google-Smtp-Source: ABdhPJxilSH9p34lZzHw3Hi5WLn8wxjEglq57MQjUgd9nvebCrcNueXoCayPaCF7bSfpC+1S2J+cpg==
X-Received: by 2002:a17:906:7750:: with SMTP id o16mr6339309ejn.12.1590585914631;
        Wed, 27 May 2020 06:25:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:8345:: with SMTP id b5ls6950430ejy.3.gmail; Wed, 27
 May 2020 06:25:13 -0700 (PDT)
X-Received: by 2002:a17:906:1359:: with SMTP id x25mr6567096ejb.42.1590585911250;
        Wed, 27 May 2020 06:25:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590585911; cv=none;
        d=google.com; s=arc-20160816;
        b=VbWMo6x1b5BqDqpG7+H4TJHmqga35fNjThOx9rlXipjyH5VHlXU4/kONQncsWHGFpd
         QPhuaU1SJqNnRX3DEHpO0cPt0J4VGDGEUWeoIEUQi0xza3BmJVg3L0abiOAnYOliu5WC
         E5rMRy3NS8RuFbYuNy+Jgetj3njncJJo1HMrY8EseW5iKiE+dscAnJ1JDzIEyQo4n93U
         YrP1guYS0/RclQB7zHpNP7pGgcb3s/O4yaod2h2StPJx/8rDRSGFXGsQBXo6LuIDKfJ0
         gIWWAFRu9x9WmSDFaU2PCxY/H6qPFGJg1uzV5KBoP0k9to0i0nImVrsz62OFiNtnwvx2
         QemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=1oAlTQEbPyCPa+tjOk6MwCuSLAj1uS/tpkUT3WjUW/Q=;
        b=z4I+bI1IymVtSwywD72kSWK/cDHvh2sCl1vul6IcBSLCSP3TmNuZzOUuNlncjP/UOu
         HxL0CJvUjvniV85Bx+GJEa7OkRDmMvJ6AFqser57tH/5ybcVFyyt/mJMQ8XAxdxJ38f/
         LWUR01AVAAITIhpXfEoQ1jOIAmCdGQFyZCsLgnq+0BKD2X/vg40+D/KsIq5zqCbjv+hF
         naHRd7qi6tJoKJ5ah/m506ugukeKfFURBSW37e2RXXZNC/OupjHyGY8IExyD3Xz40zfK
         naJM1BQ8PN1VB8b3O6zWSA4ATohcdIYvgjjLBRZgwsepYTdaeSYrCWGy5BqNlp+yRpN2
         9Z4g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id y22si134131eju.1.2020.05.27.06.25.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 06:25:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 04RDPAP4016590
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 May 2020 15:25:10 +0200
Received: from [167.87.6.205] ([167.87.6.205])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04RDP9x0030645;
	Wed, 27 May 2020 15:25:10 +0200
Subject: Re: [PATCH v1 2/4] configs: k3-j721e-evm-inmate-demo: Add ivshmem
 capability
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-3-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6e2a0459-3707-99ea-27b0-184f643d27fb@siemens.com>
Date: Wed, 27 May 2020 15:25:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527123225.31726-3-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 27.05.20 14:32, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Add a virtual PCI device with IVSHMEM type (id = 1)
> Create IVSHMEM regions for 2 peer communication
> Enable the vpci_irq for doorbell interrupt
> 
> This allows to run the ivshmem-demo baremetal inmate
> inside this cell.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  configs/arm64/k3-j721e-evm-inmate-demo.c | 63 ++++++++++++++++++++++--
>  1 file changed, 59 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/arm64/k3-j721e-evm-inmate-demo.c b/configs/arm64/k3-j721e-evm-inmate-demo.c
> index 7440a258..e09c4850 100644
> --- a/configs/arm64/k3-j721e-evm-inmate-demo.c
> +++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
> @@ -20,7 +20,9 @@
>  struct {
>  	struct jailhouse_cell_desc cell;
>  	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[3];
> +	struct jailhouse_memory mem_regions[7];
> +	struct jailhouse_irqchip irqchips[1];
> +	struct jailhouse_pci_device pci_devices[1];
>  } __attribute__((packed)) config = {
>  	.cell = {
>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> @@ -30,8 +32,9 @@ struct {
>  
>  		.cpu_set_size = sizeof(config.cpus),
>  		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> -		.num_irqchips = 0,
> -		.num_pci_devices = 0,
> +		.num_irqchips = 1,
> +		.num_pci_devices = 1,
> +		.vpci_irq_base = 195 -32,
>  
>  		.console = {
>  			.address = 0x02810000,
> @@ -48,6 +51,33 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
> +		{
> +			.phys_start = 0x89fe00000,
> +			.virt_start = 0x89fe00000,
> +			.size = 0x10000,

This means the kernel is configured for 64K pages - rather uncommon and
problematic in many regards (just had to turn it off on AM65x because it
breaks userspace [1]).

> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0x89fe10000,
> +			.virt_start = 0x89fe10000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
> +				 JAILHOUSE_MEM_WRITE ,
> +		},
> +		{
> +			.phys_start = 0x89fe20000,
> +			.virt_start = 0x89fe20000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0x89fe30000,
> +			.virt_start = 0x89fe30000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
> +				 JAILHOUSE_MEM_WRITE ,
> +		},
>  		/* main_uart1 */ {
>  			.phys_start = 0x02810000,
>  			.virt_start = 0x02810000,
> @@ -68,5 +98,30 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_COMM_REGION,
>  		},
> -	}
> +	},
> +
> +	.irqchips = {
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 160,
> +			/*
> +			 * virtual PCI SPI_163		=> idx 1 bit [3]
> +			 */
> +			.pin_bitmap = {
> +				0x00000000, 0x00000008, 0x00000000, 0x00000000,
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		/* 00:00.0 */ {
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,

This constant assumes 4K pages.

Given all the problems with 64K, I suspect it's better to switch to
standard 4K.

Jan

> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 1,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +	},
>  };
> 

[1]
https://github.com/siemens/meta-iot2050/commit/fb1d72677fb7443d851b032517d693bbd0e1d1e4

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6e2a0459-3707-99ea-27b0-184f643d27fb%40siemens.com.
