Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBEU5WPVQKGQE24GYVTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 606AAA50F0
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Sep 2019 10:10:59 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id n2sf199832wru.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 01:10:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567411859; cv=pass;
        d=google.com; s=arc-20160816;
        b=yJX08qCyNZt6Ucv27Vv4Zc5bVQmKD1cMumshv2PDpJfaeNXPcN+llsWr7kdsKQIzX2
         GeNiKLWgKxsN6WlI3YJ+UbFlnXHqPFx2coMW9lNUYHaeVVoNn0vSbcTKimRjoj2iwyOu
         1slN1p/hPf7ajaxBkU31jNpTv2AD2nCsL2LkSZ+z4xM5/VVebLrpA8OuMpx34FNRwfr9
         U60aAOz7U+AiJa5nb71xTD5iyGYGabAGlGyXMEFrAtHYYMl5s11uBP6CQF+nhn0rEGJn
         n5/izHBCuhHFhcb8Zv9vQYD8pwopRj2xxqQDZLq5Jxk9nxTIHTF6fmT+32PsJCYyqdB7
         Tl8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=oPj4DE3jOtLE3PXjVBmj1gK3G9QMVMyrUdGKb3lcHUQ=;
        b=hhGsGr2MLUTHy6Da/Yiy4UxPsZdyjwTdA1be3M0Ui6/XGZC+E9HUSsx1oZJOjkOMpM
         T3vg0a0gh/5qthrwrGOdEE0Rrf81TbvMfEDwwLzoSGKfn6qlvaV3fuSyVh0alggYaKoM
         XQA7gdXwgG0vT3VtkQNvUteSLWbP+XQ8ktW68o30TO4OUUY+Jzc3uGeXI9dLihJygiS5
         uO5m/v1CqFAXdNOCcHfQbmthvdy2Kpzs4NT7FuwREiLus3wANpwkpQ94BZMOgHYo7QBj
         HJv1TMKmnlhBd5jwzMjB/2PGj272WJJyE5B+dDf51L41Y8HH3VTI+D8L3mHI2bg7b7rw
         32eQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oPj4DE3jOtLE3PXjVBmj1gK3G9QMVMyrUdGKb3lcHUQ=;
        b=nZqTIAd01JjqpGA9ms++zeHsaWRyrhVGdmz+PXVo0OQ8WA7QrD6ERVOvocnoE9jDf7
         h2dcUecjzZpyVBlBi87AyADN6qAI+nvo+3DN21+fUt7b3AqNkiG50vIrlfGDi6xVF1gm
         y0NgvsIcMGrMzBW+vM7daw0pGkAJsmqKjF5+bfA5nlFynQZKiGmp4KisnMv4sNg6j3Y1
         UEC9N8FRRuWjaZtCl0WB4TgXe3S9iGOKBdz3/lK0j1IT+WNprKw6zwyJIWSCtbFhq4Ds
         vV+4uu5AJ8oX8qPxNfNcK1ZHD80y6xBvxjOPsX1ECAh98swq2xwQP2OeKmw49gflQdCw
         9k2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=oPj4DE3jOtLE3PXjVBmj1gK3G9QMVMyrUdGKb3lcHUQ=;
        b=ZMlmsQQqQrcuWAe69+F4lXO5STFziqcm/hQ9OQgsb9qS2+HXEsEO8+ZykmGpYphNl/
         xKF2mZfaUBylH/0LWZd7c6MAg7NxuLNiG/DrkBolgJeG/U6pMZUIzgGjmeFmeZOn2wVz
         7tehD9l7HC4wNP2dO3nzTmGwmZmzydSQ/gnQ8UGBHhlzHjeiy3sJH1FG4n6LtFJevsyZ
         +M0ksxycJy0+Pocubjp+o/6yNUDY6cHGWEMASmkkCcCQQ5N8k8AcArGVpczaA7djJicZ
         iExhBq+IZrIcQWlfAc62PSWbZRsFntEWOwV+8fe2NrBAV8FnpNcdMdCSwbZWlmFMNVY6
         37vQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWlM4JUYFqzx8Oi3b27q+M9K0BHLDRuMG3KNQj2ZF9K2gB0VW5g
	9kOCQF14oVXnNcFwHfGZXC0=
X-Google-Smtp-Source: APXvYqxQIBoYuH+iIER3BgrMo/VaLFMcxGm+t0lQCIm8le5T43oUniKJiAlBReUg5gmiSspcWD1t5w==
X-Received: by 2002:adf:f110:: with SMTP id r16mr3767261wro.152.1567411859074;
        Mon, 02 Sep 2019 01:10:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:660f:: with SMTP id n15ls3807183wru.11.gmail; Mon, 02
 Sep 2019 01:10:58 -0700 (PDT)
