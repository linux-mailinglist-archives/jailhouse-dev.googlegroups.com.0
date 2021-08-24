Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBX6ASWEQMGQE6RASYEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6C93F6ADC
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 23:10:56 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id d19-20020a2e8913000000b001c2cf57d9b7sf3327011lji.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 14:10:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629839456; cv=pass;
        d=google.com; s=arc-20160816;
        b=qzgtSTSX+PM9b80GrZc3G88RRZig/lOdaYd7fVIQSewo5vbmWEHmXx00jdM9QIeY/8
         b5xsLO4z8Nq8AwRRpJnUBd09gcKHFy14vDdJ6C2rQBU+1AEiY/y436Nlb9CRjMyxCMUh
         ljOvfUY+qDMwDBNyXvSaTaaAheBB/yNHlpLDn8kF5yBltAf21v2i3McZvtUJsEIMxEwM
         QRzBX5C2x3yjY2v9x0lH1sMr75O9GFDzm0p874z7iZSmuX71ZoDsXwN/UrUkWPlh8z4O
         3UQBeZxc0d6II4u+f5jdyHQPHfYAjZYSgKJ77XECQcqS9rKm5f5Dxxgtn0gvKzHf28RZ
         G7Xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=EGWNFd5nfgQ2XICZ7EcZ8Sk1pBDjc8m+fysysaeXHSI=;
        b=Tw7E/oTUrgvbzeqqn22yWD5JfQN1NFtaa9cCdMT02Oi6JErB2ktkipEg9Q+s8MB5iB
         Ae19fiDQmBjlbAtp2XkGAuNvnoStxoPn5KBN4Gxal+GhvK7wq9HUHgqx2eC0hW541Aov
         yQu+xKxegcSLg9+LuHRPhGePjRUMIFBO5yw6FeYFruxq5rnMv2BwN9jjREAm/bRMTIhm
         dTpcuAUXPE5EzHrwMXemfxg0p0lkSA6OjfzgWrlHSjYw3Jth8xgGSN0NWwWwRTCjcZwn
         j5+g5hMQc/VY0jPkROnSKQRg4s/SfBmddAvqCoU7nqhJW2BS6pEBKiq1P2nGIZ5EoktW
         eJog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EGWNFd5nfgQ2XICZ7EcZ8Sk1pBDjc8m+fysysaeXHSI=;
        b=IeLPadgxQQ6aGYvQC6mF1urhLuS82Iw4/lUJjY0YhU6MJ0WnmpOYi3bdt2YYDbaD4N
         0a3z3aPMQFfmChitDAHy/eQG9bf/WPpxDdYp0/VSO1P6d6l/plMTbcyZWeFcQXFWF6cE
         TXF30YxFWs7c6d/nfe2XzhIU8uTdPSzWnAJOhS8WOixEELJ3BAfgM1efpK1NI37RDUP/
         KCRbRVT4tZDevPNLK3uHy/NG7IykPATOQuFZzPZodYPhJz/n/JgRB+TkEBDFHFmGQ8xX
         kSuN4K6DmQrhIQpNKQk4B5xyRstwMD5O0GoEh1QmrWtePOxCMhz9yo5LXgqAQYL/0NJ1
         lkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=EGWNFd5nfgQ2XICZ7EcZ8Sk1pBDjc8m+fysysaeXHSI=;
        b=rLunq41D9c9EXncqPPyAj9Vg1IcChKCVsHA+MR5cf+KxCGl2KezQozjdC+WoI/YjEE
         A8HTif0sBQbveDHkUdvJlexCykvr/HUN8qGPU09bv76oxhG8BammonLaqXlQScQ0v1t5
         YZMF9tCH3FguhVqBKQs6p0hAzJuqYwDwXZPCNC9fGYHmToL0vYm4pBLDrxvCzQgOPgfr
         +IdBys86vZUrbSbMGcxaiDR3fAOMWcbvM6LK6r8rWTWmAfPOlz68c4v6dHz2qp/2S0mV
         BBD0ZfekqgOsel/08//+k9UJa0GT1dqFThR+SFqHkFkoqefBXl1w/jJ9MHSCpa9swKAb
         sD2Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5316tQd/sHo96EAr1BbI2Zt2ejnnXVuNOsnTUsoZXfKp2HtcLWyP
	qxsxZsaIC6KbzlTofyGuyXU=
