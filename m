Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYVL3HUAKGQEBB7ZORQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFDC5A305
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Jun 2019 20:01:07 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id b21sf10059557edt.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Jun 2019 11:01:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561744866; cv=pass;
        d=google.com; s=arc-20160816;
        b=SXo5nyioYB8b7Y4LGv1821geMhXg4kDIWmTpfjJjxlP1h4yGyNHuXHRdx5kz5AHzD1
         eJwp5cMYC5JhCSH3r/YqMLvyWipQMrpXbg+FYcQRY6CzEhTTfCNnf6gqFB14Uf7S+wca
         I84P3fFPPlsazJBQa9do0iGFQsuo9KLw9xBpn+td1n4uTxnz7xbNe1hoqym+qiWLdgU8
         PqtiSTdnutB7iXL23jC39uG1kYYBSdWUgSTlWpen0e6JPx8Wl1t6f6TF1xPhl50mZl78
         AwaDgJKOVuuHgsuap71dSU6EI71rvfDfnNkKgstVaAEQMZYA+XlDkRy8K9cE00n2vy2J
         AtlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=2qaVQ9oigUVPJgxaZL7kiRuBj3IEl+889qkWIpVas/M=;
        b=DgvohW9L4sgury3Vth1mdNLY8EFr9AwDFm00WyrYBcErpqCP2RxEcKaAUm8GKQrx5M
         FVKDEP6IvCFJM0B5uKCSo9fXka949OEmjZPTnzZvin8wtxwIwWD7E9qfEqH0u2egdwGt
         Hb7QhTUoP9o8NGL1dvTPEZWnhWTYXtKeFi2abvqhChXSY91Oln+Cs1eDwApQB30li8zX
         WYP8ssyFWOuZFDhLVrct4qX6E6bfwUb3hIaHOtT1JwEL57l8nzEC1Nw8qxLsGDWF6wyN
         GRn93SO+Z8pdC5UDvvHWHhiJrqzSGUk40mTpUxn+1YpiFOkTYtdc1Nra//5yqRx+vaPc
         oe9Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2qaVQ9oigUVPJgxaZL7kiRuBj3IEl+889qkWIpVas/M=;
        b=S6oT25MFAu1IzZbFvlrpK5dp4kMgXMeNed5B08CepeMBpQoEkMeWcMIxmhVI6iLzWV
         CZQ/ong/0+LpbD7svnkEDg133aeZpguQvpS69O2pRDHvd772JS1BvwPZH4/UzWn/L4WV
         bZ+Xt9wO6oqRhLejsMjor27XNLLxCD4W4dslLO9lPdoAbo/aEi16VDMqEWmvzMfF4zTT
         RGjfjMIRa9UYN83JG3fVt4lgEFAyWLevgf02b/qA54yeBys76lQ5s0bOuMcLmNcPXIDo
         OI3xziqH4KnXbZqnpAWT/rUzzCpBvaQs6/7KgNyB6tXjo8tRiIsd3peZuYYI7yWNOFIO
         LOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=2qaVQ9oigUVPJgxaZL7kiRuBj3IEl+889qkWIpVas/M=;
        b=kWsn4PLwUiVprafGGBm3DbKFW7LAnDmStby1+6fKVRs88L5HL22dSGy1k8pvi7DpHa
         ZlFjHdGfRQb0QfuGKebjXpsjJgccxo9MZc2tiyxf8ViIubNNQqctQO4xDEvM9Q54BRu7
         JG/C6+NXJke3HhKwcruhSLhxN1zY2pB4ptJdBjhk36+dX+7JuO/ccxzAIKxVeL+2aSoS
         O4wc3+DG0YxPWQG0c+4iSiqW5i2QtgxmV7C9pgmuU11N0fBs81YxD7BHoplE9nQwFC3n
         szrZ+L4DwH7j/aqhbT3Ubmvn5fJIRbPAvMnqGXhnE2EafyeNWAOtR4n2swHOLNPLIHJm
         HsZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWiRHpyLVdQXkqyGSvTvMkQbxioXWHZkzj6Is0Df1364vAUtRhJ
	pG9m0tI7gKkpyD0Wy9mhLV4=
X-Google-Smtp-Source: APXvYqy2/1qLriqYD7cQZINfMd7GyNSpTpcsRrI7AqBbk4HvuGf63zIiSSJgkR/f0BnnLrD8Dia2zA==
X-Received: by 2002:a17:906:7043:: with SMTP id r3mr9956136ejj.135.1561744866840;
        Fri, 28 Jun 2019 11:01:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7f15:: with SMTP id d21ls797299ejr.1.gmail; Fri, 28
 Jun 2019 11:01:05 -0700 (PDT)
