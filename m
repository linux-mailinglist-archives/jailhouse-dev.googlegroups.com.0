Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZ564H6AKGQEAKC63TY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3D029C46E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 18:56:56 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id t17sf1041032wrm.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 10:56:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603821416; cv=pass;
        d=google.com; s=arc-20160816;
        b=quq57QGyC/52oh48mbAENlmRLXITPvfvh6/J3eMxz4rvWbjtRPXhhIH2FsIctt8738
         WCY/xJecc4Iu7D6d80MhZF9tZ2vt9ZC0goMvNZqiQWy+/mOC9fYteZ8yDdtlzmXvZvIE
         B1Dm9dZB4lLY1lArCF+/cVBRwbISeGFvmFMvIMSpDXgw8FZRDh1V5wtREnMGh1FWuxLM
         p3ApE4rGZo40BF1LXBVEEXGYj0OAZzrQmDw7RpBk1ddW32bB+qRmCy1w3uW9ex5G2qOe
         3P4+GZUstUtHHTFnaVrdeGTgeefQ65Qh6q2yWyruPMarOQsRjexW/XHqYmLCQuLPnidV
         V6oQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=N2r6CIzutqZ7qDjt1t2sYEK4zxF4qm9oMFONyNydpKc=;
        b=EGEDlMK/k6nikzPgXHrAb3DpvaY4SR+OObbxfqDKjFkjmJVtDN0SdsDOZawWYkt/+R
         nfbJknrT3ICCRr38pYELPbXhurR++LWNK3/qa7mBkdB4akXjzuU+yWEAH7M9nRw6cNum
         0BP4kfkY+57t25FbFTlZ2xNfRiNjOgrrp5NiqDFYAPB18Ol+KxzSetb3L+eanROhiKyq
         bEZGpWih2bHp72fgeFHnUEJYNRYxA1if6gkO0+iydHOHQQFM0MhXzmb19GVXmpFDRchH
         SqPLEa8WhI4mQbtlTePCAHU6Fy8dNTgemqPbB0QiWjdxQV31Gc5QBgV1MMCisYG6lh4h
         96LQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=N2r6CIzutqZ7qDjt1t2sYEK4zxF4qm9oMFONyNydpKc=;
        b=jnzLJ0td7PCsMznFtFs2INnQGbNXIF9R/dJh/5L3YERpDPcG50h2C7ltucDV9yQOZ4
         VG7ZDCrT8j8xUmKRZ08BWx4nw8VYYgVIkKk7N0rNtmfgREhkEtL/nd3+wnHgrj6BDbYH
         q5oxgy9VZFON+SrPuFEZDuQTLZu9BjlYnMpAGvBgM4F1EPVjlq8fegdpjSvsKQEXb0AD
         YUo3tsYSdw3Pbr3xODgxI0yA6Wkt5ikS9LBQ8dmKGz4D8k29nmeNAXBCkcpNWoBRuKML
         PRzubu7z4qYt+IY+5qZketLikvP1IFWv4O0iJldcpDmPYg5QdB9I1dxobV39XaPz1zIm
         Gbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=N2r6CIzutqZ7qDjt1t2sYEK4zxF4qm9oMFONyNydpKc=;
        b=OAKtRKWd9aNlQf1luUB7Te55zZx95SZag55Tcix6b+V5adkEDFYK9uGNJnAygzznRk
         DgJOBAeW3e1/ZGr1giDihBCrtIGG5dYDyQA+KH+hIRcuVJ/oPHfVePvAEz4QdgESaIUG
         AnJ0SRxxTYdOZb1d6bKTLmOW1xUZqjkatwG+rfSXpJVza2I3iGx6oLM82h/wAbeREMxP
         YgE6AY4ssdEHCyBnCUJjCnK+pmjD4ePp5b5K2ziqnI4nsmfjbbiGMCiGqdihKfRPJk+S
         +a5zlNm/leT6Gzxj/5iUsnNrM2FGpLMt+Y67X7aF62WInql1GE5R9WQ98tjZh+tzh2VZ
         dDGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533o2No0zcxa0IFwbeWUsMBrEqeL8edxkUBVqOsdiFPKcmjheJdS
	5EEu6b4JooYWGFIQU6AJBOo=
