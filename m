Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBE6P7TYAKGQET2T35NI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5527E13C6A5
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 15:54:12 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id t17sf12959wmi.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 06:54:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579100052; cv=pass;
        d=google.com; s=arc-20160816;
        b=dO/AG1yRStTRVYphnJvdNdEVhNnG+k/QarreOUh2ZK13Ag9xt249OpeFgQMZJc7xZJ
         eH05h8Ak9lTtgOr+7Lyrvy4wLDro1QO2zDyGYPsf3ovonolCznl5+v+TLtZjGoqk9iI0
         Zo7Qcj48TJD0x4VTxv75so5zHwPYMHrPNYQsqT3rY/Iu+IT+FXQ1hsHRYuo4YL5t7kr2
         9qAeq1gDKD+1uh3LMwnaHzxjTCEVfliUhXK/Qk3S/27DZzCM+Tu6AO/phJ4/BWTfe9Es
         x0yNzmfyUITQWa5WNhRMFqvdJpFQUpG75WM3rVKI/8/gyUH3ymfktua8wVaF0meEzlim
         sE7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=fGxxAH414tUA6Evk9lVy0jMPcBkbUY9+6ErtXPvRHUs=;
        b=JPQedgzWXZtkl8OhxiSMUcd8UBJlDlFuByZYbrROekP6AS2TDOh8lpX+xLGzPylE1d
         fyLfrzd4kXGJ18U/1tdlVk23gG7YrGa+qGdIFmU3esWULnER5dO1LX26MofX+zCRB+9p
         EquWJCCKt//vUFVZTbxiOkSIKw8gUBZYmtCaVqRsGNsAKLu754QyAIgwu/3pfSHL/oJc
         n3CNzPOFbjUWst2LqI78PgYyFpwIyfWf52rutZQMhlze1qAzfYwEV11c+F4154rV4MF+
         3Dd7Djl/hmxPgJWg3X9K6SVfef+FCcGre5Y6xiE/Ve3meB1Vj8FH/80w9KNdnpH8gwBx
         NR2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=JOm7BqIM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fGxxAH414tUA6Evk9lVy0jMPcBkbUY9+6ErtXPvRHUs=;
        b=DndeWi1LTA8AmFiq7K7L9+SIz+lwnC1wNE7Mo2vqVbeHqDnJa9Knok4RV0Pls5xb71
         pbBZ6MgQ+M7ymeSKy9tr91RMN3M02IA880kA0As5zwaa2OG8D8TpXkZftkmuzbUi9qEN
         3MMGf9vpOz48L/R+tvEKWeuwQUNfP9uMWRbkv703LO8WbEKCaUriTeZ7lFpYxvXt3w1g
         D7G7Tt97t/gWvEiRpNg8tNBtBjw/c/A3WA2beMdHtf9WEwAP+hmsybhi/ScwTUfqN9Rs
         3C5SFSZguyt2aG+XNOMDyTsGMLgq+groPr5E34HCgPNNYNKeG87H57cmPCddebFoaGsC
         Lj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fGxxAH414tUA6Evk9lVy0jMPcBkbUY9+6ErtXPvRHUs=;
        b=ihh7GIdXwxEBM1wdVUsi86zMGD9GfNMxeIShgZnmQ8ekKQyWYZDXCNaw2q6WXrcXlZ
         4S2HSqy57OyEFoIVX+8anmstJDTpisZTjihwYY8pahEW2W/X5qf25n/I4SCTAYYMt5dK
         yQZgTeKZZbgEV/aMflOrWcHNnHkRRC2Btewk091D6kAo/aTEAnzwm6UEq64PyzK6sH5K
         yTDIwHqxyCjsds3+rvK3qXI/uUf56tBgYyGP84Sy/VVDnbZIZB5N9fSbT5HGFHpg/Jkq
         aHD34mSEXD/ovWhauwLPlIHpKRFA+SVywcfYvxZEx4vShjvrIeUGRvrXd11QpgK9igAG
         v52Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW0XZ2Cc+c+2fvgoka0uRVT72PHPyPlzu4ZUOt0mQhbRSCo5mch
	TSOJd5Uw1Dh1Uyz0HlbHwZs=
