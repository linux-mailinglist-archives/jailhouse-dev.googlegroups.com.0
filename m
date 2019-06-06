Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYHM4LTQKGQEOOPQFHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 7798836C7A
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2019 08:44:49 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id d11sf253896lji.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Jun 2019 23:44:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559803489; cv=pass;
        d=google.com; s=arc-20160816;
        b=iJEO499/+n+vv1SrqN6RAuFnKaR3v4qcG4LbN4lqkXF4ZbMuKf40UHLy9enHYihvaE
         vVI03K6FLEGTfoFJW2LJI+07UR/U5mPAOFWFegp3CE62YtoGrHrRvxrttlmYdp9LiV4C
         LCkOpB216n+xpNMAcNKB8c3llwxNNk/ZjPaFjpW7it2PhluYsNNK6GO/iuicOLpVdh8J
         aeqWNR5cJtTe+VT11jDsHj5+v6drqYbWQz1WYvNgOGuuUvsQuqtly1CLURxcBSk1qvRg
         zZkuq4GmcZy0Q8Hyvz74lqCcE9P/JE/BefWnKP7FzvJXOp0t03JkS0uPuT/GPUNIwJIn
         RQpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=WWt5bhdnLRWo/GqwgBw34cAuOQgNdasUObDNExWgPxM=;
        b=wRBHteqgjAHHdwGSKZx1Psl4l5Zi4YUj5P8AM4kkD77Zqv86spcZTYvl27meliyC+6
         sCkcle952RUIzzTEv8yEoI4UIRsPCo28K4pwqLkh/jq6Ioh8YrvkfoOw+H01WstLBiUS
         s1m/9Gm3evPTHKNSpKs1qdmpFMMLwuA9u01w3GsAVDS8Y+bFrhpmFByIq3av26QF5qnL
         +UtOy5e2ZLamct6zJwnmNqBB9AKJ6Q2LHVyx+oh4t99032OOOq2K52mhu4XhOuocSFhv
         ewit/4NiUCE/qnx4ATV2/3cbp4vYQzr/14mKIhQPlpif1TrIApMc55fVxEJTdD+Ku1pg
         vvAg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WWt5bhdnLRWo/GqwgBw34cAuOQgNdasUObDNExWgPxM=;
        b=nXOHKNEg9vZO/4BnzuPICJiNg296PzF0UxFOapf5E/j0fB7wlJpFkmEewYa5iwA2ez
         6xPlPxM9qitVp0ZMH15N9Yqun0vafNNs9q+J8Zy6YnPg/6OowlJChvtcgZtF8P9y5a8Y
         tUEuopHOU16tZcComRljm7+FbXw16NmTFhJUwQfk4oF6glywL0rx4A0+qQGUzgRaXoCH
         Bd1+y/v81Zc3Rx55UZbFYnSSzEAyrFzslf1ZFvmIZeHfRLP2qrDH224It3EMgQGRnYbE
         9RJix4fTSM12PKZg3pJI+W90dKI9JU3rO5E9IFeRottjTBrXdOXaGkx5JcfM+f6fNC9g
         yxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WWt5bhdnLRWo/GqwgBw34cAuOQgNdasUObDNExWgPxM=;
        b=qcwAUULaA56D1evONMbzjk2JEanDI/RkSrkUp4y09GiKFWPpOdDR7KrCuQRuOya3I7
         vkGmbjGbOQOFeqbOct5nsOwBlsN824T3pnDq1RqDpVu+vDd+cM0QLwyzNW3swjSn3Rjw
         wjI6SZ6uWgjRNRbCtBfhZAxePKXbiT2lXAhEVTi6Hyu5lMXqlQywCeTjUrsmymRXAnLQ
         RBtn6PzhVooj9YViDKDkwJjrXu3t4yO+jV2S4ln8lO6PIRFfWK2FF5VYgbjyjjnOePEQ
         /I4beGCssxaIlsitbVV7pq6usm+lly3B8sodcS019DWmg3GZnGatwRraQBxuL/365q2G
         gySA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU4bbaREH1HTMQaMIXvz4J8m/nvFa75A2m7xDrZRQmIsWXtrDT9
	a/DxkuNDjJ1AEV5U/qZMpAU=
