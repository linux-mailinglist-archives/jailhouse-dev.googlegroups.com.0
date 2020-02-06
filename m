Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZWH57YQKGQENVXLGUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 07679154180
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Feb 2020 11:01:13 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id x23sf1376382lfc.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Feb 2020 02:01:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580983272; cv=pass;
        d=google.com; s=arc-20160816;
        b=jSNWEXbM1sfnnBsspVp20aJog6ud5ap1USsLoUwSft/Ze0U7Lr74v66IBVQ54i9iBC
         MSxSUHsDZhH4Jn2wP2b0XwOVNfIEfJQuPX0DTZXKoibLzlalUVdNXoy9VxTRDiKeyuge
         sxuKvIM6q5DfXOv0tNBcG36hfnuBxKzxLa86V+T5QaR4m9C8SYdM4uQ8pG60FRE1pS01
         vGm2U4T/DxvYvW6E4m9p9EdW/LCIHnl2tFuwigfqfsuAWcf/68sCBUUzzkUJC7kpJ8CR
         pvYYFzBQj5+ZhwETFQJ5TIHlZcVFMZSVtiT1AUjT4T/wFILozkfypBpOfkPVXWtKyAT1
         k4vA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=VY12t4YBEwkvA1aaL8MTXeqU/MJ07GJQWD2AFauHBTU=;
        b=iahBqIXnFnpwqfj28mxSr/IZy1rxzZ9jYTXJN5mOtzk68mQI86Ds4LHtSo20LdbMrF
         0fYUMPavPyMFJlTca2LxWHQBFIRrUMVhyCw7uFjmujyATu154/XeDe58Y1rDH+moDVYK
         0iIYZ5XnJuqJtKTNsqi+u9mRmYFjpS8L06EBliOD9xrKZuzgLjF1XoSGDE5JBLE2G+W+
         6FFW36C6H7AePbOvpcS96y6cMdIdwJBItXNyEQxyNHfH9tg+hMqGbn43Kt/cEn2Fx3RK
         uM9wQintNJ+3TRhoU0aP4O/PoSGNzSe0RwgNmK8EIF09sOrGiuBuhfO55J/qjHUi0VAN
         tmcw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VY12t4YBEwkvA1aaL8MTXeqU/MJ07GJQWD2AFauHBTU=;
        b=TMCppwuixF1S3Fmq2kdxV7vc1TEm2poHkOEuZzmeMDL9lT8oJN4M8bBjGjSFgxACDN
         fpHvomXNZLSlS1vQZMQY8FUpvklBgGUJe8gHfbZcAAoG8vdYeL/9MBueH0QK1nSZSZ2H
         WGvhqhgnTx24YSfNLcOKys4JKTeJMqhBUwKnWLuzxWQval+0kfEBLuWyoufvF+1olcFY
         nnaxJGhORiIBbpGVylZvzJUK1rvc/EMEgfMSiG+OMSN1CynIZ5H87cHoVSAIA8jSF/2y
         CikkeV8rBbYBls5wFN24/6AnXYOsR5thPufe425JqR/N23Eedbu2HjDS6P/7HPyrWQsV
         gDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=VY12t4YBEwkvA1aaL8MTXeqU/MJ07GJQWD2AFauHBTU=;
        b=FxVSbRgzWaGJy1pEi5KovfM54xLDr193D+pHDMdrP8jyz5wInCtBkuD4RJcsCbIMfq
         fuuiHTFnbCGgH2dtmUgoIgUDmyJ5tMgQtk7NAyxIyUEJDxmvLTP2J41DsZDw8pad5kAW
         BzCKIblgti8Cf84EpWkPNjo7r7v1Mc/ixKRgvr8NK2AkDekL+SGsCjkS6yjpeCpAetKb
         QOvaEk5BaAbfaI88iddBYcvIwcembZ1aFbi7eS6OVlUJFWu/TlTn8LklU2VNuBwijFgg
         YuLzzrke98TbQ/QRF/NhtSKgpyqd7BiDsfebYIxsKLTSHdudJZ4OBAPKN0bqTozoS2MG
         XJQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX2XSb39DbYP3PEiry9zd+jjxdNhjWwF3BzKP/FTMvKuMH0pS+b
	45IjSGZgNsjoxCxXCZ+9IeE=
