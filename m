Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNHBUH6QKGQED3D3RLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD962AADD7
	for <lists+jailhouse-dev@lfdr.de>; Sun,  8 Nov 2020 23:27:00 +0100 (CET)
Received: by mail-ed1-x53a.google.com with SMTP id f20sf1914943edx.23
        for <lists+jailhouse-dev@lfdr.de>; Sun, 08 Nov 2020 14:27:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604874420; cv=pass;
        d=google.com; s=arc-20160816;
        b=fkxCjEd5UpkERMiXvPQ9q11aai/dHVzdOb8UyqVqeg9CVphYzxeFIlckhB7iLRMqZH
         GfrRhkI+t3/Rh8h2O3VT2YNQuwBNyA6D+EdC8wLJ/SclFeGWU9zlUVKiqaS4uyiFKSgr
         wXd36GReI0gM6omNL2Wv0jfecK6SC6LEi75VkhP+cLHauFC6U+LGVHC0yjxeB/bM8Aba
         MuiV58XrnoU90q6WcetRsvqN33qdTd3+TvH0RUOPlnLvyMGKmIMODhyv0V0LoeSNyhJn
         u7hF4cd/3wM8yjdMJs0VRZhVdyLwjd/aSg7okVnd0A3dAVQVfmEuvX+xdwHUmi+g+66X
         wUZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=zQh/e0JSg//9fyF3ixk3sZzUI2AIkP1aPFW3V7qKwsA=;
        b=optaAYshPZwSB2/6Qqz18XAfy6he1QtuIjlri6SaUG59YlU5t99e/lldSkF8WuZz4e
         g4cAfFuOhfsyStue9HKsBvc/VOYy/YZwl7ue7lzTWD6qyrej5PdO9vZliNvF28oIAjsX
         DCjooqKoK7A8Nwcd4ziYzqKrHo8CIwLB5WuruQc2l+FeEpU+UX+h955JPzLdwgndAYkM
         Yqgq/hf981nz139skjZV7QCz4LX+lnMUS9QRhKOhpwMHRAFxkjIrZOHWRkqnkAfiBXjb
         kLz/tRxfDZlIGMRMQc+yICUTTyLfAU0RgPbV4v8rsMKgzu6Zb/nA9HmekASLlXNitOIB
         rZAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zQh/e0JSg//9fyF3ixk3sZzUI2AIkP1aPFW3V7qKwsA=;
        b=KS5TKu6SPbvJp/mMmzXeafv6iiXsfcOiBZKqRg2NNHIYZl45F2Ul7Sf5Y/lqvOCxQC
         RF4qev6V5NvhUSXRKXbAr5TGigTmumWQDM/dxXw30cdWV0ZpMw3Q+MSqko4Sbu5rk++1
         3qcxYXm7qYYlwfu0hppQM9rcX7G5CmeX06qer7Q9NpDz4atb2JX3bodYfCTdRRNyHK03
         SEIJQfcByX3LZT9YkNugZXqeP0UgEvmQJ1KcQAiUuVLTqEqyUoUMaI9LAB1xrULzWOGt
         jPWu/QERUMakiTKwmBkaczBaeBe0/2rnydA+0XC/Cg0TaTN2WUNC7Y0WXz6yYc03ePti
         c4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zQh/e0JSg//9fyF3ixk3sZzUI2AIkP1aPFW3V7qKwsA=;
        b=IS5QFai13/alWZDmksT6fOF4kiwwBFg6vOcX3GCjvvV/AKhk/7/OFSw2hbyRV8AO26
         m/bWoITY/nXgTqxQy8FqmdvjN9gaJYIum7XadzdENZTkIQXnDcARBDkaTRz2Uts7zJwe
         oUrCP/qDSMWhwDWZMlFx+yOU19E+Kdmitd/MXTrVqLmDKxX9qLEo1G1QiJHaWF+B9oLO
         KjtBVvNj2NXmPCXS6UZHKw5anOBlhOhJ/Rv+8pGjnPYTNzLACOstGvD5pYCpaYYd03sf
         cbfgf6ywfFFqrDWskEgoAQ8iAwTarX5aBdKaZKrYUx+n9Hhyp0kyeNjLCqQ25fX898JN
         8+lQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532QJg6wT7Rv7xgPJLmuC5sV2AQo4w7ujHaZQOVIAUfGTAvMxUGR
	rbsjSYN8nOb6MVu13qeBhc0=
