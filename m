Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJ6G42BAMGQET6INBCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D77345958
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 09:13:28 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id t27sf598592edi.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 01:13:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616487208; cv=pass;
        d=google.com; s=arc-20160816;
        b=J60DiSjIxnUxCgalxftGnClKYE9RXpfkL+ZuEYCSQwu4pklMI7ezgJeNwPa/6LVwEL
         7EJnGE302Wl3PUmQ6Bz0lznP9dQEg035yKvAvNpKeEdjdBcKql1DXDHozlEgVTOEglof
         EWQI5iEp2Xsjr5ba/zNKxy8cWzuo8m2HL/8pQJYqjifqlvq0lGENkrovqLEfVGfKXv8q
         EZNo+0u0N17ColsA9kLf9TeUE35ek2o1i7/neVbHK4oZ7pm1AASVIQikcaNj3fKiRUHX
         z/Hpe3tgeaTJ2YZehaunuigeZvbFmHqTgF31szXQ2C0+q9pUJxGHDB+RBw9uOaVqvN5H
         OQ9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=o30dyunV7dEhcoB+lypz5wv9o6mQJpiLHRmoNH/BwLE=;
        b=qZ+3hSpzmAjItY2VXZR2ckyTQ7R3CbzZtqnW3RYs7GomYRM/wq8ECWvWLl6kGaaP0w
         EJrH2ha7TqT7ZsOGWKi/NX4LY19Q4+pFXMaNHBd0lk95coZQV2ZwriPoQDgxm90Ug2YR
         sEKtpkHc5V9Zz0xYkCg4wlY7DvQjGrCI+M6Wg+X3S0IPV8FztO+WuQ2ShQwPqU7yuzYk
         259MQ6yCqULZwsLu7eOcDV9ETe267L5QSeKbhAZ2ktDx5flZvODfduqYmR8SpJ5m/YyU
         kv4xAadKzYllKxbwDg1vmJQ3cSopaIX3cLcQTsmpJK7flFg5OiCJbPrXx/bURTt2IE5Y
         0l6w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=o30dyunV7dEhcoB+lypz5wv9o6mQJpiLHRmoNH/BwLE=;
        b=MXAwAsDtBk9IAbpnHVmbbYrz1mz2EiKSEsL6rY5k+P9bL0R3vyb4xJmrssSFQZyXAk
         qzxktL9mmnVlgQb4mAgVMnmh2IvM4/Mv2Fqat5L/aZ7edlXECKeaddpi/Cewe8J/D7cH
         5VW3pjIdPslWEVfBNZvh2TFPvpRWS4Kcrmvdbey5EJfJNQC5QbfI7o57xl0tEzII6+0S
         BZ4WhHWCRU+q6BWCeea+WHHdbHDeRTDWKl0mo3af1LFGuovOPXBcOHisDRyfdb4rSNL/
         kEF+u490ByKG+65nHulRcIzd9ANxmFt+yuO9zILD25W9hexkw5YMviAnod7gGttTlGih
         TjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=o30dyunV7dEhcoB+lypz5wv9o6mQJpiLHRmoNH/BwLE=;
        b=l/bLvAdQFfQ2THapZ98Wbvlq0KuCEPz/L3qGk5mfbfQhj598HirfXC7rMd4x07PFaX
         hP+2hVYPBMheJh4fa5HFh1Itv/smsZq6V6Pdzx4c6A5vDNLCcq9KNKaSgpP66fgCzsLd
         VD4rvjBu3MFjgmYDCXfxuMlpblBRfX4AUgiBrHHxrQCJvgdNdqcFhAkf/Rr4Ce534M8A
         slyjrqa27N8kggcYCdhVDTYW0NgXXxM9D6Gf0h6tchUq7vrJoj8FSrScC1fa9aDvk9Ll
         Rb/3msehRT3JCr6E3D4BXtqOCTfXcfzG7YP7c1nfCK6vhvRHqXrnseQYF4NV+4gxJpvu
         pFbQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5311Sf31GoWSMbRDKOKo6hBfej9G71IilszhelmIb6EjmGrZpAfo
	MGgz1TvemAP1A4gwvZmyFC8=
