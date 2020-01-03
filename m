Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBVXCXXYAKGQEEPOZUSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AA312FAD9
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 Jan 2020 17:52:38 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id j6sf2170456edt.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 Jan 2020 08:52:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578070358; cv=pass;
        d=google.com; s=arc-20160816;
        b=wTi7BvoASLVvKtJQ0eFhmVeqoMrS/RBr+oSkenThm9rA/1tm4f19SZEa/PSirhALmj
         xRLhZsA3CYauqTaYHJhg1vA69Mm1VV3etM3y/tmmAw81ep4P3c4Lb5phg7jWBqDFIqGE
         lC35Rm4dGV1p5eDUmkOUAHSw/oimhYKQjmWQr9TkxJGn1VsT6cNoq1ZUZNxDeBgTth8r
         MNXLG5Drdp5sgpJeUuYc5a+qX012fk+iEEuqlSqyJHRRclBXfS+j79cvs72ZWVyMvx0B
         y6e7NleVTc2cs6cUhB4C+ws51YpDA4VHsn+JKhwqPTbfz1GoFtlb6EOaMkEGkw9p7tTw
         5iqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=UP/SHtrIFr3XY0QwhHjI/2nvimnU17LyswE6gD1WRkQ=;
        b=wwgfg3x3Mpm5a2f7RekrbZbmwNJAxkEbWe43wLExPC0/TnCDKmp9uVNMU1sxLKt4+0
         8Q6cPVHGsbNobSXxJbzbjiLpftqZk3+vnbfOC4O0Rg9IV/BX2ImQerRd89a7i9a6x/mO
         +UIZOIxGfYJBQVpnqwfbmXgYkBKPC4QgisSfxc1X/Sx06UutsnZKPhBSFnk2zmVyG7rS
         5igJdaEGfLXjhoeO+bdweuig2tNZOpxzLnGHTh8OUpr05oRB3hzEwycWnV/b4OFC089p
         kG2kAL/dG24/S2YKYimjNsK+y9aHUcLGP4WQ5qzV2pBswg32S8SLu0VIYt4xLXhlztZ0
         n/eg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=LirEg340;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UP/SHtrIFr3XY0QwhHjI/2nvimnU17LyswE6gD1WRkQ=;
        b=XGLT9Tb8buy5D+ZyZpcorZOqIMaZtgxXEBQ17GuczkkK8Od4hHoI0toNlCP7yGpPh4
         Vf/hRYATL6VV31t75Yhjmkl8WIfH/CGydKCwivK6WLggJM+FtEIKC6KkWqYVaAwRF1fd
         8fAtQHma4ENGtp/MwZ1p6TlAIRjFDDR3khNYAYscXgqDR/A14hgu3fOb2a/1iPCd4xVV
         5hnk9BnCo0QAgDPr8jezAxHSosOytTZDF27ePJr5Jy2c0u5ebt8EdZuD3E+alWrNwmp2
         zz7ySbAhcRPy34N2aQ0moEyLbG7PJHbxm8dkZ41MSPKAuGrbVrRAAZE3oq1eFGne2U5h
         B/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=UP/SHtrIFr3XY0QwhHjI/2nvimnU17LyswE6gD1WRkQ=;
        b=E95vqKDm82e7avN+B8g8DN3OLXQvkE6yKWYQUFIJjl9wa3TriqVXPzO1y4WAXYHhM3
         VGni+2QBThcPDGhQ8k6aWC6rXksHqdlQRjbvv9yn9AKxgax06jWryYXlrmQnW2qReuaJ
         3ALG9eBGvZ64jJ8mSa+c+66xBTqkzQVmMFgtBEab6qbosKFHd/cL93JpSF5+W69anDrb
         47sBVPMOP3Gi0auxJYNCg4ZXESvN0YS64jVg3G3uhXJ1U9xNVSNY7VAh00gdk7m7Zx3M
         NJ4fWLJSUmBkKAuxj60zQBoIrs2Xa2qwvA0kiy+UrPERDC8+S+1CMfzjDDVeDOyrZ3FX
         xgjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWSsyXuulttlO5w2CT45gAShHJBSuQNlnfD6UVS1OMEUfRM6Vt6
	rukDKmKcIKapUNBUHNgx15w=
X-Google-Smtp-Source: APXvYqx8Uji6YzK66tqWh1wd2roh8xNPvMoyx8Jnbe/ldgyqvO/MYD1+qDSQyAZ4qPmUAz/80xsvjQ==
X-Received: by 2002:a17:906:b212:: with SMTP id p18mr96906498ejz.208.1578070358287;
        Fri, 03 Jan 2020 08:52:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:a6d6:: with SMTP id f22ls12520969edc.3.gmail; Fri, 03
 Jan 2020 08:52:37 -0800 (PST)
