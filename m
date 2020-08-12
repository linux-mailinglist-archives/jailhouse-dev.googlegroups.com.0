Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3UQZ74QKGQEPC6QC5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EB4242854
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 12:46:07 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id w1sf755662wro.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 03:46:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597229167; cv=pass;
        d=google.com; s=arc-20160816;
        b=eM6AoNV+wC+kjBERH+SQC5MwGMu2ZOeBaNbomydO3oslUsssxqLSQqOdG1StWgmR07
         876NSpi5O12ehWJ9Tg5kDZqjbFnIk3FddkJVGcT4YlVqnO1VKFTw1A1GrMFtBxUbrI6S
         XJlAJ1re8okXw08/+RBvBy/eaASMo3eNjGbsNUuqG/dLdlhkvI+NphY4bnDMhD07kcR+
         4AuEGkvDqBs2Vm1jEyZ083o6fLzlYGbEquV3RUvcLLTfbHYgTw2yTO1UYxk9IwGXYPCQ
         5l//QoaqvJNRux4zpnoxSP+mTIqTN+F1d+hhMX0mEebJS26CGpRnhc3Ium22AYyQUPOb
         Uo2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=IBuksOjiy+QupFlg8YRGX6RotbDUK1dPa1/XqBV42pc=;
        b=kwJ9lvQKsVnZlgPeJTES+/ENSEy/hsFdYYAH6J+zx4zemrX0kG4bBxKxhAD7w62lnP
         V4iAxKDdMk48cqihg5K9AZlSsCvww7BtnIsT3qttMH19EaAAAAYShR1E4WVdub5eCuks
         fHoS/BXukuPX31JafxiSGiecC1uxQ6ZHZ1q3rphW1UyUkGAxcGOE59lgOJFQ8ExTcLCj
         Xf2nEiMZM6TEzrVsAS7Mhw0oXp/uKHqMnVnQj2lXEE5kANgAooybVw5PqMx3CK0D4rmr
         mLh2mH7p8UZszK4qRLqXy9gy3a7SFdFMqErLlbcniT7U/+npQKTUXctbTSCKUihqKG0e
         S0fA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IBuksOjiy+QupFlg8YRGX6RotbDUK1dPa1/XqBV42pc=;
        b=gUib1yHVaEj4ulrhWguYSJEF3bWkFvz61lQzY3z68UhNSzx9nEjInQI0h7REiOZ9rA
         B1GH1piYoD0L50KvlrMcQJpKmMOdZRqF3m3ULyC+2ry/Svrz1w6iDRiy/UQh2ElFTQQC
         UsAAtuz0Ij5BiiXFBtvXSaTDza64Hrs0OrmgEIeNWMz0oREZL6FamLhwZiNQSkE3yWq8
         C5esYKK+FH2bAguMs9sU6IlD5GLkADy9oE5MF20LdBpEYxEpCbTbWeCnLJamjvbNZU9r
         2mrwOlf4MkSv9xC2MhgxTFsqT4CnWnZRySD7829ZwN/pY0MshOakTkuOiOetdMPf+AlE
         hgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=IBuksOjiy+QupFlg8YRGX6RotbDUK1dPa1/XqBV42pc=;
        b=FB7RFburaHyOtpgHD1c9LvN/mVRM4ZixU5mIJgFogd19trGBT5Zagci6qgPjJ5OvMP
         O5DWBv+suw62DaJyPJKmQsXnb0trOOMWID3VT8+jzPwXh9d+Hy7QTtXKAG2A6cSHBf1k
         96DAlBqUNRr3w/gqh14+wxg7ZapF4NFY1ekUf0dlntYaODtwRMxrrECsMA0t/TQhTK0q
         wd1gljiKRQnNZUHiV3T5ORhw58RHSWyNRyJuldt3elVwT2kFwkFrbQONA3aODvDMAfQ/
         tFcVhOcaWZMdahv795AwWPdVd5z/X+jbjO7L8Ytk/GrkozwH/v7kB5Nmtq2UrBXB/CVb
         0s/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533DOGXbgyzHEJr119esURgsJRVhnJpgy3NAILcKXFHrrMt2cas0
	NLjlDL127VlM1VY37SdCZ9E=
X-Google-Smtp-Source: ABdhPJxeg1k4FMfk/3WLr6qjEltN/OFxVQryBzV6vD9OksSWhIsY5QaRDEcjoypGSDjxIjTELT57bw==
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr8404891wma.79.1597229167140;
        Wed, 12 Aug 2020 03:46:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2049:: with SMTP id g70ls774919wmg.0.gmail; Wed, 12 Aug
 2020 03:46:06 -0700 (PDT)
