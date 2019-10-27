Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB45W2XWQKGQEGH5TQAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 759F3E61B6
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Oct 2019 09:55:16 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id 11sf561652ljq.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Oct 2019 01:55:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572166516; cv=pass;
        d=google.com; s=arc-20160816;
        b=bDlyw+Y6STvkIgZHZJIpfwBRrbYJVhhCeHaQOUxZaCvFqnIYcFR6UWE9uNARsYcDrR
         inp8V+uSAMZuHLQElh+MKB8+PAbLHj7fZPIMomPuss0ZR9ythD6qfVxHSo7izdAhf6md
         6arHQdeZKvUaY4NQrnqnDeimwhZeNAfoGd52Y/S3sKhPFWeNhoFJnqU1SjDOGdnt6sVn
         t+VpSUPXUzl/PwwusU0f075l7ohTKf8IXTZcL+JU6m6YU/owJcmXW1woTYf+QPtNUlaK
         OXQxFjgBliDFQN6b61D6ML3ES59Px5olexUU3sfRFijkBcqa7pifVXqF1uoddL/lW0hu
         tGgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=CjN1q20Ww+KKl+P5wpfx9GzSVtbCKsfexDTQYtQTMaM=;
        b=w5bnuntFsqj5QQTasCNtDin7eylgmP5Eu5sXPU2WbL73X28Yl2ZxYdCUvVsQ6ODb6B
         gRBmWkT3XB7By2B+bOtDQ+Rtw02m+5EbJ0bXfuWC5CsCpadzug04M7qep7NJf5O8LrJ/
         hx/gQtqO0q3/X2Ov1Yq55dGfrUahFWhY4yedJOtSnfCpljR3kPvH7PgZo9xRu51JI5by
         wnC89neduuOUF6BqDkcLXzf3cyjMBSopuswTKsB/jzTHcrn6YTyMz/8dPszpSGZibUYj
         LDKRCwlzT0B+Ym3zkkkM+ybX+2465VW+kMDDZR+/nvZdoafyr1wDL0K7KvoIMXWExSv4
         4+mA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CjN1q20Ww+KKl+P5wpfx9GzSVtbCKsfexDTQYtQTMaM=;
        b=Hfpi6U1hRivLQ+E7fnBks4ff8hf2UqHdMjoPyvP4TJ7ljpU0HO6iuOOD3+aBP1CAJi
         oScdOMKb8XoXx8QW13f5OGiZNUu2UpqKI33Wusv+dbPdrKVUon57+T1M4cX7IK8ISW6z
         kxYAkfeUYqr4MyN1AHX3u+hur81Qwu9VdOJVfZgDdmX8gObt4ncKTSHPHur8V7yxn/Om
         xSvL0c6dodX9IJxcBib4agj3F9j0BJv3QRWQhQqBUL6LrWnEum3ejv/Ej5W7iWX/n2W3
         hW8KgWWXFW5/8tPt8KlXRiWDmXkanTMMYA2EuT26Jem+DKBBTqaU1HaBit/8xjAFlawj
         zeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CjN1q20Ww+KKl+P5wpfx9GzSVtbCKsfexDTQYtQTMaM=;
        b=jhqKpydKiY+TFnMhN+6ZFF7Z7klCOK8RiyG2vII79yLH8Ng8mEZiXEdJhpBg8WqdTn
         8SUZM5RQR0TZEhD/n2JkPYVJ9StfJ85un3yA1GONUB5VE6k/fkAeSQpIjOCcJGOv1IZ8
         E6m0t4HKbUm1AVDcKyXJnkiiH/LlScFeqrgdCuHBegww2magQOQhTd8lSnQwHm8BQZfD
         bbsgvSIMJ0fAaycbr8qk1sFtR6ya4pnFmsUWiA/qiaBNQwV5CXlIOPDePJtaGGSGe0+h
         bzOQoexjTLMPx+2DHtHngyw/UAICZ37vrVQ11P4SM4o0GTRJ/uc63OYj/hWkBH/4XRPb
         gLcg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWaYFmJ8LEy+HHau1Fqz8hnHZd50Do+IeD8Vlg+/8JuMBv1hk/O
	754GxojjhXsVilcxOPPEgP0=
