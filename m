Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZWA534QKGQEDTACXAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BB52481F4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 11:33:26 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id g72sf5876070wme.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 02:33:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597743206; cv=pass;
        d=google.com; s=arc-20160816;
        b=jQ6lQw0WQ/TVz8K9miN6T96t0HOZvxv6BZZ4n8dmCedQimLYU1uzJXLqatojHJ4Pi0
         PLyjkxBtRA1pjT/lFZlpxZrKpWrJ+sdaKtQkYOnR7k/Meew5fTyERXWB58pS3H4aMl7w
         BhZNOYqo1qlyYALwIUsKSZ5W6pJ6IyJ1iAjAhQF/cRfgxi8olWDNEzOVGslQ6zAGMKoK
         3tw8XJBT6Li9rLEK1tN2l7L9Rdhiqx7tWSAntTS0SpkHSWJMgsUoirFUJbWTMpnCJ+XG
         7BqUHPN3FY4Xk/F5BRjdpVJibwIdBxcqZm9n2ojnvYSq+0TfZ77JmrfXNeYoHPGzc8Gi
         sCpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=ichqlyG1ULKcHfxJDTASekZV/J116DcxLbpjBi3WMa4=;
        b=HVcIgV7jcyKyPE+aaiJN8g0jXeSWMGkAUkE4/hSTyEuXLNQY/D+sTgib1RRgWVshYB
         nOwd4mpJiaJupOzsV9NAuOHfMTfbp/6AMktea7+dXz7DejN5jwtO1lmUzhktofUFvaL5
         f/X6MYWVG3dgLX0HNiH4gRp9ZABKXy1j/ip+mMKiquwo5GP1GYNGg/XY9oZoLgNpK3cC
         5xJLshZd1MaUSJQb82ZFDv+rkQnBuuezfGunwUUUgNU1v2QAVlk/oFFlKhPm6EmKfR2P
         +S8u+r1eNPJlBmC8Tl4wENm1gqcBdV/E1V0S/QLfZmeRvUvSYNYy4B+lWwSlMM7dSio0
         fOaQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ichqlyG1ULKcHfxJDTASekZV/J116DcxLbpjBi3WMa4=;
        b=g9/fWA3FsMajGRgk3pHIdZjI9GmGpL/pD6WvZ6Ir2VowKmuccXsDVzaVjLNB2mIw4F
         M4Yr61fIrA3jLd1GMyGyUTxYXDUQBSLV+ck54Sgng94Hv5s7PxkRT1RWMyfkuTTRyeN2
         FMOyDLBMgSdtYq68b/QcWlU+pjZ+LXU7bbJEcWg0UFahx1m6R5wW1f0PEXcGpXu2MgbJ
         zUY7jyfwSGswLJP1mfdSpR4dlUaQrA1kznL3B7412vVTY3FOySrRsL2Xu5rZ1oBy0d6Q
         1muG50T54jOKONIUkxyCakwJJR+scvJ8gn4blc+qnflkoy1zMjhBi6YwV6tUNuPpUaoj
         TL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ichqlyG1ULKcHfxJDTASekZV/J116DcxLbpjBi3WMa4=;
        b=K1Hm0sq4pxTVD61nOXcwC5Yu7Ol+qg3bN2NgyCu1jxIDtZpabbdTqNnPUh5vGdtgT0
         BCUIfKgHSXAanU136RKOM2+ppyRoBFBtjoP+GDkmINBXh5W0Db1kgQx3wQBiZh0RfvgB
         o3r1+8LWdkiv/ss2VzSUjd3OFo0fhO95f2AbrIdkvfEeuTPf4dE3L9zbU1McXykXY4C/
         ALnC9bcTCTtHzI1WP7rnYFgCyrrkmTXFd5GJlWqUgG+V4cXnbH4vy/qDivQckA9BZmne
         ajVfeeIMb3qO7LLcWu0QYFAdv6q9cx770oJXb9bPHlemysXjSC5ELYVV8WymLmg1QNwP
         thSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531g8VzwFGwxuHbtAv9c2d1CGs4eWx+hl49LlO0fyJKuy230R8rM
	X4W8VJyJPAWPstyj/HN4Tnw=
