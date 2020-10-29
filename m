Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWOS5P6AKGQEWILPGHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id F10C929F0D1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 17:10:01 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id q25sf549590lfn.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 09:10:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603987801; cv=pass;
        d=google.com; s=arc-20160816;
        b=pvu8xnCiQPe3at+LL0i4jrRcgr7LvyeyMUAdrddIDZbWupXNk970G/+SkIrOrGb+qh
         FPMiAZSScctZea2YDlQkfAsZdVxnzkovNHV0tCo+nYomZZh9EA0K4ThN9RAKPpgUFdAX
         bN5d4pdZA+w69Qqu8ZPHKmRIrjlmsdlaJzVZxWSfxkL2EpagiJwnUZRgoAAd4Yf3IEix
         f72ZwiKObSM2XT6FXjcMlwDK7AAAX52slwc52S2yJCLgbplOWY9ek3VBEjAjm5tSbVKi
         7hqEB0tzL5m1q0lFyKOUatskvWuGvKQNu5JcKTgtr2e0992lmztAhjPylLdvSE1J7SKT
         dLuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=wkdplX2kbJYSMWLElBN3eax/nImaRHIdP0aAi6FL0gM=;
        b=nYkrRe16amtjtK/X5i5jHSkAQ+2/CSl0aZ9sQtCtWbSw6ubJSabxEpa7d+sUAYuacc
         OPcRxSmBkfai3LK/iQRuTv+3y7arFt0t8+jTmCpgRBgg5ma4Obi8/6ZIgyqSdb4HsXk8
         Uk1F6pyOtwgRG3ERCkfoh5jbxrWxEc1RYfqv7AmkEbASfk0e1F6Jb4I9pkESks5k6V4Y
         axiMJGAkwjX0x6uWpWy3cG593PluAFjkfIkU8Q/yVyWUZJaKYPgHE8CrFdht9SRpg/Rd
         l/hC/a+/srr6n3vMPvemfuVb1CiDvAo/SdZr2YKeTdj0Qn37mOmO036ZRVG7Fl4z5UBX
         gxrQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wkdplX2kbJYSMWLElBN3eax/nImaRHIdP0aAi6FL0gM=;
        b=dHEaETmtscw3wph2i67/0+UQpRtDAoAt2uhB3mEeiJ4yRMCYmx2JuicAJ3ppIc/y88
         yH06F6uxcgFlKOQRcxLxtpMlI8fJ9RH2KGxZz2rcR8e1/LDCwEnmn95vtKwV5otEFsi5
         SHvHUqQo60OeSV/zgfXEBMMDAxyFX1YIymtG/j6WPaBQttYQycZHPZGdEy0PG9GhUjiu
         ZgJil1KwraifiFxXEJ3DXHxODIsoId+t5DV7GkHT2evVygOkgJ4SlcJmiCw50TwHgLDs
         JMUk7KPnKVJqVhAA6lXldvbF2BSTEsOIssCFhmqU067nggDFd0qjODaryAKud58ejI3w
         1G7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wkdplX2kbJYSMWLElBN3eax/nImaRHIdP0aAi6FL0gM=;
        b=RU+/cQ133957gheDXtMvVrVF2PKgTtHU+CuadPmuNsO5p95OmI92URZCVkyLwIl72V
         EMeGC/Pmq6ZEzaP1t5y8DNllV9b9LC1TZ816sONffxnRWb3Z8U5GsJCeT3ck1AhhWKp6
         WKmmOjZFl0gmYyVfIzbpn06SdX28lymPDpY7mywyOlSUX/cxx/Ss12Y2HOku4bYxEylL
         Owx+jJjEx7WUsxeIG0wzj6rCvvOfk6Hggp9VnTa5buGrAjm4b0dzjVzxPY1Xqs8k8rE8
         mOSEPvjYNYSZ18Aik41jMbvW5sYv2LT7XyRLDDGWn1P9nMQeAeVAo1YOTvlhr5QMl6UT
         mQ6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533VMSlObIJfxc/Ab8HmjwFUJrzgGQe1Lo7uwI7t0QdcNnEy7wko
	Geyyp0sk/dPUmGQ+9L9aNmY=
X-Google-Smtp-Source: ABdhPJwRh4oD3WjQ0pj0jw0vJobe7n3K5/DTxdt4FeY9QSDoDcCPmHmGhgMG+cg+gABR57zT1SSYKg==
X-Received: by 2002:ac2:57d3:: with SMTP id k19mr2080100lfo.386.1603987801475;
        Thu, 29 Oct 2020 09:10:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b016:: with SMTP id y22ls656869ljk.3.gmail; Thu, 29 Oct
 2020 09:09:58 -0700 (PDT)
