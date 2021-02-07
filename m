Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYH472AAMGQE3VWIGZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B1731236B
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Feb 2021 11:18:09 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id o8sf8338594ljp.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Feb 2021 02:18:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612693088; cv=pass;
        d=google.com; s=arc-20160816;
        b=iayzolkeYLNA4ugC7SSdsFAY5+7xKpEsOjN6WF9UK3cfQe04QI4f2w9F87AbZZUYzW
         CEUUcm8/1wqChhwTyFhnCohVcdcDo6njthDtE8o+nfn1AESXvHUoCFDNvsQwlHLaQacc
         dkbW+EMB9Kr5LUwsVrghvAFRXcvRSv91yO6TmanNcXjSTS13ppUZFXpnNTsR6dtF9ee7
         8jppzEiMLTDsknEtxzKbBnkA//Wt12WiX+EL6lSfm19mcxzU2+8xlx2uHiqt8jVIJn/B
         CvV0JX5mfy5SM0N0qu3O/U0rAU064Z1szS4c9W9UdE7z68LkwjW+jZoAqL8CnPTPd8S+
         cMyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=90nzAdIyhw7gdRNXToKNGQ9vkNnk5zU17eTQpzs3I5c=;
        b=xJkPaJaULdKMm9sIx6QUf7JPFbYaVNDznPZ7EUapjKTpDSybDfUsYUHXjKwTcjmRuJ
         67/H/KB6KbjX/7L8H7uOlDhOR1K/vaJoGLtjrR+e36f4UchoQsl/QjqACH661U3LDwxn
         RVCN2OEg5LlkxPzYKdNGgmCMEC5qgk1hsmiu7Xf5UL2kTW33GUjDsiH1c6+ztdvT7QCM
         A8dLDoavfadSifG7RXMtl5wKFKZZdClBdf9huLk5YfKNDMIfgfutxa8mIU6KIt7JcKQK
         knDOlbOsO3cnpqIKpn1XmNh7O0NKeLrd0BuYtmNhRhq0/+HbdjE3FfNUMrUVQwUEtIYD
         v0mg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=90nzAdIyhw7gdRNXToKNGQ9vkNnk5zU17eTQpzs3I5c=;
        b=cSp6AmV/uj+7zMMAbJZfAC/iY4lJlgNJ9+RyGiip8/Qi5REvlMuc/fsrK68wLVjtBV
         MtikGTUpVr5r5MqguSVLLGj0LvpmmmxNGMfSEiXTzLMbGzNySSPyKEwFL9kgdbyCeEyS
         azReJbOiHxAW7BVVas6uBgZ+O7DYPRxbGgZMNmk6WpGFBwi0bzNRHQQQgL5otONwzryO
         0c7VwfmAWG1eyOhxF7sLl2gAFaZeSJ1NNum0tlEyMWa7xUYoCumHOxlvSq5ygd62WRx2
         y634fU6QI8O2AY4sCsT/aoteCGrC5e23l8l81z0eyfIeLxkbel0ozbJaLERhj/rLBDAp
         BeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=90nzAdIyhw7gdRNXToKNGQ9vkNnk5zU17eTQpzs3I5c=;
        b=CPhd/CHyAAhUpwj1qlApZJf67CTFU7nR3trry0s3PABIFiWe4BP9w+C0O5asXRwkw5
         T3XFbCl3WHtQp5tZPxn+ExZ+ynLON2dfJEdTcgU6fk7+y+WUJKbrSWbSQROd8BBXE8WK
         3J1q5WnmqOl1Ys2qJNTlbMIMfYFxxwgu02baglhJIj2KKJGn3W/0Yo6ZqyyTS+CgRB8G
         ma/JOZsWvrUQsoYxjQeHXZpMfyD6sbx3AMXbirQSMnQqX194SPiqey6gr/Mnre+uzMV/
         ZX2VXk5izba+8XrYVrLZL6YQX9ebGUcgsWBUBQZ/jKDs3g5d8t9ncjewrno7/5EfZG/C
         Wb4A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532gw1eWAXzGlcJUl3w4SFF8Md6FTEQSzErIJtCE1t0CDNhZT27X
	8RcdRlfr7zvgBSLjdEJSL5M=
