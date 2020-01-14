Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBKE767YAKGQE3Y3VXCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 362D113AC4E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 15:26:49 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id o9sf2984372ljc.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 06:26:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579012008; cv=pass;
        d=google.com; s=arc-20160816;
        b=MmHecrjuZqxEULAMdA0Cni/LZtnvE/Qd1WAJZioT2+0DV4vgBHJbruFIDBcT/RdYa/
         NOfL4PBKUaPwJFbGOzApzS0nEzfGgHSGuCBTks2C5GsRq9A7LLbWf19p5YTgRA1LCYI9
         sro4b68N0MbeWuHt4vm0Cmix1c8QvJHGX9KBzEthss+gxHowDBPrFmrsWMLpcviWOUct
         IHx98vXRxfKhk1ivGJqHbl3VI1tjBVo2tOtsw2o6SeoG+e7wINsnk2d/bdbXUHHjqtz9
         5JhJynGsYfDxzhcxSKLtIQSgHaUq/VRIHncSdbARYUYhaynEd0LiYgCr/u5nAVR5RyHs
         24Ew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=tIJWoyQsrak+ncZD6S1jLI7e8iosA3s1/Q4R1FIxhAY=;
        b=KZJkoixlfnlhFk6ObdIokaOEnHS9MkykUng/Ky0JJEcvbcryLV9+4eVw2Q0xgcARYg
         288oBXSYSW6PgU2aTd1lijz8DoNn0l1rfnFU1M88UIbYD7SJecAvZHwTTXrno0hEWPhi
         Of+pBedFpc1oO83uUX4Jzts3STJ7Vcf//+S5rpP7CKXKWVLGMiWY7IacfRrdDcffzz+3
         1JdhSgSd8OsoClsGgmglgA89RZLaotJvmPfeXNEb8aFSVcmKz/a8lvrr2Vd6wVpbgNYa
         xcZGwcu4OKfWNpYAXFUtjUjCbdH/GAOyzRQYUA/OG4aNJUzZfSK2OUFtuQDWAgB58EB2
         11sQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dmmKkiFN;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tIJWoyQsrak+ncZD6S1jLI7e8iosA3s1/Q4R1FIxhAY=;
        b=P393DufsYtDb+8D0Cdna+eAIOnr2B72tGRFEwXS0G6T5HKLAqJDpXes8c/Qznk7dWu
         i/Vw+F8V3kScKgl3wZRCu50FtARwUD46VmDW6gRyswtTPNE4kRuSna/iI1KXH1vRQvGd
         s1M2z0mDlR5bxrWGZN2G2L84XuVUC9Cq9an0GnXPzptmrZsqatFOtNLER5nrr8yoNW+Q
         gMunzGIZz9NqWYstL8unXqDEwwPMmaYSL+6uJ3lnNhO83pa0yuvNZMCTfc4KG+WQaOFO
         Q+ScRcf9aE/KckpdnYH33lc7AZkpwOrJjeRsSKa6Or82pVAbed/faBXz19wgjBMEZeBm
         xVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tIJWoyQsrak+ncZD6S1jLI7e8iosA3s1/Q4R1FIxhAY=;
        b=HpXfIjStQ+A49W0LcAi1HPQ1N/3pqqb2sZFjxhBognDoJhey1nuYhY28gbGrr2MexM
         vefSzU9SdVrhlah5T4pQz441cZFM6oHwKfi9bJqxQBuA6jXyM+RoCf+9wD8U3NDvyMH3
         4ki4JHUoFL8ZijNTCB139jk6dK8IAPtneuujz5g9ddtrLJIddTtlTnfYKcTgHIyVGaVS
         pdcL1HZX59lEe5IFEiJHN142pjD8wIxq81F/+4WUXZ1FHalVr6IWPMELgH+7VB5INkEm
         oY5emgv+1QN1KPdZA1mAbPay/YkpkoVFFXwo5omuXjb/tNHUumkiEg2n5XX9KM0/Q1lq
         823Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXCGoFBNgTLNtRwgLwCzO6/dMpSp0/LsAkpYoX/VbYsBq+/O6jz
	WI/FJr75YwN7GP5NMMD6WTg=
