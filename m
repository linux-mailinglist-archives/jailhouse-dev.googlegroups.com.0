Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB3N65P6AKGQESJVH6QQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83a.google.com (mail-qt1-x83a.google.com [IPv6:2607:f8b0:4864:20::83a])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EC829EFBF
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 16:27:42 +0100 (CET)
Received: by mail-qt1-x83a.google.com with SMTP id d22sf2105512qtn.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 08:27:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603985261; cv=pass;
        d=google.com; s=arc-20160816;
        b=zOp7xH/+rE8lo4vymamVWx0tlPMywWRNiqYyhtlUTvTwJOsiTqlmp3tt1IsY2Ivf/4
         TkpipLM2PYV8FcKFKWeW28mw5xNkBYWoUMqgTkZ863m4tDoyIAvBc9mZzmJdfwe+9Rn0
         lCDZb26dD+hruQn0ay+B4wFxLIB3KtNXJk5ELN+Z7ezY1kYwYqpE7CmKqeXz34yqJnjw
         fOZrS1TzOC41uRYOT22IsuJRiNvX1fC78vOnrsf+230nFTT5OkoVCo3N8sMdxpiBt9Si
         0LCk9U17HRTGbKgcLhBjBqtqHsV6EWsOJROfSNXx4/v/mRR2GcHbSKeXm9J1MKKV+2A3
         2uew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=6awjd2DOpD5E+lGh8CpQdpUTa6ldi1Wx9B4R1It8IY8=;
        b=cy1wPhDNGPeYkfOwGymXxpCbFdr9ssMlNgRAXl1P2RRJk2M2PtUJdQ02bXxUexaI/g
         JTDQOTDExJe+Dj2yK/AxfpGNafS8XTLIuJvRw0luc6h1L84GyopY8UQl3PZSBEB+el09
         UeMuZxNwbr1UO+xChZn2wX54jX9UoTqN4sg08VfhPKeOjuJkLv49a04iz4kKSmlDor33
         szwpJ/RM3snN8cahMNceYuxHfGnQ9+g9lngnSYR4h+/w/8K45L9lWlsWIXEKZrOyhs0D
         kAirNUWmzgzhaOS47n+QBdPr5Xb7/I52+vKe+eTelJGcaYXCDj35ahEuZHclBJ9lc7Xa
         3/XQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=arNg41Cf;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=6awjd2DOpD5E+lGh8CpQdpUTa6ldi1Wx9B4R1It8IY8=;
        b=L3+IzPphoOkznQii7a2pKkuLCQOVHz2ae6JkEcvUZRepObbmyUXjHJMRvgYETjBlID
         Thb8HTlNiS8CaHnKF5hskDkfYVHHI+hv+Ft2g2y2oXbqGvdhSJJyGylgdzc/XaYjz3E6
         russ7rblfyCVv8S8ZuNNCPqn2oQZ2ytYgobxtqf6riVZ3thG+KeWejRmhMZ8EpgrSB+m
         NBUxvKn1ix19+tBLyIXoHwrq85WKc6TTVh8iO7NbP2eyOKAhKkkX8BAz7a83xo9da2lQ
         Rhmw6+iOi1GAWHgiREy7A/WbAHvOLWBbRG2f0i6/qjMr6fnQ9o5F5EuhUKkzeANL+9vh
         Gs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6awjd2DOpD5E+lGh8CpQdpUTa6ldi1Wx9B4R1It8IY8=;
        b=OlE2eYvpG1xNtRX9RAkJR52JaFE3UsG2QKhsZFVtwaEFChpBh+hc6tyDrJjtyFOyNY
         Tf4r5fc4kSkD6Zz186UfTzgVCJFWRgHsZsi+DskaZc6bTpPv/UEvYHoy6xwiWdAN+8ZW
         sYXdzaG5CzBLP2CFOuJJs49J0IrzJ5rCpv7VQa5/udM1XeIrQs8X3D95d0T5mUfngsLi
         tFDEXQ+ukeQAoG5Rg0rLOrTbZRUa7918uWAFoTXcN3Vval6RE/XOPNRH6OgQDBJRxxB+
         nfmP5xbdOxFHSlMFsh0yw1SkdWOyEXK3A21FlJvkCRqzkg64e/sOYM6ZP9WewY3saA6n
         Pkug==
X-Gm-Message-State: AOAM532XA5pI7FWnSDeubglMwFzy44hEJFu8lXbYcdZEj0taVlXabyat
	ov8lFzBL4chcE+eGALi8xBQ=
X-Google-Smtp-Source: ABdhPJxdnlkJMP1/D8onB0KCuRynHp36hhiFZW+4Q/iWlITMtoKoSpw+xejypddZBPZeCX5d9syRFA==
X-Received: by 2002:ac8:44b9:: with SMTP id a25mr4190060qto.301.1603985261552;
        Thu, 29 Oct 2020 08:27:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:4a21:: with SMTP id n1ls840339qvz.11.gmail; Thu, 29 Oct
 2020 08:27:40 -0700 (PDT)
