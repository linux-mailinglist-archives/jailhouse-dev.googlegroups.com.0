Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVMXT2CQMGQEHQWJOKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 0164E38C4F1
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:30:46 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id x26-20020a2e9c9a0000b02900eaf62d380esf8701329lji.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:30:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593045; cv=pass;
        d=google.com; s=arc-20160816;
        b=Oq2YIMSVN/yYyjj6KA/WJ9/FESSa9Ovmc2WdsZ6G0GqpgMHKVEcjqrrMq9Hip2krPC
         DYQ3lElc1C9ZYJ2wF++xTV3+iX4FBkF4o5F8IqHUAvaPJACZ9Xc3IQ3hOE7Dw5pFYfrg
         3cbjJNVRUKqSrxB13qWkfMQDK0blsAWw74xwSEEZQMN8+Htdq4LKaKKiu7d9s1zS38/9
         eAY6bmtkQrVPDr1hCs7ZxcmFmV83vwUFYc6TEy6mRnA5KG6sro4Kvmw/9H/TcrcliYK5
         cKsV42Z1IBfw6qjmi4A/NeWNAMBNXPskWeYg2bWwkujVbIlaoYv9AdWPbYTTj19my/AV
         GyYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=Toy2eE0eg3pgJ5QpF88pcWZu2ee+SV8kjbgFEXG6t6E=;
        b=Ypk3Z5TsVAn0/l9n0Ik90/DrTNYzkIi57sTO7FTJgnuKAg1V9p80AIWhzqTE/gkIQb
         fjWNZUlCSVBvN2ATaXQnS2WmXatuw246JzAYt8Prv0o91QD8LGztNnE8kDTq3zlrYcHZ
         iQzDuZ4RhiVUwoLCE14lWBKHNu/CDDtWmEOdyc53lX+lijeaer7ZNNPRNbwdLmGR2yOt
         exqdLCAeQ3ARls+u3ql15SQQZ6zHIiegWkj9fVC4LUA6o02pfAJdg5/o3BQL/ofxF3vH
         wm5jqZCoKPj1DGZMjNyL17uUG9KejRxvFTmy+DbGCltlvQvanid2v6Js8zUgp3rhWKBm
         osCA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Toy2eE0eg3pgJ5QpF88pcWZu2ee+SV8kjbgFEXG6t6E=;
        b=hmVCxc9b9EWa/48wjIf9N/lO8LnY8xMlsglsOvq6E3BOIdSj8JcSrXBpQkcQ+rIoon
         1PfFuNQSqtuqEiMCTasYF94Az6BOfS1zT2adxqZXlegUQiB+vIeALWArGI/lSNB/oS3l
         z5K1qKaheEB+IwSUdvmKYd9fBCq5NdOKtP94EuvAq2hb+UvRCOfebY7zeApAZE6hn0+C
         A5c1RCMHZSWYOkbO/IvynbYI3oftS4FmKX6z+ygLDM+FHFOEWP6M+aKVBN3UVZ45REzH
         v4sEZME0vM0SRS/UwCfo9Y6arDc7+YNVeIkZsurM4gYHc0kJ2SUlAQ+pTEp/jLU0zVZh
         9HJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Toy2eE0eg3pgJ5QpF88pcWZu2ee+SV8kjbgFEXG6t6E=;
        b=mdpMPbLH18PXuwRsgwmB2DgyXV5qreWsHuFhcUyS81eoeVFzVqlgDEb4nZ9bD0Adou
         HWfMRa98rrckogPcYp5gD3nt98mSyHg6Km5+/8FGlgYAa9V7kP0hbSj9JKMlnUN1NzE+
         mbI/rm9k+UNPZWNPWz0WCd09e128Kanvy/ENL1UPS4H+Y1bsLuAqxa3AJG3hPu6yuCBH
         86Z60MeudK/dT5nn6Y2vNdfaDPQCL6exNZ89uGy4yxXUxSFM17pprIIWo6nLpjPbCeGs
         PWZUuia+jOVQ2e6lhJhjF7yxmHiRoDaHuo29HoOsu3V18csEgTyvtK+0ciZE3uZeGmG5
         26Pg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533+nZk/sIcQ0h1gjUxNy3WY2F0EGpbmTtkKbwD6vtgVt9uIxXtC
	WRDkL7+heDW5PoLA7fOLjZI=
