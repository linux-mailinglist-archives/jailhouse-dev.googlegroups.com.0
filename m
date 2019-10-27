Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVFV2XWQKGQEEPYJQZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id E665EE61B4
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Oct 2019 09:52:36 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id m7sf1363611lje.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Oct 2019 01:52:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572166356; cv=pass;
        d=google.com; s=arc-20160816;
        b=cJpt4DRd6+VWJILuFL1Kaco8wrfcXYBdfq+NBW47e/fwUGY+7V5+CKj5tzKkfhYtw1
         0aYkTEVdfl/pv10noGZm+SgfCrQkB3wJbfyp8/nN9NL+HQctzvd5i2xtaqI7/Y5ZW4dK
         NB8DGlHzYdD5pYipqRfzJep8Hkzw3RKj7NtLpOkwtKzZ72RyxnqfbR2UBomhlCjt2oyk
         irn7Lre018A6skKc5SzZ27pOy3+O3nAi2BywPLoYgZ/IPiuC/fXLSS+75IoYDrV6yAmz
         kOgE04GVYwOrCK+UcLVQEJ1xhshaX/DDc7jW/AsG4dy/VNE80KWL9M/US6nztfyaweGE
         bw9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ailkE7qKKpXzPgNrhIJMomso7SgMVMW9bJfEU+SnCZk=;
        b=ol3MRwKBJ2yqOyItuenHWxsKVPMiydArFVF9G53xxmBZK8+F54LHcXrBGV+2AcZSTD
         pHsXy7mc7ZB/7X3LrGzS6XHPNPGDW/s7wDV05Rt4svTCETcmdRhbXJTXTP3EYRlQknZU
         WLSgDk0OEBcAxhgeAXIszjZTFfoCZi85MLltZzl14soQTC9YfqkC2ZrtJwIx2oN7VL97
         ANDlNx/fDAjalxlmuPCAm+IeXogEV009UrlvvNK4RS43I69/c4DQKU1vlNhQCs+Lz1Q2
         ebLjzqsFXMPbjCXmFN6NHMaHaopDYgRBHV8IPdRn0ysJ9AJZ82XpL3HpZ7tczV+f5mHZ
         u6sA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ailkE7qKKpXzPgNrhIJMomso7SgMVMW9bJfEU+SnCZk=;
        b=K9Q51R47zaiBJLk5h4kOA74XqMC/nnujTfGlnCVeky0DqgBN/La8Bv3gWPNF/+6ch4
         VvawzFmhU6kSo7bT02s+hKuPfuqibLa95bEmdZWiDzCve6k99KaKWg2nd/fFH3QgkDO0
         IOWWThncRvIXFt+GY/LI49ACy4A5j97w+h6L01PR1lT5kBNm2Nd8Dfzfu3toxiQOOHK6
         gSpkJOe9eq7+zXpQAq2x159lSurX6PmvPQgC81T+Vh65lukeigoTdar9INDAxehB78AH
         KP0qIANjH0n+cfbUC4i+wvf0O2Lmm/x/+eHNImn9xdGK1zbZQTjGE4z3lqc1k57bsPLc
         trmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ailkE7qKKpXzPgNrhIJMomso7SgMVMW9bJfEU+SnCZk=;
        b=OkzISaLwIU4nsWNKFDkD/W1ELl+Xdj4DJ8ASh/LXe6efd/JSeXbzjjml/OQ/4opLVq
         TmilEN31nczxfZagn9skZ71skFYrHaA8pRTw0cKWcjWCbTY2dH8N64yuk3B0x3OpMLfU
         shJletMgoIMmUjDhHFzBh2FzZ2fXByDpDDghId3wNC2+Rey1p+HjfCCt1zAfqvQuCb7i
         yegSo6SvSaIYbYdvpWW/cu346XAFiqq5R7vfg3S/nVlJ3/XoH84ZUOjR3xgUl+2y4zPr
         S/+i2upQd+eAbSpCyv4HYWFqRzPFDT4h9lfG1T8Y7aWG99oLCpEZ5PByqry0LoKY9oeI
         Ni8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWLQtPCBoNmgiGLxgAm6Rgw3Ju6lEKyoUiu4fqcZGXEn70wLkOM
	2clT/lTJKQ2h92L+qOd0eF4=
X-Google-Smtp-Source: APXvYqyqFctK7rY3ayQtKQ/wTkIOshaMJ5pEC4Joe9devQSiQgpJKRYMCiK31RFN04BiYVhx7THqDQ==
X-Received: by 2002:a19:c192:: with SMTP id r140mr7939844lff.48.1572166356500;
        Sun, 27 Oct 2019 01:52:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9bd0:: with SMTP id w16ls1832728ljj.13.gmail; Sun, 27
 Oct 2019 01:52:35 -0700 (PDT)
