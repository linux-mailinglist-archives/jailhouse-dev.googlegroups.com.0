Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCV7YH2QKGQE4QQND5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D3B1C45FD
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 May 2020 20:31:39 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id j21sf4945056lfg.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 May 2020 11:31:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588617099; cv=pass;
        d=google.com; s=arc-20160816;
        b=S+LqlmqgdnOMmn7CgNDZAQvINSrRnXdn/s4fPsFcdHz9Hu2AGhKgJz+tc9nBpYnD4X
         pVFns6VM2vJ2DEVrC8kD6qhlh0JNiAOVh1FYZ516U2uvhF47yicswJq+st0bFcccnMOJ
         unR3nGAEA+eQrZkvWEThULbGEEIhKp6DIOe5cBe5MybfWxEgxcldAZPFRFvW4c2d1vjF
         mNolPHiDoNpi4AnO7JzCjaxw3bT+R6OUTtxpmXTx34MW74MqCa0McPmWtQT/E/1/VelP
         jetNar51IVSWzL+9Q8aEoV9/+wgV4O8CWXZZUuPrLt2eex1Tr9shSdHHV+OnMLu6WqDB
         nt8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=CvzokRE/MK68YyBEDhvm+NYHqv4all/0gO0LpT6lRZs=;
        b=t2iF3yplzMaaCcXqR/pSKmoGI7YO5blZqYHoC2pk14sU4VYIVPYRiaFX11/k2Ilsgi
         XdbbhLJfxIGCi0E5yXQTYlDWYGpJHzU/ua0su4kx1Veg7PI5F+5ScooEFiPrgKe64Fzp
         y8bIeI9xsB+Ddku36FVA/X+Rt5euntJKuv2yvqCA7es6sX+FE7tah5GgdEgAURnnWg2g
         orxIeKRKJvpPBzc65xiL95gBpPdSXHXWmh5Qu6Jfixy+fO/r1lx9MSPc4uQZ3PDzpP/l
         qj49wyJNVyUP1n/5gRd9jLd3FeDzTGem0gqrgQp8QTYpLi5XODkAjBqgWG1TH/nPnDSf
         XPDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CvzokRE/MK68YyBEDhvm+NYHqv4all/0gO0LpT6lRZs=;
        b=hO6OMcpgQeBYYGlR/iHN1sd11RIv/HNnwP4h++PcDuqlX13lco1dM82wmg+TWxte7O
         ckoYBAwTHXfeUUAk/FCvKbCQMcoIrXXnxpFg0xMmyIaFDe01agpLrHpPITQdP+vy1PLW
         EL/703mE8NjM5fQvMlCsARF1Zy5NS4LxSrbgEvqMBg7tGS4ZJWAFBE2xl5/3DcMMYW9K
         xrYl/lRwTalIi51tCJ5TsAIXazPKjtm85+tnNAeL706S6O4/I1ZPc4eTmQRWRswivBIE
         1+ZNX3DOnOBCBtKZQvnSyFsGPmxsd5l/v5IhD9tjBC6G2jpYthJof9U901n26X7xmcpI
         NnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CvzokRE/MK68YyBEDhvm+NYHqv4all/0gO0LpT6lRZs=;
        b=YOB5frAoekch687tyVCFHZQOHk5rlDSgFH911GYxGvwj4Yo+mSgkVou3vQYMBnGzDd
         i3yw6cvTnR6GfICiW2M+uJz5+hyTHhHNj0m+BNwoj/TDvV2/a5m426GAKJ9dqw/StsGD
         KrvtW2iJ8sSbtIpeBNbUMV8i1T8VdG8jwSxYqDvHg5LLhVPuu8agjGjDyS21nnji5oOZ
         mGQklWtBrDFxq0GfmTqltTeHEeW1n0Or70UBYAG3CzRqKHKeM1FXQib9aX87WxxiYEL8
         uHM6+SacW5e1PGgL0om6t75dHgvMEv0IrslSv7jn88GTwpwLPYxFy4TRU1rT1AeXxLh+
         mGXw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuaDBaOdTmNe10V8JscrBAy3RUoNPMBumxWTzhwTz7pSpYgLfzxI
	ddVSo24aBoGlNA3+urzcsOg=
X-Google-Smtp-Source: APiQypKv65ns/9/lFQBwAkkyYZ381CpSA595uLMWEYx7YKtKMAfVt/10gewK+VKeZ8Ck0iKHJtmkGA==
X-Received: by 2002:a19:c50c:: with SMTP id w12mr6959669lfe.23.1588617098884;
        Mon, 04 May 2020 11:31:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:50f:: with SMTP id o15ls1924975lfb.2.gmail; Mon, 04
 May 2020 11:31:38 -0700 (PDT)
