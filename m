Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5F34D6AKGQEPVKKQWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB7029AD00
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 14:17:40 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id h6sf654258edt.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 06:17:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603804660; cv=pass;
        d=google.com; s=arc-20160816;
        b=elPL3EMgIQ0Oi1JGEj5GRvm0F76buYJMqeQYAMZ7FA1Ka0gXicT4df/fZxw8w3me5Z
         q2nTCQIzjgn34IfV84Rn+N3BDpUcXdCJhg6NJhE5NocfpfRaHZwQRQVXKSVl4ynkhIsP
         Qo++7pM+i51xc87NRVeAKZFxl/CGaKAhMFhFF7ej26DzEITqR7VGUTtk16flp+R1zmNz
         dB+KUS2sxEti68brt1AkekoMR/6EexJ9BFcUVb/8EsWtYA2K6jfc6qdqMvdAPqm//ev8
         h96Qaz7sAWkj/sCckJPxxG8SdxbkcjVw/ZUzcfeYt31gEoWgNB76Nyd3+McTEoRnUrw1
         zGQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Dwt3sNJlH+Y0kC/pXkGZvblCnaCJ+Z8kAp1VZ0DwboM=;
        b=LjgIHkLlsqCmlivGaMRgDxEv87shET8bqmwbTNvzxLKLnTKSfjoVC4UWkMkActkHNX
         pNDbs6r+isbxrfZFuVNqvOvlyIAwnJDB1voBAI0syT0pnk2pxt0/K3Bg9SeXBUnZxGv2
         sINHuuqruIy0rKu5Rk6F/FynrHw7Nk75Ox2x7W7zoIVrhwg/hU+CQHgNDhLiSq+Ywnj9
         TCBk70xpWYyAhL02C+lhww/8FoBmAzoeNsTGo/HS2WkRH4eeyF57uvmAUn5rappAOmyc
         Q2l+/WtIW7iT9a8w8BnJa5RIB3TerLHeAl+DLh14QI5H7yR6gz/LXNRFzkJSCRS0TeDX
         Qm7g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Dwt3sNJlH+Y0kC/pXkGZvblCnaCJ+Z8kAp1VZ0DwboM=;
        b=WdR/O7oJkwCxhiS1TydA+L+RsZcU0ygMS19j+ZjClpeCDt7pqCNIid8tCMPBNvaWHX
         ImvjzkmgcKMGW0IPnFZ3aXtn9bQpuagdAoqva0CYCSpvF3qvHAl5XMrUySx9374QMuSH
         iQmPlBpsBsGxJdsLcWyUIL9EZ/S6CDjAijorgGrQWdasS0j4r1OBGL5fl8tY7dExlt+a
         bAsF1OF0XJdNd4ySlO79QStUZpZuqXi8V5TslWbatHWa4cBF2MvbXsH1xd7PAU3ln+6L
         SfVNKHAsf23Jy7I1w6aD9pWBejkrjLFc6dr8NELWIXGckUovr/KlzI4MsFX33wTgjYuV
         Uo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Dwt3sNJlH+Y0kC/pXkGZvblCnaCJ+Z8kAp1VZ0DwboM=;
        b=sgXr3ji0yn9K/GwfOu25HiP9NwLfMgsEruTG7XTVce4nl3wagX62VOLdzzL+3kEkMr
         6CMCBai5+2PfFn5DBDn05GTdupnEL4E5DwJy//g/LummQdAp1Rqj4QpjcvFKsOJ6PIP5
         PPc5HpnTGjkFouEgiP+/DlnIGSSdXoCIZDDVuhsr/N5h/U2ifdcGD5mOsjDdnou6LV9B
         yaIWDId5cIMmLKjXsT6V+Zjv8Pe3nH5sIjrglwF7X0sdEnM3FJ02eRmuiFyjaKMntakx
         77bEpq/5f81KRLFspC/kNKp99hjq85jVSAhyMQSdHhT9qKIUKHNShZ/YoCWn47nijxf1
         EG3Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531zOqB8RF9siQk+S4UF3ZMHyl2CVHvowSHmZo+WntDoz+r3ETQG
	FjW0k/nX/dofhWYRj+ptEWE=
X-Google-Smtp-Source: ABdhPJyVNx11tXk5niDEfIVgRy9qIz0nVJkprkLTsZmMM12KY96lpS9cTfr7ZBLYQXv1GorPUDDMZg==
X-Received: by 2002:a05:6402:206:: with SMTP id t6mr2131700edv.291.1603804660616;
        Tue, 27 Oct 2020 06:17:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:35d1:: with SMTP id p17ls776563ejb.8.gmail; Tue, 27
 Oct 2020 06:17:39 -0700 (PDT)