X-Google-Smtp-Source: ABdhPJyaAS0VZwFq1I647xn5oOq08YXFW84gR4VOgXJ09lkdAoXl9gRft4AdrsKCQhhmXL44wn7eng==
X-Received: by 2002:a17:906:7842:: with SMTP id p2mr3925777ejm.87.1616487208055;
        Tue, 23 Mar 2021 01:13:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:40d2:: with SMTP id a18ls8606897ejk.8.gmail; Tue, 23
 Mar 2021 01:13:27 -0700 (PDT)
X-Received: by 2002:a17:906:73d5:: with SMTP id n21mr3840415ejl.8.1616487206990;
        Tue, 23 Mar 2021 01:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616487206; cv=none;
        d=google.com; s=arc-20160816;
        b=lf5F6x0ciTkl2NCHXnQRHVsJ0JjCmUAsHQS1IZVamOKHzkWZ7lFa0QZ0PEa2n1dlgd
         3Lt2Fx88kNQd5EOg+ga7f0DGb1c/ePytV8lsg3Re1w10x41ohR5MoQ+89iLHVBvH8VMf
         kwkPv/mr6Gdw0D/xx3/Br8CjGMrx+20rhMC0367e+Txb48xlMZpDgrsKiTTU63nsCUjT
         pDr2kqRveuQo2LfekJmEX7Tu+D2lUopSIEX7ohby61QtjGu7yjm6SFmr04diMcz8dtEC
         1q0JDTfGfQaWzUsoK3JSSOfK3a2swAd5gNVNyPxwNmUwblFMr1dAKxZfFKpwit3Po37f
         SYGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=7uAsf3HpvPOkzONByBTnsa/GDwLV67mz6dcTHiccPo0=;
        b=piLYU6Sm+HUkUCh1owgLae4Ypj3mQIhgHnNopIulEHkXoU6+iyeycmi5uErYkVj6A6
         KknZg0RjMMPpfcDJhTEVSbcm68lz3xlnCrNjnjtuMOWkBvvUsfs2xs/rK0pwBTgOzp9V
         GFkrQ5clSNH8OJPRSJ9Lx6CDnl0N2aagGMQtLD0Zzq4e4LjQT9hsQRwTw20TgAJvhXPM
         kbwm9m6kCNFNfjOovm1gk9c4YSlIiOHgeDidvSBPkOvnWwZe/kJO6azIWjX0irnCSL2e
         92VrKlMLQWzamDP3b6Zn9W2g+fGizQqubkuBXuPri6q4ihnS3+xypG+Ay4/oXNFA+B+D
         79RQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id r21si727979ejo.0.2021.03.23.01.13.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 01:13:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12N8DQxk017984
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Mar 2021 09:13:26 +0100
Received: from [167.87.18.33] ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12N8DQUr016535;
	Tue, 23 Mar 2021 09:13:26 +0100
Subject: Re: [PATCH 4/5] imx8mp: support virtio console
To: peng.fan@nxp.com, jailhouse-dev@googlegroups.com
References: <20210323062536.3888-1-peng.fan@nxp.com>
 <20210323062536.3888-4-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <181c45a5-3c2f-4244-7681-119bdab4be5b@siemens.com>
Date: Tue, 23 Mar 2021 09:13:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323062536.3888-4-peng.fan@nxp.com>
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

On 23.03.21 07:25, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Support virtio console

Not accurate: You also add virtio-blk devices.

Where do you take the memory from? Some words on how you rearrange
things would be good.

