Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJNYU77AKGQEMKQWBXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DBE2CE852
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Dec 2020 07:50:13 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id r24sf1645428lji.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Dec 2020 22:50:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607064613; cv=pass;
        d=google.com; s=arc-20160816;
        b=hB26aRcJrY3fW9rtZ2aUzDiof1l/ZSXsUImPQJy1v4IPBzHzai5eApq9VxOAFYU7Ey
         EZkRulQfdwqvRBnIhFt/mp32HGGNzZOFWDhtTsMR7BAndAENMjC7IzVaSww+W0P+AP0h
         uQTks+gtKsd5i7zEgmIhfdRG7QyOV16PvKAz2hzyql8Ep8NXQ2mSrClnQLEJOQPfcVTD
         r2kusQ3wzEmJ21egSnX7BRdAZv4AEvJ+0rew8vMjMsDuG728Ru6f05UZ7yIZQeXE2WbR
         ih/xYzKrv4rvA/Bsh/igQud90Zw1qnSpmzN0A9KcWGLnNoxBuU4yik/bV0XxWqoH5Dnv
         7lZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=5xCTOdc1UmMWGUwNuNIg1wqFub0YSPDNAyYVxtz5raU=;
        b=JEWSKRZWAOaA3MsjI6d3GekTRy8Ouu4g35G1NmovG+kvvWQ7ub/Ul0I75Kp5izSSJX
         CZUQeMOxc4xykPKOfvpQey5uhInB/zD4NTRqllOPllnXUZG9Xo69xdQJ0q6IIPacOQgn
         0NBKB7s+H6OcHtVga+wrGsdv2uyBvfJFyMviIF44ZHGB7J4rGAVfRkgInRubBgwWnZkY
         5ZXW2ShqZfwZlimEFwVDQn6nvLTHVghzU0CgIkZQpgO7s/AZycmTZRUbJ3MwwRvuv9Pm
         7SvXvG+Ux7RodDkmNozx1PfbBZ3N6k5qVtAgk+QDvF4CYIiApu7JzrB8gp8I3E0W+e2h
         3n/A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5xCTOdc1UmMWGUwNuNIg1wqFub0YSPDNAyYVxtz5raU=;
        b=aelpksaLnUg0GlG2KCC/K7ChNCPevVIF9QGaVFlyAhiHjdKuJjO2TdiAPXxkuhJy/N
         cV1fQ/2aKewDWkBjo+27+im8M5wgxr+xzcdDObIn8qMECpr3PNP4o/H16OzzNVoKJlUP
         S4Je9xUDlUWQtd5ki84Sh1zv0pevL1r1CZ9QQ/1wnnSWg5raFtlwXEGPvG+POR4TPxtu
         v1jlI5PEmil8s3RdYXptx4tfynh5jOnp00E4vGGkAB8PrGKMPqr1/zDSDcscXhRjjK48
         qLzHZ07z3dDcOdZ8fyVil+nhr6EvFlKT6YikCWGjpcdCIg2AgkUu+nvKDM9NuXI3+Rxq
         Wm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5xCTOdc1UmMWGUwNuNIg1wqFub0YSPDNAyYVxtz5raU=;
        b=mlpkcTQzgRDHC+pgsAJIwvs98zp6XOmAFkcRWxpU0NxbTQTrAVBIRQW/yaZwFzg08J
         Q4QVeD/LftuQSwkrJHE3493nCB/9GQVMpnMyTYoFqTu3wjlpRpyVJ1VfpiboI0g3uW5U
         U4RP7m6jK3lqGNtYvg382RATj+CguYY0H2vJ6suqhcxch6s9Uv5S7xh9nLuXPeY5IfuQ
         td2bCkWbDYBt+MMoKRPj50JFDSSx6aGFIF2ZSmnHPg1vZJLjxQEu93ENRGqnht4FH6LD
         qAc+jvOIUCSRUL9+vwEGZ0o+tIq36AZhMw1bsuqsxJXNqJ+4jWjT/tlk4+PBuR1M32N6
         Ljug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533RltzSwtCpGDkcp63GlfWXorKUev1swZmFwoHrXgYmdncTFZUu
	qPe2RnvMGiWOp9W7vVW4uMM=
X-Google-Smtp-Source: ABdhPJx9FxK1Q6zn8GsFR4XJqmUmttSIJCI+SwRHSAckgsxRVbKBMuatAOwAFiobnZwYl3rj967PoQ==
X-Received: by 2002:a19:c847:: with SMTP id y68mr2639476lff.325.1607064613547;
        Thu, 03 Dec 2020 22:50:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5a02:: with SMTP id q2ls2015089lfn.1.gmail; Thu, 03 Dec
 2020 22:50:12 -0800 (PST)
