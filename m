Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBX775T6AKGQEWIQL4HA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73c.google.com (mail-qk1-x73c.google.com [IPv6:2607:f8b0:4864:20::73c])
	by mail.lfdr.de (Postfix) with ESMTPS id A517929F7B1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 23:19:12 +0100 (CET)
Received: by mail-qk1-x73c.google.com with SMTP id x85sf2715437qka.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 15:19:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1604009951; cv=pass;
        d=google.com; s=arc-20160816;
        b=fzlYscuSlfjW29AF/DN8aqVGorcDcvpcVp9ygT4mDnBOFs98D64Y+vjUHESqsLuOn/
         ybPXEgXHNn9ko+rhufrAcFdd5Y/XLWiNieWTKtYE5jqbPVJK5ePr1urmtxmhDhfyzUg3
         bYjEUACAdEE38y86KEI5AqSdiLTVvDjqTMasJ0GyFDRV1TDyRDJLpKFIUhig3e5wK322
         uAcF3Deefa6pVEqnWxNUhqbCBNP5mCsxUxi52eVQTUsUafVBxbIBmMH8J747lbZxqvvX
         ZQCQlXpang5NTB+J9UVByTj+0zg3DS3oQ20wpeTsUD3s6pcVG9xvJ2B+O/4tHd+7rlee
         sx/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=L34IjeUjEn+xVUdvOe2oTo3h2pxUUp/j8Nyh3oZkjWs=;
        b=qW4nvFhhQwocK2catcOKs9ha3jKmUjqwZLapDVBKHgO4fArV2YkB4UBJbnhoOBTDWz
         Qs/wJY+vFHTshQe9E/no2fvpX8K4jF49+W8HO0qYMrRSBpLo0Hi11KYHlhgX4OO84nB+
         eALOGZ0uvritJAHASh/oHK69VXCthIKPHOAGmQZ3Pu4krAOWBem4svCjXi86FAettYGo
         eWwhbBJb2q706Yznmgak+BQt8xCeKQDyDMAG59muBQpUdPqbD8O6knsbhYDoXF/u3EdP
         r1TmT16fikQiA1AHAFBfamWOvyyHTHDXvkZD7fLg2DC4GDTqvo3qpfa0NYquAViOScTA
         oF6g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Xw6iq788;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=L34IjeUjEn+xVUdvOe2oTo3h2pxUUp/j8Nyh3oZkjWs=;
        b=r2UwD1ZcAZgzEx930fZOcMYX+pwvgnRvbPjq0y7UKHGlYymw9us7qBxpqtupgvXijI
         1I9IcirADY89SdbloGmPghOWWeTr3N193xvW2PQ5e3OgGIbY1BtRW0e8hLumQp/AyhDH
         Lg0rhjMnqmEC57staY95XjEH+jR8PU7ezJpzJL4Pw0RkytxNX7lvSrCP7q7J9Ew8n9Lo
         4M3FzXyMCbzSSx2ghLP2XpupaaGKY8Uy+O78EGfsyesJVRF6hCdo3mFQRhioJL27wfDS
         7hl8u/9vPjrdK0SmMQATgRRC9VEKpPa/8y1O6bfToJ8FlTZuVJ6nOagcPNbhBE4rXLyd
         ucOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L34IjeUjEn+xVUdvOe2oTo3h2pxUUp/j8Nyh3oZkjWs=;
        b=NUhIbILwNfG7jg5SGh0e6dJkETRM7wsn1GeuwljzsjrpeBouiyv5hh1ZWbsTRO72Kj
         ZVvfV5Ds1TIxqQd46ft+HnadhVg/KwWqsFNJ+2b/QfYNlr0W7Tiu68zfh6ksWVB5JSPa
         LzYVSuyGI4ukMjE8hBH2CofDVRYWFX+wWLGCYPbtV9lt1vLaDegY1wn+UUzGln3t2L7P
         pEXtaKryvXO9Zezf4IJwYO37CIM1VlHhFCfoughG/YWcQWmVenHtx0mUjnjxdXFscndm
         kfcLb+d21zqmszoZwrQd7pkVU3T6yYRxL5k0ha8kb6uKKEpI7mHVkAi3fS+x+0RMZQFy
         Y37A==