X-Received: by 2002:a05:651c:1345:: with SMTP id j5mr2282287ljb.430.1603987798611;
        Thu, 29 Oct 2020 09:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603987798; cv=none;
        d=google.com; s=arc-20160816;
        b=sK/oOGx4CiN9S8CTNakIKvKw9rEbR8IlKfcQLIA7NuhgD3A1GEhQe5yptdM/ZOcOrk
         MPA/HsQ1H/XpxY5dD7dMgR3N/v18ZEdumuQX4Th2YCwKUAP5cQEE7deNBm8vuV+p0PIC
         F3eYwIXpX1WVPZhoNSNPMyrqrDTJACxr5YzuBHGvkBcIoYlPdxHLRDp1khfbG0gcAgKE
         pUcE9jwNiYyt6vmSlbgUhFw3jmmChzvH9piqEgcVSfWxXaDrwifUyfN3Z4IozE2DwWvH
         SGyNfp4VXo1xTc2SsouewUzP9er6hR1D0KTnBOUHniVB73bdsD8nHshDVLAIjJ+Q6t0R
         aPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=qSDxbrf7dofOp/4KaNmdi1Ia1Fo++scfPtxtykptt1g=;
        b=D5BN0ehIeeCd+KE5AkdbgMbQzLYYEopa9oCUovQ9sZ+BQ5/LalgaUDJp2H7+HiifPR
         TB+jXwnkxiDs1tZdpkePH33tZD7iGl/sYO6JG0aohimXP2WE9kplCDd9644sBnzWh6Ew
         iSr4JOSVqNaSquXLj3krfo00fRx0fjTLoATr7nc4pItOLwbDvPN5lIaLiHhkzB6I+2be
         rnwEcxUyrvNrHiG5VLnCPjk/+Uf67UCx3mylaOtkUMUg+18hEtV1S5zz7efyeZfGrXa+
         aafDyaqGnfkiTIGfgdUrcPmTtstCEMWD+5OogHomwEJyYlQUHyS78a3xzK9TBgwLsC4r
         uX+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id x19si128017ljh.2.2020.10.29.09.09.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 09:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09TG9v26005723
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Oct 2020 17:09:57 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09TG9tWW016643;
	Thu, 29 Oct 2020 17:09:56 +0100
Subject: Re: [PATCH v2] arm64: pvu: Avoid failure in config_commit
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Cc: jailhouse-dev@googlegroups.com,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Sekhar Nori <nsekhar@ti.com>
References: <20201028141454.22657-1-nikhil.nd@ti.com>
 <372c4fcc-f707-955b-ec3f-c800dc948557@siemens.com>
 <20201029152737.og3yauwbcxu3th2p@NiksLab>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0dccb943-2777-b646-de90-1124bc6d9530@siemens.com>
Date: Thu, 29 Oct 2020 17:09:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201029152737.og3yauwbcxu3th2p@NiksLab>
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

