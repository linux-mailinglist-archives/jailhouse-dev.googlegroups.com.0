Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBY4Z7KDQMGQE4VDRNQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAA73D5755
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Jul 2021 12:22:28 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id k20-20020a0565123d94b02903788300276esf3929568lfv.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Jul 2021 03:22:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627294947; cv=pass;
        d=google.com; s=arc-20160816;
        b=062x8+OlwsV85+9cVgVOF9SbHG00DxquvhyR2jKAKdtKZoGOw2bvEeZM1jtEzOjI7n
         +O7p0etNxjypuKrgm0tXIq41eqVsX+Nz1wBWG/4H3Kl/GZ00xkjwKh5kjeZ1cbPcB2CC
         wjSDD0Finh1z9Ie+ogLC64cdLxRJ+Y2CkdZXQRb00PSKfHc9uF3QtZAp4vL7I5VeFnsb
         ZOm/GPwfb9dUucPnnRy1REI91dABLOLSghpXpt79YtAoG1tablh7cGUVAFftABMuUZgr
         bysgzcbJVeUk+9GLmiqKvY4XgVph4Yix9xTkxBZaR6Xr0NHI3P5vpOphDv/4I/RCuNxN
         nxJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=EholjD/qJOarBBfn3g9EZNg/TI8kAWP2Z+zr5lUH89I=;
        b=Q+s90dfZwqFAcQSXcj2YoE/DpQSF8WNdmM3lyOAAde8CXmliMvfKweoLgAVJD5r5Nd
         g/L6R2e1O7tggrGSD/mOTQB202M4sjyLmJFQsHi2cge3LfbSLsv1csIfGb5sShI2Q7x/
         AgxPd8ya+XEEw5ysDBUhzc6aDddNZVXO0l5um7wL4lVHOqwpqjMg3Vmj0695V6IQJVru
         rtLSZ9j9IHoQIjofPechKsNsikMxdZb3szDL+P2yYv99oFP7yHvYtNzf7mmM4seykU9c
         1uSXgUqSUjLpMf62VJNT1zz3nUeJ4zD3A6aX68EocCynfigUm0LeUeXKMb1M8hRJ2MIK
         rsWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EholjD/qJOarBBfn3g9EZNg/TI8kAWP2Z+zr5lUH89I=;
        b=oaU/+shPUq6jiBEO0uDpMs4NF0eK5FVv1rzAqnpiR1U5i9rxRjlTv98PwpJq8OCxvh
         3idy6t4XDiI1/phbQ1mXygNXEfckYNqW2eE9IX/M0qjtroZpzyL85R3kVXRf6VWV+hXb
         zYSAjCTFbzqm5yhE2zWofp86+GeVtx0qe2r4LN7q9qECjMj+E4r65PjuAxIyO3T7afB+
         SXrwYmMnsBim+FeHLVoG3f5MY3t0kWwCqF8ZBBQrMx+dZbgm+A4mjV8PvjDekZuOjqv1
         shSm827tApEZU3G16zs32aMkhBev6Z1QAxtkCENkGFDZCfgU5kYKe74Umwk/8oOwC7rf
         /eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=EholjD/qJOarBBfn3g9EZNg/TI8kAWP2Z+zr5lUH89I=;
        b=eOW4f1eeuOz+LSIHPz6kUF/dqlPuoBVbDcc7vIg5ay1AY4QESS72xOs15bByehMgWU
         /J+Exml69Dv3YD5t1HdfCtKekEz5QJwMx8QSZZz34E+sV5hUc2xUYRFqQc0h3No8t5tj
         S2aKMEq1usRxrcymdFp/j11Of3C2z2+oGCErs/LJ970G0+ffdKkLQED4CiWRao1xMa5I
         vK1NL4hDny8P6Pb/cYopc+RTQaSnEaj0bRP6poHwl8Kbend/22vKnnZo/VI45XWt7om4
         /YMcTu7tWKS35eX0uAn5zpHOpXqOu3U3LGQRWozExr/CkOzx0nV6KHtBQd8INYir821K
         jmhA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533956U0j85CeKbkqfKQTJNCV0ABXFyxmn/RP49W041uxs7MVcNU
	qGlD6cqn3jbCo6EA1F8q0pE=
