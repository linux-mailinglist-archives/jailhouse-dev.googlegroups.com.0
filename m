Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBEEYUT7AKGQEBSMPOQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C7A2CDA8F
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Dec 2020 17:02:25 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id l5sf1367856wrn.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Dec 2020 08:02:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607011345; cv=pass;
        d=google.com; s=arc-20160816;
        b=B6OlGcA1/vla0UgrjYXSX+zrt5qYSZ1NreT7NecnFSsjip4VOFPI2SmUhf2Rs1Mh98
         R+sNTwLz7gtjUm1rTuOMRAP3HXrPNYRR8SSA5kba2ZG+arhWE8mLstqr76TgapWEgYjt
         SqmTXiChrNzuqOmLcFhAyfLJmdYi9K303w5GvxuEHvGkwrQ8qJ4JH8j1Yi2otFC5QnRW
         rphzpPuxbPXLNvzKh1YTEQUmsYriNakhns4fNh2xv/HIYB5nAnfrqK71jRkV3tW+tbOT
         ElKih7mPy2b0FTa4LKs6d71R/cfKLCjeVhYyG+7TWpFsZuNnnxpk5z+UcCN2Md4NbJPr
         d46Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=Gt8LU4veQnLfuFBqSgEBNVoX8UdQf+3fS33X6MvcHqQ=;
        b=0EiMnC5QMdvPYpScj9lbIoZbxrs9Q79gw2BxgUjDlBY/ldSUR7nKLjDn3cW2oGYiq6
         aIvnek7n7Y3KELpyOjULOv0zi3Ksw/7Sw/nH0Ggyf7eJEIxYmPG3z7TtrSps0XEcc1hI
         KBnV5+QGPIjDTOjurzxX2FRb399w7mIz2Y8GIHJkqg089tI90OTQjK9tMDKn+uziZF9D
         WHxiTKnFZLkS1MwAsnnAV1W09orJ8VlsiEJCwDSCt9nVPCFgMam0ceIl8lfG1fz5XaPy
         OJliZQGEe65b5AiFANVvBdztr3RpC9XmkVbyK9+jFM9ErbnskWLDbOh+1HioBi+C44as
         7OcA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Gt8LU4veQnLfuFBqSgEBNVoX8UdQf+3fS33X6MvcHqQ=;
        b=sNNictV0HW45QCmrpY6U2vXHEfzktRcPFqRr0ARzYdppCBowCsSy2HZGioSHL1Vl7M
         ex7K8WqXig9ecV9YrcUoiMNsd+IFl3VaUs9eu42p+SnNtZUNHW0g3HHD1i5jY3PzN1nZ
         kyAZTAVX+IyqfXjNurk36zCX5QxZ5lfS0nE16jvuwouTGuQpRzo/bwEnp8kkUlxfbtjL
         aJwj16Uh28iLirVEcbFKWwygeZHeiO2vcmvJJI9ndzjRSXOh35q03UAD4ShGMCFkuI6Y
         0jUOvOGPmQES0b6ftDFH0H+uS0+KvLdxcWNaOePplN1XutOshQMwLvo/XFm+ZSd6X4ls
         m0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Gt8LU4veQnLfuFBqSgEBNVoX8UdQf+3fS33X6MvcHqQ=;
        b=Vgucz8IMj6Jw8I8l0TvDV8RErurV8k92nsPQKsbfp2AG1EePNIAwKsOfI9YNGpRwht
         MelqDlf+JHAgWxu+GMt0x6kvveg4vtiv1Qcgy12VrRaT6q3CpsF+u7BW7CDBUGw9Y/L6
         NpSTTl+DgPKdhP/wm8nLb8ihvZ1tPZ4cmcKuIdhjP72l5/YETrIMjltrlK0CAcMcFBnH
         e2gXtnBwtesl8rp6YaHtmdTQM5ShN5uMKby+pH5L1fTZKulqV33v1p+dFjgDI9lR2cHo
         +S+eqpw4hnohVivYPybZVJrHDrLb2NvC+K6B0t9l8S8Tkx73ymsxdlxOib3+vnOcb/YQ
         U7Xw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533vtbFMCz+WJdWklMxMMOMBRoNl6MJYGlxIBVxOTrrsWOSZS8L7
	/mefLF57f7vZLlpumwJDmZE=
X-Google-Smtp-Source: ABdhPJzR7o+9QMnzrjY9Gr2LKHV5hbt97IkTet4xxuJWn251IQ9+HVtrofLGd29Tdn4MLcLLNBLevQ==
X-Received: by 2002:adf:f783:: with SMTP id q3mr4502894wrp.88.1607011345211;
        Thu, 03 Dec 2020 08:02:25 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c354:: with SMTP id l20ls2870474wmj.0.canary-gmail; Thu,
 03 Dec 2020 08:02:24 -0800 (PST)
