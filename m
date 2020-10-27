Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBT6N376AKGQER3HC4BY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x640.google.com (mail-ej1-x640.google.com [IPv6:2a00:1450:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id 287ED29A7AE
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 10:22:24 +0100 (CET)
Received: by mail-ej1-x640.google.com with SMTP id p18sf636646ejl.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 02:22:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603790543; cv=pass;
        d=google.com; s=arc-20160816;
        b=Eu4B7zGyFpEQ76mGPH16NFTBiWixtM1r0JB2D3CsYuNhT0OIBNYOeihoeYPE4PVjI5
         Km3xZGWQd/gXSd3P6A28RxWEVEH2wSvxxZ7ihJy7uDftM/+BXgipgkHf1xLoROrqmwvp
         8ca2s77DUi1oTOxiMQFWJb7HUgORMyhlDnYRAyHAio3tPoT4/pNMoopU3BrfkhlGGCvc
         gnElxqb3IZuxPJTT9/mGh3leuY+9z80vNuiRzUQMIJZIcBJrhdalN4XzEDOXCLrTqKQm
         UMfi9YcQin2dap5w43xujoE+zqA0UI1+kX+qk8/NwZrgva3qUyCGfoDzig0FSjreN6aH
         wXWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=+rsEbDBsvfG0R2WRUvchGHv2Smd2Yzz0bscA4SplSLk=;
        b=BHCzMZgPv5NUHaph2szyIUcEUAX+rnytkoTan0Onka9NW+SD6asQyt2tjIkWqpIk3v
         +aVNFt3AusTNbbrtU8iK67q21kxOtHcScbA1fPp5i7oD8zUaU8E5o9UbuMRD5G3bKfum
         ofb7ntOvdxCm6xUbjw60/UjIQ35NuI8Ijqm6Se6KUohaFc/sdCs5by8xJNLBlwokf1ec
         nEfcoisAPZr8hf+8Fr/ecumpglTLDnktlx839mX1tbSRcYHNCPgXG6ZeBA1it/ilbFGw
         Zx8F2Q2+DZdWNbr7imRGql4KiN6F37nju/McTtjt9jDdFbtcFVhCUfrJ4ql94cNufqtE
         Xdxg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+rsEbDBsvfG0R2WRUvchGHv2Smd2Yzz0bscA4SplSLk=;
        b=aqGRGIgDdiTCS8Brl7W8n7Ri5OMcOqQmt6WYX5ID2/O81k6z1LkyPXp1dAae8d9G64
         yb8cehUNtynfeEgXS/zeyd9WdGMEJhVwkFs569Opl8m3vsYvwB2aP4wxTKOsiYE40547
         EHt6IDw0BulpRreGpWRSBsa6KLH/4FuU7gAhkO3aOWTijycG/X0P/NO+nTDwEmT8W4Si
         bDX8ngv66TOt1ehpwJamYlIz5LzHH/7PnVuutBAhK9Sd+Nulp/T081rw2cHReJ8gIZ8n
         UphO9OSeVZ2vxWLZVn1eIGUCUNmwcfdEwTkHJ1PxfbWuq3aimNdkvBlz2VLiIUawtJLF
         jb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+rsEbDBsvfG0R2WRUvchGHv2Smd2Yzz0bscA4SplSLk=;
        b=aVq/T40+TvLDgVhfO3mL3/fdv1goiniUGYcA4QRHM+00dsnCcU6GTPV+C7NWbjXmBZ
         EwIa7Yt2omgFiJvmCXbRSn75AD08GoJ0Jos6V4a2KlIIeLRTZK51yE6zC84+8BC0Mhds
         rxhZqKIKc4oAS9ob/dl+o8c2F6kHjSFnuQG57ixJbaVG62Xe3exCgJqqMt4d80Dgmfvh
         Olkw1nB793hdGyQ6TbuEa9j8qrINdVVINX12bgKQJlZy73ckwo0JfSSRu8sNgMcGzPco
         4OF9YebeCbQUR5XHSsmpRrDkzlHRxDyvrLNYZQ6CG5b9woH23BGVSTl7qPCRQoR6BgT2
         Ar0w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533GqU3MlMZMT3qjLk7JNAoRMvTVXZdtn8PHXNOe8gt4km63Qj92
	K8/uu1CfbzrMtdcXxI6N4EQ=
X-Google-Smtp-Source: ABdhPJz9bOWThWUodMHwHD1P79kJTUKor4kGFqOwCAnc3gOradgHWEkHjvw0nl3umWUruhl3xsj0vg==
X-Received: by 2002:a17:906:3641:: with SMTP id r1mr1489720ejb.391.1603790543834;
        Tue, 27 Oct 2020 02:22:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c04e:: with SMTP id k14ls864236edo.1.gmail; Tue, 27 Oct
 2020 02:22:22 -0700 (PDT)
X-Received: by 2002:aa7:d64e:: with SMTP id v14mr1282773edr.66.1603790542688;
        Tue, 27 Oct 2020 02:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603790542; cv=none;
        d=google.com; s=arc-20160816;
        b=bBTBFEPy18CQclAJXk203tcBjQ/ub6plmFQApX6KJrw1kRf6mv8lViqPHgzMtMNYmk
         A2T/tXMdHzxU9+XgfT7L/a7zhpRgE2BHrKRhT913Lyt+WT85wS7moGHO/VdBXLl7mFxS
         ALhJJD3kuyRRE+0vTlk7VulPCI3J2BFkiy0i6OOGrOioaCGHkMKYLX4xiJseVLVACyrV
         ndLU0xAl1tqclA1hJC8DiERPOvsbS+9Y3TxYBnXVCTtYV5GB/JyhtJN8i0N7hheoKvdX
         InDAM3RxrwaNdmf9BpJdzqjLFJD9xqiS78enzjT5F52CaHZPUW02lQS1BqC7mAydu4Xn
         zySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=1DQTbWbvuJcnqvdS8hATnj0+Y9HkIdK8lvbiGhwOOC4=;
        b=jNEmrlW7w3J6ZAC3AMMwKkeuK18RW6rNaO5dkXjqXEow8MUPu1q5SmnhI+GXxhktMo
         gsNy/j311W7xJ8q9EaRZEJCFPor1daepcTohwWSH2hBpzKACJ/OP1G+2Lk7swy/1PNwx
         HO2IHv10Gdvmbvo6Z/1wWQbBYIvw4SaCPPKtJgb/m6iwglC7V4yaq+thqof3win8Vq2R
         fCIUzCYH7ytlLA5J7sU10vOypuZQeuw1jgytRMPBoHKEpKAEW4ttX3yEXQOfImNcUOg2
         WqOIWCGD4Ml+6DHl7IdIMEQ8bemoZKb7MnlNOQvxzoC/5szSXH8lPs5bY7p7yYzzBmLZ
         0Cqw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id n7si20654edy.3.2020.10.27.02.22.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 02:22:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09R9MMrU024639
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 10:22:22 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09R9MIam010094;
	Tue, 27 Oct 2020 10:22:19 +0100
Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
 <78334f5d-b665-8de6-31fc-10599877b3b1@siemens.com>
 <DB6PR0402MB2760F60895CFBCCAEA5F2F3A88160@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <bee3d688-1c2d-f4d8-f434-b9ff8d50ce10@siemens.com>
Date: Tue, 27 Oct 2020 10:22:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760F60895CFBCCAEA5F2F3A88160@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
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

On 27.10.20 02:25, Peng Fan wrote:
> Jan,
> 
>> Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
>>
>> On 14.10.20 10:28, Jan Kiszka wrote:
>>> Changes in v2:
>>>  - map 52-bit parange to 48
>>>
>>> That wasn't the plan when I started, but the more I dug into the
>>> details and started to understand the hardware, the more issues I
>>> found and the more dead code fragments from the Linux usage became
>> visible.
>>>
>>> Highlights of the outcome:
>>>  - Fix stall of SMMU due to unhandled stalled contexts (took me a while
>>>    to understand that...)
>>>  - Fix programming of CBn_TCR and TTBR
>>>  - Fix TLB flush on cell exit
>>>  - Fix bogus handling of Extended StreamID support
>>>  - Do not pass-through unknown streams
>>>  - Disable SMMU on shutdown
>>>  - Reassign StreamIDs to the root cell
>>>  - 225 insertions(+), 666 deletions(-)
>>>
>>> The code works as expected on the Ultra96-v2 here, but due to all the
>>> time that went into the rework, I had no chance to bring up my MX8QM
>>> so far. I'm fairly optimistic that things are not broken there as
>>> well, but if they are, bisecting should be rather simple with this
>>> series. So please test and review.
>>>
>>
>> Alice, Peng, already had a chance to review or test (ie. next)?
> 
> I gave a test, sometimes I met SDHC ADMA error when
> `jailhouse enable imx8qm.cell`, sometimes it work well.
> 
> I suspect when during jailhouse enable phase, there might be
> ongoing sdhc transactions not finished, not sure.
> 
> I have not find time to look into details.
> 
> Anyway, you could check in to master I think, we could address
> the issue later when I have time.
> 

Hmm, I would still like to understand this first... Do you have the
chance to bisect this effect to a commit? Otherwise, I guess I finally
need to get my board running.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bee3d688-1c2d-f4d8-f434-b9ff8d50ce10%40siemens.com.
