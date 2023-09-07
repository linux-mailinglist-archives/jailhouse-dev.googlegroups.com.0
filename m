Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBJGT42TQMGQEMZ4ELWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AC5797189
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Sep 2023 12:44:54 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id 5b1f17b1804b1-401db2550e0sf6567425e9.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Sep 2023 03:44:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1694083493; cv=pass;
        d=google.com; s=arc-20160816;
        b=0GKooHL3xVR7gmko75Gpbm5S4Q1vDluolS4altYDcxa2APXaJx07CBgAJEG283HC8J
         xgxZ6QzUNeJUAFSkyM5dosxze6M7ZRAPujhJy67tJ+QgHlVicLy7b9voe/M2mMJzjllg
         tdhJcoy5vbfFAjoEACrSmu5wpGN+6qwNLTfoa1JmM1Z3XtvNXvO2yfI9UUixWVCYKTp2
         bXD2kFFr54FpEroKM2ouWe7BV0C4mAadL98DR8RDFb+D0EAy6NI8ITdPQW0JfZc5P7+3
         j/YxvbvHZJKW3EdQfTh+HmgUd5KxVswnq2+6fBzjTb/PNqoRe6bXTLIkZDsRYNVe9lk5
         yULw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=KLKCvPRcjgMkVKaLhxfAFSzbOSRIf0ASM5BG8zwhUWQ=;
        fh=WQq7Y4kjjcilG32otq12Pu+qxNQlVTfRT61GGCMDZsk=;
        b=GnlZG7LNX5e7voOP+rhKONOheMvM+w8OwuoY/VSZm062Kt1Jw3c7dFxUFn502z6Twx
         88XNuDWLDJBAd9aAKe9Mr6WVaS9DcvrJYwjaxUclicB/7P76Pw09RDm9GfIXBGfKv3ol
         39Ag3XoXO+vxaRZk907klK7LSBpgwHenDxyrOzVGY46cyTZUT611ygYdK/i0icUdnPj1
         +tmIHle3O0j8IBdtDNNdEo8GzeO8ZHUq7zbiZ3NKuMJ8rwnHnlefwS7kg0CItasdYaGn
         fD0Jfo5fmcDKRe+CRb99fRCoYzOkYNUqIkwM1/esgLSaz249OAEKwbUzHyiRnn26JfWF
         1vVA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=neopwVxR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1694083493; x=1694688293; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KLKCvPRcjgMkVKaLhxfAFSzbOSRIf0ASM5BG8zwhUWQ=;
        b=Us82UgYW6YClAKOVmAIu/Rxu0hNmxh9VUKvZedJYcbq7ImArcJuXcDm1jXlPiUtRXh
         8Z8J3w5vEv7HS3/zkpCa8rRyjY745hOE4entak2jsxYeOY8zHDSsrvYvZyiGYwxskwQA
         /7xjUA2gYqtbQxVly5QtyXDGSNykOheCeQL7ItR/u1/06yTvdsZ9ZoEpRANBhl/H9xhQ
         kPlChq8YA2l1qjCY23szZUILvrHhF2FUMjo18SBa+3Z3hTzA8NVn5mJgclFIGdcO9yBI
         5REk8AaTxfFHT/wczP7jrXBpOUdLqjMmuz29DCGWhYvP/hbEUENk6uoGUsf3tqDl7Tj0
         Ihow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694083493; x=1694688293;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLKCvPRcjgMkVKaLhxfAFSzbOSRIf0ASM5BG8zwhUWQ=;
        b=dkOJuI9VQsi9Srehmrd91ktDI1Y3V93qVP4xBArzEmpsZJj0JClo9P2ncXlY9GziTA
         brpv4fm38yvB/VQ4zhZZSiH3b+Lcm+whxK67rst85c4tmxfN+4akhB4qc+fAsgRwSP2/
         QM198xDPXmMvpI59wu564SrU7CcgIjx5DWCdDj9LWqCTPEiNEGRoltqXN+AywiVF6hRA
         0B+tsc8dYpM/VAQE/U8PVeBJ9x8jT5FhBWkJW4sG7wBRDih3QwPXvUzyF4OjKBH2M4I5
         zzeEsdpZZYWWhjK5iF9V0tJP8mVR+yHG6vjTz6IEznm39sYE9A82mYpSrsYESribAJQK
         JVXQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzMo0BqaM+CH+Woox8/7+QKsqWIGvDvy5hduJWvwssUCQsn2Ihq
	MxvtXZ3otb9SzX1bqtw+jFE=
