Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSWXUP7AKGQEHIKMKDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC572CD7C8
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Dec 2020 14:44:43 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id a8sf730131ljm.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Dec 2020 05:44:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607003083; cv=pass;
        d=google.com; s=arc-20160816;
        b=EEdh/JaTpi8lWZCsLfvmbwiBv7o0B3LX+E6fcA1OWdeRMcn3veGd3EnjfxAvVPg4hU
         M9VXKd1YcP/XHDu1Arxt11nUxJvtss63MVJscA5IG90RjyLl5sisJFx00pplxlZhroUI
         i2coObbTgWRRoBaiSJBMHsKViBNV90kpw/JCAj6LXxx/2ow8tupBNWvNIRTFEBgE8IVv
         G/ObVykqlSc0QOCCUN6M8Po5ByKGZLtJMPHj/HHn82MQg7/w1wuglAbID0Tdm6mWXoRx
         8bHe80dZzzDNUkyDn1TFoqoI69kh0PIBTWWsTs0JSEZIWyjIBaexjCjQJIsORtTq+vFp
         WvhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=7Dz0XagKZiY3+wYtR5ZAEkZmIuU6AJVUnBnCgWvnSag=;
        b=XCYYkwdLTcIuz9OcuOVZCZ3RxDNLxzSMy9YKTgnM3Wha2nZjVDcEUd9JOMENHnDkg3
         DJV8IhCiOsxKCbkieXb/ioENbzH1onbG3UNUYmWfVFBA9j7Ka3jHNqfsbSpFzBU6w2WE
         jvtTrtEZZrOCf1bO4cUhu1LWAkriFBAso/HSjtLvlMioOjwm4b0XGdfutkNDieei/kWm
         fcZpJDr6fm50bZLE3UmKOm2BPHmOFD1wqFlfC1J+tVA48mTKslzgcPs4xviZ/FFzudl6
         90H6j1HuC4o4KqQJU0x0S9mRBwHJMzlbofOFMW1LRb8I8bCji6aY+nDY/6XYEkulrot3
         BV6g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7Dz0XagKZiY3+wYtR5ZAEkZmIuU6AJVUnBnCgWvnSag=;
        b=YJR5hbsCBFR0v4FrUx7yGJM8oOWvb5WMMLbQPsVwfBiY5EalPOXz66gn60h6FgUaQz
         OM5PbwympX4JAGzNP3Se22GsPBOE6Lk8OkmFgJqJOirtoBiz+OtAp7+qRN+gdbQtR/HD
         kSd8HSeAXk+fJvId2AzXpqRcI8YD0zVIhrge0ayQ/8O9Tm6Q7NME0A7l+XprR+y8Zz4M
         pfktYJ3tbKWgefoh8pTt9T1oSGJUrRoxy+hS9Y9NBTbLIKpbcM0quxSCn3/RkzDo2bLQ
         zXzBc48Q1+x5d+sTFxKc4qgFLRh3dGLA4/dzy59HEiihYLJyhrVtNJa9vTI0YkTt/0o6
         FpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7Dz0XagKZiY3+wYtR5ZAEkZmIuU6AJVUnBnCgWvnSag=;
        b=hLVHmjzgyyI/GqwqSHbCINnTgW8FMs5I7QQD0CGLGOdZnBs1rUxT+IT9MlA76TJz3z
         TjMdduMImHg16VoQxt5ks+oZPANs21uIoRi3hd/Z54V2z87FlQtJiPkURU4D3hBf49L6
         8NVwPudrr2caxKp/kAEi2M101uXuyMAnQ91S5SQNz97tf8ftiMV5IXHfLXHEdRyIUhIm
         WKDBgtqA3J5z+juw8NpeRhymm3FCMcMJeV/R9af+b5TLtvxhorr2Ea9p8zZh0EUckClF
         iOMoRLVJe6X/BMjYcYDjriRB1RtXVkNDnTGO3wnTwaZvYvtPZGsfvDl0o+bQtRlXwn8d
         QeVw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533rPoQEmos/eW3pUUwfHMyfO+m+GimKbJna5SgiDFXSJU5Ze3DC
	xGnEHBPWZoyeWr4fY07PPy8=
