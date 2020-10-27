Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUVT4H6AKGQEMKMW63A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E75929C229
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 18:33:07 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id 14sf1099634lju.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 10:33:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603819987; cv=pass;
        d=google.com; s=arc-20160816;
        b=SzwIiggtWoy4htUHOkrm5r1H9WVrJchCTHUw0niyFEwNAdKmCepQFvNcekNiXvvYmR
         R9weaHPfet9lovUmydStlA5ogc5NLjDA0Sd/89nSo6bGegQeZD0QnXeYpaSQQ4JUDiHf
         9F3yNbNM2JPg1usoGO4lborHWyKWw/8M67GXNuvCntE1AX11D6VK3LHQjgaK2JuG0ZQE
         boP7j32PoPuZZT2AqezM0BlLaMQzmsWrq/sNfq92NvA2E5OZCQTYtfxHPf0IEL4CbHLI
         6mG461j7vigUI0aUFxBWnoBQpnNlFnvbyVNW6W3D1qCoqb+U1KmIe2v7tNR9pAapYvqp
         ZmHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=EsYL72Y7tzTK1UKuNyX1TZJQHZ1Igh1TeyfsHPEXgiY=;
        b=lAcJuwqGieu7rFLt069Y1VJwZG8V70o4B1HefkSBVw/h/kZDK0Ni7agE6RXOfhJI8+
         5+ixSJxnN/pe4CWtpXSfUipj9DVmHH+rNCeqXL3iq+AEChv8W8KmQBiwP+xncLsOrm4S
         lUN9ZymspwR04RP1z8dX56sV0012QuGt0DmLLBbFwQDLVhrw25caNtaawdgQNlPbxnLz
         WyYThevpy3ogfr+iHStao4bY7C5E4AVF/mo8n4TZFfQFz+BeEQo79u8DcgRTcedqw7lk
         aUOdVDmhIDc0Cahd21LRWjuEzp9HN31hzZPu3CaVOWx1mkOLlTaoFOOES60X2zCrzE/a
         VS4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EsYL72Y7tzTK1UKuNyX1TZJQHZ1Igh1TeyfsHPEXgiY=;
        b=OvxrwUp7vUp7UR8wH8dIiVKvX62ctaIFof7LgvTBQtPf9uyFqEVXYSl/n3MDCoqhaJ
         oW95qCQl4DWY72NDIFw79wcirl5l6+IE539VcRVDLlAD45meKj0gXnktfunYfhgNOLvT
         X+e990QV8YUGYdwf84DW7idsdlHaK179Ooclb+EzNlGYyw1oTCD1vBprBATCuuYSlxoG
         2xMDdhLlDJVg2RQjJOyUatkR5ikBlMUN0vKgUFQooiu6RCWfJ/o/3kb1U+Rl/xphcG5p
         jCaoCt94coQDwBF38T7ZHH4XYaX96djWfza2C0Kl0nTiFlJbvKjbrzDXIWOiB6nKfp5v
         UGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=EsYL72Y7tzTK1UKuNyX1TZJQHZ1Igh1TeyfsHPEXgiY=;
        b=aDn1wBWSAxXrYqkKkDrejld2Pmg0SUntXq+VQwaEAINft8+WclLKx3hV+/SU4BXLGv
         PHlLqnxXB38en0q+wNrluMbpZJSA+n7ao3mItJ0DqG4OptUkmaKPlZi5RviEIytWUpjf
         9nvxBpqb7y/I8xbkjYLD06PII5xixKvHusoqZsRsRJLTT1iNeBFXfFFZQ8cYZer3kBne
         GhY8qPKR1Q3/qCj92i4sqY2Y5QqwclncJbfpik5auXDrvpkr1gmBIfp326EsVJUx8c5c
         qXIe/yWgjqHeNKlmBi/cm98T1Rq0Czn18nGGIBQvyw+yu3XxYqTewaa/yXLcY7/NWa15
         5tVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533s8kd5MdIN0iDuQgKodLOk6hiry9M5JpBJu946FS92wClryt+j
	rppxjphHasJ+//lpo+2G9sk=