X-Google-Smtp-Source: APXvYqxjQ+4Ox20mFNygGTnImu7OFiIXYoz5470Ks4cvZLGGb+C4Buv/UA3UyXCC1moNzb5mdC5ung==
X-Received: by 2002:a2e:800b:: with SMTP id j11mr14410987ljg.126.1579012008500;
        Tue, 14 Jan 2020 06:26:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:554a:: with SMTP id l10ls1465318lfk.14.gmail; Tue, 14
 Jan 2020 06:26:47 -0800 (PST)
X-Received: by 2002:ac2:52a3:: with SMTP id r3mr1824984lfm.189.1579012007870;
        Tue, 14 Jan 2020 06:26:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579012007; cv=none;
        d=google.com; s=arc-20160816;
        b=Yusq4m8avLwQJGqQxMmfSe4SIM0RY43ADgoNzjzb3nWmGGtShsw7zkYzxzOjTFtLvY
         4AFGPe4IeBwd+5AvtgY9rn4ibYcnbEzvbnSUASb7mayEhivBEn6MYX41XNsFY+BZxs3u
         Ew9/2Z0Gjc6BfiXjmz20hvaYnlvcnt1vvOr2i/eKp/qfYt5Dw8HVbrPScy6F4qwf7c2F
         yFfKLgN0kaGF87+u9QJ8UJUizt1nQRmXA0FozFk0v1A7mL6Z7yNTIi7NwMCEZ7CmSTox
         vOGXhkAzQcH7HqeMu7njK8kMNkhyRFWQAFtolvlfvSZG5FfLvVIsRzw9NL2UMkghTPNS
         SiIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=SlegtlQHC8KJIIsKCCuvSxJeO4fQC2H+7jPLBKKO04s=;
        b=J2mhWiqaooDI4G8Vn0RmgthTU1EZVvPEv8QNaEwkTIDNvE/fzE1Jk3a5vyHY/eA8ye
         iYxXjTzsYLLerBMZ4RK+WWKIshXkpGMqydcj8g8ZPJj5OzslUMLvyyjRAt33kGTwItly
         wsI0tpwhbnIOt/Qsh7XahWmzPJyCe+kwt4RBlMmMV1Un951JDWYKxguYvOH2UY3l9khS
         hzGnym64qe1utDddzkTvSNZsqpLlM6eBDJtXHvX42GpM3Y/XbIU2qNnUJPl7iJ+gPWcE
         WmIDajzZQCgw3bJtBaHGF/jvNV7360iONTShMCpRiQ4uv99M8lhlGP35po6ulnfxQZhk
         iAJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dmmKkiFN;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id e3si854852ljg.2.2020.01.14.06.26.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jan 2020 06:26:47 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 47xt7W0PG9zxnS;
	Tue, 14 Jan 2020 15:26:47 +0100 (CET)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 14 Jan
 2020 15:26:46 +0100
Subject: Re: [PATCH 23/38] configs: Factor out ivshmem memory region macro for
 network devices
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
 <945028d7d210064c97963f15dd3e0a171ce46fd4.1578313099.git.jan.kiszka@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <02d5b3ac-54d6-48bc-5eed-eb0a91186647@oth-regensburg.de>
Date: Tue, 14 Jan 2020 15:26:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <945028d7d210064c97963f15dd3e0a171ce46fd4.1578313099.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dmmKkiFN;
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

[...]

On 1/6/20 1:18 PM, Jan Kiszka wrote:
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index a62fa1ee..f82bbe8d 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -129,6 +129,15 @@ struct jailhouse_memory {
>  	__u64 flags;
>  } __attribute__((packed));
>  
> +#define JAILHOUSE_SHMEM_NET_REGIONS(start, dev_id)			\
> +	{								\
> +		.phys_start = start,					\
> +		.virt_start = start,					\
> +		.size = 0x100000,					\
> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |	\
> +			JAILHOUSE_MEM_ROOTSHARED,			\
> +	}
> +

In the end of the series, this makes calculation of .num_memory_region
unintuitive: the macro will eventually roll out to four memory regions.
Would it make sense to introduce a macro that denotes the number of
regions that are created by JAILHOUSE_SHMEM_NET_REGIONS?

  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/02d5b3ac-54d6-48bc-5eed-eb0a91186647%40oth-regensburg.de.