X-Gm-Message-State: AOAM5301CmGt9oEz/9IhPGHfj8U+h93Ok4B46qnIEszKj5MxihL3s7Eh
	bs9TD7e+xPiAjPe2BdYhqdM=
X-Google-Smtp-Source: ABdhPJy8dDsn9NHI97aVisSuyI+CxYDEDDwdGCT9nJUibhzLdDVVkd2p0JBHVoUiFjxX1TaknCoC4A==
X-Received: by 2002:a05:620a:2148:: with SMTP id m8mr5908242qkm.19.1604009951765;
        Thu, 29 Oct 2020 15:19:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:efcc:: with SMTP id d195ls2110766qkg.10.gmail; Thu, 29
 Oct 2020 15:19:11 -0700 (PDT)
X-Received: by 2002:a37:2784:: with SMTP id n126mr3304849qkn.477.1604009951168;
        Thu, 29 Oct 2020 15:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604009951; cv=none;
        d=google.com; s=arc-20160816;
        b=UlxmPYKl1DE0B2+x/wpN6atqiphnnXK54z8N2Wl62avZZBMO81DpcVoOmsmM3z8qtD
         2p7tnw0/6J2F72WaPTi4bfiqzGPdx5Ez2FuryvfUzV3qF7GDl58yxNn/lL4tKzIrzH8A
         Jdga5C2yVDsyrOysXDnXglzbH7Oncp06lKIJdr/GjpR6r3rwRe7PP7COgj82We6J6cRo
         B1wdEthQO30ZtbkwdJUvcLn0NTjTy9nhcksY8ol8E7uzcfi7Oi95IIhJ1CwcNdL4VLlQ
         x3EWN/gdc82WVLMT8ekLiBtaQDTmMMlAaGZROjzxf5tHahidTyvvV03X8whhxVIlJu7l
         oYIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=wd3a1ZKhJgUPt4KZHMb3SphaouTU+U5y39dR7a0iI+Q=;
        b=RwyyCW1BS98HkKhjs9nCQSPXKe01w40toosJJRRTAxb9wrD0eDLZx+3kq1AUNKT8Ty
         7kqdrmnT8BYOM080JL3SOiNQsu8kqHh6nDm0KvUIzlHmiflXgCgy/kfYDeM9BefAR3qZ
         xw/iQeYn8plun+zZjVCfu/c96qZ9lKhAfysO1aFP9KZXVBSo12xKcMI3257ULMYOSwZM
         5enmkovbidCKVeaZhKQX/hzoqUgRAJNWIVywTpl8ml6pO4cbd/Ie6G/4+Rcd04fjxePW
         kWOE1nJLaeTM/nsFX0DH23GDBn0JhZ+UvgPbAiRIaJcJ5MUxPwcsfRrMxP5U6fZS0jm4
         nvZA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Xw6iq788;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id p51si330498qtc.4.2020.10.29.15.19.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 15:19:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09TMJAs7018650;
	Thu, 29 Oct 2020 17:19:10 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09TMJAQM025316
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Oct 2020 17:19:10 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 29
 Oct 2020 17:19:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 29 Oct 2020 17:19:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09TMJ8W6114868;
	Thu, 29 Oct 2020 17:19:09 -0500
Date: Fri, 30 Oct 2020 03:49:07 +0530
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: <jailhouse-dev@googlegroups.com>,
        Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>,
        Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2] arm64: pvu: Avoid failure in config_commit
Message-ID: <20201029221907.357r23w3q7rozsxa@NiksLab>
References: <20201028141454.22657-1-nikhil.nd@ti.com>
 <372c4fcc-f707-955b-ec3f-c800dc948557@siemens.com>
 <20201029152737.og3yauwbcxu3th2p@NiksLab>
 <0dccb943-2777-b646-de90-1124bc6d9530@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <0dccb943-2777-b646-de90-1124bc6d9530@siemens.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Xw6iq788;       spf=pass
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