X-Received: by 2002:ac2:46f2:: with SMTP id q18mr2568053lfo.229.1607064612231;
        Thu, 03 Dec 2020 22:50:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607064612; cv=none;
        d=google.com; s=arc-20160816;
        b=k1WLf4LH01HIO+u3dHiCC3i+OhRxpt3lHioJP2FXL6IcXp/302ewVsl5chouWOPVjm
         mSmm/3lyhN+5dg0OKBvyvddmFyk7fRzVlh2CB5p3ejNNLAqXTRi0jCxUkh0Ni6SHl1Me
         xVQk5R6d/qrR3RAu2A+h7jV/m8r7Nbvm0CJvOokovMZNLhM75Z8jI9zbOeee9dKNUv6O
         ATOAG97Dg7urLC2+SyfHQfD+qkszIjthjiimnATFyWIcYlE16HRmSQxdfTsl6YNQgyC2
         nsBRaWL9Wswwu0iUwr3iSZHT1zOOKvXYvFPKzM6w1CCjXnVGdojDRqN4MDjVKntGTu2f
         cwJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=DEya/eyR1N1hmfwWZ7Fx4D17QtJLv0ntGfDJsVH4M8c=;
        b=htG1HpYXcAcuWZMI+ZttwlgKO2uoJf0xGNglA89H5JwtH3TzHG9urkiIxtiD5jP0hC
         wXX8/CiuSVIQ8TFoZiEk17TfAe6E41eWD4QCpPd7Zl/NmDlN6ps3tE0Fcs8slXn+mlfQ
         PIjF3UbW6tyiix2VIZmsUq4je67g8fjV/D+4uy9w0ovD9MIfWyjTb/aNsaSdSHz47Ul4
         AWLszp9C2qfbcxThqerLZBQgWszn4Br8mMOr/YCvHTPj+2GbqLScc9lMZ0P1VM3Ke/uB
         vfTg6bGiXirQfpJuao9+c2A12cbi3qkipVAKMrV0SqZnOOcRxjE5OvaMwlSqbKlywJJH
         JY0A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id y21si150696lfl.7.2020.12.03.22.50.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Dec 2020 22:50:12 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0B46oBEV016865
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Dec 2020 07:50:11 +0100
Received: from [167.87.33.175] ([167.87.33.175])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B46oAKa006463;
	Fri, 4 Dec 2020 07:50:11 +0100
Subject: Re: [PATCH v3 2/2] configs: ls1046a-rdb: Add linux inmate dts demo
To: Jiafei Pan <Jiafei.Pan@nxp.com>, jailhouse-dev@googlegroups.com
References: <20201204034516.20000-1-Jiafei.Pan@nxp.com>
 <20201204034516.20000-2-Jiafei.Pan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c64e1cb0-0311-67f7-3853-fca75bbfc334@siemens.com>
Date: Fri, 4 Dec 2020 07:50:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204034516.20000-2-Jiafei.Pan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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

On 04.12.20 04:45, Jiafei Pan wrote:
> Add device tree demo for running Linux as an inmate on
> NXP ls1046a RDB board.
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> ---
> Change in v2:
> 	- Added inmate dts
> 
>  configs/arm64/dts/inmate-ls1046a-rdb.dts | 177 +++++++++++++++++++++++
>  1 file changed, 177 insertions(+)
>  create mode 100644 configs/arm64/dts/inmate-ls1046a-rdb.dts
> 
> diff --git a/configs/arm64/dts/inmate-ls1046a-rdb.dts b/configs/arm64/dts/inmate-ls1046a-rdb.dts
> new file mode 100644
> index 00000000..8dcda43c
> --- /dev/null
> +++ b/configs/arm64/dts/inmate-ls1046a-rdb.dts
> @@ -0,0 +1,177 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device Tree for inmate cell on NXP ls1046a RDB platform
> + *
> + * Copyright 2020 NXP
> + *
> + * Jiafei Pan <jiafei.pan@nxp.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible = "fsl,ls1046a-rdb", "fsl,ls1046a";
> +	model = "LS1046A RDB Board";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial0 = &duart1;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72";
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
> +			compatible = "arm,cortex-a72";
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
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_RAW(0xf) |
> +					  IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_RAW(0xf) |
> +					  IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_RAW(0xf) |
> +					  IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_RAW(0xf) |
> +					  IRQ_TYPE_LEVEL_LOW)>;
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
> +		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |
> +					 IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +
> +	soc: soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		dma-ranges = <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
> +		dma-coherent;
> +
> +
> +		ddr: memory-controller@1080000 {
> +			compatible = "fsl,qoriq-memory-controller";
> +			reg = <0x0 0x1080000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> +			big-endian;
> +		};
> +
> +		scfg: scfg@1570000 {
> +			compatible = "fsl,ls1046a-scfg", "syscon";
> +			reg = <0x0 0x1570000 0x0 0x10000>;
> +			big-endian;
> +		};
> +
> +		dcfg: dcfg@1ee0000 {
> +			compatible = "fsl,ls1046a-dcfg", "syscon";
> +			reg = <0x0 0x1ee0000 0x0 0x1000>;
> +			big-endian;
> +		};
> +
> +		clockgen: clocking@1ee1000 {
> +			compatible = "fsl,ls1046a-clockgen";
> +			reg = <0x0 0x1ee1000 0x0 0x1000>;
> +			#clock-cells = <2>;
> +			clocks = <&sysclk>;
> +		};
> +
> +		duart1: serial@21c0600 {
> +			compatible = "fsl,ns16550", "ns16550a";
> +			reg = <0x00 0x21c0600 0x0 0x100>;
> +			clocks = <&clockgen 4 1>;
> +			status = "okay";
> +		};
> +
> +	};
> +
> +	pci@fb500000 {
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
> +		reg = <0x0 0xfb500000 0x0 0x100000>;
> +		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +};
> +
> 

Both merged with minor tweaking.

Thanks,
Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c64e1cb0-0311-67f7-3853-fca75bbfc334%40siemens.com.