X-Received: by 2002:adf:ea08:: with SMTP id q8mr35822732wrm.188.1567411858532;
        Mon, 02 Sep 2019 01:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567411858; cv=none;
        d=google.com; s=arc-20160816;
        b=Agu2uwzp8Fg0xt4KjuzgdRoWf/1Oef2Oe17GwiIBl1IvvGSz/PFuQRHADPw6EluwoC
         CgsxGDlRhfDGJqm6XJI+eKaPd2a69y+B5J2vXvE1sTUAHDXVMLjpDl4gt2dqeKU2jrbu
         RxkuMYM7P+EpyRubVR9Zd7Ooc0cN9MvHX8c7g+8GgtjOSvnMW1VrRLSPtcMAxZUN8Nri
         ZJpKB0+Q+MKEb7Z72s2aC8vJg+nuhaLIiRYt+ubjXz9MXCwzfcALQUYzlvVCTShlEjfD
         Z7BtAOvNiSJKhrW6k+zVtHVFjlX6/FOdAIHYPczkb/QiC8m5Ljq01DG2c5hJ9pXI5Gdc
         s23A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=9ztfVD7fP2pFgIGm4d1/rrokDbeOmdfHoF1pss8GYyA=;
        b=xhQD3LQWZgd9X6xKKDV9UoWZOWnYIZl0YjLtl2UVZEeL5XAEUHYpKR88NZE8C0aEL4
         X4d9mBpSz0nblYTfmNNvFHIJHo2onsXu+j9FEhPlVluuxkokt/ZJk3eh2jZjKvBly6FH
         Y6vtqnPjsnmE+LhGUdgSL2Y6MAa8G+GBgSMgxtINDiwUd4i1q+YQrERQ3zxmki62vxY8
         awu0HSOTHFku7YpaQpxxt0+XlPBewcMWGnW45vQJlkASH/coNMP+I2iXZFtdKELtBjZj
         Z+kgk2Z+n4oh9R8afW5l/vGGHQ1tY2Y4Z8irwdWG2jerQ0eiwHedqfupWQXTw1vBoBk8
         RU5w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id g7si1331646wmk.0.2019.09.02.01.10.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 01:10:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x828Arlk001659
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Sep 2019 10:10:53 +0200
Received: from [167.87.32.192] ([167.87.32.192])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x828Aq2m023346;
	Mon, 2 Sep 2019 10:10:53 +0200
Subject: Re: [PATCH v2] ci: Update build environment to Ubuntu 18.04
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Steven Seeger <steven.seeger@flightsystems.net>
References: <f2377f95-78fc-4c83-0eb0-204babeb51e6@siemens.com>
 <08337573-b545-aff2-315b-174504c4caf2@siemens.com>
Message-ID: <38ca40f7-fcde-ceaa-1c91-f4b809a9e0a6@siemens.com>
Date: Mon, 2 Sep 2019 10:10:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <08337573-b545-aff2-315b-174504c4caf2@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 02.09.19 10:09, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> This allows to switch to gcc 8 which may report issues earlier.
> 
> Powerpc does not build with gcc 8 and even also 7, so go with 6.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
> 
> Changes in v2:
>   - switch back to gcc 6
>   - switch to gcc 8 for the rest
> 
> Steven, any chance we get ppc to a newer gcc? Are the issues
> 
> https://travis-ci.com/xenomai-ci/xenomai/jobs/229976797#L786
> https://travis-ci.com/xenomai-ci/xenomai/jobs/229922504#L3071
> 
> fixed in newer 4.14 releases?
> 
>   .travis.yml | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/.travis.yml b/.travis.yml
> index 671c551f72..15efb7ccb1 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -1,15 +1,16 @@
>   language: c
> -dist: xenial
> +dist: bionic
>   cache: ccache
>   
>   addons:
>     apt:
>       packages:
> -      - gcc-aarch64-linux-gnu
> +      - gcc-8
> +      - gcc-8-aarch64-linux-gnu
>         - libc6-dev-arm64-cross
> -      - gcc-arm-linux-gnueabihf
> +      - gcc-8-arm-linux-gnueabihf
>         - libc6-dev-armhf-cross
> -      - gcc-powerpc-linux-gnu
> +      - gcc-6-powerpc-linux-gnu
>         - libc6-dev-powerpc-cross
>         - u-boot-tools
>   
> @@ -20,6 +21,10 @@ env:
>       - CCACHE_MAXSIZE=400M
>   
>   install:
> +  - sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800
> +  - sudo update-alternatives --install /usr/bin/aarch64-linux-gnu-gcc aarch64-linux-gnu-gcc /usr/bin/aarch64-linux-gnu-gcc-8 800
> +  - sudo update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcc arm-linux-gnueabihf-gcc /usr/bin/arm-linux-gnueabihf-gcc-8 800
> +  - sudo update-alternatives --install /usr/bin/powerpc-linux-gnu-gcc powerpc-linux-gnu-gcc /usr/bin/powerpc-linux-gnu-gcc-6 800
>     - git clone --depth 1 --branch ${IPIPE_REV} ${IPIPE_KERNEL} ${KDIR}
>   
>   before_script:
> @@ -46,6 +51,8 @@ before_script:
>     - ln -s /usr/bin/ccache ~/ccache/arm-linux-gnueabihf-gcc
>     - ln -s /usr/bin/ccache ~/ccache/powerpc-linux-gnu-gcc
>     - export PATH=~/ccache:$PATH
> +  - ${CROSS_COMPILE}gcc --version
> +
>     - pushd ${KDIR}
>     - make -j $(nproc) ${KERNEL_DEFCONFIG}
>   
> 

Argh, wrong list, ignore.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/38ca40f7-fcde-ceaa-1c91-f4b809a9e0a6%40siemens.com.
