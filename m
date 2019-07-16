Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRU6WXUQKGQE5HRQK4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 029DF6A142
	for <lists+jailhouse-dev@lfdr.de>; Tue, 16 Jul 2019 06:15:04 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id d18sf1557206lfn.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 15 Jul 2019 21:15:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563250503; cv=pass;
        d=google.com; s=arc-20160816;
        b=JDXvGqVhSoSmow72TtVcwDm5Hqu5s7dut306t+yeENVt1gTkGbwUL2S7zPHLEfIbog
         cOkX4ry5tJqQfFl9YsHZhGucetNq5r6BcxY7gOqoi0Yf/vDDGkqJJ81f6wTcNfMiVzKD
         ewxkyL55vHgnAXtASBbNrs7DW4tlBlz4DFFM6GyUErvfPk7X5eXWNFW95aOak6rLPMPm
         +e3lBj2Hfe8zLSfmLDAiSE5yl80LtN1xRjgoHHtTBki31KssGVA2bEw0K665Mh5iM435
         waMMkttMUujVlHfv1pyUiXkBMg6OUj+zkOwhRdyfkvp5OA3DwiY9ukuTpF6mQcWA+GyW
         I6nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=9qb5BsFsWjJSNR0/m4+UgvZX8Ia7994FD8imGiSJbgQ=;
        b=K3jDnet/xOOfpowbf0heufZVjF/7qdkx5jSKlnHfQpSBMVjJ7GzNAPMqyvImk1Ze03
         FKKvDOWuuGy3aovDNY8d7iNLGChk/7M2/AVh0D6Nw0tNOAqRx6HtTJpmrf1rEsfo80MD
         EOBkkw97EnQrvsUnaAdSTSwJKpxtGf0BZcDKQVdi2jgmYyxk1KdBqN6lZ+QyycfbbsTg
         vLXhOG83be0JtM3FbFuMGfhGvkcVVUi65HmVMl66bjJyENIQDWGut4DlRbIjZ2Pe74t1
         VpBHAaZIMnI4HCfbaRNNJ0eD4wAfX12u4VWEbN4gmMiapNhkcl7nCtb1Qc6uDBENAvdn
         BDWA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9qb5BsFsWjJSNR0/m4+UgvZX8Ia7994FD8imGiSJbgQ=;
        b=s4lHrXMdcYw61EqkwXCfCMQT/olt0Oc2GRpjc/OLvyzX45945K/SgLV0hlTW3KS4A1
         15E+cMMA0uMp1g2eM5Y+QgrZ7RqFbES3eIz53X8l2clX8D1A+Yu7Ol8y6DIIAri0zsnm
         TaOyzt8QAtXMqoKzltwFOgLXHObEho2gJOWRNneDtYc/C30qfmi3TBv9TsxmQB9IfJAD
         B6lQiLH2oG7YWGwMfZc4XTR2FGjKS505cQcckhBYi0IoDYD1ptagzSZDC/hJ7iL7VOvt
         DX+N3zEy0Ac1LXmiSp80EslgOaq/F3yHJv3L5+fVOnpPIeu8T9He/gwhzE6DxJWc7Ja5
         LCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=9qb5BsFsWjJSNR0/m4+UgvZX8Ia7994FD8imGiSJbgQ=;
        b=EGrnLCQc3MNgURcirAiZC7wsd/qZ0XqKui+n5sRA/EUToPHFRwm0ejpbjdwaSO+l7e
         MTNOwJ1HYI60tsCk2sH8RvRixTR2kR/IItlKT0ihXRdwfdEWEU/BfSw9b5aQBklkr0dJ
         IWclkqT4+RyVtjAeCt5Tn2bP9s3AnDs0KGDTfjhjyywBVkxtib6xI7d8WIqULsYB++4t
         0be1/9e5CFGMtgIAz41KJP/2pEzavurMhzCkzHGtLRFzkOO/PoIocZr82gpoEtkUZ7ao
         Sn2fLZUpqRgNikfely3AFSZyVJPWeIyN8RdEXSMQZd6CmTD1t8u0naNZrIMiDUSvoCTZ
         0GgQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVejdtiXfpm6ZsvXCL74iI6dMgW1zl8zphZpHLpWzUgJvRk2Pwl
	CJFpbjwV/XmgPYclHq7mA7Y=
X-Google-Smtp-Source: APXvYqxV+OXAXtlWtWW80y7cYaD+o1xM+d/+v26IR9KM+wi28x2A6nafyLKdDaXnUU2nyEIxtIffPw==
X-Received: by 2002:ac2:563c:: with SMTP id b28mr1328509lff.93.1563250503485;
        Mon, 15 Jul 2019 21:15:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:8c0c:: with SMTP id o12ls1495464lfd.12.gmail; Mon, 15
 Jul 2019 21:15:02 -0700 (PDT)
