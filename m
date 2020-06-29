Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB25U473QKGQECNYFHYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 6035A20CE73
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 14:11:24 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id o12sf16390813wrj.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 05:11:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593432684; cv=pass;
        d=google.com; s=arc-20160816;
        b=xBxaIpruP8P65SCPXVZgLXCfOIZBQxM+I15EnEEiYB2H0Ooo75xbZ0KUrhzgurR8Qv
         AIgceGygL+fokcgHZX78u1vzzPoLe+SYFLuHx5RFeCcz/aiw053rlc/Qo2/aD3g5OsyX
         w5vphpdBwzG65NToabEIvnnyTZRpnU5qeL1OGqL5Udqcx7dmNygMVddy7OxdBAEcul3q
         xX1AOHrrqOOSEez03vrywfgTB/PwIQ/IkA6zNOezCohEYvEfVxeIhI53zj9QRL0Ubiw1
         cP4rl8JZdE/5Li3yrBKWfHPKEq0GvNpegWKn72XQDQbdeT825++T3VGr5NZiOxCHs89B
         sx9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=ul83wxxymgzgG8VWFjSNIQohoTJaz9RghijPsQ+RSwc=;
        b=foFzbX+haP3viKVCdFuMEZXuvnUDzfuCn+N/+zs3MUk2m8pWbKcsmm+os9hs3ui7QG
         ukxA8a6ubyY/56El7zCf5RrOUkQQPFLXSeFYVWf4ttApQ1MRMDw4B+H64McclhcK0NMp
         PvXR9fOTFo7G35ZOAxpwVWI9xmDlb6Tq6gV26kNfaIBF2bFvq04hrS8PeBwRHR7M4fAy
         5WPqcR6JXjrI6iqrh0wyjyl5hOLo2Boh+izLB6cC9BcNyqjAIzvuU5ZDKXMSr0tz2930
         LX327HCBmXrEhnLiQq5MkWZdC4+dKg75cfDyJ8JyOkUOAa0cv6sjxRaUO5BTqyukUJ1M
         lh1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ul83wxxymgzgG8VWFjSNIQohoTJaz9RghijPsQ+RSwc=;
        b=AT2p6zgdNO4GYNPnSrWCFe3WF7lsDHEb/M/sEmRT8Wx6BZ58NuZ7CnRD1xcfjcKmrd
         E7IVuH0iuUp724p+LEozbw/KFGu3bXHmtSjnWPXrz3pdKyuy+YpnejRGdIUbwYih10lV
         UFYPaWa5gE1nhwEpR/FzK3mjLcjXWzb7RGB0g04gvgRyiyhfgYa/P8fGGl4kGl6T3cbF
         Lg70r3zFlPfAISdDDAXdJIK3ptYLpFPenG5U4bplb8vYGUkuzD0Wztt6ujeiFzuD2UYg
         X15hvBkbr97qsQgyaxbHudyeKFiq5t9ZjM6AL+LgjA5f7c6hmL+UJhw2Ucn4Y/PBm6hh
         /N/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ul83wxxymgzgG8VWFjSNIQohoTJaz9RghijPsQ+RSwc=;
        b=EfPHQcLfSaJA7Zr/LDTm/hMsli86QxsNebN/vCSz+nIILho29+nKZwtVl76PhnjYJz
         f+u3BjCuY5WNLjbUitnExBOBPFMUl6dkUzl9T5g/Gguyx/ZWfHejZ+axewnj+4BmKTza
         M0BFV3Jpp24lCuWGq0953igwSZ2AxhboRO+fFerNrIPzvzBE1shhhOQW0ZRk85r64q2C
         M1asxqu+g0LS9fEORP2T93/5VOt8pkr87/UUx4YXQGt4fa1R+G79/f2aK/EzXAF0E3Nj
         D81Ob0qK3Q7PbUPNV6mym84n32GYTlmH/z5mEzjLs78JPY+UXp9BiQ9Rox+3gYcs0xBm
         +whg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530oGWjYzQdQqEivb88rhVdQJFTzdHwVtvq/6mp1ZY2H9Uup75CA
	5bLCumSZN2T3Rrg6nxiXt6E=
