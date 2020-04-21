Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCVM7L2AKGQEBLGKA7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 530F41B1EF0
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 08:43:23 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id x15sf5032153wrn.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Apr 2020 23:43:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587451403; cv=pass;
        d=google.com; s=arc-20160816;
        b=ee1EdYOGdT/2y1IHOWq9vTTRde3/C313xu8BMWFiobNMQ4/G4dFU+oMLN0wLOipHYO
         pxr9PboeTx6feSqAebc+xFKxtouLHf9hefqZQPDu2DW449Vn6LdS/4I/6Gu77BH2e0Aj
         fqZ+rJ7Qj6j8vdP5RYrauJejlEEMHtn8ra8obiaZ6PAdGbYFNVZVoSE+rq9RYd4hy12X
         PU+pm92LKI3KJ2aeNVeX5II/38K8Jeg6whbEm/1jDrAboo5ypoty2xnXOBKZdYuX2PRJ
         dGoeZejHx0EL/Ge07j7xiXV/zRi4zPxU0JxYIgck88UWUZoRLO6HoG7K4hr+hTLlqDqh
         iQUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=SkU5IMjxQhWztgy5UTt8EOq+iwy5S6eVhaptS8FcPR8=;
        b=U58xTCbHS5JWVOfNUglPABrCmDcwe3HEVP6BRCQnvgJsUCAk5Sz5bhQyhp9CjQx5AT
         rHK4a1LjWr7lCdKHs08aXt+PuNGGtNl2o4389PBKHBz0eZK7UZlPkQN52UrUqUrIN2jp
         NlEzfMAtDM2wFBb7mYhHvClmO/bM0f66vx0qMTkDTmRIj7OOzwb+tTOiymIwpduAF8Sl
         nhKT6HYDjOI2dQlcxvEwm5ldz2EZDi82foRclZ12+6LJwkTir5+iLbqds5wPKXbLPi/W
         Bndl6E9AWixQDmw56FpiLdYCnYg3dkDZlXW9Hn35ME9JGZTxjlzXPldFDArVNcWtqMW/
         TF5A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SkU5IMjxQhWztgy5UTt8EOq+iwy5S6eVhaptS8FcPR8=;
        b=UA2vDkR/MCgm4r/4kclvpY9CwFRNj2upm9Nu2m6arZAqDEKdTHC90OX0teDtaqAmqg
         J41yOpjEAI/KzD7Etj2bYpWg+B+q9K5ROvBwpkPXaNCVU2DN4WTwyK/AM7nSIWXMjVf9
         y7n92zXPBUO+n58tv7RGu5tyxPZlZWZWkXnRqbjZDqx9BDuBK/n2nJTluNPgBPZxp/Ie
         HSeC0cvyEspvnc8FTopmTd93mOX+ar2pTBE4NgNpuMNPGw9Dj2AJXgmKUMQlEnIiyVZp
         7UEVIWUojTK1jW4DSCm7kXwZ5Y5F2uelp9QbdeTONR1kAV4auOqMkReT6UwwKXPLtpC2
         Zdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SkU5IMjxQhWztgy5UTt8EOq+iwy5S6eVhaptS8FcPR8=;
        b=PkPn8RMA4KJ3zTo2LgqBqi9d0Qh7MH02Po0Gq1zk1XLR/YEn5eHGLBv+XErFO1QK6w
         BJYcBv2RxFb7qPTLfNja/ZIGEO+iBbiFT1o/AFgSrqoItLXq5Z8D+EUUvooFjiA04PYA
         +Z3BF353jgl3jiElPJGfO/0sk4qFK44i+widU61Sn2yQP9EROqsXFDNodFsLpAK0CJwj
         59/rbD10TS6ikd056Lt16YTsgYAgm/iv3LXXXAx/t+fB01lwvnwzz2Bk3v04+IkuZT7w
         yQOC01hKlp7ylOmHmD5VuctWEQdn/uQ9zm1Y4AXq8iNna8smdQDarhtXJ1SDhc2rYTeO
         /pIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubW9YumlMd2niS7lSWut91IHNUCOlKQfj/fhzSLe54SOHBdPjkg
	/Dy0BqSKSUqRFtGtU0uXTa4=
