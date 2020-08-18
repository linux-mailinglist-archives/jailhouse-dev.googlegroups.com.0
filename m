Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCGH534QKGQENA6H3YQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E8248228
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 11:46:49 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id x68sf7591405ede.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 02:46:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597744009; cv=pass;
        d=google.com; s=arc-20160816;
        b=qOeQqh0meeVVwBSyfhL3WBrhQmiUabdi2z8UJqeQqthWByvXtWtzAhnBrDwt0Q75nv
         0+ItwQlxtp+ay6hy4GCE0GfYpE+ztOxM68tTJJJNBHs2cTu/TC7+ws06+4gUhu1LU7Qj
         oNE7AJVBebVgXm7QOVXqGmbG9MHWqOvQXNcCbjvvdmjgrQ4T1uzm0nqZGHfHFx4oRfRB
         dotFfsZPz2fnXOgNKoLzGpuerE2IbjoJyMNM6ASD4X/KV0XV+VOUi47O2RBpZe6acuoF
         2YuKo3eLQCpMMwPEmIEUIDSe8njW+8yJZRDFYroSPigmN2DKoOZB6d25p+RYfViMTh8G
         zSNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=JhP++XW2V6no/P7mcU9n/BW+sjG0bTUKn62OCQGv6QU=;
        b=TRS8KndTsW0uoK5aP9eLD3LkDGg8xnLvmFbgWDzqzQMrV9droK4+7EF/OoE8N75mR3
         /HVHq4DvKVD4cwALRg9AsA5ROWVkV6XaZ47XVr035UcY663hY6pfuqZ9brzz2oZTDsB6
         adyKIVfOeNpNOZSSwVLzkfl+2jCE8oC/bsxn30bsJpqkyBkSJz2g+OZWyR3/UXWWpiNz
         PyFUGa/jE1oLDjW2cTdSzrtRF1iUzdUCPMlw3cHZafvcWMhvZQTQQhlTfiYeb+jDfFVj
         RjgUuq7Em6O8FqKbAjdtrUDhypogkfmIbUb8eVqfbf9VA0wEpPH52zNBNOnyMlylbUSz
         QfUw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JhP++XW2V6no/P7mcU9n/BW+sjG0bTUKn62OCQGv6QU=;
        b=A1sizNXn1ZzD/hPsC94req3JHJpo7VNnEZQXiDWt8LGBJOW+6/zLX1brmGkOAqk04o
         pS80jn+OqG8f8AeD2AoOH5v+ZVlwKMbh2rGVbVzYDsvsfqAx9jLKNvBIIgXvqI6d+MJA
         Hlm5LorbGc+fRl8GXu7nYKdnYywQM938nIWqtXG7bKgpbDp05Qwca7tMBZl06Ftl53eH
         eP0kCAxCn0ZCaBb8mnOIRluLNzQP9/uw0bYYCxOzeXpBK81OD2YHLay6A7++0i7qG5D8
         5Nd8dZ0EXMW6aUWNmE4xxiJb3oFnXg+CkmyYJFOFLSh0ETXeudP0o75Tmq8hiQ02zms3
         C//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=JhP++XW2V6no/P7mcU9n/BW+sjG0bTUKn62OCQGv6QU=;
        b=U4k+rXuVNCFDGGBVGjzPJbgaBPFFwkb3Lwmz1ETtIsgEKvpitIfEChPXkBZzGFHGlH
         RwuDMhn3JAWkRaOfWt2k2NF0Z1ZPE1OpMBhLBWhZUGCAhr78WssD3o8P52jR9tZB+uGW
         HAmS6gEf7Yt2J6UnRdRdk5z2cU5GNkyOlUq6uVRnu2voL9wlPs6cXWM9SgJGAYcHyzN5
         PY3gOr/hh2ws2xEboN6JCjVfNnpl4FYTCvaDNKpJ073PQ9StE2kXmDLzO1wRb1RqgIX4
         /jbOnKzTNJUrbujR1P4q1i7/oCNt0CXwk8Ac71jYnqaz2TaDRsSTzTFvkvFjVy1N9VVe
         DsUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5316fhLiX4KrinLmssCbr495N2ReG9TTAKBlMuIOqicsj2DCGrV4
	4X0AjfzW8vC2Tna9TfK4jlE=