X-Received: by 2002:a05:6402:148f:: with SMTP id e15mr12108625edv.254.1578070357525;
        Fri, 03 Jan 2020 08:52:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578070357; cv=none;
        d=google.com; s=arc-20160816;
        b=e6dZm9TtWrgnu5Ii3Kogbx1j6e3YrOxFhz9ta/B0ioq5DVNRuVOwkpw4z5Q6KMuOHX
         4mgf5qrw7M9/j/bLURY14jBCQwPK5Yt08rkfthEXaWPXe9nVSy7t60OgKeusTmcGaCpI
         rEFr4IAeSQ/BuqgmXL5S1gAknJALzG1myJK0zn5LcSZ9c7PS0gj8HdiiNVjzYCD6uapi
         hpGZGiEyceu72reIaNSzYA4wU4iN8vMXFf6Ar7B4+Z9DlsF+yA/I1hfEOl8uF8jUNvAE
         ZoLEV17tEzUaFsVkfKHP+wPm3e2U+E12wJL2LIqcX6pMbWrdxQhU792gKPqNraJJ95Je
         jNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=luCTg+Nl696UIrIn5fKcXJIwHncyVYiXKl8pvnv7C3U=;
        b=rvht9u65js9j0glPjNHtYSaLhuvg4PPqlyWxXppZq6hZYvVTQhs+YQilvm1q0f19Pr
         ofO3nbNdHCFinaZVPk9wYfAJaSlrjBTQMN4RNqmzrV06K8cpmyhH+mnaSYVIVDzsG1cP
         i2YNzH77IeiWCbsiT4l1wXhMqOIRLGnXm7369CAqFnemcio9vK0WXMlVjG2ddcIlPCOu
         61yszTDjxsTZ7hdpVTKgcVMoWYkZm2VOALinQNRLy0Hj37RRsW/eBgol+g3fekRX27cm
         sXSGt91qBTuRyO9MumcY82R/yCok9wX2BiZxo58Xsh0xIfvXCTFc/KaLq5GQPBSdxJiF
         pQKg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=LirEg340;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id w19si1752908edr.1.2020.01.03.08.52.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jan 2020 08:52:37 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LqlF4-1jQako39dK-00eJYQ; Fri, 03
 Jan 2020 17:52:36 +0100
Subject: Re: [PATCH v1 1/4] arm64: ti-pvu: Add support for ti-pvu iommu unit
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20191230132406.19985-1-nikhil.nd@ti.com>
 <20191230132406.19985-2-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de>
Date: Fri, 3 Jan 2020 17:52:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191230132406.19985-2-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:P1h15aCa/3QeqYCBU5VS7i6kzAj/gIskHeNjWy9Xx/EorNgLnWt
 jt72bnO1QrAUcVTdr8du8lX+WZLthGGrBPi4uDwBNar+XBvgRV8hEobyV/9KB33OgbnUHDm
 u1QsLM2YzMxhbrK/VvCF47vIIjgNjJJ/Z58mBpeyE8o1vKYDuZYYQeIvDfR7oOu3z40SO2I
 jhPUSe3NJJxwj06fcp6Dw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KOn+EIl888k=:5hTRRk+5TfEQiOhgRsCCqI
 dBEpR8UqpLW6Jdtni5JbCVIfjvU4A42VsXouxVlQMXA92mPsdvzeAFQHfYGMpx7IhQB8h6JWA
 OEsh/JvgSRWq2GCd3K7LJ9t8Kbb64yZ32EA9xbUEN28oZdvO+l8lsxDN2qhi6FIf8MO+28hIb
 qcMDFI5MzARIXrgFNXQiwbsbFd/Z9Nr9DkkK/vpcA36sAkki0aMZMzJ6PO6AL1Cr6pZyCiFV9
 Aa7nVcSVdJoOihbLjSlN1lJZYH4p4huURK+Qf+N0KlcMPh2xEk75SKI1omSzJWujoQlzCf5in
 LdAhvauG3q4qNE9rjjkiNgAyxzXN/BE3KYgsoy89AbU+uERZQDVfOKEmmO9EaNw9ZyuSS0Eud
 mEF3jDsfdQW8msSmraAk0yB7+R9r6n0xTrqN3fqsrv7npWhO6TH283db9FNy/YXdkz6bl6r/i
 l0+B0kiuaKRBcot5PsWtlU37wzZROnZz8KB5CXXsPN8S+6k3jsFRdCmpVsipAs6n/tFLEBS41
 IErLizMh4BPwrzpSB+XXoTtu5fIiKcEL2ECg7kDPmomG1x0qCUr+LQ3JGlHtOG1SBdNm9CDPs
 kNzHiDlB4z9Us+2rJnraBTgPPLGMOcbrXitnYmLJ3u6EVQXSaVf++g+nsSdfI+XimwCRQN50W
 smUlwUokGYG1W49HiESHqGg79Ru/Tts6QkuqXoVtOhEftF9l1UkIWTTK+FU92aClbyXs3qGLG
 FUcIZ6CQFZV1gGcJxvT2Tac5OZsRewcaUe8R+NaIZIn5wjxClpPsCVUBooR7aJ5mTHRJa0z86
 o9keHYNAOI95lq6dMSdiG9Xu7ygrf0EFF6Kj2xoCDoubKQTROFIddWBQ9k9/ET3xGVVw6UDY5
 oW88DZ9rFIInw4oLWBIZ5IuNP9/Wdr4ukghRDQA5sbMSuIHc1A/96gQ6P3FE8LiE7p3MYv8w7
 ceUvv9gk/4+sP4kvX4T9i5IiTwYaAEM/Y2wPhihQ3/MwgutvcK/RNuLVgPJsb2r5bNcw5bXV0
 joMsSqxQB3bwex/UISDm/0/kQnnFUUnuarl66stSSftBnPlwk73kEUkjMMYELJI5QglzAII9V
 QxEEsmN8WbSW2cPzUpco0SEmuZbnfHjT4lp+Mqg+nWtSL2CjMhk6KL05l0Kmzp0qUogEoXhyJ
 clXu8kNjnRwRjZv7I5WHnZiNYe9d6gQhZ9mieLry4jUgoP2+UsCROzXUgMK1qAQPcJn2gKZUN
 vdH5b4qguRDklmiGB4wEMIIimCF8t8jtrxA9kFNlIWmvkd/8WFFUDv96tin0=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=LirEg340;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
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

Please make sure a "From:" line is at the top so that I don't have to
add that manually. git will add that line when you set a different
--from when calling format-patch.

