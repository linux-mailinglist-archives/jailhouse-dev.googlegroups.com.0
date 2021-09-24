Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBMHIW6FAMGQEINDK3MI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 84424417807
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Sep 2021 17:52:17 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id g9-20020a0565123b8900b003f33a027130sf9512906lfv.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Sep 2021 08:52:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632498737; cv=pass;
        d=google.com; s=arc-20160816;
        b=YCloKFJIhOvqj57ObF7IHwsTObyTKMUC8ZOAWVAzG994DH87H0lLmzUfO3rY9qFISo
         6Ma04BB8siVEOhNIb+DwLGojoSdaAFz0TkLBP7cg07S0EsqBbHihmNTYmADumMS/tpFF
         VWHGqSNExb8r8ctcz10U4n+g1MF6ZHkvvUEICprZ+g0sGGFs4DJ6kIgYHKLVauniK4Wi
         B9Zt7UGeoDTPpm52t6Xsxp4Nly+bzQsnEehMRoSl7Jr/dZFMGAa/OyxQKzECSgGGqljR
         68+ixY49vUe7L4zevt03vlaz9BIM7Ttr+etSD4o5FCWwFisw4JHGZz690o4ocnxml91N
         yC2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=WclUIHe3nBoJVpdvJWLjHDmiC0j5jLH2obuN+pdrHPQ=;
        b=jUJiAxyP00hZ/29HrEnsXvGfreY4qV8Xfiuh8QJlZsLu2o1K/ZX4D+KDYg6JOlSldw
         2sZ/ovZbraMwwzm8a6o73mZmhPa3ipxH7cgeN62VY5vxIbZyQkNUFpBxHBL+n4t2GrQO
         z1kzVatAcO/We4nw43V/FHzwYwAAaOyXxRjglnIhwtXJphiJLtMwDS8zcsAUSm0aB4eY
         hRds/DbgGkpPiJJcyCWYrrjl7HVqzuNU3ZCHSCr9njVZlhNHcqC3hrG3chh4BbEbl/cG
         XZ7dOiELF1Lnxf8206f75L4XGaGIQ7XC1IMKW3AZbJ6lViTEzsiNB4Oc70QdSUspMLq1
         vsXg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cQfpQOq2;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WclUIHe3nBoJVpdvJWLjHDmiC0j5jLH2obuN+pdrHPQ=;
        b=gUZL9+4W21P3K82SYiIzmTXo75QjjOImvWShflybcxiPEAc3rs6tZCr5qdpKVAWC+j
         3FdL+6RPRC7iDRgp91RL10X0GKeyO76YRWsGYKwhGcq+74oIqsYwPcwl8LsTu+49XDfZ
         EeCnU7mlTjcAU0TIHCUpVif1p/OM4RBay4kALNocSnF/yiTrc2L3iyOJyvUb7RaZJ/h0
         SQ1avifBZlmgP958lXtMh7RwhjSMbSzB/4OreaU42AFvkJVcDA0vfkGKi6llj1QT9yvN
         tOV+/C5x2mXqgAsWrurQn+KQNb1ZtD9C6zL0IPVCqEQV6jl9nV5HjIxsfsJePGrGBz/i
         LKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WclUIHe3nBoJVpdvJWLjHDmiC0j5jLH2obuN+pdrHPQ=;
        b=qG6HbbvDqZV1ploZ082JG0rW5seJP1vw2Jp/0oUFFqxvMO8xB3DB3Zubq+LvJzfv9E
         PKAvEcz2Ioj5tt1qbeHMT89/RPZfaxwz7/qi7BJURaUXDv25ighfDHp2X1ToRXIDOxsp
         lYRFVFFALIRBWTSh3SIEQvzHrERAAcSK4WvTrmX9GVsp4Ad9JFO6+aED3rzVxao9NT13
         JWHkUgZh3HdUzvE4g1jmaGcc769EPongYBE+Nuz3QE/JuuDUCQFYYkM4tsEcSwqwdLez
         XovV7dyNYonABoj2DYkQ53zCPrSyqSGPagA1ErIb6S61Ka+2JnF6Q5xdp6wyGnrUqKCe
         r6cA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531N8ldPkWjMRG3lmI6/bwvfR7i44OhGRneX0Cf+twQeSRYh4eVu
	1/NUg7O0OCe05/5FCt/KXzo=
