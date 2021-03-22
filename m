Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKF64SBAMGQERNJ77MQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0DD34528E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 23:50:17 +0100 (CET)
Received: by mail-ed1-x53e.google.com with SMTP id a2sf214490edx.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 15:50:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616453417; cv=pass;
        d=google.com; s=arc-20160816;
        b=Hqa3N9jGT403bMu+bDUoXePfZ3ds+LMolxbV4XqCl4BK5gTcEhYbh31Fua8VV863wL
         lDdZuZLkfFV5xG043QLXqJgEe+qHs89CqRcB6CTBpyhvT2h6S8J6WlboGPG3U8dnwUqS
         +alNSpBqv4JFqJ8Bhej1Zdbnwj6QSyiX91pnNH54FZigZS/au4OW0lCRT6owAKl3lp14
         qRtgD5cgrZ1zxcV3b4wiuXQtXGzH1anrE5DMVpH/yrGaIXTnzf1owN0yUGClgz3uDAzg
         kGeKHzp9VH7/RnhU63Zl/n7F8p7Y6xZylSPEI4ktFwZqeMQ6Sl4o1b4iTSi80G46HCYJ
         AQRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=VxyvM+7xGKHoSmsSdmSzKwuBz2CQxLlBDOmdUfL32t0=;
        b=lys9pRfRDtPAiydJS1AcSqHzKZE9O/Di/hYjiTVCfzNSQdcj9xnRUJKnDFS3kRvXSK
         mXB+dg5Kw6fJoTvTl+MYmP1uXwHzplDXdEF0Snq1kwQ+B87rmwwLnSzApmnatBmcpdwQ
         Fs35CFGd7rECbFz8HAQ+ntrG7IMFqgbEGHWoSnh1nCi3DXqUnjTJaaM5CAUAOuZaV42Z
         jshdkOpolmovKsJFHUfS6LFRXAvaGjE5zdReOH6TMjPdJHAR/0+GLgE41YoznVWiiWtI
         UYhAcm91unhnlqXLA3PIi99/2C26qdq0PGExpwqQCM6OoL4K0oExT2twmEfzfglXOHcM
         n1iA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VxyvM+7xGKHoSmsSdmSzKwuBz2CQxLlBDOmdUfL32t0=;
        b=h3ZPbch9ri9bE2sRU0culbt6VWOXomDw35yAwLVTDRS6PkL3VS1yHyIepxFoAzMQHU
         XxQKWYpfnUnciyj9I5G5I/hL7pPAlwbJFksZeon671y8Pgoj1+qg319MovIDsWgims5J
         X/v3EY7fbX+CcjjiKpo/YSfXbY5/GJnuRVjoyWMcOXZUxKHF/WFT0YniPd1JynLSFLbQ
         CZkSFyq3iOfsmtvvXilVgSUhlb7w9OaL9fPdsvx1uPzqlcmd5Z7wvtEj9bYQRx248QE5
         f+VLLhXk9phAAObnQG1IlD4ViwVVOfx0FWI3RzDVnutcJCuJJG4EJGZyYXHmzPJiOcuO
         J7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=VxyvM+7xGKHoSmsSdmSzKwuBz2CQxLlBDOmdUfL32t0=;
        b=sg8pBgNw8haXkgCAwoi7620ZA4nbmP5h0dKqVnG2Az45XVSQ1qXA0D7mRDgNy5AEUr
         +zJQ+eVCixmqsPZ/5hGXjDSzy2Wu1nvk9mVnIf5kgfRjrhF1PIjYCx0yqhInG3VDrkn8
         TFLC6Ltg+20VNV92EioD+n3nKPvp7P7kUZ8sT7Q9D6jQZZxLwx3qKWPVRuj6edU9htZA
         PYERqkrchSEga8rr7NNovtciAH5AYHDmOf7PqjiI5L1/bzwzXXfzCDxWmqtH1k+de1rM
         uf2vzRtdeNbav49uoi3qZea0A8gtdk2ibd8RblqG6hwNQs3gNKakRxJ+w8V7Gi65ADdr
         Lbaw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531q08TxIwG1uSBCggc7T9MKyUxusRpPOXz8oeSnWJHsDrVHjahs
	DhNQsmU1Db9QWbgC79C2YtU=
X-Google-Smtp-Source: ABdhPJwalf3/E2aLTAdi4CI7rty5/j5J2TDG3RuWn/TBoe9dgPWutZUKqauDu9X6KNI9XWofmE10tA==
X-Received: by 2002:a17:906:229b:: with SMTP id p27mr1989365eja.287.1616453416961;
        Mon, 22 Mar 2021 15:50:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:d06:: with SMTP id gn6ls8078223ejc.0.gmail; Mon, 22
 Mar 2021 15:50:15 -0700 (PDT)
