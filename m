Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZ7E7TYAKGQEBPZG4KA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id D698513C812
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 16:40:23 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id f19sf4263356ljm.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 07:40:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579102823; cv=pass;
        d=google.com; s=arc-20160816;
        b=p3d3oYDAhW2/rReoM8NGjSVSNX5M/xD2uIHCzQQn7Gg4T5zI2ad9MVIxAs0RPcnxbW
         USVTnAoAds/bEqJMK1QZksehA83N3CLVRz8+qr21dbZySXb0aEwi+YtZDnVXC0EAokVv
         XlLb3ELJWkbrhV4p+xlwd0X908Z4E04TXF7hPribh2+qi33MRdDZQhofzhMRoL5blBmU
         eSkrf0aU+qy+wuEBhRWxlFiTMi9W0r8CCbvNoHQvCH1HkdDdbpsULy6caoQVwEEu4IBL
         2PhogxY99t1i74l252xaDOBNOs0ctgsqqgP+j+ejXx9MJVoSeVbQoSw81nj+IRjS/qh6
         k0FQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=AROMFtSYsLVplakE/5nrg6j9VUuLT2z9iWYRwOFpCDQ=;
        b=W8P9Ps6ZJshaZ+bsSiau6IjdAfGGYVDui0SCwFTSYgnoEimYc7R/MKdHV28WDV+6PX
         zvp0vm1hCPVCqTbiWt3WqPAqhkXtiTM/wOVQ3I1fqe99zGwes2RSu4OOjVMybvLeUanx
         Uw5MVatLpJ2jVxbfN96i5be4dTLagvs3HoFi7Ss3Ts+wT35JeWt9s5Xt0qj6jjvzIUhj
         Csq8UjjRIF/uKZqSGlLE3bqHM+0MIslPnawFWHshVtACU6dkJabAhMbyk16j42W4WnyF
         +KYS/WjUULdnQJdRtpoWPsRSna0VX/cjJph0dGmi0WEvYWgVTaoSf3rHP7baUlfR70AY
         y7zw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AROMFtSYsLVplakE/5nrg6j9VUuLT2z9iWYRwOFpCDQ=;
        b=AHWlJS6Hy8H/E+/GPj6/SQeSnrpgn8BV7Uuwn4NBkw1XH2LJjgTzhqNxxpoipJEfI7
         aW3umtEOilMbcfT6/OmdQIMbzD323fj+r1e+5jwGQKwPmtzlIMVHMiUGVaCbtzTmWzR8
         a8mVqCrhVXUfNZfLoM6IPDIzUQtqzXN47vdv2HuwTXJgUCAmswIuD16MNpXiMA4lNzeJ
         mMmKrAj1iJjBdkhdScF9A98EB008VyqcSKy63LsDbx17Wm+yy5uxYKVy+rIubU1xeTrb
         xSWYLXffJz7wFo6ruzmi6ytvA+faSxyTwCfbP9N6ejfbAAo5YR2RCkI7BmOSPn849luc
         zDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AROMFtSYsLVplakE/5nrg6j9VUuLT2z9iWYRwOFpCDQ=;
        b=S9D485fjvgXfizJ0eur7wa60N+WXOREGdK0N5HHxUvTHitULVRf4YV+xLNDZ2D4BSK
         4O9DNNpW9yImNbGcKUvjXgxdecCkZCDp2VJRZylVQF2/NlAkHpObZKuIVT2JhbI/JnGZ
         r1KoxqihypH2COU76ELQjQxP0Sgcu7pzUD4W97XA3CKo0CjWBEHcm7F0Zf56BeG7q6Cb
         InSJCpPtJDVFeXw6jGvO2IgiJSwyC0zGqaM4pN1abnIoRTtmnu5zgF2gmnrBDElbnVmy
         qoylK3uba1v7UIXGwH1aDSSIOGXV8SMqmpfbNceraimMTgtZFFvmKo/SnHz8s9ekg97P
         cqsg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXtqH58dYKa+KZZMbTImjSHHulqpx54BJFsRq9R2/z5PE2bhftc
	bKRUzwKQCzu9m8LyDKL/uBY=
X-Google-Smtp-Source: APXvYqyvw/TGXmB0LOHySXVNH1MmpHrOnWqgavSVXuDPpTSxyl2WCaFcY+7ueEp4FEzJ7tvWZ03HDw==
X-Received: by 2002:a05:651c:21c:: with SMTP id y28mr2141914ljn.164.1579102823446;
        Wed, 15 Jan 2020 07:40:23 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:95c7:: with SMTP id y7ls2700787ljh.16.gmail; Wed, 15 Jan
 2020 07:40:22 -0800 (PST)
