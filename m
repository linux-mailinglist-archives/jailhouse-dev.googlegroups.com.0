Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRPE7TYAKGQEH2TJZQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C1F13C80E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 16:39:50 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id m133sf55240wmf.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 07:39:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579102790; cv=pass;
        d=google.com; s=arc-20160816;
        b=gS1Imzqs8HznoxnhMXKjYixp2EqUbLhuncbclOA6/h/2h9TEOIb5eUCCccEXXaNMoE
         bJN4Pm01skPonatW27vRHHTjCPEpNvjOJTiw/e8nUmyawQRuSjuizEEa7ZpCCBNcv9eb
         NH2p7i9qwvGJ8QSsbKepsKaMbn4z8DqF1ZDF2XW3+Jh4f4mnCuWBKZS1yF9aC9dqTmpV
         AgAoO0V1JEfolaW5SOcPE908fyuV82M2B8yimal+6voxwJAFpQATpCIx/3Ncmumcuk2r
         k7A9p3E6lQH222EtgEnNHcEpV88XGgifpNYv3gh0JHQZP9ZgeGaPp1gnKkXXpT6AFnqY
         PiVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=v38lOjMo9Vz7AizoKSAifd6Hx1nPXYGPHFrrtUmFcK0=;
        b=fvIP1A1H6moyUb7zXslZlsJrOkveDKwEZsum38FsD6POZ28vOUf5Qd3XC+htnZWPhN
         vSwXdhGahlF8xmm3vI9iUJVSPV3A6jRosrntReRKuEIOI1TlHYpZOj098pKQ2KP3XNwr
         by5R8wqOI/5MLnIiHBEJNRD18bdRtykqjbc4kZdz/6vEQ5324hQ2CfbLLEjPxkZ6stOM
         yovQ3dSnYfaEpzroXjRjkgTxc4e3tR+8L5UASgzmZU+dkDigouGZ9rIdDYWPXKdv4hGz
         H/NXpBFc4mT+1dU3lYp7eM8/yk1sC4icyAKxPue3DQLZ/PtD/osgXL+K37IX40Xl6oZc
         Nd9Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=v38lOjMo9Vz7AizoKSAifd6Hx1nPXYGPHFrrtUmFcK0=;
        b=Bt5fUWzueXSe/aFcKwETBLiaBjhbCKX3Ec1AXK+Xv3tikY+FHqlXr8ms2rmFmvcckF
         FT9n9sHDoA8yVxhOp215U7p9dMU25VWotrdASIhVIf6hpM/pnzZ/se7Zc1BoXztLNUP8
         sEU1dqu4u6cT6X0Xm3pFDra8bngUTmosrchJI8NDj637aKNC5aw4GlSuy2zTZ7bRMNs+
         Pse7d5Ih/l6cHPGtRe3k58WDhwvHBTOJ+DP0uIJaQVNx6KC0zvZbVB4yESIN4rVBNJI1
         KfZWPD8v8z2MhM9HZebjaedtCAlc+bQBuLYLH+cRmw4C0/fyTXI9iSxzIqD/g7qtcd5P
         qJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=v38lOjMo9Vz7AizoKSAifd6Hx1nPXYGPHFrrtUmFcK0=;
        b=B6IIKKPjLZwmeTvxu4ZSPOrr4ihqal5TyNkUi6Y/Xf8gVjNeDRoP9VerZlZUQkRjb9
         oPaeBJTz1hz78ECB4s3IZ81cZrtKYM4sg13/aZB2v3cvEOcKI6AyWmNEQfaLcUBDAW8N
         pxpTgemvvZg9bdUKs1s5sEtSIAI6jHeN9kkdypSzC1d3kZ7QrEbBCsK/t0N4TVztAVHC
         HX4bOUI/ZpJqYnAl2RUAnYFAbzwc/Sz7BwtI43CZctAxAMEvifR4iwdfcjI9shzBdf1v
         NOgzkcq2VsO6fyfsB4Qk6fQgbjfW3RtdwsuDhw1+uaHaBNJiMcrbRNzjkf4T9qmGSY1G
         eIkg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVFWvQ4ARGa8TeFUfcpR4tcIl8o+BTJkPndqlepwZdoPsvUKoxb
	fmRw/BB4F87lx3MzFqfdw6Y=
