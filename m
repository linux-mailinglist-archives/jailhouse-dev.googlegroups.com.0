Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXFNYT6AKGQEG2QFA7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8212957D7
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 07:21:33 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id a4sf232013ljb.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 22:21:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603344093; cv=pass;
        d=google.com; s=arc-20160816;
        b=pD5m2eARioZbm7RIfepuo7nQjc1iN2KDPgLzMDV+a8bEndmV7DG9a42L8FBkHgGbWM
         VqXetXDR1H1MNb8FYFwTi/4Q7+7h2Cy5QW93jM9SEZc0CUKVQuS9RS96pMcpRKdUg6gV
         ZcQWysWMy3G9NORke0ljfRAP0NIsddBL4EiL/ab9Ewjzjywj9R3fQdtr6AV8pHHDFven
         jtcnKnsOvKZg598FQLIGgNFcZUvDUexMqTdC3LA61FCpwbYr7OXcN2nrgfWLV9/uqFFJ
         UWWTIqkN7F4FmMs6zmZBLGeoydGSP9ZoEGH8THQw+xZd6DicEOOoOUohL4IZuXZAVa3p
         RWHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=8yw8pRPptpdfcBVnxQ3s1JwYe4cgxAuU+wCl1FInFUA=;
        b=zlIfCeT+94M5tqtkvUn/S5qwY2BX1rZ814ygNGvJrO0/amI+IqBwFTf9rMvV7BUk07
         zUXLBHt5so+O5gDPeNCI5lrB68PR+HHRrcRr7ffKXMMQkbMv8gO+8vn8BSKseCzIX1C0
         LRwyYQEDpCdNUgYe78xPKvthQS2gVRvGgnpxRkpRiKIRf4pNViMl/FtrIAG2OTmNn94q
         NfU/4QG+q9hWepDk7Sn+QTHxYzbv2IqACWEanQnbpmZmW5ITZFRQFuIqSJ2vZQvkSEBB
         Dc1w6NfCRBDtgDrgE6N9FaVrvWTpt+E2D6d179BAAs5/VrSRnkP3QvwCICtqasA7fOGz
         ZJWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8yw8pRPptpdfcBVnxQ3s1JwYe4cgxAuU+wCl1FInFUA=;
        b=GlPq/hGh4cUQKiTFNf2s5fSz/klLAxJSesWkAkv/uGoUj9vfDAvI+7gXYznCWmJJh6
         IyAHEu6RLINIU6HyRja6kGSHnf8ZY4epIkXnmRIYU/D59PRvoIAB7YnYXAILXfRfOTPu
         g3GN6vwKV7E4fI/J7UHukBqUifFdRFqQJ1UTQry8I/3iBYezTiX1cS4ML3k05fZE8DLz
         sPSDTKasE9NJtaIw5/SHVpPfLR1W2xXuoY/hMVPBHr2J3xlnzpxCzKr4kcOE/m91nLu8
         h5oU6/gry1a0QVK1aRIB9Jkf6+tHTCzehKiLWj/3lrPw0x8k9feQRmYG/+8Z4OdONL5Y
         +GXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=8yw8pRPptpdfcBVnxQ3s1JwYe4cgxAuU+wCl1FInFUA=;
        b=oZ7lu//GUho+eDN9K4Y+LPJWQqZIeDlMGtYNRsxOgsva8l36MfLNrnoR9U5BGwV2Ur
         wsjfE6ykuj9R1EWCBm8iwurJO2RSEb0GYg7Z7OTKDIbXNCHGICDFbdgc+P/e7nOBEoIP
         v5RXvb6Agu7UvBosxnN2DzT51j1TK6W6Mdd8dPXMCz2ES8cMgJrT5lHVQvrLiYxzdMPu
         9bnkGteD7MLbM9BYZEuL6pjqTBaV/LAtHs7chp1xXoDnsZFKR4xNb1y/p8Jzl/oPDvtP
         FRZ/LcyQWPWbEHkRZUZqmfUIHVHiiCTnAySdYNdIdi/w02gC/AY5HJfWUqbGrIlxc1i2
         110A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530XsON1PtSHJkPd9D4b7hWu06sHtQGxjz+nvFSlo/4w67p5l4lQ
	3eTCnHbvQonPDjJnpNXwn2M=
