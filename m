Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4M2T2CQMGQES7B3IGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0AA38C50E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:37:38 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id r15-20020a2eb60f0000b02900eddb317c52sf8622062ljn.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:37:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593457; cv=pass;
        d=google.com; s=arc-20160816;
        b=FlRbcdG3bkajAe/UzhlbJSEWMrgeEAPQ4qaVSkkw5NiNI+Cgn/CeuFHzl+dA8vVMXp
         p7CkEQ5OVFSinsmxuSV26h06NlbCP08X6/Yj8/7kHbYfn/ijvVLqKR2QJyBZVj4ffhuo
         6Q5r+oVr5G53HUZEyu/JVYZd0980JlSoBAhZ2qA0EX81QcYUIfumE/ord6txwK0gBNo4
         rLg4w7M6WjmhXaMVDsztgt2DSOOeBmHJQhF/hlNYMmRvDUVczntWA7voSOANvfzdbfve
         dSXS8jWPfyPdED4DQ1sz8Kl0ay0L1zggoGupdJNmhgosnXybWuoZsD9m938hDr85FYAP
         QY3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=QUZBmIauHfzsg8K839TQSSBbZ+6CxfETv7M/QSJ9ySQ=;
        b=uL8AJKtZuKNj7kKrj3ue0+QJiI3DyOBRIHOHx015K0x8Wa7mAZD35S6pEeGUPAdsa2
         QerZBEH+cM1Gbo+u8+SDP5VzkMtvtew6NRabxwBHaq5iAxUqOf61icm1AqYTBwkVZMSu
         SpWD9yBYq65Z1Too1R1Gikv+cGAE2CZZPebxjz2XHDJv5T90UhbniVjct1oezV60XviF
         IUKpLaE/frXzXo6BLVvIoF9LyHJCfNffeaSd8n57Iwz95F3wDXTboOFfzuZj26nZYBDN
         AynTucFxskJB0OFReNdrpuECOIvUnBPZHzzBR3u2X/iCclHwbGZSzwNhgnifs2jU2zBR
         p+3g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QUZBmIauHfzsg8K839TQSSBbZ+6CxfETv7M/QSJ9ySQ=;
        b=IbRbN245i7ziiwNKWdfkbMAklPmWQff6xCyGGON7hHE/a4W/xxwhPwxwUPzz3Hsko/
         Tyvui8MJNP5F8QkNsj+EUQ463nW50iK/s9I2o67n94QSWVJkKbDUwXf8NlIh5AN+Vtwc
         t+iFtWkCHH0mrgEUB1ztvYXxl+watmnHAi2sAEAAvXDFLlpcZWDBClQ8TeF0Gypcn+yK
         dlWVqFaenpHLHXt37FcF3BFV1T1JuExajTPyU7WGVGVBCzamEU6u1vf1BhE8P7Hz0Va0
         o/6/t1pNjdGvfwinlG56pf9Bk91Vxyk7WmuejNTHY7j5uaL9DH6nsHJYYVf394N2Dda8
         1wCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QUZBmIauHfzsg8K839TQSSBbZ+6CxfETv7M/QSJ9ySQ=;
        b=B/i1DhzbtXYczpuL5vqBdWY6lPwOAs16cUGW1HtXpcOwPl75TAW+VYSe3IVekcCSJP
         xsQy50VDKz8ZNPb3kaZsHCzw7h7eNEm+iNeyV/BZBqgYiSwdJg/+Ta1/r2dknKMPAS8E
         88s05vEL8rTbJTBHIq3WNxN5JnRZJ0qy2K3He8NdILFGLcWI2rR7bvzJ/pDfLYdJQc/m
         xnHYg6MobYNpKe8gTrGYgTwOsYK0MhJMaZ3F/mJpbpwCzzwba7j5XMFlBacsf7OLPqWr
         FF5VZsxdv2mYLZ+ZfGndHYjRVw7qLZdxQCmqd5QUjQ/eV6BHbifgMrxcR6nncum5JMQx
         WwFg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5336r272c1QaGm7SbERZ6Mbf4ooDasObJcvMBCR3fIO7n1Yotr6z
	BTjgwOHhDMWrDUjdXlRXXrE=
