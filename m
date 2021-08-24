Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPGCSSEQMGQEJM3CWGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id D79E63F62DA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 18:41:33 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id q9-20020a2e9689000000b001b964fa10b3sf7778991lji.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 09:41:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629823293; cv=pass;
        d=google.com; s=arc-20160816;
        b=swy3sRoDdxBwi9Bgvi/Qc3JeYu3cJDpABgtbvXK2KCg9SO37o6ZR6fVJd78vBof8Ix
         VpiocutCsy9cgwGrIgOm34yUWczVXfvPS3BhL3aiTGIIDPT8ms1hfa+8+kMCGCR8va/n
         2dnLHICteBaL8PaAAdyMBJny+zK+BGF+DLqpcp2dUMp4WhCmXLRsRtL7oegk23ILb0zo
         CBJ7o3F9uwvyvOzNWRJ1qDlEEu7SVYexKnVhiUQo7Zrb93yPA+ZW4WDS4iPEk0iHOlEu
         PEk0WAk4nR7QUoklZLlsl6+yREChoJp0xOFt4MixSv8OGTaSSqEZFLXEpJFSv0s6VOEg
         7KMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=RYfODaSQcdK7U+auau7CuNjKbP5pqbU6cerPkZFx7lY=;
        b=i4dCmL4w1+69fT3DDX2W+atHsbk3zxKA9A9Jj2Kd8eHC4/cErt3mj0fh2G5f6fRCeX
         Ch4pk1rQGRY7kOJBkgtxH8b30QmxCqOfeaeFxmtxUKRGe9+CUPYWEuD8AWgzqbWlliPi
         bBHaWTChQ9dG5tzFcA/QrkI0ZaDXIu94L+1ClCGB9HwoBRXRejXGlRsYc5RembZL+vOJ
         LQdP2nbKkd3ku8tYiH5rbdqsOZD0T+ziP+2tFA/RZ4FOn51GUX2ICDxi7z8352LYawzi
         2OTYrvufPXZ3PfLi0MU9utoUr7aiUDf1HFBT4zH7pDG6+znuSMlynWI2vJQ8daguwztD
         6Ulg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RYfODaSQcdK7U+auau7CuNjKbP5pqbU6cerPkZFx7lY=;
        b=rRH1L6rFy1zdjs1FPgZ6XLEx0NG/W/uTKrVSIkih6vBg6pTkpYy0zTSV5GUHL+8XFG
         pu2lSHxnMo35DkjSXpGto7X18m/okKavm9JxNHMTjGpl3VHZKVkXpzzIm+co5UUJfXXm
         3zgtnjk+6kxPuksXoImSJ3rcvo52kA7AoTH7HqB1FK85peFn4HA6GJC4ieuTVN73HVGm
         oGjeIRQpG3+h8vDTzrHUd7fqIX1+1QNgTCyp9Rco5HpQ5UkTRQC/EcLsM4sAeIJb1nsw
         U1d/7188QB5N28zHOFEMEAxMLyUNDBqfWfK9OCawcvVWCgx+5cw1vYlc7qSuglcq3tUV
         wGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=RYfODaSQcdK7U+auau7CuNjKbP5pqbU6cerPkZFx7lY=;
        b=kxtW2b9liQ4Qh7pMYpgs0B6Y5+9/ke4HT6xOSJ8F4aBTKQ+Jf+jQH3GFvZDwPiu3iL
         mZORDG31lHMBOio6555XQsZntptsaSXev8iCF/IxXhmN4XssNdNgIHy4rWYuGa4wsREy
         fhQ1cBpmSH0bfPaXFofgJz4PMRwcUsEAIWeL9wMSicqAXTXsEpQKDgmiK+0FTJbrUMga
         6B50FjMJKWm6cdEf4/wxdEKZbECrYMVOJNWZIlo2OFrG5VYOZmJuhEYc1JVQwUlo4/ql
         sGwniEkZG0bdrRLSJW3VxVAyangxnbD+gm3nFL+rvPQGvbcY/KUSuQJ7a3De9mk08Pzj
         axcA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53297QEQfTgCMcWrMrWWeL96jUj2ZKBkoVqoYDPTxuRu2+iw+TyG
	oQmajLDM93KB45JuVOo4pyQ=