X-Received: by 2002:ad4:43c6:: with SMTP id o6mr4600626qvs.53.1603985260879;
        Thu, 29 Oct 2020 08:27:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603985260; cv=none;
        d=google.com; s=arc-20160816;
        b=wBNXnhMUkrRnU1nxjWRtkBLdmR3YR5+zAHOyEPUF2o0BI1z9uWr5cR3BxqNLY4P+eT
         hzeExjsWMB/Eh9l5QTpjifCNSLoth9u6fsiXtcdasv7LXO6egnQVZvz3vixJ4qA0sgvK
         ENkDQkdqNkl/tfFDamms0VreIlPGa76lTVPzEMCILMVdFro1eCW9khvMmppK7lKx9VaK
         JtOVNoLUYYPZVmIO41c0Rm7Y1Fhdj9Aw/5N+H1H9EfLLHQX2wNu8oBc+BHIx2uAQXWms
         sagh6qSJ6TQKGn809nqZXapYq/WcIw2wT6so0hCg6Vb7fEkSilOJpxMQPlmGvUzvGwcI
         Mvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=WCos5vEjr86OnISy/NqCXgQJVmJGNXPvrBMkDr8MP14=;
        b=SSvmMhSS7JUa71Z1b0tYThBb9uKctNLuvSZP3fL+zHjuAELSy4r4ejj8Kywu4brJOI
         s7h+HvMDskRlS6Nr7QXxgF2gTR+BnKyW961aZAHeDX6Il0dUzl+NVu3kgET0f3iLfEJr
         twpOU9HBzUHSmJ4r5rub9p3KZLuOiiSbnQOeiK7H/BpV/avIcEREI1UJo+hP3U35l3FX
         clXi0k0H3IV0EoE6BUkYZYVBFyjYy5ZxSiltuDv5xgPfk3LOUajlJOyeDFuJ9j+tp5Do
         KR0tfjMsl7xWG+l3tnPxTsU54vwHQPCo0KhO+jZXtv0HtY9KdoNuclkffMbyYBXLraoF
         Xs0g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=arNg41Cf;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id p51si245564qtc.4.2020.10.29.08.27.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 08:27:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09TFRdKq130346;
	Thu, 29 Oct 2020 10:27:39 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09TFRddp053850
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Oct 2020 10:27:39 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 29
 Oct 2020 10:27:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 29 Oct 2020 10:27:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09TFRciX104012;
	Thu, 29 Oct 2020 10:27:38 -0500
Date: Thu, 29 Oct 2020 20:57:37 +0530
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: <jailhouse-dev@googlegroups.com>,
        Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>,
        Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2] arm64: pvu: Avoid failure in config_commit
Message-ID: <20201029152737.og3yauwbcxu3th2p@NiksLab>
References: <20201028141454.22657-1-nikhil.nd@ti.com>
 <372c4fcc-f707-955b-ec3f-c800dc948557@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <372c4fcc-f707-955b-ec3f-c800dc948557@siemens.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=arNg41Cf;       spf=pass
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

On 08:14-20201029, Jan Kiszka wrote:
> On 28.10.20 15:14, 'Nikhil Devshatwar' via Jailhouse wrote:
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
> 
> allocating
> 
> > 
> > Change the return type to void for few functions. Add comments to
> > explain behavior in case of failure.
> > 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > ---
> > 
> > Notes:
> >     Changes from v1:
> >     * Add a comment to descibe why pvu_tlb_alloc will not fail
> >     * Make return type of pvu_entry_write as void and explain the
> >     behavior in case the constraints are not met
> >     * Remove un necessary else block
> > 
> >  hypervisor/arch/arm64/include/asm/ti-pvu.h |  3 +-
> >  hypervisor/arch/arm64/ti-pvu.c             | 68 ++++++++++++++--------
> >  2 files changed, 45 insertions(+), 26 deletions(-)
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
> > index 3b9a29ec..c488ce89 100644
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
> > @@ -110,9 +110,15 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
> >  	for (i = dev->max_virtid + 1; i < dev->num_tlbs; i++) {
> >  		if (dev->tlb_data[i] == 0) {
> >  			dev->tlb_data[i] = virtid << dev->num_entries;
> > +			dev->free_tlb_count--;
> >  			return i;
> >  		}
> >  	}
> > +
> > +	/*
> > +	 * We should never reach here, tlb_allocation should not fail
> > +	 * pvu_iommu_map_memory ensures that there are enough free TLBs
> > +	 */
> 
> If we never get here, the test for "i < dev->num_tlbs" is pointless. If
> we could get here, we should not return.

I would like to add some kind of BUG()
Do we have something like this?