X-Google-Smtp-Source: ABdhPJwtORCg6Wrux6nQg1IhPkBHxEN1yeuZ1mtyCWvslC32IFvfDdNLwm0ZLlTFqILIWlgx+Glaog==
X-Received: by 2002:a05:6402:1591:: with SMTP id c17mr19318370edv.240.1597744009292;
        Tue, 18 Aug 2020 02:46:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:fb86:: with SMTP id e6ls3595531edq.3.gmail; Tue, 18 Aug
 2020 02:46:48 -0700 (PDT)
X-Received: by 2002:a50:935a:: with SMTP id n26mr19142921eda.107.1597744008346;
        Tue, 18 Aug 2020 02:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597744008; cv=none;
        d=google.com; s=arc-20160816;
        b=iPiyFhtai2kqqoILr5/WZeH8NyN7mgNzn+hhR279qHpHDHwn0/AIPWoQZNJ4ZrX+5j
         AkyhmGakxPJAICsZUXgvu4AfA/xnr1k0DKxMnyBO3K8MlNlfEy4+Kmn3sknKfhdqKTak
         A+fD83Mwibzi14GSXN9Ll01dPwDe/3FqzJSIqDEBkQC64vM9lsHResKLivV8b1/AAlem
         rFJdAgngGNQBWlOFeXTM4ON3sk6ka0oQROBTpotDXUcn+Sl2odZZ+s4vMdLW1qO6yFoW
         r8pOb+EPotVDQFtCvEeg/dWgx3UOKwHJxORGr3fm/fdEEq5kZZnNKEHbDn1l+t7Uz3SH
         22DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=6viYymbqU3Rq8i1KPE2r8EUAC2DfG714CoMFTrxj0I4=;
        b=HjVyrMHGlL2F6WXPR3IYAzVRQ3YOgYlC8pS7YPyKdP8UeocpZxWbe0Y9BW86LDFbic
         MD5eJTPKLo3aoxxNEvUduUNWas8Itk2wnZLEKTcjQqunW+PGy93hvdmnMenX6CoEnBEn
         jUguYUn3rDmiSwfPpA+B6Iaz1ifSQfWBi85m3hePWUjcP7nJILQlLcgdIKZZQYm0JgI1
         E1iY/5kt3D9wVQmPTy8K0jTzbBvbKr5BTlwRL3qYfgFsWhqip1tin2cNrGBXxYEP4/cK
         Blp2lDaUGuxgADc0lcQvvX9+Z3qtHLBMuux4z4pjE6gUlYebDZgvRlUJvKXP8YtjHj3c
         CvKw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id b5si752903edx.4.2020.08.18.02.46.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 02:46:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 07I9klbO015420
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 11:46:48 +0200
Received: from [139.22.40.250] ([139.22.40.250])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07I9kknn023533;
	Tue, 18 Aug 2020 11:46:46 +0200
Subject: Re: [PATCH] configs: arm64: Add support for RPi4 with more than 1G of
 memory
To: Jakub Luzny <jakub@luzny.cz>, jailhouse-dev@googlegroups.com
References: <20200817171736.78100-1-jakub@luzny.cz>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <57c67012-fee7-d7f1-1201-25415e39034a@siemens.com>
Date: Tue, 18 Aug 2020 11:46:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200817171736.78100-1-jakub@luzny.cz>
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

