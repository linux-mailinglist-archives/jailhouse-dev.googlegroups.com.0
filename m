Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBG56SXZAKGQEM5IABTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E92715C071
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 15:37:16 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id a12sf2398847wrn.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 06:37:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581604636; cv=pass;
        d=google.com; s=arc-20160816;
        b=G7lPoWSo7o+TLgL2uVyFL569GAA18akddzrqeWZMdlJLHhT22Mc7UKW4bxRhjr4ioq
         ybfIwMvUPOso/aTONRPnOvAVhaFwAlk/D8FXtpyQOSAYvR6zhjZWpdKb5LqLjsq2JMb5
         MG90DjJTxCkfHofn2VTUPwwnzgHRVJYJOOeHUVseFna7YOqXcpoHOJD39LpQTKIRf9CW
         8IJV4BLCHpEQxsBjJam4cIOmbX6r/uIdq58V1HjzjY7rTM5ojjCHLMamdVcRkgT/ZXPE
         zFCtlOgTfi6UpWQGvKAfCkZI2n9WxJDespIyDNGRMOs3Q7B9YNzMt8NeG/GqRPd2mE5Z
         1yjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=MxuDRcxg5gPCL5YAxoooAkYre0GxlhcpOcypNXVsbO0=;
        b=estPItbArrIJH0ls9fjwtSJTm+NqfQH8xAwA5eNEP3VWJeyuzQo9WrXm87ionLe2XG
         cz53/SoJDrI9/23mm8N3bXV4yMuqgV+43yookmxZofOoDWlCVSJneAXNE3AG/n8+WIHa
         bhar25LsyneiQrbp2zLYLKFsxHMRl2I1KktV4moYuBTkt93HxzT8Jm311Q/HU33xzupR
         mHBDbR7GPVcU9+BvKCbQtqcp7UyEGPYeNNCvNZE1AnzSET/u0M5f97i648WMAlwsUGQu
         rgvx1jOcxY8pf6JZ5hCXzskLsYBtVSs0qW+TYgKAR32Or+BE1zkoJIQUJcJoLOpDLsIr
         5gtA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MxuDRcxg5gPCL5YAxoooAkYre0GxlhcpOcypNXVsbO0=;
        b=YwUfoL3gyUpt+3A+YGl0OEwSkbwMN4wJOmc5RkdOfAjqDLFGWMQloATJJb7U/DU6+P
         1jLYi4IJlhBRtDCVXFXJ7kI09TN5OGkjz6n+xi+enN6bQ2B5mF9Nu4NxjtyOF2/V9Pqs
         VrE5Y9z7WG/BcBu0QsPoucZiyeBje3f6Y54pVnyF3ShSTjr1HuGH72PZBWqQ8ENixDL+
         9z6Oj6zEyRYlWiWgwhnIWEzJwg5Xp+M4ENop1p2KkMMbhq73If89GBnLJc6OUW8xCSIk
         rsHA+8aPPo8TzVCOZ/mI7azLp85eZ3S0LhCNuZIkYv9zYxSf+G9Bx9cJduoG80mtk1+E
         u1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MxuDRcxg5gPCL5YAxoooAkYre0GxlhcpOcypNXVsbO0=;
        b=MYD8QYPn7c4Lw6MFq/D0Vw/KsitP4KPKDPso/CdQPmg7TDqApaxsC0DAo8mM3AryRl
         xQjQ9doQ+k98KqM0Su1eo7EvNP8nO8Tw0XzLwypf5Tp4D6hJs0XqF1GU0C4neMKLFhai
         9OAlqQbPOedITwtRY9w0RZcV5l7mqwgzNgWe9sWoNBltRS4HdIh5eU5Q9WNa6KSm7MrA
         GHyuzgMNQEMhEaJGjoAeCDrpfSvCxCYu4wqsQW6A+xbrbQ9g6SV4o0qQNguhSwRngzIZ
         hC/GS6wJ34yNExe2n6Py6hYEpcCpdb/3FHOuZce8mc8OoGw/ESf3JVcZ0TOgoIwvp669
         I+Uw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUm4gXE/iQtl6xe38hhWr6g+m7ekyFwCD5RqxaLtCKkjx8asnqB
	IsBj8ugPXE7tK2Ax9ASW5Bo=
