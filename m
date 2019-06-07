Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZPW5DTQKGQEFHYJP2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8488C387D7
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 12:24:38 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id q2sf706575wrr.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 03:24:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559903078; cv=pass;
        d=google.com; s=arc-20160816;
        b=WrX4+Cl2m+I1rBnYcAi7j/pYmTE2FBLx96iQGNGH/mmu2cCRQmN5eAjAZihKr8yzGq
         fLdQKtus1GVObEiWhEbEaEVAwPBnUYkg9EsAnjR5nT27ogrywHI3Zcf4qLNn+NsCfRQt
         V8IEOmpbHsv++qEFvrd+ZoDbvAiEwQwHF6w+uA+HZ2uRcqds10owcjvw1FBR2Q1gqsnQ
         JRrhTviqTfX7i+z72FwaoRqSGliRkYsyduKFbKCYTeKpCKbfeYWdZ2VRvp/AQGbeJ+IF
         X+2fD9J2rR7yEfGU+i3k2u5d74su6aEgHCREqXiu7IsbZopT7w+iJz/rz1pT17qHbH/K
         Re1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:to:subject:sender
         :dkim-signature;
        bh=4fJnsgy7a+2J4+q6L68T6O4aor5Y8DVry5Eb3EH13b4=;
        b=Llkw1dDad0nZJSOgaFzC7c/rLA1yi76nvm3MuKHpOwWUohxtzGOz8ORl3304n9Q22F
         uWIRPaJSDCU6r4Wfz7Z8HEtXyATPdxYjQms9/i3wfQkbMbO5Y8i5KsHfk3kXYf9+gRwm
         UW7PYaR5o1Emt8hzKP5iKURxBrUFvnhHsZva64G+w1gcu/014aqcIsx6S+YNsJvv9r/H
         aQyp6Gk9WPCDAfC/6uf3kDT7fx2VxrcyineNy926NR2aCHODl2ujY6O2gApY+diV3AmM
         LFvIDUqfXWmFTQlrWOd0dZ2DWac0Huulu0xIJyJH/u6sofGFYNsnojroUnssAY/CnqP0
         yWkw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bziELwKz;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4fJnsgy7a+2J4+q6L68T6O4aor5Y8DVry5Eb3EH13b4=;
        b=ncC802QL2M1Qnjmni+UY5p4zuGDFGI4Nwjs41yxh4Q8fNUDw6WmevUdOsPBoNyB5tn
         /AkSyjPgoP0i3nO7nOQHzz5MxWTSlAbWGn8LtVnvr+SwT88STqZMHCHIpfgqIQlNSZB2
         yWSve8v3ApYiADk631HNGCAOK7pxp87XU0j+UtFB0RJ+RX3qV5pLAM3Mrr9L+t/EpwHA
         nKS6GsanNShVgGhtEQ61NJFq2MoAWXHk55Rv6h1sRcKD5MOalPVzc+42YrtzKs6Lh+5R
         c4Si7HPMECWbskQ75x5hohYTjJZ5UqeAi6JvRrwOM9WD1F/DWPjIp0ubQtM5y/nukhya
         R7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4fJnsgy7a+2J4+q6L68T6O4aor5Y8DVry5Eb3EH13b4=;
        b=sfDQ5w2ptz2wnLP9nnTZRldsHgPliQ6XEq/pDsXhLqwOBRmNSiFP+QlG7P9KHy3Dm9
         he7Pf9MKfzAMpGHqdZ7gTJ9VcR6H6oNjDuCtzLvqWtkyj36YWT/VtQO+FUbvUDPGBvS0
         UPlBLuDuQHmzN1YCy3lGwPeQgea0Coj2BpuWGgZaTAy3TjcQPXlrdq4pEAFAduxlQUuJ
         jrGzzLWP2Wz5oGxmmhv8ySb4q/sH4Wybs+jSHoTJfDC08HvvF87HmK4Eiwq8UVV3wfpz
         9RnwBt+3DiC0KaL5v/MKpyAJx6R8xSxXTIrFUZAAQRd59ZDM9HiDP9kSElb+/+koNqI6
         ekvQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV+XwKwbyd2Uk/CWHA2NoGHQmeaVcBy1Dy64gLwmisvgqRCXNCB
	e/MUObtKeJI+XnPZauVW1Uo=
X-Google-Smtp-Source: APXvYqwGpE8ZzRmShTJbqBphN7zTWZzNwWNCdnQy71BF2VUI0liSi/OWEHwxep+y1hYjy3EcJo4/Nw==
X-Received: by 2002:a1c:345:: with SMTP id 66mr1811583wmd.8.1559903078190;
        Fri, 07 Jun 2019 03:24:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4e8c:: with SMTP id e12ls1944219wru.2.gmail; Fri, 07 Jun
 2019 03:24:37 -0700 (PDT)
