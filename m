Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRB35YXOIQMGQEBNXFZII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1038.google.com (mail-pj1-x1038.google.com [IPv6:2607:f8b0:4864:20::1038])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1B24D7AAE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Mar 2022 07:10:57 +0100 (CET)
Received: by mail-pj1-x1038.google.com with SMTP id b9-20020a17090aa58900b001b8b14b4aabsf9703405pjq.9
        for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Mar 2022 23:10:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1647238255; cv=pass;
        d=google.com; s=arc-20160816;
        b=BrCZvIGoKXxndb6yJka5W+aHubqVUX9Lt5xNRvpryOKvXzEkaPw9Za6fOl9z9WjY6H
         uTtmYgyoec9HoreFbeJDoiH6042xNT0BQIZG1+b+hMm8JWAwzj7M7U1TaAIcHk9nHTw4
         lj4GAe8o+PrsTYnBXIXEWWVraSLYq+7Fm/vUMKMwPkdk8QnJObjbPKxv68AYqzm1rveR
         E9Nc4ybnB3WfnqjKFG1XAesvBVQy19ux47HffUoMT9tVaJ4gRsDplMBvOnwFyi+FbaNz
         0+RtfeqYmET2beChf21jgo5YP117ilLnCwY05v1T5PQVBLqQM0qQ0cqtx+Eye3uvUaVL
         TQXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=dtVMLQYclWiGUlao/Xd7Rlx2nP5jJUpdDbZQzoy9u3k=;
        b=DB9gXfKZIgFvNz8eW2BDpeX3hrERLoXND//89Hbl4te8IRQC+1d7xaFGz2JtuU89uj
         ID0iZSLEeq8Q94odeb1HbRuws0VrJdcccb7yfBQsLmbR5ICkCzbCkCNwF/9vi0DriAib
         /3gkXLQG7h7QSlIr4uZPnyLQUxj7YZoeznJcUteIOtbehmrv+ACm+U4rkk9H4U9FGxcR
         268i2FJZnvokXJYK1xBtB/+K1LC15RbzRW5srerYngwErkZ+/LyK0cedm7tH18Qbd+y7
         Xc/IuDgPz5KQQxtddOGqeY+CNnLoDIrf3lcGYk6FNP0ftECykcMZi+FfAK8LZfCQcwfZ
         oWaw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EmScwC0u;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=dtVMLQYclWiGUlao/Xd7Rlx2nP5jJUpdDbZQzoy9u3k=;
        b=OluO7MloXSdhBhS9Dv54TDWlKALzcJQ+BXTS9jSB9XKjG9JYUnXP+6VDmZuR0ScjSF
         6wpyA5rYnRsj4DGj+kd6VZj9asWvNGT9POVUJ9PgLY55DBv4GPaXx228HNnKawO5fL/o
         o1Z5323xla3UUsDaXlMKoV+HVgahDo0dPhnZF8hFoMywBk6Q6Gnwoj6DK6xb+Btvgjh6
         yKRzhs7YL5zqowxsD9xfOsx+y6ZeYGC2HM235OCGC5hKLbt6QLYrdLR3NOkj9lmFUhje
         mdHC447vKXux7mrjC1rzJrlXsJF4jyVqVgCMKzlt3rMAFC2jBvMNytPZxkCg65rIE24N
         PjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dtVMLQYclWiGUlao/Xd7Rlx2nP5jJUpdDbZQzoy9u3k=;
        b=wdZqfIPK2Kyh4atp3M7PDktoRe4dRUVRluuUJiUWfFJtgPkILTU3vYgFSFMmXrmJaP
         rSa/moa9sDYcPqNNC+tMwYg+gU6P7DGXN5Spo4nSz3kMb5j4wKrwxnIAHJmaxLLkzQv8
         YRPHSlDsvOJxZhZJXly2SJ+b8t2QButP4msFP4wFu65CXq9WomW2ghSnyiErKVi6BDYX
         EcKvuo6pZkOk7KSzJXs5DTasNs03ROBU++V5CW/ePDM4Hi+kpLS4z6+A14oRUXDNxhIg
         UzVyohkYJz71CLwu3huZey7SXrmJXTjHxGAKFEjOq3QkBEwNQVTr8gSEmCDDPFmUhNk8
         FQEw==
X-Gm-Message-State: AOAM530fkVKwyoNB2MxjrauwUozg2+rjSFhoFLSW22xi2wgK7fOCMLRZ
	OcBVu1smI/y7VLLzPWv7E8g=
