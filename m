Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB5U6Q75QKGQEWATL3UQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCF226BF85
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 10:40:23 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id f22sf2109464ljh.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 01:40:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600245623; cv=pass;
        d=google.com; s=arc-20160816;
        b=rrmeWL4Fj3aH4z2pb4K1cfqLQvy9/qw+78d2VBDEoqxDwXgX4R0vMRXJn+bJ+HeqJu
         HgBtevLgq+1nezycGRP34zzOiPQ17oYTrkchQkWia6/HT/MTdVkfiscfC+lHhqCs10WO
         HXn9W3gKTgeOO80b3Exd7nnZBYtNujNdwaKqja8SRow92lo3kE1YOa6CeHoBMGuyF2lT
         WAJAD6WVDwAmt4gzOZ1lwRYMpPFPJoJPoIBzdpJoKWXfvNjXMRq2cN3quTRTmBT2oLGS
         fbui5Il6dH8yRPDY9DgueWmKHtusCoUxDMZpiopikr8SldksYyT6aD7EVRq+s3T4Q1tG
         /osA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=Cl01XevSRjLvQRtb9XNYekBJHL8U8cpD/zrAioRpAvI=;
        b=kwgv5Apd1F4n5uKIAmRF3XT3Xpm//5T9SqSx87BU2kV4BiA+QKgsORSyywLMeRjMqx
         EJd9VXErLroPyaLMI7cZoizfr44kirxwcnI8wNrQVntMNZkG3ldmAYXBbXrZRzdI/Bzh
         4YP7pImz9z8/8732SBEAdzntNUYF7LqDxqNN9rKUb8P2a8xkMs+7+FqXb38SKy+zIbFf
         4B+Qzp+duNwAlGEgrEnE8thk0VQ8c/xSFhiQ0AucgyP4yTmJilZ1KAwNaFDv4Pf/P1y/
         64OaVufeJHvNgO4dNkogkeCrjJ2EflSbr5g2Kpw4YtL8eGX/dqXZc1e7zqT1Xji4ebbu
         5DAA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=q7gdxmW9;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Cl01XevSRjLvQRtb9XNYekBJHL8U8cpD/zrAioRpAvI=;
        b=Dcsoymwkd7PE4BHK1RZ5jzayXIkBtz5lM9k49wNjOUuhYO7/gMKCQftxfd6/7rqdZ1
         8ISz+FKZAsP/+VFqBfPXvEIK7i8PGW//Lp3W8/23E5yLsyBrTRt4oxbFOnr+vS+u32n3
         sEtLgU6TvBTRg79BheNRpIkI/m11wqNnJSFmwCK/20K3UZBZkmDaXaxt96m047GaBgK+
         g3Ueqa6gDFU5RHT+tEpTPx/Y3vKSvM2g5K6xf1mBUmurV6gTWnzxbgali3Dj9oIhd/DM
         owJpnKgkMWH1NpxjPxNjJ0NfDqcznxkbb3pZpP/JyShscpfUOi6R/AoT7+wMgwbK84mc
         9QCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Cl01XevSRjLvQRtb9XNYekBJHL8U8cpD/zrAioRpAvI=;
        b=X+KOZoH7+BhW7WQpOvhw/szlshbVgDO6LMedIQXQFA0VLuI0e8VH9jvgpjdhUMTc8b
         pjEsn8YsY0ZGoiOA/J3yekMEZ8tvhRFntbmMu7BVU34hkZlIn3JEAMn/oE9RAhaMYDuc
         QCmLmvguVZEE4aSG7YshR0CuaInVeQNecIyPQBW779wZEHHW7brN2EJN0Mr0F1XZE7wi
         G0HeeyGFGqcsDhUFu9j1ayCVP/qVFTI4qUpVrckOJdvNK29vmY8DzSc+zSvguhaknFQm
         c9NE1FJ3Cz79izhV4qmHhAiqnrhtpG6S3YOIRUVSzo9wpDRwllf+x0vTQ4slsbzSI6Bv
         pvnw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533DEC6NfBSw9oG+nmyQK5oOIKrYlGDbn99zG5NdGIFdkmIkUFBl
	bcnMQj/tiKmO3lxNfXPPGo0=
X-Google-Smtp-Source: ABdhPJwjdVzGsm+UXiSInAUKAxQfN/sQpHCtAlyJobhzIWq7dTi2wy5R+mX2j92p8eQkm8d44uryMw==
X-Received: by 2002:a2e:81d7:: with SMTP id s23mr8716167ljg.69.1600245623053;
        Wed, 16 Sep 2020 01:40:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:544e:: with SMTP id d14ls302322lfn.2.gmail; Wed, 16 Sep
 2020 01:40:21 -0700 (PDT)
