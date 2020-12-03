Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBB55UP7AKGQE5URTUVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A052CD5BA
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Dec 2020 13:48:07 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id i3sf677145ljj.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Dec 2020 04:48:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606999687; cv=pass;
        d=google.com; s=arc-20160816;
        b=xRR/BJ7L5LSohcSQ3moee1NOTrCRyNe6ZHncRELoQJivGxlruRigh+104F3gReQQd4
         c36X9jvrEVbrAiqkd5ytqupF+Dpufm/GOoHoMPy7hXz32faK+Y2hNR76ah5ALZVIPVC1
         TFeG78ejjiNiDtSfXVbxYko/rvh2Z4PEtN1y/3RyUkWNtS+aNqyJeDsynq7BSWPo6HF6
         Ade2frkkq/DlImrw7bEzpG5ot+mNDyJziaiQ93rR1WIseGS5u+wxwjQvhLueHAmUR2pT
         vLtpG9U8b9ns1OpNQtQLg09wunkXRjDzvUndcN1VQlxEavh+iAHU7KmS/ZIrWvOmcoIt
         DCQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=RLkbuY1qRTx4rziVejbcCXhENbBE7uNpNmyMZSGzmrU=;
        b=cXPvd4KL/AKMa7e5MG1WdfpV7dsIIB9tVfD1VHfEFwzUbILo/qG5vikOGgWa7BmsAQ
         fo5GgTv9d/d9jMThipXDWq4YOsqkUbSUzSJtM4xU1/WCLBrNPOB7N+hbdXFx/EURHdeO
         nqjK7CH4Zt+850yaCLGa0FbPjO38csPv6pq7ujjxWr0Nescf1ZL32nOi1jomqC+WhXmd
         bDz+gETLUZ86eNuKr4zNPrjW9WI0q99gp1tCk3/f9JIWlpnpY7ITpvSy+Br2tMkrYyRo
         Oql6IaTYDqERDuI8AYHBEGXN96bdTeSewyTYjf0GGnsC0wI5ujLG8NIEHfy/NizVPrsg
         JS5g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="d/flmAXD";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RLkbuY1qRTx4rziVejbcCXhENbBE7uNpNmyMZSGzmrU=;
        b=AaJScjzZ3n+bTCnkmeXYI4978FITr3ftD5wl0cEBp3Q1x9fJKx+4tKVhSknijzwz5c
         QVBXiXOjBT5ufWL47qIYAgGxfBzXRP0sYjzzN8V4k/Svn9tmeEAvZx9O5iWQMQlPOAQ5
         icVyBNBT4+LxSICeqw/nBpnyKO/rX79zh/tCwgJZQ50v6owOo1nMuJLVDBPI14+dj3pz
         e5vi6ZecpwwQEc13ktU0np4bAKaDKKctJmgJ8jTgHS0L/aJZ1TaHENxLBCdjvhuXdGKW
         TQpFwQS48ioO0zTxG7yfflAHzeDPt99g26r/jw1BNhb4vfaGOTiq4U7iTGBY4YcadIgj
         7e8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RLkbuY1qRTx4rziVejbcCXhENbBE7uNpNmyMZSGzmrU=;
        b=ceiRN+kaGNhA2+QST+63VKpQI1Vqx3juYQszsQBroMIgWlPaw7xJsxFmUS8Cakzif5
         4FnD47l0jg7xA8nnrA9iwwJ/D+HhHPPvhY3BwvcJ7+3DAKhMQdLbpbx8U09TkNOgCQSJ
         ddWJ4xNxLcHzVGbOAqvfbrNrC+nR7fdIi4ws0NHtKAlianqQomQZbuGBOazwPFXtZf7A
         AWcQ/k+wnWUqXYn/F8MMbp0oSHp0uFxV5HpqR2ntB37GDOaa9k3xwH/uKEKlR73JUMfL
         578DXikKTFTNsL5iqwNpI9oca6wP77tWA4rjZ9rTUodsBwymyIKWF2k5iJ601lwO4hEd
         1Q4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532pK2unfCE/kCCmemJxO6MiyiccXRZUJKCxYGXIRThuEVxTQNlv
	BLXzzBGMyfK0sPlCJGcbGeI=
