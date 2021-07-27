Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTNIQGEAMGQEUNEVUBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 613F83D7DE7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Jul 2021 20:45:34 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id k19-20020a05651239d3b029036be88ae752sf6045755lfu.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Jul 2021 11:45:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627411534; cv=pass;
        d=google.com; s=arc-20160816;
        b=f5Y0oRJLHMQBKC6NHzH85+Y/mRm8Q+zFCBnVfpUbpCm9pU78Z6jlbgpqkB1Nt9Zd1A
         Oy1X102FDpvKGWfsbiEpl7LBWFinFSvMQVWOvKFoWBXAbBcdnzBJmfYfgOhYogsDRv1G
         pjHrD8kY8V0Rg+EQ24Wc3q/OFsNbgeTBFl0Ry/cQwHtb7D5yswauLd+n8kgsfQHLPCBX
         fF+d4JybfxzNF0ZaEIKqOBJXpqTLIMB8VjAVMk6+Ufzf13Tsf0/ghkb4E6pMxTr5ym0n
         Of8CAJSH5yxrseA5sTGBKpaWGPS696GtMOFbyFYfsrOnCY+MW2pAfOgEGREDVy6NBwDh
         6t7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=PSIxlyiEjAV7dbXS7EDDszvl20XNjCcVPobFhOGJuRw=;
        b=UMJWaiOQrSKbUQCgcjj42nB0B5S//N45iBES64ETZPbr0BUbB5xTrR9VHJVNsa/mY8
         p66AwnAdzF9otI3pXPwTE1kcwia2XjpHtl4pFvAEiagBYi0aplqNG1hD09JlT+8dNObc
         TFzJjk8TMNrqnPRdJ8BY+2qI0lsLQpPHyXLzj2sGTeDEzXNO9pLG76SGmx1/aTSrkJk8
         FMKLdz2BAHsKp31NyapO6V8vr3/ruGF5ewwABXIBir1jnQpjKURVoIWTCY/XsYFw2xbo
         4CdHUaFsPG+AGvGtXqKVRnVXIyqtOCIo7qaf8bKaW6empT7VvzTs1vWQFKDQAch620PN
         ZWwg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PSIxlyiEjAV7dbXS7EDDszvl20XNjCcVPobFhOGJuRw=;
        b=XHEEvIeduZ4P7s5Ae/n6cGUyOl32Wh008gao8fY3n/pXa6tri4zEi5Yh5R37qi9q6Y
         Rkuq6Wh+aAl7pZ7TT25viSbzwr49onnFmH7PA/UJktxgddi+reAdJezEaD38JPp+mE4L
         M/PdkfWTm4hWyR9xnBNAHELadL7dP/Nc9n+C0MY6jP4Wok5DMYYK87QtrRYyAUSjPkwK
         Z81jFFe7HpKXHImLVs9z4TdlmKO+uc9479V9gLxdswp+ioENolmwtS7iENHamoetzpmF
         Payb9OyJEt1S+J72O6k421KhZypC0PEjjlZBiEP1wT07Qo1dUKGWCV4E/Q4FCfPqHrCV
         Uikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=PSIxlyiEjAV7dbXS7EDDszvl20XNjCcVPobFhOGJuRw=;
        b=KGCqkZD2g9W064vwt2tIPXkG4Rk68Ybx08LONnB26zQRzHSCsovQIYo1qawj0ZLUgv
         DzI6xlLvT9YDo6ezgd5Kfd9EcKevnm0CGv9xXNqK9swpuwh2hNFMhS4dj1KMLm8zqA+U
         3YFBBH773R2YNA2pwmHQZRocwz0J2BSOugdePjbw+OKhJTsD7Li0wA6mrIOIFPtG6/G7
         jqnx27CRi4gkPX7mygJIXdAdN34/5ycSkB9i9j+59d2BTrWbtd4samil4H50Nzb5QdHt
         /ZUpLDZlhal/pH/crattR7GAwMvTb0toWQjgJx5Au9ZIP9/dH95w2MPwGbQ+j+KNNdEC
         x5Fw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531TFDve/ozNGK7b25sYDrXaCuZPM00ro/NX9qHxfE87S2Jcvcsz
	+pR244JmVGE6a4jjF7I8wd4=
X-Google-Smtp-Source: ABdhPJxYnwGS2fTA7kTnP5QMvMl8IAxRJjefpIrL5LL5FdXK2KLBYmeoWqdSWt9YUqVNZmYVFh/e2w==
X-Received: by 2002:a19:9109:: with SMTP id t9mr9750011lfd.486.1627411533916;
        Tue, 27 Jul 2021 11:45:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:36c2:: with SMTP id e2ls1007319lfs.3.gmail; Tue, 27
 Jul 2021 11:45:32 -0700 (PDT)
