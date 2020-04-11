Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB6H2Y72AKGQEHCAAXPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd37.google.com (mail-io1-xd37.google.com [IPv6:2607:f8b0:4864:20::d37])
	by mail.lfdr.de (Postfix) with ESMTPS id B89F31A531F
	for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Apr 2020 19:25:14 +0200 (CEST)
Received: by mail-io1-xd37.google.com with SMTP id z185sf5418095iof.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Apr 2020 10:25:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586625913; cv=pass;
        d=google.com; s=arc-20160816;
        b=b+e7bX8O6aUya7x3lhTS5Gr5E7OjYahtAlYKHyYPcN0o3Xah9+BINXWUlwAoXqo6cC
         WBq6AXS16zFEmQhxFFT+xTjoeswTE819H1OJFxcfQRLs1/YVfi8CUyaQkoe5CroCEK+P
         2RpPXTzSb+cz6AXHAGUdJbf7uQhFqU6iYQw6QDBEokwg5QNTJUhEKLtPB+4jEX+vjgFL
         RVJH1h3Hzht/oORIeMxiY8Gzx+qsqsUrXdfHbCs3HBC7FyWzwS5bdUXNL3MGz38FjESz
         TmmrJDGXvuq0UpB09xcLqXurSvx5UeCLrz4aOs57B0+OHhpcTLCCpSI22uHPxdg8vcqM
         zjSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=I74Dgzl9ylXKk+ZgQYJ1OFlpw9Pgqjt64Zhty9ckPGc=;
        b=aLr4U4RfN6zXHP+Yxh6aNnWIi8XLk8We1PP9GH4aX96PbyfyB6AyozVyy4yHsu2BlG
         29MhuBj1l8FBng7Vj9CIcKRW0/GrG9Rsb4mFUAkMeTL5XQ+UHCUWHBvw3CIGLj8r5gFo
         7muA077w8ZaChdC7ZDrEb1l7Rw9WaKvEyALhT09kkQ5fYFjHftEjbq2/0YuSLs3pmCqr
         T3m4ZKond+6jygmU/sir9yFKIh7+wT3s0aH8bMO/EyE6BqcnZ4qJ9ChasIiTS2KatPuC
         dXawyw+wI56mcsffZlOhTGOjLEmBHo3C123cTDaBBabLO6uNdcOK+LJ7dIa/R6qHEn7r
         Iweg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NdnwARA1;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=I74Dgzl9ylXKk+ZgQYJ1OFlpw9Pgqjt64Zhty9ckPGc=;
        b=bq0icX0NrVwHWciedXgtTYzVJjVFSynKmenIz53wg9xPFDD6RDQC6glUB287/lwfR1
         v1AMGj6FLXzwslxAEJ7ilTYBT8gGN5tY98DHgSYrU7hUPFm0MQkBLAhGReGDt+3jZp9p
         mTgE79m3T/P8DIIznw/XboQGXnOMsjAaPNl/3icIbS+YIWL/ykYAUpc9SUhdqrChtQNV
         p9DtuV5fa4Rl03CNZWL3SF7r+0wAzxImChRIIRnNKQ5c2X2C95XAhqXdemGgSGC/zsDx
         IN5gxu+Hw44mtBejOpJ7eXCPo8AxT0mOccStrlmHdNFonXe4iIbWtZmSwEXBclkqP51q
         JUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=I74Dgzl9ylXKk+ZgQYJ1OFlpw9Pgqjt64Zhty9ckPGc=;
        b=Qh6ef2/6IrCHoJneBSBfix21sPp9pH6keYGq67OD4eR3RB51k3FL7ldECNtIc01hpQ
         aY4KU/W2ZbaBNfe4oYSu3wp2TUirzeFU/O6P7TrDPh2Ul0QfOS6u26w3/nnzNFTqbe7T
         AiylBwh1/9QZM5mQrjtUniclijmnGeAwHhwZKrOdYgQVMt1lIu4bYhIqANRP6ax6D3tR
         ksBqFOGwLgnvf9HUuD2IswU79/iw193jo1IUEygYAEMoHBThcfTdEr1CL8tSDQg6fWp9
         YKetWus9NDJ4F3pMaDxUZ5pwdiDVQwp3dGFZRmFmGJmM2U3N8wqdkbfpLSZBBHM/khRD
         KtWw==
