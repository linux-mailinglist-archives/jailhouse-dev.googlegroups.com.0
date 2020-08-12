Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIFHZ74QKGQEM7XBE7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D232428BB
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 13:33:53 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id t26sf792427wmn.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 04:33:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597232033; cv=pass;
        d=google.com; s=arc-20160816;
        b=OQsYB8kfLww3Hrvpv6opjJSJlkF0sdfnqpg+yowxZ6vNgEt4i9G+a9kRgepyEUah7H
         vCN7lk3bEUKed8ZdtjTn552F4k/icv7ZZQBwbghLFQbgINfAY6uH2T4qGPNg4gt+ceIJ
         OVaLi60J0flDEUE5AfTbXQk4QGKK2k9MXqB+SmxrL9rlgMx7LT5GksD9Uv0rzbaT8Dnr
         KDjvwEaafVfdNiyJWalGyvwJZaW7fR7Qx2TOVdF3QuPhuRgmWNfsWAAu2a9/9YOAt0Gg
         T7p5ikKGJXDjNXfrxcFCmt9HdPkfzIGYAy1FQFHQEvXIqkOilkBz+Yq8plk+XOohpOwf
         /q+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=4yREEazbv9/EwomEGbp8u8qJrsRNlXsm7pyCBZ65m+4=;
        b=Fc6sZHl+SSd2S+8oJ36yMlhW4DGLrUfb30DrhWJHx/1TKD7bOpJ7kSXyNBqXhY5ykk
         XUqFSqnw+o+ffBOxWvlJBI2W4qdfItVbw+viaWDRRTQ1+79h2ceozwEx+/K/NpuOpE3S
         rK7TO/rFX5wuPR+r7F8vuEtqCGQcfKfxF4xIXivz+NLepR+06mTSpbuXHjvRHk1wqQ96
         MvS5dI5X/PzifgG5CDp6bgPNEPGHLT0mwKk5y1mXKYCcyAT6nOW6OHVKTkruGjGiZPnU
         EUC/RTLCygEpJNwwY3giTIAoZkZyAT5JMDUVLfuqYR34fQj4pH0URzz6h7XlYQCuqPQh
         BtyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4yREEazbv9/EwomEGbp8u8qJrsRNlXsm7pyCBZ65m+4=;
        b=P3Cf3hTT0IiByQ+oQmJd6GCGu4efzmb7p//Lb9E5JRvSIqnHV0EJ4kii1iFjwUarai
         vPUSZWm8h9uErKlj7CoapptEgxYLzp3WOc2RCjrSSfgOCgO1TMv7i8S0TbvYVKSLGAkO
         gA0n/QilCVxHQsyCajw+KjgWciymawi7jpt/E34wHQrH/gY+SUXOJBxGIxRKIgMym1hr
         jTxXhkdX/VasI6UK9LuM1qOCSz00MV6+bqwh/NuiVLICbdw9xDWt8QIEegWV8LRcArqe
         vg1aFLtH5o2emhr8e78NxoCLgRkCTOIwWET3gvzCHvFVCP3OqLCoVF/T/x5upnPSM7mP
         5BKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4yREEazbv9/EwomEGbp8u8qJrsRNlXsm7pyCBZ65m+4=;
        b=dfQ+Pbyu9P3SONGV9NSAlfjYCzDEHOTEAagCkncdf1hRS1NTE49qIEnnrgO3sUli3i
         hPRiiYlWr6/2e734rscVHkhhsok1i7F6NGfNjjMkcJBs/azStDQhxgmq8raJXpxoLs8x
         K4Fy0eZu+Wu3WxWN0T0FFutdwU74HgFfDJr8U7emvKBl4c8juKVgsYFx07kIi/x5nF5r
         ljyvrrGXqOYxDA+L1b9lqh3u9Y03paMKFMat3hSyJxFy2UgcG/pSsqlOa71+16Bp0vw/
         tWl9oO0N3QM69PIA4Y+rCNZMOgDastG7rZV2Gjziwi8ZYPI0HLL6gvYM5cVgkYuaSyk2
         L9Mg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533yy5nxolZKlvBBWWqL0muAX4/y3jlggfTKX4Q0r5Uq8INZJwph
	FVjf6zmcgzlhrDOBW8T95Ec=
