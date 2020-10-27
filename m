Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQVY4D6AKGQEPBFHOVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 4728629ACE0
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 14:10:27 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id b23sf571879wmj.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 06:10:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603804227; cv=pass;
        d=google.com; s=arc-20160816;
        b=paxVZ/HmAWxORWOeYzVv2K6GdDU9cjsxtWS5GpeKQsIshuBQzXFOQ6DoAKro5tF7kp
         vBGmajI17AlY25Va1/V8XPi//B+fIUrUxskqO7UZhx7P9yVQDaViX0VxK7OWPDzneovz
         3kWCrfNbL0QS9Q6d2WPdjucZsvxlznDkkBY34LSQ0qVaNCveJFfLruIGJR1d8HbRVptF
         0Ez8MZhNpFkem5zP0RmgCzn4cwcG6n66bX39gu+MOXltvyMPJDpS0alq32gnAAuGrcfC
         XTWjDHzPTlMOSdYuVrrvh1AicEK0TjDnVGIyyzgFr+3BlscdtkssSy9N/i9lbtZ7pVgY
         rkog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Tz4Pz4cvmYhp4CKvd9Hcyp5edxtbpPym0vuDs9LEhFU=;
        b=dRX5upPadJUPuu+G9XJUFo5H30iGkmucqQKliJlB+Dtq8OzAGhJPAUxJTReiFepOC9
         U78ZdxQvWN7kRXULx8DzwWrsOuXu2DCmvIO5f3WDqtr/tuGrlnQdODpNk6YICza0Y+/c
         n0NiI1DMP43ezvQ+ExJhhhAiNz5r3xDCWBN+OkjNnGxaDBo0IADGi4yTyp0R5vJEjlGX
         Ydyx59SLpCJqmf3zLR9GgWTAB8vhAnTR6Fe6rpKgQyWnGWX2qHaA+VU4bLCOJFA2Uo6o
         vOCXdOe46S3khNDubruRaJAA0BH7nbNeH25NlYZf69U3P+BDoOPaqCcUD8IDiL+sXkoP
         2rQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Tz4Pz4cvmYhp4CKvd9Hcyp5edxtbpPym0vuDs9LEhFU=;
        b=OltKE0/NBd7pp+ZDbCbzzdcGm5Tfmu2uWu0bF8YWppDwLTN/arVlgG5ULp+A4Z8M8z
         gPMfvjDSgOkh2OGFgPDecmvsoqnyNelZ0CiabpiwKdTDHlcm0Oo+rxDLYYzZe480Z5Nr
         mA0T3A1QTwI5Awve1qIvcJt5B7UrVDdxsVEpOT6XvwLpoA6yj2fJyXQJJMFjkZV6RZhm
         fwd6iZLopgo1Wk9+vkpr5Of2ph+gsDdoY3g0hquIdfGDjzRvzxIVt5GdSjaRiXWb78XQ
         F7ZgyW13MrbEOKXxRgqifCBwVjUAwNpJNBkbyar4QCd8mP23k8EhMUtfL2dauhUHAv1C
         efrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Tz4Pz4cvmYhp4CKvd9Hcyp5edxtbpPym0vuDs9LEhFU=;
        b=k6vB5Rnvqf00Rrbn9tD2U7tGc9gD4aAYhHfABY1gvFgeAzHkqCbsiPJCT16UbLXNaM
         mGMythHr+1qHFB6zFVlCuHI0bWSWZy3AGH4llMylPYRO8Em1obDRJrHt5EuK1dHZH++v
         5jANCRnQm8gP046o+vIR9D6Sfb65EAxcSIX727CiSyzQIx7JIyj2M8hhcvhh1T+YmLaS
         1OIvNpfgh1ls28Nz5qNuhdGVKVSOqiOVZMRDDwFHsqYzzJM+yDr9yCVSDzOqYePri6Kw
         PKw1XKvBH+cqYARCML0gi0pKjMRS4JXF2zUGHQRAqC1xOQDmoDKT5GlETgb2A8t6Ugga
         TLhQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532QX0BO2L+Yb0PeZjtvRYyGwSOmew5xSNK4uPrmVeJWEh2xyqtM
	kDBh4k1SXWhw8M6ttIOZHuU=
