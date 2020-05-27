Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTHHXH3AKGQEWRVTZNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id A02F61E4534
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 16:06:05 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id a26sf6011240ljn.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 07:06:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590588365; cv=pass;
        d=google.com; s=arc-20160816;
        b=HsvoyHcUa1/50ijv55t8Zuo56R5ON/xAcXa/sxFtVa9aw2XFGmYpB/d4/3JPO6o1Q0
         bwdIugzE+bKZo3uuqgLKdDlbKEglBGuokCLndXDyKjfBgoNPTZ15QIkL2pz52dUZGq2m
         HIhVK1HrDmi2+IzPjawMm4xyJb2Ww9ZWEVkpT4yW7LrYtS2L7euuo06GeoDWgY8fza7L
         mFjnddqT7n0UQCleMlx1IigPAIVwdYjd3OBVU7rk0MBCbRDvb+Xp3cQzM0MgHNIE0kBT
         yB+74zfVsKgEZ/JpTv631rCPN3Ya8PG1eb2/MksZxWY9rCQ4k0Hk8hbXYp9TmQKfEE+p
         aOjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=ekvQQVbSC3V9Nb3pkkZ7Xj/PBdxxl0uoxJPJJ/O95Zw=;
        b=vtyyf5K9VvizRtdCc7Joi5b+QnU2tPdMDeplExkF6Yg42BbZR0QaX8tzNTpdqTWAiH
         YeyRDeWlSgNXl9YXm51UDGRQ+wV+3WYLzKQK3OrCybRaTquWCx48y5NpR4UTMRN1G6AD
         cYUXprDjk4hwSCQNMgavLMgaapN9YlBNr+JzUvIE0NHY6Oov+sipT9/TD24bm4Kn1dxr
         VKseSXKfSnK+D7Ru0syHtR2YoMdmZl8qypjGyJi7lG+GD0Ys43malzjBCpsCKo9/S1wu
         g7raDcHqSFrykC/f0zxbZnPmXPsf3J/L5yBPP8D0UBXFrbaf+F0AKEOaPvIMrIH7g67f
         INVQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ekvQQVbSC3V9Nb3pkkZ7Xj/PBdxxl0uoxJPJJ/O95Zw=;
        b=jmpwwNYbTfm8M2U/8WNdgAE3uAp+b/nUH+2DENf/2VbjsDTsDsRc3apfk26kPSg+aE
         xJft8gAzfSuUIgkKqBa5zi1jBC2rGMVQGOdR7OnaJ7qSit+rZShl76YaR99gK4rY3w2V
         nVYbsm9oq/7By7simsHddO4rpqHxIklIM2QXO3nfo9ln6kCNY9w6P0S9M9Tb4ob1cox1
         cZ/N3uEcQGOXe8nWkIxQakx5KclvrqaD926co4UJNaLmeQNPoHACAxwFsoAZV8Qlt19h
         5g2CjNwkpNyvMxPw2IG9/cG74vVic6aDpTupd96GP6xgP/MUTkdp1cgJsFpMxt63wYyt
         dQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ekvQQVbSC3V9Nb3pkkZ7Xj/PBdxxl0uoxJPJJ/O95Zw=;
        b=AhpQ0QBVA7M3vmrDB+AnCjuf39CctTucAaqUXLy8vqMe8wWyCJftjI0TlF3gKJTJOp
         s/65na/GFC/VTlnPSNczqV9zUhY0ODEYZCq2SCL4dVZN3ZIRE5L9tLQ6Uy6L789tO4iV
         YMJD8yokqJUNZYBGV6QB1RoBCU6voPJHZIbFLuJAKC3wnn/ISxPjCkbSM81lRElnKt5A
         E3qnCTd7VhImRMij/L/cTfcX2LRSqfsM3Mf+5Fc3Jo5IDvhTuG9s6zxxGAROlLivWG60
         /RKBSLu304dqeF/nnjOl7DBx+4d0lEFDC0vewGKme+B/2pAYycr7pVPT9Og23T54KtFu
         1QeQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530OIZB0uObvGgoKnIYay67yLwO7jJl2S5Cgi7yEIxarlI250nzH
	4aFzQF7DRsqHfMS1m2fdE4M=
X-Google-Smtp-Source: ABdhPJxZEd/zVijokOp/LrZ2qe/RvviybLAHhkl51m9A39OqYvmJmFUX6Y9t/vg2XMJngURxS2erlA==
X-Received: by 2002:a05:651c:201e:: with SMTP id s30mr3154501ljo.131.1590588365107;
        Wed, 27 May 2020 07:06:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9758:: with SMTP id f24ls2912330ljj.7.gmail; Wed, 27 May
 2020 07:06:04 -0700 (PDT)
