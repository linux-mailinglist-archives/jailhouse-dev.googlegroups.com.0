Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBHFX4H6AKGQERBJRTXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ABC29C2C0
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 18:40:45 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id z7sf837238wme.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 10:40:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603820444; cv=pass;
        d=google.com; s=arc-20160816;
        b=VZo/lzuuvZOIrj2Sldfe1TmdgddqKly2p/ml7HI5xT8+KaZWo6+YnUlxs92hwz3Hy3
         vaAcQnWwTKGOnGb36ubDsTpLSL6hw9QqMKrqP7VshPdePEdkvEmB35m9o4u0tFBNtkpv
         ShHgwT3U4nt02Lp7J6lQAhMklThuOnA5HkvswuJK7OrtLamtIez8kb5ON9qRHPKPihd/
         zUVyGW9dTzk2yKInPTgRCO56K+sz70fwnUd+39snOmH96V9v9vFb08glJeYh/We3SiDB
         dGxP/7ynM4bGSRbhte0tRXLv/UzT5Hu9JIZ+vGHs2eJhyOve9PFboq5ftx2kC1oR2EkM
         OjiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=ej2j/nLbHfUgGgj1urI2je78KUcxw6BhEzQ6UjgDPTY=;
        b=Ew38sppQeomv0e9k+gbj0qr7wmfH7cVAofN09GoA0wqTvGlYQlwPzbNH60wM7yNziF
         YIDsShYRYoi/1gZi6PeotXjGHTQA/hA6iVPDnfzv9KHiY/6f1t3BnKnxtlsPOemDj0jg
         XwsO4Cu1rmZ4VrhSgdHyKMsVms4DDV+TslsLCBqYp4c6S0k0jhzbbnmunnIaw8IF4dsw
         vGYaa/zcoh2QNBwRfCHVK+XEWe0hMFZLUPvCReDSm4rFBeu7QUcRLKMWtTtxl/5FALfN
         ElTTAkHmGwnZzTvLK4Ux7d+qcWxR3UgNIIV4qnc3y7ijkvLUCPfDaRxmMUViXVT1LCpN
         gDVw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=WYsF5Cof;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ej2j/nLbHfUgGgj1urI2je78KUcxw6BhEzQ6UjgDPTY=;
        b=gbMmA33VgCjlcWtkDrzjsKZ6VGXpd3lewI9/9ix8X4GE9EKv812h+Wi4MDVsLIgnpm
         lbBsi7HrheuOkWgnwfT1V9w0OikPU5lFTtKHHBBrcxpfyfNF/sJdVfDQBMyFzP7GX9YZ
         FeLmhUspEUB0IXAdv5K8FgyQ3Ui+L0A8/WaX4chQoMIC9qZztkkIKhItAVVqpnF0MdVH
         zzE77rz/3ShqNnMjwaQTmu2Kz/IrBbngS94WuTer+fGFgpEPWOXe0wtt11YSHFFbPH3G
         sGAoVVs9txz6XncLP6tt6QAU/97hzoJ4mlITt0EdgekECP+Ou0vrLN77dx3DiRQ2JZOW
         KDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ej2j/nLbHfUgGgj1urI2je78KUcxw6BhEzQ6UjgDPTY=;
        b=hwbxwKDJ9gdR58K6YHRehb9X7GE4eNwgfpg2QgNr+mPF7Qb3wiecca7UzeXDZrIv0R
         /L499twG9e97wSXOu9GONJTyW2UurQG119aDg9Ffrucgbh8CNrO+nMeHwGy3wif0R6Sq
         woGl4oAHCfucveMWjYmsFrbaiCTTiJiQ92IdSbBF4TfN2+jm7oFk4wjp/F4hJ5G/cc3k
         3Hth+IBjmPgRFdH38YUXs1LnUEXzrkDsrkTa4u0xghj4XeJgc+QbYyoBv2G47//m8lm6
         dXpvsu7tuQxig94TLMwBS28fzkzStsUMoqiicWBkHudv08t8QGqFqUUkMUo6l9ld6hiY
         /WRw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531zKkudkXcQkND/smyKAA50eyZ+iInjew2by6A0RcYNCwLinxyD
	4H/Wxf9gUXpYpEON9v2oUsM=