X-Google-Smtp-Source: APXvYqze2iq6TruOb1Syk34fS+n+k3Qup/eWxmCfER+JM2cSPIz+AIrDy3jNgDI1pIW5LvzojmCbdA==
X-Received: by 2002:a2e:3202:: with SMTP id y2mr1648077ljy.132.1580983272524;
        Thu, 06 Feb 2020 02:01:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6809:: with SMTP id c9ls1151500lja.1.gmail; Thu, 06 Feb
 2020 02:01:09 -0800 (PST)
X-Received: by 2002:a2e:8711:: with SMTP id m17mr1523153lji.284.1580983269573;
        Thu, 06 Feb 2020 02:01:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580983269; cv=none;
        d=google.com; s=arc-20160816;
        b=r/rhKgbZCL6G1CNIjS7lEKtzzw97CUNk3LTC/S+/SsGrusvJwYj8Rdgwjv8dP65QQ1
         GjhTxXli1NkXOrsGOqcYdtp3luAxWaPYoQs1/6MN4MWLbPrN/kYprSV56jjsV7xvmNgE
         Jj7kPrtjl7+Tp3Hiv9ATtdjo9K3EOlxMg6bI16N07MVwngQhl4FEaRo0KTC5hfK9sY31
         sRgdPGmguzIls2xh5UAnfm3PVV0SNGZb2661O8Tr0hlR1prk9611V6bwmZ2Blq9qRHY+
         y3rQBo4RkBh5DEcdRRA63epKFsuyGPhxHGkI0McYEN1kOsdG3Cpymw3DECSjn4CUVsYl
         MjRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Uw01GmvEc6P56yHHm/tD8J3TFNCd5Ik65gN7RViY16A=;
        b=Krjp0I8P93BpmKvIl7SzA9V28ApFTqWBDRkwjXIWfD5xJnGflf0t0gdLs+sg37MDgt
         ks+vMqHHeYoFEp2aFrTtM097T7Q1m0h2eVbgAHBkN4l92VAZyzDqOj0gJaPZB7vMXujC
         wDZGIVQa9arx0sPgl6DRc4XnuRMLdjR+EkRhAbdnipGKBVjCj5/1nEfqRdMST0bjRaPV
         A7kO/dEBuwTuWqESmurjDb7k4F2TDHpvebZSIVcsTx3/QsXpVwVhOdD8xCviIsA9++CD
         MRY4NnFBsr8A+FX0EsXWLk180B5iYJM+OJlHti20yQrg71H9gtEv9Nfz8VshMPkSgOwu
         lU6Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id j30si117428lfp.5.2020.02.06.02.01.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Feb 2020 02:01:09 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 016A18bR019434
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2020 11:01:08 +0100
Received: from [139.22.120.131] ([139.22.120.131])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 016A17KM009275;
	Thu, 6 Feb 2020 11:01:08 +0100
Subject: Re: [PATCH v3 3/3] Add Linux demo for pine64-plus
To: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>,
        jailhouse-dev@googlegroups.com
References: <20200204101313.2495-1-vijaikumar.kanagarajan@gmail.com>
 <20200204101313.2495-4-vijaikumar.kanagarajan@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <32b59107-d919-a2c8-0761-4e03f5138209@siemens.com>
Date: Thu, 6 Feb 2020 11:01:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200204101313.2495-4-vijaikumar.kanagarajan@gmail.com>
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

Subjects should be prefixed with "configs: arm64:".

