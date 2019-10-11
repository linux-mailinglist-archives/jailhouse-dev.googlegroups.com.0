Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3V6QLWQKGQESWTYUDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED1DD4425
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 17:27:42 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id p6sf2752933wmc.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 08:27:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570807662; cv=pass;
        d=google.com; s=arc-20160816;
        b=cd2LPB+2Wzw0SHpm5LhQLQ0irLvAP2OAbBweOibwWjtuYcnvnQWo3rcgP0H2+GWFGM
         kybK1WRAXiVr6KQ8Om5hH9oUGbeI2tkQ5aGpihRIXbfNo7r0Mwc18zVpFpE61w9t9tmd
         UEwY+HhZBcK3tio5D9qUckX1fPvpZ49ebFQQdrDsGvwEry66uY97kRjgQuh2ohW0F+88
         o3T6jfMR+KYw0KUMphA3dtG2i1vHWXUCEqtWTsaOtxueE2GqBj+krQW4PjiMq/QpEY4w
         wqz/+uf9q9SffF3CIXtcResrRH7RxL0YTXJibXbJMx0uR//Bz/pCpRfXjG1EbsXusX/g
         XFog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ws4N4pTTwqM2FyYjy7u1z/wwi4pI09Nwigfj2fXy73E=;
        b=Zx7OTtXpGDJSytPERurD1K6JNb3Oc3nBSxiefZWlNHPd1WxxWLEKFSU5HZB2K2pXS6
         LOW711uTTbPm6e0xA+OteVjJW8EeD1fv1b2EupYwUrkd2YCn/AS7w/rNQCaJFlKbMsAY
         FQbxJRxATLpXBQ/9dq71noOH5Z0eb5SiS+4pZLZVHlLbh5IEUBBf/iwEgColP3C7cZxU
         wS7Z+yFq84xKKEXDRIsiiH7DyRqJhJVSeumpX/eTZqev2wwh/pWkcBajG3zoYGFwZyl0
         HBhZKtgqUro6NzuGRtnG+zZi/S7BZ4cWbiPXUTMadtYlTLqtD1VPnHpb7K/XcbctrBt7
         Uz9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ws4N4pTTwqM2FyYjy7u1z/wwi4pI09Nwigfj2fXy73E=;
        b=WfUiqeKteeie7llSQzkgBgqtBXRQi3zoDRhaEQEduvolo54OqQyhrqQ5lZwk76RrnF
         r1v3xbs9NrQMFRACMhaO9MQ3heTVfbs8MATGy1DF/bASaPeFkE8uBLhRQqsaaRMCh63A
         LposwJDyb7cUzmGkiXdMcP233VpxTLyjjq6kMK7I5oKKH05jqDgIsoK/3E6QAvo1mzuj
         w+uaHmU/L4+5IIqYJmS8CthPBZNF+Vrk98OaCKu0OH7B9RF8n6DlSFGl11LDMk6qxDAq
         DvFbDyUnFiIxkKdfU00C1ZNNEDLCqZ/L+W9upUhpGkyFmrJ/5OOkdm2QT8oR8RO2lVYJ
         WKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ws4N4pTTwqM2FyYjy7u1z/wwi4pI09Nwigfj2fXy73E=;
        b=Mp6yV+4Ja3zIlkC92zlaApnSOE8aOCK4m+du33TO6p/OYwTr7dfwN+hwocWFIJA+tv
         pH1TjA4g1trQgzjqxFvR6INFEUST3hVGdOi56SePtayv03qkZ+Q2YEXCDubcI9UH3wRB
         kf4M9j9zQYEi/6H2apJaTGRdU+MCVGdmdcPPeCAFiMzrwh6IcMRkGssEZXxLPXF4cXee
         dPD1ax+O6we+uo5La4J08yKAL5W9WH+G27/MwM0iRbFQj3L+jVayEbilE1kkw6TIbj3j
         L3Nl2EJW5VWt/7OePNm9LWjNf6n52Caj2MFK/uCU7kov5r3SQ/jacqTEN4AejGOf9jIL
         7OQg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU/GF/VsxXWz+mwK14reBECiHFPOTgB3E9rP6sr9AWbY37rE/XQ
	YWlxIUtK3xizZFkSVDhn9Os=
X-Google-Smtp-Source: APXvYqwLZrQIZJRSpbDNWHChopmZu0t5Ny35s3RTxPujHUHAnPYVxpP+sSuVLjO/6nhHj80weoDKew==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr3667915wmj.91.1570807662255;
        Fri, 11 Oct 2019 08:27:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c408:: with SMTP id v8ls2706763wrf.10.gmail; Fri, 11 Oct
 2019 08:27:41 -0700 (PDT)