X-Google-Smtp-Source: ABdhPJxcfvMV9vpwNUoLJIQimQhT7lri/KCDT4UTj1NdlxtdvPyZVSltwoH5dVT5yUyx/jtyCwRA1w==
X-Received: by 2002:a19:34b:: with SMTP id 72mr1225210lfd.120.1603819986812;
        Tue, 27 Oct 2020 10:33:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8848:: with SMTP id z8ls484268ljj.5.gmail; Tue, 27 Oct
 2020 10:33:05 -0700 (PDT)
X-Received: by 2002:a2e:b558:: with SMTP id a24mr1473332ljn.328.1603819985360;
        Tue, 27 Oct 2020 10:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603819985; cv=none;
        d=google.com; s=arc-20160816;
        b=lHN0AacGbqAjY6dxk4dzoID9GRUtqFNe6wEqLDZ5oVQiczfrMoulrsVgM3FYY5XuL4
         G7dKMYVoHLW6zXNa6LRTKNnSm6gtkW/7owmzyNB9fsxsZ3vpVVf5LvgbcC9DG+RoPNs2
         h0x47dDSNxZcwXaCeJEhZTJABYQRUqrZpvdsRqauTGjf4nndGq1pBG/naEFp08cWsxRS
         66qCXQNdadqgIEQmE/VPdGR0E0bl7wGrmkGIOSkI+3bDAsPGB614m+Nd6jKLB/n2SvYr
         18TTAiipKCqV61iydLvGUwx+BNutnV/7PVDyyZ9jkUVrUNZTxp8OQwAMb0tHfu1ucHE+
         54cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=MqBglcPjdLq/1Ban+WP5DuwaWd7Kky0WSwQAP41moJ4=;
        b=skCzdoa1QnmEwKBZy2pgNmofUqC+uuGjjirPAp1OzIM+B8MAW3xQhMUTBPFC+ztwkO
         1HHjzNDwkHTbz9LzxFSOvIC7phMffGzwmmxAWtjg36Gt2mswFKOZzIxW27n79nzyqxDd
         ZbK0j48l7KKNiRPfhXdVEDb3UclCgJIwuGlynhHCKpvsebpUW8QepL3LtJAVUE5aaRM7
         9JZgMxfLLBzAeQ1aIgl/HwmGbL5SaLU5Bd/oJepa9x3W7zxPC3MdZeQAhhqcwnabI/Eu
         4Aq7jzeRJWvnmWLm+sc8Fj8EcZOxwWnHdS5QSERDYRLSEGkiiQo74yxwQvuqiG5Lv4Fv
         gShQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 24si38064lju.8.2020.10.27.10.33.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 10:33:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09RHX4Qj022716
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 18:33:04 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09RHX32r022152;
	Tue, 27 Oct 2020 18:33:03 +0100
Subject: Re: [PATCH] arm64: pvu: Avoid failure in config_commit
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
References: <20201026195257.14398-1-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a282f746-9eb7-eb5e-7c45-a45e795a74c3@siemens.com>
Date: Tue, 27 Oct 2020 18:33:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201026195257.14398-1-nikhil.nd@ti.com>
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

