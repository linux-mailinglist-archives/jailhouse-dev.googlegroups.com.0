Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2U53L4QKGQEIOMGSAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8900B244A42
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 15:17:31 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id b8sf3384476wrr.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 06:17:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597411051; cv=pass;
        d=google.com; s=arc-20160816;
        b=ttQ434ataYqoVqO0WRI3AAE9DEnX3HuMmWEncAqxBgOQucOsI+tZKRK8qL7jxijNkv
         8hyez890vCbXKfQ0jhlJDvb1ZHuOl/UVcsy3VS51uvmBeqWG5CdQHWW9PeW2+Q7bTn4e
         xEaaEuIOm6YoZMdW0gX3DscE8abt2CM6oWf9wWEN44Wy08RcQM2os0w3vEQxD3wgTJEn
         zeDZDuyX6HZrYQI2lX7gGolDNu1/khiOTW3rt5EBCzxGHri2XTchj9PxzsMkxOPt9Zwg
         Ng6usYyJfJIv9Q4UmPpFhHRbyc8GpTk8aIQcR4y7uqqPUYkIR6HVHEUsn7QPhQ1n1kBB
         juog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=YPBa8oaxTBISoO5AItkRDVgRLDSmka4AkSZXqjAtR40=;
        b=XObgGb9XNGHaJHwY78ULQUg3THDj4t1ytwACtsWcIhbvN2+F/jIpXhwvAhjU9+mQPW
         ssd42ZScoCSNbcFYJsvGPfOs0IC/J66AR0nTghULuqa6b4kRtkAt7M92BL8oJpVf59p3
         GKvNjv/RFDfYvSXb4uMj79SSVSkS3BzhNjNNLK8XPhZWGnr8geEbr/KmEe47hhih/rsn
         WoHpC82AJ/9gutULS2eqW07pUNJkBDdgZKavDDA5P5zjKLl7pjEnBgXUZqV02sXRvU5u
         6Gj7pr3Uf/vAcAtmrbxiW7U1YAZvFpFomszeqecZSOhJ94xbAC0cXE+E+t/8kdwFQuRN
         2tSg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YPBa8oaxTBISoO5AItkRDVgRLDSmka4AkSZXqjAtR40=;
        b=jj1cCRV5yDddb2xN5yrcjdTUbyF/1dncagj1JEiCfJm0zjHq8+Sm3SdQtGi+P/onDw
         5ln53d0E7TorJYBZzL3Ohq/ssR7GVTuD4RmNEH8Qz/EL5aCa7KsOemewa0MYgSWO4UNK
         VI0dDUky02p7s7TQ7lHeHhr7DwFrUEY6fNhKxiyMlSeFlKnhbUt8JnSzo2ydeSToBoQl
         nOyGD19OSQFoNKQ5mhQZyhMXVtrCOK4G7YRmdxnLmuniWUX3SAPI9wX+klrsVKr7hmb1
         A41hVR0J+D0qu8eCkIp+4Q+23ERlt8fVe2dgWmmjXrH9Lz8Q0mNpHWUb2Iv+/iioxp4p
         7a4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=YPBa8oaxTBISoO5AItkRDVgRLDSmka4AkSZXqjAtR40=;
        b=DUYOyQcTe8qW6zBeEj3LkjB5zjV/10s6Ln+OmXkAs39bmoTF40M/Z6Uc0y5TmXI4+v
         n+mRdQVeG6T0SnTxGJRzna6cHXnTJbACVoPZ0wqSx1JbmrM9lIUvE0MFwYSlXBmCOk1x
         Voy/niOkW84peYQjKWeKzMy+G0mlklMal4Y50ny2CXrZ7aFXOT8l2r28qR1/zphUE6ji
         O1ovnNhY9BeAewKZFCoE6M0f0vNu7wRyDkvfKGSGLEGlaQz3sdl3chL1E1N7x27yzjX6
         AZW6Hn4d9/fMbsrNKsNeRPa21/hzCr8YFSI9HsqAjbxsoSPSCvZtGIgxhPldTR1BbDN4
         MyGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533V9QDBCWwWkNA9gVgrfzZ3/eA2yMkFGN/h7i9otImS6q7TF1NC
	lVX5RrCFEqDESOSHJlne+JQ=
