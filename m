Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBPFF5T6AKGQEV5CXTCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5E229F47F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 20:06:37 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id f3sf1634226ljc.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 12:06:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603998397; cv=pass;
        d=google.com; s=arc-20160816;
        b=GnFXmeewL61EHeNMUkAU6oqWQ1ko+cccLXamjygR8ycY00LWl+k/xlQ/Mi9iM9xjU7
         byEBg+uMuVEDe//Jp5g1+yKAbUyc7E2AGkRNGJGMu7Eim3oZBmTHXIdQMFYco4F65yfv
         d69MPYnJFsGSrcipqy1h5Ic0RFssh+NA4v3dgbPySOnDqKXnWQxqzZj+cZcZAz+cKO9g
         IhPFgznnARrLX91010q5go3F5kRmnBnsvqmCGI/8RColNAAbogzO/AbQAzdfcprtJimN
         R3Ve0GYp9BGW0Og7gdJCYsRA6zOXt56/S+H4Jn3mMySwezLQdmN/YCmzaNB7S28JXsbd
         0OhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=yHZgrUP0uLsRwbiX6Zm+PYuJO8e9zyWkbdh+2Yff5PE=;
        b=s8FTHyAjq/KBqKo/JG+f6PUk2zqL8b75JWmzNlHLmjEkmaDYQ8FJClpHSITW2YVneH
         Ixdt5n/CipPAcW5l91Zt0gRUMIyJcilkpch7cxVL8UBdVsX4H9ZYMG0Zb/XA/8S2TsOh
         SL2AjW96xNdHWOxn0mv3LoBLsD88MhjDK9UtPCB1C1ojUUZ5NoruUMbJo8evUDQdUJMx
         lbjM3D9pqdZnPfwGdgmFDB1AZTUbprUnldaYgFie/DYpPLzHJfQqyJrb/w4wHiscWQYv
         Ogqwo/0ljyfNXsoNx5Bm2hyDVtNxhFbIo3cVJUPNEychXUQhz9Aw93NhjGJ1k+64UBXG
         I3zA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=VDAd9HVP;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yHZgrUP0uLsRwbiX6Zm+PYuJO8e9zyWkbdh+2Yff5PE=;
        b=mN1yc/tQuzvKyWHIx2GVaJpLtwzDPdQ+92c7BW0+6LkK8bRQuY5LtvxKQwwF8D51PC
         QfFb1ECTAgUoV2oCDG8UkiuZd4gOCafkKgIL+72JwF2XJR14W5/hfVukm3Us7WlOW2wu
         5lEW9swUaOqNKTKGS+3XgV5Z998tOrNA8JLb3z0pcVOlv47lA3cJhyFrY/ext8fGoaxh
         O/jXR1Ot7nE9lUG63bVmtQF9V17KCGf/osURdmli0OcSjEfpzKtzHoLDliLnSSTZK1Bs
         QyXDPsZ00zsKBpDFYAI3HoBSn/pjYkmsxubtVB73kWGXsjoHoIiorXadmIASjDBQyPUR
         LBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yHZgrUP0uLsRwbiX6Zm+PYuJO8e9zyWkbdh+2Yff5PE=;
        b=IijoIwr5lvLxrUHnjUM4O5A+vyhkSDO7/v2FORWESVMratHUHNp1BUJ6nTGda9Y90W
         Csrf9EUOw38Auz9oCKLVrXfH35lIg18vTSaNCq4I66GYd9D+ZL2wKjs8k8vcHmFTPxQZ
         ZnLgNnwyAYmFHBF8+S/bJPVlN9DZupshrdKNObNbGc1zvHsKEPITua3j5MvHd/lWgIRt
         8nfPGQRKyl0uTufUkvUgC2E31a6bx6YpnzFHnPG6xIsRRwFmeD5QWBj021JhL5YUmpKq
         ozsAv9URfjuRfD5eQ2KacXSG0QrBEvhe9a9T+l3ps+8qrmCBTa5usDrBdH4fKMJpDttW
         3WNw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533FCKGFNHu1PCv+uInSk3EX0ZHEomVa/x2aOWraXpoFUdZ/GhQ3
	cxhkakrtVhlEmx/8F15SNhg=