X-Google-Smtp-Source: ABdhPJwM+UkOl76t3fRuw4GpdSp9ll/P/381UKpUI50rmws+osD4zRXYLOJWW1DmQHWNt7YFJ+rmYg==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr2554134wmj.72.1603820444832;
        Tue, 27 Oct 2020 10:40:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4ac3:: with SMTP id y3ls450740wrs.2.gmail; Tue, 27 Oct
 2020 10:40:43 -0700 (PDT)
X-Received: by 2002:a5d:40cb:: with SMTP id b11mr4418950wrq.254.1603820443858;
        Tue, 27 Oct 2020 10:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603820443; cv=none;
        d=google.com; s=arc-20160816;
        b=WzoFPmqgYiWu1KGyHj8yRET4UkDqQ3wZypdhOgbGGNo8okbKB1SVLYOpQskghJQfLL
         0WRPrb9r70tMCN+rVcV6eABLiFCIokbRmA8Tbsx58d+b6O84QLjfREA3CATxjtSH1xiV
         hQ8VzxsMwpnNwDE8X9njTgGfumKEf1tGxOCnE4vvXfrx0LXqwkfyaWAbHGmR/hvk5n8R
         /ODfvsIYVqx3+nkMiJW8l+ylNOjsNuxQiZlXPCh854M678u92qT6b/p5Guyp+OAKA4yx
         8M9SsEUZBayXcFUBa1t6sYw3xCVC3R5peR03xXIN0qcqaeWJcXFDR8fUiKmGXuV+SSf1
         Rx3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=K2a7WjjqqxKMvUfFpBHSNErYSvWlD+R0b1P6rG7cKRg=;
        b=sAyxPz3KzwI/dgwT3c/ToXTZp34eN5mqSol5NFm1n8Mai2/tfxbcJz8briBsHxYwt2
         LNuqLOx8+OHHrykx+09mulM9h1skKoBX6T1PdmI5FfOpvRNx8BJJzJJp9eZEntRdakTl
         zSzks/2wIXiBDmdLsaXlZ+Y/pIHKsJ6PZrnvSuZl4EtuI0QPi3TE2cOvctD0O0BKgeRe
         vM2fxRCAZn3KddpMWe64CK2aar+kXeLysarV//u3Fxe2ZhCvAGDQMKfducKW6RouYbYU
         jsMAcAOobQpP+Us21TS7K8C++xECGnSfHEq7hxf12ojtvjdK6jBHlUqHUQ0Rdzqtz1rt
         cYGQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=WYsF5Cof;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id 16si69496wmi.3.2020.10.27.10.40.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 10:40:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4CLJrq33bwzyBv;
	Tue, 27 Oct 2020 18:40:43 +0100 (CET)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 27 Oct
 2020 18:40:43 +0100
Subject: Re: [PATCH] arm64: pvu: Avoid failure in config_commit
To: Jan Kiszka <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
	<jailhouse-dev@googlegroups.com>
References: <20201026195257.14398-1-nikhil.nd@ti.com>
 <a282f746-9eb7-eb5e-7c45-a45e795a74c3@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <81494b8f-5a61-ada0-a534-741f087ef191@oth-regensburg.de>