X-Received: by 2002:a2e:8e21:: with SMTP id r1mr1080454ljk.81.1572166355655;
        Sun, 27 Oct 2019 01:52:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572166355; cv=none;
        d=google.com; s=arc-20160816;
        b=l2UqRf0eriI3rADpqR1YTrr5YG8DjN7kK8zb4eddi6gxADAor+a6053kX1D4/WiNnG
         nOMFnRRSGyCOQ7Hn/e+mxsVZwy4oBi7nB9fKXJeYpNmE3Gjh1/yWcVGcX7h21WXlEMvH
         RxLTL3F/5aNCJhVYPsU36Bu3hKtnPIdYm6gq3f86xxzQdVcjS0361lDOs++86NJb8OWM
         Jzvh3E3Z2tFfYKpHE79uzfQ1Z/Czqik80CuSXEdeiuoJp/RkTtAso6XRIKdNFE1KzvL9
         mRhvODShQ1O5hY4hAeprfwDb3QP3oIiEtUd+C7gHbJK+jY+aF5U53y9fuOtKGEztnDnv
         qCpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=rCsyDF/zseeyxTmCuwWhiAVgAGfxOeXh6WlidKlQvtY=;
        b=fX4cTntEXSJFhUjs0svd6ddBY+WHQnlXKnBB1EcM2nWm7mbefmuOmJ8/zJEC6JP50Q
         uYX4Ibg/ENU/ijm+YnNvJ2A7xrxHNqO4gThJe6MhV8G0Ske5WRsgc8Ou1HVUmTXuSAkK
         me0ZNdZkKFhQxUZ3qbycKr6aKl34TLowJrQQ+ymPYcvrtYRO+/ZvCGJkbba8ACV/wVva
         UVXXxvwTN4wvelv3d0fv6aMz841ZQaJS8kIPVxWsc2aVyjCMVUxRlyaKxaooKQ9j6vQm
         iMy3nN/GNQ43p0/wHUI8cTYz8hoFh9nhdGIoricBkwljm8uOdJozjeyu1m60UXlR/b9i
         dz/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id c2si409281lff.4.2019.10.27.01.52.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Oct 2019 01:52:31 -0700 (PDT)
Received-SPF: temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x9R8qT0N028354
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 27 Oct 2019 09:52:29 +0100
Received: from [139.22.33.136] ([139.22.33.136])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9R8qSoM025996;
	Sun, 27 Oct 2019 09:52:29 +0100
Subject: Re: [PATCH 1/3] configs: arm64: add config files for UltraZed SOM +
 UltraZed carrier IOCC
To: Alex Largacha <alexlargacha@gmail.com>, jailhouse-dev@googlegroups.com
References: <1571935318-25453-1-git-send-email-alexlargacha@gmail.com>
 <1571935318-25453-2-git-send-email-alexlargacha@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <dda7a082-2c0a-3899-ced2-34f31ed0bd5f@siemens.com>
Date: Sun, 27 Oct 2019 09:52:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1571935318-25453-2-git-send-email-alexlargacha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=temperror
 (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS
 error) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=fail (p=NONE sp=NONE
 dis=NONE) header.from=siemens.com
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