X-Google-Smtp-Source: APXvYqxIsC8sEmvkWGwJRkj41JQLbXv36ZwEcjwxPB2K0yC1JS5JKMhh4aupb8HjzNeGjSFqYmZ/1g==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr31816048wrv.198.1579102790117;
        Wed, 15 Jan 2020 07:39:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c3d1:: with SMTP id d17ls6956294wrg.10.gmail; Wed, 15
 Jan 2020 07:39:49 -0800 (PST)
X-Received: by 2002:a5d:4807:: with SMTP id l7mr32415689wrq.64.1579102789395;
        Wed, 15 Jan 2020 07:39:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579102789; cv=none;
        d=google.com; s=arc-20160816;
        b=YC8UpisaDSUesUI5Bolmcl9Rq3c6geg7bZDHx3UdDXsxCtVQhtYr2xbwMkBvJHHfa8
         O1Y3jz2VB+BvJgydKNK1cZLqmPwu0Q80PlJPKzAP07Ly1nGJJ/pBZSRBjkpPRun3Rdqv
         EFfBd9ZUY3rFSzsGiFeiWvl/Yu8GK9OX4mjXFx4m6bh8c5L6avTQuIcDsT7MbjZA/Pwu
         95Gi6IbdIt1yxi71PZKhG2YKc46ew9tZ/6qxR7hTCYbruzpxsGMLNuWpYRAEzrMAhENZ
         ix0XSGg5uwRKWR0ZtnDpGsjJT9lt4sEMxy0/z7n65AP1/EL9azBcS034fyirzOicmwuO
         GRfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=+iI2QOVUoMoOWAXd/d2oUeHAojJACitFi7gRlvTyido=;
        b=PTEMVAnTTqgCFluAstZOqzFEH1afqoAgazqOqEuO05J7aj0iTCR/45K6n0lydDWMUz
         HUb10kmfl6KLBBfDvpSQ6pvChnvl92VLgkh3lwXslvvW6z44zuNuCkLF8xp2UmrUadJm
         LbhIWJ1Wlgs+/g5W3eqLPW3NJCfiAxpYNYuIbvJme+15tMr6zuwQYP7bhb4eOtwaKQ31
         MTm3SpLIg01fOge7lvCF3aHSePgjsNyg5gndhQrpwJDn88Mx1IxJahfdkd5Gkg7V4Mr8
         zD2ksXP86P12eKiwxYsPXuwo0AW1//DsveGOFnYFbjgyNAbTDGNUky3tz3p+q1f/P+4a
         tuSg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id y185si8673wmd.2.2020.01.15.07.39.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 07:39:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 00FFdm8p021182
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2020 16:39:49 +0100
Received: from [167.87.12.136] ([167.87.12.136])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00FFdmOG000612;
	Wed, 15 Jan 2020 16:39:48 +0100
Subject: Re: [PATCH 12/19] inmates: Rewrite ivshmem-demo
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <cover.1578320435.git.jan.kiszka@siemens.com>
 <3d123343f83d3b1ff2ed4038ab4289544b7fac23.1578320435.git.jan.kiszka@siemens.com>
 <685fe5b5-e63c-7996-fb87-f403fd7ea3dd@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <369ee7e6-136a-f808-1e1b-c3ba6ae1b31d@siemens.com>
