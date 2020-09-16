Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBR6BQ75QKGQE23LFLIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id B700526C12E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 11:54:16 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id g7sf975942lfh.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 02:54:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600250056; cv=pass;
        d=google.com; s=arc-20160816;
        b=SHq9dBO7Dk30Yr79kLye89t9TtgZ0wZvTu4x01C8pFYCEoqLhvSj/Y3xoZ8vffn8Uv
         WMMebgP+xKu9ojzUKU12M+ltjCLkjlRADFYk3VSZo54cd9RUyKGVQ+erGUa2dLkJOtrl
         E3S5gTl5g8WJlsF0PUXKAcuZpK0UiB4aEiu4d/8FjiA5Vbbzvs9MAY8Wgkh7lATo0KTr
         atwxyzHpSPi/4RQWtIWqukDnkHN+jXYeFrp+9XKD9PQouijwoGImWM/5Usgp4AXmsqNu
         UvUsgprC8BrlIEiUFuGcfck80EKoXNoW0Q2AucXyfIJXVFmrhcxwz9bqPAs2dgg0xdsZ
         z3WA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=0nA4HbjueRnpOLB2DceGftV9B3wA6DXVuqkB/5W4PYk=;
        b=ERAEizB72jhke5FRPIg6g2/5Gz2mP6o1p5bFGWhRDfspH5L0sYf1E/Dtxp+On/2MMW
         XqGowjiHBcZM4V9l1y4AAekkM/st/ZmaK6B32tjIMx1YV8GjemrIAgc0tz9e/CYpZ+Fq
         uKlGewsrswYKZxLBqlGLkr8CPZtDs3QKms/aR12EqA9KSjDUmeB9Dl4/vkNWyr2HYhEz
         RXS6E2B4wDYE6UO7SDzsazG+5N/l42fXZkCdOaVn3xO0n3KTPJBs9oepTl/BxieGSP1L
         ZDHwwLvlgrn0/iJk7cm78g3EFVqT0MTAtKB1bpxK0PpIrncFC1pxTMiIeavCb6b2uQeo
         9Ggw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0nA4HbjueRnpOLB2DceGftV9B3wA6DXVuqkB/5W4PYk=;
        b=LP91wuscbsaN7/5iw1imyuA4GukPwBgGYMK0irRav/xyJCNhRY4uQLDy1krlC6yI+2
         7nN3bdeaZ/4tDBApMquFicvrGPs68J8wEjj823ZprM9/Az9W8ivxanAIV0hgXoMtYXYQ
         OQ95uWLtSKzY+EXHQw3tnDB1+fyFo5u0zMe4k9oEkffzgZy3AeOFvJ5mHY8pyb8TOnAH
         5DUGiuLsmmcY7GlEQisNqk3KFbbvw8j/58BTiYuK+CGTrqCq92EppvBTpwyP1o6Mvcxz
         qt1At4PbxODBoWYBRGsjbD6OlzAXlfAGqF00nmRJO9ci0YJtAE566WloT1J+NH26h0/1
         7hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0nA4HbjueRnpOLB2DceGftV9B3wA6DXVuqkB/5W4PYk=;
        b=twfSAwX8DX3u4AbrgAB0sctMTGGo0qy2Qr1VbHV9RFf9GE02WkJ8OY7Q+ASySTbGuS
         2zBXsqnA4ywGc1aTQzI/1uk23mVSbLuxCocyu54IWtUWISYOa4UO3coqHH3DhC8zfBxd
         +w73q12oDT05xW1gwqKydJJqnSGeDa/hsl+XKh9PSTJU1n2qbrXPs58fHIk9EOYsC79s
         loQo9CA/PzwoaY1Z7rOHBG456PVzL1XmQVHZ/IB5gFFeIU5zMQI03xpaVWTdl8L3ILaK
         wha7gkSzAgDTmm1d89f2t5oW1BXMQrjxPgPf6KddKe1PqqsticcKmeLgq6fRckDBjhIC
         XowQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5334K1ajfzJBYJl4K454wpmiVTWA8N2YitlnN2m9pEbXsHmCRrfm
	9cXheQcegzdqc9ESPj4warc=
