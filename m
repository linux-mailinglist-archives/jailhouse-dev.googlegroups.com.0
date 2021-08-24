Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTWBSWEQMGQEIHORJLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F74A3F6AE1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 23:12:47 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id c2-20020a7bc8420000b0290238db573ab7sf1786661wml.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 14:12:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629839567; cv=pass;
        d=google.com; s=arc-20160816;
        b=QP9cmeyLewlclvdYoFdLGVleAmH55fj7SPeb3dSYDZJOcZtcL4jlqzNDFZbValyfRd
         T8Iz55l5y0icX2q62jxy66zODjOyhrfofKcO0iBdZNFdGuv5nBXTEuQPtMfe6fbGjRKU
         cYrJ2WuI1IC+FbwGry04NumGQpdMMd04E/ZLyv+ldgXNfFASs8a6NDRcFgDKxn5vby1M
         AcsAarXkbqCKhYrLYKMiCBDxbZAQRcaEHDXc/9QhoO0EAFgSACnwW3HRrmx5uOr6QBoY
         HKnLJA/9LvdU/6o2QNiHff17sZP7hK9t32cGqUkSUsSsCNL6voc5O6Gb6zfLZTTZnnzg
         NHHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=JJd3GyAyQ6X5DZpRJ5ydpOvttUuVGH5FL+QkYCqOOXY=;
        b=GF2D12DrFaCFw1V5cSLdWLLxCZcyRZeSXuhtG4T+H+6o7x5MihKtpq2bLH3flJo5Lc
         lsCvykYUVV59b31W3KgtzfoM9X9wtS4jxumihOp+rddlfzlXlGj97zc/q1waZ+xoQcag
         PQ1hbVfiZeMrxn1gQ4eXydQ2w8nhvTZuyTen8/zcP/t+OEpsUqry1HYxDo64CpMgdkKe
         gc7+GVS92N8LidTUbZ5OLLKCcHp1F1/Bt8Stn5J0SSZhOEDNsxJQ4zm1O42lMl+JDO48
         8yO5rw85HcD15j2hc3oieraMZW46bqz8hsWpUNFEf2unRBUgqcCQxHfaNHcVqTv6Dyf1
         hDAQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JJd3GyAyQ6X5DZpRJ5ydpOvttUuVGH5FL+QkYCqOOXY=;
        b=SWDi5mCfBIFSyN9dS3+wMi9688TjELVPMA6OIGNpnyMR/mX0DTtJqTelX3mvtDOh44
         I0coyK+41m3fO55+rOqBa2J7pUaTyqwelTrZqMWdiMAI1W5/hDcxJx/A2/QY3mdQAo4N
         wYa6hCkU6AYnba9D4FvCjF6O9NfbU8qHgDqHs1wVDeEkwquthK749uEsrmmAf/oVxbMT
         XWInzqbe/1N8D9ZePtPsBhQsqVOjdW0XC3RXvMekNAg53sICGpb6HT/H9i3eyseedndP
         mTEYZy6AFid8e3sGETQ2lxlju/z17cyEiHITvXff5ccqJNZUXIkzMjchCTWehY1XtWrh
         Ouig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=JJd3GyAyQ6X5DZpRJ5ydpOvttUuVGH5FL+QkYCqOOXY=;
        b=mHRmFTOoctpwi0+cmotkm2KdU/hY1dk9eOXPaL3EBvErVkRjA776jeUX/hRMpsJyiA
         BNCa+DMI5uxQwGMu2XGKSJcZDbufcxW/yW9xwxYol7IZRf/xptE/WjL20+Dleu3TpDJO
         iPNXyoIrvLcyN/8y39wuNatMFTthnVYVmGdlydJ5k4Nb65/iArWwjvmnq7esHx53O6+t
         J4HvVCoF5BfPVWvBDJ7LkjkgFOAQ1NpJW53Fdkj43ss8XJy0NAugxZGRbjqv4DQ6VgMk
         kF4I85ktvnXwPzxvyzMMJj/QQ1tt0l7nmxer4iFr8P5mOZZTgNWBco/EWoFUu1QveufS
         Fd5Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532WtP9P8rdi6YJPDlsB58sK0oM4Suxiz52WIvCg82rCFl49gnYI
	aT2hrW9aiE9sv65gf6XwQ8c=
X-Google-Smtp-Source: ABdhPJz8r91C/voLyr132eoAPVLwU8xPykDx34ekYU8vA3KhOH08dHKZUYWYejagEFJR6neLQ9R8NA==
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr21457219wrw.368.1629839567363;
        Tue, 24 Aug 2021 14:12:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4a43:: with SMTP id v3ls155508wrs.2.gmail; Tue, 24 Aug
 2021 14:12:46 -0700 (PDT)
