Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBT64UDVAKGQEZTSINEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D15D81C97
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2019 15:25:36 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id p13sf40722048wru.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Aug 2019 06:25:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565011536; cv=pass;
        d=google.com; s=arc-20160816;
        b=txOX8REiDnFtgpzWa+SidAI44+VvBcXB3i5l7f8iInyen8pg4ajlqLEYZZ4UipKTYm
         ur2BM6n8y2umOU767evB11uQ7fGQfn4eTFBBAo2XXqtZh+LPsnj+cJG+hIv1WBNeaBBL
         yth8wV3AaH8QN7t20wgzr0irdZhbXJmqcXnWoS2LTKzFpuBSa/XMebQ+n5JhhvBPKm8W
         IU/6kn+mCl0zpQWo58kKhyGP4KufLlSvngqmFWPnqPTTNIAkZIMEj4NQeMKysxRBxgYi
         JPlRkQmiPP0smdyRgeG3iVUON6e/ZaknPIEez9lXalXzTpX8ww1gQsaBp3odIRtlYJ3H
         eEpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:cc
         :to:subject:sender:dkim-signature;
        bh=sSvyz4o1xWOPWS+qOhTsWqTNGM0bywju8WOFWQR4ELE=;
        b=B14FAbv73SxOPxZ/ffvdiN/pOx+E7f1tHVbEQRt/+SxUnN+LBMg1Y8vEjaWf14/Wwj
         97mzYnYuvdN6TC/06Ti9tffb1TfwY154Prltg3jvNBn9P9REPfDEZJCLkHNO6I4GAj9S
         /6/aLHeafvrbAqiDq4Uv0FLVUyE2G5fyM2sTtnhYWP7/Cqw1oc32WACbdoqQ/Das1BkP
         iYwe4hRfv7JhsIhJEA0tEh9j8o2Q6jxubFusHQXw9ZgjjDiff5cIH35fWuJfIgzXykdN
         z0fDPZxBZ7BSrTO0uJpEybhg+xgHRclzUtGr7aLX24Yf2lOeGhaIWdlTdFt87xEebBiU
         YJnQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=eJUQg6mP;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sSvyz4o1xWOPWS+qOhTsWqTNGM0bywju8WOFWQR4ELE=;
        b=BeqI5SL3eQWb7dKtvNkI0qtL+aDn2bui+EXBtG2NSKIYRbalHGjPpfSBbKZbjEplBS
         2skBbsFqyjD0PkaKUXLEELI8Os9ixlChzbdZtbcAIsQPbvlQaGdeCvEQZ9NZzPOD4BaY
         790MAIAWtT408ZsRoDthW8jkjlarqFBnYAcw2Msv4YFSjzsFpCGprZrEdFs5OdKuhYXf
         A5A5quhqaFYXtpLggzwDLEcGnbUM3ODHylPbYLidqCCn9l+kBv6pfJ6GTZvXufTZXR+0
         wbFIWoh0ewhfCx8lvkWbxDUWhKMjoXzEkdaSncH93jVZIKLG2H76DL8BohTZzfsiOY0h
         uK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sSvyz4o1xWOPWS+qOhTsWqTNGM0bywju8WOFWQR4ELE=;
        b=KT8RY52edsLj4dAqyTMetWOiJJtNbgLLvzY5zRONqI/pm+gFtQ308ANO9fc6wlFan9
         S2HZ/jFl2el5kSNgI5IbbjSSwTxVObSI4WfmdXALDVJBtJDqE3/d4g34qU/AicDWJwS8
         LPv/UGjzsn7WtsSVUV+nFMMjZngBfVTkd9YP/rWGfBTCBTDqCgCkho39eD45t0Cm6UZe
         3T/lTTDbZob3xQigajnqHEhQ/uN/JnSo5GVoZWBbsCxV0ht7Tzrzqx4aHgWIY9koPI98
         QyjD4SlP9Tkn2fE/4WbIdxsCpLoSHzbuZmZfqVeaSW68q9YjbQnkzXqNtK6ueNOhINGe
         Nd+w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU/BdZtRltA+Q+8sgN+ao8b3+vbbiDQhX6PB77YM9zGKGrpT6/A
	eLxXCPRaH6It0p1q0AnTrP4=
