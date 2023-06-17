Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB45CW6SAMGQEDF2PJKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C137341E2
	for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Jun 2023 17:29:57 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id 4fb4d7f45d1cf-50daa85e940sf1252220a12.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Jun 2023 08:29:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1687015797; cv=pass;
        d=google.com; s=arc-20160816;
        b=mRPKEEQ0EslWrZ04rKxopq+sQk5MNUBxOSKwbYia/P77vnDb7NL1DL1k6xY2XKkRso
         aVsFSVe93pgKe9Iz2CocUbj0v0eCrEGRqcJ1gynCe5zgpdyn+5SVHdPEG6JgPFFVMTHl
         jgGJ+2qGNVAob2KqR+rFDEBN8GmqxNnE8DsGyfQYOQMraOkJVAAKVQid+KWy+H/D9XLs
         lnTCLhyCWnOXbGRwk+d2D/fxbCQgBQ3oOWKkLrzr+QllRYQtLevdbtb8ZzgNnGekuyjn
         QBBgjZctz6N84z3oRi8X6R07hiKuBo20iGnLcz3V1FlFtNOuewa8uYkjRYvlNg8u7Bh7
         PTng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=9nfknoz+oFvpuiNDt/9jsPpudEsFPAqU/edzRoHjago=;
        b=U+dBnLJCnewTLwhBNeNfiop0hwpIfRYiCDWjd9/lXlwrxrWg/keSQPPnx/AW7Nr1Y7
         4xhwD5SXLbaLtPW1c1zngPomnQF2brVqq8mTTKpqGxsERKyd59i0XCdygiES912WKGvi
         x112NlbfBgXOurIGZUyiYrTVCx5dOpOK5isibwdnVCD2bs60MBty9ybF1GhVd9sH3wxR
         jmGJw5ZTorlksNquXCAYQLSjB439pceo7widaN2k8uGM2wZM3HWky+fJAaL3QCLKMi6W
         fY0SBjQ8J1xp+8dFyfo81fq7j3FaYH3wT0/ySSDAQyFLF6es6qkUj2WkGMmS6g+KEbPF
         rURw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=fGv36ttR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1687015797; x=1689607797;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9nfknoz+oFvpuiNDt/9jsPpudEsFPAqU/edzRoHjago=;
        b=D27DnyQKl/rs9yKKQ7YX7zaWBUUvVBPlRe4ZjQh+X+V+xhZNcCbeZ+qzpULVZRvHLC
         Qm4wMXen8JbBJfxrvN0zoL9moIqQy3lylxv/phMun7MModxHrISB+Q2X1hgstfR68Fp2
         z98uCmE4CunlSIoJbv/u0KISkw2gXIrXH5OVsLIKW8kjMOgppc8JoRkFzAsvmMrDEc5v
         cso5TW3izxBJbnvrt75hZ0uaGG891qFL0WOJFOMtXfvh83czCHh9dL7YoCb0Z4dkEBeT
         fIFd02rKOiBUVoz+BXfnp2C4pwjSkij1Q73CpJGBb/UnDhKvCM+pkzeEGfkde1i942Bz
         noJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687015797; x=1689607797;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nfknoz+oFvpuiNDt/9jsPpudEsFPAqU/edzRoHjago=;
        b=RHPlTKSU7xX0qCyJi13BC8pRtlwaT5dlBCgoDyIY0rlqIKvGbsORvmgvt28qpeJwGE
         JOyyZcJ1dA5mtpSdPjENrtpX3T0msm/ksqaqNH0jjbQ5xoFHu5JSqiyhqoYMcYMxgIAI
         bYaEdBe2H59uBthyUcBhShScImp4CfHTgeDmnz1vQ0sEi2PXMgtnSAk1+9NA/IwmdEVe
         jgcEiTzux2aKUSCih5j+8JSy0NllX2wT8fL8IvbTm1wO2rsNqGN4k8oBRQnOSh6bWdMF
         QUSmKzc8unl1okZo6dvgAG/UpSkEsNXbmrb4cmwpTAr+Puqk3Vf1D5nyDJUkDy1h2hse
         zpng==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDzLkzYqaCO1sqjqjWMtyoH3MxP9oj8sekCXC2OBQ4zHffN6iAb6
	iAe1OFHzNzRXaNjaaMhn2hg=
X-Google-Smtp-Source: ACHHUZ4N200BVOz+vkyp/BqCxxa3Ry+whBgV0U0byGGF53YKFYGylUPt6m1QE8/vBZz3Nj8H6MryfA==
X-Received: by 2002:a50:ee96:0:b0:51a:3307:8ec6 with SMTP id f22-20020a50ee96000000b0051a33078ec6mr4120748edr.11.1687015796711;
        Sat, 17 Jun 2023 08:29:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1487:b0:51a:4bb9:deb9 with SMTP id
 e7-20020a056402148700b0051a4bb9deb9ls276625edv.1.-pod-prod-04-eu; Sat, 17 Jun
 2023 08:29:54 -0700 (PDT)
