Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBHWP7TYAKGQEIBZQYTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D7213C6A6
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 15:54:22 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id q26sf12331wmq.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 06:54:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579100062; cv=pass;
        d=google.com; s=arc-20160816;
        b=nh8uW98kB0mORQyxq/o+7/AvkqXAm0WhT1F0dLuGl76Mqv4VA25GLB9sUjEHvB2LLP
         zN83hhuWoOvuHXNDDYmVl0ApqE5gZmXxo7aEtilK5Rg3SeMXkvc+1mNvIOGoVe+rlj96
         60x2U7za930r29uSxHBcPU0WLAJq8JvyDVxLndeyZME8gsu17ZwmVmv8ScywnsR9HEQ+
         VfL2JWcCpHO+PSCYzkIR5Q1Sf8ggBdvph/s117ZtrrU21XxKzxuySIoG8wv6t/W+Q8CD
         swX4sNH03ZdzhXWU/6ipuUCWpiyeD3se9KrI0KGTa1QxR43tD8OI801yCd+AAjWW/d3K
         OqUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=Yh2X0F6ztkT5YWFqJZVnT0+G+w7PAwKgf7GHpkaby44=;
        b=PSB3S3EcDmDy2ac/xg1vnx5L+Sw8XEHmPnqz/e+9esG5g8jlnkhpL6VmTW01kpCJS/
         ZAM3WUscg+KAILkkdGxzTHBxGgrl7GyNl3sTX25XwRjQLXpsbIZ4TSAqpY7/fXDLQ0Si
         k2y6yAtkpXhtkMtBfoFLs+I7NjTXcQ7ppzt3hTJQIMtY0M/SYPFXM5ascasvcANB9fTh
         9iS17j9fltA1q/RA9OsvHwEe3MbWaUTuUn4fHii1HZJ2QLaH8GA3qIaQ87pC+wGlm6/e
         3qhO9jX6hy4L4SXUA1gWmS3r25zZyRGPFg+6eMixaYq0OQmEECie0jSbOpvhJrYJwtId
         CUyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=fSdteIx2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Yh2X0F6ztkT5YWFqJZVnT0+G+w7PAwKgf7GHpkaby44=;
        b=Irv9NYlamB9Tq1XrZBncn1oMHoEP3IcMVJ3y1Dw9lm6h1X6or8eLvX3uCDqe/EmbCG
         aE21JZw3JJmLBjsVQHKnoRulpQIIljauGTh2drbmHq5E5UwdpLaEUZiqsiFZ3Bri73/I
         cGhP2rSd/hqnunZVfVsbboICAi0SiOyXYg5P7/I7wm72Huzq54e31RaKrcBFNx37f5JA
         sbg6vH/tzXIoVqRKNaxqqFq4WxOUXJwwhjytyzvpYQQ96AcXnGCgvmkHO/IACIR6bb4y
         o4C738Qc5fWRXC5OtGPbp2M7QBUbrqJia3G2AKOxJD6LAP8AQXEhbPOhPyEpZjlp+4Sl
         coCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Yh2X0F6ztkT5YWFqJZVnT0+G+w7PAwKgf7GHpkaby44=;
        b=oZMYGrx7e8LH5TgcspCoj+fuhqG/lus+5/WRm51jBjbrwtWsczsA6n22txi0JryZ7X
         1Oz9YLytr8nffStGtAPzKkxT1BYwiw6NLZenZZhPLOiOGfqoPVf01mI6nzsgtWV/yo8b
         GttyR4frzaVQvxxFdMtOlsexxoAj897Wy41PXZ+YOGEHclq9dP4dMLanpt2YytUGMGBF
         AkI8GBKY4aToCgTPLB4VETC61SZrR0NVGF9jjRuR2of6AVyRReYsKLupTnGuSPBc4GtH
         OCMXtb6ewcS4NbxOjZAOOG/WjyoXf+zXN44nENZUz6Evy4MH0soTnmm0LVtJwlZPWQGN
         Ifaw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVl7BvoHF+n48/Um7XHkIvFauxRmOAO1Dm8M+Rf1r9X9P9aknY7
	wiEg9FoADdcat91q5oQ1rX8=
X-Google-Smtp-Source: APXvYqw5Hxg1tLaVV3FtBY9rhI+YLCv9BMGhE8ePierNMsWGJMHDF/w/1z1jclYDlbvoAs2Py1jffg==
X-Received: by 2002:a1c:81ce:: with SMTP id c197mr161955wmd.96.1579100062492;
        Wed, 15 Jan 2020 06:54:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4682:: with SMTP id u2ls6906349wrq.14.gmail; Wed, 15 Jan
 2020 06:54:21 -0800 (PST)
