Return-Path: <jailhouse-dev+bncBCB7D7MXMMIORDWW5ECRUBH3R7Q2O@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3b.google.com (mail-vk1-xa3b.google.com [IPv6:2607:f8b0:4864:20::a3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 735836FD0B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 11:52:41 +0200 (CEST)
Received: by mail-vk1-xa3b.google.com with SMTP id p193sf17797510vkd.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 02:52:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563789160; cv=pass;
        d=google.com; s=arc-20160816;
        b=gqcGJzIyFyQcAEbymlR8+SzEUakBxvdjZ9jiavhkZii2mwMiF97OLI1/4BFFBMCPoq
         3+I1iUv8gGg9Clnx4X6haljMcAlNl/P5abm4xJIJ30nCBpONy7VGidmH4WNfhEVOcTjv
         QN6bPD+2FlCD+7PGJt/WYTEwROgFvqygnBdaz9CmP4Oc6tXgqywUgbW7gdW24toaWOOm
         mXOREJo8Hs8he+3WGjJZrYWcNzMraZxAIHiOgqmafRazeSYzIcxgsdFOUyyLKE35sSn5
         CaEZ6cTX529qF06YRRPZt3s2UjDHpBJYv03Zz4sVVk2Hu+lrjks8oFo0OeHgEEbyGo8l
         tMTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=YnEh2qxb3D6soVjAIIMcoQqtGwbDyJTbx9UxhFYmnDw=;
        b=yyU9BIaAKluFLFoVG218WLQngFPOUXcczCRthKxjOaLxyjcrRBncms9D91a19gh9IT
         z6d96JyJwzd+EDY62Lc5c07Qics8simtlCtLMOSYkELvawyIbNAlZDc4c0ws5IvQmQUO
         pdibYLKWfRpf6Jme07B7h9cE6QDPGsisr72U0yJevsDiGgb8+dJ5ehGpQnJsY0BbpCVy
         QJO/kv6cnq/i/sLyD/s5mIKMpce/TPK8ekgUWP72IL9sPfvuyyeeUqgKOukGSPHQw9Eg
         uHjg6yEZmHgCjKosJUx9GVhDXv2b33KLwlzk7fXBkEFSynHyEG5IzHSto2KTxxXFhdIW
         xsDw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eAJFHQi1;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=YnEh2qxb3D6soVjAIIMcoQqtGwbDyJTbx9UxhFYmnDw=;
        b=lk0Rwus21a9S/paGHwcj7mcDNyO+SKsrHDaXA+kIm6f58eNsNyZRO0UIjqxQLPz7yv
         yD8K4n/NQF2ggMrTb9s2TMVvwU8/qJxF4b7OTOaOFwC3LXtRPyLstvMDcIEHqZemG8Te
         cf7doXyVw4q8hDfpAXWhixMxWWZo47PmR9MCq0KNRwoTL/iZUPVKynjQgEg1YxEjgMbt
         OaD8XTlLU0Fv/JrYy32hbtwse5oZainRfrHx3j43bSWIqyKliEV/AoPi3qVx43KAlk4b
         wB8Hyza8P+IhXN/g0gsAUhTV/zjnVdF8vWDqSy3jEbhp5EATYlM5uAC/bOdkNYbp8g8Q
         wovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YnEh2qxb3D6soVjAIIMcoQqtGwbDyJTbx9UxhFYmnDw=;
        b=m4d/y3XX1AIJ8TGOoTjze0u9kP9gjFTS7j2EixKAP3ul9PC9mZK2TDnYYbuf8OmuM1
         CdabBa8QIEwFkmdHWTo/3h1Mk0gABxf7VyMRiDnZjKqTjBc8v13rCnFebMtAcg1F/X6m
         wd180c/KtuLkoCQ8ZtwcJCdYV8WbgYmxCPdmcpNe/7El3y/x9gjRZ1xY+sE7FM7e/5/a
         Y2NI/7KxVuSwq7VcDHEwEWEQM7O9Wf9KZlMyKJqEjqP9jGQaQZrV8TYjyCEGUEImng1v
         reqAfcrVWIaAv3Ns4WAxM3aqnZdQe3aPg1PXLsR3FgDGUYtE7NozONrKeQISRUB1QyXq
         zQqQ==
X-Gm-Message-State: APjAAAUOHQB3uyfci0yYqJPv1LRT2jOpGbhjOX0WFMU94wkE1DUeKjfm
	7ssIUBFB0RF2gaqF3ET2rlI=
X-Google-Smtp-Source: APXvYqzvQcnGI8MzaIjH2hjsBhWizTEjKbcZY78QbfCQnZEbVLAz2MTw6Tj6n2ZGBr+DrDyMyfXHNw==
X-Received: by 2002:a67:c994:: with SMTP id y20mr41839660vsk.231.1563789160413;
        Mon, 22 Jul 2019 02:52:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1f:9dc9:: with SMTP id g192ls1232419vke.1.gmail; Mon, 22
 Jul 2019 02:52:39 -0700 (PDT)
X-Received: by 2002:a1f:5c17:: with SMTP id q23mr25159677vkb.25.1563789159789;
        Mon, 22 Jul 2019 02:52:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563789159; cv=none;
        d=google.com; s=arc-20160816;
        b=Hc8VMts6DnnC82W3Gce+LLIE5h3xIv7TXQwabUSCWMRrpzISEzZBmSSSDdtSpwEuWa
         +snvfTno4shPN4tl8Oc5cznWdMeuvHvi7F7wqTmN2j2mBLnhm+w5cBKHWjHgT0JnFhHc
         SSEjOJ2FUFBcM6UR2EVowf/HN8IP0rVX0BE+ZBDMQykODx3LWlcbf1if9muasHBvGNwj
         i2AJy/QuQMQOE0a4Dw/eM8LY9uNLx6uufyvU7/WGOvLkT6wNXIadiAEd/v4vydO/LaJD
         ePrCDxHQBP+78zLM1qgYhnHYokIt2iHpCnilbWkvWmYTqVNbM5gIcSm5p7iF/XXwByZU
         fYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=nXfDTSKGl/dQqqbPwVnSCBIaN2wgI+nuJvrHXfpkrB8=;
        b=JyS5skHQap8C5jXQRfsKt0cVbpWtLf5rtPHI+6I9sW3C9E5r1UyLlF1NRSYzeyG0mv
         VSar5Wh990GLZ9Rp8kdQ7osW57/x96EUkdsBa7OX9jMS6AGLZviUwispOVAemQZuhpES
         egm9/Xb6acabdd9+lfVbnn41uuFNfjHCkB4WvYeHyTsKsXNZYjSxYpRbwRNLBHsGCyqY
         nZzm3qWNjJGa6Ib5pZzBVjQVCerVpoTWIx8bM3j0GeXTYAzVyLzLmW2fCxSmlb7REJpT
         93dsCCZ6dLGrKsSwiEJJK6ujtosx2ZFxsB1KR5dks8uj80jqiRzNRO88D9OWP7zN50zb
         QW7g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eAJFHQi1;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id i9si2478465vsj.0.2019.07.22.02.52.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 02:52:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6M9qdu9034701;
	Mon, 22 Jul 2019 04:52:39 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6M9qdWI039186
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 Jul 2019 04:52:39 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 22
 Jul 2019 04:52:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 22 Jul 2019 04:52:38 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6M9qa2u002802;
	Mon, 22 Jul 2019 04:52:37 -0500
Subject: Re: [PATCH v3 1/6] iommu: x86: Generalize iommu definition
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Sekhar Nori <nsekhar@ti.com>, William Mills <wmills@ti.com>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
 <20190709134836.10485-2-p-yadav1@ti.com>
 <31f06f54-776a-142d-3b93-00cb7b74fc41@siemens.com>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <6638fe02-e784-3731-592e-05e32bc69e32@ti.com>
Date: Mon, 22 Jul 2019 15:21:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <31f06f54-776a-142d-3b93-00cb7b74fc41@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=eAJFHQi1;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as
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



On 16/07/19 9:44 AM, Jan Kiszka wrote:
> On 09.07.19 15:48, 'Pratyush Yadav' via Jailhouse wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> Right now, jailhouse only supports iommu for x86.
>> Generalize the data structures to support iommus of different types
>>
>> Assumption is that each jailhouse_system can define iommu
>> instances of different types. Extend the jailhouse_iommu
>> to add type info.
>>
>> Update the x86 config files to reflect updated data the new type field.
>>
>> [p-yadav1@ti.com: Add Intel IOMMU and fix compiler errors for AMD and
>> VT-D]
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
>> ---
>> v2:
>> - Undo removing iommu_count_units().
>> - Remove the union from jailhouse_iommu.
>> - Remove the stray blank in amd_iommu.h
>> - Revert to using n instead of i in amd_iommu_init().
>> - Fail in Intel and AMD when any other type of IOMMU is found.
>> - Remove the accidental Intel configuration check.
>> - Update cell config template and pyjailhouse
>>
>> Jan, please take a close look at the template and pyjailhouse update.
>> I'm not sure if I missed something, or did something wrong.
>>
>>  configs/x86/f2a88xm-hd3.c       | 1 +
>>  configs/x86/qemu-x86.c          | 1 +
>>  hypervisor/arch/x86/amd_iommu.c | 9 ++++-----
>>  hypervisor/arch/x86/vtd.c       | 2 ++
>>  include/jailhouse/cell-config.h | 7 +++++++
>>  pyjailhouse/sysfs_parser.py     | 2 ++
>>  tools/root-cell-config.c.tmpl   | 1 +
>>  7 files changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
>> index 315d0e29..849c5756 100644
>> --- a/configs/x86/f2a88xm-hd3.c
>> +++ b/configs/x86/f2a88xm-hd3.c
>> @@ -50,6 +50,7 @@ struct {
>>  				.pm_timer_address = 0x808,
>>  				.iommu_units = {
>>  					{
>> +						.type = JAILHOUSE_IOMMU_AMD,
>>  						.base = 0xfeb80000,
>>  						.size = 0x80000,
>>  						.amd_bdf = 0x02,
>> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
>> index fdfa8915..2df2807a 100644
>> --- a/configs/x86/qemu-x86.c
>> +++ b/configs/x86/qemu-x86.c
>> @@ -50,6 +50,7 @@ struct {
>>  				.vtd_interrupt_limit = 256,
>>  				.iommu_units = {
>>  					{
>> +						.type = JAILHOUSE_IOMMU_INTEL,
>>  						.base = 0xfed90000,
>>  						.size = 0x1000,
>>  					},
>> diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/amd_iommu.c
>> index 02712571..2fc6d033 100644
>> --- a/hypervisor/arch/x86/amd_iommu.c
>> +++ b/hypervisor/arch/x86/amd_iommu.c
>> @@ -448,7 +448,7 @@ static void amd_iommu_init_fault_nmi(void)
>>  		    &system_config->platform_info.x86.iommu_units[iommu->idx];
>>  
>>  		/* Disable MSI during interrupt reprogramming. */
>> -		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2 , 0, 2);
>> +		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2, 0, 2);
>>  
>>  		/*
>>  		 * Write new MSI capability block, re-enabling interrupts with
>> @@ -782,14 +782,13 @@ static int amd_iommu_init(void)
>>  
>>  	iommu = &system_config->platform_info.x86.iommu_units[0];
>>  	for (n = 0; iommu->base && n < iommu_count_units(); iommu++, n++) {
>> +		if (iommu->type != JAILHOUSE_IOMMU_AMD)
>> +			return trace_error(-EINVAL);
>> +
>>  		entry = &iommu_units[iommu_units_count];
>>  
>>  		entry->idx = n;
>>  
>> -		/* Protect against accidental VT-d configs. */
>> -		if (!iommu->amd_bdf)
>> -			return trace_error(-EINVAL);
>> -
>>  		printk("AMD IOMMU @0x%llx/0x%x\n", iommu->base, iommu->size);
>>  
>>  		/* Initialize PCI registers and MMIO space */
>> diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
>> index a43632f5..dc89928f 100644
>> --- a/hypervisor/arch/x86/vtd.c
>> +++ b/hypervisor/arch/x86/vtd.c
>> @@ -1022,6 +1022,8 @@ static int vtd_init(void)
>>  
>>  	for (n = 0; n < units; n++) {
>>  		unit = &system_config->platform_info.x86.iommu_units[n];
>> +		if (unit->type != JAILHOUSE_IOMMU_INTEL)
>> +			return trace_error(-EINVAL);
>>  
>>  		reg_base = dmar_reg_base + n * DMAR_MMIO_SIZE;
>>  
>> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
>> index 5739f332..781aac88 100644
>> --- a/include/jailhouse/cell-config.h
>> +++ b/include/jailhouse/cell-config.h
>> @@ -196,9 +196,16 @@ struct jailhouse_pci_capability {
>>  
>>  #define JAILHOUSE_MAX_IOMMU_UNITS	8
>>  
>> +enum jailhouse_iommu_type {
>> +	JAILHOUSE_IOMMU_AMD,
>> +	JAILHOUSE_IOMMU_INTEL,
>> +};
> 
> I would prefer defines with explicit values for this, like for other types.
> 
>> +
>>  struct jailhouse_iommu {
>> +	__u32 type;
>>  	__u64 base;
>>  	__u32 size;
>> +
>>  	__u16 amd_bdf;
>>  	__u8 amd_base_cap;
>>  	__u8 amd_msi_cap;
>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>> index 3db61980..06f68c87 100644
>> --- a/pyjailhouse/sysfs_parser.py
>> +++ b/pyjailhouse/sysfs_parser.py
>> @@ -243,6 +243,7 @@ def parse_dmar(pcidevices, ioapics, dmar_regions):
>>              if size > 0x3000:
>>                  raise RuntimeError('Unexpectedly large DMAR region.')
>>              units.append(IOMMUConfig({
>> +                'type': 'JAILHOUSE_IOMMU_INTEL',
>>                  'base_addr': base,
>>                  'mmio_size': size
>>              }))
>> @@ -387,6 +388,7 @@ def parse_ivrs(pcidevices, ioapics):
>>                  mmio_size = 16384
>>  
>>              units.append(IOMMUConfig({
>> +                'type': 'JAILHOUSE_IOMMU_AMD',
>>                  'base_addr': base_addr,
>>                  'mmio_size': mmio_size,
>>                  'amd_bdf': iommu_bdf,
> 
> This lacks IOMMUConfig initialization:
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 07c7f00e..67dc85d0 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -976,6 +976,7 @@ class IOMemRegionTree:
> 
>  class IOMMUConfig:
>      def __init__(self, props):
> +        self.type = props['type']
>          self.base_addr = props['base_addr']
>          self.mmio_size = props['mmio_size']
>          if 'amd_bdf' in props:
> 
>> diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
>> index b6ac8637..9f904e9c 100644
>> --- a/tools/root-cell-config.c.tmpl
>> +++ b/tools/root-cell-config.c.tmpl
>> @@ -90,6 +90,7 @@ struct {
>>  				.iommu_units = {
>>  					% for unit in iommu_units:
>>  					{
>> +						.type = ${unit.type},
>>  						.base = ${hex(unit.base_addr)},
>>  						.size = ${hex(unit.mmio_size)},
>>  						% if unit.is_amd_iommu:
>>
> 
> Rest looks good.

Sure, will fix the above comments in next version.

Thanks and regards,
Lokesh

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6638fe02-e784-3731-592e-05e32bc69e32%40ti.com.
