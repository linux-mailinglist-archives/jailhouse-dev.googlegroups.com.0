Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBR4YXPYQKGQEDAXBBMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id EF40914A329
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 12:40:55 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id f25sf1390751wmb.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 03:40:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580125255; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jo3xT6fAnJLetVwrLTeRyRgjGlWfmOawcJL+U2oWRa8mVt5ybG4grx4OJmdUvjzfhO
         akYAVXN1QZHUP6AN27jBakS6Oqa0J19Ih68QMBeLDlL0n2YL+ABG25m7dMc/rIsMHkeQ
         YjVnwEeNdOB99ER18jPbPsuV+Gm2WWnHphACfuy3vkfueLmrLw4JvHA+nZxRQMw7+HQ8
         7eyWs4NBmVeyUx+tOjRa2vCmW8EevUlFzaNdLk+jQtV+mwMp4CPYHRDCWHjubHpNwwZ5
         sZ7tE5V/D3M1ywsp0b7G7ahEQ5sxVGwbovPfLOVBDOYjiCGcFU7Isyo4oHqTIbF2uDob
         fy6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=0UQDm/SvbT8cK0azaSSRQWHApkI37gnyEmTjlvUVdqU=;
        b=mfzkP/z3WuXgJ/+oaAEOAaS33KKQRP20YVkjICZ5VDbJ5+O5rB9HV0nSq3++5Xuts1
         9u9OQat6JVnuD84imGYUJF6buHHzqy3Bkto7PwmplB4mIEq2RNPxJXKZnkQY4P2DCHRV
         Euzd0V6jgNFtPJBzrBG944FSMtagggTieWEi412x/F9BV0qkFKewOsbzXIU2iPw5oFWt
         AGZOwtbE3vR7AyJzWloj6VpbrvMhidaD1coUQTxWLUs8jIE5EXPv6OZl5R4A0Sao6KTx
         QsSyNoXgfXLP6TkBZVmSIDBnAiVEoe8rkqq3ftIxM1HYHFX5p6kefUFTwMGT39dOXxBt
         rP8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IEXTRTzm;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0UQDm/SvbT8cK0azaSSRQWHApkI37gnyEmTjlvUVdqU=;
        b=FQ2h6e9Fz86BX0EEVRhdG4zz4U4r40d8P2DFnWchDMO8loDLXNl+1nT5PnRm1n+7ki
         jy73kgUt0SGUqLgwmTrCW+6ig6TziYQkCxCsy6J3ni9F6gk1oMcYOvBdsOffJAu2ezIy
         8mtHD9Fe/c7VzUM0a3vPUq3CU1qJK6MwJatBfd8KGcc8IwytqCQOcGK7aviG4+70pyNO
         bjqTPcreslS6PrR/Yt2Di2je7UnAh7k7M2TTGkFrWe8VklOI6GjtT4aDHNXHlg6RBzay
         4uU2UaTiEqZvYQvlPaCc+EQEZQUgSEDVdK705JH2vigayxrYJAAtJib6w1HrzsV+GgFc
         tfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0UQDm/SvbT8cK0azaSSRQWHApkI37gnyEmTjlvUVdqU=;
        b=Xcf42BBoi4mdFGnjLAVdFkJzXpVYNbBuw/j1tB22zWKiDIEuKuADuGlJry2K2VkkfX
         e1kBEeVZF1LUXhZQWxJijk/5siKsva5ld2r7395MjJrqSvp9rEGfmyoxfFE+O1vcnE5X
         iUj3ouV5tnZj+hBUv/QBQNIF5S6jl5qgS7biluEhMaPwTTScjXGz4EH6ExNtTJDyt6Q+
         TcUtuRjl44wPhVjZPWAMbQVGivsud8I/mKpNb5INFmpBQfTIVd5ZfaByswjM1BeH2LY5
         5OXZqDyxDdvA8uv5oj9yXaxTa9ZOOr2QYT8ZzMxQrfs3x/jvNF+8I0QU1KxuH6Hm/MaH
         f27Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXPZc2uzuwTV0uBhEeZ9memyh6SfrCg1ZMMwXJRtYhnrd5wRRFO
	iryoLZB6+7+F7zj32E9z1t4=
X-Google-Smtp-Source: APXvYqxC9ucw9SrFFJgH1wKf39jzL3n15CSQpNFscwGk9W361GTOoFrXaQnFGlbK3HMk5cQf1qNFqw==
X-Received: by 2002:a05:600c:2c08:: with SMTP id q8mr13614897wmg.45.1580125255575;
        Mon, 27 Jan 2020 03:40:55 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cf15:: with SMTP id l21ls4391755wmg.0.canary-gmail; Mon,
 27 Jan 2020 03:40:54 -0800 (PST)
