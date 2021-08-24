Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJGKSWEQMGQENRNLWEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BB63F6B01
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 23:31:17 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id w18-20020ac25d520000b02903c5ff81b281sf6562910lfd.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 14:31:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629840676; cv=pass;
        d=google.com; s=arc-20160816;
        b=JwzY7JokTq+DRpn17LSopAM4xNUb92G3320ZhPu679GEm17YiOALycxxn1J5NIntP4
         bCnrb7FxtzAC8DinH+ioljziCjQj+9u0DgBO0bDA2fookT/iR3GrgMUfIUP5t6CnvBlk
         XkAwFa5bIlejo3eVRfknj5mDb+GzTMFLlKEiqSe3wAIqlkufVjsbnB8BogBsTvPZ+h0P
         bZaZGvZ1PJnnG0URIkn3ogARfHDKH3RTURkvxfe00j6dX+BF0c1n5zAk3ulh7oiwe6ur
         eHXqWOmpzIznhXQ4EsmRUF+M+Cuksk5mAuiFdVP2Zf8Fq1IwY1EfTNLfFv1P5MaYRiPr
         oF1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Ng34GazY9yC2p3s0Y2DsWIdfOFr2qeGXn/mKY4YUShM=;
        b=y7JYOCJ4LCqMWSkY2w/Xy6oRHH9mRwR0WMF4RUL6mJF3iN98On/gyXla3rOcemBCom
         Ji/70lQ6UG8z80xu0rtuh+hQqQEeyi+Tq8fQxlw0/LTPOjOkfIIJMujsDUGRS8LPUg79
         FylYiNyYxK4M+a5hVpmVwkR6TlVVuu84zG22X3kOUuC0k4iYq69pc073rC5a0Ow3z9zp
         LRQK7Ofdo/DVe+/7anMHA6/iVacP/JXUpbygl+Tq3tFs2vqMPQxBClrcPOiXTqHeAnun
         U8pghB6bqL889SCWKKA+pdkkas9dMA94RRDh76/KL83p4SBpBXm9fwL7hGIeyUBo3+kP
         o9+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ng34GazY9yC2p3s0Y2DsWIdfOFr2qeGXn/mKY4YUShM=;
        b=qrqRBlZGtx4vahmJ5wzvVrBXXmz7AuQtDHgM1iePigCLso3eDPbNKYW83gFvzlz4M7
         HbjQeFCUX7nRdrZP1YWLH7QFIPc3Wl5qJoInafig8rcyd7+qbT63fpgDcg2UdY53Dp0i
         TXrBwkZltMg88zvimcTlLV9h9jy6jBmFxc6kx6oYu6SOxxuZcmE+ijOanwJX1cbDBHHV
         H5hUrX/b3/yXzkMXrLf3ULsflzKq5pGlftfYarMB0ebm/HsqVP4PhmTyDl1YvgKXFIxx
         QqTCDD7KRg5aodA4aMFFXYCm8In855Wo6uO0fxKwYRbZXT23K6uhwqpnn32JVexhUfTd
         OAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Ng34GazY9yC2p3s0Y2DsWIdfOFr2qeGXn/mKY4YUShM=;
        b=oteZuPJAmH5HYm4HN/qUM6KDHrvpcqiw2VPGITy6E5g45waqaydqWTuSDkiWFxgxIb
         uSg7TcunEJYf2rr3n6ywPA8tWmY8ji6AP4hBjcuq8pyaj0oLcTqQYLn+26kLzJBj1pgH
         fhhFNyiVg6WM4+sZdlRhXo5tKmwrB87GwiO9thB2c+i69FQsvWbo5/G3d10ZcC+BmqJV
         n4S1j5WDwYmD5tP5VIeskI9DU9qpdLuJn3qJt+PKQK/8hyOKzoEoE0EI6QKNQ5JalXrt
         MKrM92HeJvVp2avmBjHdb6YQKRvr7MB18LGVcu8UoWIurTdwz+D+gMUAL/WJ67fLjUxj
         XRfQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Df8njQ0tYJuLEhwWwV0jpyU9hoh8yQCFU2ynU176gEz4qa9yR
	2FM9Tv5iQN5CptQuZDbR6cU=
