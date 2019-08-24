Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBEFAQXVQKGQEAABEVIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 109169BE54
	for <lists+jailhouse-dev@lfdr.de>; Sat, 24 Aug 2019 16:56:17 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id j16sf6513786wrn.5
        for <lists+jailhouse-dev@lfdr.de>; Sat, 24 Aug 2019 07:56:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566658576; cv=pass;
        d=google.com; s=arc-20160816;
        b=g0UooX4ghoxYO/jVJEFq5PtPObu537gFcefBNRqCWQOOLcBAikbJrh+Ifg8f1xTgjp
         1NlHYQlgTVtaoYyk3/DBql85eynKhF3ned6paF0m1dGUYeR0btWHylj0z6PvWoVDPnsx
         N8Msh7/oKAetBHXql3aHi9C4OGV8bZiz+oDKvZWL7KJyvUSnbm1n2jCJTYX1vnKcSOpE
         S/JjEGru7RsA1krVJB/qKr/+SlamWKGouxP7RsNpWQ8A+ygKz6yQvPT2FYExw2P3Qv9k
         ZFfsoDNF6IAvFK+rn+h2nbdFljWkOs4ug4KjxZZpSFbgGv2GIVNdHc/p8M+5gPKOU2Jb
         cZ4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=ADKQ3aaWC1Cp52zvsz/QPa0VF21Ch70rQm3N5KGxNEc=;
        b=QWBQePWqIHoDQ0aiYbSqR7cetiLXkDTB+jqZGmXTktmStBFBn+E3Eay8A0/CohZvHK
         5ggf/H0gjykGy3ohMQpvkywoYtZjIi3Q25JepLVlySjfWnts7w9npIIQs+GUdFoz+3o/
         +KXOAlst5Lt7jg+Q1LJqir9yKCdI5QzNI9bOZkTf9QUmLX3WV2Kcajp7DR6imXMDWEUb
         vAs6OEyJJmdwCIoh23ezP5DgAtJhIsw/I/q4bSUUF6uwzCfOh/Ey2RNrGDg3Mez/8S5M
         8FmHqU1ap8lH3rdFnWkgw4gUh+wdDwK7UMbTVC1O1Ca7wqmy2XFrZWeY7YGn+e6g06SQ
         pnoQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=o7Uqtcp9;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ADKQ3aaWC1Cp52zvsz/QPa0VF21Ch70rQm3N5KGxNEc=;
        b=QEL+mrHhor61ZpffC4ki+kwk0vIf+Syoown29rIJfgEHSDw3gzfWVKRTRlSAPXXsD+
         F53nDbG4k5e3i/Z9y9i6pyTYxCYFif/Jt6DWwfTCo+gcHey96dZHGCFLCc/kbyYHpGr7
         jDKaQiM+I3PAtcocVeWhk0cubwKCDmlo9Ppp9Gz75iVYYRTnHMR6jHPpTGrpdaMZ9oa8
         lYfdBi7tA0P5q4tTgPGCZLYiOMeuzYKcAUTaGNQOUzV4Z3qhWWPdoWPdUAGjKbmTe+P4
         RROLo8hqRC6jBZROw7anvUbjjbPKUWvOl6src8mU26hL/W0QZPR4+3aq/6JKZAKRthDk
         ZirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ADKQ3aaWC1Cp52zvsz/QPa0VF21Ch70rQm3N5KGxNEc=;
        b=HYzF1R51pbLWxW6glIR6bHQX1h5qmSYsdDQjbHj3dwbLTa3B7rPElJWe027v3uRb/0
         GVF1ZZhWdslCV5QFZWbcLepTyeMbdCrfIdEGhgoP5d2BWY8pL9nGLQiyAy7CaBFZmIRD
         loIOBuv+blLj/36DHnDB2kAxq8Yq+HtIl+5DFxJRxQuCLU8ZCRK0KnXgRGDvFqEL8m1J
         /g1ncX+jAgmaBm3OW8/QqJM5lBBlRhx3Lo041haWjLUoRdadW9FQtEP2c5tAoSX/tL4i
         zhZCu5oZvoJaTbXo6Q0RRNJPCMJfqboHu/JMmU58ldGtDhfQaAYZj0fnjtIj2R4HvhMF
         b1SA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX79iwVY6+22HOCLfOfA0ehhLVaAEiM7P2Qp9Svg7s5MxRflZPV
	3Do0Awv6WA0ssRGzASrY7G4=
X-Google-Smtp-Source: APXvYqxFkHKxwfvMtTYqH+Ig/fzXPNE9Z2tHiCIF8XurtFJmi9adoF3GVy52fC8gi8FUeMg6ygsZdw==
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr11987473wrc.4.1566658576734;
        Sat, 24 Aug 2019 07:56:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:283:: with SMTP id 3ls4627109wmk.5.canary-gmail;
 Sat, 24 Aug 2019 07:56:16 -0700 (PDT)
