Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBPECY33AKGQEWHPIY2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4621E8A2D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 29 May 2020 23:40:12 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id b100sf1758835edf.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 29 May 2020 14:40:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590788412; cv=pass;
        d=google.com; s=arc-20160816;
        b=rQ4TN9OdlB99ACERPJt6nruN2vRjugo7+1wpsyqj0KPqgIZVcD0x3C/OinWC5Q9Eb6
         72dTKL5OISKt446sCADl1opGbeWnIkoYjmefG8ZBYChTw7oONlaBC1NIRFpA4HKG4VVD
         oxl/l5hRRLXromPxuLHKeFXSfRUkq6iQ8oNEkuhl6Bvbjv6GeJ1psDxVgJKqTM1D+eGl
         doDDJlYDZ5Ryf4WnWAiRQunNQCgDqaYHLJpKFDTXuC+hLwppqj2n3+maxXpYoKt+ozBc
         Iempa6FuawaJ/zOYcWX6chKXRXAOD5q5qMRe/wVw9kljuWIiDEd5EfStxH8zEOgBnJqZ
         sTgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:subject:autocrypt:from
         :references:cc:to:sender:dkim-signature;
        bh=jxx66Sqd/RCkeknvXKBZSOsnoGp0+8aj/AalKl/t/Pg=;
        b=wRp+AKZ3g5waIYpnaurd4bceswJ44emCoqCR8qbrkNgEBa30hqdKXEeimbUiM1OYBL
         A+YzEJt3XbwPVRDi8YnkNphhyZcCLdJTbTZJ51nnYrunoAkAY4vhFhH2i3QWwHy0vs/M
         WzdOVc5PO46pJnxtk7DvoFdxNou1v0yHBhr6hltTB2CrLqhNTk2rEjiJOz3PttRZ5hDZ
         zmYukWSucEG9MowpA7Tl1x3LttgW8dMCb0IBeZnQY4kWmR+vN0c5ok8G7KCyeUyIiD+o
         2ky1RWaB0nabTOqwfh1ilj18lBZv5bECov1NiUGMr93Ye/PvctrQuu15cAl4AQtGJRTd
         bZ9Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=fj6HSt28;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:references:from:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jxx66Sqd/RCkeknvXKBZSOsnoGp0+8aj/AalKl/t/Pg=;
        b=eV8/A9K0pO0AiC2de74KcyEDQKJXce257YHIyUibSn88Q2EoovNkUfvA8oqyE9YICf
         zGdGbgiezWyae8UZn62gOE5pOtPkRGXDw/Nzpc5JAFUdY5rsb2DgBLZWqwixvi0DBgGM
         G6755+six6PP8hDbDOdsDvqW7LOM0Xb0SNguPO6Jgs20GIqOt9FZ2Elh+94IR65RjV7V
         locv5j+AnGqLu9YVlKaUz/bLOwropa61fB/kHx0kbrRLz0Af1iVKCXIIRw+ncxOn3ahM
         EVKHZDpQtB8jdr1lryN3VI5qOdqAqTatLn1KeCM25tIM0HfiW211O+C2MTarCVb6SR2G
         F91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jxx66Sqd/RCkeknvXKBZSOsnoGp0+8aj/AalKl/t/Pg=;
        b=re2QuM/ozrlwFSra+5zRO1TBpnTlbxSzJgWPs0lnOiUSF35l0ZovKKiuG9/WdIWo3Y
         uu6Aa6Z4NyDtj6W43LEUCGeHYHYXbONEobDaDRMhANf/TDy7fABZKgIE5sYvMF7CmNrg
         x4MQ2dd7uhqmAXQD+SuD63Edn3f0YfwlhsEJZpf5UK6IWR+971yMwO0UgpqSziRdO9Yu
         fd14Pl2hY7DEh8cPFE2NcZewCE6mX03BAGCpCld5vkLNxnTTL/GGVg5xQjFxuMTL+cGP
         EqSBdfne4Zoqc1W6td3zwfz7NQgWLSXXvlK4RGf1kEhd8MXuFe3XTbRU8IS5v7ft7W+d
         Nxow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5306We+2Jtjrr1YSOcKyZnU5ol39ySZS6peTMKpb3wNn9vm3BgDB
	xy/98ZIXdfAlYRcZY2UctkU=