X-Received: by 2002:a05:651c:48f:: with SMTP id s15mr3329324ljc.465.1590588364223;
        Wed, 27 May 2020 07:06:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590588364; cv=none;
        d=google.com; s=arc-20160816;
        b=fX4P+r5QjukkEf+yKkIDLDGyOrW6Vh1UlPLleS9eP83ujga5kJexK/PUq6ZjKp6fPa
         EcarI4h6aTYufdcmFlzmSK1dlrlbTJLBU+Jy6FRmHPZ6UgAcrI4jRhIsZcoKJPcq6YxU
         J3Pxi5DmJbvD7wCOicmwx+oK5INYrFd0C2P3JT3GhnWh7/+5PkUUkDTaGGWBHyP1A+KE
         HS8lfMSo/1BW3N9SHlmXPS/TT9zUNO/t30PycawoWJJwXOFKIoiNH5OcjEFD+EPP9PBq
         CwAIOUnyfxn+dXHWlkPPUy0syZiv8JTSYxqh1fIZGOXUSlPRhp3yWYWZlOiH3iwIjILW
         GnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=pMYQu+jnpWKyOC3HlgscyTq73EwLarktu/V5A9gZsD8=;
        b=pyjw/mDKLn0FzS8gZ5sgq7kgjgkrr1u1YoerSGFh05dBCfVT67mNuMgcPMtaXBLXDq
         WPWj7r551dFocRPGzS1l8HIN8pHfy0lDToCDXKPgniRUizs+UZM0XHEh9KW0P8caqGzY
         zMD9cHt942gb6l5cXab2M7mnA5I8kL9RJtM1tRuX7kO68UB1tf1O7A2Tg38yYNhtoGZz
         1RVJ4HLmTZL84lWpl6oJ/H3jA+Wyf6HxXx0rGPZeQdVrdQcSBA719mVyef1+90zaeQKC
         spUnmAqr77TAa0ADz8iOxURU82Ao+U2It9n4Ss3GLymb+GVNnzMCm09PDmtAesO2wrC2
         P7zw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id e7si176437ljo.2.2020.05.27.07.06.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 07:06:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 04RE63UY024627
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 May 2020 16:06:03 +0200
Received: from [167.87.6.205] ([167.87.6.205])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04RE62Hh023890;
	Wed, 27 May 2020 16:06:02 +0200
Subject: Re: [PATCH v1 5/5] configs: arm64: k3-j721e-evm: Fix failure with
 PCIe
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com, kishon@ti.com
References: <20200527122358.14723-1-nikhil.nd@ti.com>
 <20200527122358.14723-6-nikhil.nd@ti.com>
 <0134f1de-2f2c-416f-67cf-cc20494de4a9@siemens.com>
 <c57f24ac-80ed-92ba-ec9f-69a53908076b@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d1a436df-e7c0-5718-6ef9-92424263a035@siemens.com>
Date: Wed, 27 May 2020 16:06:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c57f24ac-80ed-92ba-ec9f-69a53908076b@ti.com>
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

On 27.05.20 15:46, Nikhil Devshatwar wrote:
> 
> 
> On 27/05/20 7:01 pm, Jan Kiszka wrote:
>> On 27.05.20 14:23, nikhil.nd@ti.com wrote:
>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>
>>> PCI kernel framework requires that all the instances in the
>>> device tree either specify the PCIe domain or none does.
>>>
>>> Currently, Jailhouse dynamic overlay describes the PCI domain
>>> which causes problems because root cell DTS does not describe
>>> this.
>>>
>>> Fix this by not specifying the domain in root cell config.
>>> Also, fix the size of the PCI target region to match with the
>>> correct description in TRM.
>>>
>>
>> Please rather patch your DTs to use the domain ID (upstream). This here
>> means that you will get a new domain ID on every Jailhouse start.
> 
> +Kishon,
> 
> Can you please let me know why are we not using hard coded domains for
> PCIe device for J721e?

Something like this:

https://github.com/siemens/linux/commit/764a3a5da899b596474edf916b44dfc034443445
https://github.com/siemens/linux/commit/1f916502347d2b902002b430cffe18b11685f211

Honestly, I was too lazy so far to push that upstream as well.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d1a436df-e7c0-5718-6ef9-92424263a035%40siemens.com.
