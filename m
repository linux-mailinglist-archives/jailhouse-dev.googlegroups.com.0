Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB5X562BQMGQEE2PQBSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id AF87736490B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 19:33:42 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id h3-20020adfa4c30000b02901027da44a81sf9330493wrb.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 10:33:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618853622; cv=pass;
        d=google.com; s=arc-20160816;
        b=tIMhDsTqHYocEz+ASAAv8p01TJGleVM1iBjS1KvJW8me/PQ99JGZnBIMzw9XUKVmEQ
         I60RMTEa8YJYEX7Xn6u+eYH+Pix2VNxep7eMo6IcyKksdDIVAU4pIX32OOI3bZJsNqC1
         YwBISZExJBTMHLELa2UjcWQOt9/IW3ppOXMVpC+8/uIrKMPxfJfmIge40AIeEQ7vWDpP
         4WphP3qydzcl6/ybk1NxyRV7BiexjyyznVdtgd8ZEVFCPFUJXw6ldnzKnvihARzxYgXv
         aAEPI1zRUMNfold8AnJN4TmWzy15TYEdgBo1LgPmonzDge6/c2YuO5ZQYr7X689i3LzK
         QAPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=j7wgYVfH4aM0MvT9pu5PbhoLBEORkLyr8+lOmbn552M=;
        b=UMNXmYJgHmzJ84F9x6o87WdZtexgeLbt6OSLWK9VHkaGER4Xz70L9vuQy+wbcWPpPM
         OvtJqR8eMD69ZrYkx//60ivm042zegFuafdq5XoJj0qWWw0O1FuZzBDPpl0F1giZhtqV
         NyaTasVGFDBFrkubU0jcpu3PWz6EFlyikaOn0f/l74ArPmeNX8NAsHL+IuMm8dkOt2wI
         7x0j3dAukw2aopR9mE3BFI6cMtvQG/QzFenZKeXNGSKeroXMPZtqCo4Y9965/RkmQg1K
         N9/3OeufzMo9qlcqeGPQ365U24leqWxYK7CdUp3GZmAVLL0G3ORDwqJ6r33qlvzqE18Z
         DtoQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=LLZuKGmC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=j7wgYVfH4aM0MvT9pu5PbhoLBEORkLyr8+lOmbn552M=;
        b=m+TJi7nIclBrZRKcoZ47aOrv9dXsQyhZ4QVwV5oqb9T9BRjcs47D3oC2h5AyxiOWAG
         cRMS+8BupC6rPnFrD/D2RRdkwctYGv89a2o0PTAP1Uu6VsXbxD6TuLDpyslDcCWvW+zM
         2hvG3k9QhwNqN3QyVfJMNuBsw/EEP6QfKa8TKcDliZl2XiVgxMBr5Z6famRdgNfHp0LW
         UU0Ty5TyfmQs0k6atqt3lb3g+jSHloFjfn11byq56uOMZFUb6wW49DQ2b6NPvR1z4xUL
         cS/T6eWyQSHq6D2fGAiTWFfqbeuubb8dfeZQCLUGaAvNbloXDjjqof+rGBQe68ELwakF
         zWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=j7wgYVfH4aM0MvT9pu5PbhoLBEORkLyr8+lOmbn552M=;
        b=gy0mw8nJYQK+W1u0aCgA7Dpolg/eGFHSot4CjyWl+b/Ff3ST9R1w0mzCjFhs5Elzhh
         cvlHHWGRPohYvSgKGXQnb+mU6RFJGXrAp3OfLwKkYNwLtDzEZzARso6TH9grKFjKWPCZ
         n3gTXHXJC9W0+kr2uWVSXt/u0n65Zpb5WBnEi/y93aBqlDNCrzQdFvyM2fB7JvLjE3Wy
         d4wXWZKJAeaatC59oXAwAvfdpHKcDL9L1igzDDYYXO0sJa8u/P4Vc6WDj90vmItGuEJl
         0TdzH9KWX1T0f2KSsUZWtAQypG2TOVQPsjAYv89g7pwiXP6r/Ib3Eunj4Gqe+lbPA5fS
         4+hQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533LMjRsK/fykNZ59H6+/kOy1weLDCflEaC0UtcLRUGurxHfMAs6
	5gJyxIuoMulQciyCBtRp7eM=
