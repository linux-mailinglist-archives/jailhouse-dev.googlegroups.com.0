Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBHO4Q75QKGQE2COUJWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECD826C1E5
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 12:51:10 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id r6sf1025267lfn.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 03:51:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600253469; cv=pass;
        d=google.com; s=arc-20160816;
        b=FRCZpnUzafGmgycf8+ctT3Vo+TRzQJMYFe/JJRqGeLTCBLdIBX+0Dcgxv9UH9pPPnT
         TgyHjtZcWWIFiHTUA/532sktAsTPh6K0OP0+Ht/oM1UjXq0ghmyZWkihtyiZGZoZ6iFM
         aBSq4TtmxDn4VHiVvSOBlZpAyDhxZEI4Bh+Ys8jdRAmPNDrJSnuF+X/06CFG/FtRsP/S
         mfreASPb0dMODe+DfOr7tFpMzogjuXaFsv84rUkMhSQ6lxCa1KMnbTEEwoFTfgqhOwXx
         2yyPHnE2vP1f9WW1m2/b8MrrGSVrLgymXq9df43/9pKnVtMeKKbI9xuf+G1jYoK4gm48
         QU2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:sender:dkim-signature;
        bh=4s4bjHYINhR356Iwdjk5iU/icac9OR3sXlqAYE+Das8=;
        b=kWFHyUm5cqeoVLEK831HKo9Artv2DaiGTfMxb+mqGBx/3TmxfZcWWQRogjheqCNxoS
         FhmPjMY2qvQJxAELELlJkCA1u569A8MeQOfV8uclanpJs/U8FyICZL7H4CwP9Acz6/Jt
         2+QMqXdpVINJc9Lw3LtOESVpIpzrHweAMJDD/jvRs4sAIrLtihMlfuDLEZtflUGhW7qZ
         PGbRbjqGjVtLCgTEgHV0uXQtWv6HJZV7zSaDu7TdfesUMxHiGITIIEai10+PVR9QAIcc
         larNGy4r/LADcuMlp+03epNN+GtqjaQn5YrhwD5Hu7zR1QnfxJpiXX4oAFAH2LzulA62
         fvsw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=kPqwzd4e;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4s4bjHYINhR356Iwdjk5iU/icac9OR3sXlqAYE+Das8=;
        b=eT8wsIbanfEq6KH0zfCzkkNYbejl0g45BBY66Or1F1iDeBia6vzfBMFw3A/lwjwNKk
         gPqm3j1nYtwZRMOoN+OeUrg3NmIPmXd4CPQ1kkV0nNHi2DFmZEDTc8wRQ05elzSsgYal
         X72sUxor3Ja6J6sDKp3TrFisZSGiJBRsdhf5snfwsr2qE3QDSVh6WWgeLmC1J9No2VWn
         zRR3+6WA/1GpkBFJZB+yEsQOVUX5pxi6CvKjZSdcmEG0JUuZBnJgkV0Qk4Ni6FdABj+7
         N8MqPgHpJJCP/pOQj1gbbTna9HicK2GVf4oVAoW/PWBx+i31ibXNMB6QOtq4qc6UjGGt
         6QSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:subject:from:in-reply-to
         :date:cc:content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4s4bjHYINhR356Iwdjk5iU/icac9OR3sXlqAYE+Das8=;
        b=Fsq5pCT4qh3BKG/ZwPCBcPQ6LrDx+zW9qoOErdg9+e/dIWN3sQW/SUmSVCQbMOtgMw
         74iv3ZVdwQa0/HWET5y9DhmTCv2ZzEkws86X/ngec0FjYPqsvc4+UXI9uc/SkWNWB5A6
         dcjlN78zpgjw+ak+PrlWenXiisWF7bI+5TLxMuTeRlrGRQPncbSTJmoXMZH/dBinptaS
         sMZoOLIRcx2jLwKiXWesAtyg4Ri43oLQCJAswVcOJisDSzvB+Lzx1v5dD0H8d/vg125B
         6c+eCsXETkJYzibfHno6dWBNMJBisKgHLRQdibV/XI/cdiRXZBkJBEUWArVcULpa3XFE
         iL7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5335AVDWIBjaLdnaebrW1AdfFmLFGot3lqnGMqXgK9BLQKqtE9+k
	tck1g5z4r/8afubiuXNj1XA=