X-Gm-Message-State: AGi0PuZRtgHkp9H1vJQsaVbeagT6SzYQqPzojDlpZzDW79eidZO4DM+f
	mv56lWZp2Piu3z0CfkKSC9k=
X-Google-Smtp-Source: APiQypL68lfFfeyR3R586add6SKaxgeoTb1TNJoMR1sbrDpTZJQV3RyQTRUwvMhglaHSOMlYYGnIPg==
X-Received: by 2002:a5d:9e13:: with SMTP id h19mr9472995ioh.152.1586625913073;
        Sat, 11 Apr 2020 10:25:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:dcca:: with SMTP id b10ls8329328ilr.9.gmail; Sat, 11 Apr
 2020 10:25:12 -0700 (PDT)
X-Received: by 2002:a92:7e82:: with SMTP id q2mr9950558ill.188.1586625912536;
        Sat, 11 Apr 2020 10:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586625912; cv=none;
        d=google.com; s=arc-20160816;
        b=AhESwDlsnoh7XZGOk6rY0A9o3nLUqFT+g6LisY1nSmn2pkA6IaeH7RNBTlyv+AjtOL
         ZiHIZlfKy3TXgHgJ2TkgET2Wncpb124syOZx1egncxmotfQfExlbGbupOsZUP4151lIl
         CzjQuL9KgjNadUp+DpZlTFRrex/HC3zflsc0zMoX1H6IrHWxGfxrfITmOg0L5flp/zoa
         I958pWkqXH7Ro4TVRFS+DQT1jyMF6UnzHqj8nlBOsheeGzv6zUDN8a/22bMmmypgtNmN
         LQgxIAuk1MZ5LBzvNS33oXHFjCUWelyexB+OzMcVhY4u4r121yYoO3aS6XTkOpvux0Bp
         PFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HX9HGMM9OXUH3A01XbvlYQ6k88WIpMHMgX/US8lm3TY=;
        b=PhGIubEeZftaltXF5U/4aRuiYSZfQrSkzm6h8LwTURwGdYpu1EbvxI8puknFM8ITua
         yz1DvZTxKGQGSGxj7s/ikghgycF8w1XSKxhDv+bM5eHblPYio95D72oW48/lZhstt4jg
         ducACXeJZ/O3T0QSfog3XnG02D5aAAs3zc7jSjwSGJejoXVb0Zj7IW15N9HSaciCiOYG
         62tXmDLcuoH5eOGvTU5tg9YBIhqlQc0oJs4HWNujmxl+Ged+xqZwslL7/aq0o1Gfh6IX
         p/yiSTxQckFWZQbNhDzGomMNRAZw4o4X1SuNTajB9J4JtDRwYgVP95BxZHIa8geCTkU2
         khew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NdnwARA1;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id z2si381671ilm.4.2020.04.11.10.25.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 Apr 2020 10:25:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03BHPC6N012356;
	Sat, 11 Apr 2020 12:25:12 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03BHPC9j074966;
	Sat, 11 Apr 2020 12:25:12 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sat, 11
 Apr 2020 12:25:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sat, 11 Apr 2020 12:25:11 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03BHP9Jr103617;
	Sat, 11 Apr 2020 12:25:10 -0500
Subject: Re: [PATCH] arm64: ti-pvu: Panic on errors during config_commit
To: Jan Kiszka <jan.kiszka@web.de>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <f87739b0-2990-1229-4cfc-105c36f4efa5@web.de>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <9528c94f-c351-7ac4-889c-6d422be130ca@ti.com>
Date: Sat, 11 Apr 2020 22:55:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f87739b0-2990-1229-4cfc-105c36f4efa5@web.de>
Content-Type: multipart/alternative;
	boundary="------------058E3E06099CD0E1B2E3C898"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=NdnwARA1;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
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

--------------058E3E06099CD0E1B2E3C898
Content-Type: text/plain; charset="UTF-8"; format=flowed

Hi Jan,

On 11/04/20 4:31 pm, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> So far, any error returned by a function called by
> pvu_iommu_config_commit was ignored, only reported to the console. That
> would have resulted in an inconsistent configuration being run. Also,
> pvu_tlb_alloc and pvu_tlb_chain didn't even report an errors at all, and
> the former also returned an incorrect code then.
This is because I have implemented all the functions with return codes.
I have implemented the pvu_iommu_config_commit with int return type.

 From the design perspective, the pvu_xxx APIs are written from any place.