X-Received: by 2002:a1c:c00e:: with SMTP id q14mr459073wmf.142.1566658576166;
        Sat, 24 Aug 2019 07:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566658576; cv=none;
        d=google.com; s=arc-20160816;
        b=W2K3NYSS8T9z5ISMQ/oz2ExEDy+1kbMJcOsuCS4KxTREf38UUrDUqtFx3TLDnbPoYq
         ioY1Y9m4T2s7mYGMY/N7lE0oqIE7WZpPpueXmBlenbWCmQZ+7Qs4Pz2gte0F7yWmBhsy
         A0dXCW9g8dKXy7XyoNR69dy+x61Njj/R1s3d7ouC33LwOqBHbF7RgHWTzr2mhkJeEFjU
         /UMbcYfFNhaSn2fzgBsK5zlKHkmaxGAf178tXcam8d9IPbAtpebKWDXsgJTa9Ez4xQpl
         7buh4h083BQ2sNV2x0w3nfAN2VG2w7jnwrGqSo+qGmHLlEFCC2Ua0VBxOPxwOvtkmGLL
         nosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=x7yeBwyPUepo0yuZ/t/AQQSd2KzetwLhaZukaWnRJHE=;
        b=EqZNIVlJuBVoBwvGV7VQd9Q/YaCBKsIybxatIJMWif0rhjYA5V+of4YpOhmDH3MoIG
         BrRMpWnmRKWm+ei6hToTSIQSSJmmXLjZX19vNqr8N/nQr4OOCVU7Q4sKZVAuxWySYip3
         nYJYjtK/5b9ZZ7VgywsJJCt2Pln+EhF5UR6BPIRzUhVdDfT7tl69ID9qEc5e03iGljAC
         s0gR4u6H8vhyzhRj87TRdDtvQTPIoICPYkJ+2L5AQC6RS9Y05k0gJW/a+PemkMz9fbVT
         zbDyxGrcfVErVmriQJYBj6LzYvqlxdbRUMX8eVHuIAzpEj2D+uKyADJyf/ElXERrumVR
         xwaQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=o7Uqtcp9;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id p4si210345wme.2.2019.08.24.07.56.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 24 Aug 2019 07:56:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MUnYm-1hinlT171g-00Y9RH; Sat, 24
 Aug 2019 16:56:15 +0200
Subject: Re: [PATCH v4 2/6] arm-common: Introduce iommu functionality
To: Lokesh Vutla <lokeshvutla@ti.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
 <20190801113521.7311-1-lokeshvutla@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <2dc1d2cb-4bb4-03a4-6716-f2311cb10b06@web.de>
Date: Sat, 24 Aug 2019 16:56:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801113521.7311-1-lokeshvutla@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:kCTC1M/0IGRut1r1RYNj+dvmNO6l/FFHXOMwAZS1wyACtrmZSm1
 2/uXsYX743EkNSInNX5EGVoSpp5Ey6gs4i8LoODGkSYJI7IpegHDXnbfDNBuazXYcfCur+h
 Vw/JCnof8Qts5Izanr8b5hCnHRuE8TFlc8po3LqtgxOoVs0H+LWcNg51y0ZgHbjJtWXSTKt
 RvAnLzFiJx3puhD1REhWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/ly9Dj+psHQ=:IVp2Hxx29LX5nRWtMBBaDj
 NRPhbuzyFlFQNuVtjZbuyIfFyHhVkG0BaWybfliarEXMwP4EW97TZZpNxckjfk4zGtSOtrTyw
 8aT4z+dNS4VNdO/wwRy5FtssP4TPLwElhi0F1ImPD9s9je9vWTxgHjW9NdgYc445FMv75/U6I
 ItbwE5uXGM44vQcixYm3Snzgv2ZVYot9ecwInrcKOjKil06eGJv7noD0uCjjIy7mPXyWnincy
 29huyUcsWwtqwtZYFunXFCxhukgm8nBYFGyhtHY0LtgXrQYDKxVxcbaCjog+gOL5p+XaA0Iak
 H0QxdAwjdIZdjvI4Tij5QsEzvV/bQLQWngWB9LT/Kfso44+/FO4U6UiiZjYEuakZRN7TDO2tI
 JcfRAGtcjMKJ9Q4pnzreLc4BJuaMfQfw9HdAQYmUKLgWw6KikY1A4DsBbuwuZLHXA6J4+hJW7
 SHsjohYYP1pwrrSnwvMKEYGUHkU4yo2SakM/LV1C/8gNXIRyKiINmGf4ZGTtgOvj8rgeVKAkX
 2XWl9YXUF6l1PdfREnmCvwCdWMNYFn+Zek/h6uCtae4//B3uxLtJcKvNPt6SW5cOXmFXzOH3Y
 TOtrycK5ugDe4hP5uvZGm4aH3NG/UZ72e6jojV0RHeDefx4iYs3g4RjoP70ifF9pvinFlXO0V
 MdIOYaHKCk9rIYxWphWCi3N7lg9WxtGeVHpuUirYu5OYPKjmGsg8qg/2Us1yjY1+7DoCSIvQL
 OT8f38e71BV2IKzIDoDd7ei1GrGlky37oO3KBCvh/hYi6YITC/9JkKj4BEGBEquI73arK688C
 Gvml0lB0RHeUc2WFP8tnMmd9mEC/IMpJSmHVCtVL6iHIfhmNymQZ/7BSilOhGMweTBi1ygAlW
 zNGDHFLti6H2WwVXQaANWMSlwQI8Qt8u5usd9n8CtJxNKY6LYX+2409lUOB/eZmxQ6wYLmHUM
 jrXkS1e6kT8VBh0Gz2BMyvwAgsJfUUlbcJ1Dg0XQvWufiUsRpnp/e9E56DaQrUnCt9hou5ShW
 8G5XnFdZ85JuWfLafbo3uO6aDadGhBiFXa8mMtSetWDHqHhnER0q1oRiv/TP01TJsO0P1+EQ9
 pnWquDzzU9MqoopFFBWiPf4Z/yxkK55nvMfk58TXz768XqeXf8alMnxS28haBZEt3CGbeaG/q
 OwMhXfGL45VOQRfg1GtU0RX94YcKg17YCriEZsXT11ItNwjA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=o7Uqtcp9;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 01.08.19 13:35, 'Lokesh Vutla' via Jailhouse wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>
