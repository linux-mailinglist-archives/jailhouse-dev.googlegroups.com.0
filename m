Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLXXZTXQKGQEGRLPFFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 0252711DE89
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Dec 2019 08:20:15 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id c24sf921035edy.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Dec 2019 23:20:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576221614; cv=pass;
        d=google.com; s=arc-20160816;
        b=nPxV5grUGCyOw1eUIXxkKfeMj106VXIp1NUz7kJPK0NkQtTHyi8ujImjXAEi5B53Oh
         9ppERamq5DCv5bfSofBKb/gBosHjE+m1i8k33I2RkbhYwZ/1P3QBNUTeZUXwnE76zCK7
         pCC/OBrQIArzpPOLWahIFJdzaChDeMw/ZgyJ0DJe2AP1bTgKaDuoEg4rETB9igipB77p
         3zm01+DxvGpxDRbTIWB6LS6wTu75/5wbrPqxxGKfQfKqnt+oa+eQFALINPK0s6rEF9hr
         BHvl5GNse6Q98+KmPn3GRSVMmwnUead+qLbW3uZvV3K/3KaLHwob2P0eV/gymgDzVvaB
         3WMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=e/Y0C6aqrBSGWsnnNKfXgPJjVaGIQrA1NXTGzbinSzE=;
        b=YafSr6j2aBoF9ltdESJhka0kUp7/ear4ZJF+6ymFaSY3VzCOtdf27uFGhMaqdrNyJX
         taAVmq73JuM8/7StWcMxKhRVkhFOKumnNGv7LK73gmiXK5Fd9/wt77qFpo3zSpJB1P/c
         ClQZ/IXi7RWWTcA3aKBuF37v+6Pm7yjrWJdSNd2sxZbHGt92QEM5iGJJryE24+UWEbnH
         krQAegHNirHfOQ9TZrjUfL64euviVy8z+z3IyF1tmYy8EPgpvDuv5h7z5JwgALgcaGlW
         BHyC/LBWCRGk4FxWE0xDU1/1cpN6SKkktrhIFlggs+gRLA3SN0lgQv0Dj2gXZ4pcXJjc
         QqOw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=e/Y0C6aqrBSGWsnnNKfXgPJjVaGIQrA1NXTGzbinSzE=;
        b=dkXvtP9gEJ/Fr6w4MGkVcBOjf6lVYZSKnTFhEYXnkcNByxcZh3s1lr7AqOpHKV0j3Z
         VYvQWerazSaBQGOM56yzeHAj5ZcEKJYhW6qcxJHqewN+UO9okN8sOjFlElA+J2ZZfZ5F
         mv8WsQwDGxZiMGGoIupC1YseAKZcScMjvtnavfOzDsiij3wyLhZOTJAs9Y0wSVJ+dUBy
         IAqHhb47QRjA7xFvClaCOmsJLTlkqRUh8wcq326RMq78IM9IWZaSF51zSPhv6s0zA5Uj
         ocTWw1HXb+ME80tpBg1cWfcsXPehqSbZR0xZkIDXNyxGGc3ln4uPNkN7cJXCDvp+z0Nb
         lNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=e/Y0C6aqrBSGWsnnNKfXgPJjVaGIQrA1NXTGzbinSzE=;
        b=WGSeEMV6ICdzqS0RsMQTuHG4AeiSFyytThIUZhLkIBv7Kak7Pyb4BPXD9G/0vC6DQH
         PI2UP4vsJdJ59Rl+Futud6tmOnOnPUBofdl9q9sGPdl8tU9uz4NAPaU3OgpfwKQNaHF3
         1khG5YUjptXbfehjUmb85zVjhJxgWdAmWoPJagAyxspYjk/mpxevoYgzXzoyk1Ya8kEG
         /wdWn3BCBwYMKKytlKUQtml6mVoQi/J7oApehM+D8fPBHz68YUljbyK+EBkhETvU2RZ4
         UznI9FTMUj/j4tciWWTYDgcMM1AXOnXWVbc1kZkONaxryPAFOk9/jDoYoUBu6eEAIbnJ
         Dy8Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXINQdIU4nI6ZNNOA8rZYrLvJm/EDnfE/MWnSqAT0cCAsycj7h8
	wuCgpwHblFVC7Kd4vvzwx48=