It's the config_commit call which is nont returnable, So that function 
should panic.

So, the only place for panic should be either in the pvu_iommu_config_commit
Or, in the iommu_config_commit

Regards,
Nikhil D
> We rather need to panic-stop the system in case some configuration bit
> cannot be programmed because there is no way to roll back from a
> config_commit by design.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>
> I wonder if there isn't a way - provided it's not too complex - to build
> up the programming during cell_init/exit, validate it at that chance,
> cache it, and only apply that state on config_commit. Would mean less
> panic.
I gave some thought to create the data structures before config_commit.
But as of now, there is no way that exist.
Following is the sequence of calls

pvu_iommu_map_memory
pvu_iommu_map_memory
..
pvu_iommu_map_memory
pvu_iommu_config_commit

There is nothing that gets called from framework, and there is no way to
figure out if the pvu_iommu_map_memory is the last call

>
> I also wonder when that error pvu_tlb_chain can actually happen, or if
> the check was just defensive programming. Maybe you also have a better
> error text for it.
Yes, its defensive programming, done as part of making the pvu_xx APIs
primitive calls.
>
>   hypervisor/arch/arm64/include/asm/ti-pvu.h |  2 +-
>   hypervisor/arch/arm64/ti-pvu.c             | 65 +++++++++++++-----------------
>   2 files changed, 30 insertions(+), 37 deletions(-)
>
> diff --git a/hypervisor/arch/arm64/include/asm/ti-pvu.h b/hypervisor/arch/arm64/include/asm/ti-pvu.h
> index 2c340b3a..466b5b3f 100644
> --- a/hypervisor/arch/arm64/include/asm/ti-pvu.h
> +++ b/hypervisor/arch/arm64/include/asm/ti-pvu.h
> @@ -125,6 +125,6 @@ int pvu_iommu_map_memory(struct cell *cell,
>   int pvu_iommu_unmap_memory(struct cell *cell,
>   		const struct jailhouse_memory *mem);
>
> -int pvu_iommu_config_commit(struct cell *cell);
> +void pvu_iommu_config_commit(struct cell *cell_added_removed);
>
>   #endif /* _IOMMMU_PVU_H_ */
> diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
> index b06ba843..91d39848 100644
> --- a/hypervisor/arch/arm64/ti-pvu.c
> +++ b/hypervisor/arch/arm64/ti-pvu.c
> @@ -15,7 +15,7 @@
>    * There are limitations on the number of available contexts, page sizes,
>    * number of pages that can be mapped, etc.
>    *
> - * PVU is desgined to be programmed with all the memory mapping at once.
> + * PVU is designed to be programmed with all the memory mapping at once.
>    * Therefore, it defers the actual register programming till config_commit.
>    * Also, it does not support unmapping of the pages at runtime.
>    *
> @@ -83,16 +83,18 @@ static u32 pvu_tlb_is_enabled(struct pvu_dev *dev, u16 tlbnum)
>   		return 0;
>   }
>
> -static int pvu_tlb_chain(struct pvu_dev *dev, u16 tlbnum, u16 tlb_next)
> +static void pvu_tlb_chain(struct pvu_dev *dev, u16 tlbnum, u16 tlb_next)
>   {
>   	struct pvu_hw_tlb *tlb;
>
> -	if (tlb_next <= tlbnum || tlb_next <= dev->max_virtid)
> -		return -EINVAL;
> +	if (tlb_next <= tlbnum || tlb_next <= dev->max_virtid) {
> +		panic_printk("ERROR: PVU: Invalid TLB index %d for chaining\n",
> +			     tlb_next);
> +		panic_stop();
> +	}
>
>   	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
>   	mmio_write32_field(&tlb->chain, PVU_TLB_CHAIN_MASK, tlb_next);
> -	return 0;
>   }
>
>   static u32 pvu_tlb_next(struct pvu_dev *dev, u16 tlbnum)
> @@ -113,7 +115,8 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
>   			return i;
>   		}
>   	}
> -	return 0;
> +	panic_printk("ERROR: PVU: Not enough TLB entries\n");
> +	panic_stop();
>   }
>
>   static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
> @@ -159,8 +162,8 @@ static void pvu_entry_enable(struct pvu_dev *dev, u16 tlbnum, u8 index)
>   	dev->tlb_data[tlbnum] |= (1 << index);
>   }
>
> -static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
> -			   struct pvu_tlb_entry *ent)
> +static void pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
> +			    struct pvu_tlb_entry *ent)
>   {
>   	struct pvu_hw_tlb_entry *entry;
>   	struct pvu_hw_tlb *tlb;
> @@ -175,16 +178,16 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>   	}
>
>   	if (pgsz >= ARRAY_SIZE(pvu_page_size_bytes)) {
> -		printk("ERROR: PVU: %s: Unsupported page size %llx\n",
> -			__func__, ent->size);
> -		return -EINVAL;
> +		panic_printk("ERROR: PVU: Unsupported page size %llx\n",
> +			     ent->size);
> +		panic_stop();
>   	}
>
>   	if (!is_aligned(ent->virt_addr, ent->size) ||
>   	    !is_aligned(ent->phys_addr, ent->size)) {
> -		printk("ERROR: PVU: %s: Address %llx => %llx is not aligned with size %llx\n",
> -			__func__, ent->virt_addr, ent->phys_addr, ent->size);
> -		return -EINVAL;
> +		panic_printk("ERROR: PVU: Address %llx => %llx is not aligned with size %llx\n",
> +			     ent->virt_addr, ent->phys_addr, ent->size);
> +		panic_stop();
>   	}
>
>   	mmio_write32(&entry->reg0, ent->virt_addr & 0xffffffff);
> @@ -200,7 +203,6 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>
>   	/* Do we need "DSB NSH" here to make sure all writes are finised? */
>   	pvu_entry_enable(dev, tlbnum, index);
> -	return 0;
>   }
>
>   static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
> @@ -328,17 +330,17 @@ static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
>   	}
>   }
>
> -static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
> +static void pvu_iommu_program_entries(struct cell *cell, u8 virtid)
>   {
>   	unsigned int inst, i, tlbnum, idx, ent_count;
>   	struct pvu_tlb_entry *ent, *cell_entries;
>   	struct pvu_dev *dev;
> -	int ret, tlb_next;
> +	int tlb_next;
>
>   	cell_entries = cell->arch.iommu_pvu.entries;
>   	ent_count = cell->arch.iommu_pvu.ent_count;
>   	if (ent_count == 0 || cell_entries == NULL)
> -		return 0;
> +		return;
>
>   	/* Program same memory mapping for all of the instances */
>   	for (inst = 0; inst < pvu_count; inst++) {
> @@ -356,20 +358,15 @@ static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
>   			if (idx == 0 && i >= dev->num_entries) {
>   				/* Find next available TLB and chain to it */
>   				tlb_next = pvu_tlb_alloc(dev, virtid);
> -				if (tlb_next < 0)
> -					return -ENOMEM;
>   				pvu_tlb_chain(dev, tlbnum, tlb_next);
>   				pvu_tlb_enable(dev, tlbnum);
>   				tlbnum = tlb_next;
>   			}
>
> -			ret = pvu_entry_write(dev, tlbnum, idx, ent);
> -			if (ret)
> -				return ret;
> +			pvu_entry_write(dev, tlbnum, idx, ent);
>   		}
>   		pvu_tlb_enable(dev, tlbnum);
>   	}
> -	return 0;
>   }
>
>   /*
> @@ -434,13 +431,12 @@ int pvu_iommu_unmap_memory(struct cell *cell,
>   	return 0;
>   }
>
> -int pvu_iommu_config_commit(struct cell *cell)
> +void pvu_iommu_config_commit(struct cell *cell_added_removed)
>   {
>   	unsigned int i, virtid;
> -	int ret = 0;
>
> -	if (pvu_count == 0 || !cell)
> -		return 0;
> +	if (pvu_count == 0 || !cell_added_removed)
> +		return;
>
>   	/*
>   	 * Chaining the TLB entries adds extra latency to translate those
> @@ -448,20 +444,17 @@ int pvu_iommu_config_commit(struct cell *cell)
>   	 * Sort the entries in descending order of page sizes to reduce effects
>   	 * of chaining and thus reducing average translation latency
>   	 */
> -	pvu_entrylist_sort(cell->arch.iommu_pvu.entries,
> -			   cell->arch.iommu_pvu.ent_count);
> +	pvu_entrylist_sort(cell_added_removed->arch.iommu_pvu.entries,
> +			   cell_added_removed->arch.iommu_pvu.ent_count);
>
> -	for_each_stream_id(virtid, cell->config, i) {
> +	for_each_stream_id(virtid, cell_added_removed->config, i) {
>   		if (virtid > MAX_VIRTID)
>   			continue;
>
> -		ret = pvu_iommu_program_entries(cell, virtid);
> -		if (ret)
> -			return ret;
> +		pvu_iommu_program_entries(cell_added_removed, virtid);
panic here instead of other places
>   	}
>
> -	cell->arch.iommu_pvu.ent_count = 0;
> -	return ret;
> +	cell_added_removed->arch.iommu_pvu.ent_count = 0;
>   }
>
>   static int pvu_iommu_cell_init(struct cell *cell)
> --
> 2.16.4
>
Regards,
Nikhil D

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9528c94f-c351-7ac4-889c-6d422be130ca%40ti.com.