X-Google-Smtp-Source: ABdhPJzerf6ZX6TauKXZtQEv2iiJby8Gzb2y68iYoOYBDsANXyj769vho4/553A8XRfUv+ij/CNGGg==
X-Received: by 2002:a2e:a179:: with SMTP id u25mr1347657ljl.122.1607003083152;
        Thu, 03 Dec 2020 05:44:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:58ed:: with SMTP id v13ls483312lfo.2.gmail; Thu, 03 Dec
 2020 05:44:41 -0800 (PST)
X-Received: by 2002:a19:4915:: with SMTP id w21mr1320240lfa.57.1607003081833;
        Thu, 03 Dec 2020 05:44:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607003081; cv=none;
        d=google.com; s=arc-20160816;
        b=OxFGJ8K3GUU1J1KLD50VPJHA92DMUszve2ThGJVQRLi+E7nMjXIs1KazzsVOIuNi6k
         X03ShDjng7d6EhaUAIThG0fs8Y5T/MPw7Y/oo2/66OHRvIxdOliGjdNMq5XeMEvRRxOw
         jvpMY0H/U0PRCJU6/fzYfIkgBTU4k7iMnyhgwjkyWrGi/kNukcDvF+z6zCMd3rm1chtC
         r9RNMbu9PrP80cPRvE0Tod8jHOTSnunLqfZhvusNf5jzcZMBMlinVyC7n+hCZYgNtog0
         ViCWB/8kOfUplm/vkFdZ+u+TOkrkYkTZDuZZIVCSob6m8TbDMNMZ4z23rmeKJCfm987M
         r+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=0Lj8xH/wM2KQOo30DtSpc1ojOOIpSbXL+NCUNJzubRM=;
        b=LNPAR5zAgQIyMA0hrYKMycW3jygQA8lE9hzcAx93rSzxZcCQuDRfS7CyXb/a1sQq77
         zDzE72QfdiBarGKrF/XCRes9dtLOTFEmX9+ZBybJ+uHXZ3dcbW6ZsiL0y6A+DqfSUtvF
         bY3fvbl1wuThjFXxErlxNyaCSPgWR2INnyT8qgLqq7y8XB3UQYk3dTWeEJ7oDjOriFhV
         br/2AhB+nAIusN6H5vCvM5iqVP7XxgahbCigcsTKgDpitWhoZZ3+edd6KUohNyHoIQy8
         EWUs81dvlXS1HN/3WyJzkOizsB3AsnR6hsgQORmur6dyDrhIMnKCjw45tivz/Nw3JP1w
         yDEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id c8si48955lfc.1.2020.12.03.05.44.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Dec 2020 05:44:41 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0B3Dielw008450
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Dec 2020 14:44:40 +0100
Received: from [167.87.33.175] ([167.87.33.175])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B3DidqF003297;
	Thu, 3 Dec 2020 14:44:40 +0100
Subject: Re: [PATCH v3 1/2] arm64, configs: SMMUv2: Separate stream ID's mask
 and id
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: "Devshatwar, Nikhil" <nikhil.nd@ti.com>, Peng Fan <peng.fan@nxp.com>
References: <20201127114140.37179-1-andrea.bastoni@tum.de>
 <cfe00e93-66dd-ad37-e30d-2f4e889e4c56@siemens.com>
 <403b209e-8281-6f0b-409a-bd6dc14862c8@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6c4ee376-6573-ecc7-2e50-f6a74156fd75@siemens.com>
