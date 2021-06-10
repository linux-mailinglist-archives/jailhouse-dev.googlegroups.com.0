Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHGRRCDAMGQEWYV6LNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id AD70A3A2ED5
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 16:58:37 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id c12-20020a2ebf0c0000b029013f32d44cc7sf1241586ljr.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 07:58:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623337117; cv=pass;
        d=google.com; s=arc-20160816;
        b=gntG2iD1bUy3L04a+YbCaZkdKScT3K3iqEuPNrtsHqRmu66onMZcVmml+U75UA0PV4
         EdI/bszqUHgTWF6I9tKZRQMtSWfu8tStiDGX4nnd3UrbOWfys7b0okueHYS7vnKD6VvG
         wvjJFlqxgdfJDxD4gda7g5WoMFgVC/akmzJNBTjKXyzU4CDTJ7QFdMwwDjQ+qWBqtpqc
         zLU8pLlZ2nrn0yQ2nvzMRkUcBhL2x8Cu4jijYnrkszXFQdf7e9IJ8XE566NAs61vSSL6
         UTQXMhEBqMF8XMNuIfUEpYirtl6vW1Fyj726OQg+BMx/wNbvRRRV3VbiQEPhXlOicnP+
         iwyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=8gQk6nMSqxsQKFDwNYWiWwJGx4jKtwpZkhBs5/YAPg8=;
        b=jAwOpsM2+0OFOr3PSJtnOIS60HIVYJd3iuGNNUnAs7ETOZH46XbQZxTPA1B/nn2CFz
         UFosL17Ug6w5LQYHgMClLDarRc9R9usp6+5/uhWgI7Ji045ghK5WjyNIbWKasatQhZqR
         yevqiYcBn7jKevRKnGj0pplSexZzH4AfqIEg/iS1mu3ZrNKrItIB5RGZXBMU5/IaHU6R
         O5LZ26WCIoQJsPqITqAbEqxJftV23CTBejO3th7NXmORvUm19pBiwOrKgI1eL3QoU1IQ
         YTDfsVlcguwU0JINgRNw90vXfNM+JMAY1hQmxm6qHbD/AKl6ERPd1AefbUguLvA3w6Ba
         o8JA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8gQk6nMSqxsQKFDwNYWiWwJGx4jKtwpZkhBs5/YAPg8=;
        b=fU6EULVg6BdD+HM0RjjkL7eaduRj3EQcy68vwHgvA3SUyqu6YY1Q1w1gOBy8zfFHef
         H482eI6UKw8+zMJrvRnpE0oR3ppcLK622W4gJ5T/jZWtbTOt5UFoN/9au/Gpt1Fwk+3N
         tkfBU61l+147oixZJyqPjG4kMPlHShf10eDIvIXsiXyXPtEfaBl71d5d3GUweqZsceau
         m+aTc17pAdtkZJM/m9qG4BUDdtZLqC5UGAanPrCJIcMnI1aQwf8K2c5dnA15VycV35kN
         7jurSd+FKIRbtsS8bi0j6W5if2HtGCV5zFfTyBiXkVYMuHeNoZk20MVfykj2l1O1lAWA
         mBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=8gQk6nMSqxsQKFDwNYWiWwJGx4jKtwpZkhBs5/YAPg8=;
        b=KGOz8P+Ot69l0u0jLzU0dA3vCi6Fomb+hfrWw96oKg+b9oto//5sVNGprHTDoJLdBA
         uBon0JmqutgaXG0ff/If+TzFQDwyKyUZBQsP5l5cSag4z3l54sfWdGoVC3rOEaPjz5wM
         qSxoiAj8hbLJ2Ca18mrW8CrijNTPNY28oniJLIJG6XAIVIkJwJ5fsChBsM3id1GSfx9r
         j5sOuxhz4tBOOPsHJYwXv0gciCDEBWQhwWQAmfjdRY03U+62dckRLP8ZNTwjRZKHgxkS
         AldACEDmdNg3baQo8pYZ6fvNikmArgxL6cb/3GmUPxz72aZsTGoqlAPGd81+dWhdrxsK
         veBg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533wvJSl7khkOLR/gZubb6A/VqgRdweWD7C9y5TB0xdRHzNnI9eH
	rGlt/IlisOAdxGhxzANa0TY=
X-Google-Smtp-Source: ABdhPJyhXE+hFSsipxhU5oHq/SY+mB0NGa0JnyAg9t7mygbqrXXI3GQzzQPqIloqrkpVHIXCXZ/eTA==
X-Received: by 2002:a2e:8ec2:: with SMTP id e2mr2434656ljl.446.1623337117035;
        Thu, 10 Jun 2021 07:58:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8790:: with SMTP id n16ls1185864lji.11.gmail; Thu, 10
 Jun 2021 07:58:35 -0700 (PDT)