--------------058E3E06099CD0E1B2E3C898
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <font face=3D"Verdana">Hi Jan,</font><br>
    <br>
    <div class=3D"moz-cite-prefix">On 11/04/20 4:31 pm, Jan Kiszka wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:f87739b0-2990-1229-4cfc-105c36f4efa5@web.de">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Jan Kiszka <a class=3D"m=
oz-txt-link-rfc2396E" href=3D"mailto:jan.kiszka@siemens.com">&lt;jan.kiszka=
@siemens.com&gt;</a>

So far, any error returned by a function called by
pvu_iommu_config_commit was ignored, only reported to the console. That
would have resulted in an inconsistent configuration being run. Also,
pvu_tlb_alloc and pvu_tlb_chain didn't even report an errors at all, and
the former also returned an incorrect code then.
</pre>
    </blockquote>
    This is because I have implemented all the functions with return
    codes.<br>
    I have implemented the pvu_iommu_config_commit with int return type.<br=
>
    <br>
    From the design perspective, the pvu_xxx APIs are written from any
    place.<br>
    It's the config_commit call which is nont returnable, So that
    function should panic.<br>
    <br>
    So, the only place for panic should be either in the
    pvu_iommu_config_commit<br>
    Or, in the iommu_config_commit<br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <blockquote type=3D"cite"
      cite=3D"mid:f87739b0-2990-1229-4cfc-105c36f4efa5@web.de">
      <pre class=3D"moz-quote-pre" wrap=3D"">We rather need to panic-stop t=
