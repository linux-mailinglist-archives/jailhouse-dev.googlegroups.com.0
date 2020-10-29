Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBLHA5P6AKGQEIBIWQZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id A431829F1B7
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 17:39:08 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id s25sf140401wmj.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 09:39:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603989548; cv=pass;
        d=google.com; s=arc-20160816;
        b=IjN05vOSiu/o8j/T4L8hIpK7uTcm7qsAmz69PeFJaQiGhGvsNqa0lhIo+hehomPWLV
         yxvdpEbFxYFX0N4qpDGdpWdz/w8Dm7wE+hDgyTsm6PgNQhyvDWC8y15dxHUIR+00nPT+
         s5Lv9X8prMLz6PeEJJQ0WvUpAKlgAXcxz7IEI9elkLmZ8Qn5Ga6H/yQFpzWOVaP2e4/J
         bpSViMcdSm/aMu/zQPy9vQQpmlmB3gKaETsDO3g9eZt61WNeX1QmG4z03x40VqZkutAh
         PhFSbvkZnKGUfgWV8iAjIZPgFQwkI+7ll663IWztIzkH0kR/s4qThyXX3eVALJX5h8EV
         Gm6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=e4yuNLvFjfAnmLoQwzsL9LMwcwyfaKXUyltPhqAUWRU=;
        b=TM8E9//w3na0gyc7JS/8Iz+Qk3XmeaX6r7l1+rHqF/EDc4bHzRcMwnHIZQ8uJhmlgu
         pg/qCr3UfJ3Nj6CbSvW798nWDadN3/lB642N8KfmoVyu+f+ORmVo5RMDstbdSRldRykF
         SmjGjUV2EMYDlGic8JuVjddLc1rld9W/ZwOURFXTxYWSRmUeZqfsh/JD0umfuMUhNrlj
         jZ4Zbu0wiO4Q+VourF6A2mNVBvVP625+yk4p8Zse0ERHfEeLzUzUVbgnp/aIG6vmbIwM
         LP28ez7IJkBPMy5odEE/Ok0rsahjWPuVRFV262DCu5+bxG86Bi81oA4vaQkXVd8CpYor
         Pniw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QtaC+5UK;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=e4yuNLvFjfAnmLoQwzsL9LMwcwyfaKXUyltPhqAUWRU=;
        b=k7O1MxUfhXuncq71RN9Iw/DNauu82+scB0DYqSQquNvMKgWNlZtISDZ019FNL6evpa
         HYCxvSg5ZtBCg5dgL/DVLRvxifX+mM6OIKtqBAc/6c0KxdPgNZR7+5JunCpod8vadbiK
         qtLu0KjTfJdbK9BF7zM7V9vH6gvlTHsHkVVSsWF+yTGKkfc4ZzXaK0ZnczFj/TufQ7LW
         R5DiYTyrRwm3PTyu3wHR8eTeGVZ+yBlSHPVLa/GsgToxRt+fpmH7ZHZmSPR1w3QWKn1L
         rnTKh3OZAay3/yWDy6jR0Q4fdd2dmRUh84Ity+CCm1GPMKhBgXHJGInNHTcuZgTUC0Io
         BpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=e4yuNLvFjfAnmLoQwzsL9LMwcwyfaKXUyltPhqAUWRU=;
        b=dsfkI7gHsAVdkmilTr5ZJvfwB21qIeMX0KwcKzRjK7Pzr9DmFPP2h2OXlZK0egWZqX
         oRMo6XTdGB4iPGws3jotSwZ5p+ougEvIFzE0HE7tAnrza2y3LCaKpexhXnYDkfd9jKiE
         uZWAJupRQ2VGQGcFx549p36QdP/vHH23bZRmZ3OwzuSDOdQmRz7xMCZHr+Z6kudnhwXi
         HqY5LW9WCTFmIW9fS5ivlZkpe8VRstlheplw50EFEwMmLmnPzQX+Y/ZCcdFsxd9xpKbp
         jTWP3t0IEfvTNdCP6MNngfnZvWSxSkP0rsX8hmIaJbICjrvUIraNhBDIt4aapVF+QiJm
         LJRQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532nx7+m0ybTEZerFHCyciBzjANN9SN/IQZsJMK3ATOYlNJDlYxZ
	awodbDvk0uysyQlN2KCzOso=
