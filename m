Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJ6YT6FQMGQERM3RD3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id B578C42D53E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Oct 2021 10:36:56 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id z18-20020a0565120c1200b003fd76d7ca21sf1123123lfu.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Oct 2021 01:36:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634200616; cv=pass;
        d=google.com; s=arc-20160816;
        b=TdKMWN/qJ5lVX3RxLKBcr0UEm2A/Hbv8mW3p14SYW1HaCS2uz7W6yqSPtBCbu5yYWd
         TgeHJTTGhq4C+BtAluuYObcqQMzKzPJIjs+lhj71GcgvEQ2gK2Qk1YUYG/IqkKSwGU00
         Wb/FzcKcGP90WFO8WYqprrwHq6CWe8nLy5L9mSOHannisec/SuTzPAqNtJsHQ9HyDUzI
         CVV0v3rY3tIMAFoWTPV9KhZC9zkLT5kBDOs5Ufm1GX7tOL/h1Sqd13yMOiaccZWAN2gh
         aqLDIGKucc5ez5+hUByI4klao2SNJRw22WqSH7ZyybHSpuA3ZoUt8xi9RSJYKh5q4uzk
         9Bfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=KOVkOpJjyESeZxWWQ7E96C7leIvcprfjoKEx4uuUtPU=;
        b=mjG3atR1Ojz0EZJvo11Fi5Fc9C00LLsVRbStC8iL3rPc8htL9o0UZDIsKpMcd7mm8N
         P8QFJ7Sy+XuTmi/RU2wUdshVe64a8YKpcsZFw50kEgA87n3kkgYC94Y+0RT9EvuLg9g2
         kS183sVVxEaXAvdOm3lhnkxA4aDBTy6rPH+IyaiATlbgiGtmok7/xvxWWhLe9zDF39SX
         TyIOn7ByFTNohi9c4uwBGLxTcNDCNDIUXcovwd1k89zAJrap4adVF3JWu+4u6+iOCWdk
         vODc4hLYIKVxb2lsuRK44wlsRc9g4NZDNQwdf5w65hOuYhG/PuzEqQ9cU2vT7qE4SKEL
         3j4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KOVkOpJjyESeZxWWQ7E96C7leIvcprfjoKEx4uuUtPU=;
        b=oRMTV8divXsq9hIZKV9X7Z89MG55BadVhX71WHzmqrx+z2rYX9N66eTC/zRyI24YsK
         O5HS/zZg19l+IyJn5itd57tM+2oGGQ7iuzYHp4zEj7cZ/iOuBtNEu2wey6Rxpmh7pN/a
         A7NBt8++XxoVS1KaBpo1RPThgfPSVm0xGGfO2vF+K3VTXLvxybY/o6sC72xudaPsSO5G
         JWwyTXUplePM1so5HHb3oazViexnLPhsW8uLIGIyMR/YieC8UOitpV1vJ1J/sJ+itfh5
         y7afoQiqwqCqLjQQxgDd5s1W+q7f08fQJLA1YsvAykL4Z6futNosJ8DZMnmdjXMTvObf
         DRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KOVkOpJjyESeZxWWQ7E96C7leIvcprfjoKEx4uuUtPU=;
        b=HjWvp+ZGcNeq5Ec2gxDtbM2u+YYcji+w4O39zx8p4XLXbCuCr0j3X68xqkZV3BoL3b
         cnY4KknQfbqGy8GOyFs2nJKuznaoZRl/jfmd6zKnqAadXSdKGVUPjk5OIXaD+DT0s0c4
         VKoBzpbrAe57geFhzXYsReoJ8ZurIR6fzfEBfTwWHmiGEHJYHGcJLA4Q2GiFBdTHb767
         5JiQLb2Kge5MchDjCcyMDLHxuZ3jwN0kY3hdmDBW/+KyI4RXi5RXp6/g0A5CuuTxtzYq
         SRwctOK6tjggQ4BvKictjRI8QSh1v6yALo1zsbn7uz6zbn9iZUOHQMVKu6xNQAuXEHBw
         SzmQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5330WxTyLJ8kYKlFovT+bSnG8a+uz7YKp0fbEFw47r9Vca40cCcW
	kuEtR+2xUwWx6UiIso1DjwE=
