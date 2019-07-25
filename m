Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBQFY47UQKGQE2KKE4LY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id C128075476
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 18:43:44 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id e8sf24148113wrw.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 09:43:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564073024; cv=pass;
        d=google.com; s=arc-20160816;
        b=ta/Vl1R0mQQiOq0VmBGGcRftL/E6NuNjBBZuoseEGIAkHPSmoEIOiqNYr/E1T/O9bH
         xmCa0ntF9C8Kd7BuW7mgKqXoJ49tzwUe7AmJ1N6IOLS35GJaSTtoTi6daiJ/gFsXswgm
         pHw9axNmoRBB1a6Oxo3E0bzaGQ23bPS2EW0D7VVniNubrdWDgnJdfLWUwO8sY7g62/o1
         gjDik1GrpNwTfJIE/tnm71qn0d/F7kgr3/FB1sqpBGxqWOe3uGml5qu+DWowro0LTAUh
         LRZH9Um4kwnms4Wu9NTstEUn6THoqGgBYZPVUIZXZfB/5PSqQ67Vsx4F+AaOkmDg+EcZ
         +gKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=obIh9E8jpCFMPAZbUc+kxcMXQyVxybn2k7fzXgcwn/E=;
        b=HzJGzcaJuIJeTeS/1Tqy7Kj93I+9yZBSFXKEY1ZcaRXzt9GUpYVaQGnbg3vHoT826d
         uGkVS/bGlPfDU9e5brOWk3Ajjj/d1P4tDfih7C3U7LLXp+kQDl4Dyz5vZ9lp6I2ounQm
         PhWwk0HjyVFGVtJGC3LlC60HbGUBK4eDE23HEUZYy+2AblN+dgMdby4KBy+AuOf7/z6d
         z2rfKrV6jJRDBOEehhv8lqT+zNdI/Z4u/8xYchTcEMlUOBpFGvpC7n5wn4i8BC4+ESXo
         SWl9CWJ536KT5rj8OL+atkUE5bupFoLLEQnnwE/SgRqesO587jaGwQINMk3Mj/fIczJk
         zsPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bUHkYgW9;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=obIh9E8jpCFMPAZbUc+kxcMXQyVxybn2k7fzXgcwn/E=;
        b=mpZ9YFZ0dN4DU3gxYo6o6TcwyT78ZXSEiyqK7a96XbpNfbRp5Rctm/eBzX22/noIiu
         Xe/C4Py5PezHuA+dJpuBJBkXPJA4Tfeulh/7c63j+tpzxtVpsnye4nxX1r07zk+YIIb7
         Jy8oWund++KUlDCvQrHOIwKaSxaZrSKs6yNE6jBnVCAdXXRNz/I6GUR08yhOru3Plo/H
         EnFI78hON+f2Hbr0oeVzw8lt66nt2h0t5DADdtBw5QgW7Acg6z3JaKLvOSimvUqYcGK9
         t7yinCpJy++/OK0dp/VI4TfCsHXY8YDlFQK62ArtUqe34c96CUhf05sVMCGWqcHInXHB
         CWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=obIh9E8jpCFMPAZbUc+kxcMXQyVxybn2k7fzXgcwn/E=;
        b=tkbIAjjapGbLjoxMI5IK4Z9LRlgqfAq/DMRxjh5HFTBCGR8Qboo6yLu/Th+ZhO+W42
         iZhjfKniTQ7TChwGb00UfsDSAqPsffumFnVzpSkHTNYjm4FnZAqCtbMG13tMCinjmiCo
         fQVYNJdcnnnrPNtR4C8MEoxbw+MoKVKgVYCUMMzNK51rnUPaTIlJVZIAsQWmlY8pJLO5
         RKNGXncipIQrd3TJsJeM7Eo3NwQ4nwrqJca31E6JR+wnKFhrlbFn7rgWA2Zjwh19jJQO
         ypDKPL3dgG9NhICLH+P57Z14kV1m+f0oL76SHFOcnTxjXCifUSLNwRFQSLXDcoFRqmsS
         WhQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXsI04c4uZkPqFYrM7dlVnyoqqBcJXCnY0A0CWyDaeHjwLqom7J
	jNTHrHHDl4cLanIexzaRaH8=