On 29.10.20 16:27, Nikhil Devshatwar wrote:
> On 08:14-20201029, Jan Kiszka wrote:
>> On 28.10.20 15:14, 'Nikhil Devshatwar' via Jailhouse wrote:
>>> Current PVU iommu implementation ignores possible failures in the
>>> config_commit part. This would allow inconsistent configuration
>>> to run and may introduce unknown bugs.
>>>
>>> Solve this by making sure that the pvu_iommu_config_commit never
>>> fails. Catch the errors early in the mapping phase. Use
>>> "free_tlb_count" to track available no of TLBs for chaining.
>>> This can be used to check if any mapping causes it to potentially
>>> use more no of TLBs than that are free. This will ensure that
>>> the allocationg for chaining will not fail.
>>
>> allocating
>>
>>>
>>> Change the return type to void for few functions. Add comments to
>>> explain behavior in case of failure.
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> ---
>>>
>>> Notes:
>>>     Changes from v1:
>>>     * Add a comment to descibe why pvu_tlb_alloc will not fail
>>>     * Make return type of pvu_entry_write as void and explain the
>>>     behavior in case the constraints are not met
>>>     * Remove un necessary else block
>>>
>>>  hypervisor/arch/arm64/include/asm/ti-pvu.h |  3 +-
>>>  hypervisor/arch/arm64/ti-pvu.c             | 68 ++++++++++++++--------
>>>  2 files changed, 45 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/hypervisor/arch/arm64/include/asm/ti-pvu.h b/hypervisor/arch/arm64/include/asm/ti-pvu.h
>>> index 2c340b3a..62aec7c0 100644
>>> --- a/hypervisor/arch/arm64/include/asm/ti-pvu.h
>>> +++ b/hypervisor/arch/arm64/include/asm/ti-pvu.h
>>> @@ -117,6 +117,7 @@ struct pvu_dev {
>>>  	u16		max_virtid;
>>>  
>>>  	u16		tlb_data[PVU_NUM_TLBS];
>>> +	u16		free_tlb_count;
>>>  };
>>>  
>>>  int pvu_iommu_map_memory(struct cell *cell,
>>> @@ -125,6 +126,6 @@ int pvu_iommu_map_memory(struct cell *cell,
>>>  int pvu_iommu_unmap_memory(struct cell *cell,
>>>  		const struct jailhouse_memory *mem);
>>>  
>>> -int pvu_iommu_config_commit(struct cell *cell);
>>> +void pvu_iommu_config_commit(struct cell *cell);
>>>  
>>>  #endif /* _IOMMMU_PVU_H_ */
>>> diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
>>> index 3b9a29ec..c488ce89 100644
>>> --- a/hypervisor/arch/arm64/ti-pvu.c
>>> +++ b/hypervisor/arch/arm64/ti-pvu.c
>>> @@ -15,7 +15,7 @@
>>>   * There are limitations on the number of available contexts, page sizes,
>>>   * number of pages that can be mapped, etc.
>>>   *
>>> - * PVU is desgined to be programmed with all the memory mapping at once.
>>> + * PVU is designed to be programmed with all the memory mapping at once.
>>>   * Therefore, it defers the actual register programming till config_commit.
>>>   * Also, it does not support unmapping of the pages at runtime.
>>>   *
>>> @@ -110,9 +110,15 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
>>>  	for (i = dev->max_virtid + 1; i < dev->num_tlbs; i++) {
>>>  		if (dev->tlb_data[i] == 0) {
>>>  			dev->tlb_data[i] = virtid << dev->num_entries;
>>> +			dev->free_tlb_count--;
>>>  			return i;
>>>  		}
>>>  	}
>>> +
>>> +	/*
>>> +	 * We should never reach here, tlb_allocation should not fail
>>> +	 * pvu_iommu_map_memory ensures that there are enough free TLBs
>>> +	 */
>>
>> If we never get here, the test for "i < dev->num_tlbs" is pointless. If
>> we could get here, we should not return.
> 
> I would like to add some kind of BUG()
> Do we have something like this?

Not yet. Could be simply defined as

#define BUG()	*(int *)0 = 0xdead

> 
>>
>>>  	return 0;
>>>  }
>>>  
>>> @@ -138,10 +144,13 @@ static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
>>>  
>>>  	mmio_write32(&tlb->chain, 0x0);
>>>  
>>> -	if (i < dev->max_virtid)
>>> +	if (i < dev->max_virtid) {
>>>  		dev->tlb_data[tlbnum] = 0x0 | i << dev->num_entries;
>>> -	else
>>> +	} else {
>>> +		/* This was a chained TLB */
>>>  		dev->tlb_data[tlbnum] = 0x0;
>>> +		dev->free_tlb_count++;
>>> +	}
>>>  
>>>  }
>>>  
>>> @@ -159,7 +168,7 @@ static void pvu_entry_enable(struct pvu_dev *dev, u16 tlbnum, u8 index)
>>>  	dev->tlb_data[tlbnum] |= (1 << index);
>>>  }
>>>  
>>> -static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>>> +static void pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>>>  			   struct pvu_tlb_entry *ent)
>>>  {
>>>  	struct pvu_hw_tlb_entry *entry;
>>> @@ -174,17 +183,21 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>>>  			break;
>>>  	}
>>>  
>>> +	/*
>>> +	 * If the hardware constraints for page size and address alignment
>>> +	 * are not met, print out an error, return without writing any entry
>>> +	 */
>>
>> That's lacking reasoning *why* we can continue then. Again: Can the user
>> trigger this by providing an invalid config?
> No. It's not possible. As I explained, it was just defensive
> programming. I can get rid of the checks and still no bad config will
> trigger this.
> 
>> I suspect so. Can we catch that earlier?
> The original intent was to write the PVU part such that it can be
> easily ported to other hypervisors. That's why these checks.
> Shall I remove?

Yes, then it can go.

