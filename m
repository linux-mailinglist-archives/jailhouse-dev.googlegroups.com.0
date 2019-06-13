Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBBPORDUAKGQEUQ2KW5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 201A54359D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 13:44:06 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id u2sf8764162wrr.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 04:44:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560426246; cv=pass;
        d=google.com; s=arc-20160816;
        b=BmKDPGiiP+9oVXqMAFgWbd8LseOJ86zndnWYe9Om/CeGAQg0xDEL9wzPr2PvnLzVgS
         zN/VTJNGaudZu069aHMAt+Xm92Mtb4i5pqnttzNMvLC95GUtbEAr98g+1mhQZrO7H7S+
         KUZFh23niptTgh3q8OG/CF3thkrn/dVbUuxqDjWAfpU9Rqr2S0dx1GLEyblIGhxKK5Ht
         +QwN5EspKiRrdnWw+lD8dc+QGuSwNgyxJvg5P1izvHt0o5lUS0hm7jT5RnQmryJgK5CR
         6QK3a8b0VCm8Wcaks0iwJyiFJXp+Q0ir4G9geHGylzrQirDVGkhlNC4chWbbz2mdETUA
         lH7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:references:to:subject:from:sender:dkim-signature;
        bh=xuk1+nAivhUqCEhnhcY/gUSbz7gzF1bG8d2hnsykYrk=;
        b=FbZTDlrXHtmMUbH+8EipnInHyjxSzrB8Dxhsyx7ITSIMcG59uVx5yy3O4fhMccxa0c
         ph6fbK8wZd70qCeTnm0VAMUQlsnR2Mr50mEoONF5ijXbKzHNhXA4ybsLRZcGlSC0eqhl
         BhrifbzlPvA2U+alpTuj+Lv+HMrVZ4+fuKcs9O3LlP+iKfHldFc4tB49UkbPDnqhImQE
         WsG3LY7LOyICeaemRgyqhh22Nx8aub/A299sugn3zwMVneT0hwMZZWlSnHdvGIH7wQKF
         vn/phcPjCJeEBSTfktFvSr9uuxjPkhLZTOewk/Dsm/XpCGDLP60Hrb/kCbwhPPR6CDBa
         5qiA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=szejThpm;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:references:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xuk1+nAivhUqCEhnhcY/gUSbz7gzF1bG8d2hnsykYrk=;
        b=ezh2nage5KbNO+b1gSwd5DivsJBWgsrVJHq9ldsL8uWRnfODCDYEsFkUWh+YOi3tH7
         K3AgjDEwJSzQXbrDOLWVAHON9NP3X1E8cA6e1guby5uqXk9Bz9QzHPHCKgJ2jh+yYvDM
         qJ5OvwbjAYQOhHEqxPaTpiHXVHHgza8X5FH/5o3LoYhCwZxc0W08Zyqa2RGDVfZLedSz
         iu8qlWdhWSXUU0j8mZDg44siHF6iOpy3fXki0C6mRlUYw2thBVuJMxWiTtWlRCnrIQSe
         zohsWb3bUyNEZIvccNzp0ULgA2JdoIe4PPzlaYgQvZVGBSudiqal2R7ZCZ5Jc2ghVuOr
         psxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:references:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xuk1+nAivhUqCEhnhcY/gUSbz7gzF1bG8d2hnsykYrk=;
        b=SZhkds7CvS1bOhJsi6Em92FWJetY71dOgUz2sTHjbILXvFtPDkqly+GDRI2dAd2kp1
         KfOM4DJ4U2Bx38LtzrIgQVTNnTPnCHb1G8u6ML8Hcvzh6o9VFXtxRphOT1UM2srHng/K
         qr+vUrGp7m40qwpEcAIhAGMyxsoqKtMs/LO28sHcMU3mSm7asibFbGyu4PiNwMnZEDZF
         7j10dkoUUZ0rhYZf9WxIzRg7wd0aVmINW7nVfIrNPF6+C9f7ZN4ZfOKtZCXE52Hc5X6q
         gl0GJKyE3dFuuKMm2UB32tcHZkexp9gu5IC8ntdSVamH9UWRmYesMNExSa2+++SZzawA
         ll8Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU0DEdedo9Hr2fWuV2pdu+IYTTWRA0nOh4deeti39h0sODeGAjS
	tbXkH6OhgTyqAy19nA8iDgI=
