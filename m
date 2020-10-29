Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZHX5H6AKGQE7T6H6HA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8655F29E64D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 09:23:01 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id 202sf246257lfh.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 01:23:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603959781; cv=pass;
        d=google.com; s=arc-20160816;
        b=qoFDZAkcxt4DOpXFWGUwwE/B3UOrmsDD9hwNmoze6K+I6e1/0AzxzG7racP2r8NU4e
         OlbV5HlFdvY02LDvC80oF+W6oZhXnSrIkJ0Bgqcfv3o4h2DfFlEcStHoXR/b2wlXPW91
         2Pkn/kl0OKu0qC1C/ZOl9pCFA972fbus1/G0XgegLIWyLQKaGsBsIvD+P/q0FqC0bC+O
         yuYdi2NDlDDdvR1sllac7Jg/nE4CYvECExFRUCGVpA2w4tH/eZ26Q5gF7OoPtfiBEpTB
         cfqYAhWzYzQs6OfbcV7dwuUET1keQ7ux++pHkSUikLiPSyzaVCwzIlocnmbEG/0VkEW+
         FXsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=IF0NyD/pg5Ds1sdXqtxGEsvrdsGXpvfE911sXlpuAtk=;
        b=sZA3VRgBigSrfOco2bm+NxBfRYvTa6/5v+UtBUHdd+iOllLubdRKja2kA3+QlDBWl4
         qpj+AMagX47F3Es6PPuegtLJ//uarnnLoYhIxB/BW5NlCiUPqyQN52BPTVVn5C51GMR+
         2ALXJetvH7wyZayQTHTQfzxlFMZQU0kXMh7CYKhzCOh9w8JXz6FKeEiNvwqcC4JK51RG
         /NAqu2M8STHfeugtPJHqvVe3OI1FInOFcXhV/VeI6JhrY5S076mtt7VhXITsha4linol
         QbiUS1xpVbCT+NHMhem2NWfwzdHiiBBu1zwrlrYCtTf689uX8EJ4KOVr2nBsCARu9x9v
         HaCQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IF0NyD/pg5Ds1sdXqtxGEsvrdsGXpvfE911sXlpuAtk=;
        b=jNdxsM/gCeeWvxX3Krzvny7hldd09PUekiA5CL3aauLdvwHJ8RyecGviGbSh0dt+tJ
         t4b+uKPhDAMzfEIOCLJHyIQu9xYd1PZMAE5QuqtBgsYwNTA3b1/jqTKWctyFDk0mh0Nv
         X9Zo2QT2ldISC7JyZBEp9qyGpz38CqEShmMpNrPXyK6szwUOCeddIhqwP6BbeL3r2tv0
         01WzfpalNs1hW57I+rWX2aMtkF5ZQnZFy12ua+0gvxiElp7T5RdHj4yhcVD7xWIrhvrq
         /PCJOo6EgMXR57X1XXbqC6Whd5aR4jarRUbrPq57UnDa7GGmeY8VzDueH3EqBF8yAHFJ
         iJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=IF0NyD/pg5Ds1sdXqtxGEsvrdsGXpvfE911sXlpuAtk=;
        b=g+aGkpzZLtVu1qlktwnLeiIE9C5V2UC7HzDPaUG12eXH3AffTY+SKR9+oWbK+sK7G4
         siH386S0S3IIsUsHkB2/0OmZOarWY1cEyAvRXnUfunflgFJupco0SrYl1MwDo+pmOhe+
         vRRwzY9RK4RSbvine2WMigliiKPIh3OoRcZABXNW1WRrWabph1fDbF9e9NJhRz9OAN3L
         aoT4Z5j3jwGyb1quCQLv86P2JMFwMQMeyicYziuHHTB5aMiBokRvNktRKDX9Ze0CaQar
         /bhqs1El/q1WOEDUzDjSUA2XqUekSuZ9+HEi+70+Z5lHS7j3UtafCKx3uZbvgn0hJexf
         OzhQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530EIExQkv6w6ACaaxQsjO0/6X4jUypZkKzy/hckjDObqiUAR/Vp
	fzgAmkUtwffL8uJCK05Cws8=
