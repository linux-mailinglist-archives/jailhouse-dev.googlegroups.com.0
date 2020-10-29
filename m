Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB46V5P6AKGQEMTEYKPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 480D229F109
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 17:16:52 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id 31sf1471461wrg.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 09:16:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603988212; cv=pass;
        d=google.com; s=arc-20160816;
        b=UzssxXrBr6VTkEYcajrAi0f93v8SAa/7STZ3brKjuWzXpLEOwEOMhtg5/ag5Ns0uS5
         vLHlzXcvwz3nHACTU5qoSX5wwn7kcsPZf/PTUQ+1h2B+4nYmdGttUt5rZJi9jbHESRw7
         mPDDPrLibykO4THFZ6OZDR82TzFNE7zqnFxXQdUAIGI3/AoWBCBJJhfhsq6k2rPvZ5mc
         lvjZxqV3JQUst0tU4mAENyANi8kU4UalN2S/uSsGZU61zQ1uGFNawmnEXu45VzcluS81
         L60OOhvmMWQMMFqvlYaZQywGozMI5QQBY4CERZBM6MIB3Q/pcdZisX8PyVHiQQ5JuHhv
         FMpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=CQz579fmA3D7R3uH6i3NKTmRU5kFBQvZwc9fM0efPCw=;
        b=XP7d8+NSvKT+h8raGdQ1dzzs4TjL2PWvjNdOhF8wswkJDY5PZH5Uxc9XccgffL8dnM
         aRerqWd7fC8d5dUYr0xJh3VQg9VT3oy6+qT9vJuT6sTCOFOyfUKFd1IXXWZeaSMyBsTX
         CnMw07wMSBphQf8EgsQPv3ip5xCcVAnqaEDTGPIjdmhw9CHx+gn6X60lr9qrYMx2da0R
         yIAoY7y8zu16Nq6hWlceWPgB6QpHxsa2HsviofcK1Imkm0KGD/6KuAMTpv4KLY8XjDhZ
         25rkkGyZARffbEh8sIntysAMvQFsQVCLrlkgGYcmBbOm/dH/dJQlGJQP08KVg5Hasutt
         dquw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CQz579fmA3D7R3uH6i3NKTmRU5kFBQvZwc9fM0efPCw=;
        b=JbEQLMdoOHKHF/QQX0yCWLsxq1BdTMJIQB497gcL12rDvzMAaPWmhzFsdptbrJODFR
         nqTGV8nplSRmI2QNrbsEHUFvbHQBx0PFRHZlPwlxF33f0tpMVS46AG1AIMLI7CvvKpnJ
         MrcdqLRhq12XXJecsXUSHsR5shi628vGNlf+/FgE3vQ/8Ir5yd0t4Xmy1NPUXLybCm4C
         ujCcXLVTJkHqpqz5xexPxsBszwUlpBqO4qInmZtWfF7LKMo9+ufKeUgKMow26tAdf+YH
         Am7btQne+SmtuV5BDbgY7SVqT16ANublDMzluHdk/SmGi/pbpvaUMDfb33UTqM6vXOaV
         xfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CQz579fmA3D7R3uH6i3NKTmRU5kFBQvZwc9fM0efPCw=;
        b=GFMFhLDFQLWcTIs1Gb+b77Bb36hPGMt81YHmJYyT+GIGKrE+3FRaWNpWeNhPSpsJIS
         CfQQmj1Qj7wvBc1Gzse1igIfFcc81zcmz72YFYpXIy+C5wUPYpCfbnTb4nYD8N4Uc1V3
         WF55C8eeaxzxkOLD9kEjmbAUpOKAce2IPT6UNE7Ncx2XQUvKVJA5kJsF1MDsauwRovRz
         msixRM4w+LWgYRzbqNOLcDfYpJC0z4ZL78d4f98d5DxfLr4PysrMjIL38VQfMBJhNwCX
         dt4h6k4U8kbnIyqhpZ5kw7KAuyzwgqGUPo/LL19n2xLHPg8pGKIwYIjklu8tTiOCD5PN
         Iw4Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53045UG0FpkTqsV1aoLgMDJPZCKr+ygOHs7Xg60aYGOOJ7IhhF6F
	TjLWCod5o3WhPYgC51cjCBc=