X-Google-Smtp-Source: ABdhPJysCdjKQzdJBgVLPPDZvEv62qmcZlU5RpDHz0Z5HGAbzaf7NWcJPJQ3s7cDKxVLmMVg0yV7cg==
X-Received: by 2002:a1c:1d91:: with SMTP id d139mr19235472wmd.144.1597743206578;
        Tue, 18 Aug 2020 02:33:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b1cf:: with SMTP id r15ls101115wra.3.gmail; Tue, 18 Aug
 2020 02:33:25 -0700 (PDT)
X-Received: by 2002:adf:f806:: with SMTP id s6mr19846162wrp.252.1597743205661;
        Tue, 18 Aug 2020 02:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597743205; cv=none;
        d=google.com; s=arc-20160816;
        b=ReijCEN6XYQmSHdlwAAAnzVutHKxgknD2k/wjcmy6aCKFsmjBS3fuubIUwdO/Jw6ku
         40lUmoOiUm4PLajISS7Fv7/AqY5O3+lslyClX50V7YsKS/FBnK+GP9SWr4t/FQWGlOnG
         ElAscpyyhaYwttSgNrv4Ta5J89ydXh3qAQS66kwruxUtGtMcSX1R3Fk2GKXhmwIq5lVp
         mk2/HYZsxr1nodN2xsKOVib9ljI/QPxZNB8sJ39KiAgPIiCcoIJ6A6lotDVnTeMRFT7M
         F6R+5zrBaZZCWMo6W/fdY/BOto+QEsHinGpojT8NAuCNDG6ZUH/8kfJg6oGijU9Yl7c+
         0jbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=CAe8jk8DfbvC0Ksb7j/ekwIL2NbwpPXxgWOIc4jFDr4=;
        b=g9df81HVNf2hYOIihOYCYNCexRoxtRZXuQ3lHQywOswUOfhHMi5TzsUyzEle1n0gKE
         cC6r8v2TUohQ5t58oFcKxnbDweAEY1aoKpvTh0TQaT8ACsKOrD/ZZkJekhV0WuXcFLZ1
         9BnMmvYaR/EvVO+igP9O7I9yXs5bMWFjon68riUb5NO/+IO+mvzw/f84fjZnz2168y7f
         5OUOfHToFw3xzTFzHAeY855thsM5b8iNaMZwPQCDmh/pa3KVOOTC135+LTYgWVuAPy6P
         QjI8k3JqOLpZ4iK6eVWIW+SSDvrqhyOr+R5InPfj2KcOp3I5UKfEEvcPkxyUzE3/1p5q
         Wmmg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id j16si635841wrs.5.2020.08.18.02.33.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 02:33:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 07I9XPTN017304
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 11:33:25 +0200
Received: from [139.22.40.250] ([139.22.40.250])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07I9XO6S011566;
	Tue, 18 Aug 2020 11:33:25 +0200
Subject: Re: [PATCH V3 1/4] arm64: support inmate cell in AArch32 mode
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200819142807.20972-1-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c54edf85-90c8-33ba-f64f-08a17ea93ab5@siemens.com>
Date: Tue, 18 Aug 2020 11:33:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819142807.20972-1-alice.guo@nxp.com>
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

