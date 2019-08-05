Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBEUGUHVAKGQE2QIZ4AQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D4581F90
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2019 16:54:10 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id f19sf51782442edv.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Aug 2019 07:54:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565016850; cv=pass;
        d=google.com; s=arc-20160816;
        b=03Ta6LR2h+NcQ3bFwpncCZ7IpXA0Pl1Z1JXZEjSf9g7rNKxVM3Vi2vpOGTlYYXAj/b
         tAVcy0uREETTiE7K1Vo3I7304K0Vw3fFu/JI6HWJD8/RuHo8YtFER1WQkzOaTqxrXlh/
         jLh0WBL+ejilXY0CXNwBPOvBzNQL0Cdi1IQJq6PengVOADdnKWoZD252B2uPsUAM25UC
         ddqHJz3dz64x7Atz3X6FkNe/FAoXVAV9W+RrdCOAu/NKX/QlQKKgcUBBeIlknIpt4FUs
         EUmQv0VrOcKs0lHhz0dTSG4ExVvy3g3UULosYe00gTfpiupcn+NdfE2G3frdVE5CWiJk
         /1Sw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=aa02e4h7TC6YQRnop8QhRlQEWbNk9YdhFNSkL+AUNXQ=;
        b=qNRvTHJIKBJXcgH89Ea8bCYjEA6dfLKb0z+QbuDLW38QNdCQr6LYb+VKfYRRcURR+V
         q539gT78vgiISwTfvmcBfGINaziA21PJzUWEDrSaXYr5WG5ebnnPiXU8xdAEb70O6Fvq
         wGvaIiw38CRhcJfAtbkLUkPuefgKRT33jQdBMdWxAPrNh1OgZNWzO2dFdcI+LybamUs5
         RAY2EmIKhLWeqDS3cGGnbGku6Rg0u4GFBAbyWEsBL7JqvRpqMcW0uKBFSxcW4ECiQoYy
         kGo+nHPdrjMoG9PZGFS4+C70FGca/+dLcswkuGx1R6+U29gFLClPlkF/RQdjdeOb/M91
         HOgg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aa02e4h7TC6YQRnop8QhRlQEWbNk9YdhFNSkL+AUNXQ=;
        b=f384A51JSjl40Nsr/EensgDHJ8k0AlnJCB3qPBuNApKJMxBPdNeWLXcDIOydaWIrGc
         cFkjNWkuQ9qmeVyXGRGP6Mypp0l6oNlpvUT7CqTALt5tWHS1HF81ipZFUaJj2csx36ai
         xcKzOZVgQpkmi+wJ1hq1fxtqb9LmFJHeInc/kVJ5hjbuX2ZAigKGZa7HSYWyy316KVhf
         jBDIzdVCen6jk62mYbs91Vioz2rGOLnP7uAeSzUt/+FMl+zxY+ILo6HfaEXJgmwH74KT
         07V0hXzzU6EJRDoUdrNqQ+R7JZ6TAxdXztwQ0trFzmn4zQpq5fPyegRGOudvH5lCIfbQ
         6g8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=aa02e4h7TC6YQRnop8QhRlQEWbNk9YdhFNSkL+AUNXQ=;
        b=fzvQ2TfV86RwJnbYxbX64BH8ytEMJRgsb88Mq0r9KhBy+J0ZDwAGQGYdD8yemPBYt8
         j7hz+Ljacwgw6n2HOdZi338n4zUvzwPd0m1Sz2TxeYY/8HD0ewunlYQlKL+TYH7JRsd8
         Q6GbGrzU4nIYOKW3jUtKKduTU98IdeqQIH/UURzNNAiDIXWQGPKNkZ/DnGdUemHb2Wli
         0VG/p40hyOiY/7JNvsai+vFnHAVYfOO/GpGzE7ZpOLYL0mMD4is/2e45E0vT88acXLUK
         rkC9JlbSxSFFmkYaz3l++lxjUCqHJ8Zm5W/SpTlLOJmEiBfsFGJfNLj0RnHYgFGbPiNR
         EL2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVD/Utpqp/WADDjCtzoCOPHCwl2xDu8+H3lPf+riJyUVoAvB1v2
	oRDRXE5SXZZ2z65TEuG4Yc4=
