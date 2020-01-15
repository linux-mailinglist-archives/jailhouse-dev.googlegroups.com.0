Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAMU73YAKGQEB6NKV3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C57413CF77
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 22:54:10 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id z10sf8393593wrt.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 13:54:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579125249; cv=pass;
        d=google.com; s=arc-20160816;
        b=oQ6g5K+CAueB1NMEhyy1sDVDP0Bm5tCixJGD2dcbQFz+PLW7X58r2wJWZSUYhlfzN0
         YLuEdT0qIwMxfbgehh9hBQnig+pLFahlp+n2qvMt87dfqNBg9xzNdJctoPxYLR32BTt1
         GBkeq4ZsUgnuoWtLmIDjG9ydwCVAc2SCLF5Saz3cei0vVMyIue/3xKm6Wb+ICtrZO27I
         jRWzgAMcmEOJgWuo+jp9r6dHreHa5kZPll7uHU3wjco7YhecP9GTjbULyYAwQDaz4m+O
         +vno4gWdYFt7T+YboFifIE6yg6Ovf78N/0UH7CukskRRflcJmfzb3xBL8N8DLEH1Ep3p
         t+FA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=0FKM2K7b9nBVVT1TuhNXHulLQWO+KHXngZEHGaUprQs=;
        b=SwtkzE55pZ7L3G45RBGyyUKNbVker1sw7tn3UbHbrehivxlmAqLJULWjAJHr7HjsyL
         APRaCEYGoxSPIIu9EnMsILq8cMAiODBR8sCruCKf7g/JCryeDiLwRM6wdWT4A8aCpQN/
         /1P0DsEzIXAtIgAwpwruylkfTKUMdS53VsonhnDFnSJ0bvjxRXZtU1cd9QhnnaTS9XOh
         +07GefKK/wX3Y9ZwJhxIS4L5bHYsG3vQ3yELGZXdCFFUyPnBcDKMtahuaTIpzwCJqNSH
         yFApqSb44U8H4buxXY7OxZc6SXEZvSTVCOWUbOWlxOGPhilgTOR6eY5+7cIj0+9NM+C2
         iGIQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0FKM2K7b9nBVVT1TuhNXHulLQWO+KHXngZEHGaUprQs=;
        b=RMCnL6TxvTqSzgoFZWX4MUy2GBPl+4Gy7LG/6ksSAojGl1gjh4q4kBfeSZllVhZjtf
         v7CZgbI+Btzvse5uwhReA8wBfObam9gPlLR7Fp75bSjC74JCfPOqtUb5RNdb9piysyfF
         zrFk2gacjI8+EQZnT3JtGFdj2PDzcYSdtea3zCl2f/WDaIKoGu7jGL6hD6mnDCTZxVRt
         adMGuGl9yZUzZkK1rChjCJEQa6MkmmXCGJ1CGfYQ5sYDEDG0RIqY21xjjyHoYV5Y3f7D
         +2oRUWZ/fuxGbds4YBxj+V7BWwZkackpmLcdnb+hpJsnxiqfRLXi27J1IVu4R0aQL0nN
         KrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=0FKM2K7b9nBVVT1TuhNXHulLQWO+KHXngZEHGaUprQs=;
        b=Eo5H9ACoykDqdGH9zmFAyGNe7eYBB+rXZybp7GbIRv8nbWbSD1pnBRAiyVMjkYzjzR
         2DweJyf8GUt0pODFIdeCw9sEjtRvyjUy1UBHVMU1rDhVkTOaM+sSpx+Nf3Vq1fiRJVkp
         jPqQOUooqkArkqK/Ouwjs5zGbtJdV0JWQLhwnZ46gUcdU+P13AHY+FYjxeUywhu3O7UZ
         muxyDCUmqwftxrt+VTw0iiOdA9k1eu5sQ3jSGNjD0It8w5nn3o1c5hV8EOZaiZSPt+Fx
         e7622o5dspBNxwcbpHmFY1mgsg+ulf+k/89sjdOSF8o9Duys4WUi1ekrfLIp6xAhRSzH
         fioQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWbwP/qw2wSwk6rQepUI6K7lrFtQMchEhYlshaFnfNRaQKDkVOL
	rmu/wrsZPY9fFbX/WCQCNtE=
X-Google-Smtp-Source: APXvYqxs4kglkNSqUknrlC6LSEb+fQQ7kH46uS9TOVqKmLg7asc/DH0+FrTb5qMG0NLxRLejeCU/sg==
X-Received: by 2002:adf:eb09:: with SMTP id s9mr34766156wrn.61.1579125249756;
        Wed, 15 Jan 2020 13:54:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4303:: with SMTP id h3ls7177766wrq.15.gmail; Wed, 15 Jan
 2020 13:54:08 -0800 (PST)
