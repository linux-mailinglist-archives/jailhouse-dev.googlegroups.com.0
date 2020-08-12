Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVMWZ74QKGQELHYAYRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A65242879
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 12:58:30 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id l15sf164352lji.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 03:58:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597229910; cv=pass;
        d=google.com; s=arc-20160816;
        b=W0zsfY27X4G7xfqKqkm0NzO2gJ7xHa4bN+/poz5fpMn4BbVhP/ZIh04Lx4D/qhTLtz
         yw2ArW1A2L5D8wTQU355P1PJ3E7B5l3INNeRtiAxJrXNt7z+krmPglUAvZDMDu4vvdT9
         7denolxbpIORi6AwyEG5VMi4Oy5X0I7+nZBgV38/JH+leYHd+8ry/hyUuHb3ErRj9IL7
         m4PeQlsrVZ5sKIYVKFJgXwM6EeAYTWFPRBMf4ikyMaOUeknVgGsXwYMEM/R9SUB1d1AA
         go97bJsmD9ZrzBcS844yHJPc7OUR3UwdkCY371I/2PqSHcMANAl9ZuGuTuglCc3sJF3r
         Tu/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=OOaKXnY7dbNB00m94Fouehyqba7BkZR0YAWSw8BZsPc=;
        b=flaja/3MvA618QMGGg0fLXRDO0q0z2HGec4aoTXhf71pH5zlPUKGP5mpsytxSFJziI
         7nr+yf182Pa6v/7d+9MMQYZOdRRI2zpG7XvkjW2GjcxECH5lJJQM072dOi8iCC5xXD8f
         jlSHiuBPL3ZoChzT+YSTY78mdOCezYAvqdCALVw2ulShLH1Khcq0f08vjU6qEW9u86GG
         oAZ6ODLa+3TF4HQigF2xHVgKcDuEK57QmyZqyWMj1fH7QeOFoq81wLZsHS9nCq8xpLA7
         zRfMRkpNUh6oEW21AzBvIxzypIvBaWAj6qAoZKm+tSccEgPZA0W1uLQ4oWfmU09gjxsc
         s2GA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OOaKXnY7dbNB00m94Fouehyqba7BkZR0YAWSw8BZsPc=;
        b=Xhcn/nMLs1V6Qmdc3YsnyoITa21QwJBC+UbIBdP3s5nWnnkQiywBoBbUpAOtYgJ1aX
         oeiE6KEQ96cks59bpxsv2M0ABGN7SFcfa1DICYwdpgK+am12hsqJL+Kse7P/1K0ASd22
         0FMAE1DseEwRGhBJspT65oGPcfAu6mKaF4SjHQPGt6xATv5W5Ejgarxosj9FCTrdhLg6
         BlVzRfiM9wTnEkRJuSp7imXuUCDNdh0PXshMceUgJJHUV8plo0KB+1dEuCd8sYd8uZkD
         4e6FKp4dVMnRHCjExluUYfd1KrsbOcofstShJxtqYZeb/tp5LTNlLp6Olm2nkuqimzXU
         ojjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OOaKXnY7dbNB00m94Fouehyqba7BkZR0YAWSw8BZsPc=;
        b=FRcGA93JyJr3VfVMH8e8FhrJvJphJTN1stdPnrRZqe29AvEe7ew1UuYKafuUsjvDPv
         CluMge2FrOF8xbPFGiduYqs61r+JiQO1BPYhWsIUbQC/sj2d5hbg6YKqNXh90JyIZnyU
         xhpzTOE74c+QTTFVnu/TWC6NvRWVdqTqbbuzVVsIH4kDVF+u0lucSRwr/h5d1wTlX004
         lDlQOx11fkDKT+jc8zsBhv4WxPFJKvebvUFcs7imYizjIddsbKJSOs54Cvap8MtkFPFf
         LOkCjLC6Nqwm7CINT8HRU8Z7NuRL20QOBqlYmU+xgg+isjen3bACVx0Zm0DjP3KRUDfK
         vopg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53319ZQIlbfiHW8sxPYu8ZjyEgXc14F3Kr/rLY7U8JjwDEyag7zj
	mAdPu+n09/owgiMr518H/do=
X-Google-Smtp-Source: ABdhPJwhpcLfh1bodzFYDI35QejBUS+H/09XT2Q/PoViMX5/Ac+i+ZX0o1lEbByffCjxdHDOPwhoTw==
X-Received: by 2002:a2e:8510:: with SMTP id j16mr4897503lji.196.1597229910099;
        Wed, 12 Aug 2020 03:58:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a172:: with SMTP id u18ls313171ljl.7.gmail; Wed, 12 Aug
 2020 03:58:29 -0700 (PDT)