On 17:09-20201029, Jan Kiszka wrote:
> On 29.10.20 16:27, Nikhil Devshatwar wrote:
> > On 08:14-20201029, Jan Kiszka wrote:
> >> On 28.10.20 15:14, 'Nikhil Devshatwar' via Jailhouse wrote:
> >>> Current PVU iommu implementation ignores possible failures in the
> >>> config_commit part. This would allow inconsistent configuration
> >>> to run and may introduce unknown bugs.
> >>>
> >>> Solve this by making sure that the pvu_iommu_config_commit never
> >>> fails. Catch the errors early in the mapping phase. Use
> >>> "free_tlb_count" to track available no of TLBs for chaining.
> >>> This can be used to check if any mapping causes it to potentially
> >>> use more no of TLBs than that are free. This will ensure that
> >>> the allocationg for chaining will not fail.
> >>
> >> allocating
> >>
> >>>
> >>> Change the return type to void for few functions. Add comments to
> >>> explain behavior in case of failure.
> >>>
> >>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> >>> ---
> >>>
> >>> Notes:
> >>>     Changes from v1:
> >>>     * Add a comment to descibe why pvu_tlb_alloc will not fail
> >>>     * Make return type of pvu_entry_write as void and explain the
> >>>     behavior in case the constraints are not met
> >>>     * Remove un necessary else block
> >>>
> >>>  hypervisor/arch/arm64/include/asm/ti-pvu.h |  3 +-
> >>>  hypervisor/arch/arm64/ti-pvu.c             | 68 ++++++++++++++--------
> >>>  2 files changed, 45 insertions(+), 26 deletions(-)
> >>>
> >>> diff --git a/hypervisor/arch/arm64/include/asm/ti-pvu.h b/hypervisor/arch/arm64/include/asm/ti-pvu.h
> >>> index 2c340b3a..62aec7c0 100644
> >>> --- a/hypervisor/arch/arm64/include/asm/ti-pvu.h
> >>> +++ b/hypervisor/arch/arm64/include/asm/ti-pvu.h
> >>> @@ -117,6 +117,7 @@ struct pvu_dev {
> >>>  	u16		max_virtid;
> >>>  
> >>>  	u16		tlb_data[PVU_NUM_TLBS];
> >>> +	u16		free_tlb_count;
> >>>  };
> >>>  
> >>>  int pvu_iommu_map_memory(struct cell *cell,
> >>> @@ -125,6 +126,6 @@ int pvu_iommu_map_memory(struct cell *cell,
> >>>  int pvu_iommu_unmap_memory(struct cell *cell,
> >>>  		const struct jailhouse_memory *mem);
> >>>  
> >>> -int pvu_iommu_config_commit(struct cell *cell);
> >>> +void pvu_iommu_config_commit(struct cell *cell);
> >>>  
> >>>  #endif /* _IOMMMU_PVU_H_ */
> >>> diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
> >>> index 3b9a29ec..c488ce89 100644
> >>> --- a/hypervisor/arch/arm64/ti-pvu.c
> >>> +++ b/hypervisor/arch/arm64/ti-pvu.c
> >>> @@ -15,7 +15,7 @@
> >>>   * There are limitations on the number of available contexts, page sizes,
> >>>   * number of pages that can be mapped, etc.
> >>>   *
> >>> - * PVU is desgined to be programmed with all the memory mapping at once.
> >>> + * PVU is designed to be programmed with all the memory mapping at once.
> >>>   * Therefore, it defers the actual register programming till config_commit.
> >>>   * Also, it does not support unmapping of the pages at runtime.
> >>>   *
> >>> @@ -110,9 +110,15 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
> >>>  	for (i = dev->max_virtid + 1; i < dev->num_tlbs; i++) {
> >>>  		if (dev->tlb_data[i] == 0) {
> >>>  			dev->tlb_data[i] = virtid << dev->num_entries;
> >>> +			dev->free_tlb_count--;
> >>>  			return i;
> >>>  		}
> >>>  	}
> >>> +
> >>> +	/*
> >>> +	 * We should never reach here, tlb_allocation should not fail
> >>> +	 * pvu_iommu_map_memory ensures that there are enough free TLBs
> >>> +	 */
> >>
> >> If we never get here, the test for "i < dev->num_tlbs" is pointless. If
> >> we could get here, we should not return.
> > 
> > I would like to add some kind of BUG()
> > Do we have something like this?
> 
> Not yet. Could be simply defined as
> 
> #define BUG()	*(int *)0 = 0xdead

okay, I will add this.
> 
> > 
> >>
> >>>  	return 0;
> >>>  }
> >>>  
> >>> @@ -138,10 +144,13 @@ static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
> >>>  
> >>>  	mmio_write32(&tlb->chain, 0x0);
> >>>  
> >>> -	if (i < dev->max_virtid)
> >>> +	if (i < dev->max_virtid) {
> >>>  		dev->tlb_data[tlbnum] = 0x0 | i << dev->num_entries;
> >>> -	else
> >>> +	} else {
> >>> +		/* This was a chained TLB */
> >>>  		dev->tlb_data[tlbnum] = 0x0;
> >>> +		dev->free_tlb_count++;
> >>> +	}
> >>>  
> >>>  }
> >>>  
> >>> @@ -159,7 +168,7 @@ static void pvu_entry_enable(struct pvu_dev *dev, u16 tlbnum, u8 index)
> >>>  	dev->tlb_data[tlbnum] |= (1 << index);
> >>>  }
> >>>  
> >>> -static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
> >>> +static void pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
> >>>  			   struct pvu_tlb_entry *ent)
> >>>  {
> >>>  	struct pvu_hw_tlb_entry *entry;
> >>> @@ -174,17 +183,21 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
> >>>  			break;
> >>>  	}
> >>>  
> >>> +	/*
> >>> +	 * If the hardware constraints for page size and address alignment
> >>> +	 * are not met, print out an error, return without writing any entry
> >>> +	 */
> >>
> >> That's lacking reasoning *why* we can continue then. Again: Can the user
> >> trigger this by providing an invalid config?
> > No. It's not possible. As I explained, it was just defensive
> > programming. I can get rid of the checks and still no bad config will
> > trigger this.
> > 
> >> I suspect so. Can we catch that earlier?
> > The original intent was to write the PVU part such that it can be
> > easily ported to other hypervisors. That's why these checks.
> > Shall I remove?
> 
> Yes, then it can go.

