Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRV77D3AKGQEJB2P6FI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB7A1F17C0
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 13:23:50 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id i16sf1773919ljg.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 04:23:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591615430; cv=pass;
        d=google.com; s=arc-20160816;
        b=VBfA2vXyFXMiZ5CaOKBiZiwxKEFf9G95qGtC689em8F6SCMpEnZROLrg5tLwQNV65Q
         ZU2J70mmLCFlEkD7bzmImaFblZWV0TCBRyMvBxSd/Z8IDeHF6wp/TI1rC7Z0+bSK5v6+
         quRL7aOp4dw6vv0hhJ6pIAwCQayme+2hbJs+jJPt5/UM1HqULdx3vLM6C2V9BkHLuRTB
         gGLn++fnCFgcOB1NZTxTgOqg/da8uf+tHRZLkbhx/TdHPAmJb1JE7+b4VsYjLyM4JW21
         g0HhimqAcFIhi5WTMvtsPT6FKJt0SYSsz5gD5gR/nsFDt2Hsx0e5es0s0dAWyXJ4QiH+
         ezXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=U8Vk1wA2NgzbRBv18qcb3j0KQZGqgIaF9Y6oKjw/3T8=;
        b=CR80OCWt+/2uJqPq51eSp4vL3L8duizZK7k5iBHnbUzVpP549wLGk2v01SKxs+V4Ac
         oPrag881/g5AfVod/TgzP7YHKcOSoRnD0ycraLdkWC82WMZbgPj7GP3Vd+I0gfQ8rjg7
         ZSdM5Qtn8dYRdn+112EGPMwgq5msO2HyAxwnrNxTyRT6o0niKmc5vB+apkOjId4ReJI/
         /3ntmCk3ytoGuOWFkimBCeFaSL0m8abv3Vzyt29VNJObFbkk8e16wH3ZeX6RZhAJcskh
         heofiLMtnj9A7BMx2HJvFeb4cGzeJcxlz2Z/cU6Ui+ZX4Nd32QMkf5oUgaeawrsxPU4E
         IO4A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=U8Vk1wA2NgzbRBv18qcb3j0KQZGqgIaF9Y6oKjw/3T8=;
        b=YInmU0DSw346j5a1atQzeEsZCot4VwTB5lq2InUFHNWUFP15dUqsMzpQMMpzXCEpMO
         PL6bZUDusUlU/dU42bSuiumlJ09Y+SyqSFwQubAsumUt3iN6ZX5fPBEfSYOlgbS0KUkb
         YPHge+XCd9snyxKJhrBRix+rw4c2DG2WRKwptl6xPVbB+wckgnVnrD30vv9GZgG9pr5M
         AJ0xigwF9zY04oc18uiRDOjaW9QE6ln/ZpS2NIQruN0u0XAF2ATq8LmtlX97QTituICt
         C9o7AZoRUq07nfXWiXcZvUcivGk14A8P8ldMiqOWPaUOmHCFZ/pgJIGmaKLajymnx+Wf
         ODFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=U8Vk1wA2NgzbRBv18qcb3j0KQZGqgIaF9Y6oKjw/3T8=;
        b=gsFZd2lfEX0PqgvociMn2l+3f1vQZkq4sH3gnjp7rlUmUwKof5R97qtwa3CDd6R3t5
         uRiygS5QUjJ5dMdPrlfn4iOdoS0s6DNqO/SnOAceRd0Kygh9tkR3PBxqRwkwxrcUhjCz
         e9VwK3Hn/e+1Nh294hsRyyrHNWGqiNIaByU2xU2tH5sChrKiQ8J3u8qIiGyQ0+kPgsI/
         L0qSeHxK9ajl/3S3fwKc5DhFQGOIMBV8vPA6zHq7f6tX7YxOouzy5XL1jsKEDr9B3WSg
         eJ2oZggxtpVyFkmZz4dFmEb4fFn47qyAE/o1b0UB+VaihVpi+L6xx3qD+yAD0Yrf7Gfa
         VC6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533TRS0K1OFgTDgw0lVMmED9UHsry8JXfvF3fU+Ph6qqjYAzeQdn
	2zJHK3zcCrBGPif5S+Zinxc=