X-Google-Smtp-Source: APXvYqw+YlS5+E9OucVqOQCwgf+gbfo8ddtLRBFyP7AMr+EkPooon2jU37jFeKlyeCCjNnmMrjuVgg==
X-Received: by 2002:a50:978f:: with SMTP id e15mr14155141edb.298.1576221614717;
        Thu, 12 Dec 2019 23:20:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:3d0:: with SMTP id t16ls1939920edw.1.gmail; Thu, 12
 Dec 2019 23:20:14 -0800 (PST)
X-Received: by 2002:aa7:c2da:: with SMTP id m26mr14151551edp.244.1576221613978;
        Thu, 12 Dec 2019 23:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576221613; cv=none;
        d=google.com; s=arc-20160816;
        b=oKvMoFMVCUHy7bi9SMeD9fx7kj2+FWIRtgfRckU511eBbWnyf99FjMGHvxRA2KZ7Sy
         1r0hqn4I4qfjVe81+C2J/2y6zVijfH7tzxR7+6nk4JdbyOQUKnemjop7ALMdW6EUjXkI
         C5fg+kfg3sxVYEQWNBn+b8OEXXNal5+xltNZTc8aoyoeyZq62sDhKZ0T8X9YpNSrDd19
         hEAEJglujlIjUPTVY8e5M1I3vG5wqcE9fP1HSML1bICxO3wFGMxAWsBl81amNFvsD6lg
         VOqsAMELYLTmp7/4VGFHtmiu09gucdEZsqThPwNJhMpbyYsqJ82NsRgeeVPcZe1BX5sy
         uEiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=k4DCFxks4PjggGtIac2SydvIPN8FN37Dzl6y4A46yT0=;
        b=Kv8cK1lecUe42kIxh9FErjaNjPrYHZSRkHmMNR1dQAzuFfEHfNC7iHxFp1Tq5ZGrJr
         uZZyGiULtPqnk6aLysDTEaOYqnVrQncoC53WDL3CP8pyLOcNALX3ujTsqYac9uQkolNB
         LSDboUnmmGfdwDvS249wpZ5L9PKaiLxdunS9Oy4Lz0kS2iAzNQ4V/h36TI3cfE1tkWZK
         3BmG8o+Q1juhfa5eKmoG80iih7aVfObQrtBhFURzI56rPvlw6pg0ES95TReSrMGHvZe5
         ZliI0LtIFqhqC1Boqx18p9npPYa3JCtDP7xhyLhelz27+pxCHN+/uc1gD6csS3JznNYX
         xvKw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id j19si399633edv.5.2019.12.12.23.20.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Dec 2019 23:20:13 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id xBD7KD95024593
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2019 08:20:13 +0100
Received: from [167.87.38.231] ([167.87.38.231])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xBD7KB4r023716;
	Fri, 13 Dec 2019 08:20:12 +0100
Subject: Re: [PATCH 1/2] arch: arm64: add comment for spin lock/unlock
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Cc: Alice Guo <alice.guo@nxp.com>
References: <20191213032352.8915-1-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <af2fc183-6043-601c-2712-ba21c8cdb396@siemens.com>
Date: Fri, 13 Dec 2019 08:20:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191213032352.8915-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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

On 13.12.19 04:05, Peng Fan wrote:
> According to ARMv8 DDI 0487D.a, B2-108:
> "The Load-Acquire, Load-AcquirePC, and Store-Release instructions
>  can remove the requirement to use the explicit DMB instruction."
> 
> Document this to avoid explicit memory_barrier binded with spin_lock/unlock
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  hypervisor/arch/arm64/include/asm/spinlock.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hypervisor/arch/arm64/include/asm/spinlock.h b/hypervisor/arch/arm64/include/asm/spinlock.h
> index de814bc2..9cb3c3e7 100644
> --- a/hypervisor/arch/arm64/include/asm/spinlock.h
> +++ b/hypervisor/arch/arm64/include/asm/spinlock.h
> @@ -30,6 +30,13 @@ typedef struct {
>  	u16 next;
>  } spinlock_t __attribute__((aligned(4)));
>  
> +/*
> + * According to ARMv8 DDI 0487D.a, B2-108:
> + * "The Load-Acquire, Load-AcquirePC, and Store-Release instructions
> + *  can remove the requirement to use the explicit DMB instruction."
> + *
> + *  So no need explicit memory_barrier binded with spin_lock/unlock
> + */
>  static inline void spin_lock(spinlock_t *lock)
>  {
>  	unsigned int tmp;
> 

This is spin_lock, not spin_unlock that we will exploit in patch 2.
Also, you need to handle arm/ as well because the exploitation is shared.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/af2fc183-6043-601c-2712-ba21c8cdb396%40siemens.com.
