Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJ7VXPYQKGQEWTJMTIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8892A14A6A5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 15:58:47 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id d8sf6155449wrq.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 06:58:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580137127; cv=pass;
        d=google.com; s=arc-20160816;
        b=jd5f1NjB1/DlN43+9yJOb+lBKvCoSckUutb8Ntxe6Xrxct6RzeKbfHyHEQuZWHqTlP
         O/HSvxlfpK+Lt14raEymEScZsp0uIvHvH1Ls/84x6k+HUj5LuuDA+qK2PAS8kaDlzEYg
         xvjbFxlxGe2yz+x1/onepguuYeJ4IPmKwk3+WWiWQ9GH59WFYAiaL5rcTGz6G/KWcB8z
         wNN+WDRM/UgI3EbS/Fh66ge4+PwPdHx6sGCHzHNfdBVgzy/dDjit4lDI8oLUh20vbNzp
         WfYrx1XYQkcGlSU17dgjL09rJP+ihAPzD4Aki6mtLxWR1sxmY+OTgPQchEdI9sWjCGNo
         jBLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=GL9fitjiaJbny4uS8JrrM8qgR/iN99KVtcuafx8AJ7E=;
        b=hwMSoZ+YT4lDdqzYfHs0kHsYXxQYsT0iuXgx+FLydya8l8Xm1SDWK60A8fXy5dX+aS
         9Tg+emBkrI6wDAhRhVieorLtw48F5JPZapjje5f6xUJFC9gYeybw9Iilt3rzpdck69JQ
         q7liToHS+dhCUMDvBsk0kB34dF4i2WsBHVRKtfTj7UMb8jlTOqoJuS0JsqW3mhUTy9JB
         hrlsws8NJvHBYTapa4Dx16AfCNNTMyQ31BOyLV03RfkWRollQo9MQrcqEOOlVm1H6w5y
         x5UHITRVfxsfTED6nZ57sCvk7qx8ubWe2o8YwJ+3wTBVJtgEVTtrVHgcf7oJKZ4eXdqs
         H5Yg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=n1U9oqmO;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GL9fitjiaJbny4uS8JrrM8qgR/iN99KVtcuafx8AJ7E=;
        b=MSp1DIV3QGNdlQoiVhnNm4f3VYNKtfivzbPkmtsjr680ZfnfGVaPXFcaQeAQJu+Hnz
         a7fU51XOgL8bCui/RcE90S9Pu8ljoGMgWpRwRaMhlfXuihQE/aD+gycA9njyibLO9fz0
         /bWDIgyPZ+fjYgdS2YFBsA1Y8N6H++vGk08zqXsy86oFmwwhzcrS9UVuh5z0eWjXtRjA
         cDMRsf6faobqX2uebDyb+znuLViJNqu93UPANr1hvoX0CUGdVtcKbQXWfObjoCOjEjjR
         B027+P4lnm5Pf4tdGXixSxr6wLr5YES4NEaCi3zOPAd765R8urIvjXlG6qcDKhKj0lEe
         FNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GL9fitjiaJbny4uS8JrrM8qgR/iN99KVtcuafx8AJ7E=;
        b=sbGijJtBzuVUdGI8dnq2JtLY38ZY8VSWyDd/yUq2AXrEx70YD0k4y+imRVq/X7Ov7Z
         eDH+vWM0yE94cJ7RtGicOVxA47Khp+VbSMbhGK0C2yHxOxajiukWjPHLx/ck4V/rV0Qo
         mSPQ4xPsp4Dg+GYaFuuMEMn90TjCq8xBywMNtSAnVAWXgjoc7RLiweCHR08Y+hWH4ioy
         9C15NiP96eJKcchh9AQ98gQ9etnwFLrnGxvRQcDrWWiS4Lupd1meBPJeuhShuYNg1nMa
         CG67LMwkv0GQPNSyq/NJ9Uw5ShJndXpvQmFtdeb1NIPRz6C/C6TSYv/S/yEXfuHpK6jU
         lUmw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV7awW9+D0hw86RpW7BaTK2em7xXrZ7XOKu9X75nYBAjNgRKWtv
	+FgddGQiYrVP6cmSmj4Ydsk=
X-Google-Smtp-Source: APXvYqwn30uGG0AVgjw5+8psARbGKRfqSa8d7etiHjWCFKF6mB9QuoSJWOtoieZhExnpBsl3n5JTnQ==
X-Received: by 2002:a1c:1d8d:: with SMTP id d135mr14224073wmd.92.1580137127284;
        Mon, 27 Jan 2020 06:58:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb4c:: with SMTP id u12ls6819116wrn.6.gmail; Mon, 27 Jan
 2020 06:58:46 -0800 (PST)