X-Google-Smtp-Source: ABdhPJy899Sn4EcORi4a2yceiYtPWI8CQuIUoT05Cn8QAr4YaZ78385lfus+4zIRuvS3sKDehmCLoA==
X-Received: by 2002:a19:ca1b:: with SMTP id a27mr882947lfg.92.1612693088794;
        Sun, 07 Feb 2021 02:18:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3993:: with SMTP id j19ls2121783lfu.3.gmail; Sun,
 07 Feb 2021 02:18:07 -0800 (PST)
X-Received: by 2002:ac2:4c81:: with SMTP id d1mr7406803lfl.611.1612693087693;
        Sun, 07 Feb 2021 02:18:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612693087; cv=none;
        d=google.com; s=arc-20160816;
        b=R1QFJOP11eh8CXVMKElesfiAITTNqFWFLqWH6RarVOpeou+i3MKMWHQC5vpsu4bTTc
         RnG1uLudsFsfJMuWsLs3spbPj6tMZVLsc9PD1RAHj331Vbfl3j+mbdO+P46C1kjRTK+c
         HwfkNcFClzXL4GzdHAsHYlEojQ73ShzjP+xq6NaxL/PaWFT6t+kpdnPHf7l8N4TgPhLK
         kEZdq4j7EXiTTo0Kd9MASqevqKVZ+cgbNdqZkamGfiYhP42iDci5qpi3lLVZTlkOJ5kw
         qRwmN8my/qSTdTo3sB8O8jHnn8mOwvFCVA8ZAvkju4Pb5yf912w8fQjVMLkQ6UrVfoLA
         sucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=YTvcGxUuMOqlZPS5IY8/DQK7Ng77agbdgzOWkAnk8uc=;
        b=cjk4wFG+Xyj2iEwC2URX2nMlaamQUSxAu4IcIjIuXuYFq9t0Q0LywDJ+Xzd/gXVafn
         7kax3wGtbxsqpASPyli8iOr11saDN8MImzhawFGJffJJmK3or2KfjE2daFiE68+7J43Q
         grrxbjG/DT6BDKqBZfRj0EAfMO6Sg/Ok1M324FBPJ2ZGwYpxMPgVmhxP2bsDvbgPyjM4
         BZDry3GMV020r/xR+b30EMpeZqiawUTjB54hbdpxuRenC6XzAttiWGVnHPu2xoYui0aq
         KViFTxqR+rSkwGGzQnonZn2JIFFZYW+ZwsjWwTUshwGCgttBuqA/lICf+s1r4+GyRKKq
         zIIQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id d7si715801ljj.6.2021.02.07.02.18.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Feb 2021 02:18:07 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 117AI37l022452
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 7 Feb 2021 11:18:03 +0100
Received: from [139.22.33.193] ([139.22.33.193])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 117AI2ai016017;
	Sun, 7 Feb 2021 11:18:02 +0100
Subject: Re: [PATCH v1 06/23] hypervisor: protect inclusion of control.h
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
 <20210125120044.56794-7-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <30e9107a-8b99-c9c8-ae90-df39157a66e2@siemens.com>
Date: Sun, 7 Feb 2021 11:18:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210125120044.56794-7-andrea.bastoni@tum.de>
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

On 25.01.21 13:00, Andrea Bastoni wrote:
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/include/jailhouse/control.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
> index 76eb0428..2ac7e2dd 100644
> --- a/hypervisor/include/jailhouse/control.h
> +++ b/hypervisor/include/jailhouse/control.h
> @@ -9,6 +9,8 @@
>   * This work is licensed under the terms of the GNU GPL, version 2.  See
>   * the COPYING file in the top-level directory.
>   */
> +#ifndef _JAILHOUSE_CONTROL_H
> +#define _JAILHOUSE_CONTROL_H
>  
>  #include <jailhouse/bitops.h>
>  #include <jailhouse/percpu.h>
> @@ -298,3 +300,5 @@ void __attribute__((noreturn)) arch_panic_stop(void);
>  void arch_panic_park(void);
>  
>  /** @} */
> +
> +#endif
> 

I think we could also consider #pragma once, with the same rationals as
in [1].

Jan

[1]
https://groups.google.com/d/msgid/efibootguard-dev/7c654734-df14-4b7c-e5a7-bf68f224c1be%40siemens.com

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/30e9107a-8b99-c9c8-ae90-df39157a66e2%40siemens.com.