X-Google-Smtp-Source: ABdhPJzKm7DGN6h3fSer5wA+1gZPyztk+Y338xYuDEpwTAtI73VzbWpRCpQyCa0qE6UTPlWjGfn3Qw==
X-Received: by 2002:ac2:5f50:: with SMTP id 16mr8129217lfz.533.1600250056258;
        Wed, 16 Sep 2020 02:54:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls434100lff.1.gmail; Wed, 16 Sep
 2020 02:54:14 -0700 (PDT)
X-Received: by 2002:ac2:4318:: with SMTP id l24mr8497541lfh.46.1600250054885;
        Wed, 16 Sep 2020 02:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600250054; cv=none;
        d=google.com; s=arc-20160816;
        b=KXn9/FBKklVYY4vFBgMKJpff+WF7Z/N8Rd/mFhlKNWsLfi23AFVemsw+5ikHPUe+l3
         /wZBKmUc4JEsxzj7okczoo9LUTCRMI2G2HvX6SOYjcZO+XIS0CxuO+zhFTujy2ufLktE
         q065NOx4vbaTWmURpv0gI/ZL0pOWDYkU1tzCSEBc4EELrwfVI6qXsZWsSOjLQakLYYfr
         LrAulwg8x592HOwjrrRX9bx/jxPIlIkyYKptv3NSgTZDiqQOhR2Ev3CaUZh574hF8Hbu
         LHfBMd/kDuxliQEi/c7fEJ4rtDst6L/N47RJwP+uafrgq1PcWOzjObKGSQoZsspDtI1A
         F2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=3e7KxLC58u48sw/jUgp1qucaqZp61uYhdB7hk4Tv7T4=;
        b=cvJHUOc29hAVt/S+x6769h1k7Zj8Q/Qsg8bxj5PPmE5+Lj/i2qBFubdnwFDLozTOLY
         R8T+vObGAXrkKWfDh7AfkrqsUxqSCPG/2bSZM1w4K+ls7shYb4AANLm5Fey7WE0Sdhcn
         NClMx6ePdZYbQwe0uhrhvDraEnNudDMCaic7yr75Ovge5XotV/gyZFf5bi7EwcVBGFBu
         +ARAdz3PmFtNEgG+y/pLjpt4Ze7dF5lwXmUlCd1e/VdoiuCxz9N5iKYvT3zSHEOjBNgx
         7VNIS9x89CJHDun/eCxTuGZMvpYsVrspjLZOc8RSmmDfRlCPB7zwFtoAX2XXbos7I/To
         YKLw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id f12si625759lfs.1.2020.09.16.02.54.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 02:54:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 08G9sDCX021870
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Sep 2020 11:54:13 +0200
Received: from [167.87.136.208] ([167.87.136.208])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08G9sBgm005248;
	Wed, 16 Sep 2020 11:54:12 +0200
Subject: Re: [PATCH] arm64: Make sure SMC calls don't have side effects
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <6B88A347-1633-47E4-A3CF-DC37738FED1E@gmx.de>
 <068286c9-d55d-d259-8243-5dfaf10cba5f@siemens.com>
 <C2B8E562-224D-4B4A-904E-23DA8DE3DFED@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9eef795b-8ecd-49de-3e97-1535003ba499@siemens.com>
