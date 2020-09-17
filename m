Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBHM2R35QKGQEMRJHJRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63c.google.com (mail-ej1-x63c.google.com [IPv6:2a00:1450:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A7C26E083
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 18:21:49 +0200 (CEST)
Received: by mail-ej1-x63c.google.com with SMTP id ml20sf1069602ejb.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 09:21:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600359709; cv=pass;
        d=google.com; s=arc-20160816;
        b=pOSPhlewuFIztnkDRV0NC9I1a7mQBrYxGk9U1lfFZPtfTr4nvK+boBsAXRs4rbksCu
         umxCcUDa7nvHn4pwrdsAXfO5DtVjVRPDXmc2GYrsApJOsm/unoHwKxd42L2G29oAPt8e
         RfAvw73r1mQk3pp1EQjDQXDMd2TQNhPLhRmjaPTTAxh4pD3XKvIVe+fztNrd5xOJ6UeP
         6Kj2Hzw7FRuDIJOt4n9zSzg5VwEX7X6rJL0b395upBu/Mzt5YRR0E0VJ6ChMRuh+JwbF
         fIlmny96HrFCey7WGDa5CN/H9+gPsoq/Ck0JxxJbSqjzReMBVUPFi75F+IqBomOsHKlD
         vJhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:autocrypt:from:references:to:sender
         :dkim-signature;
        bh=ZabgjM2obHmqqp5NIJFiMWkNlMN66Z4uksXpzXAVNv8=;
        b=nKrGIJK2RBIip94cNAWaxPgU/7D7XxrWC7jnKP8YDDXWqqVvTi6x3BO/+bXzWaaRTQ
         AZ+kNX+qqoRRngHzmAnWMDkdyITlMMiBCiP24WcUqmQHxAojuCF77FCCQZPVVBjpZDg7
         /RoRWlKjPOYNuSvqNn+iJC3AVPQTV4j2IBdiAgQ3pu93jTanxX9BQ7qYfMND4Nr29ilA
         Or4X+8Q0d7MIxqAmWt5+oGW+pB8urDYs/QWdzqu57mWnkhxWc4kNj8m38KYE/pRMRZht
         X94WzqYXUNG070FG5eMcLHWrhMStlJYED4XDore2GvJxAkbfzquUHxH79Edoogn/GXFq
         ip/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IiKKbEPc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:references:from:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZabgjM2obHmqqp5NIJFiMWkNlMN66Z4uksXpzXAVNv8=;
        b=iyvbEgHIvX/zjdk12NdrSc29yISH0oJ6zzQLwaoIRMIHKwWaq3Be8oB+qyrL+JOXD0
         jh8S0TCcmaoK8jjh027Prrk+YGGH6V6ZVyhCyCEaL0XiSlLIiUOs2savkmDMvs5eIKW1
         DXGLjK+fKBNjuHWQO7qFPlu+1eKRl4nmfKm0bZCGCNyxjxzexPSq9sijEps251nryTNw
         TgI4k7FomXn+IJ0n2D4tK48Y2oIJA76iAQwaX/ZITM1GSd/sJHVfzgv9qu9joBgWzUFw
         8gw3+EeRtKev3VMPr+bohGWP7yF8vRQ/lZLm0P9p/kihItCgHbqR8iPskMz4BWgXoP3c
         zY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZabgjM2obHmqqp5NIJFiMWkNlMN66Z4uksXpzXAVNv8=;
        b=pF/pdVe7YN2OULh6p5c4YIvPYkFPhu32nrgmBhpgXcJFwzgxrlfvdg2SsXEktOJ97F
         IzLjj2dyQULgFWcD/QpITvRk/N69iqWCiRhV0qo4Nkwh8q3wIgf5BgjpOfynyBQcnd2x
         nuvoOb356yeOHVnnlqvR85W0kVH2uBRX67pQge2jFhtk4y7nZFPoKgzqTsFPg+m1ncrN
         5bmihXkWc1JT3BKtcuptpOrpE4e0FARocpcQ0F6CiSKZlw+zfXFGR2/2g8nybLTTNjp7
         kG/FDcv/cuZVaOaWuZg1aaddGrYIjVo8IlhlYwXatHGSVSjvYCPXtKZrd5oiuMPWP62q
         HEUQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531jdD1M/eQYVnT/T0Lk/FtaJ5VbVMDMh0ovfTdLqytbeB3QkhhL
	hgZb1uZN/gkw3e8zeespfqU=
X-Google-Smtp-Source: ABdhPJwuGMJJv6Mef3c5wsYcEfXgaAdZNzntlVnWiFkDuiUeK9RE+++R91Hz5BJMuAITsTqnv0wygA==
X-Received: by 2002:a17:906:5611:: with SMTP id f17mr33253212ejq.427.1600359709575;
        Thu, 17 Sep 2020 09:21:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c9c2:: with SMTP id i2ls502018edt.2.gmail; Thu, 17 Sep
 2020 09:21:48 -0700 (PDT)
X-Received: by 2002:aa7:dc08:: with SMTP id b8mr34977785edu.271.1600359708437;
        Thu, 17 Sep 2020 09:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600359708; cv=none;
        d=google.com; s=arc-20160816;
        b=NSFiXWaS8kRRndZXz7fwDIOBOtIfYDizjcBjkhprsa+PQ11eZzdhuE6Uzo+1BPYfjS
         tEBOQjGQk8X4RJNDEt0GMQpBDrDSKJdSzw4qiqBQeyV9B6itErQ4RKtI7R+mTIDndig4
         iME0TJaPdkzaacfBjMDNbhncGfWe/+6gHsWaW0cKg5Ef8qEFRJ5PEzCvvhv+CZaoX5jZ
         C9rSSkMNsgiMuPHV9y8APw1rkaWLECFINQG/XA0MQpghrWzSEsrXZ5EC50su/2fQbavw
         jJdz9TX9V6iVOOiJ6BEqAcA/UbKZhRN+j8t8hv0v95lfMgZVU0XecSNJxHZMgxmQ9YqI
         P62A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:from:references:to
         :dkim-signature;
        bh=nKmoH11ofda5VZ4Fw2sc48iuEXMREffqAZgDlIHdNKI=;
        b=1BK+DNAYk4eaMnHpMiFRbem+F+Swnc89q/ozYwr4m+jnlLqJmVCMHBJaVzziaHiaKR
         lEU/DFwRovXmo0A/G58PTyP4YqOjH2pGLSZinBOCOjc6gOv1lkVE/rRyv7htIomv00hh
         vYp27PFeRmlj5L1EiclWfdS+5k8GdzGkSNYx2Wd0GzgX+zKdknjgwCpqVWhbk7B3sBNr
         CQkG5nBntQhM75oC1jZSd0yrchAN0BIt5ym8xo+dlgT/C15oscBB8D6eZFrhSSydfj++
         TwGz334OFLm63mfBvO3lpmivQU29MJLRfJHnsxJsmV1EcRARmw9yQuuvtzKB8euJIiV7
         JndA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IiKKbEPc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id f17si10855edx.5.2020.09.17.09.21.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2020 09:21:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Bsj0C5Xb2zy0M;
	Thu, 17 Sep 2020 18:21:47 +0200 (CEST)
Received: from [192.168.1.18] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 17 Sep
 2020 18:21:47 +0200
To: Jan Kiszka <jan.kiszka@siemens.com>, Oliver Schwartz
	<Oliver.Schwartz@gmx.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <C9905595-F658-4431-AF1D-F9ECDD38A20C@gmx.de>
 <9f124890-9d6f-0fe1-65b9-4a9f5185ed1e@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: Re: [PATCH V2 1/2] arch64: Make sure SMC and HVC calls don't have
 side effects
Message-ID: <7ecaf35b-6669-143d-60fb-f7b63fb27d28@oth-regensburg.de>
Date: Thu, 17 Sep 2020 18:21:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9f124890-9d6f-0fe1-65b9-4a9f5185ed1e@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IiKKbEPc;
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


On 9/17/20 8:26 AM, Jan Kiszka wrote:
> Subject tag should be "arm64". And the patch should go over next first.
> I can fix up both.
>=20
> On 16.09.20 15:07, Oliver Schwartz wrote:
>> SMC/HVC calls may modify registers x0 to x3. To make sure the compiler
>> doesn't assume input registers to be constant, also mark these registers
>> as output when used as input.
>>
>> Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
>> ---
>> =C2=A0 hypervisor/arch/arm64/include/asm/smc.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 13 ++++++-------
>> =C2=A0 include/arch/arm64/asm/jailhouse_hypercall.h | 20 +++++++++++----=
-----
>> =C2=A0 2 files changed, 17 insertions(+), 16 deletions(-)
>>
>> diff --git a/hypervisor/arch/arm64/include/asm/smc.h
>> b/hypervisor/arch/arm64/include/asm/smc.h
>> index 1a5d5c8..c80fe15 100644
>> --- a/hypervisor/arch/arm64/include/asm/smc.h
>> +++ b/hypervisor/arch/arm64/include/asm/smc.h
>> @@ -28,8 +28,8 @@ static inline long smc_arg1(unsigned long id,
>> unsigned long par1)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register unsigned long __par1 asm("r1") =
=3D par1;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ("smc #0\n\t"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__id)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r"(__id), "r"(__par1)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+r" (__id), "+r"(__par1)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory", "x2",=
 "x3");
>> =C2=A0=20
>=20
> For SMCCC, I'm considering to align fully with Linux, i.e. convert the
> remaining register clobberings into early ones, but I also have no
> strong argument for it.
>=20
> Ralf, thoughts?

Just had a look at Linux's implementation. And now I recall why I didn't
c&p it from Linux: it's an unreadable macro hell [1] that would benefit
from being open-coded. But trying to follow Linux's __constraint macro,
shouldn't we protect r2 and r3 as well?

Linux would unroll __constraint_read_1 and __constraint_write_1, and
__constraint_read_1 would protect r2 and r3 as well. We protect x2 and
x3 via the clobber list -- is that enough?

Anyway, I think we can trust Linux's implementation, but Linux's clobber
list only consists of "memory" and protects registers via operand lists.
If anything would have blown up there, someone would have probably noticed.

  Ralf

[1]
https://elixir.bootlin.com/linux/latest/source/include/linux/arm-smccc.h#L2=
93

>=20
> Jan
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return __id;
>> @@ -43,8 +43,8 @@ static inline long smc_arg2(unsigned long id,
>> unsigned long par1,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register unsigned long __par2 asm("r2") =
=3D par2;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ("smc #0\n\t"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__id)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r"(__id), "r"(__par1), "r=
"(__par2)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+r" (__id), "+r"(__par1),=
 "+r"(__par2)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory", "x3")=
;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return __id;
>> @@ -62,9 +62,8 @@ static inline long smc_arg5(unsigned long id,
>> unsigned long par1,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register unsigned long __par5 asm("r5") =
=3D par5;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ("smc #0\n\t"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__id)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r"(__id), "r"(__par1), "r=
"(__par2), "r"(__par3),
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "r"(__par4), "r"=
(__par5)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+r" (__id), "+r"(__par1),=
 "+r"(__par2), "+r"(__par3)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r"(__par4), "r"(__par5)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory");
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return __id;
>> diff --git a/include/arch/arm64/asm/jailhouse_hypercall.h
>> b/include/arch/arm64/asm/jailhouse_hypercall.h
>> index 108d052..a9d13ee 100644
>> --- a/include/arch/arm64/asm/jailhouse_hypercall.h
>> +++ b/include/arch/arm64/asm/jailhouse_hypercall.h
>> @@ -42,6 +42,7 @@
>> =C2=A0 #define JAILHOUSE_CALL_NUM_RESULT=C2=A0=C2=A0=C2=A0 "x0"
>> =C2=A0 #define JAILHOUSE_CALL_ARG1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "x1"
>> =C2=A0 #define JAILHOUSE_CALL_ARG2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "x2"
>> +#define JAILHOUSE_CALL_CLOBBERED=C2=A0=C2=A0=C2=A0 "x3"
>> =C2=A0 =C2=A0 /* CPU statistics, arm64-specific part */
>> =C2=A0 #define JAILHOUSE_NUM_CPU_STATS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> JAILHOUSE_GENERIC_CPU_STATS + 5
>> @@ -54,9 +55,10 @@ static inline __u64 jailhouse_call(__u64 num)
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile(
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_CALL_IN=
S
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (num_result)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (num_result)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+r" (num_result)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory", JAILHOUSE_CALL_A=
RG1, JAILHOUSE_CALL_ARG2,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_CALL_C=
LOBBERED);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return num_result;
>> =C2=A0 }
>> =C2=A0 @@ -67,9 +69,9 @@ static inline __u64 jailhouse_call_arg1(__u64 n=
um,
>> __u64 arg1)
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile(
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_CALL_IN=
S
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (num_result)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (num_result), "r" (__a=
rg1)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+r" (num_result), "+r" (_=
_arg1)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory", JAILHOUSE_CALL_A=
RG2, JAILHOUSE_CALL_CLOBBERED);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return num_result;
>> =C2=A0 }
>> =C2=A0 @@ -81,9 +83,9 @@ static inline __u64 jailhouse_call_arg2(__u64 n=
um,
>> __u64 arg1, __u64 arg2)
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile(
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_CALL_IN=
S
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (num_result)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (num_result), "r" (__a=
rg1), "r" (__arg2)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+r" (num_result), "+r" (_=
_arg1), "+r" (__arg2)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory", JAILHOUSE_CALL_C=
LOBBERED);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return num_result;
>> =C2=A0 }
>> =C2=A0
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7ecaf35b-6669-143d-60fb-f7b63fb27d28%40oth-regensburg.de.
