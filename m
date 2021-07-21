Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTXR4CDQMGQE7OYCJEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id B02D63D11FB
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 17:10:07 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id q123-20020a2e2a810000b02901990f5ca735sf1298071ljq.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 08:10:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1626880207; cv=pass;
        d=google.com; s=arc-20160816;
        b=EfqiDPUAluuO7m2f+mBk2YeTJp2ugN7miNoF7BeP7zJifWlywSIkQo2Mg1y/XhWfG+
         jAtSyatHGtqL++NU+VMkSytaGlWHl69kTIpstuSjyCEKKrBWvF9k4yPzhv1NW2RdbxTo
         Yq4CblCu4FUgx4xGYk386wLqWggiiNgyrtb29c5mqCkYM/y8SZbyz4WOcLmAVbfOSBep
         XxqFKnmv5TWtvzZRpxrRnBC++rQwOQdoVNVe3I/uvZwpqeFDfmiOk9L6ZkDkysyeD6ht
         k54ApITwpTy0Qw53bfTr9Zco7vPEcFz3XXrhVAVPFqgRkScxQBB8rqNHMEmFF4tL/xWB
         ff8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=+GITSFjU0Iho2LcyX+7B9m3lWfbWdPmzqcfKjWFtMx0=;
        b=hzXkbd3rZY7qN3ps9Whvhty0wrkTKqw6K96lfcJxLEm3YHLVe7yzcOw5d/+pv7r4v7
         4uckV7AQGtAwnOs/JYXm6rnMGBjQgZtCORwBC0QZ45jEzVqQevtIQP1+Irznuui8Jh8u
         qAN0UoE0cbplJvLNhbdPa1Sz0T/YblC2I8VSfYhRahev8rc8t5YDa/pyVcfwY2u+mzGP
         yJ8HHpxN+OZtljnCl8yKjxh9CZFEYapxE5FsPmfR9mVpPjk/jnPhk2HoKJGgHD4NmPHe
         cEy0/rRPvFI4bGyNVU1Xr1HqiHWIuzQt0cPMvPpBxvjW5M++AX5Rn9/BsA9G1Z8HfNWm
         AybA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+GITSFjU0Iho2LcyX+7B9m3lWfbWdPmzqcfKjWFtMx0=;
        b=hJPQpC8L7l+WxcgDRSW4B2EaFXDvi3RsexJCc1q4ATPq6DS0C1mJmOmeCA82xbyrqu
         pzYUbJtUxh/l8scLsX7bXKiDnGCDli+8z3vizno76QSgBlyVZn8NLYBhyJTahts6j63x
         HfYWkrSIoi9G/aqqPzxV2fcKAjPXtz+AukihgJCYEGIVNRGAFDbDbF/h9t8ppNK2aF2Q
         wwQ4yQE0NZZk9XnYSQVn2ljWlQLtkRcpywCp+Hd2Ln7VDbS6T2XgMYErmvcX9fgVx1Z7
         bHtEHya/LmUWQX2m596KgqFqy0SeIfkxf15mDcj2avprsPzzpn9IA/EZYLBU/wWpl3p6
         Nfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+GITSFjU0Iho2LcyX+7B9m3lWfbWdPmzqcfKjWFtMx0=;
        b=CCLJVoHyRRQNwN6KFrERF0xZz2QmEZJp3k6xZIM/bCOSAsyboMyP5uvcjALSg9Krld
         C5gBoNUktneyisH7cqZK/xWq3HhOYC7eyn2eUBX3N89O/WBQBW/AhbTqO/BcgR5nRkSG
         Ocq7Co8hvPuiAECuZvW3GBf7kZ1LijQ/JrM8rreOdJCeUyTxIyRvQ9dQD5INw4f4+0FB
         JoYyUNp/TtF0QiFTcK9OtECdcNEBaZKe9kq2cmg2tz2aGdqu025R9yJOBC0IOh1LVtdb
         wwX+WKj1qs+0ccku0aqxG3bS9uAzwCZF65OyIsm0OUTz0+uhb5MCNbC1P2C+ricfpqRz
         gyuQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533hN0gZMEBDLfD5t/jz3vEG88sE51e/A9zKZa92os1molhRVkrK
	A5asMYd1tmNNgWPKgJG2G2M=
X-Google-Smtp-Source: ABdhPJzm6PF9hiKVdH56tQl39WuTNayABVFRdQD1qS2YqZH8jJmzti+7/7FVOUHC54g9hcqeddq7fg==
X-Received: by 2002:a2e:834e:: with SMTP id l14mr31430848ljh.458.1626880206942;
        Wed, 21 Jul 2021 08:10:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4146:: with SMTP id c6ls1227881lfi.2.gmail; Wed, 21 Jul
 2021 08:10:05 -0700 (PDT)
