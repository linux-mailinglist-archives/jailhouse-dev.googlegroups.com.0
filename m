Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBBV35T6AKGQEVR7OFWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 6321D29F591
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 20:52:39 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id h6sf1686512ljl.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 12:52:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1604001159; cv=pass;
        d=google.com; s=arc-20160816;
        b=WdbpmkEMm0nSDhRHdnqyV5iSin9Fcqka8sO/8Seui1lxSv7saXDOELEDWZ9bRjHa3x
         jUxvi8gAWEkkbvS/yuT3L0fx4U2Q88lwm+WBB34F9pyJd8dV+GL/56b05gygMjnSQVPR
         KenH0K2cH0qt75mi0L3JrOWBOcvE/2SRsfTerKwE3D7E7oL0oiRCBa6IlHXFDDXv3M6l
         4W6ovgIx9zpkyR8NOjOc9FQVukmI4nK2D+EVvAu+FFItvLUR7k49GlTYLHutg6nx+9yO
         nySRdIVjRFpUEA2DMEw3J53iaHSTQns7jTSG12OnOdKgp+7qWOo4ZgMuaUyNFrFZXSp5
         TIKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=IaOzsux40D37WQhORjnhbjmHg9RNKaRbudwn7EGXnvk=;
        b=mhfdeHDzKZGTyopKwBWz+5TCzDZEYOP59Rr+qa8DmP97+TJMWJaxWErub2nL1qoD9J
         5amJqzwSWaFe1212Zt+I1yUKbq8AF1QPybaCobPImnH2Fwot4WD8n+gpsPEnf8JXmsaT
         DNvyFRPmvqSOnR+BezF6rD8BJPWAYrjdhhp2Ih5BHzphAOPV62yhs81qneOvVuOxFV1T
         rabU85WgNpN+fIxqgYe0nOHBa9JJmeu2jgDLsg1BaGLmHUgQGTUAHPuhjlXbrcWfxHO4
         Clk/vb8/UcL9an7CA0FpW6f/PvzY+e3VsUwVNX8fc/q+KVFwmwe8apRqm1+OcjDeyORd
         YtFQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=W4XB9Ji2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IaOzsux40D37WQhORjnhbjmHg9RNKaRbudwn7EGXnvk=;
        b=dVuUt9Zp1vYr9TA/KzMcZaxjdaRm+MDEOpGsSM6wYYgrXrQbN9xkwpInqpCseYsHHi
         CduZK0G8hBlyyz379GI5xnmsbEFV0mx5gvf9JUKTQy42uUYnbJ9CsDNYY635FP5Zzi6P
         1SRFloD3990e7NQ51EppJYl5RCNsA3uL5IyL+xnLnp1Vc1q8jexA2De1myJCIijYYXBl
         WYgdgr8lV4cjMqAGFe0bhAIDxsrEHGflSDTVsFs0aE9lXAjsinPrTwkGT2zsP8eJZgd8
         RNh8NDpGv8Z26RNd6YJWwxRmMCxT5Ig73BFEejpgE63jmttqh5r+pFPJs7E9shx5ZDBc
         I22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IaOzsux40D37WQhORjnhbjmHg9RNKaRbudwn7EGXnvk=;
        b=dLn5Kbmgu7oiO1Maf8KkNVMkfxQPrW8HGqGAjbKu1eLRiZC6gZG9wv/HZ8mgXToWRM
         vFKjcYy/Jq3UlCiJpfYioI6WPIaU7rTTfBIP9jJI+Ng5GqXOyfHS22R8VbUSKH75IeCH
         4wxRbXtqdFeZIgohBSL8TCyMYc74LVf6jHWDpxl7evDT1fTAWWaXtl77b8y0mddMSQK5
         USHEoUk+VO/I/PqelBsihkOOgDo5/6fkNLuvTrvyJjTr1u8/6JobcCJIVLGGvRggFoZ9
         JFLF0ZpiqicSjHMVK8pz6AHgVb+O5LM1qhF1yGvVkFmtjnJJkmzM+Y22JCLA3w6ZCzpx
         Xs4A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5311kb81h1/TUfEfMd89qEbAY2F7HMrSYtBJ8EpWJBCt7ze6apop
	tTg9FNTzDT61vXzo/fzuofw=
X-Google-Smtp-Source: ABdhPJxA8Z1pWRRq7bhqz6cxG8nnSve6xM3x98H+amAJZt3dHaqexXAUZsOAf8pddc90abJPfH50aw==
X-Received: by 2002:a2e:8750:: with SMTP id q16mr2359124ljj.53.1604001158962;
        Thu, 29 Oct 2020 12:52:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7c15:: with SMTP id x21ls60715ljc.8.gmail; Thu, 29 Oct
 2020 12:52:37 -0700 (PDT)
