Return-Path: <jailhouse-dev+bncBCB7D7MXMMIOB7NA5ICRUBH4ADC3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E2781F32
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2019 16:36:17 +0200 (CEST)
Received: by mail-yb1-xb3a.google.com with SMTP id i65sf4939140ybi.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Aug 2019 07:36:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565015776; cv=pass;
        d=google.com; s=arc-20160816;
        b=gKODStrukDk3vUCsblANY78h/j5Zez9R6JEuUuAM5qTgRubElbMh7k/mPYcLEc9hB7
         xzyO/Nv37018TqVpAhEq1v1b980CKUdNEeDTkpggxJ4XAftSg7Gw77Padn2xql1OhUp+
         cOZ6uZjt/ORwxttbRJQQT7xpLzB+YgYgixqtqjnJBtWyt0jL8k0NLC4k00dfmLW0r0ot
         bsT3+90s5kG4TkSiw/LK3wA2K4Ghqy6iogq0UKixNxIrER3VHpmIRwld3LuJmkxYQFql
         M+iBPjrkzUk2DKine8pty/mUnViszCpG4GYrd9ESQDkUPVsrS0QeBjJxeCtuW3aB2ouA
         ts5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=fOQinRTUB3M/PJx0ArfIdF+JRCaKgYyXImHYbVokm38=;
        b=lpcxXYAK7zSuKNi8mqUf+n2UqtlRt8udm24hNqhKSnnjrqyr0gpMYxHeb+f+tX9pV3
         LT9MZbVNiSszESzsTFwqjFrt6bvDSAKVuabjUVqQqdXiClXf0e2acvvTXSUJLZnKJJKU
         sNX7vlZJPzkbOQFT/Chndys/sVOwlAE9RSBVr0SaIDYJVmno7OE5CceeZPYQSDyaEbZM
         eQdqHX2spxquLrsE3LxQMf/pTWAtIRhMAcnqzpZUDxuBO3D7U1jGGrNkMXuWUDEYuNyP
         Tr4FlUvC4oH6kbfZrOoCeUIlC5zQtpwQTouxe21ywAzuvSvkURVqFlev3d302TwVtgp9
         oO6g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fkrxRqdn;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=fOQinRTUB3M/PJx0ArfIdF+JRCaKgYyXImHYbVokm38=;
        b=X9tEEjMZgNr/AA/cuk/Kz5Ab4aehWD35CRlu1pN32jmFNk3n1tLe8iuJnj2M7fhCWl
         IYsamRPk5erZs9VV+K32Jr/9agtamxh/ZYgvFRHYTk1CQiDPxn4mQlEAdIWortDSB+xv
         f8zfy8wsGacR+gvSKibjdif/HyOzu5W3mYfKhQPBtuBG3gIoWIkrJ5AgFErYUqyd9zKa
         ZkTbQE1hbKupwT46fzBR+HNN92ikZHHgQD+9ZU8ED/TW/DOgmEK5ENF9VyIwUzIPEYbJ
         dNLOfMy4zlTSWVzvoz3qefdFjdxEq4Q7araGpv1RE60w2+oqwooRU5ooiN0hcHdys5pd
         uWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fOQinRTUB3M/PJx0ArfIdF+JRCaKgYyXImHYbVokm38=;
        b=fsVpP2YCvys1b+w5o46WD1Sohev3w/tsdz71S1AHbvf0NbH892ZWyRtAK5Gbp9O+Ov
         UQ+epL9przJ2k+6jcWhewvD0dQw+HRWEG5lzOz65S9nTP+fUJOmLA+oAYoGSVIfTA9ib
         d1aR36aUTaKDjCNMECFnkwHo3+sFs7U8laVyYyQfuuk49AW2kxkdvTcrD2oX+OkhVXc1
         KBQk8AhaFRi92NJzEYEWc6GcoO1qsEv1y717pBvbA7RSEkxsDrEM/C+4Cprva0/HTPtC
         T2ZU8MHNl0JBjyX0p1ATzeMwiXR38RCM+6FHz4E1w/y6A5NVIzrSq223Tx/2Pb7tks1Y
         pXYw==