X-Received: by 2002:a05:6512:3049:: with SMTP id b9mr13091435lfb.176.1588617097976;
        Mon, 04 May 2020 11:31:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588617097; cv=none;
        d=google.com; s=arc-20160816;
        b=H5LEpLBMyELjV1DTmc2jIwH85XbGmot0SUdTNsyC/vaeUANahvCt+q5pMQJvXV1ziA
         uT4Rh0IkGPVwJWjzlxGrAckMHuAlTsz/W009spYIBQmaJBbN1G3LFdEt2wo+khkzYGue
         szeigNXS/TdgzNKM0BIJ/UUHSSrWYyq4aP6laKMWs0wZ2zhTfjO7YCO5erTWhe1DfdgY
         IEvYRRkufWTH0mS/A31RnPju3CRiNNJhZcYMTlpDeD6D0ftbXbQfBkH79wjUxOhPz+ox
         vzaD7ygAU+cycn0q1WoQyvx18oPSaNo5qcGQ5Dm7fcCjynCgZQPIrtWcX08T8i+Yj8gv
         9B0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=rt4ylj/7AcQrtCtP8ibNd0iAmD7VmM0Em1Wkd+kThmY=;
        b=mUD6A0bTQbxgfoq7BZz2tZKB43cGmhsj1MHwLoCauHIAnn6/Eo4RFdJvDtlnA7Loax
         1jStNPHV9XcjmAq87C5bdc15tNpPHr9jPAI0hylhy5qqu81RBLuisNyHbHsyoLkpnb4y
         aYGD17hCWYP3a4VLz7XncWIV6GhodZHxM8JoYL1pUsR0kwDIbYdDvc8Z1bEyCS8Ly83k
         w6GRqVG4lKhMUtxouf1bupPr4A3Y2+7pc3p9acnz270jHQzhzjXKCBED46GsSXOuqehw
         wFVmQ4biLPwob4FPYGpF2SRcvFFUtMUcv4kU3keHZXaf6RXDy8Sib/f1NIqJF8cvilei
         B3XA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id d19si827223lji.3.2020.05.04.11.31.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 11:31:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 044IVY38024948
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 May 2020 20:31:34 +0200
Received: from [167.87.53.26] ([167.87.53.26])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 044IVXdd015927;
	Mon, 4 May 2020 20:31:33 +0200
Subject: Re: [PATCH v2 1/9] hypervisor: introduce a common cache coloring
 interface
To: Marco Solieri <ms@xt3.it>, jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-2-ms@xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <df96a44e-96fe-3b46-2bd4-88a38532ce72@siemens.com>
Date: Mon, 4 May 2020 20:31:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421100351.292395-2-ms@xt3.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Add fundamental primitives to implement support for cache coloring.
> The latter is performed by exploiting the mapping of memories flagged as
> JAILHOUSE_MEM_COLORED and defined in the inmates' configurations (no
> root-cell or hypervisor itself supported yet).

Does the semantic of jailhouse_memory::size change when 
JAILHOUSE_MEM_COLORED is set? Do I get a region that has the same 
effective size as without coloring, thus uses a larger physical memory 
range? Or do I get a portion from the identically sized physical memory 
range that is defined by the number of colors I use (and alignment 
effects)? Worth to document explicitly, in patch 9 and maybe also here 
in the commit log when adding the flag.

> The interface defines the basic functions that have to be implemented in
> order to support coloring for a specific architecture.

What makes coloring architecture-specific again? Provided you have a set 
associative cache that can be exploited at page boundaries - but that 
aspect is not per-se an architecture feature -, this approach should 
work everywhere, no?

I will pick on that aspect in the following a bit more so that the code 
is not needlessly bound to arm64.

> 
> Define three main functions:
> - coloring_paging_init: calculate which bit range in the address is useful
>    for cache coloring, assuming it limited by the page size and the LLC
>    way size as happens on arm;
> - next_colored: calculate the next physical page address that conforms
>    to a given colors selection and to the bits calculated in the previous
>    function;
> - coloring_cell_init: initialize cell colors assignement depending on its
>    configuration;
> 
> LLC way size is required for coloring to work and it can be explicitly
> defined in the root cell configuration. Add a helper function that
> probes the way size from hardware if the llc_way_size is not set in the
> root cell configuration.
> 
> Finally, define a function used to calculate the physical end address of
> a given memory that is flagged as colored.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <ms@xt3.it>
> ---
>   hypervisor/include/jailhouse/coloring.h | 96 +++++++++++++++++++++++++
>   include/jailhouse/cell-config.h         |  8 +++
>   2 files changed, 104 insertions(+)
>   create mode 100644 hypervisor/include/jailhouse/coloring.h
> 
> diff --git a/hypervisor/include/jailhouse/coloring.h b/hypervisor/include/jailhouse/coloring.h
> new file mode 100644
> index 00000000..9dfe516c
> --- /dev/null
> +++ b/hypervisor/include/jailhouse/coloring.h
> @@ -0,0 +1,96 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) Universita' di Modena e Reggio Emilia, 2020
> + *
> + * Authors:
> + *  Luca Miccio <lucmiccio@gmail.com>
> + *  Marco Solieri <ms@xt3.it>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +#ifndef _JAILHOUSE_COLORING_H
> +#define _JAILHOUSE_COLORING_H
> +
> +#include <jailhouse/cell.h>
> +
> +#ifdef CONFIG_COLORING