X-Google-Smtp-Source: ABdhPJzYvOVu1PXrqrwg2DfoqNLmpSarz8ok44qb8F2wzimCgwERXlWmghPWhVI5LqxXnuFemzr5Lw==
X-Received: by 2002:a05:6512:c13:: with SMTP id z19mr12316981lfu.10.1627294947783;
        Mon, 26 Jul 2021 03:22:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:b89:: with SMTP id b9ls5379lfv.1.gmail; Mon, 26 Jul
 2021 03:22:26 -0700 (PDT)
X-Received: by 2002:a05:6512:2214:: with SMTP id h20mr11983617lfu.389.1627294946610;
        Mon, 26 Jul 2021 03:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627294946; cv=none;
        d=google.com; s=arc-20160816;
        b=h+QmPJrG/AMIDABgsbZbeEO5lhK3ztcJIJL1uGq+2bgUZiynGr8ZHqO/tGrbRPRQib
         H8dqBqUtNdhJkyPe3/ji2KQVaSDLRGpC4En0hmhlLPoj0UXijseph21EsVWpQ4kA5kRW
         XeMcSagw213gVqE0EHiRmvif9KwyXC//3X/DJ4aDUYCbGoQrJv0ZGsxNiqsSdag/GzDh
         rPaQLpZyJaflLom2XRaXzIxPgrVctSonn7R/GBPmPUu6vSc1tzD7y0lcdHyeiJ6SMlUx
         QiccCb4f0+KbDQw03lXGtxmU1WMsw0PBkyVTJkyy+USy5cZzeBOsBXG90pU5fJb8NJqm
         a1Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=lnpJxGAPd5HCH4FtQ1qckO8xw+65EYNoPOk/gkABWzo=;
        b=Iqfego77PVQBkv1laEHZVHwlGt6FBJ0QzQbMGHeqC1gWYB74ZTixJtqt1FDfK0LX57
         /L4qQrMxzk1QwamtELsX9skESOS0XbJYgDxtlo2tGS3mNld++qn25xNF8lVZNxSxPWS4
         pwm3oYCZpnSDgJesWTCB8aWbVM2bt4ojYNkC+sRMElOCaAbPTaH4fuS07LOtlfzg6cfW
         lAPnG3Ye1eA1HpCXdmeqMp+ogZezHORrPMgRoSnMthZvpvaFaiGnO77ZXa03d18IB8PX
         DCUEkpAeOpcPVArptJHHSCRPr/BRCxPR1g3Qd2mfTIyexaFN6zZr9Sg9WA+VgLdTng3q
         mw5g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id q8si2038938ljg.4.2021.07.26.03.22.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Jul 2021 03:22:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 16QAMPk9007549
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jul 2021 12:22:25 +0200
Received: from [139.22.37.28] ([139.22.37.28])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16QAMOXX012770;
	Mon, 26 Jul 2021 12:22:25 +0200
Subject: Re: [PATCH] ARM64: Set the right set TCR.(I)PS value
To: Dongjiu Geng <gengdongjiu1@gmail.com>, jailhouse-dev@googlegroups.com
References: <20210726100546.30332-1-gengdongjiu1@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <07afe6db-18e4-8dce-a4f2-434bde1afe44@siemens.com>
Date: Mon, 26 Jul 2021 12:22:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726100546.30332-1-gengdongjiu1@gmail.com>
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