On 04.02.20 11:13, Vijai Kumar K wrote:
> Add Linux demo with 2 CPUs and 128M RAM for Pine64+.
> 
> Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> ---
>  configs/arm64/dts/inmate-pine64-plus.dts | 114 +++++++++++++++++
>  configs/arm64/pine64-plus-linux-demo.c   | 149 +++++++++++++++++++++++
>  2 files changed, 263 insertions(+)
>  create mode 100644 configs/arm64/dts/inmate-pine64-plus.dts
>  create mode 100644 configs/arm64/pine64-plus-linux-demo.c
> 
> diff --git a/configs/arm64/dts/inmate-pine64-plus.dts b/configs/arm64/dts/inmate-pine64-plus.dts
> new file mode 100644
> index 00000000..0f980c98
> --- /dev/null
> +++ b/configs/arm64/dts/inmate-pine64-plus.dts
> @@ -0,0 +1,114 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Device tree for Linux inmate test on Pine64+ board,
> + * corresponds to configs/arm64/pine64-plus-linux-demo.c
> + *
> + * Copyright (c) Vijai Kumar K, 2019-2020
> + *
> + * Authors:
> + *  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/dts-v1/;
> +
> +/ {
> +	model = "Jailhouse cell on Pine64+";
> +
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	interrupt-parent = <&gic>;
> +
> +	hypervisor {
> +		compatible = "jailhouse,cell";
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@2 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			reg = <2>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu@3 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			reg = <3>;
> +			enable-method = "psci";
> +		};
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13
> +				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14
> +				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11
> +				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10
> +				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +
> +	clocks {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		osc24M: clk24M {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +			clock-output-names = "osc24M";
> +		};
> +	};
> +
> +	gic: interrupt-controller@01c81000 {
> +		compatible = "arm,gic-400";
> +		reg = <0x01c81000 0x1000>,
> +		      <0x01c82000 0x2000>;
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +	};
> +
> +	uart: serial@01c28000 {
> +		compatible = "snps,dw-apb-uart";
> +		reg = <0x01c28000 0x400>;
> +		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +		reg-shift = <2>;
> +		reg-io-width = <4>;
> +		clock-frequency = <24000000>;
> +	};
> +
> +	pci@02000000 {
> +		compatible = "pci-host-ecam-generic";
> +		device_type = "pci";
> +		bus-range = <0 0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		#interrupt-cells = <1>;
> +		interrupt-map-mask = <0 0 0 7>;
> +		interrupt-map = <0 0 0 1 &gic GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
> +				<0 0 0 2 &gic GIC_SPI 124 IRQ_TYPE_EDGE_RISING>,
> +				<0 0 0 3 &gic GIC_SPI 125 IRQ_TYPE_EDGE_RISING>,
> +				<0 0 0 4 &gic GIC_SPI 126 IRQ_TYPE_EDGE_RISING>;
> +		reg = <0x02000000 0x100000>;
> +		ranges =
> +			<0x02000000 0x00 0x10000000 0x10000000 0x00 0x10000>;
> +	};
> +};
> diff --git a/configs/arm64/pine64-plus-linux-demo.c b/configs/arm64/pine64-plus-linux-demo.c
> new file mode 100644
> index 00000000..55f59b35
> --- /dev/null
> +++ b/configs/arm64/pine64-plus-linux-demo.c
> @@ -0,0 +1,149 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Configuration for linux-demo inmate on Pine64+ board:
> + * 2 CPU, 128M RAM, serial port 0
> + *
> + * Copyright (c) Vijai Kumar K, 2019-2020
> + *
> + * Authors:
> + *  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
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
> +	struct jailhouse_irqchip irqchips[1];
> +	struct jailhouse_pci_device pci_devices[2];
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = "pine64-plus-linux-demo",
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
> +			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
> +
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
> +		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +
> +		.vpci_irq_base = 123,
> +
> +		.console = {
> +			.address = 0x01c28000,
> +			.type = JAILHOUSE_CON_TYPE_8250,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_REGDIST_4,
> +		},
> +	},
> +
> +	.cpus = {
> +		0xc,
> +	},
> +
> +	.mem_regions = {
> +		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
> +		/* State Table */ {
> +			.phys_start = 0xbbef1000,
> +			.virt_start = 0xbbef1000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* Read/Write Section */ {
> +			.phys_start = 0xbbef2000,
> +			.virt_start = 0xbbef2000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* Output (peer 0) */ {
> +			.phys_start = 0xbbefb000,
> +			.virt_start = 0xbbefb000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* Output (peer 1) */ {
> +			.phys_start = 0xbbefd000,
> +			.virt_start = 0xbbefd000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* Output (peer 2) */ {
> +			.phys_start = 0xbbeff000,
> +			.virt_start = 0xbbeff000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xbbf01000, 1),
> +		/* UART 0-3 */ {
> +			.phys_start = 0x01c28000,
> +			.virt_start = 0x01c28000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM */ {
> +			.phys_start = 0xbb900000,
> +			.virt_start = 0,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* RAM */ {
> +			.phys_start = 0xb0000000,
> +			.virt_start = 0xb0000000,
> +			.size = 0x8000000,
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
> +			.address = 0x01c81000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				1 << (32-32), 0, 0, 1 << (155-128),

You also need to grant access to 156, for the device 00:01.0. Otherwise,
ivshmem-net will not work. I just did that mistake, see my latest patch...

> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		{ /* IVSHMEM 00:00.0 (demo) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 1,
> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 2,
> +			.shmem_peers = 3,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +		/* IVSHMEM 00:01.0 (networking) */ {
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.bdf = 1 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 5,
> +			.shmem_dev_id = 2,

Device ID is 1 - this is a 2-peers-only ivshmem device.

> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +		},
> +	},
> +};
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/32b59107-d919-a2c8-0761-4e03f5138209%40siemens.com.