X-Google-Smtp-Source: APXvYqyxMGSq7n1dT6Cc+LKxOvU0BSgt9kXxTG00dJCyYMpb1ajFKR99/uksJ7iZLXsQkR4C5PK60Q==
X-Received: by 2002:a1c:e710:: with SMTP id e16mr19394358wmh.38.1565011536121;
        Mon, 05 Aug 2019 06:25:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c411:: with SMTP id k17ls2882wmi.1.gmail; Mon, 05 Aug
 2019 06:25:35 -0700 (PDT)
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr19524676wmg.6.1565011535630;
        Mon, 05 Aug 2019 06:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565011535; cv=none;
        d=google.com; s=arc-20160816;
        b=cSHcaTr97sUSHlyP5zV+Ot8w7R+8iBpFK/l1pI/2pyCXRlxvEr61OPLkMQIyOyC9uo
         wQ3m3uQdp1XycncdBCHLVSllgw0T8yYL2NqNjHpkzMdVQavV3hLaxJhYpft0ZA1eTdWG
         CWSn4f+WyM0bGdN+mEBhv4izDVlOtbrjDNaUvuj8N0XnsfwM4mB8RSa2PhaZS5YCrH+Y
         DoB1N8B7aYf6e8tzHJMdBpMFtTmHVtRte9ej/XhIOWqDKUN0SGl+aJ1xfbeB13mhCVIT
         TITWyUXS1kFETlBnQE1LsPKiW8LeFsLLSsGtxCZSefwGH4VeeFry/x9lBzlfBEsTcI1f
         LvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=1xoTLsjKxb67hnrkTX3Ph7KNhDjuhGVA5oEzA3qp31g=;
        b=Cq1N//haqDX/oKWFz+oTbrDbvSvMjvZ+9pycfIE4xBpHNHUaocrHVmeSpqG4KRMTSZ
         IAzVov9cE+JpwkDU5amFMz5qfLybqZ3GKDnd8lwhuJnWFU5uxrX1dgAyJZHOni48D4Mm
         wYYpQ7yjvttQyWPn7eN7jIFNdu/OO1JEqGu2w/CXugRCwjLAGOBfpeyoSjDUAl3oIsp3
         ANi2p017heYp1FtAeiheYqrZj9nM/Sk3syU6BrpKqsTZIhqlQFpwA3T4/cHeNe5c8eQO
         XQxP38+/vsSgDqRJz+XVbi+brISBw+tNIpLO4T63Acb5P2+Tt6UDK+qDaThClmvc43w7
         A3uQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=eJUQg6mP;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id z24si391201wml.0.2019.08.05.06.25.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 06:25:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 462JRg1Vjnzxyr;
	Mon,  5 Aug 2019 15:25:35 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 5 Aug 2019
 15:25:34 +0200
Subject: Re: [PATCH v3 1/6] iommu: x86: Generalize iommu definition
To: Pratyush Yadav <p-yadav1@ti.com>, <jailhouse-dev@googlegroups.com>, Jan
 Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>, William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
 <20190709134836.10485-2-p-yadav1@ti.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <14f0f8cf-b23f-63b9-22c6-7abadbcfb57d@oth-regensburg.de>
Date: Mon, 5 Aug 2019 15:25:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190709134836.10485-2-p-yadav1@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=eJUQg6mP;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

On 7/9/19 3:48 PM, 'Pratyush Yadav' via Jailhouse wrote:
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

This is a comparison of an __u32 against an enum.

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

Same here.

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

Wouldn't it be better to use simple #defines here? As we use a __u32
type in the config, we don't benefit from the safer enum type.

BTW: I just rebased my local branch to next and Jailhouse failed
initialising due to the missing .type field of my local sysconfig. Well
- my bad. But if type is not set in the config, we now assume
JAILHOUSE_IOMMU_AMD per default.

Would it make sense to let those definitions start from 1? This would
ensure, that we have a empty type fields won't default to AMD.

> +
>  struct jailhouse_iommu {
> +	__u32 type;

This field changed the configuration format, and requires to increment
the config revision.


... But taking a step back I wonder why we actually need the type field:
We will never have an IOMMU_AMD on an Intel nor ARM system, et vice versa.

  Ralf

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

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/14f0f8cf-b23f-63b9-22c6-7abadbcfb57d%40oth-regensburg.de.