X-Google-Smtp-Source: ABdhPJzqBKLKqkBTHKkoZSPs72g4rT7PvweU/VkUe4PyYDWLWxQzMVW0XENdOQZxjea1VKjsQbJ7Ow==
X-Received: by 2002:a05:6512:6cd:: with SMTP id u13mr8532759lff.17.1600253469618;
        Wed, 16 Sep 2020 03:51:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls521868lff.0.gmail; Wed, 16 Sep
 2020 03:51:08 -0700 (PDT)
X-Received: by 2002:a19:e57:: with SMTP id 84mr8610895lfo.161.1600253468315;
        Wed, 16 Sep 2020 03:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600253468; cv=none;
        d=google.com; s=arc-20160816;
        b=X4mR65/ISUztSUqcG8xppEWpV117VnxhHc6gxvsxrk8B7e4asgtVu9YI8TzwFkG1ft
         51O9pp9lkM7goqPT4pdg8gwwg6uNwslK2AGY94z1JeCBGpYpKu/BHSZsV/OwfRI4Btcl
         RkqIMQaRh93RupGcufSamGvmmkhLrdYNVg9d/hBr4EqPkYQx3B6O8r7GtGSTGLhRidQ0
         bZdW9Tcz2BvBZIgdcmGz081us/Wjed32BjAsPUT1qE25TS21qnu4uTZPjjaK1YiTAewV
         fOUnMtEGqmsXM3nVIeAv5Hhj3NAzPeC+/4CaSGOiAlCMD+U7mLRUC0ovq6d7ZIry6uS3
         W5hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=2xvmw9GJrYc3nhGK4F/eK7gKMOWSP5SWMILUVpccrLM=;
        b=BzeKlHQtZ8VjOB6mN/YeUPI6ZEn1bIysuh6O/1osBD8BcE9WUEJosoGjLNei9WeKlR
         GC3dVCTOSJvsS8qBxqp1fk3gK8W7RjJYZ9IPvFy5+iwATInFg2vGBi62Fh8lvjl+vXFO
         Oyku8ZtPsssf2QPH88V62QW5XeaoP9sksNOwSR3v+d4ztSSSkmL1S3IghGq7Enj38GZu
         HaSCOEFYy2oQld/mkHHkdeSJy/GyLSV+6vMBmQxBL0smbP0Ljorh/CL4WdSHQ7y4xnvF
         IpuapzHi0SxtsO4NFI6ehLYsgB9dpZbYduKtFB4lW+K03LCjA3lnpL+aFdPR31gAJi9d
         oN7w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=kPqwzd4e;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.21])
        by gmr-mx.google.com with ESMTPS id y17si552128lfg.2.2020.09.16.03.51.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 03:51:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) client-ip=212.227.17.21;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from meter.plexim.com ([212.126.163.234]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZTmY-1jy3hd2PXa-00WSP7; Wed, 16
 Sep 2020 12:51:07 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] arm64: Make sure SMC calls don't have side effects
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
In-Reply-To: <9eef795b-8ecd-49de-3e97-1535003ba499@siemens.com>
Date: Wed, 16 Sep 2020 12:51:07 +0200
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EF89FA0E-53D2-41E3-977A-43F502410816@gmx.de>
References: <6B88A347-1633-47E4-A3CF-DC37738FED1E@gmx.de>
 <068286c9-d55d-d259-8243-5dfaf10cba5f@siemens.com>
 <C2B8E562-224D-4B4A-904E-23DA8DE3DFED@gmx.de>
 <9eef795b-8ecd-49de-3e97-1535003ba499@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Provags-ID: V03:K1:wZa3qn3t2wtp1D7fpZGzKQ3YyKH2ZrzVT2XPVWcvUaDZ9LJ+Hvx
 16nn4iaV2JlKx5mJtl0k0dvtjBgTIdJKQG1WQNCwyafiRlYu6qfuIPffZ0h06LACQKJty+o
 jy+EGmEnPeZWgQfAEeBjYA53YsvTKwB17Kaoih1ywadkL12swpVTzMoaflTik5I4rZsl1eD
 MjMmuD5dacg7+uY8pmuOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5o5kPGtNrDg=:8xJvoDT2sucJaroI6qKgH2
 K6YabSZl6bAC3LWQ/MyOWpyz9TpwD5H0G58Y83pjpWud+l6+/EyDaX/IHbsBN8escAZ2y42jp
 RxQT7MEmhKGZuvqR0l7RhuPDM82ut0HMIozNi2kzelHgsZErbJLoHKpSUisEspInJF1rTv/Gq
 ETLVPl68aNpd6SYEtiqGF3mKk9l3wpVj0giAi+5oYdN2QNwEg2xKifMqfSEPsetwWR3xYChsH
 KWEqafVv1afQys5RYKas2X7CiOpkK2/HuhLUWP439Mz68nqvIVyIG1QE2rWa2EEpUyhwk/qUz
 hFoMOcwHt3icMx15yZuosflXhkctI7JDDL8U50GOu4u534gc0OzeTMUw4Y5JfG6Yof3hWa8e+
 SOFj/AfygLYUnkVDhKhacne7rshad5KgEAiwk6FgOj1/engrpqz/MBWA1AowHPhJO5ZuJaFMt
 fe9JAEHSpuLzxqKRf1Ym9HZEeKalh+UoYVQihuXHia7Tlb8R+0339PVZjolkLbmDxt31NaL0g
 qJqD+NUWEDQTxr7vO2RaNBEBQ08ylztovXpX256iQwJpES1NFSIie8tibrIhm6Hh1bcwjAg4m
 Z1vuguIkukSfdDL52tEZoH2MxOwYHpqNdB+XxAuRBjsNCCbbfpVDTUUMoSUU1WtaWE6t+yJS+
 Tib/GuMTl9uUfw9xPIufth/lCtHDXW60TiB7Cgz7MtbSpvhhyEuv5s290ibPvqKYKkezEj7wY
 9ZDtNhN8KpDURsV/Qc4T1RQd8qBZtF5XlNJloIFwd+ER+1aOceGXeZ8gV3dHWOMZXpcng8coE
 S/oYwe+ZM+fnNvvPUbjE8XBN8WODF0gSGydACFXgbxqs4A7V2LkJQy9voq5VCLBvl5LyLDUAq
 1hptIl8wKpF+ZFD4ptDvd6gANkUfpA+0d6+IqM8lwVkqGHePocMoPWFaIWq7P8cbXrlYQiqrs
 y3p4K9o8HvCRpgfiCzw8d2sfp/nmEzUntPiWTrQfDa+KYA0b3jP4sR8EQuO62Q7PM4Yenoc3C
 BRuDi0pj8K2Ix4d0I1+OtqfOBTkLNWkgqJWp8cVzo9wmaSfbIbuc+Mp+oRrY500b38fMt1XiS
 LFWKetsb5yoHfBvuzTQaWisNqpFAGGXQ2W7FrHcnYU5lKoDJKywjzAVARCa/JQs8mSxruLvRh
 vUh6qC8AKKtJDy7yBMJxqBu/FcDwHmi+GXRUXbIcyNNPaSmq0iESZcY1I5zvP4zp5aDWg5L0L
 b2RexXKlmQVT1rVXmq5lZbckYK+rWdmKLpDux4w==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=kPqwzd4e;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as
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



