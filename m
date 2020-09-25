Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUG5W35QKGQEUMHSRKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5FB278315
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 10:48:17 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id f22sf794482ljh.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 01:48:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601023697; cv=pass;
        d=google.com; s=arc-20160816;
        b=wvz1WRY0Edgoy3u3JG6LtA7mxaWHxfIeTa/g+Rs6hmbViQRzoqrlaea7FierKnfWIU
         bt8VjNry1MDBc3Cx/I2wmb27MAGRmBmBmA6vvhXOnBXoooLThTi+vUPU9ulU5ffilMpr
         k3hbnRwHwqtD1RXl1+hW8bvfMOziWKSAtkgvds49+AsNZy+YTkdHx4NpFQasQPKO703y
         6gU7iBU011ZjIi/G4/nHHms5+R9f/4dIq41OyQ35XK5/3KFW11BeUWzRrKstOWWAgLny
         vbHu0nRyNjybftKI2HnYvVzjm0kcv9C5bfDJsnMrkClvR6QYhqjE/WzevU1s4g1qqQPD
         Na7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=blIg4IMIpwsMhGQI0+Ux1kdOzFIOEMo/uJRM+eXPZkQ=;
        b=vQ0yKVciS0LDS4y1PFM6iyQTwqov30w1tAcr8xC0max2WyVKcQsxovAstyZLWAcicf
         BEMLVYTu1sQ6JsK6BfuRHNxL6o5tSLJu0bUBHGXAV/HV2GIUhDnOqnXToi6f/ApAd4DU
         bMf0jB4sEFGTp6VD7W/6sXol+JXmTnU9iObEc1X8yymx2mjddphW6zc8YbWzokBy4FeQ
         RPJDyq4zjlsycUD8lNuH17/gPVfmIhXCBL8WoPKStEjVzQ7msOOfd/WuSr+0W+je8E4w
         HRda2n7sAAUOiD3wbFhVH/br5p6eW+2zJeFNgLdCfHBjfdDxYczSbuELANGxN7hV/hr0
         Y9Ag==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=blIg4IMIpwsMhGQI0+Ux1kdOzFIOEMo/uJRM+eXPZkQ=;
        b=MMN4/GswgV88EDpd9MAzGvJny4e+LVrBfGsC5pQayhOJ1+VYAiwCzTU3BKVpFvyXSC
         C03hj1JAPUgZTSyaozQXZFqgEcnAlBU30jv19t3Qp1w/vT4ruMHCIwyMNreBkrF2ko+4
         EhQNc/4ogcbs6UtN/FLDDkE2h5eQjZMNQCFVen+yiw++HuOWGgUTK+RQizQNMlvzoeyd
         5SSd0+oLQLrbytnqOn0M2Nt6jHOmP2STEOLzaDwGpCDEj9q4U6rga3IU3bsbyZ+5PvcV
         Xpvzq5BuFZ1JRxaoxgBd30pgkX9vnHvVvxIdI7aFSjbWaawu5eWHt+uZ3a/JcH0krSDb
         mcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=blIg4IMIpwsMhGQI0+Ux1kdOzFIOEMo/uJRM+eXPZkQ=;
        b=Eg5PYxk7l1Scq661mkP4PBnAjduQ6E5H0hcXPO4oXergO8E0oQwnPDPdl6ilrHNRy+
         S0ij9ryRGZb6eF3t1KNo5rExrRV8DAuAyoBa1ZAmplmS2ncH/A1FyES5XCmV/HHVoZON
         jRCVRMhhf5KH9L9ciO7NC8Zk6S2z2wFaGw/APL4IxkO+ggZiI6pf/VLIX+Loyf3zzb8b
         D1gNOzM7IR+AKdFFBQLXM2k+6VM1ujl2+snazIDf7RQEz0fB9ljNaLMxRvNt0X6zVhjo
         jF0CGu0tRCKVkt91JT4/uYT7cwc+KSSTAl/pWqha7sovTXf9vfTaXTuUDg3sWPgpd8QT
         xIQg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532FNfUQgF410NKBcHtTxR//CcVprkufERL/x2+8Q8ev4oeCEy10
	EQ1eOe5WLuALp70mITSlzIk=
X-Google-Smtp-Source: ABdhPJzZfYiIzqNwQp5pOerYJeWSyfx6TfxzRvvn4PX5xGU8T19tNrt1/yUgXSdpJGMjULfdQCgZZg==
X-Received: by 2002:a19:915d:: with SMTP id y29mr1064114lfj.371.1601023696941;
        Fri, 25 Sep 2020 01:48:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls161128lff.1.gmail; Fri, 25 Sep
 2020 01:48:15 -0700 (PDT)
