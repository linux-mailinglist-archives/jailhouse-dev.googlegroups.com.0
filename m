Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBA6B7TYAKGQE3XW2LOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D8113C5DD
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 15:24:03 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id k25sf4184180lji.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 06:24:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579098243; cv=pass;
        d=google.com; s=arc-20160816;
        b=EhkrFhsrhK751RbVGdswSk5oo1VdNIiQlEfgVusPIfYQ6Ul7OZa2iHvRRwZNaBzuWA
         yX/UzWNPYDBskTL6ukG3UM1aLZjsOB4jzXilTN+YXVXTSNj0JHpGcpaK7No3TPLkU9G3
         rYIxcbRDKW3eTTs23lEtIn5gci7ohK4fI2/dRgZkpbUtakxgy6mpFkVkBlqIXVXdQCGm
         i+JnuTBF8CqS7XtPa3mpWpNQNEloD5fo1UHAwbiAF7YmpvLcNymdihPJVn+lTnVi8IT0
         0m7wO3F3cAnQlfaWC1IhHUlbFw0FmaT8kAOOTfOOWmoT2ko7JnGHOt9jXRn4tlPwiqpl
         PREQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=5fNTxl39HVSZudEAsmOHy0Wn9IusUlYfF+/jheInH4k=;
        b=U3wP2rKywyUHIWEFOi7kqxsklzUsd+78lNpqFm0cUPSZdkdQUSvRZu6Uvr2SM4ez3q
         nG4JBU8PLBBjF9eWLRur4XKlkUw8yIApD8gCMsTMJ6fwwqzReVNoHsGYpWBZDqK8Ya2K
         DjezUHhwxWo7j/fpDyrvyVyStCj3ZB4b59aIFikqWwexdwjNKMCFlD96LttZ11tIC2KH
         BfZyJARF0l7r2CzE/AtTeigSDU9/hlocK3E3PbizBXi2LRQLrxLP2GE2XzXPKHBb+9I3
         Gqh2LyCXTiJQMHrOVLFGVwTYaxUPawA4N3zsSsoaGS0iEdw+JyecSJn5fctP/uvaLyND
         9OtA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=MqD8QSt3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5fNTxl39HVSZudEAsmOHy0Wn9IusUlYfF+/jheInH4k=;
        b=QglPgNMfXoAQ4mTAO0bDIiCUVvSfE+UDnxhvIPJIbU2rm0uP/tREFFtZMrTrna067Y
         nbDTKwOaEMP68nRo9rbST9+oo9tbYeVgE209kJz7M42pOstKeu8NeXeizcHNhYbw8ozv
         MOH8quAqeZRBCvU0+wsK2BEFaGUwwc+kbTmo/YFB7+V9XsQpOviriV/EQLKyQrHo0Omf
         sa9CHGGVY61IWUO2Rms7kaCGn+ScucJ6HiqTuGBXZHxZedPk1+6JOLl1Iwpjxh74Acjx
         Yo6JKFLaJB59regOwEnIq8ZzHZjLJ10QK+R3VulH6Dr8TZuwWAZNnZ6okl+aINn5UHTF
         HOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5fNTxl39HVSZudEAsmOHy0Wn9IusUlYfF+/jheInH4k=;
        b=Bssu8UuCAlT40tSay2hTikYj8w3M04Z3bKGH+YpeAP/PonvUdKGofDl5cYtFL2NgcJ
         RvyMlg++HoUt1VhCfbRk46nH7VdVY9CjxfmemBAQRvYM0KuMFhEHgtDJPLDAhJlxMFo5
         D1x6JXqjZ7eyU988/ZuJVtFcVqRPiv5DLZoTHvjar7vLejHvfLdr8s8XKTfPEXmiVOqu
         g7Dq2VHkBoyzLgpn5i0gZAQHya5TkUGB0NZo22Y3gJFrwyhciPsnoznNCahl3v0Uaisd
         4WO+gAGX/Q6oZngd5MuPtYm7Bq1l+i8T/8CX9rflgv3yWPPmkFhYzE0a3vJ8rSDbK6A3
         lnvA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVuOBZHux5UWYlEtyp2i2s9aEh1Vae0anXBn4lQeBtxxLY0ONwK
	qydQWmxdA+NIHN0/MONufgU=
X-Google-Smtp-Source: APXvYqzmYR5tPtBOjArYXGKikoDtkuFdIY/ts/KVU51w50p2Q4Ckg7tiTsZ3zTZzj38eng8qGBOU3Q==
X-Received: by 2002:a2e:9b9a:: with SMTP id z26mr1724888lji.181.1579098243455;
        Wed, 15 Jan 2020 06:24:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5219:: with SMTP id a25ls1822916lfl.16.gmail; Wed, 15
 Jan 2020 06:24:02 -0800 (PST)