he system in case some configuration bit
cannot be programmed because there is no way to roll back from a
config_commit by design.

Signed-off-by: Jan Kiszka <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:jan.kiszka@siemens.com">&lt;jan.kiszka@siemens.com&gt;</a>
---

I wonder if there isn't a way - provided it's not too complex - to build
up the programming during cell_init/exit, validate it at that chance,
cache it, and only apply that state on config_commit. Would mean less
panic.</pre>
    </blockquote>
    I gave some thought to create the data structures before
    config_commit.<br>
    But as of now, there is no way that exist.<br>
    Following is the sequence of calls<br>
    <br>
    pvu_iommu_map_memory<br>
    pvu_iommu_map_memory<br>
    ..<br>
    pvu_iommu_map_memory<br>
    pvu_iommu_config_commit<br>
    <br>
    There is nothing that gets called from framework, and there is no
    way to<br>
    figure out if the pvu_iommu_map_memory is the last call <br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:f87739b0-2990-1229-4cfc-105c36f4efa5@web.de">
      <pre class=3D"moz-quote-pre" wrap=3D"">

I also wonder when that error pvu_tlb_chain can actually happen, or if
the check was just defensive programming. Maybe you also have a better
error text for it.</pre>
    </blockquote>
    Yes, its defensive programming, done as part of making the pvu_xx
    APIs<br>
    primitive calls.<br>
    <blockquote type=3D"cite"
      cite=3D"mid:f87739b0-2990-1229-4cfc-105c36f4efa5@web.de">
      <pre class=3D"moz-quote-pre" wrap=3D"">

 hypervisor/arch/arm64/include/asm/ti-pvu.h |  2 +-
 hypervisor/arch/arm64/ti-pvu.c             | 65 +++++++++++++-------------=
----
 2 files changed, 30 insertions(+), 37 deletions(-)

