Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBE6BR6AQMGQEJ5PZXEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id A366B31680F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Feb 2021 14:33:08 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id s18sf1814735wrf.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Feb 2021 05:33:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612963988; cv=pass;
        d=google.com; s=arc-20160816;
        b=SioJ3gDVvhT3Tf08igbHdQuUYrfKBwJmvNrvfNm3e4YuOBNO4GpqeW7NY4KsA2N9vk
         gjv3dtefjlZp9oK+KeXzBc7WnP6Fz+eA+6dRplKGPgA5aKVDI9WcgnPMM+JYSgYnIHoM
         SjHZpeRyb7VgMF7g5HmW1wwFGyi7n2I+tgH86ZIK3X2nwrh4YZi7ZkKE1mBWrlxZUJHY
         JmW6nH4DAVgu7FZ0B/upKsRt9T2jqvmlXrMioBZuDrE78dNCwOlNiVFG7GD0GE+XVVy+
         i24r9CIiXzuxSLs7mGtVdk/m9OSiUhIxxdCWUmqZdjV8lGxLZ5QaS72VQrIlFP9l4cCi
         g8fQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=gfESK3ROZSG71vAhIUofXsjRAQ/9zQOixnPHF1L6T0s=;
        b=0m5ELF1ZxqFZhVYlCxiXINONDF94fd4C6s2bj8JYQSjY1oUl1se7sjpWL4v5AVgso+
         oALArL/A7zIM3yvgRnDjB1o8sTKnOutHzjaY5WF8k82ojnFPfcRoRxaAjEgYxlPU7nCt
         oQjWDiniJjxMtAIcJf3mZwzVGQatE5R2k2/6E4mJeXONZ30g4Qhf2nyTHBpXbrX6ZUWc
         3b6/jtGRvx/L8L4I6tCXTTa1WYvaU5JWE0v/MzcLFG4hw6b6r0LXoKXLIoVVrEKx2qSO
         TMN2be2GupIOCormeaWhmrmjoh+umQMgjJW+o9N862U9Yt0lH1vYQz5Vj9sOL/QSLGrz
         O7kw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gfESK3ROZSG71vAhIUofXsjRAQ/9zQOixnPHF1L6T0s=;
        b=STr9kO/3FSJGjolgx18O85jAxnB6CWd1225w6Iso3AkqpPAGmaFm3Cmw9Hi08Gll+2
         qPJ8XKNkU+pX1PNgWK+gFA81zrC7piIRvzkLNa3zEUclnrxjiMdyXRAX5Ehia9Js5VCn
         qs+G3hdVq0bPr5M5cTlzlxMn9E581T+HhAdDV8MeZuz55z5rA4IqAiDTeCaIk8XKmBqP
         zGopL1CRv/r00d7WVe9lwqsHPGAB5lcs46JQBYOGzcxOW9K/KPvOW/STbtG0QvrSsMMp
         HAFvfGH2qXajTwxvWcSbF4qIIWoQ8fW1YGfwZHhVz0spfIKFbCduruIXwCmEkBtOwITL
         DZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=gfESK3ROZSG71vAhIUofXsjRAQ/9zQOixnPHF1L6T0s=;
        b=e9ftkTl6TQ3F4Gm6OlC3LNmC2Ieqrj/glwiuTmLhuK12NNlswhbCUb65pW6kjBrQ1w
         +Jh9Kka8OMkpkh6DxTepEF8rprKHVzYi+pfGvMaFpPFQtf/r2f6zGguNLg99gm6cGFfE
         2ZeQUZQ7PlNenld8P2B0t5OR1eKtJ2ehmHeSF0LwBvEfNu/WWLxdDoqc3sRUybGpJbwv
         xHh3mDwO1bbiG18FPTnB9jMBbGUJXZNKYpKA8wMJ6OTMFg8JzQ0+bQSrBimSyK2yUF7g
         62vctutlQA1EYvaMH9bFFnZYfmAgVwV19GpUSaA5yG8/8maHeOgteDJ3GDbyJ6ALjcOb
         viog==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531YIGKTPB+n5N2q0R95a/qCETvDkJcFxmljC+RX4xZNomSEEXwo
	XTvgXmn6ig0s+hJ5dVNZgBg=
X-Google-Smtp-Source: ABdhPJxJv6cc92MhaLQpB/3SWaBayhwC4WzOS3fRggF9k9h9Bcg2xZiF9Ug4p84K+XPkHgCTplVtAw==
X-Received: by 2002:a05:600c:4a09:: with SMTP id c9mr2978271wmp.91.1612963988236;
        Wed, 10 Feb 2021 05:33:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d02:: with SMTP id z2ls2664363wrt.3.gmail; Wed, 10 Feb
 2021 05:33:07 -0800 (PST)