X-Received: by 2002:a5d:6144:: with SMTP id y4mr32108848wrt.367.1579100060925;
        Wed, 15 Jan 2020 06:54:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579100060; cv=none;
        d=google.com; s=arc-20160816;
        b=yg7MfNhSwd9r0G9Hu2ZJCHC1GZUynsDy/O5iY8wphgcg5vIIaNf/P/RiINTUEg0wKk
         Xg1YUex5S3yvualCfZ9x34zuKthCo3zHjjwuXgSFTt/rkXF1QWor1VR92uRsKMHM28kD
         FNvD6iSTzE67cdTj4Nd5emOz+l8i1uAKIlhJnlk1N5sFQNKL5pDz3EmqQaouaS7FfhZ6
         XBNrB9jkTvcXdpDpfTQ5phUr3bNfHsvRGlM+i2aAqJjDOB6H/Jltw65p9vyeJFfntibx
         Yj7pJXG7OlIAAUT+fDaCCDqc6nTqv1+YYP7QKgTTjUZ1/1Ct4K+s4DC/iUpSDb/xXsAQ
         SRQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=pTbK4Bf9/mpxeCCzhs8NQ6flFgDmEdoSbCpp8WPKCy0=;
        b=J74bKgYNC2iuHAzyVY8/CGL4wuYHMlzJ8TVmHVN3qGNC3oS+dpomEicLI2eCdkTNtt
         AesCApXKwK3vnlfIxtoDsIE31Oe2xMtRkNHn1bmnv6qaIOg2Pp2psFEJOs5j6oThaXOn
         AjVMrM+RGWAzIoPEmqI/TsccMonuNpjPJ+l/UuHmGWhuekEeQkwVjnN4rQeTbUTxRw52
         Ck/pjLsnsyzIFs9g88IPUVU0AcVbXtDmfo3USVTTv7RK245sm4wAHSREy63iP66WSdFP
         hxc4RNNymzDnEoTjM0Nwn5120WVYauNQw8WEldT5DXyY8734iIAc5TSTlZF35HwA8U2b
         Qnwg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=fSdteIx2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id y185si3169wmd.2.2020.01.15.06.54.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 06:54:20 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 47yVhr4gF6zxwm;
	Wed, 15 Jan 2020 15:54:20 +0100 (CET)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 15 Jan
 2020 15:54:20 +0100
Subject: Re: [PATCH 09/19] inmates: Make PCI support generic
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
 <160f838caa791fe4eb725c9b249c74e5de4fc559.1578320435.git.jan.kiszka@siemens.com>
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
Message-ID: <7e96dc43-ea5d-5780-8a9e-f211348cd57b@oth-regensburg.de>
Date: Wed, 15 Jan 2020 15:54:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <160f838caa791fe4eb725c9b249c74e5de4fc559.1578320435.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=fSdteIx2;
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
> Provide PCI support for ARM by implementing mmconfig-based
> pci_read/write_config and moving shared defines and prototypes into the
> common header. pci_msix_set_vector is only implemented as stub on ARM
> so far, can be enhanced later.
> 
> As mmconfig implies mapping of that MMIO region, pci_init is introduced.
> x86 does not need it and only implements a stub in order to allow
> arch-independent inmates.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  inmates/lib/arm-common/Makefile.lib   |  4 +-
>  inmates/lib/{x86 => arm-common}/pci.c | 96 ++++++++++-------------------------
>  inmates/lib/include/inmate_common.h   | 34 +++++++++++++
>  inmates/lib/x86/include/inmate.h      | 32 ------------
>  inmates/lib/x86/pci.c                 |  4 ++
>  5 files changed, 66 insertions(+), 104 deletions(-)
>  copy inmates/lib/{x86 => arm-common}/pci.c (51%)
> 
> diff --git a/inmates/lib/arm-common/Makefile.lib b/inmates/lib/arm-common/Makefile.lib
> index 669ff485..8a4c2237 100644
> --- a/inmates/lib/arm-common/Makefile.lib
> +++ b/inmates/lib/arm-common/Makefile.lib
> @@ -37,8 +37,8 @@
>  #
>  
>  objs-y := ../string.o ../cmdline.o ../setup.o ../alloc.o ../uart-8250.o
> -objs-y += ../printk.o
> -objs-y += printk.o gic.o mem.o timer.o setup.o uart.o
> +objs-y += ../printk.o ../pci.o
> +objs-y += printk.o gic.o mem.o pci.o timer.o setup.o uart.o
>  objs-y += uart-xuartps.o uart-mvebu.o uart-hscif.o uart-scifa.o uart-imx.o
>  objs-y += uart-pl011.o
>  objs-y += gic-v2.o gic-v3.o
> diff --git a/inmates/lib/x86/pci.c b/inmates/lib/arm-common/pci.c
> similarity index 51%
> copy from inmates/lib/x86/pci.c
> copy to inmates/lib/arm-common/pci.c
> index 06dd193f..99210c21 100644
> --- a/inmates/lib/x86/pci.c
> +++ b/inmates/lib/arm-common/pci.c
> @@ -1,7 +1,7 @@
>  /*
>   * Jailhouse, a Linux-based partitioning hypervisor
>   *
> - * Copyright (c) Siemens AG, 2014
> + * Copyright (c) Siemens AG, 2014-2020
>   *
>   * Authors:
>   *  Jan Kiszka <jan.kiszka@siemens.com>
> @@ -38,21 +38,32 @@
>  
>  #include <inmate.h>
>  
> -#define PCI_REG_ADDR_PORT	0xcf8
> -#define PCI_REG_DATA_PORT	0xcfc
> +void pci_init(void)
> +{
> +	void *mmcfg = (void *)(unsigned long)comm_region->pci_mmconfig_base;
> +
> +	if (mmcfg)
> +		map_range(mmcfg, 0x100000, MAP_UNCACHED);
> +}
>  
> -#define PCI_CONE		(1 << 31)
> +static void *pci_get_device_mmcfg_base(u16 bdf)

inline?

> +{
> +	void *mmcfg = (void *)(unsigned long)comm_region->pci_mmconfig_base;
> +
> +        return mmcfg + ((unsigned long)bdf << 12);

Here are whitespaces instead of tabs.

  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7e96dc43-ea5d-5780-8a9e-f211348cd57b%40oth-regensburg.de.
