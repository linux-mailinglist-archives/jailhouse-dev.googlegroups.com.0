Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB6E6Z2LQMGQEOF7CZKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DB558EAD2
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Aug 2022 12:59:05 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id r10-20020a1c440a000000b003a538a648a9sf4375980wma.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Aug 2022 03:59:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1660129144; cv=pass;
        d=google.com; s=arc-20160816;
        b=IrOQU/mBGHOI7M/U7Ot8vuZSD1FKzTqRETO96cMW/Yn2DGQ/0L4PijJdG2Hv7zVOen
         Ds386eHvOo4NuoABWrFbkFX9RIhzl2eGaQfk08kAESLnNQ5DjNfIRDZOWw84Ud11m5uG
         2aemTl67KLxPYEL3Y3YEir9tE2b7W9Y6uzRbNiKXgBkfAVzNFa+wsINuHw1HZdNThHil
         qIWPxFx2PzXcFK8QM0uBi6rdCu5kFYHP3nt3zlLcQolfl8zr6MM/7AtCJjyfb4O6RNE1
         5UJ4GgIKpRakzKRcbwrZ5A0VJxqk6zJVMVqe2PqUckStec+hBIApg8+5TLYl4qklR9xV
         jkHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=Su12w98VgZpsXPSkoN+Q7HqBGDmfxji9YYCsPmswVRk=;
        b=juFUSKZrc4rsu/Q6WDYmIPw4iFiG3J+JpTxP9kSw35GtoUvpaJPv8luvpo2+6tG1vh
         9euxV6OpWLpBGYYzAiHMwS34r+dTLWZK2oqFgTRzvKrSJR0nAI5W5AkKwbbikkeHaJET
         fd7dI8umPXHa0IJ9rxwQj2ZvPoWRO8F5lYPhgt0F1ECd3SyUpUZgooZ4nH9jzwTL99Jt
         UkJhJfWZjWMSG8d32QUA1C8jn4x52W+GoVrP8n6XGbt4U1hsk6B6yngEqz0TZhqLVjNX
         tqCVRZshmW96u/ymdcx3S7E8I8Llj0u9c/OrrfkED53Mdto65Ve7vwDsyT0NjxRW9ohP
         EVUA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=ZOSRkwwH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc;
        bh=Su12w98VgZpsXPSkoN+Q7HqBGDmfxji9YYCsPmswVRk=;
        b=gfxz9Ug1O+ClEjI6BbcZDAcsLoSrZpsNmkGgCN7jpHhw048DCivH9jQu755uKpJ6FN
         3OoFdCBxYDIgItsXP1FMQywHrwmXJeJcF6tJjaYDZwxdPFKfj9duL7HiaDj/5tK+qYsY
         ly24X7FwEiTs0utOdkrrtTmYhSw+vAv6QjLUlRKjPyxFFgWqrO9kGmPmgNVRtXS5/bWz
         JH36wdEgEoDqSfOqKZgOUboJY9tVkBhOF8pz8zCEdPjHo548KtgodyKJ4CQxWb8zT2+m
         IVH73Xuc8JR1Vfu8Hi6xkgNuHGX5P+uXM+iCDVcDZDGW/cAfKg1Na63QXMxN1UT3VCX1
         ZcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:sender:from:to:cc;
        bh=Su12w98VgZpsXPSkoN+Q7HqBGDmfxji9YYCsPmswVRk=;
        b=Gkldqgrm4cr+X+fAfzmHTy1t3kaB1ctvZ2I3zpvzLXoI4gaZOEdAA5pSyWHfxG5B65
         yFwXc8dBJUiS+pvypjvhy+81bRWh25bOtTVFieOxGhpOjGd607o2O2JL10XhD+D7XEES
         PFvlwuCw2xN/8ejzwm6oUOjfkXRmHnLcVpjNQ4xlMAZivKjcIzgqCNb9guOaceUDvZ33
         MQnADRJ7YP6+oRx7qbL+eY6GMn/a4pgMYiE+ucJG9SYqm3Bh2o4K9ZxeL+0Q5XrD1hAZ
         O1R95hVtgFzl02FUQSOd6gF4cmMhkA45YpvhOcy3QL+/DvDSp1iqYLPoxqwYC7tSlGjc
         fqPQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo1EmO0C4U8xBQgrfJpg6PQFZCuemsDqSRKBawjjOXspCb4jXrnq
	Gj5zvWGolb0oPK6Lk6HbrMg=
