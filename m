Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBC6DSWEQMGQEU5PU34I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D93F6AEA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 23:15:56 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id b1-20020a05651c098100b001c3bda9881bsf3306059ljq.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 14:15:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629839756; cv=pass;
        d=google.com; s=arc-20160816;
        b=aGRmsvzkWyrqnS8f1NdmFLXmc48FqwgSzGGjrBUSsM6Z+2LKjX5o37LMyZdL7vmZw5
         DyvVsOoxlXoO4xfIQPrR6EixOYmJuOxcnitdf8i5XPgQsKnM2EVQVH9AFnzvPCZJFdLI
         oOtU4SmZx8CBV8Pc5VSD4lGvyBBCgmKNN0T4wa706H9OFWGLSaNiE1pVRtMFnUyxyk4w
         dLHnkD3nUpOkhQJ6X6OEqbXRxET1XTEQOkOzuDZosEUIMhJVHWV8V2zrBrm7xuUt/e/H
         xHDrePLfkklPmpbB/w6L+8zLuvPh/h6jGnLadHvFVjZZVa7DPqWM+82Jxmehw0PTiL18
         5tVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=j1H/LrYDHPJERB2SuRyt71RwY6Evfd+mVf4nBWNwi1E=;
        b=vo6CGcE7sJ5ohNJPrtIhw7dIAi2QPaqywk3y426bYYlWtxns0NOip4CZYZ+Vko1cOX
         WoofsxL5Fq0t5lnc3t1Y5aarL8VHzdAhOol8/Cjn9clMfuFf70flZk5CTRAhHFqUF5Kg
         FFsSqiwFjKSOkyd4m2eF8edMmNUQKW65qAzsDZjF8sdffnPVGBExlufLxyQHlFD0vT9U
         hcYcGxj+m/RvpqbEjPGG3ARV6kXd9H0D4tqUF2z1dyKoDBGesSEm1jlq6fE75a72YBXw
         kizNNX7YGYufVb3ElKHOw2iOGqDPPjq4ch7soBZMfG1ySnwemh74w6ozCJIhXHK8NirF
         7f8A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=j1H/LrYDHPJERB2SuRyt71RwY6Evfd+mVf4nBWNwi1E=;
        b=NjwTc73GaNu8KAU9QzdUu/AG00JhSMYlLyXaxnbzdeajGiwGkws57HBUZG88+sa3ac
         2JwDgv56LvSM6yH9Z3KUJiUJlTM5nYXR1C2htlOjjvxMHgMeiQdeRekat0fKrlWDSA7H
         EdtCEhpARD4k5YxELUV6NibA0A63szW4OvvMPONWFOJnvuwsSVnigCSDYiqlp5dhyyGd
         kEh5U4ikjTYZ9Mo193RZEP04xu6ve+5ZB2sCsdw97k8tr4T6d8TKsqNnrBTuvXASSvad
         //NRUzTMuGBOMa2HSTjV2juBILxJGsz88cd17iP2Ixj0nNgI8Y3zVVMyziIrNVb588Pk
         PNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=j1H/LrYDHPJERB2SuRyt71RwY6Evfd+mVf4nBWNwi1E=;
        b=BAtvk8+Ym9RPq2XJ+QgEyyYLAJTf6GG+5pJuu/dDAcMzyXAKE+AVogYFxR4hhePyVp
         JDD5Wk/fLIsVXHIA8VvkF1EgNfVFCIw/pXj3OqxzL0p6aCv7Gad3HUONEbKpaUFoO31x
         Z1d9PWzavP9rbTSBHjZ3PIiEQPc6kwjzfQjLqmyMTxnH3KqBveVfc272sqLI42l0+QL4
         xdMcsXwnzB74FHOK8Qxp/cgnRL2Hg8eBXabc9P0A+ekpknJHavy5sNp5GWMbi5W9+4X+
         XlwjyTpDwRLQt0VFWYvs3/mKk+4/lOPGVkG9Uez2f1Hfr8bQCbaMWHClP7+hXgC03XDm
         GwNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Sgk3OW4giHdvOrzIfGFlXb0H8BFvdYggfm32mtzFQ/iLcJU1b
	1Abvrl25oXMclmYsVAj1pig=