X-Google-Smtp-Source: ABdhPJwGS5r2b+P9zBhKa0g6k6UpkCaYeQPQ0zV/LCK8gMxf6jxiFEIHRmpnWYgA6onKGXGf+HCHdA==
X-Received: by 2002:a5d:6345:: with SMTP id b5mr4384730wrw.288.1603821415681;
        Tue, 27 Oct 2020 10:56:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7e4e:: with SMTP id z75ls1317975wmc.0.canary-gmail; Tue,
 27 Oct 2020 10:56:54 -0700 (PDT)
X-Received: by 2002:a1c:2108:: with SMTP id h8mr3926317wmh.63.1603821414373;
        Tue, 27 Oct 2020 10:56:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603821414; cv=none;
        d=google.com; s=arc-20160816;
        b=If5MftEAO01BO59OdwWqjBFL7qnUgk0AoW39mTy5KcMsYcvmxwgEm81Wd+WjRVEA2i
         FFuZOd4Xye9Pr8QLiEM1WjeLKPMd27hvQzV5U0zlSMPvfKsiuP9fuzYMw/pAu69hKHKK
         bCMi0KZI521IQJcK0B6c5qUq3qqBvW2iqaCn3T9kFLMesaaGzhtKJiLBrgmz7VcH/we6
         eSQF0OraO7hxnYISR+f4UdRVtYTc+kfU86f2tj1QgoDQGVPVvzoTPdoVUekGrk2m3+zn
         LiYEbQDoDckcQjJVBMRQVA7fzk2a7K6MJMvLmuKH52wKyOR2AElvKj84BKLUICWYGi2c
         eE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=qoZ+8IiHfV7995gfCeOK1tyKrDV20/29Hr2gSoxBzfs=;
        b=EZ0owXhcXOJ6b1K3CtRRkvKTJa0fThJVzTOEVRNYUZg7YeSr5XIchL6zaCaYE99Dvm
         oMaWhaCpwB6QJM7fLpJ1dBaF78DzMueh5SkBxwr+uTbHRye6GMS7bHywKTJmjTT4iH/R
         nRg2UaDfK+AsTuiIuAw5++mHyeMlCzKHMn/Bcx0X0tzPJRSIhzmb2nIR5+fxCN4ATSPQ
         UVPkxgcbCtIaEFq4G67SNIc7aOsenQN+AwlGNsM1K+vte4MjjW+Yq8f3z2iw31kRE+ad
         UhVZOk8GH8jwCFslZQYvmLCUUXN55G2zQ8u4rtNgkoyTGFo6WNqCXTAbzb0d1kUMSFEC
         rgog==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id k3si49809wrl.5.2020.10.27.10.56.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 10:56:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09RHuro3013934
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 18:56:53 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09RHurho012983;
	Tue, 27 Oct 2020 18:56:53 +0100
Subject: Re: [PATCH] inmates: x86: add cache access time test
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20201026131107.266498-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5edb7ee8-cacd-b658-3511-9a8cb21681c2@siemens.com>
Date: Tue, 27 Oct 2020 18:56:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201026131107.266498-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
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

On 26.10.20 14:11, Ralf Ramsauer wrote:
> On x86_64 systems, this test inmate measures the time that is required
> to read a value from main memory. Via rdtsc, it measures the CPU cycles
> that are required for the access. Acces can either happen cached, or

"Access"

