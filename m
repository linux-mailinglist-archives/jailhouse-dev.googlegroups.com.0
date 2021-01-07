Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTON3P7QKGQEX7DSJVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1040.google.com (mail-pj1-x1040.google.com [IPv6:2607:f8b0:4864:20::1040])
	by mail.lfdr.de (Postfix) with ESMTPS id 868722ECE18
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Jan 2021 11:47:43 +0100 (CET)
Received: by mail-pj1-x1040.google.com with SMTP id my8sf4055745pjb.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Jan 2021 02:47:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610016462; cv=pass;
        d=google.com; s=arc-20160816;
        b=sgYHibW5mUzVcRnxJ3QUbe37UyC33903wjC1RFAjkAIndUCisS2jVF/U5HWYHh4z65
         ml/2qkoB05sYfHv5rfKaWRhBNJT5YgJOwxTU8Q7Yqi5+C1DlQFaEd/pC+geJr+R02nD1
         oWe2jAHJswmCAhMxYVfKnIRcdNQ6J9ANwkekar1HU8AQTZQWzjODdehVkv6VZ+NHHlp1
         v5siwjSe8KCNctsN3Fy0UZj02gwlcwomlSorbHshpfsv84pxukeLNgv6fF0g69ylLyCN
         jbQJp/wYXiM5ubO7LL8x4/gcARiJL9x3AbTKYrXtasFPoOEFpYOppNmkqApZsUeu0YMx
         3iCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=SqX2A1AgjjTYQgeRyGAmC20iN6WWHNKA2W2ePObCGR4=;
        b=ySha5mS4XYHEK/gnb0kbGh9ca/0c6MMw4ujqNz0wt+boHWnXB8HKtO/LDlSQNSAvRM
         2YNXf2cPftOWugixCE4Kr4Rfjlfq6p7SotxkkN1xlHqDhCs4RSNXJTv7t0b3WcZn7IWN
         uLtnJoGcC0a1m2vuN0/mEXXZYqyuqy1mE+IHQQK+u7OywUb9eIPF803cAC8zJ9zvgB4Q
         bY108lIn0c+aOquEzGlWdzrd5sEPb8aHjBk8olDF6THoMUCBVHIe7KRclNMC/z0go4HH
         Ff54xoWujg6dNZ/ciRg+L2/MzQexYdrQGvnpua54UZwZF3LGFpQgwwGzerqaA+/U17uX
         H/+w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SqX2A1AgjjTYQgeRyGAmC20iN6WWHNKA2W2ePObCGR4=;
        b=S4oogMxKpHsBBrr/xffWqbHbkZbWFIEh+UInWozK1kWwztHrkQbPaj9fIrycyh/e9p
         LmuwokUav4tlvCFTvRh38phNG/ui12so41AyUUH4UmqQ4BsayutocLWR1RSrQfeBLR0l
         LUkvkq5xTQ9zQx+PMaYb0XhpQP+ATbZiaHywp356lk+ZZ1UfTw1i2EffaQhDttlDa6BG
         vPxaTismep8tjhegpd+Hdfxw8vF3YFAurcMhUJMAgUBrSXIsn9cG9XcUy6Z/nrbH8nTm
         IKI9xcp0ar9Ues7O6hZC3ngKfGxFjP34iyuYfX47micIMFdzN9wdMT1A3G5ee/PC3kcC
         tqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SqX2A1AgjjTYQgeRyGAmC20iN6WWHNKA2W2ePObCGR4=;
        b=TXgGP4je3wKOzpHQPgTBB/MT8dSvXUZgVub0wiAa/p0Tq7l4omebX39hqz3SJQY+Wb
         Yl4B8cxPTt1zYRiO9avymzQ/X91yMwrzRfi6B0CXkV+L+l67ezLRDdD2C1KokqTeHy+E
         vCA/ad089opLoYbQ5Vpb7cGx8fGDmxD49KIiG0QE2wl6ee0cnt209rgke9sKr+cnTX/M
         gCTUdSApNiDEtzw6N4Qkuy2XQcumSTsSkc3kDwnyDwnkGngXlqP/jrPvf3SU9kZ/dv76
         TQFftVb/B/f+NkDRow+lu654/XgXx/iOxa25mfOcb+lomdKpjG2IKPapVCD/R7WDXOkh
         EpzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533nyFHfy2++N+QGCTvR3MQM/SQBgSF+gV8Caaum/Dla5rbd8N1M
	s4PrW/g2KbypyoSrfkKx0kE=
X-Google-Smtp-Source: ABdhPJzCTAML5AY7HWLKevrTZBXHezl6J+RQoZj42DC3Oo1zzlk+ITk6865wsp1jb+aMpAYbB9QS6w==
X-Received: by 2002:a62:37c7:0:b029:1aa:22ea:537d with SMTP id e190-20020a6237c70000b02901aa22ea537dmr8021997pfa.56.1610016461956;
        Thu, 07 Jan 2021 02:47:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:ac0b:: with SMTP id o11ls1094885pjq.3.gmail; Thu, 07
 Jan 2021 02:47:41 -0800 (PST)