X-Google-Smtp-Source: APXvYqxM3vy8vdN6uf+7FZMzROvzt8HUb/io9MUJ2bh1TuNfPnrE8eVI14GMHenXZqOxygpSWsyeJQ==
X-Received: by 2002:a05:651c:326:: with SMTP id b6mr8300007ljp.119.1572166516026;
        Sun, 27 Oct 2019 01:55:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9182:: with SMTP id f2ls889817ljg.15.gmail; Sun, 27 Oct
 2019 01:55:15 -0700 (PDT)
X-Received: by 2002:a05:651c:1042:: with SMTP id x2mr8299301ljm.127.1572166515272;
        Sun, 27 Oct 2019 01:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572166515; cv=none;
        d=google.com; s=arc-20160816;
        b=sJ/oKdtSRELz4qLIOfj5fT/6dQMyCBapdT/QZ0aCeNgBiIfFGvlJeCIv+QfCIVODG2
         Tm5zGMnv72xYRj2HWWTyzNGwlKbNRVmkvoLzjqXaqGQpt2dgPcvia5rD4JspOxnbHzyh
         nLPZRivg0hgFfRNFNXEyy8z2kS9c9H3GP4N0awdmG8WatXP98soHiLCMvc6EZW9hioCW
         NcwUZJIq/UKDC84uwVqdUxqWKTaWRL6ulLIEvh/hWhAvdFJn0j6oe3DzY01TmtmuiKVT
         X41GHD/kND8xzsLDaEG0tKsKnrasplYSBWaDdNFaTd73BmNen/7vRU3hwBVENDYuNc6W
         tO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=0ugjBhR6BA7pMwcdXU9n/ypxiWIVXWsY1FNFKVS5UXo=;
        b=e1YHZaHZxBChtNHhkhF9eBNtbUvsEO4BB+nZYiNjcR3sk8lr8LLJnN+muMDT63OwJ3
         UDyBxZwZYYLdHwVTs8xtn7hhvXNoZsIzC4nAoLZ3/cIHg3ZMsBav1o//ZG4ARhijVhW1
         HA46b29fVmrTeFXCVarbBqNLu06wz1ikWCs0jjvLChrOMHXF9O1Spum4+71uWjECuE9y
         eTHnjziaapuPnfxUkjadfGkCpXeXNfcjVEwd3agYhmZ5oyT1KrIUaq3VVQlybLsgKiol
         jto3wuUHFKPZuivgVVVP8XUoOVAQnFRQoVWu5hMqADKLhF4nUjJLAfPsszM8vKnWGAUB
         hY8w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id z9si403346ljj.4.2019.10.27.01.55.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Oct 2019 01:55:11 -0700 (PDT)
Received-SPF: temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x9R8tA6H030507
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 27 Oct 2019 09:55:10 +0100
Received: from [139.22.33.136] ([139.22.33.136])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9R8t9J8027610;
	Sun, 27 Oct 2019 09:55:09 +0100
Subject: Re: [PATCH 1/3] configs: arm64: add config files for UltraZed SOM +
 UltraZed carrier IOCC
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Alex Largacha <alexlargacha@gmail.com>, jailhouse-dev@googlegroups.com
References: <1571935318-25453-1-git-send-email-alexlargacha@gmail.com>
 <1571935318-25453-2-git-send-email-alexlargacha@gmail.com>
 <dda7a082-2c0a-3899-ced2-34f31ed0bd5f@siemens.com>
Message-ID: <ee2e8390-ec42-1bde-0075-9f17f38ed2d2@siemens.com>
Date: Sun, 27 Oct 2019 09:55:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <dda7a082-2c0a-3899-ced2-34f31ed0bd5f@siemens.com>
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