X-Google-Smtp-Source: ABdhPJyqZeBq2nl6BaVpMK5ZctjTtocYbgzwiBLfxQjXPX0k0I7afCnlxqjlHkk+TC3mu/YV2H06eA==
X-Received: by 2002:a50:eb96:: with SMTP id y22mr12645374edr.116.1604874420473;
        Sun, 08 Nov 2020 14:27:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d4c3:: with SMTP id t3ls6314713edr.0.gmail; Sun, 08 Nov
 2020 14:26:59 -0800 (PST)
X-Received: by 2002:a50:b5e1:: with SMTP id a88mr12657577ede.5.1604874419166;
        Sun, 08 Nov 2020 14:26:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604874419; cv=none;
        d=google.com; s=arc-20160816;
        b=j/Duz5cK4uzW9mXHNiCzl6AnCQ4v2uDJ+wavdHDI34UMjQqgHC0aCY8EIA2Wwq6mrM
         TNv+VWUQDl8a3mNFCR2nv0PDi4eWcWVpJCVwMe5l/Ys2vgo9dFGqzOgxkv6gunZP8qyC
         9UNUKfhZM4nfUXq3somq+wedIJDIxseksZ8zab9gDwQFQ384su687tZz6+9ptrd6Wgnh
         aXCA0INZzV64PXL1Ypq6nR55d0J0JFQcsS4j5p2tMlHC5Ps+jVRyhorxPx11of+j1lVm
         lM5DQrL40EBK6Agd2rme1cvLHIFM2PTvRLIvvfSfWHi3+SYWJ9rAS6mIG5XHFJ1cg1/1
         UP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=mv0Z1I0MqjQDt9CRL5WaoSBnswZr/sWDVt7ax75Fyn4=;
        b=Uq8vdlujS4MuSz3fQ42LMBxv8t8Nu93UzFIcCHlo+Gh7mIsrXsBADFhQB4NnDP3w7O
         0k3QtTvmpucb2qFWYmotX97bu5rgy6eNhnoqMnQvfrb19kfxar9S0gZgwYSyPkwEraGd
         Jk8+Z6HpRepVzMZNjj8u1fWjnBTIAg3JZcbSKH2XWXNh3gDR7/zWlHSbp8PnM2/koqEj
         GErGiCbD/jXJj4/yDUtSi9rEpHQ9OU9L96Iu7mseP5MyaoCjEfp9pcKBlZswROrA1W6h
         /2xXiwsFCnJsa3SIeuYVA8VbxVdt9Pp4Tno1RT0uD9/d70wA3HRXjTbUnR9sGzT9Ywig
         zP4w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id bm8si220020edb.2.2020.11.08.14.26.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 14:26:59 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0A8MQw9b014955
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 8 Nov 2020 23:26:58 +0100
Received: from [167.87.33.169] ([167.87.33.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0A8MQoHp019875;
	Sun, 8 Nov 2020 23:26:54 +0100
Subject: Re: [PATCH v3] arm64: pvu: Avoid failure in config_commit
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Sekhar Nori <nsekhar@ti.com>
References: <20201030122712.4199-1-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e3663582-1be0-6d78-0b3b-719876aeca10@siemens.com>
Date: Sun, 8 Nov 2020 23:26:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201030122712.4199-1-nikhil.nd@ti.com>
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

On 30.10.20 13:27, 'Nikhil Devshatwar' via Jailhouse wrote:
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
> Change the return type to void for few functions. Add comments to
> explain behavior in case of failure. Remove un necessary checks
> that would never trigger.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
> 
> Notes:
>     Changes from v2:
>     * Remove additional checks which will always pass
>     * Use a BUG in case control reaches where it should'nt have
>     
>     Changes from v1:
>     * Add a comment to descibe why pvu_tlb_alloc will not fail
>     * Make return type of pvu_entry_write as void and explain the
>     behavior in case the constraints are not met
>     * Remove un necessary else block
> 
>  hypervisor/arch/arm64/include/asm/ti-pvu.h |  3 +-
>  hypervisor/arch/arm64/ti-pvu.c             | 76 ++++++++++++----------
>  2 files changed, 42 insertions(+), 37 deletions(-)
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
> index 3b9a29ec..98c0176b 100644
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
> @@ -110,9 +110,17 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
>  	for (i = dev->max_virtid + 1; i < dev->num_tlbs; i++) {
>  		if (dev->tlb_data[i] == 0) {
>  			dev->tlb_data[i] = virtid << dev->num_entries;
> +			dev->free_tlb_count--;
>  			return i;
>  		}
>  	}
> +
> +	/*
> +	 * We should never reach here, tlb_allocation should not fail.
> +	 * pvu_iommu_map_memory ensures that there are enough free TLBs
> +	 */
> +
> +	BUG();
>  	return 0;
>  }
>  
> @@ -138,10 +146,13 @@ static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
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
> @@ -159,7 +170,7 @@ static void pvu_entry_enable(struct pvu_dev *dev, u16 tlbnum, u8 index)
>  	dev->tlb_data[tlbnum] |= (1 << index);
>  }
>  
> -static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
> +static void pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>  			   struct pvu_tlb_entry *ent)
>  {
>  	struct pvu_hw_tlb_entry *entry;
> @@ -174,19 +185,6 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>  			break;
>  	}
>  
> -	if (pgsz >= ARRAY_SIZE(pvu_page_size_bytes)) {
> -		printk("ERROR: PVU: %s: Unsupported page size %llx\n",
> -			__func__, ent->size);
> -		return -EINVAL;
> -	}
> -
> -	if (!is_aligned(ent->virt_addr, ent->size) ||
> -	    !is_aligned(ent->phys_addr, ent->size)) {
> -		printk("ERROR: PVU: %s: Address %llx => %llx is not aligned with size %llx\n",
> -			__func__, ent->virt_addr, ent->phys_addr, ent->size);
> -		return -EINVAL;
> -	}
> -
>  	mmio_write32(&entry->reg0, ent->virt_addr & 0xffffffff);
>  	mmio_write32_field(&entry->reg1, 0xffff, (ent->virt_addr >> 32));
>  	mmio_write32(&entry->reg2, 0x0);
> @@ -198,9 +196,8 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>  	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_PGSIZE_MASK, pgsz);
>  	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_FLAG_MASK, ent->flags);
>  
> -	/* Do we need "DSB NSH" here to make sure all writes are finised? */
> +	/* Do we need "DSB NSH" here to make sure all writes are finished? */
>  	pvu_entry_enable(dev, tlbnum, index);
> -	return 0;
>  }
>  
>  static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
> @@ -221,6 +218,8 @@ static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
>  	}
>  
>  	dev->max_virtid = max_virtid;
> +	dev->free_tlb_count = dev->num_tlbs - (max_virtid + 1);
> +
>  	mmio_write32(&cfg->virtid_map1, 0);
>  	mmio_write32_field(&cfg->virtid_map2, PVU_MAX_VIRTID_MASK, max_virtid);
>  
> @@ -328,17 +327,17 @@ static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
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
> @@ -356,20 +355,15 @@ static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
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
>  		}
>  		pvu_tlb_enable(dev, tlbnum);
>  	}
> -	return 0;
>  }
>  
>  /*
> @@ -380,8 +374,9 @@ int pvu_iommu_map_memory(struct cell *cell,
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
> @@ -408,6 +403,19 @@ int pvu_iommu_map_memory(struct cell *cell,
>  	if (ret < 0)
>  		return ret;
>  
> +	/*
> +	 * Check if there are enough TLBs left for *chaining* to ensure that
> +	 * pvu_tlb_alloc called from config_commit never fails
> +	 */
> +	dev = &pvu_units[0];
> +	tlb_count = (cell->arch.iommu_pvu.ent_count + ret - 1) /
> +				dev->num_entries;
> +
> +	if (tlb_count > dev->free_tlb_count) {
> +		printk("ERROR: PVU: Mapping this memory needs more TLBs than that are available\n");
> +		return -EINVAL;
> +	}
> +
>  	cell->arch.iommu_pvu.ent_count += ret;
>  	return 0;
>  }
> @@ -434,13 +442,12 @@ int pvu_iommu_unmap_memory(struct cell *cell,
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
> @@ -455,13 +462,10 @@ int pvu_iommu_config_commit(struct cell *cell)
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

Thanks, applied - as well as the BUG() patch and ELR dumping.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e3663582-1be0-6d78-0b3b-719876aeca10%40siemens.com.
