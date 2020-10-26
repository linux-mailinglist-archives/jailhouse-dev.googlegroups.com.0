Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGFH3T6AKGQE4RCMX4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1043D29952A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Oct 2020 19:21:14 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id a1sf3136797lfb.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Oct 2020 11:21:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603736473; cv=pass;
        d=google.com; s=arc-20160816;
        b=HnaxkPR0vb7x+GIWiZJkaphiRU2g/3rCfmf1Gpb2Lvd0PQ9AsU4Yj6+Mxdfl6/xbEh
         t/7bLFMINEevzG+CR0PtHvIWT7w9iCyHlSA/s/nAJEm+bvcOt0031V/TFtnOZzOAswcX
         +acqGr3Po6yDN56jolMHyBkFJ3jp6H2YViPb4JgIEbo5+xJ4TSSib5JvtNTQBp7jMFJ1
         hOWLDAfCfycRDiog8TWqPDmwRH3jpOhB6AnPhS+24FKSzlvqxcB1446O6lAKgUSU1iOC
         HX0hZywNzLGt1i12lnvqmTWuoi0hwIlFMkBrAJNIPyHcryLxtRd+/0ZnghJD4GSv+OZo
         Hj5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=QJsj31Zfvy7BBqMjg+msuNxFkx+yw91DElVM9nq2ne0=;
        b=yu2P8Vp78jXFQkuQfXtuvfx8gyI2S0VvkuxkKoR1GwRcT+zEKgYvSnH6IDdT19hew2
         RYLxBKfCgZsEEd6Bv0AnVPWf2feRLTphEwP59rV1bK3COWNdZQRJJ4R3w2We0rVZJnCY
         u9IEaFCSrhq7re7nzEXP53yiK5AQcKm3HJr40GTxzCHMjkb70uWjAggjRbSWfbhZQad7
         d0FN6WmnGaUlvLWlz75q8hzB/2fzU5v6JhGdLJksCJJQCE5Zv4QfE4Bu1XqpQW5mKmnt
         9eywVy6dDGBV4uuIQpNlbYLL4inH9Bp97S/CpNQVf8JVLMJggJRfIaw3O8f4TxYSE8Qo
         fUcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QJsj31Zfvy7BBqMjg+msuNxFkx+yw91DElVM9nq2ne0=;
        b=PlQ7Bw8Ltq9IvMZyGK3bs+pXPNRzzPQR9mHf0fqEXk+c9eiwOn0t3cSyhT51lCnf/R
         aNvV6mLZJAXELA1zFTOJYEpzILxwpVuu3T61SpTaqAjc5Qtg85E+v+NeBM92WpweT6B8
         df/ZQ1QmVJOH8FrOZyVPSrTJUggNwPb3zu/ygkvj9ejHssA8SQhr/dEp6VqXjyucHiY9
         qGlI4Bu3rD+0ngB69F8QBIu6aDwGnb8XW6381lwvW/NRU3vRQqrt1ur7J03vHlIHokPj
         hbIOx5UQukV6G6asCNpZEUVjaM0tePji6PODJelxw5jehG26s+i6itlPrvDp/xjb7qsE
         D6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QJsj31Zfvy7BBqMjg+msuNxFkx+yw91DElVM9nq2ne0=;
        b=YgmGzRXi+ZLlJz2Q5nQBEe5xOjHCH7p/HICNUp9135yeFLfm2gH3gIZXRN6neL1HGR
         43jpSwMLLSS3rkT+4nV9Lp8IRXzD9eJUiMkdKBC4jCcSiN+X/arfqlufy23D2E0oVAYI
         MoFbnv348C51LeAiJ0sX2qyXpikGN0acSM23DypAI8GmHD77xUOJfQ0n9y6G5MmhS9os
         87SuAYE8z/aSlCNHd7hOWeUJztNY/9LH93QczMwqr5DF0Be39kImR3EjnD+DWmXY1CaB
         CKPjhg4fnTh3B8ELh0t8KHu+5mLpOiHk6UQUgjRmuqdD7pmao2+QGX5tMaQwYOXf41+q
         a2/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531VSx62ms0g52guKTKR6RZD9ERdwBz8td/nWNQG2mwfNFyci7zU
	OlltF+tm0e7udm4b0YndVgU=