X-Google-Smtp-Source: AGHT+IHc2oJ+8LSCLwTNN2F88/dyUa7kh/SaAx9pFnoW6BoIymo5cIZXGxa7hGr/nNa+YDx7sWMV1A==
X-Received: by 2002:a05:600c:d5:b0:3fa:9823:407 with SMTP id u21-20020a05600c00d500b003fa98230407mr5293391wmm.18.1694083493546;
        Thu, 07 Sep 2023 03:44:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1d83:b0:3fe:e8cf:2cdd with SMTP id
 p3-20020a05600c1d8300b003fee8cf2cddls809828wms.2.-pod-prod-03-eu; Thu, 07 Sep
 2023 03:44:50 -0700 (PDT)
X-Received: by 2002:a1c:7408:0:b0:3fb:a102:6d7a with SMTP id p8-20020a1c7408000000b003fba1026d7amr4492427wmc.28.1694083490768;
        Thu, 07 Sep 2023 03:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694083490; cv=none;
        d=google.com; s=arc-20160816;
        b=MtsIcEtzB3PuzsroQ89RSAGh5Mg12jYwypijCXQHO7PyBiu4qSiTgy412WK67rQ1eK
         ezPzHSY14mOKCskNxHflpudsvvW1Tp17ISGRzlmktCzRBhPBLM4QF8iYJaji4Y5NyKz2
         PCEVhOXBk1UuTJrl+r6H2yiMFgOfDwGv4q7eYsHUjzyuR1ixsbdydtyZUqNrXDPFoQT2
         jBUGPG+27tnxuJSM9f9Pst/wRmJ27FdTy/249sNFpLIj+/Pb/hFX22MSRUE3eUG6yMk6
         NkY4Eu0c1z30kd3EPaJvHN9pOal0V5Wofzer72101vrywLdvD9hqnph2wIuGZx3VsBjU
         k2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SQsjBMynCkI0kf5dv2USpE6OUySW3ey8t67vtpXzTtU=;
        fh=WQq7Y4kjjcilG32otq12Pu+qxNQlVTfRT61GGCMDZsk=;
        b=MqpIU4gOr+KtkTNXISFxoNWo3fU9GOo3b9ZKHGA/UR6DwUiOl0oXag9Hyl7LQiVRHW
         lh8ZtgMh/3zEH1cWLVTDNiz+3AGuK1vkqm6qUOuAZWE7DBMbmBU/NxlGP1S5Rhmc3+yk
         0/6nsUmxImxqUOQNwE2vD6u+kA4pzD5g5fsmFRzH5wkr2S7LEKo5EDZq41CzliGMl/lp
         ipxXoWJg8NHv25POWg8IY1t6sPJ4FlO9WjoYaY1DRxW2YYHDiMFv3DR2SgCQc/RJRONF
         QTul2vcoheTRNc9rNwvusj/9fjnONxXg4M3oV5oTG9eKndKjjLPmP2ZYAfDpUPNCZ2Gh
         qCqw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=neopwVxR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [194.95.233.60])
        by gmr-mx.google.com with ESMTPS id a6-20020a05600c348600b003fe2591111dsi152420wmq.1.2023.09.07.03.44.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 03:44:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) client-ip=194.95.233.60;
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de [194.95.104.11])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id E4BF32E011F;
	Thu,  7 Sep 2023 12:44:49 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4RhG8d4KdczxqG;
	Thu,  7 Sep 2023 12:44:49 +0200 (CEST)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 7 Sep
 2023 12:44:49 +0200
Message-ID: <c72b8e4d-c872-4289-a787-a657af2df958@oth-regensburg.de>
Date: Thu, 7 Sep 2023 12:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to add new system register macro definition in arm64?
Content-Language: en-US
To: bot crack <unintialized@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <4edd4683-c693-4cad-aca7-53605eef02f3n@googlegroups.com>
 <556c7680-b856-4791-a782-e42b05540ae2@oth-regensburg.de>
 <c2ec035d-3139-4090-a84d-ca1859706953n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <c2ec035d-3139-4090-a84d-ca1859706953n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=neopwVxR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 07/09/2023 02:54, bot crack wrote:
