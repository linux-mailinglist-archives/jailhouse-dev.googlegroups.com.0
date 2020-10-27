Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCF34H6AKGQEODILB6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA0329C397
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 18:48:57 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id f3sf1079817ljc.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 10:48:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603820937; cv=pass;
        d=google.com; s=arc-20160816;
        b=xllnujqHN7jfYrGt6gDsYux9e/pEYMVHbe+nGF9m8Plp6AwGiquoZoIp66XBYu+NFp
         QUfbFKzU7a9vhmX25Y8D32ExOLgq0+SGer2hNVXi+Sd4gcn16yPSgpZE++hPoKnnHolb
         1VpKsmOzGZ2xGhq6hTeHAhrNynFqaAvoKI6e7LfGjU4xgC0jt3XrAI+yh5Kzh0+lfizm
         TIxFgtfR6JT3tOpXLI3SNEAR7zMUlJ56+PNTSOMtB6WS1IYpBwNOpM83chAh7pLwI061
         764coVIqgDzBAhkmIfj+w+NK36PDjmMGBqskLKdM53eYgDo7j4MiUA8tvk1GbJwhJglq
         HSRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=U4uOODgnzDiSdJsadDMww/DhXjo5G/rBtOSFw5bGk3Q=;
        b=EY5kWhkbDVc7SiSP9HGYY3ROv7fpv7qIwynMiuoN664mCnzKTQ+V3Shbqq4t4vc83J
         g3ZoHGWmAlDjOuQj98k7qKbPighSxUZh8aFa/26basJqsko5Xyx7MupWL4Nj3L08CqUt
         zyUvRy2OJYQ4EQ2vvzHuyqmNGSxxq9j+ulmQHkHD9ykEy0mZhOj1gI3C9COA1yCtsI+F
         9My1BGZiiz4gbDBEkaelo0iC4tHTCyAfiA+7rdsbe+QwH1qi60M9kGaE47ouVItaIgJs
         7j2XF3WI4rq6kfZl95l5OF/tvODJ4X1jRu1gZ0jXBJS9aLPBUFnrrFsILcF5tg8d5sN+
         urmA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=U4uOODgnzDiSdJsadDMww/DhXjo5G/rBtOSFw5bGk3Q=;
        b=GE2zdnAFIOWX9pBpoWBF4rieBERPiW5y9przvl6q3U32wCJRme7EHz4l2LjJIRWDov
         eBEpgq6ib9ipzSyN5vjUqAnpoJrfQWUKlz4twil9IrHC7fjrGzMOZAYztRGm7qliHkLa
         0E3el4Bf5179TXLDyOd/ZVGQtiKrLDlnsjudvKk3NGlF32qB3GyqgcfHS0MnfuUkNLRK
         wANbYqll//DTA+Xs11UmA08zVDfJ5tdafJBNcd0GXxYK9sp7R0RTl83tqlXwVHThW8gW
         IpUfIWCwepJQybU7tEPZ2g+d/1si6cAPeKQz9u22ZAYmq0d3djuNIsRgbEnrT4FAH/4k
         4VBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=U4uOODgnzDiSdJsadDMww/DhXjo5G/rBtOSFw5bGk3Q=;
        b=uRCeL182iFdQ/1H5CzgR5VkxSboo0+D0y2aKZZqGernNohyfQdlQJwA1Ss9PaSd5RR
         uNF1DI+dss26utUliZJqyoubU4mrz7D+fxY0jwa/dGXDMVKCl577Lu/xeKrGTbpmeb0O
         7mxm48TOeSfrwA58ulnH1YRckDOOzJu/74hvn9IpMj9AtVmCZ1SWbsPkdnLufrIaGs4X
         HayVCzQe4NXGyZ60iBHbgU4Doa2C+yk8/k3XTxksp2fN1UPm/+Q16TZkT8IcsV1Ix3PO
         /arVs0yRLbl4l2Z9t2n54A2QbJLOC1S+UlN+R/qo2hWll/z4Y4zcXuG8HokFEXD4joFP
         vDCg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530x3JaYoUp00gfIc91JLI/Rwi6YBH+AG4KO+/PwV8TydQP8S3x1
	PYVV0Z5j5axEjJNMajLX2IE=