X-Google-Smtp-Source: ABdhPJyprlMUTJeQ/yiDySUqJWlmQNc0s7LCxj9T8OUdvODkZkt14LlKNhkPhKAdIdF0n7oHn52jbw==
X-Received: by 2002:ac2:508a:: with SMTP id f10mr1214990lfm.559.1603959781065;
        Thu, 29 Oct 2020 01:23:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b5b7:: with SMTP id f23ls371279ljn.2.gmail; Thu, 29 Oct
 2020 01:22:59 -0700 (PDT)
X-Received: by 2002:a2e:a176:: with SMTP id u22mr1367287ljl.159.1603959779697;
        Thu, 29 Oct 2020 01:22:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603959779; cv=none;
        d=google.com; s=arc-20160816;
        b=Ln3VjbJfLVM5tc7TlURREV1sKYE5ex9aBl3lVgzIxcKaO5VtOHeGw/uRf8tTjtc2i9
         jIpTpK2ZinO7et148nSx5ROeTo0l2BmFZFcpBIGN7Y+/aOR7O1XKoUZ0XZZA/h1YWirA
         i5vZHLyUu3LOTZF2hG1CgXK7NqiV6L1Bvs6FkfGThJN3OmYsUJIC2/zkzxv3vy3Bl/9q
         3STKPFVg/N+cdt1VTHACrT4A9dr/KE5WDjSsZsjL5RfREdX8PaNL4MM95R3Yw4UsLdke
         bRWwzN3805eMvkp8nnIbxKt+GSM4A9PMFSbMD2MvgbVSsqMH8o6hhTJajRfW2CBQPXtl
         S3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=sSqXh4VKlzPZw1x96YfQ60Z+MtIP3g3+QFa/xujuIx4=;
        b=HUDhAjOf2KEiDYQnVbV3xofUD+H1RCpMe6ygGkItTeiHfzYvBpjcxf5kDthm1C7Tlz
         u0/+GcA7ERneyaGhNEuTskU9oEtx42LCnOr/YpGVUKoKsc1ISgRImsugBm0sXnpBek3z
         7T7fnLYMROzyH8WrgtVOw4BWeqCbvCwJkKLvYo30PFIfAYhvWE+aaXgYLx18i2hwUP3u
         bLNgkuQ30zHqpY1hWhNHstYW0QlCCh6OZtbm5xY7kzUnVEwvQ2lKHGqtfrY0kT/xUeTO
         t5QSbUIo34vJGjm3dA2OtOjU72h1+8GdyYivKOd0uQQEUWNWbs2LHwOgV1X6tf5+fLij
         cJGg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id i17si61814ljn.4.2020.10.29.01.22.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 01:22:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09T8Mwkb006411
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 29 Oct 2020 09:22:59 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09T8MteI027282
	for <jailhouse-dev@googlegroups.com>; Thu, 29 Oct 2020 09:22:57 +0100
Subject: Re: [jh-images][PATCH] linux-jailhouse: Disable SMMUs in arm64 config
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
References: <3eccff87-8f79-d58d-22ef-7b30ab0f2701@siemens.com>
Message-ID: <878449f1-db14-d94d-3834-580e968edab7@siemens.com>
Date: Thu, 29 Oct 2020 09:22:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3eccff87-8f79-d58d-22ef-7b30ab0f2701@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 29.10.20 07:40, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> This only affects the Ultra96 at this stage but will also be important
> for future boards with SMMU support enabled in Jailhouse.

In fact, it does not yet affect the Ultra96 because the SMMU is still
disabled in the mainline 5.4 DT. May change in the future, so we better
add this already.

Jan

> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  recipes-kernel/linux/files/arm64_defconfig_5.4 | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/recipes-kernel/linux/files/arm64_defconfig_5.4 b/recipes-kernel/linux/files/arm64_defconfig_5.4
> index cfa2da6..8c400db 100644
> --- a/recipes-kernel/linux/files/arm64_defconfig_5.4
> +++ b/recipes-kernel/linux/files/arm64_defconfig_5.4
> @@ -435,8 +435,6 @@ CONFIG_PLATFORM_MHU=y
>  CONFIG_PCC=y
>  CONFIG_BCM2835_MBOX=y
>  CONFIG_BCM_FLEXRM_MBOX=y
> -CONFIG_ARM_SMMU=y
> -CONFIG_ARM_SMMU_V3=y
>  CONFIG_RASPBERRYPI_POWER=y
>  CONFIG_ARCH_R8A7795=y
>  CONFIG_ARCH_R8A7796=y
> 

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/878449f1-db14-d94d-3834-580e968edab7%40siemens.com.