X-Google-Smtp-Source: AA6agR7r9iQYZKLIiKswfz+9k0Ove0OalLwAiOCRHbKafq7C0lc6zSSh7YHyLvFVtW9OuD3cdwumlg==
X-Received: by 2002:a5d:6dc7:0:b0:21e:4f85:fa3e with SMTP id d7-20020a5d6dc7000000b0021e4f85fa3emr16432651wrz.266.1660129144676;
        Wed, 10 Aug 2022 03:59:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c856:0:b0:3a5:3ad7:4f6d with SMTP id c22-20020a7bc856000000b003a53ad74f6dls2865913wml.0.-pod-prod-gmail;
 Wed, 10 Aug 2022 03:59:03 -0700 (PDT)
X-Received: by 2002:a05:600c:3b10:b0:3a5:3357:ecf4 with SMTP id m16-20020a05600c3b1000b003a53357ecf4mr2013069wms.193.1660129143094;
        Wed, 10 Aug 2022 03:59:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660129143; cv=none;
        d=google.com; s=arc-20160816;
        b=cMho9Vzx2fzOc/ZAc5XgGv+9PnwHn1fWn2Q7btDY045LOty2t64LO0VCWNWk67Dlay
         7uNdQW6dzqbS8xrKJe9B4wNsN/HUbLiT3SAYB8c9fQTkX3VFmQrXNmsDOXO0uXo8QxlR
         c923rsVHKoBEwPRjqkcwiLrHXlQg6ywKw+0V8SeRX15b6M3KFoEecKs+WpsITesL4B7r
         Cp0S/BstKGafsWRtn+qEBrYu4GuAhpNKYtwUNHDTiz5KuL6Ul3Sa9XY+SmVsk5Kk/5eB
         MB87lP2Cf40r4hb+Ai65NiecsVQXJHqJIupYgOBDt+cIp2Up/pUrp/xK26fPuuM0a43x
         O7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=G89h7WGix6+3MjmLrYLSiT/mLJ5UvF0fAaW5REWA+NA=;
        b=QBrKdgri7H9hfEBJlMsydoIwAnoQlUMJ96FqK/1iolM2VlybYRX1mqh7q38EbusHO5
         gQbTew8PksvT0nPs2ZTfOUtt6skc/u3CEYYz/b5rwPYg3jGuEcu+xyCr05ogiMKdGSYz
         qGrX62QcZawLPvdYKOyZ+yaLin/NOt/G+Q7V2Tjr5BCatR7tm62iVR1oj6HNP5yDDRru
         CR2lieUQI7CYPcXlLJLvnuhZcT5rOLL6WOmusVQwI5L4IXQCD3lV1p4HyPBQqC+2GIhg
         kobVvI3nzMs/GqYyulRXbfUdvYKuv5zf4ZwIwGZO9KyCuNF+Bcc3YpkqSoltrjpYnJZK
         cv/g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=ZOSRkwwH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id v22-20020a1cf716000000b003a5582cf0f0si34537wmh.0.2022.08.10.03.59.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 03:59:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4M2n4Q50sFzy9H;
	Wed, 10 Aug 2022 12:59:02 +0200 (CEST)
Received: from [IPV6:2001:638:a01:8068:e089:ee05:7189:d907]
 (2001:638:a01:8013::138) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 10 Aug
 2022 12:59:02 +0200
Message-ID: <904befd2-205a-46f1-dd89-2ccca951ae27@oth-regensburg.de>
Date: Wed, 10 Aug 2022 12:59:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] configs: arm64: qemu: move virtual PCI controller
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	<jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Stefan Huber <stefan.huber@oth-regensburg.de>
References: <20220623212019.150691-1-ralf.ramsauer@oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20220623212019.150691-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=ZOSRkwwH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

*ping* :)

On 23/06/2022 23:20, Ralf Ramsauer wrote:
> With recent QEMU versions, the GICR grew:
> 
> $ cat /proc/iomem
> 08000000-0800ffff : GICD
> 080a0000-08ffffff : GICR
> [...]
> 
> Hence, we can't place the virtual PCI controller at 0x08e00000 any
> longer. It will collide with the GICR. Move the pci controller to an
> empty spot: 0x81000000 provides enough space for the controller.
> 
> 0x80000000 can't be used, as it is reserved for the commregion.
> 
> Note that pci_mmconfig_base must be within a 32-bit range at the
> moment and can't be placed at a higher address.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   configs/arm64/qemu-arm64.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
> index bb3e079f..f4e5d378 100644
> --- a/configs/arm64/qemu-arm64.c
> +++ b/configs/arm64/qemu-arm64.c
> @@ -40,7 +40,7 @@ struct {
>   				  JAILHOUSE_CON_REGDIST_4,
>   		},
>   		.platform_info = {
> -			.pci_mmconfig_base = 0x08e00000,
> +			.pci_mmconfig_base = 0x81000000,
>   			.pci_mmconfig_end_bus = 0,
>   			.pci_is_virtual = 1,
>   			.pci_domain = 1,

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/904befd2-205a-46f1-dd89-2ccca951ae27%40oth-regensburg.de.
