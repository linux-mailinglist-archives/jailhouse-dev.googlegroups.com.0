Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBHEEVPTAKGQE74QURKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 58418116ED
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 May 2019 12:10:37 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id g15sf265101ljk.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 May 2019 03:10:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556791837; cv=pass;
        d=google.com; s=arc-20160816;
        b=oMAA0qpTvwsujBf0uF1QcDZJlD1mTkZE6AkKZa3FTPhcJyTulRsC4+SZ1JZNHaMD/S
         Rp7c69nSo9ZJpvNYCIThpqgS9cCb16wvyh9u7ReF6WBKPmOdGyXPSQwatymeDqXJ9m14
         gvfXG055LUTLf6vAdqNjQQ8Iy7D5DuRdeaiSacLOYo7qJE6W9yDGegtq+aUY+/9p9x3W
         VuTP3nVWwjt6PfuejuFbswYBBbZqBexO/bLhIBHYKviGY8wWTo23hSU89EHOuZinuoGy
         /0/wFOIC9w3TsuYsM8zdg8KYeozgUwwtK2y0hcHlvG/9JpSK9yzOjHU9VvtzMhHB3Xjt
         5tNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:cc
         :to:subject:sender:dkim-signature;
        bh=DMqBv1SVibY2RjJT3hlssKOCbQS8o/69+ltMA+ZvVzc=;
        b=tGcbL6k4ywxUi/kbpSJsYdbyiu+dajEbYJyGZ4IlTgr1tKl71DTEI3CUk97tAe9hcr
         PVOqtZtEsJAisMUm6IXPuIxPN1TIKfm1BF1DLbKhNIRBFV/UNYgIQZbf/JhSt+QxrEXn
         pUYUUTlePjbaBHXIsIF8sek1qw/zpUlI1SujVRtOb/AWCx+g9QQ5oufx+PkLisd2iEn3
         EhdHUh/JlJqL4OFdhXP9Yez86FACntmxLNSWAddAbwfYJ1aFtq9wzuFR+SY5ryqS1bbi
         TtotDu5zkue5iGr9xGrnXVYWqYMjguHZWHUr/J1ADQdbg2Jnfl8Nwf6WzKUfVTu7J5hn
         0tmw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=SKEwlTxw;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DMqBv1SVibY2RjJT3hlssKOCbQS8o/69+ltMA+ZvVzc=;
        b=hMsfhGMx9SO3fg/gc1fSYs+YFtZZVk5Zy3Jo45oW0TgXlVMDaECGvKXiYTzzXQn9Zq
         c8w70ZfSNBEbQeRKZbTV+TpndCOd7y5RcavtIq7qWf+hBD/XZL0x4F7a8QiBDwagse8a
         XQsm3OWjj5vbZHgjWdT7Dv7a+JQNKzZ6+TVXFA3jhyzAVeiXXD9yQmMpKtoT1tRV3eQu
         lF7oO6SuvXo1+BgREUvCTh46sIEGalAWCbwAngG7AGupBScwW5AowaszG6U0FI+SHl9C
         RIs7EDlXvBv6QTFbq6vql3uLvjpNlAOOxfERCjlZlJ2GnY/RQMrzE6Gpx+Ki22Y0P73E
         1gCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DMqBv1SVibY2RjJT3hlssKOCbQS8o/69+ltMA+ZvVzc=;
        b=S20txlxMsFK6U0fkmY71OL1O+0lBXLkAJ0OtNRhQipH+/SCQWIXuOXSbK9CdHx8vIC
         iCsxNiEhHUc1Csgf2PGIAkRCZLp9NWJ/aHqYimnfyuNjQckvo9zCH3wT7IE8mQHVo1s7
         UeItbxbrCSUbAm40iqGWfCJMGIt0AADjcqHBM58zUakb0DGcJ5FXEvrbaZwByg61roBy
         RHwca9CE9u2qUrJaIiAGcQ/8hON1vzn1C3rhnu3RBmXn8sFAAUXDRwty/dIOpTmBIHLZ
         c9oTwXkVpGkE2R+VxLCvFVPD2gJMdolkkXqJDRrCLT2amp578n0BsWh/jaISLG5ZBrgd
         uNhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV3JPXZCV3raS6LcX0Ce81Y7pb1Doh6oNYFVxsNII9Doy0o9doH
	k8x2xMedKdnXfMOOdKDl7HU=