X-Received: by 2002:adf:fa50:: with SMTP id y16mr14586777wrr.171.1570807661581;
        Fri, 11 Oct 2019 08:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570807661; cv=none;
        d=google.com; s=arc-20160816;
        b=CMJgobvhh931rgEmmN+EaKEY7WfhE4qyTzVruo3GfHjWvltBnikTJG0tDNIce9aTD0
         wCMAPT9daIPApKt8W+5jmfpLmiHgr5mO4fk+9sbDSCtMm29g9anfW4ZTzb8+Kh1tzyf7
         AEWam9ylVQQn81PbX0bHxhCGqnYyjA/3AE8hnUvS9ZEXnK21uwU6hi9+S4Lc+dxXLW4l
         tzFwtlrkLw3VnmCdm5hmbb1nwnJdlQigP3eJGpu3MpS12BMkiynT+mGgqeXZ+23joE+x
         EtbUyRhEHPHYFLtdqsZoQ+qgXDYU4nJF3A5fYHnkap8tgmEwJr7Tl5lAo11psf1xBF/R
         +UWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=BLtuwiiam4F8/uaxH2cK+b4keQ6F9V1Ngji7IyBSfbc=;
        b=qiWJ+zkfuc1ax5uSezP43ky/8oUTW11UbnqgzXXfQDc9/UmKGWc5C2oJLO6fbaq1ij
         xVdO9h8xx9IlnEMO8Nf+8YcJ9NMjvWLg4P6Tc2Q3rQ2ywKjLaTXrmsWAhSQAGVAuZIG2
         ij90LdhCaBmS4U8kTFUM5TOoIYYBDcj5U2Z/hbCEQ/6V7EKQ7DMkcDIr2FpnJqOWXLdl
         zS8DvxlQqh4ZSVPpmt7b/VAO4w4DEmOzvIB//ATEgibIzuhAXNw+HM0/AakCONH2Owxv
         FbRz3Oo57c0jHiOYSpAlOKsx3XtfuP7DZSATLpyNwx+UtEWM03ODNIJEqjz0tkhrwqNu
         G9qg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id p5si449638wmg.0.2019.10.11.08.27.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 08:27:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x9BFRf36007275
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Oct 2019 17:27:41 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9BFReYd012043;
	Fri, 11 Oct 2019 17:27:41 +0200
Subject: Re: [PATCH 4/4] config: add config files for am572x-evm
To: Vitaly Andrianov <vitalya@ti.com>, jailhouse-dev@googlegroups.com
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
 <1570731650-5335-5-git-send-email-vitalya@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <badb0854-1b17-8517-1fe3-fa03d00d1cce@siemens.com>
Date: Fri, 11 Oct 2019 17:27:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1570731650-5335-5-git-send-email-vitalya@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 10.10.19 20:20, Vitaly Andrianov wrote:
> This commit add root cell configuration and uart and gic inmate demo
> configurations for TI AM572X-EVM evaluation board.
> 
> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
> ---
>   configs/arm/am57xx-evm-gic-demo.c  |  76 ++++++++++++++
>   configs/arm/am57xx-evm-uart-demo.c |  76 ++++++++++++++
>   configs/arm/am57xx-evm.c           | 205 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 357 insertions(+)
>   create mode 100644 configs/arm/am57xx-evm-gic-demo.c
>   create mode 100644 configs/arm/am57xx-evm-uart-demo.c
>   create mode 100644 configs/arm/am57xx-evm.c
> 

...

> diff --git a/configs/arm/am57xx-evm.c b/configs/arm/am57xx-evm.c
> new file mode 100644
> index 0000000..7573150
> --- /dev/null
> +++ b/configs/arm/am57xx-evm.c
> @@ -0,0 +1,205 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) Texas Insturments. Inc, 2016
> + *
> + * Authors:
> + *  Vitaly Andrianov <vitalya@ti.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/types.h>
> +#include <jailhouse/cell-config.h>
> +
> +#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> +
> +struct {
> +	struct jailhouse_system header;
> +	__u64 cpus[1];
> +	struct jailhouse_memory mem_regions[17];
> +	struct jailhouse_irqchip irqchips[2];
> +} __attribute__((packed)) config = {
> +	.header = {
> +		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> +		.hypervisor_memory = {
> +			.phys_start = 0xef000000,
> +			.size = 0x1000000,
> +		},
> +		.debug_console = {
> +			.address = 0x48020000,
> +			.size = 0x1000,
> +			/* .divider = 26, */
> +			.type = JAILHOUSE_CON_TYPE_8250,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				JAILHOUSE_CON_REGDIST_4 ,
> +		},
> +		.platform_info.arm = {
> +			.gic_version = 2,
> +			.gicd_base = 0x48211000,
> +			.gicc_base = 0x48212000,
> +			.gich_base = 0x48214000,
> +			.gicv_base = 0x48216000,
> +			.maintenance_irq = 25,
> +		},
> +		.root_cell = {
> +			.name = "AM57XX-EVM",
> +			.cpu_set_size = sizeof(config.cpus),
> +			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +			.num_irqchips = ARRAY_SIZE(config.irqchips),
> +		},
> +	},
> +
> +	.cpus = {
> +		0x3,
> +	},
> +
> +	.mem_regions = {
> +		/* OCMCRAM */ {
> +			.phys_start = 0x40300000,
> +			.virt_start = 0x40300000,
> +			.size = 0x80000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* 0x40380000 - 0x48020000 */ {
> +			.phys_start = 0x40380000,
> +			.virt_start = 0x40380000,
> +			.size = 0x7ca0000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* UART... */ {
> +			.phys_start = 0x48020000,
> +			.virt_start = 0x48020000,
> +			.size = 0xe0000,//0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* 0x48100000 - 0x48281000 */ {
> +			.phys_start = 0x48100000,
> +			.virt_start = 0x48100000,
> +			.size = 0x110000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/*
> +		 * Leave gap for GIC controller 0x48210000 - 0x41220000
> +		 */
> +		/* 0x48220000 - 0x48281000 */ {
> +			.phys_start = 0x48220000,
> +			.virt_start = 0x48220000,
> +			.size = 0x610000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* OMAP WakeupGen */ {
> +			.phys_start = 0x48281000,
> +			.virt_start = 0x48281000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,

Is it safe to expose the whole page? What else besides the famous 
AUX_CORE_BOOT_n registers is on it? What side-effects do they have?

There are probably more registers with critical side effects, so this 
question may sound academic. But it should be seen in the context of 
patch 3.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/badb0854-1b17-8517-1fe3-fa03d00d1cce%40siemens.com.
