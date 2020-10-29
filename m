Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUWX5H6AKGQEIMUXMFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D1529E3A6
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 08:14:27 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id t8sf208950lfp.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 00:14:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603955667; cv=pass;
        d=google.com; s=arc-20160816;
        b=vhcnTqpAn/ERHxaE+k5T7Z73McOFDafWRTNW0rzxqTjWM3JadyATQRVy3kSp1Pr4Bx
         azpyQVVoSuGAwEPModGJM07cjdg0Ms28uHtggvM2DP9No+x4N+Ll/r7iqt+Tzh3+2PNm
         2sfK9yjZbX5C4QbC7hlLfHUxRplepsyr+D664UCo70/Oi1yz8bvcsUMveCTxacfwqTDV
         eehf8JyLR+mKkkkNSRpKoGzcpc3VF0NeUP7ZDWUx6RSbyminCYGw64Y5Q7aQtwUsp5JB
         Hb8AB+08ZUvlDdcjxXeLQS2aFjH8xLXmH6C3J/bXVGGW3FPiAx8srzzH5Jst1EXEwQVi
         dfzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=gTtb0jA28UzmxsruRlRutGo4LDkl1efL93L0ZCIc+ZA=;
        b=IL/SXjgxLPjEJFw6vQRksJB2UMJav8FP3QdSrE3pPZc3Xxo8AlUJvyuE6Adqn7mXax
         gUhhAkqiU9utTS4rE9Ry0UyWvwt+KnpM1wtjlpu2z4dQHlKeG0DtYFp9N2qpcAAJzWsf
         pD0vExLWgXM18qYEXZaWIAj96yyv30+OUg5Pq6KbV0mWs8gb08qyQQUTy9WWaaSnsYxd
         /gb5NGFHiOp/6ku21gJRBeQmpsOJlqQYOEnrrd8VXM8jZaty+ZmomKfxqqqVHGeWmpU1
         NJ3W4NimCpp5wJJTS5K2pa0sj9UFFT1a/kCWkzqZu/x6QdkVJg84rYum9CcFtjauJBoC
         3UBg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gTtb0jA28UzmxsruRlRutGo4LDkl1efL93L0ZCIc+ZA=;
        b=UAPuQmYFbTX2reBYhj9cue71COswXeJnZw4C8qqRzIV8SVndMVln1p27lu87deg1vL
         NoY9c59Yssh39Acjm8eqtfC8+nck67vq6xkh7yxoQM22Vmc8qz96ua5Y5J2/M0YcrphX
         PB839nEUCclo9UpLRJWyf6jKGuGLi7qCquHRMkyufbJn7180Mz8h+daks+zza5z8d1yq
         xu0WdrQJWgPh7ts2CAL5ifJiZUwPu8OtbSElXp/+yH70Buuf9AVQZm0CNOEeeDEOnpO1
         Q1WfgUzM2nJM7qlYzAdJbgiJr4s8yPoboY6NThkiqQlNKSMQYDErOY7HVUnqLHMX1tL5
         VSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=gTtb0jA28UzmxsruRlRutGo4LDkl1efL93L0ZCIc+ZA=;
        b=hxs0z4e+G5s0NQHkldS7Kfxsz8WfLf3mB9W5qhGudxsMFORcxamLJyHesAhvygpH6Y
         nIZ3iZFGpPn/cFvYqTGZtPsk+naB5RsXmtzpkbI5+nMQUKsl24UJzmsj5Aj//O9HifMk
         kfad35ZYB+tp56OjvdT8gpo5BLkI7dDIID+OegKFYjHXnCeFk2IyYyN8DGQ6RO813HW6
         vjo5zigahJKT+Dm2cMuaHATiRUUiPYVKsEfCyw8UZGC5Qzwwz4GR1xs5EHNr5O61VqLl
         csAV3R7nAi8fL/uq680ypS62f55JLsFK5X1r/G1CEqCHV1nUxDbjipHgcT/UeGCavxRT
         9NGg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531kdMmFjjkKv5rMt42LVyMXKy2SpsA/2xC8+MTAiD49PVc3KiGx
	+hVnd/ASi7gIPn8b1QPnSbI=
