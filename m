Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBBF67TYAKGQEV4MP2DQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F7513C5BC
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 15:17:41 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id f15sf8124519wrr.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 06:17:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579097860; cv=pass;
        d=google.com; s=arc-20160816;
        b=RPOU45qRbi3AWluxs50SW6KmWWMaFrpr1Y9AS0qVD09Q7rMIxOf2vjW11N3/eJRNnD
         3c+yiZ+z7/hBd4N7fg6QumJs1AWFIYvgh1R8BlJ02LLzkdfNQ+cy1LWzCooqs1PzLobb
         OikKDjnOcNqwJxKdsr96LVEDRB+VaHwGDSxbl+XkwH2UhPAfw0HZ1opHLiTp+SCPQUmp
         zrG86pN5H6hG7XPNWjXxvnaGqdmB2lv2eMEDP2GdRK3YHBr+mWv5ofk667+gCTPcyRzc
         PNPB2PQA0ANYZO/38wrL+/51aL2oy1x75XseuZdul6caBc9A3sVIu5Gk7JGK9yqjAlLl
         UZyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=QybOZx5WBjcvmjt0YUeuIrzYJSm3RmRXopJ0LibmfDQ=;
        b=xiw0t0/19MWn/BjAK78fCfEy/BvQfwyr8Wzthx6j1yfEauk+y+a9c8OHtSkS4a9QIp
         BhRiAxyLT0bPUnYL0Ak/2g76/CJQfklb8D7GTejVYc3iAfOGBzmOwQKU9dNHB4SatWSD
         zAiQnePnibFjNEuffyp+E+B/q3C1g6XeFPSzZPzA/Yz+0T0d2chkzSM65nQLf+xXRCcA
         vto8esB1NZ6Ol1HYJxLnFVXmd7RUS3k35jMYy2763pWTk3XO+sfll6XOyNcJFLDMJavM
         z8I/tdd24za8U09V1UTJUreGCYgrqRKCnhoCg4vziY0htg4WhJuZTFROJ+YFgNGddw9t
         Qgwg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=w8wl5mJ+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QybOZx5WBjcvmjt0YUeuIrzYJSm3RmRXopJ0LibmfDQ=;
        b=eXY3UnbXmU0Atb8pBHePp0mWKP3a42o0nxzFk9a5U0xwVqXzaW/CPIx6ufyvl9uZZO
         0IMOzNevDJZGEbo25UYv9mRVQDaGgqq5NCzaDJWzPh919XMTlJ9taW8R3jSPXU9h1BPu
         4RcN/RK8AbgwXZ1shXDcLqFquOxw5Rx3Ugvxsl7Yg1nvc8t1MqiN0lOiL4dRucnB/9LD
         ZNUy3ovrRPH45LWRN0Ygw+2IVeooX1ZWQ6GDmgNFraJ0IcIWHszDrzIg8MUQ/9se5Xg5
         c88fg46zSLaNt10uAx9lr/HcD8scxIJ5DPJsXaqCg3K6W4fvDgTTNiIrgPYjgu8/ZWpY
         A3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QybOZx5WBjcvmjt0YUeuIrzYJSm3RmRXopJ0LibmfDQ=;
        b=WXgreehCOgwGg5zbLe+XVzQheMXrEr+6BgvRzg+H+siaW6r6wbcgj7R/AP8wvMRVEf
         DnGkMk5Ge0h4Gw/ckIRB6MheG3WxhzQ85QomfyxxPu5wHXL0KhnP0R9E+ElKAYnfxrji
         pSlDXg6PdtSrbkgWayfKedX63uiEpYeQHXltNU6Z3sJ8pEV638i1VoGOhd5THNePl2NG
         ZSy7MSbzqPPmdIRBZldEUE6Np16iFLUyMqlseT0ZOSDSvcXqhMw3fX+06F8ahqfgkOd7
         pMxqnI2wEYw+s6PhIOEIX5xJZ8JVjhsrX0+dXcXKoTyhH0sQpSYLwinbo31jg7pLs33z
         gPBA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUO5GSYvNOZI1tHLQV5CpakMSB9wQ/IWsgTHEk6sQHcho7GT9+A
	drF+CVk6rKoLwJbXhQw/drA=
X-Google-Smtp-Source: APXvYqypuZQnmLZxccgNKWAEzEnAT/3A86iMRv4Ul4Vh8kvO2abAcZQOZeVev90+EOPhq/pxg3SVkg==
X-Received: by 2002:a1c:4144:: with SMTP id o65mr34585829wma.81.1579097860744;
        Wed, 15 Jan 2020 06:17:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f403:: with SMTP id g3ls6886778wro.3.gmail; Wed, 15 Jan
 2020 06:17:40 -0800 (PST)