X-Google-Smtp-Source: APXvYqzXThF2kDvpmhpexTHlxo+ABAjOdDkqsA7srL4T5O3C9tdlLxGMU90w7usWw4DlSjwrc4/aqg==
X-Received: by 2002:a1c:bbc1:: with SMTP id l184mr3334690wmf.111.1560426245821;
        Thu, 13 Jun 2019 04:44:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c34f:: with SMTP id l15ls1652613wmj.4.gmail; Thu, 13 Jun
 2019 04:44:05 -0700 (PDT)
X-Received: by 2002:a1c:f415:: with SMTP id z21mr3677562wma.34.1560426245201;
        Thu, 13 Jun 2019 04:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560426245; cv=none;
        d=google.com; s=arc-20160816;
        b=x9flBKsg9+8oCpFZuZxKwbbzRAanus5Ruxw+drHLes4gVzh2EtR2H3XLOrsizhpwUx
         IIvjjFYe9hdcKDSXT/IrH5j2p2Di8yxuvmADzM4dPgx8SBElKq+jn6Sfr9maKmB078g6
         lvpFeG/I+E0lPwucsw2K5cYaXa+CIYefrIDInUHa4E7gaLGBID5Rypw5lhNI99iuomql
         UOq5J02/m5HhL9fwMptbMYXx5sBWTHLsLScFajYINK6b/bXnHOFES/J3dBZF2cegnDv2
         V2LPSJEUszvHHi0KPS8+nbfaRsk9Z8U3EO7wiv9Xdi4JRGXvzSHljodoipRfmz0Vweey
         MOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:subject:from
         :dkim-signature;
        bh=IxFs+97YYShbPaGircPnbZpK9PHuEIFFIv6KkN62nQg=;
        b=CV7Wlwl2x2GmTDIho/9JK5w7pUqPmBMXR35O8RIbai9T+ci2EJbgjsma01ZY6bpZ3e
         WIABnYSkeoTCm9xiZ9ACYxxP+JcMdBXn7fqrGVuxliFiNWIGQPCRgefTLk1rswsXUOBf
         xv8scG4iP1v9RKZGc82QNJ6P7wZehSv2ss1M5WjjSAerzqSXS72MkcWWulYE/HSGpP/7
         S5ewPtx39x+6EMEYY0lTWvvr9I61zUxsEXkyoNaFLN9DRWGASRTgTQ4U2flt7O9uwKWg
         q+aOOrzxuyeuFhfXly33mxOp93AqR03E2feojrN6qaLG7e7+XVL1X1i6rBINqobALHxx
         sv2g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=szejThpm;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id n10si158432wmh.0.2019.06.13.04.44.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 04:44:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45Phj05qLBzyMJ;
	Thu, 13 Jun 2019 13:44:04 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 13 Jun
 2019 13:44:04 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: Re: [PATCH] x86: mmio: fix preserve mask for instructions with
 zero-extend
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <20190612190035.16171-1-ralf.ramsauer@oth-regensburg.de>
 <00af9701-f68f-a27f-2646-ca1f0eb9b187@siemens.com>
Openpgp: preference=signencrypt
Message-ID: <630de120-5105-75ef-17a7-67fb45500bb0@oth-regensburg.de>
Date: Thu, 13 Jun 2019 13:44:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <00af9701-f68f-a27f-2646-ca1f0eb9b187@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=szejThpm;
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



