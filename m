Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4HLXCAQMGQEM2KMDRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3628D31E810
	for <lists+jailhouse-dev@lfdr.de>; Thu, 18 Feb 2021 10:40:01 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id s25sf577491ljd.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 18 Feb 2021 01:40:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1613641200; cv=pass;
        d=google.com; s=arc-20160816;
        b=JGDq1SajO7SYVxZu4+oqNp/nxTGJp6mTFkZHKspP5Il+eTCoqB78NcTU+97sk8Z1JD
         gbJsoGIRkkTX3pmjvE3Kz3YZR4FbIZs5H/xM+uNATgVwhOg8dTyrEqtc8PHM4FzcGjVq
         uM4UVIfVZHGBU3BBnIyMe/qfbo1MT7u+bCTC54L5zo2DZkyRii1SJfBe68/BD4Vrh9/l
         HqXZPzFfb8TFYlxnN2GoKZj6yK9RWCLTlAQs5u5XJHlkmf6YDs6cveZVpOiIq2MlYpI5
         FWDr/djWfDUnRN9mw0mEUy87wBo2bSSmnMrVqD319cdCcm/60Gu/0YLrc37QQkRNhoQn
         Aimg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=QQromjHkbmAGOHNzdCYZr0U2HOP5YoQ68OV5iDwTbcA=;
        b=ySbWF6eMZmsxPBe5qBcwCtqK+T7VhoCA6eA4xFQFAyy2hz1C463UBgkGrORq3mExvu
         jKrAHk48m9BPQDqzXC/TxHmymCbFheTLbPTgf9ZwCShj763Gjxl8xIFjE4pK5sqrRvAP
         VTajb0xVcFgERqxdrjjelWIGRCvcIkiynnOQscUEjW00BDqY6yXEaiMS3adXQkMp1wGK
         d9YLHq7gyYHOk7aCsFVfmmlIoeORR43909DHjBCDNoj+cIiarVE+9Xy2MaWYcjrO42Ms
         BTewbbVKT5ChMrdvAxS7Srp/6d9H1So+76BGcZIODbqOHZfRmR2OrNbnOkpu9jINov7g
         jfrQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=neutral (google.com: 194.138.37.39 is neither permitted nor denied by best guess record for domain of jan.kiszka@siemens.com) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QQromjHkbmAGOHNzdCYZr0U2HOP5YoQ68OV5iDwTbcA=;
        b=VEztm31SW7mTQ9+8KXbOVJyaesUV4nAZf0b2dcWe3fMWW7ikyL7e9XOb0kZ+7YkrOb
         OZoDc/jzKwYezlNUp/ZPn+mnD3E90OFr6RVkpH38At5/H3e2l91POKN8BHV5JTyjwn+z
         yPQ6t2+IGeq0i/JesC02FvLkyXePSkU76f2d1zXslM9IHcnesaz8lvCOqS3wbexTtAN2
         CMUt7DSIcHrfh0nIJvF+Sj9Pm0Q5nTJc5Ehzc83BPibn0fiNVOWWDoZC7AFw1TANOUH9
         89Ma/4SBwnuSzYLV+GzC43cuwrLnGgt5Wh2uDPQsXCSDzi8lGceN9vftLAZdzk68D8RH
         67wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QQromjHkbmAGOHNzdCYZr0U2HOP5YoQ68OV5iDwTbcA=;
        b=cjumchVdnPWjICOCDATR6YCfZDq5qd+znkOEdyQD/CJ0YTMg1VZLu5ZGz86Uq0pd66
         nAbQYy0QuyHfPdZONPbV8AENcha59KIfI7g7MKZrw4r4lYpuhoVfoEtTZW8SG8BLba5R
         KrMYACLUh/T0MClQypWkFiYBHhmFDowT0B+jY0MUOLwNPNNg6fg9Gj5k9JDOgzYunQAB
         og/BigqjLx7uUcnoz2ixsNfSMJ8qWRhcx5NFoF7HjYnQuOc+Ngg7lQyyRM4uKObfaqOh
         dJqav86eBhoc4/3tqf/638xD6RW5tylm3XFTrTAAgDzuAPtIbwlvVLGsgMrbv29xtYhO
         u0nQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53329DA2u3+IUivXtdjCOm6e4zR2Hb3V1sA+3DQrE5MZMyCnHkXi
	MmCkRbjvr1uvtrjCaVwsbf8=