X-Received: by 2002:a17:906:1302:: with SMTP id w2mr8524373ejb.308.1561744865840;
        Fri, 28 Jun 2019 11:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561744865; cv=none;
        d=google.com; s=arc-20160816;
        b=DLHjHb8iSm7BbusYJemaiybZAnuBFCD4j2WMgqHgCnIg4ys0ikkBmJJjiUqQnQTCmV
         YU9CeDnOPS+JbUPenfdk7pCv+ZhcAnzMQv3PNOl9wE9eiulxxEMBS19EfBXR5QnJfa4g
         /cNO6Q/ivbDRzZPmA7BmHyGfQww15SWfWVn/r09eqhSaQn5Zzy7jhsU7NxK4QRHsI0lV
         wkUQ3Lw5L6pB1m90RPo5sSIwFicLfYIOQ9xYy/LUr92eXMeE04IaneceACMbnx0jm3fV
         UbqnFRVT/bQeFJx4FL4RXEmaOdmlMh3hutElO5DrIiGftMVsFL8TZn4MYBzzZD/LrEDS
         StBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=DbvaUXtzWMBPwz+RXqjXQjRTBmrc4UDtywBlFSXnx40=;
        b=sIHmmhmRrS/tY/UcmEE9xJ0hzx+ytFyPPiPtTYX91/e4Ib5F0DIKUNppFQz2HQ9IkC
         i7wtL39dQ/EOEhH87cKfEqkUVHQTm9nU7Cy+tuT+dVWse3wHetnorBXqGuDffOyjtzGJ
         885nDkGEGl/ihG1XsMsI9NoIt4k8WkFiRB6Jo1JoLfowWQ+5vNlXPoHLkZ96OdRmo4hA
         R5yjDNLXDL4tFKnADrOt6MTP6RHxvV8fLIuEDkuhiX5H/oYQB6lHldhiG3/fm11P68qx
         siV3nQer8JsulDT1RaR9HhABaJCN7V79LbKYQ6C/O5SJy762RaRKa3Jhh7L2A+ARM9cq
         VErg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id h23si200505edb.2.2019.06.28.11.01.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 11:01:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x5SI14AO010096
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jun 2019 20:01:05 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5SI142h030442;
	Fri, 28 Jun 2019 20:01:04 +0200
Subject: Re: [PATCH] core: Fix aligned_start calculation in
 page_alloc_internal()
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com, nsekhar@ti.com
References: <20190628153601.20850-1-p-yadav1@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <75aaa37a-7df3-794a-6372-5db258137555@siemens.com>
Date: Fri, 28 Jun 2019 20:01:02 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190628153601.20850-1-p-yadav1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 28.06.19 17:36, 'Pratyush Yadav' via Jailhouse wrote:
> Right now, page_alloc_aligned() can fail to give aligned pages when more
> than one page is being allocated. This is because the aligned_start
> calculation is flawed.
> 
> Taking an example from a test case, let's say 8 pages need to be
> allocated. This means an alignment of 15 bits. The mask here is 0x7. If
> the page pool's base address is 0xffffc021f000, this gives us
> aligned_start = 0x7. This start is clearly not aligned at a 15 bits
> boundary (3 bits after shifting by PAGE_SHIFT). It is exactly the
> opposite. It will never be aligned except when the page pool start also
> happens to be aligned at that boundary.
> 
> In the above example, the address of the pointer returned was
> 0xffffc026e000 which is clearly not 15-bit aligned.
> 
> This change fixes this problem. First, zero out the mask bits. This
> makes the address less than the pool start, so add mask + 1 to it. Since
> zeroing out the bottom mask bits means the maximum reduction in the
> address can be mask (when all those bits are 1), adding mask + 1 means
> the resultant address is always greater than page pool start. In fact,
> it is the first aligned address after the pool start.
> 
> This calculation fails when pool_start is already aligned. It gives
> an aligned address, but it is the first aligned address after
> pool_start, not pool_start itself. So don't do anything in that case.
> 
> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
> ---
>   hypervisor/paging.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/hypervisor/paging.c b/hypervisor/paging.c
> index 16687a89..5f5d0066 100644
> --- a/hypervisor/paging.c
> +++ b/hypervisor/paging.c
> @@ -105,13 +105,21 @@ static unsigned long find_next_free_page(struct page_pool *pool,
>   static void *page_alloc_internal(struct page_pool *pool, unsigned int num,
>   				 unsigned long align_mask)
>   {
> -	/* The pool itself might not be aligned as required. */
> -	unsigned long aligned_start =
> -		((unsigned long)pool->base_address >> PAGE_SHIFT) & align_mask;
> -	unsigned long next = aligned_start;
> -	unsigned long start, last;
> +	unsigned long aligned_start, pool_start, next, start, last;
>   	unsigned int allocated;
>   
> +	pool_start = (unsigned long)pool->base_address >> PAGE_SHIFT;
> +
> +	/* The pool itself might not be aligned as required. */
> +	if (pool_start & align_mask)
> +		aligned_start = (pool_start & (~align_mask)) + align_mask + 1;
> +	else
> +		aligned_start = pool_start;
> +
> +	/* We need an offset from page pool start. */
> +	aligned_start -= pool_start;
> +	next = aligned_start;
> +
>   restart:
>   	/* Forward the search start to the next aligned page. */
>   	if ((next - aligned_start) & align_mask)
> 

Good catch! Can be done a little bit simpler, though:

aligned_start = ((pool_start + align_mask) & ~align_mask) - pool_start;

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/75aaa37a-7df3-794a-6372-5db258137555%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
