Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBA7K53VAKGQEFIOVHAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63b.google.com (mail-pl1-x63b.google.com [IPv6:2607:f8b0:4864:20::63b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6926B95A64
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 10:53:25 +0200 (CEST)
Received: by mail-pl1-x63b.google.com with SMTP id k9sf3672507pls.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 01:53:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566291203; cv=pass;
        d=google.com; s=arc-20160816;
        b=xHCRIogLTPixF1wie00x0ud300H4feC62vJdP+cVNvnwOQkTEWtJoGwUR332OIfPcW
         Nku3cpf0aHGWgK+mDRWL8yr78iA1+2/+tuliFvLDrShVeMlMKpKWfMl7m7dnUY/VoOK/
         /hQwaj4LHuT8TrQyQmkw7z8KXx82H0gc1TxzwbRzJ3MMTyamO/ZwWxKx7ObhiVn6AAO0
         3fGvHApYvbLIV6GCGizMMkdW9Um5e9gWUflL4rz+BCefIOf7Dm0bUDVWlSL3m3hGvifY
         hMePjURyhEAixw1MuPXigifRHgSxbWFEFZ9rIzHyfkNMBV+VkdA7vAf4UX1z9N+esA34
         RW0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=MMJjZA2s01oZaT9Gve4efXdUZUfddiQbaepHSvgnAA8=;
        b=a5SaLGXOgurUFwGdB29Qx/yQuQcPVyqGcpHKLtfYc0R6S2uyK90xWRmTFCiymLe6Tb
         I6tIYzXdZK1RLun1Y96sQX2os08kHSDLhRYezs9s5NrisPdpCIiNv/RJoNyQiUYqyk/T
         25AXf6ZMnuLwDNpOrjUpdZxvPLx+V6l7Dx6txPQcIS2TWl7d7vujsP58EzcXfoDLEO2j
         rGmroY/+YXbMnynLPT3RTRmFzS1MI6PLbtH2YiCfcTKP3dVxeRg9zAzqRuvvjKxQ+WL3
         QKfMSmvNl1P9J6rHciZUHA8A6XJZ+aHXFY0D3c6gvCJFKazkPO465+y8hWJ8ryl3ORIp
         lDiQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xewOIgPo;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=MMJjZA2s01oZaT9Gve4efXdUZUfddiQbaepHSvgnAA8=;
        b=tXvglwLV6i3HZEZDh05PLTKXUWYUXkzKLwZC1360k5IQYqWVBGKa6y2TlctPqnA6zi
         P0emv2x51bpHEp+Pa31TrbVqLHAPpiITAKHqiIfBKj9nrbs1NhGsozjUAUp8s7o480PV
         HIrX69LT4vQK+L1VcCvFkDY6y+4KkuTAp67RKohWpOj2sAlLIKEE+PvWXki7i//i+Krr
         WFLK0WoL9qE/F68dz2BBy8sapzkJY30V/KToWX0VT2dZh4u1z/hh3vV9LZo/AQ+DZK2n
         QUFFnR5yDKn7idEfJ+nM8xz7Yo9kLQYzTY+i9m0sI1XCpkuU4gykXyG9mbk6q7fd3deg
         FuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MMJjZA2s01oZaT9Gve4efXdUZUfddiQbaepHSvgnAA8=;
        b=GrPLICc6txYf7DDJD1fmFYhttS67p0nYVaTfCFvWB34W7EVLTKBH3TsphNbNeAynM9
         e4aTHNbiFn8GCEPy8RjTddjx5ccmdnnSZVTyJJMQ7D+3ERc1kP5Cy3KFiPpj6PccKpbj
         NtbDLV0kvD9kvaIpySH0DMXC6ZT1j5Hs661X5cRyTSwQmlrow8vJ5Of0NlZKiLSJ8JMV
         nXh9hiykifYSexTdI0FFnFgAfhz30UlsdhBwqabNA63SErts5UE+NegGHnzmEyuTMlvz
         6Ber0Jd3vbG+pUx8geOyxmm3JheySHubX2nu9cI+X44Vxvf2PmgV75dfnTdfKG0dXg0d
         iSJA==
X-Gm-Message-State: APjAAAUPZ9ZcDdzR2D6KZLICEYLkdhoNiRUlf2depp6Po6qpW7rzLIe8
	U4ZzZbwI+hIlD+ZDAS4Nyw8=
X-Google-Smtp-Source: APXvYqyZuobN76pdxd3RHtIHmcBSh0TP7J4GPAPmlr9N0nkP2WxsyLcuf5+Rh+HjpbuJbIHn12J7tg==
X-Received: by 2002:a63:fc52:: with SMTP id r18mr23812274pgk.378.1566291203458;
        Tue, 20 Aug 2019 01:53:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:1c24:: with SMTP id c36ls4135874pgc.14.gmail; Tue, 20
 Aug 2019 01:53:23 -0700 (PDT)
X-Received: by 2002:a65:6081:: with SMTP id t1mr23977733pgu.9.1566291202977;
        Tue, 20 Aug 2019 01:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566291202; cv=none;
        d=google.com; s=arc-20160816;
        b=x1M/DSzHFOxVE4gH0BHVcXBMDEobeDgImym2vvpo/9s2f9tNPGqDzvZogZmWNpPhHT
         XEzKocw/fO3ThOo32UlDr6ORKpzmTxgbM1glDnvj7m4ZIm5pJTcDqL1ftvh8MxeAugzB
         RXi36n5JR/KGOT17+ahhrTc1Eqbb7iXFELJ7SMhk3RXuvD+DD9VhrfU3iZo7vpIkGypo
         XXFBXCiG0hJ4aRK0gjx9mfNl9VkhBy0jElsGlk6Hcry3jrzgeYaHGgVkRxYSdngoQgVb
         f2pYXfAxWLu+a5MZ30ikhvq40I8zRv474mxMTbvwpEsSEZZqoDAfsIS8TwdcFiMNgXyy
         NWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=jzli8Uu7f7YOyi7Q9V69dotspTcSC3Bj1snUPqZBrQI=;
        b=s7U4IpCJko0vpo6NnVrmIwO81tefj4fHk/Dy1PcFxZD1jAv77azqJtAKaPNJIfPsbx
         XCqh9jXK1jxXHfIwct1NJ25/gnJu7EgemP3SNMHhl956rL1p5BLXV0TFI6ThjdX8YQdr
         5Mwvk+KkI+/c5ZLyXCSf0pDWkVVAba43a3DUU/AE4KHzpVSu1LSYSoIkucrksM8iRNBD
         1g0PM3t8gpbsIqYqGTsMSaZzNsAYnI8l0fWxHmVioL08P7qFd02B0d9uGSSSdLdJwpC2
         EdUwMxpEE1bzhAXzvQoPxWvvEk9MNeQYV3YLPLCpUvsOlgn/O7Bcu4Ex5wxLJ9XHWxQA
         MGZg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xewOIgPo;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id z5si194075plo.3.2019.08.20.01.53.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 01:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7K8rMVk027377;
	Tue, 20 Aug 2019 03:53:22 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7K8rMMP020316
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Aug 2019 03:53:22 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 03:53:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 03:53:21 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7K8rJLg048053;
	Tue, 20 Aug 2019 03:53:20 -0500
Subject: Re: [PATCH v2 2/4] configs: arm64: Add support for k3-j721-evm board
To: Lokesh Vutla <lokeshvutla@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
References: <1566224813-20129-1-git-send-email-nikhil.nd@ti.com>
 <1566224813-20129-3-git-send-email-nikhil.nd@ti.com>
 <05754d1d-ab11-a07d-ae5c-1c113e4b9fc6@ti.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <41d5ff0b-a7c4-4fac-8694-c88d5b46f801@ti.com>
Date: Tue, 20 Aug 2019 14:23:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <05754d1d-ab11-a07d-ae5c-1c113e4b9fc6@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=xewOIgPo;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <a0132237@ti.com>
Reply-To: Nikhil Devshatwar <a0132237@ti.com>
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

On 19/08/19 10:20 PM, Lokesh Vutla wrote:
> 
> 
> On 19/08/19 7:56 PM, Nikhil Devshatwar wrote:
>> k3-j721e-evm is the new evaluation module from Texas Instruments
>> which has the j721e SoC. (aka DRA829) It has a dual core
>> ARM Cortex-A72 CPU cores, 4GiB of RAM, 2x Display ports,
>> 6x UART ports, 5x ethernet ports, SD and eMMC interfaces for
>> storage and many other connectivity, graphics, multimedia and
>> other accelerator devices.
>>
>> J721E TRM: http://www.ti.com/lit/ug/spruil1/spruil1.pdf
>>
>> Add support for the jailhouse root cell config for this board.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>> ---
>> Changes from v1:
>> * Split up the peripheral mem_region to match with kernel dts
>>
>>   configs/arm64/k3-j721e-evm.c | 343 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 343 insertions(+)
>>   create mode 100644 configs/arm64/k3-j721e-evm.c
>>
>> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
>> new file mode 100644
>> index 0000000..292093b
>> --- /dev/null
>> +++ b/configs/arm64/k3-j721e-evm.c
>> @@ -0,0 +1,343 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com/
>> + *
>> + * Configuration for K3 based J721E-EVM
>> + *
>> + * Authors:
>> + *  Nikhil Devshatwar <nikhil.nd@ti.com>
>> + *  Lokesh Vutla <lokeshvutla@ti.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include <jailhouse/types.h>
>> +#include <jailhouse/cell-config.h>
>> +
>> +struct {
>> +	struct jailhouse_system header;
>> +	__u64 cpus[1];
>> +	struct jailhouse_memory mem_regions[30];
>> +	struct jailhouse_irqchip irqchips[6];
>> +	struct jailhouse_pci_device pci_devices[1];
>> +} __attribute__((packed)) config = {
>> +	.header = {
>> +		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>> +		.revision = JAILHOUSE_CONFIG_REVISION,
>> +		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
>> +		.hypervisor_memory = {
>> +			.phys_start = 0x89fa00000,
>> +			.size = 0x400000,
>> +		},
>> +		.debug_console = {
>> +			.address = 0x02800000,
>> +			.size = 0x1000,
>> +			.type = JAILHOUSE_CON_TYPE_8250,
>> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
>> +				 JAILHOUSE_CON_MDR_QUIRK |
>> +				 JAILHOUSE_CON_REGDIST_4,
>> +		},
>> +		.platform_info = {
>> +			.pci_mmconfig_base = 0x76000000,
>> +			.pci_mmconfig_end_bus = 0,
>> +			.pci_is_virtual = 1,
>> +			.pci_domain = 1,
>> +			.arm = {
>> +				.gic_version = 3,
>> +				.gicd_base = 0x01800000,
>> +				.gicr_base = 0x01900000,
>> +				.maintenance_irq = 25,
>> +			},
>> +		},
>> +		.root_cell = {
>> +			.name = "k3-j721e-evm",
>> +
>> +			.cpu_set_size = sizeof(config.cpus),
>> +			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
>> +			.num_irqchips = ARRAY_SIZE(config.irqchips),
>> +			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
>> +			.vpci_irq_base = 191 - 32,
>> +		},
>> +	},
>> +
>> +	.cpus = {
>> +		0x3,
>> +	},
>> +
>> +	.mem_regions = {
>> +		/* IVSHMEM shared memory region for 00:00.0 */ {
>> +			.phys_start = 0x89fe00000,
>> +			.virt_start = 0x89fe00000,
>> +			.size = 0x100000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> +		},
>> +		/* ctrl mmr */ {
>> +			.phys_start = 0x00100000,
>> +			.virt_start = 0x00100000,
>> +			.size = 0x00020000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* gpio */ {
>> +			.phys_start = 0x00600000,
>> +			.virt_start = 0x00600000,
>> +			.size = 0x00032000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* serdes */ {
>> +			.phys_start = 0x00900000,
>> +			.virt_start = 0x00900000,
>> +			.size = 0x00012000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* timesync router */ {
>> +			.phys_start = 0x00A40000,
>> +			.virt_start = 0x00A40000,
>> +			.size = 0x00001000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* Most peripherals */ {
>> +			.phys_start = 0x01000000,
>> +			.virt_start = 0x01000000,
>> +			.size = 0x0af03000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* MAIN NAVSS */ {
>> +			.phys_start = 0x30800000,
>> +			.virt_start = 0x30800000,
>> +			.size = 0x0bc00000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* PCIe Core */ {
>> +			.phys_start = 0x0d000000,
>> +			.virt_start = 0x0d000000,
>> +			.size = 0x01000000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* PCIe DAT */ {
>> +			.phys_start = 0x10000000,
>> +			.virt_start = 0x10000000,
>> +			.size = 0x10000000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* C71 */ {
>> +			.phys_start = 0x64800000,
>> +			.virt_start = 0x64800000,
>> +			.size = 0x00800000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* C66_0 */ {
>> +			.phys_start = 0x4D80800000,
>> +			.virt_start = 0x4D80800000,
>> +			.size = 0x00800000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* C66_1 */ {
>> +			.phys_start = 0x4D81800000,
>> +			.virt_start = 0x4D81800000,
>> +			.size = 0x00800000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* GPU */ {
>> +			.phys_start = 0x4E20000000,
>> +			.virt_start = 0x4E20000000,
>> +			.size = 0x00080000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +
>> +
> 
> extra line..
> 
>> +		/* MCU NAVSS */ {
>> +			.phys_start = 0x28380000,
>> +			.virt_start = 0x28380000,
>> +			.size = 0x03880000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* MCU First peripheral window */ {
>> +			.phys_start = 0x40200000,
>> +			.virt_start = 0x40200000,
>> +			.size = 0x00999000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* MCU CTRL_MMR0 */ {
>> +			.phys_start = 0x40f00000,
>> +			.virt_start = 0x40f00000,
>> +			.size = 0x00020000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* MCU R5F Core0 */ {
>> +			.phys_start = 0x41000000,
>> +			.virt_start = 0x41000000,
>> +			.size = 0x00020000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* MCU R5F Core1 */ {
>> +			.phys_start = 0x41400000,
>> +			.virt_start = 0x41400000,
>> +			.size = 0x00020000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* MCU SRAM */ {
>> +			.phys_start = 0x41c00000,
>> +			.virt_start = 0x41c00000,
>> +			.size = 0x00100000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* MCU WKUP peripheral window */ {
>> +			.phys_start = 0x42040000,
>> +			.virt_start = 0x42040000,
>> +			.size = 0x03ac3000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* MCU MMRs, remaining NAVSS */ {
>> +			.phys_start = 0x45100000,
>> +			.virt_start = 0x45100000,
>> +			.size = 0x00c24000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* MCU CPSW */ {
>> +			.phys_start = 0x46000000,
>> +			.virt_start = 0x46000000,
>> +			.size = 0x00200000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* MCU OSPI register space */ {
>> +			.phys_start = 0x47000000,
>> +			.virt_start = 0x47000000,
>> +			.size = 0x00068400,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* MCU FSS OSPI0/1 data region 0 */ {
>> +			.phys_start = 0x50000000,
>> +			.virt_start = 0x50000000,
>> +			.size = 0x10000000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* MCU FSS OSPI0 data region 3 */ {
>> +			.phys_start = 0x500000000,
>> +			.virt_start = 0x500000000,
>> +			.size = 0x100000000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* MCU FSS OSPI1 data region 3 */ {
>> +			.phys_start = 0x700000000,
>> +			.virt_start = 0x700000000,
>> +			.size = 0x100000000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +
> 
> extra line...
> 
>> +		/* RAM - first bank*/ {
>> +			.phys_start = 0x80000000,
>> +			.virt_start = 0x80000000,
>> +			.size = 0x80000000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>> +				JAILHOUSE_MEM_LOADABLE,
>> +		},
>> +		/* RAM - second bank */ {
>> +			.phys_start = 0x880000000,
>> +			.virt_start = 0x880000000,
>> +			.size = 0x1fa00000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>> +				JAILHOUSE_MEM_LOADABLE,
>> +		},
>> +		/* RAM - reserved for hypervisor */ {
>> +			.phys_start = 0x89fa00000,
>> +			.virt_start = 0x89fa00000,
>> +			.size = 0x600000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>> +		},
> 
> Why do you need to map hypervisor memory here?


Not sure. Do you need access to the Jailhouse memory after it has been enabled?
If not, I can simply remove this

Nikhil D

> 
> Thanks and regards,
> Lokesh
> 
>> +		/* RAM - reserved for inmate */ {
>> +			.phys_start = 0x8a0000000,
>> +			.virt_start = 0x8a0000000,
>> +			.size = 0x60000000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>> +		},
>> +	},
>> +	.irqchips = {
>> +		{
>> +			.address = 0x01800000,
>> +			.pin_base = 32,
>> +			.pin_bitmap = {
>> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
>> +			},
>> +		},
>> +		{
>> +			.address = 0x01800000,
>> +			.pin_base = 160,
>> +			.pin_bitmap = {
>> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
>> +			},
>> +		},
>> +		{
>> +			.address = 0x01800000,
>> +			.pin_base = 288,
>> +			.pin_bitmap = {
>> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
>> +			},
>> +		},
>> +		{
>> +			.address = 0x01800000,
>> +			.pin_base = 416,
>> +			.pin_bitmap = {
>> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
>> +			},
>> +		},
>> +		{
>> +			.address = 0x01800000,
>> +			.pin_base = 544,
>> +			.pin_bitmap = {
>> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
>> +			},
>> +		},
>> +		{
>> +			.address = 0x01800000,
>> +			.pin_base = 800,
>> +			.pin_bitmap = {
>> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
>> +			},
>> +		},
>> +	},
>> +
>> +	.pci_devices = {
>> +		/* 0001:00:00.0 */ {
>> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> +			.domain = 1,
>> +			.bdf = 0x00,
>> +			.bar_mask = {
>> +				0xffffff00, 0xffffffff, 0x00000000,
>> +				0x00000000, 0x00000000, 0x00000000,
>> +			},
>> +			.shmem_region = 0,
>> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>> +		},
>> +	},
>> +};
>>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/41d5ff0b-a7c4-4fac-8694-c88d5b46f801%40ti.com.
