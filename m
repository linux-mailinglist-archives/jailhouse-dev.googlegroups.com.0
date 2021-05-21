Return-Path: <jailhouse-dev+bncBCCLRRGRQACRBMNTT2CQMGQEXLMQQ4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D6538C5B9
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 13:29:53 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id j33-20020adf91240000b029010e4009d2ffsf9350146wrj.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 04:29:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621596593; cv=pass;
        d=google.com; s=arc-20160816;
        b=MuMkD80LfmBu3ABNbrN1HBMookQaIKlGOtmRmJ0Itez+WBgdokjVrD9Yf6yXioxXpZ
         j9sOX4k+seUWnHuJP+biWJv3WXscn/jBhX8OvinPSFGOm6JKKYn+0TEsrtPW0WY+RyE2
         E20s01uCVRkbaiXy1nyQnPhG6150qy30OmuQkZ9a0kHVrs8qdIsIZrZQ+45GjwXRgjuG
         ljA7ykGLBy3bwU2rKsexCUH/h8gsBY13fAcOu8TtXuFehKKKTLuLj2VO2IfnazLM4dPc
         kEvDWO/XGMghYybRxY3YJW4mXWidK5QaAVkUpK5KBaWXVNfalvS5mFFvzqmVV9j8hXQt
         /J5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=A1tUaVLRwUH0O86iYU+N0boUfN8CkD87HXPsrdqsOn8=;
        b=Cd7elA9j1nR567zDiYxBypVWKaRbFWy3ZsszrpiiGOEgrituAIRVedi89Y2O8J5STP
         PdAojVAc13IvoTVbpK9ITtNBAeUvq8HXLMFCmTwxwH1LUFlEmb2Ii9ws7vrTrpDuMlTn
         1h1Sp8FkV89dotErpga8FxoB76EmPirodVuj3fTEyh7gu7lOZDj4vxz7oX4ZcOP10PtL
         qH+hM+sHYHb64UiQlVs88W/kIrCoLQiDkbNMfMey6Go6+wRmt+9uES0XCQ7Ap43ZCxvM
         DdtMPtD/UQkk+dIuSi6gNrfTvMqz5b56OFgV/Sk+Cd2hBF9zdunv2Vmyck5fb3H1/BHd
         hZRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PXF2q8Ge;
       spf=pass (google.com: domain of liandao@gmail.com designates 2a00:1450:4864:20::229 as permitted sender) smtp.mailfrom=liandao@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:in-reply-to:references:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=A1tUaVLRwUH0O86iYU+N0boUfN8CkD87HXPsrdqsOn8=;
        b=Pw4jxM+AQANLst095rTWQ/pOE/BpacxFM61DuKfD2txifqpD27m/3heXWorFKVDkSR
         XwnGNFwIr0xdo89TWMIWPXgBEaOb0lrpaf3D5OclCsR2D3NGTJDr+zhyGbTrbC4Pzfgp
         soAXAKepMII/frvfvuVaibh15E4Aba9EjJyTN9l41XlmM3GCGDA4fLsj941Tj/d8RbIQ
         Y14mSNUsNmddCts5sufWQbozxN1R58QX1bcNCLfQKf78q3tAsZtT1+//gRUftjGLg/hc
         Wqy7Ie3kShBQcwMDmdXZ6o6hv6NpOQnCk5zL8B0ErY4K4nbD5nT0qHLblwoL4/S10+/6
         bTfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=A1tUaVLRwUH0O86iYU+N0boUfN8CkD87HXPsrdqsOn8=;
        b=kOFva9XLhUD6VVX4OeqQaFqUI3a/nVfOXet7Sl2H19277a8nMyWZr66+hbGEPIhZ8s
         DoaAKdkKP4eJBUx4B6gXqRN30VNxcBXBVp5rxIWZBYnbxqGbZesi/YM0Q6OvufFRjI47
         qC0KFNUskZPmS6ZR4x6wq1VcZpw9XxAjMSSh8pYNuaHM5dDgN9hd4RUFWXFDdVXN1AYN
         uTdIykn05mrxCz4Po0JxVYoHLK3RYUOLsCwKCNLkez6n0t4pUZe2oRh3unL48OHrH54t
         NfGLCj0B1760zNOEOi/RTThAxSZe9+HfUm9W1Vp0I6HOBrWc8yPMBwN/OThXHC/ILsLz
         RlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:in-reply-to:references:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=A1tUaVLRwUH0O86iYU+N0boUfN8CkD87HXPsrdqsOn8=;
        b=GJzygOzSGp4yrbiTGd6ppsmZdZIWUfPQrONFMIqzMvSZFlMime/X+lKdeP8pdUQxrF
         yiAnR8F6jPGhWpl//6YN1IiTwgbsi8fH5Oq0EZwjuLh1kIdI+1FYBvCyj1zT2l4hTET2
         lfN6+anDzYcTJIEk2JwYps+T3L4CauJL+uB3iN+nHYFfP2IgHrOos4wSNKGevJl+O7Tw
         3b4APBSms2Aec6s5BKdzQNBQCDrQblEDOgmX/4tfBVahZw9rO94qaANTAaIaoKQW3Sqy
         zFNxM0XVJes4WeZ1i78GBo/bbItX5Bnulw7DXBqbXdwvsBO9nTvtvh2JX9ZP5AaV2jQa
         SZew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533G86f/81zZuLvW0vc2gwI/KB9VhounpNXNIWqAzRfYcs3CBAJF
	L+yN4llMGBDOA4tkCaFH7dU=