X-Google-Smtp-Source: ABdhPJze0yqLkrSDV8UckkM3qCh5wboKDkqe/N8aXqilvqnUQAbQX9QDcg0J+OevM96f0WNSOGF9HQ==
X-Received: by 2002:a5d:66d2:: with SMTP id k18mr3018737wrw.229.1603804226918;
        Tue, 27 Oct 2020 06:10:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7e4e:: with SMTP id z75ls829869wmc.0.canary-gmail; Tue,
 27 Oct 2020 06:10:25 -0700 (PDT)
X-Received: by 2002:a1c:254:: with SMTP id 81mr2756916wmc.21.1603804225777;
        Tue, 27 Oct 2020 06:10:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603804225; cv=none;
        d=google.com; s=arc-20160816;
        b=tJ/sv+W2GbT8nbdwMAqbJYw/nEXMJ6SRn0PDrNM0o+KPkBPVEom/T8ognY7P+ebrsU
         tLfDVIuuMlpN26c/4USRKMdAINKS/dxNbJyf1MoYULBSrCTeZeL72KPdJo8xC63IleGz
         Q3KhEAeTO+Rhbg52I+JY9cS/BHGaupewxIp3laVZcn2QZRaxywOzHPA0U++C8ARAxiJJ
         m9HU1RzRtm5RGqFPIbrX/bqpE7s6bXKfTes688hn+b8mlHaMypqERn7ESFhP2qi4G6rr
         4fMJRDMKWvn3jnRTEolHkYiUYGWJ0be3JVIA/zfwolEyMaI8NJ5yI42ab8S1zd/UGx8f
         GmfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=5B7ZE7Bl8DOK9uJVLuRgKlMHNf4Rz4o52fAb3lcYwkg=;
        b=nrwzOrjwYIBU8JkhC/bJeXqH8DythIJlXpoPnXZRQHLDQWhg7CVj6wzdHjalhB30iC
         9/dA5nEl4DmI6LWQ8VqK1ipP6Z5dME4c0L34N8IJj1UFlYS1ecJCO8uggn2tYIOMzqve
         n0OMJr20EL1D/+Vq5i5BGlpcTqs5Mc6QxILLn2Pji+28hX2tgWKta4TLTG1KQPLloRs5
         lMf9b0dBnInfS7Ug/lg08D+mV8jguAcel2vHphKxmSkEtYs2sncvEgeBIRw2UUP+EDbY
         jm0m+L0pvdBXTTdyKDwb/DDslO2+qOwK0yjBbP3wQ7G2SNM+PwTHXnJ2mwvoxrZayXBP
         goGg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 91si31487wrs.2.2020.10.27.06.10.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 06:10:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09RDAPJ4021455
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 14:10:25 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09RDAPQM025916;
	Tue, 27 Oct 2020 14:10:25 +0100
Subject: Re: [PATCH v2 12/33] hypervisor, arm-common: provide an explicit uint
 INVALID_CPU_ID
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-13-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <12a22fcd-2e7c-8d03-195b-b363f8e34019@siemens.com>
Date: Tue, 27 Oct 2020 14:10:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022175826.199614-13-andrea.bastoni@tum.de>
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