Please avoid the compile-time config option. I see no reason so far to 
turn the logic off - you can always do that, effectively, by not 
configuring colored regions.

> +/**
> + * Get the way size of last level cache
> + */
> +unsigned long get_llc_way_size(void);
> +
> +/**
> + * Init cache coloring on the platform
> + *
> + * @param llc_way_size	Last level cache way size in bytes
> + *
> + * @return 0 on success, negative error code otherwise.
> + */
> +int coloring_paging_init(unsigned int llc_way_size);
> +
> +/**
> + * Init cache coloring data for the cell
> + *
> + * @param cell		Cell for which the initialization shall be done.
> + *
> + * @return 0 on success, negative error code otherwise.
> + */
> +int coloring_cell_init(struct cell *cell);
> +
> +/**
> + * Return physical page address that conforms to the colors selection
> + * given in color_bitmask
> + *
> + * @param phys		Physical address start
> + * @param color_bitmask	Mask asserting the color indices to be used
> + *
> + * @return The lowest physical page address being greater or equal than
> + * @param phys and belonging to @param color_bitmask
> + */
> +unsigned long next_colored(unsigned long phys, unsigned long *color_bitmask);
> +
> +/**
> + * Return the end address based on color selection
> + *
> + * @param start		Address physical start
> + * @param size		Size in bytes
> + * @param color_bitmask	Mask asserting the color indices to be used
> + *
> + * @return The address after @param size memory space starting at @param start
> + * using coloring selection in @param color_bitmask.
> + */
> +unsigned long get_end_addr(unsigned long start, unsigned long size,
> +	unsigned long *color_bitmask);

That function has a too generic name. But maybe it can just be made 
generic - and static when moved into the object that calls it.

> +#else
> +static inline unsigned long get_llc_way_size(void)
> +{
> +	return 0;
> +}
> +
> +static inline int coloring_paging_init(unsigned int llc_way_size)
> +{
> +	return 0;
> +}
> +
> +static inline int coloring_cell_init(struct cell *cell)
> +{
> +	return 0;
> +}
> +
> +static inline unsigned long
> +next_colored(unsigned long phys, unsigned long *color_bitmask)
> +{
> +	return phys;
> +}
> +
> +static inline unsigned long
> +get_end_addr(unsigned long start, unsigned long size,
> +	unsigned long *color_bitmask)
> +{
> +	return (start + size);
> +}
> +#endif /* !CONFIG_COLORING */
> +
> +#endif /* !_JAILHOUSE_COLORING_H */
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 30ec5d06..8985f8a3 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -114,6 +114,7 @@ struct jailhouse_cell_desc {
>   #define JAILHOUSE_MEM_LOADABLE		0x0040
>   #define JAILHOUSE_MEM_ROOTSHARED	0x0080
>   #define JAILHOUSE_MEM_NO_HUGEPAGES	0x0100
> +#define JAILHOUSE_MEM_COLORED		0x0200
>   #define JAILHOUSE_MEM_IO_UNALIGNED	0x8000
>   #define JAILHOUSE_MEM_IO_WIDTH_SHIFT	16 /* uses bits 16..19 */
>   #define JAILHOUSE_MEM_IO_8		(1 << JAILHOUSE_MEM_IO_WIDTH_SHIFT)
> @@ -306,6 +307,13 @@ struct jailhouse_system {
>   		__u8 pci_mmconfig_end_bus;
>   		__u8 pci_is_virtual;
>   		__u16 pci_domain;
> +		/**
> +		 * Size (B) of each way of the last-level cache where coloring
> +		 * takes place.

Size in bytes...

And I think llc_way_size is not influenced by the fact coloring is used 
or not ;). You likely mean that it is only relevant when coloring is used.

> +		 * Must be set if get_llc_way_size() fails or does not support
> +		 * the platform in use.

get_llc_way_size() is an internal implementation detail that does not 
belong into the interface. This is more a "may be probed if 0", if we 
keep probing.

> +		 */
> +		__u64 llc_way_size;
>   		union {
>   			struct {
>   				__u16 pm_timer_address;
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/df96a44e-96fe-3b46-2bd4-88a38532ce72%40siemens.com.