X-Google-Smtp-Source: ABdhPJyp2RLbgaFcu02LwBxTH7YzP+KpWCEVfu0sj42SKAdy+jOmtbUCEJLQ/vPMtWk66GdI1Ppkfg==
X-Received: by 2002:a1c:5451:: with SMTP id p17mr8714555wmi.180.1597232033332;
        Wed, 12 Aug 2020 04:33:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2049:: with SMTP id g70ls841188wmg.0.gmail; Wed, 12 Aug
 2020 04:33:52 -0700 (PDT)
X-Received: by 2002:a05:600c:21d3:: with SMTP id x19mr8548950wmj.174.1597232032528;
        Wed, 12 Aug 2020 04:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597232032; cv=none;
        d=google.com; s=arc-20160816;
        b=B1//sbZefFHUpeyQn+yup/AJVjB+8OvsPyE+7EwDuwq23nPasNDfbP0RvJVY9Ugj7J
         gPBZPKwboE2QLEWJz3ML9zfXAAPU7Y+B77uNBcregdTdpuw1vNm0pwhq5c0OJnz/6jRH
         46HN78Zkv0QX8VE5GdAK6cssyWwxnxSOWZdyjhjJ6YmIopkWGYSFbfLhkTcXIwzjFbjw
         wTmcY0rt+btqrTFwltLQJwAMLKJND5GAHbcdcQRPN6BsokwP7FCrI93xJs85MB16okPU
         SnsnaqTe+yghh9NkDTu5HKG2Y4uaeUOhnBtrD5isA8ki1dP7GuhBPfuYUzjQ5SJEo6cE
         Ia3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=XRuxn6/WA8bD40Bt+xUxcyNj3qkqCMTydv89/iYDkfM=;
        b=p+mbEnxl3oW9dFQt3wILUTQlN0JOq2d7r1IqW3zO3ixQMrT0+TquXJE/lEDSlK9N8/
         fYqOCFLZP5u47vK/9A3WlnvOgSidJQcGeVc99wbFYS8FoXdS5vRExlV0pLtw260FyCTw
         HJBidn+qnFtQJdjShkiPJy6plNGaPNiQmcyTYyy9LZ8Tm5blqOWsK/4FwR7tyDFSkULg
         BnU6hpBI4q6gnjLDEY6mtJdytgDIABRvQIlf7DWDKm01qWzVmMParAX30ieoNaBrH7W1
         lRsChKLGuSQ1MtKVZzVrMLiQ3BaALvs+fkZBrk2uNDXc2GUHLF/0BOZl2zAitvtY6sjG
         HKQQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id f23si205208wml.3.2020.08.12.04.33.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Aug 2020 04:33:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 07CBXqCP023937
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2020 13:33:52 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07CBXpAp018664;
	Wed, 12 Aug 2020 13:33:51 +0200
Subject: Re: [PATCH V1 4/5] arm: include: protect header file
 hypervisor/arch/arm/include/asm/bitops.h
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200811181641.7282-1-alice.guo@nxp.com>
 <20200811181641.7282-4-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c7a37ee8-371c-d3e2-90a1-7fda635505de@siemens.com>
Date: Wed, 12 Aug 2020 13:33:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200811181641.7282-4-alice.guo@nxp.com>
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

On 11.08.20 20:16, Alice Guo wrote:
> Use "__ARM32_ASM_BITOPS__" to avoid redefine functions declared in
> hypervisor/arch/arm/include/asm/bitops.h when building for AArch32.
> 

I do not yet understand the exact need. When does the build break 
without this patch? After patch 5 or already before it?

Jan

> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>   hypervisor/arch/arm/include/asm/bitops.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/hypervisor/arch/arm/include/asm/bitops.h b/hypervisor/arch/arm/include/asm/bitops.h
> index 67aee781..2940ae16 100644
> --- a/hypervisor/arch/arm/include/asm/bitops.h
> +++ b/hypervisor/arch/arm/include/asm/bitops.h
> @@ -13,6 +13,10 @@
>    */
>   
>   /* also include from arm-common */
> +
> +#ifndef __ARM32_ASM_BITOPS__
> +#define __ARM32_ASM_BITOPS__
> +
>   #include_next <asm/bitops.h>
>   
>   static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
> @@ -42,3 +46,4 @@ static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
>   
>   	return !!(test);
>   }
> +#endif
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c7a37ee8-371c-d3e2-90a1-7fda635505de%40siemens.com.
