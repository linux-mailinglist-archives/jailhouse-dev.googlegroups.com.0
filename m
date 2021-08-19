Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4PS7GEAMGQEFFO6BDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4AB3F1CD2
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Aug 2021 17:32:01 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id q11-20020a5d61cb0000b02901550c3fccb5sf1819815wrv.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Aug 2021 08:32:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629387121; cv=pass;
        d=google.com; s=arc-20160816;
        b=ML9lhrJenThiA63vQOsKpK7Ro8PzLT8NWNV6QitWt5apvIrymbyGlYWwrbhV9l97Kt
         I1CxQfG1poRjNO/+D+ETqEBBlpIb7yIpW336mStOnnRfd9e73jRirapjl2Oxm6RpiRIC
         CsT3xKh9C++254/JXmmfo2FMGCvbWbSpsVBgbUPfvLwnPbD2JxTojbBqjBIff87/hNdx
         7ACjP+est5Okq7JlIyNolLWtIfOT1rE+LaQth3MEEMG2+pVS9TMbISC5OZgmua61Urac
         4JTScbxM/0J3j6v5SzL7TDsVcDJ67qwdCZ9f4cBLoiJMSmbZgpgtftPss/xbsQnsf+eh
         9auQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=voyntVOktAUfNmn/2JVtOdIcjMdJ4lGEFVaoCPn/oB8=;
        b=vTaYYw9h9oX5aPrEvkg0wFhL2xfGSNLtlxRHbaLGH6xn1HgVkHYUa66XYJx1HYPOrF
         tKYdiEbEKm1PWkvXFibz0YbX8PWs9+ZHzuiJgWvEJh33BGPgnC77Z10yPiyPhxODD70z
         0WoKNNzNUPKQDi+oK3QuJHsInmj12OpSlLMWoSA2F3GWDOHN2VPMsDxtZN5EiYaBIiHb
         ZR3nYKqGaHZWNk/s/h+5hoWvDZAqk86tEZ1ctYFEQYcL802gt1sjsJORBiBYKN03E2jy
         v4b/P4bn6DUc+p1aYMdhjzMgZSqWI1q5KNFw5z26cpO8Q3U7V+J+WHt60820MPOGW+ZF
         L7pA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=voyntVOktAUfNmn/2JVtOdIcjMdJ4lGEFVaoCPn/oB8=;
        b=UFZ/ZyYK4AnN1tJq4RvZQXaud8moSfKHP59hhPxDddCRnHlERXESefUgTVGofrf5OX
         yl1P7sFmP/YbUc3f+bQEJSLwnKJu+ynBvtEZmCM6evn3E3M8L59hZT6JPhr4pGYSvtmo
         kJ3GbKWjiX12vshwemAmGchOQiHyo5Ceu5URgNIbUBRhnHqS1KpVOVIk3jMax99DKNHc
         6uEYDvIZlvMcDJWDoIyYGYEEntOio5FzeSQLPGlRGD9RM/ueaB6SLmJdxWwklwIjPR8D
         AkcJT9FwtKIuzxbtNsiFPjqO7S0+qj9C6pySAbrQnEGLiFLENywgMac7ANCM+YyLaqR4
         arxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=voyntVOktAUfNmn/2JVtOdIcjMdJ4lGEFVaoCPn/oB8=;
        b=Q1CqweFl07pkELtEBvZrW4/CxWn1kZIDnARR1qbFWLxQMx6cWte7X1qonFIDvSWp1y
         fIq13NxVunrZPHEviT/gdIFEH2yCzodKsgx8IUhjfgboxciC5UoU3wLXx7ES12qBTyMA
         NcGKkpv9y/i9IHwVch7vscUqavRZ8rGMfCxRnkd9w2vqGWEWd30aDOwvPROw2QT2gaPG
         BncNidAaARLqRG7CwzEKq2wuoYGejxCdwpjbspzm/Qe6wfldTNTRMh5bYNC1gUBAT7Qb
         Lg4WnFJAwn/IUj60yfOefBy6Q3yqDFMtiPEs0w8NxCjBBk8TKdWumiaqDHbbGBL0F0un
         RNlw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532/3eWKHX1C6s8QK5h6cCYkruVEHSiz/cDixPQfONQRa0XAgvlB
	PNnkrjmbxWMBk4zV9zWatjo=
X-Google-Smtp-Source: ABdhPJxARqWBIhetcIpZgZ8iCBkPzXX75gNOXbEQZb9hB80PW3KTWhPJiogz1RNrgkzr0Xh7h0FNFA==
X-Received: by 2002:adf:a3c6:: with SMTP id m6mr4523646wrb.32.1629387121322;
        Thu, 19 Aug 2021 08:32:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6251:: with SMTP id m17ls1243294wrv.1.gmail; Thu, 19 Aug
 2021 08:32:00 -0700 (PDT)