Date: Wed, 15 Jan 2020 16:39:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <685fe5b5-e63c-7996-fb87-f403fd7ea3dd@oth-regensburg.de>
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
>> Provide a bare-metal demo inmate for the new ivshmem device, exploiting
>> almost all its features: state table, unidirectional shared memory,
>> multi-peer support, multiple interrupt vectors. This demo will be
>> accompanied by a Linux tool in order to span 3-peer demo between root,
>> bare-metal and a secondary Linux cell.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>   inmates/demos/arm/Makefile       |   3 +-
>>   inmates/demos/arm64/Makefile     |   3 +-
>>   inmates/demos/ivshmem-demo.c     | 227 +++++++++++++++++++++++++++++++++++++++
>>   inmates/demos/x86/Makefile       |   2 +-
>>   inmates/demos/x86/ivshmem-demo.c | 169 -----------------------------
>>   5 files changed, 232 insertions(+), 172 deletions(-)
>>   create mode 100644 inmates/demos/ivshmem-demo.c
>>   delete mode 100644 inmates/demos/x86/ivshmem-demo.c
>>
>> diff --git a/inmates/demos/arm/Makefile b/inmates/demos/arm/Makefile
>> index b0fda4ed..b1c25497 100644
>> --- a/inmates/demos/arm/Makefile
>> +++ b/inmates/demos/arm/Makefile
>> @@ -12,9 +12,10 @@
>>   
>>   include $(INMATES_LIB)/Makefile.lib
>>   
>> -INMATES := gic-demo.bin uart-demo.bin
>> +INMATES := gic-demo.bin uart-demo.bin ivshmem-demo.bin
>>   
>>   gic-demo-y	:= gic-demo.o
>>   uart-demo-y	:= uart-demo.o
>> +ivshmem-demo-y	:= ../ivshmem-demo.o
>>   
>>   $(eval $(call DECLARE_TARGETS,$(INMATES)))
>> diff --git a/inmates/demos/arm64/Makefile b/inmates/demos/arm64/Makefile
>> index 49abe09b..2af4f0ca 100644
>> --- a/inmates/demos/arm64/Makefile
>> +++ b/inmates/demos/arm64/Makefile
>> @@ -12,9 +12,10 @@
>>   
>>   include $(INMATES_LIB)/Makefile.lib
>>   
>> -INMATES := gic-demo.bin uart-demo.bin
>> +INMATES := gic-demo.bin uart-demo.bin ivshmem-demo.bin
>>   
>>   gic-demo-y	:= ../arm/gic-demo.o
>>   uart-demo-y	:= ../arm/uart-demo.o
>> +ivshmem-demo-y	:= ../ivshmem-demo.o
>>   
>>   $(eval $(call DECLARE_TARGETS,$(INMATES)))
>> diff --git a/inmates/demos/ivshmem-demo.c b/inmates/demos/ivshmem-demo.c
>> new file mode 100644
>> index 00000000..e7a7f711
>> --- /dev/null
>> +++ b/inmates/demos/ivshmem-demo.c
>> @@ -0,0 +1,227 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright (c) Siemens AG, 2014-2020
>> + *
>> + * Authors:
>> + *  Henning Schild <henning.schild@siemens.com>
>> + *  Jan Kiszka <jan.kiszka@siemens.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + */
> 
> missing newline
> 
>> +#include <inmate.h>
>> +
>> +#define VENDORID			0x110a
>> +#define DEVICEID			0x4106
>> +
>> +#define BAR_BASE			0xff000000
>> +
>> +#define IVSHMEM_CFG_STATE_TAB_SZ	0x04
>> +#define IVSHMEM_CFG_RW_SECTION_SZ	0x08
>> +#define IVSHMEM_CFG_OUT_SECTION_SZ	0x10
>> +#define IVSHMEM_CFG_ADDRESS		0x18
>> +
>> +#define JAILHOUSE_SHMEM_PROTO_UNDEFINED	0x0000
>> +
>> +#if defined(__x86_64__)
>> +#define DEFAULT_IRQ_BASE	32
>> +#elif defined(__arm__) || defined(__aarch64__)
>> +#define DEFAULT_IRQ_BASE	(comm_region->vpci_irq_base + 32)
>> +#else
>> +#error Not implemented!
>> +#endif
> 
> Hmm. We could save the ifdeffery, if we provide
> comm_region->vpci_irq_base for all architectures.

I thought about it, but it doesn't make sense for other archs. It would 
only require managing that entry - for the sake of this #ifdef.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/369ee7e6-136a-f808-1e1b-c3ba6ae1b31d%40siemens.com.
