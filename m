Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK567D3AKGQEG7M6EIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B791F1775
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 13:21:17 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id u15sf3831062wmm.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 04:21:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591615276; cv=pass;
        d=google.com; s=arc-20160816;
        b=bGXXXLvNfTHkohZGSRjRTaStwHnpCad5+Y56dUhJPMy0sg8WxP+Fymfau/A14VkRic
         Jrryd/stT+0aoipFL/L0/gLZEfPdNXb1+V5t6EsVehm56Rvz3+iDOvqFQj58ZE9lcjZt
         +x20KZPMMdYEvBHvAwAggQtuXVZpCjFwXLbGAfAKBimJC9h1xf/rspYKT1+qM9tO06a8
         INqJyWRY+Qbval8Ahbu0f5azFZUwaNNz/cHIkOQ65VASlYscO3dsJEzNAWpjdvaudZeE
         aVn/lswZHyutfxW4WWYmJ3LQw3DAYUJg7xsKDbX78EMRNptEW509C4QesY9EIBRDInYV
         5Gqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=RSrAIc7atA252szpipzrSa08TC3jmfuyE2ZsTAy3X6I=;
        b=a0AWahhPuGq4N3xWouqrckZ/srU1/MYt9t6ZtPPvarr1LoTkwk7CyablPRH9LU/Dm6
         FhaLuXK7mQJ3K7yEQZPd7QJBGQkVSVFWsqosj/dGbILOZHKjc+oGrO96xb0Ewn77IVbI
         STrSIOCG5M0w5vh+XWLinllFBimWvFvXmOVG1WtrN+8QlIB8wuqB4wmSD0YqoSJmBSbU
         0bwo8WRO87HAOZFp6AMAXCdul64pD0vJCY3kSe7YmpzaAuRqyn8cO3lrcgU0QK+5p8dq
         yu+HXShoGuli6967mT/S5gaek1c5XhHsQIHcmfJLUZ7mwe2P2kX85ze3Cg7WcIP/nIeS
         YorQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RSrAIc7atA252szpipzrSa08TC3jmfuyE2ZsTAy3X6I=;
        b=IPYqfgpC58gr/JTQvTdrrf3LrmibXkPCxC4KIL21yXrphCDltr6Z8h+BZzh6fPhGAA
         kk+x0OSs68a4/FMFOdl0ItGlYvNQJDPR7Wt33IN3RcGMAMrVwaoNwKsl264VArP8AGjc
         VnU78LwMcmr5Hft4wvQ2r8LWPbI8Ndg64FtOmG8KB/zQmAy86f6DZHkLZbjGfWdl75t/
         1y5HVKHIwBc9kxuZJM2q5KIRrp9LYSED4Y6SHUo1+TBvRmSB0J3/dDDfhQfZ8qkAjBl+
         AKTHT4+N1YsMThc/mrLvGwJM24kaOV1kBkbOvI7cc8nk/f2Z4hQXCuSZ2TeXdSPfbFDp
         8EIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=RSrAIc7atA252szpipzrSa08TC3jmfuyE2ZsTAy3X6I=;
        b=EUa0JF99/vDGuAu8nHySi3ErNQkf0x0fPks2IU47ffZ78GumiCGrWXd6xf5B9BOcDK
         cbNL4GKzaHTThoT60iu2hThWF1uovIR/19gEnzuapvUrGPjyr0CW2M/KgsVGCvjG9Fry
         iIu1UpQsE+lbx3AnO1yC64tO6kZwthGz2jPDCr9EP9VgU2XGhFMbhZI2mPLM+6OyJE9C
         d7vv14kRU1hS9SvkKo/o8fMBVejKM+vcpmPZj0IhHf4WOJ+yrlrVAfpm3B5p7WmP6Owq
         3yg2SdFwZ0p4vCfr7L/1JihB39bZR9GtpOKi9/uP0gdO76dl1hE/Csv6A2dh3KPwrPBI
         goNw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530wyT8xAZauasDqBMpX8nKttjujZPWvlHMTCkEA5qLmRlxQMnYs
	V3fxQZf2npfK0ttySn1OV+k=
X-Google-Smtp-Source: ABdhPJynJWXdd+sI2cEdCap89KpSjGIsYUnGaFNXFhbk7Sm0MlzIRSYm+uzHp9zsneXbQeBRcjd2Tw==
X-Received: by 2002:a5d:5006:: with SMTP id e6mr24291818wrt.170.1591615276064;
        Mon, 08 Jun 2020 04:21:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82ce:: with SMTP id 72ls9596857wrc.1.gmail; Mon, 08 Jun
 2020 04:21:15 -0700 (PDT)