X-Google-Smtp-Source: ABdhPJyHU0t/zXIWNV0Dfik6s2OSWYvFBD9ha/tgopmLkZMjSnk4SUMCNbPNSwG89Y32nvNho7Rv9Q==
X-Received: by 2002:ac2:424f:: with SMTP id m15mr1702866lfl.223.1621593457589;
        Fri, 21 May 2021 03:37:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f94:: with SMTP id x20ls323965lfa.0.gmail; Fri, 21
 May 2021 03:37:36 -0700 (PDT)
X-Received: by 2002:ac2:4246:: with SMTP id m6mr1808385lfl.611.1621593456453;
        Fri, 21 May 2021 03:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593456; cv=none;
        d=google.com; s=arc-20160816;
        b=n35lBuk2MWCW02POQseGdX1BwGBVoiJBGcn4oYICiiK1JbUGCYeIasOeIdnqYlzsQJ
         NkX0X5/QKaCXAfnkzXXdMJl7NcfQOE2DXSc1Am/WU9DKYNhcE0tOBO/cKEXis59oWAkL
         RIQq7U8JkUugqkyM7co79oeQ1+i9E6VTCi9EtobLV0mXOJdqkXsyR7fzwYz5IHaibH1f
         Oct4NVQByVF928tbkJl2Cfet8LtzFad3EChkQF+keywCuuJmjWAHLwv3dezisWQEe2pT
         JV/jUbDyfGL7DlllXU1L8XeP6sN1YIqJVv4EDQQXG1CI7CoCrgRBniTNPcvBEHJc+2Se
         Nu3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=lVERJigMiO+NC/NMmhDyzYYvTfAQElb4l4m4YvNARIo=;
        b=KGZkOE+ok/RvqGHZy3VIqDZJS2cbFWHxPEGR84r8Awl+CTRFnRUcR5YWi3bUPWlT8t
         8nOAiDqg7x18JzovgrXZxbWKuiHoCnFqMdh1oIylG/viqQxZiX8eOlalKGqrYXF+SeJ2
         /TlwKKef32IzpZ8nteRxfNA8oxj7ElINaKQwUoeeUp588NkDuOhNnHIfWfxgZtBR+VXE
         iHK4Cfv9DY4aeGDaHNZKo7P+tglKBz/AqNis4aRnMX0yuq340kmM3N7j2MNhJsNpVcMO
         1wXCU1NvS9jOmjJiQXyw8aqHff5itEFPn5rCIE/M3YV4gBjmb+TUG6zRuWXtCz1T9ul4
         NVsg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id j7si328432ljc.6.2021.05.21.03.37.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:37:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAbZqN017864
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:35 +0200
Received: from [167.87.240.49] ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAQg5g023459;
	Fri, 21 May 2021 12:26:42 +0200
Subject: Re: [jailhouse-images][PATCH 2/4] Update jailhouse-demo distro from
 Debian 10 to 11
To: Florian Bezdeka <florian.bezdeka@siemens.com>,
        jailhouse-dev@googlegroups.com
Cc: henning.schild@siemens.com
References: <20210521080646.488836-1-florian.bezdeka@siemens.com>
 <20210521080646.488836-3-florian.bezdeka@siemens.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <71a16866-90de-4580-5a71-cc6d384e677c@siemens.com>
Date: Fri, 21 May 2021 12:26:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521080646.488836-3-florian.bezdeka@siemens.com>
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
> Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
> ---
>  conf/distro/jailhouse-demo.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/distro/jailhouse-demo.conf b/conf/distro/jailhouse-demo.conf
> index 5b0fb54..6f2c021 100644
> --- a/conf/distro/jailhouse-demo.conf
> +++ b/conf/distro/jailhouse-demo.conf
> @@ -9,9 +9,9 @@
>  # SPDX-License-Identifier: MIT
>  #
>  
> -require conf/distro/debian-buster.conf
> +require conf/distro/debian-bullseye.conf
>  
> -DISTRO_APT_SOURCES = "conf/distro/debian-buster.list"
> +DISTRO_APT_SOURCES = "conf/distro/debian-bullseye.list"
>  
>  KERNEL_NAME ?= "jailhouse"
>  
> 

As bullseye is not yet released, how about making this an option for now?

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/71a16866-90de-4580-5a71-cc6d384e677c%40siemens.com.