X-Received: by 2002:a5d:6190:: with SMTP id j16mr9115362wru.49.1559903077598;
        Fri, 07 Jun 2019 03:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559903077; cv=none;
        d=google.com; s=arc-20160816;
        b=wXLXiL5aNX+NVcK0PGfrM3g68oF5AdQCnJuBkl9ekCanYu5J6hpduCFf2W7RXhqrDo
         nTZ65kSEdnOdVlVWxGHKSzcYevNhBzCyN3BPEOBA2sz+7DQ/i4a0wyoPSwk2hQ6v0l6D
         22LKU/QGkLkstyVV9aGDMk22UI0DvAgAJKol5czIiQtRA01Ju05N5IB9/XwViDgsOkLi
         yDMXsM9utX3wVYufW81uDXoJxHfb+986RhEOUgcR9QgXiVEPigVzJWO4XaepYC9R+qTh
         Witlvgnd4MaDwEmAIFvQRqADEn+mPqyE5MZzu2bfHtsrCQi/GBx7x42IgqGzj9D6/MaF
         MBsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=CzkmBEyrm6ixIRCijXjxh/nJ3EqR7MBiPOzeCcp99jw=;
        b=BmVLjwCJF8tFKu93d5IqOMvq/xLY/QPR5PfPNiu00ynDaAh+UsawGlgSLj1KpWekax
         rpeCehlLr3J9RLAoQxySqKNq/l8FgPi5kXbAa1fkd3Jwt69NX1yG+kgueUPrtKEJGvGw
         cmxwYFj7Ls1BuqruHUZmKlpx5I6TsXssZmpBG9oEuxziCzXiIp8fmVZeW9Z1AB0Ygsi0
         dHTJrPDDUaWbf0iNHKQZxNsA1KmWI22F5Bu0T4nu8iDhWvDGh5fiCtz+Zhf1W4HiCrUj
         1GfpjJm+kHCIrRd5K8tjdZMACiOt2g5iV65ysxYnvydkGgwYO0Tq6kYpBOQRwl+Mze02
         NsiA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bziELwKz;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id x8si56827wrt.3.2019.06.07.03.24.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 03:24:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45KzD51TgzzyKw;
	Fri,  7 Jun 2019 12:24:37 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 7 Jun 2019
 12:24:36 +0200
Subject: Re: [PATCH v2 1/3] x86: mmio: fix accidental clears of bits in
 registers
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <20190606224457.1053-1-ralf.ramsauer@oth-regensburg.de>
 <20190606224457.1053-2-ralf.ramsauer@oth-regensburg.de>
 <d9071e5a-ae9c-5915-b81d-eafb57d27789@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <31132492-0d6d-5e61-ec83-9536d9d38887@oth-regensburg.de>
Date: Fri, 7 Jun 2019 12:24:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d9071e5a-ae9c-5915-b81d-eafb57d27789@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bziELwKz;
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

