Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCWTUX6QKGQEV7L75UY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 914E52AC082
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Nov 2020 17:08:43 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id o81sf2196031wma.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Nov 2020 08:08:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604938123; cv=pass;
        d=google.com; s=arc-20160816;
        b=skKJd6OT+oCU2i2FKF/Evd0gPHbtiDN80PP7HJm218sMJdZ6MMYFblkj0NyBPAaq4D
         gKmxg6ksmZKTbBA4jD7rxZD1un8Y7BOVaHsJieRImju6ZWus5+cQCJiMkvV6jItKxOai
         3d85k8kI1bHRd3dbcvaHQag0ZxcZfsGtjetH+IgPJHnNXC/QknGjYOzzQmkSz4cQu7UL
         Q319304++bVYe4kuXsZ2FQz2No0DuJLg1vVNYJYw+9mXJ1F6XywAqy9BVnz4mMx8ui1y
         OffqlGTZBMXeA1mUfMKxjBkDHj1BFiBPQ7b80zOYNsqWf87wPIPdL4IrXfffcK6lQu05
         r07Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=4nThU8l/t5M9RzhnN619l3rapkBx0U17h5URVxNkeIk=;
        b=QuvKefDBR08aGq7UEocLAeCSgz/4YlSpNE2+Oplw/hTjH7mZZA6eS1daeYt8CGt/8B
         JBHEew376ML6CzdQTZwAheygTkD8wqkkZtEaXFHhblS9Lsxccf0isB31OM+QLEGIH60m
         r3fMmMPNFxFe0mUT42tVDdZJKQGmkwTg4Iv4GrA5hiE9x9GgF0pgzPZIvRxHEWI7tLWK
         6Afl7yFX+vLe/Ot6d74H+GHCQUE37X8oT6fAMld130mn8ZSyIdnnuqinkgKemSZyJ/WE
         /l0ijbQVUTZ2vgVIMNfYoXVnKOknMxq8Un3gHmnrsIDUY8N4iu19xDFi8TcjBEykhNjF
         MQrQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4nThU8l/t5M9RzhnN619l3rapkBx0U17h5URVxNkeIk=;
        b=paJikk7v5ZJSANO9KDxeMKVQCoAulVwO6ppYwwcFzuK0xSlnWi7qqa7wnoY3JjsuDC
         rlKMOjONSkJ3IenuLVCqX6oC5yEVGuV72bgIKqKSmaAlAWiOLFaR7jzgvJ/PIAPdhX90
         01y5e+D9GzVXiCgzBDZX8VOiqifOcIqZ/AJdYYrxJY+V4KaxY4prYPSQTXvEVLXSfXxW
         WNm3EE5pdAUvsTV8Ucy+gTndEtSjaCpXRiCINnxyNkFNmkj+2lmWov146xaUH9wkSOA+
         aTrjQXgs1CFwnUc5HDyTIZ5jN2PeIywEgETVHokAI+WkT25V6mkA51M1r5be3G3cUMjm
         ieVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4nThU8l/t5M9RzhnN619l3rapkBx0U17h5URVxNkeIk=;
        b=QYDeV7xnwedEYijegrJUJpKuASZhtGWBFF1xLd89pHhU2ndeztxQqHfqTajEdXRihq
         vH//XSrnSkCLPTapiPIdDKThgiPsIeV7LILkHtDtosO9XrkBNDN+vq2/s968edkfpBt8
         6xowsR2Qjx0ut3XaMn1LduRpnOBzQwUz6gEdls3IN4IRcdL9X3C8lmuODWBAJcWG+vcs
         9NizywmJxN9zRwnoU+ltzX20rHGs7O18Gc4vysZFjFKgeWTwTehgv/IayYo8Dv73aSxh
         9/M1kdfkA9qhIbVoBDANzH6wE7gWc0NbZ4+PONwdqp8mFSkUoVsM0hSXOp8OSF6di+XN
         0FRA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533mh6Wl0SJNJnb2Xadb/xoxOT0EtYtGzDknoK079+qZPLmtyK/+
	KfgjqugtMIOit+vOySz56lc=