X-Google-Smtp-Source: ABdhPJwIs3hZOGfqMdXFxbEKqyop84HQTV4ObfsSby3RcKAV5Jpg5NkOyFs9ZFyDU/JnVnwqlBaFpQ==
X-Received: by 2002:a2e:8982:: with SMTP id c2mr1260305lji.121.1606999687471;
        Thu, 03 Dec 2020 04:48:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:d0e:: with SMTP id 14ls357469lfn.0.gmail; Thu, 03 Dec
 2020 04:48:06 -0800 (PST)
X-Received: by 2002:a19:246:: with SMTP id 67mr1188412lfc.234.1606999686300;
        Thu, 03 Dec 2020 04:48:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606999686; cv=none;
        d=google.com; s=arc-20160816;
        b=MXkNC1NQ4W66+fY1n5bpmp9i0kuLlodAsVbxDZ3Y89AznPjkKJlEvW5YnDEPsqecM0
         OZ5qorVOhEJonqvUF5PlGkI2Ks03bZ3+1ADrBRH+6Z23btTui6qqUVQqaF0jWKNSFCsS
         5CxiQH3Z/OEVAgAGiqHVCdMZYRs3p3S8rO+trDw321UhP3Amhe7sV53w0jd2b7lKOAGB
         Xm65W05TmvgWIVrLf+z2/5Of1b41MK0/8riDINzgDdS7ae5WmXscFxKnnNN/8Xofuqry
         ueR0aUJHeaHE+wOS/tg0r9BypoWn9svRI9RNRtbx78Qb/efkmAajUW+DtbdVdqtpQjxa
         VLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=3vPi/PeVUlGSd/hraDKgEWBVtQsnt3rgXNiHsdzAWNE=;
        b=I9TraWbXGLsiKD8cSU4ueXq/n8BLzou6JlSdYHmpkDg3cP2YeY9wXx52fak+2DaZJr
         D8BjlHyzft0kGn4gcMbMsVXLd6WjhvNIKg1pzZQxU3MjPsncx2oHhsr0o/kBImbow/dA
         2J9WDTNnMLpFsISAAldfLmA5tFuW5v0DMPiHcuJMJEfmN9n4ISDW9WwY51vKrMwqkU8T
         9mBzeLWRmjVpGGImvboX5kugHwFu9mBKAeFd2v6tbbZVCoUMR7VJdrM8tWhSdZtf3gW7
         Hg+AU5lXuF5w3BB8H0rN4vkxKweNIyzX64OP0MhREKSagIrMsJ02xkJPKUHBjknsAp06
         r29Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="d/flmAXD";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id 23si24721lfa.10.2020.12.03.04.48.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 04:48:06 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4Cmwc54qqFzyTM;
	Thu,  3 Dec 2020 13:48:05 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.873
X-Spam-Level: 
X-Spam-Status: No, score=-2.873 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	LRZ_URL_PLAIN_SINGLE=0.001, NICE_REPLY_A=-0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id youLAHvVytI1; Thu,  3 Dec 2020 13:48:04 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4Cmwc44YWGzyRk;
	Thu,  3 Dec 2020 13:48:04 +0100 (CET)
Subject: Re: [PATCH v3 1/2] arm64, configs: SMMUv2: Separate stream ID's mask
 and id
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
Cc: "Devshatwar, Nikhil" <nikhil.nd@ti.com>, Peng Fan <peng.fan@nxp.com>
References: <20201127114140.37179-1-andrea.bastoni@tum.de>
 <cfe00e93-66dd-ad37-e30d-2f4e889e4c56@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <403b209e-8281-6f0b-409a-bd6dc14862c8@tum.de>
Date: Thu, 3 Dec 2020 13:48:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cfe00e93-66dd-ad37-e30d-2f4e889e4c56@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="d/flmAXD";       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