X-Google-Smtp-Source: ABdhPJzLHxjaqNCBexK9rH6TdWgCiqG9pSFiYBlkGMu3zZRqUkORLwFgSD1DmlS3X8gxSZi0BzuL8g==
X-Received: by 2002:a19:ec2:: with SMTP id 185mr1200513lfo.425.1603820936847;
        Tue, 27 Oct 2020 10:48:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:14d:: with SMTP id c13ls489227ljd.8.gmail; Tue, 27
 Oct 2020 10:48:55 -0700 (PDT)
X-Received: by 2002:a05:651c:3c2:: with SMTP id f2mr684998ljp.446.1603820935331;
        Tue, 27 Oct 2020 10:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603820935; cv=none;
        d=google.com; s=arc-20160816;
        b=kKsnLuDxbgTgaRQBsQ0vQwn1M4lMu8CpNENK4+7YxMbkbU5kB2ulq7qiz0oNETPduQ
         tvqi5vZAnTnYlvs5dO1TUkGr9FDVABNrRNKFOBHmXsnUR82Xxc39PX9tQCiKuA6ANwRP
         hiCrAlpSb9q9mmDY0AeIyN/k/WFyzBB1hIB/mg47qSKppqkg5pYz1JBwlSKoyaqFPsD+
         nM5FeVn113vVvO92xNPBNCbNbO2fQTfjDrqZsRj0c4zK0ZpJMlOIVPXnNn3nhNftt1Ux
         nj0BcfGNqzcc5kCsbmJWlhAjZjUM24jzYmZw2IIvx8rPGVlRFEel6qYpggftPnFJjgOu
         A1eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=k39i6ptusCvPyfubxdFVzhqtPMq2GGt2UMgZFoXEHic=;
        b=RLoaO+fvvcgnjqt9oHheqtorGrmouMy1xiNMRjb+4kwtpJOz1v7USgXK9KuYnV+tj7
         7ESKPWK+gP4mwwC8OBrpZiRzivn+TwbP6FXT2mng4BL8cRQzak2WukzrbG8t6kx5wlMf
         pYROFDK7Ts5sWuQIsEsaFqQgwj77ldYlFPnOUKZaV+y86fkjwvoDqsa5qnpmOPBT23HH
         dTCuzSrbIIjvNp7NbMtyVMb+rf5gBrICjSUc30l0TvvjRKVWI4dK80Z3TaEdseBMsw9b
         9i2F0gIsij8AX+aiM3ojNh6X0uhsJt9CrU7jVcykAj/tHVYw9jxGFfDSG69T1UITHIQ9
         Ifrg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id a16si70984lfr.5.2020.10.27.10.48.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 10:48:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09RHmsIe008277
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 18:48:54 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09RHmrBK005068;
	Tue, 27 Oct 2020 18:48:53 +0100
Subject: Re: [PATCH] arm64: pvu: Avoid failure in config_commit
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
References: <20201026195257.14398-1-nikhil.nd@ti.com>
 <a282f746-9eb7-eb5e-7c45-a45e795a74c3@siemens.com>
 <81494b8f-5a61-ada0-a534-741f087ef191@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5f11c041-ffb5-18cb-4889-612a18988043@siemens.com>
Date: Tue, 27 Oct 2020 18:48:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <81494b8f-5a61-ada0-a534-741f087ef191@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 27.10.20 18:40, Ralf Ramsauer wrote:
> 
> 
> On 27/10/2020 18:33, Jan Kiszka wrote:
>> On 26.10.20 20:52, 'Nikhil Devshatwar' via Jailhouse wrote:
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
>>>
>>> Change the return type to void and remove the error handling in
>>> the config_commit path.
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> ---
>>>  hypervisor/arch/arm64/include/asm/ti-pvu.h |  3 +-
>>>  hypervisor/arch/arm64/ti-pvu.c             | 54 +++++++++++++---------
>>>  2 files changed, 34 insertions(+), 23 deletions(-)
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
>>> index 3b9a29ec..d96d01c9 100644
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
>>> @@ -110,6 +110,7 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
>>>  	for (i = dev->max_virtid + 1; i < dev->num_tlbs; i++) {
>>>  		if (dev->tlb_data[i] == 0) {
>>>  			dev->tlb_data[i] = virtid << dev->num_entries;
>>> +			dev->free_tlb_count--;
>>>  			return i;
>>>  		}
>>>  	}
>> 	return 0;
>>
>> So we will never get here and never return 0? What prevents that is in
>> pvu_iommu_map_memory, right? Should be explained.
>>
>> And maybe we should actually introduce a BUG() macro to crash
>> intentionally when reaching impossible states. Or we simply do
>>
>> while (dev->tlb_data[i] != 0)
>> 	i++;
>>
>> explaining why this loop is always finishing.
> 
> If it's about to keep the compiler silent, then a
> __builtin_unreachable() does both: give a hint in code that there's no
> way to reach that point, and keep the no return value warning silent.

