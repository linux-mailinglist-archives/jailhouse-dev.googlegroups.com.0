Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIXK536AKGQEGHQFWJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DE429FDE8
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 07:39:31 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id j1sf857952lfg.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 23:39:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1604039971; cv=pass;
        d=google.com; s=arc-20160816;
        b=1IygsQ+dB4k7vVTJjEieFBCz189CxJuJ01LNJJlhPzsuR5lNQTzeqeg+JrfYcGZwuQ
         pOm1zqXOVY+SZNUIDIU563fc1uTBMedIMs4ROneApxDYdBdW5Ik0kIrRBh+9C8SD1DbT
         2LGVKGAecYKyrNgibZMaiVTVtWN7bXO73ASbMGHiTNSncwJ5vmiLr3P6qSQVsLQZWcwa
         SlIwZPouIli0Jay+NTul8RGz2l6eUimoXMIWuWnaIj7dvmYcwGLo1v6JhSEnFK8uGrYy
         RSfbjjAQQaBKHd3/w3vrSY8FjfBYLPRavu13kzeJ5DaE8W3nNdMsm1uw3+K8Lm3ViNyH
         Vy3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=O+l4fiLXvoHaWZUrpPyzEt4l1KGNiZA3LzvyTpKXiRk=;
        b=SV86qSsVqZaHnP/Z9rS+O9MsIE+sNQAzJUPWwf+7EQGfhzmzQozs7vu7Xub9XVLHJM
         n/AiF2Qq3aOrKo30ccBZqNb4R1z7iSqUXqq6a0XquE5mBvCpAyoY36q3sn0Lpwp17qGw
         nnm1S3xkYmoTM15cw/X9mIYY8ISrzTsEMYfkyagwngi6VpoDB7boaALxoMCe3vsA3mT3
         Rbvzl2FAACUrWgVIxzesYc3sTXuT5T221SGFp9G6j3zK76uNgMHZEtNM+u2lK1MTds94
         VKf4d0t50k6c+bK8iMtuAIRPejo4UJJTaNuiUuTbnTgWPQVQ7H1KqboKWKXe9s3c7MOx
         +D1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=O+l4fiLXvoHaWZUrpPyzEt4l1KGNiZA3LzvyTpKXiRk=;
        b=n7UOc6nTsRYZpsIhdU4jYzEvWu+w7PP3PyFEIIe4hNQjRyjWlwrQ/vmNs5fZbgX50e
         4FdeCvZ6ZL+PoXTJZD7DqelEV5nf6W1cO5wK+hr4fkxjnNyi74UrvSZS9oRBv9CyQ1ws
         Y2JXrUIy1iw1o/90yl1QPtaRktUucOMkE0yNnc5+FC9FFzgdoe7VRF/1cT4zdb1uSjf+
         g0U3Rtgi/h6XzmiOr6X5HsjaZhkBXn7LoXBLvRIhQDfQ2yB3aj3J8uZyipq6xr/wJwV4
         FUhbKM2qjlpUO7F77C1Tt7jCTyGE1FeDy4Gd6IsiwFvuSR2JR1XgQ2iUodjy+ltOTiCn
         ok7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=O+l4fiLXvoHaWZUrpPyzEt4l1KGNiZA3LzvyTpKXiRk=;
        b=Mi7N6cuPOWaCSdvaGmpcLyjkvDXghxdXXPnY7meqTeiOGG/x9JGy83NRywRBThg30L
         lXqk+vToBIrcUAsnKsjytCpG1suu5QDPOsnZMvKcY49xoNfw892SpCNnJcBTU0GvmgBW
         ZjlMgVCbbsFFX8RnZ70F+/gYstjXF21+LHI0io5885QyAV5kaRC3w8+0xsy5md+t9dCj
         44qDpcZcmgmy+7Vmh8LnNtX9Hh1eArYOTqdjHmIytOqNNDctzGwJ226jFP+lCQGhEx4J
         wOU1N69Ra7jXK/OksAm1tL6Mefij3so45DYgXnF5d4c2wO/Ul1JOL7UlD8OQqm3D4b9u
         NQpQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533NKfqOxa0wbhiEE9u4DB+8DjT3IAD7F3pNgyH7YGtw8znmmetv
	dssXELhjVeXCqbNIEYaayfo=
X-Google-Smtp-Source: ABdhPJzM6UnsuPPQgiQ/ovMXDRYb3XefkY8seZKKwE2KaNM5ZBJsEuas7/Ks4/u2qZEAx3PWrjW+Aw==
X-Received: by 2002:a19:3816:: with SMTP id f22mr312394lfa.210.1604039971126;
        Thu, 29 Oct 2020 23:39:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:890b:: with SMTP id d11ls969543lji.6.gmail; Thu, 29 Oct
 2020 23:39:29 -0700 (PDT)