X-Google-Smtp-Source: APXvYqx3XdRl6asfzHOsy4oijqRirmuiMfXIZle49GH0KAy0TyU4N1Xz1pXHCWuLp2CXXZTO9NkQow==
X-Received: by 2002:adf:dcc6:: with SMTP id x6mr67244729wrm.322.1564073024542;
        Thu, 25 Jul 2019 09:43:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f78b:: with SMTP id q11ls5917489wrp.10.gmail; Thu, 25
 Jul 2019 09:43:44 -0700 (PDT)
X-Received: by 2002:a5d:4e8a:: with SMTP id e10mr13665055wru.26.1564073024094;
        Thu, 25 Jul 2019 09:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564073024; cv=none;
        d=google.com; s=arc-20160816;
        b=DhsYMfLohyKicBTitfYb2MgLfNj/lMQ9iPoqiPNlLc9s8ESKzNlS4q9NSsjxXFCcDm
         dvB+e6km913SMBK+GkVVNBC4jOTT1Spt+JAAx4Tex4DycuP42+hWEZYu4yeJy4fPHFyu
         Zo6kXl4gSXHvza9G6avHcctmjFHN4erTgeRODmZw0bYHA8ICqflIkNdgCw+MDcWZw2p4
         jaj6QOYJmUHmXKgun0TZp6d+f6UE2LA6TFNmvjT03/B5yxB2NgpVywHWb8RRjLLyi88J
         IfiODInzb6eS9NxygDgjF2y0bkHOU6gCsi3nbnVYOkh5EG0V8rzrElN1uNSrBwLyLMxl
         NLBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=2lCdc24t0L5BGq6EMk+RfsWPeYJAqIY4IKNsZErDzyE=;
        b=D0FVBkLfzU6ixSPMMTmrXsUhHI7yVwjkPVUFu0SVhJTZfVZQsKukA8cCHKl74MYkJL
         s7Ain+pG3tqpo2ZW1FLw/XRS8tP1uAqtrJ2M2NlmpVas8KbwzUQTztuIzCvvwHFFChr/
         YQVc41gTR2s3SstawI5lxhc+9j9PZ9xEDRNpZW6Dr3dWtQTnVr0L67SZukJeN5Unq15A
         RGQ7yWm1nL48nP7GTIiSC8Kx9Om+K3e90iQgdhkL3dSFc2W9QjD4QwZYRPaUMDoB4zst
         JoJ0N/13gkw/1c1occ5UWKjk9c9gCR9jibtOHRv8bYn+QOURULDzKMFHVLe75AQcISbG
         VjEA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bUHkYgW9;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id y4si1369408wrp.0.2019.07.25.09.43.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 09:43:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45vdMM4hmmz102f;
	Thu, 25 Jul 2019 18:43:43 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 25 Jul
 2019 18:43:43 +0200
Subject: Re: [PATCH 05/11] x86: drop vcpu_vendor_get_cell_io_bitmap
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
 <20190713181037.4358-6-ralf.ramsauer@oth-regensburg.de>
 <22c86c43-3122-f222-6ac6-5305372e4e8f@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <57ef7def-c89e-11ad-050f-66a2e892889d@oth-regensburg.de>