> Add the iommu hooks for ARM and ARM64 architectures with
> dummy implementations and update the Kbuild to include new iommu files
>
> Introduce following hooks:
> iommu_map_memory - Setup iommu mapping for the memory region
> iommu_unmap_memory - Unmap the iommu mapping for the mem region
> iommu_config_commit - Commit all the changes to the mem mapping
>
> Call the map/unmap iommu functions in addition to CPU map/unmap and
> config_commit.
> Also add iommu_units in the platform data for ARM cells.
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   hypervisor/arch/arm-common/Kbuild             |  2 +-
>   hypervisor/arch/arm-common/control.c          |  2 +
>   .../arch/arm-common/include/asm/iommu.h       | 27 ++++++++++++
>   hypervisor/arch/arm-common/iommu.c            | 44 +++++++++++++++++++
>   hypervisor/arch/arm-common/mmu_cell.c         | 20 ++++++++-
>   include/jailhouse/cell-config.h               |  2 +
>   6 files changed, 94 insertions(+), 3 deletions(-)
>   create mode 100644 hypervisor/arch/arm-common/include/asm/iommu.h
>   create mode 100644 hypervisor/arch/arm-common/iommu.c
>
> diff --git a/hypervisor/arch/arm-common/Kbuild b/hypervisor/arch/arm-common/Kbuild
> index 78b9e512..6f57ef02 100644
> --- a/hypervisor/arch/arm-common/Kbuild
> +++ b/hypervisor/arch/arm-common/Kbuild
> @@ -17,6 +17,6 @@ ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
>   objs-y += dbg-write.o lib.o psci.o control.o paging.o mmu_cell.o setup.o
>   objs-y += irqchip.o pci.o ivshmem.o uart-pl011.o uart-xuartps.o uart-mvebu.o
>   objs-y += uart-hscif.o uart-scifa.o uart-imx.o
> -objs-y += gic-v2.o gic-v3.o smccc.o
> +objs-y += gic-v2.o gic-v3.o smccc.o iommu.o
>
>   common-objs-y = $(addprefix ../arm-common/,$(objs-y))
> diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
> index b59c05d6..106ffad4 100644
> --- a/hypervisor/arch/arm-common/control.c
> +++ b/hypervisor/arch/arm-common/control.c
> @@ -16,6 +16,7 @@
>   #include <jailhouse/printk.h>
>   #include <asm/control.h>
>   #include <asm/psci.h>
> +#include <asm/iommu.h>
>
>   static void enter_cpu_off(struct public_per_cpu *cpu_public)
>   {
> @@ -209,6 +210,7 @@ void arch_flush_cell_vcpu_caches(struct cell *cell)
>   void arch_config_commit(struct cell *cell_added_removed)
>   {
>   	irqchip_config_commit(cell_added_removed);
> +	iommu_config_commit(cell_added_removed);
>   }
>
>   void __attribute__((noreturn)) arch_panic_stop(void)
> diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h b/hypervisor/arch/arm-common/include/asm/iommu.h
> new file mode 100644
> index 00000000..67ac34eb
> --- /dev/null
> +++ b/hypervisor/arch/arm-common/include/asm/iommu.h
> @@ -0,0 +1,27 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com
> + *
> + * Authors:
> + *  Nikhil Devshatwar <nikhil.nd@ti.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#ifndef _JAILHOUSE_ASM_IOMMU_H
> +#define _JAILHOUSE_ASM_IOMMU_H
> +
> +#include <jailhouse/types.h>
> +#include <jailhouse/utils.h>
> +#include <jailhouse/config.h>

Just updated this commit in next: jailhouse/config.h must not be included
directly. It is optional, and it included automatically when available.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2dc1d2cb-4bb4-03a4-6716-f2311cb10b06%40web.de.
