Return-Path: <jailhouse-dev+bncBCB7D7MXMMIJJ7F65MCRUBDIZVSN6@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe3d.google.com (mail-vs1-xe3d.google.com [IPv6:2607:f8b0:4864:20::e3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E32A83D6
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 15:37:26 +0200 (CEST)
Received: by mail-vs1-xe3d.google.com with SMTP id w22sf1742182vsw.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2019 06:37:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567604245; cv=pass;
        d=google.com; s=arc-20160816;
        b=yBPQLSQCarqwPWOK3FV2gEUikq9KxICz1pKSmfuzU824H6Dk+DHLDRZ9mXgXSnU9gs
         sfdNRN0CAluwRTUrmKtdLf26r2Zb0wUDVyPfYm6R8K2lNCIGsUMworM+kUyBJh9L1zFb
         mCS1oX75klewL7XnDSFDRkysCILdt3Mfl78AxplNbBcIwWWLFL/QhEy39+YmK4bB8KKB
         ndl8LQLyPlkcS5vgoYORna3V+2bqjlwYHV/l2Gn8O0VGEgr2nPUO9Gv2SSwhc4nXKIDr
         QsSAoOuzwUcUTUMyKjV7hIElZChZmvwu59eP0tTOcB4awZ/YMl38oVboqnCX0iAXfRhn
         5jbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=glc/iyj44VLbbQmmaW13q3YJInn3D6PFIfD7b+2m4kE=;
        b=kN7G3zUy3rOHEviPBhpHOG3FeoyH7RC+ANURckQ5Yl+XoKi3ywpaUJaUyWQTZdZkMD
         xbGXiy3BSNd70dq/PAUnlH6i+R15qat2nntC5vH0R1twF10UarsN0CctHsZNrYaHFxps
         bTnm7x5DQnKsi/TrUVEix6MCOPxdH4hjMMw+l23YtW0JowItEfcjdydYJDy6D2MpyP3a
         JzB8eqCzaLvlDi+/6o0gDJzA06sfIRUOdJh1tFmqw4M5MEnOz3kinzJZ4iAXbMa14L7i
         y3Qa0zzucXBeeg+ePf45r+XrJxN9ATcCXMSGLLyYzwbEJqjVgZpTtgciR7+y0eMQQHvn
         sl5w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HA817O+m;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=glc/iyj44VLbbQmmaW13q3YJInn3D6PFIfD7b+2m4kE=;
        b=fEAE51TV+b3v3sKnmAEL/SoqvoYYtqU5ODG52wPPpzPeU9Kdi4jmagKoFT7Znov7rc
         4tN5EDn5pCIzEcb3uRLSujb58ZN6EK6b/RzSIOAAX24X52bfSjSezGfchx3sSZrH/Tbd
         qGVuEVtQOryvpnedxFv+l/2HfGfp1ZiB+dEBl+X3wqfqBcr79sHAB9HjMwL0oajEI21Q
         wd3787wbHcfE2uew9/14u+BDu/Iz0kGj5T4iKB1wd6WwMOkiKeSWRFbGqAWbFrbLZdN4
         n/hzCBnerzuG0AGjQz/MT1JxIcWos2MxWS4uhJt6SRE7wlkH6p0fkq5Jyxt1kFW9PB+6
         QOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=glc/iyj44VLbbQmmaW13q3YJInn3D6PFIfD7b+2m4kE=;
        b=jylAHMR7QFi1h/KKqefhZfL2q5x7jStG+ZHRi7vTkqCvBV9K0Vxyao49nWW0sa730m
         r+rEuidAvV316pscakY/BTY9kJCV6w8Xqf6kLoXU0q8EvGqbpyoUXXxi95223e645hk+
         vd/e5Zkb0vbEs5kma/tHfERSq1Vlis6wLEtlz2phXhFpKf/H6xzLJz5MyH5ed0hDZyMc
         4a/jcxZXhZw5ZEz5zCJUa5ZMgNJG9++rsZHv/UeFvqDKpahjm8JYhtqKO1NUh+pc8wWU
         mGLgcTHaNvasVT24XBtOlgaWjHN6CV4Enqwd1mBDHVCrN+9E96Bq9CpSQE/ByHfTDibY
         mftQ==
X-Gm-Message-State: APjAAAUi9YBNxYSa6/58Yo40kkzdArO4P2TJZAxkP9IFEf7FjBTEKWJ/
	z23e3lfY2t0Uz8gcdTaseZ4=
X-Google-Smtp-Source: APXvYqzglT6Z6v/CUXHoME90d4Oh8MdJc6QNDQzMeJ1f7TcQCOqfHbfqsAsnUQmZJs92GVQ1dxp6/A==
X-Received: by 2002:ab0:634d:: with SMTP id f13mr19582254uap.58.1567604245190;
        Wed, 04 Sep 2019 06:37:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:2605:: with SMTP id m5ls1759929vsm.9.gmail; Wed, 04 Sep
 2019 06:37:24 -0700 (PDT)
X-Received: by 2002:a67:f504:: with SMTP id u4mr775289vsn.146.1567604244647;
        Wed, 04 Sep 2019 06:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567604244; cv=none;
        d=google.com; s=arc-20160816;
        b=Ns6p6sDL+LKTK4WsSf/62UW7/avKXcyFPgDKx6C6cFupbMUZWNtkR23SuX6X5+O2ef
         ikqC4JYgrdibxoAlHm0/oTBgLj+jTqnzwz/PPn8JuhT4yGm+wX6KZ9KvejMFQo3V/A/4
         nt1FglTwYQAiEtLwgAtHHBdUvQwNzM2PPb9DK/iWcvZvY25zvkhPiQSFMyGvgCIDwY9A
         P6oBd2JQNS5/glGJALQwGXg2sAxVggZabnqm+cFYiVzW1x2Vuac5W9KTptB9U9GGNa3n
         ySGWFGVO2Hwo0eUn0cn+k81v8KtSCzRXytZdFvUphhytV/JDKi/0j+QuFXT8Wa0B6TxJ
         uL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=KVGdoDaQZvY6E4VwUrFtHuguwU+MgthQq3LpQ5HxcHk=;
        b=U85r3cESJfVBHfmfA74CvHngZjRTM0Np8KQAvful6tV9Ymlzz+XXX35GaEpV/k4hy9
         jNH2MavXOxrg2nRu1bNpk9bCtOw2VOsQpqLjueGX+uDtlfJMHu3mrx0Fsp2dAMsay3B9
         A/xRfHojw79lyDaP2Yo7etqmpEODaQHoUc3iwdpuNRlfArrHpzQVProLI8Kyaawklaoi
         rPDsXy0a6n09eAGz9hineKvMS2IV8Ob22O+hjno3E0RsKHLQ69eIDbbVR21hOx528jaS
         7argYCpXcuE+AdHIsVnpMPhQcqG6j9z+IPcqNDbxE7th341G1u6TCorCiIeO9uFPiHaV
         zU/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HA817O+m;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id a128si902595vkh.1.2019.09.04.06.37.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 06:37:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x84DbN6Q001964;
	Wed, 4 Sep 2019 08:37:23 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x84DbN6s014584
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Sep 2019 08:37:23 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 4 Sep
 2019 08:37:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 4 Sep 2019 08:37:23 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x84DbKAQ007702;
	Wed, 4 Sep 2019 08:37:22 -0500
Subject: Re: [PATCH v3 2/4] configs: arm64: Add support for k3-j721-evm board
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <jailhouse-dev@googlegroups.com>,
        <jan.kiszka@siemens.com>
References: <1567599723-19589-1-git-send-email-nikhil.nd@ti.com>
 <1567599723-19589-3-git-send-email-nikhil.nd@ti.com>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <3e84f581-4c25-0e5d-2f3f-985aad15ec52@ti.com>
Date: Wed, 4 Sep 2019 19:06:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1567599723-19589-3-git-send-email-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=HA817O+m;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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



On 04/09/19 5:52 PM, Nikhil Devshatwar wrote:
> k3-j721e-evm is the new evaluation module from Texas Instruments
> which has the j721e SoC. (aka DRA829) It has a dual core
> ARM Cortex-A72 CPU cores, 4GiB of RAM, 2x Display ports,
> 6x UART ports, 5x ethernet ports, SD and eMMC interfaces for
> storage and many other connectivity, graphics, multimedia and
> other accelerator devices.
> 
> J721E TRM: http://www.ti.com/lit/ug/spruil1/spruil1.pdf
> 
> Add support for the jailhouse root cell config for this board.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
> Changes from v2:
> * Do not map hypervisor memory into root cell
> 
> Changes from v1:
> * Split up the peripheral mem_region to match with kernel dts
> 
>  configs/arm64/k3-j721e-evm.c | 340 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 340 insertions(+)
>  create mode 100644 configs/arm64/k3-j721e-evm.c
> 
> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
> new file mode 100644
> index 0000000..bc68c03
> --- /dev/null
> +++ b/configs/arm64/k3-j721e-evm.c
> @@ -0,0 +1,340 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + *
> + * Configuration for K3 based J721E-EVM
> + *
> + * Authors:
> + *  Nikhil Devshatwar <nikhil.nd@ti.com>
> + *  Lokesh Vutla <lokeshvutla@ti.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/types.h>
> +#include <jailhouse/cell-config.h>
> +
> +struct {
> +	struct jailhouse_system header;
> +	__u64 cpus[1];
> +	struct jailhouse_memory mem_regions[30];
> +	struct jailhouse_irqchip irqchips[6];
> +	struct jailhouse_pci_device pci_devices[1];
> +} __attribute__((packed)) config = {
> +	.header = {
> +		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> +		.hypervisor_memory = {
> +			.phys_start = 0x89fa00000,
> +			.size = 0x400000,
> +		},
> +		.debug_console = {
> +			.address = 0x02800000,
> +			.size = 0x1000,
> +			.type = JAILHOUSE_CON_TYPE_8250,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_MDR_QUIRK |
> +				 JAILHOUSE_CON_REGDIST_4,
> +		},
> +		.platform_info = {
> +			.pci_mmconfig_base = 0x76000000,
> +			.pci_mmconfig_end_bus = 0,
> +			.pci_is_virtual = 1,
> +			.pci_domain = 1,
> +			.arm = {
> +				.gic_version = 3,
> +				.gicd_base = 0x01800000,
> +				.gicr_base = 0x01900000,
> +				.maintenance_irq = 25,
> +			},
> +		},
> +		.root_cell = {
> +			.name = "k3-j721e-evm",
> +
> +			.cpu_set_size = sizeof(config.cpus),
> +			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +			.num_irqchips = ARRAY_SIZE(config.irqchips),
> +			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +			.vpci_irq_base = 191 - 32,
> +		},
> +	},
> +
> +	.cpus = {
> +		0x3,
> +	},
> +
> +	.mem_regions = {
> +		/* IVSHMEM shared memory region for 00:00.0 */ {
> +			.phys_start = 0x89fe00000,
> +			.virt_start = 0x89fe00000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +		/* ctrl mmr */ {
> +			.phys_start = 0x00100000,
> +			.virt_start = 0x00100000,
> +			.size = 0x00020000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* gpio */ {
> +			.phys_start = 0x00600000,
> +			.virt_start = 0x00600000,
> +			.size = 0x00032000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* serdes */ {
> +			.phys_start = 0x00900000,
> +			.virt_start = 0x00900000,
> +			.size = 0x00012000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* timesync router */ {
> +			.phys_start = 0x00A40000,
> +			.virt_start = 0x00A40000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* Most peripherals */ {
> +			.phys_start = 0x01000000,
> +			.virt_start = 0x01000000,
> +			.size = 0x0af03000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MAIN NAVSS */ {
> +			.phys_start = 0x30800000,
> +			.virt_start = 0x30800000,
> +			.size = 0x0bc00000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* PCIe Core */ {
> +			.phys_start = 0x0d000000,
> +			.virt_start = 0x0d000000,
> +			.size = 0x01000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* PCIe DAT */ {
> +			.phys_start = 0x10000000,
> +			.virt_start = 0x10000000,
> +			.size = 0x10000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* C71 */ {
> +			.phys_start = 0x64800000,
> +			.virt_start = 0x64800000,
> +			.size = 0x00800000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* C66_0 */ {
> +			.phys_start = 0x4D80800000,
> +			.virt_start = 0x4D80800000,
> +			.size = 0x00800000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* C66_1 */ {
> +			.phys_start = 0x4D81800000,
> +			.virt_start = 0x4D81800000,
> +			.size = 0x00800000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* GPU */ {
> +			.phys_start = 0x4E20000000,
> +			.virt_start = 0x4E20000000,
> +			.size = 0x00080000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU NAVSS */ {
> +			.phys_start = 0x28380000,
> +			.virt_start = 0x28380000,
> +			.size = 0x03880000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU First peripheral window */ {
> +			.phys_start = 0x40200000,
> +			.virt_start = 0x40200000,
> +			.size = 0x00999000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU CTRL_MMR0 */ {
> +			.phys_start = 0x40f00000,
> +			.virt_start = 0x40f00000,
> +			.size = 0x00020000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU R5F Core0 */ {
> +			.phys_start = 0x41000000,
> +			.virt_start = 0x41000000,
> +			.size = 0x00020000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU R5F Core1 */ {
> +			.phys_start = 0x41400000,
> +			.virt_start = 0x41400000,
> +			.size = 0x00020000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU SRAM */ {
> +			.phys_start = 0x41c00000,
> +			.virt_start = 0x41c00000,
> +			.size = 0x00100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU WKUP peripheral window */ {
> +			.phys_start = 0x42040000,
> +			.virt_start = 0x42040000,
> +			.size = 0x03ac3000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU MMRs, remaining NAVSS */ {
> +			.phys_start = 0x45100000,
> +			.virt_start = 0x45100000,
> +			.size = 0x00c24000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU CPSW */ {
> +			.phys_start = 0x46000000,
> +			.virt_start = 0x46000000,
> +			.size = 0x00200000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU OSPI register space */ {
> +			.phys_start = 0x47000000,
> +			.virt_start = 0x47000000,
> +			.size = 0x00068400,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU FSS OSPI0/1 data region 0 */ {
> +			.phys_start = 0x50000000,
> +			.virt_start = 0x50000000,
> +			.size = 0x10000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU FSS OSPI0 data region 3 */ {
> +			.phys_start = 0x500000000,
> +			.virt_start = 0x500000000,
> +			.size = 0x100000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* MCU FSS OSPI1 data region 3 */ {
> +			.phys_start = 0x700000000,
> +			.virt_start = 0x700000000,
> +			.size = 0x100000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* RAM - first bank*/ {
> +			.phys_start = 0x80000000,
> +			.virt_start = 0x80000000,
> +			.size = 0x80000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> +				JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* RAM - second bank */ {
> +			.phys_start = 0x880000000,
> +			.virt_start = 0x880000000,
> +			.size = 0x1fa00000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> +				JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* RAM - reserved for ivshmem and baremetal apps */ {
> +			.phys_start = 0x89fe00000,
> +			.virt_start = 0x89fe00000,
> +			.size = 0x200000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* RAM - reserved for inmate */ {
> +			.phys_start = 0x8a0000000,
> +			.virt_start = 0x8a0000000,
> +			.size = 0x60000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +	},
> +	.irqchips = {
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 160,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 288,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 416,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 544,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 800,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		/* 0001:00:00.0 */ {
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 1,

There are already 3 instances of PCIe in SoC. Can you use domain = 3?

Thanks and regards,
Lokesh

> +			.bdf = 0x00,
> +			.bar_mask = {
> +				0xffffff00, 0xffffffff, 0x00000000,
> +				0x00000000, 0x00000000, 0x00000000,
> +			},
> +			.shmem_region = 0,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +		},
> +	},
> +};
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3e84f581-4c25-0e5d-2f3f-985aad15ec52%40ti.com.