X-Google-Smtp-Source: ABdhPJxoibtcbqCDoq70k/ijWf0hMpyQHM/NXgOH2I7v+czcTsVI7TxA0tJW1pNLKYozdzwlpGElGA==
X-Received: by 2002:a1c:2c0a:: with SMTP id s10mr184617wms.158.1618853622407;
        Mon, 19 Apr 2021 10:33:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:1287:: with SMTP id f7ls8762396wrx.3.gmail; Mon, 19
 Apr 2021 10:33:41 -0700 (PDT)
X-Received: by 2002:adf:9011:: with SMTP id h17mr14224067wrh.384.1618853621307;
        Mon, 19 Apr 2021 10:33:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618853621; cv=none;
        d=google.com; s=arc-20160816;
        b=USoViwUXAMse0uBComUNGcj0E6fX1X1Fva+3ZU4I7uSk6DCQMZN2J5wwyE8GZLbHt3
         /zXP7R8EjF3Byxr3uT7wrwE8mLvk7jwcfwwzR0nKS7vKKDuMsjP0ckzZHjvS9xWq6fkY
         ajk9HDk2ONAnjTV4X+szBCjLsUARbINDftli4EFkxBglEXCz42YrzIeojljBt55O/ioC
         fyJudnG0iqVvjeTr6NNZN7JgQmsLZlvxLHuN/RbK3lCv537TPpelTHz7LXormtb2O0be
         olOWYTnn5c6qNc+X1CuUJWpORG6oT/LvD9VhUgf86VyqQr3LmK8X+hs8th/2hrG7NfPH
         osPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=+pGMO//ekllnKKEQrkgC4ZZe+32uxdq29XBtc/pHslg=;
        b=ZZuMYmMeINkinGdjq70vXxIRm8SvBgfjKL/o7+Pmckl5SaaTTaLmCDsh2FvyJafOs8
         0YDDm9a1reNa+uZIuXYKfW0FrA77ONZtlQ92knetN/3PVeCXMhwi6ZTLGLLqRDgqxBEb
         L7EMuf2S41RtJ7t6xbiYKTCWoa60M4bq97xQ0+mWDWHy+YeGIBKFIr7yqk90G0Ywkgqa
         I38TxBmvZ3H4ip+hNDn4+RJaRdSpnT9+F4ZxERsIV7EhzcSGWVUOqmui0IxJy3qCzqIB
         /WzWXVep9wUtabVD7aWyQd8f4P0z31b1lLT1EqOoTdqNj01lwMmqbuG7O7t7QLgsU/mk
         bSWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=LLZuKGmC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id y16si939510wrh.3.2021.04.19.10.33.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 10:33:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4FPDSN6XMYzxtD;
	Mon, 19 Apr 2021 19:33:40 +0200 (CEST)
Received: from [172.16.2.102] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Apr
 2021 19:33:40 +0200
Subject: Re: [EXT] [PATCH V2 1/1] inmates/lib: Add zeroed alloc, and update
 usage
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
References: <AS8PR02MB6663931DDEBBE7D87BFFF808B6499@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <da05bc0c-c47d-f8f7-df61-339eb97a9cc2@oth-regensburg.de>
Date: Mon, 19 Apr 2021 19:33:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB6663931DDEBBE7D87BFFF808B6499@AS8PR02MB6663.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=LLZuKGmC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Bram,