X-Google-Smtp-Source: ABdhPJz5jZ/SKTzm0bbpd7bLU6JSSSShdH6m1sRzNOHwubSI2ytgZZAqrzN6jc5B02QzUVerCaMcQg==
X-Received: by 2002:ac2:5c4c:: with SMTP id s12mr279878lfp.570.1603344092924;
        Wed, 21 Oct 2020 22:21:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e61:: with SMTP id a1ls346236lfr.2.gmail; Wed, 21 Oct
 2020 22:21:31 -0700 (PDT)
X-Received: by 2002:a05:6512:3692:: with SMTP id d18mr249806lfs.203.1603344091603;
        Wed, 21 Oct 2020 22:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603344091; cv=none;
        d=google.com; s=arc-20160816;
        b=CxxQayUmV9dOVcP/lX7SNJBgkR/Gcm1wD2LHA1riluTp+ZUcrxHKpuStECQhNz5TX5
         QaUtCLScet4y4d+qA6s82ViZ5t8SikPEV8kh5e0tbcEBn+Oyg8EKtydSkK1ZUFxJEPw+
         J4aomylcWyw2ZiM9C2hDR7jFIHkyBtPugigJB4YATcRoyo+XddsrNISsCJly6H+Y9oK0
         BPSLDQ8BwH4e1IDoStoHuM12wHjJjPiQhRXpix6WhQyxxTQmzz3SFsavBgaA6AilJcc0
         Rua9XHMjUk1yHeKjp+TlKHgOhlAp3xUjg6hhzurn1jRRqn7+CSxHnEbmMUykFupDof9x
         Py+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=teKClXgdNDDCo7VxLDDw6FSCLrrye3A0lQ2OQy4pKeM=;
        b=tV/VfZajWuGXE5ZpP59LLEU3NkcPsWNQjK+ZZJ7MJDuzbnnCn34nlIMyGuOvFGs2Eu
         p+ZCoSODtu6DqWz0sJKdeqK1D7rqT7WPkaA39FZETLbeavzgtnrp6cM09FUL4QvXIxK3
         o0lO6soIiY9V0w+nZcTcJu5PDhlQr05EpLzi8avh5ZGuyssaDEvVDalPfiIgFpxoxwke
         Abc3bz4yq/h3ipBOhtoi0NBKAZD0hOkf2zww05j768YPl+xeQd1BdNZ1NspeMBD+0rt2
         i6J9R0USl4bl5MjLWwRkOkN0ECamIU65d9o2OiyFhwe/lv5YI/3izyDQiUe0DKVc2O2j
         UbSw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id r7si10351ljc.7.2020.10.21.22.21.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Oct 2020 22:21:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09M5LU7c025001
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Oct 2020 07:21:30 +0200
Received: from [167.87.53.106] ([167.87.53.106])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09M5LTOO025219;
	Thu, 22 Oct 2020 07:21:29 +0200
Subject: Re: [PATCH 00/26] Extend hypervisor compile warning set (and fix
 warnings)
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
 <7c3c49ea-93d7-2a15-d844-a2004231ebc5@siemens.com>
 <aec791f3-9637-b08e-99b5-56d2b6341cce@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <893cadbb-bc59-7127-469f-3dd5a00c71b8@siemens.com>
Date: Thu, 22 Oct 2020 07:21:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <aec791f3-9637-b08e-99b5-56d2b6341cce@tum.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 21.10.20 21:23, Andrea Bastoni wrote:
>>> The patch series fixes the warnings generated by "-Wextra -Wundef
>>> -Wnested-externs -Wshadow -Wredundant-decls -Wdeprecated", and two small
>>> bugs:
>>>
>>> x86: bitops: only x86_64 is supported, avoid picking the wrong default suffix
>>
>> How did you come across that one? Luckily, we only ever set bit 0...
> 
> Saw this warning and took a look at the disassembly. Panic is probably not so
> common anyway.
> 
> hypervisor/arch/x86/include/asm/bitops.h:54: Warning: no instruction mnemonic
> suffix given and no register operands; using default for `bts'
> 

gcc-10, right? I'm not getting it with 9.3.1 which I have here.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/893cadbb-bc59-7127-469f-3dd5a00c71b8%40siemens.com.