X-Received: by 2002:a05:651c:111a:: with SMTP id d26mr2201163ljo.153.1579102822633;
        Wed, 15 Jan 2020 07:40:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579102822; cv=none;
        d=google.com; s=arc-20160816;
        b=bKFyWHrL34qwBYlJuJsKeapu1MNkgfXw1KAFgBE/xgQJ+uSnmmUNHezpvqwC2fN/iM
         pKuSVYhi0v1ZcSxBjBwpY8Ebn8FMvPmAhpWQUL57iZh5GooAzgFD+qA5rSA7HY8itcYA
         Mu7qB6GF3VVanqPQxYSf4GviXxpcL1PQrd1WpVqUUOgoK4qGdk79rfyjn4lQlMsUqxPW
         j2XDuQvy1Drig1Bdnw7lQrc20ZF6B6MuFTh6gHNElj1/FaUwV7+fJ7Wn9Pfe6fH+KY0e
         fxbzICAvJRrnGR27CAQHvSRCrsh3xhNxrxYtMZ7pMSOsybv/iu3/pH3apWXHdSTS3OVX
         4kPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ZJKd1bvz1oo8NV53AmgWnFcWzRizWxydfJbyDv6AJZ0=;
        b=Q3NCEgLMIukrDemQPy1OfKgvcm70OcgfPpcsrHJtmbYhMgYwMZX8a8gNeNyB46i8nN
         wVOhQTwR9PXRoy5VnYAE9zph7uRAxs7fyuCJ7wMiZEkwjUa8LkibBZw2hC4AK1aBXCTw
         4pCR8WTvCqJsC0CKGc19ENv9TksXEJWiTRG9QKc4yTdDdvG13pCkKRmDhm0XvuTkHMSd
         zb3wpaBFz8Fh5YVjTOSAXJXrds1Krwua60jdkFpemY/1whl1t+WJ8byBk66jYKQ592sb
         NrKQ7FEao7VAz7BFMAKivg3m9mTN95doCHDQME68hZ2W3vW75Gs3pOzZgc396PO01Ypj
         zpQA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id o193si863034lff.4.2020.01.15.07.40.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 07:40:22 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 00FFeLOm022179
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2020 16:40:21 +0100
Received: from [167.87.12.136] ([167.87.12.136])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00FFeLV8001742;
	Wed, 15 Jan 2020 16:40:21 +0100
Subject: Re: [PATCH 09/19] inmates: Make PCI support generic
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <cover.1578320435.git.jan.kiszka@siemens.com>
 <160f838caa791fe4eb725c9b249c74e5de4fc559.1578320435.git.jan.kiszka@siemens.com>
 <7e96dc43-ea5d-5780-8a9e-f211348cd57b@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <41769cbb-832e-ead9-b062-663069ed2221@siemens.com>
Date: Wed, 15 Jan 2020 16:40:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <7e96dc43-ea5d-5780-8a9e-f211348cd57b@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 15.01.20 15:54, Ralf Ramsauer wrote:
> 
> 
> On 1/6/20 3:20 PM, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Provide PCI support for ARM by implementing mmconfig-based
>> pci_read/write_config and moving shared defines and prototypes into the
>> common header. pci_msix_set_vector is only implemented as stub on ARM
>> so far, can be enhanced later.
>>
>> As mmconfig implies mapping of that MMIO region, pci_init is introduced.
>> x86 does not need it and only implements a stub in order to allow
>> arch-independent inmates.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>   inmates/lib/arm-common/Makefile.lib   |  4 +-
>>   inmates/lib/{x86 => arm-common}/pci.c | 96 ++++++++++-------------------------
>>   inmates/lib/include/inmate_common.h   | 34 +++++++++++++
>>   inmates/lib/x86/include/inmate.h      | 32 ------------
>>   inmates/lib/x86/pci.c                 |  4 ++
>>   5 files changed, 66 insertions(+), 104 deletions(-)
>>   copy inmates/lib/{x86 => arm-common}/pci.c (51%)
>>
>> diff --git a/inmates/lib/arm-common/Makefile.lib b/inmates/lib/arm-common/Makefile.lib
>> index 669ff485..8a4c2237 100644
>> --- a/inmates/lib/arm-common/Makefile.lib
>> +++ b/inmates/lib/arm-common/Makefile.lib
>> @@ -37,8 +37,8 @@
>>   #
>>   
>>   objs-y := ../string.o ../cmdline.o ../setup.o ../alloc.o ../uart-8250.o
>> -objs-y += ../printk.o
>> -objs-y += printk.o gic.o mem.o timer.o setup.o uart.o
>> +objs-y += ../printk.o ../pci.o
>> +objs-y += printk.o gic.o mem.o pci.o timer.o setup.o uart.o
>>   objs-y += uart-xuartps.o uart-mvebu.o uart-hscif.o uart-scifa.o uart-imx.o
>>   objs-y += uart-pl011.o
>>   objs-y += gic-v2.o gic-v3.o
>> diff --git a/inmates/lib/x86/pci.c b/inmates/lib/arm-common/pci.c
>> similarity index 51%
>> copy from inmates/lib/x86/pci.c
>> copy to inmates/lib/arm-common/pci.c
>> index 06dd193f..99210c21 100644
>> --- a/inmates/lib/x86/pci.c
>> +++ b/inmates/lib/arm-common/pci.c
>> @@ -1,7 +1,7 @@
>>   /*
>>    * Jailhouse, a Linux-based partitioning hypervisor
>>    *
>> - * Copyright (c) Siemens AG, 2014
>> + * Copyright (c) Siemens AG, 2014-2020
>>    *
>>    * Authors:
>>    *  Jan Kiszka <jan.kiszka@siemens.com>
>> @@ -38,21 +38,32 @@
>>   
>>   #include <inmate.h>
>>   
>> -#define PCI_REG_ADDR_PORT	0xcf8
>> -#define PCI_REG_DATA_PORT	0xcfc
>> +void pci_init(void)
>> +{
>> +	void *mmcfg = (void *)(unsigned long)comm_region->pci_mmconfig_base;
>> +
>> +	if (mmcfg)
>> +		map_range(mmcfg, 0x100000, MAP_UNCACHED);
>> +}
>>   
>> -#define PCI_CONE		(1 << 31)
>> +static void *pci_get_device_mmcfg_base(u16 bdf)
> 
> inline?

The compiler will do that if appropriate.

> 
>> +{
>> +	void *mmcfg = (void *)(unsigned long)comm_region->pci_mmconfig_base;
>> +
>> +        return mmcfg + ((unsigned long)bdf << 12);
> 
> Here are whitespaces instead of tabs.

Ooops.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/41769cbb-832e-ead9-b062-663069ed2221%40siemens.com.
