Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBC7I5XUAKGQEXKPOYJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id C829F5D275
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 17:11:07 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id b67sf344934wmd.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 08:11:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562080267; cv=pass;
        d=google.com; s=arc-20160816;
        b=AHCZscPJjePbKY5PeER0SRn2e0exjTJCzrNYPmt4/4oViQkImiplnLEA6z5xHliGK4
         jB4WNJtk9NWhd3sVmTpdQ7sZcqaOPrYUFSzrS214lqGLxFfIdQ1G3IBSiZhL/8SDUANI
         83PESUxWjl5l494gkdJjYaSsTaCGjcPiO4rhJThOmyGzXr4yvjCKbq3aYB/yd8lC8Q9O
         EgAW8uNguEtcWg/sSyok9H5/NQ45RFDar0DIPRCo4XqMT06KYMnuUkubD53+/iCfeQyR
         DCPg56x9bO9/AP38hiwhDc3Wrr+DLtCXEohgI9jwy1S+bMY3yW++FODT5i+GCl/THcJC
         PuNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=ezLqNnRvgYflCLe3S45NMJ66WYebnLgs1zUVPVgawuY=;
        b=s5drK2UFS8//gRcXoMZCzZXbvYGmpxyuJq0PNZ5kbBPUL2l9pZ3RAomazuLDQruV8U
         bTGmbXHdmevaFofWFXqIEilnAF+tVzyHVWQ4tMDSEBpBP6gTgFXKI3teQUPY5OTc8aky
         hBFiTFq8ZtVKCFo9Vx3JQP0IbC3nPhAu+duI05Ax/md+lwNMvKdybx5ipoW9FVw81kAe
         0kQfyklzQVTnltRPWnggZX95oGhKNfXaT2ByTYmlJNN7KBwtVfRdgqIVPFhsUX1gTkJi
         sfSCPr10rkkFG3dOgHgauwAy5t6WDVUk4+sAuoaDREtICCKInyntPGW5EkonchIR8N5h
         Qvkg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ezLqNnRvgYflCLe3S45NMJ66WYebnLgs1zUVPVgawuY=;
        b=k5JjxIWqClcYSvq//p6bIyh15Ci/Ll28sDAzKu29GsOJ828JV5IOW3Wz1Mqixe/vA3
         hm2qhEmvXZRXQ46lQy4X5s25Pt8XguGldQ4pVJEmaG1pLp4KFBcVHnA7OKRYwNpXkXuh
         wsV9HIn91ECI82U928OVeXY8tJe2Ia/g4lOjqcPEg4dQ8dox8oC4hY3HKhzmARHVy8bV
         Pve+3CLiZ9UyOAyZQl9UtDYNqoL8DfestlMd2Fd85Jtga28wsp/gsbJeMWH1QQOvhpx0
         ztMlYpCzmLoGieW7UMqcqGvZxu5OU2YPO/gIciYw460VQSB8aI5EdH1IfuKomXSfvTUa
         /x9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ezLqNnRvgYflCLe3S45NMJ66WYebnLgs1zUVPVgawuY=;
        b=fRfNvl32RhXX5Qj7v/++I5/4+GbvM0x9p5H0YaKaJ/rqfIUDoVdPKOmKeu7dRB5x4M
         vEsCwmdmDcoWYhY7+RhNhIq9Kg1A4zBO6Xrlnwel/UfG11EJgAEv799hanblwVGa5ccD
         EZZ0yfF9/6rEuf7xDNth7sm2J5TCcjCKl2WMLhhwXSt7uDN0NNiPM+5BfwXxnXatl9eJ
         vLlAUChlvU/3h3TaCULrpwXF5Dgbz6r3jE2BVwZ+TLFdlbk+E0On7WJLhTIXu6P9GYbk
         lN79XZpuK1OxehFeEaKxnnDwrJshiD9ePryplDya9BKSey7Cp3A4aKzLZNEAhbVqENpV
         1M2Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWKXATJyrLFGYHMn1gXTWw5AxmH4xuOWdxDMRfwR7n835KDnY4+
	Ag1tMz0teYnVWfMFQzPa/AM=
X-Google-Smtp-Source: APXvYqwmTmjJodmWreExLIl8sfsJ6nLJAQUHNxh+pXDIsjT97hHla5P7XmNhK4ohmiFyeJwm4mCD8w==
X-Received: by 2002:a5d:5702:: with SMTP id a2mr25650049wrv.89.1562080267319;
        Tue, 02 Jul 2019 08:11:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d89:: with SMTP id b9ls3261383wru.0.gmail; Tue, 02 Jul
 2019 08:11:06 -0700 (PDT)