X-Google-Smtp-Source: ABdhPJwfFYon1cL+aZBK0tIgaJmOpXqDEVsfPoGdxXkymMZUtu6CtnmHqkRw7SAvLE1qhonIOrWCXw==
X-Received: by 2002:a2e:9ec8:: with SMTP id h8mr33470743ljk.454.1629840676473;
        Tue, 24 Aug 2021 14:31:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1783:: with SMTP id bn3ls10296ljb.10.gmail; Tue, 24
 Aug 2021 14:31:14 -0700 (PDT)
X-Received: by 2002:a2e:b4a5:: with SMTP id q5mr32896875ljm.11.1629840674204;
        Tue, 24 Aug 2021 14:31:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629840674; cv=none;
        d=google.com; s=arc-20160816;
        b=xIhQugJIrPfqu2K6eBLwtxV3/IQzjzp11EeOpvZVRDrB+5fAOyXPEOy33DxVTlxQoM
         TEMG6lx5pHkBzKhM9OTaowD6CRrknjpi7GsA1Fo/nUFwAYwHy8QsiHwzj5E7UAT8/yju
         IXlsOh9z+EFsYkMlgrDYRECXCWBBSkjpnZcuja4J334cUGMlTa8lVQAc/MAABrp/3hWt
         ycbZn1TwIPnVHg5/x7LMAOQUgK1wrWoB6AysOd+EhUo6aO7zXlysuwn8s6LmBGYgafT6
         eYiQj1lxbbgyL5v/kwaOz2dPiHdK9Ndbhs6bBCo/4Hh8nWQR5iFvk0LPrz69efA9osew
         ONIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=DTWBl9icMzfYV9vyL439ijWuxq0yFwTst5t2M3vB7zI=;
        b=Y7WVNsCJ71nubD0ergpcy4XQiDGdyv6jeGUR53uLtjP/hRQAsbey79YLMGcPmL5rtz
         2qoEyIoyZXOFJ5TBFX96zISRECV+2vvGIKXzbSTCzzMG/z24lxS3EYR8FDbvB8w68ZiG
         qQ3GK1AhCdAJMDtxCDwRuklW3d0k36nJYh7dv0NSecirhtI6od4MPpCPGwiplM31QM1W
         +Rx7xWi/CrWbp1LgrQ7dTeWOJkVYeFWlhcN5znKJGUv7l4q48yOh07aZdZJyECP+myKk
         QRaqDLVOow3byEfftpnpm+bsTCXFl1B2AhV81VNDwCOcA00r5lwPjsJE9paPdWCkTDWn
         p1Dw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z4si397849lfr.2.2021.08.24.14.31.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Aug 2021 14:31:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 17OLVDOY020618
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 23:31:13 +0200
Received: from [167.87.75.154] ([167.87.75.154])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17OLVC2g031759;
	Tue, 24 Aug 2021 23:31:13 +0200
Subject: Re: [PATCH 6/6] x86/cat.c: Add COS re-use in cells with same mask.
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR02MB6670F14BBC726C44E8200B2CB6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <78cee6dc-73bd-c7c2-560e-af59243f5eca@siemens.com>
Date: Tue, 24 Aug 2021 23:31:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <PA4PR02MB6670F14BBC726C44E8200B2CB6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
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

