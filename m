Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSF54D6AKGQEDKOF5JY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2F329AD1F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 14:21:13 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id t11sf742493wrv.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 06:21:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603804873; cv=pass;
        d=google.com; s=arc-20160816;
        b=GdX4aGlexf7JhteufAtrzkPgjdw7LP4i1S7fTam9TFR5r0HsypVw4tH/elcBzATLqH
         DX0mp2/yEkQenUDupKKE0v0kAemi2mcdt2H2+WIxdILDkygEbfJqogzvmps+Lumyjz+x
         E+24lgJ+ymImHBTkxm43Zwbx73+N8BL1FNwqX+7VCxiA2Ix5qCTj3CFwOUZQPosCZif1
         ILOB1Q8iAUqA4HFoFZOdC3IbUBP8hvde8ywvF0e7vsOHZB8uuW3G9fdbCfz8ghDvbnVc
         mNNtcPxaweXvc0dSkT1V5/QHTtuKJ58I5xcOsP6c9VFFTr9gQWMrqHEsG4EGnPasFxjq
         0ScA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=uH1qTz1j++frbX/NvK75HxML6MSzh93gnvaDVh+0Yjk=;
        b=SMD1cEIfj8gis2Z8fM9wTTGf/XbEDvb/3wwCntHUeRezWvHABL1A64WHd04YShC6WC
         vJTL5sb5vUYB0HbdVIu0zKxkPkWZeHJHNZpKG0DgYbkxNlCjD6z+HI7BOapZi4hOi8bQ
         DYqHfS8vMk9c5ys/hs3cwFCVGMCKEZTaSCf9fN9/+5M8tFMcVrrvEG/hTu0oj+72bFGP
         hk3jGBVqiA992Vre/uL3QTsQmrU563Ou/w/jYVEkN4t4L8+d+O8wi1dpZClJHv584B/Q
         IXLalyzQ6q/HsQzBZdc4RGERSEr66eIc9i8K5WlpmaiNLzTH7/ey64TN3K92+cpFQatE
         fhuQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uH1qTz1j++frbX/NvK75HxML6MSzh93gnvaDVh+0Yjk=;
        b=enB6PtJpFGViQvrJEjxMPpClfBY36HNgLAiUW5wFCjJgjxMBnbhtNa1he7qWh3qELD
         c5q7sG16v3xeNBLRGNRUB2/Yx6/98u8K+5ZTVYUJZseZHmWKozFd8KzUZ+JVlbZS0nTk
         VYcs91+77568WC8Sk9W+bRxArLA58di27n0eNgecNhELJuwiZxiDBSjWVCHTojpnFUVD
         elmrkMmnermkzBn9VeyTlRN6kEn93XdcPbkwwKuEmm31qlaf5hmrKOjt5lMw1lvqZLGy
         JyfX08DCfqQQlkqkNhcjAYMmGXPK4ilr4JSMgoSZC7dSSuC8wTeoHAmBjeA/58WA5r+s
         lt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uH1qTz1j++frbX/NvK75HxML6MSzh93gnvaDVh+0Yjk=;
        b=CGBf69bszlJ7S6Tp9UhQueu2loJEmHtmJIclFJnXBB56xnOMs1oT/NNZ6EH3JS5IXb
         XIkCZIaC1sO5nkJ+f76I/d84hpjIoEv0aydqw6qu9jOZ92BqRWsFZdVSDFPBb1iDxEGV
         9i0RgWJ1wCR8iwDnlCeJi4jxTGzS6mJZ3PDqG0fhMlGXvQIlrDmPKMC9zbibIMO9ZEnX
         Sj4v1E9Tq5UrgkBGxCQwXMBT/f/9P2aIwsC0MaM42xbZ8qNOj6KfwhtMa+hMCLPXjDA5
         WE5EVDQ86OfhCPGfL/vzSLqWy9dJAezfrE+U7WhE0YXMHcmtR2o7mirzLF72TG6kHbIy
         4UBA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5322gF9OqXV8argb6QhgIVRKUIoUenH3KybSWUpD+eiUUbaSTnKB
	rvgqbJpN1ZM2IERKhXkIuBE=