X-Google-Smtp-Source: ABdhPJwvz4PCaGFQTtSsbkYrDy0Gu62bQaIPI+Rb7y0Pwul1sJdBL88cEjDYiEyujsWk8CHWycxQ5Q==
X-Received: by 2002:a2e:b0f9:: with SMTP id h25mr11411465ljl.18.1591615430481;
        Mon, 08 Jun 2020 04:23:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3a02:: with SMTP id h2ls1462327lja.6.gmail; Mon, 08 Jun
 2020 04:23:49 -0700 (PDT)
X-Received: by 2002:a2e:b5d9:: with SMTP id g25mr11498915ljn.285.1591615429744;
        Mon, 08 Jun 2020 04:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591615429; cv=none;
        d=google.com; s=arc-20160816;
        b=M0SJ6BRebIY1FoWjaO8G5emNjA1eqR1drYnI2UglX+c3Xq6DjE5T5LO52AYaRJ0Vg8
         PndyZr3rTxVlAJ9/itOoHFcSeSzBjycNabarcxt5fD5GkVTgNAvXjkl10i2ifiACjV8i
         gKd897PlDFp+/WbHcvqStrzkVOsySyK2A20ps9rg40CUYcYtvLND1bz0ViiENOImG7AZ
         TceaULoRLz8gO9Pq8Bc3nQyd4uYYFZsH5ODCeQ8ODHcgSJbd/4oiJS5g30ZQxfTuJR9l
         B7khjIMwL4Bvd/xJidMQflh6aqEw0nrWud8cWAuRUB1pvPC64FewGxQlUY4KO0iLaShw
         IVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=sKZVt3v+JLWRRzy0HxMYOqQrG1c+aq2ILgmQ9bjmXwQ=;
        b=lQOM/qrecteWIimHw2oNiKCOeX10eWuYatuoe6ky6fd4j3hnIK9z4GfI47nxtsCLvD
         qLERqWeBZsBd+Xg4bnTEBGcgsFZUWxHb6dMJsD1dDNVQacT7fam1KKoYbPXxTXlPhyxa
         cdm7HZ4iFpICiiYTSIz5xWa/jnhPAN0eHFnahJiih7gOrxcP95EoBY+0TddGM7y+P6FP
         vsalFl/hUkAFPpE3JiOpl3pzg8OENX1cFTMFY3uX8SnHwGwji9txaza/ILmUpYCb0HIq
         ae5MmUaZVrOdjp+MhnKl+OIIkzfZ/TiY33vW1IwcxHLuHjEPr6xJ8aOmKgBrCQWj8Vos
         2vMA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id o23si749344lfb.4.2020.06.08.04.23.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 04:23:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 058BNm0E006812
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jun 2020 13:23:49 +0200
Received: from [139.22.122.178] ([139.22.122.178])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 058BNme6014856;
	Mon, 8 Jun 2020 13:23:48 +0200
Subject: Re: [PATCH v2 2/9] driver: pci: Use page size to set the aperture
 size
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200608104255.18358-1-nikhil.nd@ti.com>
 <20200608104255.18358-3-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <cfdb8ecd-74e3-5861-d342-b792e4f1f790@siemens.com>
Date: Mon, 8 Jun 2020 13:23:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608104255.18358-3-nikhil.nd@ti.com>
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

On 08.06.20 12:42, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> PCIe host controller is added by jailhouse kernel module via
> an overlay. The aperture size is currently set to 2 pages
> assumking 4kb page size.

typo.

> 
> Update to use the PAGE_SIZE macro so as to work with kernels
> where page size is configured for 64kb.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  driver/pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/driver/pci.c b/driver/pci.c
> index 601e2d96..c9f07780 100644
> --- a/driver/pci.c
> +++ b/driver/pci.c
> @@ -439,7 +439,7 @@ static bool create_vpci_of_overlay(struct jailhouse_system *config)
>  		*prop_val++ = cpu_to_be32(base_addr >> 32);
>  	*prop_val++ = cpu_to_be32(base_addr);
>  	*prop_val++ = 0;
> -	*prop_val = cpu_to_be32(count_ivshmem_devices(root_cell) * 0x2000);
> +	*prop_val = cpu_to_be32(count_ivshmem_devices(root_cell) * 2 * PAGE_SIZE);

overlong line now.



>  
>  	if (of_changeset_add_property(&overlay_changeset, vpci_node, prop) < 0)
>  		goto out;
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cfdb8ecd-74e3-5861-d342-b792e4f1f790%40siemens.com.
