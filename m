Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3WHTDZQKGQEQMZL72A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B16217DE39
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Mar 2020 12:09:34 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id n7sf5033765wro.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Mar 2020 04:09:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583752174; cv=pass;
        d=google.com; s=arc-20160816;
        b=xnkxtRIHWMxCMBeHxFCJRuwAreJsXgw260MslAwZERpQjUZ1ii4qEUN26+RAFhICK3
         gMHT2pnRRWvVJH3GlbyhuTvvlMYfgPJibZMMIPIIFhXLAhrDEVgOKeWUcE3AYtp8+loz
         0T/xN2WNJnRA47yEVVgtO2VoQstBDyDqipLqIFN70F5nwDw3xePQuFaRv09Uk4Q6qFD/
         QfgVxx6MpkhCRj+wG3+qg7rRws6tT5pdq8ttLeRyymrvS/tpfLhBUahYvi6NX0T1Wzrg
         NU5p3X8x0DPEH6SJngJchS1hO0hAyTFXRL8FDWXuUgdYRvHwUqNH63wCkyyaLv6l28YE
         qeIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=M20TcPjn3GJtdC+xQI3yY37E8hFL4MQ3rYRzmg4Vo9s=;
        b=AjlkkxKb8Rs9IgBdhgYJK5jRMQDdenjyB4RXSjNvZqOIvJzyzSzGyFgTgTJt1fNkod
         NmM2QgRu2o9p2GYDkrEfPZQAp+bRnsT4PgbBrLGaOMSz9vQum5g4oJ/l2eli/r0HDFlW
         RAHefJH1lp9JisD1lRW3u2462fH2IHDJQ0FHFB7izEBrdSBhzbQ27HVOdAMNJFvCLhBX
         cGtmHUQENYyyTZAEL1SZajeppIFR9WNbl2xbx3p2NYw/BBxGD+WBlBcmPsHa8Czy+9gT
         5inTETFrycnc2iY5v8OXisxLTpAHsk7TAhRtNOmDCEx9FBP+uyA8VUPzDGwyHaSlojs4
         FaVA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=M20TcPjn3GJtdC+xQI3yY37E8hFL4MQ3rYRzmg4Vo9s=;
        b=QPNXq9NJfvyTJbWBAG0UAbfHG1xLUCkJLCXT//CR9+Gvpz+WLlrhyYiadQBagnkVgx
         cmRYxhE/97NXN0E9THWAYTutDalZEeO+DLZLqYhHnqK3SnMiFf4YHAgkYy8eXb/xqCiW
         lEhKMFFwWxC1wwYY0a1ApUqMhrQxH9bUAQ4HFkQssjvw4lT2YBD9/0+rm180epqL4V5O
         8ya7zDWS5Z0on7TYBihuQtDKe3P/I7XoQe8IwSTAGVWuedYtkASrs4x3y5dKYmsQXLOQ
         r+ZEEWsVgNkZ5kOQRjcsVs6y2XDX3lHHlRxbcC9/pY19rkU8WXrW5tQOMmB+fzJ/f8yi
         bvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=M20TcPjn3GJtdC+xQI3yY37E8hFL4MQ3rYRzmg4Vo9s=;
        b=CV0totakj9eG8qnfxJeF1Ls1i4SFnCCuYG6JlHX7gY4VBBz/Tfyn0F3VPBy8rRQ5Ao
         BjYhNjRXwSL3Y1LUFKdREn9JUtIJqTNGsw3xxnv+KSEwvk4Sc2BZp6QzBlW6PdFfkAtm
         /nUQ05jqtWXLrm0WtIDCaUX7AMSqaWfvXDegQqL1ox+J7TTVHIl44uQmRalt7YDYxdjY
         3NCCY1qbAlLnwo7oT93zl+14mGWOw+BLAdLO6YWbaY9Yo22v/h1dVmt6c4W5YHWZmHOA
         R7XW+gBZm4CnkTPA8pym1Ymr6uNBMQdiVqUzmgVZ/g+RS82OkAhPIWOc/rKthmQrd7fa
         4ESw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ0HYZOkfXSHBSl/bCc/gKDA09fgRWBMo2r/3hDEWYo1sAHPwoS8
	S0FAyImBKKO6ybD7IEBd+xo=