X-Received: by 2002:adf:8bd2:: with SMTP id w18mr3773962wra.204.1612963987154;
        Wed, 10 Feb 2021 05:33:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612963987; cv=none;
        d=google.com; s=arc-20160816;
        b=LjoofPE7PzkypKAN212poYPCuRuMPZRvaN+1pwxDRiTjAZD5gOMhBBzui9BGy3hk/2
         hFeFC3XA6Wk4lfdDEF4KIeMqr0/ZcIM97WCt+UvyM8zUWzUxK4ioI/kmGPfbtLKnbJ7+
         a3MsaiSEGfTWWz8kHesAF9ifFWfmcmjkIEEBlS2QgLyZ9W2yx2DPmsyHRJ/4xqU8HA9L
         MDCcBuXa1FTNXYv9nqJetWREj2vt1qr/lGWG6gcd1vThNFpHeb0rtAECLlq8SnuJkNvJ
         QnjYMjjso5vy7pW0YclWqVWrFovT2jqDDMlMomPHNTZleRQERCqw2CcuzyYbgSi8CyHI
         wcMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=0EbaeJ/JSjGM1Wdp1vGNLzsACyiLSuGKMPqzTvoqhdA=;
        b=fESevNXwEcSZ1rdkDYSe1CxpG07OCHOnBGUEkI1M6zR7XoT4BGyGNDBT1IldP6qYXi
         QVCrs/V7n55lhaIvGnmGE7RlAXOJOR5dc0EJt1ObyRGaP9ppOwpxog3PyEAuqHb9TUzJ
         czLYlT2VOOG1B218qFQq+rW7rD0pFtGhChlTAr4YIHdErKKHq+uERHvv4S8BiOKbEb8P
         wA5tFNmlzZOQUr78Dnj4NC7Ex300a9FXxLt71a5yejUXjBaYTUylO+kJkhkfVT85cAT/
         jwd1mZes1dtkT/+aQZvnCOa0v3qyb8PGJhDA1WVySCQdM1UQEChhAnSQiZkam1fttNfi
         PJ3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id u65si39417wme.1.2021.02.10.05.33.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Feb 2021 05:33:07 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 11ADX6Bp005332
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Feb 2021 14:33:06 +0100
Received: from [167.87.76.191] ([167.87.76.191])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 11ADX6dZ023862;
	Wed, 10 Feb 2021 14:33:06 +0100
Subject: Re: Overflow in MMIO registration
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Sainz Markel <Msainz@ikerlan.es>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AM0PR03MB4450A4AD70FFBBA0D726D521B68F9@AM0PR03MB4450.eurprd03.prod.outlook.com>
 <290f756e-4a93-46f8-0eb6-a15206bdc1d7@siemens.com>
 <AM0PR03MB44507C4040BE5E902027D833B68D9@AM0PR03MB4450.eurprd03.prod.outlook.com>
 <c3dbe31c-29f2-af62-d2d6-9f7d47e8381b@siemens.com>
Message-ID: <c429c272-3ae2-cdaa-6b0a-96f5bbbe6c1c@siemens.com>
Date: Wed, 10 Feb 2021 14:33:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c3dbe31c-29f2-af62-d2d6-9f7d47e8381b@siemens.com>
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

On 10.02.21 14:31, Jan Kiszka wrote:
> On 10.02.21 12:15, Sainz Markel wrote:
>> On 08.02.21 12:24, Kizska Jan wrote:
>>
>>> Something may have caused a subpage MMIO region to be created (page-unaligned memory region). If that region split-up didn't exist in the root cell already, things will fail. But I suspect that subpage is rather a symptom, not the >cause.
>>
>>> Where there any compiler warnings when building the config? I would also recommend checking our configs via "jailhouse config check root.cell cell1.cell cell2.cell ...". Or share what you created.
>>
>>> Jan
>>
>>> --
>>> Siemens AG, T RDA IOT
>>> Corporate Competence Center Embedded Linux
>>
>> There are no warning during compilation and jailhouse config check command says it is everything correct. 
>>
>> #jailhouse config check sysconfig.cell core1-cell.cell core2-cell.cell core3-cell.cell core4-cell.cell core5-cell.cell 
>>   Reading configuration set:
>>   Root cell:     RootCell (sysconfig.cell)
>>   Non-root cell: core1-cell (core1-cell.cell)
>>   Non-root cell: core2-cell (core2-cell.cell)
>>   Non-root cell: core3-cell (core3-cell.cell)
>>   Non-root cell: core4-cell (core4-cell.cell)
>>   Non-root cell: core5-cell (core5-cell.cell)
>> Overlapping memory regions inside cell: None
>> Overlapping memory regions with hypervisor: None
>> Missing PCI MMCONFIG interceptions: None
>> Missing IOMMU interceptions: None
>> Missing resource interceptions for architecture x86: None
>>
>> Attached to the mail the cell files I'm using. The .bin file is the same as for apic-demo.
>>
> 
> Just looking at core1-cell.c reveals that you are neither aligning on
> physical page boundaries for the base nor using page-aligned sizes. So
> it is like I predicted. And it is NOT a simple copy of apic-demo.c.
> 

...and we should likely enhance jailhouse-config-check to catch also
this case.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c429c272-3ae2-cdaa-6b0a-96f5bbbe6c1c%40siemens.com.