On 30.12.19 14:24, 'Nikhil Devshatwar' via Jailhouse wrote:
> Add support for Texas Instrument's Peripheral Virtualization Unit
> * Define a new IOMMU type and extra fields in the platform_data
> * Add new cofig option CONFIG_IOMMU_TI_PVU
> * Integrate with the arm iommu support such that multiple types
>    of IOMMU can be supported.
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>   hypervisor/arch/arm-common/include/asm/cell.h |   7 +
>   .../arch/arm-common/include/asm/iommu.h       |   1 +
>   .../arch/arm-common/include/asm/ti-pvu.h      |  32 +
>   hypervisor/arch/arm-common/iommu.c            |   9 +
>   hypervisor/arch/arm64/Kbuild                  |   1 +
>   hypervisor/arch/arm64/ti-pvu.c                | 556 ++++++++++++++++++
>   hypervisor/arch/arm64/ti-pvu_priv.h           | 141 +++++
>   include/jailhouse/cell-config.h               |   4 +
>   8 files changed, 751 insertions(+)
>   create mode 100644 hypervisor/arch/arm-common/include/asm/ti-pvu.h
>   create mode 100644 hypervisor/arch/arm64/ti-pvu.c
>   create mode 100644 hypervisor/arch/arm64/ti-pvu_priv.h
>
> diff --git a/hypervisor/arch/arm-common/include/asm/cell.h b/hypervisor/arch/arm-common/include/asm/cell.h
> index 5b1e4207..9c6e8c6f 100644
> --- a/hypervisor/arch/arm-common/include/asm/cell.h
> +++ b/hypervisor/arch/arm-common/include/asm/cell.h
> @@ -15,10 +15,17 @@
>
>   #include <jailhouse/paging.h>
>
> +struct pvu_tlb_entry;
> +
>   struct arch_cell {
>   	struct paging_structures mm;
>
>   	u32 irq_bitmap[1024/32];
> +
> +	struct {
> +		u8 ent_count;
> +		struct pvu_tlb_entry *entries;
> +	} iommu_pvu; /**< ARM PVU specific fields. */
>   };
>
>   #endif /* !_JAILHOUSE_ASM_CELL_H */
> diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h b/hypervisor/arch/arm-common/include/asm/iommu.h
> index dde762c0..399248dc 100644
> --- a/hypervisor/arch/arm-common/include/asm/iommu.h
> +++ b/hypervisor/arch/arm-common/include/asm/iommu.h
> @@ -16,6 +16,7 @@
>   #include <jailhouse/cell.h>
>   #include <jailhouse/utils.h>
>   #include <jailhouse/cell-config.h>
> +#include <asm/ti-pvu.h>
>
>   #define for_each_stream_id(sid, config, counter)			       \
>   	for ((sid) = (jailhouse_cell_stream_ids(config)[0]), (counter) = 0;    \
> diff --git a/hypervisor/arch/arm-common/include/asm/ti-pvu.h b/hypervisor/arch/arm-common/include/asm/ti-pvu.h
> new file mode 100644
> index 00000000..a3ef72f7
> --- /dev/null
> +++ b/hypervisor/arch/arm-common/include/asm/ti-pvu.h
> @@ -0,0 +1,32 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) 2018 Texas Instruments Incorporated - http://www.ti.com/
> + *
> + * TI PVU IOMMU unit API headers
> + *
> + * Authors:
> + *  Nikhil Devshatwar <nikhil.nd@ti.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#ifndef _IOMMMU_PVU_H_
> +#define _IOMMMU_PVU_H_

Re-inclusion protection should only be added when actually needed.

> +
> +#include <jailhouse/config.h>
> +
> +#ifdef CONFIG_IOMMU_TI_PVU

Can we try to model this without a compile-time switch?

> +
> +int pvu_iommu_map_memory(struct cell *cell,
> +		const struct jailhouse_memory *mem);
> +
> +int pvu_iommu_unmap_memory(struct cell *cell,
> +		const struct jailhouse_memory *mem);
> +
> +int pvu_iommu_config_commit(struct cell *cell);
> +
> +#endif /* CONFIG_IOMMU_TI_PVU */
> +
> +#endif /* _IOMMMU_PVU_H_ */
> diff --git a/hypervisor/arch/arm-common/iommu.c b/hypervisor/arch/arm-common/iommu.c
> index b3100d03..b6b61f52 100644
> --- a/hypervisor/arch/arm-common/iommu.c
> +++ b/hypervisor/arch/arm-common/iommu.c
> @@ -26,15 +26,24 @@ unsigned int iommu_count_units(void)
>   int iommu_map_memory_region(struct cell *cell,
>   			    const struct jailhouse_memory *mem)
>   {
> +#ifdef CONFIG_IOMMU_TI_PVU
> +	return pvu_iommu_map_memory(cell, mem);
> +#endif
>   	return 0;
>   }
>
>   int iommu_unmap_memory_region(struct cell *cell,
>   			      const struct jailhouse_memory *mem)
>   {
> +#ifdef CONFIG_IOMMU_TI_PVU
> +	return pvu_iommu_unmap_memory(cell, mem);
> +#endif
>   	return 0;
>   }
>
>   void iommu_config_commit(struct cell *cell)
>   {
> +#ifdef CONFIG_IOMMU_TI_PVU
> +	pvu_iommu_config_commit(cell);
> +#endif
>   }
> diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
> index 323b78b6..8012c46e 100644
> --- a/hypervisor/arch/arm64/Kbuild
> +++ b/hypervisor/arch/arm64/Kbuild
> @@ -21,3 +21,4 @@ always := lib.a
>
>   lib-y := $(common-objs-y)
>   lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o smmu-v3.o
> +lib-$(CONFIG_IOMMU_TI_PVU) += ti-pvu.o
> diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
> new file mode 100644
> index 00000000..02380baa
> --- /dev/null
> +++ b/hypervisor/arch/arm64/ti-pvu.c
> @@ -0,0 +1,556 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) 2018 Texas Instruments Incorporated - http://www.ti.com/
> + *
> + * TI PVU IOMMU unit
> + *
> + * Peripheral Virtualization Unit(PVU) is an IOMMU (memory management
> + * unit for DMA) which is designed for 2nd stage address translation in a
> + * real time manner.
> + *
> + * Unlike ARM-SMMU, all the memory mapping information is stored in the
> + * local registers instead of the in-memory page tables.
> + *
> + * There are limitations on the number of available contexts, page sizes,
> + * number of pages that can be mapped, etc.
> + *
> + * PVU is desgined to be programmed with all the memory mapping at once.
> + * Therefore, it defers the actual register programming till config_commit.
> + * Also, it does not support unmapping of the pages at runtime.
> + *
> + * Authors:
> + *  Nikhil Devshatwar <nikhil.nd@ti.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/unit.h>
> +#include <jailhouse/cell.h>
> +#include <jailhouse/entry.h>
> +#include <jailhouse/paging.h>
> +#include <jailhouse/control.h>
> +#include <jailhouse/printk.h>
> +#include <asm/iommu.h>
> +#include <asm/ti-pvu.h>
> +#include "ti-pvu_priv.h"

