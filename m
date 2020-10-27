Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBYPH4H6AKGQEGJVFQCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe38.google.com (mail-vs1-xe38.google.com [IPv6:2607:f8b0:4864:20::e38])
	by mail.lfdr.de (Postfix) with ESMTPS id AA97629C8BF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 20:24:18 +0100 (CET)
Received: by mail-vs1-xe38.google.com with SMTP id s2sf563950vsj.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 12:24:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603826657; cv=pass;
        d=google.com; s=arc-20160816;
        b=HU3HBNzju6hJAHEmoiRnHhfFG2LUzQo/q9gH78Y1vqIN20v/Ce0Q1b+8BkyLMnYiGw
         TmiPiWR/C25mmkr1+DrI03a8V5uCEDrxvVZ58uTl14OjADTppi11bXUBH4A4LTU+BT1r
         k7+Iebe3BOo7wRvElZGzxiKYGQTxgie1TRwOLZMvoZrloyL9wT4TADg0ZtrrNmMU6itZ
         Hv/uL00PPAF8aTM+H9qxsDdF9ua5l3cwCDGKED0VXHVdGws+T74cTQxTjal+YxHHUQqs
         MyasbXJQlQ++YYJbVNMQskdilgAxHNYDuhyHqp9Fyd+jvWjizH8pchoIPgCS+m9D5LUe
         rf3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=wfaOJngVY9R23kWq99hg2MA4oGJTt5vYdJ6KaYkxl10=;
        b=aDL8PaYB+wb3PNMg84gqlwToU7fbPdTfAMzPcxp3L7xqrVVdsQZ5zLutMKqVoGMN2T
         dxklta/b6bmCt0xFMGK0CT8JsaXJKr0Bkv3ix7cgHmacD6UFTMFD8e4E4cZDXK7F+vz1
         IcNJCxL9yp6npqxfQEfp1X1gSETiXNfOJom0dC/zJ622CGJcmhUMaptmQV2/oPDRsoXW
         v8aKs6nXYaHG2FVZ6EIYsFFjI2QwS/nDJFoVjSEKA+vcTE5QJHtGtYxkwt12DXD/8olR
         GFjaxxDSq8TyypqNGWrNguNWlhDrfq901wW+I+iPt01qJV5MIpqIDFzuJaYcO53We+kf
         GO6g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Iokonx7x;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=wfaOJngVY9R23kWq99hg2MA4oGJTt5vYdJ6KaYkxl10=;
        b=XhkHW9Vf0md4La6JPEgdSwQWeF3SO8b5npgw0ia7ffe7e7N2N278Z0I6K8umsDreWH
         38yByBAUuFY/G7gFtId8XVtsHQd8z9ZjVJj6KpXgo5sNW5bzVcKu/t7Vf5B51J7b2Bci
         Tj2YdegVB6lGS8RK6XRNajQit5QZJadsPLQ+mOBeDjCOaA/xts1u3qUo+TK/DUlKH27r
         swLTZj0wDAtxvqCyM8jvDLDN0BXOn1EVPrwmOO8b7+KX5D3xbQg160CdR6YmpT4eEbcJ
         ONnwUCoibv0/P5mHxDIW5J1dCTb7csouNxese66EIXdqyfF3TFcZt0j/kbPsBearzzkS
         3j2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wfaOJngVY9R23kWq99hg2MA4oGJTt5vYdJ6KaYkxl10=;
        b=W+tYEv4G3ZAc561i2kCq7rEJQ6RF78DhTmzSFprWPT+JfZ3NIhy/z8ArPtjCuINb1c
         clQcul2+OTtJO0fCRCZNArMn7J9Rie1GpvzZ6eeIGO7K0ZQBI18fG6rT8N7ZD+Bvkc/L
         xiudmhQRZfxr2HEjxl7sVe9IN4WXpzB6OZ2A82GtwGrFIDlb51ldStY/cfMOYq3V8tzU
         vn2aJ/nA5QxLhRP8WOmkUOjDmJ1nKRLkC4qv0CCQ8crubdXwRDfUK9KAJ1QnosRDj3li
         KtPzfa3p57/ZvqXLjYuqptZQ6AhfXPri4k+/VrCFrtuyYR7AP/0YY9nMIcomkTyjJnss
         S0WQ==
X-Gm-Message-State: AOAM533qvvv0xyaqbLOL82bqDx3exAV+JXPRpE51bnm7cCw83UKLpOFb
	U87we8/2LacR1c+aixfGN2s=
