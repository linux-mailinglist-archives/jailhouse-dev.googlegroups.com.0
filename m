Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBE7GU35QKGQEAONPQ2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A69E273D18
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Sep 2020 10:17:24 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id s13sf4575758ljc.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Sep 2020 01:17:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600762643; cv=pass;
        d=google.com; s=arc-20160816;
        b=qWmRR+ZGVg+i57ZX2SPc2AdZ/PfahITvHmmZDhHhkCbw5P4H6wWE3NnM8KZArFCowV
         BEQ6c1H8lzsXRaKNCv+y/6kGZ+i2o16INlOBx9cx241W4nPly8MaaaMhmMrAZA7mCEiU
         SfLOtrcBAaRJ3P07XCnfMiYCeXqtFH+Rr/yRMd96DMCLj8m5ocRImLEqdwWr/wCaw7/j
         TRClhcVcQs3kBAfpyWvRsDNr422qBSSewm7g5YhDDW/nU7xv7edCnj2ySfuxJfMhMcfS
         651yo7Q7SPCOm+3QN+z0HOv4sdUmbvgoSV/7Yt2J2c8QmLSvXtH86Cy4QIS0no8NLPix
         DkMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:sender:dkim-signature;
        bh=iXWI5C/jg0+5LHULMwH4zKikeo0gzAvwkaxtd489l/0=;
        b=YnKch8P2ZMSGYe27tSMIfHLWhuPCY86lIFoxnyG4NbHmSu/u7hvJUySWO2GmEQrPZX
         pvA1i6ij3Il+6FJbQsBgP+WO3Mxqj/sQbBGUEir2z0V9e00c5gUq2kk2e3hBPY6t5xby
         HnhGrMBQ7Sx+qDC7t0bT2Vdz3qg9jjDNEyb31qDpMEW2UwPkr7qO8+rG9NNx85lYkyEQ
         qz4/L69rPKftlm9orSEgkfUyKPtR5NXRDghn4ql6C2pDNw9XEzsXV1Nvh4QCx35Tseyt
         HGjeTor9IvLjWcVisqYvDayzI0V6MNI/ZogeIDPBFwmxal4rMaL2OKpeSQhJIWoAKTHf
         q5aA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=iKTVufkj;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iXWI5C/jg0+5LHULMwH4zKikeo0gzAvwkaxtd489l/0=;
        b=mg2wJBdmUcs2Zh7AFqXE0PpmML0dMx/MpTrE//uooc8os3ROWyGh2/YE7EwrfIQDKX
         BrSCV5+WI4E8yTLP4aAKulOB66UDthpDjpZ7EYCM2Otj59BU0HlAd2F7lIyqIX6Bt4cE
         vcLFe8YR2d0/XeGTcoi2wuSB4gKY3VWsmaOA8Ku2cgF76uD64VNI2chJmiOR/LFGVc7v
         f9X1fowIvsDM1oWVumfx1lJl0/uCCyl7L1fvyLQj2xp2I4oUtVbc0ujqRslM5kSmYYWI
         C8/RcE6K4fC2T9NzIWE3YrL5/MMjyDJI/DV52PLoXImxFJqqjM7EMsUUkHlanVmvW7dH
         zdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:subject:from:in-reply-to
         :date:cc:content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=iXWI5C/jg0+5LHULMwH4zKikeo0gzAvwkaxtd489l/0=;
        b=Y5PpuUIg//CIFEntB5VU4YKxhfnWMUFQDljFNMdxDTR5Drbykga0iyBz7aR069ro2k
         fKTHNsA6aPARjyvj+4/jBBLRPc/8qX9Mqgmf/2+pelQZVhYk8bp18F8QSbkbBo/7PGzv
         17E7kn/j9EQHPOxCDfpBovjytZjqgGJ+C7VhAgFR7KOWeuYIQtrERGzH2dbCIeKk1L73
         G+Hq/+Eepabpp0LOwpyXCKusAdFtpoHjwyCipvmYerAA90x3hV3baDV4vFFmwzvkVVSj
         MfZN4QTS48YqRBb92RAILRDvmig2/hbOpuAMNxZ7pXy2uO5C1BioPt9JaNbRZWy57wFb
         UNyw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530oii8GJzKWuZEhC6RalhJYuHsrc9SGtKv6hZyiGXqCCC02ZO4N
	Arc3plYfY+UCLSNZCPCCFbg=
