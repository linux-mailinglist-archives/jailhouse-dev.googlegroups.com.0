Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBL55QLWQKGQENWTPFLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CA0D4413
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 17:24:31 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id c188sf2913852wmd.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 08:24:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570807471; cv=pass;
        d=google.com; s=arc-20160816;
        b=fFirV9sAroEpSPfsj1Stp4guUJwW+UFwl0idpYiGv6xBqM07mIAbR1sw9fCdTsRSBx
         Kh0cSuBeBKK8t4ypp8ED5YMqEW1G8fznzzxh5kkQrD3C4bamRP8WgP8OIWTenwebCHup
         tmkTnCwoMPJ2UBrjPbzxvVvQNbXYvZ8vvgJjjIgSqikfd1RtDoKE9gn7Kz19+HcsD1X4
         ZEHO6Vj+I1X0XWE7ekVO3ZbnZI4I7YiW7+3+PLSm1QigoyD9N8IbMcbWXCGMHSU0Izlr
         gqzHrZDLybaG+KJ1eIKpOeAn1FplDaO3SNnexdpqKZWPr4w9KtpC58nYIPgYuN5mXYj2
         2yIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=goCXGv007CzoFymsqYIBHxfVzIzr4ciKaB/xJcqauk4=;
        b=JaE6+suhRTGEnOTeMtEUGGFiAARxl9jpqI+/Oln41S6JFFDAsRNUbh/eKVZaIvPkJF
         YUIOy//I4l3+1soYJLC6Qgprn9+10gZuObeV4pdqWLKuzt5S+QQz4NNQvnmpvZHMAMxV
         ffLc5O2+wu8UrY8PeGPtMoh5otyfQi1mFHFkl8OPQLK6nDoX78ZP9QJlOJTlZEWFyBnn
         YOwbnRCKV0nL48BUHPpro1vNRdpDuzz3IlLIiUBfhvQruxtmmQftMKaaEGIRuTfqfcu/
         ZyuvsWe2HVcAKPQ688OL7Lb6mvjmdh7nfzWXBqmAc9RfjDD68LMOx/SEAhKKnCPq/I6x
         JvBw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=goCXGv007CzoFymsqYIBHxfVzIzr4ciKaB/xJcqauk4=;
        b=TYCRaUWkh1u7/r6pivt4ZC1H/W6j2wVtHnc0fXiXC+4uMFNO0/gzLdeSecdSqAJWLO
         Xsjh9EtAPQr64G6PIt/4CBStyVtzxywLu877ZBaBMws9yKgl1F0R2Ybpauw9DjLRfhyV
         jmUoWa2mDISRTX6kvhLOHkyz8AQbSk5dBC+UuPe2ywHIywIoyaTlhED02+MhjaNa268T
         gGrYTtRq+2NGeRT2kd2atFU0V6VlVcpurvsCg5DRjIHjy7stz4c5O5ako5aZdl70Dxds
         kdM3TDxxqf3JGhWy68M7uRx5Ybm3GewSCSq+lkvFNo08Di2DeiYNNqJdBOR7h7eIFutM
         dMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=goCXGv007CzoFymsqYIBHxfVzIzr4ciKaB/xJcqauk4=;
        b=iRS9LmaU4MDAGQxtfyBVl1DdD8j/a7t19m/Tc3+wLDJbxQ2PCNmrGRNLIKBzGPVEqw
         9QJm1lPj36fecCYPoN8OPC01GKLaksV4yR3j8Lx81NaovZ4NAcazJ7G8cDYPGYon099s
         BW6++a2xO6U9qc8k5sHBAXLxPHq1DCZQ5Gi7BkDygSVumWuY2b3ocN+/iFKyxu3zaHnC
         FZVqVuLdG9JRgD82apRrJWaY1MWJQOhhF32XaMq9vs4Iopbur+PBvoO6k0QtYcQg9eEJ
         KS+kiJpASusIQzyxLIo4t3QPckrZseI6UKSIHGjFQ11DaNPdob2opgGPJCKsy67xciuO
         F5gw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW0QPB9bkQg2lddaDW4jHjBx4pjpmXz8BTEjals1E4vB+LEu6Vz
	l8/3XyHsUeniz1Chh31gdvc=
X-Google-Smtp-Source: APXvYqz3PU+uP9F43pzGBS8HfMEA7fffRZTXB/Tlu7Gr7xJqfu0amA3MsxukgXcX2xE6jj+Bep0pqw==
X-Received: by 2002:a5d:4ed2:: with SMTP id s18mr13176345wrv.52.1570807471461;
        Fri, 11 Oct 2019 08:24:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4c42:: with SMTP id n2ls2711465wrt.8.gmail; Fri, 11 Oct
 2019 08:24:30 -0700 (PDT)