On 26.10.20 20:52, 'Nikhil Devshatwar' via Jailhouse wrote:
> Current PVU iommu implementation ignores possible failures in the
> config_commit part. This would allow inconsistent configuration
> to run and may introduce unknown bugs.
> 
> Solve this by making sure that the pvu_iommu_config_commit never
> fails. Catch the errors early in the mapping phase. Use
> "free_tlb_count" to track available no of TLBs for chaining.
> This can be used to check if any mapping causes it to potentially
> use more no of TLBs than that are free. This will ensure that
> the allocationg for chaining will not fail.
> 
> Change the return type to void and remove the error handling in
> the config_commit path.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  hypervisor/arch/arm64/include/asm/ti-pvu.h |  3 +-
>  hypervisor/arch/arm64/ti-pvu.c             | 54 +++++++++++++---------
>  2 files changed, 34 insertions(+), 23 deletions(-)
> 
> diff --git a/hypervisor/arch/arm64/include/asm/ti-pvu.h b/hypervisor/arch/arm64/include/asm/ti-pvu.h
> index 2c340b3a..62aec7c0 100644
> --- a/hypervisor/arch/arm64/include/asm/ti-pvu.h
> +++ b/hypervisor/arch/arm64/include/asm/ti-pvu.h
> @@ -117,6 +117,7 @@ struct pvu_dev {
>  	u16		max_virtid;
>  
>  	u16		tlb_data[PVU_NUM_TLBS];
> +	u16		free_tlb_count;
>  };
>  
>  int pvu_iommu_map_memory(struct cell *cell,
> @@ -125,6 +126,6 @@ int pvu_iommu_map_memory(struct cell *cell,
>  int pvu_iommu_unmap_memory(struct cell *cell,
>  		const struct jailhouse_memory *mem);
>  
> -int pvu_iommu_config_commit(struct cell *cell);
> +void pvu_iommu_config_commit(struct cell *cell);
>  
>  #endif /* _IOMMMU_PVU_H_ */
> diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
> index 3b9a29ec..d96d01c9 100644
> --- a/hypervisor/arch/arm64/ti-pvu.c
> +++ b/hypervisor/arch/arm64/ti-pvu.c
> @@ -15,7 +15,7 @@
>   * There are limitations on the number of available contexts, page sizes,
>   * number of pages that can be mapped, etc.
>   *
> - * PVU is desgined to be programmed with all the memory mapping at once.
> + * PVU is designed to be programmed with all the memory mapping at once.
>   * Therefore, it defers the actual register programming till config_commit.
>   * Also, it does not support unmapping of the pages at runtime.
>   *
> @@ -110,6 +110,7 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
>  	for (i = dev->max_virtid + 1; i < dev->num_tlbs; i++) {
>  		if (dev->tlb_data[i] == 0) {
>  			dev->tlb_data[i] = virtid << dev->num_entries;
> +			dev->free_tlb_count--;
>  			return i;
>  		}
>  	}
	return 0;

So we will never get here and never return 0? What prevents that is in
pvu_iommu_map_memory, right? Should be explained.

And maybe we should actually introduce a BUG() macro to crash
intentionally when reaching impossible states. Or we simply do

while (dev->tlb_data[i] != 0)
	i++;

explaining why this loop is always finishing.

> @@ -138,10 +139,13 @@ static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
>  
>  	mmio_write32(&tlb->chain, 0x0);
>  
> -	if (i < dev->max_virtid)
> +	if (i < dev->max_virtid) {
>  		dev->tlb_data[tlbnum] = 0x0 | i << dev->num_entries;
> -	else
> +	} else {
> +		/* This was a chained TLB */
>  		dev->tlb_data[tlbnum] = 0x0;
> +		dev->free_tlb_count++;
> +	}
>  
>  }
>  
> @@ -198,7 +202,7 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>  	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_PGSIZE_MASK, pgsz);
>  	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_FLAG_MASK, ent->flags);
>  
> -	/* Do we need "DSB NSH" here to make sure all writes are finised? */
> +	/* Do we need "DSB NSH" here to make sure all writes are finished? */
>  	pvu_entry_enable(dev, tlbnum, index);
>  	return 0;
>  }
> @@ -221,6 +225,8 @@ static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
>  	}
>  
>  	dev->max_virtid = max_virtid;
> +	dev->free_tlb_count = dev->num_tlbs - (max_virtid + 1);
> +
>  	mmio_write32(&cfg->virtid_map1, 0);
>  	mmio_write32_field(&cfg->virtid_map2, PVU_MAX_VIRTID_MASK, max_virtid);
>  
> @@ -328,17 +334,17 @@ static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
>  	}
>  }
>  
> -static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
> +static void pvu_iommu_program_entries(struct cell *cell, u8 virtid)
>  {
>  	unsigned int inst, i, tlbnum, idx, ent_count;
>  	struct pvu_tlb_entry *ent, *cell_entries;
>  	struct pvu_dev *dev;
> -	int ret, tlb_next;
> +	int tlb_next;
>  
>  	cell_entries = cell->arch.iommu_pvu.entries;
>  	ent_count = cell->arch.iommu_pvu.ent_count;
>  	if (ent_count == 0 || cell_entries == NULL)
> -		return 0;
> +		return;
>  
>  	/* Program same memory mapping for all of the instances */
>  	for (inst = 0; inst < pvu_count; inst++) {
> @@ -356,20 +362,15 @@ static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
>  			if (idx == 0 && i >= dev->num_entries) {
>  				/* Find next available TLB and chain to it */
>  				tlb_next = pvu_tlb_alloc(dev, virtid);
> -				if (tlb_next < 0)
> -					return -ENOMEM;
>  				pvu_tlb_chain(dev, tlbnum, tlb_next);
>  				pvu_tlb_enable(dev, tlbnum);
>  				tlbnum = tlb_next;
>  			}
>  
> -			ret = pvu_entry_write(dev, tlbnum, idx, ent);
> -			if (ret)
> -				return ret;
> +			pvu_entry_write(dev, tlbnum, idx, ent);

But what if pvu_entry_write finds an issue? Are we fine with reporting
only and then simply continueing?

Please clearify that in-place, i.e. via comments in pvu_entry_write(),
and remove ignored return values.

>  		}
>  		pvu_tlb_enable(dev, tlbnum);
>  	}
> -	return 0;
>  }
>  
>  /*
> @@ -380,8 +381,9 @@ int pvu_iommu_map_memory(struct cell *cell,
>  			 const struct jailhouse_memory *mem)
>  {
>  	struct pvu_tlb_entry *ent;
> +	struct pvu_dev *dev;
>  	unsigned int size;
> -	u32 flags = 0;
> +	u32 tlb_count, flags = 0;
>  	int ret;
>  
>  	if (pvu_count == 0 || (mem->flags & JAILHOUSE_MEM_DMA) == 0)
> @@ -408,7 +410,19 @@ int pvu_iommu_map_memory(struct cell *cell,
>  	if (ret < 0)
>  		return ret;
>  
> -	cell->arch.iommu_pvu.ent_count += ret;
> +	/*
> +	 * Check if there are enough TLBs left for *chaining* to ensure that
> +	 * pvu_tlb_alloc called from config_commit never fails
> +	 */
> +	tlb_count = (cell->arch.iommu_pvu.ent_count + ret - 1) / 8;
> +	dev = &pvu_units[0];
> +
> +	if (tlb_count > dev->free_tlb_count) {
> +		printk("ERROR: PVU: Mapping this memory needs more TLBs than that are available\n");
> +		return -EINVAL;
> +	} else {

No need for "else" here.

> +		cell->arch.iommu_pvu.ent_count += ret;
> +	}
>  	return 0;
>  }
>  
> @@ -434,13 +448,12 @@ int pvu_iommu_unmap_memory(struct cell *cell,
>  	return 0;
>  }
>  
> -int pvu_iommu_config_commit(struct cell *cell)
> +void pvu_iommu_config_commit(struct cell *cell)
>  {
>  	unsigned int i, virtid;
> -	int ret = 0;
>  
>  	if (pvu_count == 0 || !cell)
> -		return 0;
> +		return;
>  
>  	/*
>  	 * Chaining the TLB entries adds extra latency to translate those
> @@ -455,13 +468,10 @@ int pvu_iommu_config_commit(struct cell *cell)
>  		if (virtid > MAX_VIRTID)
>  			continue;
>  
> -		ret = pvu_iommu_program_entries(cell, virtid);
> -		if (ret)
> -			return ret;
> +		pvu_iommu_program_entries(cell, virtid);
>  	}
>  
>  	cell->arch.iommu_pvu.ent_count = 0;
> -	return ret;
>  }
>  
>  static int pvu_iommu_cell_init(struct cell *cell)
> 

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a282f746-9eb7-eb5e-7c45-a45e795a74c3%40siemens.com.