X-Received: by 2002:a1c:7705:: with SMTP id t5mr8317050wmi.112.1597229166256;
        Wed, 12 Aug 2020 03:46:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597229166; cv=none;
        d=google.com; s=arc-20160816;
        b=mW1jbdNObD0Hof7Bb9hnkUcy8lSyWIFhizaH5JwjCtHkw8BpCzEB2qwHwg4r64JNj/
         PyN1l5Z7MK1jhtHtWNeAVHL17KYDdTdepzgdD02fA7RMXq4myH1vgIeJSZdDgyzhg1AB
         5LudQefq2CwGBEyiJNEcidYT7mDG5scyU2OHQusyQhtbhN8cGskOkNK6yFyi+fv8tB37
         BDBCkLzd8SNKlRddSF5Jioj0OJDecaPF+XlC66or+iv5mH6eedxwbWz6uczsfM86qW7F
         KJXzHGwdGPVapZy2M92NmoPOs3E4P/hvfRc3n/T1RADaVYNZXBIlXCKohyqbwI9KJO4y
         RTlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=1nsJ1MmjaZKsCOsejIXkeynJuL31VHnlKjT1xjrhQVY=;
        b=AFSkt7QbZFvYtYsljBlB5sg5ngTmS2ondDLk50Ga9aAVYhLX15XQ5jqLh+Ih24BhYR
         1d5QCN0QFMF5ZgBAmvqS9WHwmo7C9VIUQidJPdtrzVPH5NP5Dg9AXtDwykDjfrtdgBob
         vEO3NZHPH7dJCujZlP1HI/WLy0tTYv1UmlzfUS8glXM6jMe+cW97UOI3Pct7tLMHdfyT
         okrDEEYpCi+93jCL8rIkf7kyynt1h69e2jh2vgbLKZ4AuJNewLpbpkm+ZR6vPKgB/9a6
         q5PCTAg2Meo0fctRYZKdzCObjpE0gs/4GIqFIHs2+/x+XOP+7ssiS+jLf+rbAQB+UOu6
         7buw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id y12si80449wrt.1.2020.08.12.03.46.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Aug 2020 03:46:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 07CAk55c014057
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2020 12:46:05 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07CAk5aJ029463;
	Wed, 12 Aug 2020 12:46:05 +0200
Subject: Re: [PATCH V1 2/5] arm64: support inmate cell in AArch32 mode
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200811181641.7282-1-alice.guo@nxp.com>
 <20200811181641.7282-2-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b053b539-ed57-e8a9-943c-7f172343f7ee@siemens.com>
Date: Wed, 12 Aug 2020 12:46:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200811181641.7282-2-alice.guo@nxp.com>
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
> state. Add a member variable cpu_mode to struct public_per_cpu, and
> cpu_mode can use this macro to indicate whether the processor is AArch32
> or AArch64 execution state.
> 
> AArch32 and AArch64 virtual machines use different ARM_PARKING_CODE.
> 0xd503207f and 0x17ffffff are used in AArch64 and 0xe320f003 and
> 0xeafffffd are used in AArch32. Add ARM_PARKING_CODE which is used by

I suppose those magic numbers are the instructions. Are those the same, 
just differently encoded due to the different modes?

> AArch32 in arm64/include/asm/processor.h, and then select which one to
> use by cpu_mode and cpu_mode and arm_cpu_reset().
> 
> When an exception occurs, the processor must execute handler code which
> corresponds to the exception. When the exception is being taken at a
> lower Exception level, the execution state of the next lower level
> (AArch64 or AArch32) will be used. Fill exception handling functions for
> Lower EL using AArch32 in hypervisor/arch/arm64/entry.S.
> 
> Changing to AArch32 happens after the command "jailhouse cell start 1"
> is executed. In arch_cell_reset(), get the mode of cpu owned by inmate
> cell from the member variable .flags which is defined in the configuration
> file of inmate cell. If the inmate cell is AArch32, SPSR_EL2.M[4] will
> be set to 0b1 which means AArch32 execution state, SPSR_EL2.M[3:0] will
> be set to 0b0011 which means Supervisor, and HCR_EL2.RW will be set to
> 0b0 which means lower levels are all AArch32. If the inmate cell is
> AArch64, make sure HCR_EL2.RW is 0 and the other registers are configured
> according to the previous code.
> 
> Changing to AArch64 happens after the command "jailhouse cell destroy 1"
> is executed. Since the cpu owned by inmate cell will be reassigned to
> root cell, get the mode of cpu from .flags of the root cell configuration
> file by arch_cell_destroy().
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
>   hypervisor/arch/arm-common/control.c          | 10 ++++++++--
>   hypervisor/arch/arm64/control.c               | 13 +++++++++++++
>   hypervisor/arch/arm64/entry.S                 |  8 ++++----
>   hypervisor/arch/arm64/include/asm/processor.h |  4 +++-
>   hypervisor/arch/arm64/include/asm/sysregs.h   |  2 ++
>   hypervisor/include/jailhouse/percpu.h         |  2 ++
>   include/jailhouse/cell-config.h               |  1 +
>   7 files changed, 33 insertions(+), 7 deletions(-)
> 
> diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
> index 70793432..c0f9f229 100644
> --- a/hypervisor/arch/arm-common/control.c
> +++ b/hypervisor/arch/arm-common/control.c
> @@ -32,7 +32,10 @@ void arm_cpu_park(void)
>   	enter_cpu_off(cpu_public);
>   	spin_unlock(&cpu_public->control_lock);
>   
> -	arm_cpu_reset(0);
> +	if (cpu_public->cpu_mode == JAILHOUSE_CELL_AARCH32)
> +		arm_cpu_reset(8);
> +	else
> +		arm_cpu_reset(0);

