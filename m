Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBC5N2GBAMGQEEN4XV4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 793CA3416D3
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:45:16 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id u4sf17584139ljo.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 00:45:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616139916; cv=pass;
        d=google.com; s=arc-20160816;
        b=MZ/GwceTWYXpuJB6NzqKKb7TQTXIPCO73pPqlhoojWTCLPvjX/Um0YDBU5CNFZ9WAN
         jIIadh9KHe8BIAqjDYMr4LHz94mLZAi90jMOOs5nlwJpkEz3gBWxGsZxKsLuAQc0Nk01
         28fznAHUvZU+lCtcHYz2U27nXslfOIa+Ae5Q+djuc8QgRts17bcXuzyzDddcSQfSDz8e
         K+Eo9RuOKNMTL6ct4VHLxTN14MQgCyCXPbEHqlT9QsCAJ/UbWx0wbobIs977RUSstJbr
         Df4xAQwDxY91ixXsNiqb+4GC6bZPgbNttDkvgAcHFR9T2jcyL2mTO8HzhnYuzROcpA9M
         M6xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=WYmgT4x+34BMs4jOWtIBSNQXpwLvcLWktMrX6VncUjo=;
        b=CYbyeMsW6VA2YsPsEv8BSi1CeGSk7G6iyPvU6SbhLp+QksPS6ZhD6VuRmvueovotJT
         RTN1gm5zKexnMxUbfAPTkp5p4AfSVotnOeACuBDipEKZjgqGjN7/hw83LBIm2yGn3ZOC
         BFkufI3HRycJG3uviqRMO1WptMlzImBoF4gVTVUmFZwFV8KQEIS0qtRyknNvpFzukMRy
         WxLOiTek9XXNys9aFss/p8+jOCiU4sT1qKY6Vmvrz6j9rsC5d/lERnjUqTICnIL8a5IE
         E9QWMMzIw3xBpIrZwLy2vYs2ah04Dz4CxBRr8w3GztgbZOy2JS4QrpBgOxCyQXnDA1T8
         j4ug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WYmgT4x+34BMs4jOWtIBSNQXpwLvcLWktMrX6VncUjo=;
        b=mQO78uJ7a1tOCvx2Rj0U/4h+izAffkaKENYg9LbrN/VQKq0zcrX7lisx8GwaiPHZHf
         drIhDr3m1XLI98XgxERdXhhw/XuC/u/HhmoRIqN03s6+MukNEeJTv3jdNrdigmcVVNFr
         Hsn5CNJC0Lz+jHXrXlla5y0bwOAYwYF8pYcLNzY7y9qVELkaJcHLp4GZNWHsS/XT6Fiy
         vbGRjFkrtmgJaUA+H0DjnXaVgd0LJLzsaWZxm9SmlYj2V2zhuGwW0HdFFnRQkES0XIGz
         vywqGRenP05rgKm6TXujMKjrdN3jvOOah6qPLZX2RLMQDhbVM+5gSbBmjc3q3Eh109nL
         gx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WYmgT4x+34BMs4jOWtIBSNQXpwLvcLWktMrX6VncUjo=;
        b=LFCfCKs7WNFlSPEj9+SmeT7AwXY9cZW1MrjFaH6lxcQ/a2BELjuhqggn9pizyZ0ba8
         RkFJ7ZAvF/x+JVCqJnuGo6TEEivkaXjEAh56G9aPmWkiQO6OABMgMBVeG8CWzNbPPl66
         KoqC0oiRrhO85iUnmbeuUje+FAbaw/L7NhGMl86/yjrb1Q/GSJaDsF4olGBlVAniznox
         G6zewvZMC/FhhLpw1rCKqe1EvCRBYtElYZ0CMn7MtVr92KZKFRqV0fdekjCcKQSd8hn9
         XP4wdrzBC4X76yARD/uSN6Q8nsH6sFQnTIh+6jhYHdGu1MUh5HnE3vTff1XGP8hBmw7t
         6Gqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531WyAmQYzOTQotyuSNtFbKFeVJ4sS9oZbxy3v/nzOQxy+rW2w7H
	7RHNmSTeA8QsxOtWdmvE4xA=
