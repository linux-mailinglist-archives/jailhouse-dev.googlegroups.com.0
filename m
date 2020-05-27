Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBUWXXH3AKGQETHYIMEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCEB1E43B7
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 15:32:04 +0200 (CEST)
Received: by mail-qk1-x737.google.com with SMTP id x22sf6364945qkj.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 06:32:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590586323; cv=pass;
        d=google.com; s=arc-20160816;
        b=y208YYYnDaxk1GgHAy+xm+vRk/rVhhMQRCS45bKiKlPlgB6U++juonk6l5Tn7kIrFu
         3/iB0AfZd4rEnPD1KoVrbSQM5RnU4UFbZq+IV9OEkO0gMS9JW2Jcrfk3m3pdw5D+DBen
         ZHAaLISJ9W8vZbpycLmnpvdUSkN1a+swD0DTIb19SfEcX0fzrCMnhdxwpJayRmoJtLSi
         aWRwXaxAK9eoTJxHFc/HQePndKBU/yRm0wr3a+rgH7dT4HpvYErz++a8A+D+WSdMyjVf
         2oxsI8RQtUqdR1uQYyufGGxLa9Y32VfTz+F42hef2ySS3pWCXUqF9YUNgbFB32FzdxHS
         3wXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=5/84c9l6oUWyXKBTFwo1ZN81z+a6qAU4zDwQhRl5qAU=;
        b=e8ccyiv7HOY1PrQD4CFmRomewYyRDT2jEo1XaDTTzwZ+M/pRy2a5o/YSkRBu49bWq9
         BP8WAGKx2haxCLRhPA6Not83mC9yyJiUIrRYEKnOktE8WEUgPuNMzdWnB5EHNdG2kDbf
         7wWcxcYGy8sVcJfATg551/7gRAriyNvtYCPkDvnookWZi7wAVHX0yzZucpCbr9QYwc5z
         W+e1tB4yctAmY/12s8wVOMtT0bfSVNIoUOWmx3+DO2eHVyzOkT1UTkadNCOrxweciVYC
         LdX3YST3KNhXBefntHPtpGux7Xm5Do0nzjar1pT1c4UHK8inJGaMN3uhrqMmwkrGauQh
         JH0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="u72hP/a1";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=5/84c9l6oUWyXKBTFwo1ZN81z+a6qAU4zDwQhRl5qAU=;
        b=eIhko8fYcO7V5eW9tGpiY25VhnGHtl6DZKq7qtls7NxQpzpVhEaJhWOJWHYZaZRCV9
         QH7lXSkAftSoZCryacQqY/ru+nta6pgcfWwXy4QJjEFlZxIlj8MIPbG2fWfwfpamX+X5
         2H5bXi3FwtE9DpfYghu5HDpLUeeCoRFEHrOMdlhtSVTeXnIkXDF1an/5FjywR6UXFro7
         oywfOMCMFOn4AbwOdAnTohQfRseZumYqBHDsdrqHk2t0JMWH1C8m4An4O/osequMfDVi
         eWaC0X3rU4cUDsJ/nECOaat0tHT7WCZ3ErszxGo+Fc5GCQTESOY7e0cu6DJpwUKNpLqh
         75qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5/84c9l6oUWyXKBTFwo1ZN81z+a6qAU4zDwQhRl5qAU=;
        b=XD79E44gGmkLayFfzAwZlRc9BE8ODkWICl66Gijlw1U1cNsLJ/oU94YcHmjU8GZPyR
         TR6UWUIyUt1hsw/KGAkcPSS6/Ow38NtwTKSMkJNb9ttItl3M1J331cKjDUY558bJCxA8
         W2zF2ZFzh+lJ+hWMpRx+mkP2rwqwlDPc6RlsEA1BEGUBLaC5V1QQMDnWBn0pCEwBWW2d
         /Vlh2txYrszhzNmwhpCFUNr68ZLfObqc0a4ch+PN/hT2mIv3jZ/MLxdfahVhYS0T3uE8
         7P5sW8CdSSZ0+79OrzyMHkCavgmxqVx+zvV3MfjoaskKOM++0MS42IGlDJG6uZwZ+VYO
         BhKQ==
X-Gm-Message-State: AOAM533xYqMeqs+OcYaGG3T3wRYwc/5B7FP6/vkFhDhIun2yTCwtnWcP
	q9vQOdh63vo5UpguZNWtyp8=
X-Google-Smtp-Source: ABdhPJwR+i1UcMyKGM3lKshb1cA5JTynphE2s9OIs30YB2LWpuC99EIIeNKgdQHRSvjBHfS7rGRWcw==
X-Received: by 2002:a37:4e02:: with SMTP id c2mr3745374qkb.97.1590586322347;
        Wed, 27 May 2020 06:32:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:4f92:: with SMTP id em18ls3410929qvb.11.gmail; Wed, 27
 May 2020 06:32:01 -0700 (PDT)