X-Received: by 2002:a17:902:bd8d:b029:da:fcd1:664 with SMTP id q13-20020a170902bd8db02900dafcd10664mr8793235pls.30.1610016461061;
        Thu, 07 Jan 2021 02:47:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610016461; cv=none;
        d=google.com; s=arc-20160816;
        b=gt9gixkbBnpYDIC7PAO2qt3PwjQg2seoa9etr56CWlQb8igzlZomxlNiCf1T71yMxu
         IN69r/x0ATqiUgnm4BIm+snpp0RKiEwmJrshoi0OpK+25j+AKcmSe/j9xiwBXekEzcx7
         4IlwiFV6o2SwIERJ/GuSmfMrel2FNHvRjxgAyUoo8nh8hpzq1t89vGc1PWGSCS65LOH4
         a0vRNMUR8D7M+vJ2kuDq5nVNvQMH0mTbq4xWwsXD6zxK/C21UHzstCP7YsSZau+VzkgB
         S/79xzJeLVbkTL1YCqUM0SH5vFotyurSZ7fWQIV5Ux77stJQZK8UbU2+Rot5IlXWheaQ
         NaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=qLkRVCOQ9fAYsrXtyC083DdFbNJCCnIZNaHBCtXhOJA=;
        b=XkTarQoL6Dpi6gICE3moqo70wAqFT1/XXphgpYKNmUpq8C28LeF2nYRsp0CFRB8FjO
         VJWubtUgUfZ8u7G7Yw2NubajXyCnc/rcGm50dhhxBfVObWN0ilyavIW+oh/rXOAXNekZ
         LNMltgAqxSgBNk6kLEXhMSpRcP1e+n0gdXjk9KVXzo1UElE/78QeIBlykqLa6eBHIu+h
         mFliMYjfqLKiJ2L3mhl0OoNSxLHyJRjdp5UD2kFWUZKQWTifMjWC2dSF7HMy0eHJ7LPP
         31RbuRtXxp7mBOO7wPsR1BIyyjRMIcVynl1Y4Jwm52m2IKFxXNgOfqngI7b0zT3XixvX
         rWGQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id ne6si166952pjb.1.2021.01.07.02.47.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jan 2021 02:47:41 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 107AlcLv022887
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Jan 2021 11:47:38 +0100
Received: from [167.87.32.120] ([167.87.32.120])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 107Alb33014701;
	Thu, 7 Jan 2021 11:47:38 +0100
Subject: Re: [PATCH v1] configs: imx8m: remove the physical address range
 contains GICD and GICRs
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com, Alice Guo <alice.guo@nxp.com>
References: <20210105091910.417-1-alice.guo@oss.nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <fec3ccfe-8776-74c6-3286-98db19fad8c8@siemens.com>
Date: Thu, 7 Jan 2021 11:47:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105091910.417-1-alice.guo@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 05.01.21 10:19, Alice Guo (OSS) wrote:
> From: Alice Guo <alice.guo@nxp.com>
> 
> When enabling Jailhouse on the iMX8M platforms, the stage 2 translation
> about IPA->PA includes the address range contains GICD and GICRs, which
> should not be allowed because GICD or GICRs should not be accessed in
> the root cell. In order to solve this problem, remove the physical
> address range contains GICD and GICRs.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>  configs/arm64/imx8mm.c | 2 +-
>  configs/arm64/imx8mn.c | 2 +-
>  configs/arm64/imx8mp.c | 2 +-
>  configs/arm64/imx8mq.c | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/arm64/imx8mm.c b/configs/arm64/imx8mm.c
> index 88365919..ebc2d294 100644
> --- a/configs/arm64/imx8mm.c
> +++ b/configs/arm64/imx8mm.c
> @@ -107,7 +107,7 @@ struct {
>  		/* IO */ {
>  			.phys_start = 0x00000000,
>  			.virt_start = 0x00000000,
> -			.size =	      0x40000000,
> +			.size =	      0x38800000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_IO,
>  		},
> diff --git a/configs/arm64/imx8mn.c b/configs/arm64/imx8mn.c
> index ecd00a90..667221da 100644
> --- a/configs/arm64/imx8mn.c
> +++ b/configs/arm64/imx8mn.c
> @@ -102,7 +102,7 @@ struct {
>  		/* IO */ {
>  			.phys_start = 0x00000000,
>  			.virt_start = 0x00000000,
> -			.size =	      0x40000000,
> +			.size =	      0x38800000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_IO,
>  		},
> diff --git a/configs/arm64/imx8mp.c b/configs/arm64/imx8mp.c
> index b870a788..a1e221f9 100644
> --- a/configs/arm64/imx8mp.c
> +++ b/configs/arm64/imx8mp.c
> @@ -103,7 +103,7 @@ struct {
>  		/* IO */ {
>  			.phys_start = 0x00000000,
>  			.virt_start = 0x00000000,
> -			.size =	      0x40000000,
> +			.size =	      0x38800000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_IO,
>  		},
> diff --git a/configs/arm64/imx8mq.c b/configs/arm64/imx8mq.c
> index 12afedb4..9f9c6071 100644
> --- a/configs/arm64/imx8mq.c
> +++ b/configs/arm64/imx8mq.c
> @@ -101,7 +101,7 @@ struct {
>  		/* MMIO (permissive) */ {
>  			.phys_start = 0x00000000,
>  			.virt_start = 0x00000000,
> -			.size =	      0x40000000,
> +			.size =	      0x38800000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_IO,
>  		},
> 

Thanks, applied.

I will send out patches for the config checker soon which help to find
such issues earlier.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fec3ccfe-8776-74c6-3286-98db19fad8c8%40siemens.com.