> uncached. In case of uncached access, the cache line will be flushed
> before access.
> 
> This tool repeats the measurement for 10e6 times, and outputs the
> average cycles that were required for the access. Before accessing the
> actual measurement, a dummy test is used to determine the average
> overhead of one single measurement.
> 
> And that's pretty useful, because this tool gives a lot of insights of
> differences between the root and the non-root cell: With tiny effort, we
> can also run it on Linux.
> 
> If the 'overhead' time differs between root and non-root cell, this can
> be an indicator that there might be some timing or speed differences
> between the root and non-root cell.
> 
> If the 'uncached' or 'cached' average time differs between the non-root
> and root cell, it's an indicator that both might have different hardware
> configurations / setups.
> 
> The host tool can be compiled with:
> $ gcc -Os -Wall -Wextra -fno-stack-protector -mno-red-zone -o cache-timings ./inmates/demos/x86/cache-timings-host.c

Maybe put that in the source code as comment?

> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
> 
> since RFC:
>   - move the inmate to demos instead of tests
> 
>  inmates/demos/x86/Makefile               |  4 +-
>  inmates/demos/x86/cache-timings-common.c | 95 ++++++++++++++++++++++++
>  inmates/demos/x86/cache-timings-host.c   | 27 +++++++
>  inmates/demos/x86/cache-timings.c        | 15 ++++
>  4 files changed, 140 insertions(+), 1 deletion(-)
>  create mode 100644 inmates/demos/x86/cache-timings-common.c
>  create mode 100644 inmates/demos/x86/cache-timings-host.c

We already have tools/ivshmem-demo.c which already produce a Linux demo
binary for a cell. Maybe stick cache-timings together with that
ivshmem-demo into a tools/demos/ folder? Then you can actually compile
it (for x86-only, obviously) and can drop my remark above.

