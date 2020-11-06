Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBZ4QST6QKGQE3ECCWXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCDE2A9138
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Nov 2020 09:25:13 +0100 (CET)
Received: by mail-yb1-xb3f.google.com with SMTP id h64sf791506ybc.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Nov 2020 00:25:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604651112; cv=pass;
        d=google.com; s=arc-20160816;
        b=nlQ9ukTryTZShW7pYu8IqMYm7RSe+qeGI9i6qq/azGNjO1dH6sKkHUwrnXvUbGn6h7
         4Sjcxr2witdINTuZbKWNfqm8ojh/BuvcEapqY/wGT+GPzE5aarTQ/ZEdQwpLE6BjEDec
         ZXCngJ4d3E1WTMFtW+kUE0fHUnfqLI/XM+QatNmk35Hkbp7WFbNzHJ6wBDFEf+HAtBQb
         dadTB+9VUrtGkEp/AnQWYY8QrqUtRdfzDfa0AafC/z9jUtwOUBAXmSHK8qFHoz8jPuKz
         8mg0nd6pM1UG3FKNgotRH9RbWjmIXwUGMcCL1KlTlIc24XQt7heXNCJ8aKfnRe6y9knl
         bdww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=8I80qIqr7jiqSLnE9HDOZmi1HIESygpI1+dyrmNrZ2g=;
        b=J4k45e1jH5DWq9qkUqQCD2FyhU7HQWv8n3Iy3HChRDpzn3431i+smtSJI11b0NY12V
         QqsmdPWQ5417Cf7oQZ7JwROcvY8dt+SntDR/wJiHF0W4euowlbHZ8N3qaRN7bZ8kk5YR
         ODrZTWFQ5dyyDoU0O2vWDTdwz6wslQr592ma0bhcER3SE3HtDWIjJNKx5LYZwDzdD/Or
         H+IXvSCB5CwwpBjPbiMgQ+BOZFNoT0ZakTr5ST3ASI60eT71vITi0Dr8gK96TP9sCKKX
         zgAFcp5l6xbzDWe4vs9p/FFjwSUYKcAHsfiD/t92zYVwXZXWf4cHOmOxwnHG4JNi6I1+
         2QAA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Lyr2xK8p;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=8I80qIqr7jiqSLnE9HDOZmi1HIESygpI1+dyrmNrZ2g=;
        b=dzhU9xuDWz0LHnmjJx9p3079zm7xpoDPqyb4n/O075clpHjuLLdYfMAMJN5jD8pLUF
         JYaPO9dEeh8d584+4Gtq6MWOXWQDnf4VTtSpiXymX7LzWYF0avshe6CLDhCcNFUUGc16
         ifFgUHnEmuiC0sdHwshhyr5p88oszDQ8OxfiFQhhpz2ll20zzwzwkVTCet9EjXkMFqcn
         TtJJk9vrRxRr2ApLCREeqvnzr+nvveF/3azmpw6AAh6WtmgQw2vPwtr2dAKfE79yxpe9
         2N40lAXe+LbvCdGxqu70Z06yrBcPNuH71UT/TMBlXVmZzw6bpJ6pynLyOi3E9c/D1xQ9
         zAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8I80qIqr7jiqSLnE9HDOZmi1HIESygpI1+dyrmNrZ2g=;
        b=l+T26dt4lOfOLeh+55M/Oj1raH2g1a791Epw/nj5iOkIpuXysJxiUYz0tmOp3aQBiO
         1ZlSZcKSUEFxcui3n1UGBKdvxJk0GT1+/gmDB/iwABkMbu2+hSodgFdsbUDaPJQuA8Z4
         nn01FHrEwHDUdyAaA7ox0K/jRE6SUMd0mlG2OBslm0VStOeHfl6fPAcqZvfZ4eziKcLc
         ynbQ9unXw4QckkQ18asj/trOAocD9ukAX+1fp9WCiiS0X3OvyV1yRnZL3fO00w9tvJ/N
         X9TV3IaWhVp8sXJ6aSXB4g01LcRjEOM0oEjTbTFzfIwB9Dp8jcDr/YpfDTn7BKfBqs5g
         HAQw==