X-Google-Smtp-Source: APXvYqyJSL+5SbnBU6qGci+MLZt/jDApQMbZEvErAGUa2BtyNhLrk+VzCprVhtivsk94d9rjGHnqdw==
X-Received: by 2002:a17:906:34d4:: with SMTP id h20mr111034107ejb.4.1565016850741;
        Mon, 05 Aug 2019 07:54:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8908:: with SMTP id e8ls21421137ede.4.gmail; Mon, 05 Aug
 2019 07:54:10 -0700 (PDT)
X-Received: by 2002:a50:94a2:: with SMTP id s31mr135342741eda.290.1565016850145;
        Mon, 05 Aug 2019 07:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565016850; cv=none;
        d=google.com; s=arc-20160816;
        b=arFeiTitsj+RVOo9d37ITRMeWy6HBIRoNl2W0koAJXQhQSz8xDn/Uqr9b0bHT/HP+6
         F7GVsF+wKLOP9477s6lJVs3wgJVZdA3eTQmT+Rgkxpv5kmeKQtOFW6hCxpLckmtnrM5d
         qYX12XNUrph264f3YrjnWt/tScKqJ1zuHHesheowhO3oGsyj9X0xfHH68xFq4gbDUlZr
         SVD2Xj2FihCO7NBjuzGvm9HetbXVkJ3YKwFxtjb2Vj9OpsVIy/hPbLLIAOfyFTAcKyU9
         IXwCmtZLYSOADayk+mgvdqGjXG/zrEcQ3/TdycqcHTMrdFbZ8Wxhgcxd9SNVZjojHcP3
         sRSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=WlR7loggiIjhr0ZIQ3Swz6qgQzvKaSGVda7R8UG9HS4=;
        b=MPUvcWlO9RMLexOH6ogVwaSDtsvwwZUwFskJntPNj6ViIby1bAB7ZMkUH/NKdTo9Sm
         u8ryTCK/oK5xQOD6IuykllskTZ0PPWR3QcgBr9FsGTiy9tSkAwAscUOnno/IrsAzvXOX
         OOB2FMIK+y4f42hAfP1EhM13kQvhS3deRAAqON0XYAp+Ac27KK872N1S/lRqJpZURcRa
         hhNM0zrLo0OHAHrGQIy4ubN+cAQfw02pRXbcb7aaIzUcl5EzAV0o6dKDQXU6FQmyukuZ
         AHDwengwp2x8JWdnUMuPceYaEExQBhURpTyn7gQPvXXW7DRhGYLzCjU7SaXQvkb/qkY5
         cPNA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id b39si4970408edb.1.2019.08.05.07.54.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 07:54:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x75Es9fD029796
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Aug 2019 16:54:09 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x75Es9Fh009090;
	Mon, 5 Aug 2019 16:54:09 +0200
Subject: Re: [PATCH v3 1/6] iommu: x86: Generalize iommu definition
To: Lokesh Vutla <lokeshvutla@ti.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Sekhar Nori <nsekhar@ti.com>, William Mills <wmills@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
 <20190709134836.10485-2-p-yadav1@ti.com>
 <14f0f8cf-b23f-63b9-22c6-7abadbcfb57d@oth-regensburg.de>
 <29ff1833-f55b-d698-fbf5-49db43af711a@siemens.com>
 <e31985ab-b95f-d493-01e5-883a6c94cc31@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4d6a7a70-6c8d-7a25-a674-03142e112caf@siemens.com>
Date: Mon, 5 Aug 2019 16:54:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e31985ab-b95f-d493-01e5-883a6c94cc31@ti.com>
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