X-Google-Smtp-Source: ABdhPJz1EjcHO6lmV3VV/yGnqrV43pLLyq8mcxqpJMQBp2/yMvfJ+eXK8Ty/Y+jAh6GNCurWHnKBZw==
X-Received: by 2002:a17:906:8492:: with SMTP id m18mr9356197ejx.168.1590788412465;
        Fri, 29 May 2020 14:40:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:b4b:: with SMTP id v11ls3184050ejg.9.gmail; Fri, 29
 May 2020 14:40:11 -0700 (PDT)
X-Received: by 2002:a17:906:6d05:: with SMTP id m5mr10039819ejr.259.1590788411740;
        Fri, 29 May 2020 14:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590788411; cv=none;
        d=google.com; s=arc-20160816;
        b=OLycWvasoD5QpK5B3Q1A2Tx1Fk/AoyDRDvGQ7SRTmGucCEPezZ4ZMHW0+NEbofV2WP
         ZpN183SYchvB2L2ojD37a9+tLGh5SCgxxRPevXkC6zuE4F0v53d9evYSyFRkwPTILl+4
         +z5zg/CPPPvBXJf7hAyqKC0PiKifi0grNVkUyQ9GnCuHb7Wn7N9lejm6N05rrL74+MNm
         3SHoE1a0Plz9DSjEb1aXAtcHNzc6LnwrfdVdHA5QZYc5W/KisKzylWioLb+rFcEfgfaz
         T+yXe45QVPeHbb8VipSwbeANA6O5dQ1eWSkBAqFJG776KkCFV0EZECBfKzbbGzSgGzj3
         9w5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:from:references:cc:to
         :dkim-signature;
        bh=GidDqFTDc8+OVBjcAfp6G5sGGSOIi2ITWV9wWZ47xiw=;
        b=P4sF1LU0sQZEREc9IZDMW92arzJZvI8rqa8oF1hmsMfanri7gKoLIlh+2VXG9YzdlB
         lFraNncyzIrSwWlXfjLTAaj8jZ2Bz9jpMlXxNLz/UtIZr0HcuViLj9UewYL2CcDcZp29
         y1srheO3/dtLjPdggfxoPYJFVrWC2jaVEqYSQr13ZIk6nNh2REzw9oOaeb1pAAjjn8ir
         7BbCyUDE2uXOc5R18a0zkpaU4uUb1OrB1z+9938IHqpByidRxU8dq04Pdii8WpjtzOMR
         TjbHQ6u9Mxyb7TFxZe6lvTu1Qqd0b4V4w6t0lHMWiE3yoVOGHWTkmtRLlV49meSimx+P
         EV0A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=fj6HSt28;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id o23si599474edz.4.2020.05.29.14.40.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 May 2020 14:40:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 49YdJq1L7Kzyfy;
	Fri, 29 May 2020 23:40:11 +0200 (CEST)
Received: from [IPv6:2a02:8388:7c3:300:4e34:88ff:fe05:eed9]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 29 May
 2020 23:40:10 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Mario Mintel
	<mariomintel@gmail.com>
CC: <buildroot@buildroot.org>, <jailhouse-dev@googlegroups.com>,
	<ralf.ramsauer@oth-regensburg.de>
References: <20200528144333.49268-1-mariomintel@gmail.com>
 <20200528144333.49268-3-mariomintel@gmail.com> <20200529204844.GR8737@scaer>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: [Buildroot] [PATCH 2/2] package/jailhouse: add option to choose
 custom repo/branch
Message-ID: <3806f122-f6b0-efba-e94a-64a3729fbe8a@oth-regensburg.de>
Date: Fri, 29 May 2020 23:40:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200529204844.GR8737@scaer>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US-large
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=fj6HSt28;
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

Hi Yann,

On 5/29/20 10:48 PM, Yann E. MORIN wrote:
> Mario, All,
> 
> On 2020-05-28 16:43 +0200, Mario Mintel spake thusly:
>> In addition to official releases of Jailhouse, allow to specify a custom
>> Git URI + branches. This adds more flexibility for custom
>> configurations.
> 
> The overwhelming majority of packages do not allow selecting an
> alternate location. Why would jailhouse be different?

Jailhouse requires system-specific configurations. Those configurations
are compiled from C source files to binaries during the build process.
While upstream Jailhouse comes with a lot of samples for supported
systems, you will need a lot of fine tuning to for a specific use case.