X-Google-Smtp-Source: APXvYqxYoXo4JRB5YTXxPL+y4gsDcGTiNYngdRvcl7e51+J31HqX65NxKWvkQqpsKEx5J7nujzCtlA==
X-Received: by 2002:a05:6000:12c9:: with SMTP id l9mr33027327wrx.304.1579100051962;
        Wed, 15 Jan 2020 06:54:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c452:: with SMTP id l18ls1610623wmi.1.canary-gmail; Wed,
 15 Jan 2020 06:54:11 -0800 (PST)
X-Received: by 2002:a7b:cd11:: with SMTP id f17mr177830wmj.48.1579100051317;
        Wed, 15 Jan 2020 06:54:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579100051; cv=none;
        d=google.com; s=arc-20160816;
        b=SQIJ8D/2kYxIvnSm3j/5V7AE/Nq3TV0IvflnlbtAHvGUrgFTKzgwY7STVtAxSb7/nL
         itTUk5LsY1s1idhdvUPEJ96HOUDfd/8ShEoBm3MbxNIP1q1dreBXrcttMeGHnaDDZmc6
         f4FwQego2nAD60DcteLntcVno/mLdhwaf3DYPX0I3VKYzx8pEK74NYOa0gaXUghiWj78
         +uqRdncX7hPKHwb5puLFQwY6SRVnJs0uFrOnBZpqwrI8DeFfVhjR0LmandaJV/G5A2HG
         +FeQUfsmEtve5lcquyLjd2Rxr3If0kT5sXyydnY+AEMIiuOUmxGY/vCoUfYO/UZgc0IK
         +TOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=8lhLroB5dMACj+S07chJEity7Lb4ESAITfivqom7jxE=;
        b=bAcodbVF7Ezt/oHl5MBgVavxpuL1tq4ZleElCpK09nuVE/IJKenUWGmd8pvkipwL21
         qGtItVljo9nvvavqgRjc4+SvKDMCDhLYGsgiisxCP+W2g7PAn8GTRHiCh8TqW6HZ5tNW
         76yNtkriPq91XqHZvszduCP+P2rVzhgdemGsecj5hnXWk8w3NoK4GwFNwaXICZTMA7r0
         m4ef1/oZIyzefCeTlQwiIHMYAJ+1jErW9ql5UFviq7CVRWNGPHTSr7nyZa6DXUD7m/fZ
         nVknigFGFiO3s0loyrSaJxfVuoiKvOMQLVEXJjjCfXm3FdTDk+M2SIXKG0TX6Jo07C2D
         eqsw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=JOm7BqIM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id s139si296293wme.2.2020.01.15.06.54.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 06:54:11 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 47yVhf6Y60zxws;
	Wed, 15 Jan 2020 15:54:10 +0100 (CET)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 15 Jan
 2020 15:54:10 +0100
Subject: Re: [PATCH 12/19] inmates: Rewrite ivshmem-demo
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
 <3d123343f83d3b1ff2ed4038ab4289544b7fac23.1578320435.git.jan.kiszka@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <685fe5b5-e63c-7996-fb87-f403fd7ea3dd@oth-regensburg.de>