X-Google-Smtp-Source: ABdhPJw2nTsapCfwRN/kdKezqEdHNKSHJRNI8Orz+6VVYKy/vsvwdUAHDatOr3MQBQWYGCbIgqH1Cw==
X-Received: by 2002:a1c:b487:: with SMTP id d129mr2653981wmf.185.1597411051238;
        Fri, 14 Aug 2020 06:17:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e78f:: with SMTP id n15ls4939186wrm.1.gmail; Fri, 14 Aug
 2020 06:17:30 -0700 (PDT)
X-Received: by 2002:adf:eb05:: with SMTP id s5mr2985857wrn.0.1597411050179;
        Fri, 14 Aug 2020 06:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597411050; cv=none;
        d=google.com; s=arc-20160816;
        b=TH2BO6nUkOk1DZ3kHmHEaVue5iPYBlzgsXRCgcbdaI/kbkfLP8qNjeNdSwoxqHjz7d
         RiBckLpk79yWpIiHmTHApBv1lGFbCisWzrd+v575v2pOGa+y8gZSm01dgzxK6TkNhZEv
         dniFDVz1pmwQbgNivY5IlpaZtVIXFqr3ZIUk7wkYIfpGFE2IQQBcFAxWciynEkUhcxDg
         jl5eCD2UUMxRTG668KFuA99dYE6t3BSIO0SjBmlx0tJ68yY1PB831TXfKP84QFQrHwVp
         +iCdIu+eA9MmI+9IEkea7glDRGzfWthDfiLTdI6bpHuwEJGbsRZD5X6D5INDQiq8BSg0
         cGNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=J/qO3CtuiFYJ9D6bXlLbfS+xVGPCoZ5YdAv1eXLJJFI=;
        b=N525gx0O46+MUZWPDF0T/nvvXIpB7zMahhwrdlXA0yJHHcmxO0Qz9tHJN5k7pTNC0J
         nTzD0fJsGzwr3tDy8VLaFRymatJMniRPkSZtpyXUgHgYAuJNqr3aFo43Kb3GC+RmRE6B
         72rkEF5j18hvFoG4Z5SDOOHyQWvuCj25scXnigGskg+WasNu9BT/Eg1W5UzM5N44eJzO
         NE4vYHN4FQiQGawGCDzdWvr3zE418JTay059FphqcyK+BTsaXr6kthDyeF2BWtms1a+G
         OtuOcCaPdPRYc7bSwsrk+XyY1VwCpdiXrgd4gFnFhYUa7WLltZ1M5RsWaKRoUDLQwvXl
         aniQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 64si272557wmb.1.2020.08.14.06.17.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 06:17:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 07EDHTT1006472
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Aug 2020 15:17:29 +0200
Received: from [167.87.75.232] ([167.87.75.232])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07EDHSu0018650;
	Fri, 14 Aug 2020 15:17:29 +0200