X-Received: by 2002:a2e:b6c3:: with SMTP id m3mr2603485ljo.33.1623337115839;
        Thu, 10 Jun 2021 07:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623337115; cv=none;
        d=google.com; s=arc-20160816;
        b=JsKp48xn6LPJoOvcTW5rbkdPpRfk3kErfv4rm3/fmMShZRMWoX3QF/K6asZGCB68Pb
         XNGy75WdY8ks99GrdybWFYA1e2Q+XJHGrvusqJxRkL82ZSBz4Qdw5gnSHKRQdAkZlfct
         z1MlUDa00ow00maMr6H8WVIYQV7um+VmfZoM8U3jNujShYmPyGfp11h/Oh/hWcHB/z1w
         eWCDbLlnXsk5z28cckDOdYghBXn/o9TOx9gCRBbC0u/WXZ3pKo9ybzEoWYU8FZSgIDCn
         gih4C2/lZFjSGmoAtwIiouM9n6OFw3M688LsOfVSKRoqu4jthtVy8eIswjtKJ4smEa/L
         Bm0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=X6hTax7PoROVCM2IXrAQ2CpTdJ+OjuoSJ6YTUXY2JJ4=;
        b=w4eNZaQ0IhAuTzNiqtfgZI6GeirTklwYSIqCQgOZelHVp1QRfNYQYYgQHE+coCWALn
         mh3Eyh/xB8Zynbc8HUdFHZKsRmWZxlRQW4xE+5NXNq2GfRmuR2NE8XX31o9udxgWRnMk
         FI+QQTM01DgYo0r4+WmJAeQTkICdPcHPnyCjc2qR03ptNRQjtCp7iM9IErXMpd8pAIT5
         2k7MptEXRDamzeMvXnPuWaYwCSto/gWgkZ2oE7V5r6nPav6ZRxI3MDAD6TCZmPW5XpoA
         QpAFF4sZQNV4osx0m9wdpkPwbbCKq+qfx9oiUr60WiHNwO8xXtB04jV+Jb2VkFSin99P
         vTaw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id 79si109267lfd.1.2021.06.10.07.58.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jun 2021 07:58:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 15AEwQNK024748
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Jun 2021 16:58:26 +0200
Received: from [167.87.77.77] ([167.87.77.77])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 15AEwPEZ019968;
	Thu, 10 Jun 2021 16:58:26 +0200
Subject: Re: [PATCH] paging: correct a comment to bitmap of used pages
To: Dongjiu Geng <gengdongjiu1@gmail.com>, jailhouse-dev@googlegroups.com
Cc: gengdongjiu.gdj@alibaba-inc.com
References: <20210608143937.17263-1-gengdongjiu1@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <be2a60b4-d46e-f0f2-86bb-16ae950f0117@siemens.com>
Date: Thu, 10 Jun 2021 16:58:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210608143937.17263-1-gengdongjiu1@gmail.com>
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

On 08.06.21 16:39, Dongjiu Geng wrote:
> The used_bitmap member in struct page_pool is a base address,
> so correct the comment to make it is easily understood.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>

This change is sufficiently trivial, but other patches may not, so:

If you are sending on behalf of your employer (I assume that's Alibaba
here), it is important that you have fully understood [1] and got
confirmation from your company that you are allowed to contribute.
That's because they tend to reserve the copyright on your work on OSS,
often even when doing that in your spare time (see your contract). To
make that confirmation explicit, people usually sign off with their
corporate email address, even when sending via a different email provider.

> ---
>  hypervisor/include/jailhouse/paging.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hypervisor/include/jailhouse/paging.h b/hypervisor/include/jailhouse/paging.h
> index 8a6ff374..d592abad 100644
> --- a/hypervisor/include/jailhouse/paging.h
> +++ b/hypervisor/include/jailhouse/paging.h
> @@ -64,7 +64,7 @@ struct page_pool {
>  	unsigned long pages;
>  	/** Number of currently used pages. */
>  	unsigned long used_pages;
> -	/** Bitmap of used pages. */
> +	/** Base address for bitmap of used pages. */
>  	unsigned long *used_bitmap;
>  	/** Set @c PAGE_SCRUB_ON_FREE to zero-out pages on release. */
>  	unsigned long flags;
> 

Thanks, applied.

Jan

[1] https://developercertificate.org/

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/be2a60b4-d46e-f0f2-86bb-16ae950f0117%40siemens.com.