X-Google-Smtp-Source: ABdhPJyvmBqIH5sohcwwcULxiLJFoKOfLZZ/kFgvZIiQvM5VPdfQfHcZNM1pgnJmHXFiBCGJEibV0w==
X-Received: by 2002:adf:c3c2:: with SMTP id d2mr6799228wrg.191.1603988212046;
        Thu, 29 Oct 2020 09:16:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cd12:: with SMTP id f18ls214089wmj.3.canary-gmail; Thu,
 29 Oct 2020 09:16:50 -0700 (PDT)
X-Received: by 2002:a1c:7515:: with SMTP id o21mr644375wmc.5.1603988210875;
        Thu, 29 Oct 2020 09:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603988210; cv=none;
        d=google.com; s=arc-20160816;
        b=CGrWoNXrihfiZ3VdgM7V1ouWh+X2ki16RmMqi+WpDJPTlEf1uSFXAHAW/whfmlutVs
         XwMesztdy4sN8mgFI7RMcWl9aMCiWxm+ij5VLzbuJewH056YPFs2QcQhgbCyk9rY0jvR
         /QEk6ycIQ/MI804TWi+C1p7vP6HalaYArh0c44lRDvJelnRTAng/XO4it6s++ERxf9oo
         EmYE2B2+JX4yVe5vsi7irwKxvJY7oWJK2ntITqClXVYXWLkwRPFhjZnmdY4TwehsBJU/
         upGeOM4+Bn0cKgVbrgTaEKMUZGurUbBWselqM833GFxPY598RgtkMkdG5I1CiNFbbki7
         BPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=GKvEaAxg9Cgq131Kl7bm/U0KuxIRhI6/SorhGmXrC40=;
        b=WHyINryD/JIrUIZbxLkrKTF2cchH2Kcvu55mxPg8LJH4T4qzaHZzUIuyxGV58wFi9x
         4paud0Nkql7WlXDLssvGoPkLnWvnstuPb7Sa82WwXpwNE4yRb21dIjQtVCr+YpaSLA6X
         UHYnZIM7HZPXkET8lqb8djWqL9gITQbpMG7oGSuzS7yg/7sT3rabrcU4M/sAg3rd8bhW
         f1CR9Big6Juh85ky29RtlxY6OPGQWJsWIztna6xpE/fE0RjKEIxxPe1ZiubD1JYEdDaD
         Ha5Ik4MUpp9J3Qh3lb9agGeyMZ1Sd0ek6dZZ3Sh5iTtDzmdnvbry7pR2eNi8aWX0It4/
         7/3g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id w6si14497wmk.2.2020.10.29.09.16.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 09:16:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09TGGoLC020202
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Oct 2020 17:16:50 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09TGGnqf024727;
	Thu, 29 Oct 2020 17:16:49 +0100
Subject: Re: [PATCH v3 2/2] inmates: x86: add cache access time test
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20201029145515.386953-1-ralf.ramsauer@oth-regensburg.de>
 <20201029145515.386953-2-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1eab7944-3f71-dd82-99a5-b4806443d701@siemens.com>
Date: Thu, 29 Oct 2020 17:16:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201029145515.386953-2-ralf.ramsauer@oth-regensburg.de>
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

On 29.10.20 15:55, Ralf Ramsauer wrote:
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
>   - Move host code to tools/demos :-)
> 
> since v1:
>   - Move host code to tools/
> 
> since RFC:
>   - move the inmate to demos instead of tests
> 
> 
>  .gitignore                  |  1 +
>  inmates/demos/x86/Makefile  |  4 +++-
>  tools/Makefile              |  9 +++++++--
>  tools/demos/cache-timings.c | 29 +++++++++++++++++++++++++++++
>  4 files changed, 40 insertions(+), 3 deletions(-)
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

Look mom, I shrunk my patch! But I guess that was not intional...

Patch 1 is already in next, so you only need to refresh this one.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1eab7944-3f71-dd82-99a5-b4806443d701%40siemens.com.