X-Google-Smtp-Source: ABdhPJzDSeuSzyBy9we6c4PFEsjQE4YHETGJX37NolsAWVLK73i8OYkuSZxtG5kGoO2d752ceklGRg==
X-Received: by 2002:a63:4463:0:b0:381:3c1e:7299 with SMTP id t35-20020a634463000000b003813c1e7299mr2810413pgk.490.1647238255520;
        Sun, 13 Mar 2022 23:10:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:6782:b0:1b9:7c8a:8c03 with SMTP id
 o2-20020a17090a678200b001b97c8a8c03ls5901199pjj.0.gmail; Sun, 13 Mar 2022
 23:10:54 -0700 (PDT)
X-Received: by 2002:a17:90b:8d6:b0:1bd:3596:e97e with SMTP id ds22-20020a17090b08d600b001bd3596e97emr35406301pjb.50.1647238254707;
        Sun, 13 Mar 2022 23:10:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647238254; cv=none;
        d=google.com; s=arc-20160816;
        b=JGr0WQ/oJlDEm3fpJCZisWcy7M2fysYdLOXPfdz2wjc3ez6uwgKPPBmDN+syEX5XXS
         90MyGBQv2K/2NINbOSt4C9JPdKww68sKTU6ZFzuhnq6GB+/kjJlr+1r5MqdxKaJTBj04
         DV6lyRlj8uhDKFAMYFuI9Byf9NKm3P7fbdzdhZM1alw5BVQRVuaU0tEdytAx9T5Mfqtn
         UpJMGClMkh/+VP3YwMGM0NpB0l/zWf94Id4yA6TtzgqY1a2YFgFA5NBDmtqM4/7Z5Q64
         3BWx/tYHHvxStw5szE4cML+rD/3L4zv1D8pN8MzETq/7dCDmdhGVzSDcOmFFy0naOM3b
         PvZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=beR8AcNvRFbzdtx7O3nHcYyLe286+QZpsRrT0S/wMhw=;
        b=vPE35uLguOEMfqSjt7LjfRP93SkjyP3QR65mMcjQMf7KjuKGfe5kNvf3JNYwdpWAw6
         bZ2pH+ehXzK+gy1rDeXLClULLKvJist8ysE05UbzDbhQG/AVqlL2AtDbfXP0gkXKtF57
         RmTTJ/Xo60362PjXcB68vu0Rzlevdt/v2svFN4u7LsI5pcHDuEzd6GmIsgvtQkEYeuqH
         L6cEENkJtHDv0izNYQVR+uVOyK0ef2pmPGoNxePailCg2GofToeFaU/76bnB5YI+Bqwq
         AdPPS6y1sXQ31Qwf1AyrRJl8Us1qHh0wSOUWP6CbQFWyu/fIOjE/zC/NctUIb/az7FIx
         dNsw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EmScwC0u;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id h20-20020a17090aa89400b001c44f9fcad5si822127pjq.3.2022.03.13.23.10.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Mar 2022 23:10:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22E6AsLB058399;
	Mon, 14 Mar 2022 01:10:54 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22E6ArvX029679
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Mar 2022 01:10:53 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 14
 Mar 2022 01:10:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 14 Mar 2022 01:10:53 -0500
Received: from ubuntu (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id 22E6Aphv087329;
	Mon, 14 Mar 2022 01:10:52 -0500
Date: Sun, 13 Mar 2022 23:10:48 -0700
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH v2 4/4] configs: arm64: add emmc inmate configuration for
 k3-am654-idk
Message-ID: <20220314061048.GA2979@ubuntu>
References: <20220305030458.2938-1-mranostay@ti.com>
 <20220305030458.2938-5-mranostay@ti.com>
 <84b43004-79c9-4288-9314-7a8d3f2b5056@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <84b43004-79c9-4288-9314-7a8d3f2b5056@siemens.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=EmScwC0u;       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=mranostay@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Matt Ranostay <mranostay@ti.com>
Reply-To: Matt Ranostay <mranostay@ti.com>
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