X-Received: by 2002:a2e:969a:: with SMTP id q26mr2797541lji.32.1604001157722;
        Thu, 29 Oct 2020 12:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604001157; cv=none;
        d=google.com; s=arc-20160816;
        b=fjGlcp8KS48PlN02Mc8vnl/f0zbz+W3WQBX6W1qcUEj20S6+nq7hvGh8WbZtRfbGBY
         VJlLDQHBGIXNZrdBHY6UUge2HXX7N75LROVgQ61IgsvWF9Vj/00/ORBXKC+ae+hMir2d
         9FfcCo5FWnvSpMHxp1tDusK0RafxVtOB+sAmWp1of8qUqouWNXfDp0J5ILmPXf+EtG7j
         sMSUAR9ZrSjhsq9WE8PfFezRP0BpNvBmJ3IFIwMeuUl3wb3pHW9+xAqq1iuhE794SzVO
         yCLTP3DsK8l1my+t5QjRous6Dv6jX0K/tUqHqiWKpDisTD3yqawI7+xnxaDWkWTAIHio
         yPuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=oismHw5H32lHeOP0S/X4AUnHHwkdiulHTHk0Og2ywXw=;
        b=gmWhmw5t49Jvj7X7yvDBBE7uTkOyLGLez1ffAtdvzz+I/HQSfG8Rizbo9wzkqR7Kcd
         cfa2lSUECg43NWfBUthpODdGu8UWHqGbzsXFCYCB8i3g6JDtmHK+NIAXpkkf/lDiqRiG
         dFNt0hUMniK3N1+JJ2E/2V9k8SM+/s1c2rXhcRcpXmeU+l5WyY4Wgy2r3ZviFfVqdDuh
         EL1QIQDCRva5dyWxA9dcpB5tZDmHuJ8gkcRR6F74B1UrYCRUldyT/yL4U19WKSlJSt4W
         O6Nks46dmc4plKXy2SOWPxCHad01nVlIlk8kLIyVfc651bWfsF8RIqPX09BezCNbkEdI
         3ePg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=W4XB9Ji2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id h4si120590ljl.1.2020.10.29.12.52.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 12:52:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4CMbh45dnfzxp2;
	Thu, 29 Oct 2020 20:52:36 +0100 (CET)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 29 Oct
 2020 20:52:36 +0100
Subject: Re: [EXT] Re: [PATCH v3 2/2] inmates: x86: add cache access time test
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
References: <20201029145515.386953-1-ralf.ramsauer@oth-regensburg.de>
 <20201029145515.386953-2-ralf.ramsauer@oth-regensburg.de>
 <1eab7944-3f71-dd82-99a5-b4806443d701@siemens.com>
 <bc212e0a-d93b-4c3d-b6a9-f06caf21c382@oth-regensburg.de>
 <fdd6d117-531e-1513-320a-61ac0cfc50a5@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <1724581e-f22f-b96a-94ff-bec6ec4e3bcc@oth-regensburg.de>
Date: Thu, 29 Oct 2020 20:52:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fdd6d117-531e-1513-320a-61ac0cfc50a5@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US-large
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=W4XB9Ji2;
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