On 6/13/19 9:47 AM, Jan Kiszka wrote:
> On 12.06.19 21:00, Ralf Ramsauer wrote:
>> movzx is a move with zero-extend. This means, it will either move 1 or
>> 2 byte,
>> and zeroes the rest of the register. The definition of the rest of the
>> register depends on the operand size override prefix:
>>
>> =C2=A0=C2=A0 - If OP SZ is not set, always zero the whole register, inde=
pendent
>> of rex_w.
>> =C2=A0=C2=A0=C2=A0=C2=A0 This mean all bits can be zeroed if the destina=
tion is eax or
>> rax. No need
>> =C2=A0=C2=A0=C2=A0=C2=A0 to set the preserve mask
>>
>> =C2=A0=C2=A0 - OP SZ is only set if ax is used. This is the only remaini=
ng case.
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 The preserve mask then depends on the width of =
the access. In
>> case of B,
>> =C2=A0=C2=A0=C2=A0=C2=A0 zero bits 8-15, and preserve 16-63. In case of =
W, zero nothing, but
>> =C2=A0=C2=A0=C2=A0=C2=A0 preserve 16-63.
>=20
> I'm not sure how this explanation correlates with the test cases, nor to
> speak of the implementation. I feel like some bit is missing in comment
> or commit log.

Does the following make it clear?

--8<--

movzx is a move with zero-extend. It will either move 1 byte (0f b6) or
2 bytes (0f b7). The destination are lower 8 or 16 bits. Zero-extend
means that upper bits need to be cleared. The definition of upper bits
depends on the destination register.

We already have a preserve mask that allows us for to clear or preserve
bits when emulating the instruction. In case of movzx, the preserve mask
only depends on the width of the destination register. For the
destination register, we have the following cases:

  - rax -- instruction has REX prefix 0x48 (rex_w set)
  - eax -- default case, no prefix, nothing
  -  ax -- instruction has OP SZ override prefix 0x66
  -  al -- not possible, and doesn't make sense for movzx


Now, rax and eax have the same effect: Always clear all upper bits (IOW,
bits 8-63 if access_size is 1 or bits 16-63 if access_size is 2).
Solution for rax and eax is easy: Simply don't set the preserve mask at all=
.

The fun part is if we have the 0x66 operand override size prefix. This
means that the 'visibility' of the destination register is narrowed to
16 bit.

In case of a 1 byte move (0f b6), copy the source to bits 0-7, clear
bits 8-15 and preserve bits 16-63. access_width ensures that we only
copy 8 bit to bits 0-7, and the preserve_mask 0xffff.ffff.ffff.0000 does
the rest: preserve bits 16-63 and implicitely clear bits 8-15.

In case of a 2 byte move (0f b7), copy the source to bits 0-15, clear
nothing and preserve bits 16-63. access_width ensures that we only copy
16 bit to bits 0-15, and the preserve_mask 0xffff.ffff.ffff.0000 does
the rest: preserve bits 16-63.

(Ok, I already see my mistake from below)

>=20
>>
>> Once this pattern is clear, the fix in the hypervisor is straight
>> forward.
>>
>> Amend existing and add new test cases that test correct behaviour.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>
>> I'm starting to get frustrated with x86. I thought I catched all
>> relevant cases, but x86 provides enough complexity for a bunch of corner
>> cases...
>>
>> =C2=A0 hypervisor/arch/x86/mmio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 11 ++++-
>> =C2=A0 inmates/tests/x86/mmio-access-32.c | 24 +++++++----
>> =C2=A0 inmates/tests/x86/mmio-access.c=C2=A0=C2=A0=C2=A0 | 67 ++++++++++=
++++++++++++++------
>> =C2=A0 3 files changed, 80 insertions(+), 22 deletions(-)
>>
>> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
>> index 124f9966..76d70053 100644
>> --- a/hypervisor/arch/x86/mmio.c
>> +++ b/hypervisor/arch/x86/mmio.c
>> @@ -55,6 +55,7 @@ struct parse_context {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_rex_r;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_addrsz_prefix;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_opsz_prefix;
>> +=C2=A0=C2=A0=C2=A0 bool zero_extend;
>> =C2=A0 };
>> =C2=A0 =C2=A0 static bool ctx_update(struct parse_context *ctx, u64 *pc,
>> unsigned int advance,
>> @@ -144,6 +145,7 @@ restart:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.has_opsz_pref=
ix =3D true;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto restart;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOVZX_OPC1:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.zero_extend =3D true;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ctx_update(&=
ctx, &pc, 1, pg_structs))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 goto error_noinst;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op[1].raw =3D *ct=
x.inst;
>> @@ -191,8 +193,13 @@ restart:
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op[2].raw =3D *ctx.inst;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (!ctx.does_write && inst.access_size < 4)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.reg_preserve_mask =3D ~=
BYTE_MASK(inst.access_size);