X-Google-Smtp-Source: ABdhPJweurqfHjAGHrsogkJ1GfCocZ3kL/yJNyACcO7BlgxBcGylsJ3JQhHrUJeMpI2R6TMM/WnlKQ==
X-Received: by 2002:a1c:f20d:: with SMTP id s13mr150969wmc.156.1603804872929;
        Tue, 27 Oct 2020 06:21:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4184:: with SMTP id o126ls848392wma.0.gmail; Tue, 27 Oct
 2020 06:21:11 -0700 (PDT)
X-Received: by 2002:a7b:c341:: with SMTP id l1mr2822831wmj.80.1603804871835;
        Tue, 27 Oct 2020 06:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603804871; cv=none;
        d=google.com; s=arc-20160816;
        b=z7ZA950GYYtKVTfEpbmzpMmhO4si4FfuouebhrRud10sMbi8UYPlL0s4BPoJJf0Y2B
         K9Swp54JLluPPPjyq8PlhPQXtI4WD1JvZxu/BAphZkxK1HXcULxVfIvMY0R2K0gOEY1E
         Y+qh+6mQ/C8PCa2BXq47N5DMdbyns39TViz6NV6u8I3v/pM4P3TJUFefRqOiyIF+JuEK
         R7Dx9pfgrjWphpYaMDMmkt4TuVLwD7bIMGLWDElPLSr8fTALxzDTPQ+M7OSw2e7tS2tF
         sA5rfJLRQWyWVJAJ0dp6rNuizT0baCGkI0ER+qJ0pQcDWbA+o+92GFzV1AyracS7xhOI
         KuYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=9fWT7MF3ripPrLPbUY2EbnbGCX/LI/Pwdkd1u4+mS2M=;
        b=YUbuZ7FjiRZ0fkY0kCnX8n0rZ1pvAWPhY8oaW6WFC9WNudIMjCpgYkqboBsRPasLa+
         yM3JpRnmKs9qrQ5PzvD4+qvlkSZVklpwd0mDXCYDzj6R56HNDQVR6i8vaDwDrjtUN6ot
         DCN1XTn8Y8kVD0EEw7cqMbxQ1E7KXQMMzI+f6Y3LlIfhhwr+r025oAdCTZbMoKoF8vYJ
         Lmeqm83dfj517aBi0aPNlOl1gBBCXYVuGJZjxFlwampL7OQV7PprPHmOOZuLZ9YKyRZ5
         yQJY6fUsfMIQ6n2m4v86W/1NBzHSLpm2tgqTfCNFJ/jZWxgNgBE5p5+QcFGUZWLcOc0E
         AFRQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id n19si47381wmk.1.2020.10.27.06.21.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 06:21:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09RDLB2E002266
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 14:21:11 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09RDLBgn007072;
	Tue, 27 Oct 2020 14:21:11 +0100
Subject: Re: [PATCH v2 22/33] arm64: smmu: Wsign-compare: make iterator uint
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-23-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0d291b8d-dd45-1c9c-32b0-c9a708f2afff@siemens.com>
Date: Tue, 27 Oct 2020 14:21:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022175826.199614-23-andrea.bastoni@tum.de>
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

On 22.10.20 19:58, Andrea Bastoni wrote:
> Partial fix, Wconversion will complain anyway due to the return int.
> 
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/arch/arm64/smmu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index 41c0ffb4..26d5024a 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -370,7 +370,8 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
>  static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
>  {
>  	struct arm_smmu_smr *smrs = smmu->smrs;
> -	int i, free_idx = -EINVAL;
> +	int free_idx = -EINVAL;
> +	unsigned int i;
>  
>  	/* Stream indexing is blissfully easy */
>  	if (!smrs)
> 

'n'

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0d291b8d-dd45-1c9c-32b0-c9a708f2afff%40siemens.com.