> 
> Are you trying to cover for development? In that case, the usual way is

In our case -- Yes.

> to use the override srcdir mechanism. See BR2_PACKAGE_OVERRIDE_FILE and
> provide such a file with definitions like;
> 
>     JAILHOUSE_OVERRIDE_SRCDIR = /path/to/your/local/development/tree/jailhouse

Oh, that could maybe work. Mario, could you please check that? In case
this works, we can simply add those definitions to our br2-external tree.

Thanks
  Ralf

> 
> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: Mario Mintel <mariomintel@gmail.com>
>> ---
>>  package/jailhouse/Config.in    | 36 ++++++++++++++++++++++++++++++++--
>>  package/jailhouse/jailhouse.mk | 17 ++++++++++++++--
>>  2 files changed, 49 insertions(+), 4 deletions(-)
>>
>> diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
>> index 596b4951db..47523747f9 100644
>> --- a/package/jailhouse/Config.in
>> +++ b/package/jailhouse/Config.in
>> @@ -3,18 +3,50 @@ config BR2_PACKAGE_JAILHOUSE
>>  	depends on BR2_aarch64 || BR2_x86_64
>>  	depends on BR2_LINUX_KERNEL
>>  	help
>> -	  The Jailhouse partitioning Hypervisor based on Linux.
>> +	  The Jailhouse Linux-based partitioning hypervisor.
>>  
>>  	  https://github.com/siemens/jailhouse
>>  
>>  if BR2_PACKAGE_JAILHOUSE
>>  
>> +choice
>> +	prompt "Jailhouse Version"
>> +
>> +config BR2_PACKAGE_JAILHOUSE_LATEST_VERSION
>> +	bool "Version 0.12"
>> +
>> +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
>> +	bool "Custom Git repository"
>> +	help
>> +	  This option allows Buildroot to get the Jailhouse source code
>> +	  from a custom Git repository.
>> +
>> +endchoice
>> +
>> +if BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
>> +
>> +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_URI
>> +	string "URI of custom repository"
>> +	default "https://github.com/siemens/jailhouse.git"
>> +
>> +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH
>> +	string "Name of Git branch"
>> +	default "master"
>> +
>> +endif
>> +
>> +config BR2_PACKAGE_JAILHOUSE_VERSION
>> +	string
>> +	default "0.12" if BR2_PACKAGE_JAILHOUSE_LATEST_VERSION
>> +	default BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH \
>> +		if BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
>> +
>>  config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
>>  	bool "helper scripts"
>>  	depends on BR2_PACKAGE_PYTHON
>>  	select BR2_PACKAGE_PYTHON_MAKO # runtime
>>  	help
>> -	  Python-based helpers for the Jailhouse Hypervisor.
>> +	  Python-based helpers for the Jailhouse hypervisor.
>>  
>>  	  https://github.com/siemens/jailhouse
>>  
>> diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
>> index 6356c5a7aa..d134b3d1b4 100644
>> --- a/package/jailhouse/jailhouse.mk
>> +++ b/package/jailhouse/jailhouse.mk
>> @@ -4,10 +4,23 @@
>>  #
>>  ################################################################################
>>  
>> -JAILHOUSE_VERSION = 0.12
>> -JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
>> +JAILHOUSE_VERSION = $(call qstrip,$(BR2_PACKAGE_JAILHOUSE_VERSION))
>>  JAILHOUSE_LICENSE = GPL-2.0
>> +ifeq ($(BR2_PACKAGE_JAILHOUSE_LATEST_VERSION),y)
>>  JAILHOUSE_LICENSE_FILES = COPYING
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT),y)
>> +JAILHOUSE_SITE = $(call qstrip,$(BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_URI))
>> +JAILHOUSE_SITE_METHOD = git
>> +else
>> +JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_JAILHOUSE)$(BR2_PACKAGE_JAILHOUSE_CUSTIM_GIT),y)
>> +BR_NO_CHECK_HASH_FOR += $(JAILHOUSE_SOURCE)
>> +endif
>> +
>>  JAILHOUSE_DEPENDENCIES = \
>>  	linux
>>  
>> -- 
>> 2.26.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3806f122-f6b0-efba-e94a-64a3729fbe8a%40oth-regensburg.de.