X-Received: by 2002:adf:bbc5:: with SMTP id z5mr23370247wrg.269.1591615275372;
        Mon, 08 Jun 2020 04:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591615275; cv=none;
        d=google.com; s=arc-20160816;
        b=xCQf+GqLAdIlJkS7OYloF84/c8RggIAaO7JzpzDmW4Ejgo7htP6DBtbF/v/LNEUYgu
         I8d0GbrFZ8wQ1DZoBVgJ44/D6Lc7iPz1RLZCfM4wagV69o1/S1AgvwbZ87qpvmJPH/52
         6mT/e4VFtfh0t/vE67oMoI/HANMamiYI19gpoSaECLjb7jnhoQvD4aaYBmahYG/vn/8i
         x7J1WyYgtF+hxOJ/vu3cv8qIGAUUVFrsf0euHyagCVJQcKZwDw7u462kXR1Cld56bTDy
         fkc8xKz9Kg1zcp1ngDQ8qcgTGhZ0XKhkb/9ScMI38/omyZqBjmJcV4pD/+M7lRf+MBU2
         TFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=25YefNfUw7DyxPOZ3sQ0aECGdEpvtDysam1NYy29v7U=;
        b=b3k1gCXzzztZeJ/UacgPC8awtfkBQ1+eT7BY2+pXfWx5QQoAgfcPThaP/tXmpcTk+q
         sGxJ/u/FiZ5bJGq8tCR+noshrsd5/LEvKtp6IXZBpmaJdLPGApAQGtciZrRjS/hITMro
         DCF4jANC4rOKwMqkwNEeuVF1xml2y0CxS6DE5WlohOZOnIN5KtBuDePcV3cuIxoiWAAx
         /q7c7mfgo1NSuGfKEAOiiYSo41cmwmAv9ajaTfThLJfsuR/MjKt3idec5Ih8yS0ew1LC
         3+OL2RGoNrvoArrSj0YU5HLjlMUP++X5MHKvbElMu++TAI/j5/oKwyrcko+HavIrXjn6
         Od3Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id f16si987277wrq.5.2020.06.08.04.21.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 04:21:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 058BLDRu006528
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jun 2020 13:21:14 +0200
Received: from [139.22.122.178] ([139.22.122.178])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 058BLELu012402;
	Mon, 8 Jun 2020 13:21:14 +0200
Subject: Re: [PATCH v2 4/9] configs: k3-j721e-evm: Add IVSHMEM demo device
From: Jan Kiszka <jan.kiszka@siemens.com>
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200608104255.18358-1-nikhil.nd@ti.com>
 <20200608104255.18358-5-nikhil.nd@ti.com>
 <d1f2b18a-2891-61c3-d66b-ce0c95575c09@siemens.com>
Message-ID: <7c48aaa9-a5e1-4f1f-8947-a0f297d07354@siemens.com>
Date: Mon, 8 Jun 2020 13:21:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d1f2b18a-2891-61c3-d66b-ce0c95575c09@siemens.com>
Content-Type: text/plain; charset="UTF-8"
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