And there is no impact on the demo-inmate config?

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  configs/arm64/imx8mp-linux-demo.c | 81 ++++++++++++++++++++++++++-----
>  configs/arm64/imx8mp.c            | 80 ++++++++++++++++++++++++------
>  2 files changed, 134 insertions(+), 27 deletions(-)
> 
> diff --git a/configs/arm64/imx8mp-linux-demo.c b/configs/arm64/imx8mp-linux-demo.c
> index ff0cdffb..1e0a9f1c 100644
> --- a/configs/arm64/imx8mp-linux-demo.c
> +++ b/configs/arm64/imx8mp-linux-demo.c
> @@ -21,9 +21,9 @@
>  struct {
>  	struct jailhouse_cell_desc cell;
>  	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[15];
> +	struct jailhouse_memory mem_regions[23];
>  	struct jailhouse_irqchip irqchips[2];
> -	struct jailhouse_pci_device pci_devices[2];
> +	struct jailhouse_pci_device pci_devices[4];
>  } __attribute__((packed)) config = {
>  	.cell = {
>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> @@ -43,7 +43,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> -		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
> +		/* IVSHMEM shared memory region (virtio-blk front) */
> +		{
>  			.phys_start = 0xfd900000,
>  			.virt_start = 0xfd900000,
>  			.size = 0x1000,
> @@ -52,25 +53,57 @@ struct {
>  		{
>  			.phys_start = 0xfd901000,
>  			.virt_start = 0xfd901000,
> +			.size = 0xdf000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{ 0 },
> +		{ 0 },
> +		/* IVSHMEM shared memory region (virtio-con front) */
> +		{
> +			.phys_start = 0xfd9e0000,
> +			.virt_start = 0xfd9e0000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfd9e1000,
> +			.virt_start = 0xfd9e1000,
> +			.size = 0xf000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{ 0 },
> +		{ 0 },
> +		/* IVHSMEM shared memory region for 00:00.0 (demo )*/
> +		{
> +			.phys_start = 0xfd9f0000,
> +			.virt_start = 0xfd9f0000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfd9f1000,
> +			.virt_start = 0xfd9f1000,
>  			.size = 0x9000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		{
> -			.phys_start = 0xfd90a000,
> -			.virt_start = 0xfd90a000,
> +			.phys_start = 0xfd9fa000,
> +			.virt_start = 0xfd9fa000,
>  			.size = 0x2000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		{
> -			.phys_start = 0xfd90c000,
> -			.virt_start = 0xfd90c000,
> +			.phys_start = 0xfd9fc000,
> +			.virt_start = 0xfd9fc000,
>  			.size = 0x2000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		{
> -			.phys_start = 0xfd90e000,
> -			.virt_start = 0xfd90e000,
> +			.phys_start = 0xfd9fe000,
> +			.virt_start = 0xfd9fe000,
>  			.size = 0x2000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_ROOTSHARED,
> @@ -143,22 +176,44 @@ struct {
>  	},
>  
>  	.pci_devices = {
> +		{
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 1,
> +			.bdf = 2 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 1,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
> +				VIRTIO_DEV_BLOCK,
> +		},
> +		{
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 1,
> +			.bdf = 3 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 4,
> +			.shmem_dev_id = 1,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
> +				VIRTIO_DEV_CONSOLE,
> +		},
>  		{ /* IVSHMEM 00:00.0 (demo) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 0,
> +			.domain = 1,

Please pull patch 5 before this one and do all the domain adjustments in
one place.

>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_regions_start = 0,
> +			.shmem_regions_start = 8,
>  			.shmem_dev_id = 2,
>  			.shmem_peers = 3,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>  		},
>  		{ /* IVSHMEM 00:01.0 (networking) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 0,
> +			.domain = 1,
>  			.bdf = 1 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_regions_start = 5,
> +			.shmem_regions_start = 13,
>  			.shmem_dev_id = 1,
>  			.shmem_peers = 2,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> diff --git a/configs/arm64/imx8mp.c b/configs/arm64/imx8mp.c
> index a1e221f9..3f758980 100644
> --- a/configs/arm64/imx8mp.c
> +++ b/configs/arm64/imx8mp.c
> @@ -18,9 +18,9 @@
>  struct {
>  	struct jailhouse_system header;
>  	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[15];
> +	struct jailhouse_memory mem_regions[23];
>  	struct jailhouse_irqchip irqchips[3];
> -	struct jailhouse_pci_device pci_devices[2];
> +	struct jailhouse_pci_device pci_devices[4];
>  } __attribute__((packed)) config = {
>  	.header = {
>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> @@ -42,7 +42,7 @@ struct {
>  			.pci_mmconfig_base = 0xfd700000,
>  			.pci_mmconfig_end_bus = 0,
>  			.pci_is_virtual = 1,
> -			.pci_domain = 0,
> +			.pci_domain = 1,
>  
>  			.arm = {
>  				.gic_version = 3,
> @@ -68,7 +68,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> -		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
> +		/* IVSHMEM shared memory region (virtio-blk back-end) */
> +		{
>  			.phys_start = 0xfd900000,
>  			.virt_start = 0xfd900000,
>  			.size = 0x1000,
> @@ -77,24 +78,53 @@ struct {
>  		{
>  			.phys_start = 0xfd901000,
>  			.virt_start = 0xfd901000,
> +			.size = 0xdf000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +		{ 0 },
> +		{ 0 },
> +		/* IVSHMEM shared memory region (virtio-con back-end) */
> +		{
> +			.phys_start = 0xfd9e0000,
> +			.virt_start = 0xfd9e0000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		{
> +			.phys_start = 0xfd9e1000,
> +			.virt_start = 0xfd9e1000,
> +			.size = 0xf000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +		{ 0 },
> +		{ 0 },
> +		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
> +			.phys_start = 0xfd9f0000,
> +			.virt_start = 0xfd9f0000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		{
> +			.phys_start = 0xfd9f1000,
> +			.virt_start = 0xfd9f1000,
>  			.size = 0x9000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
>  		},
>  		{
> -			.phys_start = 0xfd90a000,
> -			.virt_start = 0xfd90a000,
> +			.phys_start = 0xfd9fa000,
> +			.virt_start = 0xfd9fa000,
>  			.size = 0x2000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
>  		},
>  		{
> -			.phys_start = 0xfd90c000,
> -			.virt_start = 0xfd90c000,
> +			.phys_start = 0xfd9fc000,
> +			.virt_start = 0xfd9fc000,
>  			.size = 0x2000,
>  			.flags = JAILHOUSE_MEM_READ,
>  		},
>  		{
> -			.phys_start = 0xfd90e000,
> -			.virt_start = 0xfd90e000,
> +			.phys_start = 0xfd9fe000,
> +			.virt_start = 0xfd9fe000,
>  			.size = 0x2000,
>  			.flags = JAILHOUSE_MEM_READ,
>  		},
> @@ -167,22 +197,44 @@ struct {
>  	},
>  
>  	.pci_devices = {
> +		{
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 1,
> +			.bdf = 2 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 0,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
> +				VIRTIO_DEV_BLOCK,
> +		},
> +		{
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 1,
> +			.bdf = 3 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 4,
> +			.shmem_dev_id = 0,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
> +				VIRTIO_DEV_CONSOLE,
> +		},
>  		{ /* IVSHMEM 0000:00:00.0 (demo) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 0,
> +			.domain = 1,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_regions_start = 0,
> +			.shmem_regions_start = 8,
>  			.shmem_dev_id = 0,
>  			.shmem_peers = 3,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>  		},
>  		{ /* IVSHMEM 0000:00:01.0 (networking) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 0,
> +			.domain = 1,
>  			.bdf = 1 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_regions_start = 5,
> +			.shmem_regions_start = 13,
>  			.shmem_dev_id = 0,
>  			.shmem_peers = 2,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> 

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/181c45a5-3c2f-4244-7681-119bdab4be5b%40siemens.com.
