Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBN534D6AKGQEHNKQCVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E8F29ACFA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 14:16:40 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id c204sf580902wmd.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 06:16:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603804600; cv=pass;
        d=google.com; s=arc-20160816;
        b=MjNk6G5W4TWmb54bK8lLcKrOdcSTiUBfL1UnydH1Kjia5iBtCGRUUT+dAmF0Bcgmxs
         oijMCqNd+8Lmj8Ba2pCET4OkTcqzbSO6F/d+zMxDgSbPOQOn3wD8WqSBTGKQ9Nx0tKoo
         w7sssKT0YMrkF7X1oQYd6SlnOfpsW+BBS7P3cVaUaNpIGV8g+vu/sVSnMRHU/xSlBV6m
         o370a4DauI45OFyW6o+0M74UlqJF8BkPaxLFULCfZFd0cDzNEHuXlqEeezkJmhP47CVO
         c5/2DpdOg4Tp4qFHksPlQuyxXzDDkHw6Vu4iLB6BFEUNRyuYCpHiDqyf1y1VFxY3lAfI
         1qHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=rz7FMV8afmC63H+Qoohd70AoR4tUk+lCZ2jdg7xZvRU=;
        b=HdQwmm6lRG6wC1uQs0a2IxvPwt65Ph2+y7JMH2TkxWshKRtYc4gYXRvnBugvnkz13P
         SyRU4wUirq1yJKT15Vj4zZCDXzFpDOoz4jGswoAUApRSEOVJCAdHqkbfCj1RFP+W8Iok
         3ulh7DmGTqBHGpHVdflaZZlyoTmSKYg65CZemmeVoL1IyXDb8vTMBvZQ8lU+Uss4tDxu
         Xd2VoBDiKlGPZVk7mDPN6VBSJFg4zPHVxRfujE1mGpEzV/Kv0smfcVNQaKsPfFrN4Z5X
         r3t1/MhC1EP8Pg96B+uTl1xabsLZ620X/SdwUFdDY9Mj9YlK71YK8ure7KXsIxwqBZW7
         cN4w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rz7FMV8afmC63H+Qoohd70AoR4tUk+lCZ2jdg7xZvRU=;
        b=IgFcdy7qYikeWYoaB70qxiCmgr0DuePaAJLcviHI9FN0oMoC7/Pec05jPt8+vrrgB3
         Vx8jR6iclgZPnt6huOsFgRh5o9oC40qbGiIphjW4JaR5RfGl4G497tgDbNn+xCULtQ5z
         nqjlrkgLoYXJsSxzizaQfAgEWg9bmkGqMbHDQoc7lQZdulxNQYues4CMKjCOsnuTMxou
         ZnPx8wEHAG2SjDnj00sIwjxsh1J9z8QwzMmaALBiWzmZAcYodwSrKdVySdN7A5pX4xCg
         VQ8bUbVY6QvjyoWDe4zKM/Yp2eRawNyrOeh6odDNZAOfh2upxNtCv55NhrLoKA7sqYHD
         kLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rz7FMV8afmC63H+Qoohd70AoR4tUk+lCZ2jdg7xZvRU=;
        b=MuSvK7HmOxRyPKw32DzlTfPlhdI5E4qzXj7wA5VsgZAYicX+heEMtLYbbyN9SWZl5d
         +uMPCKd49g8Aw9KMovkR0M4L0+DtGtAwNr1BnIYD1KKM0TxuEqEq+nDkv4RRCHoZvOfv
         nh6FEgRLQZT4qUGtaBeyR3LKCSvWN3SeCywLHPS1Vh3U56UjxE8DfJU7U/3pOmK4Aw1U
         LuWTq1hGl5jBNAKbRFmpuj8L6HaFfVYpzWFszjG+Dxvq8MtVJQtM1ZV9HaU0RnNq4wAz
         zpXutAJUma5A5+qGJAbHy8Wh+g8lxKC1SJNdwMC3vUvr7IUb8GX9pz97/xHo663bnTbl
         /Nwg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ijcY+iD2heQMX4vhG9eA+5aI9EjeDbKjewZPdT0xPHcD3p6D3
	L9Z0WlRk8lorDqK9qp9IffM=