> Hi,
> 1.=C2=A0 =C2=A0 =C2=A0#define arm_read_sysreg_64(op1, crm, val) \
> asm volatile ("mrrc p15, "#op1", %Q0, %R0, "#crm"\n" \
> : "=3Dr" ((u64)(val)))=C2=A0 =C2=A0The assembly of this macro should be *=
"mrrc p15,=20
> "#op1", %Q0, %R0,"*
> *
> *2.=C2=A0 =C2=A0But aarch64 does not use the cp15 register, I disassemble=
d=20
> inmates/lib/arm-common/timing.o(arm_read_sysreg(CNTPCT_EL0, pct64);) and=
=20
> the instruction was displayed as *"MRS X0, #3, c14, c0, #1" ,*And the=20
> instruction "*mrrc p15*" cannot be found in it.

Ah, inmates. Inmates use their own sysregs.h, and right, I looked at the=20
wrong include, i took the arm sysregs.h instead of the arm64 one.
See inmates/lib/arm64/include/asm/sysregs.h resp.=20
hypervisor/arch/arm64/include/asm/sysregs.h

And yes, on aarch64, cntpct_el0 is understood by the assembler:
https://github.com/bminor/binutils-gdb/blob/33a0b291058120c1294e90b53a5299c=
3ec62bad9/opcodes/aarch64-opc.c#L4944

   Ralf

>=20
>=20
> On Wednesday, September 6, 2023 at 10:14:30=E2=80=AFPM UTC+8 Ralf Ramsaue=
r wrote:
>=20
>=20
>=20
>     On 06/09/2023 03:40, bot crack wrote:
>      > Hi
>      >
>      > 1. I want to add some register definitions.
>      > 2. I want to know why #define CNTPCT_EL0 SYSREG_64(0, c14) in arm6=
4
>      > *has only two arguments*, but it can be expanded into assembly "MR=
S
>      > X0, #3, c14, c0, #1"
>=20
>     oh yeah, that's finest macro magic!
>=20
>=20
>     #define CNTPCT_EL0 SYSREG_64(0, c14)
>=20
>     #define SYSREG_64(...) 64, __VA_ARGS__
>=20
>     leads to the equivalent:
>=20
>     #define CNTPCT_EL0 64, 0, c14
>=20
>     Usage of CNTPCT_EL0:
>=20
>     arm_read_sysreg(CNTPCT_EL0, pct64);
>=20
>     with
>=20
>     #define arm_read_sysreg(...) _arm_read_sysreg(__VA_ARGS__)
>=20
>     So here, we, in fact, have
>=20
>     _arm_read_sysreg(64, 0, c14, pct64)
>=20
>     Which is defined as:
>=20
>     #define _arm_read_sysreg(size, ...) arm_read_sysreg_ ##
>     size(__VA_ARGS__)
>=20
>     So we get
>=20
>     arm_read_sysreg_64(0, c14, pct64)
>=20
>     which is defined as:
>=20
>     #define arm_read_sysreg_64(op1, crm, val) \
>     asm volatile ("mrrc p15, "#op1", %Q0, %R0, "#crm"\n" \
>     : "=3Dr" ((u64)(val)))
>=20
>     The rest is done by the assembler.
>=20
>=20
>=20
>      > 3. I didn=E2=80=99t understand the definition in
>      > inmates/lib/arm64/include/asm/sysregs.h because I couldn=E2=80=99t=
 find how
>      > to expand the macro definition SYSREG_64
>=20
>     #define SYSREG_64(...) 64, __VA_ARGS__
>=20
>     SYSREG_64(1,2,foo) =3D> 64, 1, 2, foo
>=20
>     These can be used as arguments in further macros.
>=20
>=20
>      > 4. For example, I want to add a new CNTVCT_EL0 (op0=3D0b11, op1=3D=
0b011,
>      > CRn=3D0b1110, CRm=3D0b0, op2=3Db010) register. How should I do it?
>=20
>     I don't know, but have a look at the Linux kernel to see how others d=
id
>     it in a pretty similar way:
>=20
>     https://elixir.bootlin.com/linux/latest/source/arch/arm/include/asm/v=
dso/cp15.h#L32 <https://elixir.bootlin.com/linux/latest/source/arch/arm/inc=
lude/asm/vdso/cp15.h#L32>
>=20
>     HTH,
>=20
>     Ralf
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/c2ec035d-3139-4090-a84d-c=
a1859706953n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/c2ec035d-3139-4090-a84d-ca1859706953n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c72b8e4d-c872-4289-a787-a657af2df958%40oth-regensburg.de.