On Sun, Mar 13, 2022 at 12:11:37PM +0100, Jan Kiszka wrote:
> On 05.03.22 04:04, 'Matt Ranostay' via Jailhouse wrote:
> > Add eMMC support for k3-am654-idk in a linux inmate cell with both
> > k3-am654-idk-linux-demo-emmc.c configuration, and respective device
> > tree changes.
> > 
> > Signed-off-by: Matt Ranostay <mranostay@ti.com>
> > ---
> >  .../arm64/dts/inmate-k3-am654-idk-emmc.dts    |  45 ++++
> >  configs/arm64/k3-am654-idk-linux-demo-emmc.c  | 208 ++++++++++++++++++
> >  2 files changed, 253 insertions(+)
> >  create mode 100644 configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
> >  create mode 100644 configs/arm64/k3-am654-idk-linux-demo-emmc.c
> > 
> > diff --git a/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts b/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
> > new file mode 100644
> > index 00000000..150e31fe
> > --- /dev/null
> > +++ b/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
> > @@ -0,0 +1,45 @@
> > +/dts-v1/;
> > +
> > +#include "inmate-k3-am654-idk.dts"
> > +
> > +/ {
> > +	sdhci0: mmc@4f80000 {
> > +		compatible = "ti,am654-sdhci-5.1";
> > +		reg = <0x0 0x4f80000 0x0 0x260>, <0x0 0x4f90000 0x0 0x134>;
> > +		power-domains = <&k3_pds 47 1>;
> > +		clocks = <&k3_clks 47 0>, <&k3_clks 47 1>;
> > +		clock-names = "clk_ahb", "clk_xin";
> > +		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> > +		mmc-ddr-1_8v;
> > +		mmc-hs200-1_8v;
> > +		ti,otap-del-sel-legacy = <0x0>;
> > +		ti,otap-del-sel-mmc-hs = <0x0>;
> > +		ti,otap-del-sel-sd-hs = <0x0>;
> > +		ti,otap-del-sel-sdr12 = <0x0>;
> > +		ti,otap-del-sel-sdr25 = <0x0>;
> > +		ti,otap-del-sel-sdr50 = <0x8>;
> > +		ti,otap-del-sel-sdr104 = <0x7>;
> > +		ti,otap-del-sel-ddr50 = <0x5>;
> > +		ti,otap-del-sel-ddr52 = <0x5>;
> > +		ti,otap-del-sel-hs200 = <0x5>;
> > +		ti,otap-del-sel-hs400 = <0x0>;
> > +		ti,trm-icp = <0x8>;
> > +		dma-coherent;
> > +	};
> > +};
> > +
> > +&mcu_uart0 {
> > +	power-domains = <&k3_pds 149 1>;
> > +};
> > +
> > +&k3_pds {
> > +	#power-domain-cells = <2>;
> > +};
> > +
> > +&sdhci0 {
> > +	/* eMMC */
> > +	non-removable;
> > +	ti,driver-strength-ohm = <50>;
> > +	bus-width = <8>;
> > +	disable-wp;
> > +};
> > diff --git a/configs/arm64/k3-am654-idk-linux-demo-emmc.c b/configs/arm64/k3-am654-idk-linux-demo-emmc.c
> > new file mode 100644
> > index 00000000..9fbc7a5f
> > --- /dev/null
> > +++ b/configs/arm64/k3-am654-idk-linux-demo-emmc.c
> > @@ -0,0 +1,208 @@
> > +/*
> > + * Jailhouse, a Linux-based partitioning hypervisor
> > + *
> > + * Configuration for Linux inmate on AM654 based platforms
> > + * 2 CPUs, 512MB RAM, 1 serial port(MCU UART), eMMC
> > + *
> > + * Copyright (c) 2019, 2022 Texas Instruments Incorporated - http://www.ti.com/
> > + *
> > + * Authors:
> > + *  Lokesh Vutla <lokeshvutla@ti.com>
> > + *  Matt Ranostay <mranostay@ti.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2.  See
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <jailhouse/types.h>
> > +#include <jailhouse/cell-config.h>
> > +
> > +#ifndef CONFIG_INMATE_BASE
> > +#define CONFIG_INMATE_BASE 0x0000000
> > +#endif
> > +
> > +struct {
> > +	struct jailhouse_cell_desc cell;
> > +	__u64 cpus[1];
> > +	struct jailhouse_memory mem_regions[19];
> > +	struct jailhouse_irqchip irqchips[3];
> > +	struct jailhouse_pci_device pci_devices[2];
> > +} __attribute__((packed)) config = {
> > +	.cell = {
> > +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> > +		.revision = JAILHOUSE_CONFIG_REVISION,
> > +		.name = "k3-am654-idk-linux-demo-emmc",
> > +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> > +
> > +		.cpu_set_size = sizeof(config.cpus),
> > +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> > +		.num_irqchips = ARRAY_SIZE(config.irqchips),
> > +		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> > +		.cpu_reset_address = 0x0,
> > +		.vpci_irq_base = 189 - 32,
> > +
> > +		.console = {
> > +			.address = 0x40a00000,
> > +			.divider = 0x35,
> > +			.type = JAILHOUSE_CON_TYPE_8250,
> > +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> > +				 JAILHOUSE_CON_REGDIST_4,
> > +		},
> > +	},
> > +
> > +	.cpus = {
> > +		0xc,
> > +	},
> > +
> > +	.mem_regions = {
> > +		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
> > +		{
> > +			.phys_start = 0x8dfa00000,
> > +			.virt_start = 0x8dfa00000,
> > +			.size = 0x10000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> > +		},
> > +		{
> > +			.phys_start = 0x8dfa10000,
> > +			.virt_start = 0x8dfa10000,
> > +			.size = 0x10000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_ROOTSHARED,
> > +		},
> > +		/* Peer 0 */ {
> > +			.phys_start = 0x8dfa20000,
> > +			.virt_start = 0x8dfa20000,
> > +			.size = 0x10000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> > +		},
> > +		/* Peer 1 */ {
> > +			.phys_start = 0x8dfa30000,
> > +			.virt_start = 0x8dfa30000,
> > +			.size = 0x10000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> > +		},
> > +		/* Peer 2 */ {
> > +			.phys_start = 0x8dfa40000,
> > +			.virt_start = 0x8dfa40000,
> > +			.size = 0x10000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_ROOTSHARED,
> > +		},
> > +		/* IVSHMEM shared memory region for 00:01.0 */
> > +		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 1),
> > +		/* RAM load */ {
> > +			.phys_start = 0x8FFFF0000,
> > +			.virt_start = 0x0,
> > +			.size = 0x10000,	/* 64KB */
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> > +				JAILHOUSE_MEM_LOADABLE,
> > +		},
> > +		/* RAM load */ {
> > +			.phys_start = 0x8e0000000,
> > +			.virt_start = 0x8e0000000,
> > +			.size = 0x1fff0000,	/* (512MB - 64KB) */
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> > +				JAILHOUSE_MEM_LOADABLE,
> > +		},
> > +		/* MCU UART0 */ {
> > +			.phys_start = 0x40a00000,
> > +			.virt_start = 0x40a00000,
> > +			.size = 0x10000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_IO,
> > +		},
> > +		/* sdhci0 */ {
> > +			.phys_start = 0x4f80000,
> > +			.virt_start = 0x4f80000,
> > +			.size = 0x1000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_IO,
> > +		},
> > +		/* sdhci0 */ {
> > +			.phys_start = 0x4f90000,
> > +			.virt_start = 0x4f90000,
> > +			.size = 0x1000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_IO,
> > +		},
> > +		/* main sproxy target_data host_id=A53_3 */ {
> > +			.phys_start = 0x3240f000,
> > +			.virt_start = 0x3240f000,
> > +			.size = 0x05000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_IO,
> > +		},
> > +		/* main sproxy rt host_id=A53_3 */ {
> > +			.phys_start = 0x3280f000,
> > +			.virt_start = 0x3280f000,
> > +			.size = 0x05000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_IO,
> > +		},
> > +		/* main sproxy scfg host_id=A53_3 */ {
> > +			.phys_start = 0x32c0f000,
> > +			.virt_start = 0x32c0f000,
> > +			.size = 0x05000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_IO,
> > +		},
> > +		/* communication region */ {
> > +			.virt_start = 0x80000000,
> > +			.size = 0x00001000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_COMM_REGION,
> > +		},
> > +	},
> > +
> > +	.irqchips = {
> > +		{
> > +			.address = 0x01800000,
> > +			.pin_base = 32,
> > +			.pin_bitmap = {
> > +			0x0, 0x80, 0x00, 0,
> > +			},
> > +		},
> > +		{
> > +			.address = 0x01800000,
> > +			.pin_base = 160,
> > +			.pin_bitmap = {
> > +			/* sdhc */
> > +			1 << (168 - 160) |
> > +			/* vpci */
> > +			1 << (189 - 160) |
> > +			1 << (190 - 160),
> > +			0x00, 0x00, 0,
> > +			},
> > +		},
> > +		{
> > +			.address = 0x01800000,
> > +			.pin_base = 544,
> > +			.pin_bitmap = {
> > +			0, 0x200000, 0, 0,
> > +			},
> > +		},
> > +	},
> > +
> > +	.pci_devices = {
> > +		/* 00:00.0 */ {
> > +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> > +			.bdf = 0 << 3,
> > +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
> > +			.shmem_regions_start = 0,
> > +			.shmem_dev_id = 2,
> > +			.shmem_peers = 3,
> > +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> > +		},
> > +		/* 00:01.0 */ {
> > +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> > +			.bdf = 1 << 3,
> > +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
> > +			.shmem_regions_start = 5,
> > +			.shmem_dev_id = 1,
> > +			.shmem_peers = 2,
> > +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> > +		},
> > +	},
> > +};
> 
> Applied patches 1-3.
> 
> This one here still makes we wonder if we can model it by adding a
> config switch to the existing k3-am654-idk-linux-demo.c. That would
> avoid having to maintain common bits (the majority of both files) twice.
>

Yeah that is actually a better plan, and will submit another patchset revision
with the simpler modifications.

- Matt

> Jan
> 
> -- 
> Siemens AG, Technology
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220314061048.GA2979%40ubuntu.
