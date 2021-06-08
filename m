Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKMD7SCQMGQENDEGKBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93c.google.com (mail-ua1-x93c.google.com [IPv6:2607:f8b0:4864:20::93c])
	by mail.lfdr.de (Postfix) with ESMTPS id 0081F39EE2E
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Jun 2021 07:35:39 +0200 (CEST)
Received: by mail-ua1-x93c.google.com with SMTP id v20-20020ab076940000b029020b0b4ada34sf6727370uaq.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Jun 2021 22:35:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623130538; cv=pass;
        d=google.com; s=arc-20160816;
        b=PQ5aQpOd/UpxuELkemAd4s3fibaYXaW+8TdZFYdb8YTFU9xz9AqAXWOe8TpH/TRHot
         2y+uAevGniw+uL09fW8c9G6sEt/XoYQlASSNK1N1+YVVaKFbubeESCng7GHRtCk9gHvK
         wi+/Ti9Mkgook1PyVvlF9FhffyBg4nPGmIE4LOisyGQ5zir+ZE8zUALJLHBmPqK0XJS1
         ClpZ23Ka60OP5Gt1N4mYZLMLwoQNRLoSYamK1Hv4LyXlCuT8xyJFlpC8gdBhl1y0ZbEP
         NuihGe5LLikZyX0KMpZJrtYY6SJOVyBdAgOZzGUuKSfjq4OfTPHndLKJhW8JqGqghgLa
         I5Zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=7Ts6XVCazCF3OGxQA6d73SUf9YysnCfp3cyN412KZz8=;
        b=vkNEodOwdCziXkUze/2Cr5TbzMTNMkrYhM/dz3rCaUTwhnC9O9r99knCGAVrmXqQzN
         t/XmQP815wDK7uXadkjJWZrfxFvdnbN9OUc7iVIqwpqOd1UxFvkUEIlqCnWAaCGaEMvy
         +c0O143L2EhZAN4/kshbNEr4SY9Rhthv3RM6R2goZ2hw7vBN9NyICq3Hkla+y12qaDKC
         WUtjduwWcGgN4QrxgO6xySWBG5XMiXsV4+VA4XN5VN+iatHvWYe0yFUpuvflBeBg8ZA9
         FTZuM5u8+gvjg/KS0qkjt34Oi7+liQ0x6/eWPIy5KfkJAvkI4svRyEKZF1IlqF7yhQUt
         LMVQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7Ts6XVCazCF3OGxQA6d73SUf9YysnCfp3cyN412KZz8=;
        b=FRV9iku333+dkE3a3J0nAWqqE9QafkWp1lSiRNQhs2SN/QjPjnLpHBuOa59BCUHHP3
         6wHL8uynav4OM+mpSbtYEpMDwwqGb6l6Neg3ykkP8Uvk93GPBQKOj78AtMk1CstFZdTG
         UAEYfg2Fiqm81PpvLxTuUrwvpHpnGDRqPRr139k6CGjP4ZFlabUCRQL0JivS8/gD1zt1
         vi7nlRo5WrwSbSrFOJH8QQ1LOcl9RuA6x2eIbWSW9f7r6tTebKQCYIbN1l2lDJVmyCWE
         yIiNZ7Z2phaTeKhtMpimAxv/mnAhZaXltq0stsBOjIyNtOhPZ/150BQkgaHIqcj7MlsL
         lR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7Ts6XVCazCF3OGxQA6d73SUf9YysnCfp3cyN412KZz8=;
        b=q03j2r53WnaNJYSmniKK54kjxn3fyIUO1zD2y/DgnUo47aM7TqgdoHOeN3vCh5pBSR
         MAfb6J9Q31mEiGLGGDfe7Idae4t3ufZFoErKX6S7zvFVxOm2guBMXRuUP7XZjxRdiZ49
         9sfzwoBSifmDXOVat6nmwcN3iDna682+1+8HRjouVmbT/KELpTZD9zLoPAYJxUuZQNye
         wHd4g+poG97BXOYL7TwaW9S1yuggZhQCnzEyAJM9P0QDkSmr1kaMp5YnrXsCCDyC/7gC
         bYU1vU3oAxuD7BJJgihgAL2ZCNVvxHiYpwhO36+NmwxShhZUsYnZoVGURUKx8MUO0k5A
         uUVA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532SG0XHyVs4UCbcRyd5oOcqucLpVyi0e/97PPCe8Sl9bQzPEKFj
	rw2ciO+j1TGlGFCqH2X0KEw=