Subject: Re: [PATCH V2 1/4] arm64: support inmate cell in AArch32 mode
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200815190949.6837-1-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1b65d312-fc95-72a3-541f-aae43be7a126@siemens.com>
Date: Fri, 14 Aug 2020 15:17:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200815190949.6837-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 15.08.20 21:09, Alice Guo wrote:
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
> AArch32 and AArch64 virtual machines use different ARM_PARKING_CODE.
> 0xd503207f and 0x17ffffff are used in AArch64 and 0xe320f003 and
> 0xeafffffd are used in AArch32. Add ARM_PARKING_CODE which is used by
> AArch32 in arm64/include/asm/processor.h, and then select which one to
> use by arm_cpu_reset().
> 
> When an exception occurs, the processor must execute handler code which
> corresponds to the exception. When the exception is being taken at a
> lower Exception level, the execution state of the next lower level
> (AArch64 or AArch32) will be used. Fill exception handling functions for
> Lower EL using AArch32 in hypervisor/arch/arm64/entry.S.
> 
> Changing to AArch32 happens after the command "jailhouse cell start 1"
> is executed. Changing to AArch64 happens after the command
> "jailhouse cell destroy 1". If a cell is AArch32, SPSR_EL2.M[4] will be
> set to 0b1 which means AArch32 execution state, SPSR_EL2.M[3:0] will be
> set to 0b0011 which means Supervisor, and HCR_EL2.RW will be set to 0b0
> which means lower levels are all AArch32. If a cell is AArch64, make
> sure HCR_EL2.RW is 0 and the other registers are configured according to
> the previous code.
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
>   hypervisor/arch/arm-common/control.c          |  5 ++++-
>   hypervisor/arch/arm64/control.c               | 10 ++++++++++
>   hypervisor/arch/arm64/entry.S                 |  8 ++++----
>   hypervisor/arch/arm64/include/asm/processor.h |  4 +++-
>   hypervisor/arch/arm64/include/asm/sysregs.h   |  4 ++++
>   include/jailhouse/cell-config.h               |  4 ++++
>   6 files changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
> index 70793432..bfd9e710 100644
> --- a/hypervisor/arch/arm-common/control.c
> +++ b/hypervisor/arch/arm-common/control.c
> @@ -32,7 +32,10 @@ void arm_cpu_park(void)
>   	enter_cpu_off(cpu_public);
>   	spin_unlock(&cpu_public->control_lock);
>   
> -	arm_cpu_reset(0);
> +	if (this_cell()->config->flags & JAILHOUSE_CELL_AARCH32)
> +		arm_cpu_reset(PARKING_ENTRY_ADDR_AARCH32);
> +	else
> +		arm_cpu_reset(PARKING_ENTRY_ADDR_AARCH64);

Let's do

arm_cpu_reset(this_cell()->config->flags & JAILHOUSE_CELL_AARCH32 ?
	      PARKING_ENTRY_ADDR_AARCH32 : PARKING_ENTRY_ADDR_AARCH64);

