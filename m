Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2OFUH5QKGQECPGJMHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 1761A271DD1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 10:23:06 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id a10sf5510318wrw.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 01:23:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600676585; cv=pass;
        d=google.com; s=arc-20160816;
        b=QoIRSdPrTkr2bq8S5w+H7KZ3yV9KFb6EOFHXGvNftE3GrZPT1HcjrqTY8FtkxPxo8i
         C/SSVLsTHwIDVx3ZOvV+1AqPUNrZotwXMHiZ7w+uptHgrrhjQecDZ64gqcsvEKkSNptS
         vM4AiTBtxzD9Hp5uOvZyILH3cXxcbW6ntb94LdjbBXxLqzh50VY4em2DcRsaWYvX9MCd
         7CInNDTkgtxPD9xkd1f1c2DHSMm3WPwVgN0gDj2w3nXB9TMixqlQZAtC0n2nx6WZcdUo
         dcYnHPb14iN2OJ9Qdc36M0HxfZpEtg71ah5FNN0SqwMnYJuz0SySGOT7RCpArx3or2Zu
         1/qA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=0BTPBvK039AnEkyee49DTR/W0gTqbk2ghLi/CSvYRTo=;
        b=0AsEYmaToiTymHXPcc2ydCwpllMm7q/heaZH3qHJaZaicBrp8lTDNs3OS1TUv0kxdT
         BD9CciMm7yYUlY1Y71zWsdKpHuYJ2zr+IUF8HlPKrj2eVEeULsi/XHiEkDklvWRgpSKs
         3ANzyXPaGWVnubGLS8X/4nSkdXHs2dGttYgx/h9Rc7xNvl/mkwRgnfw0AieYvuVz0Yv+
         R85yVZqBLXdfHOvDGeVcQZff/nyLlAR4UyWvpb+j8aGXhMIm8Mhffcj3Dp5hrxYzk1cg
         kG1lkDwRIsPSUIdXTp4bv7QmdARDr5d/YuN4ISmIATzp3mAioDe40RZ+/P7xILie6Djm
         GsIw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0BTPBvK039AnEkyee49DTR/W0gTqbk2ghLi/CSvYRTo=;
        b=BgPlSyHcrayslvjl8iFaUTIEXVtIS57DqrEH+v6cxBA2LgDcnZxHfRy5fhsBpG6bXg
         z0uaEI50iTCjjeZGeJnyoAl721rNJRs9PgUppFkGtC0Lb/qImYDeGQXGClk99rpRE9fU
         tyoXbpzkXfcT2IwQzVLziTUO+MU2bMQHv8REIT3CUhz4hjRlmbrhrRc0XdfMeWX5sgVy
         jz+8B/7j92p40yV56BroC5DWqQ2Zx2jTGbC4h7UhwX0kEDzMIMHAAHw0pZBkkMVbT27O
         BT8what5rX9lqXwf9yianfc3+k2PZB4Amt/wNb7k2mhTJaaP7t5rMaoVGdfoqdqlZe1Z
         NKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0BTPBvK039AnEkyee49DTR/W0gTqbk2ghLi/CSvYRTo=;
        b=ShuzOgRo7VCALebxiFuySn4sAehTAl6t0kBbIhkl3WKRhpvFbUo1fHj6niGDCqgqw5
         7bzi4bYa6D3sI5b9rptrANbAKkqLMEP1S4JNjRxIqiQl6H/FakqqXyyYgXSLYUg2Ba3y
         d2Brr/LbBuxls6cJVZXmNVsUOdk0GyTj4Y6mLXeDgalYOAJR0QjIvZfrTsuiHAEZgIsa
         9ZpYMBb1NK/dnPv/yI/EfojA7L0j1h7BubvJxlVpiIn8M+rY++M5AOyiaxiyCVIEpiRV
         KZPJIkUP7uFmFpFbwc9vJFZdgQf2QfRVD60jb2Y0+IF9nDTi8ApbUWa6k5KTRIHsPJrO
         8P/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5315z3dhaJQB/uZqoIVN2YUz3F5EM5cVRfzoXVKQTwuwldM6BzZv
	dEyNBQY0H5UNXForyREgZmg=
X-Google-Smtp-Source: ABdhPJwEJlFFjRpFdDYwwaKadNOg54IFwu/RYKQCLlNB1gm8TrZJFsle3ecKOhmR3vW/U9uYoIaBEg==
X-Received: by 2002:adf:8342:: with SMTP id 60mr55920290wrd.158.1600676585807;
        Mon, 21 Sep 2020 01:23:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:428e:: with SMTP id k14ls192468wrq.0.gmail; Mon, 21 Sep
 2020 01:23:04 -0700 (PDT)