Will do
> 
> > 
> >>
> >>>  	if (pgsz >= ARRAY_SIZE(pvu_page_size_bytes)) {
> >>>  		printk("ERROR: PVU: %s: Unsupported page size %llx\n",
> >>>  			__func__, ent->size);
> >>> -		return -EINVAL;
> >>> +		return;
> >>>  	}
> >>>  
> >>>  	if (!is_aligned(ent->virt_addr, ent->size) ||
> >>>  	    !is_aligned(ent->phys_addr, ent->size)) {
> >>>  		printk("ERROR: PVU: %s: Address %llx => %llx is not aligned with size %llx\n",
> >>>  			__func__, ent->virt_addr, ent->phys_addr, ent->size);
> >>> -		return -EINVAL;
> >>> +		return;
> >>>  	}
> >>>  
> >>>  	mmio_write32(&entry->reg0, ent->virt_addr & 0xffffffff);
> >>> @@ -198,9 +211,8 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
> >>>  	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_PGSIZE_MASK, pgsz);
> >>>  	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_FLAG_MASK, ent->flags);
> >>>  
> >>> -	/* Do we need "DSB NSH" here to make sure all writes are finised? */
> >>> +	/* Do we need "DSB NSH" here to make sure all writes are finished? */
> >>>  	pvu_entry_enable(dev, tlbnum, index);
> >>> -	return 0;
> >>>  }
> >>>  
> >>>  static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
> >>> @@ -221,6 +233,8 @@ static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
> >>>  	}
> >>>  
> >>>  	dev->max_virtid = max_virtid;
> >>> +	dev->free_tlb_count = dev->num_tlbs - (max_virtid + 1);
> >>> +
> >>>  	mmio_write32(&cfg->virtid_map1, 0);
> >>>  	mmio_write32_field(&cfg->virtid_map2, PVU_MAX_VIRTID_MASK, max_virtid);
> >>>  
> >>> @@ -328,17 +342,17 @@ static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
> >>>  	}
> >>>  }
> >>>  
> >>> -static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
> >>> +static void pvu_iommu_program_entries(struct cell *cell, u8 virtid)
> >>>  {
> >>>  	unsigned int inst, i, tlbnum, idx, ent_count;
> >>>  	struct pvu_tlb_entry *ent, *cell_entries;
> >>>  	struct pvu_dev *dev;
> >>> -	int ret, tlb_next;
> >>> +	int tlb_next;
> >>>  
> >>>  	cell_entries = cell->arch.iommu_pvu.entries;
> >>>  	ent_count = cell->arch.iommu_pvu.ent_count;
> >>>  	if (ent_count == 0 || cell_entries == NULL)
> >>> -		return 0;
> >>> +		return;
> >>>  
> >>>  	/* Program same memory mapping for all of the instances */
> >>>  	for (inst = 0; inst < pvu_count; inst++) {
> >>> @@ -356,20 +370,15 @@ static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
> >>>  			if (idx == 0 && i >= dev->num_entries) {
> >>>  				/* Find next available TLB and chain to it */
> >>>  				tlb_next = pvu_tlb_alloc(dev, virtid);
> >>> -				if (tlb_next < 0)
> >>> -					return -ENOMEM;
> >>>  				pvu_tlb_chain(dev, tlbnum, tlb_next);
> >>>  				pvu_tlb_enable(dev, tlbnum);
> >>>  				tlbnum = tlb_next;
> >>>  			}
> >>>  
> >>> -			ret = pvu_entry_write(dev, tlbnum, idx, ent);
> >>> -			if (ret)
> >>> -				return ret;
> >>> +			pvu_entry_write(dev, tlbnum, idx, ent);
> >>>  		}
> >>>  		pvu_tlb_enable(dev, tlbnum);
> >>>  	}
> >>> -	return 0;
> >>>  }
> >>>  
> >>>  /*
> >>> @@ -380,8 +389,9 @@ int pvu_iommu_map_memory(struct cell *cell,
> >>>  			 const struct jailhouse_memory *mem)
> >>>  {
> >>>  	struct pvu_tlb_entry *ent;
> >>> +	struct pvu_dev *dev;
> >>>  	unsigned int size;
> >>> -	u32 flags = 0;
> >>> +	u32 tlb_count, flags = 0;
> >>>  	int ret;
> >>>  
> >>>  	if (pvu_count == 0 || (mem->flags & JAILHOUSE_MEM_DMA) == 0)
> >>> @@ -408,6 +418,18 @@ int pvu_iommu_map_memory(struct cell *cell,
> >>>  	if (ret < 0)
> >>>  		return ret;
> >>>  
> >>> +	/*
> >>> +	 * Check if there are enough TLBs left for *chaining* to ensure that
> >>> +	 * pvu_tlb_alloc called from config_commit never fails
> >>> +	 */
> > 
> > Looks like I will need better comment here
> > 
> >>> +	tlb_count = (cell->arch.iommu_pvu.ent_count + ret - 1) / 8;
> >>
> >> Can you explain this math? Without reasioning how that prevents the
> >> overflow exactly, dropping a check from pvu_tlb_alloc() would be hard to
> >> argue.
> > 
> > I am counting how many TLBs you need for chaining.
> > Total TLBs = (no of entries  + 7 ) / 8
> > Total TLBs for chaining =  (no of entries  + 7 ) / 8 - 1
> > simplified, it becomes (no of entries  - 1 ) / 8
> > 
> > Let's say the user asks to map a region, which after breakdown, results
> > into 12 entries. Since this call is saving entries for all the mappings,
> > it will add with previous count and find out that total of 76 entries
> > are needed.
> > 
> > That means (76 -1 ) / 8 = 9 new allocations are needed.
> > If there are at least 9 free_tlb available, we are okay.
> > If not, we flag the failure early by failing the map call.
> > 
> 
> OK, there is a magic REGS_PER_TLB = 8, spread in hard-coded manner. I

Good catch.
Actually in all other places I am using dev->num_entries
This is the only place I used magic 8
I will change that as well.


> didn't look as close at this code yet as I did for the smmu-v2. I
> suspect there is also some room for cleanups... ;)

Thanks!
Nikhil D

> 
> Jan
> 
> -- 
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201029221907.357r23w3q7rozsxa%40NiksLab.