X-Received: by 2002:a17:906:6a18:b0:974:419d:7847 with SMTP id qw24-20020a1709066a1800b00974419d7847mr5213394ejc.71.1687015794514;
        Sat, 17 Jun 2023 08:29:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687015794; cv=none;
        d=google.com; s=arc-20160816;
        b=jZIsndAZxadcz8LeYgdjcyW4B9ID8QZZJvmv6pImuyxizL/83fdQzxIl+vClYNDRlp
         gUlSVxK2eSkXHf3mYOkyTojEmE9gp8qIhZu5MgpgtwKRh2x4sjIjWjUIoSh+iJUn76IK
         3xRTaEhmGcdYtPKujBlZBCYTtB8+2nUqHk2JC75B54NuDdrLWzCWrrSHBRYccEsEeR7V
         DeoMTQkFxKZZ13uFKgmpXZhOzla+9NL3oGydSJNLpxOwq06Rqg2OHkFqw9qbMdQ5jNpR
         +AgAZPzAlr+Z3heNuTzWxCxqnYP/2ISRawJkpPpQctYg8u8w3PxV8BRSG612frVwlFC5
         0uLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VB7siSfJr6FantjTWJkTwcTuk7+MmRBMKxMwYMRoDeo=;
        b=YkVFkbqPS6ZOru1BC91g+MmGj98+n2Pqa9A9oOJ/RRzYhA1ttln366BHN7Xi0Vi3K5
         lZzDxvZStRlvv+UIX6scWX2mqo4scIx/gWjAwb7erSU7RayNr94JavcE7VsYx/yRcWKM
         1ApbOCwXYTE6uwOSmLmxxhzruGDr5KJsd2B4M4TDqd881Y1d2cQO9QSKKwXY6JRlV1w+
         Xa1pgTW4T9PJs/6DaiADzWO//Vs4AgnVX9tb79xzgssSDL8F+5gYmlbwgQzPMt3LXZEe
         ZzawzOjYWz1Air32CwmnefhIqD70K0z+WDpXpT6qj2v5DlBsRbd36blwX9YCLlsJjnW4
         efHg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=fGv36ttR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id ef5-20020a05640228c500b005163f3b8433si1328163edb.0.2023.06.17.08.29.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 08:29:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Qk0MP6CC7zxsK;
	Sat, 17 Jun 2023 17:29:53 +0200 (CEST)
Received: from [172.16.2.22] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 17 Jun
 2023 17:29:53 +0200
Message-ID: <c7f684bd-ffcd-4ab2-076e-03dac205339e@oth-regensburg.de>
Date: Sat, 17 Jun 2023 17:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: FATAL: Unhandled HYP exception in Raspberry Pi 4 for jailhouse
 hypervisor
Content-Language: en-US
To: sai krishna Allu <saikrishna.allu@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <3e6d4f38-5938-4da0-9666-9093a0b76300n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <3e6d4f38-5938-4da0-9666-9093a0b76300n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=fGv36ttR;
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

Hi,

On 15/06/2023 10:11, sai krishna Allu wrote:
> Hi Team,
>=20
> I have=C2=A0Raspberry Pi 4, which is installed with Ubuntu 20.04.5 LTS 64=
 bit.
> after loading the jailhouse.ko file, when I gave following command I am=
=20
> getting the exception.
>=20
> ubuntu@ubuntu:~/jailhouse$ sudo jailhouse enable configs/arm64/rpi4.cell
>=20
> Initializing Jailhouse hypervisor v0.12 (0-g92db71f2) on CPU 0
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 39/994, remap 0/131072
> Initializing processors:
>  =C2=A0CPU 0...
> FATAL: Unhandled HYP exception: synchronous abort from EL2

Synchronous abort from EL2 means that we have a fatal error inside=20
Jailhouse (e.g., segfault).

>  =C2=A0pc: 0000ffffc0203820 =C2=A0 lr: 0000ffffc020380c spsr: 800003c9 =
=C2=A0 =C2=A0 EL2

Could you please disassemble your hypervisor binary, and see where the=20
exception exactly occurs? Do this with:

aarch64-objdump -d hypervisor/hypervisor.o

And see what code executes behind 0x0000ffffc0203820. Alternatively, you=20
can also attach the hypervisor.o.

Thanks,
   Ralf

>  =C2=A0sp: 0000ffffc021ee40 =C2=A0esr: 00 1 0000000
>  =C2=A0x0: 0000000084000000 =C2=A0 x1: 0000000000000008 =C2=A0 x2: 000000=
0080003580
>  =C2=A0x3: 0000ffffc020e170 =C2=A0 x4: 0000000000000014 =C2=A0 x5: 000003=
ffffffffff
>  =C2=A0x6: 0000000000000029 =C2=A0 x7: 0000ffffc0219d30 =C2=A0 x8: 000000=
000000002a
>  =C2=A0x9: 0000000000000000 =C2=A0x10: 0000000000000000 =C2=A0x11: 000000=
0000000001
> x12: 0000000000000015 =C2=A0x13: 0000000000000001 =C2=A0x14: 0000ffffc021=
9000
> x15: 0000ffffc0015040 =C2=A0x16: 0000ffffc020d1fc =C2=A0x17: ffffbcae2282=
6688
> x18: 0000000000000001 =C2=A0x19: 0000ffffc021e000 =C2=A0x20: 0000ffffc021=
9000
> x21: 0000ffffc0200000 =C2=A0x22: 0000ffffc0219000 =C2=A0x23: 000000000000=
0000
> x24: 0000000000000001 =C2=A0x25: 0000ffffc021e000 =C2=A0x26: 0000ffffc021=
f000
> x27: 0000ffffc020f000 =C2=A0x28: 0000ffffc0218000 =C2=A0x29: 0000ffffc021=
ee40
>=20
> Hypervisor stack before exception Stopping CPU 0 (Cell: "Raspberry-Pi4")
>=20
>=20
> Please suggest how to fix this problem.
>=20
> Regards,
> Sai Krishna
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c7f684bd-ffcd-4ab2-076e-03dac205339e%40oth-regensburg.de.