X-Received: by 2002:a05:6512:36cd:: with SMTP id e13mr8455521lfs.165.1600245621827;
        Wed, 16 Sep 2020 01:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600245621; cv=none;
        d=google.com; s=arc-20160816;
        b=Yh3hUzMOWNEyI3rW0WdqzGXr0Lnxo4pkHliQN2ldlhy/FfjMdJKuSTIiBBeSy7BPTV
         EnF4KCKKMsm/8jvllEuXpVviFBzpsfjXRGgInFuvzXgW5krUjsgL0N+epW/T9vEO7VHH
         LMuLeGoz1mEwGY7b5G/uq4tW5qq2NfJM7PbVjR3jFZqN1KIs6rIbeigeVCgnpeaEmOwG
         4kfCcsI64ieJM4BA3s0v5BSXyf5UBarNqVWHxP3Gy6pjBRSrndl5a2NutjOIm8extuWi
         F1gZ3qZKEqF7qo/MTk5JqMb3N4ktpEc+4CYNqCoZwvGUzFNpkIsuk7ZbK/olTEWe3SIM
         AVJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=/CQ4F0DFgosYDocMFIoa6KltFHgDurSlQWBBfq/u0Qo=;
        b=X6bxbysT142zuzvHN9gW8OZ3YJf1moAOkZwSH9n54149LYDzRNjdtE1W3k7XnffaIS
         xFhN0SENj4j+9p1QiziKyWx6MYhhZFD+KoYmANCYNfSTsVenLlrf5Ke+uO23hG+C17/+
         wPSk2lSm+TaOPxesHsissA+6tPLkl0zmNQpMteapYoWHU/SXpzEgwA0IfHGFRrqd/wRv
         rSW5wLLKnVi6sLK/xqaqHJc4ciR3uG/k55Km1RgcuOY8Q0IFz3C0MGBagNF1CUzemhyL
         Uo2qUmSYtVW0yAWseMu7n9UdqfODK45ge4DH32fWybOHGfHxcRHuM0JUIsnUzgAqEuQI
         YBQw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=q7gdxmW9;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id k10si566864ljj.0.2020.09.16.01.40.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 01:40:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4BrtpD6CNdzyhT;
	Wed, 16 Sep 2020 10:40:20 +0200 (CEST)
Received: from [172.20.9.166] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 16 Sep
 2020 10:40:20 +0200
Subject: Re: [PATCH] arm64: Make sure SMC calls don't have side effects
To: Jan Kiszka <jan.kiszka@siemens.com>, Oliver Schwartz
	<Oliver.Schwartz@gmx.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>
References: <6B88A347-1633-47E4-A3CF-DC37738FED1E@gmx.de>
 <068286c9-d55d-d259-8243-5dfaf10cba5f@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <7563d5ba-1a08-8452-81c8-1969ddcca125@oth-regensburg.de>
Date: Wed, 16 Sep 2020 10:40:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <068286c9-d55d-d259-8243-5dfaf10cba5f@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=q7gdxmW9;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 9/16/20 10:28 AM, Jan Kiszka wrote:
> On 16.09.20 09:12, Oliver Schwartz wrote:
>> SMC calls may modify registers x0 to x3. To make sure the compiler
>> doesn't
>> assume input registers to be constant, also mark these registers as
>> output
>> when used as input.
>>
>> Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
>> ---
>> =C2=A0 hypervisor/arch/arm64/include/asm/smc.h | 6 +++---
>> =C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hypervisor/arch/arm64/include/asm/smc.h
>> b/hypervisor/arch/arm64/include/asm/smc.h
>> index 1a5d5c8..e7b6723 100644
>> --- a/hypervisor/arch/arm64/include/asm/smc.h
>> +++ b/hypervisor/arch/arm64/include/asm/smc.h
>> @@ -28,7 +28,7 @@ static inline long smc_arg1(unsigned long id,
>> unsigned long par1)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register unsigned long __par1 asm("r1") =
=3D par1;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ("smc #0\n\t"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__id)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__id), "=3Dr"(__pa=
r1)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r"(__id), "r"(=
__par1)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory", "x2",=
 "x3");
>> =C2=A0 @@ -43,7 +43,7 @@ static inline long smc_arg2(unsigned long id,
>> unsigned long par1,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register unsigned long __par2 asm("r2") =
=3D par2;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ("smc #0\n\t"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__id)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__id), "=3Dr"(__pa=
r1), "=3Dr"(__par2)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r"(__id), "r"(=
__par1), "r"(__par2)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory", "x3")=
;
>> =C2=A0 @@ -62,7 +62,7 @@ static inline long smc_arg5(unsigned long id,
>> unsigned long par1,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register unsigned long __par5 asm("r5") =
=3D par5;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ("smc #0\n\t"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__id)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__id), "=3Dr"(__pa=
r1), "=3Dr"(__par2), "=3Dr"(__par3)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r"(__id), "r"(=
__par1), "r"(__par2), "r"(__par3),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "r"(_=
_par4), "r"(__par5)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory");
>>
>=20
> Good catch! We likely have the same issue with our hypercall interface
> (jailhouse_hypercall.h).

Yep, thanks for taking care, my bad!

>=20
> We should probably look carefully again at how Linux expresses these
> constraints: linux/include/linux/arm-smccc.h. That appears to me like we

Ack.

> need "+r" for input/output registers and "=3D&r" for those that are just
> input but might be clobbered on return.
... And we should probably first introduce the fix on next, and directly
squash changes to arm64-zero-exits.

  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7563d5ba-1a08-8452-81c8-1969ddcca125%40oth-regensburg.de.
