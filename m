Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZFBQ75QKGQE56674VA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id E241326BFA1
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 10:46:28 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id b12sf2183905edw.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 01:46:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600245988; cv=pass;
        d=google.com; s=arc-20160816;
        b=k4KFiQHJsC7o5WBA70vvOVFv7WpUnhmEOvKJfdQCbaLXu0U6G7A1C0aeIjfeE/wg4e
         jbnoSXPwoMDvTP9GoCByFI9TGqe8/BGc778ld5zWBttEkw4qkpoKLaTizZfUEnWXkWc4
         U49D03D9WnHKYp1PIXO2E2JvpqdEImbUtoJqUVKeWNADPCBSKhEc/PDa8WmeS2hCebPS
         WNLLaXASu7XXNNtlHM4BdLA++HfC2armiCa+xX8AnEHoKhw8ElJ58M27wBDjIg5Xir/T
         fcV5wPGWjIFjyerx+a/KxFtbz1POw2TJ/o45liTbA8w3ier9+qcPavKY9r3Y5l67q79e
         Sn4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=t3iRtE+DP4YGT/WnlgXl5ZROMbquUwoPaasjd95snWc=;
        b=BxLkdtdU6CxX9kbj1HbmbVln0fRHp4qlYDIa6Al0VS05GWLB0orzMh491nuT1oKTn7
         Sz8CDuhrsezwf50uScp3pgr9pTKc8tbf//2MQfwBSJ6xaK9uSqiMHB9CkIvoiBCxuREU
         FnTvqtdbrlHKLvkt62hvoczEsYPAroQTefHe0RwLvtO54PiY75/FFeuEOUM8gchN6Wlj
         TeCzhZYwVt+BgMRAtObZXasAb9OROfBYo0gXBJqpjW1Vb5iE4omwAsAot9Dd2CCDxCck
         PrjN+ZvNnepvUzBwBLrpFsH6Tok9PdQ1StQfIHAwsBmpRpr/b+TduuLiUqj06jUdHPla
         wNzQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=t3iRtE+DP4YGT/WnlgXl5ZROMbquUwoPaasjd95snWc=;
        b=ZbqksDFNZ6z6RaDMEIdVLX6//pWMm/9QWB4XASP5E6F1RVoDsUyo1SKXy84daG1Zjw
         gabKAyjH209WC9chE3MrjHzLk+HPMA4Nph73/q/DnuIFMaN4b78Lbc5RQSvqPAwsmOwy
         KGNEDQS0MaYoCkJf0wZhgDwgJXiQd5lF5cPfKteFjC+odxNgnGssZ3EdczN+XdSjsoOY
         8m3fwSZxRNFcPRHM14PZUll3PBqlBCC4eL7+mNCPCGCWrVICw2wnjIn7J+EvE4iEXLjy
         HMT34dXMuJR/z+0zA2ul/gaiEKjaVZTc6m0Dt3SoMZeCUc46qkdgauSdz8FkW6k3MSZm
         sPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=t3iRtE+DP4YGT/WnlgXl5ZROMbquUwoPaasjd95snWc=;
        b=PCT+W5JaUKt0F7E9zC3vqcUbx5fT2vIMrFpN2FAd2VYaH1Nc40yOmv4avAmuui8ohT
         8u5Ry6xtiZg8Pp5DQBs21IFJ6Fi1iHsS/XdR5tTZHuP+cBDBXanzQEYu06uFhaRcPvr/
         6A9eY4HWhRB7GqJRG+MfgUwrdbv6uWHoRDD21KrUBq6CXnjOOuQ02lHxr0vAfp5CVeWo
         XVEEaPghYOnfuqHaas7AjAi0qsMBpbMQiWa2JI2Sh1B2f7T8zjGYerwRa/m6Q4zcsb+s
         XCTT00iU7Xb++XL9D5TFQDfgBEFWP2qo2B+oeo1A/yJSW0IrjrJULNRI6D/6nlIPWit8
         wyYg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531VXa5DEFnjm4YBOdYcYzJ6SiiGOVhiJEd/fR0GbRru7cdfGYK2
	sgvHj6AdoUJROUrD2EhZ744=
X-Google-Smtp-Source: ABdhPJzsLIa+sM9Nk9mYMz1XSQDmWnb9u28XHUXkHEx05gDSSLggmgDkLRHCScBkTf8DKVR9RIBbig==
X-Received: by 2002:a17:906:4805:: with SMTP id w5mr17493311ejq.313.1600245988657;
        Wed, 16 Sep 2020 01:46:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d0c8:: with SMTP id bq8ls674059ejb.3.gmail; Wed, 16
 Sep 2020 01:46:27 -0700 (PDT)