X-Received: by 2002:a05:6512:1dd:: with SMTP id f29mr4991751lfp.106.1579098242839;
        Wed, 15 Jan 2020 06:24:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579098242; cv=none;
        d=google.com; s=arc-20160816;
        b=020ScNFN98BLjbIyV6Z+d8aU+DZhfbHO06enxIIpstHkqpDuLd1ttGyOI96YZ92i0x
         N+Pwd2OWLXRYOP8fkgeZGq3s5wwX1YJmYaTnizt2qeQZkDRq1c3ST2GI0neSYhZH4ig+
         fHUM9WpLzXp0DxO/aFQneYUf+6ZjeycCYIj/XJV7k+DqwYDchMUME4PrsqJf4J3H+5J0
         NR7PZdkV9qmEsEWTGTZK+hMqLQc+m6B43Xkhnp2fYuiPPNVcncnP/Dnxt0ZRdTUvoRj+
         dAvZU5cRkmGfZd3BnZelfzuVexuC/ZaGbh8KPcpshUrq/y6i/UIkYA0LWHpDzoKycffr
         mOtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=Fej7S8EJ5uVinex6w8xs0kOTNubKVkUue0oahB3qvcs=;
        b=SC6ztdRJeqTIS6EQa+w641+KUgbGfsh7yCTqNMRBI7hOBi+veMVjdmMyQbDZmn7hZ/
         aa0izAk8L6UoGD+FRyzqfiOxMmhHtdYFK8vAIEtD/t2p3gYYGGRG+/ujtpoGiCPOtSge
         ALkw+cneI7xRoukncQ2cLLvkLYaO+7cubkIwsHrtAd7QvJQPRSd8HAKalxTFMQP8x3QR
         bDqMKy/PU8j9hyjoG3oFXu5SmNUwYJaUq2+tjy8fkhQJoSfFl3XdTO03/UDFxzKtJmLp
         mVRCuxID6tPxWTKW53lPKosm9zOihQISBQfwAFKXQj0URZS8cszh/Pz1fvnTf0bcnSuu
         k/5w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=MqD8QSt3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id v16si1012934lfd.2.2020.01.15.06.24.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 06:24:02 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 47yV1s5C51zxwm;
	Wed, 15 Jan 2020 15:24:01 +0100 (CET)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 15 Jan
 2020 15:24:01 +0100
Subject: Re: [PATCH 08/19] arm-common: Provide vpci_irq_base via Comm Region
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
 <8607243c30ace3c194d56ae9b3f0273cced0bf1b.1578320435.git.jan.kiszka@siemens.com>
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
Message-ID: <03a4d22a-ef52-a348-43e1-d2237a74e7b7@oth-regensburg.de>
Date: Wed, 15 Jan 2020 15:24:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <8607243c30ace3c194d56ae9b3f0273cced0bf1b.1578320435.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=MqD8QSt3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
> Allows bare-metal inmates to find the base SPI number of its virtual PCI
> host controller.
> 
> Increment the ABI revision to conclude this change as well as the
> previously generalized vpci_irq_base field.

Hmm. And we lack documentation for the ARM specific comm region ABI,
while we do have documentation for x86.

  Ralf

> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hypervisor/arch/arm-common/control.c              | 1 +
>  include/arch/arm-common/asm/jailhouse_hypercall.h | 3 ++-
>  include/jailhouse/hypercall.h                     | 2 +-
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
> index 106ffad4..10885f9d 100644
> --- a/hypervisor/arch/arm-common/control.c
> +++ b/hypervisor/arch/arm-common/control.c
> @@ -168,6 +168,7 @@ void arch_cell_reset(struct cell *cell)
>  	comm_region->gicd_base = system_config->platform_info.arm.gicd_base;
>  	comm_region->gicc_base = system_config->platform_info.arm.gicc_base;
>  	comm_region->gicr_base = system_config->platform_info.arm.gicr_base;
> +	comm_region->vpci_irq_base = cell->config->vpci_irq_base;
>  
>  	/*
>  	 * All CPUs but the first are initially suspended.  The first CPU
> diff --git a/include/arch/arm-common/asm/jailhouse_hypercall.h b/include/arch/arm-common/asm/jailhouse_hypercall.h
> index a4fb1360..83cec97b 100644
> --- a/include/arch/arm-common/asm/jailhouse_hypercall.h
> +++ b/include/arch/arm-common/asm/jailhouse_hypercall.h
> @@ -40,4 +40,5 @@
>  	__u8 gic_version;			\
>  	__u64 gicd_base;			\
>  	__u64 gicc_base;			\
> -	__u64 gicr_base;
> +	__u64 gicr_base;			\
> +	__u32 vpci_irq_base;
> diff --git a/include/jailhouse/hypercall.h b/include/jailhouse/hypercall.h
> index 4fae9481..20eea801 100644
> --- a/include/jailhouse/hypercall.h
> +++ b/include/jailhouse/hypercall.h
> @@ -102,7 +102,7 @@
>  #define JAILHOUSE_COMM_HAS_DBG_PUTC_ACTIVE(flags) \
>  	!!((flags) & JAILHOUSE_COMM_FLAG_DBG_PUTC_ACTIVE)
>  
> -#define COMM_REGION_ABI_REVISION		1
> +#define COMM_REGION_ABI_REVISION		2
>  #define COMM_REGION_MAGIC			"JHCOMM"
>  
>  #define COMM_REGION_GENERIC_HEADER					\
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/03a4d22a-ef52-a348-43e1-d2237a74e7b7%40oth-regensburg.de.
