Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNPN5H6AKGQEI7ZTZHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A8729E599
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 09:00:54 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id f11sf922424wro.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 01:00:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603958454; cv=pass;
        d=google.com; s=arc-20160816;
        b=xsDAu3/IdAbuaNUNo5xaOMTm7dvp48POkn8f2TPsXaeqvQG8vbKVaoc0OlXv5V62nN
         XOE6tOwsqd/sbPUcMBSQTMNIwTKJq35DM7l2Ybx7nWzXhyqSwMRDdt8Ym6d3lHpeXbbA
         c+SzhvuE/S36jHe8RCOKKrNP1jRMv8GPdznuxX2koWexBicDBwPn5bILwBaisaHgFPSe
         tmKyrndSY3w8SQUkJzZeRvKyZPLd1JKo9eKJSANOPFgRABO6QhWQGJT4k4vvZ3c0DGyN
         yLvrFAsJUMlEy0BLCXSMgj4aySYuzeanGixT6yXR0Mxt5UCzl+gPxaLPD9sDzLzjP+ej
         cESw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=h8xDe6zlFlgYrxol2NjR1dqNs12EoIJqc92RaoRiQVE=;
        b=r0AsTye0Z96x8IoRyCFdwCJ1ZhkvJk2O+8q47AL9wBY75/qpQqdNwJsANYp3SbrYPF
         N0qrMO1TXYku3UYJDtONlrTC3+YohyCzdfsFNLXoU5/eqZgfeVht74vBKGiop0J+ykcJ
         /lh12IpnYjHmu4BvPra1RT+H7aVNVwlBOaQEeOGD6UqheNcy2e1HYV/GublKb3SigdH1
         6s1LKH6N83B3JDBFkThKHypHEgIhfAbAYBB9aYGnzyBDta9SThDoObG/9s51ivCn+vQX
         Cygya21ObkadyxlvuXIn9cTxMNe5fsvROass+NRUWDszAFN39GET6GDOtIA/vTcx0gxi
         SB8Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=h8xDe6zlFlgYrxol2NjR1dqNs12EoIJqc92RaoRiQVE=;
        b=Df7+5eBnqnDlrg1mQgOLzSpSxxeWxCPeiBSpLOa0MmpqEBEaI8XFrCpVecADBpzBJD
         oW864aVwGpIfXKnOu9jgxtQeYWqp+HLPZEcisDF+2uuEBgUsytydi6maA2wSZMq3b3IP
         UE+qHZZyh/lhL0JPL1dxo2kR56HOzzCfgr4EGd/W7q6EEqAj+QuLeA4cnz5J+nsBGyJg
         ytweHoO6qKDKzsX6sZUE2hUgTpfi42DEFv48kuA5+g7Oay1Nx1UBaTBmXI6AfaHdUWYw
         71lJRaMn8xskk7TdGkHt8u8Gj8n5G6HXfXbSuBzLvsBbV+JNRzFfFxkfY1vJeuvdCDiZ
         UaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=h8xDe6zlFlgYrxol2NjR1dqNs12EoIJqc92RaoRiQVE=;
        b=NFpgosDNI44fdJivgKfhaRtQgqxAvVKDKmCwHYC7T73Zc/QBDpA8nvZ2A+03/Dmk9x
         ncqnhTte6ZGQlUj7V0JNEyBhaQUAWQ/Hxf/wwUkplzt7nYSDeQlfI/4civWxcPvU4wqW
         yfStXNJ0FRvRBlqJK/2CS4EqqcQ1lh6esfPcSeBgAMAUDOfJk8zakdHMkFHU9xuUwqPg
         4Sz8pdi4i4MoIxJoC3lcHAsxk+7LusNQPPK33stk+hUdeTkdJ82VHhZo4RtU6TqZX5z8
         ZDEYiBy9sf7r5dXESbVAT5PNncYjRskDJzU4xOJNtBGXvtXbc5pLnBrRW+smHSMMpAb3
         0HaA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532nZrB+XT2vkhbqRKQD9EjxmBI/smy8/IQWZz0tAKc7LZIDZqRc
	Jl8LFQPkmOnOE9Bj0aLJz/g=
X-Google-Smtp-Source: ABdhPJwfEWCIlbSVNBRAQk177d+lcqLrWq4nROtAe0i2wpMNJt1T25PBGAMf9LhQNrDtvY9hSJfMRw==
X-Received: by 2002:a1c:bdc4:: with SMTP id n187mr3008860wmf.185.1603958453682;
        Thu, 29 Oct 2020 01:00:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f7c4:: with SMTP id a4ls1932892wrq.1.gmail; Thu, 29 Oct
 2020 01:00:52 -0700 (PDT)