X-Received: by 2002:a05:6000:12c9:: with SMTP id l9mr34884921wrx.304.1579125248760;
        Wed, 15 Jan 2020 13:54:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579125248; cv=none;
        d=google.com; s=arc-20160816;
        b=IDjGjxzXy2RpNw/bxGJRcLnC28O/aEmtcHTrlcTzYtAgVmMlPSHizUmnFtqdgn6UkW
         KdFzC3IitJqyIHY1jPaBtW5a01h3wGw2aUNMhewCiwLC7qN8L7MHjHqo37ILeHdf+yCe
         YBFaAky588wLKq6qXpHbDXOWzPkUC9sDEWChbMmCodKkS0b97LhzwiRLYfKw7TrtqRl6
         6idjPxjGycw7AEhZ5pPlfyxSj7mP/cwQhLhco7Ayy1SYqFiShMMaxzUUMjU4X/Asz8zf
         k0w4wcIuZvko7Z+R2h0sBjde0bKnhYthJhAx1nXtAiMYbSd5dRTUNGMRFLHYUi8R3qyf
         Q94w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ef6DzFuWGTLjljcBSR2CCgBlHQZ8R6R7TBvJ9bauWxg=;
        b=Tr6ZVTWdAI5m5xxfU0ms3aMhs1b7r8aUUBzMDGQGQicSUKUdfEPCzunxap5p+YRfN3
         oJ61D6AOLd458lKlSVO9X+GQqu2TYG5xGhfoQXb/Trv01ZZFO+szMI7GUZtNeLRhdGCz
         Qzcm4okhRk93INTPjvP2oLVi7dWU4PYv2b4naE8guveTUmR898iXqgZigGGPzA/y5Dzs
         zxXmuJr3n6nv9TZPXizgvT31VOAXj6DQPPypdOJowjKRYRzBf9t6/y+UMshm8IHyAOex
         6o8rzzOKs+9Au4udxOVXJVuwjGJzm45Z8GhYJu+dEh8js1fHZWsIidHL0dKr5eYmNzWK
         9EtA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id m12si946157wrq.1.2020.01.15.13.54.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 13:54:08 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 00FLs7oc009257
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2020 22:54:07 +0100
Received: from [139.22.32.100] ([139.22.32.100])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00FLs6PI011356;
	Wed, 15 Jan 2020 22:54:06 +0100
Subject: Re: [PATCH] core: fix hugepage splitting in paging_destroy
To: Chase Conklin <chase.conklin@arm.com>, jailhouse-dev@googlegroups.com
References: <20200115173217.3256-1-chase.conklin@arm.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d37ceba9-3d2d-03d4-05a3-6b6fdb3beccf@siemens.com>
Date: Wed, 15 Jan 2020 22:54:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200115173217.3256-1-chase.conklin@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 15.01.20 18:32, Chase Conklin wrote:
> When unmapping pages, it is not sufficient to compare the size of the
> page to the size of the region to be unmapped to know whether a
> hugepage needs to be split. That approach does not split hugepages
> when the region to be unmapped is larger than a hugepage but does not
> cover the entire hugepage, resulting in areas outside the region to be
> unmapped and leaving areas inside the region mapped.
> 
> Instead of comparing the size of the region to the size of the page,
> check if the region overlaps only part of the page and split the
> hugepage if it does.
> 
> Fixes: 1f7784032531 ("core: Add support for creating page tables with hugepages")
> Signed-off-by: Chase Conklin <chase.conklin@arm.com>
> ---
>   hypervisor/paging.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hypervisor/paging.c b/hypervisor/paging.c
> index 4a24c1f6..83cdcf00 100644
> --- a/hypervisor/paging.c
> +++ b/hypervisor/paging.c
> @@ -389,7 +389,20 @@ int paging_destroy(const struct paging_structures *pg_structs,
>   			if (!paging->entry_valid(pte, PAGE_PRESENT_FLAGS))
>   				break;
>   			if (paging->get_phys(pte, virt) != INVALID_PHYS_ADDR) {
> -				if (paging->page_size <= size)
> +				unsigned long page_start, page_end, region_end;
> +				/*
> +				 * If the region to be unmapped doesn't fully
> +				 * cover the hugepage, the hugepage will need to
> +				 * be split.
> +				 */
> +				page_size = paging->page_size ?
> +					paging->page_size : PAGE_SIZE;
> +				page_start = virt & ~(page_size-1);
> +				page_end = page_start + page_size;
> +				region_end = virt + size;
> +
> +				if (virt <= page_start &&
> +				    region_end >= page_end)
>   					break;
>   
>   				err = split_hugepage(pg_structs->hv_paging,
> 

A good catch as well. I think I silently assumed that users laid out 
their regions in a split-friendly way.

I've applied this, but I've folded page_end and region_end in - I don't 
think they increased readability noteworthy.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d37ceba9-3d2d-03d4-05a3-6b6fdb3beccf%40siemens.com.