X-Google-Smtp-Source: ABdhPJzrHwWOBeflJYPQ8cFymXr/Y3hcoTV7ArT/RgGBIpMlF4hIclAMLbXeDjyxfO6i0Vc0y+ksDA==
X-Received: by 2002:a1c:6284:: with SMTP id w126mr11436wmb.145.1604938123282;
        Mon, 09 Nov 2020 08:08:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c689:: with SMTP id j9ls8334726wrg.0.gmail; Mon, 09 Nov
 2020 08:08:42 -0800 (PST)
X-Received: by 2002:adf:a40c:: with SMTP id d12mr15342250wra.154.1604938122164;
        Mon, 09 Nov 2020 08:08:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604938122; cv=none;
        d=google.com; s=arc-20160816;
        b=uIW8s0NGsd5ceUL4UBTUcKYeBk8Ia4Ne4HKy9FfI3JhcRldOosve3JnKlkv1yLHfbH
         TIh+P8R6F42dCKOJbWookCuUjiQKhIt6dEOF0DEJck3wlTGu4+Hah5STEI8dbwX3RySd
         uEempmraY4BTs6BTsshtbysmn5zpbKtvr2L/c2ppZn2RmHXVyYZE/GG4RJumWBouSraD
         tOZVULZWXEdb3ucl2cyEv/eA68WSSLdohpY4qfGpzgD2eQz6HdLnRFvDeB93N3mmQEqd
         WoSrwKoVo5Jf06KPYie8rw8gTKYt5LVpJySmN6HwwKJe3xBnxZWG41tPaAruTXEqZjJx
         o/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=00lc3tFhy8xXpF5F+EFy2FUKkos9qnuRW4XfRcB1UaA=;
        b=GDPtkO1NppRCfzlahzn2av/mWwKWRIezec5JmW825a2wclHr7Th4Cuw8sAjq7e5MOC
         JJtOn3suZwOpyeauMcvAcIv2KCdXwdAscM9/TC0v1B3PK2uYjqRuvdC/ZcKz4ettgixu
         kFH1Kt+lJZ2DoP6ygTM4hYVLpUEXU4dDAeYoK0+7XBwp9vpIZDRhPcSxE9cZEwHQheJw
         HP10dOHLOEsu8mnwdES+1mFkyDKhP2s1Y2NQitzFtraDNwndIl1TFs0w0L5/LdTTIPEP
         pabjfPpIVIvkWPxD+ZKjzKiT1kvCBgEk/sn8yAbX+QCy3t6/w5uJQ3/pRjWzBYvWmyy2
         7OpQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 3si188817wra.5.2020.11.09.08.08.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2020 08:08:42 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0A9G8fbC020762
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Nov 2020 17:08:41 +0100
Received: from [167.87.33.169] ([167.87.33.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0A9G8fFM027243;
	Mon, 9 Nov 2020 17:08:41 +0100
Subject: Re: [PATCH 3/3] hypervisor, configs: remove arm_mmu500 sid_mask and
 update imx8qm config
To: Andrea Bastoni <andrea.bastoni@tum.de>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>
Cc: "alice.guo@nxp.com" <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>
References: <20201104153648.35076-1-andrea.bastoni@tum.de>
 <20201104153648.35076-4-andrea.bastoni@tum.de>
 <d637b307-9dcc-5a02-9bc6-9fa07d636979@siemens.com>
 <96d07bef-e970-c199-50fc-c9541790f1c3@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f365f2e3-c9ba-4f96-6d7f-aa50ef07c1c1@siemens.com>
Date: Mon, 9 Nov 2020 17:08:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <96d07bef-e970-c199-50fc-c9541790f1c3@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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


On 09.11.20 16:59, Andrea Bastoni wrote:
> Hi,
> 
> On 09/11/2020 00:04, Jan Kiszka wrote:
>> On 04.11.20 16:36, Andrea Bastoni wrote:
>>> I.MX8QM fixed mask is factored-in into the stream_ids.
>>>
>>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>>> ---
>>>  configs/arm64/imx8qm.c          | 6 ++++--
>>>  hypervisor/arch/arm64/smmu.c    | 3 ---
>>>  include/jailhouse/cell-config.h | 4 ----
>>>  3 files changed, 4 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
>>> index d63c73cf..566fd0ad 100644
>>> --- a/configs/arm64/imx8qm.c
>>> +++ b/configs/arm64/imx8qm.c
>>> @@ -54,7 +54,6 @@ struct {
>>>  					.type = JAILHOUSE_IOMMU_ARM_MMU500,
>>>  					.base = 0x51400000,
>>>  					.size = 0x40000,
>>> -					.arm_mmu500.sid_mask = 0x7f80,
>>>  				},
>>>  			},
>>>  
>>> @@ -209,6 +208,9 @@ struct {
>>>  	},
>>>  
>>>  	.stream_ids = {
>>> -		0x11, 0x12, 0x13,
>>> +		/* bits 30 - 16: SMR MASK
>>> +		 * bits 14 - 0 : SMR ID
>>> +		 */
>>> +		0x7f80011, 0x7f80012, 0x7f80013,
>>>  	},
>>>  };
>>> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
>>> index 191ff154..d2824985 100644
>>> --- a/hypervisor/arch/arm64/smmu.c
>>> +++ b/hypervisor/arch/arm64/smmu.c
>>> @@ -157,7 +157,6 @@ struct arm_smmu_device {
>>>  	unsigned long			pgshift;
>>>  	u32				num_context_banks;
>>>  	u32				num_mapping_groups;
>>> -	u16				arm_sid_mask;
>>>  	struct arm_smmu_smr		*smrs;
>>>  };
>>>  
>>> @@ -564,8 +563,6 @@ static int arm_smmu_init(void)
>>>  			continue;
>>>  
>>>  		smmu = &smmu_device[num_smmu_devices];
>>> -		smmu->arm_sid_mask = iommu->arm_mmu500.sid_mask;
>>> -
>>>  		smmu->base = paging_map_device(iommu->base, iommu->size);
>>>  		if (!smmu->base) {
>>>  			err = -ENOMEM;
>>> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
>>> index 472cb4bb..d6315489 100644
>>> --- a/include/jailhouse/cell-config.h
>>> +++ b/include/jailhouse/cell-config.h
>>> @@ -279,10 +279,6 @@ struct jailhouse_iommu {
>>>  			__u64 tlb_base;
>>>  			__u32 tlb_size;
>>>  		} __attribute__((packed)) tipvu;
>>> -
>>> -		struct {
>>> -			__u32 sid_mask;
>>> -		} __attribute__((packed)) arm_mmu500;
>>>  	};
>>>  } __attribute__((packed));
>>>  
>>>
>>
>> This concept of masking it SMMUv2-specific? Or would it be worth to
>> introduce it generically, e.g. by using a 32-bit mask?
> 
> To my understanding this is a specialty of the SMMUv2, but I couldn't find many
> details on the PVU.

Nikhil may provide more details.

So, masks play no longer a role with SMMUv3?

> 
>> If not, then we should model a stream ID entry via a union, something
>> like this:
>>
>> union jailhouse_stream_id {
>> 	u32 long_id;
>> 	struct {
>> 		u16 id;
>> 		u16 mask;
>> 	} __attribute__((packed)) mmu500;
>> } __attribute__((packed));
> 
> This makes the SMMUv2 specification clearer, but it makes somehow longer the
> configuration for v3 and PVU. (I assume you want to convert all u32 stream_ids[]
> into union jailhouse_stream_id stream_ids[].)

I think we do not have many configs with stream IDs - so far.

> 
> The alternative struct jailhouse_mmu500_stream_id is even worse for maintenance
> in the long term.
> 

Another one would be providing macro helpers that do the bit mangling
and demangling. Not so nice either.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f365f2e3-c9ba-4f96-6d7f-aa50ef07c1c1%40siemens.com.
