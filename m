Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCXYTX5AKGQEU6U534Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 76529254218
	for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Aug 2020 11:25:31 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id g3sf1308148wrx.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Aug 2020 02:25:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598520331; cv=pass;
        d=google.com; s=arc-20160816;
        b=IRb/2vAggzOEWOX0yu/4//tlLYxSkRiJTd8QTTZS/ZgqvM30PadXchSwTVNbs1XEPr
         Amk8ujEwTxfu6zYJGO0bYysQbiZJ6Te9IhMgkxbKnJ+XE8MOK/opS1jeSVZwhuAy4buM
         8iKPpo8OQFt+xY4hiBWQxKTj8pmHYg+q2BwLUygV0mltnpXX9wfr8hW2iOkwAaKivBIX
         2HFJPdMvDJ57/gxaLSn/kbuhs82fEiqyFiASIxB899pTjNaigqFurHF2hmxQ0KSHo0BA
         2bQH+wbH0fmV7/OMdNyKHBCeHXq7GBPhgkumOvZWMwzzZkb/3OGq/iC9lTG8qZoWl/Q0
         JBJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=c6G/THip+YzsDxoH4ga5daMaDk1LNWwzdvLmUEjSXFM=;
        b=NkzUcO3yY0cRkkMY+MO9EIbvQh9VsLqZQMfbY7n+KL7gdPg+EFOrnfhZzJ69l8dmub
         pImYWF2xzUXA7X1kmalcyjTsG0TirQqMZEKFvTI0DBj2lQL0/Ii1UaYL1nXoxUUNYFca
         SnDVtAjmedQj0yow2bgX9z1OvniaeDTGN9xwenmf/GENrkSQ+6w7T+SyuxL2ESztVHQE
         mdKf6MMOBYJw6FkICT0kUTOwdAlnSxzqPuR+jTI3TsSaFzLM+m7jei72N5gpddSw9rnv
         s6BvlzlTBnMCFvn9DVYNGWxfZmYn9gpPCtkoO8bu/kYvpr16RIDi5InvI/VrixK0vQXe
         E2OQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=c6G/THip+YzsDxoH4ga5daMaDk1LNWwzdvLmUEjSXFM=;
        b=VIZVvRWADp2y2CwqLz/euKFc0iNh0iodWDlx5MlkV31cWU9cWJsu/jjPik563X6MbW
         jiu2Upe3EEplcsJiZLpFcFXz80uCNhDDzm7eR2yl2XM72PFX0qSsalOpMAAh0mAFB+Ek
         qDYBbwWfXue0DdZ6+P+W/gga5hbsOeTMZGI/BTwx5lcb64kjuCujsmJwT9A9iv6mgf2m
         jrvWd4FSbk6QgEkmY4SUscidq5WnCIyq0ZTnIRjmb/w9H38paj1aCkdBKeVAm3cTNINS
         ATConYKjTMdDpAVwcud4K8kjeBDZB1mDTaVawHO0h6zpAlE7oAAm1YXK3ipm3RftALGv
         uOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=c6G/THip+YzsDxoH4ga5daMaDk1LNWwzdvLmUEjSXFM=;
        b=ADU9DDAbF/8SQc1HQDmM8ZkxWjiqV8b9NSTbvU/YhG6Reb7WKqX+x98EdSiJCI4U2N
         QNjFOsWEcyXmhQqZJOiun62oqcuUYvvgvGBfdXruVOD0zsW9FScT9XC6zpvO1FQ+cxHk
         enFVCEK4sfdmawRZzB8mx+U0Juj3UEY1wMxskmeTx2t9EwDQSgbNHxc7W3ektG8KdsBF
         COL0yh0K2rkJavNiDWez/Dza7XVd7L3IC/+c6Pl9Lr0ZwmMaVegS+FUxcaFBjkxnVJv5
         ZCCRd3EmqQqIWIEoG6vN6YpZNfRZUYYJmH19ClXLFC0+bzaAgmDNhyQiHF5NbVDsIJUq
         U2pg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5339CBZ8fsxeFJvkElEC5Vzmi8H6fAAEGFmVaKIZ2odXOJETU+5+
	d2/+JsQPDlUiaKDYHkSgyWs=
