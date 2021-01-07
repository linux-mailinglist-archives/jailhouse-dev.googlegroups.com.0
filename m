Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBD6O3P7QKGQEBF4SDBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD892ECE19
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Jan 2021 11:48:48 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id a10sf6213487lfg.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Jan 2021 02:48:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610016528; cv=pass;
        d=google.com; s=arc-20160816;
        b=n+M3emU/SLGOKFKXNYet60eETwOdAccZZQUeVYa7YlXQnRFNG9YAPjlTzBK3AIzRUo
         PsHOpPaDIpbkDcya3tMTdufEjmU2o5QdGBoaMusvOG1ev2vaVqiOrFypEYMGAVwRlkHo
         1JTXtMG5sjKLY+7lz0NtzPaORYwR2lz8erKtDsWntCrhXnsHPUgLf8QaO9AzwUwWbc5d
         wR5pcaV9gYlpRVROMl7cxlQI+g12l8LoVnXQGhLOtSl007bH9mygxj/cAndG6/Xka1XP
         RoEXp+QpyIZs+0yV8ZcJpJW2kfJcUnlz3lGIJ8/nQFK2ubfjCtuDQ/fx56VIOyXh5tuT
         D6kg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=SoeQoIrxwMpgyziSJ/rTTT00qncrqHwIqjAJ4kAhB14=;
        b=08etQt4Kdp6G2mKWWK49XZpt7m9iPGgPX84SzFKfYvDv3m+sVOMRPq7XVP1Y/sX+So
         TUO5GKwNADGTePdkTnuWmzg4KnsXiLXTaQeFpXeW0jAD51R2E8wRLd+bLDY4yYqHl/Bz
         YSXxhvkefyywHYc8ePdMTTN2l/HPWbkOUwX1DZzTKAjkSTmAm/u1umwSQvjmARZqtRes
         Jd8Hzw9qgdyRkr96UjW/VZUEGclajB33LOtDynl9KH0CAW944dXT1/ZWKY7u/KgVQXxb
         XCjE8txybgJQzceJH2uAdx0ghccWQ/V9UUuTjLsZv+1llIS1u8XapdgimZ5WwcaxpAAR
         oefg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SoeQoIrxwMpgyziSJ/rTTT00qncrqHwIqjAJ4kAhB14=;
        b=Y6BU4TxlzxIPtKJoSTuPqJNgSmecsP5+fKwSSFsj6/3zq1eTJktRv7WPf742tngrCO
         xLMqHTzN27TaSxKDFW8rJojEeKxzgV5UuwEi/1cPgsAFj7hNJRR/d6RLvVXsjxYBJwTm
         +zHrLqvEUXvC6AmLyNEldeCkL9iq1Roxf6/lUTcUK1UwznaT+pqPX1Asz/IOPT2dRgw4
         gqebaFwE8Puc8ipFU/xs/lWYrMH/h9nuqGcts37l5RQ4PENQfJ5OTs7uZeV00HV7TZVD
         g5GdkFm9ySwf3DA2c0ZCbNnfMP/rspg6NQA3xzDx9vlZdaE3zitt3j2pPbz9fwWl6R5i
         UjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SoeQoIrxwMpgyziSJ/rTTT00qncrqHwIqjAJ4kAhB14=;
        b=i3G+9xSBZPtzv5/JlOuet27JQFO/JuNw+JbniYFE5mDnW8LvsnIMTy0T22B3kPgAsH
         qOQs2+ttgkSBuCTwDdzUNpG8j7pmEnvcyUj+xxfDo4m6HAnKew8WvyTbE7bW9wYBtSa3
         5g5mCq/7Pe6FNNd4THepob17G5s33wkF7SchjrcnUpe/lUhGMoVAVE7mG4JVDACEQIv8
         6uA+1dp4sdi3hUDe+Xa3HZqWgkXFFWL0qUOqbnd4gmYquvosA94f84TYNCGnSaqWZyho
         wjm3NWM81OeZF7YtuSjcMdgsf5dHbgoypcq6Yl5rkcPxrHPk2zV2bPC+zsRYkN3cubqI
         jjgQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5311E2fLHroMK8EG/JUkz3iAxCg1MImYiu91jc7pwA6/JpriR9Q6
	TKMKdVSdVfzPq1ZdPSP9E3I=
X-Google-Smtp-Source: ABdhPJwptLQKI8jhBtgICEC+OKzfL0ZRI820VItmy5cmS434a3rfRbG3/s7WXP3vVh3XfYG4ZzkpZg==
X-Received: by 2002:a2e:b5b5:: with SMTP id f21mr3720012ljn.239.1610016528113;
        Thu, 07 Jan 2021 02:48:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c1cd:: with SMTP id r196ls140581lff.1.gmail; Thu, 07 Jan
 2021 02:48:46 -0800 (PST)