>   	arm_paging_vcpu_init(&parking_pt);
>   }
>   
> diff --git a/hypervisor/arch/arm64/control.c b/hypervisor/arch/arm64/control.c
> index 6e1ffebf..71615c04 100644
> --- a/hypervisor/arch/arm64/control.c
> +++ b/hypervisor/arch/arm64/control.c
> @@ -20,6 +20,8 @@
>   
>   void arm_cpu_reset(unsigned long pc)
>   {
> +	u64 hcr_el2;
> +
>   	/* put the cpu in a reset state */
>   	/* AARCH64_TODO: handle big endian support */
>   	arm_write_sysreg(SPSR_EL2, RESET_PSR);

Please pull this into this AARCH64 branch below to avoid needless 
duplicate writing.

> @@ -67,6 +69,14 @@ void arm_cpu_reset(unsigned long pc)
>   	/* AARCH64_TODO: handle PMU registers */
>   	/* AARCH64_TODO: handle debug registers */
>   	/* AARCH64_TODO: handle system registers for AArch32 state */
> +	arm_read_sysreg(HCR_EL2, hcr_el2);
> +	if (this_cell()->config->flags & JAILHOUSE_CELL_AARCH32) {
> +		arm_write_sysreg(SPSR_EL2, RESET_PSR_AARCH32);
> +		hcr_el2 &= ~HCR_RW_BIT;
> +	} else {
> +		hcr_el2 |= HCR_RW_BIT;
> +	}
> +	arm_write_sysreg(HCR_EL2, hcr_el2);
>   
>   	arm_write_sysreg(ELR_EL2, pc);
>   
> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> index 27e148c6..4789e933 100644
> --- a/hypervisor/arch/arm64/entry.S
> +++ b/hypervisor/arch/arm64/entry.S
> @@ -401,8 +401,8 @@ hyp_vectors:
>   	ventry	.
>   	ventry	.
>   
> -	ventry	.
> -	ventry	.
> +	handle_vmexit arch_handle_trap
> +	handle_vmexit irqchip_handle_irq
>   	ventry	.
>   	ventry	.
>   
> @@ -425,8 +425,8 @@ hyp_vectors_hardened:
>   	ventry	.
>   	ventry	.
>   
> -	ventry	.
> -	ventry	.
> +	handle_abort_fastpath
> +	handle_vmexit irqchip_handle_irq
>   	ventry	.
>   	ventry	.
>   
> diff --git a/hypervisor/arch/arm64/include/asm/processor.h b/hypervisor/arch/arm64/include/asm/processor.h
> index b52782b7..e7b048e0 100644
> --- a/hypervisor/arch/arm64/include/asm/processor.h
> +++ b/hypervisor/arch/arm64/include/asm/processor.h
> @@ -34,7 +34,9 @@ union registers {
>   
>   #define ARM_PARKING_CODE		\
>   	0xd503207f, /* 1: wfi  */	\
> -	0x17ffffff, /*    b 1b */
> +	0x17ffffff, /*    b 1b */	\
> +	0xe320f003, /* 2: wfi  */	\
> +	0xeafffffd, /*    b 2b */
>   
>   #define dmb(domain)	asm volatile("dmb " #domain "\n" : : : "memory")
>   #define dsb(domain)	asm volatile("dsb " #domain "\n" : : : "memory")
> diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arch/arm64/include/asm/sysregs.h
> index 0105b109..62a56743 100644
> --- a/hypervisor/arch/arm64/include/asm/sysregs.h
> +++ b/hypervisor/arch/arm64/include/asm/sysregs.h
> @@ -15,11 +15,13 @@
>   
>   #define PSR_MODE_MASK	0xf
>   #define PSR_MODE_EL0t	0x0
> +#define PSR_MODE_SVC	0x3
>   #define PSR_MODE_EL1t	0x4
>   #define PSR_MODE_EL1h	0x5
>   #define PSR_MODE_EL2t	0x8
>   #define PSR_MODE_EL2h	0x9
>   
> +#define PSR_32_BIT	(1 << 4)
>   #define PSR_F_BIT	(1 << 6)
>   #define PSR_I_BIT	(1 << 7)
>   #define PSR_A_BIT	(1 << 8)
> @@ -28,6 +30,8 @@
>   #define PSR_SS_BIT	(1 << 21)
>   #define RESET_PSR	(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT \
>   			| PSR_MODE_EL1h)
> +#define RESET_PSR_AARCH32	(PSR_A_BIT | PSR_I_BIT | PSR_F_BIT \
> +			| PSR_32_BIT | PSR_MODE_SVC)

Indention is ugly now, and naming is inconsistent. So let's align 
everything after RESET_PSR_AARCH32, at least in this block, and rename 
RESET_PSR to RESET_PSR_AARCH64.

>   
>   #define MPIDR_CPUID_MASK	0xff00ffffffUL
>   #define MPIDR_CLUSTERID_MASK	0xff00ffff00UL
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 6df4a745..6fda32b9 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -56,6 +56,10 @@
>   
>   #define JAILHOUSE_CELL_PASSIVE_COMMREG	0x00000001
>   #define JAILHOUSE_CELL_TEST_DEVICE	0x00000002
> +#define JAILHOUSE_CELL_AARCH32		0x00000004
> +
> +#define PARKING_ENTRY_ADDR_AARCH64	0x0
> +#define PARKING_ENTRY_ADDR_AARCH32	0x8

The last two do not belong here. They are internal to the hypervisor. 
Move them to asm/processor.h where the code block is also defined.

Jan

>   
>   /*
>    * The flag JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED allows inmates to invoke
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1b65d312-fc95-72a3-541f-aae43be7a126%40siemens.com.