X-Google-Smtp-Source: ABdhPJxN3IyMTD3eqAU4uBqOIk1rdHwq1vPjJkrMu7klQeVCIqNq2QeLd2KrDYpAxgzFKece/s9nZg==
X-Received: by 2002:ac2:42d1:: with SMTP id n17mr2037544lfl.76.1613641200712;
        Thu, 18 Feb 2021 01:40:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3993:: with SMTP id j19ls3561499lfu.3.gmail; Thu,
 18 Feb 2021 01:39:59 -0800 (PST)
X-Received: by 2002:a05:6512:36cd:: with SMTP id e13mr2024101lfs.70.1613641199475;
        Thu, 18 Feb 2021 01:39:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613641199; cv=none;
        d=google.com; s=arc-20160816;
        b=LxKlBnNnpi2hU4kUzAVdbKXQm+OqojJAZStiDTjWGW+OjjpvOgJBAExzanNm/ZIYYn
         /aTF6pfEPY5Xc5r8SVl1r5MBp/2E0onHs4DWyDAKVPEywwv/LmgzySEutCkcMuD7x7aY
         G7EvbhOM8Hn0EQITZZtfqrym7TVWuly9RWYdYjcBv7G2r4ZECZzJ6LND+VnNX+Fw6Sqb
         3h0cl3JV3YeLy4lCGzN/pfz4otFCU/DOSDttO1vkRcxPZoqu4Y9rZiwclfepk7YwMEXJ
         KJjyFQ52a+azEFFWpQ0SUPafIZU9UOYBBr58yEKtyncrS2WrDoOOVJXpXBch9lMz24gK
         Ehbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=KXoLwXgCjIEie/yYuMsS+C7r52kk4EjuazPuKQXGMbU=;
        b=MH6Xx+WA2wXoDdK0RteQGintAa9viwsybytzjAhIKXrwbpEizb+2igiEOT0DfNog5r
         c9LD30az/2bGVOan5Hpxvyd0O/Mc7wzMLGDNNZa0jDgKfwzGTRnAmKJyzQqfUyr5EokY
         tzW5KtIvsffqBVkXW8lDMii+wfWe201UXKBBapW+gY6RYQdot/xpU3TzPPdmfhL4O53+
         3Pv73vg0/m+oaGMLQ9GsEuVjgMYjbCydkvXTCuEH5s+37H9IPl7sbpgDzfjG7d96lGOl
         DdZ+94Hi1ZQ6wBAhpWyE14TWbsMv8PDk5aGTKwPX+cuyAGiW1Mpm5T/0IWBoxyQWX6Rv
         N4dw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=neutral (google.com: 194.138.37.39 is neither permitted nor denied by best guess record for domain of jan.kiszka@siemens.com) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a17si75240ljq.5.2021.02.18.01.39.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2021 01:39:59 -0800 (PST)