Let's rather use constants for the different magic parking entry points.

BTW, cpu_mode is the same for all CPUs in a cell. Do we really need a 
per-cpu variable then?

>   	arm_paging_vcpu_init(&parking_pt);
>   }
>   
> @@ -169,6 +172,7 @@ void arch_cell_reset(struct cell *cell)
>   	 * starts at cpu_reset_address, defined in the cell configuration.
>   	 */
>   	public_per_cpu(first)->cpu_on_entry = cell->config->cpu_reset_address;
> +	public_per_cpu(first)->cpu_mode = cell->config->flags & JAILHOUSE_CELL_AARCH32;

Overlong line.

>   	for_each_cpu_except(cpu, cell->cpu_set, first)
>   		public_per_cpu(cpu)->cpu_on_entry = PSCI_INVALID_ADDRESS;
>   
> @@ -184,8 +188,10 @@ void arch_cell_destroy(struct cell *cell)
>   	arm_cell_dcaches_flush(cell, DCACHE_INVALIDATE);
>   
>   	/* All CPUs are handed back to the root cell in suspended mode. */
> -	for_each_cpu(cpu, cell->cpu_set)
> +	for_each_cpu(cpu, cell->cpu_set) {
>   		public_per_cpu(cpu)->cpu_on_entry = PSCI_INVALID_ADDRESS;
> +		public_per_cpu(cpu)->cpu_mode = root_cell.config->flags & JAILHOUSE_CELL_AARCH32;

Overlong line.

> +	}
>   
>   	arm_paging_cell_destroy(cell);
>   }
> diff --git a/hypervisor/arch/arm64/control.c b/hypervisor/arch/arm64/control.c
> index 6e1ffebf..661dcd77 100644
> --- a/hypervisor/arch/arm64/control.c
> +++ b/hypervisor/arch/arm64/control.c
> @@ -20,6 +20,9 @@
>   
>   void arm_cpu_reset(unsigned long pc)
>   {
> +	unsigned int cpu_mode = this_cpu_data()->public.cpu_mode;
> +	u64 hcr_el2;
> +
>   	/* put the cpu in a reset state */
>   	/* AARCH64_TODO: handle big endian support */
>   	arm_write_sysreg(SPSR_EL2, RESET_PSR);

This line is only effective for AARCH64 mode.

> @@ -67,6 +70,16 @@ void arm_cpu_reset(unsigned long pc)
>   	/* AARCH64_TODO: handle PMU registers */
>   	/* AARCH64_TODO: handle debug registers */
>   	/* AARCH64_TODO: handle system registers for AArch32 state */
> +	if (cpu_mode == JAILHOUSE_CELL_AARCH32) {
> +		arm_write_sysreg(SPSR_EL2, PSR_32_BIT | PSR_MODE_SVC);

Is that correct? What about the other bits in RESET_PSR that are set for 
AARCH64 at least?

> +		arm_read_sysreg(HCR_EL2, hcr_el2);
> +		hcr_el2 &= ~HCR_RW_BIT;
> +		arm_write_sysreg(HCR_EL2, hcr_el2);
> +	} else {
> +		arm_read_sysreg(HCR_EL2, hcr_el2);
> +		hcr_el2 |= HCR_RW_BIT;
> +		arm_write_sysreg(HCR_EL2, hcr_el2);
> +	}

Reading and writing HCR_EL2 is the same for both cases and should be 
pulled out.

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
> index 0105b109..1d68ec54 100644
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
> diff --git a/hypervisor/include/jailhouse/percpu.h b/hypervisor/include/jailhouse/percpu.h
> index 344ed65f..ece11bc9 100644
> --- a/hypervisor/include/jailhouse/percpu.h
> +++ b/hypervisor/include/jailhouse/percpu.h
> @@ -59,6 +59,8 @@ struct public_per_cpu {
>   	 *  host physical <-> guest physical memory mappings. */
>   	bool flush_vcpu_caches;
>   
> +	unsigned int cpu_mode;
> +

See my comment above.

>   	ARCH_PUBLIC_PERCPU_FIELDS;
>   } __attribute__((aligned(PAGE_SIZE)));
>   
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 6df4a745..2a968dd5 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -56,6 +56,7 @@
>   
>   #define JAILHOUSE_CELL_PASSIVE_COMMREG	0x00000001
>   #define JAILHOUSE_CELL_TEST_DEVICE	0x00000002
> +#define JAILHOUSE_CELL_AARCH32		0x00000004
>   
>   /*
>    * The flag JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED allows inmates to invoke
> 

Approach looks good otherwise.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b053b539-ed57-e8a9-943c-7f172343f7ee%40siemens.com.
