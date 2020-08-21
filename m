Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBL667X4QKGQETBOLUKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 906F224CE47
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Aug 2020 08:52:32 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id c16sf382686edt.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 23:52:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597992752; cv=pass;
        d=google.com; s=arc-20160816;
        b=lOx2NVY5DP//PR8LFG/51s9OcmQyItNTVoJyHSzdzKJPmBuL5TowDdi+6L30Qw7aQI
         VWfWjZaP3jVzIn72w0768z9aW4rtIgpBWMY5iiPJKphxvb5ZxG0lEKZKqpNHEwOztmI4
         3ihdkjn493+LoeO680hS1Xv+POHOpkI4Rg2hivZdQmv6kp3r0vc9g32CGIozmJwYvA3F
         0KtHTRkw2sibU/JAptIABH3Aq7Gad7qIazheTVsz9eSjWXzaYnBdgdHw5OrJDU6Pz2+n
         Ynw4GRE569P/l1nr9+iP9up2kRX+DRLB3A1zE9TD5Oa+0vRtg5B0h3SYXJG9DGWKIens
         weAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=bk7h/Bmt0bNBLSUgek9hDyJg1GZIJRXbEB31PyIWFFs=;
        b=GO7NUBwVbdLsYka5lmvEB/TP9YCfwsGJebVg9bKL0oe/hxSlG+un55KYLF19Wi22yU
         lIsm41QYvsu8dhrr0gM4J/sfN0eQsbPfiKuoMmbzuW7OuBH3uQlESQxRZ3KIptOGMbCl
         DXiLAcb/2ju2ks/Akes+RXfFJJH5nBykUBB1bAxBtiTmzRFwTSI6o8d5J11N/bLobxjo
         pkwJUPzzvWbVn1cY6QQS6mMUeTXXR7PM8fdkPpY53jbAk8iqfVOEivaoBlk33QprjCXM
         WqDvghHHeHkALUczP76Y8rwSidb9VgOeH5cJuxmh+yQVpcgRMd/zgi4RwkzrXIStwcaF
         dGCQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bk7h/Bmt0bNBLSUgek9hDyJg1GZIJRXbEB31PyIWFFs=;
        b=rwyzea51XF4RMOANMtMyFzGG/mjWoTmZWSj7Ra0vAMjfj+0sGn37MPMv25vkszAhqF
         8t/AG0gT6f9mYJ1ccv3tCtlL2RawHyvznoJo0rhRm/8IxWPdfj6YcHr6yWMcDQGVKQYm
         +BaD41V1jH1cMC2Iw6IfJ0B7dd4F8ldAhQEgCcFfGE1yUamJoRyaBxiz/4YK1eHYH/nL
         7RTyN11ZAwnz8iWCojnKtCaZaFINT0Jlm3SKrAB3ZngLp3DkZlFiCrNE2D9VAJeerj1q
         EYtfrLkhaf1MQERfhzdsr1JCt+U16X0QOlpBgPDymltPTak2ElaLBGpLyFaC84N/vyBu
         SV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bk7h/Bmt0bNBLSUgek9hDyJg1GZIJRXbEB31PyIWFFs=;
        b=UnUEPQrl2sgAF9KnwgYWa1F+Tcmbn60gPcdKJk8D2fSp8ZQ84myHBpzP7esPUglGCq
         4rsoeRwnxy410uQhFN0lJfKPH5duWyJFpFRB2/P/A7DJ7/R8upqAUUcHtSCJ9JeoDdqT
         CNUyA2px5Vrvs5RGTDi0NeUrNhTpD7KtG1Df12SjoG+/GCQtbhNUfU1ubm3ab44atA00
         1b0TVbZry/a83TzP1OKQOdqqo1mwl3wIAH8cuv2Z4FLHj5MWoWABhPXpMPz3IVKfJcgt
         51oRPmbXE1046FeqO2qQOJYgXN5VZ4HSlqosq+Y69uZ1V5l3oPTya7dy0l2NjA07fJFQ
         V90Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531+0CgcNd3mw5ydH5GfCFhuJa6mQZEHcNZi3h9xqOa25G2x2uDZ
	ErdsSEirqJAZ2kWlyPOAyTI=
X-Google-Smtp-Source: ABdhPJwMjOFqy9Y9DloAqE7zPue+O1pDVbAb2u5LQakpqvREaeIOT0QagIB1oE7Tnowk1rXC/MiwJw==
X-Received: by 2002:a17:906:970e:: with SMTP id k14mr998378ejx.417.1597992752283;
        Thu, 20 Aug 2020 23:52:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:bc05:: with SMTP id j5ls863251edh.0.gmail; Thu, 20 Aug
 2020 23:52:31 -0700 (PDT)