Single-user header - let's fold this in.

> +
> +#define MAX_PVU_ENTRIES		(PAGE_SIZE / sizeof (struct pvu_tlb_entry))
> +#define MAX_VIRTID		  7
> +
> +static struct pvu_dev pvu_units[JAILHOUSE_MAX_IOMMU_UNITS];
> +static unsigned int pvu_count;
> +
> +static const u64 PVU_PAGE_SIZE_BYTES[] = {

This is not a macro or define, so let's decapitalize its name.

> +	[LPAE_PAGE_SZ_4K]		=   4 * 1024,
> +	[LPAE_PAGE_SZ_16K]		=  16 * 1024,
> +	[LPAE_PAGE_SZ_64K]		=  64 * 1024,
> +	[LPAE_PAGE_SZ_2M]		=   2 * 1024 * 1024,
> +	[LPAE_PAGE_SZ_32M]		=  32 * 1024 * 1024,
> +	[LPAE_PAGE_SZ_512M]		= 512 * 1024 * 1024,
> +	[LPAE_PAGE_SZ_1G]		=   1 * 1024 * 1024 * 1024,
> +	[LPAE_PAGE_SZ_16G]		=  16ULL * 1024 * 1024 * 1024,

Is there another use case the LPAE_PAGE_SZ constants in sight?
Otherwise, I would simply fill the array in the right order with the
actual values.

> +};
> +
> +static inline u32 is_aligned(u64 addr, u64 size)
> +{
> +	return (addr % size) == 0;
> +}
> +
> +static void pvu_tlb_enable(struct pvu_dev *dev, u16 tlbnum)
> +{
> +	struct pvu_hw_tlb *tlb;
> +
> +	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
> +	mmio_write32_field(&tlb->chain, PVU_TLB_LOG_DIS_MASK, 0);
> +	mmio_write32_field(&tlb->chain, PVU_TLB_EN_MASK, 1);
> +}
> +
> +static void pvu_tlb_disable(struct pvu_dev *dev, u16 tlbnum)
> +{
> +	struct pvu_hw_tlb *tlb;
> +
> +	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
> +	mmio_write32_field(&tlb->chain, PVU_TLB_EN_MASK, 0);
> +	mmio_write32_field(&tlb->chain, PVU_TLB_LOG_DIS_MASK, 1);
> +}
> +
> +static u32 pvu_tlb_is_enabled(struct pvu_dev *dev, u16 tlbnum)
> +{
> +	struct pvu_hw_tlb *tlb;
> +
> +	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
> +	if (mmio_read32_field(&tlb->chain, PVU_TLB_EN_MASK))
> +		return 1;
> +	else
> +		return 0;
> +}
> +
> +static int pvu_tlb_chain(struct pvu_dev *dev, u16 tlbnum, u16 tlb_next)
> +{
> +	struct pvu_hw_tlb *tlb;
> +
> +	if (tlb_next <= tlbnum || tlb_next <= dev->max_virtid)
> +		return -EINVAL;
> +
> +	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
> +	mmio_write32_field(&tlb->chain, PVU_TLB_CHAIN_MASK, tlb_next);
> +	return 0;
> +}
> +
> +static u32 pvu_tlb_next(struct pvu_dev *dev, u16 tlbnum)
> +{
> +	struct pvu_hw_tlb *tlb;
> +
> +	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
> +	return mmio_read32_field(&tlb->chain, PVU_TLB_CHAIN_MASK);
> +}
> +
> +static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
> +{
> +	int i;

Let's use an appropriate unsigned type here, e.g. unsigned int.

> +
> +	for (i = dev->max_virtid + 1; i < dev->num_tlbs; i++) {
> +		if (dev->tlb_data[i] == 0) {
> +			dev->tlb_data[i] = virtid << dev->num_entries;
> +			return i;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
> +{
> +	struct pvu_hw_tlb_entry *entry;
> +	struct pvu_hw_tlb *tlb;
> +	u32 i;
> +
> +	pvu_tlb_disable(dev, tlbnum);
> +	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
> +
> +	for (i = 0; i < dev->num_entries; i++) {
> +
> +		entry = &tlb->entry[i];
> +		mmio_write32(&entry->reg0, 0x0);
> +		mmio_write32(&entry->reg1, 0x0);
> +		mmio_write32(&entry->reg2, 0x0);
> +		mmio_write32(&entry->reg4, 0x0);
> +		mmio_write32(&entry->reg5, 0x0);
> +		mmio_write32(&entry->reg6, 0x0);
> +	}
> +
> +	mmio_write32(&tlb->chain, 0x0);
> +	pvu_tlb_disable(dev, tlbnum);
> +
> +	if (i < dev->max_virtid)
> +		dev->tlb_data[tlbnum] = 0x0 | i << dev->num_entries;
> +	else
> +		dev->tlb_data[tlbnum] = 0x0;
> +
> +}
> +
> +static void pvu_entry_enable(struct pvu_dev *dev, u16 tlbnum, u8 index)
> +{
> +	struct pvu_hw_tlb_entry *entry;
> +	struct pvu_hw_tlb *tlb;
> +
> +	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
> +	entry = &tlb->entry[index];
> +
> +	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_MODE_MASK,
> +		PVU_TLB_ENTRY_VALID);
> +
> +	dev->tlb_data[tlbnum] |= (1 << index);
> +}
> +
> +static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
> +	struct pvu_tlb_entry *ent)
> +{
> +	struct pvu_hw_tlb_entry *entry;
> +	struct pvu_hw_tlb *tlb;
> +	u8 pgsz;
> +
> +	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
> +	entry = &tlb->entry[index];
> +
> +	for (pgsz = 0; pgsz < ARRAY_SIZE(PVU_PAGE_SIZE_BYTES); pgsz++) {
> +		if (ent->size == PVU_PAGE_SIZE_BYTES[pgsz])
> +			break;
> +	}
> +
> +	if (pgsz >= ARRAY_SIZE(PVU_PAGE_SIZE_BYTES)) {
> +		printk("ERROR: PVU: %s: Unsupported page size %llx\n",
> +			__func__, ent->size);
> +		return -EINVAL;
> +	}
> +
> +	if (!is_aligned(ent->virt_addr, ent->size) ||
> +	    !is_aligned(ent->phys_addr, ent->size)) {
> +		printk("ERROR: PVU: %s: Address %llx => %llx is not aligned with size %llx\n",
> +			__func__, ent->virt_addr, ent->phys_addr, ent->size);
> +		return -EINVAL;
> +	}
> +
> +	mmio_write32(&entry->reg0, ent->virt_addr & 0xffffffff);
> +	mmio_write32_field(&entry->reg1, 0xffff, (ent->virt_addr >> 32));
> +	mmio_write32(&entry->reg2, 0x0);
> +
> +	mmio_write32(&entry->reg4, ent->phys_addr & 0xffffffff);
> +	mmio_write32_field(&entry->reg5, 0xffff, (ent->phys_addr >> 32));
> +	mmio_write32(&entry->reg6, 0x0);
> +
> +	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_PGSIZE_MASK, pgsz);
> +	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_FLAG_MASK, ent->flags);
> +
> +	/* Do we need "DSB NSH" here to make sure all writes are finised? */
> +	pvu_entry_enable(dev, tlbnum, index);
> +	return 0;
> +}
> +
> +static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
> +{
> +	struct pvu_hw_cfg *cfg;
> +	int i;

Again, please use unsigned where there are only unsigned indexes involved.

> +
> +	cfg = (struct pvu_hw_cfg *)dev->cfg_base;
> +
> +	dev->num_tlbs = mmio_read32_field(&cfg->config,
> +			PVU_CONFIG_NTLB_MASK);

No need to wrap this line.

> +	dev->num_entries = mmio_read32_field(&cfg->config,
> +			PVU_CONFIG_NENT_MASK);

Nicer this way:

	dev->num_entries =
		mmio_read32_field(&cfg->config, PVU_CONFIG_NENT_MASK);
> +
> +	if (max_virtid >= dev->num_tlbs) {
> +		printk("ERROR: PVU: Max virtid(%d) should be less than num_tlbs(%d)\n",
> +			max_virtid, dev->num_tlbs);
> +		return -EINVAL;
> +	}
> +
> +	dev->max_virtid = max_virtid;
> +	mmio_write32(&cfg->virtid_map1, 0);
> +	mmio_write32_field(&cfg->virtid_map2, PVU_MAX_VIRTID_MASK, max_virtid);
> +
> +	for (i = 0; i < dev->num_tlbs; i++) {
> +
> +		pvu_tlb_disable(dev, i);
> +		if (i < dev->max_virtid)
> +			dev->tlb_data[i] = 0x0 | i << dev->num_entries;
> +		else
> +			dev->tlb_data[i] = 0x0;
> +	}
> +
> +	/* Enable all types of exceptions */
> +	mmio_write32(&cfg->exception_logging_disable, 0x0);
> +	mmio_write32(&cfg->exception_logging_control, 0x0);
> +	mmio_write32_field(&cfg->enable, PVU_enable_MASK, PVU_enable_EN);
> +	return 0;
> +}
> +
> +
> +
> +/*
> + * Split a memory region into multiple pages, where page size is one of the PVU
> + * supported size and the start address is aligned to page size
> + */
> +static int pvu_entrylist_create(u64 ipa, u64 pa, u64 map_size,
> +	u64 flags, struct pvu_tlb_entry *entlist, u32 num_entries)
> +{
> +	u8 num_sizes = ARRAY_SIZE(PVU_PAGE_SIZE_BYTES);
> +	u64 page_size, vaddr, paddr;
> +	s64 size, i, aligned, count;

i is not really "integer". Choose a better name.

count neither needs to be signed nor that wide.

> +
> +	vaddr = ipa;
> +	paddr = pa;
> +	size = map_size;
> +	count  = 0;
> +
> +	while (size) {
> +
> +		if (count == num_entries) {
> +			printk("ERROR: PVU: Need more TLB entries for mapping %llx => %llx with size %llx\n",
> +				ipa, pa, map_size);
> +			return -EINVAL;
> +		}
> +
> +		aligned = 0;
> +
> +		/* Try size from largest to smallest */
> +		for (i = num_sizes - 1; i >= 0; i--) {
> +
> +			page_size = PVU_PAGE_SIZE_BYTES[i];
> +
> +			if (is_aligned(vaddr, page_size) &&
> +			    is_aligned(paddr, page_size) &&
> +			    size >= page_size) {

This compares signed with unsigned. If size can become negative along
this match, I would recommend defining page_size also the array it come
from signed as well.

> +
> +				entlist[count].virt_addr = vaddr;
> +				entlist[count].phys_addr = paddr;
> +				entlist[count].size = page_size;
> +				entlist[count].flags = flags;
> +
> +				count++;
> +				vaddr += page_size;
> +				paddr += page_size;
> +				size -= page_size;
> +				aligned = 1;
> +				break;
> +			}
> +		}
> +
> +		if (!aligned) {

You can save this extra variable: if (i < 0)

> +			printk("ERROR: PVU: Addresses %llx %llx aren't aligned to any of the allowed page sizes\n",

Let's break up this long line, even if that splits the message.

> +				vaddr, paddr);
> +			return -EINVAL;
> +		}
> +	}
> +	return count;
> +}
> +
> +static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
> +{
> +	struct pvu_tlb_entry temp;
> +	int i, j;

Same remark regarding signedness.

> +
> +	for (i = 0; i < num_entries; i++) {
> +		for (j = i; j < num_entries; j++) {
> +
> +			if (entlist[i].size < entlist[j].size) {
> +				temp = entlist[i];
> +				entlist[i] = entlist[j];
> +				entlist[j] = temp;
> +			}
> +		}
> +	}
> +}
> +
> +static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
> +{
> +	int i, ret, tlb_next, tlbnum, idx, num_ent;

Also check required signedness here as well, please.

> +	struct pvu_tlb_entry *ent, *cell_entries;
> +	struct pvu_dev *dev;
> +	u32 inst;
> +
> +	cell_entries = cell->arch.iommu_pvu.entries;
> +	num_ent = cell->arch.iommu_pvu.ent_count;
> +	if (num_ent == 0 || cell_entries == NULL)
> +		return 0;
> +
> +	/* Program same memory mapping for all of the instances */
> +	for (inst = 0; inst < pvu_count; inst++) {
> +		dev = &pvu_units[inst];
> +		if (pvu_tlb_is_enabled(dev, virtid))
> +			continue;
> +
> +		tlbnum = virtid;
> +		for (i = 0; i < num_ent; i++) {
> +
> +			ent = &cell_entries[i];
> +			idx = i % dev->num_entries;
> +
> +			if (idx == 0 && i >= dev->num_entries) {
> +				/* Find next available TLB and chain to it */
> +				tlb_next = pvu_tlb_alloc(dev, virtid);
> +				if (tlb_next < 0)
> +					return -ENOMEM;
> +				pvu_tlb_chain(dev, tlbnum, tlb_next);
> +				pvu_tlb_enable(dev, tlbnum);
> +				tlbnum = tlb_next;
> +			}
> +
> +			ret = pvu_entry_write(dev, tlbnum, idx, ent);
> +			if (ret)
> +				return ret;
> +		}
> +		pvu_tlb_enable(dev, tlbnum);
> +	}
> +	return 0;
> +}
> +
> +/*
> + * Actual TLB entry programming is deferred till config_commit
> + * Only populate the pvu_entries array for now
> + */
> +int pvu_iommu_map_memory(struct cell *cell,
> +		const struct jailhouse_memory *mem)