X-Google-Smtp-Source: ABdhPJzcc0EYOAGm6GWztg60gfOajws2/584QmPaFN8/6QfOfefE2hiM26MHM691vwh4nSH+t/1q9g==
X-Received: by 2002:a2e:5c08:: with SMTP id q8mr12152396ljb.329.1632498737043;
        Fri, 24 Sep 2021 08:52:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:2119:: with SMTP id a25ls1978756ljq.9.gmail; Fri,
 24 Sep 2021 08:52:16 -0700 (PDT)
X-Received: by 2002:a05:651c:1584:: with SMTP id h4mr11975500ljq.301.1632498736015;
        Fri, 24 Sep 2021 08:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632498736; cv=none;
        d=google.com; s=arc-20160816;
        b=AMLPBxu2gLn2spLdunsxTrJEb7wJnBHQXvtrppeZwBuOTPHAYTFSiR6OcyDU4LyKx4
         YSs200ET7U7fKEjzzoYRAacZgcXL5UMpLFdSkkGwtxSALSvT+DujbKvl/nKqJ7w88wtN
         hveSvhEa6sp3YXVurvx1WFas9XPqukg40UerRUe09tIO00ZKW1NvDjdL/2ZLdeIxSckI
         wgr8LoqGzMyNkZMSHxBRtvwu48QVqKafz40K9TDUKhdmC5SvC7+Brc4vImCktvbKGbQX
         5RYCeR2CU0x1T3Tad7d+9jldQqEfiSMtAWWYwJCZ8yjQjxgLO87ZOuQlCWvivtCRD/aY
         NJSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=uy3o3mqpjCkRafcJvNo7Jh2z39II87BKHSn8fuTBsw8=;
        b=FseXmbH6kha/yxLUwDqRuD9KTqkwU+SsG0Sl65KP2r+gE249TAUDyJcDHrXmjBtgEV
         oaGZP/lKH6D4I4/kyvH8Uxl9eIkisFfpxXLngvG5OaOxT9lxvK8Y/8cHhTxIqUp8Q4Bs
         KjvbBuI+myVOETwy26oqzEptd0JzQqprqze0yeDV2Z2S8/uMtGxckBTZAh+O5//u3SMa
         IC+7qZ8kWRMNTKbB04P0ycAI0VC1BdEE7u5DlqxQ7q2wOee2E5Jdhge9oSLTyNlxUG5D
         Z+h/bB2845did6V8I9NyYNSKgV0ElENgbxzwkq1qb13qfpbMdrUSj+U4dE2tu18VAdw9
         I7IQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cQfpQOq2;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id m7si594390lfq.0.2021.09.24.08.52.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:52:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.84.132]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mfc8o-1n537n19Me-00gKpk; Fri, 24
 Sep 2021 17:52:15 +0200