X-Received: by 2002:a5d:498a:: with SMTP id r10mr1387950wrq.260.1570807470730;
        Fri, 11 Oct 2019 08:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570807470; cv=none;
        d=google.com; s=arc-20160816;
        b=JQS5nuUP1UPKSxNiosPA84W/CuBRNzcMz7mr+en2fnC+AdcnzVW96hpS+F0J4EbPDT
         6DTLp+zXnzf3q0N3zKE0ROeIAK1SBX+BbWxNtUKJXkCIv7J0rwBBgdi7gOuSQs+yiRej
         0bgfmJ2FvUhny9i/U4A4EZBw2lthqwe9w025KNvem7svije3kTCCVWigPPdgyYNZSefV
         m4+y0/EiBXhFCbX1uAbsGBCfC99bC1Iz7ifTHBZCwod/OeCAd5fYFpwCjdZS5sSry0pk
         3TjYYLarKRPJAZ1Bk+puJnLP9UiPPS5GBzWLER9zldogwakpYcIB6EEfnIh/3H/ZctZv
         PWtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=StUAjkJUmGHNxyrkDA234itiaJrsB67P/McZuXakbCQ=;
        b=VjhUZ14bwCI7AiFAKuOob18MTKJt/MT3KBTxeIbzbNJtb+2sijdemnHsuTBm4LWNJC
         aoAbv33OWK7Fsx2jVlDjpgBTJFAixflk7m4BlGMEpN1YsD+dOQ5kZBO4pm3m4kyEO0gt
         5mJ00hR9mMQ5PJWvCN9L8Nv6YRLAXwC02uKDCqBLsXhUFdDOXmOlPMeICbBhoqYnWxmG
         v044h+vvgqgdPgOQX6ZHr7U1TU3F+CvP8EhFD42qXgkcdqRwdH4H2NBP+017CEJi+bCD
         BVXsLe9AX6wON0jWPRn2ulhXocJW+hyk55teQflb479mx5KF+F6I+8lVgwrXBLTh6x3H
         ajnw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id p12si208423wmg.0.2019.10.11.08.24.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 08:24:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x9BFOUN4001680
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Oct 2019 17:24:30 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9BFOTHv008672;
	Fri, 11 Oct 2019 17:24:29 +0200
Subject: Re: [PATCH 3/4] arm: am57xx: introduce support for TI am57xx SOC
To: Vitaly Andrianov <vitalya@ti.com>, jailhouse-dev@googlegroups.com
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
 <1570731650-5335-4-git-send-email-vitalya@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0b85c51a-0078-47fb-70ba-a8f9def7b852@siemens.com>
Date: Fri, 11 Oct 2019 17:24:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1570731650-5335-4-git-send-email-vitalya@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 10.10.19 20:20, 'Vitaly Andrianov' via Jailhouse wrote:
> This commit introduces support for TI AM57xx SOC. Original support was done
> by Jan Kiszka for v0.7 version, but wasn't upstreamed yet.
> 

This lacks a design description. Even for me, because I always need to 
recall the non-trival logic here.

IIRC, SMP cores on that platform are brought up during boot by writing 
their continuation address into a mailbox (OMAP_WKUPGEN_BASE + 
OMAP_AUX_CORE_BOOT_<CPU>). They stay in that WFE state - how do we kick 
them out of this, normally as well as while under Jailhouse control? 
Where does the code for this checker loop come from when Jailhouse is in 
charge? Should Jailhouse better provider it, like we do on x86 (look for 
parking_code)?

For reference (should ideally go into the commit log or some comment as 
well): AM572x TRM, section "33.3.4.1. Startup".

> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
> ---
>   hypervisor/arch/arm/Kbuild   |  2 +
>   hypervisor/arch/arm/am57xx.c | 98 ++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 100 insertions(+)
>   create mode 100644 hypervisor/arch/arm/am57xx.c
> 
> diff --git a/hypervisor/arch/arm/Kbuild b/hypervisor/arch/arm/Kbuild
> index e1bec1b..2ef89c3 100644
> --- a/hypervisor/arch/arm/Kbuild
> +++ b/hypervisor/arch/arm/Kbuild
> @@ -26,3 +26,5 @@ lib-y += mmu_hyp.o caches.o
>   #  gcc7 will bring a new function attribute "no_profile_instrument_function"
>   #  should switch to that for higher granularity, but gcc7 is not even there
>   CFLAGS_mmu_hyp.o += -fno-profile-arcs -fno-test-coverage
> +
> +lib-$(CONFIG_MACH_AM57XX) += am57xx.o
> diff --git a/hypervisor/arch/arm/am57xx.c b/hypervisor/arch/arm/am57xx.c
> new file mode 100644
> index 0000000..1aa2328
> --- /dev/null
> +++ b/hypervisor/arch/arm/am57xx.c
> @@ -0,0 +1,98 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) ARM Limited, 2014
> + * Copyright (c) Siemens AG, 2016
> + * Copyright (c) Texas Instruments Incorporated, 2019
> + *
> + * Authors:
> + *  Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> + *  Jan Kiszka <jan.kiszka@siemens.com>
> + *  Vitaly Andrianov <vitalya@ti.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/control.h>
> +#include <jailhouse/mmio.h>
> +#include <jailhouse/printk.h>
> +#include <jailhouse/unit.h>
> +#include <jailhouse/percpu.h>
> +#include <asm/control.h>
> +#include <asm/psci.h>
> +#include <asm/smccc.h>
> +#include <asm/setup.h>
> +#include <asm/traps.h>
> +#include <asm/sysregs.h>
> +
> +#define OMAP_WKUPGEN_BASE	0x48281000
> +#define OMAP_AUX_CORE_BOOT_0	0x800
> +
> +const unsigned int smp_mmio_regions;