X-Google-Smtp-Source: APXvYqyIy63BCBjl/gBQAkKlLJtuU+hoMJtvnh0WV2MG88meiNHoJelhHjyJyrounMdd5j/3bGEAGQ==
X-Received: by 2002:a2e:8e93:: with SMTP id z19mr1400127ljk.159.1556791836894;
        Thu, 02 May 2019 03:10:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9114:: with SMTP id m20ls162506ljg.14.gmail; Thu, 02 May
 2019 03:10:36 -0700 (PDT)
X-Received: by 2002:a2e:91cb:: with SMTP id u11mr1512193ljg.64.1556791836373;
        Thu, 02 May 2019 03:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556791836; cv=none;
        d=google.com; s=arc-20160816;
        b=0/W/qoxnzfQHcjzDGvHNqfeHM+14DUxRdMGABaeBcTO2Upu3uB1YGbP843pVqJJMeR
         VKSef+2vPZUV+omdxbO0ri9b6KexXMl9oixHMF0PoQtm3jUhSuUwPT5njYh9eCNkIPQy
         ax+iRArouYC7Ds12QQj+e0rPA83mLEzL+uXaosspj1jGU2vDZB9UYKSJmRQVMoYUyM9f
         o/2z/ZsS3G8F6VkjTmpr2AfVnH0Xv4jj2kCfY93jU273VxXLPbeQUQHwE0QSo4MEGlcI
         KoJJE1/KkgFuqh7Ah5G3WVs32UsM7e1axzrFzM6L15V8gJ0lKukIlvVWRItHzBp9KL21
         DHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=XD93R5GEjPX8xpIyw/Xbk/jPJDl9ZI9GLhglfipSXoE=;
        b=cZ45KVEN2AO+BdzpdVOb9uGKGmMO4gxC8dV9XC97mLr5ewcOGIZfbwJNGzg90yTszy
         OtoAOrwhyn8x9216uAGEzd2k/9ZyQTTQdAEfnZkqHd/cPUkkH02/nTTi4IyJ6N3ZnYaB
         F4DZtWxkxMyBjlW7DtsJHK7DCrU5QiUoJ89fEEtxbPWD+vWNsajnXC/smQkwy0mBEi2n
         w840twkt6d3qvj9zQmGctL8OqlgPSxDibSyUtcCiKs4W8HZHtqxGs5RE13JedSzy1YQq
         duqi+zyUUQQcvxz2ZIWlWayultwtTVETc/lcdtWvsWtYtVYyni1Vxk6shGCLFVdQErCN
         7vew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=SKEwlTxw;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id c22si262566lfh.5.2019.05.02.03.10.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 03:10:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 44vrcW3Sj0zxtG;
	Thu,  2 May 2019 12:10:35 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 2 May 2019
 12:10:35 +0200
Subject: Re: [PATCH 1/5] configs: define ARRAY_SIZE in cell-config.h
To: Henning Schild <henning.schild@siemens.com>
CC: <jailhouse-dev@googlegroups.com>
References: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
 <20190430214504.2153-2-ralf.ramsauer@oth-regensburg.de>
 <20190502102353.577614ab@md1za8fc.ad001.siemens.net>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <460f35ab-5329-2eae-f545-7fddf2277235@oth-regensburg.de>
Date: Thu, 2 May 2019 12:10:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502102353.577614ab@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=SKEwlTxw;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 5/2/19 10:23 AM, Henning Schild wrote:
> Hi Ralf,
> 
> good idea! What happens if i through my "legacy" config on that? In
> that case i would expect one define inside + one in the header. The
> header will win, will the config-one cause an issue. I would expect at
> least a warning, which is probably fine.

Easy to find out: Simply re-introduce the definition of ARRAY_SIZE in a
configuration again.

My compiler (gcc 8.3.0) doesn't even warn. I assume this is because
definition and redefinition are textually equivalent.

  Ralf