X-Google-Smtp-Source: ABdhPJxOfXsUxnq2G4A5yo8C5wLf54zcPZDDUpQdvi3rEQBkCzPYeMFZRKnHVIXltNyrCRc9yAZBRQ==
X-Received: by 2002:ac2:5a05:: with SMTP id q5mr2084031lfn.592.1603998397293;
        Thu, 29 Oct 2020 12:06:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9f48:: with SMTP id v8ls740691ljk.9.gmail; Thu, 29 Oct
 2020 12:06:36 -0700 (PDT)
X-Received: by 2002:a2e:8108:: with SMTP id d8mr2575363ljg.96.1603998396018;
        Thu, 29 Oct 2020 12:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603998396; cv=none;
        d=google.com; s=arc-20160816;
        b=adqP1+DaBOaXL8efVSC4VnrznWGsTxqNoyiq2eA1PJI4pDGd8iE0BnvhItnM48yDd0
         qIB6Xt7g1coJy1l5mWEHUvPXSbdrcK2aIIR6tkHdFP505PnUeHLnyypDtVtrfw6fdLFi
         QHJ5bdsNrkf4y8GK2liYGul8pOWj5dSZTw0Sk1F9ZCeAsFMZz1iskjI4OzeNjpxY3bsl
         VrvQ7EB8L1koHjeQan47H+P9NIUVUHrpzAJ9dmF+VdDCQSTxBmwW9YMY9zKaeLqzg67d
         vpnaTuiZMpelj/2U+lKWUJEIex4DODIkYoqyXsoD3sibc/GVjf10adGvIwu6hav1PX7l
         wYWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=2lhOnlBAqHBs0kkRRFOY1YPKOilPHan+JWsOGpZrB/o=;
        b=Hg6yYHFzikRr6L0ws60bvNBtRLVS0b0xEbsJCTmofFibwp8SgYg5xwILPqIB3r6uHS
         gCFSWPFlYq1/rvVi0d0GPZJ/Egh9a+zaFdfTls1VAV8xe4T0RL/24j4AGKrPe+Pe1scX
         YeBpupUppY+GgJmfM4ywmoWi/+t0n2yv2M6Dhemn8TrewBVFP6gN8KUuyTsRZQ8jskvo
         JJWG8tkshBpGLy3lM11+T28V/wAAaITW8XZQ6aAZ1O5DKUe7vET+Mll/E53n5THfA+Mz
         Qg5LFSouz7C1W4JqMr3ingGH2yfMVAeAkvOy6snJ6+jU0pUT2paBf6HwvRaonOFtRKlf
         tNPQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=VDAd9HVP;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id p1si89790ljc.0.2020.10.29.12.06.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 12:06:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MeSGJ-1kjYCS0wlL-00QFMP; Thu, 29
 Oct 2020 20:06:35 +0100
Subject: Re: [PATCH v3 2/2] inmates: x86: add cache access time test
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20201029145515.386953-1-ralf.ramsauer@oth-regensburg.de>
 <20201029145515.386953-2-ralf.ramsauer@oth-regensburg.de>
 <1eab7944-3f71-dd82-99a5-b4806443d701@siemens.com>
 <bc212e0a-d93b-4c3d-b6a9-f06caf21c382@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <fdd6d117-531e-1513-320a-61ac0cfc50a5@web.de>
