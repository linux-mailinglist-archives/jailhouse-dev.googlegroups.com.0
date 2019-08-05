Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB27FUDVAKGQEWRXLUYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C4081DCC
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2019 15:45:16 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id y24sf51674907edb.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Aug 2019 06:45:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565012716; cv=pass;
        d=google.com; s=arc-20160816;
        b=PIiKI2Yf032yO6Lbtz35OgnC5kevJJrSCqm9gagO5Fh1gAH69gFaFe8NrR/4oigwwz
         8UlCbgd0OzXJ84rzt7PHTQk1fRduPTzByK3wtns32U+11c7XtmNR8ar2SRbNXr1WR6Uh
         9LdHvImi2n83YAEBKecIzlReDlnfx6GsQd6PBz8m+gOAsmDQMdTM4XpbuGHcadCBHl2U
         lnoGZXlcwtxSRG+jznXQeF57my8e/ACAhkBuHyCdjRiI3DBMe63+6tFTK0rnSuWg6waw
         V8OY68dCrVXJA+A6uIeUXdYQDWuLpa0oFCTq5Jle8uRcyZ42PZXRdpDpZg3h1aQUDYRV
         Ztiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=WNEQ9kThJMe8vQK1g6thiEeCWdrKzH8VbX1j9GuCS3g=;
        b=BV7HABei76YZI5QNiOL4dEKkex2hoWxFq9cYf/fMiJ/dpSam38BDcUjgero5T40qcp
         m53A3CfmWikKreOWSRobdkkob5CFtK1//Pmpp9Mm2TJfjYYKRRrA2UG4aRRbJwsjzFdB
         oNVjwtZ7mNX6yv1/NcDw9lALNd+jKBqKKsMvtl1JmgEeZ64HRW4PJYJcHUQycej+6iAf
         mj9ERwDaOrsu4F/aT4oyMwHNQ+HJvGWjpoVXZ9XGoocdjW9yht4LCsOI9E+BynQF58vk
         rhPUscDO39xys1tKB0Z642Z7n8eWc80vVg1nxcSwYd+wxBo2gAkpmQsBvfE6Pf95BU+J
         M0iQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WNEQ9kThJMe8vQK1g6thiEeCWdrKzH8VbX1j9GuCS3g=;
        b=gVUFduvGvin6x48XNg5gDZqKHIUyydxpXcffq0h2LTz0MJi6RlbiCewX5l7oPtmmVs
         ZxdKxSc4zQqlprpBnb0iixlSf8gW/IFIlAR3u9i1Foje8tpZDiUM3oYxa/nyX1xgmOlA
         XkEeQXysdl+xOqc7fH+ojiYKCMfgNDx7jN+Fg0jHE7xRW2IMtPY9Xg4HXG3c5snPXyQp
         IeLaENRU5fGjF8VQu8SpSj5BPRfrJ31g/nksvtoPDfryysX6u/kF11aHoWzpI0rJSICF
         mj83uhfh107zZR9V3yGLNdqch7Rj74X44h5AkO45pfjCMa8MtP7OVycJMjf3rU/v4Hew
         1MGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WNEQ9kThJMe8vQK1g6thiEeCWdrKzH8VbX1j9GuCS3g=;
        b=Bh718rsECJWMkKdrHRQlg7PwhXhoZ0YVsxWkujTpSdhKTxy3HaaQfqWOooPi4Cm+7D
         BcU5G6joU07SwGrjrjmwVsV9GZRX3kK0/aTb3v08WIs/vJx4I5W/FOppJGq5Uyk3kq6F
         Staicbyogqba0LmvlEYgkQkJ3EVQaA6ulJPszo7/OXjOO83NCYIunAVjHyZqRe1qjM9p
         rIvrekkkq5aUuVvERsAYGoI5G2Oz2ridx0sg1ROdfneTyR+uMfmMv4YjQE5hFapM9M7G
         jMQdJwPwXP2XKA7yqkoyPHmRrjRRRK1E588NvxvmLoJnkzgSCT9uQl4VtD7F3Nk//YUV
         RPlA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWr/+tm7u0aLPM/WzCK6jN5A0+D45Mh4HFv/q02EPO66p/8mXIa
	SjYvkltdYrwEOOT0i9HD9oI=
X-Google-Smtp-Source: APXvYqyTcGCKBAjjaE4HC+XEgX6OMcojlAdaZCYSnt/AbKSBYaSmT+90KIEF0EmREP27lqy7wwB1mw==
X-Received: by 2002:a50:ba57:: with SMTP id 23mr136438475eds.196.1565012716027;
        Mon, 05 Aug 2019 06:45:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ae9a:: with SMTP id e26ls10063668edd.1.gmail; Mon, 05
 Aug 2019 06:45:15 -0700 (PDT)
