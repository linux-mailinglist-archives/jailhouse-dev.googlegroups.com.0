Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBFVIX7VQKGQEPDYB3GQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id E626AA85FC
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 17:11:19 +0200 (CEST)
Received: by mail-yb1-xb3d.google.com with SMTP id f40sf17147196ybj.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2019 08:11:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567609879; cv=pass;
        d=google.com; s=arc-20160816;
        b=CnKLXKLPH9ituw4JxJNDEV9p+x88Vb4ELl4+fyKcDlvogCSiHg3rPFkxJmxDBul95j
         suH8KI11DtHY2Hg3+SFmH9RG0qytXy1RuOZLXHpS2XjQGODIv7BgTFLOjyqHsN1x15Wt
         0gnM5pv47OOlFq5Svwq6nPGhV3rtPU9Et+l0/+N4E4KvadFaTRH3XY91Po+C+A1kA7qt
         bnCJ0P2raHjeDJIl5SBlx7cgixftYKnovpk6SL0JjDQQqlbwz2RbLYQfcgBTwtsPQr9D
         CH48RXdcQ//TG+5imGB/eNKRJXN1YnkycliKjnobaLwG8bIh8KjJac9wT+pqjO8jrS28
         o9Rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=HWb4iGZB3UatfSdJ3rftdLMnheaJPwxqwhVtfJtCPl4=;
        b=aQ4geAaoJZpm1jj0EG6/CGyplRHH/BvbTAYFiWZp6HY4lb2kXSYrxqArdorx6OPuCb
         A3Rzhn+JDGgkAeeFGlhJJtSKQUtHRw36n/m+FIuV44xkegVCoZOdbA8RhWEFWI9PnE3j
         ple+pw1WmDIqsMuO0PExgLOMsiJY0BhTl2UAG7iBxJ3UinI5zTfjFndPfLThFffXmsU8
         P7LQe9XRxqq28z4LDEYjEQw7X4kjxJ+28tvOa3x7IMs2E6gLA5baaTqyq7cG1WmjeIiB
         IUq4l5/M3SEZNSH9SwQXyuu5Kjml2Vwl0/3jv589rktHWKM5a9SfH1NasB4iVdTHcB1+
         Elbw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OscDYjYK;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=HWb4iGZB3UatfSdJ3rftdLMnheaJPwxqwhVtfJtCPl4=;
        b=oT/8LVtfTSNbMA7fHX0neT5sXqo+jqkJbv80pvSiQ4KhF6ZXPSX4oQqBCPzHfDXikI
         VnqzXwV7NDFVW3BafP+r2sMBB35eXpLe8oL52ZOmR/+sE/bKFiU4jSUMBvuNihAKCmS0
         RtKGvcaGO7xAbUImT17zyBzzPmRRstApVMUgwfYED+bDgc3LMBXHf0GOHzkmBMSkR2UK
         BkHzA6DOOruO9NZpNH81sLtLeMKqij1hvT65qDsQ0HKItAKqaYTknfwdw+Euatf8vamN
         MwXWxszJFkxbK9u8sbJAUgkGbjXJHM10++ctatRPI+B7r1wmK6r/Pi7l1eyhzbHa6D/H
         vB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HWb4iGZB3UatfSdJ3rftdLMnheaJPwxqwhVtfJtCPl4=;
        b=qPgFVywOdtSPKGd5RuPl2chtvmSTkrtWY6htleMLM0odlGn8AFzTQwLtzN3QGBKKfX
         ar9jLcC55y0AHxVwPDrdv0vy95hvZDZPLABWMJ5arC1xljVwm5Jmh0wcG5wCkXSZmtvr
         ewpIJsIoJ71zDTVtfAyGPBUJ2HliFBtht8A+UvPIJVoQ5ehzASc2B1fBwdycE1FiDpoU
         zEfz9MkczcR1tV/VhQvMIoGFjDVjVih2UU1UKNhwQCnSFJ7W4oMU4LTndIi/K3/Xl03t
         0BWoa+748c6ZU3wk2vDgI1wbzsJPDlnXuNUxaPjFJwyyBY4yHJVBARcHmNsiRzs2KHv1
         hbfQ==
X-Gm-Message-State: APjAAAWLpv9s5qKAr6R6/47hg2Dl5sZk3W24qRyaj/Mq0RqnreA4RYIy
	k0BrngiFPAjGAkWabKzHQRg=
