Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBF7JXH3AKGQELYIPG7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe3f.google.com (mail-vs1-xe3f.google.com [IPv6:2607:f8b0:4864:20::e3f])
	by mail.lfdr.de (Postfix) with ESMTPS id E476D1E4542
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 16:09:28 +0200 (CEST)
Received: by mail-vs1-xe3f.google.com with SMTP id z132sf1817235vsz.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 07:09:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590588567; cv=pass;
        d=google.com; s=arc-20160816;
        b=EV6BhwLvHM90K7JNbT7ftGvEbYD4usgYlF2EAGvwX5Xs8hX3yzhl4HAjR7mErdeGz2
         RtVWZE0s4siNwDm10pLPIbcUbZb92q1LpgtIiL+YsSzUUNsqq6P5uqmoMftmZhHgEiQs
         F6Rv7PryYQf00a30ZuKN9ok7Lwl/EzOr0wTfvXfOTngYsXFgK/nPRg5poqU1qx0xN9Sg
         5WS0KJng3M1r5DIOcG7tJ4efVhT1IJCe6e3yCqmSp+tdW+wzz9Lz52AoC2u/ea4Z+ciF
         pYMDvBChsD/7wc3X3rIUZNKNFAYSmR/VsWaaS9Dw/a3ywNJIsJyaZTxdUzdSheVc9p2B
         GdXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=u+IaPL/fdszBViInpiN4V+f7TN84JmYyOVXWLZS++zA=;
        b=gDorJ4r2AwZz1r3SkjHIalrd+xZbqnj/nsASQ+jUR9fwpVKjQTjzwZl5jUxKmjqu8q
         Yfrm6KC4a003ACfdq5fLeFJUS6MMTukBhtedm/Z3fceLEzzJ2DQ+hgK6spfVS6DSBC09
         HQxhEfelgYOb5qP7+NGOfSIR9e+5CFmuEvrNfGsHDeSKv7Rap3EOi1ssTmF0xsPXuIDN
         fJwe487Vrv7glf0tc+ytSWqiEKuIrCnHjak1HZ4RqePtZ3v2ykohoNdJ3DhhebNwfFos
         qGzxLxroURtJg/LwLzIM2Cf/EMIKHYJcs9h2ZtuJUcGKqnfVN9Lx/sij9TOKimiyBqQ2
         jprQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wzgoQIbv;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=u+IaPL/fdszBViInpiN4V+f7TN84JmYyOVXWLZS++zA=;
        b=KeWNS20m9sue1UnoziGm95+ESfumGm4jHRZBDJQU4NNmOBIJtwiLO0D9sDcS6a1pMp
         GLi34U4wSI3YfOCVeUITLUmlUE7aoAfRSmmNb+EwYcb0bZSr+HhKT1EGaFJWinOGNGQd
         giIcOZT17R0lpJTZeTKREQMj4BWWEV6yXOts4pDyECDcdCt1Y2Eu60y5oeDrHhYJb3KO
         IA5/LhpyarR9OplsUcf/IqvsbA6cyhJZN+yKRaOXC8YrqmRhIrzfhhwhb5512nmszNBu
         6QYicZ2bq651X5yylqfw1dS5wqEQBWXMw0vodDQ+BfTiCsP0ckXI3MQ2LWKlgxtk7JF5
         hjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=u+IaPL/fdszBViInpiN4V+f7TN84JmYyOVXWLZS++zA=;
        b=KeHEgkceGS3sYS/K7xcC9EOxdMcs7DM8Pb1iezNggA9I/SrNbeK2LFp3bUJ4qc8CwX
         l+by01i+75Uf6NCFVM84JmApRbFYQQxQLXrAIVZfOHCj31Yb8I2whC9STBvWQ7WfhhGk
         QVkbXi6aR59tDJzaRI0CAqZAsPnJ5UfJ3t0Zmb4GSYUNDB905DQS7WZYHn1K/dNRBKL9
         LcrwkyZzKlc4biBkX4ClRz4P7lQ/mWRuWH9BUejKRDZTwXIy18X/gQplLVTJfgqmaNfK
         X2iIUxkXpCmpQND92sa/Gc19ne/u8X/MRKZGrjR9QC6L64M+DUrbpDvM8PVQh4A1YPl8
         6C/Q==