X-Received: by 2002:a19:cc05:: with SMTP id c5mr3607633lfg.393.1610016526833;
        Thu, 07 Jan 2021 02:48:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610016526; cv=none;
        d=google.com; s=arc-20160816;
        b=uWmFtQG5V3okv3QXcotlnzTzVagUMkVFwXV4yVyn/1kgwqhAIppXVnWFehiZtEcOcs
         euokX5oinw8pRiXkddjE/mKXcpGr6PgwxtkwLLV7QnV+d0+VQgjZ4vBRYZmRm6O0KFWI
         hcn+du/In31Ikg4igd9mrCKxxroBC2L+JtgZoHfEGd9SIbGM5X1+BDDX2yM8lESx/B7R
         b//muhSdcYIHT54NvVquy9iyjhzRdDC1GXGR4AIEfZYkg2W+F4/n9XSPhVMyGk24c0yE
         VE3LmFi9pjkf3h5qUOHVxEzHBcjkdvUfJ0R9bgGXIaLEF2nIma5YuVn1gbFyOOZr1MYL
         PrWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=K/taCqVa+WLCLLS1TOvmh27AjkjjT+595utytcXHp6k=;
        b=vP5vnUZXY0WGsqsKTJ63BRMgs7CVmeyVt4uPhBKKoEI5A5Z4aWc/hmBNATrNc+nzKg
         ofd2Jv1nWjK2Q8mL83J9j4yrHKzIpjJPWranGNoeRmr6DwZ7Ka0N3saXEC0vPAyejFQV
         KjEpwkje9gHgpncSp/lu6iiJOYse3h/+3roMSqCV4UwgM+WUuEh1P8PW/ATJiOv1I1dA
         /wqTSmYLFSeHfeEIs7w6Tj/Fvw8zUzk3Ux7tlmJ5ni9UUw2A09DIYaexrngUT0ojT6G9
         PQsWb2ngxR0IQS2NXELXUn+InoAft+JYPgrARb27u/r4SJuuDjZIVYnRA1L5PiIbqm1B
         YSGw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id c15si330760ljn.0.2021.01.07.02.48.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jan 2021 02:48:46 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 107AmjhT002471
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Jan 2021 11:48:46 +0100
Received: from [167.87.32.120] ([167.87.32.120])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 107AmjtT016372;
	Thu, 7 Jan 2021 11:48:45 +0100
Subject: Re: [PATCH v1] imx8mm: fix ivshmem flags
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20210105101955.4419-1-alice.guo@oss.nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e72cc5a5-c637-4584-21f8-887740ead880@siemens.com>
Date: Thu, 7 Jan 2021 11:48:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105101955.4419-1-alice.guo@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 05.01.21 11:19, Alice Guo (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The inmate linux should have root shared flag set for ivshmem region
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  configs/arm64/imx8mm-linux-demo.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/configs/arm64/imx8mm-linux-demo.c b/configs/arm64/imx8mm-linux-demo.c
> index a3e85c0a..196740cf 100644
> --- a/configs/arm64/imx8mm-linux-demo.c
> +++ b/configs/arm64/imx8mm-linux-demo.c
> @@ -47,34 +47,36 @@ struct {
>  			.phys_start = 0xbba00000,
>  			.virt_start = 0xbba00000,
>  			.size = 0x1000,
> -			.flags = JAILHOUSE_MEM_READ ,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		{
>  			.phys_start = 0xbba01000,
>  			.virt_start = 0xbba01000,
>  			.size = 0x9000,
> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		{
>  			.phys_start = 0xbba0a000,
>  			.virt_start = 0xbba0a000,
>  			.size = 0x2000,
> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		{
>  			.phys_start = 0xbba0c000,
>  			.virt_start = 0xbba0c000,
>  			.size = 0x2000,
> -			.flags = JAILHOUSE_MEM_READ,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		{
>  			.phys_start = 0xbba0e000,
>  			.virt_start = 0xbba0e000,
>  			.size = 0x2000,
> -			.flags = JAILHOUSE_MEM_READ,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
>  		},
>  		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0xbbb00000, 0),
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xbbb00000, 1),
>  		/* UART2 earlycon */ {
>  			.phys_start = 0x30890000,
>  			.virt_start = 0x30890000,
> @@ -143,7 +145,7 @@ struct {
>  	.pci_devices = {
>  		{ /* IVSHMEM 00:00.0 (demo) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 1,
> +			.domain = 0,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 0,
> 

Thanks, applied.

We should add consistency tests to "jailhouse config check" for ivshmem
as well...

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e72cc5a5-c637-4584-21f8-887740ead880%40siemens.com.