On 27.10.19 09:52, Jan Kiszka wrote:
> On 24.10.19 18:41, Alex Largacha wrote:
>> Signed-off-by: Alex Largacha <alexlargacha@gmail.com>
>> ---
>>  configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c | 120 +++++++++++++++++++++
>>  configs/arm64/ultrazed3eg-iocc.c             | 154 +++++++++++++++++++++++++++
>>  2 files changed, 274 insertions(+)
>>  create mode 100644 configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c
>>  create mode 100644 configs/arm64/ultrazed3eg-iocc.c
>>
>> diff --git a/configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c b/configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c
>> new file mode 100644
>> index 0000000..3c676e3
>> --- /dev/null
>> +++ b/configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c
>> @@ -0,0 +1,120 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Configuration for pl-irq-demo inmate on Avnet UltraZed-EG SOM + UltraZed-EG IO Carrier Card 
>> + * 1 CPU, 64K RAM, 1 serial port
>> + *
>> + *
>> + * Authors:
>> + *  Alejandro Largacha <alexlargacha@gmail.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include <jailhouse/types.h>
>> +#include <jailhouse/cell-config.h>
>> +
>> +struct {
>> +	struct jailhouse_cell_desc cell;
>> +	__u64 cpus[1];
>> +	struct jailhouse_memory mem_regions[8];
>> +    struct jailhouse_irqchip irqchips[1];
>> +} __attribute__((packed)) config = {
>> +	.cell = {
>> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>> +		.revision = JAILHOUSE_CONFIG_REVISION,
>> +		.name = "pl-gic-demo",
>> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
>> +
>> +		.cpu_set_size = sizeof(config.cpus),
>> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
>> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
>> +		.num_pci_devices = 0,
>> +
>> +		.console = {
>> +			.address = 0xff010000,
>> +			.type = JAILHOUSE_CON_TYPE_XUARTPS,
>> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
>> +				 JAILHOUSE_CON_REGDIST_4,
>> +		},
>> +	},
>> +
>> +	.cpus = {
>> +		0x8,
>> +	},
>> +
>> +	.mem_regions = {
>> +		/* UART */ {
>> +			.phys_start = 0xff010000,
>> +			.virt_start = 0xff010000,
>> +			.size = 0x1000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>> +		},
>> +		/* RAM */ {
>> +			.phys_start = 0x42000000,
>> +			.virt_start = 0,
>> +			.size = 0x00010000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>> +		},
>> +		/* GPIO_SWITCHES */ {
>> +			.phys_start = 0xA0000000,
>> +			.virt_start = 0xA0000000,
>> +			.size = 0x00001000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>> +		},
>> +		/* GPIO_LEDS */ {
>> +			.phys_start = 0xA0001000,
>> +			.virt_start = 0xA0001000,
>> +			.size = 0x00001000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>> +		},
>> +
>> +		/* GPIO_stop_counter */ {
>> +			.phys_start = 0xA0003000,
>> +			.virt_start = 0xA0003000,
>> +			.size = 0x00001000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>> +		},
>> +
>> +		/* TIMER 0 Capture*/ {
>> +			.phys_start = 0xA0002000,
>> +			.virt_start = 0xA0002000,
>> +			.size = 0x00001000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>> +		},
>> +
>> +		/* TIMER 0 Cpature*/ {
>> +			.phys_start = 0xA0004000,
>> +			.virt_start = 0xA0004000,
>> +			.size = 0x00001000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>> +		},
>> +
>> +		/* communication region */ {
>> +			.virt_start = 0x80000000,
>> +			.size = 0x00001000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_COMM_REGION,
>> +		},
>> +	},
>> +	.irqchips = {
>> +		/* GIC */ {
>> +			.address = 0xf9010000,
>> +			.pin_base = 32,
>> +			.pin_bitmap = {
>> +				1 << (54 - 32),
>> +				0,
>> +				0,
>> +				1 << (136 - 128)
>> +			},
>> +		},
>> +	}
>> +};
>> diff --git a/configs/arm64/ultrazed3eg-iocc.c b/configs/arm64/ultrazed3eg-iocc.c
>> new file mode 100644
>> index 0000000..9e38d0a
>> --- /dev/null
>> +++ b/configs/arm64/ultrazed3eg-iocc.c
>> @@ -0,0 +1,154 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Configuration for Avnet UltraZed-EG SOM + UltraZed-EG IO Carrier Card
>> + *
>> + *
>> + * Authors:
>> + *  Alejandro Largacha <alexlargacha@gmail.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + *
>> + * Reservation via device tree: 0x800000000..0x83fffffff
>> + */
>> +
>> +#include <jailhouse/types.h>
>> +#include <jailhouse/cell-config.h>
>> +
>> +//#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
>> +
>> +struct {
>> +	struct jailhouse_system header;
>> +	__u64 cpus[1];
>> +	struct jailhouse_memory mem_regions[11];
>> +	struct jailhouse_irqchip irqchips[1];
>> +} __attribute__((packed)) config = {
>> +	.header = {
>> +		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>> +		.revision = JAILHOUSE_CONFIG_REVISION,
>> +		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
>> +		.hypervisor_memory = {
>> +			.phys_start = 0x40000000,
>> +			.size =       0x01000000,
>> +		},
>> +		.debug_console = {
>> +			.address = 0xff000000,
>> +			.size = 0x1000,
>> +			.type = JAILHOUSE_CON_TYPE_XUARTPS,
>> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
>> +				 JAILHOUSE_CON_REGDIST_4,
>> +		},
>> +		.platform_info = {
>> +			.pci_mmconfig_base = 0xfc000000,
>> +			.pci_mmconfig_end_bus = 0,
>> +			.pci_is_virtual = 1,
>> +			.pci_domain = -1,
>> +			.arm = {
>> +				.gic_version = 2,
>> +				.gicd_base = 0xf9010000,
>> +				.gicc_base = 0xf902f000,
>> +				.gich_base = 0xf9040000,
>> +				.gicv_base = 0xf906f000,
>> +				.maintenance_irq = 25,
>> +			},
>> +		},
>> +		.root_cell = {
>> +			.name = "UltraZed SoM",
>> +
>> +			.cpu_set_size = sizeof(config.cpus),
>> +			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
>> +			.num_irqchips = ARRAY_SIZE(config.irqchips),
>> +			.vpci_irq_base = 136-32,
>> +		},
>> +	},
>> +
>> +	.cpus = {
>> +		0xf,
>> +	},
>> +
>> +	.mem_regions = {
>> +		/* MMIO (permissive) */ {
>> +			.phys_start = 0xfd000000,
>> +			.virt_start = 0xfd000000,
>> +			.size =	      0x03000000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* RAM */ {
>> +			.phys_start = 0x0,
>> +			.virt_start = 0x0,
>> +			.size = 0x40000000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_EXECUTE,
>> +		},
>> +		/* RAM */ {
>> +			.phys_start = 0x42000000,
>> +			.virt_start = 0x42000000,
>> +			.size = 0x3e000000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_EXECUTE,
>> +		},
>> +		/* PL gpio switches */ {
>> +			.phys_start = 0xA0000000,
>> +			.virt_start = 0xA0000000,
>> +			.size = 0x00001000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +		/* PL gpio leds */ {
>> +			.phys_start = 0xA0001000,
>> +			.virt_start = 0xA0001000,
>> +			.size = 0x00001000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +
>> +		/* PL gpio stop timer */ {
>> +			.phys_start = 0xA0003000,
>> +			.virt_start = 0xA0003000,
>> +			.size = 0x00001000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +
>> +		/* PL Timer 0 */ {
>> +			.phys_start = 0xA0002000,
>> +			.virt_start = 0xA0002000,
>> +			.size = 0x00001000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +
>> +		/* PL Timer 1 PWM */ {
>> +			.phys_start = 0xA0004000,
>> +			.virt_start = 0xA0004000,
>> +			.size = 0x00001000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> +
>> +		/* IVSHMEM shared memory region for 00:00.0 */ {
>> +			.phys_start = 0x41400000,
>> +			.virt_start = 0x41400000,
>> +			.size = 0x100000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> +		},
>> +		/* IVSHMEM shared memory region for 00:01.0 */ {
>> +			.phys_start = 0x41500000,
>> +			.virt_start = 0x41500000,
>> +			.size = 0x100000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> +		},
>> +	},
>> +
>> +	.irqchips = {
>> +		/* GIC */ {
>> +			.address = 0xf9010000,
>> +			.pin_base = 32,
>> +			.pin_bitmap = {
>> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
>> +			},
>> +		},
>> +	},
>> +};
>>
> 
> Thanks, applied to next.

Taking this back: You have ivshmem memory regions in your config, but
not the related PCI device(s). Let's fix that up first.

Jan

> 
> Did you intentionally left out support for a non-root Linux cell (and
> ivshmem settings)?
> 
> Jan
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ee2e8390-ec42-1bde-0075-9f17f38ed2d2%40siemens.com.