X-Google-Smtp-Source: ABdhPJw2JmJ1P2TrS22xGJSeyhKxDym7jNMEoghDmurQ/5t/771B5B08Qbkj7FQGjMdx8NLFDhQIuQ==
X-Received: by 2002:a05:6102:2151:: with SMTP id h17mr3199724vsg.22.1603826657657;
        Tue, 27 Oct 2020 12:24:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:24d7:: with SMTP id k23ls175359uan.5.gmail; Tue, 27 Oct
 2020 12:24:17 -0700 (PDT)
X-Received: by 2002:ab0:614f:: with SMTP id w15mr2440734uan.116.1603826656993;
        Tue, 27 Oct 2020 12:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603826656; cv=none;
        d=google.com; s=arc-20160816;
        b=pRxdNZxo5vyjoNAeRK0xwAZTJf4qV6SiiHpH3zVKAg0EQNo4wiIxxf05oFds5OiUi9
         FVi7fW83aJN47ghOfomxk1jHPoobdsKOo5VBRMxjbqigPVgEBIFBF7wxYKM1fUEcFnSR
         46xyePz8KrFRF7ycGL2iEJHdQ0f33rMJV0wotWtQ0wer+mcUNQG0Y0AXitjxV0rF5Ms5
         jM/hSaRsgpREZe8ApUACxhEpDJL3UUpg+Xw5rzkgLF+Zh8YmnsEh5IDiQ9e6QGoyBlC/
         JoJs1EN2HYr8Nj16Tcst2hYe6bPzQE3kRDfrMAl0v2pgSqDEWOaxaZ7qHMgC3JLJHRko
         2c6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=+NfXyFE1KDVSjAHoBO1RQk31YCQnJUlPv1/mkX+7Ws8=;
        b=GAk0ms1rhutxJaUZuVomXn6IVqRCGYWZpjPQ+9oqiDdV4w+TTHUjc82bwEAlKfW9wV
         YrxDWOTRorIVy/UzhX1QvnFdYU1i0rhvI76A6QRYOiqiy+JYtTO+E+xEKKoyjTd2ovxr
         FOwnatSzm9S9atDwrKR3HuFRdVLQIQsEFJGiSdJGZXGmN7J3MIPLTD+0YtH+yy5EXoz5
         ShI9IzU217rL8EbC+/E/U7pVU3D4nJo3beUJYjKj6FChYtuCzD3i39XF6XEy88feoPK1
         S+q1v/5eLWJcBUuwtbUD7C96sd6A6+vlb6QkHqOSV6ZtVXnXFJ2mdD3b9wmfUXp4hkzJ
         mpZA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Iokonx7x;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id q192si170180vkb.2.2020.10.27.12.24.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 12:24:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09RJOGi7071449;
	Tue, 27 Oct 2020 14:24:16 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09RJOGoh004378
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Oct 2020 14:24:16 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 27
 Oct 2020 14:24:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 27 Oct 2020 14:24:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09RJOE7q040907;
	Tue, 27 Oct 2020 14:24:15 -0500
Date: Wed, 28 Oct 2020 00:54:13 +0530
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH] arm64: pvu: Avoid failure in config_commit
Message-ID: <20201027192413.kngjt3exc3wesbfy@NiksLab>
References: <20201026195257.14398-1-nikhil.nd@ti.com>
 <a282f746-9eb7-eb5e-7c45-a45e795a74c3@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <a282f746-9eb7-eb5e-7c45-a45e795a74c3@siemens.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Iokonx7x;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
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