X-Google-Smtp-Source: APXvYqzc+Z4CJQqaUWNGVsPeS71z0uLorCRpRcLtRgLP6IVfzrnYhY16Cf9invR8mvN2nk4rbXsHiA==
X-Received: by 2002:a2e:8796:: with SMTP id n22mr23424658lji.75.1559803488999;
        Wed, 05 Jun 2019 23:44:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6109:: with SMTP id v9ls514867ljb.2.gmail; Wed, 05 Jun
 2019 23:44:48 -0700 (PDT)
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr14441650lje.46.1559803488158;
        Wed, 05 Jun 2019 23:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559803488; cv=none;
        d=google.com; s=arc-20160816;
        b=RiT0beOxUdBOatBUL0hXkAjZfxsYCx9iQ9iCsguwNB9s2p9mReBwdq9rQ5pWrdVGA9
         Gs9G84hEnSl0m198H/cKovQqXODDHRtwGlzVvuXJHRQNVDEKlLhDO3ERSXpjiOErOQHW
         1NJIUvRHFoII4R3M5La/PUU3IpdBqkVdZoLqKgzVWsP657E/MNJJ+L+v+9MHNgAE9/vK
         N1yu2kMAA3qXZqNJqVTE2or2Qdk/2mwLuC6pgrNwNwhZCwzQpvRG9alXXUA0pLRdvQCV
         jxXVwqm3ct2mt/wSNeZME3xGqJLOkxIZVOlXBu28czKUuFD8ndoWFnY4wS0raBqQwmgM
         5IJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=0wvHvEte+nupqzEXvfjimrgkFHzNenBNH9TlvU/zyrQ=;
        b=baLxIAG/xkepZjqWnDRNDm4XQ1742pptUNslWgMTgjoP3pgf/nVSx5XbIR9yS0R4Nb
         tfOnerz3SitwEQCl7pny8FSdZkEA1FDLuCmO8pLUaPLLgfOC45zlSoO+n59cflal4r4k
         j8Xz1LAFnHtLC3sEgxMjX7rlK4MhFng2XbBzetCiMhCj2d8eY0Fq8CeBlUyahfzhXoSe
         oErYIuT3rLgUip2z3eJu9IDVcr2yLZI/GoK5YtaD0HhYM1XuLXBtV6cw0/cw5ap3wnMO
         fFSbrivEnrkpaIQf+M/7HckVY8YIyXEIIpZZl08NLs33wwcnMHK1fdy7tFUmUYemH7V2
         N9JA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a20si56361ljb.3.2019.06.05.23.44.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 23:44:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x566ilsW008320
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jun 2019 08:44:47 +0200
Received: from [167.87.10.205] ([167.87.10.205])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x566ikpB017034;
	Thu, 6 Jun 2019 08:44:47 +0200
Subject: Re: [PATCH] x86: mmio: fix accidental clears of bits in registers
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190605163946.25316-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <685fa0fa-6c99-82f0-2e15-5299e9866e16@siemens.com>
Date: Thu, 6 Jun 2019 08:44:46 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190605163946.25316-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
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

On 05.06.19 18:39, Ralf Ramsauer wrote:
> We trap certain MMIO accesses and need to emulate their access.
> 
> On x86, a 32-bit read will clear bits 32-63 of a register.
> 
> Inconsistently, on x86, 16-bit and 8-bit reads must not clear high bits.
> Jailhouse erroneously cleared those bits. Prevent this by applying a
> preserved mask that keeps bits alive.
> 
> Add tests that check correct behaviour.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
> 
> This patch is not related to "x86: mmio: add support for 0x66 operand
> prefix", it's just a bug that I stumbled over while working on a v2 of
> the other patch.
> 
> The calculation of the preserve mask dynamically creates a bitmask. At
> the moment, only 8 bit support would be required, but it already
> supports 16 bit support, as that'll be introduced in the 0x66 operand
> prefix override support patch.
> 
>   hypervisor/arch/x86/include/asm/mmio.h |  5 +++++
>   hypervisor/arch/x86/mmio.c             |  7 ++++++-
>   hypervisor/arch/x86/vcpu.c             |  7 +++++--
>   inmates/tests/x86/mmio-access-32.c     | 10 +++++++---
>   inmates/tests/x86/mmio-access.c        | 10 +++++++---
>   5 files changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/include/asm/mmio.h b/hypervisor/arch/x86/include/asm/mmio.h
> index 756c84a8..e6c4e4dc 100644
> --- a/hypervisor/arch/x86/include/asm/mmio.h
> +++ b/hypervisor/arch/x86/include/asm/mmio.h
> @@ -30,6 +30,11 @@ struct mmio_instruction {
>   	/** Output value, already copied either from a register or
>            * from an immediate value */
>   	unsigned long out_val;
> +	/** A read must not clear the upper bits of registers, if the access
> +	 * width is smaller than 32 bit. This mask describes the bits that have
> +	 * to be preserved.
> +	 */
> +	unsigned long read_preserve_mask;

reg_preserve_mask? Makes it clearer where it applies (not on the MMIO access).

>   };
>   
>   /**
> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
> index b234bd79..e8bf32bc 100644
> --- a/hypervisor/arch/x86/mmio.c
> +++ b/hypervisor/arch/x86/mmio.c
> @@ -85,7 +85,8 @@ x86_mmio_parse(const struct guest_paging_structures *pg_structs, bool is_write)
>   	struct parse_context ctx = { .remaining = X86_MAX_INST_LEN,
>   				     .count = 1 };
>   	union registers *guest_regs = &this_cpu_data()->guest_regs;
> -	struct mmio_instruction inst = { .inst_len = 0 };
> +	struct mmio_instruction inst = { .inst_len = 0,
> +					 .read_preserve_mask = 0, };

I think we can just do "{ 0 }" here which states that the whole structure is 
0-initialized.

>   	u64 pc = vcpu_vendor_get_rip();
>   	unsigned int n, skip_len = 0;
>   	bool has_immediate = false;
> @@ -168,6 +169,10 @@ restart:
>   
>   	op[2].raw = *ctx.inst;
>   
> +	if (!does_write && inst.access_size < 4)
> +		inst.read_preserve_mask =
> +			~((1UL << (inst.access_size * 8)) - 1);

BYTE_MASK(inst.access_size)

> +
>   	/* ensure that we are actually talking about mov imm,<mem> */
>   	if (op[0].raw == X86_OP_MOV_IMMEDIATE_TO_MEM && op[2].modrm.reg != 0)
>   		goto error_unsupported;
> diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
> index 5a557d0b..3f6a13f1 100644
> --- a/hypervisor/arch/x86/vcpu.c
> +++ b/hypervisor/arch/x86/vcpu.c
> @@ -231,6 +231,7 @@ bool vcpu_handle_mmio_access(void)
>   	struct mmio_access mmio = {.size = 0};
>   	struct vcpu_mmio_intercept intercept;
>   	struct mmio_instruction inst;
> +	unsigned long *value;