X-Received: by 2002:a19:c110:: with SMTP id r16mr16931509lff.438.1627411532777;
        Tue, 27 Jul 2021 11:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627411532; cv=none;
        d=google.com; s=arc-20160816;
        b=WL9Wov0WUY8EvqwRtO7OLPuU1twA3NW06E5mzULK8cCPG2/WNaMP1/OjiWUm0kHCn2
         a1+UaZU2gnuMWodTMqTmOazg2X3Dkb6b7X7CKdn1kAm+IKmLWBCHF0pT6cT0eWVmNwD2
         Ix819V3xEJag5QZuh8s+unkuqh8LAXfjhYbbzZlkB7jYZ4hjvPTYdLnuWvWk0TdQltQ9
         miwgSsLA3FggC77YfuKGIfnX0AsLqVjm8lvgj8+s5/08Mkpc98H7qDU/vOBJM+8aFGpl
         i14JKkqV3zxYa4Zt26mg3qMtJXekVZYtk6/I8KPycNVnVufqEi5exNLpko9H+g4MlLMK
         Gu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=AiK7mhRJqXH8TNtzdzwoqhu6MXOcgcRrdCc4bSdtWwM=;
        b=EbY223pH8u8rsMmsbPmndXPnh/UgXcHkon0ftokeI4Bc503KUUOo8LBUUhPh6f+KFx
         0yfoicfIRhOIbkTqD7mHn4QQJJf1p+5ND8910bmAZqxw7jrk1akzA2tZ9JWlUNgQ2Kgd
         C+8u5RaGiOMAQqc/6UVeukyh15Va/HCCU4LtpsyQWPa54Ne7gO5tvpuaRi/4o9QVbAQy
         8hKxMcifp/XDg+HCZImh0b2XmjezBbf4XxfhidE13Gql+CpO0kYMJJtHmlu+O0jleDgB
         Y8hEeIArz2PHIc0JA+h7MO+/SUVeGGEFICvfIWAp4IrYXgTb0paKU7UOXqjwL88bc31r
         1JLw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id d6si152093lfk.4.2021.07.27.11.45.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jul 2021 11:45:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 16RIjVQi011307
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jul 2021 20:45:31 +0200
Received: from [167.87.33.191] ([167.87.33.191])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16RIjVLG008330;
	Tue, 27 Jul 2021 20:45:31 +0200
Subject: Re: [PATCH v2] ARM64: Set the right set TCR.(I)PS value
To: Dongjiu Geng <gengdongjiu1@gmail.com>, jailhouse-dev@googlegroups.com
References: <20210727111857.16710-1-gengdongjiu1@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c9e71a72-510d-aa87-2734-221b692c669c@siemens.com>
Date: Tue, 27 Jul 2021 20:45:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210727111857.16710-1-gengdongjiu1@gmail.com>
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

On 27.07.21 13:18, Dongjiu Geng wrote:
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
>  hypervisor/arch/arm64/entry.S              | 10 +++++++++-
>  hypervisor/arch/arm64/include/asm/paging.h |  5 +++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> index 3f4ee871..3183088a 100644
> --- a/hypervisor/arch/arm64/entry.S
> +++ b/hypervisor/arch/arm64/entry.S
> @@ -460,8 +460,16 @@ enable_mmu_el2:
>  	ldr	x1, =(T0SZ(48) | (TCR_RGN_WB_WA << TCR_IRGN0_SHIFT)	\
>  			       | (TCR_RGN_WB_WA << TCR_ORGN0_SHIFT)	\
>  			       | (TCR_INNER_SHAREABLE << TCR_SH0_SHIFT)	\
> -			       | (PARANGE_48B << TCR_PS_SHIFT)		\
>  			       | TCR_EL2_RES1)
> +
> +	/*
> +	 * set TCR.(I)PS to the highest supported ID_AA64MMFR0_EL1.PARange value
> +	 */
> +	mrs     x9, id_aa64mmfr0_el1
> +	// Narrow PARange to fit the PS field in TCR_ELx
> +	ubfx    x9, x9, #ID_AA64MMFR0_PARANGE_SHIFT, #3
> +	bfi     x1, x9, #TCR_PS_SHIFT, #3
> +
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

thanks, applied to next, only adjusted comment style a bit.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c9e71a72-510d-aa87-2734-221b692c669c%40siemens.com.