X-Received: by 2002:adf:fe4e:: with SMTP id m14mr25881809wrs.21.1562080266758;
        Tue, 02 Jul 2019 08:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562080266; cv=none;
        d=google.com; s=arc-20160816;
        b=pNVIM4N2B29neSBFGQnnOYlLZ+XvQZoaVOhhr7y4NrrwMmihF6zuSIQYfoFIgg8d9Q
         kxl3DZ4g2uzXil1JGWNHTK04sODbBSGsDso7S3ebSiBzBtK7twOVOrOX+6cS2hzErArT
         NoLLHuQXFgGeMNX3BWUy+5M8y0iFK0KQMX3rA+Hyt6IeyYLiEMsoJUSbtt9VE4Qrm6Uw
         MB/WnMJly0zy0GnxegmGSY7lzIT/QFPTkOnuaVa7MyvGIre6/V+S1+5rT4yjeuAtBsg3
         6qcIbV9zFeQ6/XwVNbJuwmctF3+vD8EIEU1uUU4XlCBLhNCzcHHW+H05y7M8LD6/Ub4E
         o0Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=v60N5UDxvXWJbQdgrgF9pvncS+8KBxwGdJX3WlXBzco=;
        b=fTmLSp4dJRVrYL0XFA1a3+9WF0Ddgvj47VNJWMowMQprnPaMj7cZqkDsKD0ZYRLeZ6
         z4kQa8mWYtKTb7vBuoS7OZdpQVi+lXvPGEZElBhG6PGSBCshZF8xcO9cIPVaJ25BCIDS
         ScNscz6s7DP56stpYkQQf24+CEY1vUi9SE2t9F4Twq9YsSPvTnqlm/X7q7+MLDsKRNiH
         0ZGzS2Vwdv6LTnufSlNxBuK1IgWFmIejEN3Q0HjZKvqONizmmZeaaP4zN+djXkhCLE2S
         yIDDG0mlOqIQkKBvz+dSczCAgtSkEjkN4xbqbGp3ApVa/9+hB5BIVdivQnEssxKfgod/
         umFA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id a1si151567wmb.2.2019.07.02.08.11.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 08:11:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x62FB6JH024809
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jul 2019 17:11:06 +0200
Received: from [139.23.114.160] ([139.23.114.160])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x62FB6oD021480;
	Tue, 2 Jul 2019 17:11:06 +0200
Subject: Re: [PATCH 1/6] iommu: x86: Generalize iommu definition
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
 <20190702143607.16525-2-p-yadav1@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <43fa7815-96ee-a91e-c8b3-9e23f146f502@siemens.com>
Date: Tue, 2 Jul 2019 17:11:05 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190702143607.16525-2-p-yadav1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 02.07.19 16:36, Pratyush Yadav wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Right now, jailhouse only supports iommu for x86.
> Generalize the data structures to support iommus of different types
> 
> Assumption is that each jailhouse_system can define iommu
> instances of different types. Extend the jailhouse_iommu
> to add type info and add a type specific struct
> 
> Move the AMD specific details in the jailhouse_iommu_amd and Intel
> specific details in jailhouse_iommu_intel and update the code
> accordingly.
> Update the x86 config files which to reflect updated data
> structure and define the new type field.
> No code changes, just replace iommu->xyz with iommu->amd.xyz or
> iommu->intel.xyz
> 
> Also get rid of the iommu_count_units and implement
> simple logic to process iommus of the desired type.

This will require more resources, though it may safe some LoC. In any case, it 
should be a separate topic with some more detailed reasoning.

> 
> [p-yadav1@ti.com: Add Intel IOMMU and fix compiler errors for AMD and
> VT-D]
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
> ---
>   configs/x86/f2a88xm-hd3.c               | 13 ++++---
>   configs/x86/qemu-x86.c                  |  5 ++-
>   hypervisor/arch/x86/amd_iommu.c         | 52 +++++++++++++------------
>   hypervisor/arch/x86/include/asm/iommu.h |  2 -
>   hypervisor/arch/x86/iommu.c             | 10 -----
>   hypervisor/arch/x86/vtd.c               | 17 ++++----
>   include/jailhouse/cell-config.h         | 28 ++++++++++---
>   7 files changed, 70 insertions(+), 57 deletions(-)

Looks like this does not update the config generator and the related config 
template, see tools/root-cell-config.c.tmpl and pyjailhouse/.