X-Gm-Message-State: APjAAAUdU2l3hdZdmW6yAarwp/AFs/kiXGRh+oJR4nRdlF+jQ56kQ6K9
	/4pdeBr5LSeubvXkhzhnDxQ=
X-Google-Smtp-Source: APXvYqxmVJYf+/0+NRX8lD0277mlXP/8uXoOoKvjJFrvL4Q4nSOUe6Y4eff+2kOFZhM8JXY1kIx8CA==
X-Received: by 2002:a25:7254:: with SMTP id n81mr11489540ybc.522.1565015776742;
        Mon, 05 Aug 2019 07:36:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:c901:: with SMTP id z1ls15988257ybf.11.gmail; Mon, 05
 Aug 2019 07:36:16 -0700 (PDT)
X-Received: by 2002:a25:37d7:: with SMTP id e206mr73886181yba.518.1565015776308;
        Mon, 05 Aug 2019 07:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565015776; cv=none;
        d=google.com; s=arc-20160816;
        b=FAMAbk90dk1LsIAe0XrW1AoWd9LpS0p4YCl5hRrFuahVaWLqbVOCxcCoFTRsYaU/8e
         ndxvqHyDHwWF0v+joIyVtevWOWC8GrrxJIl20j1XAKlttwOpqPjEO2eqNJ7Hv49EjzKV
         Ksx242FskMvBykViIvcV4DvkYy6du9raECbB/wk4e0bmANUmW7fA3I6NQ4GKFFrl2EGH
         JVb+lm/dno38KPyd94v2o5yYZ8nWv8x4eWFkvbXdblB8ENk4dlRGWy8k8OVbhSAZEvqb
         /cNySU8/KBj1Sko8Yqqt70aHepwm1nOyR8t9Pgj3fr/T7mpVV7/Ndqwl7JPQCgs+RAHM
         4XVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=k3ibYSF+VqF3ENyJKPyrkPhe39a6pMy+C21d1HTdBuY=;
        b=OW0lDfGGeKLN/Rv/d0k2MvkD8KBgCjTt7vOunKhKJ9z3RFaNq46saknC1IUzGOGXCN
         x7RZ3cOP/2q3vvSbxFKLqAMBTCt8f6fHgwfnIgoyaKA1YQ0BjdtDrrzKiQ8OcKkfwBN2
         LQ8dj3OpQa0TcQZx522/tCE8LDMjsmILWs31EmlPQFUROjXOE0s/FHyxFmtpRWERD24l
         yAB1inMBTknCLFX4/dwkRCMU8cAWb4egFVtErcwedC/65dvmGICgfu2TOBoazkC95UHC
         1lc8zmSkbHoQFJNcvB8bB+hMdu1Rk7ltEM8oWKQg0xoeGkaaFZCOw1iiJFURFLdR2HKQ
         hbpA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fkrxRqdn;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id d16si4592273ywg.5.2019.08.05.07.36.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 07:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x75EaFS3048169;
	Mon, 5 Aug 2019 09:36:15 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x75EaFSK121301
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Aug 2019 09:36:15 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 5 Aug
 2019 09:36:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 5 Aug 2019 09:36:14 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x75EaCuD120289;
	Mon, 5 Aug 2019 09:36:13 -0500
Subject: Re: [PATCH v3 1/6] iommu: x86: Generalize iommu definition
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>,
        <jailhouse-dev@googlegroups.com>
CC: Sekhar Nori <nsekhar@ti.com>, William Mills <wmills@ti.com>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
 <20190709134836.10485-2-p-yadav1@ti.com>
 <14f0f8cf-b23f-63b9-22c6-7abadbcfb57d@oth-regensburg.de>
 <29ff1833-f55b-d698-fbf5-49db43af711a@siemens.com>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <e31985ab-b95f-d493-01e5-883a6c94cc31@ti.com>
Date: Mon, 5 Aug 2019 20:05:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <29ff1833-f55b-d698-fbf5-49db43af711a@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=fkrxRqdn;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as
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

Hi Jan,