I know, though I'd rather like to NOT have the then useless limit check
written down.

Jan

> 
>   Ralf
> 
>>
>>> @@ -138,10 +139,13 @@ static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
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
>>> @@ -198,7 +202,7 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>>>  	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_PGSIZE_MASK, pgsz);
>>>  	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_FLAG_MASK, ent->flags);
>>>  
>>> -	/* Do we need "DSB NSH" here to make sure all writes are finised? */
>>> +	/* Do we need "DSB NSH" here to make sure all writes are finished? */
>>>  	pvu_entry_enable(dev, tlbnum, index);
>>>  	return 0;
>>>  }
>>> @@ -221,6 +225,8 @@ static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
>>>  	}
>>>  
>>>  	dev->max_virtid = max_virtid;
>>> +	dev->free_tlb_count = dev->num_tlbs - (max_virtid + 1);
>>> +
>>>  	mmio_write32(&cfg->virtid_map1, 0);
>>>  	mmio_write32_field(&cfg->virtid_map2, PVU_MAX_VIRTID_MASK, max_virtid);
>>>  
>>> @@ -328,17 +334,17 @@ static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
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
>>> @@ -356,20 +362,15 @@ static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
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
>>
>> But what if pvu_entry_write finds an issue? Are we fine with reporting
>> only and then simply continueing?
>>
>> Please clearify that in-place, i.e. via comments in pvu_entry_write(),
>> and remove ignored return values.
>>
>>>  		}
>>>  		pvu_tlb_enable(dev, tlbnum);
>>>  	}
>>> -	return 0;
>>>  }
>>>  
>>>  /*
>>> @@ -380,8 +381,9 @@ int pvu_iommu_map_memory(struct cell *cell,
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
>>> @@ -408,7 +410,19 @@ int pvu_iommu_map_memory(struct cell *cell,
>>>  	if (ret < 0)
>>>  		return ret;
>>>  
>>> -	cell->arch.iommu_pvu.ent_count += ret;
>>> +	/*
>>> +	 * Check if there are enough TLBs left for *chaining* to ensure that
>>> +	 * pvu_tlb_alloc called from config_commit never fails
>>> +	 */
>>> +	tlb_count = (cell->arch.iommu_pvu.ent_count + ret - 1) / 8;
>>> +	dev = &pvu_units[0];
>>> +
>>> +	if (tlb_count > dev->free_tlb_count) {
>>> +		printk("ERROR: PVU: Mapping this memory needs more TLBs than that are available\n");
>>> +		return -EINVAL;
>>> +	} else {
>>
>> No need for "else" here.
>>
>>> +		cell->arch.iommu_pvu.ent_count += ret;
>>> +	}
>>>  	return 0;
>>>  }
>>>  
>>> @@ -434,13 +448,12 @@ int pvu_iommu_unmap_memory(struct cell *cell,
>>>  	return 0;
>>>  }
>>>  
>>> -int pvu_iommu_config_commit(struct cell *cell)
>>> +void pvu_iommu_config_commit(struct cell *cell)
>>>  {
>>>  	unsigned int i, virtid;
>>> -	int ret = 0;
>>>  
>>>  	if (pvu_count == 0 || !cell)
>>> -		return 0;
>>> +		return;
>>>  
>>>  	/*
>>>  	 * Chaining the TLB entries adds extra latency to translate those
>>> @@ -455,13 +468,10 @@ int pvu_iommu_config_commit(struct cell *cell)
>>>  		if (virtid > MAX_VIRTID)
>>>  			continue;
>>>  
>>> -		ret = pvu_iommu_program_entries(cell, virtid);
>>> -		if (ret)
>>> -			return ret;
>>> +		pvu_iommu_program_entries(cell, virtid);
>>>  	}
>>>  
>>>  	cell->arch.iommu_pvu.ent_count = 0;
>>> -	return ret;
>>>  }
>>>  
>>>  static int pvu_iommu_cell_init(struct cell *cell)
>>>
>>
>> Jan
>>

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5f11c041-ffb5-18cb-4889-612a18988043%40siemens.com.