X-Received: by 2002:a5d:428c:: with SMTP id k12mr31162989wrq.57.1579097860034;
        Wed, 15 Jan 2020 06:17:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579097860; cv=none;
        d=google.com; s=arc-20160816;
        b=ws7zjGnW8IMHtgWITwfrJv3SjIybp/iUQaHBtHzuIxgcJB8uy7UDqzlQNjBcsd/Ad4
         b+lS6k1CI9Icm1o+i8nYMLhQ911i7gBmNNtTeFQ3s4Fvim4Aw6bX7AldkpW8sufzdxQe
         7tiM43SXdAFAnn7E8W0rmQgEr4PjWKlJ0rG+Y32r0Tbe/y1x9cXzLGH5dAylLg5aImoG
         iwUHu12kThHLQ/tn+OTnu/g6qU1otCXtXTw1xYBqXpIZADcryOCXoKmNx8sEDVsp0cAf
         Pi3WdHQbtDOxsti4awAAiH3rYMG5jMAU48//Bal8fL2fTnosCzioHkjdk0DZGUTFkPOC
         U1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=N8jaQ9T5Q89JQsnB2fnGBvjNO5V/9JqtaZ497ammw+E=;
        b=0lhXet3414oo6p1wdrPB2izsjfeHkrh4HGysZbNFHDMOjVsRW6eC32jKxf0gzcQlub
         ryHG91VAHkzE0kfFSwj98tfgB3FKKgf7C9/Q1+zHWROyRxDLQlZDtSUaknVS/s0TjTO8
         IF3gyP3OdTjSnUlM1MshW2YaeKOSBox8C/af2gYUSSc9+/Wr2LiT2ODh3W7XQTkY8KKk
         ciqLUY5vJHX2J0If9gdWekq76cmSelbQ9MjnbMUp31/kyKS2neCGr9UZKm+coil4qkWR
         GfFBs9bi2IccfVSMiJ+Z22wTl+skkq2hV+vwJ8RVTkSaSy1dUqWqCByxs8lP5ZBTZS2y
         dxbg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=w8wl5mJ+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id m12si881105wrq.1.2020.01.15.06.17.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 06:17:40 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 47yTtW44Mczxws;
	Wed, 15 Jan 2020 15:17:39 +0100 (CET)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 15 Jan
 2020 15:17:39 +0100
Subject: Re: [PATCH 07/19] core: Provide pci_mmconfig_base via Comm Region on
 all archs
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
 <856047f215d285e6a02ce2e13bb3e237a513cc67.1578320435.git.jan.kiszka@siemens.com>
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
Message-ID: <ea7db750-e819-3855-a96a-1ea4197e4307@oth-regensburg.de>
Date: Wed, 15 Jan 2020 15:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <856047f215d285e6a02ce2e13bb3e237a513cc67.1578320435.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=w8wl5mJ+;
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
> This will simplify PCI support in bare-metal ARM inmates.

This patch requires update of Documentation/hypervisor-interfaces.txt:
PCI MMConfig address is no longer x86 specific, it moved to the generic
part.

  Ralf

> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hypervisor/arch/x86/control.c              | 2 --
>  hypervisor/control.c                       | 2 ++
>  include/arch/x86/asm/jailhouse_hypercall.h | 2 --
>  include/jailhouse/hypercall.h              | 6 ++++--
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/control.c b/hypervisor/arch/x86/control.c
> index 11e5aabd..4f667d43 100644
> --- a/hypervisor/arch/x86/control.c
> +++ b/hypervisor/arch/x86/control.c
> @@ -96,8 +96,6 @@ void arch_cell_reset(struct cell *cell)
>  
>  	comm_region->pm_timer_address =
>  		system_config->platform_info.x86.pm_timer_address;
> -	comm_region->pci_mmconfig_base =
> -		system_config->platform_info.pci_mmconfig_base;
>  	/* comm_region, and hence num_cpus, is zero-initialised */
>  	for_each_cpu(cpu, cell->cpu_set)
>  		comm_region->num_cpus++;
> diff --git a/hypervisor/control.c b/hypervisor/control.c
> index 16f2cc13..a0a7532c 100644
> --- a/hypervisor/control.c
> +++ b/hypervisor/control.c
> @@ -655,6 +655,8 @@ static int cell_start(struct per_cpu *cpu_data, unsigned long id)
>  	if (CELL_FLAGS_VIRTUAL_CONSOLE_ACTIVE(cell->config->flags))
>  		comm_region->flags |= JAILHOUSE_COMM_FLAG_DBG_PUTC_ACTIVE;
>  	comm_region->console = cell->config->console;
> +	comm_region->pci_mmconfig_base =
> +		system_config->platform_info.pci_mmconfig_base;
>  
>  	pci_cell_reset(cell);
>  	arch_cell_reset(cell);
> diff --git a/include/arch/x86/asm/jailhouse_hypercall.h b/include/arch/x86/asm/jailhouse_hypercall.h
> index 9e72b277..4872fc32 100644
> --- a/include/arch/x86/asm/jailhouse_hypercall.h
> +++ b/include/arch/x86/asm/jailhouse_hypercall.h
> @@ -99,8 +99,6 @@ extern bool jailhouse_use_vmcall;
>  struct jailhouse_comm_region {
>  	COMM_REGION_GENERIC_HEADER;
>  
> -	/** Base address of PCI memory mapped config (x86-specific). */
> -	__u64 pci_mmconfig_base;
>  	/** I/O port address of the PM timer (x86-specific). */
>  	__u16 pm_timer_address;
>  	/** Number of CPUs available to the cell (x86-specific). */
> diff --git a/include/jailhouse/hypercall.h b/include/jailhouse/hypercall.h
> index 329f6e2e..4fae9481 100644
> --- a/include/jailhouse/hypercall.h
> +++ b/include/jailhouse/hypercall.h
> @@ -118,8 +118,10 @@
>  	volatile __u32 reply_from_cell;					\
>  	/** Holds information special flags */				\
>  	volatile __u32 flags;						\
> -	/** Debug console that may be accessed by the inmate */		\
> -	struct jailhouse_console console;
> +	/** Debug console that may be accessed by the inmate. */	\
> +	struct jailhouse_console console;				\
> +	/** Base address of PCI memory mapped config. */		\
> +	__u64 pci_mmconfig_base;
>  
>  #include <asm/jailhouse_hypercall.h>
>  
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ea7db750-e819-3855-a96a-1ea4197e4307%40oth-regensburg.de.