> 
>>
>>>  	if (pgsz >= ARRAY_SIZE(pvu_page_size_bytes)) {
>>>  		printk("ERROR: PVU: %s: Unsupported page size %llx\n",
>>>  			__func__, ent->size);
>>> -		return -EINVAL;
>>> +		return;
>>>  	}
>>>  
>>>  	if (!is_aligned(ent->virt_addr, ent->size) ||
>>>  	    !is_aligned(ent->phys_addr, ent->size)) {
>>>  		printk("ERROR: PVU: %s: Address %llx => %llx is not aligned with size %llx\n",
>>>  			__func__, ent->virt_addr, ent->phys_addr, ent->size);
>>> -		return -EINVAL;
>>> +		return;
>>>  	}
>>>  
>>>  	mmio_write32(&entry->reg0, ent->virt_addr & 0xffffffff);
>>> @@ -198,9 +211,8 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>>>  	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_PGSIZE_MASK, pgsz);
>>>  	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_FLAG_MASK, ent->flags);
>>>  
>>> -	/* Do we need "DSB NSH" here to make sure all writes are finised? */
>>> +	/* Do we need "DSB NSH" here to make sure all writes are finished? */
>>>  	pvu_entry_enable(dev, tlbnum, index);
>>> -	return 0;
>>>  }
>>>  
>>>  static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
>>> @@ -221,6 +233,8 @@ static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
>>>  	}
>>>  
>>>  	dev->max_virtid = max_virtid;
>>> +	dev->free_tlb_count = dev->num_tlbs - (max_virtid + 1);
>>> +
>>>  	mmio_write32(&cfg->virtid_map1, 0);
>>>  	mmio_write32_field(&cfg->virtid_map2, PVU_MAX_VIRTID_MASK, max_virtid);
>>>  
>>> @@ -328,17 +342,17 @@ static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
>>>  	}
>>>  }
>>>  
>>> -static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
>>> +static void pvu_iommu_program_entries(struct cell *cell, u8 virtid)
>>>  {
>>>  	unsigned int inst, i, tlbnum, idx, ent_count;
>>>  	struct pvu_tlb_entry *ent, *cell_entries;
>>>  	struct pvu_dev *dev;
>>> -	int ret, tlb_next;
>>> +	int tlb_next;
>>>  
>>>  	cell_entries = cell->arch.iommu_pvu.entries;
>>>  	ent_count = cell->arch.iommu_pvu.ent_count;
>>>  	if (ent_count == 0 || cell_entries == NULL)
>>> -		return 0;
>>> +		return;
>>>  
>>>  	/* Program same memory mapping for all of the instances */
>>>  	for (inst = 0; inst < pvu_count; inst++) {
>>> @@ -356,20 +370,15 @@ static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
>>>  			if (idx == 0 && i >= dev->num_entries) {
>>>  				/* Find next available TLB and chain to it */
>>>  				tlb_next = pvu_tlb_alloc(dev, virtid);
>>> -				if (tlb_next < 0)
>>> -					return -ENOMEM;
>>>  				pvu_tlb_chain(dev, tlbnum, tlb_next);
>>>  				pvu_tlb_enable(dev, tlbnum);
>>>  				tlbnum = tlb_next;
>>>  			}
>>>  
>>> -			ret = pvu_entry_write(dev, tlbnum, idx, ent);
>>> -			if (ret)
>>> -				return ret;
>>> +			pvu_entry_write(dev, tlbnum, idx, ent);
>>>  		}
>>>  		pvu_tlb_enable(dev, tlbnum);
>>>  	}
>>> -	return 0;
>>>  }
>>>  
>>>  /*
>>> @@ -380,8 +389,9 @@ int pvu_iommu_map_memory(struct cell *cell,
>>>  			 const struct jailhouse_memory *mem)
>>>  {
>>>  	struct pvu_tlb_entry *ent;
>>> +	struct pvu_dev *dev;
>>>  	unsigned int size;
>>> -	u32 flags = 0;
>>> +	u32 tlb_count, flags = 0;
>>>  	int ret;
>>>  
>>>  	if (pvu_count == 0 || (mem->flags & JAILHOUSE_MEM_DMA) == 0)
>>> @@ -408,6 +418,18 @@ int pvu_iommu_map_memory(struct cell *cell,
>>>  	if (ret < 0)
>>>  		return ret;
>>>  
>>> +	/*
>>> +	 * Check if there are enough TLBs left for *chaining* to ensure that
>>> +	 * pvu_tlb_alloc called from config_commit never fails
>>> +	 */
> 
> Looks like I will need better comment here
> 
>>> +	tlb_count = (cell->arch.iommu_pvu.ent_count + ret - 1) / 8;
>>
>> Can you explain this math? Without reasioning how that prevents the
>> overflow exactly, dropping a check from pvu_tlb_alloc() would be hard to
>> argue.
> 
> I am counting how many TLBs you need for chaining.
> Total TLBs = (no of entries  + 7 ) / 8
> Total TLBs for chaining =  (no of entries  + 7 ) / 8 - 1
> simplified, it becomes (no of entries  - 1 ) / 8
> 
> Let's say the user asks to map a region, which after breakdown, results
> into 12 entries. Since this call is saving entries for all the mappings,
> it will add with previous count and find out that total of 76 entries
> are needed.
> 
> That means (76 -1 ) / 8 = 9 new allocations are needed.
> If there are at least 9 free_tlb available, we are okay.
> If not, we flag the failure early by failing the map call.
> 

OK, there is a magic REGS_PER_TLB = 8, spread in hard-coded manner. I
didn't look as close at this code yet as I did for the smmu-v2. I
suspect there is also some room for cleanups... ;)

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0dccb943-2777-b646-de90-1124bc6d9530%40siemens.com.