On 18:33-20201027, Jan Kiszka wrote:
> On 26.10.20 20:52, 'Nikhil Devshatwar' via Jailhouse wrote:
> > Current PVU iommu implementation ignores possible failures in the
> > config_commit part. This would allow inconsistent configuration
> > to run and may introduce unknown bugs.
> > 
> > Solve this by making sure that the pvu_iommu_config_commit never
> > fails. Catch the errors early in the mapping phase. Use
> > "free_tlb_count" to track available no of TLBs for chaining.
> > This can be used to check if any mapping causes it to potentially
> > use more no of TLBs than that are free. This will ensure that
> > the allocationg for chaining will not fail.
> > 
> > Change the return type to void and remove the error handling in
> > the config_commit path.
> > 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > ---
> >  hypervisor/arch/arm64/include/asm/ti-pvu.h |  3 +-
> >  hypervisor/arch/arm64/ti-pvu.c             | 54 +++++++++++++---------
> >  2 files changed, 34 insertions(+), 23 deletions(-)
> > 
> > diff --git a/hypervisor/arch/arm64/include/asm/ti-pvu.h b/hypervisor/arch/arm64/include/asm/ti-pvu.h
> > index 2c340b3a..62aec7c0 100644
> > --- a/hypervisor/arch/arm64/include/asm/ti-pvu.h
> > +++ b/hypervisor/arch/arm64/include/asm/ti-pvu.h
> > @@ -117,6 +117,7 @@ struct pvu_dev {
> >  	u16		max_virtid;
> >  
> >  	u16		tlb_data[PVU_NUM_TLBS];
> > +	u16		free_tlb_count;
> >  };
> >  
> >  int pvu_iommu_map_memory(struct cell *cell,
> > @@ -125,6 +126,6 @@ int pvu_iommu_map_memory(struct cell *cell,
> >  int pvu_iommu_unmap_memory(struct cell *cell,
> >  		const struct jailhouse_memory *mem);
> >  
> > -int pvu_iommu_config_commit(struct cell *cell);
> > +void pvu_iommu_config_commit(struct cell *cell);
> >  
> >  #endif /* _IOMMMU_PVU_H_ */
> > diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
> > index 3b9a29ec..d96d01c9 100644
> > --- a/hypervisor/arch/arm64/ti-pvu.c
> > +++ b/hypervisor/arch/arm64/ti-pvu.c
> > @@ -15,7 +15,7 @@
> >   * There are limitations on the number of available contexts, page sizes,
> >   * number of pages that can be mapped, etc.
> >   *
> > - * PVU is desgined to be programmed with all the memory mapping at once.
> > + * PVU is designed to be programmed with all the memory mapping at once.
> >   * Therefore, it defers the actual register programming till config_commit.
> >   * Also, it does not support unmapping of the pages at runtime.
> >   *
> > @@ -110,6 +110,7 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
> >  	for (i = dev->max_virtid + 1; i < dev->num_tlbs; i++) {
> >  		if (dev->tlb_data[i] == 0) {
> >  			dev->tlb_data[i] = virtid << dev->num_entries;
> > +			dev->free_tlb_count--;
> >  			return i;
> >  		}
> >  	}
> 	return 0;
> 
> So we will never get here and never return 0? What prevents that is in
> pvu_iommu_map_memory, right? Should be explained.
> 
okay, will add a comment

> And maybe we should actually introduce a BUG() macro to crash
> intentionally when reaching impossible states. Or we simply do
> 
> while (dev->tlb_data[i] != 0)
> 	i++;
> 
> explaining why this loop is always finishing.
> 
> > @@ -138,10 +139,13 @@ static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
> >  
> >  	mmio_write32(&tlb->chain, 0x0);
> >  
> > -	if (i < dev->max_virtid)
> > +	if (i < dev->max_virtid) {
> >  		dev->tlb_data[tlbnum] = 0x0 | i << dev->num_entries;
> > -	else
> > +	} else {
> > +		/* This was a chained TLB */
> >  		dev->tlb_data[tlbnum] = 0x0;
> > +		dev->free_tlb_count++;
> > +	}
> >  
> >  }
> >  
> > @@ -198,7 +202,7 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
> >  	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_PGSIZE_MASK, pgsz);
> >  	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_FLAG_MASK, ent->flags);
> >  
> > -	/* Do we need "DSB NSH" here to make sure all writes are finised? */
> > +	/* Do we need "DSB NSH" here to make sure all writes are finished? */
> >  	pvu_entry_enable(dev, tlbnum, index);
> >  	return 0;
> >  }
> > @@ -221,6 +225,8 @@ static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
> >  	}
> >  
> >  	dev->max_virtid = max_virtid;
> > +	dev->free_tlb_count = dev->num_tlbs - (max_virtid + 1);
> > +
> >  	mmio_write32(&cfg->virtid_map1, 0);
> >  	mmio_write32_field(&cfg->virtid_map2, PVU_MAX_VIRTID_MASK, max_virtid);
> >  
> > @@ -328,17 +334,17 @@ static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
> >  	}
> >  }
> >  
> > -static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
> > +static void pvu_iommu_program_entries(struct cell *cell, u8 virtid)
> >  {
> >  	unsigned int inst, i, tlbnum, idx, ent_count;
> >  	struct pvu_tlb_entry *ent, *cell_entries;
> >  	struct pvu_dev *dev;
> > -	int ret, tlb_next;
> > +	int tlb_next;
> >  
> >  	cell_entries = cell->arch.iommu_pvu.entries;
> >  	ent_count = cell->arch.iommu_pvu.ent_count;
> >  	if (ent_count == 0 || cell_entries == NULL)
> > -		return 0;
> > +		return;
> >  
> >  	/* Program same memory mapping for all of the instances */
> >  	for (inst = 0; inst < pvu_count; inst++) {
> > @@ -356,20 +362,15 @@ static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
> >  			if (idx == 0 && i >= dev->num_entries) {
> >  				/* Find next available TLB and chain to it */
> >  				tlb_next = pvu_tlb_alloc(dev, virtid);
> > -				if (tlb_next < 0)
> > -					return -ENOMEM;
> >  				pvu_tlb_chain(dev, tlbnum, tlb_next);
> >  				pvu_tlb_enable(dev, tlbnum);
> >  				tlbnum = tlb_next;
> >  			}
> >  
> > -			ret = pvu_entry_write(dev, tlbnum, idx, ent);
> > -			if (ret)
> > -				return ret;
> > +			pvu_entry_write(dev, tlbnum, idx, ent);
> 
> But what if pvu_entry_write finds an issue? Are we fine with reporting
> only and then simply continueing?
> 
The failures in pvu_entry_write are defensive programming.
To ensure that the hardware constraints are met.
Here, the caller has ensured the constraints, so this won't fail.

I can either get rid of the checks or explain why it is okay to
ignore the return value

> Please clearify that in-place, i.e. via comments in pvu_entry_write(),
> and remove ignored return values.
> 

> >  		}
> >  		pvu_tlb_enable(dev, tlbnum);
> >  	}
> > -	return 0;
> >  }
> >  
> >  /*
> > @@ -380,8 +381,9 @@ int pvu_iommu_map_memory(struct cell *cell,
> >  			 const struct jailhouse_memory *mem)
> >  {
> >  	struct pvu_tlb_entry *ent;
> > +	struct pvu_dev *dev;
> >  	unsigned int size;
> > -	u32 flags = 0;
> > +	u32 tlb_count, flags = 0;
> >  	int ret;
> >  
> >  	if (pvu_count == 0 || (mem->flags & JAILHOUSE_MEM_DMA) == 0)
> > @@ -408,7 +410,19 @@ int pvu_iommu_map_memory(struct cell *cell,
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	cell->arch.iommu_pvu.ent_count += ret;
> > +	/*
> > +	 * Check if there are enough TLBs left for *chaining* to ensure that
> > +	 * pvu_tlb_alloc called from config_commit never fails
> > +	 */
> > +	tlb_count = (cell->arch.iommu_pvu.ent_count + ret - 1) / 8;
> > +	dev = &pvu_units[0];
> > +
> > +	if (tlb_count > dev->free_tlb_count) {
> > +		printk("ERROR: PVU: Mapping this memory needs more TLBs than that are available\n");
> > +		return -EINVAL;
> > +	} else {
> 
> No need for "else" here.
> 
got it, will remove

> > +		cell->arch.iommu_pvu.ent_count += ret;
> > +	}
> >  	return 0;
> >  }
> >  
> > @@ -434,13 +448,12 @@ int pvu_iommu_unmap_memory(struct cell *cell,
> >  	return 0;
> >  }
> >  
> > -int pvu_iommu_config_commit(struct cell *cell)
> > +void pvu_iommu_config_commit(struct cell *cell)
> >  {
> >  	unsigned int i, virtid;
> > -	int ret = 0;
> >  
> >  	if (pvu_count == 0 || !cell)
> > -		return 0;
> > +		return;
> >  
> >  	/*
> >  	 * Chaining the TLB entries adds extra latency to translate those
> > @@ -455,13 +468,10 @@ int pvu_iommu_config_commit(struct cell *cell)
> >  		if (virtid > MAX_VIRTID)
> >  			continue;
> >  
> > -		ret = pvu_iommu_program_entries(cell, virtid);
> > -		if (ret)
> > -			return ret;
> > +		pvu_iommu_program_entries(cell, virtid);
> >  	}
> >  
> >  	cell->arch.iommu_pvu.ent_count = 0;
> > -	return ret;
> >  }
> >  
> >  static int pvu_iommu_cell_init(struct cell *cell)
> > 
> 
> Jan

Thanks for review
Nikhil D
> 
> -- 
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
> 
> -- 
> You received this message because you are subscribed to the Google Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a282f746-9eb7-eb5e-7c45-a45e795a74c3%40siemens.com.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201027192413.kngjt3exc3wesbfy%40NiksLab.
