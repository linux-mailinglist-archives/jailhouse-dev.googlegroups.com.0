Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOXQSGFAMGQE25FNKJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AB640F695
	for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Sep 2021 13:12:58 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id h3-20020ac25d63000000b003f11192275esf6415322lft.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Sep 2021 04:12:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1631877178; cv=pass;
        d=google.com; s=arc-20160816;
        b=hZrfyS/O1sXZvtgSZFG+8AKRefgj1Am45wn9FNdDKTxXd87B6sJUhpy/EWFURGWoeF
         OmUgWs5bmoADWhSGOVtVNQ05gaUIEHXFq9bmj7RGQwbJRvxNQNk27m3Ge0tTUTFdpMiP
         BB2B3RR4IfuqxQfTrmGR0VdVchiN0b0VMT3xEMwq7TC6NcuR6jbCcf5D2mQVDsSeVBT0
         Sxt3VyVyLjdk9o7JX9EAH/sCCUpElJIe8vBFiCfFGarswqFu9v6A4iz2anpH+4tKW5Qi
         6ks5xKyAkCy23mNrwESv6aqyc7MHIIXxsKq80ZXuQRcKtTfGqZtHWar2/a8QLiUP1WHY
         y4HQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=/BNhudmY+rFxPP+GGocyW8HTqvTQUcvd0pwJo7Qwuyo=;
        b=YYJ5QGKTs/pzHt1Ux7zzx7zpuvG2g0TLs366VtrEgbxpbQznG8TeqfJAb3s+ohHBx2
         fMHxVfrOGFSsUNfgSdJPr8JfmeRS7YgWwzFc1NIUJpOIOieGh7h7vurIxL1lIN3fwoTI
         MyP3GUWuyiu2LTfUvfyE0auNZtdGJzpsVSKsTrrFatspjMVO3jzjxAuFZg5j+SJJm06h
         ozvy1vkMjZ76kFl9UnaTS8emOWT12/XZSucoXTyqy3vh2gRR0l0zJlAI7xVIQg/fTXjm
         TouWx16SNLsmeevIvcDk9q4TJOlVvtrW8lbzjiLYytNPZMdpVanHj1petovvPc4v3CZJ
         tH1A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/BNhudmY+rFxPP+GGocyW8HTqvTQUcvd0pwJo7Qwuyo=;
        b=PBrbN3wWJ8k8V9KkgItaiuhYhvG2seWBuqAeaBvJS1MvkwArjvtGXQG9u7nwg5rYKk
         wp+37EpchaizQ0Pcw/NJVfrbMWmzg2ej96n6MIT5jQfKEZaUJrUbYK1Bhpy3VTETU/Fo
         vGQvgiQ950v23EgRg/aOA8PfBQC5dLVcPD2Gno8H6gVxl8NS858gIi/ijR7O7a/Q3NVt
         1h3vxkZfGIeJ5ZVDKhnhBWW38WdHQkNsUBkKVEZbA0K4QJQC+xTSEJvP9i+mRoTDzF4c
         XSCKgvKTGMM5zHcpIuLCdZmIgWa5PBI2PacI7kFNwTAR9MMcxQJExg9G/WwGEwL63gsb
         /k7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/BNhudmY+rFxPP+GGocyW8HTqvTQUcvd0pwJo7Qwuyo=;
        b=I/n4RzyYWkJkSHYU+3QWRbeTnVetB4wfbDqaHm+7qJQ0Y5u0uQ4hTGDRDXHWxtMAnf
         zcf4fYmuLLnMN8T7e4LJWO6QT/OH7zwGM+AhHlY/HNJ3DFlVWmhPJnJnazBP1O27rRK2
         9SGZtiFfpwt9IjGDR1MlqMaGkOItnxi9mw8iakeZIHdf8/aghac012BAZ84MvQ8rjfn+
         S4kRdaXBiIMKakZk94uGarTLHZW63537BvrcB+cH3xqAIQSw4KJjSrtZN6hLx0ASHpVO
         rjL59pWNoNihV/okijTt1Q0+kwdR/5pjOVinyuWBpHXOobVCGLwgfZcR61y0gaSj0vVQ
         NTDA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533at+LX8FRMXP7kUd4wRcUvRHNKWaDeYwYEn/K3cWuP1tQBJ1EF
	xO3pCxOJ/9PTPH/G44HceLw=