X-Gm-Message-State: AOAM531B8lxsCRL186H9VcOqHjOyFD0jdKSzr9yDyZ5wsz+vuXeuubrm
	mNbDqnR6EJZy00evvYD9KRY=
X-Google-Smtp-Source: ABdhPJxieWiwKXcGLP+GuoZ5pnrUd2WAOM5ZzFsU+Zuy/SeUHsNp2CWTulh7iwX1N1z8O6eiDMmXXA==
X-Received: by 2002:a25:bbc5:: with SMTP id c5mr1298670ybk.373.1604651112346;
        Fri, 06 Nov 2020 00:25:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:a28e:: with SMTP id c14ls356057ybi.8.gmail; Fri, 06 Nov
 2020 00:25:11 -0800 (PST)
X-Received: by 2002:a25:ae97:: with SMTP id b23mr1407572ybj.26.1604651111480;
        Fri, 06 Nov 2020 00:25:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604651111; cv=none;
        d=google.com; s=arc-20160816;
        b=ev7fr4yjkyRO91PvWS/NX1PS7V5D5D3KTPiIbTB5ZXSSUvTVS8Ox2d9Jd92CeMZupC
         J3Co5yeRPGtIoXyKoRvixkSUJUCNbS5xoKrW0Gbeo2hFJ0yitS0lXNbd6/LsbR247w1Z
         SDbn6hokGe3P489G76hpTctcIZUc3y+TZ4LD1U9sy0fmLCj0hjfa3+vsyfOAebmpE+nz
         /MzYlq2+Yba71+39Tg8VvMGCgiXNjMgfLBDhg8RF+4Q6r4T9/JjRaSBnn52BvPS+/s5d
         ahk6OMIuz5NGnTyu6qf0O7L8fQeV0Ur04gKfAk+CYNn4DNMOmajVsiFU4q39PtyoZBGd
         AyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=NTkuHkFtKQ1awRlhobJ6IlWVBV3UnZwT4JyQz3FTe08=;
        b=DenGCKFeKHhsxdRffdrUQZ0KQXrQk88oqcBj53s6Ip2vS2ZBmU+hezltMXnKJDsdyO
         OnEL2nCG3t4qAoxYXz8ZvhFwHcqyGf8gyQmHjTkeOBOokBDlKaPTthdcjWpGGPo5oWVJ
         Md5bwpkoVaocjv2jZs9XDTbCZB5jB9uIZ6IT3Peli90dj+FCBhqaKKQ8pv9xP8W/GaQn
         fPfY5JmCOxTB1NUrv+g+Kw9UHcTHq9C3cSPJijRTTNl1LoBqVH9PRkgmqwsSW65TuqMp
         T0SMRGIliD0an6Dw63uop4wDyEGBMwWlbOEKpw/kkWTUUAXEiKOlys2hMbR9f7F3rWuc
         G2nA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Lyr2xK8p;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id q4si55688ybk.3.2020.11.06.00.25.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2020 00:25:11 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A68PAfF006207;
	Fri, 6 Nov 2020 02:25:11 -0600
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A68PAUl051477
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Nov 2020 02:25:10 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 02:25:10 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 02:25:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A68P9BZ008871;
	Fri, 6 Nov 2020 02:25:10 -0600
Date: Fri, 6 Nov 2020 13:55:08 +0530
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v3] arm64: pvu: Avoid failure in config_commit
Message-ID: <20201106082508.mqlqohcvw77wysnq@NiksLab>
References: <20201030122712.4199-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20201030122712.4199-1-nikhil.nd@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Lyr2xK8p;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

On 17:57-20201030, 'Nikhil Devshatwar' via Jailhouse wrote:
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

ping on this

Nikhil D

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
> -- 
> 2.17.1
> 
> -- 
> You received this message because you are subscribed to the Google Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201030122712.4199-1-nikhil.nd%40ti.com.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201106082508.mqlqohcvw77wysnq%40NiksLab.