X-Received: by 2002:a5d:4749:: with SMTP id o9mr21938906wrs.242.1580137126568;
        Mon, 27 Jan 2020 06:58:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580137126; cv=none;
        d=google.com; s=arc-20160816;
        b=vvD0J+06Dzraj/8q1OylpslHcX6fKrY+7Bs3sHxne9NkhuP58wdE64BQMzy3E65spb
         tUY3FZxsUzxkU/Rl3wdRKYz2TkdyCenQj42YwKwNz42gkQbebhL6hVn+/xUrax4reJ3C
         Y2mGmyxUA274H2bDPlYlpVt9vPPxSxJ+DO1Xmc/I2HCleE/5N/j67Z1J1nAUKsm7paU3
         S9e2bIo3fXQk7W+CibCt6FZwpXUOA41EpXd+vOOt/HTe156Zs6rVSJ3jZAxEkA/ZvwJe
         cX4C+n9KHa7mCOqhNjs1wBH0HaCAbq//Tg+NAMYADjmbd2QyszMUIZPQ9xiJLuKHgTUC
         mfxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=+IHPko1uU9+V4L6L9pSjuYCgbdILIyZvQW7Kp4DexZU=;
        b=bdtSxMZPxrH8DOPlTFq6Fy2O7i4lfOjF83SukrW+gY5VJR19vv/+2Pt2U58I+IG+rU
         bSvYstHC35OhxJ0bVvEDbwcNpcaSKAeDFvr2KC4tzKkCuJzcxK56TA4Yxru6+81vJmE2
         tPG/4sYqjtUq3gbBAjQG+ooDTp8DvF1MSf3Sffd9Zt19c9kKGOwOcp2VCvEpUhS+VLRT
         IEZgGZCpSOA9dLKPnENEj9vZWKSm1U2bQO8uur3IyPeWec2wPQ70k66rsBLh3uedQIJh
         LUf5WHAaSFmg4IliwFGyRHhO3OlwsngUiNfoDhW/VWAfVvJqkAoobQqzRJfpRoKw+7Wk
         YPfA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=n1U9oqmO;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id g3si674124wrw.5.2020.01.27.06.58.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 06:58:46 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 485tDQ1FGKzxtw;
	Mon, 27 Jan 2020 15:58:46 +0100 (CET)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 27 Jan
 2020 15:58:45 +0100
Subject: Re: [PATCH 2/3] arm/arm64: Pad comm region to natural alignment
To: Jan Kiszka <jan.kiszka@web.de>
CC: <jailhouse-dev@googlegroups.com>
References: <cover.1580107046.git.jan.kiszka@web.de>
 <beb95b54284b1defd0f1952d43f8143cf303d38f.1580107046.git.jan.kiszka@web.de>
 <ef68e345-9b82-e82a-65e1-da1cb9faf2c0@oth-regensburg.de>
 <185db5e4-618f-db9c-cd1b-d199b6af0c61@web.de>
 <7c7b7f79-3d23-3e78-bda5-60d88d040bc4@web.de>
 <80ed86e4-9082-42ad-b38d-7f97d440076e@oth-regensburg.de>
 <6dca7de6-edb3-b8e7-3738-803fde2118a9@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <cb50b8e5-94d4-21f7-a920-398ea8efaf6d@oth-regensburg.de>
Date: Mon, 27 Jan 2020 15:58:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6dca7de6-edb3-b8e7-3738-803fde2118a9@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=n1U9oqmO;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 27/01/2020 15:45, Jan Kiszka wrote:
> On 27.01.20 15:22, Ralf Ramsauer wrote:
>>
>>
>> On 27/01/2020 14:39, Jan Kiszka wrote:
>>> On 27.01.20 13:15, Jan Kiszka wrote:
>>>> On 27.01.20 12:40, Ralf Ramsauer wrote:
>>>>>
>>>>>
>>>>> On 27/01/2020 07:37, Jan Kiszka wrote:
>>>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>>
>>>>>> Better pad than rely on both sides using the same compiler logic.
>>>>>
>>>>> Ack. But shouldn't we then, in turn, use __attribute__((unpacked)) to
>>>>> avoid that the compiler accidentally does some other unintended
>>>>> alignment / reordering?
>>>>
>>>> Do you mean "packed"? It shouldn't be needed at this stage, but it
>>>> shouldn't harm as well.
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>> ---
>>>>>> =C2=A0=C2=A0 include/arch/arm-common/asm/jailhouse_hypercall.h | 1 +
>>>>>> =C2=A0=C2=A0 1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/include/arch/arm-common/asm/jailhouse_hypercall.h
>>>>>> b/include/arch/arm-common/asm/jailhouse_hypercall.h
>>>>>> index 83cec97b..aeab2816 100644
>>>>>> --- a/include/arch/arm-common/asm/jailhouse_hypercall.h
>>>>>> +++ b/include/arch/arm-common/asm/jailhouse_hypercall.h
>>>>>> @@ -38,6 +38,7 @@
>>>>>>
>>>>>> =C2=A0=C2=A0 #define COMM_REGION_COMMON_PLATFORM_INFO=C2=A0=C2=A0=C2=
=A0 \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8 gic_version;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> +=C2=A0=C2=A0=C2=A0 __u8 padding[7];=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 gicd_base;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 gicc_base;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 gicr_base;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>
>>>>> BTW: It's really hard to trace how the structures are being defined.
>>>>>
>>>>> Instead of creating the structure in arch-specific parts for each
>>>>> architecture, I think it would be nicer to introduce the structure fo=
r
>>>>> all architectures, and then include arch-specific parts.
>>>>
>>>> ...as anonymous sub-structs - possibly.
>>>
>>> Not that easy: The anonymous struct thing does not work, and the doxyge=
n
>>> documentation would have to be refactored as well.
>>
>> Ack, just realised that as well.
>>
>> Have a look at the attachment. If you agree on this idea, I'll make a
>> proper patch out of it.
>=20
> Not truly convinced as this pulls arch-specific stuff into the generic
> header while we have asm headers in the loop. To avoid that, either use
> non-anonymous arch structs or defines again (I was considering the latter=
).

I already tried the latter one, and looks like that's not possible: We
need to have the structure in place before we include arch-specific
headers, as the routines in the header already make use of them. Forward
declaration isn't sufficient.

I'd go for the non-anonymous arch structs then, but still leave them in
the generic header.

  Ralf

>=20
> And doxygen is missing the struct at the right place now.
>=20
> Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/cb50b8e5-94d4-21f7-a920-398ea8efaf6d%40oth-regensburg.de.