X-Google-Smtp-Source: APXvYqwPkpK0mAQe+lpmSJPVE5wHcHJuk+L5CDRdTqdDNLcgurcha3qOQs71AwWv96jAKBmnsBZzYw==
X-Received: by 2002:a5b:981:: with SMTP id c1mr27992760ybq.14.1567609878896;
        Wed, 04 Sep 2019 08:11:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0d:d045:: with SMTP id s66ls2878650ywd.13.gmail; Wed, 04
 Sep 2019 08:11:18 -0700 (PDT)
X-Received: by 2002:a0d:d8d5:: with SMTP id a204mr30916015ywe.6.1567609878364;
        Wed, 04 Sep 2019 08:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567609878; cv=none;
        d=google.com; s=arc-20160816;
        b=eSef6AueMkqbx1v7DEeC0OcxrT4BAPI7VjmmVVnUlYpDYA+mfOnooXwFCEOIeUSDNc
         9PI3fxjZ/KT8eDX/sFgq9r6Kzo4ydQrOjZ9sPIjFhavkzO8fkvJW08K8ZeHrbQscDjIr
         hEjtIuYM7YhCQln/MKVrdxJ2JQ46nbUH40+5A6BKpvCNXqseQDo/3ShqDm5U9CrM4slS
         euYL26U6S3KULf53yhC483SHtI5n7tLaYu3bGUO0BIF1stXqwbVixNRuzZmJrgPSeScg
         8kyBRxZad5n5PyAOtjuEGJFhn4KwQRhIfDwagqbnys18qqz/y5NIkiHtNWdp3j8BrE++
         0N2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=aKfQMOUL7joVVXZdhwTv8UfedPyoavJYMOAVDf9Ru7c=;
        b=TtSgPEbAit3dCnFVkJonyPNgDnM4oms8hVBF3SSECtimCKGPPFQAZZD5lKBBnw8G6x
         HIBvAFa4yb+Jn8jcyd1wuMVAyyNRbEPArmHs6jEXwGseZa2svGv4CiVTMb+s0jx2jAiG
         /G334FIqGrC92Dx/U6v0jC4vxpns/ijA/rQR3AbJdxTLLKZQydp1v+Sxg4w8YRBeyB9/
         dGar1qQWDarNVl7nVBPVH8L041sTG2PGxoVRyHjXLICLL6na5GcRZPatf+QHfo04y06R
         VZXdEuHdY36kw6p+Ot2e3TQRmke6zz4TtWjv4PFwJn418l2xRfx0mgO76Yj4kfKlUgbx
         qcSQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OscDYjYK;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id p140si344167ywg.4.2019.09.04.08.11.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 08:11:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x84FBHev032226;
	Wed, 4 Sep 2019 10:11:17 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x84FBHww063610
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Sep 2019 10:11:17 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 4 Sep
 2019 10:11:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 4 Sep 2019 10:11:17 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x84FBFJp041351;
	Wed, 4 Sep 2019 10:11:16 -0500
Subject: Re: [PATCH v3 2/4] configs: arm64: Add support for k3-j721-evm board
To: Lokesh Vutla <lokeshvutla@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
References: <1567599723-19589-1-git-send-email-nikhil.nd@ti.com>
 <1567599723-19589-3-git-send-email-nikhil.nd@ti.com>
 <3e84f581-4c25-0e5d-2f3f-985aad15ec52@ti.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <31865431-6806-d022-98dd-c1b76279fa9d@ti.com>
Date: Wed, 4 Sep 2019 20:41:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <3e84f581-4c25-0e5d-2f3f-985aad15ec52@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=OscDYjYK;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
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

On 04/09/19 7:06 PM, Lokesh Vutla wrote:
> 
> 
> On 04/09/19 5:52 PM, Nikhil Devshatwar wrote:
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
>> Changes from v2:
>> * Do not map hypervisor memory into root cell
>>
>> Changes from v1:
>> * Split up the peripheral mem_region to match with kernel dts
>>
>>   configs/arm64/k3-j721e-evm.c | 340 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 340 insertions(+)
>>   create mode 100644 configs/arm64/k3-j721e-evm.c
>>
>> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
>> new file mode 100644
>> index 0000000..bc68c03
>> --- /dev/null
>> +++ b/configs/arm64/k3-j721e-evm.c
>> @@ -0,0 +1,340 @@
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
>> +		/* RAM - reserved for ivshmem and baremetal apps */ {
>> +			.phys_start = 0x89fe00000,
>> +			.virt_start = 0x89fe00000,
>> +			.size = 0x200000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>> +		},
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
> 
> There are already 3 instances of PCIe in SoC. Can you use domain = 3?

Got it. Will do

Nikhil D

> 
> Thanks and regards,
> Lokesh
> 
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/31865431-6806-d022-98dd-c1b76279fa9d%40ti.com.