X-Received: by 2002:a1c:5441:: with SMTP id p1mr8353642wmi.161.1580125254797;
        Mon, 27 Jan 2020 03:40:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580125254; cv=none;
        d=google.com; s=arc-20160816;
        b=ZeEOsvBFBZVDXro5j2PNpxEI1ceIgCt8N5++qyCBaaIHcMt/jpIlIt6GQMSrNdpvuM
         IYebq02vEip0AzKNGR+TSNNCdxpcRpBo9mIqPp0+KVeQjWlkGNK32AJcezFKA/8oy0vB
         gTxnL2BQwB1m1ipefSpl5f7GERW+9I29N0f+N20TOksCEFprNE5q56siImm+yRQH33vI
         cX1Bg6XQM3MLgY0iyJDnLHdlEnKIw4AYiD+U8nuH+pGEijZeLJRvrcDvgko4Z5s9+Uq8
         LMpG18lxDdqVOKyBYYwyio8hXoLJMQJqv7upwfFoJ/rjMlkGhwPBsFGOBo3+0RUyLJRC
         OCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=gmcFY3tmC+pVm/871hm/pW89YVt7f569/qIs9M2j7HI=;
        b=iUd5O14k9Gy1V/OPHV9v86MQvXZJrYBogTVtOnbAjQR/4255sCqgET4X/Wr5njNLy6
         zAXlo4kaNQF3zCWvYW+NOnJ4NfA5bvXM0AEL9rt78ql4po0mh+hyiyL0S4K5evAdsSDR
         BUBo1d67v1tERcdyiTLnEBL11H0LnIO1mj9+ie2Mbs5yrhuTmMOhdwC6t74bNnKoIEdC
         wuhNutN9Lm4A5occWHHUV9w1igRsZEwpfehQ28Al+spyzBn16pX8Ws1YYABZvENnioFP
         2UXKyM3R3KBrqTAKb/Fa5IR5YPO1LN+6cqvVtza9piV6p4BcfpBGshyx4ec/aNSei6yO
         2shw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IEXTRTzm;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id y185si496899wmg.0.2020.01.27.03.40.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 03:40:54 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 485nr6302LzxpT;
	Mon, 27 Jan 2020 12:40:54 +0100 (CET)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 27 Jan
 2020 12:40:54 +0100
Subject: Re: [PATCH 2/3] arm/arm64: Pad comm region to natural alignment
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <cover.1580107046.git.jan.kiszka@web.de>
 <beb95b54284b1defd0f1952d43f8143cf303d38f.1580107046.git.jan.kiszka@web.de>
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
Message-ID: <ef68e345-9b82-e82a-65e1-da1cb9faf2c0@oth-regensburg.de>
Date: Mon, 27 Jan 2020 12:40:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <beb95b54284b1defd0f1952d43f8143cf303d38f.1580107046.git.jan.kiszka@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IEXTRTzm;
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



On 27/01/2020 07:37, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Better pad than rely on both sides using the same compiler logic.

Ack. But shouldn't we then, in turn, use __attribute__((unpacked)) to
avoid that the compiler accidentally does some other unintended
alignment / reordering?

> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  include/arch/arm-common/asm/jailhouse_hypercall.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/arch/arm-common/asm/jailhouse_hypercall.h b/include/arch/arm-common/asm/jailhouse_hypercall.h
> index 83cec97b..aeab2816 100644
> --- a/include/arch/arm-common/asm/jailhouse_hypercall.h
> +++ b/include/arch/arm-common/asm/jailhouse_hypercall.h
> @@ -38,6 +38,7 @@
> 
>  #define COMM_REGION_COMMON_PLATFORM_INFO	\
>  	__u8 gic_version;			\
> +	__u8 padding[7];			\
>  	__u64 gicd_base;			\
>  	__u64 gicc_base;			\
>  	__u64 gicr_base;			\

BTW: It's really hard to trace how the structures are being defined.

Instead of creating the structure in arch-specific parts for each
architecture, I think it would be nicer to introduce the structure for
all architectures, and then include arch-specific parts.

Maybe I'll find some time for a patch...

  Ralf

> --
> 2.16.4
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ef68e345-9b82-e82a-65e1-da1cb9faf2c0%40oth-regensburg.de.