X-Received: by 2002:a05:6512:1390:: with SMTP id p16mr3016552lfa.39.1626880205774;
        Wed, 21 Jul 2021 08:10:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626880205; cv=none;
        d=google.com; s=arc-20160816;
        b=vIN605+67tHcdVm17T8u2tM1irAL60d1XwtgW1udWjEUtbkfnzYpfO3XoUjE/DPkCB
         gDZYlC6RWplu0WE+kcbZO+wYGOzD9GUWyU1ce5BQRdxudreC/0h6hw3Yc6oSjPH+aOaI
         WoItVdriTe8ic9aSAN4U/Cxf+30HRTkGKJNA2mG/VhJ+sleDMegKPTjQLhzM4pWyZyAS
         nI/aEf7RByWIfS2nX10vYOh514PzVZ6/q2niOR/Dvb6jwFsnsYawWEPTfIm4g0Dj/9pB
         D2g1OVb7hrvvFVa/YCznMjR2O0xcfSrTtKCl9qrUJtwf96tg/BgeCI/zJ8RyJlX7zOWk
         A1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=dqKlLhTLA+sZFHRwKn12l0Gr3grgZn/L2Cbf4KGTJAA=;
        b=UKDcivtv0cfBlSTgoBuFQBArLW4c10/wPMBg1tgbtt1ZdFjP6rTjyfI8XYuKrqpUAP
         3+tDNtGBFcdLNTeKs+aiWjK/v83rr9pEgobvDW3qZ+YAexdO31fb+TTdoD6K5w3+C2hd
         PxcK8XDEQN1eIvt/DWoat4uItjqHGAT/VjKVPsw7m6JVth41uvwTEuJp5gJEGcuTxafW
         Q8BgM/iB+JxnhomfXl2TvNNL7/hzH1ab/DJ5gpW6x7RUkJC9RHL8EfEEYuDeZOVCRx3y
         Rtvspe02hoMQ2TpKCcyr25hEzltjcDRw/LwJVCC05wQGHHel0CkRQdFYHF0yoEGbBVlf
         Q9zA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id b15si149197ljf.6.2021.07.21.08.10.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jul 2021 08:10:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 16LFA4d4014937
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jul 2021 17:10:04 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16LFA4ZT025058;
	Wed, 21 Jul 2021 17:10:04 +0200
Subject: Re: [PATCH] irqchip: Avoid set irq target twice for root cell
To: Dongjiu Geng <gengdongjiu1@gmail.com>, jailhouse-dev@googlegroups.com
References: <20210624142731.30102-1-gengdongjiu1@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7d4f42c1-b947-df2e-d189-f51b081d73cf@siemens.com>
Date: Wed, 21 Jul 2021 17:10:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624142731.30102-1-gengdongjiu1@gmail.com>
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

Thanks for the patch and sorry for the late reply.

On 24.06.21 16:27, Dongjiu Geng wrote:
> When enable hypervisor, it is no need to set irq
> target twice for root cell, otherwise it will waste time.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> ---
> How to re-produce this issue
> 1. Make below modification as shown below[1]
> 2. Run the hypervisor as shown in the log[2]
> 3. You will see the added log "cell_added_removed == &root_cell".
> 4. That is to say irqchip.adjust_irq_target() will be called two
>    times in [4] and [5] for root cell when hypervisor initializes.
> 
> [1]:
> diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
> index a3245846..48973d06 100644
> --- a/hypervisor/arch/arm-common/irqchip.c
> +++ b/hypervisor/arch/arm-common/irqchip.c
> @@ -510,6 +510,9 @@ void irqchip_config_commit(struct cell *cell_added_removed)
>  {
>         unsigned int n;
> 
> +       if (cell_added_removed == &root_cell)
> +               printk("cell_added_removed == &root_cell\n");
> +
>         if (!cell_added_removed)
>                 return;
> 
>         for (n = 32; n < sizeof(cell_added_removed->arch.irq_bitmap) * 8; n++) {
>                 if (irqchip_irq_in_cell(cell_added_removed, n)) {
> [4]:                    irqchip.adjust_irq_target(cell_added_removed, n);
>                 }
>                 if (irqchip_irq_in_cell(&root_cell, n)) {
> [5]:                    irqchip.adjust_irq_target(&root_cell, n);
>                 }
>         }
> }
> 
> [2]:
> Initializing Jailhouse hypervisor v0.12 (273-g6d9c51d0-dirty) on CPU 6
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 87/994, remap 0/131072
> Initializing processors:
>  CPU 6... OK
>  CPU 3... OK
>  CPU 10... OK
>  CPU 8... OK
>  CPU 0... OK
>  CPU 4... OK
>  CPU 11... OK
>  CPU 12... OK
>  CPU 7... OK
>  CPU 1... OK
>  CPU 9... OK
>  CPU 2... OK
>  CPU 5... OK
>  CPU 14... OK
>  CPU 13... OK
>  CPU 15... OK
> Initializing unit: irqchip
> Initializing unit: ARM SMMU v3
> Initializing unit: ARM SMMU
> Initializing unit: PVU IOMMU
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "qemu-arm64"
> Adding virtual PCI device 00:01.0 to cell "qemu-arm64"
> cell_added_removed == &root_cell
> Page pool usage after late setup: mem 144/994, remap 528/131072
> Activating hypervisor

Thanks for the detailed explanation. While git should ignore everything
after the "---" separator until the patch, it does not ignore comments
that are a patch of it own :). Anyway, resolved that once I understood this.

> ---
>  hypervisor/arch/arm-common/irqchip.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
> index a3245846..256af114 100644
> --- a/hypervisor/arch/arm-common/irqchip.c
> +++ b/hypervisor/arch/arm-common/irqchip.c
> @@ -514,8 +514,10 @@ void irqchip_config_commit(struct cell *cell_added_removed)
>  		return;
>  
>  	for (n = 32; n < sizeof(cell_added_removed->arch.irq_bitmap) * 8; n++) {
> -		if (irqchip_irq_in_cell(cell_added_removed, n))
> +		if (irqchip_irq_in_cell(cell_added_removed, n) &&
> +			(cell_added_removed != &root_cell))
>  			irqchip.adjust_irq_target(cell_added_removed, n);
> +
>  		if (irqchip_irq_in_cell(&root_cell, n))
>  			irqchip.adjust_irq_target(&root_cell, n);
>  	}
> 

Applied to next.

Thanks,
Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7d4f42c1-b947-df2e-d189-f51b081d73cf%40siemens.com.