X-Gm-Message-State: AOAM530Gl7jv7pyh/NNW8GkthXxk3CwUKVRjQqc2m9vUVL63dKWuAgnT
	G2GFxctxpnhvNx3iUo047lQ=
X-Google-Smtp-Source: ABdhPJzZAlsxlFT6GvPrUnRh9xemO9x9nsy3rp4Bq5UktbczG/Ht0m3HqLFh/Zrcd5ASVEaCBMiw8w==
X-Received: by 2002:ab0:2045:: with SMTP id g5mr4805441ual.76.1590588567812;
        Wed, 27 May 2020 07:09:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:80cf:: with SMTP id b198ls1556716vsd.3.gmail; Wed, 27
 May 2020 07:09:27 -0700 (PDT)
X-Received: by 2002:a67:f290:: with SMTP id m16mr5121681vsk.221.1590588567330;
        Wed, 27 May 2020 07:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590588567; cv=none;
        d=google.com; s=arc-20160816;
        b=mN24xRmmeJg7kO+WtWCvkVqDnoR4Z9uG+TbpnWy5+dKUT63yO0q40Z6djW6rkuYVw4
         3JItHiicw8nQqDnHNAVPvEb+RmUqbc9juFdWlkiB6+W7W+nW94TxMQIkdjEC3A+pBO7X
         Oa5PbyMIO14xg5iCdDsa4PpbkLMdhffstf30E/fHfHye0LBfEaJ0uInvRb6L7Gf6RcQe
         uktEgDDSjJD+AK9WvAIsrskpMUtw0X50G7C5HrxrsUNKtzHxBYGuyK7N9wXYuLVfhbrI
         sD50pjqjsW+RhurcMox/sy8V0c+2ETeFcYrjcphl175njcU91OVig3wxXCvLp7sJ8Qk3
         eEQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ewOqQtMRC7hMYbeTy+ICe+81hzeaJFcLhLUXVqOeFw0=;
        b=WMc3yp/VPYM+aJRAWl4hpZLPPyAN9u/bjBnB9mnonIqaYX/jdf6jDeagzttQnk7C0c
         w3P8vjCitzR+v7gTjRyodh3FR5Al1pYIyoxEkgJE0RKN+y4WdyOxNR8vInH3ZDWC0E3I
         VF+vx5xRuUvCKWO3KjUlwTrfVzAInxGowP6fe+dBsc/yI+FR+HdxvUYKdIw2rpNYxY0c
         P9gW3Q+D8pi3ymIQrcOOXjLCPCWo5/Dw3MJB36SNgmeGR+ZaaVTuCq2Xn0CJDYBCPDN/
         IYh1lkem79WEoH1iLgw6L7J8d5tpkUpwlVLVPaoz6YMJnChKvGs4zPd6nOMbwQQNdqyh
         82Jg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wzgoQIbv;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id f12si43233vsr.0.2020.05.27.07.09.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 07:09:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RE9QaL056272;
	Wed, 27 May 2020 09:09:26 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04RE9Qfh077736
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 May 2020 09:09:26 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 09:09:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 09:09:26 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RE9O2f055353;
	Wed, 27 May 2020 09:09:25 -0500
Subject: Re: [PATCH v1 2/4] configs: k3-j721e-evm-inmate-demo: Add ivshmem
 capability
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-3-nikhil.nd@ti.com>
 <6e2a0459-3707-99ea-27b0-184f643d27fb@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <8e7b50d6-9c6f-3538-2042-94db463f20fe@ti.com>
Date: Wed, 27 May 2020 19:39:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6e2a0459-3707-99ea-27b0-184f643d27fb@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=wzgoQIbv;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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