X-Received: by 2002:a05:600c:21d1:: with SMTP id x17mr4082857wmj.16.1607011344170;
        Thu, 03 Dec 2020 08:02:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607011344; cv=none;
        d=google.com; s=arc-20160816;
        b=or+IujeQQbCt7gKPLf5aFTGfr1b2/e0TMCmcJwl2h/8WajPyoCVc58iUuMCDE+JjpB
         MS9Sq37ZeQbNteU8qzRSL9hFqtSsP7/fZfn+PJET7opJvAo5p6FCHc6RssJQNEn4p9+Z
         +MwZMhvPXLx0XjrpQSURwPk+laOJxM0sQO2Cgr9ITPMcZFWm6xjzocRtDIYqyNs4cToM
         MItEQKN3opbrxeL6D6P6a5tkj52fVWvLl9kWBMf2pa2+JpK2CP00QD7zMHPbjOQY4mKi
         OkLpXZ7ESEdxrTMTXX55JHGauckkCe4q3aKYxI1BL/Fx0Te5EOY6MXDYUZlh4t18PwiB
         vM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=wILEVd3oLU95bcdMAsmc7TdN3T+Ec/2Zf4hXLq19maM=;
        b=ZhCa+STh+RKqs3uDcGv+jKx37xTcMW+zyWFeJxfUgspUXAKS/Jhku6BfkBb9yC5xc/
         tkMN1W5qnnBzOAA7hW5LRI2CKw36KbNG7RnFjQO14QH4Z1ags2bWgDQ59mjOIFgz8OnN
         C6xkEFtt5jxda32jY5H6OneAvHUKbc5NnO8oMQJ7YhK+oGVSmjTK/PpEYreDtQuivzJ2
         +WezJIy76dKj2J8quhftNWm1P4xGtO/thqsTfJxeZ6gEksW3XJKsYRx+0XpT6qxwQV0f
         1oagAQmedQWX7wI2PI/VTMbig/GVVTuhmj6Iwpjwqy7FLE/G2xrz0Sgp707KT64Hkpch
         QXZQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id d17si93258wma.4.2020.12.03.08.02.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Dec 2020 08:02:24 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0B3G2NWl029470
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Dec 2020 17:02:23 +0100
Received: from [167.87.33.175] ([167.87.33.175])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B3G2M1X025932;
	Thu, 3 Dec 2020 17:02:23 +0100
Subject: Re: [PATCH v3 1/2] arm64, configs: SMMUv2: Separate stream ID's mask
 and id
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: "Devshatwar, Nikhil" <nikhil.nd@ti.com>, Peng Fan <peng.fan@nxp.com>
References: <20201127114140.37179-1-andrea.bastoni@tum.de>
 <cfe00e93-66dd-ad37-e30d-2f4e889e4c56@siemens.com>
 <403b209e-8281-6f0b-409a-bd6dc14862c8@tum.de>
 <6c4ee376-6573-ecc7-2e50-f6a74156fd75@siemens.com>
 <540d5217-5b22-a0a5-d067-304c49e82006@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9e5869e4-8f93-a0d0-7758-87ba610bd626@siemens.com>
Date: Thu, 3 Dec 2020 17:02:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <540d5217-5b22-a0a5-d067-304c49e82006@tum.de>
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