X-Google-Smtp-Source: ABdhPJynZg7gU/jRlRqsN8bPHaRTeMkNQTcjeD3zQmuVQN/UxY6dGp1S8MiTqa58kzdF0jYukuk3eg==
X-Received: by 2002:adf:fe09:: with SMTP id n9mr2950226wrr.144.1603804600231;
        Tue, 27 Oct 2020 06:16:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1c2:: with SMTP id 185ls835048wmb.3.gmail; Tue, 27 Oct
 2020 06:16:38 -0700 (PDT)
X-Received: by 2002:a7b:cd96:: with SMTP id y22mr2808819wmj.126.1603804598901;
        Tue, 27 Oct 2020 06:16:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603804598; cv=none;
        d=google.com; s=arc-20160816;
        b=KVOuYmNZUiEpyE/kDBxLMrW4yob2eNGwwnlI3owtujtxo7Avm253I6rTsgKXPrTNpY
         Be6WAGqlHPClmWW9qvlxX5s4MpckxHEaOMbTw8ufOtx00FhQszdO/+mAgfmw+CPTprb9
         vvjeTVzODmvyIDbhcjZan67BJoHCOPiPFPnF6S0Fk22Q12egBqxolasMYI6eCEhI3igK
         3zUp1maKzJxpksgjUC3n4uUHdf45BcpcLFEmwYXZiSEXrMEX65q4Xopz2RNECm05MjCT
         tmm3QRHER8h6aRopLFe9ASyFKtqXzJxUvALcLLUwHjjdLC/y/PYzJ00ueWrMCBBnIf1D
         +uSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Sodg954dAispNyv0k56KouFo9CtZl3o0VYu0zl5WNcA=;
        b=vEMr9cgTWMUJdL6d0Or2k7SGL8GMPFE7WosB0iQ3tGsPDbMTXWiv1DGC5eAn7cG4fU
         h5HUx2Q0IznPCJurK++xGufCKnEuKTw2+r/5yIlIrQc5/VQ1PzJ5Vfgu6ZpzSl4c4/XP
         0vQiN6dn5gzoV3VW9bBiGGJ9aXG9Z8dWimDROsV7RPBkdhdxal4ZKgwcBKtjFuGRHTuH
         I8c1GxMCU3JuXB7bSRApJO2bW6jOPCFmmZ4lqjdRbaD2U8OMJsYD72TqcD5gbGW+2zPU
         zc8K6/BDwiC2sgPz63qyY/M/rP6nkszRZUPlt3OqUhy3iinSQljgEGuvbwIo1yXZKfiE
         ZpFg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id w6si70110wmk.2.2020.10.27.06.16.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 06:16:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09RDGcGA029928
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 14:16:38 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09RDGcE1001587;
	Tue, 27 Oct 2020 14:16:38 +0100
Subject: Re: [PATCH v2 18/33] arm-common: gic*: use uint instead of int when
 needed (Wsign-compare)
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-19-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b89f427b-67e7-7264-57de-d86819c5d53c@siemens.com>
Date: Tue, 27 Oct 2020 14:16:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022175826.199614-19-andrea.bastoni@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 22.10.20 19:58, Andrea Bastoni wrote:
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/arch/arm-common/gic-v2.c | 2 +-
>  hypervisor/arch/arm-common/gic-v3.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
> index c5ad0607..6ca8cb0c 100644
> --- a/hypervisor/arch/arm-common/gic-v2.c
> +++ b/hypervisor/arch/arm-common/gic-v2.c
> @@ -277,7 +277,7 @@ static void gicv2_send_sgi(struct sgi *sgi)
>  
>  static int gicv2_inject_irq(u16 irq_id, u16 sender)
>  {
> -	int i;
> +	unsigned int i;
>  	int first_free = -1;
>  	u32 lr;
>  	unsigned long elsr[2];
> diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
> index 949c4598..152b07e4 100644
> --- a/hypervisor/arch/arm-common/gic-v3.c
> +++ b/hypervisor/arch/arm-common/gic-v3.c
> @@ -529,7 +529,7 @@ static void gicv3_eoi_irq(u32 irq_id, bool deactivate)
>  
>  static int gicv3_inject_irq(u16 irq_id, u16 sender)
>  {
> -	int i;
> +	unsigned int i;
>  	int free_lr = -1;
>  	u32 elsr;
>  	u64 lr;
> 

Let's rename to 'n'. 'i' suggests 'integer'.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b89f427b-67e7-7264-57de-d86819c5d53c%40siemens.com.
