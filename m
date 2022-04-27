Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBNOXUWJQMGQEHBUDSBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id C8715511C47
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 18:13:42 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id l16-20020a2e5710000000b0024f0c34eff1sf938513ljb.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 09:13:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651076022; cv=pass;
        d=google.com; s=arc-20160816;
        b=VSuaXDrkTh9+rzxaYB/9L/cJXGMm6SxWiVBCueFms9ntf0hX5UbaOiEJBoMUynfCuv
         ZyKLgfXK7PfHsuwdwYgSrCNjmHFLLE6i7N2ljzjWjeTYw9H/+0n1mvahYGya8w86YJKL
         y+QLrbvRwYPsDr2y8jx1Qpd/Zk9apMj4IacHWI5LgjGHVGKIshzDOvEXcXRosNCG889Q
         PcsNc6fltqtjw9DNTaQbE6Jdj6CBZsSfLdiLhR+NKlQUFAjgRMLuxnAgkJzI/4pdojHq
         xwQUWyeHtU37WGZYM7hVqHmHPsLj3KL7CaNSa0tTCHC6aveN+ess9C9luMFGhZaYnzGZ
         uWbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=8AjunXkFsksNDEDR3wmmcknLPAdH8/v7xk+rwj/2EOo=;
        b=CeECw3A5qK5Ch6OwPStgUEf231uQuahFzdN3Lb0nkuWEhIcsufLshKUQPQ4ZTlY/Te
         EFCsNcmQ9UcA5mbnE2KtXCMYYU7sESc4zT7T+ujRTKJ5PbooGHlF3BptXXxJie0Tf7KJ
         VNQAARpQ/US7yqHGuNgarFaqu9uYFswZ4ZhvdYqUxAy9BJsKEhWWedsKf87SVFG3kdAa
         7Fm4RJT9n4BQsHSJxThe/lIUBC7xaLi73eXUO+aAUT8Cp44y/eJ4qQYsnKx66MrAfPVd
         EzcrJY3hWQ30Mq+aJJJE/cdn2EP873DF0gmFgbo8o0lkixzpIBmjrfIg2kFXxXMgw7Y0
         4LzQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=Qd2nsDBX;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8AjunXkFsksNDEDR3wmmcknLPAdH8/v7xk+rwj/2EOo=;
        b=c4aTsuC+LR3BOWVK2T5F/GojwfOoKCwuMZ3WSuQ3uQ6FCbvMt0L2yOX8F3k7qmu5wj
         e5inCz1f5k3Al0ynHyZw6P3cXyvuFyXREtYrJIwOuqbfGL6EJl72XTKQM+uvDOemgrqy
         JU//p4BSf4BtmDms/+cFg83/Sv1cdhVMbhUMCnVTvyEMkPfOfWZaWugROKHph5C+NS99
         MbJAo4+97ni3vsJaIiJhXS/ESSWMb9PsZ3hHLDfDo/hhCx/5sKL6Wafn2/Y9wDogYkoA
         O+HX3LgaFY+xpEz36dBX7On0ZoG6D4ERUtNMdrtZHpaeA4vpANb3YR5uFPTz77drMxEf
         ertQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=8AjunXkFsksNDEDR3wmmcknLPAdH8/v7xk+rwj/2EOo=;
        b=M/4jyf8MbRxxfZmVZ8QeiFyquki3Laj3Z5d0/fLlxdyTTo4ZYUsbcVDrM5Zr8AxwCF
         zCL/Q2zQGAqHSbfG2u8iGK+QaxBTJwaZCttvqAMJdTmB5la/lJF1rLdQXIPJn7vqgCLy
         dPJh128q9l6T7bCnPhQQkOlo0XSvWgARf6QjyZrVAxCCAtprKnM6EByGV0GfrVFp1XE+
         ALeFCF86L9gjGRJQlKZme2PARNCUacnXuc2iI9cfgTaZOvArXRAEJBJpnSMHUJI0s06N
         wNQY8CJw0GEzrRSgKmN00WLgjk+pruNguzEWTGoWnx5F4morhVcHA8uhEQwopjIX095V
         3Lqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Lh+uJ77qlORYbL2L82QqAoEwcbNVNIjSJYJAeUjMgbc/zhsa7
	nqU7+9jBT+OgEU9FssTKg38=
X-Google-Smtp-Source: ABdhPJy3ETgwx3zZA0qBmnuoSDaAgu/Y6d73s0gRHPU3l8HTRMM3wyKDMptFZU0RxvebiEL0MEuasA==
X-Received: by 2002:a05:651c:889:b0:24f:2336:1b95 with SMTP id d9-20020a05651c088900b0024f23361b95mr5372798ljq.345.1651076022274;
        Wed, 27 Apr 2022 09:13:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f16:b0:449:f5bf:6f6a with SMTP id
 y22-20020a0565123f1600b00449f5bf6f6als2372842lfa.2.gmail; Wed, 27 Apr 2022
 09:13:40 -0700 (PDT)