X-Google-Smtp-Source: ABdhPJymjs/KlMBullkWvGwUCaReONpiyPZDXS4T7vrgvZ81D8LT4Fhn6ec+I3yGeBL8DPe5MOnB4w==
X-Received: by 2002:a2e:b4f5:: with SMTP id s21mr1338139ljm.44.1603955667208;
        Thu, 29 Oct 2020 00:14:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9cc1:: with SMTP id g1ls98660ljj.0.gmail; Thu, 29 Oct
 2020 00:14:25 -0700 (PDT)
X-Received: by 2002:a2e:7310:: with SMTP id o16mr1333207ljc.42.1603955665801;
        Thu, 29 Oct 2020 00:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603955665; cv=none;
        d=google.com; s=arc-20160816;
        b=y4OsMOyP1PDZ/O4qgqWkCB78EmCQ+BjJSQqs056F3e3gVsylwaVAvy39jyw3cCmosU
         dRJn0dEEhlLgbos0XZxVNER3ZNkU47IWcrQ5XRIaM84LBhXaex4eWrL9y7F2138FMZX4
         qG8tsPZ6VhIzSosYLIQ+wE4LswarrkYQMqEvvj8WwtSdWe72fGsvUvEtV7qFY1aMCRxZ
         LEykX6Q0Kx40LEPqu5KOws9DVKeuW4ARi0cHbchZuhVwXZcd5CXbhktJGlJ6xHBkOVi9
         25zNKbh8+Y4s1XZI6XtcUTt3kS8r3RQOFgD1ffUaKOME027bDSx2G2w9YsTN043lE4m6
         QZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=X/XBdLrKzwvhrQhWv2zJ3xtGlQtqm7S17fIyHoqGZKY=;
        b=j+JmPVJFlmknaXSEVANfn3YH9DIVHlkDVUctMM5mRspCbydZO3eLRQ4WK894MKvpYq
         HbTA4b4zy9hRrB1J+bsxng8MWWwgsmXk4GEC9zhPhPk9q6TBd8LzP/94Pbf+bvD9d9Md
         wb0SDPiBZaiK007n74AdIUkFe0Edi/u04+QF70HnBI+GBShs2YkwlGBn+dzBch+G1UfB
         ld5pGfBg/AYW9eFvUkZyoCK1oe20OYgPJCA3suW8oxFlQxvZic8m3v1NalOprywSQZmN
         HQA30RND00xcYCE9h2tNZYMdKKB1BnBxEdqMRHRw8AnVZVOPK2AVmVNIUU1K9sMoDdli
         qNqg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id a1si48265lff.2.2020.10.29.00.14.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 00:14:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09T7EOlB017989
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Oct 2020 08:14:25 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09T7ENm5022266;
	Thu, 29 Oct 2020 08:14:24 +0100
Subject: Re: [PATCH v2] arm64: pvu: Avoid failure in config_commit
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Sekhar Nori <nsekhar@ti.com>
References: <20201028141454.22657-1-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <372c4fcc-f707-955b-ec3f-c800dc948557@siemens.com>
Date: Thu, 29 Oct 2020 08:14:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201028141454.22657-1-nikhil.nd@ti.com>
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

On 28.10.20 15:14, 'Nikhil Devshatwar' via Jailhouse wrote:
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

allocating

> 
> Change the return type to void for few functions. Add comments to
> explain behavior in case of failure.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
> 
> Notes:
>     Changes from v1:
>     * Add a comment to descibe why pvu_tlb_alloc will not fail
>     * Make return type of pvu_entry_write as void and explain the
>     behavior in case the constraints are not met
>     * Remove un necessary else block
> 
>  hypervisor/arch/arm64/include/asm/ti-pvu.h |  3 +-
>  hypervisor/arch/arm64/ti-pvu.c             | 68 ++++++++++++++--------
>  2 files changed, 45 insertions(+), 26 deletions(-)
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
> index 3b9a29ec..c488ce89 100644
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
> @@ -110,9 +110,15 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
>  	for (i = dev->max_virtid + 1; i < dev->num_tlbs; i++) {
>  		if (dev->tlb_data[i] == 0) {
>  			dev->tlb_data[i] = virtid << dev->num_entries;
> +			dev->free_tlb_count--;
>  			return i;
>  		}
>  	}
> +
> +	/*
> +	 * We should never reach here, tlb_allocation should not fail
> +	 * pvu_iommu_map_memory ensures that there are enough free TLBs
> +	 */