X-Google-Smtp-Source: APiQypIgta2cVKqbSzybbFH7zggSs85wQflKCkMs8wVTpH7d/dQLYtx3ShR0NGuZ1NUx8aZvmwRfqA==
X-Received: by 2002:adf:b310:: with SMTP id j16mr20566541wrd.95.1587451403013;
        Mon, 20 Apr 2020 23:43:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:668b:: with SMTP id l11ls7395845wru.0.gmail; Mon, 20 Apr
 2020 23:43:22 -0700 (PDT)
X-Received: by 2002:a05:6000:128d:: with SMTP id f13mr23417481wrx.241.1587451402311;
        Mon, 20 Apr 2020 23:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587451402; cv=none;
        d=google.com; s=arc-20160816;
        b=bPzgBc5Ly8V9PGV8EqRtPV7r2v75JBVGkrX+qMG4e9scYR5HeQujgljvSwXnzAxPDV
         3eL+8ko7PnKGUcnXV6WQyNa/0C0Xxv5cUwVJ9+nBo8/C9NhmiEbIBTFMfzECBkvc03X7
         XKozfWSITlZPqdaJCzaIeK9fIU3mql14mAcD0eIMPH/c57rezvCqdQ0NRz9n74OfGj2f
         7Lt+G6WfBfZ1w0oNh7IbBxM4k8WJcul/TdZn47TKY+SQmdUIwf9urfGXSkyTZjHMrr4u
         ygy3svYS2TchFvPNS09s8+iJX3kFmBYhsDKpdzUxJ5Xfmyb8uklgwY83OM4ePNpdWAVv
         Bp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=bjDt61R5wbvbq2olGpI6y+1sMbMgy+VTBWXWG0UVwtc=;
        b=tVonnxqNgp3/Zy2fLe3W7ZEdKXXlAubg1b5Y19TmdDcFwrN7duECp9MrWsMlWWRnzr
         Qwjl1/Fq7k9RQqdWyVXb6QdEJgK4ZMJH2hv182+qH72HkdeYqWXeFKje7SN4g/ek3HMX
         4TQlqmXWK/LSZfA3PHYWvbIbGxdQYn4/x3GXmBrQUZA4hRMHl9/beKiyc3jshpzoNgD0
         51Z/+VQPieBJDXoDTVLdXnAeSA7wuYFolJ+IfMXRmq074SMy4gPZF1kYRNhNLSKqwKwE
         IDZPutKqEQLnvgjI1E4XwiA3dmJKrpdfrM22xDTWZdqWlTKLEJro+RVMsPUwU9jNDjAs
         +yPg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id o9si87424wrp.3.2020.04.20.23.43.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Apr 2020 23:43:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 03L6hLZc029707
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Apr 2020 08:43:22 +0200
Received: from [139.22.120.242] ([139.22.120.242])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 03L6hKj4010766;
	Tue, 21 Apr 2020 08:43:21 +0200