X-Received: by 2002:a0c:db83:: with SMTP id m3mr24725892qvk.40.1590586321041;
        Wed, 27 May 2020 06:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590586320; cv=none;
        d=google.com; s=arc-20160816;
        b=IV0VKeBeeLZYRPWVv2S57WvUeyuE/nIIr1tcnCaZMgZRpW82Qdvve1yJwHe7ihblwa
         W/zOfQogIBRUMfvoc5mKn+H12/FQQGkrrCxxMlTWWwlR4Sn6a76c11Ydw1eRrN/3uxw5
         dK+fFZ+SXCGx4BqzkG7gNmchby8mBC4d+I/+JNUKO72XDFeSRwFAOW0Jwzcwpz7mUo0Q
         wzUp/1Lz/LUPQrzj862L3vMiOfvlW53g77jQmKAfC8aLkiqODQA5KDeEtnVeN+zs6wUa
         XPJyRz15EyP115UQlTgniBKRC3FERqnZTI6TwfKXVVilovLrzZOWlpMyDbYcnsJmyTmd
         /PVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=wYT8gGIcZRa3MB7nLyKr9WpvoWxIKZksOZczinifdMU=;
        b=a8nvmNqNOZ0LlRPYN8JdnBBDH2EiAasow0BCJpNM0INzsJCIDKLKaknwRxdiiqE+w8
         xMicfLE375Yheu95XXdgYdWKBWj4X2l+cids1ATXnJ5u8UeGS3cje+uyMYA7UfKELvt4
         HDDS7vIR51UA3QG6gFmRHIkODV7ZQreDQbxRS19UYhCleTyQ5iIpswxG6yQ3C0ai8C2v
         MkhYbaU4apgzkI775MsRQRrOOBaSNOgeGuT2syJBkLjsSjgjon9TbEmBGgIwyuD5wU06
         B9J0KYWKdkYUb3Y6IZuLJyHCOTmu0ux1lXsk2MDlPnyJ1xK0P+vmJVBns63dXj8dBfQ3
         R8Iw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="u72hP/a1";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id n23si232154qtv.0.2020.05.27.06.32.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 06:32:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RDW04C024189;
	Wed, 27 May 2020 08:32:00 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04RDW0OO106914
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 May 2020 08:32:00 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 08:31:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 08:31:59 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RDVv5J116666;
	Wed, 27 May 2020 08:31:58 -0500
Subject: Re: [PATCH v1 1/4] configs: k3-j721e-evm: Describe separate IVSHMEM
 regions for demo
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-2-nikhil.nd@ti.com>
 <bb32dba1-73ca-e01c-f894-e24f482516ea@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <b1ec21e9-b341-0634-2ca9-90891d156e53@ti.com>
Date: Wed, 27 May 2020 19:01:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <bb32dba1-73ca-e01c-f894-e24f482516ea@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="u72hP/a1";       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
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



On 27/05/20 6:58 pm, Jan Kiszka wrote:
> On 27.05.20 14:32, nikhil.nd@ti.com wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> Current IVSHMEM regions are described to be used for ivshmem-net
>> driver. For standalone ivshmem communication, these regions need to
>> be added explicitly instead of using the macro.
>>
>> Add regions for a 2 peer IVSHMEM communication
>>   (0 = root cell, 1 = baremetal / linux-demo)
>>
>> Also change the protocol to UNDEFINED so that the ivshmem-net driver
>> does not get engaged. Switch bdf = 0 for consistency across all
>> platforms.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>   configs/arm64/k3-j721e-evm-linux-demo.c | 33 ++++++++++++++++++++++---
>>   configs/arm64/k3-j721e-evm.c            | 33 +++++++++++++++++++++----
>>   2 files changed, 57 insertions(+), 9 deletions(-)
>>
>> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
>> index cda1614a..b6a56e2e 100644
>> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
>> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
>> @@ -56,8 +56,33 @@ struct {
>>   	},
>>   
>>   	.mem_regions = {
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
>>   		/* ctrl mmr */ {
>>   			.phys_start = 0x00100000,
>>   			.virt_start = 0x00100000,
>> @@ -212,12 +237,12 @@ struct {
>>   	.pci_devices = {
>>   		/* 00:01.0 */ {
>>   			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> -			.bdf = 1 << 3,
>> +			.bdf = 0 << 3,
>>   			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>>   			.shmem_regions_start = 0,
>>   			.shmem_dev_id = 1,
>>   			.shmem_peers = 2,
>> -			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>>   		},
>>   	},
>>   
>> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
>> index dbf0ca7c..0be0e19f 100644
>> --- a/configs/arm64/k3-j721e-evm.c
>> +++ b/configs/arm64/k3-j721e-evm.c
>> @@ -98,8 +98,31 @@ struct {
>>   	},
>>   
>>   	.mem_regions = {
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
>>   		/* ctrl mmr */ {
>>   			.phys_start = 0x00100000,
>>   			.virt_start = 0x00100000,
>> @@ -396,14 +419,14 @@ struct {
>>   	},
>>   
>>   	.pci_devices = {
>> -		/* 0003:00:01.0 */ {
>> +		/* 00:00.0 */ {
>>   			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> -			.bdf = 1 << 3,
>> +			.bdf = 0 << 3,
>>   			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>>   			.shmem_regions_start = 0,
>>   			.shmem_dev_id = 0,
>>   			.shmem_peers = 2,
>> -			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>>   		},
>>   	},
>>   
>>
> 
> Do not disable the veth link, add the demo device instead.
> 

Will do. Just to confirm, I'll keep the bdf 0 device for VETH and bdf 1 
for ivshmem to be consistent with other platforms.

Regards,
Nikhil D

> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b1ec21e9-b341-0634-2ca9-90891d156e53%40ti.com.