If we never get here, the test for "i < dev->num_tlbs" is pointless. If
we could get here, we should not return.

>  	return 0;
>  }
>  
> @@ -138,10 +144,13 @@ static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
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
> @@ -159,7 +168,7 @@ static void pvu_entry_enable(struct pvu_dev *dev, u16 tlbnum, u8 index)
>  	dev->tlb_data[tlbnum] |= (1 << index);
>  }
>  
> -static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
> +static void pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>  			   struct pvu_tlb_entry *ent)
>  {
>  	struct pvu_hw_tlb_entry *entry;
> @@ -174,17 +183,21 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>  			break;
>  	}
>  
> +	/*
> +	 * If the hardware constraints for page size and address alignment
> +	 * are not met, print out an error, return without writing any entry
> +	 */

That's lacking reasoning *why* we can continue then. Again: Can the user
trigger this by providing an invalid config? I suspect so. Can we catch
that earlier?

>  	if (pgsz >= ARRAY_SIZE(pvu_page_size_bytes)) {
>  		printk("ERROR: PVU: %s: Unsupported page size %llx\n",
>  			__func__, ent->size);
> -		return -EINVAL;
> +		return;
>  	}
>  
>  	if (!is_aligned(ent->virt_addr, ent->size) ||
>  	    !is_aligned(ent->phys_addr, ent->size)) {
>  		printk("ERROR: PVU: %s: Address %llx => %llx is not aligned with size %llx\n",
>  			__func__, ent->virt_addr, ent->phys_addr, ent->size);
> -		return -EINVAL;
> +		return;
>  	}
>  
>  	mmio_write32(&entry->reg0, ent->virt_addr & 0xffffffff);
> @@ -198,9 +211,8 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
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
> @@ -221,6 +233,8 @@ static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
>  	}
>  
>  	dev->max_virtid = max_virtid;
> +	dev->free_tlb_count = dev->num_tlbs - (max_virtid + 1);
> +
>  	mmio_write32(&cfg->virtid_map1, 0);
>  	mmio_write32_field(&cfg->virtid_map2, PVU_MAX_VIRTID_MASK, max_virtid);
>  
> @@ -328,17 +342,17 @@ static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
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
> @@ -356,20 +370,15 @@ static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
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
> @@ -380,8 +389,9 @@ int pvu_iommu_map_memory(struct cell *cell,
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
> @@ -408,6 +418,18 @@ int pvu_iommu_map_memory(struct cell *cell,
>  	if (ret < 0)
>  		return ret;
>  
> +	/*
> +	 * Check if there are enough TLBs left for *chaining* to ensure that
> +	 * pvu_tlb_alloc called from config_commit never fails
> +	 */
> +	tlb_count = (cell->arch.iommu_pvu.ent_count + ret - 1) / 8;

Can you explain this math? Without reasioning how that prevents the
overflow exactly, dropping a check from pvu_tlb_alloc() would be hard to
argue.

> +	dev = &pvu_units[0];
> +
> +	if (tlb_count > dev->free_tlb_count) {
> +		printk("ERROR: PVU: Mapping this memory needs more TLBs than that are available\n");
> +		return -EINVAL;
> +	}
> +
>  	cell->arch.iommu_pvu.ent_count += ret;
>  	return 0;
>  }
> @@ -434,13 +456,12 @@ int pvu_iommu_unmap_memory(struct cell *cell,
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
> @@ -455,13 +476,10 @@ int pvu_iommu_config_commit(struct cell *cell)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/372c4fcc-f707-955b-ec3f-c800dc948557%40siemens.com.