X-Google-Smtp-Source: ABdhPJzkE0m3NUUgLCq2KRWSZ3EfojzpbgUj6hburLnfYFywnvWp7lFeKIYfs43PfQnZT81cxTvuIw==
X-Received: by 2002:a2e:a58b:: with SMTP id m11mr9208966ljp.342.1631877178426;
        Fri, 17 Sep 2021 04:12:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:261a:: with SMTP id bt26ls1603008lfb.3.gmail; Fri,
 17 Sep 2021 04:12:57 -0700 (PDT)
X-Received: by 2002:a05:6512:c01:: with SMTP id z1mr7585913lfu.136.1631877177077;
        Fri, 17 Sep 2021 04:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631877177; cv=none;
        d=google.com; s=arc-20160816;
        b=i3QwCem970bO+KkqXHXYFe5SvMcP8eox6SYSxEYB/v3IN5NaiwDQEL6cO6Tk/MbuIX
         OCFaRtOnVPkoeEQGhFmgrd4BRk81kzAj+E9t+vKYMDgI6hUCpGrLSv+yjtOULwJjMlvD
         2CvCIZsKplmf1tTOHWUDNstRQGc3q+oqlVOKqOidWd3+GzilPKu6UDa1zK6tR0DejCCA
         zlfNCA7jqHAkMR9Lg+j92cbgJn1poZ/ua1qyFUB3Jl6HmIGwA6tGjMXC9aJBpjvWJEYq
         ySI+F7NAEKNbXI2icSbSYvefWTGfNncuQjH2sdUA+auKYzxwY7Wx8aj7jx3Q6z7R5g6X
         3gWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=EQJyvSxpmPWhu2OIHC0vRvPRGAxsO6qm88B/KecmH7w=;
        b=bcGwyWRWcOy7yhiqkB47T4QDTLH+JsJRhq2e1dlEfxTmBCVebuz1KUv4Pyvl8+YmTO
         ezHILBOyU/0OuSDEZXqppTvecXocK9idLS9SktMUqOlXVgvAUuw8aqZavV2Gy5e313aH
         Jp3e3b4sMYwGShnwq6onMewKKyuI6mJK2Z5axBj5JMh3/SflEop59DIM94NIvQmTYK8V
         jq9l7Wvjytr9XEd1ciPgcNGztYG+M1uc9ngRkpYtL6e0EvtNStfAly2NQJTWGkdDV2Pa
         MzsEv2Lrx8gvfswF6Re9YJ3riB/RIWAGSnAs7VFC8ukcf7CFP0rjAtLosst/ZBP9qcls
         woUw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id f16si656041ljj.3.2021.09.17.04.12.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Sep 2021 04:12:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 18HBCuWI003851
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Sep 2021 13:12:56 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 18HBCtYl029902;
	Fri, 17 Sep 2021 13:12:56 +0200
Subject: Re: [PATCH 2/2] Kbuild: use toolchain stdarg.h
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
References: <20210917074630.2585329-1-peng.fan@oss.nxp.com>
 <20210917074630.2585329-2-peng.fan@oss.nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <65d5f035-decd-c602-4a53-4ce898b22cfc@siemens.com>
Date: Fri, 17 Sep 2021 13:12:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210917074630.2585329-2-peng.fan@oss.nxp.com>
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

On 17.09.21 09:46, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Linux Kernel has shipped a in-house stdarg.h under include/linux/
> and drop using the header files with -isystem.
> 
> However jailhouse need to support multiple kernel versions, instead
> to add Kernel version check in various source files, update to still
> use toolchain stdarg.h with -isystem option.
> 

Also here: 5.15+?

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Kbuild | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Kbuild b/Kbuild
> index 2863c121..fecf61f7 100644
> --- a/Kbuild
> +++ b/Kbuild
> @@ -58,6 +58,8 @@ subdir-y := hypervisor configs inmates tools
>  
>  obj-m := driver/
>  
> +NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
> +

Shouldn't we prepare for phasing this out at some point, i.e. indeed
make these flags version-dependent? Would be a single point, no?

>  # Do not generate files by creating dependencies if we are cleaning up
>  ifeq ($(filter %/Makefile.clean,$(MAKEFILE_LIST)),)
>  
> 

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/65d5f035-decd-c602-4a53-4ce898b22cfc%40siemens.com.