X-Received: by 2002:ac2:4152:: with SMTP id c18mr13781373lfi.144.1563250502411;
        Mon, 15 Jul 2019 21:15:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563250502; cv=none;
        d=google.com; s=arc-20160816;
        b=Bvp5jFlwC7qaQ6DC/GRPl4Kr47W1r6Skylyu2ov00/RgB4L1RpLHeFB4wfw73wDsE4
         w9odLpWFhWhsv5HFrjqdAiDl7qmrBTdsWByl8QoX9E3aUFtdjCFtJAZkVwcS6ekR4Rip
         SyB0vCjXGwr3w6Ku4UGv2cL7E12t1BgLNCEVXz0dK3F8rRMujMsA+4EB0O+iXrN8LDt2
         RvQ7crYpp/iYOLIu9NOPv/tvIDIOB1+dO64H8e3wm5vuT4V2PZdCjqESPPRFNRXTFdYE
         +wXSPcTupe4fXj/4UIFq/6dPF1UZ0gE3Kgoz634iDrF3BbB/eNW0N5q0MxZv3OHVrAYN
         iB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=2pvZ4OTMuKeCrn9l7bqJU+iJm90/ZJ04nBaIeyv222s=;
        b=JF/Jofg4OqBVhOgzw9gVeeKuA0KCyFmnIjGKFoazj0xsY9Fatmi1LmRO8S8/vFJ398
         qYk+jGU7SUnehvf7BsHJLkRwYKlwCMF7ASEQh4yab6hwmMuDo40JLnGFKBw880G/Vkmh
         pu8S3PKu3rVvI5v45W04/59durRiLUMkGP/AUHyK0aNgn/r2U/eI/TAax4lXJZMB9jhS
         a1WKb2srMQ+eivuRc9RiOyqGGut+hi0oNaUEqowpPGoCLpuM/331cF1jzhcMyrU8bogi
         O4ATGpW6YskVsd2Awv3nKniP/LBPcSTLgnr5mZn5tnkXmd9LykbcbilQdEjfkEEno6jB
         IM6g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id f26si991877lfp.5.2019.07.15.21.15.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 21:15:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6G4F1Vo018601
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jul 2019 06:15:01 +0200
Received: from [167.87.233.106] ([167.87.233.106])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6G4EwsR025118;
	Tue, 16 Jul 2019 06:14:59 +0200
Subject: Re: [PATCH v3 1/6] iommu: x86: Generalize iommu definition
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
 <20190709134836.10485-2-p-yadav1@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <31f06f54-776a-142d-3b93-00cb7b74fc41@siemens.com>
Date: Tue, 16 Jul 2019 13:14:57 +0900
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190709134836.10485-2-p-yadav1@ti.com>
Content-Type: text/plain; charset="UTF-8"
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