X-Received: by 2002:adf:9d92:: with SMTP id p18mr21407959wre.20.1629839566020;
        Tue, 24 Aug 2021 14:12:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629839566; cv=none;
        d=google.com; s=arc-20160816;
        b=k+ExyknfooFaDknAuroKTZLWYjVv7tmMy4HC1Rs8mH8VHZ6yxGbqs5E6nXQ29zWQwV
         FArUAbV2Ki0qVCfOzQOeUSoybN5S6Q4Z0rRdbbi2tNCRzfNerizyOsxpmPAoq6esvt6n
         E0JzS9iSWHMgcMaiWoyEMcAvzBkWums8/sCZ4J/Y0CHRDOmIocYRTldoVBpbmIBWZpor
         qoRvPqVXt9GfW7y37UcXH8U7RjqcfB6dkUIAWOMVn3t0Ws0YpBtcFj/CfBsrEwBtTjXc
         bJK3hgpCsKDT43jSc99b5gW0F3uZTY8imWh44hWNQ2e8Zbkgmoz8ZRanzc/jehPEw+Sy
         1H7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=9cBZe+rQgSRxyJbUUowTPbbyyOV10eRyUUrFr8778NA=;
        b=EaBMPdcm2LRkUjRjvzREIUVTyukUlqy+Q1bL5W1imXqRhLcQXZqwjYHlgyyWPB9P4H
         SD1TkbUT1Sybun9g0ai/gxQk8jHT5i3EvR+f3/3txgrmvR9u5SGMVBITkpj1zpeklwPt
         fyVNazXbo4cBYVu7sVf2jV3hv+or5bngOtzZ9mgc5+FV6GVZv3WJZpcLW8MRFtaVmffq
         fXxrK3Mu1WMupY9lHo3eIuW0oUM/qli2nzOOyyA2b/9MZnQQkjwXrLoyr+u5mPZRtjhC
         0WCB8ZOMfXODFId1VlBHmaiMkjEveFSIU1VgW/YqHhjNLl7AhAXs4q9yVm4al1lTm0hf
         KU2w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id s12si169582wmh.3.2021.08.24.14.12.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Aug 2021 14:12:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 17OLCj6k004155
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 23:12:45 +0200
Received: from [167.87.75.154] ([167.87.75.154])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17OLCj7O021936;
	Tue, 24 Aug 2021 23:12:45 +0200
Subject: Re: [PATCH 2/6] x86/cat.c: Fix CBM for non-root cell w/ root COS.
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR02MB66709EAFB592AB3A984173B0B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <fc2280e8-7800-2a80-a886-32179af203f2@siemens.com>
Date: Tue, 24 Aug 2021 23:12:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <PA4PR02MB66709EAFB592AB3A984173B0B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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
> The procedures for shrinking and extending the cat_mask of the rool cell
> affect other, non-root, cells as well, if these cell use the root COS.
> That is, when cells are configured without cache regions. The code is
> updated to reflect these changes not only in the root-cell, but in the
> struct corresponding to these non-root cells as well.
> 
> Fixes: 3f04eb1753bb ("x86: Introduce Cache Allocation Technology support
> for Intel CPUs")
> 
> Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
> ---
>  hypervisor/arch/x86/cat.c | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
> index f6719b1e..42fd83d9 100644
> --- a/hypervisor/arch/x86/cat.c
> +++ b/hypervisor/arch/x86/cat.c
> @@ -60,6 +60,13 @@ retry:
>  	return cos;
>  }
>  
> +/**
> + * Merge available bits in the CBM back to root by modifying the cat_mask of
> + * the root.
> + *
> + * It is the callers responsibility to call cat_update_cell(&root_cell), and
> + * to modify the cat_mask of the non-root cells sharing the root's COS.
> + */
>  static bool merge_freed_mask_to_root(void)
>  {
>  	bool updated = false;
> @@ -86,6 +93,7 @@ static bool shrink_root_cell_mask(u64 cell_mask)
>  {
>  	unsigned int lo_mask_start, lo_mask_len;
>  	u64 lo_mask;
> +	struct cell *cell;
>  
>  	if ((root_cell.arch.cat_mask & ~cell_mask) == 0) {
>  		/*
> @@ -125,8 +133,17 @@ static bool shrink_root_cell_mask(u64 cell_mask)
>  		}
>  	}
>  
> -	printk("CAT: Shrunk root cell bitmask to %08llx\n",
> -	       root_cell.arch.cat_mask);
> +	/* Cells using the root COS are also affected by shrinking. */
> +	printk("CAT: Set COS %d bitmask to %08llx for root cell",
> +	       root_cell.arch.cos, root_cell.arch.cat_mask);
> +	for_each_non_root_cell(cell)
> +		if (cell->arch.cos == root_cell.arch.cos) {
> +			cell->arch.cat_mask = root_cell.arch.cat_mask;
> +			printk(", %s", cell->config->name);
> +		}
> +	printk("\n");
> +	/* However, updating the bitmask once suffices. This can be done
> +	 * during code execution, no suspense required. (SDM 17.19.6.3) */
>  	cat_update_cell(&root_cell);
>  
>  	/* Drop this mask from the freed mask in case it was queued there. */
> @@ -201,8 +218,14 @@ static void cat_cell_exit(struct cell *cell)
>  	freed_mask |= cell->arch.cat_mask & orig_root_mask;
>  
>  	if (merge_freed_mask_to_root()) {
> -		printk("CAT: Extended root cell bitmask to %08llx\n",
> -		       root_cell.arch.cat_mask);
> +		printk("CAT: Extended COS %d bitmask to %08llx for root cell",
> +		       root_cell.arch.cos, root_cell.arch.cat_mask);
> +		for_each_non_root_cell(oth_cell)
> +			if (oth_cell->arch.cos == root_cell.arch.cos) {
> +				oth_cell->arch.cat_mask = root_cell.arch.cat_mask;
> +				printk(", %s", cell->config->name);
> +			}
> +		printk("\n");
>  		cat_update_cell(&root_cell);
>  	}
>  }
> 

Valid point that arch.cat_mask for the sharing cell gets out of sync.
But what is the practical impact? We don't run cat_update_cell() for
sharing cells, and cat_cell_exit() does nothing in that case. This is
first of all to understand the impact of the issue.

If there is impact, I'm considering to use (also) a mask pointer so that
there is no need to walk all cells on root cell updates.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fc2280e8-7800-2a80-a886-32179af203f2%40siemens.com.