/* The reg_preserve_mask only needs to be set in case of reads */

>> +=C2=A0=C2=A0=C2=A0 if (!ctx.does_write) {

/* reg_preserve mask needs to be adjusted if the operand override prefix
 * is set (IOW, if access_size < 4). And if we don't have an instruction
 * with zero-extend.
 */

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if(!ctx.zero_extend && inst.=
access_size < 4)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst=
.reg_preserve_mask =3D ~BYTE_MASK(inst.access_size);

/* In case of zero-extend, we only need to preserve bits, if we have the
 * operand size override prefix set. In this case, preserve bits 16-63.
 *
 * No need to do anything if the operand override prefix is not set: we
 * have to clear all unused bits, which we do automatically if
 * reg_preserve_mask is zero (which is the default case)
 */

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (ctx.zero_extend && =
ctx.has_opsz_prefix)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst=
.reg_preserve_mask =3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ~BYTE_MASK(inst.access_size ^ 0x3);

Heck, yesterday this made perfectly sense to me. I used a handwritten
table where I tried to find the pattern.

From my explanation above, would you agree this needs to be ~BYTE_MASK(2)?

All tests - without modifications - still pass. And guess why I didn't
see that bug: Well, we lack a test case. :-)

We lack the test case
	66 0f b7 00          	movzww (%rax),%ax
that would have shown the bug. Sigh...

>=20
> This logic deserves some comment, and I'm not sure if it is correct
> already:
>=20
> Access size =3D 1 -> BYTE_MASK(2) -> preserve bits 16-63
> Access size =3D 2 -> BYTE_MASK(1) -> preserve bits=C2=A0 8-63???
>=20
> Access sizes 4 or 8 are not possible?
>=20
>> +=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* ensure that we are actually tal=
king about mov imm,<mem> */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (op[0].raw =3D=3D X86_OP_MOV_IMMEDIATE=
_TO_MEM && op[2].modrm.reg
>> !=3D 0)
>> diff --git a/inmates/tests/x86/mmio-access-32.c
>> b/inmates/tests/x86/mmio-access-32.c
>> index db743410..756d3947 100644
>> --- a/inmates/tests/x86/mmio-access-32.c
>> +++ b/inmates/tests/x86/mmio-access-32.c
>> @@ -64,15 +64,23 @@ void inmate_main(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 /* MOVZXB (0f b6), 32-bit data, 32-bit addres=
s */
>> -=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%ebx), %%eax"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) : "a" (0), =
"b" (mmio_reg));
>> -=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32, (u8)pattern);
>> +=C2=A0=C2=A0=C2=A0 /* MOVZXB (0f b6), 8-bit data, 32-bit address, zero =
extend bits
>> 8-31 */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%eax), %%eax"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32, pattern & 0xff);
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 /* MOVZXW (0f b7) */
>> -=C2=A0=C2=A0=C2=A0 asm volatile("movzxw (%%ebx), %%eax"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) : "a" (0), =
"b" (mmio_reg));
>=20
> Where does this case go? No longer differentiating?

Differentiating between what? Registers?

I need to trigger special cases. I do this by using the same register
for input and output. I can also leave some tests that work on different
registers.