On 6/7/19 10:35 AM, Jan Kiszka wrote:
> On 07.06.19 00:44, Ralf Ramsauer wrote:
>> We trap certain MMIO accesses and need to emulate their access.
>>
>> On x86, a 32-bit read will clear bits 32-63 of a register.
>>
>> Inconsistently, on x86, 16-bit and 8-bit reads must not clear high bits.
>> Jailhouse erroneously cleared those bits. Prevent this by applying a
>> preserved mask that keeps bits alive.
>>
>> Add tests that check correct behaviour.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> =C2=A0 hypervisor/arch/x86/include/asm/mmio.h |=C2=A0 5 +++++
>> =C2=A0 hypervisor/arch/x86/mmio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++++-
>> =C2=A0 hypervisor/arch/x86/vcpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++--
>> =C2=A0 inmates/tests/x86/mmio-access-32.c=C2=A0=C2=A0=C2=A0=C2=A0 | 10 +=
++++++---
>> =C2=A0 inmates/tests/x86/mmio-access.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 10 +++++++---
>> =C2=A0 5 files changed, 28 insertions(+), 9 deletions(-)
>>
>> diff --git a/hypervisor/arch/x86/include/asm/mmio.h
>> b/hypervisor/arch/x86/include/asm/mmio.h
>> index 756c84a8..4b3b2ea8 100644
>> --- a/hypervisor/arch/x86/include/asm/mmio.h
>> +++ b/hypervisor/arch/x86/include/asm/mmio.h
>> @@ -30,6 +30,11 @@ struct mmio_instruction {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** Output value, already copied either f=
rom a register or
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * from an i=
mmediate value */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long out_val;
>> +=C2=A0=C2=A0=C2=A0 /** A read must not clear the upper bits of register=
s, if the access
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * width is smaller than 32 bit. This mask desc=
ribes the bits
>> that have
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * to be preserved.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 unsigned long reg_preserve_mask;
>> =C2=A0 };
>> =C2=A0 =C2=A0 /**
>> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
>> index b234bd79..c04cf449 100644
>> --- a/hypervisor/arch/x86/mmio.c
>> +++ b/hypervisor/arch/x86/mmio.c
>> @@ -85,7 +85,7 @@ x86_mmio_parse(const struct guest_paging_structures
>> *pg_structs, bool is_write)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct parse_context ctx =3D { .remaining=
 =3D X86_MAX_INST_LEN,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .count =3D 1 }=
;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union registers *guest_regs =3D &this_cpu=
_data()->guest_regs;
>> -=C2=A0=C2=A0=C2=A0 struct mmio_instruction inst =3D { .inst_len =3D 0 }=
;
>> +=C2=A0=C2=A0=C2=A0 struct mmio_instruction inst =3D { 0 };
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 pc =3D vcpu_vendor_get_rip();
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int n, skip_len =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_immediate =3D false;
>> @@ -168,6 +168,9 @@ restart:
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op[2].raw =3D *ctx.inst;
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 if (!does_write && inst.access_size < 4)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.reg_preserve_mask =3D ~=
BYTE_MASK(inst.access_size);
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* ensure that we are actually talking ab=
out mov imm,<mem> */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (op[0].raw =3D=3D X86_OP_MOV_IMMEDIATE=
_TO_MEM && op[2].modrm.reg
>> !=3D 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto error_unsupp=
orted;
>> diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
>> index 5a557d0b..a1fb8660 100644
>> --- a/hypervisor/arch/x86/vcpu.c
>> +++ b/hypervisor/arch/x86/vcpu.c
>> @@ -231,6 +231,7 @@ bool vcpu_handle_mmio_access(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mmio_access mmio =3D {.size =3D 0}=
;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vcpu_mmio_intercept intercept;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mmio_instruction inst;
>> +=C2=A0=C2=A0=C2=A0 unsigned long *reg;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vcpu_vendor_get_mmio_intercept(&in=
tercept);
>> =C2=A0 @@ -249,8 +250,10 @@ bool vcpu_handle_mmio_access(void)
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D mmio_handle_access(&mmi=
o);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (result =3D=3D MMIO_HANDLED) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!mmio.is_write)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gues=
t_regs->by_index[inst.in_reg_num] =3D mmio.value;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!mmio.is_write) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg=
=3D &guest_regs->by_index[inst.in_reg_num];
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *reg=
 =3D (*reg & inst.reg_preserve_mask) | mmio.value;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vcpu_skip_emulate=
d_instruction(inst.inst_len);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> diff --git a/inmates/tests/x86/mmio-access-32.c
>> b/inmates/tests/x86/mmio-access-32.c
>> index 2f47f211..be1d470f 100644
>> --- a/inmates/tests/x86/mmio-access-32.c
>> +++ b/inmates/tests/x86/mmio-access-32.c
>> @@ -47,9 +47,13 @@ void inmate_main(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32, pattern);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8a), 8-bit data *=
/
>> -=C2=A0=C2=A0=C2=A0 asm volatile("movb (%%ebx), %%al"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) : "a" (0), =
"b" (mmio_reg));
>> -=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32, (u8)pattern);
>> +=C2=A0=C2=A0=C2=A0 asm volatile("movb (%%eax), %%al"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL((u8)reg32, (u8)pattern);
>=20
> Hmm, that test looks redundant to the following one. Same for other
> double-checks in this patch and patch 3. Or am I missing something?

If the implementation of the simulator is correct, then those tests are
redundant.

Think of cases where the first check passes, and the second check fails.
Was helpful during development.

  Ralf

>=20
>> +=C2=A0=C2=A0=C2=A0 /* %al should contain 0x44, while higher bits still =
hold the rest of
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * mmio_reg. Test this. */
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOVZXB (0f b6), 32-bit data, 32=
-bit address */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%ebx), %%eax"
>> diff --git a/inmates/tests/x86/mmio-access.c
>> b/inmates/tests/x86/mmio-access.c
>> index 0e6a56b1..a9d2fcaf 100644
>> --- a/inmates/tests/x86/mmio-access.c
>> +++ b/inmates/tests/x86/mmio-access.c
>> @@ -67,9 +67,13 @@ void inmate_main(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64, (u32)pattern);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8a), 8-bit data *=
/
>> -=C2=A0=C2=A0=C2=A0 asm volatile("movb (%%rbx), %%al"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (0), =
"b" (mmio_reg));
>> -=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64, (u8)pattern);
>> +=C2=A0=C2=A0=C2=A0 asm volatile("movb (%%rax), %%al"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL((u8)reg64, (u8)pattern);
>> +=C2=A0=C2=A0=C2=A0 /* %al should contain 0x88, while high bits should s=
till hold the
>> rest
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * of mmio_reg */
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOVZXB (0f b6), to 64-bit, mod=
=3D0, reg=3D0, rm=3D3 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%rbx), %%rax"
>>
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/31132492-0d6d-5e61-ec83-9536d9d38887%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