On 05/08/19 7:15 PM, Jan Kiszka wrote:
> On 05.08.19 15:25, Ralf Ramsauer wrote:
>> Hi,
>>
>> On 7/9/19 3:48 PM, 'Pratyush Yadav' via Jailhouse wrote:
>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>
>>> Right now, jailhouse only supports iommu for x86.
>>> Generalize the data structures to support iommus of different types
>>>
>>> Assumption is that each jailhouse_system can define iommu
>>> instances of different types. Extend the jailhouse_iommu
>>> to add type info.
>>>
>>> Update the x86 config files to reflect updated data the new type field.
>>>
>>> [p-yadav1@ti.com: Add Intel IOMMU and fix compiler errors for AMD and
>>> VT-D]
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>>> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
>>> ---
>>> v2:
>>> - Undo removing iommu_count_units().
>>> - Remove the union from jailhouse_iommu.
>>> - Remove the stray blank in amd_iommu.h
>>> - Revert to using n instead of i in amd_iommu_init().
>>> - Fail in Intel and AMD when any other type of IOMMU is found.
>>> - Remove the accidental Intel configuration check.
>>> - Update cell config template and pyjailhouse
>>>
>>> Jan, please take a close look at the template and pyjailhouse update.
>>> I'm not sure if I missed something, or did something wrong.
>>>
>>>  configs/x86/f2a88xm-hd3.c       | 1 +
>>>  configs/x86/qemu-x86.c          | 1 +
>>>  hypervisor/arch/x86/amd_iommu.c | 9 ++++-----
>>>  hypervisor/arch/x86/vtd.c       | 2 ++
>>>  include/jailhouse/cell-config.h | 7 +++++++
>>>  pyjailhouse/sysfs_parser.py     | 2 ++
>>>  tools/root-cell-config.c.tmpl   | 1 +
>>>  7 files changed, 18 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
>>> index 315d0e29..849c5756 100644
>>> --- a/configs/x86/f2a88xm-hd3.c
>>> +++ b/configs/x86/f2a88xm-hd3.c
>>> @@ -50,6 +50,7 @@ struct {
>>>  				.pm_timer_address = 0x808,
>>>  				.iommu_units = {
>>>  					{
>>> +						.type = JAILHOUSE_IOMMU_AMD,
>>>  						.base = 0xfeb80000,
>>>  						.size = 0x80000,
>>>  						.amd_bdf = 0x02,
>>> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
>>> index fdfa8915..2df2807a 100644
>>> --- a/configs/x86/qemu-x86.c
>>> +++ b/configs/x86/qemu-x86.c
>>> @@ -50,6 +50,7 @@ struct {
>>>  				.vtd_interrupt_limit = 256,
>>>  				.iommu_units = {
>>>  					{
>>> +						.type = JAILHOUSE_IOMMU_INTEL,
>>>  						.base = 0xfed90000,
>>>  						.size = 0x1000,
>>>  					},
>>> diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/amd_iommu.c
>>> index 02712571..2fc6d033 100644
>>> --- a/hypervisor/arch/x86/amd_iommu.c
>>> +++ b/hypervisor/arch/x86/amd_iommu.c
>>> @@ -448,7 +448,7 @@ static void amd_iommu_init_fault_nmi(void)
>>>  		    &system_config->platform_info.x86.iommu_units[iommu->idx];
>>>  
>>>  		/* Disable MSI during interrupt reprogramming. */
>>> -		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2 , 0, 2);
>>> +		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2, 0, 2);
>>>  
>>>  		/*
>>>  		 * Write new MSI capability block, re-enabling interrupts with
>>> @@ -782,14 +782,13 @@ static int amd_iommu_init(void)
>>>  
>>>  	iommu = &system_config->platform_info.x86.iommu_units[0];
>>>  	for (n = 0; iommu->base && n < iommu_count_units(); iommu++, n++) {
>>> +		if (iommu->type != JAILHOUSE_IOMMU_AMD)
>>
>> This is a comparison of an __u32 against an enum.
>>
> 
> Oops, the enum is still around?! I requested to remove it but didn't check again...

 it is fixed in v4 :) $patch is v3.

Thanks and regards,
Lokesh

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e31985ab-b95f-d493-01e5-883a6c94cc31%40ti.com.