On 27/05/20 6:55 pm, Jan Kiszka wrote:
> On 27.05.20 14:32, nikhil.nd@ti.com wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> Add a virtual PCI device with IVSHMEM type (id = 1)
>> Create IVSHMEM regions for 2 peer communication
>> Enable the vpci_irq for doorbell interrupt
>>
>> This allows to run the ivshmem-demo baremetal inmate
>> inside this cell.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>   configs/arm64/k3-j721e-evm-inmate-demo.c | 63 ++++++++++++++++++++++--
>>   1 file changed, 59 insertions(+), 4 deletions(-)
>>
>> diff --git a/configs/arm64/k3-j721e-evm-inmate-demo.c b/configs/arm64/k3-j721e-evm-inmate-demo.c
>> index 7440a258..e09c4850 100644
>> --- a/configs/arm64/k3-j721e-evm-inmate-demo.c
>> +++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
>> @@ -20,7 +20,9 @@
>>   struct {
>>   	struct jailhouse_cell_desc cell;
>>   	__u64 cpus[1];
>> -	struct jailhouse_memory mem_regions[3];
>> +	struct jailhouse_memory mem_regions[7];
>> +	struct jailhouse_irqchip irqchips[1];
>> +	struct jailhouse_pci_device pci_devices[1];
>>   } __attribute__((packed)) config = {
>>   	.cell = {
>>   		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>> @@ -30,8 +32,9 @@ struct {
>>   
>>   		.cpu_set_size = sizeof(config.cpus),
>>   		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
>> -		.num_irqchips = 0,
>> -		.num_pci_devices = 0,
>> +		.num_irqchips = 1,
>> +		.num_pci_devices = 1,
>> +		.vpci_irq_base = 195 -32,
>>   
>>   		.console = {
>>   			.address = 0x02810000,
>> @@ -48,6 +51,33 @@ struct {
>>   	},
>>   
>>   	.mem_regions = {
>> +		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
>> +		{
>> +			.phys_start = 0x89fe00000,
>> +			.virt_start = 0x89fe00000,
>> +			.size = 0x10000,
> 
> This means the kernel is configured for 64K pages - rather uncommon and
> problematic in many regards (just had to turn it off on AM65x because it
> breaks userspace [1]).

Yes, indeed.
In fact, I was planning to send one more patch on ivshemem_uio to map
a page aligned register memory[0]


At TI, Jailhouse is integrated with TI linux kernel[1] (which is 
different from the siemens kernel[2])

Can you please point me details of failures with 64k kernel.
This will help me to convince TI kernel developers to turn off 64k 
paging because of whatever issues that might occur.


[0] = 
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-5.4.y&id=30061ab0dcd216ccf20fa9bc426b575feaaefcb4
[1] = 
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=ti-linux-5.4.y
[2] = https://github.com/siemens/linux/tree/jailhouse-enabling/5.4


Regards,
Nikhil D


> 
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> +		},
>> +		{
>> +			.phys_start = 0x89fe10000,
>> +			.virt_start = 0x89fe10000,
>> +			.size = 0x10000,
[snip]
>> +	},
>> +
>> +	.pci_devices = {
>> +		/* 00:00.0 */ {
>> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> +			.bdf = 0 << 3,
>> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> 
> This constant assumes 4K pages.

Shall I create another macro like below?

#define JAILHOUSE_IVSHMEM_BAR_MASK_INTX                 \
         {                                               \
                 0xffff0000, 0x00000000, 0x00000000,     \
                 0x00000000, 0x00000000, 0x00000000,     \
         }

Also, as long as the memory that is getting exposed by the registers
regions is less than 4k, it should work right?
Maybe I won't need the above patch if I do this change.


> 
> Given all the problems with 64K, I suspect it's better to switch to
> standard 4K.
> 

I am afraid that might need lot of convincing.
Till now, I am able to get the Jailhouse and ivshmem working nicely with 
64k pages. Need to check if I have introduced any security holes, etc

Regards,
Nikhil D

> Jan
> 
>> +			.shmem_regions_start = 0,
>> +			.shmem_dev_id = 1,
>> +			.shmem_peers = 2,
>> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>> +		},
>> +	},
>>   };
>>
> 
> [1]
> https://github.com/siemens/meta-iot2050/commit/fb1d72677fb7443d851b032517d693bbd0e1d1e4
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8e7b50d6-9c6f-3538-2042-94db463f20fe%40ti.com.