X-Google-Smtp-Source: ABdhPJwsYWbdKWCvgRACG2p4wnq1SyJdcKLaCSTnsO2CvDLrrczWQJrR9qijoSiKYQZZI35kMwYw7w==
X-Received: by 2002:adf:f192:: with SMTP id h18mr16235517wro.247.1598520331202;
        Thu, 27 Aug 2020 02:25:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81c2:: with SMTP id 60ls630491wra.2.gmail; Thu, 27 Aug
 2020 02:25:30 -0700 (PDT)
X-Received: by 2002:a5d:60c2:: with SMTP id x2mr20670853wrt.73.1598520330391;
        Thu, 27 Aug 2020 02:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598520330; cv=none;
        d=google.com; s=arc-20160816;
        b=Is0gXytqDbP8TBUvjXnXjd4iapfn7SFY9lZT5HAnYWcKuxux7RfRHgcjH6rO7+coP5
         YMOAhQ8BiCjAZs0D76xpZubNiniIkAZP7oVeDbKa0Ctfegag/cVbc0FlOTOkAlXOh5R2
         5n08MD5Hz71nTggrkiTQHLKRe95LB2on93r0AbmmRN/LKpwJxQT/iYmQX0eGf64Nm/1Q
         69euJVSvexIP2S8Bb2pkTNMvSue6S5CXbC4rBfEjsU3CZnNISko7IKjWAoeZi2H+cy/N
         DAhpAVgJRpKLECcq/mnmsL1BaUCBbYOH6F18IsiGhLsRJY46gJ1HoAd3xRKxt8qgT49O
         Sz/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=+OazlKCn2t6a5ps+N4jlJZ7jbaDH7ZSmxxrwMJMuf4s=;
        b=tFP8p8L/KY7MVP5HlrC62XQtHT8c6YULn6OB1F0NWA2UOjznPYA7/ecST7Uk6TfQkR
         cb/pY2OiqhOIE4kbscW/bb8LLdpBeZbRKj+zAVvoLF0gKURfU5Nwaf9bz9YFWoogvYkK
         HCppIKQQ6OkEXAMGCMu0j6yAxmviJ1Y4dXoSRARUKBHwsrwM11e6RA+j5slpfwjUogQu
         I5cycsX0yOQKzke4nWJVKeKNDY3AmvJYDWhfza45nkEa27iLjgCQT+hEcDnsyozXBo33
         thynootFPztIbNBntNOYiY86/bMo2eK9wFpB8voRKwI03rdpZ8mMUMqj91Jox/ahjjt7
         qwBg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id w127si268413wmg.1.2020.08.27.02.25.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2020 02:25:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 07R9PS1L016839
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Aug 2020 11:25:30 +0200
Received: from [167.87.79.124] ([167.87.79.124])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07R9PSmT005973;
	Thu, 27 Aug 2020 11:25:28 +0200
Subject: Re: [PATCH v2] configs: arm64: Add support for RPi4 with more than 1G
 of memory
To: Jakub Luzny <jakub@luzny.cz>, jailhouse-dev@googlegroups.com
References: <20200826161642.275038-1-jakub@luzny.cz>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b1af6d64-f852-58f8-0a02-3c4fd8ceab91@siemens.com>
Date: Thu, 27 Aug 2020 11:25:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826161642.275038-1-jakub@luzny.cz>
Content-Type: text/plain; charset="UTF-8"
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

