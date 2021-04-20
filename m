Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB75T7KBQMGQEHB6YUIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE523654D6
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 11:08:16 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id r16-20020ac25f900000b02901ae74bbfd43sf853547lfe.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 02:08:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618909695; cv=pass;
        d=google.com; s=arc-20160816;
        b=bRW37cNM6V7JUYigssmIdP3NcJZrCwXdYRveMhL7Newl+KiYJ2T9DFtoxhD3y6Ow7r
         mos7LdYEdIRlZ65VQuMJPXnmnCJXlZsNBgv3CKnQccn7XZJfzYRWTanbRhFY3xR98Z0K
         yMHH4YrXCYzY744D+27nmNsk5xA6coMIBfsKcEA7vvxxkVVxCjYGRq9UpdzQpvxOLLZn
         4AhDBQskco8qUnI2MxyREgk8Q8XVsb1oW+qfJj2WtF715Jk8V+HgR/etabdZPX6q0NpY
         wKbAyQ7/5YvIFHkghYXeKm2D56UsOHXZMOxA6JbxI00dTiWnaO0V85MmxSrRjjXYEriQ
         1CKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=K2DBnkOfOvqsgydrBPB/Ykh9MkH1R6l5AfJrt4VcQDw=;
        b=UrUyPWwrUeOaSU+WS77XP7rMXcr24OQNqQ4o9HrXGgE+4Hx19UmydORwcDMAXxXSSn
         /UMG1V+bQ2cxKOFylolWAjZXXXUtlVfRW0msdAwEnetPyH153WMCR0F2eQuZjpbQHydA
         CX5YUrRYinZWxatbYn5l7okvtoADqn82kCiw75yoU7B+IBgsrYrjnBoDsOpv397HPq55
         cs1iQv7CnkU0rAm0LcLArRtl9ubsEVsx6fB6RbKqzvTpTe7il9UINOe7iOXKfGyPYBHi
         opO3O9bOgKJzheBdWGPy/OBm9NGL/LJ1PlXflO7LdTWAqdNoORIheJbafyjzWlTNfum5
         2OFQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Z917FBxW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=K2DBnkOfOvqsgydrBPB/Ykh9MkH1R6l5AfJrt4VcQDw=;
        b=VB20lmV7j9WsoqwrJ+zxzKmIpXDuIJLaoJCpnSFsPv91cFOM2Pa+sq2pc2/9Xom741
         tRiSBRvoAUFMWv+v2NHHaqIM+XqbzDCX3WmoZGLPKGQGt9FwVPxr1Sb588PlZ5ubylef
         aBaTqDYC4lzAdPKyB+7YrESgZ6f/pLn6bsvycSyIz8xJA1lI/hGEuob8vhU5Rj3c8SSe
         vKFVafITHTcuv/OncZmzHuh9rA+2g1Mgu+fik6ltOcItdVuojSIXQPPl0H/tdWizuSAV
         cfBNAePU350W+JevV7bYRTT7lQSuvRiFAWTEGHXjTvOiOVqcEidSWFYO89ARzUQLIEqq
         QwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=K2DBnkOfOvqsgydrBPB/Ykh9MkH1R6l5AfJrt4VcQDw=;
        b=jnlsGxqr+I1WT+B8OV/UWvxy8MPlVusFfMcpZ6S1aAyFUh/jTau4j/XXkpQxnkqdka
         aYFM5/yfiOgYbtXPbABj99tHI699aEKdj3dzl7oWC8tFf+ml3gRtCc9nU8jUcwkN08vY
         unIEfawIzVKoReAqEEtSbxRe72uMmr32vESTROF2kJv8oDB2vCjiCuZ4PgzQQLwz+qOz
         277wdHZOMEjsg/VVbrQpf8QOgJY7g1n9GMRi/aVXpmOzgEgQMkftP3UjsMCcO9JyIZt+
         Amgq0Zcit0NxxoGsElYfTTuEUwoPbW4xBODeCIjZ3tdivohgzEEeBMB4M8XjkrJwGPyp
         YqWQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531V7pGrUY3CVoD1SEwHLp10p+OcHJide+PZtXyf+5QxcvtyTVdz
	tr21AV33zm4/53RSXUT9pT4=