X-Received: by 2002:adf:fb0d:: with SMTP id c13mr3910361wrr.19.1603958452591;
        Thu, 29 Oct 2020 01:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603958452; cv=none;
        d=google.com; s=arc-20160816;
        b=XvoabuZls6rM+AI9knYZMtym70sqmN9fYH0jdGSV3tBLGjxlR94HkmoKo8Lfskfx9Y
         txd0Km4R9FLHuqGxlrY/vHMJla91gpbTqP+pwXn39yAHf9Fk65kFZf19DSpSocRetfyn
         PfNe15nRVmgwpKLHtx49XDShtuzqZT9m+y3N4YuTfmoMOStAF9Nnup6/ZfZwZfgPQU+N
         VLLW7CofeGvlPDAcZVJWJt5uQaxWy6Hl1im1foMerv9au2voXZfLmPjzK5240lW7G6n3
         QH1Nw45jhtPzrQg2IhNDlViOppBRzH1bkK6x85tD7J8Kral7ZLW3m5l5asZKZjBhpXJs
         OQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=zNFARQABqLjmR6Bi+BqCotfBBUCl5fmaANs8aQmGv+Q=;
        b=m4ycU14KcOavblf2uYnSo82wQA6RFSx+6cQkzVAGR35x7lwwE2uy8l/ZRUbDUBjAha
         42IVBsWVjrJaDp1IvvW93bDzhaTY8y304Wcji80CNQC3NsokWoIrGvzDFLo+ZcKidoQ0
         nWfeXrVTF3kf7WYzPitbYpMfK009dvjmeTlv0Z+3XhJkllbxz7PYqX+uL3uo6KBSqYy7
         UbrkKrkpm45EY8Kj8DO5VHIPjWCv7wHObYv6VJ2xYmr0WmgrY/pyIQMqDgfh4EaI+KZn
         l6hIs0YZqrATPA9xg/QWpWw9R0dvQ3eHpsaj4+UOBmN7J+t+4Cd5+tNoXNBocNW4QMAV
         XCGw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 14si33759wmf.4.2020.10.29.01.00.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 01:00:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09T80qXs023059
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Oct 2020 09:00:52 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09T80oTD005369;
	Thu, 29 Oct 2020 09:00:50 +0100
Subject: Re: [PATCH v2] arm64: pvu: Avoid failure in config_commit
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Sekhar Nori <nsekhar@ti.com>
References: <20201028141454.22657-1-nikhil.nd@ti.com>
 <372c4fcc-f707-955b-ec3f-c800dc948557@siemens.com>
Message-ID: <64aeedd9-53cc-150b-cea0-f62d8ee7a402@siemens.com>
Date: Thu, 29 Oct 2020 09:00:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <372c4fcc-f707-955b-ec3f-c800dc948557@siemens.com>
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

On 29.10.20 08:14, Jan Kiszka wrote:
> On 28.10.20 15:14, 'Nikhil Devshatwar' via Jailhouse wrote:
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
> 
> allocating
> 
>>
>> Change the return type to void for few functions. Add comments to
>> explain behavior in case of failure.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>
>> Notes:
>>     Changes from v1:
>>     * Add a comment to descibe why pvu_tlb_alloc will not fail
>>     * Make return type of pvu_entry_write as void and explain the
>>     behavior in case the constraints are not met
>>     * Remove un necessary else block
>>
>>  hypervisor/arch/arm64/include/asm/ti-pvu.h |  3 +-
>>  hypervisor/arch/arm64/ti-pvu.c             | 68 ++++++++++++++--------
>>  2 files changed, 45 insertions(+), 26 deletions(-)
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
>> index 3b9a29ec..c488ce89 100644
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
>> @@ -110,9 +110,15 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
>>  	for (i = dev->max_virtid + 1; i < dev->num_tlbs; i++) {
>>  		if (dev->tlb_data[i] == 0) {
>>  			dev->tlb_data[i] = virtid << dev->num_entries;
>> +			dev->free_tlb_count--;
>>  			return i;
>>  		}
>>  	}
>> +
>> +	/*
>> +	 * We should never reach here, tlb_allocation should not fail
>> +	 * pvu_iommu_map_memory ensures that there are enough free TLBs
>> +	 */
> 
> If we never get here, the test for "i < dev->num_tlbs" is pointless. If
> we could get here, we should not return.
> 
>>  	return 0;
>>  }
>>  
>> @@ -138,10 +144,13 @@ static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
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
>> @@ -159,7 +168,7 @@ static void pvu_entry_enable(struct pvu_dev *dev, u16 tlbnum, u8 index)
>>  	dev->tlb_data[tlbnum] |= (1 << index);
>>  }
>>  
>> -static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>> +static void pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>>  			   struct pvu_tlb_entry *ent)
>>  {
>>  	struct pvu_hw_tlb_entry *entry;
>> @@ -174,17 +183,21 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>>  			break;
>>  	}
>>  
>> +	/*
>> +	 * If the hardware constraints for page size and address alignment
>> +	 * are not met, print out an error, return without writing any entry
>> +	 */
> 
> That's lacking reasoning *why* we can continue then. Again: Can the user
> trigger this by providing an invalid config? I suspect so. Can we catch
> that earlier?

If catching earlier is not easily possible, you could also consider
moving things to jailhouse-config-check.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/64aeedd9-53cc-150b-cea0-f62d8ee7a402%40siemens.com.