Date: Tue, 27 Oct 2020 18:40:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a282f746-9eb7-eb5e-7c45-a45e795a74c3@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=WYsF5Cof;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 27/10/2020 18:33, Jan Kiszka wrote:
> On 26.10.20 20:52, 'Nikhil Devshatwar' via Jailhouse wrote:
>> Current PVU iommu implementation ignores possible failures in the
>> config_commit part. This would allow inconsistent configuration
>> to run and may introduce unknown bugs.
>>
>> Solve this by making sure that the pvu_iommu_config_commit never
>> fails. Catch the errors early in the mapping phase. Use
>> "free_tlb_count" to track available no of TLBs for chaining.
>> This can be used to check if any mapping causes it to potentially
>> use more no of TLBs than that are free. This will ensure that
>> the allocationg for chaining will not fail.
>>
>> Change the return type to void and remove the error handling in
>> the config_commit path.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>  hypervisor/arch/arm64/include/asm/ti-pvu.h |  3 +-
>>  hypervisor/arch/arm64/ti-pvu.c             | 54 +++++++++++++---------
>>  2 files changed, 34 insertions(+), 23 deletions(-)
>>
>> diff --git a/hypervisor/arch/arm64/include/asm/ti-pvu.h b/hypervisor/arch/arm64/include/asm/ti-pvu.h
>> index 2c340b3a..62aec7c0 100644
>> --- a/hypervisor/arch/arm64/include/asm/ti-pvu.h
>> +++ b/hypervisor/arch/arm64/include/asm/ti-pvu.h
>> @@ -117,6 +117,7 @@ struct pvu_dev {
>>  	u16		max_virtid;
>>  
>>  	u16		tlb_data[PVU_NUM_TLBS];
>> +	u16		free_tlb_count;
>>  };
>>  
>>  int pvu_iommu_map_memory(struct cell *cell,
>> @@ -125,6 +126,6 @@ int pvu_iommu_map_memory(struct cell *cell,
>>  int pvu_iommu_unmap_memory(struct cell *cell,
>>  		const struct jailhouse_memory *mem);
>>  
>> -int pvu_iommu_config_commit(struct cell *cell);
>> +void pvu_iommu_config_commit(struct cell *cell);
>>  
>>  #endif /* _IOMMMU_PVU_H_ */
>> diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
>> index 3b9a29ec..d96d01c9 100644
>> --- a/hypervisor/arch/arm64/ti-pvu.c
>> +++ b/hypervisor/arch/arm64/ti-pvu.c
>> @@ -15,7 +15,7 @@
>>   * There are limitations on the number of available contexts, page sizes,
>>   * number of pages that can be mapped, etc.
>>   *
>> - * PVU is desgined to be programmed with all the memory mapping at once.
>> + * PVU is designed to be programmed with all the memory mapping at once.
>>   * Therefore, it defers the actual register programming till config_commit.
>>   * Also, it does not support unmapping of the pages at runtime.
>>   *
>> @@ -110,6 +110,7 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
>>  	for (i = dev->max_virtid + 1; i < dev->num_tlbs; i++) {
>>  		if (dev->tlb_data[i] == 0) {
>>  			dev->tlb_data[i] = virtid << dev->num_entries;
>> +			dev->free_tlb_count--;
>>  			return i;
>>  		}
>>  	}
> 	return 0;
> 
> So we will never get here and never return 0? What prevents that is in
> pvu_iommu_map_memory, right? Should be explained.
> 
> And maybe we should actually introduce a BUG() macro to crash
> intentionally when reaching impossible states. Or we simply do
> 
> while (dev->tlb_data[i] != 0)
> 	i++;
> 
> explaining why this loop is always finishing.

If it's about to keep the compiler silent, then a
__builtin_unreachable() does both: give a hint in code that there's no
way to reach that point, and keep the no return value warning silent.

  Ralf

> 
>> @@ -138,10 +139,13 @@ static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
>>  
>>  	mmio_write32(&tlb->chain, 0x0);
>>  
>> -	if (i < dev->max_virtid)
>> +	if (i < dev->max_virtid) {
>>  		dev->tlb_data[tlbnum] = 0x0 | i << dev->num_entries;
>> -	else
>> +	} else {
>> +		/* This was a chained TLB */
>>  		dev->tlb_data[tlbnum] = 0x0;
>> +		dev->free_tlb_count++;
>> +	}
>>  
>>  }
>>  
>> @@ -198,7 +202,7 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>>  	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_PGSIZE_MASK, pgsz);
>>  	mmio_write32_field(&entry->reg2, PVU_TLB_ENTRY_FLAG_MASK, ent->flags);
>>  
>> -	/* Do we need "DSB NSH" here to make sure all writes are finised? */
>> +	/* Do we need "DSB NSH" here to make sure all writes are finished? */
>>  	pvu_entry_enable(dev, tlbnum, index);
>>  	return 0;
>>  }
>> @@ -221,6 +225,8 @@ static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
>>  	}
>>  
>>  	dev->max_virtid = max_virtid;
>> +	dev->free_tlb_count = dev->num_tlbs - (max_virtid + 1);
>> +
>>  	mmio_write32(&cfg->virtid_map1, 0);
>>  	mmio_write32_field(&cfg->virtid_map2, PVU_MAX_VIRTID_MASK, max_virtid);
>>  
>> @@ -328,17 +334,17 @@ static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
>>  	}
>>  }
>>  
>> -static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
>> +static void pvu_iommu_program_entries(struct cell *cell, u8 virtid)
>>  {
>>  	unsigned int inst, i, tlbnum, idx, ent_count;
>>  	struct pvu_tlb_entry *ent, *cell_entries;
>>  	struct pvu_dev *dev;
>> -	int ret, tlb_next;
>> +	int tlb_next;
>>  
>>  	cell_entries = cell->arch.iommu_pvu.entries;
>>  	ent_count = cell->arch.iommu_pvu.ent_count;
>>  	if (ent_count == 0 || cell_entries == NULL)
>> -		return 0;
>> +		return;
>>  
>>  	/* Program same memory mapping for all of the instances */
>>  	for (inst = 0; inst < pvu_count; inst++) {
>> @@ -356,20 +362,15 @@ static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
>>  			if (idx == 0 && i >= dev->num_entries) {
>>  				/* Find next available TLB and chain to it */
>>  				tlb_next = pvu_tlb_alloc(dev, virtid);
>> -				if (tlb_next < 0)
>> -					return -ENOMEM;
>>  				pvu_tlb_chain(dev, tlbnum, tlb_next);
>>  				pvu_tlb_enable(dev, tlbnum);
>>  				tlbnum = tlb_next;
>>  			}
>>  
>> -			ret = pvu_entry_write(dev, tlbnum, idx, ent);
>> -			if (ret)
>> -				return ret;
>> +			pvu_entry_write(dev, tlbnum, idx, ent);
> 
> But what if pvu_entry_write finds an issue? Are we fine with reporting
> only and then simply continueing?
> 
> Please clearify that in-place, i.e. via comments in pvu_entry_write(),
> and remove ignored return values.
> 
>>  		}
>>  		pvu_tlb_enable(dev, tlbnum);
>>  	}
>> -	return 0;
>>  }
>>  
>>  /*
>> @@ -380,8 +381,9 @@ int pvu_iommu_map_memory(struct cell *cell,
>>  			 const struct jailhouse_memory *mem)
>>  {
>>  	struct pvu_tlb_entry *ent;
>> +	struct pvu_dev *dev;
>>  	unsigned int size;
>> -	u32 flags = 0;
>> +	u32 tlb_count, flags = 0;
>>  	int ret;
>>  
>>  	if (pvu_count == 0 || (mem->flags & JAILHOUSE_MEM_DMA) == 0)
>> @@ -408,7 +410,19 @@ int pvu_iommu_map_memory(struct cell *cell,
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	cell->arch.iommu_pvu.ent_count += ret;
>> +	/*
>> +	 * Check if there are enough TLBs left for *chaining* to ensure that
>> +	 * pvu_tlb_alloc called from config_commit never fails
>> +	 */
>> +	tlb_count = (cell->arch.iommu_pvu.ent_count + ret - 1) / 8;
>> +	dev = &pvu_units[0];
>> +
>> +	if (tlb_count > dev->free_tlb_count) {
>> +		printk("ERROR: PVU: Mapping this memory needs more TLBs than that are available\n");
>> +		return -EINVAL;
>> +	} else {
> 
> No need for "else" here.
> 
>> +		cell->arch.iommu_pvu.ent_count += ret;
>> +	}
>>  	return 0;
>>  }
>>  
>> @@ -434,13 +448,12 @@ int pvu_iommu_unmap_memory(struct cell *cell,
>>  	return 0;
>>  }
>>  
>> -int pvu_iommu_config_commit(struct cell *cell)
>> +void pvu_iommu_config_commit(struct cell *cell)
>>  {
>>  	unsigned int i, virtid;
>> -	int ret = 0;
>>  
>>  	if (pvu_count == 0 || !cell)
>> -		return 0;
>> +		return;
>>  
>>  	/*
>>  	 * Chaining the TLB entries adds extra latency to translate those
>> @@ -455,13 +468,10 @@ int pvu_iommu_config_commit(struct cell *cell)
>>  		if (virtid > MAX_VIRTID)
>>  			continue;
>>  
>> -		ret = pvu_iommu_program_entries(cell, virtid);
>> -		if (ret)
>> -			return ret;
>> +		pvu_iommu_program_entries(cell, virtid);
>>  	}
>>  
>>  	cell->arch.iommu_pvu.ent_count = 0;
>> -	return ret;
>>  }
>>  
>>  static int pvu_iommu_cell_init(struct cell *cell)
>>
> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/81494b8f-5a61-ada0-a534-741f087ef191%40oth-regensburg.de.