Maybe rather "reg"?

>   
>   	vcpu_vendor_get_mmio_intercept(&intercept);
>   
> @@ -249,8 +250,10 @@ bool vcpu_handle_mmio_access(void)
>   
>   	result = mmio_handle_access(&mmio);
>   	if (result == MMIO_HANDLED) {
> -		if (!mmio.is_write)
> -			guest_regs->by_index[inst.in_reg_num] = mmio.value;
> +		if (!mmio.is_write) {
> +			value = &guest_regs->by_index[inst.in_reg_num];
> +			*value = (*value & inst.read_preserve_mask) | mmio.value;
> +		}
>   		vcpu_skip_emulated_instruction(inst.inst_len);
>   		return true;
>   	}
> diff --git a/inmates/tests/x86/mmio-access-32.c b/inmates/tests/x86/mmio-access-32.c
> index 2f47f211..be1d470f 100644
> --- a/inmates/tests/x86/mmio-access-32.c
> +++ b/inmates/tests/x86/mmio-access-32.c
> @@ -47,9 +47,13 @@ void inmate_main(void)
>   	EXPECT_EQUAL(reg32, pattern);
>   
>   	/* MOV_FROM_MEM (8a), 8-bit data */
> -	asm volatile("movb (%%ebx), %%al"
> -		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
> -	EXPECT_EQUAL(reg32, (u8)pattern);
> +	asm volatile("movb (%%eax), %%al"
> +		: "=a" (reg32) : "a" (mmio_reg));
> +	EXPECT_EQUAL((u8)reg32, (u8)pattern);
> +	/* %al should contain 0x44, while higher bits still hold the rest of
> +	 * mmio_reg. Test this. */
> +	EXPECT_EQUAL(reg32,
> +		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>   
>   	/* MOVZXB (0f b6), 32-bit data, 32-bit address */
>   	asm volatile("movzxb (%%ebx), %%eax"
> diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
> index 0e6a56b1..a9d2fcaf 100644
> --- a/inmates/tests/x86/mmio-access.c
> +++ b/inmates/tests/x86/mmio-access.c
> @@ -67,9 +67,13 @@ void inmate_main(void)
>   	EXPECT_EQUAL(reg64, (u32)pattern);
>   
>   	/* MOV_FROM_MEM (8a), 8-bit data */
> -	asm volatile("movb (%%rbx), %%al"
> -		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
> -	EXPECT_EQUAL(reg64, (u8)pattern);
> +	asm volatile("movb (%%rax), %%al"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL((u8)reg64, (u8)pattern);
> +	/* %al should contain 0x88, while high bits should still hold the rest
> +	 * of mmio_reg */
> +	EXPECT_EQUAL(reg64,
> +		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>   
>   	/* MOVZXB (0f b6), to 64-bit, mod=0, reg=0, rm=3 */
>   	asm volatile("movzxb (%%rbx), %%rax"
> 

Thanks for sorting that out - I though I see my plan "let's make this 
instruction parser as dumb as imaginable" floating down the gutter...

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/685fa0fa-6c99-82f0-2e15-5299e9866e16%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