X-Received: by 2002:ac2:5f4d:0:b0:43e:da3e:4529 with SMTP id 13-20020ac25f4d000000b0043eda3e4529mr20672056lfz.627.1651076020204;
        Wed, 27 Apr 2022 09:13:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651076020; cv=none;
        d=google.com; s=arc-20160816;
        b=ktxF9AqQkWvH2tjLICFpog+ALLP1+GiKun73CM5uvZsa6PYkmFIKYJYaTFhKTJMbYc
         KiyOZ3TyQSRwHX2IjMRoy7zfhvwuxZGLzNUxAwkzYvgeNFqSzcF1GK7NYHyk9+8MER8C
         RNfIeG5HnTcWzD4n4W1PM8E7Dj2UUN+HztAmJ1ArwLD1PPNkMcsiATcw9faPGqjyHhnJ
         usk1AYCBLAZFvYMbAFgisL3pGhmcb1It/TQPCtZrIywp4PIF+RMRkPfKGgHBBdPfU+BO
         xjPJ2IC7Lj5W19nehDXCWigoN//RbqCDDr2ERrnWzaSG9XkmhVyxLCJ3QgOXCXfwGDvs
         r6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=njj7Mz5q4ytX5NiG0NUM0OZ9wQ8hTZcuqf8TyspBgmk=;
        b=ncsl2FE1X83tSN2+EuPW7AZN8uzEwOCv8MXbiD6+8sFn5HqHtbnj8BFmMRfJuLaAOy
         Qz0euPWgT6QtyHR3L8H0n1TFJ+MZY4og9wXhtlwRbKKAXlN8MfxEjRflSGOM1PeJUexD
         Ztu0k9FTiCfMbyAfrpJBfCzwiVzxWHoWiL3bIAaoFzzEPugjZU3vsfeVzAja40Qk+sR5
         5zoggKdk/M/+NP2nSPrg+SSF+4rNUbu4z3rIITrqRK2Ez2CslNHlMze9Zt1R9iCXQip+
         aqI5T1k1Ok36+kv2Vmn15JACQTZywnkq4JmSiOKBtgEAXcPsjqpAFHa9hwPH/Y/K7arQ
         FnmA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=Qd2nsDBX;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id bp23-20020a056512159700b00470f8f82ce4si97994lfb.1.2022.04.27.09.13.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Apr 2022 09:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4KpP1v18fWzxxQ;
	Wed, 27 Apr 2022 18:13:39 +0200 (CEST)
Received: from [172.23.3.112] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 18:13:38 +0200
Message-ID: <2e24bb64-4111-a75c-1ed2-c79a717b5500@oth-regensburg.de>
Date: Wed, 27 Apr 2022 18:13:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [EXT] Re: [PATCH] driver: sysfs: Replace default_attrs with
 default_groups
Content-Language: en-US
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Stefan Huber <stefan.huber@oth-regensburg.de>
References: <20220426172222.1910982-1-ralf.ramsauer@oth-regensburg.de>
 <c2c4c771-6772-9511-4b47-49e2473d5531@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <c2c4c771-6772-9511-4b47-49e2473d5531@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=Qd2nsDBX;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 27/04/2022 08:26, Jan Kiszka wrote:
> On 26.04.22 19:22, Ralf Ramsauer wrote:
>> Since Linux commit cdb4f26a63c3 ("kobject: kobj_type: remove
>> default_attrs"), the deprecated kobj member default_attrs is gone. It is
>> replaced by default_groups.
>>
>> default_groups is available since 2013, so simply switch to
>> default_groups, without (hopefully) breaking any older kernel.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>   driver/sysfs.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/driver/sysfs.c b/driver/sysfs.c
>> index a604afa4..f91d5ac5 100644
>> --- a/driver/sysfs.c
>> +++ b/driver/sysfs.c
>> @@ -180,10 +180,11 @@ static struct attribute *cell_stats_attrs[] = {
>>   #endif
>>   	NULL
>>   };
>> +ATTRIBUTE_GROUPS(cell_stats);
>>   
>>   static struct kobj_type cell_stats_type = {
>>   	.sysfs_ops = &kobj_sysfs_ops,
>> -	.default_attrs = cell_stats_attrs,
>> +	.default_groups = cell_stats_groups,
>>   };
>>   
>>   static struct attribute *cpu_stats_attrs[] = {
>> @@ -212,10 +213,11 @@ static struct attribute *cpu_stats_attrs[] = {
>>   #endif
>>   	NULL
>>   };
>> +ATTRIBUTE_GROUPS(cpu_stats);
>>   
>>   static struct kobj_type cell_cpu_type = {
>>   	.sysfs_ops = &kobj_sysfs_ops,
>> -	.default_attrs = cpu_stats_attrs,
>> +	.default_groups = cpu_stats_groups,
>>   };
>>   
>>   static int print_cpumask(char *buf, size_t size, cpumask_t *mask, bool as_list)
>> @@ -342,11 +344,12 @@ static struct attribute *cell_attrs[] = {
>>   	&cell_cpus_failed_list_attr.attr,
>>   	NULL,
>>   };
>> +ATTRIBUTE_GROUPS(cell);
>>   
>>   static struct kobj_type cell_type = {
>>   	.release = jailhouse_cell_kobj_release,
>>   	.sysfs_ops = &kobj_sysfs_ops,
>> -	.default_attrs = cell_attrs,
>> +	.default_groups = cell_groups,
>>   };
>>   
>>   static struct cell_cpu *find_cell_cpu(struct cell *cell, unsigned int cpu)
> 
> Which kernel versions are compatible with the new API?

With the latest v5.18 release, it becomes mandatory.

I just successfully compile-tested v5.17, v5.16, v5.14, v5.10, v5.4 and 
v5.2 (the latest one that works). Latest LTS 4.19.y and downwards won't 
compile.

The question is, if we want to demand at least v5.2, or introduce yet 
another workaround.

   Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2e24bb64-4111-a75c-1ed2-c79a717b5500%40oth-regensburg.de.