X-Google-Smtp-Source: ABdhPJxuUZ5IzOR2i01kRRImLV3lX43jdL66OFa5xWVnoWidwXQGe8ELXB2NovxDqDlTg5aW+FIrKA==
X-Received: by 2002:a1c:6788:: with SMTP id b130mr682188wmc.91.1603989548382;
        Thu, 29 Oct 2020 09:39:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7e4e:: with SMTP id z75ls255971wmc.0.canary-gmail; Thu,
 29 Oct 2020 09:39:07 -0700 (PDT)
X-Received: by 2002:a1c:6302:: with SMTP id x2mr109308wmb.121.1603989547257;
        Thu, 29 Oct 2020 09:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603989547; cv=none;
        d=google.com; s=arc-20160816;
        b=F5M0MVdpC4FHP7HasaJlov8mzFvS8kvwUv9g+xgH5/+psxS3RZusASLMxs3Ig/ZV8L
         /Zrqram6CDT/YmIs6R5s6lWH0VFf0XsX0jU4UiVAYc92WCgjPOonsWyJTRJkfd6mw+fE
         naoZWhPNRYRWlxyHo+qwZw2Hn/VUE7C++y9E11HNiWsIcvMkEzQAEKQIqip8ArQxyHiT
         iGQ5O+1o8RM8uf/IrMydTUIU5U3AsRM+N/p4ukk6HtFXwacEzetk3tLU4A0VIgknsKEr
         mgHfvZ5iYFKC0S9ypoxqB/66TQCt5iLNBUwQkdZ6DlEL4e2evLTfYsE+mmn4kTFeymBR
         tqEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=b+As50gVIm3qR+mbmg0OKuW+GG2zInXCr6WmbpPTH8A=;
        b=XyTIJ/SvA+ZjvEopyJi2JFvrnqRmFFEGzaf/F2UYfvKvkRapMzS0Lz7x3p/rv2mCQp
         uXHC7/j33AoT3yh5Vsj40dei6eWbS4fDjlH1wKEsQXeb3ffHjeqolEdfXgv1E8rFXWsW
         mMFwTp9a+LLYishuILBMkxk37Eth+BXl+AARMLmfhKyB+CUcM8Bgt70uKazEL8EqE5hL
         CVpxpniukmcRVQEn6AoH0C8jyvr18h4dtyCSlIt8rhcQf0L1f6JzGE1MXqY8qq5jIOuf
         izPA7LX8SPbD8IZC05n/1QO1p1gE3WBUcM8457n761UcPcmdmxqgEKBu//CA4xpMec+d
         vdLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QtaC+5UK;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id w6si16840wmk.2.2020.10.29.09.39.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 09:39:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4CMWNp5hvWzxs5;
	Thu, 29 Oct 2020 17:39:06 +0100 (CET)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 29 Oct
 2020 17:39:06 +0100
Subject: Re: [PATCH v3 2/2] inmates: x86: add cache access time test
To: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, <jailhouse-dev@googlegroups.com>
References: <20201029145515.386953-1-ralf.ramsauer@oth-regensburg.de>
 <20201029145515.386953-2-ralf.ramsauer@oth-regensburg.de>
 <1eab7944-3f71-dd82-99a5-b4806443d701@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <bc212e0a-d93b-4c3d-b6a9-f06caf21c382@oth-regensburg.de>
Date: Thu, 29 Oct 2020 17:39:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1eab7944-3f71-dd82-99a5-b4806443d701@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QtaC+5UK;
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