Wrong indention.

> +{
> +	struct pvu_tlb_entry *ent;
> +	int size, ret;
> +	u32 flags = 0;
> +
> +	if (pvu_count == 0)
> +		return 0;
> +
> +	if ((mem->flags & JAILHOUSE_MEM_DMA) == 0)
> +		return 0;
> +
> +	if (cell->arch.iommu_pvu.ent_count == MAX_PVU_ENTRIES)
> +		return -ENOMEM;
> +
> +	if (mem->flags & JAILHOUSE_MEM_READ)
> +		flags |= (LPAE_PAGE_PERM_UR | LPAE_PAGE_PERM_SR);
> +	if (mem->flags & JAILHOUSE_MEM_WRITE)
> +		flags |= (LPAE_PAGE_PERM_UW | LPAE_PAGE_PERM_SW);
> +	if (mem->flags & JAILHOUSE_MEM_EXECUTE)
> +		flags |= (LPAE_PAGE_PERM_UX | LPAE_PAGE_PERM_SX);
> +
> +	flags |= (LPAE_PAGE_MEM_WRITETHROUGH | LPAE_PAGE_OUTER_SHARABLE |
> +		LPAE_PAGE_IS_NOALLOC | LPAE_PAGE_OS_NOALLOC);
> +
> +	ent = &cell->arch.iommu_pvu.entries[cell->arch.iommu_pvu.ent_count];
> +	size = MAX_PVU_ENTRIES - cell->arch.iommu_pvu.ent_count;
> +
> +	ret = pvu_entrylist_create(mem->virt_start, mem->phys_start, mem->size,
> +			flags, ent, size);

Wrong indention.

> +	if (ret < 0)
> +		return ret;
> +
> +	cell->arch.iommu_pvu.ent_count += ret;
> +	return 0;
> +}
> +
> +int pvu_iommu_unmap_memory(struct cell *cell,
> +		const struct jailhouse_memory *mem)