X-Google-Smtp-Source: ABdhPJzNDffegRtIOtu/MDxgwY5CC5pFubjm0AnezD8WrH12G1MFjJaSO3q783ub3Qw/g376+XNGRQ==
X-Received: by 2002:a19:c8c2:: with SMTP id y185mr5970746lff.231.1603736472784;
        Mon, 26 Oct 2020 11:21:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c111:: with SMTP id r17ls5093010lff.0.gmail; Mon, 26 Oct
 2020 11:21:11 -0700 (PDT)
X-Received: by 2002:ac2:5283:: with SMTP id q3mr6161943lfm.462.1603736471379;
        Mon, 26 Oct 2020 11:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603736471; cv=none;
        d=google.com; s=arc-20160816;
        b=wiwjC4bfspT5xGxrkqBNmexdkplAdnHXutI92NSEREbK89Vb7PPOo4oxIy29dLtIPl
         tsHaWAZGHSGpjeFs024uW+FUnoD4dqGynbVicl3npLPuDgZ3PlsjQyz2UadyTm23WF6y
         5EgVfqtoR9Nz/R9qfwPGYyJpqU1zaQDdeV4nyMXT6Mr4EBkuJGchkFAUeEaLaHqctRkI
         V5U+kDUrVjPcnJCSTsUkfy4w3neaUxR9bs+ugnwTyqYIcsNIsKRCCca2BVRE3SmN2XP0
         c3WUM1K2QZ6NesND9lUaKAQMxWMSMeO7z/vMJB3YyUhVVmzAEU9iHoH3Gw7cieTVIO90
         +qUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=lu5bRCwHS306NY2OC7OCgI+Dev/QM3rQPKD6GQwG92M=;
        b=A41ImbkdDl1BWNEge2lRm8eDOeKNv42NclHLky6RlCOb3ep0YxWQuG43diY1TXXGeo
         fu8Aj9i7/FAY7DgWEFLzK7hpsMzjjfvpmO9QROi85pKWNyoxS3nzjfCMFHPOgJpv+8BB
         2NCyuL3biRajiB6iV6rdtJmI8XaBx7pyVkNXCy7JfGeK3ty8jfdwEouc330Amewu47Q8
         ZGpB1fZmKeHGDXPjG9qWNhduWKJuOg+9LlPdPJtjJ1Ymj8fS/T5fSLSvKwgA9HAWWau6
         PQ8s2FbtiwUxiIAfBOEXOazGEeM8RCY8nvCO65VFYOqynnjBcaBMcz7NfaSPR+CaWW9t
         PCBQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id h4si319888ljl.1.2020.10.26.11.21.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 11:21:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09QILA4V024366
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Oct 2020 19:21:10 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09QIL9jT006385;
	Mon, 26 Oct 2020 19:21:10 +0100
Subject: Re: [PATCH v2 04/33] x86: iommu: Wshadow, fault_reporting_cpu is
 global
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-5-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2bdd4b77-4d6b-cf66-46b2-3fce17b68824@siemens.com>
Date: Mon, 26 Oct 2020 19:21:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022175826.199614-5-andrea.bastoni@tum.de>
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

On 22.10.20 19:57, Andrea Bastoni wrote:
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/arch/x86/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hypervisor/arch/x86/iommu.c b/hypervisor/arch/x86/iommu.c
> index fa50c2f4..1ecf857a 100644
> --- a/hypervisor/arch/x86/iommu.c
> +++ b/hypervisor/arch/x86/iommu.c
> @@ -34,7 +34,7 @@ struct public_per_cpu *iommu_select_fault_reporting_cpu(void)
>  	 * Save this value globally to avoid multiple reports of the same
>  	 * case from different CPUs.
>  	 */
> -	unsigned int fault_reporting_cpu_id = first_cpu(root_cell.cpu_set);
> +	fault_reporting_cpu_id = first_cpu(root_cell.cpu_set);
>  
>  	return public_per_cpu(fault_reporting_cpu_id);
>  }
> 

Uh, that's in fact a bug fix.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2bdd4b77-4d6b-cf66-46b2-3fce17b68824%40siemens.com.