Date: Thu, 29 Oct 2020 20:06:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bc212e0a-d93b-4c3d-b6a9-f06caf21c382@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:qalXf4jxrrUbRsvZqNzrG+0gpfpft40SWaoUwXgKSwB0/yblTDw
 TG3A973GVV5Ws5pQ5nSwr9H22VCInJAhOKW6yMm0vmDHcdsEU4qo7Urcre2s27QrJL1stpG
 qCjepz8qr7+cNouP9oY9yp0O370I0kbNyxirtSjD2lhjnQZiBtoElqKfy2PPjlrRBIWfMEn
 6fx/h9wSUNyXREeSCMXaA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EvwOaqvO5U8=:98S9v8fmroXtMj+fGppACW
 o09i2Hp43SaSQif0GnhyrqeyeaA3i3TK6K8wPgG6h9xhK6yBWOp30SpD0S2AAwsAF+UAxTA3g
 elqa4e6NmBHTlr/xHSJ0iNSUyqZZ4pEUz6UqrjeTd/T3+SWhXpO6nAuR+NXsPZm72foVnAoIP
 doqsyx3Y5bRUqK/7uqLKodfdfac8oBYR7FRUYdvUKeISEnZUl5KulTsT06zls/1CGrpp5PnHD
 lxgOiKqCy/3/3fFS47L3u7Nu63OJG/FZFZdypQNuu5q+vzC6R1DfaJ+MNCfTchVUk53ozIsH/
 Nu4l/G7piKmVaPvP0Zj0YTXj3G3E6v24mU+J9MZ4b7H4jcEcRw6AKQlITQtMr82pXjK7DqAuA
 KaTFqUplAR371kWsmKGHCYDSoTC0XOH+vctax5aO8VSh2YGbBZNrStDfrMTg5nRyGHA5v0W1H
 Lhv1r7BuHCxMRomrcgcOsmxm4Oo4Dx/5i7C3AbTWGIoYKx5EqHGcV1+7nlTjTEmvz88H4X720
 qg6Q6/REn17a7hXGieGAEX0lQliIV/v2bj+e9jnrfZDtrZfdh3EdJaAl/8YPXxnLiKjklpTkd
 nqjffqAynGzvwgfnFPDRnNNnl1ixvK+czMWPi8AVG8WUmsBiOnxJZoYrXAFpEPEUOYtTKLPk2
 0Lp/7zkzSfmGyHz44PAZpkZWKlPZTVbHYrFTxyOexdRhyB8QKsJUdCi8u8OKIfkDWy2AZLTpf
 ppuERZ0yjy0Xm2xJaM2OSbbt7Jpi3O3oodhXW1P05yvOwzy3q/BMZUrqh1YBQB/SXp9al5t2U
 69PncLiSBTnFBY/eIPqFPlxeO589sL2N5BrClRAGehzEz+McQzxpoqObCxfVejNN7lmQSbHzZ
 /Z08Mzf3wX+BYDM6YUug==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=VDAd9HVP;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=web.de
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