On 24.10.19 18:41, Alex Largacha wrote:
> Signed-off-by: Alex Largacha <alexlargacha@gmail.com>
> ---
>  configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c | 120 +++++++++++++++++++++
>  configs/arm64/ultrazed3eg-iocc.c             | 154 +++++++++++++++++++++++++++
>  2 files changed, 274 insertions(+)
>  create mode 100644 configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c
>  create mode 100644 configs/arm64/ultrazed3eg-iocc.c
> 
> diff --git a/configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c b/configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c
> new file mode 100644
> index 0000000..3c676e3
> --- /dev/null
> +++ b/configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c
> @@ -0,0 +1,120 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Configuration for pl-irq-demo inmate on Avnet UltraZed-EG SOM + UltraZed-EG IO Carrier Card 
> + * 1 CPU, 64K RAM, 1 serial port
> + *
> + *
> + * Authors:
> + *  Alejandro Largacha <alexlargacha@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/types.h>
> +#include <jailhouse/cell-config.h>
> +
> +struct {
> +	struct jailhouse_cell_desc cell;
> +	__u64 cpus[1];
> +	struct jailhouse_memory mem_regions[8];
> +    struct jailhouse_irqchip irqchips[1];
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = "pl-gic-demo",
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> +
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
> +		.num_pci_devices = 0,
> +
> +		.console = {
> +			.address = 0xff010000,
> +			.type = JAILHOUSE_CON_TYPE_XUARTPS,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_REGDIST_4,
> +		},
> +	},
> +
> +	.cpus = {
> +		0x8,
> +	},
> +
> +	.mem_regions = {
> +		/* UART */ {
> +			.phys_start = 0xff010000,
> +			.virt_start = 0xff010000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM */ {
> +			.phys_start = 0x42000000,
> +			.virt_start = 0,
> +			.size = 0x00010000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* GPIO_SWITCHES */ {
> +			.phys_start = 0xA0000000,
> +			.virt_start = 0xA0000000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* GPIO_LEDS */ {
> +			.phys_start = 0xA0001000,
> +			.virt_start = 0xA0001000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +
> +		/* GPIO_stop_counter */ {
> +			.phys_start = 0xA0003000,
> +			.virt_start = 0xA0003000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +
> +		/* TIMER 0 Capture*/ {
> +			.phys_start = 0xA0002000,
> +			.virt_start = 0xA0002000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +
> +		/* TIMER 0 Cpature*/ {
> +			.phys_start = 0xA0004000,
> +			.virt_start = 0xA0004000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +
> +		/* communication region */ {
> +			.virt_start = 0x80000000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_COMM_REGION,
> +		},
> +	},
> +	.irqchips = {
> +		/* GIC */ {
> +			.address = 0xf9010000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				1 << (54 - 32),
> +				0,
> +				0,
> +				1 << (136 - 128)
> +			},
> +		},
> +	}
> +};
> diff --git a/configs/arm64/ultrazed3eg-iocc.c b/configs/arm64/ultrazed3eg-iocc.c
> new file mode 100644
> index 0000000..9e38d0a
> --- /dev/null
> +++ b/configs/arm64/ultrazed3eg-iocc.c
> @@ -0,0 +1,154 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Configuration for Avnet UltraZed-EG SOM + UltraZed-EG IO Carrier Card
> + *
> + *
> + * Authors:
> + *  Alejandro Largacha <alexlargacha@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Reservation via device tree: 0x800000000..0x83fffffff
> + */
> +
> +#include <jailhouse/types.h>
> +#include <jailhouse/cell-config.h>
> +
> +//#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> +
> +struct {
> +	struct jailhouse_system header;
> +	__u64 cpus[1];
> +	struct jailhouse_memory mem_regions[11];
> +	struct jailhouse_irqchip irqchips[1];
> +} __attribute__((packed)) config = {
> +	.header = {
> +		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> +		.hypervisor_memory = {
> +			.phys_start = 0x40000000,
> +			.size =       0x01000000,
> +		},
> +		.debug_console = {
> +			.address = 0xff000000,
> +			.size = 0x1000,
> +			.type = JAILHOUSE_CON_TYPE_XUARTPS,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_REGDIST_4,
> +		},
> +		.platform_info = {
> +			.pci_mmconfig_base = 0xfc000000,
> +			.pci_mmconfig_end_bus = 0,
> +			.pci_is_virtual = 1,
> +			.pci_domain = -1,
> +			.arm = {
> +				.gic_version = 2,
> +				.gicd_base = 0xf9010000,
> +				.gicc_base = 0xf902f000,
> +				.gich_base = 0xf9040000,
> +				.gicv_base = 0xf906f000,
> +				.maintenance_irq = 25,
> +			},
> +		},
> +		.root_cell = {
> +			.name = "UltraZed SoM",
> +
> +			.cpu_set_size = sizeof(config.cpus),
> +			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +			.num_irqchips = ARRAY_SIZE(config.irqchips),
> +			.vpci_irq_base = 136-32,
> +		},
> +	},
> +
> +	.cpus = {
> +		0xf,
> +	},
> +
> +	.mem_regions = {
> +		/* MMIO (permissive) */ {
> +			.phys_start = 0xfd000000,
> +			.virt_start = 0xfd000000,
> +			.size =	      0x03000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* RAM */ {
> +			.phys_start = 0x0,
> +			.virt_start = 0x0,
> +			.size = 0x40000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* RAM */ {
> +			.phys_start = 0x42000000,
> +			.virt_start = 0x42000000,
> +			.size = 0x3e000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* PL gpio switches */ {
> +			.phys_start = 0xA0000000,
> +			.virt_start = 0xA0000000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* PL gpio leds */ {
> +			.phys_start = 0xA0001000,
> +			.virt_start = 0xA0001000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +
> +		/* PL gpio stop timer */ {
> +			.phys_start = 0xA0003000,
> +			.virt_start = 0xA0003000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +
> +		/* PL Timer 0 */ {
> +			.phys_start = 0xA0002000,
> +			.virt_start = 0xA0002000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +
> +		/* PL Timer 1 PWM */ {
> +			.phys_start = 0xA0004000,
> +			.virt_start = 0xA0004000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +
> +		/* IVSHMEM shared memory region for 00:00.0 */ {
> +			.phys_start = 0x41400000,
> +			.virt_start = 0x41400000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +		/* IVSHMEM shared memory region for 00:01.0 */ {
> +			.phys_start = 0x41500000,
> +			.virt_start = 0x41500000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +	},
> +
> +	.irqchips = {
> +		/* GIC */ {
> +			.address = 0xf9010000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +	},
> +};
> 

Thanks, applied to next.

Did you intentionally left out support for a non-root Linux cell (and
ivshmem settings)?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dda7a082-2c0a-3899-ced2-34f31ed0bd5f%40siemens.com.