On 19/04/2021 19:09, Bram Hooimeijer wrote:
> Adds zalloc(size, align) which allocates memory and fills it with zeros.
> Replaces usage of alloc() in inmates/lib with zalloc().
> 
> Motivation is that use of alloc without zeroing in mem.c:map_range()
> results in illegal page tables if memory contains artefacts.
> 
> Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
> ---
>  inmates/lib/alloc.c                 | 13 +++++++++++++
>  inmates/lib/arm-common/mem.c        |  3 +--
>  inmates/lib/include/inmate_common.h |  1 +
>  inmates/lib/x86/mem.c               |  4 ++--
>  inmates/lib/x86/smp.c               |  2 +-
>  5 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/inmates/lib/alloc.c b/inmates/lib/alloc.c
> index e68e6cc1..f4c06571 100644
> --- a/inmates/lib/alloc.c
> +++ b/inmates/lib/alloc.c
> @@ -5,6 +5,7 @@
>   *
>   * Authors:
>   *  Jan Kiszka <jan.kiszka@siemens.com>
> + *  Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
>   *
>   * This work is licensed under the terms of the GNU GPL, version 2.  See
>   * the COPYING file in the top-level directory.
> @@ -47,3 +48,15 @@ void *alloc(unsigned long size, unsigned long align)
>  	heap_pos = base + size;
>  	return (void *)base;
>  }
> +
> +void *zalloc(unsigned long size, unsigned long align)
> +{
> +	void *base = alloc(size, align);
> +	unsigned long *p = base;
> +	unsigned long s = size / sizeof(unsigned long);

What if size % sizeof(ulong) != 0?

We don't have that case anywhere at the moment, but you introduce the
chance to return some dirty bytes for the sake of optimisation.

> +
> +	while (s--)
> +		*p++ = 0;

I understand that this is more performant than calling memset, but I
recommend to avoid microoptimisation here. If you really run into
performance issues, then improve memset().

So I'd recommend sth. like:

	void *base;

	base = alloc(size, align);
	memset(base, 0, size);

	return base;

The rest looks good! I don't expect anything to explode on untested
architectures as well.

Thanks
  Ralf

> +
> +	return base;
> +}
> diff --git a/inmates/lib/arm-common/mem.c b/inmates/lib/arm-common/mem.c
> index 5951fafc..5064b002 100644
> --- a/inmates/lib/arm-common/mem.c
> +++ b/inmates/lib/arm-common/mem.c
> @@ -56,8 +56,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
>  	while (size) {
>  		pgd_index = PGD_INDEX(vaddr);
>  		if (!(page_directory[pgd_index] & LONG_DESC_TABLE)) {
> -			pmd = alloc(PAGE_SIZE, PAGE_SIZE);
> -			memset(pmd, 0, PAGE_SIZE);
> +			pmd = zalloc(PAGE_SIZE, PAGE_SIZE);
>  			/* ensure the page table walker will see the zeroes */
>  			synchronization_barrier();
>  
> diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
> index 5af1213a..1c20a0af 100644
> --- a/inmates/lib/include/inmate_common.h
> +++ b/inmates/lib/include/inmate_common.h
> @@ -103,6 +103,7 @@ void __attribute__((format(printf, 1, 2))) printk(const char *fmt, ...);
>  extern unsigned long heap_pos;
>  
>  void *alloc(unsigned long size, unsigned long align);
> +void *zalloc(unsigned long size, unsigned long align);
>  
>  void *memset(void *s, int c, unsigned long n);
>  void *memcpy(void *d, const void *s, unsigned long n);
> diff --git a/inmates/lib/x86/mem.c b/inmates/lib/x86/mem.c
> index 7e1c8b83..764bdb4b 100644
> --- a/inmates/lib/x86/mem.c
> +++ b/inmates/lib/x86/mem.c
> @@ -57,7 +57,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
>  		if (*pt_entry & PAGE_FLAG_PRESENT) {
>  			pt = (unsigned long *)(*pt_entry & PAGE_MASK);
>  		} else {
> -			pt = alloc(PAGE_SIZE, PAGE_SIZE);
> +			pt = zalloc(PAGE_SIZE, PAGE_SIZE);
>  			*pt_entry = (unsigned long)pt | PAGE_DEFAULT_FLAGS;
>  		}
>  
> @@ -65,7 +65,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
>  		if (*pt_entry & PAGE_FLAG_PRESENT) {
>  			pt = (unsigned long *)(*pt_entry & PAGE_MASK);
>  		} else {
> -			pt = alloc(PAGE_SIZE, PAGE_SIZE);
> +			pt = zalloc(PAGE_SIZE, PAGE_SIZE);
>  			*pt_entry = (unsigned long)pt | PAGE_DEFAULT_FLAGS;
>  		}
>  
> diff --git a/inmates/lib/x86/smp.c b/inmates/lib/x86/smp.c
> index 94ce2913..625ddaf0 100644
> --- a/inmates/lib/x86/smp.c
> +++ b/inmates/lib/x86/smp.c
> @@ -54,7 +54,7 @@ void smp_start_cpu(unsigned int cpu_id, void (*entry)(void))
>  	u64 base_val = ((u64)cpu_id << 32) | APIC_LVL_ASSERT;
>  
>  	ap_entry = entry;
> -	stack = alloc(PAGE_SIZE, PAGE_SIZE) + PAGE_SIZE;
> +	stack = zalloc(PAGE_SIZE, PAGE_SIZE) + PAGE_SIZE;
>  
>  	write_msr(X2APIC_ICR, base_val | APIC_DM_INIT);
>  	delay_us(10000);
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/da05bc0c-c47d-f8f7-df61-339eb97a9cc2%40oth-regensburg.de.