On 17.08.20 19:17, Jakub Luzny wrote:
> Add the required memory regions to support 2G, 4G and 8G RAM variants
> of the Raspberry Pi 4. Tested on all the bigger variants, not on 1G, as I don't
> have one on hand and it's not available anymore.
> 
> Also moved the memory used by Jailhouse for the hypervisor and cells from
> 0x30000000 to 0x20000000 to avoid conflict with GPU memory. That is fine for
> gpu_mem setting of up to 256. The memory is supposed to be reserved using
> reserved-memory node in the device tree. To support variants with >2G RAM,
> another region for PCI MMIO space has to be also reserved.
> ---
>  configs/arm64/rpi4-inmate-demo.c | 22 ++++++------
>  configs/arm64/rpi4-linux-demo.c  | 28 +++++++--------
>  configs/arm64/rpi4.c             | 62 +++++++++++++++++++++++---------
>  3 files changed, 71 insertions(+), 41 deletions(-)
> 
> diff --git a/configs/arm64/rpi4-inmate-demo.c b/configs/arm64/rpi4-inmate-demo.c
> index 62442e7c..09dfc1f0 100644
> --- a/configs/arm64/rpi4-inmate-demo.c
> +++ b/configs/arm64/rpi4-inmate-demo.c
> @@ -51,34 +51,34 @@ struct {
>  	.mem_regions = {
>  		/* IVSHMEM shared memory regions (demo) */
>  		{
> -			.phys_start = 0x3faf0000,
> -			.virt_start = 0x3faf0000,
> +			.phys_start = 0x2faf0000,
> +			.virt_start = 0x2faf0000,
>  			.size = 0x1000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		{
> -			.phys_start = 0x3faf1000,
> -			.virt_start = 0x3faf1000,
> +			.phys_start = 0x2faf1000,
> +			.virt_start = 0x2faf1000,
>  			.size = 0x9000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		{
> -			.phys_start = 0x3fafa000,
> -			.virt_start = 0x3fafa000,
> +			.phys_start = 0x2fafa000,
> +			.virt_start = 0x2fafa000,
>  			.size = 0x2000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		{
> -			.phys_start = 0x3fafc000,
> -			.virt_start = 0x3fafc000,
> +			.phys_start = 0x2fafc000,
> +			.virt_start = 0x2fafc000,
>  			.size = 0x2000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		{
> -			.phys_start = 0x3fafe000,
> -			.virt_start = 0x3fafe000,
> +			.phys_start = 0x2fafe000,
> +			.virt_start = 0x2fafe000,
>  			.size = 0x2000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>  		},
> @@ -91,7 +91,7 @@ struct {
>  				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		/* RAM */ {
> -			.phys_start = 0x3fa00000,
> +			.phys_start = 0x2fa00000,
>  			.virt_start = 0,
>  			.size = 0x00010000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> diff --git a/configs/arm64/rpi4-linux-demo.c b/configs/arm64/rpi4-linux-demo.c
> index 9e7fad26..cf36fa22 100644
> --- a/configs/arm64/rpi4-linux-demo.c
> +++ b/configs/arm64/rpi4-linux-demo.c
> @@ -52,39 +52,39 @@ struct {
>  	.mem_regions = {
>  		/* IVSHMEM shared memory regions (demo) */
>  		{
> -			.phys_start = 0x3faf0000,
> -			.virt_start = 0x3faf0000,
> +			.phys_start = 0x2faf0000,
> +			.virt_start = 0x2faf0000,
>  			.size = 0x1000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		{
> -			.phys_start = 0x3faf1000,
> -			.virt_start = 0x3faf1000,
> +			.phys_start = 0x2faf1000,
> +			.virt_start = 0x2faf1000,
>  			.size = 0x9000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		{
> -			.phys_start = 0x3fafa000,
> -			.virt_start = 0x3fafa000,
> +			.phys_start = 0x2fafa000,
> +			.virt_start = 0x2fafa000,
>  			.size = 0x2000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		{
> -			.phys_start = 0x3fafc000,
> -			.virt_start = 0x3fafc000,
> +			.phys_start = 0x2fafc000,
> +			.virt_start = 0x2fafc000,
>  			.size = 0x2000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		{
> -			.phys_start = 0x3fafe000,
> -			.virt_start = 0x3fafe000,
> +			.phys_start = 0x2fafe000,
> +			.virt_start = 0x2fafe000,
>  			.size = 0x2000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 1),
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x2fb00000, 1),
>  		/* UART */ {
>  			.phys_start = 0xfe215040,
>  			.virt_start = 0xfe215040,
> @@ -94,15 +94,15 @@ struct {
>  				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		/* RAM */ {
> -			.phys_start = 0x3f900000,
> +			.phys_start = 0x2f900000,
>  			.virt_start = 0,
>  			.size = 0x10000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>  		},
>  		/* RAM */ {
> -			.phys_start = 0x30000000,
> -			.virt_start = 0x30000000,
> +			.phys_start = 0x20000000,
> +			.virt_start = 0x20000000,
>  			.size = 0x8000000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> diff --git a/configs/arm64/rpi4.c b/configs/arm64/rpi4.c
> index 92463184..c25bd8d2 100644
> --- a/configs/arm64/rpi4.c
> +++ b/configs/arm64/rpi4.c
> @@ -1,7 +1,7 @@
>  /*
>   * Jailhouse, a Linux-based partitioning hypervisor
>   *
> - * Test configuration for Raspberry Pi 4 (32-bit, quad-core Cortex-A72, 1GB RAM)
> + * Test configuration for Raspberry Pi 4 (32-bit, quad-core Cortex-A72, 1GB, 2GB, 4GB or 8GB RAM)

Not sure anymore what I meant with "32-bit", that can be removed.

>   *
>   * Copyright (c) Siemens AG, 2020
>   *
> @@ -10,6 +10,9 @@
>   *
>   * This work is licensed under the terms of the GNU GPL, version 2.  See
>   * the COPYING file in the top-level directory.
> + *
> + * Reservation via device tree: reg = <0x0 0x20000000 0x10000000>;
> + *                              reg = <0x0 0xe0000000 0x200000>;

Why this split-up into two regions?

This will also mean I need to add a patch to [1] so that the DT will
carry the carve out. And drop the mem= from [2]. Or can we rearrange the
reservation to keep that mem= cut-off, at the price of wasting memory on
larger RPi variants?

>   */
>  
>  #include <jailhouse/types.h>
> @@ -18,7 +21,7 @@
>  struct {
>  	struct jailhouse_system header;
>  	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[12];
> +	struct jailhouse_memory mem_regions[15];
>  	struct jailhouse_irqchip irqchips[2];
>  	struct jailhouse_pci_device pci_devices[2];
>  } __attribute__((packed)) config = {
> @@ -27,7 +30,7 @@ struct {
>  		.revision = JAILHOUSE_CONFIG_REVISION,
>  		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
>  		.hypervisor_memory = {
> -			.phys_start = 0x3fc00000,
> +			.phys_start = 0x2fc00000,
>  			.size       = 0x00400000,
>  		},
>  		.debug_console = {
> @@ -70,37 +73,37 @@ struct {
>  	.mem_regions = {
>  		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
>  		{
> -			.phys_start = 0x3faf0000,
> -			.virt_start = 0x3faf0000,
> +			.phys_start = 0x2faf0000,
> +			.virt_start = 0x2faf0000,
>  			.size = 0x1000,
>  			.flags = JAILHOUSE_MEM_READ,
>  		},
>  		{
> -			.phys_start = 0x3faf1000,
> -			.virt_start = 0x3faf1000,
> +			.phys_start = 0x2faf1000,
> +			.virt_start = 0x2faf1000,
>  			.size = 0x9000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>  		},
>  		{
> -			.phys_start = 0x3fafa000,
> -			.virt_start = 0x3fafa000,
> +			.phys_start = 0x2fafa000,
> +			.virt_start = 0x2fafa000,
>  			.size = 0x2000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>  		},
>  		{
> -			.phys_start = 0x3fafc000,
> -			.virt_start = 0x3fafc000,
> +			.phys_start = 0x2fafc000,
> +			.virt_start = 0x2fafc000,
>  			.size = 0x2000,
>  			.flags = JAILHOUSE_MEM_READ,
>  		},
>  		{
> -			.phys_start = 0x3fafe000,
> -			.virt_start = 0x3fafe000,
> +			.phys_start = 0x2fafe000,
> +			.virt_start = 0x2fafe000,
>  			.size = 0x2000,
>  			.flags = JAILHOUSE_MEM_READ,
>  		},
>  		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 0),
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x2fb00000, 0),
>  		/* MMIO 1 (permissive) */ {
>  			.phys_start = 0xfd500000,
>  			.virt_start = 0xfd500000,
> @@ -115,10 +118,37 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_IO,
>  		},
> -		/* RAM */ {
> +		/* RAM (0M-~762M) */ {
>  			.phys_start = 0x0,
>  			.virt_start = 0x0,
> -			.size = 0x3fa10000,
> +			.size = 0x2fa10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +
> +		/* ~6M reserved for the hypervisor and the shared memory regions */
> +
> +		/* RAM (768M-3584M) */ {
> +			.phys_start = 0x30000000,
> +			.virt_start = 0x30000000,
> +			.size = 0xb0000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +
> +        /* 2M reserved for PCI MMIO space */
> +
> +        /* RAM (3586M-4032M) */ {
> +			.phys_start = 0xe0200000,
> +			.virt_start = 0xe0200000,
> +			.size = 0x1be00000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* RAM (4096M-8192M) */ {
> +			.phys_start = 0x100000000,
> +			.virt_start = 0x100000000,
> +			.size = 0x100000000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> 

Thanks,
Jan

[1] https://github.com/siemens/linux/commits/jailhouse-enabling/5.4-rpi
[2]
https://github.com/siemens/jailhouse-images/blob/master/recipes-bsp/rpi-firmware/files/cmdline.txt

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/57c67012-fee7-d7f1-1201-25415e39034a%40siemens.com.