Unused.

> +
> +static void *wkupgen_base = NULL;
> +
> +static int am57xx_init(void)
> +{
> +	wkupgen_base = paging_map_device(OMAP_WKUPGEN_BASE, PAGE_SIZE);
> +
> +	return (wkupgen_base == NULL) ? -ENOMEM : 0;
> +}
> +
> +static int am57xx_cell_init(struct cell *cell)
> +{
> +	return 0;
> +}
> +
> +void suspend_cpu(unsigned int cpu_id);
> +static void am57xx_cell_exit(struct cell *cell)
> +{
> +	unsigned int cpu;
> +	for_each_cpu(cpu, cell->cpu_set) {
> +		public_per_cpu(cpu)->cpu_on_entry =
> +			mmio_read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
> +				    cpu * 4);
> +		public_per_cpu(cpu)->cpu_on_context = 0;
> +		suspend_cpu(cpu);

Why do we need suspend_cpu? It is suspended when the cell destruction 
starts (via cell_suspend), i.e. before this call.

> +		arch_reset_cpu(cpu);

This resumes the CPU already here. Partly explains my questions on the 
top: We have no signal, we kick the re-assigned root cell cores off 
immediately.

Start address is what Linux defined for its original boot by filling 
OMAP_AUX_CORE_BOOT_<CPU>. We are lucky still being able to read this 
value back above...

There is really no signal we could take that Linux sends when logically 
onlining the CPUs again after cell destruction?

BTW, what happens when you manually offline a CPU before assigning it to 
new cell? Then the Jailhouse driver will not online it on destruction, 
but we kick it off unconditionally, don't we?

> +	}
> +}
> +
> +int arch_handle_smc(struct trap_context *ctx)
> +{
> +	unsigned long *regs = ctx->regs;
> +
> +	switch (regs[12]) {
> +	case 0x102:
> +		arm_write_banked_reg(ELR_hyp, regs[0]);

This is probably "API_HYP_ENTRY" for the kernel - is there an official name?

My current understanding is that Linux runs this during 
omap5_secondary_hyp_startup normally in the hope to be taking into HYP 
mode at the specified (r0) address. We simple jump there, but not in SVC 
mode. Works by luck with Linux, right?

> +		return TRAP_HANDLED;
> +	case 0x109:

This is OMAP5_DRA7_MON_SET_CNTFRQ_INDEX according to Linux, and we 
should leave some words why we can simply call that smc on behalf of the 
guest. I added it back then because "then it works", not because of "I 
fully understand what I'm doing".

> +		asm volatile(
> +			".arch_extension sec\n\t"
> +			"push {r0-r12, lr}\n\t"
> +			"mov ip,%0\n\t"
> +			"mov r0,%1\n\t"
> +			"smc #0\n\t"
> +			"pop {r0-r12, lr}\n\t"
> +			: : "r" (regs[0]), "r" (regs[12]));
> +		arch_skip_instruction(ctx);
> +		return TRAP_HANDLED;
> +	}
> +
> +	if (SMCCC_IS_CONV_64(regs[0]))
> +		return TRAP_FORBIDDEN;
> +
> +	if (IS_PSCI_UBOOT(regs[0])) {

This path is here because non-root Linux is told to use PSCI for SMP 
management, right?

> +		regs[0] = psci_dispatch(ctx);
> +		arch_skip_instruction(ctx);
> +		return TRAP_HANDLED;
> +	}
> +
> +	return handle_smc(ctx);
> +}
> +
> +DEFINE_UNIT_SHUTDOWN_STUB( am57xx );

...(am58xx);

> +DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB( am57xx );
> +DEFINE_UNIT( am57xx, "AM57XX" );
> +
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0b85c51a-0078-47fb-70ba-a8f9def7b852%40siemens.com.