On 03.12.20 16:23, Andrea Bastoni wrote:
> On 03/12/2020 14:44, Jan Kiszka wrote:
>> On 03.12.20 13:48, Andrea Bastoni wrote:
>>> On 03/12/2020 07:36, Jan Kiszka wrote:
>>>> On 27.11.20 12:41, Andrea Bastoni wrote:
>>>>> The SMMUv2 allows filtering bits when matching stream IDs before they're
>>>>> passed to the TCU. In this way multiple streams legally get the same
>>>>> translation.
>>>>>
>>>>> On boards such as the ZCU Ultrascale+, the master ID needed to identify
>>>>> the corresponding SMMU stream ID may be dependent on a specific AXI ID
>>>>> that is set by the PL (and could be IP specific).
>>>>>
>>>>> One single fixed mask to pass to the SMR to compact multiple stream IDs
>>>>> before they "hit" the TCU is not flexible enough. The use-case is to
>>>>> compact similar PL-originating masters and have the SMMU behaving the
>>>>> same for them (e.g., they're assigned to the same inmate). At the
>>>>> same time, one needs a full stream_id to assign e.g., different GEM
>>>>> ethernets to different inmates.
>>>>>
>>>>> Update a stream_id to support two different interpretations:
>>>>> - for the SMMUv2, provide an explicit mask + ID.
>>>>> - for the SMMUv3, keep the current single ID.
>>>>>
>>>>> This commit updates the SMMUv2 / v3 --including configuration--
>>>>> accordingly.
>>>>
>>>> CC'ing Nikil and Peng on their affected code.
>>>>
>>>>>
>>>>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>>>>> ---
>>>>>  configs/arm64/imx8qm-linux-demo.c       |  7 ++-
>>>>>  configs/arm64/imx8qm.c                  | 16 +++++--
>>>>>  configs/arm64/k3-j7200-evm-linux-demo.c |  2 +-
>>>>>  configs/arm64/k3-j7200-evm.c            |  2 +-
>>>>>  configs/arm64/k3-j721e-evm-linux-demo.c |  2 +-
>>>>>  configs/arm64/k3-j721e-evm.c            |  2 +-
>>>>>  configs/arm64/ultra96.c                 | 11 ++++-
>>>>>  configs/arm64/zynqmp-zcu102.c           | 15 +++++-
>>>>>  hypervisor/arch/arm64/smmu-v3.c         |  9 ++--
>>>>>  hypervisor/arch/arm64/smmu.c            | 64 ++++++++++++++++---------
>>>>>  hypervisor/arch/arm64/ti-pvu.c          | 21 ++++----
>>>>>  include/jailhouse/cell-config.h         | 18 ++++---
>>>>>  12 files changed, 114 insertions(+), 55 deletions(-)
>>>>>
>>>>> diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
>>>>> index f13ca7bc..e8e8b217 100644
>>>>> --- a/configs/arm64/imx8qm-linux-demo.c
>>>>> +++ b/configs/arm64/imx8qm-linux-demo.c
>>>>> @@ -19,7 +19,7 @@ struct {
>>>>>  	struct jailhouse_memory mem_regions[18];
>>>>>  	struct jailhouse_irqchip irqchips[4];
>>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>>> -	__u32 stream_ids[1];
>>>>> +	union jailhouse_stream_id stream_ids[1];
>>>>>  } __attribute__((packed)) config = {
>>>>>  	.cell = {
>>>>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>>>>> @@ -194,6 +194,9 @@ struct {
>>>>>  	},
>>>>>  
>>>>>  	.stream_ids = {
>>>>> -		0x10,
>>>>> +		{
>>>>> +			.mmu500.mask = 0x7f8,
>>>>> +			.mmu500.id = 0x10,
>>>>
>>>> Would list id before the mask.
>>>>
>>>>> +		},
>>>>>  	},
>>>>>  };
>>>>> diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
>>>>> index d63c73cf..2ec4f4dd 100644
>>>>> --- a/configs/arm64/imx8qm.c
>>>>> +++ b/configs/arm64/imx8qm.c
>>>>> @@ -20,7 +20,7 @@ struct {
>>>>>  	struct jailhouse_memory mem_regions[15];
>>>>>  	struct jailhouse_irqchip irqchips[3];
>>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>>> -	__u32 stream_ids[3];
>>>>> +	union jailhouse_stream_id stream_ids[3];
>>>>>  } __attribute__((packed)) config = {
>>>>>  	.header = {
>>>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>>>>> @@ -54,7 +54,6 @@ struct {
>>>>>  					.type = JAILHOUSE_IOMMU_ARM_MMU500,
>>>>>  					.base = 0x51400000,
>>>>>  					.size = 0x40000,
>>>>> -					.arm_mmu500.sid_mask = 0x7f80,
>>>>>  				},
>>>>>  			},
>>>>>  
>>>>> @@ -209,6 +208,17 @@ struct {
>>>>>  	},
>>>>>  
>>>>>  	.stream_ids = {
>>>>> -		0x11, 0x12, 0x13,
>>>>> +		{
>>>>> +			.mmu500.mask = 0x7f8,
>>>>> +			.mmu500.id = 0x11,
>>>>> +		},
>>>>> +		{
>>>>> +			.mmu500.mask = 0x7f8,
>>>>> +			.mmu500.id = 0x12,
>>>>> +		},
>>>>> +		{
>>>>> +			.mmu500.mask = 0x7f8,
>>>>> +			.mmu500.id = 0x13,
>>>>> +		},
>>>>>  	},
>>>>>  };
>>>>> diff --git a/configs/arm64/k3-j7200-evm-linux-demo.c b/configs/arm64/k3-j7200-evm-linux-demo.c
>>>>> index 90a0ce4c..ace9cd3a 100644
>>>>> --- a/configs/arm64/k3-j7200-evm-linux-demo.c
>>>>> +++ b/configs/arm64/k3-j7200-evm-linux-demo.c
>>>>> @@ -26,7 +26,7 @@ struct {
>>>>>  	struct jailhouse_memory mem_regions[19];
>>>>>  	struct jailhouse_irqchip irqchips[3];
>>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>>> -	__u32 stream_ids[1];
>>>>> +	union jailhouse_stream_id stream_ids[1];
>>>>>  } __attribute__((packed)) config = {
>>>>>  	.cell = {
>>>>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>>>>> diff --git a/configs/arm64/k3-j7200-evm.c b/configs/arm64/k3-j7200-evm.c
>>>>> index c3ac331d..d0c8aee3 100644
>>>>> --- a/configs/arm64/k3-j7200-evm.c
>>>>> +++ b/configs/arm64/k3-j7200-evm.c
>>>>> @@ -21,7 +21,7 @@ struct {
>>>>>  	struct jailhouse_memory mem_regions[32];
>>>>>  	struct jailhouse_irqchip irqchips[6];
>>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>>> -	__u32 stream_ids[1];
>>>>> +	union jailhouse_stream_id stream_ids[1];
>>>>>  } __attribute__((packed)) config = {
>>>>>  	.header = {
>>>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>>>>> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>> index 5b6aa82e..1b8b3c4c 100644
>>>>> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>> @@ -27,7 +27,7 @@ struct {
>>>>>  	struct jailhouse_memory mem_regions[22];
>>>>>  	struct jailhouse_irqchip irqchips[4];
>>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>>> -	__u32 stream_ids[2];
>>>>> +	union jailhouse_stream_id stream_ids[2];
>>>>>  } __attribute__((packed)) config = {
>>>>>  	.cell = {
>>>>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>>>>> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
>>>>> index ab13fedd..aa5b47a9 100644
>>>>> --- a/configs/arm64/k3-j721e-evm.c
>>>>> +++ b/configs/arm64/k3-j721e-evm.c
>>>>> @@ -22,7 +22,7 @@ struct {
>>>>>  	struct jailhouse_memory mem_regions[40];
>>>>>  	struct jailhouse_irqchip irqchips[6];
>>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>>> -	__u32 stream_ids[30];
>>>>> +	union jailhouse_stream_id stream_ids[30];
>>>>>  } __attribute__((packed)) config = {
>>>>>  	.header = {
>>>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>>>>> diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
>>>>> index db65ae01..19be84ae 100644
>>>>> --- a/configs/arm64/ultra96.c
>>>>> +++ b/configs/arm64/ultra96.c
>>>>> @@ -21,7 +21,7 @@ struct {
>>>>>  	struct jailhouse_memory mem_regions[11];
>>>>>  	struct jailhouse_irqchip irqchips[1];
>>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>>> -	__u32 stream_ids[2];
>>>>> +	union jailhouse_stream_id stream_ids[2];
>>>>>  } __attribute__((packed)) config = {
>>>>>  	.header = {
>>>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>>>>> @@ -161,6 +161,13 @@ struct {
>>>>>  	},
>>>>>  
>>>>>  	.stream_ids = {
>>>>> -		0x870, 0x871
>>>>> +		{
>>>>> +			.mmu500.mask = 0x0,
>>>>> +			.mmu500.id = 0x870,
>>>>> +		},
>>>>> +		{
>>>>> +			.mmu500.mask = 0x0,
>>>>> +			.mmu500.id = 0x871,
>>>>
>>>> Only realizing now: That mask is an "ignore mask", right? Bits set there
>>>> are NOT matched against the id. That's modeled after the hardware? Is
>>>> this really intuitive? This one confused me at least.
>>>
>>> Yes, it is model after the hardware. Maybe "ignore_mask" or "imask" would be better?
>>>
>>
>> ...r invert it in SMR_GET_MASK? Not sure what is nicer. The latter has
> 
> Not sure what you mean by "...r" ? "maskr"?

"...or invert" - I somehow lost the "o".

> 
>> the disadvantage that you then always need to specify a non-zero mask.
> 
> Not sure that inverting it in SMR_GET_MASK is very nice. The mask is 15 bits,
> the "consider all" would be 0x7fff (and you start wondering in the configuration
> why 7 and not f...)
> 
> What about "mask_out"?
> 

Shorter and still clear - let's go for that.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9e5869e4-8f93-a0d0-7758-87ba610bd626%40siemens.com.