Received-SPF: neutral (google.com: 194.138.37.39 is neither permitted nor denied by best guess record for domain of jan.kiszka@siemens.com) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 11I9dwCg002653
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Feb 2021 10:39:58 +0100
Received: from [139.22.135.163] ([139.22.135.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 11I9YvJ6009589;
	Thu, 18 Feb 2021 10:34:58 +0100
Subject: Re: [PATCH v2 2/3] configs: ls1043a-rdb: add DPAA support in linux
 inmate dts demo
To: hongbo.wang@nxp.com, jailhouse-dev@googlegroups.com, mingkai.hu@nxp.com,
        xiaobo.xie@nxp.com, jiafei.pan@nxp.com
References: <20210205085509.21595-1-hongbo.wang@nxp.com>
 <20210205085509.21595-3-hongbo.wang@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <72aac64b-cd6e-82cd-4248-4bdbbdea4696@siemens.com>
Date: Thu, 18 Feb 2021 10:34:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205085509.21595-3-hongbo.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=neutral
 (google.com: 194.138.37.39 is neither permitted nor denied by best guess
 record for domain of jan.kiszka@siemens.com) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 05.02.21 09:55, hongbo.wang@nxp.com wrote:
> From: "hongbo.wang" <hongbo.wang@nxp.com>
> 
>   if user want to non-root linux can connect ethernet or cloud
> via DPAA ports, and need high performance, should choose this dts.
> 

Wrong indention of the message (don't use "git show", use "git
format-patch").

>   this file will include inmate-ls1043a-rdb-fman-ucode.dtsi
>   the related config file is ls1043a-rdb-dpaa-linux-demo.c
> 

What is the idea behind pushing the ucode into a dtsi? Will unmodified
reuse be possible?

In any case, the include patch must come before this one, or you simply
fold it in.

Jan

> Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
> ---
>  configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts | 930 ++++++++++++++++++
>  1 file changed, 930 insertions(+)
>  create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts
> 
> diff --git a/configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts b/configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts
> new file mode 100644
> index 00000000..34629a41
> --- /dev/null
> +++ b/configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts
> @@ -0,0 +1,930 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device Tree for inmate cell on NXP ls1043a RDB platform
> + *
> + * Copyright 2020 NXP
> + *
> + *  hongbo.wang <hongbo.wang@nxp.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible = "fsl,ls1043a-rdb", "fsl,ls1043a";
> +	model = "LS1043A RDB Board";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	hypervisor {
> +		compatible = "jailhouse,cell";
> +	};
> +
> +	aliases {
> +		serial0 = &duart1;
> +		fman0 = &fman0;
> +		ethernet0 = &enet0;
> +		ethernet1 = &enet1;
> +		ethernet2 = &enet2;
> +		ethernet3 = &enet3;
> +		ethernet4 = &enet4;
> +		ethernet5 = &enet5;
> +		ethernet6 = &enet6;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x2>;
> +			clocks = <&clockgen 1 0>;
> +			next-level-cache = <&l2>;
> +			cpu-idle-states = <&CPU_PH20>;
> +			#cooling-cells = <2>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x3>;
> +			clocks = <&clockgen 1 0>;
> +			next-level-cache = <&l2>;
> +			cpu-idle-states = <&CPU_PH20>;
> +			#cooling-cells = <2>;
> +			enable-method = "psci";
> +		};
> +
> +		l2: l2-cache {
> +			compatible = "cache";
> +		};
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	idle-states {
> +		entry-method = "psci";
> +
> +		CPU_PH20: cpu-ph20 {
> +			compatible = "arm,idle-state";
> +			idle-state-name = "PH20";
> +			arm,psci-suspend-param = <0x0>;
> +			entry-latency-us = <1000>;
> +			exit-latency-us = <1000>;
> +			min-residency-us = <3000>;
> +		};
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		bman_fbpr: bman-fbpr {
> +			compatible = "shared-dma-pool";
> +			size = <0 0x1000000>;
> +			alignment = <0 0x1000000>;
> +			no-map;
> +		};
> +
> +		qman_fqd: qman-fqd {
> +			compatible = "shared-dma-pool";
> +			size = <0 0x400000>;
> +			alignment = <0 0x400000>;
> +			no-map;
> +		};
> +
> +		qman_pfdr: qman-pfdr {
> +			compatible = "shared-dma-pool";
> +			size = <0 0x2000000>;
> +			alignment = <0 0x2000000>;
> +			no-map;
> +		};
> +	};
> +
> +	sysclk: sysclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +		clock-output-names = "sysclk";
> +	};
> +
> +	reboot {
> +		compatible ="syscon-reboot";
> +		regmap = <&dcfg>;
> +		offset = <0xb0>;
> +		mask = <0x02>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <1 13 0xf08>, /* Physical Secure PPI */
> +			     <1 14 0xf08>, /* Physical Non-Secure PPI */
> +			     <1 11 0xf08>, /* Virtual PPI */
> +			     <1 10 0xf08>; /* Hypervisor PPI */
> +	};
> +
> +	gic: interrupt-controller@1410000 {
> +		compatible = "arm,gic-400";
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		reg = <0x0 0x1410000 0 0x10000>, /* GICD */
> +		      <0x0 0x142f000 0 0x1000>, /* GICC */
> +		      <0x0 0x1440000 0 0x20000>, /* GICH */
> +		      <0x0 0x146f000 0 0x1000>; /* GICV */
> +		interrupts = <1 9 0xf08>;
> +	};
> +
> +	soc: soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		dma-ranges = <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
> +
> +
> +		ddr: memory-controller@1080000 {
> +			compatible = "fsl,qoriq-memory-controller";
> +			reg = <0x0 0x1080000 0x0 0x1000>;
> +			interrupts = <0 144 0x4>;
> +			big-endian;
> +			dma-coherent;
> +		};
> +
> +
> +		dcfg: dcfg@1ee0000 {
> +			compatible = "fsl,ls1043a-dcfg", "syscon";
> +			reg = <0x0 0x1ee0000 0x0 0x1000>;
> +			big-endian;
> +			dma-coherent;
> +		};
> +
> +		clockgen: clocking@1ee1000 {
> +			compatible = "fsl,ls1043a-clockgen";
> +			reg = <0x0 0x1ee1000 0x0 0x1000>;
> +			#clock-cells = <2>;
> +			clocks = <&sysclk>;
> +			dma-coherent;
> +		};
> +
> +		duart1: serial@21c0600 {
> +			compatible = "fsl,ns16550", "ns16550a";
> +			reg = <0x00 0x21c0600 0x0 0x100>;
> +			clocks = <&clockgen 4 0>;
> +			status = "okay";
> +			dma-coherent;
> +		};
> +
> +		qman: qman@1880000 {
> +			compatible = "fsl,qman";
> +			reg = <0x0 0x1880000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +			memory-region = <&qman_fqd &qman_pfdr>;
> +			dma-coherent;
> +			clock-frequency = <400000000>;
> +		};
> +
> +		bman: bman@1890000 {
> +			compatible = "fsl,bman";
> +			reg = <0x0 0x1890000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +			memory-region = <&bman_fbpr>;
> +			dma-coherent;
> +		};
> +
> +		bportals: bman-portals@508000000 {
> +			ranges = <0x0 0x5 0x08000000 0x8000000>;
> +			dma-coherent;
> +		};
> +
> +		qportals: qman-portals@500000000 {
> +			ranges = <0x0 0x5 0x00000000 0x8000000>;
> +			dma-coherent;
> +		};
> +
> +		ptp_timer0: ptp-timer@1afe000 {
> +			compatible = "fsl,fman-ptp-timer", "fsl,fman-rtc";
> +			reg = <0x0 0x1afe000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clockgen 3 0>;
> +			dma-coherent;
> +		};
> +
> +		/* fman3-0 */
> +		fman0: fman@1a00000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			cell-index = <0>;
> +			compatible = "fsl,fman";
> +			ranges = <0x0 0x0 0x1a00000 0xfe000>;
> +			reg = <0x0 0x1a00000 0x0 0xfe000>;
> +			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clockgen 3 0>;
> +			clock-names = "fmanclk";
> +			fsl,qman-channel-range = <0x800 0x10>;
> +			ptimer-handle = <&ptp_timer0>;
> +			dma-coherent;
> +
> +			cc {
> +				compatible = "fsl,fman-cc";
> +			};
> +
> +			muram@0 {
> +				compatible = "fsl,fman-muram";
> +				reg = <0x0 0x60000>;
> +			};
> +
> +			bmi@80000 {
> +				compatible = "fsl,fman-bmi";
> +				reg = <0x80000 0x400>;
> +			};
> +
> +			qmi@80400 {
> +				compatible = "fsl,fman-qmi";
> +				reg = <0x80400 0x400>;
> +			};
> +
> +			fman0_oh1: port@82000 {
> +				cell-index = <0>;
> +				compatible = "fsl,fman-port-oh";
> +				reg = <0x82000 0x1000>;
> +				fsl,qman-channel-id = <0x809>;
> +			};
> +
> +			fman0_oh2: port@83000 {
> +				cell-index = <1>;
> +				compatible = "fsl,fman-port-oh";
> +				reg = <0x83000 0x1000>;
> +				fsl,qman-channel-id = <0x80a>;
> +			};
> +
> +			fman0_oh3: port@84000 {
> +				cell-index = <2>;
> +				compatible = "fsl,fman-port-oh";
> +				reg = <0x84000 0x1000>;
> +				fsl,qman-channel-id = <0x80b>;
> +			};
> +
> +			fman0_oh4: port@85000 {
> +				cell-index = <3>;
> +				compatible = "fsl,fman-port-oh";
> +				reg = <0x85000 0x1000>;
> +				fsl,qman-channel-id = <0x80c>;
> +			};
> +
> +			fman0_oh5: port@86000 {
> +				cell-index = <4>;
> +				compatible = "fsl,fman-port-oh";
> +				reg = <0x86000 0x1000>;
> +				fsl,qman-channel-id = <0x80d>;
> +			};
> +
> +			fman0_oh6: port@87000 {
> +				cell-index = <5>;
> +				compatible = "fsl,fman-port-oh";
> +				reg = <0x87000 0x1000>;
> +				fsl,qman-channel-id = <0x80e>;
> +			};
> +
> +			policer@c0000 {
> +				compatible = "fsl,fman-policer";
> +				reg = <0xc0000 0x1000>;
> +			};
> +
> +			keygen@c1000 {
> +				compatible = "fsl,fman-keygen";
> +				reg = <0xc1000 0x1000>;
> +			};
> +
> +			dma@c2000 {
> +				compatible = "fsl,fman-dma";
> +				reg = <0xc2000 0x1000>;
> +			};
> +
> +			fpm@c3000 {
> +				compatible = "fsl,fman-fpm";
> +				reg = <0xc3000 0x1000>;
> +			};
> +
> +			parser@c7000 {
> +				compatible = "fsl,fman-parser";
> +				reg = <0xc7000 0x1000>;
> +			};
> +
> +			vsps@dc000 {
> +				compatible = "fsl,fman-vsps";
> +				reg = <0xdc000 0x1000>;
> +			};
> +
> +			mdio0: mdio@fc000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
> +				reg = <0xfc000 0x1000>;
> +			};
> +
> +			xmdio0: mdio@fd000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
> +				reg = <0xfd000 0x1000>;
> +			};
> +
> +			/* fman3-0-1g-0 */
> +			fman0_rx_0x08: port@88000 {
> +				cell-index = <0x8>;
> +				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
> +				reg = <0x88000 0x1000>;
> +			};
> +
> +			fman0_tx_0x28: port@a8000 {
> +				cell-index = <0x28>;
> +				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
> +				reg = <0xa8000 0x1000>;
> +				fsl,qman-channel-id = <0x802>;
> +			};
> +
> +			ethernet@e0000 {
> +				cell-index = <0>;
> +				compatible = "fsl,fman-memac";
> +				reg = <0xe0000 0x1000>;
> +				fsl,fman-ports = <&fman0_rx_0x08 &fman0_tx_0x28>;
> +				ptp-timer = <&ptp_timer0>;
> +				pcsphy-handle = <&pcsphy0>;
> +			};
> +
> +			mdio@e1000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
> +				reg = <0xe1000 0x1000>;
> +
> +				pcsphy0: ethernet-phy@0 {
> +					reg = <0x0>;
> +				};
> +			};
> +
> +			/* fman3-0-1g-1 */
> +			fman0_rx_0x09: port@89000 {
> +				cell-index = <0x9>;
> +				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
> +				reg = <0x89000 0x1000>;
> +			};
> +
> +			fman0_tx_0x29: port@a9000 {
> +				cell-index = <0x29>;
> +				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
> +				reg = <0xa9000 0x1000>;
> +				fsl,qman-channel-id = <0x803>;
> +			};
> +
> +			ethernet@e2000 {
> +				cell-index = <1>;
> +				compatible = "fsl,fman-memac";
> +				reg = <0xe2000 0x1000>;
> +				fsl,fman-ports = <&fman0_rx_0x09 &fman0_tx_0x29>;
> +				ptp-timer = <&ptp_timer0>;
> +				pcsphy-handle = <&pcsphy1>;
> +			};
> +
> +			mdio@e3000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
> +				reg = <0xe3000 0x1000>;
> +
> +				pcsphy1: ethernet-phy@0 {
> +					reg = <0x0>;
> +				};
> +			};
> +
> +			/* fman3-0-1g-2 */
> +			fman0_rx_0x0a: port@8a000 {
> +				cell-index = <0xa>;
> +				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
> +				reg = <0x8a000 0x1000>;
> +			};
> +
> +			fman0_tx_0x2a: port@aa000 {
> +				cell-index = <0x2a>;
> +				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
> +				reg = <0xaa000 0x1000>;
> +				fsl,qman-channel-id = <0x804>;
> +			};
> +
> +			ethernet@e4000 {
> +				cell-index = <2>;
> +				compatible = "fsl,fman-memac";
> +				reg = <0xe4000 0x1000>;
> +				fsl,fman-ports = <&fman0_rx_0x0a &fman0_tx_0x2a>;
> +				ptp-timer = <&ptp_timer0>;
> +				pcsphy-handle = <&pcsphy2>;
> +			};
> +
> +			mdio@e5000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
> +				reg = <0xe5000 0x1000>;
> +
> +				pcsphy2: ethernet-phy@0 {
> +					reg = <0x0>;
> +				};
> +			};
> +
> +			/* fman3-0-1g-3 */
> +			fman0_rx_0x0b: port@8b000 {
> +				cell-index = <0xb>;
> +				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
> +				reg = <0x8b000 0x1000>;
> +			};
> +
> +			fman0_tx_0x2b: port@ab000 {
> +				cell-index = <0x2b>;
> +				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
> +				reg = <0xab000 0x1000>;
> +				fsl,qman-channel-id = <0x805>;
> +			};
> +
> +			ethernet@e6000 {
> +				cell-index = <3>;
> +				compatible = "fsl,fman-memac";
> +				reg = <0xe6000 0x1000>;
> +				fsl,fman-ports = <&fman0_rx_0x0b &fman0_tx_0x2b>;
> +				ptp-timer = <&ptp_timer0>;
> +				pcsphy-handle = <&pcsphy3>;
> +			};
> +
> +			mdio@e7000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
> +				reg = <0xe7000 0x1000>;
> +
> +				pcsphy3: ethernet-phy@0 {
> +					reg = <0x0>;
> +				};
> +			};
> +
> +			/* fman3-0-1g-4 */
> +			fman0_rx_0x0c: port@8c000 {
> +				cell-index = <0xc>;
> +				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
> +				reg = <0x8c000 0x1000>;
> +			};
> +
> +			fman0_tx_0x2c: port@ac000 {
> +				cell-index = <0x2c>;
> +				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
> +				reg = <0xac000 0x1000>;
> +				fsl,qman-channel-id = <0x806>;
> +			};
> +
> +			ethernet@e8000 {
> +				cell-index = <4>;
> +				compatible = "fsl,fman-memac";
> +				reg = <0xe8000 0x1000>;
> +				fsl,fman-ports = <&fman0_rx_0x0c &fman0_tx_0x2c>;
> +				ptp-timer = <&ptp_timer0>;
> +				pcsphy-handle = <&pcsphy4>;
> +			};
> +
> +			mdio@e9000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
> +				reg = <0xe9000 0x1000>;
> +
> +				pcsphy4: ethernet-phy@0 {
> +					reg = <0x0>;
> +				};
> +			};
> +
> +			/* fman3-0-1g-5 */
> +			fman0_rx_0x0d: port@8d000 {
> +				cell-index = <0xd>;
> +				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
> +				reg = <0x8d000 0x1000>;
> +			};
> +
> +			fman0_tx_0x2d: port@ad000 {
> +				cell-index = <0x2d>;
> +				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
> +				reg = <0xad000 0x1000>;
> +				fsl,qman-channel-id = <0x807>;
> +			};
> +
> +			ethernet@ea000 {
> +				cell-index = <5>;
> +				compatible = "fsl,fman-memac";
> +				reg = <0xea000 0x1000>;
> +				fsl,fman-ports = <&fman0_rx_0x0d &fman0_tx_0x2d>;
> +				ptp-timer = <&ptp_timer0>;
> +				pcsphy-handle = <&pcsphy5>;
> +			};
> +
> +			mdio@eb000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
> +				reg = <0xeb000 0x1000>;
> +
> +				pcsphy5: ethernet-phy@0 {
> +					reg = <0x0>;
> +				};
> +			};
> +
> +			/* fman3-0-10g-0 */
> +			fman0_rx_0x10: port@90000 {
> +				cell-index = <0x10>;
> +				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-10g-rx";
> +				reg = <0x90000 0x1000>;
> +				fsl,fman-10g-port;
> +			};
> +
> +			fman0_tx_0x30: port@b0000 {
> +				cell-index = <0x30>;
> +				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-10g-tx";
> +				reg = <0xb0000 0x1000>;
> +				fsl,fman-10g-port;
> +				fsl,qman-channel-id = <0x800>;
> +			};
> +
> +			ethernet@f0000 {
> +				cell-index = <0x8>;
> +				compatible = "fsl,fman-memac";
> +				reg = <0xf0000 0x1000>;
> +				fsl,fman-ports = <&fman0_rx_0x10 &fman0_tx_0x30>;
> +				pcsphy-handle = <&pcsphy6>;
> +			};
> +
> +			mdio@f1000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
> +				reg = <0xf1000 0x1000>;
> +
> +				pcsphy6: ethernet-phy@0 {
> +					reg = <0x0>;
> +				};
> +			};
> +		};
> +
> +		fsldpaa: fsl,dpaa {
> +			compatible = "fsl,ls1043a-dpaa", "simple-bus", "fsl,dpaa";
> +			dma-coherent;
> +			ethernet@0 {
> +				compatible = "fsl,dpa-ethernet";
> +				fsl,fman-mac = <&enet0>;
> +				dma-coherent;
> +			};
> +			ethernet@1 {
> +				compatible = "fsl,dpa-ethernet";
> +				fsl,fman-mac = <&enet1>;
> +				dma-coherent;
> +			};
> +			ethernet@2 {
> +				compatible = "fsl,dpa-ethernet";
> +				fsl,fman-mac = <&enet2>;
> +				dma-coherent;
> +			};
> +			ethernet@3 {
> +				compatible = "fsl,dpa-ethernet";
> +				fsl,fman-mac = <&enet3>;
> +				dma-coherent;
> +			};
> +			ethernet@4 {
> +				compatible = "fsl,dpa-ethernet";
> +				fsl,fman-mac = <&enet4>;
> +				dma-coherent;
> +			};
> +			ethernet@5 {
> +				compatible = "fsl,dpa-ethernet";
> +				fsl,fman-mac = <&enet5>;
> +				dma-coherent;
> +			};
> +			ethernet@8 {
> +				compatible = "fsl,dpa-ethernet";
> +				fsl,fman-mac = <&enet6>;
> +				dma-coherent;
> +			};
> +		};
> +
> +	};
> +
> +	pci@c0700000 {
> +		compatible = "pci-host-ecam-generic";
> +		device_type = "pci";
> +		bus-range = <0 0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		#interrupt-cells = <1>;
> +		interrupt-map-mask = <0 0 0 7>;
> +		interrupt-map = <0 0 0 1 &gic GIC_SPI 28 IRQ_TYPE_EDGE_RISING>,
> +			<0 0 0 2 &gic GIC_SPI 29 IRQ_TYPE_EDGE_RISING>,
> +			<0 0 0 3 &gic GIC_SPI 30 IRQ_TYPE_EDGE_RISING>,
> +			<0 0 0 4 &gic GIC_SPI 31 IRQ_TYPE_EDGE_RISING>;
> +		reg = <0x0 0xc0700000 0x0 0x100000>;
> +		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +};
> +
> +&qportals {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "simple-bus";
> +
> +	qportal0: qman-portal@0 {
> +		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
> +		reg = <0x0 0x4000>, <0x4000000 0x4000>;
> +		interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <0>;
> +	};
> +
> +	qportal1: qman-portal@10000 {
> +		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
> +		reg = <0x10000 0x4000>, <0x4010000 0x4000>;
> +		interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <1>;
> +	};
> +
> +	qportal2: qman-portal@20000 {
> +		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
> +		reg = <0x20000 0x4000>, <0x4020000 0x4000>;
> +		interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <2>;
> +	};
> +
> +	qportal3: qman-portal@30000 {
> +		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
> +		reg = <0x30000 0x4000>, <0x4030000 0x4000>;
> +		interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <3>;
> +	};
> +
> +	qportal4: qman-portal@40000 {
> +		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
> +		reg = <0x40000 0x4000>, <0x4040000 0x4000>;
> +		interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <4>;
> +	};
> +
> +	qportal5: qman-portal@50000 {
> +		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
> +		reg = <0x50000 0x4000>, <0x4050000 0x4000>;
> +		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <5>;
> +	};
> +
> +	qportal6: qman-portal@60000 {
> +		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
> +		reg = <0x60000 0x4000>, <0x4060000 0x4000>;
> +		interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <6>;
> +	};
> +
> +	qportal7: qman-portal@70000 {
> +		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
> +		reg = <0x70000 0x4000>, <0x4070000 0x4000>;
> +		interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <7>;
> +	};
> +
> +	qportal8: qman-portal@80000 {
> +		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
> +		reg = <0x80000 0x4000>, <0x4080000 0x4000>;
> +		interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <8>;
> +	};
> +
> +	qportal9: qman-portal@90000 {
> +		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
> +		reg = <0x90000 0x4000>, <0x4090000 0x4000>;
> +		interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <9>;
> +	};
> +
> +	qman-fqids@0 {
> +		compatible = "fsl,fqid-range";
> +		fsl,fqid-range = <256 256>;
> +	};
> +
> +	qman-fqids@1 {
> +		compatible = "fsl,fqid-range";
> +		fsl,fqid-range = <32768 32768>;
> +	};
> +
> +	qman-pools@0 {
> +		compatible = "fsl,pool-channel-range";
> +		fsl,pool-channel-range = <0x401 0xf>;
> +	};
> +
> +	qman-cgrids@0 {
> +		compatible = "fsl,cgrid-range";
> +		fsl,cgrid-range = <0 256>;
> +	};
> +
> +	qman-ceetm@0 {
> +		compatible = "fsl,qman-ceetm";
> +		fsl,ceetm-lfqid-range = <0xf00000 0x1000>;
> +		fsl,ceetm-sp-range = <0 16>;
> +		fsl,ceetm-lni-range = <0 8>;
> +		fsl,ceetm-channel-range = <0 32>;
> +	};
> +};
> +
> +&bportals {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "simple-bus";
> +
> +	bman-portal@0 {
> +		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
> +		reg = <0x0 0x4000>, <0x4000000 0x4000>;
> +		interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <0>;
> +	};
> +
> +	bman-portal@10000 {
> +		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
> +		reg = <0x10000 0x4000>, <0x4010000 0x4000>;
> +		interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <1>;
> +	};
> +
> +	bman-portal@20000 {
> +		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
> +		reg = <0x20000 0x4000>, <0x4020000 0x4000>;
> +		interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <2>;
> +	};
> +
> +	bman-portal@30000 {
> +		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
> +		reg = <0x30000 0x4000>, <0x4030000 0x4000>;
> +		interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <3>;
> +	};
> +
> +	bman-portal@40000 {
> +		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
> +		reg = <0x40000 0x4000>, <0x4040000 0x4000>;
> +		interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <4>;
> +	};
> +
> +	bman-portal@50000 {
> +		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
> +		reg = <0x50000 0x4000>, <0x4050000 0x4000>;
> +		interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <5>;
> +	};
> +
> +	bman-portal@60000 {
> +		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
> +		reg = <0x60000 0x4000>, <0x4060000 0x4000>;
> +		interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <6>;
> +	};
> +
> +	bman-portal@70000 {
> +		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
> +		reg = <0x70000 0x4000>, <0x4070000 0x4000>;
> +		interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <7>;
> +	};
> +
> +	bman-portal@80000 {
> +		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
> +		reg = <0x80000 0x4000>, <0x4080000 0x4000>;
> +		interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <8>;
> +	};
> +
> +	bman-portal@90000 {
> +		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
> +		reg = <0x90000 0x4000>, <0x4090000 0x4000>;
> +		interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
> +		cell-index = <9>;
> +	};
> +
> +	bman-bpids@0 {
> +		compatible = "fsl,bpid-range";
> +		fsl,bpid-range = <32 32>;
> +	};
> +};
> +
> +&fman0 {
> +	fsl,erratum-a050385;
> +	compatible = "fsl,fman", "simple-bus";
> +
> +	/* these aliases provide the FMan ports mapping */
> +	enet0: ethernet@e0000 {
> +		phy-handle = <&qsgmii_phy1>;
> +		phy-connection-type = "qsgmii";
> +		local-mac-address = [0e 09 00 01 03 05];
> +	};
> +
> +	enet1: ethernet@e2000 {
> +		phy-handle = <&qsgmii_phy2>;
> +		phy-connection-type = "qsgmii";
> +		local-mac-address = [0e 09 00 01 03 06];
> +	};
> +
> +	enet2: ethernet@e4000 {
> +		phy-handle = <&rgmii_phy1>;
> +		phy-connection-type = "rgmii-txid";
> +		local-mac-address = [0e 09 00 01 03 07];
> +	};
> +
> +	enet3: ethernet@e6000 {
> +		phy-handle = <&rgmii_phy2>;
> +		phy-connection-type = "rgmii-txid";
> +		local-mac-address = [0e 09 00 01 03 08];
> +	};
> +
> +	enet4: ethernet@e8000 {
> +		phy-handle = <&qsgmii_phy3>;
> +		phy-connection-type = "qsgmii";
> +		local-mac-address = [0e 09 00 01 03 09];
> +	};
> +
> +	enet5: ethernet@ea000 {
> +		phy-handle = <&qsgmii_phy4>;
> +		phy-connection-type = "qsgmii";
> +		local-mac-address = [0e 09 00 01 03 0a];
> +	};
> +
> +	enet6: ethernet@f0000 { /* 10GEC1 */
> +		phy-handle = <&aqr105_phy>;
> +		phy-connection-type = "xgmii";
> +		local-mac-address = [0e 09 00 01 03 04];
> +	};
> +
> +	mdio@fc000 {
> +		rgmii_phy1: ethernet-phy@1 {
> +			reg = <0x1>;
> +		};
> +
> +		rgmii_phy2: ethernet-phy@2 {
> +			reg = <0x2>;
> +		};
> +
> +		qsgmii_phy1: ethernet-phy@4 {
> +			reg = <0x4>;
> +		};
> +
> +		qsgmii_phy2: ethernet-phy@5 {
> +			reg = <0x5>;
> +		};
> +
> +		qsgmii_phy3: ethernet-phy@6 {
> +			reg = <0x6>;
> +		};
> +
> +		qsgmii_phy4: ethernet-phy@7 {
> +			reg = <0x7>;
> +		};
> +	};
> +
> +	mdio@fd000 {
> +		aqr105_phy: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c45";
> +			interrupts = <0 132 4>;
> +			reg = <0x1>;
> +		};
> +	};
> +};
> +
> +&bman_fbpr {
> +	compatible = "fsl,bman-fbpr";
> +	alloc-ranges = <0 0 0x10000 0>;
> +};
> +&qman_fqd {
> +	compatible = "fsl,qman-fqd";
> +	alloc-ranges = <0 0 0x10000 0>;
> +};
> +&qman_pfdr {
> +	compatible = "fsl,qman-pfdr";
> +	alloc-ranges = <0 0 0x10000 0>;
> +};
> +
> +&soc {
> +	fman@1a00000 {
> +#include "inmate-ls1043a-rdb-fman-ucode.dtsi"
> +	};
> +};
> 


-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/72aac64b-cd6e-82cd-4248-4bdbbdea4696%40siemens.com.
