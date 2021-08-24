Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB26BSWEQMGQEJXTZFBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A1D3F6AE4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 23:13:16 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id g4-20020a056402180400b003c2e8da869bsf3474338edy.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 14:13:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629839595; cv=pass;
        d=google.com; s=arc-20160816;
        b=B2wRRqeU63u15w0qApR00XxxKSx/M39HYgILHHuV/q3E/ENx9wRxBHYVyFrB/SP8NJ
         5945zst6vM/VktQaaERceDS/6D0vBGDV4Ku56aKKnzlvGsygfrpd1KaIHtdomMx/UUgv
         NnsgVNSY61TI32B7G/hy/AOodH3A1cywLmE/FWFHQidoI7yHvC4QjDudXo5POs3iBAK8
         qpmtGAshEn4fgeVNsmiUv40S5WSPJQrBT3PVhAgUiQxnoVAGklJcoPi8w6ifm3bYMJwx
         dMoBk/DPcG4F5n5B9qT48UTv12+GWfcvars9jRrGN0rCbOhl1RZ6oUOwuLOLVZj4y6f3
         elPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=nzi3JWxn/sggj+/MHPAKF1Y+vamvcYRHA+Sg3Co2VG0=;
        b=mipbTxSmtFgt4jORiBXGI49Cd4oP3YB2zkEugadnWJVzkgnbYv7304V6tGZFGYRKy3
         ugD9cxSDdQcvgfGpDl3OSbXRa9Um51aEjrq0gsNPuWwauD/e/hW+QG/+B8HIdNdeaB9z
         8WwuCoW6UpOEXUepU4Cr3s5dwCuagJ2Mg+9Io5NNDt6eUqWpD4hwvWEhNlJ49oIupsxP
         JLzV8qZ5l3ZGDhTtfzfuuqa6Yb4g+nXsAhvQBnMpWFXAiaPKCcLPYqvPkpl3vPywlamU
         ms9dXBRyXAQF2Gi6+L5TkmOBTVzQzaHg3zePVqovmkhQ8dTh5TJ6zrh9pk69STERl6gm
         x8CQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nzi3JWxn/sggj+/MHPAKF1Y+vamvcYRHA+Sg3Co2VG0=;
        b=FEonA3zfO5fbuh3tft4DkHB/wg+AbJ9KvC8GOU+w/fZwwqZv4Wq+BRntAu8Ne4/qCy
         hWxF4sNXP7CFwmAV3Cp0n0n2BgaBwc9u8T5ycSr3XsdSpyir+eiz/vbxIimVN+u3wedx
         a1es+BFHNQiKYYgG3sZPXz2XcYezqOezLjlRMdICsK26UwWdSaN5FpayBUlc6UTJTBk/
         kcv+iLkhPc1fMIPJ9ZxYzVG/9EMuDBzp4Dg6N1whKPEEnXN+VXUqCb64aasM3J1pWOUs
         jM8aWVqrj5Dpev3lsq9tKArNY/8al3Agd92J+D8pyaivMYXFfgvRPy8Muoks/ceCPdTy
         YD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nzi3JWxn/sggj+/MHPAKF1Y+vamvcYRHA+Sg3Co2VG0=;
        b=ke09AlDOoYbUN+VyQfkAEhYvQTSrJQLV3BxrBBUKYDv/MUV+6cFZlbw9oxTrtnxLzf
         +1HInP5jQaK9fkUNk++lOWbDnjp+zFcEpmXUXX4OBTmwjN4Ylae2ilTZBYCKlrf4PwiJ
         GhW1SpM9Sz7/UVY86DouEtmlNCYcRDCy4cCW6dZ72Le0fGLIdmu1ddnMNET3MUKKQDNj
         GYWMZx8HQEpnH2Fqz0TD/sjN17faRNwwbybR1nrZjpfcHqLsTi3ztQjrU8TfL5PQgt1g
         ahQ6uARdQTs/ofMo92SBRMYJQSyina/tJEMjE/W/QJyqz4HEEBvDKdKGdL2hOwuGbmmK
         9EUA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530dOaUQnXU6SG+x4LicK08wCiostNc3TCGhO/Dz3wAccQe8vaIr
	6z9/EyrTkucRuShw9TDebR0=
X-Google-Smtp-Source: ABdhPJzH569iUuG5WsvpZxIzlsEuagPWyTBffL2J/Pp3PdeCHlhVgc5B+cOG6y/K+edx5+lvlh2Jeg==
X-Received: by 2002:a17:906:1789:: with SMTP id t9mr42940399eje.61.1629839595786;
        Tue, 24 Aug 2021 14:13:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7047:: with SMTP id r7ls94852ejj.5.gmail; Tue, 24
 Aug 2021 14:13:14 -0700 (PDT)