> 
> diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
> index 315d0e29..026f974a 100644
> --- a/configs/x86/f2a88xm-hd3.c
> +++ b/configs/x86/f2a88xm-hd3.c
> @@ -50,12 +50,13 @@ struct {
>   				.pm_timer_address = 0x808,
>   				.iommu_units = {
>   					{
> -						.base = 0xfeb80000,
> -						.size = 0x80000,
> -						.amd_bdf = 0x02,
> -						.amd_base_cap = 0x40,
> -						.amd_msi_cap = 0x54,
> -						.amd_features = 0x80048824,
> +						.type = JAILHOUSE_IOMMU_AMD,
> +						.amd.base = 0xfeb80000,
> +						.amd.size = 0x80000,
> +						.amd.bdf = 0x02,
> +						.amd.base_cap = 0x40,
> +						.amd.msi_cap = 0x54,
> +						.amd.features = 0x80048824,
>   					},
>   				},
>   			},
> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
> index fdfa8915..549deed9 100644
> --- a/configs/x86/qemu-x86.c
> +++ b/configs/x86/qemu-x86.c
> @@ -50,8 +50,9 @@ struct {
>   				.vtd_interrupt_limit = 256,
>   				.iommu_units = {
>   					{
> -						.base = 0xfed90000,
> -						.size = 0x1000,
> +						.type = JAILHOUSE_IOMMU_INTEL,
> +						.intel.base = 0xfed90000,
> +						.intel.size = 0x1000,
>   					},
>   				},
>   			},
> diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/amd_iommu.c
> index 02712571..999590cd 100644
> --- a/hypervisor/arch/x86/amd_iommu.c
> +++ b/hypervisor/arch/x86/amd_iommu.c
> @@ -448,14 +448,14 @@ static void amd_iommu_init_fault_nmi(void)
>   		    &system_config->platform_info.x86.iommu_units[iommu->idx];
>   
>   		/* Disable MSI during interrupt reprogramming. */
> -		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2 , 0, 2);
> +		pci_write_config(cfg->amd.bdf, cfg->amd.msi_cap + 2 , 0, 2);

A chance to get rid of the stray blank "...cap + 2, 0, 2);"