X-Google-Smtp-Source: ABdhPJzMnY5j0BZsqOVR6InW97XRlp8lIA42HjyH+p/v3kXSTfpmCNhuWmkem0/8AbRQGkvwNihbxw==
X-Received: by 2002:a9f:3232:: with SMTP id x47mr12027262uad.80.1623130538058;
        Mon, 07 Jun 2021 22:35:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:40a2:: with SMTP id i31ls2143346uad.2.gmail; Mon, 07 Jun
 2021 22:35:37 -0700 (PDT)
X-Received: by 2002:ab0:d8f:: with SMTP id i15mr11700826uak.104.1623130537336;
        Mon, 07 Jun 2021 22:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623130537; cv=none;
        d=google.com; s=arc-20160816;
        b=uQn/Qhtpz3Pc1d1HoV9/v7Xj48sMyY5zfzWOIQSiqEBykd+iipTwzuuEU5KzgV5pC2
         lW9kkRx2RJ1+zv26M+4BCBUO2Hcm/0v1zr/e7n3QYPoRbs6Xj65e2yD39PlWemNrGSKR
         KZpVNPYUp3r1du4D/9pXSZUEHZcvi2Afq3uAag/pEmHvyFZKVQqecgfUlH6D2uEti76j
         sR8W6Crk9bmV1GxVKXRbcddwiyrHZ16xlIgG26CeGntlNF34rhqGE/Q0NJlxQA5uu/rz
         fRRkZ7TMUjygl8kyq0Zeaa2srAbHKvaRr3JExhl2Ql6oEJglnFZ3HCsJB7rbleEyVYtz
         P61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Vxq8HtObf3X4wHbp3PQzFza+mvztTrZ7ykMCDYnudkU=;
        b=grN1KroP4HC+lWa8znfnCk5HAIzJm7SYkAJWNnqrPSppKZscsohu/2YABhfmgOTKuv
         0Lv8CTICgFwGnffXi+4RXf6gu6qnkUX/Y7ppY248YhhWxHLTNa0fN/7FyljXISF9OM9a
         AZS3o0wxRlofl9Gyi9sVW+4/VP6CcxWVTx/GqpXnoEan6efILHaiQwfemj81jJgTOTvn
         TYrPFUlrTednwXmlRsusirg6cDuOZrRu7Re5TC3C6DD9ctJIesfHdacfJdnnkGMyoHVW
         MtpTRMVMXFsrtTVQxcpYTMrZWIBQTXJ3VVlq6UuUkBLpraaIE+XajedCfr85b8WVa3NK
         CMLQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 8si1708572vko.4.2021.06.07.22.35.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 22:35:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 1585ZZ3u029572
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 8 Jun 2021 07:35:35 +0200
Received: from [167.87.44.81] ([167.87.44.81])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1585SJJA001360;
	Tue, 8 Jun 2021 07:28:19 +0200
Subject: Re: [PATCH] customizations: include wildcard into SRC_URI
To: Henning Schild <henning.schild@siemens.com>,
        jailhouse-dev@googlegroups.com
Cc: Florian Bezdeka <florian.bezdeka@siemens.com>
References: <20210607180741.12416-1-henning.schild@siemens.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e7a94ecc-c1a2-67f2-f7d7-93840667f09a@siemens.com>
Date: Tue, 8 Jun 2021 07:28:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210607180741.12416-1-henning.schild@siemens.com>
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

On 07.06.21 20:07, Henning Schild wrote:
> That kind of tells bitbake that the file is "optional" and it will not
> warn about it missing when parsing the recipes. It would find it missing
> in the install task.
> 
> That allows re-using jailhouse-images in projects that do not even
> install the customizations package and would receive warnings when not
> having a config for the package and their machine.
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>
> ---
>  recipes-core/customizations/customizations.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-core/customizations/customizations.bb b/recipes-core/customizations/customizations.bb
> index f71a07887bed..c3a1fde01822 100644
> --- a/recipes-core/customizations/customizations.bb
> +++ b/recipes-core/customizations/customizations.bb
> @@ -20,7 +20,7 @@ DESCRIPTION = "demo image customizations"
>  
>  SRC_URI = " \
>      file://postinst \
> -    file://.bash_history-${MACHINE} \
> +    file://.bash_history* \
>      file://e1000e-intx.conf \
>      file://ethernet \
>      file://ivshmem-net \
> 

Taking this, just making it ".bash_history-*".

Thanks,
Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e7a94ecc-c1a2-67f2-f7d7-93840667f09a%40siemens.com.