> On 16 Sep 2020, at 11:54, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>=20
> On 16.09.20 11:19, Oliver Schwartz wrote:
>>> On 16 Sep 2020, at 10:28, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>=20
>>> On 16.09.20 09:12, Oliver Schwartz wrote:
>>>> SMC calls may modify registers x0 to x3. To make sure the compiler doe=
sn't
>>>> assume input registers to be constant, also mark these registers as ou=
tput
>>>> when used as input.
>>>> Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
>>>> ---
>>>>  hypervisor/arch/arm64/include/asm/smc.h | 6 +++---
>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>> diff --git a/hypervisor/arch/arm64/include/asm/smc.h b/hypervisor/arch=
/arm64/include/asm/smc.h
>>>> index 1a5d5c8..e7b6723 100644
>>>> --- a/hypervisor/arch/arm64/include/asm/smc.h
>>>> +++ b/hypervisor/arch/arm64/include/asm/smc.h
>>>> @@ -28,7 +28,7 @@ static inline long smc_arg1(unsigned long id, unsign=
ed long par1)
>>>>  	register unsigned long __par1 asm("r1") =3D par1;
>>>>    	asm volatile ("smc #0\n\t"
>>>> -		: "=3Dr" (__id)
>>>> +		: "=3Dr" (__id), "=3Dr"(__par1)
>>>>  		: "r"(__id), "r"(__par1)
>>>>  		: "memory", "x2", "x3");
>>>>  @@ -43,7 +43,7 @@ static inline long smc_arg2(unsigned long id, unsig=
ned long par1,
>>>>  	register unsigned long __par2 asm("r2") =3D par2;
>>>>    	asm volatile ("smc #0\n\t"
>>>> -		: "=3Dr" (__id)
>>>> +		: "=3Dr" (__id), "=3Dr"(__par1), "=3Dr"(__par2)
>>>>  		: "r"(__id), "r"(__par1), "r"(__par2)
>>>>  		: "memory", "x3");
>>>>  @@ -62,7 +62,7 @@ static inline long smc_arg5(unsigned long id, unsig=
ned long par1,
>>>>  	register unsigned long __par5 asm("r5") =3D par5;
>>>>    	asm volatile ("smc #0\n\t"
>>>> -		: "=3Dr" (__id)
>>>> +		: "=3Dr" (__id), "=3Dr"(__par1), "=3Dr"(__par2), "=3Dr"(__par3)
>>>>  		: "r"(__id), "r"(__par1), "r"(__par2), "r"(__par3),
>>>>  		  "r"(__par4), "r"(__par5)
>>>>  		: "memory");
>>>=20
>>> Good catch! We likely have the same issue with our hypercall interface =
(jailhouse_hypercall.h).
>>>=20
>>> We should probably look carefully again at how Linux expresses these co=
nstraints: linux/include/linux/arm-smccc.h. That appears to me like we need=
 "+r" for input/output registers and "=3D&r" for those that are just input =
but might be clobbered on return.

Linux uses the =E2=80=9C=3D&r=E2=80=9D values for registers r0 to r3 if the=
y are _not_ inputs but might be clobbered.

>> I must admit that I don=E2=80=99t fully understand the =E2=80=9CConstrai=
nt Modifier Characters=E2=80=9D chapter in the gcc documentation. Please fe=
el free to modify the patch as needed.
>=20
> I had to read it 3 times as well, but I think I'm starting to understand.=
 "+" vs. "=3D" is simple, I guess. The relevance of adding "&" to "=3D" may=
 be clearer from this scenario:
>=20
> Consider you are passing "+"(p1) and "=3D"(p2) to an assembly block. If p=
2 is only written after p1 was evaluated, the compiler can safely map both =
to the same register. If p1 is only read after p2 was written (early clobbe=
r...), that would obviously break - hence that "&" tagging.

Yes, ok. What I don=E2=80=99t understand is why for the SMC calls the =E2=
=80=9C=3D&r=E2=80=9D syntax should have any advantage over mentioning the r=
egister in the clobber list. Doesn=E2=80=99t this have the same effect? Or =
is this just used in Linux to make the macro expansion easier?

> What I do not understand yet is how our register assignment hints play in=
to this which map parameters to different registers. Maybe they just create=
 an internal conflict for the compiler and could in some cases cause build =
errors. See also 2b9a200d6dba.

This is described in chapter "Specifying Registers for Local Variables=E2=
=80=9D and as far as I understand it takes precedence for assigning argumen=
ts to registers.

> Right. Basically, we need to mark all callee-saved registers in our inter=
faces as overwritten or, if not input as well, also early clobbered. If you=
 have the time to write such a patch, that would be great.

I can prepare a patch for the 32 bit files as well, but I have no means to =
test them.

Oliver

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/EF89FA0E-53D2-41E3-977A-43F502410816%40gmx.de.