X-Received: by 2002:a50:fb86:: with SMTP id e6mr133615447edq.203.1565012715483;
        Mon, 05 Aug 2019 06:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565012715; cv=none;
        d=google.com; s=arc-20160816;
        b=FH2vHmruWfYlJPElmJYLQm4BK5qFV6ICrvxFogVm9z6ClULTF1BNtnpf54NAJ2qtZM
         wteat4hqcYo7QmU9l25TYRcZ69kliPEEKhKmR/hXdGSVT+bhrIGje/6XLagONg54ydKY
         IoYfpzBoFIGYasTFf0SV601qJfxWog9EHFqprbPDygULoDzIJCaYruEzATTvrWg0TLQf
         /VN/eXWcG7bkRpzaYQeGlSviaZtPJJYBEbaOW9HgcC2wYpqnv3NnmvNB6zFAAvnQm9oN
         V7uvJErh8k1PFDfVS6D2wNYvBMLaTPDJxiDGXklXBlgKt8cwXNCYa12nr6XKDcnIHPPx
         uiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=EN6D5Ts020NL1NbVYRHXVNTTtY6JPvwCz4vsXLE7Wcc=;
        b=W4WiwqiKrMVek40fDaTQ4VLJzpkamaQTb3coSWeYE+iGVev5eKcuiaUvar8Tpe1uhQ
         LLJZPHWAH6cyYRPgONuxefCd49UP+2DBP9KWyeu4OUL/Hmnewy3EbogjY1j9Xd8Lopbn
         Qxt3wg3ZobiJE6FpvrWqlImy+V5eTClMaRwR+xuRQmYlg5UPrI7h4/eRTGxvzPaIUJG1
         11qWfMf6TcnEj2tjbYY9bJu3c55DyM6/p98CRcixfnE8YL1rAWIWicxxwstV2jWZ4eO+
         rlRVrAPsIYOtR55AhLJprBicRTkrlyAGMuE7ho8CK+iJ2toBtKwtuU69rrgY6EPLsnm7
         uhCQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id k51si3087067edd.0.2019.08.05.06.45.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 06:45:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x75DjESu026012
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Aug 2019 15:45:15 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x75DjEqs013484;
	Mon, 5 Aug 2019 15:45:14 +0200
Subject: Re: [PATCH v3 1/6] iommu: x86: Generalize iommu definition
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
 <20190709134836.10485-2-p-yadav1@ti.com>
 <14f0f8cf-b23f-63b9-22c6-7abadbcfb57d@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <29ff1833-f55b-d698-fbf5-49db43af711a@siemens.com>
Date: Mon, 5 Aug 2019 15:45:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <14f0f8cf-b23f-63b9-22c6-7abadbcfb57d@oth-regensburg.de>
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

On 05.08.19 15:25, Ralf Ramsauer wrote:
> Hi,
> 
> On 7/9/19 3:48 PM, 'Pratyush Yadav' via Jailhouse wrote:
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
> 
> This is a comparison of an __u32 against an enum.
> 

Oops, the enum is still around?! I requested to remove it but didn't check again...

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
> 
> Same here.
> 
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
> Wouldn't it be better to use simple #defines here? As we use a __u32
> type in the config, we don't benefit from the safer enum type.

Yes, see above.

> 
> BTW: I just rebased my local branch to next and Jailhouse failed
> initialising due to the missing .type field of my local sysconfig. Well
> - my bad. But if type is not set in the config, we now assume
> JAILHOUSE_IOMMU_AMD per default.
> 
> Would it make sense to let those definitions start from 1? This would
> ensure, that we have a empty type fields won't default to AMD.

Worth to consider. Or we put Intel first, so that the common case falls back to
the right value.

> 
>> +
>>  struct jailhouse_iommu {
>> +	__u32 type;
> 
> This field changed the configuration format, and requires to increment
> the config revision.
> 
> 
> ... But taking a step back I wonder why we actually need the type field:
> We will never have an IOMMU_AMD on an Intel nor ARM system, et vice versa.

We have different configurations for both, so this can be seen as a safety
measure. Moreover, we will see different SMMU version on ARM without a chance to
tell them apart by CPU vendor. So there is a use case for this type field
outside of x86.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/29ff1833-f55b-d698-fbf5-49db43af711a%40siemens.com.