>  create mode 100644 inmates/demos/x86/cache-timings.c
> 
> diff --git a/inmates/demos/x86/Makefile b/inmates/demos/x86/Makefile
> index f53b739e..47b79869 100644
> --- a/inmates/demos/x86/Makefile
> +++ b/inmates/demos/x86/Makefile
> @@ -13,7 +13,8 @@
>  include $(INMATES_LIB)/Makefile.lib
>  
>  INMATES := tiny-demo.bin apic-demo.bin ioapic-demo.bin 32-bit-demo.bin \
> -	pci-demo.bin e1000-demo.bin ivshmem-demo.bin smp-demo.bin
> +	pci-demo.bin e1000-demo.bin ivshmem-demo.bin smp-demo.bin \
> +	cache-timings.bin
>  
>  tiny-demo-y	:= tiny-demo.o
>  apic-demo-y	:= apic-demo.o
> @@ -22,6 +23,7 @@ pci-demo-y	:= pci-demo.o
>  e1000-demo-y	:= e1000-demo.o
>  ivshmem-demo-y	:= ../ivshmem-demo.o
>  smp-demo-y	:= smp-demo.o
> +cache-timings-y := cache-timings.o
>  
>  $(eval $(call DECLARE_32_BIT,32-bit-demo))
>  32-bit-demo-y	:= 32-bit-demo.o
> diff --git a/inmates/demos/x86/cache-timings-common.c b/inmates/demos/x86/cache-timings-common.c
> new file mode 100644
> index 00000000..0edf65e6
> --- /dev/null
> +++ b/inmates/demos/x86/cache-timings-common.c
> @@ -0,0 +1,95 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) OTH Regensburg, 2020
> + *
> + * Authors:
> + *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#define ROUNDS	(10 * 1000 * 1000)
> +
> +union tscval {
> +	struct {
> +		u32 lo;
> +		u32 hi;
> +	} __attribute__((packed));
> +	u64 val;
> +} __attribute__((packed));
> +
> +static u32 victim;
> +
> +static inline void clflush(void *addr)
> +{
> +	asm volatile("clflush %0\t\n"
> +		     "mfence\t\n"
> +		     "lfence\t\n" : "+m" (*(volatile char *)addr));
> +}
> +
> +#define MEASUREMENT_OVERHEAD	"nop\t\n"
> +#define MEASUREMENT_COMMAND	"mov (%%rbx), %%ebx\t\n"
> +#define DECLARE_MEASUREMENT(name, flush, meas) \
> +	static inline u64 measure_##name(u32 *victim)			\
> +	{								\
> +		union tscval before, after;				\
> +									\
> +		if (flush)						\
> +			clflush(victim);				\
> +		asm volatile("mov %4, %%rbx\t\n"			\
> +			     "lfence\t\n"				\
> +			     "rdtsc\t\n"				\
> +			     "lfence\t\n"				\
> +									\
> +			     meas					\
> +									\
> +			     "mov %%eax, %%ebx\t\n"			\
> +			     "mov %%edx, %%ecx\t\n"			\
> +			     "lfence\t\n"				\
> +			     "rdtsc\t\n"				\
> +			     "lfence\t\n"				\
> +			     "mov %%ebx, %0\t\n"			\
> +			     "mov %%ecx, %1\t\n"			\
> +			     "mov %%eax, %2\t\n"			\
> +			     "mov %%edx, %3\t\n"			\
> +			     : "=m"(before.lo), "=m" (before.hi),	\
> +			       "=m" (after.lo), "=m" (after.hi)		\
> +			     : "m" (victim)				\
> +			     : "eax", "rbx", "ecx", "edx");		\
> +		return after.val - before.val;				\
> +	}
> +
> +DECLARE_MEASUREMENT(overhead, false, MEASUREMENT_OVERHEAD)
> +DECLARE_MEASUREMENT(cached, false, MEASUREMENT_COMMAND)
> +DECLARE_MEASUREMENT(uncached, true, MEASUREMENT_COMMAND)
> +
> +static inline u64 avg_measurement(u64 (*meas)(u32*), u32 *victim,
> +				  unsigned int rounds, u64 overhead)
> +{
> +	u64 cycles = 0;
> +	unsigned int i;
> +
> +	for (i = 0; i < rounds; i++)
> +		cycles += meas(victim) - overhead;
> +	return cycles / rounds;
> +}
> +
> +void inmate_main(void)
> +{
> +	u64 cycles, overhead;
> +
> +	printk("Measurement rounds: %u\n", ROUNDS);
> +	printk("Determining measurement overhead...\n");
> +	overhead = avg_measurement(measure_overhead, &victim, ROUNDS, 0);
> +	printk("  -> Average measurement overhead: %llu cycles\n", overhead);
> +
> +	printk("Measuring uncached memory access...\n");
> +	cycles = avg_measurement(measure_uncached, &victim, ROUNDS, overhead);
> +	printk("  -> Average uncached memory access: %llu cycles\n", cycles);
> +
> +	printk("Measuring cached memory access...\n");
> +	cycles = avg_measurement(measure_cached, &victim, ROUNDS, overhead);
> +	printk("  -> Average cached memory access: %llu cycles\n", cycles);
> +}
> diff --git a/inmates/demos/x86/cache-timings-host.c b/inmates/demos/x86/cache-timings-host.c
> new file mode 100644
> index 00000000..229db904
> --- /dev/null
> +++ b/inmates/demos/x86/cache-timings-host.c
> @@ -0,0 +1,27 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) OTH Regensburg, 2020
> + *
> + * Authors:
> + *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <stdbool.h>
> +#include <stdio.h>
> +
> +#define printk printf
> +
> +typedef unsigned int u32;
> +typedef unsigned long long u64;
> +
> +#include "cache-timings-common.c"
> +
> +int main(void)
> +{
> +	inmate_main();
> +	return 0;
> +}
> diff --git a/inmates/demos/x86/cache-timings.c b/inmates/demos/x86/cache-timings.c
> new file mode 100644
> index 00000000..1acc3ee9
> --- /dev/null
> +++ b/inmates/demos/x86/cache-timings.c
> @@ -0,0 +1,15 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) OTH Regensburg, 2020
> + *
> + * Authors:
> + *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <inmate.h>
> +
> +#include "cache-timings-common.c"
> 

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5edb7ee8-cacd-b658-3511-9a8cb21681c2%40siemens.com.