> 
> >  	return 0;
> >  }
> >  
> > @@ -138,10 +144,13 @@ static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
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
> > @@ -159,7 +168,7 @@ static void pvu_entry_enable(struct pvu_dev *dev, u16 tlbnum, u8 index)
> >  	dev->tlb_data[tlbnum] |= (1 << index);
> >  }
> >  
> > -static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
> > +static void pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
> >  			   struct pvu_tlb_entry *ent)
> >  {
> >  	struct pvu_hw_tlb_entry *entry;
> > @@ -174,17 +183,21 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
> >  			break;
> >  	}
> >  
> > +	/*
> > +	 * If the hardware constraints for page size and address alignment
> > +	 * are not met, print out an error, return without writing any entry
> > +	 */
> 
> That's lacking reasoning *why* we can continue then. Again: Can the user
> trigger this by providing an invalid config?
No. It's not possible. As I explained, it was just defensive
programming. I can get rid of the checks and still no bad config will
trigger this.

> I suspect so. Can we catch that earlier?
The original intent was to write the PVU part such that it can be
easily ported to other hypervisors. That's why these checks.
Shall I remove?

> 
> >  	if (pgsz >= ARRAY_SIZE(pvu_page_size_bytes)) {
> >  		printk("ERROR: PVU: %s: Unsupported page size %llx\n",
> >  			__func__, ent->size);
> > -		return -EINVAL;
> > +		return;
> >  	}
> >  
> >  	if (!is_aligned(ent->virt_addr, ent->size) ||
> >  	    !is_aligned(ent->phys_addr, ent->size)) {
> >  		printk("ERROR: PVU: %s: Address %llx => %llx is not aligned with size %llx\n",
> >  			__func__, ent->virt_addr, ent->phys_addr, ent->size);
> > -		return -EINVAL;
> > +		return;
> >  	}
> >  
> >  	mmio_write32(&entry->reg0, ent->virt_addr & 0xffffffff);
> > @@ -198,9 +211,8 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
> >  	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_PGSIZE_MASK, pgsz);
> >  	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_FLAG_MASK, ent->flags);
> >  
> > -	/* Do we need "DSB NSH" here to make sure all writes are finised? */
> > +	/* Do we need "DSB NSH" here to make sure all writes are finished? */
> >  	pvu_entry_enable(dev, tlbnum, index);
> > -	return 0;
> >  }
> >  
> >  static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
> > @@ -221,6 +233,8 @@ static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
> >  	}
> >  
> >  	dev->max_virtid = max_virtid;
> > +	dev->free_tlb_count = dev->num_tlbs - (max_virtid + 1);
> > +
> >  	mmio_write32(&cfg->virtid_map1, 0);
> >  	mmio_write32_field(&cfg->virtid_map2, PVU_MAX_VIRTID_MASK, max_virtid);
> >  
> > @@ -328,17 +342,17 @@ static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
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
> > @@ -356,20 +370,15 @@ static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
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
> >  		}
> >  		pvu_tlb_enable(dev, tlbnum);
> >  	}
> > -	return 0;
> >  }
> >  
> >  /*
> > @@ -380,8 +389,9 @@ int pvu_iommu_map_memory(struct cell *cell,
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
> > @@ -408,6 +418,18 @@ int pvu_iommu_map_memory(struct cell *cell,
> >  	if (ret < 0)
> >  		return ret;
> >  
> > +	/*
> > +	 * Check if there are enough TLBs left for *chaining* to ensure that
> > +	 * pvu_tlb_alloc called from config_commit never fails
> > +	 */

Looks like I will need better comment here

> > +	tlb_count = (cell->arch.iommu_pvu.ent_count + ret - 1) / 8;
> 
> Can you explain this math? Without reasioning how that prevents the
> overflow exactly, dropping a check from pvu_tlb_alloc() would be hard to
> argue.

I am counting how many TLBs you need for chaining.
Total TLBs = (no of entries  + 7 ) / 8
Total TLBs for chaining =  (no of entries  + 7 ) / 8 - 1
simplified, it becomes (no of entries  - 1 ) / 8

Let's say the user asks to map a region, which after breakdown, results
into 12 entries. Since this call is saving entries for all the mappings,
it will add with previous count and find out that total of 76 entries
are needed.

That means (76 -1 ) / 8 = 9 new allocations are needed.
If there are at least 9 free_tlb available, we are okay.
If not, we flag the failure early by failing the map call.


Regards,
Nikhil D
> 
> > +	dev = &pvu_units[0];
> > +
> > +	if (tlb_count > dev->free_tlb_count) {
> > +		printk("ERROR: PVU: Mapping this memory needs more TLBs than that are available\n");
> > +		return -EINVAL;
> > +	}
> > +
> >  	cell->arch.iommu_pvu.ent_count += ret;
> >  	return 0;
> >  }
> > @@ -434,13 +456,12 @@ int pvu_iommu_unmap_memory(struct cell *cell,
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
> > @@ -455,13 +476,10 @@ int pvu_iommu_config_commit(struct cell *cell)
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
> 
> -- 
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
> 
> -- 
> You received this message because you are subscribed to the Google Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/372c4fcc-f707-955b-ec3f-c800dc948557%40siemens.com.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201029152737.og3yauwbcxu3th2p%40NiksLab.