On 09.07.19 15:48, 'Pratyush Yadav' via Jailhouse wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Right now, jailhouse only supports iommu for x86.
> Generalize the data structures to support iommus of different types
> 
> Assumption is that each jailhouse_system can define iommu
> instances of different types. Extend the jailhouse_iommu
> to add type info.
> 
> Update the x86 config files to reflect updated data the new type field.
> 
> [p-yadav1@ti.com: Add Intel IOMMU and fix compiler errors for AMD and
> VT-D]
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
> ---
> v2:
> - Undo removing iommu_count_units().
> - Remove the union from jailhouse_iommu.
> - Remove the stray blank in amd_iommu.h
> - Revert to using n instead of i in amd_iommu_init().
> - Fail in Intel and AMD when any other type of IOMMU is found.
> - Remove the accidental Intel configuration check.
> - Update cell config template and pyjailhouse
> 
> Jan, please take a close look at the template and pyjailhouse update.
> I'm not sure if I missed something, or did something wrong.
> 
>  configs/x86/f2a88xm-hd3.c       | 1 +
>  configs/x86/qemu-x86.c          | 1 +
>  hypervisor/arch/x86/amd_iommu.c | 9 ++++-----
>  hypervisor/arch/x86/vtd.c       | 2 ++
>  include/jailhouse/cell-config.h | 7 +++++++
>  pyjailhouse/sysfs_parser.py     | 2 ++
>  tools/root-cell-config.c.tmpl   | 1 +
>  7 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
> index 315d0e29..849c5756 100644
> --- a/configs/x86/f2a88xm-hd3.c
> +++ b/configs/x86/f2a88xm-hd3.c
> @@ -50,6 +50,7 @@ struct {
>  				.pm_timer_address = 0x808,
>  				.iommu_units = {
>  					{
> +						.type = JAILHOUSE_IOMMU_AMD,
>  						.base = 0xfeb80000,
>  						.size = 0x80000,
>  						.amd_bdf = 0x02,
> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
> index fdfa8915..2df2807a 100644
> --- a/configs/x86/qemu-x86.c
> +++ b/configs/x86/qemu-x86.c
> @@ -50,6 +50,7 @@ struct {
>  				.vtd_interrupt_limit = 256,
>  				.iommu_units = {
>  					{
> +						.type = JAILHOUSE_IOMMU_INTEL,
>  						.base = 0xfed90000,
>  						.size = 0x1000,
>  					},
> diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/amd_iommu.c
> index 02712571..2fc6d033 100644
> --- a/hypervisor/arch/x86/amd_iommu.c
> +++ b/hypervisor/arch/x86/amd_iommu.c
> @@ -448,7 +448,7 @@ static void amd_iommu_init_fault_nmi(void)
>  		    &system_config->platform_info.x86.iommu_units[iommu->idx];
>  
>  		/* Disable MSI during interrupt reprogramming. */
> -		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2 , 0, 2);
> +		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2, 0, 2);
>  
>  		/*
>  		 * Write new MSI capability block, re-enabling interrupts with
> @@ -782,14 +782,13 @@ static int amd_iommu_init(void)
>  
>  	iommu = &system_config->platform_info.x86.iommu_units[0];
>  	for (n = 0; iommu->base && n < iommu_count_units(); iommu++, n++) {
> +		if (iommu->type != JAILHOUSE_IOMMU_AMD)
> +			return trace_error(-EINVAL);
> +
>  		entry = &iommu_units[iommu_units_count];
>  
>  		entry->idx = n;
>  
> -		/* Protect against accidental VT-d configs. */
> -		if (!iommu->amd_bdf)
> -			return trace_error(-EINVAL);
> -
>  		printk("AMD IOMMU @0x%llx/0x%x\n", iommu->base, iommu->size);
>  
>  		/* Initialize PCI registers and MMIO space */
> diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
> index a43632f5..dc89928f 100644
> --- a/hypervisor/arch/x86/vtd.c
> +++ b/hypervisor/arch/x86/vtd.c
> @@ -1022,6 +1022,8 @@ static int vtd_init(void)
>  
>  	for (n = 0; n < units; n++) {
>  		unit = &system_config->platform_info.x86.iommu_units[n];
> +		if (unit->type != JAILHOUSE_IOMMU_INTEL)
> +			return trace_error(-EINVAL);
>  
>  		reg_base = dmar_reg_base + n * DMAR_MMIO_SIZE;
>  
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 5739f332..781aac88 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -196,9 +196,16 @@ struct jailhouse_pci_capability {
>  
>  #define JAILHOUSE_MAX_IOMMU_UNITS	8
>  
> +enum jailhouse_iommu_type {
> +	JAILHOUSE_IOMMU_AMD,
> +	JAILHOUSE_IOMMU_INTEL,
> +};

I would prefer defines with explicit values for this, like for other types.

> +
>  struct jailhouse_iommu {
> +	__u32 type;
>  	__u64 base;
>  	__u32 size;
> +
>  	__u16 amd_bdf;
>  	__u8 amd_base_cap;
>  	__u8 amd_msi_cap;
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 3db61980..06f68c87 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -243,6 +243,7 @@ def parse_dmar(pcidevices, ioapics, dmar_regions):
>              if size > 0x3000:
>                  raise RuntimeError('Unexpectedly large DMAR region.')
>              units.append(IOMMUConfig({
> +                'type': 'JAILHOUSE_IOMMU_INTEL',
>                  'base_addr': base,
>                  'mmio_size': size
>              }))
> @@ -387,6 +388,7 @@ def parse_ivrs(pcidevices, ioapics):
>                  mmio_size = 16384
>  
>              units.append(IOMMUConfig({
> +                'type': 'JAILHOUSE_IOMMU_AMD',
>                  'base_addr': base_addr,
>                  'mmio_size': mmio_size,
>                  'amd_bdf': iommu_bdf,

This lacks IOMMUConfig initialization:

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 07c7f00e..67dc85d0 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -976,6 +976,7 @@ class IOMemRegionTree:

 class IOMMUConfig:
     def __init__(self, props):
+        self.type = props['type']
         self.base_addr = props['base_addr']
         self.mmio_size = props['mmio_size']
         if 'amd_bdf' in props:

> diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
> index b6ac8637..9f904e9c 100644
> --- a/tools/root-cell-config.c.tmpl
> +++ b/tools/root-cell-config.c.tmpl
> @@ -90,6 +90,7 @@ struct {
>  				.iommu_units = {
>  					% for unit in iommu_units:
>  					{
> +						.type = ${unit.type},
>  						.base = ${hex(unit.base_addr)},
>  						.size = ${hex(unit.mmio_size)},
>  						% if unit.is_amd_iommu:
> 

Rest looks good.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/31f06f54-776a-142d-3b93-00cb7b74fc41%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