also here

> +{
> +	/*
> +	 * dummy unmap for now
> +	 * PVU does not support dynamic unmap
> +	 * Works well for static partitioning

Huh!? But this breaks cell create/destroy cycles, without any user
notice, no? And will root cell devices keep access to inmate memory that
is carved out during cell creation?

Is that a hardware limitation?

Looks like a blocker...

> +	 */
> +	return 0;
> +}
> +
> +int pvu_iommu_config_commit(struct cell *cell)
> +{
> +	int ret, i, virtid;

signed/unsigned

> +
> +	if (pvu_count == 0)
> +		return 0;
> +
> +	if (!cell) {
> +		return 0;
> +	}

No need for brackets. In fact:

if (pvu_count == 0 || !cell)
	return 0;

> +
> +	/*
> +	 * Chaining the TLB entries adds extra latency to translate those
> +	 * addresses.
> +	 * Sort the entries in descending order of page sizes to reduce effects
> +	 * of chaining and thus reducing average translation latency
> +	 */
> +	pvu_entrylist_sort(cell->arch.iommu_pvu.entries,
> +			   cell->arch.iommu_pvu.ent_count);
> +
> +	for_each_stream_id(virtid, cell->config, i) {
> +		if (virtid == JAILHOUSE_INVALID_STREAMID)
> +			break;
> +		if (virtid > MAX_VIRTID)
> +			continue;
> +
> +		ret = pvu_iommu_program_entries(cell, virtid);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	cell->arch.iommu_pvu.ent_count = 0;
> +	return ret;
> +}
> +
> +static int pvu_iommu_cell_init(struct cell *cell)
> +{
> +	struct pvu_dev *dev;
> +	int i, virtid;

signed/unsigned

> +
> +	if (pvu_count == 0)
> +		return 0;
> +
> +	cell->arch.iommu_pvu.ent_count = 0;
> +	cell->arch.iommu_pvu.entries = page_alloc(&mem_pool, 1);
> +	if (!cell->arch.iommu_pvu.entries)
> +		return -ENOMEM;
> +
> +	dev = &pvu_units[0];
> +	for_each_stream_id(virtid, cell->config, i) {
> +
> +		if (virtid == JAILHOUSE_INVALID_STREAMID)
> +			break;
> +		if (virtid > MAX_VIRTID)
> +			continue;
> +
> +		if (pvu_tlb_is_enabled(dev, virtid))
> +			return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int pvu_iommu_flush_context(u16 virtid)
> +{
> +	struct pvu_dev *dev;
> +	int i, tlbnum, next;

signed/unsigned

> +
> +	for (i = 0; i < pvu_count; i++) {
> +
> +		dev = &pvu_units[i];
> +		tlbnum = virtid;
> +
> +		while (tlbnum) {
> +
> +			next = pvu_tlb_next(dev, tlbnum);
> +			pvu_tlb_flush(dev, tlbnum);
> +			tlbnum = next;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static void pvu_iommu_cell_exit(struct cell *cell)
> +{
> +	int i, virtid;

signed/unsigned

> +
> +	if (pvu_count == 0)
> +		return;
> +
> +	for_each_stream_id(virtid, cell->config, i) {
> +
> +		if (virtid == JAILHOUSE_INVALID_STREAMID)
> +			break;
> +		if (virtid > MAX_VIRTID)
> +			continue;
> +
> +		pvu_iommu_flush_context(virtid);
> +	}
> +
> +	cell->arch.iommu_pvu.ent_count = 0;
> +	page_free(&mem_pool, cell->arch.iommu_pvu.entries, 1);
> +	cell->arch.iommu_pvu.entries = NULL;
> +}
> +
> +static int pvu_iommu_init(void)
> +{
> +	struct jailhouse_iommu *iommu;
> +	struct pvu_dev *dev;
> +	int i, ret;

signed/unsigned

> +
> +	iommu = &system_config->platform_info.arm.iommu_units[0];
> +	for (i = 0; i < iommu_count_units(); iommu++, i++) {
> +
> +		if (iommu->type != JAILHOUSE_IOMMU_PVU)
> +			continue;
> +
> +		dev = &pvu_units[pvu_count];
> +		dev->cfg_base = paging_map_device(iommu->base,
> +					iommu->size);
> +		dev->tlb_base = paging_map_device(iommu->tipvu_tlb_base,
> +					iommu->tipvu_tlb_size);
> +
> +		ret = pvu_init_device(dev, MAX_VIRTID);
> +		if (ret)
> +			return ret;
> +
> +		pvu_count++;
> +	}
> +
> +	return pvu_iommu_cell_init(&root_cell);
> +}
> +
> +DEFINE_UNIT_SHUTDOWN_STUB(pvu_iommu);
> +DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(pvu_iommu);
> +DEFINE_UNIT(pvu_iommu, "PVU IOMMU");
> diff --git a/hypervisor/arch/arm64/ti-pvu_priv.h b/hypervisor/arch/arm64/ti-pvu_priv.h
> new file mode 100644
> index 00000000..acba338b
> --- /dev/null
> +++ b/hypervisor/arch/arm64/ti-pvu_priv.h
> @@ -0,0 +1,141 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) 2018 Texas Instruments Incorporated - http://www.ti.com/
> + *
> + * TI PVU IOMMU unit private headers
> + *
> + * Authors:
> + *  Nikhil Devshatwar <nikhil.nd@ti.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#ifndef __TI_PVU_PRIV_H__
> +#define __TI_PVU_PRIV_H__
> +
> +#define PVU_NUM_TLBS			64
> +#define PVU_NUM_ENTRIES			8
> +
> +#define PVU_CONFIG_NTLB_MASK		(0xff)
> +#define PVU_CONFIG_NENT_MASK		(0xf << 16)
> +
> +#define PVU_MAX_VIRTID_MASK		(0xfff)
> +
> +#define PVU_enable_EN			(0x1)
> +#define PVU_enable_DIS			(0x0)
> +#define PVU_enable_MASK			(0x1)
> +
> +struct pvu_hw_cfg {
> +	u32		pid;
> +	u32		config;
> +	u8		resv_16[8];
> +	u32		enable;
> +	u32		virtid_map1;
> +	u32		virtid_map2;
> +	u8		resv_48[20];
> +	u32		exception_logging_disable;
> +	u8		resv_260[208];
> +	u32		destination_id;
> +	u8		resv_288[24];
> +	u32		exception_logging_control;
> +	u32		exception_logging_header0;
> +	u32		exception_logging_header1;
> +	u32		exception_logging_data0;
> +	u32		exception_logging_data1;
> +	u32		exception_logging_data2;
> +	u32		exception_logging_data3;
> +	u8		resv_320[4];
> +	u32		exception_pend_set;
> +	u32		exception_pend_clear;
> +	u32		exception_ENABLE_set;
> +	u32		exception_ENABLE_clear;
> +	u32		eoi_reg;
> +};
> +
> +#define PVU_TLB_ENTRY_VALID		(2)
> +#define PVU_TLB_ENTRY_INVALID		(0)
> +#define PVU_TLB_ENTRY_MODE_MASK		(0x3 << 30)
> +#define PVU_TLB_ENTRY_FLAG_MASK		(0xff7f)
> +#define PVU_TLB_ENTRY_PGSIZE_MASK	(0xf << 16)
> +
> +#define PVU_ENTRY_INVALID		(0 << 30)
> +#define PVU_ENTRY_VALID			(2 << 30)
> +
> +#define LPAE_PAGE_SZ_4K			0
> +#define LPAE_PAGE_SZ_16K		1
> +#define LPAE_PAGE_SZ_64K		2
> +#define LPAE_PAGE_SZ_2M			3
> +#define LPAE_PAGE_SZ_32M		4
> +#define LPAE_PAGE_SZ_512M		5
> +#define LPAE_PAGE_SZ_1G			6
> +#define LPAE_PAGE_SZ_16G		7
> +
> +#define LPAE_PAGE_PERM_UR		(1 << 15)
> +#define LPAE_PAGE_PERM_UW		(1 << 14)
> +#define LPAE_PAGE_PERM_UX		(1 << 13)
> +#define LPAE_PAGE_PERM_SR		(1 << 12)
> +#define LPAE_PAGE_PERM_SW		(1 << 11)
> +#define LPAE_PAGE_PERM_SX		(1 << 10)
> +
> +#define LPAE_PAGE_MEM_DEVICE		(0 << 8)
> +#define LPAE_PAGE_MEM_WRITEBACK		(1 << 8)

These two are unused - accidentally?

> +#define LPAE_PAGE_MEM_WRITETHROUGH	(2 << 8) > +
> +#define LPAE_PAGE_PREFETCH		(1 << 6)
> +#define LPAE_PAGE_INNER_SHARABLE	(1 << 5)

These two as well. I would recommend adding only used constants.

> +#define LPAE_PAGE_OUTER_SHARABLE	(1 << 4)
> +
> +#define LPAE_PAGE_IS_NOALLOC		(0 << 2)
> +#define LPAE_PAGE_IS_WR_ALLOC		(1 << 2)
> +#define LPAE_PAGE_IS_RD_ALLOC		(2 << 2)
> +#define LPAE_PAGE_IS_RDWR_ALLOC		(3 << 2)
> +
> +#define LPAE_PAGE_OS_NOALLOC		(0 << 0)
> +#define LPAE_PAGE_OS_WR_ALLOC		(1 << 0)
> +#define LPAE_PAGE_OS_RD_ALLOC		(2 << 0)
> +#define LPAE_PAGE_OS_RDWR_ALLOC		(3 << 0)

Here are some unused consts as well.

> +
> +struct pvu_hw_tlb_entry {
> +	u32		reg0;
> +	u32		reg1;
> +	u32		reg2;
> +	u32		reg3;
> +	u32		reg4;
> +	u32		reg5;
> +	u32		reg6;
> +	u32		reg7;

Do these regs really have no names? Can we use an array then?

> +};
> +
> +#define PVU_TLB_EN_MASK			(1 << 31)
> +#define PVU_TLB_LOG_DIS_MASK		(1 << 30)
> +#define PVU_TLB_FAULT_MASK		(1 << 29)
> +#define PVU_TLB_CHAIN_MASK		(0xfff)
> +
> +struct pvu_hw_tlb {
> +	u32			chain;
> +	u8			resv_32[28];
> +	struct pvu_hw_tlb_entry	entry[8];
> +	u8			resv_4096[3808];
> +};
> +
> +struct pvu_tlb_entry {
> +	u64		virt_addr;
> +	u64		phys_addr;
> +	u64		size;
> +	u64		flags;
> +};
> +
> +struct pvu_dev {
> +	u32		*cfg_base;
> +	u32		*tlb_base;
> +
> +	u32		num_tlbs;
> +	u32		num_entries;
> +	u16		max_virtid;
> +
> +	u16		tlb_data[PVU_NUM_TLBS];
> +};
> +
> +#endif /* __TI_PVU_PRIV_H__ */
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index d435b9f7..9bb84492 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -203,6 +203,7 @@ struct jailhouse_pci_capability {
>   #define JAILHOUSE_IOMMU_AMD		1
>   #define JAILHOUSE_IOMMU_INTEL		2
>   #define JAILHOUSE_IOMMU_SMMUV3		3
> +#define JAILHOUSE_IOMMU_PVU		4
>
>   struct jailhouse_iommu {
>   	__u32 type;
> @@ -213,6 +214,9 @@ struct jailhouse_iommu {
>   	__u8 amd_base_cap;
>   	__u8 amd_msi_cap;
>   	__u32 amd_features;
> +
> +	__u64 tipvu_tlb_base;
> +	__u32 tipvu_tlb_size;

Time to stick the amd fields in their own sub-struct, as well as the
tipvu ones, and then put both struct into a union. Analogously to
jailhouse_system.platform_info.

>   } __attribute__((packed));
>
>   struct jailhouse_pio {
>

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ca2ab556-aa49-0525-29f1-67eff0d119a1%40web.de.