>   
>   		/*
>   		 * Write new MSI capability block, re-enabling interrupts with
>   		 * the last word.
>   		 */
>   		for (n = 3; n >= 0; n--)
> -			pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 4 * n,
> +			pci_write_config(cfg->amd.bdf, cfg->amd.msi_cap + 4 * n,
>   					 msi_reg.raw[n], 4);
>   	}
>   
> @@ -633,37 +633,37 @@ static int amd_iommu_init_pci(struct amd_iommu *entry,
>   	u64 caps_header, hi, lo;
>   
>   	/* Check alignment */
> -	if (iommu->size & (iommu->size - 1))
> +	if (iommu->amd.size & (iommu->amd.size - 1))
>   		return trace_error(-EINVAL);
>   
>   	/* Check that EFR is supported */
> -	caps_header = pci_read_config(iommu->amd_bdf, iommu->amd_base_cap, 4);
> +	caps_header = pci_read_config(iommu->amd.bdf, iommu->amd.base_cap, 4);
>   	if (!(caps_header & CAPS_IOMMU_EFR_SUP))
>   		return trace_error(-EIO);
>   
> -	lo = pci_read_config(iommu->amd_bdf,
> -			     iommu->amd_base_cap + CAPS_IOMMU_BASE_LOW_REG, 4);
> -	hi = pci_read_config(iommu->amd_bdf,
> -			     iommu->amd_base_cap + CAPS_IOMMU_BASE_HI_REG, 4);
> +	lo = pci_read_config(iommu->amd.bdf,
> +			     iommu->amd.base_cap + CAPS_IOMMU_BASE_LOW_REG, 4);
> +	hi = pci_read_config(iommu->amd.bdf,
> +			     iommu->amd.base_cap + CAPS_IOMMU_BASE_HI_REG, 4);
>   
>   	if (lo & CAPS_IOMMU_ENABLE &&
> -	    ((hi << 32) | lo) != (iommu->base | CAPS_IOMMU_ENABLE)) {
> +	    ((hi << 32) | lo) != (iommu->amd.base | CAPS_IOMMU_ENABLE)) {
>   		printk("FATAL: IOMMU %d config is locked in invalid state.\n",
>   		       entry->idx);
>   		return trace_error(-EPERM);
>   	}
>   
>   	/* Should be configured by BIOS, but we want to be sure */
> -	pci_write_config(iommu->amd_bdf,
> -			 iommu->amd_base_cap + CAPS_IOMMU_BASE_HI_REG,
> -			 (u32)(iommu->base >> 32), 4);
> -	pci_write_config(iommu->amd_bdf,
> -			 iommu->amd_base_cap + CAPS_IOMMU_BASE_LOW_REG,
> -			 (u32)(iommu->base & 0xffffffff) | CAPS_IOMMU_ENABLE,
> +	pci_write_config(iommu->amd.bdf,
> +			 iommu->amd.base_cap + CAPS_IOMMU_BASE_HI_REG,
> +			 (u32)(iommu->amd.base >> 32), 4);
> +	pci_write_config(iommu->amd.bdf,
> +			 iommu->amd.base_cap + CAPS_IOMMU_BASE_LOW_REG,
> +			 (u32)(iommu->amd.base & 0xffffffff) | CAPS_IOMMU_ENABLE,
>   			 4);
>   
>   	/* Allocate and map MMIO space */
> -	entry->mmio_base = paging_map_device(iommu->base, iommu->size);
> +	entry->mmio_base = paging_map_device(iommu->amd.base, iommu->amd.size);
>   	if (!entry->mmio_base)
>   		return -ENOMEM;
>   
> @@ -687,9 +687,9 @@ static int amd_iommu_init_features(struct amd_iommu *entry,
>   		return trace_error(-EIO);
>   
>   	/* Figure out if hardware events are supported. */
> -	if (iommu->amd_features)
> +	if (iommu->amd.features)
>   		entry->he_supported =
> -			iommu->amd_features & ACPI_REPORTING_HE_SUP;
> +			iommu->amd.features & ACPI_REPORTING_HE_SUP;
>   	else
>   		entry->he_supported = efr & AMD_EXT_FEAT_HE_SUP;
>   
> @@ -777,20 +777,24 @@ static int amd_iommu_init(void)
>   {
>   	struct jailhouse_iommu *iommu;
>   	struct amd_iommu *entry;
> -	unsigned int n;
> +	unsigned int i;

Why? "i" like "integer" i.e. signed. "n" because it's unsigned.

>   	int err;
>   
> -	iommu = &system_config->platform_info.x86.iommu_units[0];
> -	for (n = 0; iommu->base && n < iommu_count_units(); iommu++, n++) {
> +	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; i++) {
> +
> +		iommu = &system_config->platform_info.x86.iommu_units[i];
> +		if (iommu->type != JAILHOUSE_IOMMU_AMD)
> +			continue;

return trace_error(-EINVAL);

> +
>   		entry = &iommu_units[iommu_units_count];
>   
> -		entry->idx = n;
> +		entry->idx = i;
>   
>   		/* Protect against accidental VT-d configs. */
> -		if (!iommu->amd_bdf)
> +		if (!iommu->amd.bdf)
>   			return trace_error(-EINVAL);

Can be removed when you have the type check above.

>   
> -		printk("AMD IOMMU @0x%llx/0x%x\n", iommu->base, iommu->size);
> +		printk("AMD IOMMU @0x%llx/0x%x\n", iommu->amd.base, iommu->amd.size);
>   
>   		/* Initialize PCI registers and MMIO space */
>   		err = amd_iommu_init_pci(entry, iommu);
> diff --git a/hypervisor/arch/x86/include/asm/iommu.h b/hypervisor/arch/x86/include/asm/iommu.h
> index 848feb77..92051673 100644
> --- a/hypervisor/arch/x86/include/asm/iommu.h
> +++ b/hypervisor/arch/x86/include/asm/iommu.h
> @@ -23,8 +23,6 @@
>   
>   extern unsigned int fault_reporting_cpu_id;
>   
> -unsigned int iommu_count_units(void);
> -
>   int iommu_map_memory_region(struct cell *cell,
>   			    const struct jailhouse_memory *mem);
>   int iommu_unmap_memory_region(struct cell *cell,
> diff --git a/hypervisor/arch/x86/iommu.c b/hypervisor/arch/x86/iommu.c
> index 68ca323f..aeaf21e5 100644
> --- a/hypervisor/arch/x86/iommu.c
> +++ b/hypervisor/arch/x86/iommu.c
> @@ -15,16 +15,6 @@
>   
>   unsigned int fault_reporting_cpu_id;
>   
> -unsigned int iommu_count_units(void)
> -{
> -	unsigned int units = 0;
> -
> -	while (units < JAILHOUSE_MAX_IOMMU_UNITS &&
> -	       system_config->platform_info.x86.iommu_units[units].base)
> -		units++;
> -	return units;
> -}
> -
>   struct public_per_cpu *iommu_select_fault_reporting_cpu(void)
>   {
>   	struct public_per_cpu *target_data;
> diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
> index a43632f5..1e817b36 100644
> --- a/hypervisor/arch/x86/vtd.c
> +++ b/hypervisor/arch/x86/vtd.c
> @@ -207,7 +207,7 @@ static bool dmar_units_initialized;
>   
>   static unsigned int vtd_mmio_count_regions(struct cell *cell)
>   {
> -	return cell == &root_cell ? iommu_count_units() : 0;
> +	return cell == &root_cell ? JAILHOUSE_MAX_IOMMU_UNITS : 0;

Probably fine, at least as long as JAILHOUSE_MAX_IOMMU_UNITS is just 8.

>   }
>   
>   static unsigned int inv_queue_write(void *inv_queue, unsigned int index,
> @@ -959,7 +959,7 @@ static int vtd_init_ir_emulation(unsigned int unit_no, void *reg_base)
>   
>   	root_cell.arch.vtd.ir_emulation = true;
>   
> -	base = system_config->platform_info.x86.iommu_units[unit_no].base;
> +	base = system_config->platform_info.x86.iommu_units[unit_no].intel.base;
>   	mmio_region_register(&root_cell, base, PAGE_SIZE,
>   			     vtd_unit_access_handler, unit);
>   
> @@ -1008,9 +1008,7 @@ static int vtd_init(void)
>   
>   	int_remap_table_size_log2 = n;
>   
> -	units = iommu_count_units();
> -	if (units == 0)
> -		return trace_error(-EINVAL);

Where does this check go? Well, it will probably be better placed in an offline 
"jailhouse config check" script... OK, fine with me.

> +	units = JAILHOUSE_MAX_IOMMU_UNITS;

This is wrong now: This is not just an upper limit, we also set dmar_units to 
this. You will have to update the code accordingly. And I don't think we need 
"units" anymore then.

>   
>   	dmar_reg_base = page_alloc(&remap_pool, units * PAGES(DMAR_MMIO_SIZE));
>   	if (!dmar_reg_base)
> @@ -1022,11 +1020,13 @@ static int vtd_init(void)
>   
>   	for (n = 0; n < units; n++) {
>   		unit = &system_config->platform_info.x86.iommu_units[n];
> +		if (unit->type != JAILHOUSE_IOMMU_INTEL)
> +			continue;

That would actually be a bug, and we should fail, analogously to AMD.

>   
>   		reg_base = dmar_reg_base + n * DMAR_MMIO_SIZE;
>   
> -		err = paging_create(&hv_paging_structs, unit->base, unit->size,
> -				    (unsigned long)reg_base,
> +		err = paging_create(&hv_paging_structs, unit->intel.base,
> +				    unit->intel.size, (unsigned long)reg_base,
>   				    PAGE_DEFAULT_FLAGS | PAGE_FLAG_DEVICE,
>   				    PAGING_NON_COHERENT);
>   		if (err)
> @@ -1036,7 +1036,8 @@ static int vtd_init(void)
>   		if (version < VTD_VER_MIN || version == 0xff)
>   			return trace_error(-EIO);
>   
> -		printk("DMAR unit @0x%llx/0x%x\n", unit->base, unit->size);
> +		printk("DMAR unit @0x%llx/0x%x\n", unit->intel.base,
> +			unit->intel.size);
>   
>   		caps = mmio_read64(reg_base + VTD_CAP_REG);
>   		if (caps & VTD_CAP_SAGAW39)
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 5739f332..f492e409 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -196,13 +196,31 @@ struct jailhouse_pci_capability {
>   
>   #define JAILHOUSE_MAX_IOMMU_UNITS	8
>   
> -struct jailhouse_iommu {
> +enum jailhouse_iommu_type {
> +	JAILHOUSE_IOMMU_AMD,
> +	JAILHOUSE_IOMMU_INTEL,
> +};
> +
> +struct jailhouse_iommu_amd {
> +	__u64 base;
> +	__u32 size;

Look like base and size remain common fields, for all IOMMU types. Why making 
them specific then?

> +	__u16 bdf;
> +	__u8 base_cap;
> +	__u8 msi_cap;
> +	__u32 features;
> +};
> +
> +struct jailhouse_iommu_intel {
>   	__u64 base;
>   	__u32 size;
> -	__u16 amd_bdf;
> -	__u8 amd_base_cap;
> -	__u8 amd_msi_cap;
> -	__u32 amd_features;
> +};
> +
> +struct jailhouse_iommu {
> +	__u32 type;
> +	union {
> +		struct jailhouse_iommu_amd amd;
> +		struct jailhouse_iommu_intel intel;
> +	};
>   } __attribute__((packed));
>   
>   #define JAILHOUSE_SYSTEM_SIGNATURE	"JHSYST"
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/43fa7815-96ee-a91e-c8b3-9e23f146f502%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