X-Received: by 2002:a2e:9396:: with SMTP id g22mr5502850ljh.446.1597229909270;
        Wed, 12 Aug 2020 03:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597229909; cv=none;
        d=google.com; s=arc-20160816;
        b=R7ddHIdQrbjIbC6+wgPUYKBNwIXd9Nme4XceYWXC2ocHCqJniY3lwLVWwlEfo8SJzB
         /2bXuGPIKJnk2ma2Y97Otrb1MZVrUQLFmsMmNWKvge3zp43aYAlUSAO84fwefOIwKL1D
         mDQvVX9SR1jLtdjFBoXGWbJyZ7fzANAIKE7h4Cw374gVg7IX2J7J/dphejwpykbOWl59
         iU4KzjqzostLlJ8t0mioEZF4VjTUf9eRKmKvkBAqPPZtpAVlH+Df7xeADdLJurHLfAEm
         wuRtHqNHLd/k1lL/J55JKUvuiNraG4niYGHN+trN+LTGeBICujqCpMK3uFjIIO7dGIAp
         d9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=iAdURd/l0xbeTlXue2W9bpOoDH8syXO7liXGd0bJGEM=;
        b=RPeFD4fpzQw/F6HWrGWNLtaRRfkclzuYWdVYaXD/8ioUnJtRRH8WcSJoKACXRBQdGD
         z1Z2nIPTeFYG/mthr97Ms3bF7QuQVu4BPn/deswNYLyE59eeBwzSBbiokM+V4pLyKI6O
         MfeNAPGPJQoO354Nd5PJ9fjnIZnjwhQYMDK7y08Qhm23EadWKpdlE1m360JALWAqoIYq
         P4sY3qkdpfjdkSp7SDgtXoVgC2k5mxocl7fi/LtVNxVDjWKB/KAahsaXsU/b1IPj4S90
         2sxh1CQ37b87RY1E9gUbZJIjGbbYi66Lk0gyOIb+UQ/7vLp6xYt18UNLrvMPTdbHK3NW
         Am8w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z26si97834lfe.5.2020.08.12.03.58.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Aug 2020 03:58:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 07CAwSsK032221
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2020 12:58:28 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07CAwSKk007971;
	Wed, 12 Aug 2020 12:58:28 +0200
Subject: Re: [PATCH V1 3/5] arm-common: gic-v3: solve incompatibility problems
 in gic_v3_init()
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200811181641.7282-1-alice.guo@nxp.com>
 <20200811181641.7282-3-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0316b236-5b86-7fe9-90b1-9fa10d1803a9@siemens.com>
Date: Wed, 12 Aug 2020 12:58:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200811181641.7282-3-alice.guo@nxp.com>
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

On 11.08.20 20:16, Alice Guo wrote:
> When the inmate cell is in AArch32 execution state, using mmio_read64()
> to obtain the value of GICR_TYPER will cause error because mmio_read64()
> generates "ldrd" instruction when compiling 32-bit gic_demo.bin, and
> "ldrd" belongs to A64 assembly language which is cannot be used in
> AArch32. So use mmio_read32() to read 64-bit GICR_ TYPER in twice and
> add processing case for reading the higher 32 bits of GICR_ TYPER in
> gicv3_handle_redist_access().
> 
> In ARMv8-A, AArch64 state supports four levels of affinity. but AArch32
> state can only support three levels of affinity. So set bit[31:24] of
> mpidr to be 0 for AArch32, without affecting AArch64 because
> "MPIDR_AFFINITY_LEVEL" used in AArch32 and AArch64 is different.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>   hypervisor/arch/arm-common/gic-v3.c | 3 +++
>   inmates/lib/arm-common/gic-v3.c     | 4 +++-
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
> index 6a1d90f8..584c2c79 100644
> --- a/hypervisor/arch/arm-common/gic-v3.c
> +++ b/hypervisor/arch/arm-common/gic-v3.c
> @@ -351,6 +351,9 @@ static enum mmio_result gicv3_handle_redist_access(void *arg,
>   		if (cpu_public->cpu_id == last_gicr)
>   				mmio->value |= GICR_TYPER_Last;
>   		return MMIO_HANDLED;
> +	case GICR_TYPER + 4:
> +		mmio_perform_access(cpu_public->gicr.base, mmio);
> +		return MMIO_HANDLED;
>   	case GICR_IIDR:
>   	case 0xffd0 ... 0xfffc: /* ID registers */
>   		/*

Let's split hypervisor and inmate changes.

> diff --git a/inmates/lib/arm-common/gic-v3.c b/inmates/lib/arm-common/gic-v3.c
> index 35ee9a6a..12978ea5 100644
> --- a/inmates/lib/arm-common/gic-v3.c
> +++ b/inmates/lib/arm-common/gic-v3.c
> @@ -76,6 +76,7 @@ static int gic_v3_init(void)
>   	map_range(redist_addr, PAGE_SIZE, MAP_UNCACHED);
>   
>   	arm_read_sysreg(MPIDR, mpidr);
> +	mpidr &= ~(0xFF << 24);

I do net get yet how that is NOT affecting AARCH64. It comes before 
MPIDR_AFFINITY_LEVEL usage below.

Why not using some arch-defined MPIDR_CPUID_MASK to ensure the correct 
masking?

>   	aff = (MPIDR_AFFINITY_LEVEL(mpidr, 3) << 24 |
>   		MPIDR_AFFINITY_LEVEL(mpidr, 2) << 16 |
>   		MPIDR_AFFINITY_LEVEL(mpidr, 1) << 8 |
> @@ -87,7 +88,8 @@ static int gic_v3_init(void)
>   		if (GICR_PIDR2_ARCH(pidr) != 3)
>   			break;
>   
> -		typer = mmio_read64(redist_addr + GICR_TYPER);
> +		typer = mmio_read32(redist_addr + GICR_TYPER);
> +		typer |= (u64)mmio_read32(redist_addr + GICR_TYPER + 4) << 32;
>   		if ((typer >> 32) == aff) {
>   			gicr = redist_addr;
>   			break;
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0316b236-5b86-7fe9-90b1-9fa10d1803a9%40siemens.com.