X-Google-Smtp-Source: ABdhPJydIf09fc1YASZiLZ2D+2HGXTUGZFvzc/E3WfMTOrBvJyc1uZ5L2TJai7dCjmgBrSzG1ZCygw==
X-Received: by 2002:a2e:82c5:: with SMTP id n5mr6344347ljh.191.1621593045574;
        Fri, 21 May 2021 03:30:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6c2:: with SMTP id u2ls312885lff.3.gmail; Fri, 21
 May 2021 03:30:44 -0700 (PDT)
X-Received: by 2002:a05:6512:38d1:: with SMTP id p17mr1728645lft.475.1621593044354;
        Fri, 21 May 2021 03:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593044; cv=none;
        d=google.com; s=arc-20160816;
        b=JzprC82Szb8EJ8Jt26wiDKgrSJKZIsonUrLD1NZYFu1tvpgjH7HqZV1K5PlCnUc+QH
         n3snxG0EgP/b3gyJEnyx/FKnBnGLQmNEvh8pYZUMImhRZS/gX8To1IGV5bVpxdvlZIGs
         ubFiqUNx+i/ih2BNHraVx6i+IT+3SQFGo5VjyOOU2HzIkTwwOiQJBHizj6TmrO2Whex6
         d5+wfZT8lwpwPWRjgRoD5m6C/MfgHPrS8LdkIbpGU+8l8UD8C3KFAnNQTXWvIWD1Qq5y
         6Kvgw9/lvf8KNxEhM00gpByLWNFuU1HtKgguo9qJaEEWdFr7LFxwuVhriNz5xdNdQY/+
         67mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=JY7s1HvYL/MXYNn89w/0Rt2fapA9XL33bVN/JkBsCxU=;
        b=gqDVkHVnEUzMakSNg699rL3wQXl44bbkHqHo/14kSaVZBraYhluCZL0jUKB2LGIFL7
         XKG/bd3UtmsiBGBQ8TpFAq0z9OydYdqZUeR0fAuARFZxGAq7B7etWE4YNdhdGhJGh6aK
         aK1Joqawg+bFm365IDmw5CYy1Nbe423QvwBeZGdsucBrAsJvSt6gcbEKT47oPiN9QRqg
         SsG8bfZq/kNQew+Ku2K4X+T84MVgsIH6skNCrCoz5irW1s8anlxaKNhaIxyZEl49/DsK
         DDTGXOb5QVGDqADG1D1/yAn8xG/2EXJgu88kNDJL9POnQxPguJ2ZQJnFJKEWkeskTBps
         F6Rg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id e9si293789lfs.4.2021.05.21.03.30.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:30:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAUhRG028479
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:30:43 +0200
Received: from [167.87.240.49] ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAUh3i026016;
	Fri, 21 May 2021 12:30:43 +0200
Subject: Re: [jailhouse-images][PATCH 1/4] jailhouse: Update debianization to
 be ready for Debian 11
To: Florian Bezdeka <florian.bezdeka@siemens.com>,
        jailhouse-dev@googlegroups.com
Cc: henning.schild@siemens.com
References: <20210521080646.488836-1-florian.bezdeka@siemens.com>
 <20210521080646.488836-2-florian.bezdeka@siemens.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3c5fb82c-a704-3ef4-e37f-c18f04187d4f@siemens.com>
Date: Fri, 21 May 2021 12:30:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521080646.488836-2-florian.bezdeka@siemens.com>
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

On 21.05.21 10:06, Florian Bezdeka wrote:
> Debian 11 removed python2 support, so we need to update the (build-)
> dependencies to python3. As python3 is already provided by Debian 10,
> there is no breaking change.
> 
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

This depends on jailhouse/next containing your python3 patches as well,
right?

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3c5fb82c-a704-3ef4-e37f-c18f04187d4f%40siemens.com.