X-Google-Smtp-Source: ABdhPJwm1C41l91sZ6LFXEg6rfaFPRltZWbTxOEFwOBmzy9yowBDFopgr1KlHn8m9+uwSiXTJFE86g==
X-Received: by 2002:ac2:443b:: with SMTP id w27mr3801324lfl.63.1634200616220;
        Thu, 14 Oct 2021 01:36:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3a83:: with SMTP id q3ls118447lfu.2.gmail; Thu, 14
 Oct 2021 01:36:54 -0700 (PDT)
X-Received: by 2002:a19:c74d:: with SMTP id x74mr3795680lff.603.1634200614828;
        Thu, 14 Oct 2021 01:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634200614; cv=none;
        d=google.com; s=arc-20160816;
        b=Zr8/OYInntm00kFuu2ExllTrHgMTli6hpyigPTryjpBwndr/vYa0nhwB93t0/fyOZd
         jQoRKl8bAvAJT/18JMezHQrJNuyNVvGzOY1BHtYO3+YkKUeHyJe8T4EJKg8OFdvoTchE
         w8lSgjkd+fOSwviefC4IHpoaKDmLJoYOKs86PDfjSDcfQlQrE0ORbDoYk3ApaOlQNYzr
         vegaQxS5jYxtMytYCpnUy+caWEEFnfYNf0ZRx2z1O0jB6JalU+5KH6oWFGAGge9Gy+KS
         BFrfL3oeHnCuLc7/xujjSrVJ/lpFYH2wfFi4Sp2J4OwL/Gwm3Cn2db0tgVNOGV2icNVL
         v5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=0S1wkiocPdGd0YdSaDwJ8Y5ZX7k1eWqVM82qPiLoPBs=;
        b=OjKiPFQ008aEN6x9LG7xmTg80Bs31pZPuA4SwWAH5fIiX1NmnjAmPYk4aFSVrXYTYV
         Rro/VeeXNWjniejyr3+OI8zqXXDg2DqSFt47gjAcgvIQF+TTaxhtZB5mM/WF7KikE3Vj
         5gU+zymm6lgUdEqNHrkddYQIvifWLauA8gPnE2wokuWQ3PIoCU2uWzMHF9oem03jep/S
         iYC/VobWo0KjYFQH3BJSOa+BVfMqBAuMOJvSdgGC7ufd1RZ8MweqA9WR2URKZH3gbe7f
         chphDkb8gpq+ipAQf9HxMdtnUFE0LSxWkdYdJ3OY+/RlWftqKaXUjGynZec7H14RUuW7
         GRjQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id v25si119028lfr.1.2021.10.14.01.36.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Oct 2021 01:36:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 19E8asBq010333
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Oct 2021 10:36:54 +0200
Received: from [167.87.2.42] ([167.87.2.42])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 19E8arBP005817;
	Thu, 14 Oct 2021 10:36:53 +0200
Subject: Re: [PATCH 2/2] configs: arm64: Add Linux inmate DTS demo for NXP
 LS2088ARDB platform
To: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>,
        jailhouse-dev@googlegroups.com
References: <20211012115644.31005-1-anda-alexandra.dorneanu@nxp.com>
 <20211012115644.31005-2-anda-alexandra.dorneanu@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <30d4c375-372c-3fdb-355a-1a0ebdd104b2@siemens.com>
Date: Thu, 14 Oct 2021 10:36:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012115644.31005-2-anda-alexandra.dorneanu@nxp.com>
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