X-Google-Smtp-Source: ABdhPJyh50yiWeAMVHQVGWV0EAqVaPsi7hgTJHvMGCF6oKfFgynDpX5Bf8zv1wRLHb+PwUdRnPKaiQ==
X-Received: by 2002:a05:651c:981:: with SMTP id b1mr32362075ljq.281.1629839756221;
        Tue, 24 Aug 2021 14:15:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4146:: with SMTP id c6ls1338285lfi.2.gmail; Tue, 24 Aug
 2021 14:15:55 -0700 (PDT)
X-Received: by 2002:ac2:5463:: with SMTP id e3mr30656510lfn.644.1629839755033;
        Tue, 24 Aug 2021 14:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629839755; cv=none;
        d=google.com; s=arc-20160816;
        b=itFeu6Ps2oZ9xeUprVulKfUkZ6koTxT7Kk+Ez8vyvPj+hK7xQ9NXvqZRNt5aHxzBek
         E1wstj2ku2V4CoqwESuvvmeZjimHKDUFbMlRSi20YAPxRjR//eBw2SLgpSxg1n5XJCqq
         M+Ve+yUxrm8LoFJFkDAOo9mnO0mlp1B6G694s0zufPjKynsNvX7mGFDNLMSkuoKCKXXS
         QtbQSrPN/G1N5VxpiJTVcaVQqpqNjGNfSfc3bJ2uVR6u11jHIydFV4NIDE3MUmI/X98S
         CQ7vsnoXyEdDbO/S2ykJa9dTwhh4mbXjSLdmEZ3GI9n7Vw46WydLzVXXbcu2l1jbvWWU
         RMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=1EZn2ahqE7teLhfgOVlOYuNhazhitukUUyEF1Eaehfk=;
        b=kUQtpZCMHBswoSviLAo0D1crfUj8zE90qfWGLXrk5gaSQ0dMDIFUdMUAZL76nsZiFE
         TqHuHitK7xUpBHLVKlS5VDkJcKUxkT96gZfLUxvwOePDB1oOfz+NSYU02j64pLTM9w4E
         NyBqJpJZvbNIv/hHU6+RRjtkuhw+tpDoIdizBtdjabXew0zW03HmLskTIPww+D5SOJ5D
         eVHCUmDYxXsNSt8bRfsCilmzqlOQDTGlbwy/fhMPj4jXGl3W16AFeeQ6UbrcqrywuJo2
         QvjIr8scjXNm7x+5Gu3uDzMpngpnU03FL7tPQzmo9iixqPiQ0XTimDInmg8uKtY39B2I
         UUqw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id h2si1116011lft.5.2021.08.24.14.15.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Aug 2021 14:15:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 17OLFsXI006555
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 23:15:54 +0200
Received: from [167.87.75.154] ([167.87.75.154])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17OLFrm3023421;
	Tue, 24 Aug 2021 23:15:53 +0200