> 
> Henning
> 
> Am Tue, 30 Apr 2019 23:45:00 +0200
> schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:
> 
>> instead of defining this useful macro in every single config file.
>>
>> There's only one quirk: ARRAY_SIZE is defined for hypervisor code in
>> util.h, which we can't include in cell-config.h, as it's GPL-only. So
>> we have to duplicate the definitions, which might lead to
>> redefinitions of the macro. Hence, surround the macro by guards.
>>
>> Also remove the macro from the root cell template.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>  configs/arm/bananapi-gic-demo.c               | 2 --
>>  configs/arm/bananapi-linux-demo.c             | 2 --
>>  configs/arm/bananapi-uart-demo.c              | 2 --
>>  configs/arm/bananapi.c                        | 2 --
>>  configs/arm/emtrion-rzg1e-linux-demo.c        | 2 --
>>  configs/arm/emtrion-rzg1e-uart-demo.c         | 2 --
>>  configs/arm/emtrion-rzg1e.c                   | 2 --
>>  configs/arm/emtrion-rzg1h-linux-demo.c        | 2 --
>>  configs/arm/emtrion-rzg1h-uart-demo.c         | 2 --
>>  configs/arm/emtrion-rzg1h.c                   | 2 --
>>  configs/arm/emtrion-rzg1m-linux-demo.c        | 2 --
>>  configs/arm/emtrion-rzg1m-uart-demo.c         | 2 --
>>  configs/arm/emtrion-rzg1m.c                   | 2 --
>>  configs/arm/jetson-tk1-demo.c                 | 2 --
>>  configs/arm/jetson-tk1-linux-demo.c           | 2 --
>>  configs/arm/jetson-tk1.c                      | 2 --
>>  configs/arm/orangepi0-gic-demo.c              | 2 --
>>  configs/arm/orangepi0-linux-demo.c            | 2 --
>>  configs/arm/orangepi0.c                       | 2 --
>>  configs/arm64/amd-seattle-gic-demo.c          | 2 --
>>  configs/arm64/amd-seattle-linux-demo.c        | 2 --
>>  configs/arm64/amd-seattle-uart-demo.c         | 2 --
>>  configs/arm64/amd-seattle.c                   | 2 --
>>  configs/arm64/espressobin-gic-demo.c          | 2 --
>>  configs/arm64/espressobin-linux-demo.c        | 2 --
>>  configs/arm64/espressobin.c                   | 2 --
>>  configs/arm64/foundation-v8-gic-demo.c        | 2 --
>>  configs/arm64/foundation-v8-linux-demo.c      | 2 --
>>  configs/arm64/foundation-v8-uart-demo.c       | 2 --
>>  configs/arm64/foundation-v8.c                 | 2 --
>>  configs/arm64/hikey-gic-demo.c                | 2 --
>>  configs/arm64/hikey-linux-demo.c              | 2 --
>>  configs/arm64/hikey.c                         | 2 --
>>  configs/arm64/imx8mq-gic-demo.c               | 2 --
>>  configs/arm64/imx8mq.c                        | 2 --
>>  configs/arm64/jetson-tx1-demo.c               | 2 --
>>  configs/arm64/jetson-tx1-linux-demo.c         | 2 --
>>  configs/arm64/jetson-tx1.c                    | 2 --
>>  configs/arm64/jetson-tx2-demo.c               | 2 --
>>  configs/arm64/jetson-tx2.c                    | 2 --
>>  configs/arm64/k3-am654-gic-demo.c             | 2 --
>>  configs/arm64/k3-am654-idk-linux-demo.c       | 2 --
>>  configs/arm64/k3-am654-idk.c                  | 2 --
>>  configs/arm64/k3-am654-uart-demo.c            | 2 --
>>  configs/arm64/macchiatobin-gic-demo.c         | 2 --
>>  configs/arm64/macchiatobin-linux-demo.c       | 2 --
>>  configs/arm64/macchiatobin.c                  | 2 --
>>  configs/arm64/miriac-sbc-ls1046a-gic-demo.c   | 2 --
>>  configs/arm64/miriac-sbc-ls1046a-linux-demo.c | 2 --
>>  configs/arm64/miriac-sbc-ls1046a.c            | 2 --
>>  configs/arm64/qemu-arm64-gic-demo.c           | 2 --
>>  configs/arm64/qemu-arm64-linux-demo.c         | 2 --
>>  configs/arm64/qemu-arm64.c                    | 2 --
>>  configs/arm64/ultra96-gic-demo.c              | 2 --
>>  configs/arm64/ultra96-linux-demo.c            | 2 --
>>  configs/arm64/ultra96.c                       | 2 --
>>  configs/arm64/zynqmp-zcu102-gic-demo.c        | 2 --
>>  configs/arm64/zynqmp-zcu102-linux-demo-2.c    | 2 --
>>  configs/arm64/zynqmp-zcu102-linux-demo.c      | 2 --
>>  configs/arm64/zynqmp-zcu102.c                 | 2 --
>>  configs/x86/apic-demo.c                       | 2 --
>>  configs/x86/e1000-demo.c                      | 2 --
>>  configs/x86/f2a88xm-hd3.c                     | 2 --
>>  configs/x86/imb-a180.c                        | 2 --
>>  configs/x86/ioapic-demo.c                     | 2 --
>>  configs/x86/ivshmem-demo.c                    | 2 --
>>  configs/x86/linux-x86-demo.c                  | 2 --
>>  configs/x86/pci-demo.c                        | 2 --
>>  configs/x86/qemu-x86.c                        | 2 --
>>  configs/x86/smp-demo.c                        | 2 --
>>  configs/x86/tiny-demo.c                       | 2 --
>>  hypervisor/include/jailhouse/utils.h          | 2 ++
>>  include/jailhouse/cell-config.h               | 4 ++++
>>  tools/root-cell-config.c.tmpl                 | 2 --
>>  74 files changed, 6 insertions(+), 144 deletions(-)
>>
>> diff --git a/configs/arm/bananapi-gic-demo.c
>> b/configs/arm/bananapi-gic-demo.c index 757d9503..855a72a7 100644
>> --- a/configs/arm/bananapi-gic-demo.c
>> +++ b/configs/arm/bananapi-gic-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/bananapi-linux-demo.c
>> b/configs/arm/bananapi-linux-demo.c index e9e584f2..fd1931f3 100644
>> --- a/configs/arm/bananapi-linux-demo.c
>> +++ b/configs/arm/bananapi-linux-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/bananapi-uart-demo.c
>> b/configs/arm/bananapi-uart-demo.c index aeec6f8d..0621ca52 100644
>> --- a/configs/arm/bananapi-uart-demo.c
>> +++ b/configs/arm/bananapi-uart-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/bananapi.c b/configs/arm/bananapi.c
>> index e7e6bb1e..ffc4589c 100644
>> --- a/configs/arm/bananapi.c
>> +++ b/configs/arm/bananapi.c
>> @@ -15,8 +15,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/emtrion-rzg1e-linux-demo.c
>> b/configs/arm/emtrion-rzg1e-linux-demo.c index ea638989..1bf08b66
>> 100644 --- a/configs/arm/emtrion-rzg1e-linux-demo.c
>> +++ b/configs/arm/emtrion-rzg1e-linux-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/emtrion-rzg1e-uart-demo.c
>> b/configs/arm/emtrion-rzg1e-uart-demo.c index a2590adb..42c74127
>> 100644 --- a/configs/arm/emtrion-rzg1e-uart-demo.c
>> +++ b/configs/arm/emtrion-rzg1e-uart-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/emtrion-rzg1e.c b/configs/arm/emtrion-rzg1e.c
>> index 0a38ed8d..e3872cf2 100644
>> --- a/configs/arm/emtrion-rzg1e.c
>> +++ b/configs/arm/emtrion-rzg1e.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/emtrion-rzg1h-linux-demo.c
>> b/configs/arm/emtrion-rzg1h-linux-demo.c index 61c58666..ad2dceeb
>> 100644 --- a/configs/arm/emtrion-rzg1h-linux-demo.c
>> +++ b/configs/arm/emtrion-rzg1h-linux-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/emtrion-rzg1h-uart-demo.c
>> b/configs/arm/emtrion-rzg1h-uart-demo.c index d8076be5..f20c94cb
>> 100644 --- a/configs/arm/emtrion-rzg1h-uart-demo.c
>> +++ b/configs/arm/emtrion-rzg1h-uart-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/emtrion-rzg1h.c b/configs/arm/emtrion-rzg1h.c
>> index a23e1589..03e1be5b 100644
>> --- a/configs/arm/emtrion-rzg1h.c
>> +++ b/configs/arm/emtrion-rzg1h.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/emtrion-rzg1m-linux-demo.c
>> b/configs/arm/emtrion-rzg1m-linux-demo.c index 0c3d0cfd..d8b8441a
>> 100644 --- a/configs/arm/emtrion-rzg1m-linux-demo.c
>> +++ b/configs/arm/emtrion-rzg1m-linux-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/emtrion-rzg1m-uart-demo.c
>> b/configs/arm/emtrion-rzg1m-uart-demo.c index 3a0eda5c..c89c1d82
>> 100644 --- a/configs/arm/emtrion-rzg1m-uart-demo.c
>> +++ b/configs/arm/emtrion-rzg1m-uart-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/emtrion-rzg1m.c b/configs/arm/emtrion-rzg1m.c
>> index f97805f7..84d68f62 100644
>> --- a/configs/arm/emtrion-rzg1m.c
>> +++ b/configs/arm/emtrion-rzg1m.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/jetson-tk1-demo.c
>> b/configs/arm/jetson-tk1-demo.c index 7562222c..57ea5a3d 100644
>> --- a/configs/arm/jetson-tk1-demo.c
>> +++ b/configs/arm/jetson-tk1-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  #ifndef CONFIG_INMATE_BASE
>>  #define CONFIG_INMATE_BASE 0x0
>>  #endif
>> diff --git a/configs/arm/jetson-tk1-linux-demo.c
>> b/configs/arm/jetson-tk1-linux-demo.c index 16d79774..7ee83f7a 100644
>> --- a/configs/arm/jetson-tk1-linux-demo.c
>> +++ b/configs/arm/jetson-tk1-linux-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/jetson-tk1.c b/configs/arm/jetson-tk1.c
>> index 9e2e23f9..7374ef44 100644
>> --- a/configs/arm/jetson-tk1.c
>> +++ b/configs/arm/jetson-tk1.c
>> @@ -18,8 +18,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/orangepi0-gic-demo.c
>> b/configs/arm/orangepi0-gic-demo.c index 45c38425..51b3bf8b 100644
>> --- a/configs/arm/orangepi0-gic-demo.c
>> +++ b/configs/arm/orangepi0-gic-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/orangepi0-linux-demo.c
>> b/configs/arm/orangepi0-linux-demo.c index e7154078..49ee10e9 100644
>> --- a/configs/arm/orangepi0-linux-demo.c
>> +++ b/configs/arm/orangepi0-linux-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
>> index 9eca773d..e45c8d62 100644
>> --- a/configs/arm/orangepi0.c
>> +++ b/configs/arm/orangepi0.c
>> @@ -15,8 +15,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/amd-seattle-gic-demo.c
>> b/configs/arm64/amd-seattle-gic-demo.c index d407d6e3..5a4d726a 100644
>> --- a/configs/arm64/amd-seattle-gic-demo.c
>> +++ b/configs/arm64/amd-seattle-gic-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/amd-seattle-linux-demo.c
>> b/configs/arm64/amd-seattle-linux-demo.c index 96edbc4f..5349323c
>> 100644 --- a/configs/arm64/amd-seattle-linux-demo.c
>> +++ b/configs/arm64/amd-seattle-linux-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/amd-seattle-uart-demo.c
>> b/configs/arm64/amd-seattle-uart-demo.c index 61073486..bcaac58d
>> 100644 --- a/configs/arm64/amd-seattle-uart-demo.c
>> +++ b/configs/arm64/amd-seattle-uart-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/amd-seattle.c b/configs/arm64/amd-seattle.c
>> index 911ae1da..b5cff3b3 100644
>> --- a/configs/arm64/amd-seattle.c
>> +++ b/configs/arm64/amd-seattle.c
>> @@ -15,8 +15,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/espressobin-gic-demo.c
>> b/configs/arm64/espressobin-gic-demo.c index 452ab668..6de940d7 100644
>> --- a/configs/arm64/espressobin-gic-demo.c
>> +++ b/configs/arm64/espressobin-gic-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/espressobin-linux-demo.c
>> b/configs/arm64/espressobin-linux-demo.c index c0b09981..92da96e9
>> 100644 --- a/configs/arm64/espressobin-linux-demo.c
>> +++ b/configs/arm64/espressobin-linux-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
>> index d620080d..a23dc24b 100644
>> --- a/configs/arm64/espressobin.c
>> +++ b/configs/arm64/espressobin.c
>> @@ -17,8 +17,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/foundation-v8-gic-demo.c
>> b/configs/arm64/foundation-v8-gic-demo.c index 5d69e01e..8b1ff1ac
>> 100644 --- a/configs/arm64/foundation-v8-gic-demo.c
>> +++ b/configs/arm64/foundation-v8-gic-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/foundation-v8-linux-demo.c
>> b/configs/arm64/foundation-v8-linux-demo.c index 86fe8ada..2a448b49
>> 100644 --- a/configs/arm64/foundation-v8-linux-demo.c
>> +++ b/configs/arm64/foundation-v8-linux-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/foundation-v8-uart-demo.c
>> b/configs/arm64/foundation-v8-uart-demo.c index f057fbbc..da919d4a
>> 100644 --- a/configs/arm64/foundation-v8-uart-demo.c
>> +++ b/configs/arm64/foundation-v8-uart-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/foundation-v8.c
>> b/configs/arm64/foundation-v8.c index 5109929f..7a632491 100644
>> --- a/configs/arm64/foundation-v8.c
>> +++ b/configs/arm64/foundation-v8.c
>> @@ -15,8 +15,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/hikey-gic-demo.c
>> b/configs/arm64/hikey-gic-demo.c index 908b0c71..c7ddf469 100644
>> --- a/configs/arm64/hikey-gic-demo.c
>> +++ b/configs/arm64/hikey-gic-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/hikey-linux-demo.c
>> b/configs/arm64/hikey-linux-demo.c index 71bc7c82..76dda9da 100644
>> --- a/configs/arm64/hikey-linux-demo.c
>> +++ b/configs/arm64/hikey-linux-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
>> index bcfbe188..7e6bb952 100644
>> --- a/configs/arm64/hikey.c
>> +++ b/configs/arm64/hikey.c
>> @@ -15,8 +15,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/imx8mq-gic-demo.c
>> b/configs/arm64/imx8mq-gic-demo.c index 041751c0..ae1877d0 100644
>> --- a/configs/arm64/imx8mq-gic-demo.c
>> +++ b/configs/arm64/imx8mq-gic-demo.c
>> @@ -13,8 +13,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/imx8mq.c b/configs/arm64/imx8mq.c
>> index 95b4b363..7d113264 100644
>> --- a/configs/arm64/imx8mq.c
>> +++ b/configs/arm64/imx8mq.c
>> @@ -15,8 +15,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/jetson-tx1-demo.c
>> b/configs/arm64/jetson-tx1-demo.c index 446b1a6d..b16b9ba7 100644
>> --- a/configs/arm64/jetson-tx1-demo.c
>> +++ b/configs/arm64/jetson-tx1-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/jetson-tx1-linux-demo.c
>> b/configs/arm64/jetson-tx1-linux-demo.c index 4a643873..b8698259
>> 100644 --- a/configs/arm64/jetson-tx1-linux-demo.c
>> +++ b/configs/arm64/jetson-tx1-linux-demo.c
>> @@ -18,8 +18,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  #ifndef CONFIG_INMATE_BASE
>>  #define CONFIG_INMATE_BASE 0x0
>>  #endif
>> diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
>> index d4a00daf..d1fb21b8 100644
>> --- a/configs/arm64/jetson-tx1.c
>> +++ b/configs/arm64/jetson-tx1.c
>> @@ -18,8 +18,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/jetson-tx2-demo.c
>> b/configs/arm64/jetson-tx2-demo.c index 6e09226c..d500e124 100644
>> --- a/configs/arm64/jetson-tx2-demo.c
>> +++ b/configs/arm64/jetson-tx2-demo.c
>> @@ -11,8 +11,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/jetson-tx2.c b/configs/arm64/jetson-tx2.c
>> index 814a4b08..c2e17e67 100644
>> --- a/configs/arm64/jetson-tx2.c
>> +++ b/configs/arm64/jetson-tx2.c
>> @@ -21,8 +21,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/k3-am654-gic-demo.c
>> b/configs/arm64/k3-am654-gic-demo.c index fc9deb75..556b0b4a 100644
>> --- a/configs/arm64/k3-am654-gic-demo.c
>> +++ b/configs/arm64/k3-am654-gic-demo.c
>> @@ -17,8 +17,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/k3-am654-idk-linux-demo.c
>> b/configs/arm64/k3-am654-idk-linux-demo.c index 23824890..5eab1502
>> 100644 --- a/configs/arm64/k3-am654-idk-linux-demo.c
>> +++ b/configs/arm64/k3-am654-idk-linux-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  #ifndef CONFIG_INMATE_BASE
>>  #define CONFIG_INMATE_BASE 0x0000000
>>  #endif
>> diff --git a/configs/arm64/k3-am654-idk.c
>> b/configs/arm64/k3-am654-idk.c index edc31b8b..a951a461 100644
>> --- a/configs/arm64/k3-am654-idk.c
>> +++ b/configs/arm64/k3-am654-idk.c
>> @@ -15,8 +15,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/k3-am654-uart-demo.c
>> b/configs/arm64/k3-am654-uart-demo.c index 10cc0365..29a022e9 100644
>> --- a/configs/arm64/k3-am654-uart-demo.c
>> +++ b/configs/arm64/k3-am654-uart-demo.c
>> @@ -17,8 +17,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/macchiatobin-gic-demo.c
>> b/configs/arm64/macchiatobin-gic-demo.c index 713319d2..63e1e433
>> 100644 --- a/configs/arm64/macchiatobin-gic-demo.c
>> +++ b/configs/arm64/macchiatobin-gic-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/macchiatobin-linux-demo.c
>> b/configs/arm64/macchiatobin-linux-demo.c index 63fbbba7..6e18f62f
>> 100644 --- a/configs/arm64/macchiatobin-linux-demo.c
>> +++ b/configs/arm64/macchiatobin-linux-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/macchiatobin.c
>> b/configs/arm64/macchiatobin.c index c0df0572..4811e8dd 100644
>> --- a/configs/arm64/macchiatobin.c
>> +++ b/configs/arm64/macchiatobin.c
>> @@ -17,8 +17,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/miriac-sbc-ls1046a-gic-demo.c
>> b/configs/arm64/miriac-sbc-ls1046a-gic-demo.c index
>> 614b572e..6a93935f 100644 ---
>> a/configs/arm64/miriac-sbc-ls1046a-gic-demo.c +++
>> b/configs/arm64/miriac-sbc-ls1046a-gic-demo.c @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
>> b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c index
>> 1c63ae0e..ec2531b2 100644 ---
>> a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c +++
>> b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c @@ -17,8 +17,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/miriac-sbc-ls1046a.c
>> b/configs/arm64/miriac-sbc-ls1046a.c index 9597500d..6f3ad198 100644
>> --- a/configs/arm64/miriac-sbc-ls1046a.c
>> +++ b/configs/arm64/miriac-sbc-ls1046a.c
>> @@ -17,8 +17,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/qemu-arm64-gic-demo.c
>> b/configs/arm64/qemu-arm64-gic-demo.c index 2a50ef3f..9e51e821 100644
>> --- a/configs/arm64/qemu-arm64-gic-demo.c
>> +++ b/configs/arm64/qemu-arm64-gic-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/qemu-arm64-linux-demo.c
>> b/configs/arm64/qemu-arm64-linux-demo.c index be88e107..ed89413b
>> 100644 --- a/configs/arm64/qemu-arm64-linux-demo.c
>> +++ b/configs/arm64/qemu-arm64-linux-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
>> index 0570a1dd..6eff7403 100644
>> --- a/configs/arm64/qemu-arm64.c
>> +++ b/configs/arm64/qemu-arm64.c
>> @@ -17,8 +17,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/ultra96-gic-demo.c
>> b/configs/arm64/ultra96-gic-demo.c index 12556335..403c6972 100644
>> --- a/configs/arm64/ultra96-gic-demo.c
>> +++ b/configs/arm64/ultra96-gic-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/ultra96-linux-demo.c
>> b/configs/arm64/ultra96-linux-demo.c index e6b33466..7cbfd772 100644
>> --- a/configs/arm64/ultra96-linux-demo.c
>> +++ b/configs/arm64/ultra96-linux-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
>> index 1fc54356..bcf08772 100644
>> --- a/configs/arm64/ultra96.c
>> +++ b/configs/arm64/ultra96.c
>> @@ -15,8 +15,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/zynqmp-zcu102-gic-demo.c
>> b/configs/arm64/zynqmp-zcu102-gic-demo.c index 6ca18686..15767396
>> 100644 --- a/configs/arm64/zynqmp-zcu102-gic-demo.c
>> +++ b/configs/arm64/zynqmp-zcu102-gic-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
>> b/configs/arm64/zynqmp-zcu102-linux-demo-2.c index 2fcc86c6..02ec89e8
>> 100644 --- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
>> +++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c
>> b/configs/arm64/zynqmp-zcu102-linux-demo.c index ca80535d..c30ed924
>> 100644 --- a/configs/arm64/zynqmp-zcu102-linux-demo.c
>> +++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/arm64/zynqmp-zcu102.c
>> b/configs/arm64/zynqmp-zcu102.c index 65515e56..9de04d6c 100644
>> --- a/configs/arm64/zynqmp-zcu102.c
>> +++ b/configs/arm64/zynqmp-zcu102.c
>> @@ -17,8 +17,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/x86/apic-demo.c b/configs/x86/apic-demo.c
>> index 969f9527..8840c632 100644
>> --- a/configs/x86/apic-demo.c
>> +++ b/configs/x86/apic-demo.c
>> @@ -15,8 +15,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/x86/e1000-demo.c b/configs/x86/e1000-demo.c
>> index 1c602883..09ca9eac 100644
>> --- a/configs/x86/e1000-demo.c
>> +++ b/configs/x86/e1000-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
>> index d5320d7b..e73cbb06 100644
>> --- a/configs/x86/f2a88xm-hd3.c
>> +++ b/configs/x86/f2a88xm-hd3.c
>> @@ -20,8 +20,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/x86/imb-a180.c b/configs/x86/imb-a180.c
>> index 9073a4ac..4faa0b41 100644
>> --- a/configs/x86/imb-a180.c
>> +++ b/configs/x86/imb-a180.c
>> @@ -19,8 +19,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/x86/ioapic-demo.c b/configs/x86/ioapic-demo.c
>> index 8b47a335..30e0ac98 100644
>> --- a/configs/x86/ioapic-demo.c
>> +++ b/configs/x86/ioapic-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
>> index 501d722f..b3a12a9d 100644
>> --- a/configs/x86/ivshmem-demo.c
>> +++ b/configs/x86/ivshmem-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/x86/linux-x86-demo.c
>> b/configs/x86/linux-x86-demo.c index af8c6da4..c8f18701 100644
>> --- a/configs/x86/linux-x86-demo.c
>> +++ b/configs/x86/linux-x86-demo.c
>> @@ -15,8 +15,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/x86/pci-demo.c b/configs/x86/pci-demo.c
>> index c5719459..0b8c1aad 100644
>> --- a/configs/x86/pci-demo.c
>> +++ b/configs/x86/pci-demo.c
>> @@ -16,8 +16,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
>> index 68b8f18d..4d671cb2 100644
>> --- a/configs/x86/qemu-x86.c
>> +++ b/configs/x86/qemu-x86.c
>> @@ -19,8 +19,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[1];
>> diff --git a/configs/x86/smp-demo.c b/configs/x86/smp-demo.c
>> index a9625353..d175c618 100644
>> --- a/configs/x86/smp-demo.c
>> +++ b/configs/x86/smp-demo.c
>> @@ -15,8 +15,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/configs/x86/tiny-demo.c b/configs/x86/tiny-demo.c
>> index 426333f6..493059ae 100644
>> --- a/configs/x86/tiny-demo.c
>> +++ b/configs/x86/tiny-demo.c
>> @@ -15,8 +15,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> -
>>  struct {
>>  	struct jailhouse_cell_desc cell;
>>  	__u64 cpus[1];
>> diff --git a/hypervisor/include/jailhouse/utils.h
>> b/hypervisor/include/jailhouse/utils.h index eae0f390..6f6e8371 100644
>> --- a/hypervisor/include/jailhouse/utils.h
>> +++ b/hypervisor/include/jailhouse/utils.h
>> @@ -12,7 +12,9 @@
>>   * Partly derived from Linux kernel code.
>>   */
>>  
>> +#ifndef ARRAY_SIZE
>>  #define ARRAY_SIZE(array)	(sizeof(array) / sizeof((array)[0]))
>> +#endif
>>  
>>  /* sizeof() for a structure/union field */
>>  #define FIELD_SIZEOF(type, fld)	(sizeof(((type *)0)->fld))
>> diff --git a/include/jailhouse/cell-config.h
>> b/include/jailhouse/cell-config.h index 66e13c3d..63eb5fa5 100644
>> --- a/include/jailhouse/cell-config.h
>> +++ b/include/jailhouse/cell-config.h
>> @@ -41,6 +41,10 @@
>>  
>>  #include <jailhouse/console.h>
>>  
>> +#ifndef ARRAY_SIZE
>> +#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>> +#endif
>> +
>>  /*
>>   * Incremented on any layout or semantic change of system or cell
>> config.
>>   * Also update HEADER_REVISION in tools.
>> diff --git a/tools/root-cell-config.c.tmpl
>> b/tools/root-cell-config.c.tmpl index 5a8e1412..b80d7889 100644
>> --- a/tools/root-cell-config.c.tmpl
>> +++ b/tools/root-cell-config.c.tmpl
>> @@ -42,8 +42,6 @@
>>  #include <jailhouse/types.h>
>>  #include <jailhouse/cell-config.h>
>>  
>> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
>> -
>>  struct {
>>  	struct jailhouse_system header;
>>  	__u64 cpus[${int((cpucount + 63) / 64)}];
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
