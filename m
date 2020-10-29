Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBU6Y5H6AKGQEYJ6MJEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 8523E29E3A9
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 08:16:36 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id t14sf897742wrs.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 00:16:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603955796; cv=pass;
        d=google.com; s=arc-20160816;
        b=iMi1yuuUaCAsB2WX+LjToW0Y5/ZjoUiPioP+EwxZAFZRIucrZ3ytUQC1GLnKjfGC9Q
         wkZz1ul7V6YABXTH+9tegJJG5NDV6Wq+kbUwam6f1XyqGn8WQd0FYjms+mMXvfz9BaFE
         TpIYE+EkT6zjcLi22qtGHd2250ltAAjhOfrv0ImfNcA11c/Okh0LlCmW5MAa+M5mUm2A
         GO4rkR6fPLJBKZkWeN2VQxieKDQxPIWcIXPwmqqklMY6c1Za9M/58vHmXgHigJydwEYF
         MGHo7PG0kM8GJnll+PSMqg+iJdWZFVKwTSyC6KNRCukkMUIbIo9FlZ5I0a6gLSbDTXVL
         mwOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Kfedd8LtXEQ8qMkpKN4EiO79+26FZ3tWD4kht0ymVdc=;
        b=K4mPBE78rxDrgwNipkqaF8dNgdROpVYxabGJoTiVnXu4YLcOGqWNzYOwY3oaH2UlsB
         8CTbirzzF0et5MbtQ7FgHdVQHSo1oXOTLviHd8g5o06cvEerB392w08TNT/ngHNlVWu7
         hP/cy7xyancgqeXZNBqUK0m0k5k1DoKaxwrBxi9+KlvalJdD9cTz5lhca4RC80a8xMmS
         M0TMNtqNtEw1xtUa0K7+WQQTN5MIHCdJMTW2V0VuBBlRgJsVroTRMkpEpIHQVGTfCYT0
         6pDKsdjZUNv15nb0fnCXyU6ICwNMzygn54TaCPJnGsVTxJqrenVGzMIGjh9WPlo7EfMt
         XyDw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Kfedd8LtXEQ8qMkpKN4EiO79+26FZ3tWD4kht0ymVdc=;
        b=MM/WvJbEve3H7gWS0VaR7gQujq9WPQ6axqAkmg3xkIwp9f8vBBY1zYDHQwTg9My3+Z
         gkCsfWQgGA9+QZM7CxVsN+ELD3hmL7DZ9N7ctZx8WPmZnLYea6EjVwmvkeWFn7NRgoJb
         xgk/yB53QaP/GvH0z7eBL1YVNRXBjczs/wtQdUm8v4OTQMPe/MGW+5if57fXQ7dqF3aD
         RethInWCVzTmvXFf87vRaKgVUSxW4l6/FrWGo4IziYH+Z6kQsOjDItOYddOCQ1Twm6O6
         oanHVmjcus7AbyEgLYh4a/bgym1eApgHXlha2qjJWUe85c3Uv2NrwhQtbBvUzCeelu23
         9Nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Kfedd8LtXEQ8qMkpKN4EiO79+26FZ3tWD4kht0ymVdc=;
        b=QtIoFNKxL3GLDO/DwDemQvut/wiTKz3DNkBSxBHMV3ZafS6b/3QBp6vnTrVMMdvyU9
         dTcdHY9IIeXEewAP68wn/lE3HCLM7oIhGn3anJRIQ8ag4Bl0xASNZmgVaKrj+sBqQJ9Z
         2D56W50QSeSNY6Li1TERw6N9JWxvUN39d0qN+xqoYjdIm+rKntYcEC4mu/BXiK7yrO6o
         Y1Tq/0oglk+uFjX6v0ws0jVgu+lG9WHkQNee2MCGn/dbnAxwlLz38RYDrf/WrStcFD9x
         WWeyEMzDZc0TKyK25a2MSVoj5wABay75Rtc9uT/5qdGdhR//12QwiJ5y7m1vZbPlHVLJ
         Bwhw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5324EcLd2v/4eyDFvbq5aD+rH3dbV3sWToKIaPsPNK+5d8X1MPOz
	2ergRr1GAoI8w6aAj1TdkDw=
X-Google-Smtp-Source: ABdhPJyXoCdA6txi4LkDJFW6Lf87QZa1D9pvQL6yG+rjP/hu9813b9msTuvGVNzSpmzzkZhRsXbpJg==
X-Received: by 2002:a05:600c:230a:: with SMTP id 10mr2771326wmo.151.1603955796288;
        Thu, 29 Oct 2020 00:16:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:6886:: with SMTP id d128ls730643wmc.2.canary-gmail; Thu,
 29 Oct 2020 00:16:35 -0700 (PDT)