On 29.10.20 17:39, Ralf Ramsauer wrote:
>
>
> On 29/10/2020 17:16, Jan Kiszka wrote:
>> On 29.10.20 15:55, Ralf Ramsauer wrote:
>>> On x86_64 systems, this test inmate measures the time that is required to read
>>> a value from main memory. Via rdtsc, it measures the CPU cycles that are
>>> required for the access. Access can either happen cached, or uncached. In case
>>> of uncached access, the cache line will be flushed before access.
>>>
>>> This tool repeats the measurement for 10e6 times, and outputs the
>>> average cycles that were required for the access. Before accessing the
>>> actual measurement, a dummy test is used to determine the average
>>> overhead of one single measurement.
>>>
>>> And that's pretty useful, because this tool gives a lot of insights of
>>> differences between the root and the non-root cell: With tiny effort, we
>>> can also run it on Linux.
>>>
>>> If the 'overhead' time differs between root and non-root cell, this can
>>> be an indicator that there might be some timing or speed differences
>>> between the root and non-root cell.
>>>
>>> If the 'uncached' or 'cached' average time differs between the non-root
>>> and root cell, it's an indicator that both might have different hardware
>>> configurations / setups.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>> since v2:
>>>   - Move host code to tools/demos :-)
>>>
>>> since v1:
>>>   - Move host code to tools/
>>>
>>> since RFC:
>>>   - move the inmate to demos instead of tests
>>>
>>>
>>>  .gitignore                  |  1 +
>>>  inmates/demos/x86/Makefile  |  4 +++-
>>>  tools/Makefile              |  9 +++++++--
>>>  tools/demos/cache-timings.c | 29 +++++++++++++++++++++++++++++
>>>  4 files changed, 40 insertions(+), 3 deletions(-)
>>>  create mode 100644 tools/demos/cache-timings.c
>>>
>>> diff --git a/.gitignore b/.gitignore
>>> index 1d8905ab..245733cb 100644
>>> --- a/.gitignore
>>> +++ b/.gitignore
>>> @@ -21,6 +21,7 @@ hypervisor/hypervisor.lds
>>>  inmates/lib/arm/inmate.lds
>>>  inmates/lib/arm64/inmate.lds
>>>  pyjailhouse/pci_defs.py
>>> +tools/demos/cache-timings
>>>  tools/demos/ivshmem-demo
>>>  tools/jailhouse
>>>  tools/jailhouse-gcov-extract
>>> diff --git a/inmates/demos/x86/Makefile b/inmates/demos/x86/Makefile
>>> index f53b739e..47b79869 100644
>>> --- a/inmates/demos/x86/Makefile
>>> +++ b/inmates/demos/x86/Makefile
>>> @@ -13,7 +13,8 @@
>>>  include $(INMATES_LIB)/Makefile.lib
>>>
>>>  INMATES := tiny-demo.bin apic-demo.bin ioapic-demo.bin 32-bit-demo.bin \
>>> -	pci-demo.bin e1000-demo.bin ivshmem-demo.bin smp-demo.bin
>>> +	pci-demo.bin e1000-demo.bin ivshmem-demo.bin smp-demo.bin \
>>> +	cache-timings.bin
>>>
>>>  tiny-demo-y	:= tiny-demo.o
>>>  apic-demo-y	:= apic-demo.o
>>> @@ -22,6 +23,7 @@ pci-demo-y	:= pci-demo.o
>>>  e1000-demo-y	:= e1000-demo.o
>>>  ivshmem-demo-y	:= ../ivshmem-demo.o
>>>  smp-demo-y	:= smp-demo.o
>>> +cache-timings-y := cache-timings.o
>>>
>>>  $(eval $(call DECLARE_32_BIT,32-bit-demo))
>>>  32-bit-demo-y	:= 32-bit-demo.o
>>> diff --git a/tools/Makefile b/tools/Makefile
>>> index 8cf5df84..62585369 100644
>>> --- a/tools/Makefile
>>> +++ b/tools/Makefile
>>> @@ -35,6 +35,13 @@ KBUILD_CFLAGS += $(call cc-option, -fno-pie)
>>>  KBUILD_CFLAGS += $(call cc-option, -no-pie)
>>>
>>>  BINARIES := jailhouse demos/ivshmem-demo
>>> +targets += jailhouse.o demos/ivshmem-demo.o
>>> +
>>> +ifeq ($(ARCH),x86)
>>> +BINARIES += demos/cache-timings
>>> +targets += demos/cache-timings.o
>>> +endif # $(ARCH),x86
>>> +
>>>  always-y := $(BINARIES)
>>>
>>>  HAS_PYTHON_MAKO := \
>>> @@ -104,8 +111,6 @@ define cmd_gen_man
>>>  	sed 's/$${VERSION}/$(shell cat $(src)/../VERSION)/g' $< > $@
>>>  endef
>>>
>>> -targets += jailhouse.o demos/ivshmem-demo.o
>>> -
>>>  $(obj)/%: $(obj)/%.o
>>>  	$(call if_changed,ld)
>>>
>>> diff --git a/tools/demos/cache-timings.c b/tools/demos/cache-timings.c
>>> new file mode 100644
>>> index 00000000..2c591dab
>>> --- /dev/null
>>> +++ b/tools/demos/cache-timings.c
>>> @@ -0,0 +1,29 @@
>>> +/*
>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>> + *
>>> + * Copyright (c) OTH Regensburg, 2020
>>> + *
>>> + * Authors:
>>> + *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>>> + * the COPYING file in the top-level directory.
>>> + */
>>> +
>>> +#include <stdbool.h>
>>> +#include <stdio.h>
>>> +
>>> +#define printk printf
>>> +
>>> +typedef unsigned int u32;
>>> +typedef unsigned long long u64;
>>> +
>>> +void inmate_main(void);
>>> +
>>> +#include "../inmates/demos/x86/cache-timings-common.c"
>>> +
>>> +int main(void)
>>> +{
>>> +	inmate_main();
>>> +	return 0;
>>> +}
>>>
>>
>> Look mom, I shrunk my patch! But I guess that was not intional...
>
> My dearest son, please have a closer look at path one.
>
> Rhymed-By: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>

Even rhyming doesn't bring back inmates/demos/x86/cache-timings*.c to
me... :)

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fdd6d117-531e-1513-320a-61ac0cfc50a5%40web.de.