On 22.10.20 19:58, Andrea Bastoni wrote:
> Substitute the implicit "-1" occurrence for an invalid CPU id with an
> unsigned int INVALID_CPU_ID that can be used in all "uint-related"
> comparisons.
> 
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/arch/arm-common/lib.c       | 2 +-
>  hypervisor/arch/arm-common/psci.c      | 4 ++--
>  hypervisor/control.c                   | 2 +-
>  hypervisor/include/jailhouse/control.h | 5 +++--
>  hypervisor/setup.c                     | 4 ++--
>  5 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/hypervisor/arch/arm-common/lib.c b/hypervisor/arch/arm-common/lib.c
> index 916cd54f..889b3d14 100644
> --- a/hypervisor/arch/arm-common/lib.c
> +++ b/hypervisor/arch/arm-common/lib.c
> @@ -31,5 +31,5 @@ unsigned int arm_cpu_by_mpidr(struct cell *cell, unsigned long mpidr)
>  		if (mpidr == (public_per_cpu(cpu)->mpidr & MPIDR_CPUID_MASK))
>  			return cpu;
>  
> -	return -1;
> +	return INVALID_CPU_ID;
>  }
> diff --git a/hypervisor/arch/arm-common/psci.c b/hypervisor/arch/arm-common/psci.c
> index 6a9abf60..242cad5b 100644
> --- a/hypervisor/arch/arm-common/psci.c
> +++ b/hypervisor/arch/arm-common/psci.c
> @@ -27,7 +27,7 @@ static long psci_emulate_cpu_on(struct trap_context *ctx)
>  	long result;
>  
>  	cpu = arm_cpu_by_mpidr(this_cell(), ctx->regs[1] & mask);
> -	if (cpu == -1)
> +	if (cpu == INVALID_CPU_ID)
>  		/* Virtual id not in set */
>  		return PSCI_DENIED;
>  
> @@ -63,7 +63,7 @@ static long psci_emulate_affinity_info(struct trap_context *ctx)
>  {
>  	unsigned int cpu = arm_cpu_by_mpidr(this_cell(), ctx->regs[1]);
>  
> -	if (cpu == -1)
> +	if (cpu == INVALID_CPU_ID)
>  		/* Virtual id not in set */
>  		return PSCI_DENIED;
>  
> diff --git a/hypervisor/control.c b/hypervisor/control.c
> index b38ac2e9..0078ef19 100644
> --- a/hypervisor/control.c
> +++ b/hypervisor/control.c
> @@ -48,7 +48,7 @@ unsigned long panic_cpu = -1;
>   * @note For internal use only. Use for_each_cpu() or for_each_cpu_except()
>   * instead.
>   */
> -unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set, int exception)
> +unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set, unsigned int exception)

Overlong line.

>  {
>  	do
>  		cpu++;
> diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
> index 9b94f563..32a1ca2e 100644
> --- a/hypervisor/include/jailhouse/control.h
> +++ b/hypervisor/include/jailhouse/control.h
> @@ -17,6 +17,7 @@
>  
>  #define SHUTDOWN_NONE			0
>  #define SHUTDOWN_STARTED		1
> +#define INVALID_CPU_ID			~(0U)
>  
>  extern volatile unsigned long panic_in_progress;
>  extern unsigned long panic_cpu;
> @@ -34,7 +35,7 @@ extern unsigned long panic_cpu;
>  extern struct jailhouse_system *system_config;
>  
>  unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
> -		      int exception);
> +		      unsigned int exception);
>  
>  /**
>   * Get the first CPU in a given set.
> @@ -42,7 +43,7 @@ unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
>   *
>   * @return First CPU in set, or max_cpu_id + 1 if the set is empty.
>   */
> -#define first_cpu(set)		next_cpu(-1, (set), -1)
> +#define first_cpu(set)		next_cpu(INVALID_CPU_ID, (set), INVALID_CPU_ID)
>  
>  /**
>   * Loop-generating macro for iterating over all CPUs in a set.
> diff --git a/hypervisor/setup.c b/hypervisor/setup.c
> index 6f4e22c5..f0ee0896 100644
> --- a/hypervisor/setup.c
> +++ b/hypervisor/setup.c
> @@ -27,7 +27,7 @@ extern u8 __text_start[];
>  static const __attribute__((aligned(PAGE_SIZE))) u8 empty_page[PAGE_SIZE];
>  
>  static spinlock_t init_lock;
> -static unsigned int master_cpu_id = -1;
> +static unsigned int master_cpu_id = INVALID_CPU_ID;
>  static volatile unsigned int entered_cpus, initialized_cpus;
>  static volatile int error;
>  
> @@ -224,7 +224,7 @@ int entry(unsigned int cpu_id, struct per_cpu *cpu_data)
>  
>  	spin_lock(&init_lock);
>  
> -	if (master_cpu_id == -1) {
> +	if (master_cpu_id == INVALID_CPU_ID) {
>  		/* Only the master CPU, the first to enter this
>  		 * function, performs system-wide initializations. */
>  		master = true;
> 

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/12a22fcd-2e7c-8d03-195b-b363f8e34019%40siemens.com.