On 19.08.20 16:28, Alice Guo wrote:
> An AArch64 hypervisor can host both AArch32 and AArch64 virtual machines
> at the same time. If the inmate cell wants to run in AArch32 mode, the
> assigned cpu must change to AArch32. Because AArch64 hypervisor and
> AArch64 root cell are used, when the AArch32 inmate cell is destroyed,
> cpu owned by inmate cell will be reassigned to AArch64 root cell, switch
> the cpu back to AArch64.
> 
> The following is a summary of some of the points when supporting inmate
> cell in AArch32 mode:
> Define a macro "JAILHOUSE_CELL_AARCH32" to indicate AArch32 execution
> state. Add this macro to flags of struct jailhouse_cell_desc, and you can
> use it to indicate whether a cell is AArch32.
> 
> Add "bool aarch32" as second parameter to arm_cpu_reset(), and can use
> it to pass execution state. If aarch32 equals true, switch to AArch32.
> 
> When an exception occurs, the processor must execute handler code which
> corresponds to the exception. When the exception is being taken at a
> lower Exception level, the execution state of the next lower level
> (AArch64 or AArch32) will be used. Fill exception handling functions for
> Lower EL using AArch32 in hypervisor/arch/arm64/entry.S.
> 
> Configure the registers related to changing execution state. If a cell
> is AArch32, SPSR_EL2.M[4] will be set to 0b1 which means AArch32
> execution state, SPSR_EL2.M[3:0] will be set to 0b0011 which means
> Supervisor, and HCR_EL2.RW will be set to 0b0 which means lower levels
> are all AArch32. If a cell is AArch64, make sure HCR_EL2.RW is 0 and the
> other registers are configured according to the previous code.
> 
> After Linux operating system boots up, execute the following commands to
> use AArch32 virtual machine on the i.MX8DXL:
> ./jailhouse enable imx8dxl.cell
> ./jailhouse cell create imx8dxl-gic-demo-aarch32.cell
> ./jailhouse cell load 1 gic-demo.bin (32-bit)
> ./jailhouse cell start 1
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>  hypervisor/arch/arm-common/control.c             |  7 +++++--
>  hypervisor/arch/arm-common/include/asm/control.h |  2 +-
>  hypervisor/arch/arm/control.c                    |  2 +-
>  hypervisor/arch/arm64/control.c                  | 14 ++++++++++++--
>  hypervisor/arch/arm64/entry.S                    |  8 ++++----
>  hypervisor/arch/arm64/include/asm/sysregs.h      |  6 +++++-
>  include/jailhouse/cell-config.h                  |  1 +
>  7 files changed, 29 insertions(+), 11 deletions(-)
> 
> diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
> index 70793432..3caa30c6 100644
> --- a/hypervisor/arch/arm-common/control.c
> +++ b/hypervisor/arch/arm-common/control.c
> @@ -32,7 +32,9 @@ void arm_cpu_park(void)
>  	enter_cpu_off(cpu_public);
>  	spin_unlock(&cpu_public->control_lock);
>  
> -	arm_cpu_reset(0);
> +	arm_cpu_reset(0, !!(this_cell()->config->flags &
> +		      JAILHOUSE_CELL_AARCH32));
> +
>  	arm_paging_vcpu_init(&parking_pt);
>  }
>  
> @@ -100,7 +102,8 @@ static void check_events(struct public_per_cpu *cpu_public)
>  	if (cpu_public->wait_for_poweron)
>  		arm_cpu_park();
>  	else if (reset)
> -		arm_cpu_reset(cpu_public->cpu_on_entry);
> +		arm_cpu_reset(cpu_public->cpu_on_entry,
> +		!!(this_cell()->config->flags & JAILHOUSE_CELL_AARCH32));
>  }
>  
>  void arch_handle_sgi(u32 irqn, unsigned int count_event)
> diff --git a/hypervisor/arch/arm-common/include/asm/control.h b/hypervisor/arch/arm-common/include/asm/control.h
> index 2f54e2b5..9a5eaba7 100644
> --- a/hypervisor/arch/arm-common/include/asm/control.h
> +++ b/hypervisor/arch/arm-common/include/asm/control.h
> @@ -29,7 +29,7 @@ void arch_shutdown_self(struct per_cpu *cpu_data);
>  
>  unsigned int arm_cpu_by_mpidr(struct cell *cell, unsigned long mpidr);
>  
> -void arm_cpu_reset(unsigned long pc);
> +void arm_cpu_reset(unsigned long pc, bool aarch32);
>  void arm_cpu_park(void);
>  
>  #endif /* !__ASSEMBLY__ */
> diff --git a/hypervisor/arch/arm/control.c b/hypervisor/arch/arm/control.c
> index 5e1828f6..cd68dd9a 100644
> --- a/hypervisor/arch/arm/control.c
> +++ b/hypervisor/arch/arm/control.c
> @@ -20,7 +20,7 @@
>  #include <asm/psci.h>
>  #include <asm/sysregs.h>
>  
> -void arm_cpu_reset(unsigned long pc)
> +void arm_cpu_reset(unsigned long pc, bool aarch32)
>  {
>  	u32 sctlr;
>  
> diff --git a/hypervisor/arch/arm64/control.c b/hypervisor/arch/arm64/control.c
> index 6e1ffebf..aee81620 100644
> --- a/hypervisor/arch/arm64/control.c
> +++ b/hypervisor/arch/arm64/control.c
> @@ -18,11 +18,12 @@
>  #include <asm/psci.h>
>  #include <asm/traps.h>
>  
> -void arm_cpu_reset(unsigned long pc)
> +void arm_cpu_reset(unsigned long pc, bool aarch32)
>  {
> +	u64 hcr_el2;
> +
>  	/* put the cpu in a reset state */
>  	/* AARCH64_TODO: handle big endian support */
> -	arm_write_sysreg(SPSR_EL2, RESET_PSR);
>  	arm_write_sysreg(SCTLR_EL1, SCTLR_EL1_RES1);
>  	arm_write_sysreg(CNTKCTL_EL1, 0);
>  	arm_write_sysreg(PMCR_EL0, 0);
> @@ -67,6 +68,15 @@ void arm_cpu_reset(unsigned long pc)
>  	/* AARCH64_TODO: handle PMU registers */
>  	/* AARCH64_TODO: handle debug registers */
>  	/* AARCH64_TODO: handle system registers for AArch32 state */
> +	arm_read_sysreg(HCR_EL2, hcr_el2);
> +	if (aarch32 == true) {
> +		arm_write_sysreg(SPSR_EL2, RESET_PSR_AARCH32);
> +		hcr_el2 &= ~HCR_RW_BIT;
> +	} else {
> +		arm_write_sysreg(SPSR_EL2, RESET_PSR_AARCH64);
> +		hcr_el2 |= HCR_RW_BIT;
> +	}
> +	arm_write_sysreg(HCR_EL2, hcr_el2);
>  
>  	arm_write_sysreg(ELR_EL2, pc);
>  
> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> index 27e148c6..4789e933 100644
> --- a/hypervisor/arch/arm64/entry.S
> +++ b/hypervisor/arch/arm64/entry.S
> @@ -401,8 +401,8 @@ hyp_vectors:
>  	ventry	.
>  	ventry	.
>  
> -	ventry	.
> -	ventry	.
> +	handle_vmexit arch_handle_trap
> +	handle_vmexit irqchip_handle_irq
>  	ventry	.
>  	ventry	.
>  
> @@ -425,8 +425,8 @@ hyp_vectors_hardened:
>  	ventry	.
>  	ventry	.
>  
> -	ventry	.
> -	ventry	.
> +	handle_abort_fastpath
> +	handle_vmexit irqchip_handle_irq
>  	ventry	.
>  	ventry	.
>  
> diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arch/arm64/include/asm/sysregs.h
> index 0105b109..e5984dbc 100644
> --- a/hypervisor/arch/arm64/include/asm/sysregs.h
> +++ b/hypervisor/arch/arm64/include/asm/sysregs.h
> @@ -15,19 +15,23 @@
>  
>  #define PSR_MODE_MASK	0xf
>  #define PSR_MODE_EL0t	0x0
> +#define PSR_MODE_SVC	0x3
>  #define PSR_MODE_EL1t	0x4
>  #define PSR_MODE_EL1h	0x5
>  #define PSR_MODE_EL2t	0x8
>  #define PSR_MODE_EL2h	0x9
>  
> +#define PSR_32_BIT	(1 << 4)
>  #define PSR_F_BIT	(1 << 6)
>  #define PSR_I_BIT	(1 << 7)
>  #define PSR_A_BIT	(1 << 8)
>  #define PSR_D_BIT	(1 << 9)
>  #define PSR_IL_BIT	(1 << 20)
>  #define PSR_SS_BIT	(1 << 21)
> -#define RESET_PSR	(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT \
> +#define RESET_PSR_AARCH64	(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT \
>  			| PSR_MODE_EL1h)
> +#define RESET_PSR_AARCH32	(PSR_A_BIT | PSR_I_BIT | PSR_F_BIT \
> +			| PSR_32_BIT | PSR_MODE_SVC)
>  
>  #define MPIDR_CPUID_MASK	0xff00ffffffUL
>  #define MPIDR_CLUSTERID_MASK	0xff00ffff00UL
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 6df4a745..2a968dd5 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -56,6 +56,7 @@
>  
>  #define JAILHOUSE_CELL_PASSIVE_COMMREG	0x00000001
>  #define JAILHOUSE_CELL_TEST_DEVICE	0x00000002
> +#define JAILHOUSE_CELL_AARCH32		0x00000004
>  
>  /*
>   * The flag JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED allows inmates to invoke
> 

Thanks, applied with style changes.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c54edf85-90c8-33ba-f64f-08a17ea93ab5%40siemens.com.