X-Received: by 2002:a1c:254:: with SMTP id 81mr2806585wmc.21.1603955795079;
        Thu, 29 Oct 2020 00:16:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603955795; cv=none;
        d=google.com; s=arc-20160816;
        b=Tj6GSONGY6VUFxc9U3K/vBcGFFKk0VxUsGOgGfdlK/AUjM0+kJNOr6AupmE3ePZkix
         BXCGIihtQ7rvDMtsOktt2V+G4U2YmxOnwkQOu3FB7ewRxW3vEW3U8DP9lrcmuF+cFz7N
         UDkNsyvFJbTTHIQxXB9h2yj3QZflo+naunHi+wN5pakuBM4EExeSOCbFyece36o/+n9B
         xn3oCZKboCmLYYORpcU8VL6nygczdVj3YzUrTWlnLOeRSCGZTbnrVhZkTm5tLqxfCIyC
         sGurY2NJqp+oN/WbSxUowcpr1dqfuBLfv4yS+WvXB4ZYoSLe1BIxDroPzdoEw6j3sdMN
         um7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=fyGmiAIX9K8OrzekYFQbwB3ctjurZ+kuFTNN+8H1p9Q=;
        b=IVYpMfkU06ocb9WVcM59CAEq8APM8yE2ooXNTA0xWQKT2EnYHD/2Mk4PRBxqiOWLBc
         3Lod/sAJ66VZsPVWR4BUiZOwlgCGToBDTpnXTi9/4sFOGCZLedHZqKhY6v8Z9NlXLLwW
         V/NTcbXhyQnA+hlSo+k4w+FsZX55diCfjxWFVEA9GJZYsMLpU7gS3Tz9EMvdwUasrYhK
         zvTBj6X3yxN2hRYAvfOD9iauhekjxSb3OWzm8nxXStDyKjwU0PUmZB307r6eSQB+o9kg
         RRDvLRNOQvhoF0/d9VYyrmXd2LlbsnAoNa6K+USPf/cp/zaokFpWVZMtJlIbhb4GKzbA
         m3hQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 91si44229wrs.2.2020.10.29.00.16.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 00:16:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09T7GYM5001651
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Oct 2020 08:16:34 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09T7GXdu025087;
	Thu, 29 Oct 2020 08:16:34 +0100
Subject: Re: [PATCH v2 2/2] inmates: x86: add cache access time test
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20201027214021.407707-1-ralf.ramsauer@oth-regensburg.de>
 <20201027214021.407707-2-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <dfdb3e55-9c2e-a816-4d50-0826940dbfa5@siemens.com>
Date: Thu, 29 Oct 2020 08:16:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201027214021.407707-2-ralf.ramsauer@oth-regensburg.de>
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

On 27.10.20 22:40, Ralf Ramsauer wrote:
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
>  tools/cache-timings.c                    | 29 ++++++++

I was thinking of putting our demo tools into tools/demos/, rather than
starting to fill up tools/.

Jan

>  6 files changed, 150 insertions(+), 3 deletions(-)
>  create mode 100644 inmates/demos/x86/cache-timings-common.c
>  create mode 100644 inmates/demos/x86/cache-timings.c
>  create mode 100644 tools/cache-timings.c
> 
> diff --git a/.gitignore b/.gitignore
> index 4691ff79..89248c17 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -21,6 +21,7 @@ hypervisor/hypervisor.lds
>  inmates/lib/arm/inmate.lds
>  inmates/lib/arm64/inmate.lds
>  pyjailhouse/pci_defs.py
> +tools/cache-timings
>  tools/ivshmem-demo
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
> index e6945cd6..33a39d26 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -35,6 +35,13 @@ KBUILD_CFLAGS += $(call cc-option, -fno-pie)
>  KBUILD_CFLAGS += $(call cc-option, -no-pie)
>  
>  BINARIES := jailhouse ivshmem-demo
> +targets += jailhouse.o ivshmem-demo.o
> +
> +ifeq ($(ARCH),x86)
> +BINARIES += cache-timings
> +targets += cache-timings.o
> +endif # $(ARCH),x86
> +
>  always-y := $(BINARIES)
>  
>  HAS_PYTHON_MAKO := \
> @@ -104,8 +111,6 @@ define cmd_gen_man
>  	sed 's/$${VERSION}/$(shell cat $(src)/../VERSION)/g' $< > $@
>  endef
>  
> -targets += jailhouse.o ivshmem-demo.o
> -
>  $(obj)/%: $(obj)/%.o
>  	$(call if_changed,ld)
>  
> diff --git a/tools/cache-timings.c b/tools/cache-timings.c
> new file mode 100644
> index 00000000..2c591dab
> --- /dev/null
> +++ b/tools/cache-timings.c
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

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dfdb3e55-9c2e-a816-4d50-0826940dbfa5%40siemens.com.