On 26.08.20 18:16, Jakub Luzny wrote:
> Add the required memory regions to support 2G, 4G and 8G RAM variants
> of the Raspberry Pi 4. Tested on all the bigger variants, not on 1G, as I don't
> have one on hand and it's not available anymore.
> 
> Also moved the memory used by Jailhouse for the hypervisor and cells from
> 0x30000000 to 0x20000000 to avoid conflict with GPU memory. That is fine for
> gpu_mem setting of up to 256. The memory is supposed to be reserved using
> reserved-memory node in the device tree.
> 
> To support variants with >2G RAM, the PCI MMIO config space was moved into the
> ARM Local Peripherals address range, into free space behind the GIC.
> 
> Signed-off-by: Jakub Luzny <jakub@luzny.cz>
> ---
>  configs/arm64/dts/inmate-rpi4.dts |  2 +-
>  configs/arm64/rpi4-inmate-demo.c  | 22 ++++++------
>  configs/arm64/rpi4-linux-demo.c   | 28 ++++++++--------
>  configs/arm64/rpi4.c              | 56 +++++++++++++++++++++----------
>  4 files changed, 65 insertions(+), 43 deletions(-)
> 
> diff --git a/configs/arm64/dts/inmate-rpi4.dts b/configs/arm64/dts/inmate-rpi4.dts
> index 52fd3ac2..ac6d4f58 100644
> --- a/configs/arm64/dts/inmate-rpi4.dts
> +++ b/configs/arm64/dts/inmate-rpi4.dts
> @@ -96,7 +96,7 @@
>  				<0 0 0 2 &gic GIC_SPI 154 IRQ_TYPE_EDGE_RISING>,
>  				<0 0 0 3 &gic GIC_SPI 155 IRQ_TYPE_EDGE_RISING>,
>  				<0 0 0 4 &gic GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
> -		reg = <0x0 0xe0000000 0x0 0x100000>;
> +		reg = <0x0 0xff900000 0x0 0x100000>;
>  		ranges =
>  			<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
>  	};
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
> index 92463184..7b6a7a02 100644
> --- a/configs/arm64/rpi4.c
> +++ b/configs/arm64/rpi4.c
> @@ -1,7 +1,7 @@
>  /*
>   * Jailhouse, a Linux-based partitioning hypervisor
>   *
> - * Test configuration for Raspberry Pi 4 (32-bit, quad-core Cortex-A72, 1GB RAM)
> + * Test configuration for Raspberry Pi 4 (quad-core Cortex-A72, 1GB, 2GB, 4GB or 8GB RAM)
>   *
>   * Copyright (c) Siemens AG, 2020
>   *
> @@ -10,6 +10,8 @@
>   *
>   * This work is licensed under the terms of the GNU GPL, version 2.  See
>   * the COPYING file in the top-level directory.
> + *
> + * Reservation via device tree: reg = <0x0 0x20000000 0x10000000>;
>   */
>  
>  #include <jailhouse/types.h>
> @@ -18,7 +20,7 @@
>  struct {
>  	struct jailhouse_system header;
>  	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[12];
> +	struct jailhouse_memory mem_regions[14];
>  	struct jailhouse_irqchip irqchips[2];
>  	struct jailhouse_pci_device pci_devices[2];
>  } __attribute__((packed)) config = {
> @@ -27,7 +29,7 @@ struct {
>  		.revision = JAILHOUSE_CONFIG_REVISION,
>  		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
>  		.hypervisor_memory = {
> -			.phys_start = 0x3fc00000,
> +			.phys_start = 0x2fc00000,
>  			.size       = 0x00400000,
>  		},
>  		.debug_console = {
> @@ -38,7 +40,7 @@ struct {
>  				 JAILHOUSE_CON_REGDIST_4,
>  		},
>  		.platform_info = {
> -			.pci_mmconfig_base = 0xe0000000,
> +			.pci_mmconfig_base = 0xff900000,
>  			.pci_mmconfig_end_bus = 0,
>  			.pci_is_virtual = 1,
>  			.pci_domain = 1,
> @@ -70,37 +72,37 @@ struct {
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
> @@ -115,10 +117,30 @@ struct {
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
> +		/* ~2M reserved for shared memory regions */
> +
> +		/* 4M reserved for the hypervisor */
> +
> +		/* RAM (768M-4032M) */ {
> +			.phys_start = 0x30000000,
> +			.virt_start = 0x30000000,
> +			.size = 0xcc000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +
> +		/* RAM (4096M-8192M) */ {
> +			.phys_start = 0x100000000,
> +			.virt_start = 0x100000000,
> +			.size = 0x100000000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> 

OK, let's give this a try in next, and I will sort out the impact on
jailhouse-images afterwards. Maybe that is zero for the 1GB variant, but
we should also add the others, thus switch to an dtbo for the
reservation as you suggested.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b1af6d64-f852-58f8-0a02-3c4fd8ceab91%40siemens.com.