X-Google-Smtp-Source: ABdhPJw5QWcaEuBs8Unluerduq36ZSV1IWBXyQljP5ZcGOEA6KA7FFhM/QV+j6VKBRd1tAWVvcQf8A==
X-Received: by 2002:a19:7fc3:: with SMTP id a186mr66300lfd.626.1616139915962;
        Fri, 19 Mar 2021 00:45:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:2050:: with SMTP id t16ls1024003ljo.4.gmail; Fri,
 19 Mar 2021 00:45:14 -0700 (PDT)
X-Received: by 2002:a2e:8881:: with SMTP id k1mr62885lji.441.1616139914800;
        Fri, 19 Mar 2021 00:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616139914; cv=none;
        d=google.com; s=arc-20160816;
        b=INdFwCHraZE793X0HIS6TFj1N5ppjvfKPqUt6/t4ejo6Fc5PHWpiNrsC8FfHSNy4x0
         gEX/jfHrwpwPk9UmWVngmAZTHEHUBquT95+YKLtst27eB76qf+7vWvrRyLhaHozhdhwa
         PGGePQBl/3u0ng69Sxu26o0qfq3N9HP0/uNOPbxaoo5mlZBHeADzizrS12Synog5F5uv
         H6gCtVuGsYMVDvxeAsKLUbO9bwekgAipLMBWXyRXXNjhHkpntiyACyiRUF4Zms1+d+fK
         GNcbzWCe/O9bfvqVHffhvtbzX0hWhdof2YeR6fqwMw6ubqgW2IolFtINUIkJTEPWVp8K
         9AfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=yR6DLWxyunUM8e0EWENpmqjB3EkdffMu78AMWPSbIRI=;
        b=cMCIFNDLoroFcoUWaixbpwVRvcgeheFM3qRDLyyd58kLimgmW0eVDYS9Vg75XYxfo7
         4M7ha/e/Zk0SbAEv9pGez+oelgZwnZiEJDbALdSECQ7DgY6Zue1puFkLV6RKImMBnxLj
         FvFIajj77SyfSo5JEKtVx3jKtmn3V4iW1Hp1aXHWKIc1C5ca477ruFdbaMjVeSTE5s+B
         37oFOAkV36+5B0elcdt2pMd2YZDxSE/g49MMnHg9jq1dvWMMQlKH9GxucJxm6OWcLXYZ
         0NY7u8r3D1/VxcM+6lMCGQaR0Vr3v0Gblc//Ez7RxLH1lbFDkk1JUBgKqf5Eo1/3NSLi
         zNuA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id c17si164446ljn.7.2021.03.19.00.45.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 00:45:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12J7jEb3030960
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Mar 2021 08:45:14 +0100
Received: from [167.87.41.130] ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12J7eDY0013426;
	Fri, 19 Mar 2021 08:40:13 +0100
Subject: Re: [PATCH v1] arm64: dts: imx8m: add pmu node
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com, Alice Guo <alice.guo@nxp.com>
References: <20210312102609.20392-1-alice.guo@oss.nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f430c0cb-52a7-7f36-a960-66840ad12110@siemens.com>
Date: Fri, 19 Mar 2021 08:40:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312102609.20392-1-alice.guo@oss.nxp.com>
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

On 12.03.21 11:26, Alice Guo (OSS) wrote:
> From: Alice Guo <alice.guo@nxp.com>
> 
> Adding pmu node supports to use perf tool to monitor the CPU performance
> of the inmate cell when enabling Jailhouse and running dual Linux OS.
> 

Is the PMU truly per core, i.e. exposing no information about other
cores or central resources and also not permitting any influence on
other cores?

Jan

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

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f430c0cb-52a7-7f36-a960-66840ad12110%40siemens.com.