On 29/10/2020 17:16, Jan Kiszka wrote:
> On 29.10.20 15:55, Ralf Ramsauer wrote:
>> On x86_64 systems, this test inmate measures the time that is required to read
>> a value from main memory. Via rdtsc, it measures the CPU cycles that are
>> required for the access. Access can either happen cached, or uncached. In case
>> of uncached access, the cache line will be flushed before access.
>>
>> This tool repeats the measurement for 10e6 times, and outputs the
>> average cycles that were required for the access. Before accessing the
>> actual measurement, a dummy test is used to determine the average
>> overhead of one single measurement.
>>
>> And that's pretty useful, because this tool gives a lot of insights of
>> differences between the root and the non-root cell: With tiny effort, we
>> can also run it on Linux.
>>
>> If the 'overhead' time differs between root and non-root cell, this can
>> be an indicator that there might be some timing or speed differences
>> between the root and non-root cell.
>>
>> If the 'uncached' or 'cached' average time differs between the non-root
>> and root cell, it's an indicator that both might have different hardware
>> configurations / setups.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> since v2:
>>   - Move host code to tools/demos :-)
>>
>> since v1:
>>   - Move host code to tools/
>>
>> since RFC:
>>   - move the inmate to demos instead of tests
>>
>>
>>  .gitignore                  |  1 +
>>  inmates/demos/x86/Makefile  |  4 +++-
>>  tools/Makefile              |  9 +++++++--
>>  tools/demos/cache-timings.c | 29 +++++++++++++++++++++++++++++
>>  4 files changed, 40 insertions(+), 3 deletions(-)
>>  create mode 100644 tools/demos/cache-timings.c
>>
>> diff --git a/.gitignore b/.gitignore
>> index 1d8905ab..245733cb 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -21,6 +21,7 @@ hypervisor/hypervisor.lds
>>  inmates/lib/arm/inmate.lds
>>  inmates/lib/arm64/inmate.lds
>>  pyjailhouse/pci_defs.py
>> +tools/demos/cache-timings
>>  tools/demos/ivshmem-demo
>>  tools/jailhouse
>>  tools/jailhouse-gcov-extract
>> diff --git a/inmates/demos/x86/Makefile b/inmates/demos/x86/Makefile
>> index f53b739e..47b79869 100644
>> --- a/inmates/demos/x86/Makefile
>> +++ b/inmates/demos/x86/Makefile
>> @@ -13,7 +13,8 @@
>>  include $(INMATES_LIB)/Makefile.lib
>>  
>>  INMATES := tiny-demo.bin apic-demo.bin ioapic-demo.bin 32-bit-demo.bin \
>> -	pci-demo.bin e1000-demo.bin ivshmem-demo.bin smp-demo.bin
>> +	pci-demo.bin e1000-demo.bin ivshmem-demo.bin smp-demo.bin \
>> +	cache-timings.bin
>>  
>>  tiny-demo-y	:= tiny-demo.o
>>  apic-demo-y	:= apic-demo.o
>> @@ -22,6 +23,7 @@ pci-demo-y	:= pci-demo.o
>>  e1000-demo-y	:= e1000-demo.o
>>  ivshmem-demo-y	:= ../ivshmem-demo.o
>>  smp-demo-y	:= smp-demo.o
>> +cache-timings-y := cache-timings.o
>>  
>>  $(eval $(call DECLARE_32_BIT,32-bit-demo))
>>  32-bit-demo-y	:= 32-bit-demo.o
>> diff --git a/tools/Makefile b/tools/Makefile
>> index 8cf5df84..62585369 100644
>> --- a/tools/Makefile
>> +++ b/tools/Makefile
>> @@ -35,6 +35,13 @@ KBUILD_CFLAGS += $(call cc-option, -fno-pie)
>>  KBUILD_CFLAGS += $(call cc-option, -no-pie)
>>  
>>  BINARIES := jailhouse demos/ivshmem-demo
>> +targets += jailhouse.o demos/ivshmem-demo.o
>> +
>> +ifeq ($(ARCH),x86)
>> +BINARIES += demos/cache-timings
>> +targets += demos/cache-timings.o
>> +endif # $(ARCH),x86
>> +
>>  always-y := $(BINARIES)
>>  
>>  HAS_PYTHON_MAKO := \
>> @@ -104,8 +111,6 @@ define cmd_gen_man
>>  	sed 's/$${VERSION}/$(shell cat $(src)/../VERSION)/g' $< > $@
>>  endef
>>  
>> -targets += jailhouse.o demos/ivshmem-demo.o
>> -
>>  $(obj)/%: $(obj)/%.o
>>  	$(call if_changed,ld)
>>  
>> diff --git a/tools/demos/cache-timings.c b/tools/demos/cache-timings.c
>> new file mode 100644
>> index 00000000..2c591dab
>> --- /dev/null
>> +++ b/tools/demos/cache-timings.c
>> @@ -0,0 +1,29 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright (c) OTH Regensburg, 2020
>> + *
>> + * Authors:
>> + *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include <stdbool.h>
>> +#include <stdio.h>
>> +
>> +#define printk printf
>> +
>> +typedef unsigned int u32;
>> +typedef unsigned long long u64;
>> +
>> +void inmate_main(void);
>> +
>> +#include "../inmates/demos/x86/cache-timings-common.c"
>> +
>> +int main(void)
>> +{
>> +	inmate_main();
>> +	return 0;
>> +}
>>
> 
> Look mom, I shrunk my patch! But I guess that was not intional...

My dearest son, please have a closer look at path one.

Rhymed-By: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

> 
> Patch 1 is already in next, so you only need to refresh this one.
> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bc212e0a-d93b-4c3d-b6a9-f06caf21c382%40oth-regensburg.de.