X-Received: by 2002:a17:906:38d9:: with SMTP id r25mr2506604ejd.8.1603804659296;
        Tue, 27 Oct 2020 06:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603804659; cv=none;
        d=google.com; s=arc-20160816;
        b=R4QMiPvQBeVPdMeup2bhc1AP8TCMfy58MyA9GmawAXnFcG0bi8ScKpEp2mOqOFoMW7
         R+IFm7eiOnZm/c524/SwIbolfyxUxYQ9YYh4pJFtYFHwZEbKPSOIsNOziZoaAIlmN/L3
         S/kDUlTxISDookt1yyqHMWbmH5eNW8qS1tpif/UIN3RoAj6h4kVoTyO4PGrKFTxo7tfv
         8/AkSxebao35+tGR8ytelu6NKGVVfOI2OQAvzpMw2q9u6sQkaztSaAbIIXy84ka8wA4E
         vj7XR63VUu9NSHTGyqiwZkGjsZxP7yx1fCaWg44zzkUh2kZ9fq9REy3VWo3X2lcW8I13
         1o3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=raehcf0pzTZvNHYKPL6V2l/sfXlGoSLhqNlF1VJHCaw=;
        b=T4FmdNGUNPAHw2kuW3TMYt+2AhLk7+DOO3/8peA0uSQVa6J1nUKZauojH9lVoYKv0b
         Ocn+4zM7jkpFqS0ROQngDllIFxMz+E9ZOI3m7hdGtiCutr8KKBbaqOXD9pIRD5YDGjrQ
         0+EwsfAXOBM73SeKnWjTO0UGzDYxi+8NMn2HE/0HWu+M2DIvtC8bnaloUYuA6+nrJ64a
         QFj/BrZ0/ktRyOjqgirEonfjzHWrx2CIcCt2qUtXC2aiv5k5eLr2fwWIML+Uexzlj3Ng
         H43TDz1Se5bRo87OAqqNgb552od1eWtp2cNaRe2gvUBzuNpfuUpoA7M90qEO7KwwnWuk
         XmHQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id lf25si38387ejb.0.2020.10.27.06.17.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 06:17:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09RDHcaU031654
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 14:17:38 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09RDHcqI002257;
	Tue, 27 Oct 2020 14:17:38 +0100
Subject: Re: [PATCH v2 19/33] arm, arm-common: Wsign-compare:
 arm_dcaches_flush(): take unsigned long as size
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-20-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20bd5369-ba3e-5e6e-8f45-ea5626980cda@siemens.com>
Date: Tue, 27 Oct 2020 14:17:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022175826.199614-20-andrea.bastoni@tum.de>
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
> A better overall fix would be to have size always being specified as
> size_t.
> 
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/arch/arm-common/include/asm/dcaches.h | 2 +-
>  hypervisor/arch/arm/mmu_hyp.c                    | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hypervisor/arch/arm-common/include/asm/dcaches.h b/hypervisor/arch/arm-common/include/asm/dcaches.h
> index 73c2722e..87c316dc 100644
> --- a/hypervisor/arch/arm-common/include/asm/dcaches.h
> +++ b/hypervisor/arch/arm-common/include/asm/dcaches.h
> @@ -22,7 +22,7 @@ enum dcache_flush {
>  	DCACHE_CLEAN_AND_INVALIDATE,
>  };
>  
> -void arm_dcaches_flush(void *addr, long size, enum dcache_flush flush);
> +void arm_dcaches_flush(void *addr, unsigned long size, enum dcache_flush flush);
>  void arm_cell_dcaches_flush(struct cell *cell, enum dcache_flush flush);
>  
>  #endif /* !__ASSEMBLY__ */
> diff --git a/hypervisor/arch/arm/mmu_hyp.c b/hypervisor/arch/arm/mmu_hyp.c
> index 8a897f2b..676c7fda 100644
> --- a/hypervisor/arch/arm/mmu_hyp.c
> +++ b/hypervisor/arch/arm/mmu_hyp.c
> @@ -47,7 +47,7 @@ static inline unsigned int hvc(unsigned int r0, unsigned int r1)
>  	return __r0;
>  }
>  
> -static int set_id_map(int i, unsigned long address, unsigned long size)
> +static int set_id_map(unsigned int i, unsigned long address, unsigned long size)
>  {
>  	if (i >= ARRAY_SIZE(id_maps))
>  		return -ENOMEM;
> @@ -368,7 +368,7 @@ void __attribute__((noreturn)) arch_shutdown_mmu(struct per_cpu *cpu_data)
>  	__builtin_unreachable();
>  }
>  
> -void arm_dcaches_flush(void *addr, long size, enum dcache_flush flush)
> +void arm_dcaches_flush(void *addr, unsigned long size, enum dcache_flush flush)
>  {
>  	while (size > 0) {
>  		/* clean / invalidate by MVA to PoC */
> 

Overlong lines.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20bd5369-ba3e-5e6e-8f45-ea5626980cda%40siemens.com.