Subject: Re: [PATCH V1] configs: arm64: Add inmate device trees for all the
 i.MX8M family
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200421153427.10925-1-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0ae284cc-662f-fd75-23a2-447c4c962a54@siemens.com>
Date: Tue, 21 Apr 2020 08:43:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421153427.10925-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 21.04.20 17:34, Alice Guo wrote:
> These device trees are used to boot Linux kernel in the inmate cell.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>   configs/arm64/dts/inmate-imx8mm-evk.dts      | 172 ++++++++++++++++++
>   configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts | 171 ++++++++++++++++++
>   configs/arm64/dts/inmate-imx8mp-evk.dts      | 162 +++++++++++++++++
>   configs/arm64/dts/inmate-imx8mq-evk.dts      | 175 +++++++++++++++++++
>   4 files changed, 680 insertions(+)
>   create mode 100644 configs/arm64/dts/inmate-imx8mm-evk.dts
>   create mode 100644 configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
>   create mode 100644 configs/arm64/dts/inmate-imx8mp-evk.dts
>   create mode 100644 configs/arm64/dts/inmate-imx8mq-evk.dts
> 
> diff --git a/configs/arm64/dts/inmate-imx8mm-evk.dts b/configs/arm64/dts/inmate-imx8mm-evk.dts
> new file mode 100644
> index 00000000..f7c21b10
> --- /dev/null
> +++ b/configs/arm64/dts/inmate-imx8mm-evk.dts
> @@ -0,0 +1,172 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2020 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	model = "Freescale i.MX8MM EVK";
> +	compatible = "fsl,imx8mm-evk", "fsl,imx8mm";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial3 = &uart4;
> +		mmc2 = &usdhc3;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		A53_2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x2>;
> +			clock-latency = <61036>; /* two CLK32 periods */
> +			next-level-cache = <&A53_L2>;
> +			enable-method = "psci";
> +			#cooling-cells = <2>;
> +		};
> +
> +		A53_3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x3>;
> +			clock-latency = <61036>; /* two CLK32 periods */
> +			next-level-cache = <&A53_L2>;
> +			enable-method = "psci";
> +			#cooling-cells = <2>;
> +		};
> +
> +		A53_L2: l2-cache0 {
> +			compatible = "cache";
> +		};
> +	};
> +
> +	gic: interrupt-controller@38800000 {
> +		compatible = "arm,gic-v3";
> +		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */
> +		      <0x0 0x38880000 0 0xC0000>; /* GICR (RD_base + SGI_base) */
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent = <&gic>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Secure */
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Non-Secure */
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>; /* Hypervisor */
> +		clock-frequency = <8333333>;
> +	};
> +
> +	clk_dummy: clock@7 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +		clock-output-names = "clk_dummy";
> +	};
> +
> +	/* The clocks are configured by 1st OS */
> +	clk_200m: clock@8 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <200000000>;
> +		clock-output-names = "200m";
> +	};
> +	clk_266m: clock@9 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <266000000>;
> +		clock-output-names = "266m";
> +	};
> +	clk_80m: clock@10 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <80000000>;
> +		clock-output-names = "80m";
> +	};
> +
> +	osc_24m: clock-osc-24m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		clock-output-names = "osc_24m";
> +	};
> +
> +	pci@bb800000 {
> +		compatible = "pci-host-ecam-generic";
> +		device_type = "pci";
> +		bus-range = <0 0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		#interrupt-cells = <1>;
> +		interrupt-map-mask = <0 0 0 7>;
> +		interrupt-map = <0 0 0 1 &gic GIC_SPI 74 IRQ_TYPE_EDGE_RISING>,
> +				<0 0 0 2 &gic GIC_SPI 75 IRQ_TYPE_EDGE_RISING>,
> +				<0 0 0 3 &gic GIC_SPI 76 IRQ_TYPE_EDGE_RISING>,
> +				<0 0 0 4 &gic GIC_SPI 77 IRQ_TYPE_EDGE_RISING>;
> +		reg = <0x0 0xbb800000 0x0 0x100000>;
> +		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
> +	};
> +
> +	soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x0 0x3e000000>;
> +
> +		aips3: bus@30800000 {
> +			compatible = "fsl,aips-bus", "simple-bus";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x30800000 0x30800000 0x400000>,
> +				 <0x8000000 0x8000000 0x10000000>;
> +
> +			uart4: serial@30a60000 {
> +				compatible = "fsl,imx8mm-uart", "fsl,imx6q-uart";
> +				reg = <0x30a60000 0x10000>;
> +				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
> +			usdhc3: mmc@30b60000 {
> +				compatible = "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
> +				reg = <0x30b60000 0x10000>;
> +				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +				clock-names = "ipg", "ahb", "per";
> +				fsl,tuning-start-tap = <20>;
> +				fsl,tuning-step= <2>;
> +				status = "disabled";
> +			};
> +		};
> +	};
> +};
> +
> +&uart4 {
> +	clocks = <&osc_24m>,
> +		<&osc_24m>;
> +	clock-names = "ipg", "per";
> +	/delete-property/ dmas;
> +	/delete-property/ dmas-names;
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	clocks = <&clk_dummy>,
> +		<&clk_266m>,
> +		<&clk_200m>;
> +	/delete-property/assigned-clocks;
> +	/delete-property/assigned-clock-rates;
> +	clock-names = "ipg", "ahb", "per";
> +	bus-width = <8>;
> +	non-removable;
> +	status = "okay";
> +};
> diff --git a/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts b/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
> new file mode 100644
> index 00000000..74fe9d7c
> --- /dev/null
> +++ b/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2020 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	model = "Freescale i.MX8MN EVK";
> +	compatible = "fsl,imx8mn-evk", "fsl,imx8mm";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial3 = &uart4;
> +		mmc2 = &usdhc3;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		A53_2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x2>;
> +			clock-latency = <61036>;
> +			next-level-cache = <&A53_L2>;
> +			enable-method = "psci";
> +			#cooling-cells = <2>;
> +		};
> +
> +		A53_3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x3>;
> +			clock-latency = <61036>;
> +			next-level-cache = <&A53_L2>;
> +			enable-method = "psci";
> +			#cooling-cells = <2>;
> +		};
> +
> +		A53_L2: l2-cache0 {
> +			compatible = "cache";
> +		};
> +	};
> +
> +	osc_24m: clock-osc-24m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		clock-output-names = "osc_24m";
> +	};
> +
> +	gic: interrupt-controller@38800000 {
> +		compatible = "arm,gic-v3";
> +		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */
> +		      <0x0 0x38880000 0 0xC0000>; /* GICR (RD_base + SGI_base) */
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent = <&gic>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Secure */
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Non-Secure */
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>; /* Hypervisor */
> +		clock-frequency = <8333333>;
> +	};
> +
> +	clk_dummy: clock@7 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +		clock-output-names = "clk_dummy";
> +	};
> +
> +	/* The clocks are configured by 1st OS */
> +	clk_200m: clock@8 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <200000000>;
> +		clock-output-names = "200m";
> +	};
> +	clk_266m: clock@9 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <266000000>;
> +		clock-output-names = "266m";
> +	};
> +	clk_80m: clock@10 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <80000000>;
> +		clock-output-names = "80m";
> +	};
> +
> +	pci@bb800000 {
> +		compatible = "pci-host-ecam-generic";
> +		device_type = "pci";
> +		bus-range = <0 0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		#interrupt-cells = <1>;
> +		interrupt-map-mask = <0 0 0 7>;
> +		interrupt-map = <0 0 0 1 &gic GIC_SPI 76 IRQ_TYPE_EDGE_RISING>;
> +		reg = <0x0 0xbb800000 0x0 0x100000>;
> +		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
> +	};
> +
> +	soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x0 0x3e000000>;
> +		dma-ranges = <0x40000000 0x0 0x40000000 0xc0000000>;
> +
> +		aips3: bus@30800000 {
> +			compatible = "fsl,imx8mq-aips-bus", "simple-bus";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x30800000 0x30800000 0x400000>,
> +				 <0x08000000 0x08000000 0x10000000>;
> +
> +			uart4: serial@30a60000 {
> +				compatible = "fsl,imx8mn-uart", "fsl,imx6q-uart";
> +				reg = <0x30a60000 0x10000>;
> +				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
> +			usdhc3: mmc@30b60000 {
> +				compatible = "fsl,imx8mn-usdhc", "fsl,imx8mm-usdhc";
> +				reg = <0x30b60000 0x10000>;
> +				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +				clock-names = "ipg", "ahb", "per";
> +				fsl,tuning-start-tap = <20>;
> +				fsl,tuning-step= <2>;
> +				bus-width = <4>;
> +				status = "disabled";
> +			};
> +		};
> +	};
> +};
> +
> +&uart4 {
> +	clocks = <&osc_24m>,
> +		<&osc_24m>;
> +	clock-names = "ipg", "per";
> +	/delete-property/ dmas;
> +	/delete-property/ dmas-names;
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	clocks = <&clk_dummy>,
> +		<&clk_266m>,
> +		<&clk_200m>;
> +	/delete-property/assigned-clocks;
> +	/delete-property/assigned-clock-rates;
> +	clock-names = "ipg", "ahb", "per";
> +	bus-width = <8>;
> +	non-removable;
> +	status = "okay";
> +};
> diff --git a/configs/arm64/dts/inmate-imx8mp-evk.dts b/configs/arm64/dts/inmate-imx8mp-evk.dts
> new file mode 100644
> index 00000000..2fb4bc74
> --- /dev/null
> +++ b/configs/arm64/dts/inmate-imx8mp-evk.dts
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2020 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	model = "Freescale i.MX8MP EVK";
> +	compatible = "fsl,imx8mp-evk", "fsl,imx8mp";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial3 = &uart4;
> +		mmc2 = &usdhc3;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		A53_2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x2>;
> +			clock-latency = <61036>; /* two CLK32 periods */
> +			next-level-cache = <&A53_L2>;
> +			enable-method = "psci";
> +			#cooling-cells = <2>;
> +		};
> +
> +		A53_3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x3>;
> +			clock-latency = <61036>; /* two CLK32 periods */
> +			next-level-cache = <&A53_L2>;
> +			enable-method = "psci";
> +			#cooling-cells = <2>;
> +		};
> +
> +		A53_L2: l2-cache0 {
> +			compatible = "cache";
> +		};
> +	};
> +
> +	gic: interrupt-controller@38800000 {
> +		compatible = "arm,gic-v3";
> +		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */
> +		      <0x0 0x38880000 0 0xC0000>; /* GICR (RD_base + SGI_base) */
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent = <&gic>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Secure */
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Non-Secure */
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>; /* Hypervisor */
> +		clock-frequency = <8333333>;
> +	};
> +
> +	clk_dummy: clock@7 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +		clock-output-names = "clk_dummy";
> +	};
> +
> +	/* The clocks are configured by 1st OS */
> +	clk_400m: clock@8 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <200000000>;
> +		clock-output-names = "200m";
> +	};
> +
> +	clk_266m: clock@9 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <266000000>;
> +		clock-output-names = "266m";
> +	};
> +
> +	osc_24m: clock@1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		clock-output-names = "osc_24m";
> +	};
> +
> +	pci@fd700000 {
> +		compatible = "pci-host-ecam-generic";
> +		device_type = "pci";
> +		bus-range = <0 0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		#interrupt-cells = <1>;
> +		interrupt-map-mask = <0 0 0 7>;
> +		interrupt-map = <0 0 0 1 &gic GIC_SPI 154 IRQ_TYPE_EDGE_RISING>,
> +				<0 0 0 2 &gic GIC_SPI 155 IRQ_TYPE_EDGE_RISING>,
> +				<0 0 0 3 &gic GIC_SPI 156 IRQ_TYPE_EDGE_RISING>,
> +				<0 0 0 4 &gic GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
> +		reg = <0x0 0xfd700000 0x0 0x100000>;
> +		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
> +	};
> +
> +	soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x0 0x3e000000>;
> +
> +		aips3: bus@30800000 {
> +			compatible = "simple-bus";
> +			reg = <0x30800000 0x400000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			uart4: serial@30a60000 {
> +				compatible = "fsl,imx8mp-uart", "fsl,imx6q-uart";
> +				reg = <0x30a60000 0x10000>;
> +				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
> +			usdhc3: mmc@30b60000 {
> +				compatible = "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
> +				reg = <0x30b60000 0x10000>;
> +				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +				fsl,tuning-start-tap = <20>;
> +				fsl,tuning-step= <2>;
> +				status = "disabled";
> +			};
> +		};
> +	};
> +};
> +
> +&uart4 {
> +	clocks = <&osc_24m>,
> +		<&osc_24m>;
> +	clock-names = "ipg", "per";
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	clocks = <&clk_dummy>,
> +		<&clk_266m>,
> +		<&clk_400m>;
> +	clock-names = "ipg", "ahb", "per";
> +	bus-width = <8>;
> +	non-removable;
> +	status = "okay";
> +};
> diff --git a/configs/arm64/dts/inmate-imx8mq-evk.dts b/configs/arm64/dts/inmate-imx8mq-evk.dts
> new file mode 100644
> index 00000000..8d620522
> --- /dev/null
> +++ b/configs/arm64/dts/inmate-imx8mq-evk.dts
> @@ -0,0 +1,175 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2020 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	model = "Freescale i.MX8MQ EVK";
> +	compatible = "fsl,imx8mq-evk", "fsl,imx8mq";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial1 = &uart2;
> +		mmc2 = &usdhc1;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		A53_2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x2>;
> +			clock-latency = <61036>; /* two CLK32 periods */
> +			next-level-cache = <&A53_L2>;
> +			enable-method = "psci";
> +			#cooling-cells = <2>;
> +		};
> +
> +		A53_3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x3>;
> +			clock-latency = <61036>; /* two CLK32 periods */
> +			next-level-cache = <&A53_L2>;
> +			enable-method = "psci";
> +			#cooling-cells = <2>;
> +		};
> +
> +		A53_L2: l2-cache0 {
> +			compatible = "cache";
> +		};
> +	};
> +
> +	osc_25m: clock-osc-25m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <25000000>;
> +		clock-output-names = "osc_25m";
> +	};
> +
> +	gic: interrupt-controller@38800000 {
> +		compatible = "arm,gic-v3";
> +		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */
> +		      <0x0 0x38880000 0 0xC0000>; /* GICR (RD_base + SGI_base) */
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent = <&gic>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Secure */
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Non-Secure */
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>; /* Hypervisor */
> +		clock-frequency = <8333333>;
> +	};
> +
> +	clk_dummy: clock@7 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +		clock-output-names = "clk_dummy";
> +	};
> +
> +	/* The clocks are configured by 1st OS */
> +	clk_400m: clock@8 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <400000000>;
> +		clock-output-names = "400m";
> +	};
> +	clk_266m: clock@9 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <266000000>;
> +		clock-output-names = "266m";
> +	};
> +	clk_80m: clock@10 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <80000000>;
> +		clock-output-names = "80m";
> +	};
> +
> +	pci@bfb00000 {
> +		compatible = "pci-host-ecam-generic";
> +		device_type = "pci";
> +		bus-range = <0 0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		#interrupt-cells = <1>;
> +		interrupt-map-mask = <0 0 0 7>;
> +		interrupt-map = <0 0 0 1 &gic GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
> +				<0 0 0 2 &gic GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
> +				<0 0 0 2 &gic GIC_SPI 53 IRQ_TYPE_EDGE_RISING>,
> +				<0 0 0 2 &gic GIC_SPI 54 IRQ_TYPE_EDGE_RISING>;
> +		reg = <0x0 0xbfb00000 0x0 0x100000>;
> +		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
> +	};
> +
> +	soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x0 0x3e000000>;
> +		dma-ranges = <0x40000000 0x0 0x40000000 0xc0000000>;
> +
> +		aips3: bus@30800000 {
> +			compatible = "fsl,imx8mq-aips-bus", "simple-bus";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x30800000 0x30800000 0x400000>,
> +				 <0x08000000 0x08000000 0x10000000>;
> +
> +			uart2: serial@30890000 {
> +				compatible = "fsl,imx8mq-uart",
> +						"fsl,imx6q-uart";
> +				reg = <0x30890000 0x10000>;
> +				interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
> +			usdhc1: mmc@30b40000 {
> +				compatible = "fsl,imx8mq-usdhc",
> +						"fsl,imx7d-usdhc";
> +				reg = <0x30b40000 0x10000>;
> +				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +				clock-names = "ipg", "ahb", "per";
> +				fsl,tuning-start-tap = <20>;
> +				fsl,tuning-step = <2>;
> +				status = "disabled";
> +			};
> +		};
> +	};
> +};
> +
> +&uart2 {
> +	clocks = <&osc_25m>,
> +		<&osc_25m>;
> +	clock-names = "ipg", "per";
> +	/delete-property/ dmas;
> +	/delete-property/ dmas-names;
> +	status = "okay";
> +};
> +
> +&usdhc1 {
> +	clocks = <&clk_dummy>,
> +		<&clk_266m>,
> +		<&clk_400m>;
> +	/delete-property/assigned-clocks;
> +	/delete-property/assigned-clock-rates;
> +	clock-names = "ipg", "ahb", "per";
> +	bus-width = <8>;
> +	non-removable;
> +	status = "okay";
> +};
> 

Thanks, applied!

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0ae284cc-662f-fd75-23a2-447c4c962a54%40siemens.com.