Date: Thu, 3 Dec 2020 14:44:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <403b209e-8281-6f0b-409a-bd6dc14862c8@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 03.12.20 13:48, Andrea Bastoni wrote:
> On 03/12/2020 07:36, Jan Kiszka wrote:
>> On 27.11.20 12:41, Andrea Bastoni wrote:
>>> The SMMUv2 allows filtering bits when matching stream IDs before they're
>>> passed to the TCU. In this way multiple streams legally get the same
>>> translation.
>>>
>>> On boards such as the ZCU Ultrascale+, the master ID needed to identify
>>> the corresponding SMMU stream ID may be dependent on a specific AXI ID
>>> that is set by the PL (and could be IP specific).
>>>
>>> One single fixed mask to pass to the SMR to compact multiple stream IDs
>>> before they "hit" the TCU is not flexible enough. The use-case is to
>>> compact similar PL-originating masters and have the SMMU behaving the
>>> same for them (e.g., they're assigned to the same inmate). At the
>>> same time, one needs a full stream_id to assign e.g., different GEM
>>> ethernets to different inmates.
>>>
>>> Update a stream_id to support two different interpretations:
>>> - for the SMMUv2, provide an explicit mask + ID.
>>> - for the SMMUv3, keep the current single ID.
>>>
>>> This commit updates the SMMUv2 / v3 --including configuration--
>>> accordingly.
>>
>> CC'ing Nikil and Peng on their affected code.
>>
>>>
>>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>>> ---
>>>  configs/arm64/imx8qm-linux-demo.c       |  7 ++-
>>>  configs/arm64/imx8qm.c                  | 16 +++++--
>>>  configs/arm64/k3-j7200-evm-linux-demo.c |  2 +-
>>>  configs/arm64/k3-j7200-evm.c            |  2 +-
>>>  configs/arm64/k3-j721e-evm-linux-demo.c |  2 +-
>>>  configs/arm64/k3-j721e-evm.c            |  2 +-
>>>  configs/arm64/ultra96.c                 | 11 ++++-
>>>  configs/arm64/zynqmp-zcu102.c           | 15 +++++-
>>>  hypervisor/arch/arm64/smmu-v3.c         |  9 ++--
>>>  hypervisor/arch/arm64/smmu.c            | 64 ++++++++++++++++---------
>>>  hypervisor/arch/arm64/ti-pvu.c          | 21 ++++----
>>>  include/jailhouse/cell-config.h         | 18 ++++---
>>>  12 files changed, 114 insertions(+), 55 deletions(-)
>>>
>>> diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
>>> index f13ca7bc..e8e8b217 100644
>>> --- a/configs/arm64/imx8qm-linux-demo.c
>>> +++ b/configs/arm64/imx8qm-linux-demo.c
>>> @@ -19,7 +19,7 @@ struct {
>>>  	struct jailhouse_memory mem_regions[18];
>>>  	struct jailhouse_irqchip irqchips[4];
>>>  	struct jailhouse_pci_device pci_devices[2];
>>> -	__u32 stream_ids[1];
>>> +	union jailhouse_stream_id stream_ids[1];
>>>  } __attribute__((packed)) config = {
>>>  	.cell = {
>>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>>> @@ -194,6 +194,9 @@ struct {
>>>  	},
>>>  
>>>  	.stream_ids = {
>>> -		0x10,
>>> +		{
>>> +			.mmu500.mask = 0x7f8,
>>> +			.mmu500.id = 0x10,
>>
>> Would list id before the mask.
>>
>>> +		},
>>>  	},
>>>  };
>>> diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
>>> index d63c73cf..2ec4f4dd 100644
>>> --- a/configs/arm64/imx8qm.c
>>> +++ b/configs/arm64/imx8qm.c
>>> @@ -20,7 +20,7 @@ struct {
>>>  	struct jailhouse_memory mem_regions[15];
>>>  	struct jailhouse_irqchip irqchips[3];
>>>  	struct jailhouse_pci_device pci_devices[2];
>>> -	__u32 stream_ids[3];
>>> +	union jailhouse_stream_id stream_ids[3];
>>>  } __attribute__((packed)) config = {
>>>  	.header = {
>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>>> @@ -54,7 +54,6 @@ struct {
>>>  					.type = JAILHOUSE_IOMMU_ARM_MMU500,
>>>  					.base = 0x51400000,
>>>  					.size = 0x40000,
>>> -					.arm_mmu500.sid_mask = 0x7f80,
>>>  				},
>>>  			},
>>>  
>>> @@ -209,6 +208,17 @@ struct {
>>>  	},
>>>  
>>>  	.stream_ids = {
>>> -		0x11, 0x12, 0x13,
>>> +		{
>>> +			.mmu500.mask = 0x7f8,
>>> +			.mmu500.id = 0x11,
>>> +		},
>>> +		{
>>> +			.mmu500.mask = 0x7f8,
>>> +			.mmu500.id = 0x12,
>>> +		},
>>> +		{
>>> +			.mmu500.mask = 0x7f8,
>>> +			.mmu500.id = 0x13,
>>> +		},
>>>  	},
>>>  };
>>> diff --git a/configs/arm64/k3-j7200-evm-linux-demo.c b/configs/arm64/k3-j7200-evm-linux-demo.c
>>> index 90a0ce4c..ace9cd3a 100644
>>> --- a/configs/arm64/k3-j7200-evm-linux-demo.c
>>> +++ b/configs/arm64/k3-j7200-evm-linux-demo.c
>>> @@ -26,7 +26,7 @@ struct {
>>>  	struct jailhouse_memory mem_regions[19];
>>>  	struct jailhouse_irqchip irqchips[3];
>>>  	struct jailhouse_pci_device pci_devices[2];
>>> -	__u32 stream_ids[1];
>>> +	union jailhouse_stream_id stream_ids[1];
>>>  } __attribute__((packed)) config = {
>>>  	.cell = {
>>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>>> diff --git a/configs/arm64/k3-j7200-evm.c b/configs/arm64/k3-j7200-evm.c
>>> index c3ac331d..d0c8aee3 100644
>>> --- a/configs/arm64/k3-j7200-evm.c
>>> +++ b/configs/arm64/k3-j7200-evm.c
>>> @@ -21,7 +21,7 @@ struct {
>>>  	struct jailhouse_memory mem_regions[32];
>>>  	struct jailhouse_irqchip irqchips[6];
>>>  	struct jailhouse_pci_device pci_devices[2];
>>> -	__u32 stream_ids[1];
>>> +	union jailhouse_stream_id stream_ids[1];
>>>  } __attribute__((packed)) config = {
>>>  	.header = {
>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>>> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
>>> index 5b6aa82e..1b8b3c4c 100644
>>> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
>>> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
>>> @@ -27,7 +27,7 @@ struct {
>>>  	struct jailhouse_memory mem_regions[22];
>>>  	struct jailhouse_irqchip irqchips[4];
>>>  	struct jailhouse_pci_device pci_devices[2];
>>> -	__u32 stream_ids[2];
>>> +	union jailhouse_stream_id stream_ids[2];
>>>  } __attribute__((packed)) config = {
>>>  	.cell = {
>>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>>> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
>>> index ab13fedd..aa5b47a9 100644
>>> --- a/configs/arm64/k3-j721e-evm.c
>>> +++ b/configs/arm64/k3-j721e-evm.c
>>> @@ -22,7 +22,7 @@ struct {
>>>  	struct jailhouse_memory mem_regions[40];
>>>  	struct jailhouse_irqchip irqchips[6];
>>>  	struct jailhouse_pci_device pci_devices[2];
>>> -	__u32 stream_ids[30];
>>> +	union jailhouse_stream_id stream_ids[30];
>>>  } __attribute__((packed)) config = {
>>>  	.header = {
>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>>> diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
>>> index db65ae01..19be84ae 100644
>>> --- a/configs/arm64/ultra96.c
>>> +++ b/configs/arm64/ultra96.c
>>> @@ -21,7 +21,7 @@ struct {
>>>  	struct jailhouse_memory mem_regions[11];
>>>  	struct jailhouse_irqchip irqchips[1];
>>>  	struct jailhouse_pci_device pci_devices[2];
>>> -	__u32 stream_ids[2];
>>> +	union jailhouse_stream_id stream_ids[2];
>>>  } __attribute__((packed)) config = {
>>>  	.header = {
>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>>> @@ -161,6 +161,13 @@ struct {
>>>  	},
>>>  
>>>  	.stream_ids = {
>>> -		0x870, 0x871
>>> +		{
>>> +			.mmu500.mask = 0x0,
>>> +			.mmu500.id = 0x870,
>>> +		},
>>> +		{
>>> +			.mmu500.mask = 0x0,
>>> +			.mmu500.id = 0x871,
>>
>> Only realizing now: That mask is an "ignore mask", right? Bits set there
>> are NOT matched against the id. That's modeled after the hardware? Is
>> this really intuitive? This one confused me at least.
> 
> Yes, it is model after the hardware. Maybe "ignore_mask" or "imask" would be better?
> 

...r invert it in SMR_GET_MASK? Not sure what is nicer. The latter has
the disadvantage that you then always need to specify a non-zero mask.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6c4ee376-6573-ecc7-2e50-f6a74156fd75%40siemens.com.