Subject: Re: [PATCH 5/6] x86/cat.c: Fix overlap on moving the root COS CBM
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR02MB6670FDBC485820011AA5E9C4B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <689479b7-b16e-2716-8802-aa4705cad6f8@siemens.com>
Date: Tue, 24 Aug 2021 23:15:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <PA4PR02MB6670FDBC485820011AA5E9C4B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
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
> Upon cell creation, the ROOT_COS CBM is shrinked to prevent overlap
> between the ROOT_COS CBM and the CBM of the newly created cell. Here,
> the new ROOT_COS CBM is prevented from becoming empty, and in doing so,
> the ROOT_COS CBM potentially moves to free bits.
> 
> There are two additional situations that need to be reflected by the
> code:
> 1. It is possible that bits which are listed as 'freed' are also taken
> by the newly created cell. Given that the freed_mask is not yet updated
> with the newly created cell, it should be checked explicitly whether the
> freed cells prevent the ROOT_COS CBM from becoming empty after moving to
> the freed bits.
> 2. Even if the ROOT_COS CBM is not going empty, it might still overlap
> with the newly created cell. Hence, moving to free bits should not skip
> the shrinking, in the else clause.
> 
> A minimal example to demostrate this bug for a 10-way (bit) CBM:
> jailhouse enable: creates a root cell with COS0 and CBM 3FF
> jailhouse cell create: creates cell1 with COS1 and CBM 1F0
>   The free bits are now 20F, but as the CBM has to be contiguous, the
>   root cell has CBM 200. Free bits are 00F.
> jailhouse cell create: creates cell2 with COS2 and CBM 3FC
>   Cell cell2 requires the top most bit (200), hence the root COS CBM
>   takes free bits 00F.
>   BUG: Root COS CBM gets bits 00F, overlapping with COS2
>   FIX: Root COS CBM is shrinked to 003, preventing overlap with the new
>   cell cell2.
> 
> Fixes: 3f04eb1753bb ("x86: Introduce Cache Allocation Technology support
> for Intel CPUs")
> 
> Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
> ---
>  hypervisor/arch/x86/cat.c | 53 +++++++++++++++++++++------------------
>  1 file changed, 28 insertions(+), 25 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
> index f4c6f5d6..c91560a2 100644
> --- a/hypervisor/arch/x86/cat.c
> +++ b/hypervisor/arch/x86/cat.c
> @@ -105,32 +105,35 @@ static bool shrink_root_cell_mask(u64 cell_mask)
>  
>  		root_cell.arch.cat_mask = 0;
>  		merge_freed_mask_to_root();
> -	} else {
> -		/* Shrink the root cell's mask. */
> -		root_cell.arch.cat_mask &= ~cell_mask;
> +		/* Check again, as freed bits might also be in cell_mask */
> +		if ((root_cell.arch.cat_mask & ~cell_mask) == 0)
> +			return false;

This does not look correct yet. If we fail late here, after the merge,
we already modified root_cell.arch.cat_mask, no?

> +	}
> +	/* Shrink the root cell's mask. Might still be required if freed
> +	 * bits overlap with new mask. */
> +	root_cell.arch.cat_mask &= ~cell_mask;
>  
> -		/*
> -		 * Ensure that the root mask is still contiguous:
> -		 *
> -		 * Check if taking out the new cell's mask from the root mask
> -		 * created two halves there. Then shrink the root mask
> -		 * additionally by the lower half and add that part to the
> -		 * freed mask.
> -		 *
> -		 * Always removing the lower half simplifies this algorithm at
> -		 * the price of possibly choosing the smaller sub-mask. Cell
> -		 * configurations can avoid this by locating non-root cell
> -		 * masks at the beginning of the L3 cache.
> -		 */
> -		lo_mask_start = ffsl(root_cell.arch.cat_mask);
> -		lo_mask_len = ffzl(root_cell.arch.cat_mask >> lo_mask_start);
> -		lo_mask = BIT_MASK(lo_mask_start + lo_mask_len - 1,
> -				   lo_mask_start);
> -
> -		if (root_cell.arch.cat_mask & ~lo_mask) {
> -			root_cell.arch.cat_mask &= ~lo_mask;
> -			freed_mask |= lo_mask;
> -		}
> +	/*
> +	* Ensure that the root mask is still contiguous:
> +	*
> +	* Check if taking out the new cell's mask from the root mask
> +	* created two halves there. Then shrink the root mask
> +	* additionally by the lower half and add that part to the
> +	* freed mask.
> +	*
> +	* Always removing the lower half simplifies this algorithm at
> +	* the price of possibly choosing the smaller sub-mask. Cell
> +	* configurations can avoid this by locating non-root cell
> +	* masks at the beginning of the L3 cache.
> +	*/

Comment indention was damaged.

> +	lo_mask_start = ffsl(root_cell.arch.cat_mask);
> +	lo_mask_len = ffzl(root_cell.arch.cat_mask >> lo_mask_start);
> +	lo_mask = BIT_MASK(lo_mask_start + lo_mask_len - 1,
> +				lo_mask_start);
> +
> +	if (root_cell.arch.cat_mask & ~lo_mask) {
> +		root_cell.arch.cat_mask &= ~lo_mask;
> +		freed_mask |= lo_mask;
>  	}
>  
>  	/* Cells using the root COS are also affected by shrinking. */
> 

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/689479b7-b16e-2716-8802-aa4705cad6f8%40siemens.com.