X-Google-Smtp-Source: ABdhPJyNfLneSBjrYLTloPC4njIdLe3ZluMiTbm+18CdaT5fB0RElHbjjpHefsywQSR3ihbC5ISMPw==
X-Received: by 2002:a1c:99c2:: with SMTP id b185mr17531769wme.52.1593432684011;
        Mon, 29 Jun 2020 05:11:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82ca:: with SMTP id 68ls7054629wrc.2.gmail; Mon, 29 Jun
 2020 05:11:23 -0700 (PDT)
X-Received: by 2002:a5d:470b:: with SMTP id y11mr17405310wrq.101.1593432683230;
        Mon, 29 Jun 2020 05:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593432683; cv=none;
        d=google.com; s=arc-20160816;
        b=XHauFHZK6SoPgJ5gDeiB5BixT/JA1Rzjxt4h0VJCPbUxY0yChqL3JEbKSISvNS0OGG
         cbgnqMq3PHciEA1IN9d5KAiUlMtUGZrCdt29kuWZWofJ/wS4rx1Eb4Wup6EFD269z2pM
         0bdrgrpw9zlQIGGPn1gqPqcrWvDX95glAPjs6lk4AnlTqKfgQALO5OkfNtVtkctubsNx
         j2NYmKh/OFOvthyo94diJrsWDXm54Llb1ta5kJEpSdyeBn0zn8llIwJQ/pjyQSEjIA+w
         aSYFaR+WLNs3W8lWnJgVl88mJpDz5ezVkb3bZIrB1HiyetWHnZclKj0cxXXOFYszmC/n
         JmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=GayZtJ/4qngorX5At4RzV7XhNGiRtRIK3auzA+NpplI=;
        b=i/ISliwEilFX72bC+EJT6JqaoYW9fRmVyB/acWMZR4S4a9zC6AB/YXPPH10OD7GEdr
         UWdz38CrQpwkcMNrzYF+WLRJhT1gZxS34jl7PcQkvAloHbIbCZmb7KqJyaDZpxQTaGhp
         Jfz6yz1JJKs3dwkpLlgQrKM0UWx5P8rgRLV0OWeWSk+//1T6V6Gtc9Ycw3X3/u14GkTR
         J4ZiqdMus1UBWRFDl2Oi9avDcJfQ8j0TeQJPn2KGNScoalI/aV56dk5cIzXJwdSeKSY7
         CN6Liyd18HJS90qakrLD7u/5zy1uuenpwkuQG38qoN/2GCNan9ixY2IGufpWR9YrrNzi
         xM/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id t16si957507wri.3.2020.06.29.05.11.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 05:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 05TCBMKf005271
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jun 2020 14:11:22 +0200
Received: from [167.87.50.192] ([167.87.50.192])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05TCBLuc010044;
	Mon, 29 Jun 2020 14:11:22 +0200
Subject: Re: [PATCH] README: drop the warning
To: Lokesh Vutla <lokeshvutla@ti.com>, peng.fan@nxp.com,
        jailhouse-dev@googlegroups.com
Cc: alice.guo@nxp.com
References: <20200629072439.29835-1-peng.fan@nxp.com>
 <b40f15a4-7eb7-0eae-8ce5-bc2169d47ca9@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <bc7cc28a-75c6-652a-6dd4-fb587a242868@siemens.com>
Date: Mon, 29 Jun 2020 14:11:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <b40f15a4-7eb7-0eae-8ce5-bc2169d47ca9@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 29.06.20 13:46, Lokesh Vutla wrote:
> 
> 
> On 29/06/20 12:54 pm, peng.fan@nxp.com wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> Jailhouse has been chosen by Semiconductor Companies(TI, NXP)
>> in regular software releases. And it has also been deployed
>> in real products.
>>
>> So let's mark jailhouse product ready,  drop the warning that
>> make people scared to use Jailhouse Hypervisor.
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> 
> May be 1.0 should be tagged :) Not sure what Jan's plan is.
> 
> Thanks and regards,
> Lokesh
> 

The warning can indeed be dropped (will merge), but 1.0 is still another 
step, though we are fairly close.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bc7cc28a-75c6-652a-6dd4-fb587a242868%40siemens.com.