X-Received: by 2002:adf:c3cc:: with SMTP id d12mr52242479wrg.399.1600676584782;
        Mon, 21 Sep 2020 01:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600676584; cv=none;
        d=google.com; s=arc-20160816;
        b=QP4JNqEZoDy33aMkotb3LGhLGa8BYqUi5osjCFpfvrJJfjOmHabcGMEHxYnya9ZhID
         cwm1kQwRLGmXrSVZKDORLerH6CpocqKryxiASX2Psd7FPjdGhIYy0g+SI1AqI0FIqgAt
         xbWlYLu8XkW7fuf8Nxe4H/fVG1h9RncY38qdugHnf9nvKcBe8gNYeTNY7iDFTjtloMzp
         7bC4JjJyryF5B8d9Y6HhvZPIkKssdVftkpxz6bmXTdIHxTYVbFnyNyF76mLjj2kp7zML
         xruFMbGJ8VZi3qsqTzC61+wmk7dwKKITS1e6vsRznUd7nLfNkFz5TLMUrZ7qABnh7zLp
         9uMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=NdEMl2gJphsRZV2KqspKo+6AXsAtDLag+BliDKTMYjA=;
        b=Ix2eFKQvI3uic6yKbH4lUJRu5J3k6rI6dMFcml/t7vkNuS+oVZC8BRgin9KYXEudHo
         Zi2p/5xI7kwMbhxUC8vLFizx9Uj3gFc7hhAFDdtFFucc5NCuKJGF7/q21SMsayDbBTeY
         wMleKoM85uHhfiZ6/IFKLMozTAEJNqMY+M6TakFf0r1LRUQgOPuJK/P05uFu57C8XR1h
         1SCZ9ZumyQkpJuH6kZV1eCQdjTmkPpouEMyXZ55UEZHb0VHSHAohUEJrl9ty7RXAEnzo
         E0Bou0hlKdr8OiTsOolphBnpeiqrdwsBtcVvej4gVSRWJbDCYCFNZk4Ow3j27+XSGDTR
         9HzA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z11si306705wrp.4.2020.09.21.01.23.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 01:23:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 08L8N4nl023525
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Sep 2020 10:23:04 +0200
Received: from [167.87.4.147] ([167.87.4.147])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08L8N2S2029927;
	Mon, 21 Sep 2020 10:23:03 +0200
Subject: Re: [PATCH V2 1/2] arch64: Make sure SMC and HVC calls don't have
 side effects
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <C9905595-F658-4431-AF1D-F9ECDD38A20C@gmx.de>
 <9f124890-9d6f-0fe1-65b9-4a9f5185ed1e@siemens.com>
 <7ecaf35b-6669-143d-60fb-f7b63fb27d28@oth-regensburg.de>
 <EADE8BFE-2CA2-4942-80CA-CB40FDEEB71C@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7fc7e7ce-4bb5-8a9d-7299-63d85db3d256@siemens.com>
Date: Mon, 21 Sep 2020 10:23:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <EADE8BFE-2CA2-4942-80CA-CB40FDEEB71C@gmx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 17.09.20 20:14, Oliver Schwartz wrote:
>=20
>=20
>> On 17 Sep 2020, at 18:21, Ralf Ramsauer=20
>> <ralf.ramsauer@oth-regensburg.de=20
>> <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
>>
>>
>> On 9/17/20 8:26 AM, Jan Kiszka wrote:
>>> Subject tag should be "arm64". And the patch should go over next first.
>>> I can fix up both.
>>>
>>> On 16.09.20 15:07, Oliver Schwartz wrote:
>>>> SMC/HVC calls may modify registers x0 to x3. To make sure the compiler
>>>> doesn't assume input registers to be constant, also mark these registe=
rs
>>>> as output when used as input.
>>>>
>>>> Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de=20
>>>> <mailto:Oliver.Schwartz@gmx.de>>
>>>> ---
>>>> hypervisor/arch/arm64/include/asm/smc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 13 ++++++-------
>>>> include/arch/arm64/asm/jailhouse_hypercall.h | 20 +++++++++++---------
>>>> 2 files changed, 17 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/hypervisor/arch/arm64/include/asm/smc.h
>>>> b/hypervisor/arch/arm64/include/asm/smc.h
>>>> index 1a5d5c8..c80fe15 100644
>>>> --- a/hypervisor/arch/arm64/include/asm/smc.h
>>>> +++ b/hypervisor/arch/arm64/include/asm/smc.h
>>>> @@ -28,8 +28,8 @@ static inline long smc_arg1(unsigned long id,
>>>> unsigned long par1)
>>>> register unsigned long __par1 asm("r1") =3D par1;
>>>> asm volatile ("smc #0\n\t"
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__id)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r"(__id), "r"(__par1)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+r" (__id), "+r"(__par1=
)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
>>>> : "memory", "x2", "x3");
>>>>
>>>
>>> For SMCCC, I'm considering to align fully with Linux, i.e. convert the
>>> remaining register clobberings into early ones, but I also have no
>>> strong argument for it.
>>>
>>> Ralf, thoughts?
>>
>> Just had a look at Linux's implementation. And now I recall why I didn't
>> c&p it from Linux: it's an unreadable macro hell [1] that would benefit
>> from being open-coded. But trying to follow Linux's __constraint macro,
>> shouldn't we protect r2 and r3 as well?
>>
>> Linux would unroll __constraint_read_1 and __constraint_write_1, and
>> __constraint_read_1 would protect r2 and r3 as well. We protect x2 and
>> x3 via the clobber list -- is that enough?
>=20
> I=E2=80=99m by no means an expert on arm assembler. However, I=E2=80=99m =
quite positive=20
> that there are no physical registers r2 and r3 that can be protected in=
=20
> arm64. These are just placeholders that are translated by the compiler=20
> to x2 and x3. So protecting r2/r3 as dummy arguments or x2/x3 via=20
> clobber list is in effect the same, just more explicit.
>=20

I've merged both patches to next now using your pattern. I applied some=20
massaging though. Please have a look at the result.

Some consolidation patch for the hypercalls will also follow.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7fc7e7ce-4bb5-8a9d-7299-63d85db3d256%40siemens.com.