X-Google-Smtp-Source: ABdhPJyHUO82Zri/EPnLfeBycKMe68qUADhlOxQps9E0aENVMezdI9Mufc2l6GZV2qju4L2xKcKdww==
X-Received: by 2002:a19:3f91:: with SMTP id m139mr1359916lfa.439.1600762643794;
        Tue, 22 Sep 2020 01:17:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:544e:: with SMTP id d14ls1588412lfn.2.gmail; Tue, 22 Sep
 2020 01:17:22 -0700 (PDT)
X-Received: by 2002:ac2:43d5:: with SMTP id u21mr1391869lfl.135.1600762642515;
        Tue, 22 Sep 2020 01:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600762642; cv=none;
        d=google.com; s=arc-20160816;
        b=qZXQS4D6yb9imPxZEsSGpLkwATWbeQmhOLpESORuJ9/BGGjvEC8YRU7Fki/+HFexc+
         7ZNX+CW4AtLfc9MrN+V6Se82cKJR4CUoUjPtRXP+VYPsVPelY6UFQfMlawwbus/MHUbJ
         MCuSO2NcGWyE7OBWCP8JMU9L7OSQkaO7RGiiQI/tc/zh0sfo0YkUWu8q93oLrbGcx/GN
         wqi5Imewq8ms2yRIy2m1s6whj4z/OfLkAPXrCc3mYWZpl0+5/c2iUNZGrod6ZwNbH291
         pCGr9BGcL069novrt3LOa5+3yBmikkI88qj/zvC+FmE94DiLL00VMTTuL3yEOe4U4d+R
         wZ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=1tdl+JFWKkNyqhZYKo7hxT9MpNO4ACn08c51Aewzy8A=;
        b=zv4NhK5YyHbc+Zerba2rNlAlvjfyhHv2aLBmyx70V6DKVxjfxVcOhnVfC5UVFLE0Sn
         ps0ITrkPmPvCL4GLvfrQFCbN81tsedoi75tZluoZBbMMJasNHnKLep6cw1RuBYX2Rjl0
         NCEHdCxY6H9qvWjjgwDW1b3k7Ok1SLfh3jtHBm9HNw6HX8rK6ZSB2mmBytTESiXCUSbu
         dgGFGlMNr37geg5i6Imobxqrs79gNxW4XEi59lKePK5gs5OlEWg2/RthTjKbXNHmGzTz
         dzvxcVvIXva7z736c0tyWKhwEsesJff4j5zbAfrQqNK/77fJOCN+BVtgVwIR982dLN/O
         nnEg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=iKTVufkj;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.18])
        by gmr-mx.google.com with ESMTPS id f12si491798lfs.1.2020.09.22.01.17.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 01:17:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as permitted sender) client-ip=212.227.15.18;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from nethserver.fritz.box ([5.149.23.5]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7iCW-1kYGOZ37ze-014n5Q; Tue, 22
 Sep 2020 10:17:21 +0200
Received: from [192.168.2.64] (unknown [192.168.2.64])
	(Authenticated sender: oliver)
	by nethserver.fritz.box (Postfix) with ESMTPSA id 1A6922008E97;
	Tue, 22 Sep 2020 10:17:21 +0200 (CEST)
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH V2 1/2] arch64: Make sure SMC and HVC calls don't have
 side effects
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
In-Reply-To: <7fc7e7ce-4bb5-8a9d-7299-63d85db3d256@siemens.com>
Date: Tue, 22 Sep 2020 10:17:20 +0200
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <525A4B24-2A65-4671-B45F-35F146C7C520@gmx.de>
References: <C9905595-F658-4431-AF1D-F9ECDD38A20C@gmx.de>
 <9f124890-9d6f-0fe1-65b9-4a9f5185ed1e@siemens.com>
 <7ecaf35b-6669-143d-60fb-f7b63fb27d28@oth-regensburg.de>
 <EADE8BFE-2CA2-4942-80CA-CB40FDEEB71C@gmx.de>
 <7fc7e7ce-4bb5-8a9d-7299-63d85db3d256@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Provags-ID: V03:K1:L/6ib6X4ssHMG3jERAua5471xP+tDC98ny0RuRc8eHmsb4JCEC6
 ugaYnVmW0ziCJ1+2iClB+9t2FLpnlAWcRsKYTEpTwI13x4ZkuuwUwcxWRdLaxtYN4bGRXbn
 GFcs2ZEITSFDkQdEjmJuGne9ceHGYWtrI/xs7Ww5zdOy6lTqqOBghu9QiAP2LQSr7wNP55Z
 DTvzv9qubsp2cBuCH0/3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rnAYbx34/EE=:CBNuJVvwO5urAMdh5WdSxR
 Io5O51eYOWIBy6fSlqjzahzS9qyP2vCVS+nzz5Nan/bxxtV/fiZFkSlV94srUMAYDM2jRgmA9
 FNrwo/liSy7KRbpUiQQgKKnb7GFTpTEOgEDvjTneGIefyqbNLBIxmlg3QvBZm4av1rmabNfYN
 1MnIW5ZZo60blTjMavdZBGmSAHr0kZo19biAMr3JKifOw/8dSFfTPpKNUSVc+8YBYABWdztxA
 ZcZV25tIDndLS9ScGO2m7sCqI0JZe5u3OEuoaCk7xXWUi/Z9rTOzXIMRmG/6CA24zTjlItQL4
 q+fO+0sXwWufNGHyRxEsa9i3cmIx2sjJc954baPtkPJxhECxP7bdqokgzvwLOWe5BitKWpujU
 nSlKkuIcKopHysWLJ1hzFTvWuu+F5TA2lqwu8INQ4WGfZvw1NH54AQWms9f7coA+LTrOTLael
 CGazsObyL/OshvJpIlne0uuyj0kKbMQfzDjt4AWpvs+JoCb0JCyLYmnY+Ypp23xUNmA1dq/oN
 UHa4pV5enJg5DkhUNA61OZgXh01+Uwm07R/7heL4NHpoPvL+6r2gZuN+mdkNPwn47UWX74jUE
 TE1/ZKxv1r8J1AUO7Oa6iwl42fsHOx4hftZVm3nuT1WrFbcz2y3hrM00qeaqCM/dAUpZvNQGE
 +93X03telCwJkQic549F2l0KAWvzFxr/aIcQJCAEal5PopntVpdk4u1gn9DJvV5t+kvL+Fp5e
 pOa6xuCR0tNOPPiLKWGtiyJRZxEJK1SCFDfxHEKfLOewAINwJUgEov7UX5yLre9lcj7e4uY5L
 WlDf4andWXUdMJ5XyDHDvXszu/3e6M7ug1fi/33zOEHY5tlbVQPB92GwYLJQfUG8PieWoEs4o
 g86hh/iVd4nca2d+1iICOLq+URWbeQr7nRJp2zSXGYEd2Cf1+KGmueTU7ezaQGF8BJB/oqDQD
 HY3tCsAyALIY3zUEjkKXb1qrJ4GY0oOziyZuiYCFBFRamtQil4iETmRfaWWmVppY881i6OjU2
 hHoWOU/eZhlhtN5dkkFVW4FQrQXmciq/1CuBtXNx+4Ozpn3UqVHu1EOAHlwF5qtkwSXd7NVQX
 n3sede3N9LvXg7LepPJB5xcBAbj6vJ9ZPVVqHUHHYzY8HsS/BFFV6/g4wzdWgeLWnSHI9VKTP
 6onYCWXxVKKrdevtiT+8Gj4cyA8jHmP3bYqUSnk4JrJZdbQE55EIOQRNvKnuc/GQbnd2hlcqT
 DC2RUYM1yrO5rILEpTwU2GbgJ1LQodraL+TKHww==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=iKTVufkj;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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