On 10/29/20 8:06 PM, Jan Kiszka wrote:
> On 29.10.20 17:39, Ralf Ramsauer wrote:
>>
>>
>> On 29/10/2020 17:16, Jan Kiszka wrote:
>>> On 29.10.20 15:55, Ralf Ramsauer wrote:
>>>> On x86_64 systems, this test inmate measures the time that is required to read
>>>> a value from main memory. Via rdtsc, it measures the CPU cycles that are
>>>> required for the access. Access can either happen cached, or uncached. In case
>>>> of uncached access, the cache line will be flushed before access.
>>>>
>>>> This tool repeats the measurement for 10e6 times, and outputs the
>>>> average cycles that were required for the access. Before accessing the
>>>> actual measurement, a dummy test is used to determine the average
>>>> overhead of one single measurement.
>>>>
>>>> And that's pretty useful, because this tool gives a lot of insights of
>>>> differences between the root and the non-root cell: With tiny effort, we
>>>> can also run it on Linux.
>>>>
>>>> If the 'overhead' time differs between root and non-root cell, this can
>>>> be an indicator that there might be some timing or speed differences
>>>> between the root and non-root cell.
>>>>
>>>> If the 'uncached' or 'cached' average time differs between the non-root
>>>> and root cell, it's an indicator that both might have different hardware
>>>> configurations / setups.
>>>>
>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>> ---
>>>> since v2:
>>>>   - Move host code to tools/demos :-)
>>>>
>>>> since v1:
>>>>   - Move host code to tools/
>>>>
>>>> since RFC:
>>>>   - move the inmate to demos instead of tests
>>>>
>>>>
>>>>  .gitignore                  |  1 +
>>>>  inmates/demos/x86/Makefile  |  4 +++-
>>>>  tools/Makefile              |  9 +++++++--
>>>>  tools/demos/cache-timings.c | 29 +++++++++++++++++++++++++++++
>>>>  4 files changed, 40 insertions(+), 3 deletions(-)
>>>>  create mode 100644 tools/demos/cache-timings.c
>>>>
>>>> diff --git a/.gitignore b/.gitignore
>>>> index 1d8905ab..245733cb 100644
>>>> --- a/.gitignore
>>>> +++ b/.gitignore
>>>> @@ -21,6 +21,7 @@ hypervisor/hypervisor.lds
>>>>  inmates/lib/arm/inmate.lds
>>>>  inmates/lib/arm64/inmate.lds
>>>>  pyjailhouse/pci_defs.py
>>>> +tools/demos/cache-timings
>>>>  tools/demos/ivshmem-demo
>>>>  tools/jailhouse
>>>>  tools/jailhouse-gcov-extract
>>>> diff --git a/inmates/demos/x86/Makefile b/inmates/demos/x86/Makefile
>>>> index f53b739e..47b79869 100644
>>>> --- a/inmates/demos/x86/Makefile
>>>> +++ b/inmates/demos/x86/Makefile
>>>> @@ -13,7 +13,8 @@
>>>>  include $(INMATES_LIB)/Makefile.lib
>>>>
>>>>  INMATES := tiny-demo.bin apic-demo.bin ioapic-demo.bin 32-bit-demo.bin \
>>>> -	pci-demo.bin e1000-demo.bin ivshmem-demo.bin smp-demo.bin
>>>> +	pci-demo.bin e1000-demo.bin ivshmem-demo.bin smp-demo.bin \
>>>> +	cache-timings.bin
>>>>
>>>>  tiny-demo-y	:= tiny-demo.o
>>>>  apic-demo-y	:= apic-demo.o
>>>> @@ -22,6 +23,7 @@ pci-demo-y	:= pci-demo.o
>>>>  e1000-demo-y	:= e1000-demo.o
>>>>  ivshmem-demo-y	:= ../ivshmem-demo.o
>>>>  smp-demo-y	:= smp-demo.o
>>>> +cache-timings-y := cache-timings.o
>>>>
>>>>  $(eval $(call DECLARE_32_BIT,32-bit-demo))
>>>>  32-bit-demo-y	:= 32-bit-demo.o
>>>> diff --git a/tools/Makefile b/tools/Makefile
>>>> index 8cf5df84..62585369 100644
>>>> --- a/tools/Makefile
>>>> +++ b/tools/Makefile
>>>> @@ -35,6 +35,13 @@ KBUILD_CFLAGS += $(call cc-option, -fno-pie)
>>>>  KBUILD_CFLAGS += $(call cc-option, -no-pie)
>>>>
>>>>  BINARIES := jailhouse demos/ivshmem-demo
>>>> +targets += jailhouse.o demos/ivshmem-demo.o
>>>> +
>>>> +ifeq ($(ARCH),x86)
>>>> +BINARIES += demos/cache-timings
>>>> +targets += demos/cache-timings.o
>>>> +endif # $(ARCH),x86
>>>> +
>>>>  always-y := $(BINARIES)
>>>>
>>>>  HAS_PYTHON_MAKO := \
>>>> @@ -104,8 +111,6 @@ define cmd_gen_man
>>>>  	sed 's/$${VERSION}/$(shell cat $(src)/../VERSION)/g' $< > $@
>>>>  endef
>>>>
>>>> -targets += jailhouse.o demos/ivshmem-demo.o
>>>> -
>>>>  $(obj)/%: $(obj)/%.o
>>>>  	$(call if_changed,ld)
>>>>
>>>> diff --git a/tools/demos/cache-timings.c b/tools/demos/cache-timings.c
>>>> new file mode 100644
>>>> index 00000000..2c591dab
>>>> --- /dev/null
>>>> +++ b/tools/demos/cache-timings.c
>>>> @@ -0,0 +1,29 @@
>>>> +/*
>>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>>> + *
>>>> + * Copyright (c) OTH Regensburg, 2020
>>>> + *
>>>> + * Authors:
>>>> + *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>> + *
>>>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>>>> + * the COPYING file in the top-level directory.
>>>> + */
>>>> +
>>>> +#include <stdbool.h>
>>>> +#include <stdio.h>
>>>> +
>>>> +#define printk printf
>>>> +
>>>> +typedef unsigned int u32;
>>>> +typedef unsigned long long u64;
>>>> +
>>>> +void inmate_main(void);
>>>> +
>>>> +#include "../inmates/demos/x86/cache-timings-common.c"
>>>> +
>>>> +int main(void)
>>>> +{
>>>> +	inmate_main();
>>>> +	return 0;
>>>> +}
>>>>
>>>
>>> Look mom, I shrunk my patch! But I guess that was not intional...
>>
>> My dearest son, please have a closer look at path one.
>>
>> Rhymed-By: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>
> 
> Even rhyming doesn't bring back inmates/demos/x86/cache-timings*.c to
> me... :)

Uarg, didn't notice. Happened during a rebase, locally those files were
existent so I didn't notice. Still, the Patch 1 of this series is
another than Patch 1 of the last series.

Next time I'll try it with a spell. Maybe that helps. :)

  Ralf

> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1724581e-f22f-b96a-94ff-bec6ec4e3bcc%40oth-regensburg.de.