On 03/12/2020 07:36, Jan Kiszka wrote:
> On 27.11.20 12:41, Andrea Bastoni wrote:
>> The SMMUv2 allows filtering bits when matching stream IDs before they're
>> passed to the TCU. In this way multiple streams legally get the same
>> translation.
>>
>> On boards such as the ZCU Ultrascale+, the master ID needed to identify
>> the corresponding SMMU stream ID may be dependent on a specific AXI ID
>> that is set by the PL (and could be IP specific).
>>
>> One single fixed mask to pass to the SMR to compact multiple stream IDs
>> before they "hit" the TCU is not flexible enough. The use-case is to
>> compact similar PL-originating masters and have the SMMU behaving the
>> same for them (e.g., they're assigned to the same inmate). At the
>> same time, one needs a full stream_id to assign e.g., different GEM
>> ethernets to different inmates.
>>
>> Update a stream_id to support two different interpretations:
>> - for the SMMUv2, provide an explicit mask + ID.
>> - for the SMMUv3, keep the current single ID.
>>
>> This commit updates the SMMUv2 / v3 --including configuration--
>> accordingly.
> 
> CC'ing Nikil and Peng on their affected code.
> 
>>
>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>> ---
>>  configs/arm64/imx8qm-linux-demo.c       |  7 ++-
>>  configs/arm64/imx8qm.c                  | 16 +++++--
>>  configs/arm64/k3-j7200-evm-linux-demo.c |  2 +-
>>  configs/arm64/k3-j7200-evm.c            |  2 +-
>>  configs/arm64/k3-j721e-evm-linux-demo.c |  2 +-
>>  configs/arm64/k3-j721e-evm.c            |  2 +-
>>  configs/arm64/ultra96.c                 | 11 ++++-
>>  configs/arm64/zynqmp-zcu102.c           | 15 +++++-
>>  hypervisor/arch/arm64/smmu-v3.c         |  9 ++--
>>  hypervisor/arch/arm64/smmu.c            | 64 ++++++++++++++++---------
>>  hypervisor/arch/arm64/ti-pvu.c          | 21 ++++----
>>  include/jailhouse/cell-config.h         | 18 ++++---
>>  12 files changed, 114 insertions(+), 55 deletions(-)
>>
>> diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
>> index f13ca7bc..e8e8b217 100644
>> --- a/configs/arm64/imx8qm-linux-demo.c
>> +++ b/configs/arm64/imx8qm-linux-demo.c
>> @@ -19,7 +19,7 @@ struct {
>>  	struct jailhouse_memory mem_regions[18];
>>  	struct jailhouse_irqchip irqchips[4];
>>  	struct jailhouse_pci_device pci_devices[2];
>> -	__u32 stream_ids[1];
>> +	union jailhouse_stream_id stream_ids[1];
>>  } __attribute__((packed)) config = {
>>  	.cell = {
>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>> @@ -194,6 +194,9 @@ struct {
>>  	},
>>  
>>  	.stream_ids = {
>> -		0x10,
>> +		{
>> +			.mmu500.mask = 0x7f8,
>> +			.mmu500.id = 0x10,
> 
> Would list id before the mask.
> 
>> +		},
>>  	},
>>  };
>> diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
>> index d63c73cf..2ec4f4dd 100644
>> --- a/configs/arm64/imx8qm.c
>> +++ b/configs/arm64/imx8qm.c
>> @@ -20,7 +20,7 @@ struct {
>>  	struct jailhouse_memory mem_regions[15];
>>  	struct jailhouse_irqchip irqchips[3];
>>  	struct jailhouse_pci_device pci_devices[2];
>> -	__u32 stream_ids[3];
>> +	union jailhouse_stream_id stream_ids[3];
>>  } __attribute__((packed)) config = {
>>  	.header = {
>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>> @@ -54,7 +54,6 @@ struct {
>>  					.type = JAILHOUSE_IOMMU_ARM_MMU500,
>>  					.base = 0x51400000,
>>  					.size = 0x40000,
>> -					.arm_mmu500.sid_mask = 0x7f80,
>>  				},
>>  			},
>>  
>> @@ -209,6 +208,17 @@ struct {
>>  	},
>>  
>>  	.stream_ids = {
>> -		0x11, 0x12, 0x13,
>> +		{
>> +			.mmu500.mask = 0x7f8,
>> +			.mmu500.id = 0x11,
>> +		},
>> +		{
>> +			.mmu500.mask = 0x7f8,
>> +			.mmu500.id = 0x12,
>> +		},
>> +		{
>> +			.mmu500.mask = 0x7f8,
>> +			.mmu500.id = 0x13,
>> +		},
>>  	},
>>  };
>> diff --git a/configs/arm64/k3-j7200-evm-linux-demo.c b/configs/arm64/k3-j7200-evm-linux-demo.c
>> index 90a0ce4c..ace9cd3a 100644
>> --- a/configs/arm64/k3-j7200-evm-linux-demo.c
>> +++ b/configs/arm64/k3-j7200-evm-linux-demo.c
>> @@ -26,7 +26,7 @@ struct {
>>  	struct jailhouse_memory mem_regions[19];
>>  	struct jailhouse_irqchip irqchips[3];
>>  	struct jailhouse_pci_device pci_devices[2];
>> -	__u32 stream_ids[1];
>> +	union jailhouse_stream_id stream_ids[1];
>>  } __attribute__((packed)) config = {
>>  	.cell = {
>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>> diff --git a/configs/arm64/k3-j7200-evm.c b/configs/arm64/k3-j7200-evm.c
>> index c3ac331d..d0c8aee3 100644
>> --- a/configs/arm64/k3-j7200-evm.c
>> +++ b/configs/arm64/k3-j7200-evm.c
>> @@ -21,7 +21,7 @@ struct {
>>  	struct jailhouse_memory mem_regions[32];
>>  	struct jailhouse_irqchip irqchips[6];
>>  	struct jailhouse_pci_device pci_devices[2];
>> -	__u32 stream_ids[1];
>> +	union jailhouse_stream_id stream_ids[1];
>>  } __attribute__((packed)) config = {
>>  	.header = {
>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
>> index 5b6aa82e..1b8b3c4c 100644
>> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
>> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
>> @@ -27,7 +27,7 @@ struct {
>>  	struct jailhouse_memory mem_regions[22];
>>  	struct jailhouse_irqchip irqchips[4];
>>  	struct jailhouse_pci_device pci_devices[2];
>> -	__u32 stream_ids[2];
>> +	union jailhouse_stream_id stream_ids[2];
>>  } __attribute__((packed)) config = {
>>  	.cell = {
>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
>> index ab13fedd..aa5b47a9 100644
>> --- a/configs/arm64/k3-j721e-evm.c
>> +++ b/configs/arm64/k3-j721e-evm.c
>> @@ -22,7 +22,7 @@ struct {
>>  	struct jailhouse_memory mem_regions[40];
>>  	struct jailhouse_irqchip irqchips[6];
>>  	struct jailhouse_pci_device pci_devices[2];
>> -	__u32 stream_ids[30];
>> +	union jailhouse_stream_id stream_ids[30];
>>  } __attribute__((packed)) config = {
>>  	.header = {
>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>> diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
>> index db65ae01..19be84ae 100644
>> --- a/configs/arm64/ultra96.c
>> +++ b/configs/arm64/ultra96.c
>> @@ -21,7 +21,7 @@ struct {
>>  	struct jailhouse_memory mem_regions[11];
>>  	struct jailhouse_irqchip irqchips[1];
>>  	struct jailhouse_pci_device pci_devices[2];
>> -	__u32 stream_ids[2];
>> +	union jailhouse_stream_id stream_ids[2];
>>  } __attribute__((packed)) config = {
>>  	.header = {
>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>> @@ -161,6 +161,13 @@ struct {
>>  	},
>>  
>>  	.stream_ids = {
>> -		0x870, 0x871
>> +		{
>> +			.mmu500.mask = 0x0,
>> +			.mmu500.id = 0x870,
>> +		},
>> +		{
>> +			.mmu500.mask = 0x0,
>> +			.mmu500.id = 0x871,
> 
> Only realizing now: That mask is an "ignore mask", right? Bits set there
> are NOT matched against the id. That's modeled after the hardware? Is
> this really intuitive? This one confused me at least.

Yes, it is model after the hardware. Maybe "ignore_mask" or "imask" would be better?

Thanks,
Andrea

> 
>> +		},
>>  	},
>>  };
>> diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
>> index bdcb04b3..1a5d29b3 100644
>> --- a/configs/arm64/zynqmp-zcu102.c
>> +++ b/configs/arm64/zynqmp-zcu102.c
>> @@ -23,7 +23,7 @@ struct {
>>  	struct jailhouse_memory mem_regions[12];
>>  	struct jailhouse_irqchip irqchips[1];
>>  	struct jailhouse_pci_device pci_devices[2];
>> -	__u32 stream_ids[8];
>> +	union jailhouse_stream_id stream_ids[3];
>>  } __attribute__((packed)) config = {
>>  	.header = {
>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>> @@ -147,6 +147,17 @@ struct {
>>  	},
>>  
>>  	.stream_ids = {
>> -		0x860, 0x861, 0x870, 0x871, 0x874, 0x875, 0x876, 0x877
>> +		{
>> +			.mmu500.mask = 0x0,
>> +			.mmu500.id = 0x860,
>> +		},
>> +		{
>> +			.mmu500.mask = 0x0,
>> +			.mmu500.id = 0x861,
>> +		},
>> +		{
>> +			.mmu500.mask = 0xf,
>> +			.mmu500.id = 0x870,
>> +		},
>>  	},
>>  };
>> diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
>> index d4b7529d..d306818e 100644
>> --- a/hypervisor/arch/arm64/smmu-v3.c
>> +++ b/hypervisor/arch/arm64/smmu-v3.c
>> @@ -1045,8 +1045,9 @@ static int arm_smmuv3_cell_init(struct cell *cell)
>>  	struct arm_smmu_device *smmu = &smmu_devices[0];
>>  	struct jailhouse_iommu *iommu;
>>  	struct arm_smmu_cmdq_ent cmd;
>> -	int ret, sid;
>> +	int ret;
>>  	unsigned int n, s;
>> +	union jailhouse_stream_id sid;
> 
> I prefer (inverted) X-mas tree ordering, not only during this season.
> 
>>  
>>  	if (!iommu_count_units())
>>  		return 0;
>> @@ -1057,7 +1058,7 @@ static int arm_smmuv3_cell_init(struct cell *cell)
>>  			continue;
>>  
>>  		for_each_stream_id(sid, cell->config, s) {
>> -			ret = arm_smmu_init_ste(smmu, sid, cell->config->id);
>> +			ret = arm_smmu_init_ste(smmu, sid.id, cell->config->id);
>>  			if (ret)
>>  				return ret;
>>  		}
>> @@ -1076,7 +1077,7 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
>>  	struct arm_smmu_device *smmu = &smmu_devices[0];
>>  	struct jailhouse_iommu *iommu;
>>  	struct arm_smmu_cmdq_ent cmd;
>> -	int sid;
>> +	union jailhouse_stream_id sid;
>>  	unsigned int n, s;
>>  
>>  	if (!iommu_count_units())
>> @@ -1088,7 +1089,7 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
>>  			continue;
>>  
>>  		for_each_stream_id(sid, cell->config, s) {
>> -			arm_smmu_uninit_ste(smmu, sid, cell->config->id);
>> +			arm_smmu_uninit_ste(smmu, sid.id, cell->config->id);
>>  		}
>>  
>>  		cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
>> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
>> index df92fb7a..9c625c54 100644
>> --- a/hypervisor/arch/arm64/smmu.c
>> +++ b/hypervisor/arch/arm64/smmu.c
>> @@ -84,6 +84,10 @@
>>  #define SMR_VALID			(1 << 31)
>>  #define SMR_MASK_SHIFT			16
>>  #define SMR_ID_SHIFT			0
>> +/* Ignore upper bit in ID and MASK */
>> +#define SMR_GET_ID(smr)			((smr) & 0x7fff)
>> +/* Mask is already specified from bit 0 in the configuration */
>> +#define SMR_GET_MASK(smr)		((smr) & 0x7fff)
> 
> BIT_MASK(14, 0)
> 
>>  
>>  /* Stream-to-Context Register */
>>  #define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
>> @@ -152,7 +156,6 @@ struct arm_smmu_device {
>>  	unsigned long			pgshift;
>>  	u32				num_context_banks;
>>  	u32				num_mapping_groups;
>> -	u16				arm_sid_mask;
>>  	struct arm_smmu_smr		*smrs;
>>  };
>>  
>> @@ -360,7 +363,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
>>  	return 0;
>>  }
>>  
>> -static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
>> +static int arm_smmu_find_sme(u16 id, u16 mask, struct arm_smmu_device *smmu)
>>  {
>>  	struct arm_smmu_smr *smrs = smmu->smrs;
>>  	int free_idx = -EINVAL;
>> @@ -388,7 +391,7 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
>>  		 * expect simply identical entries for this case, but there's
>>  		 * no harm in accommodating the generalisation.
>>  		 */
>> -		if ((smmu->arm_sid_mask & smrs[n].mask) == smmu->arm_sid_mask &&
>> +		if ((mask & smrs[n].mask) == mask &&
>>  		    !((id ^ smrs[n].id) & ~smrs[n].mask)) {
>>  			return n;
>>  		}
>> @@ -397,7 +400,7 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
>>  		 * though, then there always exists at least one stream ID
>>  		 * which would cause a conflict, and we can't allow that risk.
>>  		 */
>> -		if (!((id ^ smrs[n].id) & ~(smrs[n].mask | smmu->arm_sid_mask)))
>> +		if (!((id ^ smrs[n].id) & ~(smrs[n].mask | mask)))
>>  			return -EINVAL;
>>  	}
>>  
>> @@ -409,7 +412,9 @@ static int arm_smmu_cell_init(struct cell *cell)
>>  	unsigned int vmid = cell->config->id;
>>  	struct arm_smmu_device *smmu;
>>  	struct arm_smmu_smr *smr;
>> -	unsigned int dev, n, sid;
>> +	unsigned int dev, n;
>> +	u16 sid, smask;
>> +	union jailhouse_stream_id fsid;
>>  	int ret, idx;
>>  
>>  	/* If no sids, ignore */
>> @@ -421,19 +426,22 @@ static int arm_smmu_cell_init(struct cell *cell)
>>  
>>  		smr = smmu->smrs;
>>  
>> -		for_each_stream_id(sid, cell->config, n) {
>> -			ret = arm_smmu_find_sme(sid, smmu);
>> +		for_each_stream_id(fsid, cell->config, n) {
>> +			sid = SMR_GET_ID(fsid.mmu500.id);
>> +			smask = SMR_GET_MASK(fsid.mmu500.mask);
>> +
>> +			ret = arm_smmu_find_sme(sid, smask, smmu);
>>  			if (ret < 0)
>>  				return trace_error(ret);
>>  			idx = ret;
>>  
>> -			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
>> -			       sid, cell->config->name);
>> +			printk("Assigning SID 0x%x, Mask 0x%x to cell \"%s\"\n",
>> +			       sid, smask, cell->config->name);
>>  
>>  			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS, vmid);
>>  
>>  			smr[idx].id = sid;
>> -			smr[idx].mask = smmu->arm_sid_mask;
>> +			smr[idx].mask = smask;
>>  			smr[idx].valid = true;
>>  
>>  			arm_smmu_write_smr(smmu, idx);
>> @@ -449,14 +457,18 @@ static int arm_smmu_cell_init(struct cell *cell)
>>  }
>>  
>>  static bool arm_smmu_return_sid_to_root_cell(struct arm_smmu_device *smmu,
>> -					     unsigned int sid, int idx)
>> +					     union jailhouse_stream_id fsid,
>> +					     int idx)
>>  {
>> -	unsigned int root_sid, n;
>> +	unsigned int n;
>> +	union jailhouse_stream_id rsid;
>>  
>> -	for_each_stream_id(root_sid, root_cell.config, n) {
>> -		if (sid == root_sid) {
>> -			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
>> -			       sid, root_cell.config->name);
>> +	for_each_stream_id(rsid, root_cell.config, n) {
>> +		if (fsid.id == rsid.id) {
>> +			printk("Assigning SID 0x%x Mask: 0x%x to cell \"%s\"\n",
>> +			       SMR_GET_ID(fsid.mmu500.id),
>> +			       SMR_GET_MASK(fsid.mmu500.mask),
>> +			       root_cell.config->name);
>>  
>>  			/* We just need to update S2CR, SMR can stay as is. */
>>  			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS,
>> @@ -471,7 +483,9 @@ static void arm_smmu_cell_exit(struct cell *cell)
>>  {
>>  	int id = cell->config->id;
>>  	struct arm_smmu_device *smmu;
>> -	unsigned int dev, n, sid;
>> +	unsigned int dev, n;
>> +	u16 sid, smask;
>> +	union jailhouse_stream_id fsid;
>>  	int idx;
>>  
>>  	/* If no sids, ignore */
>> @@ -479,10 +493,16 @@ static void arm_smmu_cell_exit(struct cell *cell)
>>  		return;
>>  
>>  	for_each_smmu(smmu, dev) {
>> -		for_each_stream_id(sid, cell->config, n) {
>> -			idx = arm_smmu_find_sme(sid, smmu);
>> -			if (idx < 0 ||
>> -			    arm_smmu_return_sid_to_root_cell(smmu, sid, idx))
>> +		for_each_stream_id(fsid, cell->config, n) {
>> +			sid = SMR_GET_ID(fsid.mmu500.id);
>> +			smask = SMR_GET_MASK(fsid.mmu500.mask);
>> +
>> +			idx = arm_smmu_find_sme(sid, smask, smmu);
>> +			if (idx < 0)
>> +				continue;
>> +
>> +			/* return full stream ids */
>> +			if (arm_smmu_return_sid_to_root_cell(smmu, fsid, idx))
>>  				continue;
>>  
>>  			if (smmu->smrs) {
>> @@ -546,8 +566,6 @@ static int arm_smmu_init(void)
>>  			continue;
>>  
>>  		smmu = &smmu_device[num_smmu_devices];
>> -		smmu->arm_sid_mask = iommu->arm_mmu500.sid_mask;
>> -
>>  		smmu->base = paging_map_device(iommu->base, iommu->size);
>>  		if (!smmu->base) {
>>  			err = -ENOMEM;
>> diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
>> index 98c1fb5e..bbc633a0 100644
>> --- a/hypervisor/arch/arm64/ti-pvu.c
>> +++ b/hypervisor/arch/arm64/ti-pvu.c
>> @@ -444,7 +444,8 @@ int pvu_iommu_unmap_memory(struct cell *cell,
>>  
>>  void pvu_iommu_config_commit(struct cell *cell)
>>  {
>> -	unsigned int i, virtid;
>> +	unsigned int i;
>> +	union jailhouse_stream_id virtid;
>>  
>>  	if (pvu_count == 0 || !cell)
>>  		return;
>> @@ -459,10 +460,10 @@ void pvu_iommu_config_commit(struct cell *cell)
>>  			   cell->arch.iommu_pvu.ent_count);
>>  
>>  	for_each_stream_id(virtid, cell->config, i) {
>> -		if (virtid > MAX_VIRTID)
>> +		if (virtid.id > MAX_VIRTID)
>>  			continue;
>>  
>> -		pvu_iommu_program_entries(cell, virtid);
>> +		pvu_iommu_program_entries(cell, virtid.id);
>>  	}
>>  
>>  	cell->arch.iommu_pvu.ent_count = 0;
>> @@ -470,8 +471,9 @@ void pvu_iommu_config_commit(struct cell *cell)
>>  
>>  static int pvu_iommu_cell_init(struct cell *cell)
>>  {
>> -	unsigned int i, virtid;
>> +	unsigned int i;
>>  	struct pvu_dev *dev;
>> +	union jailhouse_stream_id virtid;
>>  
>>  	if (pvu_count == 0)
>>  		return 0;
>> @@ -484,10 +486,10 @@ static int pvu_iommu_cell_init(struct cell *cell)
>>  	dev = &pvu_units[0];
>>  	for_each_stream_id(virtid, cell->config, i) {
>>  
>> -		if (virtid > MAX_VIRTID)
>> +		if (virtid.id > MAX_VIRTID)
>>  			continue;
>>  
>> -		if (pvu_tlb_is_enabled(dev, virtid))
>> +		if (pvu_tlb_is_enabled(dev, virtid.id))
>>  			return -EINVAL;
>>  	}
>>  	return 0;
>> @@ -515,17 +517,18 @@ static int pvu_iommu_flush_context(u16 virtid)
>>  
>>  static void pvu_iommu_cell_exit(struct cell *cell)
>>  {
>> -	unsigned int i, virtid;
>> +	unsigned int i;
>> +	union jailhouse_stream_id virtid;
>>  
>>  	if (pvu_count == 0)
>>  		return;
>>  
>>  	for_each_stream_id(virtid, cell->config, i) {
>>  
>> -		if (virtid > MAX_VIRTID)
>> +		if (virtid.id > MAX_VIRTID)
>>  			continue;
>>  
>> -		pvu_iommu_flush_context(virtid);
>> +		pvu_iommu_flush_context(virtid.id);
>>  	}
>>  
>>  	cell->arch.iommu_pvu.ent_count = 0;
>> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
>> index 472cb4bb..c94385b8 100644
>> --- a/include/jailhouse/cell-config.h
>> +++ b/include/jailhouse/cell-config.h
>> @@ -279,13 +279,18 @@ struct jailhouse_iommu {
>>  			__u64 tlb_base;
>>  			__u32 tlb_size;
>>  		} __attribute__((packed)) tipvu;
>> -
>> -		struct {
>> -			__u32 sid_mask;
>> -		} __attribute__((packed)) arm_mmu500;
>>  	};
>>  } __attribute__((packed));
>>  
>> +union jailhouse_stream_id {
>> +	__u32 id;
>> +	struct {
>> +		/* Note: both mask and id are only 15 bits wide */
>> +		__u16 mask;
>> +		__u16 id;
>> +	} __attribute__((packed)) mmu500;
>> +} __attribute__((packed));
>> +
>>  struct jailhouse_pio {
>>  	__u16 base;
>>  	__u16 length;
>> @@ -424,10 +429,11 @@ jailhouse_cell_pci_caps(const struct jailhouse_cell_desc *cell)
>>  		 cell->num_pci_devices * sizeof(struct jailhouse_pci_device));
>>  }
>>  
>> -static inline const __u32 *
>> +static inline const union jailhouse_stream_id *
>>  jailhouse_cell_stream_ids(const struct jailhouse_cell_desc *cell)
>>  {
>> -	return (const __u32 *)((void *)jailhouse_cell_pci_caps(cell) +
>> +	return (const union jailhouse_stream_id *)
>> +		((void *)jailhouse_cell_pci_caps(cell) +
>>  		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability));
>>  }
>>  
>>
> 
> Looks good to me otherwise.
> 
> Jan
> 

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/403b209e-8281-6f0b-409a-bd6dc14862c8%40tum.de.