Date: Wed, 16 Sep 2020 11:54:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <C2B8E562-224D-4B4A-904E-23DA8DE3DFED@gmx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 16.09.20 11:19, Oliver Schwartz wrote:
>=20
>> On 16 Sep 2020, at 10:28, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 16.09.20 09:12, Oliver Schwartz wrote:
>>> SMC calls may modify registers x0 to x3. To make sure the compiler does=
n't
>>> assume input registers to be constant, also mark these registers as out=
put
>>> when used as input.
>>> Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
>>> ---
>>>   hypervisor/arch/arm64/include/asm/smc.h | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>> diff --git a/hypervisor/arch/arm64/include/asm/smc.h b/hypervisor/arch/=
arm64/include/asm/smc.h
>>> index 1a5d5c8..e7b6723 100644
>>> --- a/hypervisor/arch/arm64/include/asm/smc.h
>>> +++ b/hypervisor/arch/arm64/include/asm/smc.h
>>> @@ -28,7 +28,7 @@ static inline long smc_arg1(unsigned long id, unsigne=
d long par1)
>>>   	register unsigned long __par1 asm("r1") =3D par1;
>>>     	asm volatile ("smc #0\n\t"
>>> -		: "=3Dr" (__id)
>>> +		: "=3Dr" (__id), "=3Dr"(__par1)
>>>   		: "r"(__id), "r"(__par1)
>>>   		: "memory", "x2", "x3");
>>>   @@ -43,7 +43,7 @@ static inline long smc_arg2(unsigned long id, unsig=
ned long par1,
>>>   	register unsigned long __par2 asm("r2") =3D par2;
>>>     	asm volatile ("smc #0\n\t"
>>> -		: "=3Dr" (__id)
>>> +		: "=3Dr" (__id), "=3Dr"(__par1), "=3Dr"(__par2)
>>>   		: "r"(__id), "r"(__par1), "r"(__par2)
>>>   		: "memory", "x3");
>>>   @@ -62,7 +62,7 @@ static inline long smc_arg5(unsigned long id, unsig=
ned long par1,
>>>   	register unsigned long __par5 asm("r5") =3D par5;
>>>     	asm volatile ("smc #0\n\t"
>>> -		: "=3Dr" (__id)
>>> +		: "=3Dr" (__id), "=3Dr"(__par1), "=3Dr"(__par2), "=3Dr"(__par3)
>>>   		: "r"(__id), "r"(__par1), "r"(__par2), "r"(__par3),
>>>   		  "r"(__par4), "r"(__par5)
>>>   		: "memory");
>>
>> Good catch! We likely have the same issue with our hypercall interface (=
jailhouse_hypercall.h).
>>
>> We should probably look carefully again at how Linux expresses these con=
straints: linux/include/linux/arm-smccc.h. That appears to me like we need =
"+r" for input/output registers and "=3D&r" for those that are just input b=
ut might be clobbered on return.
>=20
> I must admit that I don=E2=80=99t fully understand the =E2=80=9CConstrain=
t Modifier Characters=E2=80=9D chapter in the gcc documentation. Please fee=
l free to modify the patch as needed.
>=20

I had to read it 3 times as well, but I think I'm starting to=20
understand. "+" vs. "=3D" is simple, I guess. The relevance of adding "&"=
=20
to "=3D" may be clearer from this scenario:

Consider you are passing "+"(p1) and "=3D"(p2) to an assembly block. If p2=
=20
is only written after p1 was evaluated, the compiler can safely map both=20
to the same register. If p1 is only read after p2 was written (early=20
clobber...), that would obviously break - hence that "&" tagging.

What I do not understand yet is how our register assignment hints play=20
into this which map parameters to different registers. Maybe they just=20
create an internal conflict for the compiler and could in some cases=20
cause build errors. See also 2b9a200d6dba.

> The 32 bit implementation for smc and hypercall also need a fix.
>=20

Right. Basically, we need to mark all callee-saved registers in our=20
interfaces as overwritten or, if not input as well, also early=20
clobbered. If you have the time to write such a patch, that would be great.

Thanks,
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
jailhouse-dev/9eef795b-8ecd-49de-3e97-1535003ba499%40siemens.com.