X-Received: by 2002:aa7:d596:: with SMTP id r22mr1485005edq.204.1597992751169;
        Thu, 20 Aug 2020 23:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597992751; cv=none;
        d=google.com; s=arc-20160816;
        b=A9MhbtRO2gyGZartqEY9I4whhGGdEDKnGTWZ2NwzYrDURhTpQKhZ2edoci4fCc5m/k
         dXMK57jpsQhl39rd9dH1igB3yw+HkWhYw0v83cNKwpVWP9HOd72Go4ldVK8ratyfjMdZ
         nEqFdiuNAUuw6Pfv7zfZGSKJIivGvkSCsVcdWr9tar663I/x7YB/WZpZe5bYQ4zWfqxC
         pPHlTiN1BgiPD48umAg/zplXEFPokX8E1q3d22r5Ci5BnhfC1LfCRi/f6Y6NcdRz/icc
         OrR2fDey0tKKRVo9NEHMnpulSKDH0Rd50dnfPcKispUJvcdWMoSGcsvFXvCUr5oLLAuJ
         whWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=gGkcQTBPDIQa/R9gvTio8cUK6xSHcPDnDMFZF1tmP3g=;
        b=pK+maTNlL5nLOH28DRFsuHXilUxH0rRjHul4CkOgqIw6mdThgpVKr5Um4MZ9ZBKNis
         xU3sWGw1x/koEAzBL/RYg6+q91XeAgTF04m9zSxPkr3NzPTL1SUcvgtYSPVUqIpWpkNp
         lvjQinZX7yj2j4Mu5gDXnwzX6lEHkNXDblblZSWyo3TqVxRhxmRoUdP/sgTAZFIT7Ues
         WCFE8HW1pOfU5NFSG238UUSmBsoOQjX/po5ueuern7SAP0i4J8whlh8/AkTAZnJsREiy
         FgMmFH+TQk8NhvDz6cYO4k1VCBHpL6zm45DdewLBY9Ix5Ep+nYB4tatjEn7tSOXfeDFc
         zfGQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id b6si36525edq.1.2020.08.20.23.52.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 23:52:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 07L6qU1u013412
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Aug 2020 08:52:30 +0200
Received: from [167.87.31.209] ([167.87.31.209])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07L6qTY1006582;
	Fri, 21 Aug 2020 08:52:29 +0200
Subject: Re: [PATCH V2 3/5] arm64: allow accessing simd/floating-point
 registers in inmate
To: peng.fan@nxp.com
Cc: jailhouse-dev@googlegroups.com, alice.guo@nxp.com
References: <20200821024921.3075-1-peng.fan@nxp.com>
 <20200821024921.3075-3-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <bf6de4b9-053a-b7fb-5cb5-8bead3939315@siemens.com>
Date: Fri, 21 Aug 2020 08:52:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821024921.3075-3-peng.fan@nxp.com>
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

On 21.08.20 04:49, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Set bit 30 of FPEXC32_EL2 to enables access to the Advanced SIMD and
> floating-point functionality from all Exception levels.
> 
> Set CPACR_EL1.FPEN to not trap accessing to SIMD or floating point
> registers.
> 
> Reported-by: Alice Guo <alice.guo@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V2:
>  Add Macros
>  Use u64 for fpexc32_el2.
> 
>  hypervisor/arch/arm64/control.c             | 7 ++++++-
>  hypervisor/arch/arm64/include/asm/sysregs.h | 4 ++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/hypervisor/arch/arm64/control.c b/hypervisor/arch/arm64/control.c
> index 7bc3cab1..cd90b5fc 100644
> --- a/hypervisor/arch/arm64/control.c
> +++ b/hypervisor/arch/arm64/control.c
> @@ -21,6 +21,7 @@
>  void arm_cpu_reset(unsigned long pc, bool aarch32)
>  {
>  	u64 hcr_el2;
> +	u64 fpexc32_el2;
>  
>  	/* put the cpu in a reset state */
>  	/* AARCH64_TODO: handle big endian support */
> @@ -43,7 +44,7 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
>  	arm_write_sysreg(AFSR1_EL1, 0);
>  	arm_write_sysreg(AMAIR_EL1, 0);
>  	arm_write_sysreg(CONTEXTIDR_EL1, 0);
> -	arm_write_sysreg(CPACR_EL1, 0);
> +	arm_write_sysreg(CPACR_EL1, CPACR_EL1_FPEN(3));
>  	arm_write_sysreg(CSSELR_EL1, 0);
>  	arm_write_sysreg(ESR_EL1, 0);
>  	arm_write_sysreg(FAR_EL1, 0);
> @@ -57,6 +58,10 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
>  	arm_write_sysreg(TTBR1_EL1, 0);
>  	arm_write_sysreg(VBAR_EL1, 0);
>  
> +	arm_read_sysreg(FPEXC32_EL2, fpexc32_el2);
> +	fpexc32_el2 |= FPEXC_EL2_EN_BIT;
> +	arm_write_sysreg(FPEXC32_EL2, fpexc32_el2);
> +
>  	/* wipe timer registers */
>  	arm_write_sysreg(CNTP_CTL_EL0, 0);
>  	arm_write_sysreg(CNTP_CVAL_EL0, 0);
> diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arch/arm64/include/asm/sysregs.h
> index 56f0ce0a..378fecd8 100644
> --- a/hypervisor/arch/arm64/include/asm/sysregs.h
> +++ b/hypervisor/arch/arm64/include/asm/sysregs.h
> @@ -163,6 +163,10 @@
>  /* exception level in SPSR_ELx */
>  #define SPSR_EL(spsr)		(((spsr) & 0xc) >> 2)
>  
> +#define CPACR_EL1_FPEN(x)	((x) << 20)

I've replaced that with

#define CPACR_EL1_FPEN_ALL	(3UL << 20)

> +
> +#define FPEXC_EL2_EN_BIT	(1UL << 30)
> +
>  #ifndef __ASSEMBLY__
>  
>  #include <jailhouse/string.h>
> 

All 5 applied to next.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bf6de4b9-053a-b7fb-5cb5-8bead3939315%40siemens.com.