On 12.10.21 13:56, Anda-Alexandra Dorneanu wrote:
> Add device tree demo for Linux inmate running on NXP LS2088ARDB platform
> 
> Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
> ---
>  configs/arm64/dts/inmate-ls2088a-rdb.dts | 138 +++++++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 configs/arm64/dts/inmate-ls2088a-rdb.dts
> 
> diff --git a/configs/arm64/dts/inmate-ls2088a-rdb.dts b/configs/arm64/dts/inmate-ls2088a-rdb.dts
> new file mode 100644
> index 00000000..8aa36f54
> --- /dev/null
> +++ b/configs/arm64/dts/inmate-ls2088a-rdb.dts
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device Tree for inmate cell on NXP LS2088ARDB platform
> + *
> + * Copyright 2021 NXP
> + *
> + * Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible = "fsl,ls2080a";
> +	model = "LS2088A RDB Board";
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
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a57";
> +			reg = <0x1>;
> +			clocks = <&clockgen 1 0>;
> +			cpu-idle-states = <&CPU_PW20>;
> +			next-level-cache = <&cluster0_l2>;
> +			#cooling-cells = <2>;
> +			enable-method = "psci";
> +		};
> +
> +		cluster0_l2: l2-cache0 {
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
> +		 CPU_PW20: cpu-pw20 {
> +			compatible = "arm,idle-state";
> +			idle-state-name = "PW20";
> +			arm,psci-suspend-param = <0x0>;
> +			entry-latency-us = <2000>;
> +			exit-latency-us = <2000>;
> +			min-residency-us = <6000>;
> +		};
> +
> +	};
> +
> +	sysclk: sysclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +		clock-output-names = "sysclk";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <1 13 4>,
> +			     <1 14 4>,
> +			     <1 11 4>,
> +			     <1 10 4>;
> +	};
> +
> +	gic: interrupt-controller@6000000 {
> +		compatible = "arm,gic-v3";
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		reg = <0x0 0x06000000 0 0x10000>, /* GIC Dist */
> +			<0x0 0x06100000 0 0x100000>, /* GICR(RD_base+SGI_base)*/
> +			<0x0 0x0c0c0000 0 0x2000>, /* GICC */
> +			<0x0 0x0c0d0000 0 0x1000>, /* GICH */
> +			<0x0 0x0c0e0000 0 0x20000>; /* GICV */
> +		interrupts = <1 9 0x4>;
> +	};
> +
> +	soc: soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		ddr1: memory-controller@1080000 {
> +			compatible = "fsl,qoriq-memory-controller";
> +			reg = <0x0 0x1080000 0x0 0x1000>;
> +			interrupts = <0 17 0x4>;
> +			little-endian;
> +		};
> +
> +		clockgen: clocking@1300000 {
> +			compatible = "fsl,ls2080a-clockgen";
> +			reg = <0x0 0x1300000 0x0 0xa0000>;
> +			#clock-cells = <2>;
> +			clocks = <&sysclk>;
> +		};
> +
> +		duart1: serial@21c0500 {
> +			compatible = "fsl,ns16550", "ns16550a";
> +			reg = <0x00 0x21c0500 0x0 0x100>;
> +			clocks = <&clockgen 4 3>;
> +			status = "okay";
> +		};
> +	};
> +
> +	pci@13000000 {
> +		compatible = "pci-host-ecam-generic";
> +		device_type = "pci";
> +		bus-range = <0 0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		#interrupt-cells = <1>;
> +		interrupt-map-mask = <0 0 0 7>;
> +		interrupt-map = <0 0 0 1 &gic GIC_SPI 53 IRQ_TYPE_EDGE_RISING>,
> +			<0 0 0 2 &gic GIC_SPI 54 IRQ_TYPE_EDGE_RISING>,
> +			<0 0 0 3 &gic GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
> +			<0 0 0 4 &gic GIC_SPI 56 IRQ_TYPE_EDGE_RISING>;
> +		reg = <0x0 0x13000000 0x0 0x100000>;
> +		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +};
> 

Thanks, both applied to next.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/30d4c375-372c-3fdb-355a-1a0ebdd104b2%40siemens.com.