X-Received: by 2002:a17:906:a382:: with SMTP id k2mr42327126ejz.454.1629839594692;
        Tue, 24 Aug 2021 14:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629839594; cv=none;
        d=google.com; s=arc-20160816;
        b=SBubN/mjlBDuMcGtDetZzHyjnPVBGbGUyHYZLk0GMaDSoE+M8dA0PnHOpCOsNiDxOk
         AdQ1nLZlu8FM9KiVHxrMxHSlxnPW/4jzxe0vV4/zRPIl1q+m/Fjfh4pLjhdgWzyB1Zaf
         3FKCkUWCEzHA7NJ7Lxh/7C9d3unbmaorRIajepsslwGExoxOXFRfzG357xWJCfJK4vx+
         LS3VR3Q2hXLUR6OsrdrJwb1cyxIsk/fAAG9H9BHJkHflKlU5/loM76bUOUdNG1mppxPV
         +nsB1XuYHoxJ0/0hbbh2VqaCpGOVoXacdjIR9f7fWupb2By+KrdQJGNGDdGvCy35cqCm
         jMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=n/WLP0AYls+T/0f+GeXMLcXKgiqYIQmxq9M/NcIR6zA=;
        b=M0bUBffvf40RBYtyVxoTrd5D2iYfqIVUW1Vc3sEceR3Af3V4DKMteTr7LzOIu9u0Gy
         zpvILhhWMXl5iETNMcpGE2ff07F/RRrk/MPz0evbABXlPlmgjgxHV7zU4H7j9yJEewCk
         I3R5dz5Segi+KkA5kppx6SWHFt2bPb/GymddkF7V5GVhx/urIcxID7G9E5ioSkVuAjFr
         NkRv5TafBPlIvNTkLzl6nYbApNsm1cvsakaiyDnL3IqEU8Mrhoz1diUhY1retQmQ+Szf
         WUKv4WflYWX4f4yRa97vaGHly53Eukv3ZLOlmD1oiJoj12MKsCiBJV5qF1kct8S0/Fqs
         sxoQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id qb19si811821ejc.0.2021.08.24.14.13.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Aug 2021 14:13:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 17OLDEuJ023005
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 23:13:14 +0200
Received: from [167.87.75.154] ([167.87.75.154])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17OLDDRh022070;
	Tue, 24 Aug 2021 23:13:14 +0200
Subject: Re: [PATCH 4/6] x86/cat.c: Fix off-by-one error
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR02MB66700E196A29A23FD2152CA7B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4040ae52-1aa9-cfc0-d006-14aeabe8d883@siemens.com>
Date: Tue, 24 Aug 2021 23:13:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <PA4PR02MB66700E196A29A23FD2152CA7B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
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

On 02.02.21 17:44, Bram Hooimeijer wrote:
> The variable cbm_max captures the position of the most significant bit
> of the CBM, rather than the number of bits in the CBM. This should be
> considered when checking non-root cell configurations to be valid,
> otherwise the non-root cells can never access the top-most bit in the
> CBM.
> 
> This off-by-one error ensured that the ROOT_COS CBM always had at least
> one private bit in the CBM, preventing it from becoming empty. However,
> empty ROOT_COS CBMs are well accounted for in the code.
> 
> Fixes: 3f04eb1753bb ("x86: Introduce Cache Allocation Technology support
> for Intel CPUs")
> 
> Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
> ---
>  hypervisor/arch/x86/cat.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
> index d3425f7b..f4c6f5d6 100644
> --- a/hypervisor/arch/x86/cat.c
> +++ b/hypervisor/arch/x86/cat.c
> @@ -173,7 +173,8 @@ static int cat_cell_init(struct cell *cell)
>  
>  		if (cell->config->num_cache_regions != 1 ||
>  		    cache->type != JAILHOUSE_CACHE_L3 ||
> -		    cache->size == 0 || (cache->start + cache->size) > cbm_max)
> +		    cache->size == 0 ||
> +		    (cache->start + cache->size - 1) > cbm_max)
>  			return trace_error(-EINVAL);
>  
>  		cell->arch.cat_mask =
> 

Indeed. I've refactored this (cbm_max -> cbm_max_mask) here and also
noticed this. Applying to next (and rebasing my stuff).

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4040ae52-1aa9-cfc0-d006-14aeabe8d883%40siemens.com.