X-Received: by 2002:a5d:5008:: with SMTP id e8mr4570397wrt.103.1629387120283;
        Thu, 19 Aug 2021 08:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629387120; cv=none;
        d=google.com; s=arc-20160816;
        b=J2kq+qv6F41ozCkt0OvMQuao9u9NJIWEyzUoa8phEgCE81bqXfzf8EXSuG35R+1HnO
         q1jZN0e1Bd3Exi4ur57vb+FjPmD6trXmQi5JMclXdiHalpBjeTX95wSNofwf3H7bGWBK
         WLdepVzfe/UPe7TpBEvf6uyyaj2Pj0dJnxFN1iq1oYx7zP2p+iJ3jy+6NmttKrnu6c7/
         vTe/STO3eYy9Vchek1SRwznLQVgAgOV7avapdGkV0hTJ96achtz4NnmyvZzRoxZPZOsk
         CryMUNFmlcsQYUHRgzT95VG8stCQcrrL/wdzLKYjShWjxMnPWq/eu7NJJpD/ZtQS9ox5
         MZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=8by0bD3Hrwq1z6hOCOPOZA4t0T3wS5sb2OBnITeRXmc=;
        b=H7ao6TxtcFppEup64z5PiYs9q0wGXABY6psHgwj9mFhxy7OwVOaB882AAXxsE8XH1Q
         A1ES8aiL7jIIQ9Kqg2RZj6kglXmwZ8icJVy8nsDlfck79jrF5LM8ek6W9/w/VtJCVLnv
         VLMppyEOQ65nM5yuJlpYomhFCKjNPc33fdAQHY/xkNjtZGEtP9RCsONBHMi7t6F7dEZK
         xuqVrZCxOoRTu2yJIGHEvI5/D1arHPNYqrtdzml0THr8SOeiH8+xFbvr+XKpm2bjk5Mo
         TrrMRXpbi1AOu9kWWXFUPt+0OjX2SUG4SlPpotI6Muq8HxMVZFVlNhqoaAGZmBKxXVrW
         t7nw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 15si536966wma.1.2021.08.19.08.32.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Aug 2021 08:32:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 17JFVxGV005924
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 19 Aug 2021 17:31:59 +0200
Received: from [167.87.0.29] ([167.87.0.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17JFVxYa020666;
	Thu, 19 Aug 2021 17:31:59 +0200
Subject: Re: [jailhouse-images][PATCH 1/4] jailhouse: Update debianization to
 be ready for Debian 11
To: Florian Bezdeka <florian.bezdeka@siemens.com>,
        jailhouse-dev@googlegroups.com
Cc: henning.schild@siemens.com
References: <20210521080646.488836-1-florian.bezdeka@siemens.com>
 <20210521080646.488836-2-florian.bezdeka@siemens.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ef591b13-1dfb-47f4-0a20-a4cacb63ac37@siemens.com>
Date: Thu, 19 Aug 2021 17:31:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210521080646.488836-2-florian.bezdeka@siemens.com>
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

On 21.05.21 10:06, Florian Bezdeka wrote:
> Debian 11 removed python2 support, so we need to update the (build-)
> dependencies to python3. As python3 is already provided by Debian 10,
> there is no breaking change.
> 

Finally merged, with slight adjustment of this message: Python 2 is
still supported, but many libs have been removed, breaking us partially.

Thanks,
Jan

> Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
> ---
>  recipes-core/non-root-initramfs/files/debian/control  | 2 +-
>  recipes-jailhouse/jailhouse/files/debian/compat       | 2 +-
>  recipes-jailhouse/jailhouse/files/debian/control.tmpl | 4 ++--
>  recipes-jailhouse/jailhouse/files/debian/rules        | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-core/non-root-initramfs/files/debian/control b/recipes-core/non-root-initramfs/files/debian/control
> index 5ff2c5c..0ae9a97 100644
> --- a/recipes-core/non-root-initramfs/files/debian/control
> +++ b/recipes-core/non-root-initramfs/files/debian/control
> @@ -2,7 +2,7 @@ Source: non-root-initramfs
>  Section: misc
>  Priority: optional
>  Standards-Version: 4.3.0
> -Build-Depends: wget, cpio, unzip, rsync, python:native, bc
> +Build-Depends: wget, cpio, unzip, rsync, python3:native, bc
>  Maintainer: Jan Kiszka <jan.kiszka@siemens.com>
>  Rules-Requires-Root: no
>  
> diff --git a/recipes-jailhouse/jailhouse/files/debian/compat b/recipes-jailhouse/jailhouse/files/debian/compat
> index ec63514..f599e28 100644
> --- a/recipes-jailhouse/jailhouse/files/debian/compat
> +++ b/recipes-jailhouse/jailhouse/files/debian/compat
> @@ -1 +1 @@
> -9
> +10
> diff --git a/recipes-jailhouse/jailhouse/files/debian/control.tmpl b/recipes-jailhouse/jailhouse/files/debian/control.tmpl
> index c8e625f..8caee4c 100644
> --- a/recipes-jailhouse/jailhouse/files/debian/control.tmpl
> +++ b/recipes-jailhouse/jailhouse/files/debian/control.tmpl
> @@ -3,11 +3,11 @@ Section: misc
>  Priority: optional
>  Standards-Version: 3.9.6
>  Build-Depends: linux-headers-${KERNEL_NAME}, git,
> -               dh-python, python-pip:native, python-setuptools, python-mako:native
> +               dh-python, python3-pip:native, python3-setuptools, python3-mako:native
>  Maintainer: Jan Kiszka <jan.kiszka@siemens.com>
>  X-Python-Version: >= 2.7
>  
>  Package: ${PN}
>  Architecture: any
> -Depends: ${shlibs:Depends}, ${python:Depends}, linux-image-${KERNEL_NAME}, python-mako
> +Depends: ${shlibs:Depends}, ${python3:Depends}, linux-image-${KERNEL_NAME}, python3-mako
>  Description: ${DESCRIPTION}
> diff --git a/recipes-jailhouse/jailhouse/files/debian/rules b/recipes-jailhouse/jailhouse/files/debian/rules
> index 0b53ade..8b14792 100755
> --- a/recipes-jailhouse/jailhouse/files/debian/rules
> +++ b/recipes-jailhouse/jailhouse/files/debian/rules
> @@ -27,4 +27,4 @@ export ARCH=x86
>  endif
>  
>  %:
> -	CFLAGS= LDFLAGS= dh $@ --parallel --with python2
> +	CFLAGS= LDFLAGS= dh $@ --parallel --with python3
> 

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ef591b13-1dfb-47f4-0a20-a4cacb63ac37%40siemens.com.