> On 21 Sep 2020, at 10:23, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>=20
> On 17.09.20 20:14, Oliver Schwartz wrote:
>>> On 17 Sep 2020, at 18:21, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.d=
e <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
>>>=20
>>>=20
>>> On 9/17/20 8:26 AM, Jan Kiszka wrote:
>>>> Subject tag should be "arm64". And the patch should go over next first=
.
>>>> I can fix up both.
>>>>=20
>>>> On 16.09.20 15:07, Oliver Schwartz wrote:
>>>>> SMC/HVC calls may modify registers x0 to x3. To make sure the compile=
r
>>>>> doesn't assume input registers to be constant, also mark these regist=
ers
>>>>> as output when used as input.
>>>>>=20
>>>>> Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de <mailto:Oliver=
.Schwartz@gmx.de>>
>>>>> ---
>>>>> hypervisor/arch/arm64/include/asm/smc.h      | 13 ++++++-------
>>>>> include/arch/arm64/asm/jailhouse_hypercall.h | 20 +++++++++++--------=
-
>>>>> 2 files changed, 17 insertions(+), 16 deletions(-)
>>>>>=20
>>>>> diff --git a/hypervisor/arch/arm64/include/asm/smc.h
>>>>> b/hypervisor/arch/arm64/include/asm/smc.h
>>>>> index 1a5d5c8..c80fe15 100644
>>>>> --- a/hypervisor/arch/arm64/include/asm/smc.h
>>>>> +++ b/hypervisor/arch/arm64/include/asm/smc.h
>>>>> @@ -28,8 +28,8 @@ static inline long smc_arg1(unsigned long id,
>>>>> unsigned long par1)
>>>>> register unsigned long __par1 asm("r1") =3D par1;
>>>>> asm volatile ("smc #0\n\t"
>>>>> -        : "=3Dr" (__id)
>>>>> -        : "r"(__id), "r"(__par1)
>>>>> +        : "+r" (__id), "+r"(__par1)
>>>>> +        :
>>>>> : "memory", "x2", "x3");
>>>>>=20
>>>>=20
>>>> For SMCCC, I'm considering to align fully with Linux, i.e. convert the
>>>> remaining register clobberings into early ones, but I also have no
>>>> strong argument for it.
>>>>=20
>>>> Ralf, thoughts?
>>>=20
>>> Just had a look at Linux's implementation. And now I recall why I didn'=
t
>>> c&p it from Linux: it's an unreadable macro hell [1] that would benefit
>>> from being open-coded. But trying to follow Linux's __constraint macro,
>>> shouldn't we protect r2 and r3 as well?
>>>=20
>>> Linux would unroll __constraint_read_1 and __constraint_write_1, and
>>> __constraint_read_1 would protect r2 and r3 as well. We protect x2 and
>>> x3 via the clobber list -- is that enough?
>> I=E2=80=99m by no means an expert on arm assembler. However, I=E2=80=99m=
 quite positive that there are no physical registers r2 and r3 that can be =
protected in arm64. These are just placeholders that are translated by the =
compiler to x2 and x3. So protecting r2/r3 as dummy arguments or x2/x3 via =
clobber list is in effect the same, just more explicit.
>=20
> I've merged both patches to next now using your pattern. I applied some m=
assaging though. Please have a look at the result.

Definitely looks good to me.

Oliver

> Some consolidation patch for the hypercalls will also follow.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/525A4B24-2A65-4671-B45F-35F146C7C520%40gmx.de.