On 02.02.21 17:44, Bram Hooimeijer wrote:
> Upon cell creation, check whether there exists a cell with an identical
> mask as should be created now. In that case, reuse that cell's COS, to
> increase the number of available COS's.
> 
> Recent Intel Xeon Processors, which have CAT support, can have up to 28
> cores. This might exceed the number of COSes available, as this
> typically relates to the number of cache ways rather than the number of
> cores on the processor. Therefore, creating a cell per core which is
> isolated from the root becomes impossible if each core requires a
> private COS.
> 
> Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
> ---
>  hypervisor/arch/x86/cat.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
> index c91560a2..fc943a0d 100644
> --- a/hypervisor/arch/x86/cat.c
> +++ b/hypervisor/arch/x86/cat.c
> @@ -45,14 +45,22 @@ static void cat_update_cell(struct cell *cell)
>  			public_per_cpu(cpu)->update_cat = true;
>  }
>  
> -static u32 get_free_cos(void)
> +static u32 get_suitable_cos(struct cell *cell)
>  {
> -	struct cell *cell;
> +	struct cell *other_cell;
>  	u32 cos = 0;
>  
> +	/* Check whether a COS can be reused.
> +	 *
> +	 * Never reuse the ROOT_COS, as the corresponding CBM can be changed
> +	 * when new cells are made, collaterally impacting the created cell. */
> +	for_each_non_root_cell(other_cell)
> +		if (cell->arch.cat_mask == other_cell->arch.cat_mask)
> +			return other_cell->arch.cos;
> +
>  retry:
> -	for_each_cell(cell)
> -		if (cell->arch.cos == cos) {
> +	for_each_cell(other_cell)
> +		if (other_cell->arch.cos == cos) {
>  			cos++;
>  			goto retry;
>  		}
> @@ -166,12 +174,6 @@ static int cat_cell_init(struct cell *cell)
>  		return 0;
>  
>  	if (cell->config->num_cache_regions > 0) {
> -		if (cell != &root_cell) {
> -			cell->arch.cos = get_free_cos();
> -			if (cell->arch.cos > (u32)cos_max)
> -				return trace_error(-EBUSY);
> -		}
> -
>  		cache = jailhouse_cell_cache_regions(cell->config);
>  
>  		if (cell->config->num_cache_regions != 1 ||
> @@ -183,6 +185,12 @@ static int cat_cell_init(struct cell *cell)
>  		cell->arch.cat_mask =
>  			BIT_MASK(cache->start + cache->size - 1, cache->start);
>  
> +		if (cell != &root_cell) {
> +			cell->arch.cos = get_suitable_cos(cell);
> +			if (cell->arch.cos > (u32)cos_max)
> +				return trace_error(-EBUSY);
> +		}
> +
>  		if (cell != &root_cell &&
>  		    !(cache->flags & JAILHOUSE_CACHE_ROOTSHARED) &&
>  		    (root_cell.arch.cat_mask & cell->arch.cat_mask) != 0)
> 

OK, I suppose this patch needs patch 2, right?

I wonder if we cannot achieve this via offline configuration as well.
These are the new config data structures I plan to introduce:

/* cache types */
#define JAILHOUSE_CACHE_L2              0x00
#define JAILHOUSE_CACHE_L3              0x01

/* cache flags */
#define JAILHOUSE_CACHE_ROOTSHARED      0x01
#define JAILHOUSE_CACHE_CODE_ONLY       0x02
#define JAILHOUSE_CACHE_DATA_ONLY       0x04

struct jailhouse_cache {
        __u32 start;
        __u32 size;
        __u16 id;
        __u8 type;
        __u8 flags;
} __attribute__((packed));

#define JAILHOUSE_MAX_CPU_CACHE_REGIONS 4

struct jailhouse_cpu {
        __u64 phys_id;
        __u16 cache_regions[JAILHOUSE_MAX_CPU_CACHE_REGIONS];
} __attribute__((packed));

cache_regions will refer to jailhouse_cache entries by their 'id'. Maybe
we can also derive the COS ID from that. But this isn't fully thought
through yet, specifically regarding the scenario of both L2 and L3 cache
configurations (not sure if such CPUs already exists).

I'm not a fan of too much logic in the hypervisor if allocation could
already be done upfront.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/78cee6dc-73bd-c7c2-560e-af59243f5eca%40siemens.com.