Date: Wed, 15 Jan 2020 15:54:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <3d123343f83d3b1ff2ed4038ab4289544b7fac23.1578320435.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=JOm7BqIM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 1/6/20 3:20 PM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Provide a bare-metal demo inmate for the new ivshmem device, exploiting
> almost all its features: state table, unidirectional shared memory,
> multi-peer support, multiple interrupt vectors. This demo will be
> accompanied by a Linux tool in order to span 3-peer demo between root,
> bare-metal and a secondary Linux cell.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  inmates/demos/arm/Makefile       |   3 +-
>  inmates/demos/arm64/Makefile     |   3 +-
>  inmates/demos/ivshmem-demo.c     | 227 +++++++++++++++++++++++++++++++++++++++
>  inmates/demos/x86/Makefile       |   2 +-
>  inmates/demos/x86/ivshmem-demo.c | 169 -----------------------------
>  5 files changed, 232 insertions(+), 172 deletions(-)
>  create mode 100644 inmates/demos/ivshmem-demo.c
>  delete mode 100644 inmates/demos/x86/ivshmem-demo.c
> 
> diff --git a/inmates/demos/arm/Makefile b/inmates/demos/arm/Makefile
> index b0fda4ed..b1c25497 100644
> --- a/inmates/demos/arm/Makefile
> +++ b/inmates/demos/arm/Makefile
> @@ -12,9 +12,10 @@
>  
>  include $(INMATES_LIB)/Makefile.lib
>  
> -INMATES := gic-demo.bin uart-demo.bin
> +INMATES := gic-demo.bin uart-demo.bin ivshmem-demo.bin
>  
>  gic-demo-y	:= gic-demo.o
>  uart-demo-y	:= uart-demo.o
> +ivshmem-demo-y	:= ../ivshmem-demo.o
>  
>  $(eval $(call DECLARE_TARGETS,$(INMATES)))
> diff --git a/inmates/demos/arm64/Makefile b/inmates/demos/arm64/Makefile
> index 49abe09b..2af4f0ca 100644
> --- a/inmates/demos/arm64/Makefile
> +++ b/inmates/demos/arm64/Makefile
> @@ -12,9 +12,10 @@
>  
>  include $(INMATES_LIB)/Makefile.lib
>  
> -INMATES := gic-demo.bin uart-demo.bin
> +INMATES := gic-demo.bin uart-demo.bin ivshmem-demo.bin
>  
>  gic-demo-y	:= ../arm/gic-demo.o
>  uart-demo-y	:= ../arm/uart-demo.o
> +ivshmem-demo-y	:= ../ivshmem-demo.o
>  
>  $(eval $(call DECLARE_TARGETS,$(INMATES)))
> diff --git a/inmates/demos/ivshmem-demo.c b/inmates/demos/ivshmem-demo.c
> new file mode 100644
> index 00000000..e7a7f711
> --- /dev/null
> +++ b/inmates/demos/ivshmem-demo.c
> @@ -0,0 +1,227 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) Siemens AG, 2014-2020
> + *
> + * Authors:
> + *  Henning Schild <henning.schild@siemens.com>
> + *  Jan Kiszka <jan.kiszka@siemens.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */

missing newline

> +#include <inmate.h>
> +
> +#define VENDORID			0x110a
> +#define DEVICEID			0x4106
> +
> +#define BAR_BASE			0xff000000
> +
> +#define IVSHMEM_CFG_STATE_TAB_SZ	0x04
> +#define IVSHMEM_CFG_RW_SECTION_SZ	0x08
> +#define IVSHMEM_CFG_OUT_SECTION_SZ	0x10
> +#define IVSHMEM_CFG_ADDRESS		0x18
> +
> +#define JAILHOUSE_SHMEM_PROTO_UNDEFINED	0x0000
> +
> +#if defined(__x86_64__)
> +#define DEFAULT_IRQ_BASE	32
> +#elif defined(__arm__) || defined(__aarch64__)
> +#define DEFAULT_IRQ_BASE	(comm_region->vpci_irq_base + 32)
> +#else
> +#error Not implemented!
> +#endif

Hmm. We could save the ifdeffery, if we provide
comm_region->vpci_irq_base for all architectures.

  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/685fe5b5-e63c-7996-fb87-f403fd7ea3dd%40oth-regensburg.de.