X-Google-Smtp-Source: APXvYqzfmWeXacJWrBbe57R2gymKi6EoJ4TyZYPMPOCD4qJkhvkVilaqUMU1he8i7Am7FV5CxAL05w==
X-Received: by 2002:a1c:66d6:: with SMTP id a205mr6135435wmc.10.1581604635936;
        Thu, 13 Feb 2020 06:37:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ea84:: with SMTP id s4ls13422438wrm.11.gmail; Thu, 13
 Feb 2020 06:37:15 -0800 (PST)
X-Received: by 2002:a5d:6805:: with SMTP id w5mr22956458wru.64.1581604634812;
        Thu, 13 Feb 2020 06:37:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581604634; cv=none;
        d=google.com; s=arc-20160816;
        b=PbmjsLuZchUWiMv1u/WMdMxGpchbLwd9hAkIE5hk6vTZNQfML8JbpAKMk92NLj/hLV
         G0UHLy1y+R+8vk42kYfnq9OjwIDbIWeWn4wY80z0FyMwWlQjpBpD839GzsR1huTBWFLN
         WG1ZH7EXeimYt3as17XiWFSo6/JZWrKd0vxYxusuPwftngPm1YeaX2YLu5hOZEfl45mB
         IoiBRj/oZg++aIBbA7bnSjMdqG+8MSx1q70mQVidj/eUK9NE+uDZD3W22ZaL80FXYtOV
         59FGpTCGhLCL35Iw8nzfC0XVDTxRBxcVVtqnDd5SD+uYzeLhv+oSCD0aL7mLQxnEMknb
         jI8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=uHmHT0e74FKPWGIjhc4QpsYx4/sFdIAD2j3apDVvl34=;
        b=Wls+r6rkAHEHlqemSzDVdxirdsAFs+gG0yAs86kLBqOvMGnFKiuX0/ITw5SMlcGID8
         U4O2NDHr7B3m8e3noExL8/mDTT/o0bamuO2QTZIxb3NUbdaoqfPS/w4EYOv2mdoCokBl
         yeHDN6AJKM1kp1B9GYckNJs7RJXYZDFXvBfG6yotBBeZbUuKqpXTZIXzddrzSuZ5Z9lD
         XfTj5/Rr6ARZIxASclDM+1PQPXGsQtUTDDWWU+bWODghsxCgNjPpvgSphHrZcUDIfSC2
         SOMmtmgq/+LCtELXOJL3CGlKo8Aqj6uT1+5dEBoNuvz1IB1Vnk9cYrvzVnr8pl3A55tU
         fASQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id d14si102255wru.1.2020.02.13.06.37.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Feb 2020 06:37:14 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 01DEbEi8023275
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2020 15:37:14 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01DEbD8t031104;
	Thu, 13 Feb 2020 15:37:13 +0100
Subject: Re: [PATCH v4 3/3] configs/arm64: Add Linux demo for pine64-plus
To: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>,
        jailhouse-dev@googlegroups.com
References: <32b59107-d919-a2c8-0761-4e03f5138209@siemens.com>
 <20200211095010.11234-1-vijaikumar.kanagarajan@gmail.com>
 <20200211095010.11234-3-vijaikumar.kanagarajan@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4fcf8d52-b6c0-73e9-c8f3-07c9b3a68ce2@siemens.com>
Date: Thu, 13 Feb 2020 15:37:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211095010.11234-3-vijaikumar.kanagarajan@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 11.02.20 10:50, Vijai Kumar K wrote:
> Add Linux demo with 2 CPUs and 128M RAM for Pine64+.
> 
> Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> ---
>   configs/arm64/dts/inmate-pine64-plus.dts | 114 +++++++++++++++++
>   configs/arm64/pine64-plus-linux-demo.c   | 148 +++++++++++++++++++++++
>   2 files changed, 262 insertions(+)
>   create mode 100644 configs/arm64/dts/inmate-pine64-plus.dts
>   create mode 100644 configs/arm64/pine64-plus-linux-demo.c
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
> index 00000000..1d099906
> --- /dev/null
> +++ b/configs/arm64/pine64-plus-linux-demo.c
> @@ -0,0 +1,148 @@
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
> +				1 << (32-32), 0, 0, (1 << (155-128)) | (1 << (156-128)),
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		{ /* IVSHMEM 00:00.0 (demo) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
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
> +			.shmem_dev_id = 1,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +		},
> +	},
> +};
> 

Thanks, all 3 applied to next.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4fcf8d52-b6c0-73e9-c8f3-07c9b3a68ce2%40siemens.com.