X-Google-Smtp-Source: ABdhPJwLPsfuPQ/rDmjrBnbQZ1UAPeRYCHMJcJqXaJideaMLUcj082ayrfIvztVzZnbkVHql4//hWQ==
X-Received: by 2002:a5d:48ce:: with SMTP id p14mr9314062wrs.170.1621596593710;
        Fri, 21 May 2021 04:29:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9b95:: with SMTP id d21ls4127867wrc.0.gmail; Fri, 21 May
 2021 04:29:52 -0700 (PDT)
X-Received: by 2002:a05:6000:18ad:: with SMTP id b13mr9186952wri.343.1621596592792;
        Fri, 21 May 2021 04:29:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621596592; cv=none;
        d=google.com; s=arc-20160816;
        b=l10yVbQA2HSyLaUqc3Jtm0Y3ujl39YIxuJSCsb4tBIMfXUW6oNJozgNdejNAsEht2G
         uz1R3gWHBNjBVv1LUfR2F1g+MYcRYwAi2XV6gbLNbeevVeZvvkMRxvhRcAkXb4fyzMvq
         wORpaw054bXmvvvRIugy+VSdajJIPitg7gTwtC6g0MQWA11UhclEgpBJpH0zQJHJBN7w
         2Tv/pCGtulPHz5HpOa1rIY5RHyEG0oqe+iu4K6MZSWEXQWql0/85w7BSUs/zuzBtmz6k
         2EIfw2tE2g+kz1+SiPiO3Dl/6PoW/CoTcnDJmkxRVT87a9pvBYa8pRftlsl06O0p5A8r
         LPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=5W9L5+IlH1kDMgWFjG5itFR0HB4mISLI3VZ7PEx5Gx0=;
        b=fTDNrtR1eZCvY60uN4gWGwCuapG6afEepRkTeuQR+fnGaWaDftt4C6RZFOPHNlLEYU
         jXqeB2yeYOhEb12P4GY7V+xY/Tcgsncbi2dDfXcHwLYVLl5Qoazb51rGVVSinwptLs4S
         k4g0GTds2k3WLVriCzXtFcEwXkMSSbCS5bVD6PuTApnUPb6/XxiiSCycoY2vFuVV2e3S
         Nf5KRyMvwS3CW4uqZAnvHk7vDFqjGBj8MPLtcUdG1h3FMJWGHICEVaJAaXNU/hVIgKyL
         ie8fYlQD3YlDaORLyBF+rYB/aBlTJXLkYagNcho+WVUXjMQr/RScZQYezvQkt1/zcJlV
         Kx6g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PXF2q8Ge;
       spf=pass (google.com: domain of liandao@gmail.com designates 2a00:1450:4864:20::229 as permitted sender) smtp.mailfrom=liandao@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com. [2a00:1450:4864:20::229])
        by gmr-mx.google.com with ESMTPS id g9si103957wrv.1.2021.05.21.04.29.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 04:29:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of liandao@gmail.com designates 2a00:1450:4864:20::229 as permitted sender) client-ip=2a00:1450:4864:20::229;
Received: by mail-lj1-x229.google.com with SMTP id w15so23522509ljo.10
        for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 04:29:52 -0700 (PDT)
X-Received: by 2002:a2e:8942:: with SMTP id b2mr6366213ljk.488.1621596592306;
 Fri, 21 May 2021 04:29:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:6895:0:0:0:0:0 with HTTP; Fri, 21 May 2021 04:29:50
 -0700 (PDT)
In-Reply-To: <20210521062144.11659-1-Jiafei.Pan@nxp.com>
References: <20210521062144.11659-1-Jiafei.Pan@nxp.com>
From: liandao <liandao@gmail.com>
Date: Fri, 21 May 2021 19:29:50 +0800
Message-ID: <CAMC3Yu3LC1b1yhgMOA1Vp2Vt7Wuu=O--qNWPE+cHOWrJXpUy7Q@mail.gmail.com>
Subject: Re: [PATCH] nxp: ls1046ardb: add configure file for running zephyr inmate
To: Jiafei Pan <Jiafei.Pan@nxp.com>
Cc: jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: liandao@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=PXF2q8Ge;       spf=pass
 (google.com: domain of liandao@gmail.com designates 2a00:1450:4864:20::229 as
 permitted sender) smtp.mailfrom=liandao@gmail.com;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=gmail.com
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

where is Zephyr demo source code for ls1046a-rdb?

On 5/21/21, Jiafei Pan <Jiafei.Pan@nxp.com> wrote:
> 1. Use virt_addr to be same with phys_addr for memory
> 2. Loading inmate binary from start of virt_addr
> 3. Use 1M bytes memory in order to load Zephyr
> 4. Using CPU Core2 and Core3 to demo Zephyr SMP
>
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> ---
>  configs/arm64/ls1046a-rdb-zephyr-demo.c | 141 ++++++++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 configs/arm64/ls1046a-rdb-zephyr-demo.c
>
> diff --git a/configs/arm64/ls1046a-rdb-zephyr-demo.c
> b/configs/arm64/ls1046a-rdb-zephyr-demo.c
> new file mode 100644
> index 00000000..55c0e78f
> --- /dev/null
> +++ b/configs/arm64/ls1046a-rdb-zephyr-demo.c
> @@ -0,0 +1,141 @@
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
> +		.cpu_reset_address = 0xc0000000,
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
> +			.virt_start = 0xc0000000,
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
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/20210521062144.11659-1-Jiafei.Pan%40nxp.com.
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAMC3Yu3LC1b1yhgMOA1Vp2Vt7Wuu%3DO--qNWPE%2BcHOWrJXpUy7Q%40mail.gmail.com.