diff --git a/hypervisor/arch/arm64/include/asm/ti-pvu.h b/hypervisor/arch/a=
rm64/include/asm/ti-pvu.h
index 2c340b3a..466b5b3f 100644
--- a/hypervisor/arch/arm64/include/asm/ti-pvu.h
+++ b/hypervisor/arch/arm64/include/asm/ti-pvu.h
@@ -125,6 +125,6 @@ int pvu_iommu_map_memory(struct cell *cell,
 int pvu_iommu_unmap_memory(struct cell *cell,
 		const struct jailhouse_memory *mem);

-int pvu_iommu_config_commit(struct cell *cell);
+void pvu_iommu_config_commit(struct cell *cell_added_removed);

 #endif /* _IOMMMU_PVU_H_ */
diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.=
c
index b06ba843..91d39848 100644
--- a/hypervisor/arch/arm64/ti-pvu.c
+++ b/hypervisor/arch/arm64/ti-pvu.c
@@ -15,7 +15,7 @@
  * There are limitations on the number of available contexts, page sizes,
  * number of pages that can be mapped, etc.
  *
- * PVU is desgined to be programmed with all the memory mapping at once.
+ * PVU is designed to be programmed with all the memory mapping at once.
  * Therefore, it defers the actual register programming till config_commit=
.
  * Also, it does not support unmapping of the pages at runtime.
  *
@@ -83,16 +83,18 @@ static u32 pvu_tlb_is_enabled(struct pvu_dev *dev, u16 =
tlbnum)
 		return 0;
 }

-static int pvu_tlb_chain(struct pvu_dev *dev, u16 tlbnum, u16 tlb_next)
+static void pvu_tlb_chain(struct pvu_dev *dev, u16 tlbnum, u16 tlb_next)
 {
 	struct pvu_hw_tlb *tlb;

-	if (tlb_next &lt;=3D tlbnum || tlb_next &lt;=3D dev-&gt;max_virtid)
-		return -EINVAL;
+	if (tlb_next &lt;=3D tlbnum || tlb_next &lt;=3D dev-&gt;max_virtid) {
+		panic_printk("ERROR: PVU: Invalid TLB index %d for chaining\n",
+			     tlb_next);
+		panic_stop();
+	}

 	tlb =3D (struct pvu_hw_tlb *)dev-&gt;tlb_base + tlbnum;
 	mmio_write32_field(&amp;tlb-&gt;chain, PVU_TLB_CHAIN_MASK, tlb_next);
-	return 0;
 }

 static u32 pvu_tlb_next(struct pvu_dev *dev, u16 tlbnum)
@@ -113,7 +115,8 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virti=
d)
 			return i;
 		}
 	}
-	return 0;
+	panic_printk("ERROR: PVU: Not enough TLB entries\n");
+	panic_stop();
 }

 static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
@@ -159,8 +162,8 @@ static void pvu_entry_enable(struct pvu_dev *dev, u16 t=
lbnum, u8 index)
 	dev-&gt;tlb_data[tlbnum] |=3D (1 &lt;&lt; index);
 }

-static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
-			   struct pvu_tlb_entry *ent)
+static void pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
+			    struct pvu_tlb_entry *ent)
 {
 	struct pvu_hw_tlb_entry *entry;
 	struct pvu_hw_tlb *tlb;
@@ -175,16 +178,16 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 t=
lbnum, u8 index,
 	}

 	if (pgsz &gt;=3D ARRAY_SIZE(pvu_page_size_bytes)) {
-		printk("ERROR: PVU: %s: Unsupported page size %llx\n",
-			__func__, ent-&gt;size);
-		return -EINVAL;
+		panic_printk("ERROR: PVU: Unsupported page size %llx\n",
+			     ent-&gt;size);
+		panic_stop();
 	}

 	if (!is_aligned(ent-&gt;virt_addr, ent-&gt;size) ||
 	    !is_aligned(ent-&gt;phys_addr, ent-&gt;size)) {
-		printk("ERROR: PVU: %s: Address %llx =3D&gt; %llx is not aligned with si=
ze %llx\n",
-			__func__, ent-&gt;virt_addr, ent-&gt;phys_addr, ent-&gt;size);
-		return -EINVAL;
+		panic_printk("ERROR: PVU: Address %llx =3D&gt; %llx is not aligned with =
size %llx\n",
+			     ent-&gt;virt_addr, ent-&gt;phys_addr, ent-&gt;size);
+		panic_stop();
 	}

 	mmio_write32(&amp;entry-&gt;reg0, ent-&gt;virt_addr &amp; 0xffffffff);