Date: Thu, 25 Jul 2019 18:43:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <22c86c43-3122-f222-6ac6-5305372e4e8f@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bUHkYgW9;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 7/25/19 7:22 AM, Jan Kiszka wrote:
> On 13.07.19 20:10, Ralf Ramsauer wrote:
>> They're now basically the same. Consolidate it.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>  hypervisor/arch/x86/include/asm/vcpu.h |  2 --
>>  hypervisor/arch/x86/svm.c              |  7 -------
>>  hypervisor/arch/x86/vcpu.c             | 13 ++++++++++---
>>  hypervisor/arch/x86/vmx.c              |  7 -------
>>  4 files changed, 10 insertions(+), 19 deletions(-)
>>
>> diff --git a/hypervisor/arch/x86/include/asm/vcpu.h b/hypervisor/arch/x86/include/asm/vcpu.h
>> index 24872f55..cae5b554 100644
>> --- a/hypervisor/arch/x86/include/asm/vcpu.h
>> +++ b/hypervisor/arch/x86/include/asm/vcpu.h
>> @@ -88,8 +88,6 @@ const u8 *vcpu_get_inst_bytes(const struct guest_paging_structures *pg_structs,
>>  
>>  void vcpu_skip_emulated_instruction(unsigned int inst_len);
>>  
>> -void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
>> -		                    struct vcpu_io_bitmap *out);
>>  unsigned int vcpu_vendor_get_io_bitmap_pages(void);
>>  
>>  #define VCPU_CS_DPL_MASK	BIT_MASK(6, 5)
>> diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
>> index f2ea313e..e1000447 100644
>> --- a/hypervisor/arch/x86/svm.c
>> +++ b/hypervisor/arch/x86/svm.c
>> @@ -1008,13 +1008,6 @@ const u8 *vcpu_get_inst_bytes(const struct guest_paging_structures *pg_structs,
>>  	}
>>  }
>>  
>> -void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
>> -		                    struct vcpu_io_bitmap *iobm)
>> -{
>> -	iobm->data = cell->arch.io_bitmap;
>> -	iobm->size = IOPM_PAGES * PAGE_SIZE;
>> -}
>> -
>>  unsigned int vcpu_vendor_get_io_bitmap_pages(void)
>>  {
>>  	return IOPM_PAGES;
>> diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
>> index 4c074669..cf8ff04c 100644
>> --- a/hypervisor/arch/x86/vcpu.c
>> +++ b/hypervisor/arch/x86/vcpu.c
>> @@ -76,6 +76,13 @@ out_err:
>>  	return NULL;
>>  }
>>  
>> +static inline void vcpu_get_cell_io_bitmap(struct cell *cell,
>> +					   struct vcpu_io_bitmap *iobm)
>> +{
>> +	iobm->data = cell->arch.io_bitmap;
>> +	iobm->size = vcpu_vendor_get_io_bitmap_pages() * PAGE_SIZE;
>> +}
>> +
>>  int vcpu_cell_init(struct cell *cell)
>>  {
>>  	const unsigned int io_bitmap_pages = vcpu_vendor_get_io_bitmap_pages();
>> @@ -97,7 +104,7 @@ int vcpu_cell_init(struct cell *cell)
>>  		return err;
>>  	}
>>  
>> -	vcpu_vendor_get_cell_io_bitmap(cell, &cell_iobm);
>> +	vcpu_get_cell_io_bitmap(cell, &cell_iobm);
>>  
>>  	/* initialize io bitmap to trap all accesses */
>>  	memset(cell_iobm.data, -1, cell_iobm.size);
>> @@ -115,7 +122,7 @@ int vcpu_cell_init(struct cell *cell)
>>  		 * Shrink PIO access of root cell corresponding to new cell's
>>  		 * access rights.
>>  		 */
>> -		vcpu_vendor_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
>> +		vcpu_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
>>  		pio_bitmap = jailhouse_cell_pio_bitmap(cell->config);
>>  		for (b = root_cell_iobm.data; pio_bitmap_size > 0;
>>  		     b++, pio_bitmap++, pio_bitmap_size--)
>> @@ -143,7 +150,7 @@ void vcpu_cell_exit(struct cell *cell)
>>  	struct vcpu_io_bitmap root_cell_iobm;
>>  	u8 *b;
>>  
>> -	vcpu_vendor_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
>> +	vcpu_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
>>  
>>  	if (root_cell.config->pio_bitmap_size < pio_bitmap_size)
>>  		pio_bitmap_size = root_cell.config->pio_bitmap_size;
>> diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
>> index 8552cabd..2f46b7e9 100644
>> --- a/hypervisor/arch/x86/vmx.c
>> +++ b/hypervisor/arch/x86/vmx.c
>> @@ -1220,13 +1220,6 @@ void vmx_entry_failure(void)
>>  	panic_stop();
>>  }
>>  
>> -void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
>> -		                    struct vcpu_io_bitmap *iobm)
>> -{
>> -	iobm->data = cell->arch.io_bitmap;
>> -	iobm->size = PIO_BITMAP_PAGES * PAGE_SIZE;
>> -}
>> -
>>  unsigned int vcpu_vendor_get_io_bitmap_pages(void)
>>  {
>>  	return PIO_BITMAP_PAGES;
>>
> 
> This is pointing in the right direction, but we can be more aggressive: There is
> no reason for struct vcpu_io_bitmap anymore. pio_allow_access() will only use
> the data, and for the users here, we also remove the indirection without
> complicating things.

Good point! I already implemented the removal of the structure. I'll put
this at the end of my series. This makes it easier for me.

  Ralf

> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/57ef7def-c89e-11ad-050f-66a2e892889d%40oth-regensburg.de.