Subject: Re: ioremap_page_range force nx in linux 5.15
To: Peng Fan <peng.fan@nxp.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <DB6PR0402MB276022E2F0E48908180F2DA188A49@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <bb692a80-925b-ae39-1681-d98874810c5a@web.de>
Date: Fri, 24 Sep 2021 17:52:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB276022E2F0E48908180F2DA188A49@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:8FJsLRnXXgsMTjwQr+dBu0G3ycSzuvXEZyGY7Msp7R4Z277fM84
 4dLBZEPg62ryC1NUy0DDodx3XnDYRu2VJeknG6GTIZmbhXb6gkJ+B5VNOXEBMDvdFrnDAhh
 QSu2yRKJUF9+xvkM2nCnI6yaVill3xBab4lH14rH4TmQ/G3ehHo0FOAyDsPX7ViC+eTCxb0
 TxXjQydTbvsn42qf2GKGg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5T9gBVRq1v0=:imir5AMgCTc5KsIU6b9O9U
 9++P6YxT1ZJyPla4ytO5u/syfzE4Z8UVCGWglmRdF6yn9AdwQtNkPOhhKJh72qI5C7joWGWlF
 M1v6mS2gD0M+ZbuoB/bGNz8KzJa3aYu2sRHE2j79CcNE2ZiKAUzUizNpC9eRhOa+qC8hujoT4
 JBBHQ1p2nhMNi+b2o24zrQiKVvzkc7D27BPRceS7uU6mGpVnWUoxt7bqYBqnBU0d90pF/uKxK
 rC+t/0Pb58SvL76tuTEKzIE1fbZuNXNbpN1zH3J6SxCLArbHgTEKbu/Dhnz9Qd7oxSqLLbira
 leAAjVk5qsNTsUUBK6DCk/7pR8dxpnuSUiTvm4Pd813z2j3B8PgGGhwEVH3yAO2ZeRMgXMhJw
 CJt2z7MWRURSjmI1N0SUtAdpCrEliby8BhA0Co6aeJBINo8xXcyQlbI+e0HgmcoHNYfuimEX+
 /u/c7oOJ6lnGJA2D1hPBWiKV5MzbKt0lbdo70R9TIEuZJf6FffBcJN0Q2VeHVq9ZSSD+dEyKT
 NAt6XWa/HUEbvZTSf4dwPFIaLw483wnS9xpE6dWxmJ4HW6X6I4vkoO3SemkLIGWgVuqXyqTP6
 09cnPAzqkilkkwIUAm92XM2xKOD3/HUPJv9XVKdS8KUcQjWnSY4+I/0ddRstBYml4pIPS672Z
 WEldnny99sYGWsztmBe9O31n8/g+9U0RB52r6V3rB4cTbQoBI8dcfPvU6QZhJnxG24p4y178M
 jQWNgtUcbcNgoA8E2qjkODyFSq2n2OPMgvW4UKSuGQyhw/6TGXlUndrmAW2faBjSzc8KMvWsN
 mJRyFO0YUgV2A3gHGxbKJU00RGmIpDMrshYj/5L2JThtotOCdx7S/0/pRbT5QKzPVC/MfeO0U
 VVy1pyY8NAMaAwZKoKQVfpc/ZyduUP+zSTKRdZNzY74B9Y8Dvry2X86NVrk7aYAYRJQ8azV+w
 E8Mu3hYPew1fU4wHzhQU/xiYwMS8QdjvDY1Kba+i/35YHp0OpRw66JuYPCoYv6IIi3rKZEwfr
 NxCNqkVLpDb2DFodJP8iyoinZCuRw+Ji7o2iK6ncqibfijAQXUK5zX8AmoyL2xNw77PiAcRiB
 oRyJJ806vtH9bY=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=cQfpQOq2;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 24.09.21 10:58, Peng Fan wrote:
> Jan,
>
> With the commit, enter_hypervisor->entry will not work anymore, because it is not
> executable now! Any suggestion?
>
> commit 8491502f787c4a902bd4f223b578ef47d3490264
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Tue Sep 7 19:56:04 2021 -0700
>
>     mm: don't allow executable ioremap mappings
>
>     There is no need to execute from iomem (and most platforms it is
>     impossible anyway), so add the pgprot_nx() call similar to vmap.
>
>     Link: https://lkml.kernel.org/r/20210824091259.1324527-3-hch@lst.de
>     Signed-off-by: Christoph Hellwig <hch@lst.de>
>     Cc: Nicholas Piggin <npiggin@gmail.com>
>     Cc: Peter Zijlstra <peterz@infradead.org>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>     Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index e44983fb2d156..3055f04b486bb 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -316,7 +316,7 @@ int ioremap_page_range(unsigned long addr, unsigned long end,
>  {
>         int err;
>
> -       err = vmap_range_noflush(addr, end, phys_addr, prot,
> +       err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
>                                  ioremap_max_page_shift);
>         flush_cache_vmap(addr, end);
>         return err;
>
> Thanks,
> Peng
>

Two options come to my mind:

 - carry another revert in the Jailhouse kernel branch (we already have
   some there...)

 - explore using a different mapping mechanism or a different page
   source that permit executable mappings for the trampoline pages
   (those used before activating Jailhouse's own mappings)

The latter would only work for arm64 so far (JAILHOUSE_BORROW_ROOT_PT),
but other archs should be converted to that scheme eventually.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bb692a80-925b-ae39-1681-d98874810c5a%40web.de.