X-Google-Smtp-Source: ADFU+vtOFdroawzRF83htG5xffyvmdVqp7fydH8EmCJobaB6lypnFux2w3PDrbGvzBm0Eil/DWseuQ==
X-Received: by 2002:a1c:5541:: with SMTP id j62mr20328476wmb.40.1583752174192;
        Mon, 09 Mar 2020 04:09:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:2c03:: with SMTP id q3ls6890020wmg.0.gmail; Mon, 09
 Mar 2020 04:09:33 -0700 (PDT)
X-Received: by 2002:a7b:c318:: with SMTP id k24mr20748474wmj.54.1583752173394;
        Mon, 09 Mar 2020 04:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583752173; cv=none;
        d=google.com; s=arc-20160816;
        b=zwXHDNn1YRUqZnzKJMVkRat/J4dd4PbCx/07ulxeuzSk/eAh9xfTmwhfUMPbkOzq92
         /mU0x1H53Q0h/yp1nvWSwDrviBPDTSyQhj0MsnwQeq0E2YlXgkYRLHBP/jKK9lgiWidE
         Tp47YCDbWojjmwIjLahZle4glc2yj2oCHr2gvL6h+SlQEebc6MNysoM5GH/F5KBKvCqQ
         gjZJishUPKUdt2C7GReCpzfb6hyqAAR4VgF0j3OaDrgh8WC6Dt/a3g5zJpbSrEd/bzQZ
         L5K2euJuLppP+QeUxt7XjUw35DqoHoAupAcaI4sV3vE3hJm5PaQXurD9u8A8Bb4DbRZE
         jOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=1Ynl6T04CLhgc4hw2iviXATiEAoGqcUg038hBmcWBQU=;
        b=WhbvxzDzc/CpRS1F1gRtY34UHye3rMGe0sF1lYcapH25mNMYueK1k0UQqCPCqBNoC7
         DoT2FarnOiy2KyV/szfUApy61o+5Gxd/t/PeRl5Kr0yO2vA45PmGOtxHHlDrLo1sCQJt
         Eop38LduyC6y80rP2vQDUqUBqsr1x72kFPp43O82oRn9Jq8boDaB/9NqHmIS1+F8Gesx
         d7FpO1VrtmQ8hZxFNJCKZJqCtHM2tHLok+3RVHd4loPtwhd+H2zhVOnOByrf/+/Chlbj
         gR+888yu0AY11v1rvSGNV9cCBzy0XHZzae1fhJaPOb5zfgEHrwP9F7jpor212h8M19RI
         4KUA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id w20si1027447wmk.0.2020.03.09.04.09.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Mar 2020 04:09:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 029B9WhZ028093
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Mar 2020 12:09:33 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 029B9WDN003034;
	Mon, 9 Mar 2020 12:09:32 +0100
Subject: Re: ivhsmem_uio driver update
To: Nikhil Devshatwar <nikhil.nd@ti.com>, henning.schild@siemens.com
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <7c89b273-d0a7-706c-651f-6e658933d93c@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com>
Date: Mon, 9 Mar 2020 12:09:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7c89b273-d0a7-706c-651f-6e658933d93c@ti.com>
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

On 09.03.20 11:12, Nikhil Devshatwar wrote:
> Hi Henning,
> 
> As part of the TI SDK, we were integrating the ivhsmem_uio as external 
> module
> from https://github.com/henning-schild-work/ivshmem-guest-code
> 
> Since the ivshmem changes in the Jailhouse, that driver no more works 
> (because of the vendor ID change)
> Do you plan to host the updated version of the driver in this repo?
> 
> I know that the driver is already part of the siemens repo but it is 
> much simpler to integrate an external module in yocto.

Actually, that new driver is a complete rewrite, not just an ID update. 
It allows to securely pass access to unprivileged users and provides all 
features of the new ivshmem interface. For that, it requires to patch 
the kernel with [1]. But given that you have to patch your kernel anyway 
for other Jailhouse details and given that this is trivial in yocto, I 
don't get the point of having an external module package being easier.

Jan

[1] 
http://git.kiszka.org/?p=linux.git;a=commitdiff;h=651db1cf858dd7afef7ef98c7db86223c1f73a59;hp=2c523b344dfa65a3738e7039832044aa133c75fb

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/be05da3a-bd66-b51a-7cd2-53685582de54%40siemens.com.
