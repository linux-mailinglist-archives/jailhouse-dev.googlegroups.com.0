Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBME5T2CQMGQEK3PK4ZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B82738C525
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:42:57 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id q18-20020a05651c0552b02900ef6822c5fdsf8658807ljp.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:42:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593777; cv=pass;
        d=google.com; s=arc-20160816;
        b=Vdy1MTTA+jhV6Q9qBwUx922jcaBEwm1qwP/yrWsKMjQjZjFgFMYyiVw1IjB8AVR4RI
         KzIF5ji2+rwlf+JCuAVMUikBm2P+xkCrQrQlkeqHSdp7eQZbDYK4UIq1o6kvpv1Cnpaq
         EIVpGUjjeH6E+/lwzWK9eYeiJoGmsN3K8uWBKooYmEcPRxHezPbgEc//quNAuSrX/YlJ
         zSuREI3UmEGIUd8jEPGGSVMhunD1DztJ2l7AXelGxWmcBPvt4YW+ogoSFwnVJx/txlhV
         3DuGVvcJygap58r4sEStF8HhZCwlYZNkZ24UQC3LpNrJTAa597Osu429jvHmt5T8NyYJ
         4QIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=RhYpJU2w2kBWJwG+ZTvswycgR3jWgzod4uNSe/tirIM=;
        b=hx2BK6hRA/qeqxEoZpnzs4pmtXAv+62MfA1kw2+j2EUGzpQTsSMhv72VLxOyn8nLn9
         RLs+hFKNE8akJ9iRYUec40o9JSoftvF3B3NlFCpTE9aJui7FegZlRXuch3tx2VNocf+V
         qmxnD3R66Mb3NjoUa+bBP+f8z/N4lU3PAudjLeYNnaUXRwTakVIX481m+G/mh2Kpsd7p
         mORB70SMDhb0vhSwbPrS+Q2PGNuywfwCajx1dPw1tXR+eD3BlLMriZJaa/poxdGYU0yW
         /Rq4YxnsIOci+F1uAPmqLA1saJfWHiPPQUUDvdpEwbmD2jTJ4wGHSAD4YiauGFpyZTUu
         SBig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RhYpJU2w2kBWJwG+ZTvswycgR3jWgzod4uNSe/tirIM=;
        b=DQl1J4k3Wd6Zw4+awr9iBx6IfDYJC7wsfZT33o2Bebwn03YdAZF3h1DptTGT7x1aZR
         q/rUBxI7gSEpHK12iJmY5mRXMfzgQoTmvGu8EHHiK3O9QUxwx9m8GFUUnNrA34Kr3IPV
         8iBfjeViMABVGTAiabIw9GWKa9bFxJAS+tUL2Hej/d8VWmbdxHL37BrcEI6rR1/tfK3M
         6DnlKRLEF4D0mEp6eMIHsgnTEM5dYtWT83gcaPX94KEEndVNrAfsYHQMqeG02WovpzIo
         61CYDGM7e5FWevo7bdmhuUbB3hCCBSDUjfpvK+CDkuS91qDHYx5E/li/ZWfxyrI0331R
         5dVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=RhYpJU2w2kBWJwG+ZTvswycgR3jWgzod4uNSe/tirIM=;
        b=ON6ITlEcsCix+Wk1xnyGunZD1wqHzYIZGxOmV9JI5eDjR07rvAvZqCXnxjr5fgDLdr
         6RjTk+U0ZElYwg0r14tQroto/cEH9ytC6wZAHoAv69Vv1vaYW4F0nzBJWqdvFJ0qOeN2
         emqiE3gkjzgJlxSH0CThk/Mk2CsYceSjh+BIT+aP9OhlfQ3GAqrrPpyEHIOB7pkr3NDt
         m4XjLvPPtgw934WC67vNQWhAtxVTg/Iu2U/aVAZpMtTQQajDX1K73Af+dqO6XLsbATj5
         uLHk9WnabBApw9wP5R/H2taGLAOd6vG1uFJjuX3cnKb4rKP/MolGH4X3C/kRiubHucJg
         jNuA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5305GZ7Ra1fQyNZJsoyA29m8LV9TR60nazSNoLRuh0fGZDRaMt7Y
	sd2dnvIZzpHDRvILknT27UM=
X-Google-Smtp-Source: ABdhPJxlR3zNjmEW0h+EnHejw8CeeCXLS5GvDXbMFmQIbevGb+Meu3JjbnO9HQQ7W19PhUB2liEYkw==
X-Received: by 2002:ac2:59c5:: with SMTP id x5mr1711611lfn.603.1621593777204;
        Fri, 21 May 2021 03:42:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:592a:: with SMTP id v10ls332642lfi.2.gmail; Fri, 21 May
 2021 03:42:56 -0700 (PDT)