X-Google-Smtp-Source: ABdhPJysAW31oeEtFtp+wXLEZp0qkAO4S644VuLMBtnwohniesGoGowqZndm9G0eQrsjlNb3pGSteg==
X-Received: by 2002:a2e:90d1:: with SMTP id o17mr14038519ljg.92.1618909695814;
        Tue, 20 Apr 2021 02:08:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5624:: with SMTP id b4ls3367049lff.0.gmail; Tue, 20 Apr
 2021 02:08:14 -0700 (PDT)
X-Received: by 2002:a05:6512:3f27:: with SMTP id y39mr9777972lfa.166.1618909694564;
        Tue, 20 Apr 2021 02:08:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618909694; cv=none;
        d=google.com; s=arc-20160816;
        b=eZIjhYry0fJobZNHgS0DDgFJeVkq12cf89cEE4dkiVp8Xb+8OuxmbsoXCCWb1VC7s4
         fGJjRESxeZpah+cfJd7OAm7jyX/OvdB3+hgZkzh19/5dfVUwDfVu5HJg9J+WhedxYWeq
         LQWpx+ZIww4bGe9gLedjt3LaV8hS8vnxQdJgJDMlBShibGU2RdwOmlTPt3/9LkHNVXwE
         +y7Y6ENxP0vQHl7qESFMAz0QQBvhhDbpGpmA4vruLdIOJiD7PoOiDpVRDhu7kjXSlREK
         bv3/2KwdIQNNHtNPJYQ2cyslgrsGj+HZiQQTLb6ZV+/ZSKYYJ8Cis1GwFxbqLERkKby0
         5xyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=z9W8g1tyK9lV732f9TbNmfnByXStdxKQQLKoPNHgTOk=;
        b=ZzlwrXw/4G5QsvxV5YGZKdz2xP/j6OvHibAFPvzUCUURm16wMqfZ4aWjQ/+pEZ7cDK
         hU4J6CrxOA8JzZ1bSPIFvuPmN2wG4E6BOBai4esrNN+KdmQ4PX+5l3a+b+/LRrSswhbw
         RZL0vcq3Vz3ZkFf0enI7qbDg03U2pK6rKWNoNsoA0adEJlITzSKFItTSopAfpWl8CJhb
         lCUgPNCWP+HeguVaH41q+Dm2XY4QS20aKpKHG3qHei9dEcEPZySRK4z5UEDWhmV7KRk8
         tgLNPQS3tpckfANaDgvKVmRjQ/xyv3cOqNvsuQ5T3ddC/2+YAm/6ZDi1UuGBFplZrfyc
         tddg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Z917FBxW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id q26si748510ljj.4.2021.04.20.02.08.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Apr 2021 02:08:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4FPdBj41mBzxtD;
	Tue, 20 Apr 2021 11:08:13 +0200 (CEST)
Received: from [172.16.2.102] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Apr
 2021 11:08:13 +0200
Subject: Re: [PATCH V3 1/1] inmates/lib: Add zeroed alloc, and update usage
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <AS8PR02MB66632030F576308C52270C07B6489@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <2c45f24a-4c6e-2988-edf0-bdf35d269dec@oth-regensburg.de>
Date: Tue, 20 Apr 2021 11:08:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB66632030F576308C52270C07B6489@AS8PR02MB6663.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Z917FBxW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 20/04/2021 10:49, Bram Hooimeijer wrote:
> Adds zalloc(size, align) which allocates memory and fills it with zeros.
> Replaces usage of alloc() in inmates/lib with zalloc().
> 
> Motivation is that use of alloc without zeroing mem.c:map_range()
> results in illegal page tables if memory contains artefacts.
> 
> Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>

Reviewed-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Thanks
  Ralf

> ---
>  inmates/lib/alloc.c                 | 9 +++++++++
>  inmates/lib/arm-common/mem.c        | 3 +--
>  inmates/lib/include/inmate_common.h | 1 +
>  inmates/lib/x86/mem.c               | 4 ++--
>  inmates/lib/x86/smp.c               | 2 +-
>  5 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/inmates/lib/alloc.c b/inmates/lib/alloc.c
> index e68e6cc1..5da6828a 100644
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
> @@ -47,3 +48,11 @@ void *alloc(unsigned long size, unsigned long align)
>  	heap_pos = base + size;
>  	return (void *)base;
>  }
> +
> +void *zalloc(unsigned long size, unsigned long align)
> +{
> +	void *base = alloc(size, align);
> +	memset(base, 0, size);
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2c45f24a-4c6e-2988-edf0-bdf35d269dec%40oth-regensburg.de.