X-Received: by 2002:a2e:9f42:: with SMTP id v2mr408857ljk.316.1604039969683;
        Thu, 29 Oct 2020 23:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604039969; cv=none;
        d=google.com; s=arc-20160816;
        b=w1EarZIgmYBYC9GgUAMr1oe5PzQAQnrID7RCz0J2QoJONwj5Jz8OkppCJgQIXoLxjB
         TrXMLWtbFW0D5iHSwMgKcKcE6C2CLJCxoD9tKThIjBN7EZsfIxtakuFXFgEsQzJlsDPl
         e69yn+C6ePOduYSVASal8FflcqkBxzZEgDHe6FEVTvA5O8BIeosQhTGKbqhk0LzJ009P
         MnTtvGVeud0uPNc6HxsHi3lsflvKwZq2EK56L1DWAT9sxnXstqDqOHYLrqasoWoulzFV
         YHUQu6fL73qreeg5ZRIjBTi7YaqnBAm/uNFmJEr8Xf5emZrdoSYngIVK6BDbvRprQjp7
         Bx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Iw7MmU/LAZGrYkMW1KISUfRHgUX1jUbuRXurcgDBVAs=;
        b=LU+k9KZumCtv50XE2ir52ukXRc+uP1b6X7RoltOnn47vKgXvaVkpocoo3zOReTcN9b
         bvbXaS/Omwqrpr3rkfS364O18o09wgCx3HZjrm7MjJrDQu18bbKiHbw/KZ0+Q7IGRLSs
         4rrLrrEnKBqAmr00coFHpd0HnObu/+DBWNzq1ONa3iaHlgylir/XxUwedbOuGVjkzsfC
         az7ICl9amaISId3OJ+WM2Prn/Tp4pHBY1XV1f0RJZzucBJZEUQ1ZRZMrzmKkHVsHOjr0
         t/8BDJLGTKPTgFx1ZUyTwXZXtaV4qUIhMmLG12a8gMhTkN8zEGkw760XJDK+kBUyqY4O
         EDiA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id n5si130418lji.5.2020.10.29.23.39.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 23:39:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09U6dSTQ000698
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Oct 2020 07:39:29 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09U6dRMF030647;
	Fri, 30 Oct 2020 07:39:28 +0100
Subject: Re: [PATCH v3.5] inmates: x86: add cache access time test
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20201029145515.386953-2-ralf.ramsauer@oth-regensburg.de>
 <20201029195910.398850-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c8ac3d0e-4ae7-442f-2fd5-bed2df2902ee@siemens.com>
Date: Fri, 30 Oct 2020 07:39:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201029195910.398850-1-ralf.ramsauer@oth-regensburg.de>
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

On 29.10.20 20:59, Ralf Ramsauer wrote:
> On x86_64 systems, this test inmate measures the time that is required to read
> a value from main memory. Via rdtsc, it measures the CPU cycles that are
> required for the access. Access can either happen cached, or uncached. In case
> of uncached access, the cache line will be flushed before access.
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
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
> since v2:
>   - Move host code to tools/demos
> 
> since v1:
>   - Move host code to tools/
> 
> since RFC:
>   - move the inmate to demos instead of tests
> 
>  .gitignore                               |  1 +
>  inmates/demos/x86/Makefile               |  4 +-
>  inmates/demos/x86/cache-timings-common.c | 95 ++++++++++++++++++++++++
>  inmates/demos/x86/cache-timings.c        | 15 ++++
>  tools/Makefile                           |  9 ++-
>  tools/demos/cache-timings.c              | 29 ++++++++
>  6 files changed, 150 insertions(+), 3 deletions(-)
>  create mode 100644 inmates/demos/x86/cache-timings-common.c
>  create mode 100644 inmates/demos/x86/cache-timings.c
>  create mode 100644 tools/demos/cache-timings.c
> 
> diff --git a/.gitignore b/.gitignore
> index 1d8905ab..245733cb 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -21,6 +21,7 @@ hypervisor/hypervisor.lds
>  inmates/lib/arm/inmate.lds
>  inmates/lib/arm64/inmate.lds
>  pyjailhouse/pci_defs.py
> +tools/demos/cache-timings
>  tools/demos/ivshmem-demo
>  tools/jailhouse
>  tools/jailhouse-gcov-extract
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
> diff --git a/tools/Makefile b/tools/Makefile
> index 8cf5df84..62585369 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -35,6 +35,13 @@ KBUILD_CFLAGS += $(call cc-option, -fno-pie)
>  KBUILD_CFLAGS += $(call cc-option, -no-pie)
>  
>  BINARIES := jailhouse demos/ivshmem-demo
> +targets += jailhouse.o demos/ivshmem-demo.o
> +
> +ifeq ($(ARCH),x86)
> +BINARIES += demos/cache-timings
> +targets += demos/cache-timings.o
> +endif # $(ARCH),x86
> +
>  always-y := $(BINARIES)
>  
>  HAS_PYTHON_MAKO := \
> @@ -104,8 +111,6 @@ define cmd_gen_man
>  	sed 's/$${VERSION}/$(shell cat $(src)/../VERSION)/g' $< > $@
>  endef
>  
> -targets += jailhouse.o demos/ivshmem-demo.o
> -
>  $(obj)/%: $(obj)/%.o
>  	$(call if_changed,ld)
>  
> diff --git a/tools/demos/cache-timings.c b/tools/demos/cache-timings.c
> new file mode 100644
> index 00000000..2c591dab
> --- /dev/null
> +++ b/tools/demos/cache-timings.c
> @@ -0,0 +1,29 @@
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
> +void inmate_main(void);
> +
> +#include "../inmates/demos/x86/cache-timings-common.c"
> +
> +int main(void)
> +{
> +	inmate_main();
> +	return 0;
> +}
> 

thanks, applied.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c8ac3d0e-4ae7-442f-2fd5-bed2df2902ee%40siemens.com.