X-Received: by 2002:a19:4846:: with SMTP id v67mr1083928lfa.345.1601023695584;
        Fri, 25 Sep 2020 01:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601023695; cv=none;
        d=google.com; s=arc-20160816;
        b=Ue6E4rtqB2sItwpKkx4CZwStjyeTV0EPwbQ4UJ7Ed7lEmQT/x+ofc1LC50a2dxm06S
         OQBE//U+d/snKnl1QYjNc3g2dOFqGTf8HaIFDb3xl9DfnjyZO+ULV1cnHWc7ouPrtT28
         koHVsMRAjm7ukAjYpaV3dvhFC0IvrdmvkNOty6RYpqROnr1VEokawYUXewTgLqMjYJZk
         +MeJxPs3K9cmK3QXX1qWYxN8QVbjxyXJiNj6pJwheZPcJCjqBgre7uPJ1vxF51EYPq5D
         /Z9Ll3gEwV/kLbwVpaZeh6UJkCVABPSSq5DOur7EYSB5t7zTurKE3DfklKoig3dKKddr
         cveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=/0UgL+gmktg21dqo0o478IlAe96mSu+xgQm5rcp2ul4=;
        b=Soq9EhSEughJeavEJfW3vZwqPKfLR1l6ZWzk+/6P70y2hou0zYl7v+b9TOkUzOjkMA
         V+0/RkIWFvMDgspa5Cmdhd+70bls7RaB40ev77Wg/IXgKU9EUbuWHK989W5vNZDmXBtQ
         mm1DyZOy3k+fCoy0uC59MEg+VXlYlmMOXZfhScNcTJBQ4Ju8zL4aZO0T9S2ZEwcw63ag
         7H50EH2A8i4TRSXxIzZBOnGed2kJTCZoDDAC+rbwJEifEhB5ch0btOpIka/79VTwdzFL
         KSFKZFBy4a/4NFMIgOgGclaFIw8FoufGzMGeI9r0BRWJPyGpyZAB1yhSZcvsu/ZVYTCa
         WPJg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id e1si65047ljg.6.2020.09.25.01.48.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 01:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 08P8mEgp028641
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 10:48:14 +0200
Received: from [139.22.133.254] ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P8mDmq026044;
	Fri, 25 Sep 2020 10:48:14 +0200
Subject: Re: [PATCH 2/2] inmates: x86: replace hardcoded constants
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20200923160745.580421-1-ralf.ramsauer@oth-regensburg.de>
 <20200923160745.580421-2-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f918c8f2-53af-2420-5631-d439615efdfd@siemens.com>
Date: Fri, 25 Sep 2020 10:48:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200923160745.580421-2-ralf.ramsauer@oth-regensburg.de>
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

On 23.09.20 18:07, Ralf Ramsauer wrote:
> Use this chance to s/loader_pdpt/pd/ in header-32.S. It's a page
> directory on x86-32 and not a page directory pointer table.
> 
> No functional change.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   inmates/lib/x86/header-32.S | 7 ++++---
>   inmates/lib/x86/header-64.S | 7 ++++---
>   2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/inmates/lib/x86/header-32.S b/inmates/lib/x86/header-32.S
> index afcd8bd1..911f430f 100644
> --- a/inmates/lib/x86/header-32.S
> +++ b/inmates/lib/x86/header-32.S
> @@ -47,7 +47,7 @@ start32:
>   	or $X86_CR4_PSE,%eax
>   	mov %eax,%cr4
>   
> -	mov $loader_pdpt,%eax
> +	mov $pd,%eax
>   	mov %eax,%cr3
>   
>   	mov $(X86_CR0_PG | X86_CR0_WP | X86_CR0_PE),%eax
> @@ -141,6 +141,7 @@ gdt_ptr:
>   
>   	.align(4096)
>   	.global loader_pdpt
> -loader_pdpt:
> -	.long	0x00000083
> +pd:
> +	/* ID map 4M@0x0 */
> +	.long	0x0 + (PAGE_FLAG_PS | PAGE_DEFAULT_FLAGS)
>   	.align(4096)
> diff --git a/inmates/lib/x86/header-64.S b/inmates/lib/x86/header-64.S
> index 4d5a7164..a71c018f 100644
> --- a/inmates/lib/x86/header-64.S
> +++ b/inmates/lib/x86/header-64.S
> @@ -143,13 +143,14 @@ gdt_ptr:
>   
>   	.align(4096)
>   pml4:
> -	.quad	pdpt + 0x003
> +	.quad	pdpt + PAGE_DEFAULT_FLAGS
>   
>   	.align(4096)
>   pdpt:
> -	.quad	pd + 0x003
> +	.quad	pd + PAGE_DEFAULT_FLAGS
>   
>   	.align(4096)
>   pd:
> -	.quad	0x0000000000000083
> +	/* ID map 2M@0x0 */
> +	.quad	0x0 + (PAGE_FLAG_PS | PAGE_DEFAULT_FLAGS)
>   	.align(4096)
> 

Thanks, applied both.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f918c8f2-53af-2420-5631-d439615efdfd%40siemens.com.