On 26.07.21 12:05, Dongjiu Geng wrote:
> According to spec, the {I}PS should be never larger
> than the CPU hardware implemented physical address
> size(ID_AA64MMFR0_EL1.PARange). Otherwise, it
> may lead to some unexpected issues.
> 
> we can refer to DDI0487G_a_armv8_arm's description below:
> If {I}PS is programmed to a value larger than the
> implemented PA size, then the PE behaves as if programmed
> with the implemented PA size, but software must not rely
> on this behavior. That is, the output address size is never
> largerthan the implemented PA size.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> ---
> DDI0487G_a_armv8_arm: Physical address size implementation options
> ID_AA64MMFR0_EL1.PARange Total  PA size PA address size
>         0000                     4GB    32 bits, PA[31:0]
>         0001                     64GB   36 bits, PA[35:0]
>         0010                     1TB    40 bits, PA[39:0]
>         0011                     4TB    42 bits, PA[41:0]
>         0100                     16TB   44 bits, PA[43:0]
>         0101                     256TB  48 bits, PA[47:0]
>         0110                     4PB    52 bits, PA[51:0]
> ---
>  hypervisor/arch/arm64/entry.S              | 14 +++++++++++++-
>  hypervisor/arch/arm64/include/asm/paging.h |  5 +++++
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> index 3f4ee871..99738f28 100644
> --- a/hypervisor/arch/arm64/entry.S
> +++ b/hypervisor/arch/arm64/entry.S
> @@ -388,6 +388,16 @@ el1_trap:
>  	isb
>  .endm
>  
> +/*
> + * set TCR.(I)PS to the highest supported ID_AA64MMFR0_EL1.PARange value
> + */
> +.macro tcr_compute_pa_size, tcr
> +	mrs     x9, id_aa64mmfr0_el1
> +	// Narrow PARange to fit the PS field in TCR_ELx
> +	ubfx    x9, x9, #ID_AA64MMFR0_PARANGE_SHIFT, #3
> +	bfi     \tcr, x9, #TCR_PS_SHIFT, #3
> +.endm
> +

Why a macro, why not inlined?

>  /*
>   * These are the default vectors. They are used on early startup and if no
>   * Spectre v2 mitigation is available.
> @@ -460,8 +470,10 @@ enable_mmu_el2:
>  	ldr	x1, =(T0SZ(48) | (TCR_RGN_WB_WA << TCR_IRGN0_SHIFT)	\
>  			       | (TCR_RGN_WB_WA << TCR_ORGN0_SHIFT)	\
>  			       | (TCR_INNER_SHAREABLE << TCR_SH0_SHIFT)	\
> -			       | (PARANGE_48B << TCR_PS_SHIFT)		\
>  			       | TCR_EL2_RES1)
> +
> +	tcr_compute_pa_size x1
> +

So this is aiming at devices that have less than 48 bits parange, right?
Did you stumble over such a hardware? Or is this rather about devices
having more than 48 bits? Sorry, still trying to understand the details.

>  	msr	tcr_el2, x1
>  
>  	msr	ttbr0_el2, x0
> diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/arch/arm64/include/asm/paging.h
> index 932dbb50..1b588aad 100644
> --- a/hypervisor/arch/arm64/include/asm/paging.h
> +++ b/hypervisor/arch/arm64/include/asm/paging.h
> @@ -144,6 +144,11 @@
>  				| S1_PTE_FLAG_NORMAL | PTE_INNER_SHAREABLE\
>  				| S1_PTE_ACCESS_EL0)
>  
> +/**
> + * Memory Model Feature Register 0
> + */
> +#define ID_AA64MMFR0_PARANGE_SHIFT	0
> +
>  /* Macros used by the core, only for the EL2 stage-1 mappings */
>  #define PAGE_FLAG_FRAMEBUFFER	S1_PTE_FLAG_DEVICE
>  #define PAGE_FLAG_DEVICE	S1_PTE_FLAG_DEVICE
> 

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/07afe6db-18e4-8dce-a4f2-434bde1afe44%40siemens.com.