>=20
>> -=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32, (u16)pattern);
>> +=C2=A0=C2=A0=C2=A0 /* MOVZXB (0f b6), 8-bit data, 32-bit address, zero =
extend bits
>> 8-16,
>=20
> 8-15

Will fix all of your remarks, thanks.

>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * operand size prefix */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%eax), %%ax"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ((unsigned long)mmio_reg & ~0xffff) | (pattern & 0xff));
>> +
>> +=C2=A0=C2=A0=C2=A0 /* MOVZXW (67 0f b7), 16-bit data, 32-bit address, z=
ero extend
>> bits 16-31,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * AD SZ prefix */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("movzxw (%%eax), %%eax"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32, pattern & 0xffff);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MEM_TO_AX (a1), 32-bit data, 32=
-bit address */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("mov (0x101ff8), %%eax"
>> diff --git a/inmates/tests/x86/mmio-access.c
>> b/inmates/tests/x86/mmio-access.c
>> index a17455b0..18eab3a5 100644
>> --- a/inmates/tests/x86/mmio-access.c
>> +++ b/inmates/tests/x86/mmio-access.c
>> @@ -84,20 +84,63 @@ void inmate_main(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 /* MOVZXB (0f b6), to 64-bit, mod=3D0, reg=3D=
0, rm=3D3 */
>=20
> Not relevant anymore?
>=20
>> -=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%rbx), %%rax"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (0), =
"b" (mmio_reg));
>> -=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64, (u8)pattern);
>> +=C2=A0=C2=A0=C2=A0 /* MOVZXB (48 0f b6), to 64-bit, mod=3D0, reg=3D0, r=
m=3D3 */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%rax), %%rax"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64, pattern & 0xff);
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 /* MOVZXB (0f b6), 32-bit data, 32-bit addres=
s */
>> -=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%ebx), %%eax"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (0), =
"b" (mmio_reg));
>> -=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64, (u8)pattern);
>> +=C2=A0=C2=A0=C2=A0 /* MOVZXB (0f b6), to 32-bit, clear bits 31-63 */
>=20
> 32-63
>=20
>> +=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%rax), %%eax"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64, pattern & 0xff);
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 /* MOVZXW (0f b7) */
>> -=C2=A0=C2=A0=C2=A0 asm volatile("movzxw (%%rbx), %%rax"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (0), =
"b" (mmio_reg));
>> -=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64, (u16)pattern);
>> +=C2=A0=C2=A0=C2=A0 /* MOVZXB (66 0f b6), to 32-bit, clear bits 8-16, ke=
ep 17-73,
>=20
> 8-15, 16-63
>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * operand size prefix */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%rax), %%ax"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ((unsigned long)mmio_reg & ~0xffffUL) | (pattern & 0xff));
>> +
>> +=C2=A0=C2=A0=C2=A0 /* MOVZXB (67 0f b6), 8-bit data, clear bits 8-63, 3=
2-bit address,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * AD SZ override prefix */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%eax), %%rax"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64, pattern & 0xff);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* MOVZXB (67 0f b6), 8-bit data, clear bits 8-63, 3=
2-bit address,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * AD SZ override prefix */
>=20
> Same as above? Surely not.
>=20
>> +=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%eax), %%eax"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64, pattern & 0xff);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* MOVZXB (67 0f b6), 8-bit data, clear bits 8-16, k=
eep 17-73,
>=20
> 8-15, 16-63
>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * 32-bit address, AD SZ override prefix, OP SZ=
 override prefix */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%eax), %%ax"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ((unsigned long)mmio_reg & ~0xffffUL) | (pattern & 0xff));
>> +
>> +=C2=A0=C2=A0=C2=A0 /* MOVZXW (48 0f b7), 16-bit data, clear bits 16-63,=
 64-bit
>> address */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("movzxw (%%rax), %%rax"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64, pattern & 0xffff);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* MOVZXW (0f b7), 16-bit data, clear bits 16-63, 64=
-bit address */
>=20
> Variation in the target register size missing in description.
>=20
>> +=C2=A0=C2=A0=C2=A0 asm volatile("movzxw (%%rax), %%eax"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64, pattern & 0xffff);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* MOVZXW (67 48 0f b7), 16-bit data, clear bits 16-=
63, 32-bit
>> address,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * AD SZ prefix */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("movzxw (%%eax), %%rax"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64, pattern & 0xffff);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* MOVZXW (67 0f b7), 16-bit data, clear bits 16-63,=
 32-bit address,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * AD SZ prefix */
>=20
> Also here.
>=20
>> +=C2=A0=C2=A0=C2=A0 asm volatile("movzxw (%%eax), %%eax"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64, pattern & 0xffff);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MEM_TO_AX (a1), 64-bit data, 64=
-bit address */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movabs (0x101ff8), %%rax"
>>
>=20
>=20
> Horrible, this huge amount of cases.

I'm sorry -- still not enough.

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
jailhouse-dev/630de120-5105-75ef-17a7-67fb45500bb0%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