X-Google-Smtp-Source: ABdhPJzTRO91hCXmbLmcwjYDm7hyCAO6FUBPjf5FfnThH5RZP12pREPmHngoKC7hFN+EFPY6Hy4C7A==
X-Received: by 2002:a05:651c:1116:: with SMTP id d22mr8261426ljo.332.1629823293418;
        Tue, 24 Aug 2021 09:41:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1783:: with SMTP id bn3ls3577678ljb.10.gmail; Tue,
 24 Aug 2021 09:41:32 -0700 (PDT)
X-Received: by 2002:a2e:82cd:: with SMTP id n13mr33865831ljh.6.1629823292030;
        Tue, 24 Aug 2021 09:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629823292; cv=none;
        d=google.com; s=arc-20160816;
        b=u0yCUieNuG/RMYw7jJUvJOoTPFyHZVNPt/a9xBbwyTI0ApRVqRZPKFLjt/jwpK4qPt
         gBgkjx5FmwzVI950pKzoXf7LrXtxMljNqoYmc/J0KZA8nETp4UnQTsGTPjgeN/GfOGO5
         6GVcNJMkk8oLUfYN6m/H6s6fdU0+bJU4yF8TTmDCquSAmFOnRV5R4RGE7wa6OMSFB15/
         Bcr0KP7rOzPAvoT9M+0anElvMypIqVx0gCb0Lhpu2/WYosTwjeI7WcQ9Qr+S6jTgCrt5
         +rilgBJ7KCjgiko64eAM+RZDExTkV+PIV+5BANGYQvl5lqE7MX3HUxUN+i7jurqiyuRT
         h5XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=6zYavxqwc4Yig0wtdjUm8S4x9zsYUaJkcziSxYsfOeU=;
        b=xSBh5Z92O5+oec+z4xKzmSINZClMSXP4oRXlYkK0fVSJNfO3oKUU2/WjiJgwEqRFOD
         qN9NSoMKCzYbTk5HFohK0kwz7tvLjQz3AdiwFGiER/+1GCyx89uy9FuowXUbKng++/aZ
         p5eiNNZBT1w0hrsNuaoQQRiCtWLUohEszzn/g0/1cd9TpyJb5X2xHrhgFbI8jDINg4yl
         I1+1ckpSdBZ9/yn5VdpNgdcqDgtJQcMfggXbOHoPYZ7kJ94FFMpdyfHKkKZuZSOeWg79
         PU40Ef+0hWHJLgc38I9mPwZdeoFUN8n8hy5NSZLObYOmaeLQBY5nZfoYMeS/GTbGDlB4
         G9Qg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id j7si1264197ljc.1.2021.08.24.09.41.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Aug 2021 09:41:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 17OGfVKo030709
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 18:41:31 +0200
Received: from [167.87.75.154] ([167.87.75.154])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17OGfUwt020047;
	Tue, 24 Aug 2021 18:41:30 +0200
Subject: Re: [PATCH] inmates: gic-demo: map led_reg
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20210823130258.215378-1-ralf.ramsauer@oth-regensburg.de>
 <9b8c6c73-3d5a-0bf8-7843-28118240ef58@siemens.com>
Message-ID: <1f552e15-8466-0f06-ac77-9ce716feebe9@siemens.com>
Date: Tue, 24 Aug 2021 18:41:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <9b8c6c73-3d5a-0bf8-7843-28118240ef58@siemens.com>
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

On 24.08.21 17:43, Jan Kiszka wrote:
> On 23.08.21 15:02, Ralf Ramsauer wrote:
>> When I introduced MMU support for inmates, I forgot to map the memory
>> for LEDs. Fix that by simply mapping it.
>>
>> While at it, move the initalisation of led_reg to the top of the routine
>> where it should actually be - it should be initialised before the timer
>> is armed.
>>
>> The mapper will take care that the address will be huge page aligned,
>> and the size will be aligned to HUGE_PAGE_SIZE, so there's no need to
>> align anything on caller site.
>>
>> Fixes: bca43a784716 ("inmates: arm-common: add MMU support")
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> Only compile-time tested! I currently have no device where i could test
>> it.
>>
> 
> Let me check if the Orange Pi exposes this. But I swear I saw it
> blinking since then...
> 

Indeed, the mappings of the GIC as well as the UART saved us so far on
the OrangePi Zero, likely also on the very similar BananaPi. Other
boards with other address layouts will benefit from this change, though.

Applied to next.

Thanks,
Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1f552e15-8466-0f06-ac77-9ce716feebe9%40siemens.com.