@@ -200,7 +203,6 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlb=
num, u8 index,

 	/* Do we need "DSB NSH" here to make sure all writes are finised? */
 	pvu_entry_enable(dev, tlbnum, index);
-	return 0;
 }

 static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
@@ -328,17 +330,17 @@ static void pvu_entrylist_sort(struct pvu_tlb_entry *=
entlist, u32 num_entries)
 	}
 }

-static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
+static void pvu_iommu_program_entries(struct cell *cell, u8 virtid)
 {
 	unsigned int inst, i, tlbnum, idx, ent_count;
 	struct pvu_tlb_entry *ent, *cell_entries;
 	struct pvu_dev *dev;
-	int ret, tlb_next;
+	int tlb_next;

 	cell_entries =3D cell-&gt;arch.iommu_pvu.entries;
 	ent_count =3D cell-&gt;arch.iommu_pvu.ent_count;
 	if (ent_count =3D=3D 0 || cell_entries =3D=3D NULL)
-		return 0;
+		return;

 	/* Program same memory mapping for all of the instances */
 	for (inst =3D 0; inst &lt; pvu_count; inst++) {
@@ -356,20 +358,15 @@ static int pvu_iommu_program_entries(struct cell *cel=
l, u8 virtid)
 			if (idx =3D=3D 0 &amp;&amp; i &gt;=3D dev-&gt;num_entries) {
 				/* Find next available TLB and chain to it */
 				tlb_next =3D pvu_tlb_alloc(dev, virtid);
-				if (tlb_next &lt; 0)
-					return -ENOMEM;
 				pvu_tlb_chain(dev, tlbnum, tlb_next);
 				pvu_tlb_enable(dev, tlbnum);
 				tlbnum =3D tlb_next;
 			}

-			ret =3D pvu_entry_write(dev, tlbnum, idx, ent);
-			if (ret)
-				return ret;
+			pvu_entry_write(dev, tlbnum, idx, ent);
 		}
 		pvu_tlb_enable(dev, tlbnum);
 	}
-	return 0;
 }

 /*
@@ -434,13 +431,12 @@ int pvu_iommu_unmap_memory(struct cell *cell,
 	return 0;
 }

-int pvu_iommu_config_commit(struct cell *cell)
+void pvu_iommu_config_commit(struct cell *cell_added_removed)
 {
 	unsigned int i, virtid;
-	int ret =3D 0;

-	if (pvu_count =3D=3D 0 || !cell)
-		return 0;
+	if (pvu_count =3D=3D 0 || !cell_added_removed)
+		return;

 	/*
 	 * Chaining the TLB entries adds extra latency to translate those
@@ -448,20 +444,17 @@ int pvu_iommu_config_commit(struct cell *cell)
 	 * Sort the entries in descending order of page sizes to reduce effects
 	 * of chaining and thus reducing average translation latency
 	 */
-	pvu_entrylist_sort(cell-&gt;arch.iommu_pvu.entries,
-			   cell-&gt;arch.iommu_pvu.ent_count);
+	pvu_entrylist_sort(cell_added_removed-&gt;arch.iommu_pvu.entries,
+			   cell_added_removed-&gt;arch.iommu_pvu.ent_count);

-	for_each_stream_id(virtid, cell-&gt;config, i) {
+	for_each_stream_id(virtid, cell_added_removed-&gt;config, i) {
 		if (virtid &gt; MAX_VIRTID)
 			continue;

-		ret =3D pvu_iommu_program_entries(cell, virtid);
-		if (ret)
-			return ret;
+		pvu_iommu_program_entries(cell_added_removed, virtid);</pre>
    </blockquote>
    panic here instead of other places<br>
    <blockquote type=3D"cite"
      cite=3D"mid:f87739b0-2990-1229-4cfc-105c36f4efa5@web.de">
      <pre class=3D"moz-quote-pre" wrap=3D"">
 	}

-	cell-&gt;arch.iommu_pvu.ent_count =3D 0;
-	return ret;
+	cell_added_removed-&gt;arch.iommu_pvu.ent_count =3D 0;
 }

 static int pvu_iommu_cell_init(struct cell *cell)
--
2.16.4

</pre>
    </blockquote>
    Regards,<br>
    Nikhil D<br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/9528c94f-c351-7ac4-889c-6d422be130ca%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/9528c94f-c351-7ac4-889c-6d422be130ca%40ti.com</a>.<br />

--------------058E3E06099CD0E1B2E3C898--