X-Received: by 2002:a17:906:2dda:: with SMTP id h26mr1932016eji.163.1616453415824;
        Mon, 22 Mar 2021 15:50:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616453415; cv=none;
        d=google.com; s=arc-20160816;
        b=bny8EYU3BbZKNyP2zq7wLXnF2P1xuD8ev4jH5S6GGPab7R0+jHoBSUjOvEY6bSE3Os
         iZfW3J0V6Sc3FKa011/5iaahtI8A9UA67eD8PaGlN7KPIW/6cH3uKbYGqLePOz38oG/V
         dsLSvYLsM+ncQj6I/HumKPZpAJlBWL02oL3E/P+V6KY0UKeRW2jBkwj1tEp3/BbktP0K
         L1Pr6fZktyfF8teudH0KWRk+YqX4dTiTyGLeTIv/gsPXg5JB4oKJAJ0wVEPp99G6eWh9
         Nx3TEgMIkrM5ylpbhSnNvpd68ixRN8nwEbBLRr+r56fZfhQbDGKbj7Yuf1yNBS3/OSHC
         7ojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=0rLevpfoGtiBPRlB6EYVtNiqyYB/+TISsAm6w8vtjBQ=;
        b=OzDzEAK39e6nCsLt3kS82WIkqLAxe88J4GRUSXyKS5v0s5TelahuLOnyTdw5aez6ND
         fWek1nF8Nt94xmNFvlMgHfxRoCVCY1OJS4Y/HgIYnX6g6oZDECqgXZrUMCl3xNW035lX
         xqGf4Cudlk50S+Vf8rjxeajutaJCFMKUEk43ta/f4GWtEln5mJJmqYnLrEs9T4azqD0S
         ELbQSCKvYyJL/VgyPc6maUCB2gsjKV3waN20M71e611Gj1ReozjwdRjX1QVC+twhNw3T
         Qp9mBbdax71s3sVb7N6eGSCC76dSqxxTzG5PKRsdFNS/fVBlnXfFZE9DAdDE77wMOAYT
         lzJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id r21si670869ejo.0.2021.03.22.15.50.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Mar 2021 15:50:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12MMoFNv008499
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Mar 2021 23:50:15 +0100
Received: from [167.87.240.35] ([167.87.240.35])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12MMoEI1030179;
	Mon, 22 Mar 2021 23:50:15 +0100
Subject: Re: [PATCH v1] arm64: dts: imx8m: add pmu node
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com, Alice Guo <alice.guo@nxp.com>
References: <20210312102609.20392-1-alice.guo@oss.nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <464f28b9-b816-859c-df8d-e339ea7e99ec@siemens.com>
Date: Mon, 22 Mar 2021 23:50:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312102609.20392-1-alice.guo@oss.nxp.com>
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

On 12.03.21 11:26, Alice Guo (OSS) wrote:
> From: Alice Guo <alice.guo@nxp.com>
> 
> Adding pmu node supports to use perf tool to monitor the CPU performance
> of the inmate cell when enabling Jailhouse and running dual Linux OS.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>  configs/arm64/dts/inmate-imx8mm-evk.dts      | 7 +++++++
>  configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts | 8 ++++++++
>  configs/arm64/dts/inmate-imx8mp-evk.dts      | 8 ++++++++
>  configs/arm64/dts/inmate-imx8mq-evk.dts      | 7 +++++++
>  4 files changed, 30 insertions(+)
> 
> diff --git a/configs/arm64/dts/inmate-imx8mm-evk.dts b/configs/arm64/dts/inmate-imx8mm-evk.dts
> index f7c21b10..591c3543 100644
> --- a/configs/arm64/dts/inmate-imx8mm-evk.dts
> +++ b/configs/arm64/dts/inmate-imx8mm-evk.dts
> @@ -48,6 +48,13 @@
>  		};
>  	};
>  
> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_PPI 7
> +				(GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
> +		interrupt-affinity = <&A53_2>, <&A53_3>;
> +	};
> +
>  	gic: interrupt-controller@38800000 {
>  		compatible = "arm,gic-v3";
>  		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */
> diff --git a/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts b/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
> index 74fe9d7c..e5a87d03 100644
> --- a/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
> +++ b/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
> @@ -48,6 +48,14 @@
>  		};
>  	};
>  
> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 7
> +				(GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
> +		interrupt-affinity = <&A53_2>, <&A53_3>;
> +	};
> +
>  	osc_24m: clock-osc-24m {
>  		compatible = "fixed-clock";
>  		#clock-cells = <0>;
> diff --git a/configs/arm64/dts/inmate-imx8mp-evk.dts b/configs/arm64/dts/inmate-imx8mp-evk.dts
> index 2fb4bc74..b4068771 100644
> --- a/configs/arm64/dts/inmate-imx8mp-evk.dts
> +++ b/configs/arm64/dts/inmate-imx8mp-evk.dts
> @@ -48,6 +48,14 @@
>  		};
>  	};
>  
> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 7
> +				(GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
> +		interrupt-affinity = <&A53_2>, <&A53_3>;
> +	};
> +
>  	gic: interrupt-controller@38800000 {
>  		compatible = "arm,gic-v3";
>  		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */
> diff --git a/configs/arm64/dts/inmate-imx8mq-evk.dts b/configs/arm64/dts/inmate-imx8mq-evk.dts
> index 8d620522..45b42c94 100644
> --- a/configs/arm64/dts/inmate-imx8mq-evk.dts
> +++ b/configs/arm64/dts/inmate-imx8mq-evk.dts
> @@ -48,6 +48,13 @@
>  		};
>  	};
>  
> +	pmu {
> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent = <&gic>;
> +		interrupt-affinity = <&A53_2>, <&A53_3>;
> +	};
> +
>  	osc_25m: clock-osc-25m {
>  		compatible = "fixed-clock";
>  		#clock-cells = <0>;
> 

Thanks, applied.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/464f28b9-b816-859c-df8d-e339ea7e99ec%40siemens.com.