X-Google-Smtp-Source: ABdhPJzzCyxz2fkFwXZJ+sct0WwBu1EW36rSqjQF4P4/lTKkxnMrNE4JfSeGtqoc7XvIg2+xwBypyg==
X-Received: by 2002:a2e:934c:: with SMTP id m12mr32079023ljh.375.1629839455949;
        Tue, 24 Aug 2021 14:10:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:503:: with SMTP id o3ls9890ljp.0.gmail; Tue, 24 Aug
 2021 14:10:54 -0700 (PDT)
X-Received: by 2002:a2e:a4ca:: with SMTP id p10mr32888575ljm.415.1629839454507;
        Tue, 24 Aug 2021 14:10:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629839454; cv=none;
        d=google.com; s=arc-20160816;
        b=mMbvvo/8DB4JszeRGO2CTii7SuI+1Cwo+DLZsBU76IUbakM9uDFzSl06bFV5xBa/XM
         CPMaUlTZUXkuBEZtoxO6+tng3zv7rNmFVQSz5o+hSFvlooqxDk3GWtVS9d/bvbWpCUli
         GoiKQK/Mi/N9qivFGCOILPcNGaLm4goOXrv3e5TYv99CBiQJ9QjApboPYLO4aRIJIN6s
         RKyl0XhZ15bJGilNt65jh8kgx1t6FKRfnroYCpa6Lpc3lYKKABOUp9Wk/1cr8CSQkl2t
         y4LuOxXq5VS/TLQsJaFT4jw8cfKHwuyWCUZAxGNa5SX2IxgN+ddGi+glcvkjVq+3lGWn
         TmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=B/VKvjGmXTfyruurdOdETlfXUjRwzzspTCdrdfbfnpM=;
        b=qbnIl1xXEkz5qKZgoDfA59cXxQRsJ/jChp3NQ3sg7FIgg7/C/O+zNag0qsTNFn1vpL
         7tGvQ87z9de5SB6xyw2p18ofwe0e/fSRZZGfclZVXsqo/qN2OJMcC5VR97+DTu2rb0vG
         79rz4dj8UqENLBVXkwGbWwaVvv4C+g1sD+LsFNWTG1X9tuv4LUYAusO/W7YaZ3rSnb+4
         YNMV/upBkHdR2XZzsyu82UUN7t4ZyuOJe9F5PVpSe4//l2MpAtVhT1ajpniyvPiqZRLd
         2tErMBcKHKrag2qkz7zoXwx8OCKdfvMz0gkegdw9U2iqgg3JzIw3DnKw1hqxMc98X51a
         id8g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id t9si1187926lfk.1.2021.08.24.14.10.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Aug 2021 14:10:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 17OLArdK001892
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 23:10:53 +0200
Received: from [167.87.75.154] ([167.87.75.154])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17OLArqh020639;
	Tue, 24 Aug 2021 23:10:53 +0200
Subject: Re: [PATCH 1/6] x86/cat.c: Fix type freed_mask
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR02MB6670966F938FA1D18E7F76EDB6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b0df2787-e828-6a18-c2ed-01723fd12466@siemens.com>
Date: Tue, 24 Aug 2021 23:10:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <PA4PR02MB6670966F938FA1D18E7F76EDB6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
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
> Given that any bit in the original root mask can be freed, the freed
> mask should reflect the same type as the original mask.
> 
> Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
> ---
>  hypervisor/arch/x86/cat.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
> index 644bb3e5..f6719b1e 100644
> --- a/hypervisor/arch/x86/cat.c
> +++ b/hypervisor/arch/x86/cat.c
> @@ -20,9 +20,9 @@
>  
>  #define CAT_ROOT_COS	0
>  
> -static unsigned int cbm_max, freed_mask;
> +static unsigned int cbm_max;
>  static int cos_max = -1;
> -static u64 orig_root_mask;
> +static u64 orig_root_mask, freed_mask;
>  
>  void cat_update(void)
>  {
> 

Finally coming back to this - sorry for the long delay.

This one looks good (I happened to have made the same change in my
refactorings), applied to next.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b0df2787-e828-6a18-c2ed-01723fd12466%40siemens.com.