X-Received: by 2002:a19:c005:: with SMTP id q5mr979153lff.329.1621593776103;
        Fri, 21 May 2021 03:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593776; cv=none;
        d=google.com; s=arc-20160816;
        b=A99/z9/vGdw87BehkrTTSKxPonRc8eRKwfZDKdDeFIK64NOu4CtpfobLl+vlZIFxEm
         1KGCRRmyfSuShRqOVqnbWek5buZzPq5dnzwMbaOauvm52tAwYDLblt65Jh9e7AsB7f//
         yg2x664QUYtTevFQ1utSU2aa7eSCsxNgBjDlF6eGOjOQOmX2URklmG66SsQZ1MCs1q31
         Kke14BoZK7t5v/jGlt9fAQ0d1CenBSiS2zK6q4osIO4osHG8vhdIqyfFwFBn1yYyoYMm
         wdzGFlFtHK6jq3JPVGPH1gBu4TaSSMipE/o6eff4DtV0EZaCv//UNmZlr3h2jsphOlie
         wywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=k5HO1BDO0WocTZzM/THAlKybHMJ5GIPwfMwZEZ3BPFM=;
        b=eIuWS/U521WA2f3eQNb5z7pmMuAyv61IrlKV3bOVV4+lMFL2RkL92sKKhUfblF/FB9
         ucCp6x317rRZMymftbT3ZO3lnfB/lcm0wJTyGoqghW5QYgOkgErk5B+VooS9Cr3j7KOM
         719KeGczvaUBg5NPTv6TJbavoZ7q6jVwwntrtpO0JIU95zg7exMdRqG1fNkln9G6/0oM
         z4v/z0IHEjDneJ8Z8xTyKoffPM/RriJCMz1/uZJw70TFUMF1rR0toh7lBu+VPnIQcbjY
         2q3j6EasKhAmrzrmThKmXE3uxFBjDVKCCopPqVjNNbA/WDqifi+GU6P9cMxAiVTpwGcM
         o2zA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 81si236834lff.11.2021.05.21.03.42.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:42:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAgtwA022394
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:42:55 +0200
Received: from [167.87.240.49] ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAdHOW001596;
	Fri, 21 May 2021 12:39:17 +0200
Subject: Re: [jailhouse-images][PATCH 4/4] jailhouse: Make jailhouse.inc
 reusable for external recipes
To: Florian Bezdeka <florian.bezdeka@siemens.com>,
        jailhouse-dev@googlegroups.com
Cc: henning.schild@siemens.com
References: <20210521080646.488836-1-florian.bezdeka@siemens.com>
 <20210521080646.488836-5-florian.bezdeka@siemens.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c0d916ab-6a3c-c510-a60a-f041c869e81d@siemens.com>
Date: Fri, 21 May 2021 12:39:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521080646.488836-5-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 21.05.21 10:06, Florian Bezdeka wrote:
> - Adding the directory holding the jailhouse cell configuration files
>   to the search paths used for SRC_URI
> 
> - Copying the jailhouse.install file to ${PN}.install during build
>   preparation.
> 
> Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
> ---
>  recipes-jailhouse/jailhouse/jailhouse.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-jailhouse/jailhouse/jailhouse.inc b/recipes-jailhouse/jailhouse/jailhouse.inc
> index 5f99915..9275366 100644
> --- a/recipes-jailhouse/jailhouse/jailhouse.inc
> +++ b/recipes-jailhouse/jailhouse/jailhouse.inc
> @@ -22,6 +22,7 @@ EXTRA_JAILHOUSE_CONFIGS_amd64 = " \
>      ipc127e.c linux-ipc127e-demo.c apic-ipc127e-demo.c \
>      "
>  
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>  SRC_URI = " \
>      git://github.com/siemens/jailhouse;branch=next \
>      file://debian/ \
> @@ -44,7 +45,7 @@ do_prepare_build() {
>          # Install device trees only on non-x86 archs as they only exist there
>          echo "configs{,/*}/dts/*.dtb etc/jailhouse/dts" >> ${S}/debian/jailhouse.install
>      fi
> -    mv ${S}/debian/jailhouse.install ${S}/debian/jailhouse-${KERNEL_NAME}.install
> +    mv ${S}/debian/jailhouse.install ${S}/debian/${PN}.install
>  
>      for cfg in ${EXTRA_JAILHOUSE_CONFIGS}; do
>          cp ${WORKDIR}/$cfg ${S}/configs/x86/
> 

Thanks, merged to next (with minor style tweak).

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c0d916ab-6a3c-c510-a60a-f041c869e81d%40siemens.com.