X-Received: by 2002:a17:906:a88a:: with SMTP id ha10mr25729629ejb.532.1600245987539;
        Wed, 16 Sep 2020 01:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600245987; cv=none;
        d=google.com; s=arc-20160816;
        b=mi6jga9o7H15C5DsX+u7Ojq3QZNnzFXuocD9tsYEDl4cNpyU0+x0uMjrPjQU8mFjFo
         0EdwM8ye5VO6UzNEw2zYqHptl20LtQitJhIGY2XB0x2pR45GccgoN8cSzBvhHM0nZEoK
         GCWtN9WLPJ4L/JtN8VqKTBhlPL3paWLsmjn6IgQfmgeSfLB9QVb+/s5QxaVBeUy/4BXg
         D9uDkvcWPgDtWEZkwzKw4UZ5QbqPfpE5Me6EYLsHqiRN4koESwreEHmnwGI88VefRZ3E
         WbGDtk1ZplLVH0gDjFWZ+PwOQ53cx0lDr8hRA86wzLSU3bV8KLv1qx8wG1m9rfmRfJBG
         cZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=+Jcw2bERMuIwq+4KLcYD+ll7LP+l+npB6pXu6GwX3fI=;
        b=czUPKNCeALHSvsLvoY3CdjexAoiWIimrzDoSmZpg519R01BZyBJwULf608ZJWiP/ZX
         QPqZRvkqqSYPMpFPImsdyaqbjxXxcTa4VQ6m0zIhYwmeag/A41wu+QazTKMkIXl+OYeo
         UM91sqk87ajHD2h+bDGTJ+2ecXEgoi1V2la+khWF1AoryzqmlhJpPUkQk9+XzsVaOSuv
         1nao0+Qg0RnXuvQBEmk6lRN6+ZEh2pIx3JuojmSx3WsofhwjRLLyAOalHeGS2jWdWyyw
         ma7NcDuqhixr5CHALEcTMXgIe2HIc58fI7+N8MPjfm0Zw1nLgLOvDrBIBS5nMd611qsS
         qUTw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a16si834504ejk.1.2020.09.16.01.46.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 01:46:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 08G8kQl6019880
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Sep 2020 10:46:26 +0200
Received: from [139.22.115.152] ([139.22.115.152])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08G8kP0B024383;
	Wed, 16 Sep 2020 10:46:26 +0200
Subject: Re: [PATCH] arm64: Make sure SMC calls don't have side effects
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Oliver Schwartz <Oliver.Schwartz@gmx.de>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <6B88A347-1633-47E4-A3CF-DC37738FED1E@gmx.de>
 <068286c9-d55d-d259-8243-5dfaf10cba5f@siemens.com>
 <7563d5ba-1a08-8452-81c8-1969ddcca125@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1416a914-d2ea-a67e-579f-870bf6406bc5@siemens.com>
Date: Wed, 16 Sep 2020 10:46:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7563d5ba-1a08-8452-81c8-1969ddcca125@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 16.09.20 10:40, Ralf Ramsauer wrote:
> On 9/16/20 10:28 AM, Jan Kiszka wrote:
>> On 16.09.20 09:12, Oliver Schwartz wrote:
>>> SMC calls may modify registers x0 to x3. To make sure the compiler
>>> doesn't
>>> assume input registers to be constant, also mark these registers as
>>> output
>>> when used as input.
>>>
>>> Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
>>> ---
>>>  =C2=A0 hypervisor/arch/arm64/include/asm/smc.h | 6 +++---
>>>  =C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hypervisor/arch/arm64/include/asm/smc.h
>>> b/hypervisor/arch/arm64/include/asm/smc.h
>>> index 1a5d5c8..e7b6723 100644
>>> --- a/hypervisor/arch/arm64/include/asm/smc.h
>>> +++ b/hypervisor/arch/arm64/include/asm/smc.h
>>> @@ -28,7 +28,7 @@ static inline long smc_arg1(unsigned long id,
>>> unsigned long par1)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register unsigned long __par1 asm("r1")=
 =3D par1;
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ("smc #0\n\t"
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__id)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__id), "=3Dr"(__p=
ar1)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r"(__id), "r=
"(__par1)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory", "x2=
", "x3");
>>>  =C2=A0 @@ -43,7 +43,7 @@ static inline long smc_arg2(unsigned long id,
>>> unsigned long par1,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register unsigned long __par2 asm("r2")=
 =3D par2;
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ("smc #0\n\t"
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__id)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__id), "=3Dr"(__p=
ar1), "=3Dr"(__par2)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r"(__id), "r=
"(__par1), "r"(__par2)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory", "x3=
");
>>>  =C2=A0 @@ -62,7 +62,7 @@ static inline long smc_arg5(unsigned long id,
>>> unsigned long par1,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register unsigned long __par5 asm("r5")=
 =3D par5;
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ("smc #0\n\t"
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__id)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__id), "=3Dr"(__p=
ar1), "=3Dr"(__par2), "=3Dr"(__par3)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r"(__id), "r=
"(__par1), "r"(__par2), "r"(__par3),
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "r"=
(__par4), "r"(__par5)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory");
>>>
>>
>> Good catch! We likely have the same issue with our hypercall interface
>> (jailhouse_hypercall.h).
>=20
> Yep, thanks for taking care, my bad!
>=20
>>
>> We should probably look carefully again at how Linux expresses these
>> constraints: linux/include/linux/arm-smccc.h. That appears to me like we
>=20
> Ack.
>=20
>> need "+r" for input/output registers and "=3D&r" for those that are just
>> input but might be clobbered on return.
> ... And we should probably first introduce the fix on next, and directly
> squash changes to arm64-zero-exits.

Yes, "next" is prio.

I'll soon make the arm64-zero-exits branch ready for integration as well=20
(as soon as I get my damn ultra96-v2 board with its f...ine wifi=20
working) and will rebase it meanwhile.

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
jailhouse-dev/1416a914-d2ea-a67e-579f-870bf6406bc5%40siemens.com.