On 05.08.19 16:35, Lokesh Vutla wrote:
> Hi Jan,
> 
> On 05/08/19 7:15 PM, Jan Kiszka wrote:
>> On 05.08.19 15:25, Ralf Ramsauer wrote:
>>> Hi,
>>>
>>> On 7/9/19 3:48 PM, 'Pratyush Yadav' via Jailhouse wrote:
>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>
>>>> Right now, jailhouse only supports iommu for x86.
>>>> Generalize the data structures to support iommus of different types
>>>>
>>>> Assumption is that each jailhouse_system can define iommu
>>>> instances of different types. Extend the jailhouse_iommu
>>>> to add type info.
>>>>
>>>> Update the x86 config files to reflect updated data the new type field.
>>>>
>>>> [p-yadav1@ti.com: Add Intel IOMMU and fix compiler errors for AMD and
>>>> VT-D]
>>>>
>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>>>> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
>>>> ---
>>>> v2:
>>>> - Undo removing iommu_count_units().
>>>> - Remove the union from jailhouse_iommu.
>>>> - Remove the stray blank in amd_iommu.h
>>>> - Revert to using n instead of i in amd_iommu_init().
>>>> - Fail in Intel and AMD when any other type of IOMMU is found.
>>>> - Remove the accidental Intel configuration check.
>>>> - Update cell config template and pyjailhouse
>>>>
>>>> Jan, please take a close look at the template and pyjailhouse update.
>>>> I'm not sure if I missed something, or did something wrong.
>>>>
>>>>  configs/x86/f2a88xm-hd3.c       | 1 +
>>>>  configs/x86/qemu-x86.c          | 1 +
>>>>  hypervisor/arch/x86/amd_iommu.c | 9 ++++-----
>>>>  hypervisor/arch/x86/vtd.c       | 2 ++
>>>>  include/jailhouse/cell-config.h | 7 +++++++
>>>>  pyjailhouse/sysfs_parser.py     | 2 ++
>>>>  tools/root-cell-config.c.tmpl   | 1 +
>>>>  7 files changed, 18 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
>>>> index 315d0e29..849c5756 100644
>>>> --- a/configs/x86/f2a88xm-hd3.c
>>>> +++ b/configs/x86/f2a88xm-hd3.c
>>>> @@ -50,6 +50,7 @@ struct {
>>>>  				.pm_timer_address = 0x808,
>>>>  				.iommu_units = {
>>>>  					{
>>>> +						.type = JAILHOUSE_IOMMU_AMD,
>>>>  						.base = 0xfeb80000,
>>>>  						.size = 0x80000,
>>>>  						.amd_bdf = 0x02,
>>>> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
>>>> index fdfa8915..2df2807a 100644
>>>> --- a/configs/x86/qemu-x86.c
>>>> +++ b/configs/x86/qemu-x86.c
>>>> @@ -50,6 +50,7 @@ struct {
>>>>  				.vtd_interrupt_limit = 256,
>>>>  				.iommu_units = {
>>>>  					{
>>>> +						.type = JAILHOUSE_IOMMU_INTEL,
>>>>  						.base = 0xfed90000,
>>>>  						.size = 0x1000,
>>>>  					},
>>>> diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/amd_iommu.c
>>>> index 02712571..2fc6d033 100644
>>>> --- a/hypervisor/arch/x86/amd_iommu.c
>>>> +++ b/hypervisor/arch/x86/amd_iommu.c
>>>> @@ -448,7 +448,7 @@ static void amd_iommu_init_fault_nmi(void)
>>>>  		    &system_config->platform_info.x86.iommu_units[iommu->idx];
>>>>  
>>>>  		/* Disable MSI during interrupt reprogramming. */
>>>> -		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2 , 0, 2);
>>>> +		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2, 0, 2);
>>>>  
>>>>  		/*
>>>>  		 * Write new MSI capability block, re-enabling interrupts with
>>>> @@ -782,14 +782,13 @@ static int amd_iommu_init(void)
>>>>  
>>>>  	iommu = &system_config->platform_info.x86.iommu_units[0];
>>>>  	for (n = 0; iommu->base && n < iommu_count_units(); iommu++, n++) {
>>>> +		if (iommu->type != JAILHOUSE_IOMMU_AMD)
>>>
>>> This is a comparison of an __u32 against an enum.
>>>
>>
>> Oops, the enum is still around?! I requested to remove it but didn't check again...
> 
>  it is fixed in v4 :) $patch is v3.
> 

Ah, ooh... Ralf, please use your time machine only for funny stuff! ;)

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4d6a7a70-6c8d-7a25-a674-03142e112caf%40siemens.com.