On 08.06.20 13:16, Jan Kiszka wrote:
> On 08.06.20 12:42, nikhil.nd@ti.com wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> Add a new IVSHMEM PCIe virtual device for a 2 peer
>> IVSHMEM demo communication.
>>  (0 = root cell, 1 = baremetal / linux-demo)
>> Also add the corresponding memory regions for state and output
>> aligned at 64k boundary.
>>
>> Update the bdf numbers for consistency across all platforms.
>> Assign domain = 4 since the platform already has 4 physical
>> controllers.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>  configs/arm64/k3-j721e-evm-linux-demo.c | 52 ++++++++++++++++++++----
>>  configs/arm64/k3-j721e-evm.c            | 53 ++++++++++++++++++++-----
>>  2 files changed, 89 insertions(+), 16 deletions(-)
>>
>> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
>> index cda1614a..05517751 100644
>> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
>> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
>> @@ -24,9 +24,9 @@
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> -	struct jailhouse_memory mem_regions[18];
>> +	struct jailhouse_memory mem_regions[22];
>>  	struct jailhouse_irqchip irqchips[4];
>> -	struct jailhouse_pci_device pci_devices[1];
>> +	struct jailhouse_pci_device pci_devices[2];
>>  	__u32 stream_ids[2];
>>  } __attribute__((packed)) config = {
>>  	.cell = {
>> @@ -56,8 +56,35 @@ struct {
>>  	},
>>  
>>  	.mem_regions = {
>> -		/* IVSHMEM shared memory region for 00:01.0 */
>> -		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 1),
>> +		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
>> +		{
>> +			.phys_start = 0x89fe00000,
>> +			.virt_start = 0x89fe00000,
>> +			.size = 0x10000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> +		},
>> +		{
>> +			.phys_start = 0x89fe10000,
>> +			.virt_start = 0x89fe10000,
>> +			.size = 0x10000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
>> +				 JAILHOUSE_MEM_WRITE ,
>> +		},
>> +		{
>> +			.phys_start = 0x89fe20000,
>> +			.virt_start = 0x89fe20000,
>> +			.size = 0x10000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> +		},
>> +		{
>> +			.phys_start = 0x89fe30000,
>> +			.virt_start = 0x89fe30000,
>> +			.size = 0x10000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
>> +				 JAILHOUSE_MEM_WRITE ,
>> +		},
> 
> You are missing the state table. Was this tested?

Ah, it's there, just 64K large due to the different page size.

> 
> Please derive from existing examples, using the same patterns and sizes.
> Reference is qemu-arm64.

Still, please follow the default pattern (with adjusted page size),
which means triangle by default, 3 peers. That may eventually become
part of an automated test, and then all boards should better have the
same pattern ready.

Jan

> 
> Jan
> 
>> +		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
>> +		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe40000, 1),
>>  		/* ctrl mmr */ {
>>  			.phys_start = 0x00100000,
>>  			.virt_start = 0x00100000,
>> @@ -210,13 +237,24 @@ struct {
>>  	},
>>  
>>  	.pci_devices = {
>> -		/* 00:01.0 */ {
>> +		/* 00:00.0 (demo) */ {
>>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> -			.bdf = 1 << 3,
>> -			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>> +			.domain = 4,
>> +			.bdf = 0 << 3,
>> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
>>  			.shmem_regions_start = 0,
>>  			.shmem_dev_id = 1,
>>  			.shmem_peers = 2,
>> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>> +		},
>> +		/* 00:01.0 (networking) */ {
>> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> +			.domain = 4,
>> +			.bdf = 1 << 3,
>> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
>> +			.shmem_regions_start = 4,
>> +			.shmem_dev_id = 1,
>> +			.shmem_peers = 2,
>>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>>  		},
>>  	},
>> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
>> index 3ac0b57e..41f4c456 100644
>> --- a/configs/arm64/k3-j721e-evm.c
>> +++ b/configs/arm64/k3-j721e-evm.c
>> @@ -19,9 +19,9 @@
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> -	struct jailhouse_memory mem_regions[36];
>> +	struct jailhouse_memory mem_regions[40];
>>  	struct jailhouse_irqchip irqchips[6];
>> -	struct jailhouse_pci_device pci_devices[1];
>> +	struct jailhouse_pci_device pci_devices[2];
>>  	__u32 stream_ids[30];
>>  } __attribute__((packed)) config = {
>>  	.header = {
>> @@ -44,7 +44,7 @@ struct {
>>  			.pci_mmconfig_base = 0x76000000,
>>  			.pci_mmconfig_end_bus = 0,
>>  			.pci_is_virtual = 1,
>> -			.pci_domain = 3,
>> +			.pci_domain = 4,
>>  			.iommu_units= {
>>  				{
>>  					.type = JAILHOUSE_IOMMU_SMMUV3,
>> @@ -97,8 +97,33 @@ struct {
>>  	},
>>  
>>  	.mem_regions = {
>> -		/* IVSHMEM shared memory region for 00:01.0 */
>> -		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 0),
>> +		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
>> +		{
>> +			.phys_start = 0x89fe00000,
>> +			.virt_start = 0x89fe00000,
>> +			.size = 0x10000,
>> +			.flags = JAILHOUSE_MEM_READ,
>> +		},
>> +		{
>> +			.phys_start = 0x89fe10000,
>> +			.virt_start = 0x89fe10000,
>> +			.size = 0x10000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> +		},
>> +		{
>> +			.phys_start = 0x89fe20000,
>> +			.virt_start = 0x89fe20000,
>> +			.size = 0x10000,
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> +		},
>> +		{
>> +			.phys_start = 0x89fe30000,
>> +			.virt_start = 0x89fe30000,
>> +			.size = 0x10000,
>> +			.flags = JAILHOUSE_MEM_READ,
>> +		},
>> +		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
>> +		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe40000, 0),
>>  		/* ctrl mmr */ {
>>  			.phys_start = 0x00100000,
>>  			.virt_start = 0x00100000,
>> @@ -374,14 +399,24 @@ struct {
>>  	},
>>  
>>  	.pci_devices = {
>> -		/* 0003:00:01.0 */ {
>> +		/* 00:00.0 (demo) */ {
>>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> -			.domain = 3,
>> -			.bdf = 1 << 3,
>> -			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>> +			.domain = 4,
>> +			.bdf = 0 << 3,
>> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
>>  			.shmem_regions_start = 0,
>>  			.shmem_dev_id = 0,
>>  			.shmem_peers = 2,
>> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>> +		},
>> +		/* 00:01.0 (networking) */ {
>> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> +			.domain = 4,
>> +			.bdf = 1 << 3,
>> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
>> +			.shmem_regions_start = 4,
>> +			.shmem_dev_id = 0,
>> +			.shmem_peers = 2,
>>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>>  		},
>>  	},
>>
> 


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7c48aaa9-a5e1-4f1f-8947-a0f297d07354%40siemens.com.
